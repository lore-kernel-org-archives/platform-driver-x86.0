Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793732909;
	b=F9zCVJiIGKCzLir6Jfh08dbFjyaF5RvVLxzXzcIMHU5qj7ZIv5rYcP/1E+9162xm18jF
	 C7+hyWejgZAZMPrNfvoDPwX8tTW6lFDEgtwAjEYwKlzciiORhb0/GrxlF7FVI47N4sPbr
	 EVx0Sf+02dw+TP8GN9COOoRUAW0YK1XN69FzaCfDNvBfpAukLMxm+CwU1ODJanqC3gOWT
	 6wp7LIUWqXDds87i6YjmRUK3+O3+/0jSj6ADdkWcMr5erMD2U8UobneftoLd4W5QLwPjL
	 mgKQW8YEfzm1yjMF0xASCsj0b9tOOvJ1LWHJ8Fk/SYAveDRo1hBe9dZzlo9Vme5Wk1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732909;
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
	bh=Kh+uke4Osnh2wbgG5okG7Vh+GpX/4gNFRb1dfoJEzRs=;
	b=reFoLSViVYjCYeZ3PpS7ICsHOJjiP4SI0MaVwGO0G4Uf3d+ua2nJiYi/tFnN8gt3hVkr
	 fOOVkpdDftUulNbqm58nI9x9y3vSvbHHo66M06OvQ+1PKiP6mzCn5KGBdF3k00JVtHilR
	 BRT08Z7CSORSC6zvIHmI2RQjUZMZCORJCx8b4kblb3yGGVEp0fTEeLvlUpHmr+xaOY1t6
	 9A1fT1KJ/rDOAo6vmaS9GrPe0pQiWhlOeDydJxSZEPURibX3aT7kgKrkv2JaYdp7qA2/4
	 GYDQFUYdPk0KjdvYKQZNVezybdgpojFVnP68LlGG7KlZE7/H6643XRWnOVPacqSKULg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3QS1SFed;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.23
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DA2606D83F;
	Tue,  3 Nov 2026 19:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DA2606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3QS1SFed
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szuyCMYsbvdS+56N8fsiRqI08tTUjDIgM/A3aHRdgmEn3+tsQB9551yvn0b1luoDMPo/6Cv/eQmdeDQ5yWbwjnUrc+6MqPXzNSlt7EPBA3zXY5bobPImrdK0z10I/dpZ+6LxopkpOn8U/FhfDPVA8eX4oYkNycr9uXbGcn7u3rWllpBrOKqFT3YJ+bTrOqDvpBOHlSAY0PjoVdw+/M6vkgdhFbMCaUH23T33jXiQMfyYCP7PT4DCVtdYQx9hwzOfbOEG+cHwJpP5qeBErbOMI66GTeXRnY000dMO3t5+uydNYshSqwcMp51ZhFkrM+BrL5IuqcOmwQEIzy7u4+v4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kh+uke4Osnh2wbgG5okG7Vh+GpX/4gNFRb1dfoJEzRs=;
 b=SWPZaCCzvQ+gFuhwgFFVItwIjtYL99AFpOE2qZIqCPXUrPYX+K0gRkrQsqk3lQVTDf8hwRXxKiXcn3rRJzbHWpfL6mkz7xUfkSrsepRfIjMt/z12PFrhJpbvMdwdjTvTNp4zxQ9Y9IXuPwfxjK/3iAJveYGt5/MHa0gLMpBClpMcw0alUmHOIxuScIwg83Dkej5vqFPHcKsYSZ3ClVwYAGTBlZ6ZVEhBgWlbCtNKdL+lmAsvpRG7zoxwTYkhHObNbGvu7ID2VXWxgBSf6mnB4U0VXaKH0LioddjVSIxSNkwBTJd7zw/3CM1QRBs+870LM2DMSvIxV9unopuL77sSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kh+uke4Osnh2wbgG5okG7Vh+GpX/4gNFRb1dfoJEzRs=;
 b=3QS1SFedyUouh7B5Q9aGJbO4d/78oWbjyF4OsbpxXEEqcxeBI14XkQcBnNZT0NFPOx37RvmmeefaTlasSF/lU8+17CnXCrsa/9ZLs7ZQi8bKDwIIoScJ9P9uGKdhzfANgZrSpTshak2+Uuxb2nBjl4CXyLokA8wxEN4ZxhtkrUU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15)
 by DSVPR12MB803185.namprd12.prod.outlook.com (2603:10b6:8:3ea::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 19:08:25 +0000
Received: from LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02]) by LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 19:08:25 +0000
Message-ID: <51f75131-017d-4cf6-a971-b4a9cb5049ab@amd.com>
Date: Tue, 3 Nov 2026 14:08:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] AMD ISP4: OV13B10 (OMNI13B1) rear camera on ASUS ROG Flow
 Z13 GZ302 - ISP comes up, SET_STREAM_CONFIG fails with error 6
