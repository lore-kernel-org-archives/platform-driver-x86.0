Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF753264DD;
	Mon, 13 Jul 2026 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955705; cv=none; b=ED+PC5J7Z9D/A0GfoKPpD3yKzLTie8IrC0/j9Zj1425uAM/p+iRq6eoy0Vu6ZU6zPRa3eWtmn/0vmpCo/NfA90cKLdaVxPDwWzlirMpnRVe2DGUpW6EvOHaQ5xvDd+gpgaYEuqxd3BJ/YIKKYetDRo2YL25nQwRngdzAk8xgsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955705; c=relaxed/simple;
	bh=rma8Oz0sDTa+z7E4ZJ5X+/lJ/W4PQbnMOh3Or7yZLtc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ka9tyr+UIBf5lRo0ynrPpfuVU8SDzQ87G9NSCQ6ggmyFmOrjLbVUcZrZ8zTYp8seucP+lrR60MaMMgoUPCY2QzpVH8U1vvTRIkEa8FgyKc7+ahTmfDJywiS79AEtK72dAEhqG5JKe7zfNkkUlyudPIU6+2utUw2PsfD1WNqW6AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=f9T1se5i; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="f9T1se5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=j/
	zY2SjMum/+WsDrHr3sVZNUw+lCMD9PXuDG2PefPh8=; b=f9T1se5i/SD9yFqxh/
	7UYoH8DHYnEcjKExPQbh/oPtQkcE9HwTn9V9a0eFdtv8Y4MttmzvdNs9/5/L8bb9
	b4iz0kegJlpHhFHOJm74ynokzvrO/Qh17EWvkZicgivcrX/Dz3BDIPu2CWjwTfb7
	QXRj7e7P1i4yqktJRJbUWJHeI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHMPbQAFVqBx3nIA--.6087S3;
	Mon, 13 Jul 2026 23:14:27 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: platform-driver-x86@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	Herton Ronaldo Krzesinski <herton@canonical.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] platform/x86: topstar-laptop: Check ACPI_COMPANION() against NULL
Date: Mon, 13 Jul 2026 23:14:20 +0800
Message-Id: <20260713151422.82947-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713151422.82947-1-yaojiale02@163.com>
References: <20260713151422.82947-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHMPbQAFVqBx3nIA--.6087S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWxGFWrAr4fJr4rJFy3XFb_yoW3KrX_Z3
	W8uFWrXrykGryvkr18Ar4fZryjyr9FqFn7WrnrtasIgw13tF47Xrn0kFyDJF47uasrAFyD
	u39xtryIkryagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt89NUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRMkXmpVANOv6QAA3O

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

