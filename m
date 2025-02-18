Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9458F185B4C
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739862547; cv=fail; b=Cx1NA7eSmtf7r/wuN2hHY+nPq4FSaTZM+d3oZGujJl+Sw5SL6YUg7H0yBbtuyewyCKhou79rIWpH40hKA7Cyn68ZzRVmsmV25/OVa5YjL0t2g747wrhgkwwcjRjkEapzhU+Wj6KMf+5aRUFhCwdAnj3MeaMIVciYXMDrwMlQy9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739862547; c=relaxed/simple;
	bh=VlF0SJiq7y0MSKxeN93Y97o5FBCtr4N6zKPLQHO6h0k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rcX9MaCso2KkW9xWp7/VvrykZ99XInQ6g33BSUGiL//Af54RUyGq9NtsfAzns8WmwRphAO0Qrs6BPI+gO89NjLKcCEY35vIc689kRbZZ0WgalVy/6REQ6cWSbU0yjNbJTMEuewdND1SMP9LsKkTdXGz98vMKBwA7hYA2OuGXDEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z3CPuXwa; arc=fail smtp.client-ip=40.107.94.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z3CPuXwa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cy6w8qEX9SOpbgXB9Di9E1hIYma4tGcZjXIDmJBQz404VPIDz8Vvp6A9CK2w8QkbpRt7l52P15Rk6naFzinp6iH+VTJ1sjYKwqWdkKN9ArV7oyHoqcgMFefyrOSRoxYpBPLR3s8YSn745F0nJ65cLz7z8VV9s8+dlXEtiPfMSygPE618tFIPIkN0Kzz507W+PtwjKJb6m192qPI7S1YOU7Wh0Pi30VIeCK1QdbkMk3gOwdmzdodxtAmM1Aw5YJJXHGfWUxPDtPdjdL1YUsdyN4FH+Cf+d70ycgu5mVSmQieW2+mbAM83DVKqSpgKcTpjmNnfhdf7cSp1RuXPlplaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG3s5MZBiRD4tYZSqHW3vJYoets9AaLjgixoRv3EvMU=;
 b=DCGKHj95/j8x8w/QX9NNIfKpP8GHonrMLDOgHPG8jO6ab4l0df7Ze+8nhoXElP6Zhht6DYkRQ3kjy/Vrm2ojJ+9cxen0zAJfdluWskedrt3fWPadQdR/J6nF/8y75rXFvqsUaCNDCErlWJVysbqOC+YYIGJSDkGhEjMqk9Oew2TKAghEOgXWIv+fhguMgvWyvaImHVVYsHn3GPyzcfT32CEymZVQZGYN/JP5GGIyJ+7yPWBDOQ91/BCIj10KNK6XuK6dlqSjdkr5Q0zcJrz+YGwKvoEqlPMlTrqEp+LldHKAyuGTOo/cvGSjrqel6k7BpnlxtWpLnQXovYga/9hd2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG3s5MZBiRD4tYZSqHW3vJYoets9AaLjgixoRv3EvMU=;
 b=Z3CPuXwa8nV7IrTknEFlFnSBJYaJTb4zfG6LNZ3atSnBUunDM1HKVk7DQLBmgeQE/UjreFvhrW35e499QMzyIqrvOG9W9LfV25nmFIf0e2ZZ8miTRQVtTjRmvTMQ8mXsFc9xh5XnzG96a/jg64SSCLf0qg1jFysxCra/j6046M0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 07:09:03 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 07:09:03 +0000
