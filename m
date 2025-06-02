Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C2232369
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Jun 2025 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876489; cv=fail; b=LoDu1zxtH23oGetWNmcgiqKoGpCb9HwZ90OHlEzBo0Opvwv6hCDlkY9FPv17ZgZJqI3cPQ6FJzSm5lZ9+q8rE47i6Cq77r2iNNBkAwI6vIGwQDdYvUg5OLqIcCKtk77K3gVw5s77V7ZP6K+XjDUbQDDvmSoClpKs0G33xWfHzIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876489; c=relaxed/simple;
	bh=TNSUpHXitg3T3wxU2KWhJyFiPIfmY5aazuqhWnGQ2Qg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CS2O+4JAk5e1jfNE+138l3lwwP8arDNWY7nHPtQz4ZqC/UUuI18uuDPqYNSGV6lfjpqHx4P7ZZIJaB+c/RALd7q0wDNF+djN3k1zhCg015qmwZs9qKnIu9Th14BkT56O7fQMOlmZ6DuxxKlXg7aJ8UMXzUzh4DR6oj7dowvtO+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJUJCyqJ; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJUJCyqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748876488; x=1780412488;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TNSUpHXitg3T3wxU2KWhJyFiPIfmY5aazuqhWnGQ2Qg=;
  b=lJUJCyqJ7Yd2g3YvEhr8s3KnOWAIzSEi9d994/6QYHHpxXVeku/K6FZ1
   P4u1BWgmuxVygiHAKmFV43bmUNmCKtxCrQ8IiV6PkYJ51H8AfEfinnGFG
   XtjtTFCVIa/Qn9T2ot2e3Lo3TneYVuejM2Fo++r4dGlHgGxFLQ9F/bDxD
   j+nxOKQ7G1xqR7mOKU1iFD2AsqFw9Q5JGQ+xYD580hsAMjz02G+Gpk7Tk
   W6ecML1rOdwDt5sknXOLL9cFGKn43E/VyjTjWkYafXo7OBxAVS4YkJ3rS
   8ddnuX+YAMgM38mX1aOC4JfEg15In9eWH9bKLH8zZ0ExjVmxK1AWJ3Zsi
   A==;
X-CSE-ConnectionGUID: dDN0rPyqQTeqxchCvZvUkQ==
X-CSE-MsgGUID: zHntzkBJQF+wR4lLAwnLYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62234203"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="62234203"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:01:27 -0700
X-CSE-ConnectionGUID: XpApj3H7Q2+Tc7ZoKwuP0Q==
X-CSE-MsgGUID: /VcEihshSJGsvOwcZrMA2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="145006186"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:01:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 08:01:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 08:01:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.54)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 08:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qlh0DOr1U77nvu6vmNlb1+gBBFhoBqCK+xIYQS/9Zxr4Cn5WDrZQh6b5hKX/0rCCqbS1onMWjABsJyszjVv2BO+UapiodtBbg5OYaPjG9fZb4yKAZKZy43NNpWliCulQUSWmTKqQz86NknGz37frgqF2zHtSjbxYsrJdBfmp4dKys5RQpGWHzidh6aA4sR2vDz0N6vY36YUVp/U8yIRNl8y81VkSHk9dcNyqAgARlyS4zXjzusp5n/x3eP2CpIMyYr3htjpNLbWK8H2pzSsbdrukxk+DyqQ6QAydAqND3nkFYojoOjIcpfUouBriijCgebW5GES+4YT/KMKKlmEZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=si2/bOVW4KFSiSeaTblFhMofs0TV5XWmRfbTJEWPv48=;
 b=jwp2OMleAuLrQ53gPo3RW2Mvp8ZJKCA+pM4s/91kMohztmhF04sAAEjZBqKB39cpYHN7nDhL5VXSIIcI+V2nFItX3YCcQrjkiUO/FZ+P0u93z8b0pVkKo2kBXuzlo/fGNKtpo9EFmgm5xQxXuIa8ORH3mXFDFk6j+dASDl+ew4c19TzQ3ur1Vuj55t3VUHgu3tXDbwGkzzbZHWkfthlAmEns/ZOR39PK9UO1NEjJopWMQzwa3cs5VQaTBkbbUZGwzwdrH4bn5A3EGOiDpmV5GjnxlPLDKkJpN2xo7zxYfBCoAQa1bw6N93MSvjKIHPCul9GbBLvbe1fFaHMkza/3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:01:22 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 15:01:21 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>
