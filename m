Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763550;
	b=4EPCR9H2hl97OBtk2+EW9W8EPMtu8i8MFmfthq/xAcp2JO4ltWgE/YrhwPwdNhLoN0wz
	 Y7/7HpWnBd7Xnd8AZ9n/U/GqlTlKqSoYEljWYPEVvY4duDXhxltpg3swEoyoGwjBg4x9s
	 a70ooRdLfiVpAg0NGbJ9wxEib9jYQKTY14769tPCmOG/8gpOoEmWF270mf6H3qAwwAoEi
	 gv56hsFVhNciNIGc8qP1HWEk6Mk7JzHFUyyIGVBr0lb3E1XVnDThuOH0gQNk6wEikblIa
	 VaSg6OoMjoPm9oyXWTZQpxBoO/O9AfuKd8kgpEreBrSY5BteYLwtHpOuQ4gJfMS3DHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763550;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=J2ft8x2J4FY7KuME5GJZYv2O2j5gC1SVueQ/ZG6KOes=;
	b=ybCCYO4K1/6Mxx/lFwywG4Pk5E3ktL0+0Yi32HVHb67WOjtHXADE2ErNvs0Ln8OCyTSE
	 1Qvx0dIvTMOOVsfqzM+y6CLWaH7WWo7Z5kBqwVo3ZeIh0TtGazAZwUgoeERdbxCtSvZd8
	 zI9uymyLKy0ofCH0wyHVGB9fkVQH/jbK1YzHyO0hzPQghAqHVWUNRwoVHzQDZ5eM3aT/h
	 dkXRjiVJcHXJL76vMFRprctfPnUBXNvAUvugDNMGcspSVCfcmo8uDsKdsZhirEclXuSO6
	 XjxtwPFG1tjsa0DNHy/K4N36t019J1P5EDkjkhiiCSXiCtWNdQtcMZZsTUWREoeJD+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dida.sh;
	spf=pass smtp.mailfrom=dida.sh;
	dkim=pass header.d=dida.sh header.i=@dida.sh header.a=rsa-sha256 header.s=protonmail header.b=eYdb5ZQ2;
	arc=none smtp.remote-ip=185.70.43.18
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE1606A31D
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 13:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6AE1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dida.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dida.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dida.sh header.i=@dida.sh header.a=rsa-sha256 header.s=protonmail header.b=eYdb5ZQ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dida.sh;
	s=protonmail; t=1792763547; x=1793022747;
	bh=J2ft8x2J4FY7KuME5GJZYv2O2j5gC1SVueQ/ZG6KOes=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eYdb5ZQ2j++sjVwm3Yep1kuWfDmjlQxA609QIndrTL44ZEgUur38awNl6+VBrEE7T
	 GdqF9QckiP2CxWGHg+eSD8XNOuhYHvbTTOJ6J72J89M2vOp9IZfjMQ5VQD7LitGyc4
	 h08WEHD7jQeukJIUV7E79wRJOlfJsF0iIr0loHvb6S/j42wqppDiHXT1JEnthCG4U+
	 FBYkL03ZG9bLd2ZWAqFQ2NAPzMgoTvhnGfzddeLlEZ6ED3fXgtJtV81o8eL1rW6hP+
	 KIj9vUozoWTdRUdnap6DJKMi8jLCpqp9sk+h+HnkjtLLkEWEL5mDZe69R+lUe1h4uG
	 lDxr8Lhh6RcDA==
Date: Fri, 23 Oct 2026 13:52:23 +0000
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
From: Dida <me@dida.sh>
Subject: AW: HP Victus 16-s1xxx: Unknown EC layout (board 8C9C)
Message-ID: <86t4tjYbbF2P5MudQXPnxpC0N7t2fMsm9MJQKQkfHNxThJ_ifk5ims6-ldEKeU94H4hoXAOwFFIj9b8Dj0m7BLyxy0AnTwPSL4o7entbkrw=@dida.sh>
In-Reply-To: <R5kRXqiNjPN_iSFlN5Luu8nxQ1YIyNALRvrzyC6U9V5uuHRpu0rkI0zsidX78URViagw9lvfn3YDCtVfBfZFmt8lBiBGszXJWsVSy_H_Mdo=@dida.sh>
References: <R5kRXqiNjPN_iSFlN5Luu8nxQ1YIyNALRvrzyC6U9V5uuHRpu0rkI0zsidX78URViagw9lvfn3YDCtVfBfZFmt8lBiBGszXJWsVSy_H_Mdo=@dida.sh>
Feedback-ID: 218750622:user:proton
X-Pm-Message-ID: 9751a2699c38908ae92915411d2596976aad2fce
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

a short addition to my earlier mail:

Writing 0 to pwm1_enable of the "hp" hwmon device makes both fans spin at f=
ull speed, so the fans and the interface itself work. In automatic mode (pw=
m1_enable =3D 2) the fans stay at 0 RPM (only on Linux, if I boot into anot=
her OS, fans work normally)

Thanks,
Dida





> Hello,
> My HP Victus 16-s1xxx (board ID 8C9C, BIOS F.15) logs this warning on Cac=
hyOS Linux:
>=20
> hp_wmi: Unknown EC layout for board 8C9C. Thermal profile readback will b=
e disabled. Please report this to platform-driver-x86@vger.kernel.org
> I see the same warning on both Linux 7.2.10-1 (my usual kernel) and Linux=
 7.3-rc6.
>=20
> Could you let me know whether this board's EC layout is supported, or if =
any additional information would be helpful?
>=20
> Thank you and best regards,
> Dida
