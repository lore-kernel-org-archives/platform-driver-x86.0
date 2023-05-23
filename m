Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6376FC7EE23
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 10:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236491AbjEWKrA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 06:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236256AbjEWKq7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 06:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95076FF
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 03:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684838771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mHOWHKjqyu8zM7VyoQmN1VEsqEjzLmFlnvh8RE24jpU=;
        b=B+oFL7wuvB+apLNJzhdI3oTgIQ8FdaXxriAnOEWs5VSx4tAeuP9d5XuzdIar9FpHDeIJ9o
        12cY7yteW2qLqlfloM7w/cyzood1ut+r0MdrIHRUZM5IQfbhxXyWp+8vB6MU2yaWSB3aJs
        vJK7iENbU3pWfl5wymAeFN5T7cRAA5U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-kKPKk452NDWsrLdS71MZLQ-1; Tue, 23 May 2023 06:46:10 -0400
X-MC-Unique: kKPKk452NDWsrLdS71MZLQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-513e916ed47so788229a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 03:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684838769; x=1687430769;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHOWHKjqyu8zM7VyoQmN1VEsqEjzLmFlnvh8RE24jpU=;
        b=IfGfeNZENgE/iAs2Ab2mfIu6wN8QqDgBysw4t85lw0aE88xxsrmdKDwr2qsSRs9Ckn
         qj4SMyfZYjHaM5NIyhZXtpMilP9TM1ka3evGoVQxXgmXttkfb1qeL/tiqvKGP82hADfw
         5v3zsPAZm2md9SZ+XnZz+KaNiQf8zXJUQa36U067QawxFtM3Tp5dz1fkPG6l3CKb8MSj
         v63FDTla2vsi90zwe6jJPB4j0uaA1n+3U69hYKQdnpdmjSsud1l9JZMPXCWxZOwmlO3W
         5Jr7jmBKK9639UuOEIVnQapZmsLBjv0NpHykcklo3Sbx9/ElI0HRwTJPtjSK6+bd7JsK
         B0yA==
X-Gm-Message-State: AC+VfDwLAaLjK2c6POKNCy1CtXigJoF822eeoxDRDQyYezYx3WULWvCw
        wW6hEqrAC5RkSVcRkhiApy/P+wz1yOsD0VBIB4Xhat1wNZ+svxCuDhf+qU+zVq5O1eGBuHOk+sH
        yzTDMlBbl16r82lXm4UJRez0gpGIhUeeI/JlOc8g9Dg==
X-Received: by 2002:a50:ee8f:0:b0:50b:d495:106c with SMTP id f15-20020a50ee8f000000b0050bd495106cmr12468471edr.8.1684838768811;
        Tue, 23 May 2023 03:46:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YtOe1MYd+n7E7C2t0Qc5nS/36P4GsrLsL8PAtrfA2Tg9JH8dvQyQqC7d0aMMeAHPQG6kYLg==
X-Received: by 2002:a50:ee8f:0:b0:50b:d495:106c with SMTP id f15-20020a50ee8f000000b0050bd495106cmr12468454edr.8.1684838768494;
        Tue, 23 May 2023 03:46:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d18-20020aa7d5d2000000b0050bc9ffed66sm3987790eds.53.2023.05.23.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 03:46:07 -0700 (PDT)
Message-ID: <b79fa66c-b8bc-125c-ccfa-9dae727022e9@redhat.com>
Date:   Tue, 23 May 2023 12:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] platform/x86: think-lmi: Enable opcode support on
 BIOS settings
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230517181945.3725-1-mpearson-lenovo@squebb.ca>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230517181945.3725-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 5/17/23 20:19, Mark Pearson wrote:
> Whilst reviewing some documentation from the FW team on using WMI on
> Lenovo system I noticed that we weren't using Opcode support when
> changing BIOS settings in the thinkLMI driver.
> 
> We should be doing this to ensure we're future proof as the old
> non-opcode mechanism has been deprecated.
> 
> Tested on X1 Carbon G10 and G11.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/think-lmi.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 1138f770149d..d9341305eba9 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1001,7 +1001,28 @@ static ssize_t current_value_store(struct kobject *kobj,
>  				tlmi_priv.pwd_admin->save_signature);
>  		if (ret)
>  			goto out;

> -	} else { /* Non certiifcate based authentication */
> +	} else if (tlmi_priv.opcode_support) {
> +		/* If opcode support is present use that interface */
> +		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
> +					new_setting);
> +		if (!set_str) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +
> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
> +		if (ret)
> +			goto out;
> +
> +		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
> +			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
> +					tlmi_priv.pwd_admin->password);
> +			if (ret)
> +				goto out;
> +		}
> +
> +		ret = tlmi_save_bios_settings("");

I'm a bit confused about how this works. You are calling the same
LENOVO_SET_BIOS_SETTINGS_GUID as the old non opcode based authentication method
without any auth string.

And then afterwards you are calling LENOVO_OPCODE_IF_GUID with
"WmiOpcodePasswordAdmin:<passwd>"

Won't the initial LENOVO_SET_BIOS_SETTINGS_GUID get rejected since
it does not include an auth-string and you have not authenticated
yet using the opcode mechanism either. IOW shouldn't the opcode
auth call go first ?

And how does this work timing wise, vs races with userspace doing
multiple sysfs writes at once.

If the authentication done afterwards really acks the last
LENOVO_SET_BIOS_SETTINGS_GUID call then a userspace based
attacker could try to race and overwrite the last
LENOVO_SET_BIOS_SETTINGS_GUID call before the ack happens... ?

If this code really is correct I think we need to introduce
a mutex to avoid this race.

And this also needs some comments to explain what is going on.

Regards,

Hans





> +	} else { /* old non opcode based authentication method (deprecated)*/
>  		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>  			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>  					tlmi_priv.pwd_admin->password,

