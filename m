From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v16 06/22] x86/cpu/intel: Detect SGX support and update
 caps appropriately
Date: Wed, 7 Nov 2018 17:58:13 +0200
Message-ID: <20181107155813.GA9730@linux.intel.com>
References: <20181106134758.10572-1-jarkko.sakkinen@linux.intel.com>
 <20181106134758.10572-7-jarkko.sakkinen@linux.intel.com>
 <1541512681.7839.14.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541512681.7839.14.camel@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David Wang <davidwang@zhaoxin.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, Jia Zhang <qianyue.zj@alibaba-inc.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 06, 2018 at 05:58:01AM -0800, Sean Christopherson wrote:
> On Tue, 2018-11-06 at 15:45 +0200, Jarkko Sakkinen wrote:
> > From: Sean Christopherson <sean.j.christopherson@intel.com>
> > 
> > Similar to other large Intel features such as VMX and TXT, SGX must be
> > explicitly enabled in IA32_FEATURE_CONTROL MSR to be truly usable.
> > Clear all SGX related capabilities if SGX is not fully enabled in
> > IA32_FEATURE_CONTROL or if the SGX1 instruction set isn't supported
> > (impossible on bare metal, theoretically possible in a VM if the VMM is
> > doing something weird).
> > 
> > Like SGX itself, SGX Launch Control must be explicitly enabled via a
> > flag in IA32_FEATURE_CONTROL. Clear the SGX_LC capability if Launch
> > Control is not fully enabled (or obviously if SGX itself is disabled).
> > 
> > Note that clearing X86_FEATURE_SGX_LC creates a bit of a conundrum
> > regarding the SGXLEPUBKEYHASH MSRs, as it may be desirable to read the
> > MSRs even if they are not writable, e.g. to query the configured key,
> > but clearing the capability leaves no breadcrum for discerning whether
> > or not the MSRs exist.  But, such usage will be rare (KVM is the only
> > known case at this time) and not performance critical, so it's not
> > unreasonable to require the use of rdmsr_safe().  Clearing the cap bit
> > eliminates the need for an additional flag to track whether or not
> > Launch Control is truly enabled, which is what we care about the vast
> > majority of the time.
> > 
> > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> > Co-developed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > ---
> >  arch/x86/kernel/cpu/intel.c | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
> > index fc3c07fe7df5..8a20a193d399 100644
> > --- a/arch/x86/kernel/cpu/intel.c
> > +++ b/arch/x86/kernel/cpu/intel.c
> > @@ -596,6 +596,40 @@ static void detect_tme(struct cpuinfo_x86 *c)
> >  	c->x86_phys_bits -= keyid_bits;
> >  }
> >  
> > +static void detect_sgx(struct cpuinfo_x86 *c)
> > +{
> > +	unsigned long long fc;
> > +
> > +	rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
> > +	if (!(fc & FEATURE_CONTROL_LOCKED)) {
> > +		pr_err_once("sgx: IA32_FEATURE_CONTROL MSR is not locked\n");
> > +		goto out_unsupported;
> > +	}
> > +
> > +	if (!(fc & FEATURE_CONTROL_SGX_ENABLE)) {
> > +		pr_err_once("sgx: not enabled in IA32_FEATURE_CONTROL MSR\n");
> > +		goto out_unsupported;
> > +	}
> > +
> > +	if (!cpu_has(c, X86_FEATURE_SGX1)) {
> > +		pr_err_once("sgx: SGX1 instruction set not supported\n");
> > +		goto out_unsupported;
> > +	}
> > +
> > +	if (!(fc & FEATURE_CONTROL_SGX_LE_WR)) {
> 
> FEATURE_CONTROL_SGX_LE_WR isn't added until patch 13/22.  The patch
> can simply be moved earlier in the series if you want to introduce
> the full detect_sgx() in a single patch.  The only reason SGX_LE_WR
> was added later in the series was to bundle the Launch Control stuff
> together.

Ugh, sorry. Had this is mind when I started working on v16 changes :-(

/Jarkko
