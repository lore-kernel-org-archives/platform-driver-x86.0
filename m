Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.74.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793096234;
	b=P28gEyt/jZnlMEZZeFScV23Gk+6G0kim0TN38APPaXcYS95Qv8uYvsbALhLK2kuduFJL
	 1h2YmphT9JEBpr7rUbitwS5d+y94pM+tI1SIZL4GdVjhHbcKM99r8Ai2fF+c8KkEHuXjC
	 DvWuitapK6kvq1cxUIAF3W7fPAF8Twx9e+8P0qdjpDLG3wkVwpOLqUtwAyTputOprqwsU
	 pLsF3R4MHDGSE/eT4F2tVfN1Wbhus2E8wSJ4sngiEBZwTAyY6QZf39ckOugqt7PVtYjrF
	 5yMgSX1Orx0LC0yKNEukErA9Sm93aBZN5vhwjGMf120qE+ZGf1fSJz0+xdi7rFOrGvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096234;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:X-Microsoft-Original-Message-ID:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=g1C7GweITy4O0zZtZEYwU99lRrQ7BNC0D4DWhN4omy8=;
	b=Ma3s0GhSZm2aJtneTMoq/96jVJSOAgaZS8cW0y5YYf6Vgm79/bUNp5E6pA/VmM5Oi33c
	 OORFQIOMSLcMi6U8FLEmYS+ZYu+D+Yko457p83s9jIqZ8/5nW1eLC6BPrI04tXNEMFWtc
	 QXVZjqa2IplTtWtOY9rP1trf5Ap29QpnmSiEGQtgyQZP5/m1JrZpA4tmmqdUWMjCM35xS
	 E3vHvf8Q7HVTN/vm7cRLZ0QCayM7Y8grmzGv+UHNlUk9CRoD5GihonZl4B+awRar+w/Dz
	 4ou6IZpEJB8hIlGKKhXZKc0wd45qcaOHeijMkdkseXcweGDNQo47i+SHeaXswUu48Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=frUts7Ye;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.74.76
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013076.outbound.protection.outlook.com [52.103.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC4606A321;
	Tue, 27 Oct 2026 10:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=frUts7Ye
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKEvYaYsESMAB08yLbNFjbADN2140ZzNTUsNHwvTtlIroSXIMy41e8foXe0XwjqyO9u92hmPwZVk5+PXfyuPKKGHS+FCWmAIsgGvbW9NekKc238aRHs9xR2P1fbdr7nk6CIUWuQPBcu63wKYnaLXCM96MgiueiLEjt20Pg0HGpt88vt84JtZ+ysySfW8YJLbjndXeCLyPK4IMUfJOlQh7WuHC12RG63kcc6gSz9DG6YnPcgJtAN63WTg6roPX3wNgC7wfa3pR7voX9WWXwt2sPJD0Fxu2EQTrzrlww23UTnMcE/Q1zb+kSImpqbji54HWQYWyYTkOjYdloy5W+6pnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1C7GweITy4O0zZtZEYwU99lRrQ7BNC0D4DWhN4omy8=;
 b=SMovP1OvkNwKYqhLn12w5dPrWvXaIgj7Puv8u6DABde/CkMUyb0ejUlHBDtPk8J8jA7pXKeAchUPr4byhjVnNG+f4+7I83pkMzyhMlT+o8eykVBXKHAvOP1QAwZOsK9TWMGhDmzNzwAP/1BkuvXva477Vsd3/M9SmdfUoiOIbNH8VZ2ScEuiOP7I3BafYEu72Myy5BqyUGuiVkrU6ASmpdCBYRsIjUScJD/RnKHdLxbA9p35kTtrJtZIN99AvKUnUW6YsYts0vrO7KFDBF2IPcGWANRFKVyL0pdxO8t/vYfBXMy8EyHiHcVu7Dn7RGiv3gydbg2FsAAgdz9AVGg9HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1C7GweITy4O0zZtZEYwU99lRrQ7BNC0D4DWhN4omy8=;
 b=frUts7YeRH5ydBCqFcsASHFaoR+6zbyujiykGC8gt9eMGd8GVUpujlDcOzHBMg4uXiierO4hoEBBdoFmJj9TYXdnsHShdJQGKgWUtK2A7dGDmajNAmjOEwsx6tfGvw3ERoHjoPXkoLD+6Cu2Dbw8xHyjsO8ZrsuetUTtH72FijFl81nX82a/+6T8ObdgCyXkTnPHyP2H59MU3Bv878g8lmKtNxzDvwEk0akXGsnqcWc19CMysu3wvTXPLuotEyaiV2c/TneeeXr+fYJHlfxtG9fixMohBIXqWqF4MMms3vIE02MN+7ZbpKofmkmY0bMFj82NXCIJNO4qZxI+hRZhng==
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com (2603:1096:4:1eb::6) by
 JH0PR04MB7228.apcprd04.prod.outlook.com (2603:1096:990:37::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Tue, 27 Oct 2026 10:17:09 +0000
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9]) by SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:17:09 +0000
From: Shuwen Bao <baoshuwen2013@outlook.com>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Krishna Chomal <krishna.chomal108@gmail.com>,
 Emre Cecanpunar <emreleno@gmail.com>,
 Suryansh Singh <technosfan14@gmail.com>,
 Radhey Kalra <radheykalra901@gmail.com>,
 =?UTF-8?B?S8O8csWfYXQgQWJheWzEsQ==?= <hello@kursatabayli.dev>
