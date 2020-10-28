Return-Path: <SRS0=JE7e=ED=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A707C4363A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:20:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9346C206D9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pljalvws"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732154AbgJ1WUT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31986 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732140AbgJ1WUS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 18:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603923616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4vTgWgNrSBbzQVpHc5QfEZsKPUZjexFRfHa0iKoJ/18=;
        b=PljalvwsPPC7RVSGVszNSylC68mUsut4WVFXsTZr9Qxr4LzIJPKeT8wGWm+dLmHFJ86O3A
        tpi900H204vlw8N0iGAsYPn00GxgPELDwzz3fAt2BDgZwd6mZm4sVXTIRKDQHwC1E86vGj
        h5wJMiSC1M34M8h0ayHXvS7MhWSiD/Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-e9NTQs8fO76Ml78KUaz3-A-1; Wed, 28 Oct 2020 13:18:08 -0400
X-MC-Unique: e9NTQs8fO76Ml78KUaz3-A-1
Received: by mail-ej1-f69.google.com with SMTP id z18so116370eji.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 10:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4vTgWgNrSBbzQVpHc5QfEZsKPUZjexFRfHa0iKoJ/18=;
        b=rocvu77FeqTJpsIEycFs79iORBGdw77zCOkCvbIhZUUqjbsPLhEldHM2yRkTvGcevv
         YE8j0BaKyyWgt6vFNuQaUg5Y9TMa84HMZjz9oTAnKkB5qEADtZBWJ1VFSkxe+EO8Ux2M
         XX0zwzaK2ONR53bJS5VSMonTFzkiAvqq1V8vUQM3qRms/6jPMQ6xccLozXD3oJ4vZtr1
         iC72Mj9I9Ywriqnv8Iyz/pN8vk0abjOje4YWTkD+Gx799AaJtqCqng2xAiDDashOYrGy
         KZnESospK9uaUKIY1ImQOfWOOxPnEzlE/A+qgc91TAdy8O3icfWee0jnCwLzAeVIikw9
         sZQw==
X-Gm-Message-State: AOAM530AxnnyBHQ/DjHffC3e1ZR6JZFVK6eCRrXwKKMaJjXh0kA0fbMb
        PjB1T0KryIK/hh8Sqy+Y19AKctsJXQgocv67X9qgAsWiGol8ppJijTH6Kc+Lj3lrw+fzM45HDZf
        wd26WTUqXEBpGr7zHS8sQg+yrBWW+jogZzg==
X-Received: by 2002:aa7:c351:: with SMTP id j17mr8706000edr.70.1603905487050;
        Wed, 28 Oct 2020 10:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1dIBlrJ+FSDMGHJhmbAO0c+88EblN2HjpY49it0MJRhpPsOBM4Mm3k2M8/IzcbvJnVFxpJw==
X-Received: by 2002:aa7:c351:: with SMTP id j17mr8705974edr.70.1603905486823;
        Wed, 28 Oct 2020 10:18:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id k25sm87634ejz.93.2020.10.28.10.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 10:18:06 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Add AMD platform support for
 S2Idle
To:     Shyam Sundar S K <ssundark@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com
References: <20201023080410.458629-1-Shyam-sundar.S-k@amd.com>
 <9c38b017-edec-9c1b-3dfc-18a6a2000998@redhat.com>
 <afe22192-b9c3-5562-fc30-fbc6c90e655d@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5d997a4e-faa3-1321-7360-9807bec56ada@redhat.com>
Date:   Wed, 28 Oct 2020 18:18:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <afe22192-b9c3-5562-fc30-fbc6c90e655d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/28/20 4:54 PM, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 10/28/2020 5:48 PM, Hans de Goede wrote:
>> [CAUTION: External Email]
>>
>> Hi,
>>
>> On 10/23/20 10:04 AM, Shyam Sundar S K wrote:
>>> AMD Power Management Controller driver aka. amd-pmc driver is the
>>> controller which is meant for final S2Idle transaction that goes to the
>>> PMFW running on the AMD SMU (System Management Unit) responsible for
>>> tuning of the VDD.
>>>
>>> Once all the monitored list or the idle constraints are met, this driver
>>> would go and set the OS_HINT (meaning all the devices have reached to
>>> their lowest state possible) via the SMU mailboxes.
>>>
>>> This driver would also provide some debug capabilities via debugfs.
>>>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Thank you for your patch, I have various review remarks, see my
>> comments inline.
> 
> Adding Alex..
> 
> Thank you Hans for the feedback. I have sent a v2, can you please review it.

It looks like something went wrong with the sending of the v2, I do not
see it in my inbox, nor is it in patchwork:

https://patchwork.kernel.org/project/platform-driver-x86/list/

Regards,

Hans

