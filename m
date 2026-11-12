Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526666;
	b=M8yPNqWXXOzDBQUqPhKjtKOsr94AaWykpxJzpRaWRWGpcwlpEKf+LnJWU2d7D8ubcOHc
	 RTPf41DpvBcb825V+E1GnrBOimyC4CoyRCG/K4aP0kqf/c0j8ABLioY0nkFPewBQBz8pO
	 XpYk659DR+/9UEMGmMd2ed2ejSD7ds4+JYJPAYsBX1rLRdM+GtX1Oll2WP3XCLGQR/8Id
	 EEkK57prD78HXRnVjLNqqwQKZLLSH7IsXPAIlE5OhQJ8dtG+OGCE7cW3Aj8XsE695FHvn
	 bxxKPJxtrZZx12Gzh+TVsjnl3a9gd9oHcoEylRO74XIltyTS+C8t+FENuchYXH849iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526666;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=aEOiNYkzsLHq1ynJdOukkMSudOQBrT68/qnzg9hLHKA=;
	b=owlMxvbeVJPirpEMM/s/8SE79yw845vF3DApUVyPakjtm8f5nDk4dxQ4dgsqUu8gtP9h
	 Ibs9bIrFeqUezDvz6xo6gcf5+jT3S3IyiRFxYQcmfUixN8ZSk0Io9pQecfMlB4Y2vS1Yg
	 Wl2nOuAGJ9dYuczeCvl2EtmyXPwbQ6TAcsPpztbOVU/+/xvEIkfseAVCjhFl36iVL7uxD
	 hL7CYVJnxG3iPyyozK6Bqrpn1PxSTYa8tYZwxTMs4OkYNxnXeTQ+VKYXjnl5/x31hytFE
	 CUBIiUR6f/O3DFWwGUXkuDd2GXbgPzj2yaR2Ae6MRgCAQjy/yxEIO36TZ05ZjPMXR4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=S94R588u;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F058606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 23:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F058606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=S94R588u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=aE
	OiNYkzsLHq1ynJdOukkMSudOQBrT68/qnzg9hLHKA=; b=S94R588uRUJ/AfedN8
	rlXFNG133XczanXh3fadD1W6c1SiWGHfYr3TslTkchIfmpi52ImAYd3m+9XBl0eF
	S7Bg+amhq6iXvjnSEHJM0o3F2mA/LAYOjHUwFAhqmwadNg8bQOy721HRpddSKp16
	xzn0bo3/b4i5lT1GU1MO4TxLs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXNh2xTfZqDwwNFQ--.6242S2;
	Fri, 13 Nov 2026 07:37:22 +0800 (CST)
From: Wu Enqiang <janussss@163.com>
To: ilpo.jarvinen@linux.intel.com
Cc: luzmaximilian@gmail.com,
	platform-driver-x86@vger.kernel.org,
	chris@nilk.net,
	konrad.dybcio@oss.qualcomm.com,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v2] surface: aggregator: propagate -EPROBE_DEFER from ssam_irq_setup()
Date: Fri, 13 Nov 2026 07:37:20 +0800
Message-ID: <20261112233720.3564-1-janussss@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179451670088.11882.17094899653516205494.b4-ty@b4>
References: <179451670088.11882.17094899653516205494.b4-ty@b4>
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
X-CM-TRANSID:PSgvCgBXNh2xTfZqDwwNFQ--.6242S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4R_PEfDUUUU
X-CM-SenderInfo: 5mdq32xvvvqiywtou0bp/xtbC3RLXQWr2TbJ92gAA3d

Thanks Ilpo, and thanks to Chris, Konrad and Andy for the review and
testing!

Wu Enqiang

