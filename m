Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596538;
	b=1VBpcdT5OBnQciFfXXdN68BI1/QzaaxHMCDiGtjgBWkzqXZafZHIB6xN+MaAQ7gvWsZW
	 G6uoZ1u46DLXYP36rkKWTQ33KPrwZlLUF2Rbqdb9jyVX3XIA2GRxuGjJFm3Hcti9tGKmK
	 +RZR36aneKAYCBBow6Kt9KUfjZcNvUW+dVz2l0ut9o0Q+Ab/UFlDAPQq1FZgfCAHaa0ji
	 bqZY2jTv+n6V/2DkZpVR3ZxISVx3TBWCfYyr2M+Oji4kFJyTWw6huqcHaMfIW9EHYAePl
	 U97ohdURsYbmpk3ks7AwxL6zhBPdhwd5jkO/lPlBoXWzvsfbqFdHKPvBGBiImANaRfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
	b=FeZhlDKmv/fkonoKJRCKcEojgyEHG7qa59UTGveB47VFvSh7mHpIUoMtFa0XeE/jkF69
	 66HqojkBYADsU5kAT8qSld2/suUJtbuG/g9PCW4Rci+VoPMfcy5jJB3HNCYko9GoRazcY
	 B6JRz8Fv34r68CVN7sTcNmUaG1NYXXOatjx1HtSd5GeF6GXo8/DJ3Z4ve9MMtExO9d31I
	 S/R8hsrW59HiK/93Jk9Lf/zjTW6Vejoz2eqEYWe/dJDEt8oqJEX618sxEHuH7k1dWDzfS
	 OlwKdCW10MhMA8Y63ewgYKyBkLWR5H3WvYmPPWcZ46LQuwcF3IMp7sgHZLSG9caiPiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OEn/KbW5";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F29606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 08:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F29606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEn/KbW5
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1097643eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 00:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596537; x=1796201337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
        b=OEn/KbW5jpAo+41iRtKb1w9uUHwteSvs6/MPi9hNvFMG7O9KHOXJWPZZqbSgMDWRFk
         8+C4gN4GnxsqYK5YWtogGjhuDz8sAqz2Ksq2fEfNY8egzqlX++bR1ZHiwi2HZ20z9B7f
         lZ89cMvxdMGjPRi5bqQIquHuOOa98bkxrtIKT8uax933U70r7CRgc5iRLf9qXbAoosPw
         QKuINJaaFA59jsb+kjcPuDOqAzKetTTaNi47f9EvChflPiI4V6lEoyPhVLG+1LnCA3zd
         Y++V3HjA82QB/2rutvHyv2do69KEavmqC3nrCCI1c6WVKrAy6ICvtX8vcl/N9x7ucDSG
         mWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596537; x=1796201337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
        b=mjWRMOksOPpe+pPEx+cVdI8Jr20XWw9T//OopVzVp33SdHXNcJbTaMX7zsIWq+p5qU
         7MGZTXu6XJo5Z1allezYc2FLAGkpEqvdfzTJ2yDKqHTBiZ5MJPf9Oz22S/L33UmzxSY+
         hh10EhGzg+yzu0W9hSDB6hvcQpvpfO3loxiLYTagRTXoxiTFnUmMleDYHL+VV0N1UzVM
         UtC19IO+oIObzAnmrmqLOVq7R05QCNHsh+WxGagUdMCd54Ux3kydfL3HhojgFj4u7vq6
         Df8sa0kxhDkzH2EB2U/CMMPlWUuPOPA575r1pMYzQZ8H2IeSTuIVlh5P7dVTsJxqXVdM
         3aTQ==
X-Gm-Message-State: APuU4Z/mp50G89HFYAyR3LQvlVvmBiQlorgLh5VXm7PzXO2JcTEzeGFH
	ttV8b6WPbSkeZJxt9CLDD95Q95Eg0ey6ok5rIYlV+GdbZ5DQSVcSzVYG
X-Gm-Gg: AZFdTZfTTekwyoMp43gKRUnynL9Cu71CC8OvgpHG4j+QItTYFnHyh9YRtxwfjMkR57o
	xJHHtFaTLZeuqWgVFKOp6g7BfIDA6IzqFak3HkPFRPTL2MLbZ6AOWPjs6lqJaf8hYAXXTHlMdC+
	Oai5z2TweRf0D/QNYprTTp9m1353kTuw2C8nL+vfGmzpxgx+YJgdkuFI0FktcdY9LT1apUodGrJ
	HbGY+0tamzJ8wmz2qd9mo9zgld7wWlvO4GPSBpMNqMvLFpZMgWUA1efD917rVurid57t1ptTUwO
	BD7CGijHvUdJa/4LcYLr/YE7mwkLJHPiyZEkH16fmu1zaFv2TzASeTuhUooLDSxB0rgB9QC2y+m
	JMyaGgIFQhZswR5wHzDpbatlAsoSP+AQmwhCqnrJnM1sRlxTAmlTNnbUZ5SHImAcPtLyKOHv57Q
	PUi5WpAJSlLY9nipKV0HTwxv6Bsa6oZdsU1w0rioYgmQgaSqjPi90P0w1+VnuX6RTMiGiVUs4+l
	Ry3cKAtC85aqCeNFDM3Rgp46EgRW/f0RErg4smznJtHSSHkVL9irx13LJjw1oFXWBgsSgkOC4Ah
	YZWTQV2kIgweRg5VsvKUa+L+cAHkFQ==
