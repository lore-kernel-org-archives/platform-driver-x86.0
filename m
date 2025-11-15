Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E1D15746E
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Nov 2025 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763187834; cv=none; b=t/Afms+xgkHPZ1VqntT2ZSMihaKpv4cWJunJL8uocBhliaE+j+tCQYZL2YTa6+RhT+QE1Bap8g3P0T5F2Uepmxgv5ahR5nsFa8jx9DAq7oLjYwsgNan71jREVZnhQhbRmx5RUWHzJrLltQgcdrmylJ1kY072VFGIQZOQfIJETss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763187834; c=relaxed/simple;
	bh=OampmyutXWSh145OGKEXMks3KQQCO/1c/wMISd2xL2w=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=L6IOdUIQr4kEjVxWwjvu2kraf4bpGAOfa8pcPvboRFsij3v7VYGddgm+tJWcdRqLkPRN1NrXmCiPGK6B55sCYpHBucMsXO6yN1jrAschE1vjQ3K36n72b+sbTeOIPVmArGFEyxFJh0C7zHiYvPiduPORkWdq2Nq74I98RtdpwdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0e1yiFJ; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0e1yiFJ"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5597330a34fso1787834e0c.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Nov 2025 22:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763187830; x=1763792630; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3+ppJhGfDRha2bSXR8e5Sjh2kUwl9Nej0Ncd6hYJQo=;
        b=i0e1yiFJU8nMYMGUidCws2IPqrPhPyaCcmwdgf6dClDGIeENI81sGo8e0C/uXuzj2n
         LQaCqsWU7k/XJ/+hVA+2W5DU2grrtRFPoJ53uWI6HGJl2GdLsRCQn/pnJmtmwS9BCWZC
         sV8hnMnB2BnfTlGCy18PfL93gcrpSrtNnopK9im3lZZwvfeSCdIdvVOM7kcwKYAH8qL9
         Y2b0Gahre1wgFXNN1JlfxrBMjMkqjKHm5CyyLBrYGp11A4Ljofrj4W5nqhnN+7ZVpZhN
         iGDoKzVLC21+hfT1Pw9pLYJNHNlECniMzQ5+q+cZ87uqdK6A/1/HYpC5ulTzHwZhvu2y
         NxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763187830; x=1763792630;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3+ppJhGfDRha2bSXR8e5Sjh2kUwl9Nej0Ncd6hYJQo=;
        b=oA/c5bTwPZzIY7919ZA39KA5nnR2z8yaB6NRkI55E4LRzbNZdxU45Ht5/jYViBtuE9
         2ppliFPXwvSHo76UInIul6Gf+Eskb9fgtQ8y4ukyMDk6YnnjFEt9yKmlFtws2bkDos52
         /fVt3KnqqPcZaPTwPuX52XCms6tdN7faN6cAJll7J4P3efGU00PrGhZ3lO6lQU2NLrAY
         fH8LkSFhad1qqpvtEWzD2wAEncBdVi4VNQTR40kpA4QnbAeq5UP6zxIFOQopr2drFUTc
         UfAE7oQxMgIRB3o3NzMI4IUE1XpHWUUolK7NsoNbGAIf0Egljz4DK93JoAcREFcdmEQs
         dPdA==
X-Forwarded-Encrypted: i=1; AJvYcCU9AFRn4DfS+Y82jzjcNz5jsdD/Ka+uBzLZtVj0g7mfWNHLEOKt4NNpqHLjPk2flSJuuo8kFkUjgRaNUdsb3BI42z+A@vger.kernel.org
X-Gm-Message-State: AOJu0YwwfElnGY6U+sPQ1D2LnY1gUrNWWftA7fAhrq7aPltPvtcx9uDw
	n4MpFaudbpKRDitLzvLiEq/Oa1myKN2cWCcFAI9UH/UISgqYBpUHmdwl
X-Gm-Gg: ASbGncsfCd4Q7Ov6qE6oY9GuOW5+ce1qt+J+t7a+RopbPcP0ew2RMNGslG7qJQLPPPn
	PLKQ5/yPUBBenzBEtZwo2T8fhzXipgQXZsrOWpWiVbWoyqNyTmh8/ue4Vz644nif1U9i+e2QlO2
	1K9ZIWRXsIKWxv6OcrWD5SFIbirhubnJbNyeSHmu04bLiV7789g+eeRH5YsWOpjsPD7XN1ieT2f
	2m370s4TxjFbzHsWs6mbxbBRbZbOj/WvvIHWOpDgvc02oGHlSphNzWS0bylDAHfJCGCYGC939YH
	pXbbVpR3K3NQGZPqJ/bgl9qJS/HvU+0EdWyeS3NWMzNyYMDSuPpg1TdS5sOJa1j4Uede1T0VKVA
	oQUKy64P2RQtDDmNIvY+SELde50bfUuQq2zSU3E2ym/pu4PA3JMKxaWtXUvAI1m5y3dGj
X-Google-Smtp-Source: AGHT+IFtkrokh0i/W2bYtGXtkH+F//IhXhWK/kg+EjdoErB+fJo6Y4r+6oRhihycODRxHA7u9vNOGg==
X-Received: by 2002:a05:6102:26d1:b0:5df:ab05:d85b with SMTP id ada2fe7eead31-5dfc5b9fd34mr2211977137.37.1763187829717;
        Fri, 14 Nov 2025 22:23:49 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb707521fsm2380055137.2.2025.11.14.22.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 22:23:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 01:23:48 -0500
Message-Id: <DE91X624SV94.1C3A31K6FDMD3@gmail.com>
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

On Tue Oct 7, 2025 at 3:47 AM -05, Anthony Wong wrote:
> From: Anthony Wong <anthony.wong@ubuntu.com>
>
> Add AWCC support to Alienware 16 Aurora AC16250.

Hi Anthony,

I'm very interested in getting this merged.

Do you have access to this model? If so, either testing the
`force_gmode` module parameter or attaching the acpidump of this laptop
would be amazing.

Either way, I have a couple of comments that I missed. First there is a
typo in the title: alieneware-wmi-wmax -> alienware-wmi-wmax.

>
> CC: stable@vger.kernel.org

CC -> Cc.

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

I suggest we drop the "AC16250" so we won't need additional patches if
Dell releases Alienware 16 Aurora R1, R2, etc.

> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
>  	{
>  		.ident =3D "Alienware Area-51m",
>  		.matches =3D {

Thanks!

--=20
 ~ Kurt

