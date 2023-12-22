Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9608F57
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Dec 2023 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WSsAbp1h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GW6BLYeSlGkj7+PV28yRzpMqSItzuVKQTIHvm3BlZEClm/MVVdifXy4H0Xv95OhlBqbOOuVOqPzaPowobavdWbk1m+hi9T1w96igDyDAdpo5rysDLS8Y6IGkUBI9ApTG6xPQMkSXSD/ql5bX5VkCZZHTr+qsKiNcBjvw/fhpHJEaNmJErmQSKpjJ+xNKaN4mqCL29Dk6n98/xalwyamSbUgPaYChK8TfvtcEf36yaxSQdXXsDd1c1lH6NZrshRGQ5o/azr5KnlJvaz+V81abri4wZ67wv/IVQv8ZzDTTjaMDUrgD7oWI8G+xDToRiCsX59RGP/03vyADWyZby3QPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4f+qTcL3r1paRL6UPCIYL0dHHZiThGuSVYpA3lIMJXE=;
 b=V5wCy68/D8fFmvw46uoKNyX36l8IVdHgE+t1RXGe2/+WNnXdDyvlL2ngirlsKmk7VaPJrgQVkwP2Q7fJU8va5MthGBxfROnsKXYlEuBnEBEWRUTDyhD5gfF/LZXKMS3kPhfgrDhXQqcUF/y96GwBaOKbkeF5x0djKAIKGaXHGdqLaa6AW341UgYwIyYLtSg0iFkH/xVA55zUh6QBjkWMvsk+IrEqjWbKDptKsQI52zA11kWIhyDAZWTjy9Jk0UPhXSoY9pPR1OzPlL3rGwwwFVdMcya13gBCuC8qT5V3dsRjqB0VbQEhBOm2f/VS728/T2MwyyBhmawk8nAnWnxEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f+qTcL3r1paRL6UPCIYL0dHHZiThGuSVYpA3lIMJXE=;
 b=WSsAbp1hW+3kvKg4gEjsMhK6Llf4BxShmZzV2J7zfFpT2Cqf2EnmGycVuzJN5VrldqLQazwDlip8KLr47wLVCEJI33IwaHIRXVgcAhZgoDTkwLjNm1PQ4NWaEVOGtdQ7VfNhnHUI0AqaVnr6dEuZHkBTSsGoDFn9xVuSm0+U/gw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CH2PR12MB4971.namprd12.prod.outlook.com (2603:10b6:610:6b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 06:43:13 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::27d5:9024:445e:5c45]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::27d5:9024:445e:5c45%7]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 06:43:13 +0000
Message-ID: <422f9b7b-dca0-f316-abb8-7d54f759ce08@amd.com>
Date: Fri, 22 Dec 2023 12:13:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/7] platform/x86: Move hsmp_test to probe
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Thomas_Wei=c3=9fschuh?=
 <thomas@t-8ch.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
 <14b02288-a14b-4e06-acf2-f2145df565a6@t-8ch.de>
 <0478c715-fc85-4024-aaa3-1ad6a51f86f7@redhat.com>
