Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848370;
	b=Q3dmKHCrx7mh6Pp6NhF6UcHePRoD6MUq2Xr5Gfx/lG+0QiwlYLZ/CVL5e0fQHfRLvaD8
	 aC0kwmrupmbwkpL6bbHk9X3Ek1zoB1gY6vDyFx7gKxcKJgC1jNoMcn7uvUbAo6E88i2er
	 hiqG4XG6klJ2733/nUJEY4ZXuL9lQqeRiPPkoC35eXzgAH3RPhbyn2enH+D856b8ddXaF
	 ETUitlh7tmrcn20HX6lL891JyQp0u2VgR48EIT0PNjaf5xz9VP9MsphY55+skEPApEoep
	 v195AEq6W+pZZ+8tL8vvoijnBhXM2Y24G15OpC5R1rlDcIFj9AzrRhZdKm+Gz+wBTgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848370;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=yKUp5mSyUyBJ6tp3CLkqJzdq4dAfsqbAvV5HRAMEn5c=;
	b=5eDBmy1bemJYUTjWuqV+xgu+OwXcTu9JWXGV2KtxQ6Za3GzVre0jYqt3cvE/WHUVXWIF
	 KoXdjZ1FqggNWr3ueo4Mhtm6pK4LDDV7PCOpF/fZmsFQ7nWfuCqyj4X+SEKVPsN3pZowV
	 5JpEI9Et7yqqsWKfG/zegik3kl4J0Qdkht0LjCtzaAn3otARDq5maGdXrS5x6xg6pnrBs
	 FyhWPqmXt4PJnvR/k1lQMu8lZWd+HJBe8SSTD2uQEfWtkaMlCMfaAewnyDAo1wg67XXcW
	 lTeInx/n2s0NaJdV+0Mf5JXWsP4+Hr5jQZpvGUXCaeXJ1AeQmxBLsEma+PVAtn+o9/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=hH0UpEwI;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Fx38SMcH;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BB606A33D
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 16:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08BB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=hH0UpEwI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Fx38SMcH
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 23E0F140005A
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 11:59:29 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 16 Nov 2026 11:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794848367;
	 x=1794934767; bh=yKUp5mSyUyBJ6tp3CLkqJzdq4dAfsqbAvV5HRAMEn5c=; b=
	hH0UpEwI/BehHbSmo34NQ85WfYrBq72s8YJB8dyAeivx+K+Sg1WnL0/wJQWQ7J2y
	jb0JqVWepBxpViB6KIsb5uybgS6EYR+LYPQDIkSlAvxwc0P/gPfK72eGlOGNJiAp
	dzYln5I/KIk9Dkte1vrnz9z+Ga310CKGcevdWm247KYT4PBx27cD1Tgp8q5oeAOf
	s22ueunsZM2mDz14gZHUDPVQogx26RrV2iCnnZ6xozrKIHl9gl1o7khUctnV7uFS
	GA8T8YUZQaGJVRBmFFdGpnVVcv/C8dfM3Gte8VcO4r0bYOQdyIQPUfzXQp69fqx1
	lPjDnt3FEolikSTsjqAmpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794848367; x=
	1794934767; bh=yKUp5mSyUyBJ6tp3CLkqJzdq4dAfsqbAvV5HRAMEn5c=; b=F
	x38SMcHnjwbj5qNtcdo2FODglL+m2sYb1EcDmPXiQVOv/yRPgv4Qt5W4peo2tMLZ
	1HHq38ZirLxnpfJS1jgDy+qVSW8xRYLvHlxUhcnSdE+MZ6yL5jEV6y490SkN86/2
	zHzbJDu1jTovHRATZqQo9zO//jFlGAG5DpLv6m+kCGQuU6sq/we++Su6CEjs6Rkd
	m/9JwEusO//jUj+HjVQVNkk+ReVYrF7xFCo37uofJ3KB+XM2JUu+8NoPZEWkXdin
	4UDh0J1zO5kOXZW0aHeeV4Is5DkLEy17AM46vWUuzLegbNqdKw0TxsX/lkJCuWGS
	RBWmHQHJgNCJDlAf+kk3w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794848367; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:ad8gio6MGT7HLpuPXfcE0pIAm1swURNcqxobHN42zZG0PaN
	MYDZADwlqwIim9LuC42LA+3u5IlTDEox33GLhQrWQ/Y88F5N1mWEtRzVXGn2wWNT
	D+BA7IWi8MGx2M1IHtMJuRq6wFLiudmeNuONx0H0E6nJg97svTET3mztLDO6rPGQ
	vScqTG9ZPvG8EKQ5XWxSPz66pnrR5VkOxeJxOETgGJrqx9FDwLhiR+JU/Jr7Jhsn
	BR4e07iaZKN//4HDljYIyoUxJewIcW4e8FwUVfacQ3YruASWoRtci6eUGXdxJnTV
	Fx12nuEwbigmaQX7SQlNOdDfxH2gtZiCPz4+cXQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yLQVTJRnyljvP+rKawNnJzWFHVwWW1ejjBuC4/zchY4=:yKUp5mSyUyBJ6tp3CLkqJzdq4dAfsqbAvV5HRAMEn5c=;