To: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>,
 Caspar Adriani <caspar.adriani@proton.me>
Cc: Nirujogi Pratap <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>, Bin Du <bin.du@amd.com>,
 King Li <King.Li@amd.com>, Hans de Goede <hansg@kernel.org>,
 "Adam J . Sypniewski" <ajsyp@syptech.net>, amd-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me>
 <ea758386-13b0-4667-8eca-9aa4efefe92b@amd.com>
 <P9m7agZFwqTsT5eczqDOuUVoP-lGl6Nd8FLvknyAj7gm7R_4cwIpb2_3-DNis287elaS_x5ummKLdOf_rk7LcHZqnrTnjMuzEPcX2syIefg=@proton.me>
 <20261027093218.35631-1-saif.elden.hatim@gmail.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20261027093218.35631-1-saif.elden.hatim@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::13) To LV8PR12MB9133.namprd12.prod.outlook.com
 (2603:10b6:408:188::15)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9133:EE_|DSVPR12MB803185:EE_
X-MS-Office365-Filtering-Correlation-Id: b84e8bf3-c732-47e3-4e12-08df39ddd604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261028144727099003|261026121527099003|261026140227099003|261009223027099003|261102123227099003|261021121427099003|261022105027099003|261022115727099003|261022075727099003|261021123027099003|56012099006|11063799006|4143699003|3023799007|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wY4lMVuTyhxj/HSdmcF2UtVp9XHJyMg8yGR4dcL3n38CZDdV2ULmlFbgdC3LUpqjUT6mnPHj1+S4xtxKKNYiAvFQV5FpboYsIPdpvpO30WpiqN+3sPR46kGW2t0pgWiD7KxNeI7HSxGrl3KGX9XFlb9UUrTclarBsfyH87Q/gey+Q9wlMWNFLecai10YC84LI1jt/Q9Yz/j48Vcyq7ODdXE/ZYUAgz1wI7sqcrUHscPPv0vUcoeLsZX9YjbZoJwel1PP3s4YjcdKdmxcKiRK7IGsbPB3eyOvW2cd1+slsk1cz/KdbInMS5vX4+oe/q5H82CdqXu0N1YPkVJ5+mCDsMeieumYYgklW/Fc0EDJU/zllNmEaDuE6X4ArNJk3JS0WA0Am6pJKWwhCOnv07S32obkqom7lsmmHVasgta0ytNOt43RkKHZDwMWYwYcZDt5SyZG+cDrRtFf/1c9N4z02aGnB85bwk7NFlhyhcEb+od2CllqSt6kv+eQ/ben8ep3AYt6BTxsD/sv+hWX0ETB8NMOZN9IUmnXzY0prHHdtmQflO5Yp73yis3z+BZvCH83D9iCDDaJi6lhYksr2YPE9q87C5Adw9TUBperf9wuWZFeIP/IuC7xI2voKQx39RgM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003)(261102123227099003)(261021121427099003)(261022105027099003)(261022115727099003)(261022075727099003)(261021123027099003)(56012099006)(11063799006)(4143699003)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmZRWGpTWlQwWXNPUlJxZklVRnVVQWRBUzYvNHZKaHFEVmtVb1Z5ME1YWW1O?=
 =?utf-8?B?amlGdFFuSGMyN0xqSHg0Qi9GSHpRMlE3NGFwK0QyQ0xFdmdLT0t5amVsaU0v?=
 =?utf-8?B?Y3FHMUhGZVd5VEJpaVNBTEZyRHhKZHhtRllBQ25BVncyTW91eDRxbDRoZkpZ?=
 =?utf-8?B?NDFSa1pBYVlFbHVPcEVLQjVCZWtXTXdpU3dqdUZiYzl2TTYzb1ZFbUhvclBk?=
 =?utf-8?B?dkljN0taV1ZLVXNTbWxlYlExcjhTRkcxSUNTZ2pTaWI4Tlg4dlNuMFJVRXVr?=
 =?utf-8?B?VUw5MEdqMG8xVHdERlJHMUtTcHJ3bk1yVG9iZitiT2V4MTNMWjM2dE92cGIy?=
 =?utf-8?B?eitCSE96cG1Fb2h6L3JQSmY3R3JpelRFNEs2K0t0WENvQmFveWtocm0zY1JZ?=
 =?utf-8?B?QkttMndvYzQ4TUFMMHRkcVZxRU5GLzNZQWRBRHZ6R0RHVE5rVWVISUtSNWRK?=
 =?utf-8?B?MmZsVDh6bWN5R2tieGJTa2ttMk51RnJ1K0FlUmJRN3lhcExxQTBaVng4dith?=
 =?utf-8?B?VUh3ZlZDVkNydFJsMUg1Q3BDQndYeDZEYlRoUXkyTGZFZlMxNmkrb2RGUjQv?=
 =?utf-8?B?d2t0UXk4YVNKRHlhd2RqdmJFSm5XNUVWczZPdXB4ODRhWnBGOU5zaSt4QkR5?=
 =?utf-8?B?UktNZFBuZ0RybnpUN0pXWWQwNFltR2wzbmxEWVo1UUpCb3JEQnpNaEhhUFU1?=
 =?utf-8?B?amp1Tk14VU9sN2VwWXJxRmJHYWJXcTlCOERhSy96QUNEdjFsY0pzRnVITjNo?=
 =?utf-8?B?aVRkditrb0dRWG45VEUwSW4raEQxRm9vdHQ4MWRRdjRGdGt0TksxL2xVZHA3?=
 =?utf-8?B?TmJQanZacTAvWlpFWUpDWU5vazBwUzVjOG1qaVFhZ2dQWE9yb3M4a0padUUw?=
 =?utf-8?B?OGh5OVVrbHRuZlVkRDhEUmZKY1JDUGZrb2RwUGtzdHhGRWcvczJtd0Jubi9D?=
 =?utf-8?B?VzlmT09ueTFWRDM1ZmxROE5vakdjaktyOURSdVAyeDk1dGFlRS9BR3AzOWZp?=
 =?utf-8?B?ZnJoS3I4cmZVYlYxd3FLMlJoeG1mRC9GbVl3RWJ0d2hVaXdDMnVvdEhZQmh1?=
 =?utf-8?B?b1JWZmFER2RCVjlzV3o3bHFBbEVmVDREeEVGMUFIYU10cHVKcWJpYkx5amFy?=
 =?utf-8?B?cFI1dHRUd0tmSTZFNmJ3dWY0TVFOYjlBMkJYcFg0TnUvN3RZaUIyVElib0F6?=
 =?utf-8?B?d1JLTUMxK0JqSDhjdEdLZ2ZGbzlBQ0tSdDI4Zkl3eWpBZ0lLVkZoMVBUdFJj?=
 =?utf-8?B?WVJhNG5lanVudUExa2VtLy9LM1A2WnpoQUVxdFZmdU9paUpmSThpSnJZU0FM?=
 =?utf-8?B?YWFNSHBUeVRjMWl5ek9wcEdZYmYyalE5K3p5eGV0YTkwVzVQeEZIdkR1cWhR?=
 =?utf-8?B?TEVMcDMzRzEwc3VnRDRXSXhvbGV5d3AzYlpsMDU3bHNTUkFmTGdHRG1rWFhW?=
 =?utf-8?B?Y1QybzdyTHR2b2JDcTVvczhPbGMycythUnhaWXFDMXF1SkxUdU81RXhBODlL?=
 =?utf-8?B?MFVpRHppN2RVVkc4ZS90Mk1ER1V0OWhUV1RwNXJTYkpTNzk0TlUrOGFaakRm?=
 =?utf-8?B?dE93bDRsMkNoRXkyUE54TlFkRHljdFBmNjVBTFU3QVp3S2NPbkRoVlQxTm1p?=
 =?utf-8?B?UHlOaEtKaUhQWWsvb0U1aWo1cDl1VjN2ZE1mdE1LdEFIcGNqU0lDRUZGN1Z6?=
 =?utf-8?B?ZUFNY2plT05SbVhKSTBrcU1heXpRMEZ2WUJBV0VkQitRWW9aeU50YWZtN1RL?=
 =?utf-8?B?R0lQZFd0Vk90SW9BUEpwekp1dlcvS0FmOGplQVVtSEcrU1FjTDZKVEJUMWdQ?=
 =?utf-8?B?RFZDc1UxR0FVK2IzL3FyZTFOSWZMTHc5eXF3MzU1TjFCK25DMmdyTGRHS1pU?=
 =?utf-8?B?Rlh6d3hTNHMxYUhub2NVbXg3ZjRFWFpFVy9mSVNaRy9YZ0p1cE16ZmV5V2Za?=
 =?utf-8?B?ZjRDM01CMG1PYmg3ajd0bzNVclJSRUFudTUzWnloRFdMaFlaYm93UHJZeldn?=
 =?utf-8?B?Z3NvUWJ2MC94cHFEdHZ6bXFmeFgwSE5yeWphaXVnb2pjS1pCU0Z4ejR1Q3k3?=
 =?utf-8?B?OU1iNjhOaXZ0a3I0ZzdBTGh2T21GZmVTZElZMGJ4TzdkTUhXMnNRSUJEdDU5?=
 =?utf-8?B?Z1R6UDdHMDRDTmsvMmlVQmhiVnBXa1ZMZjBSR3B3RTE5eHhKZ0F2cTBmc0FX?=
 =?utf-8?B?b01WUHNzN0l1WXRldWZENjZRREpNWFdndTMrSXhYNHkvdmZXVytwOXNYbWxv?=
 =?utf-8?B?cVBmVitzNkNYZHFqTkxGMnF0L0FmQkYyZDZGODhtOXhjNXNEMTFBZlBYd3hY?=
 =?utf-8?B?N09XYWd5aVJueWJQYTBSRUlGMnJPc1dDZDJpZ21TbFBXS1lzRXFjdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84e8bf3-c732-47e3-4e12-08df39ddd604
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 19:08:25.2811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/N6r6XJvoEmssqqLKcz9wQwA1MIUoXFJLco7H5iPf39RWXltDrU1nf9SNgnOG3tekEf00Vrw55OPWwWQXYJ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB803185

