Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C98B667
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Mar 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741286984; cv=fail; b=QnfH07cEI7I9SczYx/S7RikbfrzJ+T81QPRqdIwTqPdQpnXlTYnHpF1bIQ0c3Sdf1VUuGRmcup8gvcSbZAWGs+NygRZUPxZ+XmW85VJPI2iUnvLt6YNNYatmJKN5Z1Nnhpoe9VeCyoIi7Cn8ADl7X/S5lIxFjKdR/NvuwQ+Y48g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741286984; c=relaxed/simple;
	bh=9SiiDg7iSj6t25Sx0trfe3IsboPnrileDDofu40Kl5Y=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uyaX2y4PaYTbJP5KuonssiGuI1FDvVd2rbrThAeX48KfOaVXYLC8DM3s9KRFqAobFnbgKzh06GaJW0Aq6AWQ/Wrwmpog8jZ8CcA9Z7/4AxHtWGQtwwhXe5O80boDlZUe/Wqtae/WuAZ4juE3uHRnaF6gdQ5J8ime5Rd8CeQITKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMnnDo4L; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMnnDo4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741286982; x=1772822982;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=9SiiDg7iSj6t25Sx0trfe3IsboPnrileDDofu40Kl5Y=;
  b=eMnnDo4LpP0qn6WaVm+2DEO9AoYIWl8MtBbwHKwmSDpMEhE5hDyHcs+9
   br8DK5MksGlTdC5PMY1UGamGz8f8rEqjcUDPqVD5UjiPRmWdH7ga3bz3f
   thz2DHMrvSY2eznXLgZAjSw8MLVU5b51xOI3cXLr6H6sHUCQnUKMvC+YN
   c5KGQM2hu8TtoWRlCKCi6y1oAtVdTYDva+VUWenoIjXQizx+Yca4y9e09
   v8a1tj7x/HmqWXp6+hifB3qdOQtjozpKxoD93NRtv+pFrjDB8C7gGGciT
   TQWCNOQxeBqImprxCvzFXicpb4gxPMwENaa46JAuYw1+hrDiMvUASDk4j
   A==;
X-CSE-ConnectionGUID: /9npGKzEQFy/CQ7GPRS4+A==
X-CSE-MsgGUID: Lr65EsL8Q6CIe1pPs2GlCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42457222"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42457222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 10:49:40 -0800
X-CSE-ConnectionGUID: 1otI7dtMTLCjWfom6qKuHQ==
X-CSE-MsgGUID: lIbj0bnDSg6PyFqhE/yLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124318100"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 10:49:40 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 6 Mar 2025 10:49:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 10:49:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 10:49:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXiNZNl913N3Cy99oAKgQ9ZYx4558c7I7dZwnvP11ZAyqtc9CZ0kQoKBsaK6+EzyFixzQ4BpLcsfwRZhT9anIiMmcOIXpyiZ1t9wdiayyiL7ioN0jSuOf3S894qD6raVEoURYc5BnynQDuBzzDfX16rJVdAvF2KWysxHc3bpbU9H04/K8KUE0Zeg/mC9Il4vXldzipX2/RJHLGWoBnnhrVeE2akw5qUPnZnGckc+BL2s1cHShwe706k+o8pwwY68JoP6yiMpblDOK+gf5Foj3PxASUYlciyXM8yjt3M4TflOxfiSwZb+Zbbs7qvVM8AFvspVPg+HYuh9L3KYpJYcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SiiDg7iSj6t25Sx0trfe3IsboPnrileDDofu40Kl5Y=;
 b=laW8LKnoUUzMVcyP7pgmuBfM8YxLLawMswz71YZ5iAUTkdz0Y+ae/Z9yCfK6cL5wUHpyl+XHyvOYd6MdYeXE5Bie3MKLjRW6MqVZkCQYHpMrWmFh2iVhG+kvGLQiqiRUqsoBTp8t8GTo749RW4CnHwjlleIyjHxuS3bZfuyhBiKjyL9CM01fLoOoUnXl5Rq2LgW3BZcbYbi1q4WGMz/PZClLLhKvYmwnGLLH2r6MzNwrGv0RtyWJpR44ehEvr1IFmbNg/N67cpNuPsHhzdYtsaHQRr6WgICkEzTDEjrBvnKicKdzbSXakbx6QEHLwbPCvENsXRRZxztIrxuSJw1Khg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Thu, 6 Mar 2025 18:49:10 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 18:49:09 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.15-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.15-rc1
