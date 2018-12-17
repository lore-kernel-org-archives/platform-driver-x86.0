From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 09:45:40 -0800
Message-ID: <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org
Cc: sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> +struct sgx_encl *sgx_encl_alloc(struct sgx_secs *secs)
> +{
...
> +	kref_init(&encl->refcount);
> +	INIT_LIST_HEAD(&encl->add_page_reqs);
> +	INIT_RADIX_TREE(&encl->page_tree, GFP_KERNEL);
> +	mutex_init(&encl->lock);
> +	INIT_WORK(&encl->add_page_work, sgx_add_page_worker);
> +
> +	encl->mm = current->mm;  <---------------------------------> +	encl->base = secs->base;
> +	encl->size = secs->size;
> +	encl->ssaframesize = secs->ssa_frame_size;
> +	encl->backing = backing;
> +
> +	return encl;
> +}

How is this OK without taking a reference on the mm?

I have a feeling a bunch of your bugs with the mmu notifiers and so
forth are because the refcounting is wrong here.

Sean's SGX_ENCL_MM_RELEASED would, I think be unnecessary if you just
take a refcount here and release it when the enclave is destroyed.
