Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7247119D085
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jul 2024 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926048; cv=fail; b=hmo2h8urYrrBwkOkjf3yf6qpcJJaPcJQKRaUcJY+h4s3unxVJNeIfH/1YOD+HZk4S4wAcnNzsBu3BLvlrWxekFoPD1txSDeLMtZpo9Z1zKOn3aAvj+q/u/qPeVXXw75931ovGm1VOLrFPALZNLj0ch/knnUuK6mEMQ9JDUiP+ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926048; c=relaxed/simple;
	bh=K99P1k2L5t+dlltcJoAOIhdfFSTANDsXAToGqrjz5M8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uylpzUkZYpCiedqO8wX2MT+u9e5PrFX7d/RvqTpfCBj1/yO+CNuEEHl62Oer9G1amUTQyJYSYlDhM55AuP07sf7aFwZjlI1O0I73m84RcAkPLzcDa8BaxPOobZDA+M0h/0vMNpMGCGqQUYBOelc1Ibayw0Jk7TJ8J6ibtLf42ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZApSpBsS; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZApSpBsS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMzLTYc5UCG6RvkPpbj+YHnKdf2ix1eoPl1tgT2gQPK3r9fqtBLTH8F37gyh9NmTAODx3V6XzkKRIORb2OsqJFOFgvMxFXiRqrO5i9iSJMEJBkyEpIiYJDjYK/qltk7XKKNJE54SfzPHT5bxTYUchf+46IgJHXb1uH0OXCOhXcu2k63Na55tJ9pNUVGLnAzCr1PwZYxA5OsuZpQjF4aS585OoPLBeWWJZJboHrwulhFmTB1mczQgVrgFr61iHuAvUMDY0+vdWowulk3QY84JsTFxAi6Hjv9Zr9qRH38Mz5+ZUtQ6mkDou9137FWCBxmSQGiP0NnhLBZ55aLdA1kRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9HwxPU6Btn2jihGItXi7FD2k82sCgfHJTRF20QVLN4=;
 b=mmY8xa+odDlS2iU4lA3vtGu9ED51tsk5s11XZf669iuuXPUh9xsxg8talp4G0AyiIvkyD9TeS55EaYtOoO38jzLIt2nRWTGEIRwkwA9QwpFZl4G0MvIG4ugGDuug9XlTs9q6s262xkUKK1oXJSbSYjA8uXg3EY5n4oh0gfurixMDaCiFhVlW/BHpBVyQtvwxTjXqymxMDe+9mdyj0qc+jkshg5bZEO4lD7lQ/NI9FW8c4Qr4GRPJw8CVXloRcqai0rLv8RmEh1XwmkCFTvyeVKssDSnJ/m/eZ0P7rNW8CMaOOk1Oj4ieFq4KWui3gugRxjf+87wJpCOU9h3wWq3S2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9HwxPU6Btn2jihGItXi7FD2k82sCgfHJTRF20QVLN4=;
 b=ZApSpBsSHZByMQpORzcEiecZsjliwNVrTucKoSF0k7ulEaHX+ofE8AynFSbnOZPgaEJHt2W+NUXRuaM8cwgmw9PyI0peGT+tyZQrBsYq1HQz5Uyw+LKEDVBBTo0mgkbZ/CexHldU3nvDFEOsNEzBDEHsK91GnwknBp7qxFYz03U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 13:14:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 13:14:03 +0000
