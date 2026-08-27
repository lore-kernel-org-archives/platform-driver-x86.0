Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE18C477995
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843517; cv=none; b=mcZNQVDOJT7wW57Xl78qeWXHFDoJ+z5iZJI6gQjpdm+aW+ghydoI0iM8CIwTv0NM1Udq5bL72ZK5Cd9idVVHdkEBhDyM62fdao7woVCSjzenCUzzAdnRVs0dbmQBAtGv8mmzxMw5JXZCmMYc84tlI9/HFFRvT+oVyR7s8wY8RF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843517; c=relaxed/simple;
	bh=TS8uJOxY0VqqIlMJUo9bqOEciSpsr3A5gB1Tj/EyK2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Arq6DvBpUKLpmwXUiUtjOF+VX+Np8d7X6tJAD0sF/mrslDUOHnKiziTYRP9xrv18YyzpPVI4c2evXLZzB3kfrxDwGq7UkZaL/ufihJ+jZN5m8wC12nUghfSfiZu14DrC6EGqZxGCWQxdwhaTUQr27TjHpOrmNif4q8a0riiIIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3IsbMW8; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3IsbMW8"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f48c750afcso2526479a34.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843515; x=1788448315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmdIKvxkFSGNeSljb2NxmA94mTGO/+oX2AMXwxdIcUM=;
        b=F3IsbMW82AWwTL6Ogw7yy3cMqU1FarlbaDJqCntwBRZPrS2nrWEMCHDBZ409RBXS50
         vHry3QRzxVfsjR5+mKywBY+inKv3cyFkVTHPOQbJa9UjZnMucHt7NKVybUyNPpcEKwvU
         RrxuKT9oDS5m8G6flKN5PcvJYUY2YzltsvpMcOKP5H03aCj6Oboza4vcTctlhcy0oFix
         mkqbv178fEg9bCnaKam7fSqrjGAogjP3wVPaDCTveUQV2j+OpUNCY3TbtpWjEo4F6vO+
         lmHBeXurxDpyQdQmbYT3rZ7zaVoexkZX/UPPefzSnHBd9tpCjlpf6Kszk542SvhB0ueK
         0yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843515; x=1788448315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmdIKvxkFSGNeSljb2NxmA94mTGO/+oX2AMXwxdIcUM=;
        b=jKS5ecxyieulyHi3827xcrBrE++FwOfrNLehAy73DgpZEwe+GE4ebLzDoTlnc5HcCd
         Xy/T5c8q7J3G73P2PXFv86zm3CwARTQpyV9EpEU+eryLXEK9Tz6NoxNG/Ic3BFK3VHTR
         Kp+Fv1591vuPSJs3GzEUsLS57pQCVRC/YfFAc1zMjSZIuEXTNzsQ3Y+HaFDhlXLQ3P23
         ePGn/A1vH/QEwOHOUtqA4yxrEVTD6WTL5HkhRCpsXiAE4TTZdc6mwk2Sk3HwGgYXcxsZ
         LQkvjx/eYs1nvDqeLON57drkeAOJ0I6FxDgcTBn64nDutKxnuGfkfSKOgUaFxtOOVMB0
         mn2A==
X-Gm-Message-State: AFuF++n1hAYPd64Pb4zfoWeAJHX6q+bBbhMtHITkiytMuy85sCJMbjQW
	NSkLvCHx98YlZFsQZTRIMilBiwbpApeWa+ZlDuTG4PL7K1AHY8r3l0vo
X-Gm-Gg: AR+sD12Y8ZeHu7pHyYDsq2TjlJjVzW/1zoTwEloD0aPfKhrPjrE6zvW85/2oD70zgrN
	ByU2fhN9oCae0L+RXE5C5s3xvePFxg1O4hNbiXwnsFbmTzzHcqloLV/ygexr/bUuZdLZdycpyMj
	WpvzVtnX2J/QXlHDYCZYLphcQqcT8LnIuvsaCWXU4s/lPER/EQPMAnr/A97bhr+KMxiHZH9R1dK
	cOQzjDbIy+OPLOPmons9iTa9U/K3qkFnk/qssC9/kfTtc8k6aPxQUwKjwmK4WkAnry/31WX9ow1
	UXgvQFOr6nAf8WsY/c0lpVoJQRrxclms8bwrxU0ent+eBfWLfB583NBu8/J1uTJQvAm/CJkBNOx
	uKFfUTjH6x4K6cqxj+l2U0G4XYMJumKNK0b26ukHi/Nz6B7NwlCGmIZeXsphM/JBvVpsVHeljF8
	ENcf7aonGhqxDUZUl2CoYDHNWXg37onCcFhmbcTDHo63HTU8MyKcxkbyZlrVFSOZmpslDShVZOj
	2FVAYS+gdQIPHvbhAHqxQxljegCMt9xdCY=
X-Received: by 2002:a05:6820:829:b0:6b1:b771:bc43 with SMTP id 006d021491bc7-6b1b771bccfmr4253535eaf.23.1787843514529;
        Thu, 27 Aug 2026 08:11:54 -0700 (PDT)
Received: from archlinux ([2409:40d5:415:fb30:8fb3:a7e9:62b3:e2c9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f47d8csm17142074c88.8.2026.08.27.08.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:11:54 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>,
	Otoniel Matute <otonielgrang@users.noreply.github.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D40 thermal profile support
Date: Thu, 27 Aug 2026 20:40:18 +0530
Message-ID: <20260827151018.25991-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN Slim 16t-an000 (board ID: 8D40) uses the existing
OMEN v1 WMI interface but does not use the standard EC thermal
profile parameters.

Furthermore, it is the closest sibling of board 8D41 and 8D42,
which are already included in the table with
omen_v1_no_ec_board_params.

Add the DMI board name to hp_wmi_feature_boards[] and map it to
omen_v1_no_ec_board_params.

This enables the existing board-specific handling for 8D40,
including platform profile and fan control support.

Link: https://github.com/CachyOS/kernel-patches/issues/157

Tested-by: Otoniel Matute <otonielgrang@users.noreply.github.com>
Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6ecc033e5af3..fba6d202672a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -323,6 +323,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D40") },
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
-- 
2.55.0

