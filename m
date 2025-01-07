Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1C1F75B2;
	Tue,  7 Jan 2025 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285405; cv=fail; b=DANcRlBG04q2MFtVTI8zq4WaoQ6C8PjTmESjKmyBzYtVajHFWtwwY0Uuw2P39xmj/hauMqnOK4H/8QbzrW/IsrKfqwE+po9PxTSbjyLOtUNCt1DgGUeZP/IRPYd1zeW5MX6ZmFmkI7yFCcJWdNupVQ27sfJLRB/WtjyYGMKeFaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285405; c=relaxed/simple;
	bh=1tUi1O2WSgPMnWITwYzyDvf5yUkvlJcl7x5rTd+jUH8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R6z43zyhnNIRd1lxrt7yQyMEu0qwhzwLHmL6RaMDqeznAT++6p1gbbkxLWa+thDbIcWTgQ7LnRWwcm3bOfuDrvfSTIAfLelxJgksXKnoOrkEi7aW+osNG1G1dY5H2za/HYrYS4zHxnnQn+omuVY7z4TTmly4EICAXXVxOttG3tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mpYro+Js; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mpYro+Js"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4S2wW7rZsLhKlABonAc6v1LOTyG2EpO3oQAR4m4lkNRsggz/aRPN02tENMVQSCT2nRKS3S7LgXFyIF6bkjTnoipxtdjpennuzFModA25k7dBAPT+MDr+sQD4A6D3GP75aAnUKA01PQfednMZzEGuFylHJNzUunb7ov+g6Pdwx/LbgLI9scoEOOghPbcgAt/al0aMLj2r6SwyzsXZTq1yjmGaUsL7LnSwexT4Ga+tuSrXcg9RwAWoO4O+t288lDqQJqSmewbUtnmJtMaE11OJkhS/rnX0ZCnTBrosvhonp/nTGaOnWsVYQK1DxsNa2LE3I+YYhoxkGKVsEwwieRnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbCezbVRPVKUGwB6ZucyCdZUnt+X8bvLBGTunHMx0YI=;
 b=P9Y//8UEHcPRpUG0skMnru3Ng9clp2L/IGCebK8JjhAlg72olmO6rmfZfMZWvR9fLe3HZxF0p9iU0ocVa9fKo1rcINRMdzAqLHi0/Ll2lzJQEVgRXbJJO6w6PO61VkBKln49Jgkab/5ZoXunIhklt+bELUJIXm9xWYOnJwB6B+VxofLgavnmFNgYxnbJnWuYZJgKHqFdnEftxhvt9W4YAxQ8VN6PI8ffkeIizAWPLoxpqsritl9wUwdy+/e8mpBRf7wmgeu1UGFK1mhmYsbGAWq0em2JRoGn7UAoq4FVAiscojbwaVZXGy6sfAymYNQR5hd051OLg6wnE5rs9VajjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbCezbVRPVKUGwB6ZucyCdZUnt+X8bvLBGTunHMx0YI=;
 b=mpYro+JsM2wh5mEUFofLcrIOZPwkUW7UtpCb5aXflmhacQ7I30dR4AH9LXWKjGPfgazVsn6QSvOzVqfYC+XAZG1W1+NqEGFlh8QnhbB+ZJs9OS/jtFTmZ3Mbw/VUByTXIL+ZsYk7G9oeMwjqyCBBbYyvSDeTSnZ5f/DNaJFFqBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:29:57 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:29:56 +0000
