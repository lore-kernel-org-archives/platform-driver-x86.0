Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744052;
	b=btGDyPj3kQZu0lct4W+D7TO7T34m75weGTOu1mzSgKhZnb0nFjAIcASSetWEwalr0lCc
	 MLJhlKL6dQxcU+hvZQTYiOgQw7iNWDGonJ1j/tkrH54agNHRIfbTJLukv1C0aE5ImM9Tw
	 fQmRVs0oXJRwdLTDgsHXSwi8zccPlL1bhOW7PDHY/pSY4z7KulzgaW0eai9mXjXQIdNPN
	 /NaaISecT6p8M5HPiNHKm+tiM4OZ2KqvXOFMJuIETwu5WAg0vDPanjjIOwg68PZ2A0I34
	 VQZIuQ2wHH23XdK6VbrbcQy9bmXWALOQc0DzCNvhawCwTxbRYkSAR/E55EBNp9+lysw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744052;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=NN3TaKeQuETHeThk+N5sCx7sW2Aw4Csu+FtwwEltlI4=;
	b=PczlpTt+m6561ZYlfc0hI5nOHIweC1JzBrVB+g2ZEQUONE49XJ6jX7vnYaiHsbKKHZ8J
	 /kwdxG/du15wn7YJmPoqK5m6mIMbjkWtoNQTNb3pIcKVbIOQo6X84qvUxLNqX1l5E9Ev9
	 WsMG36OJwD7nhMSOOq8Ygq6JL5FSjvKLcHpgulhVZ/NTTSdJx9IQU1Lu/j0G6Fyt8IpfR
	 IUU9ZnLSE24Mi7pynchq/VJbnLC8AAXhg2Ieph4DIooVB5axEmYCEcM4xb9lpnYsEdhT1
	 4gNtWkJBGvhBYY0zg6eOiVHH260Q5ywDtOgjY5GJd3ENYjwn1HJJbpOohtzPU2FqaYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601E4606A31C;
	Fri, 27 Nov 2026 01:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7e9f3304ea0411f19a56ed5b684f684d-20261127
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:eea51feb-6e95-4a5b-9301-42266ada7f46,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-4
X-CID-META: VersionHash:7db8b62,CLOUDID:d43b64166a8d6911b1bb7bbc5cec1257,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|865|898,TC:nil,Content:0|15|50|99
	,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7e9f3304ea0411f19a56ed5b684f684d-20261127
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1204022945; Fri, 27 Nov 2026 09:47:25 +0800
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
Subject: Re: [PATCH v3 2/2] platform/x86: thinkpad_acpi: Default charge_stop to 100 when unsupported
Date: Fri, 27 Nov 2026 09:47:19 +0800
Message-Id: <20261127014719.80930-1-huxiaoying@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
References: <20261126011058.39175-3-huxiaoying@kylinos.cn> <28df34b19682af96231caaf30185113972d2f735.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rong,

You're right, and I'm sorry for the noise.  I re-exported v3 from the
unamended commit instead of the corrected version I had prepared, so the
duplicated "Reviewed-by:" tag was still in the mail even though my
previous reply said it was fixed.

v4 has the corrected trailer block:

Suggested-by: Rong Zhang <i@rong.moe>
Link: https://lore.kernel.org/all/d776d4ca05cd2378e344881b82725fda168f6556.camel@rong.moe/
Reviewed-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>

I also pointed Link: at your original suggestion rather than the review
that asked for the tag.  No code changes.

Sorry again for the noise.

Thanks,
Tom
