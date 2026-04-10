Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CF33B945
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 19:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848267; cv=none; b=InC2GlUhUXmh68KRAIdt0RI1OyzsS81nTafX/TZNm6hdiVYHPI37bbNNCkymOUdp0qRE470qxOq32YTWPfnFXULBJ6TZWGcn0x4JLBhLBtKJ4N2lvZv8LjR7Omi/gfgV4LYixVwWviUIOfqgjw/XAHEhK2tKNWbkMLRgrbZRfeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848267; c=relaxed/simple;
	bh=Dd2I7UQEWVDdTSc6Hsc2SxBhhCkakBGlg/oiGXpuX4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiN1WnUEXrZyWQBW7xkNduAlxTKGYQsovMThRaJ9RjwWMPfN7dZP19OHQC0raLaLFD4hm1kr9kJSM/ThhTEvbxL9QczwKi6v3+1yPRYU/kJHnpIs5Vfe9G+ci7ew6ETGuhegmVCPs1YGLcwedSs5lseWLdZddpNV7nfR5CyL/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbakBGB4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbakBGB4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8296d553142so1389172b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 12:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775848265; x=1776453065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=892k3r+ahu1GR6PfhbRo+d7EPo7UKSdLe2VfSPfGmLY=;
        b=TbakBGB4ZCGPK6uJ41xtDD7lpKnJyE3/Zt2qQLjkDU3O2eitqnw7CbsZ3CPvdVuCb/
         LwTYwfklAHNEyEcxPzJPaXIerWis6Q3ee0u8oOF7mfdlFUSidPXgNM3dYbkZmb9Tf2DR
         sVl0VoUdx+I3tcxhoWAhHvIz4Wj/H/r+iXVQTXod9z9j9DX0K3U7fBRu7wwPAtFmdLly
         i4XC1NeX89kP7vHrmZL2yuyPOfRn1k/Qo+W/DRr5Ug8IOwLDPhEjt5J2H/QGHWoTV8Hd
         IvPyPEjEcK+zM7B7RIhxaVBJopLMukrYAGRyySpBgoYGWf45yx65G9NuI8iqlhibb+w5
         SV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848265; x=1776453065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=892k3r+ahu1GR6PfhbRo+d7EPo7UKSdLe2VfSPfGmLY=;
        b=nTdfSxIkdE3qJFLD2PeuYY2uSXgh4za071TDqOlZam5+YkahsVJ+MQlLJE1VR6o5t1
         tQb9/AiJxBr5MsI2vaodIIdhsD8uLmxZ+0+dTe4A2HsPsfyRMANMiFdH50MiKW5UmjS9
         Jk10UPeBZblBk5aFcvnzaFNiEw+sisyobykty18/7BNoHcjo+LkStFH7qfRp9sQajxPE
         nVrHiFIHgjnFOp2+spgfQgB5ZLdxcpQtwVvqcYGkj4ENwPDeFlJq0Vb0C9MmAEbKgBz3
         diGY63n012LwpHuvQfbq+zTt8iSy/o0HSenmBSnXrKxymdCQ9jQzR8sklpDE4KqYD2bB
         xrRw==
X-Gm-Message-State: AOJu0Yx3ea5vOr8Rn04TRW97nRaR8PejTixnZR57eagWll2HWewRzptN
	IhYxtNlKyqJfKVkJOIhODpCBp4Lpp5kLOy/fAL0YIz4aYcPKvq+8u22m
X-Gm-Gg: AeBDieuXhyLgOl+7LvxtGZUNtn5OaqHPfGLMd4vqRgrxQcrnw/PZZGSj1HI472bDEIy
	AF/ySDN7f14lYmILN7TxbW7Ul7YnTQO6IhqHQi2ETSsH8vV7RrR4tuV94SXkvnTNdsRKBdioB5w
	UUT5StPwLoocrnjCR/FKu6s6tb/Iu7RvhkkVE9xvGgEtBmJ0/ysY1tm0I6VI2FKjE+e7LJNHjol
	bO1ycHxHnQlELBo4udMxeqXhYISOnOt/RBJ+OV/9QJqFZ6eMAkE589eSpjgOkI0uu1Tz9D7ilUo
	QZMiMBEMEpfgvotcloqtir5Zi2G5rwNEGQms0LthgKzqv51EHjU+jxH38M3sFe49NBcxkW6bQyR
	DYuGb8QJDb5crRXG9Q4bHOXZkO/FEIBi0W2NM39MkM/AbKLqBVjvZ1p8blIujhdnZONPppJsm7Y
	t2wYt3nMFjoUTWi798IZRKRmgM8hS3Y3FxvdzGarQVWsCPDYP7jV6L0LWNyqhfErgxK3UT4Mc4S
	ACUmA5rDR6cQSRbjMUvr1SCHxFhbdY=
X-Received: by 2002:a05:6a20:9155:b0:398:79a8:a303 with SMTP id adf61e73a8af0-39fe3c1a654mr5035204637.2.1775848265537;
        Fri, 10 Apr 2026 12:11:05 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a70csm3400739b3a.55.2026.04.10.12.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 12:11:05 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Jinyang Zhu <Jakie101@proton.me>
Subject: [PATCH v2 2/4] platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
Date: Sat, 11 Apr 2026 00:40:37 +0530
Message-ID: <20260410191039.125659-3-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410191039.125659-1-krishna.chomal108@gmail.com>
References: <20260410191039.125659-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN MAX 16-ak0xxx (8D87) requires the same WMI queries as other
Victus S devices, hence it has been added to the corresponding list.

For this reason, platform_profile_victus_s_get_ec() will be called
during thermal_profile_setup() and victus_s_powersource_event() to
obtain hardware state (platform profile) by reading from the Embedded
Controller, however, this particular board's EC does not seem to expose
the platform profile value, unlike other boards. Hence EC readback is
disabled.

Testing on board 8D87 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Jinyang Zhu <Jakie101@proton.me>
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 205a7bf4cbf7..9460e07202bd 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -48,6 +48,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 
 enum hp_ec_offsets {
 	HP_EC_OFFSET_UNKNOWN				= 0x00,
+	HP_NO_THERMAL_PROFILE_OFFSET			= 0x01,
 	HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET		= 0x59,
 	HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET		= 0x62,
 	HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET		= 0x63,
@@ -127,6 +128,13 @@ static const struct thermal_profile_params omen_v1_legacy_thermal_params = {
 	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
 };
 
+static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
+	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
+};
+
 /*
  * A generic pointer for the currently-active board's thermal profile
  * parameters.
@@ -231,6 +239,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
+		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+	},
 	{},
 };
 
@@ -1837,7 +1849,8 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	const struct thermal_profile_params *params;
 
 	params = active_thermal_profile_params;
-	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
+	    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 		*profile = active_platform_profile;
 		return 0;
 	}
@@ -2192,7 +2205,8 @@ static int thermal_profile_setup(struct platform_device *device)
 		 * behaves like a wrapper around active_platform_profile, to avoid using
 		 * uninitialized data, we default to PLATFORM_PROFILE_BALANCED.
 		 */
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
+		    active_thermal_profile_params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 			active_platform_profile = PLATFORM_PROFILE_BALANCED;
 		} else {
 			err = platform_profile_victus_s_get_ec(&active_platform_profile);
-- 
2.53.0

