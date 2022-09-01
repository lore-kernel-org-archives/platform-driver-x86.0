Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16863ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 11:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234134AbiIALQ3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 07:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbiIALQ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 07:16:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4D812CB19
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 04:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662030984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VGiMcjbB6Hbb6H/+kH0JAC+UGBXXqXN+shYKpbWzTZ4=;
        b=PI4ZkTwMcjeZz1hVZ03R3xhLb1ob6v3+wf7C/IQ6F3Q2cmMFu/6wabz6kyfSbiR9FWrs/z
        gV2Yt4uD0JBGYL2xs17BqEQi6LMEkSRQSqX6wHemHhMvRnNkLcQ13D5NzDI+Y7Nnxt6qCZ
        phENGFH+1I5z4keSduxEWocS1o+b2TM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-WEJPfVJ2MVCpu98m341XGw-1; Thu, 01 Sep 2022 07:16:23 -0400
X-MC-Unique: WEJPfVJ2MVCpu98m341XGw-1
Received: by mail-ej1-f72.google.com with SMTP id ho13-20020a1709070e8d00b00730a655e173so6659534ejc.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 04:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VGiMcjbB6Hbb6H/+kH0JAC+UGBXXqXN+shYKpbWzTZ4=;
        b=n16qn64lC2QH7qFiDFTOQV34axinMNfgrNsswcCwpaPJrpR/j4BccxYmBoSI8/ZlCh
         OkhIpJCsncJQjz6VGrB9vRjC8O5EmRiqLXAaBZ6/2kZgzENqemj6J1Tfx74M/U7aJH79
         /O98GHPJryq1Qs/uIFuJ2ecxw9WhbIS36qwEUf9TdRUniKgseS1m0L0UiDIit+aZB8Nw
         kggkb9fmJ0L3bxRdqAFtDWcZ6flsDYvYxmM4jlgnIlMBO1uejj5OJoKoZbEFH4siDoNb
         SmynOw3VVyJyn6teSUFg3la1O6gGRd2B7W1/n/wPU6mdgrmVCIRp357KLW8geX+X0Qil
         vvSA==
X-Gm-Message-State: ACgBeo1AEPB6tfg4aatTUQjk24xg8y/mAM/LuDtGxnCsYk8AlZgqhRkg
        Qk/55e0E67ClDhsuWeyGHkZg7MFgsP3zDQK2oNkIVKtJYpNI+L9iXRvNNM5lN0dYDGJn3+Q4J6Y
        TAy7vkksrNXO53w+HMp45vBab61/BOAGQLQ==
X-Received: by 2002:a17:907:7f8b:b0:73d:6f4f:30f7 with SMTP id qk11-20020a1709077f8b00b0073d6f4f30f7mr23060163ejc.323.1662030982323;
        Thu, 01 Sep 2022 04:16:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5mFb4NxdUus5q4ug5CIPe7S5JedGw8bpOybYHH/4xvEX5+pAxHI6BsHXgBvIbbQU9f9zJZzA==
X-Received: by 2002:a17:907:7f8b:b0:73d:6f4f:30f7 with SMTP id qk11-20020a1709077f8b00b0073d6f4f30f7mr23060153ejc.323.1662030982099;
        Thu, 01 Sep 2022 04:16:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ky2-20020a170907778200b0074136cac2e7sm7770192ejc.81.2022.09.01.04.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 04:16:21 -0700 (PDT)
Message-ID: <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
Date:   Thu, 1 Sep 2022 13:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD
 PMF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        Bastien Nocera <bnocera@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/23/22 12:29, Shyam Sundar S K wrote:
> In this series, support for following features has been added.
> - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
>   where the system power can be boosted or throttled independent
>   of the selected slider position.
> - On the fly, the CnQF can be turned on/off via a sysfs knob.

Thank you. I think that before doing a more in detail review
we first need to agree on the userspace interactions here.

I've added Bastien, the power-profiles-daemon maintainer
to the Cc for this.

From a quick peek at the patches I see that currently they do
the following:

Probe time:
-----------

1. If static slider (classic /sys/firmware/acpi/platform_profile)
is available register as a platform_profile provider

2. Query if the BIOS tells us that CnQF should be enable by
default if yes then unregister the platform_profile provider
and enable CnQF


Run time:
---------

Allow turning CnQF on/off by writing a sysfs attribute for this.

1. When CnQF gets enabled unregister the platform_profile provider

2. When CnQF gets disabled restore the last set profile and
register the platform_profile provider


Questions/remarks:

1. If you look at 1. and 2. under "Probe time", you will see that
when the BIOS requests to have CnQF enabled by default that
userspace will then still shortly see a platform_profile
provider. This must be fixed IMHO by checking whether to do
CnQF by default or not before the initial register call.

2. What about low-power scenarios ? Currently power-profiles-daemon
will always advertise a low-power mode even when there is no
platform-profile support, since this is also a hint for other
parts of the system to try and conserve power. But when this
mode is enabled we really want the system to also behave as
if the old static slider mode is active and set to low-power.

Some ideas:
a) maybe still have the amd-pmf code register a (different)
platform_profile provider whn in CnQF mode and have it only
advertise low-power

b) teach power-profiles-daemon about CnQF and have it
disable CnQF when entering low-power mode?

c) make the CnQF code in PMF take the charge level into
account and have it not go "full throttle" when the chare
is below say 25% ?

3. Bastien, can power-profiles-daemon deal with
/sys/firmware/acpi/platform_profile disappearing or
appearing while it is running? 

Regards,

Hans



> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Shyam Sundar S K (4):
>   platform/x86/amd/pmf: Add support for CnQF
>   platform/x86/amd/pmf: Add sysfs to toggle CnQF
>   Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF
>   MAINTAINERS: Update ABI doc path for AMD PMF
> 
>  Documentation/ABI/testing/sysfs-amd-pmf |  11 +
>  MAINTAINERS                             |   1 +
>  drivers/platform/x86/amd/pmf/Makefile   |   2 +-
>  drivers/platform/x86/amd/pmf/acpi.c     |  10 +
>  drivers/platform/x86/amd/pmf/cnqf.c     | 374 ++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c     |  16 +-
>  drivers/platform/x86/amd/pmf/pmf.h      | 100 +++++++
>  7 files changed, 512 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
>  create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c
> 

