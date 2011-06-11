From: Jesper Juhl <jj@chaosbits.net>
Subject: [PATCH] platform, compal: Fix mem leak in compal_probe()
Date: Sat, 11 Jun 2011 19:02:42 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1106111858490.23835@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Lennart Poettering <mzxreary@0pointer.de>
List-Id: platform-driver-x86.vger.kernel.org

We'll leak the memory allocated to 'data' in 
drivers/platform/x86/compal-laptop.c::compal_probe() if 
sysfs_create_group() doesn't return 0.
Fix the leak by freeing the memory in that case.

Signed-off-by: Jesper Juhl <jj@chaosbits.net>
---
 compal-laptop.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

	Compile tested only.

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 3f204fd..8877b83 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1030,8 +1030,10 @@ static int __devinit compal_probe(struct platform_device *pdev)
 	initialize_fan_control_data(data);
 
 	err = sysfs_create_group(&pdev->dev.kobj, &compal_attribute_group);
-	if (err)
+	if (err) {
+		kfree(data);
 		return err;
+	}
 
 	data->hwmon_dev = hwmon_device_register(&pdev->dev);
 	if (IS_ERR(data->hwmon_dev)) {


-- 
Jesper Juhl <jj@chaosbits.net>       http://www.chaosbits.net/
Don't top-post http://www.catb.org/jargon/html/T/top-post.html
Plain text mails only, please.
