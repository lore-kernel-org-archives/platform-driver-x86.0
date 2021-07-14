Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49B0C12002
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Jul 2021 20:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87C1F613BF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Jul 2021 20:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhGNUfp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Jul 2021 16:35:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49068 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229650AbhGNUfp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Jul 2021 16:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626294773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i7NxI3yI/Fb6dPNst59ITFV2gbSEICryzbNauhg1ggs=;
        b=ajU1HFeTfBFEiQHxm0X+HUR5wzmmeCGs99q68Tmjq86Gkc0TAvUY67Gt3MEDY1qEJEvkDO
        BcJfAVbfCG6QHPKkKgFk8/iKE//nmQNwRsXGaAhFCgt/VgxN/uHxHR0dZdTronMxDHqGKG
        kYSm9p6OgHgQoRBjMbFc2Ol6q2/JsZI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-XhMRylcQNAGTys3VE0hmTA-1; Wed, 14 Jul 2021 16:32:52 -0400
X-MC-Unique: XhMRylcQNAGTys3VE0hmTA-1
Received: by mail-ej1-f69.google.com with SMTP id r10-20020a170906350ab02904f12f4a8c69so1279380eja.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jul 2021 13:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i7NxI3yI/Fb6dPNst59ITFV2gbSEICryzbNauhg1ggs=;
        b=g5o0nnDaIlwI3taObeWiu6e0kPOSjW+/1S8X0bgUy8DPvlaVYVggbyJuhK+JDjXCX0
         3KIBXjDwpFeui3nS5JEQRa96SFWWPCF5+y7JsMcmtU1Hx1Gvte4Pm+RRMDAHwFtmUixX
         tnl3wkNS5vpxnltszUzeYrL9gEq09v1TUnValLKM/TQEP7WRkRgNTqL/EN2yTKTfEEyX
         Wk+cbZNm3SJx52mhae0+yko8DmvF9j+VoYMQIiIKdWSCJOTW7o8aM3o/uhe088qH8/5F
         B5gyj2JBpqqNTjDjUP/Qq/caR7yxpQ1w5k7hHGnObeZqvdNA3ypqcSU71LgnczWqbg7i
         x9eg==
X-Gm-Message-State: AOAM531r3+SOWE912sJAnEKr38kGXBa9tblUvrlfKHKhKIRxBV64yw4p
        GC33NF4Mf73J/KSoYVYPB35fASgr1l8wbQT8aWVWx+NhRUcsTYnMLvlW2SB4V6vZJek3f+b7s/M
        281HfvBdALmxaOkWIYkEU+BttGadWSrzDQWftVuIBbJasKiTkGTb6M0ems++DOVrILmzue0m1aM
        vxkiE4lHSUXw==
X-Received: by 2002:a17:906:744:: with SMTP id z4mr21539ejb.347.1626294770966;
        Wed, 14 Jul 2021 13:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAL152rBNkFM1GNwK4r4NA+EqSxQwk0dUaKJ+OOCupBxDdA1y32bNnPRthAnzVSL+06yPdSw==
X-Received: by 2002:a17:906:744:: with SMTP id z4mr21521ejb.347.1626294770785;
        Wed, 14 Jul 2021 13:32:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f15sm1114291ejc.61.2021.07.14.13.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 13:32:50 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: remove hardcoded "hp" from the error
 message
To:     Alex Hung <alex.hung@canonical.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
References: <20210710190810.313104-1-alex.hung@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2c6523b4-d00a-752a-635c-d6fae7870c5a@redhat.com>
Date:   Wed, 14 Jul 2021 22:32:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710190810.313104-1-alex.hung@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/10/21 9:08 PM, Alex Hung wrote:
> This driver is no longer specific to HP laptops so "hp" in the error
> message is no longer applicable.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

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
>  drivers/platform/x86/wireless-hotkey.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
> index b010e4ca3383..11c60a273446 100644
> --- a/drivers/platform/x86/wireless-hotkey.c
> +++ b/drivers/platform/x86/wireless-hotkey.c
> @@ -78,7 +78,7 @@ static int wl_add(struct acpi_device *device)
>  
>  	err = wireless_input_setup();
>  	if (err)
> -		pr_err("Failed to setup hp wireless hotkeys\n");
> +		pr_err("Failed to setup wireless hotkeys\n");
>  
>  	return err;
>  }
> 

