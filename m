From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/3] Update pcengines-apuv2 platform device
Date: Thu, 4 Jul 2019 16:39:46 +0300
Message-ID: <CAHp75Vcocs=9AwX32ouOWFc+wAduCFv2DT_p4JYPUVV0BumjqA@mail.gmail.com>
References: <20190704090205.19400-1-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704090205.19400-1-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 4, 2019 at 12:02 PM Florian Eckert <fe@dev.tdt.de> wrote:
>
> This patchset adds the following changes to this pcengines-apuv2
> platform device.
>

Before doing anything to this driver, what is the plan for previously
upstreamed:

drivers/leds/leds-apu.c
arch/x86/platform/geode/alix.c

?

> * Add mpcie reset gpio export
> * Add legacy leds gpio definitions
> * Update gpio buttion definitions
>
> Florian Eckert (3):
>   platform/x86/pcengines-apuv2: add mpcie reset gpio export
>   platform/x86/pcengines-apuv2: add legacy leds gpio definitions
>   platform//x86/pcengines-apuv2: update gpio button definition
>
>  drivers/platform/x86/pcengines-apuv2.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
