Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC6224AEF
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771136025; cv=none; b=qbqaU9JK7HomScSDYna6ZGFceG/YwfTDt97JuEFeWu+FuYJdl65Y3YtwLnEN7BhYzBpiJVmpgykuYYqi4PnwoDKcSG19l55E9f5+rpkg3fmwqsGuSqcQ+A3Bt+NQosAMUuRpn7NowfC/bCLOWwWcrO7UHe0Ux9fQ9JYhFwkvyt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771136025; c=relaxed/simple;
	bh=7TzMQusOog6JF0pcK98i5bR2p+94x7VAFTBLsStvemY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8GkYKSsX+tPdA7hoxZxM68njsH6L6vq0WR70G4oXyBiUpCbinWHc58QnYy2UvoV4SZ3HScGn5enp76aurUWuHi87vqcB6SK3P5SYtl3rTe+9zVw/50Rxpn7UYAYWYxIFmi4C7tcQFqPrtFSLLy9GDINoH2Z31cqt9PigSg30vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0uqnlAd; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0uqnlAd"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b785801c93so5897362eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 22:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771136024; x=1771740824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cip+4LCLlCAb7SLYCPAq2l9B4U2w4m4LbqREr4Rxhfw=;
        b=l0uqnlAdfYFM4x6DDRbtO9S5GA/Oq/wSaJMyNWOEXdoTABAuanMNgVLxt8KP/y91id
         5WoZYW3bwsI49S2IIs2lEPkfyzdkDQMhoq8NXAtuH+ZcGimIyKCGip+2Oc41HlIGmAQe
         ypeZEuTRFtkqQ8T3wmzMzrnbhrqUEGi1nmz1EhslRwobXdP1A551SgSab31PUoAmkcQA
         /1oSYdk34ffw3HV+1OrgDpGnosc/TxAHnvHbzYWenrhIbZ926qXcyKZg9Bh7QwTrpXcx
         jyUszDt8O6eTE+RR+3MMBNw2mYuZQw3okuv2tiT+M7xWcK6YoagU+tiKa2bvuBgBXGxF
         fYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771136024; x=1771740824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cip+4LCLlCAb7SLYCPAq2l9B4U2w4m4LbqREr4Rxhfw=;
        b=S1Q3PLgi0wOkJ2Umro0xYztOkwsiBwMIdD96j3ZX7cjFq7g4B5NWDHoTw4KIbeQWLb
         lzmYhslaqA7d6Hy7LzkmnFIH8CKpiBbzTLB1Qt6fGLSygZl6PdXFFjrtUKhcv+//k0Pe
         ieBbIOwjCjJkI210anUNGxMc89kXOk/eGHX7xy1VQ/VVq55f1Hl43b1PU5O/fh0eIlPz
         tnZt7ygtWn00qP1VHiG6U5gLiQAAzWGiKJMachQaZjJQB/JfmdlWXuPp4fGr76u0RThw
         FirJoWlYrsImN+6eA8VmjSBOIM8J7vu6gEFzqoXdK4icafwn/0rEI2m4jhEtAooa3MVN
         K/4w==
X-Forwarded-Encrypted: i=1; AJvYcCXi+6yPj4+lFBV5BAYxaLI3Irnk+JDe+ZiOIoL4noHVE8/a5Yj4W67RIU2P82g0GIF5irddtt7yJQoCnrOcJhRNxst+@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfbAWpWVd5RmZuWAvIN7FjQ3vivBVxwacT8mpgrTbjtOyGkPH
	Pd8BEcthwDvDtDZpvz4GPrbLTQ+ieepm3Va84i0SFBMR/1cqs24oz4+3L867Nw==
X-Gm-Gg: AZuq6aKE5iXjJH9IavELTLZ81qsE+dpHweotxph024TBTcnl/l+fh1uF2uzdE2P6A/3
	svUGODin1Miet1auWC+oMvqgIJylwXVasmIcZNqrgyyzw3LL9W4CjwFUZGUdp7dpqQmqCGcWXtv
	8B3SjS9pLqLrn64S9ChywqdILvqcnQskrb0jDrIdwJlfbHOip3vSSopbm6tFcKhqmDUhRrbXPAG
	dClkuhhxb6Nev7t9FaZjqU3SXf5xxr2vMgSVgtUN3bYpzX6sDBb1oyR2DMvKDQo/IkjsrrRDlxg
	v4sVk/mC0k0ySUj49eUMzJoG+1q3aftJqrGpSvCrNyhcqBPlC2KiJ5uvEBi5xVMjfSXmzFhz335
	FKsABG8Gkpnv5zH0WHg+N3h5Xm8NJSPO5WB7hvKWU//9Hf3qk47XiaVZKzGABS40lAJVFr3Negx
	3taIxmuFL5Gfuiap3LS9lkyfwxJThtRhkRfKgpyOTiVRfBMBSx2MeqvHVNluXFxgQY4z2zjm3VK
	Pg=
X-Received: by 2002:a05:7301:688c:b0:2ae:5d3b:e1ba with SMTP id 5a478bee46e88-2bac9795c65mr1765212eec.23.1771136023599;
        Sat, 14 Feb 2026 22:13:43 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm4759245eec.12.2026.02.14.22.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 22:13:43 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
Date: Sun, 15 Feb 2026 06:12:54 +0000
Message-ID: <20260215061339.2842486-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds LWMI_ATTR_ID macro. In the same vein as LWMI_ATTR_ID_FAN_RPM,
but as a generic, to de-duplicate attribute_id assignment biolerplate.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-capdata.h  |  6 ++++
 drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
 drivers/platform/x86/lenovo/wmi-other.c    | 36 ++++++----------------
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 8c1df3efcc553..27202e2dc8a59 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -17,6 +17,12 @@
 #define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
 #define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
 
+#define LWMI_ATTR_ID(dev, feat, mode, type) \
+	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev) | \
+	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat) | \
+	 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) | \
+	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type))
+
 #define LWMI_DEVICE_ID_FAN	0x04
 
 struct component_match;
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h b/drivers/platform/x86/lenovo/wmi-gamezone.h
index 6b163a5eeb959..ddb919cf6c36d 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.h
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.h
@@ -10,6 +10,7 @@ enum gamezone_events_type {
 };
 
 enum thermal_mode {
+	LWMI_GZ_THERMAL_MODE_NONE =	   0x00,
 	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
 	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
 	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa2b0d..95886df39c8d2 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -71,10 +71,9 @@
 #define LWMI_FAN_NR 4
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
 
-#define LWMI_ATTR_ID_FAN_RPM(x)						\
-	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
-	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
-	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
+#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
+	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
+		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
 #define LWMI_FAN_DIV 100
 
@@ -716,12 +715,8 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
 	u32 attribute_id;
 	int value, ret;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
-			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	attribute_id = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
 	if (ret)
@@ -776,7 +771,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	struct wmi_method_args_32 args;
 	struct capdata01 capdata;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	u32 value;
 	int ret;
 
@@ -787,13 +781,10 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				 mode, tunable_attr->type_id);
 
-	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
+	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
 		return ret;
 
@@ -804,7 +795,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = attribute_id;
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -838,7 +828,6 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	int retval;
 	int ret;
 
@@ -846,13 +835,8 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	if (ret)
 		return ret;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
-
-	args.arg0 = attribute_id;
+	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				 mode, tunable_attr->type_id);
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
 				    (unsigned char *)&args, sizeof(args),

base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
-- 
2.52.0