Thread-Index: AQHbjshymbntyLHZhkuZ4tF+/qHnjQ==
Date: Thu, 6 Mar 2025 18:49:09 +0000
Message-ID: <e884b4d403a650139080366b4b9f7c9d4be78efd.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|CY8PR11MB7340:EE_
x-ms-office365-filtering-correlation-id: f0dbfcd1-3fc5-4287-8899-08dd5cdf948a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dHAzTXQzc0h4Z0RHNWUzZCsxVHRHMW11c0I1UlR6U1MzSmZVNmMvQ255bUpl?=
 =?utf-8?B?bkJ5QlRmaDMvL3NGSVE2S1Jyd2hnTXozUDFhWWpienEwZ3Y3eWp2ZUdkOEpD?=
 =?utf-8?B?MDNFb0crV3VEaUhTS3BBc0xhVSs1R3o0LzF1cGF5bEN2eloxcW1DQ3NyUm4v?=
 =?utf-8?B?NjRmbk1ZaSt5WDBHYkROVGNON3dTL212NkxBREU5VTJUdlZJem5SZ0MzbDZy?=
 =?utf-8?B?b09RZlBqMTZScXBwTS9kV01VamRHc2ZLZTZUdlJsZFhWeWY2WDMwSy9DdnFD?=
 =?utf-8?B?blFsU1ZPYVF2VmllUzd1ODNGNG8xbDVHdVZBMVMyYUdUL3dLclZnRzRPMTJI?=
 =?utf-8?B?S1VNY25RcDFRMUJ1UHVsRnRmNDBQclBJZTRTa0x5WC9aaVNCekdrS1E3citz?=
 =?utf-8?B?dHpKNmE1TXJ3NS9MZ3FUa1VwRDlKQkNHbWZzeERTN3ovKzhpY1hScnN1L2FS?=
 =?utf-8?B?WkRRdTNKZ2V4ajVxMmJ6QTlsbVhlL1VkZmtYRG5PYkM2Y0x2TFBVb3pzQzRn?=
 =?utf-8?B?ck9kVThFM2Z1eXZnTjV6cndjem9UMlVDald5K2VtOVR6Z1RIbjFDWnV0dkY3?=
 =?utf-8?B?L1JKSmhvL0RkZ09SRC9EUW8wT2l1cjExSVlpS2hjVmJUM0RLQXRqVHFURVJF?=
 =?utf-8?B?Z01KbjQyVzFHTW5PcmZwT1kxSVBleTRVUy9ETUFLZ1RXWEl3TFJkWEVJVWhp?=
 =?utf-8?B?d2NxSGxYWUtQbnYxa3ZOLzdQRjJnR1lXRU5MM1ZnS2VyN2llOTVoZCsxWHhs?=
 =?utf-8?B?U0xXRThoK3IwUm9xM3NrOExsU0RwV01iMlkyVGg5STI3ektaZENWSHBzWTBV?=
 =?utf-8?B?aUI1cVJRMndxZlpSSzE2Zm1EbDRZSTk1dUNLU3k3eUZBd2lkMDVtOFJ6VFor?=
 =?utf-8?B?Z0R6b0kzbTFUU3Z2S0pNUVk0L3VSTnczdTlKcWlPTUg2RllkQkt0YWx1eENt?=
 =?utf-8?B?RTlFRkNZeDQya1BlYzBTdDVaSWtodCtGM3ZqalZQanJsODhKajBmN1B3a1dD?=
 =?utf-8?B?RWtOazdIdzVpdTlyRUQySXo5cFh6VWZJeitmclptSVVxY0Exd09Nd1Z3Q3V3?=
 =?utf-8?B?Ylo3b0IzMklpOE1oSUEwM2VkWUFuOVppeUxDUldRU1NQU09NUjE1ME9tZUVk?=
 =?utf-8?B?R0h0bllYWlpObEJIbjZRUEFvYm9sOEZRQ0lXTUgzOGt5ZHRJQUVIc3RDY2ps?=
 =?utf-8?B?T2VxcDd4R0xqTS9Ua3pKbGhJbVlGaTJsRlJLQjdkSExJaFFOMWFCRjdRSkd6?=
 =?utf-8?B?MDVFdEh4c0RZaU5ENlNrWmRBWHV1d2dtdllYWlBDdDN1b2M2ZG8wOFNhOFBK?=
 =?utf-8?B?UERQNTczdmNVbmhqcCtyc1RySHZUbUJMQkJiekM2VGg4SC9jMWpNSnRpby8z?=
 =?utf-8?B?M1k3SmFoYjA4a2EvUlE1ZkNwWFZRL2Z5N2VLV1RNOEZkQnNBR1labkdFOHJo?=
 =?utf-8?B?VEF6VUROTWtWb3MwdWdzZis1bU11c05NdjNNeVFDaHZBWGV3c1dhV3JZdEEw?=
 =?utf-8?B?WW1qajRLSW9TWlU1ZVRUbzVnSDc0bDZYdlh3TSt3UGd1NWk0dUwyelFMWWVE?=
 =?utf-8?B?WWxjNUVNVnEyZy9veWJDcXc4YzNqVVcza254SUhSd1d3UDZkcWlIcHZic0R4?=
 =?utf-8?B?OUxrVTdvak1IV0UxZHo1OXJxS2piYUtyc2p6cStOR01vcnFJNGQ3MU9QUnlP?=
 =?utf-8?B?M1ZFdzZJY3hUQytCTitYOTFUYk45bU1DRGJFOTdiNnIyZHl0MzRuUWtBTjZz?=
 =?utf-8?B?ZDBxYVRNU1FCaXkrUlVGczZaZWhsRGkrNVRGTlVmS1ZQdXh3UE9sbUlUZEhG?=
 =?utf-8?B?YWhYb09vamdWNTZvd0JFYUQvb0s4cU8xRUlDdmI1ZFJXNW5ScUxWUzluaTlN?=
 =?utf-8?B?VkdWdy9PWVFNeWgyNTRuUmRnU3Ezb28rMXpnTThETUo2dUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmxGTWlDTU5ORGE4aytBeFIvblVlQlNkTlcwSHQrNE1kT1lWUEo4WnAyb2pR?=
 =?utf-8?B?SFN1VlAzS0twVGJRM0FCakhrNVFQRVpSZnd5cHNZV1hmWFFneUFzNjhtYnJM?=
 =?utf-8?B?R2V3TnhMR0tDQk51d0dGSTg2cDZPSXYvY1JLK0wxbU54UEJzUmhLOWkyK01i?=
 =?utf-8?B?bW8vZGJ1NWRMekl0c3N1NzA3R0dHLzFmS2pXaFlZbk9CbzRkdGlmeWF2bXkr?=
 =?utf-8?B?eHFNUjdwMEVCSWZPeDM3amJKTjdnUjVNblZ1K2h4TTVrd2xKWGp0bldVSUdI?=
 =?utf-8?B?c3FzTzRXZFRtNzNWaTlDZFNVblBXbGVKc0ZwRWZFemhQRm9EK1N6ZTFDV0FT?=
 =?utf-8?B?TWVobnpMekw4U2FVM0ZpQ1dkYXU1ZkRhTmF2ZXVrUGhIS3VVZDVLazFxak4y?=
 =?utf-8?B?MHp1QjVJdGk1bDh5aFF6QklKYlE3Sk1zT1NlRktvMWRLVEdxNld3NlNLRlB4?=
 =?utf-8?B?Mkd2MWRJWjlOc0RBdTRnUndsN0NYaGgrYXNBZXQ4YmtCRklBVzhzZk12dUpE?=
 =?utf-8?B?MVVHMWRnaVJMc3BCZXdUZGdEM3UyQ040VUNTeTNrMDNRN2ZXOE5xa2E3SWor?=
 =?utf-8?B?VHRKTmJpQlU3ZVVRMEI1RmNDZGlwMCs5eUdGSi9zaCt0ZjBLdWIrQ1dzb0FH?=
 =?utf-8?B?aVJzUHFRSjFPNDU2UmRER002bm9PeXBHNnExN05EWi8vdjJuUDBKVmRPMFha?=
 =?utf-8?B?VUV6NUZSK2pGei9xOU4rNjh3NTNjVEMyNU1KRkh3bDdMWWV1ejZTS0FDb2lK?=
 =?utf-8?B?K0Ztb1FhSExEU29VM21QSGRPWGZIV09Hb2Q3eU9xTm5qOXJUa2hJeHZqd29a?=
 =?utf-8?B?KzZMeFlWTkN2VG5CaDlXNFVYelFYc2I4akt0MVdsZU1pTGN4aVQvejlSMDJV?=
 =?utf-8?B?MG81QnRIMjBFVUwyOVZzbHBiRGpRMGtCUGIyd3kzdTVYTFJrRnkyMWVWblZX?=
 =?utf-8?B?S2wxUEdsQkl5R1ZWekNYNFlMTWRCKy9PRFNPcEpEejU0bFRyOHBKZkF1K2Fv?=
 =?utf-8?B?ei9RRFRQWE1LMFR1Q2o1Rzd1bWNUM3IxdkJHSWZrYjZ0V3Z2VkY4cTg1QXND?=
 =?utf-8?B?eTFZUEc1MktFVXR0WlkvencyMTZNbnc4STAzZTJxUndDM3hJbHR0cENrWlFE?=
 =?utf-8?B?N0JNYVV6ZUtCdFpERmRyQ0JBU3pxYzZ6RzZMSmZicTJZZnNobGJ1NjJscnFw?=
 =?utf-8?B?eUpuaC9TRWF6T25yemcyS2YvcGx3cGZEbjZPU2ovVVAxdW1Rc1B5ckxLSXhC?=
 =?utf-8?B?akxRREUrT25YVHZ0L2NVaWcrb1ZwRURobWc1V3k0VXlaZThHNVdPdkIxb1RD?=
 =?utf-8?B?L2dteFh0NVplZGJza1drQzdQQ3pSKzNaQ3c0SUE0SGJCbHRzT041YU5PMUdl?=
 =?utf-8?B?TDhrZGxiQ1dtSjJxRGx0RDRPN3lWcTNYeGtZM2E5UnNQTFJKSmFjc1FLemww?=
 =?utf-8?B?ZVZqMi9jTXZSZXUxQll0SUhDeDRWMlhieFlHbVlNVFN4Z3Q4WjJ6UW9abzFI?=
 =?utf-8?B?T3haOFdlelJJd1AwVloyT0hDTmdLMitJVTB3TUNWVXBxalA0Y2d0Z3pFTTJZ?=
 =?utf-8?B?TWxBY3BnMlRNMW8rTGZ1MUpEY1gyZ2xwRzlhajNPTUx6cWRENWFvbWRVOW5h?=
 =?utf-8?B?VStvRDhEU0x1ZHB5dXRHcmRPak1PTFVHcEt0YVJDamhUMkMwZHFTT0tMaXF0?=
 =?utf-8?B?UzZaSTM4L0lVOVlRZ1VaOHN2Ym1oMTB3K2s5TkJRY0VucG9xQndScnVtbVVq?=
 =?utf-8?B?R0NLT3FXNHJKUlkxR2dJMkpPNktLZzlEVFBHQXN5bkhCWDRDR3h5dUd5NjJF?=
 =?utf-8?B?WXp0SlE0alBETldOUUhPdFFiQXRtU0hUdHUreHdOSFQ3K2QwcGkzcjRZMW1Z?=
 =?utf-8?B?YThtSVlmaHFDN0pkYWFFSnNWOEpqUUFYRmM4eHI1NXZmNmhhTXZoYUYvdHFF?=
 =?utf-8?B?ME0wcG5wU2xWWC9JdGI2MFFhOHpwQzNneG44V0VpM3dOL1BzdkpqMEoxNGRz?=
 =?utf-8?B?YzFTK29XRkw2VEdSQjJQSzJFdGxML3ZhN09RSmJDVFZrbW5Ha3AzY0FOOG1D?=
 =?utf-8?B?bnJSOWl4aEsra3B4QkhYVzJ1ZEtIY21tWWdXdXE0dDVoNzNlQUlzZmdQMzg0?=
 =?utf-8?B?TjR2SEJOV3JGVjA3YnBnUGUveVgvbXQrcnQyNVhOL2J3WFVKdGFDR3Nmb3ZO?=
 =?utf-8?Q?bhTyz+8r9RT7gBexXr722QU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <364BC3E576332047AFDFA371EB96A6C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dbfcd1-3fc5-4287-8899-08dd5cdf948a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 18:49:09.5917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9iJuJjBWdi4hFng0qBEJGCIzR03EWSlWlqPd0pvc0AUdkZn3h+QKirdWLcve5s4jVS9wKtaqUP9pFQ+lGzWLR3gtitTEmZKsSzyiQZjUrXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
