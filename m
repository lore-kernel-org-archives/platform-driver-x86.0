Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3203D092E;
	Mon, 31 Aug 2026 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169223; cv=none; b=lSug8abYNMYfIIHc0+mud6k+DNCU5r6O2cOUvwAJqhLT4SnoCN6ifns3x8FD5uCSNYO7BqQ59xK97Oi7IySoGNfHLVjFUwtxzzzD3wC7kdWPF4nqMqfNMVLdD56Svb6dMv1TcAVP01p44VWYi8EJ4d860vk8rfmHsiEwiCuMN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169223; c=relaxed/simple;
	bh=5VmL21RBLlEnHFw7eDV892tZlO9+3z4qE8C9/5OjTTg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PeaUVTN4ry3glaQENl9UDgiSUF0hTmf55k3XAZQHIsDQ0wJvB9m09ejR3mWoVvuCnl53RYu7ylYNLBiZXfVMSNfP/ZkHdzstjZKE932zAHVQy2bqXf2RXHF9O4k08TO9sEEOYF33vZCOMrHdOS5NRz9ZJNWtvXIKCj8uwNPNNAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=hMcCaX1J; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="hMcCaX1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1788169212; x=1788428412;
	bh=p+N3EN9ugcSj4L5L7pgZBZkzLLv55JzmGyJouNn528A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hMcCaX1JHNckGyYRZW0yykuyEx4aZL6HWJSLR8sf/LWhGROpAb3+VvtXiVZp28Ycw
	 17PLYvJ8dbJwqeUOdakynJXrzFbbmRQAMXdZj0+eUQv9O9e+zi4MojBkz9mnfPyYos
	 /Hijs9f5BfYyy7abYQv1ALFoJG3q6TRPU5/2LfaEpRyfcaPfhPtjuXe+ghvxBUfCOd
	 sF68k1l9wW+hWWhj9ML+v7b+tHkjMZuC9diwnNXxtmYj0BNQ99pc1xrVy+Sxgr4o9Y
	 fXWXm3Ixi464F7HlimEQnH9bVd7iUsGh9eXRmLqiJ6CgPl74xov3xRo0RymI1tnvOv
	 UWgBFmxWi9naA==
Date: Mon, 31 Aug 2026 09:40:08 +0000
To: Hans de Goede <hansg@kernel.org>
From: Jakob Berg Jespersen <dev@berg.pm>
Cc: Sergey Lebedev <lsa.uz@pm.me>, Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: int3472: support the POWER1 GPIO type
Message-ID: <2aWW8RcJ0AWBVqtpMnH55sIcaRQXH92Wl0D0PwCESRqd-VCbKzAgoeZL2iRpNOc-RI12oaV4iS4vvKTEKP7DlpiakCasB1VH17BewMCLJSU=@berg.pm>
In-Reply-To: <df2f3cb1-1bab-432f-a359-59e6bec9580a@kernel.org>
References: <20260830134126.70277-1-lsa.uz@pm.me> <xwSI6AZy8i6fOp48SxKkCmFiG2NNdkRtidVqaIi0VsczFe_1Kh9UUuamWCuaSrVXpxPO4YdGgNfeWxbpuFns_VUTQfUCEfCTFTD1ARbH9mw=@berg.pm> <df2f3cb1-1bab-432f-a359-59e6bec9580a@kernel.org>
Feedback-ID: 210104851:user:proton
X-Pm-Message-ID: a410ea8f16e9482a73e10d121900f3ba56a736fd
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for clarifying Hans,=20
I will leave v3 as it is.

Jakob



On Monday, August 31st, 2026 at 11:34, Hans de Goede <hansg@kernel.org> wro=
te:

> Hi,
>=20
> On 31-Aug-26 11:21 AM, Jakob Berg Jespersen wrote:
> > Hi Sergey, thank you for testing it on your SP11
> >
> > Does any of the maintainers want me to send out a v4 of this patch wher=
e I include a commit message with this limitation related to ov13858?
>=20
> No there is no need for a v4, the ov13858 problem is not a problem
> with the INT3472 driver, but rather with the ov13858 driver.
>=20
> Regards,
>=20
> Hans
>=20
>=20
> 
