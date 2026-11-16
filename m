Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861663;
	b=DX+PhmOJ6k1+2DBru/Q/e3DYFxsMrEHUVG7VSA8B0y+7niPDQ0vPHiSJWK8nzo0aqe4U
	 pzUAo5JJMnzYlcl/9QcoBOk46KKxcAMNwNonKkA8wxQPWki9LWMwTGjvfC8UYgUgJbBGd
	 P+BgEfM5QM14CCYY75JIMjD/R4A8wjc5xMXOkQ199eIgaEVb3jSbqTX6P2T1PikaZ/yWb
	 PMZ+imxlyK+oIcszNwnWvNl3pcLJy5GzTTZ2XVLmkSpDZPFzFUIeBMohlknVITUheKQGL
	 /MOWM4aFks79U58WlCPBOjDBYVlbbjmeY7StqVs751USe+s1nuxy7sxAMtf21B0VebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qsAuHpeK88xiJOqOPnGB32buPpp/uRAvzb9s3d+OSJg=;
	b=Yf4vvq81YQNDNGku7EyWhjFEQRfFnVs0+/ftC5NOZweYmX/ZSJM3uEHgglnQWeqXh49E
	 7TsXMCqRKJ+tFVY6RvVogXOt3aQn1Epj7o3YViuY8PSpdbnBOsljWjzheTaFfgdQpQ9mT
	 D+tOg6afDmcAdeUDsG4y3m3eCRg60YN1yV1Xpc+LEwBnUjvX537xsdVXGVxZxmgs3QXzn
	 TmRqWFINXeH73Vm1xPkEYf462PMdb2t1UZBFPhRSGH6/Grb7q2zg0IlrK38CH5SUMVJDl
	 Kj3ouu03JqLcWNLfrCMCWjlLG+2GfueuPhzTmzDb2WZ4zSGN7uiOOIUKylIWIEdajIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFalh5K1;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D16606A335
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 20:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D16606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFalh5K1
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2efa9addec5so7352975ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861662; x=1795466462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsAuHpeK88xiJOqOPnGB32buPpp/uRAvzb9s3d+OSJg=;
        b=BFalh5K1fJnVTgGbTTwXxlSkb8rqVoe8PZ7HShQFHdQtO7g4CK75+sfkRVEe13qjxB
         vTE+lPqrTwbrqNasqet/y6PQMWjvxuV/RQSwsmSoGq2OdOOUnyyAb6Xar8FQmQGmvKSI
         Bch1CDtUTPs3reYQ+ceU+PoZ8ad3N+s5RdmtoDDjJ3OAY3JuqQ0OkloJ/U3zmwIZjHGP
         7WaWLsE90y0jOocENm7PLCcZU9nV0fZBnASZOG2NnbTMX2pp1xGGNDxopISyciU32uYl
         lURcSAHPrFFiXZVJUiGdPXZgqAkjpud6DogXUmF87l6mTVDfBX2FharuAJy4NqX9G53o
         QdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861662; x=1795466462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsAuHpeK88xiJOqOPnGB32buPpp/uRAvzb9s3d+OSJg=;
        b=BGn5N/qdCXCH6mSQ/eaGuuQowo6Eqivm8mBZA19q34f6HtYgStT+qGYrUznB6ev2tO
         rPC5ZfW9RUarOzv7TwWNBqDOmD3al0fGzr3XcmaNymy/MwMFZaiW6JnJsvbmVxLcO0Mn
         ZQoXMdeBBXttwjpZdnqKcDGqaRrd0jrGAIQ1J19Bv6e83I2Vhbb7TdOLRBp2bEo4DYhA
         RoerL9ddvIFbPCqWPNibUwi1H30z5kN8Bm76AC9EK8YOVESeu5jgqjoCN6vtRF7YUNXS
         iYZiDkG5U4Px1CNjzFHvrRn89WS9GAf5JugqAi3+RvAYip/WTyQUaKfCAiuBU5WlxeHh
         Nl4Q==
