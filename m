Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911480;
	b=aBxqZpFybiEfeasgKeO8akWFmkOnSH0n2nQ15Fy/e05CyFOJlqmnDDUKbJ7m5500OuHc
	 ggzlWG/MbJRebXuLv4uW4UrpOd/Gbu4kA9fUcKD0MU1gV3vWRYHpVioq3iYL2ksuof7bX
	 FZCE/XKX/krUOabzM+1wvnWzkRXPVyFrKf6fdrYLth516G0B44wNE+Ncb+ELFhiADfrSM
	 U1WpRhVmIG50VdBie9HpmbWQL1QKHCaYQNJXABguGXyhZimsm661k3RjO+c5kmPqSjdHi
	 ogL6tAMxu/QetFQxGWKbmiZq5/y4xfJXkkbM3gQ/UTfYnYOPW0R2YMykdQPZ/wOQlUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZjzuyIj3209lQmCi+LHAzOkiKC1kjspF24AgT8ts6dw=;
	b=l9ktnR7YFnuL0gzjmb/8LmeFVaKFs+5Q6S76qxqy3yz9NgGPqOT2EqfThSJ6zL31fMef
	 /LY9U3fzSSNz4FPczosCJeVbW0BgzuPpFABKedncxaGDrAG1C3OvLF2c4oFhx4jIrEnJw
	 hID5S4VAYB/mQuyeGD9tyzpbfFlzoY9Gzqsld9rpowi+JBUym3OrkI0IKm+7I6FA2SJmh
	 m28EEBeSXYR+4GVPZJnJyvGbLo8Nm/SoYORteYCoqRB6sXFegxOjeqcBFUhoWlLVAvi37
	 mHM8YrnIFk8WSp0mUUw8pmh/62eP+asgW2z3PV2HzVJ9YNCjxzTy9K2ojLTraBQuB0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCVTIjvu;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D4606A886
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 10:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4D4606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCVTIjvu
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so29684925e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 02:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911478; x=1795516278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjzuyIj3209lQmCi+LHAzOkiKC1kjspF24AgT8ts6dw=;
        b=aCVTIjvulvBGfZyYiN1ZCfhyQbPeMolsFE3cDbSHrfYZ3wJZ3oQ9VKFbQqgzt6a/lw
         iICMTFXvq+uOI38esLcIInik4GnMcxRiwBDm7TbBpmNaKgWYg8jxsZ4mIYUSrpo9VMzx
         AxSdg6VtsQutmLTpF1lFBTJaNYIVOFcoqOi7UwCdagPLgi04+SQqTtpM26OfAQdKm5oO
         r15lfPgIAyuEmSt6L+rvzopJOzDh/lFv2FBCBcgTEiTqufq5JrXybhnf0X983b4XfHuv
         icNDicrBr8r42Em3nuD1i2/czUR4Uv2nhlth592AZ2B6+l2n5p7z13iiyImfeTNVEPWx
         WUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911478; x=1795516278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjzuyIj3209lQmCi+LHAzOkiKC1kjspF24AgT8ts6dw=;
        b=giVMSXGil+Twa/yHq7HTpdK+fZ1rWbt1AYgtdxscxzcwDsSqYlPN/t2vEm+9kWLX6l
         uxE0zRPaapE6V6u2zrkv8DoO9IXJ2qO9ja7ayjRZQu96urrgWFl5wM4bS1sDYAeBDwF4
         eePBZt6+F4GPngw62plbNJzDDvnFk5kNA8AOulboCwggubL7GtoElOIT0r9sPR3t67IJ
         7K4iEzTepEduWO+bVVQatUxMyL/10GefKCHz994JfPh+d19PA6TXJ1hurhhupllsqZTi
         Q7Lpjm4Ucsn/XSWj/cCZ/3bHffkCNs1L0LhmLr+8iDnlokx40eQ4jgWlpM4Y16fTIWBY
         LPJA==
X-Gm-Message-State: APuU4Z8QPadZ04q9livWubm1axbOllqGOQoGIRPJ1PzPm8a1e6+AR6fh
	rBY0LFih6eBLeAuiHWciCaF4FYs4rcFry7SnarhpU0SUj6AsiubNYOjQ
