Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A8E287507
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856933; cv=fail; b=UC6eMfGIGPdvNMvGcFrqQ4xb8V5IcQnPb7vjDCqbkYb+YqgXuT6Qs723YBm3AskUAUIR+0Zi5cRFYCJzQNdK/FFqO7yEv/4dv7cRIZt96mTI6wAz/bBKMNn/NidS9vga7qWjE7FiDJkurDSFq+TogP11N83Fu1ZCrOyCv8AUAps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856933; c=relaxed/simple;
	bh=QOX5u5KVQVL/ysoCIPfccjuTIoAbbJe0OhIRimCECsU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E0pg4MXndQg/anmT9TcBscUtyQ6oyP80//iHwka3gkI5ig3YxKkMgTbJiLOCk4Hf/WUAAy4syfLFFrn1XyzVXIrtUBgRs5ij2gfCfS6nDzt+A2xsIjGOMjTMk/mmFb1Kl0ZaK/Dat3NpMQq6Us7Pr1ittP+5va2GbNB4dj4JlM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z5nTv4WO; arc=fail smtp.client-ip=40.107.200.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z5nTv4WO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBdq8dbVlNxbygPrHpyz0E0JZgaz05uTd6NEkefh2v3eEu03mGWv7xqD1AwHkG5yTFCJsP86huTurMWC+UZmhrn5eLUZ2XVcdYxqenllfQY6gsCJVcws21xKT15S3BHNMD1vh5ZC4+XUlNfQZ3zbqotw4TIcLIGNfhXDVmQNtMMjEnpARzLDGhP6cCBa36JSBa1wR01fo9FxzwiW1ts90w3flBnVCgxOE3ZFuPF3BIYx+yc6YKxdiFFHt7YkYSbPB5aufFBGJV2yG+pgFKeaxFYTKkn0S34C1sNBui1cTorwPWiTz4ME9ZeBFuRAu8ZPLfpkffNj/n+enTb9VwNhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzzNvZTCQGE3D/b+7qB8ipaKXkLK1Nwm7B79Jjhl3gE=;
 b=fUg4AY3b2lUI4zwmD3A+YMxl4BzKDmv+/MNbIDa76hCqQLV17zn+ZRoq4Jej7BsOoa6IH0WJfTYIg5dFrgsOHL/53p8PlMlOKrEXetwl+n1hJOUY18NuT3nWDNjAf0D1uz9EG2e4ay4rrn3y0yPw1lf+pF11onFrYwApDe5aaPPjHMihwqxe3f1K9pPMIGOQh/dy3BccKS7bBkCXjhxgrr5NSSyPaD8/bZc1X+/YSNk2f8no5jTwNFtioaYBBXtcg3d4wc4uhPEznF0/jKH9Ae1FBraGToWVKM5nu77Hfnzq6UIPsRZ0lEVOBVW+X4j6r1QnEeeTKStJ5AUQO0gMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzzNvZTCQGE3D/b+7qB8ipaKXkLK1Nwm7B79Jjhl3gE=;
 b=z5nTv4WOaHuaBAXqrv/dqK7Pd5W55/UepPcnvkRxGgedayyhkIRzu5SAq/6Pz/ILTiJONCPax91QPm2ZqIyz47slXgoJ5laFoOkchRczwZAdkpSFrJBf7Sh42ymmd+8T/FJbeq/iXVc4vJWdX8FT6Kqf/UGgaDjIztXXYPZsz9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SJ2PR12MB8036.namprd12.prod.outlook.com (2603:10b6:a03:4c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:28:48 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:28:48 +0000
Message-ID: <f4f2c1a2-25a7-4399-8b13-d627f7a20ac7@amd.com>
Date: Mon, 23 Feb 2026 08:28:46 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
To: Paul Kerry <p.kerry@sheffield.ac.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 1127612@bugs.debian.org
Cc: Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <aZMt6sSlpKK_JAdT@monoceros>
 <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
 <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com> <aZnNu_AphE78MIoY@monoceros>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <3167b808-1fc9-4b73-9bd3-b76b149d2b65@sheffield.ac.uk>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <3167b808-1fc9-4b73-9bd3-b76b149d2b65@sheffield.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::15) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SJ2PR12MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: e9891cfb-dad2-4653-c2aa-08de72e7dba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1pqeUhDeHJZZVZYT3FHNThVTG5MVDdqV2RHa0dURGhmbmRXMXp5Vng4Y0xm?=
 =?utf-8?B?Q0k4NnUzU3NjdFpEYlJSQTR4VVptMXZBWVU0R2ZUdWNOWURmb3dETHE3V3BW?=
 =?utf-8?B?QklOMDJNbDJycFZxOG0yemRnT3JPTXFpWXJMM2tXZmVZZnJIc2U1d25QNTR1?=
 =?utf-8?B?SUpzK2xQU2RwQ1c5ZDlrVXJVSzVwTVBmYUFLNXJIc2Q5bzFtcE1kSmJ0Y3Nz?=
 =?utf-8?B?V0dpYTNCVFhoWW9yOHRBSWluSm9Wa2NNR2VJZjB6U3FxUFZCZmhHbmhJZGl4?=
 =?utf-8?B?N0JFbWpRMWhERWJJZXROT3VwKzhLcTlpV0hmQVVJS3F0Q2hHblZ0dkt4ZCtG?=
 =?utf-8?B?NXdua2N0QitYay93RnVaTjQwUWZaVGl1bm52OUJPaURVT2RseTF5aGp2RnJE?=
 =?utf-8?B?Q0ZrZi9DZStqYVZma1lqQzNKRHZ5eGVDdUc1TGFlLzJTRDhDL2ZsdkRwQWpu?=
 =?utf-8?B?aXhZK2tuS1RMM3IwTHpCSmRleWg3MXoyNkR2Wll6TXBmK1Y1YnY0OGY0UFpK?=
 =?utf-8?B?MmV1cm9tUDh2Y1QrTmt1azg3am5hSWI2Y2k1YWdvWlArM2hrSFEvSG9VUTNV?=
 =?utf-8?B?c1JRVFVtMjA1ZkNETnhkMFkyRHRzTHFZRVpSK1FRaVZ2S2JPc1l6bW04Q1hK?=
 =?utf-8?B?NFljU3BOZUlndFp3bmowalV4VEZDakpMRzNHbzYyZzhtMDJJZitkWjc1dWlR?=
 =?utf-8?B?UUlGTm90akxxaGlMeGVBTGZnR3FHTGRWcUhRdnc2TTRoc0kzL3ZjMk9XNGRV?=
 =?utf-8?B?ajJ6cHRsbExzdmVwZDg1SW9UZVM3Y05QaUhxV2o1M2JZRm9uQzQvYTlrUlU0?=
 =?utf-8?B?UUgxS2M3UVljZksrSGpoZldFeEx0MHFTUEcvNW5HcXdqY3lRdXZyTTJWSkg1?=
 =?utf-8?B?Ly9ORklHTytRY1c0eUlYMDdBQ2RldGFyQXE3b1pKdnBoaWxrT0V3RHAwTmVK?=
 =?utf-8?B?Y0MrdHJWNXdNaTR1YkZrcWcrRkxLNVkvdEgya2pDWCswLzV6Vk5PQ0Fjd3Rx?=
 =?utf-8?B?UThyRDltYXZncXQ5KzFwR21ENHVHbmM2Z2swZ3V2Nlc5T3RDVE5mM3ZkNjFk?=
 =?utf-8?B?VFU2aW9rQ2NoREhhOHp3TndhQnpOQWxYV3J5VGhTOFlrOHdjNGZzK0F1VHVq?=
 =?utf-8?B?TlZ3TVRjMlQ2U1BSNEtWYjNlZkxQSm9vOUUxbXYzUnp0aVFUUm9HRTUvZXA4?=
 =?utf-8?B?ekpUd1phMWVIS0FmbVczVU9QMmxoRDQ5UEl4MTBFRDlzK2MraHdSM3ozcWFq?=
 =?utf-8?B?MUdWL283UEpNa0VzUmpOZlFhRlRhcFFQRzN0REdoaEV0WmNuRjNuYjUyUDJv?=
 =?utf-8?B?Ti9oVTJNcU16SUU5OXJlL0RabDBPb2VzSUdiUGI2bDNhRzJpRCtMOFJzUUZL?=
 =?utf-8?B?MTArYWp5Y0JRcVkyNiswM1RCU3dxZkZBbFI0QThUYjFZbWw3K3RtaWJKNE00?=
 =?utf-8?B?MnlHN25xcmpiMGlLUStxUVo0Z1dBWEk2Mi8reUtoVlYxbVF5RWpVeEFIOGw4?=
 =?utf-8?B?bVMrelo0c0lVNEcvd3hzdnQ5TEVRd0xrT0RtR1N1N3VldVZTNXBsZjdDK3pU?=
 =?utf-8?B?N1hIcFhTMEVXdFpHT2I2L2hKTnA3R3RHY0FKQTJNOXI5cCs1cGVzanp1ajNr?=
 =?utf-8?B?bWVseDMrRGx2RUVKZlFyYnYxamExNEc5TnRsNmlReiswTVo5Z3UzSW1NVnVD?=
 =?utf-8?B?U0JJb1NwbzVRL2VkYk5rNllmOUtzekE4Vy8rSkh5N3h5VndiWlFIWFAwcW1q?=
 =?utf-8?B?TG9uWkhhWXFRY1BSY3hQUEdpelVaK3Vpc0FXTXowQjVuOGpoKzVhZ3NYYTdY?=
 =?utf-8?B?Q3BoRzAwbjVYRmNBRnhLQUM1ZzE5UGNHY2VHM1YxWjFBWGpIQW4wRno2cHFB?=
 =?utf-8?B?OTN1MEVtampabEROVXZvckRnZ21lV3h5b3VRdHJjL0Z6dlhCR3dwYTd0YTdl?=
 =?utf-8?B?QzBYTDZlY0VESEhOQnJtcDdVU1hXeERGb0FXa3loMnhRVzBXWHAyZ3FDcm4r?=
 =?utf-8?B?OTdBQ2REbXBqVStHSzFMVUNJY0JyV3AzSmN1ei9Vc3NmNXJ5MWlwZXJveHhr?=
 =?utf-8?Q?s0s5XP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ykd2bWduRVNIUis4ZTM0NklyaFc1MHVydHJBcHJaNUpXT3BhVnVtckJLMVVh?=
 =?utf-8?B?dDJvUEpBNXAzZ0x1QkYxa0hqTWE4TjB1YjJPUFZ3dEZBRXdjK1NqUFpsdE5l?=
 =?utf-8?B?blEzWGVld2EvZXI2Nnk0RENDQUFWaHRJZzYvUEtSRm1RdlZZYzQzNEFaU0lS?=
 =?utf-8?B?bjdOYjByNlhtWXNTazJmNm96cEQwb0ROSGJYYm82UlJNeGUwN2QvNDZTVjBz?=
 =?utf-8?B?L3h2Zkllb0dYZ05wTEg5bllwSnFxQ3RYZ0R5c0wyZ05qVjMzY1MyWlJ1TjN6?=
 =?utf-8?B?MkdaYkxzbXIwWUwyaUN4bEQvYVphaFE3TUNTdnVMbU1hMFk3SWJVT2l3Z0pv?=
 =?utf-8?B?WUpqMUpXMkxoRm8xeWF1S0JKYTNtL3N0Q1ZJRnFVWVBJSjg4dkpvM0RpLzlk?=
 =?utf-8?B?Qmp0T0hpOHZlekNxZ0VaaFU5ODN6Wm83ZXg5R2pFbXJmdzlKcXB3L0MwYUgz?=
 =?utf-8?B?N2lBWXQ1OFZiWVJIYWl4YlNTMDNXRXZ3cDh3aWJQUW9kdlJGM2xYWjB5OWpk?=
 =?utf-8?B?RkNWdXcyTFdNMnNoeWlWU0tObU5CZklsUWNsMm1XN20vYm9PVTQ2L3ljTkpl?=
 =?utf-8?B?YmpESDJjK3hTb0xQUnA3ODNpRkF1V2p3MVhuNkNudjF5NVFPeFpMRnhxZ3Za?=
 =?utf-8?B?SnlPTzhiNVN0cWJwOG5mY0NJRmFIbWdFSzh0WXg1dnhlSVRSd0dYWktCblp6?=
 =?utf-8?B?emMvd1FOdWx4STBEK0JJVWRuU3c3d3dXaWVTTVFmME00bDh3Tnl5SE82N25n?=
 =?utf-8?B?OWkwdTBaWkJURXE0ZHkxaUhLZWZSWEtTS3pGU3pHaUIzYmVQVE9wK0o1UjBG?=
 =?utf-8?B?ZnVSZFJSUE1WZk5VdjVWUERNa3VGUzdWN0FNa2pDMzNMeCtaNVM0bFNKOGph?=
 =?utf-8?B?b01Uc3Jpc25wYWZYREJ6Ulp1Rzg2VkpFaEJQMUtTUXJnTkp0MVkrOHJYWWNZ?=
 =?utf-8?B?SU5IcU96L1VpRmNGYlF4czFZaDNxa2VNaS9ybkZDT0pkaXZPTEcwR3lRZFNB?=
 =?utf-8?B?QnhCQVROWklFekxhMU1Zb1QrUW44bW5lZE9XRlVwTWZST3E2UXd2WkhYd1B6?=
 =?utf-8?B?N25IbWNBMDFhQjVWdGpuR3pZckxtbWF3bHdha1Q5enduVzA1VkFTMDYzRWs0?=
 =?utf-8?B?MW1jK2pCRDNmYnJXWkdOdXdKS3NKN0dFV3NIY2kvUEltKzdqVGVhWFQyU09j?=
 =?utf-8?B?VFF5Z1BaakhzSGpPS3VzSDBPdXFTbExkNnVRZEhIMVljRUVaRXdtOGlUUTdp?=
 =?utf-8?B?TU1sdnhGVWpldUpibGlmSlowcnM2dHVFWHg4UzVmUTZNZFExUDVib3ZKSFF2?=
 =?utf-8?B?N3FTVmNWOWdBV2JSNUdhRTRTMXhTRmdxdFpuZzFGb2FaRmVXaVBYc3VtMk1a?=
 =?utf-8?B?SWJWdWFQUU5mUzZ0TTQ0dGRBODNhMWU2ekxjWjU5OHcydzJ2eFdNcVVWRElr?=
 =?utf-8?B?M3NJMktTRlJCNzlUcDBKRzFGQ0pRUzZpY1I2Z1FUdlJFWUN0UHVXUXVqVUlT?=
 =?utf-8?B?YjFYU3VIVndqdjRISEdIS3lUWWZTTCtSUU9RaHpJTjgrdk4yMklBNkpvbEZE?=
 =?utf-8?B?Q3hPdmJXaHJjbDhvSXhVVmdSajJ4dktiQW9qSmlZU1o2ajVSUHhuZ2IwOERt?=
 =?utf-8?B?NXI5SmYvZllEei9NWWY2S08vOEVwMERIN3pWbUMwK2UvaG5XOFhDR1VySWtu?=
 =?utf-8?B?STEzaklOY2QxcUdJeUlMTmpuWHhzRGNxMXFEYU8rR2lmeGRRWXAzaEcxN2Ni?=
 =?utf-8?B?NXJLc0wyVUxlMkVOOUg3RUI4SlcvSTc2a2JvYVhPbVJnb2Y3ZGw0cCt4S0cx?=
 =?utf-8?B?NkwxWWhUZU5lQk9iYkdOa2tsUTNDd1lJOG5JNTdwdndLTnZOQVRPN2IwVG52?=
 =?utf-8?B?S2MwMHE5R0RxZ2MrMXl6WnFoVW1mMDVZMHdTalNGTnpCa091NEU5MmFGanFG?=
 =?utf-8?B?U1VweTdvekRlTWJzUnFBOEVMciswcm5lNkNvV25jTlluSWoxUm9xdWtHL1FZ?=
 =?utf-8?B?TUx3V3lNd0tDamRCbjhIRnZqS0J2dVlmRm9IbnA1N3JnUFE3SlBzZURKS09G?=
 =?utf-8?B?TFR1RTlTeE5WUUVUWFNiYUpjcjFHdmdvTDZBZlVsWnhVbXQ1ZkRtWmZmMEtM?=
 =?utf-8?B?THpjNGhaSmk3aDBLZ3hoRXdocFA0R0tRRkNwUjVGb3FaZXBHYkpOdnBKOW44?=
 =?utf-8?B?OTRTc2Ntd09GRFhsd2RnSXk3VENEL1pDMFpRaXRtOUYvaWFQL2dWalA1c2pC?=
 =?utf-8?B?S21DWnUrL01jYVYyK3ZwcUZVa0M1cCtKUDNENFdQWnJqUmpjTkloVFhhTklM?=
 =?utf-8?Q?tbENmmlrOCU1gql+Bu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9891cfb-dad2-4653-c2aa-08de72e7dba3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:28:48.4221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBcBzme3xmK6l86+sJC7G3gy3dxKYa3kuImSpqFFA8XXeezMSPHiSHrTT8x5nRHIncPI+X6ZL1nf6tg3GkgTCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8036