Message-ID: <7da18d2a-8eb9-4ee9-b487-895221a3b4a4@amd.com>
Date: Tue, 2 Jul 2024 08:14:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86/amd/pmf: Use existing input event
 codes to update system states
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0033.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b276af1-c921-487f-f6d9-08dc9a98d805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzJERGNNSmNlTFZiczVma05tZlZKeEtvU0haVWF3VUNqY3BLN0c0UjJDWEp1?=
 =?utf-8?B?NElIUDc1UHhXVkN6WU1uL3BTVDBIdDRhK1B6aXlHekpOOEQ1cy9GR2VvQ1J3?=
 =?utf-8?B?QzczWitXanRTL3B5SXRlbllQbWR4NjR4UmtqYnVYUUloQzBjcEJ1R2JPV3dO?=
 =?utf-8?B?NGNaZmxvNlExaGNzbGQ4a2dXYy9zM3JHZS9VOENPaDZxeURhbnpTVCtRMWVL?=
 =?utf-8?B?TUhhcE13OStXbTN4UlcxNVkxVjRGVzF5aEhmSm9QaGZVajBaN2E5aGZmR2Fu?=
 =?utf-8?B?WFgwU2tWbkVtVlpJSC9uMVBHTGNWZkxpdHFVRzJUNFZQajBoWk9Fd25nTkxE?=
 =?utf-8?B?K3U5SW1QMjdPa1BmQXcxOVdUSHBOMk1nMm9HYmRwbnpFVGZEd1BySkwzRkMw?=
 =?utf-8?B?c2dPN1ErN2hMNllyUWdaVENzTDJzcm9ZSmh4b05seDQ4ZnErbG5lV0t0TFMr?=
 =?utf-8?B?Si9ZYk5Ga20wRFBicXlhZVVhMTZxWXVkOEFISU4wS2c3WEM4REswcHVJQnlh?=
 =?utf-8?B?RGw0S29BQWlJcUlKOHU0S2RKK25mdDVtZnVOKzRpNjhLdC95c2Rac2RIYjZw?=
 =?utf-8?B?STRNNStZNWtJSmRsSGhpV3VZZWdXcW1ieVZ6bFlKVzNUYmdGdzU1K3JFTjBs?=
 =?utf-8?B?N2NkSG5FajdtMkozNE13VXhhNy91NkordnFLcEtnQ2NPZU5rSjdqdHc4ZTBD?=
 =?utf-8?B?aU9DUjlKUDlmenFQeUczVWdxbUxLaGlNeHdqTmRoTkxFUEdtRU9sSWNtQ2Jx?=
 =?utf-8?B?ZHZmMW9MbStJUTdXQngvZm12UC8yUWxrTy8rOUlVak41RUpoZFdBeFFaY0po?=
 =?utf-8?B?VFFWditBbmxtbkFPVHBZam1idDlSR3M5Um5wV0NNa2pZMEkwK2NISVNZZGln?=
 =?utf-8?B?T1R0bW1ZVyttdk93L3prSjB1cXk0dy9KVVFNZXZrTy9mcnBhSmdqcnRqeFF2?=
 =?utf-8?B?TmJ0NEdLSnVYUThqUll3Skp4cXhaa0hPc3IvRzlHaENWclJ5S0IzUjVmeEVN?=
 =?utf-8?B?eDB5SWxSOGpWSHBlbi81RHhnc2pRRVBaZml0ZXB6WTNKNWQ4RXFsaGh4Qkdz?=
 =?utf-8?B?NVlJVSsvbGpaR09Wb0RYa1pwODhPVHJ6WmFMWjIyYnZlSVhQMVVCRTBhdjVN?=
 =?utf-8?B?QUhGRGJ3ZkFoOHhXTGJNaVlJb2N4d29NZEFkQkM3clptTndOVWpXOVN4MGJF?=
 =?utf-8?B?UWNuMEtsT3kvU1dqU01rcDVxN2tVRHdrZnlLekhGRWpKN1E5RzJnZmxRb3FY?=
 =?utf-8?B?dHh5cnFTMVEyMGcvak1JbisrM3M0WmNQL1N4ckx4ZmgxalpjRDFmTVBsb2xp?=
 =?utf-8?B?MnJYNmVMSHdwWjZFbE5jeFFWbmRQcnRvR1Jodmw3K3BrSGtCN1pBNG8yblVh?=
 =?utf-8?B?eVVTYVNXZ0prY3UzcHRPK0xkeUtjdWZJY05BVGhPMVh1UGxpNCtvTjRBM2x3?=
 =?utf-8?B?TDdKckVJUElLTGl0SU5GaWpORDJKSzB3UXBEWDdQMXMweWI2WXZOTkZITVkv?=
 =?utf-8?B?ckpEbk9BL3pRSFV5TksyQWExYTExbmhiaW84QUd0VDNkT1pjWGR1Y284aUdq?=
 =?utf-8?B?cURwN2RERk82SkZRWksreWd3ZWJXc2NJempqa3hUK1ljYWkxN2c2aVFvZ3ZY?=
 =?utf-8?B?THVrVGZhZElpUHYvcXpSWWxYcHRmR3c5cURrZFVIL0lnZ0xMSVZIdDJzZXFy?=
 =?utf-8?B?ZzZWRFhCM2Y1TEFITFVCRzdsY0lPbyt0SVRuNnl5ZkhYR0g3aDNvSkJBL2xF?=
 =?utf-8?B?bHI2VlZGN3dRbnNxNFVjQTc0MWtFQm1wdEZrQXpBbG1rd3IweFArMGpxWnhu?=
 =?utf-8?B?aXFFbTN6dDJvYkZ3MGQ1QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWxtZCtPY09VSmZzbktBa0FtdjhTZzJmWVFsdlpwNDYrVVJTU1ArcjE3dEc1?=
 =?utf-8?B?Rk5ZZ004cmFKY01McmMyOUJERGMva0pIZHNCYlZLckl1Q2V1SEVPS3VBNHJG?=
 =?utf-8?B?c0QyTmxzczNNMzJ5MWs3UTdJZVVRTnhVdFQwQ2hvSmVEeC9BWUhJdlVmNGxV?=
 =?utf-8?B?SmRVVFpaTlppSXl5UDN5YkhMb3o1WFBkM0VJRG5yNEprOXRobjRCQlp4aVRV?=
 =?utf-8?B?N25LYVZ1QnA5aWZOd3F1NDY3cDRpQzU5MHYyb2hCUlNRREh0bjJEbERvUUlp?=
 =?utf-8?B?WXZPWHkxRE1iQVl5SlduSS9oNm53aTNxcEFEUVVmV2h4Um1YTDV6MGpwMkpw?=
 =?utf-8?B?N1BXWXpmQVhFVktaeVZ4VW9vNnluMUZ0eExkcXU5dmswR1VZWmNBdm1mT3dG?=
 =?utf-8?B?eW8zc21ucmFkdkpDQ3Z0SXlHMmhVUXBrVGlyRXNRWnRrVzZxRStrMjRhVXFo?=
 =?utf-8?B?NFIxV3MxOE1hTWQ0elkxWFpxKzNUQnBIZlFDRStML2h0b3g5UmhERmpaZGUw?=
 =?utf-8?B?VjRQNzFkKzF6YkNNaEJPdWhVZk5nNmdiekdiemI1TjJnZG05WGhBRC9BNmYw?=
 =?utf-8?B?QVV4UGk0cCs1SXRVbTdueUtWVXZqT25zR0FmbDQ2UitBQ1NVZjhoMmVDSURz?=
 =?utf-8?B?d3N2TVVrREw1ekYyckI1TGNuQlNaNWJQMzczdXlDemt5bHpnZjFpVnV0OWR4?=
 =?utf-8?B?Nkp1V3V0eWNKKzByVXJraHB4d1JGVnBLV0xhZUpJRDZmK1V2SnFUSzlleUhD?=
 =?utf-8?B?L2dHbXRvU1AxQnltYUErU2UzNnZMbkdleFVxWWlCWWVrUjlGOG5ZeWxEbTRw?=
 =?utf-8?B?em9rNTVnOFZsS1Z3RUdMWDRuY0dJODliN3ZsTTdCYW5oOW5PWVNUZ3RVcVpZ?=
 =?utf-8?B?ekJyT2h4ekVqbmFHZUs5Y25IVjQraUswSTM1ODFFclFFZGRGdXZmUXdDNmZX?=
 =?utf-8?B?bCswVTdubjR1dGxhQmxESzcvZ1oySTVFblFZNUJKcWFpRUg0RjVWaDFrbDBo?=
 =?utf-8?B?Vzc4U1FBK1VCdDRzdWxFSnBpalhoelYyenkwUENLZUllMGUvM3BZWTdSaHY0?=
 =?utf-8?B?clhGMUJHUVA3QUpoVHQzRGxSV2tTQXFSTi8wdnlzbUQ3Qk1VWUl3UVNqNFZG?=
 =?utf-8?B?MXlDWnloTFRtMlVoM0ZUdnNiRkdnc2xDdUp1TFFETG4rRVVxbFhQUDRrMjFk?=
 =?utf-8?B?UXgrQW1lSnowSFprSHhyRE9XQ0ZQK00vb2taVUo3dksyUXZBUTlvQURaOXlt?=
 =?utf-8?B?RGM4OGZYbC83eXcyYmw3NzhUcUovaWdtWDFBSlUrbGVscHBFbWc4RW5xaEdY?=
 =?utf-8?B?Q3FmTlRRTGl6M2pXazJaUmFEbXV4K0YwNnQwSWtIaGt2U1RaUTdpNzJ0dXQ0?=
 =?utf-8?B?UW5Sd3hRN0hHMVByejgycDNNZStnaWIxbE5NZWxpc2Y1UzNSUVc2ZG5NOTV2?=
 =?utf-8?B?dWdNSEwyV3dsbEtFNTM3SEQ4S2VoVW5rQWdMcktXMnBWeUljMTVEQVFSZ2FL?=
 =?utf-8?B?bFNFc2hXa1JPNm9pekkvdGhwbzJhQkpTNDVIKzViaHRzVGU4dnhwdVliQ1lo?=
 =?utf-8?B?bTE3K0c1TDAxTDNVdC9EcG0xWFBaWHRibTNsRzZHQ25IYWdaMFRTckxWam9U?=
 =?utf-8?B?VURwNzc1b1o1bjA1ZG5vc1l5aFhwRUUyYzFTQVkzTWNQMHd1UmZpWlQySHF6?=
 =?utf-8?B?R0d3WHNGZmJoYVNCY25sNk4xaHlZWTFXTDRIeWZ5M0trb3JEaG1Cakp1aVR2?=
 =?utf-8?B?UHRmOGIwVG1OZTAxVTV0N2dsbE51OS90SDdyYk5JL3pseCtUL3EwZTE3algx?=
 =?utf-8?B?MWlCa1dqOFl5K1NOT0hubUdMa3k3aGhualpEUWlFR3VvNmMrT0xtVHZUZm9K?=
 =?utf-8?B?MyswaEtJOGFhVnM3UFUxRGc2am5FdVk2K3RLVWFjQ2szcHpFbTRaYXg5aG9v?=
 =?utf-8?B?d0c3SFZIemtTaW9sWEhkcDQrUVZrYzBSZUYrZXJWWXBSa2lnTUhRMzJXV2hn?=
 =?utf-8?B?VWxWT3BhOXd2UEQ2S3ZJUFRxeGJLNHc5dWkxK0RrYkRuS3ZsRm1ocmJLemJJ?=
 =?utf-8?B?ZUdIWFBpK0wwUWR3RzdDdHFUamhkckNCWkhLekhVK0tZT2p3SWtoeURva0tk?=
 =?utf-8?Q?KMl0bBMKxd7SDrtwYM5WVjBPO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b276af1-c921-487f-f6d9-08dc9a98d805
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:14:03.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onZamyVQE+0SH389f3iRs6UhxsdQNScjs4depfIaqR2Vx+6gRqzGqbLByYYvUBTeFgF4G2FFC9+Welci9SbtNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456

