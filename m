Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37A224AE8
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761497354; cv=fail; b=u7VPflHGsOz+H4ll4Dg9uo7eVamto1rvbEZ8gTwdHsq8lnrLMXv/41r6ZG9CwnK+q0BQ4gJG2YOlVPbEwfWAAKg4u2RwV/drPJ2rpXQr55AxRPm7917JkI2D2v5qmIuyo7SzwlZRvc4WTvRpMQlRMxctI2WbO708LRTqrNx/Ei4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761497354; c=relaxed/simple;
	bh=0VmcZqmsHvxAnMiEZ2v4TnoVzL90mTrcQmvnnpKN3vk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R7hwB1CVBqFZbKRn7cKkm5GbU2RxPcphiUMGpQ1ylvh8pzVFh5hguHYQiQSaiJm1CeCYvZi+E41xVx9CmdqMl/j6kmixEWZTwj29ggqRcL+0jbfDwesiZOy45xxnYzodn9EO66BONa4smTioN9idH87Sb0l2u4QVQ6OlnCYsdmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gxbj6RKf; arc=fail smtp.client-ip=40.93.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gxbj6RKf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRCuhIP5O2Qq/pqqvM/mwrByzOEizTKCLm0ZgFLwjKPTqZvsvwvbVr1CUuv2qaGeaeqbXsR1DJXGrZf0tMBBrAnzHbDPerSh8/a19k6zY/ighN0XSHc5dzz0lRPqX/mZVLKXt0FPXJwlj0w8VNukiU6P/Onjqx7NjhrjsrDZCNwxPRSfxkLTmeAw1MmEbtKl0fMctNeUOtaP8/I43inUItOkt0bmD9e2a+1BH2eSQW+hZw1jW/5N7QXDrbtdnhvGGVIro0N8Svom8sYrXbC8NlcENIYg3/Jz928EF9UjdReUlwF3eWLbtdHQvUkahoktfDx3qcjYEFQBAzvYy3rl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wkp5opts2/WBGb1/Vyf5w8jDrcEY6g9p0QvUOnNbI4=;
 b=vCNe7r9tMdP/ILkG21FpTZm1E90FEEERMmpMODIu2fblTVXjeeVjbEaUqr9Ov7XsrpDPhpF3rIqvnAAxnm9c9kCfA94Dk2oVQLMR/6ZMOcDSWs+aP6WeOwVDb2XKJJwqjWC5KGfk6EPlNieiWJny3FcV6t4XDp4+OooRh4wwCp67zAat6xH531/F8QtOgkQpPpRyUrM1+J/ovzucqj20F4t+2yiW1etktKX8Pv3OZm6BXMma7A37UYq9myEDr8Ubfo0ZLv3/ru8BbmP3kwAzTJE6EDXxyGmjFUyNp1husz4dBkhUpdnGx45byoHNnLid8YCz/fqFIpV5FYIvJEm9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wkp5opts2/WBGb1/Vyf5w8jDrcEY6g9p0QvUOnNbI4=;
 b=gxbj6RKfUMMmxtKnEIclqP031qzD0awpK22OrnGmTMdVoImQOb8Jg/pVYmqM6Zn96wNdT8pK0NG0qMsr9+2AcZ+XneMkpFtW8XzB0ybP6aB2kZY2esDMeijKp7t8obAP8FozD4X/f86/Y74xTBug9vFQXm13jr43RF0SPwn+dWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Sun, 26 Oct
 2025 16:49:10 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9253.013; Sun, 26 Oct 2025
 16:49:10 +0000
