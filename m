Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E668242D9B
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578710; cv=none; b=u6hKlrCvdzKhuo50fnKpohFBml19/Pxc3tUWG40UQI+LtdiPLUmzTmBJKjiFQyLZzUSQcqQTYB7ueaEwYcf0dx5jZoSmMkb3quGGTxdd8qbvSAfnOy0dzL+MVIcX02F/NFt8tw7cnWMkTlx98cjhcaRkMA6WSjxTuFH1PFN+RVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578710; c=relaxed/simple;
	bh=xLDn0Tb/Cb3Swpcf3Nkm6pIuZ/uGK86dO2awK/koiaM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iV6dPd4noMbIS50EPX6YOenjV66b3sUPyTlvpK5vbd4uBlSKAFfJcXpkocZOxj1LCt0qFNfJ/9/BUjK7sUgk/QmzScPQXn8Y9oMZEZvHiIyDBxqWCiNpHoAOoK6NusBUqAJovT8RAYH/HsekgmuWpYKIpuxm6TRKo63/vE4CrZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lcfc.corp-partner.google.com; spf=pass smtp.mailfrom=lcfc.corp-partner.google.com; dkim=pass (2048-bit key) header.d=lcfc-corp-partner-google-com.20230601.gappssmtp.com header.i=@lcfc-corp-partner-google-com.20230601.gappssmtp.com header.b=rvnLDfIf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lcfc.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lcfc.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lcfc-corp-partner-google-com.20230601.gappssmtp.com header.i=@lcfc-corp-partner-google-com.20230601.gappssmtp.com header.b="rvnLDfIf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1619933b3a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 03:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lcfc-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745578707; x=1746183507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CL4GUiT5fbCVEgjjh5GO/CMbN+iFWhXsnOF5Al/SGjs=;
        b=rvnLDfIfGtT0ve1AY44Uy3olwyh19KCWnkbIMDO7bZfKFFcKtgnRMGjQ/tE8csBbOJ
         Dp44k0qCPQNTMMkImlLFkU+pVixudEG1dnjsfgFCLTm6dIRC/QD6ymCnsBnPbLOJ2HL9
         bSfboHHoFuf3SONmUKShdMh1GV2E6+dlv5QZREdcPJ5EP+sut5Gi1e/W1WyCSbPprSnp
         ernDmo8K7zkpuRuXYVygnAmJ8MV/WYGyFWUbbO6lI+G0er0oAamd6Dli9nFM0LzwhuX4
         HKGrcRvHGg7ttUYni61EH+yVpV4dgdDgl2Axjqu2Djx3P4vYWl/VcuhqVKaZLB+tfGPg
         cRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745578707; x=1746183507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL4GUiT5fbCVEgjjh5GO/CMbN+iFWhXsnOF5Al/SGjs=;
        b=gBto56xheDGkyHGxbZJARwOdsziSnMvC0B+MUieE1n4+100qlMyZwRkXsFuxqGuhpA
         MSeqCvc9bZNhaO1BzRogd2MY7keUKbZKe5CY6Ypx8XtrxoOtcFUSxevfQKdtu4YJ3+jt
         ng52BqoKRalpgMo9JGtRyqDtImVpI924lcvDdpr8nEqRohynboUGReStNNPHv/E/NKob
         f3W8VvW0QpXs0yA5qEu916j6LRwBzvnMrIea+Zu0k9lg5iBOjq/tKbgD+MQ6JFIeufwZ
         /H6FoQpcwicLMcICucWWLe3ZuyASpO0i/LHD0mDSxtUQOvSC0zhfLJNFPYNgjyBtS+Jl
         6Csg==
X-Gm-Message-State: AOJu0YwjarfLsq2Ou3Z0xwK4W6S7qy7Qw77iFjWqvdruUIJcG/Mt0dQy
	1cec074xspRAeXCXNz/gdRPG8eQkOCtXdwVMipfN31JbeUXgud5pGk7TpClPj7aECv0/TXHsuiC
	2jfpfFA==
X-Gm-Gg: ASbGncvMRoN7Bu1OfyK4mkrA9rUI+nKw6J8+xaEq4IosbLa65xxB2/S68oU+Nz8hTM7
	k7pwkVMDlbj+Li65uuRV8czsFev2XymIl30o2pL7Jxt6XtfDdIeResx3LSu2iAZ6Oy44YPjXqOL
	+gOpSvOMRy3uJBhHM0fEEaPdgrB5wh3tGrARBEE3vUoxZ02QhgF3NpG6JAPwwZ8u9I2qSKw2Kz8
	30v7a6PLBhrhjpbLJMH9CBh44eDr1o7p7mbJ+XqmfysQW2XUKPPetV2zudOvTblu/uRfju1Rc6L
	2ns2kMhCJ9YyStaymDehfQHoRx1Tylt9nbyyEPg6QajWz3aYfw7cwifWtOQtxp/2DLSFtTdAhgf
	bXQJMu7zNP5qeb1EX8z2iXfZgDQ==
X-Google-Smtp-Source: AGHT+IH0dA/IkZvFcO+56poSvwEFwT+v1pAO6NoIaOkc49CSbdZFIu08OG6EPlpiLB7+JcYO8sBIuA==
X-Received: by 2002:a05:6a00:80f:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-73fd74c7b87mr2464918b3a.12.1745578707176;
        Fri, 25 Apr 2025 03:58:27 -0700 (PDT)
Received: from alvin-x13.. (211-21-152-94.hinet-ip.hinet.net. [211.21.152.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25962f61sm2872450b3a.74.2025.04.25.03.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:58:26 -0700 (PDT)
From: Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
Subject: [PATCH] drm/panel: samsung-atna33xc20: extend msleep in atana33xc20_disable to avoid glitch
Date: Fri, 25 Apr 2025 18:58:22 +0800
Message-Id: <20250425105822.4061016-1-alvin1.chen@lcfc.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

samsung-atna40ct03 encouters glitch when powering off, extend msleep
in atana33xc20_disable to 40 can avoid this symptom.

Change-Id: I4d052621d3c3e0fdae0ac472fe5da151f46be237
Signed-off-by: Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 9a482a744b8c..87a4e1c47aaa 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -154,10 +154,10 @@ static int atana33xc20_disable(struct drm_panel *panel)
 	p->el3_was_on = true;
 
 	/*
-	 * Sleeping 20 ms here (after setting the GPIO) avoids a glitch when
+	 * Sleeping 40 ms here (after setting the GPIO) avoids a glitch when
 	 * powering off.
 	 */
-	msleep(20);
+	msleep(40);
 
 	return 0;
 }
-- 
2.34.1

