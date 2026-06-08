Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4BF3AF677
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926185; cv=none; b=aVSPY97sBd7x3kkwuQvrm8YU2NJVn8Flm7Ysv1j2LeifYIUnP+QetlBPknxy7pMJqV6/xOClVH04wksHxltAbtGviJGWWfY9Tk4f2IIFUKvsMnum0tSy54AQqvkOsuQnpRJx/xluyBV6mP3BsqKcOIipq7/zyjaYFm+MS85hyfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926185; c=relaxed/simple;
	bh=p8POFC0Q1WkRp8Ka1VTVl3OVHKoj5phUJkevGRLYJGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uJ6lqiMoQ18p/+Q+8YwwVAx08Q4NuUztfA/VhAaJQzVkMx7cD2skc7MUxvGRIpaLYlhjuQ5f38cKuExlrmcXmSJ/LstXcir1BBPRJTPfqzzfDQCilXndoABx99ZKPFgJF+4QvP9BuBfuoOx7Eicqu7+etI65B8U4wO4HjI08bhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWvkEbe0; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWvkEbe0"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c858cc9870aso2321655a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 06:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780926183; x=1781530983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHzbcFreo9ZiUMP3qqPWdb9beXmFTCbf1XOZjKPDsxI=;
        b=oWvkEbe0NjSqMj9HHlkSQbZUUE+yrDDJ7U1stiLtfy7mMIErSEfyIvpg4KOJQ2s3vW
         asEJ0bVY/nv9FprR0hJf3m1W3/C8cW6NxUYayyoNYoA7Y6lLUdWQqTNHB1AgV7BYMnoj
         x0PxEQhPYgqv0dfzuh1wt8sThyCTCgU0WMYyWjqDhHH0sP3itcf/ZhSj6NXduoeiY1rA
         aYewVyD5V36qVYg0Z2R9DA7lc4Ydrb4mRuMafNdd7DGknZwDHJ8R5wdKeC4t+Ci4KQQb
         BO7scbH9f0ecdjx0EZfkugQSpihNjcJm33CTlzWOh3/VKY2+W/vx32JgvVfXTQgkkSys
         jsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926183; x=1781530983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHzbcFreo9ZiUMP3qqPWdb9beXmFTCbf1XOZjKPDsxI=;
        b=ewsXezo2D1oobNOQAJIMQgPd3M7T1rl1VODY8xIYcUMZAQ4JUysezpSniU0djG42al
         /ggHPItKjSzvohMLdk3FYr8REydxSexvCUgr8RZ5pWP7NUIEg/974Bi9+beNF+TGsNa3
         s9pjTsIad570CIChgyqj8lsXbhp1vLCZhXIbywrjOjdauDtQ69sBAeje5GcE5fARNluA
         fEUM/8vSavMs8Ri1mZMHZE2We5llTL0H5Nh5cyTjR7zLSqIHkhspldAkNch6NOTrgoRD
         iYeAphJFe70W1cU6bvHLMFM/c/ivcYC6Xh9w7/aK3SpDGJ8z+GLvItw4qNejSaa0O7Ql
         NOHg==
X-Gm-Message-State: AOJu0YzDXvZ5q0jRDAoyRMb1/z4hRe3CAj8ePItDXg+mF31O5HvFEsxg
	7/S0eqSxfCXjJX1YTQE15K/Vzs11Sc8/GgfobtF7fRMvAeZup7ars/ey
X-Gm-Gg: Acq92OGZ6oewyF6zCDy6j8OfJg7cLmyCABhu7sq8SdGInhQqg+r/8w9agAAQDAO56mi
	Ba+U/JsEgvES9Jkd7XTa4licex2tOTWBbmzD/kPdMX9CtQG2zyEvW7BcOe9gX8UX9dDTV9Yiqh/
	49l+80tZhpdc2zvuts/kBBDo0htUkRk55YqCc9zaCxsthpSAKCG7AGHJrJ3kSWP2VR9BKF7Fo1J
	JkOaUcRXy2Z1DlEXVA4AgJdKp6hSQUJ2bHyMQ3S+55WHZU2XTHdssf57qEPZ4VayImtTf6wwUjx
	r2YeZURK7oAWYvmCQzYcMbUStlsyLFlxAqcm/hx3CgE3Ij1kZzkeC0Y2buwfpHdeqly1FllkTNt
	BxP/7oiJiwDzOdy9YjOP+Jzbak6xRjVSgZ3OucSdwbsLw6ccBYbCFWKIuN/FkT6UHfWEi64TAyG
	WvT+1+bCHIzVvD0KaTT+INY9HLibe8FNURJmTm4Jcn50f93pNOFR+AP81sR05oQO20kD/75BMrQ
	TCZkg/X6BYbQ9mr8zyF2fQB4qISKHQ=
X-Received: by 2002:a05:6a20:3ca7:b0:3a2:e089:ae4c with SMTP id adf61e73a8af0-3b4d39f5912mr12893900637.5.1780926182745;
        Mon, 08 Jun 2026 06:43:02 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:72b8:b88f:97ce:a863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm15664248a12.0.2026.06.08.06.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:43:02 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	=?UTF-8?q?Ahmet=20=C3=96zt=C3=BCrk?= <sivasli-ahmet@gmx.de>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-ap0xxx (8E35)
Date: Mon,  8 Jun 2026 19:12:55 +0530
Message-ID: <20260608134255.36280-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HP Omen 16-ap0xxx (board ID: 8E35) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_legacy_thermal_params.

Testing on board 8E35 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Ahmet Öztürk <sivasli-ahmet@gmx.de>
Reported-by: Ahmet Öztürk <sivasli-ahmet@gmx.de>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221523
Cc: stable@vger.kernel.org # v6.18+
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f27d82258aa3..e94df6ca39b4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -265,6 +265,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
 		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E35") },
+		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+	},
 	{},
 };
 
-- 
2.54.0

