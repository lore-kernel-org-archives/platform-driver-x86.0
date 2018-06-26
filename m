From: Nathaniel McCallum <npmccallum@redhat.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Tue, 26 Jun 2018 11:01:34 -0400
Message-ID: <CAOASepOq52tmDx5ycd6hDhKg9_+beZ0Y8zoVeOBbJu=LX8_2mA@mail.gmail.com>
References: <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com>
 <CALCETrW3aZJMMm1GqgPm-cOD3p7JvKxLj7j85KJwfNW2iHTj4A@mail.gmail.com>
 <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
 <20180611115255.GC22164@hmswarspite.think-freely.org> <CALCETrX6SD0ThNzpjkbXd7CbNTguzqiQhWMomGK+tocx_DE9XQ@mail.gmail.com>
 <20180612174535.GE19168@hmswarspite.think-freely.org> <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
 <CAOASepN9t3jF4ajfKLG_odTZddOvXjY_DqLQhRPWhJ-imtjkgg@mail.gmail.com>
 <e3f8e5b9-aa1e-20da-37ac-3c3caafa66bc@fortanix.com> <b5c81504-83cd-8150-ebe4-41355026590f@fortanix.com>
 <20180620210158.GA24328@linux.intel.com> <CAOASepN1AtgEhobJUVh=rcsQ_Qt8ujoEhnivV-29y=-AiyJwZQ@mail.gmail.com>
 <73b7e4e3712074b73f4ac8211699d24dfdced6bf.camel@linux.intel.com>
 <CALCETrXos3b-VJxLCb1nwP1x2s5jiDmuQDWVahTVdXGxhqqsDw@mail.gmail.com> <689641dc26a91f7b4b6bfdb763fec90bf7c3e984.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <689641dc26a91f7b4b6bfdb763fec90bf7c3e984.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jarkko.sakkinen@linux.intel.com
Cc: luto@kernel.org, sean.j.christopherson@intel.com, jethro@fortanix.com, Neil Horman <nhorman@redhat.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, intel-sgx-kernel-dev@lists.01.org, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, Peter Jones <pjones@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 26, 2018 at 4:44 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Mon, 2018-06-25 at 08:45 -0700, Andy Lutomirski wrote:
> > I'm personally rather strongly in favor of the vastly simpler model in
> > which we first merge SGX without LE support at all.  Instead we use
> > the approach where we just twiddle the MSRs to launch normal enclaves
> > without an init token at all, which is probably considerably faster
> > and will remove several thousand lines of code.  If and when a bona
> > fide use case for LE support shows up, we can work out the details and
> > merge it.
>
> Andy, I was going to propose exactly the same :-)
>
> We can upstream SGX that supports only unlocked MSRs and that does
> not preventing to upstream support for locked MSRs later. Even if
> we had a consensus for locked MSRs, making two milestones for the
> mainline would make perfect sense.
>
> I came into this conclusion last night because all the other review
> comments not concerning the launch control are easily sorted out.

+1. Let's do this and get it merged without launch enclave support
lockdown now. We can revisit this once we have hands on experience
with the technology.
