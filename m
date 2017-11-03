From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Subject: [PATCH 3/4] platform/x86: intel-vbtn: support KEY_ROTATE_DISPLAY
Date: Fri, 3 Nov 2017 20:03:28 +0100
Message-ID: <d9d8c15a-5c33-4a70-a2e8-dc89452d4357@rwthex-w2-a.rwth-ad.de>
References: <20171103190329.15194-1-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171103190329.15194-1-stefan.bruens@rwth-aachen.de>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>, AceLan Kao <acelan.kao@canonical.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The Rotate Lock button event is emitted on the XPS 12 (BIOS A8, but not
on BIOS A2).

Signed-off-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>

---

The changes where tested on an XPS 12 with BIOS version A8 (2015-03-03).
An earlier BIOS version (A2, ~2013) did not report the event, at least
not using the INT33D6 plattform device.
---
 drivers/platform/x86/intel-vbtn.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index e77b9143f9b3..89d395b8e36d 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -42,6 +42,8 @@ static const struct key_entry intel_vbtn_keymap[] = {
 	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },		/* volume-up key release */
 	{ KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },		/* volume-down key press */
 	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
+	{ KE_KEY, 0xC8, { KEY_ROTATE_DISPLAY } },	/* rotate-lock key press */
+	{ KE_IGNORE, 0xC9, { KEY_ROTATE_DISPLAY } },	/* rotate-lock key release */
 	{ KE_SW,     0xCC, { .sw = { SW_TABLET_MODE, 1 } } }, /* Tablet */
 	{ KE_SW,     0xCD, { .sw = { SW_TABLET_MODE, 0 } } }, /* Laptop */
 	{ KE_END },
-- 
2.14.3
