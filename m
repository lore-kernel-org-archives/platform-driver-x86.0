Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517507;
	b=YO6CtgjHoFDuNAtbfDQUpZMXdx4JEXB2LSzKvOxgT7b5cP0M6xJFGKLM2qp2UhzVcc+4
	 g61U4j3qe2ZJe7tHU4dW7uc1/yhrhT1dksfCJ3Ew6TBiK7XXu8zwILsbYilzBnlWewkmU
	 rXQgTqicZz/dWuk0yVwObSQSXviJv15L1a3CN9imJz5R++GW9cAnkiA0jZ5PwPukVM1oR
	 sHMtVEM8IvtpbZJZKY7oQwi0ZQkAyjAXxU/hb/55eaQM1Ijeo9dYpCbQY6oqWVaoZvYcC
	 Yw/UatwMBGLViCUFZVstDzwlxwd+aYLxeOaB0173oyDgQy+gQqDCyhI6wopOZiXsLdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517507;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ya/9Kyp75u+kv0fbcfn1s8UYrtXFsex7509YvIgb/lU=;
	b=njs1Q3ZMaexhdfPhIiruatjCW/ELYM3P8MmgQlYUgRovFXKNZIPyNA0NOIt7lOyHZB8U
	 jFv+kFacDq/POKRTWlmzS8T8fT2rZO5g0Bdmup2v/1t5fO377mt2qJ9wWSz8No9H3U9iK
	 qj9AcnfEaCYTVpEAkOfQzvjZJeZHmMgFqB4vrQ8/+GnwalBbPs1Tz5b17BfeMDbj3FA4c
	 CFBNZ9ZNEdVdCjQUImoosLKhI3RPu6E+g1m6OneQMJhcmfqsrxg7NPyBb0MYQoBbU6AEJ
	 EUONcCtBd2TlJMs1rigoA4E99E3ewy2uhxrWBMqqONK0r6uEW6FpiDSWCmdWZcRjpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=iDzdAXzB;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEEA606A321
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 21:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AEEA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=iDzdAXzB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794517504; x=1794776704;
	bh=ya/9Kyp75u+kv0fbcfn1s8UYrtXFsex7509YvIgb/lU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iDzdAXzBb4TiDfcFH2lJuzoIhytxziXw+2Mcm+t5m4f5aRqaR1BLIcMmbKDU0vfou
	 HzYknUda5/hFSyjyrkrY4Yiz33fWkqi4UohQjDjWw5GJrfZLoOuQXb3LbGYAZNMd4p
	 iWqb3E58AWpJoTVAk8ahW9VyvTywxFkffEKPwSEiGS+L9rxazE5FY+bNc11TAW1Jn0
	 pGp9XTHmCz7lh+Y+CKCprnHMOomYqmSdAqL5DYBcvc5MeK97VgwqW4DPhkXctoObW0
	 cMmucsUbkc/2VhxAchvyZvf4Mej/wSGEdTp6WOOOQdRcNFkmnjEJoOkn/sdskGSv6u
	 Yauo1Rdf9+X0g==
Date: Thu, 12 Nov 2026 21:04:58 +0000
To: Denis Benato <denis.benato@linux.dev>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: write the thermal policy only when it changes
Message-ID: <20261112-asus-wmi-tpolicy-reply2-a72710a0@empyreal.works>
In-Reply-To: <8523039e-ba83-48f3-aec4-6d9540b9d0fe@linux.dev>
References: <20261111-asus-wmi-tpolicy-5fbc4e09@empyreal.works> <ec9515fb-6698-4e7e-8a88-5b3fa2f50c51@linux.dev> <20261112-asus-wmi-tpolicy-reply-f7889fb1@empyreal.works> <8523039e-ba83-48f3-aec4-6d9540b9d0fe@linux.dev>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 1f4cddcd3cb3b93815bc7d6c9e5491a8fab1c0e0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Nov 2026 21:33:54 +0100, Denis Benato wrote:
> How are you applying limits? The only thing that comes to mind is intel
> rapl, but it has way lower limits than what asus validated.

With ryzenadj: it writes the package power limits directly to the SMU on
this machine, so neither asus-armoury nor RAPL is involved, and when the
thermal policy is written again the firmware re-applies its own table
for that mode over them.

Andrei

