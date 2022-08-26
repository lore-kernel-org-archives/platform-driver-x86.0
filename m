Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DB6ECAAD4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 11:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241109AbiHZLB0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 07:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbiHZLBB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 07:01:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E269EDC0BA
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661511496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f71UISjDYU2NUT6hfEqW5hif0up/gTlM03Rq5ZHY/1c=;
        b=TLxnVGqU3e6OaqcPp79/aJmZBaRRM2GnrsulWJ5tTKGmHA3wxdGcK/baVMYIYmg6Qhmkuu
        ulwacEN/xh8fPMKEVwN4kXyOeUIeM0dlwsNEieLD9Qr0VRMahI+rurMErkJimB/g2vvkvl
        Kaz0wzCstIFSaZZG8Yvk1FDF2QBGMC0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-Eateli70MbW7WaAzmllmRg-1; Fri, 26 Aug 2022 06:58:15 -0400
X-MC-Unique: Eateli70MbW7WaAzmllmRg-1
Received: by mail-ed1-f70.google.com with SMTP id p4-20020a056402500400b00447e8b6f62bso899942eda.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 03:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=f71UISjDYU2NUT6hfEqW5hif0up/gTlM03Rq5ZHY/1c=;
        b=JQObcleju/arhvgsEy0OlcpaNPXVKxL3YSNy1lsU3u7SAAiW516ikjvVKFonjp0lj7
         dWiK9YUWXIqbeG8FmLMbNzU5JLq4XG2A5hp3GJ+QaFb4a8RQvBzFljlHFhXgffCYnJX0
         BBDs63HBtsNmuvRA9KLOSIbeORNWE/mSm6chSt8mlqxT1LjuyoT8T7w7RWCuBgjTs51u
         MSoG136hZMn3BkhyxWQh2pw82FtyLf42k7UmA5XSWkisTFVzUz+P6qEuAv+uZIfX3xdi
         E7tsfj/oCVoKWadoRL32ChetItpx4V1kQzqL+G2xfetP9ZMphLxS1vdk10LQN9LlF2fk
         TAQQ==
X-Gm-Message-State: ACgBeo29HZDrBa1tpg6RjhU7KqqSL4DwaG3vlabaFNCk7JjPsOtSG+e9
        TxZN2zZ29e8xbHWbkmXcKllF4aZBETDOPcQHpKQX6mbGuxW/HlRTjky+3nOlrLJOksOc9nLsugD
        7VR07v/T+k1bTDuWAA73HvnzgRG/pOTk3RQ==
X-Received: by 2002:aa7:cc06:0:b0:440:7258:ad16 with SMTP id q6-20020aa7cc06000000b004407258ad16mr6076716edt.74.1661511494332;
        Fri, 26 Aug 2022 03:58:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7G0vxSFhWHkSqf6CErcL+SkcSClJZdfdangiT30aJ32NMsiTMZjWqW/mdbHooTYHlPv6boQg==
X-Received: by 2002:aa7:cc06:0:b0:440:7258:ad16 with SMTP id q6-20020aa7cc06000000b004407258ad16mr6076707edt.74.1661511494144;
        Fri, 26 Aug 2022 03:58:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id fe15-20020a1709072a4f00b0073da4b623e8sm744780ejc.152.2022.08.26.03.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 03:58:13 -0700 (PDT)
Message-ID: <c766a29e-bc9d-0fdf-6f0a-2bf5125b4c4b@redhat.com>
Date:   Fri, 26 Aug 2022 12:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] platform/x86: Fix ECO LED control on Toshiba Z830
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>
References: <20220821200821.1837460-1-lkml@vorpal.se>
 <20220821200821.1837460-2-lkml@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220821200821.1837460-2-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/21/22 22:08, Arvid Norlander wrote:
> The toshiba_acpi driver checks for TOS_INPUT_DATA_ERROR and tries a
> different format. On the Z830 the error returned is TOS_NOT_SUPPORTED
> though the different format still works. Allow either error.
> 
> Signed-off-by: Arvid Norlander <lkml@vorpal.se>

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
>  drivers/platform/x86/toshiba_acpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 0fc9e8b8827b..6cc617b2940e 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -675,12 +675,15 @@ static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
>  		return;
>  	}
>  
> -	if (out[0] == TOS_INPUT_DATA_ERROR) {
> +	if (out[0] == TOS_INPUT_DATA_ERROR || out[0] == TOS_NOT_SUPPORTED) {
>  		/*
>  		 * If we receive 0x8300 (Input Data Error), it means that the
>  		 * LED device is present, but that we just screwed the input
>  		 * parameters.
>  		 *
> +		 * On some laptops 0x8000 (Not supported) is also returned in
> +		 * this case, so we need to allow for that as well.
> +		 *
>  		 * Let's query the status of the LED to see if we really have a
>  		 * success response, indicating the actual presense of the LED,
>  		 * bail out otherwise.

