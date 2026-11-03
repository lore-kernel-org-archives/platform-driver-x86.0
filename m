Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715104;
	b=Nzz0HTJ+XwO96DHkJIYQ4/oCGnL7m57k0NGzPnuXgqcDIu0n0IGv4j+d44Gp4m21cPdS
	 2wrqsIYbSczgkwYvHzWzVahnIPbs8Z3sPzDTKf/T80Tt7Mcnk/eCu0xJutobd0tpiKDmH
	 pGBjZ9WXMm0ldX8et8AP9qmklk6ZD7eMX02LA+hUAh0t0rxXW4bTmyl9i9Nb8EA+Ss2MD
	 48Yew1/ykw8mRor2MwWU8+PQK+YtQmfTxbsga/nLYssSijn++OkLVo4yHo1hz3TzwzkRY
	 7H4D6HRCjFBSrlna1xAKWHBV09R6pO3eZmMRfeRdIKsMEnJRVEXxmf74nQu9tDAOaHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715104;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PmBxj2otIkySD4Sw5AMcKXm3+9RiE2k4bpCg/PITqBI=;
	b=S4ZwlCpduw2VRNJs1SfZO2kO9zC797WKpWN75/3yE1UtkXB81P4a6pgmwXR0FoULWQLi
	 7I+bnKPtk7/UnLQSy3B43NKiS6p0UDXWf21SORginy76wjgJ8dSZSWRnnCQJBNvAMJcV7
	 poFWpq5D/qLQqbhx+TnHpDC2tnCQKm9vPM7Y5wSCyfR7xJGd1324ZroYQ8FeE1nUozshH
	 sIJrb1GlEa9ORpPjbViE1ChIXSn71rHOjzCjpKLyoX6A41ZJqnU81dlrx/xRY1RXL0Bv6
	 Z8YCZtbwxawfl+Jj5/Rbe5wBxKhjm1JsbtyCOsQe9GHsR9QDi2m8Mfq9/SttL+THucA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ex64HsgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.29
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB6C606A32D;
	Tue,  3 Nov 2026 14:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB6C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ex64HsgU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYKVnncj8IUzTM85znzS+12QFIhhovpwyD5DtcenuIzx7EU4W+lnTyM/WkZ617J+5BAAAoRfI8xv3migxAE6UWef3g8i+5QAR1J02XKWo+sYKgJOGfSIxKqqMpcz+X1hToAjyrkAIbUXW/5WJ4JxdHwMkcNfDiBHq5W1DknU8tcWBYWAOKtwGJGctQaoVjWQ/boP/Pzbe8Cjny53CqPErn8ALaHcHYhyVVuASD2slnhD5Xsgdet6A1MpfOi0AuTXCrEg1o6j5DdTFXGUbvwPwAMplxE28jvLzE68fhf4uZHj3UMyEc1BaPlSx5fK1qqgCTFjAOxY7q2fhMDzTBuZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmBxj2otIkySD4Sw5AMcKXm3+9RiE2k4bpCg/PITqBI=;
 b=hrCMKuVM6JAxY1C6AfmdGHN881GVKYG3OaLZ+o7+m2ghEVu+gU7fd/6xO9xR0F5uK3AjKWBdQ2rAcr8wj0YZGBlesRBf6WE7Kc3VBExSrBLt0KgnqiWxpn1Bq5n8DasVP/PS7coedF3oGu9UWlNpNVgb7tvU5anhycmCGHCWgtWF1WqsKJ5N/KIubYabLn3fo8YhO5YqmUanTq3MsAqNei1fWFAI5zRio76WS58yaFET9UKoKcg1miLrER43glxN7iwVIL33oImzmFYLi3fojnkMaXibqPI/HCRInt6M4JVsKc+pckmmD6FhR46hKixwlpYnZ3l/ZKBpWWhKME6uMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmBxj2otIkySD4Sw5AMcKXm3+9RiE2k4bpCg/PITqBI=;
 b=Ex64HsgUwLwCFzKl0B15G5f+5v5/Xw/arV58PitSF5dADFkAX9psEXdzLUTc6cazhz8DyfArVuwXZ319enPVTEKu92r6aKyOt4/Nn60+zDPcL9ug9PMqnef/lrgKL7xM+mrdMn4nqIr3gYv6f0VL909euQc9KUXy/wUtmZfWREs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by CH3PR12MB190143.namprd12.prod.outlook.com (2603:10b6:610:39f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 14:11:12 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 14:11:12 +0000
Message-ID: <50b30fee-cd3b-427c-9c8b-4230f4208d50@amd.com>
Date: Tue, 3 Nov 2026 08:11:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: check APTS buffer before reading
 header
To: Kang Chen <k.chen@smail.nju.edu.cn>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Patil Rajesh Reddy <Patil.Reddy@amd.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103114134.75395-1-k.chen@smail.nju.edu.cn>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20261103114134.75395-1-k.chen@smail.nju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:930:a2::22) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|CH3PR12MB190143:EE_
X-MS-Office365-Filtering-Correlation-Id: b561a47c-e33c-4d21-ccfe-08df39b45061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261021121427099003|261102123227099003|261026140227099003|261028144727099003|261022075727099003|261026121527099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	A7fBTKFPWJEPiEAxHkkJolo0Oq+3g/pQKx+F6Zfth5cG2kDgF7soSlzICMU0m5oRahtxE2rZFIGtk/Sp2r2qKu5yKB485WwdVm6sUXqlH0uQgxd+xgGQeKcZ2sDo0HbZNbz+v76tr2RfkIk7lQphXrqtSAMZtTCcm3dGC9Vps9tZUFKmz1hr7Ei1E2xFtl9OYoBSPWnPXS6PDO6djAjZYPNHyonf1d6+SkqMyFVJ6KU7wAkHaxmd48bn6KhBaZNP8e1WITdL27vwo5sNemu8E27TXRxmvT5mrUB0FRQU2iaknbtJ7wKyz+Ua8iD/rttWF08HP997J6sq+7BtaskxO1uyx/Zw0ASI0LqNbeO/pI65fmJa9AE6kUtDzU3K2KUkJ/CmHGcroUJCVkc2mUTdtPCqI5lTuxf69sVwuKn0WCTLjDBZqzBIi7eRLqv5l2LELnIBcIf7iMekCfwuz0w/Fh+lYErmX5aP3h8bM8KGETF9VESTF/FktjPyxk8e3vwRf+c+rzuOUMEI4uwugCMz3OGDvkTJsqh1imEZz1qTnsiwKJSldSdJr6HRbRKw/boq11gdtQFgeODwURdQnNif0eebY79J1ge7n1Ll2XZiO2fpylgQcs+zak4n10vdaPqW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003)(261022075727099003)(261026121527099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVaRy9OaFJLMkJRZWdmT0FYV0d0VUtvMjZaOGpXdEdlWnNhRWs4NjFSRWVk?=
 =?utf-8?B?RGgyTlpydzRrZHdsUitubGN4dlpIMGI2NFViS0J6UXV5Ky9xMk9reFppZHd0?=
 =?utf-8?B?WXFBdDNOMnBnMXNpZFdGalJBc1c3RExFRngvUHRtNWo3UEFRR0MzcHdvdGNo?=
 =?utf-8?B?Zk1CaTd1clRXbnhYZ1o0Z0pIT0hJRTlKOVdqbzR1NFhtaU84d1BFUTBFc3hF?=
 =?utf-8?B?SDlLY2UvSGtpZ0lEbFRIUU1LYWdBOGd6WUVtbEJFbkhFaEdKK1MwNXg0UFYw?=
 =?utf-8?B?ZnhlNFAyOUxvOEhVMCs4a2FxUm1QRmFXU1dLZ09XU1RSTVVSUEx6TmlEd0Vj?=
 =?utf-8?B?WU5oQmtSZVkyRnl2UmRKemNkdGFVRjk4L2Z0SGp1VHlGLzFPSmNNclZoNVVy?=
 =?utf-8?B?UktHOFNRbnNnTloxdU9LSDVqRWFlZTBnSnl4N0JDSGZNTjhML0dpVjc1STgw?=
 =?utf-8?B?ekxjRXpDcElXUGRrYmdYc245L1gvV1h4dGRhcU1OVEpVNHdydGRadTVUclJH?=
 =?utf-8?B?NG14cHI5TnBJVFNIR2d6L0VBV1ZuOVQ5L0hxbkp5KzNRSVFJN3o3ZGtlSE1F?=
 =?utf-8?B?MDlBbk1SNnZjTHFyOVVsaDBvV3d0blYxRVlWTWJoSHd6YlA1VjAxTFVVVldB?=
 =?utf-8?B?UDRjUEhQTE5CeVZQNVBqNFRLRHpKRG91cXJvZ25iOFNJRTZteUV5bENnZmFH?=
 =?utf-8?B?aC9EMFdkZWlpWUdyYnpGQTJFMFRJUnN6cC93OVVQVGRFYjA0cEI2L25ONTBL?=
 =?utf-8?B?b1RBWVFNOWdiaHlnbVRhMEx1dVhnYUxpd0F1WnhHZU1xcXJSYmVBR2N4Tk90?=
 =?utf-8?B?S1lTd0ExN0hLb1hESlZ2eThiSllSSy9CTTBTZmdCUnFHMUkyQWZxZGozRDN6?=
 =?utf-8?B?bWZTMGJNT2YwTUJuZEh0c1RRRXROb3ZqbXR1dkR2dWJ4U2pzUy9WQkdJTkRO?=
 =?utf-8?B?TGxpdzQxeU5FWnZMTENiQXFPbDRhNVZEMUQrVG1tcDlnV0Q1c2RrS1UvUWNY?=
 =?utf-8?B?MkNkcWFOZVdrWlhlZVc4TzNMUWkyTVlTZTVJRktzWml5cVV0dURtSElNK1o0?=
 =?utf-8?B?UG5GSkdUc1VVTEV0L1lKbWR3eGJPUkN4U3lsRlZVQ3NhS0h0SFI5NmpvSDdm?=
 =?utf-8?B?T3JVSmh0S2ZidUZadWxrQi9uQ0NBT2VyTlJEQUVEU1hWMWxjVEtLVHdjQldr?=
 =?utf-8?B?RmxlNjdJVitaQXhFN0dPNzUvb1VvdE9udXpJTEdtTGdnRGM3WEkwSlBvMXBQ?=
 =?utf-8?B?cVZQQ05VOFdHVnE3ZndnakdrT1ZhZTRZKzhlcURVUGRwd3JmZENjVlR6a1lv?=
 =?utf-8?B?LzJTMlAxSnNvRDI3TmFpdUZsdnM3S0ZBdnFIdU5TZ0RmeWJxSDVUNFd2SWli?=
 =?utf-8?B?cVZrZTd1MDV3SHFFcW9xaHhyaUs2STdibDFjZUFHM1JlTDArM1o0NDlWamk5?=
 =?utf-8?B?TFcwWEZnM0ttTWtNTzNqYXA0OXNuSTErMU5Sd21zb0IzdVlQUG5GUFkyK0xG?=
 =?utf-8?B?WVVuZm5nS2k4Z3BBemRDbHpFVGg4eFlKUTM4U3BCZE9xZTRubEJnUGFuTDVH?=
 =?utf-8?B?dXlPYmRLYUlTd2ZCZVhQdkFqNjN2ZHBsUmtPaStrbDIwdE9pUFhmR0U1RDIr?=
 =?utf-8?B?MjlmYjRLdnAvRlFNbXJiR2kxMGFDVnhEN0NiYkdNdHEyQmRsVWZ2TzNGSW9T?=
 =?utf-8?B?UGZNUW9LRnRFY3N1UVRlVHhWUkJ1WnVYbHBTVDBvRFhOTjVVTkRwQU9WTjRH?=
 =?utf-8?B?VkY0Tnh4Tkkwb1V0K3BIU1g0SXpob1MxM2JBMnVTZ0FJeVFka2xxdE9INUk3?=
 =?utf-8?B?KzBGNU9PQjBBbXBpYldJckptNVVvekkzZlpudFFqZ0lObm1iaHlCbUV6a3c3?=
 =?utf-8?B?MFBsWEJKQ3FCbXBpbHdreVVxTnZvTmk5OGFSeng4emRtOTVKNGF6TG5xa1Ru?=
 =?utf-8?B?M3hkclVtTVpvWWxhS29rQVFQQldaNUNJZEFiQVlFRHcwUndxUUc5VXFrN0Ex?=
 =?utf-8?B?Y3V1aHM4SkhQK3R6SkRDMUdueEJLZW9ZS09wSWhsZWVjaEJXY3ZSTjVJaEtq?=
 =?utf-8?B?Mm1hWEZsNmUrWklVUkR1clVubHl4Unk1MXl1ZkpTV0FHM3JjbThycEtreUZq?=
 =?utf-8?B?dHJlQXBhdXFHWERJY0pMWi9Yb1l6TTJlNmtFVUpZTGRkWnUyei9hTnQ0SGNO?=
 =?utf-8?B?ZmIzQnRnQkJDZFpYdjhmdkpqK3d0ekpwYU1YVzdtZTM5RFRqcktWY014Yjhx?=
 =?utf-8?B?UTYzQWZhcmZyM3RwVkhCeWJiL1k0ZTdHRThzQ1UvMWdieURaMlNkVE5CK2tx?=
 =?utf-8?B?K01jbVQ4SStrVE5EZWk4TzduSkVpRFZJVkV4Rk9RaytSWlNsd2VDQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b561a47c-e33c-4d21-ccfe-08df39b45061
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:11:12.0065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Cj8hdv6C75Qmurp244Ty9/ZN0sVaFzxNHOW8yLvmV7K5JOWEjewwxPXEkjHrd5Z4iidgMFdgfEBvJd/1UWPtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB190143



On 11/3/26 05:41, Kang Chen wrote:
> apts_if_call_store_buffer() reads a u16 length from the APTS buffer
> without checking that the buffer has at least two bytes.  The sibling
> apmf_if_call_store_buffer() performs this check.  A Buffer(0) reply
> from the APTS method makes the driver read two bytes past the ACPI
> allocation.
> 
> Add the missing length check.
> 
> Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
> ---
>   drivers/platform/x86/amd/pmf/acpi.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 4392bf0bc0bf..8e0d9be8c042 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -137,6 +137,12 @@ int apts_if_call_store_buffer(struct amd_pmf_dev *pdev, u32 index, void *data, s
>   		goto out;
>   	}
>   
> +	if (info->buffer.length < sizeof(u16)) {
> +		dev_err(pdev->dev, "buffer too small\n");
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
>   	size = *(u16 *)info->buffer.pointer;
>   	if (info->buffer.length < size) {
>   		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",

Thanks for the patch.  But I would say there is another on the mailing 
list that does very similar and covers more:

https://lore.kernel.org/platform-driver-x86/20261005072811.1378555-1-Shyam-sundar.S-k@amd.com/

It just needs to be rebased.
