Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CA815665C;
	Mon, 21 Sep 2026 02:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958228; cv=none; b=hG4G2c+oPHZLQxIoTs9SniILUR0XpZ8yBTMQkZFE8oy6R2AVaOc6XGU8HLlkTZUXIodMpY6otVpiBScH1FzdzG1TKNO62HtWybCiRXwAGpHpntmk2IucWrigTLhA7V5Cvq45hSuV4329Tx/T6yPShLuygNKZeJ1yGHfactpWaHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958228; c=relaxed/simple;
	bh=rSE6nffXkoUBUlEePePzkqTE2JeJidYGRs6ZsHTFyQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XAB4NjKUGJ3khKRkkjhwU8P9QNUQgaEov79yzGl7ML9pOCZ0ywcHZDiV/8w+/N3DXttN9EYjBLvtnJrZiynJ1oSboJdk8NQi139XuOU9DAiEuE6zveZ0CqQ977Qu8XVZAfIR6qukw8l4W+jDlJ09ItRJPpJ6blTzWbjxug95dCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4ca9db16b56511f19a56ed5b684f684d-20260921
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:62c40e9b-894b-48a2-8f3e-d400fca35c67,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:21274845b795e0f00b0f1ef2aff969c3,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ca9db16b56511f19a56ed5b684f684d-20260921
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1501933033; Mon, 21 Sep 2026 10:36:50 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Mon, 21 Sep 2026 10:36:45 +0800
Message-Id: <20260921023645.1954381-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SN6PR19MB2303E25270E1A460ABC76EA3FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23039910DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com> <SN6PR19MB2303E25270E1A460ABC76EA3FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Marco,

The v2 looks good - the lockdep assertion with the comment and the
dev_warn_once() are exactly where they should be. Thanks for the quick
turnaround.

Reviewed-by: Huang Wei <huangwei@kylinos.cn>

Thanks,
Huang Wei
