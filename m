Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA78C433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 10:59:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 038B364E42
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 10:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbhBCK7i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 05:59:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24983 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233575AbhBCK7h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 05:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612349890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LViKl+WPV2coHi94yA6LZO+UImnRCiUbgygPdrV5LrU=;
        b=fBBhg4qA7ICoFZtsOdXa93SIhtto09S2McxuX4a/q9Zt5t+nSiJYusOU/iMq57ZKjo1Kbv
        bsizcESPng3gsbZOVrCAorzeVAxUQUvEqWQgcmuvxPlf52HXg/ZJi/ZD7I3+IYgli5iyrT
        f1LvNtQSLWjby79AU002tit4z4yOt9k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-DFv5g4E_NR-KVV_9UqV8OA-1; Wed, 03 Feb 2021 05:58:08 -0500
X-MC-Unique: DFv5g4E_NR-KVV_9UqV8OA-1
Received: by mail-ed1-f70.google.com with SMTP id ay16so2346474edb.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 02:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LViKl+WPV2coHi94yA6LZO+UImnRCiUbgygPdrV5LrU=;
        b=udHzk7VFRz5P5w7rpUoBQQF/qmJFIKHiL+8+LvUWERttNn5/k/KFAQruZsdv4YVL6G
         BUoftox84IqySdFGMSdRW/uvDN0ysHkXRU51M60eZcGt/Um79qpKbBLy6OhcHUiLzZXA
         QluMW8a35kdb204aZ7eF7O+7C5LwUi4VKtRtWcH+2c08BddrdDJTBxEdVJLhpKXd8bMJ
         NPZSFBZHRWn5bjKGEUXn7fjzewnDQn/4zlzYJX4i2jdjtlag8TkVgahusAR+s1fi7msg
         L3PhwQiwir0SNfcj5pU8Etm11dMpzLcrDq+K3BFzkklatUiI2IgCf03s5X3mZSLnE5/d
         tQ7A==
X-Gm-Message-State: AOAM5308AZxncobphsHkcY3vGORGg2PC9g6leX97n/k3++nuNbr9XBGY
        FR1e0B3BXD7p7OqharbupGotmALynDlxt+fVROZZ79JzUOyQtRriunvCMy3Ytl1tz4EDRV5b2Zk
        PKDQR/VLs6086EoXZ+R7QTV/CLuZ+mnZueQ==
X-Received: by 2002:a05:6402:309c:: with SMTP id de28mr1520663edb.96.1612349887447;
        Wed, 03 Feb 2021 02:58:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyisjQrXzaOCWYFyvl4Srsyq7bFbBoBKWvnb+JesPslMeIz++kNx8FsrzPGEaCT5EBdsyK3mw==
X-Received: by 2002:a05:6402:309c:: with SMTP id de28mr1520654edb.96.1612349887301;
        Wed, 03 Feb 2021 02:58:07 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id k4sm846965eji.82.2021.02.03.02.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:58:06 -0800 (PST)
Subject: Re: [PATCH] platform/x86: pmt: Make PMT Kconfig options depend on
 INTEL_PMT_CLASS
To:     david.e.box@linux.intel.com, Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210126202042.95301-1-hdegoede@redhat.com>
 <c7099bece001aa0803c8357a44b114d2d26e94e4.camel@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c91d456c-8803-88b7-aa37-f094ce939889@redhat.com>
Date:   Wed, 3 Feb 2021 11:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <c7099bece001aa0803c8357a44b114d2d26e94e4.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/21 11:00 PM, David E. Box wrote:
> Hi Hans,
> 
> Sorry for missing the discussion on this. Need to fix my mail
> filtering. I just submitted patches that instead make INTEL_PMT_CLASS
> non-user-selectable, leaving the other dependencies in place. Having
> the class driver user-selectable was a mistake.
> 
> I also did go ahead and add a dependancy on the MFD driver since all
> current PMT features are only exposed through this driver. So users
> will only see the following options:
> 
> MFD_INTEL_PMT
> 	INTEL_PMT_TELEMETRY (selects INTEL_PMT_CLASS)
> 	INTEL_PMT_CRASHLOG (selects INTEL_PMT_CLASS)

Ok, your version looks good, so I will merge it instead of my
version.

Regards,

Hans



> 
> David
> 
> On Tue, 2021-01-26 at 21:20 +0100, Hans de Goede wrote:
>> Make the PMT Kconfig options depend on INTEL_PMT_CLASS instead of
>> selecting it. Select should only be used with hidden options and
>> INTEL_PMT_CLASS is not hidden.
>>
>> This will stop Kconfig from asking if INTEL_PMT_TELEMETRY and
>> INTEL_PMT_CRASHLOG should be enabled after the user says no
>> to the INTEL_PMT_CLASS prompt.
>>
>> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>> Cc: David E. Box <david.e.box@linux.intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/Kconfig
>> b/drivers/platform/x86/Kconfig
>> index 9a73e7baa344..d4f32fc0e40e 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1383,7 +1383,7 @@ config INTEL_PMT_CLASS
>>  
>>  config INTEL_PMT_TELEMETRY
>>         tristate "Intel Platform Monitoring Technology (PMT)
>> Telemetry driver"
>> -       select INTEL_PMT_CLASS
>> +       depends on INTEL_PMT_CLASS
>>         help
>>           The Intel Platform Monitory Technology (PMT) Telemetry
>> driver provides
>>           access to hardware telemetry metrics on devices that
>> support the
>> @@ -1394,7 +1394,7 @@ config INTEL_PMT_TELEMETRY
>>  
>>  config INTEL_PMT_CRASHLOG
>>         tristate "Intel Platform Monitoring Technology (PMT) Crashlog
>> driver"
>> -       select INTEL_PMT_CLASS
>> +       depends on INTEL_PMT_CLASS
>>         help
>>           The Intel Platform Monitoring Technology (PMT) crashlog
>> driver provides
>>           access to hardware crashlog capabilities on devices that
>> support the
> 
> 

