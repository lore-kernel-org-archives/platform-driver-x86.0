Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378847;
	b=Wd4IrjR1e7CIEYqGuqeBZl1aSt5pmtqN8hHRdNuCmPMLLAAbmp7oshEbnAKXb52FHd+E
	 SAZzq8f4H0DLtBYsE4zHwJXJb8chPGHaRZFWli/oax64RPuI0o6Q/WsUX+a/urdaQhSRh
	 XH8c7HNCaZlVa6QvOHETaHso1paZk8xcvu1S2MIIDypmcAdidd+gfL+A3NI/Tb3EgHzpd
	 HDtEluUHNfVrcPK1NAVMPmG9fwzmS7nH5XZLqHwg72maI3OJSa5CD5/YmCBjzUSa+PlCt
	 zn5iAfQpI2suqOfJmbq1i22syhsIav+EahkD5q4rfNgDHPJi4WEWd+y2286vNlxcApg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378847;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Wf/iTe9pX4L/jZu7Xph7OgCfAvGN68jDjp1bp7bfRVM=;
	b=oi5Ou06fLVQiOcpBsl1JlB6BojiJOQcODHWO3RyfNhf3B441S6XW8DFbaVSyH6alcr4X
	 pc762TLwu/kE+a7JNr0YeHmSRVpofBsOPZ/yXD7CDGXcCjy5kjhjPOB+1IQZ1Zl7Jbv61
	 F3mX6udDmXldHfmC2tJhJMGBGZgBZZwFfPSwgppGUXm+f44bELNOQKcH78b0zVx+VPZ2f
	 Y0dS5AbO8wq8XgN6Oomw6MM22tYZtiePR4Ezb+jGQmWhAOEHZKfNAfvC9ohHTVEEzz8ab
	 ZrmJ4Ld7gcuQ6FRFXVwT0/D7DPxsl9uSExI66zG0RuaRLLjZuYHtYmfjo1XRR7W+KPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QLoCwMfp;
	arc=none smtp.remote-ip=79.135.106.121
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EEA606A321;
	Wed, 11 Nov 2026 06:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EEA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QLoCwMfp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794378844; x=1794638044;
	bh=Wf/iTe9pX4L/jZu7Xph7OgCfAvGN68jDjp1bp7bfRVM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QLoCwMfpM9LRKb7MQE1nR0jsr3FKwsjAJJkDEmpXH44Yp5YJOABhzzW3CHtCNEaxr
	 M2875Gh7Sx4tQAAOZU1FrTb+IrXDBPLfWD/z7wdiYxd/uzq8cFTdfEC66ujV7SKLc2
	 SJqxOLHWIvRDPxXIY07N8wJOwHOoscmtuqBkmN5Kk/jlgO7Hz11raFiVWXxncDDP/g
	 gUHDa88w3i4fJRcRem6mbb3Q+N1EUfm8GZW2ZVn4WX1wnySRlcV/OYDN0if3i0GOHx
	 2wTCzKge9lrmtZfNXFtP1a5Y71fJBWIwth8rhIhAa6yV22ZLXgDigU+0uLJcTjTN5R
	 bX3p7Kujc/RWA==
Date: Wed, 11 Nov 2026 06:33:57 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] platform/x86: int3472: Map the VD55G0 supplies to "vddio" and "vana"
Message-ID: <20261111063351.96951-1-lsa.uz@pm.me>
In-Reply-To: <20261110195454.48176-4-lsa.uz@pm.me>
References: <20261110195454.48176-1-lsa.uz@pm.me> <20261110195454.48176-4-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 6879e178a9ed61d0489c95e0d779dae40845883f
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

This patch is on v7.4-rc1. On media-committers next it needs a change:
Hans's series, applied there on 11-10, renames type 0x10 to
INT3472_GPIO_TYPE_AVDD, and INT3472_GPIO_TYPE_DOVDD is now 0x0f:
https://lore.kernel.org/all/20261020142243.25072-1-johannes.goede@oss.qualc=
omm.com/

The patch still applies and builds there, but its "vana" entry then
matches 0x0f. Tested on the Surface Pro 11 with int3472 from next: as
posted, the sensor's 0x10 line becomes "avdd", vana is a dummy, and
probe fails with -121. With the entry on INT3472_GPIO_TYPE_AVDD, the
sensor gets vana and vddio, binds and streams.

v5 will be on next with that change, and its commit message will simply
say that int3472 calls type 0x10 AVDD.

