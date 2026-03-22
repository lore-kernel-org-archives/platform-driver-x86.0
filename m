Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684D036B047
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 19:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206435; cv=none; b=YRM60Ea7NIUZ4TB9CTq/NJ8S3TtczC6xM3S+iwW1yZE2V5g1Z7DxhRLz8Y7RkGidqUVjzwxp8obqwRPwC+S/zREVpPsxeVB71AMWxV0yYIEql2wO+o7pSr2mGFVEsrqpelpmrmTQ5s0xEzOkmHMXI/YjkHzdOl3/xpkjwqfn9u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206435; c=relaxed/simple;
	bh=a65n9qrxIlLmhNIbEN4ovVg4f46IUX7I1DiASQ8NWOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRopxKapWcU3CkAujcB6W5dXKRxOQP+JGT/Y9rkApXrj5qrLzoXd7zrYTpcAWiMwSFvvL4C2tehl/WSkNoEot8p9CqqDrIuqiPQ0fuRk1nxfUVMywnLccyd5gOn4/Ui/z8B32iGdgMmAMPlGP/fPj5x6gUnSTIKzhKUQwKJPWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHp2OwzD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHp2OwzD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fca3245cso4969595e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774206432; x=1774811232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9+vTI8xL38TJIAAcKMuD2MJ4WOoS3U7UcRhiuvjKaM=;
        b=OHp2OwzDMfAclDebwDoDFfA4rqpAfQ7RXKgicMsgynOCZE2n+RTbvvi6h6FbHLWREk
         RsA1wb55af78KPnyBN9NTpimfKRVFMyYiZbkG3SdBLXwZYatFL4FpiJQ0VBSJwyCfi8W
         ha+F+rZnn/KZ3Tvb/UUe576Kki0nAAL6Yv34oOgnZegR4P6nf4cPPGQKcUwXMg+qc/Hv
         RfglimAQwv3phPoFf66kX9ym/VpxJY7vkoWm0FxP2cROlqZOm5YIxBE2yL7pKOU+aGIK
         2OZzrrdomeVJ6ZLBdl2QoDxFUsNmzbGRLds5q1jSvuWXCau+jDWOlQfRN4Q+yGsAW/ZN
         xbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774206432; x=1774811232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9+vTI8xL38TJIAAcKMuD2MJ4WOoS3U7UcRhiuvjKaM=;
        b=IUcpSjAFxo210RSJ3dndC8+QEy3QkqQIJUpCxC+4b5eHH664UZilQmo8UEVBXVi2dn
         ovvNgia2X6yuZsLWy43j7eJmKHSiQ46VccJxBWl4VPBqtXt5K0ojr67dtVQb+xMA5g57
         KCF/4eQYjras8YFXQ0gkvU0YoIHBN2UmV6AJjvjSKR6du4lanM2BN5ddJcxBBuRNheCS
         8gWVxmh7ai/nGrYl4Nfd8acgqfqkbFnbciSUFvJB3a0OCnifhyjVKf33xP7B9B0cd+S+
         C9EfjGqeLD2tZ38L59mXMiqA/TDZes51qS9GjsPB3QvOlrR7yr2Bcnjz9j5Bhk7icJzS
         pjCQ==
X-Gm-Message-State: AOJu0Yz73IhnW1u5Phhn8gQXhRRcCmXzIdBIJYRROsRzyLEhY+0i8qPo
	+gA8FDUc+OfK/bBZbRwvu3HK00JjWYpiV4XxOjQU5pBOytBW6ZECXR6ZWk8b/STUkwChhQ==
X-Gm-Gg: ATEYQzwlmr8YzY/uE3d7urOWwEa+Im4t9FjrFR802OrgBI7EpAIRisDEm8efV82aQpR
	0sdhfjuiBdoElvM7zxn/OL4RD6btaKPPc8l0oc4k05zB9U9zR6sAIziP58Bt8SS8ecV1RrvOqnK
	CEBOfUoSWt1MZHSfJLgAFn5Njj5uHaMsWVooVkwO0m6em4sBzB7HgIjrNIisNO6FLc1fwT7TCwR
	DAQ6D6PXaNJd8IhK/xbcjcCDOjyJn/JRCDPWrRgJ5tQzWIcgzy+KySq1p7yMb/xTJaO7KIW4HEB
	6+yz4QhC0HbHSnyQ2k36pHCHFtxB3GAxsN9EMy6xH02rZbaL9uW0j7xqs8vu9OCre/4rS2Jah16
	FbTSo1IKIONWpZ7PR1LK/nLBrS8wyPyR3Mx9uRbhshs6DHmxedCRyw1B9CPIQinr0IxKPEuOx19
	Xh2PYbyqHXkYhHBQYcowPxPQDQ019RGAYrghIrRorUAKhCjZkjIphmJTnCGUtYu3hIPo71RJI=
