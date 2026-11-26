Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683606;
	b=1mhHvllA13wMpRJ81Z0hRMweR4USUutyYM5XGNnruE2g8/dcI5ad5710NMHAs+RIlRHD
	 CSoIa9P+s6qzmoqwFNPhebPU/DxDEOdicwGazjP77xSxxZrGtR4lfH1MKEMDJYOpCHVC4
	 zNvX5YnCZ+/hosQHcZOi5hJexhNMv9EZc1Ak4lFTTOCGfnct1MRAzLgiUQBWTmrywV5No
	 XXOrJmPlQj8jYgyDJa8b/XPFedTqVNzdQXvGTWMAGnpqMEUEt0twyH1hWW09+tW8MeVJx
	 VQyR5lOL4I7y8UT80hZNGlhOwAqH53bcronLxqbA8ppJypdL+JDqZfJUykerESQKPtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yh6+sXWyFXYfKUalssHUgOWkgYxwHId/9h6FjzDeYnw=;
	b=wGPvCzLcyTVcCr0MsixRpJPHEm/cwj2k1wKuXHeOId9HOrgdL0ifAS3a+j6oRkqvcZh/
	 Y7POD6tepK3heS5XCDe6A07MD33iCheS4Dxzl2VjORZZkfzRBBq5qGU/8AThI10Xe/44K
	 T/ovjc8fC5RfpNnOEtqPcU47vDh69HD7QtApi2hjiw/xH6JlABV0CAa8Un4rLi8TlHacf
	 Di0qmiyKXS/EC8wADUc1zN5iSWIJ3VxZCxcNLmk8ym97evVuNWvEuPswUkxKr3NdYx5+r
	 AlSrVTrZHRShWlEb7DjYI7odZMhvmzh147IeCYbq7KGbIBlWp7OjFExqf1fdd7/4qyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYyUkC9p;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F88606A32D
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 09:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F88606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYyUkC9p
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f04244c3d0so54892455ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683604; x=1796288404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yh6+sXWyFXYfKUalssHUgOWkgYxwHId/9h6FjzDeYnw=;
        b=SYyUkC9pyDvvYV8Jf92kRJ6WhPuREuUiQIUkxGQFo4JSwJ3/7amNxqy4amIcd9Ffro
         TxlCQ58zYSWFxwpX9ixk274Vnf7t76tuf/9jtHs3IEu71zdmOppL4O7WcUWi5cFNjMzH
         SqjvnmomCq2gBqkY7e+3fri6BuHLpaAgiZh+3MvCWGEqo5L/tDNOJ+OlEOhnEoZ5i1Sq
         qMIn6qp164UW1QbKh/xoRZ0JKQOcVNGtoNQFKJda8yUysJg02rl3yr5f8Qlrr6U1gteE
         ZqkQ5oaM+eEcOme6qok3l8vwUn4yWZVwrwrr54edEIM8TS7A67aidHnmPnGuoKkCu033
         v+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683604; x=1796288404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yh6+sXWyFXYfKUalssHUgOWkgYxwHId/9h6FjzDeYnw=;
        b=0pFb7MwIapYV2S4CCwT+P6QIYml5/AQkkF/iAclNBRHMiN9UUZLWaWJrSr5XqESJtx
         a0m3a3fftZmdY2vwk+WKxiXuJ6JIos4oy5KdJP8hDerBFpH1PbLLhBRTp6k5onw01T2c
         FHc/7pxwD1Shxm7tKaM23v1bsa3Mq9/hKZoS1osmFcvga78EPfm84mAkbDB/v5ZJFpzf
         BE62UZULbTim3QQMYTQfq2ylnQJeQ2//TeHYnjQCg2GKFuKK5ycdO2OKM/U+s4fOlJ1L
         ZJWsSuRVG7uKnWV4Or6drlewIKd7sCz8lrtL02gEPj9ymqeZlacD8qBYq+nnhE2WJOgJ
         S1iA==
