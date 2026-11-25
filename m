Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648892;
	b=Mfo8BurQy7gCliMQ14fjb4K8J5MIYpXTcKwUFf5xhK3tqFWGXbtu/PDnLC6PFNFawuAn
	 PKfes+ouHPKtp0Ss00QSFJXVysIJoTw9AnsJpw3KL/yXCGZT5Aq5CN0FrkRhzjH7WITLX
	 RgWNgPgezFQSkMfe+NG+fpZtnGUWT4952+wryqt9sgyVyvn86mNjEP1bFUvaturNlXA/i
	 kDB2bfb5tODmxV22Z68UeS4zPsB/Qbbr2pu2at6sTw0Cx15uLr/mL+JnY6OzNWreeDRlG
	 sAFzkXiIf1UuTijCsa1gizLUGXYGmNzTaJKjQDKEJQJUN+CEzckwFvJJMEV8aVjh7hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7zsnKipnJh9s48hmQ2kvGabQuUQpb5jeBqmSJWtFtAo=;
	b=lCo6PJUdD7MA/pIzl7e28imW4nFLNrkYwgQEaN6pE+e1q2/upXHdC+qjSDdDoVRiuv+f
	 Hfucv4X7HkzzQg6AvvyOisiNedTc3Mdm0HVbU0VX3povbfphrOJA4MSgzQy4IiMe9VHdR
	 b+SX3zv5P37Z4zAwg3emDWiVvm3VN6PhhZDo5vdIIXqbWXNkl51z+flrG8ipJiq+8clfQ
	 J3khDG1EhAbtVkDjckwRC5vS/Rg37bQs6PE0nYDT/ylj0LCpWd30Tqiqo4RKJ1BN35BwV
	 f7pOf5QZuOQujdidhv+5f1a8He3f1cHNBaUZQBI/qsyQFtFAzGXJBCG6Qxb3E9oXPFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veDg2IQd;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DE2606A327
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DE2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veDg2IQd
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so2556295b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648892; x=1796253692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zsnKipnJh9s48hmQ2kvGabQuUQpb5jeBqmSJWtFtAo=;
        b=veDg2IQd9XsRibDxnD9/AoHGjFrb9VHIu3Wco9LrhVP4LI0sn/Qml87K7LcXo8U/bG
         nDaOaOV3DtoJhSSM3V4MMHS/bAKVIor0D5OOWtzfwrVD9SlMLhpZVCgU07G6lBV7+ee9
         +v+N43I2yWwfovrcCpoxRwSVm4Wu5lfZYcs7H9dQjXtxYJ78xAdRBgDqZgxneOrSNWtg
         cciwe9UgzvPyUfBZ0rCSA4w6H9mmH7jl5Vd831RH17E1K+NppKIdO8T4Z4MsKX207RRP
         akCJzjRJTfOJM0s1Oe1A870kfeEh4+23RMAOa5jPsRyAwV5qcJxBsXuhf5FPOvE4O01a
         4iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648892; x=1796253692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7zsnKipnJh9s48hmQ2kvGabQuUQpb5jeBqmSJWtFtAo=;
        b=PiVPOdiHhAyOUI6WazFWdPcJdukp7p1pjhzCghLmxvx06IGtt+rFHhOu42V3zhtjJg
         fmevQu/CXdkNwr39pOCA9kFT6jQDOSWetne0nILXljy4Jp/79+O3G4YUoIJBiPMVOZrd
         urDQqum5ZOJQxwvoCBw9vwyjVCLek8HvG+ClpLmtCgu/EWOC8lTtgqoMVmnxSSKDy/fn
         8jhEtIPSr/668UpJDIwnHA9p6hJv1LvlZ82QmC9xGAXA+dyeOYX6zQhKZfBu+mPTZe4f
         zKdffjhZXXH4QsQRG/pPy3P4DEZH6yCsIbLQHb2HxOoP/wX0VJ/fUYcD3EKNuGuC5ViV
         n/VQ==
X-Gm-Message-State: APuU4Z8KJaMDF2wsl1Jus7q2O3ZgAWqhduUjwK56ByGWWJpF6GNwRghC
	dAY+VnB5VzhLZhD5UHaXjDnIxoeEz7dNnJqzpkiyUMoK0dmwQscNp36c
