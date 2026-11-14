Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637777;
	b=O00qMyTHSU8y6q8ZSMA5eWK2zA0FrPudCIgQR8ByNHiVTbqlsJMcq/rSxAdt4QloWmeT
	 lzq7RdCNUnNxK8VGnUBxIeOgrocnH9FOg0xZ2P3Y6EJWLznYCGVuWLZNwAUAY0Ae1mISa
	 71KOOwNrEvUoEBBy5ZBo4ZvV6CrvdfD/RxChAcR6z1QLLrclF1OdbqBZoGYIA9HPcTL/w
	 B52L4sRT8EUv7DX2p2pt8ydWse1oXpbXrPhY8ZLYivV/igUOn/6t8obnUXgvXMOuMbJex
	 UVUsSpxun+m3IW9Y9M0lyYGmdSIdpEGNgzYEPeBEc4xdA/XVFuuLNgN0uC+YwTG8o0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TAAl5CNNTXUKmSgFHLqbBt/nHXYu22WHSPe7j/27ncs=;
	b=UCD0m4oaTBTeQXi7odEG1ErFmAEG8YASSm4BvPnQSSocGcYO92v0Q/XyXLbGCjX0B2a1
	 7qQAOPp/Ru3QjgXF2vGk31uyWEqHvC3+scd6KM1I5s1EH54shULFq+IkMTXHWSw0OwpRg
	 imNIUsU75YlRyOWxNRyutn/efK6en6XMl2+fbOGuWzh6Stijim2lO2upHjZCT6fTko4w6
	 nyV+i66Ekr7AZi9JgG275EiqbFQOPmxlmCSA7H/bG64P46a/nw+Uc2jpDBkeu/bqkZ2Jl
	 3QnIz85z9vd4IjV1ZEvKBK7JIo+L+ZVw5HLBPUGEKvleJe2A4W6GqHG/lmmxRwfYQGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uq/3bbw/";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45FB606A337
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45FB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uq/3bbw/
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e987a2ba0cso9271245ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637776; x=1795242576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAAl5CNNTXUKmSgFHLqbBt/nHXYu22WHSPe7j/27ncs=;
        b=Uq/3bbw/qzoz6hbxTMnleDcxSW0G5sSSD8mUXr50KS93ihDh0ecdKjjenQeSYt79x6
         v+jfmE2mVqN5xgUX+B70L5+rdzRv91WnRnJ4lODc/fxWi7vBsFaFbDPuMQF4+5c1IzJo
         /IX6nXCaARq2Sgf0Z9n4Eks2XDwpLocqYQaC1hm5e6AcqeRXzBtt3GPJ6VVaYl72SjdM
         92VBag9LvPdU4xF9yza6EOAAc6upi/UTFAHqatHjfeVCrZZqSMfw8xwpGj9rtNL6CpsL
         5xRfIvT5c0jfhfDovVdD9+4XDU2o1Eyr7qmx69T4i7ZMuas5Qy6t9arlGSNBFBJBmkWh
         +dDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637776; x=1795242576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAAl5CNNTXUKmSgFHLqbBt/nHXYu22WHSPe7j/27ncs=;
        b=Qh/twP+RvAH9pyB2/0hfadsYuIaD6phIxBhkBFXXuxN2fn5IMptXRkUgfXAIc2z9/r
         NJW4ORdQ8z/PVtymtVBUwyeueaJztzMHxiJqnJ44WoKJWUKZGEnCpjqwhTf7gjwyYnSG
         5FKymQbKMsRRit+4vePlZ2gegtvoNRY4si56/4mVhuGtrnGuwSJNA8AE5E5vfrMq8Amv
         mmRtRr+1p6rH65y8uyaJzZI/2/LtfYdDks2XlQ4c7z/sHwfz4/JGNnYYrhPDTRCwERzm
         CTc7rG6blOL6vIdca0bZXZA0xpgUnkNK7tx7rTS4iTqCE6PHrg8KPu6Dq5gBdX1HH3P6
         WrUg==
X-Gm-Message-State: APuU4Z+6hkvA+pmH4vGDTZ0lNLz+qCXbrqXdmvrNUphIS5AtEP4VGwiV
	mfXYfbTw0QwFSQ9uOLOKImoTvuqwEaZtCRHusBy5I1aLg4riE/Fx3sZC
