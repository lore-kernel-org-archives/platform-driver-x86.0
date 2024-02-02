Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F75317BAC
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Feb 2024 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860190; cv=none; b=BBQVlmYvM4bpoDdGPB4HE2FAhGfLhBBTp+GIf3QRUa8UJXJjyC9Nm+wPTItVEJu7ZeUxRgjlImBcBH4z4sWgX97WIM1RenpdpryQeDdlcaxXLfhUeDE5dnOTIXKLoWatmb+1AflP5Xe+8E30AahuYaBdtVjSY/A9G67PM6jYyz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860190; c=relaxed/simple;
	bh=Rosjw/fWeROwK1eHPmgkBfxRsS3OHEYIAC+fl12Rqyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0px3y34uA5eIEHE8MO0mTaaBnu1LSQObzKjJ2kkd9BzMi/Eg5Ymxd8MQ2rfwGk8R9LYMAP1MoJRFTncUq401V9Kb6kABin4GaGovjRu/0ivPOkBLvS5ialrmPOsYMDjcEIdGoWttAnjY1uCFw9TbYCTe+qYuq7MZlB/VxRa4z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nx5wUTdO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nx5wUTdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706860186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E2y0v+j5Jdi4S0j/7TIDS4/wQS3UjlRfpUREHEJdYNg=;
	b=Nx5wUTdOKkgnZ8AfEXbUCACNoInY6sA+6Jz7sCbhFPxfoUYLtEgFihZsiLDObN+tOqqm0i
	yrRVaFc7NRM6m18Q7RpIQlHVTvMqvI5Euj7U7QJ3unr8Un5DzyBROJbg7mC/ZQPmOmBy3t
	jiX/jJWFLsETRONsIgyzvh9tr2ynxqg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-XJ1ROBGtOdCvYY_RiI8m9w-1; Fri, 02 Feb 2024 02:49:43 -0500
X-MC-Unique: XJ1ROBGtOdCvYY_RiI8m9w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a26f2da3c7bso108512366b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Feb 2024 23:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860183; x=1707464983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2y0v+j5Jdi4S0j/7TIDS4/wQS3UjlRfpUREHEJdYNg=;
        b=airXehafIPG/QxFu/QXBPiNNSurYmvnfsFa08YhVvTRfIadT4DatSWscX6wqp0JvTp
         ymdYCyfwszVGy3WMzTzWQgTLEtuoodrKSeEqJamTi2Wxtn/Cr+xf25a/jLbrNxzA7GDf
         GGvzGNYoVO0vrpHFKXAIxr2/bNhT3a4iqJruOEFcseSy/iET1BZz/pDWPB7k1yci0jpZ
         NBrAAsZ6LQ/ggkS+KADk48qSxLyTeeqqPu67Rc6wIlWDtcILpVEoClQSkS3aBzJelzLH
         V6+WOaZzkkKVR+VsNcJtUaOy1u4pXk3LsPmlzqTYXcmzSJLiEc5px4wPDofc06gZaa0Z
         el4g==
X-Gm-Message-State: AOJu0YyKgEz8tNp5FpkUD+dMo8NbUIhc09ktRyWaBzsdKpoHNvpd8Qd6
	BEo4RqfOZqOXpy8sLDGcgE0f1GndGWf4SiUQqRHzhoMdv81zz10+Yn4o0cpPwNfpRg1pJSaW74B
	5g+S26+F/i/SPJH1Nrp6fBfd4VWjLvqjQhvqRWoK4E2lUADpBcb1b8UFdnmbEfwvoHWcnLro=
X-Received: by 2002:a17:906:80cd:b0:a36:c327:e60d with SMTP id a13-20020a17090680cd00b00a36c327e60dmr862105ejx.48.1706860182763;
        Thu, 01 Feb 2024 23:49:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjHnGJIlgrFXDqYi0ZgjzbriJnGOniMRwC25RLoaRxDd4REYDUT00BMXe1znbrb+VqNKNE4Q==
X-Received: by 2002:a17:906:80cd:b0:a36:c327:e60d with SMTP id a13-20020a17090680cd00b00a36c327e60dmr862097ejx.48.1706860182430;
        Thu, 01 Feb 2024 23:49:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVPkyNmTst3UetfCrPr+kbRZff0uSPLuK9Vj/NrzeAxSlLczVI9+bY97Wx6mXcL+7s+Du0GVnLhjRjZ2q+djdSou/hNId6EBT4WRK8+N5X9q6r7NbPLkkHdwPlU3fTL7XINhDFS84DkWdCdWt8g+gX0Gj6qtnoD3jRs9jKHF2Kih8jQ2/oxvhMJ//D7xHc7mqE8E5T4Zse2tiQJcTSVFUwA26cvSaWJXzA1rA==
Received: from [192.168.43.127] ([109.36.129.188])
        by smtp.gmail.com with ESMTPSA id r26-20020a170906365a00b00a2bf9b00508sm602212ejb.141.2024.02.01.23.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:49:42 -0800 (PST)
Message-ID: <07010c54-2e44-463b-9a9b-95697fd30ffd@redhat.com>
Date: Fri, 2 Feb 2024 08:49:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: switch to use
 device_add_groups()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 naveenkrishna.chatradhi@amd.com
Cc: linux-kernel@vger.kernel.org, Carlos Bilbao <carlos.bilbao@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <2024020145-junior-outnumber-3e76@gregkh>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2024020145-junior-outnumber-3e76@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

On 2/2/24 03:44, Greg Kroah-Hartman wrote:
> The use of devm_*() functions works properly for when the device
> structure itself is dynamic, but the hsmp driver is attempting to have a
> local, static, struct device and then calls devm_() functions attaching
> memory to the device that will never be freed.

As I mentioned in my reply to v1, this is not correct.

There is a global data struct, but that holds a struct device
pointer, not the device struct.

The device itself is created with platform_device_alloc() +
platform_device_add() from module-init and it is removed
on module-exit by calling platform_device_unregister()

So AFAICT this should keep using the devm_ variant to properly
cleanup the sysfs attributes.

But what this really needs is to be converted to using
amd_hsmp_driver.driver.dev_groups rather then manually
calling devm_device_add_groups() I have already asked
Suma Hegde (AMD) to take a look at this.

Regards,

Hans





> 
> The logic of having a static struct device is almost never a wise
> choice, but for now, just remove the use of devm_device_add_groups() in
> this driver as it obviously is not needed.
> 
> Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Cc: Carlos Bilbao <carlos.bilbao@amd.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: rebased against platform/for-next
> 
>  drivers/platform/x86/amd/hsmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 1927be901108..d84ea66eecc6 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -693,7 +693,7 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  		hsmp_create_attr_list(attr_grp, dev, i);
>  	}
>  
> -	return devm_device_add_groups(dev, hsmp_attr_grps);
> +	return device_add_groups(dev, hsmp_attr_grps);
>  }
>  
>  static int hsmp_create_acpi_sysfs_if(struct device *dev)

