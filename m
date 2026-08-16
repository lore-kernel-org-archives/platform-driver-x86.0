Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566AB3B9D8B
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786902539; cv=none; b=Es+3+dS+cgVLrEeZMK94vWw48bUPqq2kyKjsW2ZZi2j3WYruPYnwysEF4kqgthS1OWdy627LI9+hgQ/Zcnt6MwZbSHkD2O3xnXzV9da0p7KmhkLelA/052Ikt3pbzbwdOmvVIA27AdMdNGKGPHJi9NII61guXSMWwqY0s4gBJzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786902539; c=relaxed/simple;
	bh=dkyfmlrv2U8l41eahNDjXnFeSBEU+SHzZSUacw5lMCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b9kiNRFEBX88MKfD4QLCARSA/1LPDCDoTrpiHHnO8SQGdby3xPBSTBsj7j2W8ZPOuKLhrHR2lcSPM7rn163+sS2ZNGF2H2S6Gng5uz+CQSZuOtpygsdvS+ciQSJJjcfMx/doBJiigeqPEphB4lHwxBpT0htxNN2lvqBtYtsaqLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xv1zeH2I; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xv1zeH2I"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4813ea321cdso2378258f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786902536; x=1787507336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqfrNNM88KeTrt0mMwzmBk5MjM+BfAlC/S8oQvaz/B8=;
        b=Xv1zeH2IZQbVS1TI1Yn4hRsrViRQYeDvmksJGJK5me+P5bXtT0BQy0dk7XfDeXkOBA
         MCPUGCPhKwMXxuwZJO6Rpd2sUyHSd7W4jbLQ9wyHU/RfZc5D8y4g6q89Zii028QGqimi
         4Qrrb0KVFVyl0PgjyhrThuwahPAqfg2hw79AmO3bH/Mda61UkPcfol/HqnKxXZhTuYX/
         GY91fOdSLPmf3IgODxn/HrTRfd3pUMAqqz3JFOdSnTAjrTjxzbu904FJKKwoHqgi98is
         VKJstJeShkAxV9KDiZc4tsf7WwxG5XT5NtSi+StlLFX1999HS8CFu61F38k3zZGuRwNX
         OTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786902536; x=1787507336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqfrNNM88KeTrt0mMwzmBk5MjM+BfAlC/S8oQvaz/B8=;
        b=MM2gKQyOqvdzkMgvRmPhrbqjVnGFdS+I6Be5+w/bFQEDjFyCuUrmzfVlNzoRmgjSxS
         s/KMyVgNwxKpYC3eGqToyrxVp6OEyFnRWQE53VKy5qY92luOmMgYZtEkeb85q1BfAAEg
         hcAq33asfgQ4uyI1Imdl1gUO1Cfzjc84J13/8lyFHngXYGPE1UNAmZia0lKKH7GAt42H
         qOb1IAIaaiviZ3juo9hqvG5LZniYTluCWAPEelIamLJZfXzF9VMONF4NDAbjHQdZ+pFP
         OLdb4hHsM8/EQ8wAbE/FaZIfBKprKMQXQ5K1mHKty9/GT6jSnLZ4G+D7C2SxWu7v7996
         4TkA==
X-Forwarded-Encrypted: i=1; AHgh+Rod96PE/k1cEpDeMMPK0fTqXvS/A0s+Y8ChPwOuxo0rHaEE5mTB+3kLhsOSJmdjRv+C8Uptan0GiMCutejQkxgI99Wf@vger.kernel.org
X-Gm-Message-State: AOJu0YxUiGjrdp0JFeZ1fASI/PWrDYov4zcGdo17rs8KC7eoINtQKL3S
	wvDiFAKrtOMSNHeQodBGA5CCOxYMHi6D6qImNtis8WtrCx9L+AjXpnjm
X-Gm-Gg: AR+sD12tq7bBaN4Df1ZjmQiZzianKRa+Z0zAmageInI1YLnxPsOgtfZp8TtbwVVUU/+
	Ir+ZIBIiOC07KA4UkY0iwtr16DdevBMFV51th2vkEZHS1Ls3Zu6eUQ1Ix6X19Vbb85x66oDCajo
	k+r4iJPPtMtikEwj3zULwweI5esEwWq8OdX+zGht3MUSAuqSLtf8mC61pFekjz+neIyn727dd6H
	DCKWwO9XpbgDcyk7VZysJaf0Q+b35cu4ArbXtp1UUxdggkEgLNapCrOvXhA6fRNFF+dxF4K3wr4
	BbP/QAHZqnSFeJLpeKWKV/2VJGnp91psoSH84zwzL9/8flP4DDFNYAPpf1my/HLwlNVtZeL+RWv
	DK9Sk0yw4PzG0/+kC8+xTbKT+YOYG/yY2KGMSnS/rlv77jyBxvN09U7XZ9LljrE6eEHwe40qkiH
	WDCTCNqxPFkggbZHGNBxTJlHDEG/DRwGTU01XxQG1Wz2kYIsa/59iMxkL+yWzDTBVO
X-Received: by 2002:a05:6000:25f4:b0:480:b3:aaf4 with SMTP id ffacd0b85a97d-48160750343mr30794887f8f.4.1786902536407;
        Sun, 16 Aug 2026 10:48:56 -0700 (PDT)
Received: from tuf-arch ([197.52.219.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f229681sm21804564f8f.16.2026.08.16.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 10:48:55 -0700 (PDT)
From: AbdElRahman Soliman <abdelrahman7987@gmail.com>
To: denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AbdElRahman Soliman <abdelrahman7987@gmail.com>
Subject: [PATCH v2] platform/x86: asus-armoury: add support for FX517ZR
Date: Sun, 16 Aug 2026 20:41:18 +0300
Message-ID: <20260816174118.28012-1-abdelrahman7987@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI match and power-limit table entry for the ASUS TUF Dash F15
(2022), board FX517ZR, an Alder Lake + RTX 3070 laptop.

AC and DC min/max values for ppt_pl1_spl, ppt_pl2_sppt,
nv_dynamic_boost and nv_temp_target were referenced from ASUS Armoury
Crate's manual performance-tuning mode on Windows for this exact model.

Assisted-by: Claude:claude-sonnet-5

Signed-off-by: AbdElRahman Soliman <abdelrahman7987@gmail.com>
---
 drivers/platform/x86/asus-armoury.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index bc899bec7..46c308ba8 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -975,6 +975,32 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FX517ZR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 85,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 60,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FX607VU"),
-- 
2.55.0

