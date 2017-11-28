From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 04/11] x86: define IA32_FEATUE_CONTROL.SGX_LC
Date: Tue, 28 Nov 2017 23:24:07 +0200
Message-ID: <20171128212407.lky32cdghxqsxd4e@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-5-jarkko.sakkinen@linux.intel.com>
 <1511889371.9392.58.camel@intel.com>
 <1511893683.9392.100.camel@intel.com>
 <20171128205324.pqojyfqbet3h7re4@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171128205324.pqojyfqbet3h7re4@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Piotr Luc <piotr.luc@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 28, 2017 at 10:53:24PM +0200, Jarkko Sakkinen wrote:
> > So, maybe something like this?
> > 
> >     After SGX is activated[1] the IA32_SGXLEPUBKEYHASHn MSRs are writable
> >     if and only if SGX_LC is set in the IA32_FEATURE_CONTROL MSR and the
> >     IA32_FEATURE_CONTROL MSR is locked, otherwise they are read-only.
> > 
> >     For example, firmware can allow the OS to change the launch enclave
> >     root key by setting IA32_FEATURE_CONTROL.SGX_LC, and thus give the
> >     OS complete control over the enclaves it runs.  Alternatively,
> >     firmware can clear IA32_FEATURE_CONTROL.SGX_LC to lock down the root
> >     key and restrict the OS to running enclaves signed with the root key
> >     or whitelisted/trusted by a launch enclave (which must be signed with
> >     the root key).
> > 
> >     [1] SGX related bits in IA32_FEATURE_CONTROL cannot be set until SGX
> >         is activated, e.g. by firmware.  SGX activation is triggered by
> >         setting bit 0 in MSR 0x7a.  Until SGX is activated, the LE hash
> >         MSRs are writable, e.g. to allow firmware to lock down the LE
> >         root key with a non-Intel value.
> 
> Thanks I'll use this as a basis and move most of the crappy commit
> message to the commit (with some editing) that defines the MSRs.

Not sure after all if I'm following this.

IA32_FEATURE_CONTROL[17] contols whether the MSRs are writable or not
after the feature control MSR is locked. SGX_LC means just that the
CPU supports the launch configuration.

/Jarkko
