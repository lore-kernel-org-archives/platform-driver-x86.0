Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349CC4BF95F
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589137; cv=fail; b=rfneUNEVATMWZhtFs/fE3dnkvS2DdToqHmzJogdLuBbqBqv/rgtvevFwW3WHZzDN6LlKtET8b47RMmzm6nhQDW202zNRc6fHh4dtFqnU3yZlQB5HOOxAuRaJh31Ot8o0TVkbSdHZ377laqYKdXRiP7awIwEIcTtjrq2cqFjj2UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589137; c=relaxed/simple;
	bh=EiU0sQ+2tb/RPE0QTO1eRSLNaiTAM+kNcj319bnhSoA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HoFkrw2ItGb26W7PCHGAQ5g8bAoDNf1jplrayYMnwiCJ/gwdIohB3wbC+2EsYY5OeXPNFpS9OQWZjjXUz/rZELJD4j7fV31o3p1/iS5OYTLAeIeFWkYKf/QXP63wi9wWCw7A2S5GhIbgrHbOPKUPslamcyDBrY8few4RrkJd3Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3f7rr5AV; arc=fail smtp.client-ip=52.101.46.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3f7rr5AV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lowm+uFH/ZBjby8T+rqxahlVglb9gfotuXasLxCqcrawWMbrhcnpiWgT0cyzmR4F/Nv3G62+znZxDZ9v3uWp8lcpkZL8sVsnNna/qcIHihgv+G+oyrgXmxobfam0UfadV+L3HfJz37nwClvHliVSnWDczfgsZZsbNvw6EU4JQN7uwrUYLjDUK0F0wVmcmYD/CLm0H+Kn3eS1wBhZ/uMwuEmXAQS6tnRu0AtQiR8XLr/DljXKRtxQY+2orDQmV2pUEzDYMQnQAZHacjptzF5vEtkJhejnlict4veOqDDm+BUQPUBNwz96xP7jmj48TVJcsx2jMeet4MhhrCOEokBOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07Y/zlyr3/1isvuAd9THyCcUtrGBQ2DnaTwhPVMbJYU=;
 b=wfrgQGNUcDOc3XPbXOq0PCieL88ZdST7AjAthieZKQf/jQqs/Ws3ybV0Layby/MdTnMfenh/Ypzsb3IH+r7/e63OHHanacnDpmt9n26l97RnUGbkDVj4p0ukBaHFufnmpYq5gZ6AwuPX829QQsLZQPVGLxcuwcB4jGuLzN6+7M8HN1gCg49B8r17B8YTp3qUuaGwLHb4pvlzFKiwlcZWYapTi5DwEjQwXF/1bDZ5XBB8L4xd4DFfoE7eZe9s9ZZ2vrYbX1UdSTx9tOmG21N0ZNDytOlXfFOu4CqsbWLoI+A8cM9flNMeYYNXqnElTIDy+9dOXGrkeYGqK+VAUUZ0TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07Y/zlyr3/1isvuAd9THyCcUtrGBQ2DnaTwhPVMbJYU=;
 b=3f7rr5AVGGn9jdQYZ4axxYJfdn5jQLNtiRa52pWfUnemj9X6F8MSBK2ZXu+xngNK8DAviHgTikjiNzrUVG17oCm6F6Ao098mwlv7UoV/TYjmKEh0Q+cTbUbDHokTznH5M/A5FE5Nnjuq2Ebe4bGareaKwLskSh8NrTQD2Z4ZdpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 20:05:09 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 20:05:09 +0000
