Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFFE314A83;
	Sat, 15 Aug 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786809657; cv=none; b=PbXuOpJla5MkBuodOyMaqmk1mbOAVCH5fTVfUk5hmCsUg98YP4vAxPsO6ol7chSimRLtVwWe0TGD6eO1ELOf1n+y4NdTzuLn5u7DYM0UaUSonzCecoi0rdeCw/DX4Zes3rKgKj3AdU56nzfKvLJzeftbaL5C3YKMqjb5Zw49zmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786809657; c=relaxed/simple;
	bh=WDGjNkSQYh9hGpqpIvBfiS5/CPCdymNxtZAhjlJgaJ0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pakzoB8hL2hQrPuchFrPppYxPFmuCJ7zmhKaPQSHPJM2W1EsqW9AtGqSAv4rR/ztMiIdUClz3Sd1kT5Njo/Z8jBscBWcndWsZAsemShGscsWKuaJGLddaKaizAZQybeGZMi1VtuQV4n8s1DgmllPV87ICOZnmspflrSgamfCNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com; spf=pass smtp.mailfrom=rsplwe.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CRUyDj/r; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="CRUyDj/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786809649; bh=WDGjNkSQYh9hGpqpIvBfiS5/CPCdymNxtZAhjlJgaJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CRUyDj/r9MzrPUdN0E5wuOmEOi1UefsM3RLKBye63IvLc0ma3FUZKwbyrTzQD7Q82
	 bStEugh9GpGWhHF7dwg6O1Au8TxhFdutNEq72rhBMJBnQOYn052DoG/YxrEOyALIIC
	 dA75zO1kKtSA4PFxapywKJEZsAzNx0oQey2Kec0g=
Received: from kasumi-star ([120.235.60.96])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 2D32047; Sun, 16 Aug 2026 00:00:45 +0800
X-QQ-mid: xmsmtpt1786809645tkokp8szd
Message-ID: <tencent_70E0C23A878562330ACF7D5F68DB736B6609@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTkEY8a/Nb4h8x5MYIa8YPxqNqdTt08dTMY+j8QIesYIcw691HHis
	 2Wl8E+sMP5T+i7JQGa/EitA0ESRz4budaIWKlvv+iX1nqC8rXsmkmxDDuHe9CkX47nwRYTieYQJS
	 gyI3Y8guWbq6umN3HbI7GwLe62X8xohKMBdbV4pzMLxBi2yIyueLPm/OczRmTstS9NHiYdW3kFx9
	 nOqjdx9Zm/PtA5yz9/DD/Madd6mkCYOnnQbEj4u2cleGRK1QU6MeaN0o9zWxcSoV2FbEQnPob3hF
	 628z4kzXbva5YF0L6pe/RkAMdQngiZx3F85Gb5+suQGSzJN4OyRde5oNFKoSkfeO236rtiKweeFi
	 Dcya7VfEA8A2W4D6pRK9zih7i5524CWmfwwM7VHOQDK1+nzBFREf8OHm0Wxii7ImCGcLLtWCskpG
	 SCqGc68JyBU5F9IILQ6mHGSWO0IpUAd+bq1FK29xq8WTtdEk4C6Bus8SP76dafUw3334QryEgiFp
	 UHl3NWSZRAoMVI3qqqtutD7IFqkageifQcVb34jfLIFWuDb8qHQ+tDNE4oF+7qEyyT75J5eCot/Y
	 cEcO+CocZSLe15MkIlkhPuunuFH1MiIa0UjAn+SmEPrZFQNo645TAYxVIBQGoKyCGDC7zH1NVOFw
	 tujw2DlQrXdTz1Ttv0qo3Z9y63i9SHDqfl4BKvCdCqoku+Hx+7XqDYCzFTGyudX0E6+AZl49+CSx
	 n8LPUwu6s8F64D/JXYslA57KTfQjiqjmv41im4xSkOIocmM7NWdUVIDmIg+D0GJsluxrRBkBvD1A
	 TG29/50nWLI+4VKVH7nQkileEt8UueB8SQyxzJzrnfV8LP/BpE4/eRT5KYIVXAHL9dAoSR6rg/bx
	 RigjYkcewC5AMBskgmj0P4jVwSKXguEqKPvHp9a9KvBwx7XALRQiOK7EYjo1ZE+JXCL3hyxVBF13
	 hfS2ZLE1iZC6BNW+25wa7Ju05bEzvDxe0Eg+KO8iVpwOWz8ZJwRGd9VGnUN0ReNQaIBGu89WMql+
	 LVb/JKRGvLB5MPqkhfxTwmsnUJ5kci7y8CnVOoqw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Rsplwe <i@rsplwe.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	i@rsplwe.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	wolf109909@outlook.com
Subject: Re: [PATCH v3 5/6] platform/x86: bitland-mifs-wmi: Add per-machine ops table
Date: Sun, 16 Aug 2026 00:00:45 +0800
X-OQ-MSGID: <20260815160045.5043-1-i@rsplwe.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815132547.29022-6-qby140326@gmail.com>
References: <20260815132547.29022-6-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Regarding the handling of `has_full_speed`: when a machine does not have a Full Speed mode, `PLATFORM_PROFILE_PERFORMANCE` should still be exposed if the machine supports the Performance mode.

In other words, the absence of Full Speed should not make `BALANCED_PERFORMANCE` the highest available profile. For machines without Full Speed, the expected profile choices should be: `low-power` / `balanced` / `performance`

where `PLATFORM_PROFILE_PERFORMANCE` maps to the machine's highest available performance mode.

Therefore, `has_full_speed` should probably distinguish whether the machine has a separate Full Speed mode, while the profile choice logic should ensure that `PLATFORM_PROFILE_PERFORMANCE` remains available when Performance is the highest supported mode.

