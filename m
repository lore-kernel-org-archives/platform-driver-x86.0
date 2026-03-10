Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78339936E;
	Tue, 10 Mar 2026 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160529; cv=fail; b=iNEy3uX1DwglapiHjWHwWOHQ8c9pqM4U10vgNPdPaRp4NuPk1okdQB3reCh1dEEqLVXgZkkqFjjwOehxc2qTXoKC2R6LbkyK2s7XDU1N+3DAlhc8LeMwgJSoi1pVWPcOT59CqQ8bpqL4T9sjOP+9HpuPTxOWeOEVBqJlEOmINnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160529; c=relaxed/simple;
	bh=IPXTHd1WxcNGTFGckJmGHqGZntMJntN6wCSAs1SKpnU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KXkKnGaNNC27ACjH1g5yjiD8Hdq3EoPQD407fKJcHY1EaHrapQJ/rnDrnuFViLT/BVxc89+gb8hYLvjGFYRdrt7ZOGn/zGysAWjSLK/o6PPIpbXK1v3bd7RNSiUo8kj7CAy94mJwdCQDi2bO4kR/otc1yTNTGUm5ht5FPWrUimc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t674Og7d; arc=fail smtp.client-ip=52.101.56.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t674Og7d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuH/74xUgtUrk+iS3sxHVrD+ixNqGHYFPjNT4mNN690k9v+4Z5ubBSUllTDshFdZsROZFKH/fHoDnswIhxf6IHVWHUzIberV+4fVEYkxolxBHQzsL+fAfByXVeKmzmV0/q9QPInzYaY+n2gcEsZ0S4RIE3H0l+ZLiGDqn9JFCzPjpt+ObjODQoUkiRt/Fo0wC77y3TarId6EsW3sOBI6OzbroBuP2v1FZ//+npWAt3uoZY81eBuZnAbYFxcBjcBHN0B1IQjbzu6vy8OHuSXOCI2OM7ViCgqLWLmuWlMhDXVZSDGBxDFnpE36LDM0Y4PEbX2yFqqjh0V4LOz++WmtYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgFbAZGD4dd6gACY2of4cw7SLAVtq5eJgBHBQI7ymtA=;
 b=vQ3kW2klhCuOuKx3IYe+OWhVlDDySxjZyG4U0CRp/y5zz4kpqMZwxdN32Cf0aq8Kpq+kJS7aFyaA2TBkdoW9/yRaP512LdpICuJYOiuBCGydVGL9feGH5TfPkTJ3P5Gi8F8xoXCw13MePpUnkpEzAKLJjK/ombzC9LisQ+ouORFeg7uH3zpXPMHXLY0+fl91fIYXUlzMdVOZT+HLoS5i2M/SNdZJFLNnPwJDSRvqRTyBi4x39PMK3ZCbOKmy6JDq0UCvGHCR1s9KQbG3nCDlkbzmwN/MddEiHRlzjpXP2wf7CsHTYikoguVmhCNahRyyCIFlxE8zAOiGsAXJoGUEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgFbAZGD4dd6gACY2of4cw7SLAVtq5eJgBHBQI7ymtA=;
 b=t674Og7df2uhli+ON6i17hUMS7ssDvXu4Yccz0iT5Tf7PtbFZLht5XDtI5Ab+EvPdQaXS9//WGcbbgRcWWOmUQtVwjp3Q16nt7QCGqlovXgJZDZwh7XvuMoIcal/rxSvmee7p19zUfNa/gep+KYbGiKxGlW2D09pB5UCtz7fLY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 16:35:20 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 16:35:20 +0000