On 7/2/2024 3:06, Shyam Sundar S K wrote:
> At present, the PMF driver employs custom system state codes to update
> system states. It is recommended to replace these with existing input
> event codes (KEY_SLEEP, KEY_SUSPEND, and KEY_SCREENLOCK) to align system
> updates with the PMF-TA output actions.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/pmf.h    |  2 +
>   drivers/platform/x86/amd/pmf/tee-if.c | 62 +++++++++++++++++++++------
>   2 files changed, 52 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index eeedd0c0395a..753d5662c080 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>   #define PMF_H
>   
>   #include <linux/acpi.h>
> +#include <linux/input.h>
>   #include <linux/platform_profile.h>
>   
>   #define POLICY_BUF_MAX_SZ		0x4b000
> @@ -300,6 +301,7 @@ struct amd_pmf_dev {
>   	void __iomem *policy_base;
>   	bool smart_pc_enabled;
>   	u16 pmf_if_version;
> +	struct input_dev *pmf_idev;
>   };
>   
>   struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index b438de4d6bfc..b0449f912048 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -62,18 +62,12 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>   	param[0].u.memref.shm_offs = 0;
>   }
>   
> -static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
> +static void amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>   {
> -	char *envp[2] = {};
> -
> -	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
> -	if (!envp[0])
> -		return -EINVAL;
> -
> -	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
> -
> -	kfree(envp[0]);
> -	return 0;
> +	input_report_key(dev->pmf_idev, event, 1); /* key press */
> +	input_sync(dev->pmf_idev);
> +	input_report_key(dev->pmf_idev, event, 0); /* key release */
> +	input_sync(dev->pmf_idev);
>   }
>   
>   static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> @@ -149,7 +143,20 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>   			break;
>   
>   		case PMF_POLICY_SYSTEM_STATE:
> -			amd_pmf_update_uevents(dev, val);
> +			switch (val) {
> +			case 0:
> +				amd_pmf_update_uevents(dev, KEY_SLEEP);
> +				break;
> +			case 1:
> +				amd_pmf_update_uevents(dev, KEY_SUSPEND);
> +				break;
> +			case 2:
> +				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
> +				break;
> +			default:
> +				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
> +			}
> +
>   			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
>   				amd_pmf_uevent_as_str(val));
>   			break;
> @@ -368,6 +375,30 @@ static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
>   	return rc;
>   }
>   
> +static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
> +{
> +	int err;
> +
> +	dev->pmf_idev = devm_input_allocate_device(dev->dev);
> +	if (!dev->pmf_idev)
> +		return -ENOMEM;
> +
> +	dev->pmf_idev->name = "PMF-TA output events";
> +	dev->pmf_idev->phys = "amd-pmf/input0";
> +
> +	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
> +	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
> +	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
> +
> +	err = input_register_device(dev->pmf_idev);
> +	if (err) {
> +		dev_err(dev->dev, "Failed to register input device: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>   static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>   {
>   	u32 size;
> @@ -475,6 +506,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   	if (pb_side_load)
>   		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>   
> +	ret = amd_pmf_register_input_device(dev);
> +	if (ret)
> +		goto error;
> +
>   	return 0;
>   
>   error:
> @@ -488,6 +523,9 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>   	if (pb_side_load && dev->esbin)
>   		amd_pmf_remove_pb(dev);
>   
> +	if (dev->pmf_idev)
> +		input_unregister_device(dev->pmf_idev);
> +
>   	cancel_delayed_work_sync(&dev->pb_work);
>   	kfree(dev->prev_data);
>   	dev->prev_data = NULL;

