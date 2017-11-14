From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 06/11] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Tue, 14 Nov 2017 09:55:06 -0800
Message-ID: <1510682106.3313.24.camel@intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
         <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:27538 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754420AbdKNR6u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 12:58:50 -0500
In-Reply-To: <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, intel-sgx-kernel-dev@lists.01.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, 2017-11-13 at 21:45 +0200, Jarkko Sakkinen wrote:
> Intel SGX is a set of CPU instructions that can be used by applications
> to set aside private regions of code and data.  The code outside the
> enclave is disallowed to access the memory inside the enclave by the CPU
> access control.
> 
> SGX driver provides a ioctl API for loading and initializing enclaves.
> Address range for enclaves is reserved with mmap() and they are
> destroyed with munmap(). Enclave construction, measurement and
> initialization is done with the provided the ioctl API.
> 
> The driver implements also a swapper thread ksgxswapd for EPC pages
> backed by a private shmem file. Currently it has a limitation of not
> swapping VA pages but there is nothing preventing to implement it later
> on. Now it was scoped out in order to keep the implementation simple.
> 
> The parameter struct for SGX_IOC_ENCLAVE_INIT does not contain a
> parameter to supply a launch token. Generating and using tokens is best
> to be kept in the control of the kernel because it has direct binding to
> the IA32_SGXPUBKEYHASHx MSRs (a core must have MSRs set to the same
> value as the signer of token).
> 
> By giving user space any role in the launch process is a risk for
> introducing bottlenecks as kernel must exhibit behavior that user space
> launch daemon depends on

What do you mean by bottlenecks?  Assuming you're referring to performance
bottlenecks, this statement is flat out false.  Moving the launch enclave into
the kernel introduces performance bottlenecks, e.g. as implemented, a single LE
services all EINIT requests and is protected by a mutex.  That is the very
definition of a bottleneck.

The kernel will never be as performant as userspace when it comes to EINIT
tokens because userspace can make informed decisions based on its usage model,
e.g. number of LEs (or LE threads) to spawn, LE and token lifecycles, LE and
token thread safety, etc...

> , properietary risks (closed launch daemons on
> closed platforms) 

This justifies the need for the kernel to be able to generate launch tokens, but
I don't think allowing userspace to also provide its own tokens adds any
proprietary risks.

> and stability risks as there would be division of
> semantics between user space and kernel.
> 

What exactly are the stability risks?  The token itself is architecturally
defined and isn't fundamentally different than e.g. the sigstruct.  Writing the
LE hash MSRs as needed, e.g. for userspace LEs, isn't difficult.

> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
