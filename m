Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE1D529
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722349682; cv=fail; b=N76GwZ84WQ+udo56R6pQ2To6mN7VwTnljNzs5Ktiz6xW/dN3DveMW8ZPprzbKvOP3Uim2BPs9lDa1jJ2oAqFwuRl156fgNM9hAmgAnS6cSHxEtVuYFbX3GTxv/1GOF//b6b8wkl0/LN2nUcBMUsO2gLdejrn82EtLH+CNzFUbs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722349682; c=relaxed/simple;
	bh=HCfipvYAY/9anoFoO+nKwURXb7OiRsUGULf+1ysKzMs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gUuTxn95abAjmSWajN5UbYqQqwDF7eHo4jp01MXQu4uR5ponLOQDWjJowKDJM8Gzvj6fUbYjlfIYIU7x5HnIX42YYjTDcV57ugtbqRSLhPeeS62rUpsFlejrZow+DVyPr0ez4/ptz95IBRA52c9G2s722U0K5iAfKVCvGfjD/8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fa/wCVzh; arc=fail smtp.client-ip=40.107.100.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fa/wCVzh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewDBd13z+nDqgbJZwn+b1RWIg5xRmOEWKFY/WDbpI4VPRlkF7E3niXIpEoioTqZAM1ELoCuYcEoVNQNCiXLqQQQG1Wh1xTFOmMfUs/5gGEAHqAQ5Z8HGJKvmLDdocCgZxMcrpS+flXlVnRxtVBh735AoG9UMzYNnEqmZEc7PWaf7dXoacRlsnN8eFnKX6MnUKRpQNP8BOpUrv14XcSHMZpU0zLrUdsR0ewiQNWsimCA560bJ/fkjc1CimFafL0/lvU9TQ0zSPbF89OBepOhZlxIAKauNnJ1V4VJDFW4PkM2yWBqPnZwdyw9WXTfsnyCsvOn+izU5Y0IIUSYii+akVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9378Fvf8ugsWwMIRVqzuKsMHT2G75LBQ79a7dTF2Qxk=;
 b=f7bQ2m4S2ughE7t3BjowB6/WGgSbj43LrlVPVzgi/FR2sF4NlenOavsoAUInpO0VLDAQt9ClXsfD844v2hvYnpJvt0xcjbdVEv52lZf/Gl2TXxT9ZIBQOfClCYemnv/vJEGStqmkvA5OyUNw+nykQ6DNKsdT9D+K+EEaqICD3hTdsThWdD2AOwazSJQbVKXyt/76O5jZA/+w4y0trDrlcATLYUoY8VyywDSTyVO5TU4LPcpnC4uFYjTr1vYh9+ViSW/fbHtrjlcbSsGqqjhGJ8sLkkYpxqfDf/f41sF2gJoqiyUQ6xu/Jlgt09zl71E0hjHRWgFxF/ljeWjdocwcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9378Fvf8ugsWwMIRVqzuKsMHT2G75LBQ79a7dTF2Qxk=;
 b=fa/wCVzhB1RL0eF1j8/bjEk4FIHKddZ/P3ieWvJ1FEABgzacWi3IgomC7TDNAX4lLIl5sAl9LLvPf81GfTgQq63u++KBQb1znJHPlrKgvY/NuYX0vm25Ud/zLhlRhBqcDP6vBYNmHD1bi3IHDwU3795JzcVaEC7rfVxhQZvBZPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 14:27:56 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 14:27:56 +0000
