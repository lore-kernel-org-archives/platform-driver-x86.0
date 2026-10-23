Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776737;
	b=u7a9iMV6NEIxKZpU+9NlobV+hLpDbfVa54bYA80wkXmnGCxJiYb1Yho4FK/UnC5fN3aB
	 gWS3McMMq5LcJQG9q4YppHqSYyeRS6SpD61N5VKZYMRB316tgmSuTdm5o90SmREbphlBB
	 yXLkz75niRkfOFyrIWMdo6vTe6vQ8secNamPjZtre/+RmtIQ765852XxLiQX7quuYBjyP
	 gaRkXF9w1mZMwnzCnicxlrm70aqRKjdN2WINMzMt0xZQs38nEuUAR9qhnUSp7aQt9QXQQ
	 pI5FJ+/hbWpziL1EMvf2RGBKqQRAAz8W4C6IHmEMcrqEb17iNsiuDVIxheQpLF3ckPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kuyAyI0iTEbMx+EZYYm4BgPqQMtKZGNJXxiTBsdCdRs=;
	b=2gQHD1SoExckeWzxtS7x22/p5LdzKU4BrhdpvxDE9bpdxuIwMyeWoNTpUSYIu+oudB8n
	 yAwbRuu0uty0Gr02LqCqt6lpyRyKDRvqwPEQGbOW5BQjOExD6SjjhqLQym+RAE8FnOvxP
	 8c/R/v3S+6wTtdDfQb7QVwgtZ2alxytjaMoAolV04/h2rq6i+fxnnEHDlFbXKvphsFPEV
	 mLpQmUUo9ii5ijexrMFPZ+bGLYsjMqfE5Dt0a8m5KtMX7bMQwFMEuvUGufcN1E+qadgeh
	 JkOj8woo0AnvZkC+ED4nVw1KzEGlRtLePJ5IoMnh2+Z9rYGTFOrtUkpD8MM/COIdcfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CAzs6+pR;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A0A606A31D
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 17:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A0A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CAzs6+pR
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso9210295e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 10:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776735; x=1793381535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuyAyI0iTEbMx+EZYYm4BgPqQMtKZGNJXxiTBsdCdRs=;
        b=CAzs6+pRdAKJbS+aQBqR6eb2vDHxJkCGBNpBnud6H6b7DP9eWtjD0kEhE5pjEJ9ou4
         0HDhfMohSfyg6R9t9th/QnK/812LQv0IQJ5hSvGd1zraIrXDOQwiugdK95XlhQKm2DRC
         6dguRYuo+wdVV3km7WeqIoUdFXaSIpUT/VI5NiTFaEEDoavN2O8XJH8DNhPXlfLLNKz+
         UQ7g2P+7vDH3LBiwnoWxX/EMiFBEQh3QGujlvN92+3Ss0kpaAVbHj7vf0d+RlWy9ztCo
         JdJCK+2LXrwtkDNhRAfsg3faimzMNet0MZgqsD3i5n9aqu9+KPlKcgJ3p7uDFKOdUeif
         dyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776735; x=1793381535;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kuyAyI0iTEbMx+EZYYm4BgPqQMtKZGNJXxiTBsdCdRs=;
        b=Wd4hywiUoV2g0JtRvu/zEBvWJLv8Pe9/g+xhUrrPZ0DpZyyp6ZkS78LIzracEfBqf9
         7QQiDxQKTMMhiou5BBqiUlR40zMYthFZSp4plQC7MxfeSBbXLHKqoBf2WO53Fzm/stNI
         +o7AdixoZp1IVLHhZhhcfUKObfynoQHyyWEQd2w97ApgEhPDf5VAW5stQd2l+mDg5s8x
         P5Tg76q76uRIx37dLp+cVTayl1b6LOXeyiwR6uBmSGF6RUycPGMOo6MG54FN+aBMfBZi
         Z8j+5D+AUuZuFN+RmVBxLurW9ZUw448ofXMlHoCLGFLsYaZFb46Oq62I8Zb/4D2MgV10
         oU8g==
