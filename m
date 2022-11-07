Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9755C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 15:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbiKGPCt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 10:02:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbiKGPCX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 10:02:23 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698061EAFC
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 07:02:07 -0800 (PST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N5Z9Z72sJzpW7g;
        Mon,  7 Nov 2022 22:58:26 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 23:02:05 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 23:02:04 +0800
Subject: Re: [PATCH] platform/x86: asus-tf103c-dock: fix possible memory leak
 in tf103c_dock_probe()
To:     Hans de Goede <hdegoede@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        <acpi4asus-user@lists.sourceforge.net>
CC:     <corentin.chary@gmail.com>, <yangyingliang@huawei.com>
References: <20221029062759.2581143-1-yangyingliang@huawei.com>
 <7123941b-1e71-f31c-b635-8f8f89f75ee9@redhat.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <4794ccf4-051c-8b1f-07ac-9696632d058c@huawei.com>
Date:   Mon, 7 Nov 2022 23:02:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7123941b-1e71-f31c-b635-8f8f89f75ee9@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2022/11/7 22:28, Hans de Goede wrote:
> Hi Yang,
>
> On 10/29/22 08:27, Yang Yingliang wrote:
>> If hid_add_device() returns error, it should call hid_destroy_device()
>> to free the hid which is allocated in hid_allocate_device().
>>
>> Fixes: 0a6509b0926d ("platform/x86: Add Asus TF103C dock driver")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/platform/x86/asus-tf103c-dock.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
>> index 62310e06282b..f81d58dfd322 100644
>> --- a/drivers/platform/x86/asus-tf103c-dock.c
>> +++ b/drivers/platform/x86/asus-tf103c-dock.c
>> @@ -850,8 +850,10 @@ static int tf103c_dock_probe(struct i2c_client *client)
>>   	strscpy(dock->hid->phys, dev_name(dev), sizeof(dock->hid->phys));
>>   
>>   	ret = hid_add_device(dock->hid);
>> -	if (ret)
>> +	if (ret) {
>> +		hid_destroy_device(dock->hid);
>>   		return dev_err_probe(dev, ret, "adding hid dev\n");
>> +	}
> hid_destroy_device() is already called by tf103c_dock_non_devm_cleanup()
> which is registered early on as a cleanup handler through
> devm_add_action_or_reset().
Thanks for correcting me.

Yang
>
> Regards,
>
> Hans
>
>
> .
