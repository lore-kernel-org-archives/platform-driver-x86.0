Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8C1885BD
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730214637; cv=fail; b=teMPx6Zy6XtoQxh/2vnsx5gpIXNGBCV0M4effeg4WkrpeWJgIkKwVoheQOyrfpEhZEoJRpFsu9mJ4OX0CuJmXNJGlMO79c5ezmhzTHl95iYUePKK4MNkzp5OZv0iejpC8KpgeYAhKishbtMdpPzk+zL4EcCs6QFp9x7lJpm9N9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730214637; c=relaxed/simple;
	bh=RRIf1hoW/2FaI4co3AYpzRaogLL2VHzui7vMSxDK7mQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u+ct4yIi1QtCeb9+O0dx5h8EEt5qGeh141f8r+jvbFwYKTXGchqu3ElG7SktJd7jhfOTatyAWB5wfThSG9Q65seTALVI6GcslnYIj795zso8Tig72p6ySovPAbOMZFE/9Z5rLZHtwCYFL6B6e7Y1CsuWH+WS9yENzUyuRQC88jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r53TqCsr; arc=fail smtp.client-ip=40.107.94.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r53TqCsr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INvWs1JSHM88MzI64Kvs6snYj8yIYmlIrqiXIPI9QW93QxgcyjjCthV7C1xu4SlL59SKWLnuzTHJk27cIvBsZgkTQw0owRUI+xms5RlyvZtWv0W85Uwq3OKxcXvMkNx1kqaESbjm+K4RyzMa5/BQEEcmQWKlICPwOm5Uew8kJxoBD9LJqc5ryglDxA7oHnHIpmjvpOvDrxSP0FZ0aKvT3Y+QXCFc/UKwU6r8yPBdp4MrQ8LjfwbxKL4O4ZHtBVjCmeD9Os3eiKXncra/mYBwoacbkE0A5yLY8+EXzy3PQPP1xtzJn3xsWQ7vlQtyUTIDapbpNNaih3kGLIsal1evoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4chH/cj2pchlYXIiSRKJAUgb75AfGCIJlEGEy0sajS8=;
 b=EG+O229wfe9kNOgrbjA/NcDl4C2wHzyOy1poz7fpkxWY9usQLyIHAxUAq9m73fYUBhE5vHDh+yXZrKwVLKg3MImvk9k9q0Jj6XT/PIhUpl0guutsQOCEqAInt1FA0EnqmwPMl/Tz5Ul/E7x9f8ayGFR4IC+Hw3HgHjfDHjGO87YjMhwQf577RtQgr09Fvn8Z9rne8NciTT0IYmq4VDIJunA3H5m09Uig2xhir8CJmYOSys7u3o6vrP/LCVN/iBl98wGP9vrpeTDPT30QG16neOskHEIr+k15W6pRSBZ8rTSfDTQW9XJsZxsoo09l1VpzCO6jZzGtsqnZIn87YAC17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4chH/cj2pchlYXIiSRKJAUgb75AfGCIJlEGEy0sajS8=;
 b=r53TqCsrXR4VD4VxJ/+SwNwLpoGF6d7TqAgJIQ/7nQIdQTDpcceiJQOOiQrhNJ74Z9HtZsr18aHFkcYlszuz9ynf8Q/zjkxwcuoDAl74DBGhBQVZmy5W1tLkPhTznqmPWnd5PUjVAYzz86cWOcDUGKMRHnbB9/JcBMo8CoXHfBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH8PR12MB6985.namprd12.prod.outlook.com (2603:10b6:510:1bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 15:10:31 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 15:10:30 +0000
Message-ID: <29139f25-95ce-42a8-a1c7-00846257d2b4@amd.com>
Date: Tue, 29 Oct 2024 20:40:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] platform/x86/amd/pmc: Add STB support for AMD Desktop
 variants
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-8-Shyam-sundar.S-k@amd.com>
 <b1a97ede-3201-4b04-96b0-9a5df92254f8@amd.com>
 <5b2e7143-97f3-4907-96c0-21a513058df5@amd.com>
 <cd26a6d1-a9fb-405f-878d-4b47a2095fca@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <cd26a6d1-a9fb-405f-878d-4b47a2095fca@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH8PR12MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: e47e9b87-c08a-4ee5-530b-08dcf82bd3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWJSMFk0Q2QwYmt2WUdQU3JTNFg3RkpWRGZJRlUxbXh0QmxYUEpVa05vOXYw?=
 =?utf-8?B?R2JDcUh2MmYrMS80ZFBuck0rTEZ1eEdnNDA5TFhiUDhlOVdJYXNyMzRHVXFs?=
 =?utf-8?B?MWFic1NNKzYrZVBVem1yb2FySU5JT2JkTS9oalJDd1hweTE5U2R0RHVIWTVp?=
 =?utf-8?B?c1R6Ukhvc1FvTFUvRlRHNnFOQXJIVDFFOWE3Y20zRyt5b1dLdGFURmdvb3dQ?=
 =?utf-8?B?a3NrRHdEdFBERFdBVUZPcVBHcnNFY21kZGxNdkZUNmhySzV5ZTdEeS9Ub2pU?=
 =?utf-8?B?cEJmRUNvMXBCbEY0a0J1Sll0NUpJWklLb1d1QVdxTnNOQlJVMmlNVjhhY1NR?=
 =?utf-8?B?b3lkSmwwRC95WFJjUFpPZXRMTjdCZUpnYVJZeVFhTXhhUTRCQSttSTlQQlYr?=
 =?utf-8?B?K0lCSFRtT0VSVGN1ZUFvQUVuUDdiQmFCaVIvNUdTaElwTyt3SnMzeldvVFA0?=
 =?utf-8?B?SWNFRVFUNDBwVEpITXJOOWNCaHFENlVxOTBIRU01a1JEMWpKMkpGMlRzRFRL?=
 =?utf-8?B?VnpHK1BhKzYyTk82QjQvRTUyeWFqMlF6RzlTMkFTZktZWlhqcWx0SkJHeEk1?=
 =?utf-8?B?Wjd2Ui91cVR3ZW9Fc24rSll4M2xXQ1pOcUJvbDRFUVZGbGVqQ3BBcTEwd0cz?=
 =?utf-8?B?b3lMVTJUNFNOT25PREtHQ2I3V2VNWC9xYnd4R3N4Rjl5VjB0NER0TSsrOWJq?=
 =?utf-8?B?TnJJTnBmRGI0YU45NEEvcWtXNW9xdDh5cmg4WEZ3WmdtWDBDbVNDcnlxemZI?=
 =?utf-8?B?QUlkYnVGV2c0WjFYeE80VHNXc2Evd2xCUGcwMTl2cit6YXhVSVA2TUZoVWM2?=
 =?utf-8?B?c0RmUmtFbGlUaGRSOXhiSDJySkQ2ckQ4d2h0MDBtd0hHcGo5RXZPMVNZS3lq?=
 =?utf-8?B?WDVFTGdvekUzQXlIemxhMlNmeEhmdjVoM1IyK0dGS0lQSFdqWEsrNmVONzdj?=
 =?utf-8?B?a2NTanV3bjZBNnhZWlNob3M4ckg2ZmxtTFV0TWZ6Rm5oazRNTnRvQWZRdndj?=
 =?utf-8?B?NHZ3NFgySzcvbU5YcFBUNG1STTdFN3hwaW5yOEVCMW1QWkJpVUx1bEVDUStr?=
 =?utf-8?B?L1NlYVZoemFVbCtSWWYzdlliUWxuYkZJOVR4bzFZUlByUGpyS1IwbTduYkdB?=
 =?utf-8?B?emt0YlYrZTVabmV2VFV4NkVTa0o5L1BzWWdWQVk1STNjTGpZWXhzS25kd0ln?=
 =?utf-8?B?N3QvR2R3M2V1STJLekJheVBHL2s1RWFsS0t3VEVmeE53SHRpOVFRbWJiMnpS?=
 =?utf-8?B?YVJ1QXdzRGVsNmUzWjJITCtTdUFRNXVyYTlwQ0RXK2VWdC9rMlpwd29yYmF5?=
 =?utf-8?B?dkJBVEh0MkFMUURPRFZLL2NhZ0h3NkVFd2d3YjhZRjhhTFZjQXdnU1JpYndG?=
 =?utf-8?B?Ry9pUUhmekxMdHA0Umh5OWUwQkIzeFlreWo0NWVtQ1VEdm1mQUovUk5ydmww?=
 =?utf-8?B?NzhNVFZpa1NYRUM4dFU4RlJxSEYyWnp1cWh3VkhkWWZ1K1IrSUVNMXFDN3R4?=
 =?utf-8?B?VzB0c1B6Tk9wMmZSNjRYbHJYOGdOenJodWt5dGRjMGYvdmVDSE51NVpvRVh0?=
 =?utf-8?B?VVkybE1GLzVDby83N3BBQkJ4U3hicVEvalVScVB2L0hxNFdadzkwZHpMZXBi?=
 =?utf-8?B?eWRLVHg5bE5wWEtRK3ozYjJ0QjRuczBLS2d1UkFqc2RjTlNPUXUzbU5nNWl5?=
 =?utf-8?B?aDdieVFoRE5iUmVyMVIvTjNPV0tPRnJiSGpyeVI0UHRXYnluRWlKRFpLUDRo?=
 =?utf-8?Q?HgAyErBaLH/hf21FzbxfDDsMRNuhNGXJQ61Z1Jp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU4weG9PclZ5T25aSWRCRWY2eCs5bVVpVVVhV3ROKzNoL0RiTkQ3c0ZsVzZI?=
 =?utf-8?B?ZDJsdW5TU0FHdDFvcnk1MEp5YzZORjVwdXBVZC8zUi9lRkJBbUtZSnlJb1BW?=
 =?utf-8?B?RkY2bld2R3lJcHJySGk4d2gxUVdBeGVFZEEySHZsSE9aU25qM0UyNE9NVzJH?=
 =?utf-8?B?V1FoYVl4R1FESFF2TUk3Umx3TDQrUlV2dUg3K1NNanBRNE9kNVcvUUQxcFU5?=
 =?utf-8?B?aFhsdWFaU0N0dkZUVlVsb0xJTnplZzhaa2I5N1djemlxSjhZbVZDbG94SHJS?=
 =?utf-8?B?QTRoQXhqbVBUUi9IZno3MXhUMzJrOS9DTG4ramlmN2V2MGljZC9PY282WnBn?=
 =?utf-8?B?WTFMdW5CVDkrRjdoWmRRcm1URm05WnFrQ1FsdWxFcW9Zb2R6TWFIWnFzcHFD?=
 =?utf-8?B?amptdzZHRktxYnY2WG1qRmdxeDR2TmFkY0J1STdERkMyRGIvcWIyNFBNbUtz?=
 =?utf-8?B?VjZuQ0ljZjhEeHNjOTlZQk9aQ3Q1OWJZczB6bk9mMFVtMFQ5S0VHTEJkQkox?=
 =?utf-8?B?YnN3NUxoelZGU056dEgrd1lOZnUyWEptTnQ2LzBHa3hVT2k5Z1BkenhZb0pz?=
 =?utf-8?B?NHoxemlMME8yMEtNbUtaQnQwVUJpbENhQzhrN2tST1hpaG1mcGcvN2dmVkRj?=
 =?utf-8?B?TnFFenFVbWg5OUljeUVnSHRGYWN3KytYVDRXWDc3K0xmbUNXamVCbjBPSWRE?=
 =?utf-8?B?bWRBdWJIbFBSdy9pVUpFMmR0ZlVWUUtnNjlSdEN2SGlBd1JOTmhsaEJnZ3hG?=
 =?utf-8?B?Tm9aTzBrS0JtM2d3TU9UL01MVmo5V2Y4UlpBSlFPR1R4N0hVQUFRRDd3Vldi?=
 =?utf-8?B?U1U2cGhTcVdzRjl5dnY1R081T2FSVWJWMmo0bnhQdWZKRzkwcXJmclhaaFVx?=
 =?utf-8?B?clBPKzNCWm1Pelk3cVptS29TYUhLQlp2ZDV1dVBodW1ZeXB0WlNzblF6cEF1?=
 =?utf-8?B?R3dOU2dISTVSRmNuV3J4ZHY3aWRMd1o5aHZVa0x6QytGekQweU1ZTHd0bzY2?=
 =?utf-8?B?VTFteU9WeTFQL3BVTEROZ25DTGpMWVRNMnZ5dzEyeXRTWjFLTXlITUE5S1Jk?=
 =?utf-8?B?LzF5S2F1TkhtUVRibDlnYkNUSkVUOXVyeXNiNG05Umc3TGo0RHpKb21RUXhH?=
 =?utf-8?B?T3VON0RYcU9uL3I2TDhnNXhCVlg4bVB2S3k2dGxkTkh3eEJ5VTRzWTFDdmNp?=
 =?utf-8?B?ZHZIaTJiNExMVU1MaXkxeDFlcXppVzFBUEFNRE9xWHoyVGVKZHhvdGFnWXVh?=
 =?utf-8?B?MUtuZ1ZBKy9FakZKZ0VEMjg1aUI2OGtKNGxxdnRRV3lZZFU2cWxCdGJqSzZh?=
 =?utf-8?B?cWxQS1hTK0lLKzVZY3ZyMXNoU3ZpSHRaTUNkakUrUE8wWlFodURsK1lFMGJx?=
 =?utf-8?B?T3h5VkZwZWNLN2Y5cld3c1VvOU1vcVBQWUhrMU5PYi80akE2UUd6T1hMM2lq?=
 =?utf-8?B?S1BnV3FxeGc0MGxhTnBvQVg4d0drbUtKcXlxbXJDVEw3MWFJMVZWTiszRVYx?=
 =?utf-8?B?YmZGblRoT0ZpTDFSaWU5NDg1OFdKR0JFNFo2bHpLT2dVZm40SktwaDZCU3hH?=
 =?utf-8?B?SkNmQlFDUHFSS1UzanVVM3JNYkVRUXV2ZUROTllZV2Ira2Jtd296MnNIVUNl?=
 =?utf-8?B?R3dzTnJSWTA4emJyYVByUVNzZjk4aDBvOFFOYlRZci9JZEJ6N3A3dmtzT0pD?=
 =?utf-8?B?VWRHYVUxdlM1dXRDYmhhTW9qTnZydUpTQ2Nkd0dmc3Zhc1VnUm5VSlFPMGxt?=
 =?utf-8?B?RlBweVFJOEhOdXJXclREM1B3Q2lJYkRUVG00MUt4OFZxZzc2WS9XODh4RFRZ?=
 =?utf-8?B?MWpqaUNkYk1vTnhzNFhsSjRKN2FnTnoxZ3lvTm55enY4RmdFYXh1dU0vQUdL?=
 =?utf-8?B?RnZPenBHRUFsNitBa2Z1MmtYbjN6WVV2QmFmVDZqb0lqYWJnR0JjZHRhLzRE?=
 =?utf-8?B?NitiYnF1M0JyanQySGFQNHM2MHpZMldmU1IxSnpwTk00UkNLYmRnem05bkVr?=
 =?utf-8?B?MlNSNGFUZCt2RHRCNlR6SllYSnQ5VEZUUUMxZllxdTBQZk4xMmpyNTdvdk0x?=
 =?utf-8?B?alRtWGg2YjBaN2orcjZneXp1ZXRhVGZTMko1NmtxWTNhL01QMkNVTndKRWMw?=
 =?utf-8?Q?YvJCYGu8TgZqGjW4Ah8j37VDB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e47e9b87-c08a-4ee5-530b-08dcf82bd3ee
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:10:30.6340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEoknJFl4dCOG1vF9yHvp1q2NdyE9WGF3W3Pg0lLPkjKGTwIUd3pVoRhwA6lKv+DlkUquEXdAnbROWNO+6Q09Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6985