X-Forwarded-Encrypted: i=1; AKwUvBwcBdnQAi1UBmgGdIMnLT1dbjQCkiu8/xous4ffFltSgm2EvZBSQhS5Em7EE2aiX5+D2TE1DwTXdR4XI+o9pW6b7dnp@vger.kernel.org
X-Gm-Message-State: AFq9FYI6oLGCAPqIx3r7Sv3lFaugiVcqDooiBfVbIWfASVX+sUBuUqdr
	JAzdSDPzTyx18yR0XLyhqTaTjGVQV/S5MFTQ9rlVGxS7SxBHZBrdPYFphmiyiiCV8tY=
X-Gm-Gg: AYBFou0YJ++WB9ka8iKaa1zQ6/IveiE3LAdbcqBXFJ+P6hRMKbSbOjFMx9Z7uPDJz9k
	SmdLds0coX6wu19J9Tnlq0lRTxc6H+mPOepRrkDtu/2v++3DTZ8NhRQHxQZ1W3RirOQNYNz5Kvx
	EB2lTUHsuRxgn7c509mzuQhDT195X0GQ3qKlJd8fH//FqxRKIZjes0TEjBvLqmx39dSKTuStuED
	ZiT8jH+x+YcOTQ96rXs/Je9JpOBWCLG02gEKQiGZL5bZArUVWgbZq+tqE/Bt8BDuWJxyAqkWcp4
	f2VdFoUaiiqj/xLTfXSaVafDOF5WnIfCGyOZkEguMkb/7sPa+mRLQhA/zClAbHCwWA5Ric1OFo9
	uTYxxhwcM2lNcwnkLnhvMkoXOUqFR79IaRlh6Cjjj7/GKIHef9C9T/X27baDN1TW1myoIstGrQx
	/IHBwovz69Imyb5CbJS0AwPyF7+jUG6R6eNQB2tIk0T58vWD1ibueDp3yCoFePMIjpbcOeABPGK
	FPgItDkrZXCn1MpuKVmhGqxsliCZ8OXO5T5YB9LghZqMuigUOq325xVsCugHRXP2lIDMJX0+MB/
	JDS3GyI858As2FsIio5s0PRaI6RjYSUSjzYw0pZJKq2+tBrgqP9dEu0zALEYiwTNYsLT
X-Received: by 2002:a05:600c:1c08:b0:4a2:16c0:f4f with SMTP id 5b1f17b1804b1-4a216c010e4mr37454055e9.30.1792776735113;
        Fri, 23 Oct 2026 10:32:15 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d400365sm1145420f8f.25.2026.10.23.10.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:32:14 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
Subject: [PATCH] HID: surface-hid: support keyboard backlight on Surface Pro Keyboard (045E:09AE)
Date: Fri, 23 Oct 2026 17:32:13 +0000
Message-ID: <20261023173213.6219-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Surface Pro Keyboard / Flex Keyboard (VID 045E, PID 09AE) attached to
the Microsoft Surface Pro 11 (Snapdragon X Elite / X1E80100) exposes its
keyboard backlight through the HID Consumer Control collection (Usage Page
0x0c, Usage 0x07) rather than through the legacy Surface Aggregator Module
(SAM) TC/KBD category:

- Feature Report 0xd5 (Usage 0x0517, unit Candela) advertises the 4
  supported discrete brightness levels: [0x00, 0x03, 0x06, 0x0c].
- Feature Report 0xd6 (Usage 0x007b) returns the current brightness level
  (0, 3, 6, or 12).
- Output Report 0xd5 ([0xd5, level]) sets the brightness level.
- Input Report 0xd5 (Usage 0x0515, Keyboard Brightness Next) fires
  [0xd5, 0x01] whenever the hardware backlight key (F5) is pressed and the
  embedded controller cycles the brightness in hardware.

