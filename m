From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 09/13] x86, sgx: basic routines
 for enclave page cache
Date: Mon, 18 Jun 2018 14:33:18 -0700
Message-ID: <CALCETrXTjjiARJf=pc3mqrot3_VDoQtZM=PJg=fpg=P1x63jyw@mail.gmail.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com> <78982a32-c589-48e2-9a83-fd36903b5588@fortanix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78982a32-c589-48e2-9a83-fd36903b5588@fortanix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jethro Beekman <jethro@fortanix.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, npmccallum@redhat.com, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, intel-sgx-kernel-dev@lists.01.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 18, 2018 at 8:11 AM Jethro Beekman <jethro@fortanix.com> wrote:
>
> On 2018-06-08 10:09, Jarkko Sakkinen wrote:
> > +/*
> > + * Writing the LE hash MSRs is extraordinarily expensive, e.g.
> > + * 3-4x slower than normal MSRs, so we use a per-cpu cache to
> > + * track the last known value of the MSRs to avoid unnecessarily
> > + * writing the MSRs with the current value.  Because most Linux
> > + * kernels will use an LE that is signed with a non-Intel key,
>
> I don't think you can predict what most Linux kernels will be doing. I
> think not initializing the cache to the CPU's initial value is fine, but
> this particular argument shouldn't appear in the rationale.

No, it's quite predictable.  Upstream Linux will not permit the
Intel-signed LE to be used unless Intel makes some major changes to
the way the launch process works.

>
> > + * i.e. the first EINIT will need to write the MSRs regardless
> > + * of the cache, the cache is intentionally left uninitialized
> > + * during boot as initializing the cache would be pure overhead
> > + * for the majority of systems.

But the comment does need changes.  How about saying that the cache
either contains all zeros or matches the MSRs?  All zeros is used
when, for whatever reason, we choose not to care what the current MSR
values are.  Leaving it genuinely uninitialized would be incorrect.
(And, of course, we're assuming that no one ever needs the MSRs
zeroed.)

When KVM host support goes in, even this won't be good enough if we
want to allow passthrough access to the MSRs because we will no longer
be able to guarantee that all zeros is invalid.  Instead we'd need an
actual flag saying that the cache is invalid.

--Andy
