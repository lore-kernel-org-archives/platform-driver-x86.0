Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD6EC77B75
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 May 2023 13:00:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242058AbjEONAN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 May 2023 09:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242066AbjEOM7q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 May 2023 08:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C226719A1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 May 2023 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684155533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FWCSgHKgkfiwsZPIbDFMuCcNPnF6WGYEGag89qGrc3E=;
        b=bLewAAVG5Cq28vKS90JAkFxet5TF7xFvP/wSgOOJ/PjQwsolSRKgTaJ65dscSbn/R2YAd/
        1dpGYRjgdEd/JnhHfHPBaOeCb7d4a65di9te5/gdnbBmXkglytlS1r3B2JyOfqbaxQKDhV
        Gq9vZHOhFUO7BmRF+Q9yX6KRBOq5l4E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-BPgyQPCQPBeXWzIIuEKfiw-1; Mon, 15 May 2023 08:58:49 -0400
X-MC-Unique: BPgyQPCQPBeXWzIIuEKfiw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50bd7555c6eso11280483a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 May 2023 05:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684155528; x=1686747528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWCSgHKgkfiwsZPIbDFMuCcNPnF6WGYEGag89qGrc3E=;
        b=N0yv/8qSBFlolyr5BvprcF4XGKC86pmsuz+gRoRx9fqrykesMO15TrDJX9815qv602
         g69zsEIKZR/nbxJn1fnmx92G6iMb527DPDX/uUiyPJpm84tfHqejAy1ik1rOoI3OZzjz
         JshOb3hnC8Y3iy5NO/cVnbLbtzpmlhiv5LrpuTjowDSvTCaRuBV0C0KetAbNC6DPFC1c
         AFf6i2MWCKX93lN4CWX/DUGNzNybXFq/U2S68YqhltZ//OBjni3a8H+z6iKNe/RTI/49
         oEwiBRWOhzAmzU2YsrzD3vT/LoXv/NbJXC7nbwUfTOBowtj/HR8tq8h81PVNnQ7F+/C+
         YnPA==
X-Gm-Message-State: AC+VfDwSxhX9HWSocMpO99C/K9uTZbJbYubRb2rReqWK01b+KapDX1VX
        PQwEB2FHAruzls20TyQrTSfQ9d7kKkrAjxP//KovEevrLNtBlMmRXnN5hKkmyf/xpe+m4Rifcq8
        NxpEx5nx7F4j5CwGvkzxoBB1zxEKAwUEpoQ==
X-Received: by 2002:a17:907:31ca:b0:960:d28d:3368 with SMTP id xf10-20020a17090731ca00b00960d28d3368mr29751365ejb.60.1684155528691;
        Mon, 15 May 2023 05:58:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xkL6WGxU1o9yYr/28OLbSJCo+7UtLQGQNg33hogDZC56D+3LydUsY1jPyQc5CP9a5ic0ZGw==
X-Received: by 2002:a17:907:31ca:b0:960:d28d:3368 with SMTP id xf10-20020a17090731ca00b00960d28d3368mr29751349ejb.60.1684155528335;
        Mon, 15 May 2023 05:58:48 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906939300b0094e7d196aa4sm9298799ejx.160.2023.05.15.05.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 05:58:47 -0700 (PDT)
Message-ID: <ffe8f013-b666-0e8b-af19-4eda14fbe928@redhat.com>
Date:   Mon, 15 May 2023 14:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Ignore WMI events with codes
 0x7B, 0xC0
Content-Language: en-US
To:     Alexandru Sorodoc <ealex95@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230512101517.47416-1-ealex95@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230512101517.47416-1-ealex95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/12/23 12:15, Alexandru Sorodoc wrote:
> On ASUS GU604V the key 0x7B is issued when the charger is connected or
> disconnected, and key 0xC0 is issued when an external display is
> connected or disconnected.
> 
> This commit maps them to KE_IGNORE to slience kernel messages about
> unknown keys, such as:
> 
>     kernel: asus_wmi: Unknown key code 0x7b
> 
> Signed-off-by: Alexandru Sorodoc <ealex95@gmail.com>

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
> I'm not sure what those keys events actually mean. I assume they are
> some redundant notifications because no laptop functionality seems to
> depend on them.
> 
> If there is anything I can check or investigate please let me know.
> 
> Thanks,
> Alex
> 
>  drivers/platform/x86/asus-nb-wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index e2c9a68d12df..fdf7da06af30 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -555,6 +555,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
>  	{ KE_IGNORE, 0x79, },  /* Charger type dectection notification */
>  	{ KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle */
> +	{ KE_IGNORE, 0x7B, }, /* Charger connect/disconnect notification */
>  	{ KE_KEY, 0x7c, { KEY_MICMUTE } },
>  	{ KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
>  	{ KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
> @@ -584,6 +585,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0xAE, { KEY_FN_F5 } }, /* Fn+F5 fan mode on 2020+ */
>  	{ KE_KEY, 0xB3, { KEY_PROG4 } }, /* AURA */
>  	{ KE_KEY, 0xB5, { KEY_CALC } },
> +	{ KE_IGNORE, 0xC0, }, /* External display connect/disconnect notification */
>  	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
>  	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
>  	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */

