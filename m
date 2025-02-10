Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D6612CD8B
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Feb 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219430; cv=fail; b=u5AsabZeBolaNKKLKZJqksLvlQ7m/UQu4NfIqB9LfK4u3REla7EY+2ql+3HyMBusi1AsBMHH8wfSq8X7ZOR+rbRaCBX4rEESbqsUMMlEI1GYFMVSnf7D6vbqoSHmtuPIT+6eEiNTX861vGVNXrUGHVKUKOUU8AGvzQ342U5B+yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219430; c=relaxed/simple;
	bh=Mr8hBRhpIU0sq8mWt47b3fF3Sh8uw6wGY3GL2+jAGWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uRUVMtM6B+UF2o2O/tNswxZEOQbkCOhP+MXl9b6X4XtOEbK7wemV9sLxFNrWSX9BtgD8QWkBNBZfAwcvk4dX45LgovDQLE5WM3/jKbsnUEOPjx1/J9pE/sslJH54aWbq8pZqUsqls+rt2COqmHvIrpMECoRH22xr+pShjpjP+bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nLZSH6mo; arc=fail smtp.client-ip=40.107.244.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nLZSH6mo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHKaPsaawNXTEeEB1z1CswLuG5NcMjh1Z37KjOJUJYnmWyPL8yTCxgRG3zCLHevx4Tjda1eWabWL+90Y37UZStVsZD3aJM7IU04qAmOlg4Z7KRRsPTbu9nPT6/ovMDXEpk1ewLml3w0Ux3+EP8jkX1xJjDbr5JiN9okKjVmjCN86vCsWZ3VpZN9HWnopFc7c16N0vyWw7+IHNIagUANX01iONDursCvHvrZtM/WRGBbgUXNeJGGQfu7fbB6Dd3nKm3lfXyM+el/VLpYqEH1voh/OI8wksw+Dp6kQG/99THO38WkkOcBTdGIf7sbhmFJEQ7VkzPUQPl6dyLJV7mBu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mr8hBRhpIU0sq8mWt47b3fF3Sh8uw6wGY3GL2+jAGWs=;
 b=Mdjy9AI8NyuDWIbTQFGFksJUkPH7bjA1+qItYaD2q+wBrmCliC8pDClKL46Jv3Sehey/FzthHiEL84vurxAjesmAEM/LrXm/ZRzXtdSLET2HLveXYnqB5HxjToZi+SfhUvobg5E+67xeBAUOea/ijqDcTHDgNohpL9IFngcfFg6l39Xk/mqi73MO2UNWYRQJD+tE1h25chQ3DjrRGW0WESBonYZ/yysIS9DXA2aUXC0wRWtQzxtNxzlfqIHuOOEpUpMuiFAYS6m/8tEMeISY8lOfPOAilDGaAex5Dx+4ZTEvYdn3NTK8gFtQgwCoqGgrPtxZDAT/rRQYIOz7FptCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr8hBRhpIU0sq8mWt47b3fF3Sh8uw6wGY3GL2+jAGWs=;
 b=nLZSH6mojerA0/fWTFBRWnKwL6Md+R+8G5YBxilFWC1EtuKa0AwUjiUwOSyKJA8S7zKWlBAkLp/S4RlQNKOJHUKRm3rkASDJSOIag4KrkiBTXpGxKe+HLjwrbW3w98yWsXtTQ+hXXErn/Pb9OuC42HuUDgGwc5E6XEI55t4yvTe26LcuNlBkI4W2VfloFx/+IFg5ipwW3/Zq5DoZjPY3+wNRxDU+V4h6IRbOdSS1oZH4LshzBIJwRA414ubuJVuAphahaJ59qmvgdQGp4MWVJOKeSSlz4PSDdhG/pXze9oDOxcNkZk0qriVnte9NFHbpCqDaKUi34sTgqGDzWb95AA==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by BY5PR12MB4036.namprd12.prod.outlook.com (2603:10b6:a03:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 20:30:25 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 20:30:25 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>,
	Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>,
	Oleksandr Shamray <oleksandrs@nvidia.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v5 04/12] platform_data/mlxreg: Add capability bit and
 mask fields
Thread-Topic: [PATCH v5 04/12] platform_data/mlxreg: Add capability bit and
 mask fields
