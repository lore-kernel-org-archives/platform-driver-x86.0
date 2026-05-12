Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B34E36A36C
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 23:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630295; cv=none; b=OW7uQ8j68Q8UnbM+ij1uINdfl9yR66GXfuA6Ecg6xP7UJnhxXh6UBysoAzREp5eLjvVqEKZow2u62/9VPaQxgR5HpB8Jcvwz3/dr6wWWCaz34i3UwyavcZWLyMdszXEJW0dgZ1u8jE49T97a+lgaIbowv6Im2gvbBUQVnL2DbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630295; c=relaxed/simple;
	bh=Id93/UmAkBayU5XfSGvwm0lXSys0aFHC0XBVBr6Ke64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LO3txrU1mArCAWLdZeMi4TaAyd9C5qC8xAJyNJso1gHUS2acWgECnLFQdNoMZsIdHBJWBYCdIC85L1vPja99IojJ3ce/sD+Y3sHAOhP72SbEaagI+cWWNfD0nFECHtxssrKiPcIRe0aLKfWE1/D2hRFRe0pNjoMWqHK4lRSVJTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNO0MrLx; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNO0MrLx"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso6115024eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 16:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778630293; x=1779235093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWqsB4N1kVJNFFXBSICu+E9ixr8c1InK11jT5wOF9tQ=;
        b=YNO0MrLx1vvJ1Vd6lF9bMJLtZHTBj9+fLXYMoELzxi/TX8mHD952W2FQhvHM3qrY9+
         chwKRB0V8KGFfF0w2w6CJ5max5FdErDOqA5FXXMpsDRNPxRE7TDBpLKcQHev85Jg2jgL
         BhK/0AK9gqJroQ/500/LXFYAuy2W8Epf0VyxXNUI5Jzrr0cbx3eIi8bQxlTMbpmQHE0E
         DhrwnIjoSCJ1HqFXrgBJ/HESfCKLIUVAIyagWBNZB6a6e9kwSvuaKNN5Lg3LoEoufBKz
         VuEUoBVmNfEl7zqnj+Fcih07mOut1WbX7AcZeHrF0jHKuPPhnspeeDsP/fJIl1AwuXIO
         rvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630293; x=1779235093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aWqsB4N1kVJNFFXBSICu+E9ixr8c1InK11jT5wOF9tQ=;
        b=Rt5Yo4yrF3gxdnTu/7rYBV63vY19cDUwuO9fvNXvADOxa5+VBqIyQ69dW7AkweCDEp
         GLj6qLqboFDy+o1Ra9oZgq4kWuE307kBElRzUmAOV6ICPkG4z3y1Pi/sW+ekX0R7D8xD
         gWwDFCTYgOS7dTOlp6XjPyVin9MZlBJMV2vFmARx31E88cE4p7M5scLS+lW7K12hsf0B
         XHGNKdnpRdn0JHPxP+9jBZAL9icP2iHVqgNfT7oxuwHs6hRXorNOCoT6pdpe8rL6wjvv
         L9/aqsz/Obb+BTj81lPsSh8FErb1HF6d+AZhnK8ztjNdzKJQSkBahqTSD2D1qw5wCSSt
         PSdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9kP8EHFlNJkijlXFnr5YkZriDihB8+26ief+oidefNNFPkId+nDPEB5kKOFU9JkLRvbImugc6t/XMk7hKPqu3AzSg@vger.kernel.org
X-Gm-Message-State: AOJu0YxID7E/c/Yl1+/TIDxmnLkM/gkmzPJmg80uTnb+8XYlbfLDdhS8
	EpOWP9g7KAKxkrCY0yUBXtDU1e0obdav/uQrC3myFGiecoYP7NAB9pcj
X-Gm-Gg: Acq92OFYf4abdXLg00SIQwfGJxO611RB6i67x+VwQbVR8faJo29+Bs3lASAC+3NKVPv
	f3XSpK9D8w/ofNwoPyzaTx025R69cjGfcULFaeLbpsiHUMiMWOkJr8VMgTAohlydfmhH67OvGjZ
	44nW1L07iDu3qqsoYsLBGDEf+7YdUEpuO+pSL4s5JWohLxlJXpY8gUxsj29tDbvOGXs7qQ+tq09
	qC9Hd69q2n7jwAu1B5YOxBB2O7TaEcKQe5iRo8FL2vrE1Pv01jY7DoOxKTO0x3I2dYATQ27aRDa
	2KVPj60JBUFhqamEzbSu2bcO/pzcQ4EtgD+ytZOMBqZPSRUsrHbr4SRRjYjRFPz4v1gHftI9uiX
	SSKFrDq53kc2DKmR9R9BP0uPK/xO6spqHNtUelyRw4wVhm8ZRKpXQoriLbC9J+poTdI39RYto+M
	SdgJrTncMRNroa7QeKxD6uRNHVD5sVHr3zCojaTJLBM5OVm8aRzJlaXlpyiIpJxCiQ2nkq5gPUs
	qMULiEt0zy56nw=
X-Received: by 2002:a05:7301:607:b0:2d2:c60d:4fe5 with SMTP id 5a478bee46e88-30117c7ed7bmr744899eec.6.1778630293399;
        Tue, 12 May 2026 16:58:13 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm23625851eec.27.2026.05.12.16.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:58:13 -0700 (PDT)
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
Subject: [PATCH v13 3/7] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Tue, 12 May 2026 23:58:04 +0000
Message-ID: <20260512235808.691046-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512235808.691046-1-derekjohn.clark@gmail.com>
References: <20260512235808.691046-1-derekjohn.clark@gmail.com>
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
index 9a6183bbcc92..beb92c7cff25 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -92,7 +92,7 @@ enum lwmi_feature_id_gpu {
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static DEFINE_IDA(lwmi_om_ida);
@@ -1138,8 +1138,7 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
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

