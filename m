Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2035349CF3
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 05:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744511; cv=none; b=onG/zfICRLtDpsPkAg5JRegig5ymJzYcsy9kgNzYd5vo+6ZJ99G31kcJHgBPII1KmnjcJCnWNyjPBTt/Sa8fFmSMgZx8HsQ01AHl7P+ZhkSZtgQp8GxlpB60/CLMkS2kHoUkCm1Nz3K5wro6HreJEMQ44aBQzrAJiDDPXF+Qgcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744511; c=relaxed/simple;
	bh=Wj6fEXUo2kKp8r2C5A0yqiHnwm8Zped/Gi+sUjz73zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Po8xODqB9E6OUJ9Kzhhg9cKnsA5Eoc34ea0prSr+9vN+9zupQAo8mMEaSAVs2tooz+vrmCAfT7ni7U/Es51CBiT/c5HLJTME/xQOijW1BJinnrP26LekRlsoeVnWNpfj42Q7KAukaoDZBLde1rA6NiwjUYqzfkJ6fTxrgIutJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4ydRHCI; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4ydRHCI"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7552389eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 22:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744509; x=1791349309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1Yx/ERGrvzLNDM/aln7d4fjkG8qSALCIn2H16VCKuo=;
        b=n4ydRHCIqCAsw1K+lzIlYNKLFXdoS8AAhQJ42GK2+qhP7+YxcB2nrvDndTJ35xhkyX
         nUKtZKENfdR8ps31gPFAfVchFhWqWHSecrB7V0Fv+8YJYQEoEUginNZgC9mre2+ceL3a
         rnXOy5Tzgcwqlpz2qlrCJZRVIU3lvVweiTC9Od2zHGkXiQ3jIHbLwAGK7RFip+5jVGdV
         9Rr9mQlBDmzVsoOQbPvKoyYJKEp+ZutbMmF2yFco8oaxVm5pC4wP+1HjqolF7vERGoQj
         XbRQo53ETRX5Qv5F8PpUILKR6Qy0OkCiXUzzVFEanz0uGf2VLLaEEDVPdLqcDB9+AvXv
         EjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744509; x=1791349309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1Yx/ERGrvzLNDM/aln7d4fjkG8qSALCIn2H16VCKuo=;
        b=svcFfXMVWvtjyB7IBAeKIzAtC7oJGazR7nlO8j8W8b26RP5DIJPYKyWdqCifXhpp/n
         aCHAN/B9KCEiA+UsIo74fyClRTb2cTyWivUPaqyW7T8DKnK7A7Di7ajdWTQhbKxN6rzo
         NS74BLtr4XviQ6ui4syHDg+16rKRtI8XGukQqJfD1lKKcrfEXecGwo9CHfJtRR5nWK1t
         lRh9cMOz8w9AJ0YVp4M3POu7IOrn3dn9uICCAeuAcsZrwF2KhoHwfSZh644pv8XOamS4
         N/83BKYufU1u4bWV8BGL4iyamyNbPlR3gVkFQPrF2czjUzgfXdIlAI0bBVVY8lZ0BC0D
         murg==
X-Forwarded-Encrypted: i=1; AKwUvBzdF989oumqeNV1S1vNpkE8CQ6GS4tKtC0m56OmMx4IhY04KwkRzSPOCZ3JINcmmP5hndMYAhwp3Oe1PV1Vlfy2w0/e@vger.kernel.org
X-Gm-Message-State: AFq9FYIz58zOQ1e2bXdMHMZP9f9edf9W3W/2rI9JEggZQB1IWOLwWXIv
	EZcx1syITd2HcMHcegnJpTunQs1dSV1wvOyhkU5jX1SfNqrgqjt34aI+
