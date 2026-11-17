Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954758;
	b=SOLSZ3h00MCIVOHEZuY35wlNi/4K0MRF7JSVJXooJWQIQwKBY8/Q3fiPdc+QmIa9AkCH
	 O9/96OmcgTsBwPXH6aPTswRqK6zAzjfCfQ5hPAuQhJqcRUdxQQNGiQm+MYYlIN3+4UuZK
	 NroBGNQci06g6MO/MRYNX0294831bpYAs4kZRcSpeA41BNnppxCyDp1X3FLXCD3EHt3zo
	 o2uyeTx8W/gNVGdcosJYH53CD5/ndy1OzdllAkHEqSfcigxc8Hn9LhuLk8DxMv8dpEX0V
	 ScxN4ctcT5OyKxkK8E3lAIrgou/vxQgGiNtfZ6h3W9KHiqumU5DCHi//mpDRubdnv5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954758;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=PpR1rIGXMu8V5mFk/2ZfcnZZfQ9plWQHvtsGWc0msa0=;
	b=qmAbffuE5m10RZyudONOhfoGCbfJsVKauFjYYt1P5ul8H6Bl+IWuqKiChwOrJq8yaXRO
	 STysAOr06YJ+nQqdjbP2YHM8FZFKQhMZDbYMb4oC00CeyrOTcxOkx1BOk8G7H0AzrBOZ2
	 t8lkALFnl2FzMSvMZte0iomdDXkDmShCIVP4DX78phkPOXbHZ45UAaQdSDzGUmVtqs6U5
	 o0c92S+4Ccq21j/b9EmrBL8DHrVepSeGkkjPYwTBDVvLb2HF9eJpqMhmnSy9e5wW0PM2F
	 vji9HZy7u1oGnId6jl/H6gNzAbNsA68VszDWUeOLf0DEgLMeRAb39GD3jAy1Pkkn9WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=DJRYYgkB;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86703606A33F
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86703606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=DJRYYgkB
DKIM2-Signature:  i=1; m=1; t=1794954755;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:uJOr03gXSaWx1El/U+pYsTnTqWNd
   +5aNbqAI9+uPQgtk4YY1Uapnm98QcJBtiJ4DUmOeOLH5frXwJCWARX0M1P3CYv8wVK+VO4dXPKm
   m+CDzkYOjq6iPDxVohH7quRBi4kEVJs7xKQLK6jJSiFVhLxbNx/sy++Lth1KJ05IHUnFdYJtIGK
   7rYseIPmLV/RjguvXujLMZ8PdX/MnPJJai/Ze7wFRDBxXF2rS69QIvqEwWPyZF3bIr73uAqbVlU
   cCnqJmXyQl30zBIjHwg9vAbN5pTQeg3VezUQnSkWZJrSJMn6PcjgsEA2WNgwmZiyKRLiI+nIXqW
   fCH/sVvTdc/R0Q==;
Message-Instance:  m=1;
 h=sha256:
   lF33lsANSs95QTkoo5/n1Nzci9hDOwjcL6XgLJCGu3w=:
   NIGf7RBcW3tMQdnTX0RchxOeXQSh/0zNb6gpWvoyP1U=,
  sha512:
   KKZ9Z18bxl9aEuCXChtaPUT9dS8FOAzY/16cLJOAXBKs0M4hgKV+trUlCPvgJzjx0Xq5qWl4aYkepsB5rnCa7Q==:
   0WaOj36e87AUjK/y6xTtA4extk7VjqNjQY9L/YBNAVngIerfgCisEps4Puc++aYN+009CTyhqeg4P1au+NH1dw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794954744; x=1795559544; i=w_armin@gmx.de;
	bh=PpR1rIGXMu8V5mFk/2ZfcnZZfQ9plWQHvtsGWc0msa0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DJRYYgkBSAuI3XIFOTnDYRYVRAWxl+NYedL9B255V6j8YSKJYpShlWoghY1vLqOj
	 42K2HDLaZ4DOkwD6G1AOvXRQ+Px0WJ9TAz0dCt5ii8wrE/2u5dYT++LuFY4g4Wsc2
	 XFg4VmB2+dyiJlIaxTojdkIL+uff24UD29ga+fGk9lWF6zDvZu3lme5tmX12+vQIV
	 Sv0jHa3E15LtPEWPoSg2YqX4vQYtzqYP1a1j5BwMGywAFhhD8lygTLPY1uqhuvKoq
	 N7rhPheFpt4/SB+sSKCnK0KgRaNMkTeTVJ6J4BJsP+IP20FRb0WpOb4rIdFCA0DTW
	 l64YxzQafpL61KGG9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1x0XlX1Trj-00TPUT; Tue, 17
 Nov 2026 23:32:24 +0100
Message-ID: <26f1d116-479b-414a-856e-290e4775274c@gmx.de>
Date: Tue, 17 Nov 2026 23:32:23 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: lg-laptop: Fix input of super key
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 helian.caumeil@clever.cloud
References: <20261103180750.228116-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20261103180750.228116-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:446J4OA2DkdT3ok+EwJO3wCw9fnzAABcHWAlbncmxHn8nkQXks4
 rZFXKFzpMZT12tY+7auF2ytJ8EkwdIFS55RbOkusgchhzPHguqw3SsrcZgUeOESzYqvNOQ/
 8Rno4PaCMknT39mJ+2a1qPSIOLwHZd4T5OH5ouwBSNL7x6re6iK2+L1YAWiU2jvepNM+3Z+
 orvP1lkhcgesLu6U6xUsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x5v0L4mxRK0=;CjEeDvX5qDD6x6XisN6UFtu/30s
 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

Am 03.11.26 um 19:07 schrieb Armin Wolf:
> From: Helian Caumeil <helian.caumeil@clever.cloud>
>=20
> Some devices emit special event codes when the super key is pressed.
> Mapping those events onto KEY_UNKNOWN by the sparse keymap seems to
> confuse userspace, causing duplicated super key input events.
>=20
> Prevent this by ignoring those event codes.

Any updates on this? More users have reported the same issue.

Thanks,
Armin Wolf

> Signed-off-by: Helian Caumeil <helian.caumeil@clever.cloud>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222161
> Co-developed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/lg-laptop.c | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-=
laptop.c
> index 36ad1e269443..49e3029d4b95 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -138,6 +138,10 @@ static const struct key_entry wmi_keymap[] =3D {
>   	{ KE_IGNORE,	0x30010001,	{ KEY_UNKNOWN }},
>   	/* Change fan mode */
>   	{ KE_KEY,	0x30010051,	{ KEY_PERFORMANCE }},
> +	/* Super key pressed */
> +	{ KE_IGNORE,    0x30020000,     { KEY_LEFTMETA }},
> +	/* Super key released */
> +	{ KE_IGNORE,    0x30020001,     { KEY_LEFTMETA }},
>   	/* Disable camera */
>   	{ KE_KEY,	0x40020000,	{ KEY_CAMERA_ACCESS_TOGGLE }},
>   	/* Mute microphone */

