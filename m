Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC0634EB
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706534668; cv=fail; b=qW0YNJkmK5Chj1XXGINXEYB5v7Z3ntm2pZK4VDc2I0dTeGsJTfri7QCsiONRmqQuHKZ8kUHyyN2anr5GImDhM6cdZ3SA25rHv4Smqu69unCQ/u6441HIZ06yrzkkj6E8eaT5QjAGiT8iS8rrF5NUEVmgkRPlV1N791+8IS0QC6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706534668; c=relaxed/simple;
	bh=o0X9I0PTLWJQt302XxRcNK5+1Hh8P09NeLtpZKl/iU8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ebJ5UcIV9C8ZG84IKh7cueCsiX+7OarTU2KhR6YNhPBM9oykU/WL0qHFJ5ef9rysm4vxIr1clbfmjWnIaqLTkcR8efj6RJb+6gFKbRvOMwmpFFLt7N+DIKX5xAlCZZDv+jbLg7one2K2r11gRbGxDIJFKax8h/UHfKeLV2hGYJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DzjSJOOj; arc=fail smtp.client-ip=40.107.223.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DzjSJOOj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbAm/vjgbCLFWyK3hYvQazuagOHtr5+4sU0IrfouTEKQnFnQa5P4IRuKDfsMj2F6tu7TWozZfmwNHleFlmw9BEW5nkvHhY0TrDCcExY7Cd9c+y6CRwMHX8q4xXX1rEwDvtl34H53f1VD5Mi2eTibS1o7mQboQ3zGdv7cfJ8f2t9f26TSqT4LiR/JrQZCINX5W5F7S4ph+T6jdZj4AphyUMfp2uUia1Bv0GCzwNxxNTtbevTmGRNA9bCUrBUD5OIFJAdJiW5+pRc63wKiKqpW4Tddfkh0ODflTmK5jhDiFZY7557sa2JheT+EjFzIbeOvTVAdzMxuSH18Agy6cJhxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtqsKhdGvMyCXGVtF1FaKZRJQQa3WgqLhp0fhPl6jlU=;
 b=HGxgoMWnS2l8gwnvkkb4jPXZd3lhhxxw2T+kYIunOvb7L14oST7gI6lQeN0M+BXaVAcHIaDMGBqK8cAHH5IEh+JtNR7BVt/xO6Q2q+AFG37l2h4D9PO3d4CQ93DcKs6EKqOtUhDlGptX4AwEM5ahOFUdqffbmpGZAmXsqVA045Hiht+duqBqQ5cDQgqumylaTysD+4qA8A2lgyEBd757utdsP4L4nTrbGjMDIBwgZcJC0m3ZK4/QWptd8J/YVHmJoG8WkWz+/NqIIzntgSBTvI1NnuDdYbUsmKS8vIodU+sswW1aYo8oD61sjSQtAZ3fCpUvyk26m4y9AVdVUBZyEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtqsKhdGvMyCXGVtF1FaKZRJQQa3WgqLhp0fhPl6jlU=;
 b=DzjSJOOjM3uSCFRtTZhRlpl/eBgDzJdy8uxunExo6zoTl6c+IOaDrdL43Qw2Bj79+zNvwoswVOuVFv+MWhGDvcjN4VZNiQVJm2Dk5wdh3spZpflb2XpY9ws4WBXi/lYCul1yMP2YHizjmeF5rJZrL+7Txs1NgqTyhaaw59jhmHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 13:24:23 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::4196:178:d5af:9f2]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::4196:178:d5af:9f2%6]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 13:24:22 +0000
