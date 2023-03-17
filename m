Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD2DC6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 08:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjCQIwe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 04:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCQIwd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 04:52:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3997A5F6F4
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 01:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679043100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fm5MA3d1uv4eRbM8QklMaZbFqc/Ou7mWY80ypyE/Dqk=;
        b=PTFlBlBCrJnDfGR1hc7KqNf4viI8F3850xKi8ZOqtYjTcNuBrSJjKOjvKN3+f/D0DetHww
        fAs2kQJvlIf/bo37SDxOHa16dfpz2OvvwnKipO18i1ycfbUrog3o7pDp1vnvraHVPWNpx2
        hA1Lv6oRxHZrmaDaExeYBBoyf8gyp6M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-qZVawKt6OfSjDhpDt9Nruw-1; Fri, 17 Mar 2023 04:51:39 -0400
X-MC-Unique: qZVawKt6OfSjDhpDt9Nruw-1
Received: by mail-ed1-f71.google.com with SMTP id w6-20020a05640234c600b004fc0e5b4433so6797724edc.18
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 01:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fm5MA3d1uv4eRbM8QklMaZbFqc/Ou7mWY80ypyE/Dqk=;
        b=SQ2poJuqpTfMPddD+iyxyPlCTkEahcPCFw47hi1PJr+KJh+8SPPOywkD/6ctIqh0V6
         G0b6+XUzQYTlyOPXs3Oa0/rQjMlXx6vbWBGHOSo4E6halwLTxtpBCN40jE7WxW1bGFdM
         4JeyrIPNp20YmQceZDdbzCidS/g6lXK05xFJJppVaFPGElnoYnxHCUcdVZJh8ZZ3YE3u
         xX1rpw0ALJdzD1TCnF/pEIqxgrYsQSmMok5PsOJJ0xoXC62Tt7jx7on34Mf/b7mUVjjL
         tE8taCtKOQ+jcM6Bf1srph302kfgLZW/pIrffG0UnV6F+g414m2g7AqrE77bldpbKu2Z
         y2Qg==
X-Gm-Message-State: AO0yUKVssgzm1qkVWar8Seor3Ki5Ix+9fymY/EWDu+RKNtaHRVREzFo5
        dAm2hm00jeVwRQ+EXeTb4Se0bBEW29yF/Hzy5GF3yYIQk94xxskfIvo6p4VK0ZoYTyn6xYbzCNJ
        kOerMNn+9seKzgqORPJPWKMuJQHLmjghyqQ==
X-Received: by 2002:a17:907:2cc6:b0:930:d30a:6c20 with SMTP id hg6-20020a1709072cc600b00930d30a6c20mr5733883ejc.17.1679043098109;
        Fri, 17 Mar 2023 01:51:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set9MDw/m46G8qAEs0zLgpAhdxOqEf4mgpcBP0f71HhwEo8S+g9E4NvA8o054Pi7GeZthoTZWQg==
X-Received: by 2002:a17:907:2cc6:b0:930:d30a:6c20 with SMTP id hg6-20020a1709072cc600b00930d30a6c20mr5733868ejc.17.1679043097844;
        Fri, 17 Mar 2023 01:51:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090666c900b0092b606cb803sm714556ejp.140.2023.03.17.01.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:51:36 -0700 (PDT)
Message-ID: <7d535885-0bf1-bbeb-7a7e-89e67aaafa1e@redhat.com>
Date:   Fri, 17 Mar 2023 09:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH linux-next v2 1/3] platform/x86/intel/tpmi: Fix double
 free in tpmi_create_device()
To:     Dongliang Mu <dzm91@hust.edu.cn>,
        srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230309040107.534716-1-dzm91@hust.edu.cn>
 <20230309040107.534716-2-dzm91@hust.edu.cn>
 <dd36a2ab-d465-f857-30c6-3c0094babd31@redhat.com>
 <559654bbef8483fcd53458824f23814236b0c9e0.camel@linux.intel.com>
 <40d7cb19-5712-9754-b7bd-2b582055c929@hust.edu.cn>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <40d7cb19-5712-9754-b7bd-2b582055c929@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/23 02:28, Dongliang Mu wrote:
