Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE013B8D78
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924624; cv=none; b=VBGkHSrD5IMBB2aTHmV+zEdd/cxvcWUv6efGJ9hyWyQfdXIlevOPuPdpJHMtt0jtg+YAnVp1/ClsPSOAwvuy0GU10XgOLCeckQsUqGy+6HbnztwsgrwrFVxu1s1qLKngjTy09xi2CFQ+RTF/zcwdYsckxiY2tv6KinoIE8+4zbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924624; c=relaxed/simple;
	bh=NlwwelYA8uSHgqW88Xvl+l0Vc3NtEotDqvYvC1ZDl1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgP/B+gKwE+ES5BbgWvNbxebUChleTeMEIijSpFvOe3MM+Z7jD7vymBjhsV1IapPeRz/wRGa9pTgDuR7GR58Zl8ipYUxZIJHFV1fFpZJbShiSedTfXW3equTiiLm+EuR2ygamCZjGE7flc9ebOib1S3lZSrJSnsBLXukoRWJmO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXsOSalR; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXsOSalR"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c156c4a9efso4348207eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924622; x=1776529422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LD0U2JI3+b32qBu6y4JGUu0pIw+boTDqwL9bnMsDgY=;
        b=cXsOSalR/AtZARKLCtogxlzY9wPrC4paojkBgAO03RvRgMgHfqKmcfM5X7pz1elX8r
         J1w0LLATrKa9OuP1VudKHingH2xdbQKEXqNCeOV4UgRi7ClUI+ldfxRQzSHMLgvPSYj9
         Feh9SyJI60es/WLQbr3PHzKJVGbQcVwm+DOI15e53QUuz8hlvamRumrhXgt4vr1zPs5m
         uugBq4BLlY1XkBq1oUWu+UpK0uqbsBWZZ9yfiZ6J6jrfCF0qgyd8djD+XDzqc6IZxokj
         lbJRwu/VSwkAOtmDqNh0I+LEMj1wASiD5qL5JuO9VhSJ3Ge5C5rLvPXHeMLspEhWm0HZ
         sY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924622; x=1776529422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LD0U2JI3+b32qBu6y4JGUu0pIw+boTDqwL9bnMsDgY=;
        b=BaaKVDCZM2ShpZXDedv3fjusi/czyyWOqdbJK226PPKFJEfJK5Fb7wPdMJUx8lFGEr
         VQilylNtVZEig3zNADxzAsW//wGOKKOPqY6mdBtzL1FcwMZdP1k4vFEwbWZy9Xr2U/BS
         sE5GeCWl8r/oMMr8CIw1msFqUiME9OXAOQ2rsoCAmsrTgJzxKnVwrqjh0iBdRcuLWMt8
         yRPY9flsdoPSCew2AW+rTiejkpiXiFhDB3ljHE8FowHfi/elM10mag2Mnvx3lRWSipa9
         hd5JXKH+XVXDQX0U/Me1aPXxug2vPfwCUnE1RPmVoIzXPOgxU1uxrxokfSZeb/r/Yu/0
         pHlA==
X-Forwarded-Encrypted: i=1; AJvYcCUFTyZhqwZGVpWXb4syRQELkT7JtHL8TW40LIJlGlHI1879TWNmLW53UecjHdye98LmDYRUxqMlaiQni2rG978zbMOG@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+xrJTG1Fp+l8reZOGsHxqlnzhHZqxwpUWb234ScF31HfSyTd
	SmflOXfTydtwBhDpctrSkX02Xu/jgOZBDw0Dl1J8aA93yFDjOVhVPN/L
X-Gm-Gg: AeBDiet8prRzlDaumlVksykZvHcpE4bZS8vBJmaP5MOZJi7GK4/pJzlGWe7VCgc79CV
	w/moBMoMUmUHDTxCOtwMjxHultkuhFfbZ2n5lrvlcMdaN40KY8y83Bkhd8IcZ5w7uZ8fRLSXX0P
	8jLyEWBpgbbyutclfB/AjhOYsxK3d2QL1Dk0zLjl88yjbrIHjcE3gGNzqWEyWF8cBbHFW2Fh5v5
	1pQLHX1CYjiTALJIaS4ccakqAbUIlXBqDdNb+fSKYbw+sPPk+wMMbyewNbii5fISisyLFg1mAgv
	FDeilIJaJlS7V1XwgRsZ9ANUMMw/yOezYI/du0XCPut9y6sWmI0Xou8+q/ry9mxLEP9iVWL1U6o
	JzVUAdWAvr9v63dFik3ZcJWGIyWVyDIYFoHqtHcldSxs7u1rqWBj6jQa/vSGNxu2iuwb53HnpQj
	qDGylsiEf+Qy15MqqSSIBD5oF17YcvgzK6tCP0GkAgdOkC2Rh7547V+EEchHYNOOvxHtiY0p/qA
	764
X-Received: by 2002:a05:7300:d704:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2d5890795cfmr4238650eec.14.1775924621592;
        Sat, 11 Apr 2026 09:23:41 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:41 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v9 05/16] platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Sat, 11 Apr 2026 16:23:23 +0000
Message-ID: <20260411162334.25682-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In struct tunable_attr_01 the capdata pointer is unused and the size of
the id members is u32 when it should be u8. Fix these prior to adding
additional members.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: e1a5fe662b59 ("platform/x86: Add Lenovo Capability Data 01 WMI Driver")
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 1e06b894cfcc..50a03f5fd6ab 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -546,11 +546,10 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct capdata01 *capdata;
 	struct device *dev;
-	u32 feature_id;
-	u32 device_id;
-	u32 type_id;
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
-- 
2.53.0

