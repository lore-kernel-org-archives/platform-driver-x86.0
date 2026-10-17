Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012050.outbound.protection.outlook.com [52.101.48.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801203AAF69;
	Sat, 17 Oct 2026 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256233; cv=fail; b=FzM4pBAic+95VPr5/PAjM4N1aPhgCvJhBdeq0WgUTh9xdkpvTfcp494n+MvV2mfis3peAzCRQwTcSCms19WsjPaHgn+cFGD9AnqsNnIeZtYeoR+OT2okhJqNdE9yD5uRiUBzMC1crIkfY+qlHpI4Q4pLEJOZsEfxp/gqnFz6y6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256233; c=relaxed/simple;
	bh=iGj2eXSZVchLKl+e3autK3g4/W7naXGbbw7Bfp3BsQI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jHv+Kn/YQtSHtV7PFj8dJZD5aNkjgcXw2rIJ4UwloHFE3PS3Vd9jor463IzDjq8nDNiGbTV5qV5+bEQx+RjVYmVqr2IWzZNGP5xGK5libeGKUKebxlP/urOlCcML0QKC2tmYL5H0yaBlS6Pe0WFJ5/sxb1x8zHFfcUlTVdtJQuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RrLEDQcY; arc=fail smtp.client-ip=52.101.48.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RrLEDQcY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es1mqhs/Xr861u9qfoubszdGKbN1rYaBRp7ICofLguKqr01I9aXS8B9swWowkD1aBNcimXK5SpqtW/A6cClZ3CjKrCJ0jr2O3VAlegjVtJdLlm3s3c9idZL4MvBbljQfaC1pHPZNbPfcwuoG64sVc0mGwQzOMCvde5E813yCZmVaI+klbUFHvB8UJhoI1WO0YQyblBeRZ9mTOMcfxPxamoOnpoGUmfaCHirl2vjUE5GEt/xnS1+GIDZlspGLLSsPAylophCGei/CUdT/A+N0Hz1QvbZnljyMryjVMWxjqCEKcqHVAbVj2PDtlk+XJSVkDl7V5eWXonFEdCRFE6mswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsVzDtgcTxBjIktjq4l9rYrBVBYUSVuz5ngUZwfRT1I=;
 b=kda0NhDu9P2cT5oFuDCSIFE6T7Q3ux+p2xRrGPn5Dvw7070JaC1mVzgBPzSCVqAZqIiLjCd7BJualHuiDBV/a3ki9xdtOB9bZe+KJT+qVhj1gAJVLzJ6tmfM7n5PN2QA/ybd/2+ifV0czLa2tc5si09kiisR8BJLIAOjH3adGUZmbuLNjK+LYFohTVzqZd6k9WMs9sKK/b2nAjIGaIlGt4Inhm0/gxHyTile2qs3qJbMZSr8k8CKxGZmFGOCqP34PzDOKZQlNpNGBTOVsbxGHs4dAGNaxJxNkdZjF328POJ6kF/sH1QVmmh4dSePebylU45r1Uo+m1h8CaqoXEBUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsVzDtgcTxBjIktjq4l9rYrBVBYUSVuz5ngUZwfRT1I=;
 b=RrLEDQcYxttrHYWE4DrqvaAu1PUe7+4KmeaV6CTw4J1dZMtWW8ehCzrPZQ7Iy8jrytJiRL8wvBXfXEh/bWiU4LKEeOcxxQ/7Qjlb0d7xwcS67Y6NI3JTzdA5wlpyNDwnZpO4sEAe7yY4yp4KDfY0QdF1mqZ1CSmXxaTEwwwmL1g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by CY5PR12MB6574.namprd12.prod.outlook.com (2603:10b6:930:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 16:57:09 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%5]) with mapi id 15.21.0522.013; Sat, 17 Oct 2026
 16:57:08 +0000
