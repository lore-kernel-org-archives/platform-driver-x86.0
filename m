Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2007F241C8C
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771136029; cv=none; b=ZrPliOyHu5qcLKv9WHnVony32y3nMOFBukGnZ1ceMg6nwlPg9TIwBzae6BjY28E2DiB6pbRE5TrErs5ssS30fuO3UvWA4ipznnzo1veqr08n5qdV5F76cPURr6UBO+OPsWKNHY3qxKY82IudcAjstLmpFnUvvvDv7z4YI8m900c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771136029; c=relaxed/simple;
	bh=b2kRx70R2FmAvn9oIm5rQmwY1X14JU7VMcFqkLQR9uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1pskqbvZZ6qcHlNmApBnX0M4aNPDUGZ4cfAmFQaFov+wAd/nyE96jgLqnYnYEq+ohf3e/pP1F7POIk3fcYVVYmJc+QyX6yK/8I3D5T1ArcxRYw34CihrqBESyX9QlzUZFRbD9IgE5jI3oH74jfq9VoxGaYSBkYn0P4lHCsjc8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY21YjMo; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY21YjMo"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba6aa57d5fso2206706eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 22:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771136026; x=1771740826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8cAURfQXVGK/iep/lFxjpueu/CHLixKteAdv7jcw8Q=;
        b=hY21YjMoMN4WjihCcxBBNkNS+yw8ExUGx/Vlgnm0NJP7/8SjH7aCwn1A5szb5sFhSl
         Htbqggbz8RPD9nKso298N0hNa2k45LWTkzojTFg1kqutdUui8hBaRYtOXtANgve6z2qB
         cQLhnU0nEfOaAjFwuwqtbOXK2bipROHqpvsMi3PvU1NY87Evmzb/9ioLguBnITpj4lPr
         zFYCYuiOd41bVZh2wc4+K53e6gPAFdbz3sNvvsHzRVKiIuCOCGe/300WhLmL4MSB5qn3
         eXCcfXXpXDlSMzLCK6IAv1Tj4pCSObJ/whikCPl5pue2xINNoCKCriLq4zeiGBidGQVm
         hh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771136026; x=1771740826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O8cAURfQXVGK/iep/lFxjpueu/CHLixKteAdv7jcw8Q=;
        b=YYE/pvLH9WIkrYrJF/JEUPFqWFPZfehGOAgesUionENfZSL3zfUjCeJWVHXiJFIcSj
         z8t/uF/XtoJXxjgFCVKvoGTxK2mcYuLJn12OjEtTUc+NexoIg1OmORGMcNoYsdhTfJak
         GjjIW2WxNlVGrS8uMKfRfOU+z9/XoIMU2nQi9fO+fx0stuWmblyit48Az6iJRzcPGCbw
         u7cCmjZF5rD6gGs6NN3JnS1mLctW5bm/tLRAQ+077Fot/uLwW2XcL8XgOjIiawBVOMXk
         2ucqfoOTA7hL7W4v9V4RAxDVsF2gnTo25ByM9TB4zI+uASLywIq2yqrrO2W7nBQaLmqs
         jPlg==
X-Forwarded-Encrypted: i=1; AJvYcCXgfx3uGXrEtcw0lsg2XCWw1aWkpJphUx0/H7DiAuy4CkB0oBJ6LFNRMjghEKk5CwZQYGoNQ73+TyJaj6O7sfqRcf8V@vger.kernel.org
X-Gm-Message-State: AOJu0YyOAPRhYschywDoqsnqn+NmGR46kQYnHcl6vHvRUlRoDnDb/+q4
	WxKupq9l/AI0ozQkyVYcM+De5YI/hiAR8a+eLEpAWb/Tid4gS6j303hl
X-Gm-Gg: AZuq6aLiM8qnqWSBB9hv5B0wkcXJQlKM1ZMKw70sMWMs9eOzxISK9xZxpcGAUpIoLK3
	aNNqA/BkpLPtq0TEtdYPhMVyAF9f/27AvuYKvHmSGLzV4FFr7vc2wKbNKjRruYGe7hYN9ePV+Q/
	RIgYF66uZGPx6K+yw9QDjwGPuXwyjOvNGWqKqYsRZPzENavqf3bFZGLfC2jTj3TKxT3s1VqC9a6
	8b+yMD7nABfYA7rKxVV9w8d8hoaXrUQKvxKqJidMz6SiekvH8eK/PVPIpU75m4lWo6ZNVMJpPdN
	O0g+oj0C3LmZYl8M4DWFhuvbGk0Iu1QxQWkcKBZuipJ8YcU/A6H0tm+pVOY0qGBvVB1IHhn9TQ1
	1c54vaBp884guV+pFwjkhXPOC1YUxcBOj/Dm7GVFiLJ194tMrvSOz0Gtg+qdPgLyQ8VtytdS9q+
	RAOz64khnoonlcmIx2lgIaG7e4Bspp2oxPj6UHsrZ5aGvjJNzSRmDcFbZcvyqtVJsSVDRm0K3zK
	SM=
X-Received: by 2002:a05:7301:1007:b0:2ba:68d6:47ae with SMTP id 5a478bee46e88-2bac97cb47bmr1305341eec.34.1771136026240;
        Sat, 14 Feb 2026 22:13:46 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm4759245eec.12.2026.02.14.22.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 22:13:45 -0800 (PST)
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
Subject: [PATCH v2 5/6] platform-x86: lenovo-wmi-other: Consolidate name into single const
Date: Sun, 15 Feb 2026 06:12:58 +0000
Message-ID: <20260215061339.2842486-6-derekjohn.clark@gmail.com>
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

In the next patch a power supply extension is added which requires
a name attribute. Instead of creating a third const macro with the
same information, replace LWMI_OM_FW_ATTR_BASE_PATH and
LWMI_OM_HWMON_NAME with LWMI_OM_NAME and use that everywhere.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 876834af838e0..8e52f692f8605 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -92,14 +92,13 @@ enum lwmi_feature_id_gpu {
 #define LWMI_FAN_NR 4
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
 
+#define LWMI_FAN_DIV 100
+
 #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
 	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_FAN_DIV 100
-
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
-#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
+#define LWMI_OM_NAME "lenovo-wmi-other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
 static DEFINE_IDA(lwmi_om_ida);
@@ -454,7 +453,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 	}
 
 	priv->hwmon_dev = hwmon_device_register_with_info(&priv->wdev->dev,
-							  LWMI_OM_HWMON_NAME, priv,
+							  LWMI_OM_NAME, priv,
 							  &lwmi_om_hwmon_chip_info,
 							  NULL);
 	if (IS_ERR(priv->hwmon_dev)) {
@@ -1253,8 +1252,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
 	priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
 					  MKDEV(0, 0), NULL, "%s-%u",
-					  LWMI_OM_FW_ATTR_BASE_PATH,
-					  priv->ida_id);
+					  LWMI_OM_NAME, priv->ida_id);
 	if (IS_ERR(priv->fw_attr_dev)) {
 		err = PTR_ERR(priv->fw_attr_dev);
 		goto err_free_ida;
-- 
2.52.0

