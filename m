Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD696356778
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 21:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419877; cv=fail; b=XqUZppkGgHAc6/81IhKea9ki3R6uglgcVZ7ErQwQvqiraOaaoMKk2D6hHVkxVOXr1wKW+LX0sU29hE2oDNjJ5DYpr3AfJXBwyNl9epNc7KCRxItSEKSP0y+Yr81i5U9wajgM0SOI65KKR9jDKA4d4oBzIWP1Ewa5nd4vvCiEQ6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419877; c=relaxed/simple;
	bh=GhsBkMoCPMWmcWVOv8+c9LvCw7I99oXLHyeLeLvsEcE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mJ6bIs4AyBfPekL2WwwXPQGPo0IxhGnxFaSNgYLZRCZRpmUg4zNdXO++bGjAVlvXCoR8ckP6YGtGjcS0wEMt08pLXfcRY5P5TsP4UCWBWYsbxvwo5FNO/KhxIAx/N3d8WvxJj6KVq4hpb0v9pScR/Mwh4DujCSoKSZzeIsY/b/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8ObOZvM; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8ObOZvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419877; x=1820955877;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GhsBkMoCPMWmcWVOv8+c9LvCw7I99oXLHyeLeLvsEcE=;
  b=F8ObOZvMknqlm/pHb0SrZY1CgdErtftgZEI+ybod31hMndrKbrmLqqzv
   jD8qk2Vi4TsQ7YVf6bbXJP6t5Z45lAULwYTbe4x6mV1cxGnal+NTVhSwp
   tAXx//ZCT47uH/SZr2m2m/ruHOJbLITNgAAYvxyFGTurjzVGFvhC+SpHR
   p62TlE6PtFGAjcVLMP1CHDPon5y+u7kp8EmcynasmQg87JmXSpAuome34
   20lEHdwpBepRBsdko5Zjs81yfavGsPOj7P1DIcOQ7Xck2xAOL7iwmsltj
   AbIJZymwElu6mzq/heg87t4fMYZNTCVh5FlsAR3XRaiPlDOMwP1FmKdCS
   g==;
