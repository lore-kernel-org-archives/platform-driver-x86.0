Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBA1EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Jul 2023 10:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjGOKKF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Jul 2023 06:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjGOKKE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Jul 2023 06:10:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE9E2D49
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jul 2023 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689415756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vucfurnz+GIyJZkoNWk6fJJML/71b8kmvFkxpCXGGJg=;
        b=G8nBDvcCBtTILtEoF0F5Ep7nGMROg67RzIiYNvrwAKTXp8+9ZXkOIWw7sSVEAaVAjgWMS4
        3XjZqQn71Tfcr2xccIYpsrPzzVvyHlvNQkR+aoX54mkKgA1X2ZAPqDhni6/rdN6nHXlx85
        ExDD98qIOnWMqs4/EvRpqfKh36adXIE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-4-odUix9O3ipzgxMJm0ArQ-1; Sat, 15 Jul 2023 06:09:14 -0400
X-MC-Unique: 4-odUix9O3ipzgxMJm0ArQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-993d7ca4607so157279466b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jul 2023 03:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689415753; x=1692007753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vucfurnz+GIyJZkoNWk6fJJML/71b8kmvFkxpCXGGJg=;
        b=Sjao9J4/UThCV5orPMGGrlno3MYJvxTUmvk+nWNrEHU7QX17dMOdUdYajmDUuahiMk
         P2zmczBqK2kQNdr73ACBY9zqnrqzJ8d/Iy/WMQGlUI6g4pKMlRuSrv23DFBmdSgMdD8k
         ZkpKGB+vtS7cHyqSpb9X/hRteqX+qzztgH9Y9Q+K4/55U3X3yk2THjFLqTIiwF/3hMOn
         EhxL71zNhwd53D7BM5W8LgoHbNCTHyara+utd/LIs1EhONsFtDGZBrKk1IgW9zbRXezy
         Oyxa0Vw4QxEm27rniyB/eZee9sGJ5kp8cZhHoY4rJCYxqdeeDC+UUUV60sUxU4pVnPuE
         ekXA==
X-Gm-Message-State: ABy/qLYYa5nfDujLehEK444P4IuyciOp1Bj97zywUXp5tH4aG/UXqV/X
        YQo6ZPTjMo0Kxhws54EN2Ak0hH8kTKiu8SKtgRkvPtebj+yHlQqzJZwVdj2ceYRVpOMlFymPCLt
        O+9RohY0pWnedPxCrMzsTzty1MD23JFlN7FuhlL+n2Q==
X-Received: by 2002:a17:906:64c8:b0:993:f349:c98e with SMTP id p8-20020a17090664c800b00993f349c98emr7786467ejn.2.1689415753288;
        Sat, 15 Jul 2023 03:09:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF5J1PFsTCVxbklhL3vtiU6hzxawxHk/Wq2gzMmMdkMO+UnTkHcan83lgsXuCczyHxGNVtJoA==
X-Received: by 2002:a17:906:64c8:b0:993:f349:c98e with SMTP id p8-20020a17090664c800b00993f349c98emr7786447ejn.2.1689415752599;
        Sat, 15 Jul 2023 03:09:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e18-20020a170906505200b00989257be620sm6573737ejk.200.2023.07.15.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 03:09:12 -0700 (PDT)
Message-ID: <87d34e1d-1fcb-6d24-662f-91ff62f65dc2@redhat.com>
Date:   Sat, 15 Jul 2023 12:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Fix setting RGB mode on some
 TUF laptops
Content-Language: en-US, nl
To:     Luke Jones <luke@ljones.dev>,
        Kristian Angelov <kristiana2000@abv.bg>
Cc:     platform-driver-x86@vger.kernel.org
References: <ZLGzxoJN_7Dhl_si@wyvern.localdomain>
 <7ae06b8a-6c67-f6a6-06ed-2b6c8430c12c@redhat.com>
 <1549bab6dae1e4509f7190469c0d2371f127a4f0.camel@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1549bab6dae1e4509f7190469c0d2371f127a4f0.camel@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/15/23 12:03, Luke Jones wrote:
> On Sat, 2023-07-15 at 11:40 +0200, Hans de Goede wrote:
>> Hi Kristian,
>>
>> On 7/14/23 22:44, Kristian Angelov wrote:
>>> This patch fixes setting the cmd values to 0xb3 and 0xb4.
>>> This is necessary on some TUF laptops in order to set the RGB mode.
>>>
>>> Closes:
>>> https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg
>>> Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>
>>> ---
>>>  V1 -> V2. Make setting 0xb3 and 0xb4 the default logic
>>>  
>>>  drivers/platform/x86/asus-wmi.c | 13 +++++++++++--
>>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.c
>>> b/drivers/platform/x86/asus-wmi.c
>>> index 1038dfdcdd32..eb82ed723b42 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -738,13 +738,22 @@ static ssize_t kbd_rgb_mode_store(struct
>>> device *dev,
>>>                                  struct device_attribute *attr,
>>>                                  const char *buf, size_t count)
>>>  {
>>> -       u32 cmd, mode, r, g,  b,  speed;
>>> +       u32 cmd, mode, r, g, b, speed;
>>>         int err;
>>>  
>>>         if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g,
>>> &b, &speed) != 6)
>>>                 return -EINVAL;
>>>  
>>> -       cmd = !!cmd;
>>> +       /* B3 is set and B4 is save to BIOS. Only set by default*/
>>> +       switch (cmd) {
>>> +       default:
>>> +       case 0:
>>> +               cmd = 0xb3;
>>> +               break;
>>> +       case 1:
>>> +               cmd = 0xb4;
>>> +               break;
>>> +       }
>>
>> You are now leaving the value of cmd unmodified for values which are
>> not 0 and 1.
>>
>> I think you need to add a:
>>
>>         default:
>>                 return -EINVAL;
>>
>> here to catch cmd not being either 0 or 1.
>>
>> Luke, what do you think ?
> 
> Looks fine to me.

Fine with or without the default: return -EINVAL; added ?

> Signed-off-by: Luke D. Jones <luke@ljones.dev>

I guess you mean Reviewed-by ?

Regards,

Hans




>>>         /* These are the known usable modes across all TUF/ROG */
>>>         if (mode >= 12 || mode == 9)
>>
> 

