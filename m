From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 09/13] x86, sgx: basic
 routines for enclave page cache
Date: Mon, 25 Jun 2018 10:36:47 +0300
Message-ID: <208b7c272ca4a5f01299ec6c89f57b2b00b7866d.camel@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
         <78982a32-c589-48e2-9a83-fd36903b5588@fortanix.com>
         <CALCETrXTjjiARJf=pc3mqrot3_VDoQtZM=PJg=fpg=P1x63jyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALCETrXTjjiARJf=pc3mqrot3_VDoQtZM=PJg=fpg=P1x63jyw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>, Jethro Beekman <jethro@fortanix.com>
Cc: X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, npmccallum@redhat.com, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, intel-sgx-kernel-dev@lists.01.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2018-06-18 at 14:33 -0700, Andy Lutomirski wrote:
> When KVM host support goes in, even this won't be good enough if we
> want to allow passthrough access to the MSRs because we will no longer
> be able to guarantee that all zeros is invalid.  Instead we'd need an
> actual flag saying that the cache is invalid.

I'm not sure if I understood this part. If it was pass-through, and
there was a flag, how that flag in the host would get updated?

/Jarkko
