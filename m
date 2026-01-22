Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD070436350
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083614; cv=none; b=Ia95HyrSoOdppGmPkGolnWqmGUIrD1yeHJ6dqUCscb5ItOcPYiuuUheDhkO2czHISbSue+9FigKqRxL48iycmFacZGCw193BaZpuklzWv/CGtPlL07DRpGGLmCbFm7w1GaiwbZQTJ+R5WSLa70eeKnBA4NpqqIbeFMu8ZARvIl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083614; c=relaxed/simple;
	bh=H5bfxjxOOybJxC9nva4c47n9uGAjokywgP+DOLiXOuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=owkI1A4JtNcIa/DClc1baOZtu+ijtrKitEPOK4rR+U4NSfjZQg/8GgYWbAG38/D3KSVwT6jPY8Sj1dcGAThDQgqbw6A6ccxoSHcbLnj2ocdLid1Fcgk6ZBLLbaqjLZt0fZ/pLSJuX8T/hU6zkTJZTbg8XGClOkEAD0m9LqQwEO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFGfIExP; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFGfIExP"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-121bf277922so1501968c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 04:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769083612; x=1769688412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffs+w4DscJyBQZUlTQJL5EGY4HnsBlHJpHVONByfr1M=;
        b=XFGfIExPDPuA9x5nzPU2Hi8W6tRa0gDmNYBx560uR2mwno0XZEgIGQ79TapC/RNxia
         J9bXLL6QiHIFN6jltqmPr9ULz3vz8rwI24ltdrHnDn48FVD0m/HTEMgMNenAi2FbobW6
         13rf+ogLxqtY5GJUhmfF2L5drLMu98oN0QZrAjSrIExLpNVFYB7BJN6sW8pvN+A3GGbe
         qJ33dk8/ETr53jCfY+DhtOmRYtnu7E1dTJs0b0qcIIsqHqX7PAAPTtVA/D4kdo6lI0sm
         yAhkkNX0PXoZFzegsRzjJOd/cDRvgp3kf588OM/Gcg2M5a0P9T0ZNrM4MazO1N6i+rB8
         GA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769083612; x=1769688412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffs+w4DscJyBQZUlTQJL5EGY4HnsBlHJpHVONByfr1M=;
        b=Pz+PAD/i6uuR1O4xldoZxR8OaZiOazHTHjiGfrLgYYhn7//wgnAp+YVg5BLbtuAuIa
         LlopCBTyzqrgjxUXQZIJCrXlfqRFUEASUydpsOWt9ZYH269+mc4l/q2d41UkzM43jf1E
         4Kpkbkre9CvnIfmeKB+OlQcmIdjyxgA/Dk3zCQEXZDbOi62i1RVbXWurIXyfM44e2IfK
         KNr3nHt0TKDInohxD/ST59+PG/d8zVFnVN/M13Qvl3bqjJfQi0QlbymAHgTsH8/4e350
         xqCpmEp9uLoARscWuw8nSLLQI2eDssU9OEZM/TqxAIPRiIERRwJQ9cKMOpqe2WNHqWAY
         Z67Q==
X-Gm-Message-State: AOJu0Yy1ADTLaSruwoAU5WUmAqEaaurNbl8nADTaslik+f+cC3OmW0Is
	OHRfkx5M7zoSj/d4sQ/8WX/w5B+eOan65veVNP2I/z6NmnzowDcGxUFG
X-Gm-Gg: AZuq6aJkdKrSBRxZ1fIfQOjIGeCqrtXpVV8AGJDV1dDYslNvLF6Ym8WPoMMOb3FIWxA
	eNypK7hKIcPF2uUKaRHeQn4PeN4mcRoYEXydPg5zT3nduugimpMwPi2FqtguQibziUzaKma2oLw
	Jas6CPzFZl5+Z2GDOfEDpKWsLyOd6TBFH9CQ2Lttul9TZCq3yX1o8jtU8kDGVKUqIm4VMdFRC5+
	z7O1zIE9kftT4/szJVFoMWXjMmh0Qn/0lVA/3NlPFYJOtVV7gYmWnc3VAVGd/sSMQJtgNKJU07+
	RbeAksiQt88MI7Kukb/pKVAJBs030CLhrSt9AlRbWz8aw9a/dwhQioK/sjAl8dMWPz4CgqxWMTB
	zgm8BrfhlgqGRLkIA9XIxOI3I/KSJAPucgrCPAiBC+2reA2ZEtqK4PkcKtGvd1+HiqTmVM3XvMG
	Qi47YRBjSSt8jQ/GeN6N0KEPdzkC/vL5HtE1WFL9/wO6TLT9LwtEiNMW0ifqPoJuh+
X-Received: by 2002:a05:7022:f96:b0:11b:65e:f35 with SMTP id a92af1059eb24-1244b3050f4mr11778020c88.7.1769083611830;
        Thu, 22 Jan 2026 04:06:51 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.213.30.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm30297416c88.7.2026.01.22.04.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:06:51 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gongqi <550230171@qq.com>
Subject: [PATCH 3/4] platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 20:06:47 +0800
Message-ID: <20260122120647.3471893-1-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: gongqi <550230171@qq.com>

The MECHREVO Wujie 15X Pro suffers from spurious IRQ issues related to the AMD PMC. Add it to the quirk list to use the spurious_8042 fix.
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 404e62ad293a9..ed285afaf9b0d 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -302,6 +302,13 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		}
 	},
+	{
+		.ident = "MECHREVO Wujie 15X Pro",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		}
+	},
 	{}
 };
 
-- 
2.43.0

