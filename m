Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0645935B62F
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 02:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611083; cv=none; b=AyNutE9Vl9DKVPzYBTGLKSGMt2uCxLLgS+8TaXZhG5if/Sy0yWtvWAwGWJd5/Wc7yhTFJDPcFXq/Z+sEI9gsix2qe5I5Sf/aVQbzojuI7/SbWER/nHYWmKh7wpW+UKYw8zFeQF0Xgh2w9BNgmWVgjG9++URSBVkltJxLgzD57D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611083; c=relaxed/simple;
	bh=kL0V9uWVCHn13CWMd+a2MT7LirERAyA0fgXS6kI9jOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBk1hElksVWaj5Z1+2i7Hq/Obt16syL4maQkJQZ/bGvpiGvWvHBS8C+0/mexbAUt54J09QHRgCmvLPeQat5/Vn3jxPmNPBiIaVZwyDwQdjPapxCVBHAJjyW5I+6QiykGLooJIBMYWCm98b51WF3ABpzVN5WCi3IWeFNLYghzvTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFmf6929; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFmf6929"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so251179a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 19:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611081; x=1790215881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lpojd/W3C+euL2idjus5d5yWu2M8doBEU4UE38aKYD8=;
        b=IFmf6929nPaJXvC0sq5ko32Mk3AlLZGdBKT3BLHJvRir/l63QRnk778Fn2+apiBpJE
         10WUvEx0oz0FHkQNzhQJ9vjHuReO7zI/2qtxOxNLDokQMNaKASSXhVOBpeW9pU9Q8fIZ
         1xSQ+9g18lW33D8EcYGq5y1KqDgPCBy7kClvI0DlMhKcN8BNZbNTDn2tO4oWdkE8KIxx
         xQNOZmb/8OVMN3z30nbHzxZbbgbUlpMuoCHMGOS7OwiSvETPexi+pFsoer/I2r/V/XzS
         PoDKkkw37J3VlohFk9KZn79ewU0LZy9yNxFG/THiP/BUmtstJMv7Gcvcc+5Lh2cOVz9M
         AXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611081; x=1790215881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lpojd/W3C+euL2idjus5d5yWu2M8doBEU4UE38aKYD8=;
        b=lX8oUmKanJAY99l9JWRvnuVpMNoTCmeRIFh4iA5/l5k2PxY+o+cRtmdAWixgakaK4X
         54V+zgN3Ghq7z1SI5URG7YzfPC9raaYN/tsjmSbJIFK6DHueZt+lKiZQnf8r4KJVjoat
         zYa/GVIVBCSdqS7ySrTOH1WTKkkrh+truJfAR8tMvEa2Iy5M20l6cM4HliW34Zj3oqbl
         XdEv9lcnhF9pNe15oxhtoL6muTMxBCrNAgNMKGGoEtbnvLzNLCQWZtNJePw1akcJitRu
         Rvi0L6yHq50qsmbThKRWpu5JbsScI6KSfMQI+43PdFPaWzmgaqSy6hxcDMfrvwo+WoQe
         ItGw==
X-Gm-Message-State: AFuF++nIGyABO/ONhsilphTjfiHb4B2ElRDSynriO8JZHCVagKNCLn2T
	PWL8TLTL5MtiwZgxZ45Gl8f366Mi5o2OLhVnF4i5WaDlgKngOU2K9smeuQmD11cj+/4=
X-Gm-Gg: AYBFou1EbkNpXGkCI8iS7j74VK1kgCqt6jaFQNLwINhVaS+esyusvoUe55B//QXXTkC
	az73e/M0YTJ4ZqE2xSGLuoqSrW/eoAHn69dfVuvyg7380zuWL+EAtlUKl/9KOygGINQv68IXOjw
	S+KkHylBeyyiJdNZPiMIjQQDjAcUz8gWUMnpFXfRCO+9rPAk/wXWfooG1KudkrTL+FlIrLstOSx
	/v6a7bHEsByclzDhsDKUOgCBh6tECduLJDceiTbiYQR9TmwYaQoLp39tpyg2ksu6l/3QZSEEkn8
	CqaPrc1v4ebOaWdlM/eqgIpU7jCAIaYtvJbVKVV3VxJO0NVYvjCLdPWxGAKlp1/hOPbDL5VxGxS
	Bpiw0iCvJHK4E6ep5iXa3lTcAJn5usV3h2JZSki53MskBZaX19nTin40Uc1NqXITRZCRQSU1wk7
	e6R31+IuaieGBt2CSKM0DSrn7u7J7f6cDqD4/96HXBm5FHKV00TJPCpf8SbDS8KnDkcogaaMWQ6
	3hvGKimluxxwJrV/6eXrTVZWq9Mp0OqzUE=
X-Received: by 2002:a17:90b:4c49:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39e1df6e4edmr13253854a91.0.1789611081052;
        Wed, 16 Sep 2026 19:11:21 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36096735sm2341821a91.12.2026.09.16.19.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:11:20 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	bryan.odonoghue@linaro.org,
	W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chipang_kao <chipang_kao@asus.com>
Subject: [PATCH 1/2] platform/wmi: Remove X86 dependency for ACPI_WMI
Date: Thu, 17 Sep 2026 10:10:54 +0800
Message-ID: <20260917021055.8029-2-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917021055.8029-1-chipang_kao@asus.com>
References: <20260917021055.8029-1-chipang_kao@asus.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'X86' dependency from CONFIG_ACPI_WMI so that the WMI core
subsystem can be built and used on ARM64 systems with ACPI enabled.

Signed-off-by: chipang_kao <chipang_kao@asus.com>
---
 drivers/platform/wmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/wmi/Kconfig b/drivers/platform/wmi/Kconfig
index d62f51ff3b7f..36934b5f0194 100644
--- a/drivers/platform/wmi/Kconfig
+++ b/drivers/platform/wmi/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig ACPI_WMI
 	tristate "ACPI-WMI support"
-	depends on ACPI && X86
+	depends on ACPI
 	select NLS
 	help
 	  This option enables support for the ACPI-WMI driver core.
-- 
2.43.0

