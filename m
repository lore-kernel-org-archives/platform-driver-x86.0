Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793691150;
	b=uDZTmlFDJEie4yfu8v5ZQFyscAq//3fwlTESiJEsXNsuhvFFTM4gUIF7bXz+VPCwwj9x
	 h9JMGKxvp//7Bywm2xjb3qGWAfJO1SLGCNxQ/9Y8BuNmJd/1Jytgo7UjSTApIoNfqUo7W
	 FXehiReFC2RtgbdGrUcXdbviVxteKZGL1qpUsfNN4FGU/RXy5jpRB8H/3Tfo3uP76xwS6
	 aWfV0LQt7tOs8llEJ9IC8p77pjVi7xzS6AH3Z2NjkiRkaKTPmdbRSiPRi2FGiq34rfiE/
	 qnxvPEv7GlkwVAnB/YEN/x0tnOIKE6HFSVXH6UF92dahWvScv1tzvFncOVTHvgfeQBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691150;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=i4Nhs6GkwSobWL2O790Zw9M9Sjd+Ff0KKOGbodFkQVc=;
	b=j15PEo8gDS0RK8lPSi5FKrKgxTtBEGe05EXEvNZ23X4p+Sano+9RIBG6vlDtG1v8Nfjh
	 JqzKkys1CviE5hjVvzB1pKs26LiC041MD7XR668TcAQF9nNOvxdfOdndMJF2AiSJJcAJ6
	 gJMkqleHtrCHziagbt5y/zD+LF4Egh8IlggTPA6HBZGPnKNUnTRDFSPe4qdLW94PS05Wq
	 aMC4E891TVXFqI+PTlDxCRnFswTTHodMcbvz7KK8AzbqpuadymSCIcuImHp2kHv87iboF
	 zcfubYOzQyDJP+TpX1VqLzqimTJ2aizry8RpyaFlGeWMZDZA14gwehlsBRBHMndNu0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jNVFRV4s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.46
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3935606A324;
	Tue,  3 Nov 2026 07:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3935606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jNVFRV4s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6QKcgsze8lGzt6/CltNZCnHLkMuZDbbI7IpJG7F9fSnY2UnzN2KDsGqMYrSANOK3kPL3wDNX/p14pGjVtUxvwc6rYnD6k62NWhHPRhrPefL4Bj/eF+UXWLoHSeTjyr/qNVnbfUY9K37XBhFJ1XEwSKRLII3Y7XQNqy7PqdTz8OphHZ5o6YirvY1/qZsOWEpDLtgw55cpX3RlN2wsmARx3r4/pyLL2E05s3tfM/pWuwRckIWmRV+KucfRw43lPbthbNwmjQN9IsHiF37FsTG3I44f35V5sariYnH2wAPV5iZGMxAAU0FVKJA7u3g4MS02IblwZCQ8wmgn+xCkadaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4Nhs6GkwSobWL2O790Zw9M9Sjd+Ff0KKOGbodFkQVc=;
 b=dxyQk3kO2uiqZ8UQB4vfRl3MeKVoySlMZhwQjRkwzLW4TcqmvMZT2M6y8Ae3A0P2OPGiHgL9V+dMHwTZKKosuT+dCOANxpiz2iUY6AVyvztPoT/vzWFrLZW78oK6u/Li1M5QPltbDOtS40acY2yAYnwDhkUPDqoKRGNzuEwtfbomAZUVM4IUajfaimrvlIAqegGLgJCShjdh5I9VXCV5zvL9R7QjV3bWxhuh79kK+upQobpR/C/OWWtBb8x+psqFwuiPyKUR/hJbLCfz1vpkUPqXmvYZhIIhV4/njyp9ySMUnKKAJaUjH2ifAHa5St6gXDzooxvonFKBS8wP/rOPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4Nhs6GkwSobWL2O790Zw9M9Sjd+Ff0KKOGbodFkQVc=;
 b=jNVFRV4sqfEWm0l5GQYjAwf8K8YqC7kT+UFcIvEsrOqMYHjUnTZsPcyYKv6khqenYUsmTzdHVc6HGZPCJusuLXrbAo4PSX0qe94DBwCOphUbFk9NOJPNzFseQXdk5OyaD23+Od/cFDZ78/WKdbuVEreaHDrY6lTzCcFdxpDr7m0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14)
 by LV1PR12MB891283.namprd12.prod.outlook.com (2603:10b6:408:516::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 07:32:28 +0000
Received: from SA1PR12MB7317.namprd12.prod.outlook.com
 ([fe80::58d4:cc22:20da:60f4]) by SA1PR12MB7317.namprd12.prod.outlook.com
 ([fe80::58d4:cc22:20da:60f4%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 07:32:27 +0000
Message-ID: <76e78226-66ba-420f-bf89-74b8504bcafc@amd.com>
Date: Tue, 3 Nov 2026 13:02:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86/amd/hsmp: Validate num_args and Report
 raw SMU mailbox status
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017165153.3748458-1-muralidhara.mk@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <20261017165153.3748458-1-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0260.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::13) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7317:EE_|LV1PR12MB891283:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd9cac6-6098-4e0a-827f-08df397c955c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|5023799004|56012099006|261009223027099003|261028144727099003|261021121427099003|261026140227099003|261022105027099003|261021123027099003|261026121527099003|261022075727099003|10067099003|18002099003|22082099003|261102123227099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FqiTbDL+BI0yGscsm4NPuuxoDS9T9xRNMd9yUI8lZ/wfLOTe2v9dM4TSTcwnN+nS9smcR3k6qoO7Gjn42wPT+owSvXmmPEnblopaAj5UtfWsjt2NY9QJbSL3cyqBB4K6XrJ41lSJk4/jvmTRXejEVDw4adZsO+x3bItTQ6uTSgDfmqgu8JZpM++IlfCm8r35vYeOIBlFbdTvBnwH3QQe2Ah4IPiihGwxp0NrvjqNJb88WbXJTcsmOtFmVLDkSdjkC4mpg7hQ4MOtxgDQFFv7lyTrU27WDnJfwykgIUNCtszlzD7eZNcEA0u3uj04i3B5B4oPNWgYh3KbC/rYDgvNda4yCTimbPxZRE+JEP/w2ALdGfPQgAvwalTsJqufvgFhnwjoKAxyz968Oe0SGk/fXHvacN63OJcNCyc+e61qIy+SeuOsU2oowzAjWUcZaiF9nDZJ3qHBwYzNry6S6gJK8L2d9H0y8jznQKnkJc8K5VJA6rX9IYm4ilx76ysdPLKS2dgTFV7UtPpbtqnyB5EN7je3auO2xBZjXmksl2uqyOHeZgKioOBiwe2iUNprZCWTndqvNDnbja7tFm29G+Oac3hbzLj2Kbn/zVPQYkDjmiE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7317.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(5023799004)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(261026121527099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1pKN09LcHViREMyeFhiSzJQQm53TmxPRlpFamNRay9VcGd6MU1ROGFKRzhw?=
 =?utf-8?B?aDdoemltYXVFNXNQcWpOeGw5cFBDaGN4Y1NPdU02N3V2REVqS1BiYzBVaXpP?=
 =?utf-8?B?QW9xQThMcWtpUmk3cVFXWWR1ekE4aWc5MzUrakNSeW85Vy9FRCtTSEU1ZDA3?=
 =?utf-8?B?UXBidDdWSmJ2YWlTd0w2WHNnN3ErcUxiL0dGcW1reiswL3NkRmtMVTVlL0ti?=
 =?utf-8?B?KzZnVGpNLzlJczliVDZnQ3lnSGNKeGQzYVVnUUJUV2czV21xMWg3SHFKRnlm?=
 =?utf-8?B?RDdPWS96MFR5L2FHVGE3TFF6RWNnVzhCbVpxaDJOVDJSK0V4Y1hGOWpqUnVP?=
 =?utf-8?B?VzFxSDhJZ3EyYWVpVXRpN0lmNnBzbmFoVXdBUnUzK2ZXM0ZqQkw4eTF0U1Bu?=
 =?utf-8?B?Mnc1VDltNVFXMmxmQUFHc3JPeEx4a1FQYmVZVnJHdmFJb0NGcmhKYWNmNkJR?=
 =?utf-8?B?UHF1Qyt4UDZnTk5XLzVIWVcxbGJYMXpRSGhWbmFGbUh1b0FLZWJDcGcvbDVN?=
 =?utf-8?B?Qm1hZTV3K1dvaURqWWRjWi9DYUdLU3N1a2x0anVRWG9lWm0xYTBuTkgwczRH?=
 =?utf-8?B?dW5qeGU1L0JqYllQTjAvc1FYR2gzM0FzWUpPTnJWeVNvd1l1bUdXbjZPRVZu?=
 =?utf-8?B?SVZHTGxLQ3M2ZmF1S1EzbXE0S2VUY1Erd3ZjMmNxMHFnYUZCWk5ENlNmazA2?=
 =?utf-8?B?a3RadTlsSFJDcHozSWJQNEIzeHgvQm9KbFFYMDVndGI5K0ZOeEVSMDhHM1Qz?=
 =?utf-8?B?WVpMSXhURnh5aHhFeFpIUVJtYWdsM2UzMFBRS0Q5YUx6a0dwUVJaVG9sTnli?=
 =?utf-8?B?MjhCRlVJWEdVYUhzQmhCSGNqL2VuQ0xSbXZyK1M2REcvdkdXemEwT0dQelZm?=
 =?utf-8?B?R05YTjNPaDZiYngyT2Mxa2lMdXAvK2NpekxYb2VicGh4RWYzNEFDMmxOcG5s?=
 =?utf-8?B?R21ianhpa3JmR2tOK05JMy9QSGhtaVhZRWNMV29ENS9aMTR5TjNDZXlqVHlE?=
 =?utf-8?B?WEYrSzBWZ2JDNUE5TW5QUFI2ZGxwa0toK0N1eDJVQjhMa0t3WHBPaEJqQXl3?=
 =?utf-8?B?ZmtjeXh0cXRMcnRDaC9QMXhYTjlxSHkzTzVlSzlKRXd0UzNrSDFaZjJRT1pk?=
 =?utf-8?B?N1FuK0FJNjlxOHFUNVhPYW5mQTF0MlFwdll6SFBROTRiZnRuVHZEU2tib2g4?=
 =?utf-8?B?ZGpsTkhHa0ljZnU3ckNRL3RJLy95UWp0S0d5MjJvODNsWTNJTWpGRUNUamlq?=
 =?utf-8?B?Wkx2SjJLMWZBdGt0SVhNZlRpTnFYNFBmRDZTcDRCeE9kenI4WkVLTGRZY0tR?=
 =?utf-8?B?NWZyTi9uTVoveWhRK2ROZWlZZm4xM2hHTCsvNzRwWFErWEVwNUZ4bzcrendJ?=
 =?utf-8?B?TnNNdHZZSmhJNml4ZVZBUW9EdGRwR1d6TEFXRTFCdTF5M3BoWGlpVWI5elhM?=
 =?utf-8?B?K0huS2pSbkpKSklqSlVBNmFEUC8wTGhseFpBblh0S1NoTENHTnpYaUFqYlcw?=
 =?utf-8?B?YmsrZ1NTczJ0YTQ1LzM2ZnRoeFZHWEhUV2U5NUFJRStDeXhvNnRCanlQaGtL?=
 =?utf-8?B?cGhLTjdaWEJZQy9OUTlUYTJPVS9JUk1FbXgzd2RNcHhjVXZKb1JNTEpFSDdD?=
 =?utf-8?B?a2w1dGlsN0pGZXhvWTBudTZOandIYmNvdGlXOHFrL0xrd2dhQjdxdTRydUZ1?=
 =?utf-8?B?Q3hZS0hhT29USis4Y1dWck1kcUJzczdaSVVodzdNRTRqZkpGN24wV1R0RXJv?=
 =?utf-8?B?YkI2OTdWNE5qRFJnS2RTVjlKeHdCRWtOdENOUmpqZGx5TmlyMG5TeUhaQ3Aw?=
 =?utf-8?B?NUxTZFhaM2EzYmlGUUJQalhzdDdwTUlScm52c2dONmZBelR5MnZBa2xUME9h?=
 =?utf-8?B?RFlqang2Zzc3Q2FITVpVMjJuMEZoUGF5bi9sQmQwaHpyUURBRnJ6KzdwbERG?=
 =?utf-8?B?LytudVo5NldFWlNsS3Q4bUc0WGVwaExHOFMwWkp6MmtudlkxRWlSV3VJNkEx?=
 =?utf-8?B?WVJFczh2T21ROUxnWkNrL2hka3I5YXBPeUxyOW9ZQ0FVM2xPR1Vzc1htcHlp?=
 =?utf-8?B?WHlmaGt4cTBMUUZIQXRXZHpyRzdRc3BLV2JDZEpwYS9Gd1lrWHdDQ2xDVHRZ?=
 =?utf-8?B?UWVQbjRNZEJERXZXUWJwOGNrK1p5OHNWSzFDTXg4MkNidjBQMHd4VUsvTmMw?=
 =?utf-8?B?L2Q4TS90aVJER1Z5cDNUdHRyeEJkcWgzMTFtVDZNNnpQQ0VrRHlsS2M5V0dj?=
 =?utf-8?B?M1AyaDVZTW9vcnhWdGtUeURjdFNGUXdFY2RGWmdDZjA5K2JxdjIyYVZtS0pJ?=
 =?utf-8?B?MGNwY0dSajd6NkVVMEdTS0E3ZlM3eHI0bHJ0TGM1QVRSNmpqYlQ4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd9cac6-6098-4e0a-827f-08df397c955c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 07:32:27.8148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ao/2EGu4DR/IrVmc7bMhhV3xJG50iV0yW+zWc6usY+2LnBDlqDMxGsKXAx2S4lh8yPj51vpNsf+cnruGESxZhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB891283

Hi Ilpo,

For your information, I noticed a "Failed to Apply" status on the 
sashiko.dev review system for the patch series I submitted below.
You can find the details here:
https://sashiko.dev/#/patchset/20261017165153.3748458-1-muralidhara.mk@amd.com
I hope you could review the series.

On 10/17/2026 10:21 PM, Muralidhara M K wrote:
> This series adds a __u32 smu_response field to struct hsmp_message and
> struct hsmp_telemetry_data, so userspace can inspect the raw SMU
> mailbox status instead of only the translated errno.
> 
> Patch 1 is a preparatory fix: hsmp_ioctl_msg()'s fd-mode gate calls
> is_get_msg(), which reads msg.args[0], before checking that num_args
> matches the message descriptor, so a request with no args can still
> reach that read. Validate num_args first.
> 
> Patch 2 adds smu_response to both structs, set from the polled SMU
> mailbox status register, and has hsmp_ioctl_msg() always copy the
> message struct back to userspace, even on failure, so smu_response is
> visible on every call. It also fixes a related copy_to_user()
> error-check bug in hsmp_ioctl_get_telemetry() uncovered along the way.
> Both structs grow under #pragma pack(4) (44->48 and 16->20 bytes),
> changing the encoded HSMP_IOCTL_CMD and HSMP_IOCTL_GET_TELEMETRY_DATA
> command numbers; existing userspace needs to rebuild against the
> updated header.
> 
> Each patch builds individually and is clean under checkpatch.pl
> --strict.
> 
> Muralidhara M K (2):
>    platform/x86/amd/hsmp: Validate num_args before the fd-mode gate in
>      hsmp_ioctl_msg()
>    platform/x86/amd/hsmp: Report raw SMU mailbox status via smu_response
> 
>   Documentation/arch/x86/amd_hsmp.rst  |  28 +++++--
>   arch/x86/include/uapi/asm/amd_hsmp.h |  35 ++++++---
>   drivers/platform/x86/amd/hsmp/hsmp.c | 111 +++++++++++++++++++--------
>   3 files changed, 123 insertions(+), 51 deletions(-)
> 
> 
> base-commit: 03f79b70cfa59c76751bc176e6a85a5a67c91801

