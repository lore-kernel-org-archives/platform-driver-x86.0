Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0FAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 08:10:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CAB361166
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 08:10:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237686AbhJFIMf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 04:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22016 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237690AbhJFIMc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 04:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633507840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mthn/G3Sv0qrkenGI3DlH3Nwq62NK6rrpSNp7AZdduo=;
        b=JMmiQgUzIoFtwgI9365e8bNEZZYo6RYYY9/q0DGV+/O9P72nYNfmTcyC3G33r76vMv6d5n
        /vaa47+bSz8CRodPZoEE0C8Pfmu8B2Wa/UFKfinD0f2LAb8xLKEumuapwe9z269+JOCHpq
        4UTjYmFGqqRiJQ4Bsf4rSitvhccXcd8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-eP5kWL30MOaCHpp0IVJybg-1; Wed, 06 Oct 2021 04:10:39 -0400
X-MC-Unique: eP5kWL30MOaCHpp0IVJybg-1
Received: by mail-ed1-f69.google.com with SMTP id 1-20020a508741000000b003da559ba1eeso1862519edv.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Oct 2021 01:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mthn/G3Sv0qrkenGI3DlH3Nwq62NK6rrpSNp7AZdduo=;
        b=bT+SdDr5wiZYfD98Q2ZOB0vUHaMTKJ7vGtMeB9CtZaGlHWGPfMz6sFPxkq4sE+eAHa
         wuTVE2PAN/XN7kJQBm+goDWl3S4vzyOHaoBtRZEAXUMXNU3jB+FA1d301y9nyg/Kgr16
         vWdZl1N5QhZQTWDYpVRB4QZ8MU0NcJ3AA6zh4H6jCjNRYQejmeFJq2mUnSLF7TTy12oX
         R+q0XeME+bHuW7vcjAEcwI4A3zoj8FqISPm0T9k5flACYIb3e7Y0BsnjJXwKztHUhqxH
         453fiJenboGZLSIqZdS9tLJd6SCpGBlIImyE/T/VFyLweWn0+Mo7L63fhUY4mLF3gdj3
         /Uxw==
X-Gm-Message-State: AOAM53054Icc9NHyf1EgmSohwgJGG4tQQ4U0O7n6T+q0M0OmIZ6pHGq3
        Vowx0YVyrz3vRhOYlBMo1K9spBZrrhGMM+bXsO5h2SrH9SBsC348NgwLw0th8Amqr2XLhftjcac
        iaBth84VX4egb2lb5zt+m4EItmq1WYsWb+A==
X-Received: by 2002:a05:6402:3494:: with SMTP id v20mr2354654edc.326.1633507838161;
        Wed, 06 Oct 2021 01:10:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDjl/WmeV0e8V9tIQbI8WCJ3iANjgxPy2EnDRPu692c71YSacs3IID5mHQ1Yf+2aEG0qGWgg==
X-Received: by 2002:a05:6402:3494:: with SMTP id v20mr2354639edc.326.1633507838017;
        Wed, 06 Oct 2021 01:10:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o7sm2358498edr.83.2021.10.06.01.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 01:10:36 -0700 (PDT)
Subject: Re: [RFC] add standardized attributes for force_discharge and
 inhibit_charge
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        linux-pm@vger.kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Thomas Koch <linrunner@gmx.net>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>
References: <21569a89-8303-8573-05fb-c2fec29983d1@gmail.com>
 <77e39b3e-fa51-54fe-1898-4f43895ac2c6@redhat.com>
 <20211005162352.emaoveimhkp5uzfw@earth.universe>
 <06fa7a23-4dec-cba9-4e00-c00cf0bf9337@redhat.com>
 <20211005220630.zurfqyva44idnplu@earth.universe>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8cbf7671-d9ee-6bfc-d8fd-d360ccb2c595@redhat.com>
Date:   Wed, 6 Oct 2021 10:10:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211005220630.zurfqyva44idnplu@earth.universe>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/21 12:06 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Oct 05, 2021 at 08:01:12PM +0200, Hans de Goede wrote:
>> Right, force-discharge automatically implies charging is
>> being inhibited, so putting this in one file makes sense.
>>
>> Any suggestion for the name of the file?
> 
> Maybe like this?
> 
> ---------------------------------------------------------------------
> What: /sys/class/power_supply/<supply_name>/charge_behaviour
> Date: October 2021
> Contact: linux-pm@vger.kernel.org
> Description:
>  Configure battery behaviour when a charger is being connected.
> 
>  Access: Read, Write
> 
>  Valid values:
> 
>  0: auto / no override
>     When charger is connected battery should be charged
>  1: force idle
>     When charger is connected the battery should neither be charged
>     nor discharged.
>  2: force discharge
>     When charger is connected the battery should be discharged
>     anyways.
> ---------------------------------------------------------------------

That looks good to me. Although I just realized that some hw may
only support 1. or 2. maybe explicitly document this and that
EOPNOTSUPP will be reported when the value is not supported
(vs EINVAL for plain invalid values) ?

Regards,

Hans

