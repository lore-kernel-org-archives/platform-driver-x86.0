Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0622DC791
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486202; cv=none; b=nf56yJj2HHAhIapdF7Eat+bnSQrpXMEXPN16tklH30HqjBvOXqj9PZtqH2eIPw7iSeUOr4UiG0XOxhi4qVBDUb4Pn/p9vX0FD8WtPSTmdyQHktTCHWdPgB5yN+FRGoSfEI6An8dc9l2iLGVnvWEaQkHGAeCDGDObjZiEGbNwVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486202; c=relaxed/simple;
	bh=zr6NPufun9/U/tOwiqE7sXIr1RfNYansOgCw+RkLZ6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FoQ0JXkudBhuF2InETv47YOrI8bXkQQIp+ezt7dxEwo+kL9vziwG6f0QXqUfAxx3pF8YzPGgcKqzLuxk5GwcKbQ/+g3kpzU7XmdwVc7bLTEHr0vbyzb5DpjJeGU6HJ94Hno2CoyDXNBphcZc8ml7/eRSm11AeqAZWrRGkLJuYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asNVz5UI; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asNVz5UI"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso25732a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777486201; x=1778091001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltliAc02c6RjPKHoWmoJGjZitZnxUTbIwIVqXdRI3Gs=;
        b=asNVz5UIU3ENolZphRAtFJfGhqbqixWQEhOt6p/d5pWCBNOs8foEudVWxbSQu470/l
         YuMLLbvXQUq47mrMmuwIG2LUeVxhk/6OQ5g4AuLVCtxUNOQKvHQnO4pupEu5YAJUAHRS
         IJk/06EzeGcoH5+GKfnTEmJdYmtKOmG3rj7+xSzWqXDrt7cPyEvO99t4eWZSY0j9SmRJ
         eQFzF6BdY/9nIZdIVS9z59LTQpYbcwh18FsRqbIIdYxvRuKC7b2spaO4iYi5U8+Za3zk
         NcLV2qsoLhTg2aDuhIfW0pXqD410QYlfYB8ET86zq9BDOuz3kzxmgX32kbD9zv4lQ83q
         vpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777486201; x=1778091001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltliAc02c6RjPKHoWmoJGjZitZnxUTbIwIVqXdRI3Gs=;
        b=bxzZ+AzH70QSyG+fVS+WxNP5Ssw3YD43EPvRFoGhhqVam59fiJ60a4hcASysbghfrM
         0lZQPdBy4OQ6H/YtnHOirgdXt9f8kn9XPOQy85xuHIgurjWSu4iWHoV20/odUcF5wP9Q
         yxcEeWOsm14kSkgeXs/PkAFIEhmqore7aRoNdnzVnVggsXzhmK3me6d4tbhdckca7Vh0
         71X4M8dD9JdSVPKH/L4sH8iEmuE8x8/bvZtUUHWufF2ZWqdZDM7UPpJuZhr2iC/qwPWj
         uCc2/O5tFbs/Un/Yy13HISK+ozV700Yl3AdNmms44zsr5ag/zHy09b55zpQRPjCKM309
         oZqA==
X-Gm-Message-State: AOJu0YwZEEcTq7Wwkks2bWdRJ/YOQnzNEkV9fbNcmU4xjMJmCYwhCKb3
	KCfM/7j7YzeNBKes9gPrS1Y4nYDHsQjz7Fk+aDHEodhzAxTt2e0ic/bH
X-Gm-Gg: AeBDievoKvZd08lKXleOC4rIjL1CNjj/FIRtagAki0gX2QvyUVSj1yY30vJQfyP+ILq
	ovvrJ3QZwbeeaEqh0Ae6VoFy2bS9375Vsiwbt3gNwOECUrmDHnQ2+EfCNFdxa8i3ECv9xY54Umz
	PD684jul9QJUsmXCCuwXaXU3DPnzoKQnInDSsXVtyECH6AxU+PXryaAEwlXwxwyqgYE856iXsMm
	B1bUg7+YEGVp7x/ruc8hSsBGsL71AqKjv+VKgIsk/fCbnDuIMLvCLqRSDDPfIa5qQPvRV7X/Csb
	KLP/XnAwSiz20YEEYlAf9lPg7jjApoW77GDvICWz6NYxY3YC8J782IKA0/zqI9WSsfisW2ANtoy
	iMaPJugPh03GvunMo+dECYI2IubP4549+/hm6uvC3tfZG363OaWtC512ExGuC9KdHqvsZ1JJADt
	78r95YuRMGYSWTbuuz/AhIQ//JaHH/ni9Zj06t4/PKyQarqEjslkgmbdGQQFWtuFpt/FsubTGoz
	qtf/fXOKhHuYfKhbvvE5NmgxO249tg=
X-Received: by 2002:a17:90b:48cd:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-36491fba27dmr9021714a91.10.1777486200523;
        Wed, 29 Apr 2026 11:10:00 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:bfac:abd3:86cf:47a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be044f23sm246373a91.17.2026.04.29.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:10:00 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Benjamin Y <hectare.plains1h@icloud.com>
Subject: [PATCH] platform/x86: hp-wmi: silence unknown board warning for 8D41
Date: Wed, 29 Apr 2026 23:39:53 +0530
Message-ID: <20260429180953.129885-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen Max 16-ah0xxx, DMI board ID 8D41 is currently marked with
victus_s_thermal_params in the victus_s_thermal_profile_boards[] list.
This disables thermal profile readback and adds a dmesg warning during
driver init for "unknown board".

After testing we know that (similar to another HP Omen Max 16 device,
board ID 8D87), the embedded controller on this board does not expose
thermal profile which means we have to intentionally disable EC
readback.

Changing its driver_data to omen_v1_no_ec_thermal_params is sufficient
to silence the warning.

Tested-by: Benjamin Y <hectare.plains1h@icloud.com>
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d176c..24c151289dd3 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -243,7 +243,7 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
-- 
2.54.0

