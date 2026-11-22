Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.74.85
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795353608;
	b=vUzkR9CCSpJMxiPmfyXJRO8pRwK7p2MEXqp4lfc1cSQb/29JcxgQl6x+2J8S04cK0oeo
	 ruKYkF+F0e6KaPoYNkWBTJhWHwXyAi9J9+xWlBNneaWSNH0Vb+0kP5DpvWKrs5q/lxMv2
	 pZFcGYfYkuuMi5+KV3C86V48ltQa7l+UIQpSRItX3uudZXAGvzG30M9NwM6SfeY0e7Drd
	 CxGxmhtHu6KP3mEoBsUm1zKCqAPU75k+ykMFL6jnxKXiirzY75ATh67u2MtGWkU/9z//G
	 I+xQ/Xy6aUmPA1anJqVuBrZ/jJwUMLDZrLg4ZmhHiv1Gmhku+SZ7QosR7+bTSz4WTbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353608;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=iaBMOxdCUXXpoycTI6EJHvmGtrRjeWMwkYRGAKtdT0w=;
	b=hL1yRcLKm1HFQHQUAeIhgoVup04qJ/E0W7byFrjBJPoG6GEBFkFxPRab8cccGn8B7tjR
	 egxmk3qVmYZvwA9tWGtOthIBLnMVbh3PIdeS02uRs4RB7UJZ17YR0I5wW7gtCE77ikz5T
	 yLu8AzF/NY7UjUH4fSnySfG0BlH5zATAOw4O8oAk5NO8hj2xHWadhuzqrgNpnSsbLqZtV
	 rQ51TpCDFDBuGIq7xJ6gkJWJWNa1ovgHj4QRvYkiuQFXzbji2PXbvd03Sz79tl3dd2345
	 7S0FoXoY2KE/jTMUelUMJ2zmZSiAFEF/hz3+JSzmMVZnN+TxeT3srpl0o+Jj3SDpsZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MSWBZl4i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.74.85
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013085.outbound.protection.outlook.com [52.103.74.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA99606A320;
	Sun, 22 Nov 2026 13:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA99606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MSWBZl4i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy5vt5xNh31CwLaQhk6SVOashj++sC+BtunBYoG0XRZLqvG5VFVAEGWGmlXefl2LskLjTXmckkrHlZ3WY/HNfAaN31WlWe2uuSCrSuF2Ga4e2DBuntdO2hQbUOAtvuiJBaiude7B+LJFEsa3Sg2By1cPds5+UdR4q6+zJ+tQnEwW5+kKoBlvUhZmZUDATsvbC0pZn5aWUPj9ZcML1mj3X4naBw6AblI88DSiWUOGXdHFWxXbQHxs+vkuvQHTURxkJO/H/kZFuDBXZ4AV1RpRDmceSgkI/+G1go/z5FfPQZ0rMJNXv7tlrLuimurYl5JWpCZcVlCD++KmYlzrk5/3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaBMOxdCUXXpoycTI6EJHvmGtrRjeWMwkYRGAKtdT0w=;
 b=i8X04slx+IliC0XEpx7PlId24LD8MdEp1uNHvJ1B6QlFUU7UfddOtxuZ+dbtcq4C57q9XXyMuBr8lS9oFd9B53ry1P2D4djLP4tvoiXsDpVVAuv3vufkyCJ26P0pnsMMYRkh9NWhNDcNM/Igfy1JjtrxXAYL+ZSnaxDnni9HfWTI/Kq+UMo4u11xevPAqusJOwMRn2DCVD6cg5ZXBkHgFrVekMWFWjk1E/fkJ+A8SEv6Qh8meZCKPSTVtNK6GqbQnyb+p3143WAv6xQlNnn/jaMp6PbUidjDOcOXqp8kvcpJ3R6vNgkStRbHLZnY+jjYwk9vKMxy2mw3McWempkssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaBMOxdCUXXpoycTI6EJHvmGtrRjeWMwkYRGAKtdT0w=;
 b=MSWBZl4ipBiWylQWKuLYCJkZg0BfuoRpCL+/7H5MbkI1DIn3EKVPh9irceVfIrFFPAc4crsfgVDLxYOZzrYDB88DgK5QQgCThalnbF242wpF4TB6B7x0WPW8YCQX/u0GPwDcTGi3hzYQQrJK+Td6kCN0wfno8KvhbYAQVdKcHkfBM9HSO1nqaFX0gQb+nqRL5NABSxZiIW0dKYpWclhxIGXzJ6bny/eiuGJeSDVltvMX++yr3VTUWgg0jAplpZf02EAYlKOxTI2y8yMrXBA1eGwYLx1Jkt2cViVySEmtLTNUOcOymr/vTmUGv0PTn2cyQS/7/soTYYo7ALp+uvNLwg==
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com (2603:1096:4:1eb::6) by
 SEYPR04MB8997.apcprd04.prod.outlook.com (2603:1096:101:2d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 13:20:02 +0000
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9]) by SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9%3]) with mapi id 15.21.0615.009; Sun, 22 Nov 2026
 13:20:01 +0000
