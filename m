Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFEB4219E9;
	Thu, 24 Sep 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233605; cv=none; b=Z9R51TElmIl3FsHcxc8/5KAaMjMS55e3H62BIxCY4xWsazfqb/rEqTFTtmc5TJ5nBbtBHTI7PJTK3VeyVPq6W1TOsbMe6NR01Mp3zFbsOJ1xy9HniIb7NPjxy99rLqvZMwNObr6orkcPUSkczZkyYcaHaWx22Fch36KyVl2roRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233605; c=relaxed/simple;
	bh=tpu+RoSvDtPIZOdlhkoeWl5ETON7wH9mUnM8AFFM9pQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eE+6/G3i+07Jd1dX9D4GpKHGxIEuS+x7/0EpWRuE7Fnompl9nvbUlCmgCtQqweFQrUY+Ja2cGYN/gl23dS5ugEhD/7Y2+OoFn49AqWjRZw6vuOnoKLaztcEcaBy1pLY8NFmv3XY8j2TUdd9m4jC9JrPpWL7zlYq+uJ0Gt2Xzy6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 747b5600b7e611f19a56ed5b684f684d-20260924
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:762c49ff-bf26-48f6-bc52-06977b7399f3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:ff7dc93e0ae167d3821109917e24c446,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 747b5600b7e611f19a56ed5b684f684d-20260924
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 131384972; Thu, 24 Sep 2026 15:06:24 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Rong Zhang <i@rong.moe>
Cc: Marco Giunta <marco_giunta@outlook.it>,
	Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Thu, 24 Sep 2026 15:06:18 +0800
Message-Id: <20260924070618.3600611-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924-ideapad-laptop-camera-sw-v3-1-922ea6a9fff4@rong.moe>
References: <20260924-ideapad-laptop-camera-sw-v3-1-922ea6a9fff4@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rong,

The v3 looks good - the KE_SW mapping is the right shape for this and
the entries match everything we worked through in the thread. Putting
them under a dedicated "WMI switches" section at the end of the
keymap is a nice touch, and it's good to see Marco's Tested-by
carried along with the handover.

Reviewed-by: Huang Wei <huangwei@kylinos.cn>

Thanks,
Huang Wei
