Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DFAC48BCF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:19:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 496096128A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhFIPVU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36817 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235395AbhFIPVM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623251957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QbxMiCmVlhmvtGLBlrRbyxAPERLpY+2Y0awhMqdXbIE=;
        b=dg9C/2UsD+8Jo/h1LwbnrvsjRfaP9BlA8ldGiBZ+MlTT73RcAVASviY17FnQjUvq3ue/ty
        +Oztdx3UYXaUWZvRrfmfoLxZzFIzg0oz3DIBAmDM4JvmA1dYnQOwjN5YZr5Rf0ya6N8J5B
        ByQg83qiIzLbumqSz1vUcDAu5mA8u6A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-sk5YlwT2MDaPLXGIFIkspA-1; Wed, 09 Jun 2021 11:19:16 -0400
X-MC-Unique: sk5YlwT2MDaPLXGIFIkspA-1
Received: by mail-ed1-f72.google.com with SMTP id x12-20020a05640226ccb0290393aaa6e811so2744982edd.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 08:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QbxMiCmVlhmvtGLBlrRbyxAPERLpY+2Y0awhMqdXbIE=;
        b=pN0XUkWiZRHQvKaxvH5Mo0+X0Y9oQZQi14JzlkDN2j+5zL/3wjKqFwG3AEuFkSPgaC
         CkWqlqancubCUldqq21ya0yd0ZhmgZPOa/Yc3NP6HAmz7wCoYfjAALd1TuLYdcDeft2z
         GzIYDjWA2DpyEyFeIOJQuZPAkYN/pBT8BNQx6YEnvJG8nYcV0U56FgGNLEc3hQpZyGCE
         Bu8JG1uT42WppVgMV+yguNS2UFvI5njBs9+/RqkVo92HT+e12ZCsvOz7i/yCNfb+x00F
         YlJNyl1ED7pduONc3fwmuDAl1AuwnDnKMULOoS8Vp9lj1jC165Xs/H9gPkeFvCjWmOwX
         6R/A==
X-Gm-Message-State: AOAM533TsKFQEnw7rvLNohXx339uKDS3eyZw24B+CpTLas8o3ocrtOsR
        twLNxM5skIfXmglVTb8C8R6Qm2P+vMxMIcQC3LdiAUu9D9jhPZH0cVdtrhEh2oOxeZS+Mb3Lznu
        IQtZHhhuOEsBJwHvtbWjc9x5qAVZ4iKYmXA==
X-Received: by 2002:a17:906:15c2:: with SMTP id l2mr406185ejd.348.1623251954145;
        Wed, 09 Jun 2021 08:19:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4r2pNY3uadjwi92nD4qO9/WwZmYugcLgFbbF8C+ZV+qgy1eCLZIr6GXtRFrS+vhZWjZaG7A==
X-Received: by 2002:a17:906:15c2:: with SMTP id l2mr406177ejd.348.1623251954012;
        Wed, 09 Jun 2021 08:19:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id fv13sm23692ejc.33.2021.06.09.08.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 08:19:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] platform/x86: think-lmi: Fix check for admin password
 being set
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        coverity-bot <keescook+coverity-bot@chromium.org>
References: <20210609151752.156902-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <32058718-25e2-77c4-1881-29573e935150@redhat.com>
Date:   Wed, 9 Jun 2021 17:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609151752.156902-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/9/21 5:17 PM, Hans de Goede wrote:
> tlmi_priv.pwd_admin->password is an array (not a pointer), so the correct
> way to check for the password being set is to check for
> tlmi_priv.pwd_admin->password[0] != 0.
> 
> For the second check, replace the check with checking that auth_str is
> set instead.
> 
> Cc: Mark Pearson <markpearson@lenovo.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1505158 ("NO_EFFECT")
> Fixes: a7314b3b1d8a ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans branch (soon to be pdx86/for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/think-lmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index c6413b906e4a..4881de4e669d 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -537,7 +537,7 @@ static ssize_t current_value_store(struct kobject *kobj,
>  	p = strchrnul(new_setting, '\n');
>  	*p = '\0';
>  
> -	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
> +	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>  		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>  				tlmi_priv.pwd_admin->password,
>  				encoding_options[tlmi_priv.pwd_admin->encoding],
> @@ -563,7 +563,7 @@ static ssize_t current_value_store(struct kobject *kobj,
>  	if (ret)
>  		goto out;
>  
> -	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
> +	if (auth_str)
>  		ret = tlmi_save_bios_settings(auth_str);
>  	else
>  		ret = tlmi_save_bios_settings("");
> 

