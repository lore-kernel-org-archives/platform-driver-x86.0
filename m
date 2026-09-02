Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04F37FF4E
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371263; cv=none; b=PCcdhzHVqhMxbdQ+zn395CB6NnhpiGk8BvXOx3qIiI99aAcOb3f4hlk/YWtNNhf1SgYejdUHuAuk6B4NMu3Vv4QxAOYbULeo96boClDMJIhanaGXnZcrCrxCkj4b+pCt8iex1qPDFWs62m3/9bGwRBPAszH/dC0raF+iFtnDliE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371263; c=relaxed/simple;
	bh=Gnwo5g26ZdBjXhq4bVso0MSd0E7+9jZGiDZSY4ytsB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVh4WYoFHNBTQb1fElaMWWJWf0Ltm0g+oCuykmOiIxTwLWAI93RWBvMFZLpUmvsSHcUybe1jj3d3nlGU0fTQwpJo160TY7sPRvg+lqHqdTWa7ICnI4wPeTYgyrT4yUxZjkCc+Wvk+D+DvqqPKawPr/a4mmL80HunXsfFPt/QYK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2qnkU+k; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2qnkU+k"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so120762a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371261; x=1788976061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gK8IuesNoWdraXJ5wAwBcjG5iXv0jgZkzfqTlwxb+kU=;
        b=r2qnkU+kRTRP+5kIsVBJNtsa+8TkGLLVK1UarvQmJqRfq7PjGGkkNXnIBDNAr6BQ/8
         o2QzqZvhGTn3Rx46QTufnSVRljZzap1wKQ7evnTMqGVzZs08eN9ckLw68vSlQcpt6scy
         QuNmtiVwn9Uunxhq8lwuUqcqTZh4aVNNt4b2fN4t3ICwcsj/Y/mmFcDXw1UVJzbfx8Ft
         NiroxIhFiTwOMw5Z7vvJG+ZLBqzDmWMgcLivo4ss/b9aihQrsStOGL0YoC4QMW7iycg4
         kQFBXjAk1yVw9bwY7xWgoh6YzhXcKPj4oWCK7oO/s1+GOq20nAs5Zx6Fh+zzvD7saPgT
         lMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371261; x=1788976061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gK8IuesNoWdraXJ5wAwBcjG5iXv0jgZkzfqTlwxb+kU=;
        b=F9ctaWX2l6zTY8uU0oEXUdAprcTU5t8KQQtgmmA7FW+VfzUMbTncp9J9r9nveYDwgE
         j6bvE96gKw/dxvpECclBUJvDtyNrtLnKQPnFYLXZvBwnEMhFu2YN54+NzURGg1U6Yg6S
         gdvco3S6KpqJDKv52fN0mA/uQX+z/9KuMeJB0Jjq9uJMmbY3Q1q0QK54gTTr5UAQ4eQl
         +oB66uTbCJ6lVBYDIVIlhAPGUQd5Qm+i8rKrsTc5SwkU4kZJ5qHLs53DYAgI0c5OPViW
         /SkE+VwgRqSUoEX0CxajokaWSeT87nY2FFCOEE+4dKqkPSdZQcXs1W3gN5h0rJ69nF7B
         QFew==
X-Gm-Message-State: AFuF++nEbznb02XYirfUgr2dM0VslEReG0GZKOm3m3H3pNXJy8f2EEtI
	FYMBjy4IivebDSM3gtohf0Rf+arH63QpmAl0ktt117HifeGazh8WuSpzhcK/eg==
X-Gm-Gg: AYBFou2uurppEkEuCAV55FwanMJ6epV1jb7E7gd5zyhGjd0S+jhe/HYIQMBVhmJRcF5
	zzs7Q2SILaZjHbJpBaw/rlc8dYqRjdSBAATgT+uPZi394H++zY07gqJ10Quxx613cdFtvdcSHY+
	R7IR5urYXlylcarXp25I00l1OMm8DpTYIsb9F9FWqVatgFZa07nj5wuGlvi28Pa4cnIioFf2fwG
	stcYF2czOoE5O1NH62YJWEfRh/QaIgTvstBMWoXLQSYAhNGrMig9ZKp0LuogcWmelIkLzJKWOYE
	53L8nWfovGqNJ7OecK/UdtCOhZwgPOg94PAZ12zdCZBrSKUkHjPckRQkD4I8GHPuGzgbcVnz0TV
	ztzP1VJmUlibNe3lCCynQOOgHLvKRRxVTeNBQIzRiS2nS2+9mAWrdBJP3alUYeYbwoVbIAto0ox
	yWX4xegIjsZQN2jr6r0UaZRrEqJFCJcMfMvaI4Dqi7PT0TCeo56q13n6+IxkMkG43ctPy6e/HlB
	3POCck=
X-Received: by 2002:a17:90b:2b4c:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-39b0865335dmr746973a91.14.1788371260842;
        Wed, 02 Sep 2026 10:47:40 -0700 (PDT)
Received: from mizar.onca-liberty.ts.net ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm470584a91.8.2026.09.02.10.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:47:40 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>,
	"Luke D . Jones" <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	Idotoho Reimon Simanjuntak <idotohors@gmail.com>
Subject: [PATCH v3 2/3] platform/x86: asus-wmi: enable TUF RGB state for FA401 via DMI quirk
Date: Thu,  3 Sep 2026 00:47:17 +0700
Message-ID: <20260902174718.16228-3-idotohors@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902174718.16228-1-idotohors@gmail.com>
References: <20260902174718.16228-1-idotohors@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FA401 (TUF Gaming A14) series does not expose the TUF RGB state
WMI device (0x00100057) through the standard DSTS probe, yet the EC
does support the keyboard backlight power-state flags needed for sleep
strobe functionality.

Add a DMI-based quirk in asus-nb-wmi.c that matches on DMI_SYS_VENDOR
"ASUSTeK COMPUTER INC." and DMI_BOARD_NAME "FA401", setting
kbd_rgb_state_available = true in struct quirk_entry.

In asus_wmi_add(), change the kbd_rgb_state_available assignment to
also consider driver->quirks->kbd_rgb_state_available, so models with
this quirk get the RGB state sysfs attributes even when DSTS probing
fails.

No PM/sleep/backlight changes are included in this commit; those will
be addressed separately once the RGB state interface is available.

Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
 drivers/platform/x86/asus-wmi.c    |  4 +++-
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b16..47ceb6e46 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -155,6 +155,10 @@ static struct quirk_entry quirk_asus_z13 = {
 	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
 };
 
+static struct quirk_entry quirk_asus_fa401 = {
+	.kbd_rgb_state_available = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_z13,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. FA401",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "FA401"),
+		},
+		.driver_data = &quirk_asus_fa401,
+	},
 	{},
 };
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index efc730c2c..e7b2402c9 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5181,7 +5181,9 @@ static int asus_wmi_add(struct platform_device *pdev)
 
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
-	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
+	asus->kbd_rgb_state_available =
+		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE) ||
+		asus->driver->quirks->kbd_rgb_state_available;
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b9..9bc0b6145 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -52,6 +52,7 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	bool kbd_rgb_state_available;
 };
 
 struct asus_wmi_driver {
-- 
2.55.0

