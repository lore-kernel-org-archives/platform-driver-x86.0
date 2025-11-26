Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2102D979C
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149791; cv=fail; b=n2cTxGfR9UfbFrfWY84p65YIMHZMjYBNsoSQA/aJYkusJwRqYLLeVVW3Qw1Y7XJXdLrS9j3nCNLINskis3bC9m0aIU+VLUFS+Qla1vVAhyLVJ5fp3egNZ15vuzSXZpLsgr3YayUjK+gTg6cTRp2Wp+8H8vCMKC7aFbYcpplbEhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149791; c=relaxed/simple;
	bh=evTLa+TlXouvW/S2WxHNPQFHrSUMo6bRUK8J0JStsyc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=our+ZpLS8ONyG1aHSmUo6Gi9JmdTM5g10LeMnTf5dZ+J6DGz5SfNyT8rvF1GoUlqZoPV2cRDR6U6rQOshKc5fZ9nVx2yCb7RKulgfYh9keA6wbUbaEZDNanzGhXwmsdHJM+3e5We5Pog757TDudSLFtkjruHyvTn6l+YPsfyTuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xl3lwolj; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xl3lwolj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcnwjGhJGpw8xZeB71/9/SlQZfjH6GsSwp1olJ+ZBideRgbFltCFCg4NvnG2DP8cG0OMLQM3qYyuYnvd1XopyNGateW+ZJCn5jtWyIgJik6h/1dzobzgr1pAf1ISotcfKmF5hJQ9h1hHnukXQ0E9rKKGoQC4w8rvGVQGObw6JKknYhdtUHmHrcR9oDVi2K4c9tgBLWeS4pNZ7e/4i6qR+0tXJKsjgXI4omn3YNDR4ZILdRyYu+BOUN8PhMjeZEDFloiXggRLURIM2pUXpzgoiAiStLLFMBtEx8Ll/gpEuj5f/N7MJ3Q6ZdhFeDtw4Z9k5YLxjWotybkFhyzuAbvhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pcYDqrdrq9UESsUG3ssFmpHrYWqLnH3663nmAw+/go=;
 b=N7ZXWx1b6ja4fPfkzSoQoyEx3jKZ369GjaPmqcBN5OD9y8MOZH9voGFyrdHjVz3jyb9ZEWM3mj0IdBGrWlVEJJQkIF39McVP251pG3Y80Fnq9mqT7IaOA+0fVYhg/ftYPCg42cEhdLT0KecNk0D/qxxSqDZJxAR6CgllSW35p9LRZ+ccT5FB7O12fVl6S9CpY9CqyEKvCXzaH/Ke6azQwnkZzC9lvvHbn+AfqxNkxISPnDgv8XrPxsVUkHVpBppHn+e1Op+K0IyeB1e4i/cnE/kxwn4wyCPrqfhrpsQLnNs5WNoSHbcxn1LKRpkA7zrmBIUAcd81I++YHzeuwPPvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pcYDqrdrq9UESsUG3ssFmpHrYWqLnH3663nmAw+/go=;
 b=xl3lwoljdoEqRk3XpvObFSGBd9Y4fu8W33a6cvzn2uR2n+jiSe0RUGL8cnW1FuXbpxmwJG2l4i7zyH4Wb1A9OM46/KiREl1mdwueDbYkfr9Ol8D+a+IExSInVhAcIMSkhZW2CWLL+eFwOAUbQ5rziEHtGnRNEOYYuJ3VOLwqQW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5177.namprd12.prod.outlook.com (2603:10b6:408:11a::19)
 by IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:36:27 +0000
