Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8B26CE2C;
	Mon, 31 Aug 2026 01:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141196; cv=fail; b=f4IvrPtvjeE0uK/WmvC/9IdtFipVOoQZwUg5BJCx0UX8cGdFT9WwXH8BrloH4bur0gg/JGYqPXUrC1A8UcpbVkVZI1ZGUidXGGpciBmZqkxZn1tulMFyfJPgfQ2UbdF92baj1x5tJq3cztWWJBNOW+NzR3QVpGFJ1vYkAEVqbnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141196; c=relaxed/simple;
	bh=m4Y4qzsozhH6+Q7aRwqkRaVzeFXds3DYPIYGAdF5JHE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AGwDXaTSiyciTObyNl4bccIA34LQpy0xCpUKSSS7YtCq4bOL7V0ID/ZfJT99WsGvnQzn8VZdtSlXuRJJcBp9nn4+RHVhDwVKyze+r7fMA2gT9tbPHkp2/fy7VOXQ1I6H2oDIltSJDuDA4FxHxxTfMeXyt6XB9Y7s9j9LS0AxdGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wmTtNI9v; arc=fail smtp.client-ip=52.101.43.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wmTtNI9v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja7eEPwmcazq3ZU3DFqz98Kg1aTPzjpdXMXui8vVHn9Sv8ShjcQYKATgvRCYuLVS8qxqvM1wOJhiRw3zYWVPqps/Ub/xytSeUuTMMgImZcMPiLW12Vb0ZqDHuXwERpvCrum/xf4QlY0huDCwD4PF63RN4qySzuyWwgHWQA4ZmZhM/DXHlPshk0L3Bk7JPaPPlzEv69iBpDKjpuSmLR5E1ZP95F3UO7owageAsxeWIBVMSXgswWwu4XnMkUQWfBu1hjFOu7y0FlDBZ2JzVaKHha2t5bDH9yrOPHdUa2gPdocOcqIPaY2hm+dbY7chJKF8b8aslkkHC94MA+TM58opkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3CLZSxpvbgHIYtmnb2qoBXOADZ5LfUi4NZYHfzEGJw=;
 b=bOOaw0yaGKUy8BunYsdlexJxbERDT/bOu0NOJV32A44T4EBL9J59a9+D5jWirDgW9Vrs7WPAoQZSpdCwVP1/n95MzQFV1xI7wu5ygHs7QU3HBmO3cRmuh7x7bNe1PVkndxtDDhe73spMap7YAqqqvzHxrE94oc8gwWN5hLTFtcfwPJYAuh/UY8y3/uI4Wt8MS8crKP1rmdSE5XrpFW1t/NGzZlNjU/pdtfBAFw9qd3pYEBeFsAHhi3Rx9bHSikMhb65KOFk4Ka2zRt3YA5OLtgw/EqaAAakW61jqwAgqiv5khPyqviuDzNnFBjTQ3hBXmqAYuuJeMRep0YSbWLR5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3CLZSxpvbgHIYtmnb2qoBXOADZ5LfUi4NZYHfzEGJw=;
 b=wmTtNI9voj7e0KafZflUCDFrwUkdaNgD8wKvyIC2aHUS4gFWrMn6x7NnmXNxjTUOPb9cyIL48HubSuifH8zR5OLtZ2LyW4wsTxrb+9B5iMroXq+CW60Ofeh/DlCj7ZuOLLAA+6Z/MvbWFQUWtYhxrALm1aVEu93QAaSsBkkYhBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DM4PR12MB8572.namprd12.prod.outlook.com (2603:10b6:8:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 01:53:11 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 01:53:11 +0000
Message-ID: <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
Date: Sun, 30 Aug 2026 20:53:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
Content-Language: en-US
To: Klaus Kusche <klaus.kusche@computerix.info>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 K Prateek Nayak <KPrateek.Nayak@amd.com>,
 "Badole, Vishal" <Vishal.Badole@amd.com>, tim.c.chen@linux.intel.com,
 yu.c.chen@intel.com, Peter Zijlstra <peterz@infradead.org>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::29) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DM4PR12MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e080fe5-67bc-4af7-e39d-08df07029c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|921020|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XAlsFMrKpSusJa82IvmP7LqkjfYgGtyRo666w5hyO1r/fn/NThUcmoGs520TsO3mv7G8MXi0FAL9kZeCQPtb3KvOhMJST+q7dSSDDmqg47yUpu0ktFx0IKk8wr/o3qtP8mYSH5QVk99GJK6J4V5PvXc219Y1ov7hqik16cG3hJHwBZyiz7AQdOUUcZQxVxPno2RIl4+yZBQdqywJq886LDuTU/czG1D9r3tzcz3Bd+GfPSLKV4ypwv92MQmPYKFpuOlzV4m5noI31Ry4MoGw7Amy7BSPl4yOG5e22M6DvqnJ+svb0pKpehdjFne458mcfk/L8jqvZC9DInZpqjxz09Ljw4vJEOwwGaMIF6VT/mO9D7ifHVe+SaUMEnh+/RQXFtKXlE2BH6sGbpvBB0owtvO88u0vw7ebuleGvKa46q4+Ov41ysleWpEuoxaC5UmdhmAlKMLBRqv6f79MwBM4GHcWxNhKl+SEBr2pCwlxxzbIvpINoH/7iCBA598EvgWGFNLyrKLdHaoUlQDZtJNkWAkIc6L8P0SaG4x6Fz79oa9+dSFa+KvRujOQfpZrKeVnO7vh1ahJcpuYqI6g/BEbyPQc8O4XKIxak0HWPuHmk2+L0Xo2OFtKh7FGFprOJ6UOslNfCdNhAjxSArqnyLu5MkSrX/z2lJloO5EEVHZlROLks9ReQFCVDTQRHTPF+XvvWG85yP9kMEW02t5OWQEhYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(921020)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkpLTUZrQStiS1NMWUtrT2FZUmdZajU2T1lFeWlCUWNZV1ZQaUlWYnZUVndF?=
 =?utf-8?B?SGliVGQxbjdvYmlETHhkL281Wll2bVRHQW51RWE3NGhTcld5RlRRc0owMkRU?=
 =?utf-8?B?T1pQejNSVnJkSkZHTXZFVW5YUHJld0VQN3FIM08xM284d2V1ZkNBSmxhM25M?=
 =?utf-8?B?d2gvRDhEMjZSV0tzMy8yNW81VDZDb3Vocmd6NkszT2llOCtsalVmeXVyTjR0?=
 =?utf-8?B?bm1xUjNqdFVXajltSE1YRHhYUHlVUCtwTVNkcHh4YkRGb0pkMS9GSDNSd1Bw?=
 =?utf-8?B?cjFQMmRqOGFtUUtNWlQ1QlhrNUsrY2ErbUJqU1AwRk8wekFZaDd3N1dwaENH?=
 =?utf-8?B?Y25pd3pVZWVkMFA4SGVkRXRaMDY3RUxqaHlFUzRxcWQ4Y1Mzb1pGZXRWTGtq?=
 =?utf-8?B?Qm9zOElNS2FYdkxmWHpMdy9WUGMwY1NDa0NOVDdUOUFlWGl0WUszRnNNeWhi?=
 =?utf-8?B?M1V0UmNLaUNCYVU0QjZvdGJCOVZYYWs3SjZtWnhTMzR6OGZwUVN1NmEwNlBm?=
 =?utf-8?B?U0cyakpSeVJVODU1YmNMU2x4VEV0MksyZVFkRkR5N24vL1BPRDhwanNSQWZ4?=
 =?utf-8?B?dmh5eHRoMXZ4TTdUajY2SjNGVGY0WGRua0hnNFZzVFgyTUI0dzlKQ3RuM0VR?=
 =?utf-8?B?RTlOdGNkUjIzTWhRa1hJSVd3Mm8vTVVEeHV1cndNUHNESnVpOGFrWGhjNlNS?=
 =?utf-8?B?OS9QSWVLY2hDUDZSNjhwaWo5ZmR3alF0bmtxS2NWenV6UHVMZnF3dUxhY204?=
 =?utf-8?B?VTl1K01DN2NwOWdQcHF0TWJ2eVBlQWVnL3V1dGtxdnZubGtla1hEeU9Xb0M5?=
 =?utf-8?B?MzJUajJnMk9CYUxqMjAyNTNTMzN1a2pkQXprdzZZM3lnYTFITU5FcUxrQThS?=
 =?utf-8?B?QzlPRXduMXlDd0NQKytCVlpiR3lYNE81MjhvQnJYNDRLNzJNbjJVZ1R2dmdp?=
 =?utf-8?B?L0p6YTY4VEl2clBBcU8ybkhtRWdZcit2YSt0YUF6MHJnV0lxRm5IN21xNE80?=
 =?utf-8?B?TVNZa3lvTTBrakpDRUs3TnVtWDJMek9NYi9XTVJTU0pwM1lKSkxiTXVVWDR3?=
 =?utf-8?B?V2hOMmhRQVpCbXNPSGdnV2s3K0VmcHpMaUs0KzBmR0tyeW9NR0NzTitiMUZI?=
 =?utf-8?B?Rjdxd1BTUEZKTU44anlJT2lQMGtyUE9IcVg1V1lLZVpJdEgwL21XMU54bE1l?=
 =?utf-8?B?enlYZWVXVlErK0ZqaldRblhQelkzaHZSUG1HckxZeW5rR0hjWlBXR3VocDVX?=
 =?utf-8?B?Mzc5WVpoRTAwblJuVjc4S0JickVQdldwT2pMUzVWcXdYZ3Z3R25oTnhJamdy?=
 =?utf-8?B?VFZxTnJ6TmtqL0FHQlBCdTg3bEZLRGVCZkV5Z1AwSTBnUms2NnhaTDFGSkFl?=
 =?utf-8?B?OWRxV3hJRFlWeFVvalVBdzNFNkNwNDVBNTFHeGhLOERpcERGOFBMTFhZcytS?=
 =?utf-8?B?bXBsd1VWaDFOWkZzOWRVTUJQazNtdHBGRVE5QmxydTZPalJMeTBlRVlUT2Rr?=
 =?utf-8?B?anZ4Z2dPRXlYR2haZWREWEZMdUVxVlBDbVhLZGdBbzUxQmVjeVhOdi94WHh2?=
 =?utf-8?B?anZsdi8xRlJVSW5BOS9iZVBzSHErSGlSRm93VThXWlhXdG5EN0lyU09YT2gr?=
 =?utf-8?B?T2RTSENmcTZ2R3p2OVZyaGd0eGNoQzFwTlBZOWkwS2wyZmJ2Rm0wbUozam0v?=
 =?utf-8?B?d2o0U3FDekFDazRuQlQ4K1MvbUlqbkdQRzJxL3k4T1JNbFhOdEdpdzlCUktX?=
 =?utf-8?B?SFd4Q09sU2ZPNjB4QWJhNHZwZzdnTG5MMHZWV1Y5dDlOQnhvYW8rc2k3ejRy?=
 =?utf-8?B?N0x1QVNYVHRrL2k4NFhKWE9DTnAwcTBDUlVGWVBjRUpaZXQ1bDM1bXdLRmhQ?=
 =?utf-8?B?Nk9lb3pXTmJHdmxiTVpVMnA0MHVmMlBnOXhOTHRoalpoZFFIS0ppbkdpM3lK?=
 =?utf-8?B?a0Q2MDZFaVFUL05CeVozeW52SVRLSGF5TGhwRVk1TWREZEw1RG1IK1pPb1h0?=
 =?utf-8?B?RjdxeDhwcG50RTNJbkxQUENaenRVcWpvZlVaWG1jVzIyRWR5MVdnOGFBdzBB?=
 =?utf-8?B?akNFVkxqNktESkpuanR1NWxJNEgwT2NERVNBTzRVRzZmTmZWUUo4N1FZMndo?=
 =?utf-8?B?T0N0bkRKN1lyOStxMmc3UndBSi9yUTd3WDAyYm56N1l2UjB3Z0VWSnc0aDNP?=
 =?utf-8?B?QW5ZYlBvUEZBZGc4dGlHek5Hb1BjRHd6NjFKY2RwcTJvSmczWFZUcUF6Mzk2?=
 =?utf-8?B?YlRySDVGZXR0L3JXbG9CNmJWeDNNNmI0NXIwZTd1NmpySHNlWkRGQ2FGMHp2?=
 =?utf-8?B?N29CeGNWeDhPWEIxVnRvc1BOQUtMM2tXZUoxT09UMW93K1k0cVJYdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e080fe5-67bc-4af7-e39d-08df07029c88
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 01:53:10.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2YIjn/iA44zSFy12FApDSxd1GBpn5ptArL2NT4w9xr4Le/JZ7kz1HzY7/W8mrmfXP8uqjddZRsOH4r/M+4auA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8572

