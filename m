Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794687308;
	b=C/bVLBEWKd9ZI9unr6MDAlNtjjIs3F9ks+oC+152/6r9W52wdJ/rd9MYjZVoBK6faju/
	 HgKeMj48NXmNvPpA+NMrDzdaI+WO9qAfSd74kh4Q7U7i0mLTfSuo/pH9ksemPMos4BT33
	 +Bvbh3eMxwfxFTdJXU/d9Ve+NImLI+iVMOKsWyluSH57zlWfmQ7oHOOSwHvgiM9SPvajM
	 2ms0Rl4Q92Ve+6uGUwp62J/+EK6SnRtsNgub/4XsxnamYKsKORSIFpMvWh9WomQcnwiZi
	 G1+DWdSxCDgYepY6PFIw+LqUbmPVJlW68Q6BixtA/cKxtFdiIp++OMK9B6G9LuKWLHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687308;
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
	bh=iyOXyS0lrVXP9lcuM25GXMzzAZnYVz/QibdIvFD1in8=;
	b=BD4NYLYuxUWPaFRKQzoVUC800pyKf4OuVnLPJV76pP2SyPgAVI7UV6CtYGqwN68u8yWi
	 9rJUVPE9DtjCA5vgwm8hXEX1ypF0LJT7cNaBmgKkT6zm+aGbtSxnHp0eqDma9E5DU+WeH
	 NLBSdLzDeFxsv9I21slbAyyl+ZoB+/66QKAJVEY5V/aMxnDUndkCqDVf6SkIj7o3D3Qoe
	 9au33Qv0LaEOlLi9Om/3FmBTU0ei0Mne29MHL55Ty5lqQ9LGpQ1zSMsAGJjenRNf3GaPr
	 fv5ZRgqgVBFWv15rWbTxfkp75/N9Ght6l1zsXPfz/o6Z01e0h41P9FRhXjYntl4NMUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dov8LWGt;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TCeCuYCN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0144606A333;
	Sat, 14 Nov 2026 20:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0144606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dov8LWGt;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TCeCuYCN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794687307; x=1826223307;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iyOXyS0lrVXP9lcuM25GXMzzAZnYVz/QibdIvFD1in8=;
  b=dov8LWGtEBJ8Tl7O1OAxJhOODz37tjowaBi+0gCj9iaeiczhb7IGH60K
   MHD4XtTTQSq2+qT41yZLI3IWtXXdp6Hy1P4+k/FU1IzsfpERMcfGEnBMu
   eAF4NiNxRrObL8rjJvlh1EpMsG4byyEZ0zmXQn8XGIOhsAEH8hbq0JKEs
   qT4NdFe90f4WkH3FTiGAmksnS4j8eJawyS4/qoPebXiiX8hxX0lhMC9tf
   4geiRvMVTDELij/Ito62UpomvgiWGlkxYwbLmjFxC8OKk5P0b+bBE38ZO
   oGX9J2OGkVFdVk3CmEgQprRYwnTxFt5NWfHCxRyWnlOWlo2X0olXiqp3f
   g==;