Message-ID: <6545b671-6e51-4899-af28-354e7e423056@amd.com>
Date: Tue, 10 Mar 2026 11:35:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 4/4] platform/x86/amd: dptc: Add device entries for
 handheld PCs
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-5-lkml@antheas.dev>
 <d5c2a4e0-1263-42ac-a64a-c6218e91bc09@amd.com>
 <CAGwozwFpgGV96YjaZbVfBosBL8TqXTtYJ=Av5tHSi24zV_-SMw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwFpgGV96YjaZbVfBosBL8TqXTtYJ=Av5tHSi24zV_-SMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:5:80::17) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|MW6PR12MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf07e64-546d-417e-bdd7-08de7ec304ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	shD4c1O6yLNJSu/aQKgVT8GYgyZxMp91cxySJmQOCGN/jF5wJP7gpw052k7ofpJ4XHWatNRWjj4KgvSOTQVYay13f5XTtDZuqV8b5RAF7IglaBRg4h49KUbx3aJWg3k4rwaj+X+ESihiBAuaBvlDoOg1HPA6xedW4j66jvmNh2dtrR2fqeL26cpAnoGnpFzEVVGLtknKJtKzdlHl0gnegI22nMEWd/WE9V4I3e8D8bA2D9ErN7hq99a7c9S98SzKCeFN9kwIwGulHtW+noAzON9EFS3ou1UCKNy4tVCsEE8/w+qdx0tRPRRbjyi1E187oufAHiEggtHLUDHi0AtM/2V4XWdLJLBgu7F1kxJCAOXwnsNidlK2/slPnfg+yA4WQ84N7RQ5POMCHmi7lSEEDYBFes/DkP+03lV8tylA9/6cPznQSDiQhXudOaawgIHX+RsglJ+9Mwb7v2dCxKh2fmTDZrnEMe5HNQmd8JMOdvJGtb8O8sNUuxu/mLJRnUPT/yUeKNHW9+B4georCbUKQNx8CAyYCAFBlxi+TIi3w7pfUKjqV6MZA/YYSMvosmU6OTXI9JPwYF+T/Dr9OqcB9f8Siq48vxLyBmns1Yw08Jv4Pxo0+sZ63B34wT4h9BUHJY2TwtMB9lh2bHg3vEka7RNZ1P81UMeOjWoi2/5iVbZi7huof3Lpc9e2UkD5FGauB3iGb1jYp4KniI8VvUf1U+eIgWxSb86mhEgiDHs6iQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGRPM0ZTVndocUpka1Jhb0lTWmYrbUhtUytPSnhla1Z6aG9ESmtCNEFHMXdQ?=
 =?utf-8?B?Wml1RDhDbGZnak5TdStmRUlNd3QyM0hFRVhHRUxQT1dCU1lucTF1MVJWVE1Y?=
 =?utf-8?B?eW5hZ0k0OE5YUlpKdGFWTjYramIvU1AwUUZmWFR4OVQ5RDFHQjV6MGVaQWtx?=
 =?utf-8?B?dUR3Z3Q1RFVSL21Pdk5wbk9jV3ZvZmJIakJwdnhXSCtZL0Z0WHVDUVd0YzJU?=
 =?utf-8?B?NXBlUFZMV2JiZHduTFI1U3Q1NFNSWHlPYXBKZDVKYzJyRi92T3VpbHF6a2Qr?=
 =?utf-8?B?eHgrTmlBVUxiN1JQZVlPRlB3ek00VUdqRUxUb29EQktxVW1jcTBxOUFWVGpj?=
 =?utf-8?B?NDRDWkxCOEtVeTlweWVsOUpaZ2VmNVNKRXNrQnUwZmZNYW1ZR2Z0S0JRTEpk?=
 =?utf-8?B?bm5yTkovMDF1dVZKd2pIZHc4MEI5QWF3alowMUp5eXNPQitMU05ROVp2Rmtj?=
 =?utf-8?B?aVhMUXAzT21ZRGZOZDdSMFFwbEd4QUNvdU5YWGkwOXlKYWFKaW5YQ2dSaDZQ?=
 =?utf-8?B?Y0FlQVZyRWkyWDkxUFlMdzR3bTM3NXhLbWdNRElsWDVCZXZMNkgzZXB4UlBq?=
 =?utf-8?B?cDNOVGtvU1lRY1JnMkN2aTB1QkRYNWpsNTZwZzk3cGZNVEJIZTlrNVI1M1lC?=
 =?utf-8?B?Qlp0bVFqNGcycFpCQVlhTGgvbVpDVisrckxpUURZa05aQktOT1FqaEVaaXB2?=
 =?utf-8?B?dzAvMTFQNithaWVKZ1lzS1VhKzYxREdLMkdQaVRDRzVwZ1ZxazV4dzFXUTZv?=
 =?utf-8?B?TWZ0R0ZnM1FpRU1QYWg3bWNpbjNZdHJOeXRpRWVtRDl6djhYVjZCRmI0QnFz?=
 =?utf-8?B?T2JtUktSME9PVjdNNFVFUjJ1MENnT1E2Uk1QQnFmUkc5eW5NOGg2Z3hWR0lj?=
 =?utf-8?B?cThLZTgzRXNJS3UrRDE2S2N0WFdjbVdzeHBnekZzOTk1NWU3WEE3dlVrQTNs?=
 =?utf-8?B?anpEejA4VUl3WVBBMFRzWVhYTTZWdWVnaE1XM3JlY2hHKzlQK3RhaWd1UFlZ?=
 =?utf-8?B?WFhMbWplQmFjakJQU1dZZEFoNHRaUW1VQ29tWXZBY1EvRUNDUjNoMVZ4K2Mx?=
 =?utf-8?B?Q3QrN29OQXpoZ2hLUFBNSEw4YnZOL2RLKytJMGxDZHArNmh1SUdMRG5QS0VJ?=
 =?utf-8?B?L3dwVHJyWm40S3JJUndHYjRCaWMyTFJtSmZHaWZwT09JcmFSVWxhZXRRbk9P?=
 =?utf-8?B?Wm9JV2cwL092eDgwcnJoODJZN1pzclUyMXVLSDY2S3dFdHYxSmtwZWdYWlM2?=
 =?utf-8?B?SHpDZnBielZEdnJHVGxSMzEvNXVtUWNJUllOdFppRTdSYmZtaEIvMzk4a25a?=
 =?utf-8?B?UythKzFDSnplOWpUZmdNZG5Ib1dMRGN1dHA2T0ZZOUdVMW1zM1o5Z0c4SDVB?=
 =?utf-8?B?elNjZnFzZ2FUNVN5b1kybXBCbG5tYXY0NnA4NzZIdFYxdTRvMnVhZjFOZFRW?=
 =?utf-8?B?djhFL2hwR05YSFBTYm0veGxYUWtkUHVraS8xL3ExMjI3ZTdyMGxVNDRZMDd6?=
 =?utf-8?B?YUUxMC8zQlpXcEpGVXhOak81amsvVHZKSGVtLzArdnBjaDJpL3hBWTIwbFRC?=
 =?utf-8?B?TjBVQ25LWDFaUWtwRmVPM2VOSmdYUlpFQU9ENG9QV3VKZTFkb2M2MVVCeDND?=
 =?utf-8?B?V2pIMXNVY3BYSlByelRQc1dLeHlLTnJJWWxzajBiN3RzNlJvdWVQQlc3bDg3?=
 =?utf-8?B?TE9nenJjWW9qenNwNXIvTEhVcEk3NFM4WjRUY0JJZE9qVDBFQnhJNm1KK090?=
 =?utf-8?B?clBRZ0gwd0hEcThhK2E5RHBXckdrZlNTcEoyT2s4ZDNlY0JEZXlmbVh3TkFo?=
 =?utf-8?B?VHlvR2JWV3lHazVWcUtBckd5WUhmcmNZbUVLWVY1b0dvNlVTRG41a3JTSXJN?=
 =?utf-8?B?RWEvd0t6aHVJcE1odnlCREE4TmlCNnl0amlsV1FqQkVUM09hbnVTWitTNUJL?=
 =?utf-8?B?ZWpqVi9RV0ZRUzlVV3BGSGx1V2RmQytMeENGSFlCU3luVTIzdFVGYmR3RWN5?=
 =?utf-8?B?TXBnbmc1VzlHQXlaREticXU3M1ZGNU1QYUtWMENsUnZuVlYyZWRnYzZpUkVC?=
 =?utf-8?B?MVRXMDNsNC9La0MvYWtwUlZjd2dZV2JKQ3F5WG9IcmNIQysvb1MweENFVVEx?=
 =?utf-8?B?a3duTnlSbDVaajg0RkhZTUozczhhK0NMUW9JcktYaVVPbGJnblJCRndydGxP?=
 =?utf-8?B?UHFmYkM1am9LbHVzQkc1S2hFL21WYk4zRUIrQS9zWDRWTE51N1NWYkE1RnBx?=
 =?utf-8?B?bTRueWZQTXNDY1dyaVM1S1I1RWJBY2NQbEMvb3hOamtPWmhPVDRTYWRBb2d6?=
 =?utf-8?B?cWR1dDRac0E2Q0lWK2ErT2w4Q3RmRmNiVDhTV0t2U0o4SEdUSk1qUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf07e64-546d-417e-bdd7-08de7ec304ff
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 16:35:20.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvGRTiMv6/fXK3A9RjYbgYT9HU7qXEAto9Jbpg2TTocF5rc9YZ8UbATTu76wSscUkZG0fBMHXVNrKXCHGNx3xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735

