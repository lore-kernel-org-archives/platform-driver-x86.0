From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v9 4/7] intel_sgx: driver for Intel Software Guard Extensions
Date: Sat, 16 Dec 2017 19:31:33 +0100
Message-ID: <CAOFm3uERctWVWYgGRFqsWgwL9Tq=8dmXHYEOEDHx+=ojHmA9Ug@mail.gmail.com>
References: <20171216162200.20243-1-jarkko.sakkinen@linux.intel.com> <20171216162200.20243-5-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:35445 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757085AbdLPScP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Dec 2017 13:32:15 -0500
Received: by mail-wm0-f41.google.com with SMTP id f9so23037491wmh.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Dec 2017 10:32:15 -0800 (PST)
In-Reply-To: <20171216162200.20243-5-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Sat, Dec 16, 2017 at 5:19 PM, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
> Intel SGX is a set of CPU instructions that can be used by applications
> to set aside private regions of code and data.  The code outside the
> enclave is disallowed to access the memory inside the enclave by the CPU
> access control.

<snip>

> --- /dev/null
> +++ b/arch/x86/include/asm/sgx.h
> @@ -0,0 +1,233 @@
> +/*
> + * This file is provided under a dual BSD/GPLv2 license.  When using or
> + * redistributing this file, you may do so under either license.
> + *
> + * GPL LICENSE SUMMARY
> + *
> + * Copyright(c) 2016-2017 Intel Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of version 2 of the GNU General Public License as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * Contact Information:
> + * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> + * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
> + *
> + * BSD LICENSE
> + *
> + * Copyright(c) 2016-2017 Intel Corporation.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + *
> + *   * Redistributions of source code must retain the above copyright
> + *     notice, this list of conditions and the following disclaimer.
> + *   * Redistributions in binary form must reproduce the above copyright
> + *     notice, this list of conditions and the following disclaimer in
> + *     the documentation and/or other materials provided with the
> + *     distribution.
> + *   * Neither the name of Intel Corporation nor the names of its
> + *     contributors may be used to endorse or promote products derived
> + *     from this software without specific prior written permission.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> + * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> + * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> + * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> + * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> + * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> + * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + *
> + * Authors:
> + *
> + * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> + * Suresh Siddha <suresh.b.siddha@intel.com>
> + */

Please consider using the new SPDX tags per Thomas doc patches [1],
and already adopted by other Intel contributors
Thanks!
[1] https://lkml.org/lkml/2017/12/4/934
-- 
Cordially
Philippe Ombredanne, your friendly kernel licensing scruffy
