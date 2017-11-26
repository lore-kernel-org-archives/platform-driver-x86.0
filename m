From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v6 07/11] intel_sgx: ptrace() support
Date: Sun, 26 Nov 2017 07:50:05 -0800
Message-ID: <1511711405.20482.23.camel@perches.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
         <20171125193132.24321-8-jarkko.sakkinen@linux.intel.com>
         <20171126154429.3stntmhj25otqmy5@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0099.hostedemail.com ([216.40.44.99]:56504 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751181AbdKZPuJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Nov 2017 10:50:09 -0500
In-Reply-To: <20171126154429.3stntmhj25otqmy5@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Sun, 2017-11-26 at 17:44 +0200, Jarkko Sakkinen wrote:
> On Sat, Nov 25, 2017 at 09:29:24PM +0200, Jarkko Sakkinen wrote:
> > +	ptr = sgx_get_page(page->epc_page);
> > +	ret = __edbgrd((unsigned long)ptr + offset, data);
	        ^^^^^^

> > +	sgx_put_page(ptr);
> > +	if (ret) {
> > +		sgx_dbg(encl, "EDBGRD returned %d\n", ret);
>                                ~~~~~~
> 			       EDBGWR

?
