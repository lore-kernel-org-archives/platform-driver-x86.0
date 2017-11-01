From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v12 05/16] platform/x86: dell-wmi: don't check length returned
Date: Wed,  1 Nov 2017 14:25:26 -0500
Message-ID: <73adc79121f53a05c1fccc9a8ddb80b08a72405d.1509561822.git.mario.limonciello@dell.com>
References: <cover.1509561822.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1509561822.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1509561822.git.mario.limonciello@dell.com>
References: <cover.1509561822.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This is intended to be variable and provided by the platform.
Some platforms this year will be adopting a 32k WMI buffer, so don't
complain when encountering those platforms or any other future changes.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-wmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index b2bd396acac5..da4f629d0831 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -624,7 +624,7 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
  * Vendor Signature          0       4    "DELL"
  * Object Signature          4       4    " WMI"
  * WMI Interface Version     8       4    <version>
- * WMI buffer length        12       4    4096
+ * WMI buffer length        12       4    <length>
  */
 static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 {
@@ -674,10 +674,6 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
 			(unsigned long) buffer[2]);
 
-	if (buffer[3] != 4096)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
-			buffer[3]);
-
 	priv->interface_version = buffer[2];
 	ret = 0;
 
-- 
2.14.1
