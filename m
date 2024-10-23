Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069071AA787
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693776; cv=fail; b=n41xXWc69aYLZdYDeqDgIQBrwPUOg2MbHzOl6kXd/sCbvCZaWMvpr6w+sLN3Oe1egHqwftfRYucibCBpyBwwkhtg+tg3vl6RxWh7gwS50vvzKIrOM7ySGpMp3S9OOpstvNRPEUVpZJloRg4PCs5UozeE9aWfVE13QzeNzfosiK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693776; c=relaxed/simple;
	bh=Cw8sg8F+C9FLg3Y8FcmuFI2fdq8diLzpPA5l0ntexNc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CBg8Z91ffqT1bPjZ9cj6zr/59tXQCGd1/qSeB5jy/gL+6quZ5/LVd6OFjGXqS6N3mc9ZijuiO+Ha7l1vZLF0mCeuBxYZVMIJBPVc8IZtWjM81aIySWN7yDwWSAIgWmJpoW1QcGRUmyPYxlHCyCZ5nlhN24qdBISV+BYQVbHr6VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bv6jZpjL; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bv6jZpjL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk2PC0M0v2HKxXcAr0Yh1PZ3VqubZeB/9OVSnr071jP52XyzNcijoRNgnglteUH26EzV9hIn12UcvVVBukwJ6h762BaPSrLCmx/4+MYmL90w/hgCB6EJRKX/pwoURwLgQA0osiS80Crq08fpKrV/uPVkaIFCma2TOoG18/unenJUeBqg1PuIzxgs0tdZjHq2gi31/qt2fk0J4kgOEg4+pZwsblNLB9L3ih5IpCdbpUQZfN8KZXb1ceKReOM1JQKZSUlZ15s4geDzfczZiss9Xh6RgptzBXzESgG+o4utV/qPNuvoMRwalOUjakI/+tDuMoJe2ONDLupqg143CD/pzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnG7TtSX5hyEsR9z6rTT0vCsCsgHV2iYRnVa1r0fRFs=;
 b=wDn5kbEwJACZi4tpoPKo1bEJ0Y/v5vLWchnRS4w9YMLbQ0k7u9rGQ8q71DewR6u3OtYTGPpgQB2X8/3GjesR1Q32Ujxz8h8dNbvvl7Is4BBoBt+QJuN6CIoc5xZLd5+u6BeIxMU056+l21Be3F0nw1YYXYf8g+uiKsG6pffYehgjU2AXj5ZW1yiUW44SfOI7hzJpJbWWAAA0KawuXqgrhlB4iNdNoN92xToPztWe0+6SSfGfQsW1wysxxoEQ6ccQLfdtVvu73jENkJKCvuua0YkVag3oGDRbCkBROJwBDy8WT3wZZloOoEvFT8l73M6kUz9xVGeXwiYOIe/28oPk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnG7TtSX5hyEsR9z6rTT0vCsCsgHV2iYRnVa1r0fRFs=;
 b=bv6jZpjLSjFjFRyJqQXDjdevHS0jsqHrSNDDhgKioxOmR9E6Pl+yJNxdoTvdlpTyCv6VVEyYd1I9V1n+ArIWRbWSOqgJ2c8TwLwCS/OfctrFInZ+nnyWFjlWbJvTZN55Y67KPvtjgEL6cF5izRFv9tEhryFtftr+4RQYty/N9VM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 14:29:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 14:29:30 +0000
