Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4B3C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 15:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbiKPPjc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 10:39:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiKPPjb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 10:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6512A6387
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668613114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dA8kycjEcEKBcXjM8Cw63fd3Zn/LLumxDKZJffvjjQU=;
        b=PSGH3b/CGXXvvpwGX7qFeOlzm0RxP87NIG/h5iYWND1A/CHtBOSG28V4juxtIS2t+T+yq7
        ikrFK4fSHE7HmtFlV0On6BBiHsE0Z272RMN/7iuzEqGgPYQdcIww92/kX550itQq59mqYo
        Vbs6JLl+dGzzdYVntQBdlHMqaUeIrHw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-as9ZjnmNPZCxIva3NXkPoQ-1; Wed, 16 Nov 2022 10:38:33 -0500
X-MC-Unique: as9ZjnmNPZCxIva3NXkPoQ-1
Received: by mail-ej1-f70.google.com with SMTP id ga41-20020a1709070c2900b007aef14e8fd7so6180565ejc.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dA8kycjEcEKBcXjM8Cw63fd3Zn/LLumxDKZJffvjjQU=;
        b=FL9FIMSbIXH2UM842tCrYYmyP4TdGve+BgoXwVtsOJmQe2mBpTASE0egiuytauijMT
         9WDyy0YwvEgH6hGcEjH7OdfSHTMqzwPnQh3UfveZS/Hbw9Hgrbe2VdztIzqpQ6no7e5T
         VpsUGY4451JFfy4RFqfw1oSndvac/Ik70paGyEWBUKcmR/a+gvMMQ5wmHG42CGbGM1PL
         WWST4Qk6OY5smuCyjMm3/55Qo9FM5gvvOr51vauEr+4tYOsImZspGLv2YRKXOqqXFE+a
         WuhEX6JCutAmjRT9V6/ShIhk3Ngd9qGMIXl84CrAfjjtZUYZJS8IvKpe+KoqRsM3EK+H
         IwqA==
X-Gm-Message-State: ANoB5pkpyPZvjoh4k3pTWglNfLslBh6Xwssopdh43LwrL58qmXae9jXz
        wo+bI3IuzFllnHVg9T1dll/4+T2+Ka+oDDXnTENSqj1ZeS1LvQnxC5uiqBLPv6WSqUDr4IcH5X0
        3BY5AwD/kGjFUjRdX9Fev7/zSwKme5Lc0/Q==
X-Received: by 2002:aa7:c603:0:b0:460:fab2:c31f with SMTP id h3-20020aa7c603000000b00460fab2c31fmr20175765edq.335.1668613111008;
        Wed, 16 Nov 2022 07:38:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77U3wMi7XY8YIK2iOAUZc8DIpIWRRROd93SPQaQY7r1xsZUBaevATjo2+NHcYrERhFhXDyGQ==
X-Received: by 2002:aa7:c603:0:b0:460:fab2:c31f with SMTP id h3-20020aa7c603000000b00460fab2c31fmr20175750edq.335.1668613110855;
        Wed, 16 Nov 2022 07:38:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906318d00b0077e6be40e4asm7078939ejy.175.2022.11.16.07.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 07:38:30 -0800 (PST)
Message-ID: <3271ec19-f865-9222-ef36-b41c14c9337d@redhat.com>
Date:   Wed, 16 Nov 2022 16:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>
Cc:     cleverline1mc@gmail.com, g_goessel@outlook.com,
        ike.pan@canonical.com, jiaxun.yang@flygoat.com,
        limanyi@uniontech.com, maxtram95@gmail.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com>
 <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com>
 <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
 <20221110184709.52768-1-erayorcunus@gmail.com>
 <d86d9c20-6f5c-0de9-2c09-7667080dd65c@redhat.com>
 <CAKErNvquRV9M6CU2RTO7nj1X=vwnByomk7Xndg2eGLN4DBh4uw@mail.gmail.com>
 <51b68bf6-94d5-8ae3-6da4-58136d49c36e@redhat.com>
 <20221116153403.14670-1-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221116153403.14670-1-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/16/22 16:34, Eray Orçunus wrote:
> On Thu, 16 Nov 2022 at 18:19, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
> 
> Hi, sorry for the late reply.
> 
>> On 11/11/22 12:44, Maxim Mikityanskiy wrote:
>>> Maybe also add a module parameter to force the i8042 workaround? This
>>> change is likely to break the touchpad toggle for some devices similar
>>> to Z570 (maybe Z580? Y580? idk), so people would at least have an
>>> option to force enable it using the module parameter, before the
>>> relevant entry gets added to the DMI table, the patch gets merged, and
>>> the kernel gets updated.
>>
>> That is a good idea. I'm about to send out this as a proper patch-series
>> and I've added a module parameter to the version.
> 
> Alright, I will continue the discussion from there then.
> 
>> BTW did you ever try simply writing back the value returned from
>> VPCCMD_R_TOUCHPAD to VPCCMD_W_TOUCHPAD ?
>>
>> Eray has been looking at what the Windows tools do and according
>> to Eray they always call VPCCMD_W_TOUCHPAD on touchpad toggle
>> events. So maybe just writing back the value is enough to actually
>> disable the touchpad ?
> 
> It isn't, as I said before, VPCCMD_W_TOUCHPAD is nulled/empty on Z570 and
> S12, so it won't work.

A right, I forgot that you mentioned that, sorry.

Maxim, that means there is no need to try doing this.

Regards,

Hans


