Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A30C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B98E64EF9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbhCQRv1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:51:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20711 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232793AbhCQRvX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 13:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616003483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dEGLhiDnwMkfXyobnjzNNfxRt05nqIQ9oCfTjdxDrNk=;
        b=i65sq6JQ/8ix09/NosZxcr/axUx/Dbk5JxdKjiOuyonTf58QIp6l2N/bA0YW1zCiOGCSHW
        Lk8Dd2CAa53cBA684ZPgqkI2kky5zspTNcRqwuC50T3sM1blFQNjYUa/yJMOJlwmDU4Cfd
        d809YTpLBvEC9famuDukIzmofs09/hE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-N_AW4fW1OZmUbMkQc3U9zA-1; Wed, 17 Mar 2021 13:51:20 -0400
X-MC-Unique: N_AW4fW1OZmUbMkQc3U9zA-1
Received: by mail-ej1-f72.google.com with SMTP id e7so7639749ejx.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 10:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dEGLhiDnwMkfXyobnjzNNfxRt05nqIQ9oCfTjdxDrNk=;
        b=qRqh17VL5yQOCgvAHgzb4Dp+/TF4jXclZ8zrf/if8wecAVvIqf+PxKtRLq7EKmW3N3
         +BcnX/Ac6gsIlCWOY6eijE2VxqJmk95qQ27nSGB0QnOttgk0LA0ngNz/jOT1MftycMT6
         Y7Jo7GDA+bsjpyhQQFGf+Ni0p4wLG/aoVqQwblTfWTVTalGa+xXLpD+7JCNlpVD/4j+B
         ZXYUiXGIUwy113rYgRcpHVdQLRVDcC4933iFXtP6vTBv9Wuc90EAKkIog0wdW3fheNw1
         cQquGbajUFExZfQTVhWi4Qa59n0oZAcSDBM7+91zekVTEo4e9ku2iMq9eLBNv3zOlcZr
         jqyg==
X-Gm-Message-State: AOAM530g0Sr4Uclu3wGgJHTIW666FTap71j0J2BtL39dA0AhTlUjwJ2B
        nHPghjlnvks+P9sfJVWXk/9tMbJ7PaijjTIvbMNCu40K6efhwkv5xD+Lsm69V5exBbhLCFT4Q/p
        bpwJh1rBLF8E01ThTlrdxiVpvGz9/+/U83w==
X-Received: by 2002:a17:906:2692:: with SMTP id t18mr35995233ejc.16.1616003479175;
        Wed, 17 Mar 2021 10:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8IIqqzKi80zAS/wBgk3gjwN2BKvmk4SZApacfhOF8Scf6r4WnqZCq5KX58hhLWGPN0XiQBA==
X-Received: by 2002:a17:906:2692:: with SMTP id t18mr35995219ejc.16.1616003478982;
        Wed, 17 Mar 2021 10:51:18 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t12sm14026179edy.56.2021.03.17.10.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:51:18 -0700 (PDT)
Subject: Re: [PATCH 0/2] HID: Add support for Surface Aggregator Module HID
 transport
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210310225329.2393372-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a1e56ef2-e040-46b1-198e-4784765fc766@redhat.com>
Date:   Wed, 17 Mar 2021 18:51:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310225329.2393372-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/21 11:53 PM, Maximilian Luz wrote:
> This series adds support for the Surface System Aggregator Module (SSAM)
> HID transport subsystem.
> 
> The SSAM is an embedded controller, found on 5th- and later generation
> Microsoft Surface devices. On some of these devices (specifically
> Surface Laptops 1, 2, and 3, as well as Surface Book 3), built-in input
> devices are connected via the SSAM. These devices communicate (mostly)
> via normal HID reports, so adding support for them is (mostly) just a
> matter of implementing an HID transport driver.
> 
> SSAM actually has two different HID interfaces: One (legacy) interface
> used on Surface Laptops 1 and 2, and a newer interface for the rest. The
> newer interface allows for multiple HID devices to be addressed and is
> implemented in the first patch. The older interface only allows a single
> HID device to be connected and, furthermore, only allows a single output
> report, specifically one for the caps lock LED. This is implemented in
> the second patch.
> 
> See the commit messages of the respective patches for more details.
> 
> Regards,
> Max
> 
> Note: This patch depends on the
> 
>     platform/surface: Add Surface Aggregator device registry
> 
> series. More specifically patch
> 
>     platform/surface: Set up Surface Aggregator device registry
> 
> The full series has been merged into the for-next branch of the
> platform-drivers-x86 tree [1]. The commit in question can be found at
> [2].
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=fc622b3d36e6d91330fb21506b9ad1e3206a4dde

Jiri, I'll prepare an immutable branch with the necessary pdx86 pre-reqs for this
and I'll send you a pull-req for that IM branch, then you can merge these
through the HID tree after merging that pull-req.

Regards,

Hans



> 
> Maximilian Luz (2):
>   HID: Add support for Surface Aggregator Module HID transport
>   HID: surface-hid: Add support for legacy keyboard interface
> 
>  MAINTAINERS                                |   7 +
>  drivers/hid/Kconfig                        |   2 +
>  drivers/hid/Makefile                       |   2 +
>  drivers/hid/surface-hid/Kconfig            |  42 +++
>  drivers/hid/surface-hid/Makefile           |   7 +
>  drivers/hid/surface-hid/surface_hid.c      | 253 +++++++++++++++++
>  drivers/hid/surface-hid/surface_hid_core.c | 272 +++++++++++++++++++
>  drivers/hid/surface-hid/surface_hid_core.h |  77 ++++++
>  drivers/hid/surface-hid/surface_kbd.c      | 300 +++++++++++++++++++++
>  9 files changed, 962 insertions(+)
>  create mode 100644 drivers/hid/surface-hid/Kconfig
>  create mode 100644 drivers/hid/surface-hid/Makefile
>  create mode 100644 drivers/hid/surface-hid/surface_hid.c
>  create mode 100644 drivers/hid/surface-hid/surface_hid_core.c
>  create mode 100644 drivers/hid/surface-hid/surface_hid_core.h
>  create mode 100644 drivers/hid/surface-hid/surface_kbd.c
> 

