Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A330C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 20:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350218AbiFJUIF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 16:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349189AbiFJUIE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 16:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29D0923D9A2
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654891681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3IcTkjpi4Nv+Fwx6BAvfcMz5m/PBNRkbkLn3OCjCcMk=;
        b=XHPk79PYlfpL05rVGE33egknXdVKYfPeVEAbID6TPqUjYE68eJlAnivtso8PTLlLcsWvTC
        DEL/6YoqhJ/ljyW7TP2Pklcqy4EYt78bVeC23IrrU0H89ZA5G/sHfYjy3cen3URXm8fL4Y
        lBfPUAR8rv+IUCRYDtGXpDPLL55ukD8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-U6lygsF-MYW39AqqUga2sw-1; Fri, 10 Jun 2022 16:08:00 -0400
X-MC-Unique: U6lygsF-MYW39AqqUga2sw-1
Received: by mail-ed1-f72.google.com with SMTP id y13-20020a056402358d00b0042dfb820070so149044edc.6
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 13:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3IcTkjpi4Nv+Fwx6BAvfcMz5m/PBNRkbkLn3OCjCcMk=;
        b=r9TWs0r3+Amjyj+38tCeVDo27HR7/9muO+dtHcJgMH45fIZZrKevmbb4LnVdQBMPvf
         jc0A954ymFQ2z5WPdWwdjQFkW6Yl5TsqKyUM0tnuGPt4HMwVtcZ70O3jLe5LmKxRhKVd
         jRJRBwwdfnX1oo2+4RD6J9mzQdGKBrh0NtfxnU+ezd3wK4HHXE9D0xJQUfSKqlCvlWiC
         90G0+TRs6MSm+9W5RQ0aqAqXv0se8GpTQQDqaB3KDgoCJHY4xmd7DF2/t1MJiQvOvyW8
         l03VNZw8KAhXrnSN+9kCAgYabwofkB8Mc53+ykma47BE4Viz7UY0SZDnbD97+8KoVMYm
         Q47A==
X-Gm-Message-State: AOAM533zu6J5uqeJ0LR4qVI7A9oDmfBeeicOZnQmaqZh+rN5VI8PjYE7
        YVIROaiP7O2cBH1bCcnMd+Trq6oQ9AduYHI7sMB5Ai1EgNt6sb3r7sDzMxbJoA/aIYITqPLPcv6
        VKp64LrRl+kV9GSdE3oJV7uc8xBF0AbOquA==
X-Received: by 2002:a17:906:73d2:b0:712:3ca2:c5f with SMTP id n18-20020a17090673d200b007123ca20c5fmr1071611ejl.219.1654891679109;
        Fri, 10 Jun 2022 13:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+MtcZBYvjTM94br3T6XI7hifKNCAFO4aAMaaafT9KyqTuXs4TUOAVmRGdgaeNUemHMsCw/w==
X-Received: by 2002:a17:906:73d2:b0:712:3ca2:c5f with SMTP id n18-20020a17090673d200b007123ca20c5fmr1071600ejl.219.1654891678887;
        Fri, 10 Jun 2022 13:07:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id x15-20020aa7d38f000000b0042dd1584e74sm75182edq.90.2022.06.10.13.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 13:07:58 -0700 (PDT)
Message-ID: <5284998a-908b-1f0d-fe08-762880935147@redhat.com>
Date:   Fri, 10 Jun 2022 22:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for B450M DS3H-CF
Content-Language: en-US
To:     August Wikerfors <git@augustwikerfors.se>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220608212028.28307-1-git@augustwikerfors.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220608212028.28307-1-git@augustwikerfors.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/8/22 23:20, August Wikerfors wrote:
> Tested and works on my system.
> 
> Signed-off-by: August Wikerfors <git@augustwikerfors.se>

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
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 1ef606e3ef80..12dbaef518e8 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -140,6 +140,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
>  	}}
>  
>  static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE AX V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),

