From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 2/3] platform/x86/pcengines-apuv2: add legacy leds gpio
 definitions
Date: Wed, 10 Jul 2019 15:07:12 +0200
Message-ID: <b029d90c-06b6-a261-5cde-8034de052d7c@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-3-fe@dev.tdt.de>
 <bf9c82c3-bc6e-b701-afd4-b4e657cb09be@metux.net>
 <e4583be44ddaa1453c0caea37d73d57d@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e4583be44ddaa1453c0caea37d73d57d@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 10.07.19 14:03, Florian Eckert wrote:

> I have back ported your pcengines-apuv2 device and gpio-amd-fch GPIO
> driver to the kernel version 4.19 on OpenWrt.
> If I compile and load this without the change no LEDs are visible in
> "/sys/class/leds"!

Maybe this old kernel just ignored all entries w/o gpio ID. Note that
these IDs are deprecated for quite a while and shouldn't be used in new
code anymore.

> From my point of view the connection between the GPIO and the LEDs
> subsystem is missing.
> How should the LED subsystem know which GPIO to use?

See gpiod_lookup_table.

> If I add the change to the pcengines-apuv2 device then the LEDs will be
> visilbe under "/sys/class/leds"
> and could be used, by OpenWrt userland.
> 
> Mybe I miss something.

Your patch is only valid for your backport onto this old kernel, not for
recent mainline.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
