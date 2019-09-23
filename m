From: Gabriel C <nix.or.die@gmail.com>
Subject: acer_wmi: Unknown function(s) on Acer Nitro 5 (AN515-43-R8BF)
Date: Mon, 23 Sep 2019 21:45:05 +0200
Message-ID: <CAEJqkgjSes-4bSKbyfbNhXfcQwdEMzp8X4f72_SS=NpBoBtWmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, "Lee, Chun-Yi" <jlee@suse.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi guys,

I noticed some warning in dmesg on this Laptop.

Fn+right, Fn+left is BrightnessDown/Up and produce the following warning:

acer_wmi: Unknown function number - 4 - 0

The brightness has some other issue on this Laptop but not sure
who to blame on this. Probably amdgpu.?

/sys/class/backlight/amdgpu_bl1/brightness <-> actual_brightness
seems to mismatch.  EG: when brightness is 0 actual_brightness is still 5140.

Unplugging the AC gives the following warning:

acer_wmi: Unknown function number - 8 - 0

When plugging the AC back I see;

acer_wmi: Unknown function number - 8 - 1.

I uploaded a dump of the acpi tables and dmidecode of the box.

https://www.frugalware.org/~crazy/nitro5/ACPI
https://www.frugalware.org/~crazy/nitro5/DMI

Please let me know if you need any other informations.

Best Regards,

Gabriel C
