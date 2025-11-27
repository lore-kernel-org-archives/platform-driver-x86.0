Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010064.outbound.protection.outlook.com [52.101.46.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687DD304BCA
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764276073; cv=fail; b=AwymC2OX3BXK/yNYHZ3Avh8876VtlgcQHUUcrLAL+aGVMdEPOOUQx1SAWuBv3MybPxUTcwJcp6tVKgk9ROs3O1MJZnM+gfFX+7xhslxRaCy0QP/lkZpsNW9Whx9xIHVtVFhnJ4GUfiKtxqxBjB+6/UN7PJBYODrmM/jF9RdEjlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764276073; c=relaxed/simple;
	bh=+M/rtqVkKQi4WlNsQPp+bY7HxipLSU6iZXjwpXSHh4o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QnuZ4JBvvb5sl7sKwooTZ49ZJT5ydH/KW2ELSc68XHjd0tloHrGnVUqtv8EGfpXjgdnFS5tllwTvR9UYhFvDI95FGV8lhcFwdhHQhPFJMKPckcMn4blPrsW2V6bubmBmAD7w4nqcV1Vo4DjZZMHZqShLKMZuY9fmc5WfFQ+DOLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4boa1T/q; arc=fail smtp.client-ip=52.101.46.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4boa1T/q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cufRIWZScKbYW5+FGng9GaIqzIvZjUFwULEclfAd4qEabP6hjJwBZFv2zRsIgzDtuao8dvbpKujZZYolznFR5R8mMBuDC5zuuxqll/Z4lzlXEY0zt9VeXflUjG1a1thdp8rebKWefuaG1TSAuqI7hFEI1+Y44HX7suqUvtb+OK0loNIGk8p6aT7RrAvvgqgfaNRmrpmkrfSqW6wyQHaNEzfJzYqhP5f2meWe8Yf6mdV5kA/fZzEK2I2hRmolWI4nVYUosXm5SjQDmjOZCIbSaGIamRM57A0800Tp7dOknh7IbbHUcj/74P07PWVG7k1ivL0nOrNTM1hYulNut5PPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMIjhOOyZfEgIDdEloh8ytXrWYOIO+KffQ6YLcj8WqE=;
 b=L6ZJQV8MraJibiPghxlnQ4UB702PjGG//MErM07h3OsKgsQehgnjR8lDIUBOIB54UKhdPLrv4gP6OvOZj1WOFoF2xEInoWCtMUkGq6O7WU+lCv48tHIQCYGHdMIPFr3I0Trf3hYYRI2vEHAjIa2ZEzk46qowmsBxNwbZyL0tPtOWb86TEeiclCMf6qCSwgh47UEL8UIb8/aNuNTjpygBlKrWsLBqddjAR51DxU1v0NkVXrDuk1EvBk6FqzLYRQqoBS2Cb59gjixcmlwKy9wi8+TEvrngaKN0GPWaLB+yTV2Q5DG1NAh5dARnAqjwjtIvizZef74jR9/XLZa5kwNLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMIjhOOyZfEgIDdEloh8ytXrWYOIO+KffQ6YLcj8WqE=;
 b=4boa1T/qQk4T+MYZ9D81yAr+ifsS/y6ncBGT4wLLn9tizxUZLQM6O7s/pgjF3z3OPwsFPHrrLlyJGDKlYMIERIoQ1OgY4XJjC2+CFErktcTsqPsUclp/htXr0OKff6kx3cuKJ2FkZEzaH62uAFZVpl12JE//BjXqQplnu/SAhyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY5PR12MB6300.namprd12.prod.outlook.com (2603:10b6:930:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 20:40:54 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 20:40:54 +0000
Message-ID: <80e375e1-0b6b-4c2e-bc5c-7137eb35a8bb@amd.com>
Date: Fri, 28 Nov 2025 02:10:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, Mario Limonciello <superm1@kernel.org>,
 Yijun Shen <Yijun.Shen@Dell.com>
References: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com>
 <20251119085813.546813-3-Shyam-sundar.S-k@amd.com>
 <9f30b9ff-5f27-68c3-9bc1-4bed9fe0bd89@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <9f30b9ff-5f27-68c3-9bc1-4bed9fe0bd89@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::22) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY5PR12MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 403ec0b9-8acf-418f-1478-08de2df542a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2xYSkFHVXFLdGJORmxPa05iRFZqMUJHOHFYaFVtT1pvMGt1a0cyWmJabE1i?=
 =?utf-8?B?OTBuc1hZaWIwMlprNHRiNVFlNkh6b0pxejhvL0NBYmZIek04eXdoTGZ5OXBo?=
 =?utf-8?B?azhWSFI5cmZ1cUNhbnRYZGs1c1hsbjZpbEN2ajdkR0NTK3Zta2syczdQRGtt?=
 =?utf-8?B?dnJ4eFlCU1BPanloaHVFU09iWmNudEhsV3RHOGtScU9FS1Q5ZDl0cU5weWlQ?=
 =?utf-8?B?bk44bDhHcFZMdVJyeTduTlFlT3Z0bFJCSzZkSDI4ZjBHais0d2toQlBiOENs?=
 =?utf-8?B?QUxPU0twckhMV0ljdlB5T2FZZEZucmgvdFk1bVBObi83OFY5RXQvNUVNUzlG?=
 =?utf-8?B?VUJLUkNaeFNpZ2ZnYmJmZDlISlkvb1pCVnIyT3NTcjFlWVFDTWpIcU9uMjI3?=
 =?utf-8?B?Y2o3L3N1dURDUUM4R3hibzJObXZiYmdBOFRYSjRqYTJqdklFR2hHUUU4SGcx?=
 =?utf-8?B?TWJQV2ZidSs4R2E2RlFuNWxSREtPQlo1aFhuMGlOOTJvTkhXQ2IwQVVMSnpO?=
 =?utf-8?B?Tk14VXk1Mm96bGp6a0ZqbGRMd2R6dXNQOGNNNXVaMkY1L0lWbWFHM29pV2hq?=
 =?utf-8?B?U1huSHQyV0RGY1hQUEU1WTRuTGRJMytOQWdtSWR3KzQwQ0xYaFF6Z2FaTEFV?=
 =?utf-8?B?aFk5M2I4eFB4bDZPeFFETHlSQzJtUW1GbzZYd2xLUlBCdmZwd1JEM0xNWlM1?=
 =?utf-8?B?a0pDcXdjOElzQ0xsWDh5K3ZLZldleStsYVdrV1RiemZLRjAyL3JVZ1QvaDcw?=
 =?utf-8?B?MVlXMFFSSXVoK25QZGlaRzZzVnVlVDFRWGhRMmtEWEwrd3pRZmE0d3RlY3Bv?=
 =?utf-8?B?MGExZ3VPKzYyL3E2QmhITGFHMk9WVDR5VW9ORmZ3eWJ6Qllhd1dSc1g2SzY2?=
 =?utf-8?B?NmFON29EM25TSTR6V0tWNFhXT21wQ2gyRmtVa0lnZTRpNlY0TTJrb3M5U29w?=
 =?utf-8?B?R3pVNko4N1hVZDB5MWxjTkFBb1Nwcm1NYXhOc0RxVUtrZVdBNWZZdUdTMzlR?=
 =?utf-8?B?VEdkemtOV0NIZVpVYS9kUXh2U2Q4akR1YzJqMXRkaVdFS0FqTG5DUlhUZG50?=
 =?utf-8?B?V2FLMXcxbVhjTWJobWNEVUZnOW5GaUp1WnVuT3FWWTlYcGdkdkRtQWNVdVpO?=
 =?utf-8?B?VElLRnlTQVIweE9JOXJzZnZNQWRBODJaWHFyTTlhb21GSE5Gb2I0MHhOVXdO?=
 =?utf-8?B?aVNSZHRIakd0UDM3VTk4NlJFQjM2dW4rbW42MnhtWHRJRnRpcnd5cE9ZZ2l5?=
 =?utf-8?B?cHJHN3p5aTJRc083bVpEcDlUQTVHaFZDSlNRZHRjR3FrZnBlYWlNQklvVWlB?=
 =?utf-8?B?SXBVS2FxZDBTQXdBVlR3cnAzcjg4aG02S3Z0UjJQZ2Q4TTRCMTErQjk5QXlI?=
 =?utf-8?B?eFJ6anZwTTZuNGVheDVieTE2NEZLMldlaWFLbFFuM0Z1WVcyL3pLVjVvSjZG?=
 =?utf-8?B?dkZ1eElUclJCRk1IWEVtdWR3MFZuRE5pK3lBZmVKNHV6U0djWlNyaEFWenNZ?=
 =?utf-8?B?OS9zZEFTYlhWcDM3L1g3eGhLVHhpTjY3ZUgvTHg0TVFNRXE3VmEwcW4yNUF6?=
 =?utf-8?B?M0pYQ05QM1BrT2x0bGM5WlFBdk9DTVMwVHZ3ak10cGxsMUVTODRUaUZ4SGVj?=
 =?utf-8?B?ZHNOdmlOZDFaMnRNcmJpZU8xV1d1Ly9WM1ZHdHFmM0hNTVZ2anJHdXB3NnM3?=
 =?utf-8?B?OVAxUkx6UXFWWWZvY0xicTlXRnRqVUpPYnpUNTBnN1AwcE5pMVdyWmw4Y1Z5?=
 =?utf-8?B?Z01PVThRYVNlV1lsRnFxMHVoeWVGNXVMNmQ0WDk0ZDhXRVRQNDM3WWl2bjli?=
 =?utf-8?B?dGFTU1o3WkpTYjhrRUVNN1IxUWd5ODc1US92VStCc0ViVGx0L1NTbXkySzhS?=
 =?utf-8?B?SUZMYkcvOWNQSWJOSDNscys2M2psaGJHbHBhemtaNWlqZHRRRER3YXcwaGFK?=
 =?utf-8?Q?CvWnkwGLinfg0MsNczHi5PpHJABAXqXh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1N2T0d5TGFPQUxGckVrQ2JCWFE4Vkducyt2UUhib3FYN3MxTU9sY1VZWlpP?=
 =?utf-8?B?cDl6eHJyUFY2UEFEMi9QQnBFamt5UG9GMWo5SjZ5NzdUQTJDT29qYllPOXBq?=
 =?utf-8?B?SHE1MUhzNXFVMW1tZEFLMUlUbUR0cXB5STAzY1c3L0pnSHBMWU1HU1dEYWh2?=
 =?utf-8?B?RWdQczIySlR3T1YrOWxjc3NxdDM4eTZJTzRCK0dEZkNNaFZoMlJrWUFmS1dj?=
 =?utf-8?B?NWhNTjBRK09UTFpuemU0eWFEUnlUNkwwOEU5UHdrUUkxN3QwRHpGMWt3OExL?=
 =?utf-8?B?aWxDRjhZVFRxTFpFVHpKOFlXcU9OUENjTWJFWm5aOFVrcnFRVEFPZDVaVHdH?=
 =?utf-8?B?Qk1veUZudkFDRzZ4MmorZHQzVXBHZ0x3NVNoWndRQnJKOTJLVEVHTGJmTFJD?=
 =?utf-8?B?MWdBbGJ3NjZ0NFNaQ3hvTDQrTlA1djllYkVQR2dTVk9reHYyQnZMMDNDK0F1?=
 =?utf-8?B?V3FZeUtVSFJWOUJnMUNFVndKY0NWRHVJd3YwUjNWRW5DZmVvUDB1VWkyWGtN?=
 =?utf-8?B?M2dhL0FYYUFtS1BHaS9xL1JnUFE1eWMvcEFPRmVjZ1R5bE8vbGsxT1NKV0tB?=
 =?utf-8?B?dzJYYnJNeUtsMys2V0YxZXNORjVobm55cDgwNWU1OFFpcE9xTGMvd05YRlV5?=
 =?utf-8?B?Uy94ODBQT254WXNQSnQ5QURYQjBsYWpWQ0NicSsySU5Ld0dtcWJjNzYyNEkr?=
 =?utf-8?B?eXlmYmlTdzZjYmlzUXR2bTFEcFprOHhkMk1UTzRXdjczSHNBQjUxUkwxVXNz?=
 =?utf-8?B?aC9pRG1WN0VvNlQ2MXQ0eGlDajZyRXo2UlFWeDlpTkUrTlRVc3Ewa0YrMVRn?=
 =?utf-8?B?SUtnS1dFTDZxQndRRW4wL0F5RXdaa1NmTFFna3ViVmtqVTBvUkR1bFAwYlhB?=
 =?utf-8?B?VXlBZnZzaUYvOU8zNGxXNWNhWmFIMEpybktrQ2RJckhzTDkyQjZUT3R4SVQ3?=
 =?utf-8?B?QUt3UmhuL1RQZE9LT3lGSkRyU0ptVTNoMGxNaU91RnNWZldNVUdHRklSVmU0?=
 =?utf-8?B?T05LRWZndk5SQXduUlZIVFkwNXRUSklmMUpSdmJUTnV1ckpoaGhpZWQ5bUVH?=
 =?utf-8?B?dEppU094THpveW1hd0pkWUVhY082VHhmTHF2ZWtQaGFnelRtbWNNSkJCVTEw?=
 =?utf-8?B?cmlDV2dGVjhTN3JiUityZTR5dm9LVkZvSG9HMm96YmFPWWV4OXlFd2g4RzNK?=
 =?utf-8?B?YU5BR25JRk5ESDIySnNqZlFuRExTVnllTUN1V0psUkVmOGMxZk9nQ1o0VFF4?=
 =?utf-8?B?blBNem5BS3Q5N3hlTWp1bllKWURqWGZPejNsQURFc2ZMNk1UL0JMYnRuVm5l?=
 =?utf-8?B?ODFQSmg2QU5qS0hNc0NwUjQvalp3Z296ZE1Jc2hUaUd4ejVMN1FIOUVQZ0hS?=
 =?utf-8?B?SG5CVTRVTHB6VjhxeGZFenNCQkJHZ203amtpbTVsYlNKb2RmUkdjNjdvQ0JZ?=
 =?utf-8?B?SGRwb1NTc09tc3NQRFRSU3dWZ3RlRG16Sk5aMytxME9pN0NBODh6R1IzRks4?=
 =?utf-8?B?V0ZoOVRGOFZoWFg3cHV4S2VXOGE2OWRaRHV3ZStlbkIzM1ZIZGVBL2p5dXda?=
 =?utf-8?B?ODB6dWZxZFoyNnRPZzFZR1NVTklMNXV6ZnYvcWsrMVloMnJKdUd5c2xrOWdh?=
 =?utf-8?B?eE5GUDd3MXFxS1VqMjUvZFU5dXBjNUM1TUJQcW5hR1VzM09nZ2hWOXR0amt5?=
 =?utf-8?B?bVpiMUVDemhpMEUzcEhxeVZxYWc3YXlWakhhb2JzcGRZOG5tZUt4MHBUQnFj?=
 =?utf-8?B?VmFwTWQxc1lxcDhvTWNTTmREUFlveXRXS0d2TjRzVVBXendmNllRV3Vib1Nt?=
 =?utf-8?B?K2ZxaDh5eUtzWWJXakRORldEVm5FSlRjVmdIOXQ4ZkdzTzljOTNrYkFwOE5C?=
 =?utf-8?B?ME1rK2Z4bVNvbHE3eEx2blh5SDk5bGdaWTdUTU1mU1NFS0ZmRU53bkx2WUZE?=
 =?utf-8?B?SzJkT3lDTExTYkFjZC9zRHZsTk1Za3R6SFNOekFXSmlLVGU3K0RNbUhpZEFm?=
 =?utf-8?B?V3JkamFBN1BrV2JtcGVIeG9IZTNPK3BzU0dNbFV1QjVvd0RSV291cG5qajFj?=
 =?utf-8?B?bVRWODM2TFRXcDVuV2tzM3E5SFRtMVhmYzVoOHhHdVNycjNKb0h5eEtwNElT?=
 =?utf-8?Q?8lmC3TJOr+eciHCJevM8Er0/V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403ec0b9-8acf-418f-1478-08de2df542a0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 20:40:54.5624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpzkOPzB+Vkv+ZQ7cmAlPDTrVCsjscreSR8CQ6HzQzOJEErBglNgmv2DYKTfn2NycJM7HIEZjg3da/DzzjZoMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6300



