From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] radio-shark2: Mark shark_resume_leds() inline to kill compiler warning
Date: Sun, 17 Nov 2013 14:50:44 +0100
Message-ID: <1384696244-16954-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:10910 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752639Ab3KQNuy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:50:54 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>

This mirrors the patch to the radio-shark driver by Geert Uytterhoeven.

If SHARK_USE_LEDS=3D1, but CONFIG_PM=3Dn:

drivers/media/radio/radio-shark2.c:240: warning: =E2=80=98shark_resume_=
leds=E2=80=99 defined but not used

Instead of making the #ifdef logic even more complicated (there are alr=
eady
two definitions of shark_resume_leds()), mark shark_resume_leds() inlin=
e to
kill the compiler warning. shark_resume_leds() is small and it has only=
 one
caller.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/radio/radio-shark2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-shark2.c b/drivers/media/radio/r=
adio-shark2.c
index 9fb6697..8654e0d 100644
--- a/drivers/media/radio/radio-shark2.c
+++ b/drivers/media/radio/radio-shark2.c
@@ -237,7 +237,7 @@ static void shark_unregister_leds(struct shark_devi=
ce *shark)
 	cancel_work_sync(&shark->led_work);
 }
=20
-static void shark_resume_leds(struct shark_device *shark)
+static inline void shark_resume_leds(struct shark_device *shark)
 {
 	int i;
=20
--=20
1.8.4.2
