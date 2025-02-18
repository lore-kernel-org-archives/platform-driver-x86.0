Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F1D146D6A
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739890330; cv=fail; b=s8eArDKthRSsXvdPOJ2IT4nF6RKvHdKJoWd4j9nfepBIbxg/GoNiRLpYSpT1+oVKvfQVqHow0swZZkQCcJV1bpurfs8mMUu61juq73XNB6rD3rkKtUYif0QbIXtioP5XGzCBBlInrT1L47ztVyrEyoSZ2bQ/FzmF8fmIqM5kI/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739890330; c=relaxed/simple;
	bh=CMylKXDKpEjqoqg+TLV6/+oDO89GHMBFb2qAgWKYswU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JauMOJcnTq9koQhQATQkwB72NXp71D3m4ba8E8bfiCcZDHukF2yzYKnhxsBj5A63uNWc+pLkdPAdnqYPbBgF2Pa8m4eSBgEQ56NMTyRnqqg1Z3GLB98autQpkGxpANXarRtYdJ0UujrbXedi0zFjGe7HS0N0bwknV1dmThNxYQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c7WgL78a; arc=fail smtp.client-ip=40.107.92.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c7WgL78a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5UxQy73Phko/2sI5V38p+fFR8ydvlGa0ZVKeEdynyPaS6VP1FydBNKTNX2nu7ZWBS9z3lkUkC/WcZf7mSj7RXTfqHjk+VuCFxh+hJhaSewh38hCCUkhypg7zDnkzKyb7YhJ9o+IWd5+cgPyPeD64BBdilA10BgqlBavfKlRz9ohd0VSmO/vfgo3SZGwVnS+zf3OFohcyK0IXf3LNIdbf0hHb3Xo18cgPsdDeJaCm8zX1pXY0Q4mRfwLSAFdg32jt8v2i5nA6ktFmzlGtDId6gJS5vXuCcY9p1gpbFehoZ/eAhkkDtmeXW1lPgwlqIJAuw4PouUp3gip6OGO7WanPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aN2zkmtT/DSGVaZp7ywiwRWGtRa2kEUhhmIjT2Z5eE=;
 b=LOC4pjbfRmvb2+ECfSshHuQqEbuF13CQxR8kVn0sC81ewKKdFdnoYVzq8TUvzoy6Zn7uj6E7mp4D9aPwgOgBSFYxfOuq31oin5V8sFIu6ukNybZwJ2LD+1Ez2VDqluS877ybfWYk4iW+CgULY+v18YdMwDhPN4g+RDQ5Fc/DIRqsyGVw+/gGAFtFs2NZhcDk7LqtuohupXg8J77MjCrZRkboJwEYk4hu5u6/uEMIGzWdkKG/hcIeHSoM8/zHb2AJLDRC1feaZPa1tK1yF2J68G6lZahlQdbP5qmfFsIqeuU33+S+kq0wg3qB8vtYKO7nJt2SLxi8XB91RPYciAkefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aN2zkmtT/DSGVaZp7ywiwRWGtRa2kEUhhmIjT2Z5eE=;
 b=c7WgL78aSWADl3nMcr9NIYABnJl73Eilmcs2OIEW+1GFR3jq5CteIVLSbVnSP/APp4BJU83WQAkOFF6bFD3a/daJfcXd76Qr2ckz4iJo3UrurgHMpDqu5MCx0ZXhC3J1+jv83UzTQp+N3hq1SdP0mXPZveerqB/TG5aEB+jXPxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7594.namprd12.prod.outlook.com (2603:10b6:610:140::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 14:52:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 14:52:06 +0000
Message-ID: <a94c6c41-bf1f-4894-8104-d4af20f25b63@amd.com>
Date: Tue, 18 Feb 2025 08:52:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86/amd/pmc: Remove unnecessary line breaks
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
 <20250217081720.107719-3-Shyam-sundar.S-k@amd.com>
 <14d745cd-6c36-4db1-8605-5bb169f8dd80@amd.com>
 <a6a69151-ec35-48f3-b34d-d9154c771bcd@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <a6a69151-ec35-48f3-b34d-d9154c771bcd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0029.namprd21.prod.outlook.com
 (2603:10b6:805:106::39) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6ad35b-8daa-4e2c-5970-08dd502bd01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXZ0ME5vaWpsOXVaTkltQWZRQ0k0UDlTZlFJZkhhVzBiNWRVMlFCWWRpTys0?=
 =?utf-8?B?QzlKRlZMU0toMFlDY05yRkRWMlVmMy8wb00zTkJDditBZzV4L21lQUQ3ampY?=
 =?utf-8?B?MEFnQllHejBHamt5bzRYaWlWT1hzaS96TmpiTDR6Z2cyTlRNdzJPZUpkRytO?=
 =?utf-8?B?YXJiYi82aG9PMitmUkFDakZXd0NPM2NSc3V1bnRkMEtJdjFUcmkvckxma2Q1?=
 =?utf-8?B?NmRzaU5pbHZmSHFXczlhSkUwMkplS3B1SjVCUHFhNUhJVE9SZTZkeWtidDYx?=
 =?utf-8?B?VVhTdHB5ZkttSFFROXpkNDRpYnlpU3l5VGVJSHU5d0lYK1FVV3g0T2VOWk5p?=
 =?utf-8?B?NlJFblJlYmp4cUNYS1NMaEFUb1VvNDhEY3VkUUcxdUdueWthaXJkUW91amg5?=
 =?utf-8?B?eHYxZkkxVmlEZ3UreGNLcTV6RWVlbkJGb1hrYlhpMGFWVXpNOU9NcWFvLzhh?=
 =?utf-8?B?L0p2TEsxSjQ2ZkNZTHVDUUpyUWYxMHdGMERZay9Fc1ZIUnNnbFN1R1VFelNX?=
 =?utf-8?B?WFpTTFI4N2M5MnRRYkN2ZzhGOVR4d285VE9RRzNMcnh1TmtGQVowM2E1UmFB?=
 =?utf-8?B?YzRGMUJFRzR6QlM2SzBsK2ovbkFMMmpXbjArM1JkU1B0ZE1DUFZ5YU9ldTNM?=
 =?utf-8?B?ZFF1cDVHMkFBRHlqamlZWlpRem5UWFlpeGQ1dFNyUGtodkhNU09LN056ekdR?=
 =?utf-8?B?S3ErVEl0Y2U5VG9zQ2MxdkhYS1dBU0lJVm1HSG53WndCc2JKOUR0MGNBMG5w?=
 =?utf-8?B?dU4vRld5NEJwU1VoQzJYU09kR2xIVzM4YU0zaExGUDhlMFczc0x0Zm94UUdy?=
 =?utf-8?B?RGlzWU5YdnFWdnNzTElnSE5DSUZ2Q1R2VTBiczJtNFYxU2o5emQ4WWhrYUFH?=
 =?utf-8?B?YlVxSThnS3FQa0QxeFBkOHNSMFJ3Z0dGekdpc1hmQks1YzFJVlQzNmF6Rnh3?=
 =?utf-8?B?emE4N2hGZE9WK0owQnJkSzA3RWJmMjFXSjd5aUk0UlZoOUFqNmd4cTNrOGNt?=
 =?utf-8?B?ZWUvWlJlRm85RDBuSnFaK1JxamZpRXFmNzc5NFBnbVdUWDg2QnB0L0xod2NJ?=
 =?utf-8?B?ZzhEUlowd2F0cTg5eUVjK0NLakVBWGJGcmF0RERPM25wS29QVHJEQ3BHY2hZ?=
 =?utf-8?B?N21HYk96dklrbGlnZndzQzJjeFlGTlZsTWlRN1g0MVNBR0szRGtRVlQ0dkFl?=
 =?utf-8?B?UWViTWY5N1lTQUtEWFZzYTg1Y0R4MnZlaXVUMm5ad3o3c2l5cmFaNFRVSnA4?=
 =?utf-8?B?a1lFSDJIWEFTbC9WVDU3MEEzbENzcEE0UE4zV1VOUi9Wc2NYSVZUalMvWWdt?=
 =?utf-8?B?am56a2VsUnFzZFE0di9odTNBMHZFNklwakcveWFqTzlBNTRmM1RHajdvQkFP?=
 =?utf-8?B?VU5hVVowUzR2d3pFNlo2VysyZDBBR3E5SnZZRTcyMlJGNVFzZkhoQ0lOL1Fh?=
 =?utf-8?B?d24xOGRnUlpZd0tRMDRyTU1meFBaNDlLWmhubFZsbVlSNGlCNzBReFhYaDVY?=
 =?utf-8?B?Mk1ZcDR4UTVKWTc1T2UwUmZpUUs0ZjFESWlQTWRQeDg5bkVnSURMSmxsYUsy?=
 =?utf-8?B?bXo1RURXdEhPY2hUSXYzU29MKzRNS2x3dzJuTEhyUlJsN1FkRjRCVDh2NW41?=
 =?utf-8?B?QWpIbjNkdGx4cVQvSjA5Si9YMDNLNFV2ZHZhdjFnQ1Q0TFV4SGJSSEhrMnJa?=
 =?utf-8?B?OERIWEJrd29DQ1lnaDVHV0JKMWk4R21ORjR2blRsaXIvZGdFeWczK0YvUFA1?=
 =?utf-8?B?WVhacVVqOER3cHRxcVlZN1JBMm5tNTNDR3FwUDBiYnNiUzJwbDBqbHVEN2NF?=
 =?utf-8?B?a0plNXdjNHlmWDNjTXVPQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukx6dnNUQ3hNZmNrSGtnQjIvR01YZnhBOXhVaVM5TGFOOGFSWUtVMXRYTlVX?=
 =?utf-8?B?Ty80QXEvK2kwSk5ITkRWRHVaclBzbk80V3lHcUFtOWNCOTRDZXQ5ZndKV0px?=
 =?utf-8?B?U2RpWlZLNERpWk9LUmUzcEI1ZVJyOVk5anBCTWRKaFlLeVRkKzQ4amFROGpZ?=
 =?utf-8?B?Q1FpSnRHdEh3em9MN3RabytrR25Kc1lUMWs4YXBjUmkxZ01US1hGc0lQd1JB?=
 =?utf-8?B?a21rMWsrNjNOemtQeTVmeFNYVTlQcHp5bnhpZUlJcExWV0doMVpIYmU5QlV6?=
 =?utf-8?B?c1hKYzlMVi93WVkzQlliSVhTemxpRFVaMDBNRlRId3VLeS9IdmpieG1IZkFz?=
 =?utf-8?B?L09ucGRBbndZWWZsQnlSUjJzSjQveTl4YTBzZkdsbkVSaldBNjR2RFF0dm9l?=
 =?utf-8?B?M0d2YW1YU2FGMEEyeWNqdnh5TldaTGNKWDF3WnZaSVhrcTV1VGp0T0RPV0pS?=
 =?utf-8?B?b1JnQnZlVVo2TzluTFZMbkl1WU5MV204Y0pUaDFNWDZSMXAxVnk1MjZ3ZkJJ?=
 =?utf-8?B?ZEdaVGNkY1YwWHMxWWVtUkJtTUp4aE5RUG5OZGJnNmJyVHhtQm14TUIrRld2?=
 =?utf-8?B?bXVDRkQyZ1hnbjZENUZKQ3NTUzZ1U1pMZU5nMUs0cWxLQnIzclVCN1c3QjVp?=
 =?utf-8?B?MkZTVEhIcWN0Ymo5RmNTN0wxdmFMNmRGbUN2ZWhkSjhDdjZlLzlORUh2QjYz?=
 =?utf-8?B?RHpXQ0Z3NFVjWWNyekxDWmRMYjRXNk5GdlpkWFViQ3hnd2pNRDMzMnZKd0J5?=
 =?utf-8?B?aWNva0pVVWxkNDQyQ2lYT3ltRDJvV3E0WEw0TXo2NGc1dVBjSXFhOG9PbXI0?=
 =?utf-8?B?SE5TR0w1UkI2a1MzTlBNTzBwaEp0ZWJWZDB6enZNL1RlMW1sT0d6OHd5WEdq?=
 =?utf-8?B?QU1Qak5oN3JRSjdyc1dyN29GdGgxc0U2L3A3bmZ6N2xMeWI2Tzk0Mm9JdnB1?=
 =?utf-8?B?a1Q5R1FzUi80cGlDaWhadFR6WGd6U0MwSjZOMjRISmlJR0VGRmw1cFdYR2hQ?=
 =?utf-8?B?cUFtWk9RTnNYZjdxd0c3NmxrVG8rcTEwVlFBY1A0S21tLzhVOFBVQW1hNzVr?=
 =?utf-8?B?bVV1RTVQZ0MzUGcrRjJCWEJNRjl4bTBxL2tvZ1VRTWlIMDZZbWtzK1B5WW1D?=
 =?utf-8?B?dWRYTWZBamhESWZPWUZYeUR3QmRjaSt2SU9IN2Z5QUJKU1A4VEZZMldzclpG?=
 =?utf-8?B?MTlxdE41YWYycjI0enovL2poblJlZlBxWHBWVEdRdnRHY2IxUHRmZVh6M1NT?=
 =?utf-8?B?Ni85Nm9tMjN6cG5nN3dyNDk3Wjl1TlkzZHE2NkdzNTE1K2gxKzVQRmI0SWdR?=
 =?utf-8?B?b0luMXJjTXA0U1BRU09LNGM2d2w0UFJ5OS9yTUZUdWlXRmE5S2JuVUI1TThp?=
 =?utf-8?B?bjNUdkVwLzNoQmg3VCtqbmMyWEdsdlNZVWRFZWlNT05aZFJIMkJudG9pNVZU?=
 =?utf-8?B?MHQ3MHVUcTN3TWtMaEtPTVl3MkwxakgvM0FueEp4TmJBdVJ3UWpXUGg1Ungy?=
 =?utf-8?B?Q0JCS21OYm11cjBSTGxGVDdUNTVJSFBFUnAwaG5Ob3lPdVN5eFlRS25GM2h3?=
 =?utf-8?B?K3NOZ0Rnbjk1OC9lMURVeDdCdzJFemVoZlFZbUUzdng1WFdkMTJ3dzZCRTdR?=
 =?utf-8?B?c1J2RGNjRVY4MC9FSFRCSzI1UTlIc0tCU2tNN1cyRkxlSDRiYXdvM2lmYmlS?=
 =?utf-8?B?TVBrb3BzU1lrYU5GTFFwR3N3MlZ5bHJoWkZsM1NlYkJVWENybC92cEhRaXBk?=
 =?utf-8?B?dXFVWGpqMXhyRyszaTgzbGJNaVI2ZFBwRDRtdVVBd1ZDNmhkM0NSRENYSEEy?=
 =?utf-8?B?T1JnbndvQTlQRVZ3MkZRYitOb1phdndrNzdQV2M1c1JmcElnNEFSbVluMjA3?=
 =?utf-8?B?QjZCR294N2lod2lFdHh6SlRHQXJodFhtUEVRNVBwek9iWnFzbFhERUJrQXc4?=
 =?utf-8?B?YWRwSEtsdm55aGo5SkZra0kxZ21nTTBtWlNIakpOQ2dLTnFNN0JkbWdoL09H?=
 =?utf-8?B?a21xeUdlU0t5cCtOOGtGOTVISzgvTnFpNVh5Q29hQWNINzlJQTVtc0lIcjZD?=
 =?utf-8?B?WDdzVk1xaXdpVkw2SXdoZlRzdER5aHl0TmtVbm1LeXNXa0JTa3o2RURMblh3?=
 =?utf-8?Q?ijtyodEwVmYE4USkrECaz9INO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6ad35b-8daa-4e2c-5970-08dd502bd01b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 14:52:06.3465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIuwjok8L7/x478A3H+xchTXRBKAiuRmNT9p0YKJpCAaEqZ0qIsA86QO5JgwFqI0CEvy/7GZG2Ah/yD94z59Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7594

On 2/18/2025 01:08, Shyam Sundar S K wrote:
> 
> 
> On 2/17/2025 21:08, Mario Limonciello wrote:
>> On 2/17/2025 02:17, Shyam Sundar S K wrote:
>>> Enhance code readability by fixing line break and blank line
>>> inconsistencies.
>>>
>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>    drivers/platform/x86/amd/pmc/pmc.c | 7 -------
>>>    1 file changed, 7 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/
>>> x86/amd/pmc/pmc.c
>>> index 742920530987..d80a5b899a1d 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>> @@ -168,7 +168,6 @@ static int get_metrics_table(struct amd_pmc_dev
>>> *pdev, struct smu_metrics *table
>>>    {
>>>        if (!pdev->smu_virt_addr) {
>>>            int ret = amd_pmc_setup_smu_logging(pdev);
>>> -
>>>            if (ret)
>>
>> Does checkpatch like this?
>>
>> I thought it has checks explicitly for
>> "Missing a blank line after declarations"
>>
> 
> Not sure what is meant by blank line after declaration in this context.
> 
> This change is mid-way of the function.
> 
> I did run checkpatch again and did not see any issue.
> 
> total: 0 errors, 0 warnings, 0 checks, 49 lines checked
> 
> pmc_v1/0003-platform-x86-amd-pmc-Remove-unnecessary-line-breaks.patch
> has no obvious style problems and is ready for submission.

Here is the specific check I was expecting checkpatch to throw:

https://github.com/torvalds/linux/blob/v6.14-rc3/scripts/checkpatch.pl#L4118

I had "thought" the intent was there was a blank line after declaration 
no matter the scope not just the start of function.

> 
> Thanks,
> Shyam
> 
>>>                return ret;
>>>        }
>>> @@ -222,7 +221,6 @@ static ssize_t smu_fw_version_show(struct device
>>> *d, struct device_attribute *at
>>>          if (!dev->major) {
>>>            int rc = amd_pmc_get_smu_version(dev);
>>> -
>>>            if (rc)
>>>                return rc;
>>>        }
>>> @@ -236,7 +234,6 @@ static ssize_t smu_program_show(struct device
>>> *d, struct device_attribute *attr,
>>>          if (!dev->major) {
>>>            int rc = amd_pmc_get_smu_version(dev);
>>> -
>>>            if (rc)
>>>                return rc;
>>>        }
>>> @@ -704,7 +701,6 @@ static int amd_pmc_suspend_handler(struct device
>>> *dev)
>>>         */
>>>        if (pdev->disable_8042_wakeup && !disable_workarounds) {
>>>            int rc = amd_pmc_wa_irq1(pdev);
>>> -
>>>            if (rc) {
>>>                dev_err(pdev->dev, "failed to adjust keyboard wakeup:
>>> %d\n", rc);
>>>                return rc;
>>> @@ -743,7 +739,6 @@ static int amd_pmc_probe(struct platform_device
>>> *pdev)
>>>        u32 val;
>>>          dev->dev = &pdev->dev;
>>> -
>>>        rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>>>        if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
>>>            err = -ENODEV;
>>> @@ -751,7 +746,6 @@ static int amd_pmc_probe(struct platform_device
>>> *pdev)
>>>        }
>>>          dev->cpu_id = rdev->device;
>>> -
>>>        if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id ==
>>> AMD_CPU_ID_SHP) {
>>>            dev_warn_once(dev->dev, "S0i3 is not supported on this
>>> hardware\n");
>>>            err = -ENODEV;
>>> @@ -767,7 +761,6 @@ static int amd_pmc_probe(struct platform_device
>>> *pdev)
>>>        }
>>>          base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
>>> -
>>>        err = amd_smn_read(0, AMD_PMC_BASE_ADDR_HI, &val);
>>>        if (err) {
>>>            dev_err(dev->dev, "error reading 0x%x\n",
>>> AMD_PMC_BASE_ADDR_HI);
>>
> 

