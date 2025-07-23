Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CC02AEFD
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753253299; cv=fail; b=WXAkJTDvP1Zlby/RLoEzrT0KlO4XEZUJekhwgavTxzMsz7vLmjCRCJbjpyVXY/7EmPZx+z61o95w8l8vSKEtdacJbjyBB6869NcwslVkVYMfByEA4DSgqDx2tIwNJAh+9MtjW1mjUuaptwwtolIlxXhsfenyKT3yhegEv7gOCg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753253299; c=relaxed/simple;
	bh=dhCGOcue0CyyHN9m0vV8ruTgBk0qaKXHpecBN6iEH+k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=isRPphV8mawX9ttvWYUDeIO37sMNU9noKBpR0rvtNnbxUiqEeRdBFIGcLznmO6MrBj3vHs72ujNzp3iUbAJ5smkIqnOv9F45ubf/r8x8BS0dnEr0pcikv8u9yEPKYxY+ZsW+2MZ/b+oM9QFJz5ETPEjsQyJsm5jMqnylxa6xyUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uGR5jbyd; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uGR5jbyd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0cNu5NDrZQotKhKNWd9ia/kzcqzF7A2GGI/2Cof2nshU6Sl4ZwmM3BJULOVYPuyAVPvtU59DUMNWbXw+zdwPSsXw1/rCR79qbSI7ILZf4LbHQPREaO5GU6CDyvfSrzUlUMTVIzyIun7nqG/5H8e1/1W+oPjz5OapKvxekhtXkTbAFWM89A1pgCzmZmLS/BPrOraGo4Mt4RGsq6XFHNLAs72qyfEyvaZfDjGczgIVL9VOiO/MNJSrkQEbVpNGe1gw1gsDHaIGmXqDuZW8maWTKg4GsvvLaB6M6xuA1Sf6JruxkoWURDzPcqN8yg49bsBFmQNygcMFZNc2SlEmxnlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhF5/bnIypY5CTiHeBn6fPmFO5N3FN6uqGmOmUvSe5E=;
 b=UkJ9x2FJTPpnN8O7zOFPSXzFpXJVeJWqixxKzIMq6YuDvvQAAx2UxTV0qL8CZ41UUPCSbIxRn3Rn7oa6Hr5AltVbqTMMC8UqkcKUv3ee8TFcSGXWpvytef9J8AjekIlITgQZSo3kWKHNhXo/mRkA2H0ImG76briFaNHyJE7yYuQ6k2CzpiKSWp/9BFORU9q+TQgrXDjL14ZLVsOmMOOjD6bxwwV1AE2pH2N54Yxc4EmDOmy5o97DyQyZetVlrEnGnyQH0I3c4PfDAeP2y1v91MM9uU+8LjF8Pc8oryoJKze3qxX8qlcUuwF8av7wj6/JB5jAk69Ry1y1EwK6AHhFRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhF5/bnIypY5CTiHeBn6fPmFO5N3FN6uqGmOmUvSe5E=;
 b=uGR5jbydYwmIX7WYijpyrnxUxeQdXo4H2cw8eIMXakq/N4AyjfwqIWKyPWYY+AMys1w2m8hqFI/giXmJlgwJdsRNem5TC36MHYfh9bi8ACmrhq+mAqUuW00B7lty6m7q80uXkPQcnicFpEx3B/TyZJpwzafXWU7MQ5UToZWe8vg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 06:48:14 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 06:48:13 +0000
