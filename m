Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6150E471CE8
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001484; cv=fail; b=KxxrBcnQCdSMZH755bfJjqNtqQWZbok6ljq76sTvltv5by66TetEgKblSh9DHLro2bHedfu/kzx3Jz8r0Zk6tyHg+Pzz8xwBI19f6EMfL3OgivCib23zxwFBmdsH2OqIXV6h+6DJdD41gRh9PHAvQ0OM+St9QJr8RDOt4i6HkOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001484; c=relaxed/simple;
	bh=P6vdFKa6N7PBRWJFNpgwOV7NQY7OD6DkLACV/ewhbvY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MMvy8NgF3hX3bY/oisaK3Rb2ZkG3jjKnCevfiUgORXntI20YtuIkuLmBT2lQxN3BHw0fx/N3rSwGl0JcJcQS7NqOBCEnojicN1g5GCGtdwt9iVw9A+VyvZK6eTfhnMikvD3+F2D0hO4bp4/UsbMUzgQmaq2IFcphXt5Pbk3byiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pALbZKdh; arc=fail smtp.client-ip=40.107.209.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pALbZKdh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjBStoM5+84pPI1k+qjjRV/qcofHTJa9HjUaSBKYpUjQeZ1BhRjlG1ad7EG645ohxB8cLqFfvfk/MlKRhkuxIkK4gKZEUQLujjwV+kb6USl87X8V2gIGpG92K/xnPtHqq9KuvyosbrRAoOpwDpvawQHuFFUn5tRxxjKoBxDRfSBJRRJVVMa55AwI5Ng1P1F6AwAJDz/6nJ1z3zgx7owt7JttvZ8p24whIVi4kLYkCNx6xi1UwGGFswceNFm3KjSGr/wVMJr9SV7r0vDDp4YWl++jEY6+Wa1jc9RHX59X7venJaMzNJ4UoRJcXMxtXKbkKvQno8hT/nD1DTPalI/xaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8eVKxN3iXR0pIYOrRvb6mG1DM4+/0WkL0wvwSjtoqA=;
 b=f3KJkaR0LtMNvA1ZAg3SqxEXNLXOfOFWger4X2rXGKDV1Eq5C+t12pAZvYZje93lh6Ly0Pv1ohnhn7E08Qr+1FOjli+mwEl6ZXKrtPtn+PPJhl1hMkwi/onh96HZ4L2iMABs20R6ICwDpW7/L3nf8NaUFLzOBC8hDEmQjGchc2hyGKnl9s/DG25US9PFtIbxC9RukkwsOb5NXw3aQw32fN9WMVvt62Jk53MjWJ5NBlOTSQ1xUW7I5PzRCjwBQ25WXf29Ho/tlpvaDkXFd9+6lzcJYKIOBpA9L2gZr2eydLFy3K3zSNAeXMMy+cO4hw3g2AA1dGU57PlmdLm96q908A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8eVKxN3iXR0pIYOrRvb6mG1DM4+/0WkL0wvwSjtoqA=;
 b=pALbZKdhmISRLr5rfe3Q9bJc1dTgp5Yn4a1t2hkjjuWk3TYslV+0W30b4NDlc8+hxDz5YuzIKX+gIvM67hJxeDbf2Kd5R9kC6wY0NuKGvZtDyE2WHiVlg5z3ByQJAB+qrNWsUcfAIZNR5YIr+axki0syluRyINZX6eCDxm2082Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS8PR12MB315725.namprd12.prod.outlook.com (2603:10b6:8:447::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:37:59 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:37:59 +0000
Message-ID: <526ac22c-653a-4c5f-8a80-654845c5c3cb@amd.com>
Date: Mon, 21 Sep 2026 09:37:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: System76 Pangolin (Phoenix) needs delay_suspend=1 for working
 s2idle resume
Content-Language: en-US
To: "Dan Z. Bonomo" <d.z.bonomo@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CAAkqa_bGiUUkTC8M5sQVyL3FGwsEBRkcYKhSMRi92gP_1Dq3VA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAAkqa_bGiUUkTC8M5sQVyL3FGwsEBRkcYKhSMRi92gP_1Dq3VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:806:f2::17) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS8PR12MB315725:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e7709c-84cb-4eef-1a46-08df17edeecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	bk+kRuuWcGIRYYt4Iqf2UG+UqUDl0kXonHXYZo3bxlqbun/703DmsAAE+Hp4e9jHvKMThpdpoNkyDQhuQ38NLn0TW3DE1Az9jY7EpUlh15KYvaaS830KY/sqkw+AhzDK3GQ/Kt4VSuC8qGih6r0vF16TUy8nvPKnaT3E+oCTDKS6jBJMfC2RfEtI36uwltbrbd/pmpU4jYnc7ZfnYJH3T5e4V64AC8mjLJRRzyfasH0GPneYM2CYkdu95P2v6Nixq0gVTVfvopPrPm3DCwXYz8sFDqtynglY/6H+iVPsxiAoXC6Gzg/VB8L6/ej/xkZoPDQAeEuCjEMr/JKeG11BF/5lgtmW1ZuHEOxN8VX2lfg7MistN5IBUnBqNPiKSzkKIUKxPocOJ3+3yrxIE+/LeHgYCwFDiJ51EAJrMDKYFpex5dkdv93PbDOfEXS498rtn79ozclkuVRof/XakFxR/vtkw4SOiL89buEpMia6fKQQlX/AQ6IM1SaXbJw072+dXVMv2f0JivpSEFkZGJM8m3CAfJPQmaG1rKR/4o58Q+nWATZzWxXejgcwGkPrSjFUvkEBleV6kjpqYUImuyEthEXgpIj1Lgg4yTf0GSJgDb4U630VPm+/QoC0Z7ZzHpu9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1kxNDNMZjl4TFU3Y01NUjlXSEl0R0RiUXVyMGxuTzRCaUdvN1d5M2diMk5B?=
 =?utf-8?B?cVlWVFZiRXZwWU5vajcxUVk2MnZLckJ5SDZ0VzVqUy9KcWRISVBoek5FMjU1?=
 =?utf-8?B?OGhpNG9uK0xCYnhoY241ZHNZZTZHTkRmeUxuT3RpRDhQWEdRRUxJcFRSRlBa?=
 =?utf-8?B?Y2Q2SEE2UEVrTXIvS205OE93dWdEMVBaQ3REQ1pQRGViM0pmZHlpTTZvcW1L?=
 =?utf-8?B?VC9wNjZNa3luMW1vZWN5N0ZrVktZZWwzQVFPaXVMMnZjcnh6ZXdlT3ZkUXdj?=
 =?utf-8?B?Q1k3SE0zWlVBYXFnL1gzQ1czZEdWWU5EQnVtY2tXZE9kSlNRVjAxY3htZWl3?=
 =?utf-8?B?U1RHb3Z5MG9HZmNIcC9lR0FYTVQrbUV5dW5wdm9KMnlIQ1VCVDBDZlJRTWh6?=
 =?utf-8?B?V015emI2eGhadmxPbjFQQVdTVTJPS0JMZTBiVGRUOSt2cEp3ZmVGNWhpcmlu?=
 =?utf-8?B?UWRUWTFxb1F3YzVuV1JmdG11aDZqTWxTdlJBaG9MVVdXbC9MQmxKVTd1bVRu?=
 =?utf-8?B?VHZnN2sxZjhJdTVIVkI0WlRDcW02TFprdERiMUJnYzRpbkJsVlRRb3cwaEZK?=
 =?utf-8?B?dDVhTlgzZHhYU1FQdWRaVXBPck9lTXdVRlB1NHEray9ZR01kaHdwM29wajBX?=
 =?utf-8?B?RnJzd255aHB2VHVvQytGcWhYeXhMUWFrOWNnbE5hT3VLTElHN2V3YU5HRld4?=
 =?utf-8?B?YXNtRUp3b2lqWmtmTjhmSVlCWFRVNzE1NWdxRVd3OTYvc2NVWkFjbjJXNUpr?=
 =?utf-8?B?NzZCM09TOEVML0paWnFnLzBpVTA5K3ZzbTNRdUxhMy9UdXVPNk9Jai9wOTgy?=
 =?utf-8?B?R2RLQkNzNmxKS3F2SFkwdFR6dUFHdFZ0UnBJdTYzbnBVc2swc1lTUytxSEhK?=
 =?utf-8?B?RGdpNFMrM1RVZFVvNE1PMVBaR3ExS25pL0tLcVp0N1ZmM2o0akdORGtaZWJY?=
 =?utf-8?B?aE9qZVdiUXpFZHBKSCtQK2ZOY3BZTEpRdU5EWHNWUVovdkhlM016bTJzbGpL?=
 =?utf-8?B?TFBuS2tsdmkvTVhuRnZySFUzSXdpNisvbWo3NVFlRy9mK2RZVnpqZFYreG5X?=
 =?utf-8?B?KzZ1ZnFlYStTVDk2amFwL0dmbW5yWGtFL1lqL201SnluRzhTZFErNWxiQlg2?=
 =?utf-8?B?OHYrZGNWNlFJK29HT1BkUEtwNDVpS21uWkIwOEpsRHJZSU5WOVJrTzVZcW9Z?=
 =?utf-8?B?dzFCTVFoMEh2NXlIV0w2em9tbXpYSFdrZUYrVG5EMEFFS01xbzhxcjBLUXFR?=
 =?utf-8?B?NnRVNFBHZVcvekhtSW9GYU9xc3lKOGliTkViV0phZk1JU044akhxNnNSd05k?=
 =?utf-8?B?eVgzMnFsUXJ2T0cvUjJRR3EwdEU5bklpYlFLY3JDSjNodjZCOCs5OWgwekxZ?=
 =?utf-8?B?U1pXUmNGS25lUHI1Zm1UWVB3cFhmWi9RSnpaTVpyVVpjVGhZbHhrc3BJUzM1?=
 =?utf-8?B?cjgwbXFKcGxxLzJXQ3F1eVlhTkZ2Zkd2d1JYSVZndEdYQjJzN2h4cTE2Z0lQ?=
 =?utf-8?B?THlrL2lTcWdsbVNJYWZVY01QNElKenlWZ3NWcFl2RXNPRlIzWjhqQnRTUWpO?=
 =?utf-8?B?WFgxVUd6c3hvUnp4RHBnMTVUUUo4dXAzK1piemlYZFlZRFhWaUc1K2pVZmYr?=
 =?utf-8?B?SHZqYnEwVDhtNEpoWUd6NWcwOTczVDNITFJXbTFZazNFR2FrT3ZNUlNuL01F?=
 =?utf-8?B?MU96RDJ2VFJ1K1VkcTBPeTA4MmVkZGo4aWMwWVVneWJoUXJ1YnliSVgvRzVW?=
 =?utf-8?B?T1dFMzhFd3czVGhvNlZITmNVS25tQ0RGVnNzdTUrM0puZTV2cmx4YUl2Ympt?=
 =?utf-8?B?alpzUE4ya21hWXdDRkhpWlZtM2VvQjM2KzBOeUQ0MEtDbTJORWtiTWpQRFRK?=
 =?utf-8?B?Z0ozdDd0RkJSL3JqbkhkR1VDa1dURmdDeDFPb1F4RUZjRmROS2d0c01SMlFR?=
 =?utf-8?B?SUxUQ0xrS3NjZkJlakZ4bFdaMG5IZHloVkQrSDIwQmVnaTRKY0VRWTFZdUtt?=
 =?utf-8?B?M1hWTTR5OStBRzRKTW1VYzd6RDBGdXJFSWZyQk5ERVYzSmRva0JjeGtFVmoz?=
 =?utf-8?B?Ui8rZVVXMHlNWnpNcUdSMHZWK1Mya0l0R29XcG4zNlRKVWNDMldvdytKUDBY?=
 =?utf-8?B?N2wwQ1FoaXhCSXhLVXczZ0YxMi80akg5QWxONE81Vyt2TGdDSldpY1B4bzdM?=
 =?utf-8?B?VVdTTnRXVWRaMU0yMEM1MEFvU0xUSDB2cHJvZDJCaTZCcHA2L2M3cll2S3E2?=
 =?utf-8?B?bE9FMnhPMytRSUcwL252ZE93RXFYYzZpZUFQcmduZ2YzSnoyM2NoV2g1OE5H?=
 =?utf-8?Q?Xq/afsyfBbVnjv3yxR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e7709c-84cb-4eef-1a46-08df17edeecb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:37:59.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1aex8ysZrwEAjoOw4IiHVgar6SpJU21AqoY2sMhZ3qsWa9CLFxVq1vucVPg95ddAjBYcHDqjODZA3ET9n3IRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB315725

