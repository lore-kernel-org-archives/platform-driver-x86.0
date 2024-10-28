Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08441537D7
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134113; cv=fail; b=kKPaMy6+vcYfiZBpHy4z9Xv8ckprS97CoFB93yeeCADusdjjDIdVeWX6W5FrptPf7BXFBTCvQyIbMrd7OCZTBHk4TYAKAlMG/2K0+PPqHEvDZ0/CDUWW7XTla4AKs3furpnZb0LfEi1zHMS4G32Eii/ghUrAUz5RaeiZWcIotxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134113; c=relaxed/simple;
	bh=P1Ysufg80xVbS7Q5w9TsL65CLZd4C+mWUZVTLrqHn4w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MTbEemaSnBIhMrh+A1P1SGDQrSXy0TbD8F4C5Bc0O53UwUIZg5cXrNdAsGwTbVj731X759ZDj9jZuM+GF+MZvqdBirxIkoaXnE540sKTuYW/sugn2d5GR6JBWqTqJyjfmLkJSe0sXU3kcsXViusDu4EkuR5LTtmSQ0JAyOXe0cI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G7JR66Xa; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G7JR66Xa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiJyiZS+Zh9d9rVIfobnWS69vMVLprv+bXuFUBWBiHHKfjWSKnUX6bvfxC0/EMKfPv30Ky2rtVvskEcUobk0WnXTM9DPrGmrByQX/vVpGwp8/bstyXWVqUxdWsLKcwEpANkVuzgy8OaNIJQ+CuKdtHsZoBPW97rxBzioIy+rvfM2WvYbGD1CdKZ84MJRp4VCYn6HcZC6cwxho0G/PxNDXs93Jj63iVq3oma5ipCIasAOlBEWyIP2fwwKqGVNpnX///ezJrhxgXEnBEr2A82nAYCZjNVG7xTw3Q5NZORW2t7ttfUD0O6dz1/X6oCYv+bCP3obcaa9AHdq0Dg9l3UNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L0/mvcoiRP/r8CpRqfHIT/CMVM4U+n32uS2gzT68/4=;
 b=zLAgc3YiHIXmF6xnV9IKlTTG5+lCSX2kquehQr2NfuUZWcanNpMV2LbnqytFoUORrmxpx98M/ztP9VlwKbPtOKt8uFhVSwrs4t+VKJ1n3RTV6tSPdYFiPIAAcqA9e14gEK929moQwaQd8ly9LVNfrWVgowu3xVlD4+rOAcYTuLk2qhikXfVr+7KRf6xzfoamObCD9NvjAcq1MZsDMAhoDjwhOCWzMx+1fj/xFlr5SaMkS45Ra7yNJQhMUrFnxyx2/M4JIbqNxVgUfo4H2+xCBiumSe5xGFxfbR5STIVwGdqE5KETciM0lGjGuxXX/vr3nA5xqG4K7eGCxkK4520ySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L0/mvcoiRP/r8CpRqfHIT/CMVM4U+n32uS2gzT68/4=;
 b=G7JR66XaA4CR4cVQ+KshQ2vclj5skayhJw/dtPC0hae/u7nlZ5VHtm8xjCKVzmS5ntrt/CYse48V7IvQ5ReiiU+6cXgu8LHA2Yw52j5sJ9rVOEAVQgLdD+wdWt1PaRVEjwVX4AYzyau8huuu7LaXqF+92+kTt0UlLXRsEPaJUjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6692.namprd12.prod.outlook.com (2603:10b6:806:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 16:48:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 16:48:28 +0000
Message-ID: <da7c0e2e-27a3-4278-ba6f-bf93dc1e124a@amd.com>
Date: Mon, 28 Oct 2024 11:48:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] MAINTAINERS: Change AMD PMF driver status to
 "Supported"
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-9-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241028070438.1548737-9-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b1c48d-ef50-4d71-bcc9-08dcf770590a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmZtNHBrS2h2bVNFQ1NuNVBqMlc5TjB5eUtpakZEMUxSNTFkd0lXMnhZK2dP?=
 =?utf-8?B?MjBkN1N2TXZ4c1RReEtKbGZCSUxRYVd2ZzBVNWI3YVNyVTRFNDNZOVB0bE53?=
 =?utf-8?B?ZGNDZ1NFTUJUYS9HMXYrVkREc1hsY3FSaThPOHJhMERrZ3hjQVNrdGJjOTY5?=
 =?utf-8?B?K1FZMlo3OG1BYm9rd1JVdFJ6Nmc1OEZ2SmlSLzgzbCsrdks0eFQ3NlQ0aWVT?=
 =?utf-8?B?TExYMW1keWk1Mk90dmplb1pQNW5ZWEhjajNyRnhvWVRPVjJpc3NPeDUzUEFJ?=
 =?utf-8?B?NzdpWFozRXphWVBDTmxOa2FJMFZjaDg4aWVEbWNFaHdIaTNTblBuRnBlSG4x?=
 =?utf-8?B?SXhiOEJ4NFBuZ2F0YnRxUnFoVmpaNDZkU3Y2WFRrK3ZQZzh4c3B4aXRwNVk4?=
 =?utf-8?B?UzFRdHo5ZXRGNXozUC9rNlVYZkF5TlEzTzFlZ2l5bjJnaGxOMWxPVmNaYXJH?=
 =?utf-8?B?UENicm5VclhLbG80bktBelJTOVRCMzdlN09MNENRQ1NYS2FVandlWlVwTGJs?=
 =?utf-8?B?TE5NZEc0SkErQlJmMWN0SjFYQlUvU1dsYVRIZnZ6K2ZMSFVpRUtZNzVva3BR?=
 =?utf-8?B?T1dpMXZpWlVLMGRlNkMzZDRyaHRPazQzR0daM3crMHNRazRsb1Y2d0VjZkhn?=
 =?utf-8?B?WUNGaHZCckgwVm41c0pVbzJXazRiSnlZdjZJNW1UZFo5Y0hKVVVWYzlBZ2Fo?=
 =?utf-8?B?V0Q5TE5RYm42cUJKWHI2SmVzNHBCV3BsbGg2OFNpRXdBeU9SejNZakRPUFlw?=
 =?utf-8?B?NUVxUTE3VDA5RDdPRGFDODYwQmxaeFEzOHd5QUhEaXdSMmxWZ0RKUmxYUkpz?=
 =?utf-8?B?ZDBBRG9pVndiUjJXd0tXVzdkclJHRkV3NlorZElQK0JKZzBnZjVvSXIvbEdL?=
 =?utf-8?B?Tyt5QzVTQlcyUFF5d0h2YU8xMjVET1c3akMxNW90QnZJeHNrZjJ4L3FQWStQ?=
 =?utf-8?B?L21LeTN6dXJNQ3dlY3JldlR4SDhoL2ErUGt5dFRpd1A0Y1A2WHQ0T3BuUGFa?=
 =?utf-8?B?Slhnd2R4eUtMMVhOZEZpMzFDWnlWNnJPK3NqeTZxSVU0R0RhWEpUZERSdC91?=
 =?utf-8?B?Zk5WT3JhbFlxajZzRUdGY1pDOU5RU3Eyd0V3NUp4N21tWFhtRkxtaDd5NFJW?=
 =?utf-8?B?VzQxNERyaHB1TmhuQ1p6Njh1a1NVRGUydGVTdzduWXZzQWFZL1dKS09WNHQ3?=
 =?utf-8?B?TWNWSWNkNzk3SEg5dS9ibnowbW9uSEFZQ1dnRVFGbE5PdFBhRHZRRFdhYnJO?=
 =?utf-8?B?YUJIY3pLQklPb0U4bUk3L1FzakZYUk9ZY1F0Unl6SGdXZ0Q4RWZ5QVlKcFE0?=
 =?utf-8?B?S1N4MGFrajVoK3loSHlrS3BuaGFrSDhXNjdkN2tBOE50WFRLNmdUcEhLcm1D?=
 =?utf-8?B?QUJOWkM0SFlKSHBDRTJEcTRwY1FUNEFQcW9IeHEyVU1TZGpGcVlEa2RiWHZX?=
 =?utf-8?B?V200RkZrZzMzWFkwaFFaaTYyTDZTLzRKbHgyQURxNExpTTI4TWd5c0VaKzJ0?=
 =?utf-8?B?ckhSOE9HWkl5VEFid21vTWs5MjZWNG5Rc0xNMmd1WEJGMEpWMGVHZGEwTjZO?=
 =?utf-8?B?cmF2aWVXUkNNdUxPNEVxcDhRaGZ6eG9nYjdQYWNPczU2YXVNR1cxOWdTbWt4?=
 =?utf-8?B?K3ZUTzcyWTk3Q00vRjJlZ1h1VzB4OFlIVld0WFA4cFVvZnN2V1ZHS1FBKy91?=
 =?utf-8?B?WHdZdzlhQUd1RnlsY2l2cEV5S2hzSmtGSml6ZFZoc3d0QlJrSW9tYWdGT3Bq?=
 =?utf-8?Q?fHkc5ND9Um1jU6aHvsJDD+B4N533INQMrDQ8byW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dldCWGNUZE1ZTk01UU9lQ0VYNk80aXo3MHA3SXJmaEpaazRsMVhtdXptUlBW?=
 =?utf-8?B?MHVZTzc5eDY1MjRJRkZTUTV6QUVIK2ZXVmc0RWFSdUlYUTZUZ1ZqZm9CYlBU?=
 =?utf-8?B?U1NOUkVjQkRrMDE4NTBIT1JPeWhuK3d1M2N4cU1VL2FFcVVyelI0ajVZVkxI?=
 =?utf-8?B?VVRqYTdMZEp2a2YzZHNXK3hpN2lUeWFnMzhoY2hseExxK3FLMXVnVDVsZFpa?=
 =?utf-8?B?bzd0RDlxUUFacWd0MWo0S3dORHQrejV6L2E2RDljZEx4WUQ3MGtZbVNtbWoz?=
 =?utf-8?B?WWZBbkxvSG5sUzhPYjF6Y2NBOWV5MkpkNnZnejZyQTBBeERzUDhGanIyYUJl?=
 =?utf-8?B?L2FibFNPL3pjL1c2eGlnYmpZUDZtQ1o3Z0xPOWx5dU4wSW9KZXltb3FqYS9D?=
 =?utf-8?B?T1ZiMkdhWDJveWFzZ0hqSlhoNW9RQXRDYlNnd1lWK3NlblFhODJEcDFHcUxQ?=
 =?utf-8?B?Y0kwMFZvL1hvSFA5RFJpZVVzRG43VU5xbkc1aGt1R0RpOHg1aFFCTFdYWitv?=
 =?utf-8?B?N0JBSzhpVGxieW5WanNsWFZ3R01zdzIvbVpqaVhrS2NRYVI3OE1teGNXbm8w?=
 =?utf-8?B?WVRtaVdBQWJIdlMzc0xhOU9OcDJCL1lrb3lpWHIwb2w0N1R6NkZWNlBacnd1?=
 =?utf-8?B?R0lFdjZVa0h3N2tiaDdYaTA1L0YxSGFzYjRkVnU4WU5XaHZsUmh0R1hyYnh2?=
 =?utf-8?B?aEg1MjRVa0ZBMFVjMGIrdWVxUGJ5UXFLZVhPbzFDR3Z3cUFveHpreXN1RGNU?=
 =?utf-8?B?ZGpwTzVKVEpmY2swYk1UazF6MUNidXMxSDdWd2RsVmJRdk4rdW9BZU5wOGI5?=
 =?utf-8?B?LzErV1BWWkI5K0MxVUlERG1ZRzNBL3ZrVnVScXErVmZGemtpYXNCOUJQUGhH?=
 =?utf-8?B?OHc2N29nSVhvUlJLd3FhYkplUmVoa2ZocjZjdHdqMXNTL3pNOFVYNGpibHNK?=
 =?utf-8?B?bHRYd2lVcFAwTERybjhhTXM2aWw4RkQzdTR3L0hDM0orSmxENTNRbnR2Ylh2?=
 =?utf-8?B?czdrYzdmemVEa1pXK21DUkZBeTNMQWpwWUNXNjRlL1ZhNTVxbUVEZHpvWjFh?=
 =?utf-8?B?NHhjNGxoRUpKL20wdDFvbUl4NHNuMUkvT013dmJxZkFValg5L3FWc21Ua29T?=
 =?utf-8?B?LzVWYnRZUTNPTEtoczhaNWdHb0RxQmlJZHZBN0tMQjh5V0tMSkRUd0ZxL1pi?=
 =?utf-8?B?eWlQSXM4ZVFoOCt1VEhqa0NkMXdVNWFKbExZYkRRYlhXWG90SUZYMEtqN3Jz?=
 =?utf-8?B?ZWRVMVpYSFlVKzVrUmxFQXBvc2NISDdmTlZBWlhZWHdOL0c4ZzVTd0RRZUJp?=
 =?utf-8?B?cDY1MG1QKzltVVZoazhWYnJEb3Arc3NOVEMwS2FuVWduNDRSbTRZYjZCOEpI?=
 =?utf-8?B?Z3dncHZSVFlpSW9vL2JFN3NLYWcxZnBYbURBU3JweVd0WUFnN2w4Ullkc0dR?=
 =?utf-8?B?VGcwb1UvMEs0L3o4ZFhsbGEzNEdQWUVFMjdvOXl2NEVIZFpLZDdTQjg5dTAv?=
 =?utf-8?B?RHVyYlgrV1UwOXRyUEhHbFJGaUpaNVROb25TalVXQ2VYTEtTMUZqMVhvZEla?=
 =?utf-8?B?RTNLS1haWnZxN0JlQ2o4VHZkb2RZcU9EWmVVcUFad05EbjFOemk5Rkl2QzRj?=
 =?utf-8?B?Y0lWN1dSWmdHeU1xMGVWZXo5L2RuUDRob1loY0NkR2NJeFloN3oyZ1BlSjFt?=
 =?utf-8?B?K3g2b2NtTWRQN1Z3M0cwb2Q4Zlc2MTJYbFRHelVqdGQxR3lwd2ZzK1lyb3ZI?=
 =?utf-8?B?dmFCaWVNVWYvdVVZNEp3VDFjNFRTdHM2WFppaGVsdTNnVGFEdkxyaWQ4SExx?=
 =?utf-8?B?SXZ4UG0rREl0ZmozeGcydXlLRjBDOE1yTEZETTArRWJYWnE1QjFLU1o0ZUtl?=
 =?utf-8?B?V0NaeUlNOUdtSmhTMnNYVnYySVZ1TlhKTXJsUThSL1hpRm5sY2VqUisvYmlW?=
 =?utf-8?B?bm0zK2hsRHdveERLMHNMWG8xZTV0SDgxRXRlYlZtaEZLNzk4VDU1VEZocVUz?=
 =?utf-8?B?R0o5YnpRdkJmd29XKzEvdGM5MFcvMDQ0WlJ4YVpFaG41NzJYY2ZUNTlXWUh5?=
 =?utf-8?B?WnVwdjh6N3V3K2VZWHRTTDFVMnFMbFdBUVdneVg0NmhRanVjMEtxZmRNV0Mr?=
 =?utf-8?Q?sRRz6/R3awkhTjWVWTvZ3RPt+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b1c48d-ef50-4d71-bcc9-08dcf770590a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:48:28.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/IggaWAROqPLtuJX/ublv/PcZWDglfpiZRnjq5lelEja/bcTkANLGtZnIPJ8lCFD0Wfcp312/KPbb6XnSUrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6692

On 10/28/2024 02:04, Shyam Sundar S K wrote:
> The AMD PMC driver is actively being developed, so the MAINTAINERS record
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
> index a27407950242..6594a74b3d11 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1118,7 +1118,7 @@ F:	include/linux/pds/
>   AMD PMC DRIVER
>   M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   L:	platform-driver-x86@vger.kernel.org
> -S:	Maintained
> +S:	Supported
>   F:	drivers/platform/x86/amd/pmc/
>   
>   AMD PMF DRIVER