Register a LED class device named "surface::kbd_backlight" (max_brightness
= 3, flags = LED_BRIGHT_HW_CHANGED) when the HID device matches VID 045E /
PID 09AE, mapping steps 0..3 to hardware values {0, 3, 6, 12}. Also hook
raw_event to read back Feature Report 0xd6 and notify userspace via
led_classdev_notify_brightness_hw_changed() when Input Report 0xd5 arrives
from the F5 key, and restore the saved brightness level on resume.

Tested on a Microsoft Surface Pro 11 OLED (X1E80100) with UPower and KDE
PowerDevil.

Assisted-by: Antigravity:gemini-2.5-pro
Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
---
 drivers/hid/surface-hid/surface_hid.c      |   4 +
 drivers/hid/surface-hid/surface_hid_core.c | 104 ++++++++++++++++++++-
 drivers/hid/surface-hid/surface_hid_core.h |   8 ++
 3 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/surface-hid/surface_hid.c b/drivers/hid/surface-hid/surface_hid.c
index eae47e0..0f81732 100644
--- a/drivers/hid/surface-hid/surface_hid.c
+++ b/drivers/hid/surface-hid/surface_hid.c
@@ -161,6 +161,10 @@ static u32 ssam_hid_event_fn(struct ssam_event_notifier *nf, const struct ssam_e
 	if (event->command_id != 0x00)
 		return 0;
 
+	if (shid->has_kbd_bl && event->length >= 2 &&
+	    event->data[0] == 0xd5 && (event->data[1] & 0x01))
+		schedule_work(&shid->kbd_bl_work);
+
 	hid_input_report(shid->hid, HID_INPUT_REPORT, (u8 *)&event->data[0], event->length, 0);
 	return SSAM_NOTIF_HANDLED;
 }
diff --git a/drivers/hid/surface-hid/surface_hid_core.c b/drivers/hid/surface-hid/surface_hid_core.c
index 6690c24..afee61f 100644
--- a/drivers/hid/surface-hid/surface_hid_core.c
+++ b/drivers/hid/surface-hid/surface_hid_core.c
@@ -184,6 +184,98 @@ static const struct hid_ll_driver surface_hid_ll_driver = {
 };
 
 
