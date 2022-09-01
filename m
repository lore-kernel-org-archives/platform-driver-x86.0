Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A15ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 14:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbiIAOzM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 10:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbiIAOzK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 10:55:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE711A389
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662044108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5poaUCXaJbI2zmBn4LFN02z8P6dE9ZahVD/y5bAwx+s=;
        b=Eg4CpL7CCh1UvVS0lHqaEokqApdJxskJQHF/+HuM0EEHFeXpeNXsSmqU3dKtIb8hg5QED8
        l03/CXTJ2q3pTN+amlLaq+PBDIcnZZwv6RPimCLqMUHQ4BESKuA//pfaxTNtCEpE/45D3l
        GrH/rEQ4jobelGi4a9jCMnF/DDi6SJk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-MYqi0pHxPoKIcjm2sU_hBA-1; Thu, 01 Sep 2022 10:55:07 -0400
X-MC-Unique: MYqi0pHxPoKIcjm2sU_hBA-1
Received: by mail-ej1-f71.google.com with SMTP id hp14-20020a1709073e0e00b00741a2093c4aso5316410ejc.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 07:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5poaUCXaJbI2zmBn4LFN02z8P6dE9ZahVD/y5bAwx+s=;
        b=wZ8OEoXvEMl+8v4YyugNxYGxvsw77rhMmJ0RY+Rx4VtJGL9l7SV6uEq8m3171CDGKS
         On91iHHeyxlKmwjR+32/GTrY2s4Tr6Ta+3QSJx31axfnLNWBX1wqm7+vIekuY+XQF2/A
         8d/4/SbNB0D0dGQRk+0y0e9e7PI8LADjya6FILvHtBBqwbnZrhWoEagZvsCzylZvKLY3
         CEjWjkxiqL6VjkkrmtSkN89Ah5AaWM1Pl73pmr4pTym97ibMmEKBgCkqiuGmEV0QdP6V
         uyWqGPu24AZmg+AOHhr6pVw1C6jZ0W1hqaqYOpZdmREmevF8j9fp7xL6EIF6Ej0Qf1M/
         sQzA==
X-Gm-Message-State: ACgBeo1rhuwcZaXJ43yoxt6TLmdqFNvJBx2UjnQuy97oac4Nqu36Xp21
        NdY7Uvm8rXwConFrDwNAF50vG96IbBiu/5yUnu7QSS2tzN4T8218FlwJyN5Yrl63A4+iIGa9YdQ
        rKLJ6Nn/JE1ciz7QuYaR5pxRt+ASA8ZSi9w==
X-Received: by 2002:a17:907:b15:b0:741:8ae4:f79d with SMTP id h21-20020a1709070b1500b007418ae4f79dmr14003338ejl.247.1662044106427;
        Thu, 01 Sep 2022 07:55:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7pHLqWKYnezkwg6Cw+LC0vRhxIy2LH6NjSTOVS+3Vo3GzJgUoIEibH37ESMSoAQeZpV+k1Sg==
X-Received: by 2002:a17:907:b15:b0:741:8ae4:f79d with SMTP id h21-20020a1709070b1500b007418ae4f79dmr14003324ejl.247.1662044106160;
        Thu, 01 Sep 2022 07:55:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906210100b0073d61238ae1sm8535366ejt.83.2022.09.01.07.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 07:55:05 -0700 (PDT)
Message-ID: <7abac73e-d7e2-f457-7a72-9fecb532ddd5@redhat.com>
Date:   Thu, 1 Sep 2022 16:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform/x86: dell-wmi: Add WMI event 0x0012 0x0003 to
 the list
Content-Language: en-US
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220827133040.15932-1-pali@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220827133040.15932-1-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/27/22 15:30, Pali Rohár wrote:
> It looks like that on Dell Latitude E6440 is WMI event 0x0012 0x0003 sent
> when display changes brightness. When it happens kernel prints
> "dell_wmi: Unknown WMI event type 0x12" message into dmesg.
> 
> So ignore it for now to not spam dmesg.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>

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
>  drivers/platform/x86/dell/dell-wmi-base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
> index e07d3ba85a3f..0a259a27459f 100644
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c
> @@ -344,6 +344,9 @@ static const struct key_entry dell_wmi_keymap_type_0011[] = {
>   * They are events with extended data
>   */
>  static const struct key_entry dell_wmi_keymap_type_0012[] = {
> +	/* Backlight brightness change event */
> +	{ KE_IGNORE, 0x0003, { KEY_RESERVED } },
> +
>  	/* Ultra-performance mode switch request */
>  	{ KE_IGNORE, 0x000d, { KEY_RESERVED } },
>  

