Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0819C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 17:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbiCQRZI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 13:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiCQRZH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 13:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E414AEBAF2
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647537830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OH97dp6+6w3eVifKWwaN0SIq08gGyFw+xq468DMdPyQ=;
        b=Yidtnnbv1RZyaZhAFtYSQR0VJ7I/nfwDze/OFMB5f9pkMvtuJzzgtMbcEVxJiB3r/eWyJ0
        vtImXxUhU50LFSMJsuruMpyniEV/porfCPLHcxoDGpWieIYF8LQ5BS/XQ3JHf/9tYJimhq
        vzo1AKNQMzFiov/A1O52FnsPrBkuSMA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-ps_ZB2wTM8WdaTu5ZLpS8g-1; Thu, 17 Mar 2022 13:23:48 -0400
X-MC-Unique: ps_ZB2wTM8WdaTu5ZLpS8g-1
Received: by mail-ed1-f71.google.com with SMTP id w8-20020a50d788000000b00418e6810364so3471170edi.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 10:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OH97dp6+6w3eVifKWwaN0SIq08gGyFw+xq468DMdPyQ=;
        b=hPbnV7XNn0aEurRouPHzJ1nJDLcyS8ZqBpqmUmV+kkAkfX3yUTmhxoHep6qsdrtrkb
         WvNRpXXTQ3+aBFiWn549ExXu2HOeJk2I0dF+0DOukMUkMIUhOelBGIjmoQguIAjOPmVW
         gskY3bsUsGA62Ci0ExowdQrfhgn8GBfqC4G51umaNzF8WRU8Qx5IB57rVJItHIWtqKwI
         fIHpazTTR0thJ7hH5/kfmF3lrIBvfWfcQKQWQ/4OijLN3zecMVjPUDx8FqbvyJcDOCky
         Uwy9yw25W0M0XsWHS4u/raNjjskBUjxRCgf0Et+xfnNkAvzkb6YQwO674L61QygmTVSK
         8Avg==
X-Gm-Message-State: AOAM530aKUeKKrnMa8H/xCgdYw/BF+e0k4yzGsSwX84HkoZmHZ/AO/Yy
        9Fhmpj0+2oP/RExCWchz5nE2JaqeFTRNvRMf26Pr2Z8XUW0gZbKAh2q5iXGhxqtr+4t++Jz5Qyc
        A1TotzKls5DJJ3e5GSomFBwoIszU6uykCBg==
X-Received: by 2002:a17:907:7244:b0:6d9:c722:577a with SMTP id ds4-20020a170907724400b006d9c722577amr5544697ejc.0.1647537827417;
        Thu, 17 Mar 2022 10:23:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybaStiecuOQQajEiXbiAVGmvCAznJECwIoKLFObTEEgAryeplfiPoYtqRcH6MRX63xIi4ZcA==
X-Received: by 2002:a17:907:7244:b0:6d9:c722:577a with SMTP id ds4-20020a170907724400b006d9c722577amr5544674ejc.0.1647537827144;
        Thu, 17 Mar 2022 10:23:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id qa44-20020a17090786ac00b006dbe1ca23casm2663323ejc.45.2022.03.17.10.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 10:23:46 -0700 (PDT)
Message-ID: <f9151a77-f7ad-78cc-41e5-e5d13945c3a2@redhat.com>
Date:   Thu, 17 Mar 2022 18:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [External] Re: [PATCH v2 1/2] Documentation:
 syfs-class-firmware-attributes: Lenovo Certificate support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220315195630.3209-1-markpearson@lenovo.com>
 <c3ef4c4e-9862-88f6-ef7f-2fd741ce9ea9@redhat.com>
 <90f1a4ce-a3ba-ed14-f27a-348af368afad@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <90f1a4ce-a3ba-ed14-f27a-348af368afad@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/22 18:08, Mark Pearson wrote:
