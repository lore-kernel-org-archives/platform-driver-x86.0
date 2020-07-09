From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 0/3] platform/x86: dell-wmi: new keys
Date: Thu, 9 Jul 2020 22:29:42 +0300
Message-ID: <CAHp75VdEtHfGavFBaC9Y2=bzX5pAeLqnssBE1owudRv9pKDAXw@mail.gmail.com>
References: <cover.1591584631.git.y.linux@paritcher.com> <cover.1591811549.git.y.linux@paritcher.com>
 <7fb650f568b44eb78e37aa8a534a69d7@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7fb650f568b44eb78e37aa8a534a69d7@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, y.linux@paritcher.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 10, 2020 at 10:23 PM <Mario.Limonciello@dell.com> wrote:
>
> > -----Original Message-----
> > From: Y Paritcher <y.linux@paritcher.com>
> > Sent: Wednesday, June 10, 2020 12:57 PM
> > To: Pali Roh=C3=A1r
> > Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> > Matthew Garrett; Limonciello, Mario
> > Subject: [PATCH v4 0/3] platform/x86: dell-wmi: new keys
> >
> >
> > [EXTERNAL EMAIL]
> >
> > change since v3:
> >     No code changes.
> >     Update commit message to reflect info given by Mario at dell.
> >
> > Is there anything more i have to do for the patches that were reviewed
> > or will they be picked up by the maintainers?
> > Thanks
> >
> > Y Paritcher (3):
> >   platform/x86: dell-wmi: add new backlight events
> >   platform/x86: dell-wmi: add new keymap type 0x0012
> >   platform/x86: dell-wmi: add new dmi mapping for keycode 0xffff
> >
> >  drivers/platform/x86/dell-wmi.c | 28 +++++++++++++++++++++++++---
> >  1 file changed, 25 insertions(+), 3 deletions(-)
> >
> > --
> > 2.27.0
>
> Andy,
>
> The whole series looks good to me now.  You can put this on the patches
> when they're swooped up.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
>
> However I would like to note there was a comment that you had a direct qu=
estion
> asked by Pali that probably got lost in the thread.  This was on patch 3/=
3 on v3.
> I think it's worth answering as it could dictate a follow up patch to cha=
nge behavior.
>
> The summary of my argument which led to his is nested somewhere in the th=
read was that
> to most users this isn't useful since they can't act on it.  IE they can'=
t use something
> like setkeycodes and go on their merry way.  The user who could act on it=
 by coming
> to upstream and submitting questions and patches is more technical and ha=
ving them
> use dyndbg to turn on the messages about unknown shouldn't be a big deal.
>
> > I'm not sure, but I thought that
> > throwing warning or info message is the correct solution. Driver cannot
> > handle something, so it inform about it, instead of silently dropping
> > event. Same behavior I'm seeing in other kernel drivers.
>
> > But looks like that you and Mario have opposite opinion, that kernel
> > should not log unknown events and rather should drop them.
>
> > I would like to have behavior of dell-wmi same as in other drivers for
> > consistency, so the best would be to ask WMI/platform maintainers. They
> > could have opinion how to handle these problem globally.
>
> > ...
>
> > Darren & Andy, could you please say something to this, what do you thin=
k
> > about silently dropping events/actions which are currently unknown for
> > dell-wmi driver? It is better to log them or not? Currently we are
> > logging them.
>
> Can you please advise which way you would rather have the subsystem go?

Seems Pali is okay with this version, so everything is settled I suppose.
I will add it to my queue, thanks!


--=20
With Best Regards,
Andy Shevchenko
