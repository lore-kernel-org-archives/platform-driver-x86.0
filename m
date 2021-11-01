Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03D0C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 09:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA2D060E54
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 09:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbhKAKAH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 06:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46612 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232587AbhKAJ7R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 05:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635760604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vnNLP3pxCj5kK+Y7vBpKll8NWXd7vahWcRAymdcHOXU=;
        b=XMxIYR6Ct4LAlKOU6HWX70OX7h6tOys4BaqEVdiM8JApgs6qvrpxFTi5SpPIs/QnEH0rUz
        sE3m/CRr0ZLWd9I/6XCuX5xNomIW7nwM+Vns8qyQO7ozIOWYuq9dV2ln9HR1ghEgpWBf7B
        oSTqMFEdOqA/UDYzpNI3tz32XOO79zo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-iK7ix7XqPIK59QLpWifwQg-1; Mon, 01 Nov 2021 05:56:43 -0400
X-MC-Unique: iK7ix7XqPIK59QLpWifwQg-1
Received: by mail-ed1-f69.google.com with SMTP id w11-20020a05640234cb00b003e0cd525777so10360420edc.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Nov 2021 02:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vnNLP3pxCj5kK+Y7vBpKll8NWXd7vahWcRAymdcHOXU=;
        b=qY1iTV560vrUpI6yzqEEoeJ0gn7YrKgBFkhBlyo7ySfugcRMSkccqIx8ZP6fpTV3PT
         csS7Ddf+0X0Wnu3zMLCAV3U1OyBJFoBnAnNtuYY1twC67HW/4FFBmOw1205RxZl0yt5A
         iLbYHAyxwrxVGmRJy3PII9WZDXobvctgeN+1sM02XIZMUDDQXtiIboLWFB007Ik5xMrj
         5N22kbLDsoSPqQwpXoGeiLz/Xfu/BIyGWW9bNaeMFiL+CSt4TK0ze0pIPHblnoZ2trAR
         JkVS2cIYdEJkKjtWulNoPsDe2oE7vf7Kx79jxXUA8Y8TyhcY6xFnO1kGJ8SXvgU9PPAv
         hQKg==
X-Gm-Message-State: AOAM532Gy6s2LfxI4jGcyGaPYxNDjpaKOFWcEu9DgSzILTwJ++rflRFC
        diU/vBhnOtNrgiDdQUzH7UrBoEo2nFG/TTuy+h/CdOLFzKIA2DJDwS1NPafX1P2l0Va/MBa5dL+
        MNZhUUk+0CAR8FmvLDdOClLN2gReDEDn0YQ==
X-Received: by 2002:a17:907:72c3:: with SMTP id du3mr34940721ejc.536.1635760601919;
        Mon, 01 Nov 2021 02:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDvKiU7RqegUNMLj+l6RYZc7y2j4L+5bcqrSsjwNjl0uODitZefSFLpVVKu1zw5CeLeXrwIA==
X-Received: by 2002:a17:907:72c3:: with SMTP id du3mr34940693ejc.536.1635760601753;
        Mon, 01 Nov 2021 02:56:41 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id bm1sm6701834ejb.38.2021.11.01.02.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 02:56:40 -0700 (PDT)
Message-ID: <883db585-c9bb-5255-4ddd-f093616af1a1@redhat.com>
Date:   Mon, 1 Nov 2021 10:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/6] MODULE_DEVICE_TABLE() support for the ISHTP bus
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20211029152901.297939-1-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211029152901.297939-1-linux@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/21 17:28, Thomas Weißschuh wrote:
> Currently as soon as any ISHTP device appears all available ISHTP device
> drivers are loaded automatically.
> This series extends the MODULE_DEVICE_TABLE() functionality to properly handle
> the ishtp bus and switches the drivers over to use it.
> 
> Patch 1 adds the infrastructure to handle ishtp devices via MODULE_DEVICE_TABLE()
> Patch 2 replaces some inlined constants with ones now defined by mod_devicetable.h
> Patches 3-6 migrate all ishtp drivers to MODULE_DEVICE_TABLE()
> 
> Note: This patchset is based on the pdx86/for-next tree because that contains
> one of the drivers that is not yet in the other trees.

Since most of the changes here are under drivers/hid and since the latter
patches depend on 1/6, I believe it would be best to merge the entire series
through the HID tree, here is my ack for this:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> 
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> 
> Thomas Weißschuh (6):
>   HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()
>   HID: intel-ish-hid: use constants for modaliases
>   HID: intel-ish-hid: fw-loader: only load for matching devices
>   HID: intel-ish-hid: hid-client: only load for matching devices
>   platform/chrome: chros_ec_ishtp: only load for matching devices
>   platform/x86: isthp_eclite: only load for matching devices
> 
>  drivers/hid/intel-ish-hid/ishtp-fw-loader.c  |  7 +++++-
>  drivers/hid/intel-ish-hid/ishtp-hid-client.c |  7 +++++-
>  drivers/hid/intel-ish-hid/ishtp/bus.c        |  4 ++--
>  drivers/platform/chrome/cros_ec_ishtp.c      |  7 +++++-
>  drivers/platform/x86/intel/ishtp_eclite.c    |  7 +++++-
>  include/linux/mod_devicetable.h              | 13 +++++++++++
>  scripts/mod/devicetable-offsets.c            |  3 +++
>  scripts/mod/file2alias.c                     | 24 ++++++++++++++++++++
>  8 files changed, 66 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 85303db36b6e170917a7bc6aae4898c31a5272a0
> 

