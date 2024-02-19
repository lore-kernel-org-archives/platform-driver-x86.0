Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2070.outbound.protection.outlook.com [40.107.100.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB363C26
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708316446; cv=fail; b=t7Xk52UXupuTX8METUSC5MtKAoEgvvlp5NuEbQlhnxXaEguTZoEOEuNkXn4e78oV6zJ6uNmj8mbWtiu3IFUOPYIUhUMr0xyVLZ6dPSekpiAbhEvYgESCkBv1g0clzQjEcPLvjDPPlIPzWsDmzE+CmfZvX7/rvurYCshvhOK5pNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708316446; c=relaxed/simple;
	bh=ylmsbn6SvTpWJzajeGLb6ONo3TJpk+4qYVStpxcPpHQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MO/1MD+NwQjAF4V4V3oVe6TOdzgSHS5CNeMP7JhFCg4NI8I1KOBbpJe2TYnD106Qi0OHx6CgEdB61zyygUM19TutQBXaHnIOlaVJQSf/RieUZd4VqP4ut5ItuVnVYAW5R+96FBQkj0hzCHrZVvCaL8T9V2rrU+R/LbgBNw7SX3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LC7OLRl8; arc=fail smtp.client-ip=40.107.100.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LC7OLRl8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhPxRqyxL+aD1rHrrm2yMvaoVIcOerajOMVVpnazHNNJ7waolQ3M/jJpdZmEV6qFN5EmSA3btmIRSp5Mda9KXomvm0t4MTKPOzFHEkj5c1cBRlhbMSLmM9vG/fTcWeWiLhZePmjLc75ke47aOIGnX8Q2wDtnPE5fQdv3RwJUxskYTECQv7po37a2/T81QaJvIqwGmnSenkpDq9PySIsyVAj2kw/yB5na9k5FRXfBKLkGGcBzbezkYkVovTUvUc/3rNgj5EIIi8m/U1WJMbn8JhS+hK0WUxFgOvnGRv7mlkKHk0S8bkwG1ggL4OaPANLKjtow/cNX8C6Trgnja030/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IJOSttbBxzEbGFUtVWM9lBDDiFYsQU0iTeFpewfsFU=;
 b=E/bUBdUJyF/l/FMM4nPBQM61kIBscBG7IqLFaKhQ8ELIiq86WqZZdvXmZQH5b/yor4EcNNsIk5OHA7mPgIlPMNUeIcTheRmL9dR4sbWsqC7XE/uCNNzcO5OB25OnyW4yhj8M4iALF4piRtq5Mfgcl14G8d4JjVQOtvDcNlV1q9gIE+qQi9T08Z9ALQCoS/9GJ4Tf/nt4qS+5sBuLZoZ2h4ek8XNT23ZfpplbFIGZTS0TSry7RWkqp5KaIL7qmy/AxNhD2KWH6l1wlNqSQVwKfYcw9R0yoHvW64MUJl1yLLQP3XHPiBs319oN0VHhpW0uMRm0QVobrg9WOEEuuK9S7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IJOSttbBxzEbGFUtVWM9lBDDiFYsQU0iTeFpewfsFU=;
 b=LC7OLRl8+Rxhts3dpCuhrKavfppuLBt4daz6rQc41g+1ESqHq9hWsrXAzJfpFL2nHpFwPdBXhccbk6cp0uqa/Ou/I8lbI9oTkHKcSx29mTrriBSvHu/Ej0jumZeDNoKRkLsFRtdV8LneUY4dz+PCT05SX4wSMFntZx2uQ+UFd0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Mon, 19 Feb
 2024 04:20:41 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8%4]) with mapi id 15.20.7316.018; Mon, 19 Feb 2024
 04:20:41 +0000
