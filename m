Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B5212C484
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737733724; cv=fail; b=TuiWH9vxj6lbm2pECJc/XB6mceYumIBuCMzascJp3taDEhhRf43w0MEPD4qmgFewxOXHlLg4rnBZFMw3U+//wHPsaOyrjWHhAPrR/qCAREdKOl7xV+APmn2jf/YxDrpumUXLmJoH0mk0oljfh4rNU7w4J8D20Z4Op5i4y9woTiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737733724; c=relaxed/simple;
	bh=g8HGbEJdFn0bipH9+t2FTy2j5unepsCwusdTOz0AhLg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zirue61jKAqW/1c5ZdjJ0k4+cdhi8ue9r53jdM3H0/il3tL2RxLBhVXI1accIBKSa+Mg/KfYrlF+Ert8/yFEupcG6weIA/xdfuaSwXyPfSdQYNTNjcgsjHdu/sugqXf/Ap1rfIvxIQJJb/Bno+1WyF1goyAXV+eIe0R+5Z4Wu/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IKFBzn/1; arc=fail smtp.client-ip=40.107.236.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IKFBzn/1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpa+VgbKf3bHhS4wnWgDItfTmPtcXsyH2xseIfqTKJHmt5isuw1qgaDOBYalT+I7sc+U+OSFoYgW2E/UAV5o0ll6mRfqiY1OgQM+tYJWdhr66MVaygKAV0DMOVXt/XWWXbhJC38LBdVMR9KUXMSfdK+MIej39mELYyUu7FrtW9kovZxbKf6RwWPhPhZwDNfvFXG+JT08ZpGsKC9cHcT3YBv4S92WWUJq+tnnKkQE4g7d7C6hwLrOdOERglrya6p6t0Lq2W1Mc7I9D1fepweELbLhi9/rd4E5LjhZD9xdUGaU0ikaJ62sRJDbaH/JLcZpgDAwB217p369kBQJxlQXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8HGbEJdFn0bipH9+t2FTy2j5unepsCwusdTOz0AhLg=;
 b=dIOhYlOopUHhVJpWhUKN9mKEJnO/i7cW7KcEWLHf5lYMCcOscmH6XUkYsKIn7yJYKjFyG8VfY04lsNVZKmrUd0V2+GpNrI8k5DH8xsy3muZAvaL1FKm8VCNwqwgBVa+nrNHnlN/htQonKy/PYxEGQ2HZ4N99zJ2mrakm70n2b6ktMbbxb5H4IYZAU40am/Ct9rj4VpXp8Dxvygz92NZ9KTaUT9gufbvkOugFnG2LJft/QQgYMdRYWivfAkF8uP7os1JBS8s3A/ljU4K3VUA1sBKMtMEFTN32EX39EjruU1/Oczt5JQtGGq8RgCXx8FtLruMJUtJMzGdeXQMrrKxfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8HGbEJdFn0bipH9+t2FTy2j5unepsCwusdTOz0AhLg=;
 b=IKFBzn/14QY7pmLtDnEHpby6l7XS7EGF7F0tZ7nGmuLyLTyfDkiSKhUVVWRim2aRMv76OPEv78pf8FzvAzRSfZ6S2YLKozGV8DPpQZS7DCJyrYjYrlNkS/H1GtM9sCxAxe8lSxYOuhxycs9URs4ZfxAc/LsyNFlTx+rpgF3lHTmkvSGb4pRU2yxihgq0qcyAOJ678esfbLhzuUEExZHJtDdDVGoAd/lGRGWG9NBX6YAqrNHhH5jKZFAgyhiI8mZ1Bg/Oh82TZSmjKtWwWu2WS6MfgJ/Tw3e+1v8HR718h19FN/DUSdujxb4Taqdt81MAWDqkw2pX2uasg2g2tBH9nA==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 15:48:37 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 15:48:36 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>,
	Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>,
	Oleksandr Shamray <oleksandrs@nvidia.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v4 06/12] platform/mellanox: Rename field to improve code
 readability
Thread-Topic: [PATCH v4 06/12] platform/mellanox: Rename field to improve code
 readability
