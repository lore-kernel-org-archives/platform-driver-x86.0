Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA8C3C3458;
	Mon,  8 Jun 2026 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927626; cv=fail; b=gT/nb5kErOQbjYh3pyUDG1YY+gZ6NaOEVs8TWG+2sOa6XKTNpP/032VvCTHnZOi+sNwFAuUq8rQtaP/Kfqwzo3o/3V/NwR5PC5KlgBeLP+n5E0EAgwga5ZR91pA+b/2MlpqYOUMcikSNHNrUGQOCgG69olEqsl2rYU+RkW9m1Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927626; c=relaxed/simple;
	bh=wnmJ3omYsYn0s4XFIH79lHuSjokznhA8GHHgz6cBQZc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=njPkYMB4YhAn8Er8f5r2iGqaL3R2U42jh0gRBFPRoNpf4cDQCyn1EBRQBiIj+pHRVj5dsjYmDcmgIGI/WKDJ8Pn2PmwJdVcFZIMxaGIJM41WmIWnmjN2BzyickeA9MHc0ylS40jYGb1pbkfVVh7hfzBx5o3/J65LI1HxPP+Gs+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnEh56o3; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnEh56o3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780927624; x=1812463624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wnmJ3omYsYn0s4XFIH79lHuSjokznhA8GHHgz6cBQZc=;
  b=LnEh56o3+HPkNp6qKHtB4ko2mwML9WNYcKYz1soji+QsZKyNu6ev2HNs
   nFPlRyDLO5wLt+HA6WaH/OwOfaoF1fSD876gmWk2FiQvBdG6MXtQd4iBH
   0yG3nLGXLMYSSbAVanuWOp87z3PXrBywsAeurNlujqoDcXZ/RLjKBHPyO
   GhProrvIwLzKAC7ZxNHC+Mxs27CUd3afDMfxQhGN7H9+matYwy+tVCoSi
   VPEcKThQvsYVFAoXPI0kS3S9+R+fqslpXsebsRbVtvVoV4Hjn2bBsxBsD
   WHpyB2Zy9AT3OkvFt2gmGuS1jE8QDMPzersabgxpeFH4kymaZr19DCRDx
   Q==;
X-CSE-ConnectionGUID: LnfmURa8S6OFl6KKgf8xIQ==
X-CSE-MsgGUID: g0EKpixtQiaEZ7na0c+InA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81709475"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81709475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:05:21 -0700
X-CSE-ConnectionGUID: wEo7cS5EQ0qI3vF/VEaEUQ==
X-CSE-MsgGUID: Irwmm4YNRCSjwwtdyqoO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="245650053"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:05:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 07:05:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 07:05:20 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 07:05:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndzlAxJi+B17BJn1FyB4C2d09fKlHLZsIC3lpHB/CBUOSO4tg0DEp8BZsK/mz9UAVbXPc6u9a7sc1KITxYVZxcHrMLEw53EwP9qjj8490rcLvmLUXVjatjAaUesukUPtusID9FNUm6jMJPDlK223g35aSbnomxUErLnMmXv0cVFUWi5fSetn2xOjA1vpZd/qTYwiqpK+/hPlyEyKBgxaCTD6bBHUJHB9aHQtXRMgrfd+KNNjtek/EqSFBBOYzc98CMs/+LxfCYi1NyNHlyMor7GjoazIK6mCBxKkrqf5RodM8wsU3Qj54VuAXE3E/++UhyCwjazcQd2h/yN1n844Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnmJ3omYsYn0s4XFIH79lHuSjokznhA8GHHgz6cBQZc=;
 b=zPEFiFHIUxOPlUiYJfxjXPgEwLSlI6evFP/ekemu999tw2JmBzPbjxXB7F936HAutGLacGsbriU+XUlHV4sI9GkEUeeMT7AvjM7dkwXCoZXL9C7euRIhjT4gGgma8T1tvaRk5jGF64rVynuqdraKXvYEuzPWy+ml0HOJWCmaxTJNN3lTYv6nSYjFhY3E+s8iJPIbEP3qu0m4Ejg6pNpFy4rR+WNiaADC1g+nDmhA7Xieci0ZeUgtv7lm94S6w0yUuh6VvcQPphghkaaZIg2xFebVBe+JH9mVZduaCvXURe/c0CFR8CQAFH1yx9NBSC+BZQQyby4spVW/lCADVmtP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Mon, 8 Jun 2026
 14:05:17 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:05:17 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: David Box <david.e.box@linux.intel.com>
