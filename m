Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB704FC8CC
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 21:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371005; cv=none; b=PtSGR1x2K3iUHLwhJbBaxc4U/sBaHuqzjSBpXafrVfuofbeq8UpkY7QEd0SuAYIdtCdq8Z1tLoXAmNuyUi+EX1vzvkFAXrYEqgDE8OKoD0wW2043s9+t0HbeCwQ8b2gdz7X6pvlvhsjlGErPynIrJPCDkf8QG9q+YzEzWTSISNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371005; c=relaxed/simple;
	bh=VcJEB/8zZf8xb25bTZV+ZLD4X01lT7TB13axe+Sd/J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOqGq8leZzxgNojNB3rZQYhL+D+El6ALjmO8P7w650JpEiBv5VDUK2YaBILqB89vtpNyWxh3Cv/D6ldtgxFPUaw1sRSsjMet3Mj8WQXm7awvfDrqLGWzcLa7BhbZAvmZqxnxpp9GlzBmhmjPMU4HCr5fsClECTUIep5QXDjKYu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnAkwPG2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnAkwPG2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48586861639so578232f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 14:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371001; x=1790975801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+p5rx6TkxGynRT5wM8/9aAou6XuDMc/agUIyGKPsW5A=;
        b=dnAkwPG209KNo5DC7sn8Y/qAKEi7gubM7VATqtxBgsts4jU1cxjx2jvOhKdDPX20nN
         3BXEIbAz++n7AUjjAX+cPjfzTxT7pwBQOT4ZcgZdCBBbvAlahvB8WeXR0llp/+e/tv6X
         2OubAu70KLrBC9UorXqJfdZvKjGZfI2D0lMte9CsTHzG1seWZv0C357CURPWKeAqqNPR
         /pDgmfKb5CAa9rMsFJA5t/4hC5zKme3YXFLFjlJW5fQh9b3PtNzqBJWPgXLeLV1/ChWe
         DdjidG17pfA4QLkkLw8ZFmnydPGLQ5bx9ek9g4Xx92QEE5i5+a2ioW9hIjKGwmKwMESw
         qmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371001; x=1790975801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+p5rx6TkxGynRT5wM8/9aAou6XuDMc/agUIyGKPsW5A=;
        b=IeYDn5iNyzw7346f1SoARrxL2kT44+MDjlusbA/tg+jMIKx7mpBTiRY/HY4UqFkQrW
         FKLhpKBzpNGlUaZzG2VkDfvN0cnoT4Whb1AZbvmNQs8gbEHjr2l6F2vpK20me4mXOXoN
         lTvn/NlhHfnnIgfeyviCKTqR7TmEpb8HipIce3H8K2oznh0ttHFvu1kGBwVJS35Yi2iY
         XKujXscRJjlYstCnlWj1CUJFPIIzz8rHVHGx0kdnZEg1mnVgQozJrLoSZxh+Wl/snHqY
         0FWoS2ec3kZo9WGns58kjFaHYUY0pAYb0n5YDshGSj+HzfBIXJcfhz+2ihkt80XUOIpp
         2Ehg==
X-Gm-Message-State: AFuF++kvfFQ63weCkACJYECocQHQDwpqNKH/Q/kkW/K8Gbq9XePHkofN
	5nnkv+4ORlXdYaY4JFPRkzWlbqXmIwxfz6wIsOhJdVw68g+iBydCja+1
X-Gm-Gg: AYBFou2v4idSY716/14mRfISgf0ACsR707LuHDXRHdRiSShbvgUZnqADAq7LDJlnKOw
	gtxN5w5tBU2ghX1ZdQrHTaGZOeA7NK7oNcvwmcOYZc9ETKF88vXR4bK0DrKnzH2T1N9r71azvG8
	eT9699/pS1Sp1prI0tVLd6fbrGpvniynB4W2XAhKr6/HrAzqvL/s2b+k3IfLxfyvya7dY0PgXxA
	t3chIT1WrZm0qh3NJdfmu+206nOUlKjkV3Q6HMFqVzHvjhHedpn48NTzItlHT3U02usOFjl3qJW
	LBpn3RiG5PT+S9qIJAqM1iG6Kz4IALFB+CkWPrRQBxCxhiw9JZ3cmF9vDW/7WcLKx3FBQywH+cr
	ZN+FaMwFSIKChZqZ8J3hXiXlD/9uOwCKsfUTbxGHKlgbUW40oh3eNVxcH6gOM07OFdWbr8Ycaku
	+Z4kBpt0WTLC3mUEgxaTYfATh+fGpf2pscs8sZC75AdvnrIWh2ZlsaUyNpbyTa5SSgo4QYXrDx+
	yqGIVuycg==
X-Received: by 2002:a05:6000:25fb:b0:487:25:71c7 with SMTP id ffacd0b85a97d-488716b96cemr14060679f8f.12.1790371000904;
        Fri, 25 Sep 2026 14:16:40 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm9271781f8f.13.2026.09.25.14.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:40 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH 3/3] platform/x86: uniwill-laptop: Map the screen rotation key
Date: Fri, 25 Sep 2026 22:16:35 +0100
Message-ID: <20260925211635.1422516-4-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211635.1422516-1-amad3v@gmail.com>
References: <20260925211635.1422516-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD / TUXEDO Stellaris 16 Gen7 chassis has an
"Sc" key next to F12, meant to rotate the lay-flat screen by 180 degrees.
It reports WMI event 0xD0, which is currently reported as KEY_UNKNOWN.
Map it to KEY_ROTATE_DISPLAY.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
 drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 0932e5937..f99c5e9ac 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -519,6 +519,9 @@ static const struct key_entry uniwill_keymap[] = {
 	/* Reported when the user wants to toggle the webcam */
 	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN }},
 
+	/* Reported when the user wants to rotate the (lay-flat) screen by 180 degrees */
+	{ KE_KEY,       UNIWILL_OSD_ROTATE_SCREEN,              { KEY_ROTATE_DISPLAY }},
+
 	{ KE_END }
 };
 
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform/x86/uniwill/uniwill-wmi.h
index b25b2f312..1b6f650c4 100644
--- a/drivers/platform/x86/uniwill/uniwill-wmi.h
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -117,6 +117,9 @@
 
 #define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
 
+/* "Sc" key next to F12 on the PCSpecialist Recoil 16 / Stellaris 16 Gen7 */
+#define UNIWILL_OSD_ROTATE_SCREEN		0xD0
+
 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
 
 struct device;
-- 
2.55.0