X-Forwarded-Encrypted: i=1; AL+hErEXEqqPVyHt5bVjoiVFyxe97LOc7U6LnMp3Qjxk8H+bt0akeVIBs+7sNsdpUrcMo7iXZ0hAasM4U6dEDyg46IZEDjHn@vger.kernel.org
X-Gm-Message-State: APuU4Z8FWq6iBIPViUmJ1NNcXeuN5VhwXQt754LrLRPiUL4vTm5paPk/
	rGN1LjmPMC7C6RzqHCQNH97qUgFKGo6TrTkvSw/Q+yIgY5+V8Bz9QNTO
X-Gm-Gg: AZFdTZc6ivxHoGVCLMJ5d9/WVDNC7llNEl888Bo3d5Vshg4dx31BxMBntNs06hm0msK
	E7kydtNP8s286DTpB+u1razu1Tse0Do7v0XWRM3DXy+KAPCC5M+GQcHX/3bSxuV0nMVjnTJnx1w
	fEW0qK7WqXFkl4iNKKhTwi05I4W5tBgzfYGHZexqWuKuFxCC8wRsT5l5cR+tNUOCwy0RLDKNoq7
	Yc7pEc2M0FoC8KnTpCrsr8HeWEc0+R+5eLUHxBRHOknHI8TXRbw8OmOxfbNxXRPFMkKreLG6F8N
	ovOxBeVpOGGclE9AdYAZKcim6FPFflXIJ+wr7c4ioYUJTZWAdhAZX3GJBkC8MAZWQjlmAr5vUfY
	D/qnqi5FUO90wst0REgSEq2dtXy4qnJtKcKlhHtrkrtQU+9mz3IjpxLhkgdz7Yjdoj2QgLxBpgW
	zphTzTqyJHQHC6tzNMX5qXf6JT7GHx9mmGbip6uUprc7QmjSCvlZO8Ltio4DDGk3GFhaK9uRvEE
	FtFvY8dc/GYqHbc4WIuswtVhtYnu+hCm4j4F6IQbpVYplzXPDv/Mdgl6ncb42rOThrRyb9TTs8P
	mYvS/qyJAZsY15hB1KDCh7AZSc+CZmM6eyn6Z6ind5QWGBeTNnq/fOLxP8/GCliwTtk/auRIghl
	1wfSRf3LJAQuYFWHpBAdkV2M4/H8WgMJE2xVQW+Ew0w==
X-Received: by 2002:a17:902:da83:b0:2ef:e5b9:5841 with SMTP id d9443c01a7336-2f050c1d8cemr196509805ad.35.1795683604307;
        Thu, 26 Nov 2026 01:00:04 -0800 (PST)
