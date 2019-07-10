From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH 2/3] platform/x86/pcengines-apuv2: add legacy leds gpio
 definitions
Date: Wed, 10 Jul 2019 14:03:40 +0200
Message-ID: <e4583be44ddaa1453c0caea37d73d57d@dev.tdt.de>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-3-fe@dev.tdt.de>
 <bf9c82c3-bc6e-b701-afd4-b4e657cb09be@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bf9c82c3-bc6e-b701-afd4-b4e657cb09be@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 2019-07-08 21:42, Enrico Weigelt, metux IT consult wrote:
> On 04.07.19 11:02, Florian Eckert wrote:
>> Extend the apu2_leds definition to make the leds exportable via the
>> legacy gpio subsystem.
> 
> What for ? The gpios are bound to LED devices as that's exactly what
> they are: LEDs.

I have back ported your pcengines-apuv2 device and gpio-amd-fch GPIO 
driver to the kernel version 4.19 on OpenWrt.
If I compile and load this without the change no LEDs are visible in 
"/sys/class/leds"!

 From my point of view the connection between the GPIO and the LEDs 
subsystem is missing.
How should the LED subsystem know which GPIO to use?
If I add the change to the pcengines-apuv2 device then the LEDs will be 
visilbe under "/sys/class/leds"
and could be used, by OpenWrt userland.

Mybe I miss something.
