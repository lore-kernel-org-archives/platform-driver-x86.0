Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235231C9454
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Aug 2024 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724331632; cv=fail; b=OioY+oO6Jj5LCdtYumsdUnt8kV/sla72E2/k7n291YH/oOiquO+SSyrumbVGWhJUWJdhVBMUhy21em+BvF3pmicG++tgbC60Tx3FNAF6AWNiPWDRn9n7T5ZHQ6F2qzmxh1eSF8SuLxfVoZoHZnqOn3MZCGKu2+XF3K3aT2Le0PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724331632; c=relaxed/simple;
	bh=d+Z6UGHfyavywV0ArT61PxzokIDT80HlaMcZ04VvC/o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PEpGYTJiU9fiZWz10Xkp8d98BuAUvFdDb2pKZoPA59qbSk5iXrASrcrbjm+fT+LxsS7JNsabKuyA+qdwawgdsISdD6T20qwlGTqyWq4sDFPVL6gFLjIFLhzMN1euTJnokBR/Jbuf8XTmsUe3MmcJzWp+nRNR7GpZtBVHnqLCpvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KHVoJe9J; arc=fail smtp.client-ip=40.107.244.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KHVoJe9J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kp9I9xwVkhukhc8CBv9Vh7EAbhTcFvXU9oUtELy/RhYRhJFzVi17hpY8Zxw1hrbAkW8VS2KSRrwroT7wb+8sQTVUICvitOJGrak9bFA/Ai1frrYBoCklDFkf41CO1L8PcNyzBZqUV4nIlW1ljUJtZ7PlCdyCbLCegauWcehS2Yq2/9ndEB8U84XPShxKrTN2dDtIMrRRTkMtKeT8AiRtrB2L8wmQU1GNHGxaueXnwzm5JLp6BvNXcUAQZIRc9YriKHFJ0RWib7BOSlPsSPPdrwdjxQGSVBTOizRkW9A2c+y6/HrbFPUU2VyHciwuWHp598HOHBtQNCipgvUlBDf2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz9MwIVZEogpL8s5SWKd/Kcp5pWub9oca4/6gq2YCXY=;
 b=rLNNlI8aIzuHQWu/xyoMYn98AkAfnPWRiSJCWJk170mgoFCdYMCE/OclILvDkHe5QA1py/ILvMin4AmODoyLa0cq27GA666/DYXkluq2Sb5UoabQjpXyKHJ3gbrjQ+VcO2dwQLncIU1zECk7XBrud8iFtWrfvXOIKoUlwL8a88UFoT20MiIwyHQ7woL2NadjQ4YPmqFZWPx+ImCqRUGpOIhZ4dsW0GJs9ZWHLJ0WwTHCC0AtesjbZKjO74GIcVmqps0RLboMgwQLJOCwyx9r/TvlL8HfIugcsUG8uYtaJOjQfzJDdJrXieqrb4EwsYyxhcctINqUFBa7jLFprHAN8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz9MwIVZEogpL8s5SWKd/Kcp5pWub9oca4/6gq2YCXY=;
 b=KHVoJe9JNQdd/+RIlX2qCAmfEkYIwjnx0DDpsNalOiZJ1Q6ga0Vh+CQCa4TPuJKqavlgESTWlZlaTZLadCs9e4x5cdeDa0BoDUN/qsaYuAsauCBKcQxvh16Ybh62d27FQaql840DTmGcmsXHwfAGTT4P4IWYR+u6AYQ5Or7+VLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8901.namprd12.prod.outlook.com (2603:10b6:610:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 13:00:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Thu, 22 Aug 2024
 13:00:27 +0000
Message-ID: <3b76d234-3f90-4241-8b52-0fe20518b75c@amd.com>
Date: Thu, 22 Aug 2024 08:00:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmc: Extend support for PMC
 features on new AMD platform
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
 <20240822095357.395808-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240822095357.395808-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:806:a7::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ea4743-d930-490e-ffd1-08dcc2aa64dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2xnNHFDc01sN0RyN0dnMnZaWEdIaVhGYmVCSVgzdXhRQnJMTTk1dnNyOXpX?=
 =?utf-8?B?Vm5mZlBYUzFCT0dyNGZud3Z0MCs0Z0JVVjlON3ZTTStpVHd0NHJJbjc5Z0Jn?=
 =?utf-8?B?M3l6S1Z5dG0vV1pMZnYxa1FiN2RHVnNtODE2L1Jpb3RnZWRHbm4rMzExU0px?=
 =?utf-8?B?RFJ6MnYrb2hhZlgrcmVyZTJBR3ZhK2tKem8zcHBMa3RDQmdacGJXN3BaYXJp?=
 =?utf-8?B?WGU5Y1NkeERWd2tBTTdtTHZpRkNXN0tSa1g4SU43SlZyQmJSdzM1bTZMbkVz?=
 =?utf-8?B?YXk2UkxMd3Z4OWdDenR2dUZHa0V1QlJxUEY5aTBiZkI5cjByT05SZ2g2clJJ?=
 =?utf-8?B?cVNmR1l2L0Nua250MmYxcVo4bTBYSE0xdnB2cnJrSThGSGdKaUVMZllKUVg2?=
 =?utf-8?B?aENMeWR5UkNwSzRNaVlZY0VVOVhGS0tuMHdOVlpDd0d5YnpZVGM5OXRSYWg0?=
 =?utf-8?B?a2RnTStVSWJaa2JhcmRqNGc2cmZzZGs2VWdTalBlZEtBSTcrRnV4SWlpL2xK?=
 =?utf-8?B?aUd6ZlN5VmlqYVhFbU00aEt1bXFVMHVIVWNKaGVnSVA2UXF5QjJwcjY5dHhE?=
 =?utf-8?B?eE9iV0M5NmF1bkp6VFp6YWhKd05LdnZHT1JaSGZ1cjVFQVpVSFc5MEg1WkdF?=
 =?utf-8?B?U09NZ2VucjBIVjluK2ZnaGV4dUNxejZ6aXZGTWJsQUVnYzh3cVVyNlVPdStw?=
 =?utf-8?B?UEZNN1NwK1cveldncGovWDB2MHhyK0VJVG1CNjBzRXZsZERaOFhSVFZycFU3?=
 =?utf-8?B?d05QbGpzM1IvR1ZwaHBnNFhMMUdmT2szcVl3OFZLaiszMlhlUERIMmtTS2dh?=
 =?utf-8?B?MGpWM2gwQ3FhUTR5NmdZZTd3N1p6dThsUWRoUUd1aEFGRm5tTG0ySWl4a3B1?=
 =?utf-8?B?d0J0cVQzaFlkY1BEVUg1YkJGWThZeHd1cEd5SXFXdzA2K3pKRW5qeUhVMlRp?=
 =?utf-8?B?WWk2QnBhamh5bU8vYXVwaks4eE9pLys5Q2EybjZLTEJPY0lQdTM1bjh0Z2Rq?=
 =?utf-8?B?ejd1aVJVT3JGNDRKbUR0a0Rldk1UdUlEZEc5dHFGT2g0bXdiODdaM2EwcVpF?=
 =?utf-8?B?NG9JaHk3aE9Ndzk1Wk9RRkRhdkhIZ3dDWkZCQjQyZHZNVkdQV3lJK1ZaUzRr?=
 =?utf-8?B?a2lhbHpkNXZlazFNUFZ4dnlTQ2l3WnM0aXFzUEQ5SFFYVkg0dCtNY3lBOW9m?=
 =?utf-8?B?VC9keGpybkNjQnNDY0l1cWdXaCt5MEl4QVhXckUzY25oRXlYczMzYTJIZm5Q?=
 =?utf-8?B?c1Zocm5CKzhuWUZ2UmRSR2hCTVo1b0FxTmgzVWZ3L2hiVjBTN3R1UVRwc292?=
 =?utf-8?B?YVJCMEo4Z1VoSXEwTHdwUFJPNG9QVmxqVGZHeER5TXBLYWJYdXBJZko5Y1Bx?=
 =?utf-8?B?NkxJSzlQd3lLSzZaM0ptUVZHT0VBb1BoMUpneVg4am93MGZ5SCthNFdwbEtH?=
 =?utf-8?B?cGZpTEtzNnBIV2FNVTFINmRTcmQwNDJNWjdITkMyNG9GZ2JEd04zZkhmZkVC?=
 =?utf-8?B?NlpEQ3g5eXV5NlVTOVhOWHhPUEtBV05TYWE3SFJCejArd0l0dUs5QmJKNHlF?=
 =?utf-8?B?SU1hbEhWZFU2ZkFkTUVPUmxBdC90eExFTzdOZUh4MVVIcDBybXI1ellTanNS?=
 =?utf-8?B?WU9TcEl5OWVMN2llczJVajEzdlV0QUlTSWZkTlBCUHM5amYyR0I4V1NEVW0w?=
 =?utf-8?B?VVBPbnF4SEtGNkdxUk96dXlNaDlhckhiOHovTmNVMS9HY09DWisrQzdUbnFp?=
 =?utf-8?B?eC8vcVNpZGE1eFJjMnpRV2ltckNTNXJnZHNndXNWTDdWWW5idG9ZRmVvRyt4?=
 =?utf-8?B?VDgxczdwWUJpWmlxbGlUQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUxFSlNDaWNrUlpPbTg0ZnVBeTlWOXpuL1E4WUdwcXpHMTZIdFgyNXFBdko2?=
 =?utf-8?B?NkpPczc4L3Z6Q29jMnhkZ3ovNHowNHBDS0FkSlBSc3k2a0lnaGhnUlA5czd0?=
 =?utf-8?B?cVBiNG5rWUdxblpwN1BTQnNrcGp3NXdPRHZPalM2SXZZaEVmdjRrUS9rSms1?=
 =?utf-8?B?NHFCejRBdE40RUROSGpoeHZIYk1mdm5hV3dVaGV0dWMrMU0xZWZrd1h4V3FW?=
 =?utf-8?B?bGlMQ0hBNWVBUmdKc0RsZjVQSzNsUDFHckxPMUw0Y2cyc1lVN1hIbHZwcytL?=
 =?utf-8?B?V2lhRXFsankzQThTb2R6WnI3WjR3d1VGOHlSMm9RUWlkQlpYRXJWaFJBV1hI?=
 =?utf-8?B?dm1WNzNCSVJjQjhaektpWWRhKzd0OFNhYmpCd1dKOUZMby8yZ0wvVk80YWIv?=
 =?utf-8?B?eUxVSnNhTkE5SHg1elExQ1J2OG5Wak5kZjVzWU5PQVNrQzd3SGxnL1RXdHF3?=
 =?utf-8?B?b1FVNnhlWEtxN0ZLRW4ydWx0SlJqS2RLZGhFalZvQkpjOGMvNEdQQ0dPUENi?=
 =?utf-8?B?QkRINmlORjdlSWRUaEhnMzBwei9uQ01ERzEwOVdRMms2M2NTUEpzdmlkMHZG?=
 =?utf-8?B?aHRWZDAvc2d6TXNiV0FlaElMRlN0Ynp3eDkrYXVNL3dCZ2dYdWoyZFBRRStx?=
 =?utf-8?B?K3VRdWpEcWdmckcrNmlJSkVJVDNYa0hVQVgxaFdRbjZieDN1SW9qWmREMTl1?=
 =?utf-8?B?OVc2YTlDMWZTZlRkc001cXI3ZnZlU2FoYytwZFhrcWN0RHVPVEk5cktGNWpk?=
 =?utf-8?B?Z2ZEUmZISURQWERsOE8xK0dEOENPVGcyT3lvc2FKeVc4UW9VS3VWR1NqK1Vp?=
 =?utf-8?B?b3hGYTVuRTRIU3R6Nkt2QVNLSGpmZ2VFMEQ1RDUzbTBSdTU4N1pzcENPQlph?=
 =?utf-8?B?VUhFN0ZXN1h6R1F4Ti9NbEhNTW05WW1xcUl0N0J5OHFyN3Q5a3ZOV1hZQk1Z?=
 =?utf-8?B?eWl3RSt6WkZSb3h3ZGIrWXYzVHkvSTZ3b21GVmo2OU1WR2VKanM3Sm03eU1K?=
 =?utf-8?B?SHRrQVFHMWpxZEkyVmdyQmxKc2J2MnhOR0lBNVF6MFNJcUhJRUozZWFxZzlE?=
 =?utf-8?B?QmF6MzBIR2NIK2tZTkF0cS9wUU5FUVpLRXF6dk9TRWJjOUh4dkRwTUpjM3Zl?=
 =?utf-8?B?aitrUFFFckNWV2JTQVg5VUNCRlNGK1RDUEhsY09ManlWeWlhYVQ2dXUxSmhH?=
 =?utf-8?B?NlgrNlkvWXJLaGJSVm44Y2o3R1FJWWcweFZWT0k4NnBORHF2aGEybGlZSVZa?=
 =?utf-8?B?dHlYeE94WXRna0RScnJDWG9HWjVNNG03VHVna1VhdHlVZHk1YWNhYjkwZ3FJ?=
 =?utf-8?B?Uzd3WklXUWxUQzhUYjg5c1hFeFlKRHJNNThlWWVqVEhNNElqdjE3eWhWVldJ?=
 =?utf-8?B?akZyM1huOVBJY0hEQ2thb3JMTUFIdFJOR3c4bVMyNFlBQ3pLVENwWGtNWnc4?=
 =?utf-8?B?UzRKT3JReFg1QW16YkgwcEdGZUVqUnpKaVZTc21HK1N0Zm5wUS85c2tkVldN?=
 =?utf-8?B?UTc3dGY3VVI1SWxreTg0YmxzYUIvNUVRUzFlZ25xdWYyUnFlVUVLZWthVk1N?=
 =?utf-8?B?S0ptanl2MkE0cVNBandyRFRNSWx5ZUtOeUxnM1ZybVh3MFB6dGttckl2NzE1?=
 =?utf-8?B?ZXN1eE4xbnpFOTBVUVdmYXZqSnlrNFFDWHNsOU1IVTRMdkpHU2JsV1k0UVpX?=
 =?utf-8?B?ek1XNjBCSGpRMWJCK0ZuMVg2UEVZWmxsUkdvQ1poUWFGM2VFSVFoOXNrWWhP?=
 =?utf-8?B?bkcxSk1UNXI4bWdhKzF1dnEvOFZFZUxwSlh6bFA2NG40RTJrZVpwempudWlP?=
 =?utf-8?B?UVl2M0wrMytwL000bmFNSzFRdk1TM3BkZUlodFdYM1BHSlhBT1RtcWdoa2Mv?=
 =?utf-8?B?TDlWZTNtRlEvbVFBRW51TDBXTjA0bVVGbnBpQkJoN1pJcURVU3NOZ0lhMzhB?=
 =?utf-8?B?dVI1WVUrVXMvb3lHbUJmU2x1MTJZMG1tZFIrdVVjRnBpQ09Qb2RJZW5qUTEr?=
 =?utf-8?B?ZDBTQ0NQNHBiTlNjYkwzVEx4WXpLTjh2a2RRd0ZWZXBUVmY1Z3Jiemt3QXFh?=
 =?utf-8?B?ZVIxMkl5dkszcWRNL0dJalRDVjUwZ3BSTFZpYVdxQXZnMjdBVi9zbERHazJq?=
 =?utf-8?Q?X4jlMhj82f5CQnzKrQioBNmv0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ea4743-d930-490e-ffd1-08dcc2aa64dc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:00:27.3656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghSLgSdSIRQLJfC1SaaU9WcXJN3fs71a41/NJJQ76d7t2AqyescXAhGzLNQzQ9Yeq6o/0cvxrInuV+LM76fL+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8901

On 8/22/2024 04:53, Shyam Sundar S K wrote:
> PMC driver has capability to get the idle mask values and STB data from
> the PMFW. Extend this support to the platforms that belong to family 1Ah
> model 60h series.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2:
>   - No change
> 
>   drivers/platform/x86/amd/pmc/pmc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index f0d389cf1ecb..bbb8edb62e00 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -598,6 +598,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>   		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
>   		break;
>   	default:
> @@ -631,6 +632,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
>   	case AMD_CPU_ID_CB:
>   	case AMD_CPU_ID_PS:
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		return true;
>   	default:
>   		return false;

