Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011013.outbound.protection.outlook.com [52.103.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73669482EB;
	Sun, 25 Jan 2026 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769374118; cv=fail; b=LiVUmlBZ+p304G1nN+FfHilgPvuC4m2tc+JPvzNeQGSJQ6Pe1nWSvJTc+CGxNrY8Ich10dWJkBbtu1xchem/DKP2/Bnqr52DP1eGFqT5067Inpo0BLY/IS6kj7HcfHmvRZN9OJwZoMRMhfg7pUw1C8v5Zgz5FAnYNH+yTtmoVu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769374118; c=relaxed/simple;
	bh=T2mG1CaaPj3E0+wXXf63OnhfTNG7+0ScXKUYVuhy5kg=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=ICFYc8GMzDizafBDCUGJBZhlngp9H08X8KYYW8nAUfeVWunOk+svBKweu0u7ZkhMgVo55apTE0rtXT/YBAa3MtKNmnwvWB9K55BeHZHvaKNF5Uw0ltw+wxWsVMhnFfcrhyha8GIZO4HbwKH7qfAkPe8XM7TYxhCfZfc0UI0ejzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oNyYc4cL; arc=fail smtp.client-ip=52.103.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oNyYc4cL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeNAso44AR5K2q6gPYKZsuMvCL+0x689wADjH1fHb0j+xr2VEWa4maRZooyM6YNB+eJhD2hFIlYs546tO91FU4BgPpQUQd2Ik70bruIatGEP71JAOJHHXws+RSk/e80PUDXoWDOYrgIz7HcMWj6+6ioLSEVbdCL2gBlFyJUlwIY5mDjDNlB0QcJMJoqc5NX857QgWJkuX+2QwwlGHaEVOD53h/6K3IdJctrbjyGMUpmy9bOcDec0x6XkTrz92SbmF4Fg2lcRwPwxE6G8CFeCCPxxu6j2+IqTxMnBP5tmdzrvyAiRdX29pAYdLIa3AV8savzOuFfvo1D7QJSdyVXDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmqUiVvNt1l5WWnvdOrEx1r6f2cLXELZ8ApwQV/qxY4=;
 b=UPlyGsYoS4BrIaV2RnPVDGotlOe52gJ/2azCbyxbfACA5irNsGJkYgIUmb11iViNtQwQcmUorj03QUF30/LHolT0DOrpOy172JuRyytAJZ7fRjcrYxl9gCF/nU7YGfPseeEhABeSvyJ+4twSqrI3SIW6+Ah6sRKt7iZqiRJ/TeFcqjxtpHBC3SZrBuayvRQA7MMiq6qZ/esmnCf3rn3QS338iCMgPE3tS+E3XreO3bgq05KpNP+2UpxzUhzjvYROwZlccqoNDcV2NF1YQWGSTAos4MUDSKy0CaW6KlK5ZjJzGA3TA772/Rshf4NOcuUwALJ5icX10a/5YLxrnw0XQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmqUiVvNt1l5WWnvdOrEx1r6f2cLXELZ8ApwQV/qxY4=;
 b=oNyYc4cLDgnNEhXNx1es5aV22Kl1Bb3JY8Sqb6BxYO7g15RW0Ku75M5kJAoUrutYg0MjHz3m3n9UaAvF6eu0LbevJ2QreH2HbpzO9PdXhC1HpJk9TA44AuTaw4YnkwuQW3FP24zti8eoRVQRCTRu8TbYod5suxZKQdC/wFXNlWlaK7vLLBKcKr4ZofMmEvq4yMKz5vgKPj+Gjb9QsrvpH+e0oWSuRFB0q4C1TRa2bTuhn7cPfF6yXe504iezl1C90Z6O5EH58lU9M01n3aIzwYWeHS31YSbO4Oyst2ah/QHDU8Fi7dpQw+KlCflAas6vRom4aIGtb9Y8TM+tB/1HGg==
Received: from TYCPR01MB6851.jpnprd01.prod.outlook.com (2603:1096:400:b6::5)
 by TYRPR01MB12543.jpnprd01.prod.outlook.com (2603:1096:405:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Sun, 25 Jan
 2026 20:48:33 +0000
Received: from TYCPR01MB6851.jpnprd01.prod.outlook.com
 ([fe80::b4ac:4d8e:c794:940d]) by TYCPR01MB6851.jpnprd01.prod.outlook.com
 ([fe80::b4ac:4d8e:c794:940d%5]) with mapi id 15.20.9542.010; Sun, 25 Jan 2026
 20:48:33 +0000
From: Jesse Guo <JesseGuoTech@outlook.com>
Date: Mon, 26 Jan 2026 04:48:26 +0800
Subject: [PATCH v2] platform/x86: redmi-wmi: Add more hotkey mappings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <TYCPR01MB6851636256C39B170F2312E5D192A@TYCPR01MB6851.jpnprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CQBAEv0Lm7Bh2lZV48h+GAzCDTBCG7CJKC
 H935QMe+lCddPUKgb1wgGuygudZgugQwR4SqNtyeDAKRQabWpcam6Fn6gXfMa1OHS9YEqFzrmz
 yc5UyVxCno+dGPrv2XkRuJUzql/1lNr/2j3A2aJBObPPM5USX7Kav6anaHWvtodi27QuCTlOzu
 gAAAA==
X-Change-ID: 20260125-redmi-wmi-hotkey-add-666af84b0eeb
To: Gladyshev Ilya <foxido@foxido.dev>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesse Guo <JesseGuoTech@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376;
 i=JesseGuoTech@outlook.com; h=from:subject:message-id;
 bh=T2mG1CaaPj3E0+wXXf63OnhfTNG7+0ScXKUYVuhy5kg=;
 b=owGbwMvMwCWWnjPtZGqx9GPG02pJDJlljbO2yd61Z1il/ER4Stii5AsLglYxNAteEN9ws7lh3
 nNRBQ6XjlIWBjEuBlkxRRYb6cdWiVwR6RpXVvXDzGFlAhnCwMUpABOZKcrIsFI+2zgh+ta6VRGL
 fvvx+kRp682byZe12PzKyr0z5bnc1Rj+WflcPZuxbEL9fsftU/67h73Rqs+0ON7Es+Pu9K3lbH+
 V+QE=
X-Developer-Key: i=JesseGuoTech@outlook.com; a=openpgp;
 fpr=99FD0EC891CAE80A011478EB24068CA03442C4B1
X-ClientProxiedBy: BM1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::24) To TYCPR01MB6851.jpnprd01.prod.outlook.com
 (2603:1096:400:b6::5)
X-Microsoft-Original-Message-ID:
 <20260126-redmi-wmi-hotkey-add-v2-1-1c7dee568772@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB6851:EE_|TYRPR01MB12543:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0f2011-b1b2-481d-ef04-08de5c531a95
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|51005399006|19110799012|23021999003|15080799012|461199028|5072599009|5062599005|6090799003|1602099012|19061999003|40105399003|4302099013|440099028|3412199025|10035399007|3430499032|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzljalZFd0swdzM5c2xnLzlUM3Q5c1Y3a3NpTDEyUTRrcXJQRFJsRXhTSHVJ?=
 =?utf-8?B?VGIxME5oU0F0UFU3L0hISCttbklZSERVQk9XNnhiYUtoTDVqTlJueWQ5b1Qz?=
 =?utf-8?B?cGl4MXlSZHhyWDNJTHJmbDJJUXA1TVZKUXVBQTV2YnZnMXJvUkxWdjFWQjNH?=
 =?utf-8?B?eUd3TGh5b002Nlc1VXFYYWZyREUvRzN6bE1wbU41TnVLUkRHOFVvandBVGtG?=
 =?utf-8?B?Ni8rZTB0Q3dYZXhJUWFhWVFoVExrQVhSeDRLV0lKTVl0VmxwWjhSUkVnd3Nm?=
 =?utf-8?B?K1JxczZjUGJNZ2tNL3JzYWpINjJaY0lWTUR2aWsxTEE3Ri9zejBGT1FDWVRB?=
 =?utf-8?B?TzVOSmNkVS9qMlQzRUdDTEJJTmxJV1ZzVEY1eURPcXE5OGYxT0hxMGRhMmp4?=
 =?utf-8?B?cUc5eGljWHFNWlBsc0tCdDYxREFPOS94aG9IZGFVL3lxenp4UVlIbEdQTzY3?=
 =?utf-8?B?VjNieHRsSjJEcVk4RVdPc1I2U0FTVW4xMkRYUm8xWm05dWFOb0xTQ2Y0TnI4?=
 =?utf-8?B?V2FCdTVVU3h1c3BxNnVWOW1reG5XcGh3NUZMNFY2bDJ1aGJHVXBBNDYva09u?=
 =?utf-8?B?dXd5SzNLRmdqVExyaEpBSTE4KzdpZFo2SWN5UFlNd3l1czJXVzk1Y2tidW52?=
 =?utf-8?B?YzIyR2lpUzBqY1ZMcnB3cW5RaTZzUTQ1VkhSUmZVZHFuejBFS2hpd3VQMXZp?=
 =?utf-8?B?UlJEWXAzZC9oTjhFRUpsL0U1WjlLRkV6SzRFWituK0FJbXdxVitEeFlxenNq?=
 =?utf-8?B?WGFKUndwZ1NldWVzT2VPQ1pTQ2Z0aCtic3YvVFhiUjlJdmJGMHNpMHhXR0VO?=
 =?utf-8?B?Nlg4VGdXVEQ1YnFMYnJ6U3hZZ3pKYWIrRVA2eDRIc1dYelpsYW05ZjVvdUJp?=
 =?utf-8?B?bDh2bERBQUZZdldsUFdQQXJLbG5ZZGNtditBNkFCZjVyQkFnb2VaMkRqcmFG?=
 =?utf-8?B?cm05MDFheSt4RUl6U2R6UE9WMnZ6SnFYVEZxOWlnWm5INFg5bC92Y3ZVSnhS?=
 =?utf-8?B?NzVVcXVVUUgvT0FLcGZoOUhQS0lJQmRLZWI0dDZyWGpKSXQ5Wml2K0hzWm5R?=
 =?utf-8?B?RlVRazU4aEdBSjZuWDVBd0NjU2FNR1ZLMjRpSGZpZFU1MjlZSml5d1h5Nllr?=
 =?utf-8?B?NVViWWRXZTNHUkFvL2UvSWhTQ21xY2FvR3VzMmFVVHVqNTQ2RFFPZDFhL3Rv?=
 =?utf-8?B?T25UUVVPNGUvVWJMRU1LYjFXUkZmcS9DYmwvK0JRditMcWRnMjUzT2hUa1Ur?=
 =?utf-8?B?Zmxzd0N4YXVBZkdiaWplNHp3ZDJTNEpabDhES2NrZytwRTRyaElHZ2p0OWJn?=
 =?utf-8?B?WnluRCsySktWRXNsSS8zVHN0NXFpNnV6bUJqam9nREh6NTdQUVJjTzlQYURn?=
 =?utf-8?B?cVV1eUdGeUhGV0tkQi9zMTNzMHhGMjBwd3hBaVZQdHhmL0ZZRlhhaW1FWU8y?=
 =?utf-8?B?S2pvUnJqK0QxU3Rhdm1mU3V3Vmc1bjJGRHMxSGVJR3BVYUIwTVZEK09GTDBz?=
 =?utf-8?B?dzJHWjduTUZNakdDcjZSQjFRQS8xN0lldkZJMTErSVpEQlZOOE13d2JkdlVw?=
 =?utf-8?B?cStyN1ovbjM5bmlVTW9iZ0dZcnNxYTJscDBSSXdPd0t6L0l0cWRmNnV3V1A4?=
 =?utf-8?B?SmlWVE1wZ283Tm5Ba1FmOWRCY1ROZzhkMUxqdkE0UFRkWEdNUWppQUpxdC80?=
 =?utf-8?B?TlVTOUVlbFZFeU5XUzVVd0FrVXFaVGtoRk9qSGFBVDdnRk9PWFE1S2xIT1FQ?=
 =?utf-8?B?SmdYNUYwNUp2RlhDcWc2TWJ1d0wxNEZIN2NZVlNvQXRJM1dBblhsbDE2eEtJ?=
 =?utf-8?B?OHFZNE1HemhxK3NUcE1jaVZLaFVpV1VUNm9iRFJjR0Z1WnN0R05zcDVWc2ww?=
 =?utf-8?B?RnlMNlFVczBOK3NKRGVoUjdiOW51djkwYzhWYUZaT1ZtV3ZSRC9hUDN3OFpR?=
 =?utf-8?Q?5XdHHmxk3Q0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFZkOGF5VFVmQ2hHQlQ4Y0xFQ0hBMXdwQ0xIVUMvZ05zQ0E0LzJ2TzZJSThS?=
 =?utf-8?B?aE5HMWp6UGhZdjQ2cUs1WjBHY2ZqdDFabkFTU09TZlNnZGlaRTU1dlpybzRp?=
 =?utf-8?B?QmVGakZlL3d2aEZ2Z2FCdkcwVlB3bWNOMW9MR3ZkQXJlMXRPeVZDRmdGQWZK?=
 =?utf-8?B?aTdwR1BBRjMybVZyQXNyTUVyU0JOdi9UTDlUWTFKeWM4TnNiblFXWTNZYnhY?=
 =?utf-8?B?Q243TUIzazNyUEZMZHp0YWFoc1VqdkNsK0c2a2tUeGpxTXBQK1NuVjQ4OE1T?=
 =?utf-8?B?YXNJN2lRVlpodTg3Z2tZSHY3QmZBTE1IUzI1aG5qQWVXbE91Qkk4bVdZNlhv?=
 =?utf-8?B?N0ZuM01SdmJWMlR6cEsxN254eXhHTngwYWIwSEI2amRtbTVxQk4rL0NWZk5p?=
 =?utf-8?B?aFZxM2pNYTJqajVYVHAweW5hOW00RVJsTDd1NCtpR3h4Y0JtRVZ6WkVKbHVh?=
 =?utf-8?B?SjZtRmlxMTFwaGF3djdtVFExa2Y3WGd6dUxiQzNmaEVsVFR6YlVGV2hiYm1Y?=
 =?utf-8?B?b0pJSDR0STUrcmlyWXRvUmpMd0dpN1JTYTBQUis0QWdwdmVMWHd3RVpvalpD?=
 =?utf-8?B?TGZ6dmtDUmpJTlRTVDY3K3RnaGFYNi8vN3BiMW90T1JmcEJQenJ3anpjR3dO?=
 =?utf-8?B?OENXR0dHRlRJYWxVeEEwMC9qci9jVXpoZkU1b2ZDdTdHWjNKNUlXSHVXVTNO?=
 =?utf-8?B?R2NCWHdpZkhMVnZ3eTBYT25SL241K0UzM1VreHhSWDhDU29uYWJKWjV1dHdn?=
 =?utf-8?B?ZnNBaU53OC9zdFJEd2U1VDc3VzlrMW80dTFna3BPYUI5OVJXTWw1RFFrUTVa?=
 =?utf-8?B?clh2cHBoZW45b2d2Y1o4QWV3Z3k1WlhTeTQrcFJHK1cyYlpzQ05vSkN6L0Vw?=
 =?utf-8?B?VjlGYVg2NG1mMU1KNlZYRThpbGRsQWw5MlQ0YXhVWUFGNnNxZUo0VFBFci9O?=
 =?utf-8?B?Sm9FMFdzdTlKZXNDMW9XYjJ3d2hqUWtrRWpFUDBiQzdoS3Q2YkcrUVplekRZ?=
 =?utf-8?B?eER2OTRKamE0dWhkVUFybWNxSjg4MGtxM3dNdkdFcnVOSklLTHE3N1FwOS9E?=
 =?utf-8?B?K3czOWh2ZlRRcGVHYk5ubTVobXdpWHc2c21ndVd1emRLZzB2MFhrK0d6cDZu?=
 =?utf-8?B?WjJaaHdmMFJQd1VYbWFZNFlrZ2tIRHVtV2QvZ2xrNTFQUEdQK0dTd1NDMnMz?=
 =?utf-8?B?MUZnU1gyTjJsZldQWmxGWXRKMkZrb28xalFiZk1wNWs3S0Nia1cwN2FtNFpa?=
 =?utf-8?B?d0N3bW9NVEoxamNISWVqQ0tGWGtiWUxwSTR4SGIxOTBZQWVNaWNFU2twcW1s?=
 =?utf-8?B?aHowS2Y5MmJUM3R4Uk8wUzVsb0ZFbTVXSmd6dmpZaktBOTlTR2M2K2hSV2ty?=
 =?utf-8?B?L1hBRjV4NEhxYU9mMHBNa3lqL1JGd2xlV3N4TklrR255OEw1R2g1eW5ESWd4?=
 =?utf-8?B?cUpxR25iT3pyeHVLdEF3cWY5R2dJTzNzdXZkTVYza01ody9xN2NoQ1grd0FN?=
 =?utf-8?B?QWYxUTVrQ0xsMG9uLzdNRlZQdUlPcXhNL2F2TkZYZWNqM0xaN0VBSWc1WW1v?=
 =?utf-8?B?SlluNGFYM3FSWC94QTlGOWhldUtiQjk5YVRyRi80dFpLZ2VDeEI0Ym1GS0tv?=
 =?utf-8?B?L08vZDk2b2dRWnFpUzAyTDV4THh1d1ZPaEF6NFVSNy9xWXhBZEJBSzVoeDNR?=
 =?utf-8?B?bnViZWs4OGpKSkRucW9hRUVJQUM4WnZMRmJCZlJseW5ITTlwQWRIaXpmN1Y2?=
 =?utf-8?B?SktpWXV3MUE2NzhrRTNSS1R5S3huRTdMK1daVEdDKzQ4eVlFcEs2Rzd0NlBn?=
 =?utf-8?B?U3BMQndFNlVEWGYwWkFudWxwNTN1NWRyRXZaaHpSTTROVzVwZGdkclJ1b0cw?=
 =?utf-8?B?c0xvK3hBZmlXKzE2MTZYMHB5U2Y2NjBDWDVKckV0cWJ5cEltYzhJdHpKTFdE?=
 =?utf-8?Q?vT3HgMh3ApaT+RENuIrQwx9urcdr4LmP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0f2011-b1b2-481d-ef04-08de5c531a95
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6851.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2026 20:48:33.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12543

This patch adds more Fn hotkeys (like Refresh rate toggle).
Additionally, remap the setup key from KEY_SETUP to KEY_CONFIG.
As KEY_CONFIG is supported by Desktop Environments for launching
system settings, whereas KEY_SETUP is often ignored by userspace.

Signed-off-by: Jesse Guo <JesseGuoTech@outlook.com>
---
Changes in v2:
- Dropped Fn Lock (KEY_FN_ESC) mapping to avoid potential user confusion.
- The Fn Lock state is handled internally by the EC and does not require
  a dedicated key event. (Suggested by Gladyshev Ilya)
- Link to v1: https://lore.kernel.org/r/20260125-redmi-wmi-hotkey-add-v1-1-d3e28568dd75@outlook.com
---
 drivers/platform/x86/redmi-wmi.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
index 949236b93a321a943a9cb8b0528d730dbaa2cd6f..e5cb348e3a39a3e17abe6b729c79a9f3220eebd6 100644
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
+	{KE_IGNORE, 0x00000701, {}},
+	{KE_IGNORE, 0x00010701, {}},
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

