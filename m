Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazolkn19010001.outbound.protection.outlook.com [52.103.73.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F712E2850;
	Fri, 19 Dec 2025 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.73.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766133049; cv=fail; b=qqf/Vx8oCmKoaZwR3kg/FXJ8vcM++OI9LIHUT0fyy4r2h0ZXt90us9vzmME5wlgJWrOgCfaKI+kDcVx08tzxJXBFyE19fT0nQogHUXc2qUAjZ5b0a/Irs5DoNXckcykWE9uVUM2zovYktS5abYL1RFN0vTj/7kjtlJkGRgCN/YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766133049; c=relaxed/simple;
	bh=8wSFLeeEDxNe518YPBUUhCWeqRMpnUNgMi0ULg1ky8s=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=Pg5a4786TNxo8Fh0x73am2iNLVGkLPEdW3AmpNpKBComfm+znpsrLQU0blbjn0UfgldxGs8U9I6uwzaRQKnjVQqw+B/SsL91lclfLa02s2usxmMgL4r2FZJHSh4LeGvX5e7gz2/dR971ZmGZhL8TEk4nICrK3U6e0mpcVjj/yok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=iHqHu/tf; arc=fail smtp.client-ip=52.103.73.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="iHqHu/tf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqnWWQ30V8bz7hBQ3BJIhZX7+aUsnM7HB+5px5moYg6/mLR2L+L9zmnTwGua7ANrAOV+Dgyg66YLyVF3nXIjngNfcvyPeYdZyCmCVk6VK+CYtSPvJxlr6ntPIKnt0CnLpYEWrGjAjXjLhqtL4G1niGj+qyhEIMmjABJ0UeNF5mdr62bBsufm8X2Wk4DwYuvZWlSw3fqvosDqKcaVI22KBsC3nrT9NqgMW4sgUDo0FGobgcHV+hnEVNerL6Kdl8ghauAYOpKk+qWfHROml/5ojc3S3xSRVN1eG4wOrXP5klnQaV1S1MLzqTLG/vbUHAWSvKDpi2v9Q3qn4bDWleb6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roZGuDuiU7zgw74yGqHBsTRe1bsWv+Ddk0FmcSX5VBk=;
 b=IV8dgDVO2/AsVM+LYwROqo/x5TlSafttWRUf+fjVz3d3xwMMVK7RloVUk3juPQELA1jGdFAbhEGx8KhdottWWjxasv9fe1+OI6fiFwQsX+1HLcWaLbAcB/iF+hXzeb5+K57uEp3SDLzzRWha5dnG3keOp2vs/KuKOdvjUGbd/9b60wzqX3WeXNW9DBkMkNQFTrZow/t0WRDUdbrDh34PHDZbh+Dm9UeWbaH0s2U0IBKH8I6R45w6RUF0PCMtORjIiGz2bJkohYt+Qtk5hNMIgrtCpF9u9nL9wxsng6U/uzROEjL0pmDMTbYOru1PW1Hlqx8YljiTMQQQj6kjtog9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roZGuDuiU7zgw74yGqHBsTRe1bsWv+Ddk0FmcSX5VBk=;
 b=iHqHu/tfT1jUViCZEgWkFY9bHHlSDLAXyPrPKBVWLzxT2km5+2l+zCn8JKkRvPmA+uiiq8ftFxVKl4R185iQTQTMIjMbMx3QBijKKwEoos/g7ViKOAiGNE3RRv9n2vIstdmcaifLlK8oPshLLtGZQFeFxUuk8Fj0OfJVHxnjIPWRWxmiyiOiaMgcZ5cqMxs7VEcNlppWrIkehmYVfp/NI+EF6vhrpqr9yq6xRIdeBc9kTZaPa7CI0Mb0200s1/20LDQIoRWnbXW4I8VkQzwaVCfF0gVGY2bLEi4HX7/XWCbW/TUPAls1CKpgWOOEjBYVIm3ocgDacEkVzgelWp5wwg==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by MEUPR01MB9383.ausprd01.prod.outlook.com (2603:10c6:220:219::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:30:43 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:30:43 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Fri, 19 Dec 2025 16:30:29 +0800
Subject: [PATCH] platform/x86: ibm_rtl: fix EBDA signature search pointer
 arithmetic
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB78812D887A92DE3802D0D06EAFA9A@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIACQNRWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0NL3bTMitRiXZOUxEQTU2MTsyTTZCWg2oKiVLAEUGl0bG0tAFKxOl5
 XAAAA
X-Change-ID: 20251219-fixes-4daa45346b5c
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Vernon Mauery <vernux@us.ibm.com>, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>, Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=8wSFLeeEDxNe518YPBUUhCWeqRMpnUNgMi0ULg1ky8s=;
 b=owGbwMvMwCVW+MIioLvvgwPjabUkhkxXXm1/5YiOD+KijSHzmRsXsKatcKgqKk4WCt3q7L96d
 f6F47EdpSwMYlwMsmKKLMcLLn2z8N2iu8VnSzLMHFYmkCEMXJwCMJE/JYwMrad+yidMMLN0ePZp
 Q1kbd+73fVsPPJw1LSMtMTSGr7ZBjuGfXsUZjWNyd/obLm7XOD0vf2pOnNhpPpH/ojOv9v38kTm
 TEQA=
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20251219-fixes-v1-1-41c1be610d18@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|MEUPR01MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ef6f9b-c215-4766-ac9a-08de3ed8e5ad
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|19110799012|8060799015|461199028|23021999003|51005399006|6090799003|5072599009|5062599005|40105399003|440099028|3412199025|12091999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejBWQ3FoYk00dWZMSDdvQzVqNmg3SU5Ea2lrbDN6MkhQcUhnWU03UTBlOFJK?=
 =?utf-8?B?NlZsWnBBeUNqKzgxWUY5TkRwcVR5TGxqTG5neEVNYnp4VUE0TDRDVzVOTGNt?=
 =?utf-8?B?SndLVWRIRzdKSmxwdDkzcDJ6ams5cTJUckRLU0FBYXlpamkwK3BETGc0dW9n?=
 =?utf-8?B?OTh5M1VjMHRXTHdkUXhCc2JiOG5ucEMxVUdCVWEvZmprbkV6Y1UrWkRYTlJj?=
 =?utf-8?B?SzRRcVZjWC91SUJ0Qlk1eUYyQVc5MGplcHRReGpuZjBnZUVsYWpWdTVHTkNV?=
 =?utf-8?B?Ni9RTXp5bE9hbW1kV0FWdnM1RldWMURieUNEc1EyM291ejAxSzFuMGxFbEpo?=
 =?utf-8?B?eHo3RTNWSzJ2Y09nSVdVWHhRRnBjaTExbXJoN0hVbytCRU1DbWdHellQd2l6?=
 =?utf-8?B?cnNHckJuQno1ZGlubldXeDJpMWxRNy9qelR6cTV3bUFHalNITmpYMUhRR1ds?=
 =?utf-8?B?SHRkVGFsWWgwQW1aeWV1NFhBTVp2TVVFRGQ3UGdkMnZMZFdxejhjQmdpOEt2?=
 =?utf-8?B?Wk9kcUxwaHRwMkIrbTFPN2xieU90UE5ZMlpwMkR5T2JnQXFHOEVaNlBoanl6?=
 =?utf-8?B?WFBHSkJPZ2t6cFBGODlaRE9aZ1VMdU1SNU9uQ0x5WFNsVkZPU0gzcThyMjNl?=
 =?utf-8?B?WmpqYjZqdlF0bEVDcnowd1VST1ExZnRkY21qM1VsYndWaUxSM3pyMis1YXhy?=
 =?utf-8?B?aDc0MkRqTTQrY0VaZ1U4VW0vbXFBY25PYnNVVVJPcndFL3RJcFN3cytSYlNS?=
 =?utf-8?B?eVhMTURtWW5wdkFjbnRwQWEyOVJuR1p6c2pMaEJEOUxPVmlYVEcyZ0NlV2gx?=
 =?utf-8?B?dUlZS3Eyb0ovQXFiWTJxTmtZclpMcS9pMnBhS3ljTjlFVTg2ZzNGYUlxV2ZE?=
 =?utf-8?B?dFEwNFl4ZVFKaU1MNUlvRUdPVzBuNUIwS09hK3RvUFh4QWZSS2RrejZhZzc5?=
 =?utf-8?B?aG1VdjJZaFN1clRKOWVPNUtkT0laMXhXeHBvb0Y3MUpRZGRoN1g5WGRZOFo1?=
 =?utf-8?B?Z24vWDUvR2d1VmxWZVR6b2FzS1NjSEpsSnVObGp4WGQ3TmhVSGEzWDRxQWIz?=
 =?utf-8?B?T3ViWWRZdzRUMFd4ZU1LckoxeStaaTU1Qmg3TndOR3BORXNsQ1FWZnJ3clJF?=
 =?utf-8?B?UXdJSzdOU2JkaHlQcTVhR2lyckwxUitoK2wveGgzeWZ3V3JPNVFZT0crU2ZR?=
 =?utf-8?B?NTZHeDkwbDdLS3NzcjQvUHBabE5HZHFpNk43UDN5NVM1ZTFLU1U5M1RYSkN3?=
 =?utf-8?B?NDEvMTNxUTZuL1ZSN3ZPdUVOL2RXclpJbHkxTU5mZHY2VW00VjFHdCtOK2xT?=
 =?utf-8?B?enQwbStWNWVTQ3QyRSttSmVydkNYN1N1TG9oODd0cExRdi93NmJvd2Y2NlFD?=
 =?utf-8?B?SXplMGpPOTFpRkxWVEhmQWRRcVd2N25FQmFqdlpyQldBUndITUlodXY3V0tv?=
 =?utf-8?B?VzF5bnNSOFVXbkFyV0tIazhWbFJOMVBQUUVNaVBjazBLemRyRFdpVUxqNytx?=
 =?utf-8?B?U09FS0FtRU5KUHlTMjFHRE9iWW13VGRsTHNMQ3hSaEJ0Q3ZjZU5FckpOU296?=
 =?utf-8?B?UjA0dk5ESnJDam4yTVpkdWI1SEk3N3FCcEpuOGdKNm9UT3NFYlIvTnhCWVVn?=
 =?utf-8?B?VWJ3cTV3dmxmL0p0YkZKbGFYVkRRRWhzR3lBZkt3TDhJcTIxczlBd0UyTlhR?=
 =?utf-8?B?YkFGUEpDdFZuWGoxRFRiRUdSdnhYcmNkZGhCTk43WG5sNDZSQTZPUjVEU1hj?=
 =?utf-8?Q?QefRXkUlroKo4UYsQE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emRIaXAxdStLQy9pMzRHdjd6bWxmY0pBYnMvTGtSdWpBdkFRNTY4UkJSY3Ri?=
 =?utf-8?B?WHV6SEl3UmpTNHE2MXF6ZHlkL01jdjJjcWJlVGVIc3U5c0dmK0p4R0c0MHVY?=
 =?utf-8?B?YXIzNU9qcXVjYVJxVk1ndjdNamlYemQ0QTlxaGd0UkpuV2lNRzRFYm5pdjVk?=
 =?utf-8?B?aktCc01GbFlONHBib3dWM3JGZHV4Q2lQZkk2aUZoVE1WdmxNK0xlNk0xRHBW?=
 =?utf-8?B?Q282WGEvaG1NN2loMkwxMkI4YitMR1dwd0IvWG5FUlZNVmlDalJOb3NCbytO?=
 =?utf-8?B?Mkt3T2Vqbk4rWnBSNXFtNlJsK3JMeDhzVjJKTGV3R1JCdmFxQTRXQmgxRzNv?=
 =?utf-8?B?MS8rOVY2dHlnSysvbWxmODV5TFZZeGU1UnFsWWsydG9TMDM3dGdZWmZsSEFr?=
 =?utf-8?B?bTBaWmRBSFc4YzRJVlFoMzJsK2NoOUg0cGdUZ0RldDVBdGFUWUxSVGp4eHB5?=
 =?utf-8?B?WHhvOWlBeUUwUVhQU2I3VEYrcTB6VGtQamhEQkxVVFYyT1BhTHc0emVQYmxT?=
 =?utf-8?B?QXoycUp4a0xLTHEySG1hYmt0QzlKTEM4YmZVSE8zZEhqZldQVkUxZE1yWjdE?=
 =?utf-8?B?UmQ1a2hZOEUvaTZCYU9BUEZpZzlTaUJzR3ZablVBMDVSMmw0SjZDenIzcFNs?=
 =?utf-8?B?aW5vNkgwUytvcnhrcUo5d2tLWEE4aFk1eUVVcmRaUndld24ydDcwT280ZG9l?=
 =?utf-8?B?OFc3OURNVlk2Nml0WHNlQk1mQ0UycllFZmNGSXo4ZTV3N2UrdmpmN2xrNjB4?=
 =?utf-8?B?SHZSR1hFaDJBMW4wYmpyaFQyam5ST3pmMUdqZmNqcWFyS2MxeW9pYjdJNHNO?=
 =?utf-8?B?V1huUWt5ODVJVFpEenYrL082VUIzaWRwRjJWVHFmUFdpTnpFNjlEMDBIZG1x?=
 =?utf-8?B?NGN0bmVLS1piczM4NzF0cGttYnRQQkVJZk5hQWs2V05tTFdZcHpKeXVTTHpu?=
 =?utf-8?B?TkIrbGI3anN0eUxSZ2FlKzRIQlpEOThzZVZLSkJkUEE2V2JVNVVhS0JxZjQ5?=
 =?utf-8?B?Nys1WW9BU1dZcVVWKzlOTDlMOXQ2dWF2UkpOTUpONjN3QXRJOEhnSzhPSCs0?=
 =?utf-8?B?WUo0QlQvdXVMSXBCZ0o5T1NrV0kwOXMwbHIxalF1anFQTjNqRVV4cE8zRlJT?=
 =?utf-8?B?RFJ0M2pzRGVZNEUrL1dRZWF0czQ2NzJyU3h1UGliVE9tSlpSZmE1bVVnYzJJ?=
 =?utf-8?B?Z290U053bEVnSEhVL2cwYjF5dmtEL2ZTSUQ0UTBjeDRUN2ZhNENxU2Z2RXUx?=
 =?utf-8?B?aGdmcXNLUFR5R2dMVW1hYUxDQ1hzYkdQRittQ1VmOTI0RWlqTkl6YWx2cnRQ?=
 =?utf-8?B?c1RTMTdtVzFPbHVrS1R5UEhhZXBOQnMrVUF4V0ZvSlMzdld4bzdKUEtqaGE3?=
 =?utf-8?B?VFhSOTZDMmhVQ2Z0RVRVODFjMGVwVW5MSnhGdHkyMVpyUWFhUjgxY3ppZDY1?=
 =?utf-8?B?MG05ZEM2bTlCV1hiVFVMeDdMUWFVekFSd3c0Vk1zVXhkbjZpZ29GLzFnZlZh?=
 =?utf-8?B?WFJzVkluSmpwdi9xTWRWTDNLNHo0aVlTT1A2OTJ6L2NkU1lFR1BhR1JSc3V6?=
 =?utf-8?B?SzNqQ0t6L2lGdDNScW1abmZOeHpzanFzS05yNE9FcjZma2tUcXQvZmhYb3J6?=
 =?utf-8?B?aFpTRkVqL3VHZHlrWlFOd2l1SDNYdkVheG1CRCtoSzB4ZFBoMUNGV05MbWtU?=
 =?utf-8?Q?mH1bPS4/7/SRUeBzWip9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ef6f9b-c215-4766-ac9a-08de3ed8e5ad
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:30:42.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEUPR01MB9383

The ibm_rtl_init() function searches for the signature but has a pointer
arithmetic error. The loop counter suggests searching at 4-byte intervals
but the implementation only advances by 1 byte per iteration.

Fix by properly advancing the pointer by sizeof(unsigned int) bytes
each iteration.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Reported-by: Junrui Luo <moonafterrain@outlook.com>
Fixes: 35f0ce032b0f ("IBM Real-Time "SMI Free" mode driver -v7")
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/platform/x86/ibm_rtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
index 231b37909801..139956168cf9 100644
--- a/drivers/platform/x86/ibm_rtl.c
+++ b/drivers/platform/x86/ibm_rtl.c
@@ -273,7 +273,7 @@ static int __init ibm_rtl_init(void) {
 	/* search for the _RTL_ signature at the start of the table */
 	for (i = 0 ; i < ebda_size/sizeof(unsigned int); i++) {
 		struct ibm_rtl_table __iomem * tmp;
-		tmp = (struct ibm_rtl_table __iomem *) (ebda_map+i);
+		tmp = (struct ibm_rtl_table __iomem *) (ebda_map + i*sizeof(unsigned int));
 		if ((readq(&tmp->signature) & RTL_MASK) == RTL_SIGNATURE) {
 			phys_addr_t addr;
 			unsigned int plen;

---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251219-fixes-4daa45346b5c

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>