Message-ID: <98a07fba-e248-4a54-bacb-76944319f875@amd.com>
Date: Mon, 19 Feb 2024 09:50:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
 <6d9cc65a-1eed-4fe7-b875-dac9e6bfdacc@redhat.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <6d9cc65a-1eed-4fe7-b875-dac9e6bfdacc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b59a31-db21-48d0-64de-08dc3102223b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Rbbpxk8cm+FUL1rmT+ViGXeP0Wvu2CdUkOyTpN5M5f5vsgG54H1qwElWf8YtW9PZPGuj4SRJ0i9+BZmixvrlOEYj6lL+aaZ5jN9N+YPqXx554KdEIJAxOyfqAwjV4mpskaY8qMTZTC5w2MsPEULviQ4TFDwM42h0hSpGFRygrcciohuI6uL9mvzIgjDzU+ub9zsVFbyFWPT52G5eQb00IpZhbAAdbLCMDHlEt34SYAiIVBWSa4TfeJw/h5RcbKHxezbFcaPRrP/YioHD5nblXImQ13Eqojrx3RNveWGXUKniuUXiHPejch7qeltzcU/5d4piyTB+LLTitio2rsDzp05OFSu+QmS02xURxLZl1Gcq3ljEzKhfLe5Sa+VJL/J35ej/oB4PsYVs0tEwynrVMHM+gJO2GvQmI3NffDtzUtZtvjTylvvGgTFbIlaIC63qq96FPKA33xu0auegQWF0+82CnbtwyKvzo0SRbsUEoSB0m11KOdDWiGyl3EFE1U4cejxrgBkv2Ae3roiKxRGjk6Mbh9wCdu0RJDFZbvD9KoI2BwLpjgCFw2ow3v6dIUo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(86362001)(31696002)(36756003)(38100700002)(478600001)(6506007)(53546011)(8676002)(41300700001)(6486002)(316002)(6666004)(83380400001)(6512007)(2616005)(26005)(8936002)(31686004)(66946007)(2906002)(5660300002)(66476007)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVNhY3hLQnd3NVpYTnhaV1BLMkZvME91Y2xERUZwbEJtMkFCZVd6ZTdzYWlX?=
 =?utf-8?B?S2paQlBGOWNpVWtDT1Y0NmFScTJvSlJ0ZXpmaFZNRXJGWVJKWE41eTZQYVFN?=
 =?utf-8?B?aFR6YllLK0tHNWdjK0JRU3hVN1VYalkzWlQweVZJdVo0TysvOGtaeWFJY3Ur?=
 =?utf-8?B?MmFVR0NGd3RmMGRESkUvNWJQWk1zRTZWaW1zRCsvNG91UVk1MWNTaEJ3RXJF?=
 =?utf-8?B?SVVVTkJDQWpXbjJpUGlRYnFhRmJtVjN5VlNHdU92U092K3JERHE0OUp1d1Mr?=
 =?utf-8?B?RUpIeEthK2EydmZCZmdBelJIeTNHT0RoL2YwalRpSERibVdjdkloanVFNTN1?=
 =?utf-8?B?U2hkTklRRjU5azEwenBtTENDRG1WL1FaTXNzcDJ3VkMrejM2Sk5wWlpzWXBh?=
 =?utf-8?B?M2tCMVc2ZWZ3WTZQaXl6QmQ4aDd4K0FWMHYvSzFJSkpIM1dvZWRHUXh3emNH?=
 =?utf-8?B?NkdWR0pWdnNCOFp6YlVlRW9WNi9NTEg5dzhnT1Bkc2pOMHZxQy9yNjJ2Q04x?=
 =?utf-8?B?UlJXR01oaDl3N2kvMmRLRWlHUUZWME1OQ1ZUckhMbCtJL1hqUjZ2SFEveTVF?=
 =?utf-8?B?S0IwR3hLZGpUMUR2NGptd3dvRkpjV1Z4Mzd2dHVQcnlPTUdDcWRiTGxBblNC?=
 =?utf-8?B?dGxlTzlHZGRKUXJxQmZ4dWptUWhOQ0tRMEJueTY4OVQzQ0R6Y2ZaWTNHYkNu?=
 =?utf-8?B?UTk4cVc4SnVCSzJrREwrL3prVitadlozQVptYUx4WHNLM0dRK0duUUlCZ3VT?=
 =?utf-8?B?WjRidUNHN0c1WHNlNk1LWFErYktzcmFmNGk0U2lBNFdacTMrSzRKak9wQk02?=
 =?utf-8?B?VzlMdHBTRmZiVDhwUzg2L3NvSlIrek1aRnBzU04wZGh4cjZmM21oV0U3czhX?=
 =?utf-8?B?RStjd1BQVWJVSkV1dmIrVjMrWDZMZEM1NlhaRlFzeTJWUW5VNkNJOVNvdW9h?=
 =?utf-8?B?VmtnMEthL0xLdzVVVlhua2FUcVA1YlJCYVJYSzNOVEVzUEdEaWMrREVoaVhQ?=
 =?utf-8?B?Tm5RNEt4QzVoaXBLUVZZTmZyZXJYTExCU3k1RTVYczhhalQvUHJuWGFYUTM2?=
 =?utf-8?B?RFVaeXJDYS9CYUp5K28weUlWaGZ4Smtnb2Q0YVZTbWpXb3JpRzFIamZQRFk3?=
 =?utf-8?B?RUdqWjNHaGlETFRXMzc0VmYxM1RSMGF3cjlWaXI2WXJJV2t4T2d2aWliYnFv?=
 =?utf-8?B?VkdJeDU5Q1F5STRKdnQrVjNRNzlMbWhDUmpxbmRPZkkrV3owM05KREc5czFQ?=
 =?utf-8?B?RzFMZ3ZFeXpZYXl5dTFxWmxPNEpDZy85KzVlSWkyY0p5NC9Ja1UxMzZDWHRw?=
 =?utf-8?B?NFRlMytEQzZySlZZMzA1ZVFZTUs0M1VhQXRLOHpPU2JHRVhPRHBPUlRlQkJh?=
 =?utf-8?B?enprV1Z1REZlbnZ2ak54dHFCeW1hV2ZuTnRBR1lNOW9LZkU0ZkxxcldTUW1I?=
 =?utf-8?B?Tkw1Zkx5Rk1EWHR4VGlwbjJPclZ2VWxiZC9lNGNzRFBwQzMzd3JpOHU4ZVZ4?=
 =?utf-8?B?WXpvWW1FSTV2MDhMZ1V6MDd4YjJyN3ovMklXaThneDhZVitOR1U4Mk5Pc0o0?=
 =?utf-8?B?V0ZJbG0zNU9hd05HNEh5cUNpRDZsMzY2VXY2b01zNDNoTUtudVhYRzRHUzl0?=
 =?utf-8?B?bnRqSHVnU1JHNEwwUjRkL3hNOFh4dTJhQUlXQi9DclBZcXlrWnpkaXRaWEpk?=
 =?utf-8?B?T3F5YkExYVJKd2dsZVUwNEVxS3V6T2JEQXVVMkR3OHVSTmJ1NDMzNXpGZ3JJ?=
 =?utf-8?B?UjVFWGZZK0pCazMydkxkWWlKd0poLzRObUphaG5qTVh3ODY5RHc1NmF3NzJT?=
 =?utf-8?B?TnA5aGtBNjI4aDZIVkt2RitsbURRSVFRTUQ3Mi82OWdKSlRCL3B4VkM1QW1p?=
 =?utf-8?B?MU55OHdkalZBZHZseGZiWGxSR3c3WVFlbUplZ0srM3JhK2hTMG9oQjQxVlJH?=
 =?utf-8?B?N2NSaC8vTGVJSzhzZlNRVDNOcy9GRWRrcHJITlJ5WWg2bUFGTHN4TzM5d0Zr?=
 =?utf-8?B?MEtYU3M2L2JBZzBKY3lkM3BHcmtOWWE4QXMrMytSbkMvZ0V4S2pHdE1HVzBu?=
 =?utf-8?B?b2tJM2cxT1BoVWZLWGRQclhXWTBUcTl6eVVhZE1sYzJhUjVGM1Zxd0RMQVF6?=
 =?utf-8?Q?8cVnvjvLyBH+5e9xLc4Md4CRZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b59a31-db21-48d0-64de-08dc3102223b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 04:20:41.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFjygyGN50h9lrA6JSEFj+AVSQcodnQbEuXhkiGbwPb6/otgHjwbq+JyBqvXX3360H45WC7O7i0Uh5874VOalA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011

