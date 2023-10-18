Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0404ACDB47E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 10:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjJRKDQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 06:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjJRKDP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 06:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA8D95
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 03:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697623350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RdxDXxhIq6WL0mBsK55/D5JbSTChg4ldshlzDJ284sk=;
        b=USKJAzlHph7PwJslu5PY3E20uFT2iURLFJKZKLaT+SQN4MFAVscLP6AOfnSQS9iKA83f3G
        uxJ/HFDBH/VnDcMG1Wf8Q/VHtI5GKeMWCo+x4JxG7cOe6G5/agm8jWMycGp7M6bbvWY4/b
        luD+inmS0zlUjQQyuMVpl5GJfXnnMgw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-I0d1rIqjM6KQI2EPWEOV7Q-1; Wed, 18 Oct 2023 06:02:16 -0400
X-MC-Unique: I0d1rIqjM6KQI2EPWEOV7Q-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ba1949656bso61497621fa.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 03:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697623335; x=1698228135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdxDXxhIq6WL0mBsK55/D5JbSTChg4ldshlzDJ284sk=;
        b=s5RwsBUkPXuiw0y1g15H39zzNJDdI033EabY7aAVSI2bJAzPmzL0pn6pChlBRqDGGG
         Kunx506hD+B9NNEduN28WCXgbza6viWZX9h1ZDF8aN8c7tw1DhfD7/0GNWkQ0KDJAOqe
         4yS/51eVWNNtf3wa1fCBWQB88l1e4RObK6HV2+IqkNwGCrqmXzvg0ZFZIwGQZns8znij
         wXJZmexxXhAvoIHSfOJhL7WxwNPynf2FLRxRXJYjPLEDe8WBiQ+se7O2aIDvWPjIcb8J
         WU5xpzmbCVumWTqaEiuqUWCGviGgPg3htOhCpUyaZC2RjcVUGe3UxZMUZCavBMtnIBUD
         Kb7w==
X-Gm-Message-State: AOJu0YwGOHLLjBziFjDFwGUrNXxvpVgPMHddfDkgK0U2bK6AgjvfWskj
        wAO14sldl5eEFpjrfDQvpBSZ3LVw6pORmAKtNrHOfCjqtilz7zNay5/4+Aw8wSDCb/R7hQnFRQS
        IJQG9TaEpDcU9wcPtnfC4uoSWkyrWih5baA==
X-Received: by 2002:a2e:b003:0:b0:2c5:19aa:ca83 with SMTP id y3-20020a2eb003000000b002c519aaca83mr3516245ljk.20.1697623335376;
        Wed, 18 Oct 2023 03:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHNssZsrQWXZXt8yGdO6XZuPwDSu/XS0FSkxt8hDKI8vuRXdiU/pq6zKJ3TaOuPk9R0MbHsQ==
X-Received: by 2002:a2e:b003:0:b0:2c5:19aa:ca83 with SMTP id y3-20020a2eb003000000b002c519aaca83mr3516218ljk.20.1697623334985;
        Wed, 18 Oct 2023 03:02:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y4-20020a1709064b0400b009b947aacb4bsm1342944eju.191.2023.10.18.03.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 03:02:14 -0700 (PDT)
Message-ID: <2c177457-e9a1-bff7-e97d-23b3a2def3d5@redhat.com>
Date:   Wed, 18 Oct 2023 12:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC 0/3] platform/x86: asus-wmi: Only map brightness codes when
 using asus-wmi backlight control
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Luke D Jones <luke@ljones.dev>
Cc:     Kai Heng Feng <kai.heng.feng@canonical.com>,
        James John <me@donjajo.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20231017090725.38163-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231017090725.38163-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 10/17/23 11:07, Hans de Goede wrote:
> Hi All,
> 
> Here is a series to address the issue of some newer Asus laptop models
> sending 0x2a - 0x2c events for various keys which fall within
> the NOTIFY_BRNDOWN_MIN - NOTIFY_BRNDOWN_MAX range causing these to
> wrongly get translated to KEY_BRIGHTNESSDOWN events.
> 
> To fix this change the NOTIFY_BRNUP_MIN - NOTIFY_BRNUP_MAX +
> NOTIFY_BRNDOWN_MIN - NOTIFY_BRNDOWN_MAX key-mapping to only apply
> to old models which use the vendor specific asus-wmi interface for
> backlight control.
> 
> This series is marked as RFC because I still need to hear back
> from the reporter if this series actually fixes things.

Ok, so this has been tested now and since this is being hit by
multiple users (also see: https://bbs.archlinux.org/viewtopic.php?pid=2123716 )
I have decided to push this to pdx86/fixes now.

Note there is a chance that this may lead to regressions where
the brightness hotkeys stop working on some really old Asus laptop
models, in case they do report the NOTIFY_BRNUP_MIN - NOTIFY_BRNUP_MAX +
NOTIFY_BRNDOWN_MIN - NOTIFY_BRNDOWN_MAX keys even though another
method (acpi_video / GPU-native) is used to control the backlight.

This would be weird, but not entirely unsurprising.

Unfortunately the only way to find out if this is the case is to try,
so I've decided to move ahead with this series to fix the known issues
caused without it on newer models. I will deal with any regressions
on older models if / when they get reported.

Regards,

Hans



> Hans de Goede (3):
>   platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to
>     0x2e
>   platform/x86: asus-wmi: Only map brightness codes when using asus-wmi
>     backlight control
>   platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events
> 
>  drivers/platform/x86/asus-nb-wmi.c |  3 +++
>  drivers/platform/x86/asus-wmi.c    | 15 ++++-----------
>  drivers/platform/x86/asus-wmi.h    |  2 +-
>  3 files changed, 8 insertions(+), 12 deletions(-)
> 

