From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH 0/3] Update pcengines-apuv2 platform device
Date: Thu, 04 Jul 2019 16:00:35 +0200
Message-ID: <e2c50449b498c796de8258fac0b0aba6@dev.tdt.de>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <CAHp75Vcocs=9AwX32ouOWFc+wAduCFv2DT_p4JYPUVV0BumjqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vcocs=9AwX32ouOWFc+wAduCFv2DT_p4JYPUVV0BumjqA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Eckert.Florian@googlemail.com, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hello Andy,

thanks for feedback

>> This patchset adds the following changes to this pcengines-apuv2
>> platform device.
>> 
> 
> Before doing anything to this driver, what is the plan for previously
> upstreamed:
> 
> drivers/leds/leds-apu.c

I think we can remove the related APU2/APU3 code stuff from this driver.
The recently added pcengines-apuv2 driver does *not* support the APU1.
So I think we need the related APU1 stuff if we still want to support 
this board.

> arch/x86/platform/geode/alix.c

I think this is not related because this is a different platform driver.
Maybe we should move them to drivers/platform/x86?

Regards

Florian