CC: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
Thread-Topic: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
Thread-Index: AQHc75l1qLeb1QL/KUCmNd1EE/QcOrYtKvAwgAZgUwCAATSBAA==
Date: Mon, 8 Jun 2026 14:05:17 +0000
Message-ID: <IA1PR11MB64182D9946206FC3E4A430C4C11C2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260529183150.129744-1-david.e.box@linux.intel.com>
 <IA1PR11MB64184FD919A96888F580730CC1132@IA1PR11MB6418.namprd11.prod.outlook.com>
 <mvyzq3kislmjd2hd2nhdyphvnpz7ap5tu76sujaxprxp5rhnhx@34qt4rgvhe6n>
In-Reply-To: <mvyzq3kislmjd2hd2nhdyphvnpz7ap5tu76sujaxprxp5rhnhx@34qt4rgvhe6n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CO1PR11MB4931:EE_
x-ms-office365-filtering-correlation-id: b7dcaac7-c19d-43da-ea9f-08dec566f81b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|6133799003|38070700021|4143699003|11063799006|56012099006|3023799007;
x-microsoft-antispam-message-info: zQivq+NN9Q/xI9xjCT5LXTRt8TGuUiEk08leFgObYFYR/jbLStx3ixtTqZ+Vx96OmdQHZyZlg+XwdL5dFUexKGOdZRS7yX3YclaAtuz9wFFRYg5GjKFiJRb1UBWEo2/t0YK7acxFeAlyeNsS7dyko766k8ocJsfCGrWgTRWIMJ+NWUNVthTkNobEu/tuLWA4JdlDgcUlZqK2smsn97Cy6HFzTNdxUEkg5x7pediVS7CjDzj1fAE862gkQseOSbxI/26YUcgrcljien0pcw+JZcPoF63U33M3uhMgozhByNEZU0Wqn3qcse2etuCN7fRueHe3Ol5gUJw9pwF5d2pyxhPLVhpHqczsaJRLKCDmi71W45IgY28cHNYdwUf14SE7XFxcnoYfU+fyXUgifa0iMw3Vp8JLvIP6Deg3wSbSxSoNUSQUfiZt3TCD0f9wtvvx2tC3pjbf3PSGyLHSwwJdKhUPgAhW/lLm1z1N1SAlBagHWjeK0jj+sd//dive5hv+oErKHHCZ8sSuTmexR8pJowNG3d9ZUxMNPT4SWXpRcBL/MlFg/EjD/0v9su1YyplOvRiAfPjCA4dS/YV1N+AzSGdP4f3ym8g0NeBE2v1tr3LtDLC1WVJCe/9Ua79r1RtLliogiDb7Rr80qxTsESiEAmj6cVtQZKR6TNRWlB3+yt2ukT0784J99CMCFUrNHwbT9kYKZ9njh/GKf+HbM74S45LWxvOtltECIUNCNM4vEHpI3K+TJm3lvdo2jct3Icdf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(38070700021)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjBOVjE5c0YvTTlxVm5kSUpJYklBbDJHQ1BKMlF2QjdJNFowOWo1MW5CallZ?=
 =?utf-8?B?TzZ0STJyeUtDYXJ6emw2OFRpd1J5R0NHOXFkYng1cHg5ak44Y1RIcjVEQld1?=
 =?utf-8?B?MkswQ3dYdTJ2L3R0ZWdkMEp1UU9HNndkRFd2YlVVRGRkdDVqTlV1RHcrTUh4?=
 =?utf-8?B?QVJLSmhZUzVEVkhiV3hVWGRJYStGallvdFhqRlRmUWtLbkRWemp1K3I5cUdr?=
 =?utf-8?B?L0hDR3d6akNqdDVGeWU3aElFUXhuYWViQ1lpUUhaUjFPU1J5elArM2cvc1Jt?=
 =?utf-8?B?YU1MS09WbkVicHZpcGpnVTIvVTRhY0RwWUZGMHBaV1FLcVFtejlMQ1pTV3hT?=
 =?utf-8?B?UXFzRmdUR21jREE0aTFTRmNyKzBCdFkyTVhwYnplVEZvZUxta3RHL3VOMHVs?=
 =?utf-8?B?d2szRUhvUFB4Sy94bnJJbXZEYm1MNUFpaGZnT25RNEE3eU5VVG1QdElERkpL?=
 =?utf-8?B?cWxsNytkZGNJZjgzY2c1VzdNeFRNR0hKdVBIZzhVY1hrWVVTSlE0OWpDc0Vo?=
 =?utf-8?B?RVllUHpGL2NVLzVIOUlQMjV2OVBiSDRpVnV1SHBvZXorc05STW54RzJnNU9i?=
 =?utf-8?B?eHJ6Z0pWYTl1Zy9iWU5jQW5LUkZsejhUK2t6WVlaR3owWGpDaTZBcmJCWVlT?=
 =?utf-8?B?UmgxK2FEdkx5a1JGQmNUdzNqWlNQWWRWT0F6WTEwRWI5VmMybHQ0SjNFQlRF?=
 =?utf-8?B?dXRnQWtuY2hvRHZFNUIxSFFBUjI4aGhBd01KTUNlYk9Yamw0b24ycmhZWWgw?=
 =?utf-8?B?eWMwY2FMY21qR3VYSU5FOTdWTURxVE1UcUdERHo1MlhIYWhaSTIzc0d3SVpi?=
 =?utf-8?B?aWo5OW9zNkJzdWRYRzZWd1d1V1VVQ1l3NWxhUC9MelNQUFBKOStsUldzajBv?=
 =?utf-8?B?cG9xOEZmSjAzeVU3SVowMnU1YXk3OU5tWEswWlcyT2JzT0F0NGpneG1ZUEdi?=
 =?utf-8?B?MHdnRXJCazVHYm94QkdoSDBPNzFoci9pWUYwRWE1WEg3R1lsQnBRZEMxRjBX?=
 =?utf-8?B?a1dsTTQzc2xnZFZNRy92WVU5ZHJDcmMrSE9UanlHaFVPM0piSVNUMTJ5TC9w?=
 =?utf-8?B?ZGl5MHZtY1dSWUtoSUZmL1NwcVhKMmRxZG5tdFVzL01Mb05UT29kYUhiQTVL?=
 =?utf-8?B?QXhtdGFBRGcxNVJUdkc2OXpRWkM4QTRwWjR4cCtSeXRkcVhiTm1zbW1zSmF3?=
 =?utf-8?B?RXRIeWxyWXkrSHFMK3lFTmVLVWpOeS9RQmNCWlBCSEFpdFNjMGhmTFpBYzB4?=
 =?utf-8?B?OTdVTlBBNzFEUDh4NTQzYU9NNmRBa0FFSXJsOTVBTm05dFN5MkYrS1JEdDVK?=
 =?utf-8?B?L2hLMzYxSFduNlZDd3M0Z0szMWlROEZ2U3I0cERlTGtGVTZLQ2pVWjBTbERN?=
 =?utf-8?B?RFBLYW5vVkJmVU13cy9BdzcvYlJQTVdjdWZ6cURVTmdUZCthdEhPNTBNY2Vj?=
 =?utf-8?B?d0EzbFMvaHVjR2I0cmF4MkM3eFM4cTZEOWRTSkp4RWtESWVsNWhQckI3bG5M?=
 =?utf-8?B?eUNyYWVjS0szYS83bE5wUy9IWEFuY0R4VWR2RXBBU1R3dG5wR0g1NmttaUxX?=
 =?utf-8?B?d05vc1FxVGduK2J3OUYzME1Qa0tTcXdJcDA1RVdXZjJKVE5yWGlaY2hDWU8r?=
 =?utf-8?B?dXBCSFp1SzVrU29GMmdSSnRrM08rVjk3ZmdsTEczZzBqZW5nOHdKTHpINkRs?=
 =?utf-8?B?a3RjVDFGaXBFUmh3QjNHQU1EVFlRbDNYSEZXZHdDWmJQOEp6d3JEYXp5bkpq?=
 =?utf-8?B?V2s1VUVHeDQ3L2d5SFFKL3lkT1Y0OHMvd2xjcU41MnNIR3haNDJjSXNneWMz?=
 =?utf-8?B?S0VvYjNGZTgzdCszRnpHOCtZWWFiZmNudmo2VnJuN2duRTRpRjROejRjZnVq?=
 =?utf-8?B?a085NVdrRlBsMXdEOEtOVmg1eFlqOGhGWDVmeXBjZXhQaHJPRXhuNGhXdWFN?=
 =?utf-8?B?RDUwZE0yOEhBc2s1TVRGejFaNTN1NlI5SS9ETzIrcEZWTXV1UEZQejBHRGVR?=
 =?utf-8?B?V2MxUnBsek5lZ3ZXOVI2OHo4WlVGRDZrZTNwYkJ0dG1MbERxQ2djVWdScVJo?=
 =?utf-8?B?ZFFvWkRWVlExQWdLUC9BampXSXdHK1ZzN21uWEpxcHhvaUxQbG85a2FINUZD?=
 =?utf-8?B?cFVLZ1l6NVdJQkFXbTg0RWQ5WFBJQ2dUQm5NMmtYVDViLzFlWWc2WmhvMWJh?=
 =?utf-8?B?c2x2VkVtVitranRnckFLK3NSWi9VUUdMWW9UV0l4RzRFVzdjMDJaVHNRQ1l2?=
 =?utf-8?B?b0Y1UVFYUXFGTnhNVCt2OCtncEVWVVRteUhCTUp1a0ZmWENnNjFBTG01NUFG?=
 =?utf-8?B?WUhlWWFNR0g0Y1BFRVlyQXVtNFVhejh2b3NyQ3hyaVdPUnJ6ZGJudz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iEGgmYYrAGuyaVSG1fnCCqWPI+rJvMnI3bbBsVQEF1t2RYn1+wHjr5rKJlF6+6G09R6/9KAxWNYHE6NDWp76/lYlsoPIboC+5WK1xKhfIlV+gN3WSAH7Jj9D9xDQvIMVE2ljaUGLZuoXGiQkgA/O4BQAu+5PiTaWh8lSsaTBoYs25nMtQCL55R+yQzkjUURapNIswAnvoNWP4ve9Vr5vfn6W9sekqNA0rw+KQ6H4eoYeiOiL3OMIMo9c6Ul095iFLMp+xVOYpVjruI6NpSqcfXysEjWfGWMeXoxhOijhxI4ZsZe0/24xBDp1p4/0Y0mTMeFjjfezTj+buLHy9GRzeg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7dcaac7-c19d-43da-ea9f-08dec566f81b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 14:05:17.2435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKVvw9Vsq8FI69eXcN+7U8dGeMXtTLhkeO0Ru67G9ndBAGWmD4TIomtcKyr2y/CTEZ3QpKO4t53+H/UV+YVCWDOO81iuSlDAv3ggnew0zMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRGF2aWQgQm94IDxkYXZpZC5lLmJv
eEBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogU3VuZGF5LCBKdW5lIDcsIDIwMjYgMzozOSBQTQ0K
PlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj5DYzogaWxw
by5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3DQo+PG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb207IGludGVsLQ0K
PnhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
cGxhdGZvcm0tZHJpdmVyLQ0KPng4NkB2Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BB
VENIXSBwbGF0Zm9ybS94ODYvaW50ZWwvdnNlYzogUmVzdG9yZSBCQVIgZmFsbGJhY2sgZm9yIGhl
YWRlcg0KPndhbGsNCj4NCj5PbiBXZWQsIEp1biAwMywgMjAyNiBhdCAwNjozMjozMlBNICswMDAw
LCBSdWhsLCBNaWNoYWVsIEogd3JvdGU6DQo+PiA+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4+ID5Gcm9tOiBEYXZpZCBFLiBCb3ggPGRhdmlkLmUuYm94QGxpbnV4LmludGVsLmNvbT4NCj4+
ID5TZW50OiBGcmlkYXksIE1heSAyOSwgMjAyNiAyOjMyIFBNDQo+PiA+VG86IGlscG8uamFydmlu
ZW5AbGludXguaW50ZWwuY29tOyBSdWhsLCBNaWNoYWVsIEoNCj48bWljaGFlbC5qLnJ1aGxAaW50
ZWwuY29tPjsNCj4+ID5kYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb20NCj4+ID5DYzogQnJvc3Qs
IE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsNCj4+ID50aG9tYXMuaGVsbHN0cm9t
QGxpbnV4LmludGVsLmNvbTsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0N
Cj4+ID5rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2Vy
bmVsLm9yZw0KPj4gPlN1YmplY3Q6IFtQQVRDSF0gcGxhdGZvcm0veDg2L2ludGVsL3ZzZWM6IFJl
c3RvcmUgQkFSIGZhbGxiYWNrIGZvciBoZWFkZXINCj53YWxrDQo+PiA+DQo+PiA+VGhlIGJhc2Vf
YWRkciByZWZhY3RvciBjaGFuZ2VkIGludGVsX3ZzZWNfd2Fsa19oZWFkZXIoKSB0byBwYXNzDQo+
PiA+aW5mby0+YmFzZV9hZGRyIGFzIHRoZSBkaXNjb3ZlcnktdGFibGUgYmFzZSBhZGRyZXNzLiBG
b3IgdGhlIFBDSSBWU0VDDQo+PiA+ZHJpdmVyIHRoaXMgaW5mbyBjb21lcyBmcm9tIGRyaXZlcl9k
YXRhLCBidXQgZXhwb3J0ZWQgY2FsbGVycyBtYXkgcHJvdmlkZQ0KPj4gPnRoZWlyIG93biBzdGF0
aWMgaGVhZGVycyBhbmQgbGVhdmUgYmFzZV9hZGRyIHVuc2V0Lg0KPj4gPg0KPj4gPkZvciB4ZSwg
dGhpcyBtYWRlIHRoZSBkaXNjb3ZlcnktdGFibGUgYmFzZSBhZGRyZXNzIHplcm8gaW5zdGVhZCBv
ZiB0aGUgQkFSDQo+PiA+c2VsZWN0ZWQgYnkgaGVhZGVyLT50YmlyLCBwcmV2ZW50aW5nIFBNVCBl
bmRwb2ludHMgZnJvbSBiZWluZyBjcmVhdGVkLg0KPj4gPg0KPj4gPlJlc3RvcmUgdGhlIHByZXZp
b3VzIGJlaGF2aW9yIGZvciB0aGUgaGVhZGVyLXdhbGsgcGF0aCBieSBmYWxsaW5nIGJhY2sgdG8N
Cj4+ID5wY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgaGVhZGVyLT50YmlyKSB3aGVuIGJhc2VfYWRk
ciBpcyBub3Qgc3BlY2lmaWVkLg0KPj4gPktlZXAgZXhwbGljaXQgYmFzZV9hZGRyIG92ZXJyaWRl
IGJlaGF2aW9yIHVuY2hhbmdlZC4NCj4+ID4NCj4+ID5UaGlzIHByZXNlcnZlcyB0aGUgcmVmYWN0
b3Igc3RydWN0dXJlIHdoaWxlIGZpeGluZyB0aGUgZnVuY3Rpb25hbA0KPj4gPnJlZ3Jlc3Npb24g
aW4gbWFudWFsLWhlYWRlciB1c2Vycy4NCj4+ID4NCj4+ID5GaXhlczogOTA0YjMzM2ZjNTFjICgi
cGxhdGZvcm0veDg2L2ludGVsL3ZzZWM6IFJlZmFjdG9yIGJhc2VfYWRkcg0KPmhhbmRsaW5nIikN
Cj4+ID5Bc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1zb25uZXQtNC02DQo+PiA+U2lnbmVkLW9m
Zi1ieTogRGF2aWQgRS4gQm94IDxkYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb20+DQo+PiA+LS0t
DQo+PiA+IGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3ZzZWMuYyB8IDE3ICsrKysrKysrKysr
KysrKystDQo+PiA+IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+PiA+DQo+PiA+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3Zz
ZWMuYw0KPj4gPmIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdnNlYy5jDQo+PiA+aW5kZXgg
MTY1NzgzNGZkMjc1Li4zYzZkOGExOTI4YzAgMTAwNjQ0DQo+PiA+LS0tIGEvZHJpdmVycy9wbGF0
Zm9ybS94ODYvaW50ZWwvdnNlYy5jDQo+PiA+KysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50
ZWwvdnNlYy5jDQo+PiA+QEAgLTQ4MiwxMCArNDgyLDI1IEBAIHN0YXRpYyBpbnQgaW50ZWxfdnNl
Y193YWxrX2hlYWRlcihzdHJ1Y3QgZGV2aWNlDQo+PiA+KmRldiwNCj4+ID4gCQkJCSAgY29uc3Qg
c3RydWN0IGludGVsX3ZzZWNfcGxhdGZvcm1faW5mbyAqaW5mbykNCj4+ID4gew0KPj4gPiAJc3Ry
dWN0IGludGVsX3ZzZWNfaGVhZGVyICoqaGVhZGVyID0gaW5mby0+aGVhZGVyczsNCj4+ID4rCXU2
NCBiYXNlX2FkZHI7DQo+PiA+IAlpbnQgcmV0Ow0KPj4gPg0KPj4gPiAJZm9yICggOyAqaGVhZGVy
OyBoZWFkZXIrKykgew0KPj4gPi0JCXJldCA9IGludGVsX3ZzZWNfcmVnaXN0ZXJfZGV2aWNlKGRl
diwgKmhlYWRlciwgaW5mbywgaW5mby0NCj4+YmFzZV9hZGRyKTsNCj4+ID4rCQlpZiAoaW5mby0+
YmFzZV9hZGRyKSB7DQo+PiA+KwkJCWJhc2VfYWRkciA9IGluZm8tPmJhc2VfYWRkcjsNCj4+ID4r
CQl9IGVsc2Ugew0KPj4gPisJCQlzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4+ID4rDQo+PiA+KwkJ
CWlmICghZGV2X2lzX3BjaShkZXYpKSB7DQo+PiA+KwkJCQlkZXZfZXJyKGRldiwgIm5vbi1QQ0kg
ZGV2aWNlIHdpdGhvdXQgYSBiYXNlDQo+YWRkcmVzc1xuIik7DQo+PiA+KwkJCQlyZXR1cm4gLUVJ
TlZBTDsNCj4+ID4rCQkJfQ0KPj4gPisNCj4+ID4rCQkJcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsN
Cj4+ID4rCQkJYmFzZV9hZGRyID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsICgqaGVhZGVyKS0+
dGJpcik7DQo+Pg0KPj4gQWx0ZXJuYXRlOg0KPj4NCj4+IGlmICghaW5mby0+YmFzZV9hZGRyKSB7
DQo+PiAJc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+Pg0KPj4gCWlmICghZGV2X2lzX3BjaShkZXYp
KSB7DQo+PiAJCWRldl9lcnIoZGV2LCAibm9uLVBDSSBkZXZpY2Ugd2l0aG91dCBhIGJhc2UgYWRk
cmVzc1xuIik7DQo+PiAJCXJldHVybiAtRUlOVkFMOw0KPj4gCX0NCj4+DQo+PiAJcGRldiA9IHRv
X3BjaV9kZXYoZGV2KTsNCj4+IAlpbmZvLT5iYXNlX2FkZHIgPSBwY2lfcmVzb3VyY2Vfc3RhcnQo
cGRldiwgKCpoZWFkZXIpLT50YmlyKTt9DQo+PiB9DQo+DQo+VGhhbmtzLiBJJ2xsIGRvIHRoaXMg
aW4gdGhlIG5leHQgcGF0Y2guDQoNCkxvb2tpbmcgYXQgb25lIG9mIHlvdXIgZm9sbG93LW9uIHBh
dGNoZXMsIEkgc2VlIHRoYXQgeW91IGFyZSBzZXR0aW5nIHRoZSBpbmZvIHRvIGNvbnN0Li4uDQoN
ClNvIHNldHRpbmcgdGhlIGJhc2VfYWRkciBoZXJlLCBtaWdodCBub3QgYmUgImNvcnJlY3QiPw0K
DQpNDQoNCj4+DQo+PiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIHJlcXVpcmUgdGhlIGNhbGxlciB0
byBmaWxsIHRoaXMgaW4/DQo+Pg0KPj4gaS5lLiBpZiAoIWluZm8tPmJhc2VfYWRkcikgcmV0dXJu
IEVJTlZBTD8NCj4+DQo+PiBDaGFuZ2Ugb2YgYmVoYXZpb3IsIGJ1dCBmb3JjaW5nIHRoZSBjYWxs
ZXIgdG8gcHJvdmlkZSB0aGUgcmlnaHQgaW5mbyBzZWVtcw0KPnJlYXNvbmFibGUuDQo+DQo+QWdy
ZWVkLiBCdXQgdGhhdCB3b3VsZCBiZSBzZXBhcmF0ZSBmcm9tIHRoaXMgZml4dXAgcGF0Y2guDQo+
DQo+Pg0KPj4gRWl0aGVyIHdheSwgdGhpcyBsb29rcyByZWFzb25hYmxlIHRvIG1lLg0KPj4NCj4+
IFJldmlld2VkLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4N
Cj4NCj5UaGFua3MNCj4NCj5EYXZpZA0KPg0KPj4NCj4+IE0NCj4+DQo+PiA+KwkJfQ0KPj4gPisN
Cj4+ID4rCQlyZXQgPSBpbnRlbF92c2VjX3JlZ2lzdGVyX2RldmljZShkZXYsICpoZWFkZXIsIGlu
Zm8sIGJhc2VfYWRkcik7DQo+PiA+IAkJaWYgKHJldCkNCj4+ID4gCQkJcmV0dXJuIHJldDsNCj4+
ID4gCX0NCj4+ID4NCj4+ID5iYXNlLWNvbW1pdDogYTE2N2FlOGVhY2U1MmRkNmM4MDQzOGI3N2Q5
MjQ1MGZlMTJjZDRiZQ0KPj4gPi0tDQo+PiA+Mi40My4wDQo+Pg0K