Message-ID: <a24e5301-5130-4133-b5ba-551172087b6e@amd.com>
Date: Tue, 7 Jan 2025 15:29:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/20] platform/x86: dell: Modify Makefile alignment
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-20-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-20-kuurtb@gmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8ee8548-cb26-4c25-0c7e-08dd2f626ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K05xaWNwbXdMMUlrdytIbEl0T3B5a0g0RFFuSkNoaXYwanZTZjhZVVFiS1hE?=
 =?utf-8?B?aEZmR2pEbWtaWnNOaWJnc3dzVk1YeWIvZ3lVdHlKcVlsYU5hakZUUGJEcksz?=
 =?utf-8?B?WXQ3R05LcUZScE1TK3pUWU5pTkFHeGZSK1lRdkFSbTAxRUN6b2xvNTArNS82?=
 =?utf-8?B?UDFIVkVVWFZXT2xVbHZnZHNNREZLT1ZQWGJWbDFiRkMwNFM1ZDZzd2xnK2Fl?=
 =?utf-8?B?aWV3VFBnWGFHdW9ZWVp6djl5WlREN3hoWUd0MWJ4Wk9BSjhndnpreFZjOFlS?=
 =?utf-8?B?enFEWm81bGRtVzF5UVVjd3ZESWlERUIwZ0JZRUdGRFVNRFdqTHdUYVFlY2ln?=
 =?utf-8?B?Z0I0ZFdNa3BIK2N6L2lmK2tHRlJyYXluUTF6SUdPTGR5T09RenIvL25IeW9C?=
 =?utf-8?B?OFlBR3I2WXVkTmc4UW9IaTFkQTJkTEgrV1o0UzBHNG9KdGQ2OEZ5Q283dmJS?=
 =?utf-8?B?N0NneWhDZTlvT1hNR0Q3d3BOU1dPdHJnS21pWGsxWWdCcDgxUVN5VEQyQ0lv?=
 =?utf-8?B?Ym15OWp5c2E4MFdlUXhlZjNEbmF1dGk4cWRTekJ0d0YvSnAxT3duR0ZYUFVu?=
 =?utf-8?B?SGlwWEoyTTZvMlJzUk1jY25QOFFxS2FYcTVWNlpZdjJvbGcxbUlIM2JTWHdW?=
 =?utf-8?B?RW81V1h4cXBzZkdWK3hOcW1ORUlmZ24vZVhFZ0ZsU1M1aTF2bUR2L1BaOThE?=
 =?utf-8?B?bVZvbEpRMDR3WFEyWm9iSWZ1ZGVLQ25qVlRQZXFXRXRoVzVCOStQMFcyYUZI?=
 =?utf-8?B?R1hIVENndENXdVRKVlNnanA4cjkreFF2Y3A0THUyRmxadkMzNVhVZ1UxT2FW?=
 =?utf-8?B?RU9ENS9MVEM1SDdva0prVDNEeXRhVWU1KzNITHFjRVlmdFlya3I4bVJUeXor?=
 =?utf-8?B?K3A5K0ZTMUg0SFc0bDZXQXZDSExOU0ZtNkJKSzl4R0hobUIrdE9FQXZXa2Zq?=
 =?utf-8?B?S1BobDdvZUEyaFl4TXFvVWp5Z2ZrcG5rdFZRank1WW9QbUVaS2pmbi9oSlRz?=
 =?utf-8?B?TnBuOGJhZGpXOTg4SzFPd2ozeVFJc2xwdkpNMFh2UExodS9OWDdvMC9wd1Rq?=
 =?utf-8?B?TWUrRFpDb0ltcURyb2tjUVY3dHU1WTVHZVIrdXkrbHI5N0pjZE5pYXJBTThN?=
 =?utf-8?B?ZWVmNjVJSURETVJkSUF3cVA0OHZxTlZ5SHlJN2JCQmJ6UXJFdzNWYnFickNa?=
 =?utf-8?B?Sjd1T1UycDBQTURvbGtFa1RDUFVRUzhnZ0d6MWF6anUwNXZEbXBnK0hnNjZi?=
 =?utf-8?B?TENDbnMzQXhlc2Y3RUE0d0lJN1hlMTNIN1dBRitGMEpLa3kxRG9adFJnMUU5?=
 =?utf-8?B?RW5PZFNsa280OXkyVWNuNVNzbWt2a2lZN1QrVU9yN2hUNGdLQ0NaVTNXbVM4?=
 =?utf-8?B?ek04RTV2Q05pU0xiY0dXVHFkWTEwemRpUGRvRHd0bXNpNjNIOHN1NmVhTmZk?=
 =?utf-8?B?QXhiNGVnOThFZEtaRS9mQXQ2cWNiMzlVdnppelBOL3d4UmxwUjVmeit3QTcr?=
 =?utf-8?B?cGF6RFovRXFmaCs0ZEtnaE81SnFaQ3NYOVlISHhWVUtXVTJrZ0VDUXNja04w?=
 =?utf-8?B?Q2QybFlFMWM2ZDJoSTdVZ0I0UXdtSk83RUFxY0NHbTA1WGViZ3F6elk4aXVl?=
 =?utf-8?B?YlBkNWt3bGVSd0pBM2toYkxYYTlZeU5XY0NjZ3hHYkI2K1RIbC8rQUwvVkhH?=
 =?utf-8?B?WVFPb0c5MjNpamoyRlFlQ1BmcjExQWlXQmlJYW5QeEc1WktvZVdMSy9NaTJP?=
 =?utf-8?B?WTNHams4enVMdXZ4bTBLMC90RWhaZC92RytOYmFaWkh6emE1U2haQmRXZXB0?=
 =?utf-8?B?c0JoNnk0T2hZVmVPSUNpa3pVVXJ4RTBEZjlPNjBnMjZKN2Z0cTAzRWlNbUQ3?=
 =?utf-8?Q?3Ih8MihS8A3jA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:pl;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkNZM0VxZDZKcWVHUSs5NjlKeDY5TUlSMjhISS93dWlXWkVYb1RVZzVTYm52?=
 =?utf-8?B?L0xXUlBEeFkzQWpGSDVJZm9ITEcwVWNFbmswL1dnR0FUN01pQzE0eWJnbjFP?=
 =?utf-8?B?YUdnOHV1RXlPSHpnNm96aVZaNXp3RnZ4ZCswS3ZNblIzU2Zla05KSm1Qd0hu?=
 =?utf-8?B?dmJuUzIzbWR1eFBRZVhNV1NURGZYQVF4QlRod1VzYW9FaUZva0VTS0dUV2Vo?=
 =?utf-8?B?a0wyd0F5T3ZFZnlDdjJ5NHczcmt5Qm5RMUI1a0ZRbU5qa0wyYllYNzF2SzFx?=
 =?utf-8?B?RExyOGExQkdmWVAvMjlzVFRwRHJHcUszYUFjMFpCN0lIU0FoZkpyOXl1VXo0?=
 =?utf-8?B?dlhlZ0o3V0tsU3VkNkxNeUpLeFhSa29Kd3VldmVmOGhCNUZpck5BKzRNOTl4?=
 =?utf-8?B?SXZDTFl2bSswM0QwY1NSRnhCeStlcUpXR2VTS1ZOOFduMHUwNHRuVHNGNUxw?=
 =?utf-8?B?U2VlNTlPd2VQRG9Rb0NneGF2R29hTUN3UTBWcVptUFNQZVdRY0toaVBJQTM1?=
 =?utf-8?B?amVrb2tkblcwT0NQWGZEWnFlWGZHd1JKZDJEeHo1cnc2K3A3MmRXem53RE1H?=
 =?utf-8?B?S0hRN05EMlRRQlkzRkxaMlhnRUtieXh3TlVtQXgzNWYwQ05uN0RVQVU0MHJs?=
 =?utf-8?B?bzl1Z09DRUpkY0RrOG1EZmdJUHdjMndHVW9YV1p3V1NiUnJWMVVsOERtQXpJ?=
 =?utf-8?B?dU9PaEppNEVwZitMNklleWJsY1dpZndGSkRDdE0xNmVvZG5CY2VoTDFmYWVo?=
 =?utf-8?B?WjF2UitWbThVWkJQR2JSRnp1ZEEvcWZRc1NLRThqQ2xSRDJ3Zks3U05FSVBl?=
 =?utf-8?B?TEM5OXhaQkFYU1U5ajVVOVI0N25uaUx2VmpjdHNNYzZ2em1vWThxUkM3U0V3?=
 =?utf-8?B?REJGSjFJVGNEWThETVBEZHllK0lDQS9lUXdCQmliYnlNclZXN0RJQ2tSb0lt?=
 =?utf-8?B?L1JaY1dib0xJOVgvS2kzZ3l3bDJ4MVZndkhtYWVjL0MwWk5zbThibWkrdm1V?=
 =?utf-8?B?RU1Sa1h0QVFkc1E1WlFyZHVyQktxN0dCRGNhUk9iV09sWFVTQk9PRUlUSy9G?=
 =?utf-8?B?UHlEVVFHY0xUdlZuVmRQUnhxQ1pFS3hZcWxBb1drK0tnUFg1b3U5SkJsMHZa?=
 =?utf-8?B?VEdxRjBHcG1xZEhna1dHV2FZTVJsYVpmZzAzcHFsODF1SnVWa21jbXFaOHJK?=
 =?utf-8?B?cElRYzAxZ3dLS25uMys4YWQ1bEs0aDdRNVl4bEV1Y2FSNC9FK1JWMlZJT2do?=
 =?utf-8?B?c1Z5WWxpd1RJUmhqdU9PeVUrQzdlcmU3K0xtUUNXbTlkQ3BCOElYVWhoclRU?=
 =?utf-8?B?YTdRV1h5Y2Uvc2duRWd2eE43bnlzQUlPMml5aTQ3S0plU3d0MEVCd3VsbTR3?=
 =?utf-8?B?Q1FyQlpIZ2thZFFENGVYc0EvR3FMcGRwOUlIVWFHQTVlQTNzaFUxajJtSUxV?=
 =?utf-8?B?NTFjcXdwaGNHNDFadGRGUEVuTGF0amdyTzMyZXozUkMvWjNiSXpZN0JYUUJo?=
 =?utf-8?B?SEZxM0RRUmtaM0kxSlh4L3ptSUhETXRNNkNXUjA3UmtIK3U3SGpreG5nN0pH?=
 =?utf-8?B?YWFKa0hXUzEvQUtrMnhLamNrZTJKQ2p2UzVYSXlNbE0vSGRQWFNOcTNndFZn?=
 =?utf-8?B?a2pkcSs1bVNaOENnUVlDQWhjNWhxTThCZzlQeVMrbGZCdXRYU2hlRjBvem9Z?=
 =?utf-8?B?N0I3N2YyRHFRWE83aW96YWt3RlluT1ZJZ0ZMU2RaUXBoeE94RmV1UFBENzBX?=
 =?utf-8?B?eVhIV21Zd1lvYVdxeEd2Tkl3TEovREFiNDZLTytHU0hqcmhCSDV6SmFJdlhn?=
 =?utf-8?B?M3FSRXhhRk9hWWt4WU1MUXVTaXhmUExLclpUdVJJYzkzY05ibngva0hJdW9y?=
 =?utf-8?B?bFVZN1JSV2xDSlZYTGFQZ3hlbjcwMVB6S2ZmdkxhYTJzeXJmNkdkUm05aEgw?=
 =?utf-8?B?LzlWMWFyWHJtQm9VTU5INjhDc1kvSUU5YmVLNnhSMCt6aXlTQ2luVlh0QUJh?=
 =?utf-8?B?a2o0ZExvRU94N2hzcXVnNCsvZU9jU0xIbnczb3E5WWR0M1l4SkR4MmRicnJx?=
 =?utf-8?B?b1JsK1JsUk1ORXg3RTI5bXBGKytpNkplSGNOT0ZTMExwTzQxblBQMEdmT0J6?=
 =?utf-8?Q?U+KYiodx7tz0On7UuLYc2meKV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ee8548-cb26-4c25-0c7e-08dd2f626ec7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:29:56.9194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh/50IW5VgEAkaNLrpeUAhMRyFBTFLT8TVsTYrV5Ws9p8lzON2PGAkhzzFEW+GSr5JWUFbtEwG50EYWioD+w/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Add one more TAB to each line to support upcoming changes.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/Makefile | 48 +++++++++++++++---------------