From: Shuwen Bao <baoshuwen2013@outlook.com>
To: ilpo.jarvinen@linux.intel.com
Cc: baoshuwen2013@outlook.com,
	emreleno@gmail.com,
	hansg@kernel.org,
	hello@kursatabayli.dev,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	radheykalra901@gmail.com,
	technosfan14@gmail.com
Subject: [PATCH] platform/x86: hp-wmi: keep platform profile alive on OMEN 16-am2xxx
Date: Sun, 22 Nov 2026 21:19:40 +0800
Message-ID:
 <SI2PR04MB58957F8A19D5E552E9BFB03CA2462@SI2PR04MB5895.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f7612110-b309-2c81-690f-0f43e0520ab8@linux.intel.com>
References: <f7612110-b309-2c81-690f-0f43e0520ab8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0177.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::25) To SI2PR04MB5895.apcprd04.prod.outlook.com
 (2603:1096:4:1eb::6)
X-Microsoft-Original-Message-ID:
 <20261122131940.17276-1-baoshuwen2013@outlook.com>
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
X-MS-TrafficTypeDiagnostic: SI2PR04MB5895:EE_|SEYPR04MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 440b9094-b4d2-405b-d329-08df489b4fef
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|25010399006|51005399006|260925184616899003|6090799003|23021999003|41001999006|15080799012|8060799015|19110799012|5072599009|25031999004|22091999003|1602099012|10035399007|40105399003|440099028|3412199025|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGdyWTJyMWxDMzdzOUs4VTZtemNmMkU3dytGb2pJUmFaV1JqUTVOZE4rUWE0?=
 =?utf-8?B?WExldVptS0g4QTlBVWE5aW10Y2RPUkMwM1Q2MHdTZjhjY0p1dUNaVldFUzB3?=
 =?utf-8?B?Q0s1NHJEN2tPRUpOWTJIeTlGSHh6dllvTHpmYU4zdEFza1FNTmZ4ZUlxT09l?=
 =?utf-8?B?cVRhanlmZ2g5Q1hwb25vcUdDclVJRkYvMmtRdXBxemQ5ajdST1IrWngxYk43?=
 =?utf-8?B?eHJnQ0V4YyswUWs3VTgwa3hNbUVkcEUwZTVXaERiZngySmx5L1gzOW82K2Fq?=
 =?utf-8?B?WDRyV2V2SUZJbWh0Z0k5VGhCVDZTTU1oOFoxUHFUeDA0cEI1eTZtT1RSWFA2?=
 =?utf-8?B?TVA4Rnc0Wkh3SEhXQXdUUVNWcVdGbU9rblZoY1YrZFZjbkl1RlVKZ1lpWFVK?=
 =?utf-8?B?SENuVmR6aWd3TGFISVJSTEw2eXg1Q29vYjBaOG9zeGN3eDljdGJvU3dyU2VM?=
 =?utf-8?B?QktkT2JpUEFwSGNRLzdiaWdVSmdhcFRQQTN6Z3Fpa2ZrOUxZQXBuSHBOcy9o?=
 =?utf-8?B?cjlhSmdEdUc0VTlqVlYzaEg2RldITk1CZHhwbHptbDlSdEhPK1VPcnFuazB2?=
 =?utf-8?B?Y2ZzRkQvcEhmUXhPSXBmdE5QUUVJYUJpVnlvaXU4RkovSi96Q2Z5Z3o0NFFk?=
 =?utf-8?B?TGlLMFpIUlZjaUY4T2xVaEkxeTdVNXBrdXZlZUlTTDR6YmNuUCsvRVp2emVB?=
 =?utf-8?B?elFXTjIrWUoyWHYzaVRoTnhKQkwrUUkzOU5mMXpqSCtSWVRRV1cyU0gwcG9i?=
 =?utf-8?B?aXJjNTIvOGJKWkc1Mmo0b2V0RXg3K21wUE5kN05nQytLQVB0cVJYNkZocmdr?=
 =?utf-8?B?SmpNazBoU2hSYllycDZra0VBVmIvWFNHL0c1ZFUwT1BEOHlEMWExakVZUHU4?=
 =?utf-8?B?YVVlUWs4d3lHcTZTV3dLcEl5S0tBMCs4QnlPOVBSb29kNHdUUkUrWmo3YlMw?=
 =?utf-8?B?OHpLZEJQWjFwcHI4WW80NFpZSzJ1ckRvRHdxbHRVZXFBKzQxdWhpRXF6RmJs?=
 =?utf-8?B?dG85dGFSQ2JYTnRxeVY3WlNzSzg3cmxpOHhwK0g2dUhwZUFzWUVXWFBvUjhz?=
 =?utf-8?B?ZEJTVEVMVGxjU3A2TkpTekNmSnd3ckF5azJ4SzNVdDE5aGhodm96ZkpyQlM0?=
 =?utf-8?B?SDdxVnRHRU82TjdML0VNMEd5OGxvSWFjSENLd2poalBSdG1waHZDV0QxRDdt?=
 =?utf-8?B?SlB5VGRVcXJ4TWNXeHFkRlZyS2RGdFVlQXduOG5VU1NxWHprVFJBUC9qdkYv?=
 =?utf-8?B?Y2Q5Wmt2d0RYenF2eElYMS9UQXlVWGlPT1liM3pBUXU1bmc0eDF1bHM5MVFi?=
 =?utf-8?B?ZlNEcnlMOHRSOWMrWk85ZWNoOGpxVXd2cm44QWhQSUxTQ3NIUzJrWWxaVW1x?=
 =?utf-8?B?cWZQS2gvUCtlQitROS9CNnlOUVNyWGEyYXZXdndoZGdVWUFCMncwVmI5UHJE?=
 =?utf-8?B?OHpESysvazdzVGdqS1hQWXRrYXdGdFQ5MUJ6Q0FBVlFFVjZvYWlPSlBFWVBu?=
 =?utf-8?Q?wRXt7kttdQvRJBbUOPVQ+tNDm3+?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTRFZ1pxQnZ5KzJXdjNTc2F4SnE2WmY0bFMyc1FBTlgzMklLbmcwR3lYRk9u?=
 =?utf-8?B?Uy96QjRMOVpFNWtrNGNQTVVFTkhRbUFBRTE0S1lIU1RLTlhXU1BwUzlSeFlj?=
 =?utf-8?B?dFBZVXEvR2lBNmJyTmcwS1dwdW1BQ2gwWndjWHdaVllLUGFKY0QvTlRQRTBJ?=
 =?utf-8?B?SG5MR3NGWXJwWGpBL0ZDQlVtZjhrS1Y1cVM3K1FIeWdIYnhBNkNKZWNyMHdy?=
 =?utf-8?B?Z1ZtVG5mc3Z1WkFBV24wRTR0UWgzZ0JNQ3pFdEZzMDR6YVh4bVhVcGh3SjNL?=
 =?utf-8?B?VUFGeit0TldsNGJDUFhaNUtWN3gyQU1LK0ZPTHozbEdJWVZHeFRWa1dSRTIz?=
 =?utf-8?B?Y3NwM2R5YzlpZFhKeGZDdlVMQTltR0dTZkd2MjZWeGFvWFFQV0hKSjZ0bnFn?=
 =?utf-8?B?SFpuMFp5R3N6djhxWWlYaWpQaW4xRUk5dzNJZUtDOVZVSWpRb0RQRThXbWRR?=
 =?utf-8?B?Q1JOYnZZNDN6akZQSDBTZUNLUUdBMTFOY1dwVVFNQmRMUTBicVJOdlFRZWpl?=
 =?utf-8?B?a00rNWZCVHZSTU5FZmRuOFNJZXJwd3FvTVNLSnBTeWk3d0pwbWNlcVowY0d6?=
 =?utf-8?B?TzFic1Z0K3pZdnUrZWpOdWVCOXFWMnNlS2JSVkJiUVkra0VDUmNPNlhrdkVi?=
 =?utf-8?B?V2RzS3h6WXhuK2NDazRMMUFkMFNNUnphN21qK0VzWVpjTmgwMzJvM1pPOGdl?=
 =?utf-8?B?Nkl6VDZ5bFdEcDU3RmgwQnJ4YXZxQks4eEUzTGNHdzdGUkJQQ1pMVlVDZEEv?=
 =?utf-8?B?R2ZJcGszSndlV0VSd1hWRFdLTlJUUEdKVGlVVjEvOWFOd1FpcXJ4OXluM1Ba?=
 =?utf-8?B?NGF3UjRoNjJVblVPVUNkZ0F2MEtRTFZVTkxYOEZWd2N0NGhGRUFLSTI0N21a?=
 =?utf-8?B?aGhicTRLZy8vWVNXbFVOcTY3bklXQWhZbk5kcEU2ZnVFMk1rUkFNYnhMcGt3?=
 =?utf-8?B?ZTA0a0pCY2lLek93Vi9IRkt0QkFsNGlxem5VUmFUcVFySzBSNXlTSkQyNC9V?=
 =?utf-8?B?RVRaYUpxREhMekJRUlBKT09PaSsveXoyOWlHT3lRRUdiMnZqbUdDR0lSa2Rl?=
 =?utf-8?B?UXNwNnFiR2V0YkdSMTd0K1lWYWg2eVV5dVFvcERaMDU5QmF6M3NrelI0Um5v?=
 =?utf-8?B?ejRGdW84eERyQ1RaYVp5em5PMmozOVhOZ0xNT2lnYUJ1N0lnaHFKZHN0dGx3?=
 =?utf-8?B?T2xoY2tJR1lIUVdOWkJhekUxbzZMKzJ3UjdyUFIzSmVYL0d2N25JK1Y0bzFi?=
 =?utf-8?B?NW9SS3poQ0Zxd01aMHpkRlVPbVIzR3JkZGtYYVQ3eHJuMG9pNnhocFkrdHVv?=
 =?utf-8?B?WmsySkVnRHZocDh0Z2ZVQlBLbERPNDVWSEVxOGVpUFhTNmZjSWhxVUFnVXJP?=
 =?utf-8?B?SXY0WEVqdlM4QU5INkNWYVR2YjJ3YjRXVVRCRVFwa1ptMzM5eUhPODJrZmRC?=
 =?utf-8?B?QzNiQzYxT0NEakhLNmd0eVF0U3RFazlnR0huTWpmTjBWK3N5RmkxU3k0SmhR?=
 =?utf-8?B?dmx1dzAyOXNlTVp2akhVSG9FMVVQcU5XYjJyLzNmWldPNXA5VGczcGVPOTZR?=
 =?utf-8?B?WGlTNitkODhTUGFkQm16QmRyYmVaQlZheGo2bWFzNVBjeVVNODlQMlg1Yzlh?=
 =?utf-8?B?SlNPeTVWLzFLakJOaXB5TjJmUVZRb2t5dXZrdnRxdnB6eGN6Q05sWUUzaDB0?=
 =?utf-8?B?SEVwV3BLYmpnUnp3RFh1TTB6L0ZvL2ZJOFc5enhHRFkrMXRTV3B4R2VVcWZk?=
 =?utf-8?B?aldCVXpTQytUaHFIeUlTbUZoQVFrWHRlOU03UXRXenZSV0xGM2RKREpTeGdG?=
 =?utf-8?B?bk1pN2J4K1paQXhSMjdzRHBVMk4vV2RLSkJ4T0dDTGdJYzJ2ckIvMFUyWlZs?=
 =?utf-8?B?elROWnBQWlBGQk90NmdrWUhsK3FQbHZ1b2pnWWFxVEozSFVRWE9xUC9TUURk?=
 =?utf-8?B?U0NNMGZuK2FWN1V4eWVxMmpxUE80OUIyZ0VhcWpHTkJyTzlLM1p4OGxoVGkr?=
 =?utf-8?B?MGlTRm5tNm9BPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440b9094-b4d2-405b-d329-08df489b4fef
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5895.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 13:20:01.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB8997

