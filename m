Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113068;
	b=mtVKfmgBT4kc95XhIcvSFiaJUD4/o1bHXXWmqVUhmrqkXsL/H3l9PL0Gyxn7jmZrtjTQ
	 xsoXIYZW0m9gpYyjef5FSGGPWNR81gRFeARtikC+P7cN6LhMITPVVedzYqL2GpZab4De5
	 yk6ItU5Ia0x8KwjNP2L9vLBZ2yIno8jDHduYaoJife+oebwq6dWd+lwwRU460I81qCVB9
	 7d9mLdJtZsPXIGz2MT2qjVWcCNoz0mzI9ZuS0QyQWj2EVZVvO90SG7w4GptSNLVF52gAh
	 /lLzREnbyFtpoRuSG61yE2J+gu4+QjH9nsAMjfOMVq2qolQXaMiFNqogB0nyE509JQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113068;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:Content-Type:Content-Transfer-Encoding:User-Agent:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=9pXTygOOkKd/VSGD3kbuZ094eVfrWiWgiZ5xe3jXHiI=;
	b=eAz+bBqwXIOMEQKKF1c7Q6dMfaEjf+IvXVYLqdl1TgG8oAPeD9NiPe0LZFeJTQ2vmz6x
	 UQ/LJ949NmvcxwnVCgeVHRqT/JjE48GL/7xv75MAmnqrm2Ah2Mj9SfyWkwiuVOHFpGWi0
	 dvs13spEPtBUrKGM7igltzYGccb/ozLDRxIwlGsKsR93rP1QllOladTvDHhhnP303jFkV
	 qJB9QYFUsXWW4J2rFUpBhaSB+kDGBYR6xu7rOm1kpgmmjhlMA6uQRRAulJyeCCGyM96oI
	 RsFLTQVANBm3ll1VKTvukTEFyoQyrmfWfbqWohgjHdMpBckvUcVcjFsa3Y4TnJoLPGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=FhPllI39;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.30
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011030.outbound.protection.outlook.com [52.103.32.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33D9606A31A;
	Tue, 27 Oct 2026 14:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C33D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=FhPllI39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wtm068B7aS47zxH2OWDqrN0hfH1177DF9FEhq1u85T/PBO7jibKXrHTdXt+PqXT27jnkJ/GruFGU4OuctpF4GgH6hM6Ym9pWIFxgAWsUhT+++Cz4Orqkl6GfU1pmpazpfIecNCYNoTmuXOBJ/520tdh9DvJFnsEvgQM+R8XWLvs/XDtk0dpEWSGx9j7xgucl2lb/JxUlUlcngoqIQ7NB9g2dZgcMKglgp/t6r6wYy2XWeq7vHJ+RO9IAh5WE+3F07t6RJke2x1I8TK4D/OwuLy1FspdvBWOQFDaUzFhMqa3e6pH/vCQ/RTYDMuua5pjRtSqi04zjjeZaZd8s8WjbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pXTygOOkKd/VSGD3kbuZ094eVfrWiWgiZ5xe3jXHiI=;
 b=q0v6g2gfjSBSvRF/VX66Jtz8KBUWGjAzAKe7xlob0AZUvhrRjFfyxh21oE+4Wek7yaMGpvwSb7Ge+KGAxRbtwTzTtiWcvN7/JDV7PKDyg6/U7GY3d+GyBNGq0T8DO2xcorNGm6IQ2Kdin99AevYY/CA+VtQBRxDczLX44e6UkD4SnGW1n05F84WZrEcaRLv3tSXMW/RYFtgxRgAncPlJu2PKQXftHxJs7fnr/3jX5lecqB3jmo5WSOEGYJKlnRIYoPWhg2WCCuvpA1EZ9IEq0SzmnO7GaMTonc4QuZm3hJtafmddmOsMLYVhst+Jcn8ot3Zmu5L3G0jrOx6C4Kf/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pXTygOOkKd/VSGD3kbuZ094eVfrWiWgiZ5xe3jXHiI=;
 b=FhPllI39p91uf9hdQNjjobzlqFo8JcUsyHHEBp5UMlEu4n/IqOV6zBB8wRDqju6PLTzng31SMa+JVGDc4GJJk80fK21fBKWP9gHb0YJdRR/4FyxuPvRzAetKa5L63sHAgNahAuBEOemhMDYwlQEXAa5W18jrjzzDWkRGiDiGKaZZxY/SH40gNzCHXfU9n+hIiI2XHDCv9KrMNFptNPa1jrUiKwz+IqD3ZamV4isvTDlHaYfmTszEST0LxB787pJlKFcSgOw8Z76pyoaANm3YucEuAl76ytnq/SeG4imPfLkZjhykSvrf5UR6L1wiNaBNxylzoc0OKrXx6yGvx4Hr/A==
Received: from DB7PR07MB4953.eurprd07.prod.outlook.com (2603:10a6:10:62::29)
 by AS5PR07MB10545.eurprd07.prod.outlook.com (2603:10a6:20b:6c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:57:45 +0000
Received: from DB7PR07MB4953.eurprd07.prod.outlook.com
 ([fe80::4520:e35d:c473:a246]) by DB7PR07MB4953.eurprd07.prod.outlook.com
 ([fe80::4520:e35d:c473:a246%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:57:45 +0000
Message-ID:
 <DB7PR07MB495331F74581DA6CA9E18958A2602@DB7PR07MB4953.eurprd07.prod.outlook.com>
Subject: lenovo-ymc: SW_TABLET_MODE switch registered but no events emitted
 on ThinkBook 14 2-in-1 G6 IPL (type 22AR)
From: Pedro Miguel Vieira <pedro_vieira_pq@hotmail.com>
To: soyer@irl.hu
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2026 14:57:38 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-ClientProxiedBy: BLAPR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:208:335::22) To DB7PR07MB4953.eurprd07.prod.outlook.com
 (2603:10a6:10:62::29)
X-Microsoft-Original-Message-ID:
 <19c882c1e8c300ca02ba0d42d453bcbe68f91e32.camel@hotmail.com>
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
X-MS-TrafficTypeDiagnostic: DB7PR07MB4953:EE_|AS5PR07MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d59037-0db1-432e-40ac-08df343aa6fe
X-MS-Exchange-SLBlob-MailProps:
	vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkHpUkQGHikdweu28f4fhastbAoAPIq2nOkB/JJz1Y7nC0lnILHUi/1zPTVKER2aD+hgtJGU6I91JDLL7W8zW5TPz0Qkl5Zbp/9qF2sW1YZlA5bNXwcFl5FWJB1OKf6i6cnGWjEEs81H5mmD/lyqxlNqq53Pqf/uTiujyfr0l/tlxvbYbjho+Mons6l5/edqKajlqXo7/ngw90UMQWcM9ZCeXyXn9TEQ1w0OOLueYqIWRb46WeGY/BEMq0GJw914HhX+T/gMzaHUTOf51pgrpSkOk7sc0iNZYIcJlPg8OEg9gm4PceMlhdOiOlbVRDFFHI0A0Jif0iMZXtW17sqtQ6uIcBMBGvx/3D31HzpiM08tf1QqDpryXnzE9RNlevEE4Hrl4GaUWdPveEG+aeu/8JjdFRSexoT50heF/oE1pucvDnmnrZgUVeOctZeZfpleEm2kkWpZN5tADINWHEoqL/ETqdt7/CDGMM7KtYxOdRDq7EAO26t+7npu1Yg6cID4QFNSG4BKDrhbkNqwNpNozNw1rwVMnmXsP5biGf2MlBGpP4hZ/cWgEQwR6wmg+I6/iUTOBTzujmsmsOja+awUneOENiQThs0RNDXFgM6CyqkBx1Olw0i+F8PNFs1fqwOVfozzUqy4qCYESqle8lLURHup96O2kYdhT8GL6m9z/mGK1wRLT/qunh9ySALAzoyeGcFC6UockSnAtCva5jvy6KBbVhxdIttpFaDshpJGPJ+9M6QR/UNZTZ9FINdU2meca+oOFC5J4kv5SH8lrGCfbSg3E9/hKIDbJ8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|10092599007|8060799015|24021099003|12121999013|19110799012|4140399003|25010399006|20031999006|41001999006|23021999003|5072599009|39105399006|24071999003|15080799012|6090799003|25031999004|37011999003|5062599005|40105399003|20061999003|30101999006|440099028|26104999009|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um9RRjdQSnc0KzJveCtQSVdXK2VTbjRIU3VQR0VEWUdCajZYL0RDNTJuNFNY?=
 =?utf-8?B?cnkveko3d1cwa2RxTlVuRVlFQzZQelpHM1kzSU9KcU1sWHR3ekRHWTNUaEhO?=
 =?utf-8?B?YS84WGZPYWZCd0EyR1Y4N3ZDYmppK2JDcEpuZDg3d2poRjYvdkR4REM1TXh6?=
 =?utf-8?B?THRITFRtblZWN2gwMjRvL25hL3VJMnVTU0NHWThsR3VGUXVkK29NUExILzUz?=
 =?utf-8?B?cmQ1cHV3MHVhQ2k3Q1NaeTdWR2RhMHUrWXVUQnViZEdxNEJ2d3Zsa1lQSENq?=
 =?utf-8?B?eVdDV2o2QUl5ZzVtNU9YaWViZXFtU2pGTncwNE1NQkFKclFDeUdFTVlSdytR?=
 =?utf-8?B?RElZK1F3cEVneEs0Qm5WYnBaM2VoejdBV2xGd1MrTEZOcTBVV3ZFbXl6SEZI?=
 =?utf-8?B?ZzJpYlpIR2VpdWh0bUpoOWRvUG5wSjY5czVYdFpZd2lOVXUyTjlpQ3lQWHJq?=
 =?utf-8?B?alo0RmZlK0JvMXo0NFZLRHNnbGNaaHlIRTA1cjVIcHJqcFpKL3VrQmFwS01I?=
 =?utf-8?B?M0VvRitIL0VHRFlGb24yWVRtRUJ5d3d6a2hKOUtCdDFBTkRESVorUnllNTY0?=
 =?utf-8?B?eFVTb3dMZy9vQm1jN2J4cEk1Sk5DYmN2UFp4ZWg4NTNwdWF2U3FPLy9Ka0NN?=
 =?utf-8?B?VGp3SWJVbEd4TE1JQ1VoTjN3VUQrTWlaeFdNRC8yV3JXamNYRnVHSHQ5alh0?=
 =?utf-8?B?OU5QY3VIL0VoSWxOUllUVmtXaUNvQ1IvNmhXRjcxcEJySVBvK2g5Z0ZvNjJq?=
 =?utf-8?B?RWRhVzQ1N2VidEFLZUdKTGlCLzErcE1OQ21ES3FnS3lHeUo4cVQ2UVJsU3Uz?=
 =?utf-8?B?Sm9ZVGFPNFIrckdjdXNVVlVZdTNhV1NBQjFkb3E2d081eVJFSnYwUW90NXhV?=
 =?utf-8?B?dmtxQkJydEtxTGJ5QzZlQ1UweVhtTTYzeURMSFVqdjdNREF0eDZiWGUzYzBJ?=
 =?utf-8?B?alpZUnJ4TzNMcTZKRGQwUUYyNVVhUGMzOVJ3bWNLd0xlTlBxeWsvRFpReTVx?=
 =?utf-8?B?UkVIMlQzdzhwdTZMRW05TG9YSzEyTGV3MlhXZ3FKTXhQOVRaaVRJZEk5aFY2?=
 =?utf-8?B?Wm5STldFZ1VVQXlrdjdBeWxMbGR4TnJyYU1Sd2VHbHhXdDZSdFMwSzZGSWRi?=
 =?utf-8?B?Zm55SEFWekdiYmt3b3BjVG9WeU1mcUVZc2p4V2I1eFdqTjNFNEdKMVp5ZGNr?=
 =?utf-8?B?Vk1ZUnVHNU9MWkd3ZS8zQnlxNlYxaDBOTzNybDBYQWEzOXNvd1E1cHM0dTBy?=
 =?utf-8?B?Y2tTYXpKMG4zRjhLbm4rME1MaTlDWExSclVuSFVtNWUwL1p4bUxKQ0JwNTlI?=
 =?utf-8?B?cFNiWFlNN0xXSEx0NnNpYTA0bzV2MFlFK3JoTTY1YlJKZURocUw3dHFhd3cy?=
 =?utf-8?B?ZXAxRHI2SlFLYSs1bERLL3ZBLzNzVGdwOG5Qc2hSQ1VKbGFEdzk4Yk84a2VS?=
 =?utf-8?B?NWZKVVVMWnpJMzFxUkFnUUJSOGhIYXdLRjB4QWN4ZUtnbThKUFhoREhWQlNJ?=
 =?utf-8?B?RytycWRTM2JxaFZRR2JkUENySFhiUnFRQURrOCttazkrRGkvMjhESGdVVnc3?=
 =?utf-8?B?Q1JIcDU3cFhZODU1REtaRk1MZGdFbDk3QTVVRmxHVWN2M2FCdXlWYldqajVV?=
 =?utf-8?B?dzRaNkM5UVRNaFJRU0JKZS9FK215cXhaT0I3eThkZ01qUmk5blNaeHd3MitM?=
 =?utf-8?B?TUo3N0dwdExFNnZJMFlSRVJDOFRMUWs2RjFkUDJNVk1Na3Y0RnlrakN3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjRIcThOZjg2YTBUdXZ1a255ZTVMVHlyNGRNbXJTRlhBM2FOZTAwZjdvSlhk?=
 =?utf-8?B?YVVJc3duQmpYdnk4NXJrSGFUSnNQdUw1WmQvQjUvWTUyM1BYQjREbkpMRVF4?=
 =?utf-8?B?aXlFbWtndWc0b25HSHVUbmtWRkZLYnc5ellCZzE2dTVSY3A1SUxDd290Mlc2?=
 =?utf-8?B?a01sTTc0cUlySGs3Rk0rY1ZacGtGWEFYZG1ObGs5NGIyd09OMDBXWW54U0Fv?=
 =?utf-8?B?NDVZYmtlT1d0ak1hbDJiRW1Mc0RXS0cyYUN4REswcHFEb2RUWEluOTE3b08z?=
 =?utf-8?B?dnVlOU9tVkNyUVhSbU9aQm92REV5NTJUd1h1Q1VDV2xQOTlxLzJHOGpseEtC?=
 =?utf-8?B?aEVWdGN6c2VZeStSNTkxNEhOWm96RXh0VkttOGp1TUV0NDRDd2F4dUpzUGhn?=
 =?utf-8?B?TVBIZHhYQytNc1grSjQzU2Jtc0JYWnlKeTRZbEFTREtYY0xhbE8zL29zT2xx?=
 =?utf-8?B?N0tTWjZRY2dtK2NFU3QyTUFaWW9DY05jMXlJejNmTkFtZ2liaWJqUi9NOEE1?=
 =?utf-8?B?Qy9rTXNQVWxpdjdxY2piNnlhdXQ4U284dHdkTkRvTW1DMmd4ZEErUm5uWmdK?=
 =?utf-8?B?R3JVRjJYck1ZaGVkVGlPRll0R2l2ZkNLYmE4VnpDTjBPNExHaGJkdVo3NVhN?=
 =?utf-8?B?N0VEeUxnQUgyUUFRRTV4clBwZ00vZnBqSkZVbC9XZTN0TXVTcDJyNnp3TlVB?=
 =?utf-8?B?SkNXcUJ1MnBDekMzb1NQL0NHWis1ZlUzaDExcnZ6L0FSQWdYNDBCRXRlR3hY?=
 =?utf-8?B?bmk3Q2JoNk5Qc2c4SitHMnpnRjhKY0RVOE51NkNiMEZrODFCVVI5REdBR3FQ?=
 =?utf-8?B?S253WW5ZVWpsaHdyaDhMeTlIaDNuS0FpTTZyZDIvZjM2U2UyWUxSc2FOenVu?=
 =?utf-8?B?Yy9pYzE3anRrNTBWbFhRUXQ5WkcvN2lob0lYdUZiMUZSckN1RUFWOEEvVUx1?=
 =?utf-8?B?MVdpWjZ2UWFoaDVUdjFZTnk3cGRYS0VkOHREbUZuMWRHOXF6dHN2MEJOYnE5?=
 =?utf-8?B?em1pclBVWWEzdWJDU3JrL0haTVFaMm9aMVJPQWFMd3RhZzdXQUZVV21GUEFr?=
 =?utf-8?B?ZnREVlNPODdnUkthd25MT051YmcwZlNNY3JuNnE4aW12WXB3RytGaTNXTito?=
 =?utf-8?B?ZG5tR1dKZGJ3aUExRGs4RFhwdjlwK0IwVjJYd2l4S3IycUpieHIvaSs4bGJY?=
 =?utf-8?B?c0xFRklaWEszK1lOM1YzZ0NxaE9jMEJIVWxTMWZDOGo0Wkt2R1F3eDNLWUZ6?=
 =?utf-8?B?bXF5eHdOWkFlWWQ5eC9jUndaTG5zRE5QNHlaS2ZHZUQ1aU51emFvK3lQbFBC?=
 =?utf-8?B?ajN2TnZpbnZpc2FGaXg3TDhta0dPRC9NNFB1aFBBMFpQQlIydTRRUGNQZXJ0?=
 =?utf-8?B?MkoweVQ2amtNaElWODFRTHByZG9UalhRZVV2c1JZalM2V3d5L3IvRnpIUzBh?=
 =?utf-8?B?NFg0eUtIRkZiNnRNbWh2Y2xtT3FhQjFJZlRNaDE2Rkk4YjdjZGVoWnZOVTRS?=
 =?utf-8?B?YVc2ZmIrMmNoYy9CWmxSM09oeVpGWWZsQ0hDY3drZ1NoUWtCK3ZRbko1cWYx?=
 =?utf-8?B?TVpCeWw4MmNLMWF6YjZRZHR1eXZoTUZsY01RZnhNMVk1ZGllaFh2K0lZUzNj?=
 =?utf-8?B?c3d4Y29CUHQwRlc4TjFkRmN3aWt0enV0aDBuZjc0a1k5cGw5c0xpNzhsYlky?=
 =?utf-8?B?YlppOHZaV0djajZnTWo4VFlMc0lFQTV5eU5DelFQQjZTaEQ2NE1HdEczY3ZJ?=
 =?utf-8?B?enY1bUZNZDhJNnkyMVVpOUtHcERmbzd1b0tsSUdxdnA1OHFGclFJV29RRElH?=
 =?utf-8?B?VHVFUmgzVGNlYzBabXpZSDdIT2RpV3RMMmNGQVVWRTF3bFlESnRUQWVXSG1P?=
 =?utf-8?B?SEMvTmZZSUNoU2pVcVJZbmg0aVBYUzNoTnlsVWp4L3hxQ0E9PQ==?=
X-OriginatorOrg: sct-15-20-9343-9-msonline-outlook-edc25.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d59037-0db1-432e-40ac-08df343aa6fe
X-MS-Exchange-CrossTenant-AuthSource: DB7PR07MB4953.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:57:44.8423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB10545

Summary
  -------
  On a Lenovo ThinkBook 14 2-in-1 G6 IPL, the lenovo-ymc driver binds
and
  registers an input switch "Lenovo Yoga Tablet Mode Control switch"
that
  advertises SW_TABLET_MODE, but physically folding the device into
tablet mode
  (and back) produces no SW_TABLET_MODE events. As a result GNOME never
  auto-disables the internal keyboard/touchpad in tablet mode, causing
ghost
  key presses and cursor jumps while held as a tablet.
 =20
  Hardware
  --------
  Vendor/Model : LENOVO ThinkBook 14 2-in-1 G6 IPL
  DMI product  : 22AR
  Board        : LNVNB161216
  BIOS         : U1CN09WW (2026-05-12)
  Chassis type : 31 (convertible)
 =20
  Software
  --------
  Distro  : Fedora 44
  Kernel  : 7.2.11-200.fc44.x86_64 (also present/affected: 7.2.12-
200.fc44)
  Desktop : GNOME Shell 50.6, Wayland
 =20
  Driver
  ------
  Module    : lenovo-ymc (drivers/platform/x86/lenovo/lenovo-ymc.ko)
  WMI GUID  : 06129D99-6083-4164-81AD-F092F9D773A6
  Maintainer: Gergo Koteles <soyer@irl.hu>
 =20
  Evidence
  --------
  1) Switch registers the SW_TABLET_MODE capability:
     /sys/class/input/input44/capabilities/sw =3D 0x2  (SW_TABLET_MODE
bit set)
 =20
  2) evtest shows the capability but NO events when folding to/from
tablet mode
     (folded the hinge several times; "Testing ..." stayed empty until
Ctrl+C):
 =20
     $ sudo evtest /dev/input/event18
     Input device name: "Lenovo Yoga Tablet Mode Control switch"
     Supported events:
       Event type 0 (EV_SYN)
       Event type 5 (EV_SW)
         Event code 1 (SW_TABLET_MODE) state 0
     Testing ... (interrupt to exit)
     ^C
     (no SW_TABLET_MODE events emitted while folding)
 =20
  3) dmesg shows lenovo-ymc binding cleanly (no errors), creating the
device via
     WMI GUID 06129D99-6083-4164-81AD-F092F9D773A6.
 =20
  Expected: folding emits SW_TABLET_MODE=3D1, unfolding emits
SW_TABLET_MODE=3D0;
            GNOME then auto-inhibits the internal keyboard/touchpad.
  Actual:   no events ever emitted; switch stuck at state 0 regardless
of hinge
            position; internal keyboard/touchpad stay active in tablet
mode.
 =20
  Note: the machine is a convertible (chassis type 31), so it passes
the
  "only bind on convertible DMI chassis-type" check; binding is not the
problem.
  The YMC WMI query/notification path does not report tablet-mode state
changes
  on this model. Likely needs model/variant support (or a YMC WMI
method/quirk)
  for the ThinkBook 14 2-in-1 G6 IPL (type 22AR, board LNVNB161216).
 =20
  Happy to test patches and provide an acpidump / WMI method dumps on
request;
  this is my daily-driver machine.
