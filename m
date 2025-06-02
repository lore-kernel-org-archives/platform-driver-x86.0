Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8201224AEE
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Jun 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876599; cv=fail; b=AyxLuzFXgwwxb3jA9CXRwuIGde3QN+Ulb9lsu+f+BMepe27bDk0a1qIk/JPSXFufvmYWcD7TNhqNTCy5ZA5rw8yM/e+08TGX/yP5/c+t2+Y04hkx3W1k56rFzCWeuuuKJSIURtIsQ3tSCoN/gGbNfBEKASTKN3pIKZZCTt9tOIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876599; c=relaxed/simple;
	bh=vs7/MzpEqWJEwZgVDwc8LyQJWYhxYcUZQ7gCQY0SX94=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EeZmSf0bKDRMybx+hL860UAj2+8BYxUXUrujpVypsVfkgr0+Xx23xDoyhBtdPNged7MHhUcF2q3n1jZBG/9eREhDZs9znl8bb9iOfwxkNxZAcZs+1O7DCLCFYi9jeFAGii1CfJwrs3iT6DY5mjoT1xw46+HkiyiMnDQq/2MClfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdyjA7Sz; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdyjA7Sz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748876598; x=1780412598;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vs7/MzpEqWJEwZgVDwc8LyQJWYhxYcUZQ7gCQY0SX94=;
  b=cdyjA7SzDjqUGhgVu+x0HWcXJuwcfl/Wpj9mGIAtA9neKVGKIbbWlImw
   HhWaG0QXciyJY3Imv0BVd5mOLO5XrXmRKQSAB6hrCwmUK0Wpo5IsyIyUu
   RoVmDMXq5HtB7UOfqMV5TSGqQpVmf69Lq61KCL5L/SyA3G/Qf4POj5/hk
   0VYo1MJi3tJuxPtgHpSrwwrHpEauW38mOnU4a6wZnj9kCN32ELj0LE4DG
   1o8RMrj3icEHBNsVlAbHRS9AnnKfrAcQWW7JK+6l7FZc256e/AwQ+vnvi
   4Jd2dVtZB5agwGmQgGSSu1ThYND0R7h4y8aXLODlpC+ByBGsjFvOOaGV3
   w==;
X-CSE-ConnectionGUID: AXwQSBibRc+fEZdRiQQEag==
X-CSE-MsgGUID: il3OyhK4Sfis1z34W2RXeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54689086"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="54689086"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:03:17 -0700
X-CSE-ConnectionGUID: 6Fv3pH43R+aULfFyqjb6VA==
X-CSE-MsgGUID: 7CTF66blRxajWVA30N90xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="144520350"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:03:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 08:03:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 08:03:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.79) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 08:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQZGH7MSancwTN24WxJQ5LcZlKI2CK9IiVIcjBbMKOKqIKAwRgq4580ZQJBd3F7+dphpcSO2PrKpVCH26J04UAtJifcRuIKFk+7Mcv/D/HXGQmdx11wMZatS0iLl6iolFaxmi0DYFiyEeOx+/m2QOuyl67cFyK2RgzXMH1LbNN6znH1yDXmvN2JxKTmJT/7OGX/Spwvj5AR3KYjwfPckDplYGqPnoA6gUg1FVSe6tk5aQIvLMSrxzhXbscN1VGavG0xXm5tF3lM8qwSskVoA3orLB6xZ1MhNtbEaEwdTk7o1eyp8T3BWS80bwEbs49LuVNB1+Mo3sOKcOaJ7Wov5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyYRdv+c4GHa7mwiu7zhps1tl0Bzl8QfcE3itKRxkXM=;
 b=ArLPpbzucohU7X05qUyK/IbdWvU3b9C3XSk8GkNG81nLuJJDbLzJHWi4GEvTD9XX1FyRlyQ8ZPcbRo2s7QE9P6Cbh4eJrn15gOcovIBXx8dDNkPj6QcpyPkWBtT2RyOCQMUl4aWGjr6XITnGcUaahaoWq/iHDPyEYMcjvXaU9iXFt8+cdLlg8y4gAsaKgAQ1Admj5iu1eqYgCANhg2neJrK8xKrTdxGCAXuOg+tTHsmhmXkRD41rFMzMvO7MREDUzjpXRl6KGr0swiF/5Q3jW3h97Mw/IBWxuHi6qF2LNt/HP6E+NTYLR7HLQ69RMG9GHYamOX4qtZNxSG+svEdjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 15:02:45 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 15:02:44 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>
Subject: RE: [PATCH 05/10] platform/x86/intel/pmt: crashlog binary file
 endpoint
Thread-Topic: [PATCH 05/10] platform/x86/intel/pmt: crashlog binary file
 endpoint
