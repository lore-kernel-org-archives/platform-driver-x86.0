Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611187;
	b=iyjAHkzaALcrjoGBXdBAzV8Nt03BDQE60gY3Q48U5H+9+LCy5vEA2FJZsM23N9XSS0XB
	 +MxL6Af53gS5WtvMkklXHpe0GdvL1w1hcnI/NtC+dgf6iZPbbM69YYatikKVELBUeZS1t
	 Kjk0+HDLKydbFaJCJ7YgA6q17R25AOM0yjSAWhouq3Ggowm4piboRdtaZC2mrHa6xRo+C
	 IiX3dxF4yvqoQQQV0sRRMXi1KfPOXwpMdaosL4dnPPrWFceFy2RCbaqwy8LzmV9PnpwiF
	 63S+p6qnU3tlQNxOdkfZA72Mu6EgfOExlmJMuEK2bgnI4BG5BsaW4PXKKTAai3Fal/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611187;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xxIlk8ad1HwmldlfeUVnuPEByQtKuFvJDdczq8HL95s=;
	b=CQHIlbUnyj7TYKrg1n1i8lLXFO+0Eh49UJrSghr29XFqKy5lUlhv7Ec2u+5U2dlsMhwK
	 68MAyCE3NQqpvKvtsTS9gCmKXDsnkeNuMM8UPu62LUD7z4WD4cmPKpUx33z3xvpld6igV
	 qToXXxaUY3XpfsDWWhAOR+HhHIcuoNl3iilAJ3gvfhwjtBBjP7GMhuJmi/nfuCdbKBL4d
	 lpTb5g7b07HiXBxLU5zHGFiOhpWobNK8L5pmNEfNwgHwA0KZmSFTRX9dTM3+sWYoJv4dm
	 c0BhDFVk+v6O5nLAFMxNU7+Zc4xKr5unTH4uIK7UH6NITcf9Y3tPwTKUqWnphHCBGyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A30E606A680;
	Wed, 25 Nov 2026 12:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A30E606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 236ef270e8cf11f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:218bcba8-80c1-40f6-8c6c-da832ccfe346,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:89d96cabf363c049bf5b944022cb66c0,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99|10
	0|102|156,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 236ef270e8cf11f19a56ed5b684f684d-20261125
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1101031014; Wed, 25 Nov 2026 20:52:57 +0800
From: Tom Hu <huxiaoying@kylinos.cn>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Rong Zhang <i@rong.moe>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	xiaoying_hu@126.com
Subject: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Default charge_stop to 100 when unsupported
Date: Wed, 25 Nov 2026 20:52:52 +0800
Message-Id: <20261125125252.38003-3-huxiaoying@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125125252.38003-1-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
 <20261125125252.38003-1-huxiaoying@kylinos.cn>
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

When the EC does not provide GET_STOP, stop_support stays clear and the
cached charge_stop is never probed, so it remains 0.  charge_start is
still validated against that value, which rejects every level above 0
even though the start threshold is supported.

Default the cached charge_stop to 100 in tpacpi_battery_probe().  The
store path already limits charge_start to [0, 99], so the
`value > charge_stop` cross check can then never trigger when no stop
threshold is known, and stop_support does not have to be consulted in
that path.  A successful GET_STOP probe overwrites the default with the
value reported by the EC.

Suggested-by: Rong Zhang <i@rong.moe>
Reviewed-by: Rong Zhang <i@rong.moe>
Reviewed-by: Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 8fc5569131f6..0c27e0b74b48 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -9698,6 +9698,14 @@ static int tpacpi_battery_probe(int battery)
 	memset(&battery_info.batteries[battery], 0,
 		sizeof(battery_info.batteries[battery]));
 
+	/*
+	 * If the EC does not provide GET_STOP, stop_support stays clear and
+	 * charge_stop is never probed.  Default it to 100 (no upper limit)
+	 * so that the cross check in tpacpi_battery_store() does not reject
+	 * every charge_start value.
+	 */
+	battery_info.batteries[battery].charge_stop = 100;
+
 	/*
 	 * 1) Get the current start threshold
 	 * 2) Check for support
-- 
2.34.1

