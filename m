Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637109;
	b=eO2mH45j1+rStWpBKbMk/UnPhTe+imowMpMUyqQgt9uzjUZhOSYYpfdFsbFYIf1TMh0b
	 +wWi3twwXEKZ/S8y/tLugZW4P9QPwN99ICzIxeNlK60mE7HJNI10eWZB3VfZ/uqrssmfD
	 nqOLh4IDGf40pE4IWVaiyeoAwmHUC+knmFZC/TD68aQyNa1NlRc/X7GKO4TVa3qG1gRm/
	 +TbA4e1XHWGYV8bVp+kVJJ0obUklOcUBQlws2UFCORvi0e64VaRSjpM3XGmoIHVKZ58eQ
	 BA9gCaKCGJPnI3zRBfw8DfefemcQGgO/nKSnujEcszumzl0ZZN8sQc4kJpB4+Mqe0cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=grc2+M/hmuGZdiW2psJxXnm4//i3gJPfipJw6YvpPE0=;
	b=GkiGPtdsoba4aFhqtBFahyNvRfrsEW8aoqPunSfanHq4hCRNIXKtAYETaRkx3lRj+5Ou
	 CEBiNELYn2zVHOXHWSg+9P3hH4xQ3oQ+OMb4kvoBcu3vLaT5ig5N4EuTJAbwXJUXDDkjA
	 wDJiJFt1PuRAuPj3OC23DSt/t18CD4p+Th4UeFspIi8Z0fn7xQgNw1oCiIvmI5jvfwvpj
	 2kn0e0IiBhDc6QBXAA5dBDJgl0JIlpqj3nBKANKVvn9DZr/Z4YeeYlHz677Ht3lqVP7xS
	 MrQRxBN9RZ+/byeO6yK4h+FhZaEBzj5Spigv+6dCqoJKug/3aoUxAtmn6E646xIVtDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhWluKqR;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488260A2615
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9488260A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhWluKqR
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2116062c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637109; x=1795241909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grc2+M/hmuGZdiW2psJxXnm4//i3gJPfipJw6YvpPE0=;
        b=YhWluKqRJPBNKjLSnwMxbWoOzal/gMqZKRwXfTGY1HxJBJWSOZWJU3IrIPRtgkOZbK
         d/D0JsJZ3LaPP5Ff5TzSCMb6UBZQ87Cd+eVcQIzJKymJ9WgT//EEEaFVknNWEBbaYEIl
         7DgUvoFXfHWNwajj/j4tf3hnZBSFlAOexaLUhwVvy6EC1CrPT/IETZKY6F9NaznafgaQ
         Cvb+mmtJP3cB0Xtfx8VkKuGPRDjhyI2uKkvg1/PJly9hzyGNDNT7yvIVcSjxK78Qit5v
         Npn5KAczLorFi15UnddrmuCQc5oBsXxRL6gJdouv/ob5hO7azf2sra728M8Qa7HXNSAz
         3jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637109; x=1795241909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grc2+M/hmuGZdiW2psJxXnm4//i3gJPfipJw6YvpPE0=;
        b=A1VVEwuzNBWyjqR1DgrrQrQ9za+QPWekywodn0qECHrPDfliTC7/rvSIOWOKPnNUbm
         nGqawPQ2RUB5Xpf3PSSwQaV6G0+nhk3/QAqvNEIenXCiVvnnFUNlyvtGDboEcRE9aWB5
         pwNzIbFPxpSz10DnR7e31H92r0M0tPn5JxNGcHnY7GX/Ofe5TAPyZTMoWzhaH2QZYoDI
         uOuWFBNE0thXdp/5D1aqzwueK0D+8S+k2qEUelRzAlhRitOdOdNupCn/v85nz5sxpdwC
         xe8RIf0WMtkkd3W0Jtx5P1TQ7B8vcTsAl2D5QVZ3nt3tVrqOebPSvYXBuJW4afY36gSt
         ysuA==
