From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v13 07/13] x86/sgx: Add data structures for tracking the
 EPC pages
Date: Tue, 4 Sep 2018 10:49:14 -0700
Message-ID: <20180904174914.GA5690@linux.intel.com>
References: <20180827185507.17087-1-jarkko.sakkinen@linux.intel.com>
 <20180827185507.17087-8-jarkko.sakkinen@linux.intel.com>
 <CAHp75VcjKkJR4_H-acbVm3BwA4tVR8gUtkg9STqOK2UG20Tvgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcjKkJR4_H-acbVm3BwA4tVR8gUtkg9STqOK2UG20Tvgg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, linux-sgx@vger.kernel.org, serge.ayoun@intel.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, suresh.b.siddha@intel.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 03, 2018 at 05:41:53PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 27, 2018 at 9:58 PM Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> 
> > +       va = ioremap_cache(addr, size);
> > +       if (!va)
> > +               return -ENOMEM;
> 
> I'm not sure this is a right API. Do we operate with memory? Does it
> have I/O side effects?
> If no, memremap() would be better to use.

Preserving __iomem is desirable.  There aren't side effects per se,
but direct non-enclave accesses to the EPC get abort page semantics so
the kernel shouldn't be directly dereferencing a pointer to the EPC.
Though by that argument, sgx_epc_bank.va, sgx_epc_addr's return and
all ENCLS helpers should be tagged __iomem.

For documentation purposes, maybe it would be better to use __private
or "#define __sgx_epc __iomem" and use that?
