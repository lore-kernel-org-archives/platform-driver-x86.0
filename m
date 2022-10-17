Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E42C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Oct 2022 14:37:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbiJQOhF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Oct 2022 10:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbiJQOhE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Oct 2022 10:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B72560CB4
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666017419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xSNRB493lfBWng7KOf9CgWT6gc4xqmgfQfVPWioGgc4=;
        b=DB3PguV9u9AhG9/hh/m8SKnjeEVBMEEn9+cP0XPw3XaQvlAB3BpOeCDj4UwNtTiHXwiAWm
        FCdajwy58KoOpmgP4LShyT5M1qZfsPvkT9Q9JfKZB4mOhatGeomd4X6HwOgYIRVhSqp64z
        sPqrDGUmuY0xMbxCGvjeqHDk/aujsc8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-ZUR9vdaVP6q4t25omRrGRg-1; Mon, 17 Oct 2022 10:36:58 -0400
X-MC-Unique: ZUR9vdaVP6q4t25omRrGRg-1
Received: by mail-ed1-f69.google.com with SMTP id v13-20020a056402348d00b0045d36615696so6268084edc.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 07:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSNRB493lfBWng7KOf9CgWT6gc4xqmgfQfVPWioGgc4=;
        b=1Ahn5HvQbaZJ7D8BnltrFtj9Iwnodwo21iCN8mftsyJ55hJHVFac0cmZOQMWzbeX/E
         Py2+szQDVu/J0PtKpvJkRWt+drBxZTs0sOCjV6TwJE/aW+5dLc4wwa/cs0SPG+607uCT
         J64oD+BBrgLgx5FsH5sZyRX6zYpowM7NWUf/Can0EFWS0ze0aT+clFBA04vHwxuZUEPi
         auBOFCmzYHFHPCcu2uTECEJe7+CEdRgadlm1HOjRdO9VAMx4sJ610iSPcRiTaO2088FM
         PKe8ZFTcYM64CvRwDqoVAp+9Fiz6381OWF1DDxUOWu8jEYRQh1sU8HWaRKXYEESCHy+r
         b5Cw==
X-Gm-Message-State: ACrzQf3e3n6goiecLQPysO38ftF57x67cmXhy3pR1zr1TZ0XIh02Xdtq
        B3a2EeRQan6+BiBedYYS8lS/V2L13iwrjHyDnkTWcBmbBGjCiyckwa9EsRcSEkyCec3DOSkaAmB
        CQun1brLYT2WyMVDUeNrnemDEIp+NOjlrDw==
X-Received: by 2002:a17:907:1b1f:b0:72f:56db:cce9 with SMTP id mp31-20020a1709071b1f00b0072f56dbcce9mr8567894ejc.605.1666017417205;
        Mon, 17 Oct 2022 07:36:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uZdoE4R70FZRdYgr+tAm1hX+dnEe2g7fdLjLbgNVFWN4VJZAH0BdVTlKksTU0g+2cNCfe2Q==
X-Received: by 2002:a17:907:1b1f:b0:72f:56db:cce9 with SMTP id mp31-20020a1709071b1f00b0072f56dbcce9mr8567879ejc.605.1666017417005;
        Mon, 17 Oct 2022 07:36:57 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b0078e0973d1f5sm5241005ejh.0.2022.10.17.07.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 07:36:56 -0700 (PDT)
Message-ID: <f453562f-b87d-d754-0aaf-524575bc7f57@redhat.com>
Date:   Mon, 17 Oct 2022 16:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/1] Introduction of HP-BIOSCFG driver
Content-Language: en-US
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221010162326.12957-1-jorge.lopez2@hp.com>
 <20221010162326.12957-2-jorge.lopez2@hp.com>
 <a50407fd-6969-9e9a-23a3-39879af639cd@amd.com>
 <CAOOmCE--qzRCOgpfpW5j5VmnCPExdTVDM9yQ-PcXrec76e492Q@mail.gmail.com>
 <d88e15ba-9e3f-310d-118b-7ccb2fbe1ca9@amd.com>
 <CAOOmCE9wVT=Fr72pgx58X4RMPy554MwZev3_8JtU8cBLdNpfhA@mail.gmail.com>
 <CAOOmCE9fuHTTVcSUSC0SU3N_ht8uVLg4hGUAJE7bJgs6UAt3gA@mail.gmail.com>
 <dbffc3c3-9fbf-8d7d-99a9-29d44671e7f2@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dbffc3c3-9fbf-8d7d-99a9-29d44671e7f2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/17/22 16:29, Limonciello, Mario wrote:
> FYI When you submit v3, you don't need to add "new patches on top" for your feedbacks to the new driver, they can roll into the patch introducing hp-cfg.  Just make sure you include a changelog under your cut line to indicate you changed these from vX->vY
> 
> I suspect that Hans will also want you to split the driver up into smaller bite-size patches to make his review easier as well, but I'll let him advise how he wants it done.
> 
> On 10/17/2022 09:11, Jorge Lopez wrote:
>> ''Hi Mario,
>>
>> Please see comments to previous source comments.
> <snip>
> 
>>>> Thanks.  If you make this change for v2, I can make the matching change
>>>> in fwupd so that if it notices current_value permissions like this that
>>>> it shows read only there too.
>>>
>>> Submitted the recommended changes for review in v2
>>>
> 
> Thanks, looks good.
> 
>>> Submitted a patch to improve the friendly display name for
>>> few numbers of attributes associated with ‘Schedule Power-ON.’  BIOS
>>> assign names such ‘Tuesday’ to an attribute. The name is correct, but
>>> it is not descriptive enough for the user.  Under those
>>> conditions a portion of the path data value is appended to the attribute
>>> name to create a user-friendly display name.
>>>
>>> For instance, the attribute name is ‘Tuesday,’ and the display name
>>> value is ‘Schedule Power-ON – Tuesday’
> 
> Looks good
> 
>>>>>>
>>>>>> Presumably if this is going into it's own directory you should move all
>>>>>> platform-x86 HP drivers to this directory earlier in the series too.
>>
>> The other drivers named HP-WMI and HP_ACCEL  were written by third
>> party members and not by HP.   It is for this reason and because of
>> the number of files, only hp-bioscfg was placed in a separate
>> directory.   Let me know If my reasoning is not valid enough  and I
>> will keep the files in a separate directory and move the selection to
>> the main list.    In addition, Moving  HP-WMI and HP_ACCEL drivers
>> from x86 directories fall outside of the scope of these changes,
>> Correct?
>>
> 
> There is no distinction who writes a driver.  I think either you keep this driver in the root of drivers/platform/x86 or you put all the HP drivers in drivers/platform/x86/hp.
> 
> I think if you're going to put this driver in the sub-directory "hp", then the first patch in this series should be to move those drivers to that sub-directory.  The second patch should be to introduce your new driver.

I see this driver has a lot of separate files, so what should happen here IMHO is:

1. a preparation patch adding a hp subdir moving the existing hp drivers there
2. but this driver in a subdir of the hp subdir, so put all its files under:

drivers/platform/x86/hp/hp-bioscfg

so as to keep the files together and separate from other hp drivers.

Note other then just skimming the comments I have not looked at this driver
at yet I will try to make time for this soon.

Mario, thank you for your review work on this.

Regards,

Hans



