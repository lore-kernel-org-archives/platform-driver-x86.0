Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EBF33F8A4
	for <platform-driver-x86@vger.kernel.org>; Sat,  4 Apr 2026 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775329389; cv=none; b=oIcL/Acqypsweofk9YJy8annSVs508PzgzaZqIsybrofaVZFamLl8cqtMt/ILJ45rifN/SLSc+PlauP7xpf+v/nrjTlCG7hiOd6jD+cIZh8hADc3HClbDy3RBV1rLUwavLpPmlEPmIcP1k6NgFz5mIcRq7UmATWeCEsJUtSwRIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775329389; c=relaxed/simple;
	bh=RTfVtKNXx5zmywJ9cixUTx46BcfcprXVX7kUQs3bovk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eS/lNJKgRBuRSJfbbTL7cK9b5SqLlsx/gjNyGO2Z4gQB82GfniQlgWh+X7AoFTAK5TdYrRih9SUFcufirUxf9tSWyDqMlNRfdUhbc55BIhiUMYm54iG1knRqxpIOVKxwfIdQ+DP5Ob6WdwZ51d5qxqwIry4gBRGcSEeVblbKhfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rj0gEgee; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rj0gEgee"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8296d553142so1425213b3a.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775329388; x=1775934188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/TD5emaQXD2Niu4vdPmtn6tIKP1Xoue1OWXb/KmhNY=;
        b=rj0gEgeerUhDRMbZ+5mmtZS51BXGTzGGjuHn6Wo3K+jNkmmozefhoE5ZyzSGWZELZf
         WshZmhqlCyVQbzPegKwZQRfH/sHc/A5c+eipbNxrT1pkUENZLLvKyEBpKCI0rqdcyoeo
         If6Hk/zn9wlAft07RuZo9Ov+IzNSnpuc4xsRiFSXYGhZ3dE4TsTRlm0+F5SyyYDuOXL8
         5T3ElFYOLiVzgIhSZmLmc7ulRBo4XuzuH7e7xrdq3Wu0ky3dY/bTabvXozIItOcHiw4j
         cLFno5PXY4ndO57xhsMPnnEtIb2jCTsJwr3OYQQnr3Qi0YI64G8UMY/VVIdiBiK/s4xV
         6L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775329388; x=1775934188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/TD5emaQXD2Niu4vdPmtn6tIKP1Xoue1OWXb/KmhNY=;
        b=LDPOm/t32UFFahZmWTfJl0nQD4SvfsMTGzX5Wi7+rGwSyfnIvffJ/XAOjqeHA3sXEb
         I0S16bb1iZwzNSmpZ3NL5iwaF+xTf30qQMIXV+5dai/gWcvxbZrWF1ZDz5DHgwpGJdhY
         488+jm9l/qazpw3Md9CCGcW2jty+5v5jAUY6Rt62YdBUTG6GVp82t02Do2hevKOLexom
         6V/WkNSXGMQqEcLKx3WymAzaWe4pbE3tzRiYU36yWvevfvLVvUnhkXBN2X+3FroVcy+p
         RftCEsOlYRiqOOtLCgNlaSAWHOrA/77ZWiSaTdiMR7+zF66V/GPDc9ls3O+C4ks40F7e
         k+qQ==
X-Gm-Message-State: AOJu0YxDqLqodabbZmsXpzDPx6P3dokhde7b9wJ/QhFfTP5/TNJn7CYd
	BRTf71Pf4qx19O/NOKoO8QHDQiUwPsORHEYl5gxRjEpftxx+50nF13y4TMSMG/JJ
X-Gm-Gg: AeBDietk1oBZVz2EtRewwRw0mXe3CkhG8OdPYuYE5mDfNlUJfrtBQGT/tVEFIuOHMkh
	g3m0BWchzVZvLsmQ/gPQr7n598ePdIsuHWTWxL8siNoJtECAqENVKjSHGnUSkbNP2O4ce6IdSOz
	rPRmYG+7Fw60xjHCvsn4zb+7Devz8sdGZSr/QjMDEVYF+/l6TDBsD12yH5ENAbDBoyVPeg2QT4r
	dkhb3nHlHMa5V9rxNgOFUywPnkdeXifFcx/GAEANN9sGtO4EI0cLH++T8hnC1qo9Se6Ik9XrCbl
	iYxE1qe2RWJ4BibAYDVP+z/PPkzRz3q4zi3FtHjNMPLSF8Bs85odgUmXyh90Tftkspj1hlPeBCC
	CR/8CT5ifcUF9dS4wZDRX2j0GTzraRc7CaU9TwxxtR89IDnb8i+Te0hIBh1l1D63GF8rRiNKMJw
	LRm6m+SzJZjRgjvFe4EaWjIg==
X-Received: by 2002:a05:6a00:3011:b0:82a:6de8:fa50 with SMTP id d2e1a72fcca58-82d0da9a08amr6636057b3a.18.1775329387767;
        Sat, 04 Apr 2026 12:03:07 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:a008:2f74:2272:2da9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261absm10968518b3a.7.2026.04.04.12.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:03:07 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and 0x12 for Lunar Lake
Date: Sun,  5 Apr 2026 00:32:36 +0530
Message-ID: <20260404190236.5218-2-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404190236.5218-1-vasuhansalia05@gmail.com>
References: <20260404190236.5218-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Intel Lunar Lake platforms (Core Ultra 200V series) use two GPIO types
in their INT3472 ACPI tables that are not handled by the discrete driver:

  - Type 0x02: Strobe GPIO, used for IR LED/flash control. Map to sensor.
  - Type 0x12: AVDD/sensor-supply GPIO, used on Lunar Lake to control
    sensor power. Treat like RESET/POWERDOWN and map to sensor.

Without these handlers the driver logs:

  int3472-discrete INT3472:00: GPIO type 0x02 unknown; the sensor may not work
  int3472-discrete INT3472:00: GPIO type 0x12 unknown; the sensor may not work

Type 0x12 handling was confirmed by inspecting the OEM kernel module for
Ubuntu 24.04 (6.11.0-1016-oem) which handles this type by mapping it
directly to the sensor via skl_int3472_fill_gpiod_lookup().

Tested on: Dell Pro 14 Premium PA14250, Intel Core Ultra 7 266V
           (Lunar Lake), Ubuntu 24.04, kernel 6.11.0-1016-oem
           Camera confirmed working at 1280x720 30fps after fix.

Signed-off-by: Vasu Hansalia <vasuhansalia05@gmail.com>
---
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -239,6 +239,7 @@
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
+	case 0x12: /* Lunar Lake AVDD/sensor-supply GPIO */
 		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";
@@ -278,6 +279,12 @@
 			break;
 		}
 		break;
+	case 0x02:
+		/* Strobe GPIO - used for IR LED/flash, map to sensor */
+		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
+		if (ret)
+			err_msg = "Failed to map strobe GPIO to sensor\n";
+		break;
 	default:
 		dev_warn(int3472->dev,
 			 "GPIO type 0x%02x unknown; the sensor may not work\n",