X-Received: by 2002:a05:693c:42da:b0:386:95e7:8497 with SMTP id 5a478bee46e88-38695e790e1mr13921792eec.28.1795596536872;
        Wed, 25 Nov 2026 00:48:56 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:56 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 3/6] platform/x86: thinkpad_acpi: Don't poke keyboard backlight's LED core brightness
Date: Wed, 25 Nov 2026 16:46:40 +0800
Message-ID: <20261125084644.137506-4-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

A write to /proc/acpi/ibm/kbdlight writes the EC level and updates the
cached level under kbdlight_mutex, but then assigns led_cdev->brightness
directly after releasing the lock, without telling the LED core.
Commit 06da5325d02e ("platform/x86: thinkpad_acpi: Stop setting
led_classdev brightness directly") already removed this pattern from the
sysfs path but had to keep it for the proc interface, which has no LED
core path of its own.

Stop writing to that cache.  kbdlight_set_level_and_update() now only
writes the EC level and updates the cached level, under kbdlight_mutex;
the sysfs path uses it, as a write that already goes through the LED core
does not need to be reported back to it.  The proc write path instead
calls kbdlight_notify_level(), which updates the cached level and reports
the new one through brightness_hw_changed, like commit 07f48f668fac
("platform/x86: ideapad-laptop: add FnLock LED class device") did for
the ideapad FnLock LED.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

---
After a procfs write, led_cdev->brightness can retain its previous
value.  This is acceptable:

- Reading the brightness attribute calls brightness_get(), which reads
  the level back from the EC and refreshes the cache.
- At this point in the series, kbdlight_suspend() also refreshes the
  cache before suspend, so led_classdev_resume() does not write a stale
  value back.
- Software blinking may pick up the old value as its "on" level, as it
  can after a Fn+Space change.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 44 ++++++++++++---------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index b4b3d7dcc..16bf2267d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5113,12 +5113,11 @@ static int kbdlight_set_level(int level)
 	if (!hkey_handle)
 		return -ENXIO;
 
-	guard(mutex)(&kbdlight_mutex);
+	lockdep_assert_held(&kbdlight_mutex);
 
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
 		return -EIO;
 
-	kbdlight_brightness = level;
 	return 0;
 }
 
@@ -5147,6 +5146,21 @@ static int kbdlight_level_to_brightness(int level)
 	return level;
 }
 
+static int kbdlight_set_level_and_update(int level)
+{
+	int ret;
+
+	guard(mutex)(&kbdlight_mutex);
+
+	ret = kbdlight_set_level(level);
+	if (ret)
+		return ret;
+
+	kbdlight_brightness = level;
+
+	return 0;
+}
+
 static bool kbdlight_is_supported(void)
 {
 	int status = 0;
@@ -5195,7 +5209,7 @@ static bool kbdlight_is_supported(void)
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	return kbdlight_set_level(brightness);
+	return kbdlight_set_level_and_update(brightness);
 }
 
 static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
@@ -5253,20 +5267,6 @@ static void kbdlight_exit(void)
 	led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
 }
 
-static int kbdlight_set_level_and_update(int level)
-{
-	int ret;
-	struct led_classdev *led_cdev;
-
-	ret = kbdlight_set_level(level);
-	led_cdev = &tpacpi_led_kbdlight.led_classdev;
-
-	if (ret == 0 && !(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness = level;
-
-	return ret;
-}
-
 static void kbdlight_notify_level(int level)
 {
 	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
@@ -5326,7 +5326,15 @@ static int kbdlight_write(char *buf)
 	if (level >= 3 || level < 0)
 		return -EINVAL;
 
-	return kbdlight_set_level_and_update(level);
+	guard(mutex)(&kbdlight_mutex);
+
+	res = kbdlight_set_level(level);
+	if (res)
+		return res;
+
+	kbdlight_notify_level(level);
+
+	return 0;
 }
 
 static void kbdlight_suspend(void)
-- 
2.56.1

