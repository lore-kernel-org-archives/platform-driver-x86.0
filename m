Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE9F1C861F
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 05:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751001861; cv=fail; b=mmOhMUzeii3qh0JKJZuZaXhb/eugAU9uIP2kwcEyR/T9X9HsEsLyeGW3ZC8zXNa43JcPzVn46yppzZ6v5Htjra/afMYNXdJ9vaauprFkjK9mEFtoCech9LobrAEiqlJeQwDnYAP02v0Z131pGWtTpiC85N1bVzVvnGW0Go90f1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751001861; c=relaxed/simple;
	bh=CYju7aetio9BFL968FoiXLnlWdr8NsRKwAZgRDeBu1Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=luSKcOA5TtzvqlRE0iPNiAKdTedCtGnuLPdxiFKWSlNGhGbJezeJHdamQmqhcfSaTqhnGiUUluZbIaxmoDg13CqiFu6UVaGs9kn95Ct2lbrYvaluO7BxoYtVdjlcOwBSu8NyHtlcLk6KwzSVopC22KM4BmbrQlIgaXlFcB5Ddo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gDoKwFtk; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gDoKwFtk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L521Jn4ec6rd51T6qzOX/f18cLP3TPtfaZSi4hd54VzZryDZUgKcXnolTMJSZ7v88OgMWRQP+6Y6ubxK42GVyJRlMvKvTEygo2JhlYwMklsqNQkw9HJdKW0bJiUuzsoDzWy1iuBa5It6REMhU6bp34SSK6tBrQ7XuQ8tKK6cON0Dqck6nBU7z2Q1SRs7Yc+RsNIyhb7SI6/mSxF9BpeOW/HXLWqS6esXGDF0l+5gt/Qs4kCMI9ncu21YgV8rAPqgfiWYQVh5wNs3WbkwpxD/IeuL7BPF6SJdA2vz34H/AOJlXCLY6bwJ2eHFCcSxHIi1Q2yHo32ARDUl3TQedll1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjz8AGxW1QqtXCO5VfOkbTZHtQcdmXEvCHX/LaolpIs=;
 b=gbtPfd8Vi2qdMYth254bOIqj/ezYhFsKQdydF0M5zCs6+uMYh8GZBJ4EjUAgm8wK0VweUBK0oszNn5rYh6YeHlnAZLixAEA4XGLqd/eBZWClKN0jOP/zSjN6iHuSLBzgQbymJOYLuFyBfQRzsJQC2yzeANl1WR+s+mW7dMDEcYDPF9TI21b7AB4Xjte0ywSWyW7fK0G+Bb7ynYP8SFvl8jiHtNGqP6esKbAxOWEjdc/uSmL35XX/4fWTl5TjWVggNgrP45ip/YBNX7gC4iF4so/GSG5ENJfyvqVXX2PeV6oreEBG/b0kxraCUDzJToi1z7k0nHGISv7eDClRuo8xGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjz8AGxW1QqtXCO5VfOkbTZHtQcdmXEvCHX/LaolpIs=;
 b=gDoKwFtkvZhQvEdu3PX46Fh5R8Z+aFNbE5TE67idoLEHZiciUI7/f0DxWyinJNOLRyfl82cmDpLB0uLs7b46YBstsIubltbY3gQlSojkxt844M2X0sYBjk/fYqnvGn2VZgeAuTNfn+B4S1Ul8+vkto8T6y2xRhLcU0Wz81HmMTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 05:24:15 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.8857.022; Fri, 27 Jun 2025
 05:24:15 +0000
