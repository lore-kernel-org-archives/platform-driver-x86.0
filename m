Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307B3F2116
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001376; cv=fail; b=Lo55dBK31LkdruPu49fNTLfwa/HZkE5nrVTYGbrGhqWHNeEwoQbrd01Zamvwi6G9u2FgU98dFy5F0TpE8ysXtMcWIH7wVsfjGVOATUttMYOTAwrnQ+iwy1CQC0NY3ddGWUXcaSikcjJEYn49FNWVJP07p3Qw7EihqUrVybDa97c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001376; c=relaxed/simple;
	bh=0KqMHukxOqcfTBiEuylXp/rCX5kdaZlvDWcme2g8OyQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o/J4EHdUChYVmEpRGYOxGOgoxck3yA2bLZq+23QRk7+cZoUHE6eVmByfS+QffXMSOvDq/5k0Ve0A15bwXlYfpKxoP75c4M35tfK+lIcg54wlSiFYoFa5BliTfZvK8FaXjPhcQc4Ic0pE32IMxuNyRktoW/6ro+wGtxbUzvZqrfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neBizb5z; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neBizb5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792001375; x=1823537375;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0KqMHukxOqcfTBiEuylXp/rCX5kdaZlvDWcme2g8OyQ=;
  b=neBizb5znPE45l3Mbcs9DKeUp9BYatzT9USzzZPejGsDS21xgbbAtUEA
   +CTpHeCW0ZW0WrC4aTVQ6qwLD1m2KZjQTqIYSfT7Xa4PxWaRpSzneGcn5
   vq+uCXEMXOB5iMpumAyXqxzveFW+9WUQKsWUsaWNrOZinmFOqjgPE5S8G
   Yl7khzPTPl6iYBVmoFWJ3FdjufkEX9aiJDElUeVrVU/jbb1lzdMSOcfUy
   1Ycyqg2xbybZQ8R9jYQdxunfPREDp2ymsRag+1oWMoI/OEqMz7AJHzabl
   CuiwkUWWpW8PqsjD68sp+ARxkh+Nz/GBs9rx+YrPtF00yfh4lb4+NepvZ
   A==;
X-CSE-ConnectionGUID: ZOXa/cnFTfG0+8kixaOzyg==
X-CSE-MsgGUID: VJUnP33rRwCoy+pO1KWQ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="862590"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="862590"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:09:35 -0700
X-CSE-ConnectionGUID: uldfusAXRTGLSDAhuWvvng==
X-CSE-MsgGUID: XHuLr5nBRku/NKqFUWgSyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1379150"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:09:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:09:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 11:09:19 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:09:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caSnQITmDds31wafqwccPgbYDjHXXk6ZwPZgoCqv+2+15xzNbQAE21NZ3b6pytkjnnwacJI7qCMDZHmdXFvV7vczQ5ubZAzNPQSddSsn4jKvxiYLqgBqpkdjNndO+oET25RkpHV5ptCA5o4WRbL+qyz5aEfb6MhXru4hpLXCkpLlemcBk2xXtqYkc5UxqdWr5pXw0s8AqRzHqecaOpqIRBC/2zZr1bH/UgwRGnf/lEZMInFCNjoh8/eYOuY2gnGcpZ7BujEQWvQ5uc8au91rqFZ7gerRPRIkirm4kC3QxwLLhW0+wtP+iOEv+dvobEQkamYNUzEmV9mZrIHQcJoF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWx0B1yR1RJ8xotcgDm3wCyfxDknhqw9saaWkEzkZbY=;
 b=byaAICe9KchxFH90lxi3R622X8WVnUd36fV82Pk961j18MXAGap/QOWKRpkbqLy4CcoAQllRSDjgf1SYcUl8MieuhyyEqLQ3D4npuGTglh2nb5nMGEiJD4ASO1rIXn5L3XbmSlKQ3BaIfBHh2Zc436goQRo/fMcB9U78suNJSnUU1dDPWSPUE9w0a6Aq5IBElhWrjMuivAP4BlAkgOkaaobLdC4BPszSdJdZdyq7J/86UQBSYLLJDpsDQTfZiZXRDVZzu1Jvn+PUdjcxHLQs2M2zTKo46jQRckKufYE798fsbclVpW9kp52AKM20xvlbsAzAOzRHjKmRlgwUCJl8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS6PR11MB455487.namprd11.prod.outlook.com (2603:10b6:8:52c::18)
 by PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 18:09:14 +0000
