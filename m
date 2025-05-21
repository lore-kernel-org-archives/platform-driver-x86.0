Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E28323C51E
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2025 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834153; cv=fail; b=VtHLbej5oUZy9bFDEf2MMo0c+r/kDO1MGzGms30nD11EBo6sXFpqUu6uQcNPPCU0kJDC79Tfuy+AQmlkQeeAg+smuDfnRSX59FEyLhDq9EQwf1ZGYzdNcxku6xzkNtBM0CinimGs6K+U9GApIoKhK4G5bvz6XzhAylfXKRGbVVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834153; c=relaxed/simple;
	bh=fsHtFJdA6DiesproEskIvGcnM8/jbExMzH/mhZcyxlM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SM3cYLgoKzeI0pZXwO2OOUt8O+VZx7sKIJKzp6nFHLhWq8/5T/fdvDmbBlbUiblmVpX1uTYRIr3F70Fc1b8UdSZRkSgjvDt8VOaa8eC3xoF8yanPytUjYKrdToaPrsRK9inbLubZzKYf+w8cF2LzwCUfIitLdoLpl0C2c8QGGaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3lOLveS; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3lOLveS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747834150; x=1779370150;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fsHtFJdA6DiesproEskIvGcnM8/jbExMzH/mhZcyxlM=;
  b=A3lOLveSiAepQKa7AO9Ap8ucmXHdZn55FCkGp/Ajz3vBNcFdRuTRzx/S
   Ux2OQeJFInCeqbwSCXlyVQPf1QYTf9h64MdW9pW3O8GIOKJFqodUicHp2
   YV05wJfO2g3lgIYNe281lRR1Rp9DcfcxtS14raxRwQUmhL8DQN6UfIoBz
   K1D/134Ggfvnre6jHxzI7m2f8NbZ00UW+Csd+RJahgc/4szEOHKT/qoMT
   e9X5y8OjmqIWw8pvOr2nxW11TEfakWyOvwX9ptdNAeFYvFtRcdfVx3339
   MJx/kH+0cBWQR02f/GFkOXEvT9ViRpfpW1cz/jEs0jn332DYkIz8aQYLA
   A==;
X-CSE-ConnectionGUID: 8cus4oaeRBaaQJBHOK/Npw==
X-CSE-MsgGUID: 9gMEz5yaRCujxAMH2/zb3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53609665"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="53609665"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:29:09 -0700
X-CSE-ConnectionGUID: QwErV4mdSVWpBQSxZrGjow==
X-CSE-MsgGUID: 3czbRQa6RJm427WaVOUNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139923977"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:29:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 06:29:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 06:29:09 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 06:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDj0WybFVDCRfza7flfkLDlEEjzst4uS2+lXwsgRkftcsMf0K53ixUaR+BiHX8LrGAlE1ow3OzySAqJ76xY25Cx8E9RyJ81gfK6Qx1bz/VIxNaycGHdhQfMs4XQmwuPwI6pAq6g7kGQU4Tt/bcnb34P9GV27w+xLDqiEIUbb4G2AMAFJ3hYJ9cbFkNOosDuQIRk0GKwDI261oCrPSPPwXl2Y2/lrd3LJO7Yd8DGkvHsuCcbps5Fgtx1r7HfP6FFfrVd4CyhIt+0jpAAKgQxK3yaaZOSjDXKew6M7KMw34UIetBBuDY8q6k3YZdzFN+dlknA4W7lTUjsvABsffMCGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kea3339iQGnH59z5EllsmcsZ0XzcTdLTcNQGjnalPjY=;
 b=ClhEgGbvysnG98coDMDfh+1ur8uv05/SUkziqAadsUtYIpgG+stq3ywK6O1mBEN2l+bGtoiqmL7cA/dzfpGXIa3uamRqbvpc4GVjs7YdticXiuR+9aIZLcd08lpMZpeAnwlmTCx1E+sCXBsVuiOZwn7VlZHOhYgytfC6sn3GT4vE6qOeE7FslAH4P+slGQwSQF60qDeIZa7jt1ITU6M7VInyR6yb8rrDlTzWhzDl21u5UGD9coXK238+ZqMIfLEQ/ICVky+OItm8E0m6Eyos0MfAQb3Hwy//CWV+f43b4bTniYjQfgVrhOw+I2aVFJs5cjRJd+4ng+fxi0V5+zaUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 13:28:38 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 13:28:38 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
Thread-Topic: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
Thread-Index: AQHbxnPaF0a2/DEWv0Stn5h2in8QRbPaHucAgALsldCAAAz3gIAAAszA
Date: Wed, 21 May 2025 13:28:38 +0000
Message-ID: <IA1PR11MB64181B697C6F5BC918B0CD6EC19EA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com>
 <20250516150416.210625-5-michael.j.ruhl@intel.com>
 <c63b6778-ecf5-e025-4f16-07a35a105e89@linux.intel.com>
 <IA1PR11MB6418FE0AB33CEE6D7BFD5818C19EA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <6af9a2a7-549f-ec06-c426-e2981d811fea@linux.intel.com>
