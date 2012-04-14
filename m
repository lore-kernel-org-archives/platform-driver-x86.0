From: Bjarke Istrup Pedersen <gurligebis@gentoo.org>
Subject: [PATCH] NET5501: Change active_low to 0 for LED driver.
Date: Sat, 14 Apr 2012 19:27:51 +0200
Message-ID: <CACPM=kWxDT5u2GbvsSZHVVT4_TzL_yEek-i09sBL-FLwEO2qjw@mail.gmail.com>
References: <1334101538-19127-1-git-send-email-gurligebis@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:55411 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753321Ab2DNR1v convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Apr 2012 13:27:51 -0400
Received: by mail-iy0-f174.google.com with SMTP id z16so5600369iag.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Apr 2012 10:27:51 -0700 (PDT)
In-Reply-To: <1334101538-19127-1-git-send-email-gurligebis@gentoo.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

It seems that there was an error with the active_low =3D 1 for the
LED, since it should be set to 0 (meaning that active is high,
since 0 is false, hence the confusion.

The wiki article about it confuses it, since it contradicts
itself, regarding what turns on the LED.

I have tested 3.4-rc2 on my net5501 with this patch, and it
makes the LED behave correctly, where "none" turns it off, and
"default-on" turns it on, when echoed onto the trigger "file"
in /sys/class/leds.

Signed-off-by: Bjarke Istrup Pedersen <gurligebis@gentoo.org>
---
=A0arch/x86/platform/geode/net5501.c | =A0 =A02 +-
=A01 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/platform/geode/net5501.c
b/arch/x86/platform/geode/net5501.c
index 66d377e..646e3b5 100644
--- a/arch/x86/platform/geode/net5501.c
+++ b/arch/x86/platform/geode/net5501.c
@@ -63,7 +63,7 @@ static struct gpio_led net5501_leds[] =3D {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D "net5501:1",
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.gpio =3D 6,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.default_trigger =3D "default-on",
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .active_low =3D 1,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .active_low =3D 0,
=A0 =A0 =A0 =A0},
=A0};

--
1.7.8.5
