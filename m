Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D13C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Feb 2023 10:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbjBBKqI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Feb 2023 05:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjBBKph (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Feb 2023 05:45:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E0A7CC8B
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Feb 2023 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675334684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4a642eq89tRIEheIFpXnkBzx135sbHh/1JIiDUJOvpM=;
        b=d/3Yzzd6aAvQ/gdHafij5ze5af/ox9CWigMAZm+LwdtvGX8EhiJMKuvAdPTbUoYeczUfHI
        F26T41/iUOsC6u+dpGeJCQ/oP47D8jAEqeNh4EjRSY83kvQmlawBfyzJNnwe5YQuqd/FQk
        mb1xWbD32rkLTzeyK+nOy64mcQ9CDQ4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-9kQfYaHjPRakeQFknQl3hw-1; Thu, 02 Feb 2023 05:44:43 -0500
X-MC-Unique: 9kQfYaHjPRakeQFknQl3hw-1
Received: by mail-ed1-f72.google.com with SMTP id z18-20020a05640235d200b0049d84165065so1145559edc.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Feb 2023 02:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4a642eq89tRIEheIFpXnkBzx135sbHh/1JIiDUJOvpM=;
        b=FwNfqX36b+Z73qjgzB2BcscsDN1iriB1etCTTM2iw5sEP6fTZ1MdLzq+VHaMTzjhCj
         dm+A6N3p26FK8QjNpYPz82+UeDtsWzBLB0ZBPWjfSJBfgvDEOvjuUoQwFz87uINc8dW9
         JoUrrGCoJErRt1xV0Wa00TQQ5wlWter3F38nFpir7R8x0NwKCFbSsuNKYH88LViH0SQL
         Kk5sA3x1Ck9gnB0BXoHBWyM1vGC2dGrGQ65ENVC8jQmqJdrLrB2mgt/ELbQ3JRIPMJsd
         +C6JO4/RK/1JkkLvlkFp9pZqlPwBI3CnN6anh9DBndwvgq6mjnrRbqew8THUK43Blt4j
         Uosg==
X-Gm-Message-State: AO0yUKUb++Ztd+GUXmQlp2jgSjNjpsv/lpfarJD1qBQuq+FwTJkX5eai
        teUT3/Mba68JCHRc0rIik1oKiLRMNX/j6vvPklp9m2QTND3WNHA7NK2HFWD4JWXVXe1mkz/Yn9Q
        u0mmElPAQSgJPp/VoJMfCDBTXVXbDlSZjnw==
X-Received: by 2002:a17:906:48ce:b0:887:4da4:d332 with SMTP id d14-20020a17090648ce00b008874da4d332mr5937685ejt.38.1675334681658;
        Thu, 02 Feb 2023 02:44:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/jrzkmc8rML/46MTIDoosNgvo6Ty4dBJYZgbaTTGjTb2ebzEovSAaFhct6S5C9Io5WzVjgkA==
X-Received: by 2002:a17:906:48ce:b0:887:4da4:d332 with SMTP id d14-20020a17090648ce00b008874da4d332mr5937680ejt.38.1675334681537;
        Thu, 02 Feb 2023 02:44:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709065dce00b0088ee56fb24dsm1050566ejv.103.2023.02.02.02.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:44:41 -0800 (PST)
Message-ID: <173fc321-cc70-4def-2e75-710a6b57ac8a@redhat.com>
Date:   Thu, 2 Feb 2023 11:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add Chuwi Vi8 (CWI501) DMI
 match
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230202103413.331459-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230202103413.331459-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/2/23 11:34, Hans de Goede wrote:
> Add a DMI match for the CWI501 version of the Chuwi Vi8 tablet,
> pointing to the same chuwi_vi8_data as the existing CWI506 version
> DMI match.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/touchscreen_dmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index f00995390fdf..13802a3c3591 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -1097,6 +1097,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BIOS_DATE, "05/07/2016"),
>  		},
>  	},
> +	{
> +		/* Chuwi Vi8 (CWI501) */
> +		.driver_data = (void *)&chuwi_vi8_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "i86"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "CHUWI.W86JLBNR01"),
> +		},
> +	},
>  	{
>  		/* Chuwi Vi8 (CWI506) */
>  		.driver_data = (void *)&chuwi_vi8_data,