On 9/20/26 10:14, Dan Z. Bonomo wrote:
> Hey folks,
> 
> I had Claude take a look into why suspend wasn't working for me and it
> ran into a note in the kernel's amd_pmc driver that asked me to report
> this:
> 
> "amd_pmc AMDI0009:00: Delaying suspend by 2.5s because delay_suspend=1.
> If this solves problems on your machine, please report this whole line to:
> platform-driver-x86@vger.kernel.org so it can be automatically detected
> as affected in the future.
> System Vendor: "System76" Product Name: "Pangolin" Product Family: "Phoenix"
> Board Vendor: "System76" Board Name: "Pangolin"
> "
> 
> Here's info on my system:
> 
> Laptop: System76 Pangolin (pang13)
> BIOS: APX928_V00.01_T0008ASY1_ms
> CPU: AMD Ryzen 7 7840U (Phoenix)
> Kernel: 7.1.5-76070105-generic (Pop!_OS 24.04)
> Sleep mode**: s2idle only (no S3 available)
> 
> A summary of the problem:
> 
> Without `delay_suspend=1`, suspending via s2idle results in the system becoming
> completely unresponsive on resume. The power button (short press), lid
> switch, and
> keyboard produce no wake event. The only recovery is a 10-second power
> button hold
> (hard power-off).
> 
> This also manifested as a secondary symptom: rapid suspend/resume
> cycling when the
> lid was closed. The system would suspend, wake spuriously (EC in a
> broken state),
> see the lid closed, re-suspend, and repeat — causing the screen to
> flicker on and
> off in a loop and draining the battery.
> 
> 
> The fix I applied:
> echo 'options amd_pmc delay_suspend=1' > /etc/modprobe.d/amd-pmc-fix.conf
> update-initramfs -u
> 
> So far so good, it seems to have fixed the suspend issue and I haven't
> seen it stuck in a monitor off-on loop since then either.
> 
> Hopefully this helps smooth things over for other Pangolin owners out there!
> 
> Thanks a lot,
> 
> Dan Bonomo

Before going down this path, can you please try using this patch instead?

https://lore.kernel.org/platform-driver-x86/20260914141734.2703545-1-mario.limonciello@amd.com/
