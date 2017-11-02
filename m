From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Thu, 02 Nov 2017 13:10:29 -0700
Message-ID: <1509653429.17230.20.camel@intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
         <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:19941 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934342AbdKBUNQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 16:13:16 -0400
In-Reply-To: <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org

On Tue, 2017-10-10 at 17:32 +0300, Jarkko Sakkinen wrote:
> +static int sgx_dev_init(struct device *parent, bool locked_msrs)
> +{
> +	struct sgx_context *sgx_dev;
> +	unsigned int eax, ebx, ecx, edx;
> +	unsigned long pa;
> +	unsigned long size;
> +	int ret;
> +	int i;
> +
> +	pr_info("intel_sgx: " DRV_DESCRIPTION " v" DRV_VERSION "\n");
> +
> +	sgx_dev = sgxm_ctx_alloc(parent);
> +
> +	sgx_locked_msrs = locked_msrs;
> +
> +	cpuid_count(SGX_CPUID, SGX_CPUID_CAPABILITIES, &eax, &ebx, &ecx,
> &edx);
> +	/* Only allow misc bits supported by the driver. */
> +	sgx_misc_reserved = ~ebx | SGX_MISC_RESERVED_MASK;
> +#ifdef CONFIG_X86_64
> +	sgx_encl_size_max_64 = 1ULL << ((edx >> 8) & 0xFF);
> +#endif
> +	sgx_encl_size_max_32 = 1ULL << (edx & 0xFF);
> +
> +	if (boot_cpu_has(X86_FEATURE_OSXSAVE)) {
> +		cpuid_count(SGX_CPUID, SGX_CPUID_ATTRIBUTES, &eax, &ebx,
> &ecx,
> +			    &edx);
> +		sgx_xfrm_mask = (((u64)edx) << 32) + (u64)ecx;
> +
> +		for (i = 2; i < 64; i++) {
> +			cpuid_count(0x0D, i, &eax, &ebx, &ecx, &edx);
> +			if ((1 << i) & sgx_xfrm_mask)
> +				sgx_xsave_size_tbl[i] = eax + ebx;
> +		}
> +	}
> +
> +	for (i = 0; i < SGX_MAX_EPC_BANKS; i++) {
> +		cpuid_count(SGX_CPUID, i + SGX_CPUID_EPC_BANKS, &eax, &ebx,
> +			    &ecx, &edx);
> +		if (!(eax & 0xf))
> +			break;
> +
> +		pa = ((u64)(ebx & 0xfffff) << 32) + (u64)(eax & 0xfffff000);
> +		size = ((u64)(edx & 0xfffff) << 32) + (u64)(ecx &
> 0xfffff000);
> +
> +		dev_info(parent, "EPC bank 0x%lx-0x%lx\n", pa, pa + size);
> +
> +		sgx_epc_banks[i].pa = pa;
> +		sgx_epc_banks[i].size = size;
> +	}
> +
> +	sgx_nr_epc_banks = i;
> +
> +	for (i = 0; i < sgx_nr_epc_banks; i++) {
> +#ifdef CONFIG_X86_64
> +		sgx_epc_banks[i].va = (unsigned long)
> +			ioremap_cache(sgx_epc_banks[i].pa,
> +				      sgx_epc_banks[i].size);
> +		if (!sgx_epc_banks[i].va) {
> +			sgx_nr_epc_banks = i;
> +			ret = -ENOMEM;
> +			goto out_iounmap;
> +		}
> +#endif
> +		ret = sgx_add_epc_bank(sgx_epc_banks[i].pa,
> +				       sgx_epc_banks[i].size, i);
> +		if (ret) {
> +			sgx_nr_epc_banks = i + 1;
> +			goto out_iounmap;
> +		}
> +	}
> +
> +	ret = sgx_page_cache_init();
> +	if (ret)
> +		goto out_iounmap;
> +
> +	sgx_add_page_wq = alloc_workqueue("intel_sgx-add-page-wq",
> +					  WQ_UNBOUND | WQ_FREEZABLE, 1);
> +	if (!sgx_add_page_wq) {
> +		pr_err("intel_sgx: alloc_workqueue() failed\n");
> +		ret = -ENOMEM;
> +		goto out_iounmap;
> +	}
> +
> +	ret = cdev_device_add(&sgx_dev->cdev, &sgx_dev->dev);
> +	if (ret)
> +		goto out_workqueue;
> +
> +	return 0;
> +out_workqueue:
> +	destroy_workqueue(sgx_add_page_wq);
> +out_iounmap:

sgx_page_cache_teardown() should be called here, else ksgxswapd and the list of
EPC pages will leak.

> +#ifdef CONFIG_X86_64
> +	for (i = 0; i < sgx_nr_epc_banks; i++)
> +		iounmap((void *)sgx_epc_banks[i].va);
> +#endif
> +	return ret;
> +}

