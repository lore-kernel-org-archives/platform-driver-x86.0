Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA26280A51
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 04:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907532; cv=none; b=R4kWfw0objoaSSGKh8EjVsnT1m/ba8JyMlE5I110wysivLTwcIysZaJD7pLwUNEAek3X7XcejRUMQ/B2zGEH7lIpvoExywCsHmWPtFXzdHaYEgsYAdlq5Cs5tAYm313+e0nusA8INK+vobME7QZAP5CxRC0h90kkz7j9NhNc3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907532; c=relaxed/simple;
	bh=BSX/lkKlpLye9IVPETat8Vg/SLzeUnyZtBpISqsdFPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbCov6YEqRgWt5GBn3lxTi+L1N52fXRALMJZ6h65AuAVj7NoNywEjAiYqoJjPkIIBgebkr4pk2Ohz6nbxqR6rq5cTvTSNRypahETHV6gn3cDBEi9jlWlns0XltRH6znDJDwWHc+OxXRFvA1ItUZ8X0TmuZOnIfCk9IcQRZ8bnbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3RuN6q8; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3RuN6q8"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-126ea4b77adso6117869c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 20:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907530; x=1772512330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUGs0gBmWbDnzbyUxiLzU5cMCH5VPbW0yPuDJsteHR4=;
        b=L3RuN6q8updHyd1zaElSDPyKati6lxCVY1sk6+IU0WHzWl56GdfKWZEQGiRnHgE8m7
         3FqVdAAeSlyMVhIAZnC/retNXfxPwq0fpCyhEFnLaUaTNNQSSyd8LbEl5VIxTcy+Zpro
         t142kFaT1pEiql48fDrwwsd4rKKM5oAd80iNHf70Z0YAscydKHD8fPDvWcb3sab3BE7f
         qE/wv/HhCnxNY4+nu/ON6BKE8TUAwJ3oBwRRy39uAFWLzyURKS6QJ8OuD88UUVIne5b4
         QU3SjWD3onYob1NWfGehwUq7n15k9Kyf5TQ4f+ISVvyV4fdTMWcF1B/Yzodew3ynU0UX
         kYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907530; x=1772512330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yUGs0gBmWbDnzbyUxiLzU5cMCH5VPbW0yPuDJsteHR4=;
        b=kTE/ObuYpH78dnyxsGTrDwih5ddLkr3l8/dTSLA28M6wG/Vc21GjoFfoZVsoy4t519
         SEC/pMVm+zfx8AQDqUYBHIuLNqxmSZz57rpUwLSgZYeSsJMDgEPfCw53Qv1KAc8cSjGD
         UEIjdLyrm6HoTshKeu27BCejGUHgLUHO66F+9a4flgfQWj39H86I4GaykjXLhgWmoaUt
         Za+RQL9JlQJBldq5YVIdsFBHirFmz91FwUYZohcMVmvy891IfsOzHjEhXYoJ5AZXCrPm
         ATJCdwcjw9QUiBzVSkZpd/pLFbwTr74z4/eRaVcuCsvBc92iR3JV/vkA2MWuAJJ0PQ/K
         YG2w==
X-Forwarded-Encrypted: i=1; AJvYcCVEPTcQ6qEN4tnFWOC5cuqw7AIEhqlKxQB4Z0Utzxwp61HAjvpAqWz/fwl7XKzO4/vsTDS6pHBWz3K5nf3C9f2/guoV@vger.kernel.org
X-Gm-Message-State: AOJu0YwVd3KlNtXX5Ii4P64vSJVp9mUe6eRiwhLuvbcWsTnTI443LB3f
	nfexbxMRHM3MRI9LWLC488wz0CGwES+xUsqwn9FRqjiRMj0TQeprCg5G
X-Gm-Gg: AZuq6aIQn5k+wdW4hUUekAAjspZzfcB48gpVEM+X++igTpoeOwFqK5Kdg4jrnS/Biv1
	ndfqghOj6eqsLSdkmiJ9P0PLrhhPAm0C/Zo94Zv10Pi6P8QcNngRrt/9CGp2QFM1551A82/PYRF
	074tbgaFqel0TXOu7iAEWFWAl5fMAa0yMt+xF2a9+jbm7KXLMLvrwNungV/QHb+/9IgVfrRFFP6
	CbZbfgasNY7tIkjzMUi/29GJ0+Xsq7rUX4zPH/dM6LjKKDt0iDIf/Ztu3ojkluSTIH4uBJiICYy
	xa86YPms35/op2QiDhQdNi6IIaE4v2WBiRQwm1S/8Sl2NKMMfggoz66t/JQCZY/9B71zfo4KKww
	MJJZF7dFBPxTpI9Z35qy7nEU2FWFu98di30IZ7YFAZcgt9cA22OZzWtj4cez1GrmAeuUTNiCc2U
	bG8frO0aI2gUdLN8cMNr93nuXjgCsYB/lu75cfpgfdZPn4Ed+dVslCAKa7BiF9mZnZGbLvgY39v
	po=
X-Received: by 2002:a05:7022:248b:b0:11a:126f:ee78 with SMTP id a92af1059eb24-1276ad33741mr4628325c88.34.1771907530284;
        Mon, 23 Feb 2026 20:32:10 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7b4c7sm9607887c88.9.2026.02.23.20.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:10 -0800 (PST)
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
Subject: [PATCH v3 5/6] platform-x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Tue, 24 Feb 2026 04:31:59 +0000
Message-ID: <20260224043200.2680384-6-derekjohn.clark@gmail.com>
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

In the next patch a power supply extension is added which requires
a name attribute. Instead of creating another const macro with the
same information, replace LWMI_OM_FW_ATTR_BASE_PATH with
LWMI_OM_NAME and use that for firmware attributes and power supply
extension.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 67768f6a50e0..7f0d5a17b44f 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -90,13 +90,13 @@ enum lwmi_feature_id_gpu {
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
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
@@ -1233,8 +1233,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
 	priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
 					  MKDEV(0, 0), NULL, "%s-%u",
-					  LWMI_OM_FW_ATTR_BASE_PATH,
-					  priv->ida_id);
+					  LWMI_OM_SYSFS_NAME, priv->ida_id);
 	if (IS_ERR(priv->fw_attr_dev)) {
 		err = PTR_ERR(priv->fw_attr_dev);
 		goto err_free_ida;
-- 
2.52.0

