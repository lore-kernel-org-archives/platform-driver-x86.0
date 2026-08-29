Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D7736F905
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028386; cv=none; b=UfwNNdEiHbOKnNiaaWlut7do6A1U2GCX+3AgZccta2ucKWaTepndibXymyI29hco6amP5FBloobxekusBViKw9r4WIpuQlaOvyHmi5dSqqsvneFQqK06r9+N7ididn1MbnPqFCTFy94cqFyMcao0CXLBkDc7ac9LVhmuUdFUVd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028386; c=relaxed/simple;
	bh=k0iTyq30Pts7oCqW5WqZ0ekJF2O8zcdRnmPhaFpT+eg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gnVy5ygOVyOmvRVhb6/NshXvUM9eQN7ZwIrho/bv77mMRJrzLPlzGxGUC9edA/4ikP8nIQhRgQ+u/eJw0Zuw0LHV2e12tdQ9xfDSY2U+Pe+gr+5vfyfRZFAe4sYn/DTbFicDXT/O+YSVcadt1ksUTI+BF/4yX6Qnag7+yxr3AdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2aG9m0S; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2aG9m0S"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so19513675e9.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028383; x=1788633183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T+s7fLb5lkfJr6wykxA18vctDqherQx/EMTkQ2+CSEE=;
        b=f2aG9m0STY3ATUV0IY7+SBywVN6bjyHrQQc5v2IbGx9zfElIs2SN/FbJJnRHBYU/pu
         tGbWyBK/ihkRILGbmZ81b9lFUg+D9lEl8Wqq2SRjuioknSSviUNmVcX/6KxUDJgIMDg/
         kxFr30LYaZAeVTFnUl3YpfC0aBNbqnCuA8t+NmbSuLcn9yjn20OnYdLt3o38AgDnGwOX
         5U4XhV2iisYr37QNSHS7GpU92lr9WNgKP+bA1NDJU562dX4vduaNJrfpG8OApCOtW0L1
         dmt9cEsumpvH6USzTuAZCHZc7lPxBHh9zDs+HlK0xI0n/nRN9xJb4ffh3BTyvgEbztlM
         ZY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028383; x=1788633183;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T+s7fLb5lkfJr6wykxA18vctDqherQx/EMTkQ2+CSEE=;
        b=F1VPan09hchHzUKXdZG96r5iazWo7hKq9huFtiW0Gdk/VBk9STAThoRM0h1p2LjHpe
         mXIr/MZeW0G0VOBXDAc3kv+cblBkG1PkqQjat+Kk3yfurCcX6+Rx2bGeHILw2JgIntmm
         0oDg+DSPOhJuDTx53Ieuxr1y9+gY/0VI6pEfLeBieCcFzwMXfvbt7fPPr4izyIdIlDGz
         JPQ3j4aoZ9la2npZBPcZKXiF5YJamfnqNGljuS2RDKbMb1etRPYacpuUoO8BiD87BKmp
         VulYlDfSRau6qaclm7J2jN6pcRmEmSq1H1em6AogOBOJ73d56dJlX8eObHqM1tgyV5/D
         y36A==
X-Gm-Message-State: AFuF++lccDQNNs4wQVQqdycL+ciiaKAxIeWZS+WRUOUHFWz+kqSmlw3B
	KZrnJXH8tLxw4KkP2jRYHnN/iEXHrHGkEqQuiaaNl1yu6cwxaJCG6MHp
X-Gm-Gg: AR+sD10euhUDw8fV6uPfJvziW/hMXkNPZxoGY8/KqlFWUtz5gJkIy86x9G//skURJLD
	ZYrh1FlxMC5nW9QmBynRhbfqMb+ltXvz3zzAu1gYq0pjtwR6MOYCzjJRex2Hbnvg9aEVfYCK73B
	Rbdjap36Ymx3AZ8+pONy+Br67asWwHrPRelGkF+rK40F8Grzz43La9SnpApZ8+bDiOgJItilX+f
	O9ciYPvS2VfjIdOdpZBHhAxtGN1XJaTTbyEPBKhcu3DNB+dRLnKHGY0l5AwvX3MSDnpCLA/WvnT
	9AQBO8oanyltE6T6+GOMcR7cUc1GLYwvJtWk9e1LvHNHehqNlv3Ggp3cQ3jb7rRWAif1ENXNd6m
	wY9o6E1Ei8YT1wH5IH4syoWM01MDHpRc9ozrmxBPtJgFssvyQEQT+Bxk5LrYAbjXfX+TX9Xmnii
	U2AadjB+b98gEt9Zwh+MXcE4r8hucHYHskighpzxkOWOqndXF+cAKGzCGMJ0+51JPMMn9tlD1Tv
	sWFxM/4W57q3K/gDr5nkA==
X-Received: by 2002:a05:600c:4514:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-49b91c1f2a2mr233129365e9.6.1788028382804;
        Sat, 29 Aug 2026 11:33:02 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm48682495e9.0.2026.08.29.11.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:33:01 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Subject: [PATCH 0/3] SSAM registry fixes for Surface Pro 11
Date: Sat, 29 Aug 2026 19:32:46 +0100
Message-Id: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUWTuQjFCrVxEXaZzEcdGUmVSU0
 rsb6+rx8eBfwViFDS7dCsovMSlTgz90EB9hyoxybwZy1LuBzmiLphAZZy3oPYaclXOoRbGtWNU
 PJnmzoR+dPyZy6TQQtNysvB+tdr39bcv45Fh/fdi2L8U3qd+MAAAA
X-Change-ID: 20260829-surface-pro-11-aggregator-registry-fixes-1b013f20f782
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028380; l=994;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=k0iTyq30Pts7oCqW5WqZ0ekJF2O8zcdRnmPhaFpT+eg=;
 b=X4V5bLZ/YK6DWtkEs2o5HFWma/eZpM8XtUfiAHiJBtwKd39/OH8dZWzMzuzwxTWAR9aYynq7F
 n6aKhz8/m3PAN/ofzdUYXoEwxGMvlf6DBR34ZoOYDuVxHdEiAtN6IvX
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

This series brings a handful of important fixes to the Surface
System Aggregator Module client device registry for the Surface Pro 11
(Qualcomm X1):

 - An unneeded driver was removed, silencing a dmesg error.
 - Tablet mode detection fixed by replacing KIP with POS driver.
 - Performance profile and fan support added.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
Dale Whinham (3):
      platform/surface: aggregator_registry: Remove sensors device for Surface Pro 11
      platform/surface: aggregator_registry: Fix tablet-mode detection on Surface Pro 11
      platform/surface: aggregator_registry: Add performance profile and fan support for Surface Pro 11

 drivers/platform/surface/surface_aggregator_registry.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 3eaac948bf4505bc7e3b12d3ccf4ad900e5df082
change-id: 20260829-surface-pro-11-aggregator-registry-fixes-1b013f20f782

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

