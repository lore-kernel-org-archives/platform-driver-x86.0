Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31C23DE45F
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042293; cv=none; b=n744QFjIFNzHSIKHFxRyneOEqrhC/Tq7kzTRZ10tISqxpUJMmdlhSoc87qrgCdGfq8TKtHKSfGrQN4PWj7IRE41aMD1MwTREsRQle2095E2IlcT5iQBQCONC7kk7lIvExXdCi1KbwQer94vKjeDZ41R7Dbpq0Zuu6/4rpSvtt1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042293; c=relaxed/simple;
	bh=JPbB3lxSCXRaYUR+xW47osXy0IVHVCaCGPKYGLISgBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFAHmtmBqv2bhEw8BbMidX2qrZkop9rki3t9iEvvPVLvpso4bte1UerC/jLWCvncl/+97ri+wnkTjbkf9uLgwnFaO9UqBgkQj5wRt1R5xbqKicxvx2KsDNi1+ojwMYPgwuruV6P4yMc88S5zupkV21QDHvdYeGegI8SWQdTO2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/z9Bv0O; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/z9Bv0O"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so2762030a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775042292; x=1775647092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8J9smKGowWMdR9oHje2W97PGn5/bAbt4cYk0bUF6U8=;
        b=l/z9Bv0OhWZn2idL3w9vT0dzaAoFYBrCYl73UBuDQYhH3BuL0791/extEym5JNGBBO
         r9WMFLTHKgyRx/beb8FhQ0OK+BzrpVbLzeRZ0PcCRxq+oqmoZbnJRYS8o/YeTmCU4rPu
         Zm9zxtvIl0J0rS/cVXdCMFCxNnNchOMUKSrWsz2/dDFlg1f168hT8WwE2zDKE4Thh+5U
         B/vz2yMJj7ysD9kojZtxbxXHVAn/tvcxJRu4B3GsQL439XfcHRYvI0I0XKlRAeFB3wRJ
         DLoU5BYgFeM/tnn3gkdg+ZqE6nIIAtIshQmRUKi7cxXZ1hprqkD3q3wBz4ZyXYusVcuW
         4I7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042292; x=1775647092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o8J9smKGowWMdR9oHje2W97PGn5/bAbt4cYk0bUF6U8=;
        b=G4F8IHSBcd+DzlcCohp/1NcHzFmWBeLtb98Y6nrHbguwfKbrgTfPUxW7KxN/FF88K0
         suPjLeoHXJeNir8G0dnaWuUK2zLbVoKglrvyUT5xuyB4OWxg4cLvgK9gtJnkpaYBLVHW
         X6xxG8JkT7nnEWICHkCusL9i5QbUSC+oEHXwxtFYgix2qKKT8ArknmObxovSur858mdp
         hZ72cgvcOiiVc5M3iX8ougjp726aW8P4qdyk42VQ+Q3KpubyZqCHaNvzr70dCYbLWn/o
         MBE638xAAvRisVRhP2KT2m1PDBzfRg9Mps53m+O7KEzLglzdtAL/H35cLQwMkHUONrc6
         8gyw==
X-Gm-Message-State: AOJu0Yz0+DxUTmgiaXAQ4rKGtPcZzMKJmnZ5+SF62s9H22gOi/gYL0CQ
	uRcmG5WvyLw56vD/SpWBQPPYmbfvVgncrJf5a++dfuHlWeOoT7Z4shAy
X-Gm-Gg: ATEYQzwZSrvdNfBUob4cHgI18y92j9LfGS6Uvypqw0W8OESlNpLyfjHk8tpiA1GO4kk
	Q0mBMv8d/hXaoCT7Rhy/gNbIxeUcmvWtynrJn0cKnurWnaQJlkMoadATyu/+r/dyAlJrzbx3Zm6
	puKjco57OJJCPC7Uji7OdN9Fuj26dNtl0elSnk8oszCI6b7eb1nHowUxbD4QZUqkvgL+DeUen5x
	8Hh8MQvEY8Yv2oeEzzIdJJkrYZadAGAhBrXLUzYUMpnicjPnaaCPaI0hdnc5aufQm3NlTOL0TJd
	3lcwVch6jXXtqHrvcj8U186O9hujLvSFsEtN90qc/DgOxuU2gFMgRf93dmDMyONwniIN50aYcT5
	eO00brHl5SSw05OQ3/+/ogFwwVmsIOlgxsDk6KTrWf7SCkwgCO+is93h6kVlLbaHj+OwN+54+0V
	s5abfKrcE334Un3x23DQyu67dFyoEBYsv0yvenVFiVwIoW8gV7Bvd7qsvKZD7q1yx/aJFtMpj7l
	skFohDy93h/h5sSbzYm
