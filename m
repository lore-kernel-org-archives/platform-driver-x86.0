From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Thu, 15 Nov 2018 17:37:27 -0800
Message-ID: <6fe0687b-70c9-9e7d-6f05-8963f18f0636@infradead.org>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org
Cc: dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 11/15/18 5:01 PM, Jarkko Sakkinen wrote:
> Intel Software Guard eXtensions (SGX) is a set of CPU instructions that
> can be used by applications to set aside private regions of code and
> data. The code outside the enclave is disallowed to access the memory
> inside the enclave by the CPU access control.
> 
> SGX driver provides a ioctl API for loading and initializing enclaves.
> Address range for enclaves is reserved with mmap() and they are
> destroyed with munmap(). Enclave construction, measurement and
> initialization is done with the provided the ioctl API.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Co-developed-by: Serge Ayoun <serge.ayoun@intel.com>
> Signed-off-by: Serge Ayoun <serge.ayoun@intel.com>
> Co-developed-by: Shay Katz-zamir <shay.katz-zamir@intel.com>
> Signed-off-by: Shay Katz-zamir <shay.katz-zamir@intel.com>
> Co-developed-by: Suresh Siddha <suresh.b.siddha@intel.com>
> Signed-off-by: Suresh Siddha <suresh.b.siddha@intel.com>
> ---

> diff --git a/arch/x86/include/uapi/asm/sgx.h b/arch/x86/include/uapi/asm/sgx.h
> new file mode 100644
> index 000000000000..aadf9c76e360
> --- /dev/null
> +++ b/arch/x86/include/uapi/asm/sgx.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/**
> + * Copyright(c) 2016-18 Intel Corporation.
> + */
> +#ifndef _UAPI_ASM_X86_SGX_H
> +#define _UAPI_ASM_X86_SGX_H
> +
> +#include <linux/types.h>
> +#include <linux/ioctl.h>
> +
> +#define SGX_MAGIC 0xA4
> +
> +#define SGX_IOC_ENCLAVE_CREATE \
> +	_IOW(SGX_MAGIC, 0x00, struct sgx_enclave_create)
> +#define SGX_IOC_ENCLAVE_ADD_PAGE \
> +	_IOW(SGX_MAGIC, 0x01, struct sgx_enclave_add_page)
> +#define SGX_IOC_ENCLAVE_INIT \
> +	_IOW(SGX_MAGIC, 0x02, struct sgx_enclave_init)
> +
> +/* IOCTL return values */
> +#define SGX_POWER_LOST_ENCLAVE		0x40000000


Hi,
The ioctl magic number should be documented in
Documentation/ioctl/ioctl-number.txt.

ta.
-- 
~Randy
