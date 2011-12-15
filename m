From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 0/9] platform-x86 updates for 3.3
Date: Thu, 15 Dec 2011 08:29:40 +0100
Message-ID: <CAHR064iNNvxzDGxZ96cKnbiiwp9RwQ99Am6W9Qf=EZb_Xgnj6A@mail.gmail.com>
References: <1323934059-1221-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:50362 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932344Ab1LOH3l convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Dec 2011 02:29:41 -0500
Received: by eaaj10 with SMTP id j10so1596818eaa.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Dec 2011 23:29:40 -0800 (PST)
In-Reply-To: <1323934059-1221-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Dec 15, 2011 at 8:27 AM, Corentin Chary <corentincj@iksaif.net>=
 wrote:
> Hi Matthew,
>
> Here are some acpi4asus and samsung-laptop updates on top of what
> you already have.
> Some interesting stuff in here:
> * asus-laptop gains ability to expose WLED and WBLED as
> =C2=A0/sys/class/rfkill or /sys/class/led . We may have some
> =C2=A0DMI matching for that later, currently it's up to the user to
> =C2=A0decide.
> * asus_acpi is dropped after 5 years of asus-laptop.
>
> Thanks,
>
> Corentin Chary (9):
> =C2=A0asus-laptop: log unknown keys
> =C2=A0eeepc-laptop: log unknown keys
> =C2=A0asus-laptop: cleanup rfkill code
> =C2=A0asus-laptop: control how BLED and WLED should be exposed
> =C2=A0asus-laptop: add rfkill interfaces for wlan and wwan
> =C2=A0asus-laptop: check WLED and BLED presence before adding rfkill
> =C2=A0platform/x86: drop deprecated asus_acpi driver
> =C2=A0asus-laptop: add some keys found on Lenovo SL500
> =C2=A0samsung-laptop: fix seclinux rfkill and us it as fallback
>
> =C2=A0Documentation/laptops/asus-laptop.txt | =C2=A0 =C2=A02 +-
> =C2=A0drivers/acpi/video_detect.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 =C2=A02 +-
> =C2=A0drivers/platform/x86/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 43 +-
> =C2=A0drivers/platform/x86/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A01 -
> =C2=A0drivers/platform/x86/asus-laptop.c =C2=A0 =C2=A0| =C2=A0273 +++=
+--
> =C2=A0drivers/platform/x86/asus_acpi.c =C2=A0 =C2=A0 =C2=A0| 1513 ---=
------------------------------
> =C2=A0drivers/platform/x86/eeepc-laptop.c =C2=A0 | =C2=A0 13 +-
> =C2=A0drivers/platform/x86/samsung-laptop.c | =C2=A0 10 +-
> =C2=A08 files changed, 210 insertions(+), 1647 deletions(-)
> =C2=A0delete mode 100644 drivers/platform/x86/asus_acpi.c
>
> --
> 1.7.5.4
>

Great, I forgot to CC platform-driver-x86. The patches should be ok
thanks to --cc-cmd.

--=20
Corentin Chary
http://xf.iksaif.net
