From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v13 06/13] x86/sgx: Detect Intel SGX
Date: Mon, 3 Sep 2018 17:26:43 +0300
Message-ID: <CAHp75VeN7QoftgkqP-L6JRZi=MRpQkVioBLP7VDLwH=rpnEp_w@mail.gmail.com>
References: <20180827185507.17087-1-jarkko.sakkinen@linux.intel.com> <20180827185507.17087-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827185507.17087-7-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, linux-sgx@vger.kernel.org, suresh.b.siddha@intel.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, serge.ayoun@intel.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Borislav Petkov <bp@suse.de>, Reinette Chatre <reinette.chatre@intel.com>, Andi Kleen <ak@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Aug 27, 2018 at 9:57 PM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> From: Sean Christopherson <sean.j.christopherson@intel.com>
>
> Intel(R) SGX is a set of CPU instructions that can be used by applications
> to set aside private regions of code and data. The code outside the enclave
> is disallowed to access the memory inside the enclave by the CPU access
> control.
>
> Add a check for SGX to arch/x86 and a new config option, INTEL_SGX_CORE.
> Expose a boolean variable 'sgx_enabled' to query whether or not the SGX
> support is available.

> +       prompt "Intel SGX core functionality"
> +       def_bool n

Default 'default' is 'n'. Perhaps changing prompt to bool will make it
one line less.

> +#include <asm/sgx.h>
> +#include <asm/sgx_pr.h>

Don't we put linux/* followed by asm/* ?

> +#include <linux/freezer.h>
> +#include <linux/highmem.h>
> +#include <linux/kthread.h>
> +#include <linux/ratelimit.h>
> +#include <linux/sched/signal.h>
> +#include <linux/slab.h>

-- 
With Best Regards,
Andy Shevchenko
