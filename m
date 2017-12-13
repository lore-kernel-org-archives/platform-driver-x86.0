From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: [PATCH] platform/x86: dell-smbios: Block comments use * on subsequent lines
Date: Wed, 13 Dec 2017 13:51:05 +0530
Message-ID: <20171213082105.23082-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pali.rohar@gmail.com, mario.limonciello@dell.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dhaval Shah <dhaval.shah@softnautics.com>
List-Id: platform-driver-x86.vger.kernel.org

Resolved Block comments use * on subsequent lines checkpatch warnings.
Issue found by checkpatch.

Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
---
 drivers/platform/x86/dell-smbios.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 6a60db515bda..25a296c90e08 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -353,7 +353,8 @@ static void __init parse_da_table(const struct dmi_header *dm)
 		container_of(dm, struct calling_interface_structure, header);
 
 	/* 4 bytes of table header, plus 7 bytes of Dell header, plus at least
-	   6 bytes of entry */
+	 * 6 bytes of entry
+	 */
 
 	if (dm->length < 17)
 		return;
-- 
2.11.0
