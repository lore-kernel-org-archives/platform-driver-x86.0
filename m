From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 06/11] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Tue, 14 Nov 2017 22:12:25 +0200
Message-ID: <20171114201225.d2hum3njmduiupib@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
 <alpine.LFD.2.20.1711141039400.7290@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:41523 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756539AbdKNUMa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 15:12:30 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1711141039400.7290@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: James Morris <james.l.morris@oracle.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 14, 2017 at 10:41:50AM +1100, James Morris wrote:
> On Mon, 13 Nov 2017, Jarkko Sakkinen wrote:
> 
> > +
> > +	secs_epc = sgx_alloc_page(0);
> 
> Use SGX_ALLOC_ATOMIC instead of 0 ?

It is used in the #PF handler where it is not safe to swap pages in the
call context. I.e. you cannot lock mmap_sem without potentially causing
a deadlock.

> > +	if (IS_ERR(secs_epc)) {
> > +		ret = PTR_ERR(secs_epc);
> > +		goto out;
> > +	}
> 
> > +out:
> > +	if (encl)
> > +		kref_put(&encl->refcount, sgx_encl_release);
> > +	return ret;
> > +}
> 
> Don't you need an sgx_free_page() somewhere here?

It will get freed by sgx_encl_release().

> -- 
> James Morris
> <james.l.morris@oracle.com>

/Jarkko
