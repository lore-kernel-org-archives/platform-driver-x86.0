From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 06/11] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Wed, 15 Nov 2017 12:04:16 +0200
Message-ID: <20171115100416.n27fziiygtmu4d7r@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
 <alpine.LFD.2.20.1711141039400.7290@localhost>
 <20171114201225.d2hum3njmduiupib@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171114201225.d2hum3njmduiupib@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morris <james.l.morris@oracle.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 14, 2017 at 10:12:25PM +0200, Jarkko Sakkinen wrote:
> On Tue, Nov 14, 2017 at 10:41:50AM +1100, James Morris wrote:
> > > +	if (IS_ERR(secs_epc)) {
> > > +		ret = PTR_ERR(secs_epc);
> > > +		goto out;
> > > +	}
> > 
> > > +out:
> > > +	if (encl)
> > > +		kref_put(&encl->refcount, sgx_encl_release);
> > > +	return ret;
> > > +}
> > 
> > Don't you need an sgx_free_page() somewhere here?
> 
> It will get freed by sgx_encl_release().

The call flow was somewhat messy so I just moved sgx_encl_alloc() call
outside of sgx_encl_create().

/Jarkko
