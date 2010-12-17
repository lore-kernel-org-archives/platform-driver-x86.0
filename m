From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Fri, 17 Dec 2010 12:30:15 +0100
Message-ID: <AANLkTikPVqaZE8KBOCKWuwkqRpn3mHKQn+V3bUU5cW7=@mail.gmail.com>
References: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de>
	<AANLkTin+vOvpK4geMKdcx4wiOSc_EdPNwXJAcFTaCcnf@mail.gmail.com>
	<4D092A38.7020407@oracle.com>
	<201012152214.29452.PeterHuewe@gmx.de>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:40085 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707Ab0LQLaQ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Dec 2010 06:30:16 -0500
In-Reply-To: <201012152214.29452.PeterHuewe@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Peter_H=C3=BCwe?= <PeterHuewe@gmx.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, John Linville <linville@tuxdriver.com>

On Wed, Dec 15, 2010 at 10:14 PM, Peter H=C3=BCwe <PeterHuewe@gmx.de> w=
rote:
> Am Mittwoch 15 Dezember 2010, 21:51:04 schrieb Randy Dunlap:
>> > Hi, another patch was posted before:
>> >
>> > http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/97=
0/match
>> > =3Dacpi_wmi
> Thanks for the information.
>
>> > Your patch seems to miss TC1100_WMI section.
>>
>> Yes, it would be better to do both (all) of them the same way.
> Yeah, you're right - but as Sedat's patch is perfect (and fixes both)=
 - so for
> Sedats's patch:
> Acked-by: Peter Huewe <peterhuewe@gmx.de>
>
> Thanks,
> Peter
>

[ CC John Linville ]

It's a bit disappointing to see my fix is still not in
platform-drivers-x86/linux-next [1] (even it's only fixing "warnings",
9 days past).
linux-next tree is for me a very high dynamic SCM tree, I am doing
mostly daily builds, at weekend I am testing/pulling other trees
before they go into Monday's linux-next.
As far as I have fun with "my process"... I will continue.

Yesterday, I provided a patch which broke iwlwifi in linux-next
(next-20101216) and it was applied quickly into wireless-next-2.6 GIT
master and it is in next day's linux-next. OK, this was a breakage not
fixing warnings (which can be of course ignored).

Yesterday, I had a talk with resposibles of GRML project, because they
refused to apply a 6-months-old patch from IIRC Eric Biederman(n).
Debian has it already in their linux-2.6 SCM as:
       bugfix/x86/Skip-looking-for-ioapic-overrides-when-ioapics-are-no=
t-present.patch

To be honest, I can't understand why this patch is still not upstream
(even it is a "cosmetic" fix).

So what shall I do: Cry louder, ignore, resend???

Next very unamused thingie is, sometimes you do not get a feedback, if
a patch is in WTF tree applied or not, so I am replying myself to the
threads so that people are informed that stuff is closed, please go on
to next of your problems.

As a conclusion for myself, it highly depends on the submaintainer...

- Sedat -

[1] http://git.kernel.org/?p=3Dlinux/kernel/git/mjg59/platform-drivers-=
x86.git;a=3Dshortlog;h=3Drefs/heads/linux-next
