Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014CF1E47B6
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 18:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730833140; cv=fail; b=Uyy4xO3Smv3mn9DAqhiTShfSbGkLVk+xBP3hoU8hFl2TpRTyT47Gz10f+rnsQfP/RO5bV5owFitt9wMKU5DUR7V7Ztoq4fnHdxI4Hz8NvZ1h5dnuvKzEWIlShrKSoO6pkdXixyd4+hCBaSvXI/Dl9VG/Lzo8nxbzBgSmqH4nc4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730833140; c=relaxed/simple;
	bh=dVzeWrVxuMYLfiAa3Xjl8uTx+N1+gQTK6IFQk8qY82g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=egtxIdlmKJRNqhkjoj6iv8V0XKxwDr9WtEzfQXAFLsG007SJ6giLr3HUcStuSVB+vdiS2aoE7BFJ/CWwJ1DpwV8r9xbvQqmu+c2aJE/omFH0D05v/RD0PsLGXubbSZvDuUqtTQgP+U+C0qCexkDrvl5c7ld3fLluMye+cBGaujI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lhizAWtl; arc=fail smtp.client-ip=40.107.237.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lhizAWtl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqzD69Zccp/Ta2KCIuqJ7cqwWA/1MVXdrJ9/ZpZfZ6Qg0SZe7RgVeG3WG8o7OS7v93OHT8WP9XbronWu8d7oC/tu3TkbF090xBO29ZxIQh7yGWYm8T8qAMm1/3iP0dbMFEQvNLHUurvyPrdp2J5LV1ukq1tjDTs50xJgIQ6/2HqQ8geSXjULEnAUEEBI4bXOclIwmgg6MgMH18Uqz83rvEGgZqLg3Aeirmy5/qEtzKbb4vgzXkfG+Cb/kBueSqpBCk8M62NVmbZfC9WhyUdH2eD5Z6tlRx4VPxzga8kvL/WVtphFjjydHFGnb+CH9bTQAHIWJQ9zxM2Qx104VagGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNKyCS6DMx1wdK9LnX6xOUdK2aO4OgiSZ30bKJGPM7c=;
 b=G0SALfaj/pgbsxL5YFkWj0+CpRLZadN6fPz0cZ5Vo0f1otM7lBNG6xqtRepaFhxJcDzY6yrQhsufkgqM4W/vq4CtHrAcWACoSUS09vvHKPGmKgQwrEnUoYzZwZdc82AjHZSxvuq85ZsRbUKvPQHI8Gtx8SA84ZAwANPVHgIMAbSmKDz08rfIxH/s4foxynozUQM3lRLbizfegXcAd3eqDOkpcBfcDmdEVAvVLtdmwahx5CXngIZbzjaxWft4YjeDdie/TD7tI63SwSr4X+6pDPTaFA5v3/21uupssQRJllTKuFpOBUepZqjrtQtkZrjE/6/x+iG7s3SOQmVXHpzPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNKyCS6DMx1wdK9LnX6xOUdK2aO4OgiSZ30bKJGPM7c=;
 b=lhizAWtl58urPLpNygItjheT4fieJ0jY+yXfOYaoAbXrwN5HdrFfPsYWKTSjZ+9qiFtQgdvHmFJo3fQsBfn7kuItkGjZoJth51BS057BSBMCZA2LFESzROl7QhMZchyfoIxrpoy+cFlKQ5NEB4XA5mIFWfa41AN+P4f47mZTB64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 18:58:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 18:58:56 +0000
