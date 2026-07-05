Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BBA10785
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Jul 2026 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783281192; cv=none; b=sT5ISVtMwebq+s/iWvMAagrxR3B2Gf9VuVLKdP6qsMwQt9SiyptmQjPrxvRgJB45cmmmId0VHUXE3Q7EDckH0BNiOenOGQh+ZM1TGST3VSkE9rTNV/JOTRT5UUKa20R/rnCuxqoP5pXEdeo0410EMKxB+7bYwH1xvjxxQHwGdHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783281192; c=relaxed/simple;
	bh=Kl5bn8wYu+fM3PIyFShOZSe+woNMwYtzTT/fKMVx6r4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D/P5q5c4KjKhZ7BZdfClb33L670BfagXeN4RtzR3coq9HQBgt7YIeSNDk3zpr5Rwv7wY+0zptJvPenp6TT8AUPUXmgEqF/wBJqsRd8G2hQMC9BW8m8lcFONuYXUuMLvXixzIEirsqDK0agpq10BpLpHZf24z8Yh8yIVabD0DC+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFadKJmX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFadKJmX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacd69a9c0so17705105ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jul 2026 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783281190; x=1783885990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QiYzrAfcauBONfDpNMONjKqraEI5L6Yl4S7u4TB7jx4=;
        b=KFadKJmXyT7rrsAWuS7KR/u4Cc8FMfZ3UEVvGH2A5bRieI+Nuy7+v6/vD0tLjdTzzn
         MDWVk+7DAWzuSXidiJ12i+6dE4UjUGgX8bdCQ3ICkmPuE3LelwQ7LjO+hUqk1J+nRwAp
         hb/pjuHiCjmEoBQSUMELvLzkIo5YKx+qItaJ9IVwYAqw7CYnOX2GKBfwE3bAVhnUKMh2
         nkM8lFBeCVihAJnOw6Pa8pq20eTB9XWW3ZAHqJPZafJjeuVR5W+Ulf4x1Y18CgtE1nAA
         +tlqam83GvcecJsissjqfPH9Epiaj4zMzjnBCHN9Sxt0uIRI31Tp+xzhgMXC8mndZt8r
         eO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783281190; x=1783885990;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QiYzrAfcauBONfDpNMONjKqraEI5L6Yl4S7u4TB7jx4=;
        b=f87+JXyQT5DoKne3go1TWwmXErrxwB4BbNaXuDPgU6vVx+HHwFalikkyfRGq9I0Kk3
         VL6PuhWIkXr0970soWxpBeA80R57RI3T4F9yJvJIL+URb6Sk00RkJgbzMUZWPWZIBaTU
         96tz6l2s1lCxyY6s5xJFayc305+oAoMyUw/vkl7EL1S/Ojnyo8Vw95AlNR81dD/2YEMg
         OBLqxCAKAr1lkuQ21CfLKnnY1bBo7wrUBxtpXNpj1XdIkY5RoZ+7QjHkZUmK0FF1eAOP
         FInJ+tGDhg0HLTNIOFU3ZEy5BHa/CieMkGEMIkgpT59YdnQd15qehchgXoyDQ6xzd/zV
         RUHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDYovQiYFtKWV/dzHK1pzq8EtfE+UgZmEWC2dK4Lduufezj1dTeeIWDBfhHo9oASRVjW00bbWD2GfjDtx91tgOV0F7@vger.kernel.org
X-Gm-Message-State: AOJu0YyuE/GvsrlEARXoTyI8aCCUC2IR45612HvFjh1/0ZubU+XX0slq
	MiKah8CDl6dxKjQDz9bJIXRmaa7uSRzKSNSJRjl37ETOzwYgY/BwOGaw
X-Gm-Gg: AfdE7cn0h7X6WLt0kdtFmY+35IGkP+0c8a9xEOox09iouzh9PfB8k3teoROKj6mwpw2
	AWRjeuPrKoqDc1iVUvkCUNpcPtFdHWzW3kJtak/NYp27x4HyCJunofAjykug8OVUeeu1CPlpxRd
	L96pA58sHmwupd61yaSjJyfCvoPylIhdGPB2+HIJy6GNQXVzOQBW8qF324EHo1DaU8C55fNGCRw
	Yi6EowOWHc8cqjI9t8GmIWnnwxOHF8ncqpvhlpE5PzDnWRXQMUMgbv1/QdzyX1JZ51j/sp32l64
	j7O9pztV778zsP9FHjBh9zi70h4lgnHEuPCdhiKoEY2WxNuiQtJwpQlzGy9mFWOT2F0UNHj2KZ3
	seXtcyLB+wDmZtyyuP8XCbTc0yVoUTaaYo1gwCeaeneoEECtexRIhE3PGYX67mc0UlLMyRg==
X-Received: by 2002:a05:6a21:a91:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3c03e50a78bmr7293802637.36.1783281190587;
        Sun, 05 Jul 2026 12:53:10 -0700 (PDT)
Received: from mithril.lan ([2804:14d:5c54:8ac6::390])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm27454235eec.30.2026.07.05.12.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:53:09 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Barroso=20Neves?= <flaviobn@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	denis.benato@linux.dev
Cc: corentin.chary@gmail.com,
	hansg@kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fl=C3=A1vio=20Barroso=20Neves?= <flaviobn@gmail.com>
Subject: [PATCH] platform/x86: asus-armoury: add support for HN7306EA and HN7306EAC
Date: Sun,  5 Jul 2026 16:51:26 -0300
Message-ID: <20260705195126.17120-1-flaviobn@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add TDP data for laptop models HN7306EA and HN7306EAC.

Signed-off-by: Flávio Barroso Neves <flaviobn@gmail.com>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 65166b50a..348be5cf6 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -2322,6 +2322,35 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "HN7306EA"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 35,
+				.ppt_pl1_spl_def = 60,
+				.ppt_pl1_spl_max = 85,
+				.ppt_pl2_sppt_min = 40,
+				.ppt_pl2_sppt_def = 70,
+				.ppt_pl2_sppt_max = 95,
+				.ppt_pl3_fppt_min = 50,
+				.ppt_pl3_fppt_def = 85,
+				.ppt_pl3_fppt_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 35,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 60,
+				.ppt_pl2_sppt_min = 40,
+				.ppt_pl2_sppt_def = 55,
+				.ppt_pl2_sppt_max = 70,
+				.ppt_pl3_fppt_min = 50,
+				.ppt_pl3_fppt_def = 65,
+				.ppt_pl3_fppt_max = 85,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "RC71"),
-- 
2.55.0

