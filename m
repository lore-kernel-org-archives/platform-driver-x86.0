From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 11:55:09 -0800
Message-ID: <CALCETrUhVDxMAtpyn5ahsTFwhJkzWxKa5Ur8q4FuVaKLmSyYHQ@mail.gmail.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com> <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com> <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com> <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <beea8ad3-a607-5478-ad87-b8dd33e86146@intel.com> <20181217194913.GD29785@linux.intel.com>
 <16fdd37a-b9cc-1045-1497-2cfff6af176a@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16fdd37a-b9cc-1045-1497-2cfff6af176a@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Sean Christopherson <sean.j.christopherson@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, open list:X86 ARCHITECTURE (32-BIT AND 6
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 17, 2018 at 11:53 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 12/17/18 11:49 AM, Jarkko Sakkinen wrote:
> >> Yeah, the code is built to have one VMA and only one VMA per enclave.
> >> You need to go over the origin of this restriction and what enforces this.
> > It is before ECREATE but after that you can split it with mprotect().
> >
> > Lets take an example. I'm not sure how we would acquire mm efficiently
> > in sgx_encl_page_reclaim() otherwise than having it as a field in encl.
>
> You're effectively rebuilding reverse-mapping infrastructure here.  It's
> a frequent thing for the core VM to need to go from 'struct page' back
> to the page tables mapping it.  For that we go (logically)
> page->{anon_vma,mapping}->vma->vm_mm->pagetable.

This is a bit outside my expertise here, but doesn't
unmap_mapping_range() do exactly what SGX wants?