The HP OMEN 16-am2xxx (board 8F1C) embedded controller resets the
thermal profile to balanced when its profile timer expires, about
90-120 seconds after the profile was last written.  When the
performance profile is active this silently drops the CPU and GPU back
to their default power limits.

The existing omen_timed_thermal_profile_boards[] workaround cannot be
used here because it is only consulted on the is_omen_thermal_profile()
path, while this board is handled through hp_wmi_feature_boards[].

Add a profile_keepalive quirk to the board data in the central DMI
matching table and a generic keepalive that periodically re-applies the
active platform profile, well before the EC timer expires.  The
keepalive is stopped when balanced is selected and is restarted after
the initial profile setup.

Set the quirk for board 8F1C.

Fixes: 2cd10a35f3f0 ("platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards")
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://lore.kernel.org/platform-driver-x86/f7612110-b309-2c81-690f-0f43e0520ab8@linux.intel.com/
Signed-off-by: Shuwen Bao <baoshuwen2013@outlook.com>
---

Hi Ilpo, Hans,

This is a follow-up to the 8F1C support added by 2cd10a35f3f0.  As you
suggested, instead of extending omen_timed_thermal_profile_boards[], the
keepalive is now driven by a per-board quirk in the central
hp_wmi_feature_boards[] data and re-applies the active platform profile
every 60 seconds.

