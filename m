Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744232;
	b=z5A0fqYhqUDiLiIelwQ94Em9j025tkjqFqI+o7S7W6gPKvTc9QCQF356/S8Ed9zCvj9z
	 UaCnHijqZOeiDYX1rgMuPjAZ2MFfFLaLq3CBJdhgeehO3nqt4+ABWd7fAjsmv1Ivg/wrh
	 NJ9YEAeBo313xmg6KgA+iyWBA6ss5rZvqtb5Hw8qmS6vqb7Py1C7vQm3h3uXHTM7PdGhi
	 dW1SGvbcAAq9W3KjknSudHJ0Ob3MTBloOxmRC/6sYH6v72USfB68hABggLjSIrtvaw96U
	 xRodSLF50Pnzg2XtF6VfgBHl5oi6bzzp3ETgLQaRI5eSdg5SOAvVE0/dkeT9a7ZiwJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744232;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8K5+4appvpPjc/4gczbfc2dznCgXlEjjQIi6x5SE9gc=;
	b=okIDqRrNMd9iRUtyYHq3IPZz5KnpBUMhzx91RAPISRyZ4rG3gZGrRnuW+tC/8gs4cb6E
	 wUlQBKzDZZEC8m05h2eZEDqct8SamaiG8xd2C2VgU3dt+jekSqIcKR+mtGsaXEDVa2yxO
	 csUgUnJYfGVogtSX/bPzrPW4994oLx1UfOCsUZxI5k25hiqdjZ1xkF+vjJw9X7WK6ol6u
	 UK2iOULM+ZE2YrXq2vjuQRU0lio61ECnv7Ju9awJgGfGPWc434Z88MvBREb/dpLhDTB+T
	 JVWrhkM3QpIssRO8dwxTfU1tMWD91v8NCAmGnD0sBm4H0WZLeecqZh6lyOzigTp9y7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C6606A32A;
	Fri, 27 Nov 2026 01:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43C6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e9d40e92ea0411f19a56ed5b684f684d-20261127
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d4ee9c87-fa57-4d6a-839f-c178f32cc09d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:0289858c2fe404d16d2b5601a5d87868,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99|10
	0|102|156,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
	nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e9d40e92ea0411f19a56ed5b684f684d-20261127
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1910115924; Fri, 27 Nov 2026 09:50:24 +0800
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
Subject: [PATCH v4 2/2] platform/x86: thinkpad_acpi: Default charge_stop to 100 when unsupported
Date: Fri, 27 Nov 2026 09:50:18 +0800
Message-Id: <20261127015018.81906-2-huxiaoying@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127015018.81906-1-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
 <20261127015018.81906-1-huxiaoying@kylinos.cn>
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
Link: https://lore.kernel.org/all/d776d4ca05cd2378e344881b82725fda168f6556.camel@rong.moe/
Reviewed-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
---
Changes in v4:
- Resend of v3 with the trailer block actually corrected: the previous
  export came from the unamended commit, so the duplicated Reviewed-by:
  tag was still present.  Link: now points at the original suggestion.
- No code changes.

Changes in v3:
- Add the missing Link: tag after Suggested-by (Rong Zhang).
- Fix the duplicated "Reviewed-by:" prefix on Mark Pearson's tag.
- No code changes.

Changes in v2:
- Default charge_stop to 100 in tpacpi_battery_probe() instead of
  guarding the cross check with stop_support

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 8fc5569..0c27e0b 100644
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

