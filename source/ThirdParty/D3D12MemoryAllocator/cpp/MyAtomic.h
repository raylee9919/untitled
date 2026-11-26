// Copyright Seong Woo Lee. All Rights Reserved.

#pragma once

#include <intrin.h>
#include <stdint.h>

struct MyAtomicU32 {
    volatile long v;

    MyAtomicU32(uint32_t x = 0) : v((long)x) {}
    MyAtomicU32(const MyAtomicU32&) = delete;
    MyAtomicU32& operator=(const MyAtomicU32&) = delete;

    uint32_t load() const { return (uint32_t)_InterlockedCompareExchange((volatile long*)&v, 0, 0); }
    void store(uint32_t x) { _InterlockedExchange(&v, (long)x); }
    uint32_t exchange(uint32_t x) { return (uint32_t)_InterlockedExchange(&v, (long)x); }

    uint32_t fetch_add(uint32_t x) { return (uint32_t)_InterlockedExchangeAdd(&v, (long)x); }
    uint32_t fetch_sub(uint32_t x) { return (uint32_t)_InterlockedExchangeAdd(&v, -(long)x); }

    bool compare_exchange_strong(uint32_t& expected, uint32_t desired) {
        long prev = _InterlockedCompareExchange(&v, (long)desired, (long)expected);
        if ((uint32_t)prev == expected) return true;
        expected = (uint32_t)prev; return false;
    }
    bool compare_exchange_weak(uint32_t& e, uint32_t d) { return compare_exchange_strong(e, d); }

    // Operator forms, since the library may use ++x, x += n, x = 0, and so on
    uint32_t operator++()    { return (uint32_t)_InterlockedIncrement(&v); }
    uint32_t operator--()    { return (uint32_t)_InterlockedDecrement(&v); }
    uint32_t operator++(int) { return fetch_add(1); }
    uint32_t operator--(int) { return fetch_sub(1); }
    uint32_t operator+=(uint32_t x) { return fetch_add(x) + x; }
    uint32_t operator-=(uint32_t x) { return fetch_sub(x) - x; }
    uint32_t operator=(uint32_t x)  { store(x); return x; }
    operator uint32_t() const { return load(); }
};

struct MyAtomicU64 {
    alignas(8) volatile __int64 v;

    MyAtomicU64(uint64_t x = 0) : v((__int64)x) {}
    MyAtomicU64(const MyAtomicU64&) = delete;
    MyAtomicU64& operator=(const MyAtomicU64&) = delete;

    uint64_t load() const { return (uint64_t)_InterlockedCompareExchange64((volatile __int64*)&v, 0, 0); }
    void store(uint64_t x) { _InterlockedExchange64(&v, (__int64)x); }
    uint64_t exchange(uint64_t x) { return (uint64_t)_InterlockedExchange64(&v, (__int64)x); }

    uint64_t fetch_add(uint64_t x) { return (uint64_t)_InterlockedExchangeAdd64(&v, (__int64)x); }
    uint64_t fetch_sub(uint64_t x) { return (uint64_t)_InterlockedExchangeAdd64(&v, -(__int64)x); }

    bool compare_exchange_strong(uint64_t& expected, uint64_t desired) {
        __int64 prev = _InterlockedCompareExchange64(&v, (__int64)desired, (__int64)expected);
        if ((uint64_t)prev == expected) return true;
        expected = (uint64_t)prev; return false;
    }
    bool compare_exchange_weak(uint64_t& e, uint64_t d) { return compare_exchange_strong(e, d); }

    uint64_t operator++()    { return (uint64_t)_InterlockedIncrement64(&v); }
    uint64_t operator--()    { return (uint64_t)_InterlockedDecrement64(&v); }
    uint64_t operator++(int) { return fetch_add(1); }
    uint64_t operator--(int) { return fetch_sub(1); }
    uint64_t operator+=(uint64_t x) { return fetch_add(x) + x; }
    uint64_t operator-=(uint64_t x) { return fetch_sub(x) - x; }
    uint64_t operator=(uint64_t x)  { store(x); return x; }
    operator uint64_t() const { return load(); }
};