On 10/29/2024 19:45, Mario Limonciello wrote:
> On 10/29/2024 09:09, Shyam Sundar S K wrote:
>>
>>
>> On 10/28/2024 22:18, Mario Limonciello wrote:
>>> On 10/28/2024 02:04, Shyam Sundar S K wrote:
>>>> Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
>>>> However, to accommodate this recent change, PMFW has implemented a
>>>> new
>>>> message port pair mechanism for handling messages, arguments, and
>>>> responses, specifically designed for distinguishing from Mobile SoCs.
>>>> Therefore, it is necessary to update the driver to properly handle
>>>> this
>>>> incoming change.
>>>>
>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>    drivers/platform/x86/amd/pmc/mp1_stb.c | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c
>>>> b/drivers/platform/x86/amd/pmc/mp1_stb.c
>>>> index 917c111b31c9..bafc07556283 100644
>>>> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
>>>> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
>>>> @@ -36,6 +36,11 @@
>>>>    #define AMD_S2D_REGISTER_RESPONSE    0xA80
>>>>    #define AMD_S2D_REGISTER_ARGUMENT    0xA88
>>>>    +/* STB S2D(Spill to DRAM) message port offset for 44h model */
>>>> +#define AMD_GNR_REGISTER_MESSAGE    0x524
>>>> +#define AMD_GNR_REGISTER_RESPONSE    0x570
>>>> +#define AMD_GNR_REGISTER_ARGUMENT    0xA40
>>>> +
>>>>    static bool enable_stb;
>>>>    module_param(enable_stb, bool, 0644);
>>>>    MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>>>> @@ -244,6 +249,13 @@ static bool amd_is_stb_supported(struct
>>>> amd_pmc_dev *dev)
>>>>        switch (dev->cpu_id) {
>>>>        case AMD_CPU_ID_YC:
>>>>        case AMD_CPU_ID_CB:
>>>> +        if (boot_cpu_data.x86_model == 0x44) {
>>>
>>> It's unfortunate that this information can't be discovered from the
>>> F/W, because this code is now turning into:
>>>
>>
>> That's true.
>>
>>> switch(dev->cpu_id)
>>> case FOO:
>>>      if (boot_cpu_data.x86_model == BAR)
>>>
>>> That's pretty ugly IMO.
>>>
>>> If you're doing to have a check like that, I think it's better to just
>>> ditch the cpu_id (root port PCI ID detection) and go all in on x86
>>> checks like this instead:
>>>
>>> if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
>>>      switch (boot_cpu_data.x86_model)
>>>      case 0x60 .. 0x6f:
>>>          //set up args
>>>          break;
>>>      default:
>>>          break;
>>> } else if (cpu_feature_enabled(X86_FEATURE_ZEN5)) {
>>>      switch (boot_cpu_data.x86_model)
>>>      case 0x40 .. 0x44:
>>>          //set up args
>>>          break;
>>>      default:
>>>          break;
>>> }
>>
>> The only benefit I see is instead of using cpu_id, using
>> cpu_feature_enabled() to know the underlying generation.
>>
>> We have to update two things with the evolution of family, i.e.
>> s2d_msg_id that is changed (and getting changed..) from each
>> generation/family/model and next is the passing the right arguments to
>> PMFW (i.e. msg/arg/resp).
>>
>> But the catch is, the s2d_msg_id is tied to the model, for which we
>> will still have to depend of boot_cpu_data.x86_model() to get to know
>> the information.
>>
>> So, the code will turn something like this:
>>
>> {
>> if (cpu_feature_enabled(X86_FEATURE_ZEN2)) {
>>         dev->stb_arg.s2d_msg_id = 0xBE;
>> } else if (cpu_feature_enabled(X86_FEATURE_ZEN3)) {
>>         dev->stb_arg.s2d_msg_id = 0xBE;
>> } else if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
>>         switch (boot_cpu_data.x86_model) {
>>         case 0x60:
>>                 dev->stb_arg.s2d_msg_id = 0xBE;
>>                 break;
>>         default:
>>                 dev->stb_arg.s2d_msg_id = 0x85;
>>                 break;
>>         }
>> } else if (cpu_feature_enabled(X86_FEATURE_ZEN5)) {
>>         switch (boot_cpu_data.x86_model) {
>>         case 0x24:
>>                 dev->stb_arg.s2d_msg_id = 0xDE;
>>                 break;
>>         case 0x70:
> 
> Can you double check hardware documentation?  I believe these should
> generally be ranges, IE:
> 
> case 0x70 .. 0x7f:

Yes. I double checked it. The range would be applicable only for
kicker programs and not all generations may have a kicker.

Also, not all BIOSes support STB/S2D. So, these models have to be
added only on need basis.

Thanks,
Shyam

> 
>>                 dev->stb_arg.s2d_msg_id = 0xF1;
>>                 break;
>>         case 0x44:
>>                 dev->stb_arg.s2d_msg_id = 0x9B;
>>                 //update stb args
>>                 break;
>>         default:
>>                 break;
>>         }
>> }
>>
>> //update stb args
>> }
>>
>> IMO, this still looks clumsy. 
> 
> Yeah but it is closer to how all the arch/x86 code works too and at
> least logical to a bystander.
> 
>> So, I will take your input of using
>> cpu_feature_enabled() and drop cpu_id from root port..
>>
>> but, I have a code simplification that will be addressed in v2.
> 
> Great thanks!
> 
>>
>>>
>>> if (!dev->stb_arg.s2d_msg_id) {
>>>      pr_warn("unsupported platform");
>>>      return false;
>>> }
>>>
>>
>> This is not required, as we will end up having unnecessary spew when
>> this function gets triggered on platforms that wont support Spill to
>> DRAM, i.e Cezzane or lower.
>>
>> I have looked your comments on 6/8. Will address them with
>> cpu_feature_enabled() + code simplification.
>>
>> Thanks,
>> Shyam
>>
>>> return true;
>>>
>>> Then each time a new one is added it's a lot easier to follow what
>>> it's really matching.
>>>
>>>> +            dev->stb_arg.s2d_msg_id = 0x9B;
>>>> +            dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
>>>> +            dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
>>>> +            dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
>>>> +            return true;
>>>> +        }
>>>>            dev->stb_arg.s2d_msg_id = 0xBE;
>>>>            break;
>>>>        case AMD_CPU_ID_PS:
>>>
> 
