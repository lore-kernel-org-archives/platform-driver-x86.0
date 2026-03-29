Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116E283FE6
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774821275; cv=none; b=LicOwCcqNB1V4NDuUAkK9TdAdmckRQvBVTAqnz5O6sYXJjZOGb2j4hEc1nryhId/AH+W3cZgwdwIO3uWs70nAyDIWjPrYP75lx4otRannZnkz7EYMzOFA9gBfpxiuFamwQMgc4Csu6UFm0+9t/ZiN8bKvKerG4/ia5ZX8FbQhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774821275; c=relaxed/simple;
	bh=Q7OOz7G+QI2N9kxZMzplrZr6kuKEThul6KOM4AXFcbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Re9LWF57gPhZwi8XdMU+PFGltxcfyZdnmHWAOHfgiflsUF1FoFNLJc+e8NSki2sHRZDqeA7D8o/A21lN6+8nug44UOXQSSlV0qpwVwlvq92wxo5oULHCiZYXtuX4uecVx4jz7X2hjUXw7fZUj942O48kmlVETrA+KMKEgqyzeSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4IYgaX6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4IYgaX6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66bd4f7b2d3so461876a12.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 14:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774821272; x=1775426072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyW/dvSpEhY4MFB2MGA20+Wcd3zM3mvlUaUfNZFWbYw=;
        b=S4IYgaX6AoMA0uXL39nK021BbkpFScMULqp6pOVcLfFz1bvROZynqcjKv8Cz0QmTbj
         MwCj6IVWhySS1bGhAD3rF1Cz57vlIhTZIjcER5zhWoH0yqA5Fhw6QYi2txAa8+8cOSH7
         IF69v29WJHYrSH4W5rffh2AeiTN0MrCtEvGFhcpHNBk3UnwmOV/9DvsBHdv/aJLjlaTV
         cZXFlrCeEmKHFH9N+CNuCx4vN1I1qH2q5hxZHT5iw/C2m5GkhHOxI2UftkJEZjyYK1Hd
         koDiuakJQk1AF5J6EmngNpTsPsMqw3mEKV0nG2XHAWVUqBuTKlMNzZ3bYJVAXgxtipQm
         Z41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774821272; x=1775426072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyW/dvSpEhY4MFB2MGA20+Wcd3zM3mvlUaUfNZFWbYw=;
        b=hsftshecwr9KWeE09u7xDgn8nNTrMad1kh1JieItFJLilTAUgdorCn7+2nUCJlVgW+
         6vxIwnvCC1HGzNqhoLvdtksL+keF2Li+u9jOAM+BxHXt0AmzelEOaPhYrNJz0AsKqZos
         M6hG8rqrx+ORGeEoy+VzPn3e5uALD+Vx/3Bs7rUE10iSo1H/o9rcBQFsC4TjQURsb/LG
         lZ/iZP87cL7M8JVb7znPwPE9GeZYmvQy566KRgkrpG6zHSA1IygZFsSaxrzBzDvbWWfp
         pBK/22Lv9bOCDHjUFtfLUrV8u0ptUg9pASAtAFPxfBAEjGSVeBq94NIqFnCh7fmji3s+
         Z1Ow==
X-Gm-Message-State: AOJu0YwbO451QEltijFeXmdDlkShypGY7CnsYj3e5MSGhbqQYSuVjeWk
	aynSi2+G9fz70VdK60/DibXlVWB9IY3EVltKs09O/ym41/O2lF+HpsQ1
X-Gm-Gg: ATEYQzw/MR0LNhbY3fc3Fe6aX61jhdHzptugk/ia0Q19FAAPp+UOYZt0+Bmcn6sDaE0
	JU9ewOb2lxCALLCBN2lFkkUHGN3z7JgZvd31x8ja8RF/T00nhbuPuqr1iP52z5KlVNFRJE2hm92
	4ApQ74Ks/4HPzn31YtCBdm0j3v7CgYh3yaGWlXfBo8OA3q47twWpKojYyUPIsh6Wofug6N3b4eZ
	4LaY0jLKshAf41mobYQnPSPKiwD10RK+UDHikTj3skxYreWi18fBEMztnR9KQSdtDiLiZoLnrgT
	JUHTAXAxYfYVuiJi3cN7lfqGHjauhpUyM7HEtro9M2J/vbQjFSzowsWsXzoRf31lScQ7D1chm6I
	tyb6GbmIdyH2lsNOwa8uBcC0azqg/f8FOmP/tf4b4KqpmpgXibJhYxxxJ0JAGxBT//2SJVREgrn
	U2KRTu9GpzvU9bmw==
X-Received: by 2002:a17:907:3f1e:b0:b98:2b20:6680 with SMTP id a640c23a62f3a-b9b4fa247ddmr604558866b.0.1774821271668;
        Sun, 29 Mar 2026 14:54:31 -0700 (PDT)
