Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26374C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 00:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F26D560555
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 00:22:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbhICAXQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 20:23:16 -0400
Received: from mail-mw2nam12on2086.outbound.protection.outlook.com ([40.107.244.86]:58315
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236197AbhICAXP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 20:23:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6Z9tO/lyoZd/Fa5mK6fvS0rdptFlFfE381q+NqTjpIxsEbUDLsYP8OgA5mea+EzewVe8OmOQIPNbkIRs2To84iCTjCIbr3Grm04CRd7jU7et73dGgmyZKGe3B796D43K7at6iziPTHQzwB9E5JGsF1qhwGEz5Ro4gUGo92k/TkFw/eZ/h2faQ9yq5alwHYRJ9b9ze3MKb5Z1CRgmoZDmFnvgfHhIk8NmPofhSYPfazQxejnCMNnUth4eHc1fqwA+znfRpz+A5w4XP6fcnQNqeYZxQm6BcOFM1Q0dGni2ZMvIj0SwJqMmp/1g9CNi0yarrGfQBCezl+ROsvFfn5MDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=haMPzD2jw9Wz9Fdui3AKZYIRjqdFAgBhRFBDOPOVTvY=;
 b=Tp7/tYQJypg8KASply/PLK3hIuguIs/63POhMz8VRUi7qyXHL5BtZW17L/EdsRupzY7wOFmT1L8zxYsHeuB7/Zk0/dC2t6YOy3eRDXZzqX7viCkHU7bl9kf2a8mThGuhMCfjCfw9oWh8tFKvwjSJRl61VKL4EdJ5gCB1zpDju9zMUsatzNAZwcReLFftBIyxgaCQY70n4x+8qG2pX2lvdQV15RcSZtpuPRY4CAjRceJyJ1h1LOuL4uNKFEmU/J+7VMNc9O2AWqDNg0LGgCNC6P9I98L+Mrn5CHTtwigle3YfcKHUKIOPjsWCqSnDBSNz7WwaJniKs48lz6tdWNsUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=protonmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haMPzD2jw9Wz9Fdui3AKZYIRjqdFAgBhRFBDOPOVTvY=;
 b=Q8GaH60PohKyarpfoLKkCNZqRwHSBD9875frz4jbTU9xinvNLGBBJGfa2TksWlUFi3H27f2jSK/DtoEmnVNOlwGXT7gNHKwSn2nBDdBo2Av6ngXHnoSPPGH/Vxi1DTwHu/THHg69AEzztZWE5UaS3m6Lr6yyrtaiWJ/5gsgrrmwAtaxEPZv0EFqwTwZrKPFefbvSTNyLugYnkVf/3rOkrKNrW+vnykeUHQZ/IO7BgI/9NX7Jf2LIxtQ3fnopx15/Frfko8Ks+OTSWL5f+vJoY76Wj5U042dcgkjWpRAMiiX5W/K9ve9Vf9i4yslVdnrdm70ODvpKcWqWVv8DnZdLuA==
Received: from MWHPR04CA0036.namprd04.prod.outlook.com (2603:10b6:300:ee::22)
 by DM6PR12MB2793.namprd12.prod.outlook.com (2603:10b6:5:4f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 00:22:15 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ee:cafe::a9) by MWHPR04CA0036.outlook.office365.com
 (2603:10b6:300:ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Fri, 3 Sep 2021 00:22:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; protonmail.com; dkim=none (message not signed)
 header.d=none;protonmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 00:22:15 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep
 2021 00:22:14 +0000
Received: from [10.20.23.105] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep 2021
 00:22:13 +0000
Subject: Re: [PATCH v5] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
CC:     <platform-driver-x86@vger.kernel.org>,
        <mario.limonciello@outlook.com>, <pobrn@protonmail.com>,
        <andy.shevchenko@gmail.com>, <hdegoede@redhat.com>,
        <aplattner@nvidia.com>
References: <f4802d28-3674-bbc3-0377-52d3d03af4fe@redhat.com>
 <20210902214718.13628-1-ddadap@nvidia.com>
 <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <43912a84-511d-18d9-7a3f-61716d9889ad@nvidia.com>
Date:   Thu, 2 Sep 2021 19:22:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17aa48d0-9fd1-4bcb-a993-08d96e70e1d5
X-MS-TrafficTypeDiagnostic: DM6PR12MB2793:
X-Microsoft-Antispam-PRVS: <DM6PR12MB279381899B9D9C8CA3091237BCCF9@DM6PR12MB2793.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/+xljz1h3FNa4vNzeN5TNfR8gDax6ldKamRUCNtzgVz4DsTNOKEx9JQ5kRUBclXDeq6iSIKkE+ley12JSGtWWwkrHNYBw6biXtNWzXUmxJNKXTzd0f8/rwnbaxuhgdHrtQbHWH2s0wkpifJpsILODXnAT7Lvr9EdD3XFAPKbMkbGpo+pmHMJq5kjpICQDq1kvMCQq1OP/PYpe7UolRiqTD7nW4dnoQR836H3hILM196iRQQnXc3L+7Y6QfYxvEEkQwhMvuGEpzQC1l8TElgFUGT9ZgA/SjaR+4lFOudJDsslHqpq/ibGGfUQ1jxXkxBlWcBTRS9hUVbMC83kaVNPIYIGRcPN9McJkqIYsV4nB9DAZUYbBffx/eUyIMttywJZLWQ/zsgHK3CxLJIWHt97rxJZEGaICJ5TVU4z39twufYoeQ9IPZA6hrCgKS4C+yFB0PyUpYn19wZ8gDHjp1bIa2rmpUZLRQzIFu7EQdGY4nEAi+qgOylx+vRkTMTdkCHgSI104ybiQ6IG3t6wiuPMEdpjfXAZIVjevl/Kg0eKBX33GBpG38pi2Dn8Jjz0fFKOEbIFegNoKHliBvpvBTJgzmlnCPBwp8WhYzT4Y7TmWdUA4GMolLfrrVXZTPL/P2ODEh67nWNH8DwcJzou7mpS+y0rZvW9/p6fJ8jeVusV96nU1KBoLFO+i8KyEwYD13Chsa2R49cNaYJ4VGvEgRpG9g3Sp+f1S9/0u8TMnu0Y/M=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(2616005)(6916009)(16576012)(8936002)(8676002)(36860700001)(36906005)(107886003)(36756003)(5660300002)(82310400003)(316002)(26005)(53546011)(2906002)(186003)(54906003)(508600001)(16526019)(31686004)(7636003)(336012)(426003)(66574015)(356005)(32650700002)(4326008)(70586007)(31696002)(70206006)(86362001)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 00:22:15.2726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17aa48d0-9fd1-4bcb-a993-08d96e70e1d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2793
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 9/2/21 6:20 PM, Thomas Weißschuh wrote:
> Hi Daniel,
>
> one more actual thing and two tiny nitpicks.
>
> On 2021-09-02T16:47-0500, Daniel Dadap wrote:
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index d12db6c316ea..0df908ef8d7c 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -113,6 +113,22 @@ config PEAQ_WMI
>>   	help
>>   	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
>>   
>> +config WMAA_BACKLIGHT_WMI
>> +	tristate "ACPI WMAA Backlight Driver"
>> +	depends on ACPI_WMI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	help
>> +	  This driver provides a sysfs backlight interface for notebook
>> +	  systems which expose the WMAA ACPI method and an associated WMI
>> +	  wrapper to drive LCD backlight levels through the system's
>> +	  Embedded Controller (EC).
> system's -> systems


"system's" is what I intended, and I believe it's correct. The meaning 
I'm going for here is "the Embedded Controller (EC) belonging to the 
system". I guess maybe there could be some confusion because earlier in 
the same sentence I refer to "systems" plural, referring to the class of 
systems that expose this backlight control scheme, and later in the 
sentence "system's" refers to something belonging to a singular member 
of this class. It would probably be more clear if I just drop the word 
"system's" here.


>
>> +
>> +	  Say Y or M here if you want to control the backlight on a notebook
>> +	  system with an EC-driven backlight using the ACPI WMAA method.
>> +
>> +	  If you choose to compile this driver as a module the module will be
>> +	  called wmaa-backlight-wmi.
>> +
>>   config XIAOMI_WMI
>>   	tristate "Xiaomi WMI key driver"
>>   	depends on ACPI_WMI
>> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
>> new file mode 100644
>> index 000000000000..fa3f41302299
>> --- /dev/null
>> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
>> @@ -0,0 +1,194 @@
>> [..]
>> +static int wmaa_backlight_update_status(struct backlight_device *bd)
>> +{
>> +	struct wmi_device *wdev = bl_get_data(bd);
>> +
>> +	return wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_SET,
>> +			     &bd->props.brightness);
>> +}
>> +
>> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
>> +{
>> +	struct wmi_device *wdev = bl_get_data(bd);
>> +	u32 level;
>> +	int ret;
>> +
>> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET, &level);
>> +	if (ret > 0)
>> +		return -EINVAL;
>> +	else if (ret < 0)
>> +		return ret;
> Nowhere else is the return value of wmi_call_wmaa() checked explicitly for
> greater than zero and less than zero. Why here?
> At least wmaa_backlight_update_status() should have identical semantics.
> The case ret > 0 should never happen.


wmaa_backlight_update_status() has different semantics precisely because 
the .get_brightness() and .update_status() callbacks registered in the 
struct backlight_ops have different semantics. The return value of 
.get_brightness() serves dual duty, where a positive return value could 
be interpreted as a valid brightness level value, while in the case of 
.update_status() a positive return value is invalid.

I agree that wmi_call_wmaa() should never return > 0, but I wanted to 
protect against someone deciding in the future (for whatever reason) to 
add a code path that returns a positive value, without checking all of 
the callers of wmi_call_wmaa() to realize that this could cause a 
problem. There are not many callers of the function, though, and they're 
all in the same file, so perhaps this is not something worth worrying 
about. I suppose I could check for just the < 0 case, and add document 
the API of wmi_call_wmaa(), explicitly stating that the return value 
should be zero or negative errno.


>
>> +
>> +	return level;
>> +}
>> [..]
>> +
>> +
>> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>> +
>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>> +	{ .guid_string = WMAA_WMI_GUID },
> This could also be inlined as:
> 	{ "603E9613-EF25-4338-A3D0-C46177516DB7" },
>
> More a stylistic thing though.


I considered that when switching to MODULE_DEVICE_TABLE, since the value 
is now only used in one place, but looking at other similar drivers, it 
does seem that the most common convention is to define the GUID as a 
macro even if it's only used once. I'll leave this as-is, I think.