Message-ID: <5298ae80-98e4-4e95-a5f6-794ff0f2ce0a@amd.com>
Date: Wed, 23 Jul 2025 12:18:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] platform/x86/amd/pmf: Fix the custom bios input
 handling mechanism
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com,
 Sanket Goswami <Sanket.Goswami@amd.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
 <20250617071413.3906284-3-Shyam-sundar.S-k@amd.com>
 <e165a766-ff44-f29a-5b10-4f88b07b7cd6@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <e165a766-ff44-f29a-5b10-4f88b07b7cd6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:266::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: bb436109-7520-4251-e0e2-08ddc9b4e4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3NuUm9WVkJ5UnRRb05xaHAyZ1N4cmRjZlZUVzhKakluSjhwOGFlM0dlNVYv?=
 =?utf-8?B?V2cwd2ZGUGVnWTgyaGZDM2tGTTdoRk1kbWZsYit2MDFsZERMTE16TUVVSFk1?=
 =?utf-8?B?SHdkcFRXcUx5THBqMjNlaUxncG1HY3VVUjR5UDlxVjJHNitlbm84UUxLaytR?=
 =?utf-8?B?TkFiN2trTytjck9MREc4K05GamJocGZIVjRLb3krVk80R1NLbUxKSk9Jb1FW?=
 =?utf-8?B?SDJNUVhBUjhDbkRqcExQWCtpdnpVZGhCOEkyMlVnRE5vcGNuVERSOGRDaXRn?=
 =?utf-8?B?MXlsR3BIMThncU1ZTEpnY1ZiRGZ3cWdUalZuVDVCanBPV1dOYVFnblk4YVBX?=
 =?utf-8?B?aWVVb3psQUl6VGcxa0R6em5ISlgyeTlpK0RUMnVuczBGTEVmc0NKT1V0cmlQ?=
 =?utf-8?B?LzBQQmdpQjY0Y3hqUnNLTlk3RUVycVc4YldXZDZoaEY1SEdqUEhzUnF0ZEk3?=
 =?utf-8?B?SWZmV2lsTWxLWElFSDYwS1p3K3FGZmJJNm5NRWZlNDZkMm5iOWhqSmFDRVdv?=
 =?utf-8?B?K09zaVVReS8wN092dUlTbFdWT0FYcElaSFMzYS85eHF0VVNQTUJRSjVuQ255?=
 =?utf-8?B?MnBaQ2ZBcktuYlFxckNTVU1mNHhydDIycGVmQ2lVUnN3OFdaTWlDSFZ3dVRw?=
 =?utf-8?B?WVRwcXN1QUlPdDhJUzcvRk9HOVBZWmlWU3VBc005K0pWSkxzTS9Pb2g1emdt?=
 =?utf-8?B?L1NvcXNhdjd0MHBjQmwwWmVDN3ZHRDRLbGt1SW9Ic1ZKa0ozZmc0SUVPVlhO?=
 =?utf-8?B?NGI3T1EyRktEVis4NGdybWxEYXhuQXlNMXJQdjQ5UXQrejFWUmtwV0I4d0NI?=
 =?utf-8?B?TWx3dXg0MFlRdDlSQk9xdEZkMzl5MkQvSnFjRXJZd2FjTisveXlYeWE1bGhS?=
 =?utf-8?B?N1NPT3kwVFVpUWwyMnJ6NGkvWW5VU3JibVZBd1UwaHpQTURWYTBQaUI5SVkz?=
 =?utf-8?B?cjZiVkt4ZU5VSEQxMEVLVUJxYjhud29jeTdzRFRsaFoyUk0zNnJUYkgwUzAz?=
 =?utf-8?B?MVoramRMbWZ2eVZ3MHZubW53dFAwQWRoMjliYjZjZnZPUmlwQy9teEswdm5H?=
 =?utf-8?B?aDRPYmRPbHFoN2VwcG05blNUenhab05JWnhvZ2RaeFNaTTVuNk1ZSHQyTFZJ?=
 =?utf-8?B?VU5vRjA4eFJyYkkvWWVBbVZWV252RUFpbCttc1Fqc05CNkhxdE44bGRWQkRF?=
 =?utf-8?B?MmZIN3Nrd0FjbWo4YXBTYk1xOE5Kc1lkWlZOTEF0dXhqajNtNTlmWXJnejBq?=
 =?utf-8?B?MW9jeXNnR0Q4eUk5MW5ibEpTZjZsbzNKTDRjSjJSNGthRFBZMWxDQWgvbFN3?=
 =?utf-8?B?UzdRWGNQTGt2ZVl3eXFKc3dMUVpQNEZ1YkdUNFN0eVVkVk1hTzducm91eWpI?=
 =?utf-8?B?M1hCbU5wWGxHKzBDR2ZKdDFhV2V1T2RNOGF1Q095ZFhqeXk4ZGxkYVM0blRR?=
 =?utf-8?B?SWd6eVpPbm1MSEo5eGRYZzZJUGRoaWJ3Vk1nMjZwVmlYcGNycnFwZjk5RUtF?=
 =?utf-8?B?bm1mVmpKVXFQZTlHTTRNajNvNmFxd3dXQkRLcTBvZC9VSnh6cnJFUVlNMkMy?=
 =?utf-8?B?RHV3YjhBUkM1RkhmZVBBejRjbm1MNmRpcjJITU9PU3R6MnpNbU9QOVJHbkR4?=
 =?utf-8?B?WFllQkluYkJ5dFVJUkQrL011Y3d4NkJTOGt3ZHROK2Y3Y1E5SlJLbjVlVkRU?=
 =?utf-8?B?aFgvdldEVStwMWVCM2R4TmgxMi9hcWZtbi8vOVplMUMxYjByRUtnaEZmRkxy?=
 =?utf-8?B?TVliQStUU3pxMnVOeW9ha3NSSGJwc0tRUG1ndDNvSS83aWtCcGJ1dkNhcFEy?=
 =?utf-8?B?U2t4b2RMRnJXayttU0VtK1ovdWRsaTZQOFFrMmFyOElRQ2dZZzcrMHhCMi9L?=
 =?utf-8?B?SkNCM1NST1lvaHdiYjExUlZRdHVsTmNWWHNrS2xlQUZ4bkhxcWp4ci9sVmpW?=
 =?utf-8?Q?gYc8KrmOknc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azJVUVArL216N1U1SzQ2QnNweWdUWFE3TWhmTVR5R1BEYnNZbDJjMGI4RXdD?=
 =?utf-8?B?aGhpcnF5SWg3NkxxWVdhMDJHR2hzSjJpV2pWWFVWRjZDTFNRVWE1a1FENCtF?=
 =?utf-8?B?V1lxQWVSemVyUmlxdGR5WHdzcUJKa0lGUXNBUVV2SHpQdWRmKzRjVDU4cFk2?=
 =?utf-8?B?bFYyZVQ2NXpCMmRtdDFOOUdRZGhTMW45d3JqU2NwNFNFekRJc0ZOQzR5cm1u?=
 =?utf-8?B?b0VsYWxSNndvQXpXNWVwRHhYS3NOVDFyS3BWbnI0ZjZiR1ArYTN4cytlVGd1?=
 =?utf-8?B?Wk5QRU9TZXFEOFYvRnpQOEEyUWlsR2NFZVR2TGJ1NlBtelpHOXlxTzY5WmpU?=
 =?utf-8?B?MFlKeWJwR3FxTzNDWThUVTNCbUZLUWVPcTNsRXF3aFFybGJBcnovVEFTOEY4?=
 =?utf-8?B?aklLL1lWdHd1VzJoUjVwNXZwc0dObkZyckVzK1I5RkZNUURIZEFWMlcxRjJI?=
 =?utf-8?B?dlNUbFZNeEZlMmNLTzBUWUY4N1VXRnFzL2lwc2tLc3Q5UEdEblZQOUU3ZlBI?=
 =?utf-8?B?eWVRTE5ESWlFenNRZlBCZURpaENYN3gwMlMwS3YyWGJXNkVPRVR6M0xRVnpC?=
 =?utf-8?B?UnVQQXFWbksxKzFuSmF5aC9nRGlpTWJHNGpjSnhuVFhNSmZQUTVzZFA0aHd1?=
 =?utf-8?B?R2RyQmU5TFh6cmt5RVgyb3JsTU1rL2ZxWmRxRVdIeWs1VWdZN21UVkFMZWhP?=
 =?utf-8?B?cHFMT0pPQi9DeHZINmFxTEZEdzVTNGY5dUNjaGc1dmphNkZXSXQzUE9oakk4?=
 =?utf-8?B?ZFpLV2RkVFBEOHZ3STkyK2xna1lrN2o4Kzk1V1R0VVJsaTdEZGhYYzBGcWxN?=
 =?utf-8?B?QWtDZWlHNEhwSHREVkhzQ01PLzA0M3doNGlGSHZFck9ick1iZWRFSmxhUkIv?=
 =?utf-8?B?akhHUUVqcXVXMGJ3SSs2SmNxOWZPc2lEc3FhT1VUU1NhQlZOR3VnYVRSY01q?=
 =?utf-8?B?Z3grVDdWYi9WSlVRYmV0SDhzZG56ak5hWnZGM2ZoejJncVhLY0lyQ1pKdmE2?=
 =?utf-8?B?VCs1dE9SRjZxWUpINGYzQVRSbFVQMkIybVphajY1R0JSVnRIR2RpQmVXc0Nr?=
 =?utf-8?B?eWxtUEE3ck9DTGQ2eElmL2MySGd4N3BWdVNCL0ZoZnFmbHk3U3BXSEFVak90?=
 =?utf-8?B?VkFjWUJZWVBnQnNJbnNQeHphck9WY2xaVld4WVcwaWJyclVicEkrdEM3Tk1z?=
 =?utf-8?B?WVUyNk43QXNKMW9wanE2WkZoYThMRVJmempxRW5SOG03RTdER244MDZWeTZq?=
 =?utf-8?B?azU4bFZlZEhjcXVQS0tocDYxeFNzNkYwQmVpNTVEcjVKZFd3N3NKQUFQTXFq?=
 =?utf-8?B?QWxPN2w0NnBTdjZ4NXY5di9yaDRIRjZqdEZONWIwcnErU1Z1ZHNEaUFaUWxR?=
 =?utf-8?B?d2tkS0FZcXlxS0k4RFpXUHdlT3lTSW1wbmtXaVcwU01wMndGQVNta3ZIOTVz?=
 =?utf-8?B?NHBFSVVvTEdLY1cxeFV3TFZpclFHRnUwZU1PeEt0UC9tcGJ3QUZUZ2FDTG9J?=
 =?utf-8?B?MFhWbGtZNEluTUluUzF0K04xNVBYd1J1YkhZNTIxMUo4dHFQWmg2MVcyZmJE?=
 =?utf-8?B?Y1FhOFM3QTBsbEI0Ti9IRHVTMForM056ZVE3OWdMdHpNUTQ1MzRFVEJIMkYx?=
 =?utf-8?B?SlhaOERHZDJFeC9ld1cwVXNBNUNMWitQcEUwWjg1cUgzSHVKdFJEdklSeUFq?=
 =?utf-8?B?aEdBRjROTmVGT3pwYXdUQitrSVJmVWtnSUppeGpySVNPOERPWmt3TW1LcS9l?=
 =?utf-8?B?NllzVWs5SmsvQlBuRGNyWko1ZDFuLzhKOEVwOWVpRmRSSDVZRjQxYUxQTUxG?=
 =?utf-8?B?ZnY4c0lCR1NLOU5Jb1lQaVJscUVsN1NTcVBsOXJUTnltUTdxKzd2SGRlMHN3?=
 =?utf-8?B?b3BLTUFLanhadEwyUmFBSU5HR2RBcGNFVEpLSkd0c3gzcFM2alZWWVVYYkdi?=
 =?utf-8?B?TmtZQVFuWkZEekhwRm9JM1EzNW5jVFN3OG8rVHJmR3FNLzdYc3lVTFEzNHNC?=
 =?utf-8?B?RHFLYjdhZ3d4djZHbVkvTkJteDhrWFlETjQ2WUc0Zm53U2NkTzNBVGt3bXcr?=
 =?utf-8?B?aW1UWXdnREJ5dytoNlhmbnY1TFlUYjVtM1RzOGEvNFNoVlI1SkUvb2U3V3Uv?=
 =?utf-8?Q?EvGX0koMpJnzzvQsEWFiIid0Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb436109-7520-4251-e0e2-08ddc9b4e4c5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:48:13.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVOfY+g9IcF49jO5SIgM+3mq/Siqwvm/76Yyf0/AmaYg/eqWejLStJdagO3P39az7NfRr4wehZZRTg0QNogOGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587

