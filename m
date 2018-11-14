From: Loic Wei-Yu-Neng <loic.wyn@gmail.com>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 2 13 to the no_hw_rfkill
 DMI list
Date: Wed, 14 Nov 2018 07:15:07 -0800
Message-ID: <CAJxRB+BqibM3cyUvWH-3j6dPnF1EuYWyFhAvf5zRyf=-UraR_Q@mail.gmail.com>
References: <20181114022245.5798-1-loic.wyn@gmail.com> <20181114051603.GF7890@fedora.eng.vmware.com>
 <CAJxRB+DyrRWLTsW6fpOYuhS5W3iS3FATSRsoQTFx9ZJjzLv_dg@mail.gmail.com> <CAHp75VeE4ktOQ7AwL6v5Rend0EapEobYymyq2JW=D=nzM2qSbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeE4ktOQ7AwL6v5Rend0EapEobYymyq2JW=D=nzM2qSbQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, Jiri Kosina <trivial@kernel.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Sounds good,
I can me my patch here now:
https://patchwork.kernel.org/patch/10682745/
Loic

On Wed, Nov 14, 2018 at 2:52 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Nov 14, 2018 at 9:48 AM Loic Wei-Yu-Neng <loic.wyn@gmail.com> wrote:
> >
> > Hello Darren,
> > Yes, the current driver fails to match match my laptop. I need to add this patch to have wifi functional on my laptop.
> > Here is the dmidecode snippet from my laptop:
> >
> > Handle 0x0001, DMI type 1, 27 bytes
> > System Information
> > Manufacturer: LENOVO
> > Product Name: 20344
> > Version: Yoga 2 13
> > Serial Number: 3438666500284
> > UUID: 933A1748-ACE0-E311-A534-F8A9633129FA
> > Wake-up Type: Power Switch
> > SKU Number: LENOVO_MT_20344_BU_idea_FM_Yoga 2 13
> > Family: IDEAPAD
> >
>
> Yeah, it has slightly different Version string in your case.
>
> Since patchwork (*) still didn't catch your patch you need to resend
> with all maintainers and mailing lists included like Darren suggested.
>
> (*) patchwork is a database which is tracking patches and patch series
> that are communicated thru mailing lists. It makes maintainer's life
> easier and allow to keep a trail of what has been done and when.
> The web interface to our project is here
> https://patchwork.kernel.org/project/platform-driver-x86/list/
>
>
> > Loic
> >
> > On Tue, Nov 13, 2018 at 9:16 PM Darren Hart <dvhart@infradead.org> wrote:
> >>
> >> On Tue, Nov 13, 2018 at 06:22:45PM -0800, Loic WEI YU NENG wrote:
> >> > Some Lenovo ideapad models lack a physical rfkill switch.
> >> > On Lenovo models Yoga 2 13, ideapad-laptop would wrongly report all
> >> > radios as blocked by hardware which caused wireless network connections
> >> > to fail.
> >> > Add these models without an rfkill switch to the no_hw_rfkill list.
> >> >
> >> > Signed-off-by: Loic WEI YU NENG <loic.wyn@gmail.com>
> >>
> >> Thank you for the patch.
> >>
> >> In the future, please be sure to check MAINTAINERS and include the
> >> relevant lists, now Cc'd.
> >>
> >> I see this in the context of your patch, but can you confirm the current
> >> driver fails to match your system? It contains the following, which I
> >> would expect to match:
> >>
> >>                .ident = "Lenovo Yoga 2 11 / 13 / Pro",
> >>                 .matches = {
> >>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> >>                         DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
> >>                 },
> >>
> >> If it doesn't match, what does dmidecode report for SYS_VENDOR and
> >> BOARD_NAME on your system? Perhaps we need to make the above more
> >> generic.
> >>
> >> > ---
> >> >  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
> >> >  1 file changed, 7 insertions(+)
> >> >
> >> > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> >> > index b6489cba2985..1589dffab9fa 100644
> >> > --- a/drivers/platform/x86/ideapad-laptop.c
> >> > +++ b/drivers/platform/x86/ideapad-laptop.c
> >> > @@ -1188,6 +1188,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
> >> >                       DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
> >> >               },
> >> >       },
> >> > +     {
> >> > +             .ident = "Lenovo Yoga 2 13",
> >> > +             .matches = {
> >> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> >> > +                     DMI_MATCH(DMI_PRODUCT_VERSION, "Yoga 2 13"),
> >> > +             },
> >> > +     },
> >> >       {
> >> >               .ident = "Lenovo Yoga 3 1170 / 1470",
> >> >               .matches = {
> >> > --
> >> > 2.17.1
> >> >
> >> >
> >>
> >> --
> >> Darren Hart
> >> VMware Open Source Technology Center
> >
> >
> >
> > --
> > Loic WEI YU NENG
> > US phone: +1 408 218 2826
> > FR phone: +33 674201069
> > email: loic.wyn@gmail.com
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Loic WEI YU NENG
US phone: +1 408 218 2826
FR phone: +33 674201069
email: loic.wyn@gmail.com
