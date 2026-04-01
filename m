Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94C3ECBF3
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042304; cv=none; b=Vf57OF3v1AWzPvpukYStoDvacNfE5nSa6JRqEZO9JofZDUBGDxyOzNF8DE2WL2wsB9ZQY188W7eYR3K2CwwoDBgkdY05PZ2bCI6w3uIwVzCm2wnuYjzOFCecT/nxyV1E/fUphXgXiI2pCjlN1ICAopst7CF8w6q5WYGAvxl+GAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042304; c=relaxed/simple;
	bh=zYnHlcvIRBWdtzEm1zTt0FHTgOVyzkD3PEyh8M5t0qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmubegAT8K3GW6B8WEeJok8dl++bW5kmjJ1kO6khO7lVtYnc30LUuVpoO4DGOyFTce4xTgQgz/ZEfhy67NGgPr/W+t2T1Qt5ju4Bk7Ea9BJUep2MGQ4OjKuIRi4Y5XxvwAhJNC3kBGRJiW0GbTYbQ1NB39r8gmrahIGqCc2V7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSWQ0rIv; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSWQ0rIv"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35c206f0481so6306091a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775042302; x=1775647102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4NqdGeNr4dDBnJSpOJI2C3YLgWGN5SwaW+i/cg94Rw=;
        b=rSWQ0rIvSejE9Ehv6S1ekiArFHqJxTwvnBEaBvBZQqoef6upChMfFUZ8kyKuoaLLpR
         nfXrUaFc/UbGDyszlL4CDaq9hCVHS9S0nZ6x7nW1YVtVNY1uLgkQGax47e3x+ykBtUi4
         7nbQDkZESFzI9muCxlP5OLKVoQf2iZhkna2EVBel9gNSFXcZIG9R+pH6yd51vupndMry
         HrSMypdzmXL2IKUYnnQ/VCNjx49m/PFrZRFnAJQHOodTkTD1IgepZ70L6ie5OrjGCM5W
         UeUXRNeUrsUjiVm4Jfe/35hhusppHF+Skrj8Qn4Dfnq2AoUfyuGcygRagrAA/Mmj9oR1
         yPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042302; x=1775647102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y4NqdGeNr4dDBnJSpOJI2C3YLgWGN5SwaW+i/cg94Rw=;
        b=s5V9Y6fUHqA5m8gqsIQrsi5/N8tuF5033QrP5ktTIdiHhGj8rbKYj9QVFEVvBlpvEo
         lsgZusnSqaTl2J57YsA5ZNlOAH+fQrq0813Hd18+LFnRIcjFUI7ZoRFA1kErxfutvn4g
         tiK3B/OnWtyJbYyBS5Yq7YwJtdKlLrcsiHXUl4bqJVJ6CL6iy36R/DI7ocQvhuHn9u2o
         OQ5QjcwgHvM5vDSKBEFo6KdEiREsFRNr8a+lOjUGrUviOTQmJLLdRz/ySP5frWhsVDYW
         JqhXWQj6dsBLL9czCCmvXs7RYvZQAm6no6koUpUd/G8Au30PRxIKkHr/bXVqXQwMHAZC
         4B9A==
X-Gm-Message-State: AOJu0YwN97zZdB/rI79AfSzh2Zj3nhKoJ6emMd3yfoF+5NJDmps8y99U
	ErjvHRHvtfftOA8oEoAKYspTp6rW/Qj9fgegopE/EMdURif1PohRjmgY
X-Gm-Gg: ATEYQzzep6h06/cjHaNI0ZhOY2iiVFAVOVxg+/AAYTqtYm4uDJyfddLquNVyuUgSZxS
	i4B7nq6OZM+CGrlZRzb0vTw0utLcFFJvxmWirHFci4iGP/jno4NNW/yDG1rUFpIOQqTi6NzoRRO
	JIMg9biGRW7ZzdMI3oiMi6/GBmTtnZ0irn6VxNPG0wKDByxuQHjBU2Y+CzCucCaukVfUmFZoLvv
	Ucifm7TXJNhV6CyjCt11FgfFV2WgsLD4lAAXjfqxT8ExfsXNh5H0VDncKPLZFfVpLwemkIdD749
	S/E76CJuHD6f012wNgOzzzQezrzfaQXxzfwM/Z9kBlyGE0NaAWgiM/iFulk/Pj0TfoUP2FKNbLk
	EVwd9OklSw8vAW3+Lvqjg8UUMh30+UO01S4C4gq6BlwzQTqVvxj0XMnzO8tLlLVzyD7X9we8NdD
	6ioi8eCsfUIL0nKJxnN/mZnZ/YkE0eDyXbageIKxLSh5S1ZT59nIHEngRxYT7KQ99Dw/pFdd/Do
	mumsrS4yKnD6YAMqGHm
X-Received: by 2002:a17:90b:3508:b0:35c:1c77:fac8 with SMTP id 98e67ed59e1d1-35dc6fbad7fmr2914367a91.30.1775042302288;
        Wed, 01 Apr 2026 04:18:22 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dcafd004fsm1889689a91.12.2026.04.01.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:18:22 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Prasoon Dev <prasoon5050@outlook.com>
Subject: [PATCH 3/4] platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
Date: Wed,  1 Apr 2026 16:47:47 +0530
Message-ID: <20260401111748.106970-4-krishna.chomal108@gmail.com>
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

The HP Omen 16-n0xxx (board ID: 8A44) has the same WMI interface as
other Victus S boards, but requires additional quirks for correctly
switching thermal profile.

Create a new quirk omen_v1_legacy_thermal_params which allows a board to
use Omen V1 thermal values, but rely on the older legacy
HP_OMEN_EC_THERMAL_PROFILE_OFFSET. Add the DMI board name to
victus_s_thermal_profile_boards[] table and map it to the newly added
quirk.

Testing on board 8A44 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Prasoon Dev <prasoon5050@outlook.com>
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 24164f294420..3284cf0d74cb 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -121,6 +121,13 @@ static const struct thermal_profile_params omen_v1_thermal_params = {
 	.ec_tp_offset	= HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
 };
 
+static const struct thermal_profile_params omen_v1_legacy_thermal_params = {
+	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -181,6 +188,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
 static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
+		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
 		.driver_data = (void *)&victus_s_thermal_params,
-- 
2.53.0