X-CSE-ConnectionGUID: TELvqyMuRkuvtlIjVgM40Q==
X-CSE-MsgGUID: qbu3v0h4T4WwUs5S0+T4ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3365860"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3365860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 12:15:07 -0800
X-CSE-ConnectionGUID: aCyD99djQ0Wq/iaLZygcZA==
X-CSE-MsgGUID: VFJTfsPYQmO9mOrZ2n0GyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9521363"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 12:15:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 14 Nov 2026 12:15:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 14 Nov 2026 12:15:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 14 Nov 2026 12:15:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqfgACLf/CmlEIXBy5xcD4a6LeDW93QGyzBMv9UDrx8kYVCMHMSEYxk63yEmLnPx3TVM5eraXhesQ/JiP8DdCiO4/tbEHAEGiGKni/4xnt4jAN0vh7WY+OAy+VV0UklEDhvVvP0QgHahzJyuiz+Bf+PoT5PGcmT38+ETY4r6/tX7pmqhvrBBWCnuZ2mTWYnD9KbyptOOnsV5fQNkHIWlKXD/awSa/xhkvJufYYF69l+QhrkqBfyQGmk1URPwsGwM3JE+EW2s3LNPkwBU18YwxA7SwGc7sdErO/o/szMrXFeeeopN4rvlFoNrf9yTyoL7KDKH8CxRW8zeZvD20VYZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyOXyS0lrVXP9lcuM25GXMzzAZnYVz/QibdIvFD1in8=;
 b=f+qrTfTp3K2kJZO6yCusv8R/0vaGwFazp0kp7A4WV1j06l4J8kuM8yTT9FXV+ErtQ6JXDHCrEZ453onjp5TCZE+iQEKI98DuRcrIhm1naoon8KJHLbHdpA7ZWGw+YuVp+ZbnBKrd9mwa0KvAHCyjsqsQgNFbuzskjiqt6jvCbsT8vEdiGIa/WRGPdUDTFKSVJNYTVrcmlj0bn/FcTXeKNRtyB5LpPHeI9g8a5FkpV5W78WanqHExudrAIGpFaPQ105JOYzcL45zchHq3KZJj4/HdlPIIF39qXVrjKBqjrn3CJhCV0VdVY28yyhB+qyRZN//espIHTW3AtgLQS4K83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyOXyS0lrVXP9lcuM25GXMzzAZnYVz/QibdIvFD1in8=;
 b=TCeCuYCN0G7Bzl2S7A4PUzAl2prdkFj3oqO69EJ1fK0NHaYtlxF4pQI/3XYyJsLf+wfdpy0DoMFHKbGVDefCTUxoZJjjc8S/FS53K8OeXt95xPDL1w/wTmvKIMMNsba7Ggl5mx7cH7r2ggZr586GZcTBLDENmWBd4mHDL1LZxjA=
Received: from DS6PR11MB455487.namprd11.prod.outlook.com (2603:10b6:8:52c::18)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Sat, 14 Nov
 2026 20:13:56 +0000