Received: from DS6PR11MB455487.namprd11.prod.outlook.com
 ([fe80::26b2:d932:d78d:d43a]) by DS6PR11MB455487.namprd11.prod.outlook.com
 ([fe80::26b2:d932:d78d:d43a%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 18:09:14 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>,
	"Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v12 21/21] drm/xe/vsec: Support survivability mode for CRI
Thread-Topic: [PATCH v12 21/21] drm/xe/vsec: Support survivability mode for
 CRI
Thread-Index: AQHdW1yf1Va6uLlR/kyA/E9WwIIHrrb9TAoAgAALLMA=
Date: Wed, 14 Oct 2026 18:09:14 +0000
Message-ID: <DS6PR11MB455487FEEF8BDF772EF19B373FC19D2@DS6PR11MB455487.namprd11.prod.outlook.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
 <20261013214655.3502964-44-michael.j.ruhl@intel.com>
 <as-7qpao6I_xfW6e@intel.com>
In-Reply-To: <as-7qpao6I_xfW6e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB455487:EE_|PH0PR11MB5032:EE_
x-ms-office365-filtering-correlation-id: 7019fa26-7cbd-4355-7504-08df2a1e41ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|10067099003|22082099003|11063799006|4143699003|261009223027099003|56012099006|38070700021;
x-microsoft-antispam-message-info: Lnfr6gbIhY8e/fJBwoieNXLK5JjMZw9yJMb0StmY3WJVhX7ieKFSS1kZJhDJoKpuE7XAF48YVzWkYlAGE4CF/LBHQJ2tMr9i7tK0FPsiM/spK0Je2rd2DUHulDMFji3jGH6mXmuu4DJwkyA0OVruAaS/nMAWW/WLhs4gXuLvs8IzRHxDUVdPp9M6HfGJ6dix+4sP4eOyPVU5YEa4RQO5eMQkNAvIslb2IeaJjDs8yHAUuohzoRDz89xmRbvM3Cg0Jw76NrEavMyGTyqc11/rbYlGegTmFflkZDmd6W7lf13+GNYvuVhPTyDoJPMuyUI3Y7Ad3/DA8WU8cHNZ7j6WhSdXEGTEiNpKG80LUilFBmbQBxVPzWxZX3BHxLgR1Hk6/HOaRoo6hVVZP+atrRjI5J7gHZTzvCZMVlCRBP4+u8SiMGeOMQVxEvrw4Ux6vp15XuVyHnSuhB22CvFp7natSy9aZeiCiXA0aRkVHkvfUk7y+0xQf5WUFkET0r6OwtPmCz5tM5qjH5uU4WAV/U0GG5c4oRQ90upgFyN9NK78lf59yDSUuONdSAkHXvzcDyNrNRUKV/bVughqb9vsQt2WNY/8C2qqJ3+G83hTZC5ZHuLNCWC03DxyDFrGDGTpgkuNgtVzzyI9SwJ1hF+iaiFdDwlN6J1huST+Ay2U7yJBrCAXEz4AbDvWCil0ukD/MQAKUsWNrVI6HCpW25jbeTwvEfrMoFBRx4dFna1+CTzV15w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB455487.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qGsLZsgRS/o5DjbeEegwbWaBKqoWpWm10VieroeNUa+G17Uk+pQd2wXFkU9L?=
 =?us-ascii?Q?AahQj8ly4fZDsLbDfnUssY63d3EEzl/XfS+lQDrZEHsOGQa1nQnxx2CCnd54?=
 =?us-ascii?Q?U8avtVb1j7UNc+VDwenEDaarYkJH7RMNhCJCnl+nMjHYuvZWE+VtCCtNdZOG?=
 =?us-ascii?Q?85bfmyqAvbo6GSs99lR3Ggesbw1i4IyJOZIYj5JjGGvvKo39o9Ile8JYx/ii?=
 =?us-ascii?Q?z5ENZTs2kbi/F+X4ioMH8Vv4MJj0qzTkpxc1kNXSLGKicn8PdxojYdtn/k/y?=
 =?us-ascii?Q?lvVf7GvPRZgCpLgrhVMTuIDnF4qMbb/w7eSB2Hz3EsZTzkCqU4q/tUiEsZ2z?=
 =?us-ascii?Q?2zs4fSEClB+fh5fvkp1MKo3GoitScSauR8MiwfKuGqrtpB7ONMpXVr+2LxWP?=
 =?us-ascii?Q?gGO8NV5YhDrXPdnN37ZyEol/dY+8HS/nouiPp/XTGKF/7FbPu7gxSTHIq6nJ?=
 =?us-ascii?Q?QtjVOMitLCrSN8sJbv8Xq51++sHmJvAWK+SG4AzkFFhofQR9zftGO3GebJN7?=
 =?us-ascii?Q?/QzJ3uitgzGNZ5gC3znY+Lxs/bfdF/LITQTMNR/RSsYMTFpskuwmIb1WMkX/?=
 =?us-ascii?Q?Dmxfu6hiSXx8vbcHY3I2asJeN58HIMY78gQ9ZLc7BscDIfhmsv1dbgerkC32?=
 =?us-ascii?Q?He5Q+HYH9SU2cuSwVfw5WCAIcr2NRmIQ/XBacz16zTFXELvK4luBOuTz2riM?=
 =?us-ascii?Q?e0W8PqFKL+Gf5GQEVKRWEIS5U5SPdvwWoYao+4HmmyIQHPSif5CfMRwDM2Wc?=
 =?us-ascii?Q?crxAAlsd6jJtndHjgQw6Ahx6O497VDKR4L04zDZcFILJsY2+VG6iqWzTamnq?=
 =?us-ascii?Q?jl0JJK/ygCPKrloPOIIlfnd6ZN4JDIeIcygsiGITmmBWC37pUFGzN+uxfJQj?=
 =?us-ascii?Q?YSXHSMbswY9f25DdFiVW5noG1rysdamXPqmMEkBZvZz85hloio7V4Zfq15nG?=
 =?us-ascii?Q?vnK4PMYjJUP5j8j3Yxa7o0caQfaMMzDBcqtmQu0N5A8B+MAfJ88Lfd4P0rAT?=
 =?us-ascii?Q?7l0kNqUMv/vjIRMWQMzVLd6b6SFc5zDKUI3r2bHzVdvKJK6usWs6ClwY/pU7?=
 =?us-ascii?Q?rPZMFlx0ud4xXucDDtxJEG4I0a+4k9ohPKZPg7RoiDD3PxHQYLP75AUGHmdx?=
 =?us-ascii?Q?rbHZtgn7zluIoNWPjMNka9ZZ+YwX3uqiu0WYvQIDnkJxvvURVxq/eTIR+Bpm?=
 =?us-ascii?Q?5IeNLMcnQ2vyu10sbeLeeajjmddCZWQp5/98DEyLDVPG0QuK4j6y8npfaf9A?=
 =?us-ascii?Q?HLd9er09rrr+QOEzSf1otwwq4gwFDNpmlptr8UGSx9bdgKJNTqket/eO1X7a?=
 =?us-ascii?Q?WS+SmvDthB+C9Q3YS9UqcDy+qXhvWO0oTbbiQiflQBvqYY4Je2F+mnwPlhUS?=
 =?us-ascii?Q?bDGD8STcfyMLsEvsItSmzTTbcKPLlJYXvaRxpRC7DHQO7yWs8+yscfKNc9L2?=
 =?us-ascii?Q?BtG/XsBkhU9MzObbinKUc0w6Bs8xFsvX2CYQ/RlkQ6J5pazZSM1yolxY2VBm?=
 =?us-ascii?Q?5gO3BKjPVV0SUKMHfhx5OjlAMRJWoaUjlJXEHtIVRsK3vaT8/8DJqLmENbji?=
 =?us-ascii?Q?xHYNx7CMCac1Xax7c4JtGqs+truC1KpE1ueKDZd+5EjPszKF3P8L32LVIHjv?=
 =?us-ascii?Q?2bBQJlBpyqRxCBOVadkuXSeIZ8z3i6NSY2B+hrDoIXGp4bQSDKqs5SkiCGJa?=
 =?us-ascii?Q?j2zWjmvaQNdb4bBYX1T/I/pUKTsY3XE0FO6vETv+W3bAtc2VRrr3yWxy5m55?=
 =?us-ascii?Q?H1vf8vO4tQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2/X3z0RSnD614KSd6TsjcHhiSCx1TlmVw1+o4/gC4Lm066/8v4HRZnD3nJY+b8k4O1Z+CFNKVyHfdlpPY0hWNAf9uwCkHL6OyGHqd2lnE4RCPfxf4fxkrrekADCOfjlbA9m1lmcQVCYHQDhNvLl77wNPR1a6eZezLfQzcTva9xgF+vuuZtFteJJUA2B+yMmBzRIMdEZ1KoL44JUHTZ7jhVI+81EIDGZ8JCU3KybIKF4Vo27uFZBq6Z1trH9BBrRyrDFe+c7oMcljOaKkX1qmBHccc1gaYCSTQtOWaFTgZAqNJHGoxpcXtbuEJ2E5N4jQqRI/xFAmJ5X7ws5Jcu+F1w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB455487.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7019fa26-7cbd-4355-7504-08df2a1e41ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 18:09:14.8772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3N2BVpZWsmd6Wz+sSwn1JVww1iUofZ8/QPCNNHge3QPUAZ6Pd1ZNTbjbw48o514Hel+fkC6D9IwPMs6AZkOa6pECnpidX/+XZSKVsklPbdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Wednesday, October 14, 2026 1:28 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v12 21/21] drm/xe/vsec: Support survivability mode for
>CRI
>
>On Tue, Oct 13, 2026 at 02:47:14PM -0700, Michael J. Ruhl wrote:
>> For survivability mode, CRI can only support access to the
>> PUNIT CRASHLOG PMT function.
>>
>> Create a special config to support survivability mode.
>>
>
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thank you.

>but let's refrain for further submissions and wait the base pmt patches
>to be merged to Linus tree and propagated to drm-next and drm-xe-next,
>then we rebase and resubmit.

Got it.  If I have further patches, I will start a new patch set.

M

>Thanks,
>Rodrigo.
>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_survivability_mode.c |  2 ++
>>  drivers/gpu/drm/xe/xe_vsec.c               | 34 +++++++++++++++++++++-
>>  2 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
>b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 45d44ebe288b..f08e76d02054 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -19,6 +19,7 @@
>>  #include "xe_nvm.h"
>>  #include "xe_pcode_api.h"
>>  #include "xe_printk.h"
>> +#include "xe_soc_remapper.h"
>>  #include "xe_vsec.h"
>>
>>  /**
>> @@ -351,6 +352,7 @@ static int enable_boot_survivability_mode(struct
>pci_dev *pdev)
>>
>>  	xe_heci_gsc_init(xe);
>>
>> +	xe_soc_remapper_init(xe);
>>  	xe_vsec_init(xe);
>>
>>  	if (survivability->fdo_mode) {
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 1ed904ec1496..6d4ef9cb9f60 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -101,10 +101,26 @@ static struct intel_vsec_header *cri_capabilities[=
] =3D
>{
>>  	NULL
>>  };
>>
>> +static struct intel_vsec_header cri_survivability_crashlog =3D {
>> +	.rev =3D 1,
>> +	.length =3D SZ_16,
>> +	.id =3D VSEC_ID_CRASHLOG,
>> +	.num_entries =3D 1,
>> +	.entry_size =3D 6,
>> +	.tbir =3D 0,
>> +	.offset =3D CRI_PMT_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
>> +};
>> +
>> +static struct intel_vsec_header *cri_survivability_capabilities[] =3D {
>> +	&cri_survivability_crashlog,
>> +	NULL
>> +};
>> +
>>  enum xe_vsec {
>>  	XE_VSEC_UNKNOWN =3D 0,
>>  	XE_VSEC_BMG,
>>  	XE_VSEC_CRI,
>> +	XE_VSEC_CRI_SURVIVABILITY,
>>  };
>>
>>  static struct intel_vsec_platform_info xe_vsec_info[] =3D {
>> @@ -116,6 +132,10 @@ static struct intel_vsec_platform_info xe_vsec_info=
[]
>=3D {
>>  		.caps =3D VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
>>  		.headers =3D cri_capabilities,
>>  	},
>> +	[XE_VSEC_CRI_SURVIVABILITY] =3D {
>> +		.caps =3D VSEC_CAP_CRASHLOG,
>> +		.headers =3D cri_survivability_capabilities,
>> +	},
>>  	{ }
>>  };
>>
>> @@ -316,9 +336,10 @@ static void cri_late_bind_probe_work(struct
>work_struct *work)
>>
>>  static bool wait_for_fw(struct xe_device *xe)
>>  {
>> +	struct xe_survivability *survivability =3D &xe->survivability;
>>  	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>>
>> -	if (xe->info.platform !=3D XE_CRESCENTISLAND)
>> +	if (xe->info.platform !=3D XE_CRESCENTISLAND || survivability->mode)
>>  		return true;
>>
>>  	while (retries--) {
>> @@ -534,6 +555,8 @@ static const int vsec_platforms[] =3D {
>>
>>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>>  {
>> +	struct xe_survivability *survivability =3D &xe->survivability;
>> +
>>  	if (xe->info.platform > XE_CRESCENTISLAND)
>>  		return XE_VSEC_UNKNOWN;
>>
>> @@ -542,6 +565,9 @@ static enum xe_vsec get_platform_info(struct
>xe_device *xe)
>>  	     xe->info.platform =3D=3D XE_CRESCENTISLAND))
>>  		return XE_VSEC_UNKNOWN;
>>
>> +	if (survivability->mode && xe->info.platform =3D=3D XE_CRESCENTISLAND)
>> +		return XE_VSEC_CRI_SURVIVABILITY;
>> +
>>  	return vsec_platforms[xe->info.platform];
>>  }
>>
>> @@ -668,6 +694,12 @@ int xe_vsec_init(struct xe_device *xe)
>>  		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>>  		break;
>>
>> +	case XE_VSEC_CRI_SURVIVABILITY:
>> +		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
>> +		info->priv_data =3D &xe_cri_pmt_cb;
>> +		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>> +		break;
>> +
>>  	default:
>>  		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>>  		return 0;
>> --
>> 2.43.0
>>
