Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647CC1BD4E1
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729692360; cv=fail; b=MKI9JBfYOxc+x973YvpvpfEt9lLa9+bPNtwh9W/83FnnjksAPpbgJrTcumkfV4fDQOlY3TVi5PS02NhVoPNbbA9cKRI9iFGNWbCkx2pE4gWTEg9OXqZ6vLAZ4Hd7mcpHOFxRSg3FV0uChcOB3AMV1A+zAGuR/uFLaX9D9+Gfde8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729692360; c=relaxed/simple;
	bh=WS2AozbOS/a4cXFnz1LHPoy8Yn23xtFcdtAWKYhI5AI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KsH++1ObiTO5Zyjhxz7p7tDCS0jD+dHkOtKqJxSjKlAqekVP/NqbYc0by1Tf3ZFyu6ewYXZz17bSOMNXmCordF1i22jkuhzxmyuO9Ax968Gp05DOTkqjyUN3cjve4PAkWVbM9NM07CDp5K5EHwfMEEeLl+2NsiAbsXPPJf6Mx7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tVmYvW4g; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tVmYvW4g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwRyGUEzyyHbq/37wwvQdV1dMh1Wjhd0Iad5nOegVIumZUnWKjT1kGH2bYTp8HvsqxF24uQvdMzmdf346wNdUlJJI1qrmurlvGR3P8aipl4Uuou3qWlF3OEQ/4gmfQpWFbEBtRFCztpBcZhmIEaEkMGX012vpf4lWolEXRZ+LJ7ojOiSjmAR3OWoto1rj4IdogifrjGjTfej0tDs7oYDT3S1Myi0DD4GSPyWvipvf6HnsPquVrlJpJaK0DzGzxl2JI0XZ3ZVMwmo1wJKPSG3X7Xx1cgScX+jLqQfS5BrDzIiCU1LKJHt24kPHtHsl95M5T9lLIWbcLF4NO8inP4ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R59somQU1Nwc5LUUYe1azIygefqNhdb47IbLA7VNSgw=;
 b=GVp3mZ3yi+LmZDYCSp0OPcOewAx6LS4qfDxC5kD2lsCYl2GqJydexu/y2FpLqkVW7nzw4nqmbaLY6Usm6SKe7d34OXShw/Fs//nDOae0eYllRvi9p2RGV1JG8JXCZY40oPiOxMN8y6onfMsZM9c0ItCa7jdnGdJAFr6f15QLHINEoTdV0JiClFcSslkmw4whg68mKH7e8IUnM4zEwPDELnhsO7aBkxsEKcvxZKwaWs8d7jawUlxto1CCg6VPHjRjviLKZwoC89m4KMfaeqZIJqeIt7X1nL+1/y6WUz9TDs7cuh2n6bDUv4yTBqiwSiBpMNVlnn5QbhLRTeyIJMS+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R59somQU1Nwc5LUUYe1azIygefqNhdb47IbLA7VNSgw=;
 b=tVmYvW4gCksIOBql9d73NThfh9ViP7mSV/FVL78UAsKS+92l/AN61RehUb7VDr53DnytjAmvMnioLjiAlZvEK8vmWKfD3st+VqbQPpWUqeZjH59QUBLp3ggGiBIyn7HYgXO49y/lF/sv8mxMnJAByASUDRhQt5FWaBvqqzpapl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6705.namprd12.prod.outlook.com (2603:10b6:303:1e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 14:05:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 14:05:56 +0000
Message-ID: <759f7fb5-8ed3-448e-a013-be37f58ec850@amd.com>
Date: Wed, 23 Oct 2024 09:05:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] MAINTAINERS: Change AMD PMF driver status to
 "Supported"
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-4-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241023063245.1404420-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:806:122::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e89f3e-9b3a-47d5-50db-08dcf36bd01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0pIYnBDME42SS9pYld0dHBMMnM2M0JMTUY4cXQzd1VibC9QckgvTGk3RVhM?=
 =?utf-8?B?VmZRZEZtNWt5QmNzUHVzM3hLUHNuNUoyd3hjSjVYWXBSMTBORlkwYkcyanNP?=
 =?utf-8?B?Q25qbnVlZWo2SW1DMnhoRDJjbVNYc2RxZnpVQWQyazU2ZXpVcDlEekc2Q1Az?=
 =?utf-8?B?V3JudXUrS0haZzJBc3ZxbnVpT21BTDRwakdjcllEckU3UXB4NXVMdXlHQnY5?=
 =?utf-8?B?dnNEb2MwYlJnTU5YdmZVZVJTaGYxYytma05PK2dyS0ZLdXBPOWRNN3hxM3g0?=
 =?utf-8?B?TXZRdllmbVhiQ3FRd2ZRR0NxdWcxZTFKaVlpWm9zbVhCcnFES1BsUWZ5c0ln?=
 =?utf-8?B?a1ZQdUhWNmpkbFZMVm4vMkdOVWRENVdsbUhzTDNKNXdsd0JaZE1odXBHSFVY?=
 =?utf-8?B?UnE1aVAvNnFxcGZKWTd6eEdsUWVVZmMyVGUxazhOSlptWTJLV2UwcmlZdFNC?=
 =?utf-8?B?OVN1TG4raXZvS3NVZHVtUUNqRmJaVkYyTUtqaUdXY0Y0aFQxUGxQU0Fvb2s1?=
 =?utf-8?B?RnNoSW1xQ0hNeDljZFFhckt3Z3hRRkl6T3M5a0JLNi9zekpHNW50VWVvVk5m?=
 =?utf-8?B?NTN1RTVoNS9pQU5QeUdxYXlaZ201enA0QTV1aWdkK2lJdS9CYUwzdUZqVGRm?=
 =?utf-8?B?RzNWU1pGQytReXBXOXlabVFvZXNEWVZzUkJwL01Oa2gwbWlQK2FVTjRnOUtP?=
 =?utf-8?B?TUtGYVJJN21aNnhNOW9oazVHSVlxOURLTlBjcVp6UXEyOTVDaGFGczNVNk05?=
 =?utf-8?B?aUpXemRJQjdaeWtlN3c2bjBOd3VtQ0hHZHpIVUdQU2JvWkhYU1V6T2pFTUwx?=
 =?utf-8?B?c2VUY1dsZjdyc05DRm4wY3JudjM0U282TW1FVE50SFJCS2FxTmdxT2dJUzcx?=
 =?utf-8?B?bWdLWkdkcjJnbzdiSmdDUTBOMllUbGdvRGZ6WWNMdUFydjBicW5mazFNR0l6?=
 =?utf-8?B?NVpJb1AvcjZDSCtJMjlqU1dWRlpkU0Y0VWpTT2dCaWt1Vy9YSHIxM1Vpc2lM?=
 =?utf-8?B?dUdqaHp0QVZHOXlzdWU0VHhvY2RxamlNVmg0OUlIUCtzcmxsN21VUk1UeDY0?=
 =?utf-8?B?ME5VZHNDajJ6TlpYMnNId1hIazlCU0RlODRBemV0WkVFdFRQMmRrU203YUZ4?=
 =?utf-8?B?Z3M0Z3p1RE4xYWZ2UXY5aWpqbVoxeUhnczdnUk9tOS9wTjNQNytQWjlXV082?=
 =?utf-8?B?Y2RkZFJzMk5rNE93Y2ZxUTZ2b1RqcS9tQitHYTFzdlYrNmw3Ym5wWGZvTkZC?=
 =?utf-8?B?bDJkczJjNTdxNllEbWQ3eTBTRUhxbW1uSnU4NzlNU1pscDEybHNrQ1ZhcEp5?=
 =?utf-8?B?ZGpwUi9kWlhiUGwvSFhnQ3V5MUFNdWtyQXZlL1VWNzJXTzhOaTliakpvL0dm?=
 =?utf-8?B?LzRvZy9lc3hlM2RFQm44aC9iRk9OVUhrWm1PMC9OSHE1VmdYYkFWVElXNkVP?=
 =?utf-8?B?KzVkTFUrREhhaHQ1RWFqc3p6ZCs2amVVOW5Hc05NdHFRclNZek5uVzZNSUZh?=
 =?utf-8?B?d2ZXN0ZsYzRYR3pXSG14S1BsamdYRkl4Y1d4M1FmOWtGcFc1cWI1RU4zY2lv?=
 =?utf-8?B?WDJFQk0rNWVmMUoyRHFtcXZ5Y3o5VFQvZjRhVzFrZVZHa0wvbDZQTjNGWmNk?=
 =?utf-8?B?RkZ4dEF4ckpiY3E4K0ZUTjRkUFNMclpxbVdycU1mdnBVQ1N2Q2EvZDI1Y2J6?=
 =?utf-8?B?VDRaK0piTXAvWXRUeC9URUw1bUx4ekRGaURaRmVBTWlPQlNyakNzSHdsZnl2?=
 =?utf-8?Q?q+WtqEgVeHKLDsPRevWnXWZ0hDrwTQItApwCfLV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEY3Q3hhQ2VIRDZYWlNWMU83ZHo0OEY2VEtIU2lzUHZuRXF1MzVaQm1zNkNo?=
 =?utf-8?B?UlNkSk9uQUVLSkhLUE9tTHBvdENURW5VWDVGVzRselh6NC9aRE1nTnlhWG5T?=
 =?utf-8?B?VytsQlNaRHRRbGhMNGw3QXJOK2wwRkRENy9OTVNaTVpLNU0rcEZnVmlpTTd6?=
 =?utf-8?B?ZWlsWGU3ckdFT0prMVdqcFBDWDYxL3BlZGd5WjhUTVdOdW5XdXhEVzhVRXJY?=
 =?utf-8?B?NmZPazhNUXEzaUhhYmVWM1FXb2prSGxUVFk1eG9wT2d3dDFEMlVUUEp5ZEYx?=
 =?utf-8?B?NU0xN2lCcVQzU3ZBU3F6RUlrM3BEOGpuU3l1NTJlSTkyUVRYYk9BMWRkeDFn?=
 =?utf-8?B?U2s2QXJvQ29zdFhUT0V0SVM3T1JCVjAwbkJjakovQ3ZxdU1lU3RiLy9hOVNy?=
 =?utf-8?B?M1VsY1ZKeDVUU1hUbkNLaTF4V1prV0hnQ3EvZnRna2liR05iQ1MwY0lDTHdm?=
 =?utf-8?B?M3pvVTZoelljamdrK0ZQNW5Fcmo0cFBwcDR2L29rS09zUmJDWU1pZllHWmkz?=
 =?utf-8?B?RTBYei85OFk5aGZjQ0lNUjJRbldmR3hvRys1M2xsWXFTcldXWG1LY3BQWjVq?=
 =?utf-8?B?S3RrWUE5a21Fc1F2SEF3d1ZxSTQ4Vmk1WUlBeVp6aG1Rd2poM0dzS3BrdUpi?=
 =?utf-8?B?czNEdjcyOG1ZNnhoWW14NTkyVHYwNEdKa0NxVVFPeVJ2MHJXN2NUbkw4c21U?=
 =?utf-8?B?YTFQMytVbEtXRHZ4RE1KeHRiVE4xSnFDVWh4TkY0Ui8zQW13OHpOK3czclVm?=
 =?utf-8?B?YkpSVFgyRWVLc3J1dlcrMWVLVEIxTCs3dFl3UHFYMFplVzBvaE0wM2pSM0J6?=
 =?utf-8?B?NnNXem5yRXJHNTVVdmJuUmxVTER4YjB1MDVHdklMR3lRT0k0Z2Z0NEhrRWoz?=
 =?utf-8?B?TFFkSCsrMkdxOEtJNUJhMEY0N1JOdkoxZ0VJeUpmM0JXaEozQkN1TGM4N0h6?=
 =?utf-8?B?bnZiWkdWcTV4RExIc2VUNzFKRG5uL0RQbUZFU2t6K1hGbFdjRGhzSWcwWFJm?=
 =?utf-8?B?WHBEZWZRY1pUYTY4elpRbHVhRFByNE1tSXdYckRnanhGUWtTL0hhTXBmK1Fp?=
 =?utf-8?B?MnJkMmYxYUNKdnlRZXhJa0Z3TEYrekIwSWFqQ1ZHYlkwVTdQbFdwZHk1Lzcv?=
 =?utf-8?B?cFpDWmNJTzM2MUZmNmJIUkR2TEpQdTF3bmhIbWgyRUdaZXY1UW1IdWk4VHF0?=
 =?utf-8?B?T2NORnhHQzFYbjhGelZkSVJWVXp2YmF1UjEycmVZc2lxREZJRGRTeE5STHRV?=
 =?utf-8?B?OHVGKzZUR245Zk4rZWovR3FwTTMxbTFIVkptMGc5YXlnbDhZQVJ1dFM5cmNq?=
 =?utf-8?B?VGhGOHRwZGtlMjg1TXJVNmowcjVSUFZrQ2dWUWVZOHNLRFdwS3lGY0p6Tkdy?=
 =?utf-8?B?bURKMVJ0elh6K0ExNXU0WU9BVWlsRGxNRnVPdjBCSnZCditibE9CbzhNV0ZB?=
 =?utf-8?B?UWFTdzJsZmVCdWY5ZENQMjhrdG81S25hNDVhaFBzOStPOVAvZWhUZmdIaW9o?=
 =?utf-8?B?aXYreEx1Mkt3TzJHVDQvRDNXcjZyQkVvck1SMVE2eEZUNjFqdDMydW9Xcm1j?=
 =?utf-8?B?bUYxditPOS9TZmJkRG15QkxiTFhwMDNIRk40Z3BnZ3NTRldQZ0dzeFFadHBD?=
 =?utf-8?B?TGNYQ0l4alBnVzJMWUYyQ3FtUEJYR1NGd1pHSkxidmxMaEtoK1B2MHQvQkVT?=
 =?utf-8?B?SmwzM09PN1J0ZjkwSG1mVmdTYmVJWmhJbEVDM3ZzekxYY2R4Wm1xRFBQd0py?=
 =?utf-8?B?dHFDeEZ6bHoxZHh0QW1CeHlYQUJEV2xCY25HTnRtR0FaSjJ2bHg5bFV4QStD?=
 =?utf-8?B?TVNiV1hxMmRKcFdBQ2RuVDQ5UkQ1TU1LcWhkSEJVempxcm5iYTd5eW1HUzYx?=
 =?utf-8?B?aHArclVIcHduT1dUUDRPQmpmWnVBYjByKzArTkFNWGRzVFRza0FPQmtLWmJZ?=
 =?utf-8?B?b0gyTitKMWpBdnl0UTA0VnRFdHp6WDRKSXAxcjJKTmxTd2t0VU9pZElYM3Bl?=
 =?utf-8?B?cHRzZmZ0QXpGWXlLZVhkMTZ5TXlVZnNrM3lwN0E5a29wU0tPSG5kdm12U1hn?=
 =?utf-8?B?RFAxR0FMMm9QYmZSUGVTQ0lKZ1M1L2xFa2pCRHcvQzNvbmRJNkkxUnJmZ2tm?=
 =?utf-8?Q?NniHzLDSIqU3zqPXyqeTe+prk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e89f3e-9b3a-47d5-50db-08dcf36bd01b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:05:56.2647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jMnd0aM6bv5TSepyXekFp8d63euvKe1cUvLXWHSGuEmdSnTmAAAhzo6Fo2rfIJwf2u5LQdUqegiaTQ0EssYxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6705

On 10/23/2024 01:32, Shyam Sundar S K wrote:
> The AMD PMF driver is actively being developed, so the MAINTAINERS record
> should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
> database to reflect this change.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9659a5a7fb3..5748b251daac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1124,7 +1124,7 @@ F:	drivers/platform/x86/amd/pmc/
>   AMD PMF DRIVER
>   M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   L:	platform-driver-x86@vger.kernel.org
> -S:	Maintained
> +S:	Supported
>   F:	Documentation/ABI/testing/sysfs-amd-pmf
>   F:	drivers/platform/x86/amd/pmf/
>   

