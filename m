Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332535B13F
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Jan 2026 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963974; cv=none; b=cGo4HrkX4dk6GqSA2PXiz/IkZXPxpq4DxDox1ldMrzr6bwZeedIlplK4zD37S/W+Hi1z42XHr7PTftqGjVO4Vqmaq49Sxbsc+slYQOYQwdHBzeX4NQu5r93Yt6S9OwRX4sqerp17zytk7vr+BJDVkJ3hQntyLxKGjBRkeSuqVIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963974; c=relaxed/simple;
	bh=pz0DZbvDntyKvROA6tUEbHiYYLi2Y8QPku1FXmsSHUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3l2Zwll8Z4c42TMHHDERa/ub4i1FL7SqbWmEJwvtebKrX+Wap8vGhlM+MaCb2DJzaBMwTpy0y6fVA7Cru0n2wdCtVotRMrVVREubqhTFSLpP3+KYtv3Qd7nYF1gDFEiM9IoNnSuvzP63kgXuMSh5lE2qrAdh9VS3sAsPcBmVwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMlGNBCG; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMlGNBCG"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso222382b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Jan 2026 05:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767963973; x=1768568773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ng03cgJYVjTeUA4uTAAYxETfgYhvuVnC7MiEJVAAhM=;
        b=PMlGNBCGryp2uiatMV70lqq2uEUW3XAKZ/jEorpzuq5XDX9VEMK4nWovqHHUpSi0LP
         acBg/m7VLD4al1KV5BqHuLBZW6q6JHs36dXAnmrtRaFcGpQi0gLnXDigxDv0hpySAwmp
         J+X77yDdGyCdy482xruLT7DSC+LhobIJpf2FReh9xbfqj5tLy3yNZxRJ9qZ9vBHeYh2u
         cUhi0IWcVLSo7hiEYPbngzfY82vDckReTHFVZzSiYoy/4oTO2V6stGmw7NnSPAyjvsaC
         gRiM8sMHcmjEE9r2y0k25XQDkBNSYh84ajljoG6b43z461ZkdnZIAOyZP0AWFtcazIAL
         +dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963973; x=1768568773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ng03cgJYVjTeUA4uTAAYxETfgYhvuVnC7MiEJVAAhM=;
        b=fhy6sr626YDaCNb3+MBA+Y7XYtbxwhnU2uhIeoKY3nLsg3hcuWoGmecJd/I/ec83db
         oxOuIDtXGUvX/WxAhZk+vIsENFGIIQBJz43/rqrkrR52ObFB+2BB8phaVi17yVDvhKCu
         8YUwIyN8BOT8mWt3tdALm6tAA0udYsB/0jFgi3VD7tkBGY1QmMggWB13Rs7Nem33WZdZ
         Dp28HEP+SSZlTw0D3BAeejrqXIjXmFJwi8p7bRw7XuP9YwagkxVM4Sjijk0211FMYk0R
         v2hAXLbquoEiZAWOHKqAFhqfBQAk+FcKlbKTgE9OuuOUiWnFUyujbF5FOJ3mpYfsoeIs
         ktkg==
X-Gm-Message-State: AOJu0YygtgV/l0MZcmOLQW7lPJDRTs5gQdZ7lF9pGG0tPAUoXl4vEXOo
	p4kW+vBUWfv6PGvZzOrHaDlEFp6DuSO2FhQIDe6+2Brq2kjoEKFb+7r/P6JHAA==
X-Gm-Gg: AY/fxX6YbiXQLnL5oirtu+uNk05/jIdRCnGpYnH0pp1CJ3lPSbfnd+zuAZPHOlqbfC0
	kSNIlXwIlbE3gmCWkAiSOEuNaO0buxGVeXez1QnhSP39ZEbfJKaMDML4Hz9JJ8P7HPNdz9a6/Gf
	9H3i/rpJ4uyZBhW/qaPRLjaP+0N9W2RD4e9qPLIRGPL8jUAmfUhRIIpQLYK50Hq/+Vm5U9VkD99
	peCspaa4rYTqjSmmFbLbwEu5TmMh4CHslaEmxjVoTkRIJc87Iuw05H+bpVbyZgmofilLAl3ibZU
	aGce487jT+x+NnBqfh4giYEQRa5M+WH8JrmFEKCWwXjxf6Ue3a54sl1VCfL1PX1Bw9vCwaw+Vr4
	ZsCLqo90BYgrQHYs4nA0QoDu7gJADY5GZ3ol9qGCZjcdV7H848MuWDeqNBNJl63TnRW0lEO46kf
	xYk+dPZX9UNsSWUnaeg/3cWYXV+yzrbDSAkR0=
X-Google-Smtp-Source: AGHT+IF90SDIpfHVVLRB4vRmxrthFz97ww9vGImuoEdn7l0ysbKxAcpNfhAJ/eBg+EiKIYmZ4sgImQ==
X-Received: by 2002:a05:6a00:4512:b0:7b8:ac7f:5955 with SMTP id d2e1a72fcca58-81b7dc6206bmr8438096b3a.17.1767963972574;
        Fri, 09 Jan 2026 05:06:12 -0800 (PST)
Received: from CachyOS-G513QY ([2409:40f2:36:142:1ce:dda7:a9ca:7cd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm10419553b3a.22.2026.01.09.05.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:06:12 -0800 (PST)
From: Shresth Sarthak Awasthi <bengdeeba@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shresth Sarthak Awasthi <bengdeeba@gmail.com>
Subject: [PATCH v2] platform/x86: asus-armoury: Add power limits for Asus G513QY
Date: Fri,  9 Jan 2026 18:35:57 +0530
Message-ID: <20260109130557.78720-1-bengdeeba@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109055026.18593-1-bengdeeba@gmail.com>
References: <20260109055026.18593-1-bengdeeba@gmail.com>
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
Changes in v2:
 - Fixed typo in ppt_platform_sppt_min (changed 190 to 70).

 drivers/platform/x86/asus-armoury.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 3ac7aea37838..6f2c18a2d93d 100644
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
+				.ppt_platform_sppt_min = 70,
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

