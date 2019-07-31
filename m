From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 06/10] olpc: x01: convert platform driver to use dev_groups
Date: Wed, 31 Jul 2019 14:43:45 +0200
Message-ID: <20190731124349.4474-7-gregkh@linuxfoundation.org>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731124349.4474-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Richard Gong <richard.gong@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Platform drivers now have the option to have the platform core create
and remove any needed sysfs attribute files.  So take advantage of that
and do not register "by hand" a lid sysfs file.

Cc: Darren Hart <dvhart@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: platform-driver-x86@vger.kernel.org
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/platform/olpc/olpc-xo1-sci.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc-xo1-sci.c b/arch/x86/platform/olpc/olpc-xo1-sci.c
index 25ce1b3b0732..99a28ce2244c 100644
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
 
@@ -624,6 +620,7 @@ static int xo1_sci_remove(struct platform_device *pdev)
 static struct platform_driver xo1_sci_driver = {
 	.driver = {
 		.name = "olpc-xo1-sci-acpi",
+		.dev_groups = lid_groups,
 	},
 	.probe = xo1_sci_probe,
 	.remove = xo1_sci_remove,
-- 
2.22.0