Message-ID: <afa69b1c-b992-4897-8bac-5b6f4b77a27e@amd.com>
Date: Fri, 27 Jun 2025 10:54:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Use guard mutex to synchronize
 probe
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250625100216.1462594-1-suma.hegde@amd.com>
 <ada3eca0-4c86-c3ee-816c-a3635b4ad110@linux.intel.com>
 <4fc05197-688a-454f-aadb-7a297db7a594@kernel.org>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <4fc05197-688a-454f-aadb-7a297db7a594@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::16) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|PH8PR12MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bee4aef-1319-476b-badd-08ddb53adb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjBaTlpBTmE1MlhUQ2VNWjhsQnB6V1VLSCtoSEtYZlBKV01aVnV0aXlTeWF1?=
 =?utf-8?B?NmpTc0ZkK2ZPQ1hqRUVZSkh4ZmthclRIQjQ2Z1dOazFuVllUNGxKbUNxVm52?=
 =?utf-8?B?L2crZlovRExRSFdqMkkrWittV1FJOFJFTFNJNS9GcXUvMVd5a3BseFpwVFB0?=
 =?utf-8?B?dUhRdHBGeFpwZUx5SWdENlFoeXNYUlNDempocmlNWVN0cFJCUGVNSjFsZmlo?=
 =?utf-8?B?dnRBeFE3OHE0S2JYRmN2cGVyOTBrc1lXWEpYTHp0ajJnK0R1ZWJtK1dzRHhZ?=
 =?utf-8?B?Mlg1MDludzg4dXVyMXZyODJ3NU9idmlJYmpnQlFBdjcySmY4Q3Fva1BiZ1dk?=
 =?utf-8?B?VnJnTCtRVUR6SzRhUVVGNkdUQ2lhNXhqMExIN3RJVEV1L0JLekZGcFZKZzk0?=
 =?utf-8?B?NXg5aWtzMWpWbXg2bUU0U2tObWlXVVlGbm5WOWdDWnQ4RmxjWGRjMnJSdkd0?=
 =?utf-8?B?cEQ0enE5T1VxY2Y5QjBaelhrcGxENjdWWlo5UzZTbnYwVis3RG9DMGJoZmFl?=
 =?utf-8?B?WVpGNHk1S0VqTEwvSURxRHFMcUlGVnExSmRJNVJXV002QjZtYytnL3VPS2g1?=
 =?utf-8?B?L2Z3SzhieGo0cHNUcW10VjV4QUhQekp4M0xTdUNhbnRUR3J4S0gzVkFxRXIv?=
 =?utf-8?B?OGl4ZmhUVGhaQ3FOMU9CSmV6ckdnTjJVR2gzbkJGUGY2QllXQ1lWbUNyQ3JX?=
 =?utf-8?B?azN4eWE0UGMxZlJldWZwK01PenhKZEVKTnEwbTlFcUZrb3RLSFRoNWI1WEps?=
 =?utf-8?B?Wm1SQTZySGREcFF5NDU5MVRWTkxNMWNSWlVIc1BiS0VsK3J3d2ZTOGQzRVhI?=
 =?utf-8?B?UFhlVUg2Umk3Q0lINUl5YUlqWm1oTkZ6OS9yeGlXZlNoU1ZtM3hpU2NPSFV6?=
 =?utf-8?B?bEhicVhIVjlLNVJjQVdBYko3dU9Ea0V3OUNjQi9VTWVSenkxV211ZTMrb1Mx?=
 =?utf-8?B?NWlMdFpNOEFGdVJCNmFkMWV2TGpqd1VRVE1SNkZWYXV0ejdQZlJPUlh2ZkQv?=
 =?utf-8?B?dkswNXFlSDJFSHY4bGI0NEYzM3kvdVQ2WHlmNzU1UzB5dS9sdkd5bGpmY0ts?=
 =?utf-8?B?Z1FpTXl1YnFFZ2MwaXZ6N1JpK2Nzam9vOWhGRWVXU2ZXMG9VSDRKRnR1ZUVt?=
 =?utf-8?B?ZG9QOTNQTE9mTFJsZ0dwZERtdklpMG5OL0dpY1RyNEsyZG1mbmtHZ2UxdWRE?=
 =?utf-8?B?MEpIenl3KzZBdCs2NDNiS3FDSDRQK3NFcW5HLzlRTGZnazBxNTUyZitJWEZp?=
 =?utf-8?B?MjdUcDE5NEZ3cWhHbDN1eGtuYUtLeWxsemFtMlBYcmFQUlVCMFhSQXFjVFFt?=
 =?utf-8?B?UStTYnIrbmpCNlZKbW5zbEZEYkZGRFdqaDQwOE5sZGJwWEhZQlVyUHFlODdw?=
 =?utf-8?B?Vy9sbFd1ajlZOXJobktlL0xMMXZra1h0VEQ2bDVvK3pRbVdPQWpWTk5ueVc4?=
 =?utf-8?B?bXd4Ti82d0xDc01DWG52V3QwQjhlVFNmZXdzN2kzU1J2RHo2VG10dHNBaFZ1?=
 =?utf-8?B?SGxUMVR2SG1OcUJocDNsOE5qQm82elZQUDZSQzM2bE44ZGdRQnByUi9GdHZh?=
 =?utf-8?B?Vm5IZFJTbzRoNDRFSmVTK3dCWGFhVnc1VU11SGdUalFRTnZnV21nTXJaUW1r?=
 =?utf-8?B?cWhOS0dxL1FlM1ZKd25GQXQvR041dTZrOEgzOHoxSlE0ZndQK3MxY2dFQ3Vr?=
 =?utf-8?B?WGJJOW1vTGp4a1pqREs2QUFONHN0K0hzZUx0Q2NUQWQwa2g5OWsxS0kxVU1W?=
 =?utf-8?B?d1pQZml5elE5cThzM3hYYlpYSW5IalRxcEtMOStpek0zVkJXUWt5RzNxNmp4?=
 =?utf-8?B?SlU3NUlaL1BFUmdyZ0pXR1RYc0V2ZlhxdjVqdDk0OWNPUHhFK2tLYXFHVmFD?=
 =?utf-8?B?R2xiNkJEcVBqNDFJNnZYdXNRNlBzTDF2dWJGbmNRRDZzWkhsUFRTR0FGek1F?=
 =?utf-8?Q?oeVVrQQszUM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0l2TkRKT1FIMldvUEpiMHFzZW1XcVU2VlJtdjdyVkowbTMxSnFDZm0zL3FO?=
 =?utf-8?B?QzhxOWtHNWxxWUUrZE1hN0N5YWVOVTV5eC9Md1J0Q2lmcEY1SnZZTklwbUZy?=
 =?utf-8?B?WG1WNjlmUzhyUGhPNDhWdGxHZEJtS2QrRmJhRXl2cmZSbmNTMThRUEhBbW9w?=
 =?utf-8?B?VE9SRDVrbHFBZW9pOENjWDQrQzdHNk9yS1RNVUhydC9kUFFoNi9VUjlvNHhN?=
 =?utf-8?B?cDhzTzJ5K1doU1RJWUZjdzNoVEpWN01DaTNhWUo4bVZwRURkNGNaMFhnQUtX?=
 =?utf-8?B?NmtRZmRkS1gxUXRXM1B2RTdrc2lmditCUWVoT25yWWVsSTc4UnFKMEdpcDdp?=
 =?utf-8?B?RXF3ZUNnRXNkNXpsZU0zZTlhcWgrMTNJM3Nvc3l4eDBJeldoVWZSdEhkaXZn?=
 =?utf-8?B?Tyt0MGZCK09qNUpOR0w1Z0U5UldLeVdpbHorNTVOc0pZTmY1V0FncjNLTmZM?=
 =?utf-8?B?aFRTRnB3VkpMRFNBaTlBWE5jSFhZaCtQT0FVemtGU1Z5S1FTaTkxc1FuMGlV?=
 =?utf-8?B?S0l4K2NXeHIrL1lxNGdkZ1Z1UUpseDZPUlVvenpJa1VhYzhzSUtZcElzMHg5?=
 =?utf-8?B?UlZGZitVN2JkR2swRVM3THAzWmVBVkVPUEl3VG9WWGV6V1g3YVN5bmkrQTRS?=
 =?utf-8?B?TlFvSzNTOVdtQzVKbXlGaHV4MW1JdTFqMVUrZnY2VzQrd3NmaDVXeURnZG12?=
 =?utf-8?B?ZGppMDkyZDRyQ1kyNnVEME8yTlhmSFgvV3IramJ3VHV5dkt3Z1psbG9jUEFn?=
 =?utf-8?B?aHQxQlZSKzBuMGwzcnhuRTNXeW43SmwrYXBkcUlXclpQaDd3VkFRTVlLUE1X?=
 =?utf-8?B?K3B1S0RTK05sVjRJb1V2OHh3R2k0K3VNU2lzTWlVTVpWSDhrV3VEaVY1cTZJ?=
 =?utf-8?B?SURNTXNIdGhkbVZzYUZhKzVWVTNNNnJoNmFESTQ0NHlJVTdJSmNvV0ZRUFlU?=
 =?utf-8?B?NmhJTDZpbVFaSlliKytLdUlVSm1TT1Y2SkQxcTJtWW4rWjJNZ2tNZ1ZYQUhi?=
 =?utf-8?B?RXR5aHJ6dzFGOTFPZUFWN2ZZYXozbngzRXArdXZEQ1FwSmVOYndYSFpOeFlk?=
 =?utf-8?B?c1lBejA5TTJoa2xuVWM4eTRTeFpxREhnMGx5bnc2bzR0NjVwNjdGQkZabFFl?=
 =?utf-8?B?d3N1bVMwY2t2eGNLcE44R2pEMFg1MWU2YXNVRVFMb2EzNmVQZzhVT3Z3OFZu?=
 =?utf-8?B?L0M5KzZ3SXJidjVLb3U2enpLTVgyRXdQVGlmTGFqNUVKbVlNU0xuQllCdzhL?=
 =?utf-8?B?NENzeTRzRkRRU1ZFemRBOGJpb0lIbk10U2pZUVA4Uzhka0p6ZnVuK2VXSDFV?=
 =?utf-8?B?RFRXWjZxNG94ODJWQlFGNDZuWGRRY1Q4SEhWV1RQRThvcmsyNG9KQmJ2M1V4?=
 =?utf-8?B?czdSZFYvUHdobDBnUDdoK0JHM25ZbU16QUJoSW50TXlQU2lTaGkra3RQQUVj?=
 =?utf-8?B?dm9RZGJmWXdHdC9sV3lVR0hyOXhySHkyTnBIWW8xbXRTL2xXWExSWGJlblBn?=
 =?utf-8?B?b3pGVWEzMXk5VjZ5cVVValY5VyszUVFSVldDMk5SbTJYS3RiR1Facm40djNm?=
 =?utf-8?B?UjQwQWlYSUJNOUlHeE9zK2NDcVZjajdOdndBbGJKalpyNzBaZ2RUNHVpQWc1?=
 =?utf-8?B?WWlzV0tMcW14MGRqMmN3Qm9UcWJBbzhQV3RZbWNDbzllajBVZzZ3YXBwR3hK?=
 =?utf-8?B?dURYa3RZbTJBZ05FZVYrb0JnTlgxOU1IOFgzcXY3UktCTDRFZ3UySzJ0M3RO?=
 =?utf-8?B?WXZkQzVhT3BGNXZwUEE3U3FaLzZUWU1NOGdTSWdodXNjMlZSUVRiMDNhV0V1?=
 =?utf-8?B?MDM0eitPcUtPbkpxRW9Ra0prR2tIeEN3Ynh1ZDR0VnhxelJoTmV4WUJVM3dn?=
 =?utf-8?B?MUdFMzhxKzNFd1M4ZFcram0zSnArM1RVbXNSc292RFltWDN5WHcxcjM3TTlr?=
 =?utf-8?B?aWRuYVh1RXhNck9SSGsrMWNtdkpiZzVHazV0T25hQkxjTFBkU0YxUSs3NUdG?=
 =?utf-8?B?WUtxdGVRcHlPakZ3TmNHMVJiZnRoVE9ManBaNXNIRmYwZ01mLytwbVZJNDJF?=
 =?utf-8?B?SUZpYUxoUDA1cjJIZ2pZUnQrekZ3RTZnanI1MldiL0dTZnZwK3RoVmlGUnRk?=
 =?utf-8?Q?RqWLq9Wx0T+dVwhOBNkE9MDJ+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bee4aef-1319-476b-badd-08ddb53adb60
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:24:15.3624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kz8K6qRqhQf3KwvyK9jGhSz0s15ZsdRwmtoZ0pLZ6xB+n+1gpDIEdXlYEVyYBdcoA1NfJ1THqlstS75RHQp8Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841

