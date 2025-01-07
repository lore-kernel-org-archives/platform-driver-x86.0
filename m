Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B31F7574;
	Tue,  7 Jan 2025 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285408; cv=fail; b=eMfi7KOqec5CbgYZQDUa8eR7tAja/Ib7qUMj11q3Hyr4dFyzzD/qLXFbIAgG8qWJpMNJhmC/5iDrdECYDDy6PM4PP02XUGQkSb4jFZpr5II+0czkQ2C0mXXfe5ARtkHxRXn9djmE9UMmUDqet6+FlefhlVZ/Wf7HvZ4oKCCfBuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285408; c=relaxed/simple;
	bh=S8nCK7d0+2PGSqJrPpAHxuvOVCiYYzSn+598mgPYpbk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uEIpIDTmBhD7RwUD3/xx3uMXygzBCKJ19i+hNmd875SBISgLIyhuWblt9c6aWgHIg/0jiRg8zazINbsDhid1ypntK+MuS3KwedGYmTKRuutf9RpTR2+UBakct/x/WxgTmoOdPdvtj80PCv3KeNeyrQsOYHs+gfIzK/O1HK6VqmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b4RXWaue; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b4RXWaue"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRHTLisrOGV7MOcu1JUM15VctIECRz/SH69G2ExicUF80A7ohWzaO79wK1gf4JPhpC7MvPmh88tgdnEcJEeyMChnpkEGm/2XkaoTpE0mR5as4mZ3EJUnlh5zRED7Z3/IN8RmQ43goK54ofX6O06TL3UNt4XoEv6Xq+myauqszt7u1BkDT/eWUxB27uV56qLAKpKTZhShhQFkN7v8MQRioqtpo5Mh5YpheTH2Vf3EhylKbH7Cdtu6yZeLzbe+qxmjYDhBkeMzcaCufQz/TsNNQO1JH9hrsItufK0GS2R0xV/FDQ/ZprKZfbqpX0OSUWduYonIrW/HJdDOJwD84jl9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0oyQbEddW+eA9KcudgAqD7es6wvFMzCDI/PpKvLV5c=;
 b=R2SWHwbxPQchDU1NDUm05cG629IC2LhRnLDYX8Tvv2GCU9rQwWHw8CrGr6nK0sR74gUf51EXwqPfYGcpol5N+cnrAnjhKEaq5V3z5JVGvO/ZgrxM7vUBiqcbjkU6Q69cdsZiH+VDr3WyMakIF9EUzZ1Kz3k1+3p9zo9SUHC5seJEyEIIo/27vYU2t9M/JLwXYAiilhtuNhjGOJ+jKzN5abu+aaARV+YPgJfpx3fs0A4i3yLFWyxzNLOzaC/X2hyzswjHfebm8UcxkUrvZS20xH9cn6xBIo9SQOyR3caP6NwM9bDoFRIpGD6Hfk5qgWuJIOmyL+lp0498y+fAHQYEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0oyQbEddW+eA9KcudgAqD7es6wvFMzCDI/PpKvLV5c=;
 b=b4RXWaueAAGcFoUY1M2dKnRCxVJdZuzaY3bDPljxFIJKuIIKfctNbYKZyMTgMmjaTzfXlXQ2u6JwKluUES95GAJG2fh2v8hjcTo20XeBxq5PbTsSnUP4baucGHxPgv+/UKKkLqEJYYkTx6fX1A5dafqgBqPdaR044hBynizXwTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:29:59 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:29:59 +0000
