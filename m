Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1F1392
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739862121; cv=fail; b=ZvIKimQVZbFwwk9Ih6M8YBANY3a62e5rR5fRIW5aUXRupYvrWPPBscCvtIyQAzBAM/pPXn08IZZY+gbc17VPkUHRAGa2scW2RRmgkOLzWcReUNXQT7PNlJZChIzKEtIy6lU9DzbAe5SjJK8e+8kU9OJz/k9NgpcNoZ139UGvbwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739862121; c=relaxed/simple;
	bh=OSAXG1piATshjeVCbwNzY4XMG/q89r/LoreeIf2YDpk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JPGry0CD+q59EcQhSW6IWzfmerd7KrFQZLAUlaQQIKEOp5JIcm+4L5VpLdNEthJ3sMLFj3InHjw8dUljfEX7fAnfKA62fVUTDaUjuzBy+pv/Pq8q/aGQcYmbViUl+QaU7EwtpJOXC3eVj5qCUKMaWcRoT7XXXAyRbaMZqYtraCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pqQc7ZIQ; arc=fail smtp.client-ip=40.107.220.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pqQc7ZIQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8ICh8+rAWGhoRZ3Sed10xlclzzu8QaO/WrpLo1MrShLRbFcY4jV5ChnBc8FJxg8YHgHGj+3Iznb1QZYMsAloyCcHPRWG3Qk2suUVeT9M5Q4hccwf3dr+X6kpLFewLtZez0Qep1ILrggE5r3fIs3RNm4JkNuUQCZchZqG7ZGJOfK+6aeoEryUIqvBdiLh4iOaqZb6TwnJnaYjMvx91Kqu9hD/RLh5efrjBucrICfY9jbyS13ixJxMtZesUrluaY7cuRiodefTBUSKMq10qTZ8fNrlvtwWydU6sSrQeZHjQaC/qXqfoHU+vJ595bA5zk0PnnfMHcxmbWDlDeK6JA4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnoFPQSxK9mF54CwfWanIH5KDQyZQSMdp14+OLGsGhU=;
 b=cy7Dg5U+Qwt/brAZbwpFxPuOflLxVcty7drljabwjoEiqlOOVG9S0Hb4VwixLDlXNErE+6FNgZGJ6P3gAhKWZ7Ms0AjoK+mzZP7FappTuqj+3fX7/Wp3LpVi6M+UYJKMTKadxrbPmfuFUQxwAPxwxQ6tDGDkryaTsfaBCZCcT7WkYDzIw/zIN5zWy+1i6dS++pXq7uW+vzSTAZ4Ab2adFBvp/7k1vOATr5qUfWJeH/5AjnN9pOShWsPxVhMcRN9pCV7uKD6AgbUi+ktqed9uNhbnd6Mnqaz7sq4wL7wVP3gWISz9C9PKsHrDqDg1zwFIJE12Doiv6GHLon62zswRkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnoFPQSxK9mF54CwfWanIH5KDQyZQSMdp14+OLGsGhU=;
 b=pqQc7ZIQNKEmkLkCzkdknexBJ8KI1/30N4z42/cHZBRFkHMBJcq0hw6H9FOYjYux0m/EJH21rda8DzjiPDDfcXiIAT2qi1dC3L8hosOpsxLjKQ8k7PsD6vilmqLW+DNnqmTMfvG7Fi2npXYNTBWH0LWeKhXNg9W5CpvMS04/Wvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7170.namprd12.prod.outlook.com (2603:10b6:930:5a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Tue, 18 Feb
 2025 07:01:57 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 07:01:57 +0000
Message-ID: <1c54a47f-c213-489b-afac-990762a7b6e4@amd.com>
Date: Tue, 18 Feb 2025 12:31:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Update PMF Driver for
 Compatibility with new PMF-TA
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250217064937.98702-1-Shyam-sundar.S-k@amd.com>
 <20250217064937.98702-2-Shyam-sundar.S-k@amd.com>
 <67955a30-ede3-4272-aee2-6c316f85c978@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <67955a30-ede3-4272-aee2-6c316f85c978@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0243.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b5192f-fc5f-437f-a1a5-08dd4fea21cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXVVRVhmc0lSVzNjRVphNndhamFhekxvZlhuSE5TS296R29VQUNLR1kvc21J?=
 =?utf-8?B?cmh6b3pFSHhyS0xOVHQxa2l1UFVBcFNqeHhNU1lMcVByKzJOSkdyeEwrNUVE?=
 =?utf-8?B?Tmo0TUVDQjM3R1dxbGdSckRMeWhDb2l2dFJZZnIxaE1NQnlqbU1jRnp5d3JR?=
 =?utf-8?B?bFk3YjVQUmVlMVJLa05pWXRHS2hDSDVmbmQzUHBNMHNNdFJuT0JIazdVNUlI?=
 =?utf-8?B?dFBOWS9DRUxLUVJTeDlHVFZpYTBVMU4yaDBnYkc1eGp3bFQ5aStFV0xsM1Nr?=
 =?utf-8?B?U3o2RkN2Um5vbk1qL283ckNDdnBFYXpMRW9mUURLc2dCQktXR2FFdm5NSXhF?=
 =?utf-8?B?S1NubG0zSXRhbVV6WHdkR1JSMlAyRmE2MkpVRTRSSDRGU09ydDM3TVZ6ejQ3?=
 =?utf-8?B?TTA1TXFmMnRpeDhHNExpenRrV2pSUjNPV21tcU9EZFpiRFpzYmJrcWRXK0o4?=
 =?utf-8?B?N1J6VVdHUWpST0ZUS3IycW1CYVN1Zi91azBCdTM2TXRxalY4Nk9oWHFyWFE3?=
 =?utf-8?B?Qjl2cmJhNFJNT3ZzeEExY2FnV3B0M3dNeDEwazVReUY4VEU4a0V5ZzRUcGh6?=
 =?utf-8?B?K2MrZUI1aFNLNzNGQ01JMGV5ckc0UHdmVklLdEtLeGlSYmdtNnk1aXl0QkFr?=
 =?utf-8?B?NmZxaFdZeG0xRzRCaVdtRWNnenZWRWh5REdBbzBUMmJuNWNVVHRPczVFUEhx?=
 =?utf-8?B?VHBiL2ZmUVVFNjFiWGdFMFVoc2RicGNsQ0tGcHZ2TllOS1l6UUxpRXBEeXhq?=
 =?utf-8?B?MUtod0hadWVXOUhGaVlhN0pmTlJDS0xTZUdwb3FnTS9meXo3NUxkRk1GRlpO?=
 =?utf-8?B?S3NVYWIyU3F0R082YlU0NkZ1aGx1UVcwcStmZXFEdGpVbEIzdVRCYkhSMmFZ?=
 =?utf-8?B?RXhhYVVkQ24vQXBIcVRwbWQxSTVJYTJXcFU3dG5FVVZuYTR3YXpKVXI2NXlQ?=
 =?utf-8?B?ODFmMHpjcWh0T2Zla0xLbk9jR3crajFvT1dhbjVDSENkMjVURFAxYnViSnBU?=
 =?utf-8?B?K3Roajg3ZkdLcnBJc1c1bEk3MnhCVktBbDQ3M0V2SjVrUUlKSjlEVm9yMHZM?=
 =?utf-8?B?Y1BWOThpL1hWRWFnaFNxck43dVJ1dWZXYUpXTW5wb3lXSnBkMDdBUm5aUmEy?=
 =?utf-8?B?cXN0S0tGeTY3TUlmK2s1MjFuWUJHZ2l5L3ZuTUFqeFF0Zmg5cjZYWXNGejRo?=
 =?utf-8?B?a2cvNXljY2hGWHdTME1ZY3NlclI0anJqc1ZmY3VkUE5hZVM4QTJ5dEVQNDgv?=
 =?utf-8?B?NmRvVFBUdXZwSktXb3lYM201S2FBY2oxZTdGUDJranFjenprWitobEFxaXZX?=
 =?utf-8?B?dUVma1FMazBFSHNXYXp3cEhzTW1FOWx0aVpUU3FaQS9yWEZvWFhCSXptbXFH?=
 =?utf-8?B?VVhyNWR3cGU0cGZadlNHQWFSNlp1Y1YxeFFVYkpnc21kTTR6QS9Xc3FvQ09J?=
 =?utf-8?B?NkVCMnlycUhWbFpqbkl0WUNDcWRJdnhRRFVBL29FSzdlS213VHZYcktFR0JD?=
 =?utf-8?B?Qnh1SisxOVE0MGt2UzZ0SFB2RHhTNEE1SHZ5bVpkRzJ5anRtcm1TOXN5a0E4?=
 =?utf-8?B?NXdqQjhvcWFqOUlsVHJhUUYvZlZ0UEhiK0p6dUtSUS9KZ2FFcWhmMlN5Q1pB?=
 =?utf-8?B?bWtXR3E0MzlEWG1OeHZWcm9yTTMyNnZLWlEwUlduTXpmZGNmNlA3Z29rUFBM?=
 =?utf-8?B?cWZkU3VvWm9RWk80YkVRSFBJZWRwMHB2RWFub2x0alEvZDlhUUpiRlcrVnMr?=
 =?utf-8?B?bzVKUk14SXF4S09tb09VcmU2eWVHUm5tQnVHOG0vVC9aMGRoenU0Q2g4MEJv?=
 =?utf-8?B?SmVuVEdGWWdldjh1VGRIZDNsMGdmNHpjRWtabFVCUGV1SlJ3UCtGd0Q3dlVV?=
 =?utf-8?Q?/sC6tmUlmv3qG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkphTVNrcWx6NVh1cjNGejdVczYxSFN2N3o1WkF4Nkk2SFo5K0xlZGRnYzR6?=
 =?utf-8?B?amp6a3VKVFRsWVBteHkxUEIvaUhYOE5QVCtFOGZGWGg5UGFKazBVellOSms1?=
 =?utf-8?B?cEpZdk1yR3NST0NPdDB6d1dVMkQ4VTdjTVphL1RhY0dnSFV5K1FhVEVXWlA2?=
 =?utf-8?B?Nm04UVpVQm8vTGlzdVNFZVBuTVlsa0kwYzJNUVJtdHNIQ0Y0NkxocWVOa3pP?=
 =?utf-8?B?R2pNb1ZiM3YxYjNBWHd6blM4bjJIeStaVzBZRUJLSHZPSGpUSWMvOXEvTDVC?=
 =?utf-8?B?TkF4M1ZsZHF3L2V3cmJ6NFNwZnZiWGV3cXRTc3pKM3k3OFh0alVQdGtRZjNB?=
 =?utf-8?B?eStsUlY4WmlyeEZTRDZHUVlkMHY1US9vZS9VRHh3cmREaFViNlAvVUJGWTgy?=
 =?utf-8?B?RlpxdXFMeWhGK282ZmMwRUFzeTRyN2EyVTBJVkc4amtNV3UwUjdjSWpRcStB?=
 =?utf-8?B?YVI1bGZwNDlGWmNCaE1ScXpKc2hQMTFVTTZyRjBsNTJ1dW8wUExFUHU5Q0l4?=
 =?utf-8?B?Qk1LRW1BbDZ5dlhLOWRKNjd4bk1NbDRhUHFuYmZpVm1KT2paTWp0ckY5L3k1?=
 =?utf-8?B?QndZSDYxcXhHeHoxMEdWNld3WTUyZ29kanQ4SEVTaXFTbnlxOVFWRFh2NW1Z?=
 =?utf-8?B?cXZ1MVJrSnVDMVFXT3RFQzMwSVlVWG80c2xrV1UxVXF1K0Z5aDBQY2lrTm1G?=
 =?utf-8?B?R1VEUHNkWHladDFvTy9IbU5CN2g5L0FkNDI4RmJuNXN5NFoxMnVjMTJmdmVp?=
 =?utf-8?B?YVBHR1cvREE3c3BLZFkyYXB0dWZFUnEvSjZvWXRxSmNGOUZIanFka2lzYU5y?=
 =?utf-8?B?RDVwaDhicDV3RVJOSkkwOGhhNFVKOUp5NWIvTythc3ZPQTJIRFhFMi9ROU5T?=
 =?utf-8?B?Z2VkNEZmYjJBWkdEOUFvTTBVSHNiMHdTR1pyd2NoRkd1eHVpYnZVMVNxcU5j?=
 =?utf-8?B?Ukl2TjIrME9UVjNYQ04rWWxJL2FZZmNnQ1Y1L0pMMEFrdHgvMVBPM1U4ODZH?=
 =?utf-8?B?MFVvcnpJWUtGWEY0VXdRa20vTUtIQkxNS1ExVHEvZVMrMFJ1cFdjc1VSdEgw?=
 =?utf-8?B?RDhwMHJLYVhoQTd3R2ROT3kweUp1dWNRTGNtczViMmhYdUFPeEc0TTFzMkFD?=
 =?utf-8?B?Um9ZajJpT00vN0ZZaFdKb1BWd2IrZFUwcWFyRlpqNGgwUlJWZWdrWGV0cG50?=
 =?utf-8?B?eFh5dVRuVUVaVVFSeGw2TFNCYXMrQ1hPcXhETVVlSnA0ZXJFNW0zTHdKME1K?=
 =?utf-8?B?alNjeVAyaUdCVjBsbENTTnZWandjNTgzMzF4WnZ6MXBQdHpnbHRjb1ZzYU1v?=
 =?utf-8?B?ZHJhallCRm5LK0dma2UwTFVjRncwZ0pEOVJyMVlIVlBEeTZtMFd0QWMxbnBM?=
 =?utf-8?B?angrRkZvUWlCd1hheWs3WXN2c0R1cHJraElWMklXVEs3dTZ3OWVLRlBiTVR4?=
 =?utf-8?B?d0hlY3p3U1Q4dEFQYWo5MU9MazdPdU5GcW42aGw0M1QveHFuSXdpaVU0SGFk?=
 =?utf-8?B?U2l6U2h5RCttWWpkSENYMHhLaE1lMnFnSnBOQ2lORU5sNWNEa1Y4MjFTNVZz?=
 =?utf-8?B?SmdmWGFoYUFsa3NsSERQYVVIenZiVHcybFMyKzF2cXFXSldTdXRtdGwxdkFa?=
 =?utf-8?B?akdBOFFHSHV6dm90dHkvWjBQcEo1NWFibmNKdmlTa2dzdXhVaGRvN2RlWjBq?=
 =?utf-8?B?U2lGbVFVcTk5YkNQOXhyYmFzSjRHV1lyS3FiWHBpUDErYWZMeG9aYy94WGhV?=
 =?utf-8?B?dFR4dFRjbmNQUGZ0VWRMLzZKR29MWFBIR2JnWll1Szk5MVV2WHVHWGtkVnpo?=
 =?utf-8?B?cktYdkMyTFA3dHppT0hjUTlIZWlCSHF5bm9yVXh3ZURRM2k1UDF4WStEQUZp?=
 =?utf-8?B?M0RuMFBkaVM4dGZrcTk0Szh0NHpvNTR0N1d2SVlmL05RODBUeVJVQzF5cE14?=
 =?utf-8?B?Z2p1TExOamYwdURYckU5bUxHVkEvYXZRYlZhSlJUSkdOdFNIT3R4cjBUQ2Mv?=
 =?utf-8?B?Z1lreElWcXdsdjlncktmU05QdVlwZVdObHh1clBkL2k2bGxrWGtnMzZOajl5?=
 =?utf-8?B?S2FKNzRPZ2VCRHJWeGZVZEJDaWM4dnVwbUlZNmZyRW5sc1JxNnBmQXJzUURI?=
 =?utf-8?Q?icqFw9OSKIn5HCTY+ITPNaM/4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b5192f-fc5f-437f-a1a5-08dd4fea21cd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 07:01:56.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8K15pqKDT27WHO4WkjhQHQlnYaQsr08eorHS+EjnWPwVPLyMnD2XM/vR3yPT9dhc+UyT537kXIETPjLFMxqwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7170



On 2/17/2025 23:00, Mario Limonciello wrote:
> On 2/17/2025 00:49, Shyam Sundar S K wrote:
>> The PMF driver allocates a shared memory buffer using
>> tee_shm_alloc_kernel_buf() for communication with the PMF-TA.
>>
>> The latest PMF-TA version introduces new structures with OEM debug
>> information and additional policy input conditions for evaluating the
>> policy binary. Consequently, the shared memory size must be
>> increased to
>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>
>> To do so, Introduce the new PMF-TA UUID and update the PMF shared
>> memory
> 
> Small nit that this should be s/Introduce/introduce/.  I wouldn't
> change it if nothing else is raised.
> 

Ack.

>> configuration to ensure compatibility with the latest PMF-TA version.
>> Additionally, export the TA UUID.
>>
>> These updates will result in modifications to the prototypes of
>> amd_pmf_tee_init() and amd_pmf_ta_open_session().
>>
>> Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-
>> d211c7963e7e@linux.intel.com/
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
>> ---
>>   drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
>>   drivers/platform/x86/amd/pmf/tee-if.c | 49 ++++++++++++++++++
>> +--------
>>   2 files changed, 38 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>> x86/amd/pmf/pmf.h
>> index 41b2b91b8fdc..e6bdee68ccf3 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -106,9 +106,12 @@ struct cookie_header {
>>   #define PMF_TA_IF_VERSION_MAJOR                1
>>   #define TA_PMF_ACTION_MAX                    32
>>   #define TA_PMF_UNDO_MAX                        8
>> -#define TA_OUTPUT_RESERVED_MEM                906
>> +#define TA_OUTPUT_RESERVED_MEM                922
>>   #define MAX_OPERATION_PARAMS                    4
>>   +#define TA_ERROR_CRYPTO_INVALID_PARAM                0x20002
>> +#define TA_ERROR_CRYPTO_BIN_TOO_LARGE                0x2000d
>> +
>>   #define PMF_IF_V1        1
>>   #define PMF_IF_V2        2
>>   diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/
>> platform/x86/amd/pmf/tee-if.c
>> index b404764550c4..43bda6f98a11 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
>>   MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug
>> policy failures");
>>   #endif
>>   -static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77,
>> 0x3fb8, 0x524d,
>> -                        0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85,
>> 0x43);
>> +static const uuid_t amd_pmf_ta_uuid[] = { UUID_INIT(0xd9b39bf2,
>> 0x66bd, 0x4154, 0xaf, 0xb8, 0x8a,
>> +                            0xcc, 0x2b, 0x2b, 0x60, 0xd6),
>> +                      UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1,
>> 0x2d, 0xc5,
>> +                            0x29, 0xb1, 0x3d, 0x85, 0x43),
>> +                    };
>>     static const char *amd_pmf_uevent_as_str(unsigned int state)
>>   {
>> @@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct
>> amd_pmf_dev *dev)
>>            */
>>           schedule_delayed_work(&dev->pb_work,
>> msecs_to_jiffies(pb_actions_ms * 3));
>>       } else {
>> -        dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>> +        dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>>           dev->smart_pc_enabled = false;
>>           return res;
>>       }
>> @@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct
>> tee_ioctl_version_data *ver, const voi
>>       return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>   }
>>   -static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
>> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32
>> *id, int index)
>>   {
>>       struct tee_ioctl_open_session_arg sess_arg = {};
>>       int rc;
>>   -    export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
>> +    export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
>>       sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>>       sess_arg.num_params = 0;
>>   @@ -434,7 +437,7 @@ static int
>> amd_pmf_register_input_device(struct amd_pmf_dev *dev)
>>       return 0;
>>   }
>>   -static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
>>   {
>>       u32 size;
>>       int ret;
>> @@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev
>> *dev)
>>           return PTR_ERR(dev->tee_ctx);
>>       }
>>   -    ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
>> +    ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id,
>> index);
>>       if (ret) {
>>           dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
>>           ret = -EINVAL;
>> @@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct
>> amd_pmf_dev *dev)
>>     int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   {
>> -    int ret;
>> +    bool status;
>> +    int ret, i;
>>         ret = apmf_check_smart_pc(dev);
>>       if (ret) {
>> @@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>           return -ENODEV;
>>       }
>>   -    ret = amd_pmf_tee_init(dev);
>> -    if (ret)
>> -        return ret;
>> -
>>       INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>         ret = amd_pmf_set_dram_addr(dev, true);
>> @@ -534,9 +534,28 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>           goto error;
>>       }
>>   -    ret = amd_pmf_start_policy_engine(dev);
>> -    if (ret)
>> -        goto error;
>> +    for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
>> +        ret = amd_pmf_tee_init(dev, i);
>> +        if (ret)
>> +            return ret;
>> +
>> +        ret = amd_pmf_start_policy_engine(dev);
>> +        switch (ret) {
>> +        case TA_PMF_TYPE_SUCCESS:
>> +            status = true;
>> +            break;
>> +        case TA_ERROR_CRYPTO_INVALID_PARAM:
>> +        case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
>> +            amd_pmf_tee_deinit(dev);
>> +            status = false;
>> +            break;
>> +        default:
>> +            goto error;
>> +        }
>> +
>> +        if (status)
>> +            break;
>> +    }
>>   
> 
> After the loop I think you're missing one more case of
> 
> if (!status)
>     goto error;
> 
> Otherwise can't you potentially end up with both attempts returning an
> error code?
> 
> If you think it makes sense to still be able to "sideload" a PB in
> this case perhaps it would be best to change it to
> 
> if (!status && !pb_side_load)
>     goto error;
> 
>>       if (pb_side_load)
>>           amd_pmf_open_pb(dev, dev->dbgfs_dir);
> 

I thought sideload will take a different path. Let me respin a new
version based on your thoughts.

Thanks,
Shyam
