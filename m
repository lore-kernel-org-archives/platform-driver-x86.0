Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69775C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Oct 2022 15:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbiJQPh4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Oct 2022 11:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiJQPhz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Oct 2022 11:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6B85B509
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666021073;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ihwFO1ufJ6ThOa7cbAtQ7Hh72rGfJhNDxnZTu0nE5eI=;
        b=Is7BB22A1sGrkSO2aSEM79oZ8sGob6usYyyehoN7FVN5h8ZYUzvOL0xVXXLvSQzlvdLxHA
        fA7FeHlVsCFvMmtPTYDvKcTTxMks2+HLRpL4cfKU0tEgQteW7jjxSm9Kn9LdrhbdOgL6Mb
        kAUGRB6yt5bzWiym/4bR5jHZ7ZAty/M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-28NTYVCkNh2QJ9OFKJeMPg-1; Mon, 17 Oct 2022 11:37:52 -0400
X-MC-Unique: 28NTYVCkNh2QJ9OFKJeMPg-1
Received: by mail-ed1-f70.google.com with SMTP id l18-20020a056402255200b0045d2674d1a0so7116533edb.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 08:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihwFO1ufJ6ThOa7cbAtQ7Hh72rGfJhNDxnZTu0nE5eI=;
        b=vEOiI74BF1jT2Pep89gkt4PAw9B5akjcRT+FzUqqxsyI4YtJVywXOHTAXTnGMc7M89
         RA65dWh7z72wjtNQmyQlWVjXzF3EwkCjVpw2jR/YxsbAsN1/K2GESLH3pE8Fwh+wsGop
         TSNRCr9+wnx6U9kTY6IM20xfv6y6QNhjyMx1z2vagB3gu04uzl1R4P/Kapw0qDhli1wT
         JC+P38STLRKVulM3n8N6wwjaqfdLqf1Y7kguzt6n1lyub6nx8u5DNMmUG0tl9w9FN9Uj
         Cw5nc0u2t8XnAtqhIo9p2yWqr5uxepb3HThlfpIr7Ch/CgjJugWBpoPET7D6FcawVCzP
         jstA==
X-Gm-Message-State: ACrzQf1x00BKTy045sHt5WxTb+/88MZyE2SkrV1kRy9NFBwRG0xizMxW
        th3qqW+fHPSdTz1nnTTG48fPxA+td3BOLOqJCvCUtDN6LIrgu6Dx72/LkugEZhB85s4VyYa6iO6
        90z99HttK+rRolT3GKbmkilJV6P6tN/eU7w==
X-Received: by 2002:a17:906:1b49:b0:78d:b7b5:71cc with SMTP id p9-20020a1709061b4900b0078db7b571ccmr9001040ejg.536.1666021071131;
        Mon, 17 Oct 2022 08:37:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6nPCiEfue/gvNGIYuM0kVYEBFuMiJwa7eUjQ3A1d6l5K71C5fpZa5X4SDSbwwoHGTevAL9aA==
X-Received: by 2002:a17:906:1b49:b0:78d:b7b5:71cc with SMTP id p9-20020a1709061b4900b0078db7b571ccmr9001028ejg.536.1666021070889;
        Mon, 17 Oct 2022 08:37:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709062daa00b0077d37a5d401sm6326217eji.33.2022.10.17.08.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 08:37:50 -0700 (PDT)
Message-ID: <30603c5b-2dbd-32d6-00b0-023a5ff977ee@redhat.com>
Date:   Mon, 17 Oct 2022 17:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/1] Introduction of HP-BIOSCFG driver
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        platform-driver-x86@vger.kernel.org
References: <20221010162326.12957-1-jorge.lopez2@hp.com>
 <20221010162326.12957-2-jorge.lopez2@hp.com>
 <a50407fd-6969-9e9a-23a3-39879af639cd@amd.com>
 <CAOOmCE--qzRCOgpfpW5j5VmnCPExdTVDM9yQ-PcXrec76e492Q@mail.gmail.com>
 <d88e15ba-9e3f-310d-118b-7ccb2fbe1ca9@amd.com>
 <CAOOmCE9wVT=Fr72pgx58X4RMPy554MwZev3_8JtU8cBLdNpfhA@mail.gmail.com>
 <CAOOmCE9fuHTTVcSUSC0SU3N_ht8uVLg4hGUAJE7bJgs6UAt3gA@mail.gmail.com>
 <dbffc3c3-9fbf-8d7d-99a9-29d44671e7f2@amd.com>
 <f453562f-b87d-d754-0aaf-524575bc7f57@redhat.com>
 <CAOOmCE-E8SGmUVmajYqXFpza1p5mwTOJS2Z6a8Wxd4g=j92vkQ@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOOmCE-E8SGmUVmajYqXFpza1p5mwTOJS2Z6a8Wxd4g=j92vkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/17/22 17:20, Jorge Lopez wrote:
