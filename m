Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320F3A1A41
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771945548; cv=fail; b=iWBNdRYuYNPiICNcWoe1F3b7dHwmps57sRV3TiLKK/HA+ZOC/HVmwLWmZDNYXd0+b7EHNTqOCABiwhxNGjpUt9v8SITccwZJdL83ShoOyNJ1mDgMM81QyhIK63WiWbgJlExU5SgH8Wgq8A89/T70ci2h3WI3FfQ9HLxvMjQdlSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771945548; c=relaxed/simple;
	bh=JXDC4R5PvqGs385Rn9cOTPkNXiUDRuN2ZOIrFF/qUsw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fY45ZPPDKDiVvA8l+rEDs9oaZgFj2KKouuj+8/OLTndoF2UEsE2+XZaXZgX8y1c0tG5HrJwM+2865UlZXpmzRhtr1fyzUXbKymE+H9u+g4M7o5A2ChxjBkg2bTuONXpRQ7DzCSmtPtrpcZ56UAA0+tbNZXHzvkDMAhYe6oJgd1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2ov97gUj; arc=fail smtp.client-ip=52.101.61.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2ov97gUj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF8Q41V4Lr/Za+hQGy0EuY1nRCcFnjrVKqlxiX/yL0kxIK0hqu7rZXvYQCff3i1nbKqGG5w4NGb5BXs9Nt5vgwJZWBbz30zeacxeaOgtpKdI2KEA8Nm/IUAIWL4AdNCCuRKupxkC81q+vycrxqdwVcCJ62Eie8iGX1yoIW6W9gg+eLE3gCzZLkUWaGK9cc0t2hgWtYcW2ABnyWI6RmXy0XOh6njIePWdAWzUHgziJrZSYt+RnSLJ83eEONs4U65cUW3ZJjFwkbpsNSjhSZnIhmaUuOVckdiy24tjNSiI4LxjZExNIudbytYS2lxtkCyw+gc6A84jTZw0ZgznSyGK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keUaLrr5SqLKNVz3F/+KQMTY7NNQNQyHt3tiT1nTwJc=;
 b=m8fKrbegZ308Dz1Tk2VulDmQCTXxoc3dU17x479KJg9ZEvaTzB47LL6jkHFpBEGqKXp9a7fGwwDxSFApo4vtaRm3meaWO3Ka6G552VGsFjkqXLNIQkayx8UHKbPCIhO/8K6k5V8xnekNGCRK49xKd1hYbfqDz3tLppLkWJwfkxo8XLOcuaS8PuBRb19PU0vNVfkE7YUlZKsjXgFUGclw/cQwoQO5KPgCb+kzPQ7rVG9p8QfN7wGFwLDHswxY77olV+ICtg6QhJEzUU5FJCIpZ2u38RB+BAQmrXIeqNhGCSZvZNbo6FoIlQ9guREHRZ5RbH65ntXyrmybNJd9RvQAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keUaLrr5SqLKNVz3F/+KQMTY7NNQNQyHt3tiT1nTwJc=;
 b=2ov97gUjoBSRwEh5XJpodPRsoW7eQGjV7aRnQbbzQXdANCy7Rwv/sveZpoiLeE62S1NjC38svQq25AFay+HemPnT6sXdXcjcJBQ1O/hGQo+21t5jeVyr8t4ojysH0i3Q6/zZjEju7kbddemEK1HtrGRy2krRkrJV1/Rm8ktI6vY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 15:05:42 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:05:40 +0000
