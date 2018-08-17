From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] platform/x86: acer-wmi: Silence "unsupported" message a
 bit
Date: Fri, 17 Aug 2018 21:22:34 +1000
Message-ID: <6a2826055a33cbca45c3e8e03b1b0935b9f1d1af.camel@kernel.crashing.org>
References: <7ccdc39d7e255547e851497ef9f449715b45f8bd.camel@kernel.crashing.org>
         <CAHp75Vd1ZZDJtASfFpr=eE+zaEiOxH3ohdSOe1aTcE3qEMd_QA@mail.gmail.com>
         <CAHp75VfjZe7XqJjv0CYFHXi95_v7R9B9E9eix+0xRwqn2tq6nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfjZe7XqJjv0CYFHXi95_v7R9B9E9eix+0xRwqn2tq6nQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2018-08-17 at 14:09 +0300, Andy Shevchenko wrote:
> On Fri, Aug 17, 2018 at 2:07 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Aug 16, 2018 at 2:27 AM, Benjamin Herrenschmidt
> > <benh@kernel.crashing.org> wrote:
> > > This driver prints that "Unsupported machine..." message on every boot on
> > > ThinkPad X1 Carbon laptops (and I assume a number of other systems), which
> > > causes graphical boots to "glitch" a bit and is rather annoying ...
> > > 
> > > Make it a pr_debug instead.
> > 
> > Thanks for the patch. Unfortunately it doesn't apply.
> > Please, check your mail clients and tools for formatting patch (it
> > produced at the end spaces instead of tabs)
> 
> No need to resend _this_ time. I have pushed to my review and testing queue.

Thanks, odd. Not sure what's going on with the latest evolution, it's
the second time it's done this. I'll try to investigate. Small patch
like that I tend to just copy/paste in an email in "preformat" style
;-)

Cheers,
Ben.
> 
> > > 
> > > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > ---
> > > 
> > > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> > > index 8952173dd380..7f7192e8fdab 100644
> > > --- a/drivers/platform/x86/acer-wmi.c
> > > +++ b/drivers/platform/x86/acer-wmi.c
> > > @@ -2216,7 +2216,7 @@ static int __init acer_wmi_init(void)
> > >         if (wmi_has_guid(AMW0_GUID1) &&
> > >             !dmi_check_system(amw0_whitelist) &&
> > >             quirks == &quirk_unknown) {
> > > -               pr_err("Unsupported machine has AMW0_GUID1, unable to load\n");
> > > +               pr_debug("Unsupported machine has AMW0_GUID1, unable to load\n");
> > >                 return -ENODEV;
> > >         }
> > > 
> > > 
> > 
> > 
> > 
> > --
> > With Best Regards,
> > Andy Shevchenko
> 
> 
> 
