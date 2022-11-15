Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA33C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 16:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238628AbiKOQSQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 11:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238632AbiKOQRz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 11:17:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736FA2AE2A
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668529023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XDgT+hgY0n5Xo5QJsDJ/FMhFBT9jyY5U73j3jzri3M8=;
        b=IkA06xqFNlWG6g1F2MUvo04RjlSQbKbYSc3zrpGMxnf0ihpZvXaVGRnz41JmTDgUFX38W3
        vukI3eu5erS//1sTXsrJcFJWs6jboUZ20inVJJixIxk+l3vIodBNTmngEcVeEIvc8T/4Dd
        MYKdlZXC6UsaRMKVKyZMqKOFxTpGc4Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-EjsbeVL4OkWN81QCRNeWbw-1; Tue, 15 Nov 2022 11:17:01 -0500
X-MC-Unique: EjsbeVL4OkWN81QCRNeWbw-1
Received: by mail-ed1-f72.google.com with SMTP id h9-20020a05640250c900b00461d8ee12e2so10342414edb.23
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 08:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDgT+hgY0n5Xo5QJsDJ/FMhFBT9jyY5U73j3jzri3M8=;
        b=G7XBtNspJ4dDlbThTBkLkZJK5ynEDav70JrKtn52/SHi4g2i9SfP/N/bm0H0PVsj03
         ER3qJ3CpFpd3iKczmOclTQor8UrK0+AAqjfdpK8T2Zj/ZXfyrMOhEPLoy1qEfnyDC7+k
         fyEu1tyGGsVcVRz3LyFEaFQe28Y+ZlpjCjnO3iKTgKjnswz3DnMIHm57wQPkf/yeunKv
         yvEAMXfI72IiiT6Y1lFI6v+3TDbdflh1+joKlhP9okZ+JSZGSmb9l/ga5DPXwUXZFCmi
         ucamkcOamprgETkIpxZ1Tc1SItg6A0egkf/U1qH4lH8+6OlhD5QuSMv3UrpFWOicqp/5
         kTzQ==
X-Gm-Message-State: ANoB5pm+xTGuOlvCbcFkZtepIkuf/GcOd+i3x2mbqOUm4cDLWDUhH+d/
        vEtFLKiF6/c3TwMECYTvLvYK1tX2SFk8j/bkm7/N6j5J6crZtawydRdMUInN6h5wf/M9U2ENKWo
        nyeqEgdCbe0bw2YKkoQ/zKdQIeWdujGj7Lg==
X-Received: by 2002:a17:906:3a9b:b0:7ad:dc7e:1b8d with SMTP id y27-20020a1709063a9b00b007addc7e1b8dmr14138926ejd.276.1668529019788;
        Tue, 15 Nov 2022 08:16:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DQXNXpGw0jTeP4M7J28ODDSm5WTMzJAsZ6eIFdJqF9Qm2Ff7+YVEglvO55lSJNDrCnesNoA==
X-Received: by 2002:a17:906:3a9b:b0:7ad:dc7e:1b8d with SMTP id y27-20020a1709063a9b00b007addc7e1b8dmr14138908ejd.276.1668529019556;
        Tue, 15 Nov 2022 08:16:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id rl24-20020a170907217800b00770880dfc4fsm5702078ejb.29.2022.11.15.08.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 08:16:59 -0800 (PST)
Message-ID: <32184965-8f8c-a4da-6df7-26ae7ad985fa@redhat.com>
Date:   Tue, 15 Nov 2022 17:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: acer-wmi: Enable SW_TABLET_MODE on Switch V
 10 (SW5-017)
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Rudolf Polzer <rpolzer@google.com>
References: <20221111111639.35730-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221111111639.35730-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/11/22 12:16, Hans de Goede wrote:
> Like the Acer Switch 10 (SW5-012) and Acer Switch 10 (S1003) models
> the Acer Switch V 10 (SW5-017) supports reporting SW_TABLET_MODE
> through acer-wmi.
> 
> Add a DMI quirk for the SW5-017 setting force_caps to ACER_CAP_KBD_DOCK
> (these devices have no other acer-wmi based functionality).
> 
> Cc: Rudolf Polzer <rpolzer@google.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my fixes branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/acer-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 18224f9a5bc0..ee67efdd5499 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -564,6 +564,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
>  		},
>  		.driver_data = (void *)ACER_CAP_KBD_DOCK,
>  	},
> +	{
> +		.callback = set_force_caps,
> +		.ident = "Acer Aspire Switch V 10 SW5-017",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SW5-017"),
> +		},
> +		.driver_data = (void *)ACER_CAP_KBD_DOCK,
> +	},
>  	{
>  		.callback = set_force_caps,
>  		.ident = "Acer One 10 (S1003)",