Message-ID: <a6a69151-ec35-48f3-b34d-d9154c771bcd@amd.com>
Date: Tue, 18 Feb 2025 12:38:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86/amd/pmc: Remove unnecessary line breaks
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
 <20250217081720.107719-3-Shyam-sundar.S-k@amd.com>
 <14d745cd-6c36-4db1-8605-5bb169f8dd80@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <14d745cd-6c36-4db1-8605-5bb169f8dd80@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::25) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c5d4da-5277-4165-91f8-08dd4feb201e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXB5L1l3Z0FOUlRPU3VHRDFYd2hINDN2MmU2bWtORHJaQnhrRFlPWExlMTFi?=
 =?utf-8?B?QzVhQnN5NjJCQUdTYnh3Y1U1dnlycitEWW80ZXQ3Vm5OQUc4NE5ma0RjVFNi?=
 =?utf-8?B?TmpjUFlrTG5qU25kZUN1S1ZaYWwrSTJTWnhYcCt0WVhxcGZXdW5SeHpRL0c4?=
 =?utf-8?B?bG42SHdDczVISG0zOTNZclduVTY2QkJxQ2dUc1UrSGtwU255WWRhako1TXU2?=
 =?utf-8?B?M3E3amx2cVhMWjQxTzNMUzJCN2FBRGtzOEoyVklUZmUyMUJJL0ZOM2FCTzQz?=
 =?utf-8?B?UUNnRS9pM2lSQkRxemZIRElTRkUwTXd0TGpzL1RlMGpjMTRyWnZ4bWhIVmZY?=
 =?utf-8?B?Nks4OTVpaG5uUXpkOE1sTk1oWUhhMitZTXZxQjJXQzVBUGlXL1dmZE5tM056?=
 =?utf-8?B?aTljYWFSV1p2RUdqMmVyT0hydTFHbzhaUlVnSkdUOGIxeXlnRm1SU1o4ejZQ?=
 =?utf-8?B?Nm1lcGlkWDJFdWtyOW1qMUlEdTZFaG5oUW5NWk1sK2xtUDB2VlNTNVdNU0tq?=
 =?utf-8?B?eTVuR3JHMFU5M1lvdjlHREZTbmd3cWpiOUx0c3VTL3JaQmhqeit6YjhybDlv?=
 =?utf-8?B?c3MxTDd3dFBNRUk3b0VidFovN2xNVmdaZmtGL0V2WWJNUk5SYVVvMkJGOEs1?=
 =?utf-8?B?Tk5QTm5wNUJqZTl3SW10WE9tdS8zZXJ5NjNPZlhhNVViUFhrOUdJK01wNnFS?=
 =?utf-8?B?QVpPOFFRcXE4NU5lRmlWM0R6K0hjeGFkbURtWUo0WnNiVDBWVy93ZElHTVRt?=
 =?utf-8?B?eVVReUNmWGk4Vk9zVE1GejErWE5paC8wdVdMRFltbkU1b2ZHMU0xaVNSVzdI?=
 =?utf-8?B?VEtpT3lHZkRFdmkwWTRNTnBNeE85YnFSTmkvZ2JOdXJVU3FGbjVFQlFvUFBk?=
 =?utf-8?B?S1ArbmJ2Wk0yQlpsM3Q0Q2dEM0s1Um5YSlZiNHp4U2U5OFB4SHl5cTBmWk10?=
 =?utf-8?B?T2F4dVJNQThhbklGckFYT3NMMU4xMGlaYlg5Zm80L29sVlI2NGcvV0NnTjR4?=
 =?utf-8?B?em96YmdNVnZPNVNFcUZjMWpkd2gxNlFmaWJWbEdmZGE4VDJ0bWhzUno1V3ZI?=
 =?utf-8?B?UkVkTFFFcGI1R3VOc1NhRjhBY3BtSEo3czROcjF6UEhBM2RHMjlGWmMrdG9G?=
 =?utf-8?B?L3lQendYb1cwZkZ6SDQyRjBZck02NG5hYnhqT25ERW43Z1BrRDI0Umd6a0NC?=
 =?utf-8?B?cU5WRGNRaWkvODBxeWR4WGpHTDcyWGdid25RVHlhcnovako1aTRhQkE1MkNq?=
 =?utf-8?B?Z2pac0FnVkRORWJEUmNoZG8vdHNGb1lRM1BTQzErY2NOR29EUW8yb0FkMEhi?=
 =?utf-8?B?TEVRdVdVSjQ4OHBMbWozdnFlVE1RdHU3WUZmeVNRMTNXbnNtLzIyajRIM2Zy?=
 =?utf-8?B?NWd6NEFNTU1xTlZENmtOL1g4VWFrVm94NTdsa1Z2S1VVcU1hQ2FaUnJBWFNQ?=
 =?utf-8?B?bEZVY0tOY0JYS29QT2k2WitZMXdaU2xPeWdha2JDOCtrTHRpOUZ2QUlFTnNa?=
 =?utf-8?B?dGl3OVRhRy8xK0gzdk1YOUdQb2Z4TUhlb0xCNGR5UHlFdXFkVERIc0xqdzZF?=
 =?utf-8?B?cUt5WmlzWkN0em9CY01kK3ZXYlZrYlNuMHJaNE1leEMzWXZac3VXNDNoakVt?=
 =?utf-8?B?am1iRkxRcG93K1JOZjRCVU9CK3NrTWNtU2x2QWIwVzIyWDROL1RXaVlvdm5r?=
 =?utf-8?B?b0I3MHV1VnBreUFBbTBMakJBc2xoSTJJZlZKMEFRRFd3a1VxakRudTdEWERz?=
 =?utf-8?B?R1k0RDZ1ZktWMjU0SzhEYko4U1g0aXZGR05YbEZZdUo2WGRhODlBWER0Vmhx?=
 =?utf-8?B?bEdqMXlXeFY4NjhuWG9FZE1id1dZZVFxZzJsK2VxKzlXdUU0N3FMVDFLRWFO?=
 =?utf-8?Q?n9jO9FwhKD97B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG11dkRZaXd4VGo1OUhDLzNaM25tMzN5K2g4Zkx6N1diTmdnUnpNWGd0ejQ5?=
 =?utf-8?B?Z1pjSmJLV3o1a3NlMGdqaklJUUxzWXNxQm5obzV5eTlrUDlaVkZPZlNCMGRP?=
 =?utf-8?B?THVaWVdlVlJBVXVZVXhuYVdzZ0tvM0VPRWNUWjhBWlVyUi9yaWtmYURzT0xH?=
 =?utf-8?B?MXhhU2xwTjlkQm1NTDAxTFpVSzdrVGR6MFRubjcvVVJSZ2NFdmIrazN2RS9l?=
 =?utf-8?B?VCtZN0dVNzZTdit2YVhqNmhBR1hCRFlBWUNVUDlWd1Z5R00veGNMVU0yREl2?=
 =?utf-8?B?NjY4Qk5CeUhjZkpaeTE0Nk8vQ09wWlhTZ2tGWFJyYWUzeHlPQU11a2paMHFX?=
 =?utf-8?B?YUE2T2lMRTdoRGxUMCtrd21kK2xtZWdKRzhzdldPR0YzVHgyYTFucmVmRUFa?=
 =?utf-8?B?eldINlRpM0xvYnZBZEpTRklESlVuNWZWRDlXTHFaM3hiemVVMnhoaitnamhE?=
 =?utf-8?B?ZktHaWlpTGU3QXpwa3E4dUs4ck1KSDdMOEdkSXRJdGdSeStDMGpIaUt5bmtW?=
 =?utf-8?B?RlhHZlNmTFJsUVN0TVhZNXpMWHp6VEN2cGc2a09NRDhoOXVRMS9Md3JCeG5C?=
 =?utf-8?B?aUtJbnZZNHVxWHhMS0RhWHlRSG1IMlZZU0t1OTBNMyszVFJ0U3o5aGl6TW9T?=
 =?utf-8?B?Q1ZqOTNmR0JzaHArcVIxZ3RoYzlRUkEzeHMzOWVlQ0d2ejZvOUVvMG0vWG5j?=
 =?utf-8?B?bmthVnZNemF3QUYvRTJpZkwzR1hwd2hKSnhJUFIzbHgxa2JUNysyMkRLOWd0?=
 =?utf-8?B?NkF2WElCcWM4K1RaRGkvL2RlaGMxOFdSWktSeUdPeERMT041U0tLTmx6b1g4?=
 =?utf-8?B?OUx5MmRKTDBCODIrM21PVVR4U0FxN0N4YS91Q25OZEhqYm5mOGFTd0FMd1Uv?=
 =?utf-8?B?dEQrQlFOZHZNSS9WNGE3a1pzMGNOR0RxclBkd2laYnllcUNncG5DT1BVRXJD?=
 =?utf-8?B?c0dyeWFRUVV5UkJyTnJXbHBTV1JLeU1QR0NXTmswbnE2RTVxSHgrcmpJYnRx?=
 =?utf-8?B?Sk5MWlBRelZZTHB1VnFLZ3dqeFB6eXFQOHRCWVpQcHhuS0w3WnlNRGtQZElF?=
 =?utf-8?B?bG03amUyNUhjeDFEb2x0ZitZVzU2aTBzZWdTUGkxcWNhb01kMnNiZm1oN3hQ?=
 =?utf-8?B?TjFoSTRuSWlNczVGTU40M05vc3o5NUFJU0NOaFNQUnlUVlJsOGF2MjMyQVoy?=
 =?utf-8?B?UW1Jb0kwK0RnQUlETC9kbGtBUC9JNGcyaWw5MGRVeXg4S1VieFB3aHlYWXdT?=
 =?utf-8?B?OSthSFovejM0SmQvUTVpQXdXSVdDbXphUzgzeFAzTXZ6QjRRSmExTW1qMEh5?=
 =?utf-8?B?a29HYUVmWUJaOStoWEFrREFpaEZCM09mdHQ4QWQyZzlCdWJlcUU2NklvMlZX?=
 =?utf-8?B?ajlPUGVTcVNEaG55R21oVzRnMUhoOHA2eko2aTdDTkJjNDhEN01JOHhHTnhM?=
 =?utf-8?B?VUxxYXlzMHlXeHNWVmF5WWh4U2doOEtvdFB2ZTV5VUJ1eGVhUFNqQjRHMW15?=
 =?utf-8?B?alNMSTVGSGZvMzdBRzd0WlZaQ3prZW1CZmlORmd2TmErbFdKNTZ5OXJwenll?=
 =?utf-8?B?RUw1WW1zcVFDWXpuRmtVNHUzbWhtUE1xZUhPZDJacmVtQnlXakRQdUlmOTFR?=
 =?utf-8?B?a2RzRzZrMGpzaXI1SUk3NndGOGs5NVNYbmsxbWI0VGdGeEI3RUkxUXpVdmk1?=
 =?utf-8?B?UXQ2dWRJcEdrNnE4SkxFSzJKSGdLcnNtZlpHMnBpeHBiVkdocWludWlxTThI?=
 =?utf-8?B?Uy9qYWs0Z0pIeXh2RUpnM2U5RCs0WGw3ZTRWM2NwU0RIWjlFZ1BIc1VWeld1?=
 =?utf-8?B?Qk52Q2tBdURMK1Z3YzhqL2FpVkQ2R1BUS1ZKTHJLemNObzB5KzExVCtUdE9s?=
 =?utf-8?B?dHFKZytNdjdvTVBlL0ptb0Q3QUs3SUFRS0k5ZERJbnd1MjBkeHlGdDJRVVRr?=
 =?utf-8?B?bDJCTGV5L2t2aWFRVzMxNTI3TXNnWnlvR1A0UjlFZEJGR29RV0ZwcjhHZHl4?=
 =?utf-8?B?bENlQ0I4ZnJWODdoUElXQjZOdGs2NDBkNHZTb0ZKcXErRnFERUhtZlFlaFQv?=
 =?utf-8?B?VE0xeE5rM1dxaUJNczBUaG5CZXBCZnRBMnN4aWV1MDUyYTdSYS9QV2lFRzNZ?=
 =?utf-8?Q?3C0JuxxLZj5B7AhfJAe1FLRbc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c5d4da-5277-4165-91f8-08dd4feb201e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 07:09:03.4776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MThRpbQ9VOkr0f48KfX0V8GL4pw/V8Az123GbhcwUtMV3rrUwEqpU94gOTxc2JutwnqYUGl5YF2fZeldeNGILQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312



