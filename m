Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0718A3822BF
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161007; cv=none; b=Deo3UXMM0tFRYdhcL83vpq0Th/Ayjo4rggmnoh6g859EQF11oyCTH5DlDkYsVadCKFuYBJxBpT2x6xAOF+m25hQl1gPY8+96HYzPJPMHygutI3LE00O3Ow+ON4lNW2rzltv1YsNF3sOsFj4o0k+A80b4bL7Mtt1lwyvKEfHteTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161007; c=relaxed/simple;
	bh=33O0YnyipeSJUmepqp5PMqMgUm6dy3niNvq40NaPLL0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R85M1+9vSBUjAGDyTMjtWohWZlqicu6B0Dl9EXhJHpaQo8FnIJPPleqDhzdtVU7rE1Fti85yHqjWeao/FlUr99uzgnyLdCIkrI4VqPQ4ChEucr1fvFLKz0tL1EO6GdMV8HOtKNw1hi8UHKteWA3u+sUUEqvbwRvDM4Sjs6wH4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=cM9exizd; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="cM9exizd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792161003; x=1792420203;
	bh=33O0YnyipeSJUmepqp5PMqMgUm6dy3niNvq40NaPLL0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cM9exizd2a21k9YRnKg6u48BmL08QPjXcsl32BoTW81ssK3QFekquvLX2tCFvZVdk
	 nYKluTq66k1yCPKONaNqJ+lNTQSoQd6pSlEoGAoPPU7zz67xpw9p6wZSJHmgYz8njz
	 UJhM9FRSpT27IJtEfWCbntqBOsPRTED9qO5TJYqvcCij/H6M7F9UrFmhdWcvhbv162
	 59wvHgXrzAIbF1v3OwfTx3nAy7L9foK1LHFjgb7jP0YbieiOWkEXKPwGGo1DRyb0bK
	 nWIBJPUQTfhSKoS1e0Jt8kPNR11n7kftVLAnlZ78GhxW1sgrq7Gxw1oGW6Kgjn+Jjk
	 Fh0i0TAM7EE1Q==
Date: Fri, 16 Oct 2026 14:29:59 +0000
To: Hans de Goede <hansg@kernel.org>, Hao Yao <hao.yao@intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Dan Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Message-ID: <20261016142954.60684-1-lsa.uz@pm.me>
In-Reply-To: <df3724fb-1ad6-403c-bea0-19856b11635f@kernel.org>
References: <20261016112744.39905-1-lsa.uz@pm.me> <df3724fb-1ad6-403c-bea0-19856b11635f@kernel.org>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 92f3b6dc9e7235df9ec428a1e4b6136d99813635
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Thank you, noted: if I resend it, it will be based on media-committers
next. The v2 applies to it unchanged, at d7e7bca7169, which is the tree
I tested it on.

Sergey

