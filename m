Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF01AC42C
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 13:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729689141; cv=fail; b=mO6g4UvzPCaK++igus6KLjh/1EOvWQP1dYitl2MhzZjnM1nHtAWKneOz0vh8ksPO1viGZvUiNXXm06vxdTtqiqCthZIOmS1FWi8RrKzXQ7QwRyJIThSCa+rPR+TuoXj2cwTQKneZUj5JqBynlRJw7xL6JYHyApUB44knUg632Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729689141; c=relaxed/simple;
	bh=xuz6OFSn9Wd6TsXuV0o2mKKX/1O2iLYlzWIn9f0BFa4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=grkTCETRl3hA0b1xgNptFYDGP3nPoe0bYOlaFxYmDHhjPEgcaN38KB4RaD3aTGVUGVmD1UXDksVdnceA4v8u8Tva1SkiZHTNc666E1yqQtN6mRcjLJau5sij6RvqowvZoOuhrD4+0ub3iBxgBgxFGEVuwUDr87qTYb6HHxYY+/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kp51EBqn; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kp51EBqn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9jB7TlVc6rtlUtKlX5jxvUoeo1ElVc25YgX/6pD6vk9bkhg+XFH6OhhWq8+kvpXKdGGHGhqZSf06c/gWH17DV7Kj+i/En3jXvjheCGozM6/XVf+oJ6mP7AUmlPoXwlzVMyRtLwC4Sybr0rQqLm1OMM7U6jruoiBldyfXlwzqKy5ITC5+5gXKiUd6wcx69901jtgCkI52wJNCX2SGMTyTDzHYnAS7XV11++gNWAXDvks1iWldXjLeekY/dvzY+K4cYyQKK9J8A/i30HXBK5uILojLW6FI2/967ej3nf4EnRSB+hhDYW3YrOerYfqsyofrtFg4dA/K4n03lOPvxp4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXsvuV7hk7te3H6jeQ5VSBtM3GjC5t42o5114Hd4p6k=;
 b=sLaNu3e8yk7za+/HXeJKVL0W5tbuElnaZjcxu7nKJ37lfa71DMU3vOnR2DBUq5JCEAMa6i7FCf6TC//bZt8koY8UzLbJcJwn0fQdRJK8BLHfRc8IJg8aow2+NP8S2gPBPMLiEJLS0oYNsUUCOSqGuUnetMOON1YPXgr6ci2a8pj4PQKrONwmRaFneusa2lfrFoDeD3LLhwP5h5Tcb80Md5c94OB3+aMA8b8xC11UEKWvqxtyxU4iA4BvXvH8bOnLN51bOmFoWb0fyYi1SgL8ZF5eevyW1b1jiTe/E2ukg1l/tNkbW3lRjU+LQEwVskz1R8uixUehzbAmIRckKj2xJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXsvuV7hk7te3H6jeQ5VSBtM3GjC5t42o5114Hd4p6k=;
 b=Kp51EBqnoMi8HIivTvO5zXkH0YkfvtK1zUZ8hxS7eW2i0rcvJfZu/KmpBIESNoryB9Q0ddCXEeAwmFzoUzv6hUVhK/+kKaKMcDa3tMEFXIhNodgtMTefxtnsk5p/T2z9I9jANtDnyQYKv/Q2vdoBP11lr4b0L8jUqg+Nr9hX61E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 13:12:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 13:12:13 +0000
