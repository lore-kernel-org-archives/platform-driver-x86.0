Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013886;
	b=opsySSxTSv6SsOHzEDIxpYCeQ5tDVPj9r62c4xQ5UObaIkut2Qz6oo2OvYjeNmpK+8lw
	 HLZLNeoq5huvpwdFTIFvzwlXhkRzf6kIDbeN0VeoSc5CAEsYJ4vtgwd+9fCjoQOS4Bzbx
	 tVxC7DxNeQspOTsl92Daow6VI4m7ViUTUJLqxQ3gn83vLSXcIJqp0xkab3HlR9mpj+Hbc
	 QYXYFUIW3TL/8bHSEygqRJItoBGu4EKhz6pJm8swDePrmj173RVxYMEwAPioD/AdFRrp9
	 wTuV8hvapIelLnCa3r1RtKysT0tswkdICrqKaC6GLmbGwOAYvGI0B7Ai+fhsOKK8c9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013886;
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
	bh=QPsW0mhU3RtusYMc8hR4uYMnCpXgBGCxUJeqqfNzMIE=;
	b=Z+qAfg5iIhZn7I9OKvL0+pD/E/rqm1h/+Ng9TRHjI80M7cyVkdvdgmNaoYL0TakEd+zT
	 2JEFBVxazX+LR9VzK2Q6N0oGP13rBOCNCZb8azG/yqgbLBFv4y3WBd/eQexXB3+xGrikc
	 w7XtkMp2/7/+W40d6guy/9jyd5BAsf/c7pTRfEpvNWrI4Ds9zgM9MA7Ip9UahbnS4lRrp
	 3oRuAM+rkwArTjhywj8U2dvnJSmP3/w3Foej5ntXFCMhVk0IdamDvodrm6J8DaocLPhHk
	 vcHBlcTpz8P7fAcjAlXD9duD7V7JjCx/ScutMUB6RB4O1yUH0vm3jIY0zcW/hhKX2uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oKVJnqiY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.52
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C7D606A335
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C7D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oKVJnqiY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Roxf6fSC6rHinMrZs1Yh8aM9DKsbUnjKXCappYxuCh0fU8i5wCp1IOUktHeviXB0jp8YXsqXC39vMDxDYT2+HXjF/c8c5aKxVvGte+Dpdo1wr/nPohfUi29kLCpR8ZWRTxcv7+GuhPJFMcmheQ6GrDCgD19iR7tJ2YdvYa+c+9XM4ATuAUueYBPY7ghnfCb0jhJJBkXDSyEkVvGJtPeQWoj9iOXw+N0qT8pydWkje4AZckeDaJjGLdg5f6m5s0lsxQTJuvtjiKejGdHZ4b4jRhpDiq2hKcflL+hOTMLe8HNsksi/B3Yi9NCNeP2cnZATlzNeGRvhhJ30sWMqikrR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPsW0mhU3RtusYMc8hR4uYMnCpXgBGCxUJeqqfNzMIE=;
 b=EdJCiuV9QTMozNt+MkDsrgbNSLhOS3tM0+x9jWuBmHCkm6Alt13ZdOYF+M51Fqcn64XI8L06cOYcyFsZct+r+HFXYb8uogMBd3Wqj6154B3uRdlV2HUxIiiS78xfVP7rMryEtDhy7eBwjUWAJknxJ42A/EtdiUTu8Sc4MUe4xKHtDBW4slWwF7AmO3WSr4gXUmw8txCPKy0HhSopNO5YNvqm9mIfuNC1R0XE0xDbgIOc3OdGbWKCaFsCCjK3yCgLkgCZ+6YHU1nCDqfTVHZn8Q5lu46GPlj48l+ASHLHrnn/YK515KGg6ZHCiG7xDoonsmStkft1ZgnjZVfQ/cN1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPsW0mhU3RtusYMc8hR4uYMnCpXgBGCxUJeqqfNzMIE=;
 b=oKVJnqiYI/voWSCO3hb8iEcLEEtDEd9Mssp4NvrwXS4ZmvsC3VQrAkEhlUnRpXihmHPXzL8HyyvmMOn2j8rdPnfLDpuuQ6u+2VlCIyMekQkRsG9mPxsZEjGeGrZ4EJMgyI1Sd7UHaMi8e9LWsHOseua4ZLGgyZbRzxQ/WCKor54=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB999319.namprd12.prod.outlook.com
 (2603:10b6:510:40f::24) by CH3PR12MB9100.namprd12.prod.outlook.com
 (2603:10b6:610:1a8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:57:59 +0000
Received: from PH8PR12MB999319.namprd12.prod.outlook.com
 ([fe80::582a:6d15:9b75:5235]) by PH8PR12MB999319.namprd12.prod.outlook.com
 ([fe80::582a:6d15:9b75:5235%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 14:57:59 +0000
Message-ID: <340126c2-fc56-4a3f-bdaf-624c83b67193@amd.com>
Date: Wed, 18 Nov 2026 20:27:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI
 driver
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
 <20261010190543.563161-2-Shyam-sundar.S-k@amd.com>
 <ce77a57c-b4a6-41cc-a151-edd316697e3e@gmx.de>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ce77a57c-b4a6-41cc-a151-edd316697e3e@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::9) To PH8PR12MB999319.namprd12.prod.outlook.com
 (2603:10b6:510:40f::24)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB999319:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: 571759bb-bfdf-4b34-5ff1-08df458455dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|4143699003|5023799004|261026135527099003|56012099006|261021135927099003|261021130227099003|261021121427099003|261021133027099003|261021123027099003|10067099003|261009223027099003|261022075727099003|261102123227099003|261028144727099003|261022113327099003|261026121527099003|261026140227099003|261022105027099003|261026130827099003|261022115727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jEDKqvMvJz726nKbdkrjNFzNyaB46hIFJVFT+zLU5BxyI5cDh24AUnuTTLIz50395tNzdNKl7Z+x6b/NlSbqippNKXufmNlmWX/BzdW/j89ynN5OTMzOU1TedjSfELhFivmzgAvNhO2ybysdj5WCoujAVvKDFrMBOWUleeeV4v45LPEAOnZioXMCOhVfc6t3bRt5WrNG9yYavFy0eQFDgPvQmgJuEXvvTm/1MQEqFXp8Mo63mufQshzMpw3NzK0TiEKKdZEu8U4KMT+tVUG7+joz4jq0P+V8FW9YFLgW4berMXeK+0IF4vboOeXOiw9SQwcsyU9b8Va9DPRrnSpcUdZ7YOE0EOCZCtcee/jznb+YO4lZ1OSf9VP6dwTd5fEmDrcsSAaWLelQFGMhZXu8B1aRfx4xMLrMfXsgBp9KGHw1T+j7OL57ocGIRONVQ2TJ6DBrz3xYGYFdh4HCI27NP3eF/r610j/QAOPP/+lMegKZZkmaPKcAcFycH4uqfGz1t5jW7HSvIsxjvu7x42K8OlgKfixzEqTXOTxKkMPBSwRaidgxsPBRv2gfrmMjNxOr6D+goJ6xevIg8YTJLKfndLOU3viqYw5aVGelGoJ6Nc+a108F1ulx8GlQWvHYxXIGmosu4XX65eqcdPqt3kGitZ9iK5hHLhl11yDGLXjB4j4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB999319.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(5023799004)(261026135527099003)(56012099006)(261021135927099003)(261021130227099003)(261021121427099003)(261021133027099003)(261021123027099003)(10067099003)(261009223027099003)(261022075727099003)(261102123227099003)(261028144727099003)(261022113327099003)(261026121527099003)(261026140227099003)(261022105027099003)(261026130827099003)(261022115727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE94cmhkNG5vWXBvdUV0WkFKa0Q2Uit2MEZsejA3TWNIOU44Smh2VHlCOXor?=
 =?utf-8?B?L2V3eHFnY2pDaGx1K2dUazhqaDNHQXZrSFlTWFFOR1VsbUg4QkQ4Mlc1M0Y4?=
 =?utf-8?B?YVppeDJteU96bTFVRC8zRDBsZjQ2RVl2eDFFSCtBbmsvMUdsQllMQlUyd28y?=
 =?utf-8?B?VnRFeDJjelRkZFRIa2JseXRCVVFzWGE3am1lRjQwend4YXhibk9KKzh3eG9h?=
 =?utf-8?B?Y042TnVabmVuUGxjZC9lUWljZElGRmdONnNBR1BVelJpMXUycUtPTWRaSlRM?=
 =?utf-8?B?Sm9JaFhoUFNsTXZLMzZVekIxVGZJSDd5cVFvN3FiSm1wS01VSUdLWkNHVzdm?=
 =?utf-8?B?c0g3ek1xSlpGM1RWTEdmdUN3YkN4RWR4d0RIVmdxeHJBcE01aG1hUzFRckFM?=
 =?utf-8?B?empxa2RUTWxIc2pJSjQyMTN3d1JkOHNwcXVRQm85QzF4Ulh4Zk5ublN5dHA4?=
 =?utf-8?B?OVNXV3hWUDNFYWU0Wkw4QnpyZUI5Mmx3cktINU9aemgvZmR4aVk5dXBnYzlr?=
 =?utf-8?B?bFdEdUduRjZGNUI0VHJRTURhNThrT3VWWnQ2MHEwWVZVSkpFeTFWWVlGY1dz?=
 =?utf-8?B?WHNDNjRKY1F6SGJoT3R2QjJrS3gwNnBwdjlwR0crTWpmTHNyVjFUUWJWVm5T?=
 =?utf-8?B?b0VjcDFLNXhubnVsaWJUQXI1dmd1SDMxV1J2WGJHeDI5ekFlaENjZXVVZkVX?=
 =?utf-8?B?UVltRHROcWYyNjhrNGNiaGVXUUx6TEVkbFozeFJmUXJFcEhWa1hOK2FNNTJi?=
 =?utf-8?B?Z3RXQnhlWTA3VnJrRkFxeW11amZ4T2NkMlhFYzJpRzBQUFRFY25XdXE2aGx1?=
 =?utf-8?B?R012a01zMWI0a1pDeDBGQXdHUWlRQ3VBeUpKQnVlVzlsY1paZnZXazNiZkZp?=
 =?utf-8?B?ci9YUFlTM00rbktra2tzMGJ3M2JXWms3MFlCTHVWMHVuSmxoWDhmcm9RUW1E?=
 =?utf-8?B?WFk4ZGozWTN2VjJBSk5RbTJuMHNkNTZKSXZSQW9EUHNvVjR5b21zOVZrN1gr?=
 =?utf-8?B?cFpabWdnUCtFODRBQlV5YnJmNWIxK2FkZXNJWHY5T0tOOEtWVU9vVnI1ZUZv?=
 =?utf-8?B?UlFrRTFtZm5PYmlxam9SWGdDMEE4NmRTWUV4dFBpZlBqdlRPYnViKzNUcEcy?=
 =?utf-8?B?aU1jbVV2WU1wZFVCSXZDWkp0WHcyaFE2bGdaemxmYzc1N3BWZmhIbEQvMnNF?=
 =?utf-8?B?RVl5REwyaTRKcGJIQlpRS2ZKWGMzUGlGRUl0M1VtaVUyaGdHSXdGeldDM1Nm?=
 =?utf-8?B?NkZyK05FRkRGenJHdm9sWFoxVUxCMUYxOFpxOXhybXZwYkRMd05PWTlMalV1?=
 =?utf-8?B?UnhQWDdMelNqOUErQlY0TEwzSThSVXVGTGJvNXE2c210YzJnanZDZXpadTZP?=
 =?utf-8?B?WVd3Z1ZhaVFNSVlESCtNRW1wMmx5V3B0bU1hSi9uejEyZlJzUEVYVWlmd3lv?=
 =?utf-8?B?Qy8wSDdWTEI4dXMvSmpHWXlBMXNTcEtDbGlKZFBXdktibUJYY1p0bXFYVEJ3?=
 =?utf-8?B?cHhudnpkak0vUktZM3FXN1U0SUl3bFZqLzlGaU1PbUpqUjU3blFsSE5BOWcv?=
 =?utf-8?B?cUVuaGVFVDI5QmhDQllma3l3ZFFNckNwSkh5YVZDNU9vOUJZYTV5a0o0cHZ1?=
 =?utf-8?B?OThXU1VnREJ4NDRxRUNFY0J5MmVKNDhlTDlJMmNrWW9QeFY2Nmc5TVU2T0ZX?=
 =?utf-8?B?ZEZhTmNFTXZGQWEvTXVIK1hYeUFONU9lTU9KVzk1QWdVazhSRkNtYjdrZkpK?=
 =?utf-8?B?dUNGZXZTSmluZzdsb1NWNS8vdkhLQ3FJeEllMnVjYS93S0p3aTgzVGpUK2dJ?=
 =?utf-8?B?VTQyYkQyNjArd2lXaCtnN0ZzdERoNGVGWGhhdiswYTJxSFA2akFoNXgwd2xl?=
 =?utf-8?B?TzgraXlvR2NDbTlZNk5ITTg3WUZIdExod3hnSVZzSitqYjJwbU05Wk1CVmk0?=
 =?utf-8?B?bzdTallMdWxEc0ZXWVB1c05KWlhncE1LMTArVlg5eVZJZXJ6OXR0R2F2M0lj?=
 =?utf-8?B?RkVEem9ZT2tTZ1pEV0xNZjRHc0xQUFp5VGkwUWtxa2wzWlhUcnpIWU5wQ1RV?=
 =?utf-8?B?UVQxQ1JCMXU2dGVnV3gyeTdUckJLTlhUZXFVYXQ4OVNkaUdtVGl5WVNlajBV?=
 =?utf-8?B?RVZpSGoyNlNzTjdabE51Tm90bU90RTRCNkRGbC9RWFN0RVZkVmljYXVaUHhh?=
 =?utf-8?B?QXlYSkRkUURJRXA2cElERjE4UzNPZmtXUjJjcUVtMG5oQzZPcWtCUjJtRjJw?=
 =?utf-8?B?dHdaVVpRcXZENDJEMDF5K3JQdmJrRDFDY3cya3I3a1BBbW1tUWdmN3MycUx5?=
 =?utf-8?B?b0s0R05WeTZUcVFla1hRM3JoSGk0eE9UV2s3bFUxYWkzSmxlWU9VUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571759bb-bfdf-4b34-5ff1-08df458455dd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB999319.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:57:59.2475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4jujhTqB0tQHJigl7J355vcSwkzi98K0SVNpw2/MXYKrzwjG3OGrQUhKKVY3imcIv1hdZY3vMwE/KI79sNmOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100

Hi Armin,

Apologies for long delay in coming back with the answers for your questions.

On 16-10-2026 02:35, Armin Wolf wrote:
> Am 10.10.26 um 21:05 schrieb Shyam Sundar S K:
> 
>> AMD Ryzen platforms implement the AMD Overclocking (AOD) interface in the
>> platform firmware and expose it through a WMI device. The interface is
>> command based: the firmware lists the commands it supports, and for each
>> command the supported range or list of values can be queried and a new
>> value can be applied. On Windows, this interface is used by AMD Ryzen
>> Master.
>>
>> Add a driver for this WMI device. As a start, expose the following
>> settings through sysfs:
>>   - PPT, TDC and EDC limits (write-only) along with their supported range
>>     and step size
>>   - SMT enable
>>   - current memory clock (read-only)
>>
>> The firmware stores new values in its setup variables and applies them
>> on the next reboot. It does not report the active PPT, TDC and EDC
>> limits, so these attributes are write-only.
>>
>> The attributes are only created if the firmware lists the matching
>> command, and the property flag of each command is used to pick between
>> range and discrete value checks.
>>
>> The firmware supports many more commands, more attributes can be added
>> later as needed.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   .../ABI/testing/sysfs-platform-amd-wmi-aod    |  98 +++
>>   MAINTAINERS                                   |   7 +
>>   drivers/platform/x86/amd/Kconfig              |   1 +
>>   drivers/platform/x86/amd/Makefile             |   1 +
>>   drivers/platform/x86/amd/wmi/Kconfig          |  19 +
>>   drivers/platform/x86/amd/wmi/Makefile         |   8 +
>>   drivers/platform/x86/amd/wmi/aod.c            | 604 ++++++++++++++++++
>>   7 files changed, 738 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
>>   create mode 100644 drivers/platform/x86/amd/wmi/Kconfig
>>   create mode 100644 drivers/platform/x86/amd/wmi/Makefile
>>   create mode 100644 drivers/platform/x86/amd/wmi/aod.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod b/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
>> new file mode 100644
>> index 000000000000..1f7bb5b87434
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
>> @@ -0,0 +1,98 @@
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit
>> +Date:        February 2027
> 
> Hi,
> 
> please adjust the date values.
> 
>> +KernelVersion:    7.5
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +        (WO) Package Power Tracking (PPT) limit of the CPU in
>> +        microwatts. This is the maximum power the CPU socket is
>> +        allowed to draw.
>> +
>> +        The value must be within ppt_limit_min and ppt_limit_max and
>> +        ppt_limit_min plus a multiple of ppt_limit_step, otherwise
>> +        -EINVAL is returned. The firmware stores the new value and
>> +        applies it on the next reboot. The firmware does not report
>> +        the active value, so this attribute cannot be read.
>> +
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_min
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_max
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_step
>> +Date:        February 2027
>> +KernelVersion:    7.5
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +        (RO) Minimum, maximum and step size of the PPT limit in
>> +        microwatts supported by the platform.
>> +
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit
>> +Date:        February 2027
>> +KernelVersion:    7.5
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +        (WO) Thermal Design Current (TDC) limit of the CPU in
>> +        milliamps. This is the maximum current the voltage regulators
>> +        can deliver over a sustained period.
>> +
>> +        The value must be within tdc_limit_min and tdc_limit_max and
>> +        tdc_limit_min plus a multiple of tdc_limit_step, otherwise
>> +        -EINVAL is returned. The firmware stores the new value and
>> +        applies it on the next reboot. The firmware does not report
>> +        the active value, so this attribute cannot be read.
>> +
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_min
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_max
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_step
>> +Date:        February 2027
>> +KernelVersion:    7.5
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +        (RO) Minimum, maximum and step size of the TDC limit in
>> +        milliamps supported by the platform.
>> +
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit
>> +Date:        February 2027
>> +KernelVersion:    7.5
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +        (WO) Electrical Design Current (EDC) limit of the CPU in
>> +        milliamps. This is the peak current the voltage regulators
>> +        can deliver for a short period.
>> +
>> +        The value must be within edc_limit_min and edc_limit_max and
>> +        edc_limit_min plus a multiple of edc_limit_step, otherwise
>> +        -EINVAL is returned. The firmware stores the new value and
>> +        applies it on the next reboot. The firmware does not report
>> +        the active value, so this attribute cannot be read.
>> +
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_min
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_max
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_step
>> +Date:        February 2027
>> +KernelVersion:    7.5
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +        (RO) Minimum, maximum and step size of the EDC limit in
>> +        milliamps supported by the platform.
>> +
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/mem_clock
>> +Date:        February 2027
>> +KernelVersion:    7.5
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +        (RO) Current memory clock (MEMCLK) in MHz. For DDR memory the
>> +        data rate in MT/s is twice this value, for example 2800 for
>> +        DDR5-5600.
>> +
>> +What:        /sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/smt_enable
>> +Date:        February 2027
>> +KernelVersion:    7.5
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +        (RW) Simultaneous Multithreading (SMT) setting of the
>> +        platform firmware. Reading returns 1 if SMT is enabled and 0
>> +        otherwise.
>> +
>> +        Writing 0 or 1 changes the setting. Other values, or a value
>> +        the firmware does not support, are rejected with -EINVAL. The
>> +        firmware stores the new value and applies it on the next
>> +        reboot. Depending on the platform, enabling SMT again may
>> +        need a power cycle instead of a reboot.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 65e8a4b5c90b..d069d02665e2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1335,6 +1335,13 @@ F:    drivers/spi/spi-amd-pci.c
>>   F:    drivers/spi/spi-amd.c
>>   F:    drivers/spi/spi-amd.h
>>   +AMD WMI AOD DRIVER
>> +M:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +L:    platform-driver-x86@vger.kernel.org
>> +S:    Supported
>> +F:    Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
>> +F:    drivers/platform/x86/amd/wmi/
>> +
>>   AMD XDNA DRIVER
>>   M:    Min Ma <mamin506@gmail.com>
>>   M:    Lizhi Hou <lizhi.hou@amd.com>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index a1a74ef6c859..8f51901f98ca 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -7,6 +7,7 @@ source "drivers/platform/x86/amd/hsmp/Kconfig"
>>   source "drivers/platform/x86/amd/pmf/Kconfig"
>>   source "drivers/platform/x86/amd/pmc/Kconfig"
>>   source "drivers/platform/x86/amd/hfi/Kconfig"
>> +source "drivers/platform/x86/amd/wmi/Kconfig"
>>     config AMD_3D_VCACHE
>>       tristate "AMD 3D V-Cache Performance Optimizer Driver"
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index 2f467dbbfc8a..a3415f83cf03 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -13,3 +13,4 @@ obj-$(CONFIG_AMD_WBRF)        += wbrf.o
>>   obj-$(CONFIG_AMD_HALO_LED)    += amd_halo_led.o
>>   obj-$(CONFIG_AMD_ISP_PLATFORM)    += amd_isp4.o
>>   obj-$(CONFIG_AMD_HFI)        += hfi/
>> +obj-y                += wmi/
>> diff --git a/drivers/platform/x86/amd/wmi/Kconfig b/drivers/platform/x86/amd/wmi/Kconfig
>> new file mode 100644
>> index 000000000000..a8d2c35ef919
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/wmi/Kconfig
>> @@ -0,0 +1,19 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# AMD WMI drivers
>> +#
>> +
>> +config AMD_WMI_AOD
>> +    tristate "AMD Overclocking (AOD) WMI driver"
>> +    depends on ACPI_WMI
>> +    help
>> +      This driver adds support for the AMD Overclocking (AOD) WMI
>> +      interface found on AMD Ryzen platforms. It allows to change the
>> +      PPT, TDC and EDC limits and the SMT setting of the firmware, and
>> +      to read the current memory clock through sysfs.
>> +
>> +      Changing these settings can make the system unstable or damage
>> +      the hardware. If unsure, say N.
>> +
>> +      To compile this driver as a module, choose M here: the module
>> +      will be called amd-wmi-aod.
>> diff --git a/drivers/platform/x86/amd/wmi/Makefile b/drivers/platform/x86/amd/wmi/Makefile
>> new file mode 100644
>> index 000000000000..4848193aff88
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/wmi/Makefile
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Makefile for linux/drivers/platform/x86/amd/wmi
>> +# AMD WMI drivers
>> +#
>> +
>> +obj-$(CONFIG_AMD_WMI_AOD)    += amd-wmi-aod.o
>> +amd-wmi-aod-y            := aod.o
>> diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/amd/wmi/aod.c
>> new file mode 100644
>> index 000000000000..c64a02b5d379
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/wmi/aod.c
>> @@ -0,0 +1,604 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD Overclocking (AOD) WMI driver
>> + *
>> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/compiler_attributes.h>
>> +#include <linux/container_of.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/device.h>
>> +#include <linux/device/devres.h>
>> +#include <linux/errno.h>
>> +#include <linux/gfp_types.h>
>> +#include <linux/kobject.h>
>> +#include <linux/kstrtox.h>
>> +#include <linux/minmax.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +#include <linux/string.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/types.h>
>> +#include <linux/units.h>
>> +#include <linux/wmi.h>
>> +
>> +#include <linux/byteorder/generic.h>
>> +
>> +#define DRIVER_NAME            "amd-wmi-aod"
>> +#define AMD_AOD_WMI_GUID        "95F20B61-3D44-41F8-87E1-03CBF94C4E8F"
>> +
>> +/* WMI method IDs */
>> +#define AOD_QUERY_VERSION        1
>> +#define AOD_GET_OBJECT_ID        3
>> +#define AOD_GET_DVALUES            4
>> +#define AOD_RUN_COMMAND            5
>> +#define AOD_GET_MINMAX_STEPPING        6
>> +#define AOD_GET_OBJECT_ID2        8
> 
> On my device the WMI interface contains additional methods:
> 
> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Class to Query/Set a CLKValue"), guid("{95F20B61-3D44-41F8-87E1-03CBF94C4E8F}")]
> class AMD_ACPI {
>   [key, read] string InstanceName;
>   [read] boolean Active;
> 
>   [WmiMethodId(1), Implemented, read, write, Description("Get version")] void QueryVersion([out, Description("version")] uint32 version);
>   [WmiMethodId(2), Implemented, read, write, Description("WMI function init.")] void Init([out, Description("status")] uint8 status);
>   [WmiMethodId(3), Implemented, read, write, Description("Get BIOS ACPI support function table.")] void GetObjectID([out, Description("Get BIOS support Object ID table")] OIDPackage pack);
>   [WmiMethodId(4), Implemented, read, write, Description("Bios request data")] void Getdvalues([in, Description("ID used to identify")] uint32 ID, [out, Description("status")] GetdValuesPackage pack);
>   [WmiMethodId(5), Implemented, read, write, Description("Command Run")] void RunCommand([in, Description("In buffer")] uint8 Inbuf[8], [out, Description("Out buffer")] OutBuffer Outbuf);
>   [WmiMethodId(6), Implemented, read, write, Description("Get Min/Max/Stepping values")] void GetMinMaxSteppingValues([in, Description("ID used to identify")] uint32 ID, [out, Description("status")] GetMinMaxSteppingPackage pack);
>   [WmiMethodId(7), Implemented, read, write, Description("Get DIMM SPD data")] void GetDimmSpdData([in, Description("DIMM Index")] uint32 Index, [out, Description("SPD Data Buffer")] DimmSpdBuffer DimmSpdData);
>   [WmiMethodId(8), Implemented, read, write, Description("Get BIOS ACPI support function table2.")] void GetObjectID2([out, Description("Get BIOS support Object ID table2")] OIDPackage pack);
>   [WmiMethodId(9), Implemented, read, write, Description("Get RMP table")] void GetRmpData([out, Description("Get RMP table")] RMPPackage pack);
>   [WmiMethodId(10), Implemented, read, write, Description("Get OPP Heaer")] void GetOppTable([out, Description("Get Opp Heaer")] OPPHeader pack);
>   [WmiMethodId(11), Implemented, read, write, Description("Get OPP Data")] void GetOppData([in, Description("Profile Index")] uint32 Index, [out, Description("Opp Profile")] OPPProfole pack);
> };
> 
> Please add defines for those as well. I also suspect that WMI method 2 (Init()) should be called during probe.

Yes, the firmware expects Init() to be called before the other methods.
v2 calls it during probe.

> 
>> +
>> +/* Command IDs */
>> +#define AOD_CMD_MEM_CLOCK        0x00020001
>> +#define AOD_CMD_SMT_ENABLE        0x00020026
>> +#define AOD_CMD_PPT_LIMIT        0x00050001
>> +#define AOD_CMD_TDC_LIMIT        0x00050002
>> +#define AOD_CMD_EDC_LIMIT        0x00050003
> 
> I suggest you use a enum for this.
> 
>> +
>> +#define AOD_MAX_OID_COUNT        64
>> +#define AOD_DVALUES_COUNT        100
>> +
>> +/* Property flag of a command: discrete values or a linear range */
>> +#define AOD_PROPERTY_LINEAR        1
>> +
>> +#define to_amd_aod_attr(_attr)    container_of(_attr, struct amd_aod_attr, dev_attr)
>> +
>> +#define AMD_AOD_ATTR(_name, _mode, _show, _store, _setting, _field, _scale)    \
>> +    static struct amd_aod_attr amd_aod_attr_##_name = {            \
>> +        .dev_attr = __ATTR(_name, _mode, _show, _store),        \
>> +        .setting = _setting,                        \
>> +        .field = _field,                        \
>> +        .scale = _scale,                        \
>> +    }
>> +
>> +/*
>> + * GetObjectID/GetObjectID2 result: the length, followed by the ID and the
>> + * property arrays, followed by AOD_MAX_OID_COUNT WMI strings.
>> + *
>> + * The MOF defines fixed-size arrays for all results, so shorter buffers
>> + * are rejected.
>> + */
>> +struct amd_aod_oid_result {
>> +    __le32 length;
>> +    __le32 id[AOD_MAX_OID_COUNT];
>> +    __le32 property[AOD_MAX_OID_COUNT];
>> +} __packed;
> 
> According to the MOF definition OIDPackage also contains AOD_MAX_OID_COUNT strings at the end.
> Do the have any purpose? In any case their existence should at least still validated because
> some firmware implementations return truncated WMI buffers to signal errors.

The driver itself does not use the names, they are shown by the debugfs
files, which helps when looking at the command list of a new platform.
In v2 they are always parsed, so a truncated buffer is caught during
probe.

> 
>> +
>> +struct amd_aod_dvalues_result {
>> +    __le32 id;
>> +    __le32 current_value;
>> +    __le32 length;
>> +    __le32 dvalues[AOD_DVALUES_COUNT];
>> +} __packed;
>> +
>> +struct amd_aod_minmax_result {
>> +    __le32 id;
>> +    __le32 current_value;
>> +    __le32 min;
>> +    __le32 max;
>> +    __le32 stepping;
>> +} __packed;
>> +
>> +/* Start of the RunCommand result buffer */
>> +struct amd_aod_run_command_result {
>> +    __le16 smi_cmd;
>> +    __le32 smi_status;
>> +} __packed;
>> +
>> +/* Command list returned by GetObjectID/GetObjectID2 */
>> +struct amd_aod_oid_package {
>> +    u32 length;
>> +    u32 id[AOD_MAX_OID_COUNT];
>> +    u32 property[AOD_MAX_OID_COUNT];
>> +} __packed;
> 
> Does this struct still have to be packed?
> 
>> +
>> +enum amd_aod_setting {
>> +    AOD_SETTING_PPT,
>> +    AOD_SETTING_TDC,
>> +    AOD_SETTING_EDC,
>> +    AOD_SETTING_MEM_CLOCK,
>> +    AOD_SETTING_SMT,
>> +    AOD_SETTING_MAX,
>> +};
>> +
>> +enum amd_aod_field {
>> +    AOD_FIELD_CURRENT,
>> +    AOD_FIELD_MIN,
>> +    AOD_FIELD_MAX,
>> +    AOD_FIELD_STEP,
>> +};
>> +
>> +struct amd_aod_data {
>> +    struct wmi_device *wdev;
>> +    struct mutex lock;    /* Serializes WMI calls and protects the fields below */
>> +    bool supported[AOD_SETTING_MAX];
>> +    bool linear[AOD_SETTING_MAX];
>> +};
>> +
>> +struct amd_aod_attr {
>> +    struct device_attribute dev_attr;
>> +    enum amd_aod_setting setting;
>> +    enum amd_aod_field field;
>> +    u32 scale;    /* sysfs units per firmware unit */
>> +};
>> +
>> +static const u32 amd_aod_setting_cmd[AOD_SETTING_MAX] = {
>> +    [AOD_SETTING_PPT] = AOD_CMD_PPT_LIMIT,
>> +    [AOD_SETTING_TDC] = AOD_CMD_TDC_LIMIT,
>> +    [AOD_SETTING_EDC] = AOD_CMD_EDC_LIMIT,
>> +    [AOD_SETTING_MEM_CLOCK] = AOD_CMD_MEM_CLOCK,
>> +    [AOD_SETTING_SMT] = AOD_CMD_SMT_ENABLE,
>> +};
>> +
>> +static bool amd_aod_is_limit(enum amd_aod_setting setting)
>> +{
>> +    switch (setting) {
>> +    case AOD_SETTING_PPT:
>> +    case AOD_SETTING_TDC:
>> +    case AOD_SETTING_EDC:
>> +        return true;
>> +    default:
>> +        return false;
>> +    }
>> +}
>> +
>> +/*
>> + * The firmware reads the input buffer even for methods that take no
>> + * arguments, so a dummy 32-bit argument is passed to those methods.
>> + */
>> +static int amd_aod_call(struct amd_aod_data *data, u32 method_id, u32 arg,
>> +            struct wmi_buffer *out, size_t min_size)
>> +{
>> +    __le32 in_arg = cpu_to_le32(arg);
>> +    const struct wmi_buffer in = {
>> +        .length = sizeof(in_arg),
>> +        .data = &in_arg,
>> +    };
>> +
>> +    return wmidev_invoke_method(data->wdev, 0, method_id, &in, out, min_size);
>> +}
>> +
>> +static int amd_aod_query_version(struct amd_aod_data *data, u32 *version)
>> +{
>> +    struct wmi_buffer out;
>> +    int ret;
>> +
>> +    ret = amd_aod_call(data, AOD_QUERY_VERSION, 0, &out, sizeof(__le32));
>> +    if (ret)
>> +        return ret;
>> +
>> +    *version = le32_to_cpup(out.data);
>> +    kfree(out.data);
>> +
>> +    return 0;
>> +}
>> +
>> +static void amd_aod_parse_object_id(const struct wmi_buffer *out,
>> +                    struct amd_aod_oid_package *pkg)
>> +{
>> +    const struct amd_aod_oid_result *res = out->data;
>> +    int i;
>> +
>> +    pkg->length = min(le32_to_cpu(res->length), AOD_MAX_OID_COUNT);
>> +    for (i = 0; i < AOD_MAX_OID_COUNT; i++) {
>> +        pkg->id[i] = le32_to_cpu(res->id[i]);
>> +        pkg->property[i] = le32_to_cpu(res->property[i]);
>> +    }
>> +}
>> +
>> +static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
>> +                 struct amd_aod_oid_package *pkg)
>> +{
>> +    struct wmi_buffer out;
>> +    int ret;
>> +
>> +    ret = amd_aod_call(data, method_id, 0, &out, sizeof(struct amd_aod_oid_result));
>> +    if (ret)
>> +        return ret;
>> +
>> +    amd_aod_parse_object_id(&out, pkg);
>> +    kfree(out.data);
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_aod_get_dvalues(struct amd_aod_data *data, u32 cmd_id,
>> +                   struct amd_aod_dvalues_result *res)
>> +{
>> +    struct wmi_buffer out;
>> +    int ret;
>> +
>> +    ret = amd_aod_call(data, AOD_GET_DVALUES, cmd_id, &out, sizeof(*res));
>> +    if (ret)
>> +        return ret;
>> +
>> +    memcpy(res, out.data, sizeof(*res));
>> +    kfree(out.data);
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_aod_get_minmax_stepping(struct amd_aod_data *data, u32 cmd_id,
>> +                       struct amd_aod_minmax_result *res)
>> +{
>> +    struct wmi_buffer out;
>> +    int ret;
>> +
>> +    ret = amd_aod_call(data, AOD_GET_MINMAX_STEPPING, cmd_id, &out, sizeof(*res));
>> +    if (ret)
>> +        return ret;
>> +
>> +    memcpy(res, out.data, sizeof(*res));
>> +    kfree(out.data);
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_aod_run_command(struct amd_aod_data *data, u32 cmd_id, u32 value, u32 *status)
>> +{
>> +    __le32 args[2] = { cpu_to_le32(cmd_id), cpu_to_le32(value) };
>> +    const struct wmi_buffer in = {
>> +        .length = sizeof(args),
>> +        .data = args,
>> +    };
>> +    const struct amd_aod_run_command_result *res;
>> +    struct wmi_buffer out;
>> +    int ret;
>> +
>> +    ret = wmidev_invoke_method(data->wdev, 0, AOD_RUN_COMMAND, &in, &out, sizeof(*res));
>> +    if (ret)
>> +        return ret;
>> +
>> +    res = out.data;
>> +    *status = le32_to_cpu(res->smi_status);
>> +    kfree(out.data);
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_aod_set_value(struct amd_aod_data *data, u32 cmd_id, u32 value)
>> +{
>> +    u32 status;
>> +    int ret;
>> +
>> +    ret = amd_aod_run_command(data, cmd_id, value, &status);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return status ? -EIO : 0;
>> +}
>> +
>> +/* Read the current value, using the method that matches the command property */
>> +static int amd_aod_get_current(struct amd_aod_data *data, enum amd_aod_setting setting,
>> +                   u32 *value)
>> +{
>> +    u32 cmd_id = amd_aod_setting_cmd[setting];
>> +    struct amd_aod_dvalues_result dres;
>> +    struct amd_aod_minmax_result mres;
> 
> Having 1 Kb sitting on the stack seems dangerous to me. Since all WMI calls are protected by a mutex,
> i think you can move those into struct amd_aod_data and maybe leave a comment explaining why
> they are not allocated on the stack.
> 
>> +    int ret;
>> +
>> +    if (data->linear[setting]) {
>> +        ret = amd_aod_get_minmax_stepping(data, cmd_id, &mres);
>> +        if (ret)
>> +            return ret;
>> +
>> +        if (le32_to_cpu(mres.id) != cmd_id)
>> +            return -EPROTO;
>> +
>> +        *value = le32_to_cpu(mres.current_value);
>> +        return 0;
>> +    }
>> +
>> +    ret = amd_aod_get_dvalues(data, cmd_id, &dres);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (le32_to_cpu(dres.id) != cmd_id)
>> +        return -EPROTO;
>> +
>> +    *value = le32_to_cpu(dres.current_value);
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * Linear commands accept values within the min/max range in multiples of
>> + * the step size, discrete commands only accept the values listed by the
>> + * firmware.
>> + */
>> +static int amd_aod_check_value(struct amd_aod_data *data, enum amd_aod_setting setting,
>> +                   u32 value)
>> +{
>> +    u32 cmd_id = amd_aod_setting_cmd[setting];
>> +    struct amd_aod_dvalues_result dres;
>> +    struct amd_aod_minmax_result mres;
> 
> Same as above.
> 
>> +    u32 min, max, step, count, i;
>> +    int ret;
>> +
>> +    if (data->linear[setting]) {
>> +        ret = amd_aod_get_minmax_stepping(data, cmd_id, &mres);
>> +        if (ret)
>> +            return ret;
>> +
>> +        min = le32_to_cpu(mres.min);
>> +        max = le32_to_cpu(mres.max);
>> +        step = le32_to_cpu(mres.stepping);
>> +
>> +        if (value < min || value > max)
>> +            return -EINVAL;
>> +
>> +        if (step && (value - min) % step)
>> +            return -EINVAL;
>> +
>> +        return 0;
>> +    }
>> +
>> +    ret = amd_aod_get_dvalues(data, cmd_id, &dres);
>> +    if (ret)
>> +        return ret;
>> +
>> +    count = min(le32_to_cpu(dres.length), AOD_DVALUES_COUNT);
>> +    for (i = 0; i < count; i++) {
>> +        if (le32_to_cpu(dres.dvalues[i]) == value)
>> +            return 0;
>> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +
>> +static ssize_t amd_aod_value_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +    struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
>> +    struct amd_aod_data *data = dev_get_drvdata(dev);
>> +    u32 value;
>> +    int ret;
>> +
>> +    guard(mutex)(&data->lock);
>> +
>> +    ret = amd_aod_get_current(data, aod_attr->setting, &value);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return sysfs_emit(buf, "%llu\n", (u64)value * aod_attr->scale);
>> +}
>> +
>> +static ssize_t amd_aod_range_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +    struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
>> +    struct amd_aod_data *data = dev_get_drvdata(dev);
>> +    u32 cmd_id = amd_aod_setting_cmd[aod_attr->setting];
>> +    struct amd_aod_minmax_result res;
>> +    u32 value;
>> +    int ret;
>> +
>> +    guard(mutex)(&data->lock);
>> +
>> +    ret = amd_aod_get_minmax_stepping(data, cmd_id, &res);
>> +    if (ret)
>> +        return ret;
>> +
>> +    switch (aod_attr->field) {
>> +    case AOD_FIELD_MIN:
>> +        value = le32_to_cpu(res.min);
>> +        break;
>> +    case AOD_FIELD_MAX:
>> +        value = le32_to_cpu(res.max);
>> +        break;
>> +    default:
>> +        value = le32_to_cpu(res.stepping);
>> +        break;
>> +    }
>> +
>> +    return sysfs_emit(buf, "%llu\n", (u64)value * aod_attr->scale);
>> +}
>> +
>> +static ssize_t amd_aod_value_store(struct device *dev, struct device_attribute *attr,
>> +                   const char *buf, size_t count)
>> +{
>> +    struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
>> +    struct amd_aod_data *data = dev_get_drvdata(dev);
>> +    u32 value;
>> +    int ret;
>> +
>> +    ret = kstrtou32(buf, 10, &value);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (value % aod_attr->scale)
>> +        return -EINVAL;
>> +
>> +    /* smt_enable only accepts 0 and 1 */
>> +    if (aod_attr->setting == AOD_SETTING_SMT && value > 1)
>> +        return -EINVAL;
>> +
>> +    value /= aod_attr->scale;
>> +
>> +    guard(mutex)(&data->lock);
>> +
>> +    ret = amd_aod_check_value(data, aod_attr->setting, value);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = amd_aod_set_value(data, amd_aod_setting_cmd[aod_attr->setting], value);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return count;
>> +}
>> +
>> +AMD_AOD_ATTR(ppt_limit, 0200, NULL, amd_aod_value_store,
>> +         AOD_SETTING_PPT, AOD_FIELD_CURRENT, MICROWATT_PER_MILLIWATT);
>> +AMD_AOD_ATTR(ppt_limit_min, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_PPT, AOD_FIELD_MIN, MICROWATT_PER_MILLIWATT);
>> +AMD_AOD_ATTR(ppt_limit_max, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_PPT, AOD_FIELD_MAX, MICROWATT_PER_MILLIWATT);
>> +AMD_AOD_ATTR(ppt_limit_step, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_PPT, AOD_FIELD_STEP, MICROWATT_PER_MILLIWATT);
>> +AMD_AOD_ATTR(tdc_limit, 0200, NULL, amd_aod_value_store,
>> +         AOD_SETTING_TDC, AOD_FIELD_CURRENT, 1);
>> +AMD_AOD_ATTR(tdc_limit_min, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_TDC, AOD_FIELD_MIN, 1);
>> +AMD_AOD_ATTR(tdc_limit_max, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_TDC, AOD_FIELD_MAX, 1);
>> +AMD_AOD_ATTR(tdc_limit_step, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_TDC, AOD_FIELD_STEP, 1);
>> +AMD_AOD_ATTR(edc_limit, 0200, NULL, amd_aod_value_store,
>> +         AOD_SETTING_EDC, AOD_FIELD_CURRENT, 1);
>> +AMD_AOD_ATTR(edc_limit_min, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_EDC, AOD_FIELD_MIN, 1);
>> +AMD_AOD_ATTR(edc_limit_max, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_EDC, AOD_FIELD_MAX, 1);
>> +AMD_AOD_ATTR(edc_limit_step, 0400, amd_aod_range_show, NULL,
>> +         AOD_SETTING_EDC, AOD_FIELD_STEP, 1);
>> +AMD_AOD_ATTR(mem_clock, 0400, amd_aod_value_show, NULL,
>> +         AOD_SETTING_MEM_CLOCK, AOD_FIELD_CURRENT, 1);
>> +AMD_AOD_ATTR(smt_enable, 0600, amd_aod_value_show, amd_aod_value_store,
>> +         AOD_SETTING_SMT, AOD_FIELD_CURRENT, 1);
>> +
>> +static struct attribute *amd_aod_attrs[] = {
>> +    &amd_aod_attr_ppt_limit.dev_attr.attr,
>> +    &amd_aod_attr_ppt_limit_min.dev_attr.attr,
>> +    &amd_aod_attr_ppt_limit_max.dev_attr.attr,
>> +    &amd_aod_attr_ppt_limit_step.dev_attr.attr,
>> +    &amd_aod_attr_tdc_limit.dev_attr.attr,
>> +    &amd_aod_attr_tdc_limit_min.dev_attr.attr,
>> +    &amd_aod_attr_tdc_limit_max.dev_attr.attr,
>> +    &amd_aod_attr_tdc_limit_step.dev_attr.attr,
>> +    &amd_aod_attr_edc_limit.dev_attr.attr,
>> +    &amd_aod_attr_edc_limit_min.dev_attr.attr,
>> +    &amd_aod_attr_edc_limit_max.dev_attr.attr,
>> +    &amd_aod_attr_edc_limit_step.dev_attr.attr,
>> +    &amd_aod_attr_mem_clock.dev_attr.attr,
>> +    &amd_aod_attr_smt_enable.dev_attr.attr,
>> +    NULL
>> +};
> 
> Please mark the attributes and the array as const (const AMD_AOD_ATTR + static const struct attribute *const amd_aod_attrs[] { ... }).
> 
>> +
>> +static umode_t amd_aod_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
>> +{
>> +    struct amd_aod_data *data = dev_get_drvdata(kobj_to_dev(kobj));
>> +    struct device_attribute *dev_attr = container_of(attr, struct device_attribute, attr);
>> +    enum amd_aod_setting setting = to_amd_aod_attr(dev_attr)->setting;
>> +
>> +    if (!data->supported[setting])
>> +        return 0;
>> +
>> +    /* The limits and their range are only supported for linear commands */
>> +    if (amd_aod_is_limit(setting) && !data->linear[setting])
>> +        return 0;
>> +
>> +    return attr->mode;
>> +}
>> +
>> +static const struct attribute_group amd_aod_group = {
>> +    .attrs = amd_aod_attrs,
>> +    .is_visible = amd_aod_attr_is_visible,
>> +};
>> +__ATTRIBUTE_GROUPS(amd_aod);
> 
> Please use .attrs_const and .is_visible_const instead.
> 
>> +
>> +static void amd_aod_scan_settings(struct amd_aod_data *data,
>> +                  const struct amd_aod_oid_package *pkg)
>> +{
>> +    int i, j;
>> +
>> +    for (i = 0; i < pkg->length; i++) {
>> +        for (j = 0; j < AOD_SETTING_MAX; j++) {
>> +            if (pkg->id[i] != amd_aod_setting_cmd[j])
>> +                continue;
>> +
>> +            data->supported[j] = true;
>> +            data->linear[j] = pkg->property[i] == AOD_PROPERTY_LINEAR;
>> +        }
>> +    }
>> +}
>> +
>> +static int amd_aod_detect_settings(struct amd_aod_data *data)
>> +{
>> +    struct amd_aod_oid_package *pkg;
>> +    int ret;
>> +
>> +    pkg = kzalloc_obj(*pkg);
>> +    if (!pkg)
>> +        return -ENOMEM;
>> +
>> +    ret = amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg);
>> +    if (ret)
>> +        goto out;
>> +
>> +    amd_aod_scan_settings(data, pkg);
>> +
>> +    /* GetObjectID2 might not be implemented by all firmware versions */
>> +    if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg))
>> +        dev_dbg(&data->wdev->dev, "GetObjectID2 not available\n");
>> +    else
>> +        amd_aod_scan_settings(data, pkg);
> 
> Can this be detected based on the return value of QueryVersion()?

Unfortunately it is not documented from which interface version on
GetObjectID2 is available, so the driver keeps trying it and continues
without it if the call fails.

> 
>> +
>> +out:
>> +    kfree(pkg);
>> +
>> +    return ret;
>> +}
>> +
>> +static int amd_aod_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +    struct device *dev = &wdev->dev;
>> +    struct amd_aod_data *data;
>> +    u32 version;
>> +    int ret;
>> +
>> +    data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    data->wdev = wdev;
>> +
>> +    ret = devm_mutex_init(dev, &data->lock);
>> +    if (ret)
>> +        return ret;
>> +
>> +    dev_set_drvdata(dev, data);
>> +
>> +    /* Make sure that the firmware interface is functional */
>> +    ret = amd_aod_query_version(data, &version);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "Failed to query AOD interface version\n");
> 
> Does AMD have a list of valid interface version numbers? If yes then you should check here
> if the given firmware interface is supported.

There is no fixed list. The interface is kept backwards compatible, so
the driver only uses QueryVersion to check that the interface responds.
In v2 the version is stored in struct amd_aod_data as you suggested.

All your other comments on this series are addressed in v2.

Thanks,
Shyam
