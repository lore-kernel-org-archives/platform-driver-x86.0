Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317432E7623
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Sep 2026 13:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788699743; cv=none; b=QdOBRr8ekjOLOU28ZVywJKxIuCQAHzkDwZnP5sjmM94QqZQiX9n9LKHlLL5KesWzPkBhAIiGHgj4/8zesesZGlahx0TAUqgGuaZmUcuccy0MgY1kwPM1iRjKZc5IgIv38KEQcshOhBtQlS8ItQrs/jlNUVsjsx27tpcVeRwulAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788699743; c=relaxed/simple;
	bh=RrI6MtDCIkcltjXaNN4mNZn6ncCB0ceF56gfjlC9bnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tU5McReeSbvPi+mLUfl9vHySe8k4eaewOJkX+YQnpuq8yg0LRzjwKvVpcIGfeyLyFCWWpOR1JJMt6/oT8uxpK3tlmy+YwVmLM/9VOIIhgvVrUPhEVoxzO5DloHVfY4TqIjzGc6x1qSiBFDuHvaL6IWsOC3OTzxjh0c22oE0WZck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5bGOlPq; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5bGOlPq"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6aca0f482e5so3009080eaf.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Sep 2026 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788699741; x=1789304541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=au4droETgUKRuwwak8AA/pNCrylvPB6ysnMHFnxygYs=;
        b=W5bGOlPqnRatkmv5UmD3tWXgqVVEq2vcJ0gKJW5lJvZptM0U93l+evdDOEC0l+AuCC
         vKiM7W0XxXxC8qy2X31rAP80u4Ki/9ntDq+gY8BMBOpVgNbFsRUaYIuJwmykflDuu6Ko
         SGQtIRVoXwjfWWC7eRSq3QjhpnZ5BIYKT+zM+4egisgT8n3Js+TKt4RYMw41zY4f9H0e
         cT2t5sx/AAjtg1JMxuSsHVM65D1Uh6cZVhQ4+LAMupdLdQFwIjvntJcB+9Q1OYaxf9+k
         ge2SnaaSEp1SWJ3o0p8sPwNxiNM+SMaEiU+ZLE/5/x1VCnnVJBAM9UmUfilnbFpHMu/F
         UuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788699741; x=1789304541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=au4droETgUKRuwwak8AA/pNCrylvPB6ysnMHFnxygYs=;
        b=j6s9tl+Xe0RS3jkLO8MskEtizg32ckNrZKNVROn6R24Vm+iqd5Cq04k5hOkkbYvsPi
         GRAQ11uRFC8tPUlJPIMHaAtK/3ic/dJb0I0+upSI41sWE+3jS68rV8H187iylyVcxrVx
         FC/6zTdJy06TOh6IjaC9GyuBGa7tTOtluUZvkNUl8wIgzDwPofW5C82F5y/VmBzGKlX5
         emqjHf8QeMeKGVh35a/3x9fAsl6CidVv+i386mawrp3D+mTQCbHggTaiBS3QKyGk62hx
         87jzsgGIFqYySgzvCGSt9EaWVcsiK05/67v+VLtByOJzabKmeHJkIc82bW2ig+hW4yZj
         tv7w==
X-Forwarded-Encrypted: i=1; AKwUvBynm3lpVv+KmSQaJ7VLKKcBbGlwetjwlsLvbxH05kgAoqQNViTQgb/2Z5LbTBgG75kruOGumm7pNdVffOujqJFeC1mj@vger.kernel.org
X-Gm-Message-State: AFuF++mJSsTNKHqgInjn75sLGXZHfE3VgdyCt3t077yGLxEuGgQmrh2J
	CxnJf4/K+H6Cy1MYUAsGh4b8uMNRXV9C7v22OnXnhl1Uon19nG7bqyw8
X-Gm-Gg: AYBFou2JgicCnyaGDNUeA1Taub2S5FNLgwm2IIuaj7PIkm+WltC17cdKSVu26tdtw2Z
	rVv3P8fJEQ/6kvBezUGZ3Aj8/5WDzKn8intq0HSkaWheEXJvm0rVu0UbN2ni1qPagK1PqzpyBA4
	hzc+edJ6wY1IKF8Ae1/NImDIWsCA0bVR1ZnE5I6ecHyB0kYwmr6kyU555pEgx6jIbReHrtz6iID
	6B7kgTp3O5r6Le7AViOqiqaSskPxEFAk93HDL7Q5JFvGiIy03H0/1LXAGp76fP7RsRzbEiNTEeT
	8tWNle2lTSBJGWQiSWWQZeVxkdd2zTthrwlVHTkYkvPBwIl11RFg4Rc+T4MHtb71C4xd7Rg8apL
	MXxin8yaOSsiXhN5zZAukWAvgnqVAZyffA40mG6mbxNz+FruZqnmo5Xcv2Uo5Ltd7gNk5gCJwo6
	7C6wRlG9lQud4M4G8D7qrzXQ/Wbk5M/JMFGdc/ctktLUD2ynprByG/rzNF5fAlPFJpKASf
X-Received: by 2002:a05:6820:818e:b0:6b7:8415:d78e with SMTP id 006d021491bc7-6b78415d959mr8011300eaf.57.1788699740966;
        Sun, 06 Sep 2026 06:02:20 -0700 (PDT)
Received: from Omen-14.Dlink ([43.229.90.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm10890546eec.28.2026.09.06.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:02:20 -0700 (PDT)
From: ShaunV334 <shaunvarghese43@gmail.com>
To: krishna.chomal108@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Shaun Varghese <shaunvarghese43@gmail.com>
Subject: [PATCH v2] platform/x86: hp-wmi: add Omen Transcend 14 8C58 support
Date: Sun,  6 Sep 2026 18:31:14 +0530
Message-ID: <20260906130114.139261-1-shaunvarghese43@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apry5R9nzCJ3niGH@archlinux>
References: <apry5R9nzCJ3niGH@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaun Varghese <shaunvarghese43@gmail.com>

Thanks for the information, I've currently added 8C58 to hp_wmi_feature_boards[]
and removed it from omen_thermal_profile_boards[] as suggested. Manual PWM fan control
is confirmed to be working but the GPU is still missing that additional +15w from 'Smart Performance Gain'.
That will require further investigation.

Add the HP Omen Transcend 14 board name 8C58 to the hp_wmi feature
board table using the existing omen_v1_legacy_board_params.

Remove 8C58 from the omen thermal profile board list so that the
board uses the appropriate feature-board handling.

---
v2:
- Drop the CTGP/PPAB changes from v1.
- Add 8C58 to hp_wmi_feature_boards using
  omen_v1_legacy_board_params.

Signed-off-by: Shaun Varghese <shaunvarghese43@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1a..e55ed5b3c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -209,7 +209,6 @@ static const char * const omen_thermal_profile_boards[] = {
 	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
 	"8A15", "8A42", "8A43",
 	"8BAD",
-	"8C58",
 	"8E41",
 };
 
@@ -299,6 +298,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
 		.driver_data = (void *)&victus_s_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C58") },
+		.driver_data = (void *)&omen_v1_legacy_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
 		.driver_data = (void *)&omen_v1_board_params,
-- 
2.55.0

