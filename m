Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857F4E95A9B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376839AbjJIPmi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376463AbjJIPmh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:42:37 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C839C
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx1b5F1mx1mO9gt2orp6YNIWgvclDh8skrNoW7UjF91v8kgRnUbwSgUFo7POEFJ8fdLZRXOTc6ljsVb91rVXAfN4YA2e8wDN3OmtwjvZG3NIHx8Cp+iiHGyK0lrvvaYEyN3+u4cC7v/X9QfqErzsIB9TCDgFLi2UAGg3lvwMiRe/bSrnRqH+K5trKiDj3Dx7eg7e48Wha3PIh4k0kqSZB5Z8zOsu1uWYalUOMDg/NAR0Q787fxTuQRvc9tLbi7OrMCg24E1Dgh0HOr7YUsyq69r3Ev7doIgxRzZSvzlGuSnivsUD2FXjrFLPch9/VYph6zyGZpQ18sqA/p9aj4J7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kk/BH8rnARI68EUaSIYMXf0NALzDgNuUOpkJS/MHfuw=;
 b=ESVm6P1BSlzekQATJhT4i26YUW7ZwmnJvnTyccGvxB8MUR55NDf+ywTPB/A+5w7UcEGQ6Yegp5qMhl4OjzL/6AtlxBm50Q/6pIrzfM/4mhxjD774oTecH2JI/7PoTsZXQYYOHb3KK/uURiJ+4hCzY8aozzDDdz8qkPZGvceXBCeoR1YhgbT/YEMG6kuA/HnUcP3oxYQrIbEP9RW3OTrA4JfawcYGdzdNbPq51VS0Sy8VBIvEE84iwZJmu53DdFwiFwFGzD4uC63GeOtltRb4q466wW9CUT3mEleVOa49QTfDmgZdWF6gFLEqobrqEfiU4v4N7Y4R4WrsKM7+JwdcDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kk/BH8rnARI68EUaSIYMXf0NALzDgNuUOpkJS/MHfuw=;
 b=vvBxf2mH1gffTDxAYYMGA1BaAQf4KVYSzyNqDXgXN0uudIYpnJ9KIkkJqkA9fh18oGXbJLeE8Z+d2maDPSTvYND/AYsHX1zkLSY2RKw2G8o3hYWWbw8A/l63FgVg7q2G/htPhWBDJMZRelVfpTpmTYklhRaRJ8LuNpmkUBu0Lfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 15:42:34 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 15:42:34 +0000
