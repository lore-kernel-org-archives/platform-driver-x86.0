From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86/pcengines-apuv2: add mpcie reset gpio export
Date: Thu, 1 Aug 2019 18:01:30 +0300
Message-ID: <CAHp75VfC+XhXDUe0NzoYRP9HTFPPKkV78JRMQXFskWaLeYD0PQ@mail.gmail.com>
References: <20190726062115.16231-1-fe@dev.tdt.de> <d35c844e-4202-9710-dbe6-f10bebf75e3a@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d35c844e-4202-9710-dbe6-f10bebf75e3a@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 26, 2019 at 1:50 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 26.07.19 08:21, Florian Eckert wrote:
> > On APUx we have also mpcie2/mpcie3 reset pins. To make it possible to reset
> > the ports from the userspace, add the definition to this platform
> > device. The gpio can then be exported by the legancy gpio subsystem to
> > toggle the mpcie reset pin.
> >
> > Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> > ---
> >
> > v2:
> >    Noting changed for this patch. Only resend because other patches of
> >    the series where dropped or updated and resend by other people
> >
> >   drivers/platform/x86/pcengines-apuv2.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> > index c1ca931e1fab..f6d8ed100cab 100644
> > --- a/drivers/platform/x86/pcengines-apuv2.c
> > +++ b/drivers/platform/x86/pcengines-apuv2.c
> > @@ -32,6 +32,8 @@
> >   #define APU2_GPIO_REG_LED3          AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
> >   #define APU2_GPIO_REG_MODESW                AMD_FCH_GPIO_REG_GPIO32_GE1
> >   #define APU2_GPIO_REG_SIMSWAP               AMD_FCH_GPIO_REG_GPIO33_GE2
> > +#define APU2_GPIO_REG_MPCIE2         AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
> > +#define APU2_GPIO_REG_MPCIE3         AMD_FCH_GPIO_REG_GPIO51
> >
> >   /* order in which the gpio lines are defined in the register list */
> >   #define APU2_GPIO_LINE_LED1         0
> > @@ -39,6 +41,8 @@
> >   #define APU2_GPIO_LINE_LED3         2
> >   #define APU2_GPIO_LINE_MODESW               3
> >   #define APU2_GPIO_LINE_SIMSWAP              4
> > +#define APU2_GPIO_LINE_MPCIE2                5
> > +#define APU2_GPIO_LINE_MPCIE3                6
> >
> >   /* gpio device */
> >
> > @@ -48,6 +52,8 @@ static int apu2_gpio_regs[] = {
> >       [APU2_GPIO_LINE_LED3]           = APU2_GPIO_REG_LED3,
> >       [APU2_GPIO_LINE_MODESW]         = APU2_GPIO_REG_MODESW,
> >       [APU2_GPIO_LINE_SIMSWAP]        = APU2_GPIO_REG_SIMSWAP,
> > +     [APU2_GPIO_LINE_MPCIE2]         = APU2_GPIO_REG_MPCIE2,
> > +     [APU2_GPIO_LINE_MPCIE3]         = APU2_GPIO_REG_MPCIE3,
> >   };
> >
> >   static const char * const apu2_gpio_names[] = {
> > @@ -56,6 +62,8 @@ static const char * const apu2_gpio_names[] = {
> >       [APU2_GPIO_LINE_LED3]           = "front-led3",
> >       [APU2_GPIO_LINE_MODESW]         = "front-button",
> >       [APU2_GPIO_LINE_SIMSWAP]        = "simswap",
> > +     [APU2_GPIO_LINE_MPCIE2]         = "mpcie2_reset",
> > +     [APU2_GPIO_LINE_MPCIE3]         = "mpcie3_reset",
> >   };
> >
> >   static const struct amd_fch_gpio_pdata board_apu2 = {
> >
>
> Acked-by: Enrico Weigelt <info@metux.net>

Applied, thanks!

>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287



-- 
With Best Regards,
Andy Shevchenko
