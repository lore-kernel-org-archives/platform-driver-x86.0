Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88E1FC7C2
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729001095; cv=fail; b=DYbhj86fqyCf7kVWrhouUCaxXlrY6xccCNKklQBDbn3WO2Ujnt3BESfI92Jjj3v4Q1K3MzeZbBqjwqWJqp+iH+o1fLtXmBCcIfqS2G5vFKvPCI2vuQWju0HCEARDW6qKWhsTTDT/HuKSSt9BiRdJbk6JqmzouDe4rjjvNxOIolE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729001095; c=relaxed/simple;
	bh=1aUDQbiQswh1skmGdBIE53oK0AaRv5Wuw048NmVROTY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LVrPaMPPJBqsf0RLuOqW1u2p/r30X8fhmwXPc2eut05Yw4w4cIqelBm/uzAeMv8Niy7Pw3n7I5bXCesMnzvZY6SqD7Tw13NAoIaR/cGnDGpcT41YMS2+4umTw1DfB2C4xWW1ATHTL7PpMEc42qRKMHNN3gUhX85rk3+sRLKwgKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UegnDHYv; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UegnDHYv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w42xIsfWVEH6DYn+mf8twD61zbGyZGvLzC6GGjhv/AhFHOuxfMDOf3iFfHZeGVp3cWtexkfrNQLcbiKscj212sd0qMQztqGxm8oVOsqt62RYFYHcaY6Lln1mWf1eS21Lnbt9lh7glonsLE6phmvar6jpiXMoRacMGaJFmSFcdlMfhRAJe1sJZrRPlC5FqsUKwnKAfJbqrYvqPLAgupwN3ZiF528/k+W+XjMzOm9tEKNMYv20taazmXw0UekBzA8YL9Y9MCAOvR00aXVDEopPABmWKpVcFwDGhiOiwPNTmSWPOmPleZKC+W4uZbmxOPy4VoKnOaYcqFLRUr5L9yukug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2223mygsVptUAWG3DZSQh+kjLc+hIYoHYKvWT+TniS0=;
 b=nE5T8rDvTry9FEAweWViX03cQTd0G7lopRCd4Isqox1XBEPv7zWgnHzoGNVyBKxg655XuJ4nFyTSVihqaOkc++WKrLRzvPXPPTiqJtVtasCGpZMXJv3ylbV6kXw+d6NigTmwGWXFN5wRRwBA98EbH+xwcmQDBDRZv0EPeECIQw6BBKBvLgNtg3nSYGyNjR7Ruj+4WG7h/5kEdy86NJkkeLbjPkOhVXbK/fuSyTlZwPXr2fJdcPHb4P9ip8av9i3oQBAEbx5g5H8yaFSHWtdQs91fy3gf3MgQNlg5Nr3Oh24NE8Bt9xmKhI2Cr2nepWoXiAo/ffgFtjMpyvwTPI4ykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2223mygsVptUAWG3DZSQh+kjLc+hIYoHYKvWT+TniS0=;
 b=UegnDHYvwjuCkVxKMEjbMHZ/aXGllLfekDsh9F4slB0G6ov01c4vSCkSNZVu6xNFH9nyFkc2EIF7H/2TpIrCDOFd24xXN2N26PHIqwPgBKE8MyydBXMpsC1jXcyz8FYN6zEdxS60mn87j+elAWiNY4yjrajEsS5X+UgUYVZx6m8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6879.namprd12.prod.outlook.com (2603:10b6:a03:484::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Tue, 15 Oct
 2024 14:04:48 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 14:04:48 +0000
Message-ID: <15cc08fb-5edc-46ce-982e-858ad31b671f@amd.com>
Date: Tue, 15 Oct 2024 09:04:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: please help with intermittent s2idle problem on AMD laptop
To: Corey Hickey <bugfood-ml@fatooh.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "Goswami, Sanket" <Sanket.Goswami@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <48c7aa22-7c0d-40af-80d4-538fd16327d1@fatooh.org>
 <MN0PR12MB61028BD76B3F88121289BAAB9C442@MN0PR12MB6102.namprd12.prod.outlook.com>
 <a6f7dc24-b56f-4f69-8065-d99dc43e7b06@amd.com>
 <2252c724-fd5e-4c22-8696-c168e3830143@amd.com>
 <d149b40c-c9dc-4db7-9cac-97b95f447321@fatooh.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d149b40c-c9dc-4db7-9cac-97b95f447321@fatooh.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:806:125::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: c687ceb6-9e5a-4f26-18a0-08dced225470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEZUZC9NRURGWFZHUTk4U0ZOVDJvZHFkN3o1aldrU2tzNFArSHd3ODdoSjIz?=
 =?utf-8?B?eGl4SHZRWURYaUJJbzZnNHFGaWJXeGN6VDFtUGlvUXJxb0Rma3ovNW5ub09C?=
 =?utf-8?B?aGszTE1ZaHE5bVlnd3J4UjZTWDRFNDJ2TElJeEFmVnM0ZDlVOHVqZi9tSFk2?=
 =?utf-8?B?bGF2bmNuNnpubkNLeU5rYlEvL2ZEK0wwQ01sUDM1dkUxaG1lUk4rNkNkSlNP?=
 =?utf-8?B?aW1LNkorTm9ZL2p2K2lWRHlzek9uT3AwaEtmS2thYzZOdGJyajBiMXJTYS9L?=
 =?utf-8?B?NGdhUGIxNlY2SlZTVmcrTUlBQ2ppMjBFNUdoY3BOZU0yc0JSRWFrQWc4aWlV?=
 =?utf-8?B?VUl3bVVCVHR6YVdzQjRSTzhRNjdJbTNuT2hZTnhIYXhoNEIrUmVwbmczZG8r?=
 =?utf-8?B?L2h6bSs2L3NGNUNGVm9kMm9nODhoT0czVjJyKzJEbmU2OHlkT09uNTZ5TW81?=
 =?utf-8?B?OExOMEppSk1DTUVoTkllOEJMWGRaVjNuNmt5VGJGQXpKMlY5TTdneXgyUE1n?=
 =?utf-8?B?b3poa0p6WVJ4bkwxb2lrZGZvTXVyNndydXJadDNVcGJJdVVBS29rOWk4Ykxi?=
 =?utf-8?B?bm9hakR1bEF2bm9zNjFWaVFRWEtXNEdxU2VTS1hxRWlXWE9za1EyYXlPeXph?=
 =?utf-8?B?anZVSE01RTVtNHhYeFRNYngzWmRvNWYxTjkyWkJ2c01GdjR2MVpWa1BjVDVj?=
 =?utf-8?B?ZmtuQXE1MThUUU5ob0xuS0NZeERSeXpNUGVtZzhFL1dkQ1Q3dndLTm81bkNk?=
 =?utf-8?B?d0ZJNTFLQ3hVRmhxcUhCMWkrVWxHdUNIZ2VWMFhMK1A4eC94dE00b0dhd0dZ?=
 =?utf-8?B?ZlczMmtIdWNRbHEwSWRrOStzeS9Qa0dEQS9UdVZ3UnJWSk03aGszbFA0UDhG?=
 =?utf-8?B?RGk4MnFjaGhTK1BOT0lxSUpvT3MrV2pwZmZidWFXSGFncFdnTlBjSDhvY3Jl?=
 =?utf-8?B?RjR0d21wSTU1bWEzWFJYZ0lqYy91RFBiSjBjajFUd3UxR05WVXFNdTVZMXAy?=
 =?utf-8?B?UCtwNFZsZG8reU1DVUxqeWdLakw1SE1iKzdsTXFBdC9DSEZoN0I2bHpDVDVq?=
 =?utf-8?B?NjlhRVFORXdyd0FvZGhRSkV3eVhGVzE1dDA4a0diOW12Nm9EWm4wWlk1SW5r?=
 =?utf-8?B?Ym5TanIvazBPc1VaYkZsNTBVdnR3NStraTZ3QzRhdWJJZFhoOUFCbWt2R3R2?=
 =?utf-8?B?SWRrV3NoQjAxK0UzQXJGdjlZUlBxbWVNT00yRXYyVXR1SzJ3aGlybVV6cVpx?=
 =?utf-8?B?aEJXS2Z6T1U3OFlCRlEyditQR0VkM3N3MDhzdGRJRk9uZnJyWlM5L09CMjBx?=
 =?utf-8?B?KzNoMXc4ZENlcC8rdUxCaksrN2VUVUs3cUtRdlpRb010dHVpTjJYVU9idGV0?=
 =?utf-8?B?N2FteHdQZmM3MTRaWDFjWlJIMVFXeHRZZmJubEpPbTAvT2UycmUxWVVwREFQ?=
 =?utf-8?B?aFdodkxqMkNJeXo2NGFtY0xMaXJtTGJtY3JpOG5jZjR0aDhRMU1pcEp5YnZh?=
 =?utf-8?B?QnMvT2dva3hFdzhXNFJPMHd0T05LUWE5eWU2eW5iUkx0Sm10cDBqYmVtN3Bi?=
 =?utf-8?B?Vy9RMWhkcitHTGVvVzZDYmIwTlNYWUdkcXdTZmpqamozamRsbDZRVW9MVEZz?=
 =?utf-8?Q?+kakqtqZR+926fnfndIouwVuffi3pkBRTJSfFQmsXZ8U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGJpa2tMYU1RQktWd0dVc3JtRk9zM3dlYXVkc20vK1ZjRHpWVnArUCs4TzBq?=
 =?utf-8?B?THhycWQ4aCtPT1BUL0dRL1FvcTZnSzlaalZBSnJkR215TzVXNUwxWUFnanh1?=
 =?utf-8?B?TFJOQ0c4Ny9pYkJxOFZhNGI2UWFwUXZSUGtJMGZVWGxUaG04Z0ZEaU1tMFUw?=
 =?utf-8?B?UDM2dXhZZlRFRjBtZTlKZlJBaFcycHZxeEdZUi9OWkxXVDNEc2trMzFVdmoz?=
 =?utf-8?B?NktwMDlOMUdIMG1URWZUUzlxYXNQa0x6YU9uVG1Yb0U0aDRvcVJiRFhiY2cz?=
 =?utf-8?B?ZVFIY0FtekU4VkI2TVlrUUVOMG82Y0dyY3hmaTFjbHJiY3VYeStiS1d3U2xk?=
 =?utf-8?B?ME5kbWJKWWxRdXNkdHo1NTM2UjFRQ2sydXM5R3V3ditXOEp6MU84dXZUNER3?=
 =?utf-8?B?UVJSRUFhSVNjZ3BjYnRvMnpaRDdTQWtXNWNuZUlpL0c4dnozaFJQVjd4b09m?=
 =?utf-8?B?YVhpam5KeWR0Z2R0MitqdFJ6aStaeEFDWkgwWCtyelVsUTNuVjU1QWZ4VWMv?=
 =?utf-8?B?cG5vUWdjY1ArdmdKc0t2c05rUm5ua0U0cElCMEpmMFpWb3Vpclh0Yk1kRDN0?=
 =?utf-8?B?Z2ZDYTlFbGlyMlRLQVVvWjlncDFrMTJMT0MzaHJQVHNlZDZBUHJEbDR2T1Bm?=
 =?utf-8?B?Uys0S0Z3cHp1QUpVcTRMNU5RcTNiQVdORjk5TGFwMkkxYVBJbzY0SEY3RmJS?=
 =?utf-8?B?VEo3SHVtREVYSXJvemc5aFhpdWlzblphTGpQZlRhV1l2WFN5bjQydG90L3FV?=
 =?utf-8?B?QTdPWjRjcmc5SlR4L2t0Yk1kcmdPb2NvYmMxWGtkOFBjVGwzYVRNekw2ZFhD?=
 =?utf-8?B?T25oWGVIQTU0dGVnaVY4UThjZW9NejdwWjVaV0I1M3RVV1RvUjlrcUVIY3oy?=
 =?utf-8?B?QkxLSmhyYnRnL1RwZGQ0RmExZ2JlaFNGNUZSYmdBQ2xYSWZsczdESzBXZU9m?=
 =?utf-8?B?cStIS0tVdjM1Zis1SlJIa1U3VFhJZ3V2UldsOVczQ1dJLzE5S2R5SGhHS3g3?=
 =?utf-8?B?OTR1WWtEZW02ZEdCQ0lyUU9HUDZMRjlDa3VOdUNqeE00TmoxTEVXQngzcVlQ?=
 =?utf-8?B?UTA4SVY5aEp4bjMzNGt1MzMydDVXRVVoeng3UmkwMmk5N05ucWdCWlJUamRy?=
 =?utf-8?B?QzZZWFZrRVZsb2FUckJ2VUNlRUs1U0ZKbnpnWHFMMHdLNTNtdVE3NHQvMndL?=
 =?utf-8?B?Q01PektYQVRha0w3WUZFMllJMHhuTTdRY1pxbW45REhzbmU5Q3NPb1BkeXcx?=
 =?utf-8?B?WkhXS2IrZUhnWEZVN0lKcXI1MXIxMkh3N29jYitjTXBBMks4blBiVFlmbG5k?=
 =?utf-8?B?Uk96a3VQc0pnVXNmWWlyYmlraUE2bGN5MjRoUmtBTktnTk1RTXFuOVRkQTM4?=
 =?utf-8?B?eW1neFRsaUc0UmlYd2tGcTIxTXg3Y2QraWlpVlRCRUx0eWlma2pudnZvcXR0?=
 =?utf-8?B?WDJLeG1LbzNDTUVpV2YzQXdDNkdrK3p2MjdHckZBVUhLZEk1bFg3VHIyMDZk?=
 =?utf-8?B?aGJRRG1pREkwYnBtTUcxTlhlMVlwV1Bva1pOL2dkU01hajk3Z1FUYTRDcDZQ?=
 =?utf-8?B?WDRrZ3MyUDgvQnp2aUZDNXozKzc3NFl4aHdJN01zQnVqNjdKYWRydG9GSENL?=
 =?utf-8?B?bFljcDN4a2NmeTdwcmwzYzc1SVI5SnpFNEVsVlNKQ0k5MURFbi9VMFRBMlBJ?=
 =?utf-8?B?NmJYYXZtOWJ1TW9VVVBwWWpFWXFSNkVIa2VUamQrd3BIeEY2ZmlKSC9IWlZj?=
 =?utf-8?B?RTZEVzZmd1VGdlRYSzJJVU9NTlBiZWpNaFFxOWZSUkxWWjlVc0hYeFh3VmtQ?=
 =?utf-8?B?RHZLOTRiZVMrSmkrWG5yc05neEpJTlVDZmtxUFg1azZJUXlGaXdUZ1o0L2VN?=
 =?utf-8?B?bTJERDdGVklUMzBPL016SVZ4dUlCZVNraXFEbDUxZWlIMjFvclFMVHQ4Z1Jp?=
 =?utf-8?B?WlRTNW1Rc1lXMFBoZ2JncEptRmRCUjhxTGprc1NicWZjay9CUmxZSC9LcE9L?=
 =?utf-8?B?UkZSS2RPWlpUYlNjQU5IY05NRjRrL1BaUjFvTWlqRlZuWWoxcnhUbUlxa2ZL?=
 =?utf-8?B?Tnh2OFBrMnJXTTFDVEQ1ZldYVUtjMVh0djNHa0hTNDNVQlc1elFXa3NFckF2?=
 =?utf-8?Q?sZacT/DwpQq5akFqqPy5Fdq1Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c687ceb6-9e5a-4f26-18a0-08dced225470
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 14:04:48.2770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJHsAHQ3eq7DzyBB43g9K76lTAgWbuzOvgQQd51MAETKwWtdlK7G0VWAEQ+0ZWUTc/uAHPY/8xV1oWJMYUqVrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6879

On 10/14/2024 18:31, Corey Hickey wrote:
>> The STB functionality issue and your suspend issue are tangential issues.
> 
> Yes, I was hoping to be able to use STB to help troubleshoot. I do not
> know if that is the right approach.

I don't think it will help you in this context. Even if STB was enabled 
by your BIOS you wouldn't be able to access it from Linux if the host 
froze or rebooted for some reason.

> 
>> You mentioned in the linked post that you didn't find any issues
>> reported from amd_s2idle.py [1] and also can't trigger this issue at
>> will.  Could you post your report generated by that script to a gist or
>> somewhere non-ephemeral?
> 
> Yes, I did a 10-cycle run today and posted that here:
> 
> https://fatooh.org/bugreports/2024-10-14-s2idle/ 
> s2idle_report-2024-10-14.txt

Yeah nothing particularly stands out here.

> 
> I also included the output of 'journalctl -b'.
> 
> https://fatooh.org/bugreports/2024-10-14-s2idle/journalctl-b
> 
> One thing I _have_ recently seen reproduced with amd_s2idle.py is that
> the laptop sometimes ends up rebooting instead of automatically
> resuming. I don't know if this is related; I mention it now just in
> case. I saw this with 6.10.6 a few days ago and again with the test
> kernel as originally reported (git 09f6b0c8904bf plus my debug patch).
> 
> 
> I case they are useful, I posted the log from that run as well as
> the output of 'journalctl -b -1'. There's probably not much to see,
> though--the logs cut off, as expected.
> 
> https://fatooh.org/bugreports/2024-10-14-s2idle/ 
> s2idle_report-2024-10-14.txt.rebooted
> https://fatooh.org/bugreports/2024-10-14-s2idle/journalctl-b-1
> 
> 
>> Something I think notable about your system is you are using two SSDs
>> which is (relatively) uncommon.  Have you already updated the firmware
>> on both SSDs to the latest?
> 
> I have not, it seems. The drives come with stock firmware:
> $ sudo nvme list
> Node                  Generic               SN                   
> Model                                    Namespace  
> Usage                      Format           FW Rev
> --------------------- --------------------- -------------------- 
> ---------------------------------------- ---------- 
> -------------------------- ---------------- --------
> /dev/nvme0n1          /dev/ng0n1            241802800078         
> WD_BLACK SN770 1TB                       0x1          1.00  TB /   1.00  
> TB    512   B +  0 B   731100WD
> /dev/nvme1n1          /dev/ng1n1            24102U800015         
> WD_BLACK SN770M 1TB                      0x1          1.00  TB /   1.00  
> TB    512   B +  0 B   731100WD
> 
> ...and it seems that version 731120WD is available for each. I can
> try upgrading later (one at a time, with maybe a day or so in between).
> 
> For reference:
> https://community.wd.com/t/firmware-upgrade-utility-for-linux/210120/13
> https://community.frame.work/t/western-digital-drive-update-guide- 
> without-windows-wd-dashboard/20616
> https://wddashboarddownloads.wdc.com/wdDashboard/firmware/ 
> WD_BLACK_SN770_1TB/731120WD/device_properties.xml
> https://wddashboarddownloads.wdc.com/wdDashboard/firmware/ 
> WD_BLACK_SN770M_1TB/731120WD/device_properties.xml

Before you upgrade can you please also capture 'fwupdmgr get-devices 
--json' output?  If the SSD upgrade helps you I do want to flag that 
this issue in amd_s2idle.py for the future for anyone else with the same 
SSD + SSD F/W to tell them they should upgrade too.

> 
>> If so; would it be possible try to run with just one SSD for a week or
>> so and see if this issue comes back?  If it doesn't come back there
>> could be a BIOS bug with how it's handling your combination of the 2x
>> SSDs and you should report it to Framework.
> 
> I'm running an MD RAID, so yes, I can try removing a drive for a while.
> I'll try that if I still have trouble after the SSD firmware update.
> The rarity of the problems (so far) means it will probably take some
> weeks before I have useful information. I'll keep trying.

OK.

> 
> Thank you for your help so far.

Sure.
