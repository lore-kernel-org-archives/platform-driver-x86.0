Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E8CEB64DC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 21:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjGKVc2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 17:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjGKVc1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 17:32:27 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23F510DF
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 14:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eba7FVM6tSoo6m8mrt0A653gLUK0CKy2q02xd/gaTX5+FdWs56FdWrACtWpDCFhMGmtCHwCGMMEfjhWpAJ00pknM2jLyu20ESpSECoDIwPi6d48fYT+sYMRTdokazuQarifluFIKXVK6aDD0GrRbx9cLO09TOeClyL38cyljBVmOQXpoEJ6+hS723nGdCbuGVIcENwmUB70BGYR1zWSCeQMG9UCyI/Fb9nSXH4b3uIdSE+ZenwtRpdv8wxV2sne2FodW8d9dUKBWbDxi4Xg5Vy0RWtJQ2Jmde8tfhvs0LGX5G9jXIY0wVoYMxqp38tb+OcPswUfECbhO+m+aeyh9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMu8jdLL0yaaxRWv+Uk9BA0T5MJ0LFxqWrsPy5u0+eI=;
 b=APMZy4VwKJYHS1SA2MuQK0BkMr+OkNN8blzqGSR8rdq7/Zy+NekPqXk9O7XqHi8yOfaZaVcgqJGkxkRSVSvqk7JNI158UVyZq8d0ObmgO33rxcyodE5NcHio1fvoqETI+4118IyCrbcMHsPLu7bh1+LD9WAc6IY6Wp3LLqdMFlOx+5OJC5PSK8o6JDl30alTrmOYRjpNUJjG9s+2BXcds5jFP4B1lvObWHdS9+wTuQoGPxQFCzRh7/Zdsru3i+p7YzPOupiH4GurBoZy23SSYfQzSA7bNamIH7xPbGxS0hs1er87yCpU7LWWguIjNZemq5JXL8zJjKNGtzQ7m8J99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMu8jdLL0yaaxRWv+Uk9BA0T5MJ0LFxqWrsPy5u0+eI=;
 b=gAyX+8RbLV3xBIK2+UBQo6BE0l1tev2b7rTcqv22ZCmsw3OKU6iwQwzuPBEh8Lv8iW9NtgBYuCw5RxxxV5KeLoCvRsMazPrrC4aJGEkICxKnfom4yl0e3jiPyWds5xBgD4V8IMGImNikYY+WtomqbFyhlpRVhLS8Awd+F7AGO0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 21:32:19 +0000
