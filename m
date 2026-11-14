Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678930;
	b=EPdPNFYfhtzpFzZ6oiXTGtRfuLI9Bo3s5JyxWmRNjoNKVln3n7XWLjBVKjBReiHk7n11
	 gjyYXQg1wEJzYYE+XTCIlP7SGyJbV0XhN7+mJxB/GNzmeNepZrwCxfeqROaa3Gxbj0dzW
	 0gadOdQv5IEX9eb9L7w8FFPzeDUkml6PAkoBdGw9R7hxiaLGtUqvQmm5Jk42PEIg5EFGU
	 9JtJI/wINPvr0P98Qwu6IZqN1DXpw36M6BhpWmQT73MlLRvJRGTB/7bcLzWVIq2JrFPdE
	 8NjNLJafKTuk9YtvRb2+dEEkxmYG3HDfZja93e7VoHEnLBBEGcmdP1O0qSVUxaocYVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
	b=y1mci0wCOBX0e6O2u5/06pU80xnolC5y7DPR7pLPFva0etLZjeyzkFqn2WQY4MGah5nh
	 tGa6UaqPMUmrdUs9bp9iYdPpOVGXaCY8+4A1GetAACAKVmQrlYc1dbAptkdbZ4XsnaIor
	 03Uxt5HBBamsFtfigfeWIPkJT8utM7iJeVZBgbSdcAxFLXrGChqbVRPkVo/S4BF12vU0m
	 DKgf85GjrdNlMfNulCDHzV2IlgvIXdEwuSW9W02cfu5kmjNqdGp1eNqdkxbiwhS6SC/Kz
	 SU8maXkHJK3D03INchNTMBdPSRt2i65xg1E5RKTsGtqxLWB5bmUN+BBVR6Tfn9OQgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiM13zK0;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC4606A327
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 17:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CAC4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiM13zK0
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3b108f702f6so775872a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678929; x=1795283729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
        b=fiM13zK0DL/FdZuhzfWqUQ9xC5yOmnRfrBTlGDXRkL0eH0ShXWM1kNISd32sNJK11M
         EBivrGtddVHeC7bE0RelcKO56Az/DRdWpcVC1OihoMK679fbkrsIFFJwkNrhpxlf9SjR
         s6Sc2M3USl+Pz42a1HV9v85kpXO1rMxXjZF/PDbKxyIEqG3y9TiL/Ole9CcXxRecjI/N
         zhzsQ517jvvYIn70Pgn3YViNDh+D/aoB+6x19NZpFDYM9omDMGRFS6q+SMzvdaZgcAGZ
         2k7jGeynjw9ewaoRwMxyMJ6aGSSEH/xbyPDxbtDhP9GIC9ECBKkIO2sWBique9Rxinqg
         sOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678929; x=1795283729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
        b=kNVkQykPuWqXnhB2nMm5BZPmgVenCzPq/tf9HNmlgHkDzLruBQztM1JS4m8Cn29kNi
         pzTsUjtIM3UrW3xQ8bwLThCih3ARufP71Z+gG/TPLPQ/7AUHzI7oSwkTRoTm4k13iqzF
         necs4vVXB5SDiOSh2Dh+N8FiL3yBrJIwOMzVDGQTnGvUSaO82sNDJiDRKbT4m8IP3Zvu
         hGkf7IR8JhCJdj45utEoc8yXEQpRZmVuek8jBaTjFPx3JEMcckiu+OsejqJxgdUv4tLT
         J1leKobX5D1NN5plf+zCgTnhZiERYqsuRnfGEaMlK76kY2mGAnxaFkQ03Ln0IGWJc/Xe
         w2YQ==
X-Forwarded-Encrypted: i=1; AL+hErGwJvU3zv1xH+9Aty8Zl2KWtqJsM03jHPxL8adAJsflYLHSwnG5Es0HzCxxx9HE+gYpVY99JVXWhfxDrZy0oDm6A/w2@vger.kernel.org
X-Gm-Message-State: APuU4Z9R2z2PvKsMMd1NkBdBL7MTVYxO2/0UieUN6k0k1B2H1FOHtBYn
	14pGhB2oVYKT0TU8eXM0vKHCuhjPV2oSh7A2DXZsWtOcnm882vK3mY8Z
X-Gm-Gg: AYBFou2iDwc1FltyiLRUAEiTNaWQrs5uyCky6rnl1nsbPdVMCARRwQ/AftN8qLejG8I
	6N/pUjSwQ8FduY3v1bRYf0d40i/SAeDMuS3R3zH+fGsG31rwMXmT3ZmGUE9UJUt2wN1FV91/ywM
	6PgyZD1aopqiu4RL7XcukAe0JZTiBc75wrGc+pS+ndW2V59Wmn47pDNbHTx5CaK4xs8JkZu8/2g
	skpR4KVVi//WqL7BlOUkh/5C9SSYbPZ3noZA2AwkuA0F1CRjfZvuAYdwHKHph+JdSl4T+5HpquA
	rCo/GvR4cLsS/1uWpAEr5x8cGy8MR8t1PXBuVYG8ga716sZ6KGHA0Xx0QEBRviFaqwkcyZxvJHZ
	9zMC56720sqi6v9nDTysATY60BCemObnIYpXNcspJ77h4wX5ilATtODl96XJ8mhjvpswripUqTg
	iwTyshcjZkJL3LlgG0BRCIQUrkNVIFWn8ML0yaPfhRoSKHbx8KlmOfIyy/ZLaJZQ49dfqsUWp+6
	fpeBz5b1h1s4jVEs08vrAi52onpu3sL5sO0j2zXid5d8FanHg64GsuxFPJqQWw8vh56siSpzaig
	FvPTdsCVWL2YslEXfYvKvQIWM9hz
X-Received: by 2002:a17:90b:4ad0:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b1b09f3fa7mr6658391a91.19.1794678929303;
        Sat, 14 Nov 2026 09:55:29 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:55:28 -0800 (PST)
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
Subject: [PATCH v3 1/7] platform/x86: thinkpad_acpi: Report auto keyboard backlight mode as off
Date: Sun, 15 Nov 2026 01:48:08 +0800
Message-ID: <20261114174814.62153-2-kmatzkaczor244@gmail.com>
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

The EC keyboard backlight level 3, which selects the auto mode, is
passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
then reports a brightness of 3 with max_brightness 2, both through the
brightness sysfs attribute and through brightness_hw_changed
notifications.

This is not only cosmetic: UPower 1.91.x treats the out-of-range value as
invalid and stops watching brightness_hw_changed altogether, so the desktop
stops following the Fn+Space hotkey once auto mode has been entered.

The auto mode is not a brightness level.  Map it to 0, the value it is
reported as most of the time anyway, in line with what ideapad-laptop
already does for its auto mode.

Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..2c3f8cf32 100644
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
 
@@ -5191,7 +5194,8 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	int level;
 
 	level = kbdlight_get_level();
-	if (level < 0)
+	/* Auto mode is not a brightness level; report it as off. */
+	if (level < 0 || level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
 		return 0;
 
 	return level;
-- 
2.56.1

