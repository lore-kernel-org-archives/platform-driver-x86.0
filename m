Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3332F5328
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 19:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417060; cv=fail; b=haKtD3WqLFZ6VkyUqbsRciJEDtkhAc5mZnKnPCCB8RAEl5fgdtVP1qLKLKmUoOT9KTlm0mjJmE8+hskaBCDKOEey2+FxTNhc4UEdXgZ0jGtrezUo1mjPoidBXASkAbgxwDN8zLC25XfBZFlHQ4snCAbd8Ufo3fLoNumxKeshpTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417060; c=relaxed/simple;
	bh=yrXW7Ta22zVEANzmRVKYdfkmWvIRvytrV8wtUTu0liU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sD+Zuve1uCRj46j8F7e+R/azn69qiaktUhuAr/dBS0ISoc4Zn/rpdzod3L18pBsEkJdAXlHjL0eJU57O6TUapghp3QBmSrJMEyqNlSYz6AG40DRlUrGmJgznf5po3ZzDXkH08C8JfcGNmbC7Q0H9lbX0gry0D8CrNvkm//rmmOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH5BffMv; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH5BffMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775417058; x=1806953058;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=yrXW7Ta22zVEANzmRVKYdfkmWvIRvytrV8wtUTu0liU=;
  b=SH5BffMvbfeF5iWQ8cJrSo2+BLGcnBSqC1l2s2aR7e3p7SkA0WWfNkq/
   JsFndKyroDBjbPrpFzHro2mgCI5f7UvEKB2rWRjM7KhoNKfFTQAp/EIme
   PbTU+3Jc39EtxprByfcYtFz9dqGXa29ZYfa6Jgx/kwzVqG2M+Yw43Kkx1
   ZyTXlmkf2G7T7TXEvnqWv3dCTNV62/HFxcWufP9+J7zxedg9FwGpe37zi
   crteCR5mT3XTGPkyKnwGYNI56kxgYJ2GSZJatxSqfMf+ROm61ac+M43Wd
   L0oYGMWG5Gsbk9NlzowveDyvxeMbgrDnAXJ9RqThqkL2LUlZjBn2/9mWH
   g==;
X-CSE-ConnectionGUID: icEy5T8QR1m+KIuE9rn2qQ==
X-CSE-MsgGUID: 8vRmw9IHSpCkR4QkZga42w==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76352039"
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; 
   d="scan'208";a="76352039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 12:24:18 -0700
X-CSE-ConnectionGUID: IQ7zb02dStaZ4X6B/6SBrQ==
X-CSE-MsgGUID: U4SFktOaSZ63aBeA6+hrHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; 
   d="scan'208";a="265682971"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 12:24:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 12:24:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 12:24:17 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 12:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDCaSnBlSsaOsz6Qepy74X06URzwPAMNqXIFKT1zMSTT/vDwzyKvHp2rcKECBUVaxSC3V074YRqdxHQCPo+CMDBGZrQZXe0bLR5L671lygB0qdAqkuAHkdjqgXI6fj/U3+cM2ZLlZUoMgjHcTOBAOCR8pZFw5XpbsHKgrBgQWMqhufawlrIbHao57c3aCuEgJZZT1n2eG/gwgjVF1vNlz1F/P67QeHiQWf4N0JHQwfcJQ7bbiozatIDcdIC5vrrHN+nHNwHty4XqqLvtvC5c62vr5Y9/JK1B5J7ch++eqn1PYWcct3joJ7h/bW64HyBz93DU1cdvidyZGoZuTfpI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrXW7Ta22zVEANzmRVKYdfkmWvIRvytrV8wtUTu0liU=;
 b=Htxf1yPbiC53PzIcZF3bTl5J4cVOrznftdGfHj1MwLT/EjM+N4oYB7Mb2iXknaVSgYu4To4Tv1ESRMFMG5jzP/gwiJ44CxR7k7RNZ06ckSz2Dv25ANvHCwkrm5HBdozOhGp3YiPhopuC/nnciehsw1pVXulWplZEEG2SPIU6COuyjfJkKCXU59cievFAB1073lOoNdP7ADxeA2/klyWHJ4KSHhl4xdunDsBUI4RQKdMlLOqBlZirc+B/1Ch0vjhzMjLRuZnoHfQXbByGCyG6ekBKFkKeTeumlXSexQUEqZw9sw4Kkv9QPsb2RAlnI6BW6pVEkEG3zx3BYPKH+pv/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 SA1PR11MB6847.namprd11.prod.outlook.com (2603:10b6:806:29e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Sun, 5 Apr 2026 19:24:10 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::4fe4:767e:7ec8:6fd9]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::4fe4:767e:7ec8:6fd9%4]) with mapi id 15.20.9769.018; Sun, 5 Apr 2026
 19:24:10 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.1-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.1-rc1
