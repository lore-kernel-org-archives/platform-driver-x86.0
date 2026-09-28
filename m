Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E1D2EEE9E
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 22:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634030; cv=fail; b=LiO0qwKeKUYYw6loi6m8VxZAYXrWjgE6oFznJXtVlg6M/06/g+F+yE6rwqqP0GLBjoZ/GWrsUYsGfkQt4kt04YiB8jVu7ofkxU1TW+sCzd4l5Gf/dZvUQQet6Z0LNCVRdyPPXGc188QpS0sZHo+eUoUrR2zg80GBRB9qgl+dPJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634030; c=relaxed/simple;
	bh=xTbMn+/bHsJ9vHY6HA9O91NMM6+Rs5n6msIYincNgCs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gBBz2M3+HWv4EP+41ycdzKZkEf8KKLkwCiQJtWgrdReUojbKF+PEFZUMRnOsltl2A5qoC2/dOXGav9miNRye7cHu+o+KDW5mjOESe9l69sSH6v7UTQlffoUAgIvksnsADuxpeZFXEo0E0pCtd5/nt9LWuu5C+AbQKLkBH65XoT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U55iIxo4; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U55iIxo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790634029; x=1822170029;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=xTbMn+/bHsJ9vHY6HA9O91NMM6+Rs5n6msIYincNgCs=;
  b=U55iIxo4ykwduV9bP2wYaFwOkVaKraKWDXqkmlu7huw1rwEvwYvmWBkS
   aYhdgAm7FTaA3FHz+4jMwyiHQwuP2+Hj+OQ2vnS3WFqaWsRIh5mQz+Tal
   uKYL6d1WF/ntNuL3eF0kXxFI+gBck3edk0b99CLU/lozH54K+Oh37UdmX
   Njxpsma9au+2sFs0TMVKVBLa2rBaX3DpXOD25vO2uBNEKKFdDD+/CSr8E
   NUzmQ8CUFfRMTPS8JWV6dxSVCp7dXa+h0M8kooHGnmO7EeJHHoCv3a+Q+
   WYXvAVlzN1dT5/w4tTx5UmpkU2ff9W/k4qgrKN5qZcTBjcuxY5vvLifB1
   Q==;
X-CSE-ConnectionGUID: CdM/YCzRTqOts4qQtHCdXQ==
X-CSE-MsgGUID: bh2F/OhFTFmCZKxdxxxGdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90298137"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90298137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:20:29 -0700
X-CSE-ConnectionGUID: LEfqjPPERwGeiA6xmn/Kfw==
X-CSE-MsgGUID: vSt/xwDsQ/W8ZxSdN2WVQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="275205339"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:20:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 15:20:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 15:20:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 15:20:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvR5oc5fOddYOL91s/Z3rgwcRStGif2eI2MShUZ+T+4HP1Y1eSbED5RIakFOdHNDGamRdQ1Yjj76W43aRfQkiTROdpSAUmorgR/vT7bkZcvSWGjrpgV5doCNxlMnMpTnmvZIgH4ZRVjxhu9T1xoEyr+kOBPUls/Vf6Ca5OF+h/2X6x6uTgmcrt0zJbfMGOJBAALpJiZWW91OKGddgdeW7t+uSXlqH+/Lwr7H7Ai+NJvXIdNpnm4DQf1dYH3hGl3lEE2CQMnneUamgt9DWlmqTixOM10omo1V06prHbbN4YwdGLwBQhMbDMK+6iXdf7MI75rYHN74zEw30vjk3mLIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTbMn+/bHsJ9vHY6HA9O91NMM6+Rs5n6msIYincNgCs=;
 b=exkSqramOR80AC3DmpEGgwSrZ5NSXTFWyILGW4xWBNuaSthXFrRQlpgzoFi47gCnvNt8ny9BJVurbAU3FF6qZitsIN5oOoEqPg7YVXfcmbrNozYlChaAd10tDAaR7bCDsXyHHarF05bCBK3Wv4Ga6QFBpS0Q4UyRSOcVidsxGjtuO1Us50KMVwr80VHqNzNtQpjqel3C1ZbGU3ih2h19Wyr9i6FbkcMh+D7MQ4/qG+FLksQe//EnA9+JZumVq3OgIQOY8G1Zc/JibaGnuJUbdlPhGxmSfqO+JPUpRcpCFniTKrgnT+2EKzrL+wHMWfkSCLExwZLD0dmp3gW+VAHX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5600.namprd11.prod.outlook.com (2603:10b6:a03:3ab::16)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:20:25 +0000
