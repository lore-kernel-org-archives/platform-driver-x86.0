Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010073.outbound.protection.outlook.com [52.103.72.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24804A3C;
	Fri, 26 Dec 2025 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766749361; cv=fail; b=mFglO+ffcDI5JKhz3sh4pdwyUIDLXIHM56poyQaqWfulnxgi+4wDbULxNZu9NK5/4ov9WtOfj0LE9n+IWlIkLESVTEYN+dZNN5/2AasECZ2aeMVM7yu6Bmodc2NJ8RiR4IB7bEFqKOY8rTgYzAbYz7VbOLeRvo//YYwqz/zdNb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766749361; c=relaxed/simple;
	bh=hl43pRuJSzwaXmdJmdB78Iw81hwwkjT6+d/FLS1nsU8=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=T+i7zQCHVbkWfqGor+v6spbR1ygerB8cM9Wz3mVI2kqO6aoimUoexY8yb4+UdhlaOoTqMzCmmwlYgL+oSVQY+e/2LWT81iS8kJzXsEnolN2H/O9nQ69tNciTSWk62Xmi+Z41R5kBiGn+y3OMUfkece9YJMd37LnVZ4kTjQ0kras=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Gt6utdHq; arc=fail smtp.client-ip=52.103.72.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Gt6utdHq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAacqByk3kBm23wp+ZOehuyjb+0nq8UM+hZL5XZjcTX1BqPMiUnCNBJ14NDnfB+nm7eZ/jcPdvC714W3Ob/c9Y+GaAaq2tBzLM3ZRPXo0+zDleco/gM5JTMgqqXnR+RFtGmxMJrmVjKJlSfmd9Y5SyzBLdTXa1bjjcIo7OpWqGWQs9y7B1SYKT+uwbxX/Ql+UF9zsrtcG6wct8pt8OaZOrw2w+V9ghr3XMmC2vcpWQqCgsUfmJJFWSlhvvWR/QhuqTuztZS65kbh4tpkZVUpbsH3Ftq41KG12aUPGeotTboFZHgwiErOUYS19bg3cpAyKwxgyDtNQgFwcO1jYV87jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5k0w3oUp50UkrqZnEHe3JGxTSg3IIZJva24JRXMboOk=;
 b=TjgtR6KRZ9+860SbBe3aJoQGuN59us2721rldEePQ+kuncWCejTv7nD6cPIjevlYEi9ie8OV+LA1IbXc5V+t67exEp2wp7fJ5ex8QL/UgJGofsezUQDi9DP07sy2UU3sjo7CTFOdZ9d4yj3Nrz5b0AOcIwiyUq+YjT+b2jn6sUbEp6Zvxq75KtptD9yQDytEG8hm8eIleRkmLlASx8ChPJBfiWuDe1tTHHm59RdkYXAzMPK0P0EX50SDpE+yYZinVv8yfxPciLhYgL22yk2Vl87lxqKXr9T3QCiSmM++Ffq+XULFdh9EELqBQVIhlVEQq6g2uvj8Xlc64g/txesosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k0w3oUp50UkrqZnEHe3JGxTSg3IIZJva24JRXMboOk=;
 b=Gt6utdHqX4YUCIt7U9XaVqjKqYE8SjK/71VlAXKq983o8UrDzH3RoopNJzOkictwV/MLHxmRwzPLIpx4LSwxKf6ObbX8It6SUK2P8NOORBqbfeL7oIgbR8Lm/U4kmvwnsEl0PKegkWJHS5qJihsb+JSw3nJh/msZYbuho1nf6lWtIVxOdzItWhr1zPHjiWuVzaaXJ8Zz+C+j+30/66q1PU7uQrDC/cozeFKGXWo1ixm1xK9sv7y1pHpO2oZHkKy3ncV8g8/ex/IbR8LRDB0UmgJ9CbxYpbd86ZivbeRnAp0a13lddanB4ER6OMs4j0PYUUc/APxHQuq/WWIlDj8tEQ==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by SY4PR01MB6044.ausprd01.prod.outlook.com (2603:10c6:10:f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Fri, 26 Dec
 2025 11:42:35 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.20.9456.008; Fri, 26 Dec 2025
 11:42:35 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Fri, 26 Dec 2025 19:42:05 +0800
Subject: [PATCH v2] platform/x86: hp-bioscfg: Fix out-of-bounds array
 access in ACPI package parsing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB788173D7DD4EA2CB6383683DAFB0A@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAIx0TmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3bTMitRiXUtDE0OTlNQk87QUSyWg2oKiVLAEUGl0bG0tAJ14J3Z
 XAAAA
X-Change-ID: 20251226-fixes-91414deb7fd9
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>, Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5887;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=hl43pRuJSzwaXmdJmdB78Iw81hwwkjT6+d/FLS1nsU8=;
 b=owGbwMvMwCVW+MIioLvvgwPjabUkhky/kkWpflNPhDZy6d1hOznf80hItsHdORPLqjfO85VRs
 j64QN+ho5SFQYyLQVZMkeV4waVvFr5bdLf4bEmGmcPKBDKEgYtTACbSupKRYQlHrIbJ2c9bXr42
 q/Nc/O3dA/eDGXwnP0r5m9jNOur8pZCRYXlErvHx5XMmfUjbqLVqoamGhMdix+T/muWK074Y5XT
 +4gAA
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: BY5PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::35) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20251226-fixes-v2-1-9f0e6c0a01c0@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|SY4PR01MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca2613b-2193-4c4b-0936-08de4473dc5c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|15080799012|461199028|23021999003|19110799012|5062599005|6090799003|8060799015|41001999006|12121999013|5072599009|3412199025|4302099013|440099028|10035399007|40105399003|1602099012|13041999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVoydDkwUGFoWnpTMVlyUmVreFl3ZjdiUE5odG5SNGh2cHp0VEpxRmNKUndl?=
 =?utf-8?B?VjM2N0duem15YWdzK2NqRHAxZ1VYeTEvSWFZOGNnQTA2VjZLa0V1ZEFOK0V5?=
 =?utf-8?B?ZVF6cmpQdWlmSy9zUWNxMjJqSzh4dnFqUE40dnBOeE1RSmdVNklMejY5a1d0?=
 =?utf-8?B?dVllUUxsam5FU2JtaDI2cjRHMXJyS0M0enBEdVoxRFQ0V3JsMGlwb2M5Nk9S?=
 =?utf-8?B?WXQxQ2hKNW9iMEtqcVBOMEhzaDdyUHBmSVRRdlhnY3h0YndUMVF0WVl2ZUN4?=
 =?utf-8?B?WTk1NHV5RGg5cFJpRTU3cHF6THNvUGd3T3pZWUlCTVk3YWR3SkpnQ1NWenhN?=
 =?utf-8?B?dG5jTjN2S05oUGNIQkdjb2R2T3F2NjdBU1AyVk1uYWlCQUxQb3plYTdQczBE?=
 =?utf-8?B?V011RHZCTGZvVERFbWdWcmhOZjZDanNlRHNWL0tWdFVua3Ntd2dpUWo5ZHVn?=
 =?utf-8?B?MlUwaHVmWXpiOUV5WjdGTG0wbFJhZVA5ZERPK01DU3pRYStreWtFWGlmR2lm?=
 =?utf-8?B?V1g5SXdFV1M4QnBsTmhMYkRnc082VUlCUFNzdUErblFwaWRzTVlKZW1NZm9p?=
 =?utf-8?B?UzhpZkFBQXdieDNHTXZWdW1yS2hycGppcko5dFNqcmNEYVVGWUU5clNERWZQ?=
 =?utf-8?B?QncrZ2MrS3FVdGlrLzBhajFLTFQxMHRaWVl5dS9xdkhPeks3LytlNUExNG5F?=
 =?utf-8?B?cWhQQ1pNUXBLMGlZaFVpYnZyYWU1ajlya1NNazIwQm1GTWNRZjJOeTFwNGtK?=
 =?utf-8?B?c1BQTFZsbEFYNVY5amsxUk5JVGkycDQvSUs0QXBHYklnTmJiUWppb3dXS1lG?=
 =?utf-8?B?YlYyajI0UzMwR24vN0Z4YTJ0TGkyS0p2K283dWU2MndEZ3dlak9XZjNaakFq?=
 =?utf-8?B?czZVVEdHSTNmdXByNmRUaGFjbVlXNm8wWjBjZ2VzYzIzK1R0aUZQeFR4YXg3?=
 =?utf-8?B?Wm5jdGxOWmkvcUd2UWxrazlYTTFmZHB3eHZhVm1kMkwzWDUycEw0QU9vRHZo?=
 =?utf-8?B?WlRrc1gzSm9BTGRJWFRGUHRDWlhBVXAyZkhrWEY3aDZ2VlJiVE11ekZra0ls?=
 =?utf-8?B?SDFSeGdEWElBR05ybC9QMFE1RFdkdUI3ZGVBZFpsWjMxSy9qSTBNWTZmWU9C?=
 =?utf-8?B?K2Y4R0tQNlFhTzJXYVpJcUxoNGFJbWZvZFRybTRXYitqQjVKOXJkWXpPTWdQ?=
 =?utf-8?B?bWRyTHhoUU1aQm44MXV2cDUraVZTWkNybG1MelhjcTc4L3ZnV2M0MnJEeWMr?=
 =?utf-8?B?ZGpic2NnSlY4aGZXcXh1ZEhLV0RUU0JGTTlTMW9WUFlpNXlpeWJQeUlNWWR5?=
 =?utf-8?B?Y1BWcS9kalAwRE0vMEtVVFBRNENSR3ZtMmNzYk5iTnJpdHd1NG4wclpMS2xo?=
 =?utf-8?B?aW4zVUFEaERwcnF0QUZudGNqR012aEVjN1Z4NFRSMFlUNlZlQTkvZWFQS0dU?=
 =?utf-8?B?QjFuY3ZJb015UFhWS0hZTmFsNFN1MThmZGV4YzA1T24xdFI2dWVEVFY0RjNS?=
 =?utf-8?B?ZTJlUFBOSlpQRHIrRTZHQnkxODNUZy9LaHdDdC8zRkJCUW8raHQ4VlVsaFRZ?=
 =?utf-8?B?VFVWcmxkSzRRWnFzVnhQT1dhR0wybVZ3SWVITTNnc0hRZzJDb3NCcnFOYnNY?=
 =?utf-8?B?QXBtTm1OSE9XdlRYZXF4MGtSYmRENHRNZEJXSmhJZnZmWFcxWUlsNWJlRmJv?=
 =?utf-8?B?YlJCNy9zSEFVbUJHeTc4bDVJZFZjTVh3cHg1Tng4RlUvSWZzdmVaZ1pLa1F4?=
 =?utf-8?B?TVh3RWpLL2szdmRJa2d6NGZ3eVFQeFhoK2RuMGhOUTUvTEw2a1BEVis4cTNP?=
 =?utf-8?B?OTZzdjY4Vnh1VDJyeDFOcWFOcG5nRkN2d2FBOEtNczR3UjNMYVpZelF1a0sr?=
 =?utf-8?B?bGk2aDZyNDEwUkZDT1ltSktqaHF3TXIvSU5kK2x1d1p1RW5ZUVF2MkJGREYr?=
 =?utf-8?B?OEV6UUkyQk5zamlFUjA2RnJWOFcySll0Z0Noby9DdjhRVHVYMGlpTERrRWZz?=
 =?utf-8?Q?7MkwlBn29am8st2QzDrs3OHszM6gnY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmI4d1VLTnR0ejgyZ3BiUXJ2M2UrbktYby9UTWdwZXdpR3Jia3ZGY2lUWXkx?=
 =?utf-8?B?YThnSTZiVEdlYmhEaFE1NGlKZGVOcWxROVluVGVWaFJoT1JwMmZaTC9yUE9M?=
 =?utf-8?B?WFAvTVlqeFA1NkQ0MElvWHV2dWhzanhJZEFXUTc5eDdGZkp4WWl3SzZyQStk?=
 =?utf-8?B?bjkwQ2VqWGNYLzdROTBON1JtYjVWTG1tMVZCZEF1bkRxTEJGYXVsUzIrc3Za?=
 =?utf-8?B?QkZhVHppdEtPRnJpblRodmwyTmswdHZld20vQ3lNV0xKcnh1dEJ5b1lOYS9q?=
 =?utf-8?B?TzROOENkYXkrSEpBQlRqNHhIdm1qRkpWUEE2Y3JPYitZVVU5ei9nR1Y3Ym91?=
 =?utf-8?B?VTdvdVNFL25SY3NlSUtsT0JFb2pkaGRrRi8wdUNBU1doajUyVGJNVjVUOXZW?=
 =?utf-8?B?d3RhUmhma2hoY3ppcXN6YmVjUGZHNlFjQkkycTB2bkxaVEV2YXVyaWcxWTh5?=
 =?utf-8?B?enhhR0hud1V3c1V1RDRKa3BZZndxRFpEc2pBLzdhZktWMmtNV3ptOXdwVUJx?=
 =?utf-8?B?QTN3MjFvNjhnTGwzUmVEYXVibEpaYnI0WVpQNnJhUnZFb3BGcmxNUmZ3bEpp?=
 =?utf-8?B?c3Npb1dhU2U3ZnJDdUhub3prbXNpWFI3YUhCa3cyNzVFK0JlY3ArNHdXOGdp?=
 =?utf-8?B?bkxUM1E3U0RoK3lGRUVzMGVEd3NsbGNkUW1USGkxTnFiOE9STTNWR05EbWho?=
 =?utf-8?B?OXpQQkd3MkNsR1R4RmJDMU9ranFOdmRRaEZaNElSbS9UZEFxL0F4QVlsWWNX?=
 =?utf-8?B?WTlYaXo1empscVY4SUQwcGdFYzBaQVFyZXUybktjVDF0dldRclh1dE5FOVU5?=
 =?utf-8?B?V21mVWIvM1VaMkRRM3dncms0VC9SRnkwL1dNN3gwdmNkRWw1VjFPUnQwaXZZ?=
 =?utf-8?B?ckRLYVZ0aVNjZGUyL0JKOE9NN1hDekV4cksxTXc2endnV1F3eHhjZThlQU1N?=
 =?utf-8?B?eGtvRG5HeTBha3kvazB2OGhZQU9Bdm5TRnZkSHVFd2hVSVJGaE1nbGtidHNw?=
 =?utf-8?B?RHBWZ0Nhc3ZGaHkyZ3VGOTl6S0w1RnN1Tm9SbHNiZjFPZU92Zjc3dnlHWG1D?=
 =?utf-8?B?NGhhczdqM2ZBaHlJSlc0V1o5UmJNM3hDNm9tTlZaTmJTTDNXeUloMzlFS1Fu?=
 =?utf-8?B?WDA1Nm5ONHE5YVBIamZPbnpMVmx6WmdEQy9aN05YRVlIbWZMRFRPYVdyOUp4?=
 =?utf-8?B?bXVoZ0o1V25FUzhDaUZCdlh6OU5vWWgzUENEVlZ0ZWNVK1R0VFV3c2RicjFt?=
 =?utf-8?B?MU01NkdnQ1NkVEhJaHJ1OXI4WGoyVDQxbkVXV1YvZklscEtRdHQ3WnM3NVls?=
 =?utf-8?B?VFQ2WU52TGZFS0Q5cVlMWEtQT1B4bFFtZnMxY201V0NUdWlTMzMxaldDWVdh?=
 =?utf-8?B?YnQ5QWhPRk1WT1lYWDljVmNNU2k5WU83dkQ2UU9uc3JWNG1McE8xMERKMFpJ?=
 =?utf-8?B?bFZ4RmFlcmtKekVScVI5WEx4c3ZubUJaNkpRMWJXRUlSdjdzSlFhdHRSNVJT?=
 =?utf-8?B?NFZaTEZQUkFhWVU3VFJhbWhJNXNrcHZnSjErbzB1N0FXS1d6WGVac0hEd1J5?=
 =?utf-8?B?a01LbklZL3hnQ2pvV0FNeG5ZallJYVg4UUt4UmREcUcxU1k4YitZT3c5UXY3?=
 =?utf-8?B?VkpJWGZRTDhuclB6eUg5bVdRTUVMNXJISkxVV2M5UFZGVDhYaEJRRHV0ZHdh?=
 =?utf-8?B?TWhSSmJydTgrbnJrNkZydTBDeVNnMkFVamxNWFMzbTVCV3pSb01MRmZqK2Vu?=
 =?utf-8?B?cjlYV2JQNzZsaGVxMHJEU2RrVjltV1gxb0FwTkFBdjlIZjdaQVBrdXIxWlU2?=
 =?utf-8?B?TVB6R01JUTl5VG1XS1pTdlo5K2VaQ2xaRjRrbVU2Rk51azFSMVoyUjJtRWQ5?=
 =?utf-8?Q?vXzjyO3e69MeM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca2613b-2193-4c4b-0936-08de4473dc5c
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 11:42:34.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB6044

The hp_populate_*_elements_from_package() functions in the hp-bioscfg
driver contain out-of-bounds array access vulnerabilities.

These functions parse ACPI packages into internal data structures using
a for loop with index variable 'elem' that iterates through
enum_obj/integer_obj/order_obj/password_obj/string_obj arrays.

When processing multi-element fields like PREREQUISITES and
ENUM_POSSIBLE_VALUES, these functions read multiple consecutive array
elements using expressions like 'enum_obj[elem + reqs]' and
'enum_obj[elem + pos_values]' within nested loops.

The bug is that the bounds check only validated elem, but did not consider
the additional offset when accessing elem + reqs or elem + pos_values.

The fix changes the bounds check to validate the actual accessed index.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Reported-by: Junrui Luo <moonafterrain@outlook.com>
Fixes: e6c7b3e15559 ("platform/x86: hp-bioscfg: string-attributes")
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
Changes in v2:
- Add a more detailed description
- Link to v1: https://lore.kernel.org/all/SYBPR01MB78816A828BF586364CF7A4FFAFA6A@SYBPR01MB7881.ausprd01.prod.outlook.com/
---
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c       | 4 ++--
 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c        | 2 +-
 drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 5 +++++
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c  | 5 +++++
 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c     | 2 +-
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index c50ad5880503..f346aad8e9d8 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -207,7 +207,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 		case PREREQUISITES:
 			size = min_t(u32, enum_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
 			for (reqs = 0; reqs < size; reqs++) {
-				if (elem >= enum_obj_count) {
+				if (elem + reqs >= enum_obj_count) {
 					pr_err("Error enum-objects package is too small\n");
 					return -EINVAL;
 				}
@@ -255,7 +255,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 
 			for (pos_values = 0; pos_values < size && pos_values < MAX_VALUES_SIZE;
 			     pos_values++) {
-				if (elem >= enum_obj_count) {
+				if (elem + pos_values >= enum_obj_count) {
 					pr_err("Error enum-objects package is too small\n");
 					return -EINVAL;
 				}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index 6c7f4d5fa9cb..63b1fda2be4e 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -227,7 +227,7 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
 			size = min_t(u32, integer_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
 
 			for (reqs = 0; reqs < size; reqs++) {
-				if (elem >= integer_obj_count) {
+				if (elem + reqs >= integer_obj_count) {
 					pr_err("Error elem-objects package is too small\n");
 					return -EINVAL;
 				}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index c6e57bb9d8b7..6a31f47ce3f5 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -216,6 +216,11 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 			size = min_t(u32, ordered_list_data->common.prerequisites_size,
 				     MAX_PREREQUISITES_SIZE);
 			for (reqs = 0; reqs < size; reqs++) {
+				if (elem + reqs >= order_obj_count) {
+					pr_err("Error elem-objects package is too small\n");
+					return -EINVAL;
+				}
+
 				ret = hp_convert_hexstr_to_str(order_obj[elem + reqs].string.pointer,
 							       order_obj[elem + reqs].string.length,
 							       &str_value, &value_len);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 187b372123ed..ec79d9d50377 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -303,6 +303,11 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 				     MAX_PREREQUISITES_SIZE);
 
 			for (reqs = 0; reqs < size; reqs++) {
+				if (elem + reqs >= password_obj_count) {
+					pr_err("Error elem-objects package is too small\n");
+					return -EINVAL;
+				}
+
 				ret = hp_convert_hexstr_to_str(password_obj[elem + reqs].string.pointer,
 							       password_obj[elem + reqs].string.length,
 							       &str_value, &value_len);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index 27758b779b2d..7b885d25650c 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -217,7 +217,7 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
 				     MAX_PREREQUISITES_SIZE);
 
 			for (reqs = 0; reqs < size; reqs++) {
-				if (elem >= string_obj_count) {
+				if (elem + reqs >= string_obj_count) {
 					pr_err("Error elem-objects package is too small\n");
 					return -EINVAL;
 				}

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251226-fixes-91414deb7fd9

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>

