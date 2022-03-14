Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B25C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 10:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238647AbiCNKmj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 06:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238639AbiCNKmd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 06:42:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A3DF63EA92
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 03:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647254482;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xV3TSyks1eO7W7uTjHlF4nDKHritJ7SVQxD4UIK7clQ=;
        b=WESfaC/Md1pgByC7LPDS4Bt3kCK0VERt/8gGGeDTuy8T12ODbqi3b5uqN/h/yaoEMr96VI
        6T4ed12Y0Jh1qYE0ILdVwYYm1f0isBnQTRbggq+BnfoSKtTUEHv71B3ZFGkXLAkYE68LuF
        h06N8MbTUAPjfhP1rP8jPe5XRMiGTAw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-38iRnN_XMXCjkKYn3f6Xxw-1; Mon, 14 Mar 2022 06:41:21 -0400
X-MC-Unique: 38iRnN_XMXCjkKYn3f6Xxw-1
Received: by mail-ed1-f72.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so8469569edb.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 03:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xV3TSyks1eO7W7uTjHlF4nDKHritJ7SVQxD4UIK7clQ=;
        b=YGxXxl/4kdYKAtk2yV7XS/lAVS3RVrEE6IMOOs8N4f3g3oMAm+wP0cehX4HOuAnvEa
         GdDSCtS87BV0UIaw4ifdn1nHFw2oRgVmH/pu/CHVAjT54Kz61r7sMZwGjupHyVHbEdP8
         hd/PU/Fj7X6mzlXaYjA/IvrMX15kcWAPVUEhbYFVQAClmsaoidlct+Ao9BNxwyZwB2Ku
         mZz/ox9CYBYLhdp+CK/IdKsQxlklwr9XtQTbKRxvu9KJrJLtWkxDNeTyRigeIb40h0nc
         jlckAvJZaCV+Q7Spmb53VHZF1EUriTK8wW6dkzKBsx2dDVJQ7sgeEb/BclKrnf1PKBwy
         l6Dw==
X-Gm-Message-State: AOAM533Gn9BqgQt/8iv3ThdnTDwilaCiM8X63JNLieqzpGhtiNJ9M9Id
        YF7UuGUSzl9hifWXBFvFmVpa81R2g+CiK2ywOghoCaV8ZCAamIAQZQYGfrf+2WeNsTlTgmLGZw3
        VkrL12ZaILwfah+ONeoj6SRY30PUXNhv/sA==
X-Received: by 2002:a17:907:2d13:b0:6db:ab58:d023 with SMTP id gs19-20020a1709072d1300b006dbab58d023mr11050598ejc.215.1647254479394;
        Mon, 14 Mar 2022 03:41:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwlqkA1ICXKuvQrB2hT52WRlkTUk00GfsoMQZluV2YqVVrbNXwwpbflpXsbGFHw4iVz8aMCQ==
X-Received: by 2002:a17:907:2d13:b0:6db:ab58:d023 with SMTP id gs19-20020a1709072d1300b006dbab58d023mr11050582ejc.215.1647254479154;
        Mon, 14 Mar 2022 03:41:19 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id lw3-20020a170906bcc300b006db3e2aa7c9sm6636612ejb.171.2022.03.14.03.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 03:41:18 -0700 (PDT)
Message-ID: <b30c808c-56d2-f9e3-b0e7-00ca49961e4d@redhat.com>
Date:   Mon, 14 Mar 2022 11:41:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 1/4] Fix hp_wmi_read_int() reporting error (0x05)
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220310210853.28367-1-jorge.lopez2@hp.com>
 <20220310210853.28367-2-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220310210853.28367-2-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/22 22:08, Jorge Lopez wrote:
> The purpose of this patch is to introduce a fix to hp_wmi_read_int()
> and eliminate failure error (0x05). Several WMI queries leverage
> hp_wmi_read_int() to read their data and were failing with error 0x05.
> 
> HPWMI_DISPLAY_QUERY
> HPWMI_HDDTEMP_QUERY
> HPWMI_ALS_QUERY
> HPWMI_HARDWARE_QUERY
> HPWMI_WIRELESS_QUERY
> HPWMI_POSTCODEERROR_QUERY
> 
> The failure occurs because hp_wmi_read_int() calls
> hp_wmi_perform_query() with input parameter of size greater than zero.
> Invoking those WMI commands with an input buffer size greater than
> zero causes the command to be rejected and error 0x05 be returned.
> 
> All changes were validated on a HP ZBook Workstation notebook,
> HP EliteBook x360, and HP EliteBook 850 G8.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note since your using a different email address then Signed-off-by to
submit the patches, I've changed the From / Author of the patch to
match the Signed-off-by while applying this patch (and the same for
the other patches in the series).

The patch will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 48a46466f086..103f56399ed0 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -337,7 +337,7 @@ static int hp_wmi_read_int(int query)
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
> -				   sizeof(val), sizeof(val));
> +				   0, sizeof(val));
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;

