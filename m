Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3418BFC
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720731421; cv=fail; b=hBrCVob/86E3P1p9c7x/PNJQ/GNrwJHc83L5JoIV1A1gqysLvoiqQGZv7J8jAUSxzfaeg+xTkDjqJULcJ11GHz2Z3zCeLio+k+DwToTAm8JKtgpyB4KpzwHsyJcNTnGkKy/eA7aCbukjMbSeW5mujxPKGVWm/+P770WrOHuZMgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720731421; c=relaxed/simple;
	bh=j6NgD592mMtnlhswvj8tJM203NaikSPxAMyukOn0Cz4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y8flCCexXQv2jWWWtVdfHqUPQkNar/Hu38gXFplGZeLMhyX8J7aleg1XSq1QXpyt4WHsByCjWPlwbaanq3Lw4vCmlrSPsBzPAIIpDUDoXo3JsqqSfYdZnkWoSFHWNiXvUaY2ZI/kwMoFZBrr8z44PhbW/SDbDeky/VsFfbW8lrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQ17EYtj; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQ17EYtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720731419; x=1752267419;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j6NgD592mMtnlhswvj8tJM203NaikSPxAMyukOn0Cz4=;
  b=AQ17EYtjZ4DPXqDG4Rb9UKwLpkAIi14/IUxYvXMylsHm5JSyQrtLzfbQ
   6TiVbeNiZHvAW1Yo49J1Y0BoqSQf3qG3A0+LL/IM3KmiR8eztFn3SUa9J
   TMgmr6imM3ouyxVZyxHjcUGfdHCyc02YFD2tf81ESfBMJIXdMjvoMjS9m
   EfI6rSCtQoQ2/sbsS7f48Geeli4+170197IrKFeDXMliezvH+UjTAnIxJ
   aRA0C+DsunUH43JQsEjQhqerMX3y3b/k44MYKJqNEbooULP9wRSYZcHip
   p/lziw+gljj5AZ1znYI9QOeWVUtoVfYpSlNWTvl95dLA6NlxUMJCuwTzH
   w==;
X-CSE-ConnectionGUID: lL+gbYNeS2OWS7qtktKyXQ==
X-CSE-MsgGUID: c82AWyGBThuGQYYMxTZ1eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="40671009"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="40671009"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 13:56:59 -0700
X-CSE-ConnectionGUID: IpShs28BTOu1Mtzo9qMBvQ==
X-CSE-MsgGUID: dyGAegImTg6LhjyuHDYBAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="48778292"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Jul 2024 13:56:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:56:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:56:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 13:56:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 13:56:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRC4c48Nq+PE2QhBWzZtOiiebJcZOFp/frduHuCJD6DASfMY5TGWjdtCKIzWf8ik+icBZDEAa5Xnu0NBPiGKj9raDVRNB9o29BLi+M9asP+WN1GKZkL9lxW67oKXqVpsMyD1rRd+LivjTp538MJgsi3lQEaFCEUNDbiTNh5tLBA5mL0lHjtXTAdzU22LAyUqUJ6C9zs7DvKzFAftoXI3s0KYN5su9WKDXryALvoQEVM7a7xYusfqUPOHHI2ZGymxFg8FFRReYT7okvai4BcFWzaQqp5AXuEo/pgzJL/tzKXqweU5tiU6gd78M+lMXyR6i1QfCQyYTM3/tV9cXF500Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeCkyRapIeVE8xNba4WiLWKEV1DuQcirp/UCr9XPxtM=;
 b=INkaLYSmpBbCJjlZ/HodH2vRwve1a2cQo4VQnPiu+ZIxS2Llj9B4E+CMbz49JpFAyU8teZ8+ecHwun/422wd8W5xGkQB81C2x34OsG1nbV1lqTdKw2SDLdjtSCm1qM+6EmEpzQ2rU0/K0uMxEiPAf0Q9bsJ+liwjVTsejaSxqZWCkQOfL/4uZFH09zuvc+TfRMHbLaGNgt3uyC6jCTYFt1TrPGe4F1Mn3MvWZqR/uwKzuF51QLTqpdfFmLN75kIPZDO5wwGc/St0pWhkAwm5jfA15xa9kYL6hFG3WLcmrFD8djlPysU5YwJfp1Qon9ll0VjxCNFwo2/CMh1E9QTVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Thu, 11 Jul
 2024 20:56:55 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 20:56:55 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Brost, Matthew"
	<matthew.brost@intel.com>
