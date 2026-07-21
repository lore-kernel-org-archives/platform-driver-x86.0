Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D043E071
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 22:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672439; cv=none; b=EHVps/QxiOWvviOO5H5e93h5qubyfVPEkZUdGDd0aPPXSiolXG9RUrNyaS6XRdoAc+arrq0cYHJPiHSMPF+oesNRLX0X1zBM7mi/CQw2gbfDlxTtNwQ2QBQYCn7xe/vP7INeGX6h+2+4RdSx+ThzMR3VH9Vsc2efEc2YtfCqez0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672439; c=relaxed/simple;
	bh=Hu0FPrigAOItOFw3LRem92ouB7CcLpRd0/8ZKHxvnJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2kFn3JuOOtVHXHSYNQvdhi39j03OgQdlH2p1gT9ckBZhQ+2IfxZCBVRplX7N9z3AYZW4H3Vofc4PMXcPuMeLrNKcxQLzWhVAKY0V4pu09ccmEAFR+BnnAukkoXEWteuSU0an8pT6z3n9O1Uidr9oz/+9vbdP/aGOxVF83yjmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYiRGE04; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYiRGE04"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4955de8797cso16503565e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 15:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672436; x=1785277236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpAkIPycj3nXTBs0w+U1JyrnXqSOdBo+DmzjlLfS+mM=;
        b=LYiRGE04gVcfc3o+2GKup6Y74pq+eZr13K6qfSWvkNs+vo06HGGkMrPtpZO1oNFWBu
         TuDjuoHIuCd5+8qsrfE+n0DgN5NFi/Tafhl+PAjp6XYcF6r0ZDqhOOAKmxhr/8tjvogS
         oQ7kabZG/g3xAEAgrU8Jt1o7BoAXfdFCt+SrmtuAoSTYKbG+sPIEJ/0/Yttjh8Qtp0To
         xeijEqwNgq/SUJ8U+O/GLqctZxWmJf6YsViPym1KumztahNyfhVquyC6uoN3zagXHFBL
         J0YTem6VLhOGRBzTmlSl1IOi+PpgGyZiN/6Pl4JIXJyDl7dKsvcHUBHxD8wnRKCYN1Td
         Jj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672436; x=1785277236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpAkIPycj3nXTBs0w+U1JyrnXqSOdBo+DmzjlLfS+mM=;
        b=jPrYaL1pGnjo9KddVCok7rZWcMK2SdlLscY4WdceAUDfCURAeUA0EnPHXCGqz2c9M0
         5G3BHISgMsMR7su7SVbp+LjFxWOc/y+0hSjTfDjqz+Dan9z3usNNn5x8zp1YX1uFXv0s
         j09sR8PjAqiP7xbZY3h/j3i4F7QR/DuVxM/zBm5A96GxVLQPZNKqzLyg7Q2jxtT14yDY
         JhjeEGhHkV8k+IuYlae+atM+c4AUtvjQRZHPeUflaewhrZurjM/FicnPBhXm2sBG19aQ
         iPMkxrYMfVF6jV/oMBcTlHky23ynwrC5cLy00bA5ge5k4cX/NQHM3TfHnZlH5kLOfr5c
         Gapw==
X-Gm-Message-State: AOJu0YzRbLmceq//IGR4DB8AFToxOSYAnqmi/5xZFjRfw26c6UxRBmjR
	SjGoS8JD7vZmYdCm/btgQOI26gzeQ81vg5MPkR0CKBVTRXwfZr+GaD6I3TYVNA==
X-Gm-Gg: AfdE7ckQ9o1ou1fN/QNK2specGg76G7vj8p/5w3JhiOFNdXUsREtKNNoZEsJrnnQTYu
	bhd6FvvTU3uP3bj1vvApa6+AU7IKgr9qaCFaLIt2L+9t44sgzJPnI0lztXr4Xxjk1FdpdiWRBLX
	/7wP2aJ2fCPGKEThcVH7DWrj4GEpoqyY/q1Vqv+0ARA3BHYTu1Jx1HIceyvUN3HPHlRNyVzfEE3
	Z7MC24CS+1JYq4dy3a470lJ0wvHJZwq4I7TufqBQoMFtIHRtD71fhKogBwRxpuhWQnHewn2khVR
	uPCUQ/yyKtemQnlMnc1uH12Dk+APbwiV1vvFmEW6OBqVUsSUf2eu/HsIY4dPhwzpbsSbCgIlfnu
	5Wi2OKsj+ulWizFmumqPDMKv6N55+8aGAwvlD4M6GrhEQIXuAfI6NtQOqHruPETXUs9Xp39wt95
	vvHQ==
