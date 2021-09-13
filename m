Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818D7C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:43:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 665EA60F4C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238783AbhIMJok (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 05:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52400 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231709AbhIMJok (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 05:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631526204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V/loW4DClImzCiXBJEZGuPvVho5iKsm3gkkHR+rP5O0=;
        b=TRNmBPEThOAbCxOPdilzNPVCXbQUwo/0czsuJNNDiix3TL9Sh8NI48+VzpCdtuJxUhk2q9
        OGYYCwtGve7T8AnO/mQbDtJOklF9jsrQthstNNGyhn3rge6Zy0JOAzc0yN1nFXF9hMrP08
        8nZykFiOlNIpBRw8vlrKJ0cR0406/jM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-DSyQNplyNhG2ruT2ZS8IMg-1; Mon, 13 Sep 2021 05:43:23 -0400
X-MC-Unique: DSyQNplyNhG2ruT2ZS8IMg-1
Received: by mail-ej1-f71.google.com with SMTP id r21-20020a1709067055b02904be5f536463so3434032ejj.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 02:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V/loW4DClImzCiXBJEZGuPvVho5iKsm3gkkHR+rP5O0=;
        b=VJH/7Jl+xzqi0dphjZycw2VWqNrXSyPLSU/oX43zyp2BbpZdvZlZAYB2Dq5sTIT0vT
         3X2iunhsUSau0ncH1ik8PRFO79uU3t6V6WfsnUs4n3y6UJ0QY/cyOpbE3KvWIaI7yJor
         P4SoTHmOL3DA0mfXl8I/cDBIxEm6k17zzwsifYqt1CHIpDtMPs6VJumx80qNYe+5C42d
         LYX6K+Z9nPfrw/o3J4ydhOs2Jrp6KMnWiD73YNHp2TqkcytE5MeYSpKFTbwaeLEoO2pE
         9xF6cTlETGv9v4Dtsz+38KjE/ieRpemfVgZ6ZlddhGYrtUmduYoqdf+eZB0fpUhef2CK
         g64A==
X-Gm-Message-State: AOAM530Gdh1IOstUfieQRduSRybhaJICA9smzm729aUK6HhfSqfwgFae
        VjetACXnMFRIoq48DbynybFjh9ujaUIHM65FzWGxZIMqKDWdRgDbPRSFf6Bwojcz1gt7QH3bWm9
        TBgs7AK/bNSBochmmdszVPvHu4PnA5uwgiEKL2JtIfoWir+iNzX4za9MrNdnXWzIW7E+QYf/3DH
        wkbeq4g1dO4Q==
X-Received: by 2002:a17:906:39cb:: with SMTP id i11mr10822923eje.168.1631526201983;
        Mon, 13 Sep 2021 02:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1f4t8zwpdeCjn13pQ8VRKjWpQ33wU9IBfFX+5tYSLeT+qHruzaYZOE2S6t02XwuPNbOfThQ==
X-Received: by 2002:a17:906:39cb:: with SMTP id i11mr10822898eje.168.1631526201713;
        Mon, 13 Sep 2021 02:43:21 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id cb10sm389670edb.18.2021.09.13.02.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 02:43:21 -0700 (PDT)
Subject: Re: [RFC PATCH v1 13/30] platform/x86: wmi: use dynamic debug to
 print data about events
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210904175450.156801-14-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cca079b3-1a55-845b-3cfc-1b0a1879484e@redhat.com>
Date:   Mon, 13 Sep 2021 11:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904175450.156801-14-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/4/21 7:55 PM, Barnabás Pőcze wrote:
> The dynamic debug framework provides a more flexible
> way to configure debugging messages emitted by the kernel
> than module options. Use `dev_dbg()` in `acpi_wmi_notify_handler()`
> to print the event identifier and device name (which is the GUID).
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>
> ---
>  drivers/platform/x86/wmi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 90ba75247d7f..8aad8f080c64 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1313,8 +1313,7 @@ static void acpi_wmi_notify_handler(acpi_handle handle, u32 event,
>  		wblock->handler(event, wblock->handler_data);
>  	}
> 
> -	if (debug_event)
> -		pr_info("DEBUG Event GUID: %pUL\n", wblock->gblock.guid);
> +	dev_dbg(&wblock->dev.dev, "event 0x%02X\n", event);

The debug_event value gets set by a module-parameter and several WMI related
howto-s and forum threads on the web refer to this. At one point in time even:
https://wiki.ubuntu.com/Hotkeys/Troubleshooting

Used to refer to this, but they seem to have dropped this.

Either way this changes makes users have to also deal with dyndbg stuff to
get the same info which before they could get with just the debug_event module
param, which makes debugging harder, so I'm going to drop this patch from the
series.

Regards,

Hans


> 
>  	acpi_bus_generate_netlink_event(
>  		wblock->acpi_device->pnp.device_class,
> --
> 2.33.0
> 
> 

