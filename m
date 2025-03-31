Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68681215062
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Mar 2025 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743443374; cv=fail; b=YbrL97K1nupReBI/PxXcJadJhRASAf6EnAfNC9cbkrvx5vEJulHCL/D6OOEcbdwoAd6x7+NpySeqL2DZQB8qZvhGeaM22XiQQ/bPUSg5bm9LrIcgBDRjCv0EiyyPStVU0NYpkEsg4gNtJ3+5Pp7ZDt1SWRIvwHt6nEr3Y80pYMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743443374; c=relaxed/simple;
	bh=6l/w8x41a6FbthVdJsNxYVW6OfX0ktXt9RxqLlLxm1Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jG0xPKeA1L8nXDOeZkZkbPmQwWZpz4vEBQTgtqCyo6WLOWOrhF4tAQJtLPtiAiAa33Sa4w1nSe6KEdzo45sSELP410BZ84eoThiwkgOAQIKvnJa4yKqRHnz7fUOoDZff16CufV/1Xq3ymep7KRaYoKdy2warWzUk3HTflOrzOdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DLwVHhQw; arc=fail smtp.client-ip=40.107.244.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DLwVHhQw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDJDIyV5J0y1IqRiqD704vZaJqc4yuJTW/LhDLWz3Inhz3FrhvBNZyX+MOQ+Z3vE7lsAaURYU8jUOMOImkFNLmO30fWfWKSccZyfhPVdhrRo1GTjXxrAJEifVRvIgPQho5sdaUiQd3Wm/aqaV9UUyg6pxfXDyEWqu4MwO6BksVK0qgBFFwb8fPbwW0TNWojXxzQaVYV7MLqXZ2gzPXRj+NEAibVV0keGayYoLQpYVXyTFtY1/fQ+gEyH/Ze45sfcMCgXMut9XKkUjKBbKCGs6WdRFepzfa1WCAsuQNOU+Z2b9I70Kzet9G/7PJblzOUdrmZvmw6NI7v3asnElo87MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utYMOMTcYt45FlryGcUmXnQCT1N84ildYixzDtD8dac=;
 b=lU6Z983jUiOvjdTiZib6ZCNJ6H8iymu5CTRsOEpPmFS6MEzWpvWIjY2VHUubnfdDpGGCApVqeYmS4mZmiYVzbblBLC3NymcGnuHcmLULQHHbxpJFTECooFQ7leeIfPSs/Zm2W0OyP4HmE/33aN+u0YLaUPJOFvAh2sW1AI1s2Yrwv2qU7stu/B89TSokR4cSSV8KtIsQ71GvSrfIm9ymhsYNn86pnbycjXueW/DP5JLjoEQVyrGLm0VHRzlfmmr25YPXgqKuKOVjtVgXKKILRpMC91ZIBBTAq/og3R7tXPnOo8bVz4SilpRfA+GwlUHCPvo/t3C9o4qU0JecTzd7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utYMOMTcYt45FlryGcUmXnQCT1N84ildYixzDtD8dac=;
 b=DLwVHhQwINC9ZcWOYRsAX3FsvGXNYtPKtKGLGSr5uh26WzdTOpMYYslPWCMKCafgLeysnhE6YzB+IqFCTEMsKYRJImf/XchkGhYsKaBqoPnxqmWFYWLJ6+z50VPYP+iQl5sj8Nh0lAQRWSQjFDsK4/fv3lBKuqTIBYpQnIw3gBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 17:49:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 17:49:28 +0000
Message-ID: <edc8986d-3414-4bc8-8aeb-9465b148ab35@amd.com>
Date: Mon, 31 Mar 2025 12:49:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: pmf: Use meta + L for screen lock
 command