X-Received: by 2002:a05:600c:4504:b0:495:495b:9248 with SMTP id 5b1f17b1804b1-4954a3d0cf9mr219647215e9.4.1784672435982;
        Tue, 21 Jul 2026 15:20:35 -0700 (PDT)
Received: from user ([154.176.96.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bffefsm89553165e9.9.2026.07.21.15.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:20:35 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH 2/2] hp-wmi: use modern cleanup and refactor allocation functions
Date: Wed, 22 Jul 2026 01:20:20 +0300
Message-ID: <20260721222025.29917-3-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721222025.29917-1-yahia.a.abdrabou@gmail.com>
References: <20260721222025.29917-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Refactor hp_wmi_perform_query() and encode_outsize_for_pvsz() to improve
readability, ensure memory zeroing, and verify bounds.

Replace the brittle if condition tree in encode_outsize_for_pvsz() with
a switch statement, replace the manual out_free label in
hp_wmi_perform_query() to free args and obj variables with compiler
provided cleanup __free(), replace kmalloc with kzalloc_flex to ensure
that memory is zeroed before use, and add a bounds check for
obj->buffer.length to attest that it is larger than
sizeof(struct bios_return).

Reported-by: sashiko-bot@kernel.org
Link: https://sashiko.dev/#/patchset/20260712191130.41183-1-yahia.a.abdrabou%40gmail.com
Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 49 ++++++++++++++------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5845b169df39..67bd3d6825f4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -552,16 +552,20 @@ static inline u8 pwm_to_rpm(u8 pwm, struct hp_wmi_hwmon_priv *priv)
 /* map output size to the corresponding WMI method id */
 static inline int encode_outsize_for_pvsz(int outsize)
 {
-	if (outsize > 4096)
+	if (unlikely(outsize > 4096 || outsize < 0))
 		return -EINVAL;
-	if (outsize > 1024)
-		return 5;
-	if (outsize > 128)
-		return 4;
-	if (outsize > 4)
-		return 3;
-	if (outsize > 0)
+	switch (outsize) {
+	case 1 ... 4:
 		return 2;
+	case 5 ... 128:
+		return 3;
+	case 129 ... 1024:
+		return 4;
+	case 1025 ... 4096:
+		return 5;
+	default:
+		break;
+	}
 	return 1;
 }
 
@@ -590,8 +594,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 {
 	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct bios_return *bios_return;
-	union acpi_object *obj = NULL;
-	struct bios_args *args = NULL;
+	union acpi_object *obj __free(kfree) = NULL;
+	struct bios_args *args __free(kfree) = NULL;
 	int mid, actual_insize, actual_outsize;
 	size_t bios_args_size;
 	int ret;
@@ -602,7 +606,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	actual_insize = max(insize, 128);
 	bios_args_size = struct_size(args, data, actual_insize);
-	args = kmalloc(bios_args_size, GFP_KERNEL);
+	args = kzalloc_flex(*args, data, actual_insize, GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
 
@@ -617,19 +621,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	ret = wmidev_evaluate_method(hp_wmi_wdev, 0, mid, &input, &output);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	obj = output.pointer;
-	if (!obj) {
-		ret = -EINVAL;
-		goto out_free;
-	}
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
-		ret = -EINVAL;
-		goto out_free;
-	}
+	if (!obj || obj->type != ACPI_TYPE_BUFFER ||
+	    obj->buffer.length < sizeof(struct bios_return))
+		 return -EINVAL;
 
 	bios_return = (struct bios_return *)obj->buffer.pointer;
 	ret = bios_return->return_code;
@@ -638,20 +635,16 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
 		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
 			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
-		goto out_free;
+		return ret;
 	}
 
 	/* Ignore output data of zero size */
 	if (!outsize)
-		goto out_free;
+		return 0;
 
 	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
 	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
 	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
-
-out_free:
-	kfree(obj);
-	kfree(args);
 	return ret;
 }
 
-- 
2.55.0

