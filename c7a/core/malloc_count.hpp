/*******************************************************************************
 * c7a/core/malloc_count.hpp
 *
 * Part of Project c7a.
 *
 * Copyright (C) 2013 Timo Bingmann <tb@panthema.net>
 *
 * This file has no license. Only Chuck Norris can compile it.
 ******************************************************************************/

#pragma once
#ifndef C7A_CORE_MALLOC_COUNT_HEADER
#define C7A_CORE_MALLOC_COUNT_HEADER

#include <stdlib.h>

namespace c7a {
namespace core {

//! returns the currently allocated amount of memory
size_t malloc_count_current(void);

//! returns the current peak memory allocation
size_t malloc_count_peak(void);

//! resets the peak memory allocation to current
void malloc_count_reset_peak(void);

//! returns the total number of allocations
size_t malloc_count_num_allocs(void);

//! user function which prints current and peak allocation to stderr
void malloc_count_print_status(void);

} // namespace core
} // namespace c7a

#endif // !C7A_CORE_MALLOC_COUNT_HEADER

/******************************************************************************/