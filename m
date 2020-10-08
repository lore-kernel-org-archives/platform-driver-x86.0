Return-Path: <SRS0=7IVD=DP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F274C2BD0C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 19:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C58A0221FE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 19:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZOhME7pd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbgJHTne (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Oct 2020 15:43:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22585 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728806AbgJHTne (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Oct 2020 15:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602186212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NOtFHzdgOPYEPQlpsFHGlFvhk+BmuqanWqZYZHmYBJ4=;
        b=ZOhME7pdSpml+cznn8821LrxOwS60jN3dVAeMpHx/ZrV6X3/RheiEOkgwBbaPDmfOCqgq0
        IKzaujcepjRKuP1LNnCpAccRSbxVWyRUXXpNFGWuuyP88obHr51VoJygtlDYf+8nyovyHA
        LIfJpoUBTi9KlU6Vq3GbnRZHGnR2PL8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-O96yMDq0NQqnSEXS8_cE7A-1; Thu, 08 Oct 2020 15:43:30 -0400
X-MC-Unique: O96yMDq0NQqnSEXS8_cE7A-1
Received: by mail-ej1-f72.google.com with SMTP id d13so2630798ejz.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2020 12:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NOtFHzdgOPYEPQlpsFHGlFvhk+BmuqanWqZYZHmYBJ4=;
        b=XVojbLvttW7ghHCHFUQJcJedl6j/mkPyYFcrozy4cvPHnkg1vXpmt0deNL8dmzNvRt
         yIVfUgQMq5y6W+D4kRzN6bAgc585K9KJvh4YBHNa6IxfgOllfPI/2nCGEBahFlzN07KN
         QquDkjSgf3xVzkmUNg4JcM5bmAzoN1uKRpViXf4oRg5Jlsotp3Ev3e3XZZJKd+hQoQ/x
         Yr+vSANPG40X3dFy7fSdUdtYhPMGBvLY6Zm1T0Qt1C9V0tVz+yMCPVnUyq3c32Ji/YbF
         80r24YcrEauFkgv7+dBkXy9/RUQQ1dMAtY5L/LJvDCghtxMg+dmunuPCGZpd4zTy8qfU
         YnlA==
X-Gm-Message-State: AOAM530Pd6GncQ0D7JDKwsbhN9y0n+cUr+bNXDIlxHRANZVsbvac/X/i
        Cc9zx81oXdrHfb/iGkPz4ZdU80VKnZADSMIDqmf7U9mXqCxlqnWc+mx0Lozo+rHiJEMmxONeskn
        r8WPFV98ujwZCsFjoKz0r0AAculcn4VYAWg==
X-Received: by 2002:a17:906:5613:: with SMTP id f19mr10253868ejq.441.1602186209032;
        Thu, 08 Oct 2020 12:43:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZD/2+q+cwyMjqyHZTVAEzHh9PzliQ1g6A79cs0ikR6wi+vFb7Sl1H62w4QH+L0aTf2IXAew==
X-Received: by 2002:a17:906:5613:: with SMTP id f19mr10253856ejq.441.1602186208806;
        Thu, 08 Oct 2020 12:43:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f20sm4668479ejc.90.2020.10.08.12.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 12:43:28 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] platform: Add Surface platform directory
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
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
 <9711c3c9-63ed-8c9f-b77b-d1feb2c07f78@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a76d53a7-4489-fac2-443b-2dfccc2ea802@redhat.com>
Date:   Thu, 8 Oct 2020 21:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9711c3c9-63ed-8c9f-b77b-d1feb2c07f78@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/8/20 5:18 PM, Maximilian Luz wrote:
> On 10/8/20 4:52 PM, Andy Shevchenko wrote:
>> On Thu, Oct 8, 2020 at 5:35 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>>>
>>> It may make sense to split the Microsoft Surface hardware platform
>>> drivers out to a separate subdirectory, since some of it may be shared
>>> between ARM and x86 in the future (regarding devices like the Surface
>>> Pro X).
>>>
>>> Further, newer Surface devices will require additional platform drivers
>>> for fundamental support (mostly regarding their embedded controller),
>>> which may also warrant this split from a size perspective.
>>>
>>> This commit introduces a new platform/surface subdirectory for the
>>> Surface device family, with subsequent commits moving existing Surface
>>> drivers over from platform/x86.
>>>
>>> A new MAINTAINERS entry is added for this directory. Patches to files in
>>> this directory will be taken up by the platform-drivers-x86 team (i.e.
>>> Hans de Goede and Mark Gross) after they have been reviewed by
>>> Maximilian Luz.
>>
>> Thanks for the patch, my minor comments below.
>>
>> ...
>>
>>> +MICROSOFT SURFACE PLATFORM DRIVERS
>>
>> (1)
>>
>>> +M:     Hans de Goede <hdegoede@redhat.com>
>>> +M:     Mark Gross <mgross@linux.intel.com>
>>> +M:     Maximilian Luz <luzmaximilian@gmail.com>
>>> +L:     platform-driver-x86@vger.kernel.org
>>> +S:     Maintained
>>
>>> +T:     git git://git.infradead.org/linux-platform-drivers-x86.git
>>
>> It's now on kernel.org.
>> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> 
> Thank you, will update this. FYI: The entry was mostly copied from the
> X86 PLATFORM DRIVERS entry, so it should probably be updated there, too.

That is a good point I've pushed a commit fixing this to the for-next
branch of: git://git.infradead.org/linux-platform-drivers-x86.git

Please base the next version of this patch-set on top of that.

Regards,

Hans



> 
>>> +F:     drivers/platform/surface/
>>
>>> @@ -9,3 +9,4 @@ obj-$(CONFIG_MIPS)              += mips/
>>>   obj-$(CONFIG_OLPC_EC)          += olpc/
>>>   obj-$(CONFIG_GOLDFISH)         += goldfish/
>>>   obj-$(CONFIG_CHROME_PLATFORMS) += chrome/
>>> +obj-$(CONFIG_SURFACE_PLATFORM) += surface/
>>
>> (2)
>>
>>> +menuconfig SURFACE_PLATFORM
>>
>> (3a)
>>
>>> +if SURFACE_PLATFORM
>>
>> (3b)
>>
>>> +endif # SURFACE_PLATFORM
>>
>> (3c)
>>
>> I think in (1), (2) and (3) it makes sense to mimic Chrome, i.e. use
>> plural: PLATFORMS.
> 
> I agree with (2) and (3), but I'm not so sure about (1). For Chrome, the
> entry is CHROME HARDWARE PLATFORM SUPPORT, so should I change it to
> MICROSOFT SURFACE HARDWARE PLATFORM SUPPORT?
> 
> Thanks,
> Max
> 

