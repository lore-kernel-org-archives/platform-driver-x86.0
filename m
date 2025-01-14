Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14013240235;
	Tue, 14 Jan 2025 03:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736826947; cv=none; b=R1mJkl+2SD5K4e5c+MGwSWqEK60rtGDKGUSb0X0O8Ct4xNoPmklwxn0jnOJEcKi1IjyDWoTMc8bswkP/Cw8Ltm5ot2ZiXydPqU/s3jDqCpULmNFV9XDbjUmPKW9gpcpXhdTcC/SDttf37UNDf9/AHdsk6e5B1s7OnSD/MeaOvc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736826947; c=relaxed/simple;
	bh=NMRLE0UavBsRg4g/DLKyVA1mQ73LeIx7gMwbWVy5gQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OE81IwywA3AZGNHAjPBL3DpNuGp2aRRiVeK2AO7u/sfVu3Ctwdywv6SxEmbp/yaZ5mBNNqx7VkpbkapOoDC7fPjIk7Z6nZ+cKm5aOCbykiw09zHd7GCT3nEFA3VQaz+15KSJXzOK7ZgRVM1rsnddUHqAzNDAYrlvpqju3iXcdwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKcrwD/g; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKcrwD/g"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso1623892137.3;
        Mon, 13 Jan 2025 19:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736826945; x=1737431745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JxSdvRJMhlGVRj+IzkmP41ZcdR7dEp1q7hHdjDkxN8k=;
        b=fKcrwD/g3XJffUHAUThdJY0L8Hwd7dHlRYuJKINvlg+ZbSDKucS4+pYSfyoqoPc8Pj
         eNmO20u3ml1RSNycC10guwaYmTnJEzrMtqCHfFun5AC0Q4aSOv+GjqSzaOKdWFGSgxaV
         viJqLc68N4VJMUxCfuGKWZa7unA7fRhX3uwiTGrM0bSDADxEKzr3RfffMQ5PmoeM74rm
         gU7SVtak+9Z1bnrfM3dpFFfwpUzPKRq+1q7j7/btsVm5BB/kc++50udX2SD+QXdlWhgs
         xJOvTyyYGDEiO80xgxaYxgeLGiqd6/T3iwdfMchHfTYxMpPDnIQi+xCRACZptG1hCwf+
         v0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736826945; x=1737431745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxSdvRJMhlGVRj+IzkmP41ZcdR7dEp1q7hHdjDkxN8k=;
        b=K1lv1x2w6TimWHsNy++AuWpgtd2qBAHDxaEBbmU7hDpsc1bTavIyQmoO06/jRlXqyt
         nqBwzrqeTtAPbp7gvU5MLQGja6Ya5RlzhV5wlVzZ4oS98gkTpK4hf5tJZO9/Ma5b9FCD
         A3AvhZW/S6umTG/S/AJbMRGIUTtAxRs5Fw0eJihJhuSMJUvThLdCmXz6rV5rlCUNpxnb
         6kSdtpaCpBp1rQGBlkzR5BIBPpVSZ4fa9juOF5sFr06dr1wIH1QuXi95pwGEfYnQqiPR
         yOKQgt9C0wbHANbv0U3tq8WJ73BpvsfogDnVVvmUq/FU5cxZi56kdof1OS4USYWWnoOz
         sBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX833bsfUVddLS3iRaZm8P7OgI+j9sx4OLNbmxA+Sy+bQpN8+ecEwM53oVIh+3xwYqpadyndFxrEYiPCoXDcny8abVXSw==@vger.kernel.org, AJvYcCXp21VpnfGrjqSTDV0Ls+SU/8jqOy5c/U6LhmVMmP/iKGz5gG1XKtb/itAKPEh6tk0F/js7CS/uvOqP6yE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyho50PSazPXfnbK9a7p8S1zQo44PIzscwcoYctbP/cipkzxnMB
	WBXEC2ojCUEHkQsw8IlB9kjT3DmrsVppKXRce7268KFk7QzMTmI0
X-Gm-Gg: ASbGncuc7ltYCBtycmnysDmeTk5kuDh6LStud/FHfGsh6x5on49qQG0mWAvs7rFv/Ye
	QWI0CfKMmBvDjIfU1FeWkYCOSCL+Yo/0wzOEbr3s9lJ9SdC0mi3oen64jRwhh7OFRtI7yuC5Qpl
	xq0b/7cMHBT9XM21WRccFLWZpFObeSDsrgFrCuwLp9BsNPWNwA4Wb7oa3HZZE1cUFRJRJgmtRNb
	dHl14LWjsupVb9tQKwGNRn9LS1ZYUU0qfjIUki1kZlVWubVx51yHA==
X-Google-Smtp-Source: AGHT+IEg65P5R0v4vY4uzzNlZuq1xr6cP6oS07SONAAQ5v/N16eRETO2UkR3aQ4+ksZLWCiCXbcp9g==
X-Received: by 2002:a05:6102:3e1e:b0:4b4:6988:b140 with SMTP id ada2fe7eead31-4b635e22704mr8081075137.23.1736826945049;
        Mon, 13 Jan 2025 19:55:45 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8623134c6f8sm5114074241.4.2025.01.13.19.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 19:55:44 -0800 (PST)
Date: Mon, 13 Jan 2025 22:55:41 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 5/5] platform/x86: acer-wmi: add support for Acer
 Nitro AN515-58
Message-ID: <owp6sqpwl6xtyavvlrolmwvye72gw5kxplab6c2qnzfoiie56p@5rzreyjlsywt>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
 <20250113-platform_profile-v4-5-23be0dff19f1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-platform_profile-v4-5-23be0dff19f1@gmail.com>

On Mon, Jan 13, 2025 at 06:44:13PM +0530, Hridesh MG wrote:
> Add predator_v4 quirk for the Acer Nitro AN515-58 to enable fan speed
> monitoring and platform_profile handling.
> 
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  drivers/platform/x86/acer-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 37f8c2019925391185e1e0952dac563daf923320..04bfa8fe12c2fd9a3c8be8d06f47431f8143d6c9 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -601,6 +601,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
>  		},
>  		.driver_data = &quirk_acer_travelmate_2490,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Acer Nitro AN515-58",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
> +		},
> +		.driver_data = &quirk_acer_predator_v4,
> +	},
>  	{
>  		.callback = dmi_matched,
>  		.ident = "Acer Predator PH315-53",
> 
> -- 
> 2.47.1
> 
