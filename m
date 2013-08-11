From: Martin Nordholts <enselic@gmail.com>
Subject: Re: [PATCH 0/1] Platform: x86: chromeos_laptop - convert to
 i2c_driver to handle i915 race
Date: Sun, 11 Aug 2013 21:54:50 +0200
Message-ID: <CAC-DJz+Q=O9hvj1QoaZkhSZ-e6ueUQHUuMntin=GYdLqwV0VtA@mail.gmail.com>
References: <1374163091-4750-1-git-send-email-enselic@gmail.com>
	<CANLzEksSsMY2pTYTfGzgntF-i_Kus+WeVPyNzW0U7APcGOv_5g@mail.gmail.com>
	<CAC-DJzL0VzDxCpsdwjugavBhcFUr+kv+iN9D-Yz_tasw=DF75Q@mail.gmail.com>
	<CANLzEkvi7PY7iO+kicCQZaSi7n6mn2JUC3hVVvPJN2LcCLnqKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLzEkvi7PY7iO+kicCQZaSi7n6mn2JUC3hVVvPJN2LcCLnqKw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benson Leung <bleung@chromium.org>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Olof Johansson <olof@lixom.net>, Yufeng Shen <miletus@chromium.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

2013/8/7 Benson Leung <bleung@chromium.org>
>
> If you get a chance, could you let me know if my deferred probe
> changes work well in your configuration?

I can confirm that your changes works, i.e. the touchpad and
touchscreen works directly after boot on my 32GB non-LTE Chromebook
Pixel. I applied the patches on a clean 3.11-rc4 tree using a
localmodconfig on Debian 7.1. I get this in dmesg --level err
(--notime) though

find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
find_i2c_adapter_num: i2c adapter i915 gmbus vga not found on system.
find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
find_i2c_adapter_num: i2c adapter i915 gmbus vga not found on system.
find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
find_i2c_adapter_num: i2c adapter i915 gmbus vga not found on system.
find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.

Personally I don't like getting error messages when the driver works
as designed. I would prefer to have priority lowered to 'notice' on
those.

Regards,
Martin