Message-ID: <5c246bad-dd27-48fd-bfdd-422e633b4288@amd.com>
Date: Tue, 30 Jul 2024 19:57:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Fix to Update HPD Data When ALS
 is Disabled
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20240723132451.3488326-1-Shyam-sundar.S-k@amd.com>
 <20240723132451.3488326-2-Shyam-sundar.S-k@amd.com>
 <cdbf07d3-1d9c-f1bc-d548-c3509d5586dd@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <cdbf07d3-1d9c-f1bc-d548-c3509d5586dd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af4b52a-a836-4721-8d7f-08dcb0a3ce29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFJuUWpVSHZHT3RMdmI5c1hkSFQ5RkFoMlUyM1c0YjZ5VXlzYlhaVVFHVytU?=
 =?utf-8?B?YS9HcWdoWXJ1R0E2TVA3cURKL3d2S1NWVENsSjd4NjBZRzZCbjFMNTNXQ2hH?=
 =?utf-8?B?Q3dLTnphTzZES2ZTN1hSNWVwTXRsUndRNkhkZUNLOFFkMktjMzNaT3FMM2Yz?=
 =?utf-8?B?N0M1bUZMQVY1R2dWbDFmMVhEWlQ2cFhOK3NZdFJSOS8vdzZUY012UHp2ZGp2?=
 =?utf-8?B?RHhneHlBclp3MzI1alFHQk02WGdtSUVrYzZCSE0vZkZ2bDR0WlovT1BabTlj?=
 =?utf-8?B?TklOVHdRNzFqc1NkZFBIckNGVjJlNTIvNFlOZ2lDWHliMW5FUmlLY0FyQW1X?=
 =?utf-8?B?YURQWVVmcmNISHVpYXNNVXF2MlRSZmo1Z0xIckliQklIb2UvZkRuNWVHd3Av?=
 =?utf-8?B?VC9sd1pkM2Z6OWlNRzMxUXVHSTA4REF5eGtyWFJuZ24rMktzVXJ3OUJzWEpE?=
 =?utf-8?B?OVJweXpGZGdxZzJ2VUVrUTdGQXB0ekpESWdXNHp6VUR1bHJjZ0NHRmtlYzl4?=
 =?utf-8?B?N0l3OWxhbFFuN2dJdjV2QkE0Q09Sa3N2QjRVdVR1YzI2QnZWNzdETEgwVGRn?=
 =?utf-8?B?ZlFxZHltaFFIRWl0azdBdjBOcURPY2V4TnRuLzVjYmZNZlhmUVgzVTNOWno3?=
 =?utf-8?B?S2xqaFR6RFN5a2tSeVQvQm1iMnF0ZVljMTlLRithREVqZExpMExudEQxeFF5?=
 =?utf-8?B?MU85VEJTQ0x1QTEzeFZHSUU1SkdJVkNHSUpMMGFERUUzL0o2dmlSYkhWeWsx?=
 =?utf-8?B?Mk5VcVRLc2hZc0U5ZWlRUHhsaHU4YTk0d3N2cEJkZ09mRm5Ja09LVmlBbEUy?=
 =?utf-8?B?bE5SWmVxL1Y0azBQSWxJd0FnWnFaL05scktYQ1VTV2RkWW5BLzFYeFBTQVBu?=
 =?utf-8?B?dHZkSXpWR21CaFVSRTZ6aHRhN3d6dnVWQTU4bktqM1FFNm9ZNW9SU214VHEx?=
 =?utf-8?B?YjBQQW5uUEcwYi9wQkQrUnB5Y0E5NDdaL0l3VXF2VE55b3ZESjhVMjZHc0Vv?=
 =?utf-8?B?aThWaHBVa3N2OFQ2bU0wUU9rdDZlRm12eHc2bEtLSDBhNGtjK1dnK29mM2s1?=
 =?utf-8?B?Y0lheUVBUHB0TWdFd2NGdVVQN0hLeXJ1Uy9rczBZYjBIVGlzYTVrMzgxc1RX?=
 =?utf-8?B?QnVEZzVxcHZ5eTlKQnhWbjlCc0x5MTVYMG5LV2VxTnVXeWZMd0FSQVN3eHZ2?=
 =?utf-8?B?b2RSL0ZzZFJvTDNNMDJUaWdPTVQ2K2xYTHdUVWhEZnZFTmlVZlowbDZ6UjYr?=
 =?utf-8?B?LzcvQnVFTlB4bGFRUkVxdFNXenZPOVVSQW9WK2lpNVRHc0FFMjdrK2wwUEhV?=
 =?utf-8?B?U1hYWk1lbkhtcmdOYjErN1ArNkJiL1dVcS9SeGhWQlgvWm1zOW40dWVrOFZ6?=
 =?utf-8?B?RG9BSmhKd21lYWt3MTFPM0xRSmlkNG9QcUcwNU10SXFuMXdvQ2tpZzAxMFV0?=
 =?utf-8?B?eXFSZWFIcXh5UktpM29OTnZzVUUycldSY0Mrait2TUNIUWZyVmw1dkM0V1Jt?=
 =?utf-8?B?dmErb3VGMFRJT3d0Smx6aExMNGtjVHhwL0pDZjExSW5VSHhNaGlCYjdZdmhK?=
 =?utf-8?B?M295UWpXZjEvVFBkZ3lkTEJMSm9QbTVEN0h5NDY0R2IvRVJNUDE1Tm9KdktR?=
 =?utf-8?B?dXhtNGJTNDJjWXlobnY3Y3pKd3Q3MGU1ODlDdklSNTVBSnllSWo0ME1zNUJk?=
 =?utf-8?B?WWNaR0ZZeFQwUjNMVTJEOTNCN3MzQSs5UVBYSGxGQlVvaEpTQU9qTTlzS1Ba?=
 =?utf-8?B?NnMweE5ZdnRuK0o0RmRkNWJUMHdwOURVeEM3Rms3ZzVOR280a3FMNjNRTWJI?=
 =?utf-8?B?UldKWjdsV1VhaFhkcng5Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3JTMDA3ZjAwSXpzVGhXUWdQTnMrUXRSak5CbW9nOVlSNzEyTnVONFFvcUwz?=
 =?utf-8?B?RnkzcHRUVXI0VXVkY0dlektESjJEbXJvenNmWHFuNHRVUUcweEp3YXFvOHAz?=
 =?utf-8?B?VjFuNHRnVHVlNUttOURXYzIyOVlvcHVjd1poMkJCekFUYm9qYU5IeE5wNXpi?=
 =?utf-8?B?NWo3T3pTOXZ1ZFAxY3luOUxmeGVPcGVwR1NsbHQxaVBGSUJPaU9aT3UzVG1C?=
 =?utf-8?B?dmtmd1VXbEplRCsraW5jMDFLaU9oWEJhbVQzcUNNaE5TOUFxZTJxS1d0U3V4?=
 =?utf-8?B?dzBuRUdEV0pYN3loVlVQWjV6SnYvOFdOZlRwdjFJSWpRMXR3UmMxbmttWlht?=
 =?utf-8?B?UmI5RW5ZWUxTUUhKOTM4Vk9ZSll5Y1V5T3NCK0pTQTBUcXBtVXltT2FzUjhF?=
 =?utf-8?B?V1BiVjZ4UzMwV040K3luT05JT255cit6MFN2Vm1DcnIxSkxhRytIdnpWa1FO?=
 =?utf-8?B?LzFlZit6c2tHVFA3TjFhamd3RHBaZkdleW13S2VibkZueXBtd1FEM1dISm5O?=
 =?utf-8?B?cUdjV1FIc3cwUzRwRWZwSDBDRmJvZk1OSFhTMjJtSXZpTkRrcFNMZG5Fdk4w?=
 =?utf-8?B?ZVVQNk8wank4VXcvNXR2eDRWS1pwdi9XblZaYjMydnQ2MURMZm00QjhVZzJJ?=
 =?utf-8?B?OHNkZis5bUlhS1krTFVPOHdBejRRWDRKM2lHcUZwRU5uR0JHMUI4Z2ZwTkcz?=
 =?utf-8?B?LzQreTJ4THRnUjh3aVB6RWFCREdUWWVJdmR6clFEaE5vMGwrdmNkdXBMRjUw?=
 =?utf-8?B?ZURJeU53V1NQcm9TNHJ0SlVKV1VFNDB4ekgrMXZ6T0ZQRTllT0kvbmJCOW5V?=
 =?utf-8?B?dXcrNDUxQ1BwQjYweHE2SEQrRmtaMno2U1V1WHVYQU15SkNVTldtaFR1Wjlz?=
 =?utf-8?B?bFVBZTR1d0FyamVmaXpwT3VWN3J3NVJKRFNpTWJlU1FTaUE2elU0aUNvM0xo?=
 =?utf-8?B?RG8vQkFDbkVhV1pwVlA4MnRRMXpGaWJ3WFZvTmIwTzdvM2NpNzFrQy95c00z?=
 =?utf-8?B?SGx3bFpwcW5tcFpneEVsNTBOTlJQdVUzWjFpSEYrckt2TzY1Tmk4NzZYQWtM?=
 =?utf-8?B?UXlXYWd4aHFVeG1RNmxaVnIvM2lhRzdSS3U0MFVTNnVEWEJHemt0MlMvVmVC?=
 =?utf-8?B?anBzU3pCbW9rNXV3VzhMS1NEZ05QTy9Xc3pXUVdsSDN0eFNuei9GejhURmls?=
 =?utf-8?B?aVNpQVFFUURMZ2k0OHpPY3FXYnp1bjJJaVIrRGloQjVMS0RCRVhDQVE2OXJr?=
 =?utf-8?B?WHhFd3lER1BUa3BWcWQ5andwOWQzRWNYOUdJMmd5RXJIVy9xQnBzTHp4Yit5?=
 =?utf-8?B?WDNQcXVoWE9QNEdaZEZGb1FzUnFPcmFZK3pnSThackpOYWgwTWVOMlBkdFpK?=
 =?utf-8?B?ckNyQmVIUkdOOTZNejRsaWhDdE12OVpsSHNVNDBsVU5PVjZSZGptVzVmazk0?=
 =?utf-8?B?VHZvR2IyQ3RrdTN3dWI0N3hlQUU0clRIQjlGdC9DL2J2RDlWM0lkM2F0Rmwr?=
 =?utf-8?B?U1V0U09DN0hJdVRoUndGM0hqZ1RZbkhkZ3l6TUM1ckdyMWtRTnRtVGc0U1R6?=
 =?utf-8?B?R3dGTFFWV3MwVUQ4UEE0NkxlOXpXY2huR29YR0sxZkhCU2FBOVhySTdEUk9z?=
 =?utf-8?B?RVQ1cWhmS0ZzaVVIRjYwREFibWFiYkd2c0Y0VzF5MFA0aDlPK004SnR2aG56?=
 =?utf-8?B?SDRSMFNwRHY4YjlnUEtJWmQrb1UwUVZrVCtFWUVyQTVOb1R3Qmc0RzlDcWZk?=
 =?utf-8?B?M3RvMTVsWkt0UXJjLzh5ZktVanNrdEpXa2s2L3JMbVNFWHVFcFh2OVFwdDVY?=
 =?utf-8?B?anArTy9CQ1poeDJGWnMrelpWbENQb3Rkb1FZUVdJYWc2YXpLQ2FHOGRkVTlv?=
 =?utf-8?B?bk1RbU1xUkNnVVhmT2lGSFVjeEFFNFZlMFFyYVRXTlcvVlNWRU1kd1FXdXdI?=
 =?utf-8?B?dmFBeGQrTWxrWmNrQkh6MXVMNTY4eXRFNkJoaVd5ZVowcyt3RndJbTJmZUFW?=
 =?utf-8?B?TUZCNnVFVVBQMjZFR1JsbS9VN09UdERoanFJTnR1NjNJTlZjSkNEYnFYYnpz?=
 =?utf-8?B?UlIrUi9QZHA2QnlwcVFLZ3dBWWZTQTNHdUVOTmZOM0hYQnBnMWNGMHlOTTU0?=
 =?utf-8?Q?LfGGh5VnAut1i+egJkImlj4jG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af4b52a-a836-4721-8d7f-08dcb0a3ce29
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 14:27:56.8399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMcUUY+tbJ5WNAWM8zbTqzSj48jvGMuPLyI+6Xb18QAbISCgLgaQU/MgI3ml77GGlOY0a/VJfnZ3fLRlPNpaQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726



