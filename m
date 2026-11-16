Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839458;
	b=sx3Pq5UGkRScdQbCTBOojmn5n+BAXjhG9mnRhI9f9U7ArvB8uI9MQrwgIJHPGdyCvmFU
	 HuYydJNdIOV08d6fTp7YCJitPk/zeYu/GdCUZo9fcMd/07PvKFyPXEaTmwYYIWQM9gMXq
	 MCJouuJ5G5Iip5vkTjrfPA5DrZGxKFWs8wllOJLVJy+CJ9SyxdqgpFvTYADLfj79zJ/0P
	 DkC0bY/6psn9uhM0WRBVbX4GoLdnTnS1zJL+rN7vSAvxapQi0qLouCzwlOXMJmW81yBlc
	 sKcxvQ/ZalghtBSQq2hdrlq3g5pbqX7hopc8BFRfV4/KT6UtrBfZMmmD/iXsCo4nlXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839458;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=EDjYfGPnM8OA9NW+LY9ifZknUEbTkV8FfqZSHX3i64U=;
	b=iou2pnc5QByCgZKirfNR/m3BGVhbHA0lLdkhVGywGMHn1s/iPXjH2/IVySvpevVKcd6D
	 GwvznctFkeyNZWJLF6FFAd1t0dPEv3V0z4G20Y6SqueJvzHpLKUdJz0WR9LDQ6Hkgg6vN
	 BB48xgQuX4O2eziST43+3WLQmLA7/mY/H1RHnKqHpdtGAu1GQRnQweQQEDTu+ZTkrmMj5
	 dgj4SNU4bdLYJNdZrwY5CS3cGFqxYW0IurEC9chu3DzueJwe8INwIJyD/4fEkxTlXzOqY
	 ZBTZWHwSpSVrVL64+UCDI2qtDBfkz/HqASn9qZIElb0AAeUcBdSvX9d7JvFbUgSzYSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=seu.edu.cn;
	spf=pass smtp.mailfrom=seu.edu.cn;
	dkim=pass header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=C+FjJx+R;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E0606A323;
	Mon, 16 Nov 2026 14:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612E0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=C+FjJx+R
Received: from [192.168.17.1] (unknown [124.79.98.159])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54dbcb553;
	Mon, 16 Nov 2026 22:30:50 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Rong Zhang <i@rong.moe>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Zehao Gao <gaozehao@iie.ac.cn>, Hyunjung <hj351016@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Derek J. Clark <derekjohn.clark@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] extcon: synchronize all-connector removal and fix
 Lenovo fastcharger teardown
Date: Mon, 16 Nov 2026 22:30:46 +0800
Message-ID: <179483944681.43652.9539572356847924730@seu.edu.cn>
In-Reply-To: <179474326098.103840.15531040789536968458@seu.edu.cn>
References: <179474326098.103840.15531040789536968458@seu.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-HM-Tid: 0aa1e4c4936c03a1kunm61f671b610e989
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHk9CVh9PQkpKTk9JQh5OTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSU9VTEJVQkNVSk5CWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	JKVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=C+FjJx+RiELijSZqmtcGsgoCxEddZ589YNzIyXsFjyv0JpazDHNPexOEk7NB3CK15jj6XYD5GEymgmdDZ1U1n2aGBlrdfV7ZXlb/b5zeashZhjT97USQZac4pHjaCBPStVWIkayNs0hOmf7GvUQIUAVcwuHU+rRrSxEjrYTWv0E=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=EDjYfGPnM8OA9NW+LY9ifZknUEbTkV8FfqZSHX3i64U=;
	h=date:mime-version:subject:message-id:from;

Hi Rong, Ilpo,

Thanks for the review, and sorry for the mess. Let me answer the questions, and also put one thing on the record about where the extcon part came from, because the timeline matters here.

v1 link: https://msgid.link/20260806060526.1189-1-getshell@seu.edu.cn

That is the patch I posted on 2026-08-06. I should have put it in the cover letter - my mistake.

Why the extcon patch exists at all, and why it is in this series:

v1 only cancelled the work inside the lenovo driver (devm_work_autocancel). After sending it I went back over the teardown path and realized the patch itself was not correct: cancelling the work is not enough, because the all-connector raw notifier in extcon can still be running a callback after the consumer unregistered, and that callback can publish the work again. So the root cause sits in extcon's notifier handling, and that is what 1/2 fixes. That is also why 2/2 says it depends on the preceding synchronization patch.

On the origin of the idea - I understand the suspicion, so here are the dates:

My v1 is from 2026-08-06 (link above). It is also the patchset referenced by the Closes: link Ilpo posted in the 1/2 thread.

sashiko reviewed that patchset back then and raised exactly this "extcon uses raw notifiers, the synchronization is insufficient" concern. I never received that report in my mailbox; I first learned about it from Ilpo's reply on 2026-11-09:
https://lore.kernel.org/all/2ef4ad43-497f-c40f-b18a-f5b75799d95d@linux.intel.com/
That is why 1/2 carries a Link: to that message.

Hyunjung's patch is from 2026-11-16:
https://msgid.link/20261116122001.3096223-1-hj351016@gmail.com
i.e. three months later.

So this did not come from Hyunjung's patch; if anything the order is the other way round. I am not trying to win an argument - I just do not want the record to say I took someone else's work.

The attribution Ilpo suggested is right, and I will use it:

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260806060526.1189-1-getshell%40seu.edu.cn

On the other points - all fair, all my fault:

S-o-b order: fixed. Zehao Gao co-audited this series with me, so his Signed-off-by comes first and mine (the submitter) last:

Signed-off-by: Zehao Gao <gaozehao@iie.ac.cn>
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>

The mangled "Jarvinen": my git-send-email setup on Windows encoded the Cc display names as GBK instead of UTF-8. Fixed now (i18n.commitEncoding=utf-8, sendemail encoding, UTF-8 console), and I checked the headers of a test message before posting. Sorry for the noise, and thanks for fixing my Cc line.

On Ilpo's point that the extcon fix is not pdx86 material - agreed. I will take 1/2 out of this series; if the extcon change is still wanted, I will repost it to the extcon list on its own with the attribution above. And since Hyunjung is already working on this, I am happy to let her series go first - if her approach covers it, mine can be dropped entirely.

Although I do not have the hardware, the change has been build-tested and manually audited. The analysis and the patch text were produced with LLM assistance, then reviewed and edited by me.

Thanks,
Hongyan
