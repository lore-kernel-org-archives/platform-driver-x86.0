Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2089.outbound.protection.outlook.com [40.107.101.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D2218A95A
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 05:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957331; cv=fail; b=olmq22go5C4eIk5YfQvbQOFSgeYN38ELYymxxeEHB3V2eEJg5PIS/hO9GKu1vecyCZJJRXEEwxnXNt4rkyRVpMt5Uc584PRmU/1aRuTKx1Fb5aHG7S0TEaWiUu2QGDQQt7S0OvGr+8s/HgS5JhkpGh5Tuh9GbR/19qtsBicBo5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957331; c=relaxed/simple;
	bh=6l40z6u3OyiYKbzTI6kWDmsxbQn9oCWMhVOCd2FSA4Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EFn/CZWTEOSgt6lWjMHccdgdwNoefzVxlmI/dvw/rj5SLjVpjvqMGzN9MhGHg0btuTdSdGflSdQ2ARqk45eaJQev2snYMsMoPV9muIdIwxUxLMx7toWJsGyrZ9TVKEAWDjd/txsJp+aUTh8WnXZ+3TWR1NY0bJ2HWow/LQMQyR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ixeePSga; arc=fail smtp.client-ip=40.107.101.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ixeePSga"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pf3rEInc0vU5YOL5XslBJxaGGUmMxAGzN4l5V+fMEd9wVno2cqv19GbwU0B998rofILaEd3IX6bDxz3wGAfAMpP/RfuTHk2CnNq7ryird1rLrXiGwI9/b66ACk50VbYPme52il7eFVNWEQZ4gNeAHGqGHvweJNUzg0Y7wCUiyRQfq9yV9dZVik4k1ofI7C5QxQRNdBG8NC1HWUoABvmGEZYoj9MHVSkTPhUFP4itdbtt0BiyblTRD9zZvjLyyQYGaoNuw5de2+DdGl5gmEf1BLpipRhW1j5vAFPUldgdANXCFEciJAo6BgMbsVZXwRPHFYLUj/YgkksukRVrFq8MTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVxQgZ4qtxeN6XkONLDpwlnzkodSSmKhjC7t1j+8ZsU=;
 b=GRoswn1IeU26kmWrx/Pp0M77oG1jW0MZ2nt13CMgPuOzOmY1p6Z/BMpVwlsB8jx8/fKEFhoGuMSbBuQFsLtppXFoNZbMNu3uW0dg9pGprhUe9pX05MoklZm+85sTqJ16xfhio1Zi3YdQuxH0JpQ1SSTBJcf4EnJP9oMWylVBO3JeGf01iwVdbCgj6YFanVGSvBXSnIs38EK7I3ms+/3/SQYDaFe9lEWtoLQFJXyACaGwxr0vKW8yptqtn4tJBWiQBry4XwPH6RGWavOvxu98m8Tu3x3kOVzCAbtn47JI8IfJCd9PajzLOK8zDtKL3gdrIVhGYGGs9IFHMeH7s2lURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVxQgZ4qtxeN6XkONLDpwlnzkodSSmKhjC7t1j+8ZsU=;
 b=ixeePSgaWy3Gb0vU+1HhAr4urL/NnB8L9SwjraoQRoJjEv3PYh5Xb0Gs6xT3YkHD1FQZ1gUPSEzDeeBb2i8dYTUQkifGjk5zRWRo8ZSNg1IOGkZFKH8mPwMBEMsZAOQ83/72JHijf8VHZ9YWKDSdMWCmMP4mcwdlnUsnN+IKT+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW4PR12MB7438.namprd12.prod.outlook.com (2603:10b6:303:219::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 05:28:46 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 05:28:45 +0000
Message-ID: <25f284c2-1528-4273-9cca-6b63ff0a2303@amd.com>
Date: Thu, 7 Nov 2024 10:58:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
 <20241105173637.733589-10-Shyam-sundar.S-k@amd.com>
 <0a57bfa4-abd8-15eb-222b-41d3052c69de@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0a57bfa4-abd8-15eb-222b-41d3052c69de@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW4PR12MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc80c57-ab48-421a-8f57-08dcfeed0c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDI4MDFSQnE0MENUL1kvL29GV3BaRWNxcDJveWxnVUR5dGNkZmV6WCtkSGNG?=
 =?utf-8?B?QTN4OUIzSUo2d1BROFNrclNPKzdkNkV1alNxSy8vdG4xZDJQVDBsd3p6YU5x?=
 =?utf-8?B?QjVsdDRwWm1TVXhBOGNOL0FocjhRTTdMNWs0U2xVYnQvMlA4a0xNYmxDNGlG?=
 =?utf-8?B?Vng1UUtORXpWVWdIa25uMGxQeUNDSE1Ma0JzMDNhSjB2RUNxTzFxUXJQUEo1?=
 =?utf-8?B?ZEhqcjB6S2k1UFNkYktnck9hbnZEeU9Ed2F1M2M5aVloazRpVWI3dHZWQ01R?=
 =?utf-8?B?eHRhSFAwSUN5TXhDK3p1NmJuZ1pCNGR6WkZ0ZTBuRUxkVktjcGV0bDcwMkVi?=
 =?utf-8?B?dEdDTExzWWhmQ2l4dkJsS3FibjlJUXpKdWQ1RW5DcDB0VDdKU1Bsc1dXeHE3?=
 =?utf-8?B?NSs2VE9SUm1hWW9WcHJPZkdyd2psdnJlcDFQY09EQVpTVWVlTFhrYXh3YmtO?=
 =?utf-8?B?QThLWnduTkVWMnd1RGpqRXBmUHRIcTU0dVROMDd0UXRxaEF0NVh4TzFTbENj?=
 =?utf-8?B?QmhCU09oZnpDN3NTUFREVjBZb0cwbTltZXpXM1Jnc1dNVVQ2SDA1REhpaXdP?=
 =?utf-8?B?MDdGVWlmdlRKQU05dExWbDZmaUlVVGhxRGR3YlVPWmtXNTkxcmozKzd4Tlho?=
 =?utf-8?B?MWhzejB1S3BUTkJzRCtLa2VtdzRLWEVQNnlWTHlrNjJVaHN1OERxUmVTcDJ0?=
 =?utf-8?B?S0hTNVVTQ1ovRndkWXJsZlFSYUhOYVM4a3piU254RS9UaXpIOGErOEN3bmZW?=
 =?utf-8?B?N3l5YzB0eTl1OWVPT2Y4OXB1ZVBTR1dzVnUvYzBtUlN5QUxmc0ZVT05BRnZk?=
 =?utf-8?B?NFYvNG5EZEtmaVdGdk9nUExRSUNOL0dZd3VhVVNEN1pqMXJuMkdLMnVkVXBa?=
 =?utf-8?B?VDAwK3hOUTR2ajc0MmhnQzRxYjE0VHo4SEtJbzdHM2tIVnpISUNUTzdHeTRS?=
 =?utf-8?B?dTNvdEJuemwvcXp1aXJrUHJuSk5wZVRmWEJhaVdZcTRqOGlQRDlnSkdyOWVW?=
 =?utf-8?B?VzFHSUx5RjltSDk2cVZVbXZzUEsvb3dWeXV0TmNib2NZejMycnR4M3MrZTh0?=
 =?utf-8?B?Uk1MaGozTElST01Bd2tEdm8wWnZTL0QvRFNnbXdFSVpJMzJIOUdrS0UxbUov?=
 =?utf-8?B?cG1ScDJxUEtGcCsxckZJRFhIYUV0cFl6Y2NKbkdjbnFEKzZqUXU0VWJNOERX?=
 =?utf-8?B?WFJKeXVlbE8rVnp5UzBQREg1QlRqOEtEdGVIVFI1eGhuaFpxUFFhVW12NVh3?=
 =?utf-8?B?dGpFWFRUdmdXVWZNUlU3RHJWYVh0MFlNVkNwNU9RU2Z4L2Z0Nkk4RENtVlF1?=
 =?utf-8?B?Ykh4Z2dqRWpHa3h6eWVXUXhNSm9tb3hsUXl4SXJ1UTdBd05IK2s4MEdHS0po?=
 =?utf-8?B?a0pRZjRrcGd2MkJlTC9KQndzaU9qdnovcjNCOVpzdzJHdW9sK0ZIZDFkWWpM?=
 =?utf-8?B?emRYNnhtYXJzN3cyb0QxV213UGhuUHlwNDMzZndPTjZhWmI5ZjdvaTdnNXlD?=
 =?utf-8?B?clBvancxSWpKdlEraUFnS1EvanZKeUY1Z1NyMjFGeHJQa1BiMFdUWi8yaksx?=
 =?utf-8?B?dzJZSG0yaEpVK3BTOHJaYTlCNWpDVmUzL1FLQk9YdkU2eUdwTkZWZ3kwVFVZ?=
 =?utf-8?B?akNuNERra2h6WUZld29vdG9aYkM3N29nV29RREFFa1BzcjJqWDYwQXcrM3o5?=
 =?utf-8?B?cW1nT0lqN2sxWWptM1YyV0ZNY3hLeUhqbDZ1TnlqTGZiZ0tRcnlWWUJvbXha?=
 =?utf-8?Q?6wo9zAi8ySBYCAYSdGxCT9zA1721Jqx13Q0qT/m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVdhSmpmdzFhZk5YVzF5bDZEUHZRR28xdG1MUUI4Y0ljZk56c2NuQ2JMYXBq?=
 =?utf-8?B?TkVZT01QYWtRaVZzVC9hSC8xZjg5bTJJakI1QUQ4dHZDK0cwZURIQ2JQMWJE?=
 =?utf-8?B?Q0ppc3JCZ1hvUUI0MkY2TGxyTWpsS0lYTUNja2hrd2tqK3NFU0hBeWllVWhF?=
 =?utf-8?B?YnQ4b1RENjQ2R0hBbmQwSDdIakdSbmkzTDZGM2pjZTBCVTNDYUNnNXFoWkdO?=
 =?utf-8?B?QnZzbHdSekVUVVI5SWt0OEdMWkhwaU5nR2d3dnRNYmtjV0UzZ3pTRUtVdm1T?=
 =?utf-8?B?dUVkeXdPMUhBdXRvYWsyQWF1V0xRMVZBSzlsd1dNMXdTbUt6YThZMnNyelV1?=
 =?utf-8?B?NExUOWcyNWgwSGUwT1Z5ckFGM2VvczZwU0drcmRQc3N5dmRWaUJpdEViMGRy?=
 =?utf-8?B?NDROelpYUGJDM1V3SnpQRFBweHNmYUJxNlFBUy9xSUJkOUR1V3pTMXllTzAx?=
 =?utf-8?B?NTNFNnZtUksxcG5CTFY4ellMU2VaSnV3S3ZZbk90WHQwbWQ1V2xnNEJuOWxT?=
 =?utf-8?B?ZExqQTVDQWJMVEIxcDJqY1dGR2drcnVZLzlyTXQ0bXpER0hSTWNPd29PTWFh?=
 =?utf-8?B?eTYrQ3J3ZC9GM2FnMnFlWlQydGRoY3lzaDlPV3NvM05DaTJtTVRnSFFHY29j?=
 =?utf-8?B?cHd2b1huMGpPcm8yb3hXTDV6aVU3ampBMkdaQWw4QUxKNWhqVkl0QUdmN1VS?=
 =?utf-8?B?UlRDTUpWT21idFl6V1crYkxqSHp4QnE1cFlJV21ERlVHVUlIS2hiSnA2bHdq?=
 =?utf-8?B?WHhubXVhMWxKMmsremlQMjR0eTd3MUd1bzJjVVNZRTFRa0cvV0wwdUorOU03?=
 =?utf-8?B?WnRYS3ZyKzlOVTBDOWZrbW1OTHVBZENPK2ZvWjY1dXVTeHVUSkJLRytDYysv?=
 =?utf-8?B?bkRkN1BsemdYVUhPeUVpQkVsNVYvdXBUQzJ1OEhyWWZRU01yWVJqdS9NZ2xC?=
 =?utf-8?B?WlpnNWYxVkxLZDdTd2J0d240cFJSaG1iTjdqSWhCWnBISmx1RXErZVUzSWFp?=
 =?utf-8?B?RmI2QXJhVkJlVDJldDJGdzRRMXJQd0U0Wk1hTnZiRmNrUzlZdlV3eWx5NXJq?=
 =?utf-8?B?dExFRy9VVFQwYkVKSkwrM0N6STNaNDFKV25JRTMvOEJpZUROYlF0aHp6OXJj?=
 =?utf-8?B?MkpyVjl0MHFjQ3NuN2ovcVBFWXYydnhxRXNadFlSTldGSklrTHh2TzhIc0NF?=
 =?utf-8?B?TGRJREdYUXZndXA3ZVhEeFdJR2UvQk9iWWYrVTljUW1Gdm1meFlVd0Jvenhl?=
 =?utf-8?B?OHpTa1lOYjJZQUprZ2xZMVo0WnArVmFZRElnRnE0ZXEyYzArR2lHVjdYeFdP?=
 =?utf-8?B?SVlFOHRLOWFzR1RqdnZmdW91emZiMlBLRS8ydm9CNWJmZ1NWV1NXR1dESUNi?=
 =?utf-8?B?b1hUNFhFR3ZZUmdwOVpzOHhFT2ZLSWdNdE42aGRDUlA5b09SdXRReE1JK3NF?=
 =?utf-8?B?N1dRVmVHZk9kYjRPRW95dHAzVldsZzdGVlMwMHJsTnRQd0lpNTdqMXpjNG9z?=
 =?utf-8?B?Zkl5SWl1OS9PdEdNclhFQllMWC9JeGhZbnMzR3l5OW9ucEdFbms5STZpd2NK?=
 =?utf-8?B?cFBwVGxXaWtXeTE2dGpBQlJtUG5QeU9XTU9rVlR5emsvajFPQTNTOWdQOG10?=
 =?utf-8?B?YkQrdlROcTkyUERCazhDcUZlQ3lQTk9HVFlxMkduTjE3MWJRQW5mdFFzVGVZ?=
 =?utf-8?B?SmpjRGdQMXppVHJwK1N2TW1aWERMdWphdWpacm5OZzZhOFB3U3pxL3hiMzl3?=
 =?utf-8?B?a09TOTdLZUFlRGVhT3kvQjlNS3QrdUdLVXk0b3dJRng1UjlEaUJ4ZFkvenY5?=
 =?utf-8?B?Q2wyUGNiS29EMXA0ZDhwZ2dxZ1Z3Y2tlRkFOS2tEekxTVDFUSVVaekJ4Um53?=
 =?utf-8?B?aEJqTXdpTkhIWWpxKzNNRkQzaFUwMmJKVklTNDdKRVYyaXJXdkNFdnNYSFYv?=
 =?utf-8?B?OVl3eXRXQjlNcm1pcEtMcHFWVHVibnNKMS9sZURVSG9VNnF1azByNzB5S08x?=
 =?utf-8?B?eVh0czR4cUVQcmxPekc0RmJqb01NSVdPQlFPaVoray80YXpGMml6MEdFcUN1?=
 =?utf-8?B?c0creEdWVm5VcjVOVTBkZnpiRnk2bHZmRjUxa0poMWErSGtGa1lHeVkwWUF3?=
 =?utf-8?Q?RXIuwwAfn00ewWJ3AwxsVz9lO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc80c57-ab48-421a-8f57-08dcfeed0c15
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 05:28:45.6651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxWPe2lZnsF1AmWM1nSV0mjEmDkDCHBXlLZrzSRs6fzbsvADd1yz/SUlbr+5Jlz3e2R2uDLTCLITzESnQSXsJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7438



On 11/6/2024 15:44, Ilpo Järvinen wrote:
> On Tue, 5 Nov 2024, Shyam Sundar S K wrote:
> 
>> The latest AMD processors include additional IP blocks that must be turned
>> off before transitioning to low power. PMFW provides an interface to
>> retrieve debug information from each IP block, which is useful for
>> diagnosing issues if the system fails to enter or exit low power states,
>> or for profiling which IP block takes more time. Add support for using
>> this information within the driver.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++++++++---
>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>  2 files changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 1f0ddf5440c3..5ca97712ef44 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -94,6 +94,35 @@ struct amd_pmc_bit_map {
>>  	u32 bit_mask;
>>  };
>>  
>> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
>> +	{"DISPLAY",     BIT(0)},
>> +	{"CPU",         BIT(1)},
>> +	{"GFX",         BIT(2)},
>> +	{"VDD",         BIT(3)},
>> +	{"VDD_CCX",     BIT(4)},
>> +	{"ACP",         BIT(5)},
>> +	{"VCN_0",       BIT(6)},
>> +	{"VCN_1",       BIT(7)},
>> +	{"ISP",         BIT(8)},
>> +	{"NBIO",        BIT(9)},
>> +	{"DF",          BIT(10)},
>> +	{"USB3_0",      BIT(11)},
>> +	{"USB3_1",      BIT(12)},
>> +	{"LAPIC",       BIT(13)},
>> +	{"USB3_2",      BIT(14)},
>> +	{"USB4_RT0",	BIT(15)},
>> +	{"USB4_RT1",	BIT(16)},
>> +	{"USB4_0",      BIT(17)},
>> +	{"USB4_1",      BIT(18)},
>> +	{"MPM",         BIT(19)},
>> +	{"JPEG_0",      BIT(20)},
>> +	{"JPEG_1",      BIT(21)},
>> +	{"IPU",         BIT(22)},
>> +	{"UMSCH",       BIT(23)},
>> +	{"VPE",         BIT(24)},
>> +	{}
> 
> As Mario mentioned, please do ARRAY_SIZE() conversion first (which was 
> also the order I asked for).
> 

Thank you Mario and Ilpo. I have reordered few patches and squashed a
couple of them.

Note that there are some tight dependencies while move things around.

Thanks,
Shyam
>> +};
>> +
>>  static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>>  	{"DISPLAY",	BIT(0)},
>>  	{"CPU",		BIT(1)},
>> @@ -162,14 +191,22 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  	case AMD_CPU_ID_CB:
>>  		dev->num_ips = 12;
>>  		dev->smu_msg = 0x538;
>> +		dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
> 
> For consistency with num_ips, I'd call it ip_ptr or ips_ptr.
> 
