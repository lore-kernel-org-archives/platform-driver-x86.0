From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/2] fujitsu-laptop: Remove unused macros
Date: Thu, 23 Jun 2016 12:02:48 +0200
Message-ID: <1466676168-4199-3-git-send-email-kernel@kempniu.pl>
References: <20160616234630.GB4764@marvin.atrad.com.au>
 <1466676168-4199-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36408 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751483AbcFWKDG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 06:03:06 -0400
Received: by mail-wm0-f66.google.com with SMTP id c82so9468598wme.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2016 03:03:05 -0700 (PDT)
In-Reply-To: <1466676168-4199-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

=46UJLAPTOP_* macros were introduced by 20b9373, but have never been us=
ed
except FUJLAPTOP_DEBUG, which was made redundant by the previous patch.

ACPI_VIDEO_NOTIFY_* macros were also introduced by 20b9373, but they
have not been needed since 1696d9d.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x=
86/fujitsu-laptop.c
index 04e633d..7a345f9 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -88,9 +88,6 @@
=20
 #define ACPI_FUJITSU_NOTIFY_CODE1     0x80
=20
-#define ACPI_VIDEO_NOTIFY_INC_BRIGHTNESS     0x86
-#define ACPI_VIDEO_NOTIFY_DEC_BRIGHTNESS     0x87
-
 /* FUNC interface - command values */
 #define FUNC_RFKILL	0x1000
 #define FUNC_LEDS	0x1001
@@ -121,13 +118,6 @@
 #define RINGBUFFERSIZE 40
=20
 /* Debugging */
-#define FUJLAPTOP_LOG	   ACPI_FUJITSU_HID ": "
-#define FUJLAPTOP_ERR	   KERN_ERR FUJLAPTOP_LOG
-#define FUJLAPTOP_NOTICE   KERN_NOTICE FUJLAPTOP_LOG
-#define FUJLAPTOP_INFO	   KERN_INFO FUJLAPTOP_LOG
-#define FUJLAPTOP_DEBUG    KERN_DEBUG FUJLAPTOP_LOG
-
-#define FUJLAPTOP_DBG_ALL	  0xffff
 #define FUJLAPTOP_DBG_ERROR	  0x0001
 #define FUJLAPTOP_DBG_WARN	  0x0002
 #define FUJLAPTOP_DBG_INFO	  0x0004
--=20
1.7.10.4
