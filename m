Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB293C352A1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Nov 2022 10:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiK3Kla (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Nov 2022 05:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbiK3KlK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 05:41:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA00B48771
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 02:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669804814;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7Vk1FqfCcICKfYuqkvngzsGKlc11CHuP4gerE2kg8bs=;
        b=BiaZHA1JRxFpXw0dq+NC/3bslOvsq0sHCGDtIvhdDgU/tfG6ucclqNeMilLM1tcCp1jgrC
        x9m6AbvVN9Z2Mj86Qz7ILscMsXOrXTuNdSViTenKXj/HfVhrkfhwBCbNV83DeepJJSneXl
        Q9NMa3M8XB4jwh7AAIh3JYb0HblFov0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-DM-4Tum6Mw22TEzWL5xiSA-1; Wed, 30 Nov 2022 05:40:13 -0500
X-MC-Unique: DM-4Tum6Mw22TEzWL5xiSA-1
Received: by mail-ej1-f70.google.com with SMTP id sh37-20020a1709076ea500b007c09b177cd1so1453527ejc.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 02:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Vk1FqfCcICKfYuqkvngzsGKlc11CHuP4gerE2kg8bs=;
        b=I4Ir5LPbv/ZUTze6t0OEq1Bp3OW5f3wxiBoo31NmSSmTBxIyDV8ULa8eR0EWgu9vmB
         Vnf3ppWbZO5YW0u+Svju1QNiERIJ2R8itfokl3iF2Ax4VI2ZVpa838roCjEtx/3dil5k
         k7zLTsVL++ZICopgm3XudKKuTFWPW6rx5EjsdCEEPSAc2iwN/KRcU6dMIxFgAIQOb98K
         TRP/ZFV+q7W+etWZq+Z1gxrv+Iu17cbUQr2BCX2rROHIX8mM7nngS4a3mJuUTKfV5HsC
         bcMw7tEs5fsdEK28gHvncTvhut76kBcs16FapAmorU/JqVPqd7LZ3lfzYbAsWfWsalpO
         2VtQ==
X-Gm-Message-State: ANoB5pmKWRs4QM2Cm65LxC2v+Sb209r8+LMabtmoJhEQHX3rVIxe3EyW
        ly7ubbAJsqgSs2gW715xyjVuG0yMYxaQbcyMkHxWQ6GFWEz3EC2/tnpQRLF3VW4S0Ecyjr/abSk
        M9rxTjJe4CWPFZmRkkpjxJDJ53bdhomRXGQ==
X-Received: by 2002:a17:906:99cd:b0:7be:9340:b3e4 with SMTP id s13-20020a17090699cd00b007be9340b3e4mr2053473ejn.402.1669804812060;
        Wed, 30 Nov 2022 02:40:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7hGztIHuc21ep0jbDgWGdWXhOLRuYKwnbySeYhsmmhR/PhfAGHUdJ42GeuL1/MK8Ryn3sQhA==
X-Received: by 2002:a17:906:99cd:b0:7be:9340:b3e4 with SMTP id s13-20020a17090699cd00b007be9340b3e4mr2053467ejn.402.1669804811892;
        Wed, 30 Nov 2022 02:40:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c17-20020a17090618b100b007a8de84ce36sm478523ejf.206.2022.11.30.02.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 02:40:11 -0800 (PST)
Message-ID: <4b67b558-90df-6e41-6e00-66ade6d59fd9@redhat.com>
Date:   Wed, 30 Nov 2022 11:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/6] ov5693/int3472: Privacy LED handling changes + IPU6
 compatibility
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <CAHp75Vfvsefb8M-yZXxu18PQwnN7b0NgCSJKpQ4Qcdkv5Tu9-Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vfvsefb8M-yZXxu18PQwnN7b0NgCSJKpQ4Qcdkv5Tu9-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/22 11:03, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> The out of tree IPU6 driver has moved to using the in kernel INT3472
>> code for doing power-ctrl rather then doing their own thing (good!).
> 
> than
> 
>> Some of the IPU6 devices with a discrete INT3472 ACPI device have a
>> privacy-led GPIO. but no clk-enable GPIO. To make this work this series
>> moves the privacy LED control from being integrated with the clk-provider
>> to modelling the privacy LED as a separate GPIO. This also brings the
>> discrete INT3472 ACPI device privacy LED handling inline with the privacy
>> LED handling for INT3472 TPS68470 PMIC devices which I posted here:
>>
>> https://lore.kernel.org/platform-driver-x86/20221128214408.165726-1-hdegoede@redhat.com/
>>
>> This obsoletes my previous "[PATCH 0/3] platform/x86: int3472/discrete:
>> Make it work with IPU6" series:
>>
>> https://lore.kernel.org/platform-driver-x86/20221124200007.390901-1-hdegoede@redhat.com/
>>
>> Mauro since laptops with IPU6 cameras are becoming more and more
>> popular I would like to get this merged for 6.2 so that with 6.2
>> users will be able to build the out of tree IPU6 driver without
>> requiring patching their main kernel. I realize we are a bit
>> late in the cycle, but can you please still take the ov5693 patch
>> for 6.2 ? It is quite small / straight-forward and since it used
>> gpiod_get_optional() it is a no-op without the rest of this series.
>>
>> This series has been tested on:
>>
>> - Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
>> - Dell Latitude 9420, IPU 6 with privacy LED on front
>> - Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED,
> 
> Microsoft?

Ack.

>>                               back: ov8865 with privacy LED
> 
> I like this series! Minimum invasion and code.

I'm glad you like it and thank you for the review.

Regards,

Hans


