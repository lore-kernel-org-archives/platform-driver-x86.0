From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Tue, 10 Oct 2017 08:41:36 -0700
Message-ID: <20171010154136.GB5020@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:26251 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751347AbdJJPn5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 11:43:57 -0400
Content-Disposition: inline
In-Reply-To: <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Tue, Oct 10, 2017 at 05:32:53PM +0300, Jarkko Sakkinen wrote:
> diff --git a/drivers/platform/x86/intel_sgx/sgx_page_cache.c b/drivers/platform/x86/intel_sgx/sgx_page_cache.c
> new file mode 100644
> index 000000000000..1089b563e07b
> --- /dev/null
> +++ b/drivers/platform/x86/intel_sgx/sgx_page_cache.c
>
> +/**
> + * sgx_alloc_page - allocate an EPC page
> + * @flags:	allocation flags
> + *
> + * Try to grab a page from the free EPC page list. If there is a free page
> + * available, it is returned to the caller. If called with SGX_ALLOC_ATOMIC,
> + * the function will return immediately if the list is empty. Otherwise, it
> + * will swap pages up until there is a free page available. Before returning
> + * the low watermark is checked and ksgxswapd is waken up if we are below it.
> + *
> + * Return: an EPC page or a system error code
> + */
> +struct sgx_epc_page *sgx_alloc_page(unsigned int flags)
> +{
> +	struct sgx_epc_page *entry;
> +
> +	for ( ; ; ) {
> +		entry = sgx_alloc_page_fast();
> +		if (entry)
> +			break;
> +
> +		/* We need at minimum two pages for the #PF handler. */
> +		if (atomic_read(&sgx_va_pages_cnt) >
> +		    (sgx_nr_total_epc_pages - 2))
> +			return ERR_PTR(-ENOMEM);
> +
> +		if (flags & SGX_ALLOC_ATOMIC) {
> +			entry = ERR_PTR(-EBUSY);
> +			break;
> +		}
> +
> +		if (signal_pending(current)) {
> +			entry = ERR_PTR(-ERESTARTSYS);
> +			break;
> +		}
> +
> +		sgx_swap_pages(SGX_NR_SWAP_CLUSTER_MAX);
> +		schedule();
> +	}
> +
> +	if (sgx_nr_free_pages < sgx_nr_low_pages)
> +		wake_up(&ksgxswapd_waitq);
> +
> +	return entry;
> +}
> +EXPORT_SYMBOL(sgx_alloc_page);

I think it makes sense to remove the exports from sgx_page_cache.c
for the initial upstreaming given that the only consumer is the
pre-release/out-of-tree KVM module, which generally requires
recompiling the entire kernel anyways.
