Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391057;
	b=aANh36X0vGawCZJ9orJrQMzEpGQaTCnNxYUajOncVnREpWgeD4brztlyr+dOMPckXwcN
	 NiEgxTeKNEIHR0P12TU4SAq0YhcRcms9pFzcXT4sJ6SlQqLC9OY/I83wM71Kwxn9xMIVM
	 MTQ3/U3MxQCwBbyoB2tjLYOSl3ags3eEFPWb6qleIM95qXVWrehel1xN/TGCjvSE0QSAH
	 cgOFuI61cNw2yhN5iG6CQoL7+/xD1iesyvzSk2Sm4avnpMZp4F+XxoPK4Epd29zBJUJPm
	 8f2nDxtia7dYSD/Ns6a+LlzFnbFKIqu9p57Skock6WXPaKB/rqxECQqzsevtP1SyMbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391057;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ee4yHCK8M1GzmysXRLc2uH0TnLVx/VLePg+e+5PvWNE=;
	b=lspLS8jdFQ1Wqb4o5wtSm0gSWj4O0TMDu8V27FF71nQeRzLlonjIRTHCWC9Sr25iwSZm
	 TN3bs0L2UvQSQCuHpSqWVO91zS+4JKYRTHI520yOvjg6/VPSamjLN5Des2DF4PtYBmzIm
	 KEaDz4gd2n6zUZSdN88xuCAdtPgZmVJiFRhn2HpJLSlq+fuZAEMR97ZxEwVWv+Smsx25o
	 //QrjUqB6RFtyTGwOSP1wEBkkjjnt3nCS9uLqVh7kRrw2Ik/cxboIsH/GM2DgR/f+3ppB
	 9fWvv665BH/Z53KugO/3kSNS0vGEZRyngmr2z3Fj7dY1UJgE4WsXjbMiegMAouBpfjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=m4t47nr5;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD73606A326;
	Wed, 11 Nov 2026 09:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD73606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=m4t47nr5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794391054; x=1794650254;
	bh=Ee4yHCK8M1GzmysXRLc2uH0TnLVx/VLePg+e+5PvWNE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m4t47nr5jR+D1TYRq5yR3mAsEtIr/lm1dhRb1f18JZR0Jk+rFtc3VbqfZ7JgkIdad
	 0NT4XaxzqcTrrkmmb0PV0qf5+MSV/i1m8YNSfp3OoEzPOGQBboo2qRT/o7G3TJoAzd
	 HjLDKgfinQKhVwP1yc564mSpa0thYZthpzSTdvjXjn8+cE/7iv4s5pmfj/l+zTNZML
	 YgxDAzX1Np5X6Y2dDneNnuVQ8bqgh570WIjvPFQnAk3gm4GfmIgBUim1g19B1Zp6B5
	 3QWdLKsjpTc2Z+u8yvpFwAestDExvHpCEBWbKhLmh2l1tfEA5pTKUJglKO+m2Rait/
	 VWWta+MkCh/hA==
Date: Wed, 11 Nov 2026 09:57:25 +0000
To: Emfox Zhou <emfox@debian.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] media: Add the ST VD55G0 global shutter sensor
Message-ID: <20261111095717.52181-1-lsa.uz@pm.me>
In-Reply-To: <179438997668.7.9005518768995826598@debian.org>
References: <20261110195454.48176-1-lsa.uz@pm.me> <179438997668.7.9005518768995826598@debian.org>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: cb4bd0c39d0ddfd686146a1d749335718ef79166
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

Hi Emfox,

Thank you for testing on the Surface Pro 8.

Yes, please send the Tested-by for 3/6 and 4/6. v5 will add the
Surface Pro 8 to 6/6 as you tested it, and carry your Tested-by there if
you give it for 6/6 with that entry.

v5 will be on media-committers next, where type 0x10 is now called
INT3472_GPIO_TYPE_AVDD, so 3/6's "vana" entry moves to that name. It
maps the same line on your machine, and I would keep your tag on 3/6
across the rename:
https://lore.kernel.org/all/20261111063351.96951-1-lsa.uz@pm.me/

