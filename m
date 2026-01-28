Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706EB326926
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769628737; cv=fail; b=uDWmvBHyaZ+pxEkJea4lg8ErGRxorIhdkTx1IhLJkpwSYAQxvCm1iA8Z14JnvQQm/7Hy9S5MXJuoau/Dp+R8Ow1oX6RWSdBOJGARgKKqu5I5HWnxHMFG8iAE9ym13Jnm2ekbDfILok/lJV0gpbj/lHjUOe4W6d8Ra6NngQmehNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769628737; c=relaxed/simple;
	bh=v5SSi1y+UwtkBudilPWYa71b91T6j/3tAuGwsnh/h4I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fdfB5UJjAb2oVH4FfFeh9W9q1MnvJTDxArWo3zJdysMNrvEFFOdSZBNKwlGGhQM2XjwZyWj7Y96pj1nOFUrDurrVjYeDT8zvT3Rbmta072HpaExrc0ojoMzYmUegxRkPchD2PMp4VWlEljTrAIdJ+JfFyouCti5AXAqXIJtNd3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AzPsUnMJ; arc=fail smtp.client-ip=52.101.48.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AzPsUnMJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJLKJLNBIbLA+mZ1VA7Bnx1NHq8wSam2MVqPD0vqasDqbZuCY+wwWVdsgH527LTrTsQNkf7PG5K3oWEByvd+H+r+2i/ZmVYeRt+q1lrXqe0fKIkpsR/4SdAuz5KgDJsoGLHsFGgUD6x1863KAN6C688kxDn7JPoLWBEQz6mXy4r0bGs0elacoHZMVdnK/XWJaaJzGHPZmTJ5TfRIfQX96kTDHXvY6Y4dOCUyyLF+FhF0SlHi0iG3ja/ZeMbANCTR5yWCLImqINVyl642a/VQUkSNiOXUPao4KiB9pwaMaIy6qUIbWj/wb7tiq3IOu54645PPxj8MmOgh5GcBnr305g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYNNYLEBNIXjuRn4t0ACeouYSv6iYHg3Uf8B1NKFuz4=;
 b=e7xKUTw9ji2JGWPP+ulmdmCg1bB0AgkfzcuNYpoalUpQa3Ltw3n6+3Xf2xndi8jaN6c3TNVRMXVsqjVdxSqj3YszUbL2PJIs+IkNKERrWArKEGItM57WLZgOUMZO5VnwZvdtWpPNh11YdzIjSL6EsZAflpvtNGXdz1JqJLn7V6Os5bGm3ZVjBCFPTEI3UrIaQ3LwqZw9SB9+bybixYBDqsvqtXDAB/VPiaz1B8vgfokqArwT45s8wz5hiGGifXqcEbTA2mLobdxhSkF/PiTHqoDUwru8USHr+cmtGJCMu85Hc53cb+tewdAO6QGhtNQMXZrNNTvOl2VdO6yq3nBtOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYNNYLEBNIXjuRn4t0ACeouYSv6iYHg3Uf8B1NKFuz4=;
 b=AzPsUnMJ6w8fXo4TWgwREHW8aStPG4VcUjz7FGIqjz7xYXZn1gpR3GoTarORZted0IsqTphMEFPfrB3hNCEp/rKwSnkNG7pNyNN3bLWJGnRJ7mv6vffOaS5LzTFVvm1E8a1U5EYW8rf0L1dgq8gNI+bCJtSBLPspkqkbM6TIQww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8260.namprd12.prod.outlook.com (2603:10b6:610:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 19:32:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 19:32:11 +0000
Message-ID: <d8ef970a-b31a-44db-9516-ebb207bbb455@amd.com>
Date: Wed, 28 Jan 2026 13:32:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fixes for hp-bioscfg
To: Alain Cousinie <alain.cousinie@laposte.net>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, jorge.lopez2@hp.com,
 linux@weissschuh.net, platform-driver-x86@vger.kernel.org
References: <22ed5f78-c8bf-4ab4-8c38-420cc0201e7e@laposte.net>
 <ad26a6a3-fc9e-4ced-8150-2e9ebb98877d@amd.com>
 <9094fb69-62a0-436e-a739-e94dee183eaa@laposte.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <9094fb69-62a0-436e-a739-e94dee183eaa@laposte.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 53afb154-245e-4761-0789-08de5ea3ef03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R21CVXlXaTh6R3lHYm9LMzJ3ak91MmdJMkhlS1k0anU2cmx5cUsreUlkYld6?=
 =?utf-8?B?em1jaTdMWWNIeHJkTE9LZUYyRHVrVzFJNWZhRUdVTUxWWXZVV2ZqbGl3YVgw?=
 =?utf-8?B?UHBSMkRhWllXT21vVVJYSm5adnVxOHVYRjNycXJidGdqRmpIV2djYmIzeW1s?=
 =?utf-8?B?WlZLYUlvNkw4V083aCtrUkZiUUVubEc0UGVoMENPNGNmOUkxaDU0bFBjT2x3?=
 =?utf-8?B?clZkSk1DVzBIcitmbVZQN2E4THc4cXBjNlFtaS9SOXovbWF3b1d0enEwRDdL?=
 =?utf-8?B?SUNrTU13NDhBU1VjaGJsUnJHZHBtUTcwN2FTYnduS3FpY3RsYUs3RGRwMkZW?=
 =?utf-8?B?cC8rMGRxcE04aS9UNFFnRVZtWGs0VjE4RS9XejRuRkFtU0piQ3Vva0RzbGl3?=
 =?utf-8?B?NmUzOEhMbkM4RHpFWkF5bWJRaE1BL2dsTVA1NEZFOXhnN2t5QXVOdStzUldR?=
 =?utf-8?B?cEVRQW1KdFdsdjJRNEY4TkZmK2kzbmZYcXJyN0dFL0lQTE0xNHk1ZDZTY2g0?=
 =?utf-8?B?cHpPZkJEcE5aVWUxdGwyT05LQVdISU5vZmVHTTNhVFBDUW84MUs1bTVNZVc1?=
 =?utf-8?B?NDZQWDVPMEJqOG0zazJ6bDd2eUZacWU3ZHU1L3VwclM2OUxCVUtsQ256dnky?=
 =?utf-8?B?WFVHRnZvQXpmeC9sUXFwT041Z1lsbHRkVTc2UXlEd1pIWjVOb201N0JmcHZa?=
 =?utf-8?B?TEdyVXJpVEwrREpra1YycS9NOUxmalFCdTFkdUFiUHFvenVPYUZWRkprZ281?=
 =?utf-8?B?dVNSL01KM0hyUFd0ekVEZXZpY05pQWU4Z0c0LzNGZThxN3dQUGdQZWNhcHl0?=
 =?utf-8?B?YzE0N0h6aTI5SENJMW5TdmJlU3orRE5JUy9JKzIreXlJNlFQVG8rclZycXkx?=
 =?utf-8?B?VXBLbjZRZDhDREN5aStsZlZJSFkzckduTWI3RThFQzlKblZEZnZUUjRCUitt?=
 =?utf-8?B?UHZFKzQ1azFmK3M1QXZSV2M2bTBTbzdHMW9kR3UzdThsRmVUTDN6WFpGdFoy?=
 =?utf-8?B?eGpNUHdoa3p1ZWMrd2JqM3pxSkhlaWE1VTFyQzJtM0E4N21MNlVxeld5NmVW?=
 =?utf-8?B?MHNMakttaFJ1eGdqV28vZ0RlU1ZwTnZWdktyK2Q1bHh3c2ZlNUdXWnc0WHdj?=
 =?utf-8?B?cmYxM0hvYnRVQTBYcmxXditzRmFuRnNQQlZlcUJaSzBqVmdnLzJvdWFSVUE4?=
 =?utf-8?B?bFZSL1o5aTZ2TENsR3ZiWkJXVHJ4QURzMGxQZ1piMHVBNEtkQ0tycTJTWko0?=
 =?utf-8?B?akxNeG1oR2hsU2Y1dWhDYnRMSHlYQktCYkZEZlg1R0dWeURFQ0w2WXRQT3Uw?=
 =?utf-8?B?NDJqZUhZT25sbTNZcHRzc2hpcWxGT1NjMWIvRFpSSC9QNVhCcjZPNzcxdHh1?=
 =?utf-8?B?OHRFYmFkWXJ5WmxvWjA3aTRwbzg3VVZ4NDI5RkdURXRTMVBhOHk3Slc1UUpj?=
 =?utf-8?B?OGZaLzRCWVZiZ3BHdXJKRHJ6RkVPNlljb2lBMk5sTU1HdHh0MGRpYjhVY094?=
 =?utf-8?B?bEVNbDBzdFNaYjRMaXllQkZRN2c5NWhsaHRXQUtkdkxHWlRqdkpIQ0hiQTZB?=
 =?utf-8?B?WkRaZ2JJOVVYWFE1QVJ0OTRHa0c2UmxYNWhiYjBkUjNyM3dyWXRxNzBJMnhz?=
 =?utf-8?B?N0s2bjIxRUpzSjBUbzFFY1NYMUFJRlRRK1dHVEFOVnZ2QjVscitUMGZWZVY4?=
 =?utf-8?B?VHcxcldoR1RqNGR5MXZzcm5xUUlHNEI4L3BTaXd4MHZxQXpZd0dieDNpc3JH?=
 =?utf-8?B?c3EyUzJNZDNKNC9CejhoNGg0RmVVaCtqM1hyWTltcFJaK29GRS85NlZ0N2M0?=
 =?utf-8?B?TXJSL0hxUm9yVSt6Zjg3dVRHbGV5blcvMUtnbTBEdGdHeVVFSWdaWmtQb285?=
 =?utf-8?B?U0UxZGtYTUIyRlpJWXpwc2I2LzNJN0M4RVJkM1ZCY3hKTDVZK2hXTk04VlBi?=
 =?utf-8?B?STNnaHJnS0plUzVBWGZTWlBrUnVVckNZZ2JBRWhLeFV1dmI0OUhTYmsyVUhE?=
 =?utf-8?B?d2tFdzV6TUlDUTM4Sm1MM1lvUEVUclJjbklEeE1pN0Vzdjc0YUgzNGM0Nnox?=
 =?utf-8?B?TzNvK2hmdk1QMUU0a09DcFRWNVNQRWZPZHRqT0ROKy91cTdBNEd4SXpuZDFC?=
 =?utf-8?Q?NdGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEoraHFHL0pNbERNVzJoVjZGcjVzY05sV0oxRUQrbzBIVTVzNEJ5VFBJTnpK?=
 =?utf-8?B?N3crVkxoTlQ2Y2dKYjV6bGFJN3NqeWdWK0hNQkVwOVQ5VDBkMTVGUVV2YVJD?=
 =?utf-8?B?d1FEZDhPeHRBWWJPWXBTNFVqbVdTMFRRMkVpUm1XZDlwMmlGeW1TRExCZms2?=
 =?utf-8?B?eklZdysxTDFDTFFWNlFScjE3YnlhcnF5Rk9qT0dvZ1NwL3Y1T0RmeFhBNlJV?=
 =?utf-8?B?cEQvak5mOVdzZjF2TGJscjFLN1ZSOVd2NjhiK2k1NzZRaittU0lDYkEwaElB?=
 =?utf-8?B?V1NVbnlzNlRsZUlja1VCRUUzQjBZSDI4VVdtSlZHWXc1QWlMR2tmL21jUXN6?=
 =?utf-8?B?bmh0UzI4V1lkVENtd2ZxM3NxWFBpOVJBWlI2eUhsdjRlb3BTcDJDT2VvZExn?=
 =?utf-8?B?ZmNsYVJwNFRrRU1GNGJiQXJqNmxncFZKUFMyL2ppZS83dGwvemIxU0FURTAz?=
 =?utf-8?B?UFlBVW5wU2xDbjMrMVBCUHkvYUxtbm4zbHZSbVFWaDI4SmxNcUxzUURQZnha?=
 =?utf-8?B?TXpGaVN2MFFhTStNVWQ3ODBIcE02S01RYjFtL2NCSnFRejByS0NGZ1MzUlU4?=
 =?utf-8?B?WStFOGU1WTRiVnJmUmNHV3RTdFl2eStZZW13dkt1d0hKZ0FlZVh4V3JFU0x0?=
 =?utf-8?B?NGxteUJMY2ZNTDQybDRBTkJjZldwc0FDSjJ3ZE5peHREcUVSNmxkUy9kQy9j?=
 =?utf-8?B?Y0NzT2NEbFF1R3AxYTRYLzU4bXBsMTNHaWF0TTFqMmx0Q1MrWEpWNzZSTnpw?=
 =?utf-8?B?SUNhZHoyaXMyTjVNblI1SitMZFZiK3lkQjFLR25BSFVRN0hTUjNyMkZZM1Rp?=
 =?utf-8?B?Tm9TMEVlalFzZ0pUbkxqdTQyZWJTSU9CTG1ySFJaQndVM1AzbGpHT3UyWkZu?=
 =?utf-8?B?M1graytwWU5yZWZULzhUTGN3QVc1d1cxM1JoTlRBUFNOd3BncFpzYnJXcloz?=
 =?utf-8?B?NUJQT3JvNVJ2SGNuSVVwcmpkckdqRTlXMFBHR1JPMlZybE8xTkNBNzc4RGtp?=
 =?utf-8?B?ODVBbE5nWTJSRDhkazJWaVdUYXI1L3dMQ084YXJMRVNGdG1ReDVlY2Vrb0lX?=
 =?utf-8?B?Q3c1RjlWZWxFZnpUN3ZVNUIxRDU4Z0JpeCt0M1NaSVYyZlpMVG9MNGFJRHFU?=
 =?utf-8?B?RWxNZzRuQ2d4SWlFSWd6R3RsQ2dZL2hESUdBRGNMQkRXNHQ2TDJ3VDZnbzEr?=
 =?utf-8?B?SEdma3VBd0NKeHI0dFR6cGtJMGRFR3pZeWxOZE5ZNEFuMDB4dmpxdzhOc0Rt?=
 =?utf-8?B?NDl4WEdpMjVlSldYMnQ4QXBocWJmalVnZGpIREt5WUp6QW9mUk9iQVJ1ckxz?=
 =?utf-8?B?SXJEZmg3K1BJZTRGZ2J3SGljamhXNUpLZlAzSm81QXYreXZWVjBPb0NIbzc5?=
 =?utf-8?B?bWo4bDdBRzZFVzdKTlFQd3lBMWJSZUhMRXpqQTRLck9HVUx6UjFHSUVuU3Nm?=
 =?utf-8?B?Q0Y3UFFUKzZhajB0RFBDbzhVRWQzVmcxYTFhUURScktzVzI5Tmg4Rjg1STRn?=
 =?utf-8?B?aXZMOVJHWFdUZ0hWeTc1R2daQ3VDSGRiUi9OeURvQjdsUWVxQXFrUzFEZHph?=
 =?utf-8?B?eTJGUkIvS1JtMGVwUnA0M1BsTVlSRXRtZFlCdDR2UmtYK3hOcEZpbmxkM01Z?=
 =?utf-8?B?NkZIRysyQSsyWmVOSkpqcHNlaHBKRXVEeXg2a2pOWmZOUG96SjhobDNJUU9Q?=
 =?utf-8?B?TkhVT0VxSnNyenJLYWhoVElsVzM4MWpCQWRwaVUxa0lUMEJpRHFzZG9pc052?=
 =?utf-8?B?ajA1TDJFcmJmR3IyOXh5VDNLeW5iZGF4ZFFNNjlmSEx2TkhjT2JjbUdoVHpR?=
 =?utf-8?B?V3BZWlVlRCt1OFI4UzU0Mk1sOVc1eExLeG5RdFJzVnhPYSs1TUlNVkRrMWlY?=
 =?utf-8?B?bWZpV1F6R3Y3d2QzM2pPQXNjU3NtdUhvWlVxUmVPY1duczIvMVJkTWZHR3ph?=
 =?utf-8?B?anpxZEpGMWF4VGFDcVplbGlPNFpmNlNOb0JkT2RtQ1FrUE9IY0hudGFyb3lj?=
 =?utf-8?B?R1NPbWlCQ1dHZk5YM3doMkE0c0V2aWNheXM1aCtGZzRxTDl3OXRJd0psU3ZM?=
 =?utf-8?B?T0lHVU9VQ3V1Skg1Uk5FOWFTS2U4aTlGMXdpNTRraE03T2l3cHRIWGJCcitH?=
 =?utf-8?B?eVU2VUpDUnVMeXpIcSt5Q0JWd0JxaGZTN2R1K1VrRU9tSmE2K2x5eHJsVFg1?=
 =?utf-8?B?Zm5rWFdhMmczcDJKbE1SaGdJdmRhRUpXK1ZiRHZJZTFoN1ZKY3ZYWVNrbDcx?=
 =?utf-8?B?T2V2ejJ3WUh6SEF4SU9nOEkwQkhRczFMdGY1d0RHaFozdndOcFhXNXB3d3A5?=
 =?utf-8?B?NHhhTkNISlRTMEh1NWdpZFdWS3lkQ09jcTh6OHlxdUg0YzN1dDViZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53afb154-245e-4761-0789-08de5ea3ef03
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 19:32:11.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX+By0/J8E/thMaxBTgGe9hetNfjI2oey0kZ8uC4bg+jT/4CCae6o1SvFnc/77zsCrA2VbVja3s93ojLzuZ/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8260

On 1/28/26 1:30 PM, Alain Cousinie wrote:
> Thank you so much!
> 
> I just recompiled with the patch and restarted, and the error is gone.
> 
> I took the liberty of sending this message because I saw that the update 
> is going to many versions, so there's a risk of a lot of feedback...
> 
> Thanks again!

Thanks a lot for the quick testing.  This was an existing BIOS issue 
that was exposed by it getting loaded on more systems.

I CC'ed you on the formal submission as well.  Would you please reply to 
that with a Tested-by tag? [1]

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes 
[1]

Be sure to reply in plain text format, I think at least some of your 
emails have been HTML.

> 
> Le 28/01/2026 à 19:58, Mario Limonciello a écrit :
>> On 1/28/26 12:51 PM, Alain Cousinie wrote:
>>> In-Reply-To: <20260115203725.828434-1-mario.limonciello@amd.com>
>>>
>>> Hi,
>>>
>>> (Excuse me, I'm not very familiar with the lore.kernel.org forum.)
>>>
>>> The hp-bioscfg patch on 6.19-rc7 is causing my kernel to crash on my 
>>> HP Spectre 14-eu0xxx with Debian unstable.
>>>
>>> See the dmesg output below.
>>>
>>> I'm available for any help or questions...
>>
>> Hi,
>>
>> Can you have a try with this?
>>
>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/ 
>> platform/x86/hp/hp-bioscfg/bioscfg.c
>> index dbe096eefa758..51e8977d3eb4a 100644
>> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
>> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
>> @@ -696,6 +696,11 @@ static int hp_init_bios_package_attribute(enum 
>> hp_wmi_data_type attr_type,
>>                 return ret;
>>         }
>>
>> +       if (!str_value || !str_value[0]) {
>> +               pr_debug("Ignoring attribute with empty name\n");
>> +               goto pack_attr_exit;
>> +       }
>> +
>>         /* All duplicate attributes found are ignored */
>>         duplicate = kset_find_obj(temp_kset, str_value);
>>         if (duplicate) {
>>>
>>> [    5.489782] ------------[ cut here ]------------
>>> [    5.489785] kobject: (00000000e74f4f8b): attempted to be 
>>> registered with empty name!
>>> [    5.489787] WARNING: lib/kobject.c:219 at 
>>> kobject_add_internal+0x420/0x470, CPU#5: (udev-worker)/568
>>> [    5.489792] Modules linked in: soundwire_generic_allocation 
>>> snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda 
>>> snd_sof_intel_hda_mlink snd_sof_intel_hda snd_hda_codec_hdmi 
>>> soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_soc_sdw_utils 
>>> snd_sof intel_uncore_frequency intel_uncore_frequency_common 
>>> snd_sof_utils iwlmld(+) x86_pkg_temp_thermal snd_hda_ext_core 
>>> intel_powerclamp snd_hda_codec coretemp kvm_intel snd_hda_core 
>>> snd_hda_scodec_cs35l41_spi regmap_spi mac80211 hp_bioscfg(+) 
>>> intel_ipu6_isys snd_intel_dspcfg snd_intel_sdw_acpi 
>>> snd_soc_acpi_intel_match videobuf2_dma_sg libarc4 kvm 
>>> videobuf2_memops snd_soc_acpi_intel_sdca_quirks videobuf2_v4l2 
>>> snd_soc_acpi mei_gsc_proxy snd_hwdep videobuf2_common crc8 
>>> soundwire_bus intel_rapl_msr snd_soc_sdca btusb snd_soc_core btmtk 
>>> btrtl firmware_attributes_class snd_hda_scodec_cs35l41_i2c btbcm 
>>> hid_sensor_gyro_3d snd_compress iwlwifi hid_sensor_accel_3d 
>>> hid_sensor_magn_3d hid_sensor_rotation irqbypass 
>>> snd_hda_scodec_cs35l41 btintel ghash_clmulni_intel ac97_bus
>>> [    5.489812]  spi_nor aesni_intel hid_sensor_trigger 
>>> snd_pcm_dmaengine processor_thermal_device_pci snd_soc_cs_amp_lib 
>>> hid_sensor_iio_common processor_thermal_device bluetooth snd_pcm mtd 
>>> hp_wmi wmi_bmof pcspkr gf128mul industrialio_triggered_buffer 
>>> snd_soc_cs35l41_lib kfifo_buf processor_thermal_wt_hint mei_me cs_dsp 
>>> cfg80211 snd_timer platform_temperature_control industrialio snd 
>>> processor_thermal_soc_slider mei soundcore platform_profile 
>>> processor_thermal_rfim processor_thermal_rapl intel_vpu 
>>> intel_rapl_common rfkill intel_ipu6 ov08x40 processor_thermal_wt_req 
>>> processor_thermal_power_floor v4l2_fwnode drm_shmem_helper igen6_edac 
>>> ipu_bridge processor_thermal_mbox intel_skl_int3472_tps68470 
>>> v4l2_async tps68470_regulator serial_multi_instantiate clk_tps68470 
>>> videodev mc joydev intel_pmc_core intel_skl_int3472_discrete 
>>> int3403_thermal pmt_telemetry int340x_thermal_zone pmt_discovery 
>>> acpi_tad intel_skl_int3472_common pmt_class button intel_hid 
>>> intel_pmc_ssram_telemetry soc_button_array acpi_pad sparse_keymap ac 
>>> evdev
>>> [    5.489834]  parport_pc ppdev lp parport i2c_dev msr nvme_fabrics 
>>> efi_pstore nfnetlink efivarfs autofs4 uhci_hcd ehci_pci ehci_hcd xe 
>>> drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_exec 
>>> configfs drm_gpusvm_helper usbhid hid_sensor_custom hid_sensor_hub 
>>> i915 hid_multitouch i2c_algo_bit drm_buddy ttm drm_display_helper cec 
>>> nvme intel_ishtp_hid xhci_pci hid_generic rc_core ucsi_acpi 
>>> i2c_hid_acpi nvme_core xhci_hcd i2c_hid typec_ucsi drm_client_lib 
>>> psmouse hid drm_kms_helper typec iTCO_wdt intel_pmc_bxt 
>>> iTCO_vendor_support nvme_keyring watchdog nvme_auth roles drm usbcore 
>>> video thunderbolt serio_raw hkdf int3400_thermal intel_lpss_pci 
>>> i2c_i801 intel_ish_ipc intel_lpss wmi battery fan acpi_thermal_rel 
>>> intel_ishtp i2c_smbus intel_vsec idma64 usb_common
>>> [    5.489859] CPU: 5 UID: 0 PID: 568 Comm: (udev-worker) Not tainted 
>>> 6.19.0-rc7-meteor #39 PREEMPT(full)
>>> [    5.489861] Hardware name: HP HP Spectre x360 2-in-1 Laptop 14- 
>>> eu0xxx/8C15, BIOS F.16 12/16/2025
>>> [    5.489862] RIP: 0010:kobject_add_internal+0x423/0x470
>>> [    5.489864] Code: 63 20 e9 a4 fc ff ff 48 8d 3d 79 42 a1 00 49 8b 
>>> 74 24 18 48 89 ea 67 48 0f b9 3a e9 24 ff ff ff 48 8d 3d 70 42 a1 00 
>>> 48 89 de <67> 48 0f b9 3a 41 bc ea ff ff ff e9 d1 fd ff ff be 01 00 
>>> 00 00 e8
>>> [    5.489865] RSP: 0018:ffffd044424cfa98 EFLAGS: 00010246
>>> [    5.489866] RAX: ffff895f026956b0 RBX: ffff895f27c5b840 RCX: 
>>> ffff895f026956b0
>>> [    5.489867] RDX: 0000000000000000 RSI: ffff895f27c5b840 RDI: 
>>> ffffffffb38736a0
>>> [    5.489867] RBP: ffffd044424cfb38 R08: ffff895f026956b0 R09: 
>>> ffff895f026956b0
>>> [    5.489868] R10: 0000000000000000 R11: 00000000ffffffff R12: 
>>> ffff895f026956b0
>>> [    5.489869] R13: 0000000000000000 R14: 00000000fffffff4 R15: 
>>> ffff895f3b6e28a0
>>> [    5.489869] FS:  00007f7bda352c80(0000) GS:ffff8966ac092000(0000) 
>>> knlGS:0000000000000000
>>> [    5.489870] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [    5.489871] CR2: 000055ac09f17000 CR3: 00000001684a3001 CR4: 
>>> 0000000000f72ef0
>>> [    5.489872] PKRU: 55555554
>>> [    5.489872] Call Trace:
>>> [    5.489874]  <TASK>
>>> [    5.489875]  kobject_init_and_add+0x136/0x160
>>> [    5.489878]  hp_init_bios_attributes+0x265/0x38c [hp_bioscfg]
>>> [    5.489883]  ? __pfx_hp_init+0x10/0x10 [hp_bioscfg]
>>> [    5.489886]  hp_init+0x183/0xff0 [hp_bioscfg]
>>> [    5.489888]  do_one_initcall+0x8d/0x330
>>> [    5.489892]  do_init_module+0x62/0x230
>>> [    5.489895]  init_module_from_file+0xd7/0x140
>>> [    5.489897]  idempotent_init_module+0x148/0x340
>>> [    5.489899]  __x64_sys_finit_module+0x71/0xe0
>>> [    5.489901]  ? syscall_trace_enter+0x91/0x1e0
>>> [    5.489902]  do_syscall_64+0x7c/0xd70
>>> [    5.489904]  ? __do_sys_newfstatat+0xe0/0x170
>>> [    5.489907]  ? do_syscall_64+0x7c/0xd70
>>> [    5.489908]  ? exc_page_fault+0x77/0x170
>>> [    5.489910]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>> [    5.489912] RIP: 0033:0x7f7bd9d1bc69
>>> [    5.489914] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 
>>> 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 
>>> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 77 51 0d 00 f7 d8 64 
>>> 89 01 48
>>> [    5.489914] RSP: 002b:00007ffe11a56348 EFLAGS: 00000246 ORIG_RAX: 
>>> 0000000000000139
>>> [    5.489915] RAX: ffffffffffffffda RBX: 000055ee99a48110 RCX: 
>>> 00007f7bd9d1bc69
>>> [    5.489916] RDX: 0000000000000004 RSI: 00007f7bda30e44d RDI: 
>>> 0000000000000067
>>> [    5.489917] RBP: 0000000000000004 R08: 0000000000000000 R09: 
>>> 000055ee99899e80
>>> [    5.489917] R10: 0000000000000000 R11: 0000000000000246 R12: 
>>> 0000000000020000
>>> [    5.489919] R13: 00007f7bda30e44d R14: 000055ee99a42060 R15: 
>>> 0000000000000000
>>> [    5.489920]  </TASK>
>>> [    5.489921] ---[ end trace 0000000000000000 ]---
>>>
>>