Message-ID: <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
Date: Wed, 23 Oct 2024 19:59:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PEPF0000017E.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::4e) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 36069bf3-f9db-4461-7bb7-08dcf36f1ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUQrNnM4UnEvZFY5NVZvVGZ0RDV5TkhmWjRNc2hSYStZdGFFMm13Tm1kd3Fw?=
 =?utf-8?B?Mm01S0p4MlMwYzVCQzM4ckNNaVJESUZZblA3OUZpUGhKc0ZndjRETUNmclVM?=
 =?utf-8?B?NG9sVll5eHN3dWo1dFJPZU91VTQzQkFBTlhLZXdMb2hXZjBla01CenJNeGJq?=
 =?utf-8?B?OEttQ25CZ2lQaC8xNUkxV054aDBBRzByVllVcmwySi9VSXNERkJwM3ljaFJq?=
 =?utf-8?B?TkNPbzd4T2M2b1hEeWN0dXQzVm96aGh6WDNoTFN3aUpVVEMwUTVvYzRVeHhm?=
 =?utf-8?B?SlFVNFVwVWRWdEZETE5yTTVBbkdkTkFSM1N3eXY3dWJLTERWTmZiTllrOThi?=
 =?utf-8?B?Wkx3K013L3BBMEkrcjlZdWpINnJ0Q1R6eldJajJsOGFwblVmOUVNemo3NzE0?=
 =?utf-8?B?c1lnZGdpV0JkNVV4SmRRdGNiUUdDZkQvYWNjUXZKcC8zU0dkU1l3TW5McWd6?=
 =?utf-8?B?VHlBRWxrTkVTRkxHSjh1TXY5K29qRTNpNVFEN0RHeWRHQWtZWldtbHZFMnhj?=
 =?utf-8?B?QncwMWp0YXJza0FHVTBOc0VVU0ZUSENHS2NOVHNLNFFoVjJKR2NqM1d6cUxH?=
 =?utf-8?B?ajdFT3YwU284d21QUmt6UCtkMVNSVDZGZ3cyRE5ZK1M0bGNIbVZWY1FOTk1S?=
 =?utf-8?B?cWJqTjlJZ1lBT3g4cUt6SHpzdC9ZQUlaYVRManZiS25waFFGZU9kdXVocHdW?=
 =?utf-8?B?d2U2SnF3NkVic1JXTHFPVVRhcUpmaDJYYWFOSUdGRkk1Tmpicld6R1Niajd6?=
 =?utf-8?B?dG9XQmJPRWdGQzJiWUpQL2JUd2RlVS85ZkZPcngza3VtZmhIT1h5Wk9OKy92?=
 =?utf-8?B?T2U1N3NwZk9MMHZmVklpMk1vNWxCU3RINHlUeVZVa1pnNE9YNGYzOTVNYXJI?=
 =?utf-8?B?V0ZTYU5TcnZtaW9qZWpYeTNRaVVkUDhHbHd6MGs0dFRvY0luWkVVUVFic3E4?=
 =?utf-8?B?SlNuUjFWRnRMQ1UrMUtYc0w4anM1L2tBVFlGR2ZZcVRLSTMwOE93cmRwRWhR?=
 =?utf-8?B?NWZmUitMczV2Q0dLSTltbEtFTFpld0JCeUlGVFBNYzRIK0dUWGd5djZXU242?=
 =?utf-8?B?VjEzaFk0VVY1eVVQN0YrbW1wNE1FYUlrUXVXV0hkNldxblRlMHNmQUJ6SHM1?=
 =?utf-8?B?cDZ3TmhzWlVBUXR5cElzMERFNENRUTAra0oyZFV2QjFHYndjcjJpUTRqdXpu?=
 =?utf-8?B?cktXSS80UTI5STZtRUFCL0FVZDgxQ2FEUEJYVVRXUDF3UG4yRW04SSsrQ1BG?=
 =?utf-8?B?eFdJYko3UVJ5TUF5dkhaNS80MXEvd2xiUkIycHFZcDBVZjBxZjhodm16QWQ0?=
 =?utf-8?B?SlY4OVBucUtMT3J4N1REMFpuSDhPVm5nY1I1SEtHbkdDUkRwZWVDZlU4WXAv?=
 =?utf-8?B?QXZHNnoxYVltcy85T2pXOExJWHVyS0c1Y1BML1MyTVNpNTBabkhFb2hSSytT?=
 =?utf-8?B?VmFPSGFsdjgzcHdUa21iZlRVZEtvSVl5RTU3TGVIRGpaK25zNlhNdTBVNmpF?=
 =?utf-8?B?dFBkQmN5SHhsMkZhZHI5Tm56ZXZLaFFVVkxxTVNIMmNyTlNsZkUyYzF5dU0w?=
 =?utf-8?B?WkZkalIyRDNmRzZ4dFZIaUw4aEMvM1JDYk9ubzJIWndnVzlvMFJQZVhCMUtO?=
 =?utf-8?B?WDU0d29VUjFEN3BvOXhEeXc0OHFmRFJGTCtaaHN6Uk5sRDRudlBaVjdHaVRa?=
 =?utf-8?B?WVk0ckFmSmJhVnZkcm9HajBKa2pBazhyb3F3R1dmMXdDeEV3bkt3NEFNUDlY?=
 =?utf-8?Q?WUbOFxtgHBCT98ryKW7okFPgQc3VEg5KK15coc1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K29sektuMFk2eUJaUHk2YWhLeHZXaS9EQm9PSEkzOWhpYU91YTVIZWlYbGRW?=
 =?utf-8?B?eldzdXlBR3dMeGQ1RFVVMmdNaXA4NEtacXBiVzNRNHlhaWR3a25jaE5rZ0Vz?=
 =?utf-8?B?enR2M2dKOXBvUHJDTVpydFRTUjVqOVBTVnNic2luYzk2UkNqcnlMU0d1S2sw?=
 =?utf-8?B?eFpZKzlqdVVmeENGMEo3V3l3eEprcDl2TS84U1o4TDJ5RFZnRU93ckswdjc2?=
 =?utf-8?B?dkxJYjYwWHN6U2hPSlJEcDRhVjc4VEZaaW91WHBnWnRCbHVqWDJjck9kbFlI?=
 =?utf-8?B?WTlwd1I0dllnaDZsN1VwZEM0U3AwNTVlSHkvd0cyTTNJb1RNTVU0bXFZcDdu?=
 =?utf-8?B?K3BQVWVxbTJwNkpnbGFWc1RMc0s0R2tHV0hHYVhFOVhDUFNzNHZVUGJic3hM?=
 =?utf-8?B?UkF6RHRQUE9rOGEwZXpoOUxRTzRmRnlnczFXTWRDU2tGclR5TTFtemdQQ3Vs?=
 =?utf-8?B?OXZ3U1V2QVgrZHRhTmg0ZEJFcDdKRGNxZW1PQnhDNTArNDlOTks0OXQwSE5I?=
 =?utf-8?B?NEF3dHdLWXFHOS9LclBTRkNmbHNGcTNCYm5RUzgrZ2VZcXNRdUx0VnRwMEhv?=
 =?utf-8?B?V2tCc3NaQkpVVmhhTnhpUnY1Ti9XL1lDNmFQL0l0a2poYStDQUNSYTZGdmpV?=
 =?utf-8?B?b25jRzhaNm50eTFJTXB4QlF2eGc0QjYraXJYYjZWdXdsY3Y2YkNZRTBLbXJ6?=
 =?utf-8?B?NUU1ZllYTnR6L2U0ZDZDQlpWUHk4NlFxcFZXMmk3ZWhDbEhZaEVMM2hscHFC?=
 =?utf-8?B?djIvQmlaZFB1NlhtZ0d3NDdRdkNvWHc4NE5LSFVLbXJBZkRFNWkwVVloR084?=
 =?utf-8?B?djVKMTFFYnZLa3hnMTI3bXFSMllFbzU2UTk0Sm1ERklPdG5paUVacmlMVFkz?=
 =?utf-8?B?bHl1NDZ5ZmdQemUzSVMweFhNZzVXSlltRy9Tb2d2MTUreFpmdnVMejgvUWJY?=
 =?utf-8?B?WXNhTitpbjRqdlByd0dOOFlHS0FXd1ZIcmV3eVgzbjhEMWVTb0NUMi9rakE2?=
 =?utf-8?B?MEhvYnB1dHhoTGpTaG5Ca3pQczFuZ3hTNUJhcVZ1Skl6QmRqM1M5cUhQVUYy?=
 =?utf-8?B?Tlg2anJGWlRyUnBEa3lRQjRuY3NuZEFqZm1rTVdyVGg1ZkNnY2FWUzZVeFJS?=
 =?utf-8?B?N3hmWTdSWllGcVo3VjlzODJJOE9kWUQ2MUdITjJWQ25CWmpNSXNVYkRhN09R?=
 =?utf-8?B?R2t0c2FiSnkvNEpLTTdjeXV4cytoUVkzL1JqNDVIeTkrclN3czBZT3diMzZP?=
 =?utf-8?B?cEZhSklGcUJta3VzcEFwNDM4TjBIYkVQK0ZjdzJHaytOWHZmanRDbXgrdTZG?=
 =?utf-8?B?bE5KOEdWeE9xQ01YS0R6TVVhaGoyL1FVR3JGSEtYMGc0eTBYMlhvc1JBbXRv?=
 =?utf-8?B?TmxYSndSS1k4bzRMQjg2aHZsaUdUSnNmQkxQaENJaHdmeVdPakhMdTA2NHRE?=
 =?utf-8?B?cU80OUhHYXBLRGV4ZDFSTUM1ajg2ZlhISFNQRzJIZFkvRlVKMVRxamMyQ1E5?=
 =?utf-8?B?MUczU25xaVlSUlpvckF2bVpKTW9oSUJjT0pxRFZRaS83SG11NG8ycStYcHFN?=
 =?utf-8?B?TTVwMHBpdjJVaFU0R2ZzM2RlQVZudFFjOWwrSzh6cU90NGxVak93L1RqY204?=
 =?utf-8?B?L29xOGE5S2VsdjFCWmlabDZaaDdwMThMU1NnbmQzdTVWaEllZjdBM2Q4cVZ5?=
 =?utf-8?B?d0UyY1pmeG53K1BuZUhSeTZTcDhtdGR2bE9wd2g5UUkwY015ZTlTWFAxZ2tI?=
 =?utf-8?B?a2RCM2lQY3E5cFJpZGxObVBaVEJOV0J5OXhoWnZ3L0RnL2VxSVlnblJwWHN2?=
 =?utf-8?B?ZURZelhIeG1QcjFZbVUyOUR0d0dLeDVsa2dSc3QrUlc3L0x4eEw0Tk5ac1lP?=
 =?utf-8?B?cFpGUms5QzA5VVc4bFRpVDh2RTdOUXFDamJGbXZrWjllN2pBZ3NRTTRDZFF3?=
 =?utf-8?B?bmtjT2t5UjgvWUJQNEpqblEzeDFzUFJlZEx2WTUzS1gxT1MrOU1heEFIUjZB?=
 =?utf-8?B?NVNwTjlwU1BadzNoTWRZT2lIakd4Yy9CTVFlangvMmJWTXZxbVlOaG9EU2Jt?=
 =?utf-8?B?M2huUmlyd20wOXdBQld0UmpFbnBacmh6NFI4emVtaVBLL2NpaHhBQkdZalAw?=
 =?utf-8?Q?eW8qrDZ3UqrHiOZWm1+8YWoJi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36069bf3-f9db-4461-7bb7-08dcf36f1ad0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:29:30.0094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlJGRL1JM94mL/QxW1tbMQWUis5iK1lDwHcNa7yODprl9t+l1PZcFmVJ3S6bkyjJ/h0uU2hit1P8+nNPDvpwNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684