Thread-Index: AQHbbcqDdt30TG89yEWV/4xaTh3ucbMllCgAgABLHFCAAAP2AIAAJV7w
Date: Fri, 24 Jan 2025 15:48:36 +0000
Message-ID:
 <PH7PR12MB6668757E1F8FAF31F02C7A32AFE32@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250123190818.3834-1-vadimp@nvidia.com>
 <20250123190818.3834-7-vadimp@nvidia.com>
 <3d7206a6-ad2d-6946-3da9-5de68b8e9408@linux.intel.com>
 <PH7PR12MB66682C75F25A1CE281ABD82CAFE32@PH7PR12MB6668.namprd12.prod.outlook.com>
 <65b929db-aece-a788-df95-5eba0ca5b612@linux.intel.com>
In-Reply-To: <65b929db-aece-a788-df95-5eba0ca5b612@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|LV3PR12MB9214:EE_
x-ms-office365-filtering-correlation-id: d21bf013-ff1d-42f2-45af-08dd3c8e90ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VEhmdnNGNlRSeWhhQ3Y3eDBGK3dCRVoxa0FGdFA3UzJ2SEpPSk9WRitPK29h?=
 =?utf-8?B?MGRLa0REN1FHM3poeDhDN2xTMTRGZzlrTEFKMUJDRXdvMm5WajFlTFZKWG9n?=
 =?utf-8?B?Zld5cWxqTVFKallOMTJaaDU4b01lWThKZlBFOWlHR2tld2xnMFJnZWdxdjdp?=
 =?utf-8?B?ZkhEaktxR2Rva3JaaFdNSTE2QTFGWFh5ZzBLWTJZWTIzcEt6VWdpNlpJRm5F?=
 =?utf-8?B?VVhQd21meXRFNnRTdVBPRTBaMzUzaUo4NjZSaEhUZS9DbEtxSzJKR0FDVHFV?=
 =?utf-8?B?a0doUTYrVzdmQWdPd1U1YzEwOVB0VVQ0TWRjb0t3UDJEQVVhYWZBM1VqdnA0?=
 =?utf-8?B?bXUwTER6bXB6TE4rRTdSZ2Y2ekptaXV5RTU4SDIxcFVKRzZaMUN3WklFb0lJ?=
 =?utf-8?B?WDl5L3NpcTBzdW1TbFZ1UllIZklRTElJRy96d2tmRTZob2F3RTZxU3AzUFEz?=
 =?utf-8?B?Zm9JRE02aWMzNU9rY3pIZjZwdlZtN2JOTFdkZysvTUw5d2VJVnBRMVp6bGxM?=
 =?utf-8?B?VWg4VUM3NzZGNzhyekxKSWNjc1Mzbk03bFBsOWdLZThLYXc4eGlwcmNMYjEz?=
 =?utf-8?B?dmVtYzB1eGV4aldZMWRjbmcrU0d3TzJqMU9HdWJkUXN2eXgxMWJSSkVaSmRC?=
 =?utf-8?B?ZHRpdDRNQTFZRExZQ3licCs3V1ZIa2NsV3psTm9CVFNyeU5lamQ5V2lwM3E0?=
 =?utf-8?B?Y3lUTjh0VTEvZEVmc1RPbGgyRENyem04L2EwSExxdHVTZSt5eFlTVUtaYjFV?=
 =?utf-8?B?YkVnaXRRSUlqU0ZKQXBybDNyMDhZYVJibXYzd2p0UHVtU1pDWmxJRW02aU40?=
 =?utf-8?B?eHJUVC93ZnVzSHdQaGV2cmlFZ3hRQ2tJa1lFZHAvQkR5K0tCbHVRVEpWVzNK?=
 =?utf-8?B?MHZBcHNKc2VBNDBtRWt5d2xNSlJZOWh6bWhlWUU1RmlzV3dNMlFDZEVKMURa?=
 =?utf-8?B?cFU0Qk1mbThEWFB1S2xaS1NPUzFjV2N2MjJQMUNDODNzK1JWdVhDbm9NTmtL?=
 =?utf-8?B?Z2FhZXlEbzlKRHRyNU9UTlhybUFZR0xsSVJ6VXdJc0VRd04wTTV2Qkh6Skdy?=
 =?utf-8?B?RGd0THBORy9EK3FMaUZzdmxPZ0d3QytDLzJMR2t2b2Z1dVdhMXllbFJSeWd1?=
 =?utf-8?B?NW9mT2hXc2M2RFEyWEsrUGc5dXNzMXg1Ryt1enhqcCtyNFFkL25ORHA2LzZn?=
 =?utf-8?B?azlvYlFUODFSVW9wbW9mNkkwQ2NNYUhTZzVhWFJBMGVzQjk4bUR5N1Q0NWEy?=
 =?utf-8?B?QnYyWnQ1TzRKOHU2djMyT3F3MGxpTVpCN0o5UkJLa3d5ekovak1RUGdYSXBo?=
 =?utf-8?B?TStqSllxK1FEWEgvNEh4SnU1cXplcDB6cTNGMUFZMUNjVFdIUWVybzk5eWRl?=
 =?utf-8?B?V3o0VUNJU3JiL21QZE5NN2dRcUYyVHVOUzU1T29udmprUW5zZURQdy9zNmth?=
 =?utf-8?B?V2tFNDBQbGJKNXlHYnM4a3NtNWtPQ2xUNm9BYkdLWnJ6TEM4NXZaSkpGQ2R2?=
 =?utf-8?B?VUdRMXNEWVhuQWNSd040VHVvVHEwcFlkaU1EclphRTgyTE1UTWUzVmJYSG9p?=
 =?utf-8?B?VzJaNFVJNzRKa2tlelNhNFB6WE1LNGthKzdsakg2K2dRNHljdnAySTE3QWNo?=
 =?utf-8?B?cHE5R0NaOG91YzZUZ0VRY1ZPOGtUNUtBN3BJSlZ3YnpWNWtjSzVsUUprL0NW?=
 =?utf-8?B?UkVuOUp5ME5hOW9vdjFxMDd1eHFYcERsU3gwL2YwZEx2ME92SDB2dFQ5V2xK?=
 =?utf-8?B?ckk1SzNRTmRFKzdiMURodDRMT0NRdE1TdDJqbFIyVHhzdjF0ODR2dmZyZy9u?=
 =?utf-8?B?WUhuN1U3MkVtLzA2ckJmNGRHWjMwVWVsdTgyZUprUTZOTGxIY0lQSy9JU1lx?=
 =?utf-8?B?VTZMNk4zcWRGdGU5OGpOeXNwdHEzUWxNdTJLN1Jad2NLZWtZcHUrZVlaQXoy?=
 =?utf-8?Q?aXlWp+BjypXGHAiexH9nJXvndU7F7Mu1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnhjKy9qNDVtWVN1NXVkQ2xmY3NmWmdMZkgyUkU0SU41RTJIem9rL0ZrU2l2?=
 =?utf-8?B?RDhDVTVKUit3d2UweDRnWndXNFBSdGEwbFl4NlhrU2hPb3dYQ0dLbG1GYzFU?=
 =?utf-8?B?TVd2KzBKZFhIbnMyZzdjd2pvY09FVDBESU4vWFpEZU9XUjB1ZzF5S0REVkdQ?=
 =?utf-8?B?aWJZcWkybHNIRThMT3c3QWtuZG91VlF4QjJkeGxSRW9OMHBTd0V4VmtzaldB?=
 =?utf-8?B?NGxHZW9vc3ZhTWZ3aC9BdytTVDRpQmY2VTNTNHdkNHluTUs4U3lYMWVKemxI?=
 =?utf-8?B?M0Y1OUZwcHQ3dG01L2JiOWthRkNieGN1Yk95bTBGL3pPdGw5N3FFbm5qYzlQ?=
 =?utf-8?B?azhUT3hjbXJReklDMFFVYWd1dFBNOEI1cFJSTCtrUnhKbVpmcGZZeGtuRmlZ?=
 =?utf-8?B?U2RmOUlDRUFHTnRxbmZGZ1JnRkpSaUd5amRBRHM4VFdqZ3k1aC9ZcWlCZDUz?=
 =?utf-8?B?dDF6ZUEreHMrUHVHcG1kd2hwQXJxdnJOMUFNMEFPMWNaelZpRVQzTU9Od3gv?=
 =?utf-8?B?ZGxKV1RsZHhUcFNCMjFWYTF0TWpHMVhEYmtFOTgyMG5FNm5vbjREeFI2R0Jx?=
 =?utf-8?B?Y0d3alNpUEtESDVpYTE5OTJ6aHpyM3FHN2RDRyt6MnpKZ3F0MlpBTlBKMlZU?=
 =?utf-8?B?S0swY1hDeUZZZ3QremFZYnIvb21VcnFlSElWdjd1VGMvYTZiNHNMVmtLNzJL?=
 =?utf-8?B?MnpxSlljUm82aDI4L2tINkJVdmZRajJsY3o1OGhiTEFJZEJJMnNCRUd6YmJP?=
 =?utf-8?B?eW8wM2VmQkZnL0NCcEhFWU5SVzRRcEwwQXpEcmllUENQZzE5MjJUQTdwd3Z0?=
 =?utf-8?B?QU9tRkJDTmNNeEtadTZmMFRlcU5HTGh5ZmpiZG5sM3Z3K1pYUXNIWUVPU1pj?=
 =?utf-8?B?d1RxbE01Y1JrdlhzczhRUDNVNmI1V2pvek53THFSdzFVbnJGU3UzaDVNMFJj?=
 =?utf-8?B?UHI2c3pEeCtkclUvREc2MUJhZlJENDNRNWFSV3lSMVg2OGJ6cFllUlNCbFFV?=
 =?utf-8?B?NWRqTHJ6RENqNXAwSzFNOE9ZSThyVW8wTEhEczRYbnhWeTRwRDlNNkxmTGN0?=
 =?utf-8?B?NEV6SGU5UXFhOCtLbkl2bm9WTU9IQW82L0E3dkZtOGtBbXZ0STdUKzdDOVh4?=
 =?utf-8?B?OUJPRnY2R09INTBheHBLSkhHT1h5U0FqK1dpa2x5dGxOZ0ZhT1NUU1pEN2pE?=
 =?utf-8?B?QVZYYVZWS0ZIZkF3MTVrT3FrOGJQaE9jTFNYRGhDVXh4Y2VMZ1lCb1VlbkN2?=
 =?utf-8?B?ekNLeDZuRldCd3FLaHRTeTZWZUlmN3k4Sythb2Q2QUd3V2dQZlhhNlVwczZ4?=
 =?utf-8?B?MmpIem44SGMwVFJrdGVOd1hoTXlDMlFTVTRNd3pTdWdxemhTNGlvemtGWUJY?=
 =?utf-8?B?cFJjQ2d1WG5jbEV5OG1WYnRQd2FwNVBVNkVpV3d1WERhYzNNRGtlZGVaRkEz?=
 =?utf-8?B?RjNKcjJ5WXhmTXpQUXlNN2V3a09IY2RiVXRkUEtBOG5sRzF4MlBxcUdiM2pH?=
 =?utf-8?B?RHZ4MlN2cS9yTlRHdU1YenlmbThrdVFESlNUU1Q3RnNjTkI5NEJQV3NrY3p6?=
 =?utf-8?B?SStoL1pLUlZoRTJ0SnZUNVdJQ0hSRytQbVdRd1ZiK1Mwb1IrcmlEbzZhYVp6?=
 =?utf-8?B?NjVFRHNlbTJiZXJucExnWUw0a1MyTVk0VENqanJGUlFzL0VkRVQwR0tBcGVz?=
 =?utf-8?B?V0FmUjNHaEtWcnFIQy9mREtEU1NYUzRRbTRRVXNlZEZmSk9MZUhacG9IRm96?=
 =?utf-8?B?cThXdXE5TmhGL2F1WTJLYzhxRzBLS3BRVVFVK0R0SUN2QklIMHJENzlVMytI?=
 =?utf-8?B?M1NBQXZEekZpWlZGMDAwTUdlYWExL1dBR1pMSk9PWnZ5UEtFR0NQb2o5azV3?=
 =?utf-8?B?bUw2QXN4Y3RxSk9RcGFZaWJVZlF5RnFpdTFROExnaW1vNUI5Qmhjd3Z5am1n?=
 =?utf-8?B?RE9LbVhsMnFGa1hrR1RnMWJ3V3hscG1VL3ora2dTQkZ2U3A3OXBvWUhnbmJx?=
 =?utf-8?B?SWJwUlZoZ0tnaE1RNzJjVXoxMXBtWW9wbVVtZXFCUXRzaDFCSDk0YURiT0l0?=
 =?utf-8?B?YnFtcVZWVlV3VnBTakc1NlVtRzVMV3A3Y1lKM3J1UGd3Z0RvZ3lyeTdvSDBl?=
 =?utf-8?Q?2s98=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d21bf013-ff1d-42f2-45af-08dd3c8e90ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 15:48:36.6268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K5JK/bN5VnGequSLoEUi6J5AbTRwW+r2988nP6Fl6PFMH4QcFTpFl8bTnGxZIkwAvmYtJkgPfMIXY9b1DD3ihQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWxwbyBKw6RydmluZW4g
PGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIDI0IEphbnVh
cnkgMjAyNSAxNDo1Nw0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNvbT4N
Cj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBNaWNoYWVsIFNoeWNo
DQo+IDxtaWNoYWVsc2hAbnZpZGlhLmNvbT47IENpanUgUmFqYW4gSyA8Y3JhamFua0BudmlkaWEu
Y29tPjsgRmVsaXggUmFkZW5za3kNCj4gPGZyYWRlbnNreUBudmlkaWEuY29tPjsgT2xla3NhbmRy
IFNoYW1yYXkgPG9sZWtzYW5kcnNAbnZpZGlhLmNvbT47DQo+IHBsYXRmb3JtLWRyaXZlci14ODZA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjQgMDYvMTJdIHBsYXRmb3Jt
L21lbGxhbm94OiBSZW5hbWUgZmllbGQgdG8gaW1wcm92ZQ0KPiBjb2RlIHJlYWRhYmlsaXR5DQo+
IA0KPiBPbiBGcmksIDI0IEphbiAyMDI1LCBWYWRpbSBQYXN0ZXJuYWsgd3JvdGU6DQo+ID4NCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBJbHBvIErDpHJ2aW5l
biA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiBTZW50OiBGcmlkYXksIDI0
IEphbnVhcnkgMjAyNSAxMDoxNA0KPiA+ID4gVG86IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52
aWRpYS5jb20+DQo+ID4gPiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT47
IE1pY2hhZWwgU2h5Y2gNCj4gPiA+IDxtaWNoYWVsc2hAbnZpZGlhLmNvbT47IENpanUgUmFqYW4g
SyA8Y3JhamFua0BudmlkaWEuY29tPjsgRmVsaXgNCj4gPiA+IFJhZGVuc2t5IDxmcmFkZW5za3lA
bnZpZGlhLmNvbT47IE9sZWtzYW5kciBTaGFtcmF5DQo+ID4gPiA8b2xla3NhbmRyc0BudmlkaWEu
Y29tPjsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjQgMDYvMTJdIHBsYXRmb3JtL21lbGxhbm94OiBSZW5hbWUgZmllbGQgdG8N
Cj4gPiA+IGltcHJvdmUgY29kZSByZWFkYWJpbGl0eQ0KPiA+ID4NCj4gPiA+IE9uIFRodSwgMjMg
SmFuIDIwMjUsIFZhZGltIFBhc3Rlcm5hayB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IFJlbmFtZSBm
aWxlZCAnaXRlbScgaW4gc3RydWN0dXJlICdtbHhyZWdfY29yZV9pdGVtJyB0byAnaXRlbV9jb3Vu
dCcuDQo+ID4gPg0KPiA+ID4gZmllbGQgLT4gZmllbGQNCj4gPiA+DQo+ID4gPiAnaXRlbScgLT4g
J2NvdW50Jw0KPiA+ID4NCj4gPiA+IEhvd2V2ZXIsIHRoaXMgZGlkIG5vdCByZW5hbWUgJ2NvdW50
ZXInICh0aGF0J3MgaW4gdGhlIG90aGVyIHN0cnVjdCkNCj4gPiA+IHdoaWNoIHdhcyB3aGF0IEkg
c3VnZ2VzdGVkIHlvdSBzaG91bGQgY29uc2lkZXIgY2hhbmdpbmcuDQo+ID4gPg0KPiA+ID4gQWxz
byBpbiBtbHhyZWdfY29yZV9pdGVtLCAnY291bnQnIGZpZWxkIHNlZW1zIHRvIGJlIHRoZSBudW1i
ZXIgb2YNCj4gPiA+IGVsZW1lbnRzIGluICdkYXRhJyBzbyAnaXRlbV9jb3VudCcgZG9lc24ndCBz
b3VuZCBzbyBnb29kIG5hbWUgaW4NCj4gPiA+IHRoaXMgcGFydGljdWxhciBjYXNlIChpbiB0aGUg
b3RoZXIgY2FzZSAnY291bnRlcicgY291bnRzIHRoZSBudW1iZXINCj4gPiA+IG9mIGl0ZW1zIGlu
ICdpdGVtJywgdGh1cyBteSBzdWdnZXN0aW9uIHRvIHVzZSAnaXRlbV9jb3VudCcpLg0KPiA+DQo+
ID4gSGkgSWxwbywNCj4gPg0KPiA+IEkgdGhpbmsgYmV0dGVyIHRvIHJlbmFtZSBjb3VudGVyIGZp
bGVkIGluICdtbHhyZWdfY29yZV9pdGVtJyB0byBzYW1lDQo+ID4gJ2NvdW50ZXInIG5hbWUgYXMg
aW4gJ21seHJlZ19jb3JlX3BsYXRmb3JtX2RhdGEnLg0KPiA+IFRodXMsICdpdGVtLT5jb3VudGVy
JyB3aWxsIGJlIG51bWJlciBvZiAnZGF0YScgZWxlbWVudHMgKHN0cnVjdA0KPiA+ICdtbHhyZWdf
Y29yZV9pdGVtJylhbmQgJ3BkYXRhLT5jb3VudGVyJyB3aWxsIGJlIGxpa2UgaXQgaXMgbm93IG51
bWJlciBvZg0KPiAnaXRlbScgZWxlbWVudHM6ICdpdGVtLT5jb3VudGVyJw0KPiA+IChzdHJ1Y3Qg
J21seHJlZ19jb3JlX3BsYXRmb3JtX2RhdGEnKS4NCj4gDQo+IE5vLiAiQ291bnRlciIgbWVhbnMg
c29tZXRoaW5nIHRoYXQgaXMgY291bnRpbmcgc29tZXRoaW5nIHdoaWNoIGlzIG5vdCByZWFsbHkN
Cj4gdGhlIGNhc2UgaGVyZS4gSnVzdCB1c2UgImNvdW50IiBpZiB5b3Ugd2FudCBoYXZlIHRoZW0g
dGhlIHNhbWUuDQoNCk9LLCBpbiB0aGlzIGNhc2UgSSdsbCBjaGFuZ2UgZmllbGQgbmFtZSB0byAn
Y291bnQnIGluICcgbWx4cmVnX2NvcmVfaG90cGx1Z19wbGF0Zm9ybV9kYXRhJw0KYW5kICdtbHhy
ZWdfY29yZV9pdGVtJy4NCkJ1dCB3aWxsIGxlYXZlIG5hbWUgJ2NvdW50ZXInIGluICdtbHhyZWdf
Y29yZV9wbGF0Zm9ybV9kYXRhJyBiZWNhdXNlIGl0IHdpbGwgcmVxdWlyZQ0KY2hhbmdlcyBpbiBk
cml2ZXJzIGZyb20gdGhlIGRpZmZlcmVudCBzdWJzeXN0ZW1zIChsZWQsIGh3bW9uLCB3ZCkgYW5k
IGl0J2xsIGNvbXBsaWNhdGUNCnN1Ym1pc3Npb24uDQoNClRoYW5rcywNClZhZGltLg0KDQo+IA0K
PiAtLQ0KPiAgaS4NCg==
