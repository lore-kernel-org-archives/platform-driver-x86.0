Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2049.outbound.protection.outlook.com [40.107.102.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0695B1A76BC
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698760; cv=fail; b=SQJnJe9SXEFfIJdWwJn9vPLQvowB821AnI87Xt+u6WzwJ2w0wP4VxY+jzn2LASRqqgEcI6kgB6khtY2ZTbxhFz91wh8pSmcCKFo8jogLWynNomqGSk5pybi4NHp3eT39T9xDsZlDxHUOzd+RdmySFuArwTxuAi25u8xnesRwPUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698760; c=relaxed/simple;
	bh=HZL8gL2LffjmDJ49zWIr5N2yJDBIjSzPk6P60CErVJc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eqFxSj/PNmBsXV9TdqybP+ks4Zz6mPoPBzE9qfHuztpTFPx82jMI3XqU3NkoQB95wyQGuWzejk0U6OArk8BH1ExWeIoXLovx8qjMEbbv4Q+JLWTvLn82vPnrJTyN+XdGY4y31X9Uqmkiz2zzzbDX6mo5gP0TkqcIGTsRkMuvsmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sekL/kGQ; arc=fail smtp.client-ip=40.107.102.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sekL/kGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkbJk7z2ubFj6xUPp0a17D74ol6HJxx2n/+RXyprMjrRFLkjUMftAE03geje3mH2RTsZMEqSK/0m/dl5O377gdUzSoQ3C2iGZjQSrx+YvHmA/VI2M42AD7ApxGl/hbFrEhqgDH7OC+MdRF8mRjJTi1+4f+fJoQGnxMjHz4c85nDJz50GTk4bACgvXHksZP2jq9fXEesSd5xslq0Kd9ahM7zBn/5QlZPIDz4CEjzmVRZ9K6o0dtsJHoqxSQhtngZhMBFKnQ8jzOFAwuuDvekKX9xdPF4rBJmmuwWpuUqXfY2sErjcQpfNLBlGLVSB82h/GRDaujCGp2fcI2gCj9UxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l6oqVnPHml+l+cWtp7EpZI6YW612Efbq/s80aKfX3k=;
 b=eXpnSzP7EG57sXDA8mqC+ozaLI3RZ1f1jVoNTO05xkwjPTEQt912XLeid2EbPGmkJwCj/TxcDZA1tpVjefKqnTDIi7PFkKeBu7p8R/PlyC+rC6dyJD1m/xyuJ/HvXXBOk/5ZUuhLDGjF/8l1glwjKOdx24uh1C7dlUf4i4tkyJMvWnmnnoCSFSAtXn/08PCqSYQaT8QdXkKLWfUpf49MD23LfVTXlJtiGswq2+C3MYLJHs5gHVGqXTEb1HGJmK7xHH8bpHi4oPg2gUQhCm62Ys8ZmC0aupmtR1FgsDn6GnqsjNdmeblhADQ9jFwipVGVri8U1LZphRvFOkpgpDSqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l6oqVnPHml+l+cWtp7EpZI6YW612Efbq/s80aKfX3k=;
 b=sekL/kGQgR3xH6pO6kKIf+CMr9bCB6wd2ulsCdCyN2/kdm3cCjlNg+bn3/o6TnnpiDyJLd/Su4EKJEs9fF3I22Tlu14Hru5gjyRquoo8bUO6ZlnWwRivNSgHda9amIcV+5KxOx75yXxf7ZtsXGLL9amiYtFgeAx3SvXsJwEezRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH0PR12MB7471.namprd12.prod.outlook.com (2603:10b6:510:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 15:52:32 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 15:52:31 +0000
Message-ID: <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com>
Date: Wed, 23 Oct 2024 21:22:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
 <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::22) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH0PR12MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: c031da85-dcff-4fd2-13a9-08dcf37ab44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDNFcHI1THhzNXR2NXRGWmplTDJzL1F4VVdhRFk2dkI2NC95ZzEzR3FPMGtq?=
 =?utf-8?B?ZTlLOEt4enRPM0hnWnBaSWxyUmw0VERtd3lNdFRVQUdYZGVwVkJwYzFVMmpR?=
 =?utf-8?B?c3MxVWRGZHBiTFRzY0psYnZOWTNRNFVpTDU0UktFK0NYN2NRVmtIYnlzTk5y?=
 =?utf-8?B?YlVSVGJnYi9YN2VNYmJoTWdWbHhMQy9veTVjTG4rd0kxOUtKcGFuMVVOM0JM?=
 =?utf-8?B?STg2TWQrNFlOYWlBeTR6TXZuUituL09OenJmVTJlSk9jL0FQLzY5eTJ1UzMz?=
 =?utf-8?B?aC9CLy9FYmYwMEp1M0l3REF1VmgzTktrcjVuN3hBb2tXTTU2eVV0RmFYY1FN?=
 =?utf-8?B?ODZ0WmV6NGRtamhzY0VLZG5QYURzdUFjTFNzNThRYTVlR09ORnpOOFBETWxG?=
 =?utf-8?B?enR2c0lTTEh3T0xjdTVWVFAyNDEzcTZaQjZra2txZW9QRXhWZm1laXZWZkVO?=
 =?utf-8?B?UUlENXk0MU1vTDBjTmR2S3JOTGRKcWM2OVNLbUQ1L2N5MUk3T01tem9CTkxR?=
 =?utf-8?B?Y25uWWQxc1NzT0NKSnpRSkhDS1lOS0NEbUt5VjN1a1doeTdTWGt3Z1pQNDE3?=
 =?utf-8?B?NGRNa08zS2hlMzVhZjFmZXJuRDRkZG5DYmNyMHlXQmsxSnN3bUhDc2hGL0h6?=
 =?utf-8?B?RUJ6a1NabjczMzRYbHNaTnQ1Y2RnWjVVZklrNDlTdEtPNHhyV2ViQjhRaTBa?=
 =?utf-8?B?WGc1ZWxiOStSUW1ZelhvV2FxUm9FTGJ4Sko3Zzk2ZWdSdXYweDk1eGR6TDdI?=
 =?utf-8?B?T0IxYXA0dStmTjlNS29nYWZGK2J2RnZOakJXNDlJMDB2dWp5ajBRTk5UMEVR?=
 =?utf-8?B?WVc1ZWpFNVVMSzNySmcydHNyYUd1aStpeE1kd3RPVWQ2bS9HWnNubkx4cG1p?=
 =?utf-8?B?OEkwWm9PMkZFTGV1c005Z1NWWVlSTlhwNkdhbDhCUWVic0tzbzRkZDlwWTA0?=
 =?utf-8?B?ZWliTGNxdkV0Y0JSakxmeGU4SGgwK01sU1JueDh1RjRFRGdESElxNHNCMCtW?=
 =?utf-8?B?ZG85dThvK3RPNWtSNzM2WThOcmx1eVRKTVhBWG1CL0MvdTZxMHNuSzRvRXFG?=
 =?utf-8?B?S2hFNjZrMTRqR0tEbitqVTZPeHpOZVNhMkZFbkRmMXVka1JqcnNkSklGc2dH?=
 =?utf-8?B?TVk2cFlOVnd3SCtaTmFkdCsyR1R4Z2V1N1oyMVBsOWIrOXFJRlZwelhkemNF?=
 =?utf-8?B?WXdoQkNGRStVcGRrNW4wUmR5Z1AwSDl5bWRMOWtSMVJJczl1R0trTStOMjBt?=
 =?utf-8?B?NzAwVzNzY0w5ZmdLVmRtclhQallzZUN5VFQwMVY4SElMSmJEc2RqU09GeUc1?=
 =?utf-8?B?OG5neEcyZHM1aXFKdEVaa29tYUpUdktnelVnZWtsNFU5NUkrQlE3NFVhZWIv?=
 =?utf-8?B?Si9iMGg4cTZkWlB2c2tzdVgxOHU5cVc0MWZqR0Y1dG9Nc1NGMUJrSDN4bGVn?=
 =?utf-8?B?cy9oMVJYKy9JZEYvNURxWkNDcEZ1d1laNmh5dG5ZTlVDNitURTJLZXdHY1Fs?=
 =?utf-8?B?dlZaSlRKcTU4bjJyeEZZdkttWFRVOXAwZWEyeThIZ3BQRTIrMFlpbC9KRGVF?=
 =?utf-8?B?eVZmanZhd3B0NlVXcVF1S2JSQjY5RVN5YUlGNjAyZFh1MmY1UnNWa3RFaHFV?=
 =?utf-8?B?aHgzcXhpbmVLakxXVHNmS2g5Vzc5Z20vSU1ENHliSFZlSmgrRDZtR0ozUzd1?=
 =?utf-8?B?cjUwYjcveklLN2pJdmxnT25OL2pTb04vWTRHZGNaMTFncFlSckJNcHl0am5q?=
 =?utf-8?Q?DYq4/qe96BlyL3Cb6sez/EuBA8LEM6z09fpZUea?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OStSNGFrZ0JUREx6cENFSFEyU0MyUXJGUWoyWWlPV3J2RnlKY2FEa0plY2RO?=
 =?utf-8?B?am4xeHdGTE5haXpWQXVMYVJQVU5MQVZ5ZHVJUmlXREZTUTQzMEhTclRPWjVk?=
 =?utf-8?B?eWpzU1ZFSGNNclpsRFlKUkxSQlAzVHZDTVBkMmdoa09VdzltbDViSDdIcEdD?=
 =?utf-8?B?V2pkcTBXRm5xSWRGQk1kVTlwOE5HUHFlTHcwK1pPLzFReFY3Q0NLT1BhOWdu?=
 =?utf-8?B?VzFuc2JhdmQ4WTlNU21HUU1yU1IzK1lJNXNRMmtQYXlvazVLOVQ2LzZCVUJx?=
 =?utf-8?B?ZXhoV3RHVEdxQjFXQzNJbkwvYzFMaG9vUjV2dU1IeFp1NHNLb1ZnV2wwRVpV?=
 =?utf-8?B?NVlPbFdYOTBmZWFGR1ZJbmhzdnYyYkg1OVpLRmplbmdjZjZ2ZGFJbmY1bmpS?=
 =?utf-8?B?VHVzK3lMeTM4TlEvZWdoK2VscllFeTZ1QmJIMktFbFpCRGRaaEZ2ejJZNHB3?=
 =?utf-8?B?bkFCbm1sRlpJWmhtVzhvb2xHVGlBbVlyWUhtcUkrUERHcmRTWHNmQTJnRzBS?=
 =?utf-8?B?WGFCeTZwTWQ4N29mcjRZb2liUUxHdmNNb05ralJsWFdrVXFqWWtBMk1JWmYv?=
 =?utf-8?B?MFR4dmJFVlJnT0lpaDZSQ2FhV3BIQkN6NmdUdjM5bzE2VTYwbW9QMVpBbm5L?=
 =?utf-8?B?RklYeFRFdlpnNDkrcktUK242K2hhUisrVTdNVzhISjNZUXdXbWhZd2grcDBp?=
 =?utf-8?B?UmtKaHlQQ3Y1UmxRVEp6Q3dab1M5U3ZJUytVRSsrK2hhK1lsL0tUQTZ5ZW1T?=
 =?utf-8?B?L0Z6RHJvamVGUDJweUtUb1FGZTlncHRXaThUa05UV2RMME5lSkdIZXdETThZ?=
 =?utf-8?B?VjQzU3JMdG11dUc0VjI3dVdjaTVyRlpRaU52RWMvdmxPZjZGVjBGSExRb25o?=
 =?utf-8?B?ZFhOU0dWSnFDVXVRa2hTdDNnK3lVTDJIMlZ2OUZlRytJZXZNaDNyQjlyYWEv?=
 =?utf-8?B?ajF5UDIvYWphNW5Md0NpeXcwZzFYMy9rdEs0TjZVdWhTcnVaYXF2WVJzYTVj?=
 =?utf-8?B?a2pHL0t2cE00VVdDbmN3ZHdjejhLck83SFhaemdISElsNUU5aVUyNXJPcFow?=
 =?utf-8?B?U0xyR2thNXRWczUvaHhoREIyK3VnSGpqYWgvODA1R3lTLzJGM05CRzBkYnJ3?=
 =?utf-8?B?a2NtNCt6WEh2OFNGMUFRU3V3RWRYVlRzNFBRbjBLWW9wKzcrcUh1NGlXK1Y0?=
 =?utf-8?B?ZVRiMVhObHQ4bkRQeURqSFVKN3d0R2NFYnZzRllMUnRyVWQvWGdSWm5yZU83?=
 =?utf-8?B?dFlSS3Z0V2pxUXJPbzh6VXdLQkpCMGU3cnRqMUorS2hERWkyNk13Nk92eHVx?=
 =?utf-8?B?UXdUTTZtVGc3ZkZKUEc1V1ZJWkJwNW9SQ1cyZmdLekUxUEswcTJhdlBtamhz?=
 =?utf-8?B?dVRab0R4VkplM2ZHbWxQZGU4ZHBEbzlKYlJoMm9YWEJ5UGNlUDZTak1pTG5P?=
 =?utf-8?B?NEQ0d1RrRnhmdmEwRTVyRmMyS1dHUzRXUXhrYWRoMFdzTXVGZUwyWUhUWnRa?=
 =?utf-8?B?SERrSVV2Yy9GdGJFaTc4WnEyZldUdklxZWI1UkZHODd0MGhyUXc3aGFaa21n?=
 =?utf-8?B?M3ZDbEJLYXJJRHg5bGo1R0xIN0hSamp3UUE1aTZrOVdJOU55TlBWbGVTVlVq?=
 =?utf-8?B?L1I2eUZsYUt4QUJqR0VkNTdaZGtaQU1FTWJ3eWtvWEt0WmwrQzZQVmdUTWlt?=
 =?utf-8?B?KzRKQ3BwRG9aZjh5OGpFOElHTFQ4Z2Zaa0RNLzFaaUJ3ZXkzWDArZFMvWUpp?=
 =?utf-8?B?eWNHL3A5eU5wbHExK0tIa3E5VW5kM3NhaUJjZ1VqNjg5eVRnS0pOaFJHMVJW?=
 =?utf-8?B?Q2hpOTZYQ0txdUFQOXR5TWd6Z0M3ZEJvaUJESzltWVNRampmeUdkYW85eGx6?=
 =?utf-8?B?TG9iS2daOGRyVktiUWJXdXZoZDJJYW9FbEd1QW1PQkhEYXJCSGVncFhSN2xP?=
 =?utf-8?B?aFBCUS9ha0lqMDlCclZNeGxKVkhDTnhUbFFPMlFJL0VLVG1odlY2Slc2dW1L?=
 =?utf-8?B?MnM2eVI1eDczZzFyMnRITnJPUmZIS3BML1ZCTFE5NWh6WUprdXN1T0F3TTlO?=
 =?utf-8?B?aXR1dGxWeEdkc3ZqdEVBTmNNYVZwWmx2YWVsYVc0V1RTQTExcFMyVGxpMGZY?=
 =?utf-8?Q?hRu+vg7uv4y8/vl0xqsD2Cgf1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c031da85-dcff-4fd2-13a9-08dcf37ab44a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 15:52:31.9111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sddDWFJvmo+UqQQ9oW5mysDvQHSkbmmOPK8bL20iZ7FDAxX7z2T158pKmbt9DMil5nOo3Z2M2Zg4l0JK1CP5eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7471



On 10/23/2024 21:10, Mario Limonciello wrote:
> On 10/23/2024 10:32, Shyam Sundar S K wrote:
>>
>>
>> On 10/23/2024 20:04, Mario Limonciello wrote:
>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>>
>>>>
>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>>> The PMF driver will allocate shared buffer memory using the
>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is located in the
>>>>>> secure world and is used for communication with the PMF-TA.
>>>>>>
>>>>>> The latest PMF-TA version introduces new structures with OEM debug
>>>>>> information and additional policy input conditions for
>>>>>> evaluating the
>>>>>> policy binary. Consequently, the shared memory size must be
>>>>>> increased to
>>>>>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>>>>>
>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>
>>>>> How does this present to a user?  From what you describe it seems to
>>>>> me like this means a new TA will fail on older kernel in some way.
>>>>
>>>> Newer TA will not fail on older systems. This change is just about
>>>> the
>>>> increase in TA reserved memory that is presented as "shared memory",
>>>> as TA needs the additional memory for its own debug data structures.
>>>
>>> Thx for comments. But so if you use new TA with older kernel driver,
>>> what will happen?  Can TA do a buffer overrun because the presented
>>> shared memory was too small?
>>>
>>
>> New TA will fail on older kernel and hence this change will be
>> required for new TA to work.
> 
> OK, that's what I was worried about.
> 
>>
>>>>
>>>>   From user standpoint, always be on latest FW, irrespective of the
>>>> platform. At this point in time, I don't see a need for FW versioning
>>>> name (in the future, if there is a need for having a limited support
>>>> to older platforms, we can carve out a logic to do versioning stuff).
>>>
>>> I wish we could enforce this, but In the Linux world there is an
>>> expectation that these two trains don't need to arrive at station at
>>> the same time.
>>>
>>>>
>>>>> Some ideas:
>>>>>
>>>>> 1) Should there be header version check on the TA and dynamically
>>>>> allocate the structure size based on the version of the F/W?
>>>>>
>>>>
>>>> This can be done, when the TA versioning upgrade happens, like from
>>>> 1.3 to 1.4, apart from that there is no header stuff association.
>>>>
>>>>> 2) Or is there a command to the TA that can query the expected
>>>>> output
>>>>> size?
>>>>>
>>>>
>>>> No, this is just the initial shared memory that the driver allocates
>>>> to pass the inputs and the commands to TA.
>>>>
>>>>> 3) Or should the new TA filename be versioned, and the driver has a
>>>>> fallback policy?
>>>>>
>>>>> Whatever the outcome is; I think it's best that if possible this
>>>>> change goes back to stable to try to minimize regressions to
>>>>> users as
>>>>> distros update linux-firmware.  For example Fedora updates this
>>>>> monthly, but also tracks stable kernels.
>>>>>
>>>>
>>>> Advisory to distros should be to pick the latest PMF TA (note that, I
>>>> have not still submitted to new TA FW).
>>>
>>> Yeah we can advise distros to pick it up when upstreamed as long as
>>> there isn't tight dependency on this patch being present.
>>>
>>
>> That is the reason I am waiting for this change to land. Once that is
>> done, I will submit the new TA, you can send out a advisory to upgrade
>> the kernel or this change has to be back-ported to stable/oem kernels
>> for their enablement.
>>
>> Makes sense?
>>
> 
> I think we need Hans' and Ilpo's comments here to decide what to do.
> 

Sure.

> I will say that when we had this happen in amdgpu for a breaking
> reason there was a new firmware binary filename created/upstreamed for
> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
> have fallback code so it could be compatible with either binary.
> 

True. In case of amdgpu, the FW loading is part of the amdgpu driver.
But in case of PMF, the PMF TA gets picked from the AMD TEE driver
through the TEE commands.

So, there is no need for FW versioning logic in PMF driver.


> * If user on older kernel took newer linux-firmware package they used
> older binary.
> * If user on newer kernel took older linux-firmware package they used
> older binary.
> * If user on newer kernel took newer linux-firmware package they used
> newer binary.
> 
> If the decision is this goes in "as is" it definitely needs to go back
> to stable kernels.
> 

IMHO, let's not put too many fallback mechanisms. The philosophy
should be use latest driver and latest FW that avoids a lot of
confusion and yeah for that to happen this change has to go to stable.

Thanks,
Shyam