To: Mario Limonciello <superm1@kernel.org>, Armin Wolf <W_Armin@gmx.de>,
 Shyam-sundar.S-k@amd.com, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20250321193052.2973537-1-superm1@kernel.org>
 <3b7c719f-8aa6-424f-92a0-e2cf05b12ca0@gmx.de>
 <fe47758a-ca42-41b0-92bd-4ac86e1d0a3b@kernel.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <fe47758a-ca42-41b0-92bd-4ac86e1d0a3b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:806:130::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 2703377b-c488-4229-f73c-08dd707c61ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFFveHh3bTIzL3p2NjNRYWZ2alhSQy9zRHA4aFVZM2ZWU08rWWhPMDY4T0R4?=
 =?utf-8?B?TkhqbXFBbDdzcmJ6MGFubitRbkxURlBCSm5qRlJYaFdRTkZidlR0azhSVTNK?=
 =?utf-8?B?M1JuOHlBdWdBMHFuelNvYTZaZUZ3ZHVzNEZUaU1PR0w5VXNVbE5iVGlFTlZC?=
 =?utf-8?B?OXBWVUxUZlltMzc1TUZTalVPN2lxMlFDdkpZSDNSSytRdU5jMWVoQXJuWWZW?=
 =?utf-8?B?NnZRMllXamNXekNkOU8xdWNzQ0FscldkcTBwN0xnZm5kTHd6dFdjMXFySllM?=
 =?utf-8?B?eXFXS3J4S2dKZWJreGNRYkdEOE9CVC81SjlHaFdGUzM0Zm1saGdPRUY3REdY?=
 =?utf-8?B?RUR3RXFQY2NEaUxiYjZVM3pPSzhmWmVoSDdubWVYblJXUnR2S01YOVlWQ3JU?=
 =?utf-8?B?RkVXWXFvaHhTQkk1QTA1bzkzbTVWMG5haGp2ZHZhOG92NTNNWjJoS0l4d3Ex?=
 =?utf-8?B?NVlXdHN5dklGZmFGdnllMnVrbXgxVk9Wb2Z1QXhqMDNsRmNJdFN2R0VsTjN4?=
 =?utf-8?B?bGNIWVMzM1NsVjNRRStHOVlKZXJlSnlTUTFpTkVjK3BscjRUZjBGNDI2UU0z?=
 =?utf-8?B?TUdXUEt2aTBvUm1ScEovVFJOeHNVa001ZGpKR1hLakFTVWNtRUdxZzhlM3Bt?=
 =?utf-8?B?VldLL1EwaUdRczBxdysxMG9VMGVGcWpKYkhpNkk5b2ZVeVJuRnpmRE9udnRl?=
 =?utf-8?B?S21PRjVmdlFudUgyam85K013MUZVNXV6ODdhMGFTSlNabjU4ZDIvbmVnNm9J?=
 =?utf-8?B?RC9ZM1JTcGVIdi96bC9SRjNLazJCZnJLMmZMRmZUS3EvWmRDaHFlbjd3NEdO?=
 =?utf-8?B?YlQ0b1BXN21ZQzk4ckdSejFLTk5FUS9FWWN5WlBnUmZUU3ZVUEpVVklHVDRO?=
 =?utf-8?B?eldKY2ZSRnFFNHFYUlFTOGxTb0FYMGFyRWlGWUVDVktncEVEMitXOHlOMC92?=
 =?utf-8?B?Q25PVUVaZytTSzR3VStQVmRHa2s2UVl6VTczWDIzWk9tbkNrWVB5UEpFRGl6?=
 =?utf-8?B?ZWRjU25XT1BNeVYyRGRMV2VWVGtFMGRHK3B2RldpQmt5ZG1xRXMyT1ViOUhm?=
 =?utf-8?B?VTErREl1QWpoZS9LNDAxNGJkUUlHRUc5c1FPNkJVbmwyeDEybFBrdFVDOHdI?=
 =?utf-8?B?ZlBMdmhsaS9vNTE3NjR4WmIreEUvTEtJMnZ2bitTNFlkV25nekN3Wm8wRmw3?=
 =?utf-8?B?TzVLbEpTUkJCanQ4Yzh4NnNVRWx2Q0ZDUmRXN2U5NlBSdjBnclIzTDJEcnMv?=
 =?utf-8?B?U0ZPU2UxcWlrOExXT1VRL1RsS28yNU8rZEU1QXk2Ymx2Q2NFUVhMZGtsend3?=
 =?utf-8?B?bmthRXRUaHkvdkl1c3Q1VFQ3UDBHRnczVkxrR1hjYksxcjRMNmdHSEUyNDAx?=
 =?utf-8?B?RWlHYnhDV3g4SWp0SXpjRkJ4bjkvYnpjaE9XbXJuWlFveVhTNjdDU2JjcVVE?=
 =?utf-8?B?d1FFcm5Ma3ZuUWFpMDdkczJTUmhpejNyeGU5T1VXRWNOR1lGdmd5UlB0b0hI?=
 =?utf-8?B?bnNCY0V2TUZOT3ZrcEIzSFdqcWxEWjFNVXg2dklWczFoOGhDeUFDYklxL1Zq?=
 =?utf-8?B?QUVadnZ0QWxZV3dwZmpRcnJpTXJLK3MzNE9qbUl0YW5nTklKMjRpUFduM3JF?=
 =?utf-8?B?MW1ZNE5xUjhDakxkZXUzY0FQOEtXQVZBQUJZc09ISVAvWU44cGRnWW9pOGZ2?=
 =?utf-8?B?cTMzN0lvM2R5TkV6RURHbjhwMllvYlBubThBUG4zMytLT25zNTEvNyt0N3JO?=
 =?utf-8?B?TDNYTWZGWUd3dkI1cXRnc3o5QzRNUnFyd1UwZUVnL3J4UmEwbzA4azN6K2FC?=
 =?utf-8?B?d05lTGx4eXFmTktiQndRcWM5TWJEckFiR3RhY28vQktFV3pXd1NOc2NVOW5C?=
 =?utf-8?B?dmN1L2ZTRDBMK0UwR0NOUjR3NjBZeHEzL1lNNXpud2ZKYStzOWkwU0R3U3hX?=
 =?utf-8?Q?YApJ7yGffMc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnBmQVdhTVhYQzBuZkRYOVJJUmFVYmYwV3JMR0RITGFranlCUHpzZkwySWdM?=
 =?utf-8?B?L1dSblpGYVJDQ21nNk5ITkF1N2dvNXlSMzlEb05sMFpoZDBRZndJTzlMczI0?=
 =?utf-8?B?cmVWdDNJOWNUOTVvSjAzclg0UzBQdlZBK3F3b1ZDMjJJUzZOdjB1eHRtUk1u?=
 =?utf-8?B?L2lLNGgzZDlwc0hSSHRvL2xNWXY1UHFRb2hmcTlZRGlUdWRMMlBHdUh1ZlUz?=
 =?utf-8?B?N1hUak5DVXJaVEpianM0VUoyZlZiT2lSTVBpaUFDS1dYaEQzQVBxYjQrVGI2?=
 =?utf-8?B?bFdQNUUycThpNlA0Y3BHT0wza01HcjlmUk9MUG9VWU5LYjV0ZUEyck8yVFY3?=
 =?utf-8?B?NEY4TkJKRFljNDYrZndSMjNVYXFLd3dBYVh6TUpHN1FvaFd3d0t2QmZMcEw2?=
 =?utf-8?B?UVNNbXlTOFk4ZE9uWkZCbVM0d21aZW9sZkI3bkhuNE4zY1RxMC9LYmV0YVE1?=
 =?utf-8?B?T1p4OVJlSGlYcWFSNVZLclR2UENrL0VEN2ZSZHhzSTNUWnEweDA0MkQzK3lG?=
 =?utf-8?B?MmVTZVAzc2hUNVRFUzVZb2lsYnJpRUdqS1hPdkF6Z1JXZXRlU3R5MDRVQy93?=
 =?utf-8?B?ZStJT0RtT3Z0VG9QU2hmWDY0czJqUy9BWXdqNnpDRmhFclRHV0g0ZW1Oei80?=
 =?utf-8?B?OWk3VHBMS1ZjVE1DakovZTFvRnlzRTg3Rng2OERPNEZ1aEZ0dDBCV2JrNFZB?=
 =?utf-8?B?dkFabVpMN2kyeGpVdGZxUFJiOTdrL1IzdGRoN254SVFyUjV5NllJTlFrNlB1?=
 =?utf-8?B?YjVrb1YxeUVtNEpXOVRPYWtRWmxNSFJNQkpIMTRHNkxXTVhYTUtvbWl1V0gr?=
 =?utf-8?B?MUF5REFRR3cxVkFWNE1ncEMrMEpjemgzczN5My9SUDNnNGJ5RExmRkR3YWYr?=
 =?utf-8?B?emhpU1BwY25nUnVJc1JQazFZOEVEL0ZiY2NZVGNGckl6RXcwNVg3dXRSU0Zv?=
 =?utf-8?B?WkRNZXVxSEhVYTQ5cmY4Z1p1SEpteElOUjJkdTRuMUU3VHBXdi9BTDBUR3FZ?=
 =?utf-8?B?cEUxbU9LWG9aY2ZWbFRqbVA0OElYdElKeld6RXE1eHIyUkhhb1hNN21DMTBm?=
 =?utf-8?B?Z3RlU1ErVGxGN1Y0RVU0bytXaDFCNFlmc0UzQWwwTEFmcTlFWklxZ0xZTk9S?=
 =?utf-8?B?UW9kVlBKaml2QklmSXE4Z05FQTkxVHZpem00dW1sd2pVd0dXdUVvelVNN0hp?=
 =?utf-8?B?UzM5cTlFUXdhbVhtNDlOMVl6Ym9GK0JWa050dkFuYkhZNTMvM3VwNHZ4RW1Q?=
 =?utf-8?B?WU1MelY4N05KL0NPa01PeDhxbjVoUUdIUWRteFdTWWlVL1VORXl3Z3JSaXhi?=
 =?utf-8?B?NmhYenU3eTVWUEE3eDJ1czRFeWlIZ0NkamJMUy9GaERUUGIvUHh5V1ZPSjZ6?=
 =?utf-8?B?VWhoWDVxQlpudjB1SSt1NlhTRFcwUStORnlkd2EvUlVpYUF4QnZrQWRKUmtT?=
 =?utf-8?B?U0FrRUhiTmc1WE1aeVBQUlpUWXpxYndRUXkraWFaVzFXZzhmMEF0T3BZZHJ6?=
 =?utf-8?B?bHpnaFl0b25kdGlrQXdCVVcvbVJ4K0drV2ZHMUI2RE1MdkNXL1dCeUJiVDln?=
 =?utf-8?B?T1JkeXFzRHlvUm5PdUhxS25GcnV1RUp3WG94ZVFnazVsL3JKZGYra09ieWFN?=
 =?utf-8?B?NGFJTTU3OSszaU84VXBhVExPQXF3UURLSFh6WDRGV2RkazhzbHkyZXEyUmpt?=
 =?utf-8?B?SUNqMi9nN29IS0toTVlaUXl3dXF3SmxqV2doRWRPY2NYVmxtTFpmY09xWGo2?=
 =?utf-8?B?NkY2S2RESmtENmpsbllyMTBUeVVRWXhJMXlmYWdCTzlZaE1UYVdvbml5QnRZ?=
 =?utf-8?B?WENBa2tiTWZtUGV5MTJOSFJTaklPZGlwUkZ1ZHQ0WHB5U255L0x4TTYyNzFV?=
 =?utf-8?B?YlJtYU9TWFVxL0tiRkcxU3Jlc2tKdjQ5ZU5oUGZ0ck5tSGZBN01wNSt6ZXhQ?=
 =?utf-8?B?eHdrSmVpQmFTQkFKaEVKR1FZZzlrRlQ1dnZBWm5rclAvSCtsZUJRZFhwbGw1?=
 =?utf-8?B?bXpBSDg4bDZrRDhibklUUDZJdFJwWVFJc1k2YXlBR2JaTkNBdTc3UU1Kd04y?=
 =?utf-8?B?cmdjUlhRR1JOeVRueDZIOWpyM1duRWJ0UCtCdXd3cGVyUWZwTHJqYkRxYjht?=
 =?utf-8?Q?Ms5YXhL0/FI5x8HSScGm1myo6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2703377b-c488-4229-f73c-08dd707c61ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 17:49:28.0113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /87T19MSa7c8WNSZGxKi80Zzp96AlgYwPwN5wiFICwBQ9p5GvzbWxkPJDgWpEFAfovq3Dvpd6Z81qF89uELArw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591

