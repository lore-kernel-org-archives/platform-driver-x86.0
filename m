Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7591D43DA31
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169043; cv=none; b=E1+FPfswLcgEHU0Qhv0XR7UrzNFv02927HP6fQAnGMqx4ZhLjtjSddJ7nxMMB8kc2Xi5vSbyfG2DUAWYLzep4lb7pcb1k4Dto1HwNN7yKT4OTc0TXj32pTEPbaoIXcIwkBFsz1IzRic/LPER0qU0yPJ6KEKntdBX7kfiXxTgtCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169043; c=relaxed/simple;
	bh=vqpQ7su2zaf1QViLtNg6a7uVZuUX77IifebVxWL4gak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HBsj0wE74bgcAPqoBXx/jgiaeAkcEHubkuKsL7gNBbCMhUqtnnoQuw7fTJ+d5DDHtLuT8u9iSMHN4wBg/lpjcV7Hhiq3Ix8FTzh7qJkZypC8DYEN495P/ffUVVCvkxbTBIWGJ7lG5PwKc1NmxMWlD2ildwYHQC3z0aDbfVke57g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=LRK5pQn7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="LRK5pQn7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44da2de25f3so788397f8f.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 08:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778169037; x=1778773837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WSQWnJQATh2EdBTdG2QpfFCiA1hZYD2zQB9kNoR/GdY=;
        b=LRK5pQn75EQBZZSE/rSKD+HkYyX1IfJjgMBbUoGSrjcFSSi69szH2SrPBsvzMDZTrH
         F+A85ZHIM/FGspFAWp2q+dW6gEr2oGHthGOFBYx/jhKfFXqellydbexJQlzvOOuY35AF
         cVEyRp5qaVxKs5SG/ZxM7y3S1hik4WmxN8szJLYhSiSCQ4T12Yp4aQx3qY+LjDvw5+gx
         CmFPGYuTMzi2zXlK/uSJ/hrS+Grto/yaNMvTxBZ89W7eUx5VFJt+bu0Yt782pr8NWVfy
         fAdwsnuN6Otm+vZRPn0IVQGPXYf5Ise3DkUqu08zXY1IbX0o+4VxWrJkNRetsite+0nr
         Ufsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169037; x=1778773837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSQWnJQATh2EdBTdG2QpfFCiA1hZYD2zQB9kNoR/GdY=;
        b=E3BIkyYP4gqv1GGDapXqWm+BOUCXjtQmltcLUv/o8plbRDWoq6+QEj2sfaIiawER2T
         5sNU+0T65zlXNy/9Z/hV+ZvCbK4DVWAjlv9BEqp8ncJOJpPoHvyNl3k8qyAGDJfepBRl
         F5a6E/tqqiJDany2xKAOZqUrA67W9Orjh37nlSC5ozj4N5pQb8Qmi0CJAe7omlHrI0AX
         kpwTghXInQzOm5YZcVxJUt8Pf64eMp0nm0Zr3Rd5Q8+AjYGzJHbvktl0Z/OldpuMUZ/u
         bBqfFbAHHRIUygD1FE+fudsGRVjQIyMqFMQ+MS8SWBgSheuTVsJVbTk3hEI8bFl9d0OB
         oItA==
X-Gm-Message-State: AOJu0YzvkhoJ4xXYlJvDQsWNfE5RiDlBXnfRyzI2ZCl2hm9rY1/6tndE
	wOs730CWo3t2zhhpa3Qynf/UWY+2CNGO9f6lSr0kay3pusP8vqnwScLAr3CLjSkqjSk=
