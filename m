Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37F22A1D4
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 05:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774762861; cv=none; b=LKc2Gyxq4k+A9bH7Ya2oYblohhJZnZfR0XeOxSe24VvVzGflkxjBJardjR40vP5YcmWkdjFY4r24R0ZAY8lD5/FN61nHxgAVxMqvlH+LhpSxicKVT4T59ix6Egl+bHvgAqX+C5REAekIPmv4gPplv/vbKmLD8NJgTT5Tj+w/pKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774762861; c=relaxed/simple;
	bh=BvL+hh7LuybVdC+oj7udPBENItX/XuhF8JfxeCawA3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPD3h+0StP50cbHppOqaK0lMyh/RCbiehxrvRvuOu5IyClKiWgZFPmKMHk2U1bIST0SfuW+Ed7HRENzuOeGZbiyYjT7TXnHy5nO1sPKkr6Qu/mGtNGT1XpRuZLfGzs7JbWPvjP/At/xG6ud9sazH/zYHJUwmhVZkIjwSNdIwMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drQyMlzH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drQyMlzH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aaed195901so14530635ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 22:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774762860; x=1775367660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NV4grn9f33GFJLiairJhFpoxSc6Hz45zMLVdn62cgR0=;
        b=drQyMlzHbBpliHgfH1ZRwx+zIQ5bGQLJAnO076yE8XSJfVK97Ih7zYnO5KsXQ5x5ZC
         UG1sOnFN2PJN1rOtlx3hT05cSfWAX64CSXY8/o4hbXlI30RuZSFKmDHzBCjnZLUasOer
         wt6ki4s6VjFY81hkhfaYCKIgmB/JCv84XVr7AWZ+0ljGNqNcV6u1KB+4W1H6MiISvpJ0
         1NGjAEWYxj4M0esSQWrpjUgEJkxYJ0fNBIHNXkfcri+dyNIU0v6icShi3vklNiYdZPKt
         3EUN+A1tMeVtoY0sg1+yLTB6C8a4Z9cqYX/41ZQQAILO+Ab4GORWkTcXycTR2KgRxW7h
         Rmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774762860; x=1775367660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV4grn9f33GFJLiairJhFpoxSc6Hz45zMLVdn62cgR0=;
        b=PIHA4c+YFEqtqpmndhNED7BEM1URGum88IaMFY8Nlip5tPkof9dPY8oLuFepQQVWOy
         uP6et4+qkufMuh8bDuMCT3GNB+bk8MX9D/JXqsUCIyMIqpjUTAWAuoZN29VkjRtARuqR
         7fqgfucjHOgBVYSDn8yXy7Bv8iWQPzKS1AuNex7M4twyE7UPZHrAsZRO7fnWHRCv5jd9
         kh6iLan9VKToid2Rqr4RCiWzsyxwVlfPXV9pY8oajvG0i2llViFFWsVvIY+B87Z5GEts
         ylQ/j0n2JeZgD8Wvl2qmaIM9kH0ftQ8uXB9+xLaov/zZlLkbu6xDnz92R9fbtsdL16wt
         gknw==
X-Gm-Message-State: AOJu0YzjdCn/naZlJrRFwK/UeHQaSdVow/8TZdpZZ24bd114pVvTX3MR
	X6khS/UhIxy+1iOz34WpI0XzVPK79l2IMa6C3MYyGqBvjRtQs+Lz4gQrwyOFepBLqak=
X-Gm-Gg: ATEYQzxMyJrFAkMVG+0YdlvP+MNbyVuiBfpNXlJZqN6mnjA288HdLxOmqH1ESGiPFuU
	5XNJFUgAW6PsrvwqzI4kuL9gJBE5+76utBVYEkVYNuqNZwYeo6qgGqiOUJlK6+vf/2p3J5dT93a
	NAOp4Mgk10pFOQUMcCCTamoR0On2EQ6MXNrF5uqQmyzHeNt+8XfVwXLs5SWXVZcEnYlPT8L4nxW
	8OszWj283T4LxSztcOcmWC+g5yiD3azdEbUIghFUt6B/HcN0hsIXH/Hqs3t1kWsY43Zx8LRvr7n
	y0p+ncxMx2ZnipSZBH+P0blJAEDZiJErymdikKSGgKxlz7mZEVyHtbs6NwdZo5v8nJ1zCFIhxeB
	Z5O9RWcDolyq+Tob42dmuuSiBEaBvecNx5Fn1x9JwHUMRnrwfk1vsoIOL8YSpy3eeUTOft0fEQM
	P+q88GUfKRJY9632bJQpbQnHHU4F/DuFN1b3pMm6jmbtgDYJjiFnGTVjp3rKqcKVUs9G4sHx2T+
	4Rz5Wo5XiKYhrFIjTs=
X-Received: by 2002:a17:902:ef48:b0:2b2:46b1:182d with SMTP id d9443c01a7336-2b246b12415mr35551225ad.8.1774762859679;
        Sat, 28 Mar 2026 22:40:59 -0700 (PDT)
Received: from cachyos-x8664.iitd.ac.in ([2001:df4:e000:3fd2:59eb:b75c:7ede:19e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242670302sm39144395ad.26.2026.03.28.22.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 22:40:59 -0700 (PDT)
From: Bani Brata <banibrata2007@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Bani Brata <banibrata2007@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Hide bogus fan RPM on HP ENVY x360 13-bd0xxx
Date: Sun, 29 Mar 2026 11:10:50 +0530
Message-ID: <20260329054052.32023-1-banibrata2007@gmail.com>
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
