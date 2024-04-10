Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B115530C
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751868; cv=none; b=NyLwxCAc9TZM+d1ohFF54p8N0ydg43Bat3BdEVAV6tjf5fiFDhqnke4tJ9frg3ClcNX1jInGd/wAo496yFRCBo7dq8xY3NSTKpZo0eR+C17HPaq1pEanr5/lVJD7zPv8ghtEJkDejWXyolxKVU2JP+NgiHEc990+i/dIMZgdgIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751868; c=relaxed/simple;
	bh=LB0NwV6yN/aDDHfOaAXGko0se/MQo4DfZDEUs/xZWHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7LPIyIzjKUIf8UFOaYCMRGEgMmC9E6x6gOvDqM9bNUgmgME/+nncm1IbOCFRH8z19AMWXfk7CzGJQ28vmQ86GdmqjRwchgovwqMrQIwF67TZPszz5HjBuZdpsgXnBXPa+4Q+8Pq5bAxtOFy8utYFzKCS5BIGVMN5YN+01TEoAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNnMPAzb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNnMPAzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712751865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mvwOMvs+vdqeQtRfyrn8nyJsryM0OY1QKyS3VuKYG4=;
	b=FNnMPAzb57DfDQ7xpCbC5ExcfeVVcduylcm1SQZTWH126u107VoBJ4B286mo+I4TvUeF4V
	BAqz1tzpGiz78NUYRVOvtsWzF8y0ulN655EzT41y0UqBR3qb/ZV9VsVYY76ay4UBHnjko5
	/PHcV2x9JZrTIRpcSKm3Red8TgjyDT0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-y7r93WS-NGCxddK1LSlB0Q-1; Wed, 10 Apr 2024 08:24:24 -0400
X-MC-Unique: y7r93WS-NGCxddK1LSlB0Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56e5c57c1a5so1847301a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712751863; x=1713356663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mvwOMvs+vdqeQtRfyrn8nyJsryM0OY1QKyS3VuKYG4=;
        b=TpX3JPH8LWCEPOItKAr+wy3tixJ+HJlI8y7+vn9FIWxC0zk2jz6G5dP+O1assSP80g
         VjEjdS52W0cwp7/vRZdil3VK4SEfQaQURbfz9R0m3a1kWfhDgyZpKnzJmmemO84kNui6
         l6YH0NIAdnwgxWMJ/JHkcm6hkAfosCNA8G+J9mK0YKVKwuWiUlQRGgHxmrmXyBj/dXg5
         Q08n/Lao4aqKgD2jRVWUc8FMunoOX0iSmgAyMZujJoYmEUO0iSXBwVg63eKoddOGQS8Y
         fM2Qh8f+qRzaa+v8bIoy7siHrFazvU1hsBvUCk35hmTppG8zYido5Zcvl87SRb4EeLZC
         jmqg==
X-Forwarded-Encrypted: i=1; AJvYcCVJRtqQwKvGCXputEHfjUFmt7gEhg8PqJYOxqUth5Qq397iM4ySJsp3xrGh8dV6hw/EyvH8pP1XvZuN/645TQDqoov/IkfWMaV+Kj/OKsb1Q2xQQA==
X-Gm-Message-State: AOJu0YwRP0srk8mBUnvmUlX1a4F2lokQD/fQziUudWOMTjW/oHjoneKW
	TK9sFOVe8USfIcoXrXWtfNvBqUOvi6cW+mozBSq2BOjup0FK+2M/6x/XfZHlHcSIMbwgnyZK+s6
	b4aeuVm0eGQa1rydDBVMU3tPssl1Viywy5Tt71/Vi8rpwiU+emrZJ7ZJC5e44VlJP5/4Joq8=
X-Received: by 2002:a50:bb26:0:b0:56e:2e10:7dad with SMTP id y35-20020a50bb26000000b0056e2e107dadmr1602427ede.35.1712751862855;
        Wed, 10 Apr 2024 05:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs6MwYYjNwy4f+kh83dVWGlbSdrnRqAv2g7somAcEuy///gC9Hiq/5LtSzGDj5CUkFdTWBEg==
X-Received: by 2002:a50:bb26:0:b0:56e:2e10:7dad with SMTP id y35-20020a50bb26000000b0056e2e107dadmr1602414ede.35.1712751862480;
        Wed, 10 Apr 2024 05:24:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id eh15-20020a0564020f8f00b0056e67f9f4c3sm2904491edb.72.2024.04.10.05.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:24:22 -0700 (PDT)
Message-ID: <9e1605ea-147a-4b17-b4e2-692b34926bf2@redhat.com>
Date: Wed, 10 Apr 2024 14:24:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Remove devm_* call for sysfs and
 use dev_groups
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240410121746.1955500-1-suma.hegde@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240410121746.1955500-1-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Suma,

On 4/10/24 2:17 PM, Suma Hegde wrote:
> Instead of manually calling devm_device_add_groups(), use
> dev_groups.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> This is based on the suggestions from Hans de Goede when Greg
> Kroah-Hartman had suggested to switch to use device_add_groups().
> 
>  drivers/platform/x86/amd/hsmp.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 1927be901108..d6b43d8e798b 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -693,15 +693,29 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  		hsmp_create_attr_list(attr_grp, dev, i);
>  	}
>  
> -	return devm_device_add_groups(dev, hsmp_attr_grps);
> +	dev->driver->dev_groups = hsmp_attr_grps;
> +
> +	return 0;
>  }

You are now modifying the driver struct while the driver is being
probed(). That is really a bad idea.

The idea is to assign a static set of driver groups directly in
the driver declaration:

static struct platform_driver amd_hsmp_driver = {
        .probe          = hsmp_pltdrv_probe,
        .remove_new     = hsmp_pltdrv_remove,
        .driver         = {
                .name   = DRIVER_NAME,
                .acpi_match_table = amd_hsmp_acpi_ids,
        },
};

And if you then need certain sysfs attributes to only be shown
in certain conditions add an is_visible callback to your
const struct attribute_group, note you can use separate
is_visible callbacks per group to hide / unhide the entire
groupin one go.

Regards,

Hans




>  
> +/* Number of sysfs groups to be created in case of ACPI probing */
> +#define NUM_HSMP_SYSFS_GRPS	1
> +
>  static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  {
> +	const struct attribute_group **hsmp_attr_grps;
>  	struct attribute_group *attr_grp;
>  	u16 sock_ind;
>  	int ret;
>  
> +	/* Null terminated list of attribute groups */
> +	hsmp_attr_grps = devm_kcalloc(dev, NUM_HSMP_SYSFS_GRPS + 1,
> +				      sizeof(*hsmp_attr_grps),
> +				      GFP_KERNEL);
> +
> +	if (!hsmp_attr_grps)
> +		return -ENOMEM;
> +
>  	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
>  	if (!attr_grp)
>  		return -ENOMEM;
> @@ -716,7 +730,12 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	return devm_device_add_group(dev, attr_grp);
> +	hsmp_attr_grps[0] = attr_grp;
> +	hsmp_attr_grps[1] = NULL;
> +
> +	dev->driver->dev_groups	= hsmp_attr_grps;
> +
> +	return 0;
>  }
>  
>  static int hsmp_cache_proto_ver(u16 sock_ind)

