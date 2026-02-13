Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D7B31A7F3
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970374; cv=none; b=saTGBnSe1ZjpyMbz2KAbaP24BFhuYYyG82fxfSiF8+byOEmPKB4HvDY2i9x1RnChBF/gWnCyWoDGm96HTF+lANFnEd5S7NKsbeM/nmplZisV+Eb0Tj+ChFzwpB84g/5qghUjlBjftP6Vy4UPRthUGdnU/lsQ/6YPKGmu7xaWoGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970374; c=relaxed/simple;
	bh=x9fabaDsNlK05ajQm4gX5bnfuMO1JF2Jd0Zx8F2QD9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UejvPhI79RvvqM0ir/Tl3M+8tg8nHECvZc0C1KA65AXG/eDHCDek6Z+vRawymeINrTeduHMCvTP4MF/TiK6kE+AU2edrcDoSuQMUTGZ/3yBLAsuvOMdlK+eNFpbfQc8tbnIh3LnujGK0hj+JLzsxYUTNaVPOrpsSK9yCV3Q5kWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1CmVOiK; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1CmVOiK"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4e9694so1793174c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770970372; x=1771575172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFPrQ6Ot9eJDg9aeQxRAL9muhs7folZgYoHqrrQqjiI=;
        b=L1CmVOiKf6EM196vNpTcM+wltA4lXAxTBg6Hlo+AO+UCO2JnCdDhC1fN2EuENyADT2
         CXk5bvtfD0S1VDWjLFAssgq53YX5cCgqUtIaw73eyOzULaLI2CT0Z+Vkp1jQLjFCPOZu
         43pyW0kxV+jhl3H5z2Zl6tMjeAHBc8JpggfkbW+2VN4qJZGIerWE9KJQe+j/xHnB36OF
         HnBPkoxSc4Xac+Jq70GEntlpMs2dpnKvGhUbMU0UPD8efPezScYgAPg8Cm7YE25lMmmV
         RnCkI8FwukI5TD3py3Mdi/pvFq5kHiyOv1YLkE/QFlSIR/Kn9Czd7MEhxYWGQCNLBAlr
         3qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970372; x=1771575172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFPrQ6Ot9eJDg9aeQxRAL9muhs7folZgYoHqrrQqjiI=;
        b=xTc1NAxuc8eLUg8ylOJ09o0NfWPvAaj7ceDK0iDL15TGF897oMgZ1h0NmIYwZthxLY
         u4Dz9JdtN14QinteXniOb4z5tjUpr7Cnc58FIFUTbksZYlN7blIeQUuy9y0ADFeWEkqd
         enPJRvSs6iZRNuthlyIZ+yTCv7Bp2Gdbe3jsItKfY46K7ldkHyr8KdZVTbM9lyrQ4aW4
         7NfX0bTn3nhubDzLQsvU/ROdJD34oh2HVlXmRDljdqhe9InHBNKGeuro78w2mecVZGwU
         MrDnDjtAdUu7av8w58hwdkL4pV9Z3HiJaICTVF0ror7CtAR0wEAcg9BqnhIO63TW+YX6
         C2tw==
X-Forwarded-Encrypted: i=1; AJvYcCU076RctvRgiasUfoynq8QZb8nwTJ84S/zBWAW3WasO0VN5OksVghWo1Nw3WtA6kItPAi1vbxxkaaT6Y6hkrfu8xw8A@vger.kernel.org
X-Gm-Message-State: AOJu0YxOwxngHGXSZser6ZXxVMWrGJhsau47P+IPjwiu6dOCoLTitEjG
	RTZ5IA7WtJFsxdxna9XIMx8p/Oy7oDu6LuDmnrlkrc2OVlMIC+KKdCwN
X-Gm-Gg: AZuq6aKCGlD1RhHx8Cs0Zrq3+3grzQ8bYiBUQh3lm7A/ZLLY+SFTRx3wQ1+eMfB6W0T
	GvUHoKilwgIhbawI+sKRgW9PO7dA7wDF/7jYC1ag2px3JSqzqOaDuMgseIa6b7xgw6r+Woxfs48
	UxYtlQ/1NeImIqlNkCyE8PgQ2tW+QIDVSICAabJNIDfb10IBs2iO5iRK5YV2BHl2kgSP9or6QxS
	zlkaZmnCT81ehkq+KuSmJ0Od8T7ywDXNd1Obmn5DEHS8OSu3Kxhuzo/XsuA+GgM7V2Xtv09HZOc
	mfqImecgfZlak7vEd9eR1RHqdJuU1YjVGYE59cNNRBM5JAkTHPzBBjVBQRMet14IplaSzDJq7V3
	AAA+Mu2HIMAAZ1MKhDb0J5I8Jy0GjRdriNG2mdd1swfEwpRKHiwyIug/ihgK/S8ocs6wZMdynXU
	vjjd74CLzSY67BKTQHc8P0l1dc2hfe7jfUoPrhF/oblSXepQgFqm51NXnp/4JK1zq/ttQIY5/pY
	HY=
X-Received: by 2002:a05:7301:6507:b0:2b7:12f8:5eea with SMTP id 5a478bee46e88-2babc3aa7e5mr445529eec.9.1770970372114;
        Fri, 13 Feb 2026 00:12:52 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd0a04csm4975052eec.33.2026.02.13.00.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:12:51 -0800 (PST)
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
Subject: [PATCH 1/5] platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
Date: Fri, 13 Feb 2026 08:02:53 +0000
Message-ID: <20260213081243.794288-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213081243.794288-1-derekjohn.clark@gmail.com>
References: <20260213081243.794288-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo/wmi-other.c    | 32 ++++++----------------
 3 files changed, 16 insertions(+), 23 deletions(-)

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
index 6040f45aa2b0d..559feb49c9f11 100644
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
@@ -787,11 +782,8 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	attribute_id = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				    mode, tunable_attr->type_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
 	if (ret)
@@ -838,7 +830,6 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	int retval;
 	int ret;
 
@@ -846,13 +837,8 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
-- 
2.52.0