On 3/10/26 3:13 AM, Antheas Kapenekakis wrote:
> On Tue, 10 Mar 2026 at 05:11, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
>>> Add limit tables and DMI entries for AMD APU-based handheld devices:
>>>
>>>    - 15W class: AYANEO AIR
>>>    - 18W class: AYANEO AIR Plus/Pro
>>>    - 25W class: AYANEO AIR 1S, NEXT/KUN
>>>    - 28W class: GPD Win Mini/4/Max 2, GPD Duo, GPD Pocket 4, AYANEO 2,
>>>                  OrangePi NEO-01, SuiPlay0X1
>>>    - 30W class: AYANEO FLIP/GEEK/SLIDE/3, AOKZOE A1/A1X/A2,
>>>                  OneXPlayer F1Pro/2/X1/G1, AYN Loki Max, Zeenix Pro
>>>
>>> Also add SoC strings for Ryzen AI, Ryzen 8000/7040/6000/5000
>>> families, extending support beyond the initial AI MAX series.
>>
>> There are a lot of numbers here.  Where did they all come from?  What
>> are guesses?  What came from RE?  What came from documentation?
>> How do you know these are good for the thermal design of the platform?
>>
>> I appreciate some of them could be cargo culted from another codebase,
>> but I think it would be a good idea to document which ones are more
>> likely to be accurate and why.
> 
> Ok, here is the logic behind the limits.
> 
> 15/18/25 are manufacturer claims by Ayaneo. Ayaneo is the only
> manufacturer that made devices prior to the new ones that support 30W
> limits.
> 
> 28W is used for GPD because their devices are very portable and 30W
> makes e.g. the bottom pan of Win Minis too hot. It is also used for
> the Ayaneo 2/Sui/OPI, because these devices have a fullwidth glass
> front that is used for heat dissipation. So the screen gets very hot.
> 
> The rest of the devices use 30W.
> 
> As for which software each OEM has. GPD: GPD does not ship first party
> software for TDP controls. They collaborate with an independent
> developer developing "Motion Assistant", which they also ship with
> their devices and features a TDP slider. Ayaneo uses Ayaspace, which
> is backed by Ryzenadj, and they give slider control to users,
> typically with a 30W limit. They also use userspace customizable
> presets for some default e.g. 20W profiles. Onexplayer has oxpconsole
> with a slider as well that does 30W usually. Ayn exited the market on
> WIndows handhelds, no software. OPI, you'd need to ask Phil but this
> would be the primary driver for it. There is no alternative that can
> also go to SteamOS.
> 
> The reasoning behind the profiles is simple. 8W is power savings
> territory. Going below can yield around 1W more, but the performance
> degradation is not worth it. 15W is a good sweetspot for 30W
> processors. Then, 25W is good for these devices as they saturate above
> 22ish Watts. We could even go lower to 20W, as Lenovo did on the
> original Go. But their newer devices use higher AC values.
> 
> For their boost clocks, sPPT is set to around 2W higher than spl (what
> is it called now?) to give a small boost. fPPT is set to a reasonable
> amount for that device class and interpolated vs spl. The exception is
> low-power where we do not want boost
> 
> Antheas

