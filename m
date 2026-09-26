Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECF4A2609
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790456667; cv=none; b=ePk4ChAKDMm53U0Vb+wJKAlEysHJKTsvp3n/bx19Aa//mP3vswed4e3yNm0Zxd+muZD2m2zpApCQpt1onA7nOfsMLtDbJJXrGYhGejbKPavuuVRlgQb/B4kilNyXntpULSHY2Q1mDFKcvFivzOogb2WQX105Ep7WC0Ongm8Ul3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790456667; c=relaxed/simple;
	bh=+bJ/0xgrR6IyXdW1PrHwallq2F6/vZBV5HqvnJdLVA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kd/jxv2csa4sQvTb02qfYwfnpuRR1Uid0fxZPlx8piWii+VsR+ZVKpr1Ht3KYaARckAlXdFn0CR3/jR6fzctFaoSKIK7hTAH3WEd4QofOVgLYfDxhSoPYB/AtKTMiyFm9L8jd5QQo0REMe7Qx/uQipWjoGPw/CBmLoQyp90pfRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+HS8Dif; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+HS8Dif"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144fa6e60bcso64547c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790456664; x=1791061464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbJiVKrqsrKfv2wmyQ+2gcMAcTpPklQb6GMKdaTstRg=;
        b=d+HS8DifsEIpMqispsCZmV7I8JByAFh85bOIC/PsfwyvBU70JF0zESyr2kmU44q362
         6rEwSrYUSo0xWylrKPOhuXEtI3n03xldYsNTWH4aEzqxLXCoF16cC0DQFQgbFNHEOfTO
         Yb7jcjfjMB87Q/1rtLQzpc2jdwaBNoVyrn2B1Ws0oJuYTkQbwLHUK5pklTNyCEPuPv2c
         iVD2CQQRi7f5kLQrc1JwQi4xqE6tvpmKZ/g+fcNhQViv1KFo7lV1A9XCfjBJJ6PQNLur
         hdMwQb10hgKyeYCuwiXZybRtM8QlN8ceQIV5iUbMj5nrB8h5aDeOCNtL3IZNIxTgDOM8
         1MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790456664; x=1791061464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbJiVKrqsrKfv2wmyQ+2gcMAcTpPklQb6GMKdaTstRg=;
        b=bLYoPX+mj2XT3FmYojFgTq4wt1itfVdoRtzwEytpak17WcjjyUPTeNx4nvQQO730RA
         htRGIk8jWYd1fUaCy915T9FyK+v3YtcaDLbYa6IY6FPGfGNXwOCXi7WE59N1S3LS0PwW
         a0VZO+7/aTv9m6o2Kk02OLxVMzNqmtBGJsgngjJTUS2K3rlkC9duzh4UPEnHxJ+u6Yk/
         EkQGHFn/dPxZrr0ThhQafDpz2Cxb8T77Wz+CagHaz8qX6WyEeTKK7cEJYvc0p2s3BI0o
         fr/zxZZ3KLaFFWSwULl7J5ekWZE4uyot2ciOOJool7CG6oV9FGEpXPN3OwFgZfX7BL5x
         bBZA==
X-Forwarded-Encrypted: i=1; AKwUvBwVpzOokP6sV8sjxeuOire8wL6gWye9fMAwqhkjEJkbj62ioGIH7xE+ll9+Of++41k5MLSFCNLCKThN0c6rG+m7PAPU@vger.kernel.org
X-Gm-Message-State: AFuF++kkhB1lXmp0ssnn5md6ErwPBdvsMBPtMoZM0/pAWldSCUbNxqqF
	oht2GL4vorTOIJhgecAaef77bchLYIqQHJXw/kD40kCD84q91XO9HOtw
X-Gm-Gg: AYBFou2uKXXz+7IOrwIbAFOBy8SMv3A/QmtxARIF537tJBK4MYcHbRRmMetTC5XL6rN
	atLzqC/4FxuEJUMFjop84o9TdCMvhT8pp/3GTq9ynrOQ52RpgJ4d6kzL4BIeGBEErb099HYh7JR
	D39o/wnzhvVm6Jas0u0zCly6giRXRGcTRysEfOl35wL0LsEqaANveJb9+V4odHUpVL3ilA4L2WN
	CXg/FV6981XsYq9JVW2F2kGUZqPbKEVALuVsesJzvqMcO+DYdseX4QwG5rCor0+zWoPTfitLmTk
	7VIWfA9mWpabchHCBBYwCyR6kY7mlAu77Q4AYqSwktqVAbfmPhM0+ZC6itT8n7TSNaRdvFJAJ7h
	1oglOSPsnB+yffWgzt7cuNOSstFjxj6YusZqkK9qyB1t6xGnM/10kiezim8nbshQCMfd/utJvu9
	gE6CL1wgTUQaysxotTaL+9D0A5uMLhWadb6YIAF/6PYZ0hGywLIzGcjOAQvqBzRDWMBIipQYaaO
	vkJQCIuzOv98YmgdWJWLF3wzMVIIzYj2pPxs+tY/0Xj9l3aPTz2XMExpDmq7cb2bk7F0tCCY/Xk
	Y0QAAoYBTcJrUqZ4GiXiva65soHI
X-Received: by 2002:a05:7022:1504:b0:143:858d:fb0e with SMTP id a92af1059eb24-146caf2aafcmr7364687c88.0.1790456663272;
        Sat, 26 Sep 2026 14:04:23 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm17435185c88.12.2026.09.26.14.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:04:22 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Charles <hanker007@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}: Improve robustness on buggy firmware
Date: Sun, 27 Sep 2026 02:34:15 +0530
Message-ID: <20260926210415.3465939-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). Neither mainline
nor the series binds here. This firmware has no
LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
registers for that match and lwmi_om_master_bind() never runs. Skipping
the match for GUIDs the firmware doesn't declare fixes it:

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 805e36ef7..d64520be1 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -76,11 +76,13 @@ enum lwmi_cd_type {
 #define LWMI_CD_TABLE_ITEM(_type)		\
 	[_type] = {				\
 		.name = #_type,			\
+		.guid = _type##_GUID,		\
 		.type = _type,			\
 	}
 
 static const struct lwmi_cd_info {
 	const char *name;
+	const char *guid;
 	enum lwmi_cd_type type;
 } lwmi_cd_table[] = {
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
@@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *master, struct component_match **match
 		if (lwmi_cd_table[i].type == LENOVO_FAN_TEST_DATA)
 			continue;
 
+		/*
+		 * Some firmware does not declare every capdata GUID at all, in
+		 * which case no component would ever register for it and the
+		 * master could never bind.
+		 */
+		if (!wmi_has_guid(lwmi_cd_table[i].guid))
+			continue;
+
 		component_match_add(master, matchptr, lwmi_cd_match,
 				    (void *)&lwmi_cd_table[i].type);
 		if (IS_ERR(*matchptr))
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index e6c8f6bcf..b196e9926 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -1704,6 +1704,8 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
 	lwmi_cd_match_add_all(&wdev->dev, &master_match);
 	if (IS_ERR(master_match))
 		return PTR_ERR(master_match);
+	if (!master_match)
+		return -ENODEV;
 
 	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
 					       master_match);

With that on top (built out of tree against 7.2.5), lenovo_wmi_other
binds and exposes fan1 and fan4 (min 1500/1800, max 5100/5400, input
matching the EC tach fields). fanX_target pins both fans, 0 hands them
back to the firmware curve, and out-of-range writes get -EINVAL. With
the change above:

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