In-Reply-To: <6af9a2a7-549f-ec06-c426-e2981d811fea@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA2PR11MB5052:EE_
x-ms-office365-filtering-correlation-id: 0a1f4bc2-4aff-48ce-b109-08dd986b652f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ZQe/TOr9UCwmfSWDnfRgzXsl//F5PYg3K07tvns2KlwjU4q4BQUhDOITGv?=
 =?iso-8859-1?Q?y6uIC1gN9eVl/3yI/evmHBgfU6YrctdSw/GzJ3ZjAkX0PBIq7nu/xerI6e?=
 =?iso-8859-1?Q?IFPc3EV3GJcUxpFeuJ8iH3W1ElkweitcOODPdIeKHAZPCtKF4fslYIG+A1?=
 =?iso-8859-1?Q?Qzx6fvvOfdiPuWIh7Ct/9w2x+jYnjeUy4Osu+IKYg6sFSm1ULCir9KeSvr?=
 =?iso-8859-1?Q?q6r3PTG4xfZQQRJK3ltjIqBeQBcPQ2TVkvKLHpoOh1naejNlRwQo15HNMf?=
 =?iso-8859-1?Q?rBQ2E86bcB+r3CnON4S04WxVKrHO5OwNaQ9VUOVVwrFnj9VuRJCCnNz5YS?=
 =?iso-8859-1?Q?dh5HjCpymQoLkrz6zrdgeqop34r8zVzL/WlQrm4JRC4Zv57rMLm0jBfQKA?=
 =?iso-8859-1?Q?b58fmBYG7rFXXnv3zabVvrh4bT9rjNR6Pnpy3Q8A0TZK9ho+8mOJhlk/sz?=
 =?iso-8859-1?Q?1qI5/7r3LYtD0k0BCf0suafFulb3JMH0alBN3wERuCMYmQgwINjjBzJWRh?=
 =?iso-8859-1?Q?P52KJWgmPaz+0ygPUI6e1AVD0N5imIri5j68k0RTepdKmD6hOmLC7Gz1fU?=
 =?iso-8859-1?Q?CCdePK42nRqJDDNC+eoEZ4TP3MHerzTioHLjgcJckQvTWIkJ+BhrnXQ920?=
 =?iso-8859-1?Q?liyXMjyWurqUdhMOEeiyqIBUOpjqWXJJvOa7W5teZcvGyK/R+j1JX7crA9?=
 =?iso-8859-1?Q?Q6gNlVYis6XB01Js5SDrxkH6G0xAF5j7OS/2OH5iOxtmhXbfhSvfmgls06?=
 =?iso-8859-1?Q?q0kpLLfF7i/VwFLK/TP/39XKiG4AGIXpcRZz+wxd2G/YMTjq1MEa3lzrDQ?=
 =?iso-8859-1?Q?a53Opg685/J097t+ZZGyUjhRLSFUyoOtSjgEmfcv+N3m9ks6UIk59+KvkO?=
 =?iso-8859-1?Q?jLa6xi6L0HFEqEWC+eZDZaqWG6d19ShOSbpCIgKy7Q2/317bjbgHGlaJEV?=
 =?iso-8859-1?Q?OibzZsfxPigqWi9SfTIAx2slxIm7f0uTvxhjEVT8ISwRwNLWmaHdP3C8Xn?=
 =?iso-8859-1?Q?Mvc6I7Qp7GgMX4bSf3r96Newfuosn6v9tqZujiNovf7WTLYgKg1QBnkGTy?=
 =?iso-8859-1?Q?dInMQW9WBmjVpePasURzUBi3oYbRgEU1JQjcezE06pkdoHBUWuCbVZzGBi?=
 =?iso-8859-1?Q?vSmyrQnz4mzK1idw/jLn6g0opt73tiBXEsmTxdz+LlbmYltDtC8MjTDY2H?=
 =?iso-8859-1?Q?pS8123mvS1NxVVxT6WfZ1Yd0dt2JM5mVJVih6nWoWlomSkq5zkzqryIWqW?=
 =?iso-8859-1?Q?yd1t0KVO0fXBMBwCcKdzJ4AA59YwkOLver+At5x1JX5gX5ubA4Bl2mYdJZ?=
 =?iso-8859-1?Q?8D2vut+WCFeW0Rw/FyqFksn1w+Q8nzCR8lFF/QZxIZo5+QbB/SGoen3b+b?=
 =?iso-8859-1?Q?kLjAiiEyDdt30mVUu35/ipZ1+N1lAgaNR1emcMh2iD/yPAHD1A0ugpHAnC?=
 =?iso-8859-1?Q?OJruK4hAmDcsW2wZ0Rzb82MnNGoHgy8rU6VwVY4gxysStPqutyGSCUV5/F?=
 =?iso-8859-1?Q?DDmDs3hn8YbR/YuQgVmxYnWDzYWWA8UXcg2+YjAt3Tdw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KH/+wBHYwmvZfTgyohOeFWII6l2Vt8BNQ20Uxe+UMMyKKAZjcmAq6Fk9Qo?=
 =?iso-8859-1?Q?DitSuKEQ7pzE48LduQnaoKb7zyuCsgvV9iqD/aSmuF/RFZPoXMPsNpRo1C?=
 =?iso-8859-1?Q?ONoDAY4E1514Fan+p27rwSZpvlUAv4R0nmCkpke6T3PR5bPYkv5gzHQ2/N?=
 =?iso-8859-1?Q?By3A23v0RlqS8eLA8lkckvtkfwCfjzZTdN3VmuVXhTzwqF50wtGBQ0sd//?=
 =?iso-8859-1?Q?JE6ClfuROua8s8uYl6sgfht4TnrdNkk+h7L0NqrpUUwiUwfG1d/1m3Z2yV?=
 =?iso-8859-1?Q?DVM4zm/immhfIKOlx3M4daKQwRTblM7nq7UxuVEVWFRDj/jpBx5rhdxTKX?=
 =?iso-8859-1?Q?BEIvvH1Ej+csyJ1UDKCXa6J85IxQ7s+Uz0YRYGTZOZSENILFEPdOXwQ/jx?=
 =?iso-8859-1?Q?c9Lb7b68oc+PBFZ1R+Ys3w0qi7R8hD3cvpp5G5Tnk4/vrUnEdtEX3fq4Sd?=
 =?iso-8859-1?Q?yWElAEw4xvHSpIN/YUL5jbFv//FiEqHwO/tNZOl3wXJ2jidn2tMsA/HMyn?=
 =?iso-8859-1?Q?7+YcWY/Is2n2hSu/vVS9H3T+Rk7FjaUY/a99kxu4E147XkDK4KTj4QyE6L?=
 =?iso-8859-1?Q?Vkw0E6BvO0vBCFG/iUnZlAwunoimNWP4GMEagJsIvsSoqQldbCO13O8VLN?=
 =?iso-8859-1?Q?GZHDUaT8D+Ms5VDSSaCPGhxM2sE/Rkf+s5ba39X9NcmV4BQFo7eNO3XjBu?=
 =?iso-8859-1?Q?wUE3yh3Fu5iidCRDzfm4RKoqcL6uTabiRNErbZ0MlcTw9S8DhOHfh36OZe?=
 =?iso-8859-1?Q?V1FE+d4XDYjtQBOJ6BgkdehQaP59yIG/83uveKNlby7t75I/tkA2LWqaky?=
 =?iso-8859-1?Q?2PBcaW1Y4tTR4VErnZzFZnPfwNKsRleqp8mXbxwEj3fqatjK83VG2isrgd?=
 =?iso-8859-1?Q?NKfYLgo8eoKLA0iIqM20HrDZwWm7G7v2hC0XpG7ZVa65IdaT7n74pd6aw/?=
 =?iso-8859-1?Q?5qtcRREHyF35GIY7bjthAXcWEAUgE7mj89DqECWZdZxbf2HiIMXzbeDEZT?=
 =?iso-8859-1?Q?auxNhm5mqu5EguM/vOf3pmZQdYzLOuBKzDs9X5ixo+9L4xWhBU5+d7d1Cx?=
 =?iso-8859-1?Q?TV5hdRKnJuYarU7ab4gYSQ0xujg5Y8yk/Q+DVsofdHkVKpQqppI1Z8hDfz?=
 =?iso-8859-1?Q?3N+8POw0A/atfOtaIP3LgSIrQQW9sznDHzZYI8g/YOPeLE6blxdTb13H/m?=
 =?iso-8859-1?Q?NMWmwDpPYX2xD7P+M6G8A2vr++XTgX2jcvxX7obV3WxwJ4pVzLOsWmOZm2?=
 =?iso-8859-1?Q?jg8zYO3Y9sY4GcCPafVgwB65vaqg48kHoGoJWsIV5x3T8uEHS2tJXp3a+J?=
 =?iso-8859-1?Q?T2sACpHk+807D809cWI3z1iNaRdz9B3fphzBz2m/xpkVJpT731+Adka/dP?=
 =?iso-8859-1?Q?Kz90bZVhklcRFGrNwrVptsy0TFDeeIKWYig0FnfGXQmcx7mQJ774rVxkL/?=
 =?iso-8859-1?Q?t2aTlAYX+rH+Xb4m/+Rn0ogajJTr5qVDQZ1t4GR2xUQvGvSJ7TkndNFBrS?=
 =?iso-8859-1?Q?NebeYusCVB3ytJaxtKPy+QM+zt9mVKmWtmmtG/GbjKUJzgpGQijFXjJziq?=
 =?iso-8859-1?Q?zb16TVFNvMbZ6QmobbzPXtYB1DjfFeZtWFxhYjHDMa/7ZBVHwcjogSDnc0?=
 =?iso-8859-1?Q?Pp6CAO/olq22rRAWU5wVkAJBd0qdb4BFSy?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1f4bc2-4aff-48ce-b109-08dd986b652f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 13:28:38.2659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+Tx/FnPyP+vkZ+T1UNpPR3lLkn8a0UPU513LOATXd9M4+gK4tSU942OOMjT+4MF0nf3P2AqnjALW2SvzJTyamDXUWmFm+nZOMLr7R9KfKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Wednesday, May 21, 2025 9:17 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org