Message-ID: <399430a5-eb7f-48b0-be4a-e1b404a200e0@amd.com>
Date: Tue, 7 Jan 2025 15:29:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/20] platform/x86: Update alienware-wmi config
 entries
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-21-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-21-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:806:22::29) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 096e01a6-42e2-4ebf-18b2-08dd2f62707a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2tMTTdkTHlLWFFGaWtydWpHNExrVU1heEhCdlNYdC9nOUlpSlRMd05jK3oy?=
 =?utf-8?B?OFQvd0VORGVKV0NjbE8vRlY1VVBqVzBEVXhlbFBMMXFubGRtMlFYbG1BV2dO?=
 =?utf-8?B?M2V4cEpEekwrUXQ1aU5PeTIraHBEWVkxYlVnb2VBNk94Wkl4Tk9wLysydm1n?=
 =?utf-8?B?T2hERmM3MGF0Q0NnNHF5S25zRnc2R0VlQlpGczRvVXllWmd0KzV6NHZYZDcy?=
 =?utf-8?B?VDMyd2lIN2pzc3BZTzZPMFRhVGxUVHd0cmtLZXc0VEw1bGpKOEtwTmRtU25U?=
 =?utf-8?B?Rmk1MTZBbWIxSHNjc1lMaE9hQ2ZwN2NYeWFWaCt3L2VtNjlHYlZZSlR4NUpw?=
 =?utf-8?B?U0JiMVNGNjZFY3JjM0ZQdEdiWkhYTjVwZmlYN2g0Q1ltcFE1cHVMSWRDWDhF?=
 =?utf-8?B?L1MwdjBtOC9YU2UxYW8zeE4yUWxhQ0Y3SWRqVktYb1hnL205aG9McDQ1c25O?=
 =?utf-8?B?ZGsxVUl5T3hKMFE5b2ZJakd0ZENtSmVrSjJsTVpSam9zOVlFbUR5eVdpTVAv?=
 =?utf-8?B?cmVwQkF4cEdwY29ieDkrdEpIUEhJdU1NRXpJZVNUZHl0dVBQaDhZSWh6a004?=
 =?utf-8?B?aktFVGp0S2pWWEV4aUQwRzR3SkY2cXoyZUVUb2sxckpRa1I5c0RweTdpR24v?=
 =?utf-8?B?MXdvVlZjRzNNcUFZSmpmRG85djJzTCtqcUUxUW9DT2N3blpEbnhsSHVCMFE2?=
 =?utf-8?B?VVNLRFByTEVTYnVpZk13ZHhXVUZRNW9HUitaU3k5SXlta0hPb3o0Kzh1dkU0?=
 =?utf-8?B?ei9XZ1RCeElPVUM0SHN3bXlnVEljUXJMVXV3Zm1iL3Nuak5WbzJML0c2TGNJ?=
 =?utf-8?B?U015Mm9ETnQzQ1I2LzlqN1AzMVAvTkZBc1FjRzJzN1ZmWjJKVTF2Z1hFdFNq?=
 =?utf-8?B?OTlBdDZxTmRTbzc1VmxUanFaTGNtQmVzcnJ1R0gwc2gwckJvWmpIenBZM09W?=
 =?utf-8?B?S3FzL1pUakFrYUNkaEJkRlhZamRkS1BCcGZFOWEwaTV5bkd6NVJIZllRR0VB?=
 =?utf-8?B?MUlWRHNSdkpyRlZSSmFOZjlHdjhkME1TZ1JqSURFY09ybkZYdDBUVUpTZ3Fv?=
 =?utf-8?B?NmRCRkRNbHlWc3NhL3liTHhwajl6WkhrbFBJM0lHRjlJQ0RrRG1sK0NBVisx?=
 =?utf-8?B?anM3elNWUWlwYUVzMkRPMlFWY21qMXBwUWNuZTREVlBmamR4cmY5YUp0RDBZ?=
 =?utf-8?B?R1ZrUmJlaXZDT3lkVEQvcytpcUpwNEpoa1preUh4MjNqRHlzTHdvYllYWGZ2?=
 =?utf-8?B?UXY0VDdFZFdUTG0xRXBIdDFILzg2MjlWcjI0ajQzeGxDS3BXMG0rcU04UDFH?=
 =?utf-8?B?MExZcG1vNWVBbEl1a1RhTzAyM1FJejRqeEJzeFA3dXh3Wm5kOEJMUk9yTzVU?=
 =?utf-8?B?VkNqbG9mV2NxdU1RKzBKREkzRFNpUUp3RlNSK3JaL0dRMEx3Nk5ScUJkQ2w4?=
 =?utf-8?B?RWV2SWxJSWxDcnVqdHhMOGdMUlhhalNOSHZudHVYTUhKQURnRmZmaTlBMnla?=
 =?utf-8?B?ZGc2a05ldm0zcHQwSjJybUxxdjE0SWtRcXhOcmlzRjNuT25McHF5cFJXOGtr?=
 =?utf-8?B?SGYySTA1YmE5TnVwdDNiSTdsM2V1aUdQcTBPV2VZc0Fhc1MxR1EvdVlvMUdR?=
 =?utf-8?B?TU9LRXJYUzZraitxQjN6eUQzbkFvb2o3YzRULzVHUndGczhhUVVJZjRuS0NF?=
 =?utf-8?B?RmEybW5ackE0amt0b2M1c1JsVFVTMUUrc2x6aFdYNHB2OEtkTUVxTldsdlNz?=
 =?utf-8?B?Y1RUeFV2eHFGOVNFcDVEMmJ2NHFlTWlpeHRJT29VSDNNQ3lhWmxaTUc4SG9S?=
 =?utf-8?B?aURpcUEyMUtIZnplaWpvaVBxcFdFUVN3SmJWSXY3Y0JPZW1LVVpKM3FiQ0Ns?=
 =?utf-8?Q?/jbs1cG6up3Xb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjArSEN1a3pFQk1DWHdxS2NYdzBxSyt5WkcwUDZBWlY5Ry8yNzZJQ0tMbDNz?=
 =?utf-8?B?eldmRGlnSkhMaFpQaGJNWVVKVkgxdktoUUpqMkRJRDB6Sk5Jcm9TTHZEUkJv?=
 =?utf-8?B?eWJ2RnljT3NSb3FFZXJYOXdoSUxUU1lxUllDRWJ2NFFiNFY5bWlaNXBWeGNm?=
 =?utf-8?B?VWlhcmRNK2Y1bzd0M3lrUnRVQTh4d3BTb2dMaTIrVE5pNURyOE5QaFFIOTEz?=
 =?utf-8?B?amN2TEYybDArNVVCdGhLd045RUgxcGtGUjEwTEdmL0tjSEkrYjNVSXRHYnQy?=
 =?utf-8?B?b3hJVlpNaFRManpSbEZqbmUxWi96VVBHVlFNUE11VVNrTWIyQVNCTThOeGVM?=
 =?utf-8?B?akJSMU9MTWt3ck84S3VyNFdBdUhJRGR2Rm5iZEphTElSS1VWbUtoK2hLQXBo?=
 =?utf-8?B?SVkvZjhuNytUZ0tSZ2lMWFoyTzU4cUFFNElrcW1GS0pBL0FaUWE0bzQ3TmFn?=
 =?utf-8?B?M0l4T2dUTWFvamk5Ky9PNTJGT0pHMTY2eVpoNnUzU2d6M2lkdUNWbllKc3Fh?=
 =?utf-8?B?cmpRTVlxZmNGWXVOVW1DL0UzNFg3OFhjdlJQRitzMnJRMDdVampNMExBazAz?=
 =?utf-8?B?cElsdUN6Skxleit4bkdGZmxvMndidDZ2NkdQUTJ1U1pwU29nSG54Nm5MbE1K?=
 =?utf-8?B?cGJ2N1BnNVFiUzJSYmoxbEFlYnVNNy9CRnRXM3A1NmhGVGV5Sm5DT2ZuTmtr?=
 =?utf-8?B?NjJFUzFYR2VjcUdQVHJHMVIvSng3WXNlU2lWanFFZHJBZGVTQnArNXFDZGhQ?=
 =?utf-8?B?bHM3Z09ldWdxanY4ZE9jY0dkMGRBcFFqeEVVS0FSYktjek05dFZ3bGxBOUM0?=
 =?utf-8?B?Tm9OMUZiYmxaL25hUmRJOVNkK2tJVmFQdXBqZlprMStrQkYyNVVBaGI2WjFo?=
 =?utf-8?B?di9rUDZ6TGk0ZGt6Zks5V1A0MVphNHl2NVRJczFFN0NmOGtqQUphY2h0dmtY?=
 =?utf-8?B?MUZ0enhUWFArczBYRGFSVVRwK1ExWkFyWkxaRU0wQlM1bXc1TkhHT0h3Tk53?=
 =?utf-8?B?T0x4b0pLb1pxRDZjKzJpK3FqK3lCY0pmQWlvYjdDV0RFR3FnWlhJb0Rtb1k4?=
 =?utf-8?B?N2E2d2tkNWp1dE5MQ3FWM0E0cjRuQVhLOGJtRnBxd2ZEY1RyNkVLNHQzdTZK?=
 =?utf-8?B?S1dkbVlVcnpBM0wrL2tzRnFNTGl4TzVDQlAwaE52aXMvT3NuTkJidUNTUWNF?=
 =?utf-8?B?ZXo4TkFFNmVTc01ab09RN2hGRURUQmtaRlgwU1VXZGJhOWF3NENWUzhrR1U4?=
 =?utf-8?B?ZG9VaGNWdno0aG81VHpIRDdVaUkvRThETTJFK2l3eW83YmRmYmRwQUFwVS81?=
 =?utf-8?B?TUYrR0gxZ0Zlc3ZwcTJ0UGdlR3hiRmk3dUJOL0owcHVnTk40OHhwcWxaN1lq?=
 =?utf-8?B?SXlSS3BaekFuWVBkVjRncmlIcWRpbTZXTjZ2TFpuLzNhWitTNGNoNGQvdU42?=
 =?utf-8?B?VEpFSmtVQ0c2dU1pVUsrSTVGUmRkUW9oRmVmYi9mTXEwM3huSlUydzg3NVg2?=
 =?utf-8?B?UnhKYk92M2Via21BWkVtQ0x3SXdDWHRuUmN1aHFseFdXcXFnYXljeVRLb0dH?=
 =?utf-8?B?cXUybFBUUDdMNWFveHo3ZkxSVXpaMW5POVhhN28vbkNheEdRdEdmd0I5S3kx?=
 =?utf-8?B?d3NVY1I4NjJzb3NDRU42RDZpSG5Wc3pURzlCTGlSSEZrVE82QVZxMzN0ekRa?=
 =?utf-8?B?NXY3a3BNcGNzdTBaelh6Mlo5ZVc2aTlHR2FsWFphVEFoMmU5VnR5RW5nQWhZ?=
 =?utf-8?B?bVZzY29qY01VTmtMMGduYTB0S0xieXM0L1k3T1JuRlJRUEhqWmFveTl0MjFR?=
 =?utf-8?B?cm9lSUxYYTlUTEQ5eEVINVBJQkN6S0FWb0hpTU5KQU45MzJZZWZMUENET081?=
 =?utf-8?B?VndSV2pSK0JWSUF2RkZGdXNqckloalZtYkNRQmEwTDhJMW9zOSt2anJTRXhv?=
 =?utf-8?B?ZGl0VThLVDlaNUVENThqdzFkMjBtMWpFMVNzUEVnS3NiZE9mcllpUnRIaS9T?=
 =?utf-8?B?NDgwWnVDNXd0WDNqQlNlYWw4ZThEZFNYOEp0aHRoK01Vb3Jqc09uOXhUMW9V?=
 =?utf-8?B?QjZvWHB0a25DQ2NlM2lvaElEWWJ6KzNlU3Y4YmF2VFEvSHdqWjBwdkorMXFT?=
 =?utf-8?Q?Yeqx7FPt9I2M/RVM4AH7uNqeG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096e01a6-42e2-4ebf-18b2-08dd2f62707a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:29:59.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TADvzCzIiH0Kn7ttYZuTO4M5OK6OrzvauBD2gKGLi3p4jJQVHz8Ue3RFRL18DzuiNEACyFdcgQj7U2oZLHBTHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Add config entries for each WMI driver managed by the alienware-wmi
