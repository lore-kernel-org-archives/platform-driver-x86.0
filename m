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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59F6C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 16:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BED00610F8
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 16:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhFIQGt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 12:06:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42349 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230245AbhFIQGt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 12:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623254694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jlsRXJEr6LiJo2+q8NkInylNQDLsfhpmGjGniaTEWmM=;
        b=HZ2UOspKPR6J5AiYZDYMsCoqQvg2UdSAqVYatqbisAU2vCeyROAOYqSBwW37O/Y4E2FskR
        szHVmA7MVAwm0ZzQxSu4D0KBNeRb0hvrGoAoKuz+0iQzNZ0ik3VpQyMhftMB1tPk7tjGUz
        wnLdW+t/j3l2Y9H8E+drRVdJ+GHdZKM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-DbO-XUdsOBKvjrdO6YNY2A-1; Wed, 09 Jun 2021 12:04:53 -0400
X-MC-Unique: DbO-XUdsOBKvjrdO6YNY2A-1
Received: by mail-ej1-f72.google.com with SMTP id e11-20020a170906080bb02903f9c27ad9f5so8201497ejd.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 09:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jlsRXJEr6LiJo2+q8NkInylNQDLsfhpmGjGniaTEWmM=;
        b=e9EU9oQznbWjIc/SnhUHOm6BrEQITZ0wmoUhllrzUgVXeOrnkTjGJSUVDBvQJzYS0X
         hEMqnd6gtCYzONjMjzmqoLxX+SvF7U6rDwmdtLFcJ27DYi8Jz0PwG5uOrqqzEXkaiXTd
         LiFHQSaCWWm6QI73cLgXIZFHMSdSEN2b+dhP8bbddXV3k5uYNxJ5dAMNLJ1x1tVgx3OI
         fqWfhHs90FesaLRKzvLwLdEsbcIhz0INYLwFk6Kzx6fZh6wI1t0Ppm084ZtSEpp+1ZC7
         NTEdVzX38I9ltNLh2Ph/Cs+639PPqvU/opzKzHSXv8J+YB0m1odISZ4DBIrWVwATsxMf
         SkLw==
X-Gm-Message-State: AOAM531p+mPLY/okHLwZDc98XHnsc8udnEakYZnvF5vUIdn7tMeGli4s
        J4HGHhBS9fv1oNMgS7JBN+HM/7weDPz3RGMJ+DL6Ab6Rc03n8np2ccq6xCF6reJevo4E/9Q1tMo
        cbWc5UUChhQPYdtR56cNbsK13qAFYvGt2AA==
X-Received: by 2002:a17:907:7848:: with SMTP id lb8mr597234ejc.494.1623254692091;
        Wed, 09 Jun 2021 09:04:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxZ0Bs8BiBbljc4OGOpwfru3Q0ICUTvzCkmjEbSYRb1tmwl0z3LAjYZ4WMHg4pBmK/e2g+0g==
X-Received: by 2002:a17:907:7848:: with SMTP id lb8mr597220ejc.494.1623254691934;
        Wed, 09 Jun 2021 09:04:51 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d24sm69575edr.95.2021.06.09.09.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 09:04:51 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: set fw_attr_class
 storage-class to static
To:     trix@redhat.com, divya.bharathi@dell.com, prasanth.ksr@dell.com,
        mgross@linux.intel.com
Cc:     Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210609153445.3090046-1-trix@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <073c59e6-8d2c-2412-537b-2fd5f78538c8@redhat.com>
Date:   Wed, 9 Jun 2021 18:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609153445.3090046-1-trix@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Tom,

On 6/9/21 5:34 PM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> An allyesconfig has this linking error
> drivers/platform/x86/think-lmi.o:
>   multiple definition of `fw_attr_class'
> drivers/platform/x86/dell/dell-wmi-sysman/sysman.o:
>   first defined here
> 
> fw_attr_class is only used locally, so change to static
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thank you for your 2 patches, I just merged another patch doing
the same earlier today.

Regards,

Hans


> ---
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 1378c18786582..636bdfa83284d 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -25,7 +25,7 @@ struct wmi_sysman_priv wmi_priv = {
>  /* reset bios to defaults */
>  static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
>  static int reset_option = -1;
> -struct class *fw_attr_class;
> +static struct class *fw_attr_class;
>  
>  
>  /**
> 

