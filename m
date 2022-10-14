Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB14C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 08:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiJNIAM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 04:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiJNIAL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 04:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4A731237
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665734408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zVILIB5XF/M49DQErChLlIG7/6rWFKqLERRwuxIyoE0=;
        b=g1lGNmJvjc+wDTWodD/Hj2wKjUN1RGOYA90kC0gGMLWu4r05fsr6Xhan6RaK9zajNk9NjO
        87/6c8OI+f2jSow924z4UxqUO8t7WNaJOx521Uy2W6QktNfOjZY9W3Dd+c9mqMsetA8OWM
        Ij5Qv0HWBxzPwTYMyA1Uqd4u7nmZu+w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-ecbGROdfMtqdGfwMczA2zw-1; Fri, 14 Oct 2022 04:00:05 -0400
X-MC-Unique: ecbGROdfMtqdGfwMczA2zw-1
Received: by mail-ej1-f69.google.com with SMTP id sh33-20020a1709076ea100b0078d28567b70so1862126ejc.16
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 01:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVILIB5XF/M49DQErChLlIG7/6rWFKqLERRwuxIyoE0=;
        b=t21Fg5eAMqBrrerrMl1H1E4C0HtRJYuwjpleeW+M7n6Ddl2U2j7TguKKQ1Qv9JX+GQ
         cIy5eKHMq92s4R9PWQGI3hKAlsjZ3tNAbslx+up5zLcynKIfPk79+ASU8NIk0o/ZTwEa
         d5mwlsqKbnhwRhNz88IDI3xj5uT+n6QKJynMG9lXx6XIBkw0DukJt7gcOmiY2Q43MGOa
         0Bnj2WihE9BN2a6+qAXTjfMlP++uy0O7RwNJQ9z5syRYLipG5aBfo1NfpageBgw/ygg0
         07oqaB7QR2DPncKugHpR3pva+uwZ7cjpTnYNOkuX85xzWxeYX1zBeVPAynfdSCAk77C8
         XI8g==
X-Gm-Message-State: ACrzQf07P91msWi/72+ck2aBXTujwZVFa09coGtvoNa/M+twhOpCJAXe
        ffShJtme8pG3It9pPwXKIJ4oIUOvSk0ERgiI7gltVzokubgqj3TgoVCZYYAvoNBap5lng1/nBmp
        rYHWryP9nTNW3aOnDK83pH1i75LsXHjc2HQ==
X-Received: by 2002:a05:6402:150a:b0:459:2575:99c6 with SMTP id f10-20020a056402150a00b00459257599c6mr3256944edw.231.1665734403971;
        Fri, 14 Oct 2022 01:00:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Fbmz3m2n1wS8HUDR7xXGw/wCHr77fdTBtw3CtgI5W/YLBhbpCzg7T650dQMOxKcFP6l1xoQ==
X-Received: by 2002:a05:6402:150a:b0:459:2575:99c6 with SMTP id f10-20020a056402150a00b00459257599c6mr3256922edw.231.1665734403716;
        Fri, 14 Oct 2022 01:00:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id m3-20020a170906160300b0078194737761sm1103690ejd.124.2022.10.14.01.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 01:00:03 -0700 (PDT)
Message-ID: <5320210a-9f94-9971-aa63-c0f48df94def@redhat.com>
Date:   Fri, 14 Oct 2022 10:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] platform/x86/intel: pmc/core: Add Raptor Lake
 support to pmc core driver
To:     Jiri Slaby <jirislaby@kernel.org>,
        Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
References: <20220912233307.409954-1-gayatri.kammela@linux.intel.com>
 <20220912233307.409954-2-gayatri.kammela@linux.intel.com>
 <3537fa63-9015-c63d-2321-a77062e24d6f@redhat.com>
 <58855ea9-0d89-e17d-349a-657512068663@kernel.org>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <58855ea9-0d89-e17d-349a-657512068663@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/14/22 09:50, Jiri Slaby wrote:
> On 19. 09. 22, 13:41, Hans de Goede wrote:
> 
>> On 9/13/22 00:33, Gayatri Kammela wrote:
>>> Add Raptor Lake client parts (both RPL and RPL_S) support to pmc core
>>> driver. Raptor Lake client parts reuse all the Alder Lake PCH IPs.
>>>
>>> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Cc: David Box <david.e.box@intel.com>
>>> Acked-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
>>> Acked-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>
>>> ---
>>> Changes since v1:
>>> 1) Added a dependency patch- ea902bcc1943f7539200ec464de3f54335588774 :
>>>   "x86/cpu: Add new Raptor Lake CPU model number".
>>> 2) Rebased the above patch on v6.0-rc1 with "Acked-by" from Hans and
>>>   Rajneesh.
>>
>> I still cannot take this, since patch 1/2 is *already merged* through
>> another tree, so me cherry-picking it leads to potential conflicts.
>>
>> As I have already explained twice you need to submit this upstream
>> throuh the same tree which has the original merge of patch 1/2.
> 
> Hi, friendly ping: has this ever happened, Gayatri?

If not, 6.1-rc1 will be out soon. If this gets resend after 6.1-rc1
is out I can take it and I can add it to 6.1-rc# as a fix in my
next pull-req to Linus.

Regards,

Hans