Received: from BN9PR12MB5177.namprd12.prod.outlook.com
 ([fe80::d8ff:d187:656:572d]) by BN9PR12MB5177.namprd12.prod.outlook.com
 ([fe80::d8ff:d187:656:572d%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 09:36:27 +0000
Message-ID: <afbd9bda-5219-4809-a466-61f0d73bf24d@amd.com>
Date: Wed, 26 Nov 2025 15:06:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] platform/x86/amd/pmf: cache BIOS output values for
 user-space telemetry via util IOCTL
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
 <20251111071010.4179492-3-Shyam-sundar.S-k@amd.com>
 <6f4f236e-6dab-46ce-ea3f-fb5805d0116b@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <6f4f236e-6dab-46ce-ea3f-fb5805d0116b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::20) To BN9PR12MB5177.namprd12.prod.outlook.com
 (2603:10b6:408:11a::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5177:EE_|IA0PR12MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: db9874b9-7ac9-4a3b-75e8-08de2ccf45b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3UycmVIdlVKUDFBaTZ3NUlNM1VQcjd1QTRmS3dHaWdrZmt1UXU4ZWk2R1JL?=
 =?utf-8?B?c1J2T09lTVE4eXhCY2d6emdWYmVyZHZZUDRMUGE5Z1N3ZktYQW1FaXJ5eEZa?=
 =?utf-8?B?SVdydk92dG5jd1M0ai9aV0JHYys3a3RDbm9tTWtLLzh5MndkZmhhYWxTcHBQ?=
 =?utf-8?B?aXMvM0U4aUUyRDVCNVUzeFJyYTBJYW9FOWdZa01OL0xZNWhkbmlmQ1hROHU2?=
 =?utf-8?B?ODVoVUJSYmhQalhYc3Y2V3E0aklsMjJ1VWNFS040d28xZ2RLTHdhQklHQk9q?=
 =?utf-8?B?QjlMZUw2SmhSelF5Y1ZuYkI5ODZhS29pa0tYOFQ1SDIzbEs2WERCRU1tZGZF?=
 =?utf-8?B?eWdDbTdNV1JJVFNJR3FMd05WemhUMHpVNjVzOGM3TlNmWjMrNzBhUzR2RGha?=
 =?utf-8?B?UWhJUjQrTEFEbmJVQSthV0FabHVVQ2FlRlRHYVN4a2hsZVpOdkh2Y1ptNDZ0?=
 =?utf-8?B?RGhUblFaYVZrY0Q4U2hIcGh1QWxReXBKcHk4Y25SZkFLZVFnVnRDNHBKTGto?=
 =?utf-8?B?bzllcmE2NlAzUFE1akpleTI5ak1vZHJhN0xOZ1F6cHl0YXFENUJPOW45bWZv?=
 =?utf-8?B?WWNZaXQzdW1mNmpTZUZQdnZ1czN3NWlTYkUxRVBuYjNoZFJrWjh3Vi96NE5B?=
 =?utf-8?B?czJXd1k1M2VFd0xlTE0zTzBhbW1HZEk2UHQ4bmFnK0hEdWNaanVkQXkyTXZx?=
 =?utf-8?B?YjdPMnNrUCtOK3V1QzhDRXNBdUlRR0t6NGhodXZPS1NJai9NRnFFZ2JFdW85?=
 =?utf-8?B?UEpQMDN1eW9EZmJDOWVnN3ZKcytROW80bStGN21EcGRUd0tGZTVFYnFVU2cy?=
 =?utf-8?B?d1NleUZ4cW0xQWE2d3pQMm90WGRDT29PSVRERDUxQ0JJd0RVU2htOXBKRWlH?=
 =?utf-8?B?TXFFYmpPRFRLTHlDS1lZdnByZ2pHNWxsb2lydlN5TUlGdjdrbFFid0ZyZGl0?=
 =?utf-8?B?RzhEWHpUSExNakczdkZibTJncnJELzB4ZmR6NmJWbWRuUW14dUV1NnNpREpV?=
 =?utf-8?B?THcrRHhHcDZTcnNmcVl3SGFoNnhUMVBIQ0JsZ0pHUy9rYUNQL0pOQmpPTkcw?=
 =?utf-8?B?a2NjZmduSEM1emNBSVpoYkt6Z2l6Y1Nic2pha01BTkt5cVBXcHhwbUhWcHMx?=
 =?utf-8?B?Nzg3UkJHZkdCbGNVRUt2Sm0yTWwzRTJoTHJ0YTBneHllUUpzdjFkK2VIdXZK?=
 =?utf-8?B?UkRDQkE0bWFaaU40emdtaVlZcXRaRVFTVkRDaEJVR3VmcDZiU2NNcFh4OE13?=
 =?utf-8?B?WXdlQm9NRTFPQ3R4VER1TzA5aWFaSGN1N0I0aVNFOTVzaG56WjdTREtKV05I?=
 =?utf-8?B?bTVaN2tOSytnVEs1YnhSUmpFRW1jU1VoL2xCc0RDL2pjVEJRaDl4dHFHYy9H?=
 =?utf-8?B?MDJJY1Fqd2RNQytLWEhuVW5FYnR0Q0NCNVhwY0xsT1Z3YlAyZFpBOWRlQTJu?=
 =?utf-8?B?ak95M2VCYXZMV1hsT3JXRFJCNi80eWpua2RuU2tuVkx2N3duS1EwRFNPdnhh?=
 =?utf-8?B?YmtRZUJoL3BUNFYwRGlYZWJNMk9DYUFBbG9sUWxPNDdvWTlmOFZzakRtVFJT?=
 =?utf-8?B?YWFMK2lWaHc0bS9rTVZ2T2R3VmpNMHpEYnJ1NjhvcXlkWERLU29oaXpZa3hE?=
 =?utf-8?B?ZTBPSS92Y2hnZGdKUzVqZGtLZDZHNENMekVqeDVzMzdwdzdZeEh5WlJjWWp2?=
 =?utf-8?B?NzdlSmNjd0ljMXZQNzZYTjZWOVM4bzNHQXNVR016c2FIMTFDY3FqYjZ2SkRT?=
 =?utf-8?B?Sm9hQWx1Q0ZMaHhva01rVVBjOWxRTnJSODY3YUk0ak5uS29nZ01FM2xKbzUr?=
 =?utf-8?B?V2dXOURjb0ZMd3NKcDdtMjJwOFlrNzJ0eVQ4dXBTY1hFV3pEOWJRbnc3dTBq?=
 =?utf-8?B?UjFoWEpJLzkxMlpkSTU2RWpxd0pVU0JWam0wclJnYm9kRDd2MTRPL2FyQ0tJ?=
 =?utf-8?Q?F0/UpVpGs5gOx7/CjZ+0QjOLNUs6W4K5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5177.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm9GeHhSSjlSZkFpakNRRkE5aTJ5bjF2WmVwQTN3c2tSSXM5YUwzSmF5S0gy?=
 =?utf-8?B?UFp5YVd2dFVLMllOdTc3VENYL1VJMFZ0dXIyUzJnL2U5Vm5EaS85bWRtOXRo?=
 =?utf-8?B?VHJRcSt4cm9IWENRSXFUMFZxdnRoVCtNMXhObXRCUDdDb2RHNmtWL0Y2UWg2?=
 =?utf-8?B?UkJzTzIrY1JxR0JxTzZnSjVBSTZDbHVTV1FYT1VWWUFqQXBsNWtiQkxRTFdC?=
 =?utf-8?B?UnUrUFBMalF1NVFKSDFBeHFDUHpBamVnNUwwR3M4Y3FzWEF0Smx4RjVVQngy?=
 =?utf-8?B?OUNWRjFDaVk2VHNsRURlYUNrQU5kRG9BajE1RWVla3ZRc3Y4Ny9BTWhlVUsx?=
 =?utf-8?B?ZnJxdHZxcFluQk9BQUdRbXBvUC9FdnptYmtRQWxNNlhMeHk0MnpnekVHOEtZ?=
 =?utf-8?B?UGtOWHc5WlpGLzllbVpCcC9GVFJjMU1rRVZRL3l1ZTIxMFNNTW9OeEJiZ2FM?=
 =?utf-8?B?bUM5N3pZNmpKcUpYbzNTQmRlV1QxNVQ3Y1NWcXArYWR0bDYyNzBlOFd5WjhB?=
 =?utf-8?B?dkd4dTJtZjJpeENFblY4Q0F2SjB2dS8zanR4LzBOVmhJa2VWU3g5RGJDTnUx?=
 =?utf-8?B?MHdzcjU1NWVxRW1oUGhHVkI1aWx0ZzluVnZnZFNTbWUrbnQrVFRSaU9rZnJI?=
 =?utf-8?B?bmFyendsZnlrY2Q0N2wremdkTHdBbmRCeFpNQzB4UlNzcE5pZ0ZuQ1dwcTEz?=
 =?utf-8?B?V0w1WUdEUWZLWEE5dFZ4REgzaklhcGlzM3pyQ01ucnBnWkhaVWY4QW5WS3Ex?=
 =?utf-8?B?R3BZU2RNSVUydUlVMnVCbXo2S1dJMmxHYWVMTnQ5RnB2SVl4ellRdDdZOXFW?=
 =?utf-8?B?V3gxZFVrcDNVMWd0SCtZdGZCODlxZWZqOE9aaTM5ck5ibVdaODVvdDV6akZp?=
 =?utf-8?B?YWFRQzFkUW5ESDMrU3V1UVd4UktqSWJSZFM2UzZkanI5Mng2dWVWOTQvNjYr?=
 =?utf-8?B?SlNPVWFGb0NSQm9ISmhpaGQ4NmRyRzdyUlVhUnRDYTdoZi9mVVdxYWJtVm9R?=
 =?utf-8?B?WHE3QUhCYlBNNGRkNGlKdWREbnVCYnNOdEFTenhhaXVUUkZMbnhBa2hDUzRr?=
 =?utf-8?B?YVRDcGlhQnArQTRsbnB1dXpiOCtyQW8xdFFDUDRWTGdSa0tjMGdKN1dkU09S?=
 =?utf-8?B?bnNnVS9SWGNmdDNLSVFSSmtacUFteTR2NFJMWU1EUUZqc2laQVY2cGdqK3Zj?=
 =?utf-8?B?RHlvRk1TQmhaYWExOWNzM1BDVDNHS3JpeDBkaWNNZ2NYbVYwZTlnYWRGdEpX?=
 =?utf-8?B?d1JZQ0haUXZKNXJsRDU0UHRybml5ZW5yUDQ3MjdQRmVRQzVmdkxoQVN0T1BV?=
 =?utf-8?B?RUVVOTZIQ3ZHTitnNGIzcUJqekxXL0dCSGlJL2NlUmZQR3VqTWxiWUhlUVZr?=
 =?utf-8?B?OXJQQ2ZpaU54NVp0NFNOY2ZnSzRKWXVXREF4cU9rZ00zd21Bblk0ejd5endp?=
 =?utf-8?B?SmlBb3R4UnMxVWhFUDFiRm5UZTJpcUM1OUVJTHRTQlB5Vjhka2YzVVpnVS8v?=
 =?utf-8?B?MW1NaDM5aUc2RUF3dGdyUlRkcEtjdVNoazVkcnNUTmRiQy81MFhJa1hsdE13?=
 =?utf-8?B?QndFM3FXeE5waEgwTExjYWpvRXZndjloUnRVbytOY0F5bUIyYkcydnlwcDZW?=
 =?utf-8?B?WjRIck5zMzNaY1U4MEZMZHl1M093S29Nc25qZWZENVIzdXNJZkliTC9VTDdL?=
 =?utf-8?B?Z1EwZEJUck5rR0ZweGlTWEJSb3RwcFAvUXhTUVNWbVdHdkNObUFqZERpRzVv?=
 =?utf-8?B?eXhLTDUvejM1YSs1RVVFT3dxem5HNUZ1ZXhtajEzeEJndVN6dUtzK1NDY1Vr?=
 =?utf-8?B?OWJadzZ5WUZhYXlvL3hqaHlGNVZOSHlWRXdHMm1Uam4wZldlN3Blb3A0NnlR?=
 =?utf-8?B?WVkwUDVnRjljNUF0bmFYRVVyK1YrNGpRcU5DY1pESENwdUNQRGNqVDBveTRw?=
 =?utf-8?B?NVZFcFR1QXhIaHhNaTNzR1lQRDM5WG1zaEVjeWsvck5PNkZZa0lkbGY2UWpj?=
 =?utf-8?B?WGpGSW9PUVN6Z2pyaHhENDdzM1JpR1diK1JDdWVKL1JPeG03NlhqaHRacy95?=
 =?utf-8?B?TkpkSW1pZkFkcUtvS2tIOThVQ21sU3ZwUnhWYTM2bGZ3QmE2ZGxzSk5RMnRv?=
 =?utf-8?Q?bbn0VqdAQPC1I4nV3FZjZBTCO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db9874b9-7ac9-4a3b-75e8-08de2ccf45b3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5177.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:36:27.6690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Am1l37CLcwWjkNjKBIXY6xAwc5G4m/M0q/FWfkREg4iXs2DUoPR1r1gqiHitsN85TbhSIX61WRQQOJ8H/Ws6AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8422



On 11/18/2025 21:48, Ilpo Järvinen wrote:
> On Tue, 11 Nov 2025, Shyam Sundar S K wrote:
> 
>> Add a bios_output[] cache to amd_pmf_dev and store the latest values for
>> BIOS output policies when applying PMF policies. This enables the AMD PMF
>> util layer to expose these BIOS outputs alongside selected thermal and
>> power telemetry to user space via /dev/amdpmf_interface and a new IOCTL,
>> supporting real-time monitoring tools such as SystemDeck.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/pmf.h    |   1 +
>>  drivers/platform/x86/amd/pmf/tee-if.c |  10 ++
>>  drivers/platform/x86/amd/pmf/util.c   | 140 ++++++++++++++++++++++++++
>>  include/uapi/linux/amd-pmf.h          |  48 +++++++++
>>  4 files changed, 199 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 3b1aae8a60a5..5880d6fc3afb 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -406,6 +406,7 @@ struct amd_pmf_dev {
>>  	struct apmf_sbios_req_v1 req1;
>>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>>  	bool cb_flag;			     /* To handle first custom BIOS input */
>> +	u32 bios_output[10];
>>  };
>>  
>>  struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 6e8116bef4f6..8ea309aade95 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -183,42 +183,52 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_1:
>> +			dev->bios_output[0] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_2:
>> +			dev->bios_output[1] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_3:
>> +			dev->bios_output[2] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_4:
>> +			dev->bios_output[3] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_5:
>> +			dev->bios_output[4] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_6:
>> +			dev->bios_output[5] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_7:
>> +			dev->bios_output[6] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_8:
>> +			dev->bios_output[7] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_9:
>> +			dev->bios_output[8] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_10:
>> +			dev->bios_output[9] = val;
>>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
>>  			break;
> 
> Duplicating that n times doesn't look nice...

Thank you for the feedback. I have sent a preparatory patch to it
which unifies the handling of PMF_POLICY_BIOS_OUTPUT_*. Once this
change lands, the current patch (bios_output[] caching ) should be
much simpler.

Thanks,
Shyam

