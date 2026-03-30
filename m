Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283EF3B9DAF
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865489; cv=none; b=u6XAnNdUM6c1mZAmhGK6ryJ08lsF70lwbMwEMUF4S9PipQDnHj++Lv+gjkJnCT2NiXWGfSlGnuEYJjMNtuJXfea3tAP9eiZMWX+pdO79kCtt+TnDPB7/2yK1FGYYWyZMIky9YalDKEA5qB6eWtpL1vKhdX6t9cSBzKVyWUn/P/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865489; c=relaxed/simple;
	bh=0Xe0rBXcFfHdl6/3l5WF510TuDJaGOONjfflxZLF7XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLVqrtpHaaVDl7R4Wf6mCa0Mpp0SYSUu6dBAMn88yve/NHNHskRyigqU4raxjcklnWgiVwY1DmmJ7dy4Y9aBcn6OAZ3o+2piwiLQtl++j4/vvCxS4II6m2L/01DYs0hAyAAwOC8xTfm97RXiDUQLP+JGrVBwQra/2vk9z44SHeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOiHXzd3; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOiHXzd3"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso4123542e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 03:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865486; x=1775470286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSVbx7lTlqjORcHtij6NZvwGESGWPSTHoUWd31qp7uQ=;
        b=UOiHXzd3pB20ywYv39BopOSuIVqH+UUR6mqBb6MpMqRNbKFebQtuOBhLvjoRFmX3MP
         +KdV9+Dw2F5AJh736sjbqxWHViwQpDG5oNaTERs7+KVK64fdFY68ZUqtJK5TpnRztNCU
         GG7sYOkO5/MXi9hOAHOlSVZoTkjCwbAW51A+FsYLXeOrfYAoM+pBkXSdqn6wjeacXBsm
         5f1fwZv3BwR63jrRh9NKEJQteVc4x60+t4YQuxt05eSp7Q2026FkkZcMNFmoPGa5urfu
         ykqeQKHhuvSM8rNewcJ1iJjZcikz94NClPcLbvNn0GQc7kEQ1z4WmfSZomXQ6JH+64eT
         3LPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865486; x=1775470286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSVbx7lTlqjORcHtij6NZvwGESGWPSTHoUWd31qp7uQ=;
        b=jJt9mtpHyCue31tt7HIVwGyYYf6mp08cpl1EuX1kGQcQXsd59tGEdDZf5U02UATRxU
         ueAWSB6xK+vEf9nVOv8UZ2vRA9NMdIoLG7j+vegJjgm2lMIxJgVBlMr+v30Q0jcchG/j
         Gyzj6kVFKmCzcKa0Rwgod8zaDaCpgfTlTtq2qHK9c2mVRaVzY88TWm3PX9tdMUfLvXj2
         neA47VNOKdhJ7aFlmgfqMROmfRvSYC47vpheQg1yHak7+VkpBScmxz2dd6WITQmy4Npb
         D4U3H4i35gZ4bYRUxaBhDMc37MoqWVmAUaiGEydNhlTsgenm+w0qeBAcBLU6fpSL4T5I
         xpWw==
X-Gm-Message-State: AOJu0YzGAZHOgvepb5EbKCslkg8B9Xo9rNtOOyy5/l3aR7vtl29dcRPr
	WaqNRUSVNHvGQv2kk0nhqpiCc0i1TyLjq5zt2Fs1N8SvFwyLxdpwdGtCyltN5JFU2b9vdQ==
X-Gm-Gg: ATEYQzwvr1OePyqRISwU+GfyDBgsIqg7PW1zX4VLii2OdNFwxB9ykQuIEIXkHFKBt9O
	lxcisVOrMQGvMUBYPLEQmeG8Af9Z3FZl6QNYFAHAtQX+mMGqgIjzvq52/KBN5PpSCZbu2tmEQ+P
	awJQCTbTRSD4goTJ+SO3d2ebVt3cijvzAkw1sI1TileqTbDgSqAMWno7st412g8p9kflKgLxPgy
	PQo0mmx+jJRJezIo6m9RyDMLjYZb/fkzEaRrVSPcnsdzcoSnLXISEPGe6e1JrnMfSdSTaUF/rtx
	6mz9yjYXeKJvS/UCzeuLUqS8dSuM5KAzyaRCooOyb/P16lMBTv6FTavi2XrUaOTwl9ruU83P78C
	85Sm4n8sL5eORFU6KKeRsMNv2YD5YCpg52xHOVwb/dLNwuAJ04AgiLqnbe9isz+ixE61JlpRVFq
	T90IzejXZc4JQJag==
X-Received: by 2002:a05:6512:39ce:b0:5a1:3dec:6d2e with SMTP id 2adb3069b0e04-5a2ab7fbb06mr3513805e87.16.1774865485991;
        Mon, 30 Mar 2026 03:11:25 -0700 (PDT)
Received: from fedora (yeal.ru. [94.103.95.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f41f4sm1536245e87.13.2026.03.30.03.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:11:25 -0700 (PDT)
From: Alexander Egorov <begeebe@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: oxpec: add support for OneXPlayer Super X
Date: Mon, 30 Mar 2026 13:10:28 +0300
Message-ID: <20260330101028.876277-1-begeebe@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329215348.56185-1-begeebe@gmail.com>
References: <20260329215348.56185-1-begeebe@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Alexander Egorov <begeebe@gmail.com>
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