X-Gm-Gg: AeBDiesOteCw2StnUXKV2+RiwouHzHZy5c6ged3qOnBn9zlSakBKDQUIZnW3mvgE6wM
	OQifLJ3cgT2J2ljpBzjJa+5M2dxFtQemaWkNmsOyIgqUQLbMMYJiAtyAoz/OGYNl0y8Y9MTUh33
	qyVPNApJRArlhL2lqdM5EIXRbu0izHJdwrjm03gBkPLkDrNRAqR2AP/YlUThxMzHflD4csi8Lb/
	hHybhjJg030DwQiezkGHgWlBicekUuGO70bsWYKL93mCsu7TOMyP0N5gUl0XdzbaKhEzL6T2hnU
	f2iPL+gpq7Zt2XbwwAmpyjEVnioDV8fmxnvbUl6gtfihP4bb59uh5jsM5mFYJY0Td180lu3Vi4s
	hmweLzhCqdcW1i/DU2pXcdXUPQggfzzmOXznxdDtqcuGiGjWtBec7LyPViKXgMN2wZPIliR1jO7
	Iy8cXrqYFWTwfgMUiKVeCbHrc70RzfwNKjMvqxIDKMj479EKNvR99byOxVthbVZZVOpNzLT31mI
	mW/m1STQPQ=
X-Received: by 2002:a05:600c:c096:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48e51f444ffmr99757635e9.21.1778169036846;
        Thu, 07 May 2026 08:50:36 -0700 (PDT)
Received: from localhost (p200300f65f114e08e9fd60f450b139aa.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:e9fd:60f4:50b1:39aa])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e5390f854sm127729635e9.14.2026.05.07.08.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:50:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] platform/x86: pmc_atom: Use named initializer for pci_device_id array
Date: Thu,  7 May 2026 17:50:25 +0200
Message-ID: <20260507155025.3186956-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=vqpQ7su2zaf1QViLtNg6a7uVZuUX77IifebVxWL4gak=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp/LTBS7tu2nN0lLhkI7NzE9vj09j3kGt4J2qgd pbEohK734OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafy0wQAKCRCPgPtYfRL+ TqokB/0UlgLDi9WQDVfD3mdr8ZT5rC2bwyP7lV/ai+6ftk3hzCA49v0NHhu/m0sgEUC1Kk3anK5 UnZFdzeRAgtW7XkY0NSdud8SuQD2f9aIYEP0pcW1LqNGJVvIqq9miKxtTyQNuFS97WSPW2DwnuA 5WiZvqfdVP/uKTaAmfU6ynPFKSI2DZcL5zPOWeTR8rcAWI/bkqgMbTYEyyGJPWAIS99QndNGBxE LMoNcXbMDeDKRs9VVSgd0VHNypXHWfgbDjJXaYdE9M1+2+WyhzR3BPh9Vn59js70YMr+IRC7TUA Sshk+c9Ocl44olpXT86mc/5lre09S0KjJqcENC9E8+tBlD32
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being more verbose using a named initializer yields easier to
understand code and doesn't rely on the two hidden zeros in the
PCI_VDEVICE macro.

This doesn't introduce any changes to the compiled result of the array,
which was confirmed with an ARCH=x86 build.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

while being a cleanup that can stand on its own this is also a
preparation for making driver_data an anonymous union that requires that
.driver_data is initialized by name and not by list order. The union
allows to do

	-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_VLV_PMC), .driver_data = (kernel_ulong_t)&byt_data },
	+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_VLV_PMC), .driver_data_ptr = &byt_data },

and

	-	const struct pmc_data *data = (struct pmc_data *)ent->driver_data;
	+	const struct pmc_data *data = ent->driver_data_ptr;

then.

Best regards
Uwe

 drivers/platform/x86/pmc_atom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 48c2a0e59d18..046933f6d1b6 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -570,8 +570,8 @@ static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 /* Data for PCI driver interface used by pci_match_id() call below */
 static const struct pci_device_id pmc_pci_ids[] = {
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_VLV_PMC), (kernel_ulong_t)&byt_data },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_CHT_PMC), (kernel_ulong_t)&cht_data },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_VLV_PMC), .driver_data = (kernel_ulong_t)&byt_data },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_CHT_PMC), .driver_data = (kernel_ulong_t)&cht_data },
 	{}
 };
 

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

