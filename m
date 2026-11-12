Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515267;
	b=Vl44uO5I4P7ErLsP7VD26LarHsDWKlIfJpPzpmcszAF0o7d8nj80GeVkHoiNepd2dHhg
	 yJ7Ncw75bEFwyDGb9osRxITFdBNCjOp/2DVOsusElIGk0RcfAYH5FDPC06ggyNjEdf+7a
	 267w0SVD0HR6yWXMCq3Cnb8VXJD5S+4yn58vht9i3vrvr+rc4X62HfUbNRh3+IDFrZgFH
	 XFK8+jQLuaqpeSabblSwlN4Z5qO9Qj5YbG4sRpTrQGoYhjoGWuvHCVKteiAp0/vJ1sjkm
	 QMeEa0jEUO0WE3QViJu87lauDoIM9onUmvAKR+hhBg7jMub1rnXKCOdM6m+aeapKOog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515267;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Pby9+ugpd/biVYGIeo366Q1JT6Si9sJXPgtB9FpXecw=;
	b=XGUNiw6/upWHUXE9RERSaATv6krwpT39DFKG2RRDV03Wo1ZrIbS9VC3FZlhytdpnCdDs
	 twKQkU6ZNTVAaOribHTpW/5CtmR2Oxer1AALcq0oL1KhuKKrrjRzmHtdHSAr5N21fJ7pK
	 //9UkV5pKH6J6uEMhIuc940qz7UqM/R6LouVgl6MeC5h9VcNYstlFx+XCJ12Nh71lmKmW
	 JrL8MVxx+tM7pRtmu3fG3JgKS13J6RKqDzDpkrW7IKoQN6QL/mcdTBdt3kMWIgwIsvEP/
	 hrxU1JB/t4/tO0PcBEPGI3aPgLSijOZ94+KQJ1tATQy1gKSbCevjkOg4sgrjyj9Mv+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=FdLrhflr;
	arc=none smtp.remote-ip=109.224.244.20
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A4606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 20:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF2A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=FdLrhflr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794515263; x=1794774463;
	bh=Pby9+ugpd/biVYGIeo366Q1JT6Si9sJXPgtB9FpXecw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FdLrhflrJbAQJyRy7jtVXJNRTpIgMnuuwIXYDjH3tA6u1/ovYy+2Bhd2mtZ2tjQ7H
	 1+x2/gbv+/VEctdBR2lP3rMVykd5GVgMB7NIvHPvEV6Vw9HQuYCVs32HiyTiqTFDMp
	 QFnfni6VOh8JlJc1SOOFURw2z8VHbinv5QH5yOL13iXVPf5mdd04Lh47eopgIFt2Gq
	 +gA+F7lLrvwiBn7HZsJhMn0kefktIIbaXlIZYanBHHyzrp3RD4coQinXZO71CQ0YIk
	 UOtSy44CSwWS//APvxfnUFOmQ5qT7aC4g7eK2lLgm7ce7Th/p+D2TeljIadooRX1aB
	 Y/zEZkCRiH4XQ==
Date: Thu, 12 Nov 2026 20:27:37 +0000
To: Denis Benato <denis.benato@linux.dev>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: write the thermal policy only when it changes
Message-ID: <20261112-asus-wmi-tpolicy-reply-f7889fb1@empyreal.works>
In-Reply-To: <ec9515fb-6698-4e7e-8a88-5b3fa2f50c51@linux.dev>
References: <20261111-asus-wmi-tpolicy-5fbc4e09@empyreal.works> <ec9515fb-6698-4e7e-8a88-5b3fa2f50c51@linux.dev>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 21f4d5436e436e5e9d59d79f6ee35932e650a886
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

On Thu, 12 Nov 2026 09:32:21 +0100, Denis Benato wrote:
> I don't agree with this: if the userspace requests a power profile
> change the driver must honor that request.

Hi Denis,

Thanks for the review and the explanation, that makes sense. On my
machine the package power limits are set outside asus-armoury, so the
re-apply you suggest would not cover them, and I'll keep this change as
a local patch instead of pursuing it here.

Thanks,
Andrei

