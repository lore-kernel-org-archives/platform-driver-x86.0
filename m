Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD7393DF3;
	Mon, 12 Oct 2026 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776502; cv=none; b=T/B50rU88Hw46+xLugNHgjDENjowId5wXzM0j/sEHZec0ruyC/hNtt3BqUI6Sge7s/WnjGYcz6qu0wGQV21L8tHVzcr7zlPXlbK4wpGkmPLwIXBn+icQOYx70sP4NEQEYllvR8vC9dMBQ4xcHhBY3J/OXjHwZQo109QrAae7OkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776502; c=relaxed/simple;
	bh=CzspXTwoT4m+g/GP5csUniSTaoXgyq7ZTupgs8JnCkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=irVGu04VkfBUhBS2Q8bMgrpcG//bns792irsPu5JPlw0oIAo01l9TZfeBvIcPXwuVX4edUNcXKHK/736m4aSwN5G+ZJf7QX//2cy7EO+wc/TbwFcpZuu7eAOQSBltaEVCshcFSBCeP5c4HLL3M2f37UnUx3wFGzFaSXjnWex4J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d204e5aac5ee11f19a56ed5b684f684d-20261012
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:87c6fc9c-32ff-4d36-a0ad-7eca3314c4fc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:fa8ff65df442afae43f8ca6671899102,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d204e5aac5ee11f19a56ed5b684f684d-20261012
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1535379868; Mon, 12 Oct 2026 11:41:34 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard thermal/fan quirk tables
Date: Mon, 12 Oct 2026 11:41:29 +0800
Message-Id: <20261012034129.2902006-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000acb24-7aef-4718-89ea-0dffd1ab34d9@app.fastmail.com>
References: <20260826073014.2611191-1-huangwei@kylinos.cn> <000acb24-7aef-4718-89ea-0dffd1ab34d9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark,

Thanks for running this down with the FW team - and for the honest
follow-up. Dropping the patch is clearly the right call: if the X9-14
has its own register layout, reusing the existing quirk-table offsets
would just trade "thermal sensors disabled" for wrong readings, which
is worse.

The symptom the reporter hit (legacy probes reading 0x00, thermal
getting disabled) is still real, so I'm glad Lenovo is working on the
correct mapping - happy to review that series when it lands.

Ilpo - sorry for the churn, the patch will need to come back out of
your review branch.

Thanks,
Huang Wei
