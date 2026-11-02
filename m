Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627572;
	b=HoLPkxcpsxdUIzMSbf5yCTUMFsKLq7QzyRnW5NFLtlvtmaAGQTmC8QD56FHDnb6wN2rr
	 a4+9XW9iwzuKt9ZUUBzEGPScQ0sbchwo9M5hHtFPvmjOtRkjfmpr8tF0dF1v+Nv9r2fR8
	 KaV+LgNrDwIUyhS75K9tB7bU1q1WCLRxP/i3zW/bzq6NZr6Z380UTDahARH9fflaKVdJg
	 oS7VsvZmwfYcGMQX8Zug7hE9EnHPI+ua6OuDyVkxYA+ijCNer7zBM5tUIZ2x9NAhQ6zqa
	 6sewauxLGlTjTI1MlDVu7Mw/2yhX5UcyQoVLzZNsJN4CJGaxrmgkOooaogEvIrTXQUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+hSSsra0t01A9ViC7W1gsCiaByL23lgWqO/7zF8RlDA=;
	b=4B/EA/uTTQFcdrTe5XMrzx2g7ZfMwZ7KgsJtZbYZcRBKxqw1P3jdoVvvGZxGXwbRATci
	 XYXbColgnX2qZJs9F+qvbHB/qO/QoAhv89jB853WWTMhScAvW4ORg6WsC/RzsQc2zp8Qs
	 wMkd9+5f52gI0CGQfyDuRwqgmFN7QmQMC+0dH6eO8CPx2k0fBmNoEhy4OZozie6lv5HQm
	 9p/Lvcki9wkdizGHqFs4211by08YKBmZZDBCa8Ic/Yx4r86tNVujo/6uUEsnfVOCWydE3
	 kSF3nsNxa36Rmp+DShiwPS+D18Dc/WTVBkyVvrjGliI5CMIkxMXeyrkRn6g7PCuFa1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPVNaGWf;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D3606A32D
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 13:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895D3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPVNaGWf
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so5149440c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 05:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627572; x=1794232372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hSSsra0t01A9ViC7W1gsCiaByL23lgWqO/7zF8RlDA=;
        b=fPVNaGWfIdmnG1Zmp4wErXiRMgF+M0G7T4qRAIidegAtM9WS2+WA6KUzHIRleugCOP
         3tFrJlYrPwAVMNWWBP0rPRXl4DhUYMOA1Zh0Rm9VJFEx31sMU/R1/PLcfk0qToWQ0bUq
         fYq4A1U56GzDylRyAcacUG0AW1Z0AfDtvSIZCIE0rKWPfxFd+cvX4nOK8Vd/yspaMIZM
         HN0egOC0fqGM/PGblDZyptgtp5mQxTsozQzK+YtUoLNhr52kxh3C4pC+MWZ52dsgStro
         9pvnCb5wwkOpcTB8OoC1YTJQ7YPZJV7N+JKi/0BQ7Xvuu1xZT3WcHSND6kBqkSFFDi6n
         1ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627572; x=1794232372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hSSsra0t01A9ViC7W1gsCiaByL23lgWqO/7zF8RlDA=;
        b=vs5OnQ7HmmCMUjWGcGqYo3h+XLAI0aythnKXjaBfV+TQnLKOcgpBi4hpZ8lKvXApDF
         Cf/q2DuSW7B4uphwrC091I1vV79wLRf0vF6C6ahJPeSKOPuDI3wa5Fg7Xbw+7k+0gkee
         DoXIhASV4RiCi+09PokVtq5aOvB83cnT9lDfElNBVNbz66ouSGSCTB/l+gStj6T7rRQl
         9bTeU7+9EUzrUoZslQsKCVh0y2wXTppadw2Atuaz45nDRyuoUxzOclt2y642wd3pdeZ6
         eRdQC1GV5ORnejlSk4jjGFsEdFOlOhMjfa1VbZ8d/UkvwNWG4tx5UiJprDtAHY4F2KIg
         B8zA==
X-Gm-Message-State: AFq9FYKnTlCHlj2nRIWT9QrtT5LQfgE3LoqXk82ULbPiUzUvnSVwfmY0
	9rPntHL5wz3/BO0z0zEvMg4vbbNlw9/P/uLvE72L3gWwUVghAq9pCK2v
