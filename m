Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64921E835D
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Oct 2025 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759846826; cv=none; b=dVpfn8aqQq9biAs7Vfi+ETgRfRp0LgrFK5k/TDjwevQjuj10+6c+XbNpis8s96ixWdjkq0Ik3bwPedXpuNq5MK2C3s6Pb+ZO2DwurGd8+tJ5RsVEbk09keIcQBV3zw/4WXZYN9eC/XHeVZSS+eTZ8Y4VPijFWngs7gLxWlZA2HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759846826; c=relaxed/simple;
	bh=J5N6A9x+9PW1PljWdDwIQK1y//7WO2H3p26AfP6eYqk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=MaPeX3yugsP8AdMNBAqAiS3Nsn7wuz3CYNHZQ1HshNNopuVBZW6G4IL5VOc6cUB7LrCNUKmgpes0OnlsydF0XGUyuUz+jrj2hTd163dXMCrLa0F6D0qIAiQDC57HeA/J7U5SASR5nslOiPMefA8HAhrNG6RU2duqqxx6U/4WGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R94pDhmM; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R94pDhmM"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8e286a1afc6so3864894241.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Oct 2025 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759846823; x=1760451623; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkFsCp1gMa+19oKaDX8Vp4GAdCN3HSuU8M5rLHaaOMU=;
        b=R94pDhmMdn6p2Eu4Xuf8GyXqPzrsKpUau/gO8OmrkTAlP8frtoEB5d4hHRSCBwOn04
         I0Bg/rcbl8LoJKgwAD5iAUuq9M897EBFHEik7EGSpZ6+2gZafHT9x0VDYEehbsAYGcMh
         r85mbxljE9qcl7W8SD/3uglQUB92vDI3vPFbR0ghYS41gD3Utisz32G1lnn6VtoHUWL9
         99MNIUoL8RngNxqbfppjzqjvoXo6ctWydLrhiruPzhtljQoiwjBkPJ8Er59HeIW/n7IJ
         GFg7y/JrcPMbF9CdOnkt0wPslMiwi98Nh7QX1eAiIwrCGl2aLJRktz5+/J16VgULCvgG
         SKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759846823; x=1760451623;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AkFsCp1gMa+19oKaDX8Vp4GAdCN3HSuU8M5rLHaaOMU=;
        b=DV8BDYMX6xsRH9ssWA2jTzT4ZdABmsEDdjO4E01xlUSd1A1b95enUORwWX2foGdfJN
         HsjhDN30HnK55p7TCkw+peiplHpZh5cu/HFQ2HMWrIIKueJLqEYBEdj64FIQwUfRvlO8
         fGdYbAsUAOYNs9RQ8VCEqPwX0LvY8cZCNm1lMdIM4+oKwCzWMVTLX5zaBqeHhIYENmPR
         regTsfE+tAWY/VgWmdajY3WoUs4LDtiV1fs88I5Sr1BwnCiyGpjsfIoh6495iMQF4yyq
         V2udLxiwM1fUpImvHJWkTa7ppVEiC9gx3h/8w8EXaOvC/jAECxlyE/jRBe2DQeRMIcOq
         59Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWbX0jagZC6MAOOfsT+V1ALG3tiCsXFlGuFhUomtXITsYv47x6Oubx9Qibudu0nBTjpgy8PAEtZlfNaKxXOHSZemvRq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/JG9LF8dWx0ClbEGSwNEn4fl307me5vJrFICIKTqBrOik7G8
	/S9nzPmVOS4j2XrVTMyu2wqyMzx4YHxOyqyw972+ROf9NV3Mec7NO8IiCb1QfTEy
X-Gm-Gg: ASbGnctHmBucD6iAuH4vIgETXqL2nFdEgoeaoKLH1pHAniFo8dJ/PlJDpYVeFAm0y4c
	5YF+9P3NVfFoR19dgl4jNQc3FiMcTJWzGkKLZuGmjnftzrJ3pghHCn943W/rD/w99jX1owA0Iiz
	Hdw3d0avZQ57Y88eOUDBviBrGTMp/ZKej4Yqoj0J8WRjBAb8j14YsBVMQW6OZfgo2HIAjcgacxr
	eopSoAMrQPeZvYzbssWhiNhx0NYMd5tSctOR+h9hS1DmBSZwGiCzMUf09KUdvyNPFA5DCR0c/+V
	3JUrEHyrZGpPjCBwN+6o51GWb+uCvKbw8AN9yxvw8dxJLMdFmINyix4lSICb3DKEvvnLPUtlZvi
	hzLrV8WZtnyPF4MKcv87G73IvhAI57bEUUfjzly4=
X-Google-Smtp-Source: AGHT+IGNdloIrHEnbiWQFA3g4jOrF/RJU6XHWFgcpnjO3xKUQyEA+c57OWmi9FTsIymHebCvl1CD2Q==
X-Received: by 2002:a05:6102:4b1a:b0:530:f657:c2e with SMTP id ada2fe7eead31-5d5d4d30883mr2062597137.13.1759846823244;
        Tue, 07 Oct 2025 07:20:23 -0700 (PDT)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4da2345sm3457287241.5.2025.10.07.07.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 09:20:21 -0500
Message-Id: <DDC5MSW70K4D.1MQVJPZOIXQW8@gmail.com>
To: "Anthony Wong" <anthony.wong@canonical.com>,
 <platform-driver-x86@vger.kernel.org>, <kuurtb@gmail.com>
Cc: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
 <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH] platform/x86: alieneware-wmi-wmax: Add AWCC support to
 Alienware 16 Aurora
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251007084734.25347-1-anthony.wong@canonical.com>
In-Reply-To: <20251007084734.25347-1-anthony.wong@canonical.com>

Hi Anthony,

On Tue Oct 7, 2025 at 3:47 AM -05, Anthony Wong wrote:
> From: Anthony Wong <anthony.wong@ubuntu.com>
>
> Add AWCC support to Alienware 16 Aurora AC16250.

Thanks you!

>
> CC: stable@vger.kernel.org
> Signed-off-by: Anthony Wong <anthony.wong@ubuntu.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index 31f9643a6a3b5..eb7c3fb6b078d 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -89,6 +89,14 @@ static struct awcc_quirks generic_quirks =3D {
>  static struct awcc_quirks empty_quirks;
> =20
>  static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
> +	{
> +		.ident =3D "Alienware 16 Aurora AC16250",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 16 Aurora AC16250"),
> +		},
> +		.driver_data =3D &generic_quirks,

Can you perhaps send me the acpidump of this model?

Some newer Alienware laptops support G-Mode and if that's the case
g_series_quirks would be better.

> +	},
>  	{
>  		.ident =3D "Alienware Area-51m",
>  		.matches =3D {


--=20
 ~ Kurt

