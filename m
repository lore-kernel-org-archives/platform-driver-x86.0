Return-Path: <SRS0=i/bP=C7=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D7AC2D0E2
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 08:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47C5A2396D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 08:57:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b1ZKzN+J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIVI5l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Sep 2020 04:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56388 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726353AbgIVI5k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Sep 2020 04:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600765058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0oVV0fojO69JgJ5jRZtGVqDd85RbY/OL+2VLqFLwOgg=;
        b=b1ZKzN+JAgVjrNSp7YIJUrv9XngRsa4NL8vWfak0aDnHXTXvNHMooEkVu+WDvFEvtEsOTQ
        9YdrPVN9B/YmmFNnLTGH8ndCnafCJargrAKiFdq+/wjXqIJg8qV2ojIdnaPBRx2ouyOSvD
        VJcpQdzyoKxVcUJtrKX48WZoYLsM6JM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-g5p5Av6jPKW2a_6hbWOBvw-1; Tue, 22 Sep 2020 04:57:37 -0400
X-MC-Unique: g5p5Av6jPKW2a_6hbWOBvw-1
Received: by mail-ej1-f71.google.com with SMTP id hh10so5988924ejb.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2020 01:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0oVV0fojO69JgJ5jRZtGVqDd85RbY/OL+2VLqFLwOgg=;
        b=QIQpUkrMDf/xOxk0oZuUSN6/1liw5kc727XZ0PdEt3gzA8JNdWcuME3Zu3w1L/vJ9a
         gP8bDpZnxsuRTxxthHzKT+oQse77onhXK3/lnPMpYpx+qgRyA74uUGMmHlfL1mpPbWLX
         pa2W+m8LiofVxVcPsztBBPl0gY/43xwOhTUK8GrYW/lsgMNP9Jh058T8OBxRYjELr/GZ
         M5OfwtWea2gBUMMOjXxfEoiw4/AcJpILGP36DNsJCHsFcZpROQbPws9hC4sXLQbNwgVf
         sDqP6PS4ZrsmJjwdHUHRCUWKPONE+cRA5tcYLa8eo5x8vWxEA6710gYSHjgRtbknmolQ
         IxAQ==
X-Gm-Message-State: AOAM533X+tTUK4IIkTv7M6XI0miYtDBNW6s2bnk4Hx1lMJLlVWQDSEoo
        xejYpnt2Q7yr0ydtCjhByNiz1L6/5haeDKRNFTEAY37xwSO0dzLB4C0YcI4+o8Kb/sAlLDhQhAN
        yvP4/BY2mRkXgFmjRT4CD6IGbeErziKVb2g==
X-Received: by 2002:aa7:d648:: with SMTP id v8mr2894644edr.159.1600765055948;
        Tue, 22 Sep 2020 01:57:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuxQXjI9QlbRwMjIZdysB07FPwhUX4B5mTN4FFl5kOQFFOiWTxYH9zzy+6YvjGrinto7sYSg==
X-Received: by 2002:aa7:d648:: with SMTP id v8mr2894628edr.159.1600765055721;
        Tue, 22 Sep 2020 01:57:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id r10sm7407795ejb.99.2020.09.22.01.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 01:57:34 -0700 (PDT)
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>,
        Richard Hughes <rhughes@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com>
 <d3de1d27-25ac-be43-54d8-dcbfffa31e1d@redhat.com>
 <DM6PR19MB26364970D0981212E811E1B0FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <67ca316a-227f-80f6-ad22-7d08112b2584@redhat.com>
 <DM6PR19MB26368BB2B8C4D7CE58DF7C31FA230@DM6PR19MB2636.namprd19.prod.outlook.com>
 <5847917c-2c34-5d74-b5db-f33bb8fc9e13@redhat.com>
 <DM6PR19MB2636626A94385EDC7C0CACF9FA3E0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <33666ec6-be47-2c33-d4c5-6b23b53f6185@redhat.com>
 <DM6PR19MB263615C1060108E5661AE615FA3A0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <52fb287e-e683-63bc-3641-90abd78c605a@redhat.com>
Date:   Tue, 22 Sep 2020 10:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB263615C1060108E5661AE615FA3A0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/20 5:26 PM, Limonciello, Mario wrote:

<snip>

I will do another more detailed reply in another email, but I would like to focus
at the main pain point here, which is the using a generic sysfs-ABI/class vs using
a Dell specific sysfs-ABI.

>> I guess a could way to look at the generic sysfs firmware attributes
>> class I'm proposing is looking at it as a lowest common denominator
>> solution. With the addition of vendor specific extensions so that
>> vendors (e.g. Dell) are not limited to only offering functionality
>> offered by the generic, shared ABI. Does that make sense ?
>>
>> Regards,
>>
> 
> I really think that trying to fit all the vendors into the same interface is going
> to stifle areas for innovation in the firmware and kernel space in the name of
> "simplicity" which really only goes as far as the kernel side.  Userspace has
> to carry delta between vendors no matter what, so why introduce a LCD then?
> 
> Just as easily we could have:
> /sys/devices/platform/dell-wmi-sysman/attributes/
> 
> Which works 90% the same as:
> /sys/devices/platform/lenovo-wmi-sysman/attributes/

So the reason why I want a class interface for this is to allow say
FleetCommander to have a generic plugin implementing that 90%, so
no deps, only support plain admin-password authentication.

Allowing such a generic plugin requires 2 things:

1) Ensuring that the 90% overlapping functionality offers a 100%
identical userspace ABI, thus a shared sysfs ABI definition

2) That userspace has a generic way to enumerate devices/drivers
implementing this shared sysfs ABI, and we have a standard
mechanism for enumerating drivers which implement a standard ABI,
that is we make them register class devices under /sys/class/<abi-name>.

I have not heard any convincing arguments against why would
should not or can not have these 2 things. All I'm hearing is
a vague fear that this may "stifle areas for innovation in the firmware
and kernel space".

Honestly I have the feeling we are going in circles in this discussion
and I really do not understand why you are so dead set against having
a common sysfs ABI/class for this?

In part of the snipped text you write "Having to de-feature the sysfs
interface", but I have not asked you to remove any features anywhere in
this thread!

So I really do not understand where this fear of not being able to
implement certain, possibly Dell specific, features comes from?

You mentioned that the way the dependencies are expressed are
highly Dell specific, so I suggested allowing having vendor
extensions like dell-modifiers and dell-value_modifiers. The whole
idea behind allowing vendor-extensions is actually the exact
opposite of de-featuring the sysfs interface.

Regards,

Hans

