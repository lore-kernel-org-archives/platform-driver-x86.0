From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH] x86: czc-tablet: add driver that fixes the buttons on
 CZC P10T tablet
Date: Mon, 30 Jul 2018 07:20:53 +0200
Message-ID: <a9c40c79027177298d6a9c630a96ac5acedd2c5f.camel@v3.sk>
References: <20180721223630.24559-1-lkundrak@v3.sk>
         <CAHp75Vf0vzOxSawqLgvAOJLL2SP5brckzF+jeMhVxeo2U+cqmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vf0vzOxSawqLgvAOJLL2SP5brckzF+jeMhVxeo2U+cqmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi.

Many thanks for the response! Some replies inline.

On Sun, 2018-07-22 at 22:42 +0300, Andy Shevchenko wrote:
> On Sun, Jul 22, 2018 at 1:36 AM, Lubomir Rintel <lkundrak@v3.sk>
> wrote:
> > This driver switches the P10T tablet to "Android" mode, where the
> > Home
> > button sends a single sancode instead of a Windows-specific key
> > combination and the other button doesn't disable the Wi-Fi.
> >
> > The driver also supports the ViewSonic ViewPad 10 which is almost
> > identical
> > to P10T.
> >
> > Complementary hwdb patch with the scan code mapping:
> > https://github.com/systemd/systemd/commit/40a3078b.patch
>
> First of all, thanks for the driver.
>
> While I have several comments against style, the main one is about
> necessity to have this driver in the first place.
>
> > +/*
> > + * The device boots up in "Windows 7" mode, when the home button
> > sends a
> > + * Windows specific key sequence (Left Meta + D) and the second
> > button
> > + * sends an unknown one while also toggling the Radio Kill Switch.
> > + * This is a surprising behavior when the second button is labeled
> > "Back".
>
> I'm not sure switching to Android mode is what we want. Most of the
> laptops are trying to be kept compatible with Windows as much as
> possible (thus, for example, we utilize Windows Management
> Instrumentation for many of laptops and tablets).

Yes. On the other hand, this one is not really a laptop. It's a tablet
and Windows doesn't seem to be that well supported first-class citizen
here.

The versions of the tablet that ship with Windows seem to have the back
button labeled with a Wi-Fi button (Source: Internet) and the manual
states that the button is indeed used to disable wireless on those
models. This behavior is too confusing on the Android models.

> > + * The vendor-supplied Android-x86 build switches the device to a
> > "Android"
> > + * mode by writing value 0x63 to the I/O port 0x68. This just
> > seems to just
> > + * set bit 6 on address 0x96 in the EC region; switching the bit
> > directly
> > + * seems to achieve the same result. It uses a "p10t_switcher" to
> > do the
> > + * job. It doesn't seem to be able to do anything else, and no
> > other use
> > + * of the port 0x68 is known.
>
> Does it have it in ACPI as a method?

No. The relevant bit doesn't even have a name in the EmbeddedControl
region. I've done some poking around with the nearby bits of the EC,
but none of them seem to do anything relevant. (The very next one seems
to turn the key to enter though, it seems to be used by the AWY0001
so that the button could be used for wake from away mode or something...)

> How exectly it does this?

Via /dev/port.

> > + * In the Android mode, the home button sends just a single
> > scancode,
> > + * which can be handled in Linux userspace more reasonably and the
> > back
> > + * button only sends a scancode without toggling the kill switch.
> > + * The scancode can then be mapped either to Back or RF Kill
> > functionality
> > + * in userspace, depending on how the button is labeled on that
> > particular
> > + * model.
> > + */
> > +       outb(CZC_EC_ANDROID_KEYS, CZC_EC_EXTRA_PORT);
>
> This is basically "the driver". The question here, what prevents
> userspace to have few liner C-code to perform the same. IOW, why this
> is necessary to have in kernel space?

Yes. That, and the DMI match. What I'm concerned about is for any stock
Linux distro to work well on these machines. The current behavior is much
too frustrating.

I don't feel too well about a separate driver for this, but I had a
difficult time finding the right spot to do the switch. I thought udev
could do the match, but it doesn't seem to be the right place to access
hardware directly.

Perhaps it's not that terrible to have a separate driver for this.
It's easily disabled and doesn't do anything for people that don't have the
hardware.

Thank you
Lubo
