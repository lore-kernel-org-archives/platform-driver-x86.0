Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF92477998
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177129; cv=none; b=DhF9vEICgbEcmSwzfqhvruW8KF6/fysF64NJZfMZGjWNVuzN6BCuiz+QOCHdkZ6aRaZGRZlO1Gm7gXmMzQUn2GP99llfjnXcXeBxkN7i3KtjLrYJ2/J0ScTEJo5LiwHtlHUgJ9TxuzvzXrG2E2IWEL9eW9y5+naFjO4IT9t5VvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177129; c=relaxed/simple;
	bh=NlwwelYA8uSHgqW88Xvl+l0Vc3NtEotDqvYvC1ZDl1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iczz7MYPpOiKUXKtpPEqDLWDxHjseuWWwSBwq4JGgae2aL1u5Rh7cxi7f+vayIxurLwuRt/SNb3aZYDmlgFgaTNiq+q/E9UQdwDz9jyhdOnWcDnHx8yeXLYvfzFo0KGCa5HXI2ij3v4WedGBiVSO51U8KJthfC9bVGZzm+vJuSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9Aon4zs; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9Aon4zs"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f3c623322bso1941671eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177127; x=1778781927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LD0U2JI3+b32qBu6y4JGUu0pIw+boTDqwL9bnMsDgY=;
        b=H9Aon4zsayzzgHkCSp+c2talcKOMl7cpNnKXFJoYoywEbMXnCTINJ7Z6EWhibseHKK
         EC0iG24VUt6jlyDGvCWS4tdqsG/EYszn6aJj7N/KxnZOFoJZ19r072ahlc9A04kzCgvR
         lqQW2vUfsdRhcPWW/kcqYgf7VzDwpYbzowmnmdRD6WpAI0UzJ2VQ/C975TxfR/iBSqzq
         cKFHNxLSIkkFpLpteB/gWVauApQA3LbJv5h3huSUccdlJ4Lmbegicmj/ZpvZ97CgIt3K
         I0rU0g+m1AZamLfAqY8hEXtKfpu+LfiYoGW8Mcnkx2EwoAH5yZk5NKrdJXqoAjnnL683
         6EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177127; x=1778781927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LD0U2JI3+b32qBu6y4JGUu0pIw+boTDqwL9bnMsDgY=;
        b=cOeC43sSNzOCQQxaNz5GgJjqfOKy+gju4zG7SHGi14fBWEZMvFeByL8hJppqnz5Zqs
         eDMGZ77l52x8S7Gdbj0v4IAbEaxJKoBKGygrXukMnP6SqwHI05i5EBfufeuyCkkVBg3Q
         NYXB/nl+TfmgXCDap8gxE0wvJnRs7K2NWFOQkghULTH4xdVc/Bebf/fx/1M2RrKIU6O1
         03XtjB2YhinVZQe6pbJVPaWC1T3Zo7+/IW22V6olOB28DcO0/3gE9i8MPfeK81E+2Jjz
         Lt9x8WKybezk6cqg/zSAFVZAj9qWmAxtcPPFs9n+eM6wzZzBweo4bx4z2td/UQhNwDxw
         HERg==
X-Forwarded-Encrypted: i=1; AFNElJ/rzkeMFKf6F/m862MCQjOHP6NEHlnt5S58rjM6/Qx11b69DuDfWiWKzI5yo7cZUUNcMZFfelpOIha3L255YFGMd01h@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgTH3GM5Xpuaj5booz1nmj/a8IBvQ6w1e6EjiV6WZIqagXCa/
	HQGcMiN/s1VIKNcBBO92BMxQauS80P3gx7MBnHPLLrCAHJ/jSGZrFIIP
X-Gm-Gg: Acq92OHMGb5NzTeSiEbxfVv3KTx7Ocwrqqmnufo5u3GI2Yoju43XQZBJHCeTJKQW62F
	GjVbTqgDho6xfgV2A09Gtgvb/U89ly8LskMfQSdXJSO8+rad7ov9g++2jXK494x1ajjun97u2o+
	0P5B/R9T3ECRyHmBVN19uYOkErutSVObbcIt47d8pHDFcM+OZgAr3H+gsuSQtFBb/KTE0aduJXU
	dvXniRA6XKLfL6JSmZ4lD+FlaFzI9+9JlOYcmLBTKp/rAGM+mMIqqZoXqLtlFfTXpQ9RWAUXAI1
	NNBcqm0aerFmJiQqHs88N7n31l6g5e+gIe8o2QQg+glbB7oFZGgHqtvUwNWsgFzukpQDueELTjh
	LuSnzc9WPmpy2R4c7Y0FOw5pTmIA8Rf7NWDwcgQsIuCdHu1vAxI2XwNpmHtUBgnJW0qk9tBWFbA
	TD4CDKcvvwvdv2O0ExpanS/gcMetakG3SlG1YzDXZ2m08F/7bFjw6HVX107YbDdrfUxGa2N/UMi
	utjx1I8/zCYgrg=
X-Received: by 2002:a05:7300:ac82:b0:2ea:5057:a31d with SMTP id 5a478bee46e88-2f54ad72b1cmr4708213eec.1.1778177125292;
        Thu, 07 May 2026 11:05:25 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:25 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v11 05/15] platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Thu,  7 May 2026 18:04:57 +0000
Message-ID: <20260507180507.912966-6-derekjohn.clark@gmail.com>
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

