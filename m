From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v11 02/15] platform/x86: dell-wmi: increase severity of some failures
Date: Fri, 20 Oct 2017 12:40:17 -0500
Message-ID: <75232bbc211473e2bc8aa09067c4e0bd5fc719a9.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
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
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
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
