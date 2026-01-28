Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69066302741;
	Wed, 28 Jan 2026 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615804; cv=fail; b=g86hMFdZSOc7VMbHsPgObxUpWY6FALDVgzmbOjEk83j4rCXG7ORrIGBjNgEi4A9o90ZkT/QRyWRv4weQlojYVHmYPKJc20tzU/GE+Hvq3m83lbl3jhWQbJAvfSmVcb6PN2D9bSWda8L8aXcyQZdsoPPTVqccVcQR4bW7mNA9eIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615804; c=relaxed/simple;
	bh=fj8K+/fTU55pNpfkkoUo57PzzRjGjbYY8D78ZM+ikxA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kdRua70OW6g74HJ+rB3g/kkaQdlePo5dimqNYHaJ+7xco5pJI7+aVbak/+5ISevDw9WqXScgEJLYgHB/dhqhycYarv2hi5Yl+mQeIq7Cp4ZY7cAewxBrndH331TW0pXLwHZ/qeMSFI/X7SfdEhRiK4qguCgPkT4cJKU+7sruOG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wU9Tvw4z; arc=fail smtp.client-ip=40.93.198.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wU9Tvw4z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzNqXI718KcUHOMMTGrRB8xe+pesnb+KAL1/WPkTiAZwz0sq0tVRJ4ZMuEIYUOxhYwT43YQkdmy7/rti0C9yFsbuhDpt+iFAitvph9d6RBk0Gyv1yf+K8/Kx8q473Mmh7nfRl3Ko9KY9MqCDRRHpEW0Z3QR5IEWMgobsLz20DT71LKU8/1LRMSVUzEPfu4YRuW+o728Y5shCS/6sCvYCOId2n84kD7fl06VUNgydVZpwg7ISQKRxfg7ONsbbjIt/eI1YTj3t1Gyd6r88rCmLLE10RaZe0zwJKdzzqGAZv6A49muD+PadlrcY7RKSqQPQSelyF6az+mu+Pa65SfXsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EABHzmNPsw6OOG3WjYj65nuMMtczy6lo/rcCRF57v8Y=;
 b=pzhqBer3ct+bq8EiwLCmW5mcbn4f0UKMj/SZrbrASOPj1Mk65mLErMoQjQ2d+3uoRkXR7Vsq6WbUzn7dHdazD5ntEtr53ZZNJb60eV9pARadNc4LLZveAd2OKAE4+NAF64zfINYSdVFiFsGIY6etgbhq+cdy6CIUMq9mvpvzY3dGv+aT7Rsfw6gtp36R1m+3NsFjJOLZR3ONFtBOvK7x7mTWEDt63CXotZn07w951AqWc0035yhdE3z6Knu2vG8yl822va8CdqopnXS48unJzlHyRnXWQwMCyux9yYTLTuTN51kTA8ByrrIWTaoc/j1Tg69bpMaT5hWFQJ4yulPcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EABHzmNPsw6OOG3WjYj65nuMMtczy6lo/rcCRF57v8Y=;
 b=wU9Tvw4zjyJ5ASZkYAJyqTl2DYqwJxmNnjzFdqX7eLiUe3fYr+SAX4N99Adzf8CYYgnR+Sl7Gj1WyCe5wZkTemc7ijEWXfaVb33iqXfCGfWP+egUSsbIrVOZVOPdLbT/DIEqRxAO/jrSBcQWS7zQwUixXj0bw3IrfN//73z2yTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 15:56:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 15:56:40 +0000
Message-ID: <c536f60d-2741-427a-9b46-7fb8cc1a2a4e@amd.com>
Date: Wed, 28 Jan 2026 09:56:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 221019] After s2idle: amd-pmf AMDI0107:00: TEE enact cmd
 failed. err: ffff000e, ret:0
