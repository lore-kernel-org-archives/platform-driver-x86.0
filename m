Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AC7C636D6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Feb 2023 16:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjBVQe4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Feb 2023 11:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbjBVQex (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Feb 2023 11:34:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E19360B8
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Feb 2023 08:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677083648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q8esxfJVTT75yFXIXwSeTLZl15U5SPnHoZLa97NCnZE=;
        b=R8whmgqsYj3CxaXZyqIDVvGg2YCcwjFdoCYfnLfNkAejWJBL3qr1I/Dw5cqFvNMx0CWONJ
        /auFqVyyQd47ShbkgxmV/wyUquKG21a5GlAGLoyAi9+YS9sFZwzZ16N/St3t4Q8rzR3Nm8
        iPlt8svX0Lgo38CwmW6pvQi0I8oA/YE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-mIfazeW1Oc6gPdUIieCT3A-1; Wed, 22 Feb 2023 11:34:02 -0500
X-MC-Unique: mIfazeW1Oc6gPdUIieCT3A-1
Received: by mail-ed1-f72.google.com with SMTP id k12-20020a50c8cc000000b004accf30f6d3so11613542edh.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Feb 2023 08:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q8esxfJVTT75yFXIXwSeTLZl15U5SPnHoZLa97NCnZE=;
        b=gUj0+pSgvNJLabUgiEqeD+QBeEIJ0jC4pC5iwHOZa5Rd65Pz82n243oua2D+bjWk93
         qzqt6/G6dEtL5Cfe+N3ZAOkjD924fo32giRSqbX5z9OKMSRartdxS4F+C5OKbpFd3sg2
         nHdeklAELbL6mOKjJReRhK3sQjwKD8vSI93MRhqiCmcx26eCgxsQNUROQN5aeI9bq2CG
         j5O4OIo6Nfs6dySakrt7+z2TZiujrtS/3G6MgtG9zFZ4tJpZxATrmSA/1biJ4LdQXq2h
         bBUClVRie7JzquU2nles7hopFgJeRAIeQhUhC7g98DpLf8eJFn6kMscVmC/KfrqCvAJy
         6Aiw==
X-Gm-Message-State: AO0yUKXybw0Bep5PqB5bjqVSyN+eoR/MGuUM6a78D6MJ0sZcF0pkHRA6
        Cp8mTHGJOI42uz2MvIKbz0Nm7aWo77mNF9YysCfq7P+3a8KTTNuvtXVGTPX2ihUfCvjv/HiKCsB
        MXefLhBu8k7B5LMWN+tZ0PfrLklT7NhCq3Q==
X-Received: by 2002:a17:906:261b:b0:8aa:c105:f0bf with SMTP id h27-20020a170906261b00b008aac105f0bfmr17895411ejc.17.1677083641735;
        Wed, 22 Feb 2023 08:34:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8Lsm6/R+Yo2xM+J57hhLzO45cFnz7ctQpLIoyPFTlAQ5hAIVHME6/77ief6JsuGXUNWzjVAQ==
X-Received: by 2002:a17:906:261b:b0:8aa:c105:f0bf with SMTP id h27-20020a170906261b00b008aac105f0bfmr17895387ejc.17.1677083641475;
        Wed, 22 Feb 2023 08:34:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709064b0e00b008c979c74732sm5054746eju.156.2023.02.22.08.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:34:00 -0800 (PST)
Message-ID: <cee654ea-0961-bf5d-2bcc-87e9b980b3d8@redhat.com>
Date:   Wed, 22 Feb 2023 17:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH 2/3] include: mfd: tps68470: Add masks for LEDA and
 LEDB
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230213124520.1635257-1-hpa@redhat.com>
 <20230213124520.1635257-3-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230213124520.1635257-3-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/13/23 13:45, Kate Hsuan wrote:
> Add flags for both LEDA(TPS68470_ILEDCTL_ENA), LEDB
> (TPS68470_ILEDCTL_ENB), and current control mask for LEDB
> (TPS68470_ILEDCTL_CTRLB)
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  include/linux/mfd/tps68470.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
> index 7807fa329db0..2d2abb25b944 100644
> --- a/include/linux/mfd/tps68470.h
> +++ b/include/linux/mfd/tps68470.h
> @@ -34,6 +34,7 @@
>  #define TPS68470_REG_SGPO		0x22
>  #define TPS68470_REG_GPDI		0x26
>  #define TPS68470_REG_GPDO		0x27
> +#define TPS68470_REG_ILEDCTL		0x28
>  #define TPS68470_REG_VCMVAL		0x3C
>  #define TPS68470_REG_VAUX1VAL		0x3D
>  #define TPS68470_REG_VAUX2VAL		0x3E
> @@ -94,4 +95,8 @@
>  #define TPS68470_GPIO_MODE_OUT_CMOS	2
>  #define TPS68470_GPIO_MODE_OUT_ODRAIN	3
>  
> +#define TPS68470_ILEDCTL_ENA		BIT(2)
> +#define TPS68470_ILEDCTL_ENB		BIT(6)
> +#define TPS68470_ILEDCTL_CTRLB		GENMASK(5, 4)
> +
>  #endif /* __LINUX_MFD_TPS68470_H */

