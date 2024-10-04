Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13FC1DC19D
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Oct 2024 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049874; cv=none; b=otuRxNXh6ZT/5+txsZlXjr12rGR0Q57SnfB6+mRnmDIC3rU4q6Qfik+vqf+ozX2ckQSqr4nj4dSgpDT7mdHLzOkDd29S4RFvNWPK4LwJMRV7xZwOpDNTGsamfhO5i+9jtYyzA9YOcagwGSN7/Yf2vmXztQOYBRQhym4OpmG+Nes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049874; c=relaxed/simple;
	bh=1jRjg44o7RXdALhuqJ5q7kq6CphpxD21Kq5nEid3kLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/p904z+I23q6+5mplTxsa97KAuxOURgOLyPAOO5xk7WzvqZOIRJPGPGp9xYvyBC/IxGe0jhCN/ODC0dKU8hOYbpdDe5hhkGJwO4YDjNe6Tpgi64+Ev7TZfTCROwBEaVXVfiaecdObvP7gsx/99YCjBwSlFpv20av8+PT53ULek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ACrXcPM6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACrXcPM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728049871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJMgjrZKZj76hHRF8+pe8MD/Cm7KPfIyy9S/W6reD88=;
	b=ACrXcPM6GlAENq38dAWgGsvywZbC2C5RfFFs1JT5Hl+mpLmnsxWd/WVueWRn4PsQ2tmmI7
	3gOCk9Gzk+PGaO53/j10VIr5onUTHsBWUopYUdPXVgflG40NeefHOwZqNQsuYIW/UInpop
	9WRkSTupaTpBQ9NyRxf15RK+PjUbu7s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-lDvwsEzmM82LAYhVi92V4w-1; Fri, 04 Oct 2024 09:50:59 -0400
X-MC-Unique: lDvwsEzmM82LAYhVi92V4w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7d2d414949so177419666b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Oct 2024 06:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049858; x=1728654658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJMgjrZKZj76hHRF8+pe8MD/Cm7KPfIyy9S/W6reD88=;
        b=vsKVI3nzOb/Bo6ZXV60NJFwEMHMhp6gg89BEci66miqbQy+0aFARIz8gvGSuj51RIZ
         gzyKYxmASzcIsrPvkAQTzwqC77GFiHjgc0P5SnFjT0qio8apvqyl33VV10YuC/DPn5/3
         yKBehftKdakp0lVZX3551AHS1I8vOlGnjlQcYUVkhmnMtUJpQocwxdZs3VkkyUN7SBi3
         +qyyfBEZ4t/A7CMOZ62gOz8EfxBy2CJAPcJsgEuk2IiO3iD9bLhAlP0ahI3t2Kw/hqPp
         almo3Bg/6QmWp4/yrWJY7PCd2f9rVieDPVLLjmtTmu/XztIIPeaFsGUq1nb96y2rBhXL
         Pl/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZghBuK1HjMf67EP0PTXGFyQpgyw3+R52YIxnvl1ntGrGfvftjEBGgOd47QJ/8B8rQBQ5tOG8Dh1EIeBi0J0KBez2p@vger.kernel.org
X-Gm-Message-State: AOJu0YyyIy42pK4/4z8jjED+egt0jNzn8Mb4E99l8Yqxtu9/pNfkYJW0
	WhrL0SA771PRSGiOtx9zsaZIAXwUQtyDBhLTrOyCFaIrKT8Tz7Vm9vi6HmeAjbPWKryma6BYA94
	tDW4GGqnZrLDmAnQVf4SRQD4baBGd3mzBxeOrvBOLvmWJG9YGfkMEOK1Th4yKWwKZs07TYJpufq
	X41leOsw==
X-Received: by 2002:a17:907:c7c8:b0:a7a:ba59:3164 with SMTP id a640c23a62f3a-a991c00d249mr248018966b.53.1728049858117;
        Fri, 04 Oct 2024 06:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhxdEgOPGLp4YXm8hrNbfjQPjIj+VXDT3q88IioHMhf/m1Cr/c5RpDYwGGoM48jU1SucIS4g==
X-Received: by 2002:a17:907:c7c8:b0:a7a:ba59:3164 with SMTP id a640c23a62f3a-a991c00d249mr248016666b.53.1728049857700;
        Fri, 04 Oct 2024 06:50:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99102a580bsm230001666b.72.2024.10.04.06.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:50:57 -0700 (PDT)
Message-ID: <545fd443-eab0-4585-8286-ddc2c7dcadbe@redhat.com>
Date: Fri, 4 Oct 2024 15:50:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/2] platform/x86: dell-sysman: remove match on
 www.dell.com
To: Crag Wang <crag0715@gmail.com>, mario.limonciello@amd.com,
 Prasanth Ksr <prasanth.ksr@dell.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: crag.wang@dell.com, Crag Wang <crag_wang@dell.com>,
 Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241004024209.201244-1-crag_wang@dell.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241004024209.201244-1-crag_wang@dell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Oct-24 4:41 AM, Crag Wang wrote:
> The URL is dynamic and may change according to the OEM. It was mainly used
> for old systems that do not have "Dell System" in the OEM String.

But those old systems presumably still exist somewhere out there, right ?

And if they still exist then we do still want to support them, so I'm
not sure why you think it is a good idea to drop this test ?

Adding the alienware match seems fine, dropping the URL match seems
like a bad idea unless you are 100% sure that there are no systems
out there which rely in this match to load dell-wmi-sysman.

Regards,

Hans



> 
> Signed-off-by: Crag Wang <crag_wang@dell.com>
> ---
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 9def7983d7d6..c05474f1ed70 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -520,8 +520,7 @@ static int __init sysman_init(void)
>  {
>  	int ret = 0;
>  
> -	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System", NULL) &&
> -	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com", NULL)) {
> +	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System", NULL)) {
>  		pr_err("Unable to run on non-Dell system\n");
>  		return -ENODEV;
>  	}

