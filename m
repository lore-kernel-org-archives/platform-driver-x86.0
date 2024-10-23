Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322261C3042
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694105; cv=fail; b=Zy1HnEHlbc+bLJDldu8JNmr6ALRm96C9GaZyXLodbn4LPEvWp0JTdly9gpHRGTJ67+WL6n1iUbiowBPHym4PeytYkF2Vhpc1wt8XdX2QQDlN2bpUu/CGe8pgIiC2WQFubkiOMh/yP0NRHWblIWTbMInoh3OlMbLio/1WZtp9y54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694105; c=relaxed/simple;
	bh=PP0SpgurQIQT5uojIwxS5wumnTvwdS8EKJv6gjEFi/4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QYdR2rqDS7H3ze43sqoPUsyffiNfQinctSTr8JNf0hNDKEjAWGNtzHSDGEW2SfpUPlP9T5g6pWI8QOIZFa7NWUwpULkHFBzTpeAKsNhc+cMeG7Qr0X+L1b+nW/S9PfGFTP5YBbOGT0Ft/8i8NeRRSAYhEF4J2D1ik13npt83XcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UI/Tcxc0; arc=fail smtp.client-ip=40.107.94.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UI/Tcxc0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SG/+2zNSejOYByYD4oB5882Q8oK2Akh4ubBVJNylURRRQiTYG1Los0/vRp/dklxi/PpogSHriDWeImMbvCyGsp3xsBUPOtAxzG8zCIzAHplaqGHJxqWPuUDKGGT6eTpguEEL6TJ1UJtZSDoZil5PKvSYlTo7jSGszfDERex/BQiMAGjBYAND9EsSg1n3fDqId8xUxxxvqBrkp6IxJR5Pfagw0KYu6Htb54x04YXSQUgCIqqZVyXuQ7Jnr8ISmQV5sOWkZEnLyck7Osqv7gdb3U3KrrEgrW1abh13wOrV+C5TPPmStrk1Iu1B7upxMM6sPDmwgpprfStVy/aai/oaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58Lxx8x4++OzCtSSKgYGdWkcD4mkh5MUudjQwn6ywlY=;
 b=rpc1mGXmrMVate0ihCxJ4g/CnXDopr71qfktRBH/taHTW7x+nGd3uAAP5ZlKsdFDphbXZFtvuIU67DE0ClwuK/URZUByigec6nnRTe+y3di7lxZZicJyRN/NnwAbS4plgTU25INofh75uqPKWsuXB/hwy+jPJDsT7oEu3Ur9k9oyYAUpzqY6xYzZoLQMDCdW+1OM8OegeUC/XQxpgBgA/YOUvKhhftXy+qCyzK5MfuasX6XXE1pi//t9Z0cWMybKLZ10pYtJ/0TNCCoUN1XDALg7gw2HL/qk45alwn7s2ZSzHzln9eKek4tDigIeRvFQvmpLDFtdW7A9GdrE5gRY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58Lxx8x4++OzCtSSKgYGdWkcD4mkh5MUudjQwn6ywlY=;
 b=UI/Tcxc0Az4McIamGXBqxVv+59Ff+Lscm5yFk/l78RVWtr5+K9KR7Qepun7VzQsaE9un/Wh8Z8JFsdaHDolvDefklwK+HgTC/xmL2Oo8Q1EI5eNdpXwXWqdgoSu+Y//qJmQszw6HGNeak41DZqrz/FefbLxmSdKMkYOwekpovmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 14:35:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 14:35:01 +0000
