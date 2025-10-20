Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D1334C03
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760995090; cv=none; b=nTFLoMxCy1alTKejV/9sMZ25z3dolReRmr5b62XFepAsAjw+95Lqegu5UsapghYC9i/JjLF/GGDsBeK5ISTrV88AboT26CcXuKuxHuhgy0Omp8rFv3C90/+RSOywS/RgHdoURJxWPR/iEgGfxCAHrmdnRTvfvjITwSPmfSZ895M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760995090; c=relaxed/simple;
	bh=HgqVTv99Oe1TMTKtq8WDEVdlbo40uTW7mB5QSTqT1mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TP334QRj7bA4nZKsP5cG2bNdmPbbE2EkFLg919emAuEfTYQ4UXG5ONd0fgbpWVS8n2I7IiHNhyEBr56DLVgL8HvnSKmq9Jt99KjGcx7kSr1y0qiIrD9UAzuP77yyXCmwo3x0YA2nkPhOb57KJU9A1v4Ou8a7UuIDGKUPHjOUqt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXc5Q6Ed; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXc5Q6Ed"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4283be7df63so1314193f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 14:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760995086; x=1761599886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Boo3GY/hmsGMPee3Iyy6fPXSxK2W3/FelglgywD3Yfs=;
        b=FXc5Q6EdohA1biaT+5LrlPrnnkJ7j2NqnHEtskPqm3dpe2NthcxO7/NvAWCo4rkXPp
         ckQi/KigG69dFLMtlw7OcZDHlnZua/SooPUwwsxgkVplYAFOoH2+btS0c5fHBO+/a/iF
         qv0XQIxftQ7bv2G4Qdjw3oor8h/b76C/XMghqzPhRQAUphTUVeOrzQqjdwqdz+t8k7A6
         +Epo4D3NqE24Ya2xBhwuR7SoV71h6CGdJGLp8rh9hNj68y3sa00glXWVXaJotEV39tyV
         T1T4MqoSOPUG9AIzN9eP+C2Ryq0e+wNIYHXaQ4R35uF9nInYMXxQS5Yav+BgfzzPQrVY
         7Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995086; x=1761599886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Boo3GY/hmsGMPee3Iyy6fPXSxK2W3/FelglgywD3Yfs=;
        b=Cs2fLf9EF6zg24hTIxAvapwmQ6wRvE/ML34RTdq0a4KKcZrOIBn8G+qEwpx1KVdplz
         9uLSzH3/G54iC+HkkSxY5kuxXWCiTR9/nY0txXWY8iQ3D+fW76qdiq4XAlvkE1Ju5iP1
         uLotzcNvDGIUXE1vmWBOqQM+yJGrVqmgHC/Gmr2VyhMnB+ZB6ygMcJXQX2Mb6PyW5l9k
         9Iva7seKkSlRSlqXd1wQ9jDDRLE/ki1hTqjrrZ7xMw28k7rjmGH0Vs91dKHCLllRM+j/
         osgjwo7Q2PubX5TQJQua1W33/JmUrIl3JPC9h33C4/BUq62Q8MBPCII7UzY11IWiZ4SN
         rOow==
X-Gm-Message-State: AOJu0YwcjJVGiPaACKMIQrupfmtCO+amM/XrPLNfTC2clbfE5JHczkX/
	S+j/cYFCMDqP4ckruBNc1XLPteVQ5A80yOvFSQ++X4TPwNyzjU2bmB9H
