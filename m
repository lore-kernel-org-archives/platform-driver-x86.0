Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53292C432BE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Aug 2021 09:58:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CDDC601FF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Aug 2021 09:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhH2J6x (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Aug 2021 05:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56199 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234954AbhH2J6w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Aug 2021 05:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630231080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0K+G7pfYO0Ef+fomYcLnNjeeXSOSFqS366JUpbEaV6U=;
        b=LBqnn98YF9kyP7Sclto9B/vZxdMI35uF/O5yY/wL0dBltKLf7rcoCjzVmtrCF0EC+2SQSz
        Pn2zlPp1E2nPNzaN53/inYK2489jHeDQsZkCvob574oUV/XLAZ3jpbMs8eMAfGMt16LUJl
        wai0K9IJAbo82kxVkI9QGpcSf9pIuhc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-IS-GL5GuM7eQNwwrZ47S-w-1; Sun, 29 Aug 2021 05:57:58 -0400
X-MC-Unique: IS-GL5GuM7eQNwwrZ47S-w-1
Received: by mail-ej1-f71.google.com with SMTP id o7-20020a170906288700b005bb05cb6e25so4428058ejd.23
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Aug 2021 02:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0K+G7pfYO0Ef+fomYcLnNjeeXSOSFqS366JUpbEaV6U=;
        b=uFpFSOheX/UGwFuuyQYFA7kHvTXwk6l8pg2QodQzbbadU0iVczd73dNeQzdU2YSzcF
         Z6M4fvWJaEV9Bst//JAxEg1V7VioVtTRNkHAEx0lWDj2nAqGSjCeEdCEm7MZk/TaB44g
         kA3oBd8lyeGgJRd5JqzRr1Fyr6S/AfeY27zxRfH1aKf/Jg86nXALztainkKjAJr5bsVL
         Kxj+EEUCEGbNJmBotQeY+pPNZA3i/jpgEB+4PMiYZLEKI6OfMYv5tQSoiojLX08eC5cl
         MYsbrlzgpYhy4nd6qSFqi85FVfoIefQmbJr3jXj1LrtORzPicxt9/rvPT9M1DzWFbn6L
         BWew==
X-Gm-Message-State: AOAM5337FTadCHh3ycZvBag2hcjmdY+pjg0r4jNEPjw/RZCh5qO6Qni2
        c+IPdM7E9m9y0IYqSL6DBzTyKuOCdTywvWi0pocLi1CY1D1DkOLZOkGPA3VKU6UUgadERvlOlFP
        YthTu+NLiArDBkiMDKuRBxH1AK/RAGqlpuUv8Qb19HZwY0w9tK/F4QqYsKHR3hY0y8nOGgMyZl3
        CaPZRXtHtMYA==
X-Received: by 2002:a05:6402:215:: with SMTP id t21mr18767573edv.68.1630231077226;
        Sun, 29 Aug 2021 02:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVWp8z2OSwJE2Z5L5H11RpYQbR14sREThd8a94tP6IStunw69DzeSddSDgABlBKEp9fnnxCg==
X-Received: by 2002:a05:6402:215:: with SMTP id t21mr18767565edv.68.1630231077055;
        Sun, 29 Aug 2021 02:57:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y20sm3177621eje.113.2021.08.29.02.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 02:57:56 -0700 (PDT)
Subject: Re: [PATCH v6 0/1] asus-wmi: Add support for custom fan curves
To:     "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc:     pobrn@protonmail.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org
References: <20210829071402.576380-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cf42ddd7-29ed-ff8b-7d03-958187863b70@redhat.com>
Date:   Sun, 29 Aug 2021 11:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210829071402.576380-1-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Luke,

On 8/29/21 9:14 AM, Luke D. Jones wrote:
> Add support for custom fan curves found on some ASUS ROG laptops.
> 
> - V1
>   + Initial patch work
> - V2
>   + Don't fail and remove wmi driver if error from
>     asus_wmi_evaluate_method_buf() if error is -ENODEV
> - V3
>   + Store the "default" fan curves
>   + Call throttle_thermal_policy_write() if a curve is erased to ensure
>     that the factory default for a profile is applied again
> - V4
>   + Do not apply default curves by default. Testers have found that the
>     default curves don't quite match actual no-curve behaviours
>   + Add method to enable/disable curves for each profile
> - V5
>   + Remove an unrequired function left over from previous iterations
>   + Ensure default curves are applied if user writes " " to a curve path
>   + Rename "active_fan_curve_profiles" to "enabled_fan_curve_profiles" to
>     better reflect the behavious of this setting
>   + Move throttle_thermal_policy_write_*pu_curves() and rename to
>     fan_curve_*pu_write()
>   + Merge fan_curve_check_valid() and fan_curve_write()
>   + Remove some leftover debug statements
> - V6
>   + Refactor data structs to store  array or u8 instead of strings.
>     This affects the entire patch except the enabled_fan_curves block
>   + Use sysfs_match_string in enabled_fan_curve block
>   + Add some extra comments to describe things
>   + Allow some variation in how fan curve input can be formatted
>   + Use SENSOR_DEVICE_ATTR_2_RW() to reduce the amount of lines per
>     fan+profile combo drastically

Thank you for your continued work on this. I read in the discussin of v5
that you discussed using the standard auto_point#_pwm, auto_point#_temp
pairs. I see here that you have decided to not go that route, may I ask
why ?

Regards,

Hans

