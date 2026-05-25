Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A5383303
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714069; cv=none; b=YNJu7eVJDpIcI4ZyEAIbfinPbI+qFZxHttrcGtLLV3RhbZCd5ImVYdVkIFYAfq9eykvMi2XyCHsqIvtAeeE7zxywyb9bi/vlGO9226tg0dN76kiSRUScQt99oNuh714hZl4xNUepNjuKJGSv7QCi/AT037oryf4ZcnVjvUQPq8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714069; c=relaxed/simple;
	bh=mjPoJMEMlJrj29vjvAPQf0GAK2w+puem3Y7W9F1FA3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Whobsi7evn2Qldx5+0MrWWkcqUhYeeXz1dJD/j0ibQ+vzRrpzPgjhfB+3gSeJkFN+0hpBP6U45xuW8knK0k6T9M+38suFwYN1UaBqKlUm/7Q0wBJfR8Srq1csYicAII4yH8zBg+PXVm5qgdyDevbXBNrQLLX4/m/kE3HMr+8f4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMA8C2ck; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMA8C2ck"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4526a8170ceso4740959f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779714066; x=1780318866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz+IXnhSWChmlsV4yBd6pQ1DanE8p6crp/ivKdam1cU=;
        b=fMA8C2ckXaArvX4MstMDJ1+mQMVKz/kHRsHqh+ubN61NjsTpPOYChqo+XH71fypoXo
         wlR6sLoGM/zHc0grTNiNqEbqyN1lC17pbHv1BSgrXH09BwlPo8tMrROhtyVFm6u6K7lb
         T50qrUPAPJY3aNml8iBYnR2rMhQEdqcd/yQsIFIzHQKLWjPxyhGBKj2vFPL2vQH9m1qo
         xM0VbfGmdYe9MNjRR6odE9+fiARIFYB1dGQaKkQozQ44IWSvpO1rSXr88q+TB3QPEG/R
         weNT+isM8rChq4A3G5hpwPellhcahTMo4rRmpxtGOJyF1v074rECMGGlw+G5lHzNs41V
         uftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714066; x=1780318866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zz+IXnhSWChmlsV4yBd6pQ1DanE8p6crp/ivKdam1cU=;
        b=ovUsaD/vXxSzCeenWi41W16a+/C48J8u8gSSX8gl323HV0+LriuKwkTb+G2hvuhBO0
         p0ha5S9VmZ6fk2rgOsYcmFd6YQtHJzYopFf51lap/DRM11a5IkD113WO0naCdYurykfl
         3xZxE1WiWitguyIKzPIU9AyO8+Vm7aNoOfmOC7/sBPUEVQq958kesTCMkWQiiLSn/5j1
         Iv8N5g1RjKPp/vD/1jRKoWkgAA4yMwyjiuKnu8/2nq9ZUNmwMCoaK0h1ZqUgW9BQuV5A
         7dSUscWGTQx4ZfKvoWfmAC6H2EzUbg4ECJJYMWikNhmK3UeF09n2hBGLlJ496JjRSNYx
         5A1w==
X-Gm-Message-State: AOJu0YzHIEJjKjID0OG6C9P88I4HU/quJAdt/MyJpZcJRTMd184chJhu
	rPal69Ggpzyx7l7QgYSyNBpsjk93Onrgv6i2I0MzABvq+3jTyo2lOG34JkcBLtV/qsE=
X-Gm-Gg: Acq92OGs3h6tZ0HjVvdA3n9U7tLJZQJG0bqrjX6bDl8roxj7RfDeewjAZNT/Bzy2x3X
	v9O24vOp5LFIy9qG6eX8F/k6hWy7ss2VOT/cjLK1paKQRtT0HhnxwzLRm2LgBqICfVCerPqb2lc
	f8EjD20mKP2QQgDjDeQZzkuUKus723pwscEUThqZvJm4tXM6ru46OLgX+TyOR9LvdVrwDyfXvQC
	DD6cDtku3cwUtCpq20Ekh5WAEX5F6j5lbrqgwvceYKQRoH1illKG8GAmxlS/FDkU1OAWq4GbP+b
	ORAe3zRwO9HuvZQWTw1GYQ+4zDgE+lKK0vBoE/FnBBmS6E+v72hX8wxzwG7wpwZHeqcJNwB4FiW
	9LS5PSmHBwh1jsIz9YDjW8ZJgcRZXerAyh0EiUhYwaj5VYOnURaTUcPe3+NPBVa1YgydN7hNmxP
	yJfN10wkZ9fhFr5ofGmpO3
X-Received: by 2002:a05:6000:26cf:b0:448:7049:a6c9 with SMTP id ffacd0b85a97d-45eb3688808mr23247316f8f.5.1779714065731;
        Mon, 25 May 2026 06:01:05 -0700 (PDT)
Received: from localhost ([37.99.69.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5c32esm26035356f8f.26.2026.05.25.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:01:05 -0700 (PDT)
From: Shaposhnikov Daniil <2minesweeper2@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaposhnikov Daniil <2minesweeper2@gmail.com>
Subject: [PATCH v3 1/1] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer models
Date: Mon, 25 May 2026 18:00:57 +0500
Message-ID: <20260525130058.7408-2-2minesweeper2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525130058.7408-1-2minesweeper2@gmail.com>
References: <20260524121510.36961-1-2minesweeper2@gmail.com>
 <20260525130058.7408-1-2minesweeper2@gmail.com>
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
 drivers/platform/x86/huawei-wmi.c | 101 ++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 93cca17fdf58..8b0a52d66771 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -527,11 +528,106 @@ static void huawei_wmi_battery_exit(struct device *dev)
 
 /* Fn lock */
 
+/* GFRS byte[1] / SFRS byte[2] (FRSR) fn-lock state values */
+#define FN_LOCK_ACPI_OFF	1
+#define FN_LOCK_ACPI_ON		2
+#define FN_LOCK_ACPI_STAT_OK	0
+
+/*
+ * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024) use direct
+ * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status) to control
+ * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
+ *
+ * GFRS response buffer layout:
+ *   byte[0] = STAT (FN_LOCK_ACPI_STAT_OK = success)
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
+	/* byte[0] = STAT, byte[1] = fn-lock state */
+	if (obj->buffer.pointer[0] != FN_LOCK_ACPI_STAT_OK)
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
+	if (!obj || obj->type != ACPI_TYPE_BUFFER || obj->buffer.length < 1)
+		return -ENODATA;
+
+	if (obj->buffer.pointer[0] != FN_LOCK_ACPI_STAT_OK)
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
@@ -550,6 +646,11 @@ static int huawei_wmi_fn_lock_set(int on)
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

