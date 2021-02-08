Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3500CC43381
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Feb 2021 19:58:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0132564E6C
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Feb 2021 19:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbhBHT56 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Feb 2021 14:57:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38220 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235059AbhBHT5Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Feb 2021 14:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612814144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eRrDtnyYuyW+GWA2hcWcAIgvqFUC4FmUxdsZVu1EqAc=;
        b=hVQp/CIUD4LJeKSjJaKULkUnYdaG7372J19qyHHXBIQu+sBQVWyFFYpayzHE2IvezDQOBg
        +13MS7KBcIOy2RNT+rISnV49PbTLh1HzXeZGBxz+rPMchmHSJQ7yEcsj3Ok61PnFvruUqK
        1sEqEfi2j+ePuBczz+ZUxWeZ6uwjoA0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-DQ8FhkWsOO6GMVvXktOZKA-1; Mon, 08 Feb 2021 14:55:42 -0500
X-MC-Unique: DQ8FhkWsOO6GMVvXktOZKA-1
Received: by mail-ej1-f71.google.com with SMTP id bx12so13435451ejc.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Feb 2021 11:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eRrDtnyYuyW+GWA2hcWcAIgvqFUC4FmUxdsZVu1EqAc=;
        b=ZuxBZMXpBN9ZXjFu58NWGxen+bpb4NYOvUO+YRc7caTGDe4xSpUiRyHWfoo/UUpIFx
         5Rd1q7ajf7Qmc+ZTS7PTKHhHmx11W1uBjjMldt8pwlc5sJ92hxmocshlYPs51giJ5PX/
         CZFs3Rtf6nlchf1eZPloT2YngA9Tezn90sFhiKwpfmsIqFzdoj3Nac5AhkWxgahierEl
         E09khzrTZNXEnVc+i4sNPks3+Zte/TuiPDRkT13tQwg2SfYK5PJ6E5n9F25CI9IjMWAj
         Pweo2MmWje8ZfSKpvnZKXo0+JX/5dcL/msSwceqYH3Sg9/WobS0mIK0Nh8C5PWVpqjHz
         +LEQ==
X-Gm-Message-State: AOAM530B3D//BMgeW+Crmv8blCyLUCjcxce7MtSD10X2A+fthThMq0ZY
        Ya91i3fl4QNg1IBprM63/MwAXA+M3PPSL0IZiw1DMDWy6LzJ9C541+DORtB9K45qwsljZ9EGX/Y
        LhP/1sj5arpbO3AZ9SSRIDhiKgHSMCCECRg==
X-Received: by 2002:a17:906:17d5:: with SMTP id u21mr19107100eje.541.1612814141334;
        Mon, 08 Feb 2021 11:55:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxve9SM8SC2Gpxq59ecEk7qbwSrbqSZDxnsvnvMhwDL6XGBMftUhmPplK08NTp4TLNyQUROg==
X-Received: by 2002:a17:906:17d5:: with SMTP id u21mr19107072eje.541.1612814140908;
        Mon, 08 Feb 2021 11:55:40 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id kv24sm9025719ejc.117.2021.02.08.11.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 11:55:40 -0800 (PST)
Subject: Re: [PATCH 0/6] platform/surface: Add Surface Aggregator device
 registry
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210208193508.3038055-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d11ec6b6-8fca-7174-3be8-22683798ffb6@redhat.com>
Date:   Mon, 8 Feb 2021 20:55:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208193508.3038055-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/8/21 8:35 PM, Maximilian Luz wrote:
> The Surface System Aggregator Module (SSAM) subsystem provides various
> functionalities, which are separated by spreading them across multiple
> devices and corresponding drivers. Parts of that functionality / some of
> those devices, however, can (as far as we currently know) not be
> auto-detected by conventional means. While older (specifically 5th- and
> 6th-)generation models do advertise most of their functionality via
> standard platform devices in ACPI, newer generations do not.
> 
> As we are currently also not aware of any feasible way to query said
> functionalities dynamically, this poses a problem. There is, however, a
> device in ACPI that seems to be used by Windows for identifying
> different Surface models: The Windows Surface Integration Device (WSID).
> This device seems to have a HID corresponding to the overall set of
> functionalities SSAM provides for the associated model.
> 
> This series introduces a device registry based on software nodes and
> device hubs to solve this problem. The registry is intended to contain
> all required non-detectable information.
> 
> The platform hub driver is loaded against the WSID device and
> instantiates and manages SSAM devices based on the information provided
> by the registry for the given WSID HID of the Surface model. All new
> devices created by this hub added as child devices to this hub.
> 
> In addition, a base hub is introduced to manage devices associated with
> the detachable base part of the Surface Book 3, as this requires special
> handling (i.e. devices need to be removed when the base is removed).
> Again, all devices created by the base hub (i.e. associated with the
> base) are added as child devices to this hub.
> 
> In total, this will yield the following device structure
> 
>   WSID
>    |- SSAM device 1 (physical device)
>    |- SSAM device 2 (physical device)
>    |- SSAM device 3 (physical device)
>    |- ...
>    \- SSAM base hub (virtual device)
>       |- SSAM base device 1 (physical device)
>       |- SSAM base device 2 (physical device)
>       |- ...
> 
> While software nodes seem to be well suited for this approach due to
> extensibility, they still need to be hard-coded, so I'm open for ideas
> on how this could be improved.

This series looks good to me.

One question is this 5.12 material, or is this intended for 5.13
(together with drivers attaching to the newly instantiated devices) ?

I can drop this into for-next tomorrow, that gives it just about
enough "baking" time in -next to still make it into 5.12
(this should be pretty safe to push to for-next despite it being
somewhat close to the cutoff point as it is a new driver).

Maximilian, do you want me to add this series to for-next tomorrow,
or would you prefer for it to go to -next after 5.12-rc1
(and thus end up in 5.13) ?

Regards,

Hans






> 
> Maximilian Luz (6):
>   platform/surface: Set up Surface Aggregator device registry
>   platform/surface: aggregator_registry: Add base device hub
>   platform/surface: aggregator_registry: Add battery subsystem devices
>   platform/surface: aggregator_registry: Add platform profile device
>   platform/surface: aggregator_registry: Add DTX device
>   platform/surface: aggregator_registry: Add HID subsystem devices
> 
>  MAINTAINERS                                   |   1 +
>  drivers/platform/surface/Kconfig              |  26 +
>  drivers/platform/surface/Makefile             |   1 +
>  .../surface/surface_aggregator_registry.c     | 641 ++++++++++++++++++
>  4 files changed, 669 insertions(+)
>  create mode 100644 drivers/platform/surface/surface_aggregator_registry.c
> 