X-Received: by 2002:a05:600c:3ba6:b0:47d:6f12:de57 with SMTP id 5b1f17b1804b1-486fee11756mr83906405e9.4.1774206431316;
        Sun, 22 Mar 2026 12:07:11 -0700 (PDT)
Received: from localhost.localdomain ([46.155.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe868cb1sm63340595e9.5.2026.03.22.12.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 12:07:10 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH v2 1/5] platform/x86: hp-wmi: fix ignored return values in fan settings
Date: Sun, 22 Mar 2026 22:06:20 +0300
Message-ID: <20260322190624.35162-2-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322190624.35162-1-emreleno@gmail.com>
References: <20260322190624.35162-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_get_fan_count_userdefine_trigger() can fail, but its return
value was silently discarded in the PWM_MODE_MAX and PWM_MODE_AUTO
cases of hp_wmi_apply_fan_settings(). The same function's return value
is already checked in hp_wmi_fan_speed_set(). Propagate errors
consistently.

hp_wmi_apply_fan_settings() itself returned an error code in all
paths, but its callers hp_wmi_hwmon_keep_alive_handler() and
hp_wmi_hwmon_init() both discarded the return value. Log failures via
pr_warn_ratelimited() in the keep-alive handler (rate-limited because
it fires every 90 seconds) and dev_warn() in init (non-fatal: the
hwmon device is already registered).

Also remove the unreachable "return 0" after the switch statement in
hp_wmi_apply_fan_settings(): every case branch already returns
explicitly.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 68ede7e5757a..0cb2a2b31998 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2334,8 +2334,11 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile())
-			hp_wmi_get_fan_count_userdefine_trigger();
+		if (is_victus_s_thermal_profile()) {
+			ret = hp_wmi_get_fan_count_userdefine_trigger();
+			if (ret < 0)
+				return ret;
+		}
 		ret = hp_wmi_fan_speed_max_set(1);
 		if (ret < 0)
 			return ret;
@@ -2353,7 +2356,9 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		return 0;
 	case PWM_MODE_AUTO:
 		if (is_victus_s_thermal_profile()) {
-			hp_wmi_get_fan_count_userdefine_trigger();
+			ret = hp_wmi_get_fan_count_userdefine_trigger();
+			if (ret < 0)
+				return ret;
 			ret = hp_wmi_fan_speed_max_reset(priv);
 		} else {
 			ret = hp_wmi_fan_speed_max_set(0);
@@ -2366,8 +2371,6 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		/* shouldn't happen */
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static umode_t hp_wmi_hwmon_is_visible(const void *data,
@@ -2509,6 +2512,7 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
 {
 	struct delayed_work *dwork;
 	struct hp_wmi_hwmon_priv *priv;
+	int ret;
 
 	dwork = to_delayed_work(work);
 	priv = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
@@ -2516,7 +2520,10 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
 	 * Re-apply the current hwmon context settings.
 	 * NOTE: hp_wmi_apply_fan_settings will handle the re-scheduling.
 	 */
-	hp_wmi_apply_fan_settings(priv);
+	ret = hp_wmi_apply_fan_settings(priv);
+	if (ret)
+		pr_warn_ratelimited("keep-alive failed to refresh fan settings: %d\n",
+				    ret);
 }
 
 static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
@@ -2578,7 +2585,9 @@ static int hp_wmi_hwmon_init(void)
 
 	INIT_DELAYED_WORK(&priv->keep_alive_dwork, hp_wmi_hwmon_keep_alive_handler);
 	platform_set_drvdata(hp_wmi_platform_dev, priv);
-	hp_wmi_apply_fan_settings(priv);
+	ret = hp_wmi_apply_fan_settings(priv);
+	if (ret)
+		dev_warn(dev, "Failed to apply initial fan settings: %d\n", ret);
 
 	return 0;
 }
-- 
2.53.0

