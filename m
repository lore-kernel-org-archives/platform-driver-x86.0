Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F276C61
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 05:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730783102; cv=fail; b=mRnExmxJb9PGaWFRPCbMP66P6pLnx9Brb0HOf/YK9/m/HQBeXAiCL+71dL7AuwKH8RvfOK9yLJGjzpT3bF5jklXECv9hVvZzC6/qToqel+8n4QSLiPd/ACln9pmsNEmfqDFm0iwJShgDAHn5PS1ayBqDnSstbwvZRcev70Ih4XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730783102; c=relaxed/simple;
	bh=lAKsbnN2EpW4YNZotvvmoYC83E1XrkrjnSEuK5YBZsc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l72QUhBEztCLXuHir7uZyFDhA74BKZBb2jTEbJ80knqMGA2/NPy2HMLTxZdQsTr8+DC4kMAvGRI/2p3o2TMu7fbkCbvjUqfbuNtxT0J27ibctI+zj8k7ohXG4IaVCmyI8fgeO3sKe2RNf5zpPnNrda3RLEsXbbZDtrrpwW2jDGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WVCw003c; arc=fail smtp.client-ip=40.107.237.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WVCw003c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBUygt3wxajl8NbOpg9GOnbiDs69vHbid9ew9b96s754+rqWc1xMLQV885TuGEJdIP1IhZWdQWvz5ecQRAUQynQ12dvvbnRQj/VvAYVOA3gnUkalv9XTNDyEZ7XJcUxDFhmeDNZgu1rY3V7hSUrziM/AArrTg0OkaiUj6jF3jDQ37glI4aThRBs1gMrn/OAVUCOj7hFxJ2QoOXKT7AOiuDAr3jYtZcyqbSa+LUJUYHCGEbik6PXbriJVy0fytJ1I/6SnqTh0ohu6ip95CRoCEKGrmgFKTx8pI7XBnRRWPG4XymRYtnUA4xqCznCTJ3TOYkgX9tHn2xirZozuX8UAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc51vvGw8uggjUCAUJ2Dh1ixZYekMeN7AeQsR5Pm6MQ=;
 b=Go2ZP23DUr9YjilSv7G2sHyllK32R9/MMSyG04YB2Kp86ekm7m0gfa68NLktf0h+yHNTg91b48sunyufKsdtqKFV5yJuczuyXY0ttEABf1c3mhK1VfT4SzxkSS+WXHkQZ5hNGpOOicgvsqDsj5BEcXRfSU3rjFu/0iG96RdsROaXdzy6x4asRdXddOk1c8/ITkXlSPxRKkDSmQRHAH2O2yJWSBuaqzmexWyOrvtDx4y6CnQ8ot1ywkFpj7rJCiKm8bG7mN0jAqZnfBVJWJnmxJCOtZmMPwWYz6VZ8RZ/M+jaGEZB8UXpLUwaBwesejsaI0LWvdjVptw7yVdvIHs0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc51vvGw8uggjUCAUJ2Dh1ixZYekMeN7AeQsR5Pm6MQ=;
 b=WVCw003cQk5QI5sXTZUC//Jn3nTwiWDrzWGkM87Ickhfa5Jp4GNRwybT8mO+4nIRBJ/eo7H/S3Tcuq0Ct3RtZ8OCFgcnQ5zCqmyC/bwYLFD3Qc3BInu8ipdhLLmH6oEEx1hM43eAECQse6LgmoJaHyHFsfmggtCnbLguWbM2QKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Tue, 5 Nov
 2024 05:04:57 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 05:04:57 +0000