Message-ID: <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
Date: Sun, 26 Oct 2025 22:19:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::23) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4237:EE_
X-MS-Office365-Filtering-Correlation-Id: 99237d40-0a76-43a5-8170-08de14af9608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUdSYnpaRFZXMjJsK2oxK0lGWlN0TmpsU09TcjlSNzhGZU9CNzIxRmQzRFlm?=
 =?utf-8?B?ZFV6Q1BqR1FWdVFxVXpPek5aaWNtdWh3bG5mNWwwNWdvQ0JLSjFIZzQySVor?=
 =?utf-8?B?MFZUSVZTZ21YOS81aDhEcVN3eVpmVlNWL2NqS2E5NmdjU1UwSU00VTF1cFlO?=
 =?utf-8?B?dmVkMjdUaGtwL0hJUUtHTm1kdkZMZUZCUG55SWZFN3NvZldxb1k2a1IrNDNo?=
 =?utf-8?B?d0g4Zndvd081K2FESlczZkNGdWhCU05YTnRPVTR4c0hXR0xoVjc5VnZUR1o0?=
 =?utf-8?B?eFlnQ2lJOEN4ZzhGaUdpQ09nRkt3MWErbWlKaWVoUGpZeDJlK0VKZXd0WEN4?=
 =?utf-8?B?UWhkOVhVT3ZWbDZxc0FKUWQvWEZoUExKcVhJeHIwZ055c2RDQm9XNDJ1cFNW?=
 =?utf-8?B?U3Y1YTdCTDJEcVVaTENHWDY2aUx2NzZhNnFUVVo4MWdvb2FzSnhRQTRKdUhm?=
 =?utf-8?B?cis5c3VVa01GNVNtWkwrZnZIRk0zaHNNWXY0TVV1cEEydVVHSlZvc0ZUcUpl?=
 =?utf-8?B?eFEzejdYR05hOURmSjZNWVJrMERjRmN2WFBNMDFKN24vZUR6YU96RlFkQk5T?=
 =?utf-8?B?aUdjTThRa0swN0VXdEJaRkIrTVhFZ0xBa0Z4MDIvOFFsTkhnZnNrdVpnWXE1?=
 =?utf-8?B?MnRGNU83SVNRUXZTcEFHT3VFV0ViTElVWUtpcnI3bUx6NGNWbUs0Z29MOFdr?=
 =?utf-8?B?TmNCQXZraVZLS0RqUWd3Z3ZaRko5akwvR1R5UzJmVmhvRVpmNUFXbUtGSnF3?=
 =?utf-8?B?SmhQQXU1RGx2b3IweTlQR0NRelRGaVM3NzVYMFU4bzBGZWRXTlFYNFBiSjRr?=
 =?utf-8?B?T3NGOVRZZ05zb0VBMzFjWnB0M3A3bjROc1pWeDJlOXk3UGd5WXp3cHB2dlFE?=
 =?utf-8?B?NlZNQ1pzQXMvSEFrWmVxcFFHQUxMWGliLzNycUhJRmdQQlpCTzhBdmdPV0d6?=
 =?utf-8?B?em5QMnd2MEhFSFhEZ3FpYm1oWjZ3Unl0WHZWckgrUzN0Y09FMVcwbkxVclll?=
 =?utf-8?B?YkhKejlHL3pCSURQRXRHRVVCZ0NxSnB1WXdIYnVpU2xMa3ZJYVJnWXdaMlVq?=
 =?utf-8?B?RG5SSmtNUHlRR3lrS1FXczh2dGRYVjJ3YXRkSDQ5U3dWRWZpRGxGNk1DWk1o?=
 =?utf-8?B?QmsrajJYMitmTmFjdHIxdkRMd1JSTGFzOEhwTFg4VWJ2eTBrVkR3eUNEbnBx?=
 =?utf-8?B?bTBxUlJOTkdWZkRaODNXbFAya1FRVk5DKy8wSDFFTDByNi8xaGN6WHJjSGQ3?=
 =?utf-8?B?ekFVL015TzU4Qkg4MWtBYzlSUlkvTVg0Nm1lNnR6S25TRVpFcGh2QmRCblpa?=
 =?utf-8?B?dTRrbk9KZkw4NHRXeTY3YUdhQW9wbU1UL0hNQ3N4dUtLZ1JtazhZelUxK0Zz?=
 =?utf-8?B?K2pTMzZBVjVFZ0xlZG5TWXNWWW9KMjZJRi9sWEc5c0JyR3BKbUFTN3QzS1Q1?=
 =?utf-8?B?ODFDNTgrbW1TNzJKYy9DRDA3RUxDMXN5ZVRQMmNXeThKOWFHZWs2SFJlUm5u?=
 =?utf-8?B?RnJLR1Axb3J2Q2NjbkpnbkE4SmlldkROMGd3SHgrWG5id1FHYmJ6bmZEdmxo?=
 =?utf-8?B?MXVMemMraUxHaGIyNzJzeWdUVFQyNzlCRlp2WG1xdWdocGFINEY2V2xnNjdQ?=
 =?utf-8?B?T0EzN1ZqK0FGYVY4S21pbmNUQXhncHYwQnhZMCtSaVVEWW5WT0ZUSGJkdzFE?=
 =?utf-8?B?R1NsSFgrN2F3cGdhTSszV2h5MU9KL2tyMjFrSDVSVkQ1eWU5T054Zk96T002?=
 =?utf-8?B?VFVFbFQremRIMXM4KzdUNzNsZDZKZXA1c1FhVEZvNExWY1AzMTU2RTBNa2s2?=
 =?utf-8?B?aU8rU0krZlg2YVBhaDRyU0EvWEZsekhJaHVvMkFDOXlpWkFBU2hRNmJZSGZT?=
 =?utf-8?B?T3dVMUxrVGRKb2RGczRYZitCSVRGWnhCSjJhRitia2FzTk0wakE3RWE3L3dt?=
 =?utf-8?B?V3cxZm9CVHhOSGRtWnBhM0dhWERnUlM1OXlENGtQZW53alc1bEs4TVUzSmMr?=
 =?utf-8?B?cDNoQnk3aHJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlFaVmR2UG5yN1FvZGtOZE1DeTJCeWxaa0daMUZjWDduKzZpNFBVdFZCZ09x?=
 =?utf-8?B?c2hMVythKzJybU1rUzVOc3RBb1FvSHdNUzNWK3M1eFplL3E0Vm1NMFYwc0Jy?=
 =?utf-8?B?a2dmbkxIL0VHL2tlVFRGbm1VWDRyUDJLdWpoTGtsMUhNWnRQZCs4ZVQyTFJo?=
 =?utf-8?B?b2JaSkF3N1dmYWM1RkpEOXZoTi9RclR3Q2lBWjYwVVV6Z3YvZHlmdnlaL3RX?=
 =?utf-8?B?TXYxdlVHRW9OTkF3WGxJQmtEdnkyY00vVVpVVytta2ZoeTNneGRDbEpjekYv?=
 =?utf-8?B?TExQNy9OViszSlkzV3V5YkFwYUhkbWhuL3VKQ09haGw0ZHQvTXJCQVNoajVC?=
 =?utf-8?B?c1NzRkcyYVBURDhkUHpDQTQvRDNkQmVWQUZRdjljcGpwKzBEelBsT0dpK0lX?=
 =?utf-8?B?ZGlPR2NhNXBYbGtRRGxIaXhpcXdNa3J4ZzhOYmU5VFV5NE5Zdmo5Z3hzaWtU?=
 =?utf-8?B?c3lJMUkvVGkwN0xkK2xzenYxWVJBSmpJZHBvbDN4ZVF5R1Z3b0xEWTFweWQw?=
 =?utf-8?B?cnhJbG5sQWoxVUF1T2dqeFhvTll1a0t3a0ExUGRrM09jUi95aDQ3VXVFZVlz?=
 =?utf-8?B?YmI0R3NsOWJQZ0dIRy9va3FZeGI1U29UMEVVUGpxRzFSSnJybWVWeDFqbU1K?=
 =?utf-8?B?WTdFeEtOaUhpVy9tR1Vyd2ZFQ3k4SEhzYlQ1dTlHZFJVcGR5dmVrSm96Z0hs?=
 =?utf-8?B?NFU5Z1F2QTFsdUczUTZOU2dLREdHOVdBTjg0d3h0ZjlyeGVrVDRSS24yZWVk?=
 =?utf-8?B?aURqcGswOGxFTVFVL2thMzMyWmZZRHdOWUZJYW5tUjlZdzVwMHhDN2NsUnBt?=
 =?utf-8?B?aVB0S3prN0JERWhNSXlnd2dHZjBEZE9oZnZLbGlPVFVzWkljYzBoVVMvZlJC?=
 =?utf-8?B?YnNBNW5JaXJpbisrM0xDZzRVSXErd1FRWXhhK3B3Nzh4QVl2Qmpoak5acHJn?=
 =?utf-8?B?KzJuVTU1S2RtdXBzVEJyZEg0YlgwTmVleVFCM1ovWHJMREJyYml4RndiZ0Jn?=
 =?utf-8?B?TEh4ZmZDRGlxbmIvcG5ZUlRjTmlVcjk5eDB0VE9Ub1FkUXZHN0E2R042TGdN?=
 =?utf-8?B?TTFMZVF1UmxocUkxZm1rNjNkOHZvelllTitCbjI2ZDlvVWM4YVZRalFyR2RF?=
 =?utf-8?B?dE5rL3p4WTArMjZzTlhaYnp4UTJrUGJEdVhCMjBBWUFrKy92RXI4eFJNa0My?=
 =?utf-8?B?cmNWYUdoMnJEamw3d1kremxxNkRMYld0RXFXdjNnOTE4bWNKcjFEbXhnS2lM?=
 =?utf-8?B?U2VoMU1LVUc4Z1ppcVdjeHNnR0dxVWdLY29JM0puY2xUdU9TMm40eURRd2pp?=
 =?utf-8?B?dVhTMWV3RC96aC9nR0syNUFOenJUZW1JOHhTeE4xVHVkcXhYRWdPdEtYZWZv?=
 =?utf-8?B?OEUxOVRraVVWdUtmakcrUy80emw2UFRGdkZJSTJ0Y0JTeXJPaktJQldSN0Iv?=
 =?utf-8?B?dmpwQnkzM01SSHZCQjZYL2ZaN296WWJ2endsTnNPaVYxSENwdmtnYUJ0TGwz?=
 =?utf-8?B?QWZXUXVGUVZ4V05QOFp4c0dPUlZJcWNOdnlXZU9Xb2R5aUtqSm1Ea1J3bitQ?=
 =?utf-8?B?TmVJMkFQUjhZcVkvTmhRV0FFc3c3Mmo1cDdrYk9MQXRXaHM5NlB2Y0RVQjFP?=
 =?utf-8?B?TzQ1TzVHS1pkcUE0VXRkeVVsckl5Y1JjMlYrODVWOGNGL0JLOWViZTR4ZVpH?=
 =?utf-8?B?eEZZNlRicWFNWThYNUt4L0FDK3RQS1A4enQ2bGdJWXFTTFU0a0luazFCOTEx?=
 =?utf-8?B?d2NCdVNvSFdIazNDbUo4K1krTkpETlVTODZwaWZWVzllaEVmbFRUU2ZIUW5O?=
 =?utf-8?B?ZHkxYk93UVU5OThaNitOYTQyWWY1cklOMXoyVk0vYzBoRkx3RTQrT0YvQVFn?=
 =?utf-8?B?ODFlaVdYeGNrMTRwU3dWOUdtMG43NE5uWGE1SnlKTmR0aVNqYkJOSXNERmNa?=
 =?utf-8?B?SXorQWhjM1RMUUx6Z3NKLzZHYWkrc25zZHdjZTV1SFJ4dzMrOUdVNVcydkZa?=
 =?utf-8?B?aTBHMFMwSmQ4S2RCaEVDQyt4S0lVZDdoeWhiR0Y3U1FDa1V4akRjMVRwOHlG?=
 =?utf-8?B?QkY4eW95dUlGQjc5Yzk0QzJndmltakw5ZXYwRzFQWEJyQlBUak5uUEhOVXZ3?=
 =?utf-8?Q?NUBurhha6RQMGEvjAHDBe3GgF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99237d40-0a76-43a5-8170-08de14af9608
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 16:49:10.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/oyYrRR+aW2sqlp0oBYLc7Rjq8iHC3kaUS0djiCwRjNpGTFXBqI/OYpRlKikLmqYhQWB3ihFpkpLZSoxbCapA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237

