Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F38C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C3C321D7B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XatjFtFu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgIQSiL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 14:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55222 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728813AbgIQREM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 13:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600362244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mo49iux0KBOJNyEg1sB0oZX7FG2AuUtx0elyNCBdrzA=;
        b=XatjFtFunBpX5nHJ/qWS1RXkHy+KoLZEmxlI1//Jf0OAFHg5pve7XVJ0nsnOCFaNEW07QB
        N/nS+YpCNTH6JFqep2voDkDDKkUio4NSFI8jadS0JMsMj6y4bVHWrWvAjEeUJtFc8xe8rs
        4eXcu9KYcwx5w45+8HaEyXPk9ZphMLI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-ZpQ7rwq5M-CTQU7acTd3eg-1; Thu, 17 Sep 2020 13:04:02 -0400
X-MC-Unique: ZpQ7rwq5M-CTQU7acTd3eg-1
Received: by mail-ed1-f71.google.com with SMTP id y21so1144735edu.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 10:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mo49iux0KBOJNyEg1sB0oZX7FG2AuUtx0elyNCBdrzA=;
        b=iix8RPdayHodwRSHLvY6uh99fsfBu/ewMOzQ4YN4/5apPQsEoDb2f3la4es/xs6L0i
         X1ilt8VfFhhXOxa+p9Y7NIylWhiFV8mRBlLzIUf66b5nZX/PcLNrlDKJCsl4CwokFcYJ
         8A221hXI5C6k+OicXhary1B2e+l9sjlRw1PkWqwoL4tmaG1LciyOWiWy1UC5kN3fUSVU
         zInUVoxTHhTHOBMydsODrh4VixZ+FruWxoZq9GE2pSDLCpDcd6K2HhUFwUXZbIV/6sy2
         zTttzbGrGlipqgRt4kiFbqYGJ7YUfElC3UqiJaf5WYqSaO54FAPk9jcwkzWIwKFXAnMC
         iNiQ==
X-Gm-Message-State: AOAM533COCzQy19hPtq4q1Cj1jfWhuS4yLaUXIwFRXAj08oOLMTx3ZTs
        mwyfMjrplKGgLHR1jzTqCbI3wvtkAuAfOcnC+/OGLG+VVx+nMgrpgPBFscZyXd4P2vqxRbidqlN
        ccvkAcAhkOKb+LjTixybqz8MZqNI+fRgKnA==
X-Received: by 2002:a17:906:d8cd:: with SMTP id re13mr30971904ejb.140.1600362241250;
        Thu, 17 Sep 2020 10:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT0PFGda9Ys+RuqWIlUUZyTRPQujRpsr8XNPsbBgbmtuKgypT8v8dzNJxfQaahVkcX83egPw==
X-Received: by 2002:a17:906:d8cd:: with SMTP id re13mr30971872ejb.140.1600362241026;
        Thu, 17 Sep 2020 10:04:01 -0700 (PDT)
Received: from x1.localdomain ([109.37.143.101])
        by smtp.gmail.com with ESMTPSA id q12sm209774edj.19.2020.09.17.10.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 10:04:00 -0700 (PDT)
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Mark Pearson <markpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
 <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
 <9f01ce60a6b3319855f6a26b94af3e5fc6d2595e.camel@redhat.com>
 <6e0409e7-5bc2-4ca6-a0aa-725a9a91aa8d@redhat.com>
 <83694d5164a32d1ce6cdafb9cb73d731ca4b4a78.camel@redhat.com>
 <0577bc9b-aa9f-c4b6-bac6-64325d81eeff@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c06f214d-ca9d-9ca3-236a-82a0bacfb582@redhat.com>
Date:   Thu, 17 Sep 2020 19:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0577bc9b-aa9f-c4b6-bac6-64325d81eeff@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 9/17/20 6:58 PM, Mark Pearson wrote:
> On 9/17/2020 10:10 AM, Benjamin Berg wrote:
>> Hi,
>>
>> On Thu, 2020-09-17 at 15:54 +0200, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 9/17/20 3:50 PM, Benjamin Berg wrote:
>>>> On Thu, 2020-09-17 at 14:51 +0200, Hans de Goede wrote:
>>>>>> Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
>>>>>> something to advertise the unavailability of a profile, and the reason
>>>>>> for that unavailability.
>>>>>
>>>>> UGh, do we really need to export this though. We have the lap_mode thing
>>>>> already; and that is something which we will need for other reasons in
>>>>> the future too. Any UI for selecting performance modes can display a
>>>>> warning when lap_mode is true saying that: "The laptop has detected that it
>>>>> is sitting on someone's lap and that performance may be limited
>>>>> because of this." (feel free to improve the text).
>>>>
>>>> Well, for dytc_perfmode there are actually always the three states
>>>> L/M/H. It just happens that the kernel will write "H*" (was "M*" until
>>>> yesterday) when the performance mode is degraded due to lap detection.
>>>>
>>>> Think of dytc_perfmode as a profile that sets a number of things:
>>>>    * Thermal Limits
>>>>    * Fan Behaviour
>>>>    * possibly more
>>>>
>>>> While dytc_lapmode will only enforce a change to the thermal limit.
>>>> So "performance" (H) is technically a valid mode even when the lap is
>>>> detected.
>>>>
>>>>> I guess we could split the "value" attribute from my reply to Benjamin's
>>>>> email into "configured_value" (rw) and "actual_value" (rw) attributes.
>>>>> If we have the info we might as well export it I guess,.
>>>>
>>>> I consider the "*" purely a curtsey to users that read the attribute
>>>> directly using e.g. cat to help with the interpretation. It probably is
>>>> not interesting to userspace applications/daemons.
>>>
>>> So if there is a difference between M and H and H* then I think we should
>>> just do the KISS thing and only have a single value attribute and in the
>>> new interface handle the H* like H (p-p-d can still check the lap_mode
>>> attribute to differentiate the 2 if it wants to).
>>
>> I guess you are saying to drop "H*" and only have "L"/"M"/"H"? If so,
>> fine with me, but we probably need that input in reply to
>>    https://patchwork.kernel.org/patch/11730133/#23618881
>> then :)
>>
>> In principle it could be useful for userspace to know that performance
>> is or would be dramatically impacted. i.e. when dytc_lapmode is 1, then
>> you might want to say something like:
>>
>>    performance states >= 75 are impacted due to "lapmode"
>>
>> But, not sure if a kernel interface for that is useful or whether we
>> should just put that kind of knowledge into userspace.
>>
>> Benjamin
>>
> I don't have a strong opinion on this but the kernel driver is already knowledgeable about the quirks of what does and doesn't work on the system so it seems like a good place to have that logic.
> 
> What if we have an API for "configured" and "actual" - and if they differ userspace knows it should figure out why (likely lapmode, but if the HW vendor adds a new setting related to "position of sun in the sky" or "how much money is in your account and can you afford the electricity bill?" that could be added too....)

As I understand the problem with the configured and actual value/performance_level ideas is that if I understand things correctly that H* is not the same as M,
it behaves close-ish to M because of the lower thermal-limits from lapmode, but if I understood Benjamin correctly is is not exactly the same, so if we were
to advertise "M" in the actual_performance_level sysfs-attribute then that would not really be correct ?

Regards,

Hans

