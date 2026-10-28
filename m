Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231572;
	b=NbI5gMlfwcunLd8nKHZX7zh7InoAjuWbNpS5cC/xWrXKWdoSLGAvd5NKug3hOGXS7lmm
	 14NdNyFW/yDAn1sKctXkenzRePv9/KKv70B1+BFvDTJcv8ohMC6QQdPcgA3EtAQVR6/iS
	 YBduUUQ1RbQm70/crXB/rmOrlSHKMDcwEDt2rfSvaakltiJbqpkZyR2i/1NccB+DK1AIF
	 KfZkiRXq6DnOOIpfOJSShsaRpigdK/wByQy+5upvBFPpvjEhPrmDPgRMPUDzu5igiV5Fr
	 tKaWHLe6EXweoZinOHUfXob8Gf92FBc98T9mhbx52W/xo1ROe6HSGUHMbI4vX01Umzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Af/thxHkdC33DwjakI5xWjPNHFxWjZZYhh+Bu6x+bIY=;
	b=h49kQhhFt79Jp8nPxtG5/ZXZIJyLqSGQwaBiQI7HqZyotccpQu49I2wuyHrcgn9/pEir
	 95XiVmguTdp8opMkwHkMlgsoc18fjiwoISsOw0mFp8s9wCslstRVbsy4gsJJA3AnKwejX
	 6fsbhTIkva18TwGfTy7vvZO10pUY79MZFaeGybqemuDncWsJ6EPMFcEg0/FiCrreXYOAv
	 KTXCVuQVge210KaqddB3hsP38Z07nLVqQUfuSoE23fNmw6JvYEFSLw3P7nXD/Ma+uIvxk
	 dtf0qfj4sZuQHY68U/BtRMI7WNjvVRNjXuazW/lZSCQiEY3J6ynTPBEhdinoRiLO+fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tz3/ZhqO";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4C606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 23:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D4C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tz3/ZhqO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11515095e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 16:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793231570; x=1793836370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Af/thxHkdC33DwjakI5xWjPNHFxWjZZYhh+Bu6x+bIY=;
        b=tz3/ZhqOSq/4R96dJeMcTZkaw+Vc/rO4vrKCwX8tmlE1VkQHb7ISJg4vu4UgrGrSWN
         HR2qTFgXP+BZMukXElx0qveSAehKEU7QfyZxw8uLICrEr0fuZq7mVt713Wge1mviC6ce
         z5DqakgxpAMIhIfbg3KPHm3m6f5LOFDhxZ+zGeMFV2MzwHVTLdP78tBelA8fGOOe5BQX
         OHJR5u9KCi0KNhngnNRuyo16vpr0DkBLrS2gu6FUYCIYOrcP3dBng9iA/uhkdbU3TQCD
         kWKuxAwDaOtz5UPdKvrfn2139sgAvMVHxUBs3ARODIpcXmF67dRNPDucjak9nxAXhwpZ
         Fclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231570; x=1793836370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Af/thxHkdC33DwjakI5xWjPNHFxWjZZYhh+Bu6x+bIY=;
        b=U0SawF7Zd4xbcwlvhnL5JnoGt6VgUNh6xYWKD3vElFHUZHPaEjtskptPkVPM8IoVv/
         Jg8aaywGn6YCJWC3leAPwTYwG+sdAu9BCRojhgjmr92ulApwpP8xM+GBjO64zSLk6X3F
         rqLhYqYhdRgGZCj1/71R+vxdD5Cb3uxhEXnDZeCEIv9bDC97MO7JWty/09p8OGDT/qll
         QjdIh3oT+YKGGlzqYTA98XT1SZiDKBrFWYE6f4ZdulKi7xVQZsnM3FalHDK8e2bZM5RV
         hfn+FJe8xGczsRofsd6zE59eH7/atp4tFM78Ifn237ajnC+xSdbW3amo6ICzPEhGjeAw
         5OAg==
X-Gm-Message-State: AFq9FYLfTc4YgITo6OP/K5F6e50AYIEzyYL4IEh8UD507t0wlM2WRnFo
	SnGL+SrrlDzOzO4+XzMXhGac13O4mNZRxyWMs+VfYgkn5mk/TDGe5qVAz2vgrjiD