To: Borislav Petkov <bp@alien8.de>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 bugzilla-daemon@kernel.org, frederik@frehi.be
References: <bug-221019-6385@https.bugzilla.kernel.org/>
 <bug-221019-6385-GcFBcW3deQ@https.bugzilla.kernel.org/>
 <20260128122900.GAaXoBDDwHHyIkk6Wv@fat_crate.local>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260128122900.GAaXoBDDwHHyIkk6Wv@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0163.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: ae374ea0-f96f-4d91-e0d1-08de5e85d307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUlLNG9qZER1czljT3Q5cFZSNk13WXQ1TkVKSGVXY0ZNWFFnUjlTU3ZlN2Js?=
 =?utf-8?B?Q0hJNyswZDJHRFFIL2pnaWlzUUNNOFlHb0xMU24rSGJtL245WURhNGVOT1Iy?=
 =?utf-8?B?S2FocW94alhkYmpQZUhrdUxCRFYyZS9kd21wWmRJVXFpUm9KZ2Noamk5SExU?=
 =?utf-8?B?cnJFaHVnN0RUTXdKQ3dab2xqMVNISnREU09sUUsyOXdWZWFxR3A5RXVlOUx5?=
 =?utf-8?B?VWFidEMyT2l6SmRWRHdTdnV1Wnd1emJLZjlRWi93clBYV0pxWVpVNmF4eHJz?=
 =?utf-8?B?d3VJdmpqTlAybXhxZldyUnU0cGFkMkJ4QjNScjl2YzNmMTV1MVpIUU9VakFr?=
 =?utf-8?B?RFU5Njk3Uk5xTWVvU0cxZ0NtRTJoTlJMeHlJeENLUisyRkFwY0tBSjh5aVg3?=
 =?utf-8?B?ejdWYTRBcDllckh6QmJSdzVSNUVuY3BsdFBNbFZValIyeWJtQkgwK29LT00z?=
 =?utf-8?B?ZjlQVG1kbHlMNHZYZndsZGh2Q1M3am5VZHdlWHhraVFmRExJMU16dVRHRmwz?=
 =?utf-8?B?ZzRKTnVVdzZJbVlHTUd1ZDVuQmg1RXJxNCtRRmViY093MHNjakRERkFaSVR3?=
 =?utf-8?B?NE1ud2NrdzhYakV0Mk8rMG1hWHpWRE1wcWRpUXVaWWhxeE5PVlZsRWFzeUV6?=
 =?utf-8?B?OGF0VVM5N0h1S0tTbUsyRStzek5UUnlUM1dpbkZzVC80Umx1UExoMHp6OGw5?=
 =?utf-8?B?UmMrdXBCeldtWmhTYnRMd1YrUjR3UUQyRFAzbmErUmFOZkhpeENST3Azd1ds?=
 =?utf-8?B?YkY4TjlKY1lpb2lla1lJOUxrYTNrV3FVRUdmdzlNaE5SeHBVZXBLYkQrNVRl?=
 =?utf-8?B?clBXeGo2LzArZkViMGtmZmRSWUtKOGorcU9qcTByeDZldENSa0pkSlh0eTJz?=
 =?utf-8?B?LzMvUFE5Y3lEUGpscWRPUUI4c251NU9OZ3N4RUNCZytycnlsS2lCQ1R5M0lH?=
 =?utf-8?B?b2hreEhLRGRpZGRyK0wvN3FGelp5QTh1VkpwMm1RcGE4ampid203Z0U2cFVH?=
 =?utf-8?B?YlovdUtwYjNxYWdhZWhtSU51aUFkTnFvaURaR2pJZ09RTnFxWno0bDZnM0pF?=
 =?utf-8?B?d2FVM1o5b1pnSE5oblVYT3lzUEpCZHF0MlF2ZFlKWmFzcUo2SXVFY3ZpUlQw?=
 =?utf-8?B?TUJ6TGl6eGVUNkdFaWZZazhPZkJTOVR6RDVDUDIyWkhFdjR2ZjhVdXFzYlNG?=
 =?utf-8?B?TzlSYUVnNHZzdjRORFV2Y1RoSUs1bEd3S1FEckVJUDJONWNpWFZxS3U5RGhE?=
 =?utf-8?B?Z1ZvVldaYUJzNE5vaGdudURraUhQYmpROFpzZTc1Sk5JVHhQVkl0bHlFL2ZL?=
 =?utf-8?B?aFBIbVUzY2dDczVrU3hHRFR3NzhYWXlOOFROY085a1BTWnV3Tm11cTFEVGFS?=
 =?utf-8?B?b2VtWjkyVWNWZS9IL1ZuaGpOaFhSS2ZPK0FNTnRyN1hTTEVjdm9qLzFqQ2lu?=
 =?utf-8?B?OXl0eXpEQzlsYjhaVGhyeFZYREc2bDZ6M05CcURLMCtUNzh5UVlvcWNHbGIx?=
 =?utf-8?B?K0p6eXpIZUVEYzBoSlRDVkIrZW1SZDQyY01UVWVieGlmVldlTTNLUU9lL0Fy?=
 =?utf-8?B?T1hUZFA5NzUwVlorUXF6MUpJYktwbERISkNtWjVsSnBCcVRKL2hrMTk4b2ZJ?=
 =?utf-8?B?YkcvZlZZTElsOTFZajhNSWZjd3hsSVczNmdCdW1ZUkl0THpWTldiSStKaDh0?=
 =?utf-8?B?QzBZTFA0TWNuVDZvdGhySSthYXJTMXhwdzlPTXV5Mld3ZnpjQVI4ak9MT3lQ?=
 =?utf-8?B?NlFweXh2QnMvZHViM1FUMTVFemF6eXBlSGFlbGdUdU1DZE5CUkFJczloUWFn?=
 =?utf-8?B?N092azlQZTh0RlRCQXRLN1YvVGx3V0dEVXpzUkQ2cytnYy9GbGlkT050dlIr?=
 =?utf-8?B?STlQNlhGQjY1NHpTZHBnZkJwSXVkanMzZUpwWFRUc3MxQ0YrMHFqNXE4cWpm?=
 =?utf-8?B?Qi9lSzd5T3NoYzU5RjB1cHhRTHVmSVNzOVo0L2RVaTBncW5sdkFuNHJYUHVS?=
 =?utf-8?B?Zk1NeE5tQW5TcTBKTUJQT0ZTbXlBZ1hDNnBWNlB1aUdrbmhhckxGbVNRTGc4?=
 =?utf-8?B?RUttckRRRDVJUG5LTWpsMHpoNkVCaG1DQTVqVWdtMHlnLzdSR3BGTCs5aFRZ?=
 =?utf-8?Q?KkQZMJD6EY6dRgWSMCZh5F2wf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkJtdXlpb0VuOU9vdEFNbmxZYi9DR3k3clppWnNaelVOR0hTWGpPL0ZsMHBS?=
 =?utf-8?B?UmdNaDcxblhKKzRPcWc2d0hUOWxBeVpnYVhZckUyVjUwaE50L3JJZmlSUFNW?=
 =?utf-8?B?cGVoZ2VNdVhIMnZsSkVSajFmR2ZKS3NoZnFDRVRtZlQvb202TlpQQU5LZy92?=
 =?utf-8?B?N3BvajlaMUY0WE5FNDVYdE1NYVJNUU9FWG14NWhzYURHV25jVjVpUzBqRUhP?=
 =?utf-8?B?dHN0bEJoK2JEcVRNT2ptVHplUHBJazhndWgwUE0yajl4RXZyckxxMm4rWjB2?=
 =?utf-8?B?T2tLVGQvWEVFVGIwVjZvSE5Xa3M2Q25rNHd6RU9vMzViVkcwcHhNaWd4NExC?=
 =?utf-8?B?Y3ZEb1pqZTNsajlraFZhVG9WY2FVTDRtT094aTNkdGlodE8xa1N6bmZnalov?=
 =?utf-8?B?U1QwQUp6L0dST0U3S0ZmQXhGM21VRnNkTVFrNWpMSndSMGkrVVJhVmJXcDI1?=
 =?utf-8?B?S1N4SDNwa1podG9VbXNHeHdsQnUwTXdQNWtYRnNQV0dPSXgwWTdHUytRSllP?=
 =?utf-8?B?TGJ0dTN2bzh4ejhHVzhUUkVScEJ2UUVJcjd1eUFHT0haS3E4WFkvaXU0WnZQ?=
 =?utf-8?B?c21lRnhjRmgvcjFqQS9vTHZ2b3FBb2NMdUhVQVdTcE4xUkMzVysyR05wZmdX?=
 =?utf-8?B?QWloUUNwTHV4b1J0RW5BTnhHRFU4aFgyTi9wYllHKzVTRlB0Uk13L0Z3ZEZx?=
 =?utf-8?B?d0ZSTkZXaHpNamtRR09uaFNwbThIUld5STdKNUhIZEhZNU9ZK212N3dOK2dG?=
 =?utf-8?B?VE9Xa0RRQTlMZlVvUVR0NEsxQWUyU0pUQU9OUEpTMmtqdzUrdUNSbWdvOXNW?=
 =?utf-8?B?N0R0M0NJZGs4Q21jMHI0dEI2ZzV6NTRMbWU5NUZhWFFtek5Xa1c5Z0owRC9x?=
 =?utf-8?B?SEZsNE1pNEpxN3pDbFlaSG9QVksvaG9pVkFUNXRDSXVOc1c1TTlkWHdTa01h?=
 =?utf-8?B?c0oyRzN2Ri9NYjZXNGFxTC9CSWx5dmVnODVnL1h1aW9sWkxNRC9XcERiZmh0?=
 =?utf-8?B?S1hseHlKMldkQTZRTkJGeWRlcGZLa0ZnYkQ4Vk5OWTBRaDk1YUZ0SDJjTjR5?=
 =?utf-8?B?ZUZSMGVZVWlaTnpIQkpTNjIxYTV4T2NHc0FPS2MrS1VtQTYvdys1RHNYdnFv?=
 =?utf-8?B?ZGFxRnduVHFzTFFkVDRKVWtCNGphMTdlbndoU2pCY3kvbTY2UmhLY2FyODJH?=
 =?utf-8?B?VkJabjdMaXROTVdUUDJ1cXpTblZ5UEFwRmwwYzNqaENxSXh2MXRuQTRzNmN5?=
 =?utf-8?B?WkdBY3ZJL2RKaGdRMWxhNVN3ZzRqSTAwbjNTN2ltbDhKSzFIZjdmb1A5SmpH?=
 =?utf-8?B?Y2FkaXM3Y004VDZTMjBPZU10NE9GRG8yUmx1ckl6NWd4Z1hERkhGSHk1aytt?=
 =?utf-8?B?NVczVWx2UEJPakRhWmtTcm9Mb1JROUpEUmxadndER1ZGbnBQbmlCc1BMenBq?=
 =?utf-8?B?cmZ2WlZFVzBBcFUzTFA3bW5qNnRKdTQvbEpkaUtTZkJicUpIejRzWW5nU0I5?=
 =?utf-8?B?V2NlRlZsWjRDWkY4Y3ZTQ3N6NHhNaHR3UFcyY1RlcFNtaVltbldscEF0emRv?=
 =?utf-8?B?U2NvanVEUVp1UTVRNE02SUExbGg2RXNFeUpNRS9TUndDM2Z2TktJRjZmY2I1?=
 =?utf-8?B?STFxNEx3YTB5TXF0S05nbGJyZkozd3VOMUVPUmZ0NjRpc051TDdMZkgrMm8w?=
 =?utf-8?B?dCtFZ2ViUGdMQzVwWXdmei9PQkJjaWVCRVJKQU5UNGdMZ0hCc05DZlRuNE9v?=
 =?utf-8?B?SUorY1V4UWdLL2c2c25hS2w5Qkt0RERHNDg1OU4wc1QrODU3T0d4aWcvdUhQ?=
 =?utf-8?B?Y05SMkI3RkZ5dysxSDVxR0U0dU5sTzNrcHIrNjVEU2tpMnpuRWpBRCtHOXg3?=
 =?utf-8?B?d05RVEdLa2tHd3NoaHFDbXVHZVl4cXNHOVJKdllrc3VidEZwbWZPWUM0QXVY?=
 =?utf-8?B?Ny9WQy9abUFmZmE0WnJ1TVQ5Snh2TDhoYVB0QTJtQ292cW5pQjNJV1k3VUJW?=
 =?utf-8?B?RDhZT3BOUnp2Y2N5QkNaNkl1VHJlYnpreTQvSFdyK3c1SHlFV0V1eUhWcHQ5?=
 =?utf-8?B?UllYdmI4RTdpOFZmVkJ6djNHK0RhK2JQcVpOdGc2M0VsN2tIWExHeTJzT2R1?=
 =?utf-8?B?Uk1nNStrcmNmbWdFdEh6V01aWmJ3UmVEVG9ScXJ0SlB4Ti80N1NJbXRzclYw?=
 =?utf-8?B?VVRMY3Nwckp6TityQXgwNDdybndHSnJ0dUFsTitmTXBIaEJEZlF6MFN4RFVr?=
 =?utf-8?B?N3ZiNVA4RUs2alNBZ1ZDcFpMcWs3NEJTRTRHUVZjR1VwcENzSWxTVmNabk1W?=
 =?utf-8?B?MEp1aFZNL3ZmVUxCSVBQYTUyeXJObEpLdjZuQ1FIUjUySWVtNU1Udz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae374ea0-f96f-4d91-e0d1-08de5e85d307
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:56:39.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVy34yqsMzjX0f0HHI1ZzZHxGUqTuMgCWfA9tCi3eIC1YMQE2AChVAPYh8208ylcuPnEXRLx4ZTDxqidHfOznw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527

On 1/28/26 6:29 AM, Borislav Petkov wrote:
> Switching to mail and adding people to Cc.
> 
> On Wed, Jan 28, 2026 at 08:20:27AM +0000, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=221019
>>
>> frederik@frehi.be changed:
>>
>>             What    |Removed                     |Added
>> ----------------------------------------------------------------------------
>>       Kernel Version|                            |6.18.5
>>
>> --- Comment #1 from frederik@frehi.be ---
>> I have an HP EliteBook 8 G1a 14 laptop. Sometimes when resuming the system
>> from s2idle, I get an endless loop of this kernel error message,
>> repeated every second:
>>
>> amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
>>
>> I'm using Linux 6.18.5 from Debian unstable.
>>
>> Complete kernel log attached.

This looks just like the issue we had with S4.

Try this series.

https://lore.kernel.org/platform-driver-x86/20260116041132.153674-1-superm1@kernel.org/

Thanks,
