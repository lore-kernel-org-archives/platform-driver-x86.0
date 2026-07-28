Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012008.outbound.protection.outlook.com [52.103.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7BF3B71C1;
	Tue, 28 Jul 2026 18:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262201; cv=fail; b=EHiiNyNbv4KN03hQOMLf9ydRTU5U8xphNyC0oZzrZiS34t0gfJ68+fFdE1pSDHSjDgEjjwnxR1tgO6M6gDbgV4l7gfWYxAjzu5LLqPXUxkBxg5p7S8sTRMYcZxot9YDnijRJSOpz04Sk1ZFPyFluPzD+GsK3xott5PqM+ZTlkzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262201; c=relaxed/simple;
	bh=zwlg39AzYz1aG/BYywRTD/tCAq6NtYTbPHjTjw3bliI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nJNtR/GKTUgTiVho/hYe2vIbZi6eiC6iYO5So2b37eZczxdhlOJJdyUGa59iRFCNPbtrl0oWQgwRCzhTX8DHQsAfnbTgciM2ieAsrv2GhF9PHx9KL941xkmlMDHbn1Bm1aCgZCh5nv63KUeHF47lvN80H7YxGoYFbTwx7VKZodY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qn4kfzaI; arc=fail smtp.client-ip=52.103.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qn4kfzaI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxVAjTj1/ubkAnno2YPRGRzB6YDKKIXedFcbF//kyFp1MYLFANsy/PRvW6fwsstsTk6kmwM2eACklsYLSeQffce2r0MRgpVyBphEFro+mgiB9J9o0GdnXEtaXtXZQB9EXE0vwojn/pb4RAIdpptBUnmpnw99N1c8d3fo3wA7I3W7dOdSJqtnFUqIh4y14zjQDg0r8cLxR6W/ZP3vxU+82sUrdB+H/T+ThyGnwGVsmnLkQUuAePJjmNL8FD3s6kK0/5rXyoN8VGs2dwpg4AKQ9OQDgjpyEtOdl/T/11TYplD567dm6hOhTnnL82o7NGncfZ+8870zIjXpn/5LE2dCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwlg39AzYz1aG/BYywRTD/tCAq6NtYTbPHjTjw3bliI=;
 b=sPUZQso252VuYEYWfyyh5gKQ43vuzYfvCNK73f6Yr5VM5L4aNnho74awqrTKYeJ+ljOqcO2m9k+TXPG8dhKD2+yDaIYt1Pxdphh6pbgnXxP9XypULaos62siL/hoTeERcfFQuoMlmXzqOH1PdjzhecMFicGkyP0+5L3261zKLLhe3pPdwNx4dSsM9hgSp1cxACoN00D724RP1sh5BDxm4L3G5QjETWwE8DKKusGduIPyQvumFWRrmqBR8aQbqlscc6NV0KS4rUoLG/2ysk5lRO/uHXZpKUPSb57WGCzG4VDVmrAXfPw+Dgg+tRNi566RIu1Da9pe+qCOo7ZaSVgFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwlg39AzYz1aG/BYywRTD/tCAq6NtYTbPHjTjw3bliI=;
 b=qn4kfzaIRR0IhGrDZzx81VFjqtN2mH9jzqdKFLpmsBKGSBRYTZWDuwOrkgeY6rItCEB868/KdyjM5Oh01jEiG5gCm/BOQ30y+QZqzeyelLpiCuMwvZ/kE6iycdNoCjnxOrzNKdvYk+aLK9pHGRXyQeLQyCrGkPoX4GB0PW5qlgm2ZdzZWfnUHENl1fR5W7pJu0NsK7s9AhhbWzr8wcd6fMXip5jofSiFerWDu8dS7uvLn7+xax3mAehQv/MhpCQ3St3nveseGLE66MHQe2/F0lo7mkacwyQXNsMu1YcQwrRQ419w+HSWjwP/cbuU2xO05BROqWPWRQnlttA0ZoEeFQ==
Received: from SY7PR01MB10809.ausprd01.prod.outlook.com (2603:10c6:10:334::8)
 by MEYPR01MB6613.ausprd01.prod.outlook.com (2603:10c6:220:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 18:09:55 +0000
Received: from SY7PR01MB10809.ausprd01.prod.outlook.com
 ([fe80::5ed:40ff:547d:2ada]) by SY7PR01MB10809.ausprd01.prod.outlook.com
 ([fe80::5ed:40ff:547d:2ada%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 18:09:55 +0000
From: =?utf-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mingyou
 Chen <qby140326@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	<hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, Nabil Danial <nabildanial.93@gmail.com>,
	=?utf-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>
Subject: [RESEND PATCH 1/5] platform/x86: bitland-mifs-wmi: validate WMAA
 status, never abort suspend
Thread-Topic: [RESEND PATCH 1/5] platform/x86: bitland-mifs-wmi: validate WMAA
 status, never abort suspend
Thread-Index: AQHdHrxKtjnUmXw1RUiufNX1Oq6pyQ==
Date: Tue, 28 Jul 2026 18:09:55 +0000
Message-ID: <20260728180944.51356-2-wolf109909@outlook.com>
References: <20260728180944.51356-1-wolf109909@outlook.com>
In-Reply-To: <20260728180944.51356-1-wolf109909@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY7PR01MB10809:EE_|MEYPR01MB6613:EE_
x-ms-office365-filtering-correlation-id: 18774c1d-ba46-4274-e777-08deecd36d60
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|8022599003|38102599003|25031999004|15080799012|31061999003|41001999006|8062599012|8060799015|19110799012|24021099003|3412199025|440099028|26104999009|102099032|3071699003|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXJkcVF3ZytEZWJiZGRxbDRMVVNOZk9QQTdJcnQrL2dXTnZnOEt0Q2t1cC84?=
 =?utf-8?B?bW9iYkwyc3ZwZHF6ODdOdXZTU2g4L0loQUlHK3RTMmo1TlFiOW5jUjArQU1U?=
 =?utf-8?B?b0RqNU4zVS9ua243ZGF5RGxlR2JUdm1sS1l1NWEwU2hNclVOMjJDbDlpNy9r?=
 =?utf-8?B?Y3BGUHRtUGVKRVIvM0JLVnN1SW04QjFEU3J6UHFKRTBRODkzTWFtajhRNCtU?=
 =?utf-8?B?aHFhR0ROTkdsMUhaYjg2dkloMU5tS2NKUUtpQjdlTUxCNW9WSHd3aWRkYko2?=
 =?utf-8?B?TG0ram8wS3g5bjE1Z1RjSy9XWkExUGpmSFpYbzBDUkxLOVpjOWRvZ1V0SERC?=
 =?utf-8?B?Q3gzL2VlQng2TEs5Y2xrdWs2MHExR1dQT2k4UytKRkpiRzhoMEUzSkpXeHJV?=
 =?utf-8?B?TTBoSU94THYxYWl0WklNUXFjWFhFTFREb3dSZDVLYk4zUUpaSnd3OUphcFg0?=
 =?utf-8?B?bVAxZVNYU2wxa1YveHBnMjBEdGdkSTNMMmJrRThNRmtsWG1ubThUb1h5dDh5?=
 =?utf-8?B?Z2NuQnlmdFAxT3crUkZxM3I5bWZqZmRFVlp2bW4wMHFWdGdVZ2EzbndTUHBy?=
 =?utf-8?B?VUh2dnA2dy96RUhIN1dCUURUNEJDYjBpY2Z4R2E4SXdxaXdvR1JsM0tscGdH?=
 =?utf-8?B?R0lKUjY0cUN4VDFmWW84T0dUZUl5WWVEUXFubGxvcVRSSzFubWxMbHJBVUVX?=
 =?utf-8?B?K0JMYjEwZGJZU24zVU0wRS9NU2FncjFyK2Q2ZUtyN0I4ZzY2U01tRU56OTBW?=
 =?utf-8?B?c2VZd3ZOc0IzeUJKdHdnRUtRY0E0Snh3ODVrQ0V3VEI5TVpWV3RFNUJiY2JI?=
 =?utf-8?B?M3FTcUVqMGczNjI3RUg0cXRyQ0pyZ3BPSHk5aTV3cDZpY0tDenN3bUc4Z1pO?=
 =?utf-8?B?WTA2RSswYWd5UXVQb095a3FJRzhqd0RiaHZTR3h6bEhZa29NUEUyczBSK2k3?=
 =?utf-8?B?dU5UL1pRTEZvWGZKeTJaTC84eWE5c1ViUVZRYTlCN0Zya05MaHR6Z1pNUEhU?=
 =?utf-8?B?VUp1dTJmeThlL0JmWmhoa1BNenVIU0JWQXVQd1VvcmJkZnpYbFBoRnIyZGlT?=
 =?utf-8?B?UHYxdmhyUDJSSEhYaXB1RkZ2ODloNVZheHFtU3VYamN4YlR0Rm5Ob0duWWVU?=
 =?utf-8?B?WGMxeVFWTzAwaVVvbWMxZUk1cU9RS3VXMHNDNHFydytNV1cwZmxLQTdRVjY2?=
 =?utf-8?B?Z2ZkN1lvQ3R5WndqTzZIYjQvWVh6cFVJNWRPNWh6WUdaaFNrQkVtRW5TdHcr?=
 =?utf-8?B?L25qYW5uWFdxdVJqemwwbkpnQnJJUWpTcTVveG5Xc1RLRnBjS0RYUkxqbGJ2?=
 =?utf-8?B?ajJSbUNRSExFMk55NDJzRWd0SzBlZ0RTSkROYVQ2UzhxOXJnRGpaK0VFbCtk?=
 =?utf-8?B?Z2FvTzdLc0drMEVHaFB6NVF1cVpuR293c1k4WWVjQk1UclA0aE5KQm9xZWNP?=
 =?utf-8?Q?SKaa8qEI?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amxMV1IzMFN5Z1NpQmk1b3RVdUZmc1Z1V1JuM2ZTYW92UHFTRFpNNFFaZDZt?=
 =?utf-8?B?cHBlTURiTkhIZlpmT1BhejFBdTlHVERzYTZrM1ZEMXBxaWVVNnRQbnJQakFE?=
 =?utf-8?B?QmU1bWxNU0hwMStwVE5QTmNycE94S3lWa1JCMHlMQjhkNDgvcU9raDdxeUZC?=
 =?utf-8?B?RklsdUV4TFRzdUtmQjRhaVdETzZLUFhaS3NYaUxrSjFnL0VsN0N5NmlEV0wr?=
 =?utf-8?B?c3ppRURXbDRZMDdTdGdMdHN3dzQ2SE9KRVd6bkdxb0lCSGsyaWRmSUpTU1ZT?=
 =?utf-8?B?TThENTExRXMxaXV4Q3dZekxxM2lvY1lqSldQTlorVUJ1SHVrcHZHZnBocE54?=
 =?utf-8?B?RWZxdERZdjNWdTZhZ2ZnTGk1OUR5cDFLNm5iVGwrMTd6RC9jYW1rVDVFWGdp?=
 =?utf-8?B?RmxzdnF3dEMxUm42U0UzVllSWURtMFpYbkNXWk9FVnBxRktJYUhzeExTWUFp?=
 =?utf-8?B?UStNTStEaDJNZjZQWjlQVEw2aFo3NTBCenhZWWEwL2JFc1RGQjFWT2RVQmgx?=
 =?utf-8?B?MWlMQ3NnOVdBdmVyRHd1amdsMVFmakRlYmI2Zk9Hc0MwZkc5UGZhaXM0NlRk?=
 =?utf-8?B?UTlZbDlGUVo5Tm5oY2djSml4eFRDOU5ONGtCUHJkT2lMZ2VhTU8rMEhaVStF?=
 =?utf-8?B?MzZqeU9aOFVzdVJBSlF3b24vMkZDNXB3SXZaV0dSdWNuYWZKbk9TNGs1K05H?=
 =?utf-8?B?Wi9LcHZRZFdleGpVK2ZXL3A1ZkpSaG9ISEMyTm9URm1IcFdJcjFQeFdBbmtR?=
 =?utf-8?B?STZtalA3ZWZlS29rNGpmUXRrMnRtUEFtVE02RGJDUVJkWUdUbHRyNEdFWkJL?=
 =?utf-8?B?K3VrK3EzVlFSeFRRWThXazExeGVzUW1oNWlXWTROd293SFprTkZCQmhQN1BD?=
 =?utf-8?B?Mjk1NlNlVmtmZ2NlOGE4Um5kc0p1Q0pCUlBNck9wREZDMlN4eTdwbEZiblpZ?=
 =?utf-8?B?TkVvZ0hoMFFlaExDSktzV2pOdkxhSHhFbEtINFY1SWxaZ1BJMmdYTk9HT2Nv?=
 =?utf-8?B?R3ZpZXZPbUVxTTluell5SWllZkZRQm94ZXg0RWJhZEd1Z1NCRFk2YkppN1Zk?=
 =?utf-8?B?b1R1VXBZNkpueWJ5MEFxUVlkWFVPNGpPVjNvcG05QnM1ZE9xUEFBdCtRaWlL?=
 =?utf-8?B?T3FCZGZoNGFxcEVBNWlUY3I0K0VPdmVQWnJKd1hVMmFvbnJKWnplMlgwcTQ5?=
 =?utf-8?B?aERiQisyc2JQZFNrV0lUVU9MRXJCYW5NTTdmY3ljN1RzbDZvcEV5eWxnSDE1?=
 =?utf-8?B?Y1o1Zi81anNLU2FYS3pRemtqSGY1am84VHRacksvaXVndXRxMWtrNnF1ZkIz?=
 =?utf-8?B?MXRST2JrNHM1QVhxdDVpVHJMRDIyL3prbVJSSEo2cjBkV3BEK1ZndmJHVHVh?=
 =?utf-8?B?NnEzZS9WN1BOK2drUHM4VmJBTUFNNkd3THVBWHozQ2VCOTZXVkZQR3l6VkFR?=
 =?utf-8?B?R3krS1BZZ1p2STFLeFprakxMMmhVRW5Xb2M5TjVHZWZiY3NEdVpMZnVaVlF0?=
 =?utf-8?B?cjBzSWxJdDdGenduWktrZTViSGdnY3J2bkw5QktXRHhuRXc5enVLVnMrRGJK?=
 =?utf-8?B?OHdTby8rWmpZNk5sbzZUYkc5cy9lRlZ2S2dzYkd6MGJhU2tveWFSSWRDRmFx?=
 =?utf-8?B?dFBFTDNJaXU4NUdja2VKb2lyZ05VSFhzNGQ4M3QwZXJJWDVQbk4vODF2bHFK?=
 =?utf-8?B?R0lRWHYwZVRiSXBPWVJUU2ptVDRlS3l0cWNYLzYyaUxPYndlVUl4Yi9Nbmxp?=
 =?utf-8?B?U0VRSHpvR2FEUXhlQ01ia3I0RDJKaE5OYzgwWWdjU3ZNUysyalhEU2RCYko1?=
 =?utf-8?B?dU4zdHo3dHhraDlTbUdIUS9BT1JUWHp3VWhIUGcvSkpHdUltRjVkUVZkRDJ6?=
 =?utf-8?Q?EUdUXrpSdecQn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY7PR01MB10809.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 18774c1d-ba46-4274-e777-08deecd36d60
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 18:09:55.0306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB6613

VGhlIFdNQUEgZmlybXdhcmUgbWV0aG9kIHNpZ25hbHMgInVua25vd24vdW5zdXBwb3J0ZWQgZnVu
Y3Rpb24iIHdpdGgNCnRoZSBzdGF0dXMgd29yZCAweGUwMDAgaW4gdGhlIHJlcGx5LiBUaGUgZHJp
dmVyIG5ldmVyIGNoZWNrZWQgaXQsIHNvDQpjYWxscyB0byBmdW5jdGlvbnMgYSBnaXZlbiBmaXJt
d2FyZSByZXZpc2lvbiBkb2VzIG5vdCBpbXBsZW1lbnQNCnNpbGVudGx5IHJldHVybmVkIHplcm8t
ZmlsbGVkIGRhdGEgaW5zdGVhZCBvZiBmYWlsaW5nLg0KDQpXb3JzZSwgdGhlIHBsYXRmb3JtX3By
b2ZpbGUgc3VzcGVuZCBob29rIHByb3BhZ2F0ZWQgc3VjaCBlcnJvcnM6IG9uDQpmaXJtd2FyZSB3
aG9zZSBwZXJmLW1vZGUgcXVlcnkgcmV0dXJucyB2YWx1ZXMgbGFwdG9wX3Byb2ZpbGVfZ2V0KCkN
CmNhbm5vdCBtYXAgKGUuZy4gTUlGUyB2MiBmaXJtd2FyZSByZXBvcnRpbmcgcmF3IFFGQU4gY29k
ZXMsIHNlZW4gb24NClhpYW9taSBCb29rIFBybyAxNCAyMDI2IGFuZCBSRURNSSBCb29rIFBybyAx
NCAyMDI1KSwgZXZlcnkgc3VzcGVuZA0KYXR0ZW1wdCBkaWVkIHdpdGg6DQoNCiAgZHBtX3J1bl9j
YWxsYmFjaygpOiBiaXRsYW5kX21pZnNfd21pX3N1c3BlbmQgcmV0dXJucyAtMjINCiAgUE06IFNv
bWUgZGV2aWNlcyBmYWlsZWQgdG8gc3VzcGVuZCwgb3IgZWFybHkgd2FrZSBldmVudCBkZXRlY3Rl
ZA0KDQpSZXR1cm4gLUVPUE5PVFNVUFAgd2hlbiB0aGUgZmlybXdhcmUgcmVwb3J0cyB0aGUgZXJy
b3Igc3RhdHVzIHdvcmQsDQphbmQgbWFrZSB0aGUgc3VzcGVuZC9yZXN1bWUgaG9va3MgZmF1bHQt
dG9sZXJhbnQ6IHNraXAgc2F2aW5nIGFuZA0KcmVzdG9yaW5nIHRoZSBwcm9maWxlIHdoZW4gdGhl
IHF1ZXJ5IGZhaWxzIGluc3RlYWQgb2YgYWJvcnRpbmcgdGhlDQp3aG9sZSBzeXN0ZW0gc2xlZXAu
DQoNClN0YXR1cyB3b3JkIHNlbWFudGljcyB2ZXJpZmllZCBhZ2FpbnN0IHRoZSBsYXB0b3AncyBT
U0RUIFdNQUEgbWV0aG9kDQooU0dFUj0weDgwMDAgb24gc3VjY2VzcywgMHhlMDAwIGluIHRoZSBE
ZWZhdWx0IGJyYW5jaCkuDQoNClNpZ25lZC1vZmYtYnk6IFl1bWluZyBTdW4gPHdvbGYxMDk5MDlA
b3V0bG9vay5jb20+DQotLS0NCiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9iaXRsYW5kLW1pZnMtd21p
LmMgfCAzMSArKysrKysrKysrKysrKysrKysrKystLS0tDQogMSBmaWxlIGNoYW5nZWQsIDI3IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRm
b3JtL3g4Ni9iaXRsYW5kLW1pZnMtd21pLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9iaXRsYW5k
LW1pZnMtd21pLmMNCmluZGV4IDNhMzczMTg0Li4xMjQyNmQxMSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYw0KKysrIGIvZHJpdmVycy9wbGF0Zm9y
bS94ODYvYml0bGFuZC1taWZzLXdtaS5jDQpAQCAtMTI5LDYgKzEyOSwxOCBAQCBzdHJ1Y3QgYml0
bGFuZF9taWZzX291dHB1dCB7DQogCXU4IGRhdGFbMjhdOw0KIH0gX19wYWNrZWQ7DQogDQorLyoN
CisgKiBUaGUgc3RhdHVzIHdvcmQgb2YgYSBXTUFBIHJlcGx5IGlzIGZvcm1lZCBieSB0aGUgZmly
c3QgdHdvIGJ5dGVzDQorICogKHJlc2VydmVkMSB8IG9wZXJhdGlvbiA8PCA4KS4gTUlGUyBmaXJt
d2FyZSBzaWduYWxzICJ1bmtub3duIG9yDQorICogdW5zdXBwb3J0ZWQgZnVuY3Rpb24iIHdpdGgg
MHhlMDAwIGFuZCBzdWNjZXNzIHdpdGggMHg4MDAwLg0KKyAqLw0KKyNkZWZpbmUgTUlGU19TVEFU
VVNfRVJST1IJMHhlMDAwDQorDQorc3RhdGljIHUxNiBtaWZzX3N0YXR1cyhjb25zdCBzdHJ1Y3Qg
Yml0bGFuZF9taWZzX291dHB1dCAqb3V0KQ0KK3sNCisJcmV0dXJuIG91dC0+cmVzZXJ2ZWQxIHwg
KG91dC0+b3BlcmF0aW9uIDw8IDgpOw0KK30NCisNCiBzdHJ1Y3QgYml0bGFuZF9taWZzX2V2ZW50
IHsNCiAJdTggZXZlbnRfdHlwZTsNCiAJdTggZXZlbnRfaWQ7DQpAQCAtMTU5LDYgKzE3MSw3IEBA
IHN0cnVjdCBiaXRsYW5kX21pZnNfd21pX2RhdGEgew0KIAlzdHJ1Y3QgZGV2aWNlICpod21vbl9k
ZXY7DQogCXN0cnVjdCBkZXZpY2UgKnBwX2RldjsNCiAJZW51bSBwbGF0Zm9ybV9wcm9maWxlX29w
dGlvbiBzYXZlZF9wcm9maWxlOw0KKwlib29sIHByb2ZpbGVfdmFsaWQ7DQogfTsNCiANCiBzdGF0
aWMgaW50IGJpdGxhbmRfbWlmc193bWlfY2FsbChzdHJ1Y3QgYml0bGFuZF9taWZzX3dtaV9kYXRh
ICpkYXRhLA0KQEAgLTE4MSw2ICsxOTQsOSBAQCBzdGF0aWMgaW50IGJpdGxhbmRfbWlmc193bWlf
Y2FsbChzdHJ1Y3QgYml0bGFuZF9taWZzX3dtaV9kYXRhICpkYXRhLA0KIAltZW1jcHkob3V0cHV0
LCBvdXRfYnVmLmRhdGEsIHNpemVvZigqb3V0cHV0KSk7DQogCWtmcmVlKG91dF9idWYuZGF0YSk7
DQogDQorCWlmIChtaWZzX3N0YXR1cyhvdXRwdXQpID09IE1JRlNfU1RBVFVTX0VSUk9SKQ0KKwkJ
cmV0dXJuIC1FT1BOT1RTVVBQOw0KKw0KIAlyZXR1cm4gMDsNCiB9DQogDQpAQCAtMjk4LDE3ICsz
MTQsMjEgQEAgc3RhdGljIGludCBiaXRsYW5kX21pZnNfd21pX3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KQ0KIHsNCiAJc3RydWN0IGJpdGxhbmRfbWlmc193bWlfZGF0YSAqZGF0YSA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KIAllbnVtIHBsYXRmb3JtX3Byb2ZpbGVfb3B0aW9uIHByb2ZpbGU7
DQotCWludCByZXQ7DQogDQogCS8qIFNraXAgZXZlbnQgZGV2aWNlICovDQogCWlmICghZGF0YS0+
cHBfZGV2KQ0KIAkJcmV0dXJuIDA7DQogDQotCXJldCA9IGxhcHRvcF9wcm9maWxlX2dldChkYXRh
LT5wcF9kZXYsICZwcm9maWxlKTsNCi0JaWYgKHJldCA9PSAwKQ0KKwkvKg0KKwkgKiBOZXZlciBh
Ym9ydCBzdXNwZW5kOiBzb21lIGZpcm13YXJlIHJldmlzaW9ucyBhbnN3ZXIgdGhlIHBlcmYtbW9k
ZQ0KKwkgKiBxdWVyeSB3aXRoIHZhbHVlcyB0aGlzIGRyaXZlciBjYW5ub3QgbWFwLCBvciBmYWls
IHRoZSBjYWxsDQorCSAqIGVudGlyZWx5IHdoaWxlIHRoZSBzeXN0ZW0gaXMgZ29pbmcgZG93bi4N
CisJICovDQorCWRhdGEtPnByb2ZpbGVfdmFsaWQgPSBsYXB0b3BfcHJvZmlsZV9nZXQoZGF0YS0+
cHBfZGV2LCAmcHJvZmlsZSkgPT0gMDsNCisJaWYgKGRhdGEtPnByb2ZpbGVfdmFsaWQpDQogCQlk
YXRhLT5zYXZlZF9wcm9maWxlID0gcHJvZmlsZTsNCiANCi0JcmV0dXJuIHJldDsNCisJcmV0dXJu
IDA7DQogfQ0KIA0KIHN0YXRpYyBpbnQgYml0bGFuZF9taWZzX3dtaV9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQ0KQEAgLTMxOSw2ICszMzksOSBAQCBzdGF0aWMgaW50IGJpdGxhbmRfbWlmc193
bWlfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCiAJaWYgKCFkYXRhLT5wcF9kZXYpDQogCQly
ZXR1cm4gMDsNCiANCisJaWYgKCFkYXRhLT5wcm9maWxlX3ZhbGlkKQ0KKwkJcmV0dXJuIDA7DQor
DQogCWRldl9kYmcoZGV2LCAiUmVzdW1pbmcsIHJlc3RvcmluZyBwcm9maWxlICVkXG4iLCBkYXRh
LT5zYXZlZF9wcm9maWxlKTsNCiAJcmV0dXJuIGxhcHRvcF9wcm9maWxlX3NldChkZXYsIGRhdGEt
PnNhdmVkX3Byb2ZpbGUpOw0KIH0NCi0tIA0KMi41NS4wDQoNCg==
