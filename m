Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52B28934F
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Jan 2026 05:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767937849; cv=none; b=WFR8RNeTdNOYtFvGZv7Ow9cpijI4zWhHFHccyji72WdKbTgHQhgu1RHutLlPq2ugLTgSffTyhcFTMsdDVlcYz3xeclh9MBTGrNFIvTnOJCrE7Son2fLap40DnQ3MLpoAlX5EL24baW9RSDiAoCPIGO6oqOZ2uBCUj1CJrZUE3fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767937849; c=relaxed/simple;
	bh=Iz2Ngl/ZU2C2eae4hX2+1JWGE8uU+tWLZ0YoZssB9fI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCHfEDh5DjIj9oqUWV/kAGCkEQTzrRfxem82C9/exxhwxaGUhZeT+wOb/D9ktDWpWDPJoUqAPGND+lt6UXUvrup0PPODIek21HQ+MF2+0o81juLEvSvSxqTwHAMIwQ3gP27KRHZB3S3G4o5LknK75qicSFgW5PTLNollCUk+akM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB4WQbWd; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB4WQbWd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso53173b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 21:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767937847; x=1768542647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmLcFRkMwJNd8pcIDXQ2SWBzaIhKz7gEyeY3fPwhyHg=;
        b=dB4WQbWduT7jJwkcqs3aovsuXdx9gWWCNC3UjWZE86l1CLkUC/kDpw7B/S913wrWmw
         trpaEj9WXqgXQfRLcPaSNzXYbiVD+0Eb0otucUb1qRDjZYrKqtURi3ogOppLAeJPCuMn
         Uw1Y/G/S1Zw8AfBn6qpQQr1T7af8h+Al+mFMjVnM4FKQ9LN9cU9bcGXp+gfvhjwoSnxc
         79xW88sdLJKux0mGaYY9yI+l670Wa5ei80lrxCsRjHtX/N971ZMeBvbQ2cZpagEWOgWf
         tHJcKpldSVmhXDxYBqh7qzkuxDLB9/jewgmAPg/kr/7OP2b5IyGZ9BeZdmb8YHbg0D5i
         SuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767937847; x=1768542647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmLcFRkMwJNd8pcIDXQ2SWBzaIhKz7gEyeY3fPwhyHg=;
        b=ni2wOYQvwKvooL17SQIXX5Dp23fH09L7XuWaWwaWdPHzB+JCJ05ahTiF5MErw0XlVq
         dlxvnU4Bz8gKjDb6WjKlchYvoCJ15BnSQv41A/MxWFFChlmidNRtmdj9/fWhEv317BlA
         h78A4bc5rH8PRU0+MuxogsMc7pVyytApYfijjoMvpZapPDDW2MwCXGupYta25ry18oet
         RHGtD31vKT5zlp5hzoZg6fdBEoi1fFVVIGBHA9/0CIEsXjh0MOFNbnRdTPKYeiEzFSdt
         321TE7JzWdFlFi+fvgrOnpUlAtaYMOf+EochC7ym/+Ry8ZyLhHl1Jd4rGzv1CdhxKVYr
         4gAA==
X-Gm-Message-State: AOJu0YwyzGib8WMdiEtVjeqHLnit+kSrx0dfIt4o1OFfn5JV3sHgipbJ
	t8VMp5gE+GztH4eSpcAVY6omUrSGoymQM+38MxPV8cYe4PjAC8tUVi1+
X-Gm-Gg: AY/fxX4yniVtrZ6rRG0YdDdn5c3CP2/iKIn8B/Uy9ULqBl+LEtZUOYL8WzcrBgYZmM4
	zka2qPXOCbCF7kWlpkCjmSLY/eEYmCAFpRAALAW97egUUVjuSOb571BvDVN8YdJpKxc+1cw74Nn
	fqRrNLIgSdiRURSro96UCIhe/MVMCarvBBPxgXTpCk+YtfXwVvtYcWjHMvXE/X70kuoLwyTWWZP
	G9zNYjmw3+Tb5PrjR6gVQqvm+Lvi73C85YJqt6pH2IfhCXHY2CZVwVga+2W+PR2U1JrCWcX1FRQ
	fYiEqY/C9sayP/uHED1Cuf9WSWUYns2zA9F1vuFEFoeXFPIHkrocRh2sj2X4QJGCsBc/txMdJJ/
	qK6AVyrrqpsAz5fHtPMTld2bOyCuxLFeqnHFEnZ+UxTK98tnbvH9RijmTERv1uOn0cn4vqEeDJ4
	JNPnOmIf7stXrhLgY=
X-Google-Smtp-Source: AGHT+IH+XsDjlwplJjnuxnN0rT7/5x98cLp9wa1FcLxCt/KZ63dnUTdSSN8m82L/UY4MfgUevRqt+w==
X-Received: by 2002:a05:6a20:a127:b0:33f:4e3d:afff with SMTP id adf61e73a8af0-3898f8ddc8fmr7865308637.14.1767937847165;
        Thu, 08 Jan 2026 21:50:47 -0800 (PST)
Received: from CachyOS-G513QY ([2409:40f2:36:142:9f1f:b887:1c81:44e5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc05cd87asm9423034a12.15.2026.01.08.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 21:50:46 -0800 (PST)
From: Shresth Sarthak Awasthi <bengdeeba@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shresth Sarthak Awasthi <bengdeeba@gmail.com>
Subject: [PATCH] platform/x86: asus-armoury: Add power limits for Asus G513QY
Date: Fri,  9 Jan 2026 11:20:26 +0530
Message-ID: <20260109055026.18593-1-bengdeeba@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the DMI entry and power limits for the Asus ROG Strix G15
Advantage Edition (G513QY). This laptop requires manual fan curves
and specific APU/Platform PPT limits.

Signed-off-by: Shresth Sarthak Awasthi <bengdeeba@gmail.com>
---
 drivers/platform/x86/asus-armoury.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 3ac7aea37838..c94da70de87f 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1316,6 +1316,22 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G513QY"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				/* Advantage Edition Laptop, no PL1 or PL2 limits */
+				.ppt_apu_sppt_min = 15,
+				.ppt_apu_sppt_max = 100,
+				.ppt_platform_sppt_min = 190,
+				.ppt_platform_sppt_max = 190,
+			},
+			.dc_data = NULL,
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G513R"),
-- 
2.52.0