On 2/17/2025 21:08, Mario Limonciello wrote:
> On 2/17/2025 02:17, Shyam Sundar S K wrote:
>> Enhance code readability by fixing line break and blank line
>> inconsistencies.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmc/pmc.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/
>> x86/amd/pmc/pmc.c
>> index 742920530987..d80a5b899a1d 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -168,7 +168,6 @@ static int get_metrics_table(struct amd_pmc_dev
>> *pdev, struct smu_metrics *table
>>   {
>>       if (!pdev->smu_virt_addr) {
>>           int ret = amd_pmc_setup_smu_logging(pdev);
>> -
>>           if (ret)
> 
> Does checkpatch like this?
> 
> I thought it has checks explicitly for
> "Missing a blank line after declarations"
> 

Not sure what is meant by blank line after declaration in this context.

This change is mid-way of the function.

I did run checkpatch again and did not see any issue.

total: 0 errors, 0 warnings, 0 checks, 49 lines checked

pmc_v1/0003-platform-x86-amd-pmc-Remove-unnecessary-line-breaks.patch
has no obvious style problems and is ready for submission.

Thanks,
Shyam

>>               return ret;
>>       }
>> @@ -222,7 +221,6 @@ static ssize_t smu_fw_version_show(struct device
>> *d, struct device_attribute *at
>>         if (!dev->major) {
>>           int rc = amd_pmc_get_smu_version(dev);
>> -
>>           if (rc)
>>               return rc;
>>       }
>> @@ -236,7 +234,6 @@ static ssize_t smu_program_show(struct device
>> *d, struct device_attribute *attr,
>>         if (!dev->major) {
>>           int rc = amd_pmc_get_smu_version(dev);
>> -
>>           if (rc)
>>               return rc;
>>       }
>> @@ -704,7 +701,6 @@ static int amd_pmc_suspend_handler(struct device
>> *dev)
>>        */
>>       if (pdev->disable_8042_wakeup && !disable_workarounds) {
>>           int rc = amd_pmc_wa_irq1(pdev);
>> -
>>           if (rc) {
>>               dev_err(pdev->dev, "failed to adjust keyboard wakeup:
>> %d\n", rc);
>>               return rc;
>> @@ -743,7 +739,6 @@ static int amd_pmc_probe(struct platform_device
>> *pdev)
>>       u32 val;
>>         dev->dev = &pdev->dev;
>> -
>>       rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>>       if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
>>           err = -ENODEV;
>> @@ -751,7 +746,6 @@ static int amd_pmc_probe(struct platform_device
>> *pdev)
>>       }
>>         dev->cpu_id = rdev->device;
>> -
>>       if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id ==
>> AMD_CPU_ID_SHP) {
>>           dev_warn_once(dev->dev, "S0i3 is not supported on this
>> hardware\n");
>>           err = -ENODEV;
>> @@ -767,7 +761,6 @@ static int amd_pmc_probe(struct platform_device
>> *pdev)
>>       }
>>         base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
>> -
>>       err = amd_smn_read(0, AMD_PMC_BASE_ADDR_HI, &val);
>>       if (err) {
>>           dev_err(dev->dev, "error reading 0x%x\n",
>> AMD_PMC_BASE_ADDR_HI);
> 

