From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 05/11] olpc: x01: convert platform driver to use dev_groups
Date: Thu,  4 Jul 2019 10:46:11 +0200
Message-ID: <20190704084617.3602-6-gregkh@linuxfoundation.org>
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704084617.3602-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Platform drivers now have the option to have the platform core create
and remove any needed sysfs attribute files.  So take advantage of that
and do not register "by hand" a lid sysfs file.

Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/platform/olpc/olpc-xo1-sci.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc-xo1-sci.c b/arch/x86/platform/olpc/olpc-xo1-sci.c
index 25ce1b3b0732..ce1948918dd2 100644
--- a/arch/x86/platform/olpc/olpc-xo1-sci.c
+++ b/arch/x86/platform/olpc/olpc-xo1-sci.c
@@ -157,6 +157,12 @@ static ssize_t lid_wake_mode_set(struct device *dev,
 static DEVICE_ATTR(lid_wake_mode, S_IWUSR | S_IRUGO, lid_wake_mode_show,
 		   lid_wake_mode_set);
 
+static struct attribute *lid_attrs[] = {
+	&dev_attr_lid_wake_mode.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(lid);
+
 /*
  * Process all items in the EC's SCI queue.
  *
@@ -510,17 +516,8 @@ static int setup_lid_switch(struct platform_device *pdev)
 		goto err_register;
 	}
 
-	r = device_create_file(&lid_switch_idev->dev, &dev_attr_lid_wake_mode);
-	if (r) {
-		dev_err(&pdev->dev, "failed to create wake mode attr: %d\n", r);
-		goto err_create_attr;
-	}
-
 	return 0;
 
-err_create_attr:
-	input_unregister_device(lid_switch_idev);
-	lid_switch_idev = NULL;
 err_register:
 	input_free_device(lid_switch_idev);
 	return r;
@@ -528,7 +525,6 @@ static int setup_lid_switch(struct platform_device *pdev)
 
 static void free_lid_switch(void)
 {
-	device_remove_file(&lid_switch_idev->dev, &dev_attr_lid_wake_mode);
 	input_unregister_device(lid_switch_idev);
 }
 
@@ -629,6 +625,7 @@ static struct platform_driver xo1_sci_driver = {
 	.remove = xo1_sci_remove,
 	.suspend = xo1_sci_suspend,
 	.resume = xo1_sci_resume,
+	.dev_groups = lid_groups,
 };
 
 static int __init xo1_sci_init(void)
-- 
2.22.0
