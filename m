Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611185;
	b=u6KnzDeaNU6zljLmZHHwdTCCNqZ3+PXYBFyyTlp+tMBiWpDoZ03UlvuR+Ra8WhkhpOjn
	 Dtehq5fIlKCD5VJpObavjfEeAOcjZPz6OzE797SNPCW3I/UpvrC38aCT6CaTE7o9yxpOS
	 1THSv3RmtiP9GFH+HldR+8WgFVfpcZC29NpwwNzFmWyTm1JayIJ4lBemd3VjFnE8yDL4t
	 OToWPiXR+BtDbjFIbagUNu88oRm9vJbcoDlvZyqx/qE/YCR7sT+LB95ENeCLeG53LkolB
	 PSXT+xDNnEBDUiqTjq94XBX/GepnWUzh81cCTTkJZv8TNh5Our0L7ZEgMicLkn3ETPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611185;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BOtwCkuS///H/++mzx9jvaHdGo6z6KFUibimZstSXSw=;
	b=ip2swM0VtbYf5xKwZICfZ8C9LytcMIeF4SHfreO/CUWPp8I/IXqHNdORGqjqfgzXkqzJ
	 d5LRHdYbmE2jojsyBrPKW2BuKcH84M0tlYs1INmfrs4ZcHkwy7xbVfok63m7aUly4nYKi
	 EZJkf4udCs1PqxylDWEzLCeIhA+L2z9KOLM64aTrr25PLqXK/bFqsTBsF/iI1xwTPdWMQ
	 wXE0ELm9LQsim/hOWYU2zlKOpgrYXp+S0iL0RY6VbsFDjnLJsic5zWpA2pGl2o4W9BV+e
	 mL/JcXsj6gBAXwYyzpeXyc+MFIrv6xElrGbQBb3GQ1shx+xsL5K0gpzeVb8W8pQjcsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E042606A334;
	Wed, 25 Nov 2026 12:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E042606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 22942438e8cf11f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9288dedb-0ae7-469b-a702-dec0a9bbc5f1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:9cada499fb6ec97757bc40a5e63537c9,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|865|898,TC:nil,Content:0|15|50|99
	,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 22942438e8cf11f19a56ed5b684f684d-20261125
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2123365795; Wed, 25 Nov 2026 20:52:56 +0800
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
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Only check charge_start against a known charge_stop
Date: Wed, 25 Nov 2026 20:52:50 +0800
Message-Id: <20261125125252.38003-1-huxiaoying@kylinos.cn>
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

Hi Rong, Mark,

Thanks for the reviews.

On 2026-11-24, Rong Zhang wrote:
> A random thought: perhaps initializing charge_stop with 100 could make
> the code cleaner?
Good idea, Since charge_start is already limited to [0, 99] earlier in the 
store path, defaulting charge_stop to 100 when GET_STOP is not available makes 
the existing `value > charge_stop` check a no-op for such machines, and the extra 
stop_support condition is not needed. 

The v2 I'm about to send.


On 2026-11-24, Mark Pearson wrote:
> Have you seen this happen on any actual HW?
Not on hardware I have access to;  I agree a  firmware exposing GET_START but not GET_STOP 
is unusual, so the patch is mostly hardening, but the current behaviour (rejecting every charge_start > 0) 
is wrong either way, so I think it is worth fixing.

Thanks,
Tom
