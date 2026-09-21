Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010065.outbound.protection.outlook.com [52.101.193.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25F94AC147;
	Mon, 21 Sep 2026 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011588; cv=fail; b=o/YrbP9lh9fexgUey5nzzNdbVGTem5Bwnc9/CVE7m0JOadQxh37HpEscet73htygRUvbJv86F2l9sFLnYTZnXoZ6KAKXIpHuat1vap4cqxNdOpqsHsYB+/T7e6tpr2jPuXy6TZbPR9VkwgnBXJB7qLL7PVQY8ukQ27nhqt690sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011588; c=relaxed/simple;
	bh=+f9S552wJc+ItjNnD2Uf0wPEsJLP6919kRdspZPBkEk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u3280nj1n3t6bvpe21M4IpUyDKt1D9CJ+GTCJimCpRxTd4lcsEFMcP4zkNmQXbnpvI9Ay3OwP1nV0SzMRo+OtXIiZIntUl+LfXwdILT0w/PsX/XSwoLP8UDSM/XEP4a4T/sB7EYR9rR9jG9ZN6zJwbfekGiKiusjxXtKzNqsJRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xDE9fYB3; arc=fail smtp.client-ip=52.101.193.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xDE9fYB3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jloyF9O4xU9ocVEzuAoftEvMZQQPcoiEuu7/TgqJB/iHu/5xREfiWjK2lwvJkwUxb0+3NUQEdxzz634T5os9SUrAxCR/9p1aVtNsoYBh6bW5TVlkl6bEzsfIRygnIpSVUAXCcs84Qj8hEtyic7YXmlIxSUEbKpAqXBcOnZbJmtJ2ce1FEHh0uyyCBIm0E4ku3uvM0lwByQ/kyKv4NAfSY7AJ55tBUK7YgvPDor0k9fD0zk+yW5E0w3NgXU+hmTZLKb9pUQbyHDwCYqKi+GkckgdHee9sl/tRcAxVzDnYB08Mhr+vurjVg+sgtxWf3dHvcIEjqN3uUgCVfLjVTi/mcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osRUpGg5bydb3/XhPZKbxL8pe30pQpmnT7eFfH7zx8w=;
 b=fGJo0R6thznG8nhCKOCwuI99cxOsHKIGDYcj032e5QBrAc42w5rjOLM7bpTj+rvBoRsrDVIwQGn+khfZ/2h7ytUpTJTDwK0mmD3F0sNB02v9//51jZQnAmdaMBDjQA+2/m/OTbtV7NwBy5X8Mxui/j2R7eF4tugFD6n3C3Dd/xCjnS9PIt7niL1vZqev3FNjKbyU/DrtWoHIk48ROn/SGQ8wbdmfqWXc1w7lgPL4Jstbo22V8PsZ3/1da448lRiTqDhLwAQ1TwTzLcA1Xhfr+7sXHTDe7hSfvWvVTqtV7pdz0bBOzHjQSHqiszV1m+x4QLDXZilOcPORSybCqz63Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osRUpGg5bydb3/XhPZKbxL8pe30pQpmnT7eFfH7zx8w=;
 b=xDE9fYB3yaHYQrpIs+gA/Gh1fdosLXbwcS7sE+JJPxCctyb+0Eg0R1CtbqPROL8L3vuYo915y7cPSLSJ5qe2qNKe40UEK4SWWtQR7j1JS7GMgCI/9IprJM7Pq9hgTW4tC8CPw6p4WXh/n00jjTqGJXrm8umW7aH8AigxLhA+Gbk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DM4PR12MB7525.namprd12.prod.outlook.com (2603:10b6:8:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:26:23 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 17:26:23 +0000
Message-ID: <8f80484e-5c74-4d2e-9265-7807df49f186@amd.com>
Date: Mon, 21 Sep 2026 12:26:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix a few Sashiko flagged issues on AMD_HFI
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260921170411.1149960-1-mario.limonciello@amd.com>
 <d70bc046-49bd-79b2-7df7-57d79046c507@linux.intel.com>
 <92a0c8c3-3db1-4252-9c84-9a91ca8681c7@amd.com>
 <a82ef9e8-7c71-0638-bf2f-b354a1ec62c6@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <a82ef9e8-7c71-0638-bf2f-b354a1ec62c6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::10) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DM4PR12MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e1f8bae-0099-4324-082e-08df1805753f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	dgZSeTJZN2MIShbwMqi5MU/RYJPUXGXggLbrfbPYLmL6KnJwEV6E+n+QtN/feRgBYF0u/vOqcHquQXr6MPobIHUdDiDHAVQ1mJppBSXnBYObZvsgOSqJjLvW3uLAQg3mnA9X/IVzCfHakDs4JczxMaFAbgZ781wlnHU0zIplIq7Q1GPim2wtoTvi9flR/ZDjGoGGBjCp+zpmdxlG5iqhlsOYaMpk0eiqkItomgZEeB8ZZ/2aEqrQW9URKz0eeqD1r4spksSXd3mntwUQK5a/m1nL1X55sXb+KkautqH7jgLP+JmteuyouRdfCbfCb1htp/8outr3TElUCuSNVGJeJOjkER4g+3heirhYhSkmcZLbWUQJSmCizpysu5qZePmk69i+nQzN1QfQYr3ND2LkqW8SEKKvstdVMBBg9wON+sQm+R9waYd6OR5o0Xh62582xZzOQWJS0BiJbUg7A6/lfbiVfyS09SJpX5SQK174XuUPQgB6GzdawV4vUIJ8chdW8dD9rF0NP+AvKngH5B3yGRCGTOYrPrtdK/DyGlx10t8YU28eeTGR28QE+PorfrkFf7rSxhlY3nXSUeW4vsh4xDMUzBqIPFNatbVfkjzLD6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3RPeWJGU1kxVDRPUDFmWGhIbVZGSVZJK3R1TEp5MzZFRXZrZ3UydWZpL0dt?=
 =?utf-8?B?YU5CNDZoSllHNjlYSzlYclY3NzZNYU92VjBCcWNCbTNpZ0w0bEtVZnFVQmpk?=
 =?utf-8?B?K250Z3FWb0RCdXQvSjY4TXMva3ptWnpkdUdkeEhJNHJiTHhTN0xKV2RPWEVX?=
 =?utf-8?B?ZThYallBNHlmUVZ1VlNVMXRwMndLbVNYcUNZR2F2c091MXIydlh1S3M5bjRk?=
 =?utf-8?B?YmpNK21RSlBDMHd3YXNpdWp1QzBuelI4RUpOWUhQWjViNTVYL0Q2bVh5Wm5W?=
 =?utf-8?B?M1BidnFRdENBT0dja2VnWUFEQWZsOXdwa2d3KzR0RUIvYXY1ZzF0VGhiVDBM?=
 =?utf-8?B?dXhmTTlYNm9PNmQyajZHaTVnemFCb0NwSnl2VnhjdEIxTzRrdHNyc1dlWEY5?=
 =?utf-8?B?U29lZTlQZ0pwbkVhMUo3MkF4d3dhcllDYTdZK3FpeFN4ZjI0ZGxHTk5hMFlQ?=
 =?utf-8?B?L00yTUlKcFBEb1ZVRU0xUjNGRkRGNUV1bmUwbzRKa210Nk9raVFJVk0rMXNV?=
 =?utf-8?B?Z3d4ajA4aDMyRG13S3RpUDdwRVhIeDFQYjVaeUkyT3FDZTdrb0t4c0diaVNo?=
 =?utf-8?B?YVQ3bTdQUmx5SkZhM3lESjFkODRpc0VVNXlWOVc2cjhubWNXRFBxUk1SQ3cy?=
 =?utf-8?B?eUFFTFd4cDdSbXZhMVVzWWsxS3JUN3NQbUpyU0tIZnViNDV5WkoxbStoUkVH?=
 =?utf-8?B?RGtaT2RWcHYwWVBtbjBidCsxU3dpVGpKS0tjZUhDTVJJR0NSQ0lzZmFxa1l1?=
 =?utf-8?B?OCs0SnR6RC9TN04vTGhGUDNXaUEwNCswclVObEpqMG04UDJqaGFMZVZRRjQw?=
 =?utf-8?B?bmlwZlQrc25mTEhEamVWTEtZNUhqVmJYOHVZeEQ4RDYzQ1lPNU5ucFdtb1di?=
 =?utf-8?B?bUw5R3BqcTl6OVYxN3JQdE53QWdBU0F5Z2dnZFdSSmFvOTB3L0xxbmJxSnUy?=
 =?utf-8?B?V1hiVlR3Y1M5L3FMbEs0NEhRT09kc3NDNmlVZ3Zzd0xsQ0dvUnlGNGdqSUF6?=
 =?utf-8?B?YUdKcitmZlZUN1NxVmNBWk4ra0pVc05EL0tvaUJLdGp2cEZjMWVUelllN0xD?=
 =?utf-8?B?QTJHNm9TYzVuNjFISXl2T3pxVm1wTjJZMXBFM21SVUJpSXd5TnZUTTZxa2I3?=
 =?utf-8?B?US9HazluQjJQdlEvSWMyNnZleW9iY3lHYnRvanNKdGR5NGIvQVZrNDcvUUVj?=
 =?utf-8?B?eTFYTWt5bHlpUmM0OW9Jd2ZpV1hFcWljaWRldDZuMmg4N3VGUWI2ZlJCUjdB?=
 =?utf-8?B?WlZQb2hBUEhpNmlXZGt5d3NYVWQyY0Ivb21hN2tUTEpwNDhYMThIb2M1dDc0?=
 =?utf-8?B?L2ZoL3hQSW9ZaEpBTXdkWXV5dnlVSlBTV3ppQlUycC9IVUl1dlBobUNLci9h?=
 =?utf-8?B?aSs3RERUZGgyaGM3akFwN3ZXMkVGVCtZL2JacFRUM01KM3FCTWNldU1vL0tG?=
 =?utf-8?B?MXBPU1Zoc2VYbGRGdHUxcUFaOEFGRTJKd1RjVU9hdVVwMnh3TjZvbE1DOGpI?=
 =?utf-8?B?ZGMxWFV6aHByc3N4dm9DbWNSaW5sZUl3d0dMaGxma3NqZjhXTmpiZlpiM1BS?=
 =?utf-8?B?SWdwUzVhWGxsSTBOR05kU3ZlNFk4dHQraVF3cFVKMjdXYUNQc1JJYjhndkF5?=
 =?utf-8?B?MWtDWGFBQVlCZzFTdkFZMkVOTjd5ZkJmQlIyZzlxL0tsZUREeFc3R0dEZ0dJ?=
 =?utf-8?B?YmFQbXlBd0dValF1S0VBd2c3Smh2NVRVWkx6T1FrSWVoejA4NDRnS3lNTEQ5?=
 =?utf-8?B?alVUa0szbmw1YWpHaVc1NDN6MXpnUnBDVFRVOEhGejlsVmpBUVNScGN6SVZr?=
 =?utf-8?B?akcwS3VORGNiYXFYT1BVSTB1Q3d2Z0w5eFFlSytHUGRNQXQ4cCtoZ2QvMEUz?=
 =?utf-8?B?R2xhUWJpd1djWGFxc2tacTJCRm9Kb2tyMmw0UnNIWFpEVVlmRm5QaDI3Y1Iz?=
 =?utf-8?B?ZmwzK2RpMmpTdTBhd2xNV3JZRlVZOWdVck44TmlHeFV6Y1pPWTVvS0JrcGJa?=
 =?utf-8?B?aEFqSWZ0OFJVK2FRVXlWRm9uYVkyV0tkSVcwd210djVhc0M0TkpQaERkUURF?=
 =?utf-8?B?T2F6NDlNV0I5OVIydTVrcG9IbnRUNUM0dHF3Q05ScS91Y0piNFNyZG1WVFRY?=
 =?utf-8?B?UnpNUXQ5Y2lsU2Q0bE5KM0ZoaGV6R1lCVzFEWVZyRWJVWjA1bnQ0MTgyK2t5?=
 =?utf-8?B?RVVRbmNlK1pBOXFNdzBhOEVVbkZzZEJMV1VIMmhRVmZsbUN5MDN3YmZUUCtw?=
 =?utf-8?B?Z0tQNXR0VkFwa0FOQmhNSm1rMFAxakpVVC8xWVpkZDFyK0Joak51SGp0NWw4?=
 =?utf-8?B?YzVsakhvK2QxenVLVm9NUUZma0c4M0RKWEVCODExVWRiOTQwUi9ZZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1f8bae-0099-4324-082e-08df1805753f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:26:23.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpYeapmm9A0mEgG15bJq/qcHCi0RzGMIw2vFo7oAm20Ombz4dDoz7z7/2KuQXY/KCPVTvUH1efs2lfmuNJPTEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7525



On 9/21/26 12:22, Ilpo Järvinen wrote:
> On Mon, 21 Sep 2026, Mario Limonciello wrote:
>> On 9/21/26 12:10, Ilpo Järvinen wrote:
>>> On Mon, 21 Sep 2026, Mario Limonciello wrote:
>>>
>>>> Sashiko flagged a few instances that could trigger out of bounds or
>>>> use-after-free.  This series fixes them.
>>>
>>> Hi,
>>>
>>> I suppose it would be fair to credit sashiko with tags.
>>>
>>>> Mario Limonciello (3):
>>>>     platform/x86/amd: hfi: Fix a use-after-free when unloading the driver
>>>>     platform/x86/amd: hfi: Fix out-of-bounds reads when parsing ranking
>>>>       data
>>>>     platform/x86/amd: hfi: Rely on ACPI enumeration instead of a dummy
>>>>       device
>>>>
>>>>    drivers/platform/x86/amd/hfi/hfi.c | 34 ++++++++++++++++++------------
>>>>    1 file changed, 21 insertions(+), 13 deletions(-)
>>>>
>>>>
>>>
>>
>> What tag would I use?  The Sashiko URLs appear to be private (or at least I
>> need to be logged in).
>>
>> Something like:
>>
>> Reported-by: Sashiko
>>
>> or
>>
>> Reported-by: Sashiko
>> Closes: <private-sashiko-url>
> 
> People have used:
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> + Closes tag
> 
> For the publically reviewed patches, the patches and their comments can be
> looked up from https://sashiko.dev . I'm not logged anywhere and can
> access at least those urls just fine. But if you for some reason cannot
> find a working link (w/o requiring login), we can just leave the Closes
> tag out.
> 
> 

I don't actually know if the URL is secret to me or if it's just anyone 
can sign into Sashiko to access it.  I'll reply with tags to each patch 
and you can decide whether to incorporate the Closes or not.