X-Gm-Message-State: APuU4Z8GcjPSYiJDT0R4YUZC1cTgRWVG8F3bmm7rYuYehzolWFzsB6k5
	apCkHs1T18XQ9DO+1kXnCjMUjnBnqhsC8BByJAW47BjBeUynhaSbt/PQgtO04g==
X-Gm-Gg: AZFdTZeF5/JilXbXSFlkbVfM9uENsiiLx6z2s3ZJ9GIAUI4UQCVjdkE4ny1e+90q3bl
	k6LgvPZZPvN8Bgszz7JEpQkCFTvrqa7pCbaHb1M2x6d8Q24GZ/FnkjPQm0Akxa5OL1Jt5qBhJbN
	qwVWGlhcRCam6OdmaOdbSY3T9mKkMC7rrC3x8gPVub5mzy331itDIQP42lBKy/EAlg26AcjEffe
	kEARiHny96Cv7kvyugFNXbRZiKDVya+PMhGSVxkNIWfRyvv6Q1KV8CDsKmlIPrXgCWD3IGyobXn
	mJB2lvuswd3tgFjwVc2001u1ttyTNSXzRLSy5G93/xiM4am2mBhIzRZZmi4lRgrBWoL71/0qg+a
	qJ03n+uFK9YGcEJ60DCqh7sduqXYs9FzBWR+Jm4rJguvRD9ngw28K04qrBjHk/cq4F8z5wEn91b
	LhBBDSd5/QC5zJ60QZJ7uM1Zh4luCsXuAb2g3rTiV14ieG/dGEl1q+a/cLvF21YrzbDUlr+F8rv
	qmpg1mWgxaa4HfhK119So5BLos9BtcUSKuFebEjOgjUScZ/j2zkSq1in9LUtkgkkycso5nIGy7N
	m3yS1IIW0s+i98KH8cYfL8xHG14+l3T0iPuOtzRtQC+0RLgWiS4Xl0hH1ztpchMUx8amCiAgYEq
	iBKZh+wiU3hFqjxxWGIv9tA0BtR4I9JP/jx08AAN0pEqptgP7/eGzp8WbLl0Eo9h64OTA5EMCCp
	8589xGbu4XWk64tQl91d8EQdA=
X-Received: by 2002:a17:902:c410:b0:2e9:3dd0:c7d with SMTP id d9443c01a7336-2ee0da7f48cmr101188275ad.20.1794861662240;
        Mon, 16 Nov 2026 12:41:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] platform/x86: dell: dcdbas: Actually wait for the host control SMI
Date: Mon, 16 Nov 2026 12:40:49 -0800
Message-ID: <62690b76d5cb95113b01092c8e3944fbb21a0922.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794861287.git.rosenp@gmail.com>
References: <cover.1794861287.git.rosenp@gmail.com>
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

Convert both waits to read_poll_timeout_atomic(), using READ_ONCE() for
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
 drivers/platform/x86/dell/dcdbas.c | 28 ++++++++++++++--------------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 678f44252a45..69365627fd8f 100644
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
@@ -407,12 +407,12 @@ static int host_control_smi(void)
 		spin_unlock_irqrestore(&rtc_lock, flags);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while ((s8)inb(PCAT_APM_STATUS_PORT) == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		ret = read_poll_timeout_atomic(inb, cmd_status,
+					       cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+					       1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
+					       false, PCAT_APM_STATUS_PORT);
+		if (ret)
+			return ret;
 		break;
 
 	case HC_SMITYPE_TYPE2:
@@ -441,12 +441,12 @@ static int host_control_smi(void)
 		cmd_status = inb(PE1400_APM_CONTROL_PORT);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		ret = read_poll_timeout_atomic(READ_ONCE, cmd_status,
+					       cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+					       1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
+					       false, apm_cmd->status);
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

