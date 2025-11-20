Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5521ABC1
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636128; cv=fail; b=E1YiL5AebweOk5DkvkMxFxtQ7/3XkYEdoBXmm+k9RrJaPHvW5wQaKw7YOUs/zsP0c9PvnIf79YoLgodl69FtItGclzyp48QXwI8l7AqkZ96nWr0Gd9rFc80BHhgiMkoZ20z4+gYXsS41DPYGqwziaZnUSZz1JotccC3uADlmJoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636128; c=relaxed/simple;
	bh=3djuavPeHMoAtnkde+mhjV3/mLUUd6H/zds2lpFSK78=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ewsWEPRezhJi8d52+9fFb/v+ecwKI2RUVIz6xWj0d/F1SEiXaSn4S8c55T+U7rIsIN4WN9YtGjQwXVEQOh7fafALEHbAP4jgx53HD2hwSU9LgsjxJ5lqSlQvXgXJvt7/KFKQezRVImsKGQ0zLvei8cpMf/VHJ52QpGv4VKDs8vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wWis0DxG; arc=fail smtp.client-ip=40.93.196.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wWis0DxG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQmbEZ6l9luV5lVwzRUt8pD0DUBtcqo1XOZwiDhOd5a/iOPRz28GH/nDn1SPjfWeovPD8gF3fds2SkCpz1h/KFcU9aTwlPAwQZenHkz9yFjhOgpFpJ0U0z2lvNxrJxaUl869QbRx1ASU6ilGnw7hgRvMAGYZ01CCicNxHS/QkMzgRpfb/6ShBHqg89KHWK3Vh7JuGV303+9Mx9U79jZKekbtso8B/uuNkoOEX06W35fES+O9J7zbib27Zdzi36IwWch3T8/HHCptKH/E/B7x8HtfF9f5VjxI/ErPcCrRbM7Hgo34Fq/8uP8KIvSc8DDzgPkjjEHQ1vTH3YoZ/9Pfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XrFnSDqQS/BeqBwOSxTdoRJrT4HxsKfq3lufXfIhFY=;
 b=QwBkxzeEfZ1tMpcTVbP2WsEX6TuDxHl9qaXoDY5vYCsDvBaoJsyLQCQNBx1ZnAahFEWRKfYklC27GI9WenxsFx+oytq5YiYmqMt2Iw9U7Cw5I5SQV8h2oiofpnVVngcd+3bBbKp1BCpVmwrP46D73qGqMkOwwvh82jhlrx2ztvj6oSu3ZLe9gH8S6AmQk0NUXCKoyCjZxeSnrWLd+5LuVwTlEeMlsScxGnTPmtbhneRgDPNoywE7+ksY/jBigplhDK5Vkq8HTMoQjmS4Nf+j8pw0vugDxViSGDz1PFNKCB+1wZwd5W1rjQSWdj7zuYgnSxIilySOrgafKo7DS7Rg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XrFnSDqQS/BeqBwOSxTdoRJrT4HxsKfq3lufXfIhFY=;
 b=wWis0DxGDyGTuJ/MNRyDeGuKjFdt5NiJHrtdBzGBgStKAqk017yTO1R2Q2QD6QgpZKvJ2hxD+NT+0RI5nCbR6j12tYwLiNm0HhDnzvrkhkrY/GdtGpEGO/CYCABXYIv+tDETqLe0uLaDP7m6NpZJZHHyZO//caGLIWaoyVOE7tc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB6953.namprd12.prod.outlook.com (2603:10b6:510:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 20 Nov
 2025 10:55:24 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 10:55:24 +0000
