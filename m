Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1818233937;
	Sun, 12 Jul 2026 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783869516; cv=none; b=J1aJfnbpOS16bcxXi5rxcHBONyLUTmt+8r6p40+j709gStGsMNTjUD1gaqFW8oTx0/Fr6FW8kY94a2VACxp4GtEPEpQJqPXeIXXCtBY049DZJIAvLpCOsYsS2lr8hDwLlJs3f9PvmCP5o8juo2WY9LBti2xK1sgwd3eBBORGV/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783869516; c=relaxed/simple;
	bh=TrLPjyx0P82hElmbyOdwYMOmMNg3TsnSOFl50cUqHrg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W4pBuh+8vl6pHbcDzYZFAoB7o2YEW13liPiqoyxeOSAY4o4rOKiTMgVrzbfO/Ru6R0MJmsEiS2gtFDUdPs/ZIAxHRpprx87jNU9ikIy0tvDk2zW5HL1XvZETy5fc77P9lNJzjRpA6D6WI7C1quffS4TJ82K8HKid3UfP4hjM1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZNEbikHc; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZNEbikHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=6P
	9agQUOmgaDA7ucEOM23oKplUFh9bx+LYF/o8J0hwA=; b=ZNEbikHcUECWfnE3Y2
	/BhLaXdT/BoseQXF3X8vO1HEqukjKus2l2yh5bnBlsdVHJi3D7QdlrqpchEcbvYB
	dUFrcGyaO2JlTAGrMTCd6+LAMYL19fmNXw2dgKhc6WZpMB2mMWl0sAKH6NgHUOvr
	IzjF+kZXihBLFkGWwEf0PBaAg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3f4MZsFNqAypxJA--.21483S2;
	Sun, 12 Jul 2026 23:17:46 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	jprvita@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] platform/x86: asus-wireless:  Check ACPI_COMPANION() against NULL
Date: Sun, 12 Jul 2026 23:17:43 +0800
Message-Id: <20260712151743.3314169-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f4MZsFNqAypxJA--.21483S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW7AF45ZrW5XFWxAFWrKrg_yoWDWrb_Ca
	18uFWkG348Gr4vvr1Fyr4SvrWI9r9aqrn5XrsxtF1Svryruw47XrZIkryDJw47u3y0yF1D
	W39rtrWF9343ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUb18DUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Bqh22pTsBpingAA3-

Every platform driver can be forced to match a device that doesn't match
its list of device IDs because of device_match_driver_override(), so
platform drivers that rely on the existence of a device's ACPI companion
object need to verify its presence.

Accordingly, add a requisite ACPI_COMPANION() check against NULL to the
asus-wireless driver.

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

