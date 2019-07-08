From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] platform/x86: Fix PCENGINES_APU2 Kconfig warning
Date: Mon, 8 Jul 2019 12:43:24 +0200
Message-ID: <603661e6-8694-4787-6cee-61cc6ba61fc2@metux.net>
References: <20190704062725.50400-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704062725.50400-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, dvhart@infradead.org, andy@infradead.org, linus.walleij@linaro.org, rdunlap@infradead.org, info@metux.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 04.07.19 08:27, YueHaibing wrote:
> Fix Kconfig warning for PCENGINES_APU2 symbol:
> 
> WARNING: unmet direct dependencies detected for GPIO_AMD_FCH
>   Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
> 
> WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
>   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
> 
> Add GPIOLIB dependency to fix it.

hmm, I'm not really happy w/ the kernel config system at that point:

If the select on the gpio driver would just subsequently enable gpiolib,
everything would be fine. But that contradicts how subsystems are
currently handled - you first have to enable gpio subsystem before
choosing anything that depends on it :(

Could it make sense to refactor gpiolib in a way that pieces directly
needed by gpio consumers or drivers (hmm, perhaps have separate
dependency symbols for consumer vs driver) can be selected directly,
even if the big gpio subsystem knob is disabled ? (but the other things
like userland interfaces would remain disabled) ?

OTOH, for this particular patch:

Ack-By: Enrico Weigelt <info@metux.net>


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