X-ME-Sender: <xms:bzb7avOdS6Npsu3G7aVbNZRLfdaI31krqa8gIex-qM0hOhzXn7eL9w>
    <xme:bzb7akxmragFgVzIpIq8_OguLCtBeCO5Fvxoh-_7CI8rNs54J_No6WY9FQdE3a3n5
    HyJT3N2-OoClzR3ZKvGlxZgmK4LAk4-ix1lq4cKVRlDSYr5hwOsjo5R>
X-ME-Proxy-Cause: dmFkZTEm9cs0BwAe74hEFEOgX8eF/vbyQWOjNDTR2gkKNZUqdsqPBmG5KZrxQbhwC6c2iK
    bFTQmBMAEpOWBWat3KIs2WdXg+MLQJPPS1eHfVl3GrZRZOi8EbC0yXFzd1YMiTOgVGLGTk
    drnlOYRd8YDDSGDqFiKjiSyFy6dE9pmjbmT3S48vs5cdwPlFYoFyOqlvici+gCggcvXc9n
    mV4S0Ff9kM9lI3j73PBB3UWWlpZmVCdkMkDuXQseZEEjnLnUFv/GHVp9HVsC+jsROoAJYz
    7zf3sRds2yvvottL8izXropxmtz9ZMZBpKW7riGMQStL91RVvFu+CDelXDXNUMPyWQfcW5
    i4BGvtGnDFxU3gd9ZyT70V6cXtFY+w5PDOY6JAJS4HehJsoVwTwt7ohSRA22nEEMpxRZ8Z
    hC3vT2OuZ6YrZcKG9JXJ9f3CkhNeOB/o2ynp8y8OMIoxA9FTMPjni8TFFCgyBZt3goQ0aS
    E3b+VCh3+qw13SFqdSOycD8eSCI6EMyzGsHV1Fs6Aq/ovwOGVshYh7EwfeEEMzGrr4r8Z3
    dOkNXJzIbznd731sGy/Xo6Bz3vnWJSbyisiQAg4fk2hYe+i4SjHlsfU8Cj4eLV+uPDWNVa
    bs5K+uZxoAnd2rWDIvxnYwpprfw/frGqqz95/cbgOeEDdHV0XNJkKifvG7rw
X-ME-Proxy: <xmx:bzb7alzFzYQ0GysjC_e16xPpEpvvGPPurjrCskLuXLUaHSev-OSKfA>
    <xmx:bzb7atfAL-bFFC85_mNR61k5wdgFy1vje1nzpGCnlF7narzeTwB6Iw>
    <xmx:bzb7aq4HRavY6U4audXFeY4fk7tflHMXFxAgmJZsIkVosNk07pp0vg>
    <xmx:bzb7aiIfK0xBT1IyCmD1x0kdHbz21UUGbbyi7UXlNeFWshEsx1tsog>
    <xmx:bzb7ankJ88-JsuTJyqEkwRIo1PFD1Ly1tENAjEmfYIh5Nk4_Wz-FkO-d>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 1F7292C00085; Mon, 16 Nov 2026 11:59:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AdYZAHf3NDmJ
Date: Mon, 16 Nov 2026 11:59:06 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "David Cemin" <dcemin@nvidia.com>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Jackie Dong" <xy-jackie@139.com>, "Ike Panhc" <ikepanhc@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Lucas De Marchi" <ldemarchi@nvidia.com>
Message-Id: <d0d35869-b1af-405e-9c8c-4996b4894fd0@app.fastmail.com>
In-Reply-To: <20261116044237.3760227-3-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <cbaf1595-05e3-46cd-b2aa-7bec1315cf8f@app.fastmail.com>
 <20261116044237.3760227-3-dcemin@nvidia.com>
Subject: Re: [RFC PATCH 1/3] platform: lenovo: move the architecture independent WMI
 drivers out of x86
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 15, 2026, at 11:42 PM, David Cemin wrote:
> Hi Mark,
>
> Thanks for the review. Patch 1 moves the MAINTAINERS paths for the moved
> files and adds the new entry; I will double check the entries for the
> files you listed in v2. Happy to see think-lmi follow once your tlmi
> series is out.
>
Doh - my apologies. Not sure how I missed that.
Thanks
Mark
