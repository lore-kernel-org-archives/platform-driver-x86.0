Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47190D528
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 17:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739813465; cv=fail; b=SZTCIpcYUDvtejBrtOGmdC7IDUynCjdOTVP54M1AuGrzvlCe1op0T09WZ3qproSeJnmlpFkAg2Z1Y+5sdRFkiUnpOXLO4/9L5SDWU/MRVZXmZVQxS3jiHcZMl942WvZ73waVS6cd4fN3Znpa68Jw20iCVUyj7Io/MT6CnlJMtdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739813465; c=relaxed/simple;
	bh=+MC5D/fKM+FB+pKYo+yGn4zabBcRvk3A35HdbMnNCug=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cTjbQEJEfJSCPibYTYUGM93LjYRlNoN9IeUwHv5ymiFivaE/mPClz0yIyA/jhuaCqgTQd/xYhimb1f4hjPiblzvx0be7R6PE+c/ai3O3WL0LG8gf8+klIVkmVJDkKrDx3HMqTb0Efve1DATt2VgLMZgAgrFNC4lBgf/euUHCK2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZYnKulYN; arc=fail smtp.client-ip=40.107.93.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZYnKulYN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptYMBiooBbfYwKmBVHWWWXwV99Adwwe0es3aeGyCLduYNjHKuMuL1q5ef3HhvKKiqiEQsB6ZwjO44y+hHgtETd2O/p/a/8O/mvtREpvrk0R/z7E7RisT7v8pSEYp1qNXa//ySxgmy/viZ0Is4udRS0JzQyQ9Oc0YAgIX3bBKmuNOUsk3u3UnIo0mHzgjm9Wpe2CxmNq5nf7vnoUUK0ROwlAi41WCDfRplam2OL2EIBeLxlXxAvkQ7Nklxl9qf27lp8PBfUuXQ0s+5YCJ0wKZx0A8JtyqkWtl6oTSq9iLJN9ZdUqjxYSHCqgUCsrVvp/zhhhFFfrJBd99BLvZStTvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZOhAojezM6+COAtZuDXSxYeY5ViH+oiabEGxQXP6Bg=;
 b=emkQLJiCVpBlCpuiaR+4Tuta3w9km1Cp/vYg9m/UEiyPDEmvBjb37mX3Pp/Fvq/7WU4dZ652H3ijzVrsgHJmqSCG/J9+gwFo3hdC2JXsGmNXFKduzjwHDT1Zk+ZRh3+i7yvEB8Ea2uBMppQFjSiQc4z4vCtogloRQWz1tThpt8L55GnyUASJEcUXdRedW350P3jbSU02lHSYPHzAwL+oj3iFD0cqEw6sw4unu0qlwwROkEcSly+VZjeOeIjBxyc0gN7N/CMn+sTl6FSgo+jzvYLT1Y82+KOpNFMQk3k3YSWX5R3+1eyNbeOaI+M5dtHGkoYQsb6lHzsi28tU2PfzgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZOhAojezM6+COAtZuDXSxYeY5ViH+oiabEGxQXP6Bg=;
 b=ZYnKulYN8uB5vFXTCKEu8sWOCgvI3c/G/5pDeMUZ9QgTS7WarAyBtZ9lfX7ZnklXUztAw/tcCY3d5id7qu/rjMAH6fqPALCwREDxXReCeK/fp4NvjyGD6thV3gCCtIHF1d5B9gWceNiKYwbZVr2tLzpC4wAab+vLC4c1isv8Xlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB7067.namprd12.prod.outlook.com (2603:10b6:a03:4ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 17:31:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 17:31:00 +0000
Message-ID: <67955a30-ede3-4272-aee2-6c316f85c978@amd.com>
Date: Mon, 17 Feb 2025 11:30:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Update PMF Driver for
 Compatibility with new PMF-TA
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250217064937.98702-1-Shyam-sundar.S-k@amd.com>
 <20250217064937.98702-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250217064937.98702-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0181.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: a81d11c1-90b6-43fd-0970-08dd4f78d87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDFwMFpYOE1pUzdRL0Z3clBETVFqeXJ4bjNZbitrTEFvNkdqMzRRZnJoNzRI?=
 =?utf-8?B?aFNabFRBMXFyQ0I5RVBQd2RiL1lVTFM1YUdra2tzYm5yMWY1cGJiTmhyMTJy?=
 =?utf-8?B?cVhXa09sVnpwZ1FFU1hBNTJ0aVFHcjI2cG10OE9qdDJMaWtWZGZob1J4VFlr?=
 =?utf-8?B?QTAxZHJRVGRUZU83cmxUNjBPOWhtSW1OMHBrdk5NUWZoOFZPVC92cVJPOFVz?=
 =?utf-8?B?TG5IcU9SRk9yQzhVN1QwQ2NaMjVtTFdxVWF3NjR5ck9TYmZza0lhL2MzUXlF?=
 =?utf-8?B?QmF3U1A5eFVqZjJ5eTFpWjJ5dEdmWGxralgvN0xwMTNndlRNZkxPMHBsR0J4?=
 =?utf-8?B?d2JCV1NPVXNBRHRWRWZManYydWtSdU13V3V0cjl5NU9FMDgxNHlOVmlEVXh3?=
 =?utf-8?B?dUdaOG1idGFrTkkwalBVUE1iYnkrcWhTTUlwakVpRDdsbk5sa0V0YkYzdkc5?=
 =?utf-8?B?SWRMM3hnV0kwYklxQnhITTZPWXp4RUM1M3lOTGVUWVBadHpmQUxwdUluMXVF?=
 =?utf-8?B?UFc0cEJRSXpTSVlTbTJtd2dkSnFxWGI4d3BDS1hmNXRFem5WSjVpLzVtYU1l?=
 =?utf-8?B?RE1iTVFKK3k3ZWtWUFNYZVcvODd4SURoYUVQNkNMN3ZTekF0VVlCR24zYVZE?=
 =?utf-8?B?NDl3QUdDUExCMmU5YWQ1aCtrWmp1elFyMEJHaDF0NU14MTA5TFpsN3c0SXp6?=
 =?utf-8?B?TmxlbjEvRDdzZ252SW5adW9aWk15QzBraFpwZU5QNUhKOHRDWHROVWZQSzkv?=
 =?utf-8?B?MzRCdWFKeFdEd08za0VBa2pWcnBMdXZCMklJcUZXclRpY2J5QnZZMXVyWGJX?=
 =?utf-8?B?THFOWUYzaDlhbk01a2NYcTBjemoyQzVOdERtYTIxNlJnT2lFdzhEOVZ5RVAv?=
 =?utf-8?B?NFd4NGxzMG02UlZXSDdFTzZUa0NqNUZOZmxoMlF4VVlQcEw1NTVWUStKem5h?=
 =?utf-8?B?aHozWjFNUW5Tc0NjT1hnbDE2VDdLazJyOVgzeWlGY3JiYWhpMjVzVkJMUEpR?=
 =?utf-8?B?U1VkNVJ5U0p6L1lKOXhoYnIrdThpMU1Palh6L2RxWktuWXlhbVMycFdtaGRH?=
 =?utf-8?B?U3psQTEyaUdKZDhEcGZhOG5SRHBybmpRR2NPKythNmFZRFArQmZJSXE4bHE1?=
 =?utf-8?B?QVBnWi9kMmtUcnBIbWJCQjU2ZTdFbkZYcitpZVIxU3RGSlJjTGNXOWpEQzVQ?=
 =?utf-8?B?SVZsZlZjUCtJNHM0NXo4UXhHTnNWUWQzNkxxdXJZTTl3dEc4UlJyalJsMkpi?=
 =?utf-8?B?c0VaclJhaS9ZQWEyMFF3U1JJM0FTTkRkc0JneWJiVUhablZ4M2tQLytWamNl?=
 =?utf-8?B?UE8ySHhHQmNsbmxqd3dXRDZuUWRFYWltQmtYRWlPeDFTQkhOYng2WnphYm1L?=
 =?utf-8?B?bVFnV0w1TDJKQzNBNXpSREsvSEtZMDdMcTBPVE1lMXRUYXFpcDgwK0pQR2p3?=
 =?utf-8?B?dVJjNlcvSEtVYnQ4cndNNnVqOEZRNUtFZThIZU1UL2pZcDhiZ3JGOGg3QXB6?=
 =?utf-8?B?VHJ5elJIQlVXT0YzQnhEenppcmlTb0ltWE45UU5TTUpidjViSTBycXkxTlNy?=
 =?utf-8?B?OXEyMVY2QVh4RWJkUjBWb2t6bXZoanRxU0drU3pYTUVDTk5PSGt2Y1U1Mm55?=
 =?utf-8?B?UktyWS8wN0R6OVN2VUhrYnRFVVJrZjVOdWZRcFJvaUliQitxRWpSUUQ1VGt4?=
 =?utf-8?B?WXMvNnVDMCs0YnpPM3F2MG9uaG03cStDbmFVS3ZVbDBoWXA3OW9lYmV5eTh6?=
 =?utf-8?B?bVRYTStDc05vcndUZkxDc2Y1aVFXaGNQYStpeTZaUlBnR1UwbkxEZkRhdEJm?=
 =?utf-8?B?OERvTGhHa2F5QzFhMllSSC9sWXloZDBiRStTUzBBTDVJNnBvYjljaWUzOUFa?=
 =?utf-8?Q?MG7Sh0l85qKyk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG0xck9XMUsxRnl0djlMdTZtVUg4K3YvKzNuRzZHcFpIcXVRNG83WkJOREFJ?=
 =?utf-8?B?Q0ZhSTBjNXRSUkdTSUVJRVA1ZnhiV21oeUp0UDg0TnBIR0RuQS9hK0xnWFlH?=
 =?utf-8?B?U2VIK2NOb3MvY0VnczZSRzkvaS9Xd3ZnK1BRRFgzTFl6MTlzcUd5bk9KVERH?=
 =?utf-8?B?dXJ4bVlKWW8rUmhCVTBhZGI2bWs4K1d5UzE4YnAxUy9xRUFpNUFrazRHY1Jq?=
 =?utf-8?B?d1VZalN1NWthK05POFo3M0hheFFRdTAyMk8zR1lybW9JLzJsdm94VDZ5YmVm?=
 =?utf-8?B?bjgrSFRLWSsveFdvdFNpTHo2WEtDZExRblBCalB4VE5RQXg4ekM4d3pIZHAz?=
 =?utf-8?B?eVZldE9XcnZvREJuYUQ5NndXTyt3eFhtSG1ZdTE1VTZ2aWFEa2FhL1JEdHdK?=
 =?utf-8?B?U3BMSDFoTXZpYktOT1EzQXdScS90VEtTeXd1cTBiT1QzNW1kMElpMEZIMmZl?=
 =?utf-8?B?TTlPNkEwak1TcHZtV3E5WDBDTE1yL1R0MTU5bzY3ZnA3Sjd5ZS9sNEo5bUZj?=
 =?utf-8?B?cm92NkpNYTV5TGtjL0w2dVF2QnBucklpNmRSN1NydGFvR2lxR09JREdjTTU2?=
 =?utf-8?B?Sm1sTkNId3FPRG9HSjNtMXJpQ05VbVBkMDUyZ1lWdWwzZ3BXTVByU0FUcDBR?=
 =?utf-8?B?N1h5THVjdnNtRVF1N2M5TmpaT24xSGNKay9uVWROT2lpODBDaElobzIxU3BI?=
 =?utf-8?B?TzUrcjEzaE5uSzVldi9COXUyYUY5V1RFMVFKSC9NVmQweU5DTlRoazkzc1Bq?=
 =?utf-8?B?V1ZQUlJTZ0NKQStoOGNiYzBFYUlrL0Z4dTNlUldicmwyQldoZW5rM2N2Uk1S?=
 =?utf-8?B?bFN6QUkzTHE1eDcrdUlQTlQvcnZ5dWovTzFLbHpyNDFpOTh0M3ptSTRVTzY2?=
 =?utf-8?B?c1ZVem9TRkkxN3BtK2hsSW1PNkxSdGJqakhGWEUzek9zakYvQ0c4L0UxUm16?=
 =?utf-8?B?UlE5ZTREcVR0L29lWE9OV1E4SUpTczcxUGFhWXpGM1BHWFlYUnI0N1FXa3Ft?=
 =?utf-8?B?TlRJV0M0bFdoSnFGREkxc2ZKN3h5TzNpMFRncytxNys2MElmemREU0RzZW5B?=
 =?utf-8?B?Wjc3Y29IcXVsRTR1bndWU1BUL0FIaDlUd1pLREJSTm9kNWxHN2F5ZlBYWGlU?=
 =?utf-8?B?ZnV3WnlBazZmSUQ0LzRrZ0JBUW5GTlBGWHN2NERwY2ZyTVMzK2FrN2lJQlgw?=
 =?utf-8?B?K244RUhOZEU5Y0pSSEt5cXM0bG4vSC9KNFFlMm5LRk5WdzJmSENaUHRiT213?=
 =?utf-8?B?RzEyNENwQkNzYWUyOVc3bVdPdFEyNTk0MWZCcE5Mb0Y1TUF6QkIyQkNlcktB?=
 =?utf-8?B?NndDd3ZPTWRueFM5RW8zRk9vb2h5NG41YXN0RUNoeDM3azBzb1l5bnpYZW8w?=
 =?utf-8?B?OERmSFJ5YUNOTUJUZXRuaFd5L1gyNngrQ2pYTjJXNHZRVStEd1pUOHFrRFho?=
 =?utf-8?B?REJzZnMyRWtjZjNwUjRlRy9UZHY5UDNpM2p4UytpNy85MjFCYTMvekVIc2gv?=
 =?utf-8?B?SWxpUVZoV2pKcEFLVHowczZSUmRsY3FSbnpzU3pUVFFvSTF0RERpbzhPbFAy?=
 =?utf-8?B?aytVUHFCaEJFZDdRTi90N0oxNjVvRmpCcWs3ZjdQT0EvYWtHSXVSNE4yRjVs?=
 =?utf-8?B?WWxRNVF5NUxCbXcrV1ZkTXVXUlBqUDZTMGlUM1ZHK0VxQk1mT2VhOEtSZ1lX?=
 =?utf-8?B?QVk3OE1lQ2dEYWI2c0dBSUpqRWZ6V1ZnY0h1TldXSkVwdStVWkNlaXRZUWU2?=
 =?utf-8?B?Q3QwaFJ2TjVyNU4xYmxoUEhaUzQ1cTRuR01WT2M2ZFpwS003YXpNR05ib1g2?=
 =?utf-8?B?M295M3ZrT01zVmxxSXhjMXJrSVdlOWNmNFAzRkthUHJlNmc1U0ozQzFITVdE?=
 =?utf-8?B?VXNnZ2dGYXBVSXJ1U0NXTVBmUm5CVXNFaE4vRFZlNTFwdW5QMGpGZEIyVmVj?=
 =?utf-8?B?bFVBZzZsTUpIL2J0NnZRNGQrNW1BWk1sNnZzcHVhY25qVXBZYnlYbE5CcGU3?=
 =?utf-8?B?TTBQdkhKbjlQaDZ5aEoxZFA1M3BzN3hrRFZWcXFicXZYbVFHZXAyUHJIaWpV?=
 =?utf-8?B?b1VmMWl2VS9kWkpIZzdZbmo3MUw4SjVzZFF1VnJmYnduMTZjOUhqc0xJclAr?=
 =?utf-8?Q?kua9dmk3aR1SMK+J2AhntzX4O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81d11c1-90b6-43fd-0970-08dd4f78d87b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:31:00.5553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WDCsZkfc21Vu9JGAN/G3MFXgF9c54EAmgdvgO0yXrYe2EoauADZ534pv6LhtNLHrHXYaMrADd39sOCGKZnuTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7067

On 2/17/2025 00:49, Shyam Sundar S K wrote:
> The PMF driver allocates a shared memory buffer using
> tee_shm_alloc_kernel_buf() for communication with the PMF-TA.
> 
> The latest PMF-TA version introduces new structures with OEM debug
> information and additional policy input conditions for evaluating the
> policy binary. Consequently, the shared memory size must be increased to
> ensure compatibility between the PMF driver and the updated PMF-TA.
> 
> To do so, Introduce the new PMF-TA UUID and update the PMF shared memory

Small nit that this should be s/Introduce/introduce/.  I wouldn't change 
it if nothing else is raised.

> configuration to ensure compatibility with the latest PMF-TA version.
> Additionally, export the TA UUID.
> 
> These updates will result in modifications to the prototypes of
> amd_pmf_tee_init() and amd_pmf_ta_open_session().
> 
> Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-d211c7963e7e@linux.intel.com/
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> ---
>   drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
>   drivers/platform/x86/amd/pmf/tee-if.c | 49 +++++++++++++++++++--------
>   2 files changed, 38 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 41b2b91b8fdc..e6bdee68ccf3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -106,9 +106,12 @@ struct cookie_header {
>   #define PMF_TA_IF_VERSION_MAJOR				1
>   #define TA_PMF_ACTION_MAX					32
>   #define TA_PMF_UNDO_MAX						8
> -#define TA_OUTPUT_RESERVED_MEM				906
> +#define TA_OUTPUT_RESERVED_MEM				922
>   #define MAX_OPERATION_PARAMS					4
>   
> +#define TA_ERROR_CRYPTO_INVALID_PARAM				0x20002
> +#define TA_ERROR_CRYPTO_BIN_TOO_LARGE				0x2000d
> +
>   #define PMF_IF_V1		1
>   #define PMF_IF_V2		2
>   
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index b404764550c4..43bda6f98a11 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
>   MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
>   #endif
>   
> -static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
> -						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
> +static const uuid_t amd_pmf_ta_uuid[] = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8, 0x8a,
> +						    0xcc, 0x2b, 0x2b, 0x60, 0xd6),
> +					  UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1, 0x2d, 0xc5,
> +						    0x29, 0xb1, 0x3d, 0x85, 0x43),
> +					};
>   
>   static const char *amd_pmf_uevent_as_str(unsigned int state)
>   {
> @@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   		 */
>   		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>   	} else {
> -		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> +		dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>   		dev->smart_pc_enabled = false;
>   		return res;
>   	}
> @@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const voi
>   	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>   }
>   
> -static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, int index)
>   {
>   	struct tee_ioctl_open_session_arg sess_arg = {};
>   	int rc;
>   
> -	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
> +	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
>   	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>   	sess_arg.num_params = 0;
>   
> @@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
>   	return 0;
>   }
>   
> -static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
>   {
>   	u32 size;
>   	int ret;
> @@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>   		return PTR_ERR(dev->tee_ctx);
>   	}
>   
> -	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
> +	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, index);
>   	if (ret) {
>   		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
>   		ret = -EINVAL;
> @@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>   
>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   {
> -	int ret;
> +	bool status;
> +	int ret, i;
>   
>   	ret = apmf_check_smart_pc(dev);
>   	if (ret) {
> @@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   		return -ENODEV;
>   	}
>   
> -	ret = amd_pmf_tee_init(dev);
> -	if (ret)
> -		return ret;
> -
>   	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>   
>   	ret = amd_pmf_set_dram_addr(dev, true);
> @@ -534,9 +534,28 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   		goto error;
>   	}
>   
> -	ret = amd_pmf_start_policy_engine(dev);
> -	if (ret)
> -		goto error;
> +	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
> +		ret = amd_pmf_tee_init(dev, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = amd_pmf_start_policy_engine(dev);
> +		switch (ret) {
> +		case TA_PMF_TYPE_SUCCESS:
> +			status = true;
> +			break;
> +		case TA_ERROR_CRYPTO_INVALID_PARAM:
> +		case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
> +			amd_pmf_tee_deinit(dev);
> +			status = false;
> +			break;
> +		default:
> +			goto error;
> +		}
> +
> +		if (status)
> +			break;
> +	}
>   

After the loop I think you're missing one more case of

if (!status)
	goto error;

Otherwise can't you potentially end up with both attempts returning an 
error code?

If you think it makes sense to still be able to "sideload" a PB in this 
case perhaps it would be best to change it to

if (!status && !pb_side_load)
	goto error;

>   	if (pb_side_load)
>   		amd_pmf_open_pb(dev, dev->dbgfs_dir);

