Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1F1D47BB;
	Fri,  3 Jan 2025 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945524; cv=none; b=irC+EoAOJvBHVoTjZ8dNkZNvtnz2FuX6nyF/FpyoOc3oRs+LjvTh6KtqJOO50fJD0uKCL5S70MiG8BFgbND/LPvhRSzx7ptsF0MR3ck86sOX6LdPajDmhV8HygEQ0BETdH18FeeF1XzB45Q8tPBwM4o+G1zZeATQVUnlb/S12DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945524; c=relaxed/simple;
	bh=W4XeiZfPwpakoTQ4XvaiuCcehDB9+lh8TVJ9s6+5frU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mH1XbKGaDQpmTRUK+9SIeKFedVl9FGfwUTwnP9B4bc8wxVlCGw+xC1pf77pslWu7Xp6yx5NyHi9IY/2MpYc9hBhaiCejSnKSed/+yLZH2uCW+kM7bdIIvETVFczgRVkKkk2Ze6/vpEBsXIJxr6c7SuiYYvLF9iPmcXb70EikT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=cFiEke0o; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="cFiEke0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735945514;
	bh=W4XeiZfPwpakoTQ4XvaiuCcehDB9+lh8TVJ9s6+5frU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cFiEke0oqjHmwWDWVIEGZ1almMWK5Fu8XVliKdiK1rO0N/itE/GAcZCuhTOoO8aIX
	 ngIxOXxKXyrQyaLR/R03uR5k0SXrwFKuXprooXN72zM3qKe1qNLtKFKD4fZUIW+MfG
	 fpwZwcEVzbhsD//DlH3F1EJp3rkiFfi5oL0QdaHM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Jan 2025 00:05:14 +0100
Subject: [PATCH 6/6] platform/x86: firmware_attributes_class: Drop
 lifecycle functions
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250104-firmware-attributes-simplify-v1-6-949f9709e405@weissschuh.net>
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
In-Reply-To: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735945513; l=1720;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=W4XeiZfPwpakoTQ4XvaiuCcehDB9+lh8TVJ9s6+5frU=;
 b=SGkkS2bRjd3yedonV3Exlm3KZHfuIHuS4DLWOsIJkuafKdMW0HYy06q4MZXnFvr2bAZaPc3Kg
 n5ZZj4G9LjFDINHWUFBaVrSe6cuNfsZbvjB+vvRTpb3aLqqmHC0JAge
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

There are no users left.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/firmware_attributes_class.c | 13 -------------
 drivers/platform/x86/firmware_attributes_class.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 87672c49e86ae3ef5b99aa99be532c1d84805adc..736e96c186d9dc6d945517f090e9af903e93bbf4 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -22,19 +22,6 @@ static __exit void fw_attributes_class_exit(void)
 }
 module_exit(fw_attributes_class_exit);
 
-int fw_attributes_class_get(const struct class **fw_attr_class)
-{
-	*fw_attr_class = &firmware_attributes_class;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(fw_attributes_class_get);
-
-int fw_attributes_class_put(void)
-{
-	return 0;
-}
-EXPORT_SYMBOL_GPL(fw_attributes_class_put);
-
 MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
 MODULE_DESCRIPTION("Firmware attributes class helper module");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index ef6c3764a83497ad7e75b0102154c92ce476e5ae..d27abe54fcf9812a2f0868eec5426bbc8e7eb21c 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -8,7 +8,5 @@
 #include <linux/device/class.h>
 
 extern const struct class firmware_attributes_class;
-int fw_attributes_class_get(const struct class **fw_attr_class);
-int fw_attributes_class_put(void);
 
 #endif /* FW_ATTR_CLASS_H */

-- 
2.47.1

