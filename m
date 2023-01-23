Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186EAC05027
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 13:45:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjAWNpe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjAWNpd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 08:45:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095F022A2C
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674481486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pFCcCQMAbOumY8RNK61wS72owj7wV7k6uzmwOZKeA3Q=;
        b=V1Wlf5pzjq4DuM3TwXWMsfDklqnGLk1BLHWpXtPGtyabxvAHiwVZFUs29U+xpq9GGpQyQR
        mzwF1XxoS5LTIwMPtM9HY7HD2vRfTuSid4aoNA/j5/+tA46F1yShNKfLqTKQxObMkCOy38
        sxnUFOdMjD9EMNKtxzmp2SqwRktKEJw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-Dv7peUERPO28IYl27Ipmyg-1; Mon, 23 Jan 2023 08:44:45 -0500
X-MC-Unique: Dv7peUERPO28IYl27Ipmyg-1
Received: by mail-ej1-f72.google.com with SMTP id hc30-20020a170907169e00b0086d90ee8b17so7800601ejc.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFCcCQMAbOumY8RNK61wS72owj7wV7k6uzmwOZKeA3Q=;
        b=zdGV2gCXdU5DfF4JTtlTFu3XV5OWwj9HSMeMFJTSujNnfxQrooFc+YFXRNMjK5cIWZ
         G9l00IibCxisXhggl08O7Xs1nvp6DOURHzdhi7QhOBBErq4Szigd+Lmv4zpbwToW9nKF
         aI39mz7w9My51xQFv0eG5W8QVvQgnIk9dH+xg/V8U1KkG7i6FU52TG0xdhFDSjcn+S5l
         IMd1qgqMWfSEKcE3AqO8SBgke3O8s9xdzyRshxClxKvQGSagI8ta7iIlPNjbSor65YLC
         xl5GowlAzKtbfL2uO2UIN65cIEJrys5wwl/3MoGXR2J6XSYW5WYjKOiAJzLxrbEgHyC+
         3L5w==
X-Gm-Message-State: AFqh2krJ0YZ38ZjPCQ5Lky1c+OCh+DrxoY/ujyCX7hrPOTmYAChy7F2M
        ODgl4sUuuYlB52A048lmvOovyjusznc/JbYLjn4ydVsZWOIVAXobxLLQU99DF7Vi5FvHUxIuEub
        nfLUQdsDX4u5sfFv8+ggrJyuIiJMV9GE6xw==
X-Received: by 2002:a17:906:2ed1:b0:877:7113:71f3 with SMTP id s17-20020a1709062ed100b00877711371f3mr16555383eji.25.1674481483465;
        Mon, 23 Jan 2023 05:44:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvgnnc7d085BMCBdNBDRqs4X3g5E4009351fRzgiQdhHiLvsN+tpk1CR4PxM5DfwM9tQ8C4ww==
X-Received: by 2002:a17:906:2ed1:b0:877:7113:71f3 with SMTP id s17-20020a1709062ed100b00877711371f3mr16555370eji.25.1674481483197;
        Mon, 23 Jan 2023 05:44:43 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o16-20020a170906769000b0087758f5ecd1sm8392461ejm.194.2023.01.23.05.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:44:42 -0800 (PST)
Message-ID: <5573de33-b493-96b9-e3a4-58f7544014a7@redhat.com>
Date:   Mon, 23 Jan 2023 14:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for B450M DS3H
 WIFI-CF
Content-Language: en-US
To:     Kevin Kuriakose <kevinmkuriakose@gmail.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230119150925.31962-1-kevinmkuriakose@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230119150925.31962-1-kevinmkuriakose@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/19/23 16:09, Kevin Kuriakose wrote:
> To the best of my knowledge this is the same board as the B450M DS3H-CF,
> but with an added WiFi card. Name obtained using dmidecode, tested
> with force_load on v6.1.6
> 
> Signed-off-by: Kevin Kuriakose <kevinmkuriakose@gmail.com>

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
> index 5e7e6659a..322cfaeda 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -141,6 +141,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
>  
>  static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H-CF"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H WIFI-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE AX V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),