Message-ID: <e43d53d8-e2c8-4f3c-bff5-4a2cb29f594d@amd.com>
Date: Sat, 17 Oct 2026 22:26:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] platform/x86/amd/hsmp: Family 1Ah client support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20261012085407.1202295-1-muralidhara.mk@amd.com>
 <1b15803b-36ed-3af6-97c0-5689a1694975@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <1b15803b-36ed-3af6-97c0-5689a1694975@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|CY5PR12MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b9a1de-089b-4f7b-71ba-08df2c6fae25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|261009223027099003|5023799004|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	O3TyqqjvFCQLnIJlRrGmPK4dOVkoBHr8qpx/oXHV/Ebm+BrZGLPs6wBOZZMxjzj64UXJXDjVSnTPAXGY+zUVNhOYIUs3kOy6kCP2jUp99+z440HseCY6AVHTOEFdSKWzZHxa5ig9SbRNvXDU4HNeWvEjvFz91EQf1fObcY3pcTpxyrl3FoTz5BUNs3vH1Zp/u75ISS7X2mxVTD0AnVHQOO+Plv4mEiCZ7dzehF2UIbiO4ILIa1pvp4S4q3TFBQq7ozPXPGhsxh2+8sGxvPgIvSugR0xM8a7GcgSEuuoWtHdZUE2QdKTlaXPO3oB2cukcsEy1lhHIf2/Kfa+BoPiVLkKl+5wGR7gFKiUilZQTZhR3Qi/nJTgEVg6ScEv9mjJ6FVGTJH2j6Sx76l+FW3+LGsvSH3/737CzS42BBZ+cy1JCLr59cLTyAADOeklWIU2a+zzuznL+LMJWUWmdSefcLuefDleHJhHB8HyooYszS6l8zhjlxr2Y/Zc8s5fYdACEyvcd2zVASMmJRZvzveZYg/4lHBK3UlyrYTVVJ+J/5koomD3HQ5T5UyN3V94omFfgB5bAkbXUR3BzRp6g5Eam8fVPXdNk7idE169bp0bGejaWxfmiYI/wxKCyHFQdvYcv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(261009223027099003)(5023799004)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnZ1enNQM25XaHhSRzZmYnB3VGczUVdQNlZEbnRzdXpMUGordDdMcHlXalAw?=
 =?utf-8?B?VkxPWFRMZWZYM2ZTYVNNSzZ6QndpOW0wTGZvMlRxMjhabERuQlYzMzJyWVV5?=
 =?utf-8?B?OWpmekVhTGwrZ0xtRGtLVDhCQndsTmJHeTB1WTJlR3NtZVFqNEh4NUxUT0VU?=
 =?utf-8?B?ZDhRbmRzd0RoUlFjdnVWVGlJR1RHNVdGV1FrUmZpalFTaktLdEtCdC9XS3FN?=
 =?utf-8?B?NTl0SHQxUzhZbE44MFRYNmhnRlZQVkVMajQvTFlFM3htQkx1V1VMZGtZTnFK?=
 =?utf-8?B?bHUrU3dsb2RNTUsxVmttblphaVN2ZHNML0d4MDVpREttWG5pbm4wak1iWjZM?=
 =?utf-8?B?dExiVEl0SmZyS0FOZzNPWFlOK3BqUUpLR2FjcTVZZHpIRlplK3FrZERuWHg0?=
 =?utf-8?B?c3J6ZXIyNjhiNEwwa1ZNTmpyaXM4MUthTFhnN2hvTk5ERmhZNERXR1FFL0lG?=
 =?utf-8?B?T09mR0p0clZ1YlpwM08zd1Y3alkxcGxURmZBQmRrWVdBTWxlc3dGVHZjdDZJ?=
 =?utf-8?B?S0MxQUFaZUQ4Z0YyTGFQL1FRWWgyZHF3aTdvVEp6V0YzYnlhNllvUzVtaGxX?=
 =?utf-8?B?YnpHS0VtYXM4dVZKV3dxSm9VeGU2SlFvL05sZWRxTE9RcUt1YU8yWkRNTmFl?=
 =?utf-8?B?SGlRbnlWMm1NSTUzdU41ZlBTdW1KcWhBcUZ3cThqUkl1QzErMlhJVjBRd0NM?=
 =?utf-8?B?U3FuRDFZOEJMYjJYemZ5MmhBeDVuSUVhTHlsZDF4RjNWaThENTV4V0NCL1FW?=
 =?utf-8?B?eVM1am54cXJkbW5DeVNkc1hDM2poTGt4dmdBL3ZmbGs1UHVWYldQNUM1alZR?=
 =?utf-8?B?dzcyNXN5ZklOeVAwc0NhYkYvYlpYTytZOTE0KytvdUdXaHN5aUFCZmU0ekYx?=
 =?utf-8?B?OWJMSUFsYlpRNCtTRW02bG9QT2NrUm1KL3hZVzc3RDFFT0dCbHlqczNsNjd0?=
 =?utf-8?B?OW80RmUybEIrZm1YZm9vVWpMZ0s2M0hNWXgzU0lzcU1vNFVNZS9GaTkvOFFL?=
 =?utf-8?B?cmd1dFJLLzdLV3RCRlIyMVFzcUZBamxNa2xtNmJUQ25mK2tMQWN3UEZ0VmUw?=
 =?utf-8?B?eWZlOVdYdm0wbjFRVTJRcFRBTFBndDl6WVdTc3IxVldiNU82Q0UwRWIyb2lr?=
 =?utf-8?B?dGdIZmNoYzlSZzIyZ1JOZkoyQ0t1UzlrKzdLZUNDYWI5T1BnU0pDVVBMQXBF?=
 =?utf-8?B?d1d5OWRhV2dVc05DaXYvOTRZY2RzNmYrN2ZUWjY0SWd3eEMyeVRMSm9ZQTZr?=
 =?utf-8?B?ZzVjaHZFSy9XQ2g0cjhtZWtQYXFFeDJNRjJ4d1Q1aGJVR3EzQ3RNKzh1NDRV?=
 =?utf-8?B?djVoQVZVL3l1NXZrRzZGeUoyWko2RURLTDAvS1F3WjA1WjIxZDFFZkdkN21N?=
 =?utf-8?B?MnVXdkZpV1VTdTBlb1NsYll5M3NlZlB3V3pOK21MaHNuUmhldEJEeWQveE1p?=
 =?utf-8?B?UnI2QTBHbTZlQzRQNHJiY203OGs0UWxnU1RIVWtBNHpFVkhsdTZJUEVxVDlG?=
 =?utf-8?B?QTN5Mmw3TjNCbmJ5aEtQanhJNXViNXFreE52Rzhvb2dydnlnNTNRV0VUMW1N?=
 =?utf-8?B?cGg0cTVoOUovVTZKcklzRkNFNU5BNFNua29iODVxSEdzS0FvOU45NWhlNndj?=
 =?utf-8?B?ZVF3eHhKenBlQ1VhbUtjZ1l3OVlnbkIvSWVLMHBOTGJ0Ym16eHplS2xhTk1V?=
 =?utf-8?B?VmppRW5DMGZlRStLdHg4ZlJPVWZvMlgyOUMveW9WUEhNOGN1c3dMQ3ZDYVhy?=
 =?utf-8?B?THpPRER1VHdDOHhzMDFEQkpEKzgxTTRmeTBKWkpFSXYzTUZ1R0Z0d0R5Rzd0?=
 =?utf-8?B?Y0RlSTVvc1NvSkV4djllenJnT1E3OVRyQkdUdGJyMGNZRmg0VDE1NlJ0bUVV?=
 =?utf-8?B?Y3NjK0x3Z1dUR0o5TlBMT3pONFdRNHpBbFpPdi8va05UWVE2aU9FVnNzTjJE?=
 =?utf-8?B?STBkdWF4dEdZcFgrNkZlZ01YcDhYQ3oyUFBYNGhXdmRCOXNVS2xOdkJ5T2RG?=
 =?utf-8?B?VWk2T01ENWhkbXRYQklwRGhUZEhEamNBTGcyYzZEalhESS96eFMrVGtLNnlk?=
 =?utf-8?B?VGh2SHc5Q2g4OWc5eWx2R21SRFl3dDhyV2M3YUthNXBiK3JiemdaY1pGREJu?=
 =?utf-8?B?ZU4zY2paUW5hUDVqa0c0WmZrdXQzN3lEWXhNbTA3MG9JYlRka0dKem5nbW9W?=
 =?utf-8?B?cVZobTdKdUxoNXowVUtPcVB1STBKT2VhWDBNVE5YYlpyVkNHUnBGbWRLY002?=
 =?utf-8?B?OS9FUUtpTWc1M1lPNmpENG1iWVJqK3FDU05yM2UrRFRYcVNZR0taUi84cEV0?=
 =?utf-8?Q?TqNSOg1OfNU+63mm8Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b9a1de-089b-4f7b-71ba-08df2c6fae25
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 16:57:08.6230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oO7T98DKyvRYXRGSYs573hN9bxuwvZ+fCqUoFWtzUcFGn9rLMYhzNlboVM899byr3le/DGo2dZWO6fe87CSC0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6574



