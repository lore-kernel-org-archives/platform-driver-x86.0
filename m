Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58390C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 15:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 349E060C40
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 15:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbhJZPSO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:18:14 -0400
Received: from mail-mw2nam12on2087.outbound.protection.outlook.com ([40.107.244.87]:39039
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235594AbhJZPSN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 11:18:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhWrMkWe1cIfZ08YQb2Z/8QioKfrTt57xP2Rs4eh8lexVKvnlng1Da203FvK6/y2iVaAV5ATPBV5PiijqPzv8BInOYjQHMfhg423HKmiGyg21EyQ3HNDKE1/QqmWTrdgZBOEx12yKFHDZ352+IlweUouKwRKx9pEWf2k/EzWe6GNfT/5GyNJr2U2Gd+wkNkuLedZkYUkOkmzQbDCMY8ud+UeQg65UenZzqMMCFyIIRB74PMb5TghIXpkGIk8pftm1t6DaeojmPzjyQ5rISCp2gEkHMgz9WjIpxuBdjN8VTEIkIYl2HpNQK5RD7SnS6iM3VaPnc7xF7UMDQBjwT9Rgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHO0vH2B5qQo+DPgEaEThLWmzCJT74Pm6+qW7SlrWJs=;
 b=C+2xiOohkDMxLRZz/gJKH8RHDxg/qOOQVYLLFAC8CV7sNY4lWO0wmunr97G8Eaxe2BwWezC7SVZL3eGhfUFdmtsSyOfGUg/vypyIgJks7GCIRdnupW63eP6AqOVAki7xiyvC+v5qzrriB+sonWT6FLWraxohGUwWDnstyZaiCVYTMvqpKMBQ/hmUIYcR5mSs4n2tvEvORfZaBZzDMgm/pLaLGRAaEcFsP8e3yEzS5OktUYbxolvWhGeKeBTxAjJbWwYnWdbzMms+w+UBCAzbccMGoP73ltAEkwE/5zRtU0TreAFgOqhUYCV2+nGhOVwB4IuT2rOWtx6XVOTyRE5uqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHO0vH2B5qQo+DPgEaEThLWmzCJT74Pm6+qW7SlrWJs=;
 b=yQM1J4xVg3sgcaq/S6YMVjylcXsYE4Zd4WtgnhEb1p9MqCVvycUhqIOkkJZIq4kOChsOsuATkVr0G9u6IAkHIsNgmMjSDwLexTUTbFHRdIJFo5MMZTq5GGMolAeYo7KQRz/yQDlCB9wJkqwDz+p+cKdzC0MS6RGx3rVbR3Uu2MQ=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2766.namprd12.prod.outlook.com (2603:10b6:805:78::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 15:15:47 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4628.018; Tue, 26 Oct 2021
 15:15:47 +0000
Message-ID: <9b848381-db2b-c060-f012-c049c3b3276e@amd.com>
Date:   Tue, 26 Oct 2021 10:15:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] platform/x86: amd-pmc: Add special handling for timer
 based S0i3 wakeup
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20211020162946.10537-1-mario.limonciello@amd.com>
 <20211020162946.10537-2-mario.limonciello@amd.com>
 <YXgV9+YVKi5r840i@piout.net>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <YXgV9+YVKi5r840i@piout.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:805:106::40) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