Thread-Index: AQHbboU85x0G5CEvKEyVeai0MFIpebM1qB0AgAtR3fA=
Date: Mon, 10 Feb 2025 20:30:25 +0000
Message-ID:
 <PH7PR12MB6668EAFC87E153C31A953B59AFF22@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
 <20250124172632.22437-5-vadimp@nvidia.com>
 <ec31c25f-cbbc-b958-88b0-aa686cd58cd1@linux.intel.com>
In-Reply-To: <ec31c25f-cbbc-b958-88b0-aa686cd58cd1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|BY5PR12MB4036:EE_
x-ms-office365-filtering-correlation-id: b138744c-0cad-48f9-84a8-08dd4a11c000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z1lwSmlNZUVramcxMThLZGtNTkdKck9NL25JVXlFcEV2YXdVbGNOQTlUQ1h2?=
 =?utf-8?B?VVlPTXlvaldEcVJ4U3Qzb3JNMzIyU3hxRHNpNFcyLzhFV2dCaUNlL3hLajdp?=
 =?utf-8?B?c0F4alJKOTBzNXNkbDBsOGVhbTZLRitzSzFSa1FzL29TSytGWWdySXRXSzZn?=
 =?utf-8?B?WGY4UVpvNjJDZHhrVVBlMnIySmZsaTF2eHQ3cjBrQmdPcmgzREFFSkFRR2h1?=
 =?utf-8?B?RllrR0tnckQwL1NHb2hwU29NR2RoaDdnN3QxNjRYb0d2ZFJmbFp2TWtjdFlI?=
 =?utf-8?B?NS9DaER5b21sbkRiUXdBcUQ3OS93NHR1c0JCZ3lXRk02MWRLU2VydksrcTFP?=
 =?utf-8?B?aVVtYnpSb1ZYWWdNWEJMMEZmL2g0OGp0TFlTQ0FnNzBaWDNudHF0RlkvWm5Q?=
 =?utf-8?B?eEx1M3EvWkZ6dm9mVk1waGUzaUEwMEtZM0l6SVYrUW9HaUlLa0hmb1h2SVlm?=
 =?utf-8?B?ZzEyMmQ3b0RSYW5CaUtubFg5NTFLUlRDY0xGL3IzTk1jUWxVR3N3ckZyUkNZ?=
 =?utf-8?B?ZnZzdXVtMnpSOHRFWjdsSlRIRUM5TkxsdUNqOExXSUk1ZjVIOUh5Rk9aNVQx?=
 =?utf-8?B?SC9Fa0ovdVliS3drOWhMNlNUcUF0bzlHcWxacFFWd2VQdUFTUTJNRmY3MGFU?=
 =?utf-8?B?NmJ3dG84OVdyUHgwUjJQaTI5NmpJNzJOQ3VVMHFHSWlkN2FFV2x1VVBoRWpw?=
 =?utf-8?B?SG5TRW1RYXNFRGNTQWFFQjdDbXFHVXo5U0xzYmNlUE1ZVFVEdEV5TVI1ckts?=
 =?utf-8?B?eFRwcG9TSkFiMVJFb0NVMnhGeDlIdlc2dUtydG1FVHIvNjkxdGNBTzVreng2?=
 =?utf-8?B?cjkwQ0k5cTJpZmRncGFPaHVMQWNxRWZPNFNFTENoZW1kd1NzcG9hRmtsU1Fz?=
 =?utf-8?B?cGdjdUZhcTFDQ3A4RjQzaFZrZS9BMTdBcU12V3VpYmV0YXV2K3pMZDY3QkVH?=
 =?utf-8?B?cXhFd0RITjkyc2NGaUFSMkxJUCtNSFZnVWI2ZjZxeWFJYmxRQjFVdi9EVk5F?=
 =?utf-8?B?bmVBSmxyZHJrcmZSVmJldGtta1MrZmhqRVhtMUhHSEFqRExKNVJGTC9ESXlM?=
 =?utf-8?B?NWVJY3U3bmsyTDNVRkNZckZKWVVvMXlBTDhPaEVFbXNySkZqdlA2L0VKMlR4?=
 =?utf-8?B?Z0ZGSUhNcThLODBGblUwZWk2T2RKRjRZb2JQTmc3NHI2TE0yUGNrMEhNY2g3?=
 =?utf-8?B?aDRNclRpcVpVelp5aUgzMW1CNHRjd0ZwMzMvWUJiazVtaVZaVjdPSGxlTGll?=
 =?utf-8?B?RVBMUERaaVJRQTdKUitBSmdhQTNWejlPeVlFeVNEbkJtODhhTHluNldLUHBW?=
 =?utf-8?B?U2UyU0Q3UWxxODhRQUVoYmxlSzFhSFJZSjhwcGxRTGxkcUhiYzlGc1M1MU81?=
 =?utf-8?B?UTRJejZLZGd2Q2tlZEp3U2dKVHc0dk5CY0JpVHZDUlJiaUhvdGt6Vnd5T1hz?=
 =?utf-8?B?a1VMbUV4UXVLVDhQYUFXbTRaWXlhblJSOXBlamlmZklLSldqM29YRlFUQ2xv?=
 =?utf-8?B?WUswZ2lKVDIzKzdwekp2eWVkcVJQYkk1TTAyOW01KzhkdGdlZUx6NUxKTzI2?=
 =?utf-8?B?bXhwZFJMVE53RHp6TVBwTEUvbWpEUEE5SUxpYnBVbm1Pb3hKWThsb1RXdHd6?=
 =?utf-8?B?VEJYd2U2SHpZWEgxOFZDNHlVTVhvcnBpUGtOSUtDenpUODA1UGlRTHhNcE9N?=
 =?utf-8?B?WWswRVM5cXA4b1kyM0dXZVBoQWJRRVc0QmVQM0FhM1owZkd4azg5ZWxpem5w?=
 =?utf-8?B?VStFQ0dnMHRDYkdheEdTakdEUUdodFpRRWM1UGliWVZ0cVk5cFhEc3Rva0ZE?=
 =?utf-8?B?R0NDSTRYR3Rqb21nektyUUFEcTNXdjBScTVsUGxwSEJkb0xjYVJmaTFzR09t?=
 =?utf-8?B?anJQeWN1dmJRa1FOOXJXcDVxbkZTaDNzbVRoQ25tOTdrV2xBT1VPNEhGbVBt?=
 =?utf-8?Q?MfYwpyptkLy7ESvHuOSRN2RWAbTGTfOB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0k4YkJjdW95V3NtVE1FS1FUdWhqbnJ4QitCV21pbFdtdzNKNWpyalJQM3hT?=
 =?utf-8?B?TURiYjE0ZHYzdnZFbmdrbHJFd3FLWHoyM2d4OS9qczNIZ3RXeXN0QlBDaTZ3?=
 =?utf-8?B?enVEUkNmRU9QQ3ZqVlFqbmJ0WkswNGNPdzMweGh2NWNtM3lvWE1IdnpjT2lN?=
 =?utf-8?B?clRvYzJwL0ZpdkpUaTZrMGpXOENXZURPTXhjNjVRQVBqL2J4VFd6d0ltN1Vk?=
 =?utf-8?B?ZTVTMkxZWmRKSjAxUGs1ZkNHdTBNendXWTlpOFNhdS9CbTdpWnkwbDJSOGR0?=
 =?utf-8?B?eU9qdkJ3dnNQRVlyM2pjbGNNbDQxa0RFdjhkUmxnbXc4eGRTUDdYQnp2NEtE?=
 =?utf-8?B?VlhwT0dhTkpGL01lVHM3ekJLSFNEUUpSVkJZRzNxeG5TVWl3dVJGSmpsbzQw?=
 =?utf-8?B?ZWgxQjkvRzNmbVVsOUZRTWVocmtFQTVQRnNTZ3FyUE9USzlzNHZ0Uk9SZkcx?=
 =?utf-8?B?U1BXemJXbE95Wm1UcVl2Nk0xT0hvMWFpSFc3UncxNE1JSlMwRUNqdnFCaUg3?=
 =?utf-8?B?NWRRQWcwWEZBWmMwNEl2emhadUlhMW5OM3lIN1lBemtoYXhSSHdDMklkZXov?=
 =?utf-8?B?eXU2Mkh3MnJLT2dxWGEyYkprdmxNZmZtenZraktZam1CbzZGTGRQMWovVW9t?=
 =?utf-8?B?RE5FMVdEZWJMeGlXbTRBbFlGUGwrcHFmc05wMGRWaXNLcDR6NjhzUWNHdmZq?=
 =?utf-8?B?Zy9TWFVwSFRaUVJvaEVJNUUxbjY1UmNlWGxuTi9UUUo2ZUFZWDR6Z3FCbTNt?=
 =?utf-8?B?cVVzK1p1allJaWI1OUhqbG9ISDJFSnVlazZwc1lwcXZWWTB2a0EvOVJZWlhv?=
 =?utf-8?B?bXN0STVVQks5QjAwNmoyQzk1T0FTQUczc1dOcEVZK0lnNk54ZXJIU3pJbEpw?=
 =?utf-8?B?eklET1lmWmNBV1M1YnVWWC9pc2hVUTd1MHZYc2FWMHloN05BT1NrbTlFMFZa?=
 =?utf-8?B?STBVS2tGNjU0YXdLY3UrZDBqWUxoanBBL3JObklNMGloVGtVaEo3dUJZbHZk?=
 =?utf-8?B?Q0V6bEhmWmlTaDV0QVJrSTE3M2ExSVpOT2V4UU03QThxVkFoM0c5REJkWm5w?=
 =?utf-8?B?S3cwYndObGFlYTFYSTJVb3RDRGl1Ykg2czdTR1VpbC9SSkhhTmFRRE9XVzlO?=
 =?utf-8?B?MjN2eWIrS3dBSURISU5NaXZEMFh0bUlCdUhlWkc0Z0s4VExjN2o4di93MGxP?=
 =?utf-8?B?TWtjZ2pKVTJaMFpVNjBGT2Vmc3haaHhIUnppMjIvaG4ySzRKWTRWNHRsejJC?=
 =?utf-8?B?QldITmoyTHdTWjhvblBwOVhUaXVYdHpyeHF1cktGZlVRSk5XSGVlRlNZNWht?=
 =?utf-8?B?ZHhHSTkzaEJkYTkzdGticFZ6WnVKT3pYdXp1d3dIM055Nnh0QWxGSTJzR1BV?=
 =?utf-8?B?VmFqejVvQUdURFhXZ2pQbXltSW1DaFNGS3p5OXczMURGZmNsdmF2dVdRaEhR?=
 =?utf-8?B?SzU4b2x6K09JTjZqNE92VWwvaHdOMkdjcm1lYjNlVEkwanBodHlKTThVcnM3?=
 =?utf-8?B?ZTBaV0Y5UnFHVlJlb2JMTXp0ZEtxYTh3bjdlbkMwYysvTFZNS09yVkh4amF4?=
 =?utf-8?B?TTJiZ3ZVS2NyMm51T1Yxd3V2YlBNNi9Zem91U3RvM2hjeFBiMC9EOVc4bzR0?=
 =?utf-8?B?eWR6Vlo0eGl0VnF4TnpoS1A5bUJXYmRyRCtFY0U5S3dRbTVCa0drTTRNdFVX?=
 =?utf-8?B?NmVEN3lsMlNvczVpelFZRmd5R3UvMTN5WWxBZUYvUkhaeEpXdENXVDRELzNw?=
 =?utf-8?B?ZFpDRitIM1krVEtjVllnOFNLbVFBTWIrMGtwc2h3SlhyQ2JNWEpPNDduZVRj?=
 =?utf-8?B?ODBWWGpPODJGdTh1bG4xY0xRd0szOHIrRnNZUUdlR1ZGQWl5MHR0M05BYldR?=
 =?utf-8?B?WUpqQ1RUOXpNN3RQNlBpOFVMR1NZWGVYMXlzaG43NmxqVDhvUktDQVU2SW11?=
 =?utf-8?B?Y0ZzWVRXVVBiREkyby96TTZQL1NpREp6RUtNT1BjMWVTRS9VQWUvNi9nVk5h?=
 =?utf-8?B?YitUK1l3cjhjS25acHdJZzdzTVRHU3NtT29jaEVndUFpbFhuemRYNFVrSUdJ?=
 =?utf-8?B?S3hseXlwendJSmVHVmZ2N1ppK0dWR1JibVBtazBOTGRGSGRUY0drTGlMRndy?=
 =?utf-8?Q?6qUU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b138744c-0cad-48f9-84a8-08dd4a11c000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 20:30:25.2594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXDAsBL2cY42nEE4aVEHfWI7ObHuZGtWMSYlo3N+q6oRP/aOqHpNcDsltr9fy/CBZgg7lP2o5PK3hftqvCHxyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4036

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWxwbyBKw6RydmluZW4g
PGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIDMgRmVicnVh
cnkgMjAyNSAxNTo1MA0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNvbT4N
Cj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBNaWNoYWVsIFNoeWNo
DQo+IDxtaWNoYWVsc2hAbnZpZGlhLmNvbT47IENpanUgUmFqYW4gSyA8Y3JhamFua0BudmlkaWEu
Y29tPjsgRmVsaXggUmFkZW5za3kNCj4gPGZyYWRlbnNreUBudmlkaWEuY29tPjsgT2xla3NhbmRy
IFNoYW1yYXkgPG9sZWtzYW5kcnNAbnZpZGlhLmNvbT47DQo+IHBsYXRmb3JtLWRyaXZlci14ODZA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMDQvMTJdIHBsYXRmb3Jt
X2RhdGEvbWx4cmVnOiBBZGQgY2FwYWJpbGl0eSBiaXQgYW5kDQo+IG1hc2sgZmllbGRzDQo+IA0K
PiBPbiBGcmksIDI0IEphbiAyMDI1LCBWYWRpbSBQYXN0ZXJuYWsgd3JvdGU6DQo+IA0KPiA+IFNv
bWUgJ2NhcGFiaWxpdHknIHJlZ2lzdGVycyBjYW4gYmUgc2hhcmVkIGJldHdlZW4gZGlmZmVyZW50
IHJlc291cmNlcy4NCj4gPiBBZGQgbmV3IGZpZWxkcyAnY2FwYWJpbGl0eV9iaXQnIGFuZCAnY2Fw
YWJpbGl0eV9tYXNrJyB0byBzdHJ1Y3RzDQo+ID4gJ21seHJlZ19jb3JlX2RhdGEnIGFuZCAnbWx4
cmVnX2NvcmVfaXRlbScgZm9yIGdldHRpbmcgb25seSByZWxldmFudA0KPiA+IGNhcGFiaWxpdHkg
Yml0cy4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBGZWxpeCBSYWRlbnNreSA8ZnJhZGVuc2t5QG52
aWRpYS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZp
ZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL21seHJl
Zy5oIHwgOCArKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL21seHJlZy5o
DQo+ID4gYi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvbWx4cmVnLmgNCj4gPiBpbmRleCAw
YjlmODFhNmY3NTMuLmQ5ZjY3OTc1MjIyNiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L3BsYXRmb3JtX2RhdGEvbWx4cmVnLmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3BsYXRmb3Jt
X2RhdGEvbWx4cmVnLmgNCj4gPiBAQCAtMTE4LDYgKzExOCw4IEBAIHN0cnVjdCBtbHhyZWdfaG90
cGx1Z19kZXZpY2Ugew0KPiA+ICAgKiBAbWFzazogYXR0cmlidXRlIGFjY2VzcyBtYXNrOw0KPiA+
ICAgKiBAYml0OiBhdHRyaWJ1dGUgZWZmZWN0aXZlIGJpdDsNCj4gPiAgICogQGNhcGFiaWxpdHk6
IGF0dHJpYnV0ZSBjYXBhYmlsaXR5IHJlZ2lzdGVyOw0KPiA+ICsgKiBAY2FwYWJpbGl0eV9iaXQ6
IHN0YXJ0ZWQgYml0IGluIGF0dHJpYnV0ZSBjYXBhYmlsaXR5IHJlZ2lzdGVyOw0KPiANCj4gInN0
YXJ0ZWQgYml0IiBzb3VuZHMgYSBiaXQgY2x1bXN5Lg0KDQpIaSBJbHBvIQ0KDQpBZnRlciByZXZp
c2luZyB0aGUgY29kZSwgSSB3aWxsIGRyb3AgJyBjYXBhYmlsaXR5X2JpdCcgZmllbGQuDQpOb3Qg
dXNlZCBpbiBhbnkgY29uZmlndXJhdGlvbi4NCg0KVGhhbmtzLA0KVmFkaW0uDQoNCj4gDQo+ID4g
KyAqIEBjYXBhYmlsaXR5X21hc2s6IG1hc2sgaW4gYXR0cmlidXRlIGNhcGFiaWxpdHkgcmVnaXN0
ZXI7DQo+ID4gICAqIEByZWdfcHJzbnQ6IGF0dHJpYnV0ZSBwcmVzZW5jZSByZWdpc3RlcjsNCj4g
PiAgICogQHJlZ19zeW5jOiBhdHRyaWJ1dGUgc3luY2ggcmVnaXN0ZXI7DQo+ID4gICAqIEByZWdf
cHdyOiBhdHRyaWJ1dGUgcG93ZXIgcmVnaXN0ZXI7IEBAIC0xMzgsNiArMTQwLDggQEAgc3RydWN0
DQo+ID4gbWx4cmVnX2NvcmVfZGF0YSB7DQo+ID4gIAl1MzIgbWFzazsNCj4gPiAgCXUzMiBiaXQ7
DQo+ID4gIAl1MzIgY2FwYWJpbGl0eTsNCj4gPiArCXUzMiBjYXBhYmlsaXR5X2JpdDsNCj4gPiAr
CXUzMiBjYXBhYmlsaXR5X21hc2s7DQo+ID4gIAl1MzIgcmVnX3Byc250Ow0KPiA+ICAJdTMyIHJl
Z19zeW5jOw0KPiA+ICAJdTMyIHJlZ19wd3I7DQo+ID4gQEAgLTE2Miw2ICsxNjYsOCBAQCBzdHJ1
Y3QgbWx4cmVnX2NvcmVfZGF0YSB7DQo+ID4gICAqIEByZWc6IGdyb3VwIGludGVycnVwdCBzdGF0
dXMgcmVnaXN0ZXI7DQo+ID4gICAqIEBtYXNrOiBncm91cCBpbnRlcnJ1cHQgbWFzazsNCj4gPiAg
ICogQGNhcGFiaWxpdHk6IGdyb3VwIGNhcGFiaWxpdHkgcmVnaXN0ZXI7DQo+ID4gKyAqIEBjYXBh
YmlsaXR5X2JpdDogc3RhcnRlZCBiaXQgaW4gYXR0cmlidXRlIGNhcGFiaWxpdHkgcmVnaXN0ZXI7
DQo+ID4gKyAqIEBjYXBhYmlsaXR5X21hc2s6IG1hc2sgaW4gYXR0cmlidXRlIGNhcGFiaWxpdHkg
cmVnaXN0ZXI7DQo+IA0KPiBUaGlzIGlzIHByb2JhYmx5IGEgYml0IG1pc2xlYWRpbmcgYXMgeW91
IG1hc2tlZCB3aXRoIGl0IGJlZm9yZSBzaGlmdGluZyB3aXRoDQo+IGNhcGFiaWxpdHlfYml0IChp
biBwYXRjaCA1KSBzbyB0aGUgbWFzayBzZWVtcyB6ZXJvdGgtYml0IGJhc2VkIHJhdGhlciB0aGFu
IGENCj4gIm1hc2sgaW4gYXR0cmlidXRlIGNhcGFiaWxpdHkgcmVnaXN0ZXIiID8NCj4gDQo+ID4g
ICAqIEBjYWNoZTogbGFzdCBzdGF0dXMgdmFsdWUgZm9yIGVsZW1lbnRzIGZybyB0aGUgc2FtZSBn
cm91cDsNCj4gPiAgICogQGNvdW50OiBudW1iZXIgb2YgYXZhaWxhYmxlIGVsZW1lbnRzIGluIHRo
ZSBncm91cDsNCj4gPiAgICogQGluZDogZWxlbWVudCdzIGluZGV4IGluc2lkZSB0aGUgZ3JvdXA7
IEBAIC0xNzUsNiArMTgxLDggQEAgc3RydWN0DQo+ID4gbWx4cmVnX2NvcmVfaXRlbSB7DQo+ID4g
IAl1MzIgcmVnOw0KPiA+ICAJdTMyIG1hc2s7DQo+ID4gIAl1MzIgY2FwYWJpbGl0eTsNCj4gPiAr
CXUzMiBjYXBhYmlsaXR5X2JpdDsNCj4gPiArCXUzMiBjYXBhYmlsaXR5X21hc2s7DQo+ID4gIAl1
MzIgY2FjaGU7DQo+ID4gIAl1OCBjb3VudDsNCj4gPiAgCXU4IGluZDsNCj4gPg0KPiANCj4gLS0N
Cj4gIGkuDQoNCg==