X-Gm-Gg: AYBFou3KQ0FH5Rw8tUG06vk0MwqWopebZ2iP8dEmAJUSSa13zup5zvUqTNplH3qsmTE
	BX7QksKffiXPASco90PMhf5/g4zf0NA23hmw3jaxOcy9Q+zJBJgD4YxmFfqbVmk3vOYIssiTmCy
	5k/kuLpfDx10Ve5olncg6OQDvrZx+XEFB3EETDyNFU89BYtmksjXCvgShrqlS4QhXx/+gW2eDly
	8wXi8EMkAqtVdC1qV/VLEJKpbPPmuv1riv1Nz+3ImAKL0KActCCZfW5w6KFcekKjs+t77S0FAvO
	/ezd7xciwxUEQR02m6HvcHRtdl1AlPyxZIbXVp134oyUSEKA6rbJrEWNvxhzHWtNQtJCtqdXmtw
	AGOAcs8tACOm/kVfp3eWvUjP0vJSZhcbqtKk5exP8lKGiZIrTxXPjj1wgzOCyR5GHFLjsrHpPi6
	G6OB5JZ5dnJuZfQC7IJjpnPTDuaCCn8ldJPA2xfoHXRxo+Y4zjT3fbec6Ndrw5sd0+dRBnsFpYX
	TnP1hg8Jjm2A6NxK0ZgLtLBb3cTiJHoMbXOYkli7GcGpx2+PrDtD+5HKvZUTP+JFJdC5IKL7hxS
	zOBBRh2CnMvm3xdrpn4Qu3L5Gk8=
X-Received: by 2002:a05:600c:8b35:b0:4bb:6b6b:fbaa with SMTP id 5b1f17b1804b1-4bb6b6bfc3dmr154009095e9.16.1794911477943;
        Tue, 17 Nov 2026 02:31:17 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm57712355e9.7.2026.11.17.02.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:31:17 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Tue, 17 Nov 2026 13:31:05 +0300
Subject: [PATCH v5 2/3] platform/asus: asus-wmi: add TUF keyboard RGB
 readback support
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-asus-tuf-rgb-v4-v5-2-95268035eef1@gmail.com>
References: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
In-Reply-To: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>, 
 Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

The TUF keyboard RGB attributes kbd_rgb_mode and kbd_rgb_state are
write-only, so userspace tools keep their own copy of the lighting
configuration and lose track of it whenever the EC changes state on its
own: after a firmware reset or a boot into another operating system the
tools show a stale configuration until the user rewrites every field.

DSTS device 0x0010005B evaluates the DSDT method EC0.KBLS(), which
snapshots the EC's host-visible keyboard state into a 16-byte buffer:
lighting mode, red, green and blue levels, animation speed, and the
four power-state flags.  The first byte is a constant 1 written by the
AML, which distinguishes a KBLS reply from any other object the method
could return.

Add kbd_rgb_read_status() to evaluate and validate that buffer via
asus->dsts_id, parse it through a packed struct, and convert both
attributes to DEVICE_ATTR_RW.  The read returns the write format with
"n/a" in the command position: the command word belongs to the write
verb (apply now or save to flash) and both verbs update the EC mirror
the same way, so there is no state to report there.  The three EC speed
codes map back to the sysfs indices 0 to 2.

Firmware without readback support does not always report it the same
way: on models such as the FX505DT, DSTS(0x00100056/57) reports the
devices present while 0x0010005B answers with a plain zero, which
asus_wmi_evaluate_method_buf() now decodes as -ENODATA.  Translate that
to -ENODEV for hardware without readback support, while passing -EIO and
-ENOSPC through unchanged.

Readback was verified against the EC firmware: the status bytes mirror
EC RAM at 0x0B22 to 0x0B2E, and the speed codes 0xe1, 0xeb and 0xf5
select animation step thresholds of 30, 20 and 10 ticks per phase,
which matches the slow, normal and fast labels.  Tested on a TUF
Gaming A15 (FA507NV).

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/asus/asus-wmi.c           | 94 +++++++++++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  3 +
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index 4d844f914f77e..4dfdf37dafaa5 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1084,6 +1084,76 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
 #define TUF_KBD_RGB_SPEED_SLOW		0xe1
 #define TUF_KBD_RGB_SPEED_NORMAL	0xeb
 #define TUF_KBD_RGB_SPEED_FAST		0xf5
