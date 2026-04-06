Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D066839E17D
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506453; cv=none; b=QtashMlgGk6sN3Y1tbt8aBicyery8pGuD/AxZoB1Amjpek6kSumiA1uu8+KoippiUE/yZsYJilna/ehCUsdUjDO86lneUacwEdNMSMzE6SpPwC4eSEnOXsxcjPxnUrwl/PUfVyPSS+RpzP+i7BBy1TG0bFuYVI/s5JGXYI8PWbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506453; c=relaxed/simple;
	bh=xxnFlZyVLrmrwp1Xx7rKUBbi8dKXcSeqhsmT2hnuuMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Py6o85w/srH4d/YODARaF9WrNUXzfm6FtLYjDUa1dH8idTrykpnsKJAA9MRr70JhflZ8Sgza3A1qeflS3ca2Dr1lCeRptMsoneOSdUXD+PTGZV1NQdN2ukSWtDaNnfwEiUUvo5WvyipYLtJHCLfdR0QIGMmwaOp6aeQMbRWNXgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWNbqlA5; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWNbqlA5"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12bfa7fe691so1578791c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506449; x=1776111249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrqXPLDhLUafZCa8zUH8XiTLuTTy/7459nn79wC3d+c=;
        b=dWNbqlA5lHQkWpPX0MxJNmZlbUruDjG1ice7WxH2MlESR3xcpQyPIMBQ8nPhxUdHPv
         d+XaA2ZCG4APHWxTyozvgu0ESoDcnNMh8suBay7e0lurjjAj39WalZuIjuDnsRPPVCSo
         dL/AXsTYJYKWepPEmsmAAThe9cI3ftCFicFzFWQtaoHymY+JohjsvvUudxAfswtzY2PY
         5IUvtpzx86A0rTkaiLgPuNu70IbmSt63uYtl1bFs9UFdOjPsDam+pu/dR6j1kLWDZ0aS
         56MP9julvTNreN19VWnA5pxWT4HWACD3cEiWOkLOxk1JXNTSeJnpgKWmWq2fVgaiqAjq
         J7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506449; x=1776111249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrqXPLDhLUafZCa8zUH8XiTLuTTy/7459nn79wC3d+c=;
        b=PX/mtZgj2pmxR/670XQDRkaxWjRi6Q+iF25omqYSRPDuyguXS6EBV5X3Ci4kWrWt8K
         tsFs/H4VTJc5mfo5Nr7MgRtvqDfn1ylEiOfV+RvqJs5k5mbSAwpdpLXelYtUatInX/pZ
         TzsWY+cwoIWBDb5F4gQUAoVMeXTE5Df/oDNYZPss05yV0sPMuZXhN9SMnWFAxVKrZBKL
         zz6rEkXdzclVyRtmuiF9OmhiIfWOSiG3l8iO+ujug4i0mr/Q4F6t9Aqch5TLMfeQAn2Z
         gDoaT51O1q04HooL5OBhQOJATfxRrszxpd+BwKd9cEKpcFqscUwJhDa4pEeQzJG0UlSa
         EEfA==
X-Forwarded-Encrypted: i=1; AJvYcCUVbSet4M7evncKu4EflDunmXoL7Y0fBvrYBnfINZb+O3hPUMVzLEptsx/whAI0X5HyyTTEYaICzSa7OLWLO40464VK@vger.kernel.org
X-Gm-Message-State: AOJu0YyUQHECM5pJ5s9EnSjBtBpQgIomAO+uNvEoNi1X4+DAdjpzf+Cm
	iP3P7ZzEYOi78tPbuzisewL72eS77m3qec3+YSwyCwVkKMej2RpGZkAN
X-Gm-Gg: AeBDievuzhny5LKALIA5nKUyNbBqQubYLkwoJ8P69iXswtieOtyv5Ivv5LdpKagaFyT
	WYpIN6saZoj2sx4vVcKS47Tr6fScphVagNtzMvdOwU/jJfAYpGOkZ5YoxTo/Hy0mLljO3UpqEdc
	aEmdc5isdnqq0MhWq55yX2f9IcDArW8/oqROx0lIdt809FsVcmLi6KK5uUMLd5yRgmC7Zb0ee2l
	THyCv0LVwJ5E6Ohnct1slYPCzjQfEy6m9EvBKiy2vixG3PBsW3NOCT3PqcygnM0eOvuTiBHuNXJ
	9h01H9Q+MI8ZfTRUskXGgPNTwzOJDah23MawXz8AHUAlSHHvC5rUCrBz4zXj528WG+9P2p+Fjyr
	9ZzcNoW+OVsVeZomtIU2B2SyI1E+yUJu36gcWde5ewMCR6wahbOAVP2TWH4Svz+yoZpgOZ8IFGD
	s2CnEssdj3pwmVZ0axYmuMmjc72QoWsakxnr9XgOo9ONyEXZPi3Or/+ukxYmSUDbFsHEtruv3r2
	KtB
X-Received: by 2002:a05:7022:b98:b0:12b:ec67:3529 with SMTP id a92af1059eb24-12bfb703676mr7335982c88.14.1775506449515;
        Mon, 06 Apr 2026 13:14:09 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:09 -0700 (PDT)
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
Subject: [PATCH v8 09/16] platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
Date: Mon,  6 Apr 2026 20:13:53 +0000
Message-ID: <20260406201400.438221-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
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
index e475d1d8a5a7..25ddfd54f692 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -68,13 +68,13 @@
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