> 
> Hi Hans,
> 
> Thanks for the review
> 
> On 2022-03-17 06:58, Hans de Goede wrote:
>> Hi,
>>
>> On 3/15/22 20:56, Mark Pearson wrote:
>>> Certificate based authentication is available as an alternative to
>>> password based authentication.
>>>
>>> The WMI commands are cryptographically signed using a separate
>>> signing server and will be verified by the BIOS before being
>>> accepted.
>>>
>>> This commit details the fields that are needed to support that
>>> implementation. At present the changes are intended for Lenovo
>>> platforms, but have been designed to keep them as flexible as possible
>>> for future implementations from other vendors.
>>>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>
>> This looks good, but looking at this a second time I still
>> have one open question:
>>
>> What is the difference between removing a certificate and
>> switching back to password auth?
> The main difference is clear goes to no-authentication, and switching
> obviously switches to password
> 
>>
>> Looking at the WMI calls there are 4 different calls:
>>
>> LENOVO_SET_BIOS_CERT_GUID
>> LENOVO_UPDATE_BIOS_CERT_GUID
>> LENOVO_CLEAR_BIOS_CERT_GUI
>> LENOVO_CERT_TO_PASSWORD_GUID
>>
>> Going by these names I guess there can be only 1 certificate
>> otherwise I would expect:
>>
>> 1. add/remove naming
>> 2. update to take an id of which certificate to replace
>>
> Correct - there is only one certificate
> 
>> So I guess that LENOVO_CLEAR_BIOS_CERT_GUI disables all
>> authentication. IOW, installing a cert replaces/clears
>> the supervisor password and the difference between
>> clearing the certificate and cert-to-password is that
>> after clearing it we end up with no supervisor password
>> set, where as cert-to-password sets the passed in password
>> as the new supervisor password?
> Correct
> 
>>
>> Or does clearing the certificate fall back to the old
>> supervisor password if one was set?  (that might lead to
>> some interesting issues if users clear the certificate
>> many years after the password was last used ...)
> clearing reverts to no password
> 
>>
>> Given where we are in the cycle I was planning on adding
>> this to my review-hans branch so that it could maybe still
>> get into 5.18, but given the above questions as well
>> the remark about the test X1 BIOS you are using I've
>> a feeling it would be better to give this some more time
>> to bake and target 5.19 instead. Do you agree ?
> 
> I'd love to have it in 5.18 as I expect his feature to be available in
> our 2022 platforms and they're all going to start landing in the next
> couple of months. If that's unrealistic I can live with it so I'll defer
> to your preference

The 5.18 merge window starts coming Monday, if you can get me
a v3 with the last few minor items addressed sometime tomorrow,
then I can throw it into my for-next branch and if it does not
cause any issues there then it can make 5.18.

But if anything non trivial pops up while this is baking in -next
I'll probably drop it from -next and then this becomes 5.19 material.

Regards,

Hans





> 
>>
>> Regardless  of this is 5.18 or 5.19 material can you? :
>>
>> a) confirm that I've understood how the clearing vs cert-to-password
>>    works correctly ?
> Confirmed :)
> 
>> b) confirm that despite you using a test BIOS the WMI API for this is
>>    final and that it will *not* change before there are production
>>    BIOS-es with this ?
> I think I'm safe confirming this (I always get slightly nervous as it's
> outside my control, and weird things happen...) We have an internal spec for
> this feature and this implementation is meeting that spec. I'd be very
> surprised if there are extra changes.
> 
>> c) submit a version to clarify the clearing vs cert-to-password thing, e.g.:
>>
>> @@ -276,6 +276,8 @@ Description:
>>  
>>  					You cannot enable certificate authentication if a supervisor password
>>  					has not been set.
>> +					Clearing the certificate results in no bios-admin authentication
>> +					method being configured allowing anyone to make changes.
>>  					After any of these operations the system must reboot for the changes to
>>  					take effect.
>>
> Ack will do
> 
> Mark
> 

