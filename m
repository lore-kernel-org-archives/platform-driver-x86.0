From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Mon, 27 Nov 2017 11:41:48 -0800
Message-ID: <1511811708.9392.51.camel@intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
         <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
         <20171117214310.GB25974@fury> <alpine.DEB.2.20.1711180023440.2186@nanos>
         <20171120230843.ozqhqhj5h3uuds3f@linux.intel.com>
         <1511802219.9392.44.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511802219.9392.44.camel@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?Q?Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, kvm@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

+ Cc: KVM, Paolo and Radim

On Mon, 2017-11-27 at 09:03 -0800, Sean Christopherson wrote:
> On Tue, 2017-11-21 at 01:08 +0200, Jarkko Sakkinen wrote:
> > 
> > On Sat, Nov 18, 2017 at 12:34:33AM +0100, Thomas Gleixner wrote:
> > > 
> > > 
> > > This is architecural. From the cursory read of that series it seems there
> > > are two parts to it:
> > > 
> > >   1) The actual core handling, which should be in arch/x86 because that
> > >      hardly qualifies as a 'platform' device driver.
> > > 
> > >   2) The user space interface, which can be separated out perhaps.
> > > 
> > > I don't know how intertwingled they are, but that's hard to tell from the
> > > actual patches w/o doing a deep inspection. Jarkko should be able to
> > > answer
> > > that.
> > > 
> > > Thanks,
> > > 
> > > 	tglx
> > Darren, tglx,
> > 
> > You can leave user space device as separate module as sgx_ioctl.c merely
> > calls stuff that I have inside sgx_encl.c. VMA creation is bound to file
> > operations.
> > 
> > My questions would be:
> > 
> > 1. What is your recommendation on the deployment under arch/x86?
> > 2. Which parts should be compilable as a LKM? Only the user interface
> >    or both parts?
> > 
> > /Jarkko
> To enable KVM and a cgroup for EPC accounting, at a minimum arch/x86 needs to
> manage the EPC pages (alloc/free/lrus/reclaim/etc...) and LE hash MSRs.  IMO,
> ideally everything else would be left in the device driver, e.g. anything
> involving ENCLS.  Keeping the majority of the driver out of arch/x86 minimizes
> the footprint in arch/x86 and thereby the size of KVM's dependency required to
> virtualize SGX, and allows the various SGX pieces, e.g. arch, driver and KVM,
> to evolve more independently.
> 
> Preferably the arch/x86 code would not be a loadable module, e.g. to simplify
> KVM support.
> 
> I have a branch based on Jarkko's patches (I believe it's up-to-date with v5)
> that implements what I described.  I'd be happy to send RFC patches if that
> would help.
> 
> 
> Branches for those interested:
> 
> https://github.com/sean-jc/linux.git sgx/arch   - move core EPC to arch/x86
> https://github.com/sean-jc/linux.git sgx/kvm    - KVM support for SGX
> https://github.com/sean-jc/linux.git sgx/lc     - KVM support for Launch
> Control
> https://github.com/sean-jc/linux.git sgx/cgroup - EPC cgroup
> 
> 
> branch relationships:
> 
>     Jarkko's patches
>             |
>             |
>          sgx/arch
>         /        \
>      sgx/kvm    sgx/cgroup
>       /
>    sgx/lc
