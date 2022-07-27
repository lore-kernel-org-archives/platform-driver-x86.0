Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A3BC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 23:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbiG0XwK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 19:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiG0XwK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 19:52:10 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7225C350
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 16:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9EV8pa8KfsaoTVp7vz0Whfhpdi9oCOmLRGbZ3wKDqpzLDhsRvGooVesBoQ+iWJSNDHxyvY8YNUr6hgRQz0PpdWKL4EY1cUWjWNfMNvxAOFOJnJEo8hL1/vbkVbnajhgSK9KCrqXVauAlEojHYiHonQDtsU5gvtY3yuHRGcjAEfktaV1a+u6TMsxlVCd4d7iFgtxTtq2diOymQJNyc6OlyhrciHQQSql3vzKN/pXUTCOOySbGPOwEdTEgoZNdBiYT67/bVyzunZ3h1mu2spcqUpagaWZeUwKHrkeK9mBzYEgsHxvXAGg8OLfbwte/s8jaCBFv0fDLCezfdwGjwiaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnbeRcjMXDIIahzeIzracGrH4U4QcdLEgbMI2uBTHSY=;
 b=Yoct2pqMQqEh/6Afpj1o1qSxWF5POOGOThAZjSxImSQFFDlcr07spvUz9Asqki1RQqm+gGS4Ytjo00GHp3gZkch7j1YjjM+Jzb7av48seNpWNnocA1I77XaAaJkKjQ5N++JGJpXCviM/yyeUTvCUOD3jD/YQk/ZUdXskneS2G8aYpkr6NYxhsMU9y9DXkWrJpq395rnlGrXjuCIzrrtn9jJbbhk29LoJrMrBRAScrgkG6JTFMVsfh1EiUNP7y4N4o3DNt5vVCAjjJkL2+hMP0A/HKL4xI/dIrXspA8FnrwMt8kvIY5RzkYjTSfkEwo/0xAgz/yLp42uM19OeLBVLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnbeRcjMXDIIahzeIzracGrH4U4QcdLEgbMI2uBTHSY=;
 b=pPRiIOupd5DIolvUAP6Uzz3jD43YYdhfivORMWYWkgklV1TIUg/vxMqWlJhJBG35kkqA/9XPJe00hJeCcdlGuO+cAjBBqfHvMyD0hSsFCCszPC5pOIG1yEiK+tCADbWWS7Sy10d3krUO948/Y/CCg4qFiz9b6sXXIdsn53eCm6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4530.namprd12.prod.outlook.com (2603:10b6:5:2aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 23:52:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5438.023; Wed, 27 Jul 2022
 23:52:03 +0000
Message-ID: <d01e52cb-31c5-7d20-4f18-1e4bb70c1355@amd.com>
Date:   Wed, 27 Jul 2022 18:52:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mark Pearson <markpearson@lenovo.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
 <4585d2c6-6ac1-a697-d54a-f173e9821446@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <4585d2c6-6ac1-a697-d54a-f173e9821446@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:610:76::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c8e339c-cd03-4b9e-053b-08da702b013b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4530:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vxOnliRpOwXDPW4Jhb5N/6/jFjg+7UQKt4Qlh9FPrU1DKnJfKZZ2ruQlsAfilVBb0Kqaj/fMxmHG8ARrIfXbSc1HwYqUWmwRXY+SZ38Vuekicm4Hzd3ZooApHLfnARwGdYY1EjDy8Yew3heHvllpVZQLUxSGXLu8ZM7zYrXU1BYpecJD4KJvLdjJAP/zPMj0j0H/7t9ALy35Ddvsjxm5zcjAJAcUCCFvkY6PW8K//QUGRMXLcXtS6TEk1EqDu/FcVOVDyuleYbTPkGuUFtHYDVctPB0dT5v1D/OogupsVk4g+OZ2yURnmnoVdI7ystvmmAxSwww2unsyR78U93pqGAvqtAReU2oMtpJpsl/qApc1uKmPrXM8caU6VfYPwj1q8uwcRiJ7cFCAa9uJoeAmBub8XzYA4TVSx637tCNVkSjSeWeCNLRefoNp+dsd2jnDubEyEB1Sx9Iks7E4ngycLEfXg9VFln5JiNscztXPCsyYzzeUMkdVx4rau/ue8vmwgixGoZlj8rUJbPrDhBbF5QMwlLpEq8SeEUnYXi6IK+k3ZX9vs9bmyQcgG8r4JtlVJI6zhOUSddkzDv8lk2hhsNxv3zC92/PWKvtNzsqBma0V3CN8t+2hYtJDyDHKbIVXFPROdbDMrfjBY1bGRwHGOW25G+c+4LXrhss/7xCb7G/TvBjbMqrfdeWRKX2KyPdkbL9leRgW7mpme4vKtQa7Yur57r2hfMUAXijnHIJAPX517gzJdhtAFQkoJQPIVtaczkV4A+/6pPnV89opQtgmlZUXjkik0MquP2Itho2ajZaocqv/YowRbCffiuMn3xBJCRqQAzjmL+ilfA8bQVM9jYAynme3Wht/YY3ZkAX6K5G09aj9zuKhZyQzWGKLpaYpBuzXfCYtRSdFfOSwra4Va9rJ9/WZXBzF0XqP/kOuVePUZi8AnveH4Hz+v4Bj3XRP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(2616005)(86362001)(966005)(6486002)(53546011)(6512007)(26005)(31696002)(6506007)(30864003)(478600001)(38100700002)(5660300002)(41300700001)(83380400001)(36756003)(110136005)(8676002)(316002)(186003)(8936002)(66946007)(31686004)(45080400002)(66476007)(66556008)(2906002)(4326008)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdwRWFEY0Z2aElsNlAxT1N5MHFTZjVXSDNVNG90K29UempESmV3OVZqckxk?=
 =?utf-8?B?MWVTbDFoUWlVVlVYbDhYbkVyQ05qZmFTTGR5N2N1aFRJYWttaC9PMnZoL0ZS?=
 =?utf-8?B?QVkrdEQ2TVlPSkRxRy9STVRSRmtuUDBNV2ZGamVzWWsxS2g4d21OY3lMSVo3?=
 =?utf-8?B?dFJsUndkWTk2L3R0ZUZib0tjdUpNR2JnekVWbEU4SnVrcm9VYndORHphSDd3?=
 =?utf-8?B?RVJ5R2F0YkdiRHBDRG1reERQM0pXUGpSM2RIaW02eFlQcDFHTzZyU1l4dEhP?=
 =?utf-8?B?Vnowc0pMTlUwVzgxL1lScC9rV0ZHaC90dUF5TEcwSFdEQ3Q2dklPb1B4Z3VF?=
 =?utf-8?B?cjFBNm14a2FqL2VHRFo5U3IvRHBoa1JiMisrR2FocjV1cUpHRXVNTEx5STZE?=
 =?utf-8?B?eTMxeTlKaVQxM0s5US8vUWR3a3UzbUFuVTVKNEJLTXhuZ3d0TzVyU2JiOXBM?=
 =?utf-8?B?WEUxSm52QkNJU292UkZ4RmZyVEliTGJ1Z05zTnhUTHdjeHg4cmQxMUZEcWZw?=
 =?utf-8?B?VjNRM2FKMHJxSHkrcTVsMStXYkNGT1RSbjhubFN2MzRtZmkwQXd3Nm0zMXVR?=
 =?utf-8?B?NWc0N0UxZ3RSVHYzcWg3MmpWVVZwU3RSVHY2SVBhU1Y3Zm9JSHVKR0g3K1JP?=
 =?utf-8?B?a0FXOHhqUHE1WDYwWVFZSTR5UnR6cS9OVjBoWmE4dFppblk2TENTNDh0YW9o?=
 =?utf-8?B?K3dyM0trSWk2QThzSUJzbm9YbUxyakFTWW8vN3p2YThNaUNJdTZYWUlFWmFz?=
 =?utf-8?B?Q0tDWnExeUxEL2JBUTFVelVHY1N0bjlWU1kvdWFtMEtXVVlieDRVUW9CQk1k?=
 =?utf-8?B?eWRhUEpHNVBPQVl0eEIrZGJiV1QyTHRYVG45MlVzL0pBcVJQV3JGZFdQSVMr?=
 =?utf-8?B?eTdEU1lkTTgvc253VzlJOXRPaWpUcDlNd1QrMzloaU1TckdzWHZNWDRvK3pa?=
 =?utf-8?B?dmpyOG1VVlRjMkNLVThWTmpDVW44Ym5ISWp6SWx3TERPS1FvelFXRTY2cWNO?=
 =?utf-8?B?ei9CUEt5dFJDcWl1T3JKVUVRUE0ra3dubThtTHpHWTRrR2xoanpkZTN2UllM?=
 =?utf-8?B?ekNsZXBCQ25WSlU0OHVVcVUvczBxWXFwem9CUGNNYW9aUkpqMjBQbHpISnV0?=
 =?utf-8?B?T1NnbStSTFJERWk0Zk5iZ0pLNTJMakJiU2JSNGorZTFsUFZnQytlM1NleTdx?=
 =?utf-8?B?MlFyWUozcjkxTzlWSkw4eml5N0xnUXE2blo1TlJaYnhzUWlTRVhYMWRwV01Z?=
 =?utf-8?B?UmI2NnkrSXlOMTNvbExNU2NSNXBOUkxCUGtObHlPWWh5S3FCN1l2K0duampW?=
 =?utf-8?B?TGQ3bDlPbDNVNk03b3Ara0c2anhzaUExdHNqVW9RRDN6R1BjNmNNeWlJQjJh?=
 =?utf-8?B?cTErV3RwRWlMcUJwUGk4RTA2amxRdG1Oclkra1MvR1lUWWdNSktUOVhib1Vr?=
 =?utf-8?B?S2ZET01jZFZtU1Iramx4enJleC9zV09tQUJoMERCM1B0R3B1RW0yWXJsUXZk?=
 =?utf-8?B?bFluRXFNRmZTeUxabmRKdGhGUmFVKzREZCt4b21NRFpock9Ea1pvWHpWTUoy?=
 =?utf-8?B?V0t4dncrVmhlaHIyclRkT2E2MW9kNFBTL2lqYUpIalNwdDRWQVJRZWorSnVy?=
 =?utf-8?B?dTBhSzFJZms4NEFVQTdVZVJkem9yNmlJNW9rS3F2STV5eEJITmFrT2tJVHYz?=
 =?utf-8?B?ZHc5TnBPMmhRNkJvbmEyeGhMa1pjNE8rbmgxN2JxSnFiSzhWVHZYMnQzbGVy?=
 =?utf-8?B?ZXV0MW0rZ1RCTGo3N3VqNXl5VFlyakI5KzVFWVNRS1VGbXJ1WldyRXkrWk1M?=
 =?utf-8?B?ZTl2TWRSRnJVcTJ1bldobzhGRFZucm1kZ21kMlVMT0g1MEJnYVBYOHprRmRV?=
 =?utf-8?B?Z3YzcndBdnJBOUJNUGdKT2h5Z0FkVnpDSllUS2REdStnc0MyZzBZYjNuQUt1?=
 =?utf-8?B?TW9JbjFKY2gvREJpMjRYS0N2dzJTOVRjQVVuQytITlg3NTBBbnAzTHNUNFZy?=
 =?utf-8?B?a2wzWmZ6dTdyZDluTTI1RkZ2Z002a3NHVlVUTVUyZzQ1R2VRcyt1ZkYwb2Vu?=
 =?utf-8?B?SlRTdFV3V0R3cGpSdExmOXNYUHgweTdJVjBGWW11b1pDZEVlbUNPZVJ5c3Ft?=
 =?utf-8?Q?B4TYfW7DMMQ4xQFWEVnr7MEbP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8e339c-cd03-4b9e-053b-08da702b013b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 23:52:03.3833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHWLnaMQQe+awqVk7zSGIGS/zUBOnS5Jk8Q7c4rdPYFfUEUR+OaCeiyDd9/P42SC4cPk4+iSScN4NUnrqmeOog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4530
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/27/2022 16:46, Hans de Goede wrote:
> <resend with Cc list fixed>
> 
> Hi,
> 
> On 7/12/22 16:58, Shyam Sundar S K wrote:
>> The transition to auto-mode happens when the PMF driver receives
>> AMT (Auto Mode transition) event. transition logic will reside in the
>> PMF driver but the events would come from other supported drivers[1].
>>
>> The thermal parameters would vary between when a performance "on-lap" mode
>> is detected and versus when not. The CQL event would get triggered from
>> other drivers, so that PMF driver would adjust the system thermal config
>> based on the ACPI inputs.
>>
>> OEMs can control whether or not to enable AMT or CQL via other supported
>> drivers[1] but the actual transition logic resides in the AMD PMF driver.
>> When an AMT event is received the automatic mode transition RAPL algorithm
>> will run. When a CQL event is received an performance "on-lap" mode will
>> be enabled and thermal parameters will be adjusted accordingly.
>>
>> [1]
>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Fcommit%2F%3Fh%3Dreview-hans%26id%3D755b249250df1b612d982f3b702c831b26ecdf73&amp;data=05%7C01%7Cmario.limonciello%40amd.com%7Cd72d8627f7ad4088aff308da7019afbf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637945552890705546%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=4gLIOjMo%2FYO%2BkKdqtk4pcLHlsBrLiUb41cTKvuYrcHQ%3D&amp;reserved=0
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/acpi.c      | 90 +++++++++++++++++++++++-
>>   drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++
>>   drivers/platform/x86/amd/pmf/cnqf.c      |  4 +-
>>   drivers/platform/x86/amd/pmf/core.c      | 18 ++++-
>>   drivers/platform/x86/amd/pmf/pmf.h       | 29 +++++++-
>>   5 files changed, 156 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index e9f33e61659f..4bde86aeafa0 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -12,6 +12,8 @@
>>   #include "pmf.h"
>>   
>>   #define APMF_METHOD "\\_SB_.PMF_.APMF"
>> +#define APMF_CQL_NOTIFICATION	2
>> +#define APMF_AMT_NOTIFICATION	3
>>   
>>   static unsigned long supported_func;
>>   
>> @@ -55,6 +57,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>>   {
>>   	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>>   	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>> +	func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
>>   	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>>   	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>>   	func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
>> @@ -292,6 +295,36 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
>>   	return err;
>>   }
>>   
>> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req)
>> +{
>> +	union acpi_object *info;
>> +	size_t size;
>> +	int err = 0;
>> +
>> +	info = apmf_if_call(ampf_if, APMF_FUNC_SBIOS_REQUESTS, NULL);
>> +	if (!info)
>> +		return -EIO;
>> +
>> +	size = *(u16 *)info->buffer.pointer;
>> +
>> +	if (size < sizeof(union acpi_object)) {
>> +		pr_err("PMF: buffer too small %zu\n", size);
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	size = min(sizeof(*req), size);
>> +	memset(req, 0, sizeof(*req));
>> +	memcpy(req, info->buffer.pointer, size);
>> +
>> +	pr_debug("PMF: %s: pending_req:%d cql:%d amt:%d\n", __func__,
>> +		 req->pending_req, req->cql_event, req->amt_event);
>> +
>> +out:
>> +	kfree(info);
>> +	return err;
>> +}
>> +
>>   static acpi_handle apmf_if_probe_handle(void)
>>   {
>>   	acpi_handle handle = NULL;
>> @@ -312,18 +345,62 @@ static acpi_handle apmf_if_probe_handle(void)
>>   	return handle;
>>   }
>>   
>> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>> +{
>> +	struct amd_pmf_dev *pmf_dev = data;
>> +	struct apmf_if *apmf_if = pmf_dev->apmf_if;
>> +	int ret;
>> +
>> +	if (apmf_if->func.sbios_requests) {
>> +		struct apmf_sbios_req req;
>> +
>> +		ret = apmf_get_sbios_requests(apmf_if, &req);
>> +		if (ret) {
>> +			dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>> +			return;
>> +		}
>> +		if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>> +			pr_debug("PMF: AMT is supported and notifications %s\n",
>> +				 req.amt_event ? "Enabled" : "Disabled");
>> +			if (req.amt_event)
>> +				pmf_dev->is_amt_event = true;
>> +			else
>> +				pmf_dev->is_amt_event = !!req.amt_event;
>> +		}
>> +
>> +		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>> +			pr_debug("PMF: CQL is supported and notifications %s\n",
>> +				 req.cql_event ? "Enabled" : "Disabled");
>> +			if (req.cql_event)
>> +				pmf_dev->is_cql_event = true;
>> +			else
>> +				pmf_dev->is_cql_event = !!req.cql_event;
>> +
>> +			/* update the target mode information */
>> +			amd_pmf_update_2_cql(pmf_dev);
>> +		}
>> +	}
>> +}
>> +
>>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>>   {
>> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>> +
>>   	if (pmf_dev->apmf_if->func.sbios_heartbeat)
>>   		cancel_delayed_work_sync(&pmf_dev->heart_beat);
>> +
>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
>> +		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>> +					   apmf_event_handler);
>>   }
>>   
>>   int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>   {
>> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>   	struct apmf_notification_cfg *n;
>>   	acpi_handle apmf_if_handle;
>>   	struct apmf_if *apmf_if;
>> -	int ret;
>> +	int ret, status;
>>   
>>   	apmf_if_handle = apmf_if_probe_handle();
>>   	if (!apmf_if_handle)
>> @@ -360,6 +437,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>   		schedule_delayed_work(&pmf_dev->heart_beat, 0);
>>   	}
>>   
>> +	/* Install the APMF Notify handler */
>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
>> +		status = acpi_install_notify_handler(ahandle,
>> +						     ACPI_ALL_NOTIFY,
>> +						     apmf_event_handler, pmf_dev);
>> +		if (ACPI_FAILURE(status)) {
>> +			dev_err(pmf_dev->dev, "failed to install notify handler\n");
>> +			return -ENODEV;
>> +		}
>> +	}
>> +
>>   out:
>>   	return ret;
>>   }
>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>> index 954fde25e71e..a85ef4b95cdb 100644
>> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>> @@ -111,6 +111,13 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>   	bool update = false;
>>   	int i, j;
>>   
>> +	if (!dev->amt_running && dev->is_amt_event) {
>> +		dev_dbg(dev->dev, "setting AMT thermals\n");
>> +		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>> +		dev->amt_running = true;
>> +		return;
>> +	}
>> +
>>   	/* Get the average moving average computed by auto mode algorithm */
>>   	avg_power = amd_pmf_get_moving_avg(socket_power);
>>   
>> @@ -161,6 +168,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>   	}
>>   }
>>   
>> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev)
>> +{
>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
>> +			dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
>> +	if ((config_store.current_mode == AUTO_PERFORMANCE ||
>> +	     config_store.current_mode == AUTO_PERFORMANCE_ON_LAP) &&
>> +	    config_store.current_mode !=
>> +	    config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
>> +		config_store.current_mode =
>> +				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
>> +		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>> +	}
>> +	dev_dbg(dev->dev, "updated CQL thermals\n");
>> +}
>> +
>>   static void amd_pmf_get_power_threshold(void)
>>   {
>>   	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
>> index 2b03ae1ad37f..eba8f0d79a62 100644
>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>> @@ -101,7 +101,7 @@ static const char *state_as_str(unsigned int state)
>>   	}
>>   }
>>   
>> -void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
>> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
>>   {
>>   	struct cnqf_tran_params *tp;
>>   	int src, i, j, index = 0;
>> @@ -117,7 +117,7 @@ void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_
>>   	}
>>   
>>   	for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
>> -		config_store.trans_param[src][i].timer += time_lapsed_ms;
>> +		config_store.trans_param[src][i].timer += time_elapsed_ms;
>>   		config_store.trans_param[src][i].total_power += socket_power;
>>   		config_store.trans_param[src][i].count++;
>>   
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 674ddf599135..2a3dacfb2005 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -109,10 +109,15 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>   	enum platform_profile_option current_profile;
>>   	ktime_t time_elapsed_ms;
>>   	int socket_power;
>> +	u8 mode;
>>   
>>   	/* Get the current profile information */
>>   	platform_profile_get(&current_profile);
>>   
>> +	if (!dev->is_amt_event)
>> +		dev_dbg(dev->dev, "%s amt event: %s\n", __func__,
>> +			dev->is_amt_event ? "Enabled" : "Disabled");
>> +
>>   	/* Transfer table contents */
>>   	memset(&dev->m_table, 0, sizeof(dev->m_table));
>>   	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> @@ -123,8 +128,17 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>   	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>>   
>>   	if (current_profile == PLATFORM_PROFILE_BALANCED) {
> 
> Hmm, I guess this is also why the platform_profile_get() is necessary ? Because
> on Thinkpads thinkpad_acpi is expected to be the platform_profile provider and
> then the PMF code wants to know the platform_profile setting from thinkpad_acpi ?
> 
> Can you please explain the expected interactions between thinkpad_acpi and
> this code here a bit more ?
> 
> Since we now only call amd_pmf_trans_automode() based on the AMT flag and
> that flag is controlled by the thinkpad BIOS/EC can we not expect that flag
> to be cleared when the profile is not balanced and can we thus not just drop
> the current_profile == PLATFORM_PROFILE_BALANCED check all together?
> 
> It seems to me that if current_profile == PLATFORM_PROFILE_BALANCED
> then enable AMT, else disable it, logic belongs inside thinkpad_acpi
> and not here?
> 

It actually already lives in thinkpad_acpi.

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/tree/drivers/platform/x86/thinkpad_acpi.c?h=review-hans#n10489

By the control point from thinkpad_acpi BIOS events will be emitted 
controlling whether AMT is running in a given mode.

So yes; there is no need for this here anymore.

> Regards,
> 
> Hans
> 
>> -		/* Apply the Auto Mode transition */
>> -		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>> +		if (dev->is_amt_event) {
>> +			/* Apply the Auto Mode transition */
>> +			amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>> +		} else if (!dev->is_amt_event && dev->amt_running) {
>> +			pr_debug("resetting AMT thermals\n");
>> +			mode = amd_pmf_get_pprof_modes(dev);
>> +			amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
>> +			dev->amt_running = false;
>> +		}
>> +	} else {
>> +		dev->amt_running = false;
>>   	}
>>   
>>   	if (dev->cnqf_feat) {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 0532f49e9613..9ae9812353cd 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -17,6 +17,7 @@
>>   /* APMF Functions */
>>   #define APMF_FUNC_VERIFY_INTERFACE			0
>>   #define APMF_FUNC_GET_SYS_PARAMS			1
>> +#define APMF_FUNC_SBIOS_REQUESTS			2
>>   #define APMF_FUNC_SBIOS_HEARTBEAT			4
>>   #define APMF_FUNC_AUTO_MODE					5
>>   #define APMF_FUNC_SET_FAN_IDX				7
>> @@ -51,6 +52,7 @@
>>   /* AMD PMF BIOS interfaces */
>>   struct apmf_if_functions {
>>   	bool system_params;
>> +	bool sbios_requests;
>>   	bool sbios_heartbeat;
>>   	bool auto_mode_def;
>>   	bool fan_table_idx;
>> @@ -84,6 +86,24 @@ struct apmf_system_params {
>>   	u32 heartbeat_int;
>>   } __packed;
>>   
>> +struct apmf_sbios_req {
>> +	u16 size;
>> +	u32 pending_req;
>> +	u8 rsd;
>> +	u8 cql_event;
>> +	u8 amt_event;
>> +	u32 fppt;
>> +	u32 sppt;
>> +	u32 fppt_apu_only;
>> +	u32 spl;
>> +	u32 stt_min_limit;
>> +	u8 skin_temp_apu;
>> +	u8 skin_temp_hs2;
>> +	u8 dps_enable;
>> +	u32 custom_policy_1;
>> +	u32 custom_policy_2;
>> +} __packed;
>> +
>>   struct apmf_fan_idx {
>>   	u16 size;
>>   	u8 fan_ctl_mode;
>> @@ -171,6 +191,9 @@ struct amd_pmf_dev {
>>   #endif /* CONFIG_DEBUG_FS */
>>   	bool cnqf_feat;
>>   	bool cnqf_running;
>> +	bool is_amt_event;
>> +	bool is_cql_event;
>> +	bool amt_running;
>>   };
>>   
>>   struct apmf_sps_prop_granular {
>> @@ -417,9 +440,11 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>>   /* Auto Mode Layer */
>>   void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
>>   int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
>> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
>>   void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>>   void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>> -void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>>   
>>   /* CnQF Layer */
>>   int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
>> @@ -427,6 +452,6 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
>>   void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
>>   void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>>   void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
>> -void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>>   
>>   #endif /* PMF_H */
> 

