Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492292;
	b=gHDClZlC1d4nnZxmoAQyH/ZeEHRu/svmofVnqA2xF24adHOBcbEXpD1olq70SmVHMWcZ
	 TnOirhArpqlRqNY9F1HIjFkakQSePC/uBV/Dk8FXdJGn5dRIzlkRDdWlSsxfkXtnf+3F4
	 iyANXQeKWSKTu32POVb3d9nVmO+T6qOiywwmnhyXOvGfu/8RawyStBnUDTYljlqjvIe3S
	 onXcIJdouC8Y5DIGJ+3em/PjrlQD5BtHKbeO/GiSOdpCQc6DxDobrU5wtXO37FO4xmRsh
	 Pu0NpWUkoJpX6ABvt7YxMx3Kk2z4ZfW2+3IhPhLNobVPK4BuTI5jXi5fwikxlGcjTbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492292;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=eoE1uM9bxa2z7nCnm+8oMP4gLC2A9vqWaVs1UsCXajY=;
	b=gfHtZEAIyxwc9sWq5f25ys1fbVhKRlC3ePezj5ouv5Y9mQPkhSFP7xUlnvBBJY1pr/Rb
	 9MSk5aTkqk0nRtdtsQuMP1aAaYPWgT/Gi1jM/m301uhrMGxkhzLT4NQEeXJ1tG9JDAHDM
	 Qw4ml7eP7TXz/Tzp9hgUNUKBvZAYmYHXo4GN/i4x2lotSPR1Sa2Lq9DG/8twpiuT0db95
	 C6hpIp7HMJs69BQd36ss4O0Hx9RP2TWdC2R4NvpAuCJSw2xNIFt9MYUvQsOeyU8MH7A+K
	 WKSWA8xety0uPr5pawcGvvfCDt9kUfCf1OAmgzdK54C9zsJ1CroxT4NagrsI19zVcGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UhGcrBux;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jD6cYLBC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72E606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 03:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC72E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UhGcrBux;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jD6cYLBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795492291; x=1827028291;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eoE1uM9bxa2z7nCnm+8oMP4gLC2A9vqWaVs1UsCXajY=;
  b=UhGcrBuxkbzP9rNEp61qjmPH1N0F8ppenVv70TqiAuSEY7Lq6dbmYHp3
   wB2cV/IDJNk1FzjOtKfHDRn740Bojea1eHp/DL7ia8sreXAkH0dmwCftd
   MXhmIGsce7bQEgwS0rgG3kN2+wAgiUx+mMJUjwpU5B3i42WVyIHUrLtgl
   3S8WBqzrX/1KVGB6TWDlLuNVfP4/zSRR84zMTdOtEY+OW0ZflEGpcfYfC
   PMADoc7jy+VDr+FIOUG5Dtb76eSx3JarYu6yEG3hE5jKvA7vcKWgBRJ5H
   IqcYDNhdSdrIrOlRCSfnMqjY/UIXc5eGu48PTiB7UqgGr9kUhvIh+nIWr
   w==;
