Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02BB47DD72
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031073; cv=none; b=PUrwc4kCaN+oycDtFJcF1Qmg7slGBjWQU/9o9iRtrN2R0sfYhLHmx3kwKkiREDqNX/qF5JZtx2/zWTnKrhgCIrusXWlVt7B6IfsAhSQxGrRLDzT9NrKfdi1WAxSfOJn0XyN9eJs47HGC0Bj0VXEKhyVhLNYAAtBsA0YVNucWFCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031073; c=relaxed/simple;
	bh=ITcMgYP7v9fOTOfQhMguiaZ1mzTkTpBxyKci6Lw2yDI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pKE7jP/uLS02DB6LpS2vPRt8eVECpAlxkswL7HS+zfeH3yO40tM9rziK+M7LEbRzu88sUwh2MNck0zPd6xTTX0fWNi//HWRMp08TNQ/Enr/rC0AsFeG2ilJ19/SgDbf/vCox2MuE8PiZ7nZGXoIuWADhh3wE+15hUJfw0l13ShA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFTdGr15; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFTdGr15"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c167c58f2so17635331cf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Aug 2026 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786031070; x=1786635870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nadhn0dZp0HQhq6EhwDAfh36+34Cj3LIMRMeGdDMOFs=;
        b=aFTdGr15R3gCF/EvLGu36SbVAxzCuzSAVAImzkSi0D5zwqAxh4IrO6TNpMOU81R884
         nrOQ/JpyTU8s7FYQjyCQPGdW9/uwwc1PNBwLJhXuyy+XiEp2KzuMPsXeCwlZkQwoY4bM
         crEMOOegmfhzZ7KsgkNTtBsgegqVqRL7hHPKyjyroyDCuqfPc2+Jj5VyVq8RV57JWnH/
         OKx2F9bAFE/VjYr6aquy++25rhzeYWji5HMPyamyguTSujcI1L9EdloUSRgUXQG2Nypg
         JAMLaUnB9Ivw05vGjRwTRLmhFSBkzeYWVxrS7z4HPUudSyk+ldXFt//FLlDwvGfwj9dz
         fd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786031070; x=1786635870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nadhn0dZp0HQhq6EhwDAfh36+34Cj3LIMRMeGdDMOFs=;
        b=gXRuG6wOpMvIN/D+2/yhdYmDbmwQpgCF39w7EORFmbYila4e968k2RkGnE4wiGAi5R
         9OidV0WtV6HXaOyx1Nu2YxMyPEzinZgxTR6wrRT+San9a9KeyVeWwRc1cihOq/Xkx0v7
         8+Oog2hWfwSuR7zWGB+C1XJ4iovREeW0jhBpWRs1sJ2Ja8R47Nj6IUSZnH5me3tYS0uo
         uZDrmVnoYL2Vn4urFxSPD77fj7DdJgREdTnI51i2aCY3TnTacCWMisvnTI7YgGXjXVGO
         ezbDLnigiqU9m7KwUUfywSDPf7g9wcnE4ATLxQnBgcxQtv+SWncg3s8GYRiehsQ392Ml
         OxRw==
X-Gm-Message-State: AOJu0YxewMfBnorYFVC1i0YdvQDbbc/mRrE1pkr+LMfYjxVbJmplJyYp
	e6Wb8jcb77hEWJmJvppKWCZm/OuxObK2WuGSJPl1pLu3hOQnmJd1BT+ZfqqJcgk6
X-Gm-Gg: AR+sD11+qjhhl0nJyh9DFw/+F3Hw6HBhI+f8hzjeWN7p/rPj2c35YhwKRBVZdg6AZE+
	OxAbUPgrb/ByCJUVE/PHol+kK48SL4jH2nByEbtSe0ljBbMcnoO9rZlnuasItFKzW/6ys5UdkMy
	dkqGbvGT4W4R19nBRZ5w3IJiPlWu00qkEyadoqMfSqhgVhuRYAgQ6YJ3ex1Dq8zJXyC2fATaQSJ
	ACw8WprlYIiexNadiKwooLIgTUxdrcH64IIXQXZk2J9zq9Ypfj0YmFl1VfhTeCH9T1r5zaxxk50
	4amax7YRkggKDznR2AI9rn5kQ6+MBlDYiAi806D6cP2r0vLMPxCCYNIXSIac6R3kCETOwcCOsfc
	ffOnxZqTAQfs3Wl2pr75kPoBuqVk6T4yM8X86lqRAGrme3kvfw6u/RsCB3eKy2zonDG0WE9Rksc
	eHs5REiyWvkPPd80mDNGg6fH1oJkjMZMv8Q6TQhmf5LP4mLZFGXOzOBhFcfFmRrVFuFGzk9ZFMS
	xlB6VjYwPt+Eb7J
X-Received: by 2002:a05:622a:2612:b0:529:e058:d185 with SMTP id d75a77b69052e-52ce6108b6fmr185947441cf.24.1786031070108;
        Thu, 06 Aug 2026 08:44:30 -0700 (PDT)
Received: from localhost.localdomain ([47.230.216.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908800cad1esm54647186d6.47.2026.08.06.08.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:44:29 -0700 (PDT)
From: Andrew Onyshchuk <andryk.rv@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Andrew Onyshchuk <andryk.rv@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting on Edge E330
Date: Thu,  6 Aug 2026 08:44:17 -0700
Message-Id: <20260806154417.618575-1-andryk.rv@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkPad Edge E330 with H3 firmware uses the non-standard EC fan
register block. Without a matching quirk, thinkpad_acpi reads the legacy
tachometer registers and reports 0 RPM.

Add the H3 BIOS family to TPACPI_FAN_NS so the driver reads the fan
period from EC register 0x95 using the existing non-standard reporting
path.

Tested on a ThinkPad Edge E330 with BIOS H3ET77WW and EC H3EC35WW.

Signed-off-by: Andrew Onyshchuk <andryk.rv@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 445e1403308e..cca76711c547 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -8840,6 +8840,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', 'T', TPACPI_FAN_NS),	/* 11e Gen5 GL */
 	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
 	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
+	TPACPI_Q_LNV('H', '3', TPACPI_FAN_NS),		/* Edge E330 */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
 	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */

base-commit: 0d839570765118029aa8bf4a95444c6a11aacf85
-- 
2.34.1

