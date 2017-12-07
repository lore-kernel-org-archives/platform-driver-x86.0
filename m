From: "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Subject: RE: [intel-sgx-kernel-dev] [PATCH v7 4/8] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Thu, 7 Dec 2017 14:46:39 +0000
Message-ID: <37306EFA9975BE469F115FDE982C075BC6B39193@ORSMSX108.amr.corp.intel.com>
References: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
 <20171207015614.7914-5-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga17.intel.com ([192.55.52.151]:1609 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753918AbdLGOz6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Dec 2017 09:55:58 -0500
In-Reply-To: <20171207015614.7914-5-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> +static void sgx_ewb(struct sgx_encl *encl, struct sgx_encl_page *entry)
> +{
> +	struct sgx_va_page *va_page;
> +	unsigned int va_offset;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < 2; i++) {
> +		va_page = list_first_entry(&encl->va_pages,
> +					   struct sgx_va_page, list);
> +		va_offset = sgx_alloc_va_slot(va_page);
> +		if (va_offset < PAGE_SIZE)
> +			break;
> +
> +		list_move_tail(&va_page->list, &encl->va_pages);
> +	}

This is broken, there is no guarantee that the next VA page will have
a free slot.  You have to walk over all VA pages to guarantee a slot
is found, e.g. this caused EWB and ELDU errors.

> +
> +	ret = __sgx_ewb(encl, entry, va_page, va_offset);
> +	if (ret == SGX_NOT_TRACKED) {
> +		/* slow path, IPI needed */
> +		sgx_flush_cpus(encl);
> +		ret = __sgx_ewb(encl, entry, va_page, va_offset);
> +	}
> +
> +	if (ret) {
> +		sgx_invalidate(encl, true);
> +		if (ret > 0)
> +			sgx_err(encl, "EWB returned %d, enclave invalidated\n",
> +				ret);
> +	}
> +
> +	sgx_free_page(entry->epc_page, encl);
> +	entry->desc |= va_offset;
> +	entry->va_page = va_page;
> +	entry->desc &= ~SGX_ENCL_PAGE_RESERVED;
> +}

[...]

> +
> +	/* Legal race condition, page is already faulted. */
> +	if (entry->list.next != LIST_POISON1) {

Querying list.next to determine if an encl_page is resident in the EPC
is ugly and unintuitive, and depending on list's internal state seems
dangerous.  Why not use a flag in the encl_page, e.g. as in the patch
I submitted almost 8 months ago for combining epc_page and va_page into
a union?  And, the encl's SGX_ENCL_SECS_EVICTED flag can be dropped if
a flag is added to indicate whether or not any encl_page is resident in
the EPC.

https://lists.01.org/pipermail/intel-sgx-kernel-dev/2017-April/000570.html

> +		if (reserve)
> +			entry->desc |= SGX_ENCL_PAGE_RESERVED;
> +		goto out;
> +	}
> +
> +	epc_page = sgx_alloc_page(SGX_ALLOC_ATOMIC);
> +	if (IS_ERR(epc_page)) {
> +		rc = PTR_ERR(epc_page);
> +		epc_page = NULL;
> +		goto out;
> +	}
> +
> +	/* If SECS is evicted then reload it first */
> +	if (encl->flags & SGX_ENCL_SECS_EVICTED) {
> +		secs_epc_page = sgx_alloc_page(SGX_ALLOC_ATOMIC);
> +		if (IS_ERR(secs_epc_page)) {
> +			rc = PTR_ERR(secs_epc_page);
> +			secs_epc_page = NULL;
> +			goto out;
> +		}
> +
> +		rc = sgx_eldu(encl, &encl->secs, secs_epc_page, true);
> +		if (rc)
> +			goto out;
> +
> +		encl->secs.epc_page = secs_epc_page;
> +		encl->flags &= ~SGX_ENCL_SECS_EVICTED;
> +
> +		/* Do not free */
> +		secs_epc_page = NULL;
> +	}
> +
> +	rc = sgx_eldu(encl, entry, epc_page, false /* is_secs */);
> +	if (rc)
> +		goto out;
> +
> +	/* Track the EPC page even if vm_insert_pfn fails; we need to ensure
> +	 * the EPC page is properly freed and we can't do EREMOVE right away
> +	 * because EREMOVE may fail due to an active cpu in the enclave.  We
> +	 * can't call vm_insert_pfn before sgx_eldu because SKL signals #GP
> +	 * instead of #PF if the EPC page is invalid.
> +	 */
> +	encl->secs_child_cnt++;
> +
> +	entry->epc_page = epc_page;
> +
> +	if (reserve)
> +		entry->desc |= SGX_ENCL_PAGE_RESERVED;
> +
> +	/* Do not free */
> +	epc_page = NULL;
> +	list_add_tail(&entry->list, &encl->load_list);
> +
> +	rc = vm_insert_pfn(vma, addr, SGX_EPC_PFN(entry->epc_page));
> +	if (rc) {
> +		/* Kill the enclave if vm_insert_pfn fails; failure only occurs
> +		 * if there is a driver bug or an unrecoverable issue, e.g. OOM.
> +		 */
> +		sgx_crit(encl, "vm_insert_pfn returned %d\n", rc);
> +		sgx_invalidate(encl, true);
> +		goto out;
> +	}
> +
> +	sgx_test_and_clear_young(entry, encl);
> +out:
> +	mutex_unlock(&encl->lock);
> +	if (epc_page)
> +		sgx_free_page(epc_page, encl);
> +	if (secs_epc_page)
> +		sgx_free_page(secs_epc_page, encl);
> +	return rc ? ERR_PTR(rc) : entry;
> +}
>
