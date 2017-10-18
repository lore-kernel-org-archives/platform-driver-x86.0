From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v4 07/12] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Wed, 18 Oct 2017 18:21:24 +0300
Message-ID: <20171018152124.hxj6emfv3wageoop@linux.intel.com>
References: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
 <20171016191855.16964-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171016191855.16964-8-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 16, 2017 at 10:18:50PM +0300, Jarkko Sakkinen wrote:
> +int sgx_encl_create(struct sgx_secs *secs)
> +{
> +	struct sgx_pageinfo pginfo;
> +	struct sgx_secinfo secinfo;
> +	struct sgx_encl *encl;
> +	struct sgx_epc_page *secs_epc;
> +	struct vm_area_struct *vma;
> +	void *secs_vaddr;
> +	long ret;
> +
> +	encl = sgx_encl_alloc(secs);
> +	if (IS_ERR(secs))
> +		return PTR_ERR(encl);

if (IS_ERR(encl))

/Jarkko