Thread-Index: AQHcxTHHVNhlSilEYkCy61pzdUAuaQ==
Date: Sun, 5 Apr 2026 19:24:09 +0000
Message-ID: <0b288f7a7024f896a1699ac3609c7da39c588d03.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|SA1PR11MB6847:EE_
x-ms-office365-filtering-correlation-id: 79eae14a-7183-44a2-9fc5-08de9348e9a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: ttFordlPI9qNuE/OCzf9a4umgE8XPIfnzndajARkbfwa7msCBclpNegPoGiVxmybxzBjiBii6O8DbJ/WY7V8LJlZ7v0+nN9fEhI5iib5YNVddB49Bay07vr2ml51JQeUxf6YMW6mq2Y32jByBmx8DciIlfvGgydusbQ5JwAEXD2ePrX8Unte+qufTvrE4c2d+3nCroeO8a4Fz8WlqN6uUuba2OFUEeu4q5/eIxdnwmfazAspx61QtfDA2L183eJUQA8V1HAR59/TLefJLz65OfI1dhTyZJcdBPsb2bLkkCqUqQhJO67zpGiXH6VvzWygGBbIfYabtQ2VGo7toRl97ha/g4TkEUkp/UUfti+TjaBu2S28B3d7sOiS6VYZcxz32P8gzvITZmwucMYp8cSkhml0M+vnAOH8uHajRdYZHW1yXIxbNlV278OHgZOYQmvOCuEofklA/QqOjnn6et6yLQvdw97TgV2e/Rdi3rUJk4FhtAhyvhzEY4quvRhcv+TGUVnvCPfae3H1xg5c4Wf5WVhGMfBToTPPsYstIu2UIu89q5RU8OSgvB/yGSsngtMkjlBGqItp21Ceebhb7oEC5pXICj5hiLKxwbGdJI20TC85g7E1Zxk55s5LlqmVM8iTAkRl+gCF1xVtgnYL+p1eeVXN8OiGdoGfEQLFwn7M6dFXIed5HxZKl45TsT3uIYBQivMSgJoXfL2iZMyKF0Tgh2i3gnNGBC9j0PJzVcrZI6QXaw8GSkI4BQo4pYzCtipeuLA/KCiLE/pOgkgKKzdkQwje2iRREKI6zZZdVkJtScI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjNwb1kwRjRBSmhYUWozc0ovMmZJV3c4WW1rRTBGNU5FeVVISjA5ZkFWNFFt?=
 =?utf-8?B?TURNSjJmRUtIVHVQdlpXOHpLU0t1SzFUTTlLdkVaU3VEb1JMM00wNTJ0WFln?=
 =?utf-8?B?MFpVRmxSNGgvTEkwc2VSZnRSNUw3QzR5N3NTZXRGN0M3eGZtczRnNldpTU5Y?=
 =?utf-8?B?bzBGcVBOYkVPZUZjQktmR0wyaGxxY3BlR3RmOVNMTElUa1JkdFk5NG9MUHpn?=
 =?utf-8?B?VEU2R25rUDhsZ3lMN1QrSmZHUTd1Zy93ajFZdm4wc2VsU0wvNVhKOEh0OTFy?=
 =?utf-8?B?UndnaHNMRHZzempxd0hmU3hSQUNMZmZqSVFSb1J3d2ZtZDBCeUIyV0Mxbi9Y?=
 =?utf-8?B?M2d6blJBZ2R3eWI0bmFFNWw1SGtWQXJOdDFpWGJFQUxaV0ZGU20wRHptOEhU?=
 =?utf-8?B?eUViKzlJYzJrOGtIdllqYXEvUXNDZWFMWUVya0hZSmF5ZWQ1bGpGUG1PaDZJ?=
 =?utf-8?B?T3JmR2xDWnVKdUk1ZCtYbFFvc283a3Fjc1lvaEJHY2ZjMkZSMnphTGxIQXhI?=
 =?utf-8?B?NkxrQmlLUmJ6SGkwMzZMV2pGQXVXSnc4TmowZVNvaU81L1EycDI0WlJHVVZ1?=
 =?utf-8?B?V2hpRW0zd1pDNWQvMlFWVUhodDI5allWeVdMWkkwUVFGVXJHK1h6Q2ZiMXJD?=
 =?utf-8?B?RjhadzNEYzZVbUp2ODRlT0xTMkFoOTRTNVpocWNxckkwa0RZTFE2akFZOUdQ?=
 =?utf-8?B?ZTRBdEE2ZUI2OTlMVWpQUWtKYU9NM1ZjaFJMU08ybmJJZlBmQ1VmSXNQVmV4?=
 =?utf-8?B?NWpZcU5UaERlVUdOZitpMVJCbkxacUFSam13U0xHTzMvNWp1RDFmWit2NXdx?=
 =?utf-8?B?RkdyQnJwbk5aa2RDM1lwVDZLTW1JM2lkZ0ZmY1g0Wkw4TzhRYm1xRjdnTEZn?=
 =?utf-8?B?c2x5NGFiNG0vSWtFODRsaG1heFB5R1ZneGhsVmFiSWhhQkE5S25WQi9OeVlI?=
 =?utf-8?B?ekRJQ1piRml1R3kycjVFdXhtU0pLcVFsVG1RY0VLQXpZcnZaUzlmbHNNbEhO?=
 =?utf-8?B?Q0pzckJjV2hYdUxlR3VEd2NyNmpwT3R1UEQrUWdYSkdvN21veVNzeFh4S1BN?=
 =?utf-8?B?QnVJSTRoMzBXbjlkNkdMcGVYTmhEL3M3V2p6U2NUdnNCWEdDQW4wcmU0L0c0?=
 =?utf-8?B?WEp5SHlsMkZuYUVaZWpPV0lDZ2JWSWt1K0FUbldycjd0aS9kYWhpd2pOaThV?=
 =?utf-8?B?L3BxZHladUd4ZHkxM0Q4MkdGWFBHWmRZc3NRcDFDd0pacWNiVG5td0NCNnVD?=
 =?utf-8?B?TW51a3B2Z25iNDFic2E4OXNWVDIvUWFSdThyV1VlVlFBaGc2MzZzV3hTNFdJ?=
 =?utf-8?B?QkRyc1R4RnIvZC9LcCtFbVJoSjUyVHBaVFVUK1hqQ2plVEliWHgwQS9hMDEx?=
 =?utf-8?B?K2VPdHFSdVhDbUpEQ0tyTHB2K1ByK3pCZHB4c0N2cHpjaldLcitKZWRFZmRU?=
 =?utf-8?B?TmFudjlldHplbTY1dk8zRmJMMzBlQm5aclNOS0Y4S0VpdThzV0FVTFZQOW84?=
 =?utf-8?B?NGRERTVCWDZLblQyeE1ZcWxVR3ROOVJKZkZFcUhhNGROVENSWEEvQlJ0TEZZ?=
 =?utf-8?B?MUw1dlJXVWoxaW1WVmhOS1NSVmpxQWNQejcweXU1bmpQbFhkY0xUN09lWTdp?=
 =?utf-8?B?Mmx5MWV1Zi9nSkhHYVBGYVZuVXhLZTFxT3B3NUVzdk02dE5DaTNmeVlMdUZL?=
 =?utf-8?B?QjZlc25kS0s1T3IwaDdtNXNreUszNUxGZklRbnBXTE5JaDg2N0VBZ1RadlpP?=
 =?utf-8?B?dHZ0dDhCdW12UnppWERvWWpDQlYwdngxRldKUVRIZnorYUIrQkEzdE9aYXhZ?=
 =?utf-8?B?Tm9QYjZtKzVxQmR5ZHA2WWZHSDRMUzZMd1JGN0cyMENEUXV4NllyVDdERC9q?=
 =?utf-8?B?MXdqOVZmaHJxNzg5L3NaWEg2V1AxZjBjUFNNSi9GbFBBcjdHd2xvT0dvUmZk?=
 =?utf-8?B?QlhwYWppUGNyNWt2ejFaLzU5bERGUDByL0JCdzFTa3dHSHNhcStNOWZQb3pE?=
 =?utf-8?B?RllWenREM1hLN1Y1R1RSMVIrZWJyOU03by9EZ0hzeWoyM0hXTE1FM0RXZjdo?=
 =?utf-8?B?VkZubWRQaFlNQ1lGbEZsT29PU0pSY1FjLzA5UHRNRDhXVUNrclNjNDdmU1dq?=
 =?utf-8?B?MG9GdzJOSm1Nb21oclpFRWhXNGxtbld2OWdZdVhGTTcveUYwUW1IajNqbCs2?=
 =?utf-8?B?UnVhT21CQ1dEaUlDb2w3QXBBRTRLVWhaa25yOUVUVXpGdlU4cm0xa3dpT0NV?=
 =?utf-8?B?UWNMRzJXQ1RtLzE1TnhrZnRvNFNYNkpDNTI4dllHMno5ZXZ1YnBzSmFDcGlH?=
 =?utf-8?B?RkFLNjFYSnJQQVU4S2ZrY3hEWUxFMlFMei9IUFcwRzhFRGZSalhtMG02alY2?=
 =?utf-8?Q?w1ZNqZiUrQoyRafDK3BFh7o1zKfPjWHuXnPzC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E276970808EAB4E9853B5BFA6A384D7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wS/6PgmU4m5DgfPvu539Xnyxb0gKzIcpTtwNl1o09jQ0vpuzPtYtlpQahTZhpiZtsdNlQ+qI+q63YcFFI9SPkOZTP+yRwtBC45BciKZJhvr0JWbLF8L/btE8re3xR5vrL1bYVWMXpbsebLEHNN+jJRiLW589Wo3bWi+Q84lZw6Ka3NKBp0lBECYRVEBulvAtHhJboBu58vV55Hsvd9tsUBvINRBtxb009lIm0XKidnvULSCDcHLGibYkMmRYqLs6ubIt36aNIbsYa8qUdAXklZM8zHi7COfxA0i67DkWLPXiFAJn9J7gkrwoD8pBWHk+qvFiy+fKgZyHbdtI/RqR5w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79eae14a-7183-44a2-9fc5-08de9348e9a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2026 19:24:09.9256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDVVwJyTAOQSWpihH0m4ltTD9LrL6UTmpWusDHUgJj6zQQHHnVF0EqjGlUBcbFHqFoIsVHi+MQppS7SxYLBCCH7T853ff33vuTANlckV3jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6847
