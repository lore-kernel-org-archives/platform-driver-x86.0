Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05174C63797
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 12:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbjAKMQw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 07:16:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238173AbjAKMQf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 07:16:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAAA7656
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 04:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673439347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yFAkQuK5J6VynRmWh5QJhjwoVHbQgVeBD61MItSLDEM=;
        b=hNLXZv38LtdP+FhHRWZGLaYPZRuGxftlByWR/XiltwlNfi+2Jz8jaLDGq3IiMfWgWi6Wx9
        ZNHrxaGnMT7gt0mxRB9gSkVqyAMhPRTZkRxd9Pv/XgV3Ibh4opTu8a2i6Pxo0rrChtFd5W
        UTBeMERiaBIZBjXTQF+sz0Hr/+1dEBI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483--r7zWII6PPCZfFE_6sgg7w-1; Wed, 11 Jan 2023 07:15:46 -0500
X-MC-Unique: -r7zWII6PPCZfFE_6sgg7w-1
Received: by mail-ej1-f70.google.com with SMTP id qb2-20020a1709077e8200b00842b790008fso10202923ejc.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 04:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFAkQuK5J6VynRmWh5QJhjwoVHbQgVeBD61MItSLDEM=;
        b=74arrWlWTiGHJAqh8HRzvw2ikEylBHeKrCRcrzFQHDiiJlzBpUUnqt/K4ksrHLzBK0
         Ldc3Vfj+9cMBY4S/MR+wtkpVoVlCjFVTjCebLdPmvCmF4wAiLt4dNQZP+9Lub5thYUj0
         6wAp98hJsgcEeWjtYZQN1zXRAtWMFpaiX0Rizlnrn5zQWhsjyqHKFSGYEFzH3wkTOPDl
         G+rFxI2Tvu3fxpmbyQR1qpbcBmpKYrjxidASSWUx5OElf2EOczW5GSpQMuRmaKPnOfQx
         ZCdD1/2ghLScWWuG86xjS4sPZbQlUQ1f0zRDgkOGU4JetHAEQPz3VLWVGFTYTZHIFrUD
         Actg==
X-Gm-Message-State: AFqh2kp/ER0KPOYmK/1XJGIM1xgifGG0ffnDM82RcFusZkp3pe7lL7JC
        An6rqvUyOymvuxpOrVgb8sCSGzlEkJdrQuJo1uPhH/MLbOgeke7fYaGKKfnXmf5uTTeQGC9jLvI
        j+MgdYa6aKMQwP/Iu+8K4Ii4hciOjzIousw==
X-Received: by 2002:a17:907:80ca:b0:7c1:20ff:c044 with SMTP id io10-20020a17090780ca00b007c120ffc044mr62441348ejc.27.1673439344786;
        Wed, 11 Jan 2023 04:15:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuNpH4xqot6t0evlmhZpFZTpoa8mnkGSUeADqTRM85jhsp/Q7VbBT1hGrxbYxAdbSD0CclpOQ==
X-Received: by 2002:a17:907:80ca:b0:7c1:20ff:c044 with SMTP id io10-20020a17090780ca00b007c120ffc044mr62441334ejc.27.1673439344579;
        Wed, 11 Jan 2023 04:15:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090630d500b0084f7d38713esm2689685ejb.108.2023.01.11.04.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 04:15:44 -0800 (PST)
Message-ID: <4656f2a5-9a81-58b1-742e-f466fd5c5128@redhat.com>
Date:   Wed, 11 Jan 2023 13:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 03/16] platform/surface: aggregator: move
 to_ssam_device() to use container_of_const()
Content-Language: en-US, nl
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-4-gregkh@linuxfoundation.org>
 <cc8125e0-a52e-f804-8e57-c3a1372ee6fc@redhat.com>
 <Y76oFmWJzEJv68yr@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y76oFmWJzEJv68yr@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/23 13:14, Greg Kroah-Hartman wrote:
> On Wed, Jan 11, 2023 at 12:54:54PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/11/23 12:30, Greg Kroah-Hartman wrote:
>>> The driver core is changing to pass some pointers as const, so move
>>> to_ssam_device() to use container_of_const() to handle this change.
>>> to_ssam_device() now properly keeps the const-ness of the pointer passed
>>> into it, while as before it could be lost.
>>>
>>> Cc: Maximilian Luz <luzmaximilian@gmail.com>
>>> Cc: platform-driver-x86@vger.kernel.org
>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> ---
>>>  include/linux/surface_aggregator/device.h | 5 +----
>>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
>>> index 46c45d1b6368..24151a0e2c96 100644
>>> --- a/include/linux/surface_aggregator/device.h
>>> +++ b/include/linux/surface_aggregator/device.h
>>> @@ -229,10 +229,7 @@ static inline bool is_ssam_device(struct device *d)
>>>   * Return: Returns a pointer to the &struct ssam_device wrapping the given
>>>   * device @d.
>>>   */
>>> -static inline struct ssam_device *to_ssam_device(struct device *d)
>>> -{
>>> -	return container_of(d, struct ssam_device, dev);
>>> -}
>>> +#define to_ssam_device(d)	container_of_const(d, struct ssam_device, dev)
>>
>> There is a kernel-doc comment for this helper, I'm not sure if sphinx is going
>> to like changing this from a static inline to a #define ?
>>
>> At a minimum I guess the generated docs are going to loose some type info
>> by switching to a define. Can we keep this as a static inline ?
> 
> No, container_of_const() will not work properly as an inline function as
> you don't know the return type until the preprocessor runs.  I thought
> kerneldoc should still work just fine here as it does work for defines
> in other places.

Ok then this is fine as is. Thanks for clarifying why the switch to
a #define is necessary.

Regards,

Hans



