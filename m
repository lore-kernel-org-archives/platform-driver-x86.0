Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D7636999D
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336413; cv=fail; b=RXg7cl7lrv53YUidgJbvUvPcTEQKyW4qQdflSvtsDdSynTxP1JUrhiAUSTnSt72xHsnpjSNiERlcCDTVpMLzzRRX6gBCFopl4VVXWGoVr8YrLtA8ywxas3OFZO31Ob0ngwrFAI9jtM3YEVbFecNtp6TsjLsY4S3gpmsvJ8+sVck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336413; c=relaxed/simple;
	bh=CiXUhYE/FPzUyIOodZASBDzVcBRAVR5YKPXthYdN72A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fVWTSkPariIWfBv5gZmMalrqFxuzGD1bMDVwtrZnfuoER4feyj21ZivJk34mqNgakDiAdxZrHFyDo+pLoZUcnYEkl04LcYvFMxJDDBSqeeH9IYRQ+91c+OveDi7hTY5yXEBqjqQIfu6jwZU1hGu2Qg3O9KPuoFjSUaSWhZOJ/cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EMfouVix; arc=fail smtp.client-ip=40.107.208.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EMfouVix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNkoBWaQXu6cUu+Y7fc6DQracotm3ZibMlv23nLBKr7BdVgW7YmIOdL0R/C2pVnnra5QXlkoDpu6Pys4b/HL4zvgvDL7G4OIXJ+58NUjBiElP+D7HZcstDi+mNQbpuV3Peh87KOTNwXTMt7Y4WxG8bbwndKjSRQu8H747h5YmEm6sD7AT3eDzL0k0FFOCLyt9BfdX0hq507/nTXK3tZ8YscC+C/kPOukrLCd51TzchYTunwammIsiNzNVdbgBvJdSiP7MM9SB2cLtFFDh8W7sZKoE9hlTDsySv+bJi3ihR/Qs8jtZoTBPmFdPPjapJo2TQeHyTP16nJoH4QdSoDBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll3eDqvi1UXQiaDY8iyfQpnOr8WpJfrzSU0XreIz7qY=;
 b=j2nOHALjHbLlhZ1blDVgOxknsHiB8O50QDZoLZKNpoNyQeesK3gXCogGBryZyZOhf5qkF2vHKm6PH+OszngWJO1BnxXnQL999UYdVGq7GFGYtMHukI//sJO5/eJYQhICvmvJmI+HdhUeuWObYKDLnPuRaCq2RoLQsjBRPhyoa6qzk3nF6dvdnxWZSl7++kVxIbaBST0C97WzpNnSKvKVgrcTfYgGS9tQjFnKDobzlRPCz0SgR7FJt4SXeEA/JUvb2ALe/bc6NzXMl/SBeHz2kkbjcG8Kiq0BOR7jE69PAEt4h0GSxQM5moH3KfqfGkvv07bpAI9uT1sKUysDDzmyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll3eDqvi1UXQiaDY8iyfQpnOr8WpJfrzSU0XreIz7qY=;
 b=EMfouVixUx8QgnxcK7eT2+NY0MNgVZU+YADmkB8irGzT+MziN4n1ez6nGbYpCb+RRlYwvTPP214PEOBxhaok6twgszfHHD5cpw/f8czg9B65MDW8RNUFf5tyW9DMT1rPfy7rT03P2dAIzYcBOcZX1clG+0vdOK/BlboLPbwnNZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 SA0PR12MB4464.namprd12.prod.outlook.com (2603:10b6:806:9f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.13; Tue, 17 Feb 2026 13:53:30 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::d87b:2c6a:4793:b4f5]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::d87b:2c6a:4793:b4f5%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 13:53:30 +0000
