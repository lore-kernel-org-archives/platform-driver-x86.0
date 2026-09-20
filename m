Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027D3D4121;
	Sun, 20 Sep 2026 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886550; cv=none; b=mFrTpzv92A4FgsSPCz3DZrlHQJT27pQqM9CGECm9cLVIguPfP/Dt5FD48PpLlVOfZYdNK6g+zOFUzK17ejXGqXDlq3lWClOfwVDQZ+myFxrS3yO+/X4jKgXk9/3IfVJKSCejFBXmYJjP3oQm8tmPiObJqGBv1gvwnv+lExpooEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886550; c=relaxed/simple;
	bh=WUBIdjGir4I8Wn8AFLrRIARvNZLiU9Xphes02PQyY+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xq48sD8K89h8Qbu9Odwqd45VT4XFEuN65KmxbdE3lAHaw4jz6vC2FpBG5eNigOgP7rUXYUOzV1jkNJUsBlXO/tbiksDPCQtIWYUOiHonLnAKBH0akkKrpO93PJJG871KUNoRtWKSeNqJiSX8CzW1qaDJdB3AyFFvqaqd/bLVEYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6ebce4d4b4be11f19a56ed5b684f684d-20260920
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4ed5e8f7-6f08-4fe7-a98a-c3f422f22de7,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:aed52758dfbe9b6fe8b04b7da64e2458,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6ebce4d4b4be11f19a56ed5b684f684d-20260920
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1658379206; Sun, 20 Sep 2026 14:42:21 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Sun, 20 Sep 2026 14:42:18 +0800
Message-Id: <20260920064218.619667-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SN6PR19MB23039910DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23039910DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Marco,

I went through the patch and the approach looks right to me - matching
what lenovo-wmi-camera does with SW_CAMERA_LENS_COVER is the correct
call, and reporting the initial state before input_register_device()
is the right way for EVIOCGSW to pick it up.

I initially wondered whether the lazy device creation could race
against a concurrent notification, but ideapad_wmi_notify() holds
ideapad_shared_mutex across the whole handler, so the init is
serialized. It might be worth a comment on the init function saying
it relies on that, since it's not obvious from the code itself - I
had to go and check.

One small thing: if ideapad_camera_switch_init() fails, the state
carried by that event is dropped, and every later event retries the
registration and warns again. Probably fine in practice, but a
persistent failure would log one warning per toggle.

Thanks also for the notes on the alternatives and the
suspend-staleness limitation, that context is really helpful for
review.

Huang Wei
