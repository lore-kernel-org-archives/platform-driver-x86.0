Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636798;
	b=w9H32M7HxOmJO4rBLTIukrdI7w5iCS3hDc8kjGJZEvpaDq0E65K4shpKPRNoX9GJCFr0
	 wJHDHFgX/vi1z3t+izxDfPudXANQ3AT4gkgQvCDtBP663I70CalYaGEHpWtZbcaLSqDJg
	 lY1Yh8HPXCKgSWLqeJFgEF/KC8NxW0+BrxvEBqhjOwrbtfBD+1rPaufMgUQdETio/7U1B
	 XZNwi8t3QSjezFr5fmswWDqdFMEMsyTjL70zeRyIPsfIG5pxFJCYQN453cWHoPI6Srhnv
	 9R9G9HsfNLp5UUedsMaBKjKuet9pcStCeWT3fuHXNClLTYX29yFmsksqQSnSjeaY+7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636798;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ctPaOLlzLbTRkYo6DeDiQF4280pdojOuLUpJCNiMO/U=;
	b=gElKfOa29mt8yRzxzpoSXo0JyWjdNp2sPCoPSQaFUc+xjzQsnmJTdZIs/X4w0IF/dTK8
	 9V7Yes7tfLmD5yb+c3yRJthdyklDs0MG8Sde0BApOLQubLV29yWSF04fyR0fUbHXpSB6k
	 wo6lcTDAf2nZvaetnAiL5dDJspUjBWqFqOHpivfc5SOqzT9dGLoGlhoqItTZSb3agPZzQ
	 3hUQ0FUtt+DvZSJBbaythPU06Davhga/73QlqwEan/A6MTY+HmcznNQ4K9/44UGCnGgPR
	 vlUHWw5LBfBV/U4+Lj0O8UEQCOMYoROyDrnINdEY8d3O+2Ru6jQeaka4s+oS5blx0yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ghoul.dev;
	spf=pass smtp.mailfrom=ghoul.dev;
	dkim=pass header.d=ghoul.dev header.i=@ghoul.dev header.a=rsa-sha256 header.s=protonmail2 header.b=ZfvvEb7d;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9EC606A31E;
	Wed, 25 Nov 2026 19:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ghoul.dev header.i=@ghoul.dev header.a=rsa-sha256 header.s=protonmail2 header.b=ZfvvEb7d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1795636795; x=1795895995;
	bh=ctPaOLlzLbTRkYo6DeDiQF4280pdojOuLUpJCNiMO/U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZfvvEb7d0kwWJ1TeoBjVUh+en0ZDTtAGv661l1qMMOJvlGwULfO8LwYDsc1dGv80x
	 B6XJDsmkGG69HONyc6oHn0I+Vd6HHopbVCztMfVSswUvjX9GKLEwDowNO+gGNG+k1C
	 aILCsZmvjBhjSg8UcazgqeQggSxc4bL8jnUYqx7N/FQ3s9pslxT53t86mEKvniZPyi
	 vYCnCAhcSe7DYsnKKonCN+xH06+uylVeJATu1sowm4Q2e0LFAnmxpO15+ow8WFy8vG
	 ZJyEGnS8JUha2Uby01I2Tog0oumezN9wY408GzAuQ5+9XlC1Q5ROiAL1kzBR8A+4uR
	 ryhuLjvN2/9Jw==
Date: Wed, 25 Nov 2026 19:59:51 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: Denis Benato <denis.benato@linux.dev>, "Luke D. Jones" <luke@ljones.dev>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Yaseen as co-maintainer for ASUS notebooks
Message-ID: <73744b1e-e273-40e2-b52d-9bddc81773ef@ghoul.dev>
In-Reply-To: <20261125-asus-armoury-maintainer-v1-1-053e67858be4@ghoul.dev>
References: <20261125-asus-armoury-maintainer-v1-1-053e67858be4@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: a63be4b212fe37a69f883c3a382d480a20efe5ce
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

On 11/25/26 23:36, Yaseen wrote:
> Add myself as maintainer for "ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS
> DRIVERS" as privately discussed with Denis Benato.

Superseded by v2, which uses "Ahmed Yaseen" to match my previous
submissions:

https://patch.msgid.link/20261126-asus-armoury-maintainer-v2-1-2091821519e7=
@ghoul.dev

Best regards,
Yaseen

>=20
> Signed-off-by: Yaseen <yaseen@ghoul.dev>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba7650cb86b0..ed7c9a249db5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4223,6 +4223,7 @@ ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:=09Corentin Chary <corentin.chary@gmail.com>
>  M:=09Luke D. Jones <luke@ljones.dev>
>  M:=09Denis Benato <denis.benato@linux.dev>
> +M:=09Yaseen <yaseen@ghoul.dev>
>  L:=09platform-driver-x86@vger.kernel.org
>  S:=09Maintained
>  W:=09https://asus-linux.org/
>=20
> ---
> base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
> change-id: 20261125-asus-armoury-maintainer-59689b2f2db2
>=20
> Best regards,
> -- =20
> Yaseen <yaseen@ghoul.dev>