Hi Ilpo and Hans,


Thank you for the review.


On 6/27/2025 12:23 AM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi,
>
> On 26-Jun-25 18:31, Ilpo Järvinen wrote:
>> On Wed, 25 Jun 2025, Suma Hegde wrote:
>>
>> In the shortlog, drop word "guard". This should also mention ACPI as the
>> legacy probe is not affected.


Sure, will drop the guard and will mention ACPI.

>>> When async probing is used, 2 hsmp_acpi_probe() calls can race and
>>> make a mess of things.
>> Too vague wording.

I will revise the commit message to enhance clarity.

>>> So, add guard mutex to synchronize them.
>>>
>>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>> ---
>>>   drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>>> index 2f1faa82d13e..ab2b65f16d1d 100644
>>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>>> @@ -15,11 +15,13 @@
>>>   #include <linux/array_size.h>
>>>   #include <linux/bits.h>
>>>   #include <linux/bitfield.h>
>>> +#include <linux/cleanup.h>
>>>   #include <linux/device.h>
>>>   #include <linux/dev_printk.h>
>>>   #include <linux/ioport.h>
>>>   #include <linux/kstrtox.h>
>>>   #include <linux/module.h>
>>> +#include <linux/mutex.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/sysfs.h>
>>>   #include <linux/uuid.h>
>>> @@ -44,6 +46,8 @@ struct hsmp_sys_attr {
>>>       u32 msg_id;
>>>   };
>>>
>>> +static DEFINE_MUTEX(hsmp_lock);
>>> +
>>>   static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>>                             u32 *value, bool write)
>>>   {
>>> @@ -585,6 +589,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>>>       if (!hsmp_pdev)
>>>               return -ENOMEM;
>>>
>>> +    guard(mutex)(&hsmp_lock);
>>> +
>>>       if (!hsmp_pdev->is_probed) {
>>>               hsmp_pdev->num_sockets = amd_num_nodes();
>>>               if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
>> So is it just the ->sock alloc and misc dev registration that require
>> protection? (The latter doesn't even seem to require that if a local
>> variable carries that information over.)

Yes, the rest of the code, aside from the remove function mentioned 
below by Hans, doesn't require protection as it uses local variables.

Additionally, we have a semaphore in place to protect the other critical 
section.

> Another review note:
>
> hsmp_pdev->is_probed is also used in remove() so that needs a guard(mutex)(&hsmp_lock); too.

This was overlooked. I'll make sure to add it.


>
> Regards,
>
> Hans


Thanks and Regards,

Suma

