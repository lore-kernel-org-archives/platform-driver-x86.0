Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6942E393DC1
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 May 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779624923; cv=none; b=rOHcHYlpKgIwVw4ALnzfA81Dva9+07R1oz5dgMcXyF1DIFy4T+4vwuRUOXLOT5v/obN6IRGwqPFC9CyDlqfPwl94uyY7apEB4v+ANM7RQFtcP/+9CYLmefMMezJEzmr0be7P/VXnBeIOnKyy3qNH7BO0QpANsDOy2qS6QNzH06w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779624923; c=relaxed/simple;
	bh=HPzWupM2ZjUXX0eNWgKt1EEEJD8LJ/Sp25bHL+GC/no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PVprbkYFsrZJVCHtl5BV4ltCIUf3ZaUGk457sDp/lY7tlNNHIGmFnY/xigwzrR5VleW4SZFY82U7Ufm22rIF861neFsQq3CNTasYiBOyi3GuBnY+ZqTByCsh4IE39cFnKE4A2xMwqBYoDhGPy2K2VSWa6lpYlUCZhUMz9trTY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sf1Skjm2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sf1Skjm2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4905529b933so6096635e9.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 May 2026 05:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779624919; x=1780229719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYEgaMhlMyzTUpGDpHyjsYsCWMtgGcpQtucUOR4+Pkg=;
        b=Sf1Skjm2aOsHmIsmbdU/t9HztzxdNhbb/0NKvSnpkfaUKCz1PylkTwCScJAGrtTWqV
         NXOOl3paWPbUXFQAKYiXhEMFP8ULsx9G4NeYK7pG98EwOgK6ri568+HUABK3fy5n7TJF
         9e1orDT6Svmb2RZoy37LOiEFc65QHZwSm4pv2ekGul7PaQQiIPIEy13LDmduvB3Ax5bx
         8xUPnn1fr0y7n2P/5Qdw3Mvz5/xHoF+/LWTQnxNMqD0A2GkF+DzmEGwA0K6oGpJZJQzF
         1TWrK9GXefA7pfQ6JgbmyoginxmJIrOs3WnWWl2xtwCgV/YN48K7bor2TMQuZaxKy349
         qygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779624919; x=1780229719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYEgaMhlMyzTUpGDpHyjsYsCWMtgGcpQtucUOR4+Pkg=;
        b=a12qKgrTmzOvvDptnWBUOh7AzRsqwitlWDlfP14W8YTtsGKmYlmDA9NJF+ORBUZAvx
         qy2Ts398X+t9+Gtb0vvlqA1zemb+HXSeVbE69z0hq3gHW9Y3HmR8Dus5uUau6zA8hBoh
         AF0lz8uCBsB/sNJLqFD/9WMiN6OmWjYvXVy3fOMeFSImZmPAulS9G2ozc4ShkD2QTAT+
         ruRlnRUtKOEbreahHVT3yN6j7L4qwfq0hDSQCvuXRKmZmCP3oYPMU3VhHzlyZvEHtYcU
         E/FU6lycdViPK3fagJ6tNwKlSqfGE9B6kdFco+s9qCoHSmPBgvi9X5KHTKKSV4Q6C2si
         GWGw==
X-Forwarded-Encrypted: i=1; AFNElJ9bGXJwdhVYNyvT4W+Wt0NJeGm/cAdvDDYMECKT5d5BGs3nNYAxSQ8Y22wlL2F/zwdQnnqiCQSzBYD4bHxibyqcNO0T@vger.kernel.org
X-Gm-Message-State: AOJu0YwJVimxpSZttojqZ9+U9ncE4xyIzi9kPAy1QFfr+GZnqXUEgsQU
	dKVUJMuVauv52VTL0sqYA+Sg6EV+K0uEoNensQqbksiYJAJmOw/1WUct
X-Gm-Gg: Acq92OG6ONC5Ou8CoWnMY2iGmq1vgIS4kXgJP+g3/K44eaLmZB5AKgkeP3Eq23T4DK0
	LaI/AFX27uu7n6VZ3LvtvCisJEHwUFhINmURXYIar06K0Zcqf75ecJ+F92z2GwMS/8w1zzQMxOZ
	6frAon4HchYc93o4JKC6FThRFYhaQQo/f6jDCAKwLB1UYV6m3x9xTE5d2vltBVvPTx8ZDu2XcPP
	tbkvYP8RcM1iE6J1xE/bxNs19+86nV7jlinSmYx5Rem/M2LLYZT1JnWyX0weuyn4zt5ckbJocMl
	dTbhX1i4lfYPx9oEHJldZ2aQHnv6n2mZidWh2OD9QNlGq96oujZRJTh6z4HrI0E5Z1CnQEYHVT8
	Ip1ZZLnPx3gY4czPQG2UTGBUcXFaAaFNE6c8Tm+UyYpd+7YHiMyV6NZrPLSbraJYXGSeDNPE84u
	5ag1etd5fMFQzXzUEI24vK4zLn0DEWe14lSSmOleoxVkyCTm6g4w==