Message-ID: <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
Date: Wed, 23 Oct 2024 09:34:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0086.namprd12.prod.outlook.com
 (2603:10b6:802:21::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ce1e6a-19bd-4c27-b9f6-08dcf36fe035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlZOZE1ENjN2UWFnYllMaU9aWFliWjRuajVRNkxoNUlHL2xFM2dlL0ZwTEMz?=
 =?utf-8?B?dmI3UEJxT1Z0OXdsRkN6UWRKamRSV3lZL1daeTNvSDJHZ3FiZzVGbWY5VXQ4?=
 =?utf-8?B?VFlVV2VRaGk2dVNIcjk4Ui90UDM2WUY3SjVvVHZRSmtiZkRLUzVRKzAyUmpx?=
 =?utf-8?B?K0Y1eGNwU0cxQUJTOU1ZS25QWFk2WE1MR09Oa05FU1hid1Y1d3pQRkdTSGQ4?=
 =?utf-8?B?eHVDNzNQVzkydjc2TjhlMVR1K2FLV0pnS3JFckdOL1Q1MFM5Y3pOQ0FHMVl4?=
 =?utf-8?B?UE0xSi9ORi9MN2xKMGZNTC9LcG8wdk5Nell2UjFqcDZjdTQ5K1QxN0RzNTdu?=
 =?utf-8?B?VEFaWjNmL2haV2VSdEIwVHV1ZVNXY2pOZGtGVDIwOHFZUFNEQm1kOHJZMkJz?=
 =?utf-8?B?b0s1a1p3NUxsRUZZc2k1TEx1KzFHU0tIZGZ0eVFoQjVQT1BpM0dzaElxbGpQ?=
 =?utf-8?B?T0xjZ0ZZQ0s4L2xPRjVSUTlJWFF3TEFuZDVTU0dPMVNrbWZLVU5aNkQyWFFX?=
 =?utf-8?B?dWNZMVZjWUFYWDBSQzI5ZmJnRFpQaTByYmduMU1zSzVnVE1iRmtrUWQwOXR1?=
 =?utf-8?B?NEl1QitBUHp4OG9GVnExdHNmcWs1STI2bTVobUtJbVd4Qi9LQTBjWDNaaVUy?=
 =?utf-8?B?V25neHk2NXBnRkIrUTNpOVVCUHgwRHVvNW5JTmhvaVhPdmhreUN4ZU1XZk16?=
 =?utf-8?B?dWhGbno1Y0RreTRSRXhYRkFlS0dzNkpIYnNLMUhYaFVBSm9VaStxNStQaG1K?=
 =?utf-8?B?RnNHTUlkSTN2WjllbU1LaXdYU2xoVkVlcG9oUEtmUDN0ZEdhVURZeFdwWS93?=
 =?utf-8?B?T1VNYUN5ZmtKcmZzVC8yQkUzNnBxVjhkT2xrK1Bkc2doL1J4TW9qOWMvTS9w?=
 =?utf-8?B?ejloS0VWM3RDL050bGFnY3BWdkp0Q00veXgyUTY0dTdCcGZMSm4wVEFlQysz?=
 =?utf-8?B?RzRlKytHeEc1RmVrblgzWkhyUFEzTzdmRUo4eW1abWp5aXo3VGVXeDAyek83?=
 =?utf-8?B?UnVsV0pTNmhCV2thZVliT2Vlb0hnbi8vcG9wd2FTNENOQlNxb2EyY0ZUdWRn?=
 =?utf-8?B?cHVFRE5oMVNwd25YYXVVVU9ZMVJaNWVsZUVQa0szNkF0OHdYbGJkOHFBM05Q?=
 =?utf-8?B?OGdBaTBlbmRFZjVyVVdXSUxqNTdLZW5NeTZqTFpaSnU1QUw1ZVE5ZWpGYzRZ?=
 =?utf-8?B?NXA0WDBKNHhYWG0wRkpJTTlEWVRBRGEwM1dxQ0JDL1JmL1IzZTNsa3JTTXBS?=
 =?utf-8?B?K3FvVlF4TUZNTGRNOFIzV3dXSkZtcHhuZmRXemJwTmNwbmpaOUtRRFBRVU9z?=
 =?utf-8?B?Wjh4aXUxVHh3ZXU1UGExKzFCTHpOSEdqNmt5RlY1UlptanZwWlVRanBpbTVu?=
 =?utf-8?B?SkVYdys3SXM3WjJ5N09Pb1c2bWd5ME5PVWhWbC9sLy9ZRHY1Q0ZEZmR0RHFm?=
 =?utf-8?B?MUlnZmJPQVBpaFZreHNPMWlmWGxKVjRlOVpTT3VCTjdnenU2Z1lPQWFSZ2J0?=
 =?utf-8?B?T2xjRDVNTWFqYUdxcTRHR1BNZTBBM2Jud2xVaU81TUx4T3hqZWpHRzZkbEpO?=
 =?utf-8?B?OVVGK3Q0RUFTdnlkbTJDTGRhS3A5ZFlPdFZsUU1DZUFVZVU2MjZmYjR4ak9w?=
 =?utf-8?B?NnNUc2NxYWtXY1lMcjRkb0RzU3pZbXJwYVNmdjU5eVE5R1E2S2xrSDlaQURh?=
 =?utf-8?B?dFVDOGR6V2h1VVRBMFJRYWk1bCtqczZlVGp1c2JxcGwrMmxlc3ZYMjV2SFNO?=
 =?utf-8?Q?DNsa6Xo6XpG0HY/1QVm9kP1yJ4PFHqFdspvkCo+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzNGSkQvQ3BYVHpPai9jczMzNWg4WkpZYjQyd2F5SUl0cytZVitJOUhwbGZz?=
 =?utf-8?B?OXg3NGdhUFBjVTBObmdNQkcvS0dkb2ZRTjFHTnF5YVJodFl2UzZ0ajVVQUpk?=
 =?utf-8?B?WTMySXNFUFpRN3NlenkybURuU1N1eklkbFlqWHdlcjdJSVJSNGJqSVNVZlBP?=
 =?utf-8?B?TWpYekdpQTluNVl6T2QxUFhIY1ZWT1MyZFNSc3VZaVRzc0dUbk5lYnE5Tmxo?=
 =?utf-8?B?dTVydGRBSVdSK1BrRnQwRHIrMm9oUVZqZTVJd01hVzkrM2lVek9vcWdQZG84?=
 =?utf-8?B?M3krV1haUDJkMmEyQXJVd0RnSkQ4bm9YdkUwSUJuaHNPMDlrUXA1SzZtbmpS?=
 =?utf-8?B?MkJDL3NoOFNWSzdHckR3UjBsSmxXckNOZm9CNFBOOU1MQUtTV0JSNGxOak5T?=
 =?utf-8?B?djliWEpKRzVPNXluWnVIekV4YldwTHB3ckdyb3dmL3REWi95dUZhODdVVmhB?=
 =?utf-8?B?MGxZais5TXNUZEdVQ2Y1TVN0TForOEwzVHVVVWRtME1mNkFEcHdUKzI3OTZS?=
 =?utf-8?B?VmRMQ3pZeWExUnE3TUFCRmQvWWNsb0VrdGcwcU9MWVJuNkpDeXZVU0s0Sjhh?=
 =?utf-8?B?SEpDVS83T2ovQm5CQndqd0JsK3RtKzZ0THNBdmNYQWUvUXZ1eU0zYTA4SUJF?=
 =?utf-8?B?aitKREgvQ1Q0SzY3NWg5OC9uZ0RURm9vU0tVN0F4VGZ1M0JSUWI4enk5WlZF?=
 =?utf-8?B?VW5Vc2c2eXM0ZXJMRWkxWTFuTGFsYWNJU1NTSlBEdzNWVkllS25xR3lMKzdO?=
 =?utf-8?B?WTdmYzRGSytJMW5YM3JXVW1jbEVZZmR0QjdOdVFHVldhY3l5bkhpQ0pMSmR3?=
 =?utf-8?B?YmtwcUNMd3NiWm9jWUJjeXo2d1FMTTNFdlB5NE5SZFkzRUF5NGZwd2tJQ25S?=
 =?utf-8?B?UFhMMmhCQ29tYmtIczR3R1pXQVA3SWIrMmNFL2dZanZ6ZC9WT2JjSEU3bnRy?=
 =?utf-8?B?ZUZVTXhPRzZBU3F3Y0o2NXhhamNsbUkzTkNUcFBOcGV4dDliejF4SFVyNDlZ?=
 =?utf-8?B?SkNmVzAwNlB1dTJMTlF3UmJlTVZnSmpzdkxheDF5aUlzWmFscVFndzR1Z1ZG?=
 =?utf-8?B?ZmtXUFk1NXBpQ3hNeE5kQzRzT1dOUVQ4bkNqNHlSdStLeWdtNWFDcmovNmI2?=
 =?utf-8?B?Nlk0TUZnQzZGNHBHbHdQbFBVRkI0eG5LeElYbm9PU2h1bFZkNG9JbkhIZmNX?=
 =?utf-8?B?empleVQvckN3a0IzUDVoUGVEVjFUOXpXNytlMmhsdXR4c0NOb3MycWtWRXRt?=
 =?utf-8?B?WGJTOENLaVRmVFFvaTVaWnF2aWlEeEJpM0FaaXI4V0c5ZVpFQTRjWjAyb0Na?=
 =?utf-8?B?cUE2TCsxUGIxcThQVWlGMHFjRVVVTERldS9oWVpvRDEwNXZwL1djd2cvQ09s?=
 =?utf-8?B?RENLMkVDNDF5WWNiQjFPUmlPVDZScWdRVDA2RWxVTjFZVWsraFNBdFZ6aU81?=
 =?utf-8?B?OXJGWGpIWnQ1bElGTTF6ck82bVo0U2xoVGlxeERzbTV2N1RrdThrSjZkYW5U?=
 =?utf-8?B?cEh6SXRDMlQrbEx5WFB6bUhycEhOL1V2czlFVTluVlRLcW4xT3ljV3d1clBZ?=
 =?utf-8?B?RGdQZVY3NEY5WkRkVHE2WmpRaHNVSDdOYmRPRVZFVUxXZnBwRHAzTUo1ekxt?=
 =?utf-8?B?NStwWGx4VG9zdVlQVUVnTW1CQmVmeGY4SVRrTnVUSXZKbHN2NGVRbHFRS09I?=
 =?utf-8?B?NEtydkdmS2J0WkJPblhlYmN1Tm44cDRXWEJvSlFCUlNZaTdzSjBNNExmTW9I?=
 =?utf-8?B?ZkV4NTNVbkZ4TUcxSVNGbFkzZmxsNTUxd2gyb3NYbFdScnpRVlhMTzUreDR5?=
 =?utf-8?B?QStad0k4R1B2T2xac2hQZDIxR01yNkxIcWdiQWtLM3EzcGkrK0ZISjkxT3ZB?=
 =?utf-8?B?aFNuYThncUtUUFVDUURUUDlvalhFbmwycDhMTWtHc21WVjUrTXBrc285TlNN?=
 =?utf-8?B?Y2hBUUhXOHRqWW5OL3hzd2tOWDVsS1dUWGVoMGtrazFNWmJBTHB0M2pmd3kx?=
 =?utf-8?B?dGxrV2NTZ2w1anUzeUgzWmhkZWFEMXM4N0J3NU82RGVEK28wcnJrampZUEwr?=
 =?utf-8?B?THFQUDNjbkxtV3BQWk41V1V1Y09kNkZSVFZ6eDl1RzdOVWpRVlRvSlBEcGZw?=
 =?utf-8?Q?ftKTAbgUT6vFeqVgfioF1NV+N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ce1e6a-19bd-4c27-b9f6-08dcf36fe035
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:35:00.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvME2Dqn8CCgZul8PFLZeHyKIb5umiMHoT/VW0DbdfgsDGmzEzoFeBS7yXoDqM6gcZTfyVENBzXHu4P8r6RR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397

On 10/23/2024 09:29, Shyam Sundar S K wrote:
> 
> 
> On 10/23/2024 19:41, Mario Limonciello wrote:
>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>> The PMF driver will allocate shared buffer memory using the
>>> tee_shm_alloc_kernel_buf(). This allocated memory is located in the
>>> secure world and is used for communication with the PMF-TA.
>>>
>>> The latest PMF-TA version introduces new structures with OEM debug
>>> information and additional policy input conditions for evaluating the
>>> policy binary. Consequently, the shared memory size must be
>>> increased to
>>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>>
>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>
>> How does this present to a user?  From what you describe it seems to
>> me like this means a new TA will fail on older kernel in some way.
> 
> Newer TA will not fail on older systems. This change is just about the
> increase in TA reserved memory that is presented as "shared memory",
> as TA needs the additional memory for its own debug data structures.

Thx for comments. But so if you use new TA with older kernel driver, 
what will happen?  Can TA do a buffer overrun because the presented 
shared memory was too small?

> 
>  From user standpoint, always be on latest FW, irrespective of the
> platform. At this point in time, I don't see a need for FW versioning
> name (in the future, if there is a need for having a limited support
> to older platforms, we can carve out a logic to do versioning stuff).

I wish we could enforce this, but In the Linux world there is an 
expectation that these two trains don't need to arrive at station at the 
same time.

> 
>> Some ideas:
>>
>> 1) Should there be header version check on the TA and dynamically
>> allocate the structure size based on the version of the F/W?
>>
> 
> This can be done, when the TA versioning upgrade happens, like from
> 1.3 to 1.4, apart from that there is no header stuff association.
> 
>> 2) Or is there a command to the TA that can query the expected output
>> size?
>>
> 
> No, this is just the initial shared memory that the driver allocates
> to pass the inputs and the commands to TA.
> 
>> 3) Or should the new TA filename be versioned, and the driver has a
>> fallback policy?
>>
>> Whatever the outcome is; I think it's best that if possible this
>> change goes back to stable to try to minimize regressions to users as
>> distros update linux-firmware.  For example Fedora updates this
>> monthly, but also tracks stable kernels.
>>
> 
> Advisory to distros should be to pick the latest PMF TA (note that, I
> have not still submitted to new TA FW).

Yeah we can advise distros to pick it up when upstreamed as long as 
there isn't tight dependency on this patch being present.

> 
> Thanks,
> Shyam
> 
>>> ---
>>>    drivers/platform/x86/amd/pmf/pmf.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>> index a79808fda1d8..18f12aad46a9 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -106,7 +106,7 @@ struct cookie_header {
>>>    #define PMF_TA_IF_VERSION_MAJOR                1
>>>    #define TA_PMF_ACTION_MAX                    32
>>>    #define TA_PMF_UNDO_MAX                        8
>>> -#define TA_OUTPUT_RESERVED_MEM                906
>>> +#define TA_OUTPUT_RESERVED_MEM                922
>>>    #define MAX_OPERATION_PARAMS                    4
>>>      #define PMF_IF_V1        1
>>

