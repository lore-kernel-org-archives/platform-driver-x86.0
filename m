Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2103EAC87
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042309; cv=none; b=l1FRba3QTHf9+vpSbJNvWDtTtq3CS4/NyFY9FI/jeLnLoHFQLJgi7BMPLOahK7VBxGvHhj0P6ioo3CDDnQ4jm7y63RackSHbGM3rPjaSFK7A8wLYylEYkWOHNsApzPV20NKRddrVlfvHzjvsMsCQjk+IYtW7HVRYgs6KJqSzdJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042309; c=relaxed/simple;
	bh=bOoGXg+Ptdm+5MGtNztiplrP7obGnl1Ycdm4b0J6M5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8MeNhLc61NzZ678R84hHr8Uib0Iyzw1rmu4s0DapvusaOSBMC7aiGQIFhUj6aw/Hyi6sjxMRGXDQFMuOJapcsWYxdPpGmupUshJ9W0xdTKN4owp69ZSnFS1DIGemEWKJNWuojQlyooWVhswMXdgTe/9+/Rm9PcI7hux1DpFPew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2MI8B2y; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2MI8B2y"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d932cc948so2790466a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775042307; x=1775647107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFbdbNnRPMKcdpjgOezZ2saKnXuNUCW2P7MMIh2Z3Ig=;
        b=M2MI8B2y0G+91k0XuUbI7MRWvFoB74tAqL9BLwjN+sSqmJXVYbBnvz2wTq5XDguskS
         VXeZW1TOxv7RvCYjon9RgNG2K/xlVHJ1gDcTVUQ3or/d/BbaMp2BVGtBJuvB99YAn7Vf
         bqRVJWcZUmGtu63h1OSufzxD48t2muqd4RxsnJQ7pFAkGhz1CWYSVA7u5cjqPJ3j/b9A
         kumdCAvI7A3E5maJEC4TI8s3dKxaoZVa8bG7X7hk1j99W73W7Fe3WLd6gLtBZHO/nEOa
         kcbKeY7yj01tAgrJIbSasSQkpM7hab1FjnrmWNCVWWyYvI+DRPDanVoppDi3qUlx6DQm
         I8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042307; x=1775647107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QFbdbNnRPMKcdpjgOezZ2saKnXuNUCW2P7MMIh2Z3Ig=;
        b=E3Ti0lmtvXSL7URu0C6Tl5iQ7iD0FPIFnGUwgS+guyPujLFZgcfTRG9opVANbt7JIC
         VfCtzBALQj3KFU2Vu+k2yrXfz8j9mFQTZxulVRqLVlfI1kSHJBfycX0ITn7Pi6ie469f
         0Zu1bMVadn18llWmrdx1ImBRsL+lB1B6AnEc9w26BRCKOLKRkgs9x09WBlCBm0jHb+QQ
         y99yFdEJwGu3QUe7LQPahXmi+l5xls9eGrXZYtpLR5iJp88vt4Mo81j+GCNeYrnJyJfr
         YR4Pol214jIRteUKw4g9lr/pRIpgwX2MhtNbgn+50kGJtwdfMP63em2IXZsc9AVwVYkj
         tF0w==
X-Gm-Message-State: AOJu0YxdkrWGbhJ84wFOXfffC2i1HzdbnUHI6EAEI1svQAQttq3f1Z2B
	CZrJVh776sl+4+wPrNcqUnHLu6FZglwHR4h/O0Bg+5J35cS43XI8E2BnJg3vKdNe
X-Gm-Gg: ATEYQzyjkmdoDRox9SHRNihglTJ9bH2cypK0ObIFuZ/kGz3kuw2+XuMII7hsfvmsNbK
	pIuYyrybwlkneL9iJoUy5RbOkCk2NHJJ+vGQVhfZXU0MROX05ICA95XFhRsdI0whV9rOHZi82CT
	dqFB/ibRqsbutBa5hjkjA2R0tquCAzROvNNTjSxdGI+2P9LG3SrOC/02zNR69oCWUFQ2Ep5DT+6
	TT/sM/WF77fKSJOWgKEpVzJjeQ4DoCc24BrFYne9cDvMzda99nT51LM/6i55UrLUpHvNfcVu+34
	aGh/AhKnKRLKR3LFBbBwKvmmWdXdjdv36MjNBHdl3aD6xtRRaG/Dl9lRS4aVzOfqn9ZrG25xFkv
	9yLrN7iFHqWLdxUb4ATMNtoPWzszivTJRp4iNYqkwIekvcwhekv0aQ37U18eP8bHRCaoLKGBW+Y
	9IRU6dnjJLM70xX/HZelP6kAbfKnXaMJCE/bAz4tIa+fiAGlYQSH3BHFVFfonoJbo3lndm8LRlr
	YkM7w9Y1i1wkTDWHEA1
X-Received: by 2002:a17:90b:1a90:b0:35c:30a8:322 with SMTP id 98e67ed59e1d1-35dc6d7e7ebmr3187458a91.0.1775042307146;
        Wed, 01 Apr 2026 04:18:27 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dcafd004fsm1889689a91.12.2026.04.01.04.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:18:26 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Thomas Arici <absolute3d86@gmail.com>
Subject: [PATCH 4/4] platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)
Date: Wed,  1 Apr 2026 16:47:48 +0530
Message-ID: <20260401111748.106970-5-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401111748.106970-1-krishna.chomal108@gmail.com>
References: <20260401111748.106970-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen 16-wf1xxx (board ID: 8C77) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on board 8C77 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Thomas Arici <absolute3d86@gmail.com>
Reported-by: Thomas Arici <absolute3d86@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221300
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 3284cf0d74cb..fc1eaf6c3e24 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -204,6 +204,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
 		.driver_data = (void *)&omen_v1_thermal_params,
-- 
2.53.0

