Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900E4C7619A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 13:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbjC0NX3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjC0NXT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 09:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745D71985
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679923350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=swmjhnNjkaqtpqt5Pl5MGYtRoGQ0+bZAAWUhMT4BRK0=;
        b=UOjvW/UR/LW1cMSbiKq9kuHMtKwhlb2BBF6FRyoFXnP0k8JhYKPlzIK9BOD/EHcAq2sSfD
        AGCB3mm5mcTwDQH0yZd/jQ/px4YAJqlOZr+cEtQwtJKYtMdVoYNVfG/hxhenfsGufT7Jwv
        iZ7XqM19Z4wZ9ce+j0tOeJ1d8vu0iHw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-RINexowTMX6YqzidKv5iWg-1; Mon, 27 Mar 2023 09:22:29 -0400
X-MC-Unique: RINexowTMX6YqzidKv5iWg-1
Received: by mail-ed1-f71.google.com with SMTP id b18-20020a50b412000000b0050234a3ad75so7265765edh.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swmjhnNjkaqtpqt5Pl5MGYtRoGQ0+bZAAWUhMT4BRK0=;
        b=UvSQR3ssVwZX5SkJU46OELTWRpYvaTjwUmhA0O2le+f+fzKdNFA0CZX59i+9vDzqGW
         UqAqPyzX0F05rpMayzjaN+QpFF5arUjN0Ft5EU2GNYykvcFi1fnICZtb0hE8d5PXK7TM
         iFHv1whqxcv0nHDpR0G8toD+tFWscWC5YEaQ/RE57KPnLizYYErmLFyuKa2itCQgTDTH
         Ckj5Ac7yOe9nnNhJxfdrWHLt+1tB8XFJQTZShyNlhAV9UNtfDuuIZ8NxbvE0oorjHXn1
         pfBGy8HwYHireguWVzJPDnhFzkTTqB6IWwnGt2vkrqRbsqa4fW2g4ElnU5fVDPTPht3e
         qggg==
X-Gm-Message-State: AAQBX9dW3lHpiPerx59EmpOb33G4DXGB+oztwpiDOtGU8O3PbuO72Fxz
        YPOms44ceyJ9JvVozabUb374+fsdxAfLeYouCMxsbpMRO8r5Gb1xWtxsGty92g82bDsnU8weSF3
        THUT10IkzF4N3+Suvag1D3fvQvw6UooxQow==
X-Received: by 2002:a50:e70d:0:b0:4fb:f2db:a654 with SMTP id a13-20020a50e70d000000b004fbf2dba654mr12478361edn.12.1679923348095;
        Mon, 27 Mar 2023 06:22:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350b4UaXv+XZH07n/yn7/2WM1DdUToTaKHOUQV906oWpHknoHH5Ayl+UBoumuWCRysYszp0+LhQ==
X-Received: by 2002:a50:e70d:0:b0:4fb:f2db:a654 with SMTP id a13-20020a50e70d000000b004fbf2dba654mr12478344edn.12.1679923347837;
        Mon, 27 Mar 2023 06:22:27 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a25-20020a50c319000000b004bc15a440f1sm14792601edb.78.2023.03.27.06.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 06:22:26 -0700 (PDT)
Message-ID: <7057612b-f82a-5d57-df03-1986b23127fb@redhat.com>
Date:   Mon, 27 Mar 2023 15:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for B650 AORUS
 ELITE AX
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        got3nks <got3nks@users.noreply.github.com>
References: <20230327-gigabyte-wmi-b650-elite-ax-v1-1-d4d645c21d0b@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230327-gigabyte-wmi-b650-elite-ax-v1-1-d4d645c21d0b@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/27/23 15:05, Thomas Weißschuh wrote:
> This has been reported as working.
> 
> Suggested-by: got3nks <got3nks@users.noreply.github.com>
> Link: https://github.com/t-8ch/linux-gigabyte-wmi-driver/issues/15#issuecomment-1483942966
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 322cfaeda17b..078afa98e6c6 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -150,6 +150,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550I AORUS PRO AX"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B650 AORUS ELITE AX"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B660 GAMING X DDR4"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B660I AORUS PRO DDR4"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
> 
> ---
> base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
> change-id: 20230327-gigabyte-wmi-b650-elite-ax-003f0b58e3c3
> 
> Best regards,

