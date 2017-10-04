From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 04/14] platform/x86: dell-wmi: increase severity of some failures
Date: Wed,  4 Oct 2017 17:48:30 -0500
Message-ID: <f9dd40ebcda3238fa431a8a0d38595b808fae38b.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

There is a lot of error checking in place for the format of the WMI
descriptor buffer, but some of the potentially raised issues should
be considered critical failures.

If the buffer size or header don't match, this is a good indication
that the buffer format changed in a way that the rest of the data
should not be relied upon.

For the remaining data set vectors, continue to notate a warning
in undefined results, but as those are fields that the descriptor
intended to refer to other applications, don't fail if they're new
values.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 4807ec4a2e8f..1366bccdf275 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -657,18 +657,18 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 		dev_err(&wdev->dev,
 			"Dell descriptor buffer has invalid length (%d)\n",
 			obj->buffer.length);
-		if (obj->buffer.length < 16) {
-			ret = -EINVAL;
-			goto out;
-		}
+		ret = -EINVAL;
+		goto out;
 	}
 
 	buffer = (u32 *)obj->buffer.pointer;
 
-	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
+	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
 			buffer);
-
+		ret = -EINVAL;
+		goto out;
+	}
 	if (buffer[2] != 0 && buffer[2] != 1)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
 			buffer[2]);
-- 
2.14.1
