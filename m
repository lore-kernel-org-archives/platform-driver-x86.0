Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A0FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 14:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237686AbiD0OTS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237485AbiD0OS6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 10:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9A39532CD
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651068944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=56SFBUQIXuZdvLlFEi/VG57/X2ADtpCmA6Io9xUF8Xg=;
        b=MkWJFUZgmoPMhHDDUltFwE1rmF0O5ApFxywYAiOK5q6V6HI+mN8bfbcXXzRgl2CfDpiCPP
        kxvKs8ydaIgp0Tg9UYdBBlRNlMGe4DtDZP2v8HR735VTE1AdtUBFqNZH7xWHsNtqz9qsYx
        uHDiQ08VP9fYc+97JQUc81CZNksl09g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-BSivFrBlPAeOJTs7fFT-8w-1; Wed, 27 Apr 2022 10:15:40 -0400
X-MC-Unique: BSivFrBlPAeOJTs7fFT-8w-1
Received: by mail-ej1-f70.google.com with SMTP id qw33-20020a1709066a2100b006f001832229so1253808ejc.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=56SFBUQIXuZdvLlFEi/VG57/X2ADtpCmA6Io9xUF8Xg=;
        b=IFh676NQqtVnS313i8SN5c2Kv7Xp4WLtMF7DjO6EhA4vYJtiR9nmIJMYFfXkgiStb5
         hQBfL7axROVlo/h0+BK0Nl3DeJwSLsfXaM2rBrJhN64gw0Z4ye3MbA0noxO71uO5kZ95
         7utFhsDZca1i7ye/z014QMKUSg1gb/fp0PJrPXjQyz1SOS8ehvn9nqFQorxZrA0mbJtj
         2pGo/rZJX9sJjkjQO+UH4OjAZRT2F7pLJgkclAfEDZtchPa54DeTl6bSu2AZ+KgF5DfT
         cEqyI9YAICVxEjP529XlZJQCm/653jzZ+7Bpaa3yOG1Eg0j0P2QvPih3z9HYkYcoOpcB
         ti/g==
X-Gm-Message-State: AOAM530/d8xg26cGZDY91j9v7PFK2rfMH8ZpDqnrhKn7iYypDNMEOevh
        lXjV/cQ88dnmtKPkDhzv3W+olTk55CHvKK6C8au6kRmVVzx37y6ikUS+y875yStCbE40DfNlzVJ
        CBD7VvQ5oCGNAjpjgu08NCQMzHKzylV/XtQ==
X-Received: by 2002:a17:907:2d25:b0:6f3:906a:bae3 with SMTP id gs37-20020a1709072d2500b006f3906abae3mr15086366ejc.210.1651068939532;
        Wed, 27 Apr 2022 07:15:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYaDC+7NXORtI/iA2Uyywz9676iA8c/I5D2LMSdNCYxkYOgMHmuIhDQ9Yk1jgaoBhEoOSX1w==
X-Received: by 2002:a17:907:2d25:b0:6f3:906a:bae3 with SMTP id gs37-20020a1709072d2500b006f3906abae3mr15086349ejc.210.1651068939337;
        Wed, 27 Apr 2022 07:15:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y66-20020a50bb48000000b00425d6bc42b7sm6632693ede.69.2022.04.27.07.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:15:38 -0700 (PDT)
Message-ID: <bc5b5574-53b8-118a-444f-d036c4b6b798@redhat.com>
Date:   Wed, 27 Apr 2022 16:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Potential buffer overflow in
 asus_wmi_evaluate_method_buf()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     Mark Gross <markgross@kernel.org>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220413073744.GB8812@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220413073744.GB8812@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/13/22 09:37, Dan Carpenter wrote:
> This code tests for if the obj->buffer.length is larger than the buffer
> but then it just does the memcpy() anyway.
> 
> Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan curves")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  drivers/platform/x86/asus-wmi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 2104a2621e50..7e3c0a8e3997 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -371,10 +371,14 @@ static int asus_wmi_evaluate_method_buf(u32 method_id,
>  
>  	switch (obj->type) {
>  	case ACPI_TYPE_BUFFER:
> -		if (obj->buffer.length > size)
> +		if (obj->buffer.length > size) {
>  			err = -ENOSPC;
> -		if (obj->buffer.length == 0)
> +			break;
> +		}
> +		if (obj->buffer.length == 0) {
>  			err = -ENODATA;
> +			break;
> +		}
>  
>  		memcpy(ret_buffer, obj->buffer.pointer, obj->buffer.length);
>  		break;

