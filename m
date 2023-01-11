Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C400C46467
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 12:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238735AbjAKMAY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 07:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238698AbjAKL72 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 06:59:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE77140EE
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 03:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673438098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tvrM+unS+JDoMRJyhWULY/xtKMGehDVn3U8ue+V8XP0=;
        b=eUo3Cv5EXhjO5Vkf9D8Y/xYFRBdEletYBDN4PqKouRVc1V/R5CiwZCO4PnvXorg2h5Jo2u
        mmeKWLd6vrhtyDC3Fk2E0qQggcndVnUtE06ts+4nZH5wZR1DNBQyJgMkpIApYBjtXjDIcG
        I78G6t2TIT0rB1vNRBPqoW10gMujJmw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-AX8t3rr1MPSi_KaU00ImJg-1; Wed, 11 Jan 2023 06:54:57 -0500
X-MC-Unique: AX8t3rr1MPSi_KaU00ImJg-1
Received: by mail-ej1-f72.google.com with SMTP id hr34-20020a1709073fa200b0083a60c1d7abso10110390ejc.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 03:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvrM+unS+JDoMRJyhWULY/xtKMGehDVn3U8ue+V8XP0=;
        b=UaT/tWbATRoibJ6q64Uq+tnU1FZxVk6oMfcOhQ2XmpnL9Wk7SjP6WmyVIEBd9pqPO1
         +aIe9T2xxVC5YsPq1mu4dlSnRrL/f23n+nNbHfyJYd+tGQzZf5B8VMz6B/lqrxmh+aaC
         jRhwoR3HdJ61UGel9tZgqeIHWQcjmCTgGdgyLLe4FTeyZVjjXfupow2CB9kvEaRwGb/W
         /cieqdPjzH9xU0oX0wfna+r2CALFqKvSkhq3oKzP8HOIgyNgr/aiS4DcmetdyWuhZkIi
         6T7uggMWIcVV20S1Jvz1F89asueq6ZXMPpNwHkBX9p5D5blFjldGrvOvPgjgOiRFeAzx
         AGgQ==
X-Gm-Message-State: AFqh2koR9Im+1OP1F7hZLORFMwt+X30fWeWbouqM1JJTP3KjzpU543ab
        2w4SynAoUD3pWytprgSAUPEpzy4ZAdIXCrmbxveFYu55VozIzM2TnkKZ69lWHuOyeV7TOL14D5q
        9zI5JE3UJTwE8ijMKlT+287qw/pw2XCkjqw==
X-Received: by 2002:a05:6402:5515:b0:491:6ea2:e875 with SMTP id fi21-20020a056402551500b004916ea2e875mr21711821edb.35.1673438096213;
        Wed, 11 Jan 2023 03:54:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXty+xfNCcgkLxY2hesvSmpSFfLr707ulqsVE+Kp+Kw1/CZWCLoDdGO8OSauCRQu5T9fn5yFQg==
X-Received: by 2002:a05:6402:5515:b0:491:6ea2:e875 with SMTP id fi21-20020a056402551500b004916ea2e875mr21711809edb.35.1673438096033;
        Wed, 11 Jan 2023 03:54:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x14-20020a056402414e00b0045b4b67156fsm5992314eda.45.2023.01.11.03.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 03:54:55 -0800 (PST)
Message-ID: <cc8125e0-a52e-f804-8e57-c3a1372ee6fc@redhat.com>
Date:   Wed, 11 Jan 2023 12:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 03/16] platform/surface: aggregator: move
 to_ssam_device() to use container_of_const()
Content-Language: en-US, nl
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-4-gregkh@linuxfoundation.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230111113018.459199-4-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/23 12:30, Greg Kroah-Hartman wrote:
> The driver core is changing to pass some pointers as const, so move
> to_ssam_device() to use container_of_const() to handle this change.
> to_ssam_device() now properly keeps the const-ness of the pointer passed
> into it, while as before it could be lost.
> 
> Cc: Maximilian Luz <luzmaximilian@gmail.com>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  include/linux/surface_aggregator/device.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
> index 46c45d1b6368..24151a0e2c96 100644
> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -229,10 +229,7 @@ static inline bool is_ssam_device(struct device *d)
>   * Return: Returns a pointer to the &struct ssam_device wrapping the given
>   * device @d.
>   */
> -static inline struct ssam_device *to_ssam_device(struct device *d)
> -{
> -	return container_of(d, struct ssam_device, dev);
> -}
> +#define to_ssam_device(d)	container_of_const(d, struct ssam_device, dev)

There is a kernel-doc comment for this helper, I'm not sure if sphinx is going
to like changing this from a static inline to a #define ?

At a minimum I guess the generated docs are going to loose some type info
by switching to a define. Can we keep this as a static inline ?

Regards,

Hans




>  
>  /**
>   * to_ssam_device_driver() - Casts the given device driver to a SSAM client