X-OriginatorOrg: intel.com

SGkgSGFucyBhbmQgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCmh0dHBz
Oi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2
L3BsYXRmb3JtLWRyaXZlcnMteDg2DQpyZXZpZXctaGFucw0KDQpUaGlzIHB1bGwgaGFzIGZpeCBm
b3IgZGlzcGxheSBvZiBkaWUgSURzIGluIGEgc2luZ2xlL211bHRpLWRpZSBzeXN0ZW0NCmFmdGVy
DQp0aGUgY2hhbmdlcyBmb3IgZGllX2lkIHN5c2ZzIGZyb20ga2VybmVsIHZlcnNpb24gNi45Lg0K
DQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQplNTdlYWJlMmZiMDQ0OTUwZTZm
ZmRmZTAxODAzODk1MDQzZGVjMGI3Og0KDQogIHBsYXRmb3JtL3g4NjogdGhpbmtwYWRfYWNwaTog
Y2hlY2sgdGhlIHJldHVybiB2YWx1ZSBvZg0KZGV2bV9tdXRleF9pbml0KCkgKDIwMjUtMDMtMDUg
MTQ6MTQ6MTAgKzAyMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFuZHJ1dmFkYS9saW51eC1rZXJuZWwuZ2l0IGlu
dGVsLXNzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCjVjZjIzN2ZjNDY0NWFm
MGFhYmQwNTRhMTYxODRjOWVjZDUzZGIwMTA6DQoNCiAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNw
ZWVkLXNlbGVjdDogdjEuMjIgcmVsZWFzZSAoMjAyNS0wMy0wNg0KMTA6MTg6MzEgLTA4MDApDQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NClNyaW5pdmFzIFBhbmRydXZhZGEgKDQpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2
L2ludGVsLXNwZWVkLXNlbGVjdDogUHJldmVudCBpbmNyZWFzaW5nDQpNQVhfRElFX1BFUl9QQUNL
QUdFDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXggdGhlIGNv
bmRpdGlvbiB0byBjaGVjaw0KbXVsdGkgZGllIHN5c3RlbQ0KICAgICAgdG9vbHMvcG93ZXIveDg2
L2ludGVsLXNwZWVkLXNlbGVjdDogRGllIElEIGZvciBJTyBkaWVzDQogICAgICB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yMiByZWxlYXNlDQoNCiB0b29scy9wb3dlci94
ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29uZmlnLmMgIHwgMjINCisrKysrKysrKysrKysr
Ky0tLS0tLS0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtZGlzcGxh
eS5jIHwgMTEgKysrKysrKysrLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pDQoNClRoYW5rcywNClNyaW5pdmFzDQo=
