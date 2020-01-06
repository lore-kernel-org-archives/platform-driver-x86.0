From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v10 00/10] efi/firmware/platform-x86: Add EFI embedded fw
 support
Date: Mon, 6 Jan 2020 21:35:05 +0000
Message-ID: <20200106213505.GW11244@42.do-not-panic.com>
References: <20191210115117.303935-1-hdegoede@redhat.com>
 <66f45932-756d-0bb0-d7a8-330d61785663@redhat.com>
 <CAKv+Gu_X+UM95MJJMjT69upL9zN3H9BnUkv8s9TjcpevANbYEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_X+UM95MJJMjT69upL9zN3H9BnUkv8s9TjcpevANbYEw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, the arch/x86 maintainers <x86@kernel.org>, platform-driver-x86@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 03, 2020 at 12:36:04PM +0100, Ard Biesheuvel wrote:
> On Fri, 3 Jan 2020 at 12:27, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi All,
> >
> > Since I send this out, efi-next has seen some changes causing the first
> > 2 patches to no longer cleanly apply. So it looks like we need to
> > merge this one bit at a time with immutable branches.
> >
> > Ard, the first 2 patches in this series should be merged through your
> > efi tree. AFAIK everyone is happy with them in their current state
> > so they are ready for merging. Can you create an immutable branch
> > with these 2 patches and merge that into your efi-next branch?
> >
> > Note if you do the immutable branch on 5.5-rc1 + just these 2 patches,
> > there will be a conflict when you merge this into efi-next, but it is
> > trivial to resolve.
> >
> 
> I will need to defer to Ingo here, as he usually applies the EFI
> changes piecemeal rather than merging my branches directly.
> 
> I'd be fine with just annotating the conflict in the pull request if
> it is trivial, though, but it is really up to Luis and Ingo to align
> here.

I don't have a tree, and firmware goes Greg's driver core tree so
actually its up to Greg and Ingo on how this gets merged. But it seems
you just have one issue to fix:

[PATCH v10 05/10] test_firmware: add support for firmware_request_platform

There is a few set of empty lines added and I had one comment on the
release of the firmware.

Other than this, I agree this seems ready to be merged.

  Luis
