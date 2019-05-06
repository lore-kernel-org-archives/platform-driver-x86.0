From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: fix spelling mistake
 "capabilites" -> "capabilities"
Date: Mon, 6 May 2019 11:49:48 +0300
Message-ID: <CAHp75VcXGyEGYXrswuLHecpvqqR1dfi94Nhu3dhhkex9OVJCfw@mail.gmail.com>
References: <20190415125204.7386-1-colin.king@canonical.com> <520f6626-246b-005f-53ef-df2f75a89cd9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <520f6626-246b-005f-53ef-df2f75a89cd9@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: Colin King <colin.king@canonical.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 16, 2019 at 9:58 AM Mukesh Ojha <mojha@codeaurora.org> wrote:
>
>
> On 4/15/2019 6:22 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There is a spelling mistake in a module parameter description. Fix it.
> >

Pushed to my review and testing queue, thanks!

> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
>
> Cheers,
> -Mukesh
>
> > ---
> >   drivers/platform/x86/thinkpad_acpi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> > index 57d9ae9d8e56..9192b686e9a6 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -10269,7 +10269,7 @@ MODULE_PARM_DESC(volume_mode,
> >
> >   module_param_named(volume_capabilities, volume_capabilities, uint, 0444);
> >   MODULE_PARM_DESC(volume_capabilities,
> > -              "Selects the mixer capabilites: 0=auto, 1=volume and mute, 2=mute only");
> > +              "Selects the mixer capabilities: 0=auto, 1=volume and mute, 2=mute only");
> >
> >   module_param_named(volume_control, volume_control_allowed, bool, 0444);
> >   MODULE_PARM_DESC(volume_control,



-- 
With Best Regards,
Andy Shevchenko
