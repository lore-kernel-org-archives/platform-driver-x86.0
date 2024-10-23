Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1CF4EB45
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 06:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729663798; cv=fail; b=cgJeSJ31HiUnIBzbN4adA2TiPUHuQCI8Dr2RfayEgYgCMJVD6vp9kYeb5IslE7mLFYcpRUs4uR/Yi5GQ9uU1oscdZtx6S4eqmTnfJi0k+YcyXJBssyIlJ5y7iHKQEm05A/BE7eCaK6edzuJt+Z2+KoIyXEk7pDpOUAjeRWN5cjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729663798; c=relaxed/simple;
	bh=5eua8V/FeJhjkqiJTJJxf3BJHIIMk87KmNuGK6v2ycA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kq/EAUUjk7jJw1E/CuyLsN17XghrRcZRffmnE+sqduJ+075X3tLiKmahEzQ6nj3ZYH+FPSTTYT0FYselcRwEyRlVspWiJ3vgLyaI6bVl9uKsRAJYYrQI6cMbWqVJPfKD1YGEN9EL5dhRV0+PDsYyrXmA9cH327yPwrQpAo/NtV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lABbpkrH; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lABbpkrH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJA+ApphsH4UVXSRg9mUptYYbVX4HXOtA9EbEdBBt8abCv1NWaLD4i1lfbNr4zVNI/KQtzlM9ysOYgM4DxxDlmM6uoJvI4NbTpiq5b5sgtr1eYikgtwV5i7U1WfUIOc6oBHZwGXUcmZCSMClZ3djIFTB+VXHeexPS1XUclzqgfocskpBxhAbNA0OFM8JkqkoyQX0eTemIx4P2LNKfhaPsrIiIBg+p9ha4sPjCEklb4BQPnfIqGIBtXMwJevhIbHoS7ym1VQcaGpa10WR1AgVYul236xlHP88e5fat/5WFKgsfx4Ii3oKenWiMH3hcDn/n4SNliTHQlR4WDs2E8ofzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oHc1RZCguebEtagfw4FcIDW+vVctZ9BcII4poIujkg=;
 b=OCKmWKLOGYlreVNDBj8vsbEokb+g8PuZdiW6umMqR2VlEq0GHU6o7Oj2oOKMLCyw57+ApuvbhOoKdzayHIlPY6503trAmtEmdeEvbfyNmFvMy/EtA2Sw/ZpjviONSJDZsgoa38PldilJuayZxtkA4lYTok59Puo5iLASKFUSdcfleQwQaixwew5Bpf5fymgvONAh99tG8SHqzdyvmneIpBehtF5quYZsQ93YmBO+bp78xc/xwvtwjKiKy+Er3BtGeJebla8EM7wFzoYqNla0K6bF3abD7d4V6hmMCbLXSUezbNUFhFA211oQ5kRi032JWMWRRbCDPG67XDk+zvUGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oHc1RZCguebEtagfw4FcIDW+vVctZ9BcII4poIujkg=;
 b=lABbpkrHU2BvA9NE6l4A9kvaDgHLbF6M4LMQB06veBTM/81kw60gqgRhpR+KwIDlb2oqF+v/Nsrtr3OPc3JR5jfKB2sNoG7siGbTDQfXaK1+z7kVypwWHCfEVnSDhZ8LsXOfo+6BIC+dR5sz44YVqb20OU+ovQLMwrZ4B8Takyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB7297.namprd12.prod.outlook.com (2603:10b6:806:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 06:09:53 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 06:09:53 +0000
Message-ID: <593793c4-ea34-42e2-8160-367c6856a724@amd.com>
Date: Wed, 23 Oct 2024 11:39:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: please help with intermittent s2idle problem on AMD laptop
To: Corey Hickey <bugfood-ml@fatooh.org>,
 "Goswami, Sanket" <Sanket.Goswami@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <48c7aa22-7c0d-40af-80d4-538fd16327d1@fatooh.org>
 <MN0PR12MB61028BD76B3F88121289BAAB9C442@MN0PR12MB6102.namprd12.prod.outlook.com>
 <a6f7dc24-b56f-4f69-8065-d99dc43e7b06@amd.com>
 <4d0d49eb-c407-4d63-847b-69f155449850@fatooh.org>
 <c588ff5d-3e04-4549-9a86-284b9b4419ba@amd.com>
 <46a265d1-bd53-48a2-93b2-3d083f1ed437@fatooh.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <46a265d1-bd53-48a2-93b2-3d083f1ed437@fatooh.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c275f91-cf39-4a01-9fc2-08dcf3294f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3F3SXBZWlEwTXBhYXZETnhKbndkRnQ3U0ZBcGtqckZQY3BndkhBSlFKWFM5?=
 =?utf-8?B?NVpLN2pwaEZUT2k3SGRvSkQ4Q0pOU2Z4bU40cEE5STM3ajA0M1dMVHNrV083?=
 =?utf-8?B?WW5mby95MlhJa1NTTHc0M1FmK01jbmU0RHZab1JIZk9tcjlrVmlFTWlGZEY2?=
 =?utf-8?B?S2VSYXcrSUhJWFlreWxFSE95Rm8zbGkybDE5NFFDUkZJeGl5R0dwNTlPdVhE?=
 =?utf-8?B?RjMvb0NJU1lmTitIMkVFNitUbjNRMFdveWFUamhCakZ3QjZUYTdpdTJjSXNa?=
 =?utf-8?B?N20vTjZEQnZvYTNqYnJES2REakFoN0dNN0FXbFZGdUdmSC9jQ050djJPZHJL?=
 =?utf-8?B?Z1RDOTVXWmY0R1JhZHlOSFVpeHpaSnZJY1ZJQzlOLy9Bc3lBcm8vOE9laWVn?=
 =?utf-8?B?UWxnelNiYXc4WHMxbjU1NXcrckxoMGVNUkZmZi80T1kxNDJkYlA4UStXWUVu?=
 =?utf-8?B?SE1HZEVMRlF5eTNBcGs5bEl6QkgwSXJWWVhYSjBxbUhWWHFoalZFMHFwMzYx?=
 =?utf-8?B?YlRJLy84OFdXZDE2dmVtYVNSZU54bWRRL2M3eFhwS0hISDZkaXRDY25xcDhz?=
 =?utf-8?B?azNrWlZvaFEyT2JQbEJtYnFXaTVrb1VjdEEyQlJrVFk1NzN0Vk5lcU5rK1Mz?=
 =?utf-8?B?NDF3Sy9DcnJtM2tGdUZ5QWFJYzk3TnVOVlVDSTBYb1ZvbGtQVHpxdHR3cUtn?=
 =?utf-8?B?bWR5S2k0L0kxK2p1WGxNdThGL1o4bTM2QmpvaFJWSEZJemZBcW0xdnhlbDJy?=
 =?utf-8?B?ZUU1eW5nYys5UHM5eWlMZjhlYmI4dXFTMzZRL25mMStyOUV2UEI0YUtrTjht?=
 =?utf-8?B?M3JPcm5FTHNYUStjZzV0Nm81QXphSEFTQzVWc2V0L2Y0dkI1R1dLS2ViWGtj?=
 =?utf-8?B?Ujgwaklya0c1MVZHMS9Db0RoNzJrSjVQc1ZnbThtb0h4R2cvUE5mNzBUem41?=
 =?utf-8?B?Z3UvUlpjZ1V4KzluNS83N1B4UkFKVmtjSXZ1NGlXRTlXSDlLY1diREljcHVS?=
 =?utf-8?B?eDNmUitjMFNLRllqQUdhTUNNNWZMK3NLMDdwU0lkaHBkN0lVZ0EyMkxPV1Ft?=
 =?utf-8?B?WG1zYXlpRGpOa0NNTzN5Ynd1V28zWHZQeVpjOTl5NVg3dXVXdEtaUzBHT21v?=
 =?utf-8?B?OXRyWG1FSTlCQVpsekdrQW1pWjlIZDJEVkFvaU1aU2h2UWtrV1FDLzd2ZUxo?=
 =?utf-8?B?Z2NaM1ZqYThVMGxGL3RURFlhU3pUS2VsRXU1LzFnaUlqUFJ6Njdpa0MxWHlM?=
 =?utf-8?B?WjM4Smp3elZqWTBjUjlUaXplc1ZqTmltaW1UWjkzeENDOVJDUnZZYzN4dGZm?=
 =?utf-8?B?KzZLaUkyMTRBZTl5T2FlU3VueGQrYzJMQkZEQjB5Z01lSmdLWWdTZmoxcVBX?=
 =?utf-8?B?czUzMklIaEs4dWtSWVJwclFBRnBCQWVDcGFFYTU0RFoyc01QSmVWWndQQjQ4?=
 =?utf-8?B?aU5uUEpKVy9XWDI4ZjNCMnVMUlpnMXNSTjYxMWwvRmh1N1hMZ2NhQXV4cWZl?=
 =?utf-8?B?R050S3N2clc3c2FxVmowWkMvdVlqNmgxVW1BZTdHcXM1UWhNaSswZkltUzQr?=
 =?utf-8?B?R2I2NkRDZzZ3dDVKMThTVTRmSDBxZVJkZlZGZlNMU24vTjhCU3Qvd3U0N09r?=
 =?utf-8?B?UGVXVjBtbmhUdG1XTEZNR3FDdWY4bGdtSHFtZE5weWJZV2JqVlJ5eVdxMUsr?=
 =?utf-8?B?Mi9udmthbWVrUWQ1ODNsNUtCSWt1VDhXT1hSRTFlRnlYaDJHcnNyYldYMGFV?=
 =?utf-8?Q?m6SCabtL20eDC0JGhNHkpFsRfdEdaHefI6v/Vpc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtkN2tVb0RkYTVvQkltK3RLM3dQVmEzYzc2UmNsWG5qWFQ3eTRvbHJKWWJq?=
 =?utf-8?B?OU90cTNzSHNiZEpPUVZicG5XRTBOemlFdUE3YnRBNEFMQWV2dklFM2V6NWtO?=
 =?utf-8?B?YUxGN3h1ckFtcVI5M3BSdE85RTZMSVppQjRUODZuNjQ5RC9ydWF2Mm5iWHI5?=
 =?utf-8?B?R3k4dklJSUVnenZDc2ZHSlEzWmExOGtjOEdCVXNzVXpRemNMcGZjK0NSWEVr?=
 =?utf-8?B?VmhqZUxXbGVOTC9XOUFWNlNHZlgvNFIyNlNSa0srOWRmRzVpeHRzVEtZZURh?=
 =?utf-8?B?aWgycjhPWTBFN05CejBSZWpNYWJaVjlaUEIvSDA0OVh2QWdNWk1aQnoxZFZX?=
 =?utf-8?B?UjdvdnhuZWlzbWt0R2VNRWdvc0xsZ0p2UGhXTGpZMnNCY2p2QURDMUdvbWlR?=
 =?utf-8?B?TlpRNUZCRzRIRkQrdDVVRWhXRUdzRU93a3hKL0h3UTkvRmlORThUakxCbTB6?=
 =?utf-8?B?VmxvTTZJTUdWVEI0MkQ4ck0rUVBaTllNbG9qcDNGZjNqNFdCN2N2eC9WQXNh?=
 =?utf-8?B?MjVOajFCc0dsQStMcVprazRnTGdTMi8wZ2RCVGFEYUloMDVHWnpIMTNWVlJ3?=
 =?utf-8?B?RUZueHhpYXpUUjBzZVhBTUg5c1JWM09MN0QyR3VGTjVzd0NDbnVucndXdVYz?=
 =?utf-8?B?c3dlT2hzWHoxNXFrRjQ0K3lXUjNlVUpKOHlVQ1c1Zzl2Vks4K0RWbDkzSFVu?=
 =?utf-8?B?d1pMeEVjWk55Z3hRbmMzdVBQNWI0eklGQ090U0tyRDI0SUdiVmRINytMaHpS?=
 =?utf-8?B?ZzdyQWJ0cERGYm94TGpKNTB3L1Zwbm1meU5nSEdjdi9NVG5senRTNVpvRlMr?=
 =?utf-8?B?K1F4aDJ3NGw3TXJOYmV0R0l1QXp2eENJcGFKc3FEQ0p0VFZ4Q28yTFMwRUJS?=
 =?utf-8?B?dnBBZ0hCRUdHSWx3eE5xUWFscG1ld1d0TUhMRGJ6VkZickJwUStxMlRhckZM?=
 =?utf-8?B?UWJLT05ZOWVvazBId2xzOUlsdFdvYW1WMWpFWWltLzNNeGJYVW5KQ1BjTU1Q?=
 =?utf-8?B?NGtSQUxOemFFTjUwRTFnbnh5cWJDY21tRHJubGhvbTQ2cGRZZ29RWWFyQUpH?=
 =?utf-8?B?WXlIU2t5UzBIN201Y1QvNjFnZG54ME1GN01jNWV5bXVTVU5rMmM3d1p6ZHBU?=
 =?utf-8?B?Z1FDbU5qSUtlVWE3T0toQ1k3UnpTZEoyY0hEZmN6SlhnVWxWd1FxOC9yUDJk?=
 =?utf-8?B?YmZ6Q044RldHbWdPVytyMzJaRDBkS1Y2UHMwSjErYTlEWjBBM2lpTnNGTko2?=
 =?utf-8?B?NXNOZ3Y4d21wdlBtNHJicmZLRGdITU9MRGZSZEZXZEplT09kaEp2eW9hbmlW?=
 =?utf-8?B?eDVZR2xHalRTTW53U09MQzRWcE03ZFhpcEsyK3EyS2wvTkN3UDZGbWNiUTcy?=
 =?utf-8?B?dUxlTzIzUFptcUxDSWh5T3p2NDJjMFE0K1pVZjBuZnk3N0VNcnJRVXgvZDdv?=
 =?utf-8?B?R01tZ29xOXAvRi8wMHBJbEdCb2duZXZjWENxT0RzYXZwLzBGRTdyK2dUTkFa?=
 =?utf-8?B?ZHhyVkdEMjBhZVJtb3Z0eUZaK1RVVnkrSGR2c0FyeURXNFhQazdSVlhZNDJ0?=
 =?utf-8?B?d3A1RWhnOWlTWi9CT3RVM1kwbEJ1TTN6WUlKWDk2N1lrNjl0Y1ZqWlh4QVp1?=
 =?utf-8?B?UUZpTkxidmg4TUdYNExjRUlFekZCMk4vQm51dHhrUElkTmZWUzNyQmNTZTlO?=
 =?utf-8?B?cWV3RUovRmlMbWVFZGtONXA3UTVmNlNXYktESTNYZWVyeVBtU2FmUXFYUHRx?=
 =?utf-8?B?encxV3VyckZ0aFozTXVsOSs1Q0dDQjIzZGJQWlhKTmNrRXQwbThKUnprYzV1?=
 =?utf-8?B?S3Q0cmUrWXg5NjltNUZOWGhnVXIrRDFnVGE0aHZKNEVDTVozMUhlcWloK1Zi?=
 =?utf-8?B?RHBHUXlQWFNaS0g3UjRHcnlpV2ZHOEVvZ2hJZnlRdmoxemV5dlVXbGhLZzJF?=
 =?utf-8?B?ZVhjenROMnNsRFphMmU4azNJUWw3TGs5YTl5WTgxeDFTZDduZHUvb3M4SDB4?=
 =?utf-8?B?L3J0dDhzaWZkb2NsUWtuYVFRQ2Qwd0ozYlZ0b1FtUjNOcHN0K29rOXZkcENr?=
 =?utf-8?B?b24wVDNJSTNFai9Ha3J1U0FodFVucjQrcnlVeXY5b3Q1WG9PZUFBY2crdHlX?=
 =?utf-8?Q?DogfH/v2mk7M61Y5edrWS+DlM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c275f91-cf39-4a01-9fc2-08dcf3294f58
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 06:09:53.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XcoHD0m6pfECFFwduYnDiccXXoqMS0fpBX30hbBf0vHDW9pdrIGmL8va+twA0kbrOZlliGCyG8LEa9c+7EpGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7297



On 10/16/2024 01:26, Corey Hickey wrote:
> On 2024-10-15 03:40, Shyam Sundar S K wrote:
>>> This time, I get some debug lines from amd_pmc_dump_registers(). I am
>>> including my debug patch here--I think it gives a bit of context that
>>> I can understand better.
>>>
>>>
>>> <6>[ 1143.655752] amd_pmc_probe: 1
>>> <6>[ 1143.655763] amd_pmc_probe: 2
>>> <6>[ 1143.655764] amd_pmc_probe: 3
>>> <6>[ 1143.655773] amd_pmc_probe: 4
>>> <6>[ 1143.655796] amd_pmc_probe: 5
>>> <6>[ 1143.655797] amd_pmc_probe: 6
>>> <6>[ 1143.655798] amd_pmc_is_stb_supported cpu_id: 5352
>>> <7>[ 1143.684758] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
>>> <7>[ 1143.684768] amd_pmc AMDI0009:00:
>>> AMD_S2D_REGISTER_ARGUMENT:100000
>>> <7>[ 1143.684770] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
>>> <6>[ 1143.684772] amd_pmc_s2d_init size: 1048576
>>> <3>[ 1143.684873] amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
>>> <7>[ 1143.684886] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:ff
>>> <7>[ 1143.684894] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:5
>>> <7>[ 1143.684901] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
>>> <6>[ 1143.684903] amd_pmc_s2d_init s2d_dram_size ret: -5
>>> <7>[ 1143.715734] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
>>> <7>[ 1143.715741] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:0
>>> <7>[ 1143.715744] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
>>> <7>[ 1143.746780] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
>>> <7>[ 1143.746790] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:0
>>> <7>[ 1143.746793] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
>>> <6>[ 1143.746795] amd_pmc_s2d_init p_a_l: 0 p_a_hi: 0 s_p_a: 0 sz:
>>> 16777216
>>>
>>
>> High and low addresses are zero, because STB is not enabled on your
>> system. So S2D (Spill to DRAM) mailbox commands are expected to fail.
>> You will have to contact Frame.work team to get you the STB feature
>> enabled.
> 
> Thank you for checking the logs.
> 
> Would it be valid to have the driver check for this, as in the
> following (untested) patch?
> 
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
> b/drivers/platform/x86/amd/pmc/pmc.c
> index 6ca497473d78..148d57fc7b95 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -1001,6 +1001,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev
> *dev)
>         amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low,
> dev->s2d_msg_id, true);
>         amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi,
> dev->s2d_msg_id, true);
>  
> +       if (!phys_addr_hi && !phys_addr_low) {
> +               printk(KERN_WARNING "amd_pmc: STB is not enabled on
> the system; disable enable_stb or contact system vendor\n");
> +               return -ENOMEM;
> +       }
> +
>         stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
>         /* Clear msg_port for other SMU operation */
> 
> 
> Something like that could have helped me understand the situation is
> better. If a patch like that would be welcome, I can test and submit
> it.

Sorry I missed this thread. Yes, please submit this change for review.

Instead of returning -ENOMEM, just return -EINVAL (as the address
obtained from PMFW is incorrect).

Thanks,
Shyam