Thread-Index: AQHb0aJEWo7iv6vWpEaQc5IipMYurrPsOKiAgAPCpcA=
Date: Mon, 2 Jun 2025 15:02:44 +0000
Message-ID: <IA1PR11MB64180283EB92757B01DA056EC162A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <20250530203356.190234-5-michael.j.ruhl@intel.com>
 <3d2a4585-92c7-f2b4-5f48-20e6abd3255d@linux.intel.com>
In-Reply-To: <3d2a4585-92c7-f2b4-5f48-20e6abd3255d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ2PR11MB8516:EE_
x-ms-office365-filtering-correlation-id: a34a1afc-e790-4d64-1896-08dda1e68777
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?QYU6Xutkdp7DR21nHNsIml4Etwvst3h9So/KGZXhso30OArie6pW9RqdWP?=
 =?iso-8859-1?Q?DUULJt7+3obOBx85XBXnhTOZrPGeCd4fynxA44EPFl7NgOBifBoRRaLPj1?=
 =?iso-8859-1?Q?3K1qUTb70QTcMCJMTlwczTfD3Pwxt4YqMn20LHWz0fQMjYJvRbPrwwTNaE?=
 =?iso-8859-1?Q?o4mFx9jQppb5kff+wn/tRHxEQEr6fAcISYj3JST8z5l6Rqzq0KvW4A1nRB?=
 =?iso-8859-1?Q?yUBnvbTEg6vSyoJ3IHyntFsn7Bs/qyftP9ebejAUW5LWt1Vc0wg1napjtr?=
 =?iso-8859-1?Q?fKwNI08kfzUb5tJEqeDhbbMI7kiu1PPpJVU3pLziULgtw3j9B5OEC0xzvS?=
 =?iso-8859-1?Q?Fiv5uvQzE8ope8eDAm1TzEkM0WXiF5hG3zTYoMiNnIpnec1TVzVgCah0Ef?=
 =?iso-8859-1?Q?taautlEahuOElRA7ZxmUpUWIJB+RkYxDLp7N37tHBxi+sF80uJizRjjpFl?=
 =?iso-8859-1?Q?WnvOyRtNq3dfW+x57crL1b/a0sfcJKe+/DwDrDtc/EnPCLgkV9cgQq9yNM?=
 =?iso-8859-1?Q?nOajEDlxVrWqNBBhaCNRgSAy3/S7D2uGMNtjFqXtgaakZqqGWiC0IsfY61?=
 =?iso-8859-1?Q?fDQQUj4WtkFBQ5xlWTHxtjQjPhzKN3v0sDIOhT6icxAcJjhAc00YgplaSR?=
 =?iso-8859-1?Q?MlBneA3ypx3pqKwxqbTFpVXrEGxrEu7NXmXXESJ1kwGg6vZN5icykMyNCD?=
 =?iso-8859-1?Q?F4cHVkIebtb1wnic7iGgX8JjoObE/9xb1bthQUE4Pkjxf+YgPD+8V/7tk7?=
 =?iso-8859-1?Q?02Rkfel/AsdVSKXFWvyxGjE/tbg+cVIYyUhh1ybfy+nA4GHVQ9CABhV2JA?=
 =?iso-8859-1?Q?Fdw7MHOBlIt5X18/sO4c4rLo+yWij9KBLPw5h3SRFyEVa9RrvtRxYe6I6L?=
 =?iso-8859-1?Q?QMWVzcOftm8O4Qk0N5OA8EPBUwxNl5rM/uM/OghIFp5CyUdL8dSSkHO3BT?=
 =?iso-8859-1?Q?y60ggfXI7zhOTVnum3ChlrH6wsOon6asZUWw30TbOgysjdDfF2AAC6VqCG?=
 =?iso-8859-1?Q?JwkQGWfAf+AI3HPFlMdcW0v1kMOpQ3TB3FnJWW9msag8m8onvi1eHSuOeM?=
 =?iso-8859-1?Q?vYTIm4dDBXI2lhNaaRjrMur9UtU6NMQXy3NbJhOc4br1rV+kXNy9+1teSx?=
 =?iso-8859-1?Q?9fekaQuG8ThOM94VKLQ039xeAkMBayK05Sk1txpQRXsX0sDvOOMaflDWTP?=
 =?iso-8859-1?Q?nmAEPB7aOKGxXq980yqmmn6YPjlNlQgaueLnxehL2T5WwWI+QCOua4dFYU?=
 =?iso-8859-1?Q?+Ewte7BnrJxQShKGCiWXKSy/vI7HYuQev2L7+rJ2XV1fcrN62f1T5DFB/k?=
 =?iso-8859-1?Q?sJkid9N6GOwFGsOZrjAg6B1Qft+5uRp+CwgwR9l5s0ZYwyPWqs/lo0Ceja?=
 =?iso-8859-1?Q?pQZ04Q4/WuuxQm4Dv5xFoqWUq4ndCDsRA+5R8+4A/y6aVBTLGFbInu8T+0?=
 =?iso-8859-1?Q?u2FWK1Kj3Y4BZdCThZ0asPVURTZduuCnCZvmJyJ7DXUSdTDLu+Z1ncom1A?=
 =?iso-8859-1?Q?2kcrmDKQ9vOt4uWsKLqAHzj2ihIoj0hWU9EDKMQVstO53C4ep3OeM2KzNt?=
 =?iso-8859-1?Q?jOCKO70=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?S7ZT6oh+IcQM+O0K1sMXKKnnUYr/PST7TL8wcyCEtd4jja8nZtw5jYkizo?=
 =?iso-8859-1?Q?wA8UZj6IcZz0GdmuGsBzNQ/foHx7IpCq7EgtqkOlcvdjY503YT+Reiw1Ip?=
 =?iso-8859-1?Q?0Dd2bHG8JshOwPnFxqUR96C+i8v/hhpwSPBFPLULaBrjzoayQgo3+34RVB?=
 =?iso-8859-1?Q?9ixdgeteWkAyOSfC3Yzqxw0DhPyZnMZAAT8GEOHZvl7HLgV0llzY3w5Tcz?=
 =?iso-8859-1?Q?D3ohpu7nAxBRc9Pnk6Jmb60wcRL3QGAy3RIMg6cLPtYlGSpMpiYp82zgG7?=
 =?iso-8859-1?Q?32mwwsO/nmJjWCRVae8P1WXmDy4u5i0+P3oFuFUsXq1jlkVeAtDa7/vk5H?=
 =?iso-8859-1?Q?FJPCEedg3g1ak1ckf3xj5OAOO0nxFt+6EHmFZ5u9lcV2cjg4CR4gKEW9uc?=
 =?iso-8859-1?Q?O85zSBGolhFPcsD0vYOaXAjEgoJiw+uwVL9GwrVO5gE/9gQmMSyK18dPjv?=
 =?iso-8859-1?Q?HwN2j+mMJ1fA34t2zcILNErcv0hcptG77C+wNm/Z7MbC6LvXjdSt6JMkDG?=
 =?iso-8859-1?Q?Wy5HjLTYu3vmAFkMjqc7aKGlfkRvjXI3hMC5oBzvRlArzM7Lh9dHowJHCp?=
 =?iso-8859-1?Q?D+M71tIfKxGFI8GmKuPd2P9E/6ckgZHvFqkUtchN82dzY7o5bXBeFOGvHA?=
 =?iso-8859-1?Q?yqqZoonE30/ljg2LH3QjX88DHR2mUZM1IuA7JSU4GTEFzte1z1ZurmuUms?=
 =?iso-8859-1?Q?ch1xCjpSfLUTw0S/v1GaoOp8qZGSPUsKGBAyBMEDJVms4w2Adhjop2RHDw?=
 =?iso-8859-1?Q?vXlQxlxelZztLEcHPdqK6AeXNhJAT1D6gvSTuvSIizAjS2I28ZhCQ+KR+k?=
 =?iso-8859-1?Q?Zd7MF9z2IdBQTCyrP3+RWlXpawDtlgpxuW0wx69PahSYFIfse5w6ROjiYr?=
 =?iso-8859-1?Q?hDrOjkLP1qpsJFu6o83/1xgz08wM6iB8rRxxxU6SoXy7FXY/q8WyrbiBOJ?=
 =?iso-8859-1?Q?4FuZqt7rHEOwd+iLLAUv2hzqlA/QqreAKO+CCs15cYruaNTke4qA+EN5iu?=
 =?iso-8859-1?Q?yOOd3FOby4kTTl1Zo7ucKRatolsXyXMDr1HziNqqeSIeQ+1FILOacSrGkG?=
 =?iso-8859-1?Q?wmG72g1cXBCaND4fUnxQUWEcZWKbKO0GEVXgwZd+eG7/f8W+gxSwckpCiR?=
 =?iso-8859-1?Q?Le6YbBaZw+MAs/lIZuS+eplLVQhyh5gdUYzJieZlgnYwAoEsJKyq5wmz3a?=
 =?iso-8859-1?Q?1cfxeattgoitroOK91F89d7n/U067XSXOPSFWnER7jlcuiDUR/TB0nwbHX?=
 =?iso-8859-1?Q?xSLkwsJJv5q0/iYHOAFcKF/1IWlspkJhsuAgHKWEwQzxJ+kq70whi9KC4W?=
 =?iso-8859-1?Q?STFLi9CrAyTTdz176fuFPrZEfh6s7mOJysdpolIM5vEOmJLWH44J/Y+q1O?=
 =?iso-8859-1?Q?lNASuo+OSwYCidOX7HUNaW0mYxi3g6rgx1Eefw3rwSfjjvWtGBCp3iLR9e?=
 =?iso-8859-1?Q?O1lmSe/U3eMUJhsZm8dHRDze2z2jlETEAxq8AxqW3T7sx50/eYafO0Z70X?=
 =?iso-8859-1?Q?6GibyfBBcLeQTvQ7AClKoCyaUaSA4GUZhwRx+BQDQcMxd3EurhMfJoZ/Mg?=
 =?iso-8859-1?Q?uvtz5oVYAMlay4yULDjAGau7WCJG/hR7A0agARSg4Rk/BEdtC/o8rXfUJq?=
 =?iso-8859-1?Q?CSSXyJaFMxVyOE0I3+fx/HKc8j1VOf9geK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34a1afc-e790-4d64-1896-08dda1e68777
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 15:02:44.3176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cauFn6khTCc1xyhhc29guY1YYMbMzHu5wLogREeHs5C3LumhRaxWInUil0S2guIL6lHhe8n1jJmbfRCXHlO/IxRQB4iRrqjZiVyvhkTlUVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Saturday, May 31, 2025 1:37 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hdegoede@redhat.com>; De Marchi, Lucas
><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Subject: Re: [PATCH 05/10] platform/x86/intel/pmt: crashlog binary file
>endpoint
>
>On Fri, 30 May 2025, Michael J. Ruhl wrote:
>
>> Usage of the intel_pmt_read() for binary sysfs, requires an
>> allocated endpoint struct. The crashlog driver does not
>> allocate the endpoint.
>>
>> Without the ep, the crashlog usage causes the following NULL
>> pointer exception:
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000000
>> Oops: Oops: 0000 [#1] SMP NOPTI
>> RIP: 0010:intel_pmt_read+0x3b/0x70 [pmt_class]
>> Code:
>> Call Trace:
>>  <TASK>
>>  ? sysfs_kf_bin_read+0xc0/0xe0
>>  kernfs_fop_read_iter+0xac/0x1a0
>>  vfs_read+0x26d/0x350
>>  ksys_read+0x6b/0xe0
>>  __x64_sys_read+0x1d/0x30
>>  x64_sys_call+0x1bc8/0x1d70
>>  do_syscall_64+0x6d/0x110
>>
>> Add the endpoint information to the crashlog driver to avoid
>> the NULL pointer exception.
>>
>> Fixes: 416eeb2e1fc7 ("platform/x86/intel/pmt: telemetry: Export API to r=
ead
>telemetry")
>
>Add Cc: <stable@vger.kernel.org> and as this is going to stable so you
>should mrk the patches this one depends on with the stable Cc as well,
>this is explained in Documentation/process/stable-kernel-rules.rst.

I will review this and make sure they are correct for my next update.

>As a general rule, it would be useful to put the patches going to stable
>as first and refactor and feature changes only after that (you had some
>whitespace and guard() changes before this patch).

That makes sense.  I will re-order the patches.

M

>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index c6d8a7a61d39..94858bfb52f8 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -250,6 +250,7 @@ static struct intel_pmt_namespace pmt_crashlog_ns
>=3D {
>>  	.xa =3D &crashlog_array,
>>  	.attr_grp =3D &pmt_crashlog_group,
>>  	.pmt_header_decode =3D pmt_crashlog_header_decode,
>> +	.pmt_add_endpoint =3D intel_pmt_add_endpoint,
>>  };
>>
>>  /*
>> @@ -260,8 +261,12 @@ static void pmt_crashlog_remove(struct
>auxiliary_device *auxdev)
>>  	struct pmt_crashlog_priv *priv =3D auxiliary_get_drvdata(auxdev);
>>  	int i;
>>
>> -	for (i =3D 0; i < priv->num_entries; i++)
>> -		intel_pmt_dev_destroy(&priv->entry[i].entry,
>&pmt_crashlog_ns);
>> +	for (i =3D 0; i < priv->num_entries; i++) {
>> +		struct intel_pmt_entry *entry =3D &priv->entry[i].entry;
>> +
>> +		intel_pmt_release_endpoint(entry->ep);
>> +		intel_pmt_dev_destroy(entry, &pmt_crashlog_ns);
>> +	}
>>  }
>>
>>  static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
>>
>
>--
> i.

