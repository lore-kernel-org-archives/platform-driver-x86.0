From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 0/3] Dell Airplane Mode Switch driver
Date: Wed, 6 May 2015 13:31:19 +0200
Message-ID: <20150506113119.GH30910@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
 <201505031238.14772@pali>
 <CAJ=jquY=QG9j1ppYBbbp5WQTVHVfsUHr8NjX5fuH+4mMWeEkdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:36093 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968AbbEFLbW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 07:31:22 -0400
Content-Disposition: inline
In-Reply-To: <CAJ=jquY=QG9j1ppYBbbp5WQTVHVfsUHr8NjX5fuH+4mMWeEkdQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

Looks like everything is OK. Test3 is expected to not work correctly as
driver is not loaded...

On Wednesday 06 May 2015 17:11:08 Alex Hung wrote:
> The test was updated @
> https://docs.google.com/spreadsheets/d/1voffS6dNglwAExSGh3UmG__UAO2qf=
Z829CkJLPo06aI/edit?usp=3Dsharing.
> Please check the tab "Dell-rbtnv2"
>=20
> Notes:
> 1. The systems come and go and I can find some of original ones but I
> tests some others
> 2. Test 3 was done by Test 2 + "rmmod dell-laptop". All were run with
> all wireless devices are ON
>=20
> Summary:
> From external behaves such as Desktop's viewpoint (Unity was used and
> hope that's not surprising), the wireless devices are ON/OFF
> correctly. Other details are listed in the report.
>=20
> On Sun, May 3, 2015 at 6:38 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com=
> wrote:
> > On Wednesday 29 April 2015 11:51:03 Pali Roh=C3=A1r wrote:
> >> This patch series add new acpi Dell Airplane Mode Switch
> >> driver (DELLABCE and DELRBTN acpi devices). It provides radio
> >> HW switch events (together with current state of radio
> >> devices) and export them via rfkill interface. These events
> >> are also used in dell-laptop driver instead i8042 filter hook
> >> function (when acpi device is available).
> >>
> >> In v2 was added support for laptops which have toggle button
> >> instead HW slider switch. For that I reused code done by Alex
> >> Hung.
> >>
> >> Pali Roh=C3=A1r (3):
> >>   platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
> >>   platform: x86: dell-rbtn: Export notifier for other kernel
> >> modules platform: x86: dell-laptop: Use dell-rbtn instead
> >> i8042 filter when possible
> >>
> >>  drivers/platform/x86/Kconfig       |   14 ++
> >>  drivers/platform/x86/Makefile      |    1 +
> >>  drivers/platform/x86/dell-laptop.c |   67 +++++-
> >>  drivers/platform/x86/dell-rbtn.c   |  430
> >> ++++++++++++++++++++++++++++++++++++
> >> drivers/platform/x86/dell-rbtn.h   |   35 +++
> >>  5 files changed, 542 insertions(+), 5 deletions(-)
> >>  create mode 100644 drivers/platform/x86/dell-rbtn.c
> >>  create mode 100644 drivers/platform/x86/dell-rbtn.h
> >
> > Alex, can you rested this patch series on all your machines like
> > you did previous in this sheet?
> >
> > https://docs.google.com/spreadsheets/d/1voffS6dNglwAExSGh3UmG__UAO2=
qfZ829CkJLPo06aI/edit?usp=3Dsharing
> >
> > Ideally do more tests:
> > 1) only with first patch 1/3
> > 2) with full patch series 1/3, 2/3, 3/3 *with* loaded dell-laptop
> > 3) same as 2) but without loaded dell-laptop
> >
> > If everything pass then this patch series is OK from my side.
> >
> > Looks like Gabriele's problem is irrelevant to this patch series,
> > but we probably hit some rfkill bug in dell-laptop.ko :-(
> >
> > Matthew or Darren, can you review code in this patch series? So
> > if everything will be fine, dell-rbtn could be ready for 4.2.
> >
> > --
> > Pali Roh=C3=A1r
> > pali.rohar@gmail.com
>=20
>=20
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