On 10/16/2026 5:17 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 12 Oct 2026, Muralidhara M K wrote:
> 
>> This series enables the HSMP driver on the Family 1Ah client platforms,
>> Models 80h-8Fh and E0h-E3h.
>>
>> The client parts probe through the same ACPI _CRS/_DSD as a server
>> socket, but drive a different mailbox and speak the Ryzen Master SMC
>> message set instead of server message IDs.
>>
>> Patch 1 adds is_client_platform() and hides the pre-existing hwmon
>> attributes, ACPI sysfs attributes, metrics_bin, and metric-table
>> DRAM-base lookup on client platforms, and restricts /dev/hsmp to 0600
>> there. Patch 2 adds the client message set and routes it through the
>> existing MMIO path. Patch 3 wires the client metric-table messages
>> into the metric-table read path. Patch 4 adds the client telemetry
>> table.
>>
>> Changes in v9:
>>
>>    - Patch 1: fixed a build failure on CONFIG_ACPI=n configs reported
>>      by the kernel test robot. is_client_platform() now gates the
>>      acpi_gbl_FADT access with #if IS_ENABLED(CONFIG_ACPI) instead of a
>>      runtime check, which does not stop the compiler type-checking the
>>      dead branch.
> 
> Hi,
> 
> I've taken this to the review-ilpo-next branch now.
> 
> But please do check the args[0] access mention from sashiko. It looks to
> me it results just incorrect error code at worst if num_args is 0 (-EPERM
> vs -EINVAL). As it also looked to be a pre-existing issue, I didn't want
> to delay this with yet another round because of it but it seems still
> worth to address if it turns out to be a valid observation.
> 
Thanks.
I have incorporated the args-validation changes and submitted them as 
part of the following patch series:
https://lore.kernel.org/platform-driver-x86/20261017165153.3748458-1-muralidhara.mk@amd.com/T/#m4b63f5c69441f965d780eb9bdd29e05e7bf8f9c1
> --
>   i.
> 
>> Changes in v8:
>>
>>    - Reordered the series per review from Ilpo Jarvinen: patch 1 now
>>      adds is_client_platform() and every client-platform exclusion
>>      (attribute hiding, DRAM-base lookup, /dev/hsmp mode) before
>>      patch 2 adds client message routing.
>>    - Patch 3 upgrades patch 1's defensive DRAM-base guard to the full
>>      RYZEN_MASTER_PROTO_VER1/HSMP_PROTO_VER6 check.
>>    - Patch 4 unchanged.
>>    - Tightened commit messages and code comments to an imperative,
>>      concise style.
>>
>> Changes in v7:
>>
>>    - The client message set no longer has a per-message descriptor
>>      table (hsmp_client_msg_desc_table is gone).
>>      Validate num_args and response_sz with HSMP_CLIENT_MAX_MSG_LEN.
>>    - /dev/hsmp is now registered at 0600 on client platforms instead of
>>      0644, since hsmp_ioctl_msg() has no per-message GET/SET gate there
>>      and any opener could otherwise issue a destructive client SET
>>      message; server platforms are unaffected.
>>    - New patch 3: the pre-existing hwmon registration, ACPI sysfs
>>      device attributes and metrics_bin visibility predate the client
>>      message set and are wired to hardcoded server message IDs, which
>>      mostly collide with unrelated client commands on a client
>>      platform. Guard all three with is_client_platform(), keeping
>>      smu_fw_version and protocol_version visible since they report the
>>      same data on both message sets.
>>
>> Changes in v6:
>>
>>    - Patch 1: dropped "inline" from get_msg_desc() too, for the same
>>      reason as hsmp_desc(): it does a range check and a reserved-type
>>      check, not a trivial accessor, so let the compiler decide.
>>    - Squashed what was patch 3 ("Add ACPI client support for Family
>>      1Ah") into patch 2. Patches 1+2 alone, without the old patch 3,
>>      would have left hsmp_metric_tbl_read_locked()'s new client message
>>      routing unreachable: hsmp_get_tbl_dram_base() never runs on a
>>      client platform until the ACPI DRAM-base gate lands, so the two
>>      belong together as one atomic change.
>>    - Patch 2 (now including the former patch 3): also guard the
>>      pre-existing server proto_ver clause with !is_client_platform(),
>>      not just the new client clause, per review. hsmp_pdev->proto_ver
>>      is a small Ryzen Master interface version number today, but
>>      nothing stops a future client interface version from reaching
>>      HSMP_PROTO_VER6 (6) and making that clause spuriously true on a
>>      client platform.
>>    - Series is now 3 patches instead of 4, following the squash above
>>      and addressed the review comments.
>>
>> Changes in v5:
>>
>>    - Patch 3: hsmp_pdev->proto_ver holds the Ryzen Master SMC interface
>>      version on client platforms, a separate numbering space from the
>>      server protocol versions in enum hsmp_proto_versions.
>>
>> Changes in v4:
>>
>>    - SMU now answers the interface version query on client platforms,
>>      so hsmp_desc_client.proto_ver_msg goes back to
>>      HSMP_CLIENT_GET_INTERFACE_VER instead of
>>      HSMP_CLIENT_GET_METRICS_TABLE_VER. Patch 3 is back down to just
>>      the ACPI metric-table-DRAM-base change, since that was the only
>>      other thing it did.
>>
>> Changes in v3:
>>
>>    - is_client_platform() now tells client and server apart through the
>>      ACPI-reported PM profile (FADT preferred_profile) instead of a
>>      hardcoded Family 1Ah model range, the same signal amd-pstate
>>      already keys off of. Future client generations are recognised as
>>      long as firmware reports the right PM profile, with no driver
>>      update needed.
>>    - hsmp_desc() now resolves the running platform's descriptor once and
>>      caches the pointer behind READ_ONCE()/WRITE_ONCE() instead of
>>      recomputing it on every call. Concurrent first callers are benign,
>>      since every one of them computes and stores that same pointer, so
>>      the pair only needs to keep the load/store from being torn or
>>      reordered by the compiler, not order it against anything else.
>>    - The client message enum in amd_hsmp.h is now documented with
>>      kernel-doc, one @member entry per message describing its inputs
>>      and outputs, rather than a block comment plus a same-line comment
>>      per enumerator. Noted there that not every platform supports every
>>      message and that an unsupported one returns -ENOMSG.
>>    - Patch 4: the Telemetry Table RM layout moved out of the .rst and
>>      into amd_hsmp.h as real kernel-doc'd struct/enum declarations,
>>      giving userspace one authoritative definition of the byte layout.
>>      The .rst now just points at struct hsmp_telemetry_table_rm. The
>>      structs are now also packed to a 4-byte boundary to match
>>      firmware's actual layout, and the trailing NPU/PMF counters and
>>      spare padding firmware carries after the overclocking fields are
>>      no longer missing. Verified field-by-field against AMD's internal
>>      metrics table header and end-to-end against a live snapshot off
>>      Family 1Ah client hardware.
>>
>> Each patch builds individually and is clean under checkpatch.pl --strict.
>>
>> Muralidhara M K (4):
>>    platform/x86/amd/hsmp: Recognize Family 1Ah client platforms and hide
>>      server-only paths
>>    platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
>>    platform/x86/amd/hsmp: Route metric table through the client messages
>>    platform/x86/amd/hsmp: Document and expose client telemetry table in
>>      UAPI
>>
>>   Documentation/arch/x86/amd_hsmp.rst  |  24 +-
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 420 +++++++++++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp/acpi.c |  31 +-
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 248 +++++++++++-----
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  24 ++
>>   5 files changed, 676 insertions(+), 71 deletions(-)
>>
>>
>> base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
>>
> 
> --
>   i.
> 

