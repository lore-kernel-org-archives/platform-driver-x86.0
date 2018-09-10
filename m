From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v13 11/13] platform/x86: Intel SGX driver
Date: Mon, 10 Sep 2018 21:37:44 +0300
Message-ID: <20180910183744.GB20225@linux.intel.com>
References: <20180827185507.17087-1-jarkko.sakkinen@linux.intel.com>
 <20180827185507.17087-12-jarkko.sakkinen@linux.intel.com>
 <CAHp75VcqKunkHYNdd287_F7APHwYr7K9QD2PVCkqBqJWG2_E-g@mail.gmail.com>
 <20180905173355.GE11368@linux.intel.com>
 <CAHp75Vc2SZUfRnBPZ9xJ_B=KJL7yK9hqRZiFOTswn0AzjnLD1A@mail.gmail.com>
 <20180906092100.GA27302@linux.intel.com>
 <CANiq72kpY1y2aPH+GMi8mWZdttfdYJ3wk0cvE_qVD97vdvTJbQ@mail.gmail.com>
 <5137f85388e26ea1ed46b34901b0f18540aee7cb.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5137f85388e26ea1ed46b34901b0f18540aee7cb.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, linux-sgx@vger.kernel.org, serge.ayoun@intel.com, shay.katz-zamir@intel.com, "Siddha, Suresh B" <suresh.b.siddha@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 06, 2018 at 05:50:01PM -0700, Joe Perches wrote:
> On Thu, 2018-09-06 at 19:35 +0200, Miguel Ojeda wrote:
> > > Which one is right and why the kernel tree is polluted with C99-headers
> > > when they do not pass checkpatch.pl?
> 
> checkpatch ignores c99 headers since 2016.

For headers I get these warnings:

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#243: FILE: drivers/platform/x86/intel_sgx/sgx.h:1:
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

/Jarkko
