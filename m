Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735412BF003
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Jun 2025 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084153; cv=fail; b=arcHcK2taM3fxWoX7gA1/M3aIMK3Ihjo2Rjm4MG7NKs2fRES8K1r38qEE/lBRGEvX3vRkSkuwD4fWQ06v7DTvkK2J0zVNfwJxWf7ZtAFVsoGGFipsOoMcW5qqOgJTuHp9aSt2cOZ5h2w2J5rQ0hAWIsz7LsyH/pfFJZStLxzt10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084153; c=relaxed/simple;
	bh=xvjPgJVG1x7wMXqCqf/c/zQjf1mw3JWc49fTg5Wlq4M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FPzxj28BdWTy//SEKdLdodcWZNIQ0ydeLOazdc3qfQJ4B027TRXZmKhy7JXKupRVqJD/qv/nxaIIu2pweL/wcylDGUijjDZJeNB1na6fDguLqMwjCfXkLYUmYsgR36btqiElZV9zeQtJZgWs24+vRJq+Ts95MUqyuP1502ALGwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UdE6IOjg; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UdE6IOjg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lU77IhjC5LVwCW1q0853g5HQTf54KXytNYZBbPbkjqChlCJBv6er5tqCdZBGB2YUErt1HnbkXLY7HGgeS3c09twQM5W9oBOsrjbPcNdDyXt9O5Sz+keiF87FA/ylkwStyCPEWRw+Bl4ZLUIdQBjNXmsI7JNNLysWSe5E3frSUoGhyfnr3EfHXIFnmvaAyZa8TWk4I6/f861A0XNjWvF1tBvlUeLr/uE+P96K6YVO9ogJWbWYkUzalCpfV/KLLLnM9YP2ZvWwKoqFi46IWAxQcspA7w9NnN+U1OesorNd419ZZAgxtavDV5qc9CVRMaU312XF++qxVOBYwwTM+GUBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvjPgJVG1x7wMXqCqf/c/zQjf1mw3JWc49fTg5Wlq4M=;
 b=YNKvLhd1hmNzGhYfbw4p2DtDM5Tu6xWAkjfanwVyrigTG75AK0dJBSqd035LnvHmr/uXbv0j9QcTwAQ445C3hAgHhFT4hTgFzXx1TpZmAxctfXm7JdDgE5cKFb4RQWNYMX7+ZrHTod8Hc+YjYCeG8LEOyx0o098P99a+1gt7ZhGqD9iSGCIxhEVsvJoXtllvdgEho3WF9G8k9wJ7Nx4Y7RaBuarkV3o6Y0887FPTspjQtBb76TXrWpfy6pwB+zBA1UXh/eYijeUal05e9TVikMKiMn8GCDuAsML09NoTWhnCG6ElPhEx8aoxg9ifpE94ScvS3lg1uI0sm9uOZVTlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvjPgJVG1x7wMXqCqf/c/zQjf1mw3JWc49fTg5Wlq4M=;
 b=UdE6IOjgTAujUQCBgSbYt9n14F3/z6RybjLofZ8Aj4qsla6ggJyjh6TyI1gL7kml9G/uO8HPmbLOaEigw0k1dtJpc+Jp9vyWvs3nApC/c7gQODHtGPMbJYM44oktMtJp/ahaYGPEvPn2+ThdrzvRWp3rsMcMLrweEsVACy5IBEg=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 14:29:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 14:29:08 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Hegde, Suma" <Suma.Hegde@amd.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "Chatradhi, Naveen Krishna"
	<NaveenKrishna.Chatradhi@amd.com>, "e.velu@criteo.com" <e.velu@criteo.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Improve the print messages to
 avoid confusion
Thread-Topic: [PATCH] platform/x86/amd/hsmp: Improve the print messages to
 avoid confusion
Thread-Index: AQHb3FnEtLECNmxU3EGWedznbs5M7rQBLwUAgASZJgCAABUqgA==
Date: Mon, 16 Jun 2025 14:29:08 +0000
Message-ID: <43764072-617f-4d89-b513-ac5401a191fe@amd.com>
References: <20250613114445.1665728-1-suma.hegde@amd.com>
 <d5867166-f0e1-42f6-a34f-4a7e33b71b09@amd.com>
 <03da9b39-7bde-43c4-b1c6-4aea871a4ab6@amd.com>