Subject: RE: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
Thread-Topic: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
Thread-Index: AQHa0v6kOoNdczHrmkCbiRXpUiDONbHxZoeAgABnhKA=
Date: Thu, 11 Jul 2024 20:56:55 +0000
Message-ID: <IA1PR11MB64186499A6047EE3951BE8C4C1A52@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
 <20240710192249.3915396-6-michael.j.ruhl@intel.com>
 <b521ebe3-e7d2-6ca9-e626-ae9d3a455078@linux.intel.com>
In-Reply-To: <b521ebe3-e7d2-6ca9-e626-ae9d3a455078@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB8123:EE_
x-ms-office365-filtering-correlation-id: 9e41ef9b-5606-4bb0-2616-08dca1ebff35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?eDscjNtSn2iQNOa9ppBpve6qfI7BLV2Dj+0M1bjF6m2o+dJjVq7uQv9k/u?=
 =?iso-8859-1?Q?Yzvn7EcPHwQNWwD+BzMiHa6e/ECn4FJqq97LUU+zs2CoZUl8R9SqUlUBbI?=
 =?iso-8859-1?Q?n1xZFBMtYyAm8RqbvE/8JcxAqIhMnf/2XXJpxSVw4ms/vWF01/4fz6FoCy?=
 =?iso-8859-1?Q?ylavz8HNFXyktRKSgczzjaMpmb4zBiItFhS4TvjyZS8SsWIeOaBHWGDV9b?=
 =?iso-8859-1?Q?yPJwjhwlw4Dgmfa8p5X0C9dlZkCcHct3kIVXJ36VLanVvQ6yuz72XGhTjB?=
 =?iso-8859-1?Q?BtDEbr6YwrY8gESRXJRt1rxc7s/3BoVw3l0opo9nBRUuxI9Jtgy3oMaseU?=
 =?iso-8859-1?Q?8HaeOB3fqd38oBWkuItCUHKtSg3ZrVl11Mu+7O6MnGu8GhJ/g3QorkF8ab?=
 =?iso-8859-1?Q?Jz6TKcPHkWI2SoBZeNQgOBcUoKTZUfJsOo4ikdoGHIEKEO+33zrc5yed2W?=
 =?iso-8859-1?Q?g2xbhyq/VR95jn/V4+m+20c41ovI5V386RZwowjFXbSxVFZPL7tT22megY?=
 =?iso-8859-1?Q?72mf2y/w6T41wKDwodYIeGfsIYMRsBBjo4IKkfUCIXNlxMUOEJ7ofnF6k0?=
 =?iso-8859-1?Q?13SFmq8ZHHk+6+3KJpTqUyitZnAV7ZGUQw/W18DNRNOPuZ0YEdhJ2iEiiK?=
 =?iso-8859-1?Q?Lcvwtyw9K9vJ/CSamCt+zBy9i/q7C09UOYtzO4qSby9VgL7+Sl2jnoJM49?=
 =?iso-8859-1?Q?FFV3p2Jyiyzf3PhtTWoZ03f//LkXZxZN1Hg8lFjY3tmY4LRxGC/q9gbVxq?=
 =?iso-8859-1?Q?y54M3DbVg0cmIXAKkilbi8YVkMkyiK/OVY2GJ72Kc8KOX2FXHrsYvBjpMe?=
 =?iso-8859-1?Q?0uh74drQNoCZ0D9JzohfzwV7vnDNTAtjGRNucoGEbAQhvyJK9cYWnn3kxF?=
 =?iso-8859-1?Q?BAn+/VPF0a4caa8l5CHJWvTz1edIzeer6E+N1R1yF2iTlR3lgn1RGLK1ha?=
 =?iso-8859-1?Q?fEjcmayTaV6AbTkR7mCA3GRT+Vvo1Zlf9h6/XCLfLBsZmV37s/TidJOG1g?=
 =?iso-8859-1?Q?GcgKSDtHJ/z8FKymIzOtYCul6tHcy5umqEje/V9q8Icx9KfdPqzy8/nO71?=
 =?iso-8859-1?Q?O/L7tqHKnUhXQ1HK0iDsoxhZzntyqVjGEzx6uhYC2UyEb9GMv6ioY3klhD?=
 =?iso-8859-1?Q?iTKEEgZM/ZOHEfC2U7hqfX28zidaIwuXTS+5Wln0yJiAMcGZRB7WiQ947S?=
 =?iso-8859-1?Q?lCoqTAsTmtKgLoZnKbY9UQblYEOJLUjJ2V3BBatwLeR2zEhdtcEp0B/vPg?=
 =?iso-8859-1?Q?jn0rrSienhmdb03Ki979OeKQH0amgZlinW/q1R/YyvP4mwq2tpFLjgLNxA?=
 =?iso-8859-1?Q?jA8k0CiXGBe1iqdzNNwI8Ux9i9/z6M6IelX6Ra7IZBbycpVs+7Tb01v66r?=
 =?iso-8859-1?Q?A3v0f5HfQzBrZxS0KY8peUUDDZ6JS4H6aT/zVDuBB1AKHlNomzxG1TuUJH?=
 =?iso-8859-1?Q?DaXW4U/hxtQmuKxglj+Ljbw8O7JtJ2Ikk9iyGw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Zb6HT92xT1cH34skVgT6nJkdBqVCwt3Dmymy6reQ9gf3nJyJ4t3ik7XzSk?=
 =?iso-8859-1?Q?6i/eoJGPsVrYk2+vltifW9ioVgvajy7IHwwFa1AW5h5Jm5BTt54/hbpMAG?=
 =?iso-8859-1?Q?vtcX14TE+5nJWw79l8VEmMGiXR85HzPJEN3kmeK8UE4L22vdDIns5ivoS6?=
 =?iso-8859-1?Q?Hbo+vv7QUUoOq2UmlptsYjnboXrzaWmayWoXiTAUHfx7LBSY++UX+z18Ic?=
 =?iso-8859-1?Q?UNK9h4FSaYN4aakA/z6Ye+eE4CzY6s/pH00jsYhIw7Psn3hu1mnW2sLO90?=
 =?iso-8859-1?Q?Y6dKvAMVMnd4KOoZRe421+6bmd4U9x59zU7htiT7P4CLOAHZ5esfEOVlVA?=
 =?iso-8859-1?Q?Ov5/Rll7JYPfejvIQYKz9wQzzNAy/+4kUPMKr6+6iuszHairytQjb4JnaM?=
 =?iso-8859-1?Q?JCKfeE2UHK+sdXKPZDxkWObceQM4nXUfRVz6rCejzrGMqGK4W164QSb4Ak?=
 =?iso-8859-1?Q?C22+ALFiZ0ongjWMBvRAcLyYdwzPt9mFjq9HS+qaN8CFiNkaxvJnYMBqLd?=
 =?iso-8859-1?Q?I0NA6VOIJX76pWvSbUmTleQBnTY8GdcpURXCGuI2wTmqGU9d9pVp1/E+P0?=
 =?iso-8859-1?Q?DHO8EjVVHanBHg6dBMkYkXRSaQxOMDNGW+tIxMOnraNXq5MeR6eA/2kteW?=
 =?iso-8859-1?Q?9+AAuYQE5WAD2jmwzRkZ8Dtx9sw6iIcfyyVfieS8tNlhxs1vVd/HoeCarT?=
 =?iso-8859-1?Q?h7l09M0xAFvsYd3V0zPdxbqyB5OxLVtd1+vjmRiW96jIRfqR+D/kdHYoVW?=
 =?iso-8859-1?Q?xzepe7EBVRe9Pn/OM63p8d+dEgtPgpa8dv4qJRPwRBbck4PJD27OVd9LKy?=
 =?iso-8859-1?Q?tK+09JS8kP4pGDEUulcx64loyGDeTMd+d3uRa0NZErT1vYmYAPukgsOhYs?=
 =?iso-8859-1?Q?E7QGPs1rRL+/toTtbErK3EKwadvLkc4PMqFXthGNCtNXyXRXAbjAsULiIc?=
 =?iso-8859-1?Q?VqcSBVjJ3YH0Wv6uHiPmvxOdYiqQwkcQhpO4/AJ6KWrgXxGtWxQUi3ODSH?=
 =?iso-8859-1?Q?EC+eRjr9IOZ9EfcHDStfbJ0Gvlxk0fMtvqEwfnXaBkzQmeosaDYnaSB2zn?=
 =?iso-8859-1?Q?1cRBSkjB4PAMlDkdc2RiPDGdGpsNpCoGrY5dMD1O18SJdoYCeDzSgxDcCY?=
 =?iso-8859-1?Q?tqZETDpQDb6tOt7UeDGDgMJsxyAK3RmzNHgMgsl8PQzERia5KX7DcXef0Z?=
 =?iso-8859-1?Q?YZ6DZCfhewmYycavdW9oRbkz2bVDFOGEfg+mwxFipFbUDXFG9YXx9eD+ek?=
 =?iso-8859-1?Q?wuAMZWVs8xi31+jvRC8qwG8kg4oNzA0VQXlA82nVfDYbqozIPSPdTdbVEe?=
 =?iso-8859-1?Q?13dYVutkd6zMp0RCvjgoU0yTxI10Ss8YVdjiaiwPs3zLG1zBBAu93dYLL+?=
 =?iso-8859-1?Q?LmQxqNX+Y9psXmQR2J3xXoAE0Yq/bGvb3MjvjoEkkbILaMV0zJYLtqFWR8?=
 =?iso-8859-1?Q?mn+8ZB7RRhCTX+eQ/TRA90pZfv9GFHcy9MI//G0JdL9Ka1Lhm00SqWIvCe?=
 =?iso-8859-1?Q?4i6+X7tNaLi5SHn/md5+eE5Xskh7s3losn1q0ElFW3AE0ufhOZaB0K4PRG?=
 =?iso-8859-1?Q?/Oz60Eut7AL7S0hfKaE4mwXWxEAdBn8lu5YQVcmCoP++kDd7rsNi3abJHh?=
 =?iso-8859-1?Q?gtvEfsWtgJv3iCcCbYcyK4ory5Dkv5+Xm1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e41ef9b-5606-4bb0-2616-08dca1ebff35
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 20:56:55.0260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlxoILJLesqsvChOVVd2+ZgeTCP6MyUoOuBM81icb2j8685VDqYJeRfNEZ0k5Ks3eFjm3jb5xcKbVyarOyRHZUQpSmUjEreeeFo0+hq5DjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Thursday, July 11, 2024 7:34 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
>david.e.box@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>
>Subject: Re: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT
>base adjust
>
>On Wed, 10 Jul 2024, Michael J. Ruhl wrote:
>
>> DVSEC offsets are based on the endpoint BAR.  If an endpoint is
>> not avialable allow the offset information to be adjusted by the
>
>available
>
>> parent driver.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/class.h     | 1 +
>>  drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
>>  drivers/platform/x86/intel/vsec.c          | 1 +
>>  include/linux/intel_vsec.h                 | 2 ++
>>  4 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/class.h
>b/drivers/platform/x86/intel/pmt/class.h
>> index a267ac964423..984cd40ee814 100644
>> --- a/drivers/platform/x86/intel/pmt/class.h
>> +++ b/drivers/platform/x86/intel/pmt/class.h
>> @@ -46,6 +46,7 @@ struct intel_pmt_entry {
>>  	void __iomem		*base;
>>  	struct pmt_callbacks	*cb;
>>  	unsigned long		base_addr;
>> +	s32			base_adjust;
>>  	size_t			size;
>>  	u32			guid;
>>  	int			devid;
>> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
>b/drivers/platform/x86/intel/pmt/telemetry.c
>> index c9feac859e57..5c44e500e8f6 100644
>> --- a/drivers/platform/x86/intel/pmt/telemetry.c
>> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
>> @@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct
>intel_pmt_entry *entry,
>>  	header->access_type =3D TELEM_ACCESS(readl(disc_table));
>>  	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
>>  	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
>> +	if (entry->base_adjust) {
>> +		u32 new_base =3D header->base_offset + entry->base_adjust;
>
>The code setting ->base_adjust is responsible for avoiding stupid settings
>that would lead to underflows and overflows?

I would think so.  Since this driver is not aware of why the adjust is set,
it is not clear how it would validate it.

Is this a request for documentation of the usage, or did you have a concern
that we need to verify the value?

Thanks

Mike

>> +
>> +		dev_dbg(dev, "Adjusting baseoffset from 0x%x to 0x%x\n",
>
>base offset
>
>--
> i.
>
>> +			header->base_offset, new_base);
>> +		header->base_offset =3D new_base;
>> +	}
>>
>>  	/* Size is measured in DWORDS, but accessor returns bytes */
>>  	header->size =3D TELEM_SIZE(readl(disc_table));
>> @@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_device
>*auxdev, const struct auxilia
>>  	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
>>  		struct intel_pmt_entry *entry =3D &priv->entry[priv-
>>num_entries];
>>
>> +		entry->base_adjust =3D intel_vsec_dev->base_adjust;
>> +
>>  		mutex_lock(&ep_lock);
>>  		ret =3D intel_pmt_dev_create(entry, &pmt_telem_ns,
>intel_vsec_dev, i);
>>  		mutex_unlock(&ep_lock);
>> diff --git a/drivers/platform/x86/intel/vsec.c
>b/drivers/platform/x86/intel/vsec.c
>> index 7b5cc9993974..be079d62a7bc 100644
>> --- a/drivers/platform/x86/intel/vsec.c
>> +++ b/drivers/platform/x86/intel/vsec.c
>> @@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev,
>struct intel_vsec_header *he
>>  	intel_vsec_dev->num_resources =3D header->num_entries;
>>  	intel_vsec_dev->quirks =3D info->quirks;
>>  	intel_vsec_dev->base_addr =3D info->base_addr;
>> +	intel_vsec_dev->base_adjust =3D info->base_adjust;
>>  	intel_vsec_dev->priv_data =3D info->priv_data;
>>
>>  	if (header->id =3D=3D VSEC_ID_SDSI)
>> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
>> index 4569a55e8645..1fd0fcc5615d 100644
>> --- a/include/linux/intel_vsec.h
>> +++ b/include/linux/intel_vsec.h
>> @@ -95,6 +95,7 @@ struct intel_vsec_platform_info {
>>  	unsigned long caps;
>>  	unsigned long quirks;
>>  	u64 base_addr;
>> +	s32 base_adjust;
>>  };
>>
>>  /**
>> @@ -120,6 +121,7 @@ struct intel_vsec_device {
>>  	size_t priv_data_size;
>>  	unsigned long quirks;
>>  	u64 base_addr;
>> +	s32 base_adjust;
>>  };
>>
>>  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>>
