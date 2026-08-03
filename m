Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C32400DFF
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767469; cv=none; b=CKBc2B5NuNXmTqM+NH24omFGd6cbm1o07LGkXNsup+sjCVU4vv2q65DSultXGEwdiAl2FMioozceUZHdCRkmHQ6MbYnT4mPEo9XYvq4ES+kqVXoWYrLGeHg/p5sR3lvpI45WD71pVW0kdpC3EHFjYa7q3F0+xcpbQmaku3DKqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767469; c=relaxed/simple;
	bh=9EehTMGdJoM/pmPAG9mZtREZbrypCyCVR7Mvq/DwalQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVXKbVOvWMNdqP2gDIXN+4K78RDNydt1fXMu/mm+iTiWjiotoKac+2Sa2r4gunIcXKcXYdW5XCAvLmV4BprZ4ui8wS3qP6JAGVtpzyY5y15RiRgQqRYsiggBls7TyVuIvmM/sYDgjoN7DdbXmV3r2G0lf2nSXa7Z//yHTVhwomY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn4k6TWc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn4k6TWc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954aff6088so18846865e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767464; x=1786372264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+s/eo+/pWpLLFnoufPaOpVfgTjc+a46l3h08Co/MXY=;
        b=Kn4k6TWcQ7JqkozjWnJ65K7r0vJ3xuxicjgv4NL77v4z0s0+VpsKwj86jGriBrXlBC
         j6Xsu5PwruWz8XStm82TLY528+iK1V9P+1LBQ6/fHebJQHCyBEQY55JYsM4oBs3nqhl2
         HQBiOPaFuzXyaTbyajGSPuFh3j4y1G0z01kpQq+6cQK+ssZrmgY1btEWbyyJ7SfLdWck
         wINc3bVOYlBzU+xErlNu3b4UcRzafDPuFcc8mpZdJ/krXbMDdNa7GV/ss2TXn8uv0pSh
         vksaSPwDL3GJ8YVxmbeoXV5zF+UNw6iXSaW86c0yNguZTG7Q+K+CfFLzwpqakp2d0UG9
         v3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767464; x=1786372264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+s/eo+/pWpLLFnoufPaOpVfgTjc+a46l3h08Co/MXY=;
        b=NGeTN1bpjAaZ4Y1QBmuIF7EwIJrUhP5E2XzhKvJgSur9njm7uOfSo3ZbYgBYUZffix
         mkopje7/LbtIGJcQcvxTdDPQ+pwkzeXlRmFMXBVKzCzUY23bwKIbSGGOHqwuyXMyF5MC
         c4WU9lbLOo0RMpi9/afNfMDRomG2vTVgCLFdJlDag52D8qSl1oMEp8MdNblsxe54raHW
         GiUOMeLMk9e5JXBDq1bGBoqOcCI0EHGEEXssGhCYpf4Jtw+OmrRMCQ6gUS51bzgS5iRH
         ORumGg0E/KPNR4ON32cyE1cNerRT2ZCvcQeCPI6GhK6W7yFKcEMFIG10fURr09nSVhMo
         lV2A==
X-Gm-Message-State: AOJu0Yzs7J5sAQeHoMEOnggyNsNOtLUHLIeODK6QyvGx2+X1dhDqevst
	oZ1IwEmHBwdDSlq4fFp+D7pIh4tZi6Om7S9fqp2QR3zqhz4FqR3whTIyR1p9TcB9z3I=
X-Gm-Gg: AR+sD13MS9QE9B1oC9kA3JUfFVgMPLVOrehjOFy1bnDTaI7tghBhtyoucQGhff7nYg1
	OtBTv5gPUFK2bKb6vlgRQT4Dfws5UWvixA4m9OWMw4UAGbrtPW65FCYw6iHaC7p+UnhmvSBM++5
	TWXS8KNOAxWi0rxEZ6FGqYGHpx+YQBFeRhdYtC3nRFaJQLhUNFPtti4lE7chWoPbTkh8L2VokRH
	AHcDHn5SVFSiGht/sZC33fzc5LXbyvjnfBSC3C2gCm7rBCzihnVB088DmQYJkxV0/xwFWStNMYg
	gg/zx4amEox0E01j13Z6lXlXKkg89KhPP1Lg9SSq1scHqBcM7Zmfk5lu8JugH2S2Ou9rGg2kE4y
	CEVDr3afb5ftOmT1n/IFHg8UYHPVuXsuyaum8WjFmkz7PEhlU9UxdoMgwPovrAGwk/CPq/Yd4YM
	t4IjnuN8ZmyfToUyB3COi6Brq0H6zVuiB19owdVE9B6Q5OCeuzGu/Prbr/5wP5QntLOdRq2Hgv6
	o1/cA0Y9oEcNNcDHEzUY9hG+Xk4a9OpuHed4sbM81I=
X-Received: by 2002:a05:600c:5395:b0:493:faf3:3ea5 with SMTP id 5b1f17b1804b1-4980c66c751mr293605105e9.4.1785767463425;
        Mon, 03 Aug 2026 07:31:03 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:02 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 05/13] platform/x86: hp-bioscfg: fix off-by-one heap OOB write in audit_log_entries_show
Date: Mon,  3 Aug 2026 19:30:28 +0500
Message-ID: <20260803143037.93105-6-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803143037.93105-1-meatuni001@gmail.com>
References: <20260803143037.93105-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-iteration guard in audit_log_entries_show() is:

	if (ret < 0 || (LOG_ENTRY_SIZE * i) > PAGE_SIZE)
		break;
	...
	memcpy(buf, audit_log_buffer, LOG_ENTRY_SIZE);
	buf += LOG_ENTRY_SIZE;

At i == 256 (PAGE_SIZE / LOG_ENTRY_SIZE), LOG_ENTRY_SIZE * i equals
PAGE_SIZE exactly, which is not ">" PAGE_SIZE, so the loop does not
break and instead writes another LOG_ENTRY_SIZE (16) bytes starting at
offset 4096 of the page-sized sysfs output buffer, one entry past its
end.

This needs the BIOS to report more than 256 audit log entries, which
already exceeds this driver's own documented LOG_MAX_ENTRIES of 254,
so it requires a non-compliant or corrupted firmware value rather than
the roughly 85 million entries an unrelated integer-overflow read of
this code might suggest.

Fix by checking the bound against the offset the write is about to
reach, (i + 1), instead of the offset already written.

Fixes: 63e8f906e94e ("platform/x86: hp-bioscfg: surestart-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
index b57e42f29282..6b63fdb84606 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
@@ -90,7 +90,7 @@ static ssize_t audit_log_entries_show(struct kobject *kobj,
 					   HPWMI_SURESTART,
 					   audit_log_buffer, 1, 128);
 
-		if (ret < 0 || (LOG_ENTRY_SIZE * i) > PAGE_SIZE) {
+		if (ret < 0 || (LOG_ENTRY_SIZE * (i + 1)) > PAGE_SIZE) {
 			/*
 			 * Encountered a failure while reading
 			 * individual logs. Only a partial list of
-- 
2.55.0