Message-ID: <c733990f-844c-4ba5-85fa-a0dad627ecad@amd.com>
Date: Wed, 16 Sep 2026 15:05:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: amd/pmc
Content-Language: en-US
To: Karsten Wiese <fzuuzf@googlemail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAM=nh0S9e1+_U4WGR92HwOrNC2h2xYb6eKvgN5_skg-vvbSbqQ@mail.gmail.com>
 <d8d7a246-00f4-42a5-881f-66839eb6b302@amd.com>
 <CAM=nh0SB5uhsqGyH9v_1N1oZsv94SmrJTqWi_0YVbULgY-c_aw@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAM=nh0SB5uhsqGyH9v_1N1oZsv94SmrJTqWi_0YVbULgY-c_aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0422.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::9) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6d1c62-f855-4adb-f39d-08df142dcef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|18002099003|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	+8jLAX/gXXwbw+8uamcqhBVHVTOP1No0Kt6AcTlIFppxQ7HGJ1he/PzMdY8c0KqfQ4y1ktfKBpcThM8mptJLAweMlh9CqflzWhNi/mB8FE/pNZbWWdhoJheyoJVF76dilLg970nCL14mortrmfzNlDtYSaDWxHX4JwHezVjLRaaHU259vCT/H+O6y08bTS+jJlPcReTnErM+BCApFID4nbXnygQOQHf8zCQ+GLUaP+Yo8x3g4vqNoPxhVR2KdKkCmgwT/xBXZ2Y3bORfkQVU3PgSl6i8qamnCABvpSaUPh6K7QrxyVvhXjh1ESoUqr07u475PIPYloQH4ZIRVKXrukgwLK0LJjvfwFUm5y1/PQwDcoKfl5/mTpe/7GIButi67HKRdLm3MPTkS/e6W8VOEzCJVEVksIcJUQB0o11BK8fnUoQKjEyVCit91U4W2t1oLil0SZlcz4rnEeCvMEGYE0F3W+47nL/TZgES74Eqtyat/zbSb27uzQ6BSZrtZCwGz0JAzZjw/Wo1K2B00pc0awdE6mGNC+JvpUSMhGoN/k1mXDy9qasGAD2zO9diTQyKBaYVER/nKIl+MF066hYO48Iny0eJitjpAhPj+17KiJJg3L+Q8+lji0wiwj/UfGeD2pG2ZrDEXDPZprO6Fner1Ud945ssLdB+nNZaYtsQhhw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(18002099003)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXRTOWoyUS9RQy9JSnNiQUVPWlFxRE1aaXVsZUZRMnJwcS9VL1lqZUMrUXRj?=
 =?utf-8?B?aHJyekxIZkc0UzlEVlUyOG9VK0hYVVE3UmlyRURxbE03SXhhMHRCRjVGK010?=
 =?utf-8?B?S21yT01BUlVKTCs0VGF0QVZFRzArMVRvemJMWmg5Q2hQK1lzenlhMVU2UEY3?=
 =?utf-8?B?V1NBa2laZXZkMVRDVHRZSlNYakl3aUFUUm5rbnA5RWNEdE5ZTEFWb2pubVVM?=
 =?utf-8?B?TngrdW5NUFZubjk1dEs0Ym1kTDd5bGR1TVNPaVIwem5ZeTBVWEZLMVpxNGR0?=
 =?utf-8?B?MDE2VFFYTHlydjdBRGVUZHR0WXlJSktxK2lJYUs2S0NicTc1ZWlreG5WYWZ5?=
 =?utf-8?B?SXBhVjk3VG5JN05sdkU0clloL1FNR2pGREIwQ1ErRW56UHNvazJzMmFlN1Qy?=
 =?utf-8?B?NmV6STBJLzl6YXk3N05zcXc2RUl5SHpFU1lMekdQL3puWGVuUzM5cENDL3pM?=
 =?utf-8?B?YkVhYU5EcTFVTldHQ1BsNHZsYWVUWVI3MXpXU0pralpBbzA3MnJ5c1pINjJ0?=
 =?utf-8?B?OUFxTG04QTVlUm1DdE93SzkxNG5palVmUEd5dlhJOUhtbEJqbi9HNTljeFBP?=
 =?utf-8?B?K1A2dmd1MzB6alEvd0dvbHM3c2F3VlZMREtxUVdCMGZSYmxmb0oxUFREN1Y2?=
 =?utf-8?B?VVFGMTRNTlJhTTVHNUlLSWhEN0l6blV0UUx5U25Ga3dHN2lpSGpXcEVjeVgr?=
 =?utf-8?B?aFZZdkxvYVlySDdqdTZibVdmcXNrdVg1aEhseVE4amZKNHJNNUdoOW9EeXRV?=
 =?utf-8?B?dkpKdVpDSkZJVHE5dFBJU3UrODhQVlhaNWswdFQzVGNYSHlzc2JTa25EWFBZ?=
 =?utf-8?B?M3RneXV5T3Q2eWNpbmZqSWVYeVE2bC9YM2d2K2hzODZPQnMrL3VNZU85M1Uv?=
 =?utf-8?B?TFBKeGhSTVBRZDlDOFJhaFdvUHV4QkxwRWZsbVNuOGxFNVU2UkNQYWN6V1VP?=
 =?utf-8?B?MUhWdUVkbXdoRE5rZXEvckM4a0N0TnpUN05Xa0dnWFpjUzR4a0xaWTVVL25Q?=
 =?utf-8?B?MTJGMzVDS3YvSVR1QWhGUW1uMzhTV3N5dm1lTjF1eDk0ZkNQUE9vU2JQM0x3?=
 =?utf-8?B?QlEvQ1RCZlB3dnNPNU5nYUF1ckU4TzVKZ0JXNDM3L1dDNzNKbUhrNTAvbDVx?=
 =?utf-8?B?WDU1Z0xiY0cvdGY4VnNRNVE4dXloY0dKNnJaeG1qU0Nud2NzVlVVRUpkVi9v?=
 =?utf-8?B?SnJLbGx3djh4bWZiTGhVRytJZUM0SjF4UlB1VXJ1NzVPOXFzanVURy9UVEhC?=
 =?utf-8?B?K3d3Q0ZmSjduVmh2S3pTaEdKYzJjWHRJK0tNMm1xUnNtMWE2bmRlMWlUTTh1?=
 =?utf-8?B?Vzl1NnBPNHlXcU1UYXZaY0toWk5rZk93bFAxUFlFMytGVGZMMTl2L1N5b1c0?=
 =?utf-8?B?L0lubEV2NmpaNWFqcGU0eG0ra0U0TFloMVAvUnFlK0dDUXE5ZjlnVjBYQy9J?=
 =?utf-8?B?TVlTMHRVOUw0NCtkSkx4K0k2Vmw5UXlGR3lJQ2lCRXhOa2JxMk1xZzljY0tv?=
 =?utf-8?B?SWc4Y1dXOGpHZkh2dFhqM1ZZbXFoSk9vbVVpaGZtVzg5ZGVJSGs0V3R4bmh2?=
 =?utf-8?B?ZFpmcUFzbXpHcUVyTU9VeDJDNzE2V0xXdkNUR2hGL09ZWm1HcitzcHJ3OUx0?=
 =?utf-8?B?ZDF5cGF2YTVoZVlLS3FvVEdLYnAyaklqZzdrU0t0V1VlaXFFVk96ODV1VnF4?=
 =?utf-8?B?aENqYmppbURQZ1pBWVNQYWd3M29zVW9uZVF5QkJuNDJqMFF6bXpCbG5kUkUy?=
 =?utf-8?B?bkoyN2dOUTlFTUV6VTlDZmFUR1YxaG1EdjhLYlBYTEUzTzEzT3BRUXNEZnRm?=
 =?utf-8?B?RkpxY3BobzE0NFlTUGJPemdwdWJiKzFLMGtac3IvM1VyeEZHTmpGWDl6QnF1?=
 =?utf-8?B?RzBaRlpFbjg2QVVWTGtWbDdBcjIwK01zRVlKUENtbVd4UkhPRS84dHpwZzVC?=
 =?utf-8?B?c0M3WlJiZmMyVXhMeGJ6djhQOWY2cENGMlV6dGhmK1BxRUtMV0ZheFJHWVZH?=
 =?utf-8?B?TEtSU1ZGV3c2NEhDc2NncVpQRWFsQ3Avc1lpVUhJOUNZVzFnaHlRSlRCQ0xo?=
 =?utf-8?B?MllKaU5ZMHJsV0drYWM5UGNRVTJYTmV0a1pHMkg0YzRuU3lVeGZ2b3dQWXIx?=
 =?utf-8?B?MDZSWEFPQ0pkMjFzanNiUDN6aWtlRFBpTkt2WE8zV0x1MldFbFIyK3NaTHR0?=
 =?utf-8?B?dGdQdzlwRXBxR3U3MEdwR2tyZmFobUFuSHJnUzY4TSszWFBLZUdOMTEvUXJz?=
 =?utf-8?B?aGVlNnpJcjZ1czNNcGlNR3ZSckZ4elZiMDhwZ3hrSjN6SjlPcjk1TjlRVXVL?=
 =?utf-8?Q?KPDVulcnAxku0tYZAu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6d1c62-f855-4adb-f39d-08df142dcef6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:05:09.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpnk0L1xiqdVKkPpAupLvQBvywxcaEggpUFve1sBh/Z8bCi1ArI1LNXzi6++gjxg9lAOAsK29ESbihxhITD4kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153



On 9/16/26 15:04, Karsten Wiese wrote:
>> * What issue were you having before?
> The system would hang on suspend to RAM infinitely. Sometimes it
> suspended, but the fan kept spinning.
> 
>> * Was it a problem on every single time, or just sometimes?
> Sometimes it would hang on the first try, sometimes it survived some
> suspend_to_ram/resume cycles.
> When the fan kept spinning, I woke it up and suspended it immediately again.
> It never survived more than 2 weeks with some 3 cycles daily.
> 
>> * What is the new behavior with that module parameter in place?
> 17 days without the fan keeping spinning or the system hanging on
> suspend to ram.
> Followed by restarting into a newer kernel.
> 
>> * What BIOS version do you have?
> MDCN30WW
>  From september 2023. Should update.
> 

Yes; before we pick up the quirk, can you please try to update to see if 
it helps?