Message-ID: <9a4e8e95-583c-4307-a8bc-cd8168bd5f10@amd.com>
Date: Thu, 20 Nov 2025 16:25:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power
 estimate via AMD PMF
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, lizhi.hou@amd.com,
 VinitKumar Shukla <VinitKumar.Shukla@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
 <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com>
 <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com>
 <b8f2d8a0-3131-45cc-8c55-8fbf4ca06cfc@amd.com>
 <e6551b53-cb89-46e6-9c3c-545d14d79642@amd.com>
 <8349468a-79ac-dc1c-d484-b9c9dd340e1e@linux.intel.com>
 <09397827-4233-77d6-ab17-dfe0ae5f1cfe@linux.intel.com>
 <bb72ff10-b9e0-47a6-8985-a68efcf204ae@amd.com>
 <d344b850-f68d-f9a5-f0dc-55af4b48b714@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <d344b850-f68d-f9a5-f0dc-55af4b48b714@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 961974d2-ce8f-403b-8669-08de28234e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDhwdmlOL3pqazAxTTVTM29uemgxd0g5K2t3RnBib0hwbW52SUl3b05FMUd6?=
 =?utf-8?B?M25YUVE1RFFxZWp3eElPMXViSzBxY3RWN0wydHd2Z1VyMWJ4WVdEWFNWdFNs?=
 =?utf-8?B?dDZocG43M3NPT1Q2TFJrMU9HWUkzd1RyejJLajNQS25ZWlV1OEVsTFNNOEFP?=
 =?utf-8?B?UXNYRzJxckFEK2k4UjZ6QXNaYVA4c2QzWkRaYUd3MUdBS0NXT2NseW5WaVF3?=
 =?utf-8?B?VHpCS2JOZy9FaHN2eFFNNzMrQWVjbmRqVUNNRDB6L2laN211aFFrbU1NbEQ1?=
 =?utf-8?B?VTA5NTJOZ1N3VmlPMDdPaVU0WVBNTnFhTFg3RHdzems4cFB2WXpqSGRlZUQ1?=
 =?utf-8?B?T1hjb1BCK2lGNk9YZ0xlTmkySkJORGlXbjNGamp2K0xYaGpURFFzeFN6aWIx?=
 =?utf-8?B?c3RvLzJ5cmlnRGg3VVFCbUJhY2o3SXVjR09HQ0k3Z25xQnpONnQ4aVdZWGE0?=
 =?utf-8?B?L0JoZ2N3K3FabDJJTDZUSEhKM1BxV04vbk82YUFkTjBtWnM4d3F4a3U2dTRB?=
 =?utf-8?B?THViWHhZQzg3c2hFL2trOUZTNU1lcmZSN0tFdmtVVDNOQzNVUVIySm9HVkVp?=
 =?utf-8?B?T2JHdXZWcHlJbDBsNDJOajJNUitZdzduZzlrNnh4YTQzN005aFlhMFRYWlRT?=
 =?utf-8?B?cHB3VDJtVUdOVGxyTkZjanBQaHE0ZjVSUjNacHZLeitrLzQ5Zit5dlVIbGhh?=
 =?utf-8?B?eWpSbmVySTBHNXJ5cXU2Y0xINTNHRGFnazVUempGWnE3UlRmQ3lpWjVBc3JQ?=
 =?utf-8?B?ZnU1dS9rVERGRGdOc1pOWlVuZ0h6L3ZhaGZrNjNHTSs3TE54V3lIL2lZdGNr?=
 =?utf-8?B?aStDdWgwQVZSNnluQTB6Tm9TU3Fid01aVzNZbzNpbXBoMTh0RDllVWtCdzZj?=
 =?utf-8?B?b0tRTXVTRjFvT2dheW1hWUZZZWJ6L29XelNyamRMN0xrL21vbE1rajVyMXFO?=
 =?utf-8?B?THljTW1aVk9TV3gxVk11U25OaVk3Ni9pL1VlbXJDWmFBWFZUb2VGU0QwOTlo?=
 =?utf-8?B?RXJjZDFnQVBrUHZoZDRGak42ckNvSURQUmk1ZmlrWktXNldrb2hQb3lGTFQ0?=
 =?utf-8?B?cGN3YWlJQ05WQk53RWdZL3FIS0xmT3hGTmd3bWpzVXE4Q1NZRnNRTWRRM3lW?=
 =?utf-8?B?Y1VDRkpQNkNHenNrdVVUQ05wbUJ1emFpT2pwVm9sbGhsMDhEajBMRWlta0M1?=
 =?utf-8?B?WS9YTVA1TVFGV3RGK2FwcWlueVVacXE2K1pMZVdlZElPZG9IVGhaalh2b2ZG?=
 =?utf-8?B?Y1IwNWlid1ZabWF4OUdqUWV5WEpvR2xZTktmejZic0JDUktLL2hscVVGWGVh?=
 =?utf-8?B?NFZqZW00alM4SW53OTZMbSthZDhIeTZJSEluMGVZblpJVExvRkZiaVhMNHB4?=
 =?utf-8?B?MnZRSU5WS1ZuZllselhnZUVUdnNPcENSNmd2RlJKQ3JZdlo1STc3N2FuSzdE?=
 =?utf-8?B?Yk0wc3E3L2IyeFBRenFFaE1WalA0dlhHbVRTMHRnT2h4dkZZdHRQbmE0RDFu?=
 =?utf-8?B?SVUvNVFWSjY5KzZMYmVRMGRVL3V1MzZJR2Z1UTZZWktscmd6NDdxTzhpOW9z?=
 =?utf-8?B?UFg1VlIyL3dOb1EzN1FyQ3JBcjJvYmhZbkRWcU9qRnhuUytDM2x1cDJrYWZU?=
 =?utf-8?B?OXlpa3A1eFgvYlFENllDVHhNelB4MDFoNW82aldlc3J1MGpDSU5XNEt5Mlds?=
 =?utf-8?B?by9xVysycnNxMUtOaG9OYlFnQUhMMmVkcnRsaVBMUlNKbHZuazNYRmI0YUpn?=
 =?utf-8?B?NnJoMHRka2hsR3NOclhNOVpJamJja1IyRUgzYnI3MVVWQmZaZ2NVKzBlWEdn?=
 =?utf-8?B?a2plMXV4YTNLZHV3RVhHU2Q5OEwyWEhBUkIveHZBT1VkUWNtMHNZTUhZcGJ0?=
 =?utf-8?B?S0pGVFhmSXdTYUYzMjR5WDFFN0lUL01DUkJIMXhyNUJsSlQ1SjhwNmVVL05J?=
 =?utf-8?Q?PH/UmzGW0FqszAEuxHfA1UuWJrphyESR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkZnNWcwMzZkWnpqZkk5Q0lWMkFEdmpRMU5TLy9VTnVHWXFJdkw5VUx6ZWU0?=
 =?utf-8?B?MHlDWEpoZmphQzFuRTdkTEl3T1BsdVh2L2gwWUNqb2U0QjVJZ2J5QzZtOTRF?=
 =?utf-8?B?RFdoK09wTVN2NHZtYlBIaVRRQndvZWNnQjlpL0NYQk05TEtkaWxoSlN2RHlD?=
 =?utf-8?B?V2tCRUZhaTQ0OS9PaHpPNU1QUEF0YkFDU1MxVkpLT0x1Ykt1MjRQQ3ExaEhn?=
 =?utf-8?B?WGtabUFjNWdnYmlSL043bVByWUtLZnZLT2puUE54SFJZSEJlUE1HUEFiU0Vl?=
 =?utf-8?B?ZEl0aHRQZHhCZFRlSnliSDgzSHRRVTN2bEJrbHF3TSttdmJ5UTR6dWJiRU1O?=
 =?utf-8?B?TnRRNnhmV2p0RmVKbC9SNlRYWXJvWG4xdTZObUdUS0c2VUs4eHFiQjZiL3B6?=
 =?utf-8?B?YUtNYWp4djVBTFRzWWNvUzk5Vk8rMm9XN1pXUndXRE5xSENaMFc0ZmhlYjdR?=
 =?utf-8?B?NUpwMS8waGlxbFYxdDYyZHY4b0xMRUZMTjFOeDY0SkVCZFNyN09kNVZxdmtq?=
 =?utf-8?B?QTNYSjJ0QUtVckpSSVB1TlJRc2s2MXdGTVhaU010RmJQUi9MV2h1OFlzalhv?=
 =?utf-8?B?TjVyam5IUXN3ZnFqMHJvVDlnVVErdVBWL1IybjljSW0vTy9ETjBNdG03Vk1o?=
 =?utf-8?B?V0lCZHNKWUlYUmx2K2VVY0VUV08rSFBQYXlvbzV5TUsxbmtRNlhoUXAvRU5V?=
 =?utf-8?B?TWNmQUp6UmY0Qm9wdCtKOFJCZmpYU2RneWtHS096ek9rNVVsQ2RLc1FFb1lN?=
 =?utf-8?B?WVlPVmZUZTQ4TlRlc0FPUGRlc3lRV2xBaWQ2ayt6eC9DNDNINll6ZHlRQm43?=
 =?utf-8?B?MFAwbTZsM0hYRUpSQTlRMVRLajh4SVZ2RUtVekZOMWtSWmsxMk8vRkk4NXB5?=
 =?utf-8?B?bDFRSEJzOTJsSVIybkZGUGIvQzMwUHc5KzV4M09scnloNTA5UUV1anFjUDFi?=
 =?utf-8?B?dVNjTE1LRFF2cFVyYmR2TkhSdlJiYXVXc3hDcktpVmRubDAvOWlaOEJyOWpl?=
 =?utf-8?B?WTJiV2lna0tiVGJWM2xxYU9MQWtyQ0EzLzBzd25SY1NlaDFNMVNXT2QraDcr?=
 =?utf-8?B?RUdQSDVkdnZ6NlppbzFKK3oraitydjRWWmQ3UDE3QnNJbDFyaUp6cElaSkhE?=
 =?utf-8?B?U280dWFkSXhEdVBxS3p4b2dTMHg3OWpOR1pBSkxxRUJ4bCtackR5cVpwLzFo?=
 =?utf-8?B?Z040bkIzRld5bnd4QlpRV1JJREhydlpyQVRadTJPdmRRbXkwY1QwQUViVDVu?=
 =?utf-8?B?Mkg5TzIvRk9MalZFV3hQRzZ5eEJWenllZVlGQkRKelNqZG5CbloxL1dkVGx6?=
 =?utf-8?B?UUc1c2dwdkRIUExnb3pjMmVUbGNzcy94Yis0ZkQ0RU9rdkdrRDllVW5kUmQ5?=
 =?utf-8?B?dnZHNnRMYjZISXIrd1VsN2NGdWNFU1JjTDRuWXM5VGJjY0tQUmIrQ0dTQW5m?=
 =?utf-8?B?OHRFNXd1OG5Nanpiam9PM3hvNXF4K0hHNk1HUTAybUpaY1VpQ3hMbE1tanR4?=
 =?utf-8?B?K3NxVCtLZXc4SFkzTTVRVlNqVmtlMmRjMGpIOWs2TVFLWHFsOVI0cXRFblN0?=
 =?utf-8?B?UmVTZVNpZHNtQlk0azBqNFNZRGk3NjhReUpJM1NSdFdmTkh1ZGI5WHhkdGtR?=
 =?utf-8?B?ampZelpZd1labFNtMjFuNHdwYms5c3c1WUNZYmY3L2VXb1VrQXNZbFZiMkZp?=
 =?utf-8?B?cEdEZ0dCUVBpdTFrSWxjME8xME9nVy9FSFRFbHh5Q2xhcTBLTzVEMkVkRkoz?=
 =?utf-8?B?QkJBS2k0NG14MnViWmUyMFpLMFZuYlFidmRxampPL005MDV0RjNIdEZQQmV4?=
 =?utf-8?B?NkNyMyt2SnpuZVExL1VtbDlhZzdEL3BrNDF4UjBTWHc4Z1M5OGtpWHZ0RGl0?=
 =?utf-8?B?akdKanR4YVl6RnRLbjhIOEFYNEd4SklQcWhESDFZQS9WVTBrbWI3dHZCdllM?=
 =?utf-8?B?NlFaS2QyeFRJdGo1aEsyeS95TkFaenNUMGdXTDJwaVR2UVorK0F4dmRoK0lG?=
 =?utf-8?B?MG11WFl4UjNFdTQ3a01kTy9HS3gwWEw5MkRhNHFPOGp2eTNoSWNZS0Jaampr?=
 =?utf-8?B?T1lxMHJHcndENUVWekM0aldDMHNYV1dSQzRkejFxcUJtczcwaFU5azFMbGw2?=
 =?utf-8?Q?zAJqqb5FYbu8iV4HcJJwnhQrb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961974d2-ce8f-403b-8669-08de28234e49
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:55:24.0963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RkCPl/NRd4S5hPK9SKIGbrHSeMZVYbEv5Tj8kxB/4TXM41hBmsx58ZhWz0EAHiXWE86c7zLUE+FVrKfH1P+Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6953



