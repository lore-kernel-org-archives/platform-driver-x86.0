Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1723D954D
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997176; cv=none; b=UDgFWoliTeUPlHAvaOyIDIwjuaIYTU250hPMogXJzHXLrDL0D43cdsF4VMjZMnj+QVrYKCnDPtOfct2165gRsxSuYkTRwwtdpL1tpvSLXH2E8zKS/J22hhawCCXffV5t38jc16KzJgN8bkztsUidihvVFmHhoUdmb9gMaeDK0/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997176; c=relaxed/simple;
	bh=4ZQW8bAzXf3z6xTN3u8cqfzyMaqOtkEgC7NekBmJE+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hD+1Lw7Uy8KuZj2boy0yjN0hFnzHPJUSpkeep0510MlJisS6kG7DLkwlA82ux6inS0TFhBDZywbR5t/hBKx2txAUWkwZH+b+A1ItuWEvrYbQwkCwK39yEzyciKbCSeCTZ6wUdKcL7fJWoZQAAg/M4RNCFJmr7u8lWhM19dEGkRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcadzZSF; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcadzZSF"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2229249a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2026 23:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785997174; x=1786601974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a8OsaR2KbXJDR++z1B7bBvi3orWX3t7kh3YROuTJgmM=;
        b=ZcadzZSF13qNoO7MXeCcrlQqeGOUyea16+aVLU18H4ed7fURBAFSdBO6bV+Ely9Ttb
         +Toz0UTvD0VrK6HjAHtpJCQkAJgO5faZAkCc2PG2X/h4tnn7SDP4FUKcj80iWs1VAkWt
         l09oaKeBwA2xK4pXqziygpkBs3lLH2JFKWqZdnaZLmbo6sUzgbXkv9YjoVEFlZf7OSTq
         6je2w32ZQRyhzLwy1YfyjijVii8DaMlhMZSwqLAj5iBtSCGLR+iY6uBNxCHpHBucxanH
         ENzeLCnNHQFRMMhob1N8QbjEf1PAU5zRBXVlbyqXPGv5/dnOgO2Uw22OpCSw2ilNvyZS
         sGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997174; x=1786601974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a8OsaR2KbXJDR++z1B7bBvi3orWX3t7kh3YROuTJgmM=;
        b=gnVTvxc9uvmLyMLPuQ4XWjtq2d/PFLNvBpbhVtKKfeyDcwcr+s3HsvW//s5vMlwRq1
         MfaDS9V+o6Bt6gTfygSyEGeN3rRoKbWWRC6WU+GfuSJ5lW5aLUK2jKFsS39pQj8VBiP3
         5WEEU06Pbbl8IEFpTo2rmV8yWusQj8rrcJzwbwxoPXVC5p8ACFC4rnrbw69OEmxnI9Mn
         kWEgQDAzC0C4MXRlDcCms3E5payBCVYx0KhJPsw5TYUO5+PyiJFeZ8MFx/UGb5wLR0fk
         S0HlLIMUSKx+9viQhBLiWQBPCgOOBOqbDRXLAfsP9c08PIIh/QUZZRJ2WR/KvvXOKK+h
         sv6g==
X-Forwarded-Encrypted: i=1; AHgh+Rra+dsw5IipBYGSxquHqQnEzuAtNdXwI2hwGF9CEOwy+SwMIbi2Xm+JAngAgundfPF1kdEktnsEtnYWkzML1/fUVjKi@vger.kernel.org
X-Gm-Message-State: AOJu0YxfHZUnF7ifufqGdumpfBo7OywXIFBj6oUgXuof6NMUISyq+gYU
	Non736VwV+CFmhXKfitvr3auhwy0Afiqv/IqjVUrH6T9ngQbBdvcgbYB9VtdGA==
X-Gm-Gg: AR+sD10SV7U9YWjlW+eOqJY+b5VaAfTbbtiFaM6o5hEjPcKa7RvpyOf2kvaRypSeq0r
	EHfF30VqWKHFic6f/m1OC4juBIpfxnnRTp18zZMun3KYAwJ+I8EHzfUMp6hxw6+FkDzh1oGnAK4
	sMKwhI42/wmvKcUNoqEw8J68AH7Htogs5EkKg1El9/07imXB7sKdUy4uMU7NvD2zS7+887bqN2a
	qahArilYKNqGM/m0eXTD58ho0DiRJlkIgnan18htfFJoUnSqGnXmv79qt/OO9VXiEX6AhfC4Ks7
	ucmF/XnJLEk0doW84zEiq6hJ8HuJ8uXhZtWE6cBmiZX/HAbTgBuCLtCvzCH4oRO0iig7HCn5CQj
	ek/wPc81mkd8WkLMAV+U6mPiIcMMuSh+3ooh5n1qvaAnk0ttQRnu8kqFjApYmQN7KdA3bDA/ot0
	jrFk6IYApQjJK8L25+cynkLGUf4WXZ0sQBWHztrXgcArZQuCkDR8ayjdvPGpmDz86A/Pp1h80H+
	XPEZg3XY9EN7p739U9nwGoKd1t9Vx9vhnIqVCJb+lDCkrytHnk=
