Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E178F63CB
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771226415; cv=none; b=H1wh7cRjGGWTvVB3X+IO6PqiHkGDd3bXwK+0Cyw/OtaTh4XIt+VaHoXL3RDP85vji4u/Njn+cAusbpvOv93m41CT1vjG0B5Zstbc+GwP2YzUuq3XqSjU5C7l0qBqc3BrxuTNfQElmuIC4T9NhC4z+E7iWMyLPAa27d1iJKbUo6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771226415; c=relaxed/simple;
	bh=LjUgG5kYxFqYCf0dGmm4o2fkFZvfbP08GaBdQt1cn90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TfS8yayYUDlHk4ulps0S4DbAp8sYPlPmlny2gHRSzGdH1YDh8p6ylA6GYt0Lvf1oP1s0WgvTlP5r2dv6rx4APup8L9RZEa/KjY1q58Uw8tmk9CEx8yYBzxl/yX0sOuGJ4IeG6ZrQE9RcS8AIqwDSeVSMLjoCYgKHcI47wuDau4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjYxmq7F; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjYxmq7F"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aad1dc8856so19222495ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 23:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771226413; x=1771831213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WNl/56IjpOJIrEtT5IhyRK+0bfd1zr1TZgAkgIdpRA=;
        b=kjYxmq7F++WfrjlVPNnCdQYwbINyx3siguB44Y8LR3Lu83uf/Rj/92tE6m7LAkCBRL
         eq8/0PXR48Q/xG47RSrq/UisujU0thgsd7+1CEhQVEqqQ6K5U5LfgobftnMVmQKzs8fL
         WFnp/HY4HZws8HEdnFeTHlQQuXvnlbt1HTcs9OUSei5+VRCwBILxHmFtRLIKbcJQFPht
         FrBp6I+Nl798UIZdnpMRU63zmYsK0KqWrGdwicTVAO0IpXuz9PZYU9CHp1GAN99fD2pL
         1acsaobQAsjavVysDKxV7640lm+1t4G24H2f2mwdiWwmjPHaaJlEH/doH6dW6cTxTXi1
         6K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771226413; x=1771831213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WNl/56IjpOJIrEtT5IhyRK+0bfd1zr1TZgAkgIdpRA=;
        b=Wg6ua45F+1l3XdrlfgxA7KvGa5Eq5bfkqHLFU16uNZbZXIj1Gts9294ewAbbh/Mn4K
         Jgx+NLIqUR2cDdEEqtScpil+JarxHVr3oaQVqKEki2jANAWhtfvtyYgwa1T8eqFDLrkR
         xq/3bMAtFE5oY+1Jk1dmNhQPv8pBlEHygRHj2KzhvM5CO0QlRByt1npclFqY0Sw5nmsx
         DmPi11B8JDnuO9v9XNIAUFq4nPPFO8jguFNnD7VJVQXrB53DrTIP4qSghwFowQiy0Xe2
         a3OwxlCpuZtHtYUnfrEkgX/tIQoYQ8UlLnRyewksEk/mXAmf+aSw7MEGln+yKqabDX9k
         mHZA==
X-Gm-Message-State: AOJu0YyXRc1X2MCKwFbQljVCksdSw95JfoAnr9oczDmRfcXQBG5Bwc33
	Z3BMsjWHNQanTuMTIQ+pnjEQot6JfKbnFuKT7HXQWu0M95GE4fkH2bDJ
X-Gm-Gg: AZuq6aIF9LjugGuquR5HqszOga8FrtvzpdNmb85K8SpD0irwgqylze4EUcIbiUKbLeZ
	59gobMRqLpAwXyrVu0kwoCauqbaNZ97GGF7ZFl19m9QHekn8e/DyX37b2poLk0UAPxnZeXL70gg
	pXAqa6pw7jLCJthUlq1l1R7HqWyEB1kBk2cA1dTURjvnXbGs1AFTcQXMIhRa8bs4e55KXKwtROd
	A1OULWqDu05ThF0FUUqfV/RsOgRdKCbmPzdFqL952xcXHFhvs9JJfvo6R/BqRGBqm0wK8NdX0kn
	cdf/5i+INnyHK0efTTR/LK5x2Bfw/lMS05j9u45GUmekfJHs+7PmrEHasvkskKuoMMFMil2XIw1
	u/1iHEEhdVABI1NOzsNT4hB3Ig50A7/rnKiE5lq1wPccqzQXgTIJpcKZ0wGL5vYgxp0jDxyWjE8
	qj8UjjqKN1hGVLAp+Oj0Trd4uFwrVkdniDrFfacQKosijtAgmr4mET9srwjb/3nCVhO4QZWcj4o
	TPD2mLsdNg+XlK69OIqJ4h+
X-Received: by 2002:a17:902:e5c8:b0:2aa:d647:c312 with SMTP id d9443c01a7336-2ad175c5952mr80173665ad.61.1771226413132;
        Sun, 15 Feb 2026 23:20:13 -0800 (PST)
Received: from archlinux ([2409:40f2:3058:d8fb:3388:7ec9:8e6c:8be3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5df0sm59979185ad.58.2026.02.15.23.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 23:20:12 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	noahpro@gmail.com,
	juanm4morales@gmail.com,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add Omen 16-wf0xxx fan and thermal support
Date: Mon, 16 Feb 2026 12:50:03 +0530
Message-ID: <20260216072003.90151-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen 16-wf0xxx (board ID: 8BAB) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile (similar to HP Omen 16-wf1xxx, board ID: 8C78).

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on HP Omen 16-wf0xxx confirmed that platform profile is
registered successfully and fan RPMs are readable and controllable.

Suggested-by: Noah Provenzano <noahpro@gmail.com>
Tested-by: Juan Martin Morales <juanm4morales@gmail.com>
Reported-by: Juan Martin Morales <juanm4morales@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220639
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
This completes the earlier patch from Noah Provenzano [1].
Thermal profile quirk handling was added in 8ca7515d3c76, and now
addition of "8BAB" in victus_s_thermal_profile_boards[] list completes
the mentioned patch cleanly.

[1] https://patchwork.kernel.org/project/platform-driver-x86/patch/20250731213529.27378-1-noahpro@gmail.com/
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..6a1b454baaee 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -173,6 +173,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
 static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
 		.driver_data = (void *)&victus_s_thermal_params,
-- 
2.52.0

