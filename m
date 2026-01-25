Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011038.outbound.protection.outlook.com [52.103.43.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02151F131A;
	Sun, 25 Jan 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348560; cv=fail; b=o/b37uuv3fjEBZL4CXVY/mjcWwwNJePUVBoypGYnKf6Iu8l2Nv6C2FnTVSxrnU4T6Zg5y7/kD5NvtDQAyuaVVEnJn6r0wgcLpXYIKxs1Eaoa/C7lAvb0IhMJ8tvF15sjs1fR1tIJsOVLq3v6culG5FZUWBDnToBZN7dJ/32Q8Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348560; c=relaxed/simple;
	bh=kAYVDqcbSDKA5t0AJ3+twI0EfcWk6vyUxYPvtIaQXck=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=XOAUnNOT9roxYMHSTbMrp7/DaFIzRsTvXvK9mF7FkZbpKYK/s3xszT8sH3n2F8USTCyYnOyq+0z3qGWssd9o/u/hEHSz6uZdoAjJuobqvdajP7XLIjecBvPXdIQBJtJRuO9/C0ZwZAdxb1Vaf7AObsnjRa2L6HuNvRxq3DA0f2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mi6Mf767; arc=fail smtp.client-ip=52.103.43.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mi6Mf767"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHh8BbhhDuVB3cAjGPNTUuGT2dFaEySpNkQG4DZlTo+Nn78bMwSFlQUCMWjt0JO89RyjqrOcEhxmiHU4lpjR0om0DVUehcXvoc05HllvwNnQT2vN9xOquT3pgv2CDwkEwncG4UwGeevdhH1SIHp2RWFZdk0kIfxTZzzxS+dhkQ3wCWkR1w5LMY/n/Z87Y2eOzPczG0M6s7EOeDnE+v4C9Fy4hkXdQ2NVt4sd+IyAjaD2kMggsuLQJN3vfH3DeEqU0WvA8fBtA1Kl2dQBgoFHMueLFLIMLSiUIiRmVIbrPu3jp/jeXw+clPHlSXctXl8jHXZk3ye39PRvUqgrnbVBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKfkis1JsWJ5vZ0hFkSTFvNZ+81jL1tMPVxkOnVKg28=;
 b=K+obQkaYIsVKUhVPE/28LYQN4LRbG5cNlBZ1IxD32c+8tjlg/DU+nl/jmd0fJNqKQIgelZBIex/CtnmzeyevysrRNFwOMrTNWSVjyo5GHvZOoUoJNSx3m99QKMSp9xHFMoqLKLqH9jxUm5m201EJnPKNEkxGud2c2PCsbVZ2p1734WCIHot7jrvPdSsh/kbIJtTENm5nc01kcuVzXfioUcuEzrqdilFjMug4yGIOb8O/IAVmZ/ktyHsXynaNf59P6kqWgKdlm5fvZSBxblYainCE599VtaYxvWwP4fKC16F1HmOKm9N5m3iBWMJOVknLhs1hKCto2FUKPZMDrcgLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKfkis1JsWJ5vZ0hFkSTFvNZ+81jL1tMPVxkOnVKg28=;
 b=mi6Mf7678wf2u+wXy8Ca6Hby/HtYCcg/GFMetyaOVTXflnzz6ef6SDp8ttrcQsd/BQ3uypydJ27H6i3b/N8xo2f383desxthDroDI0FuHB4/uO1Wa0GemhwbSD7rSa96i5TNHKMWdk8n6cWlY1MYuvgAFTo7hdrqP75h+KqsggwQlLmEohS4X/V4BG4edp6KZ125tvJvR+TxesfdiNCX1GTC2KE/mYJlqM4lVwrwDggvfKEvNbsCHS9AFGfPVLR38sf67ad9jUXiTWZMBSfme3K/atQe0Akmn5VBKIUsB4r/XWYgZ72c1+qQHDKD6NF57ea18OWwozy21pzNWLU5Mg==
Received: from TYCPR01MB6851.jpnprd01.prod.outlook.com (2603:1096:400:b6::5)
 by TYWPR01MB10291.jpnprd01.prod.outlook.com (2603:1096:400:1e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Sun, 25 Jan
 2026 13:42:36 +0000
Received: from TYCPR01MB6851.jpnprd01.prod.outlook.com
 ([fe80::b4ac:4d8e:c794:940d]) by TYCPR01MB6851.jpnprd01.prod.outlook.com
 ([fe80::b4ac:4d8e:c794:940d%5]) with mapi id 15.20.9542.010; Sun, 25 Jan 2026
 13:42:36 +0000
From: Jesse Guo <JesseGuoTech@outlook.com>
Date: Sun, 25 Jan 2026 21:42:28 +0800
Subject: [PATCH] platform/x86: redmi-wmi: Add more hotkey mappings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <TYCPR01MB685170EB124F5AAC3DF736C7D192A@TYCPR01MB6851.jpnprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MOwqAMBAFryJbuxCDBvEqYhHNUxfxQyJ+EO9us
 JhiipmHArwgUJU85HFIkHWJkqUJdaNdBrC46KSVNirTBXu4WfiMjOs+4WbrHBtjbF/mrQJaiun
 m0cv1b+vmfT9ZtJYcZgAAAA==
X-Change-ID: 20260125-redmi-wmi-hotkey-add-666af84b0eeb
To: Gladyshev Ilya <foxido@foxido.dev>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesse Guo <JesseGuoTech@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=JesseGuoTech@outlook.com; h=from:subject:message-id;
 bh=kAYVDqcbSDKA5t0AJ3+twI0EfcWk6vyUxYPvtIaQXck=;
 b=owGbwMvMwCWWnjPtZGqx9GPG02pJDJllskfeJu04enL99icVZ3JepSb1MRx1bdl4Yotjy6ZV+
 5wEpI+f6ShlYRDjYpAVU2SxkX5slcgVka5xZVU/zBxWJpAhDFycAjCRN68YGX4umD5X7//sPj2z
 X6vEH8lzv3C0Tp/pUurNnXFPcst2l6sM/xSubc/tWiB/73hZU7upsmTEYb6K3ZPmCvEE66/5WPk
 wlwEA
X-Developer-Key: i=JesseGuoTech@outlook.com; a=openpgp;
 fpr=99FD0EC891CAE80A011478EB24068CA03442C4B1
X-ClientProxiedBy: BM1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::36) To TYCPR01MB6851.jpnprd01.prod.outlook.com
 (2603:1096:400:b6::5)
X-Microsoft-Original-Message-ID:
 <20260125-redmi-wmi-hotkey-add-v1-1-d3e28568dd75@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB6851:EE_|TYWPR01MB10291:EE_
X-MS-Office365-Filtering-Correlation-Id: 5075ac80-1640-4a6a-0ec1-08de5c17992a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|51005399006|8060799015|23021999003|19110799012|461199028|15080799012|5062599005|6090799003|19061999003|3412199025|440099028|40105399003|3430499032|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0dCWTc2Zjg3bStGeDNWMFR2RWY2L010MzU2anBBR1VHZm9hQ3h6bThEZGtm?=
 =?utf-8?B?VUpsbHhsRjNXSFo3djhDaFJPWmJLTlRHK21Qd1ArV1pkNVFWUHdiVElKdlN4?=
 =?utf-8?B?ditBN2drUU0xVC9pakh3cEpKTWNocFBKSUFmK05qN2FpZGdldjEvVUhvbWhG?=
 =?utf-8?B?dVNla1NGdURIMkxmM2lXM29VdEp0aS9iUGxEQUtyS2pYbi9kUUlXYUlUMGtE?=
 =?utf-8?B?K0FQM2FEbWQ5VTVZbHZKRjZ6ZVg4d1FIaHJPbFJPaDRudVpMaDFzYUNqQzZr?=
 =?utf-8?B?bVM3eWFZR29GcnFQT09lQ0MwV1hNeERnUU1iQ2FMWjJIZzlKWEIvaytXRUl6?=
 =?utf-8?B?cHlGS2NkQ2dkMnBWZDZVUkpHb1Jiak94MjBJRVFRNUNtR3Z1V29FMjVlQVVp?=
 =?utf-8?B?MWdaTjZUVC9mbGtnTzVoeXRXNW9qMGF2aEk2U01DMXJLTngyZG94UHliN1RF?=
 =?utf-8?B?b0orQmJTbG1hNnNGRmpFL004aThmRVZZeDQxMnFkMk9WdnptMm41NUpmOE5F?=
 =?utf-8?B?REUrN3FJVDBqUVlnZ3FFTEcrWGhqUnUzRndHdldlMFNNeU5McU9RRFgxZEJ6?=
 =?utf-8?B?ZWlqanRvU2c1VEplcnhYbUFiSVhMMFpObjkxR2FGTlJFcGViNnFneStMYXdz?=
 =?utf-8?B?K2RXWmFzSThEdVRibURFenNVRE40cUdkZGxiVGltVTVoV3lzM1NTOUM0MGx0?=
 =?utf-8?B?MjZJbS9PWVpXbk0zUFNXTFVqckkrR0lpYTFlUlkreXdxR01JMjE3NHQwQkNs?=
 =?utf-8?B?RUJ1clZEajVIRGlvU2dPVDhzVTAwMlNTOURHZzJaSGhYKzVtS3U4UWhVYStq?=
 =?utf-8?B?Z2ZybytlVWt6bThZZWFmU1ZndWFvSDlwZXY2M3ROTVlHamVzdFdVYnhjblBa?=
 =?utf-8?B?eGxybnp6U2liMnlpZXlLY2JFYzZBNEJaNExhV1NYdS9OTUZ3SzdBN1JEWHJu?=
 =?utf-8?B?cy81eEZWT2xSajZkT1RLTnZCRkxoWUo2RURISGdMd3ExUDNTaVdFYXlYWEVW?=
 =?utf-8?B?enhUQ0JYUHp1Q2E1a3ZnMjQvTnNsQ1pVR2VwOFZETk9DL3RoK1RWTjRFaVNV?=
 =?utf-8?B?ZDh4TnRJVTQ1azRhUERxMGNTcnQwRUFMUGJpOUNPVkc3bU5HNExJQjBFd1A5?=
 =?utf-8?B?WHpIcG1mc0ZTQzhoMWtTWTYxU0kyT3pxaWdrcWF2cWJJQlRkdWVtcUNOZmQ4?=
 =?utf-8?B?THNzQkZhck9EOWRrSUVrWW5JcEN6R1pEWG85UkVPKzAwQ3dzSzJFWm0yd3NX?=
 =?utf-8?B?NWZmTlBlWWY0Q3ZsOVdlYjVHT2kzcVRYeTdvUEd3czBjQzQ4emROVEI5MGtV?=
 =?utf-8?B?Y21ORVp1WnRqWUkrTlRHNzgwVmZRdmRPay9SYk9BR1ZubDlGcDNzT3FRTUFO?=
 =?utf-8?B?My8xVjhrMmxCRUl0djJ0RHkxRks1Uk1oWEMwaHFIcU15aVBoYkYyZ2VSMUda?=
 =?utf-8?B?ajNqZVRuYytCekw1RkpRNGtxcGR3TFZrWFFnR0ltWFAzWVVtdFkrTDJVb3hE?=
 =?utf-8?B?WjVMVkIvY1JFbTUvcjRZTGp6Z3loQXc3YzM3TDBzeElqeW1GbXBUVWQ0eGRu?=
 =?utf-8?B?dnVoQjhRSnhDWWZ1eFI2ZEVxeUJCcXV0UXJSNE4xSzEreFV1YmpJTXY3U0dl?=
 =?utf-8?B?cXpoT09lRUdLK0I4anIxcFdSczhjcTVFby9KVHZaek9rUWRLU2h2RUFjU2Rp?=
 =?utf-8?B?MVRPNE9nekhUc3Jla3o5dXAvTjI3M1NLd0p3em1naVF1VXhCRjErcVc5ZHdI?=
 =?utf-8?Q?1H+S8jNrIHA3O8eVnw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk9HR3JsVmRmaXF1djhBNzZKbURBRWtYSW5WSFQxMHlybHV3SnJ1Y3J2Qzls?=
 =?utf-8?B?WWxveGFWVTYyR1hid01tNWFSM294bC9FLzFmQTd3NlM4bGdFZCtpN21kbXha?=
 =?utf-8?B?YTRobHNLZW9MRGVCejd0K0hHSFhhT013WW9ycTRDN2NIUkQrS0hSUnlBaXBN?=
 =?utf-8?B?MmMyZ1dWMlgxK3NaMDlWV1dNQ1BKZTJkUEZGWGFIVlNMcFY1d2VsdGRjSVNK?=
 =?utf-8?B?THNuY2p0UjlhelQ2T0NyUkJ3T3drSDRrNy9ZbldBVG1pWWlMR1BaMHZwVFBt?=
 =?utf-8?B?eGtFN3RtM1dVZW10NHpXNVhQU1RoaXVTUEU0VmQ1Nitwb1kvQXFUSm9rNEl6?=
 =?utf-8?B?bjRKRWptUWppZGRVNmt3d3F0ZzM3Z3dCTXlFMDZSaStrOFBicWlLYWVzcmFz?=
 =?utf-8?B?RTM3aXg3RHY1RW1zMzZXRFRSY2V5dGZiMThLc25kaVZvMHpIbHFlVWRoQWVk?=
 =?utf-8?B?dEM2MGpUL0FZbmFhWkhJbklOWGJWYXpQQWJ4dG1iZ2FkVmIzczBLeE1KQnJY?=
 =?utf-8?B?MHgzVnhRZVhpTVVTeExpbTBkeVhXSFVRNGJXZHZXRkR6Rm1EWEFMUzhzSHZk?=
 =?utf-8?B?eWsxamZmTnhZVVFITk9nOExRUWZZb3pPbVRXdkFRazJHSjRnOTRRTFNEK1g1?=
 =?utf-8?B?SXpPdDQramV2VFovNWlDZTM4NTNIZHFtcDY4clpGWGZVZzFySWxTeFVSbHEy?=
 =?utf-8?B?WHVZckgvS1U1c2pzNDFnZ2lFMEViaTQ1Tnp1dUlrMFFXeEFEU3dvNUlRa2RB?=
 =?utf-8?B?QzVhdHZzSmdBTkNmTDYxVkgxRHFOU1dNelZPWmJZNHZjZmkvNSt2TUFMVENB?=
 =?utf-8?B?UzFaL0tYYjZ6YXo3WmI2YWx5V001bE0xUXljc1hDR3gxMG02WTBNVHkydUd0?=
 =?utf-8?B?elFmRnc1eUdPVTNSTFV6Wld4SERkdzdKU2ZlTmhqakZCYm1jUDZyRXZxRXFm?=
 =?utf-8?B?VjJxS0RzSWlYQmcyT09GYk5mdjd3THpDWTVxK3ZYTEdqRXRHdjcxb3hYaTZW?=
 =?utf-8?B?WEtxemJuaHdwRlE0WStmeXBqanVhY3ZydmhTYzJzeVlEU2luSk9ZTG1tTEVk?=
 =?utf-8?B?bUNmRkRDUFE1U3QrdjBLSHJySzhOVlpERUhvbU80YTh3eXR2bmpBTVNTZFJk?=
 =?utf-8?B?cDFRczZzUTVIWFB3YzY3cjI3YjV4OTl3TDdUbTl1L0M3RCtrVUMrQU5PNWw0?=
 =?utf-8?B?Y0JoZk5ucDByeWl4cnNlYVNwYWVmdHVOdjJVQkwvODR0V0krbUtBWkduVWlS?=
 =?utf-8?B?bmx0ZlRRa2xtSmFGd21RVE90SEU5dzY5amhYUzVGYUpsSDFGK2FBOXkxckpT?=
 =?utf-8?B?Znd4Z3poWUZsVURjTFVRdU4yUXJ0SkZqUElrYk0yZmNEeHR4YW1WSVBkR0I4?=
 =?utf-8?B?M3l2dG1RUjdiTGpwMUlDQVE2NkoyWGVidUMxS1JmeDM1eXFVdlBzUGpxKzk0?=
 =?utf-8?B?bTFqY3ZuaVdkRm5CYVdnamVaNytaS3FMQW1kUTVCMVN2eENoalZHeEZSL0Vw?=
 =?utf-8?B?eG9uR0pueVdYdDExZGdYa0tZN1I2aUlJc1VydUk2T20zVzVJU3dUK2haR2tD?=
 =?utf-8?B?QTNjRWJzbUpkMHZPSkVaWlY3d01DZUFQZjcyMFdjSThHdkJ2b1p2THBzM21k?=
 =?utf-8?B?SzVKcGdkVWVKcng3cGEvU1pveTBMOTdpejBkNURtSyttaU1IdWhXSDMra0dh?=
 =?utf-8?B?dUlJTmhTb3o1YkVuWGJ6TnF4cHh1amRERFZFQTlYVWl4aVVyYUJMWGhFQUVi?=
 =?utf-8?B?TjlMMGIvWDk2R3AybjJXVmI4WjNzUEFtTk5pcDRPNDNPYmorYlVVMjVwZlF1?=
 =?utf-8?B?ZlJDZUIzaXhEUnloT1RjenhpUjdCNXNHTytXVmYzbHVxbTVQbjlaM3pDRVhW?=
 =?utf-8?B?VGFmaUpzajlEVXhxVkt1K2ZmZi9TRGNMaXdzQ090dzcyRnVETWltNXVIV3pp?=
 =?utf-8?Q?Wm+BDJols6i1WaLZcbupEWCjWR3Oncw/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5075ac80-1640-4a6a-0ec1-08de5c17992a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6851.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2026 13:42:36.1306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10291

This patch adds more Fn hotkeys (like Refresh rate toggle).
Additionally, remap the setup key from KEY_SETUP to KEY_CONFIG.
As KEY_CONFIG is supported by Desktop Environments for launching
system settings, whereas KEY_SETUP is often ignored by userspace.

Signed-off-by: Jesse Guo <JesseGuoTech@outlook.com>
---
 drivers/platform/x86/redmi-wmi.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
index 949236b93a321a943a9cb8b0528d730dbaa2cd6f..27e593aa64cac8a11e8fbace16ac76ca059180b3 100644
--- a/drivers/platform/x86/redmi-wmi.c
+++ b/drivers/platform/x86/redmi-wmi.c
@@ -20,7 +20,10 @@
 static const struct key_entry redmi_wmi_keymap[] = {
 	{KE_KEY, 0x00000201,	{KEY_SELECTIVE_SCREENSHOT}},
 	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
-	{KE_KEY, 0x00001b01,	{KEY_SETUP}},
+	{KE_KEY, 0x00001b01,	{KEY_CONFIG}},
+	{KE_KEY, 0x00011b01,	{KEY_CONFIG}},
+	{KE_KEY, 0x00010101,	{KEY_SWITCHVIDEOMODE}},
+	{KE_KEY, 0x00001a01,	{KEY_REFRESH_RATE_TOGGLE}},
 
 	/* AI button has code for each position */
 	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
@@ -32,6 +35,26 @@ static const struct key_entry redmi_wmi_keymap[] = {
 	{KE_IGNORE, 0x00050501, {}},
 	{KE_IGNORE, 0x000a0501, {}},
 
+	/* Xiaomi G Command Center */
+	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
+
+	/* OEM preset power mode */
+	{KE_IGNORE, 0x00011601, {}},
+	{KE_IGNORE, 0x00021601, {}},
+	{KE_IGNORE, 0x00031601, {}},
+	{KE_IGNORE, 0x00041601, {}},
+
+	/* Fn Lock state */
+	{KE_KEY, 0x00000701, {KEY_FN_ESC}},
+	{KE_KEY, 0x00010701, {KEY_FN_ESC}},
+
+	/* Fn+`/1/2/3/4 */
+	{KE_KEY, 0x00011101, {KEY_F13}},
+	{KE_KEY, 0x00011201, {KEY_F14}},
+	{KE_KEY, 0x00011301, {KEY_F15}},
+	{KE_KEY, 0x00011401, {KEY_F16}},
+	{KE_KEY, 0x00011501, {KEY_F17}},
+
 	{KE_END}
 };
 

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260125-redmi-wmi-hotkey-add-666af84b0eeb

Best regards,
-- 
Jesse Guo <JesseGuoTech@outlook.com>

