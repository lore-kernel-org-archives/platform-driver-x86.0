Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856BF44CF3E
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980745; cv=none; b=R9uf9AQRVtDNcHNq0pSp9kpEdGOYsXckHYp9XNqu6qTVqI3UqHIWgawM5+T8sEGmZ2YF+Bi3yodVCXFh4F8rINmvH55bwrk/SVXlSDZN1Tq2W3TarbwyuiyqMsRtuSvd0YZHFcSUgZxGbXur4TjmCuzcJlLlKEIB3RLq3F+72lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980745; c=relaxed/simple;
	bh=c/P/RGeNTE/h028wWC+cxUj4bTCm1sXFTO7yyTJIccQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d779/POz6KDFj9PUJG5HPgTQTWwLxFLMgDNbH95tYE272OrrDCIRO3jmdWnEThpXRbzj8QKVCRig/j1OECBMcxyseshO994vqqu4nsbbwEWuCdwUbiPVfMOPZfkMfXkGOItJNQPr3ughEziKDql0AR6RjtKeIxx5o3H8DPVDJYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIUHufSD; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIUHufSD"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12732e6a123so1705237c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980739; x=1775585539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmuw6txTrzaBR5zOiwWgiTjEomy8i+I/unLJ3hDl42o=;
        b=UIUHufSDACOy7CnyYBw4PD187t+H+gZwh7tjPpWlLJgz1uci7FvoptkimYNU9bKQrU
         ZAPYEGReXQLL+z5rFN2UA1N1jvaeRxyN6EnlzJ5j69AKNuzPEtQ7JpnuABU4xEudm3Ng
         YEKHezw0UrHgAiqtUkm4ZAibhrtsydU37mvZKZjKumnQGKM+M1S4w00mreXjAKsDMc8o
         wnShrVpky+4g8GDdjNQUfjZG8Bkxxg0yd15pHzqPX1cU3H2gBfraqsGL8/h7r+7rOvo3
         P6XKsVseTbisBnSmS3YwDj7hbph8/2HXTlQbcwUAlpT39lFuMcCVIS1gfuFkTduEsIGG
         dVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980739; x=1775585539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zmuw6txTrzaBR5zOiwWgiTjEomy8i+I/unLJ3hDl42o=;
        b=LgJ9stXV36Gj1rnXg21Va79w7lNVeuo6JooEdXWo9IY2QELvkUboycbO46lvMUCMXk
         jjeZffG842vige6I0d8LKnRWbbS02RbqEKRFYxt3z2MPtAHOBIzQCgnZUCYsubE5g13Y
         PT5YCdwnIeVEuXSNNB6ddwULrMedh820Sl0f8yfRAEBHRmROcnICaBgfUvAKGbqx1V5U
         oHeJbAtOFigcgAOO1sYJHmK66/aokccac8VolaP/PbcgWgSxLIlNsixyFWrGRi3mm/M+
         SifYcOsEOV7ufXaOt5Tqk2fZq18aV0/E0lwRZLm2TtNybOSBcHHyQGm/2BsR45FhY/Sm
         eINQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1s3NN6kZdgP5J1XaRDmxkS+duZYIOAwnUOCG6yddRgaQ/hg0po8I234ChAWm5FVutIQYYaUa6WSeckYxe+UImQDf1@vger.kernel.org
X-Gm-Message-State: AOJu0YyICg5k979HQOkcjH+/UFoluYXd6bQuNQadrAzBof2ZFfP+awfI
	nq/MO933khOtOlfPp38pvM6+N0/tm8UzQEXU5Er6q1rYbsNQLijfAJBq
X-Gm-Gg: ATEYQzzXkTbPYUfST6kj2LvN0Yka737oD3A+GwOPcB2Zd0wUQOcHoEbAyMPGvBaRCG8
	gIeL2t9tLZqjcSzykATlspDB385U1TaquxHjxMoFT4cg9GkXPYZLETkm7kyWFySRvNIYU6EORsX
	512JwBQepYHEiTh/hr8HxMqPLWyt4jvZYNS6O6D/3mV1nBX79aoDdsd55rxBCYUXBaVy9Dwi8cb
	FfHJP5s1wO4vPdT8dWyUBH3SYpiXsP1Hgx0mzk/H20JCI4L2txZ/FpZDac4q7TOdHc1TUyhljln
	MWWAH3nLL0iSIB8OLJjVXQQWIGSSJmK/bLgR/YogZbYWfaTil40kcTF95uE9WoFypZykVGHsn1l
	Voxq+m16G8ZJot+imnsYhJrivcGJ8b+vNdmAn2oQKlGrDsJ4r8x4zwD8CN409Wcaic+wQSbWGTb
	RI7Pc/Vsw5yNa4dj1dY4rbUt8eIONORP9/my4VavLN5A8sbbTz0ANM0ewDhRnbhytkWlL7QkxHU
	/17
X-Received: by 2002:a05:7022:ea2f:b0:128:ccaf:85d5 with SMTP id a92af1059eb24-12be644a4e6mr334099c88.15.1774980739428;
        Tue, 31 Mar 2026 11:12:19 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:19 -0700 (PDT)
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
Subject: [PATCH v6 09/13] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Tue, 31 Mar 2026 18:12:04 +0000
Message-ID: <20260331181208.421552-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331181208.421552-1-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
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
index 2792671ac1de..0366acf04ae5 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -95,7 +95,7 @@ enum lwmi_feature_id_gpu {
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
@@ -1225,8 +1225,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
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