X-OriginatorOrg: intel.com

SGkgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCmh0dHBzOi8va2VybmVs
Lmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3Jt
LWRyaXZlcnMteDg2DQpmb3ItbmV4dA0KYXMgb2YgdG9kYXkNCg0KDQpUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0DQo4ZTBhMmZjNjhlYzM2OWYyYjY3NTU5OTRkYTFkMzE4ZDA4OThh
OWQ5Og0KDQogIHBsYXRmb3JtL3g4Ni9pbnRlbC90cG1pOiBVc2UgMzIgYml0IGFsaWduZWQgYWRk
cmVzcyBmb3IgZGVidWdmcyBtZW0NCndyaXRlICgyMDI2LTAzLTMxIDE4OjQ1OjExICswMzAwKQ0K
DQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dp
dGh1Yi5jb20vc3BhbmRydXZhZGEvbGludXgta2VybmVsLmdpdCBpbnRlbC1zc3QNCg0KZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQplZTY5ZDllMzJiZGIwMDQ0Yjk0NDRmMWFlMTIxMDdm
ZjhiNWZmOTVmOg0KDQogIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYxLjI2
IHJlbGVhc2UgKDIwMjYtMDQtMDUNCjExOjU0OjI1IC0wNzAwKQ0KDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpTcmluaXZh
cyBQYW5kcnV2YWRhICgyKToNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxl
Y3Q6IEF2b2lkIGN1cnJlbnQgYmFzZSBmcmVxIGFzDQptYXhpbXVtDQogICAgICB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yNiByZWxlYXNlDQoNClpoYW5nIFJ1aSAoNCk6
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXggY3B1IGV4dGVu
ZGVkIGZhbWlseSBJRA0KZGVjb2RpbmcNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3Q6IEZpeCBzb21lIHByb2dyYW0gcmV0dXJuIHZhbHVlDQogICAgICB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBQcmludCBWZXJzaW9uIGluZm8gd2hlbg0KSW5jb21w
YXRpYmxlIEFQSSB2ZXJzaW9uIGlzIGRldGVjdGVkDQogICAgICB0b29scy9wb3dlci94ODYvaW50
ZWwtc3BlZWQtc2VsZWN0OiBGaXggb3V0cHV0IHdoZW4gcnVubmluZyBvbg0KdW5zdXBwb3J0ZWQg
Q0xYIHBsYXRmb3Jtcw0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0
LWNvbmZpZy5jIHwgNDENCisrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KDQpU
aGFua3MsDQpTcmluaXZhcw0K
