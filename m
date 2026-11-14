Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678974;
	b=29zi3nnuL+5ZcLkigPStZlN/6/2eBh1RTBKc9+Zr/TXiXrgOSDyCSvWrZhfcicZWX3Gi
	 5QMvc8GthoBmzU7kD1OO7G2ph5lrZd13SbEMgPCfjHs8up+7nBxg3cHTkLbX9r9h8IkMN
	 AV3fwxaa72pnP+3cEvnrRL13rILYCHtwJ5JdfSX5lOZ+WUVBHdr5lArUbPloEBijRrwGA
	 LRXaSCIvYFwzYzFs8z4eAnoD9e8jnyjVcnDNHn2HJOPTmEXyhaTBf0o4xlS5HvdIX2Y8d
	 BFN0MHAxBH7yn6g35NjE6vBnmj6/lreS5voeRpxZDYwoTxbR/TyYfoC1lCBd5xlXjWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
	b=StHDU+JvJgrs4dEy1ckh3v5AdArxXE4Kb+jej/uk8H+wnCQtg2i8m8OIew3SWZgW/foe
	 g822JdLlM5NFdjsCU4XDTCjN6FN2KXaz4pJoD/PxUBHjK1k7/AnmfqzTPEAaVBNifDy7j
	 Bl6UIeJapuzt67h2pHLWJR0GD0fm2ISoUUiv4iO5ONSDA0EqVWuRRYklCpgGukM0Umbsb
	 V0mXLsiTU3NRc8KFxuVAuSKS6t6OdEfuHy5JZKx0HqOYFmhLvnEPqr4fpAPIwRTozq3BC
	 b54AYJhtPgkqlw15U0cJik59PLCeQDtDXDfhA63Lni06OT72qZhrhmJjGqe+5t376sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Apu20ChO;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8A5606A331
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 17:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8A5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Apu20ChO
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b1478f06e3so455994a91.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678972; x=1795283772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
        b=Apu20ChOFv2qZwX/V1h/s55KMW9ThG/rNwR6dD60Pv7Z/D8MksZ/3qEL8w18TIsw3u
         Nb9qmnoKkNNw4J/g4L3dxxJdmBCsdDllF9wAeV6Zdd+iDecquyZHCAs+todRo/V+2YDM
         /261WLUuhu8j07gRH555XiVmAbgyIXZc5aSfEuTpcnH8b/I23Lfa06YwzW0zi4bl3QRL
         OtmX+hWcZiC6FvJdbterzs3vmLHDCE80dLRaPTNMmaQ741wRTn850pzRhGHGGPPNCJkF
         HZykVJAqMiBKfBc7oXupBP0ayU1zWSE22NuJ0U8eays8pc7aB6oWAYZt37UfVEzqxZLT
         WrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678972; x=1795283772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
        b=WzB0N46koELT4SdHyFzLWhzah3TlRxXzopKA3WpOiU2AE+PDBJ9OEs9w25BiLW/M8B
         z4+Wj+RHnUhJdB9hQQGe9RxBBwK2Bv+vK2bMp3pHCuZKs1y9jGsivGhSb5EURxxwuPan
         0KJe00ggLxZOEOcp7BC3+6ywDr7BHUxGYu3aQmL8vdd+n2CrwFlvKywFz1GtkqVI2P8f
         7M6gU5KhsHaNP9HSZbxuRtq7SoBBtMGbemF8faYdGsHm5LpgjZcwHHl2U0zP4D05556u
         wOInNpGqCvsv794kzcaxg/CGk5PJNIw/o6xlphmviTQz7/kMck6eqm1lwE6rYGoMGaGW
         9CfQ==
X-Forwarded-Encrypted: i=1; AL+hErH/bll/suF0W1TWtdX+7JeJ17Nu56IjzHbVAgxZyJatkRv11dST61hw54KjKmsyIv4wna/yutc/Oui+t0CH884YdvAl@vger.kernel.org
X-Gm-Message-State: APuU4Z+YkQIpEti9ONcpNgvoMQrd9MzZHZnNE7v5sg5ViTsabCmCQDss
	N3gyq2ucPaRH1jOcDPVBEGfztsMOFNXEvFH5CvYyrMZ9ScZ5GwHIYOsF