X-Received: by 2002:a17:90b:1fc4:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35dc6f90b2amr3127278a91.22.1775042291968;
        Wed, 01 Apr 2026 04:18:11 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dcafd004fsm1889689a91.12.2026.04.01.04.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:18:11 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH 1/4] platform/x86: hp-wmi: fix fan table parsing
Date: Wed,  1 Apr 2026 16:47:45 +0530
Message-ID: <20260401111748.106970-2-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401111748.106970-1-krishna.chomal108@gmail.com>
References: <20260401111748.106970-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Victus S devices, the BIOS fan table header was being incorrectly
parsed as:
struct {
	u8 unknown;
	u8 num_entries;
}

The first field should be num_fans and the second should be unknown. It
is pure coincidence that interpreting an "unknown" field as "num_entries"
worked on multiple device, however for board 8D87 (in an upcoming patch),
this assumption fails, and the hp-wmi driver fails to load.

We fix this by correcting the header definition and compensating for
num_entries by parsing each entry of the fan table until an all-NULL row
is obtained, mirroring the behavior of OMEN Gaming Hub on Windows.

Fixes: 46be1453e6e6 ("platform/x86: hp-wmi: add manual fan control for Victus S models")
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 41 +++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..d630b7f6e146 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -433,14 +433,14 @@ struct hp_wmi_hwmon_priv {
 };
 
 struct victus_s_fan_table_header {
+	u8 num_fans;
 	u8 unknown;
-	u8 num_entries;
 } __packed;
 
 struct victus_s_fan_table_entry {
 	u8 cpu_rpm;
 	u8 gpu_rpm;
-	u8 unknown;
+	u8 noise_db;
 } __packed;
 
 struct victus_s_fan_table {
@@ -2514,7 +2514,9 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	u8 fan_data[128] = { 0 };
 	struct victus_s_fan_table *fan_table;
 	u8 min_rpm, max_rpm, gpu_delta;
-	int ret;
+	u8 cpu_rpm, gpu_rpm, noise_db;
+	int ret, num_entries, i;
+	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
@@ -2529,13 +2531,36 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		return ret;
 
 	fan_table = (struct victus_s_fan_table *)fan_data;
-	if (fan_table->header.num_entries == 0 ||
-	    sizeof(struct victus_s_fan_table_header) +
-	    sizeof(struct victus_s_fan_table_entry) * fan_table->header.num_entries > sizeof(fan_data))
+	if (fan_table->header.num_fans == 0)
+		return -EINVAL;
+
+	header_size = sizeof(struct victus_s_fan_table_header);
+	entry_size = sizeof(struct victus_s_fan_table_entry);
+	num_entries = (sizeof(fan_data) - header_size) / entry_size;
+	min_rpm = U8_MAX;
+	max_rpm = 0;
+
+	for (i = 0 ; i < num_entries ; i++) {
+		cpu_rpm = fan_table->entries[i].cpu_rpm;
+		gpu_rpm = fan_table->entries[i].gpu_rpm;
+		noise_db = fan_table->entries[i].noise_db;
+
+		/*
+		 * On some devices, the fan table is truncated with an all-zero row,
+		 * hence we stop parsing here.
+		 */
+		if (cpu_rpm == 0 && gpu_rpm == 0 && noise_db == 0)
+			break;
+
+		if (cpu_rpm < min_rpm)
+			min_rpm = cpu_rpm;
+		if (cpu_rpm > max_rpm)
+			max_rpm = cpu_rpm;
+	}
+
+	if (min_rpm == U8_MAX || max_rpm == 0)
 		return -EINVAL;
 
-	min_rpm = fan_table->entries[0].cpu_rpm;
-	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
 	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
 	priv->min_rpm = min_rpm;
 	priv->max_rpm = max_rpm;
-- 
2.53.0