On 7/29/2024 17:25, Ilpo Järvinen wrote:
> On Tue, 23 Jul 2024, Shyam Sundar S K wrote:
> 
>> If the Ambient Light Sensor (ALS) is disabled, the current code in the PMF
>> driver does not query for Human Presence Detection (HPD) data in
>> amd_pmf_get_sensor_info(). As a result, stale HPD data is used by PMF-TA
>> to evaluate policy conditions, leading to unexpected behavior in the policy
>> output actions.
>>
>> To resolve this issue, modify the PMF driver to query HPD data
>> independently of ALS.
>>
>> With this change, amd_pmf_get_sensor_info() now returns void instead of
>> int.
>>
>> Fixes: cedecdba60f4 ("platform/x86/amd/pmf: Get ambient light information from AMD SFH driver")
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/spc.c | 33 +++++++++++++++---------------
>>  1 file changed, 16 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index a3dec14c3004..d9e60d63553c 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -150,7 +150,7 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  	return 0;
>>  }
>>  
>> -static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>>  {
>>  	struct amd_sfh_info sfh_info;
>>  	int ret;
>> @@ -160,26 +160,25 @@ static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  	if (!ret)
>>  		in->ev_info.ambient_light = sfh_info.ambient_light;
>>  	else
>> -		return ret;
>> +		dev_dbg(dev->dev, "ALS is not enabled\n");
>>  
>>  	/* get HPD data */
>>  	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
>> -	if (ret)
>> -		return ret;
>> -
>> -	switch (sfh_info.user_present) {
>> -	case SFH_NOT_DETECTED:
>> -		in->ev_info.user_present = 0xff; /* assume no sensors connected */
>> -		break;
>> -	case SFH_USER_PRESENT:
>> -		in->ev_info.user_present = 1;
>> -		break;
>> -	case SFH_USER_AWAY:
>> -		in->ev_info.user_present = 0;
>> -		break;
>> +	if (!ret) {
>> +		switch (sfh_info.user_present) {
>> +		case SFH_NOT_DETECTED:
>> +			in->ev_info.user_present = 0xff; /* assume no sensors connected */
>> +			break;
>> +		case SFH_USER_PRESENT:
>> +			in->ev_info.user_present = 1;
>> +			break;
>> +		case SFH_USER_AWAY:
>> +			in->ev_info.user_present = 0;
>> +			break;
>> +		}
>> +	} else {
>> +		dev_dbg(dev->dev, "HPD is not enabled\n");
> 
> Is it okay to leave in->ev_info.user_present as 0 this case? Should it be 
> set to same as with SFH_NOT_DETECTED?
> 

Valid point. Realized that the PMF TA only accepts a boolean and it
only looks for information on if the user is present or not.

I have adjusted this behavior in v2. Please take a look.

> ...I now realize your print out doesn't cover that case at all and 
> user_present is not used for anything else than debug printing.
> 

entire populated "ev_info" is passed to the PMF TA to evaluate the
policy conditions. So, its just not limited to debug message.

Thanks,
Shyam