X-Gm-Gg: AYBFou1fEZqGaGWriFnBNGYfGc8YSndhu/C2+YiaOEpwJ7qyJhjMB9rsAtvxYB0SAOV
	/9IcJ/OmeQl3OiwlpkbcjJiU5Lnwze4PvPdC0OXSSBk6/hxV9lekGrTn/4L3XoWq7H2ED3GIBel
	3GAbW7B0C5U9rfA9uDZr9TH752L+yZD0b0SCOIDFQJiOTrsWNa5zA8ugPxnpTYQ81oUujn8ZPzB
	1PHT00tlxRWTG8RCZyR0dYq6M8t0929j26/gIW6oC5Ggrw12Ur6aiWmaMs2t73uYOagnuNoAXyH
	ikI/LkCq3KR4NmSXc1JSjjlyqm7XYa6u/9sN/rjr/Uyd8odMom5UnTJymdAdHJsCCow7HsL8CoE
	1zk29vvcrtPEHogc3t176Jih/SiPhNlHxob3CwWITHxCIyRdR08v76up+iFIOCARQhjeJFGeYA3
	YRtuDLXJ9dS0nysaAyWrfeDkGnWQujibJrI++4Cp09YMu3eCLbd6JbSw4AducRwnH85h+sW7pZ8
	9d0iJRAH4hxX06PaXtq+2tpo5871Kh8w+JFYRY7XLr4I/cZZgVhJzSg2ruCkMSLM3Z4v5pPiQT+
	xyCEpUlU54cM1ClYGFyCyuA4BfToaw==
X-Received: by 2002:a17:90b:54cb:b0:3b0:ce1c:e74f with SMTP id 98e67ed59e1d1-3b1b0a3a251mr5483199a91.27.1794678972435;
        Sat, 14 Nov 2026 09:56:12 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:12 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 2/7] platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helpers
Date: Sun, 15 Nov 2026 01:48:09 +0800
Message-ID: <20261114174814.62153-3-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TP_HKEY_EV_KBD_LIGHT handling in tpacpi_driver_event() reads back the EC
level, updates the cached brightness and notifies the LED core inline.
Extract this block into separate kbdlight_notify_level() and
kbdlight_notify_change() helpers, in preparation for reusing the former
when writing a level through the proc interface in a subsequent change.

kbdlight_notify_level() expects the caller to hold kbdlight_mutex;
kbdlight_notify_change() queries the EC and notifies under the same
mutex, like the original inline code did.

No functional change intended.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 40 +++++++++++++--------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 2c3f8cf32..c8098f317 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5317,6 +5317,31 @@ static void kbdlight_resume(void)
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
+/*
+ * Caller must hold kbdlight_mutex.
+ */
+static void kbdlight_notify_level(int level)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+
+	/*
+	 * Check the brightness actually changed, setting the brightness
+	 * through kbdlight_set_level() also triggers this event.
+	 */
+	if (level == kbdlight_brightness)
+		return;
+
+	kbdlight_brightness = level;
+	led_classdev_notify_brightness_hw_changed(led_cdev, level);
+}
+
+static void kbdlight_notify_change(void)
+{
+	guard(mutex)(&kbdlight_mutex);
+
+	kbdlight_notify_level(kbdlight_sysfs_get(NULL));
+}
+
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
@@ -11586,20 +11611,7 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		return false;
 	case TP_HKEY_EV_KBD_LIGHT:
 		if (tp_features.kbdlight) {
-			enum led_brightness brightness;
-
-			guard(mutex)(&kbdlight_mutex);
-
-			/*
-			 * Check the brightness actually changed, setting the brightness
-			 * through kbdlight_set_level() also triggers this event.
-			 */
-			brightness = kbdlight_sysfs_get(NULL);
-			if (kbdlight_brightness != brightness) {
-				kbdlight_brightness = brightness;
-				led_classdev_notify_brightness_hw_changed(
-					&tpacpi_led_kbdlight.led_classdev, brightness);
-			}
+			kbdlight_notify_change();
 		}
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
-- 
2.56.1

