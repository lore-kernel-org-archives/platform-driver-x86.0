Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192205;
	b=5BCuiAd+J3QuvufE/PGXPk6wmCCbn0amJ19zD4N2Yxa8OQx8jEMboJOZwTcBNFNpjGWe
	 XpW5lZeYirHpZw0iHWwM0Fd0TE8WqBK40L7ikwR3RdcXccsAmSVXIpfuG07wtj18mXtj0
	 QMZg6RLU3l2DoBwNImeTjMqVZrq6dy8qD1XiDePB/8JD9UNC5Q2aJ2ukurjfuLX7MEVU+
	 n/Q5/y2Wq25p0ECBMYmBqLwCA3qLwI2oJs0uBpx0s63acj8Q6z37rbmPidwfaQKQyg7CM
	 JLUr8YKUxqjTxYqYQVi/8NWEmOTS4e+1r8qw9v6rvsn35zLV364OWUkDouL8sF29Dng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192205;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Uuhr8MUZR8lhjXcQO9nBg0Ja5UhedYbN5OTpkmm1QG4=;
	b=QoqEAX9u0LSIUIN3e1G9bK5LFB6wS1+Lz5Ym2HmHeaky4ujBrpKYVCxy5xMUqopHQIkQ
	 Osj8AdBHPqqRy0lliv5Hn+o8M+HRC6jr2A5acaV5TlI+Euymk4JeH8tAjXJ8os6hTsbJ2
	 Hg/0NhFXS78zkgxV8ULprnQXIFc8KpkQnVO+h3SBo+kvWaAWt5lvDlwDWIUbbLJocPvJ4
	 72sxNlf46TM7UfhsfXNU89u5iVJAQTf5rqd3V8Mtu3iqSJp4IKi0bneSnPgDzeMr945qw
	 Z12pErWb6eFSlsqTlB9HL6Nw72G7tdvxSufcknYTReJzgDFSEVQmaXG5bEr6epoZZCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc1t4wfM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE848606A336
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc1t4wfM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1111F000C6;
	Fri, 20 Nov 2026 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795192204;
	bh=Uuhr8MUZR8lhjXcQO9nBg0Ja5UhedYbN5OTpkmm1QG4=;
	h=From:To:Cc:Subject:Date;
	b=Pc1t4wfMvmAINds6625S+aUz5XOF84VUuuRqIez24fWrs29ls7NhOeQZ4OjsF8Hxl
	 C2zPEhiXDtMCozIqaSLeZoKB7z7Fun4D1mE+6OgmdkbSdimrzb3E2+33axKTpV8bdK
	 zLA1d69p0v0tcYtJx8RnsBbCPYbw7F0Sjtrk0P5ezZL5T45gT8clZlp8IBhtIWS4bj
	 vFMpL5KlBeX0UdDAYqZbfgSn+SAVse2SYpG3t5lduL29Q8tEJAhZCBnyiXFVos4pEa
	 q9RkJEWjvqzXpdHztin/Xv3jjO0aV33BzJn5DbX3BQS2rE1yxmbUY8CBqreTDC54JE
	 SBWcLqTo+Yang==
From: Thorsten Blum <blum@kernel.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Seth Forshee <sforshee@kernel.org>,
	Matthew Garrett <mjg@redhat.com>
Cc: Thorsten Blum <blum@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: apple-gmux: Fix max_brightness limit check in gmux_probe()
Date: Fri, 20 Nov 2026 17:29:41 +0100
Message-ID: <20261120162940.867852-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3989; i=blum@kernel.org; h=from:subject; bh=NXXlg6XpO2rvwskGba49fP4JjOj73wkgnmwh8QIgPKA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDNkMpSV8mc9uqDGdjTqWY1ats2tH8u3yfsOlFw9oW6s0C qgJdCR1lLIwiHExyIopsjyY9WOGb2lN5SaTiJ0wc1iZQIYwcHEKwET81jMyzJr2VeLf2ozvOgKS 93p/reTJ8L/nLeUQ+q398IP66edfTWb4n8QXpxf18kij467FKpF3VfYutnVYumSW184TIdK9DWe vMAEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

