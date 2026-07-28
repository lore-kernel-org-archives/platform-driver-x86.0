Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7927242048D;
	Tue, 28 Jul 2026 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237580; cv=none; b=sGdabvvI8d5f8S1vFGGG0U37PNC0+8Tq6KhxoDZYJOUp3sGp4RDztQWBZESFhK7h0qJRxfGybTVN7s4F80dEuOiSd298d8g3q/vzcP5qKjeAtHsta+Cn97jgiwLDPbEymZh2yBh7e4vOepCDWEZIpElfmjQToVtaVXNqUoIYtek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237580; c=relaxed/simple;
	bh=1rl+rPWrB9JxbN5BiPrip0iP17tOuUQp9OoefOn71Y0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AmIzOZIz00OzbZkYzpEgZJhGNgiMVqnaun3GzM/+U4AhmVWRYtBaKKKJR3o9Q/HQ/w+2zvdbVnj7/HuSybYEv+gImevX3r8pgtuTs7gXRwSHIVL8G8Y0iHZshPr1voYSCJia7BvIquvQJ6ESzCXRGHz+0T7bl2PrRMbTlVIXxjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 32cb27be8a7611f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c437c1e4-2e7c-403e-a7e5-b4eed64c81fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:6be77040d0c0bcf55b8540838e9579ea,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 32cb27be8a7611f1aa26b74ffac11d73-20260728
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1363906045; Tue, 28 Jul 2026 19:19:28 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] platform: arm64: qcom-hamoa-ec: reject incomplete responses
Date: Tue, 28 Jul 2026 19:19:24 +0800
Message-Id: <20260728111924.4106898-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_ec_read() accepts short positive transfers, while both callers
unconditionally consume every field in their fixed-size response. A short
transfer can therefore make them use trailing stack bytes that were not
returned by the device.

The first response byte contains the number of payload bytes, excluding
the byte count itself. A complete response of resp_len bytes must
therefore report resp_len - 1 payload bytes. The existing check only
rejects counts that do not fit in the response buffer and still accepts
an incomplete payload.

Require both the SMBus transfer length and the EC-provided payload count
to match the expected response size.

Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
The resp_len - 1 requirement is based solely on the response layouts
documented in this driver. The EC specification and hardware were not
available, so please confirm it for supported firmware revisions.

Compile-tested with CONFIG_EC_QCOM_HAMOA=m.

 drivers/platform/arm64/qcom-hamoa-ec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 5ca7308c6077..4d2ad042a7f8 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -92,8 +92,10 @@ static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
 		return ret;
 	else if (ret == 0 || ret == 0xff)
 		return -EOPNOTSUPP;
+	else if (ret != resp_len)
+		return -EIO;
 
-	if (resp[0] >= resp_len)
+	if (resp[0] != resp_len - 1)
 		return -EINVAL;
 
 	return 0;

base-commit: c5e32e86ca02b003f86e095d379b38148999293d
-- 
2.25.1