X-Gm-Message-State: APuU4Z+6bLn95PT0rxplYJH/AdBEpuM/bMkPGmnFJ9MW6wnUsKjRzIPl
	xge8CrSqFxMzvHui2nkQZA348Vb6mx8/coZtDoqDmSQxt9FdcmvoSt73
X-Gm-Gg: AYBFou0cXMLlPPhCrc3oflGQK+D0zAFgCdLC+xhw2UBPEGLOFUthKA8JwarjX00hmOW
	LOoF35tjJP4duN79qXTB9GUWHSAIg2yQd2l0MoSiPOwhY4X9Y1vu+P4SOZNt6Zwnuc5bKz7wEoG
	yO5T7WS3b7sCYzlIDG4MIQAY1YfkBYBEoIgl32c9EmrrSoEIknllR2H+b059aTu94NtNay698Y6
	RriOp7FpO1QAqijIOpGOh5Xq5gZRktbitJNnBSMZlVrtMuEO6f3M9JgtGdCPofL8SjiO2mVJDRU
	gRuavnx9qfiF1J+ogDMGge974b0vpOh6wG/ZcGBme3a2ti6XpT4dEGS7Cz11MgO9Nd8kQS32Y6H
	la5q7B+jCCmGLsZQWt1OR17INxVOhjspdeuVM2rfPrh1UrxLnunV/gyln8Vl1DdBKy6A1JA+vy8
	zLdoK8jgFZGe/M2g7TRkbHmQa8icldTAXNU7R0SzQNQ5MG0h+vWaeZACBJNV5ksxaUy/fHuayxZ
	EFgoiTWFuLhkNCqYSCtEe9jURnwn26Zgmv1DxHp5wpMOwkgPl/Wbp3ThRAEvOm7sLHdraW4T7rj
	aKAmUqrg+lxjX4KwYZcE+xqRlN/zL+RigkzcjwMEkN4jlBLJpWu1Nd8wXmJqjHlJLwxRNRcQtjf
	LXPFrNma23fUIEpzQ3LoAVsG+pMN4w5CCKtyF5rLd4+GbpPIDs6TVT8g11nRVRrI5k8Ags+8H6w
	PZ0w==
X-Received: by 2002:a05:701b:2810:b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1b502f99235mr4416928c88.0.1794637108636;
        Fri, 13 Nov 2026 22:18:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: dell: dcdbas: Use read_poll_timeout_atomic() for the type 1 SMI
Date: Fri, 13 Nov 2026 22:17:58 -0800
Message-ID: <6380dadbc5d515b4ce0d3322210ac44e4d541200.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633178.git.rosenp@gmail.com>
References: <cover.1794633178.git.rosenp@gmail.com>
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

For SMI type 1, host_control_smi() polls the APM status port in a loop
that counts down TIMEOUT_USEC_SHORT_SEMA_BLOCKING iterations and relies
on each inb() taking about a microsecond. Use
read_poll_timeout_atomic() with a 1us delay instead, like the type 2
and 3 path, so the timeout is in microseconds and does not depend on
how long a port read takes. With the delay plus the port read, the
worst-case wait grows from about 10ms to about 20ms, which only matters
when the BIOS never answers.

This removes the last users of num_ticks and EXPIRED_TIMER.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 12 +++++-------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index af4c1d2fe497..edc210852f2d 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -394,7 +394,6 @@ static int host_control_smi(void)
 	struct apm_cmd *apm_cmd;
 	u8 *data;
 	unsigned long flags;
-	u32 num_ticks;
 	s8 cmd_status;
 	u8 index;
 
@@ -424,12 +423,11 @@ static int host_control_smi(void)
 		spin_unlock_irqrestore(&rtc_lock, flags);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while ((s8)inb(PCAT_APM_STATUS_PORT) == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		if (read_poll_timeout_atomic(inb, cmd_status,
+					     cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+					     1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
+					     false, PCAT_APM_STATUS_PORT))
+			return -ETIME;
 		break;
 
 	case HC_SMITYPE_TYPE2:
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
2.56.0

