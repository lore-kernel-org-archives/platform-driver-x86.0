Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1522EC00140
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Aug 2022 07:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237772AbiHLH7f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Aug 2022 03:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237191AbiHLH7e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Aug 2022 03:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04D08A74F6
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Aug 2022 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660291173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3RvF5pWYrL8i75lgH8FqFoKdJPGIuSdBy8DXLPObphE=;
        b=ev0JP6c+uApPo/6rJVCI9Q9IkR79bVTT51lTvhdIec13G09O74epQPm8VYleKcsm0PPa2E
        DA647iyiyRZC9A4NTrb+B6ahxsn4i8JFj+9scARrOedwBqMvawMk8ac4yyJBwbEWxct8VP
        XUH6hvzevqmJpn3xZrw03ypmdFd6aMk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-176-GX2GsgbROYKTzD8HRcCS5w-1; Fri, 12 Aug 2022 03:59:31 -0400
X-MC-Unique: GX2GsgbROYKTzD8HRcCS5w-1
Received: by mail-ej1-f70.google.com with SMTP id qk37-20020a1709077fa500b00730c2d975a0so146749ejc.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Aug 2022 00:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3RvF5pWYrL8i75lgH8FqFoKdJPGIuSdBy8DXLPObphE=;
        b=HexleELpa83JcQgiyJGetukKWORVT40b19RV4IVfnK5Ewi2Hzpfo9f3f198JydFgq8
         MWEF49li/aZGj4PwZvDmCMPpiCUnIzStk+rWqcvcpTeL576cLSFTcKzU6OkzfuV9m+5O
         +pde1urzlvIpnUM9HEP6BpmGktdcrzNGGEFRaR1PyZEPM7/UmwaDMXtBkHhkHAB8IkX8
         3SC6ElCt3lh13B+gSQf5mPUHofgqwAlNRGQ7mciVMHBB/sAumCPeNRkZO87rtFo+GPSb
         7ucHzYzyXIQFyBdqNFzajT6jiDOEMdLlsB4co/7oUKWA8AXTui+uq2o7Cy3SiEvUIpvY
         Q4KA==
X-Gm-Message-State: ACgBeo2LKxLWqbEvFgBS1e7zC0nzF+zuBYKjDgm0s6kGqNMxja0VBgiL
        ax1bcBLhi8Rql8udAx0+yimKWNrL+tJo1rud5XIIomfV3zI+CGlHUvCci6GsuAr4NVwXdBX73Hl
        CJ/OaZuW/6amRf7l9IhE099ZgcveSetaufw==
X-Received: by 2002:a50:fc85:0:b0:43d:2284:1ea5 with SMTP id f5-20020a50fc85000000b0043d22841ea5mr2502454edq.105.1660291170815;
        Fri, 12 Aug 2022 00:59:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ylWZrfEdgdeNKv4OAn0LsfX2/rAxp3DmCjtLF8pk+uJldB8HF5bFm0PEE2WhoBhXnIOy0UA==
X-Received: by 2002:a50:fc85:0:b0:43d:2284:1ea5 with SMTP id f5-20020a50fc85000000b0043d22841ea5mr2502445edq.105.1660291170658;
        Fri, 12 Aug 2022 00:59:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id op5-20020a170906bce500b0072b51fb36f7sm496391ejb.196.2022.08.12.00.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 00:59:29 -0700 (PDT)
Message-ID: <b287e98a-7880-5979-94a4-38715d448de4@redhat.com>
Date:   Fri, 12 Aug 2022 09:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 6/6] asus-wmi: Support the hardware GPU MUX on some
 laptops
Content-Language: en-US
To:     Luke Jones <luke@ljones.dev>
Cc:     andy.shevchenko@gmail.com, pobrn@protonmail.com, pavel@ucw.cz,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220809025054.1626339-1-luke@ljones.dev>
 <20220809025054.1626339-7-luke@ljones.dev>
 <7365d41a-1475-118c-96a8-6ab927bda5b7@redhat.com>
 <9ed62983bd03ed26cdb4399dd69b4096e8711fa9.camel@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9ed62983bd03ed26cdb4399dd69b4096e8711fa9.camel@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/12/22 00:01, Luke Jones wrote:
> Hi Hans,
> 
> On Thu, 2022-08-11 at 15:53 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 8/9/22 04:50, Luke D. Jones wrote:
>>> Support the hardware GPU MUX switch available on some models. This
>>> switch can toggle the MUX between:
>>>
>>> - 0, Dedicated mode
>>> - 1, Optimus mode
>>>
>>> Optimus mode is the regular iGPU + dGPU available, while dedicated
>>> mode switches the system to have only the dGPU available.
>>>
>>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>>
>> I see that you have replied to this that it needs more work.
>>
>> Besides it needing more work, ideally this should hook into
>> the existing vga-switcheroo mechanism for this. Can you take
>> a look at that please?
>>
>> I think this might be the first non GPU driver doing vga-
>> switcheroo stuff. So this may be something to discuss
>> on the dri-devel list.
> 
> I'm not sure how this would work. In typical ASUS fashion they do non-
> standard stuff. This switch is a basic toggle that requires a reboot to
> enable after writing to the ACPI method, after reboot the dGPU becomes
> the only visible GPU on the system and (this GPU) can not be suspended.
> 
> In short: it toggles the laptop from discrete-only mode, and optimus
> mode, requiring a reboot to switch.
> 
> From what I understand of switcheroo it is more to manage having dual
> (or more) GPU available during runtime, and manage the power states,
> offload etc.

Right, I did not realize this requires a reboot, that would be
something to mention in the Documentation bits accompanying the patch.

This is also a reason why it is good to have the docs update in
the same patch as adding the functionality, because the docs may
help with reviewing.

Anyways I agree that if this requires a reboot then using
the vga switcheroo stuff is not applicable. So we can just go with
a simple(ish) asus-wmi sysfs attribute.

> I have a vastly improved patch for this prepared now. Because of how
> the actual feature works (and the above explanation) it must be under
> the asus-nb-wmi sysfs (next to the dgpu_disable and egpu_enable toggles
> which are also unusual and non-standard work-arounds of Windows
> issues).

Ack, sounds good.

Regards,

Hans