Message-ID: <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com>
Date: Tue, 17 Feb 2026 07:53:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
To: Paul Kerry <p.kerry@sheffield.ac.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 1127612@bugs.debian.org
Cc: Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <aZMt6sSlpKK_JAdT@monoceros>
 <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:8:55::11) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|SA0PR12MB4464:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1434a0-8b24-4d97-1552-08de6e2bee7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlFrV3VFdnpzVDZ5WktRWU81eUhrMWFndjBzbTNPdDlzRGpDRml2K0NtdkJj?=
 =?utf-8?B?bVFQbXJkRDVWZlFtTHlLd0pJWDhpdWJyYTBzbjhRQ2Zab05HME1wNXh5Skls?=
 =?utf-8?B?VmU3Q2lhSmZib3o1WXhoempHMXNrZDhzQXVWdlVNRU1sYmNCdFVSZTNXaXNn?=
 =?utf-8?B?TnpxZXNCZWthTlYrWVVaODMra3NvNDdlaTZOQ3hrSWZ4YmZJRUtGREJIWnpF?=
 =?utf-8?B?dll0RkxwR2k1MjFuVkpQanh5REtSaU5lUWVoQmNBU3ZmOCtPczhrZ2V2c2NX?=
 =?utf-8?B?dlhVUEpXaFFpdFVQbmRCYTVLMzR2UExNZEJuNjRkSisvYVJSbS90S3RNVTBh?=
 =?utf-8?B?WFVwZFNqMHRYbURpaU1JcWo2MlorWXRvQ00yUzQ0dC9ENWlkTHFtOEVUZFIw?=
 =?utf-8?B?elh3UEo2ZWQwM3VERmZlQWZZWUhyQ1MxWFlSZ28wSk9tVXJXcC9NUXp2dkVD?=
 =?utf-8?B?bDQvTmpGNE1JNS9EZmJRemVBamRKL0doVWkvNjdyVldYeStsRlBiaHh0N2FT?=
 =?utf-8?B?bDllQk95MXBubG93WVg0UE5zT0hleFFYS0hGUG15WlF5M3BXb1czZk03L295?=
 =?utf-8?B?b0h2NzNvcnFmTjJXRTlIUUlNbGVtVitISmk4d2dKQ0ZBQ1NTSkhtVm0zekVO?=
 =?utf-8?B?VkVRV1FZVEczMEU2N05ZZGxoc1NSS0t5MzMrRWczTFMxTDNVbkhidDZEcGta?=
 =?utf-8?B?UGVqOXFJMkRuVjRHZmVTbFlaQnR4STdLTWV5YlZvNW9BN2o5a0N0MVJnRlR3?=
 =?utf-8?B?R2dmMWRmdGtuTU42M2VLTzBSQWJHOHVVOWxZakhEaG9mK2Z1NVBRZ2RhSWt6?=
 =?utf-8?B?R1QySW0xMUZVcjY1S3l5UTdDdnIyb0hSUllNdUFJZWUzbEkvNThzdTl6ZW5y?=
 =?utf-8?B?VnFkbjhFSVVQdUFZdmpnZWt2Qy9uT0tBaC9uTXlxUnZRVk5wQllHSlJ0T3I1?=
 =?utf-8?B?Vm1yOCtoOEFEVVJqc3kyWG9QUFBEOFBTSnlUVkUwOURyN3ZFcW9QNDh2Zlll?=
 =?utf-8?B?TGxGRHhnWUNpNi8vNnBvc3hZKzhsWmIrTTU4VjNXRCs2TkVjc0lSMnAzS3dQ?=
 =?utf-8?B?THR2TnpnVlRQeS8vWnlpZWdQejkySFZSd3lyV21idnpWQWdwUld6QzdNcEs5?=
 =?utf-8?B?dHpBSVkzbCtqV2VsbWU2bTZiNkZhMmRTQ01DM2NranhLaE5meE9QeTBnVnpI?=
 =?utf-8?B?RXJIekNsK0VCQUk2UGhyVkdldjI0VFlDb0dPQWp0UmxDWnl4Tk1BWjQ5b1Nn?=
 =?utf-8?B?WUxXVmJGVTIrQmVaYzc0WXFhbWo4NktmV3lwQXZsQkR1blVHYVg3ZXA5aFBa?=
 =?utf-8?B?VVgyMUNOY2Q2UnU4dzV2NGtFUXhpOVdhaWJXUWJrMldDcHptTGFUanZCdGN0?=
 =?utf-8?B?QUkzVTBrdjQ4bHZiWmRoS2h1ZzJyK3UvZ0JlZzFhYmI5ZDJha1o2SG42Smgv?=
 =?utf-8?B?V2QwTEluYUI0R09VTGhSazltYjJ0SnJGZms0QWtISjlGNWZ3c2tSVFYrdVlI?=
 =?utf-8?B?RktNTmxsMDl0YTg1amgzTU91TE1ycldPRDlHUUJNZktSVW1TWnM1S2NZQit0?=
 =?utf-8?B?NTQ1eUg0ekRTVkpiRTE3aHZENE5NOVFtOXg2YU9hb0lrUXRqQUEybUhmSG8v?=
 =?utf-8?B?NW1nOTEzeURiS2tlWnQydHMvUTBzMGwveS9TUUpad2RyQ1pWYTZ5akYyOGN3?=
 =?utf-8?B?ZHp5MDZNQkNpY0RKNzBKYkRUR2tRVUNsSlBPZHVrV0YrZi9sTStFVTU3YnRs?=
 =?utf-8?B?aUVGUmx5MTVobGJiU2ZnVGtrV0VmV1Zpa3htT3Y5WnhlVmxCaVEvL2lsejNw?=
 =?utf-8?B?ZVkzMnFOTFVQK0h6N0FOdHNuMUczMkFCTGszaUhOQzVnUmVpZDcxRC8xZzlJ?=
 =?utf-8?B?YXc3Q25OY29UZnErcmVyMmg4OTVteG1TYUpLV2UrZ0tIdkU2ZDFrZS9IaTV5?=
 =?utf-8?B?WnJGVUxETm8vaTl6UjVZejVMd1o5YXErWDhLU01RdW9iMDRkYm9CVkd6TGtD?=
 =?utf-8?B?UWpzVWplbDRkZ05zM1NKYzdLc2p2SWFsNDhJQnNrZHB0TUdYUWxtUFJWV0F2?=
 =?utf-8?B?N0IwbU5uTHBJeHFzWnNESWdsTWlMOFpwaG9HZzhINW5QRlVaMk5JdlFyZzFR?=
 =?utf-8?Q?p+7k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzNYa1BSbjQzeDBXZlBsbHVkcHcyQktlMUI1WDhCWHZwVkRTbnNPUm9YV2NV?=
 =?utf-8?B?MzFPTG1sYVdkay90STlPR1VnYld0c0FrL0JVQi9haTBVTDlIbUdOSzZPSGh4?=
 =?utf-8?B?S1BrMGczbGRSZG9PRzRxTnlZWkEzSExnMVYvZUZLTHF5Z3JFWWFENWxURUlr?=
 =?utf-8?B?T2J4SXVNa1UzUk9IUXJuNm5DcStXSm5wUm9YOEp1ajFlcjZYMFM0SXVUTjgw?=
 =?utf-8?B?QWxnbXZWMVMrZlFGbjRFak5BakxPemlxMEkyVUlnditGS21zNEd4VG1VU2RU?=
 =?utf-8?B?Y0VJU3QwUmlweFVNdkw0K09zMFJNU1c5aVhEcnlNcU9rbXA1MlA3Zm10KzFx?=
 =?utf-8?B?eC9mWnBkL3NPdVMxN1ZzZkQ2ZTNvK3FvVWNGRkE1NEJQSnpZbS9ZSzVXYXB4?=
 =?utf-8?B?U0U4bExYKzFqdlpmbmpJeXk4cVEyM2NvZWdLcjl5emd3VDVhNERRaW9iRzVv?=
 =?utf-8?B?TjFJUzk1TDlQUTFHTXhLU2ErTDNTTnVGbm5SYit0TU9uWVVOUmM3NWJSZE16?=
 =?utf-8?B?VUpNaE1GUWxBRGFGVVBobklLcEpCVUM0dThoUUc0d0MzelpseWNibHBJbjRS?=
 =?utf-8?B?cGFFTENibmZtU1hvdGdUMTB5SWRONDFPT0pEZyt1ek1ud0g5aEljNWdFamRL?=
 =?utf-8?B?Tnd1bUtnb3dQOFNuZ1BTTlZyTEZ6cnBMZDhPRlBsVmNxaVROTjBaZ1hiUW94?=
 =?utf-8?B?ZC9KSG5heWRlZ1p4WWQ3YUZtQmVZYmZWYWhNeWtsT1dGZDJ5UVo2U0JEQ1o2?=
 =?utf-8?B?QkdUNDdFekZrNHdTQmVZRnY4RGhDY2ovWjQrK2VtOE4vMFA5SndSV0MvWTgw?=
 =?utf-8?B?ZGZVenlLVURySTVUejFxUmdXZWljVGtYWU5TMFQxYk5kakhqL2hPWGxFSUFm?=
 =?utf-8?B?Z2JVY1A5WTFOWlFnbUdNbWd3S25CN2ZadzJGVDdCM2pYcDMveFFuK08xamNo?=
 =?utf-8?B?Z0gwbXp1b3A2cnZYdTRUcXpsT1NpaDE0NzZ1elQwc2p3aXh2NG1DM0swblFt?=
 =?utf-8?B?V2tqc0VPNHpwVDVpU0VHQSt4bngwM3FrbUtkQVZWWWQrTHZvdWEwbnZqS054?=
 =?utf-8?B?L3BpY0VkVW0rVnVxTmNNMkpLSWFMbUxRYXhsSEN6Ui9oZFJmcVgrMjRIMGRO?=
 =?utf-8?B?c0F6Q2FuZ1hqU2ZDdlIxY1lYM0FkbktleEg3MFpkL1RKOU1oc2sveHdjMjli?=
 =?utf-8?B?YW1BQ1RTMGplaTkwNWpzOUxRR0Q3SWp1by9PWTZhVzB4T0NUMTB1MlRQZjdZ?=
 =?utf-8?B?WjdKeHN3d3hRZS9kT25MRlhBYWJCUU03aGh5MkxEOUpaZnB1Y0krMmtTOGdN?=
 =?utf-8?B?djVlVHU1NUN0c1VwcS9MWU5SREpHa2thTnI4dURrbng3R0VWOUpEWjhzR0Q0?=
 =?utf-8?B?T0E0R01oR0IrU3ZuSzcvNHNEVXFGcWxYNkxFdjJFV3o3SVY0MC9hNG55QkN0?=
 =?utf-8?B?TXFLQVY1dlA1YlRhWE83elQ0YVQ5RTR3QVROUVNaVENneHdSMDZKYmtsY2lt?=
 =?utf-8?B?RmdCVFc1VUpmempWczZPamJpYXNrYWNwUXJEeEpFT3BIRWV6Nm5nQXpBalRO?=
 =?utf-8?B?SUhVczRZdEhTWldMUmd6eVVianZkVjV4VWJWTDNvQWpVbm5HUTY0Zm9BaXFP?=
 =?utf-8?B?WXV2RERmYkhQZXpWUkJnZ1hScWNGUGlGaG1ENEJDbzNvU01wQzJsSmJPN3pF?=
 =?utf-8?B?S3FPajYxbWg5dWFLSjBuUkxxM2xSU0M0YUt1VFI3c3BaVng4MHlPdmVCY1Vz?=
 =?utf-8?B?MjlGNE40ZE51SExtdTkyTmwyb0pFK0VwZTJDcSs0SUx0ZWlTbklaTjR1OVFF?=
 =?utf-8?B?SUdnTVcwQlNBMG1ic1k4TWJMeFdoNGI5OEhvNlIrZzRBOFRBM2lCWGdQTHMr?=
 =?utf-8?B?b3AvWFZaQUo3SzZrc3l1WDFMbjd0dzM5NW80MVNIQXVzN0pNaFBXd2d4akh0?=
 =?utf-8?B?YVluMmlnQjZPVWF2M2hReEtQVU42QjU5WUE0THdSZDJPQW1VaHVYZlFZWWpL?=
 =?utf-8?B?WDJKMHk0YzlyNFFSa2k2MUFPTllaS1pQajYyck56cDhRY0pCOHlrUkQ5VkVJ?=
 =?utf-8?B?L2xCRktYemcrdmsvN3dtci9lbUpnakJXQ281Y2VTUnlPZDQvcnJRT1JuNUVY?=
 =?utf-8?B?Um94a0xDQ0U3YS9UQWE4TXlJT0dHci93L3RGV2l0UDcwVS9icFI5VkcyMlJ4?=
 =?utf-8?B?Q0ZHb1RLMlBsNDQwZXh6dnI0NmwrT09jcXg1TFJCUTFQVU1tcGhsTkdyWlg0?=
 =?utf-8?B?R1JlUmdXeDVtbVZmWGFWMUxTTVJpTCtJREJINzN3VWovTEZkSXRRSjU4WEZU?=
 =?utf-8?Q?ZSk6h+/TZqB/Jf2MIS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1434a0-8b24-4d97-1552-08de6e2bee7b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:53:29.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9qpHl74woUaNSlXwBRruLnlkSSEsD8+EXpBMHEPtLPqzXYJAR+peXJReTot67Gr/9XlHDIu8xprEMcYoSF8bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4464

