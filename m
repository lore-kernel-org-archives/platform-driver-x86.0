Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974208;
	b=gMyQ73ObD7XdgIwjzSxrKwIxKSNbXKKUFM5kQbfxa3m1n2/GLyPEIBs73MwqOqRLYH3e
	 bh2UQ9x7dFvvOlUj41NXhm+oXWvPYjV1GwNASxnpuvnB2mYyVrWJmMDswdw1o+zuRbEI7
	 YBynscyes8MiniJCpWe0NhfLuV7IpAuVDTYDGnyY98yDFEo2m08gSZ4W2ULkp74rFJcHa
	 AcQ17RUmCu07iDKTfy0Iy2XAMp5Df4LqdcSyozQ4wW8lKkFiO76d6yCCIOfWOkC5p3fvE
	 pfe2/ErgC480mYcRPys/GXbgFTjSaxavKxmJN2wMV7XUjRY4wj1S/FVQW07qoUdt8eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vyzlub+tX77xKNMVdjg1KlW3Y/RRft+bFPDueHBnXnY=;
	b=AjYcrdcjTqll3N0iaXofftBVgHU5KLw8DpmUHfWdbAsv1bYq8TVUHb17wDpG081K+uXZ
	 zgxiO9DVHRLJw0VIZxdAPbOPo8Ui9GySI+wr6/WN2i11z+gUPudjgqSrMgHOLUxnr1xGc
	 2BLwbV36iRNRB2wd4Tva+Zl1EzGxeaLropw/GmAOH0cAO9JcXhuAvjEXFTkIyPaoMH3pK
	 MGCimieqru8Rfs6RCzZKi8dS0Ge7t40DG9mRmfnVyYdZRo6VsGT8TkUNpU5KAk4kKPiCz
	 SXJue5xoQHRGj/z945i5/zoDj6eEp3TRtZiY7mu18LgWOef2+s8unVYAsqBEY3+lLvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="em6ywGT/";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31BA606A325
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 03:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=em6ywGT/
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so315198a91.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 19:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974207; x=1795579007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyzlub+tX77xKNMVdjg1KlW3Y/RRft+bFPDueHBnXnY=;
        b=em6ywGT/Ynbfz9iElEk0eQI64ltfWxlCtU5T1caunK7DZkAjh+ZJzXQ3J+5XJYw0s/
         BVo8jJIV8x03sKYF7Q7WoS9iPl/1gmI9Fp77j0DBFCvQ5ANC0YFHZ2GZLAKXCoFZ+W1E
         u52xaw12crcOUt94uJZfRTwYI9qNhKtQ3bwF56yZ38yKOZU0hBZfDgs5fPfwraYmFNQF
         oyfJYPigP3lSj+44LXreBLJIxBYVb4AxhVqvxWox3RdId3rZNxUM1tzG8pQXha2fdgmr
         N/b1Ku8/4A7Ujc+mWGASBQ3at3OBp/QQOT0tGtpy514Z0mTOh9Bw01MYg0xwN+ipeHMC
         UFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974207; x=1795579007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyzlub+tX77xKNMVdjg1KlW3Y/RRft+bFPDueHBnXnY=;
        b=h2WRxffh0I9TOw6M6EOiC1/dINepLrksNyMgpKB313V1plLAXp4jG3hLKI0WVNJ7vM
         S+nDSrl2y3N95vJKswHC7h0E0PrSVZ6HVYEg6saH+e7kI/gfEHGKu735f3NuBw4apoSz
         hy5REdMuDeRXEeNuSQGpAoxsGE4GOGRS/1fKa0ULagaewpP8sYKBT0d0fGRNBH0Cz0SS
         NlSngUv3fH+2iEo7P1gSGrudLyJE3QstDcEiVYXHDYeJOpdHizBSYLTHbaMDuVjucf+p
         doKvCxCkrtJ3SKIu6/Q1oiFRz6Q+oB6Ub15NZba6iO1794Ce1HMlj2j/sLyUwpWJaFzj
         oE3Q==
X-Gm-Message-State: APuU4Z9qYXKSCz3dPZn2qep5J6Uz/FsWT76nlB7IcMEHHkg/101hR5iz
	Dk8uHxRDGrb7G66U91x1XMv6KXxaBQr66R1xVao95H3qBp9iXjQuyRwD