Subject: RE: [PATCH 04/10] platform/x86/intel: refactor endpoint usage
Thread-Topic: [PATCH 04/10] platform/x86/intel: refactor endpoint usage
Thread-Index: AQHb0aJC0GnA8lJZJ0i/WrajsktxrrPsNqYAgAPD+RA=
Date: Mon, 2 Jun 2025 15:01:21 +0000
Message-ID: <IA1PR11MB6418B91A497EF99745647C29C162A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <20250530203356.190234-4-michael.j.ruhl@intel.com>
 <43f3c286-81bf-278e-95d1-4867826c2298@linux.intel.com>
In-Reply-To: <43f3c286-81bf-278e-95d1-4867826c2298@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MN2PR11MB4725:EE_
x-ms-office365-filtering-correlation-id: ffe906e1-65e5-4a5a-6f99-08dda1e6561a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?KTxDXDVGm2JzUJcei9ehr4XFlNA7JjUxQvTR14km2gqLiP/SytZqB/IuiZ?=
 =?iso-8859-1?Q?NjO/0toRzAArD8Ya8T7RRi7y4POCSnnnHwI3y9eCBYRAly4kUHYByqkI70?=
 =?iso-8859-1?Q?4MV5rIoQYtSUi8t0cLcnk8CX9gIb2Jn4azWPp0Uxk7hbZYR6hn8h+Y2kpJ?=
 =?iso-8859-1?Q?UCNh3+r7+74arhln29rLjkE7a29Pa5FHgUoWzM2hCTJqpvLmdayuv+KVvZ?=
 =?iso-8859-1?Q?4gQJ0gHNvTNM1G996IrGjB23UyPHjMQ5XVZ9S0KEmlVwhNg+uisSdXXHAN?=
 =?iso-8859-1?Q?uLVl7ZD6ZKCUDGxKkkg3MOIu7XBJscCU9l0fkhGCTT5CAIKS3PN6mwivmh?=
 =?iso-8859-1?Q?oBwZeUVILoQTI6inqiwvoit+JmRZFvr/mtDQwzXkVOEmachbKAgAvGAlkZ?=
 =?iso-8859-1?Q?OO9Jcd4fjO4N9gjo0Vtz3BA9hVC6d2fOkKWzj/V7405FxtTg0XO3jTyKEJ?=
 =?iso-8859-1?Q?nRmf9sCynZ9NYki76gr6XSeaJPwO2cMs2WFWLu5OG5OqwI5WnfxodZHGyV?=
 =?iso-8859-1?Q?XFewAYUtVc9FHNb6Nix3Y+InF9JMl5YBTQjHrhynFZ9chkG3feSoQ/J32E?=
 =?iso-8859-1?Q?N8ta2jl2Qxmmt8y1pPJjI7Z0qFAlAXDIxZoiNcLm2pfE2uup3+GvwfMzty?=
 =?iso-8859-1?Q?8ORDYqGE7pG4Eq7bqdRZJd+kod0rY29SZi7S4y4Tm3fcZnw2j+Uuek41GX?=
 =?iso-8859-1?Q?fV2T89TP/Y/YbsyL1U3b9IVi1XGA4e+OypnaTpfib0AcG6TtgqT9TCH3wG?=
 =?iso-8859-1?Q?2UyMxXFcreEU8LvDxqOJBdj6AyJ4jJoPdGvF6wJobi8p85woac0tC8uI7W?=
 =?iso-8859-1?Q?E1DSg92oTKrPuDJlPWjty2e/gShCjBW5UlKwYiyu1Xj+o93K3oGKTSiygr?=
 =?iso-8859-1?Q?lKsxRcAcRts3E8kqTPQdNajkO/gVC60eIGmLy38HVHuOmd93WSAsIqckEB?=
 =?iso-8859-1?Q?52YnwnMIV3UC1Sm1enYSs/NVisZmf3r2bogeqd3EJbmC9jciGi5UxYY/tg?=
 =?iso-8859-1?Q?PjIuOGeMizXzFEqwZSypjuGkqF1xWJFpzQayVV75Rk2CAEExE5LsiGnCh6?=
 =?iso-8859-1?Q?Sd2ZzDEnrKL2EU7gz/KJ9utccw9bOpdDtKA6LaIxfOIfpwsrwJL5dJzZ+Y?=
 =?iso-8859-1?Q?IG6EbyUgYKKer6UrtFMG2TJElQ++5cLH0LQSmZNKMC2LsBXrqAVuNE8Vdc?=
 =?iso-8859-1?Q?v897JYoUwUuUoL0eX4ixJCIBYQDOWi79C944qFknlAAU/1SpedQV3ASexN?=
 =?iso-8859-1?Q?NqfZ8+HtnW9gT52u697Bs9WbCboSy18N3CgWFTrQjCs2XKgR74S/XWxsdG?=
 =?iso-8859-1?Q?qJD3fEFl++U/b3T9EK4KVUrAK3YVK7xI9Wi9inlyhAPUhBLcxtTLBYKvPI?=
 =?iso-8859-1?Q?2p5YpMu5842pj9GyKJarPloaBW3QVHroeOi+uLCXtVgxAVkhBy+4yDnW+t?=
 =?iso-8859-1?Q?wmLzYi016REhbKLxejTUqRu6y9gIPwz3VKuJ2UHL0NZipWtB4/9sVsHSqY?=
 =?iso-8859-1?Q?EOfbibLRcp9bn2EnfNfEWnAi6Y94nb1tgzyMr8rXRrrbqPAJjVAPe+onEl?=
 =?iso-8859-1?Q?eQD8LCw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kUWXgPBNauLX2pQli4X3ydc/16mZ/05O8OnSH9J+MUwsN2Ap/5Ke+y+fS3?=
 =?iso-8859-1?Q?mPcRVPNm1IG9ooe0LUJzB53siw5q5oVDRNDsQrpueBjThNgjJwe3+aDGOY?=
 =?iso-8859-1?Q?YkEHuOtAhyBoHtbjtKSk3Xa6Z6Z34e9fsVrbZBcuJhqEeWwWUcUCLB4yZr?=
 =?iso-8859-1?Q?GkQLswH/hZ3OpaDTLEtgd2cSf0x4DsuT4TYn0zaHcvoyIcGZxgUNGYjGt1?=
 =?iso-8859-1?Q?UoTeWTikBWHnaeeOWrultqN4UGx40bqbKHjO0Dcy3ZGa96tNzc2/UhpZLd?=
 =?iso-8859-1?Q?NHIWcrsDrJ6iXDwFJ68PnwGxXNn1sXrULtmnXLZu9opXlhJPV39b38MsuA?=
 =?iso-8859-1?Q?BCznNiAJhsQN8thp3H1Nvv0zAiXZY4I5mCzWitJQKveS6Jpe/JVhzqk2eI?=
 =?iso-8859-1?Q?rn8PUqR3YtFNtYLwiHOG/Shdu0+lN+qdNEI3OOzhKvsviSMi0KE5P/5qPC?=
 =?iso-8859-1?Q?pOVZMMEUtJ4rTAG9BINvcb3iGtxLDHgW0P5urgA61MbmRShjvlJ4fD1W5T?=
 =?iso-8859-1?Q?FBvPoaxUVZOQl/QJaaAU9xNjhylIqrVdHIxg9/KmMXIIbvfAIgdyNh/ohj?=
 =?iso-8859-1?Q?WbjAMv3P6ngYLFiMLYaOARM+SvosA7qAmB71CAgY+ipU9trefmFFiQD/xh?=
 =?iso-8859-1?Q?O2KE/8Y5LJsCcjYDBj8UZlmIw1B+cc5qxs7rQpVJtSxrh0wiMs6lf+5Htv?=
 =?iso-8859-1?Q?KLE6TSOkTfq8IT7RVxtuof7wY7HMVts23kh7JMR57g+Ln5nxb0nh8zK8Fz?=
 =?iso-8859-1?Q?ZyHbVP08wSz7/AH1Uf3CsN1kFiueaZKl69x6Baq1urwW4DjgxAp0Mz/iPv?=
 =?iso-8859-1?Q?HPF38mO5lI+0+o+y9E+oKYECFywViDLYsqrMFgIhXInrdwVdO17mNqq8/K?=
 =?iso-8859-1?Q?mXQWrw3YUPCbT+MvBrxNZZV7PD/lqHFk0muaOePVqZA9EtkItRsU3NWHNX?=
 =?iso-8859-1?Q?Vadb2f7sG3OtcBsTRc78kuKXt4zVP6QOZRlL+GNkW/+wNVcj8+h24D/+qp?=
 =?iso-8859-1?Q?9VguVf6MT3aMLpt0WWaAtMTjKw88t1KETvjqK/9CC2AMoVGr65kUiNkWFC?=
 =?iso-8859-1?Q?hxjmv5fZ6mOJk0/oFHVtV+HqRAcHtzlAI0QPzMlXi3xnv0DnpIcuocvBL1?=
 =?iso-8859-1?Q?JvA4u9Pew/1BuOwIV84VlteclIquW0BJQMl6kbkIwMwU+w+IeeyJnadbmt?=
 =?iso-8859-1?Q?qjd1IRP+Q8qHnkuKF035mnUghkHIxHMmQn/ycFAXGCzn/Z/ZX2rFHEPVBZ?=
 =?iso-8859-1?Q?Vpw62ftudk6aeisU9Nq6J3QFYX5Teb3zJvmWxLI3LsoJ+LjK8Sf6DfSmYE?=
 =?iso-8859-1?Q?Y10tqXgDGXoU2iYCGUg1wHgUFHGST2wNWu8mcftX3mWe5bvekv7znz4XCB?=
 =?iso-8859-1?Q?rqcWnncbhrruxGbbecVcGuj54vCBCuNamrjupEeV/X+vfA0K7clfCo8bdI?=
 =?iso-8859-1?Q?mU4qVIgrO2ZG6iHR1paVmi1F8Hl6utYyYGLuWEf6iJxYBMgwDvXa/j4tpH?=
 =?iso-8859-1?Q?oEPIYhRYR7NKZ4YuXLysOFmkQgnIxn2vUG84rROkhMM2AHRte1f4Fhf5I1?=
 =?iso-8859-1?Q?jY3HE24VOf0Lq0Y+IhNHLHh+uMkK4Pvg1IUoI8pYEJIgUhtsEWQNlFwhJS?=
 =?iso-8859-1?Q?hzFh8hUu9fTvrlw0Gxi9nHfxQqdseq2uhA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe906e1-65e5-4a5a-6f99-08dda1e6561a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 15:01:21.5078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0I6ouBw52xs/IEAIOryW5H72egzCgJExqBHgymbnOi704mii/ZJ/0lp/6YaZsiEY+TGWidIXvErPhpq83Xsc1JE90y7mDZLrGEzNl49Wmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Saturday, May 31, 2025 1:29 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hdegoede@redhat.com>; De Marchi, Lucas
