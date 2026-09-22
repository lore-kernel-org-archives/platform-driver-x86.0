Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E96539774;
	Tue, 22 Sep 2026 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075350; cv=none; b=krCPcj76YZgXbzK9oUIygsT1a288dmMbJa1eHkph6OmdKGerAHr4Om5mzpP7KTriVI/JtbPlI2PrQCNt41rxMNhMO+kPZpjoOeZMiEVXcaa57YSTZKRgPs+OAz7cOpyn7A57xx6FSunkVNki/JVLIgQ/uEBVtFxuAsoFQHrzoNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075350; c=relaxed/simple;
	bh=EksgKrOFiBHioxj6zCxUCHEyEuFLCmliymtMixs06Yk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=orf+OPNkXf3/aWeC2CPmyAapI/41HqsNHpYxzdjQnPyoKvM/893IUquTvjME5XsaCYQFva+sL1/Yjx5RRHVGLSk6LQtgAVZP/Iktn+lnB3GsXG9xqEFjS/YlNk9oQ7GPOyotzCcEm+mvADh4Cg3QG89kHjVbjpaQa+tfn0D+1LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 01e44866b67611f19a56ed5b684f684d-20260922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f562fdcb-4e10-4437-860d-c42fe8c51521,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:dc3630fc7c708fbef3dcd9532dcd27c4,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 01e44866b67611f19a56ed5b684f684d-20260922
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 71971937; Tue, 22 Sep 2026 19:08:57 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Marco Giunta <marco_giunta@outlook.it>,
	Rong Zhang <i@rong.moe>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Tue, 22 Sep 2026 19:08:54 +0800
Message-Id: <20260922110854.434403-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23039910DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com> <SN6PR19MB2303E25270E1A460ABC76EA3FC852@SN6PR19MB2303.namprd19.prod.outlook.com> <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Marco, Rong,

This is a nice outcome - the KE_SW version is clearly the better shape
for this. It also has good company: intel-vbtn maps its tablet-mode
events the same way (0xCC/0xCD -> SW_TABLET_MODE), and Lenovo's own
ymc driver does KE_SW for the Yoga modes, so it should be an easy call
for the maintainers.

Amusingly, my v2 suggestions die with the code they were guarding -
which is the best way for suggestions to go.

Looking forward to the v3.

Thanks,
Huang Wei
