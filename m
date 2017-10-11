From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v7 02/15] platform/x86: dell-wmi: increase severity of some failures
Date: Wed, 11 Oct 2017 11:27:28 -0500
Message-ID: <3aff1fc379bb6ae12754573ac8c4fa636af5a4bf.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:38651 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1757115AbdJKQ1u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2017 12:27:50 -0400
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>

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
 drivers/platform/x86/dell-wmi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 1fbef560ca67..2cfaaa8faf0a 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -657,17 +657,18 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
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
 
-	if (buffer[0] != 0x4C4C4544 && buffer[1] != 0x494D5720)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
+	if (buffer[0] != 0x4C4C4544 && buffer[1] != 0x494D5720) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
 			8, buffer);
+		ret = -EINVAL;
+		goto out;
+	}
 
 	if (buffer[2] != 0 && buffer[2] != 1)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
-- 
2.14.1