Message-ID: <6a60fd66-64df-491e-8879-3333c8f119d5@amd.com>
Date: Mon, 29 Jan 2024 18:54:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc() to
 devm_kcalloc()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
 <20240106022532.1746932-10-suma.hegde@amd.com>
 <8b896046-2058-805d-1998-7ae6d51edd01@linux.intel.com>
 <0c930967-ce51-edf9-c8c4-5e00d8ff7047@linux.intel.com>
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <0c930967-ce51-edf9-c8c4-5e00d8ff7047@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::26) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: e3277252-2a47-495b-bc01-08dc20cd9b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nSwaMWhldnAWU+1GM+u4n38jFCkDT2wf4RNhNl/vKq4OtiFBvhS9Qh2zYwfnfRj4sayKk0YGwVC75x34n0B29VSLaSu6lwscaD3LMI2p4POeCVUXXm0PuRfwfhtFNaY8p0RqPzmApF/vE/vdxmry7wA0VSV5kJ8Qb58/W09KcJa0kMmZ0QKOuOtewJmw1PZZLF6nNrIlajSUX4RF5kOWEPeQjVW3kM4JstGdE45AnbCKgqbZLT5iKlJ6iuAadRDODUnailT3fd0UqZVk5pGYBqTdNDyo2+WMVUspiigIUy4mrgaqYo3UA6DnoncMNa8Y7xrW/EnveIPORWFicn726JBEv1DUDdjJY8ApVIIxL1yxPKMSO26booFjQisABtBb+JB82K55qTaZP9T+lgxuAQgqair73Js5u1/2l6AFxPOWnqzWoG0FV1sSeJMQ5CHIOVHk48iXSP5GA3LpMAnlWdn7ufpiXFiyW4KQbs9/DeUVEFBKojuSnhV6ZYnVT64DpHwqb1X5iM3QyiKNtGLeEv4bKee/INy66fCK//i8P9nwDDZrhDmmU0WQpO80Au0OHaHOUHfwrYrq3w/yah1Sxoi130zmkCy2tQP2CxNWIGTg7yesp6LEDxXit22XApinqXtrsGN+9jixRZ0Lz8MJXUQeFsp0WrCwLf/g/JhTk1+pP+9Yq2b4xFLdiwEPratd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39860400002)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(66574015)(26005)(53546011)(6512007)(6666004)(6506007)(31696002)(2616005)(38100700002)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(478600001)(6486002)(316002)(6916009)(66556008)(66476007)(54906003)(66946007)(36756003)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1hMVWk5cTE4TEs0WWNkNXc3amxQdVNJbjNGV2pVS3hWZ3hkU1AzMTA5bWZl?=
 =?utf-8?B?eHF1eWdBbXJGUGxBbkVyam5rR3Y2OS9HemRTUHgvNmlUTkRXeTRZc3lsSklz?=
 =?utf-8?B?amRzTWtOdGpjSnNrVUlIZHVlZ2h6V04rS2hlK2x0WlFtazRkT0hJdjBCWkVr?=
 =?utf-8?B?RUpyWE5Vcy9BWDJyaUFmcWlwdklNVW9UZ2JoOVJHb0FFMFRzVEhpcE1TWUZQ?=
 =?utf-8?B?ak9VRUF5OFJwVUF4eWY0emlsbG9BeXZ5aEdzTFA0WGsxOVE5cFNGYW15cXlz?=
 =?utf-8?B?SVRXOUdqQXN1Rk1TajU4Zmt5UVg4VlErL2drYnhMbVZpS0Z1Ty9Zd01lRm5m?=
 =?utf-8?B?NEdqZTBsVVVVWU5pemVOSEc1R0FQRTVrT3J3UzhYYjRrT0JFajB0S0hZcWNl?=
 =?utf-8?B?OTQ0NVN1ZmtZc1BWRnNTYUNWTHBKWHdwM2p1UGZiSVFhS29BRUNkV2tCNlFD?=
 =?utf-8?B?Y0pYbG4zMjdTTVhqV2FkbWdYNzhuOVdOWFVVVjRQQ0dSNndwVGtyMUtZN3B1?=
 =?utf-8?B?S3kxeEozekF5Z3FUY2w5NmN0SFhuY1dOTHpubmJyMG5pZENRdWVUS05YQVZa?=
 =?utf-8?B?UTVNSTZLVi9SRGVNcUxEZmgwajc2dnNQNVJwMEs2cTYybnduNjhlbnFlMTRR?=
 =?utf-8?B?eWk2S09CbEZJNnc5YjN0U3ptSkJsQmd6VnNvbTdiOVBkRU5QVDZvbDVOVXlo?=
 =?utf-8?B?UW1BSW9sUFQ4eWlZN2F4NDhyMENMcDNSZGpnb0FjOUM1MzlNTjM4QnpmSERx?=
 =?utf-8?B?aUkyRlRBNFU4S0pMWFRZZ1FXT2R3aktZcWkrME5zWk1UVUVEeUN2eUYvRkdE?=
 =?utf-8?B?cE1jOW0zTzJIRzhXb3B5SzUyRG9MQzU3dWxYdlZFdnhDaXE4NjBYSktCYkR6?=
 =?utf-8?B?MTRRT3JOR3p0bUVVQklxdzNKbXhvaUtBdnErVmwrKzg1TnlCRjF6UndrZUVO?=
 =?utf-8?B?dHBKeXBsVnBYaEJMV255alFNc3NwcjNJYTkwK3M2NndVcllIZlV3ZzBndnBp?=
 =?utf-8?B?Mk5pcXA0aXpmWHBWVnp6eENMcnhpbmtIN2RmMXVwTGNlOW1oYklrTzZpMTlW?=
 =?utf-8?B?M1hVMURuM3cwUjFpMlRUbmV5Z0Zxd1dlbnNmdGd3bXROdlp0ZkVEVmtBTENQ?=
 =?utf-8?B?eGMwOHU5OXpYSTAyOFk3TUh4NFQrTnNuYXFxMGRYd2NxdkcrU3o0Z09keXhj?=
 =?utf-8?B?ZGtySlM1YXczUGJoOW9NTVZhT1ZWV3hlWFV0VUFkcGpZcmtzbCt0VFhYVXFI?=
 =?utf-8?B?L1I0WmdxS25VWXZiYWhnVEVGenkvNkVWUTg0cUUxdGVCdTlRR2lvR3gwOG5u?=
 =?utf-8?B?dnZpVURzbFJtUkxhNlQ0d01lYTZzU0hOa1VFOUlQb3Z5bVlKdmJ3bGFPSXpp?=
 =?utf-8?B?MTNLcXVKZUdIZjc4RHZvUzd0aktXYVZuTGRpeEVOOG9tL0VhYU1mQVRZaytI?=
 =?utf-8?B?MW11N1hNRUt5Wm1URkNoL056bGJLQVJqUDRmSFZnMlR3QjBhemdMSEY4SThN?=
 =?utf-8?B?WlhkcG1QZkk0TkR5S09jeE1laGM4bVh1MzRzNENkeHdjZWZLdHM3b2RtMG1z?=
 =?utf-8?B?dithcDcveUdYK0IwTlNwK1lYL1I1VGVWV1Z3SmlDRS9BU1EzVzBEdDF0VGky?=
 =?utf-8?B?eEpzd2Y1YVJ1RjZGSGRWSGZOK09ac0tZZ2hPejQ2WGtkbXh2LzIwWmR5NDVn?=
 =?utf-8?B?WU1HTXA3dU9uR282SUVqMElZMHUzb2k0aFA2UTBhVEhxYUV5VWYyZm1yY0Rq?=
 =?utf-8?B?TG52bzRoNEY0dVgxU1Uyb1lodW1pa2MrbFBOWWVRakZldWo3a0ZMSitucXE0?=
 =?utf-8?B?QXVxaGdJc092K0V5YnpQMGJGbW1Ya1c0YVNiTk5DTWZ5SlV5TGc5QUJtaWhQ?=
 =?utf-8?B?NERPSERkenl2ZG5hbFV1VkU2MkFmcmsra20rQnIrOWxLM0FPS3Z4bUk4Y1BU?=
 =?utf-8?B?bjZUZS9aK1JscDJTeitTSktIalYwM3lFanVYeFFaQlNoYTFMY2p2TldiL3VP?=
 =?utf-8?B?NzJTYVh0UjZ5aDA0N0F0R01CTEdUOUtib1JRdTh4SW5FcEw0ZVVHNHQ3TU8x?=
 =?utf-8?B?NDd5Vko5d1B3QmdCRExGMXpTTEp3a3Bqc2g0WGVhREhvM0RpOXpWM3V0MkNl?=
 =?utf-8?Q?+VGO1D417fRY/1a0TezlHj+Dt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3277252-2a47-495b-bc01-08dc20cd9b52
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:24:22.9005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+u2TtIuMg7Mbm46RgUT59W4mQs7Fxvs2v0JK5FYmHGbqOque2Tspsb+jd9IJcBxkk7JvXKcYRD/GCC3FINm9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407


On 1/29/2024 6:14 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, 25 Jan 2024, Ilpo Järvinen wrote:
>
>> On Sat, 6 Jan 2024, Suma Hegde wrote:
>>
>>> Use the standard array allocation variant of devm memory allocation
>>> APIs.
>>>
>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> I decided to apply all but this patch 10/11 into review-ilpo. I fixed the
>> parenthesis issue I mentioned in one of the patches while applying.
>>
>> Please check the comment I made against this patch and respin this one.
>>
>> I also noticed while applying one other extra parenthesis case in patch 5
>> but since it was not added, I didn't go to tweak it now myself, but just
>> you know.
> Hi Suma,
>
> There are number of issues and warnings due to these patches including
> one build failure due to lack of ACPI in the config (I think), can you
> please take a look at them.

Hi Ilpo,

I have pushed patch with fixes for smatch error and warnings.

For the CONFIG_ACPI=n build failure, I have added "depends on ACPI" for 
hsmp driver and pushed patch for that.

But we support NON-ACPI probing also, there may be x86 platforms with 
ACPI disabled, is there a previous reference of how this can be handled

without making it dependent on ACPI in Kconfig?

Thanks and Regards,

Suma

> --
>   i.
