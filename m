Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331663AEF41
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Feb 2026 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382640; cv=none; b=tsGWpDfCG0DSoF0csMHhFYiv411Uci4PUCRRgDkt9wt/TgY1UsczAmkmbXP0DUO4sG9Hhp3oyt8XTXJE5x/oLJaKnAzCfJHC8tFKTj0L0M9FhlM7uQaqAkZytErOGVW8eEbUZPZvgF1UL5U+cG4H5TdQ9iZDgY/IczgsLbEWyBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382640; c=relaxed/simple;
	bh=Gm/45C6aiyq1VubFEgZhyjA7HQmfRnDcaftZAQwtYDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pwh6ZmVg5CN7JHEkS6mfOhOlGdCXFw0WcV8M0tp0p+sNp43qSJeM4UpDKHc5VwqG+o3yLXJf1RfO/WjdRwnMvxj0IssZ4FxoIX2Tp58Qirx58dFFI2pifhcM78r4S7J5+srQiKlmbfn8EyI62XXKHbGODTqsp7zhPo9xY/F1jbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWOqyAHo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWOqyAHo"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so22270965ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Feb 2026 04:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770382639; x=1770987439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Nj7rTmIxrIyoM/Zv2E7TPav3Q6NYtriqtqId7+NMO4=;
        b=YWOqyAHo5FT1cTWCmeiUcL3s80iYsRy0X6JKYQWHTuO3yGnzO9HYtu99CrIPywTpeZ
         wlaxUVbfyvqo5mnLljSlHou7F0Mgk0pCLcY+xLTuh0FTorwc+ujO9LX98Pn/3kMsyb6i
         8cO1yqWFD7ksKuCtQBME7C9//3pF2PKGlnySQ/QKKyTQ5Dn4S3hCUBH27heoV4D+Swww
         Wk1CT33aYego5MOwZNtsKi92RzaeVIwqCqnuZvI7BhRG+NNwnjVjMaRH4+fLktKexpyd
         SFKjke4g3qo831W3IXzs7t0CgM17ZmE4uwaLH8BWOySe63B0/dBsy1E7gtqXwUDp4WPx
         f2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382639; x=1770987439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Nj7rTmIxrIyoM/Zv2E7TPav3Q6NYtriqtqId7+NMO4=;
        b=qX8EfaJesf0dt2K3FnZdIKcqDS4Phsla0MEv1PNtNChHZs2sqfOhWy0gH0G9H1wEA+
         7Ylomy2h+fkfYr8wbfF4Pt+UNU0CgUm8wYm7t3ydq7d+vP2JcJtUTmCI/wJQ0/0jlL7c
         SfP4r5pZkwNi77VfaZtjZSpqfFiMQU1vOjQOestGUt7hda2Sk/6KaZEm+5rVX+Idg21M
         L1oZEUKiRlCfMhxnoDoHZ1Ss+4QrzrupctRh9Xxq6a4yUvnCCS43K3tWLa902dflYUrz
         P4SsGw2tO56aCoTNvDl0aPhIgEyTA5twW9r8VorcGCvMiyc2TAazgd3Q0zg7Z8Y5bznJ
         tUJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeolP3VkJLHDxCs1manA4EmPiOi/AxH5/cOcfJ0x6IswCWkjdsAwYaaSTuELNwtuLphJ7ZvIA7b/XIBMEVD5T82EJE@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwmh0o1WoW9SQt833fdD/Ws9FwhSSW8L2vL9123t3lNhxPKiK
	Z63xfvnTJvJnS+EgA3sr6gve9sT9yYw9ZjyPa36mQwCSLc8pqiOXueE=
X-Gm-Gg: AZuq6aIEFyibLLQF3y2rp49eHPICBMJE5Y93nBES/Tktp4ADZ8EL92bGYAEonf8R7Rw
	xYclXylkwRrp1il+YETTsYv749oWjzvwEpCeNmkDmxKIpCOlIISTcYBEq6ozZNPqa+7Bp8ud/4m
	kqZBIuwcWX61RcB9rmiIFKCAMl9C976/64GbBJxzM6/PrDAwnYadB//n1f6avX26NYB1SFYvJg7
	lyVoZj+uGRee0q6kE61YOlOD1jp+MEvXZVgsQPHB3JHUN2Isei24jGBqvWE2Nkz8RDm80wBTMCe
	rTrVZ16GeFDCjv+3BbWmYOKiJ4hxh4IJCNn6fCK4D+WbZ2omdmpHcDAoc21GvzBgMfiFSHimCrm
	ZFJg50LuXTpYSX8rnQiQb9BWV9AMCiceEVIoaJ7+IR6PPpacqi6d0529gPQoDNtc4w2Id9ta6A5
	+wCtRLaotvbSRNiXEf6fbZwJXZBw==
X-Received: by 2002:a17:902:da91:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a9516cd2fbmr27802775ad.21.1770382639301;
        Fri, 06 Feb 2026 04:57:19 -0800 (PST)
Received: from at.. ([171.61.167.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a636aasm23336005ad.12.2026.02.06.04.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:57:18 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Lukas Wunner <lukas@wunner.de>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/apple-gmux: use apple_brightness to save brightness to EFI
Date: Fri,  6 Feb 2026 12:56:22 +0000
Message-ID: <20260206125641.12983-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206125641.12983-1-atharvatiwarilinuxdev@gmail.com>
References: <20260206125641.12983-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use apple_brightness to save brightness to EFI.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 1417e230edbd..cfb20c115eb0 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
+#include <linux/platform_data/apple-brightness.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -960,6 +961,12 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	}
 
 	gmux_init_debugfs(gmux_data);
+	if (IS_ENABLED(CONFIG_APPLE_BRIGHTNESS)) {
+		ret = apple_brightness_probe(gmux_data->bdev, &gmux_get_brightness);
+		if (ret)
+			pr_warn("Unable to Enable EFI brightness saver: %d\n", ret);
+	}
+
 	return 0;
 
 err_register_handler:
-- 
2.43.0

