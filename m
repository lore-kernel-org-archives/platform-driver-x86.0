Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B18BEE
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 00:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706488400; cv=none; b=gqVg9r+AGQQOGXLF+PYXEmU07xFp/xjpm+qquZCDIr0J7fBzQ9bVCep0oD263l7ZPqcUHhaIxxXvaTF14epIFPsNWiOQNWRRz7tiNqUXnUMdx2qBVhkDt66WVECLtH0QwbWCEpytcUbg3y0d8IP1EnZBRu+dd+FTtGKjJOcaGv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706488400; c=relaxed/simple;
	bh=yt/0AdaCK66gYBtqSM5+xTWegCD0Bjy3f9PmbbJ6eYs=;
	h=Date:From:Subject:To:Cc:Message-Id:MIME-Version:Content-Type; b=qhxTCoZV8Ut8D/h8x7sEhUSvhmz/xcXDQiMkc9LnBJUIBqwGcQv2E/sCparYRWQMf2ZiUbrmDwjw3qmCptjpeQMmJYIifBaMHK1lHdhqFsTL7oiEIO2pLTA4wv5fSRxmW5ENk9cXsuHQSpUomC000fEwcSlbf5GCmnoXAQlyxQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=LcNCjICx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZLDmYtJb; arc=none smtp.client-ip=64.147.123.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="LcNCjICx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZLDmYtJb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 808A23200A7F;
	Sun, 28 Jan 2024 19:33:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 28 Jan 2024 19:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1706488396; x=1706574796; bh=MYREC1ynNG5H4sz49f8ll4E9LEqrQ6SM
	PJjwL5Bl+yk=; b=LcNCjICxiRRZBUHtxxhFGtSzDT9SAFzGBufAZiX6CTaibfuO
	dSChsIK4glbFZvELcYAILwy4fF3MqI+TxTxcqc5ZRMUe9foi5Xjb68eGw7JCBC19
	5hSxR4cIsKSgQyR5cUGKZJLd9ibMzAAT7LtAm7ajgZ6BtJlaHVoaHeAixEoUkBhG
	/RQnP/Df3nTWUNbXpD4w07WRpx+dhHRuIVMlF6xFXK3IvpF0eeSXMh1rAZiQFVRw
	GcO1jxuH5k/GdBSE/JtH7d8d2P2SfF4In2ZCb0OqotJQlrL+VREbR+FMlInuqhAt
	o68afiWW7Cx7HOkvsxGVvP8pe2Fla3PpsOQr2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1706488396; x=1706574796; bh=MYREC1ynNG5H4sz49f8ll4E9LEqrQ6SMPJj
	wL5Bl+yk=; b=ZLDmYtJbvAaqouvV7gDhAKha+1bpxOmUZQMDNeO1AHrUdP9sNet
	NzU9wfnU+Cscv9uT7DCwDMXqxtvEEyEO+APwbCc1VqAbNO688brLFGcHsqJh9ih8
	DSyhKr3Sn9+OauNqd05xNOgn0Ouzr9tpyX4LF8C0o70vBeHHskjmndSy3erRwdLu
	wX3VJ3Ei6Dm7tmwR6sHOg2SL1pHJkvTnZfaNAha2PPPDpqQ2ZayWXg6kTXUZgot6
	JUNlcZnxxYfkTyhV754EKZlcWeNJYp03/PKThh+VeBU5XPeOLPLHt1GiCVkulJYB
	0Dd+aTHp16C+uyAON4WYOuITPhrn18+tZ5A==
X-ME-Sender: <xms:S_K2ZXYABc5eIWG5NYnNJUh90iZNBTeiuRapml0ffaP8Yion8NwKrA>
    <xme:S_K2ZWZSST_WZbpStdsQQ_guX3KJq2eonHXTESyhEm02jEbEgsgMWrhmlrJ27HyHu
    lkzKjmcAx1S1wccTZc>
X-ME-Received: <xmr:S_K2ZZ8RqDPpX6-oKHvMokPn5fEhdsxA7yzBkLuibnfcRc_qLJxzFI3sart7OF-LGsIsAoKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtfedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffuvfevkffogggtsehttdertd
    ertddvnecuhfhrohhmpefnuhhkvgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdgu
    vghvqeenucggtffrrghtthgvrhhnpeekjeetteegtdeifeejjedugfduvdfflefhteduve
    ejfefhkeekvdelgeekfffgueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:S_K2ZdrG22PMRPQVlE_4Hb6SANnyQizWnpoV4gYDcGBzA2s1HnzPUQ>
    <xmx:S_K2ZSpLd5KsjVc4ZUyS6MRZPEJaN6bA5i_IxJR-sWvxADEFaUBmLg>
    <xmx:S_K2ZTRZ8cHMZh0wwsXHzQEBLE6cT1T_VjFc5hDnsd_H0pVQ9PMexQ>
    <xmx:TPK2ZZ3T7KipAOx9LBPR-j_D-mdGR6UYavG1zQo6eh5AGDr3ADZmyQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Jan 2024 19:33:12 -0500 (EST)
Date: Mon, 29 Jan 2024 13:32:58 +1300
From: Luke Jones <luke@ljones.dev>
Subject: Re: ERROR: Writing to dgpu_disable cause Input/Output error
To: athul.krishna.kr@protonmail.com
Cc: acpi4asus-user@lists.sourceforge.net, corentin.chary@gmail.com,
	platform-driver-x86@vger.kernel.org
Message-Id: <YUYZ7S.LZOIVEZ0E6Z31@ljones.dev>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

I think this can sometimes be caused by device drivers holding some 
things open. Can you switch to a TTY, kill all display servers, and 
then try the disable method?

Cheers,
Luke.


