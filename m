Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12E329C5F
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206875; cv=none; b=sbdpsQ9VFyb4m1da9AlULPssdtBC3jAxWSAXF5uH6xFAltEXVwjBih6ZHx5LAJgU2tFVHvAuRUJ9b99Dqau5VvtmkuOb5TPu2SjY6LYSwjhJDDxd9sO0vBkkIkJ8LdgX3jMPCG/tdxvVU/Uq7mOVl88GFhMxtkexuxSysMdTeZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206875; c=relaxed/simple;
	bh=IQwvQGRBT7s136YG6Rpim5lWs0/L0V8tk9KLSWcTVj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CaitaIwvmC4lk034OyvXB5KMCR0XT1UttgDncZKNRqpLUDAJF9qpIWv4e06So42xvU0/dVfVR9dnd6mfigS6BUUJ5f3LQ3P65iB/40kjfcM1ycxuePSVDqnE0O5MdL9T1FqwvWmlDBBjYP/cQrSWkFWRQ37JKZcapGugRUW3rRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXuTx7JU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXuTx7JU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-827307b12dfso1224777b3a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 07:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206874; x=1772811674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNYe4iy1bi+pQT6d08cKBYQO+VJyT+buVxSGjyRClS8=;
        b=WXuTx7JUoiegd1Nk9psnMjpXSPwuI8kiq9fyx9YQNsRTJnCYHEGzcaYeFe/D1KTuQp
         wmjFFnj3Vj46EW++FxSMySAZ8W+rAfGp3y8RzmjebpPQlIcZdjVN+Nta+vfrAd05T/Lm
         9ASZH5Vo5Nck252X4tEyhJN03z7C4/YtZz544/dsb3EYnXHaV+yrWl1Tcw5SaZtkv93S
         SNKbTP3m/pVorFgGs0Wh1gxt5uMCrIk5SKe8eDjT6MWdfJ/5WFaBl9rLQDRPYESnYn0H
         4dY2oclLNm9n99IdxJw7BICjHK+Mip8AHIkyS+VUjY20ageyJ93X7eSvRtMo8Oas1H3G
         ImZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206874; x=1772811674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNYe4iy1bi+pQT6d08cKBYQO+VJyT+buVxSGjyRClS8=;
        b=W4XesVPb9HPEKvnKxab7YobHNsjE0PlTJIbCLivfM75TZJBpGcQOWuJwIzqauvbJo/
         FT6LThuGjl2mZwksh+JumeQpTvSpAIV0Kb6oq3HW9wuzYL3n8I4gWh/hiHfWzjyu9n/V
         zZ5nD44eKrIvyTGtyz83Go5CxEwgKfg9N91dR5qY9GrHCYle4huxqTbsSOisy8MDvp7Q
         HsJMwLDuZ0IhYTmX73Fnn0aTcIiCs4Ypin9Np1MTk+Sqkafb6Ug/cp8L5ve+TI+Ir7iS
         19QqNB7QoXUbNFqP+eWlweJafA5QNNXry+3lE9yfkkj5wJcu4WtVDbiQYDEvPIENC0Bn
         9mQA==
X-Gm-Message-State: AOJu0YysjA1CMNFQeOOv/vc48jq6zy6bCwQcrJe4NuBFpwPo4EAdeiLu
	Mr9+XRrs0Nj3h7GcpjRV4AzecG57Jb0pm6HochlZfe0ycKWMIQomsi2d
X-Gm-Gg: ATEYQzwBdjooz5vstODv+KSNC9MHmu2F0nwHv70pg3gAOrpl9BDp0gVasHbkdgmP22W
	lSd8ThUWsEg1RWOoxfGcx6lPk2Ub9qRL460WyX1RKmj9gegWW16wh5Dy0leKqsuMsDf+2XWCtJn
	x8xtkPqA6dWq/NFIuK3+r9dEuisvzJKTpX5W4k2sUkEedQ2DcN8IYyen+EtOgd4ee2qI18KK3tH
	ItZa/oi3NWUQOreBinQqEsHPSKpj0q2nctvtnkJpsaYEbCTAxu0TZQETGXSZz9+S3MxftrgUCdz
	6IsFykz01X+2IW2My68GYgiw2FilIGWI1xT0uML2QUWPAMd6EZWh7NQNwB3sPGMBsz+eEQojyg6
	vS2E83tKxOZWZ9B3L3cM/GTkZ95R0Ws9I65didwqtFp2zWvw2qDmm6vVzqCQqisoecv4SNMoDz/
	QBXhBCx7XsTAqKzvSw4UuInQqt4w8Fa9s2RkqhwigGwKbNaa2aYXIg3ei8r4tsHRBPg2lV7aJZ/
	VjvKlrOWFGpy3eaXt4E
X-Received: by 2002:a05:6a21:c14e:10b0:34a:4b04:3c70 with SMTP id adf61e73a8af0-395b1e2aa06mr4302692637.25.1772206873706;
        Fri, 27 Feb 2026 07:41:13 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:9e18:7101:be84:75eb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82cf71sm4912188a12.26.2026.02.27.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:41:13 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jie7172585@gmail.com,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C76)
Date: Fri, 27 Feb 2026 21:11:06 +0530
Message-ID: <20260227154106.226809-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen 16-wf1xxx (board ID: 8C76) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile (similar to board 8C78).

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on board 8C76 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: WJ Enderlava <jie7172585@gmail.com>
Reported-by: WJ Enderlava <jie7172585@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221149
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..aeed12f8a3d4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -185,6 +185,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
 		.driver_data = (void *)&omen_v1_thermal_params,
-- 
2.53.0

