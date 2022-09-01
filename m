Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78ECECAAD1
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 12:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233080AbiIAMYz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233410AbiIAMYw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 08:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8AA5F95
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662035087;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CQbFmk0Y3MfuhhM1j8a7kjSVVaq+3spxw7rn9vcDjbc=;
        b=WDmpeW3xkGnZUrY0WMHtLaAETwQtj24kg/6gfppB/4/oBGu5gADSoSwcJVNZ0Eq+e1Elo4
        HI6zZNHC8kZ5TUkS1PCkpqHYacTWBwnTeGvOp+Ok81FBFZ5bxU3P6j/QrDiWUfNs/scWdb
        faCjx7AYegvFPNWv35Go6o2zOT8u2Hk=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-zl_uCjV7P_GESbXO4PNAdg-1; Thu, 01 Sep 2022 08:24:46 -0400
X-MC-Unique: zl_uCjV7P_GESbXO4PNAdg-1
Received: by mail-oo1-f70.google.com with SMTP id f6-20020a4a9206000000b0044e001dc716so5246085ooh.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 05:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CQbFmk0Y3MfuhhM1j8a7kjSVVaq+3spxw7rn9vcDjbc=;
        b=q5TZ0KP4E9YjvtQmjoFeH4ZVcC3tC0B9s4Sxt3wkRFqb+zjdAFjD8q38U36h5Z250A
         7epFCWnZ1OSjow+VzRCWKHHO+WJhIIWBFY5sSt0cEOSyGi7gacLrTb/a25DfQaezptco
         F41RAli1C6LOmmgqJxCKlqy6issuKV6wSciXQBucVuVHRbqeP4dzYywgs0kNX2WrvlMz
         913Fe7l4mt3gWtIS9mpb8W5Jii5xi/SMg8Ge4zZhkhlV3jpd9n0fQv0zFZNhjACDKAsW
         oFAY74irLLzaoCOFxSF/c/6+5r5TaJyZXMoXoA4DNc2Z0lRunjayfVV49+Cq3BqrsiiG
         Lklg==
X-Gm-Message-State: ACgBeo3ygPsYJ8Gd4UJra8Qh3OO+akdAaLiT+y0vyG3EqbM2Iak2ljUD
        S3G8FDzCvz0ZYGOEZd5iq4SmptU+c1Edz0XlJo/tM1z6swS+UGKeCO40eUSawdBcLMITxTxxRUt
        JDXI5gPi+SQRYkjbWiiBkQOA3n+saKEK0COG9xgM6a/Lu65fQIg==
X-Received: by 2002:a05:6870:d296:b0:11d:6780:3083 with SMTP id d22-20020a056870d29600b0011d67803083mr3703081oae.61.1662035085956;
        Thu, 01 Sep 2022 05:24:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR66hscw8nO2qw0QFIYeZPXILAZxtk2uZL5/Fbmc/C4ph6sPh1En2XNSFNqGpbEkfjv540i7LMp9cSbJ5NpS5lU=
X-Received: by 2002:a05:6870:d296:b0:11d:6780:3083 with SMTP id
 d22-20020a056870d29600b0011d67803083mr3703067oae.61.1662035085686; Thu, 01
 Sep 2022 05:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com> <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
In-Reply-To: <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
From:   Bastien Nocera <bnocera@redhat.com>
Date:   Thu, 1 Sep 2022 14:24:34 +0200
Message-ID: <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD PMF
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 1 Sept 2022 at 13:16, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 8/23/22 12:29, Shyam Sundar S K wrote:
> > In this series, support for following features has been added.
> > - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
> >   where the system power can be boosted or throttled independent
> >   of the selected slider position.
> > - On the fly, the CnQF can be turned on/off via a sysfs knob.
>
> Thank you. I think that before doing a more in detail review
> we first need to agree on the userspace interactions here.
>
> I've added Bastien, the power-profiles-daemon maintainer
> to the Cc for this.
>
> From a quick peek at the patches I see that currently they do
> the following:
>
> Probe time:
> -----------
>
> 1. If static slider (classic /sys/firmware/acpi/platform_profile)
> is available register as a platform_profile provider
>
> 2. Query if the BIOS tells us that CnQF should be enable by
> default if yes then unregister the platform_profile provider
> and enable CnQF
>
>
> Run time:
> ---------
>
> Allow turning CnQF on/off by writing a sysfs attribute for this.
>
> 1. When CnQF gets enabled unregister the platform_profile provider
>
> 2. When CnQF gets disabled restore the last set profile and
> register the platform_profile provider
>
>
> Questions/remarks:
>
> 1. If you look at 1. and 2. under "Probe time", you will see that
> when the BIOS requests to have CnQF enabled by default that
> userspace will then still shortly see a platform_profile
> provider. This must be fixed IMHO by checking whether to do
> CnQF by default or not before the initial register call.
>
> 2. What about low-power scenarios ? Currently power-profiles-daemon
> will always advertise a low-power mode even when there is no
> platform-profile support, since this is also a hint for other
> parts of the system to try and conserve power. But when this
> mode is enabled we really want the system to also behave as
> if the old static slider mode is active and set to low-power.
>
> Some ideas:
> a) maybe still have the amd-pmf code register a (different)
> platform_profile provider whn in CnQF mode and have it only
> advertise low-power
>
> b) teach power-profiles-daemon about CnQF and have it
> disable CnQF when entering low-power mode?
>
> c) make the CnQF code in PMF take the charge level into
> account and have it not go "full throttle" when the chare
> is below say 25% ?
>
> 3. Bastien, can power-profiles-daemon deal with
> /sys/firmware/acpi/platform_profile disappearing or
> appearing while it is running?

No, it doesn't.

It expects the platform_profile file to be available on startup, at
worse with the choices not yet filled in. It doesn't handle the
platform_profile file going away, it doesn't handle the
platform_profile_choices file changing after it's been initially
filled in, and it doesn't support less than one power profile being
made available, and only supports hiding the performance profile if
the platform doesn't support it.

Some of those things we could change/fix, some other things will not.
If the platform_profile_choices file only contained a single item,
then power-profiles-daemon would just export the "low-power" and
"balanced" profiles to user-space, as it does on unsupported hardware.

The profiles in power-profiles-daemon are supposed to show the user
intent, which having a single setting would effectively nullify.
It's unclear to me how CnQF takes user intent into account (it's also
unclear to me how that's a low-power setting rather than a combination
of the existing cool and quiet settings).

