Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479558;
	b=h95r/dfqhT+NC0A5OL9nab9xR1Lu8hn+zNNOUb3agyznbUc05DxoboyXrxrH7uSLxQqD
	 0sfz8fAmm5Y76VVg0modA9OpKESQ6ntKhGeLv3AA4TiVAm0zcKtYlLqTBQJlAwNFKxdWT
	 UwqOHogWbrQPIaThOs1h5YWMNWhdnGBDwC4bY3dEyhBcMl3Qx/smtP+d3aJ6mV9XG56s0
	 +vHnEnVBRLX6/VfEqITtefCV1/IzA/hIHNCfneukXcv6uh+8Bax+CwxqOyrSGZrJw1sMw
	 KQBSf0TGsOkCn3RAoyCULYmttTm7vIa7v/s0ScGVhM938+UJBY/Hf/gDA6FdS+kVm5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479558;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZAflOofuGLk+nbttWuf0w123n/5uVVzhu34kZHp6h+Q=;
	b=rmCCWK0+bvsQAlNT+eLm/iJWnJznhKbZiCWJR9WE++G+oUM4HddbXT8e5ySpcJ10g6pa
	 4evyCtbQsdprRsucDyVnLfFk+FH10P2rtwge3NhmA+CXAxTrnSPQjLbmStIETwkQUmTym
	 qtqNXlo1F7JHFvEtZQNKo9LSBpxp9MCBRKO6b1H2uxLc/J8kQQlBVA0DEqNu6C3LlfGzM
	 ioyqVPAsuqSoqlz9hPx2rWF5Y/lcSbsBKbV6T6bqygCJc4duf5jWA7Txk2QrM0x/Kb6B9
	 sJLeX6CJ/jQMSPRXKEZBzUP7lvcimUDpDHUUHC4elunrqCz6DfgsZxIo0RkkjeraxkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="cWP/ZN0j";
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C9606A31A
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 Oct 2026 20:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=cWP/ZN0j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793479555; x=1793738755;
	bh=ZAflOofuGLk+nbttWuf0w123n/5uVVzhu34kZHp6h+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cWP/ZN0jWPVLm9shVbf4ZhpalXX1r6WRS42dmITcbFMPyZjJv4VXu6pukTqeQldWU
	 vYN3RKSolAZgYSr0rKgI6eYieebYdlwmBgCrjSiQCfxoWaHxH5Z6ybs0g6TmltJ4UX
	 K2RgvZu1+4SZZSt4SPSVRSOO9lyIIsDr7jiHLIKoJYXgJPh5tz+FUtlxMLighldqz9
	 ue9J74nug54kswyBtUmSFsG7G73oiukilXXpt0pQ3WvOwCsNDNlGQka5gB7OB49ADy
	 sF1gY7OHeOJr31kUHg7xBD6NRpell/oQR+rWw2ljO+leotRGIlpBFnoRl+GMTsaBkf
	 X6MfpmdQ2cFcQ==
Date: Sat, 31 Oct 2026 20:45:50 +0000
To: Mingyou Chen <qby140326@gmail.com>
From: Arsenova <7z0423arsenova@proton.me>
Cc: Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v15 0/6] Merge redmi-wmi into bitland-mifs-wmi
Message-ID: <20261031204357.157958-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: 9352d5be9697cb68f48bd7521b6575954ea16758
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

Hi Mingyou,

In the v15 cover letter you say you have no Redmi device and that
tests are welcome. I have a Redmi G 2022 (board TM2135, BIOS
RMGAD6T0P1313, Arch Linux, kernel 7.2.11) and can test this series
on it, and later versions as they come.

On October 23 I sent you and Armin a report that bitland-mifs-wmi
does not work properly on this model, with details from the
firmware's ASL. It arrived during the merge window, so it may well
have been missed:

  https://lore.kernel.org/platform-driver-x86/OT2JfRLDi6yHShYvywRZoFBYdW-TU=
gdKqKtahRM5b0cZxNo6eGZHnO5dKf4oYFaEtZhEsqU-Q-2OFe0D-qToJMVUrS5_d2aa2Q5LD50I=
SIc=3D@proton.me/

Reading v15 (I have not run it yet), the quirks table seems to cover
most of that:

  - skip_ac_type_check avoids the AC type query (0x1300), which on
    TM2135 returns a bare Integer 0xE000 and makes "performance"
    fail with -ENODATA;
  - accepting function =3D=3D 0 in Set replies matches what I see here:
    the EC switches mode, but the reply carries function 0;
  - handling event 0x16 as WMI_EVENT_PERFORMANCE_PLAN_ALT covers the
    mode change events this firmware sends.

What TM2135 would still need is a DMI entry with its own profile
table, because its firmware uses 1 =3D balanced, 2 =3D quiet and
3 =3D performance instead of the default values.

If that is useful, I can:

  1. test v15 on this machine and send you the results, including
     the Fn mode hotkey events; and
  2. send a patch on top of the series that adds the TM2135 DMI
     entry and profile table. I would base it on the base-commit
     from your cover letter (9d3475065167) unless you prefer
     another tree.

Please tell me whether you would rather fold the entry into your
series or have it sent separately.

Thanks,
Arsenova

