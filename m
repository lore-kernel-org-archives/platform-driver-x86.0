Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9572BC54EE9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 14:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbiI0OOB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 10:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiI0OOA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 10:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F111BBED0
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664288038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EC7NiPEaGCSb2TyPzQWyG6jdptZsAgoo1o5L4uNHEzM=;
        b=hJ+Jxe/Jyvw6rjJNeAmmJF/TAAtS7NXlWNY/g/koTNZpkOCzStaSTtSh2VDFNUhR3DewRr
        tbW741plBvA6VMbYxQt1UI5wxh6W5HO3RrPawT9juJQ8mCbhLCJn5h9lotAO0Nk4hZgRK/
        vqxemU7cDpn4jnjuTg3kwzFZxA7JAy0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-SDGCs-eTNAKcrTzbD1QW9A-1; Tue, 27 Sep 2022 10:13:57 -0400
X-MC-Unique: SDGCs-eTNAKcrTzbD1QW9A-1
Received: by mail-ej1-f72.google.com with SMTP id qf38-20020a1709077f2600b00783ac0b15f0so2753973ejc.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 07:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=EC7NiPEaGCSb2TyPzQWyG6jdptZsAgoo1o5L4uNHEzM=;
        b=TrFMlIXRXbduEWZlikJdrukYIkBnOUAEUUG5JvwmVnDuw1YYHTmZO4I0o4CNIpLBrK
         ZKcgaIj8nvY0NG3CWrmtTbMRDch26ykCnZ5cs/8u/5eR1/W2NwbKNzmAsdJkqm0J4OIQ
         Fg14kwm6/vCmMTbEjw+KSpv4M0chcIXedGfefKRlJaii/e5tSoXSFDEoR/Net08BFxef
         FTZsxs+PWZWAcTe/UW1Ts7nt4yww7wriVMom8ptj1bbsd3bQ6WWLZ5zoXqHf5rTK/Jv/
         65zjFTjj1o0jRh0uti6nIN05C/pElGUOkS6TTbCxQGZgXol0GX0pmGwxifrri5FsGwnh
         UvSw==
X-Gm-Message-State: ACrzQf2puVYXhrVv9rVueVY6G+aMk2YWUBcFGM6kfGH166VxydQ44rLo
        rsC42CF+weL8eoFSB48DwtI96pEry5UE9gMQ5Uwyaq/golnblUlQ/j6UruARWi5OhrZMzrXv51i
        Br8sLkFkUc0HrGS6pnQ65n5ElRgGTtCSehA==
X-Received: by 2002:a17:907:1dd7:b0:771:7257:2a06 with SMTP id og23-20020a1709071dd700b0077172572a06mr23005774ejc.319.1664288035936;
        Tue, 27 Sep 2022 07:13:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6F9fTTjRmyu1d1GGqrBuDlU3kWauZUu3OqOatr5cuEqXcKmofpyrQUwUeWgx5qIKDnFMdKzA==
X-Received: by 2002:a17:907:1dd7:b0:771:7257:2a06 with SMTP id og23-20020a1709071dd700b0077172572a06mr23005753ejc.319.1664288035722;
        Tue, 27 Sep 2022 07:13:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c22-20020a056402159600b004573052bf5esm1351757edv.49.2022.09.27.07.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 07:13:55 -0700 (PDT)
Message-ID: <02c36310-82a6-6c72-1495-ec01cd92a0b8@redhat.com>
Date:   Tue, 27 Sep 2022 16:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86/intel/wmi: thunderbolt: use dev_groups
 callback
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20220927135612.1602491-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220927135612.1602491-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/27/22 15:56, Shyam Sundar S K wrote:
> use .dev_groups callback instead of manual sysfs registration.
> Remove .probe and .remove callbacks as they become dummy after
> using .dev_groups.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/wmi/thunderbolt.c | 24 ++------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/wmi/thunderbolt.c b/drivers/platform/x86/intel/wmi/thunderbolt.c
> index 4ae87060d18b..fc333ff82d1e 100644
> --- a/drivers/platform/x86/intel/wmi/thunderbolt.c
> +++ b/drivers/platform/x86/intel/wmi/thunderbolt.c
> @@ -51,26 +51,7 @@ static struct attribute *tbt_attrs[] = {
>  	&dev_attr_force_power.attr,
>  	NULL
>  };
> -
> -static const struct attribute_group tbt_attribute_group = {
> -	.attrs = tbt_attrs,
> -};
> -
> -static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev,
> -				       const void *context)
> -{
> -	int ret;
> -
> -	ret = sysfs_create_group(&wdev->dev.kobj, &tbt_attribute_group);
> -	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
> -	return ret;
> -}
> -
> -static void intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
> -{
> -	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
> -	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
> -}
> +ATTRIBUTE_GROUPS(tbt);
>  
>  static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
>  	{ .guid_string = INTEL_WMI_THUNDERBOLT_GUID },
> @@ -80,9 +61,8 @@ static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
>  static struct wmi_driver intel_wmi_thunderbolt_driver = {
>  	.driver = {
>  		.name = "intel-wmi-thunderbolt",
> +		.dev_groups = tbt_groups,
>  	},
> -	.probe = intel_wmi_thunderbolt_probe,
> -	.remove = intel_wmi_thunderbolt_remove,
>  	.id_table = intel_wmi_thunderbolt_id_table,
>  };
>  

