Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E55CC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 May 2023 09:27:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjE3J1R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 May 2023 05:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjE3J04 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 May 2023 05:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0905FE46
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685438674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/WuurCYKoyA2bLvo6I06WH8mPMkcBiA2YJU0KgXjIPQ=;
        b=MHsgIn70caN7CLCevQhgRoo2iHTIZk8XcfORoiMW41eVMbB9Z/6w7cfYetcUsKlrXYlN4P
        0wYyzayvdzIXnPuKlIJHWCl1gOUNWm3Qi1ixsmyVEEGVOUCymePlVQt2Uvl1XSgACJB9UL
        hiQuSLO9HSzop1lmCWWJPgak3C9kPGU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-8pprX7ssNOSIDSsT7LRhew-1; Tue, 30 May 2023 05:24:32 -0400
X-MC-Unique: 8pprX7ssNOSIDSsT7LRhew-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-510526d2a5fso6598229a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 02:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685438671; x=1688030671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WuurCYKoyA2bLvo6I06WH8mPMkcBiA2YJU0KgXjIPQ=;
        b=F1c1b6qmB5u2vG6OcCDRaEWTQRbi1qx5egRjnN3suLNCxFEddz+arUUjAtDPnH/AKP
         L+iw53GhbhE2UMNR4r2Qz19uakQANvVWfT4qcWGFQ5K8fHwr2BR+C63SyNXCQytgFOHP
         33l3yD5a0KrF/GaX6gUBb+miuImKTlMPQZBRPaJATZ4Uk+rXpuSMBBystTFmXT+4UvaK
         Kkbu3wvpUEymsw6Iz5lmK6RAqiuaQqHhykrBEycrrULuJwInjon8/gCVVYMxMVwf+DF2
         sXYGAXkcpxzPQiWbu90BrCy8Kpy0bUWAWWLWLuEcEMre69VjipowejgtH/TLEO3czpFQ
         160A==
X-Gm-Message-State: AC+VfDzHgPnk0GfpNAo69Z7URXFNvT+64r9BhS3kRnuQYG0csKbO4JI9
        Jaytvi0FIdhZ5P6rbC8ZX/bf+QMBIxQwlT1ELvz0/FCV3Me/LPa02yTpM7Uaq5S2QA9bTh+5zfa
        G2YVdcYl87E4UmF2JrWlKvgx3l++DLPbaoQ==
X-Received: by 2002:a05:6402:34c1:b0:514:9e81:6185 with SMTP id w1-20020a05640234c100b005149e816185mr2406396edc.16.1685438671276;
        Tue, 30 May 2023 02:24:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Qt3pc8yR27lp/BE1xpPiuRrtJ5VydNxSnHS9g2S2+4gEIfyWcBFvVJTJ6IkWPBqy01dqpqg==
X-Received: by 2002:a05:6402:34c1:b0:514:9e81:6185 with SMTP id w1-20020a05640234c100b005149e816185mr2406388edc.16.1685438671035;
        Tue, 30 May 2023 02:24:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m2-20020a50ef02000000b00514a97b6b80sm1175222eds.78.2023.05.30.02.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:24:30 -0700 (PDT)
Message-ID: <96258ef1-f611-210b-1fb4-879503e9c4de@redhat.com>
Date:   Tue, 30 May 2023 11:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/surface: aggregator: Make
 to_ssam_device_driver() respect constness
Content-Language: en-US, nl
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230525205041.2774947-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230525205041.2774947-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/25/23 22:50, Maximilian Luz wrote:
> Make to_ssam_device_driver() a bit safer by replacing container_of()
> with container_of_const() to respect the constness of the passed in
> pointer, instead of silently discarding any const specifications. This
> change also makes it more similar to to_ssam_device(), which already
> uses container_of_const().
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

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
>  include/linux/surface_aggregator/device.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
> index df81043b9e718..42b249b4c24b1 100644
> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -243,11 +243,7 @@ static inline bool is_ssam_device(struct device *d)
>   * Return: Returns the pointer to the &struct ssam_device_driver wrapping the
>   * given device driver @d.
>   */
> -static inline
> -struct ssam_device_driver *to_ssam_device_driver(struct device_driver *d)
> -{
> -	return container_of(d, struct ssam_device_driver, driver);
> -}
> +#define to_ssam_device_driver(d)	container_of_const(d, struct ssam_device_driver, driver)
>  
>  const struct ssam_device_id *ssam_device_id_match(const struct ssam_device_id *table,
>  						  const struct ssam_device_uid uid);

