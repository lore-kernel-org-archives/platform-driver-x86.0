From: "Dr. Greg" <greg@enjellic.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 10 Dec 2018 08:46:44 -0600
Message-ID: <20181210144644.GA25142@wind.enjellic.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com> <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com> <CALCETrXctxfED1Dr-MuZxFnh5gzTyRL06hRJ_fQnNA8p2S4xEQ@mail.gmail.com> <20181209170132.d4hhiic3dfoky4fr@devuan>
Reply-To: "Dr. Greg" <greg@enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209170132.d4hhiic3dfoky4fr@devuan>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Andy Lutomirski <luto@amacapital.net>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, andy@infradea
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Dec 09, 2018 at 06:01:32PM +0100, Pavel Machek wrote:

> Hi!

Good morning to everyone.

> > On Thu, Nov 15, 2018 at 5:08 PM Jarkko Sakkinen
> > <jarkko.sakkinen@linux.intel.com> wrote:
> > >
> > > Intel Software Guard eXtensions (SGX) is a set of CPU instructions that
> > > can be used by applications to set aside private regions of code and
> > > data. The code outside the enclave is disallowed to access the memory
> > > inside the enclave by the CPU access control.
> > >
> > > SGX driver provides a ioctl API for loading and initializing enclaves.
> > > Address range for enclaves is reserved with mmap() and they are
> > > destroyed with munmap(). Enclave construction, measurement and
> > > initialization is done with the provided the ioctl API.
> > 
> > I brought this up a while back, and I think I should re-ask it now
> > that this driver is getting close to ready:
> > 
> > As it stands, there's just one SGX character device, and I imagine
> > that it'll be available to unprivileged applications.  I'm concerned
> > that this isn't quite what we want.  I certainly think that everyone,
> > or at least almost everyone, ought to be able to run normal
> > enclaves.

> I don't think nobody or postfix or guest should be running enclaves
> on my systems. First, I'd like to be able to debug my systems.
>
> Second, sgx quite complex and tricky. It may turn out to be secure
> in the end, but I'd not be surprised if we got few CVEs before we
> get there.
>
> Last, I'd hate to find out in few years that I can't switch to amd
> cpu because firefox now requires sgx.
>
> Just make it root-only or 660 by default. Users can get permission
> in similar way they get rights to audio..

I'm not sure that using root or group restricted access to a character
device is going to stop an ISV from embracing a technology, but that
is an alternate debate.

Relying on discretionary, or mandatory for that matter, access
controls is not consistent with the security architecture of SGX.  The
technology was designed to provide robustness in the face of
aggressors who may have compromised the operating system or hardware
platform.

The lingua franca of SGX security and access controls are MRSIGNER
values.  The SFLC patches that we will be making available, once we
are convinced the upstream driver is working, implement MRSIGNER based
security controls with an absolutely minimal TCB footprint in the
kernel.  This strategy allows the platform owner to use SGX compliant
and cryptographically enforced access controls.

Just as an aside, secondary to our perception that this technology and
what it can do is not widely understood, we are developing a 2-part
LWN article series on SGX and its implications for Linux.

> 								Pavel

Best wishes for a good day and a productive week.

Dr. Greg

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686
FAX: 701-281-3949           EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"... remember that innovation is saying 'no' to 1000 things."
                                -- Moxie Marlinspike
