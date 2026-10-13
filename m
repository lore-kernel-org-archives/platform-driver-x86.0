Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [51.250.60.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABF549378;
	Tue, 13 Oct 2026 21:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.60.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926575; cv=none; b=hAT0WLmIBNmET+i74Mw0ycnM7iwr9J9pLtOUrG/2kABsmg486uNpIHDQNcRSbphMD9xA+3ALATNs2cnG0a0v60DNvvAOuhx/DUFP7+N0v6vpHrswx5y69DGa/YiTpwe6HJQUtrmtokd+MrHHlL5gc7Nf7d5xaAnw9ffmjwazSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926575; c=relaxed/simple;
	bh=5xtSkDqj4IfU8/QNPAcFk2pbH//URijfWwDYonVXG1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=efKUZQZCfbZc21JmuA0X39LntF1HNFRRg745ByMQfKO3BGuHLBAuIZLZ3cETouIBUiWS7pDW+O5NU2rn/zmHFrS9tZqxEKvy7PHo1O0z6gfXL5N/01Z3xWnAcFjZsU3CMf27OZ0+GAIHoORQbrFPMVlAIPqH+siFYtuannXWsgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=qv3ixbI3; arc=none smtp.client-ip=51.250.60.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="qv3ixbI3"
Received: from mail-nwsmtp-smtp-production-main-54.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:6543:0:640:e955:0])
	by forward102d.mail.yandex.net (postfix) with ESMTPS id C0E6EC00DF;
	Wed, 14 Oct 2026 00:22:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.klg.yp-c.yandex.net (smtp) with ESMTPSA id WMbJYuQtEiE0-LJQ9bWy9;
	Wed, 14 Oct 2026 00:22:35 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1791926555; bh=sfcmlTR7eCaZWBe1bemIwHZsXa+eE1kUcQCqsEwQKoo=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=qv3ixbI323v+9WoWM368bCJDxuKX0G04owwwcssqkg2wCWWgcYYP96nMM4BXt1UWw
	 f5zswabM3Iotg6l9DBb13XAAxoU9swmcbvLUdvFvp3zxpVzIXwwL2k4JfnraxtaA2F
	 /Vf7QA01cayczb9s6LaRggLfCQaSEcE/6Gw0zAsM=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Alexey Subbota <subbota-job@yandex.ru>
To: platform-driver-x86@vger.kernel.org
Cc: teackot@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Alexey Subbota <subbota-job@yandex.ru>
Subject: [PATCH] platform/x86: msi-ec: Add MSI Creator Z16 A11UE EC firmware
Date: Wed, 14 Oct 2026 02:22:28 +0500
Message-ID: <20261013212228.17349-1-subbota-job@yandex.ru>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EC firmware version 1571EMS1.106 (MSI Creator Z16 A11UE) to the
list of firmwares handled by CONF14. The EC register layout matches
CONF14 field for field (verified against the out-of-tree msi-ec
configuration for this firmware, where it is part of CONF_G2_10).

Tested on a Creator Z16 A11UE with this driver built against
7.2.9: the module loads, charge_control_start_threshold and
charge_control_end_threshold read the values set by the EC, and
writing charge_control_end_threshold is applied and reads back.

Assisted-by: LLM
Signed-off-by: Alexey Subbota <subbota-job@yandex.ru>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 86d488047..5247c25fc 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -1134,6 +1134,7 @@ static struct msi_ec_conf CONF13 __initdata = {
 };
 
 static const char * const ALLOWED_FW_14[] __initconst = {
+	"1571EMS1.106", // Creator Z16 A11UE
 	"1824EMS1.108", // Raider 18 HX AI A2XWJG (MS-1824)
 	"182LIMS1.108", // Vector A18 HX A9WHG
 	"182LIMS1.111", // MSI Raider A18 HX A9WJG / Vector A18 HX A9WHG
-- 
2.56.0

