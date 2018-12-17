From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 06:27:21 -0800
Message-ID: <20181217142721.GA12491@linux.intel.com>
References: <20181127085533.GA12247@wind.enjellic.com>
 <20181127164129.GB4170@linux.intel.com>
 <C11C9312-65BC-460A-8F9F-608E101AE5C1@amacapital.net>
 <20181128104941.GA23077@wind.enjellic.com>
 <20181128192228.GC9023@linux.intel.com>
 <20181210104908.GA23132@wind.enjellic.com>
 <20181212180036.GC6333@linux.intel.com>
 <20181214235917.GA14049@wind.enjellic.com>
 <20181215000627.GA5799@linux.intel.com>
 <20181215232231.GA22773@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181215232231.GA22773@wind.enjellic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. Greg" <greg@enjellic.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andy Lutomirski <luto@amacapital.net>, Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Dec 15, 2018 at 05:22:31PM -0600, Dr. Greg wrote:
> On Fri, Dec 14, 2018 at 04:06:27PM -0800, Sean Christopherson wrote:
> 
> Good afternoon, I hope the weekend is going well for everyone.
> 
> > On Fri, Dec 14, 2018 at 05:59:17PM -0600, Dr. Greg wrote:
> > > On Wed, Dec 12, 2018 at 08:00:36PM +0200, Jarkko Sakkinen wrote:
> > > 
> > > Good evening, I hope the week has gone well for everyone.
> > > 
> > > > On Mon, Dec 10, 2018 at 04:49:08AM -0600, Dr. Greg wrote:
> > > > > In the meantime, I wanted to confirm that your jarkko-sgx/master
> > > > > branch contains the proposed driver that is headed upstream.
> > > > > Before adding the SFLC patches we thought it best to run the
> > > > > driver through some testing in order to verify that any problems
> > > > > we generated where attributable to our work and not the base
> > > > > driver.
> > > >
> > > > The master branch is by definition unstable at the moment i.e. it
> > > > can sometimes (not often) contain unfinished changes. Use next for
> > > > testing.  I update next when I consider the master contents "stable
> > > > enough".
> > > 
> > > I noticed in the last day or so that you appeared to sync
> > > jarkko-sgx/master with jarkko-sgx/next, so I checked out a local
> > > branch against jarkko-sgx/next and ran it against our unit tests.
> > > Based on what we are seeing the driver is still experiencing issues
> > > with initialization of a non-trivial enclave.
> 
> > master branch is broken, looks like the VMA code Jarkko is reworking is
> > buggy.  I should be able to help debug this next week.
> > 
> > [  504.149548] ------------[ cut here ]------------
> > [  504.149550] kernel BUG at /home/sean/go/src/kernel.org/linux/mm/mmap.c:669!
> 
> Rodger, dodger.
> 
> Let us know when you think you have something working pushed up into
> one of the branches and we will put it on the bench here in the lab
> and see what our runtime is able to do with it.
> 
> BTW, your new vDSO work appears to be shaping up well.  Just out of
> curiosity though, how are you testing and validating the new vDSO
> based exception handler if it isn't possible to initialize and run an
> enclave with the new driver?

Cherry-pick the patches to a stable version of the driver, the vDSO code
doesn't use any of the SGX APIs.
