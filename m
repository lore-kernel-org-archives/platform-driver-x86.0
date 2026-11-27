Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744232;
	b=KpUNZ+RdJCTuH1U6/93k4nbq2CMsbu/eIuNlY7P0RZMfgkiOQpJhJF9Q5xlu6Ia0/8RW
	 5mBtvTtrXtfy9Dx4atXR6mxwZ0wIJIXevPXV8LsUBYWJhwmg/bNwFGF0G6A9aJ90+1it2
	 7msQWWiQR4HQxDYkONt7Q/wZHob9WqfIS2VOC0iDzSBlhb7cqZ0VphJiuqIxai40l9UDn
	 kgDyd3+06+UerEVFP0U20+JfzBfBSGjChl4kPieuLb1QCXww4+vGkGh1FmyP/8nYEc9mm
	 0ZFijN2ol1qj2KFxGQMXD7AFy5rjky8dSEnm22h8KC4CohAFzZAxireJpAWbY5VVbOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744232;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1eLgDqKy012q83IXxmUxT+2H0cryE4EVrABGEzNW6Nk=;
	b=r5yI2LPdng8Eb3jqPnZ7kvA6UaQIioD/TZKeW78K5LsigEV249jAtEVjrlusxu3Vz0yz
	 u+3AKcQziNNf98CmrlbJghrn1hEnSMJRVJd0iVz0J2Cc20hdQlrw+qqOrFpI22dgd8tfN
	 F5cBe2iwtPVfkOEWDZLeDdDgbgadAAEudqbc1C0iffzslRb8b5Qb+WHMznTTZf21oIsJz
	 qG+hK6ATJzYgk8CATRaK+IN/Y/2U/5evoKNTIPKg8l+pL8WvFQgLoBfDV5uVfT3589Rz3
	 EL1ba8MSSeqBRmnwsSzqW2+Pe6LXnZImGLcKhBJ2QK1aP0Kz52bS0brHzDKw+qXLaZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032C606A31C;
	Fri, 27 Nov 2026 01:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1032C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e978f336ea0411f19a56ed5b684f684d-20261127
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:37d20a09-9329-4a9e-9333-f89fc3346a67,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:2e13bd314434d82c3f9410c3b43ca716,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e978f336ea0411f19a56ed5b684f684d-20261127
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 945076273; Fri, 27 Nov 2026 09:50:24 +0800
From: Tom Hu <huxiaoying@kylinos.cn>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	xiaoying_hu@126.com
Subject: [PATCH v4 1/2] platform/x86: thinkpad_acpi: Update charge_stop only after it was applied
Date: Fri, 27 Nov 2026 09:50:17 +0800
Message-Id: <20261127015018.81906-1-huxiaoying@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
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

From: huxiaoying <huxiaoying@kylinos.cn>

The charge_stop_threshold store writes the new value into the cached
battery_info before the EC has accepted it.  If the ACPI call fails,
the cache and the hardware disagree, and subsequent charge_start
writes are validated against the stale-not-applied value.

Move the cache update after a successful EC write and report -ENODEV
on failure, matching the charge_start path.

Reviewed-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..8fc5569131f6 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -9847,16 +9847,15 @@ static ssize_t tpacpi_battery_store(int what,
 			return -EINVAL;
 		if (value < battery_info.batteries[battery].charge_start)
 			return -EINVAL;
-		battery_info.batteries[battery].charge_stop = value;
 		/*
 		 * When 100 is passed to stop, we need to flip
 		 * it to 0 as that the EC understands that as
 		 * "Default", which will charge to 100%
 		 */
-		if (value == 100)
-			value = 0;
-		if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
-			return -EINVAL;
+		if (tpacpi_battery_set(THRESHOLD_STOP, battery,
+				       value == 100 ? 0 : value))
+			return -ENODEV;
+		battery_info.batteries[battery].charge_stop = value;
 		return count;
 	default:
 		pr_crit("Wrong parameter: %d", what);
-- 
2.34.1

