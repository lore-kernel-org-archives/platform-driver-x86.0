Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4431C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 08:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbiKOI34 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 03:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbiKOI3z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 03:29:55 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09586D9B
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 00:29:54 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NBK592V6ZzqSQF;
        Tue, 15 Nov 2022 16:26:05 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 16:29:51 +0800
Message-ID: <d2dbd5f6-eec2-4e6b-60c2-d67aff1af73f@huawei.com>
Date:   Tue, 15 Nov 2022 16:29:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] x86/platform/intel/iosf_mbi: Fix error handling in
 iosf_mbi_init()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     <dvhart@infradead.org>, <andy@infradead.org>, <tglx@linutronix.de>,
        <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
        <x86@kernel.org>, <hpa@zytor.com>, <david.e.box@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <wsa@kernel.org>,
        <hdegoede@redhat.com>, <rafael.j.wysocki@intel.com>,
        <platform-driver-x86@vger.kernel.org>
References: <20221115073636.25412-1-yuancan@huawei.com>
 <CAHp75VfOP=TVL95=LzabQGzf4N3uXHi7KvwH4a_4Ez=vjzL9aQ@mail.gmail.com>
From:   Yuan Can <yuancan@huawei.com>
In-Reply-To: <CAHp75VfOP=TVL95=LzabQGzf4N3uXHi7KvwH4a_4Ez=vjzL9aQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/11/15 16:26, Andy Shevchenko 写道:
> On Tue, Nov 15, 2022 at 9:38 AM Yuan Can <yuancan@huawei.com> wrote:
>> A problem about modprobe iosf_mbi failed is triggered with the following
>> log given:
>>
>>   debugfs: Directory 'iosf_sb' with parent '/' already present!
>>
>> The reason is that iosf_mbi_init() returns pci_register_driver()
>> directly without checking its return value, if pci_register_driver()
>> failed, it returns without removing debugfs, resulting the debugfs of
>> iosf_sb can never be created later.
>>
>>   iosf_mbi_init()
>>     iosf_mbi_dbg_init() # create debugfs
>>     pci_register_driver()
>>       driver_register()
>>         bus_add_driver()
>>           priv = kzalloc(...) # OOM happened
>>     # return without remove debugfs and destroy workqueue
>>
>> Fix by remove debugfs and iosf_mbi_pm_qos when pci_register_driver()
> removing
>
>> returns error.
>>   static int __init iosf_mbi_init(void)
>>   {
>> +       int ret;
>> +
>>          iosf_debugfs_init();
>>
>>          cpu_latency_qos_add_request(&iosf_mbi_pm_qos, PM_QOS_DEFAULT_VALUE);
>>
>> -       return pci_register_driver(&iosf_mbi_pci_driver);
>> +       ret = pci_register_driver(&iosf_mbi_pci_driver);
>> +       if (ret) {
>> +               cpu_latency_qos_remove_request(&iosf_mbi_pm_qos);
>> +               iosf_debugfs_remove();
>> +       }
>> +
>> +       return ret;
>>   }
> Can we rewrite it as
>
>    if (ret)
>      goto err_remove;
>
>    return 0;
>
> err_remove:
>    ...
>    return ret;
>
> ?
Thanks for these suggestions! will be changed in the next version.

-- 
Best regards,
Yuan Can

