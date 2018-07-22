From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] x86: czc-tablet: add driver that fixes the buttons on CZC
 P10T tablet
Date: Sun, 22 Jul 2018 22:42:16 +0300
Message-ID: <CAHp75Vf0vzOxSawqLgvAOJLL2SP5brckzF+jeMhVxeo2U+cqmw@mail.gmail.com>
References: <20180721223630.24559-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180721223630.24559-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jul 22, 2018 at 1:36 AM, Lubomir Rintel <lkundrak@v3.sk> wrote:
> This driver switches the P10T tablet to "Android" mode, where the Home
> button sends a single sancode instead of a Windows-specific key
> combination and the other button doesn't disable the Wi-Fi.
>
> The driver also supports the ViewSonic ViewPad 10 which is almost identical
> to P10T.
>
> Complementary hwdb patch with the scan code mapping:
> https://github.com/systemd/systemd/commit/40a3078b.patch

First of all, thanks for the driver.

While I have several comments against style, the main one is about
necessity to have this driver in the first place.

> +/*
> + * The device boots up in "Windows 7" mode, when the home button sends a
> + * Windows specific key sequence (Left Meta + D) and the second button
> + * sends an unknown one while also toggling the Radio Kill Switch.
> + * This is a surprising behavior when the second button is labeled "Back".

I'm not sure switching to Android mode is what we want. Most of the
laptops are trying to be kept compatible with Windows as much as
possible (thus, for example, we utilize Windows Management
Instrumentation for many of laptops and tablets).

> + * The vendor-supplied Android-x86 build switches the device to a "Android"
> + * mode by writing value 0x63 to the I/O port 0x68. This just seems to just
> + * set bit 6 on address 0x96 in the EC region; switching the bit directly
> + * seems to achieve the same result. It uses a "p10t_switcher" to do the
> + * job. It doesn't seem to be able to do anything else, and no other use
> + * of the port 0x68 is known.

Does it have it in ACPI as a method? How exectly it does this?

> + * In the Android mode, the home button sends just a single scancode,
> + * which can be handled in Linux userspace more reasonably and the back
> + * button only sends a scancode without toggling the kill switch.
> + * The scancode can then be mapped either to Back or RF Kill functionality
> + * in userspace, depending on how the button is labeled on that particular
> + * model.
> + */

> +       outb(CZC_EC_ANDROID_KEYS, CZC_EC_EXTRA_PORT);

This is basically "the driver". The question here, what prevents
userspace to have few liner C-code to perform the same. IOW, why this
is necessary to have in kernel space?

-- 
With Best Regards,
Andy Shevchenko
