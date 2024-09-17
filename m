Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0142E1CAB8
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2024 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726578244; cv=none; b=rKR5aX+XJcQZaUI1lzRT6Eag6qdsG251lLNzx8x9pSs+TI1+97KF3c2koGr4adEqp5oCX1WdFrQMjplLrAo5i/T0DBSP0+rhEK6g4pZfIQXnQ1br/hlM3S18NzXS+L97sqiqlTLZXqiShBrMAfLQecuuWLrY5yxTpDxaFRl5ZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726578244; c=relaxed/simple;
	bh=oBXOVT8eXpsVUTP8TJ3FTtAqcWmIK89WtoRldp+yOmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xr9yOPoeoIQ6u69yosv5yGVGEUPrGyKCJjdRhfxYDu594nkCkgNC3xuIqSTtf+NmlfJ0f0ZM5sxALf4MJ+b2Ql1K03oKoKV43Waqhx4arLPj9yh00DNAmtjv6cLHtGm4RmrLkPyuIgD8nHHRpBZHyO61z6W8iIkH+ffAxSJhOrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrYyBea9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrYyBea9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726578241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9sq3qQyyGyxnaltKrQcaIg8ym8e8TuQdTwGOVY9y/A=;
	b=WrYyBea9oBPlPkS5xUlwEZE8RDGE3BRnBy8f7ICUddp1VmpazrfMCmiptyTUOFctUnriNp
	Gv5hIGKpNQTSddQr5/5qjTsZ2BeuOMsxKGHC5z3b9lAmQ2M/D0YolXm7wrJPDNhThqHAx8
	0CypHm/Uo+7dIpPhRhiL5shEX+Y0j2s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-zDHWNuYXPLGm1DX1LVhCyw-1; Tue, 17 Sep 2024 09:04:00 -0400
X-MC-Unique: zDHWNuYXPLGm1DX1LVhCyw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a8d10954458so410119266b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2024 06:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726578239; x=1727183039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9sq3qQyyGyxnaltKrQcaIg8ym8e8TuQdTwGOVY9y/A=;
        b=asYAzhZhaZ+Z98ImAhpU1z1B0908Mi0K4Y0vsbAkk2IoDilQaQaSx4F/SlbU+WtXXz
         ejhuInZEzG+8AmtPf33bGsELjJwvnj+OHKNREC4MX9YvQw0/lMSGw7rDiEu7eL/Yvoyl
         yCYHsKPrlw01ZQEDiSybOwRlwQlQgizZSraUCPN+BcsF9cwfce1qTy4VDks6CbPoKAVa
         77PR4V3gprTf1LbEc1EhgqMCTL5FRLP34Wb++VTdPbAkpFbwHrt6SwkuFCfwqmM2J96q
         fZCcLDpQ+ELVFi8c3HAjfGpZ/U4nmKaXlZ05AEtFfnh4byNkl9qGWI38qOHUK/c/MdvW
         dCpg==
X-Forwarded-Encrypted: i=1; AJvYcCW4GUiOPu3gKpBDRIUN4iti63nDAgsDyoQI0eydaomhZz65WEYbZVkcP9t1Flod/Df4FXC9mkEjWzZFppePjcb0/7al@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CFGUbsa/oHGoUglV4NXwn9Mmo7faMDq0X0XV8c+2kdw7f8xv
	NhAnUpuZs7mqDFErCHMztYyYqSww2D6LjlABoST212N7NcBk37VQfvHQiw/j1JyqqTWg4iyiCCn
	a7kvs5ebSby3F52TF3UMvnv15PsnuJaAl/rIWp30usG9O0lCO2Y4uMQ0Md/woXIR5C1l03yY=
X-Received: by 2002:a17:906:d7c5:b0:a8d:2359:3163 with SMTP id a640c23a62f3a-a90294d0a4cmr1761320466b.31.1726578239017;
        Tue, 17 Sep 2024 06:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5wsLYbYcfBZWTfBqsKqege5SI/JZ5IeMZmQU+K4lOz46Q2dm2rgfx+E+QNMzCQqdyQkGFnw==
X-Received: by 2002:a17:906:d7c5:b0:a8d:2359:3163 with SMTP id a640c23a62f3a-a90294d0a4cmr1761317466b.31.1726578238482;
        Tue, 17 Sep 2024 06:03:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610968b9sm446201966b.5.2024.09.17.06.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 06:03:57 -0700 (PDT)
Message-ID: <ae37b670-a42d-4130-911c-90e0c8b828bc@redhat.com>
Date: Tue, 17 Sep 2024 15:03:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1] platform/x86: android-platform: deref after free in
 x86_android_tablet_init() fix
To: Aleksandr Burakov <a.burakov@rosalinux.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 lvc-patches@linuxtesting.org, platform-driver-x86@vger.kernel.org
References: <20240917120458.7300-1-a.burakov@rosalinux.ru>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240917120458.7300-1-a.burakov@rosalinux.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

On 9/17/24 2:04 PM, Aleksandr Burakov wrote:
> No upstream commit exists for this commit.

Right, which is bad, especially since the upstream code actually still has this bug.

NACK.

Note that upstream in drivers/platform/x86/x86-android-tablets/core.c
the same issue is also present around line 447:

                pdevs[pdev_count] = platform_device_register_data(&pdev->dev, "gpio-keys",
                                                                  PLATFORM_DEVID_AUTO,
                                                                  &pdata, sizeof(pdata));
                if (IS_ERR(pdevs[pdev_count])) {
                        x86_android_tablet_remove(pdev);
                        return PTR_ERR(pdevs[pdev_count]);
                }
                pdev_count++;

Please submit a fix for both issues upstream, once that has been merged
you can submit a backport with a proper upstream commit reference.

Regards,

Hans





> 
> Pointer '&pdevs[i]' is dereferenced at x86_android_tablet_init()
> after the referenced memory was deallocated by calling function
> 'x86_android_tablet_cleanup()'.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 5eba0141206e ("platform/x86: x86-android-tablets: Add support for instantiating platform-devs")
> Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
> ---
>  drivers/platform/x86/x86-android-tablets.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 9178076d9d7d..9838c5332201 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -1853,8 +1853,9 @@ static __init int x86_android_tablet_init(void)
>  	for (i = 0; i < pdev_count; i++) {
>  		pdevs[i] = platform_device_register_full(&dev_info->pdev_info[i]);
>  		if (IS_ERR(pdevs[i])) {
> +			int ret = PTR_ERR(pdevs[i]);
>  			x86_android_tablet_cleanup();
> -			return PTR_ERR(pdevs[i]);
> +			return ret;
>  		}
>  	}
>  

