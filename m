Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D836A35E;
	Mon, 13 Jul 2026 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955720; cv=none; b=u/txpU971JhlFSQnd0m0BTCcK9WR/Cwe9khNzLemwYxIRn4Pgg4+ldTo5HelgvrzzaTD9GJ4y0hDXiBB3wuwbGFFrnKrjwNXkctorKqHshy4Hf1B649FoCp+Ha8A/PjpQVmeXS5bchSeUfHWBKXasBh2gvifP93FxKljs2UvEo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955720; c=relaxed/simple;
	bh=5ZVtA5BIF6KZ6qq+EvV9p8Kq7Gmn0MvZ2Tkwi7N3jKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tpg2tkiP6FyUXIUDwWHr6QK3ZDbE/8jvnLkGKOzkJO0Nex/cFntXn6P5ZwRUgFvjMWIVIBLYzkGAxV/MfHinMcS0Lv8aRYKEtLD3NInLvXKLnEcvdxtY12QZt2CxLgHatVRjV6NdZ3r479exnQpMu9BSXHkgjcqFLvAauis72EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G5233K9a; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G5233K9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=g5
	msa0imjEsFza06DSlxacvumUAvicFGlS1u3u+QcKI=; b=G5233K9aYcDR+GDsPH
	QS1A+sVlNjdJyI+spNwCstKTngCY5Cibs49jpHyi3gpOZtWkMSS0TapmGpHPTYzG
	jJj+xq0RFlU2ovbFMD2GWLvy/2KdFu/Thfn3snysbQtbzOMgG92u4RqHvBsc6pxN
	eF8mspcp3bcDkUib+Aaeb1M+w=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHMPbQAFVqBx3nIA--.6087S2;
	Mon, 13 Jul 2026 23:14:25 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: platform-driver-x86@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] platform/x86: asus-wireless: Check ACPI_COMPANION() against NULL
Date: Mon, 13 Jul 2026 23:14:19 +0800
Message-Id: <20260713151422.82947-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHMPbQAFVqBx3nIA--.6087S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW7AF45ZF1fGrWrGFy3Jwb_yoWDZFb_Ca
	18uFWkG348Kr4vvr1FyF4SvrWI9r9aqrs5XrsxtF1Svryruw47XrZIvr9rJ347u3y0yF1D
	W39rtrWF9343ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUnqXDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BIkXmpVANJmYAAA3z

Every platform driver can be forced to match a device that doesn't match
its list of device IDs because of device_match_driver_override(), so
platform drivers that rely on the existence of a device's ACPI companion
object need to verify its presence.

Accordingly, add a requisite ACPI_COMPANION() check against NULL to the
asus-wireless driver.

Assisted-by: claude:deepseek-v4-pro
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/platform/x86/asus-wireless.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index 2b494bf3cba8..54052bda9061 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -132,6 +132,9 @@ static int asus_wireless_probe(struct platform_device *pdev)
 	const struct acpi_device_id *id;
 	int err;
 
+	if (!adev)
+		return -ENODEV;
+
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-- 
2.34.1