On 3/21/2025 5:25 PM, Mario Limonciello wrote:
> 
> 
> On 3/21/25 16:16, Armin Wolf wrote:
>> Am 21.03.25 um 20:30 schrieb Mario Limonciello:
>>
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> In practice userspace software doesn't react to KEY_SCREENLOCK by
>>> default.  So any time that the PMF policies would suggest to lock
>>> the screen (for example from an HPD sensor event) userspace isn't
>>> configured to do it properly.
>>>
>>> However userspace is configured for meta + L as this is the default
>>> in the ecosystem. Adjust the PMF driver to send meta + L.
>>
>> Hi,
>>
>> KEY_SCREENLOCK is used by other drivers too, so it would make sense
>> to instead add support for KEY_SCREENLOCK to the userspace software
>> instead of having this workaround inside the driver.
> 
> Right; that's actually that's the first thing I looked at when I came to 
> this issue.
> 
> I had "expected" GNOME for example to work with KEY_SCREENLOCK, but even 
> when you program it to do so it doesn't work.
> 
> https://gitlab.gnome.org/GNOME/mutter/-/issues/3990
> 
> The ecosystem has moved to META + L.  My last employer (Dell) I remember 
> there was a FN + F key that would issue a screen lock.  It had a 
> silkscreen of a lock symbol.
> How did it work?  Not KEY_SCREENLOCK - it emulated META + L.
> 
> This is what works in Windows, GNOME and KDE.  So I am of the opinion 
> that KEY_SCREENLOCK is likely a dinosaur that doesn't really exist anymore.
> 

