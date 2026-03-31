Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A844CF4E
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980738; cv=none; b=fuCivw9qjA6tF93sJnWODucyUJfw4OO2jWTbxv2yCvwrieTrGtUfaCygIwfccqqMA3Jb8qirXZued5xdK73v8euVSGzDn5ssg8n0PujSkC/K0EsiWaq2e40YeiZVCaZdfJEmfOHNp56cnMKYQjKr9LD3oV4KIXDUZ6Wjjkxrce8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980738; c=relaxed/simple;
	bh=G76DP5seIcGoTT/c4erU0FkoTNIAYxuJQD40WNenpGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qk3dyKGBXHRWZt7Uoce6K3jgToOx/mPpnFVDKL95dFdvR4AGWIAUHAh+AjO2dR08BBzSlILNRF5pGQVnL/Tyel95l/55c3syMokIOiEwx3Pqp99zcKKviab2gB5+hfodIkvpKPMmGJaRj+e15bhX5mLfnXQDkN8B/NcWms3norU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJVOEnuG; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJVOEnuG"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12a695044a4so1010372c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980733; x=1775585533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVJH8MWFZ3aEgYtrADH9eHvO+I+mGApgyOe6gg7oL6c=;
        b=ZJVOEnuGRsM5JJmg/kebx6DSMJj7qfYvXx+gtr+/jLAPSfERxZnQRlZbw1nMzdUM7j
         zmPNw/v+4o/OVNI+I2q4C/GH3jdcuNIqUzzoLXYnlvge5UlKTOVBVGfFYwms27lOdIDn
         QhEoO2FPd+KpOC+AUCO+wcG/ssJdhlKTdEo+sCvMhAwTsdf1E+He67oyCEDnjv7KkaHZ
         sHIQmUKBg+03aiNvnLAgmpWv30MZ/iJ+qWwN7RT6/MfL53O2/98xvizjC5fw65hbTr6M
         p5eb34JLp8g2qJvngEOWe+2u3eikiGapcHXUVj239CTG6rqs4nZfBE4rE9K88DICBRcw
         9vaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980733; x=1775585533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVJH8MWFZ3aEgYtrADH9eHvO+I+mGApgyOe6gg7oL6c=;
        b=V6L0QvHENvQ0xGd2hGTC9WeG45cND9xvVPP+tFOHHoYs8xJoB3EJBJc4++OA5rYP+7
         1UWlv2XbxZjnFdBLQwe8t1BHi8zeMhHfdsbDix1OCgAPJTWGuPqJ6Q7JoEFWMsuQTSnO
         LALWtPK8jAzgbdk8bUvjFiNGsgqewClAlykEuT94IEgU76YDpBncoI5nvNhMXywxfTeP
         4UYdf0VZQ1OnXBr/YxJcQOzcRtZzQVbKcQJcd0DG6HiCsb/WPSpOrE4iSAntAXTbq/5b
         gANCUsPoJVnHqYGFdxEUF8BwikchDMT2EpDX5IdFgQr3ORQ+7igeZOt5pIiZKob4LjhV
         //pg==
X-Forwarded-Encrypted: i=1; AJvYcCWZq3k8SPobAHrsbxkqHoWDKJ7OBXycuT4Bdf1cBNgHG1GVliITwuSQwBLBEenkf1lbT3/kRm0ZGPBiTrrIAs/emrWu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YU2n3eAfk8LQBMN+k4A77AoZSecF+4hR8B0SbNwATTwm+90h
	wwAuStyV5B5kYSFv3KAvQ6P3CVbNpBv3tgMsxT//htXW8QqmZu5JkPBd
X-Gm-Gg: ATEYQzwDletoxWfwJeOCzdFgZWrRq90kzeBFc07XH2eH6EQZoCSoxbPAuC6nr93DJsi
	y8zLJvqiOUZz8f/c1SRmLQuFL1E7vtDSYxgtXNAvaoabEV9fOcwL+9YToN9OQdjIkqWhNL3zxGE
	1g5ltXP6duMM1RkA5Y0vJYgx8q7e4WMaoZxsHDbOcGe22M1hcqPlVvm6Y87jN+vWIpSpTNR+cgz
	f7lbIgNW3uouR7veZZCJa8c7gIwBfAFAW2RMpJGHF5M8n5LauO3u80waZY82HDYYAYltmY/JmHo
	k4ktA6yeX3mzJGAdv6afuJ0Omg62mCaB2IvVI+lUii1sNEhRTmmdeBiHXcsBvSTYScR8GS6dX6r
	gqzpyLDbhIXVNTRv+P0m9Op/mSJnCiSAK/98HY8UNmIFTnBdLXbwtADgxvn6O14TXvd+yZA/23y
	w+tfrGmTkAHwzIsIX/GzLpn4rfua/wqa5Sgqq3L0YXQxWy4XhnrYe5lCFbgPJsiE55lx/cz3SvC
	JEd
X-Received: by 2002:a05:7022:b88:b0:119:e56b:c74a with SMTP id a92af1059eb24-12be647c6demr278483c88.15.1774980733335;
        Tue, 31 Mar 2026 11:12:13 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:12 -0700 (PDT)
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
Subject: [PATCH v6 01/13] platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
Date: Tue, 31 Mar 2026 18:11:56 +0000
Message-ID: <20260331181208.421552-2-derekjohn.clark@gmail.com>
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

Later patches in this series will add additional attribute ID macros.
Keep the fan defines together and permit attribute ID macros to stay
together as well by moving LWMI_FAN_DIV.

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa2b0..caf360b76fc5 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -71,13 +71,13 @@
 #define LWMI_FAN_NR 4
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
 
+#define LWMI_FAN_DIV 100
+
 #define LWMI_ATTR_ID_FAN_RPM(x)						\
 	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
 	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
 	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
 
-#define LWMI_FAN_DIV 100
-
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
-- 
2.53.0

