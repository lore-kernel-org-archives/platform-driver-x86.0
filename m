Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F5309DCF;
	Wed, 11 Mar 2026 19:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256787; cv=none; b=VGYO50DMrmJIXNDJuCK++a6wRHQakZb65mT8wK2I6Op6w2qAq7lljbqwQLsmzLFrUqCoQ8h/m6/Ig5cVeIMGqSBIg/zZ2oi4rxGUv5UMi7UYwkSRKdDP4LgVwPfpvgP3Q/yc6bOQ1spIPYbq5V3rrvBzNFHV0W2QQ7QF3KGt6P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256787; c=relaxed/simple;
	bh=p8o9SPu7l/uIme7Ugq6s/pHvUhv8RwrGm9f+ToZuddE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPW/fLDubSGBJFkMqY9wY+L/gXNtDQBDNPRfyvplDOrnNDOZrI+8NP5I+LkOy3bdxx3BHaJh6xiW4enT4o86R3sCI90KleU7druHbzHYU4fKYSIDxdg9xJiTLDQsNkKzT6BcpjTwvAM8sIxUTiv+R6bIn4C/cSlEFC8WqyDRl2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=B5Zuezxs; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="B5Zuezxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773256784; x=1773861584; i=w_armin@gmx.de;
	bh=mSnWfvqmKC90KVKSNG4iPE614TWCHLdXpZJfaVlJcxE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B5ZuezxsIX7DbXeNqKUo2Ozed89sOLf/HL3BP/+McTHUUDOeKIEYOerBFjh+H4CE
	 pKt1PylPd/dt0O0XSx/Bp62OJ/d3fbQpIzdEyfrB9TZCkhYva2IjKPUCqk3I6AlRr
	 5bsvbze/7VtiZf1+yB8ipUo3zld5npVBqV9LxzyBPw95lsLfUWaSpEealfBB1ycRc
	 d5W5gz9bpGoLrp2G65NTvBfsTFLiaIpFl7aNVuyX173ctlHJje1kuVMfmdIRUNi1A
	 pY5wSLoeXsTDKsuZIEKCElDpVuMeTMgTtm7dIF/OzGecxEK6NTkD718f+cKzJ+oPB
	 8X7HPjQdLOIzDO/wfA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1vmSo52aUA-00uVZT; Wed, 11
 Mar 2026 20:19:43 +0100
Message-ID: <038d14cc-6ec7-4428-bd67-4e6e5139482f@gmx.de>
Date: Wed, 11 Mar 2026 20:19:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] platform/x86: uniwill-laptop: Fix XMG Fusion 15
 (L19) entries
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
 <20260310234022.2085232-4-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260310234022.2085232-4-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xT+sHs4dfcQRfp5vQqsFhjhgsq9EqPmPtF04t6URoOCz29ocroh
 GzqcKCab1ZJTaOyb2bbn3dlumtz0AaUl1BD3arvGcLHzBq4d0UZ6g9cTe6ffS+E761Bmfno
 4qIu3iBG7r7iPmNeXD/PKd3k01gW08ijEfNzB2saXElVwpS6HLOQrwtaPYerg6NhQnULGKr
 8ZHi+gshnT0PgsLgAb2VA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oyY+A/Wai6Q=;n9c9+lACixls004P4RcQSaKw7fJ
 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
 blpdaLcKrPD

Am 11.03.26 um 00:34 schrieb Werner Sembach:

> Add alternative XMG Fusion system vendor name and clarify edition in ide=
nt.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 22ae5fccd6a06..ff9d6a4921a29 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1911,7 +1911,7 @@ static struct uniwill_device_descriptor empty_desc=
riptor __initdata =3D {};
>  =20
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
>   	{
> -		.ident =3D "XMG FUSION 15",
> +		.ident =3D "XMG FUSION 15 (L19)",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
> @@ -1919,13 +1919,29 @@ static const struct dmi_system_id uniwill_dmi_ta=
ble[] __initconst =3D {
>   		.driver_data =3D &empty_descriptor,
>   	},
>   	{
> -		.ident =3D "XMG FUSION 15",
> +		.ident =3D "XMG FUSION 15 (L19)",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
>   		},
>   		.driver_data =3D &empty_descriptor,
>   	},
> +	{
> +		.ident =3D "XMG FUSION 15 (L19)",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
> +		},
> +		.driver_data =3D &empty_descriptor,
> +	},
> +	{
> +		.ident =3D "XMG FUSION 15 (L19)",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
> +		},
> +		.driver_data =3D &empty_descriptor,
> +	},
>   	{
>   		.ident =3D "Intel NUC x15",
>   		.matches =3D {