FWIW, I found an aftermarket keyboard (Logitech Ergo K860 [1]) that has 
a "lock" key.

It also emits a KEY_LEFTMETA combination when this key is pressed and 
works by default in GNOME as well with no changes.

-event11  DEVICE_ADDED            Logitech ERGO K860 
seat0 default group7  cap:kp left scroll-nat scroll-button

-event11  KEYBOARD_KEY            +4.191s       KEY_LEFTMETA (125) pressed
  event11  KEYBOARD_KEY            +4.231s       *** (-1) pressed
  event11  KEYBOARD_KEY            +4.374s       *** (-1) released
  event11  KEYBOARD_KEY            +4.412s       KEY_LEFTMETA (125) released

[1] https://www.logitech.com/en-us/shop/p/k860-split-ergonomic.920-009166

>>
>> Also please add a comment explaining what meta + L is supposed to 
>> achieve.
>>
> 
> Sure if we can align on doing this I will spin a V2 with a comment 
> better explaining the situation.
> 
>> Thanks,
>> Armin Wolf
>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/platform/x86/amd/pmf/tee-if.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/ 
>>> platform/ x86/amd/pmf/tee-if.c
>>> index 8c88769ea1d87..2c00f2baeec7b 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -151,7 +151,13 @@ static void amd_pmf_apply_policies(struct 
>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>                   amd_pmf_update_uevents(dev, KEY_SUSPEND);
>>>                   break;
>>>               case 2:
>>> -                amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
>>> +                input_report_key(dev->pmf_idev, KEY_LEFTMETA, 1);
>>> +                input_report_key(dev->pmf_idev, KEY_L, 1);
>>> +                input_sync(dev->pmf_idev);
>>> +                input_report_key(dev->pmf_idev, KEY_L, 0);
>>> +                input_sync(dev->pmf_idev);
>>> +                input_report_key(dev->pmf_idev, KEY_LEFTMETA, 0);
>>> +                input_sync(dev->pmf_idev);
>>>                   break;
>>>               default:
>>>                   dev_err(dev->dev, "Invalid PMF policy system state: 
>>> %d\n", val);
>>> @@ -422,8 +428,9 @@ static int amd_pmf_register_input_device(struct 
>>> amd_pmf_dev *dev)
>>>       dev->pmf_idev->phys = "amd-pmf/input0";
>>>
>>>       input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
>>> -    input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
>>>       input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
>>> +    input_set_capability(dev->pmf_idev, EV_KEY, KEY_L);
>>> +    input_set_capability(dev->pmf_idev, EV_KEY, KEY_LEFTMETA);
>>>
>>>       err = input_register_device(dev->pmf_idev);
>>>       if (err) {
> 

