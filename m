Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAF33BB109;
	Sun, 17 May 2026 16:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779033678; cv=none; b=ChSqxfb4chI6srbJJ0c6lpvUdnz6W/Olqv2hxRA6tJKhuMmAW817fol6Gd6f2wLSueWFmV1EjsNvmqOmC+p6TB3DXXJOgUTzK9kBRIktUSsimVbvxETh1DDoW1fLvhT4RTnGlSnDymI7Jno/WjuDXYpiuBLmk1B+VsjguJzkCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779033678; c=relaxed/simple;
	bh=WlP/d0dt+CzrBZSLzBzSeNJk+ub/M1HTXRcikK/hVQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEaIB8MD4coUNy1nRwxLFVgpQKOJdGdl00n1foFwTQJhM6lnvFhVMI01kyqGRV8byUBQj81e4iA+DmBeTLg+9tDTznYj2CRxoCGPhQ1gtNajzwM8GiyuQt6unlabPJFR+8d5mq671bHvguTjnrQ5mxoAIUDfNoRmSyIr/zGaAuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=D44WyiDJ; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="D44WyiDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779033670; x=1779638470; i=w_armin@gmx.de;
	bh=3CuvGPNt069jIYPNggb4Q11NnpjlPkbt1gZtuHGT1e8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=D44WyiDJoZHlbc5hC9EK1iCqQZ6k2XsyX9Vz/06e0bTO1mGhWPDWdL+gtnfCSzP0
	 oW/n2pCY0xmxt2qHV1dikSrf/OAiH5wtCcAcPusrUT+fvsShCOw00Y8ZT/NAErnm9
	 v8NiQ5GYKzLFWXZB5wZsZvrLMA6OjZwZccgChGDhFJeRG4/jHk9JjlJU3mif5sTmZ
	 DUlL93+rAprgF7HJIpLRTLHTL1qvSZDEy+EBkemE2SAy+ph8eWunWK0qANcYvdskx
	 n0YbWgwIQNuBHGFc5DqAlxWjJulaOjOZKmYIPWjIsFgLCwMDlrwRhVs5RFZpslpsA
	 3JSPREG6z6Vr1/N7Qg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHGCo-1wbpDh3opc-005yEz; Sun, 17
 May 2026 18:01:09 +0200
Message-ID: <d693ffc6-08f0-44ad-a274-c25efc3fcfb2@gmx.de>
Date: Sun, 17 May 2026 18:01:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix typo in uniwill-laptop.rst
To: Cheesecake <cheesecake2960@icloud.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260516070650.9454-1-cheesecake2960@icloud.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260516070650.9454-1-cheesecake2960@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vbiKVutFDJxceMdS3wUhk0fiLSczs7y9/agxwMyb8KY2k/47RvT
 XhbX+sujHrJ+3tRAfenmoY38v8fxy51b7oTGeOrEBX3YhedfH2wJdUjCnCMUszReKoCcyAV
 F2wCESpzV5vHwjWUICC63yOzir0VfgOHtdmO8nshLSRBE9wtmTsjIajll/K9ahy58M47Hhl
 G+nd5KwR5BoPkz210186A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zMzGGuX1YmM=;wv09VtYLEqbMtSsiiNUQEbGrNvi
 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

Am 16.05.26 um 09:06 schrieb Cheesecake:

> Replace "benifit" with "benefit".

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Cheesecake <cheesecake2960@icloud.com>
> ---
>   Documentation/wmi/devices/uniwill-laptop.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentatio=
n/wmi/devices/uniwill-laptop.rst
> index e246bf293..65583b239 100644
> --- a/Documentation/wmi/devices/uniwill-laptop.rst
> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
> @@ -189,7 +189,7 @@ Indexed IO
>  =20
>   Indexed IO with IO ports with a granularity of a single byte can be pe=
rformed using the ``RIOP``
>   (read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods a=
re unused because they
> -provide no benifit when compared to the native IO port access functions=
 provided by the kernel.
> +provide no benefit when compared to the native IO port access functions=
 provided by the kernel.
>  =20
>   Special thanks go to github user `pobrn` which developed the
>   `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which =
this driver is partly based.
