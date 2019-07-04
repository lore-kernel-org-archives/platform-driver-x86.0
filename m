From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 07/11] video: fbdev: wm8505fb: convert platform driver to use dev_groups
Date: Thu,  4 Jul 2019 10:46:13 +0200
Message-ID: <20190704084617.3602-8-gregkh@linuxfoundation.org>
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704084617.3602-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Platform drivers now have the option to have the platform core create
and remove any needed sysfs attribute files.  So take advantage of that
and do not register "by hand" a sysfs file.

Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/wm8505fb.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/wm8505fb.c b/drivers/video/fbdev/wm8505fb.c
index 8f0d5379861d..3b826da97035 100644
--- a/drivers/video/fbdev/wm8505fb.c
+++ b/drivers/video/fbdev/wm8505fb.c
@@ -184,6 +184,12 @@ static ssize_t contrast_store(struct device *dev,
 
 static DEVICE_ATTR_RW(contrast);
 
+static struct attribute *wm8505fb_attrs[] = {
+	&dev_attr_contrast.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(wm8505fb);
+
 static inline u_int chan_to_field(u_int chan, struct fb_bitfield *bf)
 {
 	chan &= 0xffff;
@@ -369,10 +375,6 @@ static int wm8505fb_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = device_create_file(&pdev->dev, &dev_attr_contrast);
-	if (ret < 0)
-		fb_warn(&fbi->fb, "failed to register attributes (%d)\n", ret);
-
 	fb_info(&fbi->fb, "%s frame buffer at 0x%lx-0x%lx\n",
 		fbi->fb.fix.id, fbi->fb.fix.smem_start,
 		fbi->fb.fix.smem_start + fbi->fb.fix.smem_len - 1);
@@ -384,8 +386,6 @@ static int wm8505fb_remove(struct platform_device *pdev)
 {
 	struct wm8505fb_info *fbi = platform_get_drvdata(pdev);
 
-	device_remove_file(&pdev->dev, &dev_attr_contrast);
-
 	unregister_framebuffer(&fbi->fb);
 
 	writel(0, fbi->regbase);
@@ -402,6 +402,7 @@ static const struct of_device_id wmt_dt_ids[] = {
 };
 
 static struct platform_driver wm8505fb_driver = {
+	.dev_groups	= wm8505fb_groups,
 	.probe		= wm8505fb_probe,
 	.remove		= wm8505fb_remove,
 	.driver		= {
-- 
2.22.0
