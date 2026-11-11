Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371913;
	b=aLOYaQUJRRCYY1JPn2AjDK0iCWKHMjKkBQAg6Ez5B32bsEcrEZAwmCsu9w6/xzB/DHi9
	 hGI7isgpG3fcJMD9XNemVDh2J1co2vkqN6b5yoZ+jVKaeF9ITPL7snVGuoKWFvUB+DxM5
	 xE4BZn71Bj0aG8FRuVZiWj3h1BQh1lCF3rz3BAngksl6dZwc9TV8WbF8fMp1mkq+OjGYT
	 dAS2mRUbpRV1z74i9TdxHc6+KFBDEzA3m1dYUeg9yXdX9YtFR9AkTgE70oapJVCOeEtox
	 TXMqWe1YgbOzCk7++WSrLaOFWRgPs6+gAoCeR2Jh538m7GPCr5+Gy9zfxlaERUgtfow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371913;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8fRv/jrTdWY76QICf0NPNF8q1S43YPpzmnfQf9/0gcE=;
	b=Qtf2A5Zv5Va5+GlDk237MLA2kJLfdv0te0byyHMmMtWu9rT1pWWAS86/UGDMEqtSwQQ5
	 PMseyDhJbLMJywHCKkneThGgLpb0ia+vLoAyRuyQ8mmHYCVNVI/Ok1oYCpvIo1ENTz7p0
	 naIr7Uvjiis+jR8MNSvUeJ2o9CUlnsoiXo6qXftA/Zs30t23CZ4dRLYiPRkU+hmecFbXs
	 j3/syPtutth772wwXie9NjKXFh2Qrm6bMYfiAJYPxAWRrsSD31m0hUjjG7l/beg7vopGd
	 4EJSe4GgX4v0DbFDBIF+pN1P4Nnj/l5XW+r2w7KRNlfhBr765cZIQzAKHHivpZazlwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=awinic.com;
	spf=pass smtp.mailfrom=awinic.com;
	dkim=pass header.d=awinic.com header.i=@awinic.com header.a=rsa-sha256 header.s=default header.b=eDIlu5Tf;
	arc=none smtp.remote-ip=115.124.28.97
Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com [115.124.28.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7CF606A31C;
	Wed, 11 Nov 2026 04:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=awinic.com header.i=@awinic.com header.a=rsa-sha256 header.s=default header.b=eDIlu5Tf
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=awinic.com; s=default;
	t=1794371902; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=8fRv/jrTdWY76QICf0NPNF8q1S43YPpzmnfQf9/0gcE=;
	b=eDIlu5Tf+COeS2GoQpnjG4J0B1HgXdF3AEDkuCOO54cQ5enGev1vFrN5IK9xRlLWBPFpGJ9nAm2Qz+nlYr6Wf7QDRMIGW0uVMK5eZa3UH99Mk2TMfA2NliJP36QJSUUW0Sh4uoAI3H4VZ9o6uCm1A5YD0UWxnFAYZARn0aBP5I0P2S3TipZzRYzjKztQRmNfI6bisBuqmTF+JtrsU/FA+n+fkImn//8/nK7bDPOB4gE46wdphyzobTTpdx1E98S4u2kjiR9xFu40wC/Ksi2rQd6RMXGOfO5YO9Y14vQ4pDFx3PyUDs8HoMbKJ5mNpEBN5JWN6joY+HQBTUsqJ/jMuw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1624513|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00234802-3.15815e-05-0.99762;FP=2858016219476978982|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034020;MF=guanlan@awinic.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.k.PQ8R4_1794371881;
Received: from ChromeBook..(mailfrom:guanlan@awinic.com fp:SMTPD_---.k.PQ8R4_1794371881 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 12:38:21 +0800
From: guanlan@awinic.com
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org (open list:ACPI SERIAL MULTI INSTANTIATE DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Tao Xiao <guanlan@awinic.com>
Subject: [PATCH] platform/x86: serial-multi-instantiate: Do not request IRQ for AW88399
Date: Wed, 11 Nov 2026 12:37:58 +0800
Message-Id: <20261111043759.306458-1-guanlan@awinic.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Xiao <guanlan@awinic.com>

Set the IRQ resource type to IRQ_RESOURCE_NONE for both instances so
the device instantiates regardless of the ACPI interrupt description.

Signed-off-by: Tao Xiao <guanlan@awinic.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index ffec4f0a4992..f69ad3815c8c 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -309,8 +309,8 @@ static void smi_remove(struct platform_device *pdev)
 
 static const struct smi_node aw88399_hda = {
 	.instances = {
-		{ "aw88399-hda", IRQ_RESOURCE_AUTO, 0 },
-		{ "aw88399-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "aw88399-hda", IRQ_RESOURCE_NONE, 0 },
+		{ "aw88399-hda", IRQ_RESOURCE_NONE, 0 },
 		{}
 	},
 	.bus_type = SMI_AUTO_DETECT,

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.34.1

