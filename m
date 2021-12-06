Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C6CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Dec 2021 21:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351663AbhLFVde (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Dec 2021 16:33:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60312 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349317AbhLFVdd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 16:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638826203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p53Oezk+1OSj1lIwb4tUAgq9sOSOpWc8DC+JVKBLVzU=;
        b=WsqUhdyulVcN5HBF6qnVkzrVoh0YQsKSFa8GsuTt1HrZUCe8dp/T9nqy1c5GPu21URdBtQ
        EweIWtkPjO9DlNtVjvAV5YjHT077ZozJ/aLpenld2bSpFZEdKEdy74qrtXflaEPNWQkFZa
        isQOuGf1Jun/wN3m7Bk6/ZEPS6QeCi0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-ksJ9SyYuOwmfOGBNYVdRiA-1; Mon, 06 Dec 2021 16:30:02 -0500
X-MC-Unique: ksJ9SyYuOwmfOGBNYVdRiA-1
Received: by mail-ed1-f70.google.com with SMTP id b15-20020aa7c6cf000000b003e7cf0f73daso9401214eds.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Dec 2021 13:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p53Oezk+1OSj1lIwb4tUAgq9sOSOpWc8DC+JVKBLVzU=;
        b=PnC0eW+1iD1OhKVEsTk73uW3D+KPBwb0ZUeTSxoZwcFodwRbwOff6sAsnUsH9QAk2i
         rKSbTjzlYUYkRELnliJz5bZB3123LJNIg9a++GB9exantFuA3LoE2odtQlf9VvfB8ng/
         z1+jdZTyhr65EbMwT0oTifyYCb8KlKX6HfmvwhYN7CVNuETsT4S0Eub3XZyPt6wFmtuI
         adaBOYlw4FPO/m+CDc/PsWWwK8B3SQ3zUTczm+GlgeZ+7EfS5bqC4kVDnezDEbx4xW/x
         TnWnHDQXoed7jEMwh2pxXITp1QOkCri2AA0ckFxhmDuCspKVx4uJCgJQBNEqhTXozAQb
         qzxw==
X-Gm-Message-State: AOAM530sRQqJjCMS45GaAA6/Fz32zz9dKWti0CXELFYKuaDrjDpxPN6w
        p6QnlsPNDr9HwvYmQ7ezflYZuScg0G+HbuQpi1e0sFhdi6LV12bHd263SpPcmZU6WYlEw1bU2VW
        sjh/v5yZGFr1VMCskZPYD50fbhLU8c94cEw==
X-Received: by 2002:a17:906:fcbb:: with SMTP id qw27mr47382577ejb.320.1638826200911;
        Mon, 06 Dec 2021 13:30:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuUvSXjWJL6H/9MMTz/nsEtjTv40TckCVGyIdz4xyLwFEflF9jGzxbEBhtYQRLgBPLfOA6lw==
X-Received: by 2002:a17:906:fcbb:: with SMTP id qw27mr47382557ejb.320.1638826200752;
        Mon, 06 Dec 2021 13:30:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e8sm9681219edz.73.2021.12.06.13.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 13:30:00 -0800 (PST)
Message-ID: <63bfe091-ef07-8747-745d-11d5aacab847@redhat.com>
Date:   Mon, 6 Dec 2021 22:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86/intel: hid: add quirk to support Surface Go
 3
Content-Language: en-US
To:     Alex Hung <alex.hung@canonical.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     stable@vger.kernel.org
References: <20211203212810.2666508-1-alex.hung@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211203212810.2666508-1-alex.hung@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/3/21 22:28, Alex Hung wrote:
> Similar to other systems Surface Go 3 requires a DMI quirk to enable
> 5 button array for power and volume buttons.
> 
> Buglink: https://github.com/linux-surface/linux-surface/issues/595
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will also include this in my next fixes pull-req for 5.16.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/intel/hid.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 08598942a6d7..13f8cf70b9ae 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -99,6 +99,13 @@ static const struct dmi_system_id button_array_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Tablet Gen 2"),
>  		},
>  	},
> +	{
> +		.ident = "Microsoft Surface Go 3",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 3"),
> +		},
> +	},
>  	{ }
>  };
>  
> 

