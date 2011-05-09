From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH] asus-laptop: Remove historic reminder of the pre sparse-keymap era
Date: Mon,  9 May 2011 18:47:55 +0200
Message-ID: <1304959675-19147-1-git-send-email-anisse@astier.eu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp1-g21.free.fr ([212.27.42.1]:37510 "EHLO smtp1-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753719Ab1EJKpW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 May 2011 06:45:22 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Dmitry Torokhov <dtor@mail.ru>, Anisse Astier <anisse@astier.eu>

Back when every driver managed it's own sparse keymap directly,
asus_laptop needed to keep track of its keymap. Not anymore.

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/platform/x86/asus-laptop.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index c53b3ff..0379798 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -198,7 +198,6 @@ struct asus_laptop {
 	struct backlight_device *backlight_device;
 
 	struct input_dev *inputdev;
-	struct key_entry *keymap;
 
 	struct asus_led mled;
 	struct asus_led tled;
-- 
1.7.4.3
