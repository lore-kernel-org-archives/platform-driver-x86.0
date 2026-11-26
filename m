Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655470;
	b=LFrUEpint8R3qq7byyO2e8vxEc286T+ER7ch9IAWvcpQCH0Wchf/kuxgcUjhSLjXQuOb
	 1bvwXQh3+zOSrlB89qOfpXl14RY6yFy2aulwqnUpy73H/XH1T8BMf5D4qAcUpOhs1jUVf
	 AQAI+0zAXS+Y0vOnSpfaYq3DFH5HKS/f9UOjGkGbzq6Fo3ZDrPGqvWIUwBt7/X0R85ioT
	 nNaPHl5fmBcchR0iW1aEosGW8VomhRiBRYYuTl2yg2F3Z45EZkHr1f9jRaf7hYBr3oHI6
	 UKzDfXuU6c5Yjt5Np0xjwaZV5IMnciQlJNwh385f2uV8ED570kIQOB/ePqFGrdUlTZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655470;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=70YBk3qhnjGEUtv9E4JqeYPrMUEw3Pq4T3cVOuw5b7U=;
	b=zJchHox+1gj8Bw4GePAmbm5m9LxTAbTCmVNA/uimEZD5LAIG72dNNezegZiHjOmzDfy8
	 I+472wSuTxNEjTKjKPOdC0CQvZ9NKba32nFa3Z60dTgRoKF9Sbz3kok/avEeNEddczKhE
	 g8KiM4SHi2OqAL+LQV0WGK+qgtucGb7QfRrgEvHzpm4/IVndqZ+lF6Z75LJ8UTmBPCxk2
	 KzonTmnOH/W5dQWuYR4cTs5y6FNfW7GF4l8q/qdHqXXpOHyOqHn0aR7uuBWjpXbza1hPK
	 L2JR+AW41aVUnaJyzWaARNZcq/TDZL6mmqzI55d1WLFUOsHonT6zi4LBEstzuJa4Mmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D5606A32E;
	Thu, 26 Nov 2026 01:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91D5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3f4f53c4e93611f19a56ed5b684f684d-20261126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:74d133db-b90e-4d36-ac0b-48c8dcdcb182,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f0eb96e7c0ac8bc87d05b00b1bc4cee9,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|865|898,TC:nil,Content:0|15|50|99
	,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3f4f53c4e93611f19a56ed5b684f684d-20261126
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1439246002; Thu, 26 Nov 2026 09:11:02 +0800
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
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Default charge_stop to 100 when unsupported
Date: Thu, 26 Nov 2026 09:10:56 +0800
Message-Id: <20261126011058.39175-1-huxiaoying@kylinos.cn>
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

Hi Rong,

Thanks.

On Wed, 2026-11-25 at 22:10 +0800, Rong Zhang wrote:
> A Suggested-by: tag is usually followed by a Link: tag.
>
> The tag is corrupted.

Both fixed in v3: the Link: tag now follows Suggested-by, and Mark's
tag is a single "Reviewed-by:" line.  No code changes otherwise.

The v3 has been updated.

Thanks,
Tom
