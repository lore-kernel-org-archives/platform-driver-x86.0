Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516822;
	b=trQcEw5HWVE+Dcwh7XGnB6NLRsJ5OYQCCF/o8Dbod6uCPYnO2S6awpvOlshWy4MKDpaj
	 3bdk/CUrd4Sq5N/JXOpJcvEFDTiVmarErYbUTVvAbDs/UkC0dviqsku1JOIPD7fZQ7oU1
	 +vzC9ranWllYc8wl7+4pLoW4lkhB/n9Y04W3bpzgVCeky6nG7YDdBk8MtvAUjcZj5AvGZ
	 i7lzoJitHEaLz5erttfaopPvNTVoDKTIIpuEhzIbKVwfmsMStRYYftHZ6MofFCR5bKcOY
	 1MysLTho9HZxmzKGx7yaPqqyu0Tl4SuLt7VY4rgrOEg7lITd9pSBhLzxGTU9+4lbXaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516822;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cRy2Q1rbpv3+ejcSiL5YkkxGvCPt9DlHJRPq3do6yDw=;
	b=sdr62Vy27nTOOoRUKfwZ0SNYV7SCugQG1H/yyk0aK5c+qwLFntzeaWHSyeu8/ZZy//NX
	 m70fde49N2fC3nHWYdhR7JrK3KVz/k+vfs8T4hwTRCSp/5mb1aZAcTYlHF7k7O2sRZ5c4
	 orLiJ9Q7gH76L4yJDu7PiyqLvoboYQglXrWczlYj1N91VIIWZ7QGZL3KljG/SmZ3Ii+aC
	 itvASCuMYkTlgyaKgTYQl3pKLgpckAB/AH192GjaNiiJr5h6irV3eiZyJl3rTS+AN3ix2
	 pRbozXNYz+P+ICyGfTjY859UJM70gGNTffs7l5f+AekqmN0zzal2KTHo8bIKtOivzJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A12606A321;
	Tue, 24 Nov 2026 10:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A12606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6dce0c3ee7f311f19a56ed5b684f684d-20261124
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7b56033d-a031-47fd-bd05-8a7be5989537,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:0e8160dd247175f16c70029b3121850c,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6dce0c3ee7f311f19a56ed5b684f684d-20261124
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 872560597; Tue, 24 Nov 2026 18:40:13 +0800
From: Tom Hu <huxiaoying@kylinos.cn>
To: linux-kernel@vger.kernel.org
Cc: hmh@hmh.eng.br,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	i@rong.moe,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	xiaoying_hu@126.com,
	huxiaoying <huxiaoying@kylinos.cn>
Subject: [PATCH 2/2] platform/x86: thinkpad_acpi: Only check charge_start against a known charge_stop
Date: Tue, 24 Nov 2026 18:39:46 +0800
Message-Id: <20261124103946.897642-2-huxiaoying@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124103946.897642-1-huxiaoying@kylinos.cn>
References: <20261124103946.897642-1-huxiaoying@kylinos.cn>
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

Only apply the cross check when the stop threshold is supported.

Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 8fc5569131f6..842045272ffa 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -9832,7 +9832,8 @@ static ssize_t tpacpi_battery_store(int what,
 		/* valid values are [0, 99] */
 		if (value > 99)
 			return -EINVAL;
-		if (value > battery_info.batteries[battery].charge_stop)
+		if (battery_info.batteries[battery].stop_support &&
+		    value > battery_info.batteries[battery].charge_stop)
 			return -EINVAL;
 		if (tpacpi_battery_set(THRESHOLD_START, battery, value))
 			return -ENODEV;
-- 
2.34.1