On 11/27/2025 17:39, Ilpo Järvinen wrote:
> On Wed, 19 Nov 2025, Shyam Sundar S K wrote:
> 
>> Custom BIOS input values can be updated by multiple sources, such as power
>> mode changes and sensor events, each triggering a custom BIOS input event.
>> When these events occur in rapid succession, new data may overwrite
>> previous values before they are processed, resulting in lost updates.
>>
>> To address this, introduce a fixed-size, power-of-two ring buffer to
>> capture every custom BIOS input event, storing both the pending request
>> and its associated input values. Access to the ring buffer is synchronized
>> using a mutex.
>>
>> The previous use of memset() to clear the pending request structure after
>> each event is removed, as each BIOS input value is now copied into the
>> buffer as a snapshot. Consumers now process entries directly from the ring
>> buffer, making explicit clearing of the pending request structure
>> unnecessary.
>>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v4:
>>  - Do not store local copy of the ring buffer
>>  - use devm_mutex_init()
>>
>> v3:
>>  - include headers wherever missing
>>  - use dev_warn() instead of dev_WARN_ONCE()
>>  - remove generic struct names
>>  - enhance ringbuffer mechanism to handle common path
>>  - other cosmetic remarks
>>
>> v2:
>>  - Add dev_WARN_ONCE()
>>  - Change variable name rb_mutex to cbi_mutex
>>  - Move tail increment logic above pending request check
>>
>>  drivers/platform/x86/amd/pmf/acpi.c   | 40 +++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/core.c   |  5 ++++
>>  drivers/platform/x86/amd/pmf/pmf.h    | 21 ++++++++++++++
>>  drivers/platform/x86/amd/pmf/spc.c    | 32 +++++++++++----------
>>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>>  5 files changed, 86 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 13c4fec2c7ef..3d94b03cf794 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -9,6 +9,9 @@
>>   */
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/array_size.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/dev_printk.h>
>>  #include "pmf.h"
>>  
>>  #define APMF_CQL_NOTIFICATION  2
>> @@ -331,6 +334,39 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>>  									 req, sizeof(*req));
>>  }
>>  
>> +/* Store custom BIOS inputs data in ring buffer */
>> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
>> +{
>> +	struct pmf_cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
>> +	int i;
>> +
>> +	guard(mutex)(&pmf_dev->cbi_mutex);
>> +
>> +	switch (pmf_dev->cpu_id) {
>> +	case AMD_CPU_ID_PS:
>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
>> +			rb->data[rb->head].val[i] = pmf_dev->req1.custom_policy[i];
>> +		rb->data[rb->head].preq = pmf_dev->req1.pending_req;
>> +		break;
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>> +			rb->data[rb->head].val[i] = pmf_dev->req.custom_policy[i];
>> +		rb->data[rb->head].preq = pmf_dev->req.pending_req;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0) {
>> +		/* Rare case: ensures the newest BIOS input value is kept */
>> +		dev_warn(pmf_dev->dev, "Overwriting BIOS input value, data may be lost\n");
>> +		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>> +	}
>> +
>> +	rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>> +}
>> +
>>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>>  {
>>  	if (!pdev->cb_flag)
>> @@ -356,6 +392,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>>  	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
>>  
>>  	amd_pmf_handle_early_preq(pmf_dev);
>> +
>> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>  }
>>  
>>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>> @@ -374,6 +412,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>>  	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
>>  
>>  	amd_pmf_handle_early_preq(pmf_dev);
>> +
>> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>  }
>>  
>>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 2ec4cb92e34f..71421a5d7afd 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/debugfs.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/module.h>
>> +#include <linux/mutex.h>
>>  #include <linux/pci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/power_supply.h>
>> @@ -477,6 +478,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	if (err)
>>  		return err;
>>  
>> +	err = devm_mutex_init(dev->dev, &dev->cbi_mutex);
>> +	if (err)
>> +		return err;
>> +
>>  	apmf_acpi_init(dev);
>>  	platform_set_drvdata(pdev, dev);
>>  	amd_pmf_dbgfs_register(dev);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 2145df4128cd..5a18b3604b6e 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -12,7 +12,9 @@
>>  #define PMF_H
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/circ_buf.h>
>>  #include <linux/input.h>
>> +#include <linux/mutex_types.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/platform_profile.h>
>>  
>> @@ -120,6 +122,7 @@ struct cookie_header {
>>  #define APTS_MAX_STATES		16
>>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>>  #define BIOS_INPUTS_MAX		10
>> +#define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
>>  
>>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>>  
>> @@ -359,6 +362,22 @@ struct pmf_bios_inputs_prev {
>>  	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>>  };
>>  
>> +/**
>> + * struct pmf_bios_input_entry - Snapshot of custom BIOS input event
>> + * @val: Array of custom BIOS input values
>> + * @preq: Pending request value associated with this event
>> + */
>> +struct pmf_bios_input_entry {
>> +	u32 val[BIOS_INPUTS_MAX];
>> +	u32 preq;
>> +};
>> +
>> +struct pmf_cbi_ring_buffer {
>> +	struct pmf_bios_input_entry data[CUSTOM_BIOS_INPUT_RING_ENTRIES];
>> +	int head;
>> +	int tail;
>> +};
>> +
>>  struct amd_pmf_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -407,6 +426,8 @@ struct amd_pmf_dev {
>>  	struct apmf_sbios_req_v1 req1;
>>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>>  	bool cb_flag;			     /* To handle first custom BIOS input */
>> +	struct pmf_cbi_ring_buffer cbi_buf;
>> +	struct mutex cbi_mutex;		     /* Protects ring buffer access */
>>  };
>>  
>>  struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 85192c7536b8..34fff41b86fe 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -11,6 +11,7 @@
>>  
>>  #include <acpi/button.h>
>>  #include <linux/amd-pmf-io.h>
>> +#include <linux/cleanup.h>
>>  #include <linux/power_supply.h>
>>  #include <linux/units.h>
>>  #include "pmf.h"
>> @@ -132,30 +133,37 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
>>  	}
>>  }
>>  
>> -static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
>> +static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct pmf_bios_input_entry *data,
>>  				       const struct amd_pmf_pb_bitmap *inputs,
>> -				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
>> +				       struct ta_pmf_enact_table *in)
>>  {
>>  	unsigned int i;
>>  
>>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
>> -		if (!(pending_req & inputs[i].bit_mask))
>> +		if (!(data->preq & inputs[i].bit_mask))
>>  			continue;
>> -		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
>> -		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
>> -		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy[i]);
>> +		amd_pmf_set_ta_custom_bios_input(in, i, data->val[i]);
>> +		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
>> +		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, data->val[i]);
>>  	}
>>  }
>>  
>>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>  					   struct ta_pmf_enact_table *in)
>>  {
>> +	struct pmf_cbi_ring_buffer *rb = &pdev->cbi_buf;
>>  	unsigned int i;
>>  
>> +	guard(mutex)(&pdev->cbi_mutex);
>> +
>>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>>  		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>>  
>> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
>> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
>> +		return;	/* return if ring buffer is empty */
>> +
>> +	/* If no active custom BIOS input pending request, do not consume further work */
>> +	if (!rb->data[rb->tail].preq)
>>  		return;
> 
> I'm left usure if "do not consume further work" comment really means that 
> the entry is supposed to not get removed from the ring, which stalls the 
> ring forever?

No. The amd_pmf_populate_ta_inputs() function runs periodically and
calls amd_pmf_get_custom_bios_inputs(). The preq check prevents
unnecessary processing when the ring buffer is empty or contains no
valid pending requests.

Regarding the ring stall:
Entries are added to the ring buffer only when a valid ACPI event
triggers the event handler. Once an entry with preq set is queued, the
consumer processes it and increments the tail.

The check acts as a guard when the periodic function runs but no new
events are available - either the ring buffer is empty or the current
entry has no active pending request.

> 
> If that's the wanted behavior, does that imply overwrite dev_warn() above 
> can spam the logs from that point on as the ring can fill up without 
> anything consuming entries from it?

Entries with valid preq are always consumed, preventing ring stalls.
The dev_warn() only triggers when the buffer overflows, not from
stalled consumption.

Thanks,
Shyam

> 
> I've taken first two patches into review-ilpo-next.
> 
>>  	if (!pdev->smart_pc_enabled)
>> @@ -165,20 +173,16 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>  	case PMF_IF_V1:
>>  		if (!is_apmf_bios_input_notifications_supported(pdev))
>>  			return;
>> -		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
>> -					   pdev->req1.custom_policy, in);
>> +		amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bios_inputs_v1, in);
>>  		break;
>>  	case PMF_IF_V2:
>> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
>> -					   pdev->req.custom_policy, in);
>> +		amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bios_inputs, in);
>>  		break;
>>  	default:
>>  		break;
>>  	}
>>  
>> -	/* Clear pending requests after handling */
>> -	memset(&pdev->req, 0, sizeof(pdev->req));
>> -	memset(&pdev->req1, 0, sizeof(pdev->req1));
>> +	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>>  }
>>  
>>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 6e8116bef4f6..add742e33e1e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  		status = ret == TA_PMF_TYPE_SUCCESS;
>>  		if (status) {
>>  			dev->cb_flag = true;
>> +			dev->cbi_buf.head = 0;
>> +			dev->cbi_buf.tail = 0;
>>  			break;
>>  		}
>>  		amd_pmf_tee_deinit(dev);
>>
> 