X-Received: by 2002:a05:600c:4510:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490428ddf15mr159551045e9.28.1779624918271;
        Sun, 24 May 2026 05:15:18 -0700 (PDT)
Received: from localhost ([2a03:32c0:9005:2192:cf9:7a62:a7e9:23f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm172443025e9.3.2026.05.24.05.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 05:15:17 -0700 (PDT)
From: Shaposhnikov Daniil <2minesweeper2@gmail.com>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	ayman.bagabas@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaposhnikov Daniil <2minesweeper2@gmail.com>
Subject: [PATCH] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer models
Date: Sun, 24 May 2026 17:15:09 +0500
Message-ID: <20260524121510.36961-1-2minesweeper2@gmail.com>
X-Mailer: git-send-email 2.54.0
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
 drivers/platform/x86/huawei-wmi.c | 95 +++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 93cca17fdf58..19cd8f1a8e33 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -527,11 +527,101 @@ static void huawei_wmi_battery_exit(struct device *dev)
 
 /* Fn lock */
 
+/*
+ * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024) use direct
+ * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status) to control
+ * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
+ *
+ * GFRS response buffer layout:
+ *   byte[0] = STAT (0 = success)
+ *   byte[1] = 0x01 (fn-lock off) or 0x02 (fn-lock on)
+ *
+ * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
+ *   Value is read from byte[2] of the integer argument, so it must be
+ *   passed as (value << 16):
+ *   (1 << 16) = fn-lock off (writes 0x55 to EC 0x6C)
+ *   (2 << 16) = fn-lock on  (writes 0x5A to EC 0x6C)
+ */
+
+static int huawei_acpi_fn_lock_get(int *on)
+{
+	union acpi_object acpi_arg, *obj;
+	struct acpi_object_list arg_list = { .count = 1, .pointer = &acpi_arg };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	u8 val;
+
+	acpi_arg.type = ACPI_TYPE_INTEGER;
+	acpi_arg.integer.value = 0;
+
+	status = acpi_evaluate_object(NULL, "\\GFRS", &arg_list, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (!obj || obj->type != ACPI_TYPE_BUFFER || obj->buffer.length < 2) {
+		kfree(obj);
+		return -ENODATA;
+	}
+
+	/* byte[0] = STAT (0 = success), byte[1] = 1 (off) or 2 (on) */
+	if (obj->buffer.pointer[0] != 0) {
+		kfree(obj);
+		return -EIO;
+	}
+
+	val = obj->buffer.pointer[1];
+	if (val != 1 && val != 2) {
+		kfree(obj);
+		return -ENODATA;
+	}
+
+	if (on)
+		*on = val - 1; /* 1→0 (off), 2→1 (on) */
+
+	kfree(obj);
+	return 0;
+}
+
+static int huawei_acpi_fn_lock_set(int on)
+{
+	union acpi_object acpi_arg, *obj;
+	struct acpi_object_list arg_list = { .count = 1, .pointer = &acpi_arg };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	int ret = 0;
+
+	/*
+	 * SFRS reads byte[2] of its argument via CreateByteField(Arg0, 0x02).
+	 * on=0 → FRSR=1 → EC gets 0x55 (fn-lock off)
+	 * on=1 → FRSR=2 → EC gets 0x5A (fn-lock on)
+	 */
+	acpi_arg.type = ACPI_TYPE_INTEGER;
+	acpi_arg.integer.value = (u64)(on + 1) << 16;
+
+	status = acpi_evaluate_object(NULL, "\\SFRS", &arg_list, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (obj && obj->type == ACPI_TYPE_BUFFER &&
+	    obj->buffer.length >= 1 && obj->buffer.pointer[0] != 0)
+		ret = -EIO;
+
+	kfree(obj);
+	return ret;
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
@@ -550,6 +640,11 @@ static int huawei_wmi_fn_lock_set(int on)
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