OK, each and every one of these cases needs to be documented.

I suggest that they each go in their own patches, and then if there is 
any disagreement it's a single patch to revert or drop from the rest of 
the series.

> 
>>>
>>> Assisted-by: Claude:claude-opus-4-6
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/platform/x86/amd/dptc.c | 420 ++++++++++++++++++++++++++++++++
>>>    1 file changed, 420 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
>>> index f4db95affb1b..b2820f8652f1 100644
>>> --- a/drivers/platform/x86/amd/dptc.c
>>> +++ b/drivers/platform/x86/amd/dptc.c
>>> @@ -86,6 +86,81 @@ static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
>>>                                 1, ALIB_ID_TEMP_TARGET },
>>>    };
>>>
>>> +/* 15W class: AYANEO AIR (Ryzen 5 5560U) */
>>> +static const struct dptc_device_limits limits_15w = {
>>> +     .params = {
>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  5, 10, 15,  18 },
>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  5, 10, 15,  18 },
>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  5, 12, 18,  22 },
>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>> +     },
>>> +     .profiles = {
>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 10, 12, 15, 0 } },
>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 15, 15, 18, 0 } },
>>> +     },
>>> +};
>>> +
>>> +/* 18W class: AYANEO AIR Plus/Pro (Ryzen 5 5560U, Ryzen 7 5825U) */
>>> +static const struct dptc_device_limits limits_18w = {
>>> +     .params = {
>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  5, 15, 18,  22 },
>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  5, 15, 18,  22 },
>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  5, 15, 20,  25 },
>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>> +     },
>>> +     .profiles = {
>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 12, 14, 15, 0 } },
>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 18, 18, 20, 0 } },
>>> +     },
>>> +};
>>> +
>>> +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
>>> +static const struct dptc_device_limits limits_25w = {
>>> +     .params = {
>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 25,  32 },
>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 27,  35 },
>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 30,  37 },
>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>> +     },
>>> +     .profiles = {
>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 20, 0 } },
>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 27, 30, 0 } },
>>> +     },
>>> +};
>>> +
>>> +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
>>> +static const struct dptc_device_limits limits_28w = {
>>> +     .params = {
>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 28,  32 },
>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 30,  35 },
>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 32,  37 },
>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>> +     },
>>> +     .profiles = {
>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 22, 0 } },
>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 32, 0 } },
>>> +     },
>>> +};
>>> +
>>> +/* 30W class: OneXPlayer, AYANEO FLIP/GEEK/SLIDE/3, AOKZOE */
>>> +static const struct dptc_device_limits limits_30w = {
>>> +     .params = {
>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 30,  40 },
>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 32,  43 },
>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 41,  50 },
>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>> +     },
>>> +     .profiles = {
>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 25, 0 } },
>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 41, 0 } },
>>> +     },
>>> +};
>>> +
>>>    /* AI MAX Handheld class: GPD Win 5 */
>>>    static const struct dptc_device_limits limits_maxhh = {
>>>        .params = {
>>> @@ -107,11 +182,56 @@ static const char * const dptc_soc_table[] = {
>>>        "AMD RYZEN AI MAX+ 395",
>>>        "AMD RYZEN AI MAX+ 385",
>>>        "AMD RYZEN AI MAX 380",
>>> +     /* Ryzen AI */
>>> +     "AMD Ryzen AI 9 HX 370",
>>> +     /* Ryzen 8000 */
>>> +     "AMD Ryzen 7 8840U",
>>> +     /* Ryzen 7040 */
>>> +     "AMD Ryzen 7 7840U",
>>> +     /* Ryzen 6000 */
>>> +     "AMD Ryzen 7 6800U",
>>> +     "AMD Ryzen 7 6600U",
>>> +     /* Ryzen 5000 */
>>> +     "AMD Ryzen 7 5800U",
>>> +     "AMD Ryzen 7 5700U",
>>> +     "AMD Ryzen 5 5560U",
>>
>> Still don't understand the point of this list.
> 
> Parallel reply.
> 
>>>        NULL,
>>>    };
>>>
>>>    static const struct dmi_system_id dptc_dmi_table[] = {
>>>        /* GPD */
>>> +     {
>>> +             .ident = "GPD Win Mini",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "GPD Win Mini 2024",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "GPD Win Mini 2024",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "GPD Win 4",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>>        {
>>>                .ident = "GPD Win 5",
>>>                .matches = {
>>> @@ -120,6 +240,306 @@ static const struct dmi_system_id dptc_dmi_table[] = {
>>>                },
>>>                .driver_data = (void *)&limits_maxhh,
>>>        },
>>> +     {
>>> +             .ident = "GPD Win Max 2",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "GPD Win Max 2 2024",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "GPD Duo",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "GPD Duo",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "GPD Pocket 4",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "GPD Pocket 4",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     /* OrangePi */
>>> +     {
>>> +             .ident = "OrangePi NEO-01",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     /* AYN */
>>> +     {
>>> +             .ident = "AYN Loki Max",
>>> +             .matches = {
>>> +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
>>> +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     /* Tectoy (Zeenix Pro = Loki Max) */
>>> +     {
>>> +             .ident = "Zeenix Pro",
>>> +             .matches = {
>>> +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
>>> +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     /* AOKZOE */
>>> +     {
>>> +             .ident = "AOKZOE A1 AR07",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "AOKZOE A1 Pro",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "AOKZOE A1X",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "AOKZOE A2 Pro",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     /* OneXPlayer (Intel variants filtered by SoC table) */
>>
>> Are you telling me the Intel variants actually have the same ACPI
>> methods this series looks for?
> 
> They do not.

OK then this comment appears wrong.

> 
>>> +     {
>>> +             .ident = "ONEXPLAYER F1Pro",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "ONEXPLAYER F1 EVA-02",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "ONEXPLAYER 2",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>> +                     DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "ONEXPLAYER X1 A",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "ONEXPLAYER X1z",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "ONEXPLAYER X1Pro",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "ONEXPLAYER G1 A",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     /* AYANEO - 15W */
>>> +     {
>>> +             .ident = "AYANEO AIR",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
>>> +             },
>>> +             .driver_data = (void *)&limits_15w,
>>> +     },
>>> +     /* AYANEO - 18W */
>>> +     {
>>> +             .ident = "AYANEO AIR Plus",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
>>> +             },
>>> +             .driver_data = (void *)&limits_18w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO AIR Pro",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
>>> +             },
>>> +             .driver_data = (void *)&limits_18w,
>>> +     },
>>> +     /* AYANEO - 25W */
>>> +     {
>>> +             .ident = "AYANEO AIR 1S",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
>>> +             },
>>> +             .driver_data = (void *)&limits_25w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO NEXT Advance",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
>>> +             },
>>> +             .driver_data = (void *)&limits_25w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO NEXT Lite",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
>>> +             },
>>> +             .driver_data = (void *)&limits_25w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO NEXT Pro",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
>>> +             },
>>> +             .driver_data = (void *)&limits_25w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO NEXT",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
>>> +             },
>>> +             .driver_data = (void *)&limits_25w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO KUN",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
>>> +             },
>>> +             .driver_data = (void *)&limits_25w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO KUN",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
>>> +             },
>>> +             .driver_data = (void *)&limits_25w,
>>> +     },
>>> +     /* AYANEO - 28W */
>>> +     {
>>> +             .ident = "AYANEO 2",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     {
>>> +             .ident = "SuiPlay0X1",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
>>> +             },
>>> +             .driver_data = (void *)&limits_28w,
>>> +     },
>>> +     /* AYANEO - 30W */
>>> +     {
>>> +             /* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
>>> +             .ident = "AYANEO FLIP",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             /* DMI_MATCH catches GEEK and GEEK 1S */
>>> +             .ident = "AYANEO GEEK",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO SLIDE",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>> +     {
>>> +             .ident = "AYANEO 3",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
>>> +             },
>>> +             .driver_data = (void *)&limits_30w,
>>> +     },
>>>        { }
>>>    };
>>>    MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
>>
>>
> 

