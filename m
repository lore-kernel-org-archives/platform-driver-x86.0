Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611187;
	b=ynDMmET68tSYARw9ZpUggBaGs88LqJTLNjVwHe+6DxQG/4sMbVHEpg1Z+WuKuEdj0HBx
	 X0yq05/cmqMuBDyJajauVDfnGFhcSCkw5bUMeXxSEwDkZOmRlIDfpnpVzsFZJrjUdLtmW
	 xyFGQ+R7GMRyTEy55a2jAhUck0t72HsOmOKrZZLqyPADlZISO4JPlcWuL8BlIKVDXXoQK
	 fZtstjgHiPO+TXJiTIF/dTMqQGVShEsWI8kQiOxtV4crMsrYGEXQevdl8Il16YVk0FpXU
	 E8aOcP23dbW4MjZvgmp4KYn1oESR8qNlnVVap+fR8eI842c+ZzsIGUd9d1Jm01jQLbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611187;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1eLgDqKy012q83IXxmUxT+2H0cryE4EVrABGEzNW6Nk=;
	b=1w50f9BZXMenLvl5vclTdoLYX7i8qjxx+o3LB5vSTEEdqjBs3GIgUgJomf1F2IfVBQsN
	 43nJ4cmZoP7+yLA1C+YewkgzTLtD64BZLhPy4dv/evYtzzl92pPDouyogGgN8V/4xKGp/
	 boQvamTIBzu0ya82EAsjhUvP+aQ995k5lteG9oq2je1Zoqf3bJB4WBf/40gGsmdGeiwQG
	 muvLJDOapfYzcXPWKxkYbdc8baJ4Rnh/N9wt7mcrz9Z3r3V3+S6cwN6BcgolfLCVOkv30
	 1zZwYi7MiXVi6RNRLivUvxKzHMctodmlYzHKqcROqzP552qnjzVrcgdyBud49FbIIOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1068D606A336;
	Wed, 25 Nov 2026 12:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1068D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 230cb4fce8cf11f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:786433fc-ad2a-4098-ba3f-8ebdf90f9421,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:2fdc30bc37c09a43f453b9d9a4162f52,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 230cb4fce8cf11f19a56ed5b684f684d-20261125
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2006821591; Wed, 25 Nov 2026 20:52:56 +0800
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
Subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Update charge_stop only after it was applied
Date: Wed, 25 Nov 2026 20:52:51 +0800
Message-Id: <20261125125252.38003-2-huxiaoying@kylinos.cn>
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

