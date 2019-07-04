From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/3] Update pcengines-apuv2 platform device
Date: Thu, 4 Jul 2019 17:26:45 +0300
Message-ID: <CAHp75VdHPRXgg6YsBM8uAfuM4CBs1HHn1condus6uW5BqC5COg@mail.gmail.com>
References: <20190704090205.19400-1-fe@dev.tdt.de> <CAHp75Vcocs=9AwX32ouOWFc+wAduCFv2DT_p4JYPUVV0BumjqA@mail.gmail.com>
 <e2c50449b498c796de8258fac0b0aba6@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e2c50449b498c796de8258fac0b0aba6@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 4, 2019 at 5:00 PM Florian Eckert <fe@dev.tdt.de> wrote:
>
> Hello Andy,
>
> thanks for feedback
>
> >> This patchset adds the following changes to this pcengines-apuv2
> >> platform device.
> >>
> >
> > Before doing anything to this driver, what is the plan for previously
> > upstreamed:
> >
> > drivers/leds/leds-apu.c
>
> I think we can remove the related APU2/APU3 code stuff from this driver.
> The recently added pcengines-apuv2 driver does *not* support the APU1.
> So I think we need the related APU1 stuff if we still want to support
> this board.

So, I would like to see some unification (since it's material for v5.4
cycle anyway, we have time).

> > arch/x86/platform/geode/alix.c
>
> I think this is not related because this is a different platform driver.
> Maybe we should move them to drivers/platform/x86?

You mentioned somewhere ALIx, can you elaborate if these are platforms
of the same family (PC engines)?

Looking into the code, I think we may unify all three under umbrella
of one driver if the above is true.


--
With Best Regards,
Andy Shevchenko
