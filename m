Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748023;
	b=fvZkYbIe3BXeWZHgFmwVyj50x4PyulhDWdsz4dlSTi23EAKOpMp5YmTWfl6cFr12OfiG
	 JeHjYU4T0dEfMQ+5MuUs1h670UFvEWY+s7AmK4QFIQAj0Ik3h1Xn24eCrcQFHZMJ4PzJu
	 4+bRh5ktZh9C2QG+8qLg5g3rYiz4zJOB/RQEsc5oPIdjAX9UXLvzrYCpa9c9eRxhUH130
	 K/X3ij12TRtYVp8NGFVXXJZTo9OLyrS2DQfwzurRQB99RdmAbobS8q7RhAkGf0EcrgALd
	 B96C9O5q5GnUssOBGpWZ7kGsZBvce5APQyPSHGK6ux0JihF8SuA9vEjuFPcvuyszQZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qgARupCYolbeA/n2nVCfsvFjJ5NI9vPuXE/b3WtWydY=;
	b=PotIKLRZyIizoSRhkQJ4QMtc7MlGgwj0l+Ne/7whW8jnJFfL081VaX9JBYYyP5zZMR8s
	 dHzLb+hxTMdhsQgEoqGQxcIuJLyBtLeryRTjOHsvG13huaq2MUfZQPFUkJU/+YdxRl/97
	 iOOkXXW/1Pi3gQRgRFHwC53zPHWUk2UEqIECUE+L+mBPi4oF8N4/7hcZ2bfrXjF2TCwQx
	 OMJIkIGLa18HuW1FPyFE6bDHfAlHFFjPR98JTi+Bngkq4Kzzn0M+cTo8CBmIKDGqm6IHu
	 Y/dWYAVe0LP47Nj1QaBHwKZFGN0XdxVyyiliq7jvyfnW0Vh9JGYF1k+mJFs0hUfKTbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nhq530dV;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A8606A329
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 02:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 222A8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nhq530dV
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso5483953eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 18:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748022; x=1796352822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgARupCYolbeA/n2nVCfsvFjJ5NI9vPuXE/b3WtWydY=;
        b=Nhq530dVI1F7uXRkrcEunCVpROjo75pgtE5HL2ywcqhfiwtYfEhVffNj+gq1O2I7K0
         VKo8aoFCb+7e+3GmsWX1VCuFozq0h0QSCpXFkboKKbcIIscERWBNUH5vvkS2W2sb9sy+
         8+6wN73+7fpKa30+GvwFYE0OM4Toa/cbZXPQq6gzvX2H4wrWfWMQWMsat3hYj54Qz8rj
         cedkmcLaXhogx9tye64TD67ELQVNhjw8Y64se3nbpGOjz2mCWp1rsS1yAJAvUTEMHU1o
         piDcUYA1ImlB/3pkYPflkE38UqQveeYB3jy2rnR5zFt2UNnTciVd7pK5tArp6vZVKxR3
         4Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748022; x=1796352822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgARupCYolbeA/n2nVCfsvFjJ5NI9vPuXE/b3WtWydY=;
        b=oBGimhsZzCvOjPfIRZV5TiLTMiwYToYtDpS44hKRhVjgOdc9CjsAGexgz3O2RkHiAY
         dic9+A/0Sb5tN5KmFeC/GMODwo8v6ELXK8vnh4T3+FUrFJv4rSS4QPcB82NH6Dbt9Nbh
         Ys3jarRfeZh+9c44kE0NHd9oK3lKyFM8sX+R7zejGbWWX6BMH53gDe7Pv2+LXsRi4bDW
         +6vGLkNDdyCSeojibyq+RQNlf9uQaMBAUo6oZddXpQXRHTsSdFiiY3/e8zbetkf8J2J1
         Is2EJrU0SztaFqQs0t9cJCp2sI5CW6SjJZDg4XRPuRysp+HSxexjWdPQ+oiX9Zro0LFt
         rz/Q==
X-Gm-Message-State: APuU4Z8TMaUjiZq51Lioy1HCmBLAg31sDXHv6PRO334xBEl2zaMo/o1w
	g+T2eHxLpxQ/up+aj2bf+nuipiaglUErVheCBqFbrypLvGchPaW6XJLW
X-Gm-Gg: AZFdTZd2yhsKHWzmd+1u+jGhqsmDS6pkI2zOhkylHNTsJz8kTiCbDl5xB+EwZ5lGk1J
	PTLWOePLTXrEVUGSx1xoySuH7UHHNiLpRboZ7qZAqLU8PdQKV+lptvsmL3PQqvRZ86DxtH+pFvS
	yg8EufkqeZm42Sy8qEdGhXBjh0TAvvT+yXwBCOPU+OF9mLtGHHYqrPFwZ1sGBdIoNHfzM/TZtKJ
	1n2fzDyWq1c0lvWEs5X9vPSL3Z0XHT3RmgAEBU5LS5dRmWA4ABuM+zWNyIB2D7w3B8c4a85+fUI
	qyQeURZ7R3pO4oJErLcv5+Mq4lYX27F/IXF6rjabupKfkFju6vLT3JPMDTBN5bHhnDZ4qC9an+q
	6PNEbL6BurEeUOdA17jVVEcR+PhMz1s1elyF1Df68fhrKZY5raHNfrLKhm8PSJlCZQH2mgPx4YL
	ZLe5DkU5HzFrZVOUhRgLhwzm9nkjQkJVEYVCM2lU1JQxFPaTll0z5yinkyboHIHClhZqKdqIgim
	h/5DG/N6ATBZ6RRuZSHNAGwZwYa6lb8234AvtIp0A7D1QI+eLkgdkupKVE4Ea7QEAMIfjpRc1Ji
	9RcO0+9tLNwdPSILw7Dsdn7G71JY9tcW/sS1wywlNGNR3fpTKtDJkv1HoswWxzfvrOIpqIWC0wh
	mPywXBOFOWPGa7s2T0k9KrbrNeTebCU/FrJp5c57nNQreHn74cisvabPXsAtIGOGFJZ2iJr8nAU
	c1jOmxSWwfNz06EujXQQmjP5g=
X-Received: by 2002:a05:693c:895b:10b0:385:cf42:9b98 with SMTP id 5a478bee46e88-385cf429dcfmr22786449eec.34.1795748022207;
        Thu, 26 Nov 2026 18:53:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm75811610eec.24.2026.11.26.18.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:41 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
Date: Thu, 26 Nov 2026 18:53:36 -0800
Message-ID: <4a1ca9527265df78397d6df20a5bb53d06792eec.1795747885.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795747885.git.rosenp@gmail.com>
References: <cover.1795747885.git.rosenp@gmail.com>
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

Fixes: 6cff8d60aa0a ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v4: Fixes: 6cff8d60aa0a instead of the reverted 02b2aaaa57ab
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