X-CSE-ConnectionGUID: 34mE8x7PT2mkZS3kQFIzfg==
X-CSE-MsgGUID: mnrsCNAtRKeY402XZQbzPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4210116"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4210116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 19:51:30 -0800
X-CSE-ConnectionGUID: h0wqawxgTiWIuOHMdRQf5w==
X-CSE-MsgGUID: /iQ71u01SfWsGhfACzr8vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11775060"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 19:51:30 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 19:51:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 19:51:29 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:51:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9m0xd7Cq8pPr/xHxcSi8AzH7i4mdA/2gKNimgTQqmY1op7svsXpaT6sC5soFZKSXyW5Ql37CvhGM8qWmRZXma4di7wirQ1B2Kl/OUjSrXmXaJIgcSpFCFuK6mTNjOrcFPI1gBK7sx2Dqhu6TXfFfRWY4j0hWFV1rU3nQR8eGrm14E1flUnEX0sAM8vciPiEruF4cV3Fz919xRp9a/E+1nifHLcGb4JR25IFiyPNMvnkuBvvvSIYD18L7shFKN5PsPZocbm0R16cmMlm4Md37Oz0B0WRSnzWNNorDT2KYjT6nVT7ffA9UzPPBp1CN6d3MXsdTQDoGPjC4GKQJl6bog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoE1uM9bxa2z7nCnm+8oMP4gLC2A9vqWaVs1UsCXajY=;
 b=OBTroEi1JuvUGrmOsS7EfOBCitCZDu/S3zIzbmJI8B1yFT8A87xXJQveMZYPMEjkpP4ql8A2rWh345jWBc20sr2YI0tT9jBDpBKp2VeOmKc5Kqr3gd5NvvnpPFkloZ1VtoVTq+xujvMMcyK6Ybv5GfPNGZKxTlim4tJTYnKsPFcl5tDVptob9jbyvKOcwXvcF1AM0GnNQK9xyIR4e/AFs5sp+aJr5APkleU7ZA2K8yq+2D8r13RQftspHgbWmqISvvHxnNlGfcueHMi8t92DzobROEpXTtqaaL2S5iogxUS1ZJbL5i02Oov0g3WX8RpTB6BsMLpnSEz9JoLlw4DVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoE1uM9bxa2z7nCnm+8oMP4gLC2A9vqWaVs1UsCXajY=;
 b=jD6cYLBC665wCd1jhJoZ6v5W2poarEtfH81EcFHiVodIq4cH++ppo7twyprFU4Ml1cgv7UKevZt768Ix68hQTnXWD7YXvOV0PA33nHEF//H3arOwzJ5ECKxYYn41iFRgZ3Y49jECCBDvDkTGIAqAxtSBshj0pskzDt4iiv4kHaE=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SJ0PR11MB5152.namprd11.prod.outlook.com
 (2603:10b6:a03:2ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 03:51:27 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 03:51:27 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Vijay, Anoop C"
	<anoop.c.vijay@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
	"Roper, Matthew D" <matthew.d.roper@intel.com>, "Ausmus, James"
	<james.ausmus@intel.com>
Subject: RE: [PATCH v21 01/19] platform/x86/intel/pmt: Introduce a callback
 for discovery data
Thread-Topic: [PATCH v21 01/19] platform/x86/intel/pmt: Introduce a callback
 for discovery data
Thread-Index: AQHdeTGbHjHPMq5GZ0mXlseZPq6+src3ee0AgAUhdeA=
Date: Tue, 24 Nov 2026 03:51:27 +0000
Message-ID: <CH3PR11MB04614934A65470222160B93249C1442@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
 <20261120205540.1220643-22-michael.j.ruhl@intel.com>
 <07de3fd3-c7bb-74f2-9f3c-72c79271aed0@linux.intel.com>
In-Reply-To: <07de3fd3-c7bb-74f2-9f3c-72c79271aed0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SJ0PR11MB5152:EE_
x-ms-office365-filtering-correlation-id: 84b56c44-6597-45b3-c096-08df49de3769
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|38070700021|261026121527099003|261026130827099003|261026140227099003|261026135527099003|261102123227099003|261022075727099003|261022105027099003|261022113327099003|261022115727099003|11063799006|261021135927099003|261021121427099003|261021130227099003|4143699003|56012099006|10067099003|261021123027099003|261021133027099003|18002099003|22082099003|261009223027099003|3023799007;
x-microsoft-antispam-message-info: c2He8dJKvu6DrSWydnfABHRl8Kk8H3YF8jlxJKU4nrolbWefcHncipTLDJPbhQzQKsNRoaGX8Nkq47GDqGFAHPXNNZ4tIHeFAjwYDuGu9DDBeh6inszGi5k98O8ZGQo93VMJ919497Eogm2UVkLtFXMB75RD2mN2KWLPqc9wjdSRTiz61zrIibU/OOvJ4+025mwAuKpIBeuEjWomq5LahJq5Ak23YXSLm0tMhwj/RtUKXNjTzmv0pVLjUJdSaOiN1OFH1vRMaaApPFAg/jQLzbirqya9BmgkrwWK9NQFgR6EhQataFRynu73vasZjoejU9Qe3kK2nlRtZizMFFtPXDrgYhUydGDHd4MGwVuv0MIZsu/NaQ05Th2DTdM5WP4YgSfkS9G9Scasu5VW1VuGixwCK1QPjvomwOT8NsHADPRMaY9XuhBGTDJ1Ch4/vvQdbTJsiMOFxRHJUHZ9Vw16lMC+hAlNUeAkweHtUGdg616GBLlnCNp/EuL8oYfXhY6DPctAlIxiaLmmkjE0bQVhJ2alAl4korpa4KRI20Guyxj6bSZewW5TP2lXWtzjeZGqkmNXdmt530yOw79xgBgqq4y+IZQM0fbXlLZncfOOo+eTVImGNg9Dpm2f9n+wIeEbaM3lMuCGmp+3M40xuQ+o2o0us26BR8IQLFV/mTYA4Bk5n3KjU//efi6NgVHuxtK9LHWmRmGH9RskufkUqu7UPO65E0z7pUiEZGWER8Mybsg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(38070700021)(261026121527099003)(261026130827099003)(261026140227099003)(261026135527099003)(261102123227099003)(261022075727099003)(261022105027099003)(261022113327099003)(261022115727099003)(11063799006)(261021135927099003)(261021121427099003)(261021130227099003)(4143699003)(56012099006)(10067099003)(261021123027099003)(261021133027099003)(18002099003)(22082099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L256Z0x5RUJrdklXYTlnQmY3ODJzTG5ZOFZMaGZQUnBBTG1YWHhiUnd2UXJm?=
 =?utf-8?B?LzZ1c0ZlR094MkppZ2ZjRHpoMzdUYlBkbDNvQVNEWFBQL0FJZ3Z3NzNHeGt2?=
 =?utf-8?B?dXdoUlV1Qm11azI2R3VHQS9aOTdQODVxRkNLOVhtRGRtWWhPa3RUMS84MWxD?=
 =?utf-8?B?S21JZVVZeXg1dXM3c2ZHR1VPdlpPdXFTKzFnZnZtR1ZncVFBZ05mSGxUbW9H?=
 =?utf-8?B?WkxDVS9BY0hmU29xNUdKTnlRWFlaWkJ0VGlReEpIUmVWWnNFandnS01YNG5X?=
 =?utf-8?B?U3JPVnB3WFpXQWdCak5NSUZTdW4vM0hWdm1OYnJQSUhjNFBNS3RBSTN0YWtO?=
 =?utf-8?B?ZDhZT2kxQmlOZjh0ekhDTFMxSk9FZjhpWTJhVEZ6QXVNUVNDVWpucm52MUZJ?=
 =?utf-8?B?T0FwMC9SK1RBR1BoN04zN3YrRWlpWGZadmFQZmduVVFNUndNVkFUd0R5VVla?=
 =?utf-8?B?Rk5lSXNNaWVZTjZscnhJQ3dtaXlZLzZYMlpqS2s4WmdGdEdySWlhVlBVRkQy?=
 =?utf-8?B?UUdDYkVYVUF2ODBuNWJLc21ZZnVWSFU0Wm1nOXRIc3EySWhMMEdXVEQvM1Q0?=
 =?utf-8?B?cUxjNkUrb2Yza2wvSVJmN1lnUkpJK1BCcDFZQVV2RytqRG1zT0lXZ0FxMmp0?=
 =?utf-8?B?bVpFTkViWFVRMjRsVmlPNXJVVEhsUVdOQkc0WHR3Q1lyNFNocWNlU1dtWFlQ?=
 =?utf-8?B?T1RqdnZ4dFN2NStmRFU1VGVsNzZ1b2xvN2k4cUZieGpJNENyL2NGLzRsT2Rp?=
 =?utf-8?B?VXYwa2xKTUZOcWZjd2dHZzUwR1FzY1BJQkovNDMvYk0zdnVOdkgwZmZXSXpD?=
 =?utf-8?B?cWFibVZuSi8rVmZnMWVsMkhrWjVXTWVSTnByNFc2WlJ1MkJxQWpUVWp2MWR2?=
 =?utf-8?B?aVV2S21RSmNDVnNFRitaVWJSU0Q3RlNzOGlsaVM1bUhBaDNTUllNa2pJNzZO?=
 =?utf-8?B?eXZnR2NaR2diWFBwN1U1NUpYSVhSZjFmUDVTM0xWS2E2SGFNTWhrTzA5UllZ?=
 =?utf-8?B?WnI0cGVUcTdLNk9Tc2M3VGdrdUpmSUdjSmJWU3poSktzOVErbkpLWXprV3pP?=
 =?utf-8?B?dXVNUStZTWJlMnB0OHhRNHFyUHA0alRQb2VqOUp3VXczT2NDWHM2a3dOOFZG?=
 =?utf-8?B?OVQrekJ3VmFKM1ZyK0VodW5wQXhvVjB1VjR1YktxRzYveWUzcUg2SU5sNDlM?=
 =?utf-8?B?aXA4NEdhNitjWFc5R1l3VWNBNi9NV0hoVDZFTW1HS25MT3dCWnA2YU0rT3Ra?=
 =?utf-8?B?L2JZRm5oeWp2L1JNSm93eU1YcGRVK1hKWXJFQ1lnUUVqdmE0NkovUzJyTWJu?=
 =?utf-8?B?TXo2QVNFaEpWcGhQOFVVbXZucGtwdWJ1VmRCYytIVUVCVXNCSjczQm9YWHZs?=
 =?utf-8?B?a3pTbVVTRHpVZ0hJQnZTRHRmeit6QlJvTkp1c3QvejNNMXRKUnlXa3VoTld6?=
 =?utf-8?B?SG8xSUd1TkJYejhMRzdpRjJpVnd5UTJpL3Z3RFZxeXBMTk81K3FrN1dsUEZF?=
 =?utf-8?B?dE93WVVqVWhVSS9SU3BOSVZNYkVvbkpXSXBXNGRwMVFIeWhPZWEwMUYrUElM?=
 =?utf-8?B?SER6WjN0WHE2Z3I5TDVGZitKKzZ6T3MvTk1NRmJVOHVxaWcvOU16bmVyd0VH?=
 =?utf-8?B?RWN3WGZzRDczUmR1MXVVeGdmU1pWQXJvL29tOHRpYVFDalEyYVBRKzU1WnVC?=
 =?utf-8?B?RkRsaHJ5RUNoa0tzbUl1aDZySzNucE9pS29tQW5CdXl6TE02TGNldXlqLy9t?=
 =?utf-8?B?SHJPekdKaHE2ZnRweFZkS1I3VmdHYWNxdDk3aTBlOUtDZFNzVCswZnJVWGZY?=
 =?utf-8?B?RkhQaEJnbHVEdkxqR2piR1NrdXZtdVVCVXFvVitVVnFQZG9LU3hwUXdzeTA3?=
 =?utf-8?B?Y201d3JuQ2Q0ZVhHL2N2T3U4Zzd0RERwTnhJQWYvVHkxWnRYeDNYMmNsalBy?=
 =?utf-8?B?MFlkcFdsTUQ5RW11cHNHM3VCNG5oZjBWRnJEazFXU0dOTEJXbnNhSUZpejVy?=
 =?utf-8?B?bWNHeTY5Ynl5MmV4YXRCK01ENVJpUXZNVXNmMU5YOHFzb3c2THIrVzJMMzdh?=
 =?utf-8?B?NWNiZUlTbWJkTm15ZWNUQlZjczRHa3V3TlozZVZqZkptSEsxeFhlOXFGbVJi?=
 =?utf-8?B?TER5TmROMWhZcWJvZERtZER5T1RhNWRad2FsRXZMYWVCaGpXczdzYjNweTlq?=
 =?utf-8?B?NElackx2UnFaSjhBZjUxaldJaWJYWnpBYlFjdEVacXRTUStMTlFwbXpjZVdh?=
 =?utf-8?B?ZU8zaTY2TTYzWEdHbEhDY0grMTFvSFRUZWwwcG1BbEVQZjdEdzNVRUkxVkZi?=
 =?utf-8?B?dUZVNHhIbGttQlhuRGJXTFJvclpLZ2lJVmh0cm85Yks5QzdWdi9IQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jEUQ6x2lP/jMNxBw2NnseFHlURVVZ19mKISenc53Gx4Sl7wqu48uUQlMBbWj+krcqaLhP2GMmeM6QhosTvuHINTaABiSY/L2AnFaheRXD9QTRq8g9mQR7X/Uk6lYClcN+b69zEc3k4Ny/U+/GOgQq4YscbgMvSkSX0wisP7EXeXrG8uK1agsQPc0UwhsAuf7ETLrHBRXFdIJETEr5T2P0npMdEHj3ylcIYf9Jl/FhXo1Q3r3D+mxMFELyfBeLCh3j9MZtjqvKvywwbxhuWH962zM44334jTaRV9QSX1o+a14htKM6ZVXNPFXJhAeL5p4XPTKkYk6PjsvPifsDBVbBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b56c44-6597-45b3-c096-08df49de3769
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 03:51:27.0958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cuPFsUyingVulIa/BbwsMzcgVHH8WjrBaIxLzyJDLaX/DkNPriO6sLoFXaLco/v0A0KrC5KxbgC3QRcf6flB0q2KUjZy5VI5+zHA89d/4Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IElscG8gSsOkcnZpbmVuIDxp
bHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4NCj5TZW50OiBGcmlkYXksIE5vdmVtYmVyIDIw
LCAyMDI2IDQ6MjkgUE0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+DQo+Q2M6IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEhhbnMNCj5kZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9y
Zz47IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47DQo+Vml2aSwgUm9k
cmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IHRob21hcy5oZWxsc3Ryb21AbGludXguaW50
ZWwuY29tOw0KPmFpcmxpZWRAZ21haWwuY29tOyBzaW1vbmFAZmZ3bGwuY2g7IGRhdmlkLmUuYm94
QGxpbnV4LmludGVsLmNvbTsgVmlqYXksDQo+QW5vb3AgQyA8YW5vb3AuYy52aWpheUBpbnRlbC5j
b20+OyBOaWxhd2FyLCBCYWRhbA0KPjxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT47IFJvcGVyLCBN
YXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Ow0KPkF1c211cywgSmFtZXMgPGph
bWVzLmF1c211c0BpbnRlbC5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCB2MjEgMDEvMTldIHBs
YXRmb3JtL3g4Ni9pbnRlbC9wbXQ6IEludHJvZHVjZSBhIGNhbGxiYWNrDQo+Zm9yIGRpc2NvdmVy
eSBkYXRhDQo+DQo+T24gRnJpLCAyMCBOb3YgMjAyNiwgTWljaGFlbCBKLiBSdWhsIHdyb3RlOg0K
Pg0KPj4gU29tZSBkZXZpY2VzIHJlcXVpcmUgc3BlY2lhbCBoYW5kbGluZyB0byBhY2Nlc3MgZGlz
Y292ZXJ5IGRhdGEuDQo+Pg0KPj4gQ3Jlc2NlbnQgSXNsYW5kIEdQVXMgaGF2ZSBhIHdpbmRvd2Vk
IGFjY2VzcyB0byBkaXNjb3ZlcnkgYW5kIGRhdGEuDQo+PiBCZWNhdXNlIG9mIHRoaXMsIGRpcmVj
dCBhY2Nlc3MgdG8gdGhlIGRldmljZXMgTU1JTyBzcGFjZSBjYW4gYmUgdW5zYWZlLg0KPj4NCj4+
IEEgZnVydGhlciBkaWZmaWN1bHkgaXMgdGhlIHJlYWRfZGF0YSBwYXRoIHJlcXVpcmVzIGEgR1VJ
RCB3aGljaCB3aWxsDQo+PiBub3QgYmUga25vd24gdW50aWwgYWZ0ZXIgZGlzY292ZXJ5LCBzbyB0
aGUgY3VycmVudCByZWFkX2RhdGEgY2FsbGJhY2sNCj4+IGNhbm5vdCBiZSB1c2VkLg0KPj4NCj4+
IFByb3ZpZGUgYSBjYWxsYmFjayB0aGF0IHVzZXMgdGhlIGNhcGJpbGl0eSBhbmQgZGlzb2N2ZXJ5
IGluZGV4LCBmb3INCj4NCj50eXBvIHgyLg0KDQp4MyBhY3R1YWxseSAoZGlmZmljdWx5KS4uLiBm
aXhlZC4g8J+Yig0KDQpSb2RyaWdvIGlzIGxvb2tpbmcgZm9yIGFuIEFjayBmb3IgdGhlIFBNVCBw
YXRjaGVzIHNvIGhlIGNhbiBtZXJnZSB0aGVtIGluIHRoZSBEUk0gDQpwYXRoLg0KDQpJZiB0aGVz
ZSBwYXRjaGVzIChwYXRjaCAxIGFuZCAyKSBtZWV0IHdpdGggeW91ciBhcHByb3ZhbD8NCg0KVGhh
bmtzLg0KDQpNaWtlDQoNCg0KPj4gcmVhZGluZyBkaXNjb3ZlcnkgZGF0YS4NCj4+DQo+PiBSZXZp
ZXdlZC1ieTogRGF2aWQgRS4gQm94IDxkYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb20+DQo+PiBT
dWdnZXN0ZWQtYnk6IERhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5j
b20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuYyB8
IDE4ICsrKysrKysrKysrKy0tLS0tLQ0KPj4gIGluY2x1ZGUvbGludXgvaW50ZWxfdnNlYy5oICAg
ICAgICAgICAgIHwgMTAgKysrKysrKysrKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0
Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmMNCj5iL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVs
L3BtdC9jbGFzcy5jDQo+PiBpbmRleCAyYjExYzQwMTJmNmEuLjYwMWNkZjY4ZjBiYyAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC9jbGFzcy5jDQo+PiArKysg
Yi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuYw0KPj4gQEAgLTQ2NiwxMiAr
NDY2LDE3IEBAIHN0YXRpYyBpbnQgcG10X2dldF9oZWFkZXJzKHN0cnVjdA0KPmludGVsX3ZzZWNf
ZGV2aWNlICppdmRldiwgaW50IGlkeCwNCj4+ICAJc3dpdGNoIChpdmRldi0+c3JjKSB7DQo+PiAg
CWNhc2UgSU5URUxfVlNFQ19ESVNDX1BDSTogew0KPj4gIAkJc3RydWN0IHJlc291cmNlICpkaXNj
X3JlcyA9ICZpdmRldi0+cmVzb3VyY2VbaWR4XTsNCj4+ICsJCXN0cnVjdCBwbXRfY2FsbGJhY2tz
ICpjYiA9IGl2ZGV2LT5wcml2X2RhdGE7DQo+PiAgCQl2b2lkIF9faW9tZW0gKmRpc2NfdGFibGU7
DQo+PiArCQlpbnQgcmV0ID0gMDsNCj4+DQo+PiAgCQlkaXNjX3RhYmxlID0gZGV2bV9pb3JlbWFw
X3Jlc291cmNlKGRldiwgZGlzY19yZXMpOw0KPj4gIAkJaWYgKElTX0VSUihkaXNjX3RhYmxlKSkN
Cj4+ICAJCQlyZXR1cm4gUFRSX0VSUihkaXNjX3RhYmxlKTsNCj4+DQo+PiArCQkvKiBVc2VkIGJ5
IGNyYXNobG9nIGRyaXZlciAqLw0KPj4gKwkJZW50cnktPmRpc2NfdGFibGUgPSBkaXNjX3RhYmxl
Ow0KPj4gKw0KPj4gIAkJLyoNCj4+ICAJCSAqIFRoZSBtYXBwZWQgcmVzb3VyY2UgaXMgc2l6ZWQg
YnkgdGhlIG5hbWVzcGFjZSdzIERWU0VDDQo+PiAgCQkgKiBlbnRyeV9zaXplIChpbiBkd29yZHMp
LCB3aGljaCBjYW4gYmUgbGVzcyB0aGFuIHRoZSBkZWZhdWx0DQo+PiBAQCAtNDgwLDEzICs0ODUs
MTQgQEAgc3RhdGljIGludCBwbXRfZ2V0X2hlYWRlcnMoc3RydWN0DQo+aW50ZWxfdnNlY19kZXZp
Y2UgKml2ZGV2LCBpbnQgaWR4LA0KPj4gIAkJICogcmVnaW9uLg0KPj4gIAkJICovDQo+PiAgCQlt
ZW1zZXQoZW50cnktPmRpc2NfaGVhZGVyLCAwLCBoZWFkZXJfYnl0ZXMpOw0KPj4gLQkJbWVtY3B5
X2Zyb21pbyhlbnRyeS0+ZGlzY19oZWFkZXIsIGRpc2NfdGFibGUsDQo+PiAtCQkJICAgICAgbWlu
KGhlYWRlcl9ieXRlcywgcmVzb3VyY2Vfc2l6ZShkaXNjX3JlcykpKTsNCj4+IC0NCj4+IC0JCS8q
IFVzZWQgYnkgY3Jhc2hsb2cgZHJpdmVyICovDQo+PiAtCQllbnRyeS0+ZGlzY190YWJsZSA9IGRp
c2NfdGFibGU7DQo+Pg0KPj4gLQkJcmV0dXJuIDA7DQo+PiArCQlpZiAoY2IgJiYgY2ItPnJlYWRf
ZGlzY292ZXJ5KQ0KPj4gKwkJCXJldCA9IGNiLT5yZWFkX2Rpc2NvdmVyeShpdmRldi0+ZGV2LCBp
dmRldi0+Y2FwX2lkLA0KPmlkeCwNCj4+ICsJCQkJCQkgZW50cnktPmRpc2NfaGVhZGVyKTsNCj4+
ICsJCWVsc2UNCj4+ICsJCQltZW1jcHlfZnJvbWlvKGVudHJ5LT5kaXNjX2hlYWRlciwgZGlzY190
YWJsZSwNCj4+ICsJCQkJICAgICAgbWluKGhlYWRlcl9ieXRlcywNCj5yZXNvdXJjZV9zaXplKGRp
c2NfcmVzKSkpOw0KPj4gKwkJcmV0dXJuIHJldDsNCj4+ICAJfQ0KPj4gIAljYXNlIElOVEVMX1ZT
RUNfRElTQ19BQ1BJOiB7DQo+PiAgCQltZW1jcHkoZW50cnktPmRpc2NfaGVhZGVyLCAmaXZkZXYt
PmFjcGlfZGlzY1tpZHhdWzBdLA0KPmhlYWRlcl9ieXRlcyk7DQo+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9pbnRlbF92c2VjLmggYi9pbmNsdWRlL2xpbnV4L2ludGVsX3ZzZWMuaA0KPj4g
aW5kZXggODY4NmU3OWM0Zjc1Li5lNGFmZGI2NDc4ZTMgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRl
L2xpbnV4L2ludGVsX3ZzZWMuaA0KPj4gKysrIGIvaW5jbHVkZS9saW51eC9pbnRlbF92c2VjLmgN
Cj4+IEBAIC05NCw2ICs5NCwxMSBAQCBlbnVtIGludGVsX3ZzZWNfcXVpcmtzIHsNCj4+ICAgKiAq
IGRhdGE6ICBidWZmZXIgZm9yIHRoZSBkYXRhIHRvIGJlIGNvcGllZA0KPj4gICAqICogb2ZmOiAg
IG9mZnNldCBpbnRvIHRoZSByZXF1ZXN0ZWQgYnVmZmVyDQo+PiAgICogKiBjb3VudDogc2l6ZSBv
ZiBidWZmZXINCj4+ICsgKiBAcmVhZF9kaXNjb3Zlcnk6IHdoZW4gc3BlY2lmaWVkIGNhbGxlZCBi
eSBjbGllbnQgZHJpdmVyIHRvIHJlYWQgUE1UDQo+ZGlzY292ZXJ5IHN0cnVjdHMNCj4+ICsgKiAq
IGRldjogICAgICAgZGV2aWNlIHJlZmVyZW5jZSBmb3IgdGhlIGNhbGxiYWNrJ3MgdXNlDQo+PiAr
ICogKiBjYXBfaWQ6ICAgIGlsb2cyIG9mIFZTRUNfQ0FQIHZhbHVlDQo+PiArICogKiBpZHg6ICAg
ICAgIGluZGV4IHRvIGFjY2VzcyBiYXNlZCBvbiB0aGUgY2FwYWJpbGl0eSBoZWFkZXIgZW51bWVy
YXRlZCBieQ0KPmludGVsX3ZzZWNfcmVnaXN0ZXIoKQ0KPj4gKyAqICogZGlzY19kYXRhOiBQTVRf
RElTQ19EV09SRFMgZHdvcmQgc2l6ZWQgYnVmZmVyIGZvciB0aGUgZGlzY292ZXJ5DQo+ZGF0YSB0
byBiZSBjb3BpZWQNCj4+ICAgKiBAcmVhZF9yZWc6IHdoZW4gc3BlY2lmaWVkIGNhbGxlZCBieSBj
bGllbnQgZHJpdmVyIHRvIHJlYWQgUE1UIHN0YXRlDQo+PiAgICogKiBkZXY6ICAgICAgZGV2aWNl
IHJlZmVyZW5jZSBmb3IgdGhlIGNhbGxiYWNrJ3MgdXNlDQo+PiAgICogKiBndWlkOiAgICAgSUQg
b2YgZGF0YSB0byBhY2Nlc3MNCj4+IEBAIC0xMDQsOSArMTA5LDE0IEBAIGVudW0gaW50ZWxfdnNl
Y19xdWlya3Mgew0KPj4gICAqICogZ3VpZDogICAgIElEIG9mIGRhdGEgdG8gYWNjZXNzDQo+PiAg
ICogKiByZWdfZGF0YTogcmVnaXN0ZXIgZGF0YQ0KPj4gICAqICogb2Zmc2V0OiAgIG9mZnNldCBv
ZiByZWdpc3RlciB0byB3cml0ZQ0KPj4gKyAqDQo+PiArICogTk9URTogQ2FsbGJhY2tzIG1heSBi
ZSBjYWxsZWQgZnJvbSB0aGUgY2xpZW50IGRyaXZlcidzIHByb2JlIGFuZCByZW1vdmUNCj5wYXRo
cy4NCj4+ICsgKiAgICAgICBBIHBhcmVudCBNVVNUIG5vdCBob2xkIGEgbG9jayB0YWtlbiBieSB0
aGUgY2FsbGJhY2tzIGFjcm9zcyB0aGUNCj5yZWdpc3RyYXRpb24NCj4+ICsgKiAgICAgICBwYXRo
IG9yIHdoaWxlIGl0cyBkZXZpY2VzIGFyZSBiZWluZyByZW1vdmVkLg0KPj4gICAqLw0KPj4gIHN0
cnVjdCBwbXRfY2FsbGJhY2tzIHsNCj4+ICAJaW50ICgqcmVhZF90ZWxlbSkoc3RydWN0IGRldmlj
ZSAqZGV2LCB1MzIgZ3VpZCwgdTY0ICpkYXRhLCBsb2ZmX3Qgb2ZmLA0KPnUzMiBjb3VudCk7DQo+
PiArCWludCAoKnJlYWRfZGlzY292ZXJ5KShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxv
bmcgY2FwX2lkLCB1MzIgaWR4LA0KPnUzMiAqZGlzY19kYXRhKTsNCj4+ICAJaW50ICgqcmVhZF9y
ZWcpKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGd1aWQsIHUzMiAqcmVnX2RhdGEsIHUzMg0KPm9m
ZnNldCk7DQo+PiAgCWludCAoKndyaXRlX3JlZykoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgZ3Vp
ZCwgdTMyIHJlZ19kYXRhLCB1MzINCj5vZmZzZXQpOw0KPj4gIH07DQo+Pg0KPg0KPi0tDQo+IGku
DQoNCg==