Message-ID: <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com>
Date: Wed, 23 Oct 2024 08:12:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mischa Baars <mjbaars1977.backup@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:806:a7::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2b981e-71ed-43cf-b4d1-08dcf3644f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzlzSUN1eGxLTThleVNiM01zNERsMDlub0hERUpJL2tFbzk1ckc3VmJQSHNO?=
 =?utf-8?B?NzNtSC9ZMTZwU21PQi9NTEUzR0pjWE5wR1BSNDU4akJON043bGtLd1hvZmd1?=
 =?utf-8?B?elNpU3FtWkJVZnd6YlFNTWJ0ZGY4OTVXNDkxcjdVeG1wTHdhNm04dHMzU1E3?=
 =?utf-8?B?WnBlOUhhaVhOQXVsUXNEa0t2OHUwU1JFQ3Jla2FxSWtHNXpweEpWczJZU1lW?=
 =?utf-8?B?WGtjMkhoTDhnK2JPUytrZDI2T3h4RENXYmcxaThZZ0NpTmpObTV6SkgzQ1hP?=
 =?utf-8?B?S2UyMnVXNEYyZlBJbFVURWRBRkRST1VJWjRjR3QwdGhPRGRhcUNwRUs2UlFC?=
 =?utf-8?B?dmFscEkxZVF0T0p5TVl6ci9xaW13SjdWdXpsZnB1dm9LSDZzUDVkRUJ4OGl3?=
 =?utf-8?B?V3YrbjFZTnBNS1g4eXlHYU9Vcmh3Zk1PcFBBUzMxcnJ4TEVVTDFuMjdFbUdx?=
 =?utf-8?B?ZzNtYXp3WXR3cURRSGxrcE9vT3cvVzYveWJLcXVRY2NxOHBlV3lRRzBmOXpp?=
 =?utf-8?B?UC9obTl6T2pieTdBYkMwMXdNbWg4Y1ViMU9iNEJSdFhhMmEzdllrOURFZWxm?=
 =?utf-8?B?UjRjS1pmMXJpZm11NDJ4YURwV0p0VUQ1SlhZVElzNG1qcDZaQ2Z5SUYwckls?=
 =?utf-8?B?dDRJSURkZ21KSjMyVjBTNng4VThKMDdCSytweW5XeGZNYVEyN0VsVlJwdXFn?=
 =?utf-8?B?L2tUbTNzVW53MXNlU0Nncy96eGs1NDduTkNtUnR0QUhyTkZBaVAyeGdkR3BF?=
 =?utf-8?B?YVA2RXN2bXBRVlI3NVV5WFc2bkNaVjUwNDFCLzZXNVNlVyt1SUI4MXJqbEZG?=
 =?utf-8?B?OTlJdnFORU9TVWVqZUZ5VWRNeVJhRFVKK1FJcGs4K3RCR01KczgrTUVBaGx1?=
 =?utf-8?B?ai9vN1ZCaG42QmlFZEpIZHJ2YVVjK3lrYmhNSk4ydUJNaWR6VkY3ZnJVMjc5?=
 =?utf-8?B?MVVzUVNtZk0zRDNEVmFha05uMWNqMHVqTldzWFdtZ2tYZXQ2RzVRMmdidDBy?=
 =?utf-8?B?VW5QU3VmRTVhOXNQNStIV3M0cGV4L3pCdmxKbHUxblRuWGV3QVFlZGFrUWYw?=
 =?utf-8?B?TUNGKy8vWnFXQ0p2UXB0KzlQUW5ET21XOUdhMmZzVVVXMDU5Z2hBLzRQTmlZ?=
 =?utf-8?B?K2xRVjhYUVMyNVU4RGlCZkhoYzVkU2hTREpYMlpFT0FQV2NVbmVBUmF2akFY?=
 =?utf-8?B?cUJmVzFDNnd1ZytudWtiTnFQYllCSnZkQm0ydXdKL20yMkJoSGdjbUFLRWZl?=
 =?utf-8?B?M2FRZUhDYU1zYUhrV0pQRTV4a1VNbWxHTTNBb25oUGhIdWhFdHBrTlF1UWVo?=
 =?utf-8?B?eVB4ZStYOWoyRUh5YWtBb1RpUDZUb1Z4WGpuS1FqdW1JamVPTmdzWmxXSXVp?=
 =?utf-8?B?UTFMUzFXRHN5a0VvaGZwQk94UzFBZlZsRDI3Y3lpZ1NmUkY4V0V2YjJCYm1p?=
 =?utf-8?B?RzZBY0FsU09qR05KWWQza2ZIVVdCMlFuWUZWaGFJU3Y3STNucXp2NVY0YnA4?=
 =?utf-8?B?UkgrSmhHa25ZRytOenVLOEdDdm1KUzZrNUdNcDN6MWQ4UGVWekw0Y1dpai8y?=
 =?utf-8?B?NlNIbEhJYlNuSVBtYlljbTVpZTlpVm80dy9JQU9UajQ1MTA5UjBGUnVydjZI?=
 =?utf-8?B?R1BmOWlWOHgrT0ErUEdWRld5WUFSRENqSDNKdXpJV0EvdjJMZnViZjhuekRo?=
 =?utf-8?B?aENnQ1I0cjl1THRxY2NsRmVndjduR0pmK1Nnd1JRMGFIbGRjZS9RRzY4TWp4?=
 =?utf-8?Q?NdJsypYu/duus38ZX27PMUvz1z1xmWuXaPIkTXy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFJyUUhxbEZpVmRZZkVGVlhNTzlPYmhqNDFraUx4ajVkZW11bXBWMHRUSnVn?=
 =?utf-8?B?MnhyeFJOdmdZbU1rb25aWWdPamRmRk5pWjlQanU3Y2JlbTk3cFE2cEhKZnNo?=
 =?utf-8?B?Y1QzMjFqNEowNHhIOWFHZTFWaDNMMjZUQ1dtLy9CREh3MmU4QlpGcnVWSWl6?=
 =?utf-8?B?T1BHQ2tKME13bE94cDhxKzkreFpvY2lZcFFVY1hJM3V0b0tPeUMxbkRUdHli?=
 =?utf-8?B?QXZWc1dpYXVNd0VvbHNDVDVFblhyQ3hNeUJWVkptazhYaUZDZWRyMGNaeTkv?=
 =?utf-8?B?NGE3c21FMHVwZDNmV05wQXVFY0lsc05oRG9mVzVxTU1XV2FKUU1YTFk2Umdl?=
 =?utf-8?B?SlUySzN3a3RhWW1LN0tvV0M2Mi9rcHVOYW1uUXh5dFd2Vk01amdPbGdPRE5W?=
 =?utf-8?B?RjhuaWhQeXl2NlNNWFRPcnhLSkVsV1Y0L2I3RHlzRS9ZRXBGYXFDRGNkVjlU?=
 =?utf-8?B?RzlFdW0vNnFSM09HRkxKeHpzQnNPeVhRZllabGx2VTY5UmdXRGw2TFRlSk1C?=
 =?utf-8?B?TUlyTng5UkNVUnc3U0NsV3Rzc3VtSkxJS1VWaFo3TUpVcUJyYkxKaW50M3k5?=
 =?utf-8?B?YmhFVnhIUnpjdTBza2hMSkRXQXQrRk9ranVQNUlsWjhOSlpMcFNqTW95azJz?=
 =?utf-8?B?ZXE3VzdaTG44MXY2Ukt2Nnp1WWYzZ3hkNSt6MVFSVldrZ0twTHVIbzNDZFJC?=
 =?utf-8?B?K1lYdkZwSFlzaXBZRUM0cjVXYWQwN0tOWEFabGN0NVRVVHoweUlVR09IYUNM?=
 =?utf-8?B?MzNCQzdnNy9OOEdTbCs1aTdWZzFTa1J6WGNJdTJSZ3hpbGxCaVcwVFM5a29X?=
 =?utf-8?B?OTVNY3ROTW1vRGRSNklabXdORSt2aGxFUDFmUG96MzJjek85S0xwUzdWNU05?=
 =?utf-8?B?Ums4QUNHM3ZGOG5nNDFKcm15ZitWRDVSSlUzTEpJRnkrK2RPak81VHBublZ2?=
 =?utf-8?B?ZTFLTVcwRlIxSWRCbjI4S3VqYUpvR1JYTE1CSXIra3M3enhPNmc5OHV6RkhT?=
 =?utf-8?B?Q2VIbzkyMzlWc0VWVjhKaE5TVUNQei9jalRkRFpQR2lzOXRzZFFmT05qa0Er?=
 =?utf-8?B?c3lRVTNVQlkzQzBWdyt4RE5CdW0xdzJWVGpwQXNrR1RhQTJic25kL1J5Q2hT?=
 =?utf-8?B?dFRtby9YU25VMnFIMWJ6SVBoREpJcjMrU1l2OGZON1Faa0VnTUxwWU5FUEZX?=
 =?utf-8?B?RGk1TlVNclpZMGNDN216bE42K3ZQV0tRc09lM2p3NklXUWVFTGNsalRrOTZt?=
 =?utf-8?B?QXkxVENLRUhaSC9nN29kL0FMM3RUb1dLekdUUXFTTWpYZWwzaVIwQTFBSUV2?=
 =?utf-8?B?VmszT1ZlelorS2FFUVZmZVQyeDNDdzJyc0lLdzVXR2kzRFRGNG5pQ3JTL3RQ?=
 =?utf-8?B?Yk5jY2lsVjR0TmRsalBVWHAvZHpseUptQk1qcXBwSi9ZMnQ5Uk5IV0VUeU5u?=
 =?utf-8?B?TWYwc25HTnl6RGE2K3h5ZGRFd0lUdUFtRmZyU0xhQWtBRkFBd3R1eGhmZzF4?=
 =?utf-8?B?UTRDT3hPR2hDaW55N3VUSWhJQjBIZ3lsSFU1dXV6VkFEcTFUbGdHUGI0d3pV?=
 =?utf-8?B?OXpCdzZyNWE5SVJkWm16K2FqU2xGN3ZUOURzc3ZMOVBOdnZWalVmMVdmSnkv?=
 =?utf-8?B?Mmp0eGJ3SStsSjNYYVVkTGxDM2xGVGw4dE1IZmVud00yaHhoNFNRRTdsaXZE?=
 =?utf-8?B?eGJmaVcwQUxEa0tJbDhZRUFJRzlKcjhDdmFYc3gyMlVudGx2NGRZQUNkUHAw?=
 =?utf-8?B?cTVSTUFudmhhN1BwT2RVQlhlYlpoekR1ZDNTaHNyUnZuMVlHNzBLVC9DVUhZ?=
 =?utf-8?B?azZQWEpnQWl5VE53aVBnUVl2SjZLUXdvN1EvV3c5cW5MUHBhMnhoRGlFcHpp?=
 =?utf-8?B?eDN4d0d0TkVISERhTERHaG0zalFmRmhqU05GejJ6ZlBUWmRxWG14eUVSUTJa?=
 =?utf-8?B?Y3V0TEFPaXNEc2dwZU1FWjBLQjhma0phM2NaVTl5K3gwbitKU2VtaU5qR2Zu?=
 =?utf-8?B?d1VPZFhCS3NRcitpditxb3B3MjFiclQyWTVvSW0ycm5hbjRocW9FUld4aHNV?=
 =?utf-8?B?SWI3Ukg5ZUZpVzF2dVlaTUo4TzZ4WUdLakxaWldZOHJpVWpKOHBUc0pUWTBH?=
 =?utf-8?Q?bgFAS+hxwexUOqQ9+A6mAe56Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2b981e-71ed-43cf-b4d1-08dcf3644f86
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 13:12:13.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcLR6xkNRM+tYUEfzo1nbZDOQBx6p9RNRbGlUepCQyuxQjG1UFOm7l4gzsZouLIG5udveATDexo5dy5tB+Av9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393