X-Gm-Gg: AYBFou0KJSockmZzVExSEWXE003fiyv/IrUFvilz7AqO3d/leUUNU7FPJdu7v+n3y7i
	MRCNXFYEYku4tLHF79Mq0WHdA7xPsbaXoLnkwr6ocZZwPIVC6Jx7ot7h+73OWPl8s3OKedrcY7J
	olZS41Vt0M5SqZGiXptgh+iSHdaxgZypPPGfT5o8q5aOkFdIlnUehTwd8ipMMt1gLgm1YWt2j/C
	IhaZY8FlvFZ3eUvdDol3u3HpHiQLenw+vCjRgxTHD1ryUevdbodnPN62/BrojFFn7AhCZqQBycd
	ru4Cj3XX/Ic+MaxSwrmatMj7CzzebxHaHjl042x/RE+utLk80U/09i0kMY/BrMY8Fgc38n5UPoy
	KrOKQPV1sgJ914Aist6BaXsE6VpoOtCnwx25KVGc+kVv1IBwN5XU02tEl9Ku7+N4btjYEQEVoqC
	CpFngDyjdD2G/hxb7m+H2B73W1nh9F55fjQ35269+pAwGyU1uyZzvfbqGzP/+TdP6ZW5ZMn/HB0
	9tY8fC02KBryLmzLBVRHpeHT9rx4TBt6c83Poh/nWK8Z84BYrTaeTGhw4gm5p3z3FHpaQvHtdTQ
	StFNWNf3Vlo4rHZ7Ue+fHqtsvcc=
X-Received: by 2002:a05:600c:3115:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4a966774db9mr87067605e9.17.1793231570159;
        Wed, 28 Oct 2026 16:52:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm23669055e9.4.2026.10.28.16.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:52:49 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Date: Thu, 29 Oct 2026 02:48:51 +0300
Subject: [PATCH v4 1/2] platform/x86: asus-wmi: add TUF keyboard RGB
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
Message-Id: <20261029-asus-tuf-rgb-v4-v4-1-0d3b877d2c30@gmail.com>
References: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
In-Reply-To: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
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

Add kbd_rgb_read_status() to evaluate and validate that buffer, parse
it through a packed struct, and convert both attributes to
DEVICE_ATTR_RW.  The read returns the write format with "n/a" in the
command position: the command word belongs to the write verb (apply
now or save to flash) and both verbs update the EC mirror the same
way, so there is no state to report there.  The three EC speed codes
map back to the sysfs indices 0 to 2.

Readback was verified against the EC firmware: the status bytes mirror
EC RAM at 0x0B22 to 0x0B2E, and the speed codes 0xe1, 0xeb and 0xf5
select animation step thresholds of 30, 20 and 10 ticks per phase,
which matches the slow, normal and fast labels.  Tested on a TUF
Gaming A15 (FA507NV).

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 83 +++++++++++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  3 ++
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b33ebdb21aa2..054d1d684bb0 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1062,6 +1062,65 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
 #define TUF_KBD_RGB_SPEED_SLOW		0xe1
 #define TUF_KBD_RGB_SPEED_NORMAL	0xeb
 #define TUF_KBD_RGB_SPEED_FAST		0xf5
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
+static int kbd_rgb_read_status(struct asus_wmi_kbd_rgb_status *status)
+{
+	int err;
+
+	err = asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
+					   ASUS_WMI_DEVID_TUF_RGB_READ_STATUS,
+					   0, (u8 *)status, sizeof(*status));
+	if (err)
+		return err < 0 ? err : -ENODEV;
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
+	struct asus_wmi_kbd_rgb_status status = {};
+	u32 speed;
+	int err;
+
+	err = kbd_rgb_read_status(&status);
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
+	return sysfs_emit(buf, "n/a %d %d %d %d %d\n",
+			  status.mode, status.red, status.green, status.blue,
+			  speed);
+}
+
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1114,7 +1173,7 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_mode);
+static DEVICE_ATTR_RW(kbd_rgb_mode);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
 			     "cmd mode red green blue speed");
@@ -1135,6 +1194,26 @@ static const struct attribute_group kbd_rgb_mode_group = {
 #define TUF_KBD_RGB_STATE_AWAKE		BIT(3)
 #define TUF_KBD_RGB_STATE_SLEEP		BIT(5)
 #define TUF_KBD_RGB_STATE_SHUTDOWN	BIT(7)
+static ssize_t kbd_rgb_state_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct asus_wmi_kbd_rgb_status status = {};
+	u8 state;
+	int err;
+
+	err = kbd_rgb_read_status(&status);
+	if (err)
+		return err;
+
+	state = status.state;
+
+	return sysfs_emit(buf, "n/a %d %d %d %d\n",
+			  !!(state & TUF_KBD_RGB_STATE_BOOT),
+			  !!(state & TUF_KBD_RGB_STATE_AWAKE),
+			  !!(state & TUF_KBD_RGB_STATE_SLEEP),
+			  !!(state & TUF_KBD_RGB_STATE_SHUTDOWN));
+}
+
 static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1166,7 +1245,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_state);
+static DEVICE_ATTR_RW(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
 			     "cmd boot awake sleep shutdown");
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 66c7ab35d6c8..393fd3c5949a 100644
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

