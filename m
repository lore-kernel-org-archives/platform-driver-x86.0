Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393484;
	b=ORf8X4ePtiprj5Uh9j5UDBLjcwNuSRyLW8nAXXbbnH2sz9VbZCq0cDk0/z3iiiyjv/eb
	 mexx7CkU+oOv7eLLMadymgiyrwvsfEnIKML5avhhmIKgqbdTHriOE2hdgFKbTBW2mNtXW
	 WgsUoRu8ku16o+9aZObbVrKgjNm5KifJ/fmkZcPpU0sFdA/omKrfqg9GAvC7YUJVUUENE
	 MKwHO8SwfJx4B4xbVi5lQhS4ApIEQUopmLD+Heq3WXDUnwXsOKldErfwNo+slcVUNF2ca
	 FRQGJ6I1Sj1ILWZpavHIKKeprDzCr8mFzG3oSY3LJ2mj+wTti+5Yo5TwE28lXm4PIsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393484;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-ID:
	 In-Reply-To:References:To:Cc:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Debian-User;
	bh=xbp7pSLhVxMYC2hVfg6GZZO7WIxGD+BRZdBndKeoUgk=;
	b=Vy8Y7q/pyosgIeRWIQ4axZ98r3+hD9EhNsQ1vKwu90YOp7tktJtowfaleD8+8aIijVzG
	 laqwSDVpNvPVPF2mEQuuXdg1c3Kf91huOaxyL3SiW0hZeShmEB5ylsO42Fd3OsOX6R24+
	 LjR0rwQF3irZk6XIPT6SEfQ6QbQ2rdwdrlxMCy8Gaor1DPY4Th4M/fD3beTaJbCv2yAlp
	 dTvEveuphqVTE0i/smEgtD1TuVcES3CAsrZgDSPhq89ZM6EAX383qAvVa+a9Zg758LCZw
	 c+u1GaCfMF8mymynjuFOmWkgzAcrGq0H76kA3Jgf+xBLwuinAGsRXpmtRJnXtLoRU5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=n5nSQ3XH;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4435606A32D;
	Wed, 11 Nov 2026 10:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4435606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=n5nSQ3XH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:Cc:To:References:In-Reply-To:Message-ID:Date:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=xbp7pSLhVxMYC2hVfg6GZZO7WIxGD+BRZdBndKeoUgk=; b=n5nSQ3XHVM/rCaQFZKy4K+mtN1
	YZb87iBqVze+2y568rQ8zZ4v/F4U5cAhzukTQLTCrUgxHG9zIPkIyK/qUlFMdO1TbegC+IGqHQcdI
	0+XEY7F2cgk57Q/Or1yKqeZQ3GzBzWRP7f16FKRnA1zTdQuzRYkFZlesno54soHmOX6BaMKZEpv+7
	oRRkiDyEyvE1wpLXD0ZMhqw7rJHzcWyZXmIDfDQ9qVQ4ODW0yFqDw1mH7Tj8XUUSFU6XZxUvDL9Kc
	1VHN+EkKSAyNs43k9P4pZGuRNuJzqjK2PiHffHwL9QDPpBzpVgLG0Hzb4uo3/2TbayQlFdZpV85xR
	oi58Za3w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <emfox@debian.org>)
	id 1xR5i7-00D7ZR-2N;
	Wed, 11 Nov 2026 10:37:48 +0000
From: Emfox Zhou <emfox@debian.org>
Subject: Re: [PATCH v4 0/6] media: Add the ST VD55G0 global shutter sensor
Date: Wed, 11 Nov 2026 18:37:32 +0800
Message-ID: <179439345249.5.16817789862917866412@debian.org>
In-Reply-To: <20261111095717.52181-1-lsa.uz@pm.me>
References: <20261111095717.52181-1-lsa.uz@pm.me>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>,
 George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>,
 Fernando Rimoli <fernandorimoli11@gmail.com>, D. Manresa <dmanresa@gmail.com>,
 Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Debian-User: emfox

Hi Sergey,

Here they are, for v5:

3/6:
Tested-by: Emfox Zhou <emfox@debian.org>

4/6:
Tested-by: Emfox Zhou <emfox@debian.org>

6/6, with the Surface Pro 8 entry:
Tested-by: Emfox Zhou <emfox@debian.org>

The tag on 3/6 holds across the rename. This machine's ICL2 returns type
0x10 on the line the driver maps, so the entry named AVDD takes it the
same way "vana" does, on the same pin, 0x0A.

Thanks,
Emfox Zhou