Hi Ilpo,

On 6/30/2025 18:46, Ilpo Järvinen wrote:
> On Tue, 17 Jun 2025, Shyam Sundar S K wrote:
> 
>> Originally, the 'amd_pmf_get_custom_bios_inputs()' function was written
>> under the assumption that the BIOS would only send a single pending
>> request for the driver to process. However, following OEM enablement, it
>> became clear that multiple pending requests for custom BIOS inputs might
>> be sent at the same time, a scenario that the current code logic does not
>> support when it comes to handling multiple custom BIOS inputs.
>>
>> To address this, the code logic needs to be improved to not only manage
>> multiple simultaneous custom BIOS inputs but also to ensure it is scalable
>> for future additional inputs.
>>
>> Cc: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/pmf.h | 12 ++++++------
>>  drivers/platform/x86/amd/pmf/spc.c | 15 ++++++---------
>>  2 files changed, 12 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 1a5a8d70c360..696b170255e0 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -623,14 +623,14 @@ enum ta_slider {
>>  	TA_MAX,
>>  };
>>  
>> -enum apmf_smartpc_custom_bios_inputs {
>> -	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
>> -	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
>> +struct amd_pmf_pb_bitmap {
>> +	const char *name;
>> +	u32 bit_mask;
>>  };
>>  
>> -enum apmf_preq_smartpc {
>> -	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
>> -	NOTIFY_CUSTOM_BIOS_INPUT2,
>> +static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
>> +	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
>> +	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
>>  };
>>  
>>  enum platform_type {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 1d90f9382024..e72c11aba31d 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -101,18 +101,15 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>  					   struct ta_pmf_enact_table *in)
>>  {
>> +	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2};
>> +	int i;
>> +
>>  	if (!pdev->req.pending_req)
>>  		return;
>>  
>> -	switch (pdev->req.pending_req) {
>> -	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
>> -		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
>> -		break;
>> -	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
>> -		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
>> -		break;
>> -	default:
>> -		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
>> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
>> +		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)
>> +			*bios_inputs[i] = pdev->req.custom_policy[i];
> 
> Hi,
> 
> After seeing this version, I think there's better way to solve the 
> discontinous layout problem.
> 
> Could you instead add a helper amd_pmf_set_ta_bios_input() or something 
> along those lines. With that, you don't need to add that local array at 
> all. I'd also convert bios_input1/2 to array so both are arrays (I 
> understand you cannot change the layout and merge the arrays). The 
> helper can then pick which of the arrays it should set to based on the 
> index.
> 
> And briefly mention in the helper's function comment, that we need to do 
> this because the layout does not have continuous area for bios inputs.
> 
> That seems simpler approach than this local array approach.
> 


Thank you for the feedback and apologies for the long delay in sending
a new version. I have sent out v3, please have a look.

Thanks,
Shyam