+
+/* TUF keyboard RGB status readback *******************************************/
+struct asus_wmi_kbd_rgb_status {
+	u8 signature;
+	u8 mode;
+	u8 red;
+	u8 green;
+	u8 blue;
+	u8 speed;
+	u8 state;
+	u8 unused[9];
+} __packed;
+
+static int kbd_rgb_read_status(struct asus_wmi *asus,
+			       struct asus_wmi_kbd_rgb_status *status)
+{
+	int err;
+
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id,
+					   ASUS_WMI_DEVID_TUF_RGB_READ_STATUS,
+					   0, (u8 *)status, sizeof(*status));
+	/*
+	 * Hardware without readback may answer with an integer (e.g. 0 on
+	 * FX505DT) instead of a buffer, causing asus_wmi_evaluate_method_buf()
+	 * to return -ENODATA; report -ENODEV to userspace.
+	 */
+	if (err == -ENODATA)
+		return -ENODEV;
+	if (err)
+		return err;
+
+	/* The AML writes a constant 1 here; anything else is not a KBLS reply */
+	if (status->signature != 1)
+		return -ENODEV;
+
+	return 0;
+}
+
+static ssize_t kbd_rgb_mode_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, kbd_led);
+	struct asus_wmi_kbd_rgb_status status = {};
+	u32 speed;
+	int err;
+
+	err = kbd_rgb_read_status(asus, &status);
+	if (err)
+		return err;
+
+	switch (status.speed) {
+	case TUF_KBD_RGB_SPEED_SLOW:
+		speed = 0;
+		break;
+	case TUF_KBD_RGB_SPEED_FAST:
+		speed = 2;
+		break;
+	case TUF_KBD_RGB_SPEED_NORMAL:
+	default:
+		speed = 1;
+		break;
+	}
+
+	/* The command word belongs to the write verb, so report n/a. */
+	return sysfs_emit(buf, "n/a %u %u %u %u %u\n",
+			  status.mode, status.red, status.green, status.blue,
+			  speed);
+}
+
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1136,7 +1206,7 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_mode);
+static DEVICE_ATTR_RW(kbd_rgb_mode);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
 			     "cmd mode red green blue speed");
@@ -1157,6 +1227,26 @@ static const struct attribute_group kbd_rgb_mode_group = {
 #define TUF_KBD_RGB_STATE_AWAKE		BIT(3)
 #define TUF_KBD_RGB_STATE_SLEEP		BIT(5)
 #define TUF_KBD_RGB_STATE_SHUTDOWN	BIT(7)
+
+static ssize_t kbd_rgb_state_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, kbd_led);
+	struct asus_wmi_kbd_rgb_status status = {};
+	int err;
+
+	err = kbd_rgb_read_status(asus, &status);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "n/a %d %d %d %d\n",
+			  !!(status.state & TUF_KBD_RGB_STATE_BOOT),
+			  !!(status.state & TUF_KBD_RGB_STATE_AWAKE),
+			  !!(status.state & TUF_KBD_RGB_STATE_SLEEP),
+			  !!(status.state & TUF_KBD_RGB_STATE_SHUTDOWN));
+}
+
 static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1188,7 +1278,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_state);
+static DEVICE_ATTR_RW(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
 			     "cmd boot awake sleep shutdown");
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 66c7ab35d6c81..393fd3c5949ae 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -166,6 +166,9 @@
 /* TUF laptop RGB power/state */
 #define ASUS_WMI_DEVID_TUF_RGB_CMD	0x00100057
 
+/* TUF laptop RGB keyboard status readback */
+#define ASUS_WMI_DEVID_TUF_RGB_READ_STATUS	0x0010005B
+
 /* Bootup sound control */
 #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
 

-- 
2.56.0

