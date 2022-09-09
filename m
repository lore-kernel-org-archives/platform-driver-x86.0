Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B90ECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Sep 2022 19:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiIITUj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Sep 2022 15:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiIITUh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 15:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5190CA3D0D
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Sep 2022 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662751235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z80GBq+4p3RaBX9sDJUAwZlDncGLxsS7IqijyE03ut0=;
        b=Vt5kAtmMruxFlaEqgfqUaYpVgYEAnBTcjFpapUyqqXJI4OV9rpQOksdpPuHC7C5U4NM4Di
        cbG3V46F9If60tna60QNc+YY7Q86xY0VDUpzcqhTPc1p6lQr2y/LFjvjHMFi3dYeatWFgU
        vME8NCugBrcTt65xgP/vdR0wX7Yz6dw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-65yfcttOM-uuaweI2mj8-A-1; Fri, 09 Sep 2022 15:20:33 -0400
X-MC-Unique: 65yfcttOM-uuaweI2mj8-A-1
Received: by mail-ed1-f72.google.com with SMTP id f14-20020a0564021e8e00b00448da245f25so1896612edf.18
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Sep 2022 12:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=z80GBq+4p3RaBX9sDJUAwZlDncGLxsS7IqijyE03ut0=;
        b=LelGPmCshQNvHiGlp8NMlbN5AVOuU1h08yfTCA4467TtNO+mQjt0EX3ejM+REkFr4l
         VpIAuHOdL3t8Iqz2CiO866ZUpeAhWPTUhRahYcU+ReeHbpbOpyU2+PQ1FXQHbbnDiKn9
         BChNzoZIL25ko7VhowmjtTD/Fmy+82XJKPBY0/BdR2iEMRDOjxlKdWHvariRRnpx5CjA
         F5H5GxCwhNVFucHftwEFvo/yYrLT5N3BYgTlliOMp/KAtdoqTQ0EaSNyCopHgWiXXEu5
         8Jv2ta0HZ1d2eDKL5iG3EgqzMdITFAvaDBxbVgTo8prek8LXPfyQmMZ1Hp/I8evKJr6D
         Mr3Q==
X-Gm-Message-State: ACgBeo2MXxlFd2sBQyjmVY+9M2UCAq7ZwSpn/J9kTMr+NAA4yeeDEx/q
        9Fv67PDAxRoZ+ahJy6oXZnAoR7r33qcJ7p0Vaoz4PxMMGyYnp4ik32+qtNvTH4Lya5p+ElMvECx
        Xs9s0zgwM88Poqn2DxndYu1/Y84jr+VHxlA==
X-Received: by 2002:a17:907:6d8c:b0:731:6c60:eced with SMTP id sb12-20020a1709076d8c00b007316c60ecedmr11032959ejc.266.1662751232897;
        Fri, 09 Sep 2022 12:20:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5unqrp65eTppxFrO3LmvqOIkTTKQKCAMZkgaDyAaBNUvBuMdMwXk0sdWR8vGtcvIW6r7EGpg==
X-Received: by 2002:a17:907:6d8c:b0:731:6c60:eced with SMTP id sb12-20020a1709076d8c00b007316c60ecedmr11032948ejc.266.1662751232717;
        Fri, 09 Sep 2022 12:20:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id h19-20020a1709063b5300b0074134543f82sm648713ejf.90.2022.09.09.12.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 12:20:32 -0700 (PDT)
Message-ID: <0a3cc313-2f7d-ed99-392f-92cad2838a1d@redhat.com>
Date:   Fri, 9 Sep 2022 21:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drivers/platform: toshiba_acpi: Call
 HCI_PANEL_POWER_ON on resume on some models
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20220909153239.34606-1-hdegoede@redhat.com>
 <ee77aadf-8adc-c812-55ae-c534fb523de5@vorpal.se>
 <cc8ae460-9ebd-6c47-a938-eb515ce42104@redhat.com>
 <de8a1f37-414d-3a06-0b56-54b0daa4a250@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <de8a1f37-414d-3a06-0b56-54b0daa4a250@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/9/22 20:32, Arvid Norlander wrote:
> Hi,
> 
> On 2022-09-09 19:42, Hans de Goede wrote:
>> Hi,
>>
>> On 9/9/22 19:29, Arvid Norlander wrote:
>>> Hi,
>>>
>>> Given the changes, do you want me to test this again? If so, on what branch?
>>
>> I have just pushed this new version + all your pending toshiba_acpi patches
>> to my review-hans branch:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans\
>>
>> If you can give this branch a quick test and let me know if everything works
>> as expected that would be great.
> 
> My changes (battery charge threshold, fan HWMON support, ECO LED work as
> expected.
> 
> Display does come on after resume. Unfortunately the computer also
> completely locks up (I can't even switch from X to a VT). SSH is dead.
> When I suspend with a VT active the cursor is no longer blinking on resume.
> So something else is severly broken in this version and I cannot fully test
> this.
> 
> I notice your tree is based on rc1. I was previously testing with 5.19 as
> well as rc2 and newer. Is it possible this is a bug from mainline?

Ah yes, sorry about that. There is a scsi bug which causes any sata
disks to become inaccessible after suspend/resume in rc1.

If you cherry pick this commit on top of my tree the problem should be gone:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=785538bfdd682c8e962341d585f9b88262a0475e

> Or is
> it something introduced by your tree? I'm wondering it it would be easier
> to first rebase your tree on the latest RC rather than trying to bisect it
> as is.
> 
> Or the easiest test is perhaps: Does suspend and resume with this tree work
> on your computer? I remember hearing that there were SATA issues in early
> 6.0-rcs (don't remember the details), the Toshiba uses mSATA.

Right, see above.

Regards,

Hans

