Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0393364926
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100281; cv=none; b=cH8aW7aEZxxvaS5OGbyQi2BEVc23i+Qn2Uq7TypwNfBPBHzV6Xv2mI5xAOWDIqQD5laX/y8AjIu4V+2oubgoRVXR8CbLYv5PTsIXllEsELleZVd+WaKDGDlQolSwQFkNn0tWt8vet1tdYg9yIhQZ0ofYUrPBwRQnEwsBILP0Wok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100281; c=relaxed/simple;
	bh=iFh0kepAp7+CUCWbukOagQfE8oUi6Sg9g6FZBrgbTWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miWICaRnzulYY+oADmIOApZSR1qRWExCOJpbnQzMYYVXx5EH3MyrjS2ZhpAKIy5LhJsf7KRjAq4aTV46Fk9vui2os1drNqBP/ofLVHoM4AnDPPTyG94vlxVV05n0r1mtSk2rd5i69GvJmWOiDJAYnhZT+bjTo+StrH9WmoT77ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrdKvvBD; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrdKvvBD"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c88992d77dso843157eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100276; x=1775705076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOFchhR6XmnD1NBAnpmpLdo/GO9fnq04FOmJKxWkKNQ=;
        b=rrdKvvBDNVXVACASHjwEWHBrgLQYI6wmTpqfO4A/GfIMKJigpNNYqwupor8V94iOEG
         D4p9LPp/aRHKOqYi9RAoasCpfnbiflhDZr6KPllssCrauLh5z/1IIqmGDbGs12aWfPDd
         4GgPkutZSgO1MypNYRbW3gwflSi62v6wwiG20DQWEEifkXqU6d5aO4iHbsb1npt031Qh
         G0mxYiUkntGFYsCOw5qodQs2RtdsRIkcaOTVpijw+J6HwABU5cdnsauuNILcwIYL8EIk
         2pbTwRvy03gWE7Mz3cyxUE7KoRbYg4PJ5Dv3SENe9K5ShHiL1rzqqHmfHZJI9pzBEZVd
         cTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100276; x=1775705076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qOFchhR6XmnD1NBAnpmpLdo/GO9fnq04FOmJKxWkKNQ=;
        b=CRS0lYmko9ee+d6vUOfY+AG4c8GOYrvSlZ1mvI09VBJTX2TNPQy/rBzNlkl5a4W6T+
         FuhXZglg+chlXDB2+J4hO0JF9XauaIU4xNGPHMW+gOgSyqFW+G34csqaYikXrXanUXI8
         PmyTQy5ZXXo/y6Vx2B8Q4/nRdroWHAqUS6XpvhNKZJNW8tMi6HjY6qVrHdepm25OZZkx
         2qT/f5UiWJTqw1UKbUkPYSGmwxK5Jv5FAZNTweTpECKjbt00W0B6N3q1rqkTUzSUZdOR
         /AFuElVA1Nx1kNALtjtBHSHrB4azkjlCjrix7eY5acZJHMRNK70F89eZiX2GfNrE1BUO
         24LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS9N0pckX5pfJvW1IUb9GvgLz2zDkAxUfE+PGUQQWywk1W28XEr4EzU74rqtvjJwwdCzGOr1wtFfsj7aU7gvMPdsyn@vger.kernel.org
X-Gm-Message-State: AOJu0YzTQ6P7kGTF+oMvKazsPLCz+RjrLlwoXkG3xadZBjjr8vhq3SaA
	mGjRYgeO9tRWt5R8nfovc5YIxt/gyof3pwBnzZ4kvxEgYe89KuhAZF0lcoOvuw==
X-Gm-Gg: ATEYQzwh6KAzi2fLlZaNgkwOu4wjhJkYrT/j8UtKCJdNa5jBT5jgMkxzG/tazHI3Bm4
	+L91ZKw6Bztpl0UUvNdz8kBhbCHoc0HAFSsX5Z/dDueqqibz4gImrHW7cWO7rDf/ebQjXzRpvuK
	zt9BqLHkuaTzLYwYIkCbIRFkP+OYh3WYZ2KlLTy7WFIsoAVF+5zWz3LHBp3LcoV7AOkLNeuMTLW
	Bfhb4lSmGGB7q26dmfOts8/r7wp8YpJE6vIntT3hMsbp8jvr+nFFNqXf6wWhTDGLy/f9zp17wb7
	egyLVvVum1iraGNNfyHIgLTZUsdUC5fS4YZTBiLZ6v8r/OuLqHX29xhxnPCnnk2F2zFhFMivoYF
	v1t3cEKY3XSzRov8T11w1PJsFa3YXPVs9YDG10aoEWVO0KSQknUjKkGp1Zg4GfbYH4RyYL/Un1q
	C5K/WzuKnyS1I/MgSMbs2hmyAFIcJUI7v5N8NC9cSYIxRS7lqCOzhDGA09XJyApJJQyRfWGCWqO
	hVh
X-Received: by 2002:a05:693c:3106:b0:2be:b20a:9b69 with SMTP id 5a478bee46e88-2cad7e37c3amr305622eec.12.1775100276521;
        Wed, 01 Apr 2026 20:24:36 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:36 -0700 (PDT)
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
Subject: [PATCH v7 13/16] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Thu,  2 Apr 2026 03:24:21 +0000
Message-ID: <20260402032424.678528-14-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the next patch a power supply extension is added which requires
a name attribute. Instead of creating another const macro with the
same information, rename LWMI_OM_FW_ATTR_BASE_PATH to
LWMI_OM_SYSFS_NAME.

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 57b6b6f17f33..3ff7b9680f3a 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -91,7 +91,7 @@ enum lwmi_feature_id_gpu {
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static DEFINE_IDA(lwmi_om_ida);
@@ -1123,8 +1123,7 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
 	priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
 					  MKDEV(0, 0), NULL, "%s-%u",
-					  LWMI_OM_FW_ATTR_BASE_PATH,
-					  priv->ida_id);
+					  LWMI_OM_SYSFS_NAME, priv->ida_id);
 	if (IS_ERR(priv->fw_attr_dev)) {
 		err = PTR_ERR(priv->fw_attr_dev);
 		goto err_free_ida;
-- 
2.53.0