Message-ID: <932c5a33-c12f-4684-a642-0e4ec5049d1f@amd.com>
Date: Tue, 5 Nov 2024 12:58:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/13] platform/x86/amd/pmc: Use ARRAY_SIZE() to fill
 num_ips information
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
 <20241105173637.733589-11-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241105173637.733589-11-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: df7e219e-4f0a-4df4-cfd2-08dcfdcbe614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHZzQS8vV0lJT3Z2MmRRcEMrTWc3NENSNzYwRjhMWHhPdVdkWGhGZlB1ZzV4?=
 =?utf-8?B?VDZUZlFRQnAwN0JmeEl6OFZyUlBGZ1lVZkNTZ2Q1STV6MHNCekNHUUZWU1V6?=
 =?utf-8?B?SC9SSXg0VnNodjhENUdNQStXN0RTZVJrUWUra2dpN25ncVJvbDlFakNWV3pV?=
 =?utf-8?B?MVJReVpUVVhXWlJhMDF1emR4bnZzdTFzbVk5MUZKN0YvbHdRN0ViT2pTUWVX?=
 =?utf-8?B?SnVPU2YyTzdJU25Pa1BjREhLd1ZqeVlWUXhObVZWQk84RHMwTzBCaXJ5ZENl?=
 =?utf-8?B?TlQzNDYzYnRFSWloK3NsUGxvNzB6dVhBeXhxSGdDbTBaYzcyN2Yvd2pmMlp5?=
 =?utf-8?B?Zkcxck5iQWZKdENQRlNiK1pycDZBdjFac0h3ZnJtNHlHbFhtTkFHeDBPQkVk?=
 =?utf-8?B?ekE2Q2lyY1FKUzQ4TWdoa2NQb3JSMzIvdGhVRXRuM3dOQ2hzVGJ6eVk0VVA0?=
 =?utf-8?B?YVlvNUtTajh3K0tIdWVrcit6ejQranQ5WklCZ0krVEJndlNkeGExTlg5Mmor?=
 =?utf-8?B?RWt4OWJmbTZaUVl0aEw2R20xTGl3ZTV4L1dYd3o5OWxCQTIzZ3Z2RElkUHBn?=
 =?utf-8?B?SHBUUFdkeU9GWW9yNG1MRlk0c2ZJZlZQa3kvN0lBaHBkbHJEK0xxWXllTktK?=
 =?utf-8?B?dFB4bUlmcjhWalJKc1VXUFJHN1JMV2hHOW5MTGVORGV0Y3Bqd3VzL09ZNTQw?=
 =?utf-8?B?aWZTUGNKOGU2S3VCbUoyd3VlUVRFUGlqZkgzYlVsT1pEOFFvRUhIZGpCT01k?=
 =?utf-8?B?cHZobkFkZ0dNcyt4NnRsVVpxOFhYQm5MUWJFMmdMMmpHYmtaY1UyM0dYZUNY?=
 =?utf-8?B?M20raVhOZzFkcUtFODQyK2RCVEIycVFFbUFNVTg0RkM1UkMxVHptVzBudUJW?=
 =?utf-8?B?NjFuWGVPeC9BZlptaExZUXpzU2t2NDVGWW5XOXVEejFaem1kbXROR2FwYUtP?=
 =?utf-8?B?UmJnSVhsdDFBaldGS0R5a3pCUUVMQlIwOC94QWNZdWg3SDNjdW0ybWJidkVR?=
 =?utf-8?B?R3g3ajJwTXJ6ejdpVVE2Z3UxTXROS0tvS2ZLQ0VjRlpzSlcrUGZYV3oza1hX?=
 =?utf-8?B?QXViWDVGN3ppTENVSWthTFlvdS9Xc0xvWGlIc3hEeVg2OEhaVWRkdEdVSkFT?=
 =?utf-8?B?L0VOKzlaWUxSeXozbkE0YllBeXAwbFhMQlB5OFJtTUVLMmpkZ2dGN29NbWJL?=
 =?utf-8?B?TEVKOUNjTDI1YWVPOWVyTFg1ZjRrd3drVkxqZ2d4RFNXNGt3MVRWU3hvelVz?=
 =?utf-8?B?Z1ViOHhJcEUvWW1ad2dULzBEbUFYbzNhV3E1SlI3TFVtbTQwVVpJUWtIQ1ha?=
 =?utf-8?B?SC95Qk5DZFBOMHRCWW52SWo1SkwxcnRGbmd4SWw1TkoxazhOR2c3SXFEdGFG?=
 =?utf-8?B?Qk1zYW9NTWlIUUhqa2h1KzNKU2JBNWVnekVMK3ExMTc2dEdscVVZa3dNYkdh?=
 =?utf-8?B?QVBaUkMyWnFOLys4Y290Wi8rNTlhbmczZTFNMjExaWdKa3ZPbFF6L0xkWk1q?=
 =?utf-8?B?WkZsZDM1OTJzQURZNkdacHljRS8vd0pmRGZWQzlJUEhLOGQxSy9PdGsrcU9h?=
 =?utf-8?B?aEFSbWpvengxNkJDZ1BpM2YwU0dKODA3Zk1ydE5ZU1JWYVROY1QxMjVYU2JX?=
 =?utf-8?B?VXVXYWd1emtOZ1RpQjBRZ09SditwbkRpcFBUd1lsV240d0gvYTQxTVpGaTF0?=
 =?utf-8?B?SnVKNVRTNThVeFJra2lvOXl0U0Q5RzV0cjlTK013L0ZRRG00TGZQOHpuM1Yz?=
 =?utf-8?Q?WoBWaofO/q3EW8fLRxs7Sq/Eaz0NqMbyE7MzZoA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVk4OUUvYXRCMXhnMHBJUzdpQWNMeWFKOVpWekkvWWdFZExzWXhtbDIxc0E2?=
 =?utf-8?B?MDd5NHZ3N3ZjVHlLc3RxcnBsU2JrcHY2Mml6MHZhVHV3RXhHUFN0OWRkb212?=
 =?utf-8?B?ZHBKNW5oNkZMUE5TdHpNL29FWk9PK05oWVlNVEVTamxtNUF6NWhqRnk5TEIz?=
 =?utf-8?B?QjBjWXNvK0JpbmVKRXc3ZFJEeEh6NC9sRUd5L3RtZzlhcWZrU1ZVWVZxVGl4?=
 =?utf-8?B?QlZza1dhcWJCT2NrOGs4ZTEwaitOS3o4b3hndTVhbXQ5VVdsWk9SZ3hkOExN?=
 =?utf-8?B?K2FMNGZnTklNckJyQ1J5blVYR09MaFlvQU5vbmNmb1ZPQjV3YWI1VTgwN1Br?=
 =?utf-8?B?U3d5d0UyMERQcDM2TEppSkNsSHBVTnJ0QkZ5aEF1YWNQUUhiOHVITkFvR1NF?=
 =?utf-8?B?S2tpUUpQMTc1OERROGVzVG9KU1pCZ2RzQUNHYm1NZHNuK3JsVUF5NGdORS8w?=
 =?utf-8?B?OW05dnFURElqYmx0amZDZjBOOFluTGtEVmNGZkNtYlIzVE9tNGh0YUhmVXBX?=
 =?utf-8?B?alhtS1BvTHVlTFFwRGlWNTFYS1kyVUNhOEtuakVtb0Y2cElGUENXdkdETDh6?=
 =?utf-8?B?d25SUmQ2OGpiUGVOZys3UUlCQU1aYngwZTlGZmIwRkVsbTRoVkppMzNRUmVw?=
 =?utf-8?B?ZS9lUGZCcDJrVlJ1alZFU2N1YTZENlVVQkFkZG5aWVJObDlLNG9EaldrQXM1?=
 =?utf-8?B?aXpwaVVTZE1xMDMrdlU3V2F1K2xnOWZKb2ZORE9XRjE1TWhTT2N2T1hzVlZC?=
 =?utf-8?B?TmEyS1Q5T0JkdmRkS0ViSnhNazNmdStuL1pnaXlYeTQ2MlgzVkdub2RRdVNt?=
 =?utf-8?B?THB4cEpjbHFFWXJsS1ozRHBDV2xJMmpLcCtRMEhlRDMrYWZhK1FvRlozRGR0?=
 =?utf-8?B?UE9rVHk1bVFpYnNPc0lVbU5Hemg4QXJmaVBXNkFPeWVMMUVUTXpVbTNEdTNi?=
 =?utf-8?B?RXZIYVY3K3prWDBxMmlUazFCWjJJSWZzVmU3Tm1mUE9qUlk2dVB4MTlPN1Rw?=
 =?utf-8?B?ZTVma1dnNm1NMXVmRWZIcWNCdjBHUkZ0RkJ3M3QvcmVCeWl1S0ZMckw3Mkpa?=
 =?utf-8?B?MFJRNnVJbmFZMHVqWGpSYlQ2R2FOLzY2RHdwVlFOK1VwblR5Z2paUWk4cmRI?=
 =?utf-8?B?RGFuNmN1ODJDOGN0MWNLSEo4dlZ5SnlqRGErVjdzekxyVFBlUXVxdHJJUWlO?=
 =?utf-8?B?UkJJQ09maTBCVkR1ZUQxM09kS0xxZjI2Q0NKL29jbmxQLzhSQk9KY0tqblBT?=
 =?utf-8?B?Nm1qdzBUUVFqT3ltVkVKYW91Z1l1WXd0Y25Xb1QwQnh4RmhkR3RqbWFvak9J?=
 =?utf-8?B?ajdxcjVMQzFpcjBwQWV5Z2dxMXJqM0sxQk1CZ01Rb2VMWEFXTkFDOEZXMG5X?=
 =?utf-8?B?R0RBQWtLSFNiKzVzMzBsaURuelROOG40UkM1eG5jM0IwaURmRzNZeU9weklR?=
 =?utf-8?B?NGxtTUZmRzlwVWZNQ1F1LzhBalMva1dpMzhZU2FhMHdBMW9pUGxVTy91Ujdx?=
 =?utf-8?B?eVluRHVOd1BZa2NYRWtkNmpBbnFhU29SbzBxcTFvSUdYVTBONHVCL0tqdVN2?=
 =?utf-8?B?cThUWlE4Yk1nd3lZZTZqWG4rMTlWdmhqSHJMWVhRK0k4MHVKVTZzaERFWDU3?=
 =?utf-8?B?ZFV2NC9pOFFlakc2K3lnRFY0Y3RvM2M5c2lNZE5qQXdmSDRWRlpYa1RJaWZm?=
 =?utf-8?B?WG92Y0czYlh2a3V1V1JTSDZXdStyZmt5SUptZHQxTU5PMGFtVnJ1RnZlQ3lR?=
 =?utf-8?B?czdxVFBObWZsc3pJZVdhVWtEYzJMek8vMHBKQ0ZPR1ZwQWZRTTRONXBLOXV2?=
 =?utf-8?B?MVdSdDcvTjJ3NGwyY3lPR1BEREJsMU44MEgwbm9KekZWRTJrYUZzZFhnaU9t?=
 =?utf-8?B?QWJKY2ExY1BsYjQyL1ljUVpGcGFTZ0ZLWit6cGM2TnY2Wnk5R1JFR0lIV2Rw?=
 =?utf-8?B?Q0k3NDk2MURBaDhyTXhkU2U1UlhVVTAvSENiaFcydHBiZ1RKTmMya1dnaHhz?=
 =?utf-8?B?TTBmbzRNMjlucDYxazQ3U29HRFhnK1RJRVdacS9OZVhTQTB2NUdHL3diZEdV?=
 =?utf-8?B?d2sxNUFoSDFab3VOdSt3NHhLK2N6ZElHSS9yRG5GZmcrN0lCTDB6RitYVWND?=
 =?utf-8?Q?H7YU4dBD8yfisYVi2dJt+pmAj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7e219e-4f0a-4df4-cfd2-08dcfdcbe614
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:58:56.1646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIjLVzRuSBy0+K3uNh1N+yzto/lZFqO8AEXWRsd66L1YlEZgdTYmaUVH7GRpNxtNylpuEdsgkBIeqDCeu/yZjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935

