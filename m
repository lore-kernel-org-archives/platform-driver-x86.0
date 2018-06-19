From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page cache
Date: Tue, 19 Jun 2018 08:59:25 -0700
Message-ID: <20180619155924.GA13375@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
 <3c1b04d6-6e93-efaa-1890-101b7fd9784c@intel.com>
 <20180619145753.GB8034@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180619145753.GB8034@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 19, 2018 at 05:57:53PM +0300, Jarkko Sakkinen wrote:
> On Fri, Jun 08, 2018 at 11:24:12AM -0700, Dave Hansen wrote:
> > On 06/08/2018 10:09 AM, Jarkko Sakkinen wrote:
> > > +static __init bool sgx_is_enabled(bool *lc_enabled)
> > >  {
> > >  	unsigned long fc;
> > >  
> > > @@ -41,12 +466,26 @@ static __init bool sgx_is_enabled(void)
> > >  	if (!(fc & FEATURE_CONTROL_SGX_ENABLE))
> > >  		return false;
> > >  
> > > +	*lc_enabled = !!(fc & FEATURE_CONTROL_SGX_LE_WR);
> > > +
> > >  	return true;
> > >  }
> > 
> > I'm baffled why lc_enabled is connected to the enclave page cache.
> 
> KVM works only with writable MSRs. Driver works both with writable
> and read-only MSRs.

That's not true, KVM can/will support SGX regardless of whether or not
Launch Control (LC) is available and/or enabled.  KVM does need to
know whether or not LC is enabled.

Back to Dave's question, LC isn't connected to the EPC management,
the LC code should be split into a separate patch.
 
> Thanks, I'll try my best to deal with all this :-)
> 
> /Jarkko
