Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012013.outbound.protection.outlook.com [52.103.72.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B27B2264DB;
	Thu,  4 Dec 2025 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764847871; cv=fail; b=eyiXaR3s6RcLv2C/pXcbR2agzDCsTPoxWly+YvAFt/6hMMAGArnc02fMAtcUxvM5fIx0Lp9R/M6YjkvPh3g1ypUeOb+JhbsRKWoy6NVvScBqFng4++Jn0z5+qdSbJqHKyZ81K8j74L7PAfjeqh/YmKs9MPPaIekgspj5tJ0191o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764847871; c=relaxed/simple;
	bh=v6D63lhvyKhVzE++T0I8Hdh7A9zalZP7oaKpevM+1r8=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=KNo6Wpf/jao3+sF3/cdbSRaDz838quGfE98ydcaEA3HhN2dn+9akq82tZKYfksXg3V+HP6YSl2eridhIgPiODxnS4A+6WNooDToVqQi+1vEXehTfawpgSHWpu6oppaf4nK6d0bbQ8zHhOjeAdZwLSg103cOEWhmUHatuyI++oMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Auz9FBgw; arc=fail smtp.client-ip=52.103.72.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Auz9FBgw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3BMPPWre05r3wtBuuiNHbRKvfyNoFoYn37bXj0e4gKPwru+TYE/Jn3X/RGc6Lf9GDnht+/Wmw1i2ukUIvQbalzVA4cSjsStxSOHEzBFUebN5iEtFsaZCbsz2w38sdLy7Uy3P0cLnNw3xyNZ9ZLzqjfc8wIDjHMzd/NHdfmESuesa/6zpxRWmoo9vTuwRKhc6neMmxmJYzutwxVgrW/tX8vkedjfX9JMi4CxqhBFfj1gKCm6npoH3rApYSpnkmQidWWsVq0XYH7xAoAXftGtUOaGX3QLx393PxYDJYoX4loE37AOsZ0SG4g8kWlKst3pqXkWvZF2AmDyK7eXS6zpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiyJCgxAaDS23R44mxkW0XEXFQTUzFn6FyELPUvbx8Q=;
 b=THyFu0/Mb/IUFovL+Il/kdP/yF83cU1zgWRoIrWzFCVrtnIHqr79tcdqrxbNcRB3Csk2gXK2kKfM1rMeyt1Bk89M30JGtfH1CMcMliK4qXYGfq6B2wTA8FO6PFP5f51SCMnCrrW4wm0DxZ6dJAPfcBd498oXW0bs3YTyNBUTLy2BEdHT9Rwm7zsz1jA+uT4iQaY/TCLLGZLAFzVCFRfzXrRPPdwHshUDBbOaIH17NT5LOxzmDWQ05/dVsqeU6AlKM+b/61OSL2MtCNgyEsOsdiWRODx+2J4mguRUMweVM3TdMAQPAMB6QOF6PWq+9stvKgV8k5HMcDguqUInLCLWUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiyJCgxAaDS23R44mxkW0XEXFQTUzFn6FyELPUvbx8Q=;
 b=Auz9FBgw55evJibmsvDJ8OJ1VBoH1ZOWOz1L7/oW6SJ763UIZd+E+vlUqqzd3mnFkAHjIxH+pRmrOSdLavkDsQaLWXebtQANb6HbmYeQR70ao5qGF0ZQbc4RXmZCCaD9+noyrRM7cnFXIXqBlmxheGJm0x32cN5aUlAh+PLLjFfef/BLpJz8FUF1DktN+CS5RSPZPkw1G/Fqb24A3fAbjk1N6FnkeY04/msV26PsE6P/OIm9NSVztq0YI7aaK1lem5rEWwudFkErYD81R4kPkeIGTadFMqCeX5RX5R1xg2idbQhl5saFJwmSSDK041AThLmGTsuJCW9IiD1nssRiTQ==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by SY7PR01MB8287.ausprd01.prod.outlook.com (2603:10c6:10:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 11:31:05 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 11:31:04 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Thu, 04 Dec 2025 19:30:45 +0800
Subject: [PATCH] platform/x86: hp-bioscfg: Fix out-of-bounds array access
 in ACPI package parsing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB78816A828BF586364CF7A4FFAFA6A@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAORwMWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwMT3bTMitRi3URzcxPzRCNLw5RkSyWg2oKiVLAEUGl0bG0tAAJZxwh
 XAAAA
X-Change-ID: 20251204-fixes-a7747a291dc9
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>, Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5111;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=v6D63lhvyKhVzE++T0I8Hdh7A9zalZP7oaKpevM+1r8=;
 b=owGbwMvMwCVW+MIioLvvgwPjabUkhkzDgo9CMpnXNpqw3ZefvF/G2fF4KSfPt89W7JYr3m5e6
 5Rz1J29o5SFQYyLQVZMkeV4waVvFr5bdLf4bEmGmcPKBDKEgYtTACaiKMHI8LZy162JszZ+WfPo
 UjsT4/eIRWt2+3Cw33EJm2/w88lcjw5GhmmTP3AvNree/YRdvWW+5RyODQ2Zn9/lzN4t1yiwIZl
 nOj8A
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: BY5PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:180::20) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20251204-fixes-v1-1-ea5686c09fad@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|SY7PR01MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e80fbe-4853-40a8-7a42-08de33289c25
X-MS-Exchange-SLBlob-MailProps:
	AZnQBsB9XmqDNIqi9hOiQMIf3JxLeKkfAY/4lnrLyt03Dssl4fMs3uP1/O4vs7Bs5miQbLPcc1Ukb/nnRR0nKafUKSmQadrnM/n28nrCbCl0FSQlW4lIg0QsN0Xdj/EUy9GKU2VYHjAvaIsq6FtsYjQPOqvGkM3JJps4CyEDkEtC1VyipKMaagw9mv7zBWqEM93Zy11qieA32hy1dtZw7WiFs9CFhE3YtWahgMWysNFrWiy5BYLhhHChy33HiOesUFLnBoMG+w3uIHtk9ikqPHQmGLgrYA2kotmeTCkeP1LL3QeHwlCEBOttA21LJxxFQudhKTK5y6RuJsyJ7Phy79zZUIQfBvdMm5khl/7EaHSQjnsN8oDKgD01VqpZ92vMsjzPaa+iRMde4T6cmoqIlbC547b1gnKMInGieuImC4tJqKAuj0I49m77k01AIUeCun8DSYtBwi81rURjeSgKWSUv4YoH6vCY75ylT3sEwpDiO4xNqNLtcP6IqqqYi3sv5sL5C6wywLmShFVTnJdyw38RNors7jbT563Y+glE2OJDTekM4vXKHKY8+mx3BzPpUOz8K2lg4KnbaLFJPAl4f9VTQZ13qO0NDNoy5srSKl/t1mkcWx6QxgxALe/y3jA2KGBOpDuZXTvr1cy53289VwI7DIPpFO+dlZf+KPw1Wfh7v0YcUl9uZfodz6Fw0HabhmnSoUas+w6qqZY8y5xZ2r9NH3t+cGfa4XoOE7MdvAiXe7FgRTQk6clMQ0qsvolXNa8NEk51/ZI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5062599005|461199028|8060799015|19110799012|23021999003|12121999013|5072599009|15080799012|41001999006|3412199025|440099028|13041999003|53005399003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWorNzBrYVdPa3BmVDduMlhnOE8xZm0xVjhTTy9MSC9tNUZ6dExVK2x0UU8v?=
 =?utf-8?B?c3Z1ZTFLd3prb3hiMUJRdkRnYUt0b3hYTjFxSHR5RVpacTd5Ui81K284Q0dl?=
 =?utf-8?B?Zm15czhJZlE0Z3RBRm1CanlJNElPbXM0RmQwU0d1d0FKRnRyMGkyYklKSWcx?=
 =?utf-8?B?Zmc2ZXd5a3hPZnF4SjZHdGZWUkw0ZjhxK1kvNmVBRzBoeGpjK2JTajNPTUpQ?=
 =?utf-8?B?Sis0R2lLbjdjNjBlNEZNMExOQ1lkZlprdjZDYjBtVFlVRGlOQkxIb1k1cjRI?=
 =?utf-8?B?S2RWdUdwY3d5YXY2eFIxbkVsOWsrSGpXSlV5V3RzckU4YzZHSUFSNzNNSDVB?=
 =?utf-8?B?Y3FveGdLNGdRckRLVERCQU8wQVNreVNBQkR2QkZrKzFPM212QkFNaFFSU0ht?=
 =?utf-8?B?c3VEdlBoS0w4KzAvWkkybnpRamhjSG5YV3NIUUJLSHF0NHJCKzZHQ3Fxd2pn?=
 =?utf-8?B?d3Z6N2k5aUNKdjloTSt5Z2dZOHZ5VGdXRTZYZDhTdFVDMzVxVWY2VmFrak9N?=
 =?utf-8?B?eTFQRlhBeTE4emR5cU80dGhmcDRReFpOVVNKZTRoeW9PVE4vcm4rdkd6NHl0?=
 =?utf-8?B?bDE0OXA3S1lBSlpZRmpsSGk1VTQvVFNYU0pqa0tYQURQZEdqeVgvQTJTaTg4?=
 =?utf-8?B?aGpuMHBSMWlEUHVQOFFxaW5MczhhODY5Umg4S0lkYnJJWEZ1MTZHS2ZpOUJZ?=
 =?utf-8?B?aGljSURvSUZMYm5HQ0RyaEw4UlNyMHYzTDZjdGpYRkdiNjlTNUFnb1NKKzMy?=
 =?utf-8?B?eGdoWW9UZUViM0dZYTY4NW56dlczMkl3WjVGYnBGQnVicHNTYmF1SnUyMDE1?=
 =?utf-8?B?U1NPRkx6Nm0zNnZjZTVNU3o1Qmtpc25Eb1Jyb0czTVh2WkZRZGY5aFdZZlpF?=
 =?utf-8?B?QzhRUVFQM2RRMWdLelZtcE53ZFlNNVkwVDJYUXJ1VzNsYWQreVpUenBDRWxr?=
 =?utf-8?B?MHdtdHdTUTJLa1MxOE9Dc09IL0xxRm9kSTJOUDVYbzlDT1FyR1B3UTFSUlR6?=
 =?utf-8?B?WDJ5d2tLSzd3SkRkYm5oSEwwNm5UdXN5bnRPVmJldDZwM2R1MEpuUU04Ti9s?=
 =?utf-8?B?OWlhazUzd2xhdFZEeFVBbURqNHVXQnNZajdhMnZBNjR1Z1FIV3NRTTh2WUZh?=
 =?utf-8?B?bjdIbkplcll3a0k0dDlCNFVKenAvbldSMWZnMjAveHRSTWpvWXpVTlVSOXMv?=
 =?utf-8?B?ZFl6bFZLQzM2dFJjcnQ0bUpQVzFmWUZxaVlvSTVDWVc4QjFsRGE3KytxTVY4?=
 =?utf-8?B?bmMwQTZPeVZ4dlhkOGlXUTkyVW9pVHVYc25GSHEyT1ZDVEM3Lys2eWdDMWpl?=
 =?utf-8?B?WEdpWWF1dG8zNFFsZGVzbXBYRXUveG9XcWpYVmtsTTJEb056bjB1ZHlSWFBj?=
 =?utf-8?B?ZTNVaVAzbHhhL1ZmdmQwZ2lCYkxLSnhnZXN5VW1TRGY3VDRFeTRtQVRLeC9J?=
 =?utf-8?B?WEhvdk1HY0hxRnVzTHNvcGtYejhGclpra3RJbEVIUVRSWmhsODNrQjZIWXc5?=
 =?utf-8?B?K05hSE1MeFZ2RzJFNWFDbEZhdzdRdGdJNmVKL3QwTzBTT21aWDVGckFPRURC?=
 =?utf-8?B?RUtLcWRtczYwa0Vock0xVGdBcVA4M1lBRFlOdk1TMW1nQ2c5UDg4ZDRFUGZQ?=
 =?utf-8?B?bmh6cTZtTDIvV0dZNW44ZENzSUdRcWVSZ1hjbi9BZG9odUlaT2VHa3ZtY3BQ?=
 =?utf-8?B?a0JrektPN1NJbWNyamg1VWJ4MmtkdUthanVNOEpHUE9oK0ZmTWorRUlJRFRw?=
 =?utf-8?B?eGhBTE52RXpkYlZ3ZzNhMm4razZNc2oxT0tPSWdEWjhSbDRLVm9VMG11STJr?=
 =?utf-8?Q?owbhmvWSazmlPkpl/T94M3HXihO6ISL5RDmXg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnZCTURKSWhRVjl3ajhsekNwTzR0WXVHTkhqM2JoNzNhcEpyYVlkbTJxQUVL?=
 =?utf-8?B?Vlp5VVlhVFZPK2Z6UmZJcmJ4M3RmL3E1Z1A0OWlTdlNsOTUyRkNmT01TZEhL?=
 =?utf-8?B?dk1WOGw2dEdOcmhEQkRiazMyUFZ2VjllWmRCdGR0TDRyN2RyTGdoV2o4cGhT?=
 =?utf-8?B?YXJ3Z0RPZ3ZrUVAxUTZFNnlxRmRLazhGbmxReW1yZksybElGckVQSXhNRHJM?=
 =?utf-8?B?cTNheXdHQ0VZZXo5T1Z6TVI0RHZNYmNpL3ZYajNlRFIrUHBhZTBKUDlzT2k0?=
 =?utf-8?B?MHBtaHZuNndXTG8xQzBEOUt0UEZjTk4veVp3Z3RuaHlMSFZHRDBiRE8xMjl0?=
 =?utf-8?B?YzJMVXRrb2xlT25HNjhHZmFPZktseGhUcVdicWlEb09ZR01GMVVCMGtzc0hD?=
 =?utf-8?B?a20vUWRMOUpOZ0hhOW1XOStWUnNDWkZiMEU4clduQm1PR3lnNC9GaWhOZkdt?=
 =?utf-8?B?eHUzTzhXSENpdTJ6MWpmc2tzUFlHSUpOdzZjNExRRWdvRlhuaTFYUGYwU2JM?=
 =?utf-8?B?a1AxeXViUlh1Zmp2MlUwa1RUL285Qi85SVBoVDNJL2cvK2FFNlBNNzF4djc2?=
 =?utf-8?B?UzlYaHV0OHk1bDRiNFpZRWpRUStxZDg1NHRRdUVVU0ZDcHpKV09GSTRmM3E0?=
 =?utf-8?B?cjJWRG5qUU5ST2ZmU0FhTkl5WEYxUGlFbHFzcnhzc1gyUkpyZ0JtNHZ3c0lj?=
 =?utf-8?B?MWQxdEtVMjdXYWdUYUV5elB2ZUU5SWJNVlJVZGdKbmo3djdlM2lFTDVSOTds?=
 =?utf-8?B?UFAxa011ZFZvWlp2SWFmVEl3OExwU1RUZHlDbU1pSUxjbTZBa0Vpak00ZWNJ?=
 =?utf-8?B?YWJ0WGVoYnd6Lzd5QWI4NERUR290SEFmRFV6eE91ZS9pbTZXeUNLcm9XemRu?=
 =?utf-8?B?TGkrdllYOEFmbklUMHZMWHkySmdaOXkxR21mWjkwQzhGWTZ0U1N1blIweVp0?=
 =?utf-8?B?NDJxeVREcFgwR1IvK0lvWkxSN3BUK280OEN5dURaVXZTZXJIdXBpZm43Z3dX?=
 =?utf-8?B?QVM5bWlVUE1qamhHeExuTzg0Vi9jSnBOeGJpZG1mbnYxMTZ6bXpxeEYwSjYv?=
 =?utf-8?B?QlRRYWJNaG44bXlXanlCeUpVelN6WGd2R1pIQ0NzaDNKUmRlNWladW5zVHVC?=
 =?utf-8?B?UXBBQjh1d2l0c3dYZUE0aE5mM09IUlFNR1AvN2xEZHE0ZVB0Z3RSY09yKzFH?=
 =?utf-8?B?SXJqc2pvOVRXMS9jM1liUVAwUmZOb1pXZHgreTk0dzNrMytoclhxR2VMTjc1?=
 =?utf-8?B?dXNPN01JTmp2My9GU2twMWR6UksvSkpzRnpUNlVqdDU3QXF1Z2YzZG9OOTlG?=
 =?utf-8?B?WDR1VTE1dVBiRFZyNTRqVFZRRCtXQlhKOTJlcEY1TXVjVTlJOUJBdWhialdt?=
 =?utf-8?B?WGQrR1Jlc3Jvc05TTVRFSENTLzNMdUNxQU84ZEVuYWpVTEVnMmlhalhhS0hq?=
 =?utf-8?B?aHFTZjVvV0VaZ1ltZXRCWENFbzhGMit6STJtWWx2MFd3ZDZ4ZDdmajVLLzlR?=
 =?utf-8?B?T3l4b0QzNVcwWXhPcXZucUdqbDl3OUQvWi80M3VkdWxwSG5KM1QxUWNvbFRM?=
 =?utf-8?B?YzVFWVFqZ0hvR3RyVXE1SzNDNGJSUmdZMzF1WXY0VERMM2wxQkl1S0phQVRE?=
 =?utf-8?B?Q2oxNWZGSzNxNUhFbG53em5McUVnVVZlcmszb0tEWGRPSkV5NjIzSzdMbVVL?=
 =?utf-8?Q?PzlhzFM0owRrQwnIv1U8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e80fbe-4853-40a8-7a42-08de33289c25
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 11:31:04.9196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7PR01MB8287

The hp_populate_*_elements_from_package() functions in the hp-bioscfg
driver contain out-of-bounds array access vulnerabilities.

The fix changes the bounds check to validate the actual accessed index.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Reported-by: Junrui Luo <moonafterrain@outlook.com>
Fixes: e6c7b3e15559 ("platform/x86: hp-bioscfg: string-attributes")
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
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
base-commit: 4a26e7032d7d57c998598c08a034872d6f0d3945
change-id: 20251204-fixes-a7747a291dc9

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>