Only 8F1C sets the quirk.  The work is dispatched through the per-backend
set_ec function, so it is not tied to the omen/victus/victus_s submodel
paths.  The existing omen_timed_thermal_profile_boards[] handling is
untouched.

Tested on a HyperX OMEN 16-am2xxx (8F1C) with 7.4.0-rc3: with the
performance profile selected and a 150-second stress-ng run on all 20
CPUs, the maximum CPU frequency stayed at or above 4.3 GHz after the
90-120 second mark (mostly 4.3-4.7 GHz), with no fallback to the
~2.9 GHz balanced cap and no "Failed to refresh platform profile"
messages.

One question: would you prefer that the legacy timed boards
(8A15/8A17/8A42/8BAD) be migrated to this keepalive in the same series,
or is it fine to keep this patch scoped to the central feature-board
table for now?  I left them on the existing EC timer workaround to avoid
changing behavior without hardware to test it.

Thanks,
Shuwen

 drivers/platform/x86/hp/hp-wmi.c | 80 ++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0069af868..b22108dbd 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -154,6 +154,8 @@ struct hp_wmi_fan_profile_params {
 struct hp_wmi_board_params {
 	const struct thermal_profile_params *thermal_profile;
 	const struct hp_wmi_fan_profile_params *fan_profile;
+	/* The EC resets the thermal profile to balanced after a timeout. */
+	bool profile_keepalive;
 };
 
 static int hp_wmi_get_fan_speed_victus_s(int fan);
@@ -178,6 +180,12 @@ static const struct hp_wmi_board_params omen_v1_legacy_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params omen_v1_legacy_keepalive_board_params = {
+	.thermal_profile	= &omen_v1_legacy_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+	.profile_keepalive	= true,
+};
+
 static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.thermal_profile	= &omen_v1_no_ec_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -193,6 +201,11 @@ static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
 	return active_board_params->thermal_profile;
 }
 
