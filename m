From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 07/11] intel_sgx: ptrace() support
Date: Sun, 26 Nov 2017 18:53:21 +0200
Message-ID: <20171126165321.ldpnudpiqyjsuv3v@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-8-jarkko.sakkinen@linux.intel.com>
 <20171126154429.3stntmhj25otqmy5@linux.intel.com>
 <1511711405.20482.23.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:22731 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751322AbdKZQxY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Nov 2017 11:53:24 -0500
Content-Disposition: inline
In-Reply-To: <1511711405.20482.23.camel@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Sun, Nov 26, 2017 at 07:50:05AM -0800, Joe Perches wrote:
> On Sun, 2017-11-26 at 17:44 +0200, Jarkko Sakkinen wrote:
> > On Sat, Nov 25, 2017 at 09:29:24PM +0200, Jarkko Sakkinen wrote:
> > > +	ptr = sgx_get_page(page->epc_page);
> > > +	ret = __edbgrd((unsigned long)ptr + offset, data);
> 	        ^^^^^^
> 
> > > +	sgx_put_page(ptr);
> > > +	if (ret) {
> > > +		sgx_dbg(encl, "EDBGRD returned %d\n", ret);
> >                                ~~~~~~
> > 			       EDBGWR
> 
> ?

D'oh I meant to quote this part:

	ptr = sgx_get_page(page->epc_page);
	ret = __edbgwr((unsigned long)ptr + offset, data);
	sgx_put_page(ptr);
	if (ret) {
		sgx_dbg(encl, "EDBGRD returned %d\n", ret);
		return -EFAULT;
	}

There's a typo in sgx_dbg().

/Jarkko