> 
> On 2023/3/17 02:18, srinivas pandruvada wrote:
>> Hi Hans,
>>
>> On Thu, 2023-03-16 at 15:25 +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 3/9/23 05:01, Dongliang Mu wrote:
>>>> The previous commit 6a192c0cbf38 ("platform/x86/intel/tpmi: Fix
>>>> double free reported by Smatch") incorrectly handle the
>>>> deallocation of
>>>> res variable. As shown in the comment, intel_vsec_add_aux handles
>>>> all
>>>> the deallocation of res and feature_vsec_dev. Therefore, kfree(res)
>>>> can
>>>> still cause double free if intel_vsec_add_aux returns error.
>>>>
>>>> Fix this by adjusting the error handling part in
>>>> tpmi_create_device,
>>>> following the function intel_vsec_add_dev.
>>>>
>>>> Fixes: 6a192c0cbf38 ("platform/x86/intel/tpmi: Fix double free
>>>> reported by Smatch")
>>>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>>
>>> IIRC then after this v2 was posted I still saw some comments on the
>>> original v1 which was not posted on the list. Without the v1 comments
>>> being on the list and this archived, I have lost track of what the
>>> status of these patches is.
>>>
>>> Srinivas, can you let me know if I should merge these, or if more
>>> changes are necessary ?
>>>
>>>  From the off-list discussion of v1 I got the impression more changes
>>> are necessary, but I'm not sure.
>> I was looking for changes submitted by the following patch
>> "
>> [PATCH linux-next v2 3/3] drivers/platform/x86/intel: fix a memory leak
>> in intel_vsec_add_aux
>> "
>>
>> Since I was not copied on this, I was unaware. So I was requesting this
>> change.
>>
>> Thanks,
>> Srinivas
> 
> Hi Srinivas and Hans,
> 
> How about folding these three patches into one patch and resend a v3 patch?
> 
> This will get all people together and avoid the previous embarrassing sitation.

If I understand things correctly then patch 1/3 needs 3/3 to function correctly, right ?

I would not fold them together, smaller patches are easier to review / understand, but maybe change the order and put patch 3/3 first? (so make it 1/3) ?

I can even do that when applying if you agree that is the better order.

Regards,

Hans



>>>> ---
>>>>   drivers/platform/x86/intel/tpmi.c | 17 ++++-------------
>>>>   1 file changed, 4 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/intel/tpmi.c
>>>> b/drivers/platform/x86/intel/tpmi.c
>>>> index c999732b0f1e..882fe5e4763f 100644
>>>> --- a/drivers/platform/x86/intel/tpmi.c
>>>> +++ b/drivers/platform/x86/intel/tpmi.c
>>>> @@ -215,8 +215,8 @@ static int tpmi_create_device(struct
>>>> intel_tpmi_info *tpmi_info,
>>>>            feature_vsec_dev = kzalloc(sizeof(*feature_vsec_dev),
>>>> GFP_KERNEL);
>>>>          if (!feature_vsec_dev) {
>>>> -               ret = -ENOMEM;
>>>> -               goto free_res;
>>>> +               kfree(res);
>>>> +               return -ENOMEM;
>>>>          }
>>>>            snprintf(feature_id_name, sizeof(feature_id_name), "tpmi-
>>>> %s", name);
>>>> @@ -242,17 +242,8 @@ static int tpmi_create_device(struct
>>>> intel_tpmi_info *tpmi_info,
>>>>           * feature_vsec_dev memory is also freed as part of device
>>>>           * delete.
>>>>           */
>>>> -       ret = intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev-
>>>>> auxdev.dev,
>>>> -                                feature_vsec_dev,
>>>> feature_id_name);
>>>> -       if (ret)
>>>> -               goto free_res;
>>>> -
>>>> -       return 0;
>>>> -
>>>> -free_res:
>>>> -       kfree(res);
>>>> -
>>>> -       return ret;
>>>> +       return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev-
>>>>> auxdev.dev,
>>>> +                                 feature_vsec_dev,
>>>> feature_id_name);
>>>>   }
>>>>     static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)

