Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A31A9B46
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 05:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774761793; cv=none; b=JX4iPEu1/RmlTNAXV9OZCaj3Dv7N1w9QZAo090HIOhFqnCdyOjaabmFW6soxf0h5zXF0J9QFRrJPTXewaE4dIfrhXgW2KlqxZ2Nq6is9Zyb0IfMn5uXkjmVOfS9emQiaLMcvLTVuCeaUQFT1zgnIGb4SbbxAwusF5+gHRhI8eRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774761793; c=relaxed/simple;
	bh=BvL+hh7LuybVdC+oj7udPBENItX/XuhF8JfxeCawA3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKkDd3kG64Y/yJuDw+vkM9K6PqMWSX4DfmL3c+adRc7kRHTR9s0sLEjKUWTH9CW0+bqepzjHn7k0HvfQ/KuiaHT0w6TtAzGi7KFnSQgY8oMK5UAAFiczixkyDsDUX5PeSRTdZwfCypzTq9EyhlaxMjwcY9VKLRq8D8FEUfqGEtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8BBjdah; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8BBjdah"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b0603ee486so20899745ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 22:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774761791; x=1775366591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NV4grn9f33GFJLiairJhFpoxSc6Hz45zMLVdn62cgR0=;
        b=W8BBjdahrI6dFcO9YmFac2KlrNz+qr6cRQ5YjL6eWWlGJKKqgi4zsYKBdc5IgW3Lmk
         YP5P8VGlAVeUuj6SO+EZaGr1qDQMXHSZESBnRHThqAzvLDFF9up9EpvZyZxTmopX0QrL
         PHU6upootMJxVqY2301FN8zkpvczCrIWiojcWA88ufjxAlmd/vHaAK0xpqNi6ldJCChl
         AtVMi9LnNN+nm+xJppYXTu/vkyItbUF8GMjPrK78ECzn2MBmJoAVFpEUpyPuMAQnytNP
         HHc02KvEEwVEOrIFi+65YoMKomuWgu62BVNTUrdwS77Y4nwXeaGeLqV5oGV8VXpRggOC
         69/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774761791; x=1775366591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV4grn9f33GFJLiairJhFpoxSc6Hz45zMLVdn62cgR0=;
        b=UAozFUiw8YCbrASk42+jbOEb+XOaEhbb/B3DcNkTywW+P4qECgrvCKcTWWDcjPS7eb
         ef4beDsKF3w16ePyXIFWr/9otseC3kYCJxUer0Gxi/bYy+P7xTs4d/HRSfesLdPH5ICB
         +M532MJab7ZyaDcxyN3kbfQ5E1sRQ0u5joL3zPs7NgPL76tMINO1yQkfZ/Aid7Pz0Yj5
         qSsa7QT97fPmF6fkhF8itNwXtas3Im4VyizyM59XcBgD3C4hIbAcFHadmCjlClX8QiWK
         8dqGC5eECaUzt6QD6sZxn2g0UJptz0mJv10GGBJgJyBaxUqTheCF9VPIbE3rwImNg7j9
         MRjA==
X-Gm-Message-State: AOJu0YwZutfRh8kYx507SWu+1pOD5fBGU7hShS112725u/KHe3CJBF/9
	vrrMo575T6cO8Guix3QjttuuGck8eQBOWQFwfQ9vWosVSqWJObqPwvhSdoIIwKVCBcs=
X-Gm-Gg: ATEYQzxgCRRWg/D8b4fnzbQg3kLtNu8C0qFIJO7UHYFklKQyvbJzPDIgJRYUfGpyziv
	nto1BqcC0fr1WxniUveVfRyu4gCqW1xjAeJNV+9jJ1niC1QYw6UGGIKQgkOfsU4iFIcDTvv/sBL
	Yzxuws6EoTqgecpXr+IkuI1EitJBEqLWmxnAav3WV0J4FzY4D134oT7m9AkptvvqODIfX5igOKt
	Ooo4DpKpNhCc5zasD/iAcMnnpEBfjrYxooHLbEDTXJ4K6bSbqLtEbr4r66hfbzLWMPdJ4py48tW
	7tkLRwAkp168tWNkvwMuNFRBsTIHEQkF4RQEXLRlFM4mWeFGkvigFSFZpz8WzaStFNOGdzm7PkV
	BWyX641knBqys7IMHLHzRZIZ9lVesMzRKiULUPiemZ2+T0cL6daqJ+R9BRMfhtVMpOIVyLxvKBT
	G19hhwwrAxa2svVFryxf2HvzjkK7x9QSZLhV31vHeFKm0N5asnTfK1dLdtaqDzUHWlZ7Cu9r4R8
	MFr+bk0KYfkJc6R/dw=
X-Received: by 2002:a17:903:986:b0:2b2:49a7:a5ca with SMTP id d9443c01a7336-2b249a7a9c2mr20888465ad.5.1774761790868;
        Sat, 28 Mar 2026 22:23:10 -0700 (PDT)
Received: from cachyos-x8664.iitd.ac.in ([2001:df4:e000:3fd2:59eb:b75c:7ede:19e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427acdb9sm40743195ad.68.2026.03.28.22.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 22:23:10 -0700 (PDT)
From: Bani Brata <banibrata2007@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Bani Brata <banibrata2007@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Hide bogus fan RPM on HP ENVY x360 13-bd0xxx
Date: Sun, 29 Mar 2026 10:50:17 +0530
Message-ID: <20260329052049.22888-1-banibrata2007@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP ENVY x360 Convertible 13-bd0xxx (board 8824), the WMI
interfaces for reading fan speed (HPWMI_FAN_SPEED_GET_QUERY) return
zero-filled buffers regardless of the actual fan speed.

This results in the hp_wmi driver exposing `fan1_input` and `fan2_input`
nodes through hwmon that permanently report "0 RPM", which is misleading
and interferes with userspace sensor monitoring tools.

Add a DMI quirk to disable exposing the hwmon fan nodes on this specific
board.

Signed-off-by: Bani Brata <banibrata2007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -192,6 +192,18 @@ static const struct dmi_system_id hp_wmi_rfkill_dmi_table[] __initconst = {
 };
 
 static bool is_victus_s_board;
+static bool is_envy_x360_8824_board;
+
+static const struct dmi_system_id hp_envy_x360_8824_boards[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-bd0xxx"),
+			DMI_MATCH(DMI_BOARD_NAME, "8824"),
+		},
+	},
+	{},
+};
 
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
@@ -2166,6 +2178,8 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 	case hwmon_pwm:
 		return 0644;
 	case hwmon_fan:
+		if (is_envy_x360_8824_board)
+			return 0;
 		if (is_victus_s_thermal_profile()) {
 			if (hp_wmi_get_fan_speed_victus_s(channel) >= 0)
 				return 0444;
@@ -2188,6 +2202,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 
 	switch (type) {
 	case hwmon_fan:
+		if (is_envy_x360_8824_board)
+			return -EOPNOTSUPP;
 		if (is_victus_s_thermal_profile())
 			ret = hp_wmi_get_fan_speed_victus_s(channel);
 		else
@@ -2281,6 +2297,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 {
 	const struct dmi_system_id *id;
 
+	is_envy_x360_8824_board = dmi_first_match(hp_envy_x360_8824_boards);
+
 	/*
 	 * Currently only victus_s devices use the
 	 * active_thermal_profile_params
-- 
2.48.1
