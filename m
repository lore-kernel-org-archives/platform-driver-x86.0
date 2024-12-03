Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5B71F943E
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246194; cv=none; b=CXMqZAsKuhEso18ITothJSHjBOmr2fAZ34ytOxW8+VLH/NKS40WcAdb7mCTqko9qPFrW6YJNoZKOmWaq9HARxxaIMK1roSi5lyWi9nCQzAgGTOVhXs7JDlsOYaQ28Lf0UOhKbwYiwil6Q1GLjviB4BlrXEyOTFcdmx27CsraGQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246194; c=relaxed/simple;
	bh=2uNM5E79VqxO+4hWUeY8pC50c4tRPQ6CI6tgNwDKkk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYk//JM9F+4mq0Fo/BiDFHA9a5DwV1SR1eeiGo7rdHqzDUL9RmGF2cgH2GFueh5SkhOt2KMHJ5cfhkO23wo8zn41Pko522j2UF7+I8mKuExw0qlfs5ahQA/M6/T1iEC/RqFDlPIfIfPwbypoSpGROj/J6RqMIOZ/uYzkI0t9paU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NV1ep21B; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NV1ep21B"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2630160f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Dec 2024 09:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733246191; x=1733850991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0uKqW9vvWRGO5PxCSBAB7Ojpuf7zy1ETNyv1ImS+4k=;
        b=NV1ep21BpNacHxFMpf9WGWzWPxYqlR/ltnKnMZFNF9+uCxUo4eP947/79/Pjzqz1id
         NH4Hk6+To5RIipxdlmRhDFt7S4lL1s+5qJ3Y9cSLIT7E62KaS2TYPTLTJKHLgjaoxAq5
         nBTwaOuwGTFvdAR/a/o8H5l+OXJIyOVnlq39xnbmKEFA6rc5KUZ/fSY/6fDiY5E7Y0rK
         9ETC48OmkMSerEwZElprc4UseHEAdF66HxRMLB3xn8l1HoBWuN0BzPjWgct2zIlpKZcO
         s6lnd2t+Q09g/QPAjC2qhdfLImCgxdhFjjqV/SKbbQ0UULFxgbnDR4rfy4vRKH5hfr47
         F8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246191; x=1733850991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0uKqW9vvWRGO5PxCSBAB7Ojpuf7zy1ETNyv1ImS+4k=;
        b=YPL2FgZFKuHKBpJXpcN5pwenh2Wpgw6Hd3xOEnn8xWTtd7QZQXStSk701JhpA6KL2Q
         S+SznXyPZ12nu/iWnmIBmBaVQCCrZrapmCcmiRdjyhjfrufpSHGlsGRedAY83PzSH6rH
         PUd3qcAxjMv6jvKxGVtx7fDCXCF3w+/nFiBVLFw46flixQ7ek84NDqudT8A9FnVJebyA
         2fbIEQUUqzScXsHm41VSUlzs99xggwvg7en4h6ag2/La1lBgBAgGIVKUAaEbWVjoH5q3
         D+mhOMZAph3A13e86Y0lz3RnZY/IP5Mt1XXNvhMLD2R4Xmbwn5PGs1lpd/YgkZA05tIW
         h54g==
X-Forwarded-Encrypted: i=1; AJvYcCUbYsCRg5B8je22B5zZi6VJc3uylRbP4Da97MudIa6qHj4oi7e/511QREaKODpIBhTJfqpYzIEb71q6ZPy+LH6F/nYU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywonjx/Znmi7LY2eunNblizcI1q/oPYZwBq/IRVRaBTea9J5HTr
	JUaq3QP8ArI9IVi9Ew2+7ZEyIno2oVOzi1TRGlLItJW0DcJYsbvftDqMQzJSR5k=
X-Gm-Gg: ASbGncsOQlKrbC4zm9/WX3k0rrKwJnjyExXZILIdLSHAvbDFNblCAmfhXuhKlNRnzCY
	Sl9738Lj3svxBI1BgmEInz9ErlFnXDWaSd8lbJ3XiFfL1YqpaBOPB50JvU/ypomr+3v/YHmOLzu
	KKIvljGI0joSQ8LiLSzLR1URXIa+rtlK+bUjhOLgawg+rGhSlLFEDzUdfpJpR6wGURJ7AhQN4Lq
	k5RRl5H/cwiKDNv11frfLlPjmxpz7E0GwsdrCRnCL+s0f/NJkt+kLrcByBoI8ub8Gyt86dj1RM5
	RE71