gmux_read32() returns a u32, but the maximum brightness is stored in the
signed ->max_brightness field. Large values can thus become negative and
bypass the GMUX_MAX_BRIGHTNESS check.

Store the maximum brightness in a local u32 variable until after the
bounds check, and then assign it to props.max_brightness. Use dev_warn()
instead of WARN_ON() to report an out-of-range hardware value.

Also move the backlight properties and maximum brightness calculation
into the device registration block, use a designated initializer for the
properties, and simplify the comments.

Fixes: 917ee75a5916 ("platform/x86: Add driver for Apple gmux device")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Store the maximum brightness in a local u32 and assign it to
  props.max_brightness after the bounds check (Ilpo)
- Replace WARN_ON() with dev_warn() to report out-of-range values (Ilpo)
- Declare and initialize props in the device registration block
- Simplify the comments
- v1: https://lore.kernel.org/r/20261120142914.825047-2-blum@kernel.org/

 drivers/platform/x86/apple-gmux.c | 45 ++++++++++++++++---------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 9c728ac4e045..4f7ed3c563ce 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -781,7 +781,6 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 {
 	struct apple_gmux_data *gmux_data;
 	struct resource *res;
-	struct backlight_properties props;
 	struct backlight_device *bdev = NULL;
 	u8 ver_major, ver_minor, ver_release;
 	bool register_bdev = true;
@@ -857,32 +856,36 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
 		ver_release, gmux_data->config->name);
 
-	memset(&props, 0, sizeof(props));
-	props.type = BACKLIGHT_PLATFORM;
-
-	/*
-	 * All MMIO gmux's have 0xffff as max brightness, but some iMacs incorrectly
-	 * report 0x03ff, despite the firmware being happy to set 0xffff as the brightness
-	 * at boot. Force 0xffff for all MMIO gmux's so they all have the correct brightness
-	 * range.
-	 */
-	if (type == APPLE_GMUX_TYPE_MMIO)
-		props.max_brightness = MMIO_GMUX_MAX_BRIGHTNESS;
-	else
-		props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
-
 #if IS_REACHABLE(CONFIG_ACPI_VIDEO)
 	register_bdev = acpi_video_get_backlight_type() == acpi_backlight_apple_gmux;
 #endif
 	if (register_bdev) {
+		struct backlight_properties props = {
+			.type = BACKLIGHT_PLATFORM,
+		};
+		u32 max_brightness;
+
 		/*
-		 * Currently it's assumed that the maximum brightness is less than
-		 * 2^24 for compatibility with old gmux versions. Cap the max
-		 * brightness at this value, but print a warning if the hardware
-		 * reports something higher so that it can be fixed.
+		 * Some iMacs incorrectly report 0x03ff as the maximum
+		 * brightness even though the firmware accepts 0xffff at boot.
+		 * Use the full brightness range for all MMIO gmux devices.
 		 */
-		if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
-			props.max_brightness = GMUX_MAX_BRIGHTNESS;
+		if (type == APPLE_GMUX_TYPE_MMIO)
+			max_brightness = MMIO_GMUX_MAX_BRIGHTNESS;
+		else
+			max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
+
+		/*
+		 * Keep the maximum brightness below 2^24 for compatibility with
+		 * older gmux versions.
+		 */
+		if (max_brightness > GMUX_MAX_BRIGHTNESS) {
+			dev_warn(&pnp->dev,
+				 "Maximum brightness %#x exceeds limit, capping to %#x\n",
+				 max_brightness, GMUX_MAX_BRIGHTNESS);
+			max_brightness = GMUX_MAX_BRIGHTNESS;
+		}
+		props.max_brightness = max_brightness;
 
 		bdev = backlight_device_register("gmux_backlight", &pnp->dev,
 						 gmux_data, &gmux_bl_ops, &props);