Hi Hans,

On 2/18/2024 15:54, Hans de Goede wrote:
> Hi Shyam,
> 
> On 2/16/24 07:41, Shyam Sundar S K wrote:
>> Improve code readability by removing smart_pc_status enum, as the same
>> can be done with a simple true/false check; Update the code checks
>> accordingly.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v2->v3:
>> - handle missing case for amd_pmf_init_smart_pc() after removing enum
>>
>> v1->v2:
>> - remove enum smart_pc_status and adjust the code handling
>>
>>  drivers/platform/x86/amd/pmf/core.c   | 11 ++++++++---
>>  drivers/platform/x86/amd/pmf/pmf.h    |  5 -----
>>  drivers/platform/x86/amd/pmf/tee-if.c |  4 ++--
>>  3 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index feaa09f5b35a..1d6dbd246d65 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -330,9 +330,14 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>>  	}
>>  
>> -	if (!amd_pmf_init_smart_pc(dev)) {
>> +	amd_pmf_init_smart_pc(dev);
>> +	if (dev->smart_pc_enabled) {
>>  		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
>> -	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>> +		/* If Smart PC is enabled, no need to check for other features */
>> +		return;
> 
> This return here is new behavior and a minimum should have been
> mentioned in the commit message.
> 
> I plan to prepare a set of fixes to send to Linus tomorrow,
> so I will take this as is. I'll amend the commit message myself.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> But next time, even for a one liner like adding this commit split
> it out in a separate patch. Especially when it is causing significantly
> different behavior of the driver as is the case here.

Sorry. I thought I amended the commit message, but seems like its not.

I will take care of this in the future.


Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
>> +	}
>> +
>> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>>  		amd_pmf_init_auto_mode(dev);
>>  		dev_dbg(dev->dev, "Auto Mode Init done\n");
>>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
>> @@ -351,7 +356,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>>  		amd_pmf_deinit_sps(dev);
>>  	}
>>  
>> -	if (!dev->smart_pc_enabled) {
>> +	if (dev->smart_pc_enabled) {
>>  		amd_pmf_deinit_smart_pc(dev);
>>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>>  		amd_pmf_deinit_auto_mode(dev);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 16999c5b334f..66cae1cca73c 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
>>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>>  } __packed;
>>  
>> -enum smart_pc_status {
>> -	PMF_SMART_PC_ENABLED,
>> -	PMF_SMART_PC_DISABLED,
>> -};
>> -
>>  /* Smart PC - TA internals */
>>  enum system_state {
>>  	SYSTEM_STATE_S0i3,
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index f8c0177afb0d..8b7e3f87702e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>  	res = amd_pmf_invoke_cmd_init(dev);
>>  	if (res == TA_PMF_TYPE_SUCCESS) {
>>  		/* Now its safe to announce that smart pc is enabled */
>> -		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
>> +		dev->smart_pc_enabled = true;
>>  		/*
>>  		 * Start collecting the data from TA FW after a small delay
>>  		 * or else, we might end up getting stale values.
>> @@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>  		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>>  	} else {
>>  		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>> -		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
>> +		dev->smart_pc_enabled = false;
>>  		return res;
>>  	}
>>  
> 
