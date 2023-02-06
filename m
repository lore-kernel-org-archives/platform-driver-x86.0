Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4054C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 13:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjBFNtW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 08:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjBFNtF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 08:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14117A5D7
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675691216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vDkUqvD2RjYYwz8cwN7SMBQ85TuY/Pc0ZHuJPwmAGQQ=;
        b=hNZZ6G8QuPeY6APobWl+pvvYnHTtD7zGlu775WIAR2/c3LwICJJjGr5x6hflZIe9YBuxS5
        8lUGpdU+TuIZJGUyMCmOyOcqkaJlJ40B4YpHz1TExON1jTacFpb94R40fwFBYEWCjYie0g
        hQntzApsxrE9J8UpFl2/ax32YkzSiJA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-2VNyJPiaO8ygg4r6MC2Now-1; Mon, 06 Feb 2023 08:46:55 -0500
X-MC-Unique: 2VNyJPiaO8ygg4r6MC2Now-1
Received: by mail-ej1-f72.google.com with SMTP id js21-20020a17090797d500b008858509ff2aso8720912ejc.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Feb 2023 05:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDkUqvD2RjYYwz8cwN7SMBQ85TuY/Pc0ZHuJPwmAGQQ=;
        b=Lx8AQMqBdPEdje9j9IZlJdOfykWIMSdmPcuIERXkyFT8uB0x5ZBIs+BU3kfbuLrpOO
         btOreyiS3Ov6ee3K+NW7KPc0bX79RKwbylr8YnKFQjETU1EJpqmuf/b2mZoJw1WYBfe1
         u0DS9UhyLatIw2+MevK0LHibPvmyM/6W7A0Tc8S2D9pJiSDbVj/IkelKQkAYYazl+cvO
         /1DpH89BEKdrXy3zTMPgqyXAq2OZ1iy2EyX/ec69GkToGYP+vohvBO0LdbqNndz62gW+
         iCClHCHeq/QcNXT4O0chaDdnuBh3zRyguIdPkHANzUNVje3WyA2L3jJ09ihpskMVyWpJ
         09kg==
X-Gm-Message-State: AO0yUKU2vG6Rs20/HVnE5RWT5C3B9dTpIX2bdf3fCvfNhDr5dXoJDtBy
        RRHLFclM2LdMHzZKVyIOuI6/ruwcEss85Clr2UGCxCPNX30rsA+MGWQz/6tXPzG4Zk9uOFgI3bb
        SJ+rWowWYDq5xC6CQWG8n/FUUJqIlf161Ng==
X-Received: by 2002:a17:907:2c66:b0:88d:ba89:184c with SMTP id ib6-20020a1709072c6600b0088dba89184cmr15151128ejc.29.1675691213875;
        Mon, 06 Feb 2023 05:46:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9dJ1jg35a60F/4yjmMzRmvhRzVhhqiQkPO/4XFDo8zmnH8K8n3oowcr/lixDvslLYI2qG60Q==
X-Received: by 2002:a17:907:2c66:b0:88d:ba89:184c with SMTP id ib6-20020a1709072c6600b0088dba89184cmr15151115ejc.29.1675691213682;
        Mon, 06 Feb 2023 05:46:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709064b1600b008786675d086sm5468334eju.29.2023.02.06.05.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 05:46:53 -0800 (PST)
Message-ID: <24a9fe52-740c-68f0-5869-ab2fd470cdfa@redhat.com>
Date:   Mon, 6 Feb 2023 14:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: int3472/discrete: Drop unnecessary
 obj->type == string check
Content-Language: en-US, nl
To:     Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230204110223.54625-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230204110223.54625-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/23 12:02, Hans de Goede wrote:
> acpi_evaluate_dsm_typed() already verifies the type is the requested type,
> so this error check is a no-op, drop it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 96963e30ab6c..f064da74f50a 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -78,14 +78,6 @@ skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
>  		return ERR_PTR(-ENODEV);
>  	}
>  
> -	if (obj->string.type != ACPI_TYPE_STRING) {
> -		dev_err(int3472->dev,
> -			"Sensor _DSM returned a non-string value\n");
> -
> -		ACPI_FREE(obj);
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>  	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
>  		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
>  			    obj->string.pointer))

