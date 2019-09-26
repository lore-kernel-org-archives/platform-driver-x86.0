From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH] x86/efi: Don't require non-blocking EFI callbacks
Date: Thu, 26 Sep 2019 17:47:47 +0200
Message-ID: <CAKv+Gu_j=Nb_Q92vVcqyE_FBos76ZG0=hGZwSNuG2sL1ZYsxXw@mail.gmail.com>
References: <20190926141234.8271-1-ross.lagerwall@citrix.com>
 <CAKv+Gu8ok=v6WaKWW1AmhPgf1-n7p=4h8Tkno9YNW6H8p4fg8w@mail.gmail.com> <be816ae1-b802-f477-20d0-16e5be15a2b8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <be816ae1-b802-f477-20d0-16e5be15a2b8@citrix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: linux-efi <linux-efi@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sai Praneeth <sai.praneeth.prakhya@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 26 Sep 2019 at 17:47, Ross Lagerwall <ross.lagerwall@citrix.com> wrote:
>
> On 9/26/19 4:29 PM, Ard Biesheuvel wrote:
> > On Thu, 26 Sep 2019 at 16:12, Ross Lagerwall <ross.lagerwall@citrix.com> wrote:
> >>
> >> If a backend does not implement non-blocking EFI operations, it implies
> >> that the normal operations are non-blocking.
> >
> > Is that documented anywhere?
>
> Sort of. From commit 6d80dba1c9fe "efi: Provide a non-blocking
> SetVariable() operation"
>
> """
> Introduce ->set_variable_nonblocking() for this use case. It is an
> optional EFI backend operation, and need only be implemented by those
> backends that usually acquire locks to serialize access to EFI
> variables, as is the case for virt_efi_set_variable() where we now grab
> the EFI runtime spinlock.
> """
>
> >
> >> Instead of crashing
> >> dereferencing a NULL pointer, fallback to the normal operations since it
> >> is safe to do so.
> >>
> >
> > I agree that crashing is never the right thing to do, but I wonder
> > whether we shouldn't just bail instead. If the provided default
> > operation is non-blocking, the platform can populate the function
> > pointer with a reference to the default implementation.
>
> If you would prefer it that platforms are always required to implement
> the non-blocking functions, then I will just send a simple patch fixing
> up the Xen implementation.
>

Yes, please, that sounds like a safer option to me.
