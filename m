Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB062EEE85
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044134; cv=none; b=YK2MoPZPe8SZyfVC3XVlwN4X+qlZFar4FQX1qM7yHOZbClGXOLNBoG83OHokoDxhrYCQ2KPJozKSZ57tQfXVPqUXrJ6HxQvDL5vyI5nhRXqV2pnVgTnmT/fteQCaoAYVQW1U9AKVtoyxo+yO4QFauVMdDYtpOG9Pr1a64wAIFHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044134; c=relaxed/simple;
	bh=2OkW5wTKb25QYogvHb9s7HUCWEqAoAyp7yl5+VMW5/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DrC3WPQXNegV/1vTIBkwkTbiSnCTFEySkaVOhdspWEMxHMwlMlfo6UzOsPI5Tt66pvm8WGTj3l+f17nvRPDlJRSCLVys+uHZiPkzv6fVCgFosA6sIp4Shez1KAz7J/LTrL3ILNdI1KE0ETqTK1VpaK1QF4Wqv1ZcnG+QQw8QQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiFgYyIH; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiFgYyIH"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381b831d535so6026763a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 02:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787044132; x=1787648932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbkTsHaVycFygK/fix6way5mf3dlBh8lejmOS1ddEu4=;
        b=SiFgYyIH5kRULOz3ceNF6Obht8y3V/60S4eECxskeVkPkra+dxaUMhnVxsDiwxXtjN
         68DLY/ykmQ4Av5/jZXcCssiIcMluo7iBEXDPuKYbtlaBUgbuvj9/HFGRIy2PaKxe+igA
         wXQ3EOz2zLfHZUhrVL0L/EeDr7LRDDyiJUob8a16RcgGFacY+2r4rcAhjOOOavbxB7mj
         IVm9bhrC+tcCyOwRTLEiWPu2uLRZwapu2TZVJPxUR8Hn7baS2vfuIiKvNiiapojLt0c1
         b390H8CC6tKktiWsGIfH2geENk7gkxGijHmyHDPhQEI9uO2ZP0eUwBW7xe117tv+Iu3t
         UXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044132; x=1787648932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbkTsHaVycFygK/fix6way5mf3dlBh8lejmOS1ddEu4=;
        b=nAFu223kS2hzPCA1/pGgHJDSu3boJOGZzkhof1CIt2eWZO+DCRvf+tuF52IRgwXyn8
         LcL1w0cgmqHBxemj2B4l1vUgLw5SXAoY/4JKqdBnRTzLPyCsEjpIMytePsKO4ZXrIdxT
         5yXqBh846D7CQkbhchwVTmHWJIa1D+fUFKRWxFnwiwCYM3gWM+1m205VAy7dtxE/cI5F
         oUywEO59op/Kw0o1bD57Xjvk7fPYhIo344BySRKAJxwPho9qMJymNMM2TNB2sfTO7DFD
         6/OIPRpVlL3clHz9zntTuAg1rfgga3ANyqCcoDiPZHykX9g21dIeqci1boLZUcTTg9ae
         sf2A==
X-Gm-Message-State: AOJu0Ywexq1fL9F5a9DlrCYD+/XWTlinc5hh2g0n1/8UlvuQHmJIR4sA
	ywtGv2CyxNnsI+NuK7QiTHKRjVmOCOqwC7ccFgc46fRpwCaYuGAWeClJ
X-Gm-Gg: AR+sD13Ot5dyXXnZ62Rf32GTEd8SJD+pGZZ4tnPxPZxUxx7OasYEyIVmnRUwB4qnkPr
	JtvZqNAhexjSr5le2M00rh4dcaoCGzwTUVzHEEsUyDv8uzJce+RGlCzNrNMeL+86DE/RE+Zmn+r
	irRaJc9YDLdSNIxc3bG6Dl7gGxXcd3jgLoiJZqCicNYshLv9yyh2CQbC59HlyMNIId9w08W1deo
	SMI9KTfKCHG39OwV2Lwiz5jQDP1/OdHGmZgEvm8ja9R1D2h4v7UejXF4rl1eOwSNkF0DiknR1nb
	A50Jv8DY5CvT4v+rqpntxFwW2T+5Vo61SiIm4wJIEwGCzb4niX7rBsWxzvLzH2HgCZRSkW4rI+n
	oECGlpb1sZYFT12AmJD0wZSKh+HUSnlw0zKGLAc5l/VMng4I/zhP6SMnNqLQ+HYm4uTVtVrGYCX
	zSxEN98s+FDVGgzlygFEq5G+BzAX1KIfkY0RM68KBlIZN4WGp4DJJKGEuIEYK2ObChx8y3BZwYE
	37xcOEGu2kDoQ8GOjqT468dW5e0fsg=
X-Received: by 2002:a17:90b:2b8e:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-3933b8aa611mr35115578a91.15.1787044132411;
        Tue, 18 Aug 2026 02:08:52 -0700 (PDT)
Received: from archlinux ([117.242.38.60])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14153186ad5sm24017293c88.14.2026.08.18.02.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:08:51 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D88 thermal profile support
Date: Tue, 18 Aug 2026 14:38:28 +0530
Message-ID: <20260818090828.27049-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN 16 (board ID: 8D88) supports the existing
OMEN thermal profile handling.

Add the DMI board name to hp_wmi_feature_boards[] so that
the existing thermal profile support is enabled for this board.

This enables the existing fan control and platform profile
handling for 8D88.

The board has been reported as working with this configuration
in OmenCtl.

Link: https://github.com/yunusemreyl/OmenCtl/commit/e3cde3842bb2ffbd697592dc08a6043dc7cccfd0

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5551f8134cdb..b2773fc1aca4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -331,6 +331,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D88") },
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DD6") },
 		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
-- 
2.55.0