+static bool hp_wmi_profile_keepalive_supported(void)
+{
+	return active_board_params && active_board_params->profile_keepalive;
+}
+
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
  * This was obtained by taking a look in the windows omen command center
@@ -375,7 +388,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8F1C") },
-		.driver_data = (void *)&omen_v1_legacy_board_params,
+		.driver_data = (void *)&omen_v1_legacy_keepalive_board_params,
 	},
 	{},
 };
@@ -581,8 +594,8 @@ static const struct key_entry hp_wmi_keymap[] = {
 };
 
 /*
- * Mutex for the active_platform_profile variable,
- * see omen_powersource_event.
+ * Mutex protecting the active_platform_profile variable and serializing
+ * platform profile updates, see omen_powersource_event.
  */
 static DEFINE_MUTEX(active_platform_profile_lock);
 
@@ -594,6 +607,53 @@ static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
 static bool zero_insize_support;
 
+/*
+ * Some boards reset the user-selected thermal profile back to balanced when
+ * the EC profile timer expires.  Re-apply the active profile periodically to
+ * keep it alive.  The timer on the known affected boards expires after 90 to
+ * 120 seconds.
+ */
+#define PROFILE_KEEP_ALIVE_DELAY_SECS	60
+
+static struct delayed_work profile_keep_alive_dwork;
+static int (*hp_wmi_profile_set_ec)(enum platform_profile_option profile);
+
+static void hp_wmi_profile_keepalive_update(void)
+{
+	if (!hp_wmi_profile_keepalive_supported())
+		return;
+
+	/*
+	 * The EC only reverts to balanced, so there is nothing to keep
+	 * alive once balanced is the active profile.
+	 */
+	if (active_platform_profile == PLATFORM_PROFILE_BALANCED) {
+		cancel_delayed_work(&profile_keep_alive_dwork);
+		return;
+	}
+
+	mod_delayed_work(system_dfl_wq, &profile_keep_alive_dwork,
+			 secs_to_jiffies(PROFILE_KEEP_ALIVE_DELAY_SECS));
+}
+
+static void hp_wmi_profile_keep_alive_handler(struct work_struct *work)
+{
+	int err;
+
+	guard(mutex)(&active_platform_profile_lock);
+
+	if (!hp_wmi_profile_set_ec ||
+	    active_platform_profile == PLATFORM_PROFILE_BALANCED)
+		return;
+
+	err = hp_wmi_profile_set_ec(active_platform_profile);
+	if (err < 0)
+		pr_warn_ratelimited("Failed to refresh platform profile: %d\n",
+				    err);
+
+	hp_wmi_profile_keepalive_update();
+}
+
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
@@ -2111,6 +2171,7 @@ static int platform_profile_omen_set(struct device *dev,
 		return err;
 
 	active_platform_profile = profile;
+	hp_wmi_profile_keepalive_update();
 
 	return 0;
 }
