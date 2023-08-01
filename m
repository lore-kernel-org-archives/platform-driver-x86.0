Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E49DEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Aug 2023 09:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbjHAJOt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Aug 2023 05:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbjHAJOc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2023 05:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBB630EE
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Aug 2023 02:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690881024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SxWFjCCAM3ihInbD4ANY0NAVJ+r4OZ28eSTne+Tfr18=;
        b=R5ph2uJZdFtLquFiNZsEFKQn3YhImvb/1huTPGAeim15IbzVacs4DknUAHUjvLlLd6pxYd
        wNgz3WMWr6Y5ga2En576zb9sNchCQj5gkMuoZNXGxHkJ4/fUlSbjbfKQidfeM2044XWY+z
        Kj+ZE0AZpr+qwAGDsMJmcdyCLlOOiEc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-9gUoo0j2PGCqfL9WY9w2wQ-1; Tue, 01 Aug 2023 05:10:22 -0400
X-MC-Unique: 9gUoo0j2PGCqfL9WY9w2wQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99bb3a2c781so437207866b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Aug 2023 02:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690881022; x=1691485822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxWFjCCAM3ihInbD4ANY0NAVJ+r4OZ28eSTne+Tfr18=;
        b=WY0k3uG/h5YGgnL95QVtuIMY7TiVNqt05sZmPvzS1BUvFYCPJbnizSsAGQtTDeXAdP
         SGi1Jzn0mhTIeXsoBIpV2h6YcGdhE3HaVAe/vcoYCid0BfK1KY7CfVAgNb0d1yzKAD90
         kbpGQOPCbGBPEc9cwNly+wEjhsuymlfaXv9POzs2yQG2t/uJyb2s1WWKcBDQben8Z0h9
         9LFobgPPqyHCD0iunBevMn3yFwRb2AVwnFKC2U6YtZUwBoiPNWZnHfzAClFaQUgN8gMZ
         gthR3778SKO5kZvVQtqKFtR1QOzHqhMsgx36dTYbURnNjG5lJR3TQLAKRHXH4uFb0kc0
         Fz4w==
X-Gm-Message-State: ABy/qLY+io6CtFJIzCkOyZ6Lym+7YFevLOtXe7A/Eb33q8rJddX/rjLu
        UdW0qqmwazaWMlkrtyXOjHwDQJSwMxEzu98ih/LgN3gOmoeEIQSFTFl5OGjFh/GIiWtaKSnZcv9
        q5s5/Qxk2HVXE/vvCfaKFfdlYSPvvF1tc+w==
X-Received: by 2002:a17:906:1d9:b0:992:9756:6a22 with SMTP id 25-20020a17090601d900b0099297566a22mr1923877ejj.48.1690881021848;
        Tue, 01 Aug 2023 02:10:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlED1JBaSc5+efiYma1WksHdzfTB4bo//PvWCEO5Zke8EubdRGKbEqTUv71WdddGZ1AYb/dIZA==
X-Received: by 2002:a17:906:1d9:b0:992:9756:6a22 with SMTP id 25-20020a17090601d900b0099297566a22mr1923859ejj.48.1690881021603;
        Tue, 01 Aug 2023 02:10:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s13-20020a1709060c0d00b00988b8ff849csm7269644ejf.108.2023.08.01.02.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 02:10:21 -0700 (PDT)
Message-ID: <18b3a57f-0f8f-6177-4414-0b1f821d9a2d@redhat.com>
Date:   Tue, 1 Aug 2023 11:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] platform/x86/siemens: simatic-ipc: fix logic error in
 BX-59A
Content-Language: en-US, nl
To:     xingtong_wu@163.com, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, xingtong.wu@siemens.com,
        lee@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     gerd.haeussler.ext@siemens.com, tobias.schaffner@siemens.com,
        kernel test robot <lkp@intel.com>
References: <20230731071424.4663-2-xingtong_wu@163.com>
 <20230801090423.4747-1-xingtong_wu@163.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230801090423.4747-1-xingtong_wu@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi xingtong,

Thank you for the quick fixes for the issues lkp spotted.

I'll merge these into the pdx86-simatic-ipc branch next time
I do a round of merges (within about a week).

Regards,

Hans





On 8/1/23 11:04, xingtong_wu@163.com wrote:
> From: "xingtong.wu" <xingtong.wu@siemens.com>
> 
> There is a bug in if statement that lead to logical error
> and have influence to other IPC, it get correct now.
> 
> Fixes: b8af77951941 ("platform/x86/siemens: simatic-ipc: add new models BX-56A/BX-59A")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307312322.Aa8upHWK-lkp@intel.com/
> Signed-off-by: xingtong.wu <xingtong.wu@siemens.com>
> ---
>  drivers/platform/x86/siemens/simatic-ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/siemens/simatic-ipc.c b/drivers/platform/x86/siemens/simatic-ipc.c
> index 02c540cf4070..8ca6e277fa03 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc.c
> @@ -129,7 +129,7 @@ static int register_platform_devices(u32 station_id)
>  		pdevname = KBUILD_MODNAME "_leds";
>  		if (ledmode == SIMATIC_IPC_DEVICE_127E)
>  			pdevname = KBUILD_MODNAME "_leds_gpio_apollolake";
> -		if (ledmode == SIMATIC_IPC_DEVICE_227G || SIMATIC_IPC_DEVICE_BX_59A)
> +		if (ledmode == SIMATIC_IPC_DEVICE_227G || ledmode == SIMATIC_IPC_DEVICE_BX_59A)
>  			pdevname = KBUILD_MODNAME "_leds_gpio_f7188x";
>  		if (ledmode == SIMATIC_IPC_DEVICE_BX_21A)
>  			pdevname = KBUILD_MODNAME "_leds_gpio_elkhartlake";