X-Gm-Gg: AYBFou1KAc5Polc+THBjyOdwIpmbvIyqCxrvy/YZCDsa9ITuaOWa752FajyL6RM4MRd
	OnIYLlqIoQG0cRKDVIvWdzsD3OqrCIs1zQRwGO4k8FobcJKJNXnm9Kkmg1hpWrQxrpZyu/cIt3Y
	MzoiSoGXa3siuGfW2p9IAxak8RcG2HeD99QRPyBo6CcJn0pjcivaPbhXw6pakfUox6eJ7VVnpBY
	WNmxduneWheEcQ9U0W0qLPwli+Lr4Ty6yqxah5zv9HHqW9OzIqMR0qebST68bWpe+Cp+oJ6cBYr
	rYspx/J4qJtYix3prfIrVA7fNK7NYocqBOkDcHclxYvnT2w0E2SiElAOs6QH1jUjqBFdUJCjcxt
	LDp5ZPifJCJ6Kx91BpjZO7pUCk3ecUdXsUcvb1GI1XV61mOSCyXU9tiqCpKDM7dgcZKB8ZlB0Sf
	NIqufgGlHJPojnNgwsBMkhCAVtwuSXrwV4rK5Od2rc9i5mIVTWvaHDnfDfKxQ3mtYTwOK7nD8Mc
	D7nxsHZWXndPtqXARqLVQurJakmuaOTr6EQTSaqeg/eq0nAMUiFNLt07gUZqX8=
X-Received: by 2002:a05:7301:1522:b0:33c:19bc:d8d2 with SMTP id 5a478bee46e88-34cdd0af6c7mr481285eec.31.1790744508699;
        Tue, 29 Sep 2026 22:01:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613b0c4sm778125eec.28.2026.09.29.22.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:01:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Sep 2026 21:59:11 -0700
Subject: [PATCH v2 2/2] platform/x86: thinkpad_acpi: use __free(kfree) for
 automatic cleanup
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-thinkpad-acpi-cleanup-v2-2-88e176953a4b@gmail.com>
References: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
In-Reply-To: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Nitin Joshi <nitjoshi@gmail.com>, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
X-Mailer: b4 0.17-dev-6c14f

Use __free(kfree) for local pointer allocations in
dispatch_proc_write(), tpacpi_evaluate_bcl(), and auxmac_init().

This ensures automatic memory cleanup when exiting function scope and
removes explicit kfree() calls on exit paths.

Assisted-by: LLM
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Ali Ahmet Memiş <aliamemis@disroot.org>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 42 ++++++++++-------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 645df773fe63..93fc69a7dd63 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -891,7 +891,6 @@ static ssize_t dispatch_proc_write(struct file *file,
 			size_t count, loff_t *pos)
 {
 	struct ibm_struct *ibm = pde_data(file_inode(file));
-	char *kernbuf;
 	int ret;
 
 	if (!ibm || !ibm->write)
@@ -899,16 +898,15 @@ static ssize_t dispatch_proc_write(struct file *file,
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
@@ -6711,26 +6709,21 @@ static const struct backlight_ops ibm_backlight_data = {
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
@@ -11075,24 +11068,23 @@ static int auxmac_init(struct ibm_init_struct *iibm)
 {
 	acpi_status status;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
 
 	status = acpi_evaluate_object(NULL, "\\MACA", NULL, &buffer);
-
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
 
-	obj = buffer.pointer;
-
-	if (obj->type != ACPI_TYPE_STRING || obj->string.length != AUXMAC_STRLEN) {
+	union acpi_object *obj __free(kfree) = buffer.pointer;
+	if (!obj || obj->type != ACPI_TYPE_STRING || obj->string.length != AUXMAC_STRLEN) {
 		pr_info("Invalid buffer for MAC address pass-through.\n");
-		goto auxmacinvalid;
+		strscpy(auxmac, "unavailable", sizeof(auxmac));
+		return 0;
 	}
 
 	if (obj->string.pointer[AUXMAC_BEGIN_MARKER] != '#' ||
 	    obj->string.pointer[AUXMAC_END_MARKER] != '#') {
 		pr_info("Invalid header for MAC address pass-through.\n");
-		goto auxmacinvalid;
+		strscpy(auxmac, "unavailable", sizeof(auxmac));
+		return 0;
 	}
 
 	if (strncmp(obj->string.pointer + AUXMAC_START, "XXXXXXXXXXXX", AUXMAC_LEN) != 0)
@@ -11100,13 +11092,7 @@ static int auxmac_init(struct ibm_init_struct *iibm)
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
2.56.0.rc1.315.gc6ed9934b7-goog

