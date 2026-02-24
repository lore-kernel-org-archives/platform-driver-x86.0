Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11B1607A4
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 04:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907530; cv=none; b=CkgBc3qpmSIUzsItvhSm2tSFuawilLu2CCaQig24xbyANaekmKs/jsKsmmqadMPVnPWYy/zvCPgGRqvv915MASMySsUdjkPgaTQN7rODdpOfJr5hFsQJT85SbPAIizpX3JF/kaU15Bk+RK0JX4vU9VnyJd9lJBokXyvhOG12kS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907530; c=relaxed/simple;
	bh=LqAU7VJS3qzJAT41dFUmYBdeix9X3weX9TYWggTt6dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MomOUdRbh2/CpCEN3cIvVpnhB4PoSKtu2lmH4DX5W0nWBZvmHd60yldaI41BM3z40K7Vn8+Wtz0fqI2iWnkWnMVJq5833E48lvuvxfJn3uksRAJB+ub7E61A9poVOdWjMPyqhBUfek0BBlRTwS079iOLo04lEQxcoXwxuWBjOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Up+/Jmsc; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Up+/Jmsc"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-127380532eeso8068793c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 20:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907528; x=1772512328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMalNm3TsX32uk+X6/tnYsZe/zOmNCWUKfIF8l7UvOE=;
        b=Up+/JmscpqsLE2JXSBxNoFbMtiY9zE0kBm4uVGtr+wbPbf1BHU0x6NbKmCMM1Rw/qB
         bNYeSX24qJ4sMs9NLkdAJsRx5l08xmmiGEk1BQ+h9w0EhvTAiT/brYD9f80PSEzcbDN6
         q8sYdYMpnNwFEF0r1pxXuOPT8KapVCbfwSZQrHo4O4SqqpwjUsJSVcRBMhdW0kSo3t+U
         OWVdAUkcmqs2dQOavk4jxHy5E57nEwsaFVGQbwLRcjIoIkK8i0pjzffGX+kiaXW1SHWw
         mSjLe2B9jtnzYq6vAQ2kXmT+MX2UNrLFYiYsZ0zh3V4Of4cMUXk7pMqskTLNDaEkodqd
         Qa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907528; x=1772512328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eMalNm3TsX32uk+X6/tnYsZe/zOmNCWUKfIF8l7UvOE=;
        b=bqoZ+nxbBfYjfG4JC6ehncPiaScCzPsWIfZf4PKcFdQQv+zNvZgNw5EOPZ0/Wngdhh
         HIYgMXdScxDLooBineX1T/CsZtORdNnrfCxzZ3nZJc6gGgmwHU4Tdnpr3SuijOUrb/om
         T4aLD1ndT0zoW893k8oBRjXOPuddkmQR1RBTWOCRqg+0kPPcYCo5uOUzdUkhO5rVnIkK
         lLKn5cIEH39WPnHcmqbs8ONgir3tu0aWrawy8oDM+DSfvawwPAWuWANFUl4Sb/0Pfp3k
         ion+up85k9/ZLIgozZz1+o6C8Bsff/XAmnaHLP8wJvEn8rJpJT+TULuZZOTegWQUduv8
         +1QA==
X-Forwarded-Encrypted: i=1; AJvYcCWnctjqP66qRnC0IcvfUhjp+7vc7pSb1BKrE9tdars4B2IETPuLZk4FIP+ivrYxwAFBCZJRlxp3sgnObfY6N+p5jFWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUquYgytAhUrGaKhuR6Tbk5J6HKyKEnVP/62WpDjA8C0KjXdy
	zCrtbO6pyk61hGEY3Kw2Wsu8Riz1L4jZc1BVpAxelon6h5TYbJyKMLV3
X-Gm-Gg: AZuq6aIYeNeXnMVB2hxuTXt81oyprusXUpStxR3AcD20q08IAflUalOIWMV1G8qe3vE
	KpT845QoTkM6IssFT6PQaSY5dVozsXxyWplBZCN870eET47n09+5fPp6pR+iHCHu686PtB/D7XQ
	jJuyUL/eK+NFOb0pZt5CFe17d+WEzTO9u7915Cotc8x1XSTs0QL6mjH6Cgu06H7NxEQ79kXGfA+
	BrZvDAXocAHtyVbDDO7/GEunyZgsBYaKhCpFOP1YiZoLBe3ZcrUmrkR79wevH472BD5ftbJzu+l
	/eIL88zFta9OAVv4WNkDR/OdZDLqxIp8flmMwsGznZqnZwP1OVIVgqiPGdRxXVSnveE59+FTr6K
	FD2yT8O55BXl7syMOe36D64MQWYEiI8rcO5jlknIpOayg5IeiIOAcF0WB9zas4wk808JR57Pzq2
	fVRcy4d+uxQC/lQRGsx9LpaxLAexf6pEqKXoiZaIqCJ1RmY9FwVyHwfzz4Il+DslCtWaG66lYsH
	nM=
X-Received: by 2002:a05:7022:4584:b0:122:2f4:b24b with SMTP id a92af1059eb24-1276ad1a72bmr4729717c88.25.1771907527861;
        Mon, 23 Feb 2026 20:32:07 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7b4c7sm9607887c88.9.2026.02.23.20.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:07 -0800 (PST)
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
Subject: [PATCH v3 1/6] platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
Date: Tue, 24 Feb 2026 04:31:55 +0000
Message-ID: <20260224043200.2680384-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds LWMI_ATTR_ID macro. In the same vein as LWMI_ATTR_ID_FAN_RPM,
but as a generic, to de-duplicate attribute_id assignment biolerplate.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-capdata.h  |  6 ++++
 drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
 drivers/platform/x86/lenovo/wmi-other.c    | 36 ++++++----------------
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 8c1df3efcc55..27202e2dc8a5 100644
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
index 6b163a5eeb95..ddb919cf6c36 100644
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
index 6040f45aa2b0..95886df39c8d 100644
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
-- 
2.52.0