Received: from [192.168.2.8] (76.251.167.31) by SN6PR2101CA0030.namprd21.prod.outlook.com (2603:10b6:805:106::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.2 via Frontend Transport; Tue, 26 Oct 2021 15:15:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a7b594-dec4-4daa-c034-08d998937ce3
X-MS-TrafficTypeDiagnostic: SN6PR12MB2766:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2766065155F15284D558D632E2849@SN6PR12MB2766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OwRdQohnT83UDuC6oiz+FsMnVTxwVdpW8T5sBnaQ3TJVzAqfDTeOQ4DXHI1NgR2NsRqQ8fSlutQP4iYhRUy9ys3R74jH1srSU8DOkr4wKjg1XDRXKwvjlT+my7W1EkracO6am7HYHBnsamQtxfmbhDM0Qs2TmG4TNer9cWh79tDhMgx+KyeMkVjFNFTMhQNu5WGDuhIHnavbR2As1dXYHXmsD6UVBi31Gyle3tem8jcqXUCJhleuIVpQv+jJm1vzL4E5O4JgCZrsoquvnC4syPoUdv0cpP9VLUhliGCgCyw2hKrgLCXMtrmnQNXb3xM619cS6gkBU7ZSHMX2uIqgvLeQhQgx9V+gIGMWk6IZMSzP+QKxJjPoOd1rCBbUmzfUkCl/mtQV3elzFLsyvxC5Zk5SyVVW5puT12+jz2Zcz4UaDC805GNg8BDurDfBqLAiweg8WKg1ChGem5C8vekbwL1QwxcPQ+HsTInoKGEN5+Z2Pk86Yhz9FqGqI+D047ZmfnQWx/hvbf3jbX5vclYEZaLemWYeG51iRMmoivyjrPkHu+VNYCE/jNOeser6Id9epQlgu8z297RmThgI1y0C2igyo9goOKgva8DTSZ10jq+q/mV4LB3eJ58tc95lwD+15iSIXpdUh94+HHGt4Oc8N5qXi32llEAp4Egs619Mh6ZEkPBqyJZSJXU0RErjxBcH5XtQa7mg7/5tjdX/ORKuMfuFrD+ytO9eEnx4yU/vJXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6916009)(16576012)(5660300002)(38100700002)(31696002)(186003)(86362001)(66476007)(36756003)(31686004)(54906003)(6486002)(66946007)(66556008)(508600001)(53546011)(4326008)(2906002)(6666004)(956004)(2616005)(316002)(8936002)(83380400001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXk2Rjh5WUY1TUM4S0N0V0V0aWtVRGFjSXRLVzh6WXAxUkg5a3FBOGtwRzdv?=
 =?utf-8?B?L202cWwyN0w0dmZHOWp4YW9RcmdlM3ZYeXhxN2FHRERqOXZGOUxHcGRoUk95?=
 =?utf-8?B?TzF2dXRhaU1KdGVRcnVteWVZVkJvVDhBaDBSVlVUK0o3Z1J6cGIwZkREUXBT?=
 =?utf-8?B?ZllHdEwvZDNEUkdTbGRsTmpSempqSTI0UisrNjFJQzFJaVNxTXJJR2o5MmlJ?=
 =?utf-8?B?cW1MOHRHdFozSXFPM0dVWFVrUVN1UUZNbkNtTUk0dmNoTUpvSFJsa3pYVFJq?=
 =?utf-8?B?Q2R6Uzl6c0lkcHN2SVFQalN5ZDN6Vm1nUFpVY000VzdraGdvTGQvbVlOa1NR?=
 =?utf-8?B?OVJtL3l2L3JRWWlPMEFHL1J4VzFaTE10VXpUbDEyNEZ2c1d2Qms1amJiSUll?=
 =?utf-8?B?c0pHVk9UKzZpZmVDaFI3ZG5rY0FnTG5ablRjdWk1Y25KeFVSNjVPMXpyTlYy?=
 =?utf-8?B?Y1VDWXlnSzA1UysvVG1ZU0liYzI0M25CR3F2RDNOODVTaHRpaUxUTnl0WG5W?=
 =?utf-8?B?Z0p6dnphcktwc2EzM0tUSGMwYldSNUxNV3ZIbkx3RlpxWGJXS2hMK3dRZVdC?=
 =?utf-8?B?OVF2K09rYm1acmtOWm8raHp6NktJOUs3THZ5Z1JsZGJQWG1Cb2t3eCs2aXF4?=
 =?utf-8?B?M0hKd2NjR0NiQlBiOXVQU1ErQjhFa3JOa2d3QnBMYjRpUFhEMEYwQ1kxUHhk?=
 =?utf-8?B?c3BIQVB3eDFxdmY0UzFWVmpGUVhjNXk0WGl6ek1CS0tzN0ZPYW1QSUF4dDZs?=
 =?utf-8?B?QUNwN2dhaGhKWlJMb3p2SURHeXJxY3BjMkVlVkt2eWdPdFhSeGNMNkZsN0FX?=
 =?utf-8?B?ZnhjODkyemNVODRlLzVxaFArclZqbVViaTZTYmxRRWlDMStNaWNZbnE4V21q?=
 =?utf-8?B?SXIzcUlWZVpBc1pDbk5FR1J0Uk5jdGMzRGF1RnpZS2hQMWFYM05iWno5MUYr?=
 =?utf-8?B?UUxnRndMbjhMU3NQUkJPYzJBYzRUNllobXFYZ1h1STlyeWhFa1NxQW5uZ0ZF?=
 =?utf-8?B?NlRRdHBOdm5vajNRVlR3L3lBZXJBZDZaYWRkTmcxSFpJbkFTZkNpWGF2VE4v?=
 =?utf-8?B?N215VHV0OTNjV3dpVkl1ZnErZ0JaaXFnUkJ2MXZ4MGIvVFhwaVhrUVVhcFZi?=
 =?utf-8?B?c0NGbGp4RVkxN3FOQUNpZ21tcEVMaTd5UG94TmE0UFZFUC9JUHdoNlpzMlNV?=
 =?utf-8?B?R0ZUTEM1RjkvQXZOdGlDeEFjU0RwT0Rla25YQkIyVHIwa2h4UmEwVjM2UVc1?=
 =?utf-8?B?SlN2R3RxSUVHOWs1Sjl6ZU9WL2NrT0JvZnpFTklGcWVxZjhTTGpmZmxyZC95?=
 =?utf-8?B?bm11Q3FvTUJXR2M4dTQxaUl5RmEySkkyNGI0N1RNTDBNSURNVE0ydkkzMmJn?=
 =?utf-8?B?TzRMUzhpMmVPV1FBYXlVejkwbVpWcGlvVUhPR09WVWhqb0dvQndvSW5leHdl?=
 =?utf-8?B?R3lSNTFBVlVYekx0b2EvZzh5RHAweTE1ZUE2djBUZktyNWQrQ3NYcW1XQ2dQ?=
 =?utf-8?B?dW1aYWZ3Mkw4OXQwZkdkSDNLRFMxTnp0OTZuNG14YlJhU1hTbUdrZVl6cGJL?=
 =?utf-8?B?V2FsNUdaWk1NNWlBVTB0c3pZRVVKV0VBSkNqcmtQaDBNWkV4TnNQN2kvNkVC?=
 =?utf-8?B?cXRJb1JQUGgwZ3JNL0hEMFVuV3lHQTI0eFhGdHlQWHMvSGdHRllRZGpyYVdn?=
 =?utf-8?B?a2F4UVJjcU85clplYjN2VDVkTGl2eEwxRUNHVFQ4cEdVd2JwMFN1RXRYMEIz?=
 =?utf-8?B?OXFwWU5XeGw2b3o5R0RZU1dEaElOVFRpQmdsSkF4WE5qWm4xUG5ub1BKbk1i?=
 =?utf-8?B?NGFLSnZSOEZCRDIyc296MHpLYWxwbVNRa3F6bmF5a055SFdEVFJ2bCsyUFVI?=
 =?utf-8?B?a3ZnczFvQzNiM1U2a0NMZWw1SzNnMzJPaVNZRjNuVHlJaktxR2FrM0lOd0FW?=
 =?utf-8?B?U1prOEhxU3RDUWlsQkxUaWtEVktoVlBJK0hFaFdVbmJ0MkJXR09JRWI3SjJB?=
 =?utf-8?B?NkU1Q2pWQVp2Nm1oNUxZWnlzVmxhNVJxN21pY1VsaWgxdnEvUG1lNjZsM0Fq?=
 =?utf-8?B?dUpnakF0QnFRcGc1SElaeFZQLzVwZVJlRTZ3blN0SlM4U3ZOaWk1ZFltSmhi?=
 =?utf-8?B?STRDOTI1MEczZkExb2VZODVyanM4OXJ0Y2RpQXp5ZGRkVlA2b2NES3ZWL3V4?=
 =?utf-8?Q?FKwY1DczIkCst+yJz9Fhqf8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a7b594-dec4-4daa-c034-08d998937ce3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:15:47.4542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZaoHahGIKi1l2Ur6pJxag3qqFjnsfDVGETm3c9UI6gpByKfdfC9cK2+/Sw+X3GfJEEjlHYxoGJ1jwlIBkYd3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2766
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/26/2021 09:51, Alexandre Belloni wrote:
> Hello Mario,
> 
> On 20/10/2021 11:29:46-0500, Mario Limonciello wrote:
>> RTC based wakeup from s0i3 doesn't work properly on some Green Sardine
>> platforms. Because of this, a newer SMU for Green Sardine has the ability
>> to pass wakeup time as argument of the upper 16 bits of OS_HINT message.
>>
>> With older firmware setting the timer value in OS_HINT will cause firmware
>> to reject the hint, so only run this path on:
>> 1) Green Sardine
>> 2) Minimum SMU FW
>> 3) RTC alarm armed during s0i3 entry
>>
>> Using this method has some limitations that the s0i3 wakeup will need to
>> be between 4 seconds and 18 hours, so check those boundary conditions as
>> well and abort the suspend if RTC is armed for too short or too long of a
>> duration.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/platform/x86/amd-pmc.c | 60 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>> index 99ac50616bc3..678bf6874c63 100644
>> --- a/drivers/platform/x86/amd-pmc.c
>> +++ b/drivers/platform/x86/amd-pmc.c
>> @@ -17,9 +17,11 @@
>>   #include <linux/delay.h>
>>   #include <linux/io.h>
>>   #include <linux/iopoll.h>
>> +#include <linux/limits.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/rtc.h>
>>   #include <linux/suspend.h>
>>   #include <linux/seq_file.h>
>>   #include <linux/uaccess.h>
>> @@ -412,20 +414,76 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>>   	return -EINVAL;
>>   }
>>   
>> +static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>> +{
>> +	struct rtc_device *rtc_device;
>> +	time64_t then, now, duration;
>> +	struct rtc_wkalrm alarm;
>> +	struct rtc_time tm;
>> +	int rc;
>> +
>> +	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
>> +		return 0;
>> +
>> +	rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
> 
> No this will not work as you can see in your and Arnd's patch adding
> ifdefery to handle RTC_SYSTOHC_DEVICE not being set. You have no
> guarantee that RTC_SYSTOHC_DEVICE is the device you are looking for. You
> need to rework that part.

I'm intending to send a new one back up to the ML to just hardcode it to 
"rtc0" per Hans' suggestion.

> 
>> +	if (!rtc_device)
>> +		return 0;
>> +	rc = rtc_read_alarm(rtc_device, &alarm);
>> +	if (rc)
>> +		return rc;
>> +	if (!alarm.enabled) {
>> +		dev_dbg(pdev->dev, "alarm not enabled\n");
>> +		return 0;
>> +	}
>> +	rc = rtc_valid_tm(&alarm.time);
>> +	if (rc)
>> +		return rc;
> 
> Why do you think the RTC core give you an invalid alarm time?

It doesn't matter "why" to me.  It's defensive programming.
The function has a return code to check for problems.  If an invalid 
alarm time was somehow programmed, we shouldn't be using it.

> 
>> +	rc = rtc_read_time(rtc_device, &tm);
>> +	if (rc)
>> +		return rc;
>> +	then = rtc_tm_to_time64(&alarm.time);
>> +	now = rtc_tm_to_time64(&tm);
>> +	duration = then-now;
>> +
>> +	/* in the past */
>> +	if (then < now)
>> +		return 0;
>> +
>> +	/* will be stored in upper 16 bits of s0i3 hint argument,
>> +	 * so timer wakeup from s0i3 is limited to ~18 hours or less
>> +	 */
>> +	if (duration <= 4 || duration > U16_MAX)
>> +		return -EINVAL;
>> +
>> +	*arg |= (duration << 16);
>> +	rc = rtc_alarm_irq_enable(rtc_device, 0);
> 
> What if userspace is waiting for the alarm to happen?

They won't receive it.  Note; this is no different than before the patch 
on these affected systems.

> 
>> +	dev_info(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
>> +
> 
> Do you actually need this message, looks like leftover debug to me?

Yes it was definitely used in debugging to produce this patch in the 
first place.

I left it for two reasons:
1) It makes it clear if someone is using this functionality when they 
report an error.

2) It shows if they were operating really close to the boundary 
conditions (and thus it may be required to adjust).

I am amenable to downgrading it to dev_dbg and on reported issues around 
this asking people to +p dynamic debugging for amd_pmc.

> 
>> +	return rc;
>> +}
>> +
>>   static int __maybe_unused amd_pmc_suspend(struct device *dev)
>>   {
>>   	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
>>   	int rc;
>>   	u8 msg;
>> +	u32 arg = 1;
>>   
>>   	/* Reset and Start SMU logging - to monitor the s0i3 stats */
>>   	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
>>   	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
>>   
>> +	/* Activate CZN specific RTC functionality */
>> +	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
>> +		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
>> +		if (rc < 0)
>> +			return rc;
>> +	}
>> +
>>   	/* Dump the IdleMask before we send hint to SMU */
>>   	amd_pmc_idlemask_read(pdev, dev, NULL);
>>   	msg = amd_pmc_get_os_hint(pdev);
>> -	rc = amd_pmc_send_cmd(pdev, 1, NULL, msg, 0);
>> +	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
>>   	if (rc)
>>   		dev_err(pdev->dev, "suspend failed\n");
>>   
>> -- 
>> 2.25.1
>>
> 