Message-ID: <78a8a279-6046-4124-839f-5469bbbf52d8@amd.com>
Date: Tue, 24 Feb 2026 09:05:38 -0600
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
 <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com> <aZnNu_AphE78MIoY@monoceros>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <3167b808-1fc9-4b73-9bd3-b76b149d2b65@sheffield.ac.uk>
 <f4f2c1a2-25a7-4399-8b13-d627f7a20ac7@amd.com>
 <0b744c9d-9874-4755-9b25-d00f2465a751@amd.com>
 <0b744c9d-9874-4755-9b25-d00f2465a751@amd.com>
 <b2535142-aaff-4eb0-87bd-34c9f8f16f07@sheffield.ac.uk>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <b2535142-aaff-4eb0-87bd-34c9f8f16f07@sheffield.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0047.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::28) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: f591af88-64eb-42e0-86e5-08de73b62ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDYrZXhPT3JheTBNTEtpdUJ4RzFjREVmZ1haTGkxTTExTlhFdUlFVUlSOW9q?=
 =?utf-8?B?V3BFUlpEL1UvSTNyVmZDR3pGRTJiNGxiVXJMUG1JL0luVm8rUDlvNFV3MDR4?=
 =?utf-8?B?U3pobGhrSjI3Y0I1d1BNMkg2ZENnMk9odmtqbHZndXl1bGlOaGFOeEd2YVB0?=
 =?utf-8?B?Z1Nvc0lROVVCZUVKbGVEQVZRL2c1dnNwS3RXU1RzeXdMRGFaUkZGQUl5UGh3?=
 =?utf-8?B?Q215SGg2bVN5VHpQOUQrM0dKVXpNNEhDRzVsYVJaVW0rbThMZUpzSWE4dnp1?=
 =?utf-8?B?cGg3YmJpL0M3eVhoTlJDVndFKytpOCtycm51VmFmT3c1MHBRTk42dVVKRjEv?=
 =?utf-8?B?aU5CUm15RlRRRWhZWjd5TCtRSVpQNFk4ZnNyWjF2bUV3QWJWRFd6NmFHNGJD?=
 =?utf-8?B?dEJscmN1Y3BwcmJKNWY5Uis3OUE0bzlvL1F3TjcrQTJUWmZ3VGZRbk8vNGgy?=
 =?utf-8?B?ektvZkN6c3FyM3FBWHdvYnVrWS9pamxyR2ZydWpTc2tncmo3Wld5Qks4OGR0?=
 =?utf-8?B?YzNOVkN0a0F2WGtnY2tOZGx5L203a25qaHY1VmRuMUtGd0JOamhtc1NRMi9S?=
 =?utf-8?B?UzVFOVp6ZWJLZUFPOU5jR0prWGJVcVgzb0dkMlRvak9YUzVNcUkvVEVPekt3?=
 =?utf-8?B?OVpGSEhHRDBsZUorNXMrcmplT2ZCeG1QK1hsaFhOdDVzdzJPekRia3ovMEFM?=
 =?utf-8?B?TGhpaWlpLzlhVHRGYzlrTEcwYVV4eHFYdzRjNkZHUUExaUtINjFNMkJLcjNq?=
 =?utf-8?B?ZFloNFhlU2l4eU0yZStEYUFQL2czREhxRFZILzdxRWlEb0h1eVNMRTV2cXlD?=
 =?utf-8?B?bUlYeCt0TFVEZGovS0pPQmlJWUY4d053OXBOMm9Na3c4K2dGTytqZFBkN1RJ?=
 =?utf-8?B?YUl3ZG1tSXNnL00wU2NObVBjNDFMUGxaK21kRHlIdG9OZGs4T1dod3VKblpv?=
 =?utf-8?B?SlRjV1R1UWZBVXZsODFqNFdiNlprN2lVaDZKSEFJV1ErSHIvbFBKTThzSHpH?=
 =?utf-8?B?NmJBeDhETWJOL3UrYWVHa2lPU0txTk85Um9tRjY1YlBqWFU4ZjdTYWdhdWo5?=
 =?utf-8?B?amVmVGNSTjhLOU5qN3Y1N0FzY2pPam5RbmtJS2RWL2x4bmY0eCtRbzFteWZi?=
 =?utf-8?B?V1ZhajZEQ1psT0NjUmoxY290UkhELzl4LzY1clhZTmZQMC9YMXUybEVPQUlJ?=
 =?utf-8?B?S2FxaUJCNHBlK3ZtSlU5RFZxTllVRUNSTWVkc0UrSGNaUU9KVGVYRDNrMG5Q?=
 =?utf-8?B?NGxGUWFaQi9SeFlqMUFaMFM1Qit6WjJadzlUcTJOWlB0UWxMU2lUQ290MEpE?=
 =?utf-8?B?eklOdDhiS05NSFlGcnpKQWVucCtVL2JtdndDQ2NMRS9YRE1yc1RYazViaW95?=
 =?utf-8?B?UEoybDEwQUhvUURhSG1pRHJPc3NlYTMxN05OZENHOEJYTk5heEN3dFpDL2ha?=
 =?utf-8?B?OGpwenQvd2Q1RnFsVkszYmNyZFphZitQNXdWdzFwQ0JzUVNTNlpBc1hEMDJK?=
 =?utf-8?B?T1R3Tkh3Vk5oV0x0cGlNbTAwN1crZVQxUXErRTlLUWgvMzRJRTlsVEZyTVZ1?=
 =?utf-8?B?TitraG9iUmsrS3l5bDVtWnJDTlk1OTBINVcyUDVjeHlZUmFsTngvWGhTVEFl?=
 =?utf-8?B?Zm5XWUYrU05RdmlxMS9nNzQxMy9zNXV5WUp5K2ZNQzcwcTRXd05yRGhueDRz?=
 =?utf-8?B?U1FxU3FsV2tFVjhJQ3dBeTJ0WU0yMHRXT25JYVdqbVlXZWZEN1pPT0ZNOUFT?=
 =?utf-8?B?eGZMek9wTFJsbnVFSUJ6N3NiQ0NFdzVOS3BvblVadldpdTQ1SXpmMzJjS3B5?=
 =?utf-8?B?UWd6U1VMK1djbGNnVVQ3RFhUMUdKYmYzRGI4eXFVdW5ERzlid3NzOHI4SzJj?=
 =?utf-8?B?TlM0NURBUXNFc0t4a3VLdXB0ZVpxU0RlSkl5OWZaYmJ1a0JnVFZ2ekpiR28z?=
 =?utf-8?B?OHA0Qkpvdk41NThmSWhvcXdXbFRaeVpielhvbXB4SU80a1ZBUGFoV0xZVU9B?=
 =?utf-8?B?ak9FaEphY0oxUUtmY2J6OU85ZlJpa1AxanhtMC9TaEI4NHlNbVdrWTFRbkly?=
 =?utf-8?B?eGw0TGJYSjJKbG13bGo0K3lNYmlVTGZVeW5nbXp1S1UzVlluaDFxcnlLQTMr?=
 =?utf-8?Q?XqKXlxjd0zrX095uPtnAGMc9e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzVURU9sRnl3ZUFLY3ZOVXBwbXRJSDhmMmhnZTY3dUxYNzJBT2dhbkRHYkw1?=
 =?utf-8?B?K3k2UFdDVWx4ckdabW9RTjBvQ1JmRW8vdEU3ZlM0RUdRMG11VFZZN3NYVllE?=
 =?utf-8?B?eSsxZzAwcm5BWXFtRnZuanZvY2o0M1ZpSFpkQ0h2Ly9nUTA1ck1QcSs5amE3?=
 =?utf-8?B?a2RneTZtUXJ0N1hNY01sUVNsT1EzVWM0YmorOTBEUXBNUTZzMGhWUHNuSFBD?=
 =?utf-8?B?V3V4SW94My9ZK2t5eDIvWS9GUnBVRkVJK2JhbGRsYkdDcnF4S1l1Z2JKUkJJ?=
 =?utf-8?B?SWJOZDdURzN0TnNJU3k0ZXNUWGp1Z1Qvc1IxTDFvMUFwMWdOYkh6Ni96OFhU?=
 =?utf-8?B?V2ltbllMU1VZRTQwb2dJZmpxa2pjUDFOWUM2ajVzNUw2RDJVTFQvRWV6VUsy?=
 =?utf-8?B?dGg1YTVpQUZDT0grNXlkdmJXcVV0eVNsYWNycGw5YjlwQlhqaTlPOFlKZTNr?=
 =?utf-8?B?TDh6OWVOa1ptVnRDSHNvREpLTSs4US9SemZic1F1UytCSVg1WExZN3kxOXYw?=
 =?utf-8?B?eFJhLzhHYnV0TUQrbm96V3ZDWk9jcmpweEY5UlpKTkJsZUttK2RmaHN1MG1m?=
 =?utf-8?B?NnlkeFFLZEJaQ0ozTUt3dnorbVlrZnM5bVdoWVppcVFLQ1Jhdmcwc3RONVVn?=
 =?utf-8?B?TWQ2NVYvSkpGckZkMU5pdGdoYkxVTHdiVXhWOFB4bU1sSDQ2YUc5ckFwcVBY?=
 =?utf-8?B?YkVEbm9MRHFKRXdNYUlYRW9KbjlCZVZNeW85elBzbjZKVEJKejVURzJVME1U?=
 =?utf-8?B?WFB4eVRCdzlsbmxhRVpSUlkvMzVqSkJQdW96a3ZYd05NamE0b0ZkbE5mVWhU?=
 =?utf-8?B?VDJTVzQ1ci9KNG1hTE0zSExhaERQdWRkTTlXVSs4YUFEUVRoOVZDL1dTQUxt?=
 =?utf-8?B?UEJWUzF1OTFkSFhBdks5Zmk1TXBFNFBUZ25KMTMyYWZteXRhSnZ2QXcycDF6?=
 =?utf-8?B?ODlTZ3V6YUdCc2d1R0ZDL1QxeHYzeEovTGErV0xxdnBES29xMXZtQTdMR2hn?=
 =?utf-8?B?Qy9pTDc3RFNSdzlEZGJzOS9PVTd5dGFTVjNxTnFVZERJbHR2bXVBYjlYa0wv?=
 =?utf-8?B?YjJkQWp0Vy9aeSt6VEFnWUJMdHZoTSswNnNJMmR0QW9JcVdNd2FMSUpGRk4x?=
 =?utf-8?B?d1g1bE8rK09NM2E2WjUvR2l2WWdSTFZUM0w4YTVyUC9KbFlIWFdYZVV6Vmln?=
 =?utf-8?B?RHdJRTNGd2ZZRENBWVd0S0l5UWxiTlMyUTlwWGNIWFhqZEdFQW1GdFVsTnBJ?=
 =?utf-8?B?Tzc5bTdvaFppS2p3VWVWZkdXaWtZQTRaazN0ZGFYekpLZElEeVRDdkttQ0NH?=
 =?utf-8?B?amR0SCtYYWdtc29UTW9EelJkbGRVOHZObFNIVmFkSElOWWQ5ejlMQU1lblU0?=
 =?utf-8?B?QXh0SGFiaDF2eDZnQ3hjWkRWR2o2VWVoVnZLT0M0eE1mcTFTbjkzSjlSSUVS?=
 =?utf-8?B?Mk54eVZVeXRaN1JBeGpTUmphZDNlblEzc291YVdsVDVUMVREZUJMTkJ3L2xI?=
 =?utf-8?B?aEo1a09mWjU0UGpKWVQ4VHI1MWRDK1pEaUhyUWNyQ3RnTmFiRDY0SFI3L0hz?=
 =?utf-8?B?M3haU0lTZkpWQW1hb0U1SVZSWlNUZE1JUW5FK0NGbyt6ZXRObUw3MDVqcVpE?=
 =?utf-8?B?NjJ0eC8wWllsS216dmhxNjZrdGxRYVpQT1JGKzJHQlVFTEV5RnhmanhETFg2?=
 =?utf-8?B?dWtmak1RWXFiZU1JYWNpalV4dXpoVlQyeTFpZWhud2p1TmF3Wk5rcUYzOFdh?=
 =?utf-8?B?MFlDSTF5dllSdkRqbUZDSkJPZXF3NzI1SklERFFkM3UvZHpWeWdpejlFSWJh?=
 =?utf-8?B?SGpxVVNqaUVNNmlLKzhTb1RQckJTdHBHeFUxaGlYWndJUWRjdEJwVXo0SDJP?=
 =?utf-8?B?c3lwZG9KVVlLVkxjZW9DT2w2ellYS0tnaDN2U3AvNlllQXpjOG1JbHhkV2VD?=
 =?utf-8?B?ditCZjdHaTc2Wk84M0NYQUszRUpCb21OdC9lNHdmMFlFcVNOVEhyWU9ublcz?=
 =?utf-8?B?RE1zZ3lEQ0E5TTlkekRYdVBvTWFSQTR3WkZWOFBHbFpneUNhYlhzdmo0dlJo?=
 =?utf-8?B?RFJuT1pzMk5vYkM1YlE4SjcrazNFaFJTMzVQRTlsZWtlNSthWnN4ZHJNcjVS?=
 =?utf-8?B?Z1krdDJZN1hLM21vRytXYUpRc1BKWXBia0IrSkdpTW1JSWlwT01MUUlIKzVy?=
 =?utf-8?B?YzdQSjNSQUFRSlh6MUppRVVYejdvdU9XRi9nRFlDMzl3VnU4THQycHlTc2RQ?=
 =?utf-8?B?SkZyd2k3WmVtZ0Zld2UxZ3VodGl1QTdlRmNWVUtERDdOU2RXZGdBQ2pSY1A3?=
 =?utf-8?B?a2NTS3pSdFg5YjRDVnZGQzE0ZGJKUm4vdWpqYjZPMldjMnBpRmw5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f591af88-64eb-42e0-86e5-08de73b62ca5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:05:40.5633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R36DClRJ9a0Uu3kfGHKRyyJCc7zSZL0VEUAlw0/Z2aOMxIOw5C7XiKPOcl6pqDKasVk8/vp65MdfVJ7zljQ7lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797



On 2/24/2026 5:21 AM, Paul Kerry wrote:
> On Mon, 23 Feb 2026 10:39:31 -0600 Mario Limonciello 
> <mario.limonciello@amd.com> wrote:
>>
>> I've posted the patch separately for you to be able to test with.
>>
>> https://lore.kernel.org/platform-driver-x86/20260223163245.3294630-1- 
>> mario.limonciello@amd.com/T/#u
>>
> 
> Thanks Mario
> 
> I've tested that patch applied manually (your patch looks to be diff'd 
> against a different source as a line to be removed contains "kzalloc..." 
> rather than "kcalloc...") on a build of vanilla 6.12.73 this morning and 
> that works perfectly with no more dmesg warnings, and hp_bioscfg 
> successfully loads.
> 
> Many thanks for the fix.
> 
> Best regards
> Paul

Thanks for confirming!
