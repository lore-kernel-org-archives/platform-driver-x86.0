From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Stable branch dell-laptop-changes-for-4.12
Date: Sun, 26 Mar 2017 10:25:46 +0200
Message-ID: <cd0eda0b-b4f0-ff2a-4137-7f12a9fb7099@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Sender: linux-leds-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy, Darren,

I've created stable branch dell-laptop-changes-for-4.12

in the repository

git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

for you to merge due to the conflict in linux-next:

Today's linux-next merge of the leds tree got a conflict in:

  drivers/platform/x86/dell-laptop.c

between commit:

  573eedacfba3 ("platform/x86: dell-*: Call new led hw_changed API on
kbd brightness change")

from the drivers-x86 tree and commit:

  44319ab7e0ed ("platform/x86: dell-laptop: import
dell_micmute_led_set() from drivers/leds/dell-led.c")

from the leds tree.

Thanks,
Jacek Anaszewski