X-Google-Smtp-Source: AGHT+IFw3vi5gBv/+PBzElsQLFBW8gwbgc04WQ/TBWmy09BS1Trc/+BXbDqi3tSXKRTkK7KTyJorug==
X-Received: by 2002:a05:6000:1885:b0:382:5010:c8de with SMTP id ffacd0b85a97d-38607c164f8mr1074793f8f.46.1733246190826;
        Tue, 03 Dec 2024 09:16:30 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a56fsm15903085f8f.62.2024.12.03.09.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:16:30 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] pwm: lpss: Move namespace import into a header
Date: Tue,  3 Dec 2024 18:16:14 +0100
Message-ID:  <3a99048a52aeee356d01dbf7f2f06e6e0826ed78.1733245406.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1733245406.git.ukleinek@kernel.org>
References: <cover.1733245406.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2630; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2uNM5E79VqxO+4hWUeY8pC50c4tRPQ6CI6tgNwDKkk4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnTzzhhbwznRnHJ5gKYcuhn7fYxxBWZBHiXgPJb cl1DuWrimGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0884QAKCRCPgPtYfRL+ TiknB/4jRyiWRDxkq5fCwPAgnXM3JxY4Neg/HTlIp9XiCARliVwvrg3pyDItMmDKwM7dN0eSaHJ Pa+JsdGwMEykPW1V0MfxOKe2i0y+3FmXJ1mZZUwezjCAzH47bTyHuzV9XIoQcK633xy4Uyr9wCO BhBMkUae4uh4z7nL5fbaR/BX3e00eoNahJP7KzQrXM4FCf1AZWLVPirqK33/9mK0sNBR6zYGwtO DK51mkVF09gU4TS6q8j8KYL7vBMq9w+FSJRZZnyBWu7bB8vom5U2KTCKjIbqeYZ7AsPbOti7Djn C/SB6uDAg+gqqYB+zRGX3Y1xapfc3Er2UvYqai5VgfNSMSCh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Each user of the exported symbols related to the pwm-lpss driver needs
to import the matching namespace. So this can just be done in the header
together with the prototypes.

This fixes drivers/pinctrl/intel/pinctrl-intel.c which failed to import
that namespace before. (However this didn't hurt because the pwm-lpss
module namespace isn't used; see the next commit.)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-lpss-pci.c                 | 2 --
 drivers/pwm/pwm-lpss-platform.c            | 2 --
 include/linux/platform_data/x86/pwm-lpss.h | 7 +++++++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-lpss-pci.c b/drivers/pwm/pwm-lpss-pci.c
index f7ece2809e6b..8615c44c1034 100644
--- a/drivers/pwm/pwm-lpss-pci.c
+++ b/drivers/pwm/pwm-lpss-pci.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 
@@ -70,4 +69,3 @@ module_pci_driver(pwm_lpss_driver_pci);
 
 MODULE_DESCRIPTION("PWM PCI driver for Intel LPSS");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PWM_LPSS);
diff --git a/drivers/pwm/pwm-lpss-platform.c b/drivers/pwm/pwm-lpss-platform.c
index 5130238a4567..3de1ab2cff54 100644
--- a/drivers/pwm/pwm-lpss-platform.c
+++ b/drivers/pwm/pwm-lpss-platform.c
@@ -9,7 +9,6 @@
 
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -78,5 +77,4 @@ module_platform_driver(pwm_lpss_driver_platform);
 
 MODULE_DESCRIPTION("PWM platform driver for Intel LPSS");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PWM_LPSS);
 MODULE_ALIAS("platform:pwm-lpss");
diff --git a/include/linux/platform_data/x86/pwm-lpss.h b/include/linux/platform_data/x86/pwm-lpss.h
index 752c06b47cc8..0a1025f6cd58 100644
--- a/include/linux/platform_data/x86/pwm-lpss.h
+++ b/include/linux/platform_data/x86/pwm-lpss.h
@@ -4,6 +4,7 @@
 #ifndef __PLATFORM_DATA_X86_PWM_LPSS_H
 #define __PLATFORM_DATA_X86_PWM_LPSS_H
 
+#include <linux/module.h>
 #include <linux/types.h>
 
 struct device;
@@ -30,4 +31,10 @@ struct pwm_lpss_boardinfo {
 struct pwm_chip *devm_pwm_lpss_probe(struct device *dev, void __iomem *base,
 				     const struct pwm_lpss_boardinfo *info);
 
+/*
+ * The above function and the pwm_lpss_boardinfo variables in
+ * drivers/pwm/pwm-lpss.h are defined in the PWM_LPSS namespace.
+ */
+MODULE_IMPORT_NS(PWM_LPSS);
+
 #endif	/* __PLATFORM_DATA_X86_PWM_LPSS_H */
-- 
2.45.2

