From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 2/3] platform/x86/pcengines-apuv2: add legacy leds gpio
 definitions
Date: Mon, 8 Jul 2019 21:42:50 +0200
Message-ID: <bf9c82c3-bc6e-b701-afd4-b4e657cb09be@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-3-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704090205.19400-3-fe@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 04.07.19 11:02, Florian Eckert wrote:
> Extend the apu2_leds definition to make the leds exportable via the
> legacy gpio subsystem. 

What for ? The gpios are bound to LED devices as that's exactly what
they are: LEDs.

> Without this change the leds are not visible
> under "/sys/class/leds" and could not be configured.

How so ? (I'm using exactly that all the day ...)


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
