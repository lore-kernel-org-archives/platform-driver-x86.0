From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 0/3] Update pcengines-apuv2 platform device
Date: Mon, 8 Jul 2019 21:45:45 +0200
Message-ID: <4b43316c-3e05-0ce9-3ada-db22996205b9@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <CAHp75Vcocs=9AwX32ouOWFc+wAduCFv2DT_p4JYPUVV0BumjqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vcocs=9AwX32ouOWFc+wAduCFv2DT_p4JYPUVV0BumjqA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 04.07.19 15:39, Andy Shevchenko wrote:
> On Thu, Jul 4, 2019 at 12:02 PM Florian Eckert <fe@dev.tdt.de> wrote:
>>
>> This patchset adds the following changes to this pcengines-apuv2
>> platform device.
>>
> 
> Before doing anything to this driver, what is the plan for previously
> upstreamed:
> 
> drivers/leds/leds-apu.c

Only supports the three front LEDs, nothing else. (we've got more gpios
that are not LEDs, eg. the front button, simsw, ...)

> arch/x86/platform/geode/alix.c

completely unrelated - very different chipset.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
