Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470647D46D
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828705; cv=none; b=MxpVBwIHSVK/V8wxG2BmypLYDlMb/1Qy/2Z2zMcoe44Y3CEFlZ8xOePgHZdxr2CLkQ0YjTcCDeCxEECU7b1X+1ogj4Uyd7dmvW9LqXSS9oZl8s828MUFviW7DCFCBduffd3YEdBOFKA0s28rQbe0FsLaRAe6j1E4VXFNr3yY6nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828705; c=relaxed/simple;
	bh=DhHwGqrmGF5yoSfq33ncZPIK0I25V+MMj8wEA5tVs7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DylC1B3QCZEV056xF283/k/zTN/lG0VNhh3wxOsfWcB8BGP04kvu2XJpFVsidYBNswBKVcgNvj4cK710uIHUHzhySmi1OLOEV5xzBw4pzeYoAt3Vy8iEMRlIB5WmqqfEaXs7Dlb/VSnkAHXUap1hTmLuNZ0hB8c/LWfPYoAH1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3QBjzE7; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3QBjzE7"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb85186d43so621192a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 10:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828698; x=1785433498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvfaHJc4QvAMf7k6rlHFWVA5aGyrsoO8Rgjrzyxwtm4=;
        b=e3QBjzE7BydS0iXxp0Z4kEZomNpA4AkgeELt4lsAuk/gSXDcmtfkeb6fvDXFarCp8i
         KQFyPjjAQDutuoaDU+xIzYc8Jbvp88Q8F8WVgDKkXy2etF1PwnhJJslKDY/UTc1iSnk7
         pLOPDbKfwN9BdDtKkpX8heUVewEGLqHAU746WE9jsYSa6h4+MVFpez3MAmWmrBQV6eWO
         UbbCiCEHny5xoCBYBw9CmKDZnQZAI/tMOcT4XN0czMjZ/VF5DB67iHglgO0QjIuu9+mV
         uEtoonBOuNxuLdQf2jr+O/shxD1KCCcmQqif8W166HzrlTcccroh29t+WQZevqG0fuQy
         d5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828698; x=1785433498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvfaHJc4QvAMf7k6rlHFWVA5aGyrsoO8Rgjrzyxwtm4=;
        b=oEk2b9T/EfCkUqBkZmIbBJfA0iodkPcnuslAYhR24tdkq6aYDGT2ZGNJMPG0/i25In
         J0qVo1YdoqQ9RwC1oSHQcDEYgrDSWT+0xj5qP/D8VyRvFSXfw7bCbrppDuBx28Bo6Xlo
         bJI8MqdCCMI0q84stEqa4ywUomkk3cMOwFtZ44IS+Wxa4aVxdmEv+L+ijkLTZBtw0Wp3
         uwIOsNfg4AGBfrqMVMxzOR0LKRQ/mzkCJaOOrx3W5ZMyK+9XyAT2Xomo/q6Nc473WudK
         VYQEqklIbKxruPy9GGLOFTZp7VeUuZpPKUNB7FMQZmFii0q3iankhvoNMqebaXE8VOsZ
         7YwQ==
X-Gm-Message-State: AOJu0YwhoFj9wq7BFtGBXksVfgi1PiP1Jr/DH/unL8ankgbSLi3shsLX
	pB8D+aYwwhJP2J1Z7U70YlXgTlSNYUHArytuSLfg2+/5canmW43pU4an
X-Gm-Gg: AR+sD125XJq9QImfuLo+HpW9B1LLvCbCi7BAWaxqlpXKQxSEliwRUxSl12Qu+lbaN2A
	fClf5cCk274eMw5T8fRQT4aIycNI9lThamvpcARmuBPrMGhb3GEbBQ7PzghRH2cCcN+tx8SDI6Q
	Qtk4TNjSRdnz5KO5eFkotgetirchASrUiABcbteKy17Z0lOziKx9VmimgrkY5OfiPD8mJvqfnYr
	MgA+w7QhlNge0rRnOINNZd4hLMGzsfV3MHV/r3h3WKGHcmfZQbhuP4efyf+vTg2kJtt9AD3sFwh
	YMZBVl/30t+H2/4v7rxxD4gAYP+5vPF+W1tw8k/r4DM2rip+fN5iiJZHLYiGFnP53/eNjFxE4o5
	ahFXiz9NQQqwiIMWndC8jNrtdbDiDuAjj9BbmM0Qb5MTugLcOVQBodGY+9M8OGmls1nQZb95vld
	qRA6ISsPPYXJS6fa+c+noyUnkuGB0FwvUkBWAOz8smCIa9JkKSb/GsZlYRXyQ=
X-Received: by 2002:a05:6a21:6e83:b0:3c0:adec:b3bd with SMTP id adf61e73a8af0-3c44b15390cmr4299622637.49.1784828698013;
        Thu, 23 Jul 2026 10:44:58 -0700 (PDT)
Received: from archlinux ([2409:40d5:400:8351:427e:e1d5:71a3:2dff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm22601223eec.2.2026.07.23.10.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:44:57 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8BA9 thermal profile support
Date: Thu, 23 Jul 2026 23:14:43 +0530
Message-ID: <20260723174443.26906-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN 16-wd0xxx (board ID: 8BA9) has the same WMI interface
as other Victus S boards, but requires quirks for correctly
switching thermal profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table
and map it to omen_v1_thermal_params.

Without this entry, platform profile switching is unavailable,
preventing fan RPM reporting and controlling.

Tested on:
  HP OMEN 16-wd0012TX
  DMI Board Name: 8BA9

It has been confirmed that the platform profile is registered
successfully, and the fan RPMs are readable and controllable.

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8..052c64aa0 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -201,6 +201,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
 		.driver_data = (void *)&omen_v1_legacy_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BA9") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
 		.driver_data = (void *)&omen_v1_thermal_params,
-- 
2.55.0

