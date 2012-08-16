From: joeyli <jlee@suse.com>
Subject: Re: Acer-WMI disables touchpad and other issues
Date: Thu, 16 Aug 2012 11:33:57 +0800
Message-ID: <1345088037.6459.144.camel@linux-s257.site>
References: <502BD214.6090700@gnat.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:50132 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752162Ab2HPDhk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Aug 2012 23:37:40 -0400
In-Reply-To: <502BD214.6090700@gnat.ca>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Nathanael D. Noblet" <nathanael@gnat.ca>
Cc: jlee@novell.com, platform-driver-x86@vger.kernel.org

Hi Nathanael

=E6=96=BC =E4=B8=89=EF=BC=8C2012-08-15 =E6=96=BC 10:45 -0600=EF=BC=8CNa=
thanael D. Noblet =E6=8F=90=E5=88=B0=EF=BC=9A
> Hello,
>=20
>    I recently purchased an Acer Aspire One (model A0275-0691). It has=
 an=20
> elantech touchpad. As detailed in this bug:=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D848270 the acer-wmi dri=
ver=20
> has two issues on this device.
>=20
> #1) It is sending TOUCHPAD_TOGGLE and simultaneously changing state
> #2) It disables the touchpad at init
>=20
> It should apparently be doing neither of those. If I boot with acer-w=
mi=20
> blacklisted the touchpad works perfectly, all other Fn+key combos wor=
k=20
> other than brightness control.
>=20
>=20

Please help to test this testing patch. And, please attach dmidecode on
bugzilla or here.=20
If this testing patch can avoid problem on your machine, then I will
write code to parser the dmidecode information for grab the acpi code o=
f
touchpad.


Thanks a lot!
Joey Lee


From 969d1c0bb4fc4b69ef9d037687b4591fbd9df24f Mon Sep 17 00:00:00 2001
=46rom: Lee, Chun-Yi <jlee@suse.com>
Date: Thu, 16 Aug 2012 11:28:20 +0800
Subject: [PATCH] acer-wmi: test patch for remove 0x82 acpi event with K=
EY_TOUCHPAD_TOGGLE


Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index 3782e1c..db7376b 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -125,7 +125,7 @@ static const struct key_entry acer_wmi_keymap[] =3D=
 {
 	{KE_IGNORE, 0x63, {KEY_BRIGHTNESSDOWN} },
 	{KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} },	/* Display Switch */
 	{KE_IGNORE, 0x81, {KEY_SLEEP} },
-	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad On/Off */
+//	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad On/Off */
 	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
 	{KE_END, 0}
 };
--=20
1.6.0.2