Received: from aster-ThinkPad-X9-14-Gen-1 ([2400:2410:5f2b:700:da16:d35e:74e2:c7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0ff28fda8sm424145ad.56.2026.11.26.01.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:00:03 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Huang Wei <huangwei@kylinos.cn>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	klorico2@lenovo.com,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting on X9 Gen 1
Date: Thu, 26 Nov 2026 17:59:37 +0900
Message-ID: <20261126085937.53711-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On the ThinkPad X9-14 Gen 1 and X9-15 Gen 1, the EC reports fan1 RPM
in registers 0x84/0x85 and fan2 RPM in 0x82/0x83, and does not use
bit 0 of 0x31 as a fan select. As a result fan2 reports fan1's speed,
and every fan read overwrites an EC-owned bit.

The EC also does not latch either register pair, so a read can combine
the LSB of a new value with the MSB of an old one.

Add two quirks: TPACPI_FAN_2REG reads fan2 from 0x82/0x83 and never
touches 0x31, and TPACPI_FAN_UNLATCH re-reads an RPM register pair
until the MSB is stable. Enable both for the X9 Gen 1 models.

A single fan level write controls both fans on these models, so second
fan control is disabled when TPACPI_FAN_2REG is set.

Tested on X9-14 Gen 1 (BIOS N4DET42W, EC N4DHT39W).

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 79 ++++++++++++++++++---
 1 file changed, 68 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..266f774b8ac3 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -7964,6 +7964,8 @@ enum {					/* Fan control constants */
 	fan_select_offset = 0x31,	/* EC register 0x31 (Firmware 7M)
 					   bit 0 selects which fan is active */
 
+	fan2_rpm_offset = 0x82,		/* EC register 0x82: LSB, 0x83 MSB (fan2 RPM) */
+
 	fan_status_offset_ns = 0x93,	/* Special status/control offset for non-standard EC Fan1 */
 	fan2_status_offset_ns = 0x96,	/* Special status/control offset for non-standard EC Fan2 */
 	fan_rpm_status_ns = 0x95,	/* Special offset for Fan1 RPM status for non-standard EC */
@@ -8012,6 +8014,8 @@ static int fan_watchdog_maxinterval;
 static bool fan_with_ns_addr;
 static bool ecfw_with_fan_dec_rpm;
 static bool fan_speed_in_tpr;
+static bool fan2_with_own_rpm_reg;
+static bool fan_rpm_unlatched;
 
 static struct mutex fan_mutex;
 
@@ -8073,6 +8077,9 @@ static void fan_quirk1_handle(u8 *fan_status)
 /* Select main fan on X60/X61, NOOP on others */
 static bool fan_select_fan1(void)
 {
+	if (fan2_with_own_rpm_reg)
+		return true;
+
 	if (tp_features.second_fan) {
 		u8 val;
 
@@ -8093,6 +8100,9 @@ static bool fan_select_fan2(void)
 	if (!tp_features.second_fan)
 		return false;
 
+	if (fan2_with_own_rpm_reg)
+		return true;
+
 	if (ec_read(fan_select_offset, &val) < 0)
 		return false;
 	val |= 0x01U;
@@ -8202,21 +8212,48 @@ static int fan_get_status_safe(u8 *status)
 	return 0;
 }
 
+/* Read a 16-bit RPM register pair (LSB at offset, MSB at offset + 1) */
+static bool fan_read_rpm(u8 offset, unsigned int *rpm)
+{
+	u8 hi, lo, hi2;
+	int retries = 3;
+
+	if (fan_rpm_unlatched) {
+		/* No latch: re-read until the MSB is stable */
+		do {
+			if (!acpi_ec_read(offset + 1, &hi) ||
+			    !acpi_ec_read(offset, &lo) ||
+			    !acpi_ec_read(offset + 1, &hi2))
+				return false;
+		} while (hi != hi2 && --retries);
+
+		if (hi != hi2)
+			return false;
+	} else {
+		if (!acpi_ec_read(offset, &lo) || !acpi_ec_read(offset + 1, &hi))
+			return false;
+	}
+
+	*rpm = (hi << 8) | lo;
+	return true;
+}
+
 static int fan_get_speed(unsigned int *speed)
 {
-	u8 hi, lo;
+	unsigned int rpm;
+	u8 lo;
 
 	switch (fan_status_access_mode) {
 	case TPACPI_FAN_RD_TPEC:
 		/* all except 570, 600e/x, 770e, 770x */
 		if (unlikely(!fan_select_fan1()))
 			return -EIO;
-		if (unlikely(!acpi_ec_read(fan_rpm_offset, &lo) ||
-			     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
+
+		if (unlikely(!fan_read_rpm(fan_rpm_offset, &rpm)))
 			return -EIO;
 
 		if (likely(speed)) {
-			*speed = (hi << 8) | lo;
+			*speed = rpm;
 			if (fan_speed_in_tpr && *speed != 0)
 				*speed = FAN_CLOCK_TPM / *speed;
 		}
@@ -8238,7 +8275,8 @@ static int fan_get_speed(unsigned int *speed)
 
 static int fan2_get_speed(unsigned int *speed)
 {
-	u8 hi, lo, status;
+	unsigned int rpm;
+	u8 lo, status;
 	bool rc;
 
 	switch (fan_status_access_mode) {
@@ -8246,14 +8284,16 @@ static int fan2_get_speed(unsigned int *speed)
 		/* all except 570, 600e/x, 770e, 770x */
 		if (unlikely(!fan_select_fan2()))
 			return -EIO;
-		rc = !acpi_ec_read(fan_rpm_offset, &lo) ||
-			     !acpi_ec_read(fan_rpm_offset + 1, &hi);
+
+		rc = !fan_read_rpm(fan2_with_own_rpm_reg ? fan2_rpm_offset : fan_rpm_offset,
+				   &rpm);
+
 		fan_select_fan1(); /* play it safe */
 		if (rc)
 			return -EIO;
 
 		if (likely(speed)) {
-			*speed = (hi << 8) | lo;
+			*speed = rpm;
 			if (fan_speed_in_tpr && *speed != 0)
 				*speed = FAN_CLOCK_TPM / *speed;
 		}
@@ -8873,6 +8913,8 @@ static const struct attribute_group fan_driver_attr_group = {
 #define TPACPI_FAN_DECRPM	0x0020		/* For ECFW's with RPM in register as decimal */
 #define TPACPI_FAN_TPR		0x0040		/* Fan speed is in Ticks Per Revolution */
 #define TPACPI_FAN_NOACPI	0x0080		/* Don't use ACPI methods even if detected */
+#define TPACPI_FAN_2REG		0x0100		/* Fan2 RPM in EC regs 0x82/0x83, no fan select */
+#define TPACPI_FAN_UNLATCH	0x0200		/* RPM registers are not latched */
 
 static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
@@ -8908,6 +8950,8 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', '0', TPACPI_FAN_NOACPI),/* E560 */
 	TPACPI_Q_LNV3('R', '1', '2', TPACPI_FAN_NOACPI),/* T495 */
 	TPACPI_Q_LNV3('R', '1', '3', TPACPI_FAN_NOACPI),/* T495s */
+	TPACPI_Q_LNV3('N', '4', 'D', TPACPI_FAN_2REG | TPACPI_FAN_UNLATCH),	/* X9-14 Gen 1 */
+	TPACPI_Q_LNV3('N', '4', 'C', TPACPI_FAN_2REG | TPACPI_FAN_UNLATCH),	/* X9-15 Gen 1 */
 };
 
 static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8959,6 +9003,12 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 		tp_features.fan_ctrl_status_undef = 1;
 	}
 
+	if (quirks & TPACPI_FAN_2REG)
+		fan2_with_own_rpm_reg = true;
+
+	if (quirks & TPACPI_FAN_UNLATCH)
+		fan_rpm_unlatched = true;
+
 	if (quirks & TPACPI_FAN_NOACPI) {
 		/* E560, T495, T495s */
 		pr_info("Ignoring buggy ACPI fan access method\n");
@@ -8993,9 +9043,16 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 			if (res >= 0 && speed != FAN_NOT_PRESENT) {
 				/* It responded - so let's assume it's there */
 				tp_features.second_fan = 1;
-				/* fan control not currently available for ns ECFW */
-				tp_features.second_fan_ctl = !fan_with_ns_addr;
-				pr_info("secondary fan control detected & enabled\n");
+				/*
+				 * fan control not currently available for ns ECFW,
+				 * and not needed with 2REG: one write drives both fans
+				 */
+				tp_features.second_fan_ctl = !fan_with_ns_addr &&
+							     !fan2_with_own_rpm_reg;
+				if (tp_features.second_fan_ctl)
+					pr_info("secondary fan control detected & enabled\n");
+				else
+					pr_info("secondary fan detected\n");
 			} else {
 				/* Fan not auto-detected */
 				tp_features.second_fan = 0;
-- 
2.53.0