X-Gm-Gg: ASbGncuILCbly6Uz1IiZ+baj/ApVtrYCVchCqEK8Uj3o4yWFgLd0OWJp8tEn//OSv4g
	ddr6WtJjelNZRSE2Bi0Y8mtRQ8cX999MjUzEdwWi+4Rp5bK+fDGIHsEz7ucM17hqUJQHeob4oO3
	wTJkRlp/RrCLzX9KjVXr37ArMynFrwg9K0qxomvMTLvHkQXFABe8SAwMzGu+Y094OQ2917/JRKm
	vv/uyU+DWRS1bDy1tn/MIL2lWo8K7VGl5aWh6SLL3ahZMArRCBOs1mLVybgS4s68+sEDXUONC0O
	qAV7WmOnZd97t/Ua47jzrZIMyBGpZH3qvs3T/Ye7iGulB2pMng8fQGzZi2Ph+w6xK+/6agqKf19
	cGv+JUWpxfEVw0P7Tqo+CTwC09jig/mqoojg0CTq2G79Qn2R2KlcPcDaqgbwh5YH2JYysurWd3l
	DoFYEFm6oFjBVZ
X-Google-Smtp-Source: AGHT+IEj9obIyMvZHzNlNwHynowf/HXSKQgHqY2Pu2eK/wmlzn9FsqhlARXp/9iF+oKGbDrD7VKywQ==
X-Received: by 2002:a05:6000:186e:b0:3e0:c28a:abbb with SMTP id ffacd0b85a97d-42704d51e46mr10469556f8f.13.1760995086173;
        Mon, 20 Oct 2025 14:18:06 -0700 (PDT)
Received: from denis-pc ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm17254971f8f.32.2025.10.20.14.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 14:18:05 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v15 8/9] platform/x86: asus-wmi: rename ASUS_WMI_DEVID_PPT_FPPT
Date: Mon, 20 Oct 2025 23:17:39 +0200
Message-ID: <20251020211740.719676-9-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251020211740.719676-1-benato.denis96@gmail.com>
References: <20251020211740.719676-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maintain power-related WMI macros naming consistency:
rename ASUS_WMI_DEVID_PPT_FPPT to ASUS_WMI_DEVID_PPT_PL3_FPPT.

Link: https://lore.kernel.org/all/cad7b458-5a7a-4975-94a1-d0c74f6f3de5@oracle.com/

Suggested-by: ALOK TIWARI <alok.a.tiwari@oracle.com>
Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 4 ++--
 include/linux/platform_data/x86/asus-wmi.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6de633d4a748..64cfc0bf98dd 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1218,7 +1218,7 @@ static ssize_t ppt_fppt_store(struct device *dev,
 	if (value < PPT_TOTAL_MIN || value > PPT_TOTAL_MAX)
 		return -EINVAL;
 
-	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_FPPT, value, &result);
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_PL3_FPPT, value, &result);
 	if (err) {
 		pr_warn("Failed to set ppt_fppt: %d\n", err);
 		return err;
@@ -4602,7 +4602,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 	else if (attr == &dev_attr_ppt_pl1_spl.attr)
 		devid = ASUS_WMI_DEVID_PPT_PL1_SPL;
 	else if (attr == &dev_attr_ppt_fppt.attr)
-		devid = ASUS_WMI_DEVID_PPT_FPPT;
+		devid = ASUS_WMI_DEVID_PPT_PL3_FPPT;
 	else if (attr == &dev_attr_ppt_apu_sppt.attr)
 		devid = ASUS_WMI_DEVID_PPT_APU_SPPT;
 	else if (attr == &dev_attr_ppt_platform_sppt.attr)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 260796fee301..3d236f8498d8 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -108,7 +108,7 @@
 #define ASUS_WMI_DEVID_PPT_PL1_SPL		0x001200A3
 #define ASUS_WMI_DEVID_PPT_APU_SPPT		0x001200B0
 #define ASUS_WMI_DEVID_PPT_PLAT_SPPT	0x001200B1
-#define ASUS_WMI_DEVID_PPT_FPPT			0x001200C1
+#define ASUS_WMI_DEVID_PPT_PL3_FPPT		0x001200C1
 #define ASUS_WMI_DEVID_NV_DYN_BOOST		0x001200C0
 #define ASUS_WMI_DEVID_NV_THERM_TARGET	0x001200C2
 
-- 
2.51.1