Hi Seifelden,

On 10/27/2026 5:32 AM, Seifelden Abdelmonem wrote:
> [You don't often get email from saif.elden.hatim@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Caspar, Pratap, all,
> 
> I have the same laptop (GZ302EA) and have been working on the rear
> camera as well. Some results that may help this thread:
> 
> The rear camera streams on my machine (NV12 1920x1080, about 30 fps)
> with an out-of-tree setup. As Pratap explained, the stock
> linux-firmware image does not start this sensor; on my machine the
> camera runs with ISP firmware and sensor setup data from my own
> Windows driver installation, read from the Windows partition of that
> machine. I do not redistribute any of it. The firmware alone was not
> enough: getting a picture also took the board configuration and GPIO
> wiring below, changes in the isp4 capture driver and in the sensor
> setup, and the two fixes I sent to linux-media (link below).
> 
> Board details as seen from Linux on the GZ302:
> - The sensor is \_SB.CAMB (_HID "OMNI13B1") in an SSDT, without _CRS,
>    so ACPI describes no GPIO, clock or regulator for it.
> - I2C on the ISP's bus: the sensor answers at 0x10 once it is powered
>    and clocked; the focus motor is at 0x0c and the module EEPROM at
>    0x50, matching Caspar's scan. My guess is that with the stock
>    firmware the sensor never gets powered, because SET_STREAM_CONFIG
>    fails before that, which would explain why 0x10 did not ACK.
> - Sensor reset: amdisp-pinctrl GPIO 0, active low (the "reset" GPIO of
>    the ov13b10 driver), the same ISP GPIO as the OV05C10 enable line.
> - enable_isp (AMDI0030:00 pin 85, as for OMNI5C10): not confirmed on
>    this board. No ACPI device claims the pin, and the ISP also boots
>    with it left undriven.
> - Sensor clock: 24 MHz, as declared for the OV05C10 platform on the
>    same ISP; four CSI-2 lanes.
> 
> On the hang Caspar saw when stopping the stream, possibly related: when
> a stream is running across s2idle (start a stream, then "rtcwake -m
> mem -s 20"), no further frame arrives after resume, and stopping the
> stream logs "fail to disable stream" and "fail to stop stream" because
> the commands time out. On my machine the timeouts return and the
> device can be closed; the driver has no system-sleep callbacks.
> Caspar, did your hang happen after a suspend, or also without one, and
> did you see those two messages?
> 
> I sent two small isp4 fixes found on this machine to linux-media:
> https://lore.kernel.org/all/20261026182442.229869-1-saif.elden.hatim@gmail.com/
> After the merge window I plan to post the board data above as an RFC
> (amdgpu OMNI13B1 entry and GPIO lookups, amd_isp4 board configuration),
> explicitly not for merging until the firmware supports the sensor.
> 
> Pratap, you mentioned contacting testers once there is OV13B10
> firmware or a sensor-agnostic draft: I would be glad to test both on
> the GZ302 and can share logs, ACPI tables and v4l2-compliance output.
> My out-of-tree code (capture-driver changes, the board configuration
> and the test scripts) is in a repository I can share on request.
> 
> One question for the sensor-agnostic driver: will a board like this
> one describe its sensor through amdgpu and amd_isp4 tables as today,
> or will the firmware take the sensor setup from another source?
> 
Yes, even with the sensor-agnostic driver approach, we expect to follow 
a similar method by describing the sensor in the amdgpu and amd_isp4 
tables to enable support on AMD STX Halo-based platforms.

Thanks again for your support and willingness to help validate the 
sensor-agnostic ISP driver and firmware once they are ready.

Thanks,
Pratap

> Thanks,
> Seifelden

