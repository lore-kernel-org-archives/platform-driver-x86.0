From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v6 06/11] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Thu, 30 Nov 2017 09:32:01 -0800
Message-ID: <20171130173200.GA11190@linux.intel.com>
References: <20171125193132.24321-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171125193132.24321-7-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Nov 25, 2017 at 09:29:24PM +0200, Jarkko Sakkinen wrote:
> +static void *sgx_try_alloc_page(void)
> +{
> +       struct sgx_epc_bank *bank;
> +       void *page = NULL;
> +       int i;
> +
> +       for (i = 0; i < sgx_nr_epc_banks; i++) {
> +               bank = &sgx_epc_banks[i];
> +
> +               down_write(&bank->lock);

Is a R/W semaphore actually preferable to a spinlock?  Concurrent
free calls don't seem that interesting/beneficial because freeing
an enclave's pages isn't multiplexed across multiple CPUs, unlike
the allocation of EPC pages.

As a whole, I'm not a fan of packing the EPC page pointers into an
array rather than encapsulating them in a struct+list.  The primary
benefit I see for the array approach is that it saves ~8 bytes per
free EPC page, but at a cost of increased memory usage for in-use
pages and severely restricting the ability to enhance/modify how
EPC pages are tracked, reclaimed, etc...

The main issue is that the array approach relies on the caller to
handle reclaim.  This effectively makes it impossible to reclaim
pages from multiple processes, requires other consumers e.g. KVM
to implement their own reclaim logic and kthread, and prevents
cgroup accounting because the cgroup can't initiate reclaim.

> +
> +               if (atomic_read(&bank->free_cnt))
> +                       page = bank->pages[atomic_dec_return(&bank->free_cnt)];
> +
> +               up_write(&bank->lock);
> +
> +               if (page)
> +                       break;
> +       }
> +
> +       if (page)
> +               atomic_dec(&sgx_nr_free_pages);
> +
> +       return page;
> +}
 
