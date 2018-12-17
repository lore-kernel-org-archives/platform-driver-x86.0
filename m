From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 21:54:48 +0200
Message-ID: <20181217195448.GE29785@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <beea8ad3-a607-5478-ad87-b8dd33e86146@intel.com>
 <CALCETrUCAvsaO71422gbaJtuZTbx8Y7pUm7yF3zQkktOvRedzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrUCAvsaO71422gbaJtuZTbx8Y7pUm7yF3zQkktOvRedzw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Sean Christopherson <sean.j.christopherson@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 17, 2018 at 11:25:47AM -0800, Andy Lutomirski wrote:
> On Mon, Dec 17, 2018 at 11:17 AM Dave Hansen <dave.hansen@intel.com> wrote:
> >
> > On 12/17/18 11:12 AM, Andy Lutomirski wrote:
> > > So I'm not saying that you shouldn't do it the way you are now, but I
> > > do think that the changelog or at least some emails should explain
> > > *why* the enclave needs to keep a pointer to the creating process's
> > > mm.  And, if you do keep the current model, it would be nice to
> > > understand what happens if you do something awful like mremap()ing an
> > > enclave, or calling madvise on it, or otherwise abusing the vma.  Or
> > > doing fork(), for that matter.
> >
> > Yeah, the code is built to have one VMA and only one VMA per enclave.
> > You need to go over the origin of this restriction and what enforces this.
> 
> There is a sad historical reason that you may regret keeping this
> restriction.  There are plenty of pieces of code out there that think
> it's reasonable to spawn a subprocess by calling fork() and then
> execve().  (This is *not* a sensible thing to do.  One should use
> posix_spawn() or some CLONE_VM variant.  But even fairly recent
> posix_spawn() implementations will fork().  So the driver has to do
> *something* sensible on fork() or a bunch of things that use SGX
> unsuspectingly via, for example, PKCS #11, are going to be very sad.
> I suppose you could make enclaves just not show up in the fork()ed
> children, but then you have a different problem: creating an enclave
> and then doing daemon() won't work.
> 
> Yes, POSIX traditions are rather silly.

ATM enclave VMAs are not copied on fork. Not sure how you would
implement COW semantics with enclaves.

/Jarkko