Subject:
 Re: [PATCH v3] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
Date: Tue, 27 Oct 2026 18:16:58 +0800
Message-ID:
 <SI2PR04MB5895B03A7B0CAFB30B07441EA2602@SI2PR04MB5895.apcprd04.prod.outlook.com>
In-Reply-To: <f7612110-b309-2c81-690f-0f43e0520ab8@linux.intel.com>
References:
 <SI2PR04MB589508E55CCCD8E26E53E4DBA2942@SI2PR04MB5895.apcprd04.prod.outlook.com>
 <SI2PR04MB5895909A0EDE359BDA4F78A3A2632@SI2PR04MB5895.apcprd04.prod.outlook.com>
 <f7612110-b309-2c81-690f-0f43e0520ab8@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SEWP216CA0019.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::11) To SI2PR04MB5895.apcprd04.prod.outlook.com
 (2603:1096:4:1eb::6)
X-Microsoft-Original-Message-ID: <5146387.31r3eYUQgx@supercomputer>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB5895:EE_|JH0PR04MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c7bec5-53a1-4f47-840d-08df34137564
X-MS-Exchange-SLBlob-MailProps:
	02NmSoc12Dcj/mAxI/NGvzdUkjNASRo/655/LLvrRwBCrOnq54h/gezvJ42hiIGk6IPb1aQB0zBrOETkKSlSSnHTc1Cceb5TK8p6PMR68QnWFfqlhGD9udwXHotPNJrNXrBxDaB6AYQqWP2Dv9L0fcz8o8lbHFrFTlEguo+VYydg8V1TVe7aXUwVZUFWbnOt6xKa1ELJhAmpdACvTusxdN7vt7eovhdEcolAALy/ChWfWRMdBYH+VrU2UkuPPx2wGHjrLTtzaje+L1oZUUf59hQUowb9vz1pyv154di5yiIleuT55IvQtelqkWF29rXgu8VJ1P3ZglygLoJH9t+NCJQ2iUCZerJlkOFYaQdBT1G6J9EAGEAhcXQCup/zbSLP8AuVHvyIOvFHymCaaYHK03Acg6VwwEx+6M/XB7BE/25crvpnJ9HIggl59zfBDNoI3rSGnu2+mfXkN8Wlmm9lSUVCAOz32fCPq4hjF6TlSeh9h1mNT/kvfEPgfJXhENQak4JemM4ZlpsssvOhEw+ZbBmjlzKHfr9SG/fBWOCMyc4o3wLlxvXntCi+27qhcKnHmlRXBFXzhCB/1ECXgOZEfDafkd1UESnWTD1o9WuWdfFZaPgoHZyp3lKlWMIeOOZC1IrjzUAJmYR02PmGLsSxn3NSDGDtC0ZEw2JebKVlltglSSu53LDeHTsJBV6+M18VlsfEWLGdthwHk91vJsuP+VsoJaQgNeNjJ1+CK/8duAsQ0H0dxc+W1vWtRK0cXvRk
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|24021099003|25010399006|5072599009|6090799003|15080799012|25031999004|23021999003|51005399006|22091999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OERybjg5S2lFcThkcU5JSWZqT1lmeVBUZTZqaG44UExXdHlLU1pHUE81RGVt?=
 =?utf-8?B?bkZkQWpiZGI4QWZOSEVXSkxjTEphZnhVSnBzcENRWGRzdHQ1d1JKY1FHVGwy?=
 =?utf-8?B?MkIrNnBGOFhIOC9pT0VTS1N5QURxeUpPenR4VTVHZSswam9IM3Y2R1lleEZz?=
 =?utf-8?B?T25hL29uNDZCTkVCZ2RsQnFoSU1GTmFtenJkV0JLY0g2TFA2akVySHZXZzlF?=
 =?utf-8?B?R1Q5c2hYeTE3dEpEWnowMGxmZDZZaFNQSlBqaTJ0dkZMTlR6ekV6VGRSZHZa?=
 =?utf-8?B?L1hjdmZTZUs1dmcrbXN5N3JFcDR3ZTB0eDNJT2MyRzFhMHQyZ1ZnOVliTVhV?=
 =?utf-8?B?clVIaE1sTEc2dnRBZmt2cTBGVVpyR2ZkSEpjdERWcHJPMzh5NElaZGJsU0Fx?=
 =?utf-8?B?R2ZPbjBwMmp3OEJxZUhiQW4zOW56MCtldEsvV2ExTnNER2x4STFmVVVMMDl2?=
 =?utf-8?B?aEdBb011MCtGYkZ6SVFUZWZ4OHo4aEpwcWVJTWhuVFJlNU1uZTl6OG9ST0tk?=
 =?utf-8?B?MHMwVnZRMHpRZFBKR2prb240a0xiNUFabXpmMGdKSzdVRTAzRFhHcXRvMlJF?=
 =?utf-8?B?R0FaSGtXQjdvTVRicUgwTUJkMnBNNWNYNHFhY3ZzbTRoMEVzd0dLMmtWYThO?=
 =?utf-8?B?WlZjOFMwWklGN3FPaUo5MVhGd2UrQmg5bUNxMUpsQ3RpZ09McE00VVVJQW5M?=
 =?utf-8?B?eFhwcFZBQ2I2Z1Z4d3VQcFlLTHd5ZmVETXIvMVZseEFkN0haT04yZG8yVlFx?=
 =?utf-8?B?TjNPMUJqbHk4RlE0akg4dW5rNGh6TFNkQlNvcTN6SU5ocXV5Wm54YXEzcWhX?=
 =?utf-8?B?WC9sM0FNVzY3TkdFM2lMSVIvblBkTlJyUUVQdElXWlFEcTloNTZ3RUwrdWx2?=
 =?utf-8?B?TU13ZFpTcDRJNWdVQWhTRkFjT2NKTTk2VEM0cG44azd5R2MxQS9YcnhaUUZV?=
 =?utf-8?B?L01WM2loQ3RBc3RMR3BnS0M2SzV4VnErdlp1TTNNQWNtRXIrTVN1S0N4cUJs?=
 =?utf-8?B?NWFzZW14QkQydnd4RDdHWTZOWFNLWW85TlZZdHFkRnZuTERUV3hLOUh3Y0hm?=
 =?utf-8?B?ZUREOU50ZUZtdDh1L0daOTcybjFoUVdvTE9CNzBvUy9XZGI4cFlYNHJzeGt6?=
 =?utf-8?B?Q0NwanQ0UGJvdFg4dkk5QkVrN0cvMGZEZ3RJS2hDc0JhSitpMk1qQWJWdVZ1?=
 =?utf-8?B?RzY5cWNjUFhvR3BlRm5VUWVlM1JoSEorTmNLdkZDUVZUdTNLRUhrcm5yc2Js?=
 =?utf-8?B?aHVhQytybjJGdldaaG56a1lFdDVXS29kc1J0akRMTmpQeStTUEJpMWc4WHla?=
 =?utf-8?B?bWJnaG1wMC9pOXV2eUdtWGtFRmtHZlhRYjdLdDM1UkhnMm1uWVptZkpLbVB2?=
 =?utf-8?Q?LmFnM0yZ5jYxQ8/vKIu8oyTjuMyWyeFg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW5kWENqREJOMnBTem1TSUVQSVJkVGhhYUxjMVA3MHBnL09PLzIweUFzK2NX?=
 =?utf-8?B?aURNcGFiRkl3TFVXcVZqblBvYkkxR3dIK3R1azlnTTlYZUlWY3NnZ1V1cVdq?=
 =?utf-8?B?R1Vtdkw3enFxMThqZm9yYndwOStqTWlWNHlUNDZXQVNYaG9xUFJBTldPU0kz?=
 =?utf-8?B?VTM1NTYrcFNVL3dEM0dRS2FpeUtvMStLYys1RmdrQy9xVEV1OEJYN2tnMUtL?=
 =?utf-8?B?SDlUNWxlY3MvN2RLa0R0ZkNXRGt3QWRsUkZvcUNIczlRK08yWmpRM3F5YnEz?=
 =?utf-8?B?M09pZjdNQnk1YmlrWXdNU2pKUFZFOXljenQyaFRXQ2piTU9sRTlyVlF1T2pG?=
 =?utf-8?B?VHJnNnh2eXhMWTZwOU50MUtyWTFWdnk5cmJNVWxmeFZpaHBURHFHUEExaCt3?=
 =?utf-8?B?dUNRbWY4NzNkcDFxOHZsOTJvTHNkSDRyV3R4SDNZWnVCUWxZL2h6ZXZHV29V?=
 =?utf-8?B?N09GWE1PNCtQeUZIVUx2VDdROTh2ZDNDdDRGQ2hkWG1jRHEraGpSeXF4dmxG?=
 =?utf-8?B?eHlTSXZKaitTaW81aXRSdjZ5Yjc5QjVMWXp6SlhJa2hKYm9DWE5kaW1sTkFz?=
 =?utf-8?B?VC9qUWR2QnkwN2x0aWhsVHhrc1NFQktHRVJ4eW5FeFF1M3I1YzJLZTJFb01l?=
 =?utf-8?B?K0M2Q3NYUHVIRHArN0ErK0VLMmVZdFZTOVk0d0dCcHhad29IVC83TnFQbmRM?=
 =?utf-8?B?UlJFQ0dsZ2F0OVlGQXVxZHBTVUFoc3R6aWFVUTd4V05DYjNmTU95WUJoeTVq?=
 =?utf-8?B?aGhlb25HYTlpMlBkaVJCQnBydXgwSE51YXJvelhaVThrWmtmQm5BT1IyVS80?=
 =?utf-8?B?WFNjaVNUcVN2ZE9icDNTb25HaXpHR2ZhOXE2Z2t5L1F6eVlvVEtKc1JmSHpY?=
 =?utf-8?B?aUEwSkVvU2hta0I5cGNNbHdPL01lT0ErUVo0SEx6QWRpR1RyMXUzeWpQMkYw?=
 =?utf-8?B?MENsVVp5NEpZVUxvRmdBL3huZkhnL1FzQ1Q5aktFTk5LcGNHd1c3L25nL2hP?=
 =?utf-8?B?T3RqM2lrMlhtLzh3WmdYUyswTFBad3BjSUJiNjMvUnNKNW9NYU95SjFZRTlP?=
 =?utf-8?B?ZVJleUJZajZLNXRQKzIvN3hZWlZOc3RVdHhJKzFsMmZYVEhnbU1zSlREQ0No?=
 =?utf-8?B?ZmZpbkpqZFZsb2libHc5c0licE9kbHZQaWI0OVJnZFJwRjhHeCtjV002eHFy?=
 =?utf-8?B?RHlMdUVGeUNzdUxnMTU5d2YycFZ1eDhtY3A4VEZIWnRhNndSV1c1QldIWjJj?=
 =?utf-8?B?MFZDK05WcWRwb0xiVVIrdEpVZ2NmdFEzUElHeDl6UWRBWjU0UlU3aW1Hdlcx?=
 =?utf-8?B?ejFLeW1uVjJkSEJnNU5hVFRTeVU5SzJZenRNZGZ2VjNtZkd4N0FaSDBpWndY?=
 =?utf-8?B?NHpHcEdXbnd3Z2tjRVBha3JuaXR6YTcxeEFiQjdwYW4xckIwb2pGb2ZWSFZ3?=
 =?utf-8?B?WWRubzNuTVhjc2REM1hCUXVvU0lZbmFBc0ZMVVpDa3N5Q0hEOGZBbnNzQTl5?=
 =?utf-8?B?akNucFJMbUdlT0x6RkhINk5YOWNYcjYwdFg1b3FtZCt2dkRLbU9CVy9VMHFw?=
 =?utf-8?B?SUxSajJObHdSejZMamVhY0lwNjJTdXpJbzMxMkljMXFQL1pWUHIzaEJRclpN?=
 =?utf-8?B?WVdQS080VkNpM2NqTVMycWtVQlBPOXBsTCthaDZUUkN3VWtjRlhyb0tTOXBC?=
 =?utf-8?B?cjVuUmdzTWtrS1BRVzhBSm9xcndTV08wUVJSS1p1dWZNNlJDMGxpYXBsWVRs?=
 =?utf-8?B?Skdrdlp0bVlJWEpVaFhPOXNTR2JtODZCQUVqUW9DVm55WW05QUVYemQyQm1I?=
 =?utf-8?B?Ui9nZHNZcFFEOFJoN0VYQ2ZWcjQyN1czd1VwQ2llK3FpVjdGSE5LMXhPelQr?=
 =?utf-8?B?UFRMelZoaGxDcWY0QjBobHlVRG42NE15OGdIR0Q3dU1MWEVqZERsZGc5K0pV?=
 =?utf-8?B?WGcyNUxRajZ1aVgrQmE0RFhwYnZ3UXJIWlgxYVlyUVo2b05HRm4xaUZJWk4w?=
 =?utf-8?B?bVU4Y1kxZzBBPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c7bec5-53a1-4f47-840d-08df34137564
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5895.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:17:09.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7228

