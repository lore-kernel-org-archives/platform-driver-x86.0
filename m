Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050B231B803
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 18:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749374; cv=pass; b=QGsj3GWhuaT1YLEQezXcNqnL41ZgEtTSTmtHyxVFtSGjIqgOb+aMfPms0Hhp8AXG8ehqY9uWyDse+5MIQKmh3UYrRXFJjYgbzVfZ8u2cAky7Q1vmw62tDI7//32LJSW7xP24/crXgsW5mzBnf2k0RGsnb3aqnC2BcrHNIAjnZiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749374; c=relaxed/simple;
	bh=qvJ03D50VWEiec/+B42dJiOSkqEM0txIWIN1mzmuxCs=;
	h=Message-ID:Subject:From:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N5EcyWHatMnd9t749ojjG7nP6QqWS4OLJH37p6CsfF+eYoNJdz3CMyHKfCAFYxMemkVH1AdUV+jxVGK3Ds/jZHasMfpqn/FU492Gt8OoE8IIJsOZV2TA0eARxxiJDzF5tXSlPuGkw6XJq8tPWJILrEMX7Z46VqnVMrGr/mrJqKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=DU8RH15N; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="DU8RH15N"
ARC-Seal: i=1; a=rsa-sha256; t=1770749366; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E3PmBgIC+97HoaFRbgnJea6f/FLOsypSdLIWH/myK9E4oJ585MaBSQBh7y9/rmKcDutrShy/sAo1KneB0NeG7acIERvD9SyDtAEgGuPHRFT/BMjwG3ivGXxh3e89xtmDiaA646Ygix2y9A80FL+HOLnMy8GNqeRw4x4pnKpCGfQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770749366; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=6J2i2jD4EJJO3Y3S4k1PrSUgT4qLNd8SP/PRHN9UcXo=; 
	b=M/Euu458n30v6xSRbunoM3J3w7IAyrOvQeSxcFN/SOKsrCAIaWziGSWQ4v/W6TXxoWpbEW/Ms2vgxIMcqEJPQnya0J4TsNrqMcKtev4yq3/dAEfFO0fJSY/3ED3OVPMJ8Ei8tcd2G8bqU4AQq1xvnmSkPcSgCswU2OYMqe4gvmc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770749366;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To:Cc;
	bh=6J2i2jD4EJJO3Y3S4k1PrSUgT4qLNd8SP/PRHN9UcXo=;
	b=DU8RH15NpLjxcv8Ilq/uRNCzAfk67x/r97XmcX5wUu6JixFD6JWWsoteI3v86JmR
	mf7pF996SaZFCfEkyDPlx4DxP3h12eWNC4cP5GzM+wezyDWDz9fIzbA1aPqJhO2ZXMY
	naBZZm6p0jo1sCst8cWjgr1Sv4bZdm/Qqj6MpW/do+RtGJkCd78U0aXkB3upV/g9Z3g
	t8QhsPFYKr5lCrvuu2O3HjIlbGwtyZrEU0h+7vPS3G/PairzNCmIIjWAjAyLxlCPlMI
	i6jbAn5N9PsWulLAFSf1HAEsT7egvGCAotvi5/szoQQgdYiuzglZvzmHvoDMqbZEod/
	gBxD7lXclw==
Received: by mx.zohomail.com with SMTPS id 1770749364027147.79809113864644;
	Tue, 10 Feb 2026 10:49:24 -0800 (PST)
Message-ID: <db662672726db1be19f2fb882fdaa4920204bce9.camel@rong.moe>
Subject: Re: [Bug 221065] ideapad_acpi: unexpected charge_types spam on
 Yoga Pro 7 14ASP9
From: Rong Zhang <i@rong.moe>
To: bugzilla-daemon@kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <bug-221065-215701-k16TlArAdq@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
	 <bug-221065-215701-k16TlArAdq@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Feb 2026 02:44:18 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Avraham,

On Tue, 2026-02-10 at 17:56 +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
>=20
> Avraham Hollander (anhollander516@gmail.com) changed:
>=20
>            What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                  CC|                            |anhollander516@gmail.com
>=20
> --- Comment #3 from Avraham Hollander (anhollander516@gmail.com) ---
> I'm also seeing this on an IdeaPad 5 2-in-1 14AHP9 (83DR),  after upgradi=
ng to
> Linux 6.19.
>=20
> I'll attached dmesg and acpidump, but this is not a vanilla kernel, so ta=
ke it
> with a grain of salt. This kernel doesn't have debugfs, so I can't provid=
e
> that.

Thanks for your dmesg and acpidump. I will find some time looking into
them.

As for debugfs, every major distribution have it enabled [1] and so do
any sane downstream kernel. debugfs can only be accessed by the root
user by default. Did you try with the root user (e.g., `sudo -i')?

[1]: https://oracle.github.io/kconfigs/?config=3DUTS_RELEASE&config=3DDEBUG=
_FS

And since you are using a downstream kernel, could you provide a link
to its website or so? So that I can check if it's the root cause
(though unlikely).

> /sys/class/power_supply/BAT0/charge_types is [Fast] Standard Long_Life.
>=20
> /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode is 0.
>=20
> I'm using the BIOS default charging configuration and haven't set up any =
weird
> ACPI stuff, afaik.

Thanks,
Rong
