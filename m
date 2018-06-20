From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page
 cache
Date: Wed, 20 Jun 2018 08:26:05 -0700
Message-ID: <1529508365.9779.63.camel@intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2018-06-08 at 19:09 +0200, Jarkko Sakkinen wrote:
> SGX has a set of data structures to maintain information about the enclaves
> and their security properties. BIOS reserves a fixed size region of
> physical memory for these structures by setting Processor Reserved Memory
> Range Registers (PRMRR). This memory area is called Enclave Page Cache
> (EPC).
> 
> This commit implements the basic routines to allocate and free pages from
> different EPC banks. There is also a swapper thread ksgxswapd for EPC pages
> that gets woken up by sgx_alloc_page() when we run below the low watermark.
> The swapper thread continues swapping pages up until it reaches the high
> watermark.
> 
> Each subsystem that uses SGX must provide a set of callbacks for EPC
> pages that are used to reclaim, block and write an EPC page. Kernel
> takes the responsibility of maintaining LRU cache for them.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/x86/include/asm/sgx.h      |  67 +++++
>  arch/x86/include/asm/sgx_arch.h | 224 ++++++++++++++++
>  arch/x86/kernel/cpu/intel_sgx.c | 443 +++++++++++++++++++++++++++++++-
>  3 files changed, 732 insertions(+), 2 deletions(-)
>  create mode 100644 arch/x86/include/asm/sgx_arch.h

...

> diff --git a/arch/x86/kernel/cpu/intel_sgx.c b/arch/x86/kernel/cpu/intel_sgx.c
> index db6b315334f4..ae2b5c5b455f 100644
> --- a/arch/x86/kernel/cpu/intel_sgx.c
> +++ b/arch/x86/kernel/cpu/intel_sgx.c
> @@ -14,14 +14,439 @@
>  #include <linux/freezer.h>
>  #include <linux/highmem.h>
>  #include <linux/kthread.h>
> +#include <linux/pagemap.h>
>  #include <linux/ratelimit.h>
>  #include <linux/sched/signal.h>
> +#include <linux/shmem_fs.h>
>  #include <linux/slab.h>
>  
> +#define SGX_NR_TO_SCAN	16
> +#define SGX_NR_LOW_PAGES 32
> +#define SGX_NR_HIGH_PAGES 64
> +
>  bool sgx_enabled __ro_after_init = false;
>  EXPORT_SYMBOL(sgx_enabled);
> +bool sgx_lc_enabled __ro_after_init;
> +EXPORT_SYMBOL(sgx_lc_enabled);
> +atomic_t sgx_nr_free_pages = ATOMIC_INIT(0);
> +EXPORT_SYMBOL(sgx_nr_free_pages);
> +struct sgx_epc_bank sgx_epc_banks[SGX_MAX_EPC_BANKS];
> +EXPORT_SYMBOL(sgx_epc_banks);
> +int sgx_nr_epc_banks;
> +EXPORT_SYMBOL(sgx_nr_epc_banks);
> +LIST_HEAD(sgx_active_page_list);
> +EXPORT_SYMBOL(sgx_active_page_list);
> +DEFINE_SPINLOCK(sgx_active_page_list_lock);
> +EXPORT_SYMBOL(sgx_active_page_list_lock);

I don't think we should be exporting anything other than sgx_enabled
and sgx_lc_enabled.  The only external use of a symbol that can't be
trivially (re)moved is in the driver's sgx_pm_suspend() in sgx_main.c,
which uses the sgx_active_page_list to invalidate enclaves.  And that
behavior seems unsafe, e.g. an enclave could theoretically have zero
pages on the active list and so could be missed in the suspend flow.

> +static struct task_struct *ksgxswapd_tsk;
> +static DECLARE_WAIT_QUEUE_HEAD(ksgxswapd_waitq);
