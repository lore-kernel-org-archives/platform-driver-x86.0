Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D1ECCA47E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Jun 2022 20:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbiF1UMJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Jun 2022 16:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiF1ULu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Jun 2022 16:11:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D747A3BF86
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2022 13:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656446558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=akzoymvv+isndpzk5w3BDP04fzMq1Ke7S8Y9F0OGSKE=;
        b=Lk3ihs9wvr3qmfdJ0XrKE3HxRP8OMRsZxOuOT5l3XvFcFZFrNlN8tX0K52KR4+Eck8elKe
        0CneY0jYQ6q5fSJnplE+8jHpXOG9suWpciPj04nLnZZFQOG7rqqO2nnWkY9hMBabGs1Nvo
        sMxp1/6XRIr5VB1BfDTRRleS0vr1cOE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-CDW73vYAOT-VCiS1xCq-qQ-1; Tue, 28 Jun 2022 16:02:36 -0400
X-MC-Unique: CDW73vYAOT-VCiS1xCq-qQ-1
Received: by mail-ed1-f72.google.com with SMTP id q18-20020a056402519200b004358ce90d97so10177599edd.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2022 13:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=akzoymvv+isndpzk5w3BDP04fzMq1Ke7S8Y9F0OGSKE=;
        b=0WNHgpnxgd+w7Io9NgXjBRm9uDknLxhoR0SAa6exc69Xs45BsnT33ukPWI5KDcGU+5
         1sXJ2W+X3FQewpxFq36XAHNFISlOPDJ5tloE71snR6m2gNpYRFpanS3MFP4URcJ7QLTz
         TossmbRmNPotFbL0NZ2f37fW+mZqzClGuzT+LPorMntsL9CvHTGB7JzrDXOLzocVpnzT
         AfeWUGA1xw9p3rxRLCjNUopSNijTtb8zdgxXxy3qZaVygtDZb2+a7/ka9iDREEUBHxW4
         u+IY63d7Uue0STAuHszd68bGb7y2AdYylzp++C1XyNMSLbpFFIUKexAeM8sHJFn3/kUP
         LxIA==
X-Gm-Message-State: AJIora/b3tjlj3KRfvnEhyDHghPoEaFwhrYuDUXi7/34qUpS6i4jUiqA
        erLk546boig3i8Bg091FcpK/8PlE76QgTHJMy7GP4qb1n3CbeqopJgQy5gcLL5UJdZlyV5yEKkz
        GKreBPsykiPVYSOMJ+qN8fsWfo2PwoLdrUQ==
X-Received: by 2002:a17:907:6d99:b0:726:3668:4f2a with SMTP id sb25-20020a1709076d9900b0072636684f2amr19047428ejc.627.1656446555465;
        Tue, 28 Jun 2022 13:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sVgEFIOl5VP12jn9dNL1FO8tkC49tfbOsnzBV0A2rraUANyD6uLuaYAoNME8fg4MkyB4EeMQ==
X-Received: by 2002:a17:907:6d99:b0:726:3668:4f2a with SMTP id sb25-20020a1709076d9900b0072636684f2amr19047410ejc.627.1656446555281;
        Tue, 28 Jun 2022 13:02:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b007094f98788csm6823390ejm.113.2022.06.28.13.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 13:02:34 -0700 (PDT)
Message-ID: <ea4c139f-c2b2-7dc2-8c24-5d25ddb573ae@redhat.com>
Date:   Tue, 28 Jun 2022 22:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/7] ACPI: video / platform/x86: Fix Panasonic laptop
 missing keypresses
Content-Language: en-US
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        Stefan Seyfried <stefan.seyfried@googlemail.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220624112340.10130-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220624112340.10130-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 6/24/22 13:23, Hans de Goede wrote:
> Hi All,
> 
> Here is a series fixing the missing keypresses on some Panasonic Toughbook
> models. These missing keypresses are caused by
> commit ed83c9171829 ("platform/x86: panasonic-laptop: Resolve hotkey double
> trigger bug"), which made the panasonic-laptop driver unconditionally drop
> most WMI reported hotkeys.
> 
> This series reverts that commit and then adds some more selective filtering
> to still avoid the double key-presses on some models, while avoiding
> completely missing keypresses on others.
> 
> Rafael, these fixes rely on patch 1/7, which is a tweak to
> the acpi_video_handles_brightness_key_presses() helper. Without this
> tweak this series will cause a regression, so I would like to merge
> the entire series through the pdx86 tree, may I have your ack for this?

I've added this series to my review-hans (soon to be for-next) branch now.
Patches 1-6 have also been added to the fixes branch.

Regards,

Hans

> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (6):
>   ACPI: video: Change how we determine if brightness key-presses are
>     handled
>   platform/x86: panasonic-laptop: sort includes alphabetically
>   platform/x86: panasonic-laptop: revert "Resolve hotkey double trigger
>     bug"
>   platform/x86: panasonic-laptop: don't report duplicate brightness
>     key-presses
>   platform/x86: panasonic-laptop: filter out duplicate volume
>     up/down/mute keypresses
>   platform/x86: panasonic-laptop: Use acpi_video_get_backlight_type()
> 
> Stefan Seyfried (1):
>   platform/x86: panasonic-laptop: de-obfuscate button codes
> 
>  drivers/acpi/acpi_video.c               |  13 ++-
>  drivers/platform/x86/Kconfig            |   2 +
>  drivers/platform/x86/panasonic-laptop.c | 112 ++++++++++++++++++------
>  3 files changed, 91 insertions(+), 36 deletions(-)
> 