Received: from SJ0PR11MB5600.namprd11.prod.outlook.com
 ([fe80::94a5:aca9:ce90:514d]) by SJ0PR11MB5600.namprd11.prod.outlook.com
 ([fe80::94a5:aca9:ce90:514d%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 22:20:25 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "hansg@kernel.org" <hansg@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.4-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.4-rc1
Thread-Index: AQHdT5ePwsxdtb76CU2/NHsw6IfS3A==
Date: Mon, 28 Sep 2026 22:20:25 +0000
Message-ID: <645699e90b0c4f7da46cd2e95023d6beced4a4ab.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5600:EE_|DS0PR11MB7649:EE_
x-ms-office365-filtering-correlation-id: 6deea547-df99-43fc-1ab5-08df1daeb1ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info: iK5h5pNY9pDHj8bH23XGmYnT9yxnpayPJIblaQJUPLMYNUxOdlUjeFpvlQFUrMA30lTnXXCp6Jdj6whA5d1KscE3S5EDjGcJQyddb9Ink9V0B3sBLsLjx49JjZofMyEzghicGwRh+vR6rQuoHqAkrf95Zy9doCQ2UI9RfyU3UI8U2kq97nPuj44p/6FKzpG9QPSeghUcGpjUF/fSe76iwtpjlLfjpR12kvpaSicPJFaaHDSAGFIafh7mO9VqutVJOFh2B9xWMtj0vYjzjXrB88spGjL1iDj7NqGAHb4HThPTLxrZtUOqd6jVsSo+hLyaZw71vkWyAfUa2JG7sSAnFU+fbGjp7nje/FZOCZEMlKxcyKa1H7fHd7aQmQ3+uiEDQCVp+vPobC0AIOigAHlXDR3paG+Y4zfQKRQHL9EenZ4IueJ3RnMb/FSqcBXa5IAjdJZjiviATGhb/5skK2b9GEcLXn6hi1y0A7w9jwfNxfduX95whBDgwme996VeSyZkySaGxL70LGpNbrgpRCEJcyHvlSc2lq5ZYnkR6uog2ZGt26fwWTCIRD/FmhG8InZdmqud7Waw1KgGDJo2xFFWq6JCj96F29S6VM+CFTGZJgOOMQavQ/I1oEKnJtP9tLyNQWLMEd7I4qJE12M8ZGVNYe/QfvizyW/Wu4sLW+0YvTIQranODfVMwqx11hkMGuum1Wo1zAm/AoW7Sj+O77bVoPBNEOnxFbkwUyiRnJA4oVQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5600.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGo0Wk5TWFNnSHZmQUhlRzROR1c0czlvV0JHMzVzQUhtWmMvdUVJT2NhbkVP?=
 =?utf-8?B?THFOWVA0ZkFjSWVJdm9mMmp1VEwzN28vemljY2RtaXdva3NOTDg5QXI3SHdM?=
 =?utf-8?B?YmYzUVN4OE5HYVlNT0FJbFZQbjFlb3lSZTA1Z0pkTlhiVFJrbC8yM1pKeGVE?=
 =?utf-8?B?eVkyODVoZUk5RHZaRlorTmZqbFREemhZLytBQ0tHellXZjVmSWh4clZ6ODJv?=
 =?utf-8?B?aC9WYkpocUtBa1B1dHFSS05IVW4rYUdsclo2NllsRlFEQXIrWm9DOVV2TTVK?=
 =?utf-8?B?R1owVWFLRDZjTEhwRmJ1WkkxYUFJcTBIRWtuUll1a01EbjRjMG1MMXJrczMv?=
 =?utf-8?B?NmFubldDdHVDS2NML2pBVzRtaGpiU0dhOStQaVZOSUZCSzVNSldaSEZCdnZI?=
 =?utf-8?B?bVBSQUNSKytlWjY5NWNaTDR0OTVqaWREczVKcU9lY2Z0Sk80Z0U2S01SZjlN?=
 =?utf-8?B?TEhJNVNoZ3BGVWUzRVZRVEwzUjM0TnJ5SmZJYnJxbDRpVGYvZldTcXIycTNo?=
 =?utf-8?B?Qkk0YTdBa3I5UzE0K2hNbmVDcDFPRE1tWmhqYWNxcVZyTEJ2cmQxN29yQ21h?=
 =?utf-8?B?MEVmMm9leFFwU0NxemE0ZVV3RnEzTTZpRklyU3hOYnJnam1VT2ZSRWhMbFFm?=
 =?utf-8?B?MzZRNks2QUZNdDhUMXJxdzRCM0IzMnViVklCblIyTlRFRGdvanRzcjlyR3Nu?=
 =?utf-8?B?SFhSN2Jtci9Lb1A1dnJ5VlNPZE5SK3N3VllYZHd5RjZCTUVpUXMxZFFUeEtv?=
 =?utf-8?B?TldTaDBLOSsyWFRxK1NxdFNqVmVTaUw1WE9SaDlaeEs4YUUvVkpJOVliaEdN?=
 =?utf-8?B?M2J3WXNNOWFkdnJGZ0FOcEEzbjZkSHNCdXVjQ2FWYnFNNVkzUkx1Z2ltVlpm?=
 =?utf-8?B?VVY1ZnUzNnlTRjN1MUYyS3FUUzJrRlZHM1N3RXRPemlOcWo2NGNaKzRIbGMx?=
 =?utf-8?B?UTJKcnZGMnM2WHVRRVgycjA0WVRhQ2crckFYVzRXeFBQVDJ4Y3dFQmoySWNG?=
 =?utf-8?B?bkFLeUdsNUgrWkZFVUZlOUQwRlZlVndXanJjWkhUbldNa2hrUHhZd01lZmYy?=
 =?utf-8?B?Vi9oYXAwWTZPRngveDArdGFtOG9MYWpiR3hnbkwrYzdrb2RIYjhyMWh2a054?=
 =?utf-8?B?YlpYQ2NPOHAzblNBejFnTFVyaGpxWEJhelVSeHl2ZjR5UHpVMkg5SlhVQm1E?=
 =?utf-8?B?Y3VwSGVHWW9Hb2RPY2NFSzc0dlFMTGtwM3djQ3htT0hjaVpvSzg2bmlJall4?=
 =?utf-8?B?U0ErYnRtU1JiV3BCN1NENnhZWGxjUFZnUkpBVDlvMHFzaE5neHlvV0tQM1Y5?=
 =?utf-8?B?MkZqeVhaekdCZnVpNDNNWGoyWlljckNTT2grYy9VZGpzN2lqZk1vS3pnYzNR?=
 =?utf-8?B?OUUycDB3b2lkUEZrY3NJdTVjNXZuQVJMRU5NQmdFVzM5Q0lNT1lWeFBBYkZL?=
 =?utf-8?B?QTlYcUNzcklURDNOSDRpVmt0eENaNDh4U0ViZE5NR3NXenBBdE9uNWNadUdS?=
 =?utf-8?B?YWwyaUZqNkRIZi83aTN6NThBcXpFajF3NlJJSHBNcFdSZGJ4c3FFaGsvV0RT?=
 =?utf-8?B?cEdXcWJmYitxaE96aThjanR1dllKQzQ5Ly9OM05teE1ZaTY4KzFRcXVRVkFh?=
 =?utf-8?B?NzdGazFMcTE2d0l0RSt0b0JSc2V6WFVwTXRqSzdjWTNKZkIzdHAvTzNGMTdO?=
 =?utf-8?B?ei9RS3gzQ0p3MVhsdnc1bDhRRW1JZVZBMVBKN1Eyd0xWencyV25uMERKbFd5?=
 =?utf-8?B?Q2d2VWZzTzVDWDV0VnVaY2JZZTBPT3FFVE1Gb212dDlDd3hGRERCWkJPMnEx?=
 =?utf-8?B?K3ZkOTN0Ukg0bVR5UUNMZmsrUVYrbm5iK2MyTDlsdmlJR3IwTTVaUzJ4TDA0?=
 =?utf-8?B?Z1N5UmM3blo5TUFkTkl0TlZvYWRtd0VVbUd6OGkyQXJSdERocnlrQ2VGbDda?=
 =?utf-8?B?TGxYVDBkTUkzNDFuTDFyUjlUbndmRklhVXJtTC9mRDM2UmZuenRuQXd3dURM?=
 =?utf-8?B?VDFmTVpmalJVeWxGOFRYdjE0V2RjYkhVSVNLMk1oZkdFMnUwZ1EyVTBxNlFH?=
 =?utf-8?B?bVFzbDJOQ3RUbWVNbXNLVDhMaHJMbHZBQW5YU3c4dTFXTThKWmJqRmdXVkJH?=
 =?utf-8?B?S1BGc2MrTzJwOXpxd0ZxcG9ER3pyMDhUSk1NeGpLYi9pQXR5RGVFZGJBZml3?=
 =?utf-8?B?UThhaHZtRnNMRVUwY1pQcndVSWZjZWpUQ3Mzay9Ha2NzVUxjN0FWcUEvc3dq?=
 =?utf-8?B?RGl5OXBGclZlc1E5d2k3Uk5zQ1ptekcrNWtOMWZaWFNteDNNYkZHS1BwaUxh?=
 =?utf-8?B?Q3BIS3JCVzdPMkIzVU5zc3ZkVktaM1dtV0F2cndITE0xbXpQbDdYb1FORUpi?=
 =?utf-8?Q?iqHqHM9lu1aio/W9vbttgueounzoJRWfsOtY6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34D6261D915A904C882169FC64C001C0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Z0WgcAb3VxlKWboZoNcL81clwFKZcL3X4flI7obmcXR8CNA3Xnh2iX9fzL+BCNCcf/mpmmB9oC+58Y1fHHqk8cqrx07sdzEzKEcsTar3eD0JaX+zilvEpW8gJecND/5ooFXK3+N3Jon64qluKfIRuzcNoZsDapu2ud339kHWIOg+f7//Sqfh/o2vpSAZDhvxkxdgxMmQ0Q6IVP2c34m84kfM9H7HnJvsOn99oMGaHlNFpsUeC+wCg+BJOTiuxuNV7CrsO4GcnZgODRTtPWxGSi75TGTUW9H9g5xCNlBSC1w9HIyAJBJ4vJryKeyhqt14b3OR5vlkqJfSuu/suw7MgQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5600.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6deea547-df99-43fc-1ab5-08df1daeb1ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 22:20:25.1932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myByydi8wiA9MIenWAxR6CvFYzE4A5G3rruBbm8W1//RqHjEU/NsdL7fgg+p5tFGLY7bcCQjLyLIqVY+CuhKUay0SWKk9YoTYePoYJr28B4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
X-OriginatorOrg: intel.com

SGkgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCg0KaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0tZHJpdmVy
cy14ODYuZ2l0L2xvZy8/aD1mb3ItbmV4dA0KDQphcyBvZiB0b2RheS4NCg0KDQpJIGFtIHNlbmRp
bmcgcHVsbCByZXF1ZXN0IGZyb20gbXkgcmVwbyBhdCBrZXJuZWwub3JnIGZvciB0aGUgZmlyc3QN
CnRpbWUuIEhvcGUgdGhpcyB3b3Jrcy4NCg0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
Y29tbWl0DQpmZTUwMzBjOGNjNzE1NjIyM2Y0ODUzMGU5YjQ5YWE4N2MwMzA1YmNkOg0KDQogIE1l
cmdlIGJyYW5jaCAncGxhdGZvcm0tZHJpdmVycy14ODYtaW50ZWwtcG10JyBpbnRvIGZvci1uZXh0
ICgyMDI2LTA5LQ0KMjggMTQ6NTI6MDkgKzAzMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0Og0KDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9zcGFuZHJ1dmFkYS9saW51eC5naXQNCmZvci1zc3QtdjcuNC5yYzENCg0KZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQpiYTRiYjY1MzMzNjU0ZWNiNzEzODFhYjg3NDg0
MjAzZTIxYjMxYzY1Og0KDQogIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYx
LjI3IHJlbGVhc2UgKDIwMjYtMDktMjgNCjEzOjUwOjMxIC0wNzAwKQ0KDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpFdGhh
biBOZWxzb24tTW9vcmUgKDEpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNl
bGVjdDogQ29ycmVjdCBtYWNybyBuYW1lIGluIGRlYnVnDQpvdXRwdXQNCg0KSmlyaSBTbGFieSAo
U1VTRSkgKDEpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQ2xl
YW4gYWxsIHRoZSBwcm9kdWNlZCBmaWxlcw0KDQpMaXUgSmluZyAoMSk6DQogICAgICB0b29scy9w
b3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXggc2lnbmVkIHNoaWZ0IFVCIGluIEJJVCgp
DQptYWNybw0KDQpTcmluaXZhcyBQYW5kcnV2YWRhICgyKToNCiAgICAgIHRvb2xzL3Bvd2VyL3g4
Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEluY3JlYXNlIHdhaXQgdGltZSBhZnRlciBTU1QNClBQIGxl
dmVsIHN3aXRjaA0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEu
MjcgcmVsZWFzZQ0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9NYWtlZmls
ZSAgICAgICAgIHwgNCArKy0tDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9p
c3N0LWNvbmZpZy5jICAgIHwgNCArKy0tDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNl
bGVjdC9pc3N0LWNvcmUtbWJveC5jIHwgMiArLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3QvaXNzdC5oICAgICAgICAgICB8IDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KVGhhbmtzLA0KU3Jpbml2YXMNCg==
