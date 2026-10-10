Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F683D3D07
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 19:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661147; cv=none; b=kOepYdA7zWGZ9aad50eor/Xl1YM0evv5oQxjvSdhP8VrE5qEj/K0OxPMrZp84OF37jbu9qeJHZsw7IjZTIo2SSYku12hrgLQYXmciJPh0aAuEiSEtLtt+M0PTIrWw7dUjvuKqqEA3a8TZWkJQSog/Zjg3Wo9VeAWvmHxyfptA7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661147; c=relaxed/simple;
	bh=xJSgGrQwuI25qcA8g6Cnc7jsjYB3w+qcq9BI4ElVklA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyiO+kssjjkh8ssrBSL35gUWHVDxA40TLtAuC8XvMm36uGfbzTWMtqxEJCuQWbnK3tDwZ3WCFv2MfO4Sd9U4C1Re2DuI05O8phHnBuy1u98BOvQw/1sa0tXE7nOy1FI4FutJJ6IxCuOJxxyv3PRWdFGw56l3uXL+AXFRyx0Avkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+NC1ivo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+NC1ivo"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afe0081a6so445874f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791661143; x=1792265943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drq0VqUbZ4w1u+8VMSjh+FNqyCvJbE3ENcf7RyvcL3Y=;
        b=r+NC1ivoRNq7HQAX2tD4f1RXvU+bGShhOKSJ13rtpKp+0ZZ6p7h4jAi6iFnk0iY9xi
         6go3Y2j6GkVpzfpMDQhSPJ90QAkPsDcZRRTtVD5PvpuZXLibLDqN1tqgN9tF/Uk+MfK1
         o+00/SUN6+xFVmwIh3DYEvpMjcKe7XV/lLD2vt5kdaVAYgYiGLnr9xh9Y2atRI7dta0I
         Gl4HWVjdyoivMw6ABwWWiwDtXr7gb0lD0L1Xvsc7FCFi3flbSLtJS9D442340XLrnbnq
         W/1pC7nDF8NhZl8V4J6QbTlBSO3Tih0JPxN3OQtc148VQLehMAYv8mYH+cgJbAVpiIHW
         recQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791661143; x=1792265943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=drq0VqUbZ4w1u+8VMSjh+FNqyCvJbE3ENcf7RyvcL3Y=;
        b=SM7uLKlU1Hq1nb1jeYe0RUu2rzEOZCUqD9TYB7ImVfqOOJw3Epn2HOXp3BRTaQgv0c
         ucD0jcVjHlvCtbTyumfSRNnZh3YRJhcojNy3htDhS2In7LS8Y15iXfbISVu7BqAPas3F
         ooIXwtYq7b81jpb3eYwGhXaqlhbsxHQ7Aaxwr8Va+8QMGZYQzzjiEaMOPyki0u4NsLih
         spUNbsztk2dyDIfdg2ILUVKbeOpJ5rQDVhMNzp5ITAKL5uO7lKAnbQPD2ICmQQKCXTlS
         2Z9rgV31KEU7O22e90G2mW4OsNwAsz5+w5BvZQfdzVcHnYjB1VmxihPkTgEY8f7AB+3x
         OKcw==
X-Gm-Message-State: AFq9FYJOo9PZwGarbd6UIBI/FcbJnOJ3+DYENhjYHarJ4S9kn7hlPN6a
	egxxRZlpw0I+Kz1uHSH9vPa73DuaWDvjRoaXI68upPRYNvX01NF5hbdm
X-Gm-Gg: AYBFou2giFPm7fmh/Iqs8zrKYvBQi71JJ2a6CEoBY+sJIxQoZqHm3Fy+nzR/oCz+2Oj
	ATPpXfObqxPIpyWQZW7oabPSSUVAmiKwgzKRniT7EX9m5x+8b+SnXTXStJnScKcZF8Y4KGz6/ZW
	dMSPkGKsMppb6S1cpWpftOm5tO8MXiagThjiiDW+oK/QdjcUe/WVT6sPs/kAyqkuYImfw9MwnlB
	9MVkeLsPnJcIaqfF48noTJtic3r/AbalC9hVxBSTGxlTV2gu0hAVw9KVW6avo3CGnFctZT/VtR7
	G+n3CpSDRQm+YhdTCFJ4E3a2GwJ6jFK6yePnzRZ16rYVAbKtuG1NVWoqnmEuXBmamJogFS8rMRR
	G0XKkSujcjKsqI1kn3fG0ERDYZrtScZYACyuyDZCSKHmE+LP73uFwdhx5qh96CPB50pqMx4QZFH
	LzPwXknakLytBsAlFvGjyekZ/XrWofWaFvNbxbNLvCErL6oVFlXLXUp7q14Ee7ZU3DklTc5MEai
	auqJqnPDy+axGR6evYa+BcjRlw+UU17iG2CPvTfIYs=
