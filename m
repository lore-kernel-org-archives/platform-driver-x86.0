Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D58460
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 01:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746582562; cv=fail; b=ntcfXv7N/7WiHR0H7+ed6aDnFIW+NsyuQqB8UFnMOSXaBFFAqoTdwvxj76Y2R07HqK2dJCiSIXzLYH3W2TM8D9UCkvQ1+3FjTv/NtgGusZXnT/B/uVCit6uwVe5+blJaQEBhMxwV6bzbP43R52MawQxp8RaNS77N5hlUFBmJpMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746582562; c=relaxed/simple;
	bh=inV1+m86yvm6ooJD/o4hdZYMFHULS3ABLhGpbBQj0G4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lp/p0osKwKpUt61xO8XMYzphxVb+X/AipZ23vI3uC1alimgYwvGgf3IENkPOC0pf/AA2/DD/qoExYGbSVwLe6PPX65FldkEcDy6l2rZ/WcRBT5Le1U5J1jgy3lfURGkby624HTpQBSaKiC0W10ks/WM0NnZUKEShB8n5xgX/PFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=daXPjSMN; arc=fail smtp.client-ip=40.107.236.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="daXPjSMN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9t3z/1OUdULFiI9QSb9Jk1QuRt1lJtOKxaLEph5QcDmr/cK3BeUgcmjtMB3JP5Ni1EKa6cCs0AhDcT9odd3oneGeePOfN1fK6QPjagdaESSzYFdmVZoPEO3ik6iCilcQvCL75YVDBe3xKznwcjdL+ZOZdEO3iQcIC0yms41raUhE+8oDAude4CiFwFJMbme26nNJvJ/mLuM7sGrrG7x7UZFunDQpq9cp2o4EmuBmF7RqlTHk1C2eRBc9ajwbAzMM2aPbZdz/jnbSxcyyxR+ZJxMUkOCAvlHtzphsZbkU8lOBHLKuNc5mk+eO0krVOP/vL2VdNyNmQGDjKBP4TITVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv1C1SyD1N96o+9+c/QI1JDdwa0gFux88nDEnnopXPw=;
 b=d2OcUDm03yqNQi7ytUKYbdN4x1VqlEURJwYiDX21ZaJV6ZWg57hpUL2PUH3FDboqdYeIchQDjwqa/OyXJyu5FwPTx6i/NOAcO0aVWWOP0OlLaZDSqXA7pPGfLmWYlj3BmZGd005qkWqvOcrVrcOlwhI51o+gMGOfXP6qJlO999Z9agw42G+afYkF6TOAtpOixo46Dy53rB9XeLfPFpcVfMt6Q79JBcljewJFrSE9aE5ac4tJ64LDY711tXjGdsfp/V3/JvGlnyeS6IgOf2lsQlNA/KD52FH/3twq9wvJxj1JPc5bDiGvmbumuv5F6udU8px+5SjGS7Yb4zolneF4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv1C1SyD1N96o+9+c/QI1JDdwa0gFux88nDEnnopXPw=;
 b=daXPjSMNFZV4X6d25LIIFL/2HU2umZ1wZr/6YYSALsO9eM0E8fLiIn0zv4hjfck24j3Z+IC++1C4G4R0ecW8nZ+9KRT8iJl6w/vIYn/4KqzdLpKd+O7JJ5dpd0t0iNZqNfAZ1q11JFR6a+rMvHThm1TQULbaZpd/csYfH6IHhE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8846.namprd12.prod.outlook.com (2603:10b6:a03:549::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 7 May
 2025 01:49:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 01:49:14 +0000
Message-ID: <528c230b-978e-4cb3-9339-0569bcbb16bc@amd.com>
Date: Tue, 6 May 2025 20:49:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/platform/x86/amd: pmf: Fix a double free on
 module unload
To: Mario Limonciello <superm1@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20250506131130.1446262-1-superm1@kernel.org>
 <aBowhD4lwc017-NE@stanley.mountain>
 <fce0ca00-3d0b-48a8-ad97-9125f4297f05@kernel.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <fce0ca00-3d0b-48a8-ad97-9125f4297f05@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:806:f2::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ccc4a65-d9af-4c0d-ba8e-08dd8d095eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFMyMnZITFl3bUs3dTFRdVBjdUltVEdpNkhxclhOd1Q3WFFKWmk0OHJHRW5n?=
 =?utf-8?B?VFNyaDNJc0ljNmdjQ2pnWmVtK25Nb3Zrc3BSanR2VE1mN0VHNFo5ZUtnNEJy?=
 =?utf-8?B?TGg2cFNUWlNxRkNWZXBBL3pzc0o2YnNBck4vQXFRME96SERqd0tWSGtHMXlh?=
 =?utf-8?B?NGQ2TVdQMm5MQVl2SDNUSW84VXVJZFdsalFHeHBUTlQwY0lRNXoxYVRzWWxB?=
 =?utf-8?B?NzNsakluY1gzcGxUK3BJeW90NXZnUm4yVFNaK2xRdm45Y04raG5qRVgwRE5T?=
 =?utf-8?B?RmhGamg2UkJ3Zm15UTVKdWlkV2tzRnc3dWZqdGY5OG9TV1d0bzdENFFYbGtB?=
 =?utf-8?B?cmFqeE9OaHNYdlhWL2ZYR0FWY3JSdG1SZTZDVWJaNEkwRU1aN3NkNkdoV0Iv?=
 =?utf-8?B?M0hmV3dib2dRb01FYUJOMTg2NGJCNnVsVHE5cDlWTXQ1WXVpUFRocmQ5RXo2?=
 =?utf-8?B?dUkwNFlYUk4zYktBS2lMZWJIZy94dXU2Wnl3WjlYcExJNVNMS3N3bmt5K0xs?=
 =?utf-8?B?U29hb1FsQ0YwUUROUytDdi8waldCeWtDbzk3KzRCakVzRGZCdVpWdHM4Vktz?=
 =?utf-8?B?anVsY3h1UHFlNEtzV0xQbmo0cWNEZ0h2aDNpNnhybGhzUk5uYnUzdk5xdEN4?=
 =?utf-8?B?YllORFRYQXk5bXRwY2hlT3RRa0tTbU0vYmMyaktVS1FnMVZ4aVorNGV6aUta?=
 =?utf-8?B?NUUvRXMrZmRMNVlCNzNkT0F1amx6bkZhenprdXQ2eXFFeFo4RENpbVB6UXpq?=
 =?utf-8?B?UXN5Q3BYQXVzYTRIb0RSZnhsS2NtajdzV2VaU2dLN1dGKzRIS1hlWlZ3Nnly?=
 =?utf-8?B?ampna0UzY2RtWG9jaXR3a0xvcTdEbXNXeVNtbTFHdTZYVWRuRGl2QnhYc2sv?=
 =?utf-8?B?ai9IdEdRSkRmeFFNTTFYdjFtUnBTakl4UnBlcXpDOGF5QzB5S2ZXLzV2T3Fk?=
 =?utf-8?B?RUV5WTNkSlVIck9oR1NNUXFTMFd2OTBYNmViUzZ6dWF5cDhrbjE5TEI1U1dM?=
 =?utf-8?B?T1AxQ1dxL3RzT2lOV1plbDBBbi9GZ2t0RFludlpKZDJpOG9rUEhscThlY1U0?=
 =?utf-8?B?OG42NzFCSndIRUtoMXhYT1RPQXdGdWk1a1JPK1h3UExHWXgwcUtVOHZCNmVk?=
 =?utf-8?B?dE1tQXZhQ09CR2lZT0dvRnExKytVcHBrNThoemttMGdtcnhGbDJIQzNzNVZ5?=
 =?utf-8?B?eVlSRHM5QkZ3cGo0cStUOW9wN3NhS0ZjdE53MHhFZHRQZUJIVXFRYlpwMGl2?=
 =?utf-8?B?OU1TcncvSFB3d3F2NWNpcWc1YkxXdlVnOWtxWmpBNWhteVRERE5xQ2Zib3FY?=
 =?utf-8?B?bElZcURXeS9tL3hOcGU5UVdKK3lRWVREN0Z1cG9vSE1KOVp5Z0dVY1VVbXZT?=
 =?utf-8?B?OEpESnRiVlQyZ1dzMGUzSm9BZlpqSzF0aUNjemc0RVVPS2dJLy8yY2lFT1Vh?=
 =?utf-8?B?K3NCb2t0T1Q1RUpubUZNdUtpUlpJWlJmSUlXRlVIZWZLTndWb1Q1NlA4dWJx?=
 =?utf-8?B?bjhpUnBUcUI2azVZUDJGWno5YkVrNktnNnlvaGhhQTE1Q1JCbXVUblRNVWFD?=
 =?utf-8?B?blFhNXp1eFpvSGF2UjdxSFloYlluWkJHSk5idjB1aUpFZFZ1QkIyeTRlMXFr?=
 =?utf-8?B?YWVINVNoeVBrcndjQ0FIb0RLelZweU0xdW5wNVdHWnNWTURYTmE4VDFqVTBj?=
 =?utf-8?B?Q2psM0V5YnFZTnhjeTJhb00rUkM3RXpjNFkvSnh0WWliN3g4NlhXTGhxQzNn?=
 =?utf-8?B?MUl2K1N4N0kva245eG9yeEluam1lOVNSRXNsNDVKRjlKeWtGaFRBSkJ6bENT?=
 =?utf-8?B?SkRwRS9vVG5zbStwcGRCMjhNL1U4ZFFyMS92Z0FZYXhIUWdYbFJUYTY3S0R3?=
 =?utf-8?B?SDlyQWc0dUJHZ2MrSk0xZndCNGtiRXhVVTNZNVY4VG9MN2llcHhEbkoyamY3?=
 =?utf-8?Q?HfWtc7zJojU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHY4cjdma2daS2xWU1BrM3FaRmZ2Nm4zd3FWL2FJT0VmallEdytkR1Y0Tkt3?=
 =?utf-8?B?TGFjZDEwYzNYdHNDTW1DWDJTSGN2bTdiZHpncTBoSG9CL0luYlhod0lxYmVB?=
 =?utf-8?B?VUNKblAxR2YzOFRTMFlYNUZncWxwRWhEUEt2V2IvVnRGR3J1aHBsVm1aZU1J?=
 =?utf-8?B?UWdJNFMvdlNERVlQTG5ka2p4d2plbkVWNEdKWmZZMG10Uk8rblR2STVaMUNT?=
 =?utf-8?B?SVVnVENPYXNKMHVQRlNwamtiNHBnWU5Ocy9LbzZOY3crN2FMV1YvcElqUE1w?=
 =?utf-8?B?amc2aUZlUXJ4aGZBV0liM3ZGbTRuYXJZTElORFZpQjJ2OTk0OGRteXBid3pT?=
 =?utf-8?B?S1FxK3JEWTBySzdPZit3ZnBhMExxb1BYQ3kxOTdXK3puTmhvby83QzJrV1VZ?=
 =?utf-8?B?emY3b21GV081ZzVtRWJUNVRvNlh1TVVoaWNsN0t5cmg4dWhaMFRIMnhQZ2k5?=
 =?utf-8?B?YXRMRnIzL1ZGMnl1dWFTMG1LaTVPMGlrQmhaM2NSVkJnK25HeWZWZXlqUGk0?=
 =?utf-8?B?VDVDY21qT2drbm5lU1hYSjlJQlNkaUp0aUlQM3VZa1pzV2JJb0dDdlVXcFpl?=
 =?utf-8?B?MDUvSXhzMWlJOTBtelV3WUwyK2hWQS9ZejFmVzJSWmI3clhIZ0FiSXNMY3Nn?=
 =?utf-8?B?bFFZVWN2Y3RQMW11MFo2Q2xiOXQvV2NVaUprMURxY21UNHhPQXpnQnI4UUZS?=
 =?utf-8?B?N2ozcjdpOEdnZCt3UVRxME5NUVVLRkZONkVJVmRwcG8rdDF5TnYrbjRUajkx?=
 =?utf-8?B?cit2NVRBVUtkODY5RHFWRnpoOVM0R3RPd1JEeTROZVJ5YmFQMDRDZWtNQk1q?=
 =?utf-8?B?YkNmOEYwWGpwb0ZHM1JHME1LMC80N2dYOEQwYWtOc1hwczFqZEt6c2x4bCtj?=
 =?utf-8?B?WFBNUkt1T1Z2SGZqMlN0V1BHM0s0SEwzaG9hUFJRUzVHYkRKbkpnd1hUK2xn?=
 =?utf-8?B?TEQ0S05wU3dqNDBrZnY3NEdwTUdhK1JNZ3ExeGEveERoVWJqOXA0dnZ1ejZD?=
 =?utf-8?B?UHc0eVYwZFB4WU9vUHNJV0EzTXlHWEpQSWtpL0xBYWJTRmZ0Qmo3M3BIckh2?=
 =?utf-8?B?T0xzOERJVWVFSmY3RmgzSXNmTUsyVHk4SW8xbHZ2eloxeEtwSWdSMXV5TDFp?=
 =?utf-8?B?SjZnb3dycnV1UTRwd3VJZDBqOWgwYWhvWmcrcUoyam16SzVjdmsxY0Z4TE1Z?=
 =?utf-8?B?akg2K2VwZTBlc0NuemFLQkVWN1B0THg1NnRNMTlXcWtMUlg2WHlGY0NBcXpU?=
 =?utf-8?B?SFJlazRKdlNvMklSZEgyT2ZLMkEwOEMwTm9WSkM5cmgzblBCOVNJUmpjN1U2?=
 =?utf-8?B?eTdEenJLY0JBbytiU05RczBRbzl1Yk8wR1ltQ05YT0hnM0tQcS9ib0tmYVdD?=
 =?utf-8?B?aW9BcGVjUWI5K2h2WGFKU3dOYUcxR1BNMy9NNmFLQWRGam5VdXNIVjBZSnhE?=
 =?utf-8?B?aG1vdmVoUWVsZUVXRzYvQ0plOHQ1N2pNcnFVbk5SejJQWi9RU2RBdGFRSTFJ?=
 =?utf-8?B?amljNEFpVVVIaHJ4MWs3UEVaYUYvS2U1bVgyMU4zZzY4TlNNdS9lQThON0pW?=
 =?utf-8?B?SDRCRnhRbC9XMHNXWUpNSWttVFRRL2R3K052bUJsRVliN2U2NTdoVldrWCtH?=
 =?utf-8?B?aWFwZ2lpdTdZTDZpd0owMXdFSjVpVmhXVVNmN2RqUkg1eTlFMjlvWG9IWnRR?=
 =?utf-8?B?Y2NZb1lSNFFteTZsdmFhNE5wRDRpQU00MUhlRkZEZkdmbXJ1aUc0VCtST1ph?=
 =?utf-8?B?ZUZIa0NFSjluZXQyUGRaVFYxRnZvdjBWaTdJTkdnMEZIdVBNZHcxL25WaU8x?=
 =?utf-8?B?ZDY4T1EyU2F2bnV4TGIvYU5XVXhZSFRTeURlbHc5dzY1Mlg5SDdIZEd2MXM3?=
 =?utf-8?B?emk5Y2dVMzB2UHZEcnNxOHpkRmFndlp1bjhzbXpSUHpGbThuaWhmZk1sdjVV?=
 =?utf-8?B?U3BIakx0WWFReG56MklydGhMZE9WNlJUbEdMcER0Ynd3Q21pb2lhSVBuMjJJ?=
 =?utf-8?B?MWxoSUVzMFBBejUxMU5OaDlkVEtCa09DU2wwMEtlcElITlJEVGxVTG5vc3VH?=
 =?utf-8?B?a1J5UCsxNXZUclk2UkxMamN4OVkyZFVSOVRVdUNOa2w1U2p3eW1wVEg4RTF6?=
 =?utf-8?Q?JO3o0f4oytlzEIFxOgrischYv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccc4a65-d9af-4c0d-ba8e-08dd8d095eb1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 01:49:14.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqVI4thPv/vQ1+azEDIHR9yH6tOhouAJGtT9zLf1Oo23HO3+30IZrKgyI4CQqTValO8fqlK1LNVzOjwknfjBUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8846

On 5/6/2025 11:11 AM, Mario Limonciello wrote:
> On 5/6/2025 10:53 AM, Dan Carpenter wrote:
>> On Tue, May 06, 2025 at 08:11:29AM -0500, Mario Limonciello wrote:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> If setting up smart PC fails for any reason then this can lead to
>>> a double free when unloading amd-pmf.  This is because dev->buf was
>>> freed but never set to NULL and is again freed in
>>> amd_pmf_deinit_smart_pc().
>>>
>>> Explicitly set pointers to NULL after freeing them to avoid the
>>> double free.
>>>
>>> Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in 
>>> amd_pmf_init_smart_pc()")
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/platform/x86/amd/pmf/tee-if.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/ 
>>> platform/x86/amd/pmf/tee-if.c
>>> index a1e43873a07b0..48902f1c767c6 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -579,10 +579,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>       amd_pmf_tee_deinit(dev);
>>          ^^^^^^^^^^^^^^^^^^^^^^^
>>
>>>   err_free_prev_data:
>>>       kfree(dev->prev_data);
>>> +    dev->prev_data = NULL;
>>>   err_free_policy:
>>>       kfree(dev->policy_buf);
>>> +    dev->policy_buf = NULL;
>>>   err_free_dram_buf:
>>>       kfree(dev->buf);
>>> +    dev->buf = NULL;
>>>   err_cancel_work:
>>>       cancel_delayed_work_sync(&dev->pb_work);
>>
>> This is a real bug.  Did you find it from testing or reading the code?
> 
> I found it from testing.  I was testing some other unrelated changes and 
> found that unloading/reloading the module eventually lead to problems. I 
> tracked it down to your change.
> 
>> My reading of the code says that this bug can only occur if
>> amd_pmf_register_input_device() fails, right?
> 
> No; it was happening from a failure where the system didn't have a 
> policy or had a "bad" policy.
> 
>>
>> We can only call amd_pmf_deinit_smart_pc() if 
>> amd_pmf_start_policy_engine()
>> succeeds because that's where we set:
>>
>>     dev->smart_pc_enabled = true;
>>
>> This patch doesn't totally fix the problem because we would still call
>> amd_pmf_tee_deinit().  That's why I suspect you found this by auditing
>> the code because I think that remaining bug would trigger a stack trace.
>> I also worry that there is a small race window where we could trigger
>> amd_pmf_tee_deinit() before amd_pmf_init_smart_pc() has finished
>> running.
>>
>> Another bug is that we should cancel the work before freeing all the
>> pointers.  This looks like the more serious bug.
>>
>> What about if we only set dev->smart_pc_enabled = true if the whole
>> amd_pmf_init_smart_pc() has succeeded?
>>
>> regards,
>> dan carpenter
>>
> 
> Right; it's only set when amd_pmf_start_policy_engine() succeeds which 
> was not the case for me.  This makes me wonder how exactly this was 
> happening [amd_pmf_deinit_smart_pc() would only be called from 
> amd_pmf_deinit_features()].

Ah I think I found the actual callpath.

It's amd_pmf_remove() that has kfree(dev->buf) - that's probably what's 
actually tripping it.
