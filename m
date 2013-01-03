From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: avoid the warning of 'devices' may be used uninitialized
Date: Thu,  3 Jan 2013 10:37:45 +0800
Message-ID: <1357180665-27511-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-da0-f47.google.com ([209.85.210.47]:34139 "EHLO
	mail-da0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752979Ab3ACCkk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 2 Jan 2013 21:40:40 -0500
Received: by mail-da0-f47.google.com with SMTP id s35so6731009dak.34
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Jan 2013 18:40:40 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Fengguang Wu <fengguang.wu@intel.com>

=46engguang Wu run kernel build test to platform-drivers-x86/linux-next=
 git tree
on x86_64 architecture and found a warning that was introduced by
727651bf738b6b917335025d09323d0962eda114 commit:

drivers/platform/x86/acer-wmi.c: In function =E2=80=98WMID_set_capabili=
ties=E2=80=99:
drivers/platform/x86/acer-wmi.c:1211: warning: =E2=80=98devices=E2=80=99=
 may be used
uninitialized in this function

This patch fixes the above warning message.

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index 563dc3f..c9076bd 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1222,6 +1222,9 @@ static acpi_status WMID_set_capabilities(void)
 			devices =3D *((u32 *) obj->buffer.pointer);
 		} else if (obj->type =3D=3D ACPI_TYPE_INTEGER) {
 			devices =3D (u32) obj->integer.value;
+		} else {
+			kfree(out.pointer);
+			return AE_ERROR;
 		}
 	} else {
 		kfree(out.pointer);
--=20
1.6.4.2