On 10/23/2024 03:36, Mischa Baars wrote:
> Hi,
> 
> I recently purchased a new television that is capable of 4k@120Hz
> resolution and refresh rate, but when connected with the proper cables
> to an AMD Radeon RX 6500 XT that does support HDMI 2.1, the maximum
> resolution and refresh rate I get is 4k@60Hz.
> 
> I've 'spoken' to AMD about this, and all they do is recommend
> switching to Red Hat / Suse / Ubuntu and using the official closed
> source AMD drivers. If it is supposed to work after that, remains
> unclear.
> 
> Did someone get the desired 4k@120Hz / HDMI 2.1 resolution and refresh
> rate to work using the in-kernel amdgpu driver? If not, why does it
> not work or when will it work? I have other vendors with other
> hardware that have different restraints on the number of operating
> systems that I can use, and they do not go well together.
> 
> Kind regards,
> Michael J. Baars, the Netherlands.
> 

Hi,

Your inquiry has come to the wrong mailing list, but I would mention a 
few things because I happen to be subscribed here too.

1) AMD doesn't have a closed source driver.  AMD has a packaged driver 
that is a DKMS package for use in older kernels before support has 
landed upstream.  With all AMD products on the market right now there is 
support in mainline kernel and with most products in LTS kernel too.

2) HDMI 2.1 covered in the past, and AMD's hands are tied.  Here's some 
recent press on it.

https://www.tomshardware.com/pc-components/gpus/hdmi-forum-rejects-amds-hdmi-21-open-source-driver