Received: from DS6PR11MB455487.namprd11.prod.outlook.com
 ([fe80::26b2:d932:d78d:d43a]) by DS6PR11MB455487.namprd11.prod.outlook.com
 ([fe80::26b2:d932:d78d:d43a%4]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 20:13:56 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: David Box <david.e.box@linux.intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>, "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>,
	"Muqthyar Ahmed, Syed Abdul" <syed.abdul.muqthyar.ahmed@intel.com>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hansg@kernel.org" <hansg@kernel.org>
CC: "Fleck, John" <john.fleck@intel.com>, "Putcha, Padmaja"
	<padmaja.putcha@intel.com>, "Adatrao, Srinivasa"
	<srinivasa.adatrao@intel.com>
Subject: RE: [PATCH v3 1/1] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
Thread-Topic: [PATCH v3 1/1] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
Thread-Index: AQHdckq1h5YFi0sg302B6xKfGccRWbcshSaAgAFwTNA=
Date: Sat, 14 Nov 2026 20:13:56 +0000
Message-ID: <DS6PR11MB45548775F97B60BD0E11E382E0C17E2@DS6PR11MB455487.namprd11.prod.outlook.com>
References: <cover.1794444671.git.david.e.box@linux.intel.com>
 <c265bd093c23d96417cb5c6504938c90adc36ac9.1794444671.git.david.e.box@linux.intel.com>
 <179460474975.2604806.7772916319418845665@linux.intel.com>
In-Reply-To: <179460474975.2604806.7772916319418845665@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB455487:EE_|DS7PR11MB6127:EE_
x-ms-office365-filtering-correlation-id: 293e7d4f-e194-46f9-9147-08df428bcfca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|921020|261022075727099003|261102123227099003|4143699003|11063799006|56012099006|261028144727099003|261009223027099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|22082099003|18002099003|10067099003;
x-microsoft-antispam-message-info: /EdJbyn2sVhQlq+w3N5ZUHUZ4ovuXhAb2dWuLRULPFnz06hjQ1rS+ZBbL4gnwL9BnRsZRkCTHMPu8zydDXNO1Fks/O0c+UU9wNmVTaFgQzGqOB7DT9F6TtPtNSB9ChIpYt3eBQYdbTZ2X7VgvP4f5lBpwmXvRlnlJPYGwhHUqiwlx9gC+RpsDrLofqhntK1nSeooh+bJrfZ7/ZV5jcsSwjp4Qu/2gpbUoNlFKCmMNHQ3Izqs4m8psi3HbQlq7U2MCPFMUnf3gV2PF7PSNPK6a+rbtWuWnbUCeX2zxwCWAUBBr2wLokUsiggvJ6+/4Tug91jPqz5j2j4Ly6Ya7IphjPg12fsLbHMjY7eOMnGu2llUwONGe96ZCIqr3xBniSFxVzptcC4iEHsw/VSWbZHh43lE7TF2BKnLYYr0gcCWEp2rSugkiyKDVajQf0VS42x50WfpWHpgq+7x/8FJgWc/Hkj6RTLS8smV/gpRDGPv2evf2sVbP5zPS57lHmGB+MTsm7PaD6DgRrgTsa0nviZsnVLYKLxvfpnf/mXeQEjXEetvnDSACPNdqUc+j6KAqxgw2TLlvqGUFUXkkGXfSCuYVq1YHAN17JpNxFbGhtX51cWSj4K69r7LBq8J7cLQC7ZD1i+h+hjepWSqUhENGf7Zq3l/Zh2x2yMyRqju7ZrQRA3g+My1DIeMjOiJbxjYPL1M
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB455487.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(921020)(261022075727099003)(261102123227099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261009223027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0Y4eGZkTVVXa3VxK3dFRW1TbXRPWVQvdnVIcUVTbE5DQjlqb0VnT25ESW15?=
 =?utf-8?B?aUZLV3p4SjNPMFBIL3dTQWhhQWpISm9rOXZOUFVETzQwdmhrd3dKQlZ0bkV0?=
 =?utf-8?B?S1hMU1N1bWdwL3dpQVN5bEVnYXVzMlFzRHMwamk1aUx4aW5ZR1hQSldMUWNl?=
 =?utf-8?B?QThybEE1Tk9RZWQvUVJES1F5eWhvVTMzSUErdk5QYnYxWVk5eE9XeHRUKzBO?=
 =?utf-8?B?eUlZTnpMVVJ6VnJVSXJQQk9qN3F2VzdwdmJpVnFiK2NtdXJteExvbFEzKzJq?=
 =?utf-8?B?elpQWE03Mk5XYTlTSGNWeS9IT2o1RDk2b3VvOC8rSUxvMmNjazRjR0tsYjB1?=
 =?utf-8?B?UkVxWkVYaUtVM3V4Q2l6ajVLWk40bytYMWJ1dDZHU3ZqYjhQT2lWR29HT0FR?=
 =?utf-8?B?VFlvMVdCM3hWRjRINW0vcnZhZ1YyUnlYV3oxcU9URkdMWEQ5TWYwUzZRSFJL?=
 =?utf-8?B?ZThnMW14RkpEaDdMcFZ0aUNoeDhpOEVMdHJKMi9hMTI5ZnV1eUZRS2RsZll0?=
 =?utf-8?B?YXBDVDBMUHRVUk1iUE1NWG9WY0ZrMFV6bWxjeE4zclV3WVBCU1NxVkYvWEht?=
 =?utf-8?B?V0ZlMm5TZVhHbHhGQzM3a3V5bUROQW10NHFPMm5nTW16ajBWdjM1bk1iaFNK?=
 =?utf-8?B?ckZLbS94TnBPUitPRWJ5NHE2SHBkV0pUWUEvSktUZjZsNmVkckY1L2ZMc3NF?=
 =?utf-8?B?anNzRjlDbWUvb2h5M0owUk40RUlBN01idEx0QkVQRnA3VXF5TG51aVJ3VWt2?=
 =?utf-8?B?UDJkS25DY0ZlM0lqc0ZRUW4rUEMvbTFsZHBPcFlBQzN0YThSWFg4Z2ZjY2VH?=
 =?utf-8?B?UG92RjU1VUd0T2pkK0FkVkF4WXpIa05adkxESkpGa1lmcFh6eEZONm41UGph?=
 =?utf-8?B?R3B2OWpYZ3RMZDZxSzhJa2tEbngzT3E1a3gxcEI3Z0gxVVVpMlJ0cXdYSXZF?=
 =?utf-8?B?NW5BaG0ydSs3YmxyZGdpcElNMW9IM2xucXNCNStaWFIvQjNmK2hyakNWNXQw?=
 =?utf-8?B?Z1NPOXJ0amlqclVXTWNTRXVLemlTUkJESGJYMmwxcEZOY0QyV3JuNmpESnlH?=
 =?utf-8?B?UVVlRmdQUXo5NTlzQzFQbG1taVprc1RyM043UDZxWDNJNkluSWkwR09wcGdG?=
 =?utf-8?B?cnhTNmcyU3V0NnlaenhGTmV3WjdDZDRob1E5VkluNFAzNWdGalRSL1phVVZy?=
 =?utf-8?B?RjF2L3RmSFIrNXlITUo4WDQvMFV0V284Nm11ZS82bGNkRmNQNytoQmNSV0Rr?=
 =?utf-8?B?RU5DeUwrTWdLVlNJN0RkRFZLZjVQQ2I1eGtTTHRyZkcvVUYxUXJRMXZyU1Y3?=
 =?utf-8?B?ajJjRGh6a05mNTNmcVM1Ykh4WXp1a0dDSXc0a2dpQk1RREJNbWZEajVqZHZV?=
 =?utf-8?B?ME5vUDAvMWZYNHU5bmxPdXVlUlpRNEd0M25zUGRjQkRieXJQMWpOVGczNFhL?=
 =?utf-8?B?NFkyT2hZMXMzTUx2ck9KZ1VWUWlMTGhPdUVrY09tSkg2WGYrbW9MQm1QWXcx?=
 =?utf-8?B?V3U5aG13WHBFYVQ2OFFQeFgyOW1YUHhvb28wZnFaYUYyM1dXWTZoK3FxRU1i?=
 =?utf-8?B?dnNjK3JjeGhBTHVXOEZvVkdWTXo2bE92ckk1bkE0VjJwdlUwQm5TRCtOaG1T?=
 =?utf-8?B?U2N0RFdqTGFTWjlZdk9UOUJlSlZyWDJwTkxDUEhaSWZrTFpuTTZKS2dNWVZy?=
 =?utf-8?B?Q1RvVUNabVRRYWhhWFA5WDZ3L25HU0ZiMVVPMUZaWm1IdzliZmRGQ0FYZE1P?=
 =?utf-8?B?RjkwM0JGM0tNbGNBaDI4MllMaE14cmRCYkRtRksvRCswYjFiVVVITDUxL0Vv?=
 =?utf-8?B?N2czc0lVMHNMdnVRbGZwRkU4SkdXUXZZeGYwVXFtQlk1WUx6K0JmeVl5K3BG?=
 =?utf-8?B?UGVVWTF1MVVUbnBrM0x4NWFPZWlBelhrN2RBUklkNTdOM0FkZUxjMlJkdEJL?=
 =?utf-8?B?ZEZXRnE5M0RNVkFON3hzT3ZMa2NtVDUxM1hmeC9TMUlKcGY5QzZacnZkUTFr?=
 =?utf-8?B?bHJBRmpIdzRLcUNDcVNKY2VjbTd2ZUhnckFUWUNVTFJJR1ZWaS9mQzhzbUw3?=
 =?utf-8?B?SmJqUEhURFpXdDV0SkF2TXpUdlpPWHVrbENXUXJBWjcyNG1CQzhJWmFsM0lu?=
 =?utf-8?B?NEhUNVYwUkhYenpSN2hKa0tSOUZHRUpMR1dFZENPQzVaS08yNFZpNjJEWE5H?=
 =?utf-8?B?WGQzSGJYaDZnTEIrNy8xSDZYUDQ1Y0wvNE1RNTlJbTFRaGxGYzhVZCtvalNq?=
 =?utf-8?B?QWovWkI5d2hwcGtUTS9UZVRNMC96dGoydEJXQVorMzdjbGgrVFIzN3NvTklw?=
 =?utf-8?B?ei9Qdndmck5DbFlSWFM0WkEzM3dPNElEVURlT1FrR2FkbWtlVzV4QT09?=
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
X-Exchange-RoutingPolicyChecked: FdFFaQ6eL8eVh5WvK93YwdngS8CbZZ98GYmt/rwdqjgmfzN0dWk0ks1s0k9iHh21/I8lM4KSMnkT5kRmM4bZBeK1bEjxd9rjT9xhz2Ikl+erruXN0OQkR6ugNqJVcX1UCEZFqOWiDWo+ixwy4yp87+KFrum+2QTO3n4S2OA0p3qTmDhVF/UiUBsmhiyoNEbyNuDnKAGbBDryaRKHrRWlQYSF5mL44wqiPe5MtHf2LVihAdoIBC9FgulnXgQ4IorCYGLZ9+bu9zzkKPjmBmRm8VP6pBSyXNnHOX2XRzoJZTRypFtzzkCmogXf1R+rmHTSwV7OwI1Oyc2IPwSbXX7AXQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB455487.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293e7d4f-e194-46f9-9147-08df428bcfca
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2026 20:13:56.3832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HbDzazVEct32Yco0ZxRTKmQ21+vXjxIg8btb+I2X8uY1spkQUOxFo5FGQYXd79ZgF0YPL4VyO5ySs5K/2c2Dkn/TokNdHbePV+xQGRtbPQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRGF2aWQgQm94IDxkYXZpZC5lLmJv
eEBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogRnJpZGF5LCBOb3ZlbWJlciAxMywgMjAyNiA0OjIx
IFBNDQo+VG86IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBwbGF0Zm9ybS0NCj5kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZzsgVml2
aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IFJ1aGwsDQo+TWljaGFlbCBKIDxt
aWNoYWVsLmoucnVobEBpbnRlbC5jb20+OyBTaWRkaXF1aSwgQXlheiBBDQo+PGF5YXouc2lkZGlx
dWlAaW50ZWwuY29tPjsgTXVxdGh5YXIgQWhtZWQsIFN5ZWQgQWJkdWwNCj48c3llZC5hYmR1bC5t
dXF0aHlhci5haG1lZEBpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
DQo+aGFuc2dAa2VybmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8xXSBwbGF0Zm9y
bS94ODYvaW50ZWwvcG10OiBOb3RpZnkgdXNlcnNwYWNlIHdoZW4NCj5jcmFzaGxvZ3MgY29tcGxl
dGUNCj4NCj5TYXNoaWtvJ3MgcmVwb3J0IFsxXSBpcyByaWdodCwgYW5kIHRoZSB1bmRlcmx5aW5n
IHByb2JsZW0gaXNuJ3Qgb25lIHRoZQ0KPmNyYXNobG9nIGRyaXZlciBjYW4gZml4IG9uIGl0cyBv
d24uIFBsZWFzZSBob2xkIG9mZiBvbiB0aGlzIHZlcnNpb24uDQo+DQo+VGhlIHByb2JsZW0NCj4N
Cj5PbiBCTUcgYW5kIENSSSwgUE1UIGZlYXR1cmVzIHNoYXJlIG9uZSBNTUlPIHdpbmRvdywgYW5k
IGEgU29DIHJlbWFwcGVyDQo+aW5kZXggc2VsZWN0cyB3aGljaCByZWdpb24gaXQgc2hvd3MuIFRo
YXQgaXMgd2h5IFBNVCBoYXMgY2FsbGJhY2tzOiB0aGUNCj5wYXJlbnQgc3dpdGNoZXMgdGhlIHdp
bmRvdyBhbmQgcGVyZm9ybXMgdGhlIGFjY2VzcyB1bmRlciBpdHMgbG9jaw0KPih4ZS0+cG10Lmxv
Y2spLiBPbiBDUkkgdGhlIHJlYWRfcmVnKCkvd3JpdGVfcmVnKCkgY2FsbGJhY2tzIGNvdmVyIHRo
ZQ0KPmRpc2NvdmVyeSBzdGF0dXMgYW5kIGNvbnRyb2wgYXJlYXMuDQoNClRoaXMgaXMgYSBDUkkg
cHJvYmxlbSBvbmx5Lg0KDQpCTUcgaGFzIGEgc2VwYXJhdGUgZGlzY292ZXJ5IGFuZCBkYXRhIHJh
bmdlLCBhbmQgaXQgZG9lcyBub3QgaGF2ZSB0aGUgbGF0ZS1iaW5kDQpGVyBpc3N1ZSB0aGF0IENS
SSBoYXMuDQoNCj5Gb3IgQ1JJLCB4ZSBhbHNvIGhvbGRzIHBtdC5sb2NrIGFjcm9zcyBpbnRlbF92
c2VjX3JlZ2lzdGVyKCkgd2l0aCB0aGUNCj53aW5kb3cgcGFya2VkIG9uIGRpc2NvdmVyeSwgYmVj
YXVzZSB0aGUgUE1UIGRyaXZlcnMgcmVhZCB0aGVpcg0KPmRpc2NvdmVyeSBoZWFkZXJzIGRpcmVj
dGx5IHJhdGhlciB0aGFuIHRocm91Z2ggYSBjYWxsYmFjay4gQnV0IGEgUE1UDQo+ZHJpdmVyJ3Mg
cHJvYmUgYWxzbyBuZWVkcyBpdHMgb3duIHJlZ2lvbnM6IGNyYXNobG9nIHJlYWRzIGl0cyBzdGF0
dXMNCj50aHJvdWdoIHJlYWRfcmVnKCksIHdoaWNoIG11c3QgdGFrZSBwbXQubG9jayB0byBzd2l0
Y2ggdGhlIHdpbmRvdy4gdjINCj5kZWFkbG9ja2VkIG9uIGV4YWN0bHkgdGhhdCwgYW5kIHYzIGhp
dCB0aGUgc2FtZSBsb2NrIHRocm91Z2ggYW4gQUJCQQ0KPndpdGggY29udHJvbF9tdXRleCAod2hh
dCBTYXNoaWtvIGZvdW5kKS4gUmVtb3ZlIGhhcyB0aGUgc2FtZSBwcm9ibGVtLA0KPmFuZCB0aGUg
bG9jayBkb2Vzbid0IHByb3RlY3QgYSBQTVQgZHJpdmVyIGxvYWRlZCBhZnRlciByZWdpc3RyYXRp
b24uDQo+DQo+V2hhdCBpdCB0YWtlcyB0byBmaXgNCj4NCj4xLiBEb2N1bWVudCB0aGUgY29udHJh
Y3QgaW4gaW5jbHVkZS9saW51eC9pbnRlbF92c2VjLmg6IGNhbGxiYWNrcyBtYXkNCj4gICBiZSBj
YWxsZWQgZnJvbSB0aGUgY2xpZW50J3MgcHJvYmUgYW5kIHJlbW92ZSwgc28gYSBwYXJlbnQgbXVz
dCBub3QNCj4gICBob2xkIGEgbG9jayBpdHMgY2FsbGJhY2tzIHRha2UgYWNyb3NzIGludGVsX3Zz
ZWNfcmVnaXN0ZXIoKSBvcg0KPiAgIGRldmljZSByZW1vdmFsLiBJJ2xsIHNlbmQgdGhhdCBwYXRj
aC4NCj4NCj4yLiBIYXZlIHhlIHN3aXRjaCB0aGUgd2luZG93IG9ubHkgYXQgdGhlIHRpbWUgb2Yg
ZWFjaCBhY2Nlc3MsIGFzDQo+ICAgeGVfcG10X3RlbGVtX3JlYWQoKSBhbHJlYWR5IGRvZXMsIGFu
ZCBzdG9wIGhvbGRpbmcgcG10LmxvY2sgYWNyb3NzDQo+ICAgcmVnaXN0cmF0aW9uLiBUaGUgb25s
eSB0aGluZyB0aGF0IHJlcXVpcmVzIGhvbGRpbmcgaXQgdG9kYXkgaXMgdGhlDQo+ICAgUE1UIGRy
aXZlcnMnIGRpcmVjdCBkaXNjb3ZlcnktaGVhZGVyIHJlYWRzLiBTaW5jZSB0aGUgaGVhZGVycyBh
cmUNCj4gICBzdGF0aWMsIHhlIGNhbiBjb3B5IHRoZSBkaXNjb3ZlcnkgdGFibGVzIHVuZGVyIHRo
ZSBsb2NrIGJlZm9yZQ0KPiAgIHJlZ2lzdGVyaW5nIGFuZCBwYXNzIHRoZSBjb3B5IGluLCBhbmQg
dGhlIFBNVCBkcml2ZXJzIGNhbiBkZWNvZGUNCj4gICBmcm9tIGl0LiBMaXZlIHN0YXR1cyBhbmQg
Y29udHJvbCBzdGF5IG9uIHJlYWRfcmVnKCkvd3JpdGVfcmVnKCkuDQo+ICAgSSdsbCBjYW4gZG8g
dGhlIFBNVCBzaWRlLg0KDQpEYXZpZCwNCg0KWW91ciBzdWdnZXN0aW9uIGlzIHRoYXQgdGhlIFhl
S01EIHdpbGwgYmUgcmVzcG9uc2libGUgZm9yIHJlYWRpbmcgdGhlIGRpc2NvdmVyeQ0Kc3RydWN0
cyBhbmQgcGFzc2luZyB0aGF0IGluZm9ybWF0aW9uIHRvIFBNVD8NCg0KVGhpcyB3b3VsZCBiZSBh
IG5ldyBBUEkgd2l0aCB0aGUgUE1UIGRyaXZlcj8NCg0KU29tZXRoaW5nIGxpa2UgdGhpczoNCg0K
cmVnaXN0ZXJfdGVsZW1fZGlzY292ZXJ5KHN0cnVjdCB0ZWxlbV9kaXNjb3ZlcnkgdGVsZW1bXSwg
aW50IGNvdW50KTsNCnJlZ2lzdGVyX2NyYXNobG9nX2Rpc2NvdmVyeShzdHJ1Y3QgY3Jhc2hsb2df
ZGlzY292ZXJ5IGNyYXNobG9nW10sIGludCBjb3VudCk7DQoNClhlS01EIHdpbGwgY29weSB0aGUg
ZGlzY292ZXJ5IHN0cnVjdHMgdG8gbG9jYWwgbWVtb3J5LCBhbmQgdGhlbiBwYXNzIHRoZW0gdG8g
dGhlIG5ldyBBUEksDQppbnN0ZWFkIG9mIHJlZ2lzdHJhdGlvbiB3aXRoIERWU0VDPw0KDQo+My4g
VGhlbiB2NCBvZiB0aGlzIHBhdGNoIHJldHVybnMgdG8gdGhlIHNpbXBsZXIgdjIgZGVzaWduOiBj
aGVjayBmb3IgYQ0KPiAgIGNvbXBsZXRlZCBjcmFzaGxvZyBkaXJlY3RseSBpbiBwcm9iZSwgd2l0
aCBubyB3b3JrIGl0ZW0uIFRoZSBvdGhlcg0KPiAgIHYzIGZpeGVzIHN0YXkuDQo+DQo+TWljaGFl
bCwgZG9lcyBzd2l0Y2hpbmcgdGhlIHdpbmRvdyBvbmx5IGF0IGFjY2VzcyB0aW1lIHdvcmsgZm9y
IENSSSwNCj5hbmQgYXJlIHRoZXJlIG90aGVyIGRpcmVjdCByZWFkcyBvZiB0aGUgd2luZG93IEkn
bSBtaXNzaW5nPyBJbHBvLCBhcmUNCj55b3UgT0sgd2l0aCB0aGUgZG9jdW1lbnRlZCBjb250cmFj
dCBhbmQgd2l0aCB0aGUgUE1UIGRyaXZlcnMgZGVjb2RpbmcNCj5kaXNjb3ZlcnkgaGVhZGVycyBm
cm9tIGEgY29weSB0aGUgcGFyZW50IHByb3ZpZGVzPw0KDQpJIGhhdmUgYW4gYWx0ZXJuYXRpdmUg
dGhvdWdodDoNCg0KMSkgYWRkIGEgYm9vbCB0byBzdHJ1Y3QgaW50ZWxfcG10X2VudHJ5DQoJYm9v
bCBwcm9iZTsNCjIpIHNldCBlbnRyeS0+cHJvYmUgdG8gdHJ1ZSBhdCB0aGUgYmVnaW5uaW5nIG9m
IHRoZSBwcm9iZSB1c2UsIGFuZCBmYWxzZSBhdCB0aGUgZW5kLg0KMykgaW4gdGhlIHBtdF9jcmFz
aGxvZ19yZWFkX3JlZygpIGZ1bmN0aW9uOg0KCWlmIChlbnRyeS0+cHJvYmUpDQoJCXJldHVybiBy
ZWFkbChlbnRyeS0+ZGlzY190YWJsZSArIG9mZnNldCk7DQoNCkkuZS4gd2UgYXZvaWQgdGhlIG11
dGV4IGxvY2sgbG9vayBieSBmb3JjaW5nIHRoZSB1c2FnZSBvZiByZWFkbCgpIG92ZXIgdGhlIGNh
bGxiYWNrIGR1cmluZyBwcm9iZS4NCg0KTm90IHRoZSBtb3N0IGVsZWdhbnQgc29sdXRpb24sIGJ1
dCBpdCBhZGRyZXNzZXMgYW5kIGVuZm9yY2VzIHRoZSBuZWVkIGZvciB0aGUgcHJvYmUgdG8gaGF2
ZSBkaXJlY3QgYWNjZXNzLg0KDQpXaXRoIHRoaXMgdXNhZ2UsIHRoZSBkZWFkbG9jayBkb2VzIGdv
IGF3YXkuDQoNClRob3VnaHRzPw0KDQpNDQoNCj5bMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL3Nhc2hpa28tb3V0Ym94LTIxMDE3NkBrZXJuZWwub3JnLw0KPg0KPkRhdmlkDQo=
