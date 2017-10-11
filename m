From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Wed, 11 Oct 2017 08:56:12 -0700
Message-ID: <20171011155612.GA9144@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
 <20171010154136.GB5020@linux.intel.com>
 <20171011114651.tp6uf27l52kt5tf3@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:37021 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751462AbdJKP6S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2017 11:58:18 -0400
Content-Disposition: inline
In-Reply-To: <20171011114651.tp6uf27l52kt5tf3@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Wed, Oct 11, 2017 at 02:46:51PM +0300, Jarkko Sakkinen wrote:
> On Tue, Oct 10, 2017 at 08:41:36AM -0700, Sean Christopherson wrote:
> > On Tue, Oct 10, 2017 at 05:32:53PM +0300, Jarkko Sakkinen wrote:
> > > diff --git a/drivers/platform/x86/intel_sgx/sgx_page_cache.c b/drivers/platform/x86/intel_sgx/sgx_page_cache.c
> > > new file mode 100644
> > > index 000000000000..1089b563e07b
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/intel_sgx/sgx_page_cache.c
> > >
> > > +/**
> > > + * sgx_alloc_page - allocate an EPC page
> > > + * @flags:	allocation flags
> > > + *
> > > + * Try to grab a page from the free EPC page list. If there is a free page
> > > + * available, it is returned to the caller. If called with SGX_ALLOC_ATOMIC,
> > > + * the function will return immediately if the list is empty. Otherwise, it
> > > + * will swap pages up until there is a free page available. Before returning
> > > + * the low watermark is checked and ksgxswapd is waken up if we are below it.
> > > + *
> > > + * Return: an EPC page or a system error code
> > > + */
> > > +struct sgx_epc_page *sgx_alloc_page(unsigned int flags)
> > > +{
> > > +	struct sgx_epc_page *entry;
> > > +
> > > +	for ( ; ; ) {
> > > +		entry = sgx_alloc_page_fast();
> > > +		if (entry)
> > > +			break;
> > > +
> > > +		/* We need at minimum two pages for the #PF handler. */
> > > +		if (atomic_read(&sgx_va_pages_cnt) >
> > > +		    (sgx_nr_total_epc_pages - 2))
> > > +			return ERR_PTR(-ENOMEM);
> > > +
> > > +		if (flags & SGX_ALLOC_ATOMIC) {
> > > +			entry = ERR_PTR(-EBUSY);
> > > +			break;
> > > +		}
> > > +
> > > +		if (signal_pending(current)) {
> > > +			entry = ERR_PTR(-ERESTARTSYS);
> > > +			break;
> > > +		}
> > > +
> > > +		sgx_swap_pages(SGX_NR_SWAP_CLUSTER_MAX);
> > > +		schedule();
> > > +	}
> > > +
> > > +	if (sgx_nr_free_pages < sgx_nr_low_pages)
> > > +		wake_up(&ksgxswapd_waitq);
> > > +
> > > +	return entry;
> > > +}
> > > +EXPORT_SYMBOL(sgx_alloc_page);
> > 
> > I think it makes sense to remove the exports from sgx_page_cache.c
> > for the initial upstreaming given that the only consumer is the
> > pre-release/out-of-tree KVM module, which generally requires
> > recompiling the entire kernel anyways.
> 
> Forgot them. Thanks.
> 
> For the same reason as you described I removed them from
> arch/x86/include/asm/sgx.h

sgx_free_page can also be cleaned up a bit if it's no longer
exported, proposed patch below.


intel_sgx: make encl a required param for sgx_free_page

sgx_free_page is no longer exported, and so encl is no longer an
optional param as all driver usage must specify the encl.  Making
encl required also eliminates the path that returns a value, i.e.
modify sgx_free_page to have a void return.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 drivers/platform/x86/intel_sgx/sgx.h            |  2 +-
 drivers/platform/x86/intel_sgx/sgx_page_cache.c | 29 ++++++-------------------
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/intel_sgx/sgx.h b/drivers/platform/x86/intel_sgx/sgx.h
index cf66bda37c1f..17eb75604184 100644
--- a/drivers/platform/x86/intel_sgx/sgx.h
+++ b/drivers/platform/x86/intel_sgx/sgx.h
@@ -245,7 +245,7 @@ int sgx_add_epc_bank(resource_size_t start, unsigned long size, int bank);
 int sgx_page_cache_init(void);
 void sgx_page_cache_teardown(void);
 struct sgx_epc_page *sgx_alloc_page(unsigned int flags);
-int sgx_free_page(struct sgx_epc_page *entry, struct sgx_encl *encl);
+void sgx_free_page(struct sgx_epc_page *entry, struct sgx_encl *encl);
 void *sgx_get_page(struct sgx_epc_page *entry);
 void sgx_put_page(void *epc_page_vaddr);
 void sgx_eblock(struct sgx_encl *encl, struct sgx_epc_page *epc_page);
diff --git a/drivers/platform/x86/intel_sgx/sgx_page_cache.c b/drivers/platform/x86/intel_sgx/sgx_page_cache.c
index f8252a8b3893..bbd8ca630d9c 100644
--- a/drivers/platform/x86/intel_sgx/sgx_page_cache.c
+++ b/drivers/platform/x86/intel_sgx/sgx_page_cache.c
@@ -522,23 +522,14 @@ struct sgx_epc_page *sgx_alloc_page(unsigned int flags)
 /**
  * sgx_free_page - free an EPC page
  *
- * EREMOVE an EPC page and insert it back to the list of free pages. Optionally,
- * an enclave can be given as a parameter. If the enclave is given, the
- * resulting error is printed out loud as a critical error. It is an indicator
- * of a driver bug if that would happen.
- *
- * If the enclave is not given as a parameter (like in the case when VMM uses
- * this function)), it is fully up to the caller to deal with the return value,
- * including printing it to the klog if it wants to do such a thing.
+ * EREMOVE an EPC page and insert it back to the list of free pages.
+ * If EREMOVE fails, the error is printed out loud as a critical error.
+ * It is an indicator of a driver bug if that would happen.
  *
  * @entry:	any EPC page
- * @encl:	enclave that owns the given EPC page (optional)
- *
- * Return:
- * 0 on success,
- * SGX error code if an enclave is not defined
+ * @encl:	enclave that owns the given EPC page
  */
-int sgx_free_page(struct sgx_epc_page *entry, struct sgx_encl *encl)
+void sgx_free_page(struct sgx_epc_page *entry, struct sgx_encl *encl)
 {
 	void *epc;
 	int ret;
@@ -547,19 +538,13 @@ int sgx_free_page(struct sgx_epc_page *entry, struct sgx_encl *encl)
 	ret = __eremove(epc);
 	sgx_put_page(epc);
 
-	if (ret) {
-		if (encl)
-			sgx_crit(encl, "EREMOVE returned %d\n", ret);
-		else
-			return ret;
-	}
+	if (ret)
+		sgx_crit(encl, "EREMOVE returned %d\n", ret);
 
 	spin_lock(&sgx_free_list_lock);
 	list_add(&entry->list, &sgx_free_list);
 	sgx_nr_free_pages++;
 	spin_unlock(&sgx_free_list_lock);
-
-	return 0;
 }
 
 void *sgx_get_page(struct sgx_epc_page *entry)
-- 
2.14.2
