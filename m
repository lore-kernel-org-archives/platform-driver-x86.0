From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v3 8/8] platform/x86: dell-wmi-smbios: clean up wmi descriptor check
Date: Wed, 27 Sep 2017 23:02:20 -0500
Message-ID: <84b6170a1d3a692b53a40f795dd4f9a3052b8fe3.1506571188.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Some cases the wrong type was used for errors and checks can be
done more cleanly.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
---
 drivers/platform/x86/dell-smbios.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index ac176953e46e..d75b6971588e 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -346,16 +346,16 @@ int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev, u32 *version)
 	}
 	desc_buffer = (u32 *)obj->buffer.pointer;
 
-	if (desc_buffer[0] != 0x4C4C4544 && desc_buffer[1] != 0x494D5720)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
-			8, desc_buffer);
+	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0)
+		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
+			desc_buffer);
 
 	if (desc_buffer[2] != 0 && desc_buffer[2] != 1)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
+		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
 			desc_buffer[2]);
 
 	if (desc_buffer[3] != 4096)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
+		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%u)\n",
 			desc_buffer[3]);
 
 	*version = desc_buffer[2];
-- 
2.14.1
