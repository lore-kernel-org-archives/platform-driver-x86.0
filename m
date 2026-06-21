Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E35140D582
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782046937; cv=none; b=rijbnFgJmfMGCrif9qtQd9kcWNw3n2TGJ/ioSV6zUeglza4wrcJTEtJOyn//CkLQYXzuJ3GHHT6Vpp6UPX37lzM5CoMVX5kOXfaAwUVTLk8K+f+mNWppASlpq4ld2yBb2JVXXgBoNCxaH47563dKQb1BeAp5G9pSUDE+23tEuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782046937; c=relaxed/simple;
	bh=6YMB8rB3VrOd3VWGsvPab9XBKcfiUaVl2iQ67SE4Hdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cGFG3TOP91fAUDSpSR9ifx+jHg7X/OOIFhKzHnF6LBLL7AOTlaWjsG70WIviYfszB/lq0ZH2pYMgb0wibTe7fsrkBxcKGY8cKgRb2iQlawNlE+ZbHItRAveIchUpdTNfNsxONcH3O0vjD4XTgUttridutQJc7eSEdvcXh0VT1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCvjBC57; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCvjBC57"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-462342ac290so4001860f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782046934; x=1782651734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAGBSNxjzqlQfwUA1JEnqMXAToLnooPGs2/enhgnVGE=;
        b=PCvjBC57A+R413wmWRRfARr4H3nkgYkf7fSF5t0RWyX96syFphnQi3xe+KZfSAkFHS
         5qRw7TOghQH3yGlg5D8H1ZotOfzFGuz6Ix6cPRnrBl7dq/WNbKyY3INn3dact9WGApzz
         XPPQaL2/1zB8DmFCzfLoljXjZ/cN/PGWLX3dKyRTrSeTImwbKN8W+9lrZIqK0HKSDBYh
         oXcvyVME0d/DpKpDi4B7RbHXVLYX8esZ7LdTQFcfv54Q22QvUkGTfvFj40FCtTGr23RB
         Pdszqa5eKnt+PDVXazZ3Hli8KRQkzr/gWW7blq6sSFDkDGnUoB2tafeGJQGRnYiLE4h9
         jABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782046934; x=1782651734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAGBSNxjzqlQfwUA1JEnqMXAToLnooPGs2/enhgnVGE=;
        b=IyOKp9UnAJ4eMn87vZKTRDBdln0eCqMuzArARMS+Pwupx9IZ6rkHah6bsb+fkou6Vt
         SAaC5VBAlN9dtGzXXpbiihtlSH4ffrH7s1HbL7DJuCKtMiNNzptGJY+DJh0r2lCOojOp
         1GeVKSkrjf4vfDEhvSocOTXbVzb8DHu3czc6S+PYzs1JynZ9t+6eYqi+ik2mbBqpmYxt
         qLetQKuvi1wvunPNQFt/3qwZMlNVt58yWSGgSjmCaVLYxcbqjHQYYpRzEicR+B/RoP7y
         mtEydwx+UL/Xtb8XZ4gt7B1ztUWdd1ySacGgnWxI7LIqB24O0ZJk/sT25E4Xqgp3BZxq
         YtPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq29WImjqAVzU4T5Tfxlpqg2LUjVR32BggcIC5qfBhvqLF+YcHwshnp2YyuYRFmqQYFKH/y+YpLchFJjwflBgdPPMVr@vger.kernel.org
X-Gm-Message-State: AOJu0YxdCayQ1OHAnuqIEmyQJdzynJem/Vp7QylEbE3KFpAPXrQXhS0f
	9uA9Vo6izmpPAPFjpOMWi6m0OBjaCkQdAnGxeMi/T7gA6SV5Pjju5LdpieSq+iJwPp+Xmw==
X-Gm-Gg: AfdE7cnb7CGn2U6tbRnKvhsyaEmxc44+0sX0mwdai1Cle549HpAxxuUa7ClUrpoUU1J
	wNeJ+bNlLVD6/75EawbJ9bQsIa6JyFk7NGe5kzd5v7vU6wREmB8WH81rKOYIiYM96WMLAVSnq48
	AbItNL2cMwQQ86b6F4Gsx2JDBLpYqumXEjbkgafUykKqLdhfdhH35r7tihcSQHbDRLd1CxX94fH
	xiPNEN5lnoiO9lVU+cOr2YoMmuA4txhIe5r7JZYoXwZcHR+ENPmJkLpqyuZKxJt9gdqP/ZHVc/S
	BTRkflxDDz757Wjnt3uwvt64tnQm3lvw9OozQg0/k6N3Lz0LDTF4lqAHm9N7D+m8UNgxZxecxHi
	ZADpaf1DgwFmSU67pObmu6CQ+x9nErbQXSGJ/nMEaZI1Yu98XelRXqzp4FGLLKOwWVW92zpGz6j
	5zynY9YKqSnD4s+JYA+VzXly7uMI8s21fpvK2YpzodH9jJc+E82g==
X-Received: by 2002:a05:6000:228a:b0:460:1957:1b33 with SMTP id ffacd0b85a97d-4656bcc8fb0mr15683900f8f.3.1782046933431;
        Sun, 21 Jun 2026 06:02:13 -0700 (PDT)
Received: from avifenesh ([2a06:c701:4090:d700:b28e:e7d5:813e:761b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666678828dsm16658658f8f.19.2026.06.21.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:02:12 -0700 (PDT)
From: Avi Fenesh <aviarchi1994@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Luke D . Jones" <luke@ljones.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Fenesh <aviarchi1994@gmail.com>
Subject: [PATCH] platform/x86: asus-armoury: Add power limits for ROG Strix SCAR 16 (G635LX)
Date: Sun, 21 Jun 2026 16:02:04 +0300
Message-ID: <20260621130204.103566-1-aviarchi1994@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the AC and DC power limit definitions for the ASUS ROG Strix SCAR 16
2025 (G635LX), enabling the nv_tgp, nv_dynamic_boost and ppt_pl*_* tuning
attributes on this model. Without an entry in the power_limits table the
attributes are not exposed (has_valid_limit() returns false) and the
firmware power knobs cannot be controlled.

The G635LX ships an NVIDIA RTX 5090 Laptop GPU (150 W base TGP + 25 W
Dynamic Boost = 175 W max, per the ASUS specification) and an Intel Core
Ultra 9 275HX, matching the ROG Strix SCAR 18 (G835LW). The limits are
therefore taken from the G835LW sibling entry and the ASUS specification
rather than dumped from this board's firmware.

Testing on a G635LX confirmed the attributes populate with this entry and
that writing nv_dynamic_boost changes the measured GPU power draw
(~151 W at minimum, ~169 W at maximum during inference), i.e. the limits
reach firmware.

Signed-off-by: Avi Fenesh <aviarchi1994@gmail.com>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index c30d2b451..15584e775 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1840,6 +1840,35 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G635LX"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_def = 140,
+				.ppt_pl1_spl_max = 175,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 175,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 80,
+				.nv_tgp_max = 150,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 55,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 70,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G713PV"),
-- 
2.53.0

