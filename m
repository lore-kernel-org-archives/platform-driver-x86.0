Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643896;
	b=k/KlBiMHN63EYpq4aHDvIRbz0Nc08bO8nWOps/Yirzl31Ibs+3th8f0gyfQISjilRrOf
	 FYxr4eaYBQjWBERursuLM05sE63VIXshqbX+bxV2WkPE4ntZ1rQk0CkrPX0OF3fPBYUee
	 Zy2kCXB9wISKBfBMzsAvfsY9KRXdjhJ+NsYomZ2PIKVtnNMsWea/iC4x88irahMfzM2D8
	 joPPdJukBxM6ivv05X6AZB+Yo6K86vpJUbzk1fgDoE9f5znD9Wb7c5QrmhgcIyKrtQTkO
	 ZeyQpcqOj+rU6wkexpr0Idq6fBaUlbQne2yZ9gMV3iWulcS3XLc6fWe760CgngsRncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OOGMcpRscnB5zpQyjujbICDtzLr0MBrEJ9VDi4/JVl0=;
	b=U5/YPGB+b5sQZwMgVuSc/7MzxsNEtcZ9sBVgfxquJoTrFJzmAjh/u3DMCTyOf7r3UR2a
	 UuRwRcLkHPoFY26NNtz6fuLuXgKpsDG9RIgOPjaxOX0L7uruCw7kSl+m82uV/R2V3w5yf
	 udWHsMaaMCuk1P5BFM+l/+v6vlMp+oa5xnb5L6QP5JlvxJFRmCjshcAoXU8cpQ5UHFBoz
	 SxnonUnacjuKRgZsOiocOy1F5BIz29iKzusGWWfv9Fs8i6w5PWJQ8w2e2JoJdryrTHHDw
	 Wj28zMtu96pVsOaet9WuGIafbtHKzWWjWKnZutKmDR+PX9mheNYnzyKqjDFWueK+9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yDlzHdhA;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C01606A32C
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 21:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C01606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yDlzHdhA
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f01f296937so48900555ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 13:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643895; x=1796248695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOGMcpRscnB5zpQyjujbICDtzLr0MBrEJ9VDi4/JVl0=;
        b=yDlzHdhAJVGVrDiaX2oqMTi0zvNl9pb30GBAtz68OThzpfQFvs2K34+/R1Qp/LdETy
         TswJqqabd0Ont/FKq4sAX7A855/Om4XHN/j94RlzwzN6rCC9cI5Cer2ZK46iHjsuW10E
         TWz9rTOOAGWgYSHi72B5XVJjBjR4IljR5L+sRCeIgrHxLEaU7CNxYTmfVnBZrSlCE8cW
         prBZhV4PFQ4rW+HsfDERKM3ldvuoDowTbjlvZDZxgeV7tEQOgRAHcvneQNV2tmr8f1eX
         02Lk4/gMhfCw5qMl3Mh1Qz/uGdQ1aIe2qU7HxSh/6Lsa/YVE/c38RqyddL0rF3WMTq6Z
         tT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643895; x=1796248695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOGMcpRscnB5zpQyjujbICDtzLr0MBrEJ9VDi4/JVl0=;
        b=LkGaJhnwhcRga6yg6+vIt+Welh+QlL34PVVnBIaWpdVBjJwEPmPKILDXAv2V8CfJ2e
         M7O20Pv12gnyGlv4d95xWO3bsxVyKCHyv+HLlQB1XRIFgXD0T2khripGat6RSUI10u7A
         LtD16r0eTwHf79FH9PmRPMTBXCLlXcwFU/ilWcjkWsG9f2o1RJ2Fjo/eVt1rWiryYwyv
         4fDjHC5VzsxYDCuTG5/zyuSSrC1eaXXDzVnI+hIqEGhgHbpGAQncq/tjDGzGJSiLUjQk
         P2ZMCjWO9TX5Ds6vzNNL2Q5gomywOA4aSBSPTzTe773ez0r8hoTy2tprmsId9aEoepkr
         zTxQ==
X-Forwarded-Encrypted: i=1; AL+hErH+OiUxcRCCpKDmROuGIeZiNPXQ1Q/tVahXD5nuZFC2ExMF7zoJP4a7+ZhgotlqP1Y27YWleX+D0K3UCcRqg7x3Ym4L@vger.kernel.org
X-Gm-Message-State: APuU4Z+UGTOBkXiATfz4pCyiD8oK4V2tJlR+9DnA5yF1NsCeMYBdnnES
	m7/DxwH8ghVbd7x7F04ZSOMyyymB3X82HDKRhlrRRd7qsOV9/j3Y0ej0