... 

> +int sgx_add_epc_bank(resource_size_t start, unsigned long size, int bank)
> +{
> +	unsigned long i;
> +	struct sgx_epc_page *new_epc_page, *entry;
> +	struct list_head *parser, *temp;
> +
> +	for (i = 0; i < size; i += PAGE_SIZE) {
> +		new_epc_page = kzalloc(sizeof(*new_epc_page), GFP_KERNEL);
> +		if (!new_epc_page)
> +			goto err_freelist;
> +		new_epc_page->pa = (start + i) | bank;
> +
> +		spin_lock(&sgx_free_list_lock);
> +		list_add_tail(&new_epc_page->list, &sgx_free_list);
> +		sgx_nr_total_epc_pages++;
> +		sgx_nr_free_pages++;
> +		spin_unlock(&sgx_free_list_lock);
> +	}
> +
> +	return 0;
> +err_freelist:
> +	list_for_each_safe(parser, temp, &sgx_free_list) {
> +		spin_lock(&sgx_free_list_lock);
> +		entry = list_entry(parser, struct sgx_epc_page, list);
> +		list_del(&entry->list);
> +		spin_unlock(&sgx_free_list_lock);
> +		kfree(entry);
> +	}
> +	return -ENOMEM;
> +}

Freeing the entire list on failure does not seem like the appropriate behavior
for this helper func, e.g. the list should be purged by sgx_page_cache_teardown.
Buffering the new pages into a local list and only splicing said list into the
global list upon success is more inline with what I would expect from a helper
func, and also only requires a single lock/unlock.

diff --git drivers/platform/x86/intel_sgx/sgx_page_cache.c
drivers/platform/x86/intel_sgx/sgx_page_cache.c
index f8883d24692a..38496e6296f1 100644
--- drivers/platform/x86/intel_sgx/sgx_page_cache.c
+++ drivers/platform/x86/intel_sgx/sgx_page_cache.c
@@ -397,7 +397,8 @@ int sgx_add_epc_bank(resource_size_t start, unsigned long
size, int bank)
 {
        unsigned long i;
        struct sgx_epc_page *new_epc_page, *entry;
-       struct list_head *parser, *temp;
+       unsigned int nr_pages = 0;
+       LIST_HEAD(epc_pages);
 
        for (i = 0; i < size; i += PAGE_SIZE) {
                new_epc_page = kzalloc(sizeof(*new_epc_page), GFP_KERNEL);
@@ -405,22 +406,19 @@ int sgx_add_epc_bank(resource_size_t start, unsigned long
size, int bank)
                        goto err_freelist;
                new_epc_page->pa = (start + i) | bank;
 
-               spin_lock(&sgx_free_list_lock);
-               list_add_tail(&new_epc_page->list, &sgx_free_list);
-               sgx_nr_total_epc_pages++;
-               sgx_nr_free_pages++;
-               spin_unlock(&sgx_free_list_lock);
+               list_add_tail(&new_epc_page->list, &epc_pages);
+               nr_pages++;
        }
 
+       spin_lock(&sgx_free_list_lock);
+       list_splice_tail(&epc_pages, &sgx_free_list);
+       sgx_nr_total_epc_pages += nr_pages;
+       sgx_nr_free_pages += nr_pages;
+       spin_unlock(&sgx_free_list_lock);
        return 0;
 err_freelist:
-       list_for_each_safe(parser, temp, &sgx_free_list) {
-               spin_lock(&sgx_free_list_lock);
-               entry = list_entry(parser, struct sgx_epc_page, list);
-               list_del(&entry->list);
-               spin_unlock(&sgx_free_list_lock);
+       list_for_each_entry(entry, &sgx_free_list, list)
                kfree(entry);
-       }
        return -ENOMEM;
 }
