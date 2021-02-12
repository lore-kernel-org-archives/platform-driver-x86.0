Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B801C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 08:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC06C64E56
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 08:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhBLIlh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Feb 2021 03:41:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56994 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230127AbhBLIlf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Feb 2021 03:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613119208;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QxN/AI6B9m6Vqbx17UToVEjh6Zvb7Qm9Aw2bzI/Xc4s=;
        b=KTXbeKgV7vMN7FX8gIa/RlOFgm8R8N5OZrDFNlFBhE7YBFQWHFQhDO0CBHQKyW+KYNwr0H
        BwxWFZ7bqIndmXoGVQJw00+OOwugYKY5FXxaJo9QA3Y/YcapHkimQFr3JtUs7oHyQAOuf/
        g5NUZTH78KkLImklWLPtsDxM7M1BVoU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-zJTFFKJuOACGa6ahXPtFCw-1; Fri, 12 Feb 2021 03:40:06 -0500
X-MC-Unique: zJTFFKJuOACGa6ahXPtFCw-1
Received: by mail-ed1-f70.google.com with SMTP id i4so6305774edt.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Feb 2021 00:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QxN/AI6B9m6Vqbx17UToVEjh6Zvb7Qm9Aw2bzI/Xc4s=;
        b=c/BZWXo7YyLEKrYDsU6df16P+tHOHTDo0O9rYEohVH/pp8Qs6yiBAMtxXJw32fIjc2
         nFXXdHIGAqboNgZHnva8V6AJROtPW9Oid+nhz7iJgDq2jjHtfl0Nknxn6Z53+I06Wne2
         812EqbintmKWZVP8RKHZJ5a02qA17DcaS6ZrfRocjZfXDf8CLpqVFzRPxJyzqC1wn0V8
         FZdmxHv2sXEeeDgTvZA9A4JrvtrY6pkfuG9EGextboOWC/Y2znYGBnGpBSKRFIQklkAU
         Q4lgV4QRzPB6qJvPH6mCC3BY65VkbotYETnG+XKj+DaGnV4AtuOm4ZBRfvh2khTt5u1H
         sLCw==
X-Gm-Message-State: AOAM532jojll/bUvtRMbLny6YIRGHfWtMftBEwGQjK0TYX0NO3wI3zSc
        7GAuBjgV039QmzVePSTlOFfINDvsh6V2l2Mx/uM/8d/RuCa/ftPzosIX7ke9hYEYFmqJqiU6GfX
        7VFy9/teuBMZP6lbPc4PI2K+Nm9TJKbHbWQ==
X-Received: by 2002:a17:906:a3d5:: with SMTP id ca21mr2011736ejb.192.1613119205315;
        Fri, 12 Feb 2021 00:40:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAGQgYG4dU1g59lf94oWd2rJ6Bgo0rPPFcpqQpAgs+C5+l1ZQMnflYVzyFtQrXxfrh8NZ4ow==
X-Received: by 2002:a17:906:a3d5:: with SMTP id ca21mr2011638ejb.192.1613119203900;
        Fri, 12 Feb 2021 00:40:03 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hr31sm5760674ejc.125.2021.02.12.00.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Feb 2021 00:40:03 -0800 (PST)
Subject: Re: [RFC PATCH 0/2] platform/x86: thinkpad_acpi/ideapad-laptop: move
 into subfolder and extract common DYTC code
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210204203933.559752-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0ba8d0b2-222b-3ac2-b84a-d623b7c6badc@redhat.com>
Date:   Fri, 12 Feb 2021 09:40:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204203933.559752-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Barnabás,

On 2/4/21 9:39 PM, Barnabás Pőcze wrote:
> Kconfing and Makefile based on
> https://lore.kernel.org/platform-driver-x86/20210203195832.2950605-1-mario.limonciello@dell.com/
> 
> Barnabás Pőcze (2):
>   platform/x86: move thinkpad_acpi and ideapad-laptop into lenovo
>     subfolder
>   platform/x86: thinkpad_acpi/ideapad-laptop: extract common DYTC
>     constants/functions

Thank you for this patch series.

I like the series but I would like to see the 3th patch to go even
further wrt removing duplication between thinkpad_acpi and ideapad-laptop.

The big difference between the 2 drivers is thinkpad_acpi relying on global
variables while ideapad-laptop stores everything in a driver data-struct.

What you can do is add a struct which holds all the necessary data for the
dytc code, struct ideapad_dytc_priv is a start for this I guess. Lets say
we rename struct ideapad_dytc_priv to struct dytc_priv, then thinkpad_acpi.c
can have a:

static struct dytc_priv *dytc_priv;

And there can be a shared dytc probe function like this:

static int dytc_profile_init(struct dytc_priv **dytc_priv_ret)
{
	struct dytc_priv *dytc_priv;

	...

	*dytc_priv_ret = dytc_priv;
	return NULL;

error:
	// clean stuff
	*dytc_priv_ret = NULL;
	return err;
}

Which thinkpad_acpi can then call on its global dytc_priv pointer:

	err = dytc_profile_init(&dytc_priv);

Where as ideapad_laptop would use the pointer inside its data struct:

        err = dytc_profile_init(&priv->dytc);


I think this way we should be able to share almost all of the dytc code
not just the 2 convert functions.

One difference between the 2 which I'm aware of is that ideapad_laptop caches
the handle, where as thinkpad_acpi looks it up everytime.

Caching obviously is better, so the shared code should just cache it
(add a copy of the handle pointer to the dytc_priv struct).

I guess you may hit some other issues but those should all be fixable.
So over all I think sharing most of the dytc code should be doable and
we really should move in that direction.

Note it would be best to do the further duplication removal in a
third patch, or even in multiple further patches to make reviewing this
easier.

Regards,

Hans









> 
>  MAINTAINERS                                   |   4 +-
>  drivers/platform/x86/Kconfig                  | 156 +--------------
>  drivers/platform/x86/Makefile                 |   7 +-
>  drivers/platform/x86/lenovo/Kconfig           | 177 ++++++++++++++++++
>  drivers/platform/x86/lenovo/Makefile          |   8 +
>  drivers/platform/x86/lenovo/dytc.h            |  79 ++++++++
>  .../x86/{ => lenovo}/ideapad-laptop.c         |  72 +------
>  .../platform/x86/{ => lenovo}/thinkpad_acpi.c |  73 +-------
>  8 files changed, 274 insertions(+), 302 deletions(-)
>  create mode 100644 drivers/platform/x86/lenovo/Kconfig
>  create mode 100644 drivers/platform/x86/lenovo/Makefile
>  create mode 100644 drivers/platform/x86/lenovo/dytc.h
>  rename drivers/platform/x86/{ => lenovo}/ideapad-laptop.c (94%)
>  rename drivers/platform/x86/{ => lenovo}/thinkpad_acpi.c (99%)
> 