X-Gm-Gg: AYBFou2019KH/bJUik7/+kPaEZpDDyVWK42GoF+Pety+PR7ow20ursJGIPutRRqgrlH
	MbmjJTWM1I3kX869aP9O2ZWTsjOtZNsRxix6zDOI5e+EcWiV2YooPIsvgoDigjibMDtMSDXFm9T
	ERBibP7x/d75a3UIUN1Q1UlYV2PCQqe7s73AwfsNQxi1PUdvyEcJ4dkToumNrYdIfCOP4S8qxUm
	UtDAvQcvRSvvH1MVuklEcPsOBJV3IldIhnb/uEU/hYtX57uvmF/JV7BlOkbgfxKVk2nAhpjpywJ
	+6aYLVCGK+DUcVbsN4ZH1NdQ0NpLCQ+py8jASyfqf9b99fXhHIersKFDirVzcbB7dZxGyCVSdpF
	s6F4YQC4EbdPV41lU/Nni8gneD9bpur5X8o/EujHEyL5RqV+E/nVSUVZoQg6+dYeZDHKlWgfx1D
	aCrlr8wboanEodbBaExh8UVq1MUTQ1vzdr1s2mjBLVf+WLFZ1/9Z7NE2jnxHuV3E7WxtFBGDs0o
	jCZdj1F4d61yOz8r1PD4S5fcZPwxsiR9mOsV/x0KNzbRwwZPK0r6ka4xhkDY+RLWvpk4aBsNRky
	TV0lHCTR9pFFSFQK6Uoa+NJvdpkf5ScggiGf4yiiLy3Fo3qjFUQpHtnYSratlIA92menuqeUWzn
	4xblonlxQlQjwf63aqItt2PKHOBabU5IKOkXaylE0XbwisdJWdavBRsUkWff1jsrYdmG204im8L
	yI8w==
X-Received: by 2002:a17:903:228e:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2ee0da7bf97mr45567495ad.14.1794637776350;
        Fri, 13 Nov 2026 22:29:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm18382465ad.0.2026.11.13.22.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:29:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: dell-laptop: Reject keyboard backlight timeouts that overflow
Date: Fri, 13 Nov 2026 22:29:25 -0800
Message-ID: <1e1cc5a497ca95a0b34e45738f81a4be681675fd.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
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

kbd_led_timeout_store() converts a timeout that is too large for its
unit to seconds with plain int multiplication. A large enough value
wraps, and if the wrapped number happens to be a valid timeout it is
accepted. On a Precision M4800, writing "4424214d" (over 12000 years)
to stop_timeout sets the timeout to 4 minutes, and "18989323d" sets it
to 2 minutes.

Convert with check_mul_overflow() and return -EINVAL on overflow.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 89e85c7f7132..bee347e1d60c 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -25,6 +25,7 @@
 #include <linux/sysfs.h>
 #include <linux/acpi.h>
 #include <linux/mm.h>
+#include <linux/overflow.h>
 #include <linux/i8042.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
@@ -1554,6 +1555,7 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 	struct kbd_state state;
 	bool convert;
 	int value;
+	int mult;
 	int ret;
 	char ch;
 	u8 unit;
@@ -1602,16 +1604,23 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 		/* Convert value from current units to seconds */
 		switch (unit) {
 		case KBD_TIMEOUT_DAYS:
-			value *= 24;
-			fallthrough;
+			mult = 24 * 60 * 60;
+			break;
 		case KBD_TIMEOUT_HOURS:
-			value *= 60;
-			fallthrough;
+			mult = 60 * 60;
+			break;
 		case KBD_TIMEOUT_MINUTES:
-			value *= 60;
-			unit = KBD_TIMEOUT_SECONDS;
+			mult = 60;
+			break;
+		default:
+			mult = 1;
+			break;
 		}
 
+		if (check_mul_overflow(value, mult, &value))
+			return -EINVAL;
+		unit = KBD_TIMEOUT_SECONDS;
+
 		if (quirks && quirks->needs_kbd_timeouts) {
 			for (i = 0; quirks->kbd_timeouts[i] != -1; i++) {
 				if (value <= quirks->kbd_timeouts[i]) {
-- 
2.56.0