X-Gm-Gg: AYBFou1lvirYl81wPy8gBEKiQP034qr8KoVyUNbOzMffBmYE1izDlB/CuN91t1UUJkr
	xqxaVp5bP0qZIP0fwIMLkALAavN4wKUpKqMU3KmBttLWutg1+OK2j3/wYVNfhdupCgDJRLEyB5N
	7NRcWhoX/lDRmbhskVcXDtGC0xbDUR10ndcUU7grXE+BVxwME0Mfh0LW2InmWe1g09fVycDVOIb
	mVjvE+2CGqDWiPpSfX57+ON9G9NvmHEmFd7Ub4Yza8kKGVx4WlNWJqgUMA4PwDZUTrKmfuQeOp0
	094+vlXTxeJepocCcKyc2Lu5Dd7FrhKMYBeAfxRXXGB5+PMIDij2ZpIrtCcXKlrvANEXkcBkvii
	yVp7VK4YWMfN59xk8gP5rg5iWq5nvyB0O3UYqZUYM/CoxgHMarN89vcrR5D15batVBe/9cZwld7
	fVQ2L5wqieqZk6yeCVlUK/PdGP+uhzlb0PVxBe72bE6Bz+chv04lp45mQasNQLN0VZ40SwQqVy8
	dcjUK4LFrOX10N7laJtPOy+2o/bOPDlnWCfxif0Wtqe4otN1yXRvDTKH4pduWtVHm+PC1xXY/Ht
	emFlnjdoY++iNk3Kh4THt72glCYapzUg
X-Received: by 2002:a05:7022:7e0c:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-1ac5a0b8a9amr15565000c88.14.1793627571462;
        Mon, 02 Nov 2026 05:52:51 -0800 (PST)
Received: from chitransh.. ([2401:4900:c96b:4969:d3e1:18b4:929a:2da2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm44774162c88.6.2026.11.02.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:52:50 -0800 (PST)
From: surirajat@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	markpearson@lenovo.com,
	hdegoede@redhat.com,
	rajat.suri@dell.com
Subject: [PATCH] platform/x86: lenovo: convert mutex_init() users to devm_mutex_init()
Date: Mon,  2 Nov 2026 19:22:15 +0530
Message-ID: <20261102135215.352680-1-surirajat@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajat Suri <rajat.suri@dell.com>

Convert the mutex_init() calls in thinkpad_acpi to devm_mutex_init()
so that the mutex lifecycle is managed by devres.

This fixes thinkpad_acpi, which never destroyed the hotkey, brightness,
volume and fan mutexes on its teardown path.

Per feedback, the patch now covers only driver code for hardware validated so far.

Details per driver:

 - thinkpad_acpi: bind the hotkey, hotkey thread data, brightness, volume
   and fan mutexes to tpacpi_pdev, which is registered before any
   subdriver init runs, and propagate a possible failure from
   devm_mutex_init().

No functional change intended.

Signed-off-by: Rajat Suri <rajat.suri@dell.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 22 ++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..0fc105fc28d0 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -3381,10 +3381,14 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	       tpacpi_inputdev->close != NULL);
 
 	TPACPI_ACPIHANDLE_INIT(hkey);
-	mutex_init(&hotkey_mutex);
+	res = devm_mutex_init(&tpacpi_pdev->dev, &hotkey_mutex);
+	if (res)
+		return res;
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	mutex_init(&hotkey_thread_data_mutex);
+	res = devm_mutex_init(&tpacpi_pdev->dev, &hotkey_thread_data_mutex);
+	if (res)
+		return res;
 #endif
 
 	/* hotkey not supported on 570 */
@@ -6830,11 +6834,14 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 {
 	struct backlight_properties props;
 	int b;
+	int ret;
 	unsigned long quirks;
 
 	vdbg_printk(TPACPI_DBG_INIT, "initializing brightness subdriver\n");
 
-	mutex_init(&brightness_mutex);
+	ret = devm_mutex_init(&tpacpi_pdev->dev, &brightness_mutex);
+	if (ret)
+		return ret;
 
 	quirks = tpacpi_check_quirks(brightness_quirk_table,
 				ARRAY_SIZE(brightness_quirk_table));
@@ -7575,7 +7582,9 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 
 	vdbg_printk(TPACPI_DBG_INIT, "initializing volume subdriver\n");
 
-	mutex_init(&volume_mutex);
+	rc = devm_mutex_init(&tpacpi_pdev->dev, &volume_mutex);
+	if (rc)
+		return rc;
 
 	/*
 	 * Check for module parameter bogosity, note that we
@@ -8913,11 +8922,14 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 static int __init fan_init(struct ibm_init_struct *iibm)
 {
 	unsigned long quirks;
+	int ret;
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
 			"initializing fan subdriver\n");
 
-	mutex_init(&fan_mutex);
+	ret = devm_mutex_init(&tpacpi_pdev->dev, &fan_mutex);
+	if (ret)
+		return ret;
 	fan_status_access_mode = TPACPI_FAN_NONE;
 	fan_control_access_mode = TPACPI_FAN_WR_NONE;
 	fan_control_commands = 0;
-- 
2.43.0