X-Received: by 2002:adf:e189:0:b0:48b:efb:4a64 with SMTP id ffacd0b85a97d-48dbaaefefemr9392235f8f.37.1791661143302;
        Sat, 10 Oct 2026 12:39:03 -0700 (PDT)
Received: from localhost.localdomain ([67.209.128.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm11123224f8f.16.2026.10.10.12.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:39:03 -0700 (PDT)
From: "Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
Subject: [PATCH 2/2] platform/x86: asus-laptop: Add WiMAX rfkill switch for Pegatron Lucid
Date: Sun, 11 Oct 2026 00:38:37 +0500
Message-ID: <20261010193837.1120-3-kotekompotek@gmail.com>
X-Mailer: git-send-email 2.47.0.windows.2
In-Reply-To: <20261010193837.1120-1-kotekompotek@gmail.com>
References: <20261010193837.1120-1-kotekompotek@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Pegatron Lucid the ATK methods ENPR and DAPR enable and disable
a radio selected by an id. The driver exposes ids 0-2 (WLAN, Bluetooth,
WWAN) as the pega-wlan, pega-bt and pega-wwan rfkill switches, but the
DSDT also implements id 6, which drives GPIO27 and the EC bit WMHD:

  If ((Arg0 == 0x06)) { GP27 = Zero; WMHD = Zero; ALED (One) }

The firmware leaves GPIO27 high at boot. On units fitted with an Intel
Centrino Advanced-N + WiMAX 6250 combo card (8086:0087, subsystem
8086:1301) this keeps the whole card in hardware RF-kill, so Wi-Fi is
unusable even though pega-wlan is unblocked:

  iwlwifi 0000:02:00.0: reporting RF_KILL (radio disabled)

The same card works under Windows, presumably because the vendor
utility calls ENPR(6).

Register a "pega-wimax" rfkill switch for id 6. The rfkill core applies
the default unblocked state on registration, which calls ENPR(6) and
releases the card:

  iwlwifi 0000:02:00.0: RF_KILL bit toggled to enable radio.

Assisted-by: Claude Opus 5.5
Signed-off-by: Pavel Kossenko (kotekompotek) <kotekompotek@gmail.com>
---
 drivers/platform/x86/asus-laptop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 8e69f02..ef4c2cc 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -192,6 +192,7 @@ MODULE_PARM_DESC(als_status, "Set the ALS status on boot "
 #define PEGA_WWAN	0x02
 #define PEGA_ALS	0x04
 #define PEGA_ALS_POWER	0x05
+#define PEGA_WIMAX	0x06
 
 #define METHOD_PEGA_READ	"RDLN"
 #define PEGA_READ_ALS_H	0x02
@@ -1454,6 +1455,17 @@ static int pega_rfkill_init(struct asus_laptop *asus)
 
 	ret = pega_rfkill_setup(asus, &asus->wwan, "pega-wwan",
 				PEGA_WWAN, RFKILL_TYPE_WWAN);
+	if (ret)
+		goto exit;
+
+	/*
+	 * The firmware leaves this line asserted at boot. On units fitted
+	 * with an Intel Centrino Advanced-N + WiMAX 6250 combo card it keeps
+	 * the whole card in hardware RF-kill, Wi-Fi included. Registering
+	 * the switch unblocks it by default, which calls ENPR(6).
+	 */
+	ret = pega_rfkill_setup(asus, &asus->wimax, "pega-wimax",
+				PEGA_WIMAX, RFKILL_TYPE_WIMAX);
 
 exit:
 	if (ret)
-- 
2.47.0.windows.2