Add a few others who have worked on CAS.

On 8/29/26 10:42, Klaus Kusche wrote:
> 
> Hello,
> 
> I'm running linux on an AMD Ryzen HX 370.
> I use Gentoo and compile a lot of things (including the kernel)
> with Clang using full LTO, which results in a single LTO process
> running for minutes on an otherwise idle processor.
> 
> Before Cache-aware scheduling was introduced,
> AMD's pstate driver informed the scheduler about big and little cores,
> and the scheduler always moved those LTO processes to a big/fast core.
> 
> Now, the cache-aware scheduling takes precedence over big/little
> scheduling: All big cores form one L3 cache domain,
> and all little cores form the other L3 cache domain.
> 
> When a process is started on a little core (and LTO is in most cases),
> it will no longer be moved to a big core,
> even if it runs for minutes and all big cores are idle.
> 
> In case of LTO this hurts twice and badly
> (slows down LTO not just noticeably, but dramatically:
> In total, any compilation with LTO-linking takes much longer
> compared to earlier kernels without cache-aware scheduling):
> 
> * The little cores run slower (3.3 GHz instead of 5.1 GHz).
> 
> * LTO linking is very cache intensive,
> and the L3 cache of the little cores is only half the size (8 MB)
> of the L3 cache of the big cores (16 MB).
> 
> 
> So if a big core is idling, and a process on a little core
> is long-running, big/little scheduling should overrule
> cache-aware scheduling and move that process to a big core,
> even if this moves the process to another cache domain.
> 
> Greetings
> 

Not so sure if it would help this case but I will note there is a 
debugfs knob you might be able to use called aggr_tolerance (it was 
introduced in c1e7fe5e75ed11fa85368e5a186472afd3858f3a if you want to 
read more about it's background).
