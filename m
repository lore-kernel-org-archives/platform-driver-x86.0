From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: your mail
Date: Mon, 11 May 2020 14:44:20 +0300
Message-ID: <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com>
References: <526351589195104@mail.yandex.com> <20200511113506.GB2062175@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200511113506.GB2062175-FZxXFokcWpatqXYlAKuG4QC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: jakub-FiUXBBwNs2Q@public.gmane.org, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: Hans

On Mon, May 11, 2020 at 2:38 PM Heikki Krogerus
<heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>
> +Andy
>
> Adding also the linux-usb mailing list.
>
> On Mon, May 11, 2020 at 01:06:18PM +0200, jakub-FiUXBBwNs2Q@public.gmane.org wrote:
> > Hello, I'm running Intel NUC10i3 with Ubuntu 20.04 on board. I have a problem
> > with cpu interrups causing issues with deeper CPU sleep and increased power
> > usage. Also load is always 1 even if machine has nothing to do.
> >
> > I made a reasearch and found that device named TPS6598x interrupts my CPU. This
> > device is related with USB and according to datasheet it's "USB Interface IC USB
> > Type-CG and USB PD controller power switch and high-speed multiplexer ". I have
> > nothing connected to NUC except power plug and ethernet cable.
> >
> > Screenshots: https://imgur.com/a/uw9NDCi
> >
> > How to solve this issue? Could you help me?
>
> My guess is that the IRQ resource is not correct for the PD
> controller causing you to see irq flood.
>
> The problem is that the ACPI device entry (the node) on this platform
> has 4 I2CSerialBus resources and 4 IRQ resources. The idea is that the
> single ACPI device entry can represent up to 4 USB PD controllers. The
> problem is that there is no way to know which IRQ resource belongs to
> which I2CSerialBus resource :-(.
>
> Andy, this is one of those multi-instantiate I2C slave devices with
> HID INT3515.
>
> The only solution I can think of is that we start maintaining DMI
> quirk table in drivers/platform/x86/i2c-multi-instantiate.c where we
> supply the correct i2c to irq resource mapping for every platform
> that has this device(s).

I would rather disable them and issue a firmware bug.
Vendors, including us, should do something sane about this.

> > Kernel version:
> >
> > Linux NUC 5.6.11-050611-generic #202005061022 SMP Wed May 6 10:27:04 UTC 2020
> > x86_64 x86_64 x86_64 GNU/Linux
> >
> > Bios version:
> > FNCML357 Version: 0039 Date: 3/12/2020

-- 
With Best Regards,
Andy Shevchenko
