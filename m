Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A09C433E6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A17E764E8C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbhBDMPP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 07:15:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33469 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235531AbhBDMPO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 07:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612440827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qy7ncWeOZRzwUPx4/jZwwk37p129+F5dsAFdjVYo8aM=;
        b=MLjcE1h/6XtbBD5ArRps5DC9k8dEsM3vh6KZsoRgUoZZuNcMVxWEWIuCmV4EgWF5YSaOgX
        91S6zaJFfwrsY8mP9SJMITmW8bjjuy4IYyYaLkEpQcIhhja5zKY+koU+rjBlNb8Bp2u/Wl
        94t9EGkD5QXqB2SrU3tRYyb77p3JXhY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-HBrGcy1yMP2LpBj3nGt4ng-1; Thu, 04 Feb 2021 07:13:45 -0500
X-MC-Unique: HBrGcy1yMP2LpBj3nGt4ng-1
Received: by mail-ej1-f70.google.com with SMTP id h4so2451365eja.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 04:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qy7ncWeOZRzwUPx4/jZwwk37p129+F5dsAFdjVYo8aM=;
        b=h8XFC5+UwciphbnTeyudAH+M+ZHgTjPqx+hbZnIbo3JL9uYColNjl4Ygn1rqWYTWrf
         Zb4SpzaPqFc8TrdVagoKEkIaMCF0/le2xeEuTOq3Tf8Zr3vmQg/hsFLCdpau9Mcn7InJ
         rd4Ew8o5xeloPqbyvVb52/xqgNcV0+IWTvcsUYUyJJVNYMqhVog/at7oaXJ7MjHJ9Zed
         uybRJ3IOm4Mou0120BL+oFiCM+NIdYoBNeUjdPT51Q4AqLWs5i7yffjeVmrLbB5hm0wl
         p4iz9Ind0mUrDhRjp5NUS/GoZPjhfX7iTANCgNseAMlIEFfELHM8F2hgdAp8rFytjKHi
         TPKA==
X-Gm-Message-State: AOAM533ma/a/lqKN8gaAJs3tpPToZr/fLkGZ1NOyssWPFMDNp2fryqlq
        3cEpoiRuDabxm9Wm4YtbLRdYcpiXRn4jmmCw9m5I8McAz7BSDvvHc8ytcmFhdZClOoGmn/fRShw
        3wM7vpYm8tRyVdn9+YyoklaunORxkIWwzww==
X-Received: by 2002:aa7:d1d7:: with SMTP id g23mr7641981edp.6.1612440824550;
        Thu, 04 Feb 2021 04:13:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBm0+Ya9BvAsujkV4/IUJ3+78Tls8gUxbmaOuHlJ3l9cCux6RWNB+yfqcGnU37ni9wmubA0w==
X-Received: by 2002:aa7:d1d7:: with SMTP id g23mr7641963edp.6.1612440824424;
        Thu, 04 Feb 2021 04:13:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id k9sm2371966edo.30.2021.02.04.04.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 04:13:43 -0800 (PST)
Subject: Re: [PATCH] platform/surface: surface3-wmi: Fix variable 'status' set
 but not used compiler warning
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210204113848.105994-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <18bdebb1-d004-f50b-91bd-51eec83c3ace@redhat.com>
Date:   Thu, 4 Feb 2021 13:13:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204113848.105994-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/21 12:38 PM, Hans de Goede wrote:
> Explicitly check the status rather then relying on output.pointer staying
> NULL on an error. This silences the following compiler warning:
> 
> drivers/platform/surface/surface3-wmi.c:60:14: warning: variable 'status' set but not used [-Wunused-but-set-variable]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this patch to my review-hans branch, so it should show up in pdx86/for-next soon-ish.

Regards,

Hans



> ---
>  drivers/platform/surface/surface3-wmi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface3-wmi.c b/drivers/platform/surface/surface3-wmi.c
> index 130b6f52a600..fcd1d4fb94d5 100644
> --- a/drivers/platform/surface/surface3-wmi.c
> +++ b/drivers/platform/surface/surface3-wmi.c
> @@ -57,12 +57,16 @@ static DEFINE_MUTEX(s3_wmi_lock);
>  static int s3_wmi_query_block(const char *guid, int instance, int *ret)
>  {
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj = NULL;
>  	acpi_status status;
> -	union acpi_object *obj;
>  	int error = 0;
>  
>  	mutex_lock(&s3_wmi_lock);
>  	status = wmi_query_block(guid, instance, &output);
> +	if (ACPI_FAILURE(status)) {
> +		error = -EIO;
> +		goto out_free_unlock;
> +	}
>  
>  	obj = output.pointer;
>  
> 

