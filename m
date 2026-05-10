Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16A2D3EC1
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387164; cv=none; b=Efhhjf+f/oYnFlL5LqW5D3iIgXcxOEwll9cj9HY8sq5Nv0BQP9Yw25B7XDgYXFYouTtWNGj3Nxe9TXhCUwjGMo/+WR+GwzekQ3e85Vgaalwa/H/40v26Kfif0+TQEGo1SGxHwempuGSIoPhOUB8UNufG2544SLp8SXioKgbVo2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387164; c=relaxed/simple;
	bh=caZqlTRKqQF3IqrYehKOwh1MDmByNafnSmvdeaDjblg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1KkH7QPYQXvP2b8jcZgPX8aDdgkdeZNENn0WaIT6gHEc7QdIqlfi/Vbk/o/5xd/3KfN5twQTBio34qP1Rd7I1AuIJ2gFahCdrBaroM3qjn1yKR4UlniQadh/Oj/SDuuTk68i4zT8zoJt4/AA7QzduBWnx2mwFFq5qZqxUTNrHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZPiMvMJ; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZPiMvMJ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f68f3b075fso3369254eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387160; x=1778991960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZTffhfk4dyzIVwn7drdzYjvOglnYeXnZo5zKEHkWWI=;
        b=XZPiMvMJiOatXEOAVW5biQlN/HGrv3rzbdClpigE7oDr+cgSBYIHvyrRS9aQA1thoG
         z3apowNz1eGlLTlUAJtkGxGcAgXZYjDsEvIdf0jtb92gWxaTE5NVIcQsmpd6EdZFZGFJ
         aL8oxDjjLZ+HH0Qhw0y7laUuS4C1X+rPdNoXMmY14DFZVUGnQUHo61jNk7JJyKr7Ktp9
         hMTBvs3H6WUeKmP3ZF6rUDwj1fav7zbscFi4UzHl1DKKGOdaSkAElLMUQl1avq/mKRaB
         GvdG3okZYnnokzY8G94pLs0KYxAKg3+hMzNkbJ4GLtmy8fd/viDKnY/HXAuT7Kv2kf9S
         nfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387160; x=1778991960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZTffhfk4dyzIVwn7drdzYjvOglnYeXnZo5zKEHkWWI=;
        b=Me84YYHiEGK9tL3Xr+cUZGr5/6j0o8eH6e2aE/UPTQ783MqE/8EHsBRYmYmqvtSQ1Q
         w9Ec2QmGVqVO/ROSeYReWOJW8VEoKgjH+oyEgWMbomQbU04RI9Xh4/+ubfbOW0kvdbSs
         YlQDwtn1ydS1G4/bKQrgUsvsNuk67k0RNFInHQPhzNQaDYkFg8TqTodEOAbX6vtKV6xC
         K6yvspBYLujzYGdS7h8HtuQGOMAYUVbiWBrA7v4Udm5aIszxnzwESC9TsINXXmd/a1Pu
         lEgdjL5Gxd+E25QbDW9ndCMYB+vA9h3r7bmR+w57KvBiHOnD3Z/VX27Of2kgjTCT8X6f
         Ifzw==
X-Forwarded-Encrypted: i=1; AFNElJ+6GNmyZpqlTsTFJPFwRdbo+cwc9ljAkWwrC96SBGLgm5NndflM32YiyYfBnXDVIVUDtQo5A7UvbqiL6IQls0o+CXgQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIjkO3b8RIOiQbVT7k06s+ID3M5ViQacsKW1HViRvGujSg9n+i
	wYEHCLolCvxAbUAwtSxVOnADo/iO5A6kSYzGapeY7MZypmRihPn4Lbnd
X-Gm-Gg: Acq92OFdnSFn6o+ICpFHUBBpzFzX3a1m57SyyPYY/K7Tei9X/7h9C1UlVwGjluwvrIy
	ROkeFFypZNKcbirWLZq3djB6Rw5T8HsVh3islSuHyp0uAV9AQqDGXV2Rq4+zhztqcBFP5hw1HLR
	wUuQBBsuUgyUrH/GQ/33sEYTors3DgWOku1aSpGuKexXsAxM0Ta1hmQOvDvSiN91zQIEBIv1UD9
	UUBdzdduLh84zv1snS6PslNC4V0mDVktZZlqiM5Mqy9CarerLMfSsUmmcWccdxmNYq+g0F49itN
	SUwpGDsiiHBly6tHKuwEP7LnBBMtM/S6CWZ9dO6R2cgLY3HX0RdLMI4g5+WE0HPWs9z9/spDWXK
	dFXxZ5CIG/11u0CrZbZZxtc6TOKOiu2JsAPerR1jxACMmnUp772DQgEX1f4lyMBcPMBAnsFFtom
	ABCC4LWt4UAvVFUdUSvPk9NV0amEDnu9uoYrq7G3Ea8c6S/Hcbcw/orVAbdRakcTHVL05OgnmSn
	1IHXmnlJfBeO+Y=
X-Received: by 2002:a05:7300:8187:b0:2ed:e16:6b4c with SMTP id 5a478bee46e88-2f85ea2ad44mr4633106eec.34.1778387159492;
        Sat, 09 May 2026 21:25:59 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:59 -0700 (PDT)
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
Subject: [PATCH v12 12/16] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Sun, 10 May 2026 04:25:42 +0000
Message-ID: <20260510042546.436874-13-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
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
index d31af69433aa..1cd2bb5244d2 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -92,7 +92,7 @@ enum lwmi_feature_id_gpu {
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static DEFINE_IDA(lwmi_om_ida);
@@ -1136,8 +1136,7 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
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

