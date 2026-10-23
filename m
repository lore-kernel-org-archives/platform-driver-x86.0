Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763372;
	b=HCSCSjfesBEwOi+sUY00MTWf+OZV6bXLvZk0wULpvkIrRsAjfRJa8AVI/D26ADL1Ur8s
	 qtArzMVw+nfC3qgsBNTEN7lWVPAvfjd+D+jqcTMIrP/soDqgjdEjt3BYs7Zymbp5I12sM
	 fGLRNoieNb1uvhcbNBKquJEPsdQkB8NicZ9N6p/xjnPtDCtQywUYqSkDgXU2npkbFnR2l
	 hB5aBFDu3xQL7o5OiLZu147wyEU4DTE8YSzgBCAhNcoNALG1385iH4JmV4Hlh9tNgDFZX
	 oe48AbiLLjOsqz0C7b2tb774WlmXv3sUjkezHlsAg+yev8ljGPqGdMA+ecEzwfVe0OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763372;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fSEl1AN4zQNTyv5206mqJXVv64V57+B+2rBUHNR2vRs=;
	b=5DWOM4w1W1y7XMVe/WuZG3dQunz4vIe6YZu/nX21TVxdr6OA1Ak4VwK1cvBg9QSwCjSi
	 ZElJcHQkmUAk/TBDR0gbgmZZIH0eV1zS7ezRSo24SibMAA0+BZajdwuKhqXhHyN2OMUqs
	 xRoOgRDOeKpHwVVLKips+wHIk98yOoQMtstwGBWphM2yu/nLj5w/ySiy1DBuUZaAvbUV1
	 hvO2dt8HcxtUWbu7k86SKht1uLVkN2Rh5gjVKbGuiHpxNnZf/MbGh+b7Z1x9kJwHib8Md
	 Bn5DUzn+CpxLrujWZfqL9ARMS4cCtuudiV5KVwdKlrK0+L5IY7J18ncNoDThQdpw/cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dida.sh;
	spf=pass smtp.mailfrom=dida.sh;
	dkim=pass header.d=dida.sh header.i=@dida.sh header.a=rsa-sha256 header.s=protonmail header.b=Z1BDZ0HZ;
	arc=none smtp.remote-ip=185.70.43.98
Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0447606A31E
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 13:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0447606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dida.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dida.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dida.sh header.i=@dida.sh header.a=rsa-sha256 header.s=protonmail header.b=Z1BDZ0HZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dida.sh;
	s=protonmail; t=1792763369; x=1793022569;
	bh=fSEl1AN4zQNTyv5206mqJXVv64V57+B+2rBUHNR2vRs=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Z1BDZ0HZcz95Spo9ff2NZkZ5YrGDeeeQi2/CtpkD54A5a2JueZ/vR7Djj8ujc6epi
	 gHx/Td1J2G7YgdmsX4/UFrBPGdpX8sGrSoi8PuW/PYcoI5QKXY4GloL6MmV2txhIiU
	 E4+5xMDrrDTBHW3V0lecoaZoy+j9260qMU+UCHEYif9dhksP2NyHD72JsxqujZs8cm
	 ISvRFcVxYG1qEvE00TZ9Oz8f5cUOqaTZWeT0pfBogfkuHoOOKYYhEpYcFSxgj155/9
	 7EaPfp4ae8kfYDG+3isFjGuhQ3OiFA2VwroG94QdnWnK/x1YBCwslyVHrBgFR3bWhA
	 UWHexsB5KljQQ==
Date: Fri, 23 Oct 2026 13:49:22 +0000
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
From: Dida <me@dida.sh>
Subject: HP Victus 16-s1xxx: Unknown EC layout (board 8C9C)
Message-ID: <R5kRXqiNjPN_iSFlN5Luu8nxQ1YIyNALRvrzyC6U9V5uuHRpu0rkI0zsidX78URViagw9lvfn3YDCtVfBfZFmt8lBiBGszXJWsVSy_H_Mdo=@dida.sh>
Feedback-ID: 218750622:user:proton
X-Pm-Message-ID: 74c95086691a12c1a68c7d7373f43614a43fbd1e
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

Hello,
My HP Victus 16-s1xxx (board ID 8C9C, BIOS F.15) logs this warning on Cachy=
OS Linux:

hp_wmi: Unknown EC layout for board 8C9C. Thermal profile readback will be =
disabled. Please report this to platform-driver-x86@vger.kernel.org
I see the same warning on both Linux 7.2.10-1 (my usual kernel) and Linux 7=
.3-rc6.

Could you let me know whether this board's EC layout is supported, or if an=
y additional information would be helpful?

Thank you and best regards,
Dida
