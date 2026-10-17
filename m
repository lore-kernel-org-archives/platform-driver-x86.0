Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EDE3D3CED;
	Sat, 17 Oct 2026 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792219455; cv=none; b=YQ6Rcl19czIX0lupJVYeJ7IoIXDpKvL9svdjSn2320wFO+Tb6gchNjVYV7gPS+P2rhkUQnha0XTe7oUQTvf6TFVNTizLSMty5angHd2/8HDt0WNmjMD2FqgpmHfD40MwnPehuC71M8Keh0wqedp5KJWXCLcvO0YDYub1PC3tGuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792219455; c=relaxed/simple;
	bh=rma8Oz0sDTa+z7E4ZJ5X+/lJ/W4PQbnMOh3Or7yZLtc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1F21zikmtXqlPbbfECGc3A4/v35hImErVvYCWuAkod0dN+cVeNaSbhxd+pyfkjI43Wluo/TltF7SYV1OAQEeYqnbf4IX4dQsl1xmAR3upeg2Rp8x12ndT1AjKHTvzynnAoJV2EZ0FJvXmn0rzsJvx7Yzve/vZwaLBFlvaqbZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Mb3iNbEq; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Mb3iNbEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=j/
	zY2SjMum/+WsDrHr3sVZNUw+lCMD9PXuDG2PefPh8=; b=Mb3iNbEqoG6V8rNrEc
	qIBeleQJtfnOmUeE9a5b1OdEeckSie03A/8hS0lrWd2n8zd04h3mbUgSxaYCxA2J
	1uOmrKF8ccQUSJIIvRZdRGAPTr4TOQ8TWgCSxs0lb0HrN9XQ3naep/3Wz7QUlgsl
	If+3BrT+y5Q5N80lKarisURCU=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHmCgqGdNqXNdoAQ--.43864S2;
	Sat, 17 Oct 2026 14:43:55 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Herton Ronaldo Krzesinski <herton@canonical.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v3 2/3] platform/x86: topstar-laptop: Check ACPI_COMPANION() against NULL
Date: Sat, 17 Oct 2026 14:43:50 +0800
Message-Id: <20261017064350.3817228-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDHmCgqGdNqXNdoAQ--.43864S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWxGFWrAr4fJr4rJFy3XFb_yoW3KrX_Z3
	W8uFWrXrykGryvkr18Ar4fZryjyr9FqFn7WrnrtasIgw13tF47Xrn0kFyDJF47uasrAFyD
	u39xtryIkryagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiM5d7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wvfGmrTGSsu9AAA3w

Add a requisite ACPI_COMPANION() check against NULL to the
topstar-laptop driver, aligning with the fix applied to
asus-wireless driver.

Assisted-by: claude:deepseek-v4-pro
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/platform/x86/topstar-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index e09d7f8ce45f..f6fafa345f93 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -291,6 +291,9 @@ static int topstar_acpi_probe(struct platform_device *pdev)
 	struct topstar_laptop *topstar;
 	int err;
 
+	if (!device)
+		return -ENODEV;
+
 	dmi_check_system(topstar_dmi_ids);
 
 	topstar = kzalloc_obj(struct topstar_laptop);
-- 
2.34.1

