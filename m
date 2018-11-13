From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 2 13 to the no_hw_rfkill
 DMI list
Date: Tue, 13 Nov 2018 14:52:50 +0200
Message-ID: <CAHp75VcDYDsFCO-s=-QqwC-U0_a42qELoGeStX0JCKr1HHEhZA@mail.gmail.com>
References: <20180516011741.18010-1-loic.wyn@gmail.com> <CAHp75VfY3nYgoUD3kjkZrMHzg2MZVNhgWiXJtxZAfpx_3ZGELQ@mail.gmail.com>
 <CAJxRB+DUzxf2dAwBSPP2FTLkwXHGM22WvUM0yrLGB4inPE3O5A@mail.gmail.com> <CAJxRB+C3xzL_m755ifoVzPugCg=bCbb-_mMOvkoH7iUvs3MV8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJxRB+C3xzL_m755ifoVzPugCg=bCbb-_mMOvkoH7iUvs3MV8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loic Wei-Yu-Neng <loic.wyn@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jiri Kosina <trivial@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: mailing lists

On Tue, Nov 13, 2018 at 5:21 AM Loic Wei-Yu-Neng <loic.wyn@gmail.com> wrote:

> Here you go,
> I attached my patch.

Thanks, though in a kernel we have not using attachments. Moreover,
since you forgot to include mailing lists the patchwork doesn't catch
this either.

Can you send it in a regular way, i.e. using `git format-patch ... &&
git send-email ...` ?

> I rebased it on top of today's latest:
> * 7946462d31a0 (HEAD -> test) ideapad-laptop: Add Lenovo Yoga 2 13 to the no_hw_rfkill DMI list
> * ccda4af0f4b9 (tag: v4.20-rc2, origin/master, origin/HEAD) Linux 4.20-rc2
> *   7a3765ed66d1 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
> |\
> | * 7236ead1b149 act_mirred: clear skb->tstamp on redirect
> | * a9049ff9214d net: dsa: mv88e6xxx: Fix clearing of stats counters
> | * 7ab412d33b4c tipc: fix link re-establish failure
> | * 63c82997f5c0 net: sched: cls_flower: validate nested enc_opts_policy to avoid warning
> | * fbd1d5245372 net: mvneta: correct typo
> | * 62230715fd24 flow_dissector: do not dissect l4 ports for fragments
> | * d02854dc1999 net: qualcomm: rmnet: Fix incorrect assignment of real_dev
>
> Loic
>
> On Fri, Oct 19, 2018 at 7:10 AM Loic Wei-Yu-Neng <loic.wyn@gmail.com> wrote:
>>
>> Hello Andy,
>> Sure let me do that.
>> Loic
>>
>> On Fri, Oct 19, 2018, 4:29 AM Andy Shevchenko <andy.shevchenko@gmail.com wrote:
>>>
>>> On Wed, May 16, 2018 at 4:18 AM Loic WEI YU NENG <loic.wyn@gmail.com> wrote:
>>> >
>>> > Some Lenovo ideapad models lack a physical rfkill switch.
>>> > On Lenovo models Yoga 2 13, ideapad-laptop would wrongly report all
>>> > radios as blocked by hardware which caused wireless network connections
>>> > to fail.
>>> > Add these models without an rfkill switch to the no_hw_rfkill list.
>>> >
>>>
>>> I'm very sorry, but by some unclear reason this patch is missed in the
>>> tree and in our patchwork.
>>> Does it still actual?
>>>
>>> May you resend it rebased on top of our for-next branch?
>>>
>>> > Signed-off-by: Loic WEI YU NENG <loic.wyn@gmail.com>
>>> > ---
>>> >  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>>> >  1 file changed, 7 insertions(+)
>>> >
>>> > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>>> > index 535199c9e6bc..0a843c4ca4fc 100644
>>> > --- a/drivers/platform/x86/ideapad-laptop.c
>>> > +++ b/drivers/platform/x86/ideapad-laptop.c
>>> > @@ -1114,6 +1114,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>>> >                         DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
>>> >                 },
>>> >         },
>>> > +       {
>>> > +               .ident = "Lenovo Yoga 2 13",
>>> > +               .matches = {
>>> > +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Yoga 2 13"),
>>> > +               },
>>> > +       },
>>> >         {
>>> >                 .ident = "Lenovo Yoga 3 1170 / 1470",
>>> >                 .matches = {
>>> > --
>>> > 2.17.0
>>> >
>>>
>>>
>>> --
>>> With Best Regards,
>>> Andy Shevchenko
>
>
>
> --
> Loic WEI YU NENG
> US phone: +1 408 218 2826
> FR phone: +33 674201069
> email: loic.wyn@gmail.com



-- 
With Best Regards,
Andy Shevchenko
