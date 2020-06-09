From: Y Paritcher <y.linux@paritcher.com>
Subject: [PATCH v3 3/3] platform/x86: dell-wmi: add new dmi mapping for keycode 0xffff
Date: Mon,  8 Jun 2020 23:52:54 -0400
Message-ID: <e2f6b5ee27a3a6142a2f8806be8dfbce442548da.1591673143.git.y.linux@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com> <cover.1591673143.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1591673143.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

This looks to be a special value for some sort of custom scancode.
This code could not be triggered for any keypress and is included
from the 0xB2 DMI table.

This prevents the following messages from being logged at startup on a
Dell Inspiron 5593:

    dell_wmi: firmware scancode 0x48 maps to unrecognized keycode 0xffff
    dell_wmi: firmware scancode 0x50 maps to unrecognized keycode 0xffff

as per this code comment:

   Log if we find an entry in the DMI table that we don't
   understand.  If this happens, we should figure out what
   the entry means and add it to bios_to_linux_keycode.

Signed-off-by: Y Paritcher <y.linux@paritcher.com>
---
 drivers/platform/x86/dell-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index e3bc2601e631..bbdb3e860892 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -506,7 +506,7 @@ static void handle_dmi_entry(const struct dmi_header *dm, void *opaque)
 		u16 keycode = (bios_entry->keycode <
 			       ARRAY_SIZE(bios_to_linux_keycode)) ?
 			bios_to_linux_keycode[bios_entry->keycode] :
-			KEY_RESERVED;
+			(bios_entry->keycode == 0xffff ? KEY_UNKNOWN : KEY_RESERVED);
 
 		/*
 		 * Log if we find an entry in the DMI table that we don't
-- 
2.27.0
