From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v5 08/11] intel_sgx: in-kernel launch enclave
Date: Wed, 15 Nov 2017 12:50:06 +0100
Message-ID: <20171115115006.p2wkvfuojwgg26br@hirez.programming.kicks-ass.net>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 13, 2017 at 09:45:25PM +0200, Jarkko Sakkinen wrote:
> TinyCrypt (https://github.com/01org/tinycrypt) is used as AES
> implementation, which is not timing resistant. Eventually this needs to
> be replaced with AES-NI based implementation that could be either

> - re-use existing AES-NI code in the kernel

This. That is an absolute must. We're not going to merge custom AES
implementations.