+ Mario

On 10/26/2025 22:16, Lars Francke wrote:
> Hi,
> 
> thank you Mario for the super quick response.
> It arrived so fast I missed it.
> 
> On Sun, Oct 26, 2025 at 3:17 PM Shyam Sundar S K
> <Shyam-sundar.S-k@amd.com> wrote:
>>> After resuming from hibernation I get this log line once a second:
>>>   amd-pmf AMDI0105:00: TEE enact cmd failed. err: ffff000e, ret:0
>>
>> Can you please share full dmesg log? Perhaps with both ccp and amd_tee
>> drivers enabled with dynamic debug.
> 
> I have (with AI help, but reviewed manually) created a shell script to
> collect the necessary information. I have attached the full dmesg file
> to this mail but am not sure if that is proper etiquette here?
> 
> I put up the script & more debug information in a dedicated
> repository: https://github.com/lfrancke/amd-pmf-hibernate/tree/main
> 
>>> Right after hibernation and before the first of those errors I get:
>>>   ccp 0000:c3:00.2: tee: command 0x5 timed out, disabling PSP
>>>
>>> On boot it looks good:
>>>   ccp 0000:c3:00.2: psp enabled
>>
>> Do you see this message after hibernation exit?
> 
> Yes. On a fresh boot it works without issues but after the first
> hibernate I get these.
> 
> 
>>> Commit 11e298f3548a6fe5e6ad78f811abfba15e6ebbc1 from 2024 has
>>> more or less exactly my error message but it doesn't seem
>>> to be fixed for this case.
>>> https://lore.kernel.org/all/20240216064112.962582-2-Shyam-sundar.S-k@amd.com/
>>
>> This was a case fixed for S2Idle cases, but I seem to understand that
>> you are attempting hibernate here, right?
> 
> Correct. I use hibernate.
> 
> The issue I'm really trying to debug is a separate one (I'll report
> separately): Hibernate doesn't reliably turn off the laptop. Image is
> being written successfully but I have to press the power button for
> 4s.
> 
>> If yes, can you switch to S2Idle or S3 and see there are no errors?
> 
> "suspend" works fine. I do not see the issue there, only after hibernate.
> 
> I hope that helps?
> 
> Thanks for looking into it!
> Cheers,
> Lars

