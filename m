Return-Path: <SRS0=7IVD=DP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FF5C4363A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 15:18:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61BD420782
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 15:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqtx8uMy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbgJHPSF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Oct 2020 11:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730550AbgJHPSF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Oct 2020 11:18:05 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3AFC061755;
        Thu,  8 Oct 2020 08:18:05 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l16so6238756eds.3;
        Thu, 08 Oct 2020 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HaUjiwWIcQ+hNrtAd+gLYowEZL3sz2AKFA9C75NfuwE=;
        b=fqtx8uMyXjMNEgAsv3rbeqLRvkUlTtn6XvDlheS5+5ZjRqsnIsVqHp4jAhYoeUNQ9c
         1xikYr8kqDtbf4UKT/c5bsRdLz6CZziw7ATpVXKniU1/qtoS5YPOzeIFLpMDoVpurr70
         czUJJv8qiXiiB6uBAqdL30TeGIY7ZnZhXuvc+LEJt2329CqTJtpSxBZsRij0sj/XLhYF
         5z39fQeumC2woPlXPvVOPaG5vI8J5/lryB1BTb8LYd2qgoYGFbHDtuk8BU4P89Rrohug
         ity1QwWSRWbi7b6wVjXBE79C2mxH1Iqh9Xi07mKojP7XhdRKWhPkZ0/lL0PILQ/ycRYR
         aF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HaUjiwWIcQ+hNrtAd+gLYowEZL3sz2AKFA9C75NfuwE=;
        b=JPRdJplEzhgHCxOAG4cb7Zul8LVbbTSIdPVoZc1Ni1CkuuP/ST/3tHkIz3BALMrSMR
         +mq37UntDQT1pSwd40sFP3DLeG/0Ez8f61vd+RPpE9hnyBHtBI5O8XH8S4bigKquBdc/
         4mYNVpFnmLi78R0+zwR30dOLRTfkaFrMbJKJ/gI1x8tN7XQca7U8nit+cOHInZVYQipj
         vUByKa14Rg+0N5ggJ+GSr4myyH9RMv0l0MR3Typ6mWkyrRpKbi5hcTyXdH+82yW8kMbR
         Tyz027EeZLdfZOQezBVPNkjGMZmleHwNDc2Vs0tJ5wLvMnU4TuENqu9fMhbQC4y+NTbE
         +rTA==
X-Gm-Message-State: AOAM531RGZiypNpg56ib08CAVbStIZEVBR0mIBLDDW56lk52PNW+H8lL
        HBej69nD7KAuKa1XJoJr4oWA3/HtT0o=
X-Google-Smtp-Source: ABdhPJxyfwaN4HTUW2Vgtn4iV8oluCYmuKlOQIOwqz5bzn40dj7KgA6cu8yzME0sMnokhxbsiARnFA==
X-Received: by 2002:a05:6402:32f:: with SMTP id q15mr9598050edw.230.1602170283396;
        Thu, 08 Oct 2020 08:18:03 -0700 (PDT)
Received: from [192.168.2.202] (pd9e5a9e4.dip0.t-ipconnect.de. [217.229.169.228])
        by smtp.gmail.com with ESMTPSA id y3sm4470691ejk.92.2020.10.08.08.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 08:18:02 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] platform: Add Surface platform directory
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        Stephen Just <stephenjust@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201008143455.340599-1-luzmaximilian@gmail.com>
 <20201008143455.340599-2-luzmaximilian@gmail.com>
 <CAHp75Vd61qnLMUbted_ohqEtMdVFbqKhKf3kKh0ombAwhf8dCA@mail.gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <9711c3c9-63ed-8c9f-b77b-d1feb2c07f78@gmail.com>
Date:   Thu, 8 Oct 2020 17:18:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd61qnLMUbted_ohqEtMdVFbqKhKf3kKh0ombAwhf8dCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/8/20 4:52 PM, Andy Shevchenko wrote:
> On Thu, Oct 8, 2020 at 5:35 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>>
>> It may make sense to split the Microsoft Surface hardware platform
>> drivers out to a separate subdirectory, since some of it may be shared
>> between ARM and x86 in the future (regarding devices like the Surface
>> Pro X).
>>
>> Further, newer Surface devices will require additional platform drivers
>> for fundamental support (mostly regarding their embedded controller),
>> which may also warrant this split from a size perspective.
>>
>> This commit introduces a new platform/surface subdirectory for the
>> Surface device family, with subsequent commits moving existing Surface
>> drivers over from platform/x86.
>>
>> A new MAINTAINERS entry is added for this directory. Patches to files in
>> this directory will be taken up by the platform-drivers-x86 team (i.e.
>> Hans de Goede and Mark Gross) after they have been reviewed by
>> Maximilian Luz.
> 
> Thanks for the patch, my minor comments below.
> 
> ...
> 
>> +MICROSOFT SURFACE PLATFORM DRIVERS
> 
> (1)
> 
>> +M:     Hans de Goede <hdegoede@redhat.com>
>> +M:     Mark Gross <mgross@linux.intel.com>
>> +M:     Maximilian Luz <luzmaximilian@gmail.com>
>> +L:     platform-driver-x86@vger.kernel.org
>> +S:     Maintained
> 
>> +T:     git git://git.infradead.org/linux-platform-drivers-x86.git
> 
> It's now on kernel.org.
> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git

Thank you, will update this. FYI: The entry was mostly copied from the
X86 PLATFORM DRIVERS entry, so it should probably be updated there, too.

>> +F:     drivers/platform/surface/
> 
>> @@ -9,3 +9,4 @@ obj-$(CONFIG_MIPS)              += mips/
>>   obj-$(CONFIG_OLPC_EC)          += olpc/
>>   obj-$(CONFIG_GOLDFISH)         += goldfish/
>>   obj-$(CONFIG_CHROME_PLATFORMS) += chrome/
>> +obj-$(CONFIG_SURFACE_PLATFORM) += surface/
> 
> (2)
> 
>> +menuconfig SURFACE_PLATFORM
> 
> (3a)
> 
>> +if SURFACE_PLATFORM
> 
> (3b)
> 
>> +endif # SURFACE_PLATFORM
> 
> (3c)
> 
> I think in (1), (2) and (3) it makes sense to mimic Chrome, i.e. use
> plural: PLATFORMS.

I agree with (2) and (3), but I'm not so sure about (1). For Chrome, the
entry is CHROME HARDWARE PLATFORM SUPPORT, so should I change it to
MICROSOFT SURFACE HARDWARE PLATFORM SUPPORT?

Thanks,
Max
