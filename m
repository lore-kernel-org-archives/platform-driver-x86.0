Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D27B1C84A2;
	Sun, 20 Sep 2026 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900154; cv=none; b=byCRz3RpF/KjalRT8afvUQ7BkzDh6nTyo4Uc4ylsYRS8wFkpwGBzNysD5rPzJgOJX+jvHsvwt2CNo/4M3lUTnXPtp/XD9+CC4+pqi8Y1bAsRL5QwjAfyz2DLY/YIory09Bo8RuNCkdercf1mwex0PGx9kh3ebAW/wZEN5Kp7OQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900154; c=relaxed/simple;
	bh=OkcA+B3fZWUVhWChFtLEgLhwJCUNQxdbK+9pU5us4Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hqGdArQwoQZQNCjLH3JGvKXHEuceP7jhMqli98oag7bwMN1iUurbjpGNAxnbxRBVkwiaOvKeRCmcCh+XS8o7zAzB3c8YvMu5UvF7wbj5v9lgnTc20UfDwJ99dXS5lVXqdBd3Y0tlshaz8ZUSviz1n44zdeF3G4lahqIF6SCiGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1b3536fcb4de11f19a56ed5b684f684d-20260920
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:59fc45ec-125e-4bdf-b27e-aff8f539232d,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:7f55c534484096bbee4ee04ef4dd87b8,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1b3536fcb4de11f19a56ed5b684f684d-20260920
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 944134417; Sun, 20 Sep 2026 18:29:05 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Sun, 20 Sep 2026 18:29:02 +0800
Message-Id: <20260920102902.989025-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SN6PR19MB23035785AA29213284ED87C0FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23039910DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com> <20260920064218.619667-1-huangwei@kylinos.cn> <SN6PR19MB23035785AA29213284ED87C0FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Marco,

Thanks for the quick response.

On the mutex: I like the lockdep_assert_held() option better than my
comment suggestion, honestly. A comment can rot if someone later
changes the call path, while the assert keeps checking the invariant
at runtime (under lockdep). The sdsi/hsmp precedent you found is a
good one. I'd put it at the top of ideapad_camera_switch_report(), and
a one-line comment saying the WMI notify path is serialized through
ideapad_shared_mutex wouldn't hurt either.

On the warn: dev_warn_once() sounds right to me. The retry itself is
good behaviour (a transient failure recovers on the next event), so
keep that, just warn once. Persistent registration failures are rare
enough that the one-time warning carries the signal.

With those two, this looks good to me from my side.

Thanks,
Huang Wei
