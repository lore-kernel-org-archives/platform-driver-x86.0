Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE2443AA9
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374222; cv=fail; b=IQvkJCHxjq+hMhcLk4E+WzJ/eW6S42yivguE3IdC0hNnmQQUl11rbNCMFtfReCjxtsUiyjhWUtnRlrEeEgq5Viapc9NTikAnPLo/4/ED1+AuhumquzD/8NkUiZxNsCXszpPXhQXwqVcQE1VWTjLyGXm8//c4DwlFUlBU6iwNtbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374222; c=relaxed/simple;
	bh=Itrx0TaR4XUnLyb15Ke+qs8ClylNpYqI2zj9Wt9H39Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MjJVmdTD3xBzfS78032EEigpguRO2KNVrVFF+JFtZUTaUd3oBpwg1i48sRhRz2ofmEvbfrti6vRPp3vwNjcoRCvCUZE6h/+GySLya/ZBi2Z7+QCW2XO161kRK8Boo6inq7UbzaII4cSNqJ009GNJ3Cj9W67/oyrxMTILRGcoUoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SgTp6oMv; arc=fail smtp.client-ip=40.107.243.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SgTp6oMv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AD89cMTePfAHXw3McI8PtuNWY5NVVrlSRwwiyK+v2YlgZAJoFh6cEHYB+9sPA2gr6m8Q1I4NPNpKHMLp9mIEvHlxaXKXgJpy3r2fJNX483EEZLTqQSEi7tIluvl+AGDXzr3qpp36W3mzhm/vQ5RY2hk59i0y8aOHu2raEE6soqvTFpDMq3fflSGc5xn+YfHkP4PXr+DkpPzukQKh/p0MZkE8rA7NkfHj1LRrm2Ud4XSPEeI6f/JLHl/UnAuNaB2ifUDsiNRceP7VKFAImS1Mczqh//2mygNwknIncL9lsq+BBvI8xEK7RRrxfQwLeS20rLpmJrCaPEEjtrQWO267pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Itrx0TaR4XUnLyb15Ke+qs8ClylNpYqI2zj9Wt9H39Y=;
 b=sv9eBzo83e8AldAp3ML6CvgikI2eyfIUO1sDNdJUOqw0COQz7S/sJlbZnX5Tf89M2NH/76TB41j3yncXPoNBtf2SQglebzRx171OO/KcE23PCxQxX7I4TlIoJUNJd5G/OsXldr6QBFX08/mQqJC1C0lNAPLRpKNeZppPyie+FIiirEojhW8BWuGcfEeQbxuGHYZF1U7hHL9AEAT32fb+QWqTSAck53kJF2T1/NUMUSeJ31VifG1nXoX8K5wo8XzEGi2WZ0RqcpVwg6VjMK5qp1BE2o0IT27PhT1Z4TsNylTfi5WoeJs1MWfZW82AbLvjvmB5hVSlk/f49qTfbu9k7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Itrx0TaR4XUnLyb15Ke+qs8ClylNpYqI2zj9Wt9H39Y=;
 b=SgTp6oMvcOdKJeG0tDvz6o78akNmMVXAnKGyPCvkbHriehlEXZu2nEZ3gG4uXHUvnRtMBpyPWXLC3jkdEFh/A4szYWJ0gz+R4jLGro8F7C/KzZ+sICusuj2zeId9Vt/Y4uHFZ+blYHfsUrPh9EC7Xay1QlLiXO4jCsLYIN3qxkqg/p82MClJjOSdJnvs9HLl9dMbaGcOvw0DMpvAU7tM57YLL1wZTE0cULmTfkPGcRxChbvpff2Ga69vVmLRgWCl3on2Kyn4CXqfVG3SHuuFFhYWVV68JQppHWKchek2CoyvqMCod8Pl3+ZswYJXMt6YnXoGys7QSNO93RN6JZr5AA==