Message-ID: <051c7469-3b9d-4bb0-8370-1dfc489d16c3@amd.com>
Date: Tue, 5 Nov 2024 10:34:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] platform/x86/amd/pmc: Define enum for S2D/PMC
 msg_port
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
 <20241029155440.3499273-4-Shyam-sundar.S-k@amd.com>
 <1bf70e8a-5e28-57f3-1cba-41adf83f5a3b@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <1bf70e8a-5e28-57f3-1cba-41adf83f5a3b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 08662e20-5cc6-4dd7-2340-08dcfd576448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWVDNkQ1clhoMFVLVS9SMDFGS3lCL0FOZ1BrT2JJTjdRRkhVOEI4VTNDZFl5?=
 =?utf-8?B?dHZyYlNRYnVXWEFtTWVaa0ZiT0RnTTNKd29oQ3hmQ1lJTEdyNHI4N0FZR0NF?=
 =?utf-8?B?Z054a3VmenFXV21rbVN4bnJJWVFZdHlnc3kyVXJiUkF4OW9SUWxPeXZmOEhG?=
 =?utf-8?B?dmtXTUlrNTNTSUhmSU1hVm5EWWtaNG41OUdoRHpRUDhYeFFDT2xTbVV2YmlT?=
 =?utf-8?B?SU1CMjVTUHMrcjZ5NnkxblBqdUFXUlI3ckRvQ2VqMG5qNndidVpocitZS3pm?=
 =?utf-8?B?QmxISW04SW9kR3RSNE1NYmVrSitIM1dhcDVOdDArMTJTWXB0SDlxUjdMZnpT?=
 =?utf-8?B?dExxbG8yOUJ6a2YyN21QSVZIbzdwOTA0L0xNMW5KZUpYYnpKR0VLWlJaNXN0?=
 =?utf-8?B?K0ZDS1FGanBOck9zZi8yelMxV2NybGYvNnNGSlRaSDV3VWJ4ZWJsSDUrNGZl?=
 =?utf-8?B?RWpzT3R0M0dYUURhWWxSSXRwenZPclpPK0NGdmpXYzB0RUlVdWZqSWhqbHpq?=
 =?utf-8?B?S1FwRk9iVGlzK2hhSldPVTAvYit4Nnh0ZHoxL0pnemVTT2lMaGlESDErays3?=
 =?utf-8?B?WldFKy9JaVIySEd6d0tNMDVuaG9Ca0dPSStDbCtWSHNHRUs4anpkV2lpVk9k?=
 =?utf-8?B?VnNyODNYK1hrUkcrWVhFU1FpVkQrdkdLQWtNeUd2czgwUEpoVjhNKzNrVW9W?=
 =?utf-8?B?U3FEZnpmMWhCNEtkempZMzhZc2lLODZlRXJCdHMzTDdwVzNiZzVUeXNtVEJB?=
 =?utf-8?B?NEErT2NEekk2eUVvbUhhQVNhZUhNTnFYem1tL2pPMnk5Nk9PNUJOUXZ2QXN0?=
 =?utf-8?B?RWFrbHpwMk82NGZzUlYxZGZ4LzlaV0FLVm9oNTluSlpQcVZRVzlCV2ZKNGJJ?=
 =?utf-8?B?SUs0ZExVQ1ozcHZNZWxXdmZIcHRFdmlId0JVK0JOTG5zM2F6WHk1N3hHdW50?=
 =?utf-8?B?K2Y3VXV0dnR0b3UzWjR5dllKU2NuNlhjZE5LUDZzT0laT2d5cUtYSGRQdEc0?=
 =?utf-8?B?Mis2cGpKazZYZVhPMEc5RXpSRTlpb0FsWTJBcnlIWjk0eGpRMS9GUU9jdnZ5?=
 =?utf-8?B?czAyYkdyYUM2OVZWYVZJVVBTQzM3RUI4aGxCeW5ZdklUNWEwT1N5b2gvTXJm?=
 =?utf-8?B?aFZPK1U2TnN2TTlnMG1GcjZzTVJsUk55Qkc0OG9QVGNwT0k5Tm1kRW9oamtt?=
 =?utf-8?B?SUJBMUNWaWpoSExZK2QzZVplZTl4SVNrSGR3anlRRmVVUEN4dERRTVByY1Rq?=
 =?utf-8?B?Q2UxdFJ1aW9SM3Z6Nkl1WmlkZmtTWlZLdjlwbGFWZWNkT2FVYlJmdnNJMzhF?=
 =?utf-8?B?YzVHWldCai91SUE5MEtUQm1mUEtCOC9xMk1pdkZrM3Uxb1krT1cwNHR2L2Z5?=
 =?utf-8?B?UjNGOGVyRkpTTS9BNnp2dERKdDAvTS9mN1JIQnA0SFJQeWpWb29RZkphZ1hD?=
 =?utf-8?B?TTJDMGQ0THdPN1dTMkZyQ2dtQzNuMm1ZczZTRVRFR3d6ejk2RWh1dVZvQUJF?=
 =?utf-8?B?c1dSU1o4M0lhWi92VlpXbDZ2akxKVVFXc2xUSTJvdkVJeDZ4dWEyYUl3N0VD?=
 =?utf-8?B?cTBvV1UzSENHL2hQTVJpQnRzeU1pZERRNjBDZ3k2OFZUakNKdEtZZXR3MkI5?=
 =?utf-8?B?bHl0dlkvWlN0Y1ZhcXR1MzRJMTNlQTdlNDJHSmU5TlFoMmZVNG8rV2Q4L0pn?=
 =?utf-8?B?MlNSOTdRdXA2T2ZYMU5MNjlCNER1OEdMME9KQkJmWXR6Vm4yUzF0RVd3VmZW?=
 =?utf-8?Q?3hssgCAUt8xvuHn5T7BYvyTdB9Pql8zE4mkT+Wf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFpXVGpENytHQlY5SUovK0hnNEhuMUhkNTduK0U2WnRqeTlhVXhzdGFpM0pE?=
 =?utf-8?B?L2JGM0dCYVpKTUx5SG5wNzErd0FOaXduY3F4OU9mclZ4T3JhR0ZwdlIyNzV6?=
 =?utf-8?B?VHpzQldXQ2xDeDMvMWFLQWk5eFFaY3FpdE5FMENjUlhUQmNvT0FUMWhuNjJj?=
 =?utf-8?B?UURvSStlRi9yM2RwM1M4QTR2OFRqY3Rhbkc2b3djSEZ2TDFHbytCSEVTWU5R?=
 =?utf-8?B?ZUlCNW5yd1AwSUhncXAySllFZWN1SW9RbFZPa3VlWUt6dHEreUlCcEZXNVhV?=
 =?utf-8?B?dnBxMDRJOVJVV2JSallLbzRGTWFvbVlyenRvQmlqQklrTzFoR3FuYU9MSktM?=
 =?utf-8?B?TzZ1MTZpYXNwRXlRc2pvOGw3YWcrQ0RsdUpoUXY4cDVPb1RJbVgrS2dYU21n?=
 =?utf-8?B?RWRBT0UwaWQwYnJjTnhBdmlKZWQwaWpoYUs2Qmp3bWpyWkxoeDRVbVlMZ0pm?=
 =?utf-8?B?YldNYUQvekZBNVJhcTFQc1dwQmluUUxoT2hGRUd2UDBHR2hUakRVM3JKVU0r?=
 =?utf-8?B?L0FqVU1EanUyUjNCQWVJZ09hWlhva0xPUFlyT2VodDhvVzNraWZkRC9HZTVz?=
 =?utf-8?B?aVdKTjdpK3RRRXhvbmxITGpHdGxjSWtVY2NnRE52Nk1FSERLSU9SQU50UTFE?=
 =?utf-8?B?YzlrbmQ4bXBIakxqVnFxeU1lVjR3d25tdm9maG1zaVVuMTc3NDYxdW5zZlp1?=
 =?utf-8?B?Lzh3QUQ0NWRoUDNDclBYcUEwdVpqS1FWNWNoYkwyeDZTQU9kM1JReGt0bVJL?=
 =?utf-8?B?bGhWOWlyUGs2Rm1yd3FydWxUeHk4ZGVpMVpHUGtXUC94OC9GcGxjNEh3cDVU?=
 =?utf-8?B?RGxPbWlWODBHZjd6ME9xaitySzFyYmljd2p1N3gyS0hjTjAxNDlkMFdxcGZ3?=
 =?utf-8?B?RlhQREJIaVBzVmEzL3hqMVY0bThucUl2NHA5WTJrMVBlSmlJQjd6c0ZZemNN?=
 =?utf-8?B?MW5Ub2ordlZKdGpHUFVvM0o1L0VudnJKL3h3WCszcHphZjVrY1pvNG5GVE1o?=
 =?utf-8?B?Y2luVDJpbE9CcnE3U0U1aTNPdW5GQUE1VktPQmNnYVpVM2xQOWd4K1NxZmor?=
 =?utf-8?B?V0M3dzhmS2YrSzVWdmVjRnJ6ZmdSVkMrZStzYm9DY01jeWhlNWN0QVJUZTZu?=
 =?utf-8?B?ZURoNkZhVFI2ak43QWxUSXFMbTFXVDJlaFJzTzFEeTYzQ1hmWGQzSzY5eDVL?=
 =?utf-8?B?YTlvUU1lRW52SGk2RFlFb0xzMndEUWdMVjNobW90eUtZNjZKbk1SeHVNVDFP?=
 =?utf-8?B?R1d4RVpHa2w1Y3Z2S3NLdVZoTmNsUjVOSHZvdzJNajlVd2Y2ZTI5UTZQNTZ6?=
 =?utf-8?B?TkE0aFpwajhTY0p2WG9aODI2NTBuUzNiU0hoN1VvbjJxNW1hZ1FTeWI4SWMw?=
 =?utf-8?B?RjIyMjY5cUhKNmlUbWc1L2NSeHlNK09zOEF1WHdvSFVydjN5aFFjNy9yR0Fp?=
 =?utf-8?B?dkpNOWVpK3ZhQ0R0bEVzTm5WZkFlYnVkTFlXZ0hlZDYxUGJUcFVFTzI4OVJm?=
 =?utf-8?B?TGFiUzViOS91QU9wRitmdytCdXNwb1NxQmVwUUVwSjhhSkZSaTVRRk9VSWVa?=
 =?utf-8?B?ZWkyQm1TYS8ybWhCaG9lUnZ5N3hPNWJmV2NaNTRPdkp2Mko4R1pJQVppbmZO?=
 =?utf-8?B?ZG5hN2c2bkkwWHE3T0VOTWswaDdRcUJEUVNTdk5CM3hVMjFHbmZ1QkczOWhu?=
 =?utf-8?B?TXdKSUtYOENkcTM3OHM0MG9aa2xrcEdSVjBmY0sxcndqcHgrdk1peStFR3Nj?=
 =?utf-8?B?cForb3VaTFlWZ0NLbm9mUmdidWthQ1ByNnlpUEdjSGFLcktydmlCMExScjBX?=
 =?utf-8?B?dkZaWGFGS1owUGU1c1FnNWlnSWlQaElNallmWVN0MFZsUGM0RGhvWmg0OEN4?=
 =?utf-8?B?THVrSmdGOEtzQVUwUUxNdHoraGtwUjhSMXFhdERhRitiRHppaGIvcDNGbUF0?=
 =?utf-8?B?cnFENjlDRzY2S2g2b1JiWWxvNnVtdGUrazdtbUcxUkJlNXNleVhJbzJWVkdh?=
 =?utf-8?B?Y0trWGhKcVREaXFzYkRjQXNFSFFxWWl3aGpFb0NsTERlbFFWOUl1YXNYdmhn?=
 =?utf-8?B?TWRYVU9XSmlaYTZ2anR5NUtKbVNWOWZmZC9XZ3UrbkdNcVdaNmZUVmNsUkdr?=
 =?utf-8?Q?8/ZFQTfeDLqhwJJ0Uvu4OIZzh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08662e20-5cc6-4dd7-2340-08dcfd576448
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 05:04:56.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4C+iN5MJQQUr86MhXS9mC8DhuVrYmREqOJ9samYC9cazX1atXZEN2fR5Si4st/QVIwdDyO3oA3pgVRILOzIYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198



