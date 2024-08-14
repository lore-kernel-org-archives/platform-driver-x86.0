Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6091C4607
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723668516; cv=fail; b=OOheLU69mYummW3NAGdPSExKpYpwoVgso80lG+RHS7bBMm1HEwKllgJrIPGmC/CV5k8ZKTu6zi3mUUn0eKFjWVKhqmvoHUgWSM0KPT/FlaMfbzY4SuHPxFNmXdZrtqi7hvk7gM8nJNOtWff90TvoJnGvGumaaqBkwEGpPlG8SdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723668516; c=relaxed/simple;
	bh=1yQrV6i2osBwODZ/nDChH4TrvaqUsYxldj5bJz5Z9mg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K0/WGbMQfi+OQFwGyIch9rWeMoOOUudmNUXsx2U2NA2/Z/5/MzwRjmbrjdFI7nLygZSVdygkBlfWRwE1Zl7ugiEzNA1qfOUF4oWr5UY2YSFxrXQ1HsYUG3stnzbZNRqHAvDtFh0/PSE4CiKkQX/irj9dp7kU2HKbAth6P5ylUd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRagaUyy; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRagaUyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723668513; x=1755204513;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1yQrV6i2osBwODZ/nDChH4TrvaqUsYxldj5bJz5Z9mg=;
  b=HRagaUyyEoaYHoTCtMMTNji8gj94P/4FlTKh3Mb74+qQiXKPB0vYQaPe
   xOx2UWr/VbFmwBdZ37+TmWlRRdbVzv9LLHrlXIZI6i3gOrM10b65s2fQv
   LLJmj3z/dxlfrxaga+ykEB0q0q1HvUkn89lyn0inxdOQy8ICCKDxGg4kL
   PNZmPbL7Zd8NP9IJwRjFTn92hmpnCFlOh2bIhqB/WNCSDtWidSR6lWy8U
   tnNHsoOnMBRXz1Lwmsp2Z4p4S19Tie9GavtWtxUikJXqJVyuY6NkiUUSq
   JvlrBEre1o8mM24Ykp0Sm1ZrD45iPlJBRAgXuuGyGDzBxypD6GoJ6toan
   w==;
X-CSE-ConnectionGUID: 7iiOZ7PFRAKjEaqeOuBCsg==
X-CSE-MsgGUID: HiwTHodZR9Kcn6OD40QpTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21768652"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21768652"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 13:47:32 -0700
X-CSE-ConnectionGUID: 46IHCx7ZSq+4ehWBZ0On2w==
X-CSE-MsgGUID: Hzo8eqYRRTGb0dCBHb2ZpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="58768105"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Aug 2024 13:47:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 13:47:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 13:47:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 13:47:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 13:47:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trAWDP6tiMpMeArTWsgVrTUwvljZBfO37qsG0X4PPcRo+y/WHVhblPUjSYB4cuEzyoCiVPiFK0BRV5OtZeXsPgu5OtEDkU+salG+PE/P6eo2KpShKf3dedtfFNgT+gMzcDihpcsTMNKEKq9PH846ZeDbwVU1D2zJ5BQ/wy1VsiLxlmvelt5WooYhOtP4uk+blPIarUa87wIqoMwpzKnwCb4jMduhI4O0/NvuPSJFR9yovoIZEoIs08yqSTClg4leY90VJEAk4T0mCUwcjxclL3PnfDOt+Q3qUcplWeF5hn5ptj/s7jIhRHxe4pcoHtJcGr5yO/vRhxsH3Zc3hIua1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOQYM7Hih6/u3nK3Wma9nlVjKlvDWI9dI0HKCftDqBg=;
 b=d91Al2CuIU7usDKSdzV2Cp1KCaHGdZDYGsvMy04fcSQdnmuWrFtsVm6ZMvH5EYvWCiyPaPz1O12KeaRomCO3jGVR76dxtcmCyVwlBzKPs7pXdZ8zTW/ACmW9ZjoWSXZcnrYgRYIYwPKdsjmsSu2JKPaXyfxel9mBdETs+HrlOilMvg0LLDeFejPaLMPssCpV+l+W72pZco1x0WLLDM3q3Lk9RM238HHnk97gJXRqqF1FgfZjf9zJ+W1HrlfbLfyjFFLsIOYYkRn1/6O1ScP2XIEeU4LcubGCHJ3fyNvPM8isRJRLmpIPYWUQcxLvZjIILKM12bDL1YzdhiGOuCGO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA1PR11MB6807.namprd11.prod.outlook.com (2603:10b6:806:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Wed, 14 Aug
 2024 20:47:28 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 20:47:28 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v11] drm/xe/vsec: Support BMG devices
