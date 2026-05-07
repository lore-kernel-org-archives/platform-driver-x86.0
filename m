Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7947B43E
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177133; cv=none; b=c0xibbpHa6+7y3VbL5OnF1s9NZYUgndLFJv3juTp9rWV+S6vRzzlOVk2wI/EbJaBjq2JE+Egqch2XNQMdRU5a/ftOoXLsbDzArYTIosSjLOnhXe/7A4Knr+kLx5Pak3lkguQZXWMmMcC15iFCO13A1XUwpjdmgQbTsfzHDts+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177133; c=relaxed/simple;
	bh=+QPdSU+dPB1x1J3djFO1i0GpGdLxjcaXfm9GenpXhHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2cv5lTiAJxEi+AUsOb1TAEMQGyo7jx5p8LZ39jatZVCJmJ0yRec+v/xHmHwPCloeLcyc64PP/ENkzOjDt9Kf71RJrLNq/UsOz7jTHIEXJg6/YovAMq+gxzA3cUi68Y3EClt65iQMLXghIolJ8S4bLHtMh8ny+W04bkjjpdtmjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGh3PRt7; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGh3PRt7"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f33ae12f97so2106928eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177131; x=1778781931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo0uRteE6cnYV0vTF/SAFjT9HZ5JS4EyHjI/biZinx0=;
        b=qGh3PRt73KGLSUjMZQJv+xxAPgtvdACQY4Y58oqG6mhfXG9OWap3M78p3rxDDv+MDg
         GAh/HDY1rWv4gpoGpVCErU5TPzUlf0HYvoEByjhXEF0HRGwh82+Gc8S1heu3ZWu5DF8y
         drYXV8NK/M7Xg4YFmVoDNwY2PXn68d7Li80xLaP8KCZpJc7Ud0b68EBX2yzfx06flfD8
         IHxg5Z3d+u+MhfqxMsdd9zo3rfRC7sygrPjuiceiJEjZxTXTahFydfabU+dkiieKc4Jz
         4T6fW7FCW0QngJfslldZkow946ruIUE6k5OXCitCl7+gpTQr8Rejf8Os6Y6Z7+QTWboV
         UvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177131; x=1778781931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lo0uRteE6cnYV0vTF/SAFjT9HZ5JS4EyHjI/biZinx0=;
        b=IrMSlonFu/mJgDMaWpoaOScTLixmAqhNn4NNsdLjvLbQELfr3SSP8Okno9bbMcGsdh
         5NGaEg1ZWCJsQP3vdYZh5LBvVLiLczfaONhWqcUBh8mY7mL5KhHv1S4aKByxZWaPEcbM
         /dQj8cm66cDbHC3J7b/22i0+ia4hrHFi7rKEk07twnycwdbdQqEBIcbGR+E2qI2us6/W
         jzjP2ulyVrKcmZsbj4c56mzk4u8rORLtJl2aFjtvf9ElldleZcupwk44zgo78zKNzucc
         D8iac5mPePQarSOZIN0t19f9c8pTn1N5OmjYfOcD+DAbN8qeEe1a23quDDcMZBIGyuH0
         5JwQ==
X-Forwarded-Encrypted: i=1; AFNElJ95TPrbwScQB4jQ5uInFjVHXoOoOgQj6k3LoXVXuSQU6z7q31oMGwVsNjof5+Yg0VvY0CvKzGhSTvZa/MMRaFEBRiE2@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQNk6OYzFG2yAt9ThiUKmu1IguCmDbwzDvHRs2Q7VFcMke+D2
	yHwaOxIk1JDJC4EYfBAdNbnqvVVIR3JSvXvoRhDcYnAcCZX4NM0tKrAW
X-Gm-Gg: Acq92OEQpfJS164oM62RBsKTzztLdN39p/qt/Q4eVrbTIM8rdLWdkC6nlz1txElwjQt
	3PL2ngfT1XCPpoUpI8zbA/v2xb1bz+XjR0ya0buhbiMWT+9T/3cjWeppjkgvLFBlNnUTWHj7KRi
	BH9xfPfFfPARhT0YAt0BHf0C8TdsQyxtcIQDYs3bvP/4/3dzVnpVUeHE1p5lKpbqVArEUcDtr4o
	EPh7RwYy4+xPDKwmX9ODgQBUSmbpRMjfkhU2gUJzf89lnc+5yI0gARlydDSuT4yT72I5cX0Gx/g
	QbUP23kwSHzf6oRj1dtr2akhDAvuFW9QYRHtY6mX+0wZg23d84Ee2125ageEapVmZyMztGjQTSB
	YcxmD9ytrpm20oDNwIWx/YgQ5pOwWJjdgXa6hp9+FeWKM7xyJq9nbHb922ZqXU5P6RNKP9PJACD
	obMe3fEkmeXMIbzvY3feEo+qdjvuq1/9Df5Ndu6yUR+wz9slkghCFEV2vuD7dSrnfDW5FwJzZWd
	qTO
X-Received: by 2002:a05:7300:3245:b0:2ed:e16:6b4a with SMTP id 5a478bee46e88-2f54b98f603mr5358724eec.32.1778177131129;
        Thu, 07 May 2026 11:05:31 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:30 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 12/15] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Thu,  7 May 2026 18:05:04 +0000
Message-ID: <20260507180507.912966-13-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507180507.912966-1-derekjohn.clark@gmail.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
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
index c84de0ad0cc4..fb301c54d26d 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -92,7 +92,7 @@ enum lwmi_feature_id_gpu {
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static DEFINE_IDA(lwmi_om_ida);
@@ -1130,8 +1130,7 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
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

