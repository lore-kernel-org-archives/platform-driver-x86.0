Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637103;
	b=haY5FE1u5KcrBwKisioB3YtCgMPImk6rNzhXxd3fai2A40Vc3fV9qV+bqaDUprsArHaa
	 +O/n/pgyS5KlkIaq6VgfTpMghqTe+INk3sv8diWM15Pz4i/91E+KnG8TkyKnvhecDuORp
	 ZKOHOoiVm3aXlZJuAOYi3UBocz+dHFM4lD0Yani8GcG9m6fgy3uD9hQKNMcaswEnYjmWC
	 J3JZH3vGiBBBXWCGWMHvvBAGtpi30k39SdOPXy7zKA2QGHcf0NS6k3X2c8p+zs+cjV951
	 yPJ9cfZ1BhTYy8+b+GS6pEwDa72hUSg7PkjMN4mDLcSHK64qr4WvcIOuhNbz690GswQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bizjzmDglxZ2DeJ1FgJ1hagjRnQiFik83BZEZhTNp+0=;
	b=Lj2F4u/rO777Z3T1z9Ozj/ZjwIvCe/gEsQ8EIjE3ZHTbJQNgBiXE12i6d35zul1v2Wfp
	 ovUzKzwkSYkNae/fv8l7C/6s++5APg9RObPu8+OPqEYodYRGDCDP6kOOxe0t7fxt9mDpJ
	 z/r+vNSAMVrHLhGcnfKJnGzW8KSPIIaK60Owt1pYtaLqH3DIjAn6IM+hdWXim4T5++vOW
	 7Li8aRrixskfivzhOmMMaXnT859WZHBxm7Q2v33t0UWZRwpvGJSg0cOHDIouG3+U4s2aI
	 SbzqqUX4rODLz+3JwMrqV2LJ0gxPBG1B5UEyFRmqE6zQhpQBrzlfCU2GxemX1b+ygQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1njg+0O;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B6606A335
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A60B6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1njg+0O
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3237013eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637102; x=1795241902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bizjzmDglxZ2DeJ1FgJ1hagjRnQiFik83BZEZhTNp+0=;
        b=N1njg+0OUaWLeOvQVIdoQEwpWq5ec7UKlmwd7dXQPk9OPim4HMrtQUbZKMX7pLzq5X
         T4Grk//kwu7IpOcIsuKTdqRoAyOEnl/zofEBLyxOAcppzSMiZhM3eGitCtPQb92qU9Wn
         ak7x5lIs79hDqwC4hNILazEH01L+k8+usC7UesJmr44W46PbTtuGHBhwya8hc6zTRhw7
         rErZFsi4ZdAjJkaaJ2GsCPI/7+Hu1fP3dsa6KnJaAv5RRGd2XwDVfwmS8L3HkMaMbXou
         1Zc2AKauNUBJ/MHuqrtEoPk5NW4Qnk1CNb479UckOjHOFM7dhF2omajiGtYRODuxbwCd
         PoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637102; x=1795241902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bizjzmDglxZ2DeJ1FgJ1hagjRnQiFik83BZEZhTNp+0=;
        b=Wv+GsGqLXI/m4tf/g19lzLWSVxKcVFCFo77ByN7eGZWlcu3hMAuLQuEcy8JWoK6hud
         XnCMd7HzPn+HGbkoQqTYVbyWQCYdqU73kAPIBUzEiBGc1pU8mBWhO1pw611+TqyGGkve
         f0VS5N3oI7B6Jn9wG0lJ1gQIM74R1o0U8BMgHGWvAMLyXzpdFM8tVMyDXpDuogAt+O0S
         Ct5k3BQrhUxgZAmhl3xvGx8lkVWcN61EJTNt9U7N17By/ekId30l6GQITJQQkZICYpHc
         Y+1lll+ihglA3NnFtwFTc8mVkqxiw1XCIrl/mgDKxVxn7KKB0ko9Hckh3VVo9t5IlJ1X
         cKFA==
X-Gm-Message-State: APuU4Z9vShNuLwY3WWVuu3z1P9j5cBLCQRfCoTc8ScyoVfGbaoWChjSB
	0xCqxLMz9pM7ar20HLF3INhLahDy/LPVLakAAsxsHEc8FvSEjoUOA8p+
X-Gm-Gg: AYBFou3dOZTSYBFRTC5BOK8Zx5cqhxDwx/AUMcXQ+3swJOmS6fAIKsoXq2nnJ702JyI
	lKuUtu7gqlJTZZ0BDZkSAt5ZrBTvM3UDvxgEBphlqIaj1CoW057bMbqyAs5KtqH1hm9aLYRsL0u
	yAJQTxT2b/hJ7fYXvB/PnTv8owYXOQCEh1NARjz/4ImMU6CqwrLakQeM26zFDRQ+nwUcyD/QqR6
	u0bEztrwaOCNatBbYCmYI6e69uTla87PLCfHoI8IbaXvNyxo3J8HAoXSCRzH3N8IzXMBxIsmjAv
	g2A83gbTKlhJQaHV/s4OAa3HYIlFYXkmmtyHhJx17PGH3qWXLnLt1ppP/MtF1Lug1E2yrYeLc94
	kZr2qvm8teIaZz2zaVI6zhgmwCkuRoQS/lx9QQgTzeCuSmUAm2kwx7QDqLi976WnxFMQT8w5Ly4
	iujCGl7RZss5Sv/+armJXfjsoNIAoNq+vWNlwX8Pmk66NziP8bywDlST4ZoE22uji3mkP59JVhh
	hN+0fqdalvenw/AGpoh3Uv2RIAkLI4irYx3voLE5OU7wVtcL0wQETgm1mJ1O9w0sgYPg0h4WCM8
	3/NjkpEqYXycuFX8EmtfgA/SSeL7X8eRqwdzwyU5qlZUdIbmB6VM28kOzB2cI3Cz48IviP/zm5M
	kplIM75oI8v4y3wCuoAU5q41FRSRm7JDqSdzPJ0DCDHqklsIlPpE3Mlmgg7aM75ujQOYgYUp/lC
	hfIA==
X-Received: by 2002:a05:7301:1285:b0:376:6aea:ab with SMTP id 5a478bee46e88-3796337238amr6009944eec.3.1794637101846;
        Fri, 13 Nov 2026 22:18:21 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:21 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] platform/x86: dell: dcdbas: Actually wait for the host control SMI
Date: Fri, 13 Nov 2026 22:17:54 -0800
Message-ID: <c35b26234163789f1fc37ba09a48de58d475629a.1794633178.git.rosenp@gmail.com>
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

Poll the status with read_poll_timeout_atomic() and READ_ONCE(), 1us
apart, for up to TIMEOUT_USEC_SHORT_SEMA_BLOCKING microseconds as the
name suggests. The type 1 loop polls an I/O port, which already takes
about a microsecond per read, and is left alone.

Fixes: 90563ec4129f ("[PATCH] dcdbas: add Dell Systems Management Base Driver with sysfs support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 678f44252a45..a5917093d539 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -21,6 +21,7 @@
 #include <linux/gfp.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mc146818rtc.h>
 #include <linux/module.h>
@@ -441,12 +442,11 @@ static int host_control_smi(void)
 		cmd_status = inb(PE1400_APM_CONTROL_PORT);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		if (read_poll_timeout_atomic(READ_ONCE, cmd_status,
+					     cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+					     1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
+					     false, apm_cmd->status))
+			return -ETIME;
 		break;
 
 	default:
-- 
2.56.0