On Tue, 27 Oct 2026 Ilpo J=C3=A4rvinen wrote:
> On Sat, 24 Oct 2026, Shuwen Bao wrote:
>=20
> Hi,
>=20
> It certainly sounds like a similar problem. I'm not sure if the code
> related to omen_timed_thermal_profile_boards is hooked though with
> this board because it requires is_omen_thermal_profile() returning
> true.
>=20
> Some other drivers do profile keepalive by writing the same profile
> periodically if nothing has changed the profile for a while, that
> would seem easier/more generic solution than finding timer offset the
> current solution uses.
>=20
> If you need to change something it would be nice to generalize this
> so that the keepalive is not bound to a particular submodel category.
> The driver is slowly moving towards that for all models so that we'd
> have only one central dmi matching table where the struct would hold
> all necessary info/quirk details.
>=20
> > @Ilpo, since commit 2cd10a35f3f0 ("platform/x86: hp-wmi: add support
> > for OMEN 16-am2xxx boards") is already in review-ilpo-next, would
> > you prefer to revert it for now until I figure out a proper
> > solution, or should we keep it as-is while I investigate?
>=20
> I think I'll keep the change as it still works to an extent so it
> seems better than nothing.

Hi Ilpo, Krishna,

Thank you for the guidance. I'll look into generalizing the keepalive=20
mechanism as suggested.
In the meantime, I have observed a new symptom regarding this behavior:=20
if no heavy load is applied to the system, the ~5000MHz boost clock=20
(which only occurs under performance mode) can still be observed even=20
after several hours.
It is currently still unclear whether this automatic reversion under=20
load is being enforced directly by the EC firmware or handled somewhere=20
within hp_wmi.c. I will continue investigating to determine the root=20
cause.

Best regards,
Shwen Bao




