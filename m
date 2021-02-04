Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69DBC433E6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:25:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F64F64F51
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbhBDMZC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 07:25:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31872 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235804AbhBDMZA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 07:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612441414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BeSSIOS7cBMigriYY4n5KmzUEy2/GtEhvhB5kXzs7ig=;
        b=Zr4ySQcTAGimRYTdYhkNZ4TuJ+pmkfAw1VvVlonEZBMpR5ug3OhfH43g+udb82a3m7g+KB
        geAsVBBwWi1CL+nEkJRtzo3rPjy1a/0bCF6NbEBW2AfniDO/h5GKteT3p0nf5i4vECT6y5
        etFiZw7C/Isv30F5gmVVC9gnS7GMuco=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-B6ss35HOMnmaYHl7O6QtpQ-1; Thu, 04 Feb 2021 07:23:32 -0500
X-MC-Unique: B6ss35HOMnmaYHl7O6QtpQ-1
Received: by mail-ed1-f72.google.com with SMTP id m18so2693675edp.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 04:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BeSSIOS7cBMigriYY4n5KmzUEy2/GtEhvhB5kXzs7ig=;
        b=NVbiGp/TLY329rn3eSsdKcCKXGqO3bTyyijqlx3OFzUCro16rh6bhld1HWOFrApIyL
         0welcDBn+t0DSdI33gLTaVBsBfCrSU7JqlEOcXvm1yqNIC10Hor4wOspZWACiqH92p4F
         eJVVzDNwTVYBIb5pFgH/6fmxK20YLNMiqSfsbktlVnpie3KdMUDe65YXQM7Jvu120nT0
         yU2WeHzdB3M7xJ2Ut+34rVNRl+y86j9oxAQiDuLnJ1dXH3b93TxnMVjY/6gq83W8Y4gH
         /3n3GK3gx/aWSTImcrJFhGR7DB4ZJ7bQcTn12br6OUI/d4dGje6GIKxQMdEcnxGVZ8Md
         CUlg==
X-Gm-Message-State: AOAM533289GhKqswHaRBFNlwBrWd7PAuo/HLt6MMqLM88xMRIn/X2eHT
        H5vQzOKi/2HzgHOIruSF63t7U2UzidI6d4+5jlBfFRPsU4GEs4qi4VXtqEdxldO66bXrxoaAzLL
        n0AIGeMOaaQv4E+Yzqyy+ec72ZKsyU7nEAg==
X-Received: by 2002:a05:6402:149:: with SMTP id s9mr7662979edu.247.1612441411541;
        Thu, 04 Feb 2021 04:23:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPUQE6OrGiI1DvkSd8Yid1xkLBYAXPVSlpvh6eZlZhdCs1SWedazafz83P8biG3h2CBv0rbw==
X-Received: by 2002:a05:6402:149:: with SMTP id s9mr7662970edu.247.1612441411363;
        Thu, 04 Feb 2021 04:23:31 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id b2sm2131777edk.11.2021.02.04.04.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 04:23:30 -0800 (PST)
Subject: Re: [PATCH v3 12/29] platform/x86: ideapad-laptop: check return value
 of debugfs_create_dir() for errors
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210203215403.290792-13-pobrn@protonmail.com>
 <acc8d35b-eea6-8fad-0d7a-ad9c189a51ad@redhat.com>
 <Kog39xrpk9OIMkLGBlNe3Mf8KAoDROuMIZA9BX9O2QPzHo3ihHKJIIEip1jNoJ79tGmZRHhbWV4q2VaDqnwYqVzUJI1KDL3huO34ubJPB5o=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c15dd64-42bb-1d30-6021-7a9d9f3a78c6@redhat.com>
Date:   Thu, 4 Feb 2021 13:23:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <Kog39xrpk9OIMkLGBlNe3Mf8KAoDROuMIZA9BX9O2QPzHo3ihHKJIIEip1jNoJ79tGmZRHhbWV4q2VaDqnwYqVzUJI1KDL3huO34ubJPB5o=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/21 1:21 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. február 4., csütörtök 9:12 keltezéssel, Hans de Goede írta:
> 
>> Hi Barnabás,
>>
>> On 2/3/21 10:55 PM, Barnabás Pőcze wrote:
>>
>>> debugfs_create_dir() may return an ERR_PTR(),
>>> add a check to ideapad_debugfs_init() that
>>> handles the case when that occurs.
>>
>> debugfs functions should not be error-checked:
>>
>> 1.  They are for debugging so if they don't work it is not an issue
>>     (note your own error handling also just returns without propagating
>>     the error).
>>
>> 2.  Subsequent debugfs calls taking the ERR-PTR will detect this and
>>     turn into no-op-s
>> [...]
> 
> My idea was to prevent the ERR_PTR() from being passed to
> debugfs_create_file() because I was not aware that it checked
> for that, so thanks for catching it!

I understand, debugfs functions are special, because normally
error checking return values is encouraged, but with debugfs
functions there is an (unwritten?) rule that they should not be
error checked.

Regards,

Hans

