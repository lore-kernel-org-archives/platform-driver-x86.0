Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413FE386C08;
	Mon,  6 Jul 2026 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783306776; cv=none; b=u2RjWEsAH5TKW707Vn1g9mGVAux5zCaL0Q62qo7yNKgUuwzV5t9IvZqmfhBJGNu7MONtigdj0U7ytP0GFRKPMAe31AqnvdzTBpRFPUFpE60STKC7YauT9ZLl4egTV23wXLH/RnxmN9reQusgi+YLEFoEDO+pxJPKWfVoSiNukRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783306776; c=relaxed/simple;
	bh=oQSYzrkz1W/RwEjzNcemjcrN3aVwOTQiPP4PM5oZtB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vu015o3UwMgpQyrFpTWoiz2cEkCoSrfkOmgX319V29mRr6FRD8Yw1DEH35TBSeVxdXLq6Hz2Y1u6iWGehkiCZIysp55BLEEpP5K1wuJIcsWKiW6nxQPqkjYjXePCG32/S4RZyZFgpdHoZWDf3O7bLpi4XMBzv8GqKn3pDLhZER8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b4522b1c78e611f1aa26b74ffac11d73-20260706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:dd59b0e2-4dab-4b4e-90f5-0a54a2bb37eb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:fc9abaf029f8edbd52e4a3bbcff0f34e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:82|83|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b4522b1c78e611f1aa26b74ffac11d73-20260706
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1378134738; Mon, 06 Jul 2026 10:59:28 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/surface: surfacepro3_button: Check ACPI companion before use
Date: Mon,  6 Jul 2026 10:59:25 +0800
Message-Id: <20260706025925.535430-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706012512.524359-3-lilinmao@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this patch.

Rafael already posted the same fix in May and it has been accepted:

https://patchwork.kernel.org/project/platform-driver-x86/patch/23119222.EfDdHjke4D@rafael.j.wysocki/

Patch 1/2 of this series is independent of this one and still applies.
Sorry for the noise.
