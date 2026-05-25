Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409BC2AE78
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711477; cv=none; b=U2lV9eXoZ4pf1mKsWoguhYez5Siw6CxcgLGXTCLPHLme+98pDmWuwj5iiXtQZNzpPVEYuhsChAckABis77dqPBJ806s3mtAn4p2PHBpSlFolAOY+pzwx+GXUtvIhiDQymfE/VW/HiNwK7NXGia4AAfdnYhv9RVY7TT459P++Pfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711477; c=relaxed/simple;
	bh=uOpn3H20GVdXJ70jmnemErhke34BzRjdYeSE2VfthkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIc5jk/Odm4VSNnfmsinSMNP+iejsgKjTq3D8fq5e5y9kW4EhrF/W4l1o3AVXXb0l4TCNEAIOKa7w1ljjVdXpwvYv43+zh8xy/6wSWJpn+cQc5EpQ8gDtvKT0fIflYMnT1wOMuAvqGW2Vf6bNji2IgwW9+zeDO8eQvS5cQAB0qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKaXbd/a; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKaXbd/a"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so4141051f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 05:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779711475; x=1780316275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5yfIf8fhcmXnDOC/v106hxzdrUGdW8RoCcfbrp5KAI=;
        b=mKaXbd/aoCQ221QxudTM6/JcMsd/kLOj856Buy6836+vHHIdOm/J2AVlLmOWBpwvCK
         inTWT+55yTzEtTB7c6rFU2vrMuZY48BnKOJqZcQWkqDD/3ESYIOMAASws3nUHOJ+KFIm
         CEZrPdLwP99yajxpWgpwMrv4+xUiYqASbBLUXa5HUwHlKxdO/BqU5X/8bvAZmaj2zDHD
         R1ANmgI0GnVZ5pwotuyVkBGjQy9KYIfvFlREUgRDyPlTk98gafVjwo3Vz712YTFkdEaP
         GXoaHq0hvS5ylXGLXBp/rSLDy8CxVjdl40sZHqGKoIZO68cHhWjx1HH07Dy1ENSIWc6V
         Wu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711475; x=1780316275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F5yfIf8fhcmXnDOC/v106hxzdrUGdW8RoCcfbrp5KAI=;
        b=ckBcMZwtERo0FEV+1dAlgQt2VG+B78bu79JZuQSdLLlj/FMZzaDWmGklymzgdApuF5
         wfj36TWwRbDvCLmd1GAva+w7TXGVjSdtHmbCeOdiMvhqzF/EKi7/Oz72/WBpcsQm0GGP
         j46Or1ggAn2MGZaG9cBn8LBLdy+jX8ARD28IxNgWwnLqPZ7bJgeel2d58iFBXrHqFGhV
         Kaw1plzh36LORZQU2hfKaJCxZ9wtZzhqOvq/2s054VTfiAekNJmrdTLzWqEYKIfaepjS
         nG5ou++TdDQ53MBM19aZI+xvJVysQ5TITbb6fTj1SCP3rx81ldKZn+XL+05EpCuW2WMF
         76uw==
X-Gm-Message-State: AOJu0YyWryv49h8tJFNxoJJAzMNPGK3N8M1MPte0yqJZ3DFP5f3lgmYH
	jS3nt2zwwYpLUwyqAVdF163vXiY4i72FtvvwvsbCnlqjvO0iRD8EqWVy
X-Gm-Gg: Acq92OFzX5sP0lbsIyZW+vPtslIVp1rzxkh9lq0yeBMAsnFwCR4t3c/bGEaItsrRcwt
	RA/Sm0d3/WfhYWoFiyhTuzlqy76zRXXyJV0y8oRark9EC7wlaO5F+cMvAdf7CPnjh5gWKV8742v
	4RBgkG2966qYC4IvpTymcS7u+D4nf4uzbyhM9DXt90PBN8fVvwQthwuAKcNg/DSCZM550vkSOuZ
	bAMe385airkYbwv2aV4bT/xY9Ro3gdvo+shjl+nAK5r01zQ5kDiT4emmnFU4usRM04U69PkVSZf
	NoZQMTROEppHYhEoTxwR4CM0CdDnqJ96Fx2G3JDi2nTbk5YiiHux7op2eblZnkTXZjGqx36bdvq
	4lJtCEkb95Zu4cyGnYTSjmZUQMy3mB95XPMZoh8DQB0PYMD0PPknpOV7/80wJ+sDJ1wxSGVQLem
	falSui5hRsORdqfgJS4i+1ZqIz34beVNI=
X-Received: by 2002:a05:6000:420e:b0:45e:6594:261a with SMTP id ffacd0b85a97d-45eb38be812mr25442813f8f.35.1779711474415;
        Mon, 25 May 2026 05:17:54 -0700 (PDT)
