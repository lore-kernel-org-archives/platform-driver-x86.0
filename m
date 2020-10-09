Return-Path: <SRS0=ZlNf=DQ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49293C433E7
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 09:14:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6E4722276
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 09:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UT0ITUmg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731300AbgJIJOk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Oct 2020 05:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32493 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731262AbgJIJOk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Oct 2020 05:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602234878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U81ysvTg8CS8ZsDQA449UrRGS9FkuiIbR9x9WF/NIeI=;
        b=UT0ITUmglE91fOlkRJ3S5qu1/GhVdCTkkCoGA1fVljBI+wgnCO5ZepmMW7RgHV/RAPZEwq
        aptwNn9xLsDNzVwe/VhJktGk3+fuSvizIN3XwtqFufA1MrzrQvE4MIJ7hYZYwO4QOgy4jB
        5DjHMAsHCgPMeHsvvG54tdi4giU1yTM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-yS4rJgroNcaGbR2O5N5SyA-1; Fri, 09 Oct 2020 05:14:37 -0400
X-MC-Unique: yS4rJgroNcaGbR2O5N5SyA-1
Received: by mail-ed1-f69.google.com with SMTP id dc23so3341428edb.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2020 02:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U81ysvTg8CS8ZsDQA449UrRGS9FkuiIbR9x9WF/NIeI=;
        b=gx4VYinnvE4G75W+aY3VgCDjN8fTCQdiLURQzJz2mn0ZEcA2ulR41ychWaRspy84mI
         ckhd85i39PALa6wBS3lZvs6qXCO9ugSoL9MICOFzI0RD7fZYNnQ1wva/rbB8s8J0Xe8x
         FYeHIe15NQ26ZW53a/iZuGX/jEPtKc/6qgWQpaNXFePMhyEA5Hi9ioibjmvqkfGbqzp/
         BQ/p+9g5KpnoBfLjZ3tgLPkFOE84x3if+4tvd6cXvYxRxuhxQX54X2rA1UqRBE+s0y6d
         ddJ2JJgBHr7cabvqbauXe/XRSel9LpnYK+7suctLUMtfuUJ7geGDNsTkkk6G9rkuxz7D
         GJMQ==
X-Gm-Message-State: AOAM530BfJM54TRsVR/n9LklpXxAROHu+GxeuAyVeLZwJVRj2F9rr3tQ
        25OhgxOr0eRo1TK8xGyhgLQ4UOoX/FjZx27fPL7w+RBhIt5qLul+b3J7OyEjTStduNu0UUD/E0M
        1e3lGKGdNrRVVtGoq8ntVvtnwPYZCdd4sHg==
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr13810278edw.331.1602234875628;
        Fri, 09 Oct 2020 02:14:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzchW9wPK/X+nnyXRQCL6V2QdgQVq0Mc7+DG4eLxeuap4QNZpBwk3MAXAAcA8NsY+aC1PMZw==
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr13810261edw.331.1602234875385;
        Fri, 09 Oct 2020 02:14:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v2sm6092016ejh.57.2020.10.09.02.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 02:14:34 -0700 (PDT)
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
Cc:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
 <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <45e82b6dabb591de630ac0e91a3ebb7937245fb1.camel@malazdrewicz.com.ar>
 <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
 <6ff262dee7187939a3392005b121ceec424ab6d3.camel@malazdrewicz.com.ar>
 <20201009082658.mzzfqltg7xijm6fp@pali>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <209751e0-159c-9d10-91de-d77435e17c4a@redhat.com>
Date:   Fri, 9 Oct 2020 11:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009082658.mzzfqltg7xijm6fp@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/20 10:26 AM, Pali Rohár wrote:
> On Friday 09 October 2020 02:33:49 Gerardo Esteban Malazdrewicz wrote:
>> dell-laptop doesn't even load as is ('No such device')
>>
>> However, adding an entry in dell_device_table, based on dmidecode
>> output (Vendor: Alienware, Type: 10), allows it to load.
>>
>> But I don't know how to test for any of this additional functionality.
>>
>> What should I look for?
> 
> Hello! dell-laptop driver provides following features:
> 
> * rfkill interface for enabling/disabling wifi and bluetooth
>    - check presence of "*dell*" by /sbin/rfkill utility
> 
> * backlight interface for controlling display brightness
>    - check presence of "dell_backlight" in /sys/class/backlight/
> 
> * touchpad led (if your touchpad has some led)
>    - check presence of "dell-laptop::touchpad" in /sys/class/leds
> 
> * configuring keyboard backlight
>    - check presence of "dell::kbd_backlight" in /sys/class/leds
> 
> * led for microphone mute
>    - check presence of "platform::micmute" in /sys/class/leds

Thanks Pali, that is a great answer.

Note that the dell-wmi driver also depends on the
dell-smbios-base module, so you should also check if the
dell-wmi driver offers any additional functionality
on your laptop (if it does then that would also be a reason
to move forward with your dell-smbios-base patch).

Pali, can you perhaps make a similar feature list for
the dell-wmi driver ?

Regards,

Hans