On 2/23/26 8:26 AM, Paul Kerry wrote:
> On Mon, 23 Feb 2026 12:46:54 +0000 Paul Kerry <p.kerry@sheffield.ac.uk> 
> wrote:
>> Hi Uwe and Mario
>>
>> Thanks, and yes I should be able to incorporate the patch and create a 
>> kernel image: I've now moved up to the recently released 
>> 6.12.73+deb13-amd64 kernel and the same warning occurs, so would you 
>> like me to try to build the patched version against that or on 
>> 6.12.69+deb13-amd64 ?
> 
> [apologies - I didn't include all email addresses into my previous reply]
> 
> Hi Uwe
> 
> I'm following...
> https://kernel-team.pages.debian.net/kernel-handbook/ch-common- 
> tasks.html#s-common-official
> 
> and I've tried to patch things using debian/bin/test-patches but am 
> getting...
> 
> patch: **** malformed patch at line 11: 
> kcalloc(bioscfg_drv.enumeration_instances_count,
> 
> so perhaps it is how I am copying/pasting the lines from the earlier 
> post into a file that is then causing the problem?

It's totally possible the patch got mangled when I copied and pasted 
too.  It's pretty trivial, I'd just make the modifications directly if 
it's not applying from copy/paste.

> 
> It's also been quite some time since I built a kernel and a debian 
> patched one at that, so I'm more than likely doing something wrong, so 
> if you could create a test package instead of me having to build things, 
> that would be a big help thank you.
> 
> Best regards
> Paul
> 

