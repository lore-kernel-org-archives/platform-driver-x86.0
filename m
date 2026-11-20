Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184614;
	b=x0TI/4Xeuzi5LUU44h0hIobeWyFRWifVzzYG8C917YSKDr9YHvvTJlqo5zP2hi64rmy+
	 8G+Ag1YvOHhygNSRIAI7oROjlewCG4HE0QiOTlq0Gue1G7O74rX9LdoUa04/NTdO98Ti/
	 N8xJVEyBTpwrYVTkQsn7s7Z2PJFIeYCmwb1LkX5sjsE2dZB0wWNGwr+gXdpqMHz56Q9ez
	 s6BG3hiJfz6whUcJ4dI1iDEHbZSrLnZSDJVzUQNjJMEs38IfYeprJrIekf5+7elT29x3e
	 Y6kdXn6s4QPgnzFsQMNJ6fZFL9Vj1U2/8J0zHuuzs3Cy50jsss9pUJh68MuAQ4LqZ2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184614;
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
	bh=59L9Cr16d7ML3OUTI1LhKWVjObsZgd0p/4J3+z3D4SA=;
	b=ZLzuO2SQKD0O24B2x8xz2+36LsB7O5+InsPyr8c4UBnbW9E/bIHab4NYnRjoyWVBDt+9
	 1CxotP6YY+Og7aVcnz5VUCvfjGib/HZd+fVVT/u/Xwq09ARg/l3IS5nm17EUz6jnBaKbk
	 hgjSnz+uGDljLSCswsRWkgDHTybsqv99rMDcanACCucy8dUB5zhOmlfppd8aQk8aHblJI
	 vrJI2J9ZGK17Wj5jkugwk/DIeslhMFFSPboXsnqD3BoqDbUqytU0rDlB1uAeS0DF/c2m8
	 0G09YX51X1hUHD8XxFOq2zy8M6RK2Rz1eZsemVp11+KBrUaAjPfqz3jqZqgLR4YBnog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PJmfGeAQ;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=M1BN8McO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D17606A320
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 14:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D17606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PJmfGeAQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=M1BN8McO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795184614; x=1826720614;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=59L9Cr16d7ML3OUTI1LhKWVjObsZgd0p/4J3+z3D4SA=;
  b=PJmfGeAQKbcE8SL/wfQV50s7rCVrCdS1blxGRKDcwLAL0lQHRfXIa+5F
   rK9KqIiFMMl7mQQHHhbG/sApSmuezam5hkUZC9riytcZQvNJzKx+kJuIU
   rQossnKah8H5zHsQJqFyrEu37sAgRxdoa2M2I/ou4443Fpo5IvioS5ABY
   bTkc+pszIIGoCARK67S6hhPhzICDuWPpTm/on/kzMOLXAEesikwPSA6vH
   F6GOGP/V/mZ1bWCi38psUIvbVOI9j6RLjBirJAovCsZXIJ4IEV+LJWLyw
   DOfLY9ZmiKZvgYHwl/iaT0fWhLz6Qa9s90MBbhiDuXrbf8Nc/jT4N72uE
   g==;