X-Gm-Gg: AZFdTZcE7NCRcUhAQ8ghWhkQo1vBC4Lh9oAFYRvKAuGXsFHdPfCaFqQBJktun45B6iy
	seXUjJju4cTSMK+pIul0Bw5F0ukvols9kYz5LRCqOaXJ97wNjO4L5zUB0J1vYxnYnuY/NbF2K8Q
	V8i/mfpwLAp5a+eEDFv4l+hBfliStGsnX6f4/BvnIQovl1T6nbKo/aKAfevgIHVfGc26Sq27bHf
	a/K3nS/1clhXPAFOyq5/1FQflxiSV7dGYoivMovcYQSjmaiyT1XqLJChGDO4OuZX3jtsEf2sQ7b
	/D7f5woser561GzspCUVLkaAGSak4JotoMxNK0POjeLITENRlVQQkqm6O7KSNvqj+QkQM+Jei2v
	tg7G/ztVz3WbFnQFA0TvEYmLmKNvSDbEH7FbDKTU8DUJlDGOg3DSl8fjt2AyCIfIZh+I+tZXgK9
	jUR79v1dTbObDr3Wls9M31pTJxS+ZSxetzURXG+E6RmHX0PUdcq4CPyzyD7WexNV7ZcP0YQuyp5
	vEPk33Dv+ysXfCS3xpwnI9X97TCJL7lL4bhk47xj9LyY+mA86CFW4aPUmkakrh2u8Cj1xuiaWZH
	MjTie2qLOsA13f159vZHBAqYu7T1Lr37bWNlE651CCcPHEr08Or9xIGcpjbCypjzGHCvRv4ZtC+
	t/bc11jDat1Z/lHymwwdY3wPwXV8tUqf7eRdLGJUWwlDmmUXIrJd8k4zkiScjaunLcOvyveO8S9
	T87A==
X-Received: by 2002:a05:6a00:21c8:b0:89d:f19f:5dd1 with SMTP id d2e1a72fcca58-8c87c862aadmr17370053b3a.33.1795648891642;
        Wed, 25 Nov 2026 15:21:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm9864471b3a.46.2026.11.25.15.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:21:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
Date: Wed, 25 Nov 2026 15:21:07 -0800
Message-ID: <ee9e976209ac07dd390676c4cf9d0643719ff2af.1795648586.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795648586.git.rosenp@gmail.com>
References: <cover.1795648586.git.rosenp@gmail.com>
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

Do the conversion and the following unit selection on a u64 seconds
value instead. With value <= INT_MAX this cannot overflow, so such
inputs are now rejected with -EINVAL like any other timeout that is too
large for the hardware, and nothing that was valid before is rejected.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v3: unchanged
v2: use a u64 seconds value instead of check_mul_overflow() on the int

 drivers/platform/x86/dell/dell-laptop.c | 34 +++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index cad2bd06f28a..c1a51bf95c25 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -25,6 +25,7 @@
 #include <linux/sysfs.h>
 #include <linux/acpi.h>
 #include <linux/mm.h>
+#include <linux/math64.h>
 #include <linux/i8042.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
@@ -1553,6 +1554,7 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 	struct kbd_state new_state;
 	struct kbd_state state;
 	bool convert;
+	u64 seconds;
 	int value;
 	int ret;
 	char ch;
@@ -1599,38 +1601,42 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 		convert = true;
 
 	if (convert) {
-		/* Convert value from current units to seconds */
+		/*
+		 * Convert value from current units to seconds. This is done in
+		 * 64 bits so that it cannot overflow: value <= INT_MAX.
+		 */
+		seconds = value;
 		switch (unit) {
 		case KBD_TIMEOUT_DAYS:
-			value *= 24;
+			seconds *= 24;
 			fallthrough;
 		case KBD_TIMEOUT_HOURS:
-			value *= 60;
+			seconds *= 60;
 			fallthrough;
 		case KBD_TIMEOUT_MINUTES:
-			value *= 60;
-			unit = KBD_TIMEOUT_SECONDS;
+			seconds *= 60;
 		}
 
 		if (quirks && quirks->needs_kbd_timeouts) {
 			for (i = 0; quirks->kbd_timeouts[i] != -1; i++) {
-				if (value <= quirks->kbd_timeouts[i]) {
-					value = quirks->kbd_timeouts[i];
+				if (seconds <= quirks->kbd_timeouts[i]) {
+					seconds = quirks->kbd_timeouts[i];
 					break;
 				}
 			}
 		}
 
-		if (value <= kbd_info.seconds && kbd_info.seconds) {
+		if (seconds <= kbd_info.seconds && kbd_info.seconds) {
+			value = seconds;
 			unit = KBD_TIMEOUT_SECONDS;
-		} else if (value / 60 <= kbd_info.minutes && kbd_info.minutes) {
-			value /= 60;
+		} else if (div_u64(seconds, 60) <= kbd_info.minutes && kbd_info.minutes) {
+			value = div_u64(seconds, 60);
 			unit = KBD_TIMEOUT_MINUTES;
-		} else if (value / (60 * 60) <= kbd_info.hours && kbd_info.hours) {
-			value /= (60 * 60);
+		} else if (div_u64(seconds, 60 * 60) <= kbd_info.hours && kbd_info.hours) {
+			value = div_u64(seconds, 60 * 60);
 			unit = KBD_TIMEOUT_HOURS;
-		} else if (value / (60 * 60 * 24) <= kbd_info.days && kbd_info.days) {
-			value /= (60 * 60 * 24);
+		} else if (div_u64(seconds, 60 * 60 * 24) <= kbd_info.days && kbd_info.days) {
+			value = div_u64(seconds, 60 * 60 * 24);
 			unit = KBD_TIMEOUT_DAYS;
 		} else {
 			return -EINVAL;
-- 
2.56.1

