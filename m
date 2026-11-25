Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596521;
	b=OYygVdo0nNlYEaR4U3K+5xnRKBKp0KnGU8wYICwYrO1f4c3ujOYUlSXa80WpchpGdCRq
	 vLf/BPiSN+QXhlFbAp0g+J+bG0J9fLLZbiW7Vj3q0DGVPjNuBEGZQVT48Vxlmt1kyGKBF
	 t2BQNyqbJb21bABBE4ll4zl1w2/EqUlCZFAEpbXVEHamFL/PvbQJp9y7pAlI9F571/xPt
	 U7VHC2MINyBn54CDB5x5Ah9EagUMk0RbkblSCwikQCSQdRwcRH706VnZrxtIgRlZFTWK8
	 n4cwy1qMWpkULbRjKbJL5IplhWNKMupDhoq9Q07wBOl2ORPlF1M61I52xXSHChfJcTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
	b=0+laenZPCsA4I+zMeloIGI/RMfSCcZ1eWscSPETSZSibkLQo1fyxeh04vNFeivVoZKJA
	 tCO5rBDWonoHiZoOMKMoC2jB8aXf0672gKqp9c4GrNFVSpWyx+izygBziS3No9k/6Nrus
	 Ug1AhVjHpYM6czmJ0nU2qj6bBSM7RVz50WHGNtzXVuPgYDQdKME+6bRGLPxxwAyOKVsf5
	 r8LnWBtXkhBpybwIhk52q+hehmsstVbqvNnP1/4lsAKbxXWN50F2F/Ib+xnJewF1PV7QG
	 0V/ulmdbdqnfxzR2OBh6cATUv30MFrDh3jjJE16IiBoyPVIgkCSqQj8bvYFAyma/dhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RYMn/SoQ";
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B686606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 08:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B686606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYMn/SoQ
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso1870147eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596520; x=1796201320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
        b=RYMn/SoQcx7Wdjnvdd1EPOCTHZ/QS6ZqKmnjEg9C7Gkwnemv1AZtInz9AH1DeL0C78
         4cYjAQE9JMzqNo/aJGHpD1YpTTkbr4QNcNy+6I4v7UEsRWrKYBwG2nY8MIapgtyrhq+J
         DRh9yTGf8RiHae9Oa5bhBFQhQcafPHm7B9w8wQaplQ1dA2p55c68uLZ7+h8fInuqY6aK
         PhSnu1cooMe3qksY0t+GB+lzhtEOz//5kiBAc6uVGUvLxWUamSd2LSHrK6GmbXI18/ny
         evTL8ldRhykDqEt2VNdVFPKYlzgpt4UjeGVCPqqAepEdwvFEKHgIZm6wFDdhgJBaILo6
         EshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596520; x=1796201320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
        b=Znla4ccBx83kySzWv38HyTSj6807bBzGgHJfPnRl3ucLrD8DU/6V3QpwWW3o8fkQ9p
         SWpL4L7AoYvN4SDVR/+5j4EOC/gBcERQRsRX+JcFbKImpfkxPKL5nuL3b+gtDu8AtzKz
         cgwy5eYJ+300/+qB4fjF4tWzeRjhejDfQeOG1BGdQIdTLfSgXM8m0VIKDhURWCrJcxTK
         Ju3liPSFmbp7mo1DywAZJPzP1Om1qUIzSgus2z1Z9FMn7THanJ6bk5wx4SiH/q2gYj9S
         L4tfxO0vcwsajNcIwZ4uc0BV3A/zbRzXDoHrkzf0di0jb+rm7n4Z1NyKX84SL0C9u3S1
         lLFw==
X-Gm-Message-State: APuU4Z8kGOTwXJZmdngdEyrDJT0QpaWNDuI/vL5GCmyu7yrbx3GZ11HO
	u/HqrWJWQGzvT/EsUxb8oBUpDY2nTlqQna/JeQBqQ/+K/TDnvDF35zkB
