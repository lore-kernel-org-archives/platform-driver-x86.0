From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Subject: [PATCH 4/4] platform/x86: intel-vbtn: support panel front button
Date: Fri, 3 Nov 2017 20:03:29 +0100
Message-ID: <02181cf6-2faf-4757-9734-b80863e573c6@rwthex-w2-a.rwth-ad.de>
References: <20171103190329.15194-1-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out-2.itc.rwth-aachen.de ([134.130.5.47]:30172 "EHLO
        mail-out-2.itc.rwth-aachen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756279AbdKCTDr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 15:03:47 -0400
In-Reply-To: <20171103190329.15194-1-stefan.bruens@rwth-aachen.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>, AceLan Kao <acelan.kao@canonical.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org

The Lenovo Helix 2 and Dell XPS 12 (9Q33) have an extra button on the
front showing a 'Windows' logo, both reporting event codes 0xC2/0xC3
on press/release.

Tested on XPS 12, for info on the Helix 2 see:
https://www.spinics.net/lists/ibm-acpi-devel/msg03982.html

Signed-off-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>

---

 drivers/platform/x86/intel-vbtn.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 89d395b8e36d..4e074b2ee127 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -38,6 +38,8 @@ static const struct acpi_device_id intel_vbtn_ids[] = {
 static const struct key_entry intel_vbtn_keymap[] = {
 	{ KE_KEY, 0xC0, { KEY_POWER } },	/* power key press */
 	{ KE_IGNORE, 0xC1, { KEY_POWER } },	/* power key release */
+	{ KE_KEY, 0xC2, { KEY_MENU } },			/* 'Windows' key press */
+	{ KE_IGNORE, 0xC3, { KEY_MENU } },		/* 'Windows' key release */
 	{ KE_KEY, 0xC4, { KEY_VOLUMEUP } },		/* volume-up key press */
 	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },		/* volume-up key release */
 	{ KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },		/* volume-down key press */
-- 
2.14.3
