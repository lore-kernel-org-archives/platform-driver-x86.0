From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Fri, 13 Oct 2017 23:08:24 +0300
Message-ID: <20171013200824.dnwal6prligflo74@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
 <20171010182606.GA20986@linux.intel.com>
 <20171013195849.2vt2n6542ejc6ah4@linux.intel.com>
 <20171013200253.ou5fvexlevjet7nj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:9960 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750716AbdJMUI3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 16:08:29 -0400
Content-Disposition: inline
In-Reply-To: <20171013200253.ou5fvexlevjet7nj@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Fri, Oct 13, 2017 at 11:02:53PM +0300, Jarkko Sakkinen wrote:
> On Fri, Oct 13, 2017 at 10:58:49PM +0300, Jarkko Sakkinen wrote:
> > On Tue, Oct 10, 2017 at 11:26:06AM -0700, Sean Christopherson wrote:
> > > On Tue, Oct 10, 2017 at 05:32:53PM +0300, Jarkko Sakkinen wrote:
> > > > diff --git a/drivers/platform/x86/intel_sgx/sgx_encl.c b/drivers/platform/x86/intel_sgx/sgx_encl.c
> > > > new file mode 100644
> > > > index 000000000000..aa0deed08cee
> > > > --- /dev/null
> > > > +++ b/drivers/platform/x86/intel_sgx/sgx_encl.c
> > > > @@ -0,0 +1,989 @@
> > > >
> > > > +/**
> > > > + * sgx_encl_find - find an enclave
> > > > + * @mm:		mm struct of the current process
> > > > + * @addr:	address in the ELRANGE
> > > > + * @created	is the enclave already created?
> > > > + * @vma:	the resulting VMA
> > > > + *
> > > > + * Finds an enclave identified by the given address. Gives back the VMA, that is
> > > > + * part of the enclave, located in that address.
> > > > + *
> > > > + * Return:
> > > > + * 0 on success,
> > > > + * -EINVAL if not found,
> > > > + */
> > > > +int sgx_encl_find(struct mm_struct *mm, unsigned long addr, bool created,
> > > > +		  struct vm_area_struct **vma)
> > > > +{
> > > > +	struct vm_area_struct *result;
> > > > +	struct sgx_encl *encl;
> > > > +
> > > > +	result = find_vma(mm, addr);
> > > > +	if (!result || result->vm_ops != &sgx_vm_ops || addr < result->vm_start)
> > > > +		return -EINVAL;
> > > > +
> > > > +	encl = result->vm_private_data;
> > > > +	if (created) {
> > > > +		if (!encl)
> > > > +			return -EINVAL;
> > > > +	} else {
> > > > +		if (encl)
> > > > +			return -EINVAL;
> > > > +	}
> > > 
> > > What about removing @created and returning -ENOENT (or -ENXIO?) if 
> > > result->vm_private_data is NULL?  Removing @created will eliminate
> > > any potential confusion for the common case of @created=true.  For
> > > @created=false, which should be limited to sgx_encl_create, I think
> > > that explicitly checking for "ret != -ENOENT" is more intuitive
> > > than checking whether or not sgx_encl_find succeeded, e.g. I knew
> > > the intent of the check in sgx_encl_create ahead of time and I still
> > > had to walk through sgx_encl_find to verify the behavior.
> > 
> > Would make sense. Thank you.
> > 
> > /Jarkko
> 
> And in the case of ioctls (sgx_encl_get()) it would probably make sense
> to deliver -ENOENT back to the user space instead of -EINVAL, wouldn't it?
> 
> /Jarkko

Please ignore this response! :-)

/Jarkko