In-Reply-To: <03da9b39-7bde-43c4-b1c6-4aea871a4ab6@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6965:EE_
x-ms-office365-filtering-correlation-id: 89e673ef-58ce-4c61-188c-08ddace22778
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RnlzQncrK3dUK2hwdkFMbGJDMWRFVTduamd4UlZxZC9mQ1NFMDdEcUFSYTRn?=
 =?utf-8?B?SmI5a3ZKUHQ3QXRPVVRIaDlQRktRbkNIdUpmUUVRY2NjaEVHL2ZqRGNoeSs2?=
 =?utf-8?B?THQzUkFsQW12Y2RCbUsxenpNRDR0ZGRCaG9ackRicnpwRXVvNm9EQTlua0Iw?=
 =?utf-8?B?aW9sU21FNm5UMEp1RGV0dXlHSGJYQi9NdnhDLzEwSkVFNmlXcE0xZG1OR0tj?=
 =?utf-8?B?d29EeDRqejgyNVFNZ3E4TFB3MXpmY0dLKzh5NVI4alB0T2taeHhPRnRDdHVk?=
 =?utf-8?B?UWJpdStTZkJUR1liRVo0WkZWOHNUMmVhUUo2QUxpMlZ1VG9sNzhTT1M2Nytq?=
 =?utf-8?B?eU01Tnh5TzY1SGpQTk5zY1UyZmljT0tlbUE0Y2FZUFp3T2JFTkFhaWdybmRy?=
 =?utf-8?B?bEo5NW92ZG56TWZWTGs5Tkd6M1hsbU5NNW90Z3VPV2Jmd3BublI1QU8wamo0?=
 =?utf-8?B?Uk5BSGFBTGxSak9iK2ZsMGJXYjQ1T01QeWtNaHl6cWJWZTdhdTg5NUNOOS83?=
 =?utf-8?B?M0dGdGg1Q0duMnA2WDVGZ1BzenF6bFplTWtVSFlEMkE3bHJZWVNSRUI5U2pH?=
 =?utf-8?B?dHhhUWtYSk9HVmtIay92OTZGUkJnbW1yZWNTd0pSeElOK3hSL2wwZkk1Z1c1?=
 =?utf-8?B?VFpqTmo2Nmo0SmVzbWFYRFZqNEJnZEVnNjZBNS9PTkoxeVZkU2lQT3BBOTRY?=
 =?utf-8?B?YnZkSVdDTTQxT1RWTm5KRkF3SFJpT0pCV2ZNTWNwLzdva01wb1RnNjhyZ3FM?=
 =?utf-8?B?azhpYXNCa3NGWXkvZ2lua1RBSldWeTNieDZZcjAzQkR5NFNZbFFHM3ZrVWpV?=
 =?utf-8?B?L08wZzBtTGJrMzh0TUg4NllzaEt2MG1xV0dJNUZuWjdxVEZkZklLWDMwdGhO?=
 =?utf-8?B?MnR3a3BDS2RieWFkMzY2bWxqbC9zQ0JjYWhPRXJqWnlEaHNjRU55YnErZ0tw?=
 =?utf-8?B?eUlSS2hoa2hMb1h5SHVZZEdDQnNyNklYd0FtN2xXNTVQc1Y3OFp1ckVtVmNp?=
 =?utf-8?B?Qmd0ZHRxR28rQ2xrUm9LZTl1UDFidjRPbFdPQ2Y2N1J1eTRrTndtRFp0Z2Z4?=
 =?utf-8?B?TFBtL2ltcXpnWU9hdjVIL284OSsxQ3FBR0h1RzRpdTZKRXpzekNFVm4zYTBo?=
 =?utf-8?B?TGlpdytmS3VCOGJ4N2lWSnJWTWRGWVlsTDJRM1pFTGVnUFFmNy9sTlJKcitZ?=
 =?utf-8?B?QzVFSUZmSDNDU0labUZtZC9MaksxQk0vLzduVEtEQSsrSC9IaE80SDRYYzBs?=
 =?utf-8?B?MzBNQ00wS2xmbWNiSm90cGhPT09WV0U2UmNrMU9SUDhuaXcxT3VEeHRZN3Bu?=
 =?utf-8?B?MHJscFk2S2tYblpPTjZKR3dBU0IzaDM5Y1FsemJsRjlBc0cvVDF3anUydE9q?=
 =?utf-8?B?T0gxblErTEE4ai9ESUwwUlJ2YzlBUlhDMXRsTS9Cbld0VGN2NHA1UWltSWkw?=
 =?utf-8?B?cnFaQ0ovM3Y2Nnd3djh0d2hSallkNi8veEo0MUw1bFpqU3l1V2hSVTQ1dkY4?=
 =?utf-8?B?ODd4Z3k0YnY3QWxpdFJPTTlNWkpHeHZiRzhuNDFsdllXTmF6YmhBMlUrSFhB?=
 =?utf-8?B?dkcxS1JEdEtyNTIzRlloemxCaW9HMy9FeU1qTUU4MzY2TGhRdWFuK3ZBZkhw?=
 =?utf-8?B?MWZxMXRIMi93aDVqV3hVd1JCRmdZSFhwejh2UTFwV3prcU9UaVJ6SGUvRWRu?=
 =?utf-8?B?OHE5SzlVRnpNazZmSWZuWnFTYklHU2tVRzVJU2ZqQTMwNXBPOEd6RTdDWHhJ?=
 =?utf-8?B?MlhVbXdlbmFOTzZmQ3pVWW41RHVoZkVZQ1ljL3k0c2w5enFOZjBUZ0tCMWZa?=
 =?utf-8?B?T0NSU1hxejdCRW03WEZYeHpTY0VRWkhNTnJ2Mzg1NVlyMlNnSmNvamtNQ3Zs?=
 =?utf-8?B?WmFlWloySWtEM2NXZHRhdEJhOHhlUVJVcVRmM1FvR1ZkRjBmdnNCcWhSMG5r?=
 =?utf-8?B?WkREM1Q0RXFScVRTS2pSYUx2a2dCWDUwMUNqY3Zad01sUnE1TmxNcXRPSTdO?=
 =?utf-8?Q?rIl6osM3JA0gHVL68bLo2MdKhB7mc0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0RaeHJMempmc3hBeXlPS0NmdTI5ZnZoNDBHMkZ2QkNFOTdtT0phWFROQkts?=
 =?utf-8?B?dkJzMzJxK1lpRjdlazZkbUpvQm42dDJ2KzlBVjVvbVkxeW9oNWZENzFjaG54?=
 =?utf-8?B?dVFMR2MvTXc5N1Y2UG9SaGdUeHliSkNpWnAyQXpFNGc4MW1jRVhVTy9FVlNp?=
 =?utf-8?B?UVpVMjJGM240dU9vb3N1NzN0YXRTM05nRE1XTDNxVlJldUJtSDY1YVlYTjE1?=
 =?utf-8?B?NytoS1NuTFMxdHVzb3c5eTRlMHVWZnJodmRXRXJnTElGb2pnOXRveEsxa0RI?=
 =?utf-8?B?SmdLZVlYNkNIODlabVQvakwxR2lNcXZva0E5L2pPcFJ1Y3lFcG91WTVXeXFs?=
 =?utf-8?B?QUZpVDdiZjBjQ0pzdnVCQXJpcERKUlRXYWZTS1k3SkNxNzNhZzZ4dGdkN214?=
 =?utf-8?B?NVdDNVdMdUtkVEpNblphOTVtaEg4TktmZHdCM0JJUWdnTU9uZ1lqRXViOWhY?=
 =?utf-8?B?V0w3Y1BOaHV2bXdSN2xpMDhNMUhrZjU3Vk9xb0NEdHRlOHlvQUszQzFVM0pL?=
 =?utf-8?B?TlVveWluNStIM1doY1hEWXdjSzhLUmdsVjIrNjVqKzBEcHR6dXY3ZDg5Q0Za?=
 =?utf-8?B?c1RoU0txSitqR2JtL1NWSExrZ1pxbUQ1UDB4ekd3SDV6WjdpZCt6cUtlNWxz?=
 =?utf-8?B?NGtaRFdXdGswdFIrWkRzWkF1RnlpUVBnVHNuVk5JUW9FNFlTUytqelFQRmNh?=
 =?utf-8?B?NjVjR2ltOTZINS9wUEFpd3doaTdORlIrSDEwMW5PR205RU9zcDR5L3oxcW93?=
 =?utf-8?B?KzBiOHlGa2xobEUzMzFlRmdQTnJjZVlTcitGQXZEc2NDblV6NklwdnBTOEJo?=
 =?utf-8?B?TDN6dm5CeTd1SU5TSWVIUnFQdzQxZ1BQdzZxL1BsWnNHa2ljVXRWclBsZmxT?=
 =?utf-8?B?YVYrNFZuQ3MzbFo4YjlpSUhtaU83SEM1YnEyZDBOL2o5cVA5cWFCK3RIek5s?=
 =?utf-8?B?M05SWFVMVHorYWw0WlpwY1FXY0o3SEN0L09jMTFQblg3RFc3SFNSeW9hTWhv?=
 =?utf-8?B?RFoyL1AyVWlaTnVTOGVta2RQL3NSL1dNdUt2V1RxdjdvN2tWVHFaNFVpd0ZZ?=
 =?utf-8?B?Mm81ekZBQ3JOMzlBd2J4N0dBNjdoV1ZKMmhCUzhTZG40RTI0dTh3NkxodWF6?=
 =?utf-8?B?NGI1QVlqeHo0Q1ByaFBkYi8vamlwOHd1aXo4d25xZXJQcWVOb3o0ZHlLYnhX?=
 =?utf-8?B?anFqQVRERXkySmRWblVJNUpTU2l0MHVCQVZ3MncybWJyanBWOGREKzU1NXZH?=
 =?utf-8?B?YUR2aWpiOGE4ZVdUaFNWQ0hhNzR4Rk1GM0hHSGxxVnd4anpJam5uYnRjdC9Y?=
 =?utf-8?B?S3pGNmJ5eFhMR1NRekNhaTVrUm41bDBNU3d3RXBVWk1pcUhBK3dIcGFidWFx?=
 =?utf-8?B?RVhnQS9uMUx3dTV0UE42UzI4SUwwUzVVcE1wNkx5RjNEUVJaQ09IckcwVU1H?=
 =?utf-8?B?ZVFYalpwRVNCbklnYlkvc29ITmJkWERxSExyaU8yQVNsTnBobHFPZFROaWpM?=
 =?utf-8?B?RDUvaDUrRnM1MGFXTWs1L09vb1g5ZGViOHVwTWRXK3l0eXcyeFVUa3VVZGV2?=
 =?utf-8?B?NkZ1Nm5PSUlQcXJtNG1PVzFwdWVRTFhxcUdZMFlGRXhVWUVpQXFHYldIZ1NG?=
 =?utf-8?B?TmZxdkp6ZldnUGtWUzZVbUREUmgrNFpBWjNXR0Z4c2FBaVhCTGNxR3oxTkdK?=
 =?utf-8?B?QU1RY2psRGZBbnQ2ZEkrdVJMcStaLzg3d1ZpNG55UzVRUy91blo3dFF3YnZh?=
 =?utf-8?B?VjBORWQ5Tml1YlJlRDlxaE9WaXE5dExvbTR1OXBsZ2tUemlnTCs0Qk9GcVRG?=
 =?utf-8?B?RXlEdENSV1N4V21Gd0hDRlBPZ0xvajZFZHA0SEh0OCtrTFlnUTBlNURCaXNU?=
 =?utf-8?B?NWdoZVFJalZhSGxrUHFPb1BpQjdLcit5Vkh5MS8wcVNqRGlSamg3K3pseXc5?=
 =?utf-8?B?Ky9mL0xNNXRhVHYrYnRhRzNid0tvVGhNYUpoUUZncDg4T2pLT0crdFVYUGZl?=
 =?utf-8?B?S2dTU2J6STNPQmFUeGExbjlJTHkwK045OUdBVXpXTVFlUnl6SWZXSTdYUTdo?=
 =?utf-8?B?aG8xS3JhRllzWDNESUpjOFFUb2EwQ3ZVSEJrL01UQWxSTWMyVzIrcGIyRDRG?=
 =?utf-8?Q?SHQc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9501CA750DA2A74D9F0C5126B3B57F82@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e673ef-58ce-4c61-188c-08ddace22778
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 14:29:08.0613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGR5O9fxsGHhiQwFjjzuBckd6E/FfCYxi8hKANo+L+7xQWD+DnI9oM0kw1KKmL5lIPnupcjnqLUEZTaje+gYEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965

T24gNi8xNi8yNSA4OjEzIEFNLCBTdW1hIEhlZ2RlIHdyb3RlOg0KPiBIaSBNYXJpbywNCj4gDQo+
IA0KPiBPbiA2LzEzLzIwMjUgODozMCBQTSwgTWFyaW8gTGltb25jaWVsbG8gd3JvdGU6DQo+PiBP
biA2LzEzLzIwMjUgNDo0NCBBTSwgU3VtYSBIZWdkZSB3cm90ZToNCj4+PiBXaGVuIHRoZSBIU01Q
IEFDUEkgZGV2aWNlIGlzIGF2YWlsYWJsZSwgdGhlbiBsb2FkaW5nIHRoZSBhbWRfaHNtcC5rbw0K
Pj4+IG1vZHVsZSBpbmNvcnJlY3RseSBwcmludHMgdGhlIG1lc3NhZ2UgIkhTTVAgaXMgbm90IHN1
cHBvcnRlZCBvbg0KPj4+IEZhbWlseToleCBtb2RlbDoleFxuIiBkZXNwaXRlIGJlaW5nIHN1cHBv
cnRlZCBieSB0aGUgaHNtcF9hY3BpLmtvDQo+Pj4gbW9kdWxlLCBsZWFkaW5nIHRvIGNvbmZ1c2lv
bi4NCj4+Pg0KPj4+IFRvIHJlc29sdmUgdGhpcywgcmVsb2NhdGUgdGhlIGFjcGlfZGV2X3ByZXNl
bnQoKSBjaGVjayB0byB0aGUNCj4+PiBiZWdpbm5pbmcgb2YgdGhlIGhzbXBfcGx0X2luaXQoKSBh
bmQgcmV2aXNlIHRoZSBwcmludCBtZXNzYWdlDQo+Pj4gdG8gYmV0dGVyIHJlZmxlY3QgdGhlIGN1
cnJlbnQgc3VwcG9ydCBzdGF0dXMuDQo+Pj4NCj4+PiBBbHNvIGFkZCBtZXNzYWdlcyBpbmRpY2F0
aW5nIHN1Y2Nlc3NmdWwgcHJvYmluZyBmb3IgYm90aA0KPj4+IGhzbXBfYWNwaS5rbyBhbmQgYW1k
X2hzbXAua28gbW9kdWxlcy4NCj4+Pg0KPj4+IFJldmlld2VkLWJ5OiBOYXZlZW4gS3Jpc2huYSBD
aGF0cmFkaGkgPG5hdmVlbmtyaXNobmEuY2hhdHJhZGhpQGFtZC5jb20+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogU3VtYSBIZWdkZSA8c3VtYS5oZWdkZUBhbWQuY29tPg0KPj4NCj4+IEdlbmVyYWxseSB0
aGlzIHNlZW1zIHJlYWxseSBub2lzeSwgaXMgaXQgcmVhbGx5IG5lY2Vzc2FyeT/CoCBJIGZlZWwg
DQo+PiBsaWtlIHRoZSBtZXNzYWdlcyBpbiBoc21wX3BsdF9pbml0KCkgaGF2ZSB2YWx1ZSBiZWNh
dXNlIHRoZXkgc2hvdyB1cCANCj4+IGluIHRoZSBlcnJvciBwYXRoLsKgIEJ1dCBpbiB0aGUgc3Vj
Y2VzcyBwYXRoIGlmIHlvdSBkb24ndCBnZXQgYSByZXR1cm4gDQo+PiBjb2RlIGl0IHNob3VsZCBi
ZSB3b3JraW5nLg0KPj4NCj4gDQo+IFdpdGggdGhlIHVwc3RyZWFtZWQgSFNNUCBwYXRjaHNldCBp
biBsaW51eCB2Ni4xNSwgIkVyd2FuIFZlbHUiIA0KPiBlbmNvdW50ZXJlZCBhbiBpc3N1ZSBvbiBh
biBBTUQgbWFjaGluZSB3aXRoIGEgIjk4NDUgKEZhbWlseSAxQSwgTW9kZWwgDQo+IDExKSIgcHJv
Y2Vzc29yLg0KPiANCj4gSGUgb2JzZXJ2ZWQgdGhlIGVycm9yIG1lc3NhZ2U6ICJhbWRfaHNtcDog
SFNNUCBpcyBub3Qgc3VwcG9ydGVkIG9uIA0KPiBGYW1pbHk6MWEgbW9kZWw6MTEsIiB3aGljaCBp
cyBtaXNsZWFkaW5nIGJlY2F1c2UgdGhlIEhTTVAgQUNQSSBpcyANCj4gYWN0dWFsbHkgZnVuY3Rp
b25pbmcuDQo+IA0KPiBIZSByYWlzZWQgYSBjb25jZXJuIHRvIGNvcnJlY3QgdGhlIGVycm9yIG1l
c3NhZ2UgYW5kIGVuc3VyZSBjb25zaXN0ZW5jeSANCj4gaW4gdGhlIG1lc3NhZ2UgYWNyb3NzIGJv
dGggaW5pdGlhbGl6YXRpb24gcGF0aHMgKEFDUEkvUEFUKSBzbyB0aGF0IHVzZXJzIA0KPiBhcmUg
aW5mb3JtZWQgdGhhdCBIU01QIHdhcyBzdWNjZXNzZnVsbHkgcHJvYmVkLg0KPiANCj4gQ291bGQg
eW91IHBsZWFzZSBwcm92aWRlIHlvdXIgc3VnZ2VzdGlvbiB0byB0aGlzIGlzc3VlPw0KDQpIb3cg
YWJvdXQgaW4gaHNtcF9wbHRfaW5pdCgpIHlvdSByZS1vcmRlciB0aGluZ3M/ICBJIHRoaW5rIHRo
ZSANCmFjcGlfZGV2X3ByZXNlbnQoKSBjaGVjayBjYW4gY29tZSBiZWZvcmUgdGhlIGxlZ2FjeV9o
c21wX3N1cHBvcnQoKSBjaGVjay4NCg0KPiANCj4gDQo+Pg0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZl
cnMvcGxhdGZvcm0veDg2L2FtZC9oc21wL2FjcGkuYyB8wqAgMSArDQo+Pj4gwqAgZHJpdmVycy9w
bGF0Zm9ybS94ODYvYW1kL2hzbXAvcGxhdC5jIHwgMTcgKysrKysrKysrKysrLS0tLS0NCj4+PiDC
oCAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pj4N
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL2hzbXAvYWNwaS5jIGIv
ZHJpdmVycy9wbGF0Zm9ybS8gDQo+Pj4geDg2L2FtZC9oc21wL2FjcGkuYw0KPj4+IGluZGV4IDJm
MWZhYTgyZDEzZS4uYjYzMTExMGU1ODM0IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvcGxhdGZv
cm0veDg2L2FtZC9oc21wL2FjcGkuYw0KPj4+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2Ft
ZC9oc21wL2FjcGkuYw0KPj4+IEBAIC02MTAsNiArNjEwLDcgQEAgc3RhdGljIGludCBoc21wX2Fj
cGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSANCj4+PiAqcGRldikNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgaHNtcF9wZGV2LT5pc19wcm9iZWQgPSB0cnVlOw0KPj4+IMKgwqDCoMKgwqAg
fQ0KPj4+IMKgICvCoMKgwqAgZGV2X2luZm8oJnBkZXYtPmRldiwgIkFNRCBIU01QIEFDUEkgaXMg
cHJvYmVkIHN1Y2Nlc3NmdWxseVxuIik7DQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+PiDC
oCB9DQo+Pj4gwqAgZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC9oc21wL3Bs
YXQuYyBiL2RyaXZlcnMvIA0KPj4+IHBsYXRmb3JtL3g4Ni9hbWQvaHNtcC9wbGF0LmMNCj4+PiBp
bmRleCBlMzg3NGM0N2VkOWUuLjcyNGU1YzdmYzgxOSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L3BsYXRmb3JtL3g4Ni9hbWQvaHNtcC9wbGF0LmMNCj4+PiArKysgYi9kcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9hbWQvaHNtcC9wbGF0LmMNCj4+PiBAQCAtMjE1LDcgKzIxNSwxMiBAQCBzdGF0aWMgaW50
IGhzbXBfcGx0ZHJ2X3Byb2JlKHN0cnVjdCANCj4+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+Pj4gwqDCoMKgwqDCoCB9DQo+Pj4g
wqAgLcKgwqDCoCByZXR1cm4gaHNtcF9taXNjX3JlZ2lzdGVyKCZwZGV2LT5kZXYpOw0KPj4+ICvC
oMKgwqAgcmV0ID0gaHNtcF9taXNjX3JlZ2lzdGVyKCZwZGV2LT5kZXYpOw0KPj4+ICvCoMKgwqAg
aWYgKHJldCkNCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+PiArDQo+Pj4gK8Kg
wqDCoCBkZXZfaW5mbygmcGRldi0+ZGV2LCAiQU1EIEhTTVAgaXMgcHJvYmVkIHN1Y2Nlc3NmdWxs
eVxuIik7DQo+Pj4gK8KgwqDCoCByZXR1cm4gMDsNCj4+PiDCoCB9DQo+Pj4gwqAgwqAgc3RhdGlj
IHZvaWQgaHNtcF9wbHRkcnZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
Pj4gQEAgLTI4NywxNSArMjkyLDE3IEBAIHN0YXRpYyBpbnQgX19pbml0IGhzbXBfcGx0X2luaXQo
dm9pZCkNCj4+PiDCoCB7DQo+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0ID0gLUVOT0RFVjsNCj4+PiDC
oCArwqDCoMKgIGlmIChhY3BpX2Rldl9wcmVzZW50KEFDUElfSFNNUF9ERVZJQ0VfSElELCBOVUxM
LCAtMSkpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgcHJfaW5mbygiSFNNUCBpcyBzdXBwb3J0ZWQg
dGhyb3VnaCBBQ1BJIG9uIHRoaXMgcGxhdGZvcm0sIA0KPj4+IHBsZWFzZSB1c2UgaHNtcF9hY3Bp
LmtvXG4iKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7DQo+Pj4gK8KgwqDC
oCB9DQo+Pj4gKw0KPj4+IMKgwqDCoMKgwqAgaWYgKCFsZWdhY3lfaHNtcF9zdXBwb3J0KCkpIHsN
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcHJfaW5mbygiSFNNUCBpcyBub3Qgc3VwcG9ydGVkIG9uIEZh
bWlseToleCBtb2RlbDoleFxuIiwNCj4+PiArwqDCoMKgwqDCoMKgwqAgcHJfaW5mbygiSFNNUCBp
bnRlcmZhY2UgaXMgZWl0aGVyIGRpc2FibGVkIG9yIG5vdCBzdXBwb3J0ZWQgDQo+Pj4gb24gZmFt
aWx5OiV4IG1vZGVsOiV4XG4iLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb3Rf
Y3B1X2RhdGEueDg2LCBib290X2NwdV9kYXRhLng4Nl9tb2RlbCk7DQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiByZXQ7DQo+Pj4gwqDCoMKgwqDCoCB9DQo+Pj4gwqAgLcKgwqDCoCBpZiAo
YWNwaV9kZXZfcHJlc2VudChBQ1BJX0hTTVBfREVWSUNFX0hJRCwgTlVMTCwgLTEpKQ0KPj4+IC3C
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsNCj4+PiAtDQo+Pj4gwqDCoMKgwqDCoCBoc21w
X3BkZXYgPSBnZXRfaHNtcF9wZGV2KCk7DQo+Pj4gwqDCoMKgwqDCoCBpZiAoIWhzbXBfcGRldikN
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07DQo+IA0KPiANCj4gVGhhbmtz
IGFuZCBSZWdhcmRzLA0KPiANCj4gU3VtYQ0KPiANCg0K