On 2/16/26 10:18 AM, Paul Kerry wrote:
> 
> Hi Uwe
> 
> Thanks for the reply and information.
> 
> You are correct: when I boot the HP Z2 Tower G9 into the older 
> 6.12.63+deb13-amd64 kernel, the hp_bioscfg module is not loaded which I 
> had not noticed, and running a "modprobe hp_bioscfg" on that older 
> 6.12.63+deb13-amd64 kernel does indeed generate the same dmesg warnings 
> as 6.12.69+deb13-amd64 does, which auto-loads the hp_bioscfg module.
> 
> I've not had any noticeable problems caused by this issue since 
> 6.12.69+deb13-amd64 came out.
> 
> Best regards
> Paul
> 
> 

Hi,

Considering there appears to be a rather large number of attributes on 
this system, maybe we should be using a different memory allocation method?

Something like this:

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c 
b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index f346aad8e9d89..72bd6037300ab 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -94,8 +94,11 @@ int hp_alloc_enumeration_data(void)
         bioscfg_drv.enumeration_instances_count =
                 hp_get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);

-       bioscfg_drv.enumeration_data = 
kcalloc(bioscfg_drv.enumeration_instances_count,
- 
sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);
+       if (!bioscfg_drv.enumeration_instances_count)
+               return -EINVAL;
+
+       bioscfg_drv.enumeration_data = 
kvcalloc(bioscfg_drv.enumeration_instances_count,
+ 
sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);
         if (!bioscfg_drv.enumeration_data) {
                 bioscfg_drv.enumeration_instances_count = 0;
                 return -ENOMEM;


