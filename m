Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019F2C6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 14:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbiI0OUZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 10:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbiI0OUC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 10:20:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E14CB2770
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664288385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mx4jE3ECEvBhJZF2XERwRargEjDaO4M7Q9H1iSbdaLI=;
        b=PNlHDCbDqeXT5TsphNPNahfJTt2mwvme66EF2JZMZr42sPbWiBmJT0TO/+MRTVIuIzpwFh
        77VC9kmTpPtA0XMXj/+stvCGfSoH4F7yf15G4DMZ6jGj5sRQv9Q6VLy59IGvGU7VQrIO/P
        qYlGCk7kmYX/KiUbPsnKNEMwYzeSZxc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-DXI5O7YrNoi1BhtSkgzlJA-1; Tue, 27 Sep 2022 10:19:42 -0400
X-MC-Unique: DXI5O7YrNoi1BhtSkgzlJA-1
Received: by mail-ej1-f71.google.com with SMTP id jg16-20020a170907971000b00782d87ab6e5so3811781ejc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 07:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Mx4jE3ECEvBhJZF2XERwRargEjDaO4M7Q9H1iSbdaLI=;
        b=VI4OVBPVHLy434QrUCWOr9XF1tvQ8cyu8fK4552VP5M4Qms3VHVAdPshFLCa0R34Mu
         ySUeUqRIezUe9PWth4QdySM72upRTFpiHlC+mrap3VXgHr2Eivxrm7cZT2UoRGrNxj7J
         ZPhatQNKTB85cmaCNmrlZzYqRYGaEtrvDvlMmoqo2HQDsj+5CXTv1Gk8gqRzHMkqnOYm
         cbQLTuWoR233iTUeMXoW8kuQNhBQc51AqZ4UCJADcZ7dxiTxgcx8QOR88dnMEt2jhUNH
         A/TO0Eu0wRi4N5uj1NDxYIv+5NgqOwocLiOpf48yp+P8c5Ez8edllx5NPvgO/ETC7U4K
         Nd8A==
X-Gm-Message-State: ACrzQf3uHPGPk5iKtqXInm7sDiq3G0/6lv4VuheAxw6APAJszWMuXzS0
        SMsRq08omu8JZcBqxiWF3uboN+n4ynbua1SOiHrbuuoeIH50MKNHaJ2l8+N0rEYuxDo3AZhiRe4
        w36n1JtdTay66Ts8j6gXO1vK2370cZE/N8g==
X-Received: by 2002:a05:6402:4311:b0:451:c437:a5a9 with SMTP id m17-20020a056402431100b00451c437a5a9mr26869835edc.272.1664288381543;
        Tue, 27 Sep 2022 07:19:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60r0gclTxsXcEWNa8UNAxfSRZTWGhw5XYosntx/1KSv1YrYaDD9LndA5ig8hu4BYvKJ6Gw7Q==
X-Received: by 2002:a05:6402:4311:b0:451:c437:a5a9 with SMTP id m17-20020a056402431100b00451c437a5a9mr26869819edc.272.1664288381331;
        Tue, 27 Sep 2022 07:19:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090676d200b0077f324979absm873812ejn.67.2022.09.27.07.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 07:19:40 -0700 (PDT)
Message-ID: <9036da27-32aa-8ae3-9221-45b988d37266@redhat.com>
Date:   Tue, 27 Sep 2022 16:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] acerhdf: remove unneeded semicolon
Content-Language: en-US
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, peter@piie.net
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20220926033311.84765-1-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220926033311.84765-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/26/22 05:33, Jiapeng Chong wrote:
> ./drivers/platform/x86/acerhdf.c:344:2-3: Unneeded semicolon.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2271
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/platform/x86/acerhdf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index a7407aa032ba..b48c6c5da147 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -341,7 +341,7 @@ static void acerhdf_check_param(struct thermal_zone_device *thermal)
>  		pr_err("fanoff temperature (%d) is above fanon temperature (%d), clamping to %d\n",
>  		       fanoff, fanon, fanon);
>  		fanoff = fanon;
> -	};
> +	}
>  
>  	trips[0].temperature = fanon;
>  	trips[0].hysteresis  = fanon - fanoff;


This patch does not apply on my current for-next branch:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

I guess that this might be based on the thermal-zone changes which are going upstream
for 6.1 through another tree.

Please rebase + resend this once 6.1-rc1 is out.

Regards,

Hans

