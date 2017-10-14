From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v8 04/15] platform/x86: dell-wmi: allow 32k return size in the descriptor
Date: Sat, 14 Oct 2017 00:32:42 -0500
Message-ID: <5064c5e052e624dba7ac50921d9fc7d767bb6cbe.1507958847.git.mario.limonciello@dell.com>
References: <cover.1507958847.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507958847.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507958847.git.mario.limonciello@dell.com>
References: <cover.1507958847.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Some platforms this year will be adopting 32k WMI buffer, so don't
complain when encountering those.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index ece2fe341f01..2578dff90a14 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -624,7 +624,7 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
  * Vendor Signature          0       4    "DELL"
  * Object Signature          4       4    " WMI"
  * WMI Interface Version     8       4    <version>
- * WMI buffer length        12       4    4096
+ * WMI buffer length        12       4    4096 or 32768
  */
 static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 {
@@ -674,7 +674,7 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
 			buffer[2]);
 
-	if (buffer[3] != 4096)
+	if (buffer[3] != 4096 && buffer[3] != 32768)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%u)\n",
 			buffer[3]);
 
-- 
2.14.1