On 11/1/2024 15:58, Ilpo Järvinen wrote:
> On Tue, 29 Oct 2024, Shyam Sundar S K wrote:
> 
>> To distinguish between the PMC message port and the S2D (Spill to DRAM)
>> message port, replace the use of 0 and 1 with an enum.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/mp1_stb.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
>> index 5efec020ecac..2b06861c479b 100644
>> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
>> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
>> @@ -47,6 +47,11 @@ enum s2d_arg {
>>  	S2D_DRAM_SIZE,
>>  };
>>  
>> +enum s2d_msg_port {
>> +	MSG_PORT_PMC,
>> +	MSG_PORT_S2D,
>> +};
>> +
>>  struct amd_stb_v2_data {
>>  	size_t size;
>>  	u8 data[] __counted_by(size);
>> @@ -156,7 +161,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>  
>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>> -	dev->msg_port = 1;
>> +	dev->msg_port = MSG_PORT_S2D;
>>  
>>  	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>>  	if (ret)
>> @@ -173,7 +178,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	/* Get the num_samples to calculate the last push location */
>>  	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>>  	/* Clear msg_port for other SMU operation */
>> -	dev->msg_port = 0;
>> +	dev->msg_port = MSG_PORT_PMC;
>>  	if (ret) {
>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>>  		return ret;
>> @@ -266,7 +271,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>>  				    &amd_stb_debugfs_fops);
>>  
>>  	/* Spill to DRAM feature uses separate SMU message port */
>> -	dev->msg_port = 1;
>> +	dev->msg_port = MSG_PORT_S2D;
>>  
>>  	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>>  	if (size != S2D_TELEMETRY_BYTES_MAX)
>> @@ -284,7 +289,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>>  
>>  	/* Clear msg_port for other SMU operation */
>> -	dev->msg_port = 0;
>> +	dev->msg_port = MSG_PORT_PMC;
>>  
>>  	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>>  	if (!dev->stb_virt_addr)
> 
> This change is incomplete, you missed all places using it:
> 
> if (dev->msg_port) { 
> 
> + add helper for this:
> 
> dev->msg_port ? "S2D" : "PMC"
> 


I am not sure if I understand your comment fully. Can you please
elaborate?

Thanks,
Shyam
