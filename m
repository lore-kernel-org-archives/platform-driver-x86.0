Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5896C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88B9C21582
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d+ogQty/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgIQNwy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39343 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727041AbgIQNvu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600350689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3qB5BXc10sehLv/jZwK+gvBmYi8ElTtxaWoNGNhhrbQ=;
        b=d+ogQty/w0I/xBtxzjRarPVq5QNN1EgSTvTaxnWxNMSraUNToL23Cmu2lO7J9zJFeGpemk
        7eKthoe9TColJ4QFj3VMOeuTtom//yOOxC+a/hoax0U1iJqO9CCUeK2iWXNJG9Gdk4ixJh
        2xiTezOwEGUzJJJzhP/5ZlNIiRtKFmE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-qBBA4evfO0u9-jVeYrf-Zg-1; Thu, 17 Sep 2020 09:51:26 -0400
X-MC-Unique: qBBA4evfO0u9-jVeYrf-Zg-1
Received: by mail-ej1-f71.google.com with SMTP id lx11so903887ejb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 06:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3qB5BXc10sehLv/jZwK+gvBmYi8ElTtxaWoNGNhhrbQ=;
        b=uDUHsSUVuxt3OPpECUmcWcL6nER2ZU0T2o/AjLk7ImdibyMkPP07tr2F6nDwVsnJlt
         IEaswOKdOGLaID3PtgJWYpwTUZFErTyKJJI3l9E85SifeQt9ZTU/GPuzv9OBlIlYfVbS
         5TXQzAqf9fU0cixHiCStwj9d78mkYvLBoCPvJxr1pKiysGFTL1u2VRvILqnEARzDmREE
         ud3wibhzw1FP7kCvzyo1TNoSppFUtKK+sf2DTVsJKA/6xdX9yHQHx9ShuLghcUKxYnpF
         jQQdD9mI1CYZY5k9xDLAWFWWPg+9eS+G4+RPiReAg+NaIxpTplADd4z0UGOdbLKcUkyc
         vF1g==
X-Gm-Message-State: AOAM530xtJ5yiPsLfkalhduw42owNZrS6a3HwRFInWaFT8mFuU0oecrP
        zav7znxB5QK0JOoEOqC7pj6p9SPhv5hBnfUj/ABv6aNV4jJhbp41ChzGZszSpvO/87q+rxKZHuz
        ZZXEX+iH8+gVL4tJThDhRfcg4/e76a4aM4Q==
X-Received: by 2002:a17:906:c113:: with SMTP id do19mr30068348ejc.219.1600350685434;
        Thu, 17 Sep 2020 06:51:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl33lb3PVjQB45fxl2qpgJAdsd3tScNyC6eVHXHVX4H+sBsqpfaSdQUqMXSE52RNIGuyShHA==
X-Received: by 2002:a17:906:c113:: with SMTP id do19mr30068326ejc.219.1600350685200;
        Thu, 17 Sep 2020 06:51:25 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id f17sm16700988eds.45.2020.09.17.06.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 06:51:24 -0700 (PDT)
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
To:     Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <jQoirRukXGYClb58QQWmL6rQ6usxi_hKzPRYe2tlEyjXG-hEVxwzECgEXFxzyMRG2sEnxwdKNvmWzEV4oZcaJ4MM5RrgFtBdin8yxH4cAYs=@protonmail.com>
 <3748b6be-cd8b-19e6-eb36-c5f94850d764@redhat.com>
 <085164663786cefb3159549cf4909658872e2795.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4622581d-2c89-f7b6-55af-aee253638cb6@redhat.com>
Date:   Thu, 17 Sep 2020 15:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <085164663786cefb3159549cf4909658872e2795.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 3:28 PM, Bastien Nocera wrote:
> On Thu, 2020-09-17 at 15:24 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9/17/20 3:02 PM, Barnabás Pőcze wrote:
>>> Hi
>>>
>>>
>>> 2020. szeptember 17., csütörtök 13:22 keltezéssel, Hans de Goede
>>> írta:
>>>
>>>> [...]
>>>> I guess we should also add an optional lap_mode sysfs attribute
>>>> to the class-device, to have all the info for the Thinkpads in
>>>> one place.
>>>> [...]
>>>
>>>
>>> Excuse my ignorance, but why does "lap_mode" need to be here?
>>> I understand the implications of it regarding performance, but
>>> I think it would be more sense to export it via the hwmon (or
>>> something similar) subsystem? What am I missing?
>>
>> Well hwmon has very clearly defined sensor types, like voltage,
>> fan-speed and temperature. lap_mode does not match any of them.
>>
>> Also registering another-type class device just for the lap_mode
>> boolean seems overkill, esp. since lap_mode is inherently coupled
>> to the performance-profile stuff.
> 
> There's proximity sensors in the IIO subsystem which this could use

But this is not a proximity sensor, it is a state determined by
the firmware based on several data sources, which may or may not
include a proximity sensor and which may or may not include an
accelerometer + who knows what else.

But with the earlier discussed splitting of the value
sysfs-attr into a configure_value (rw) and actual_value(ro)
attributes I don't think we need lap_mode inside the
system_performance_profile class at all. We already have
a thinkpad_acpi specific sysfs attribute exporting this, and
since this is AFAIK a thinkpad specific thing, just leaving
it there is probably the best solution.

Regards,

Hans

