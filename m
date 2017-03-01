From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 0/7] platform/x86: Notify userspace about hotkeys
 changing kbd-backlight brightness
Date: Thu, 2 Mar 2017 01:10:48 +0200
Message-ID: <CAHp75VfMyp9XzG6w0H60JhxpdRYfv5NuO-T9ZevPc4KT19fbGw@mail.gmail.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33834 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751055AbdCAXLh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2017 18:11:37 -0500
In-Reply-To: <20170209154417.19040-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Feb 9, 2017 at 5:44 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> Here is v8 of the platform drivers changes matching / using the new
> v8 LED subsys led_classdev_notify_brightness_hw_changed() functionality
> queued in -next.
>
> There have been some changes (and preparation patches added) compared
> to the previous versions since the new LED api requires the driver to
> only call led_classdev_notify_brightness_hw_changed() on hotkey triggered
> changes and the ACPI events indicating brightness changes also get
> triggered when setting the brightness to led_set_brightness (or sysfs).
>
> This series depends on the patch adding
> led_classdev_notify_brightness_hw_changed() to the LED subsystem,
> Jacek can you create a stable branch with just that patch which the
> platform/x86 platform maintainers can merge, so that they can apply
> this series ?

I briefly read the discussion and looks like I'll wait for v9 after
merge window is closed.

-- 
With Best Regards,
Andy Shevchenko
