From: Kai Huang <kai.huang@linux.intel.com>
Subject: Re: [PATCH v6 04/11] x86: define IA32_FEATUE_CONTROL.SGX_LC
Date: Thu, 30 Nov 2017 16:05:45 +1300
Message-ID: <1512011145.16342.3.camel@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
         <20171125193132.24321-5-jarkko.sakkinen@linux.intel.com>
         <1511889371.9392.58.camel@intel.com> <1511893683.9392.100.camel@intel.com>
         <20171128205324.pqojyfqbet3h7re4@linux.intel.com>
         <20171128212407.lky32cdghxqsxd4e@linux.intel.com>
         <1511904794.18982.7.camel@intel.com>
         <20171128215513.qp2bs6462eq4pkz4@linux.intel.com>
         <1511906403.18982.17.camel@intel.com>
         <20171128222141.pljpvoou7bglbzid@linux.intel.com>
         <20171129153815.mkjncw3t22sser3c@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171129153815.mkjncw3t22sser3c@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Sean Christopherson <sean.j.christopherson@intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Piotr Luc <piotr.luc@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2017-11-29 at 17:38 +0200, Jarkko Sakkinen wrote:
> On Wed, Nov 29, 2017 at 12:21:41AM +0200, Jarkko Sakkinen wrote:
> > On Tue, Nov 28, 2017 at 02:00:03PM -0800, Sean Christopherson
> > wrote:
> > > What about SGX_LC_ENABLE?  The title in the MSR section of the
> > > SDM is
> > > "SGX Launch Control Enable", and it's more consistent with the
> > > other
> > > bits defined in feature control.  I'd also prefer that name for
> > > the
> > > actual #define too, SGX_LAUNCH_CONTROL_ENABLE is overly verbose
> > > IMO.
> > 
> > This is a bit ugly name but it is also very clear:
> > 
> >   FEATURE_CONTROL_SGX_LEPUBKEYHASH_WRITE_ENABLE
> > 
> > Just pushed update to the le branch. SGX_LC_ENABLE is a nice short
> > name
> > but it does not reflect the semantics.
> > 
> > Maybe we could combine these and name it as
> > 
> >   FEATURE_CONTROL_SGX_LC_WRITE_ENABLE
> > 
> > It is not as ugly and is very clear what it does.
> 
> I ended up with FEATURE_CONTROL_SGX_LC_WR. I think that is fairly
> reasonable name for bit 17.

Why not using FEATURE_CONTROL_SGX_LE_WR? "LE_WR" is even used in SDM
41.2.2 Intel SGX Launch Control Configuration:

If IA32_FEATURE_CONTROL.LE_WR (bit 17) is set to 1 and
IA32_FEATURE_CONTROL is locked on that logical processor,
IA32_SGXLEPUBKEYHASH MSRs on that logical
processor then the IA32_SGXLEPUBKEYHASHn MSR are writeable.

Thanks,
-Kai


> 
> /Jarkko