Message-ID: <d7de4449-0a23-4930-9256-0852e88badf1@amd.com>
Date:   Mon, 9 Oct 2023 21:12:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Fix fetching DRAM size
 mechanism
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
 <10d574b6-a197-6a57-92e9-5b548dc3df67@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <10d574b6-a197-6a57-92e9-5b548dc3df67@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 80100cf4-9f72-41c5-4062-08dbc8de5b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d5KPHuAAcM2DMkbb2B9jmhh5Eu6TyTL5xvn4yEVRutDC/oXkR+OKF4OKxObFiHuRwslZ0FqbUW/ZylbvPyn3bJ379/cdiUTajpOfmyfTNG37WlLTtd8Fr9I6Wp1ey8hPC1be8KNdS6iX28iYqU/8vUk6Ub2KXKWEbFqpkldy2hPUhK2EcSrF8gpcOgI9/XWpMOMNuIF+ZnqKVOX2xwJp0wmQsovn1xugexF1d0buaYA28DhV5XHWHKNOB+Sr+nZZ4BFm6XcCaogeSgboJ3n8SsKOXNXdOra9LSlMB0Xfs7kPQTL3De1OHY0UbVCO2EkL6iZmniO9zB1bsZiHIdGBdGAT3EWd2DOI2Z1gXFtJJWbPfOHJ51IwyEvokLw2WNcET26OJJYs+2IrxKkAmZCyl6wW0NDH/syxx4VX7uYD8ieXX1TxxjQH8PGJ3tyBh7yNb+TDFRgzIk3PVJqyjp6EiEQTneGs981vQy3blo8wVrJI2iWJQJfaK/aIo1N28UNvNCYB3hwWlz1l46NgjMsnoRkQVmvOYNpx95USCN+X1b6qM25F178ml3prvbbp8pCC4eWoEuIPzQ0dXJI7hmn+EAWjlp5MlNtQQiH8jG2sJ0+jgY1RT6Pqf8gxiHp87cnaZS0HUUq/V+DJTG4L7udiiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(86362001)(31696002)(38100700002)(36756003)(31686004)(66899024)(53546011)(6512007)(6506007)(6486002)(478600001)(5660300002)(4326008)(41300700001)(6666004)(2906002)(8676002)(8936002)(83380400001)(2616005)(66556008)(66476007)(66946007)(6916009)(316002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnFVb3RXMlhObDRlaUhta2w1UlJzZk9xV3hSaTdHK25pakhvU3IyenlBaFlt?=
 =?utf-8?B?ZUR4dGplVFFNOElRRm1QQUZEbnNDVFh2aEtyeHZZVlZPQjlXQU5VdURoUDdQ?=
 =?utf-8?B?VU8rdXhkVDBKOE5LMW5NUGdVd3R2STJVZWhqVXBneGJqcmRGZy9GajZ0UUFn?=
 =?utf-8?B?Sm1NaXp3K0FQU2hyb1Zrc2J0QkVqT3VGNFBNaTVPUnYwRHpWdjhubjlCM1pq?=
 =?utf-8?B?bzYyMUVYamI5NFJGVUJzWXVjRG9xc3UwOWNmS1ZIUmxNaEtEU3VBczZpaUgr?=
 =?utf-8?B?eXlIRERGNDJaLzlaYnA1Zmxia21hek1vdVpIa1NYYU94TjNpS05NcG5JWllL?=
 =?utf-8?B?dkxnZ01RK2drMGt0UFRXK2psK1lvYnNpRytBY3I4VkNvWGNmRW9HMkV3clBm?=
 =?utf-8?B?Q09MU01zR29vVFRqaTRRVXIvdFFMWUhTKytsbG5pM0VKSjB6a3F3YnZURk1q?=
 =?utf-8?B?dENNSkVLb0g4NXp6TVY0OS9sWG9zYmFrTDNVM09rMERuNTMrYjIvQ1FtUEo3?=
 =?utf-8?B?UTB3RWZRamM1djFzMW94MFdYc0gvMzVrdVlzYUU2c3hiUzgrZktUZEdoMk51?=
 =?utf-8?B?YllvZ2htZmNvTkZvemdkMUtjZGRkd2dUOGF0dHhCbm9yNjhOa3BJakVLWHVC?=
 =?utf-8?B?TXhpa2hMZW9keFRSazlURG1XRy95ZlAzS2RmUWZHck5LUHltWnhCcVk0Sk4y?=
 =?utf-8?B?QjN4SWtVbVlsOHAvSUtxV3R2c3Y3bXluRmQ3dEFYblhZbS9YWWNqS0xiTElT?=
 =?utf-8?B?YmZObno4MjYwK0xJRk4xSTI4QWtuWm9yZUF1a0ZvbkJtSnFZYW5QUjF1bWs3?=
 =?utf-8?B?NVpBcmYvTjhFSnBNSk52MEdoSjh1K3pIdmQ1bVZ1enpXaFpWbTdQNEczaXhn?=
 =?utf-8?B?dkpUSDVWcVZNUEFBMzNRejl2bWxNMTlBU1lib3RiUHRQdHJhVUN3czd5ZGhD?=
 =?utf-8?B?cVBPZU53T2Uzb3ZiS0Y0ckVMYnNmWGZlZ2E3OXF6aXI1dGtFWUNWb3MyTTlv?=
 =?utf-8?B?MmgvZndXVktCZCt3bzJpUjA2V2o3ZFN5WEtHWXNQVmNyUmJnZ1B2Y1NoMVEr?=
 =?utf-8?B?QUVic0tROWJYMnlObjhQQzJna2pMaG5SUjZ0U2F4UkhxTXV5aXNFd1cyVnJP?=
 =?utf-8?B?V1RudzlTU1RPT2l2cUJwcEZZQ2IvcmtpYXlYbGZYYXpTQm85blJVMTJFelhL?=
 =?utf-8?B?TzhMOU1SRzVaTEFib3J2Z1haZUc3K05GYVZLaVZMZmR2TTUxRGNDdkJlV1Zh?=
 =?utf-8?B?NDVaUTNwcEFZMzJTTFN5dzNOZmFBcUo4N1Q5UWxBOGIrOVJKcnRZUlBKYXZK?=
 =?utf-8?B?NkRodnhkYW55cE5VekdkajZ6N1B1ZVFlUHRMcmYwWExHdnpLWmk1eFFNWW1t?=
 =?utf-8?B?MVJxaDA0RmZJS2pkN3RpQVVFaHFOVlBwK1JqTkhQcmtENG1sU2h1ZGpnOGt6?=
 =?utf-8?B?NndQZ1NkZ0FuWlgrQytWWnBtdTIyUkRDcDlxWGF5KytvU3dsQ2ZhZldIcmQv?=
 =?utf-8?B?dE5PMDZMazR6Tk1pK0V2bzNLOXgzMWJsVm5mNzJQZWxEYkFtbTFxN0lVWHZV?=
 =?utf-8?B?Qkh0dFpYT3pMMTdSeE1jNXpSa2RQK2ZLY3ZWeGxXbG4zcktkVUJ4UUl1RGZt?=
 =?utf-8?B?UFA5VlgrTzVaWUw0QWd1TTlKMUFOOVVKYlphTHdaTm5tdzU2U0tDVlkrZWtq?=
 =?utf-8?B?SWY3WTNjWEE5WFFtd0pobW52UDE0bFAyTjJpaXNpMUdqSDJST0NMS0s5Q3lI?=
 =?utf-8?B?L0ZIbXhMS0s1VzRFSXljZ1VmeG0raWZXQlVWU0xBYWErTVZXN0loU3k1OWJj?=
 =?utf-8?B?bU1ybWRqekl4UEYvaU5rU2VYbHk5V2Z1djNZVHFnV21pNFF0cmxvcnVlQ3Zz?=
 =?utf-8?B?eEhweThDWElmNWtrclMxeHMyayswanhwV2tBOVJvR2JQazdtU0dwaUhqdHRU?=
 =?utf-8?B?V1kySjZpMGh6N1Y2RzNIQ052OFUrQmRyMk5DR0pwdWd4c3YzbzZCMno0K3BB?=
 =?utf-8?B?UmZ4RlJoajNWejhGbmVSSU9zcWIyQkxMZnNQZXdoMHZjTzV4VFZiVVdVMkIv?=
 =?utf-8?B?eGlSRm1GbXpxalR2Vll2eWhtRnMyUndnOHQyVGkzOTcwemFRNGlTM1ZIWno1?=
 =?utf-8?Q?psT7e4KTMxpklWlCL34GNoeQb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80100cf4-9f72-41c5-4062-08dbc8de5b16
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 15:42:34.2385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQUR5XtLXAf83BRZqJXFjtEI680p7LMk/g2Dz4wSKslZcOVeUqWPSalkXNDBjH/FMuDzuIQ5PK70qJTstdqngw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/9/2023 8:29 PM, Ilpo Järvinen wrote:
> On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> 
>> amd_pmc_get_dram_size() is used to get the DRAM size information. But in
>> the current code, mailbox command to get the DRAM size info is sent based
>> on the values of dev->major and dev->minor.
>>
>> But dev->major and dev->minor will have either junk or zero assigned to
>> them until at least once a call to amd_pmc_get_smu_version() is made which
>> ideally populates dev->major and dev->minor.
>>
>> Add a missing amd_pmc_get_smu_version() call to amd_pmc_get_dram_size().
>>
>> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
>> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> based on review-ilpo, can be added on top of recent stb changes
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 1424c03c1f03..92adf4523736 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -981,6 +981,10 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>>  {
>>  	int ret;
>>  
>> +	ret = amd_pmc_get_smu_version(dev);
>> +	if (ret)
>> +		return ret;
>> +
>>  	switch (dev->cpu_id) {
>>  	case AMD_CPU_ID_YC:
>>  		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
> 
> Does this really belong here? Correct me if I recall wrong but the reason 
> why amd_pmc_get_smu_version() was not always done during init was that it 
> added noticeable delay to boot? Based on that, I kind of assumed it's 
> generic thing (and a such, unrelated to amd_pmc_get_dram_size()) so why is 
> this call this deep in the call chain? Perhaps amd_pmc_s2d_init() would 
> be more appropriate place for it since you now make the call 
> unconditional anyway for that code path?
> 

Yes you are right. I see a remark from Mario also on the similar
lines. The best thing is, let me go back to our FW team to understand
when do they report dram_size and what is the implication of calling
get_smu_version().

Thanks,
Shyam
