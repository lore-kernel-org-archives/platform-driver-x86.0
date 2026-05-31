Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F2285CBA
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780212669; cv=none; b=c58K21uWWvTjujz7tXuO5JzTcHCYRxtdjkfJjfXnnuxpephmpXE8nnnx0QrUuwbkL0qiIcuq4GehY9uJMmt7fs+SHkHoCz9JmvJRWwRbjEU1fA4+jOQYleSgaeU9QhjCwsycmNUb4M3NM/lxp1LcqhbUx43wg7Xv0+RX8qzLtso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780212669; c=relaxed/simple;
	bh=iP22ZjPbeV8HlZLtAq4yS6Uc8nMYEMRUeoyeTnODlsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YK3v5qx2hqoVJN7SnzFodsIU4NwBPiujWQO2+6rISwFgwdV1Brdfi8Ea4Hvc0Ef7iqM/FKvldXumev8PViMpuSjVdLGXmzWc9cxTifbsYU6nzgINfjEFCDPeP2OIgt8m6zJN3GwAQ0K1RBxH510b+9MLeD6yGS/HanEEt8+2BqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RP2YJzIf; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RP2YJzIf"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8589498839so313600a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 00:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780212668; x=1780817468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YK0Jz87RxY8KthmB11KDDWIETMrPO+HjhUR1goGbjok=;
        b=RP2YJzIf3+KpBnL/gxfpWEsLmvfzFcTFSwAx52GYfSNv39wCWY4TIyAVHeyZl2wmvq
         kd+Kamsip1eFDP/oqXQKhxpyDUTYKRes6Iz+QZm3fayMrkifuFz9snngG+Ca8hYuhyhR
         AkvK197iENeTSsMZiOlgCrysaYq4m2s/Pl9i2cNMNkMkW+FaoTVkUjmtbbYrvmfKgXq8
         woNAWU2SmbmqdA1G/uErb7khXOpYQBplxsWTUzKXJkCFIDgDYU+Nq1+PFbI9oXDmo51E
         Y3cnF0jioBHilahOaDb6Lg9fcjUsz4/7jKzYF/O5ob3x1pZthH6y9VeY1BBYWGIsG5++
         R1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780212668; x=1780817468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YK0Jz87RxY8KthmB11KDDWIETMrPO+HjhUR1goGbjok=;
        b=cSQ6sdXlg2/+uFE1EUNNPHxPcIyZA1GbmCjDahdRDBQIfJaSs2wgaIqFmkP9wzbAyV
         c26xAsX4VmUpjZmKXlKMih1CJS92oF5tqYGjJiold476aCwDCjtsqR5bo1chFgdVSNG5
         AgiaqyA2zZAXWBreLRkrtHlxb82Op2Dry+IvISUF7+FAQcGCeAqy52dxCShzQ/xnWNrR
         ZnZ26N5WEaIXxXJ88EgLerBdonfULB7u0psaKOGI77sIPssz9KeVdZmNcLuk0CmlZ5FX
         +uvNHyypFOceBXxKKmlJGGISVuFDl84V/AA0xfoA2lv9ICj3I+spvxmWzxmG87U7IvPC
         ZgAw==
X-Gm-Message-State: AOJu0Yy7Bntq9UhIw/54jlfzsBpCuoGp4IDEEKBWfVXmRSfVOaNlz792
	HwPc0Q4WWx05PMpLNiVfEzNBtqtF45WuX/+TghjZvnHwX8icNLGDgclRG2k8v+nQWDQ=
X-Gm-Gg: Acq92OF+ERw8b87UO3q45r0/sJAkM/Uaj8Bbbu48gJddRxQG2JhF/rgXjpeYzAwD12L
	sTZ+kOO6Vm15L4lHD+CxCjJlMT9VQ4sEpgo4r8DzUd03Oc55JXZIiam0VHwtFpejZWAJz4986wl
	XXbSK11ZJ4coDZ6Q+xigykFylXIz7FfPfptEut5XsTUBotw6+DMYoPwZ9uPCzntKOV4q5f72oOk
	HwjcGoXKLP3u/YgnTNBXflxHNk/pATeWPjAErz4LJ3p6wPyC/1RfsPP2b6JayIfBPfJUQnj0Axn
	CFnfKK4ZxNRANu3GpcWfQfh779vs2L8CdPQaX1/qxGBN4VJPTQTWWaAdPuiXXWIyIqcZ0E8zApH
	mOjXBBvst1FCNCwDjBt9t++8zrPusxyVRjVapRE1c3yeWLMmGYlFvYjHHEJnJrd+OwVNDZs5T+s
	9C1eaJlWfhdJ9PeqDvhNFiVHD8Tk50W5ywvmxwipp+5v7QBA==
X-Received: by 2002:a05:6a00:3e15:b0:842:432e:b801 with SMTP id d2e1a72fcca58-842432ecc0bmr1305592b3a.12.1780212667479;
        Sun, 31 May 2026 00:31:07 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:6221:e402:4ae3:a02c:75da])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm7597090b3a.26.2026.05.31.00.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:31:07 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v8 3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Sun, 31 May 2026 13:00:36 +0530
Message-ID: <20260531073036.195326-4-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531073036.195326-1-radheykalra901@gmail.com>
References: <20260531073036.195326-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
the existing Victus fan-speed WMI control path. Add board data for the
Victus S thermal-profile path and fan-control support.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 91578e7..c124ad0 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -170,6 +170,11 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_8a3d_board_params = {
+	.thermal_profile	= &victus_s_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params *active_board_params;
 
 static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
@@ -230,6 +235,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI board-specific feature data for Omen and Victus laptops. */
 static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
+		.driver_data = (void *)&victus_8a3d_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
-- 
2.54.0