> Hi Hans,
> 
> On Mon, Oct 17, 2022 at 9:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 10/17/22 16:29, Limonciello, Mario wrote:
>>> FYI When you submit v3, you don't need to add "new patches on top" for your feedbacks to the new driver, they can roll into the patch introducing hp-cfg.  Just make sure you include a changelog under your cut line to indicate you changed these from vX->vY
>>>
>>> I suspect that Hans will also want you to split the driver up into smaller bite-size patches to make his review easier as well, but I'll let him advise how he wants it done.
>>>
>>> On 10/17/2022 09:11, Jorge Lopez wrote:
>>>> ''Hi Mario,
>>>>
>>>> Please see comments to previous source comments.
>>> <snip>
>>>
>>>>>> Thanks.  If you make this change for v2, I can make the matching change
>>>>>> in fwupd so that if it notices current_value permissions like this that
>>>>>> it shows read only there too.
>>>>>
>>>>> Submitted the recommended changes for review in v2
>>>>>
>>>
>>> Thanks, looks good.
>>>
>>>>> Submitted a patch to improve the friendly display name for
>>>>> few numbers of attributes associated with ‘Schedule Power-ON.’  BIOS
>>>>> assign names such ‘Tuesday’ to an attribute. The name is correct, but
>>>>> it is not descriptive enough for the user.  Under those
>>>>> conditions a portion of the path data value is appended to the attribute
>>>>> name to create a user-friendly display name.
>>>>>
>>>>> For instance, the attribute name is ‘Tuesday,’ and the display name
>>>>> value is ‘Schedule Power-ON – Tuesday’
>>>
>>> Looks good
>>>
>>>>>>>>
>>>>>>>> Presumably if this is going into it's own directory you should move all
>>>>>>>> platform-x86 HP drivers to this directory earlier in the series too.
>>>>
>>>> The other drivers named HP-WMI and HP_ACCEL  were written by third
>>>> party members and not by HP.   It is for this reason and because of
>>>> the number of files, only hp-bioscfg was placed in a separate
>>>> directory.   Let me know If my reasoning is not valid enough  and I
>>>> will keep the files in a separate directory and move the selection to
>>>> the main list.    In addition, Moving  HP-WMI and HP_ACCEL drivers
>>>> from x86 directories fall outside of the scope of these changes,
>>>> Correct?
>>>>
>>>
>>> There is no distinction who writes a driver.  I think either you keep this driver in the root of drivers/platform/x86 or you put all the HP drivers in drivers/platform/x86/hp.
>>>
>>> I think if you're going to put this driver in the sub-directory "hp", then the first patch in this series should be to move those drivers to that sub-directory.  The second patch should be to introduce your new driver.
>>
>> I see this driver has a lot of separate files, so what should happen here IMHO is:
>>
>> 1. a preparation patch adding a hp subdir moving the existing hp drivers there
> 
> This will be a separate patch but not an obstacle to gain approval of
> hp-bioscfg driver, correct?

Right, this is just shuffling things around a bit because as we get
more and more drivers having them all in one dir becomes a bit
unwieldly.

> 
>> 2. but this driver in a subdir of the hp subdir, so put all its files under:
>>
>> drivers/platform/x86/hp/hp-bioscfg
>>
>> so as to keep the files together and separate from other hp drivers.
> 
> Can you please clarify..
> 
> Do I need to start a new review with only two patches described earlier?
> 
> 1. a preparation patch adding a hp subdir moving the existing hp drivers there
> 2. Squash (current version v1 and v2 changes) into one

Ah, no, splitting step 2 as you did into multiple patches is fine,
reviewing multiple small patches typically also is easier. So keeping
the addition of the hp-bioscfg split into multiple patches is good.

The point which I was trying to make is to put all the files
for hp-bioscfg in their own sub-sub-dir and not mix them with
the other driver files in a single hp dir.

Regards,

Hans