> module to be able to conditionally compile them.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/Kconfig         | 30 +++++++++++++++++++----
>   drivers/platform/x86/dell/Makefile        |  4 +--
>   drivers/platform/x86/dell/alienware-wmi.h | 23 +++++++++++++++++
>   3 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index d09060aedd3f..f8a0dffcaab7 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -18,15 +18,35 @@ config ALIENWARE_WMI
>   	tristate "Alienware Special feature control"
>   	default m
>   	depends on ACPI
> +	depends on ACPI_WMI
> +	depends on DMI
>   	depends on LEDS_CLASS
>   	depends on NEW_LEDS
> -	depends on ACPI_WMI
> +	help
> +	 This is a driver for controlling Alienware WMI driven features.
> +
> +	 On legacy devices, it exposes an interface for controlling the AlienFX
> +	 zones on Alienware machines that don't contain a dedicated
> +	 AlienFX USB MCU such as the X51 and X51-R2.
> +
> +	 On newer devices, it exposes the AWCC thermal control interface through
> +	 known Kernel APIs.
> +
> +config ALIENWARE_WMI_LEGACY
> +	bool "Alienware Legacy WMI device driver"
> +	default y
> +	depends on ALIENWARE_WMI
> +	help
> +	 Legacy Alienware WMI driver with AlienFX LED control capabilities.
> +
> +config ALIENWARE_WMI_WMAX
> +	bool "Alienware WMAX WMI device driver"
> +	default y
> +	depends on ALIENWARE_WMI
>   	select ACPI_PLATFORM_PROFILE
>   	help
> -	 This is a driver for controlling Alienware BIOS driven
> -	 features.  It exposes an interface for controlling the AlienFX
> -	 zones on Alienware machines that don't contain a dedicated AlienFX
> -	 USB MCU such as the X51 and X51-R2.
> +	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep and
> +	 AWCC thermal control capabilities.
>   
>   config DCDBAS
>   	tristate "Dell Systems Management Base Driver"
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index d5718ef34c48..8ac9a933c770 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -6,8 +6,8 @@
>   
>   obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
>   alienware-wmi-objs				:= alienware-wmi-base.o
> -alienware-wmi-y					+= alienware-wmi-legacy.o
> -alienware-wmi-y					+= alienware-wmi-wmax.o
> +alienware-wmi-$(CONFIG_ALIENWARE_WMI_LEGACY)	+= alienware-wmi-legacy.o
> +alienware-wmi-$(CONFIG_ALIENWARE_WMI_WMAX)	+= alienware-wmi-wmax.o
>   obj-$(CONFIG_DCDBAS)				+= dcdbas.o
>   obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
>   obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
> diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
> index e4b75b1acd10..a810767a0eb7 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.h
> +++ b/drivers/platform/x86/dell/alienware-wmi.h
> @@ -72,10 +72,33 @@ int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>   int alienware_alienfx_setup(struct alienfx_platdata *pdata);
>   void alienware_alienfx_exit(struct wmi_device *wdev);
>   
> +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
>   int __init alienware_legacy_wmi_init(void);
>   void __exit alienware_legacy_wmi_exit(void);
> +#else
> +static inline int alienware_legacy_wmi_init(void)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline void alienware_legacy_wmi_exit(void)
> +{
> +}
> +#endif
>   
> +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
>   int __init alienware_wmax_wmi_init(void);
>   void __exit alienware_wmax_wmi_exit(void);
> +#else
> +static inline int alienware_wmax_wmi_init(void)
> +{
> +	return -ENODEV;
> +}
> +
> +
> +static inline void alienware_wmax_wmi_exit(void)
> +{
> +}
> +#endif
>   
>   #endif