Received: from SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12)
 by SJ2PR12MB9137.namprd12.prod.outlook.com (2603:10b6:a03:562::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 18:36:58 +0000
Received: from SN7PR12MB6670.namprd12.prod.outlook.com
 ([fe80::229b:16e5:ec65:4c1b]) by SN7PR12MB6670.namprd12.prod.outlook.com
 ([fe80::229b:16e5:ec65:4c1b%3]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 18:36:57 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86: mlx-platform: call pci_dev_put() to balance
 the refcount
Thread-Topic: [PATCH] platform/x86: mlx-platform: call pci_dev_put() to
 balance the refcount
Thread-Index: AQHbT2HSiMc84pKEx0yJFY+O9qaI4rLpM/JA
Date: Mon, 16 Dec 2024 18:36:57 +0000
Message-ID:
 <SN7PR12MB66702265AFD79E4DEDE9186AAF3B2@SN7PR12MB6670.namprd12.prod.outlook.com>
References: <20241216022538.381209-1-joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20241216022538.381209-1-joe@pf.is.s.u-tokyo.ac.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB6670:EE_|SJ2PR12MB9137:EE_
x-ms-office365-filtering-correlation-id: 0e364fdc-dbe2-4f91-b9d1-08dd1e009f4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UVcybW9KTmNSU1Bwem9nU3FHY0MvejVlc0pOUTFzSlhZQjh3SmRnRGZKQW9J?=
 =?utf-8?B?VjRQK3NSNXpzLytDcW9yajZVNkdGVFJScnBBaWVMUTZSdU1waVhXa2s4MVor?=
 =?utf-8?B?Mnc2QitGNnN6cFhrejNYa2JHaTlsbHJJcmVFUENOdGloandHRjIrTC9Lc0dn?=
 =?utf-8?B?Nmc2SVc3bzhXRDNoT0ZyUmo2aUVvYXFkREdtQStaSjN6T01SdnJzL001Zk1S?=
 =?utf-8?B?UzFpSUNoN28vNjNQNXQ4Tk55dnJUTTZ1THZKUmtpM0RlREtrK2V3ejZzMTF1?=
 =?utf-8?B?OHJ2TUtqaUF4QWoxLzRzdVpzUHdPbEZkR3RKWUVIZzh2Umx2N0Q0cTBkUTBC?=
 =?utf-8?B?blFBWHYrWmpUWkd6aThGUy9pblNwTnlrMHJJVUh3d1g5QUZxZFpqczc4M0l4?=
 =?utf-8?B?QWk0ckVjVU9nZHFzUHFRUm5rMms0TFZsc2wzVW5JNU01NFZZRnlXdzkxUDN4?=
 =?utf-8?B?VnJCcTVrTWwrTE54OUcycDJuUk1takhWbk5OVGdjMzU1a2V2ZVc4UEhUMXpo?=
 =?utf-8?B?RW9NQUNrL3pPWk15SmZyUmZzZmZMWjgzcldhSjIyaURzcVU5V3BiU2tORytq?=
 =?utf-8?B?Z216RnBtbXg4QlhrZFQ4L0N2SUh1d29TM2cwK2Q0SlZYcXg5Qll0OFBXekh0?=
 =?utf-8?B?aFgralZpVkpKUEx2aDN2OG1weWhXSWxwWTVhbWJucGtiRXdLUzJyTUV0QmxL?=
 =?utf-8?B?dDFoYndSZkQ2TkUvUGFpSVZFQmtYa2F6V1FtdkFlSTQ3bEZMVzdZZmkzQm9K?=
 =?utf-8?B?ZDdFTG8vVVZXUURQYzVXdCt0MXlwNUI0RGpYNzAwbmFMWVlReDY5N2IxQlRh?=
 =?utf-8?B?ZkdOWEZjazFzbFAyZ2Faam5FbmJ1QVMzdkJva0o0SmdFQ3ErTWNWMHYvaEFJ?=
 =?utf-8?B?QUtzNTVCeGJ2d2VsTjdCZ2g1M1VkbUtycldBZ2NaWEJBMlR6RlNiRVgzS3RK?=
 =?utf-8?B?eGo1cGNGTFlqM1U1b3F4UWVROUJkR3lFbC9GRThkdk1KbnQ4Y1c1c3Rja2Rv?=
 =?utf-8?B?YkJ5Q2s5VFh4WUV0OHJvSFcyNHZUTW1xeUx5OGllaDNBVjZRejFvNFRwNnZq?=
 =?utf-8?B?VEhmWGtrdjVmTDBWZE9qanpEb0VaWEwyZVhuMHJpVGZSYXFBa1FOVDVsRE5s?=
 =?utf-8?B?RlBtNGI0NHMwdnFteVhvOERQRisvRUE1YU9KY1V5bzdlSzJOWGZtRHVXVHBw?=
 =?utf-8?B?RUpYOEFqOG5PMVNjdXU2NTd5REErb0wvenEvWWN1dDJyTmgyaDBmTjNjT2xT?=
 =?utf-8?B?a2cySldjQkJxZ0Iya3p0ZW0zTGlnaWJqU2txUUpteDlMOTlZTGlFUlZqV0E1?=
 =?utf-8?B?aUk4UHBXVDBCOVR2WHFhelBuS1FGWGVHMGdsVzErbzlrbWxTL1cxT1RIazdv?=
 =?utf-8?B?N21RYXlrc3BDY28rRmJHQWo2U3hiVkR6Z3A5cnU1N0JiRkxobGhoWU5IKzJi?=
 =?utf-8?B?OUY5TEdqdm9aUFNJbUViN3p1ejUvRHNrQlVIaUtkRitEcERXRU01SHVmVG5s?=
 =?utf-8?B?ZzdFeGNlR3FVQWJDbWtOeDZEeVpJQ1R4QXc4T05WRlV5bGtqMDBpVU44b29P?=
 =?utf-8?B?a2t3VzJMQ1ZjaXVJYzBTK1RVSjlZWGpPQ3IvSlA2L004eDQ4N3ZOUytyUTU2?=
 =?utf-8?B?Kzczd0ZGRkhTSlczRDlQM1pqM25nUjZ3UXFqZks2bVdiWGtzNWIyQlZZdTBO?=
 =?utf-8?B?TnFTUTl2WDV5bVZhejh1MkZ1YXVEa1NmMXduQ1V4RHJ2dWtyVHZtTXU0RVRj?=
 =?utf-8?B?WUdNZkZoNHRoZ29RM0VEOUlDcW1rQzVySUxTYzdEditMcDhZWVBJNjdUVG8r?=
 =?utf-8?B?QlJDeG4wNW5ETnVOWDB5UW9jaURwUkRLa2NIQ3JyczVqZzc3YUxTZzc0Y2VY?=
 =?utf-8?B?UE05TmRjRk91cUtnQ1JidlhET0ZiNmsvMnpxRzd0dnlnNTc3Q2ltSldXWTdr?=
 =?utf-8?Q?5vLfAir+wo7bsgClY/qXsDO3ekx9foIu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6670.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2FDREdwTG5pZHBjcG92cUR3UGlZenlPSVVjQ2JXa1gyREd0Yzl0V1lOdGgy?=
 =?utf-8?B?Ym8wd0hTbFV3OGpRY2tCdDVrZk13RzVERENuTEpSQ0xlWDRxQ0k4Tkdtbk9h?=
 =?utf-8?B?Y2JVVmhVWEFVUkhibkVqSUVQejd5T05UL2pUNlFuWFRXVTlRc1N2YjRNcDJG?=
 =?utf-8?B?QnUrUUxjdGpQZEVpbmZtVTFEb3dzcCtZcXpJOGgvMnV4bE1mTlZ0M1JHeU1k?=
 =?utf-8?B?aWZVdmk2elNJLytWMVo4SzBidmhzcHBTOXpXWmVxcUVjWjdrWWZHbmVLcXFH?=
 =?utf-8?B?UHB1aTc5a2t6ZHBlRTZRNXVZd2hUZzBXZ3V0K2RGMnB0cGRSenBNbm0wZEVV?=
 =?utf-8?B?YlFiYnVWYlMvZjlqZjB6dHhEUE5qemZpeUtYRlByT3F1WVIzL1VCeFRxQVlo?=
 =?utf-8?B?UDVQMTlZWDBianNHTk5DQ2Z1U2t1Y0l5RlVqZy94T0NkM3lDRkZaOXVkNjlX?=
 =?utf-8?B?eDdEWnlHYzQvZjFFb1VYNEZOZDlVS3lrYVZsajBrbVpkZWp2dWlSd0F2OVJl?=
 =?utf-8?B?c29VcENmeXFac2tYaVBueXVuUUhpeDNMTlQ5MTNKSEdudzF1OWFkUEFHZFJF?=
 =?utf-8?B?VjMra3RPZmZoUmRHQy9mb01UaXFnSjJacG94YnpVdFMwdkdVWE90ZW9xdHFB?=
 =?utf-8?B?WGxTT3ZPK21rMFZDOEZDdzNTYTNLaHZtNU02b1VIcCs3SjgrZ2hQR2xNMy9z?=
 =?utf-8?B?UFVSbEYxWGFueWwvS2NDZlcxaWJaMGplRDF2U0F1SzVsNEN3WHJzc2tBakdL?=
 =?utf-8?B?ekIvRERJUWdSc1E0MTM4bTQvVzl1V05YRDFYblFyN3JiUDhiNnBuWVluSHc4?=
 =?utf-8?B?ZUY0dzdQNGh3S21kOEVwZTVxTUo1Z0hHNDBSUGJhK2JPU2tHQ0loc2lEK0V3?=
 =?utf-8?B?SmxIN3V3bGl2aGFtSExZUFZKdlFDYU1iOExieDhZZmxISWowaERyMUV0V2px?=
 =?utf-8?B?aFljWW4vd3hHcWdEdnE1N0xqOU5JbWt0RGlsWENnRFhsNFJ2MHcwdGpDYVJt?=
 =?utf-8?B?TC9xeFk4Y3pMQXYvY0IwbjFwQkdBcTNRcUt6MUFhY2l3VFR5VXZTNk1tR1NJ?=
 =?utf-8?B?NGh1cFN0U0dvalU4ZEZNNzVHZWxkNVBxZ25hMFFDcHZJcUdXV2QxZDZTV2hF?=
 =?utf-8?B?bXBJdCtnN1ZZTHlUZi9FSjZqZlFGSEFsRHZrTHhpNnR3K3lwOTN6b3pNekxF?=
 =?utf-8?B?UjRneUZSOHQwSDBndnp2Y2wrZkxyZmRTanFzbGxicEt2aXNlZTNuMHF5amY4?=
 =?utf-8?B?bEgxR1lrem1DOU8weGxFTjl4RGRxUGMwek1oSlUrbHRHS0ZkRHlGYk0wYlph?=
 =?utf-8?B?VHpyUmxMMzVvc0JNVGNIZC95TzNEMjZObmNTVlcybFhWeXZLL2ZaVmxGTGlj?=
 =?utf-8?B?RG5sdTFLS3pLMC9hNHNhdG04eVkyV3hBQmROa00xTUFWQVVGNlp2d0JnR2RM?=
 =?utf-8?B?ZjAwc3FtbTFDZyswd3BNRStHWXZlTm9FS1JKNm43U2JjVldnQjFPR2pkVWtD?=
 =?utf-8?B?d0RSbmlUUHlKSXBqb05JZXhwZmorOExHbHlRcHRZS3pveEhzYXFLTUtJWS8w?=
 =?utf-8?B?RVZoRjVKMWFMYmorSnYwV2E4TkUrZmozT3VEeS9ITFd4RHVWNW43a3VRUmx1?=
 =?utf-8?B?STc0cCtWREhFaC8yL1lPb1BTcXIxTGtVNlR3WHJMZVlXemVwRWZ6RnVsSnlI?=
 =?utf-8?B?a0xYUlQwZEhpanM0WHFIQ1V2VkxYenBSdEVYWmowY0dTNDlQTWJhQWJtbWZB?=
 =?utf-8?B?NFF6M1NUVXpqZVdXZEN1UkxMNWpzR2lMSEpXNnBCbUJBdFF0WDl1TmYrMW0y?=
 =?utf-8?B?bXNxbW5OWUtBK2hEdVlBU0FtWjN0N085Nm1GclZJVGkxUVk3b016c0RFcW1r?=
 =?utf-8?B?Y0U5cmxxM1N4MzkrYm1hYzVYQlArYVN3RExxa0VjWU1uQTc3bEhOMFRjTkdE?=
 =?utf-8?B?NW1IOWEwWkJwSWFJUm1HaTc1WFMzcVk4L2xqOWt0MC9XSDJGYW5jeVJaVjZE?=
 =?utf-8?B?elVsVVVXY2pzZ0FXM0dzaUFNMXBxT2pKU1hhUE9VOTZqS1lJbkVEMkxtZGFR?=
 =?utf-8?B?TEVvWUJMREJIUVc0Z09sNDA4VE9HRFVucmd1WEJFUWtTTHVINzFTTncrWkw2?=
 =?utf-8?Q?pcf9aWM3ap1qrzTKP+/dIGLZ9?=
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
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6670.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e364fdc-dbe2-4f91-b9d1-08dd1e009f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 18:36:57.7797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcwEflctNhp2fw7W8jsLVh7zokMkmzpivn7XrLkKy2MY5QRS38oosD7jZD1WU4nqTy6+bkaMYDExJJO1HPihAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9137

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lIEhhdHRvcmkgPGpv
ZUBwZi5pcy5zLnUtdG9reW8uYWMuanA+DQo+IFNlbnQ6IE1vbmRheSwgMTYgRGVjZW1iZXIgMjAy
NCA0OjI2DQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPjsgaGRlZ29l
ZGVAcmVkaGF0LmNvbTsNCj4gaWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20NCj4gQ2M6IHBs
YXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBKb2UgSGF0dG9yaSA8am9lQHBmLmlz
LnMudS0NCj4gdG9reW8uYWMuanA+DQo+IFN1YmplY3Q6IFtQQVRDSF0gcGxhdGZvcm0veDg2OiBt
bHgtcGxhdGZvcm06IGNhbGwgcGNpX2Rldl9wdXQoKSB0byBiYWxhbmNlIHRoZQ0KPiByZWZjb3Vu
dA0KPiANCj4gbWx4cGxhdF9wY2lfZnBnYV9kZXZpY2VfaW5pdCgpIGNhbGxzIHBjaV9nZXRfZGV2
aWNlKCkgYnV0IGRvZXMgbm90IHJlbGVhc2UgdGhlDQo+IHJlZmNvdW50IG9uIGVycm9yIHBhdGgu
IENhbGwgcGNpX2Rldl9wdXQoKSBvbiB0aGUgZXJyb3IgcGF0aCBhbmQgaW4NCj4gbWx4cGxhdF9w
Y2lfZnBnYV9kZXZpY2VfZXhpdCgpIHRvIGZpeCB0aGlzLg0KPiANCj4gVGhpcyBidWcgd2FzIGZv
dW5kIGJ5IGFuIGV4cGVyaW1lbnRhbCBzdGF0aWMgYW5hbHlzaXMgdG9vbCB0aGF0IEkgYW0NCj4g
ZGV2ZWxvcGluZy4NCj4gDQo+IEZpeGVzOiAwMmRhYTIyMmZiZGQgKCJwbGF0Zm9ybTogbWVsbGFu
b3g6IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIFBDSWUgYmFzZWQNCj4gcHJvZ3JhbW1pbmcgbG9n
aWMgZGV2aWNlIikNCj4gU2lnbmVkLW9mZi1ieTogSm9lIEhhdHRvcmkgPGpvZUBwZi5pcy5zLnUt
dG9reW8uYWMuanA+DQoNClJldmlld2VkLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlk
aWEuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvbWx4LXBsYXRmb3JtLmMg
fCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvbWx4LXBsYXRmb3JtLmMgYi9kcml2ZXJzL3BsYXRm
b3JtL3g4Ni9tbHgtDQo+IHBsYXRmb3JtLmMNCj4gaW5kZXggNjcxMDIxY2QxZjU5Li45YzdmMzBh
NDdmMWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L21seC1wbGF0Zm9ybS5j
DQo+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L21seC1wbGF0Zm9ybS5jDQo+IEBAIC02MjM3
LDYgKzYyMzcsNyBAQCBtbHhwbGF0X3BjaV9mcGdhX2RldmljZV9pbml0KHVuc2lnbmVkIGludCBk
ZXZpY2UsDQo+IGNvbnN0IGNoYXIgKnJlc19uYW1lLCBzdHJ1Y3QgcA0KPiAgZmFpbF9wY2lfcmVx
dWVzdF9yZWdpb25zOg0KPiAgCXBjaV9kaXNhYmxlX2RldmljZShwY2lfZGV2KTsNCj4gIGZhaWxf
cGNpX2VuYWJsZV9kZXZpY2U6DQo+ICsJcGNpX2Rldl9wdXQocGNpX2Rldik7DQo+ICAJcmV0dXJu
IGVycjsNCj4gIH0NCj4gDQo+IEBAIC02MjQ3LDYgKzYyNDgsNyBAQCBtbHhwbGF0X3BjaV9mcGdh
X2RldmljZV9leGl0KHN0cnVjdCBwY2lfZGV2DQo+ICpwY2lfYnJpZGdlLA0KPiAgCWlvdW5tYXAo
cGNpX2JyaWRnZV9hZGRyKTsNCj4gIAlwY2lfcmVsZWFzZV9yZWdpb25zKHBjaV9icmlkZ2UpOw0K
PiAgCXBjaV9kaXNhYmxlX2RldmljZShwY2lfYnJpZGdlKTsNCj4gKwlwY2lfZGV2X3B1dChwY2lf
YnJpZGdlKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50DQo+IC0tDQo+IDIuMzQuMQ0KDQo=