On 11/5/2024 11:36, Shyam Sundar S K wrote:
> Instead of manually specifying num_ips, use ARRAY_SIZE() to set this value
> based on the actual number of elements in the array.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 5ca97712ef44..77f2c6e78139 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -12,6 +12,7 @@
>   
>   #include <asm/amd_nb.h>
>   #include <linux/acpi.h>
> +#include <linux/array_size.h>
>   #include <linux/bitfield.h>
>   #include <linux/bits.h>
>   #include <linux/debugfs.h>
> @@ -120,7 +121,6 @@ static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
>   	{"IPU",         BIT(22)},
>   	{"UMSCH",       BIT(23)},
>   	{"VPE",         BIT(24)},
> -	{}
>   };
>   
>   static const struct amd_pmc_bit_map soc15_ip_blk[] = {
> @@ -146,7 +146,6 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>   	{"IPU",		BIT(19)},
>   	{"UMSCH",	BIT(20)},
>   	{"VPE",		BIT(21)},
> -	{}
>   };
>   
>   static bool disable_workarounds;
> @@ -201,10 +200,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		if (boot_cpu_data.x86_model == 0x70) {
> -			dev->num_ips = 25;
> +			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
>   			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk_v2;
>   		} else {
> -			dev->num_ips = 22;
> +			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
>   			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
>   		}
>   		dev->smu_msg = 0x938;