@@ -2492,6 +2553,7 @@ static int platform_profile_victus_s_set(struct device *dev,
 		return err;
 
 	active_platform_profile = profile;
+	hp_wmi_profile_keepalive_update();
 
 	return 0;
 }
@@ -2508,6 +2570,7 @@ static int platform_profile_victus_set(struct device *dev,
 		return err;
 
 	active_platform_profile = profile;
+	hp_wmi_profile_keepalive_update();
 
 	return 0;
 }
@@ -2703,6 +2766,12 @@ static int thermal_profile_setup(struct platform_device *device)
 	const struct thermal_profile_params *params;
 	int err, tp;
 
+	err = devm_delayed_work_autocancel(&device->dev,
+					   &profile_keep_alive_dwork,
+					   hp_wmi_profile_keep_alive_handler);
+	if (err)
+		return err;
+
 	if (is_omen_thermal_profile()) {
 		err = platform_profile_omen_get_ec(&active_platform_profile);
 		if (err < 0)
@@ -2716,6 +2785,7 @@ static int thermal_profile_setup(struct platform_device *device)
 		if (err < 0)
 			return err;
 
+		hp_wmi_profile_set_ec = platform_profile_omen_set_ec;
 		ops = &platform_profile_omen_ops;
 	} else if (is_victus_thermal_profile()) {
 		err = platform_profile_victus_get_ec(&active_platform_profile);
@@ -2730,6 +2800,7 @@ static int thermal_profile_setup(struct platform_device *device)
 		if (err < 0)
 			return err;
 
+		hp_wmi_profile_set_ec = platform_profile_victus_set_ec;
 		ops = &platform_profile_victus_ops;
 	} else if (is_victus_s_thermal_profile()) {
 		params = hp_wmi_thermal_profile();
@@ -2758,6 +2829,7 @@ static int thermal_profile_setup(struct platform_device *device)
 		if (err < 0)
 			return err;
 
+		hp_wmi_profile_set_ec = platform_profile_victus_s_set_ec;
 		ops = &platform_profile_victus_s_ops;
 	} else {
 		tp = thermal_profile_get();
@@ -2776,6 +2848,8 @@ static int thermal_profile_setup(struct platform_device *device)
 		ops = &hp_wmi_platform_profile_ops;
 	}
 
+	hp_wmi_profile_keepalive_update();
+
 	platform_profile_device = devm_platform_profile_register(&device->dev, "hp-wmi",
 								 NULL, ops);
 	if (IS_ERR(platform_profile_device))
-- 
2.53.0

