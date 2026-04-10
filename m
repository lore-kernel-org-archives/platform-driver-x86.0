Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E01B340290
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 19:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848260; cv=none; b=H9yucuJNJR/W4Nl2pDeiRPbOjKdpBsumJnyKMhq8QITdZ3709etjyzA0cw9PdogcBMF+2L/imk1V2I6e4FLnKVO5Bny8aQQz2SHtrUPjKC+X92p/EtB3ylXPGmnFu2a4+9x0bz0lO2aaoX14VmdQk8UUNxWQO0SgeLMPJ0QWpkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848260; c=relaxed/simple;
	bh=ZJpNxARjT8K7xi8eHyYrCMO/LZZESluUlDYslUP9tZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5jYmB+JzLwkIf8PYPWzSrzVfG8KXWDpopRsB1324ALwVcIrmsVe+QeumFmupas02R6J9WIts+qgjglC8DO5+T6g+MWtzlnG/tlo+EqQyGfKigNqFGO3C0VDGO5SWCnSpZvuqCn4z1OY9xySYPEesreJcB4zP6Xz+/C53Jty+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+Z0fKdn; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+Z0fKdn"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82cec955160so1760775b3a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 12:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775848259; x=1776453059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFQky1PswHKp2Sl1MSCRR2hoMgQJNGbctBKhWCYqfE0=;
        b=S+Z0fKdnyRcxi7Oi0MPQMVQ/tty5u0DjEaptS4nFig5hwiN4lUWVqcVlutOVve4nx0
         7jSqlz/xyg8+OBR8iQ91ipee1RJ7GISjnYQ2iVSKUU4z+Mj9/2AWhsHWQ8f9lRPPzNiR
         yMXltUfCEr2kTr8MMpTf8m4h2fNTbDE95sl5D1DXB0xJlIWkQ18hkUgDSjfIhzi29dx4
         sGssTtFlDlnXH4FxPHYAikp0+ixVAMi3GikuGk05ZOIL6seL6YxNDgAg0nj6radp6xfS
         FEo9EWO/RVstLIqUXAR7J3YpCv0i509TW6gKOfuJGbktyUkmRUoRKodsDIWmwOzgKuXW
         8r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848259; x=1776453059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DFQky1PswHKp2Sl1MSCRR2hoMgQJNGbctBKhWCYqfE0=;
        b=dAlkg8iUDTU7Wwrrb7IU8pYW2+mKK28fjS3JH5pZ1jqt6mYJTTZT98TW/T2dnL08YT
         3MfTb86IRxWOCRFYd5/hy/1Z9xy1eWuQVSGjn2ognqSAc/gBJ9vBMJZ9ZCAfG8YOa8P1
         KsEFm4iG7UOJLXfRYPHwiOVC5boEaVAZMHh9C7mk9hF8/w6PRW8BZ+1hgxv6eqhNzb/Z
         btPptNK8ImOVFZlvGpZ9wKhcB0uHI7R+eWCcFc7WovusJv3pQndnqJrpoqndDaO01wCA
         A2l5Z2p+8UoKaB+OsPJvR0ShmjfnIwUQj7samTbPwq/7mB/GAcJjuYaRglRAQwErPCeY
         6Mqw==
X-Gm-Message-State: AOJu0Yz4027jLHaoUXgrYEFohza8pquCjiF4WXxiW/JFAjm4EHPjpP09
	TEIGaPnXyzOKTiCm+ly7FH4PVxXyI8QKeXWpJVyty+tT54kPl7ngrQgY
X-Gm-Gg: AeBDieuljQdAsXYypyqF3QeicfEkO6TGCVj/h/MViRSRZYB/Yma+PprD8vQK1SI1SVJ
	WPM48h7KWM9BkLOE3uLEVZr0o+DMKvd+fmFoKOnjC1bDO4cn1xkW58ty8yomdh+UJexrTSZBJzG
	K/NPm2UoPzNlFjTs5hawnJH266BY7mzG48W7MpPM86rXjr1Ws6YwxCfVHkeystIO/2J3NKWa7Ce
	KnBYJUtm1l8RvbFgL6liynnn1peoMG9WcO0pz4mUv7N7+L1l8sNOnH4vSxOxRxXbezieneE2KI6
	AKOV9vx85oFtEGET9nvM6p8UnEEPVSIdS7E9s4xQkkSLM4z1QICvDfqcYlmkESZacm/GTO/UIyu
	ObvubQyaZb8JYv2axUOHkuMHUEiVOoxvDub3MVR29DwxeJIHpZQVnVcIAekw8vvaqVQmvz9UCzj
	7CM3vNdONAC5GYdwIoG9S/e128XwcbDoJVs9oKkRQqa76lD2iglAZkWOwnQG+w9zmP5Az2YDmcJ
	Pz/G8KFhu/Uu8fxNtnu
X-Received: by 2002:a05:6a00:23c9:b0:823:1252:9428 with SMTP id d2e1a72fcca58-82f0c1e22b7mr5019426b3a.9.1775848258495;
        Fri, 10 Apr 2026 12:10:58 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a70csm3400739b3a.55.2026.04.10.12.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 12:10:58 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v2 1/4] platform/x86: hp-wmi: fix fan table parsing
Date: Sat, 11 Apr 2026 00:40:36 +0530
Message-ID: <20260410191039.125659-2-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410191039.125659-1-krishna.chomal108@gmail.com>
References: <20260410191039.125659-1-krishna.chomal108@gmail.com>
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
index 77913373ed08..205a7bf4cbf7 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -469,14 +469,14 @@ struct hp_wmi_hwmon_priv {
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
@@ -2563,7 +2563,9 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	u8 fan_data[128] = { 0 };
 	struct victus_s_fan_table *fan_table;
 	u8 min_rpm, max_rpm;
-	int gpu_delta, ret;
+	u8 cpu_rpm, gpu_rpm, noise_db;
+	int gpu_delta, i, num_entries, ret;
+	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
@@ -2578,13 +2580,36 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