X-Gm-Gg: AZFdTZdhdbuHcnrMaSGqHpHkOKaMlEwdGJ+aJqftD+aIu0R083q5Wb2hEoQrnLwRzet
	EiGJs/8m1PYtfk3OTAAt5DdFIEqRimdKLUj2xrNH4uN0tKQqCY8V0sXSr+s1rR9/x6A+W1C+mup
	S8dKxQ2Sz6cSNS4pcS7K18b/cTxlFD0AEGwCu03aPbTL/3GECJI4J/Kg35MTrNgolbdeYXOMATz
	T17NJCtqeyiZ1rjDxrFkr7aHH4nA3pECctjgcLduXqTrM+jE2WHzp9/uvAjpfd8AIjZL1gVpEfZ
	U0DyPcDE3z+RP9PNmzJN6Aks/b9Q8D+k6YI17d9xtar6DPK+96iL5prydGxtkyw+10a1zC3mOkT
	eSs36IaeXolNpH1ZglTfqzQXyLrLp35CtDaWuc9X3PQCZvG8kQBEvx+wBhbwRDJiJxXc72MHMqV
	g+1Fo5dEB2i9O5zA4z10UwNLOiORuM9aVDzsa2Bygxj2gvxGRcSLBdqvXGuBxLAnM80kxdqXPaQ
	WwQhJhLVPB40ENjG+DC5vbcJd5dM+BlmzcWE3EXJIAKWQ5rzm2c1xg4D1Y7gqGJikvJTQs1Dc63
	rcSyHxAnLi/oxaRGfyDx6kf8hNnFRkJiQp93AX2zRPcfZrg+09ZsmBlcy9jSQcD5W9IxfmCKy1O
	Gt6MZTYVDHDOK0Q1tMJqZj5kK3FSGZArEq4KdxRh2rUYGTjm1gqeFoAs5+vtOX4ZN5d0plI2rFg
	bg9A==
X-Received: by 2002:a17:90b:57cb:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b3d0762904mr1358119a91.30.1794974206847;
        Tue, 17 Nov 2026 19:56:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm598227a91.0.2026.11.17.19.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:56:45 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/4] platform/x86: dell: dcdbas: Actually wait for the host control SMI
Date: Tue, 17 Nov 2026 19:56:35 -0800
Message-ID: <20261118035638.11773-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118035638.11773-1-rosenp@gmail.com>
References: <20261118035638.11773-1-rosenp@gmail.com>
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

For SMI types 2 and 3, host_control_smi() writes the command status as
-1, raises the SMI and then waits for the BIOS to change the status:

	while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {

apm_cmd->status is a plain memory read, and neither outb() nor inb()
tells the compiler that memory may have changed, so the compiler
assumes status is still -1. The loop then has no side effects and its
return value is not used, so it is removed entirely: in the generated
code, the read of the control port is followed directly by the return.
The kernel goes on to power off right after raising the host control
SMI, without waiting for the BIOS to accept it.

The type 1 wait polls the APM status port instead, in a loop that
counts down TIMEOUT_USEC_SHORT_SEMA_BLOCKING iterations and relies on
each inb() taking about a microsecond.

Convert both waits to readx_poll_timeout_atomic(), using READ_ONCE() for
the status in memory and inb() for the status port, 1us apart for up to
TIMEOUT_USEC_SHORT_SEMA_BLOCKING microseconds as the name suggests, and
return its error. That is -ETIMEDOUT rather than -ETIME, but both
callers ignore the return value. With the delay plus the port read, the
type 1 worst-case wait grows from about 10ms to about 20ms, which only
matters when the BIOS never answers.

This removes the last users of num_ticks and EXPIRED_TIMER.

Fixes: 90563ec4129f ("[PATCH] dcdbas: add Dell Systems Management Base Driver with sysfs support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 26 ++++++++++++--------------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 678f44252a45..f5d214b7bb6c 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -20,7 +20,7 @@
 #include <linux/cpu.h>
 #include <linux/gfp.h>
 #include <linux/init.h>
-#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mc146818rtc.h>
 #include <linux/module.h>
@@ -377,9 +377,9 @@ static int host_control_smi(void)
 	struct apm_cmd *apm_cmd;
 	u8 *data;
 	unsigned long flags;
-	u32 num_ticks;
 	s8 cmd_status;
 	u8 index;
+	int ret;
 
 	apm_cmd = (struct apm_cmd *)smi_buf.virt;
 	apm_cmd->status = ESM_STATUS_CMD_UNSUCCESSFUL;
@@ -407,12 +407,11 @@ static int host_control_smi(void)
 		spin_unlock_irqrestore(&rtc_lock, flags);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while ((s8)inb(PCAT_APM_STATUS_PORT) == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		ret = readx_poll_timeout_atomic(inb, PCAT_APM_STATUS_PORT, cmd_status,
+						cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+						1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING);
+		if (ret)
+			return ret;
 		break;
 
 	case HC_SMITYPE_TYPE2:
@@ -441,12 +440,11 @@ static int host_control_smi(void)
 		cmd_status = inb(PE1400_APM_CONTROL_PORT);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		ret = readx_poll_timeout_atomic(READ_ONCE, apm_cmd->status, cmd_status,
+						cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+						1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING);
+		if (ret)
+			return ret;
 		break;
 
 	default:
diff --git a/drivers/platform/x86/dell/dcdbas.h b/drivers/platform/x86/dell/dcdbas.h
index a05d7f667586..d5ad2363dd9e 100644
--- a/drivers/platform/x86/dell/dcdbas.h
+++ b/drivers/platform/x86/dell/dcdbas.h
@@ -42,7 +42,6 @@
 #define MAX_SYSMGMT_LONGCMD_SGENTRY_NUM		(16)
 
 #define TIMEOUT_USEC_SHORT_SEMA_BLOCKING	(10000)
-#define EXPIRED_TIMER				(0)
 
 #define SMI_CMD_MAGIC				(0x534D4931)
 #define SMM_EPS_SIG				"$SCB"
-- 
2.56.1