X-Gm-Gg: AZFdTZczxSOVDyBBUK59futfHkXw3Afmowd6lZBoMDhdtyvd7FFc3aFIra0R6pTGGvo
	7OXk7jJTUPgProHUZ9ugwUYQhBgoXARCgXUrzEVPMuu3w1m4HAqRbpt5qBU5jF2NDCpnIeAXowB
	otUzJKuOsxdmUrH9G3nZYLWDuojPOxHKJAY+/3rG17Tg0/J7ujDUXbLcJAVTObvhj8G6twN8NMx
	M9XpfocANJhHLO/5ypOdzb6tGe+Iy/0ENtDELqWMhVdxfXH6UjLIAyYNvUugq1eQ1K0kGYsawW5
	lE0o/1Y2u3aDNiEFvP8tnP1AsW+j7vkqCzMfpDjrB1sD48IHy0H5w1XjT6PWKIji8g3WCtrkwi+
	4H22texQ8+FatHJUVlQdRTZ7nRw+UoHK/ZgiZPOX3cCBQNPnjnzSzKbAMvKrig1tU1H3S1ba4QM
	+te1Y1PzTvm2X62tXelc0Rob4zZWcbN6S8tv3PXvaXytSRnt70HvfwBKX81Fc1BoUCwa39E1EYd
	Ajs0kis4zLiAX6FWayvti6CVtxeH8KO/F11qHA0RJDLXdLySmhiLKs3JEjuCtnuGYBSI4xWYspk
	32rEnrRXhU3yfGqdwu8kYe6kG+7i74bKc+sYkhv0FoIeER/jmpS5IZS4GZMvOeAtlF0dM2LUgkp
	idvoDtyEdV3fRctHv2fVjEvuYhhgiUF5PfhZPBexaW7M=
X-Received: by 2002:a17:903:a8b:b0:2f0:42b6:eba8 with SMTP id d9443c01a7336-2f042b6ef73mr185236595ad.27.1795643895211;
        Wed, 25 Nov 2026 13:58:15 -0800 (PST)
Received: from localhost.localdomain (74.82.221.43.16clouds.com. [74.82.221.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm91547365ad.3.2026.11.25.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:58:14 -0800 (PST)
From: Nikita Ivannikov <www.nextry@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chipang Kao <chipang_kao@asus.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Ivannikov <www.nextry@gmail.com>
Subject: [PATCH 1/2] platform/asus: asus-armoury: add power limits quirk for GA403GM
Date: Thu, 26 Nov 2026 00:54:30 +0300
Message-ID: <20261125215431.120307-2-www.nextry@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125215431.120307-1-www.nextry@gmail.com>
References: <20261125215431.120307-1-www.nextry@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS ROG Zephyrus G14 (2026)
GA403GM (AMD Ryzen AI 9 465, NVIDIA GeForce RTX 5060 Laptop GPU).
Without it, asus-armoury logs "No matching power limits found for this
system" and the ppt_* and nv_* firmware attributes return -ENODEV.

No ThrottleGear XML is available for this model, so the limits are
taken from the GA403WM entry. Both are the same Zephyrus G14 chassis
(31.1 x 22.0 x 1.59 cm, 73 Wh battery) with an RTX 5060 Laptop GPU, and
ASUS specifies the same GPU power for the GA403GM: 85 W TGP plus 15 W
Dynamic Boost (100 W) in Manual mode, which matches the GA403WM
nv_tgp_max and nv_dynamic_boost_max values.

Tested on a GA403GM (BIOS GA403GM.302) running 7.3.6 with this entry
applied to the 7.3.6 asus-armoury.h: the ppt_*, nv_dynamic_boost,
nv_temp_target and nv_tgp attributes are exposed with the ranges above,
and ppt_pl1_spl=81 is rejected with -EINVAL. As on the GA403WM, PPT
writes return -EBUSY until a custom fan curve is enabled; without one,
PPT writes through the legacy asus-nb-wmi attributes are silently
ignored by the firmware, so requires_fan_curve is needed here too. With
the custom CPU fan curve enabled, PL1/PL2/PL3 values of 25/30/40 W and
80/80/80 W were accepted, and ryzenadj --info reported the matching
STAPM, slow and fast limits. The NVIDIA attributes were only read.

Signed-off-by: Nikita Ivannikov <www.nextry@gmail.com>
---
 drivers/platform/asus/asus-armoury.h | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/asus/asus-armoury.h b/drivers/platform/asus/asus-armoury.h
index 331c3bddf013..33b3014815a3 100644
--- a/drivers/platform/asus/asus-armoury.h
+++ b/drivers/platform/asus/asus-armoury.h
@@ -1395,6 +1395,38 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA403GM"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 0,
+				.nv_dynamic_boost_max = 15,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 35,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA403UI"),
-- 
2.56.1

