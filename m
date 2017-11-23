From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 07/11] intel_sgx: ptrace() support
Date: Thu, 23 Nov 2017 12:25:54 +0200
Message-ID: <20171123102554.3xa5xsz7hwsocv33@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-8-jarkko.sakkinen@linux.intel.com>
 <alpine.DEB.2.20.1711161016040.2191@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:56755 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751570AbdKWK0C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Nov 2017 05:26:02 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1711161016040.2191@nanos>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Nov 16, 2017 at 10:28:42AM +0100, Thomas Gleixner wrote:
> On Mon, 13 Nov 2017, Jarkko Sakkinen wrote:
> 
> > Implemented VMA callbacks in order to ptrace() debug enclaves.
> 
> The amount of information in this changelog is really overwhelming.
> 
> Please explain WHY you need that and HOW its supposed to work.
> 
> > +static inline int sgx_vma_access_word(struct sgx_encl *encl,
> > +				      unsigned long addr,
> > +				      void *buf,
> > +				      int len,
> > +				      int write,
> > +				      struct sgx_encl_page *encl_page,
> > +				      int i)
> 
> Can you find a way to waste more lines for a function declaration?
> 
> Aside of that using 'i' as a argument is just broken. Arguments should be
> self explaining as far as possible and sure not using names which are
> commonly used in code for iterators etc.
> 
> > +{
> > +	char data[sizeof(unsigned long)];
> > +	int align, cnt, offset;
> > +	void *vaddr;
> > +	int ret;
> > +
> > +	offset = ((addr + i) & (PAGE_SIZE - 1)) & ~(sizeof(unsigned long) - 1);
> > +	align = (addr + i) & (sizeof(unsigned long) - 1);
> 
> The kernel has macros for this kind of operations.
> 
> > +	cnt = sizeof(unsigned long) - align;
> > +	cnt = min(cnt, len - i);
> > +
> > +	if (write) {
> > +		if (encl_page->flags & SGX_ENCL_PAGE_TCS &&
> > +		    (offset < 8 || (offset + (len - i)) > 16))
> 
> Hard coded numbers which are nowhere explained are a nono. Please use proper
> defines and explain the meaning so the code becomes understandable.
> 
> > +			return -ECANCELED;
> > +
> > +		if (align || (cnt != sizeof(unsigned long))) {
> 
> What the heck is this doing? The complete lack of any comment in this
> code makes review impossible.
> 
> > +			vaddr = sgx_get_page(encl_page->epc_page);
> > +			ret = __edbgrd((void *)((unsigned long)vaddr + offset),
> > +				       (unsigned long *)data);
> 
> This typecast mess all over the place is just wrong. You either use the
> wrong variable types or your functions have the wrong parameter type.

Thank you for the feedback. I agree with all your comments.

I'll also split the function into sgx_vma_read_word() and
sgx_vma_write_word(). Makes the code somewhat cleaner and nicer to trace.

I have to admit that I have overlooked this commit when preparing the
patch set. Even though I've written code myself, it's been a while and
I had hard time to get a grip what is going on when I read your
response, which makes your feedback even more valid :-)

/Jarkko