Received: from fedora (yeal.ru. [94.103.95.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b2253d4sm204794366b.56.2026.03.29.14.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:54:31 -0700 (PDT)
From: Alexander Egorov <begeebe@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	ps1x <ps1x@users.noreply.github.com>
Subject: [PATCH] platform/x86: oxpec: add support for OneXPlayer Super X
Date: Mon, 30 Mar 2026 00:53:48 +0300
Message-ID: <20260329215348.56185-1-begeebe@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ps1x <ps1x@users.noreply.github.com>

OneXPlayer Super X identifies itself via DMI as:

  board vendor: ONE-NETBOOK
  board name:   ONEXPLAYER SUPER X
  product name: ONEXPLAYER SUPER X

Current mainline oxpec does not contain a matching DMI entry for this
system, so the in-tree driver is not auto-loaded.

On the tested Super X device, the working EC layout matches the
following handling:

- fan RPM is read from OXP_SENSOR_FAN_REG (0x76)
- pwm1_enable uses OXP_SENSOR_PWM_ENABLE_REG (0x4A)
- pwm1 uses OXP_SENSOR_PWM_REG (0x4B) with direct 0-255 writes
- turbo toggle uses OXP_TURBO_SWITCH_REG (0xF1)
- charge-limit / charge-behaviour uses the same battery extension path
  as the X1 family

Add a dedicated oxp_superx board id, a DMI match for OneXPlayer Super X,
and route the fan, PWM, turbo-toggle, and battery-extension paths
through the validated Super X handling.

Tested-on: OneXPlayer Super X
Signed-off-by: ps1x <ps1x@users.noreply.github.com>
---
 drivers/platform/x86/oxpec.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 6d4a53a2e..d366c398d 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -48,6 +48,7 @@ enum oxp_board {
 	oxp_mini_amd_a07,
 	oxp_mini_amd_pro,
 	oxp_x1,
+	oxp_superx,
 	oxp_g1_i,
 	oxp_g1_a,
 };
@@ -282,6 +283,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_x1,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER SUPER X"),
+		},
+		.driver_data = (void *)oxp_superx,
+	},
 	{},
 };
 
@@ -336,6 +344,7 @@ static umode_t tt_toggle_is_visible(struct kobject *kobj,
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_x1:
+	case oxp_superx:
 	case oxp_g1_i:
 	case oxp_g1_a:
 		return attr->mode;
@@ -366,6 +375,7 @@ static ssize_t tt_toggle_store(struct device *dev,
 	case aok_zoe_a1:
 	case oxp_fly:
 	case oxp_mini_amd_pro:
+	case oxp_superx:
 	case oxp_g1_a:
 		reg = OXP_TURBO_SWITCH_REG;
 		mask = OXP_TURBO_TAKE_VAL;
@@ -412,6 +422,7 @@ static ssize_t tt_toggle_show(struct device *dev,
 	case aok_zoe_a1:
 	case oxp_fly:
 	case oxp_mini_amd_pro:
+	case oxp_superx:
 	case oxp_g1_a:
 		reg = OXP_TURBO_SWITCH_REG;
 		mask = OXP_TURBO_TAKE_VAL;
@@ -507,6 +518,7 @@ static bool oxp_psy_ext_supported(void)
 {
 	switch (board) {
 	case oxp_x1:
+	case oxp_superx:
 	case oxp_g1_i:
 	case oxp_g1_a:
 	case oxp_fly:
@@ -640,6 +652,7 @@ static int oxp_pwm_enable(void)
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_x1:
+	case oxp_superx:
 	case oxp_g1_i:
 	case oxp_g1_a:
 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
@@ -660,6 +673,7 @@ static int oxp_pwm_disable(void)
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_x1:
+	case oxp_superx:
 	case oxp_g1_i:
 	case oxp_g1_a:
 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
@@ -717,6 +731,7 @@ static int oxp_pwm_fan_speed(long *val)
 	case oxp_mini_amd:
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
+	case oxp_superx:
 	case oxp_g1_a:
 		return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
 	default:
@@ -749,6 +764,7 @@ static int oxp_pwm_input_write(long val)
 	case aok_zoe_a1:
 	case oxp_fly:
 	case oxp_mini_amd_pro:
+	case oxp_superx:
 	case oxp_g1_a:
 		return write_to_ec(OXP_SENSOR_PWM_REG, val);
 	default:
@@ -788,6 +804,7 @@ static int oxp_pwm_input_read(long *val)
 	case aok_zoe_a1:
 	case oxp_fly:
 	case oxp_mini_amd_pro:
+	case oxp_superx:
 	case oxp_g1_a:
 	default:
 		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
-- 
2.53.0

