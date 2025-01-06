Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA69E15CD79
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736134239; cv=fail; b=Ds8ka4vi4hgNSH6uuLsQWgaB9CXCj083QXiZYKQfaD9IEPR3T6hkKEjRECa6JB6Th1kv93N/CGXPPO8eTr8fe4veFGycR8LtGvpmV5ve9CaV4fuYaqgnfhMvPJIqFDqkhU4fcw1wTT0grBNxTO1RZQhphAO4N4j/SlsKtOHIcEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736134239; c=relaxed/simple;
	bh=qzJvNFqsq1DFk+yb38L5OO4ZIOiDVNFtqZ1yzBpT7NI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sM6q50/VeVT8rq/kAAsaj9fBY87+sgQ1wmvouj3NcQal5jN1vGRDRdDrdRQqrguB5Qa3SLmtKAg7A0pvbPy4eXwXKNxee+7aAic2Zs7qTypX4kans1XY9iWX0w7oHImVPnDiEkWOLTnLwNgsqfKwdjayQJ2mnCIJ3RDxSBY57Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qB8/v8HY; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qB8/v8HY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPDIJvK5TyGvqsDFVjx+IH4L0YR1usNXI93sDdv6SezbUNnaPfw/wz6OhykvA8KnStH1IWoSxvsNxxef4vmlSUntH34CObAnWZoivaZEkQCeeVIajuy5okGnw/au2w5vMVTBifG9JNHBiikzaWvhFoDI+JI6i0OiLneU842PW1ge8XFdxFYHVnPHvHKRUTZi16ZovqM4V+JRgJXf4VUNAQXNOiqrW8Qas8wNWG+qzeJon9hZFPfdA9duO3Ev5G4Km1PGKR4iDNqISbaUK30RBR5Ih+wr4Ljh6sE3y1aTuwGb0HwRHP8O+/zA+wKsmYgoCC7dSqQedyjuaf22+eOiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeNzdLtf8iyMuJ4cZiVbRPXMpL8AgQzoPlEOiHnaES8=;
 b=arxKtdN23jCnJcoFZxd7CxqyWdkP34RJGqEofPKReHwswoSv+IXJqg+p5bawmM3jKFSI1kohXCWBSAQYg0CC32Z9JIp1FdUx06/VIYZ8IKC0TXR6C+jzBz7jVTXds5Ma0AIGTsljrB9nkNsAryVpxC9f6K/uwOwzYW32zHFDh8uQ4YyUNz/BOWwuUi/GbKC3R/AEcvph0CojcZFa+24Y61BDSROS6LtYvTnYhSu5uy7jvnytHW62AUW0C5knwNrJO0mMvQGR/RK6DtDLJv3gZsRqLF6Xm0OC9EWJxI+AmL7nWTyQ1VDoePWYNuh/719YrVEBCfGwV9q2Q7pZPm302Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeNzdLtf8iyMuJ4cZiVbRPXMpL8AgQzoPlEOiHnaES8=;
 b=qB8/v8HYCzMT66YjdncpZvrtdG3AJcWLjdK0hDuQdf6e6yoFDZYOFU3URhrxxI6gLI+YWA8FGu5rvce1/EbjUcS0Q2YuR/Q/9AMFca9WGVx5LxoroK7MlzxogHz5/5ibfjQZAQWj907MBxn7TFnKeEDRMDtPcOyt78GyBw7hgnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 DS0PR12MB8528.namprd12.prod.outlook.com (2603:10b6:8:160::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.17; Mon, 6 Jan 2025 03:30:31 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8293.000; Mon, 6 Jan 2025
 03:30:31 +0000
Message-ID: <54a874f7-c220-40eb-afe5-ff9b9269c895@amd.com>
Date: Sun, 5 Jan 2025 21:30:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mischa Baars <mjbaars1977.backup@gmail.com>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com>
 <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
 <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com>
 <CA+b5WFEv1Qj3NYcwXaZz1EYW9omj7FmB8FdSKZnixsMNoi1+DQ@mail.gmail.com>
 <ddd7bf09-31aa-4e4a-93ea-b1336ced8578@amd.com>
 <CA+b5WFGDstoJTjgaT+hm4r-78zup1pLa2Ada7PqbTY=wCutSbA@mail.gmail.com>
 <98b3392f-2860-4a32-a769-b4dcd3f5dbbe@amd.com>
 <CA+b5WFGkDJhpRRywQLx2okttXGasBu6K8ScLZyakKrk1+FZWAw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CA+b5WFGkDJhpRRywQLx2okttXGasBu6K8ScLZyakKrk1+FZWAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:806:125::17) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|DS0PR12MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: 954676a5-5331-46f2-e431-08dd2e0278eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SERYMGM5SFhtRmI1SEErV1oyZ1NTNEMzZnRLYlB5cmxabTVYK2hEekZibWRC?=
 =?utf-8?B?SER6K3ZlVTlQMm4vbzRCSis3OFo1MUY0c0doQ3B3dHkvOW1LY3BmQUZVWkI3?=
 =?utf-8?B?U05oLzd3MzRmcU1SNzdyb1d1eG8vWGozUUNpZysyN1cxNUVBL25GTUdoMWpB?=
 =?utf-8?B?TW9rYlU4WjJ3U1pyVGVDUkxZd25DWG5VSG5EdDdTelZrS1NZU2w2T3NFajVZ?=
 =?utf-8?B?TWwzVjAvQUlIRWhCbWN0d2FvQkw5YklMUWhLaXFCYS9LVXQwM0FsN0pzYkQ5?=
 =?utf-8?B?Y3lMMXovaWMvRXNTYW5rUVhpRmRJVFZxM05iSFo2S1kwS04xUVk1TmRha1ps?=
 =?utf-8?B?dEZ2cDRuaWNqbXJ2a3hHZjNyN09zNHZrU01ZdzExVkcrd0VaSG40RVZFRDRz?=
 =?utf-8?B?QTV0VXNNTjhyMFRkcnZJanhUZ2RYcVFxaDZpbjdaRmx1Uy9FWWpxcTdkZ3dh?=
 =?utf-8?B?VWppNUkrc1BHbThRNk1NcGZremVHRjVtN1VqUDc3MGlnVUxLSlQweHZTQWlV?=
 =?utf-8?B?MFFtcU5kdXM1NXlOQms4b3k0SjZQdWpIdWhyZ0wrRjMya1NIbWxNV2p6cGhT?=
 =?utf-8?B?anVJU3ZnSHZyS2VIcDgvTHV4RGlKR0xHOEJNT2xIMTdzbytWVm9pRUowMzlu?=
 =?utf-8?B?dFdlQ24zRWVKMG5TQlQxcnpSL000aXRVRTI2V3FVNzBWQlhxbm9Rd0JsRkg1?=
 =?utf-8?B?MVZxcnRCVUE0cndPMzMrTktIT3ZOcjZyUXBoR0o2a0dlTWt3cWthQWNoTkFo?=
 =?utf-8?B?dWxoU0FCQXhIdlBsZ2R0ZXEvKzZkU2NKRUE3alh0QTVGRWlrUXZmSjAxeERD?=
 =?utf-8?B?NDBBeUhkTEp5V01tMExoblA5SWZhcVZ0U0ttbjBZcTVwOEVXOVJtdkM1SlVN?=
 =?utf-8?B?cEk0NnpXR21iTTBOTEJLNDNhNHpyL2Y4N014V01MWkt3MDJLOGlSd001NnBO?=
 =?utf-8?B?d2ZPVzJyNU11WGRlR0ozSXM0NkFVVkt2K1hjbk5vbkFLUlBWZ25jSnJFRVFm?=
 =?utf-8?B?MmxJV3lXSldBbmhYcHZycDNqakZEc05jOVRVRXJLcCtqWEtqZHc0UFpkbjV0?=
 =?utf-8?B?VW1OdEl3WlFoR1NJZnVUMlA0RmZnd0VCa0hTSVUwckY3WDRRTE11dGdzL0Zm?=
 =?utf-8?B?RmR6MWRQZ1hWRXRFbEZFcXFxUXdRei9MYWZKUmJ5S0tNVWVjb2NyMm1WcGNN?=
 =?utf-8?B?VGVMQ1I4bWNETW1CbkY4VnBNVXBxdXg3bTdMS3g4Y25IZm1BWWozRUptdjZx?=
 =?utf-8?B?RjAweGVFMSszNE5SM3FBelJtN0VGQnBCaytIeUE2ME8zclI3bVF2OVkzT3RO?=
 =?utf-8?B?ZFVEcDVvRVF3UkNGRmZSTVg1SXRKc2tkOWwxUmx5SkpOcmxmZGI3QWtzQ0sz?=
 =?utf-8?B?OU5vZlJXTGludnBHSURZeDJwaDdUbEZyZVZubUZVTmZnZVRGREVKU0h0Yyto?=
 =?utf-8?B?VHdsNGlzaU9ablpEZE9jQmsvSmlOdG9OZTJvUVkrdnRDUlJLQkU5blVuRWQ4?=
 =?utf-8?B?RFJDRm1pdnFwOXJTdHd5MThZbnNFTzNPaUVLTHZZbkpGWktqMjEyRXUrcWYy?=
 =?utf-8?B?WkxLWndTck9NWVlIU3NzZW1vKy9QaE8zRGQ2bDd2eW9aYnZLekx5TS9QQ1pS?=
 =?utf-8?B?K2RQeE5pbjEyZXgvd0RXZHE3MjNlbnlrV3NzQkpwWUk5cHpTVWZ3d3lCakNW?=
 =?utf-8?B?RTJPRmJIMXVsQS9jMjQxU1VhbmNqR0xUQjQ0NDJKOVdvNzR2WmZqQWZuZFlF?=
 =?utf-8?B?Ylk1UU1EOGNtSmsvUVArTytMSTVCVWlRSVVsSTgyMWl0aGdVTzdmOHRYS2Rl?=
 =?utf-8?B?blN3NE9iclFXMnhlWGFSdFVLWGM4cnVSQlJyZHFzY0JEblliRTBYU1RxdllG?=
 =?utf-8?Q?TgHGFgsQwZc0e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2gwZ0JXL2dsM2F4Rmt3Z2Y1LzIveUIyM2JKYXg3M0R0TmVGcXZPS0pFNVZL?=
 =?utf-8?B?SWdVMGNNRDNLNjZmNzRoSXVaNG04dnhCSVBMSXpBUXZER1I0Y2h6U2tpcEJP?=
 =?utf-8?B?b20zWGt5OHBWelVmYzJEeWpIcTQ4MldicEYydUR3MHc0T3RkSWZnZ1doNTh5?=
 =?utf-8?B?bVRNYk5TWVVxL0dzYmlteEliZkNNcEVDQVFkOUZtTmFrS1hoS212bkZsdDlW?=
 =?utf-8?B?bkZ6em1MNGhid1o2MTZuR0NlWEpDNmtDeHd1Q3U0Q2tpUzd1K3pYT0E3OEZP?=
 =?utf-8?B?VG0rUWtyWXVjWk1NT0xHNTU2aFNzZFoyaFN5MDd6Rk5WMmI4bWV4ckRSYXQx?=
 =?utf-8?B?WURzRCs3UWtjYTZ5K3pJKzZyWERvUlJ0WjFKbUxESFpSUWdNK1B5Yk5nYzda?=
 =?utf-8?B?SUNZb0ZTWWNCbXg4Zm1CbjBkbnltNWVQYnprSVVoRVhzUXlQNXk3VWpPNWJE?=
 =?utf-8?B?bmxxYzg5QThYUWRwR1JPT3h2dGN1RmFwVWZtSFYzNDR5VzVCZlA5V29KckVu?=
 =?utf-8?B?SElNeUY2Q2kweERHeEl2emIxTHdIeEd2bkdxSUVCQkJid2VJZUJ6cEFGbWUz?=
 =?utf-8?B?bElXb05WNEVrL1kwaW84eElNcGJJK3RHNy9PZnI3ZkQ1bFRnTC9ndGZ3QlNr?=
 =?utf-8?B?WFg5aVVxUVhjeE83SnJqTDJyYllNNmVMbTBJck40UXVRVmIwbkFUc3NaYWln?=
 =?utf-8?B?cys3OUpKL0puMFc0eFg2c2l6cHkzdE1iYldqMkxQOFVVYXcwZG4wUkFMSCsv?=
 =?utf-8?B?TDEwM3hOWTR2OHJLakptbFlmZjdXeG5RVENEVUU2Sk1sRXdiVlVZcXdUNnhG?=
 =?utf-8?B?b2ZkNk9mSkp6UXFya2pLSUdudWFHMEl0MnYzOFdibkhENWs4aHd2YW9lUmgz?=
 =?utf-8?B?NHFoYXlET25kekFpMklFcnFVckczZjlCQWo5QW9BUnBQMFFZUUlSWFltTklY?=
 =?utf-8?B?RDhaa2FvTTFUOTkxK0lBOVREcDlxK014MFpXYTNzeGZ0RHMxaUhJRkZhNTNF?=
 =?utf-8?B?VHN0eVhtNGJBQ3lLYlA4NU12Vi93cFMvRlZ2b2V0djZvM042SVIvVjhQQjdZ?=
 =?utf-8?B?b3Q3MmpnaTl5ZFlGM3dTdmF4SzZuSGwvdEF2dHNvMldER3Eya2pITEtZT0Zx?=
 =?utf-8?B?MHFxQkxaWFBSMWVnWS8rT1RBaitnZGk2aU5EZUNQUG1lSE5kUWlLNGZHT0Ev?=
 =?utf-8?B?NVpWMFQ4Y0hpbEpIeTAxUFRrSUtuaHFGNVZzVVZFYXRQYTA3a3ZCSFpRVXBP?=
 =?utf-8?B?Skxab2N4Q2MzSjVRTVl1aVRJOWljTXN4SitmS0VmaDViWUZNM0VMVmJXZ3BH?=
 =?utf-8?B?TUU1ZjBneit4K21zM1ZYTFU1WXFpWE1hb0d5TWpLQ2ZIK0wzclJTS0U0bkx0?=
 =?utf-8?B?ZGFqT3JtcVNnSFloMHJYWFJHY2VvcEFlK1FZS1J5eW50MmR2NVpmOC9IM1hU?=
 =?utf-8?B?R0lMend1QzBMODV5M0FJZ2VDcy93ZWtoSkJqcGtJdHhQMHpTWmV4TyttMFd0?=
 =?utf-8?B?RmhBWUhBSGc0TWxoSDhJRlpIQ3VnTndHU1grUWlBR0N5dFFTQ2N1akkvNjZq?=
 =?utf-8?B?azA3WVkzMjdLaFM1WU10VVdCU3l3TFZDQzJScjVpdFRXbGs0VThOaGxaRHVr?=
 =?utf-8?B?REp2T2FVZDR2Unc3YVJrbkxWS2tkbGJ2ekJQdzN3OVV1RFNXNDdiQVdFVEUr?=
 =?utf-8?B?MGpkcGJZWHE2cXprcSszTHdGQUFpVkIwRlRuZUh3V3JwcWRJeHJ2MXQvbjMz?=
 =?utf-8?B?TEVhaXNwZFlJR1lyVWw4S3FYOFVucUJ6aVp0K3pSam9vU2hhWEx5ajYvaFRX?=
 =?utf-8?B?d3NCd08vWVdtVzFncnQ3anBjOW15cldrV3IxS2M5WFBBaTA3OFg4cVQxajQ2?=
 =?utf-8?B?dURVcFpKeDVYTzdTSENsL08vUkNWY1VHeWdieXp2aFBuWEllMkJQaysrbkhW?=
 =?utf-8?B?VGthNmFhaG9TL3g5Lyt0aHpod1BiNDg4Q0VvUGRHZW12OUpiR0I0ZnpuRmJO?=
 =?utf-8?B?Szg4S3RoNS94WS84ZFNaOHBEQ08xTStnbE5PUWhWV0oxbzJ4d1NYS2FnV21h?=
 =?utf-8?B?d0d2OFV1aGk3SFZ3eER4dDY1SkVnZmJjMXREUUpVb3Q1dkhLdmwzWGRHcmNU?=
 =?utf-8?Q?mDJ+5eUir/ruJM/tDjn43Akdc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954676a5-5331-46f2-e431-08dd2e0278eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 03:30:31.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEUM1ZJa4GJssaXHuKM2B2jRF+f1xkskRvuiK2GWq7/cvMtXEhQ/NdV3xni7nwRRKK3unQZc1CcGQ2rvOmX1RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8528