>   1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index 03ba459f3d31..d5718ef34c48 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -4,27 +4,27 @@
>   # Dell x86 Platform-Specific Drivers
>   #
>   
> -obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
> -alienware-wmi-objs			:= alienware-wmi-base.o
> -alienware-wmi-y				+= alienware-wmi-legacy.o
> -alienware-wmi-y				+= alienware-wmi-wmax.o
> -obj-$(CONFIG_DCDBAS)			+= dcdbas.o
> -obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
> -obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
> -obj-$(CONFIG_DELL_RBU)			+= dell_rbu.o
> -obj-$(CONFIG_DELL_PC)			+= dell-pc.o
> -obj-$(CONFIG_DELL_SMBIOS)		+= dell-smbios.o
> -dell-smbios-objs			:= dell-smbios-base.o
> -dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
> -dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
> -obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
> -obj-$(CONFIG_DELL_SMO8800)		+= dell-lis3lv02d.o
> -obj-$(CONFIG_DELL_UART_BACKLIGHT)	+= dell-uart-backlight.o
> -obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
> -dell-wmi-objs				:= dell-wmi-base.o
> -dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)	+= dell-wmi-privacy.o
> -obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
> -obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
> -obj-$(CONFIG_DELL_WMI_DDV)		+= dell-wmi-ddv.o
> -obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
> -obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
> +obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
> +alienware-wmi-objs				:= alienware-wmi-base.o
> +alienware-wmi-y					+= alienware-wmi-legacy.o
> +alienware-wmi-y					+= alienware-wmi-wmax.o
> +obj-$(CONFIG_DCDBAS)				+= dcdbas.o
> +obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
> +obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
> +obj-$(CONFIG_DELL_RBU)				+= dell_rbu.o
> +obj-$(CONFIG_DELL_PC)				+= dell-pc.o
> +obj-$(CONFIG_DELL_SMBIOS)			+= dell-smbios.o
> +dell-smbios-objs				:= dell-smbios-base.o
> +dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)		+= dell-smbios-wmi.o
> +dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)		+= dell-smbios-smm.o
> +obj-$(CONFIG_DELL_SMO8800)			+= dell-smo8800.o
> +obj-$(CONFIG_DELL_SMO8800)			+= dell-lis3lv02d.o
> +obj-$(CONFIG_DELL_UART_BACKLIGHT)		+= dell-uart-backlight.o
> +obj-$(CONFIG_DELL_WMI)				+= dell-wmi.o
> +dell-wmi-objs					:= dell-wmi-base.o
> +dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)		+= dell-wmi-privacy.o
> +obj-$(CONFIG_DELL_WMI_AIO)			+= dell-wmi-aio.o
> +obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
> +obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
> +obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
> +obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/