><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Subject: Re: [PATCH 04/10] platform/x86/intel: refactor endpoint usage
>
>On Fri, 30 May 2025, Michael J. Ruhl wrote:
>
>> The use of an endpoint has introduced a dependency
>> in all class/pmt drivers to have an endpoint allocated.
>>
>> The telemetry driver has this allocation, the crashlog
>> does not.
>>
>> The current usage is very telemetry focused, but should
>> be common code.
>>
>> With this in mind, rename the struct telemetry_endpoint
>> to struct class_endpoint. Refactor the common endpoint
>> code to be in the class.c module.
>
>All these lines look a bit short. Please reflow to 72 chars.

They are (short)... I have been limiting them to 60 chars...  Not sure why =
I have that limit...
I will fix.

Mike

>Also check if this isolated or is it a problem in other patches of this
>series too.
>
>
>The code changes looked fine.
>
>--
> i.
>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmc/core.c       |  3 +-
>>  drivers/platform/x86/intel/pmc/core.h       |  4 +-
>>  drivers/platform/x86/intel/pmc/core_ssram.c |  2 +-
>>  drivers/platform/x86/intel/pmt/class.c      | 45 ++++++++++++++++++
>>  drivers/platform/x86/intel/pmt/class.h      | 21 +++++++--
>>  drivers/platform/x86/intel/pmt/telemetry.c  | 51 ++++-----------------
>>  drivers/platform/x86/intel/pmt/telemetry.h  | 23 ++++------
>>  7 files changed, 84 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmc/core.c
>b/drivers/platform/x86/intel/pmc/core.c
>> index 7a1d11f2914f..805f56665d1d 100644
>> --- a/drivers/platform/x86/intel/pmc/core.c
>> +++ b/drivers/platform/x86/intel/pmc/core.c
>> @@ -29,6 +29,7 @@
>>  #include <asm/tsc.h>
>>
>>  #include "core.h"
>> +#include "../pmt/class.h"
>>  #include "../pmt/telemetry.h"
>>
>>  /* Maximum number of modes supported by platfoms that has low power
>mode capability */
>> @@ -1198,7 +1199,7 @@ int get_primary_reg_base(struct pmc *pmc)
>>
>>  void pmc_core_punit_pmt_init(struct pmc_dev *pmcdev, u32 guid)
>>  {
>> -	struct telem_endpoint *ep;
>> +	struct class_endpoint *ep;
>>  	struct pci_dev *pcidev;
>>
>>  	pcidev =3D pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(10, 0));
>> diff --git a/drivers/platform/x86/intel/pmc/core.h
>b/drivers/platform/x86/intel/pmc/core.h
>> index 945a1c440cca..1c12ea7c3ce3 100644
>> --- a/drivers/platform/x86/intel/pmc/core.h
>> +++ b/drivers/platform/x86/intel/pmc/core.h
>> @@ -16,7 +16,7 @@
>>  #include <linux/bits.h>
>>  #include <linux/platform_device.h>
>>
>> -struct telem_endpoint;
>> +struct class_endpoint;
>>
>>  #define SLP_S0_RES_COUNTER_MASK			GENMASK(31,
>0)
>>
>> @@ -432,7 +432,7 @@ struct pmc_dev {
>>
>>  	bool has_die_c6;
>>  	u32 die_c6_offset;
>> -	struct telem_endpoint *punit_ep;
>> +	struct class_endpoint *punit_ep;
>>  	struct pmc_info *regmap_list;
>>  };
>>
>> diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c
>b/drivers/platform/x86/intel/pmc/core_ssram.c
>> index 739569803017..3e670fc380a5 100644
>> --- a/drivers/platform/x86/intel/pmc/core_ssram.c
>> +++ b/drivers/platform/x86/intel/pmc/core_ssram.c
>> @@ -42,7 +42,7 @@ static u32 pmc_core_find_guid(struct pmc_info *list,
>const struct pmc_reg_map *m
>>
>>  static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc=
)
>>  {
>> -	struct telem_endpoint *ep;
>> +	struct class_endpoint *ep;
>>  	const u8 *lpm_indices;
>>  	int num_maps, mode_offset =3D 0;
>>  	int ret, mode;
>> diff --git a/drivers/platform/x86/intel/pmt/class.c
>b/drivers/platform/x86/intel/pmt/class.c
>> index 7233b654bbad..bba552131bc2 100644
>> --- a/drivers/platform/x86/intel/pmt/class.c
>> +++ b/drivers/platform/x86/intel/pmt/class.c
>> @@ -76,6 +76,47 @@ int pmt_telem_read_mmio(struct pci_dev *pdev,
>struct pmt_callbacks *cb, u32 guid
>>  }
>>  EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, "INTEL_PMT");
>>
>> +/* Called when all users unregister and the device is removed */
>> +static void pmt_class_ep_release(struct kref *kref)
>> +{
>> +	struct class_endpoint *ep;
>> +
>> +	ep =3D container_of(kref, struct class_endpoint, kref);
>> +	kfree(ep);
>> +}
>> +
>> +void intel_pmt_release_endpoint(struct class_endpoint *ep)
>> +{
>> +	kref_put(&ep->kref, pmt_class_ep_release);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(intel_pmt_release_endpoint, "INTEL_PMT");
>> +
>> +int intel_pmt_add_endpoint(struct intel_vsec_device *ivdev,
>> +			   struct intel_pmt_entry *entry)
>> +{
>> +	struct class_endpoint *ep;
>> +
>> +	ep =3D kzalloc(sizeof(*ep), GFP_KERNEL);
>> +	if (!ep)
>> +		return -ENOMEM;
>> +
>> +	ep->pcidev =3D ivdev->pcidev;
>> +	ep->header.access_type =3D entry->header.access_type;
>> +	ep->header.guid =3D entry->header.guid;
>> +	ep->header.base_offset =3D entry->header.base_offset;
>> +	ep->header.size =3D entry->header.size;
>> +	ep->base =3D entry->base;
>> +	ep->present =3D true;
>> +	ep->cb =3D ivdev->priv_data;
>> +
>> +	/* Endpoint lifetimes are managed by kref, not devres */
>> +	kref_init(&ep->kref);
>> +
>> +	entry->ep =3D ep;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(intel_pmt_add_endpoint, "INTEL_PMT");
>>  /*
>>   * sysfs
>>   */
>> @@ -97,6 +138,10 @@ intel_pmt_read(struct file *filp, struct kobject *ko=
bj,
>>  	if (count > entry->size - off)
>>  		count =3D entry->size - off;
>>
>> +	/* verify endpoint is available */
>> +	if (!entry->ep)
>> +		return -ENODEV;
>> +
>>  	count =3D pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry-
>>header.guid, buf,
>>  				    entry->base, off, count);
>>
>> diff --git a/drivers/platform/x86/intel/pmt/class.h
>b/drivers/platform/x86/intel/pmt/class.h
>> index b2006d57779d..d2d8f9e31c9d 100644
>> --- a/drivers/platform/x86/intel/pmt/class.h
>> +++ b/drivers/platform/x86/intel/pmt/class.h
>> @@ -9,8 +9,6 @@
>>  #include <linux/err.h>
>>  #include <linux/io.h>
>>
>> -#include "telemetry.h"
>> -
>>  /* PMT access types */
>>  #define ACCESS_BARID		2
>>  #define ACCESS_LOCAL		3
>> @@ -19,11 +17,19 @@
>>  #define GET_BIR(v)		((v) & GENMASK(2, 0))
>>  #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
>>
>> +struct kref;
>>  struct pci_dev;
>>
>> -struct telem_endpoint {
>> +struct class_header {
>> +	u8	access_type;
>> +	u16	size;
>> +	u32	guid;
>> +	u32	base_offset;
>> +};
>> +
>> +struct class_endpoint {
>>  	struct pci_dev		*pcidev;
>> -	struct telem_header	header;
>> +	struct class_header	header;
>>  	struct pmt_callbacks	*cb;
>>  	void __iomem		*base;
>>  	bool			present;
>> @@ -38,7 +44,7 @@ struct intel_pmt_header {
>>  };
>>
>>  struct intel_pmt_entry {
>> -	struct telem_endpoint	*ep;
>> +	struct class_endpoint	*ep;
>>  	struct intel_pmt_header	header;
>>  	struct bin_attribute	pmt_bin_attr;
>>  	struct kobject		*kobj;
>> @@ -69,4 +75,9 @@ int intel_pmt_dev_create(struct intel_pmt_entry
>*entry,
>>  			 struct intel_vsec_device *dev, int idx);
>>  void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
>>  			   struct intel_pmt_namespace *ns);
>> +
>> +int intel_pmt_add_endpoint(struct intel_vsec_device *ivdev,
>> +			   struct intel_pmt_entry *entry);
>> +void intel_pmt_release_endpoint(struct class_endpoint *ep);
>> +
>>  #endif
>> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
>b/drivers/platform/x86/intel/pmt/telemetry.c
>> index ac3a9bdf5601..27d09867e6a3 100644
>> --- a/drivers/platform/x86/intel/pmt/telemetry.c
>> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/overflow.h>
>>
>>  #include "class.h"
>> +#include "telemetry.h"
>>
>>  #define TELEM_SIZE_OFFSET	0x0
>>  #define TELEM_GUID_OFFSET	0x4
>> @@ -93,48 +94,14 @@ static int pmt_telem_header_decode(struct
>intel_pmt_entry *entry,
>>  	return 0;
>>  }
>>
>> -static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
>> -				  struct intel_pmt_entry *entry)
>> -{
>> -	struct telem_endpoint *ep;
>> -
>> -	/* Endpoint lifetimes are managed by kref, not devres */
>> -	entry->ep =3D kzalloc(sizeof(*(entry->ep)), GFP_KERNEL);
>> -	if (!entry->ep)
>> -		return -ENOMEM;
>> -
>> -	ep =3D entry->ep;
>> -	ep->pcidev =3D ivdev->pcidev;
>> -	ep->header.access_type =3D entry->header.access_type;
>> -	ep->header.guid =3D entry->header.guid;
>> -	ep->header.base_offset =3D entry->header.base_offset;
>> -	ep->header.size =3D entry->header.size;
>> -	ep->base =3D entry->base;
>> -	ep->present =3D true;
>> -	ep->cb =3D ivdev->priv_data;
>> -
>> -	kref_init(&ep->kref);
>> -
>> -	return 0;
>> -}
>> -
>>  static DEFINE_XARRAY_ALLOC(telem_array);
>>  static struct intel_pmt_namespace pmt_telem_ns =3D {
>>  	.name =3D "telem",
>>  	.xa =3D &telem_array,
>>  	.pmt_header_decode =3D pmt_telem_header_decode,
>> -	.pmt_add_endpoint =3D pmt_telem_add_endpoint,
>> +	.pmt_add_endpoint =3D intel_pmt_add_endpoint,
>>  };
>>
>> -/* Called when all users unregister and the device is removed */
>> -static void pmt_telem_ep_release(struct kref *kref)
>> -{
>> -	struct telem_endpoint *ep;
>> -
>> -	ep =3D container_of(kref, struct telem_endpoint, kref);
>> -	kfree(ep);
>> -}
>> -
>>  unsigned long pmt_telem_get_next_endpoint(unsigned long start)
>>  {
>>  	struct intel_pmt_entry *entry;
>> @@ -155,7 +122,7 @@ unsigned long
>pmt_telem_get_next_endpoint(unsigned long start)
>>  }
>>  EXPORT_SYMBOL_NS_GPL(pmt_telem_get_next_endpoint,
>"INTEL_PMT_TELEMETRY");
>>
>> -struct telem_endpoint *pmt_telem_register_endpoint(int devid)
>> +struct class_endpoint *pmt_telem_register_endpoint(int devid)
>>  {
>>  	struct intel_pmt_entry *entry;
>>  	unsigned long index =3D devid;
>> @@ -174,9 +141,9 @@ struct telem_endpoint
>*pmt_telem_register_endpoint(int devid)
>>  }
>>  EXPORT_SYMBOL_NS_GPL(pmt_telem_register_endpoint,
>"INTEL_PMT_TELEMETRY");
>>
>> -void pmt_telem_unregister_endpoint(struct telem_endpoint *ep)
>> +void pmt_telem_unregister_endpoint(struct class_endpoint *ep)
>>  {
>> -	kref_put(&ep->kref, pmt_telem_ep_release);
>> +	intel_pmt_release_endpoint(ep);
>>  }
>>  EXPORT_SYMBOL_NS_GPL(pmt_telem_unregister_endpoint,
>"INTEL_PMT_TELEMETRY");
>>
>> @@ -206,7 +173,7 @@ int pmt_telem_get_endpoint_info(int devid, struct
>telem_endpoint_info *info)
>>  }
>>  EXPORT_SYMBOL_NS_GPL(pmt_telem_get_endpoint_info,
>"INTEL_PMT_TELEMETRY");
>>
>> -int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32
>count)
>> +int pmt_telem_read(struct class_endpoint *ep, u32 id, u64 *data, u32
>count)
>>  {
>>  	u32 offset, size;
>>
>> @@ -226,7 +193,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32
>id, u64 *data, u32 count)
>>  }
>>  EXPORT_SYMBOL_NS_GPL(pmt_telem_read, "INTEL_PMT_TELEMETRY");
>>
>> -int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32
>count)
>> +int pmt_telem_read32(struct class_endpoint *ep, u32 id, u32 *data, u32
>count)
>>  {
>>  	u32 offset, size;
>>
>> @@ -245,7 +212,7 @@ int pmt_telem_read32(struct telem_endpoint *ep,
>u32 id, u32 *data, u32 count)
>>  }
>>  EXPORT_SYMBOL_NS_GPL(pmt_telem_read32, "INTEL_PMT_TELEMETRY");
>>
>> -struct telem_endpoint *
>> +struct class_endpoint *
>>  pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid,
>u16 pos)
>>  {
>>  	int devid =3D 0;
>> @@ -279,7 +246,7 @@ static void pmt_telem_remove(struct
>auxiliary_device *auxdev)
>>  	for (i =3D 0; i < priv->num_entries; i++) {
>>  		struct intel_pmt_entry *entry =3D &priv->entry[i];
>>
>> -		kref_put(&entry->ep->kref, pmt_telem_ep_release);
>> +		pmt_telem_unregister_endpoint(entry->ep);
>>  		intel_pmt_dev_destroy(entry, &pmt_telem_ns);
>>  	}
>>  	mutex_unlock(&ep_lock);
>> diff --git a/drivers/platform/x86/intel/pmt/telemetry.h
>b/drivers/platform/x86/intel/pmt/telemetry.h
>> index d45af5512b4e..e987dd32a58a 100644
>> --- a/drivers/platform/x86/intel/pmt/telemetry.h
>> +++ b/drivers/platform/x86/intel/pmt/telemetry.h
>> @@ -2,6 +2,8 @@
>>  #ifndef _TELEMETRY_H
>>  #define _TELEMETRY_H
>>
>> +#include "class.h"
>> +
>>  /* Telemetry types */
>>  #define PMT_TELEM_TELEMETRY	0
>>  #define PMT_TELEM_CRASHLOG	1
>> @@ -9,16 +11,9 @@
>>  struct telem_endpoint;
>>  struct pci_dev;
>>
>> -struct telem_header {
>> -	u8	access_type;
>> -	u16	size;
>> -	u32	guid;
>> -	u32	base_offset;
>> -};
>> -
>>  struct telem_endpoint_info {
>>  	struct pci_dev		*pdev;
>> -	struct telem_header	header;
>> +	struct class_header	header;
>>  };
>>
>>  /**
>> @@ -47,7 +42,7 @@ unsigned long
>pmt_telem_get_next_endpoint(unsigned long start);
>>   * * endpoint    - On success returns pointer to the telemetry endpoint
>>   * * -ENXIO      - telemetry endpoint not found
>>   */
>> -struct telem_endpoint *pmt_telem_register_endpoint(int devid);
>> +struct class_endpoint *pmt_telem_register_endpoint(int devid);
>>
>>  /**
>>   * pmt_telem_unregister_endpoint() - Unregister a telemetry endpoint
>> @@ -55,7 +50,7 @@ struct telem_endpoint
>*pmt_telem_register_endpoint(int devid);
>>   *
>>   * Decrements the kref usage counter for the endpoint.
>>   */
>> -void pmt_telem_unregister_endpoint(struct telem_endpoint *ep);
>> +void pmt_telem_unregister_endpoint(struct class_endpoint *ep);
>>
>>  /**
>>   * pmt_telem_get_endpoint_info() - Get info for an endpoint from its de=
vid
>> @@ -80,8 +75,8 @@ int pmt_telem_get_endpoint_info(int devid, struct
>telem_endpoint_info *info);
>>   * * endpoint    - On success returns pointer to the telemetry endpoint
>>   * * -ENXIO      - telemetry endpoint not found
>>   */
>> -struct telem_endpoint *pmt_telem_find_and_register_endpoint(struct
>pci_dev *pcidev,
>> -				u32 guid, u16 pos);
>> +struct class_endpoint *pmt_telem_find_and_register_endpoint(struct
>pci_dev *pcidev,
>> +							    u32 guid, u16 pos);
>>
>>  /**
>>   * pmt_telem_read() - Read qwords from counter sram using sample id
>> @@ -101,7 +96,7 @@ struct telem_endpoint
>*pmt_telem_find_and_register_endpoint(struct pci_dev *pcid
>>   * * -EPIPE      - The device was removed during the read. Data written
>>   *                 but should be considered invalid.
>>   */
>> -int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32
>count);
>> +int pmt_telem_read(struct class_endpoint *ep, u32 id, u64 *data, u32
>count);
>>
>>  /**
>>   * pmt_telem_read32() - Read qwords from counter sram using sample id
>> @@ -121,6 +116,6 @@ int pmt_telem_read(struct telem_endpoint *ep, u32
>id, u64 *data, u32 count);
>>   * * -EPIPE      - The device was removed during the read. Data written
>>   *                 but should be considered invalid.
>>   */
>> -int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32
>count);
>> +int pmt_telem_read32(struct class_endpoint *ep, u32 id, u32 *data, u32
>count);
>>
>>  #endif
>>