X-Gm-Gg: AZFdTZecKJXaAC+cETMijd1PM8XJQZE6Hnp+98QmkwF9tHFLhQtsul4uvCI0JZ8AkE1
	wkLKQQ0cWw9AmvuVi5OQ7Zv4YG40m0Bou75ux24N6xrwzOfYUaxt2cgzlP99OSt/VH9g6Qy6fEh
	f2mz+9x0PS9y7aSSAjHcmlfAMbELcDEqpskQnDMHHrltyB/cnpyoVgjCTv4wrRWWfSktklJ6PGh
	xc/kxAGouZlA3hTlx9GWbJsuivccQ4oXy3G+iMyGtFeSrDsS6StlRZGjE42cW9w+QNRjRbZOlfl
	F+7gZAMB1S+2LO7On3frSe7x+PN9wJy412DMBK14CL//AEnsvn8gl5hLmQyD13PTv1qGIi1JwKL
	hXvftHxk5QuDAm/TGGRrTMWcFmJ3+pCFIwMqEoNYLOON3OdeJMSKxlCAnnL9c6ZV+p42JOMzRWA
	/biaWwRCBFM3xOsSgMC3AzwVf9qq75GVQNvEKneB9jquHKMf/9I/VdrF/KpUW+z7Nd0AgbuyxxK
	1Jym3xaOdqnkSJ5FxNOUXmvdNjwWQFGIXNxeyqxBtXK4detkFxXeWmW7Vk/BScbpXWfkEdJjSus
	jAJz0mn3n2JhkSFQKRX96xWevFoD
X-Received: by 2002:a05:7300:ec8e:b0:386:a97c:f80d with SMTP id 5a478bee46e88-386ce3a8f03mr1873307eec.27.1795596520027;
        Wed, 25 Nov 2026 00:48:40 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:39 -0800 (PST)
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
Subject: [PATCH v4 1/6] platform/x86: thinkpad_acpi: Report auto keyboard backlight mode as off
Date: Wed, 25 Nov 2026 16:46:38 +0800
Message-ID: <20261125084644.137506-2-kmatzkaczor244@gmail.com>
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

The EC keyboard backlight level 3, which selects the auto mode, is
passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
then reports a brightness of 3 with max_brightness 2, both through the
brightness sysfs attribute and through brightness_hw_changed
notifications.

This is not only cosmetic.  According to a report on a ThinkPad X9-14
Gen 1, UPower 1.91.x treats the out-of-range value as invalid and stops
watching brightness_hw_changed, so the desktop no longer follows the
Fn+Space hotkey after auto mode has been entered.

The auto mode is not a brightness level.  Report it as 0, which is
within the exported brightness range, in a new helper,
kbdlight_level_to_brightness(), as ideapad-laptop does for its auto
mode.

Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
Reviewed-by: Rong Zhang <i@rong.moe>

---
Mark Pearson's Reviewed-by was given on the v3 version of this patch,
which did the mapping inline in kbdlight_sysfs_get().  The helper was
added at Rong's request, so the tag is not carried over.

With this patch on its own, on kernels that still use the LED core
suspend/resume path, a backlight that went to sleep in auto mode comes
back off after resume; before, it came back in auto mode, since that
path wrote the unmapped value back.  The rest of this series restores
the level the EC had.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..31d3721bb 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data = {
  * Keyboard backlight subdriver
  */
 
+/* EC level that selects the auto mode for the keyboard backlight */
+#define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
+
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
@@ -5135,6 +5138,15 @@ static int kbdlight_get_level(void)
 	return status & 0x3;
 }
 
+static int kbdlight_level_to_brightness(int level)
+{
+	/* Auto mode is not a brightness level; report it as off. */
+	if (level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		return 0;
+
+	return level;
+}
+
 static bool kbdlight_is_supported(void)
 {
 	int status = 0;
@@ -5194,7 +5206,7 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	if (level < 0)
 		return 0;
 
-	return level;
+	return kbdlight_level_to_brightness(level);
 }
 
 static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
-- 
2.56.1

