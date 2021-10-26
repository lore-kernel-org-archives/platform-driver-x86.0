Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9767EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 07:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7412160D43
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 07:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhJZH5r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 03:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45498 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233055AbhJZH5r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 03:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635234923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CKM4ZHMVNzPWAjQplTfZaVztzxcY6FyKLhDTL4NBYQ4=;
        b=XCqpqkDxAFllOIaD+7alCi8vkuEwKoJInav+CFi2IaaDMMDlbBGxbOjXalrWRj5KsqHTSA
        uNlCMHQObyUn3ytXmIcEb8AjwkP3r1+IvcvHIz/4wMhuanUp/7r4bt5jZUoJMS1bf/l4oL
        niwCgHHLWJ0uGygPyKvMvY5pmX2eMV4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-RMxOwNTKM9GLtYsC06XABQ-1; Tue, 26 Oct 2021 03:55:22 -0400
X-MC-Unique: RMxOwNTKM9GLtYsC06XABQ-1
Received: by mail-ed1-f72.google.com with SMTP id c25-20020a056402143900b003dc19782ea8so12331563edx.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Oct 2021 00:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CKM4ZHMVNzPWAjQplTfZaVztzxcY6FyKLhDTL4NBYQ4=;
        b=pkc40UukXaE81KkMhtURKwwM/c/xrNblTCcHiks7Vwllq3Z1c8bwG9bMERW+fgAUTl
         GppK5Aom5nASjcQGlhsfy728sYlLyE5UV/bJ3ZPJnBa/A0luJiTyW1uQTn+b0pERXHkN
         zNwAZbQTaaS5HChvwLTn5TLGTYtFcz/1jSmNEZIM5LLOK9aktz6sO+UQ06gWw+5WHxYm
         wlQwGuGFntRQlmalyzXFf8rW9UbxNNNMGnExKp1o32wyvPSOAcRnTmmhbAgwWr63yC4x
         o4SpC++v8fhOfHabKPbWpIdNrHIZmEwzYHWF86JJ+Zt6zyZ/ukdhpnVyPAJZ4n4hjlge
         zttQ==
X-Gm-Message-State: AOAM531oMunEV+M2LBTDKQVtnQwyH/7PzL3VHe8/SAwzD33VbuhxAMn7
        ujsG8vVfBT/r9xd2Da8oFbhhTTEh94odSxUjw1Riwe6MwtHaw/QG6U6gzKCNofIsRhthMJpjvf7
        nEodqsoqeJsmKJ06kclg5/SqpFv1bRQMXRw==
X-Received: by 2002:a05:6402:203:: with SMTP id t3mr34431965edv.69.1635234921078;
        Tue, 26 Oct 2021 00:55:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeUzcVftYemRv659bKFSre1PW0yZzztGsYMlMDGwg6Ha1O3GIjdjJw7XUFWNbbHmBkSvQDcQ==
X-Received: by 2002:a05:6402:203:: with SMTP id t3mr34431953edv.69.1635234920930;
        Tue, 26 Oct 2021 00:55:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k15sm8580157eje.37.2021.10.26.00.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:55:20 -0700 (PDT)
Message-ID: <d218bccf-2715-4e37-5c54-9dcd66f6d028@redhat.com>
Date:   Tue, 26 Oct 2021 09:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: Tree for Oct 25 (drivers/platform/x86/amd-pmc.c)
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <af7d7b8f-45fd-53c5-a8c4-1f594a16111e@infradead.org>
 <92c26aee-d3eb-258c-a0dd-e09783db6a20@redhat.com>
 <SA0PR12MB451081DCA2B973935FC1CF03E2839@SA0PR12MB4510.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <SA0PR12MB451081DCA2B973935FC1CF03E2839@SA0PR12MB4510.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 10/25/21 23:32, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Monday, October 25, 2021 16:29
>> To: Randy Dunlap <rdunlap@infradead.org>; Stephen Rothwell
>> <sfr@canb.auug.org.au>; Linux Next Mailing List <linux-
>> next@vger.kernel.org>; Limonciello, Mario <Mario.Limonciello@amd.com>
>> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; platform-
>> driver-x86@vger.kernel.org; S-k, Shyam-sundar <Shyam-sundar.S-
>> k@amd.com>
>> Subject: Re: linux-next: Tree for Oct 25 (drivers/platform/x86/amd-pmc.c)
>>
>> Hi,
>>
>> On 10/25/21 22:50, Randy Dunlap wrote:
>>> On 10/25/21 2:49 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> There seems to be something amiss with cnosole output in today's
>> release
>>>> (at least on my ppc qemu boot tests).
>>>>
>>>> Changes since 20211022:
>>>>
>>>
>>> on x86_64:
>>>
>>> ../drivers/platform/x86/amd-pmc.c: In function
>> ‘amd_pmc_verify_czn_rtc’:
>>> ../drivers/platform/x86/amd-pmc.c:428:30: error:
>> ‘CONFIG_RTC_SYSTOHC_DEVICE’ undeclared (first use in this function); did
>> you mean ‘CONFIG_RTC_HCTOSYS_DEVICE’?
>>>   rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
>>>                               ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>                               CONFIG_RTC_HCTOSYS_DEVICE
>>
>> Hmm, yes using either CONFIG setting is a problem since it is not always
>> defined. Both simply default to "rtc0" though and this is also which
>> standard distro configs use.
>>
>> Mario, can we just replace CONFIG_RTC_SYSTOHC_DEVICE with "rtc0"
>> here to fix this ?
>>
>> Regards,
>>
>> Hans
> 
> Shyam pointed me at this and I sent out a fix, but I think our emails just crossed paths.
> 
> Take a look at what I did, but if you would prefer to just hardcode it to 
> "rtc0" that is fine for me.

Just hardcoding it to "rtc0" saves us a #ifdef, so I slightly prefer that,
but if you believe it would be better to go with CONFIG_RTC_SYSTOHC_DEVICE
I'm fine with going with your fix.

Either way please let me know how you want to proceed with this.

Regards,

Hans

