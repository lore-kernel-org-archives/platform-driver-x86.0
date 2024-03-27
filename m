Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59CD6125
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711536902; cv=none; b=ZuVZCbCH4Xr8YtxaoCUzEGUgaL/MhJ4r1BaYMjlSSqbdV2+3M+OFJQDV31xEY12qy6RLTJht6ACRH3BtnqIy4GpsK89NqguQJGrwW9NlheG8iai196umu0zyxpbJBSmLIOgFVxnXDZO4usCuIjqYqR1aOCmdWZ1QU/WTzN6LeRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711536902; c=relaxed/simple;
	bh=KweQtMWh8ngFMvSjQH6JE+OBPcnHJ4rB/+Q5je6TFH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoPXn3aSp0VJhFKOY0PeO4wTnshOptxdQheC+Qz2pd4lTJbvoBA0ZtYYLeE1BYZMqnsknHK0Tt5Ae/Fr9aQUbaM4VnQfN8IUZYVZzT6qO2KqtTe8sE93IpwRc6thEs4cLaAE1ZSH536o6A6Pdum9eRxdb9Km15+kJ5zrhHji4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xe/sArcA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xe/sArcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711536899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jOj1xUDRgKvrKUZwWE47VrEgQM/bvWgtRCCyCpAEu/A=;
	b=Xe/sArcAjl3XISVPEf9i0i69UBTlMdXH7Lfw45gyVuv6hC00uf246j4k9Z62I6YCAXyDnO
	jGs2Svw6fNZfKlgI/99buECi/3MvOudRABdrAd+c87svmi1OCfjFPoZIu1NCp7O1v2ibgy
	CQhCyjscereMsvI+glIj0OmlOzdNQBM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-LRlwxy6fMFiex1W3xFIZUQ-1; Wed, 27 Mar 2024 06:54:58 -0400
X-MC-Unique: LRlwxy6fMFiex1W3xFIZUQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a4943e972d1so82124766b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 03:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711536897; x=1712141697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOj1xUDRgKvrKUZwWE47VrEgQM/bvWgtRCCyCpAEu/A=;
        b=wc575oKd79vMSFjjmSOIs4FRLgkYtXxrYUnmYsITx/6NCAnUthQ00a8ZCdBnI4zTl0
         L7cn9WlVJk0Q6QFuP3juk/M6JnUu3D4e04h5LlRmANQl1P01p8bFbhtzR7YRYP7V8ivb
         TosmudmTicWWURAWuPcDQRp4CVU167VbY2PQrfuCujjXDDULph610WNHDRtVGyk3n7uK
         guBogE9jAf81L4FLfFtvFi+NGMX0ROEbQAqHvJ1nnEgFswX3ZY2DqQy/3pnMwHVloxOI
         KFDMyPe2D0/mXOq6PQ610eFgxqIxvNbJK50hbzSVxcQnVOQwy7+JLH+Gouf68ywtJLGj
         OuhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP5yW+MkkEtVGsogvUtaiWU68qxjDKPqjD/5Jd23w9y0xHH5f9gbFTbdH5PVeFKc1wcbo+HKsVGVluxr6Fkv0gob7EFoi5fekyudlnocN6XrgfTg==
X-Gm-Message-State: AOJu0Ywqz8twyFsCYfIvVIlw6m3MoH3GBT0rbR0NnG2ryADRSR+GgQp/
	p3dL6bLb22Px5aoSfGrADfztfDkK/J/r4n/j3gJPLM14b4XwRKcW5/jPRYxl52VeJ3BTGzqghE2
	pQ1zWkxGIgSHrts1WaGEpxhGDJ/QGfOo39ya+lvzU9OBjFF1EtJn1XOMK+jJNj16imQMIpmG1OQ
	NntOA=
X-Received: by 2002:a17:906:374a:b0:a47:3cd5:b3f1 with SMTP id e10-20020a170906374a00b00a473cd5b3f1mr3083495ejc.35.1711536897097;
        Wed, 27 Mar 2024 03:54:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhLJLKLQeaxmFpX4tDgVqdVY05KaUoMv6vx1ZnQa20SN27eR0yLzoiqFoYZY4YoaspWrfDQw==
X-Received: by 2002:a17:906:374a:b0:a47:3cd5:b3f1 with SMTP id e10-20020a170906374a00b00a473cd5b3f1mr3083483ejc.35.1711536896742;
        Wed, 27 Mar 2024 03:54:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gx24-20020a1709068a5800b00a46f0d133b9sm5304616ejc.98.2024.03.27.03.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 03:54:56 -0700 (PDT)
Message-ID: <030beaf8-12e1-400a-b064-f17384e32714@redhat.com>
Date: Wed, 27 Mar 2024 11:54:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] platform/x86: add lenovo wmi camera button driver
Content-Language: en-US, nl
To: =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "ilpo.jarvinen" <ilpo.jarvinen@linux.intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <je8phmmtfz-je9zfg1v9s@nsmail7.0.0--kylin--1>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <je8phmmtfz-je9zfg1v9s@nsmail7.0.0--kylin--1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ai Chao,

On 3/26/24 3:54 AM, 艾超 wrote:
> Hi
> 
>  
> 
> WMI
> 
>> > The Camera button is a GPIO device. This driver receives ACPI notifyi
>> > when the camera button is switched on/off. This driver is used in
>> > Lenovo A70, it is a Computer integrated machine.
> 
>> > +config LENOVO_WMI_CAMERA
>> > + tristate "Lenovo WMI Camera Button driver"
>> > + depends on ACPI_WMI
>> > + depends on INPUT
> 
>> No COMPILE_TEST?
> 
>  
> 
> I compile this driver and used Evtest tool to test it on lenovo A70.
> 
> 
> ...
> 
>> > + /* obj->buffer.pointer[0] is camera mode:
>> > + * 0 camera close
>> > + * 1 camera open
>> > + */
> 
>> /*
>> * The correct multi-line comment style
>> * is depicted here.
>> */
> 
>  
> 
> Thanks, I will modify it.
> ...
> 
>> > + keycode = (camera_mode == SW_CAMERA_ON ?
>> > + KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE);
> 
>> Useless parentheses.
> 
>  
> 
> I think the parentheses is a good programming style and beneficial for reading.
> 
>  
> 
> ...
> 
>> > + ret = input_register_device(priv->idev);
>> > + if (ret)
>> > + return ret;
> 
>> > + mutex_init(&priv->notify_lock);
> 
>> Your mutex should be initialized before use. Have you tested that?
> 
>  
> 
> Yes, I tested it.
> 
> 
> ...
> 
>> > +static struct wmi_driver lenovo_wmi_driver = {
>> > + .driver = {
>> > + .name = "lenovo-wmi-camera",
>> > + .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>> > + },
>> > + .id_table = lenovo_wmi_id_table,
>> > + .no_singleton = true,
>> > + .probe = lenovo_wmi_probe,
>> > + .notify = lenovo_wmi_notify,
>> > + .remove = lenovo_wmi_remove,
>> > +};
>> > +
> 
>> Unneeded blank line.
> 
>  
> 
> Thanks, I will modify it.
> 
> 
>> > +module_wmi_driver(lenovo_wmi_driver);
> 
> ...
> 
>> > +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_id_table);
> 
>> Please, move it closer to the respective table.
> 
>  
> 
> Thanks, I will modify it.

I have already merged this. I'll squash in fixes for the few
small code style remarks from Andy, so there is no need
to send a new version.

Regards,

Hans


