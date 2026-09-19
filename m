Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808462BDC1C
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Sep 2026 17:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789838038; cv=fail; b=EFSjdH+WiuOJr7/923CwSDXLBP4Tf7PxKX93CHewe3msq5+AkzUA0h1+lj5seSS6wON5us6LhbXJhS5r9wev5YsGiZWeytmC59c5DbmXzN/4SDG7JPTDMVqJ13oQp+4b/bx9J7/WbG7AaOTCdQwH0z5xMQraSGXKmkSs8UNw14c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789838038; c=relaxed/simple;
	bh=TxRd6jlUdUUF5pFr7VxAOx1VD+HvcGPwYMfCDvzojgA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jW8Luu2/K6JkQKwzUZ67+kg6o3QknSIkMOsQezwOSVSEQdJAAcSd/NIUgxkf82zLBjlJ+wwdqSowXCMFXQVUPrAkaBaPQPPKWjQnT8QJfofkQwBZc8j2nakNy4snMUbauJNZbNyOF/jVlOpqGHsZ0VeQnqt91IJnHfE2F/jo5mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p47Ip9if; arc=fail smtp.client-ip=52.101.56.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p47Ip9if"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfMvpUSQ3PqtvLe1+izD23IeKwMuzq9GCEve4VuiWVBMcK2WFsZ3WSMA070zEyJRffs33rPGlIZGRWG8pTpqHAUW+jQmM5vpgc7KwiqZO9VELC6H2oHFhrhvMzQlh7Lw0VEWhM04VXL4LnbXD60b93kj6Hn2pFnqLbsORdDb8KcwvWujwjYnEsSwa4ZhPLkSbDY8Kh9WgOLYz+qhR1nf3pP6PYnZxusKGqkMHVQRZLQ2We8t9m14jLgks9PSzy/HkLpoavfGIZs6P25uq0f5mvD+Deni0pwkWtqUmwg8d6Z8mbNxoZWkagSSLlh55S5BzX6odY5toTG9+LOny41jCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIO6SI+C+O8rbAYWOAe5ItG9madQZ74gLjPK3JG9cIM=;
 b=uWqm2883dyigqWEQ6erWqUKlaHhH1jXasun/4oCnUWW4Hfj0FCAidZtjV2kvsAUOwGuRp38vgYuE39ZiwH7ZvLiuTpseZit0s7jf/p+kJxyOfRHPpclEKGIgTGrQeJ3Vsy257RZZRPgaDwdwv88reIFIh3Rqn870vqcaSqxgaAYSpMaTZ4IOY7qiEZ24jY127er/DZ6omulsXT9LwaGlwqyWdLDEATD9+T+cPQ+etpK4EXujskM8RLYQpjG0ZhubrHDIxYfa/jMVYwK8uDS/9OQeTuHAlzTzu6rcGvXKbJ1o40jEeL/tqkIBKzo6IpHQE3NPT8oSA7LGr2644+vDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIO6SI+C+O8rbAYWOAe5ItG9madQZ74gLjPK3JG9cIM=;
 b=p47Ip9ifcFwSCjzYFEzIUObe68BM6SpB6+U27BOQ+i7Hw9kCCJVP/HwuJec+CllHDr9+vGWD1mNEkFtOyTHOKqbsvunStWyr7fERbnr6Gfs9QMftJ9/dn8n+THNgt9lVy4Uy0BBAx2GSeWjpLkTMvIIIJs/gJDh3ZIW/fAyIv6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by BL3PR12MB6377.namprd12.prod.outlook.com (2603:10b6:208:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 17:13:50 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.011; Sat, 19 Sep 2026
 17:13:50 +0000
Message-ID: <1e923c12-0523-49d1-a019-08ee49fbf8b7@amd.com>
Date: Sat, 19 Sep 2026 12:13:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Lenovo Yoga Slim 7 14AKP10
Content-Language: en-US
To: =?UTF-8?Q?Marius_Lundh_H=C3=A5kestad?= <mlhaak@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CAFip0G2S4ScoH_CinBo2hA_ac8bNTgb-7=04bUmxiTw+OO-UWA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFip0G2S4ScoH_CinBo2hA_ac8bNTgb-7=04bUmxiTw+OO-UWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0042.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::16) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|BL3PR12MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: a489dd07-6db1-4bfa-19d1-08df16715fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NRU7jugLV401qKqq0cZVAhEu0NBoS33qNfDl480XPLse6ncEE2Efx9vZ1R7181kplBqglYqce6KSqAaU8Q+XKrlSAnsAbG1jczHEHXpE8c+Un+mWqgWu6SgbpBgVQ0gXoT8HJZAOixAnf1/r6FRkIfNwR7fByV0KpNd3oiD4s76WiAqk3tX24w4/mzvshlzPErH604zbiOsgQ31xouIah5vR7vskniXj3PGNLLfFrxMq/2aOjVybNTZFBuHPbCjo8wGeVXvhioRvgNkfdEqP38ZnArgURyoMZP5BxgxlrHtYhiBMPqkKiXqcPBa52Ya522ST5cPDoA5BtVCzZENK864OiHqTjSqVnNg3MynaVyjgZwnhzor8Aec1ksHV4VfohYdtiAalthZO1V01SIdVvqoK42ZCBygWj82rM/Fw5d2D2FcOxuYkroRfYV7pprzhu4X7DBv885j+mtmjT760tbbsttL3bak8TcHEM/OaagT22N3+zTfcfjZVWqNAb4Qywobd/BaQ1jvwknFvkoyILzbIe1qoPCxlT4sWO5eWCkDyLgwrc3vpMCQBHzQ+xYrsrjnvrhoGxm7C/ZOzSoGJyn1qdrcEUjlCYolDO39KIOUPlFoen7ObNXpueCuTpgPExMKaHfQngiGEGgnBG4jfx3QT9FhUU27+D0/P9dv6Elc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVArajA0UTVhZ1V3RzJ0eXVJQkVyQUZtZ3p4QkZqOVNuTU9uVE4vWVBadW0v?=
 =?utf-8?B?aHp4bXNaYlBVYzRmYjhrUlFLdXN3ckJ4b0VEKzZqR1ltMVZxUnRvcGRCTjdR?=
 =?utf-8?B?WGxpRzhtSXhWYzFpWTBXNjYxM1I3Y2tkMW1JS2dOR29OVHlJd0dnQmZVWk14?=
 =?utf-8?B?ek1aRFR0T2xKRCsrbE9jQjQybjE5Y3FDU2hqMTJtaVNJMnM2RTBMRlZQS0xG?=
 =?utf-8?B?WmRrQnFldGVQcXNUR0E3UlNMcWFKZ0RQV0Z5M2lpZlR0WmVINGQ5ZTVlcW9q?=
 =?utf-8?B?c2VRYVpQM1VjR05ONU85M1llWG9JSFQwaVNzdWRoRDBSaWExLzlTWnNJb1Nn?=
 =?utf-8?B?VFI3VUM5QldHSkZCTkV0ZmtRMnBKb2VhTjJYNGY5blVUemE0RXJJVFNPR1or?=
 =?utf-8?B?M1JLK0FXK29PSjA0b3hNNlFXaVhsMmVLSDJFcktNbnIwMGlRQkxIb2w0eXc3?=
 =?utf-8?B?TkY0RUZPWmErSnYveWd3RENtMGdCTVd3VTU5a2pwWUdEQm9YKzBhMHJDV3VE?=
 =?utf-8?B?YmRSdFRHaGZmenVKc0cxODcyZ3hLSWkwVHRXaUNRV25mRGZWaXJBMUZZUTBY?=
 =?utf-8?B?VzlOWWFvT2tOalNPY1JwbTJERGQvRUxJZSs0aDVDZ0lIbjZ2bEFwYW53RlU5?=
 =?utf-8?B?ZXdRb3U3SUNVRmxSZXlnOUNUcGpqemRQTjd0NUpLZ3N1L2h2WTJzazNJeXBz?=
 =?utf-8?B?NmRiVW1YSTUzQ2VOZmFHWGhSMWUzREZiMWJwdExtS0dSbjAxQ0hrbnJUb2FC?=
 =?utf-8?B?RUZXWisreUVMSmtqQU40V3lQR1hxYVVMTk80d3RlN2xCTzVGaytxVmtaRGVR?=
 =?utf-8?B?aTY4YjRwUVhkK3IrQVJqNWpWczNaTUN5NVhaaERTZzJpK0hKMVV5TndWRVBh?=
 =?utf-8?B?L0lvbEowNGdDeTRhS21tM1Q3R0NIZ1VqdWpaVXVMSU95Wll2K01zMHVJeDA3?=
 =?utf-8?B?Um5jQTVyajd0dFc2aXVINk9GWjd3QnpFdTBrRFBNL082eVJybTJPZzlucE1j?=
 =?utf-8?B?T0lGbjYrTkUxZnUrZGRLb0FGa0I2KzJ5bEtYckY0M01CZWNDY1E4QjBXVVZ0?=
 =?utf-8?B?YUIvempHemhxRXBZazY2QUZKR2dCc3pUQ2Y5MmN5dGNmY2l2aHBORFFMT0tw?=
 =?utf-8?B?THdnd3ErN3BNNlROb3o1aXdDSHZQREhkdXd0Q1NYaUdBZWZsd0w2Qk1oalc3?=
 =?utf-8?B?dzlIQ0JFL3BSK3dXYTVpR25xTEl4bGxaSnFYbC9CcGJTTzVXYkZTbVQxWThN?=
 =?utf-8?B?eVpEY1luTU5wbklzdVVqYWhyTFc1eUpVTmkvb3BKakY3VWJWZDR6SHh0ODBr?=
 =?utf-8?B?K3JiV1VsaExiTlpKdmtpRERia0NQb1dlZHZ1ay9UNm5GbDBNbm1MQ2diVEYw?=
 =?utf-8?B?Q2FBYS9tcnZXL0JiV1dlQ3V4WjlPcng3ZHkwcklEdHE1dWdTMVM3b2EyeVUx?=
 =?utf-8?B?TUk5WTl6OXRCYUZVUjMwaktWcWFsckVrek5xOGE0TWxHdGVleWdDcjlsbktY?=
 =?utf-8?B?dHl0NzF4MEc1eFN1OGd1dDE5R2M4V3dmTzFxcEdGNXFWVlRONUJsSGw0R2NN?=
 =?utf-8?B?UjBQcVQrZ2dmczlvMDlsU1VOdGJlRTgxVWg4UWU1Y0VPTU8yb3RVM0FPQmor?=
 =?utf-8?B?elBWTVo4RVNrQ2UvQ0dFdHJzRmppR2hDYVIrSzRVMzNtS1E5WGp3SzYwOHRj?=
 =?utf-8?B?a2lJbTVZS2NIUVphMkQyTWVoVDgrSWgwYU82VWY5eXc0WDdHRFFncU90dXdY?=
 =?utf-8?B?dU9IWVpZWmUxMWl4VFVKL3F1aSs1aGVjc0NUVERaUS93eUtRdXMzTXozVlds?=
 =?utf-8?B?UndJVjF6YVpzYUh5eGxsYURickJtcU16REZiRUxvNlhLV2xyQnM0TW82V2RD?=
 =?utf-8?B?TjIreUtvbmVYWWZFVldrNFZMeHVoaERNczVXSEUwdkVvVWNwRUladWpQeHJ6?=
 =?utf-8?B?bWYrMVI5aEgrajJVNTR6N1V4UkgwUnVndmJoTUpzcFVXNG5CUXAydlhrU3NB?=
 =?utf-8?B?cXdybDltMVM3SW1uVitobkp5eThza2VFVm1hZ3dBTU1IOSttUFcxcjhRenVB?=
 =?utf-8?B?OEM1RWFNMWlOVFp4NmtrNVNUQVc4MXlwMjhNdUF2UzVrVldzSUNoQ3l2a2ho?=
 =?utf-8?B?MlZZK0ZwZ0p1dmdkOXlPdFYxYUM4RFFPc0Z6WElqNm9rbWd4dUtZamp4S25p?=
 =?utf-8?B?ZEk1eGFZRzY1bnE4aWt6dmZLb1hsR3NlRm9DVHA4KzJQdUEyUm9scU5IL1Br?=
 =?utf-8?B?VUdJUFM4WTk2YkZLbzZZVXJ1SnlqR3FncWY3SzFtNjkxTm5uVS9JRFRxZkZK?=
 =?utf-8?B?WHFZWFJJMEphbnpmNkpkbENDRytMVGlzRVV1V2NWelB5OHhXQnY5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a489dd07-6db1-4bfa-19d1-08df16715fdc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 17:13:50.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILNxKdX7kkHb4/1clDTiUB36SG3kuZKWk7L4EP8sP9NyKNICfHc8b8fxFkJRZqprKclpN9YBZDXq07xhOeUnGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6377



On 9/18/26 15:56, Marius Lundh Håkestad wrote:
> Hi
> 
> Long black-screen delay on resume from s2idle suspend (Lenovo Yoga Slim 
> 7 14AKP10 / 83JY)
> 
> Claude made this report because the screen is black for 30 seconds 
> before I can log in after I open the lid on the laptop.
> 
> All the best,
> Marius L H
> 
> 

This sounds like it's most /likely/ a userspace bug.  Some experiments I 
would suggest doing:

1. Experiment without a DE running.  Just from a terminal on a VT run a 
suspend sequence (for example systemctl suspend and then wake the machine).
2. From in a DE experiment with `amd-s2idle test` to see if you can 
reproduce it.
3. Experiment using a different compositor.  I personally use Plasma 
regularly and haven't seen this behavior your describe.