X-Received: by 2002:a05:6a20:e212:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3cb85bcef1emr12802930637.0.1785997173912;
        Wed, 05 Aug 2026 23:19:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d081:36b2:965:e66f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50acddsm21651689c88.3.2026.08.05.23.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:19:32 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nitin Joshi <nitjoshi@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: thinkpad_acpi: use __free(kfree) for automatic cleanup
Date: Wed,  5 Aug 2026 23:19:24 -0700
Message-ID: <20260806061925.625482-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use __free(kfree) for local pointer allocations in dispatch_proc_write(),
tpacpi_brightness_get_ecnvram(), and auxmac_init().

This ensures automatic memory cleanup when exiting function scope and
removes explicit kfree() calls on exit paths.

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 40 +++++++--------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 0d0d6fe7eecd..200e20f90a4b 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -885,7 +885,6 @@ static ssize_t dispatch_proc_write(struct file *file,
 			size_t count, loff_t *pos)
 {
 	struct ibm_struct *ibm = pde_data(file_inode(file));
-	char *kernbuf;
 	int ret;
 
 	if (!ibm || !ibm->write)
@@ -893,16 +892,15 @@ static ssize_t dispatch_proc_write(struct file *file,
 	if (count > PAGE_SIZE - 1)
 		return -EINVAL;
 
-	kernbuf = memdup_user_nul(userbuf, count);
+	char *kernbuf __free(kfree) = memdup_user_nul(userbuf, count);
 	if (IS_ERR(kernbuf))
 		return PTR_ERR(kernbuf);
-	ret = ibm->write(kernbuf);
-	if (ret == 0)
-		ret = count;
 
-	kfree(kernbuf);
+	ret = ibm->write(kernbuf);
+	if (ret)
+		return ret;
 
-	return ret;
+	return count;
 }
 
 static const struct proc_ops dispatch_proc_ops = {
@@ -6628,26 +6626,21 @@ static const struct backlight_ops ibm_backlight_data = {
 static int __init tpacpi_evaluate_bcl(struct acpi_device *adev, void *not_used)
 {
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
 	acpi_status status;
-	int rc;
 
 	status = acpi_evaluate_object(adev->handle, "_BCL", NULL, &buffer);
 	if (ACPI_FAILURE(status))
 		return 0;
 
-	obj = buffer.pointer;
+	union acpi_object *obj __free(kfree) = buffer.pointer;
 	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
 		acpi_handle_info(adev->handle,
 				 "Unknown _BCL data, please report this to %s\n",
 				 TPACPI_MAIL);
-		rc = 0;
-	} else {
-		rc = obj->package.count;
+		return 0;
 	}
-	kfree(obj);
 
-	return rc;
+	return obj->package.count;
 }
 
 /*
@@ -10989,24 +10982,23 @@ static int auxmac_init(struct ibm_init_struct *iibm)
 {
 	acpi_status status;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
 
-	status = acpi_evaluate_object(NULL, "\\MACA", NULL, &buffer);
+	strscpy(auxmac, "unavailable", sizeof(auxmac));
 
+	status = acpi_evaluate_object(NULL, "\\MACA", NULL, &buffer);
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
 
-	obj = buffer.pointer;
-
+	union acpi_object *obj __free(kfree) = buffer.pointer;
 	if (obj->type != ACPI_TYPE_STRING || obj->string.length != AUXMAC_STRLEN) {
 		pr_info("Invalid buffer for MAC address pass-through.\n");
-		goto auxmacinvalid;
+		return 0;
 	}
 
 	if (obj->string.pointer[AUXMAC_BEGIN_MARKER] != '#' ||
 	    obj->string.pointer[AUXMAC_END_MARKER] != '#') {
 		pr_info("Invalid header for MAC address pass-through.\n");
-		goto auxmacinvalid;
+		return 0;
 	}
 
 	if (strncmp(obj->string.pointer + AUXMAC_START, "XXXXXXXXXXXX", AUXMAC_LEN) != 0)
@@ -11014,13 +11006,7 @@ static int auxmac_init(struct ibm_init_struct *iibm)
 	else
 		strscpy(auxmac, "disabled", sizeof(auxmac));
 
-free:
-	kfree(obj);
 	return 0;
-
-auxmacinvalid:
-	strscpy(auxmac, "unavailable", sizeof(auxmac));
-	goto free;
 }
 
 static struct ibm_struct auxmac_data = {
-- 
2.55.0.679.g6767b8d81c-goog