X-CSE-ConnectionGUID: MEhmCnMmQzWRXo890HI3mg==
X-CSE-MsgGUID: gxWfKZ0ESvq2/Zoob13Y4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93602481"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93602481"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:04:36 -0700
X-CSE-ConnectionGUID: WX4WAhUiRueg97Yvvc3weA==
X-CSE-MsgGUID: UjPCP4qwRHalJNrs3TwsIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269468321"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:04:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:04:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:04:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2fb/yY+ennPEGAA/ijcEe9veao71zfzR5NCkzcKrerLCffpVQKJt9bPbD4BIjZDxJSKTl7aIJaFk28szJrBftp1NJ+P7tJfNtAlepLZJTcRJyFYeMoiVNkHoX3qK1zKbRbxLyhwyw3E4hFpSkSxdTUkwBXbbcPA0xSfMUw4WShPPkjYFF8++Jp3kotWsvyyNkni70v5q7yppf3DwXRIk9Ft/TSLqJUcW9IDpAMC5J+A7iAAwvLrz5+17tj03888cP0SPE0hVVltHeUIAX1fDLOJp4yM1A5zV3nXWu0soODD4b3wn6cLb3E2plgs9wbHKqYZFOpGwF3omWDy4gm2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m53jOzw0DyPE7cKhVbpepcGwmiAQ+ZEXR+/iCp1bB3w=;
 b=NgdiohiiuPGGI4ldRA4fE5IKwGI389IfcrrIvFTeUGvqd/q0c6jFcbSq/jb6IO29dP/1YukcLHpq1qeWyrBFhrJ8fuxdJwIuW7UESnSLliM5mZGMVjKQp/bImy70IaVNdNi+ZpI0f/TjhKhqxzNrlcSHIaL2+rzdclMMAgv8cSE1JscZYY34Eh2nyy1PMwQ6hkQrci5xv7UA7Hmr4amqnXXXYPPqkDyQWi88SKQBcCCsaHUW56F1RegDNqhAKap/lOIEJJf204Y1+xuafHSByFENowMPU67Cie0kA2l9iqvQqh2klhP4SJVrMTeOD18YVbbDK2Uvsih81gU+oNvWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DM4PR11MB6408.namprd11.prod.outlook.com
 (2603:10b6:8:b7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:04:31 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:04:31 +0000
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
Subject: RE: [PATCH v8 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Thread-Topic: [PATCH v8 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Thread-Index: AQHdQisuy/8SXnkrnUCAJmVKxLFaUbbOQeQAgABSmuA=
Date: Mon, 14 Sep 2026 21:04:31 +0000
Message-ID: <CH3PR11MB04614967EBAC64BAD0D71DF544C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-28-michael.j.ruhl@intel.com>
 <aqgbtrG5Lv2-ixjS@intel.com>
In-Reply-To: <aqgbtrG5Lv2-ixjS@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DM4PR11MB6408:EE_
x-ms-office365-filtering-correlation-id: adf29e64-adb7-4cac-5e24-08df12a3c5ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: lwQfpuFsL0kCqweP3CntgE9HZJ9EEKwJNGiO39QvW69AZBtxkYa/f4j77wSJB8pv/Z85aaybxZcTcezRVhB2NLrv1yWHn9w3g/tYdvsuMbxKfGZLNrbAEw1NRwJRwDnD9IUg7XqLH7yVzUks0AA0gBRXZwAH66adqz+Wcv5I/hitjXYYAb97szDN7GAWZHjGUnvI8TZraoDYog6aRaeUHEVOpfTGUBTW1sfhvxATXdIibOO5iqUrczCbFiLNzJwNVf9haPdyYI40wq0Mb0Pdz1lyLrzNb4wIco8K3qUuLee+24Ds8ztWTy1AbZNocNXdNUk/71XbfY3u1uw7cmsUJAwfZBunW+8EOtWW77M0JThbiZBdEJIMsrM335P8X3AE9b/XOD93tNeYSdOh15X9swD9wy6KTsukxxrMt8IXc8EBpB9MJgDzIGPrtKT9ZLlQRLC7/AFlainINUACRqUx0MH4X4/vcB+NYL7V24o1KB4kCCA0PYEYVG4y9QMpiG0V22WczliesCkiUPoChn+VoNbrMf2c5qEERHDPEK1P9RvtSIVChcyhYYCaPJm1pIcaKcOklAHfu6l7TPcMVIf04V2gkAOn+90FYjjIk4mWIiTFtwzn21h9QCrqVKmBda6rsVjlNDV7lHfPLc40tOAUwRM9CDNLS0ivwpzWnAtpHYtsVkWYqGhfsDHuYcI60hHSI/5WCGQbGetJYFE4reGPFj35OvFxG9lgWgYGb0IsQnc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pGFOpzOJBNFc1De3e4lvWS9vXnqTl3nvqT/SDbDN+YMtaG1xVSQkLe6idgTY?=
 =?us-ascii?Q?mEDQPQXFMcpBAz5X8fFw3AT8+xNmWp7Vzn/nBV72nktn9n3VREHvt0t1epc8?=
 =?us-ascii?Q?cocAGnMCCwGcMJp+OnGx7cBJjVQjXNhWvyKtd8Syqbw26HafzO+1I3gxKNZ9?=
 =?us-ascii?Q?IGBSSMtXtPhX5vf4jiLNnpAj79d1C236SHSDK40FDoBQkTLb1Mt7xMpwV6tG?=
 =?us-ascii?Q?w+0wG8vnBPT8E4gkAASoRBt8b/f3aSISKFVlO39I9CG7dHw07hqMzcqy4VNk?=
 =?us-ascii?Q?fKo2VRobefG/6vqzxlh+OAXbOtAtSUUHVLkhqCfRF5wO3hbSd40edarApgDM?=
 =?us-ascii?Q?3R49RZfxE+xH5TAMfJfC8uP29x4MAQrUmXadF4Yy0vMMnqKgdHLBNsJqk3k8?=
 =?us-ascii?Q?ifVUUyq9tVRShrwdPZfozJtm+rYiCG7d1owpVFSOsxuEI/32JzJeiog0v7PU?=
 =?us-ascii?Q?wqlnN9A+m8Nlwq3kuFCFmmVvfpN6x0+e/c+eAdwHx0Qwx7NxuG5LUm8FWJfD?=
 =?us-ascii?Q?hMHvq/E+GS6ptlHP5GZmO3ovpeJqXkmpAOw6YHaFJuXYZy7XWRDlhBzkde+5?=
 =?us-ascii?Q?zMBytH+PZbjzL24gVsnhEQFVaD8LSU4vFDY6pF0ibBgJlQ81wfu2I7DoVthL?=
 =?us-ascii?Q?38wwtKUxTfum1y677hahbyDKfgt4wvEttEVGAkM9oorgG1tXT2IMnzEzQ/db?=
 =?us-ascii?Q?5Nwnfg6V7AzlxTJ8ivinZl19tfJj3nROhLNP687yDpIiT6fpcw8K2Qj+fOyx?=
 =?us-ascii?Q?v3gimWfGlGvhD/cIaTnCQ72zx7Xu41K6J3PRHgWmIcilU9BiUgL1wjt/91as?=
 =?us-ascii?Q?l+9Z/JshXHkKGQ+BSRgNwm99yWwUhSKemS4V4hxT/7IivxKqsyvsh/oZqzDO?=
 =?us-ascii?Q?27F+gKmX0A2MeMvgzGzOkRBH+oEbiuG23DhQwKrODmc0abIqgyGoj2gZdmT4?=
 =?us-ascii?Q?7ysT/M+HfcyaqcLv/8NKwLU7t7COXVHjveuQ0cyknlhxRPQkd0MZk+Z19qfn?=
 =?us-ascii?Q?iGlYVOW7gvBo3GA94pnmZlsSiM5PqGF01mT6jXPAYItmYj9eCE1QLA/kXw8Y?=
 =?us-ascii?Q?kk5VpzzvmiQYh16JYF54kND/xuwzYOdLhggb/bna+sSjm4p4ZJD7d4ksOj/P?=
 =?us-ascii?Q?LY1lWcCHSdmxVtEG91ltbtIse6Y8rO1MawoPoq9rT9k3oK92dNGrhdfCdjW5?=
 =?us-ascii?Q?/fulmi0vts5CmpWLVLAS96V4fYgPGWYAicdBwG0apqekthtzWZv6RNhyx2dD?=
 =?us-ascii?Q?dqNHBJ1Y+Lbb9F5OI75KUqr1w3UonqfEwt19iDlBRuJb0uRRbfOkCN7Rz3sj?=
 =?us-ascii?Q?IzeBzfuZ8X0kmC/DkqitYuXZfbhAr2/PirT2DnY47B/rZ55/E6JD2MbgPgaV?=
 =?us-ascii?Q?byBz4L/tXBOOTWqOSvP81uaBHRV0V7szFfTMRwr+dQWFYZ/HvaClX70M5Edy?=
 =?us-ascii?Q?P92xUxspMudU0wNziZrjGMd6MkcYbQMa1Ay3zcBiOwOxSuL9+vBAL+cMQKP2?=
 =?us-ascii?Q?PfUza5Po1Gf1o9QBZmIRK9gqDxCaAt7TISDlSxz3XOayTyUQGKjMpvCBY7Ks?=
 =?us-ascii?Q?q0JVORMJv68b7Jzv0sEbdieWf/XkGHlTwMWJmtYavLlPamJW98PdjJCCSwhg?=
 =?us-ascii?Q?wbKGhCd1qd0eggPuQvXtOQaq05n2gqwzpMFMKpnIh14cjzrntHbBnyZr+MKX?=
 =?us-ascii?Q?Ou55kMqs80on3HWYnLCylgGscUiFhbCNH9Onr+FWrycq8egDLeDDoGSNI0bC?=
 =?us-ascii?Q?oBn0kjT1vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4lmYA65LdmsaK+0dcYNispLcVdpRLWbjEEuMb7GbIxZfEn00OQ88Hh4ZE+eHsjbR6UnQ006eSWgpltL+WL8EKi5bGnCjN/53TwsbZMo9wKGkeElr3rx8C++jGnQ/RbSSO3hBzDZPVYYcL8UORbb58Qk+ugHh1Htl19EvzQ0QD9w+ghQ1FpXDrIcaPDd9HX/9PHEvqo31s7vwc2W4SzN3dXLCnM7Ok7sjmEstTNUJNwXr7vOs3UPqKwKJOwiJenU5qp9NgxPFo7kCyu6TS563Hzmy7MnHgM9jn+F7DnzXUvGzN4dK1M8uIZp6xy312v/bdJh+SOMRid88XVCa+ubMew==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf29e64-adb7-4cac-5e24-08df12a3c5ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 21:04:31.7157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2D3SXthk2bHCzyqZvcVRlIVKq0s5o3+4+q4xxM8goLBCMAzpVDtPR4wjBtHGgBgNyC3NGSGB16Zs/h2BWoPb2vf+DZyIjyfjJDWlGw82i8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6408
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, September 14, 2026 12:07 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v8 06/20] drm/xe/vsec: Do not register BMG PMT for VF
>
>On Fri, Sep 11, 2026 at 01:11:54PM -0700, Michael J. Ruhl wrote:
>> BMG PMT is not supported for VF nodes.
>>
>> If IS_SRIOV_VF() is true, do NOT register with PMT.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index a9baf0bfe572..71bc359b2ad1 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>>  	u32 offset;
>>  	int ret;
>>
>> +	if (IS_SRIOV_VF(xe))
>> +		return -EINVAL;
>> +
>
>I believe this second one here is redundant.
>We will never register the callback and never reach this place.

This is called by xe_debugfs.c xe_pcode.c and xe_hwmon.c.

They do "protect" against SRIOV usage, but I am paranoid...

I can remove if you think those paths checks are sufficient...

M


>>  	ret =3D xe_guid_decode(guid, &mem_region, &offset);
>>  	if (ret)
>>  		return ret;
>> @@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>>
>>  	guard(mutex)(&xe->pmt.lock);
>>
>> -	if (!xe->soc_remapper.set_telem_region)
>> -		return -ENODEV;
>> -
>>  	/* indicate that we are not at an appropriate power level */
>>  	if (!xe_pm_runtime_get_if_active(xe))
>>  		return -ENODATA;
>> @@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	switch (platform) {
>>  	case XE_VSEC_BMG:
>> +		if (IS_SRIOV_VF(xe))
>> +			return;
>>  		info->priv_data =3D &xe_pmt_cb;
>>  		break;
>>  	default:
>> --
>> 2.43.0
>>