Content-Language: en-US
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <0478c715-fc85-4024-aaa3-1ad6a51f86f7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CH2PR12MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e565d7b-d84c-4c8d-88f1-08dc02b944d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3jPBc3ykDghe6vKrjblc8C1VEvTSXyR7Kvmg0tAM0jM/ndt2VJk9zlq1eUtE1dCdEJM3aXOzR3rM2+gpeWNyMpTrtSI38AsVFQFwCsZEmJdOKmxn26FT7/p84mUWkwPcHxCdKRC7p2CLnKSIu8MgqTJbcPPukN5X7+lhl1Kbg/9ZPcFc7TcI/5S2bZDW6QnZGvi3pMrcGSv/MpigBy3gKqfLyHeFYT5GaRtPtdz1kWZQWfVM31nrUsU4HEfs+2pCMDlBfykJdSsOUntnm3fWvvyYLLRy5t8YpaB7p6z9DzDz6NU7J0C2I70hLLytEh1plx0mTLX0WksOCUDYRZBjp2J1azngnNcc6eQYDjTzxP+z2llC8yCU3WoVa637HF7b3cWi6rWiAUfm9x48TuYRZXqNUnJsYl8vdjGnSFdemPJS8MxdE0js6X0aoTVXJsPGZtVw2s2K2g/s78KmTF/liHAW7ZUPhO4AiA+58g1u6veFU38ZpLWUYokW6SW8voXwjNmJ4qB/MlgKH9udMNPSkWfxr+Pl93kVjE+kHNJd0It8bbAYKRREVid54JAEhyZU55Huh8UEua+xSyTGhzrnhyUK77paBtTfG5laxYTMk9ua42xrAMYRuQhGQavPCtEidU3cl2LtkG32/Qgsv/RfZRNLBV5s+hBq+gJsOTBWDxnu0TosI293KZA61m8P9nW0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(4326008)(8676002)(8936002)(66946007)(66476007)(66556008)(110136005)(316002)(2906002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(5660300002)(478600001)(6506007)(6512007)(53546011)(55236004)(6666004)(66574015)(83380400001)(26005)(2616005)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2JlQVNmSE8vNm9oZGdRb3EvbitiNGFDWUI1VVBDci9kbHdwRWhnM0pNOTBH?=
 =?utf-8?B?ZDllUDBpalRFeVlUc3FZWVU5ZG1aQzI5SlpodkdXaDVFVEJzZ3FORDNRdDEz?=
 =?utf-8?B?Sk9jQzltbWJ3U2U4OWN5Nlo5dGc1RlZLMG1RNmFzcHJFLytCbk1rbk9qSTlX?=
 =?utf-8?B?WHhuR3N1bkVOWWNmUHNqWFdnWTRvejczVml3RmZXMUE1RGZrNWVPUnl2b0xn?=
 =?utf-8?B?cXRMblFiSXM4bEVkOTFLTlVlejZVZnRoNXdmWUx3SklMVUp2UTcyOElzeTF3?=
 =?utf-8?B?TlRlMXNjdlFlS00wc3JnY2FtNEUvT29FYzljb0M1Z3pZRXh2d2FEa2pWdFpj?=
 =?utf-8?B?SzNqTTZpZEJodjlPdkE3NUd0SmRQVW9SNG5HcnUvNjlYTHIzTU9SYiszOXJ5?=
 =?utf-8?B?MGlmM2VUZEFaM0VIa0RXVkgxb1FtQ0JnbjNoYjFPRERCSk5LdjVTMHFseFQy?=
 =?utf-8?B?S0NxcERtUHM3MkYvano3R2pVait4andsY1NLZ0JiZGFjRDhiMlBKRWtvRzdw?=
 =?utf-8?B?YXhwZm5ucGFQekF3dzJiZWRyZVlRS2d4YVdwZWcveW9CMmIzR3JUd09sWWR0?=
 =?utf-8?B?ZUJLK3pnRXBTYzJvUEZjd1hoTU9nWisxUS9xNTh0NUwySVFNdHFhY0txWjNQ?=
 =?utf-8?B?b1YzbEE2T2phRWFJaldBRGM0dVAwNmk0bVZvbDRJa0Uza0JQenA4am9CeFU1?=
 =?utf-8?B?a0pCZkZXbWFZeDZvNkMzSzJSOUpjeDMzOG5vYUpBa0dDblBBZjhTYnYxa0F5?=
 =?utf-8?B?dVJ0MnIvS3ZwcDdTL1I2bnBndENwd243b3ZVSkVuQTdCQlJybkI3RW5wK3hD?=
 =?utf-8?B?aG1TNTVlZS9HZnBON1U4WGtMRm9Fb2NZeUIyUlcwbHgzbEFsd0wxZVdnVFpt?=
 =?utf-8?B?UHpwQ3ZoTFYrbmxOWkVlNnhUaU8vRDBobkZmS3E5NFpEYmZpYzBuVHM2MVZl?=
 =?utf-8?B?Y1I1TDdjWFljalZSQUU4eG9MRUg5aXVBcWpFcXJ3NjQ1ZzVWdnl6U3VyN2Uz?=
 =?utf-8?B?RmJPOVFLM1JHZjRzS3M2N0d6bDZ4bTF5Z2EzR0xraERpSWpubXVWb2ZyV2c5?=
 =?utf-8?B?OENVb1N4Z2xvWTNvcVJGN283UjlpMG9ObGRQQzB1bUdJZ3dmTnR0MFFoVTRY?=
 =?utf-8?B?QVY5Um0yOGZTK2JuTER3MkFyUnVqYkpRQzdtSU80a1pMUXBxN1M5MW4wNEls?=
 =?utf-8?B?UGNXU2ZsSXBzc3AxRjNjR2hmaGsyZGdmZ0M0b3JsY3dRaTdHOVo3S3BlYThx?=
 =?utf-8?B?a0ZscjFjL2FCRkMzT1NuQ2EvMEhsZmZ1TmZ3UjRNNW9YQmRVL1R5aGFTTlFs?=
 =?utf-8?B?WjFXSGV4MXdEcTY1QnFrUkgrdVRIOE5hYWF5ZDlydVhNSm5oQzdEZXgrbkd6?=
 =?utf-8?B?aklCNGxnSFJTWFlGVVFMMVNybWM1d3JGeEdRWWJIVmJvclh1Wm9NYTg2OGxM?=
 =?utf-8?B?Y1o2NU5lTnBMRDcxamV4RDZDYVkya3B0MnNJMWhpeVN0c3d1bWo5MXdGMHJk?=
 =?utf-8?B?WUp0Ti9Xa3g0WkJETnJQcHNsSlNRQWFJYUROYzhRVUw4L1RLc2p0N2VGUDhH?=
 =?utf-8?B?QXVoRWRaSmdnT29zTnNKVE1TQjJSd1VBdm1TYWxXVDZMTkRZeE1WWGpKR3kz?=
 =?utf-8?B?QWRpczZ5WVExT09wcEVYbjlyZ0o4RkdmbUZzNnk1YWVSdUFRN1R0YkM0dzJi?=
 =?utf-8?B?NU9WTFJTYnNDTGdyZ3ZDbmRpWEFVNjdPYXRKcThYTENudXUxNGJ6THNSclF0?=
 =?utf-8?B?QUo5aWNvNGFUSG4rekVjTmk0dkg5eGt6cHVKTFBvUnQ0N0NRMnRIUXZKY3RD?=
 =?utf-8?B?dzdnRDlmR3VnVS9tNnhEY3J6KzJvazRCclp5RW8xQWY3SE9vNmZRRUxjVzRp?=
 =?utf-8?B?Y1B2T1FvQ2JFTDFWQkN6NG9CUWwrdVMzTUp1T21HZTRPOEhsYm1oQVRwTVV3?=
 =?utf-8?B?SmVvVVRDQW9hQzVJQ2x1VjY0dXJ0ZzQ1MWdnai9WTGNWalJpU2grcCtYY3FI?=
 =?utf-8?B?YW5PSGpjZEQwR0wzU3lzU2xndit4M0p2S1lkSmYxekRWKzFpdklCOU03MmVX?=
 =?utf-8?B?Nkc2WXp0dzlNZG8xNkxKcVVqaUVZOUJPcXdmeTZnOU1XVVZ5cU4wdElBWVFO?=
 =?utf-8?Q?F0eFwLk7mb+0t1F0u5b/rkHjB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e565d7b-d84c-4c8d-88f1-08dc02b944d8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 06:43:13.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YC+JJbeUAV2CVlKUb3lHmgfNzAicSnWSOHr/hZYSDwcU4Jg+ZPJhVpHinCKuMmUga2OM7GDLwPlER8ZM+5obHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4971

Hi Hans,

On 12/22/2023 1:50 AM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Thomas,
>
> On 12/21/23 18:27, Thomas Weißschuh wrote:
>> Hi,
>>
>> The subjects of all patches in the series are
>> very generic.
>> They should have some more specific prefix IMO.
> That is a good point, but that is something which
> I can fix while merging these. So assuming this
> is the only outstanding comment there is no need
> to send a v4 for this.
>
> Regards,
>
> Hans
>
Thank you!  I will not send v4 unless I receive other new comments.
>
>> Dec 21, 2023 18:21:48 Suma Hegde <suma.hegde@amd.com>:
>>
>>> This is in advance to supporting ACPI based probe.
>>>
>>> In case of non-ACPI driver, hsmp_test() can be
>>> performed either in plat init() or in probe().
>>>
>>> however, in case of ACPI probing, hsmp_test() cannot
>>> be called in init(), as the mailbox reg offsets and
>>> base addresses are read from ACPI table in the probe().
>>>
>>> Hence, move hsmp_test() to probe as preparation for
>>> ACPI support.
>>>
>>> Also use hsmp_send_message() directly in hsmp_test()
>>> as the semaphore is already initialized in probe.
>>>
>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>> ---
>>> Changes since v1:
>>> 1. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
>>> Changes since v2:
>>> 1. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
>>>
>>> drivers/platform/x86/amd/hsmp.c | 30 +++++++++++-------------------
>>> 1 file changed, 11 insertions(+), 19 deletions(-)