Received: from localhost ([37.99.69.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd10acsm22299194f8f.15.2026.05.25.05.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:17:54 -0700 (PDT)
From: Shaposhnikov Daniil <2minesweeper2@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaposhnikov Daniil <2minesweeper2@gmail.com>
Subject: [PATCH v2 1/1] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer models
Date: Mon, 25 May 2026 17:17:37 +0500
Message-ID: <20260525121738.11354-2-2minesweeper2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525121738.11354-1-2minesweeper2@gmail.com>
References: <20260524121510.36961-1-2minesweeper2@gmail.com>
 <20260525121738.11354-1-2minesweeper2@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Newer Huawei laptops (e.g. FLMH-XX / MateBook 14 2024) no longer support
the legacy WMI interface for Fn-lock control. Instead, they expose direct
ACPI methods \GFRS and \SFRS (Get/Set Fn key Reversal Status) which
communicate with the EC via registers 0x6B (read) and 0x6C (write).

Add huawei_acpi_fn_lock_get() and huawei_acpi_fn_lock_set() helpers that
use acpi_evaluate_object() to call these methods. Both
huawei_wmi_fn_lock_get() and huawei_wmi_fn_lock_set() now probe for
\GFRS/\SFRS via acpi_has_method() first and fall back to the legacy WMI
path if not present.

Tested on: HUAWEI FLMH-XX (MateBook 14 2024),
CachyOS (kernel 7.0.9-1-cachyos).

Signed-off-by: Shaposhnikov Daniil <2minesweeper2@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 98 +++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 93cca17fdf58..006aa31eb777 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -527,11 +528,103 @@ static void huawei_wmi_battery_exit(struct device *dev)
 
 /* Fn lock */
 
+/* GFRS byte[1] / SFRS byte[2] (FRSR) fn-lock state values */
+#define FN_LOCK_ACPI_OFF	1
+#define FN_LOCK_ACPI_ON		2
+
+/*
+ * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024) use direct
+ * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status) to control
+ * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
+ *
+ * GFRS response buffer layout:
+ *   byte[0] = STAT (0 = success)
+ *   byte[1] = FN_LOCK_ACPI_OFF (fn-lock off) or FN_LOCK_ACPI_ON (fn-lock on)
+ *
+ * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
+ *   Value is read from byte[2] of the integer argument, so it must be
+ *   passed as (value << 16):
+ *   (FN_LOCK_ACPI_OFF << 16) = fn-lock off (writes 0x55 to EC 0x6C)
+ *   (FN_LOCK_ACPI_ON  << 16) = fn-lock on  (writes 0x5A to EC 0x6C)
+ */
+
+static int huawei_acpi_fn_lock_get(int *on)
+{
+	union acpi_object acpi_arg;
+	struct acpi_object_list arg_list = { .count = 1, .pointer = &acpi_arg };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+
+	acpi_arg.type = ACPI_TYPE_INTEGER;
+	acpi_arg.integer.value = 0;
+
+	status = acpi_evaluate_object(NULL, "\\GFRS", &arg_list, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	union acpi_object *obj __free(kfree) = output.pointer;
+
+	if (!obj || obj->type != ACPI_TYPE_BUFFER || obj->buffer.length < 2)
+		return -ENODATA;
+
+	/* byte[0] = STAT (0 = success), byte[1] = fn-lock state */
+	if (obj->buffer.pointer[0] != 0)
+		return -EIO;
+
+	switch (obj->buffer.pointer[1]) {
+	case FN_LOCK_ACPI_OFF:
+		if (on)
+			*on = 0;
+		break;
+	case FN_LOCK_ACPI_ON:
+		if (on)
+			*on = 1;
+		break;
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+static int huawei_acpi_fn_lock_set(int on)
+{
+	union acpi_object acpi_arg;
+	struct acpi_object_list arg_list = { .count = 1, .pointer = &acpi_arg };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+
+	/*
+	 * SFRS reads byte[2] of its argument via CreateByteField(Arg0, 0x02).
+	 * on=0 → FRSR=FN_LOCK_ACPI_OFF → EC gets 0x55 (fn-lock off)
+	 * on=1 → FRSR=FN_LOCK_ACPI_ON  → EC gets 0x5A (fn-lock on)
+	 */
+	acpi_arg.type = ACPI_TYPE_INTEGER;
+	acpi_arg.integer.value = (on ? FN_LOCK_ACPI_ON : FN_LOCK_ACPI_OFF) << 16;
+
+	status = acpi_evaluate_object(NULL, "\\SFRS", &arg_list, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	union acpi_object *obj __free(kfree) = output.pointer;
+
+	if (obj && obj->type == ACPI_TYPE_BUFFER &&
+	    obj->buffer.length >= 1 && obj->buffer.pointer[0] != 0)
+		return -EIO;
+
+	return 0;
+}
+
 static int huawei_wmi_fn_lock_get(int *on)
 {
 	u8 ret[0x100] = { 0 };
 	int err, i;
 
+	/* Newer models: use direct ACPI \GFRS method */
+	if (acpi_has_method(NULL, "\\GFRS"))
+		return huawei_acpi_fn_lock_get(on);
+
+	/* Legacy WMI fallback */
 	err = huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
 	if (err)
 		return err;
@@ -550,6 +643,11 @@ static int huawei_wmi_fn_lock_set(int on)
 {
 	union hwmi_arg arg;
 
+	/* Newer models: use direct ACPI \SFRS method */
+	if (acpi_has_method(NULL, "\\SFRS"))
+		return huawei_acpi_fn_lock_set(on);
+
+	/* Legacy WMI fallback */
 	arg.cmd = FN_LOCK_SET;
 	arg.args[2] = on + 1; // 0 undefined, 1 off, 2 on.
 
-- 
2.54.0

