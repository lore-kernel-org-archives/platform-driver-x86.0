Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF43914FA
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 19:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377563; cv=none; b=exeHuDV0VQpN7+qypxjeB48GXFHvLUXs1dNbxMIokky7tpFcB1zyAMeq3n8SstJr8NhrOvAOOtZ8Cc6R07qpqwUwqtaJBxpg7/4pBFcMMYxVxakt6AUDk1mBtMaTY1fh1UJcRrQBVeRarw6SS+MAWAnDM4Lw+vWCZeJjLJKZmSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377563; c=relaxed/simple;
	bh=A2t1kYCaqwOs1VtKcCPI2iJFoH08N6NPdPizyRT98Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGCrCAnvccxN51RFWoLM2QHdvSG5mSVkcsDbMzqlOAqEaPxikJ42kOI6is/dKyyRLQaKooZ+/x96EJLdbxrev2s5A3bgnjNAMXcArr+G08GQzbudmo3SFcdMZ+12WPU32iolqhOE24WMRnY1xJOOQQd/9EAA8U8A4/BWEjNXgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1s5JUC0; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1s5JUC0"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e99ef0902so136594185a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377551; x=1788982351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vguoEC+MJZq9zYntrbQ6UkhdOenYXbbtJ/8LtnXQRQU=;
        b=F1s5JUC0e4gLx7QGzNMsFHTRpgCS2bUfHPVAbJ4qKzGJcU/pVaO7ibCX4skdLoJoSW
         HfBDV+14MyvY1JVugKtwueJU19UXgyF01ZI9J3W+1na0dqgXVN+kM9bDxCj1bk6fILx2
         0nw/+AA4nF7ih1fQfJqzzCnsVy53LZxvRNtfmilI30kjKoiFpikNh9ZP32eedzaN154L
         lQrAXIck9khPxexRxxpxDwwKlbGf3PHmpzfukPkU6CLty5rxofHPupf/w5azz8u1pyJu
         Fp0+8cvecmo2tmkSCko8+BqwE3ME9qGoEmBtwo2kLvFi+kSVP5XCXiM5xsUxMy5GWP/f
         npBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377551; x=1788982351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vguoEC+MJZq9zYntrbQ6UkhdOenYXbbtJ/8LtnXQRQU=;
        b=PIEeVjl19CEwXeBittoDs/ead9UQIvbnEJGTPSFid8xoyI/Ch397RE12NOrQAZY2aU
         sKAlU1JRksBdaYR4cdSRccqKbP1Pz6JSbyB/dHAyBXfroaj3Sc2jGbbwvC4h/tC06HQN
         OJW8fBmuC8zXKLBzvSQ2kfcyHYvpsU3xYtzQQvfBOsOrXo02mmE/SSYOLI2PvXN2NFV6
         WBATxwWGfuZ49f9WaSsvI4hq7Y7LvFtr71FA6O+mD2f2EVkk3wWwbA10MNjE9dTtK4D9
         0nPUAVL1J6hFQVV55D5GSD+3wik0FL41OoUXHFjzLyNgMRILAH85WIqitqDVK3vCW3Fp
         9VgA==
X-Forwarded-Encrypted: i=1; AKwUvBwTEBDUT+4bb32/RtidC+poVkepaly4UkjaNDiP+mypxO9NwA3NARHtKjNOVfZR1pgQKYTOE1mcJepWh0r7sPbq8CzS@vger.kernel.org
X-Gm-Message-State: AFuF++lxD1bs8rynnC2809SlPGkbhOPE7tdGszTk93/M5ZkaiOuUvWzt
	1kzCI4SfCHonXeNnNcK3YxL0xJt2Gqpr4XlxRcpkyWLNuopjLvLvDLw=
X-Gm-Gg: AYBFou1CVOfhxM4PjD1ICEb6NfpLJHEXl9t7Tm2MTI3ePo63NxumyC4c9zIuUbp4W6w
	doLjOkPsJGonl5dfXX2pkPwC5EV9M6SCFyfKvA5UpehwbJIvPndTvx5eJ5iRNQmiEuwg38XWQpy
	5G8pD4sYB1kJw7TQlGa26dEmHTrexEsIUiB9m9AK12uTkGwyVBW5pYBh1Fq5vvZA1aoKy0R+jfi
	wdsUDlQ4/KIzauuyXvAHWM5UwCdxpEIRl2ig/bpkqnVoqUu6ZVkTia+eqpsuW6lU6pEFXdAd4Sp
	hGhh4lpK/DMRU2+ht4Ug0YIT2mq/rzc59J0XZ0HCuu34eNDtM0EXmkruPLNHIzqXpr82Tf3+EA2
	DYVuMefs5be7TzzBCrNs48VTsD57RVvTPwQ2CGoXJy5wpiWSzAFRheP3n07RoDiAfczCdxVWOTu
	ocFoXwHs85iiyMgrd4cPbeECpWq+FRZQi8DI406B60cqv83Q6TNz77pCr3/M7KE6uct3/ZsJTf0
	vn1w1tJoWtVSxDo5SD3AGXUfbICsHcc7mT/zMGpcROt9G5pjGM01O8oJzftYlj36GCcnS+wwsp6
	k/9OCrI7scWiohw7HLS6xGxTD+mo
X-Received: by 2002:a05:620a:3c97:b0:939:6dfa:db9d with SMTP id af79cd13be357-9396dfadf02mr130537285a.50.1788377551081;
        Wed, 02 Sep 2026 12:32:31 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f17eefdsm284698085a.11.2026.09.02.12.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:32:30 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: jlee@suse.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH] platform/x86: acer-wmi: Remove unused platform_profile_support variable
Date: Wed,  2 Sep 2026 15:30:39 -0400
Message-ID: <20260902193039.21725-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Found while reading through the driver. Compile tested only, as this
is a pure dead-code removal.

hp-wmi.c and asus-wmi.c appear to carry the same unused variable -
declared and assigned once, never read. All three were converted to
devm_platform_profile_register() in the same series, which may be where
the last reader went, though my clone is too shallow to confirm that.
Happy to send patches for the other two as well if that is useful; I
left them out here to keep this patch focused on the driver I use.

If the intent was for this variable to be checked somewhere rather than
removed, let me know and I will send that instead.

Disclosure: this patch was produced with the assistance of an AI model
(see the Assisted-by trailer). I have reviewed it and take
responsibility for it as signed off above.

 drivers/platform/x86/acer-wmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 61ae622c93d..528a89c3eed 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -839,7 +839,6 @@ static const struct dmi_system_id non_acer_quirks[] __initconst = {
 };
 
 static struct device *platform_profile_device;
-static bool platform_profile_support;
 
 /*
  * The profile used before turbo mode. This variable is needed for
@@ -2199,8 +2198,6 @@ static int acer_platform_profile_setup(struct platform_device *device)
 			&device->dev, "acer-wmi", NULL, &acer_predator_v4_platform_profile_ops);
 		if (IS_ERR(platform_profile_device))
 			return PTR_ERR(platform_profile_device);
-
-		platform_profile_support = true;
 	}
 	return 0;
 }
-- 
2.47.3