>Subject: RE: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
>
>On Wed, 21 May 2025, Ruhl, Michael J wrote:
>
>> >-----Original Message-----
>> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>> >Sent: Monday, May 19, 2025 11:52 AM
>> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> >Cc: platform-driver-x86@vger.kernel.org
>> >Subject: Re: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
>> >
>> >On Fri, 16 May 2025, Michael J. Ruhl wrote:
>> >
>> >> The Battlemage GPU has the type 1 version 2 crashlog
>> >> feature.
>> >>
>> >> Update the crashlog driver to support this crashlog
>> >> version.
>> >
>> >Too short lines.
>> >
>> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> >> ---
>> >>  drivers/platform/x86/intel/pmt/class.h    |   2 +
>> >>  drivers/platform/x86/intel/pmt/crashlog.c | 328
>+++++++++++++++++++---
>> >>  2 files changed, 288 insertions(+), 42 deletions(-)
>> >>
>> >> diff --git a/drivers/platform/x86/intel/pmt/class.h
>> >b/drivers/platform/x86/intel/pmt/class.h
>> >> index 6b3455a86471..9c0c7e2efecf 100644
>> >> --- a/drivers/platform/x86/intel/pmt/class.h
>> >> +++ b/drivers/platform/x86/intel/pmt/class.h
>> >> @@ -31,6 +31,8 @@ struct telem_endpoint {
>> >>  };
>> >>
>> >>  struct intel_pmt_header {
>> >> +	u32	type;
>> >> +	u32	version;
>> >>  	u32	base_offset;
>> >>  	u32	size;
>> >>  	u32	guid;
>> >> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>> >b/drivers/platform/x86/intel/pmt/crashlog.c
>> >> index c9bfe1c26311..700a51d2563a 100644
>> >> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> >> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> >> @@ -23,10 +23,17 @@
>> >>  #define CRASH_TYPE_OOBMSM	1
>> >>
>> >>  /* Crashlog Discovery Header */
>> >> -#define CONTROL_OFFSET		0x0
>> >> -#define GUID_OFFSET		0x4
>> >> -#define BASE_OFFSET		0x8
>> >> -#define SIZE_OFFSET		0xC
>> >> +#define CONTROL_OFFSET		0x00
>> >> +#define GUID_OFFSET		0x04
>> >> +#define BASE_OFFSET		0x08
>> >> +#define SIZE_OFFSET		0x0C
>> >
>> >Why did you change this group at all?
>>
>> Was going for "consistency" on the byte definitions, but then apparently
>forgot in the
>> following section (0x00)...
>>
>> will remove the change.
>>
>> >> +#define TYPE1_VER0_CONTROL_OFFSET	0x0
>> >> +#define TYPE1_VER0_STATUS_OFFSET	0x0
>> >> +
>> >> +#define TYPE1_VER2_CONTROL_OFFSET	0x14
>> >> +#define TYPE1_VER2_STATUS_OFFSET	0x0
>> >> +
>> >>  #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
>> >>  /* size is in bytes */
>> >>  #define GET_SIZE(v)		((v) * sizeof(u32))
>> >> @@ -56,9 +63,37 @@ struct type1_ver0_base {
>> >>  	u32 complete:		1;  /* ro/v  31:31 */
>> >>  };
>> >>
>> >> +struct type1_ver2_status {
>> >> +	u32 access_type:	4;  /* ro    0:3  */
>> >> +	u32 crash_type:		4;  /* ro    4:7  */
>> >> +	u32 count:		8;  /* ro    8:15 */
>> >> +	u32 version:		4;  /* ro   16:19 */
>> >> +	u32 clear_support:	1;  /* ro   20:20 */
>> >> +	u32 rsvd:		4;  /* ro   21:24 */
>> >> +	u32 rearmed:		1;  /* ro   25:25 */
>> >> +	u32 error:		1;  /* ro   26:26 */
>> >> +	u32 consumed:		1;  /* ro   27:27 */
>> >> +	u32 disable:		1;  /* ro   28:28 */
>> >> +	u32 cleared:		1;  /* ro   29:29 */
>> >> +	u32 in_progress:	1;  /* ro   30:30 */
>> >> +	u32 complete:		1;  /* ro   31:31 */
>> >
>> >See, now you're adding GENMASK()/BIT() arguments into the comment
>when
>> >the
>> >struct/C bitfield doesn't document that for you. I think this conversio=
n
>> >away from GENMASK()/BIT() was a step backwards.
>> >
>> >> +};
>> >> +
>> >> +struct type1_ver2_control {
>> >> +	u32 rsvd0:		25; /* ro    0:24 */
>> >> +	u32 consumed:		1;  /* rw/v 25:25 */
>> >> +	u32 rsvd1:		1;  /* ro/v 26:26 */
>> >> +	u32 rsvd2:		1;  /* ro/v 27:27 */
>> >
>> >Why aren't these two combined?
>>
>> There was a different bit defined there before (not rsvd)  I will combin=
e.
>>
>> >> +	u32 rearm:		1;  /* rw/v 28:28 */
>> >> +	u32 manual:		1;  /* rw/v 29:29 */
>> >> +	u32 clear:		1;  /* rw/v 30:30 */
>> >> +	u32 disable:		1;  /* rw/v 31:31 */
>> >
>> >Really, they converted most bits into reserved (which is fine) but not
>> >only that, they also relocated the remaining bits just because they
>> >could. :-(
>>
>> Yup, which is why I was having difficulty with the BIT() definitions...
>
>I think I managed to get confused myself about control and status ones.
>
>> >> +};
>> >> +
>> >>  struct crashlog_status {
>> >>  	union {
>> >>  		struct type1_ver0_base stat;
>> >> +		struct type1_ver2_status stat2;
>> >>  		u32 status;
>> >>  	};
>> >>  };
>> >> @@ -66,6 +101,7 @@ struct crashlog_status {
>> >>  struct crashlog_control {
>> >>  	union {
>> >>  		struct type1_ver0_base ctrl;
>> >> +		struct type1_ver2_control ctrl2;
>> >>  		u32 control;
>> >>  	};
>> >>  };
>> >> @@ -75,97 +111,174 @@ struct pmt_crashlog_priv {
>> >>  	struct crashlog_entry	entry[];
>> >>  };
>> >>
>> >> +static u32 get_control_offset(struct intel_pmt_header *hdr)
>> >> +{
>> >> +	return hdr->version =3D=3D 0 ? TYPE1_VER0_CONTROL_OFFSET :
>> >TYPE1_VER2_CONTROL_OFFSET;
>> >> +}
>> >> +
>> >> +static u32 get_status_offset(struct intel_pmt_header *hdr)
>> >> +{
>> >> +	return hdr->version =3D=3D 0 ? TYPE1_VER0_STATUS_OFFSET :
>> >TYPE1_VER2_STATUS_OFFSET;
>> >> +}
>> >
>> >I suggest you create some per version const version info struct which
>> >holds all the relevant offsets, field bitmasks that got changed, and
>> >attrs (perhaps more, the code is complex enough I didn't try to
>> >understand evenything until it look cleaner). Basically, whenever you w=
ant
>> >to check what the version is and behave differently, consider if you ca=
n
>> >put that somehow into the per version info struct without needed to use
>> >if () / elvis op logic at all.
>>
>> So something like this:
>>
>> struct crashlog_offset {
>> 	int disabled;
>> 	int cleared;
>> 	int manual;
>> 	int complete;
>> 	int rearmed;
>> 	int error;
>> 	int consumed;
>> 	int in_progress;
>> 	int set_consumed;
>> 	int set_rearm;
>> 	int set_manual;
>> 	int set_clear;
>> 	int set_disable;
>
>Use u32 and put the mask/bit into them. But only put the ones which are
>really different, not the ones which are the same.
>
>> } offset;
>>
>> if (version =3D=3D 0) {
>> 	offset.disabled(28);
>> 	offset.set_disabled =3D BIT(28);
>
>Not in the function code at all, you construct them like:
>
>const struct crahslog_offset *crashlog_v0 =3D {
>	.control_offset =3D TYPE1_VER0_CONTROL_OFFSET,
>	...
>	.control_disable =3D CRASHLOG_FLAG_VER0_CONTROL_DISABLE,
>};
>
>Then, at init time, save pointer to crashlog_v0 or crashlog_v2 somewhere
>so you don't need any ifs in the other functions as you can just deref
>the correct one.
>
>I suggest you consider removing low-value chars from those define names
>such as "FLAG", and shortening CONTROL to CTRL, VER -> V, etc. to control
>the horizontal space better.

Ok, that makes sense.

I am working on the test infrastructure, once that is complete, I will revi=
sit these
patches and get them updated.

Thanks!

Mike

>> }
>> if (version =3D=3D 2) {
>> 	offset.disabled =3D BIT(28);
>> 	offset.set_disabled =3D BIT(31);
>> }
>>
>> ?  (or did you have a different example?)
>>
>> I am not sure I am following what you would like to see here...
>>
>> >Also now, after reading this patch, I'm even more convinced you want to
>> >keep using BIT/GENMASK(), not C bitfields because the former just happe=
ns
>> >to be more flexible allowing the mask values to be easily put into the
>> >info struct.
>> >
>> >>  /*
>> >>   * I/O
>> >>   */
>> >>  static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
>> >>  {
>> >> +	u32 offset =3D get_status_offset(&entry->header);
>> >>  	struct crashlog_status status =3D {
>> >> -		.status =3D readl(entry->disc_table + CONTROL_OFFSET),
>> >> +		.status =3D readl(entry->disc_table + offset),
>> >>  	};
>> >>
>> >>  	/* return current value of the crashlog complete flag */
>> >> -	return status.stat.complete;
>> >> +	if (entry->header.version =3D=3D 0)
>> >> +		return status.stat.complete;
>> >>
>> >> +	return status.stat2.complete;
>> >>  }
>> >>
>> >>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>> >>  {
>> >> +	u32 offset =3D get_status_offset(&entry->header);
>> >>  	struct crashlog_status status =3D {
>> >> -		.status =3D readl(entry->disc_table + CONTROL_OFFSET),
>> >> +		.status =3D readl(entry->disc_table + offset),
>> >>  	};
>> >>
>> >>  	/* return current value of the crashlog disabled flag */
>> >> -	return status.stat.disable;
>> >> +	if (entry->header.version =3D=3D 0)
>> >> +		return status.stat.disable;
>> >> +
>> >> +	return status.stat2.disable;
>> >>  }
>> >>
>> >> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>> >> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u3=
2
>> >*crash_type, u32 *version)
>> >>  {
>> >>  	struct crashlog_control discovery_header =3D {
>> >>  		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> >>  	};
>> >> -	u32 crash_type, version;
>> >>
>> >> -	crash_type =3D discovery_header.ctrl.crash_type;
>> >> -	version =3D discovery_header.ctrl.version;
>> >> +	*crash_type =3D discovery_header.ctrl.crash_type;
>> >> +	*version =3D discovery_header.ctrl.version;
>> >>
>> >>  	/*
>> >> -	 * Currently we only recognize OOBMSM version 0 devices.
>> >> -	 * We can ignore all other crashlog devices in the system.
>> >> +	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
>> >> +	 * devices.
>> >> +	 *
>> >> +	 * Ignore all other crashlog devices in the system.
>> >>  	 */
>> >> -	return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
>> >> +	if (*crash_type =3D=3D CRASH_TYPE_OOBMSM && (*version =3D=3D 0 ||
>> >*version =3D=3D 2))
>> >> +		return true;
>> >> +
>> >> +	return false;
>> >>  }
>> >>
>> >>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
>> >>  				     bool disable)
>> >>  {
>> >> +	u32 offset =3D get_control_offset(&entry->header);
>> >>  	struct crashlog_control control =3D {
>> >> -		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> >> +		.control =3D readl(entry->disc_table + offset),
>> >>  	};
>> >>
>> >> -	/* clear trigger bits so we are only modifying disable flag */
>> >> -	control.ctrl.clear =3D 0;
>> >> -	control.ctrl.manual =3D 0;
>> >> -	control.ctrl.complete =3D 0;
>> >> +	if (entry->header.version =3D=3D 0) {
>> >> +		/* clear trigger bits so we are only modifying disable flag */
>> >> +		control.ctrl.clear =3D 0;
>> >> +		control.ctrl.manual =3D 0;
>> >> +		control.ctrl.complete =3D 0;
>> >>
>> >> -	if (disable)
>> >> -		control.ctrl.disable =3D 1;
>> >> -	else
>> >> -		control.ctrl.disable =3D 0;
>> >> +		control.ctrl.disable =3D disable;
>> >> +	} else {
>> >> +		control.ctrl2.manual =3D 0;
>> >> +		control.ctrl2.clear =3D 0;
>> >>
>> >> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>> >> +		control.ctrl2.disable =3D disable;
>> >> +	}
>> >> +
>> >> +	writel(control.control, entry->disc_table + offset);
>> >>  }
>> >>
>> >>  static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
>> >>  {
>> >> +	u32 offset =3D get_control_offset(&entry->header);
>> >>  	struct crashlog_control control =3D {
>> >> -		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> >> +		.control =3D readl(entry->disc_table + offset),
>> >>  	};
>> >>
>> >> -	/* clear trigger bits so we are only modifying disable flag */
>> >> -	control.ctrl.disable =3D 0;
>> >> -	control.ctrl.manual =3D 0;
>> >> -	control.ctrl.complete =3D 0;
>> >> +	if (entry->header.version =3D=3D 0) {
>> >> +		/* clear trigger bits so we are only modifying disable flag */
>> >> +		control.ctrl.disable =3D 0;
>> >> +		control.ctrl.manual =3D 0;
>> >> +		control.ctrl.complete =3D 0;
>> >> +
>> >> +		control.ctrl.clear =3D 1;
>> >> +	} else {
>> >> +		control.ctrl2.disable =3D 0;
>> >> +		control.ctrl2.manual =3D 0;
>> >>
>> >> -	control.ctrl.clear =3D 1;
>> >> +		control.ctrl2.clear =3D 1;
>> >> +	}
>> >>
>> >> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>> >> +	writel(control.control, entry->disc_table + offset);
>> >>  }
>> >>
>> >>  static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
>> >>  {
>> >> +	u32 offset =3D get_control_offset(&entry->header);
>> >>  	struct crashlog_control control =3D {
>> >> -		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> >> +		.control =3D readl(entry->disc_table + offset),
>> >> +	};
>> >> +
>> >> +	if (entry->header.version =3D=3D 0) {
>> >> +		/* clear trigger bits so we are only modifying disable flag */
>> >> +		control.ctrl.disable =3D 0;
>> >> +		control.ctrl.clear =3D 0;
>> >> +		control.ctrl.complete =3D 0;
>> >> +
>> >> +		control.ctrl.manual =3D 1;
>> >> +	} else {
>> >> +		control.ctrl2.disable =3D 0;
>> >> +		control.ctrl2.clear =3D 0;
>> >> +
>> >> +		control.ctrl2.manual =3D 1;
>> >> +	}
>> >> +
>> >> +	writel(control.control, entry->disc_table + offset);
>> >> +}
>> >> +
>> >> +/* version 2 support */
>> >> +static void pmt_crashlog_set_consumed(struct intel_pmt_entry *entry)
>> >> +{
>> >> +	u32 offset =3D get_control_offset(&entry->header);
>> >> +	struct crashlog_control control =3D {
>> >> +		.control =3D readl(entry->disc_table + offset),
>> >>  	};
>> >>
>> >> -	/* clear trigger bits so we are only modifying disable flag */
>> >> -	control.ctrl.disable =3D 0;
>> >> -	control.ctrl.clear =3D 0;
>> >> -	control.ctrl.complete =3D 0;
>> >> +	control.ctrl2.consumed =3D 1;
>> >> +
>> >> +	writel(control.control, entry->disc_table + offset);
>> >> +}
>> >>
>> >> -	control.ctrl.manual =3D 1;
>> >> +static bool pmt_crashlog_rearm(struct intel_pmt_entry *entry)
>> >> +{
>> >> +	u32 offset =3D get_status_offset(&entry->header);
>> >> +	struct crashlog_status status =3D {
>> >> +		.status =3D readl(entry->disc_table + offset),
>> >> +	};
>> >>
>> >> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>> >> +	return status.stat2.rearmed;
>> >> +}
>> >> +
>> >> +static void pmt_crashlog_set_rearm(struct intel_pmt_entry *entry)
>> >> +{
>> >> +	u32 offset =3D get_control_offset(&entry->header);
>> >> +	struct crashlog_control control =3D {
>> >> +		.control =3D readl(entry->disc_table + offset),
>> >> +	};
>> >> +
>> >> +	control.ctrl2.rearm =3D 1;
>> >> +
>> >> +	writel(control.control, entry->disc_table + offset);
>> >>  }
>> >>
>> >>  /*
>> >> @@ -177,7 +290,7 @@ enable_show(struct device *dev, struct
>> >device_attribute *attr, char *buf)
>> >>  	struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
>> >>  	int enabled =3D !pmt_crashlog_disabled(entry);
>> >>
>> >> -	return sprintf(buf, "%d\n", enabled);
>> >> +	return sysfs_emit(buf, "%d\n", enabled);
>> >>  }
>> >>
>> >>  static ssize_t
>> >> @@ -251,16 +364,135 @@ trigger_store(struct device *dev, struct
>> >device_attribute *attr,
>> >>  }
>> >>  static DEVICE_ATTR_RW(trigger);
>> >>
>> >> +static ssize_t consumed_store(struct device *dev, struct device_attr=
ibute
>> >*attr,
>> >> +			      const char *buf, size_t count)
>> >> +{
>> >> +	struct crashlog_entry *entry;
>> >> +	bool consumed;
>> >> +	int result;
>> >> +
>> >> +	entry =3D dev_get_drvdata(dev);
>> >> +
>> >> +	result =3D kstrtobool(buf, &consumed);
>> >> +	if (result)
>> >> +		return result;
>> >> +
>> >> +	/* set bit only */
>> >> +	if (!consumed)
>> >> +		return -EINVAL;
>> >> +
>> >> +	mutex_lock(&entry->control_mutex);
>> >
>> >Please use guard() and remove the gotos.
>>
>> Will do.
>>
>> Thank you for your comments!
>>
>> Mike
>>
>> >> +
>> >> +	if (pmt_crashlog_disabled(&entry->entry)) {
>> >> +		result =3D -EBUSY;
>> >> +		goto err;
>> >> +	} else if (!pmt_crashlog_complete(&entry->entry)) {
>> >> +		result =3D -EEXIST;
>> >> +		goto err;
>> >> +	} else {
>> >> +		pmt_crashlog_set_consumed(&entry->entry);
>> >> +	}
>> >> +
>> >> +err:
>> >> +	mutex_unlock(&entry->control_mutex);
>> >> +	return count;
>> >> +}
>> >> +static DEVICE_ATTR_WO(consumed);
>> >> +
>> >> +static ssize_t
>> >> +rearm_show(struct device *dev, struct device_attribute *attr, char *=
buf)
>> >> +{
>> >> +	struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
>> >> +	int rearmed =3D pmt_crashlog_rearm(entry);
>> >> +
>> >> +	return sysfs_emit(buf, "%d\n", rearmed);
>> >> +}
>> >> +
>> >> +static ssize_t rearm_store(struct device *dev, struct device_attribu=
te *attr,
>> >> +			   const char *buf, size_t count)
>> >> +{
>> >> +	struct crashlog_entry *entry;
>> >> +	bool trigger;
>> >> +	int result;
>> >> +
>> >> +	entry =3D dev_get_drvdata(dev);
>> >> +
>> >> +	result =3D kstrtobool(buf, &trigger);
>> >> +	if (result)
>> >> +		return result;
>> >> +
>> >> +	/* set only */
>> >> +	if (!trigger)
>> >> +		return -EINVAL;
>> >> +
>> >> +	mutex_lock(&entry->control_mutex);
>> >> +	pmt_crashlog_set_rearm(&entry->entry);
>> >> +	mutex_unlock(&entry->control_mutex);
>> >> +
>> >> +	return count;
>> >> +}
>> >> +static DEVICE_ATTR_RW(rearm);
>> >> +
>> >> +#define DEBUG_REGISTER_INFO
>> >> +#ifdef DEBUG_REGISTER_INFO
>> >> +static ssize_t
>> >> +status_show(struct device *dev, struct device_attribute *attr, char =
*buf)
>> >> +{
>> >> +       struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
>> >> +       u32 sts_off =3D get_status_offset(&entry->header);
>> >> +       u32 ctl_off =3D get_control_offset(&entry->header);
>> >> +       struct crashlog_status status =3D {
>> >> +               .status =3D readl(entry->disc_table + sts_off),
>> >> +       };
>> >> +       struct crashlog_control control =3D {
>> >> +               .control =3D readl(entry->disc_table + ctl_off),
>> >> +       };
>> >> +       int len =3D 0;
>> >> +
>> >> +       len +=3D sysfs_emit_at(buf, len, "clear_support: %d\n",
>> >status.stat2.clear_support);
>> >> +       len +=3D sysfs_emit_at(buf, len, "rearmed: %d\n",
>status.stat2.rearmed);
>> >> +       len +=3D sysfs_emit_at(buf, len, "error: %d\n", status.stat2.=
error);
>> >> +       len +=3D sysfs_emit_at(buf, len, "consumed: %d\n",
>> >status.stat2.consumed);
>> >> +       len +=3D sysfs_emit_at(buf, len, "disable: %d\n", status.stat=
2.disable);
>> >> +       len +=3D sysfs_emit_at(buf, len, "cleared: %d\n", status.stat=
2.cleared);
>> >> +       len +=3D sysfs_emit_at(buf, len, "in_progress: %d\n",
>> >status.stat2.in_progress);
>> >> +       len +=3D sysfs_emit_at(buf, len, "complete: %d\n",
>status.stat2.complete);
>> >> +       len +=3D sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0=
x%02x\n",
>> >sts_off, ctl_off);
>> >> +       len +=3D sysfs_emit_at(buf, len, "status:  0x%08x\n", status.=
status);
>> >> +       len +=3D sysfs_emit_at(buf, len, "control: 0x%08x\n", control=
.control);
>> >> +
>> >> +       return len;
>> >> +}
>> >> +static DEVICE_ATTR_RO(status);
>> >> +#endif
>> >> +
>> >>  static struct attribute *pmt_crashlog_attrs[] =3D {
>> >>  	&dev_attr_enable.attr,
>> >>  	&dev_attr_trigger.attr,
>> >>  	NULL
>> >>  };
>> >>
>> >> +static struct attribute *pmt_crashlog_ver2_attrs[] =3D {
>> >> +	&dev_attr_enable.attr,
>> >> +	&dev_attr_trigger.attr,
>> >> +	&dev_attr_consumed.attr,
>> >> +	&dev_attr_rearm.attr,
>> >> +#ifdef DEBUG_REGISTER_INFO
>> >> +	&dev_attr_status.attr,
>> >> +#endif
>> >
>> >You could use a define to hold this so you don't need to use ifdef here=
.
>> >Check WMAX_DEV_GROUPS if you want an example what I mean.
>> >
>> >> +	NULL
>> >> +};
>> >> +
>> >>  static const struct attribute_group pmt_crashlog_group =3D {
>> >>  	.attrs	=3D pmt_crashlog_attrs,
>> >>  };
>> >>
>> >> +static const struct attribute_group pmt_crashlog_ver2_group =3D {
>> >> +	.attrs	=3D pmt_crashlog_ver2_attrs,
>> >> +};
>> >> +
>> >> +static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>struct
>> >device *dev);
>> >> +
>> >>  static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev=
,
>> >>  				     struct intel_pmt_entry *entry)
>> >>  {
>> >> @@ -286,14 +518,24 @@ static int pmt_crashlog_add_endpoint(struct
>> >intel_vsec_device *ivdev,
>> >>  	return 0;
>> >>  }
>> >>
>> >> +static const struct attribute_group *select_sysfs_grp(struct
>> >intel_pmt_header *hdr)
>> >> +{
>> >> +	if (hdr->version =3D=3D 0)
>> >> +		return &pmt_crashlog_group;
>> >> +
>> >> +	return &pmt_crashlog_ver2_group;
>> >> +}
>> >> +
>> >>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>> >>  				      struct device *dev)
>> >>  {
>> >>  	void __iomem *disc_table =3D entry->disc_table;
>> >>  	struct intel_pmt_header *header =3D &entry->header;
>> >>  	struct crashlog_entry *crashlog;
>> >> +	u32 version;
>> >> +	u32 type;
>> >>
>> >> -	if (!pmt_crashlog_supported(entry))
>> >> +	if (!pmt_crashlog_supported(entry, &type, &version))
>> >>  		return 1;
>> >>
>> >>  	/* initialize control mutex */
>> >> @@ -303,11 +545,13 @@ static int pmt_crashlog_header_decode(struct
>> >intel_pmt_entry *entry,
>> >>  	header->access_type =3D GET_ACCESS(readl(disc_table));
>> >>  	header->guid =3D readl(disc_table + GUID_OFFSET);
>> >>  	header->base_offset =3D readl(disc_table + BASE_OFFSET);
>> >> +	header->type =3D type;
>> >> +	header->version =3D version;
>> >>
>> >>  	/* Size is measured in DWORDS, but accessor returns bytes */
>> >>  	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
>> >>
>> >> -	entry->attr_grp =3D &pmt_crashlog_group;
>> >> +	entry->attr_grp =3D select_sysfs_grp(header);
>> >>
>> >>  	return 0;
>> >>  }
>> >>
>> >
>> >--
>> > i.
>>
>
>--
> i.