On 10/23/2024 19:41, Mario Limonciello wrote:
> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>> The PMF driver will allocate shared buffer memory using the
>> tee_shm_alloc_kernel_buf(). This allocated memory is located in the
>> secure world and is used for communication with the PMF-TA.
>>
>> The latest PMF-TA version introduces new structures with OEM debug
>> information and additional policy input conditions for evaluating the
>> policy binary. Consequently, the shared memory size must be
>> increased to
>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> How does this present to a user?  From what you describe it seems to
> me like this means a new TA will fail on older kernel in some way.

Newer TA will not fail on older systems. This change is just about the
increase in TA reserved memory that is presented as "shared memory",
as TA needs the additional memory for its own debug data structures.

From user standpoint, always be on latest FW, irrespective of the
platform. At this point in time, I don't see a need for FW versioning
name (in the future, if there is a need for having a limited support
to older platforms, we can carve out a logic to do versioning stuff).

> Some ideas:
> 
> 1) Should there be header version check on the TA and dynamically
> allocate the structure size based on the version of the F/W?
> 

This can be done, when the TA versioning upgrade happens, like from
1.3 to 1.4, apart from that there is no header stuff association.

> 2) Or is there a command to the TA that can query the expected output
> size?
> 

No, this is just the initial shared memory that the driver allocates
to pass the inputs and the commands to TA.

> 3) Or should the new TA filename be versioned, and the driver has a
> fallback policy?
> 
> Whatever the outcome is; I think it's best that if possible this
> change goes back to stable to try to minimize regressions to users as
> distros update linux-firmware.  For example Fedora updates this
> monthly, but also tracks stable kernels.
> 

Advisory to distros should be to pick the latest PMF TA (note that, I
have not still submitted to new TA FW).

Thanks,
Shyam

>> ---
>>   drivers/platform/x86/amd/pmf/pmf.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>> b/drivers/platform/x86/amd/pmf/pmf.h
>> index a79808fda1d8..18f12aad46a9 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -106,7 +106,7 @@ struct cookie_header {
>>   #define PMF_TA_IF_VERSION_MAJOR                1
>>   #define TA_PMF_ACTION_MAX                    32
>>   #define TA_PMF_UNDO_MAX                        8
>> -#define TA_OUTPUT_RESERVED_MEM                906
>> +#define TA_OUTPUT_RESERVED_MEM                922
>>   #define MAX_OPERATION_PARAMS                    4
>>     #define PMF_IF_V1        1
> 
