Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB3EC2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 18:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D670F2222F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 18:54:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ddrZU9mc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgKLSyl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Nov 2020 13:54:41 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3919 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgKLSyl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Nov 2020 13:54:41 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fad84eb0000>; Thu, 12 Nov 2020 10:54:35 -0800
Received: from [10.20.23.185] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Nov
 2020 18:54:39 +0000
Subject: Re: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when
 no GUID is found
To:     Hans de Goede <hdegoede@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        <mario.limonciello@dell.com>, <pobrn@protonmail.com>
CC:     <andy@infradead.org>, <dvhart@infradead.org>,
        <aplattner@nvidia.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20200731202154.11382-1-ddadap@nvidia.com>
 <20200731202154.11382-2-ddadap@nvidia.com>
 <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <1141e8b4-4055-64e6-f2e1-3f68de584b46@nvidia.com>
Date:   Thu, 12 Nov 2020 12:54:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605207275; bh=s/prqFlO8HXtMAP9Z0ufAJoMJhcVnZiAiUi8augczEM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=ddrZU9mcJ1PYM0NjecXxAfSPAXEM6FyvhF8/uZ0lx4yP31ak9BHO3KDK2alQWe0gF
         ++LuOuVOxL5ctN8OF+P1NMNmNo3dFkLapqFR3c76bVGex39QR1vRv7XgbrgAjAZyZE
         L9zv1fWj51Hht3HobuCc0SXkU9wrs9c2sEpz0by4v8B7hF33tA7DqniEJEqLTmzysY
         oI8TSK78SnJKusASt51/hIIkNj9i/CC4+0G8LQpD4WaUPoYzUSpk4IkMqbEFpgF4uS
         QdlLNY+2LjPjl6FeWxnJKe+kFng6h9A61OXn4Qbto7WhsGQTz4CcNCy5PM6ZIZhf4n
         vteZcsY7/XPeg==
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 11/10/20 3:34 AM, Hans de Goede wrote:
> External email: Use caution opening links or attachments
>
>
> Hi,
>
> On 7/31/20 10:21 PM, Daniel Dadap wrote:
>> If a driver registers with WMI, and none of the GUIDs in its ID table
>> is present on the system, then that driver will not be probed and
>> automatically loaded. However, it is still possible to load such a
>> driver explicitly on a system which doesn't include the relevant
>> hardware.
>>
>> Update wmi_driver_register to test for the presence of at least one
>> GUID from the driver's ID table at driver registration time, and
>> fail registration if none are found.
> This would make the WMI bus different from all the other kernel
> bus subsystems where one can happily load drivers even if there
> is no hardware using them.
>
> And this would also break being able to manually bind a different
> (hopefully compatible but different) guid device through
> /sys/bus/wmi/drivers/foo/bind
>
> So NACK to this one from me.
>
> Note please do send a new version of patch 1/2 of this sets addressing
> Andy's remarks to the other similar patch you did.


Not a problem. I'll remove this patch from the series and update the 
other one.


> Regards,
>
> Hans
>
>
>
>
>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>   drivers/platform/x86/wmi.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
>> index 941739db7199..19aa23d1cf8e 100644
>> --- a/drivers/platform/x86/wmi.c
>> +++ b/drivers/platform/x86/wmi.c
>> @@ -130,6 +130,21 @@ static bool find_guid(const char *guid_string, struct wmi_block **out)
>>        return false;
>>   }
>>
>> +static bool find_driver_guid(const struct wmi_driver *wdriver)
>> +{
>> +     const struct wmi_device_id *id;
>> +
>> +     if (wdriver == NULL)
>> +             return false;
>> +
>> +     for (id = wdriver->id_table; *id->guid_string; id++) {
>> +             if (find_guid(id->guid_string, NULL))
>> +                     return true;
>> +     }
>> +
>> +     return false;
>> +}
>> +
>>   static const void *find_guid_context(struct wmi_block *wblock,
>>                                      struct wmi_driver *wdriver)
>>   {
>> @@ -1419,6 +1434,9 @@ static int acpi_wmi_probe(struct platform_device *device)
>>   int __must_check __wmi_driver_register(struct wmi_driver *driver,
>>                                       struct module *owner)
>>   {
>> +     if (!find_driver_guid(driver))
>> +             return -ENODEV;
>> +
>>        driver->driver.owner = owner;
>>        driver->driver.bus = &wmi_bus_type;
>>
>>
