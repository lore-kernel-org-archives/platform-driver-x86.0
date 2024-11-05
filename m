Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61E18F2F7
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730801222; cv=fail; b=KgVl+XnHTc6SDZErVTBhrIOajUDmVN0j47+sK9fuSHUBTQ05Y0KSi+M11lwtxCA6d+awZdM4MyTPAhB5AdCGNfcWvwsHypt8Nk0ILsN9VsHv6fmNp7B/voh6/8PWVv778NRrwaWKG4l0CqShHPT8dulzUDuNbR5wcfMsy8fHHpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730801222; c=relaxed/simple;
	bh=NN8jXNCZQu1EaDp5MXxSrAyDAB0d/N3PLFJju2Z5m+o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JEPWhzQPKuPAmUHxpaqwYQD1xDJdFbnQtMv83XlDDKW5t0jNvgGKYllr1SneNdE9N5ddCsFzrdu+9xMhqY1WzfhVI9GhnEkmo8oLa+4iksEfGIUJxXfNRtMh2gy98wX9MdhX5dxeesh7cqyBnbpu8DyUekyEqnp8ZLpa9Wes7Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r817dN5P; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r817dN5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXvxkK4CFK66kINqspKPR8fGQlm+33uOxQCIRPWly1/kpi+q3SesZ1TSXHolcDHN7J0oHfEwR11qumh96+eZPjWYdEjnexKzVR9OWdrb9WNZTs9GrnuDr2R/5tCIzq4pRNhWX3cYS7tqYcfxrDEw9xK/GIArB1gTy+1zDUwTTUI+u4menR4A4MQFd8A9azc7rVY9bB2a15MbDD0Qw0KtaQHGGrxYpg/Lb3ZbPXsbi2Ish7L1Xp8YNuauZvP7TyydaqRTJZJZsnMaheCpUx/ZzKh2oXmjT8Nlh5qPBkq/SGrjEMlRHD2KLdG7U9X+XAS8RRD/0h0aO2Mi/ihC5zX8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6WUG0fZ2is149vIxgya6HHuw9ryvmpdUE25egN5Fdo=;
 b=k80Ax9oXWkEyL8zNymhkBMh6SXFy8bYkcrIYH+UKNFG/60kQ4U+gqpZSt1hQl4xDsj9Z9xSHWx4o0z0TUl35S1qLXZEPJUXVukiK4nbOqJx/kS2qMy0BGzDLN3r5VnUfIhYJXMiqb51BQ+BTK7dLapBzwpPi3RqTPwHR7te/kGhP0uCx7m8QMHhhS+yhWPvYb3gUFsAjOY39NT3u8/x792JV94nj9cfV6aLkaEg66T1AWPxt0Lw1HvtyQ5HhjbETR53uEhYk4JVmVhE3NZ5XbKJQ9BAdtgFTGC3BkuIZ2o+eT6LcHP/n+3NuliSs3Gk12mIrifeuvVYTaReDuU68dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6WUG0fZ2is149vIxgya6HHuw9ryvmpdUE25egN5Fdo=;
 b=r817dN5PLGpb94Q5o0y+Ws6RtXbRrbs+N5jSt1r0h3gOUfc+6VThsA0XikvQ3vqVvp7Fh08NNfnUNCgnUGTXqE1nBJeJTwZ6HwP3uB8VjIybyXAI2nPD0ZRJmMm4YRNSyEBtbhTG6XnhS6HhLskRGgTpSv7jZzWeThdwdjzSANM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB9099.namprd12.prod.outlook.com (2603:10b6:610:1a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 10:06:57 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 10:06:56 +0000
Message-ID: <b16c0599-139c-4d4f-9ede-0a1aa62c036d@amd.com>
Date: Tue, 5 Nov 2024 15:36:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
 <20241029155440.3499273-6-Shyam-sundar.S-k@amd.com>
 <c31b8002-75bc-2d24-7a07-1bb7d8638e85@linux.intel.com>
 <0bae20f4-7e20-4924-af16-df0906624294@amd.com>
 <ce3a3661-86c9-fcd5-94c6-144db5093f9b@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ce3a3661-86c9-fcd5-94c6-144db5093f9b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d221d09-3eaa-45de-9881-08dcfd81948a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cktHQVFsdnRvUWNkQU9XRU1hN3NZWGlxQXAvMUFlZFZtenpObG1tOHhhbUxp?=
 =?utf-8?B?dlBVNTJRYUVIdGVVRkZUTWl2c3VOdjJBaHFWblF1clVFcGM0ZDZlb1VuZWJ4?=
 =?utf-8?B?YzNKR0hEUFVrQnVPRkhQNCtGN3U5NGRhRG9Ha3NWWmEzaVFvMnNHU3M0cHk1?=
 =?utf-8?B?bmhoTnpwMnM0OG1HeU9XM0cvOWVzaEI2OUtFaEp4dGJLVFhTeXFGbnJwb3hj?=
 =?utf-8?B?TTFWQXNqQUwvd1ZPeFRoOXpmNEhyMVBTeFFYMjkwV2R5UHJPVURGeHFuWVJK?=
 =?utf-8?B?RS9RbHB4RHVoU1kwUzR6K2F1Sk5GSUJZdVJ0UmxEWHh1V1hzZW5yc3Nib3pO?=
 =?utf-8?B?N1RtNnJmVXFSNU1OZmlZMjVWa09nVkluL1M4ZVRaNVpxZklNLzZsYnlPVGJs?=
 =?utf-8?B?VWJqMHBET01vTWlxei9BTUVZV0lkTi9hL3RaY2J0elFYWEpLOUlCaXhRU2t3?=
 =?utf-8?B?TnB3OUJaK3lRTEVkRHNvQlNSSW1aQnNDRjF6ak12TTFFS1ZJcURwOUo2OVZ4?=
 =?utf-8?B?VVJrWDhlYnRFOTlhdzlqYWlENzJ6V0N5bUNtNC91aE9OZDFWRGt5bGdlb2RJ?=
 =?utf-8?B?RzkwN2VyZlRZa25ZenJQM0ZKUEFmQTdpVjFSRTV4NjZYRkU1Q01ibk1iRjNC?=
 =?utf-8?B?OGpVbWE1ZUtveXZyN0QxbjA0dDB6ZzBvNHZ5aHcwWWNTOWFRWTNkNlp6YlNS?=
 =?utf-8?B?RFdjZnJReEJqS1E1MlBMVmMzRHVhNWFuMzFLQ29Ma0t5eW9SSWh6TzlnNHFF?=
 =?utf-8?B?czlVOE15TkJ1RExtaVI3ZkxINGlhUTR5bzJ2aFZHNlIyMGFqS21mTGlVRWpT?=
 =?utf-8?B?N1pVV3Q5SmoydnpNd1JSTFdKTU1WcTcxWk5iUHlzZG5ZUXZNVkFRcG5NZXUy?=
 =?utf-8?B?UWpFalFzU1dYOWZvSmZQc0ljTVU3Sjl6STZESksvRVN6clV2VWdtTmpqaTVs?=
 =?utf-8?B?V2tqYzQ1SStzUU1jajVFMEo0M2p0d0ZBdENWMFNQRi84aEJ6VUw0akZjdG94?=
 =?utf-8?B?VEtSeTU4Z2orelFQeGlZWmpXWlAzeVpvTy9oeTlJTStUTjFEOWtESkVLV3FZ?=
 =?utf-8?B?ZUFNOVpkZnVjRVNmRHl4cnlXNHdMc3hWdjlGWHdRVEVYL3BCUWltb0FZYU8z?=
 =?utf-8?B?Ui9ZYzdHM2h2Q2tObUZRL2FwTDNxcHR5SVY1WndMYzB5Ujl1TGNrV1h6TWVZ?=
 =?utf-8?B?TERRVTJsU3VFVWg5LzBPSGUvdzliMTdKWFB1bnRrc01nTkZZNXdXcjY1ZUVw?=
 =?utf-8?B?RTRvL0hBbGtzN1pTbkVNZ1JNamVaZTNZWFE3bjdoSzlscEJMWktJeDJkYlZG?=
 =?utf-8?B?WEdNRFpRMjlRbXdTOC9RTUYwZm0vaWxwYm1hQUo2TGpSOGJQbDBkTzV2eEVC?=
 =?utf-8?B?THFYOEdFNnd5OGhzZ3pLbHQ4QXNFUFZSbU1MWXFpQ1grSnVxSmRqNmVDbU9p?=
 =?utf-8?B?eTcwSlRiKzZpNU1EeEYwTlM1U1drbGYvNXVWUWJ4UzFtV3FaVWt4ZUxtb2hC?=
 =?utf-8?B?ME5qeXRmd2lyM1M5SEZFbUZ2VGptTjczRHp6ZlZmeGlnQ0NtQi81dGxlSTlC?=
 =?utf-8?B?b0JvMTNkUlUwQUIyVG9DWWdPYkRkSkpiOEkxaU4yZGRjTldpZVplU2Y0ZHFL?=
 =?utf-8?B?VlNWZzJRRldTRkR5cHpUQTJmN1FyRmFHdHMvcGlOYmkyYSswRGYybHZLVC8v?=
 =?utf-8?B?eGlSRi9WRHhDb0syYXRsWDMxekJJTjBTWVNLNzBCQ25UclF4aUFGVmxGMERh?=
 =?utf-8?Q?c3ayWRwp8aVK+mCZvQLD665p0i06k08C1r00bnK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2c1dEFIeVN4RU9WTjFISzlaOTJLUzQzTzlFeW9vZjdnQ2dzSmlLUzhQWDVn?=
 =?utf-8?B?bnpBNXRvME5SNC9hZTJsT3ZCVXBYY3B2OHBkMjZUcXRWcHRYZEdFME9XSFli?=
 =?utf-8?B?MUs3MHZCOFRDRlZKVm1hbEVCa0U4eDZUVVRTOExTbm1nbm5HZGtjSUptTWU5?=
 =?utf-8?B?Z3BVRXpOY0Y5d2R5R2tJRmZncG9ZazBxQ21PK1JmRFRhUzZsRzlubmZKNGRH?=
 =?utf-8?B?ZTN5MGxIQ1plbUsvTENjbDV0SThNTDdlQUhWYWpUdlRzU29hdStzanM5WlVm?=
 =?utf-8?B?dzhoSHNiSWVVQmJ3OXlhbjBQNlB1eVRpS0VUd0QySklPb3BrN0xiRHphcGlq?=
 =?utf-8?B?ZjNFMFluRjJtWkJRVHpaT2E5VDVVSTEvSVBEVkoxaTl1eFl6aTh2dFhkT3lD?=
 =?utf-8?B?WU40UmhjVk01TURldTR3aTNZYzFiT1Q0VFlGQjNoRzJ1ekdDQVI2VUtEdEhx?=
 =?utf-8?B?c3Z5ZFlXY1Vlb2ZnMFg1MnZQSEVOcnZablRZcXNKRVppWnFSNWxvR3F5QnFr?=
 =?utf-8?B?OTZaUXQrUkNPRzB4Q05oYmhuSDNDY1pmY1VhdVRDZmI3OXR2NlFCL3RYMU1L?=
 =?utf-8?B?dkdyblg1S3dpNFFuSFljNmV4ZXBaa2xBS0hIMUhGU29RWVhBSEk5WHZLcGxh?=
 =?utf-8?B?VTA5L0JKdU94OE1DUDFLa0NxVEg1QmQ4MUUveEFCcWUwbVM5Z2crRmRESW5J?=
 =?utf-8?B?NVpyajRWdy9ZM0loQ2EyckF2MFJXOVU4Ynpnd1YzVjJqN1NJNUk1NS83bk1M?=
 =?utf-8?B?TUVGNTJocnA3MGpENjRNdW9JWnFtQ0xtNlJkRlpxUFg4c1Bpd3JRckRnSW53?=
 =?utf-8?B?M2xWd3ZaRW9zbExPSzJWTGQwYllrVVJwQ2R5Q1llSXZpUlBHOVZEUmk1TmxS?=
 =?utf-8?B?dEpDMENsZ3V4eTVGbDdva0dENnlvS3Fmb0VQYzlkUWZMNGZpVHYvdXJpb2dn?=
 =?utf-8?B?THBwcHJmY3FzTHhkTHdsbmRIYjV4WktZYkhoS3pPVkhjckVrbExZUmxPK1cw?=
 =?utf-8?B?d2dsM0d3WU8vTTN5bWJROXorbjlYMjFlSFRDV1ByK3R2azVOQlhUMm11R0VE?=
 =?utf-8?B?MmsxVjBDdTdPeHJ0azBsRWkxSHY1enNPRWxwMnViSk9QSTMwN3hZKzlzZWhS?=
 =?utf-8?B?OFA5V0FrMnIwQkFjWUZ0TU1FT2NXWFdsU2JxSGZ5VC9LRnJ5YlFlcnNNU3c5?=
 =?utf-8?B?dWNWS3VJWkltOURjK2JBa2ovVzVBM3B1VmF2eUZhMnloaXlOZ29KVkEyN0hz?=
 =?utf-8?B?UGNhaHhJM0NjQUwxRjlZbWpiYnhyRWVWWWx6Y3A5RzJndHhtMXdMRmMrdnc4?=
 =?utf-8?B?eW1ta3I3ZEc4U1dkaThzdzJTYnpzdTViWnpISUZRMUhTUGJYSlNjVWp2WHB6?=
 =?utf-8?B?emU3QzIzazdHeE1FZTVkMkZVSXNjVjJHSmIrbzIzQkNYVXQ1eVlWSkg5MW90?=
 =?utf-8?B?empsL00rU1pvZ1liVkhGUWVTWElTcW1zMEhCN0xvZ0JtK0tMSE9UZFl3RWZO?=
 =?utf-8?B?ejFMY1RTUnlDVnREMHpYZ0wvNnNWdEdOK1FzVUNVYzUvaG4xZWo5c1VzcFBq?=
 =?utf-8?B?Skl2aGllVC9sT1BLYmJNdDlsd3BDcmhGdkx0cUpKb0RwN3VNdjJGUStIN0hl?=
 =?utf-8?B?L2ptdVF4R3creFR3OXlSMFcySnFqMGVMeTR3L0NIRWRGZHpwTjRsTFhuWlNG?=
 =?utf-8?B?T0N6TmdaSmJnVHVPckJOaHRQU3ptRTBFaEJ3eWRUMmdWUklGUU1ZQ1N0NmJH?=
 =?utf-8?B?d2dNUDZlcUI1L1IxNitObFhENzlmdWVyRzBNa3NtSFJ0b2IzSVJrdUVqRzdB?=
 =?utf-8?B?QytiNlZXbUg5ek8rb0taV0hjN0hpWGFyYXpGZ2JkRnppMnRqU2c4bFJRMkZs?=
 =?utf-8?B?RVlsV20rbmNVM21sQjZOVkxXK2w3NUw3WUsyTjNIMmVhcHNDaWZ5bmdRNVJi?=
 =?utf-8?B?RGRCVEZSWDY5aXhPOVhzRGFhYXB5a2JsSzZ3T3ZIWlVCZUFoYnQxbXVubjBi?=
 =?utf-8?B?UEtXanZpTzRKdTk5bkZUVUZMcmNFR1FlL21KUURrTHhQNmNRSG92bVRsL3Z2?=
 =?utf-8?B?V0Nzb1Y2VldLcjlWbm5ETTc2NVVmMmphVW8ycXkwaWswU1RuWjJwb2NOK1Fj?=
 =?utf-8?Q?vHhyIk464j/gmjj/nUuwKtLfr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d221d09-3eaa-45de-9881-08dcfd81948a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 10:06:56.7608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nli4EBAVga/kWyche2karkV4KDUFyMiglz8t4bumK7PfEJ2cvYE3r3JC2zI11byiR4korLySWVXZGobH7a2oSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9099



On 11/5/2024 15:29, Ilpo Järvinen wrote:
> On Tue, 5 Nov 2024, Shyam Sundar S K wrote:
>> On 11/1/2024 17:34, Ilpo Järvinen wrote:
>>> On Tue, 29 Oct 2024, Shyam Sundar S K wrote:
>>>
>>>> The latest AMD processors include additional IP blocks that must be turned
>>>> off before transitioning to low power. PMFW provides an interface to
>>>> retrieve debug information from each IP block, which is useful for
>>>> diagnosing issues if the system fails to enter or exit low power states,
>>>> or for profiling which IP block takes more time. Add support for using
>>>> this information within the driver.
>>>>
>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>  drivers/platform/x86/amd/pmc/pmc.c | 42 ++++++++++++++++++++++++++++--
>>>>  1 file changed, 40 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>>> index f9900a03391a..0bf4065153da 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>> @@ -95,6 +95,35 @@ struct amd_pmc_bit_map {
>>>>  	u32 bit_mask;
>>>>  };
>>>>  
>>>> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
>>>> +	{"DISPLAY",     BIT(0)},
>>>> +	{"CPU",         BIT(1)},
>>>> +	{"GFX",         BIT(2)},
>>>> +	{"VDD",         BIT(3)},
>>>> +	{"VDD_CCX",     BIT(4)},
>>>> +	{"ACP",         BIT(5)},
>>>> +	{"VCN_0",       BIT(6)},
>>>> +	{"VCN_1",       BIT(7)},
>>>> +	{"ISP",         BIT(8)},
>>>> +	{"NBIO",        BIT(9)},
>>>> +	{"DF",          BIT(10)},
>>>> +	{"USB3_0",      BIT(11)},
>>>> +	{"USB3_1",      BIT(12)},
>>>> +	{"LAPIC",       BIT(13)},
>>>> +	{"USB3_2",      BIT(14)},
>>>> +	{"USB4_RT0",	BIT(15)},
>>>> +	{"USB4_RT1",	BIT(16)},
>>>> +	{"USB4_0",      BIT(17)},
>>>> +	{"USB4_1",      BIT(18)},
>>>> +	{"MPM",         BIT(19)},
>>>> +	{"JPEG_0",      BIT(20)},
>>>> +	{"JPEG_1",      BIT(21)},
>>>> +	{"IPU",         BIT(22)},
>>>> +	{"UMSCH",       BIT(23)},
>>>> +	{"VPE",         BIT(24)},
>>>> +	{}
>>>> +};
>>>> +
>>>>  static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>>>>  	{"DISPLAY",	BIT(0)},
>>>>  	{"CPU",		BIT(1)},
>>>> @@ -170,7 +199,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>>>  		break;
>>>>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>>>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>> -		dev->num_ips = 22;
>>>> +		if (boot_cpu_data.x86_model == 0x70)
>>>> +			dev->num_ips = 25;
>>>> +		else
>>>> +			dev->num_ips = 22;
>>>
>>> Could these use ARRAY_SIZE()? They're related to that array, aren't they?
>>
>> Yes, they are. ARRAY_SIZE() does return the number of elements in the
>> array but there is a catch,
>>
>> both soc15_ip_blk[] and soc15_ip_blk_v2[] have a last empty element,
>> so when ARRAY_SIZE() is used we end up getting n+1 element (i.e along
>> with the last empty element). So, what would you advise?
>>
>> 1) remove the last empty element in the array? i.e. something like this?
>>
>> static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
>> 	{"DISPLAY",     BIT(0)},
>> 	...
>> 	{"VPE",         BIT(24)},
>> -   {} /* remove this */
>> };
>>
>> 2) or just do, `ARRAY_SIZE() - 1` so that we don't need to touch the
>> existing soc15_ip_blk[] and soc15_ip_blk_v2[].
> 
> The iteration seems to always ->num_ips based so the terminator seems 
> superfluous. The cases with smaller num_ips cannot use terminator anyway 
> as they share the larger array.
> 
> I propose you make a separate change out removing the terminator and 
> migrating to use ARRAY_SIZE() in the existing code, don't forget to add 
> the #include for it. Then add just this new thing in this patch.
> 

Sure. Will do it.

Thanks,
Shyam