Thread-Topic: [PATCH v11] drm/xe/vsec: Support BMG devices
Thread-Index: AQHa7PLeMjbADDlLS0q8Q7oONLxOFbIlO12AgAAApZCAAY2TAIAALGwQgAAjPYCAACHfgA==
Date: Wed, 14 Aug 2024 20:47:28 +0000
Message-ID: <IA1PR11MB641878A813B6D2EC044BD28FC1872@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
 <Zrtpd_WwougszltH@smile.fi.intel.com>
 <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
 <Zry3hOBb_fHbvlIN@smile.fi.intel.com>
 <IA1PR11MB64182DD2B8D803A48D592D62C1872@IA1PR11MB6418.namprd11.prod.outlook.com>
 <Zrz6V7iLFtnunMju@smile.fi.intel.com>
In-Reply-To: <Zrz6V7iLFtnunMju@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA1PR11MB6807:EE_
x-ms-office365-filtering-correlation-id: 0e272c28-98a5-4405-6431-08dcbca24f58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QyhsfGvwosTcuPxAkV4blWjA+HPQ6dFK0uD8bQANpJ5nBP7WYkA4T9/9BkWR?=
 =?us-ascii?Q?+JHPeV8HEsxxCCTft5cq0Ls7JnyS1oqh19M5CpRxmkhQyY4am5GBuFJPrXdq?=
 =?us-ascii?Q?/fHVaDinL2T4KaHuxJrK7W9lPq+u8CRha/UMS4dmBY3OxVd4WMQhxghIdGQq?=
 =?us-ascii?Q?T/QfDtAZBB4w8Zd+ONvyDUz0TKpMjrlku87VZmQ4uwbonsU2w4EgHaUHPONH?=
 =?us-ascii?Q?u201S6EUhE2SaCSibsd2hcYJHKpFaRqyIwcD7PcF9V9Ecz7b28/6wsqS8//v?=
 =?us-ascii?Q?0LsmNv1TVZrUZZmjfrqykGnQDdU05Deq3pgwIsKhzec82fh5sfbavHd9luy8?=
 =?us-ascii?Q?OPQ+wt6TFKMuaLLs2rMIewOIBCxBJKfo8U45svTWDDQZdtwuu4XATkHOBRHm?=
 =?us-ascii?Q?edr4+Sriplh0LGIN/vGdHYQj+yvwFG3nzgtnrNrXZiSq9oUwZNsUH+U1lqCO?=
 =?us-ascii?Q?pF7VIJun8LKyh3fbiufcx+HVn2GpVG9hAEWXz2eI72AUeFX8NG/0gA9Wg9VN?=
 =?us-ascii?Q?kHImCHWmQuH5lqJK0rRFNDYJyja1ewOpwfoDPqYRnQlG08LS6FYf8/BpUnjP?=
 =?us-ascii?Q?PEPUB6p7jFPSsr1xsr0WVXdpLBmHF4lvWebI/hpjL/IKwsYJz0VcpovEdA5K?=
 =?us-ascii?Q?AI3nGBKTCSEYcbGxH4c6WIwylJjXu4YVBuNCLasGs6+rBajayExEhGpP2Ylp?=
 =?us-ascii?Q?EeN1kU8lhT5FzSzYsqPxAQVL1JjiwZuoT03PATwY4ZdmjnyGdQUMFbYdIpun?=
 =?us-ascii?Q?PTtMsjOqv+Pbs5HUnOuJNpUIJzgLSIFotLMOZBn17ia3rpX931W7wY+SoW5m?=
 =?us-ascii?Q?9M6sLxVBRC+0TO4orLfdTpvArH7dC9JlYsgn+jzF5jwU9iw7utvVh0DbcA5O?=
 =?us-ascii?Q?9KixIChD6aCzOmpvBWSWBksUI+AY20stVgdzOABbOYCbI+fS5fTBQKy0uFSS?=
 =?us-ascii?Q?DTmsJh2SUPxlt8nrs96Huyss7lENFcsp9WT91OY0vyKV3JiQFj4DSojp36kB?=
 =?us-ascii?Q?9zwIOeVJFc+ZN3ZO/wL8S86jC2jUTIWS/IsqLsLzSNoVCheLSC99Q03lACVA?=
 =?us-ascii?Q?Dmj3TQ8wJNpSA+ayuuIQYWxUCQ4Cb5KoHgDyzl6wg5MZeWw6moxVXhj+Arwu?=
 =?us-ascii?Q?kV4PEBKDu+QVEh2x8iKtks3iHVPtamIUm+bRttwm8qrxNjsC5g6N+8DmO5XY?=
 =?us-ascii?Q?WEjBf6WPd016wEptVeWwp5MafgmmhHzPw/QnZCdQ5hpMuLfk1DwEjKMiudbC?=
 =?us-ascii?Q?dyeJ5h85WSEd/PoQlLhHBEbha+BLe4ma1p8UFF0mT0BpcgKhy7ZGoK8hR1NE?=
 =?us-ascii?Q?6ORjsJ3Cnk9nfaSgLdTNvstRDSpNbU1kGB88waytUk5JNYvC6y3EGcjwrP+x?=
 =?us-ascii?Q?ruzH6IJ6MOcKZV4y7MDFcX5Z1RYYOcNmn8al4oUbBCgdySeIaQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QSGJ0cll6uBTxJf7GBAHEza/9o/pJAYui1a/kAcxQ7OFPAHK6K57izLebnWZ?=
 =?us-ascii?Q?qbbjawM7t4kOD5e4p/dqzR9jistGd0DD6EdDSbX0K/5AuY58hAvHEDgQ1Nl+?=
 =?us-ascii?Q?nCYwu1fw/R5Q2Bn01HsdvvhWW43X7ZknksYIBNqfr3nWjEWv1iD+XsmbISYA?=
 =?us-ascii?Q?bx5H8JcPRadXk2h5I+2/YYpWEKubm1wUjju9MHJiTOFvFyM2oUOV89zWAeoa?=
 =?us-ascii?Q?c3ijPWKds9VMrz46r+qG2F2Vzuyvgny/wFYZRTRDMwNA7GihysKEql8FEa3I?=
 =?us-ascii?Q?n0kc6UxzNLHim4RFFuwV6O1G5M9fJ8V9HJdHMcT9FWaMfiL7jQkvowzFbuUG?=
 =?us-ascii?Q?4OXEscc81muKJVjPeHwAFEUKd93eHrwLGFE9aaQYv3ID8Ts7QaV3XlR5L5ZE?=
 =?us-ascii?Q?hwcFQxVo7lnYOCFSnHywp7gtlP/A76Ldd9OlQ3jIe5hyiQLVNFBsl7sI0nb5?=
 =?us-ascii?Q?3kmzIAtcgK/fSNTh7IgNKEMyUHRf1QFkw2KL8iMEyKAQtZSk98BOmMvQDbdy?=
 =?us-ascii?Q?SCuJwtVuMFYu2NJfhDhkWTXDVkpT7GRd93fdc5aqgxZOT28T8DvpDDY+EDWu?=
 =?us-ascii?Q?KT4LAcLKwxCkHsm0P27OPvOmklpEMYG2ynvcpzMGBI20FmquhMyNjqrolWcB?=
 =?us-ascii?Q?f2a1rqp7np+8BmjcOftfOKlKIVmp0SDNeFrFk9dS2sYOFtfwETtKgbfUyLYB?=
 =?us-ascii?Q?zLvd4KeqE2O1hITY0+u9K/+LAbj3b1gYuJgLOR1Wp30REnjj6+VhbHZjJlYb?=
 =?us-ascii?Q?yVx7Ay4nrji6Jjmi3tWSsiOklnnsUYWdE/Y3FWcWc41q+GCEKCkJeU0ak3Hn?=
 =?us-ascii?Q?ac/kUzYwDzTsZV1kK3G/Ps86zWzUvxhI9WEfhtBK0tVkULFRBopMR8TFCFcR?=
 =?us-ascii?Q?+ASeg4dyg8PfNR6ZVptSwvPVPvszV6WTQCO+hF3G9k5R6XznJ5GXjJE5Oppm?=
 =?us-ascii?Q?tAUe+YQ4xMhS3BVU+B/IDiov10mmkU+HEARKvRRXKR87qAGyUMOlOoiibhI/?=
 =?us-ascii?Q?BnThVIIHfem6Q6CuiRYCWXXJCcqzlFsTWXcZp9SSmOBN9o97MJSdukiLqEal?=
 =?us-ascii?Q?6h1JU1xqTS0LWiYRzWJdQGJabwIv4vpfY4Li6wk70KnzCgKDx97gircw1bnd?=
 =?us-ascii?Q?SSr5S9DXhPpalR3WER8w9uyrczBHJwRAFdDut1be4+kcVnHITUsrzcTA9Nu4?=
 =?us-ascii?Q?k3BDbQD9ctax6ws5O6NayLp4JevrepSFOJmHEoA7s0OEl/3Tf+sCWndWG53Y?=
 =?us-ascii?Q?LfQyGxLHGy1ukxBvUMtvCmcq0m759i+eHPM1fcyPZ+O4SUpBAfG6wm0nQqfn?=
 =?us-ascii?Q?whCklkec82xSXdNyyQGXJ/ED8uakFO5uZYvRyP4IuPbeyOG9c4IaIFguTmKK?=
 =?us-ascii?Q?HMfNv9hrj25qHowG2Tb97zD2xLQGKkmcP83P3v4lg4HBZevJA/0bvEdQ73WT?=
 =?us-ascii?Q?PljrfYF+UJkf0Xn7513gPHKmWXReKMAmrYb65n//kf4QN6o9O6MC/srxOjz6?=
 =?us-ascii?Q?9Mg7sZsV9xhK4cwy347nU7NHm/jsqdb6bRT1YH0TJvHlioDUA31JiXwRS0SQ?=
 =?us-ascii?Q?+kjf0Az9gUm40nI5FHOpoMKuuiIgAoT8BxeSsGxg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e272c28-98a5-4405-6431-08dcbca24f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 20:47:28.1160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HJsw90uc3Rn6bHypHOKvyVxIdTuM6vArf0nZGMbWlNEul86FzkSHe9qTm6h+wuHPV9UPdVwLOUvZdEiBcFVzAluclggBW6YtUpHP7u0GG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6807
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Wednesday, August 14, 2024 2:41 PM
> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com; Brost, Matthe=
w
> <matthew.brost@intel.com>; hdegoede@redhat.com; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH v11] drm/xe/vsec: Support BMG devices
>=20
> On Wed, Aug 14, 2024 at 04:49:05PM +0000, Ruhl, Michael J wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Wednesday, August 14, 2024 9:56 AM On Tue, Aug 13, 2024 at
> > > 02:29:27PM +0000, Ruhl, Michael J wrote:
> > > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > Sent: Tuesday, August 13, 2024 10:11 AM On Mon, Aug 12, 2024 at
> > > > > 04:04:22PM -0400, Michael J. Ruhl wrote:
>=20
> ...
>=20
> > > > > > +#define BMG_DEVICE_ID 0xE2F8
> > > > >
> > > > > Is this defined in any specification? I mean is the format the
> > > > > same as PCI device ID?
> > > >
> > > > I think that this is defined in BMG PMT yaml definition.  It is
> > > > provide in the PMT discovery data, so it is defined by the specific=
 device.
> > >
> > > Is there any documentation / specification about this?
> > > Can it be UUID or 64-bit number or other format?
> > > _Where_ is this being specified?
> >
> > The GUID is defined by the YAML file associated with the PMT device.
> > In this case 16 bits are a device ID.
> >
> > From the cover letter of the PMT patch set (Intel Platform Monitoring
> Technology):
> >
> > -
> > The GUID uniquely identifies the register space of any monitor data
> > exposed by the capability. The GUID is associated with an XML file
> > from the vendor that describes the mapping of the register space along
> > with properties of the monitor data.
> > --
> >
> > I was told that this was the value to use for this specific device/feat=
ure.
> >
> > It is specified internally.  Not sure if there is any "documentation"
> > available beyond that.
>=20
> The YAML is *not* the specification. Do we have one that I can access to?
> And I asked not about GUID, I asked about ID.

Andy,

For the BMG device, the device ID is defined as part PMT GUID, and=20
will be defined by the BMG PMT YAML specification.

So this is a vendor defined value.

Need to do some testing, and then I will re-post the patch.

Thanks!

M

> --
> With Best Regards,
> Andy Shevchenko
>=20

