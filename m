From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Tue, 18 Dec 2018 03:40:08 +0200
Message-ID: <20181218014008.GD333@linux.intel.com>
References: <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <beea8ad3-a607-5478-ad87-b8dd33e86146@intel.com>
 <20181217194913.GD29785@linux.intel.com>
 <16fdd37a-b9cc-1045-1497-2cfff6af176a@intel.com>
 <CALCETrUhVDxMAtpyn5ahsTFwhJkzWxKa5Ur8q4FuVaKLmSyYHQ@mail.gmail.com>
 <826f6a5a-fdf6-e7e5-d2d8-bcdc57c016fe@intel.com>
 <CALCETrX_7g+GYj2hHvFjodPw_ryrVTQdF2M3p+KYNTBUOhg-8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrX_7g+GYj2hHvFjodPw_ryrVTQdF2M3p+KYNTBUOhg-8g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Sean Christopherson <sean.j.christopherson@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 17, 2018 at 12:10:17PM -0800, Andy Lutomirski wrote:
> On Mon, Dec 17, 2018 at 12:03 PM Dave Hansen <dave.hansen@intel.com> wrote:
> >
> > On 12/17/18 11:55 AM, Andy Lutomirski wrote:
> > >> You're effectively rebuilding reverse-mapping infrastructure here.  It's
> > >> a frequent thing for the core VM to need to go from 'struct page' back
> > >> to the page tables mapping it.  For that we go (logically)
> > >> page->{anon_vma,mapping}->vma->vm_mm->pagetable.
> > > This is a bit outside my expertise here, but doesn't
> > > unmap_mapping_range() do exactly what SGX wants?
> >
> > There's no 'struct page' for enclave memory as it stands.  That means no
> > page cache, and that means there's no 'struct address_space *mapping' in
> > the first place.
> >
> > Basically, the choice was made a long time ago to have SGX's memory
> > management live outside the core VM.  I've waffled back and forth on it,
> > but I do still think this is the right way to do it.
> 
> AFAICS a lack of struct page isn't a problem.  The core code seems to
> understand that address_space objects might cover non-struct-page
> memory.  Morally, enclave memory is a lot like hot-unpluggable PCI
> space.

I'm fine using it if it works. Will try it for v19.

/Jarkko
