Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9AFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 08:51:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD828610A8
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 08:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbhJVIxX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Oct 2021 04:53:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37205 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231336AbhJVIxX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 04:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634892666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z3GDoQi/Q+cCcrsFFJcqOFTH6DISD5ySztmRn3je5dI=;
        b=FGLkC1K2qpv10aNEmgSa3cxmiLyz5nMXGwPH8r2jZPkRIhgbQbbWSnLonIu8jBSKqrOIF2
        CZdiNzTXKDiGQdjUhSMSwBoNLHNhm2NbGG3py2CwpHkZpzful4+XXZscumrI30MX2hLMbj
        iicYAcroxTe6c1QAlriZfhOyB9DmIEY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-IN_57l4uMlK8l4kHsC9YpA-1; Fri, 22 Oct 2021 04:51:04 -0400
X-MC-Unique: IN_57l4uMlK8l4kHsC9YpA-1
Received: by mail-ed1-f71.google.com with SMTP id z20-20020a05640240d400b003dce046ab51so3007563edb.14
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Oct 2021 01:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z3GDoQi/Q+cCcrsFFJcqOFTH6DISD5ySztmRn3je5dI=;
        b=IHEvwzjMkISp5TfBt97mEbCXsMV/+GIazVWcfAgvLJM2/coyaXGOgXAPJAuoOZkWil
         jPtJe+CvUsFMxhcFJaAx6NXZQQ981+3VAvhlzFzSiV14WxzD3fYp0OJSwckzGt604JrY
         aH1ZRI8qZh1CZnS9bKAUiyGORXkh9y37hg2zN6bQ1VrNUgIbS8/Ie40D838raLGFa+Su
         47eXJOshG/nePpm93x98mPQV2h4YGXrAODzM4mevUIQ3+0VaYdtp3MTsc072LKB/3QGH
         uDFCITxAAijrEFlQeVCPZjl8ABhqA2zF6FHQfiaGiJ/I48et7Gbc6+Bj3blxHic+yh4p
         9RFA==
X-Gm-Message-State: AOAM530p8fSXog2/V9og0lNJ1QsXYoD9aspoEeT6sPGoAVLbZHgg0cqw
        S9U7Hj9xz2f4/4f9FRo0+02fM1DkgjKmj/B4oOIHtGt1YPh2Ck3FvJFe5DZPWVp6Ny91x/y3ZQw
        35d/mxcczJ7tJomE1TuGeJS5fGCvrKy82Qw==
X-Received: by 2002:a17:906:2994:: with SMTP id x20mr9178878eje.417.1634892663398;
        Fri, 22 Oct 2021 01:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3LUNk/pzJ4zatQIis3+ekWdBtpMTEdQF4NYGkiWx1h1Yulqz7pxaNeNkg4hdsaeDrorPvMg==
X-Received: by 2002:a17:906:2994:: with SMTP id x20mr9178857eje.417.1634892663161;
        Fri, 22 Oct 2021 01:51:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m15sm4048298edv.45.2021.10.22.01.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 01:51:02 -0700 (PDT)
Message-ID: <ff8b1f12-5123-324d-a8dd-2161c04cafad@redhat.com>
Date:   Fri, 22 Oct 2021 10:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] platform/x86: amd-pmc: Store the pci_dev instance
 inside struct amd_pmc_dev
Content-Language: en-US
To:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        Shyam-sundar.S-k@amd.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211021092938.196933-1-Sanket.Goswami@amd.com>
 <f903b9d5-0477-1618-6596-b6039b56a5af@redhat.com>
 <7714d522-36b4-47bd-332c-c4ff5eeb1237@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7714d522-36b4-47bd-332c-c4ff5eeb1237@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Sanket,

On 10/22/21 08:55, Goswami, Sanket wrote:
> Hi Hans,
> 
> On 21-Oct-21 23:48, Hans de Goede wrote:
>> [CAUTION: External Email]
>>
>> Hi,
>>
>> On 10/21/21 11:29, Sanket Goswami wrote:
>>> Store the root port information in amd_pmc_probe() so that the
>>> information can be used across multiple routines.
>>>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> ---
>>> Changes in v2:
>>> - Store the rdev info in amd_pmc_probe() as suggested by Hans.
>>
>> Thank you, but there are still some issues, see below.
>>
>>
>>>  drivers/platform/x86/amd-pmc.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>>> index 55f14bdfdbfd..502f37eaba1f 100644
>>> --- a/drivers/platform/x86/amd-pmc.c
>>> +++ b/drivers/platform/x86/amd-pmc.c
>>> @@ -119,6 +119,7 @@ struct amd_pmc_dev {
>>>       u16 minor;
>>>       u16 rev;
>>>       struct device *dev;
>>> +     struct pci_dev *rdev;
>>>       struct mutex lock; /* generic mutex lock */
>>>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>>>       struct dentry *dbgfs_dir;
>>> @@ -482,6 +483,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>>               return -ENODEV;
>>>       }
>>>
>>> +     dev->rdev = rdev;
>>>       dev->cpu_id = rdev->device;
>>>       err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
>>>       if (err) {
>>> @@ -512,7 +514,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>>       }
>>>
>>>       base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
>>> -     pci_dev_put(dev->rdev);
>>
>> The current code here actually reads:
>>
>>         pci_dev_put(rdev);
>>
>> Note (rdev) not (dev->rdev). I don't know what you based this on, this is weird.
> 
> rdev is already retrieved before doing this:
> 	     pci_dev_put(dev->rdev);
> 
> i.e.
> in amd_pmc_probe()
> 
> rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> 	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
> 		pci_dev_put(rdev);
> 		return -ENODEV;
> 	}
> 
> after this I am storing rdev in "dev->rdev"
> i.e.
> dev->rdev = rdev;
> 
> after this I am using "dev->rdev" at places where "rdev" was getting used earlier.
> Do you see any problem?

What I was trying to say is that the patch does not apply, because it is
trying to remove the pci_put_dev() line from a block of code like this:

	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
	pci_dev_put(dev->rdev);
	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);

But the actual code in platform-drivers-x86/review-hans (and for-next too) has:

	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
	pci_dev_put(rdev);
	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);



After your patch using dev->rdev instead of just rdev is fine
(but please be consistent, which would mean use just rdev everywhere).

But your patch is removing a line which does not exist in that form,
IOW it is based on some intermediate version of amd-pmc.c and not
on the HEAD of platform-drivers-x86/review-hans.

Regards,

Hans






> 
>>
>> Also there are a bunch of error-exits from amd_pmc_probe() which not all
>> need a "pci_dev_put(rdev)" added to them before there "return ERROR;"
>> statement.
>>
>> It would be best to add:
>>
>> err_pci_dev_put:
>>         pci_dev_put(rdev);
>>         return err;
>>
>> Add the end off the function (after the return 0;) and replace all
>> "return FOO" error-exits with:
>>
>>                 err = <FOO>;
>>                 goto err_pci_dev_put;
>>         }
>>
> Thank you, will take it as a separate patch in v3.
> 
> 
> Thanks,
> Sanket
> 

