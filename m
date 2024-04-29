Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A0F9C3
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714385028; cv=none; b=uhGZcpxKJ7/oSSXGDmNz7vUyjBJAqD9e8D9Yg/OaOUnYBKtopR3vcDHIeZubWLfLL7+FiQkiDnQzzmtQjU+YrBQAXzPPHCB1bFCHQOdjL/tDRrKC8eO8HyssoRgHO1zUCEsOqiuD9pqLvQT5f6N3bnSJob+EYQWM269VRFMP22M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714385028; c=relaxed/simple;
	bh=sKQj30EMZrnVGsY4qDPVU5jeMH1gYGjxCL0tENiy9PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRXZsl/Fj0OhdO+p2e5xVgG5JxmHvQU126xwQ80KlOalp248Lv9FyrgfC3woWPo4Eirg2V5lswGm//FHZknA24+FdpthFFf5IYo62rM/2GtZsGvKoozGq2yDajl7ap3w7bCH4biAO/XC+E20BirymQdPDCdtdEEh2qbcQRLX2dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xf5Gjk+t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xf5Gjk+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714385026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6hA4Rq4TRwKIDPNlrjGwovqEpFNEkS/ipDL5aGr/VA=;
	b=Xf5Gjk+t81EGbssOmJJTfRmYdBCDuNKhrt2L0kQ37oOzw3x+TNkDQNFtQTta97fx+AHOQw
	tizqxaQRJf6flTtUZUICZmcEPeQ6dhu8uQtpxqDzZyLaxZe3uYeI82SftAUu/HRjxM9ikw
	g4r/CdH54TD6LfyNY0ddcl/Dm3Khd4Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-3wNRUVHsNL-oHeXBcJ4pfA-1; Mon, 29 Apr 2024 06:03:44 -0400
X-MC-Unique: 3wNRUVHsNL-oHeXBcJ4pfA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a52539e4970so279301966b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 03:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714385022; x=1714989822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6hA4Rq4TRwKIDPNlrjGwovqEpFNEkS/ipDL5aGr/VA=;
        b=WZQmly11pff94Afee5SgUM8oir8/Z3JTb3G9UC18ikMwoR7ojDi6TleBvOFMg2+/Iz
         7ux5cOaP0C2DgmRKGRRiqHrnMcBQ3aXlr9V2BYY6QE8MZBYXqAB6lgj2AxkwuuvjTIjo
         yliGdMKqVUCfcXvdVm+F7aULl/H0GyQ2qE6NO33JKir26HKrAdtpzWL6bDoac/v3T1HO
         VHvZzxLMetEIslReYkQqd8DuAZsOiGIzOSsrTdJcWsobBq5i25gxwPunr10lUjBRmVEr
         AgNU+3HuzgGO2dT/QB/Vznvsm13oHFlxhX3LDO7WBDLNBrptkKErMfcCcAOZUEpIW199
         H8TA==
X-Gm-Message-State: AOJu0YyRU046Yk85XbSeQaM4LW5RrQzK+EQfnPsyPEIX/MaXyXz1foKl
	kSqXhFJ9wXJfcL0/DJeXl47hMXeNlLtHzO46KH3ZQl4p9MM6Rh0OTYHOHnMyEUTYczztvJ2BuOl
	c4hbZejzyoFmB488rkynG/v93CZ0Ac7+lkeVeaceoPRm5M7OGCjaslGDdcFB+6+Qpx5NFgEI=
X-Received: by 2002:a50:8a9b:0:b0:56a:ae8a:acc0 with SMTP id j27-20020a508a9b000000b0056aae8aacc0mr6875924edj.21.1714385022718;
        Mon, 29 Apr 2024 03:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnEC/zDAyj/PFoV2C9XknPAaXI2Ivqh2WT4ifkRE/foEtJ0yID1DCKBxBg7HvvUN5ZLW45Jw==
X-Received: by 2002:a50:8a9b:0:b0:56a:ae8a:acc0 with SMTP id j27-20020a508a9b000000b0056aae8aacc0mr6875914edj.21.1714385022435;
        Mon, 29 Apr 2024 03:03:42 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id es21-20020a056402381500b005725c56b35bsm3307703edb.71.2024.04.29.03.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:03:42 -0700 (PDT)
Message-ID: <e3489dce-9d9b-4d3e-82f5-b5ba6a2ef1f9@redhat.com>
Date: Mon, 29 Apr 2024 12:03:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use false to set
 acpi_send_ev to false
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240429093446.130322-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240429093446.130322-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/29/24 11:34 AM, Hans de Goede wrote:
> acpi_send_ev is a bool and everywhere else true/false is used
> to set it. Replace the one instance using 0 with false.
> 
> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7e2288009063..e2e6c4d3dff7 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3912,7 +3912,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>  			if (tp_features.hotkey_wlsw &&
>  					hkey == TP_HKEY_EV_RFKILL_CHANGED) {
>  				tpacpi_send_radiosw_update();
> -				send_acpi_ev = 0;
> +				send_acpi_ev = false;
>  				known_ev = true;
>  			}
>  			break;