+/* -- Keyboard backlight (Surface Pro Flex / Type Cover 045E:09AE). --------- */
+
+static u8 surface_kbd_bl_raw_to_idx(struct surface_hid_device *shid, u8 raw)
+{
+	u8 i;
+
+	for (i = 0; i < 4; i++) {
+		if (shid->kbd_bl_levels[i] >= raw)
+			return i;
+	}
+	return 3;
+}
+
+static enum led_brightness surface_kbd_bl_get(struct led_classdev *cdev)
+{
+	struct surface_hid_device *shid =
+		container_of(cdev, struct surface_hid_device, kbd_bl_led);
+	u8 buf[2] = { 0xd6, 0 };
+
+	if (surface_hid_is_hot_removed(shid))
+		return shid->kbd_bl_cur;
+
+	if (shid->ops.get_feature_report(shid, 0xd6, buf, sizeof(buf)) < 0)
+		return shid->kbd_bl_cur;
+
+	shid->kbd_bl_cur = surface_kbd_bl_raw_to_idx(shid, buf[1]);
+	return shid->kbd_bl_cur;
+}
+
+static int surface_kbd_bl_set(struct led_classdev *cdev, enum led_brightness value)
+{
+	struct surface_hid_device *shid =
+		container_of(cdev, struct surface_hid_device, kbd_bl_led);
+	u8 idx = clamp_t(u8, value, 0, 3);
+	u8 buf[2] = { 0xd5, shid->kbd_bl_levels[idx] };
+	int ret;
+
+	if (surface_hid_is_hot_removed(shid))
+		return -ENODEV;
+
+	ret = shid->ops.output_report(shid, 0xd5, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	shid->kbd_bl_cur = idx;
+	return 0;
+}
+
+static void surface_kbd_bl_work_fn(struct work_struct *work)
+{
+	struct surface_hid_device *shid =
+		container_of(work, struct surface_hid_device, kbd_bl_work);
+	u8 prev = shid->kbd_bl_cur;
+	u8 hw_idx = surface_kbd_bl_get(&shid->kbd_bl_led);
+
+	if (hw_idx == prev) {
+		u8 next = (prev + 1) % 4;
+
+		surface_kbd_bl_set(&shid->kbd_bl_led, next);
+	}
+
+	led_classdev_notify_brightness_hw_changed(&shid->kbd_bl_led, shid->kbd_bl_cur);
+}
+
+static void surface_hid_kbd_bl_init(struct surface_hid_device *shid)
+{
+	u8 feat[5] = { 0xd5, 0 };
+	u8 cur[2] = { 0xd6, 0 };
+
+	if (shid->hid->vendor != 0x045e || shid->hid->product != 0x09ae)
+		return;
+
+	if (shid->ops.get_feature_report(shid, 0xd5, feat, sizeof(feat)) < 0 ||
+	    feat[4] == 0)
+		return;
+
+	memcpy(shid->kbd_bl_levels, &feat[1], 4);
+	if (shid->ops.get_feature_report(shid, 0xd6, cur, sizeof(cur)) >= 0)
+		shid->kbd_bl_cur = surface_kbd_bl_raw_to_idx(shid, cur[1]);
+
+	INIT_WORK(&shid->kbd_bl_work, surface_kbd_bl_work_fn);
+	shid->kbd_bl_led.name = "surface::kbd_backlight";
+	shid->kbd_bl_led.max_brightness = 3;
+	shid->kbd_bl_led.flags = LED_BRIGHT_HW_CHANGED;
+	shid->kbd_bl_led.brightness_set_blocking = surface_kbd_bl_set;
+	shid->kbd_bl_led.brightness_get = surface_kbd_bl_get;
+	shid->kbd_bl_led.brightness = shid->kbd_bl_cur;
+
+	if (led_classdev_register(shid->dev, &shid->kbd_bl_led) == 0)
+		shid->has_kbd_bl = true;
+}
+
 /* -- Common device setup. -------------------------------------------------- */
 
 int surface_hid_device_add(struct surface_hid_device *shid)
@@ -218,15 +310,23 @@ int surface_hid_device_add(struct surface_hid_device *shid)
 	shid->hid->ll_driver = &surface_hid_ll_driver;
 
 	status = hid_add_device(shid->hid);
-	if (status)
+	if (status) {
 		hid_destroy_device(shid->hid);
+		return status;
+	}
 
-	return status;
+	surface_hid_kbd_bl_init(shid);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(surface_hid_device_add);
 
 void surface_hid_device_destroy(struct surface_hid_device *shid)
 {
+	if (shid->has_kbd_bl) {
+		cancel_work_sync(&shid->kbd_bl_work);
+		led_classdev_unregister(&shid->kbd_bl_led);
+		shid->has_kbd_bl = false;
+	}
 	hid_destroy_device(shid->hid);
 }
 EXPORT_SYMBOL_GPL(surface_hid_device_destroy);
diff --git a/drivers/hid/surface-hid/surface_hid_core.h b/drivers/hid/surface-hid/surface_hid_core.h
index 4b1a7b5..c874489 100644
--- a/drivers/hid/surface-hid/surface_hid_core.h
+++ b/drivers/hid/surface-hid/surface_hid_core.h
@@ -11,8 +11,10 @@
 #define SURFACE_HID_CORE_H
 
 #include <linux/hid.h>
+#include <linux/leds.h>
 #include <linux/pm.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #include <linux/surface_aggregator/controller.h>
 #include <linux/surface_aggregator/device.h>
@@ -67,6 +69,12 @@ struct surface_hid_device {
 	struct hid_device *hid;
 
 	struct surface_hid_device_ops ops;
+
+	struct led_classdev kbd_bl_led;
+	struct work_struct kbd_bl_work;
+	u8 kbd_bl_levels[4];
+	u8 kbd_bl_cur;
+	bool has_kbd_bl;
 };
 
 int surface_hid_device_add(struct surface_hid_device *shid);
-- 
2.56.0

