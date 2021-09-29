Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCF0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 10:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F4BF611C8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 10:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245473AbhI2K6U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Sep 2021 06:58:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51772 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245653AbhI2K6T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Sep 2021 06:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632912998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jQhNuv6JYkVrxGPhJfNkNlr6YYp39wG6EFTvOSVUEsk=;
        b=JspLKGwhdurTtQg5GiPg5D3UiWlDgrPWQ4YWtU88Zk95SNA1+A99s+/7EbagcAKSEGKno/
        Nw6cjlduEHzFm/Yl+V7d/chMWpceNCQQIdlvt54JutgYsNYjuQm9h/BiICzNtHTbZhn+Ia
        kT0MzHeT12v+py9AGWweU1GkBMdc7Ts=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-XyJA2cMoPZGlhWz6X61L5A-1; Wed, 29 Sep 2021 06:56:36 -0400
X-MC-Unique: XyJA2cMoPZGlhWz6X61L5A-1
Received: by mail-ed1-f71.google.com with SMTP id z62-20020a509e44000000b003da839b9821so1956721ede.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Sep 2021 03:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jQhNuv6JYkVrxGPhJfNkNlr6YYp39wG6EFTvOSVUEsk=;
        b=jIw/jRo7EiH8cQguxHLxOxW0SJ8HLk6Tn6HCB4T0RD4u/9igCIjWtKpKvire7iyyCl
         u88rheylpFO3s37BYVKPtKt3Bj+skL2qTWLthWOPCwjdDk6xNUfZjuhus1CUckcj9+G0
         /QziLFwVSR3Tbl1tneX83x5hiegNVLRLhNYi6VZNe+9LP/vCfNAwEScAeFOFheoUBXL/
         d5/9I/GqV7YeoZ1HKZ6eEN5Uw5CUfS5X1+aiUCaInyeMljrTqZ6l8M18OhvRvwVMkiXc
         XwWlZrQlt2VLVeK5jQSlImgsY5sFDxC9InfoFCGW9UvIcIwrXvx7Ux8XdDc57jH/94iE
         bEeg==
X-Gm-Message-State: AOAM533jzn0bpX9T6yy9jpkdzjVcv66g3Tql08yEOPWH+kKE0Eu7Xk8X
        4XZvLm6i4I/QKmpCJdMp5lnFN6r1DaSiLK365CqNylcrFMEM96xT1NAtQ/8hxeJykO5I6BRrn5s
        58WEMceziwXwbMtFix0htBpu3dhxqa4V61Q==
X-Received: by 2002:a50:d989:: with SMTP id w9mr14630939edj.99.1632912995294;
        Wed, 29 Sep 2021 03:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAfuQmy82plwwE2wZytZW+/pyoNsSa3ekre9ZY4ea/9dSHXIPplO3V/r16aPA1YyNf8t3TIw==
X-Received: by 2002:a50:d989:: with SMTP id w9mr14630924edj.99.1632912995084;
        Wed, 29 Sep 2021 03:56:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z8sm1181626ejd.94.2021.09.29.03.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 03:56:34 -0700 (PDT)
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Thomas Koch <linrunner@gmx.net>,
        =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Berg <bberg@redhat.com>
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
 <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
 <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
 <943fa4fb-273a-0a36-4919-26c05ae4a534@gmx.net>
 <0eeb17bd-59f7-075e-f789-3814cc9a0505@redhat.com>
 <a6c448f7-d0c5-2652-46df-590085b47bd1@gmx.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d486c621-2464-8763-553b-3543d0578b58@redhat.com>
Date:   Wed, 29 Sep 2021 12:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a6c448f7-d0c5-2652-46df-590085b47bd1@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/29/21 12:45 PM, Thomas Koch wrote:
> Hi Hans,
> 
> 
> On 29.09.21 11:55, Hans de Goede wrote:
> 
>> Hi,
> 
>>
> 
>> On 9/29/21 7:47 AM, Thomas Koch wrote:
> 
>>> Hi Hans,
> 
>>>
> 
>>> On 27.09.21 17:12, Hans de Goede wrote:
> 
>>>> Hi Nicolò,
> 
>>>>
> 
>>>> On 9/27/21 5:00 PM, Nicolò Piazzalunga wrote:
> 
>>>>> Hi,
> 
>>>>>
> 
>>>>> On 9/27/21 3:59 PM, Mark Pearson wrote:
> 
>>>>>> Do let me know if there are some important use cases for these so
> I can go back to the FW team and discuss supporting them properly.
> 
>>>>>
> 
>>>>> The important use cases are force discharge and inhibit charge.
> 
>>>>> These at present are dealt with using tpacpi-bat, which relies on
> (out of tree) acpi_call.
> 
>>>>> See also your previous reply.
> 
>>>>
> 
>>>> I can see how those can be useful in certain circumstances.
> 
>>>>
> 
>>>> I can also understand how Lenovo does not want these to be
> 
>>>> available by default everywhere.
> 
>>>>
> 
>>>> I think a good compromise would be to add a bool module option
> 
>>>> which defaults to false to enable these.
> 
>>>
> 
>>>  From the user perspective, I don't agree that this is a good
> 
>>> compromise. Users simply want to recalibrate their battery.
> 
>>
> 
>> But can't they already do this by just unplugging the AC and
> 
>> then let the machine die ?Of course, but who wants that?
> 
>> How is this different, does it somehow magically flicks on the
> 
>> AC just before the battery deep-discharge protection kicks in
> 
>> so no unsaved work is lost ?
> 
> But this is exactly how it works. There is no risk of data loss.
> 
> 
> 
> The EC resets the force_discharge flag at the end of the discharge and
> the ThinkPad is seamlessly switched back to AC power. Just magical. No
> power interruptions.

Interesting. So what I get from this is that we really only want
force_discharge support. At least that is the major one. So maybe
we should focus on just that one.

Anyways lets wait and see what Mark has to say about this. As
I mentioned before doing battery calibration certainly is something
which is desirable to do under Windows too, so perhaps this option
is actually fine and it was the other 2 which are more
"testing only" firmware features.

Regards,

Hans