On 11/19/2025 18:14, Ilpo Järvinen wrote:
> On Tue, 18 Nov 2025, Shyam Sundar S K wrote:
>> On 11/18/2025 21:31, Ilpo Järvinen wrote:
>>> On Tue, 18 Nov 2025, Ilpo Järvinen wrote:
>>>
>>>> On Fri, 14 Nov 2025, Mario Limonciello wrote:
>>>>> On 11/13/2025 1:33 AM, Shyam Sundar S K wrote:
>>>>>> On 11/12/2025 23:33, Mario Limonciello wrote:
>>>>>>> On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
>>>>>>>> From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
>>>>>>>>
>>>>>>>> Add aie2_smu_get_power_estimate() to obtain NPU power readings from the
>>>>>>>> AMD PMF driver. This xdna interface enables user space to reflect
>>>>>>>> current
>>>>>>>> workload power consumption in real time.
>>>>>>>
>>>>>>> But.. it doesn't.  It just adds a new function that could potentially
>>>>>>> do this job.  The actual gluing it to userspace in some way to use
>>>>>>> this function will be another patch.
>>>>>>
>>>>>> For now, yes.. that's right. XDNA team will add more support on it
>>>>>> that goes via the accel tree. But this patch is meant to have a
>>>>>> minimal change on the xdna side so that there is a  consumer of the
>>>>>> pmf symbol that is getting exported to the kernel.
>>>>>>
>>>>>> So, there is more support coming on the way. If you think, its worth
>>>>>> to rephrase the commit?
>>>>>
>>>>> Yes; that other support isn't happening this kernel cycle.  So the commit
>>>>> message should be accurate to what it's actually doing (laying ground work).
>>>>
>>>> To me it looks this and patch 4 should be submitted with the actual user 
>>>> instead of trying to justify things with far in the future changes. I've 
>>>> no problem with creating immutable branch if necessary when multiple trees 
>>>> are involved.
>>>
>>> In case it wasn't obvious, I'm fine with taking patches 1-3 in earlier.
>>>
>>
>> The context for this series is that the XDNA driver needs
>> power-related information, which is only available from the PMF
>> driver. We’re providing that information via an exported symbol.
>> Patch 4 exports the data and patch 5 begins consuming it. The goal is
>> to establish the channel through which power-related information can flow.
> 
> It doesn't consume anything, it just adds function without apparent 
> purpose (and this will remain so until the other work is submitted).
> 
>> Creating an immutable branch is a reasonable idea, but in this case
>> all further PMF-side work stops after this patch. The subsequent
>> activity is primarily on the XDNA side — for example, passing the
>> power data into the XRT environment via IOCTLs. If both trees had
>> active development or large, simultaneous changes, an immutable branch
>> would make sense, but given the current situation it doesn’t seem
>> worth the added complexity.
>>
>> The XDNA changes are distributed and will be implemented gradually;
>> they depend on this exported power information from PMF. So my
>> proposal is for PMF to export the information now with minimal changes
>> on the XDNA side, and land that upstream. The XDNA team can then build
>> on top of the exported interface, and their changes can be submitted
>> via the misc-drm tree.
>>
>> Ilpo, does this approach work for you?
> 
> Lets just wait with these two patches until have real consumer changes 
> ready to be submitted, these patches can appear at the head of such a 
> series.
> 

OK, I get your point. Thank you. Will have an internal discussion on
this and come back on what could be a best approach for this.

For now, I have dropped the patch 4 and 5 and sent out the rest for
review and they can be applied on mainline with 6fb7433c7b8e
("platform/x86/amd/pmf: Use ring buffer to store custom BIOS input
values") as the git tip.

Thanks,
Shyam
