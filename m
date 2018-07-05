From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v12 09/13] x86/sgx: EPC page allocation routines
Date: Thu, 5 Jul 2018 21:21:09 +0300
Message-ID: <20180705182109.GA5353@linux.intel.com>
References: <20180703182118.15024-1-jarkko.sakkinen@linux.intel.com>
 <20180703182118.15024-10-jarkko.sakkinen@linux.intel.com>
 <alpine.DEB.2.21.1807032216390.1816@nanos.tec.linutronix.de>
 <20180704042516.GA20409@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180704042516.GA20409@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, platform-driver-x86@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, linux-sgx@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 04, 2018 at 06:25:53AM +0200, Borislav Petkov wrote:
> ... and also, why are the other exports not EXPORT_SYMBOL_GPL?

I think they could just as well be that. No reason to use
EXPORT_SYMBOL() even if the source files are dual licensed.

/Jarkko