On 12/31/2024 06:42, Mischa Baars wrote:
> Hi Mario,
> 
> Although unconfirmed by their website, the rumour goes that the HDMI
> Forum will release a 2.2 specification somewhere in Januari. Do you
> think that an open source 2.1 implementation will be allowed soon
> after?

When new specifications are made available it's not like the old one 
suddenly becomes "open", so I don't see any reason that a new 
specification would change anything.

> 
> In the meantime I also checked the framerate synchronization through
> glxgears at different resolutions and framerates. This does function
> as expected. Although I haven't yet inspected the glxgears source
> codes in detail, the OpenGL double buffering must be functional up to
> some level. This means that the problem must be confined to GTK and
> the GtkGLArea widget. Using GDK_BACKEND=x11 I do get a double buffered
> context, but the default buffer does not alternate between GL_FRONT
> and GL_BACK.
> 
> Enjoy new year's eve!
> 
> Regards,
> Mischa.
> 
> On Wed, Oct 23, 2024 at 6:16 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 10/23/2024 11:12, Mischa Baars wrote:
>>>> I certainly don't have a crystal ball, but I try to avoid saying things
>>>> like "never" or "for sure" in non-ephemeral contexts like mailing lists.
>>>
>>> I understand. I'll concentrate on different aspects of testing the
>>> connection with this TV, like gdk_monitor_get_description(...) doesn't
>>> return a valid description when the application is started with
>>> GDK_BACKEND=x11. I also have less trivial questions about the ancient
>>> and seemingly long forgotten concept of page flipping. I'll think of
>>> something to do.
>>>
>>> Thank you for your help.
>>>
>>
>> OK, If you have more questions about other things that come up along the
>> way feel free to raise them on amd-gfx.
>>
>>