Received: from SJ1PR12MB6098.namprd12.prod.outlook.com
 ([fe80::497f:6e26:49a7:d016]) by SJ1PR12MB6098.namprd12.prod.outlook.com
 ([fe80::497f:6e26:49a7:d016%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 21:32:18 +0000
Message-ID: <a8a47091-1792-e10b-8a79-b931f410762a@amd.com>
Date:   Tue, 11 Jul 2023 16:32:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86/amd: pmc: Use release_mem_region() to undo
 request_mem_region_muxed()
To:     Andy Shevchenko <andy@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20230711095920.264308-1-hdegoede@redhat.com>
 <ZK05ReBRqbrggq/C@smile.fi.intel.com>
Content-Language: en-US
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZK05ReBRqbrggq/C@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0032.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::13) To SJ1PR12MB6098.namprd12.prod.outlook.com
 (2603:10b6:a03:45f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6098:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb59d5f-1803-410a-cfc7-08db82564daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m1LwzYnnAXvu/ZpamVlf3+bEWDGOgMP/LXJlLVSmbMyUdFfaFJSV17ht3TV1Hg2fw9SiSITAP9zMU8IIDfiJLOqlPm8ehIlhPAczcpHlNfbhicu6EOZ2IosVUU0Whqsy5aq9xy7amFVXaEljpKudrfSqpJAT0DV7ep+mO2VFKaamaB2Th4BEXbmWM76ETbGV+mhBG3fgd3o+/0vkwSmu/nMWSdlEcqtHcfVutTrItf1+kngQ6na92qil05LKGWm5KecldX17aT/TtKvVVO9VantOA9FClFYeVKoSABMU5dKLEbu6BgwSND+V/tdLeD86f/6Qq7/qhjI4nDxeVkk34A2GSPdwe1IKeAvoi2QUFf/lm93M/5CeQlznpkdfKUGAAwyQZCgngsnQis6UAejVTkb5+MBbvFG2NIw2Ik1pHRPGYIov+J4sYwD6i8M0ZpXfvaqCsCS7Ly0jpCZftB+pDNe7duxsomRnunbm+wLzsoLKC93VNj8Kmdg9jXcnt0Z7cDelu41C0D7lioPSNBKwwEe73Cdg9dK8ls8FcXlzFk36/sCmFAspWUSspXzFfjdBs/z0KkNI6AJThSwaZ3Rezq9h3g9rJBJQv5hLubJ875dh9lVNSLNVEf+JIXbB1qntR6ny6c10/HpZh8D81HX4qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6098.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(5660300002)(44832011)(8676002)(66476007)(31686004)(66556008)(8936002)(2906002)(316002)(4326008)(66946007)(6666004)(6486002)(6512007)(53546011)(186003)(83380400001)(6506007)(41300700001)(2616005)(38100700002)(478600001)(110136005)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzhnWnZBcW4yUDRUSWMwN3VZUVU0WWswdHpDSEk4ZWFJaWJTdFdVM0ZQa3p2?=
 =?utf-8?B?MFpCcEpmVEk1OWRGWFloRURicWgwVnM1NDZBZ0VYRE8raDNuN2VVMkZZQ0Ux?=
 =?utf-8?B?RGJtMVY5WS9DRzVGRlRsbW9TTlRBUnUwYWxNOVF0ZllTTXoyZnFCS2cwQ21k?=
 =?utf-8?B?RkpwMjJoUnNuWGl4MDJCWnorWndRN2JWekx1MzFITTJnd2dwV1hTK2N6VmdE?=
 =?utf-8?B?K20ydi9vMEwxeWN2L3M1RGVoRlZQOUw3TlpWZWV4TUpCOGNPcytoZ2FRc0lN?=
 =?utf-8?B?TEJRMzVONzQrUGVDVEo3YTdFY0o2OGM5alhINUpsSFQ5MkdsdlpadnFXNEgz?=
 =?utf-8?B?Q3h4eENocjJrRWhSbUd3eDh4a1gydFhydGlpVVVKSVByTC9ORDFCU3pMd3I4?=
 =?utf-8?B?bkZNbkZQRFhTKzUyakk3dm85TlBDMFd3NkU2RERMU0dVL0Q2RHRpMGVBL2pz?=
 =?utf-8?B?aDlHZENmY1FoL3BwUXljSVNGOVNZZGNKUVFTbUR1VzFvV3RsUmR6bW5kMTVm?=
 =?utf-8?B?N3UrK3pWY2ZLR3AxL3c4UGNjQnZ1cnREak8vNTdpSHZON0g4VVd5bDhwb3k5?=
 =?utf-8?B?OW53aTJJeGluL1VQbzZ3djlDSjdBY0xWaTFGM3N3V0xXSndaMlI2aEF1RW5t?=
 =?utf-8?B?c3lXaHREWkJBb3VjNm9FU28yRkZRY05tbzlGWGk0bXdrTHAyN2x1akgwTDl0?=
 =?utf-8?B?ZElhdlY1RFA4aFByZERkMG1XK2tka1RhbkM0S25QR0xPQ0QrQUo1d3FJdTRT?=
 =?utf-8?B?QnYyWnFFT3pBMmFuTzBrNUFpdDlNaWFiaE1wRW55WFY4V2ZDRmdPYmMyeEVZ?=
 =?utf-8?B?a0d1RzA4THphc1AzcmV5WVNBZFVYdExab0dwMGc3dVlHajQ3MldaY3BydVpn?=
 =?utf-8?B?TnRNaWQ4blhPbi95cHVySlhLbDQvbm9sK2J6SXJsemQ0OHgzMWJkdmN5Q0Zh?=
 =?utf-8?B?NlRieGFrM3g2L0t0bXFMeUpqaVJVQ1VXNkFmV2lReDZuY2c2QWpqVzNVQUtw?=
 =?utf-8?B?c25xZGNReDczQmNkazdsYjhIYTJnYk9lN2piUFBic0VmdUFuV083cElUeTdW?=
 =?utf-8?B?TVZPVk52V21mWVF5TUNCeUI2RUMwc3RHeGxXN0w5ZjM4Q3E5WHMydmlyc1VY?=
 =?utf-8?B?dGZMTitlb1lQWitETnhNZVFlZDJKZk1EVzN6bkRJMC8zVE9NeWd2MDExaXIr?=
 =?utf-8?B?UnY4b0xYcE5nZ2hjMHUwbXRKMTRkVnllNVRrRDFoWnVFK3N1RlcybjdqVFk3?=
 =?utf-8?B?TFVVNmkxeWhsQ0E5b01xYmxMKzJqZDlsSE9HWndTYmZtYXJSUHROSWgxTVNS?=
 =?utf-8?B?TG5ielY0R0lVOVNXSHFiZDdRVGx6U3lSejFVQm5FTzExT2tUSEJWeE5GQ1dj?=
 =?utf-8?B?TlIxUVgxNmFOc052aWVGVzBnVFdCcmxseDcrSmN6NXBYTXFuTmdYdklycExt?=
 =?utf-8?B?alBmUkhDVE5qeXdkTXJXbWJFZWQrWW1uUk93akI4TE1PblJJeWV2NXFpQ0h4?=
 =?utf-8?B?NExlRWdhT3dDLzZCMkZWSTNwQ2NkaUlQTFo1TnhxZVRlbjlvN2JUQ09tVlhw?=
 =?utf-8?B?amVzRWdHNGNsZDMvcVJVS1JVaFc0SVJUL3BYaHY1eDJndFVHQVpEcEliQVl6?=
 =?utf-8?B?QUptZVFFclA5RC94MnEyNXY3Zmp1M0pwTzA4ZzYrNkNmVnpRaTFtS0Ywb2hG?=
 =?utf-8?B?dmxSSndtSWh0TDh1TE9ac0o3WWliMWxPQjhXOG9xZHhpaUR0cUUzRCtRTUZ6?=
 =?utf-8?B?T05HOXQvaGt2QkpobHkxdThpY09GUjFxUnJmeDdoSTM3NkxxRkF0NFN6Y1pt?=
 =?utf-8?B?dTlzVmVKTm1XTGpUM1doOTZzVytyOWpNVzBSKzFsNElneDIvRGtoa3BPSTJk?=
 =?utf-8?B?RGhyNlFicDhqbk1PYTBpa1hNWlBQaXB6WjBFMHlKSTRUL1BIcm9Ka2dUR1RT?=
 =?utf-8?B?NGFJVjQ1NEQ1MEtwOUpOZ2ZwNndGU0hhV0hSbFdacFIzdmpMelZ2ZWNocWZa?=
 =?utf-8?B?WEJqd2xwNnBLRTFjT1lsOVg0VUlPS1UvbmlIU2EzR1BXdUswYkhpckxyYjY0?=
 =?utf-8?B?THlucEF4M1ZtYWJxdG54Rjh2M00rMGVmaFRKOWJPWldKL25lZGF6cGNGOE1L?=
 =?utf-8?B?N1BqOVdySnc1MFMwZ0hhbjllZ09wTHhwN3N1SkR2Wi9nOE9kY0RkMlZRalMw?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb59d5f-1803-410a-cfc7-08db82564daa
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6098.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 21:32:18.6566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4MVj8mNxk0p1z9OfbJtV1DYB9N0TbvQMOk4X2YzyHHQmo7N+CqvXRbHt5NuEdfbV+3gGGIHIjih5zhRfX51nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/11/23 06:13, Andy Shevchenko wrote:
> On Tue, Jul 11, 2023 at 11:59:20AM +0200, Hans de Goede wrote:
>> Muxed (mem) regions will wait in request_mem_region_muxed() if the region
>> is busy (in use by another consumer) during the call.
>>
>> In order to wake-up possibly waiting other consumers of the region,
>> it must be released by a release_mem_region() call, which will actually
>> wake up any waiters.
>>
>> release_mem_region() also frees the resource created by
>> request_mem_region_muxed(), avoiding the need for the unmatched kfree().
> 
> Seems reasonable to me.
> Do we need to have a Fixes tag?
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I've gotten a positive test report with this as well, thanks!

> 
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Mario, can you ask one of the reporters with a machine which needs the quirk
>> to test this ?
>> ---
>>   drivers/platform/x86/amd/pmc-quirks.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc-quirks.c b/drivers/platform/x86/amd/pmc-quirks.c
>> index 362e7c0097d7..ad702463a65d 100644
>> --- a/drivers/platform/x86/amd/pmc-quirks.c
>> +++ b/drivers/platform/x86/amd/pmc-quirks.c
>> @@ -11,7 +11,6 @@
>>   #include <linux/dmi.h>
>>   #include <linux/io.h>
>>   #include <linux/ioport.h>
>> -#include <linux/slab.h>
>>   
>>   #include "pmc.h"
>>   
>> @@ -135,12 +134,10 @@ static const struct dmi_system_id fwbug_list[] = {
>>    */
>>   static void amd_pmc_skip_nvme_smi_handler(u32 s2idle_bug_mmio)
>>   {
>> -	struct resource *res;
>>   	void __iomem *addr;
>>   	u8 val;
>>   
>> -	res = request_mem_region_muxed(s2idle_bug_mmio, 1, "amd_pmc_pm80");
>> -	if (!res)
>> +	if (!request_mem_region_muxed(s2idle_bug_mmio, 1, "amd_pmc_pm80"))
>>   		return;
>>   
>>   	addr = ioremap(s2idle_bug_mmio, 1);
>> @@ -152,8 +149,7 @@ static void amd_pmc_skip_nvme_smi_handler(u32 s2idle_bug_mmio)
>>   
>>   	iounmap(addr);
>>   cleanup_resource:
>> -	release_resource(res);
>> -	kfree(res);
>> +	release_mem_region(s2idle_bug_mmio, 1);
>>   }
>>   
>>   void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
>> -- 
>> 2.41.0
>>
> 

