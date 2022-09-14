Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647E0C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Sep 2022 16:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiINQ7M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Sep 2022 12:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiINQ7L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Sep 2022 12:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB4C81B2C
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Sep 2022 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663174749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8eAE9HpKpIVvmOEFXUeeAc8cv8ndkWqJta1h5pXlw4I=;
        b=faVxKe/OXficetfU422VJoc4BL9fcmWCwOXPx/yH9OWULexiZqZk+q/+mCwvGvvMRfFWhb
        nuv1mseqGIW8sC0V5bfEaWgRP60mUSReNf4mqejn7yePvWSNdyZyiFKxgF6dvSdGGWzLA1
        diZBVr2G8R6sN4LOCIT5S1Ys0S8xAUQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-a_o06iD0MW2WQCrfq6DTyQ-1; Wed, 14 Sep 2022 12:59:04 -0400
X-MC-Unique: a_o06iD0MW2WQCrfq6DTyQ-1
Received: by mail-wm1-f72.google.com with SMTP id y15-20020a1c4b0f000000b003b47578405aso4531609wma.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Sep 2022 09:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8eAE9HpKpIVvmOEFXUeeAc8cv8ndkWqJta1h5pXlw4I=;
        b=tufo3FBpfspLm1JCj//EX5l1t5VWGzmwud803JQoI5J5duW+Ib2u7W2MZ1z8POfhwW
         0MvvE7lg/GxzeYrZGBWy/lvDMyWYnuzfsdB0F441MVimBi1AAAqfNEla6zkSQOg4NQfv
         crLIcLptbwhZasA4K7kK/zGAZKMHVvug08Du+OWKTsy3UmKsx7uwnVhJqeFAz6Nc5ChP
         4Z5LYN7mp3eHcrJqKvhaNR/M/3P5KHzOx9Ng5vbgS+k3AfgVz1cIRCntygMoHIrf8dqW
         w2iCTw7R8cjBNaudqZs8qk66lfARdBaUSyW+a2khkdwRd3uqsSZJuBkRkoRvPEynopYX
         mFmA==
X-Gm-Message-State: ACgBeo3r/QqnpyMKpd2RWJOT7kr+odNL8MItLDcXw9/RJM2yQpvviZ3T
        A1IS+t+X7tYmoX6i6YDeFaLMPFpON1ZnM4kH5X2FK+Va6AfI2JOt7DL5IrC075P5eypTjL7LNQZ
        m7TaixS3j0/S2J7JUzm3vVSBWhZZ23WFEGA==
X-Received: by 2002:adf:f211:0:b0:228:d6a4:3510 with SMTP id p17-20020adff211000000b00228d6a43510mr21648606wro.448.1663174741047;
        Wed, 14 Sep 2022 09:59:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4/hMrbSSVrICYCjqMv7OHktLT/ShhknRc4TABv3IGMoKgXGV5RhWzuT4s56YrRzLlwdjxauA==
X-Received: by 2002:adf:f211:0:b0:228:d6a4:3510 with SMTP id p17-20020adff211000000b00228d6a43510mr21648581wro.448.1663174740767;
        Wed, 14 Sep 2022 09:59:00 -0700 (PDT)
Received: from [172.16.38.152] ([185.122.133.20])
        by smtp.gmail.com with ESMTPSA id m23-20020a05600c3b1700b003b477532e66sm6954615wms.2.2022.09.14.09.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 09:58:59 -0700 (PDT)
Message-ID: <2b7693c4-b04e-425a-2f87-c4b12fa2f63b@redhat.com>
Date:   Wed, 14 Sep 2022 17:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [GIT PULL] Immutable backlight-detect-refactor branch between
 acpi, drm-* and pdx86
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        Lyude <lyude@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Xinhui <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        nouveau@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com>
 <20220914112933.64ovljgsrv2l25rs@penduick>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220914112933.64ovljgsrv2l25rs@penduick>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/14/22 12:29, Maxime Ripard wrote:
> Hi Hans,
> 
> On Mon, Sep 05, 2022 at 10:35:47AM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Now that all patches have been reviewed/acked here is an immutable backlight-detect-refactor
>> branch with 6.0-rc1 + the v5 patch-set, for merging into the relevant (acpi, drm-* and pdx86)
>> subsystems.
>>
>> Please pull this branch into the relevant subsystems.
>>
>> I will merge this into the review-hans branch of the pdx86 git tree today and
>> from there it will move to for-next once the builders have successfully build-tested
>> the merge.
> 
> I merged it into drm-misc-next, thanks!

Great, thank you!

Regards,

Hans

