From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Only Tell EC the OS will handle
 display hotkeys from asus_nb_wmi
Date: Tue, 11 Jun 2019 22:15:40 +0300
Message-ID: <CAHp75Ve8No6pKr0NiNxiQhLRSnJ=w6VW2zsLA2FV9VjqsvvMQA@mail.gmail.com>
References: <20190521062837.3887-1-hdegoede@redhat.com> <CAHp75Vf6qzq3O1qz481FRuT1MN2EZOV43FpoSCC-vqATzyRF8w@mail.gmail.com>
 <0018e660-c1d4-2c42-837f-ceb13d575b86@redhat.com> <41f5c7ff-20a3-ba6a-7ee3-2d3956d8b5a8@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <41f5c7ff-20a3-ba6a-7ee3-2d3956d8b5a8@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 5, 2019 at 9:15 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 28-05-19 15:37, Hans de Goede wrote:
> > Hi,
> >
> > On 24-05-19 18:43, Andy Shevchenko wrote:
> >> On Tue, May 21, 2019 at 9:28 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>
> >>> Commit 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS will
> >>> handle the display off hotkey") causes the backlight to be permanently off
> >>> on various EeePC laptop models using the eeepc-wmi driver (Asus EeePC
> >>> 1015BX, Asus EeePC 1025C).
> >>>
> >>> The asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL) call added
> >>> by that commit is made conditional in this commit and only enabled in
> >>> the quirk_entry structs in the asus-nb-wmi driver fixing the broken
> >>> display / backlight on various EeePC laptop models.
> >>>
> >>
> >> Hmm... doesn't apply.
> >
> > That is likely because your review-andy branch contain a whole-bunch
> > of asus-wmi patches.
> >
> > Since this is a patch fixing a regression this should go to the fixes
> > branch. As the other patches so far are only in your review-andy branch
> > it is probably best to merge this patch to for-next + fixes first and
> > then rebase the set you have in review-andy on top, so that this can go
> > to fixes without getting a merge conflict when the rest of the patches
> > show up...
>
> Ping? This is a 5.x regression fix, as such it would be really good to
> get this into 5.2 and then cherry-picked into 5.y.z.
>

It doesn't apply to our fixes branch.

-- 
With Best Regards,
Andy Shevchenko
