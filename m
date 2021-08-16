Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02762C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 10:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBDB661AA3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 10:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhHPKev (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 06:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60051 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230118AbhHPKeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 06:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629110050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o56kFl5Q5JRPj00nvRvdyzY+Pmj2K5yYLBsvpdrfXvw=;
        b=H6UJRbi9U4ZRRhsYtr0Y6DaSflieOZwWoVlGP3VCXTc2vMWSZg7/t3lSW5AYIP4fFsqXow
        ORXzLvh6H62IKTu4kWNlvyoPAWCVTS2QOHeQg+HfMFpoDJf2UFfZzwvkKm0L/mCKuujMbB
        cNQ6VtUEjSEltfo9NQzvOt6JJTrlpvQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-Q7q6MeQVOzeBl13tFPxJFw-1; Mon, 16 Aug 2021 06:34:09 -0400
X-MC-Unique: Q7q6MeQVOzeBl13tFPxJFw-1
Received: by mail-ed1-f69.google.com with SMTP id y39-20020a50bb2a0000b02903bc05daccbaso8630288ede.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Aug 2021 03:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o56kFl5Q5JRPj00nvRvdyzY+Pmj2K5yYLBsvpdrfXvw=;
        b=jd2t3yHKTKRietHearMwI1igTylohypDFFu6K8dwCT8gtmswtEGbVjiwTxZvmUCDbb
         /oapcKuv0G7exg9FRO1w4h5twGtE3vbV6NSxQ9y32aHtVpGzkEeSMdrX+0fISyVDrxEi
         yeQ6WoRl9/tc0GnD7jlqb4pzBzBWz7zfxfwdqsqJqRdeU5ybFkRhMsom0FvgkfgLMMpB
         lwkfE7CHjlb2JPcUOUXme51rhhJxaS+r1xbl4WZ5NOgaBPfEQJg9l5de+zMdGYKl2JlC
         CVuRfZVi1FN+ahZqlDLpI83jrKuk7sDRTWXmlLK9H8+/KHeM/ipExMhy0XirYPwch9wT
         mehg==
X-Gm-Message-State: AOAM530VqU+MnrSMoW1wOT88RbzJO3HiItt8TsZOTSCD4qX7lY3phUrd
        XJm2rx1uZPLrQ7Sl3M6/sSQdSkqmo7C1SysFtEvHJ8BUxJg0e6UqJ6HWATIPgHueZ0FPPsGyAoL
        ilL+1Dmw248hrh3FpaStGK/oXUGaEf2G0bQ==
X-Received: by 2002:a17:906:4c8c:: with SMTP id q12mr15471553eju.254.1629110047819;
        Mon, 16 Aug 2021 03:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6IwEDCl7PI2ndYdWGeb/zTJgMPtufIMxffeaVGBWYu8pAxTCTS/9YLBFhzdYlw1He9oe73A==
X-Received: by 2002:a17:906:4c8c:: with SMTP id q12mr15471541eju.254.1629110047668;
        Mon, 16 Aug 2021 03:34:07 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id r16sm4621263edt.15.2021.08.16.03.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 03:34:07 -0700 (PDT)
Subject: Re: Dell laptop function keys stopped working between 5.10.46 and
 5.13.9
To:     Paul Menzel <pmenzel@molgen.mpg.de>, Dell.Client.Kernel@dell.com,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <b8ff8f68-4d5a-7ec6-4c4f-9f5be6e70ab5@molgen.mpg.de>
 <1d4ce7d6-3213-45af-0467-7548f69b7d9e@molgen.mpg.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7857ead5-6ccf-3290-9e86-4f16d2bf360f@redhat.com>
Date:   Mon, 16 Aug 2021 12:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1d4ce7d6-3213-45af-0467-7548f69b7d9e@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/16/21 12:22 PM, Paul Menzel wrote:
> [attach Linux 5.13.9 messages (output of `dmesg`)]

Does "lsmod" output include any Dell modules like dell-laptop or
dell-wmi ?

How about on the 5.10 kernel?  It looks like the 5.13 kernel simply
does not have these modules enabled / loaded.

Regards,

Hans


> 
> Am 16.08.21 um 11:48 schrieb Paul Menzel:
>> Dear Linux folks,
>>
>>
>> On a Dell Latitude E7250, updating Linux from 5.10.46 to 5.13.9 (Debian sid/unstable) the two function keys to (un-)mute the microphone, and enable/disable Wifi stopped working. The other function keys continue to work. The `evtest` output did not change.
>>
>>      Linux version 5.10.0-8-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4 (2021-08-03)
>>
>>      Event: time 1629104514.184947, type 4 (EV_MSC), code 4 (MSC_SCAN), value 88
>>      Event: time 1629104514.184947, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 2
>>
>>      Linux version 5.13.0-trunk-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.13.9-1~exp2 (2021-08-10)
>>
>>      Event: time 1629103829.341409, type 4 (EV_MSC), code 4 (MSC_SCAN), value 88
>>      Event: time 1629103829.341409, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 2
>>
>> The output of `acpi_listen` also did not change.
>>
>>      $ acpi_listen
>>       9DBB5994-A997- 000000d0 00000000
>>
>> Are you aware of such reports?
>>
>>
>> Kind regards,
>>
>> Paul

