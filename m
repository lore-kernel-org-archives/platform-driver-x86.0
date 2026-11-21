Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219792;
	b=gxoVxbq9J3OOeRkWaUGQsOvU9p9MDw4wxqChZLddNUC1D3dhXtuX74Em4vXb3Dnb3Q1Q
	 b3JVB3LHPkiFZNDOudNauJ/dv2q8cuE6smXksl9Tx/VoF7k8oYPhTDx4jzXlWQQsydsAP
	 Sxj9UU/foiqm5Z2yrhG44YYHdFaHslLmTziK5Lv9UBoUvgiTvilHTkJKs57YYxpaChuQL
	 VStqbeKLqi8nqWQL8Ri/CAkZtoeDmiNbwSGlMxCm24CXk8s9G25AWs8nCQ5osEHSGxGt3
	 nQI0+RHmNR6eNO9UGrdTrVgb4jTYkCK4n3H9F8Lzna1abyv5z4D3EFCO4tXh6+MbYXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1CzFBBszFhkiIIYt9wFudFnmrxdhz1D8UxoY045S5U4=;
	b=Cqrlzh2+fPLeOY1kxkeyF7EV2f9hjX31pn4GH7o2R22RhS+OqMWc4hN2YwpqfIBUyrcY
	 cv6vM31hn/nxgUZbxrDZq1+1bhXRxIvIP8cLp0nCe4LmCRdRsXVHN7zJ1TVXqRAjEcP5A
	 DTyckMoE9N1YWz/FByhoDgFlDel6nfXR6n40iO9WQcYqE2MPVM6xq+ljExEnasoiadKx6
	 aQyF+dMYXS1RHd3xWpStmV9IPk6nYdTEplNO3rbBI5Iiq1H0urPWbTKIW0HjanyV9dhRY
	 t9GhL7iFpqqOljeXbVMc8z7bYe4gAvKqfMjBCE7D04Ah5RjwlbmT/4vGttAnlrasJXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1CJsbYh;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D09960A261B
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 00:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D09960A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1CJsbYh
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so920750a91.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 16:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219782; x=1795824582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CzFBBszFhkiIIYt9wFudFnmrxdhz1D8UxoY045S5U4=;
        b=p1CJsbYhNdt1bUXy8sOs/aU1AzB93Z8SwfZnyJ80pjKaY/Ut4gkjV1UrUeeT5GGiEp
         87vbB0ar0Rvu/6eNeanyRdnyO4TLs51vfExQbO2oWcfHlhb/0ZW+PcI+X6iwZjA0M59j
         EmaO8EtlkvLNMLuJ86iPV6bUIcKqWxiCfu3HFOGqgyfgaEZi7m+b8XD18Ybp3cbncnvk
         Biz7lKVfUGhWAdnCEfQ6EnzkZUxKw5hVE4boN6mA23YBs1CLap1SZ8MZbbyNMv6Fytpn
         ybdx1KkBxLSPsydnwE3MyoZQwpDfpUKbfC+iwQa+zaQWBW/9V126jyXsRCDop7NfXeJa
         FRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219782; x=1795824582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CzFBBszFhkiIIYt9wFudFnmrxdhz1D8UxoY045S5U4=;
        b=puyfZvJM81dg4/5eVMeh3/XBL8p4JV8hYjLENjjzprKQFQr0YjIjet6aZQ96CrUxuH
         r8sTvf+DM5KQtWz0W0Mzcc1QeOcqJ/NN5PnxfvMK3qLuKAYwGT4jLj1+RKqj9/c6Ox7t
         mv7EmKPd4fLACXcWfHTTfkmb8rJAYTx+R3Xi0kQdl0kmWTtXZgm6Ari0llMxtcV07eBd
         PTZSCCz2jasLemEdTenQmibD4FYyZYtf8a4hwVR+EarZBfBh9dRH7u8myE+AHd0YaMKk
         60a8HHItJa12IZuybJtP2Wk23YRDS1JEdpdUv+GxTDS4qFZYJ63KgtTIKV2SOujcZ3+Q
         1DyA==
X-Gm-Message-State: APuU4Z9urdSmsokeRSYVwjp9ThB1lfEWT1wyDNUybH80Lu7C3IpusBYE
	jzM2oM4ZJHwFXw0BYbivPK9i6oa+Z9+Dn4FyBcYsNexiC3Kk2WWmTjud
X-Gm-Gg: AZFdTZd4PxSAWGqqcXk0EEVLkWQe7GhCynA2CfPobA+rsJ25eJoUuoKDAM9sP+t9+zz
	RQo+ZcAp2HMXZMzk0q2G1wxno7Qh9KYPxdl2dplZIKUhd1d+RAiLv8SVm4QSmwU1ZYdGp2hqKh2
	K2vKZCQ/AbsNoVTUqGvZMhiHFz4+qQtw9cmEYOvWHyCCIyYTg+eglmyrnlVdN8/vcpJr3i5wNy2
	Rvt4iexZ0kly/jRQpXz01+Wygt5TJFNhDz3qmE8ALKXfZM7xvbe8Uf+hAIdLw+NaP2d6XzDRVPM
	Ka7+g1DkIMMkDp/ujXz0Og2/6e5797v7Zb9YI8HtgTUwB5ABrGIeG8muYqWBqucGg0Kq2OPivk6
	EYnwB0zZ2ItkI4xx9wDMNGXG2UklTVaFsg+Dn48y0rw/HcXApzIQ6sQoe+GE7yXBj2q0PQgv+5g
	NzdzIeJX8lEbmg4GiKZNV4IQy+hBOvcW8ygo/dYff8E7SM1P+RPKGEv/bPbX3GOK/HE10SDnqmH
	U0dQkuO59GjtrmwEGDPQCaBZv/sW63qFCF8rAT4RVjCSQUwpqK7HRpFfn+ocjsbZ+59lslaa9s+
	JKQo0zJe8Wej4asUfn0KbdXcOl8n7/DHaI3kYWgge9XU2lvBlRDQsMBeD9PhvvlfG5V5CZMEQ7Z
	kE/6opbinOGcA7WcJu//AhtVDb9lCN9lzRVHzaN6gD5sw4zV0U42RAUwrq5QEE6gmyFzuydnrlC
	rOhQ8=
X-Received: by 2002:a17:90b:2e8c:b0:3ab:884b:65a9 with SMTP id 98e67ed59e1d1-3b41c9e430fmr4919985a91.25.1795219781727;
        Fri, 20 Nov 2026 16:09:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm1920509a12.5.2026.11.20.16.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:09:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
Date: Fri, 20 Nov 2026 16:09:29 -0800
Message-ID: <ee9e976209ac07dd390676c4cf9d0643719ff2af.1795219225.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795219225.git.rosenp@gmail.com>
References: <cover.1795219225.git.rosenp@gmail.com>
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

