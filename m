Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5533CC432BE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 13:38:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AECF61131
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 13:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243524AbhHFNic (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Aug 2021 09:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58253 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344071AbhHFNib (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 09:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628257095;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fYa8CRqasptaxs6yBt32BGt8NUuLhgiXe4Y6xRunAnw=;
        b=B/6a9+xQ7D5BKAULcq6nDd1BgGQG2X+nYtkuS5rAdXl1w7kt+HF09d+npwjlI/dOMY9IR0
        kM1ts07mA6sFDJbfM1uxaggds90OtXqEtyWMAUgkwYmdAAct9CdXW6lV9ZFz0ilu0lIbe6
        Y8KdprdHYljOWaoh0wUW1Bx9xEkWhAg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-8XC2QdCyMHWQl3lE7aUTpQ-1; Fri, 06 Aug 2021 09:38:14 -0400
X-MC-Unique: 8XC2QdCyMHWQl3lE7aUTpQ-1
Received: by mail-ej1-f72.google.com with SMTP id g19-20020a1709065953b02905a4506b6d92so3137884ejr.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Aug 2021 06:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fYa8CRqasptaxs6yBt32BGt8NUuLhgiXe4Y6xRunAnw=;
        b=Qme9xO2+M/4yMN1oOqUgP6NeORjmh1gNKvT4ZRO3zblX5E0WpOutbiy2IpBg4tqGRK
         XihGuJTW+msncR12OWx/6wKzmfKtnBHp8M1E8yVRd2Xwj/6P1id/KLYhdBSxY/Rpx9PS
         byg21iZITqW/Ki0uU46/ZGELRs0lmDQTLJUjBwKGCr2JnlS7zQMcCh1P7I9oES9pXL2v
         aogJV4rGhmD5GhRoOf6xzUvtTAmIQvO0llQv0+nnoc7SROhA8k1vwBtd6M636T3alqD4
         VHzCGRWCfWEhkQuo/WeJHjhYm0qb+me3y59I8QWHYhfkMG0fZf7Dj3FUuVyqHKzhyHrU
         8QCw==
X-Gm-Message-State: AOAM531jtUDupDaVI+CTe2n2AqjmwtM8J9mRfiefc3avS1uSs4zJBJvf
        qrb9Si8EAFOwtD1ZxuxsEIoYVVnX6SOHna+7EDvQSB4Aci4jHxnK1xDuS8BLhLSS5gqzc+HCKmQ
        3UWqpmTHTKcHgqt8QlxDY49cdIMpqFqE66g==
X-Received: by 2002:aa7:c042:: with SMTP id k2mr13334959edo.104.1628257093439;
        Fri, 06 Aug 2021 06:38:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZn/rzGnyhcNYCt1sjBcqqMA7zco7p97DVv+8sA09OIOtnDGJqNrEGDKYG57+uhfsgiO3NTQ==
X-Received: by 2002:aa7:c042:: with SMTP id k2mr13334947edo.104.1628257093340;
        Fri, 06 Aug 2021 06:38:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e7sm3959181edk.3.2021.08.06.06.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 06:38:13 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] platform/surface: surface3_power: Use
 i2c_acpi_get_i2c_resource() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
References: <20210803163252.60141-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <69085eb2-7695-4998-dfb0-75e644d76131@redhat.com>
Date:   Fri, 6 Aug 2021 15:38:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803163252.60141-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/3/21 6:32 PM, Andy Shevchenko wrote:
> ACPI provides a generic helper to get I²C Serial Bus resources.
> Use it instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
>  drivers/platform/surface/surface3_power.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index dea82aa1abd4..90c1568ea4e0 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -384,13 +384,7 @@ mshw0011_space_handler(u32 function, acpi_physical_address command,
>  	if (ACPI_FAILURE(ret))
>  		return ret;
>  
> -	if (!value64 || ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS) {
> -		ret = AE_BAD_PARAMETER;
> -		goto err;
> -	}
> -
> -	sb = &ares->data.i2c_serial_bus;
> -	if (sb->type != ACPI_RESOURCE_SERIAL_TYPE_I2C) {
> +	if (!value64 || !i2c_acpi_get_i2c_resource(ares, &sb)) {
>  		ret = AE_BAD_PARAMETER;
>  		goto err;
>  	}
> 

