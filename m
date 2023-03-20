Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB0EC7618A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 13:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjCTNlC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 09:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjCTNlB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 09:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D4B9764
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679319615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=brtbY62vGdKHdiLfUZNYM74OYLu53+kv5NFprwg9mS0=;
        b=Ph8DZebiY+t6oX77+AzuteSsOJ+HMVI1NM5oGsejjpKvBRHsPnFw9VwI5MZBKX5SqmRTO3
        mhMQPXNg7yWOx7Fl4jmpwONFw2/68KsztnQB9yJox/i3xC1Szzi2Tzal6D3TD+40+blI5l
        C5RBppSggu5pSXu8pV8PvTxbRGVO8JE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-cEB-c-e0MGa01EWZ7IFeDQ-1; Mon, 20 Mar 2023 09:40:14 -0400
X-MC-Unique: cEB-c-e0MGa01EWZ7IFeDQ-1
Received: by mail-ed1-f70.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so17753719edc.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679319613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brtbY62vGdKHdiLfUZNYM74OYLu53+kv5NFprwg9mS0=;
        b=ulzGbi1x19+S+r2N/tA822IRKsXIOjx1sPhVuyhxiDp4Ddq79XP5Y24rntxSMVPOYO
         6bBsQ6EOEbgqBenEiZFzTeqRuMdM2v5MtKUC6SEoNfIydgtC4ShU/gj6B19BqPIL19Kg
         +uYDGI0Br5VvDwxT2C4g9UYzBWircoKqTtJF5tH0blXvuUvw/yjYAL5I/fp2QbIyxXYl
         TaZtqYFhKaOyXg85jFrVM/2KDfA3pfYiqHcLrsc6bwoWUWsIdlc99dOU18FrwP/0lgZg
         n1daic/6oZHLpxQL2AOd/s+dkij7arkCd5TpJ8i082LmpaKmXethQRfJrUF8xq5R3+Vd
         H96g==
X-Gm-Message-State: AO0yUKVzZqhPSAu+reZ7dwwXPe1ODfYHYJriGac8W3L2hoGsgu5arKaV
        eUVQxKj/PslVbmAxMP84y9eHTBVbfNMa8we/83GNNOwDG07q/42GPymr/KgPlSn8+jjkvLoHlvN
        zSkoUP5vWG4xkNK/N97vDTSlZz+UZ5PTOCA==
X-Received: by 2002:a05:6402:150c:b0:4af:70a5:560b with SMTP id f12-20020a056402150c00b004af70a5560bmr13702564edw.9.1679319613527;
        Mon, 20 Mar 2023 06:40:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set/25EAq+Bw82mJBLA9s9Edj2Z4aNw+r4j8Ak1c/P7dG6MKwqMJO+2MPOr2woQim/9rR6XbMcA==
X-Received: by 2002:a05:6402:150c:b0:4af:70a5:560b with SMTP id f12-20020a056402150c00b004af70a5560bmr13702547edw.9.1679319613275;
        Mon, 20 Mar 2023 06:40:13 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x2-20020a50ba82000000b004fb30fc1dabsm4829540ede.96.2023.03.20.06.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 06:40:12 -0700 (PDT)
Message-ID: <46283dac-bd52-b171-d0b1-cc06e9c4d4e0@redhat.com>
Date:   Mon, 20 Mar 2023 14:40:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH linux-next v2 2/3] drivers/platform/x86/intel/tpmi: revise
 the comment of intel_vsec_add_aux
Content-Language: en-US
To:     Dongliang Mu <dzm91@hust.edu.cn>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230309040107.534716-1-dzm91@hust.edu.cn>
 <20230309040107.534716-3-dzm91@hust.edu.cn>
 <8b58fbc5-93c6-9cbe-edda-e804c398ba52@redhat.com>
 <9068dfb4-044f-f54d-d0da-437659fcebe8@hust.edu.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9068dfb4-044f-f54d-d0da-437659fcebe8@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/20/23 11:57, Dongliang Mu wrote:
> 
> On 2023/3/20 18:33, Hans de Goede wrote:
>> Hi,
>>
>> On 3/9/23 05:01, Dongliang Mu wrote:
>>> intel_vsec_add_aux() is resource managed including res and
>>> feature_vsec_dev memory.
>>>
>>> Fix this by revising the comment of intel_vsec_add_aux since res variable
>>> will also be freed in the intel_vsec_add_aux.
>>>
>>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>> Thank you for your patch, I've applied this patch to my review-hans
>> branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in my review-hans branch once I've pushed my
>> local branch there, which might take a while.
>>
>> Once I've run some tests on this branch the patches there will be
>> added to the platform-drivers-x86/for-next branch and eventually
>> will be included in the pdx86 pull-request to Linus for the next
>> merge-window.
>>
>> Regards,
>>
>> Hans
> 
> Thanks, Hans.
> 
> Shall I send the patch related to memory leak to the mainline? The mainline is also prone to this issue?

There is no need for this, I have just moved these from my review-hans branch to the fixes
branch: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

So these will be included in my next fixes pull-req for mainline.

Regards,

Hans




>>> ---
>>>   drivers/platform/x86/intel/tpmi.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
>>> index 882fe5e4763f..036d0e0dba19 100644
>>> --- a/drivers/platform/x86/intel/tpmi.c
>>> +++ b/drivers/platform/x86/intel/tpmi.c
>>> @@ -239,8 +239,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>>>       /*
>>>        * intel_vsec_add_aux() is resource managed, no explicit
>>>        * delete is required on error or on module unload.
>>> -     * feature_vsec_dev memory is also freed as part of device
>>> -     * delete.
>>> +     * feature_vsec_dev and res memory are also freed as part of
>>> +     * device deletion.
>>>        */
>>>       return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
>>>                     feature_vsec_dev, feature_id_name);
> 

