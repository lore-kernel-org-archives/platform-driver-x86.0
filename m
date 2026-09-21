Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD23128AB
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 02:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957281; cv=none; b=l5lBCSf9H20Og1EjKCWurYLDyzr7bwqZ3Fxg8iANQem2CDoo7aqjx7jcMQv+egNkZsMQjZxmmGg4I+57agbRhekebnfDvyZzczFAVWR/XmzA5GLwoKb0qitEqI67S4Q0xxavwPzAKc8/Xa0ZbqvLIEJ02kfVNfttXcUMVXK0xd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957281; c=relaxed/simple;
	bh=Av2GYvdleMYioKNHbuGmN6mnJbgyWi2BjHDtp6yomiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKGOZRVRN9frTvMu7zHNvTKKHIf8pAZJCeKHv76BAs32C21dWhaYzIUK0PwB+NFu3ZrjqsUuLhb1WgWlDtFZliG5SFCqM4xl2BCtRGf4H5JNYTALuKit+4xgwHSd04rgptH1oDlbRwRVr+7wlgIUVmkOVLOMvtfQ3rTJ06tJr80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLTXpoZC; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLTXpoZC"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cadeb0so200703785a.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 19:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957279; x=1790562079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+LWZyHJvmzCBfQ/7nfECvX2BnZvzVstEnA6IU3FlQ8=;
        b=iLTXpoZC70h5g83hGB0RpMSEXeuWcGRitdUyJU5FMXkk0838EqxIOoAYm2LXWAOts3
         0Ez4f8/Npiws5xlW3XK1uId02pAPOAt9kG3kSQVhBZYaHifeeU6Wiq0Zc+G08vftGNgg
         qLQuoIDAP5VGv7ucfGQ92N4urHeyxSj7undNI3r7mC3Glw6p/+Vz3olheRcsC50/z4B3
         HHV7ank6FIMSw2rv5Hj9Xg7mdizZgt4kaonyOCTTRQQQ9cS0MPpwoJynKYaZB9wCHByu
         JH77Ixp5vdGbWF2crBdhhXOHQJH2GGgfxHQF3Zcm3rLSayTnBnSYhzvi2hRbl4nlztMl
         6+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957279; x=1790562079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+LWZyHJvmzCBfQ/7nfECvX2BnZvzVstEnA6IU3FlQ8=;
        b=m60wRWqnA7+m7c7csIioDzGiiDxJhkeNW/Qqogu3mc7M/vke4JOx8CxTrfxVkzbHZX
         bGW69xJ7H+0KoJAyDYDlBJzUg/pats4hHGkE3/hskJ62aBDwVI09uGJuWUBgTx6V7TMh
         /c2oky5sUI5uvSkkTpNFpfBVyHlDsXX5AcSIrnYFLyqcljC1zJg8pT5841qUAoJXODkK
         teY1ylKba3R5kHEqltX11pieM/dRgm/eEnn2au/gsWbWD5ygtIh6OkqCPfLSlLs5S7qA
         XFPP1RXeQzHABF9nW8JVPNvTDu8o1aEzNOtyeIOjXuyCflGLJwoIodma7der/w4ENsPS
         6UZg==
X-Forwarded-Encrypted: i=1; AKwUvByRz67in+qw2F8JTQPNlM4wV5IYen5+5lomENdyUec6nC5VxwkP1Rg816G10gtgdQPiWc3Ee+XtoNjCO7Elp7v2Sqlw@vger.kernel.org
X-Gm-Message-State: AFuF++kODEDIz7c506NK/fYPMDpRPhKeBr7uZvN6YDedoocgGB3W9vDm
	/rEbUILZ9GajZOdqsJ70n45yEscW894VjtCJV2AhmQCuqfxTmYB3aqA=
X-Gm-Gg: AYBFou07jh7aPQSJlMCQCiaLzg4J3CvSag5iNxHMOtrTyir/BTnZipxWHH3FcfTGVFK
	1gaVtZN4QvBqokNmnCWPnhi29wxeDc6n4T6apvg8JDR25/guR2nhlxaKaMqrMuVO4zgGxYLFTCp
	BOhIlyDN1Mu3rb6sRkbgl6TZpZhdOq/CbwQ6y+dHVSUedStl/EA5AtpOuUiKIcqc78cX56rux40
	CPfvL73F2q4hqM4+c5Y2QMYuFnb5Gu2GhDMnLaqP82lvkM5HDe0KedZ0578HyJ7M6jdot+TPze1
	GMHmtz1PNFhfPRnKEZKqsyUZ2VVgKhKiC/Dbpof4KVmCyYHjeR/kifB/4/a2mN8GHQiKGYTTAay
	MEiKJsm28kW9stGdDkCueHu5ZjTyMFz2tIxASBlY160r5kPamsLTEyVGunHnFobYspWLdOO5bkq
	hitIbggDg+wp4mhRR6BeBjORXboDNFBVLgWCfFlhvBPyLWMFW3jdmM1w8WxRoolxf/ZUwwUK8+g
	sBCJZP8r0Zj0H+2m5HbBGjEQWR2GT2n5/8FsQI6G1+nvC6kyiFJ39bcyHpLmeL9/lfq5DiVGPlL
	mJZvNxWi8QrO5tjf5/Zn5/UfbD7Ju883J4tBGA==
X-Received: by 2002:a05:620a:8008:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bf5519eaamr801975785a.6.1789957278978;
        Sun, 20 Sep 2026 19:21:18 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bf0215773sm496204385a.6.2026.09.20.19.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:21:18 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	jlee@suse.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: W_Armin@gmx.de,
	krishna.chomal108@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v2 3/3] platform/x86: hp-wmi: Remove unused platform_profile_support variable
Date: Sun, 20 Sep 2026 22:20:01 -0400
Message-ID: <20260921022001.6020-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921021720.5976-1-justinyvar@gmail.com>
References: <20260921021720.5976-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_profile_support variable is assigned during platform
profile setup but is never read anywhere in the driver. Remove it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 7ab81ce5f8d..1f165e8e1a4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -556,7 +556,6 @@ static struct platform_device *hp_wmi_platform_dev;
 static struct device *platform_profile_device;
 static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
-static bool platform_profile_support;
 static bool zero_insize_support;
 
 static struct rfkill *wifi_rfkill;
@@ -2531,7 +2530,6 @@ static int thermal_profile_setup(struct platform_device *device)
 		return PTR_ERR(platform_profile_device);
 
 	pr_info("Registered as platform profile handler\n");
-	platform_profile_support = true;
 
 	return 0;
 }
-- 
2.47.3

