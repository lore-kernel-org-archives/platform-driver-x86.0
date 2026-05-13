Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD33ACF1D
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701187; cv=none; b=UHQ1sBv1Wk9/CXCtLyxHduu4JutdeC5M64v+Xq3K3tf/kcTUYGEq6VRjB4tGGGjyz9KQfhSf5C/d7UhB2ZQrilzaNtyttR2nG7PpbsXHp2OVn+1c0BPekHADXZMtA30ddzeNRaIrZYcxowaOf9tqBNfVq8hOJo8r9fMc4FotLxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701187; c=relaxed/simple;
	bh=8L9XyBDEciL5WEEmF1jOQRk81AWM4Zk1x71LAZ8MBTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hL/4rWBhaRBEAO152TWI0jfhIKX7ZzBJG+WS+31ZJ6iCNBEETwzi1o6sglF+VEyZQvtaTf5KUKA81Tmc4NLlNB7auKLXvQQkfU/twnkiGMm7+HqAMOqQZVJJsHwVTSYy4erKNLbBD1bYZ8rD5GJ/NOpSgwGcuSb6aVsEoZ9qvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlMWe8nE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlMWe8nE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b941cd869cso46174395ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778701184; x=1779305984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvqMlfps/2MIQrMqnTxZeXxhdXVuqBUVLTvsK3qKbEQ=;
        b=dlMWe8nEB2q1BmtlK+kSARQZF3kbGneyu0sme9RDZEWlKy4DXZ4ipTeTmknz5ROVLl
         ZmAdLlCqyJnYA+VuCfMg9NtHoS8qvVhosb0i13Gqahm/7fqweZPrAQys24X05DgGrujv
         TkDobK2H4qc097gaXr4lSIlchIP7QDRtlrmgSeI4YJJOu1N5paaM4WqESmiEFnfXYSiv
         j3x1a3Etc0IqzfEFfwVFxUbtEoxr8hJPzSuYis2Ixwgjiw1HXs1kC1n45/Rj+1sq7f1q
         LStZgBYMysAM/rB+EM/hrzZfX7MoFO3w/Ue9LAwwM+duiLDTMgtfBnv+b2YPyhFpNF3X
         zf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778701184; x=1779305984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvqMlfps/2MIQrMqnTxZeXxhdXVuqBUVLTvsK3qKbEQ=;
        b=dATV3VWYidLMBkuzHSk54vsLZWkH0993p2AAfUGy2mDNAtICGsF0KmxsvJfOAgr+Nh
         DOPoF3HtO0+59cunk7R3Cdn2HD0ji5jh2YIThz2H+qJPvmkzoYoKecXIoEIvrNC5B5PE
         LKGfpg3rMKikLW3eLMINkrEP0cEZG8f3mC+zM9K5SB04qa3E8ZzQcMMpfVUUNlosd5w4
         M0SwlekdtZSuV+FgJO/QR53VOT/X9ZbyLPqPiBSEVxQE5jdF5tnucXsGxvAJn7IJP22u
         mW0AIHJ0ylT25LL+DhK0qcjuAxB9bqmZiDuub5Hydo69o0YJexNE5Z1S9z+W2ejpIqqN
         oVVQ==
X-Gm-Message-State: AOJu0YyOOAkiafrT+mLn2GmRaPOnj8qrSQzyTrkgHDDq8uVah5DsAi9n
	ICdrtwEH3yXz72cJz1UMSb1be0ybsSGTGdDXLPQLpqXo0sUKBi1r00kY
X-Gm-Gg: Acq92OHmZsRquuOzDTYihwnVZk4jolaHjOtlb9pRCum3L2q0fdeKU0MO/PBkG6bhmU5
	pSmrzz4E+J8f9gGpjn5JiVJq2lg9VFeCE7xxmFYJ29sJyQwslgwoC4LxLI/4HRAl8fQ5v/B3ZR+
	pJwzOnfAno9NmoG+De600wJhqwrxLITgvWwkugDGfrXAUVovTZfEu2GfvXLTjGrgNx/Zlq7uLUq
	DkUyx1+D6HpvrxAnyv3g0u//1igpaHiaVZn+AW9DAAFqiL8oR3V1vz6uc8zL67tQDs+xn4s0Hd/
	iqIYGk+7igAfM0MDQbU3OZglxLnJTim8V1sH6e763n7xa6oY4Omm2ouyjLDd+xbidpr6ZeSN+YU
	e6Mk34DBLvx2QarMRso8dDiAV1JrmmZklleBdDTl+68vlfM2ItnZm2zsQi4ib9J0h4nLPccyJcB
	33HYD/MOC+KjX+PMFRIXjnHgf+pN0DFw==
X-Received: by 2002:a17:903:4b24:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2bd30222604mr43304375ad.32.1778701184360;
        Wed, 13 May 2026 12:39:44 -0700 (PDT)
Received: from cachyos.lan ([2607:fb90:b200:b454:58a0:7e4d:a0a:684b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d659sm230595ad.73.2026.05.13.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:39:43 -0700 (PDT)
From: foobisdweik <dweikmferris@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	foobisdweik <dweikmferris@gmail.com>
Subject: [PATCH 1/2] platform/x86: hp-wmi: Add support for Omen 16-b1xxx (8A13)
Date: Wed, 13 May 2026 12:39:15 -0700
Message-ID: <20260513193916.84673-2-dweikmferris@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513193916.84673-1-dweikmferris@gmail.com>
References: <20260513193916.84673-1-dweikmferris@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add board name 8A13 (OMEN by HP Laptop 16-b1xxx, 12th-gen Intel/RTX 30
series) to the Omen thermal-profile, timed-thermal-profile, and Victus-S
DMI lists.

The 8A13 firmware exposes the standard Omen "PerformanceControl" WMI
feature, uses the legacy EC thermal-profile offset (0x95), and
implements the Victus-S-style GM2D/GM2E WMI methods at EC offsets
0xB0..0xB3 (RPM1..RPM4 tach) and 0x34..0x35 (SRP1/SRP2 setpoints).
This makes it identical in interface to its same-era sibling 8A44
(Omen 16-n0xxx), so reuse omen_v1_legacy_thermal_params.

After this change /sys/firmware/acpi/platform_profile reports
cool/balanced/performance and the hp hwmon device exposes per-fan
tachs plus the manual-mode pwm control on Omen 16-b1xxx.

Signed-off-by: foobisdweik <dweikmferris@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 24c151289dd3..389506a6d2e3 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -157,7 +157,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"886B", "886C", "88C8", "88CB", "88D1", "88D2", "88F4", "88F5", "88F6",
 	"88F7", "88FD", "88FE", "88FF",
 	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
-	"8A15", "8A42",
+	"8A13", "8A15", "8A42",
 	"8BAD",
 	"8C58",
 	"8E41",
@@ -177,7 +177,7 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
  * "balanced" when reaching zero.
  */
 static const char * const omen_timed_thermal_profile_boards[] = {
-	"8A15", "8A42",
+	"8A13", "8A15", "8A42",
 	"8BAD",
 };
 
@@ -189,6 +189,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
 static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A13") },
+		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
 		.driver_data = (void *)&omen_v1_legacy_thermal_params,
-- 
2.54.0

