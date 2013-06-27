From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/8] minnowboard: Add base platform driver for the MinnowBoard
Date: Thu, 27 Jun 2013 11:14:30 +0200
Message-ID: <CACRpkda8QGdoAvjsUs7Uu+ukUu7ST63g=H9arA7SS7ceWmMTaQ@mail.gmail.com>
References: <cover.1372211451.git.dvhart@linux.intel.com>
	<a459c0b97ea41148af901fc73dbeff98778c7419.1372211451.git.dvhart@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a459c0b97ea41148af901fc73dbeff98778c7419.1372211451.git.dvhart@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "peter.p.waskiewicz.jr" <peter.p.waskiewicz.jr@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, danders <danders@circuitco.com>, "vishal.l.verma" <vishal.l.verma@intel.com>, Matthew Garrett <matthew.garrett@nebula.com>, Grant Likely <grant.likely@linaro.org>, Richard Purdie <richard.purdie@linuxfoundation.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 26, 2013 at 3:53 AM, Darren Hart <dvhart@linux.intel.com> wrote:

> Provide a minimal public interface:
>         minnow_detect()
>         minnow_lvds_detect()
>         minnow_hwid()
>         minnow_phy_reset()

So instead of these calling drivers issueing gpio_request() themselves
to obtain a resource, they make a function call to this proxy that issue
gpio_request() for them.

This is generally not how we do things. A driver should request its
GPIO just as it requests its regulator or clock or IRQ line or anything
else. Centralizing resource handling is not a good idea IMO, it's better
that each driver request it's GPIO pin(s) and do the stuff it needs
with them.

This of course creates the problem of associating the GPIOs to a
driver and how it should look that up, which I guess ACPI can do,
isn't that what acpi_find_gpio() is for?

Yours,
Linus Walleij