X-CSE-ConnectionGUID: NokOqoSuRkCPiF0YB/AffA==
X-CSE-MsgGUID: +TDW/CC3TiG5ABZnQgloWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3908822"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3908822"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:23:33 -0800
X-CSE-ConnectionGUID: +ZUXoaVaRBuAF7rUeluHnQ==
X-CSE-MsgGUID: BFwCIUTJRbuBH2fPgp/WPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10925351"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:23:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 06:23:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 06:23:32 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 06:23:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOIH8PnCoVCkOaZKd3hbaUm/iNAcaE8Pael3QLT9IRoLR1eYdhsYDEnF992RSmvPOzcpYd/johJQ0yapZ6mSEMXCxSK2mwhC7wExm7uuibA1R16iHGHe/j1Mmug5IJ9JBeh/2z2O9GTQQmVG/57eDQmXO9wDR7eMGS5MDJQEpXcbMhTkEANb+agEAbGnZ93KXaiYVKk7tA7afgu99ohR6W985bY2OD2qWGeGbI4mhP5fY1JZsPp7JrLfKm/U5Fz06UahYm+nBfvZnb9ZO0E3lqM0FBqi3jYs26l/m5y2EU6AZNHXSFvcL7tE9I9dBrnRkg3xIJNwkJz857BNF9iPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59L9Cr16d7ML3OUTI1LhKWVjObsZgd0p/4J3+z3D4SA=;
 b=YAHoK+QkTRNYHbVJ9ALM3IA4nOnBQ12go3IDVUNkVDBFIfiXd85YFAc0uIIeYZDOGCAcSEcdfPWWDuVEdsU5xa12PFiE3Q4FOfoJakE/uLKltIb+UPf9A6pX2NGKl2ETRIIGqvODyz3su7wnavxBeRn5JMWBGnqWW/H7IkuF2v5ClbxEilmF5kEi3+3Dnq/VmBiLvTb20McPzE7NDum/7Lg7QT0YJXc2eM9zb8THAZVjD6i1VVq9CHPuu3c7KWKIrvJETXxIVqY8+bRvMnh3HqPYBm30zcE9DgfR4rB7vGQYJ0E4OCi3B6XAgas5/W/X33qWS3BkF5mD/KRhpKwiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59L9Cr16d7ML3OUTI1LhKWVjObsZgd0p/4J3+z3D4SA=;
 b=M1BN8McO6jAxMAOmct70yGISVOPGsbZkOWMNIgW35t81COdPMoSSZOsDRZ79NuIR60/zowmSp4VvRj0DKGETYVOY8VwFP+rsMSfTNXJ5zhiBHJYrjYFDhoo2GYDSpV7FAvOV3SCCW/GpeQLIWuhFRe2FimvmLZL9FUMx/hnPXcU=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by LY0PR11MB985279.namprd11.prod.outlook.com
 (2603:10b6:404:220::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 14:23:29 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 14:23:29 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hansg@kernel.org" <hansg@kernel.org>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Brost, Matthew"
	<matthew.brost@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"Vijay, Anoop C" <anoop.c.vijay@intel.com>, "Ausmus, James"
	<james.ausmus@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v19 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH v19 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdeD52JylSp6IEqkylfAeVWgrdgrc14s+AgAAHl8CAAAZigIABEulA
Date: Fri, 20 Nov 2026 14:23:29 +0000
Message-ID: <CH3PR11MB04614910F55B9CF37E2270F5C5C1782@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
	 <20261119155438.40762-35-michael.j.ruhl@intel.com>
	 <av9kgfXlujk2SeT-@intel.com>
	 <CH3PR11MB04614920DB3241FA3B0089DE72C1792@CH3PR11MB046149.namprd11.prod.outlook.com>
 <9e9a9edc41b3a81839505443ffa312c0edd7fea5.camel@intel.com>
In-Reply-To: <9e9a9edc41b3a81839505443ffa312c0edd7fea5.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|LY0PR11MB985279:EE_
x-ms-office365-filtering-correlation-id: b185ca65-056d-4133-7b17-08df4711d95c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|4143699003|261022113327099003|11063799006|261021130227099003|261021135927099003|261009223027099003|261021121427099003|261021133027099003|261022075727099003|261102123227099003|56012099006|261026130827099003|261026140227099003|261026135527099003|261026121527099003|261022115727099003|261028144727099003|261022105027099003|261021123027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: P08cmdscBrqB3rHyqpp6Swkf7oMDYSNdZKcfKtwWj0rBzqnI1Erjjx6jHRmEnH7ahyO3+ReA+dttFezPMNb4QdopykW6rxL2PPa8bnob5RD7lnBnD6RRHdl47fuXd0pgftqTsib4Mjzar1QTDq3aoqxw54+MtrQn/E9U5q9zVTSlB/aAfrnE2YKtXKXIJ74m45Q06HsUWk+nj5q4Et0465gf0bYV26xEmKl3ioKg5i6/CcpsI3Q2JqHYyl27QsuUAkqVv2UVzmDQjS2l9TanwDN8COLfvlvhu/obe3O+BL0ZUl/gI6lCRpaA8mJWgfwCT7fkQEuHQmmNLc77ITdQAzIqvXszUSP2De/xdH572Rpgb91Iha4+6sg1d8YR4/cHWzirxsPoyvJK3nnxItfLNQzutwUoW+HB6nTgB6mr7pvE9XbznNR++0TW33YcfJOk5ZN8L4L8HG3bZEh0AirmbR/WDC7fyrXVOjbwBG48v1GaU6WPWpYjLh/AJr4BWsKoFyWOjhiy+0ps6EEen5u+mVbCBUS8BS+gQ5M56OFHGYsSjaJfItC9iOnBd20Rau/Yu837nc9GhDhK2dh8fODpC0SGgQRD6GjIaM5uxaZV2WmvMgeI/dnGjx296O+zsBVfWjtmx6ApU5ALpVp1LLztI8sBlVF/Vcm16pjxqI/wc7FtUc6nGRHQubrhesdTbb/+sNg0e132yr/0UTa1E500PepqTlOAJ9IZ4lyXyW5x9MM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(4143699003)(261022113327099003)(11063799006)(261021130227099003)(261021135927099003)(261009223027099003)(261021121427099003)(261021133027099003)(261022075727099003)(261102123227099003)(56012099006)(261026130827099003)(261026140227099003)(261026135527099003)(261026121527099003)(261022115727099003)(261028144727099003)(261022105027099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXVqR2l0ZExOaFF2NWpDVHZkb0hEVEV4YUpCK2w1SXNjay9yZG4yQVVVa2xt?=
 =?utf-8?B?Q3hwelBlbGlwL0dFZmRUZ09PZTQ1dzNIVHAzajlJNi95TzhyV1VpZEtkY1Vi?=
 =?utf-8?B?MzFCcEJKU0dCR3ZEb0E1TjdlK0J5WDYvRzNMbWRKcjRFREJwemFURDZNNERD?=
 =?utf-8?B?K2kxd2g1WkJDVTduaU1TaHo2Y1gyUzM2a1E1UlAyZXBpOUVCUEtRVjltN3Bs?=
 =?utf-8?B?M2tDTXRLSjBFRVFvS3FDSmlSdkdwYzl6NmZlTHdKVGJvRnJBVzNzWDVmSWVj?=
 =?utf-8?B?WVhpTmNKb3pGbTJpUHlGMkREbGFLa2RHRG91QkFFTHNjM3NSeWNQcDAzS0VT?=
 =?utf-8?B?eVhJNGdOVVRTNTkvMFlBN2YvaVZuTDBpeE9qalgwc2trVDN2dGo4OTRFb28z?=
 =?utf-8?B?T0FQd0xYNzdzZDZ0ZGp1bEdEWklaUGt3YUtCSTYwTDlCV01jc1ZVa3d1RWM2?=
 =?utf-8?B?Z2dpa0twU1B1RlBOdlFGcnJVMURjMFA0aytQMSsrbDBjd3hQdWQ4YzRSaHdk?=
 =?utf-8?B?R241aGo3K3ZxdkZPdHZxelh0b0tWaU5aZHNnRUxXZTNJWUlWT0d6ZlljWWRv?=
 =?utf-8?B?bHJidE8vSHo5K0VPcjlIRDRDY3BwaVp0ZGx3VEJKNEVReW1saTJuY0FqdC9x?=
 =?utf-8?B?MWtGYnM1UGVwRnI1UHhLOGgzVVZnWExad1B6SDc1TUFPM2VsbjVxYVRGR3lD?=
 =?utf-8?B?VUFKWkp6djNQdGhqYWJmNnUya2ZBaitMcDkzUFVyRnJnMVVFU0xRbWdnQWhL?=
 =?utf-8?B?MGt0aWRNQmRhbFBuWmdkRVJDUGJNVGdZOUtzdkh0YzE4bFozQTZ6SEFyUjZS?=
 =?utf-8?B?Z3J2MnlKaWZYNlk0TFcvMWp5RXptMlZVZEpUU2Y0eXZHSGVmMHJIV2RlWnFq?=
 =?utf-8?B?bk50N0VRcllqb01wbUs2UGVrVnoyMVJLbEI3RWVjcURia0xFMG5VQk96Unph?=
 =?utf-8?B?WFhuQXV3ZWw3SlhnellydngzZmpGeEgzdDBCK2NTNnlpdUF1QU1tWnBTUmQx?=
 =?utf-8?B?ZERVbnJ4NWVxSDR2Z2c1Q2wyaWdhRHpOc3dTWDVWaGJIK0xjdVNBeUI5UTBw?=
 =?utf-8?B?NHp3U0ZickI5WjNGcHJSZjk4cWpvUDZTMHkvSUdyZFVjN2tESEdYd2xncndy?=
 =?utf-8?B?b0dTM0tCUEZXT1ZRMVFiUStkNUN4dG8zaFpuNnNWdlZrblp1T1NNVnlsMGZr?=
 =?utf-8?B?S1VrYjZmQkhFT2xGNGNKMlByQjlPK2ZzcE00S3YyWi9GRGdxOFd4M1pKQmVU?=
 =?utf-8?B?c1V5Ymt6MldMMkNmQWczcUNoT1FjNEZQRnZsa0c4U1FYOEpPbmszWnJycGhF?=
 =?utf-8?B?VEpWRTNqOTNFbHFRTVp5UHRjZTlFd0JvdnNEZEVxQVIzUmZMNzQ4NEM0UHBS?=
 =?utf-8?B?cjZhck55anIvbE5laDNSOTBrclZWSzd6ZDJKTnkvdW5iKzhqT3NLZlNXODhk?=
 =?utf-8?B?Qnp4ZFl5cE53dyt3UTczczArRStqTWU2d1BFOGVLd0NGd20zeHp4c284dVV3?=
 =?utf-8?B?NGFlb3NuK3h0TmZyS2JKSURRenVvZmNiZUptSnZZYUNRR2VMSUdhZ3l5ZGJv?=
 =?utf-8?B?V1ZIRXpZWG5mb2E4Wk9EMW1tM1MveHFzM0xxUUI1TFVVd2JUaXkreTI3aURo?=
 =?utf-8?B?aEV5eVNITWxJMU42bW9BK010aTNOYXRKVEM3SnlLNnFsdm42OHdITGxTcTV1?=
 =?utf-8?B?KzA2b29jZXZrakVJeGFBNUZhdlJwYkhmcFozczN0b3pjUVZnWVFDOVNTeDZu?=
 =?utf-8?B?NXlyUlZzd09PWm83dWlKekZSL2ZvVDU5UkMyS2NLd3cveDg5RHNpV3FPQzdy?=
 =?utf-8?B?YTJyYUhkZExLZjJLelZ6RGhMdW9jUENrUldGKzJLWEwvNzUzOUxKSFVrVWI3?=
 =?utf-8?B?TnVuMHFIS1I2bGlkbVZNTFM0bzdCVHhlR0QvNWtwUEtQd3BUWlBIbE9SeldJ?=
 =?utf-8?B?RjhxYTY4YkhJbzhVUlBRTGU3eXROTjZkVWRRdFpYbmxoTUhrU0loMnJYYkVI?=
 =?utf-8?B?Q21oeGpuZVBVUG5HNUxVdDZyUVlZdTJtS0pvRXJSY3g5eHBBRlVicEJ2MC9o?=
 =?utf-8?B?c1cxaDB1UHoxY29xOWZIbWM2WGFoN2RtWVZmVmkyMFJPSDhGcGV0eHBBWisv?=
 =?utf-8?B?a1FTakhMYjlYcEVqZGxPUCtXb2Z1ek53VDJHeVhPcVVTUURjdXJxdFM5Qjc3?=
 =?utf-8?B?S3phRE5tYXEvK3loQ0hmTkUzcnQ4OXQ4SDlwUC9kcGlYSmtXR3kwZkhKeXNB?=
 =?utf-8?B?dWpHUm9JZkdrRWlJWjd5OXJhL2kyUEZua1BNQWtoblduN1hqdE03RTRBOFh0?=
 =?utf-8?B?OGNOZFQzMklwN0pyRUplMlo1Q01oZ3NwRnl3RDhSZkc0U3FDN3U4QT09?=
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
X-Exchange-RoutingPolicyChecked: 3QUTe0FqdEwcs75zbjL0GXdS6xvdPC19aMoYuq53FnMXDWpH+gBm2DK10KzZBtvrHLE1vLbsBeT18kDrXgBomzZ46UhwC54Ak6ckKZe7HJ3i6M8H2WOnq8GUYfeN3cm4Tn6mPUrnVgo05FNSDCUIX6LOvootYvhlVboTYvtDf1meeof7i6xpxmAHjNTgam8sXwc0G4+Wn6oRGo0qsGfR1OqDmjy4p4+NHype6TQPYFYjSWxstbnLejZwMn4ahCKXc9tEm5w8SVQ8lEfGfDi8uvuxf4dd5N78pVlZRC3pRWVyiGEvrdeKca5XBMc8ZoSuW20u3r82gAGXxpajymR94g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b185ca65-056d-4133-7b17-08df4711d95c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 14:23:29.6498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8yqAPzIckZr4IP0V2MmPvJl/u4zkn0C/TaF+utEgxprhDE0uftRzkO9Fnydoc/lDhlhZkTuJRdZ4YlFlN7vInUI5cjVY7onnXtIwZKB30M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB985279
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+DQo+U2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE5LCAyMDI2
IDQ6NTUgUE0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+
DQo+Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaGFuc2dAa2VybmVsLm9yZzsN
Cj5kYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb207IHNpbW9uYUBmZndsbC5jaDsgaWxwby5qYXJ2
aW5lbkBsaW51eC5pbnRlbC5jb207DQo+Um9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVy
QGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+PG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsg
YWlybGllZEBnbWFpbC5jb207DQo+dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb207IFZp
amF5LCBBbm9vcCBDIDxhbm9vcC5jLnZpamF5QGludGVsLmNvbT47DQo+QXVzbXVzLCBKYW1lcyA8
amFtZXMuYXVzbXVzQGludGVsLmNvbT47IE5pbGF3YXIsIEJhZGFsDQo+PGJhZGFsLm5pbGF3YXJA
aW50ZWwuY29tPjsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0
OiBSZTogW1BBVENIIHYxOSAxNC8xOV0gZHJtL3hlL3ZzZWM6IENyZXNjZW50IElzbGFuZCBQTVQg
Y2FsbGJhY2tzDQo+DQo+T24gVGh1LCAyMDI2LTExLTE5IGF0IDIxOjQxICswMDAwLCBSdWhsLCBN
aWNoYWVsIEogd3JvdGU6DQo+PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiA+IEZy
b206IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+PiA+IFNlbnQ6IFRo
dXJzZGF5LCBOb3ZlbWJlciAxOSwgMjAyNiA0OjA1IFBNDQo+PiA+IFRvOiBSdWhsLCBNaWNoYWVs
IEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4+ID4gQ2M6IHBsYXRmb3JtLWRyaXZlci14
ODZAdmdlci5rZXJuZWwub3JnOw0KPj4gPiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
DQo+PiA+IGhhbnNnQGtlcm5lbC5vcmc7IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tOyBC
cm9zdCwgTWF0dGhldw0KPj4gPiA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyB0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbTsNCj4+ID4gYWlybGllZEBnbWFpbC5jb207IHNpbW9uYUBm
ZndsbC5jaDsgZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tOw0KPj4gPiBWaWpheSwNCj4+ID4g
QW5vb3AgQyA8YW5vb3AuYy52aWpheUBpbnRlbC5jb20+OyBOaWxhd2FyLCBCYWRhbA0KPj4gPiA8
YmFkYWwubmlsYXdhckBpbnRlbC5jb20+OyBSb3BlciwgTWF0dGhldyBEDQo+PiA+IDxtYXR0aGV3
LmQucm9wZXJAaW50ZWwuY29tPjsNCj4+ID4gQXVzbXVzLCBKYW1lcyA8amFtZXMuYXVzbXVzQGlu
dGVsLmNvbT4NCj4+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTkgMTQvMTldIGRybS94ZS92c2Vj
OiBDcmVzY2VudCBJc2xhbmQgUE1UDQo+PiA+IGNhbGxiYWNrcw0KPj4gPg0KPj4gPiBPbiBUaHUs
IE5vdiAxOSwgMjAyNiBhdCAwNzo1NDo1MkFNIC0wODAwLCBNaWNoYWVsIEouIFJ1aGwgd3JvdGU6
DQo+PiA+ID4gQ1JJIFBNVCBzdXBwb3J0IHJlcXVpcmVzIGNhbGxiYWNrcyB0byBhY2Nlc3MgdGhl
IGRpc2NvdmVyeSBkYXRhDQo+PiA+ID4gYW5kDQo+PiA+ID4gY29udHJvbCBhcmVhcy4gQWNjZXNz
IGlzIGEgY29tbW9uIE1NSU8gYXJlYSB0aGF0IHJlcXVpcmVzIGFuDQo+PiA+ID4gaW5kZXggdG8N
Cj4+ID4gPiBiZSBzZXQgYmVmb3JlIGFjY2VzcyBpcyBhbGxvd2VkLg0KPj4gPiA+DQo+PiA+ID4g
SW50cm9kdWNlIHRoZSBuZWNlc3NhcnkgY2FsbGJhY2tzIHRvIGdldCB0aGUgZGlzY292ZXJ5LCBz
dGF0dXMNCj4+ID4gPiBhbmQNCj4+ID4gPiBjb250cm9sIGluZm9ybWF0aW9uIGZvciBDUkkgUE1U
IHVzYWdlLg0KPj4gPiA+DQo+PiA+ID4gQWRkIHRoZSBnbHVlIGxvZ2ljIHRvIHJlZ2lzdGVyIHRo
ZSBDUkkgUE1UIGZ1bmN0aW9uYWxpdHkuDQo+PiA+ID4NCj4+ID4gPiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4+ID4gPiAtLS0NCj4+
ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMgfCAxNzgNCj4+ID4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNzQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+ID4gPg0KPj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdnNlYy5jDQo+PiA+ID4gaW5kZXggYTgxNGQ3MTUxZWVhLi41OGViODVmYjZhOWYgMTAw
NjQ0DQo+PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+ID4gPiBAQCAtNCw2ICs0LDcgQEAN
Cj4+ID4gPiDCoCNpbmNsdWRlIDxsaW51eC9iaXRzLmg+DQo+PiA+ID4gwqAjaW5jbHVkZSA8bGlu
dXgvY2xlYW51cC5oPg0KPj4gPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+DQo+PiA+ID4g
KyNpbmNsdWRlIDxsaW51eC9sb2cyLmg+DQo+PiA+ID4gwqAjaW5jbHVkZSA8bGludXgvaW50ZWxf
dnNlYy5oPg0KPj4gPiA+IMKgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPj4gPiA+IMKgI2lu
Y2x1ZGUgPGxpbnV4L211dGV4Lmg+DQo+PiA+ID4gQEAgLTM0NCwxMCArMzQ1LDE1IEBAIGludCB4
ZV9wbXRfdGVsZW1fcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiA+ID4gdTMyDQo+PiA+IGd1
aWQsIHU2NCAqZGF0YSwgbG9mZl90IHVzZXJfb2Zmc2UNCj4+ID4gPiDCoAl9DQo+PiA+ID4NCj4+
ID4gPiDCoAlzY29wZWRfZ3VhcmQobXV0ZXgsICZ4ZS0+cG10LmxvY2spIHsNCj4+ID4gPiArCQl1
MzIgZGV2aWNlX2lkID0gRklFTERfR0VUKEdVSURfREVWSUNFX0lELCBndWlkKTsNCj4+ID4gPiAr
DQo+PiA+ID4gwqAJCS8qIHNldCBTb0MgcmUtbWFwcGVyIGluZGV4IHJlZ2lzdGVyIGJhc2VkIG9u
DQo+PiA+ID4gR1VJRCBtZW1vcnkNCj4+ID4gcmVnaW9uICovDQo+PiA+ID4gwqAJCXhlLT5zb2Nf
cmVtYXBwZXIuc2V0X3RlbGVtX3JlZ2lvbih4ZSwNCj4+ID4gPiBtZW1fcmVnaW9uKTsNCj4+ID4g
Pg0KPj4gPiA+IMKgCQltZW1jcHlfZnJvbWlvKGRhdGEsIHRlbGVtX2FkZHIsIGNvdW50KTsNCj4+
ID4gPiArDQo+PiA+ID4gKwkJaWYgKGRldmljZV9pZCA9PSBDUklfREVWSUNFX0lEKQ0KPj4gPiA+
ICsJCQl4ZS0+c29jX3JlbWFwcGVyLnNldF90ZWxlbV9yZWdpb24oeGUsDQo+PiA+IENSSV9JRFhf
VEVMRU1fRElTQ09WRVJZKTsNCj4+ID4gPiDCoAl9DQo+PiA+ID4NCj4+ID4gPiDCoAl4ZV9wbV9y
dW50aW1lX3B1dCh4ZSk7DQo+PiA+ID4gQEAgLTM1OCwyMCArMzY0LDE3OCBAQCBpbnQgeGVfcG10
X3RlbGVtX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LA0KPj4gPiA+IHUzMg0KPj4gPiBndWlkLCB1
NjQgKmRhdGEsIGxvZmZfdCB1c2VyX29mZnNlDQo+PiA+ID4gwqAJcmV0dXJuIHJldCA9PSAwID8g
Y291bnQgOiByZXQ7DQo+PiA+ID4gwqB9DQo+PiA+ID4NCj4+ID4gPiAtc3RhdGljIHN0cnVjdCBw
bXRfY2FsbGJhY2tzIHhlX3BtdF9jYiA9IHsNCj4+ID4gPiArLyoqDQo+PiA+ID4gKyAqIHhlX3Bt
dF9kaXNjb3ZlcnlfcmVhZCAtIEdpdmVuIGEgZGV2aWNlIGFuZCBhbiBpbmRleCwgcmVhZA0KPj4g
PiA+IGRpc2NvdmVyeSBkYXRhDQo+PiA+IGludG8gYSBidWZmZXINCj4+ID4gPiArICogQGRldjog
dmFsaWQgWGUgZGV2aWNlDQo+PiA+ID4gKyAqIEBjYXBfaWQ6IFBNVCB0eXBlDQo+PiA+ID4gKyAq
IEBlbGVtZW50OiBlbGVtZW50IHRvIGFjY2Vzcw0KPj4gPiA+ICsgKiBAZGlzY19kYXRhOiBidWZm
ZXIgZm9yIGRpc2NvdmVyeSBkYXRhDQo+PiA+ID4gKyAqIEBjb3VudDogYnl0ZXMgdG8gcmVhZA0K
Pj4gPg0KPj4gPiBjb3VudCBkb2Vzbid0IGV4aXN0IGJlbG93Li4uDQo+Pg0KPj4gWWVhaCwgYWxy
ZWFkeSBjbGVhbmVkIHVwLiDwn5iKDQo+Pg0KPj4gPiA+ICsgKg0KPj4gPiA+ICsgKiBUaGlzIGlz
IGEgY2FsbGJhY2sgQVBJLsKgIEkuZSB0aGlzIGNhbiBiZSBhY2Nlc3NlZCBleHRlcm5hbCB0bw0K
Pj4gPiA+IHRoZSBYRSBkcml2ZXINCj4+ID4gPiArICogKFBNVCBkcml2ZXIgc2NvcGUpLsKgIEJl
Y2F1c2Ugb2YgdGhpcywgRFJNIGhvdHBsdWcgbmVlZHMgdG8gYmUNCj4+ID4gPiB2ZXJpZmllZA0K
Pj4gPiA+ICsgKiAoZHJtX2Rldl9lbnRlcigpKS4NCj4+ID4gPiArICoNCj4+ID4gPiArICogUmV0
dXJuOg0KPj4gPiA+ICsgKiAqIC1FTk9ERVYgZGV2aWNlIGlzIG5vdCBhdmFpbGFibGUgKGhvdHBs
dWcpDQo+PiA+ID4gKyAqICogLUVJTlZBTCBmb3IgdW5zdXBwb3J0ZWQgZGV2aWNlIG9yIFBNVCBm
ZWF0dXJlDQo+PiA+ID4gKyAqICogMCBvbiBzdWNjZXNzDQo+PiA+ID4gKyAqLw0KPj4gPiA+ICtz
dGF0aWMgaW50IHhlX3BtdF9kaXNjb3ZlcnlfcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2ln
bmVkDQo+PiA+ID4gbG9uZyBjYXBfaWQsDQo+PiA+IHUzMiBlbGVtZW50LA0KPj4gPiA+ICsJCQkJ
IHUzMiAqZGlzY19kYXRhKQ0KPj4gPiA+ICt7DQo+PiA+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSA9IGtkZXZfdG9feGVfZGV2aWNlKGRldik7DQo+PiA+ID4gKwl2b2lkIF9faW9tZW0gKmRpc2Nf
YWRkciA9IHhlLT5tbWlvLnJlZ3M7DQo+PiA+ID4gKwlzdHJ1Y3QgaW50ZWxfdnNlY19oZWFkZXIg
KmhlYWRlcnM7DQo+PiA+ID4gKwlpbnQgcmV0ID0gMDsNCj4+ID4gPiArCXUzMiBvZmZzZXQ7DQo+
PiA+ID4gKwlpbnQgaWR4Ow0KPj4gPiA+ICsNCj4+ID4gPiArCWlmICghZHJtX2Rldl9lbnRlcigm
eGUtPmRybSwgJmlkeCkpDQo+PiA+ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+PiA+ID4gKw0KPj4g
PiA+ICsJaWYgKHhlLT5pbmZvLnBsYXRmb3JtICE9IFhFX0NSRVNDRU5USVNMQU5EKSB7DQo+PiA+
ID4gKwkJcmV0ID0gLUVJTlZBTDsNCj4+ID4gPiArCQlnb3RvIGRldl9leGl0Ow0KPj4gPiA+ICsJ
fQ0KPj4gPiA+ICsNCj4+ID4gPiArCXN3aXRjaCAoY2FwX2lkKSB7DQo+PiA+ID4gKwljYXNlIGls
b2cyKFZTRUNfQ0FQX1RFTEVNRVRSWSk6DQo+PiA+ID4gKwkJaGVhZGVycyA9ICZjcmlfdGVsZW1l
dHJ5Ow0KPj4gPiA+ICsJCWJyZWFrOw0KPj4gPiA+ICsNCj4+ID4gPiArCWNhc2UgaWxvZzIoVlNF
Q19DQVBfQ1JBU0hMT0cpOg0KPj4gPiA+ICsJCWhlYWRlcnMgPSAmY3JpX2NyYXNobG9nOw0KPj4g
PiA+ICsJCWJyZWFrOw0KPj4gPiA+ICsNCj4+ID4gPiArCWRlZmF1bHQ6DQo+PiA+ID4gKwkJcmV0
ID0gLUVJTlZBTDsNCj4+ID4gPiArCQlnb3RvIGRldl9leGl0Ow0KPj4gPiA+ICsJfQ0KPj4gPiA+
ICsNCj4+ID4gPiArCW9mZnNldCA9IGVsZW1lbnQgKiAoaGVhZGVycy0+ZW50cnlfc2l6ZSAqIHNp
emVvZih1MzIpKTsNCj4+ID4gPiArCWRpc2NfYWRkciArPSBoZWFkZXJzLT5vZmZzZXQgKyBvZmZz
ZXQ7DQo+PiA+ID4gKw0KPj4gPiA+ICsJc2NvcGVkX2d1YXJkKG11dGV4LCAmeGUtPnBtdC5sb2Nr
KSB7DQo+PiA+ID4gKwkJeGUtPnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLA0KPj4g
PiBDUklfSURYX1RFTEVNX0RJU0NPVkVSWSk7DQo+PiA+ID4gKwkJbWVtY3B5X2Zyb21pbyhkaXNj
X2RhdGEsIGRpc2NfYWRkciwNCj4+ID4gPiBQTVRfRElTQ19EV09SRFMgKg0KPj4gPiBzaXplb2Yo
dTMyKSk7DQo+PiA+ID4gKwl9DQo+PiA+DQo+PiA+IHdlIHByb2JhYmx5IG5lZWQgcnBtIGdldC9w
dXQgaGVyZSwgbm8/IQ0KPj4NCj4+IEluIHRoZSBub24gbGF0ZS1iaW5kaW5nIHByb2JlIHBhdGgs
IHJ1bnRpbWUgaXMgYWxyZWFkeSBpbiBwbGFjZS4NCj4+IEZvciB0aGUgbGF0ZS1iaW5kaW5nIHBh
dGgsIHRoZSBydW50aW1lX2dldCBoYXBwZW5zIHdoZW4gdGhlIHdvcmsgaXRlbQ0KPj4gaXMgcXVl
dWVkIGFuZCByZWxlYXNlZA0KPj4gd2hlbiB0aGUgcmVnaXN0cmF0aW9uIGlzIGNvbXBsZXRlLg0K
Pg0KPm5vIHBvc3NpYmxlIGNvcm5lciBjYXNlIGxpa2UgbGF0ZSBwcm9iZSBvZiBpbnRlbF9wbXQg
aXRzZWxmPw0KPg0KPmluIGdlbmVyYWwgd2Ugc2hvdWxkIGFsd2F5cyBkbyBycG0gZ2V0L3B1dCBh
cm91bmQgbW1pby9tZW0gYWNjZXNzIHRvIGJlDQo+b24gdGhlIHNhZmUgc2lkZS4NCg0KVGhpcyBz
ZXF1ZW5jZSBoYXMgdGhyZWUgZW50cnkgcG9pbnRzOg0KDQpkZXZpY2UgcHJvYmUNCmRldmljZSBw
cm9iZSBzdXJ2aXZhYmlsaXR5DQoNCmxhdGUtYmluZGluZw0KDQpJZiB0aGUgZGV2aWNlIGlzIG5v
dCBvbiwgdGhlIHByb2JlIHBhdGggd2lsbCBoYXZlIG90aGVyIGlzc3Vlcy4uLi4NCg0KbGF0ZS1i
aW5kaW5nIHRoZSByZWZlcmVuY2UgaGFzIGJlZW4gdGFrZW4uDQoNClNvIHRoZSBhc3N1bXB0aW9u
IGlzIHRoYXQgd2UgaGF2ZSBwb3dlci4uLiBpZiB3ZSBnZXQgdG8gdGhpcyBwb2ludCBhbmQgZG9u
J3QgaGF2ZQ0KcG93ZXIsIEkgdGhpbmsgdGhhdCB0aGF0IGlzIGFuIGVycm9yIHN0YXRlLg0KDQpI
b3cgYWJvdXQ6DQoNCmNoZWNrIGZvciBwb3dlcg0KZXhpdCB3aXRoIGVycm9yIGlmIHBvd2VyIGlz
IG5vdCBvbg0KDQo/DQoNCm0NCg0KPj4NCj4+IE0NCj4+DQo+PiA+ID4gKw0KPj4gPiA+ICtkZXZf
ZXhpdDoNCj4+ID4gPiArCWRybV9kZXZfZXhpdChpZHgpOw0KPj4gPiA+ICsNCj4+ID4gPiArCXJl
dHVybiByZXQ7DQo+PiA+ID4gK30NCj4+ID4gPiArDQo+PiA+ID4gKy8qKg0KPj4gPiA+ICsgKiB4
ZV9wbXRfcmVhZF9yZWcoKSAtIHJlYWQgYSBjcmFzaGxvZyByZWdpc3Rlcg0KPj4gPiA+ICsgKiBA
ZGV2OiB0aGUgeGUgZGV2aWNlIHRoYXQgcmVnaXN0ZXJlZCB0aGUgY2FsbGJhY2sNCj4+ID4gPiAr
ICogQGd1aWQ6IFBNVCBndWlkIG9mIHRoZSBjcmFzaGxvZyBpbnN0YW5jZQ0KPj4gPiA+ICsgKiBA
cmVnOiBkYXRhIHJlYWQgZnJvbSB0aGUgUE1UIGRhdGEgc3RydWN0dXJlDQo+PiA+ID4gKyAqIEBv
ZmZzZXQ6IHdoaWNoIGRhdGEgdG8gcmVhZCBmcm9tIHRoZSBQTVQgZGF0YSBzdHJ1Y3R1cmUNCj4+
ID4gPiArICoNCj4+ID4gPiArICogUmVhZCB0aGUgcmVxdWVzdGVkIFBNVCByZWdpc3RlciBiYXNl
ZCBvbiB0aGUgcGNpZSBkZXZpY2UgYW5kDQo+PiA+ID4gZ3VpZC7CoCBUaGUNCj4+ID4gPiArICog
c3VwcG9ydGVkIHN0cnVjdCBpcyB0aGUgQ3Jhc2hsb2cgVHlwZTEgVmVyc2lvbjIuDQo+PiA+ID4g
KyAqDQo+PiA+ID4gKyAqIEN1cnJlbnRseSB0aGlzIGlzIGZvciBDUkkgb25seS4NCj4+ID4gPiAr
ICoNCj4+ID4gPiArICogUmV0dXJuOg0KPj4gPiA+ICsgKiAqIC1FTk9ERVYgZGV2aWNlIGlzIG5v
dCBhdmFpbGFibGUgKGhvdHBsdWcpDQo+PiA+ID4gKyAqICogLUVJTlZBTCBpbnZhbGlkIGd1aWQN
Cj4+ID4gPiArICogKiAwwqDCoMKgwqDCoMKgIHN1Y2Nlc3MNCj4+ID4gPiArICovDQo+PiA+ID4g
K3N0YXRpYyBpbnQgeGVfcG10X3JlYWRfcmVnKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGd1aWQs
IHUzMg0KPj4gPiA+ICpyZWcsIHUzMg0KPj4gPiBvZmZzZXQpDQo+PiA+ID4gK3sNCj4+ID4gPiAr
CXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0ga2Rldl90b194ZV9kZXZpY2UoZGV2KTsNCj4+ID4gPiAr
CXZvaWQgX19pb21lbSAqZGlzY19hZGRyID0geGUtPm1taW8ucmVncyArIHhlLQ0KPj4gPiA+ID5w
bXQuYmFzZV9vZmZzZXQ7DQo+PiA+ID4gKwlpbnQgcmV0ID0gMDsNCj4+ID4gPiArCXUzMiBpbnN0
Ow0KPj4gPiA+ICsJaW50IGlkeDsNCj4+ID4gPiArDQo+PiA+ID4gKwlpZiAoRklFTERfR0VUKEdV
SURfREVWSUNFX0lELCBndWlkKSAhPSBDUklfREVWSUNFX0lEIHx8DQo+PiA+ID4gKwnCoMKgwqAg
RklFTERfR0VUKEdVSURfQ0FQX1RZUEUsIGd1aWQpICE9IENSQVNITE9HKQ0KPj4gPiA+ICsJCXJl
dHVybiAtRUlOVkFMOw0KPj4gPiA+ICsNCj4+ID4gPiArCWlmICghZHJtX2Rldl9lbnRlcigmeGUt
PmRybSwgJmlkeCkpDQo+PiA+ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+PiA+ID4gKw0KPj4gPiA+
ICsJaW5zdCA9IEZJRUxEX0dFVChHVUlEX1JFQ09SRF9JRCwgZ3VpZCkgPT0gUFVOSVQgPw0KPj4g
PiA+ICsJCUNSSV9DUkFTSExPR19QVU5JVF9ESVNDX09GRlNFVCA6DQo+PiA+IENSSV9DUkFTSExP
R19PT0JNU01fRElTQ19PRkZTRVQ7DQo+PiA+ID4gKwlkaXNjX2FkZHIgKz0gaW5zdCArIG9mZnNl
dDsNCj4+ID4gPiArDQo+PiA+ID4gKwl4ZV9wbV9ydW50aW1lX2dldCh4ZSk7DQo+PiA+ID4gKw0K
Pj4gPiA+ICsJc2NvcGVkX2d1YXJkKG11dGV4LCAmeGUtPnBtdC5sb2NrKSB7DQo+PiA+ID4gKwkJ
eGUtPnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLA0KPj4gPiBDUklfSURYX1RFTEVN
X0RJU0NPVkVSWSk7DQo+PiA+ID4gKw0KPj4gPiA+ICsJCSpyZWcgPSByZWFkbChkaXNjX2FkZHIp
Ow0KPj4gPiA+ICsJfQ0KPj4gPiA+ICsNCj4+ID4gPiArCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsN
Cj4+ID4gPiArDQo+PiA+ID4gKwlkcm1fZGV2X2V4aXQoaWR4KTsNCj4+ID4gPiArDQo+PiA+ID4g
KwlyZXR1cm4gcmV0Ow0KPj4gPiA+ICt9DQo+PiA+ID4gKw0KPj4gPiA+ICtzdGF0aWMgaW50IHhl
X3BtdF93cml0ZV9yZWcoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgZ3VpZCwgdTMyDQo+PiA+ID4g
cmVnLCB1MzINCj4+ID4gb2Zmc2V0KQ0KPj4gPiA+ICt7DQo+PiA+ID4gKwlzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSA9IGtkZXZfdG9feGVfZGV2aWNlKGRldik7DQo+PiA+ID4gKwl2b2lkIF9faW9tZW0g
KmRpc2NfYWRkciA9IHhlLT5tbWlvLnJlZ3MgKyB4ZS0NCj4+ID4gPiA+cG10LmJhc2Vfb2Zmc2V0
Ow0KPj4gPiA+ICsJaW50IHJldCA9IDA7DQo+PiA+ID4gKwl1MzIgaW5zdDsNCj4+ID4gPiArCWlu
dCBpZHg7DQo+PiA+ID4gKw0KPj4gPiA+ICsJaWYgKEZJRUxEX0dFVChHVUlEX0RFVklDRV9JRCwg
Z3VpZCkgIT0gQ1JJX0RFVklDRV9JRCB8fA0KPj4gPiA+ICsJwqDCoMKgIEZJRUxEX0dFVChHVUlE
X0NBUF9UWVBFLCBndWlkKSAhPSBDUkFTSExPRykNCj4+ID4gPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4+ID4gPiArDQo+PiA+ID4gKwlpZiAoIWRybV9kZXZfZW50ZXIoJnhlLT5kcm0sICZpZHgpKQ0K
Pj4gPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPj4gPiA+ICsNCj4+ID4gPiArCWluc3QgPSBGSUVM
RF9HRVQoR1VJRF9SRUNPUkRfSUQsIGd1aWQpID09IFBVTklUID8NCj4+ID4gPiArCQlDUklfQ1JB
U0hMT0dfUFVOSVRfRElTQ19PRkZTRVQgOg0KPj4gPiBDUklfQ1JBU0hMT0dfT09CTVNNX0RJU0Nf
T0ZGU0VUOw0KPj4gPiA+ICsJZGlzY19hZGRyICs9IGluc3QgKyBvZmZzZXQ7DQo+PiA+ID4gKw0K
Pj4gPiA+ICsJeGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPj4gPiA+ICsNCj4+ID4gPiArCXNjb3Bl
ZF9ndWFyZChtdXRleCwgJnhlLT5wbXQubG9jaykgew0KPj4gPiA+ICsJCXhlLT5zb2NfcmVtYXBw
ZXIuc2V0X3RlbGVtX3JlZ2lvbih4ZSwNCj4+ID4gQ1JJX0lEWF9URUxFTV9ESVNDT1ZFUlkpOw0K
Pj4gPiA+ICsNCj4+ID4gPiArCQl3cml0ZWwocmVnLCBkaXNjX2FkZHIpOw0KPj4gPiA+ICsJfQ0K
Pj4gPiA+ICsNCj4+ID4gPiArCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4+ID4gPiArDQo+PiA+
ID4gKwlkcm1fZGV2X2V4aXQoaWR4KTsNCj4+ID4gPiArDQo+PiA+ID4gKwlyZXR1cm4gcmV0Ow0K
Pj4gPiA+ICt9DQo+PiA+ID4gKw0KPj4gPiA+ICtzdGF0aWMgc3RydWN0IHBtdF9jYWxsYmFja3Mg
eGVfYm1nX3BtdF9jYiA9IHsNCj4+ID4gPiDCoAkucmVhZF90ZWxlbSA9IHhlX3BtdF90ZWxlbV9y
ZWFkLA0KPj4gPiA+IMKgfTsNCj4+ID4gPg0KPj4gPiA+ICtzdGF0aWMgc3RydWN0IHBtdF9jYWxs
YmFja3MgeGVfY3JpX3BtdF9jYiA9IHsNCj4+ID4gPiArCS5yZWFkX3RlbGVtID0geGVfcG10X3Rl
bGVtX3JlYWQsDQo+PiA+ID4gKwkucmVhZF9kaXNjb3ZlcnkgPSB4ZV9wbXRfZGlzY292ZXJ5X3Jl
YWQsDQo+PiA+ID4gKwkucmVhZF9yZWcgPSB4ZV9wbXRfcmVhZF9yZWcsDQo+PiA+ID4gKwkud3Jp
dGVfcmVnID0geGVfcG10X3dyaXRlX3JlZywNCj4+ID4gPiArfTsNCj4+ID4gPiArDQo+PiA+ID4g
wqBzdGF0aWMgY29uc3QgaW50IHZzZWNfcGxhdGZvcm1zW10gPSB7DQo+PiA+ID4gwqAJW1hFX0JB
VFRMRU1BR0VdID0gWEVfVlNFQ19CTUcsDQo+PiA+ID4gKwlbWEVfQ1JFU0NFTlRJU0xBTkRdID0g
WEVfVlNFQ19DUkksDQo+PiA+ID4gwqB9Ow0KPj4gPiA+DQo+PiA+ID4gwqBzdGF0aWMgZW51bSB4
ZV92c2VjIGdldF9wbGF0Zm9ybV9pbmZvKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4gPiA+IMKg
ew0KPj4gPiA+IC0JaWYgKHhlLT5pbmZvLnBsYXRmb3JtID4gWEVfQkFUVExFTUFHRSkNCj4+ID4g
PiArCWlmICh4ZS0+aW5mby5wbGF0Zm9ybSA+IFhFX0NSRVNDRU5USVNMQU5EKQ0KPj4gPiA+IMKg
CQlyZXR1cm4gWEVfVlNFQ19VTktOT1dOOw0KPj4gPiA+DQo+PiA+ID4gLQlpZiAoSVNfU1JJT1Zf
VkYoeGUpICYmIHhlLT5pbmZvLnBsYXRmb3JtID09DQo+PiA+ID4gWEVfQkFUVExFTUFHRSkNCj4+
ID4gPiArCWlmIChJU19TUklPVl9WRih4ZSkgJiYNCj4+ID4gPiArCcKgwqDCoCAoeGUtPmluZm8u
cGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSB8fA0KPj4gPiA+ICsJwqDCoMKgwqAgeGUtPmluZm8u
cGxhdGZvcm0gPT0gWEVfQ1JFU0NFTlRJU0xBTkQpKQ0KPj4gPiA+IMKgCQlyZXR1cm4gWEVfVlNF
Q19VTktOT1dOOw0KPj4gPiA+DQo+PiA+ID4gwqAJcmV0dXJuIHZzZWNfcGxhdGZvcm1zW3hlLT5p
bmZvLnBsYXRmb3JtXTsNCj4+ID4gPiBAQCAtMzk5LDggKzU2MywxNCBAQCB2b2lkIHhlX3ZzZWNf
aW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4+ID4gPiDCoAlzd2l0Y2ggKHBsYXRmb3JtKSB7
DQo+PiA+ID4gwqAJY2FzZSBYRV9WU0VDX0JNRzoNCj4+ID4gPiDCoAkJeGUtPnBtdC5iYXNlX29m
ZnNldCA9IEJNR19URUxFTUVUUllfT0ZGU0VUOw0KPj4gPiA+IC0JCWluZm8tPnByaXZfZGF0YSA9
ICZ4ZV9wbXRfY2I7DQo+PiA+ID4gKwkJaW5mby0+cHJpdl9kYXRhID0gJnhlX2JtZ19wbXRfY2I7
DQo+PiA+ID4gwqAJCWJyZWFrOw0KPj4gPiA+ICsNCj4+ID4gPiArCWNhc2UgWEVfVlNFQ19DUkk6
DQo+PiA+ID4gKwkJeGUtPnBtdC5iYXNlX29mZnNldCA9IENSSV9QTVRfT0ZGU0VUOw0KPj4gPiA+
ICsJCWluZm8tPnByaXZfZGF0YSA9ICZ4ZV9jcmlfcG10X2NiOw0KPj4gPiA+ICsJCWJyZWFrOw0K
Pj4gPiA+ICsNCj4+ID4gPiDCoAlkZWZhdWx0Og0KPj4gPiA+IMKgCQlicmVhazsNCj4+ID4gPiDC
oAl9DQo+PiA+ID4gLS0NCj4+ID4gPiAyLjQzLjANCj4+ID4gPg0K
