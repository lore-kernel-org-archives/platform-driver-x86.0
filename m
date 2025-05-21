Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4E1EB39
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2025 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830547; cv=fail; b=vAI2pJx2/V+jJV3B/1Swat77eiFQPcsm6kd4lGSn1fYkR4gpTcCvMlCu7bhLeKfd12Ew6Pj8b+wIEh6qd5NkaDHjdepUn+Mp0LPoTqoXBmyKKjkmZOVyp3Bm6Ec6x/xrka9gy7wRghn4GS5qsLgHDz2E3yIf4p2lty+cPkudfoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830547; c=relaxed/simple;
	bh=PT1LuXtQoyKtCYpHDlbzUJeh8YqZ6JDPWABTBe1N+uM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uDTAjKKaoYf6JGfkRGvDAZjiO7PyoUPKpDtfZYrcUqQqqmmKVSxwmOcqPq98l4+oa0hFbTTH3ifQHNmYtlamt8LJ8Hgo1W/Jo7WLCbtQUL7OJnYCdE7cTeSywsNcLDLdDfurdQ0g8p/rMxG3JleF9lMN0izn42pSbawvjrHsmqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSlqsfpy; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSlqsfpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747830546; x=1779366546;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PT1LuXtQoyKtCYpHDlbzUJeh8YqZ6JDPWABTBe1N+uM=;
  b=jSlqsfpyjrVffH0FVKGJcaYoQTqtyDczm/j9t0TyjZqtXRobFnl4zMJa
   KPYXZ3CBGM4ZLNUTKxVTs52Q5Bv2lfiUf6bdv5/607K0S3HWi7tL7WxIb
   HXxVLuMTUVnPVSyJwo8iYmUhyO5vj/MqPiz4mM9/D74lT+wlgDdFZAQuX
   seOhE2g+lzP1ayBYXSIUsLGbgKWnbVvSu67J9DRHVb9NpbI3+x1WgMcoe
   WkE7A/WclCGd53tIbgaC76LtlUN68euxrbIilPY5BXtNbvajZuCe7rh5W
   AuiyPXosjbaMj+MJWzYsVrbItnn+aCeE/F2+Q60oO+Qg9ivLutsBrRz03
   w==;
X-CSE-ConnectionGUID: DXER9GeYSbKMv1byTKN4dw==
X-CSE-MsgGUID: zvrWspgcRmSPR3pKT7DdXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53469620"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="53469620"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:29:06 -0700
X-CSE-ConnectionGUID: 1y2ivDeFQpqdYfIzbwNyrA==
X-CSE-MsgGUID: 6ivpXHIqTvyzrGvaGoJtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139800974"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:29:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:29:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:29:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/bLPaEhbUnYmZ8Jl/c98dp88imYVTz3SMEHQzJteTivNxqeyBpeWdaFfdIXtxj9j/MZIaO8VsjBh9OFP3HF8NyDkV9u5gxCu5vFnd2coTo8Maa2lVyEj/t55KlJliOYhUn1zbzDdZ18ejfgS2OcD4hgmZsyVBanrDVK/WZW0qZvDBbxMIfVCHpOVfEsiU6D/e549maoVtIWB0j5Qf18e+AgwchduXmBJURhuhyq/cYe/ofSPb73A9Shz2aDEbIKt1loeOqNr5rQaeasKvGWUhd+M5hZ8zMNHEVZG2OtmSxERzL4O+FPayJDzHJ2UDsL0nMGrgMKFTKFHR3u7d0kAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mw14a+/Mib6x/Bra5GdZwRqm+5hagCneP4a7W2l+5hM=;
 b=q/ILhHgyPDUDdvVruJTBjXTDYvMS9EmTWOglUnf6z2+af9NsJspzyNUOZCdGuHm4DtcaFLgEO0+Mo0zzwYBIOWJqBTDcd7IxCQH4m04MFlb+14nGbQmpWcZi+LAe6wfiqYaPS425CfiAs5fmBEBT509kDIqYuk3VJScO/JAMx6QHTfrn+hCvR8Jaa/cXPghltlL4EYLaUzq0X3Tnb67wvrZ/Az/x0dM4YrmxPnn/raWqMjLf81gDtzYqgIQ4Ppr1hoeeBUglD9pd3crX8PgrDCPzqPJncU/YgcHEI6m3CNZoYNFnkopdmb8kk4bKfqWoQbE9+uFa5wYrJgwvoJ0tPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 12:29:02 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:29:02 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 2/4] platform/x86/intel/pmt: update to bit access
Thread-Topic: [PATCH 2/4] platform/x86/intel/pmt: update to bit access
Thread-Index: AQHbxnPYeTQMcpOpmkK5yPKwYRdrq7PaFbkAgAL0AKA=
Date: Wed, 21 May 2025 12:29:02 +0000
Message-ID: <IA1PR11MB64181CDDB3ABCCCBBB728249C19EA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com>
 <20250516150416.210625-3-michael.j.ruhl@intel.com>
 <4d89e26e-72a4-d79e-2b60-3e9b401fca0e@linux.intel.com>
In-Reply-To: <4d89e26e-72a4-d79e-2b60-3e9b401fca0e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BL1PR11MB5224:EE_
x-ms-office365-filtering-correlation-id: 8e8f7d23-2f30-48a0-4afd-08dd986311af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?xJJ1tEzjA7m/4lj2gX2utZmArpD2kUTrWv1p379FE6RT0wW/EUZQpZBopI?=
 =?iso-8859-1?Q?r0/EYHodp+bB1hZn22wrf0DtaQr9QWeKbnNHqqnTe5H9rT6aKRW7lk3+t0?=
 =?iso-8859-1?Q?wU01KLIe23rnPppiMQsE9Xc84VyzxtSXlQiv7qtRSYPWoZv0epURY1XErX?=
 =?iso-8859-1?Q?1c/JyViGwK2hd4lARX/5jBUJrwULhHHaKSifoSJ13q2fwgum2ZuEExInp1?=
 =?iso-8859-1?Q?R6biaVK6n76UjScDPKclNqIeqTARh259LmLRD5WND2th13J15h7n95Wv2m?=
 =?iso-8859-1?Q?GAiw5nxmlpiuS47sewrhC7NsTnSPDayjYgkNORM0CbEmtHa8OQqU0yD5Lv?=
 =?iso-8859-1?Q?0BWfXZf/nE6fQzCZTVlBs7ngBZ/4lNL7lAH5eifRzLmt0qwmb0zpyAcqqm?=
 =?iso-8859-1?Q?UyG7whTceiScpcia/ZB1qHdOTlXlH3N/2ZUf5T6EmpgGutC0zHG2ne4wIu?=
 =?iso-8859-1?Q?jlqJE4Tjt/q2nCTIRxY1yzVnKSChivCLm+c0/csICT2znXoWyLGKymU11O?=
 =?iso-8859-1?Q?SmfSkEJA8SNsHAofrzhYLfUbSFyqHaa21G80uJkLxkbTbDa4ngR4g0RKq4?=
 =?iso-8859-1?Q?QivM+buh2DeqWrS0wRmL+bhMptdeTxGdIDwE/ZkxGhqfGrb0fY2b7TQK6J?=
 =?iso-8859-1?Q?BSYI38H7jw1oJlNB1DjX4MQ1IPTY4EdIcgv+lrR+v/Buq/gpFm2rAYqjC5?=
 =?iso-8859-1?Q?grjm3+8ilO3OxqSZfp4Jjh5hg1VSilUFNXDGdErZzNXku4WiqGZZW6pAw2?=
 =?iso-8859-1?Q?hIGLhnWJHWBZcMnA9k+/h6iogoqZ69HaCgNEdw4/Rj5xtrDuyv4xVCX92v?=
 =?iso-8859-1?Q?fGbzwoFZvhFMJksEZ6TraiqB1cewga8gc1r9ANfPGBXd++bEXV5Qq0/WAw?=
 =?iso-8859-1?Q?+HVMWy/KPRMe5/u62GeiGhWGpIaqsh7+1Vi2H2PVrgvd1YJOiaWF85/3mu?=
 =?iso-8859-1?Q?oQczEeKR/YW4vSlZSfbQyq1L4kL4evb11ICNrVwE5gE4mcrhrucu3vqtpl?=
 =?iso-8859-1?Q?ADF/umVVyfzm3w6sKq7ws3A9p8HnRyTmPr/AfPljw+76s74QPJRqZEF+Ut?=
 =?iso-8859-1?Q?ykm6Kgo+ZzO2HdfA3iL8Y7rFpwbeY17lWN0CA/a+nNleDkyQvw7bRx91MX?=
 =?iso-8859-1?Q?PaiRUqfV9vIESvFe5p5J8jYXFU5ktKz8l1Sypfv4EEynvM4mYihIiVbtyG?=
 =?iso-8859-1?Q?2XIicP/qDuve+8G2vCZ+uSvmEnOotgUPkqZk8yv0RQZS9e2R54/KZfARUy?=
 =?iso-8859-1?Q?45EIIkNcs8Ude003ECUpAHESVDjpOujAcsya1kd0rdzQ+aSw0YLdcCpK6d?=
 =?iso-8859-1?Q?mTxHf7kKSc8m3EqS5z1nF0WuyHEoqEn9Gzxra4wat9YFFPVQifpeJRhtZM?=
 =?iso-8859-1?Q?df7xAKQ577ECQznEzOGy0pNZTc8nRY4jNpTg+LI9H/T5X5l4N99qjHx0w7?=
 =?iso-8859-1?Q?34XY6J21q/seceDzc4oC83Mkk8zGHE8QKffb7tgqS1ofrTkxqDDqEPHKqa?=
 =?iso-8859-1?Q?rBe8KityBI/blAM/ysJ6shPOKxdmvMOU+iclyOfArGTg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VWnwmWA1A695B0RWFw1BoxI09wodS7pMZimSKfZzpanfSwkyidfZdxOQx8?=
 =?iso-8859-1?Q?vya28LxaS77/o8pQLALpb7RT+Y4OMaFWQYz+yoLZj3UURlvQ3BdZH03gkQ?=
 =?iso-8859-1?Q?QGFbCT7eKD6JI4qShQA92FgczTcL+bQRkjh3UihpJv/eUOfTU/iVVj/F4M?=
 =?iso-8859-1?Q?HiqpHRFjFlyexHVbsRUAw125FzUKDj7hiYglZRww+2Iu5JpCdu94n3FF9h?=
 =?iso-8859-1?Q?BOaXoQ+a3K+tvySYmomU3opsjhgFSQEBmPXCvRp37BesMseBpNLm7K5cUh?=
 =?iso-8859-1?Q?VHPG3v6ThYY0Os0079AZvi7XheGGb5Tld76Xj1ZAVNrdW/1CtUdYbomhR/?=
 =?iso-8859-1?Q?ufKGSFdKBuuuAEr5liZDbjmJprUbNdj6Zl0odjPeQGbugLOTgyOv4XwYap?=
 =?iso-8859-1?Q?rLMBkv36lp8Mj5LQH45pMKAnikILE1ScFiwH2CdBb+EUFmGI18Spp5rJ1o?=
 =?iso-8859-1?Q?3d5AKLSWXQxLZlA/x9qE4sShjLPhY1WhuSj5igfBT4M0Wid3AwJgTBG90x?=
 =?iso-8859-1?Q?10H4ez68SEFEqyUgEBOzxrdnuXUTJpAm4oeA5FGbo282LHFkz8D/DvXytr?=
 =?iso-8859-1?Q?MFfVibNUTE1pwn5TwpSdSB9LO/Qvp7/QFzUowFmmCKjHROn+nuwWfFRNnK?=
 =?iso-8859-1?Q?rDE6ZyIlXYXPFM79cFg2twL23krgxf8e72xrZHv/1iVo1tllIZoFu6xFW/?=
 =?iso-8859-1?Q?9rSBTcdHwcJHUcMYKIWMCTtBRyEBepvY9gDZ9+z/CzvDZAAeQEHbPjRKnH?=
 =?iso-8859-1?Q?FifnGLPriJf7+JOrNBE6yGSdNdeF6dIP0BZI7SepJ39LJHWUt9a/Nw4gcC?=
 =?iso-8859-1?Q?PfOpzxKLZyGEdFP14XuvsA+thMNZg6QnGdfrOV1q0RtwUwn9T6kEH1TXJM?=
 =?iso-8859-1?Q?7xfqTyoNK4+Wyp9mk1vX1g5m8r0jR3eWlKFgX2h76iO6KSHZ09Q2Xv5bIy?=
 =?iso-8859-1?Q?4ci7V27219pEDswNw5nM8cQ2//sEllUZyw8HPvzYjC6aAS9+zGubsXb4ru?=
 =?iso-8859-1?Q?qi3uOgaNqWoMxV1ARropdoT8+kUdRpvrlK8J1UcJDDA6o+Fn1fOb6OjBZN?=
 =?iso-8859-1?Q?yoleiT2XNv5NJAW2M0QaJHaPkJZiJJN0W4FrPLFrak9+twfOb5G/rmatO9?=
 =?iso-8859-1?Q?O1nmkUftlX+LNRQYja9g9rLVTxkyULIfiFx+dI8840KUUG6O4H1288/v8n?=
 =?iso-8859-1?Q?paExJIc1qripMbySg6FfwFwhZ/h9yZAtHp4Ud5Bd0myIsPF/BaamT7AiEH?=
 =?iso-8859-1?Q?3q2IJ1nG3DRVXE8XuO7WpJh0E5V/arGbVqNAk3V68+jzAJ1AWaWHmnjlov?=
 =?iso-8859-1?Q?ZwCuDhVqPB09sgrsfj1mUUbg8AURlh9VlxMT1A6tS78NYTlZFLY2tohXqP?=
 =?iso-8859-1?Q?Qj8hw73l7ZIFgfIhBKktjJ1m+Q4HNyeVCwQR3rD+q+s+Lbp489/KRqIMq0?=
 =?iso-8859-1?Q?Uvh1J2KvIyHKSZ2BIM/N59agQPX00nfcH/5+u5KrzqZt1+wndx+gWE65Lg?=
 =?iso-8859-1?Q?HehD04ihvKrJuvxsaw7hcfm7fb0mSIp9GFYEYFvw12SbiskxlGloGttN6y?=
 =?iso-8859-1?Q?fvEGJk4y4uPCH34hsbUUk06/Zdt0oePYTC99pV3SuYzoOmtoiitEi7nzxf?=
 =?iso-8859-1?Q?zTg2HVbZB9EULGC7tj3N8TEeOT34Sie6f9?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8f7d23-2f30-48a0-4afd-08dd986311af
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:29:02.2247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAEOeMLxiNHso1f9s9Um+9OSQEMR6TXI3jqg/DWui3PE/XVx+RKS3gqtlKPFwly5JtCuf8wgVfrTWpehI1+A2ab4gcsQUS3V95I4rss0XBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Monday, May 19, 2025 11:19 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org
>Subject: Re: [PATCH 2/4] platform/x86/intel/pmt: update to bit access
>
>On Fri, 16 May 2025, Michael J. Ruhl wrote:
>
>> The current usage of BIT offsets limits adding new
>
>BIT()
>
>> functionality to the crashlog register access.
>
>Please be more precise how it limits, as I don't buy it in the current
>form.
>
>I suspect the limitation is self-imposed by not naming field properly with
>defines but putting GENMASK() inside defines that custom-coded also
>FIELD_GET/PREP() so please check if using FIELD_GET/PREP() within the
>functions (not in the macros) with named defines that only specify field
>masks can overcome the supposed limitations.

The big issue that I was trying to address is that depending on the crashlo=
g version,
the control and status bits can be in the same space, or separated.

For crashlog version 0 the status and control are all in the one long word.=
  For version
2, status is in the first word, and control in a separate word.

Also the bit definitions are slightly different for each and the bit defini=
tions felt awkward..

I will revisit this and see if I can use the appropriate defines.

Thanks!

M

>> Update the bit mask #defines to use a bit defined
>> structure.
>
>These seem quite short lines.
>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 116 +++++++++++++++-------
>>  1 file changed, 79 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index 952bfe341f53..dba7e7c1585d 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -22,29 +22,12 @@
>>  /* Crashlog discovery header types */
>>  #define CRASH_TYPE_OOBMSM	1
>>
>> -/* Control Flags */
>> -#define CRASHLOG_FLAG_DISABLE		BIT(28)
>> -
>> -/*
>> - * Bits 29 and 30 control the state of bit 31.
>> - *
>> - * Bit 29 will clear bit 31, if set, allowing a new crashlog to be capt=
ured.
>> - * Bit 30 will immediately trigger a crashlog to be generated, setting =
bit 31.
>> - * Bit 31 is the read-only status with a 1 indicating log is complete.
>> - */
>> -#define CRASHLOG_FLAG_TRIGGER_CLEAR	BIT(29)
>> -#define CRASHLOG_FLAG_TRIGGER_EXECUTE	BIT(30)
>> -#define CRASHLOG_FLAG_TRIGGER_COMPLETE	BIT(31)
>> -#define CRASHLOG_FLAG_TRIGGER_MASK	GENMASK(31, 28)
>> -
>>  /* Crashlog Discovery Header */
>>  #define CONTROL_OFFSET		0x0
>>  #define GUID_OFFSET		0x4
>>  #define BASE_OFFSET		0x8
>>  #define SIZE_OFFSET		0xC
>>  #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
>> -#define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
>> -#define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
>>  /* size is in bytes */
>>  #define GET_SIZE(v)		((v) * sizeof(u32))
>>
>> @@ -54,6 +37,39 @@ struct crashlog_entry {
>>  	struct mutex			control_mutex;
>>  };
>>
>> +struct type1_ver0_base {
>> +	u32 access_type:	4;  /* ro     0:3  */
>> +	u32 crash_type:		4;  /* ro     4:7  */
>> +	u32 count:		8;  /* ro     8:15 */
>> +	u32 version:		4;  /* ro    16:19 */
>> +	u32 rsvd:		8;  /* ro    20:27 */
>> +	u32 disable:		1;  /* rw    28:28 */
>> +	/*
>> +	 * Bits 29 and 30 control the state of bit 31.
>> +	 *
>> +	 * Bit 29 will clear bit 31, if set, allowing a new crashlog to be cap=
tured.
>> +	 * Bit 30 will immediately trigger a crashlog to be generated, setting=
 bit
>31.
>> +	 * Bit 31 is the read-only status with a 1 indicating log is complete.
>> +	 */
>> +	u32 clear:		1;  /* rw    29:29 */
>> +	u32 manual:		1;  /* rw/1s 30:30 */
>> +	u32 complete:		1;  /* ro/v  31:31 */
>> +};
>> +
>> +struct crashlog_status {
>> +	union {
>> +		struct type1_ver0_base stat;
>> +		u32 status;
>> +	};
>> +};
>> +
>> +struct crashlog_control {
>> +	union {
>> +		struct type1_ver0_base ctrl;
>> +		u32 control;
>> +	};
>> +};
>> +
>>  struct pmt_crashlog_priv {
>>  	int			num_entries;
>>  	struct crashlog_entry	entry[];
>> @@ -64,27 +80,34 @@ struct pmt_crashlog_priv {
>>   */
>>  static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
>>  {
>> -	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>> +	struct crashlog_status status =3D {
>> +		.status =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +	};
>>
>>  	/* return current value of the crashlog complete flag */
>> -	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
>> +	return status.stat.complete;
>> +
>>  }
>>
>>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>>  {
>> -	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>> +	struct crashlog_status status =3D {
>> +		.status =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +	};
>>
>>  	/* return current value of the crashlog disabled flag */
>> -	return !!(control & CRASHLOG_FLAG_DISABLE);
>> +	return status.stat.disable;
>>  }
>>
>>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>>  {
>> -	u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET);
>> +	struct crashlog_control discovery_header =3D {
>> +		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +	};
>>  	u32 crash_type, version;
>>
>> -	crash_type =3D GET_TYPE(discovery_header);
>> -	version =3D GET_VERSION(discovery_header);
>> +	crash_type =3D discovery_header.ctrl.crash_type;
>> +	version =3D discovery_header.ctrl.version;
>>
>>  	/*
>>  	 * Currently we only recognize OOBMSM version 0 devices.
>> @@ -96,37 +119,53 @@ static bool pmt_crashlog_supported(struct
>intel_pmt_entry *entry)
>>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
>>  				     bool disable)
>>  {
>> -	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>> +	struct crashlog_control control =3D {
>> +		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +	};
>>
>>  	/* clear trigger bits so we are only modifying disable flag */
>> -	control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
>> +	control.ctrl.clear =3D 0;
>> +	control.ctrl.manual =3D 0;
>> +	control.ctrl.complete =3D 0;
>>
>>  	if (disable)
>> -		control |=3D CRASHLOG_FLAG_DISABLE;
>> +		control.ctrl.disable =3D 1;
>>  	else
>> -		control &=3D ~CRASHLOG_FLAG_DISABLE;
>> +		control.ctrl.disable =3D 0;
>>
>> -	writel(control, entry->disc_table + CONTROL_OFFSET);
>> +	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>>  }
>>
>>  static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
>>  {
>> -	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>> +	struct crashlog_control control =3D {
>> +		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +	};
>>
>> -	control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
>> -	control |=3D CRASHLOG_FLAG_TRIGGER_CLEAR;
>> +	/* clear trigger bits so we are only modifying disable flag */
>> +	control.ctrl.disable =3D 0;
>> +	control.ctrl.manual =3D 0;
>> +	control.ctrl.complete =3D 0;
>>
>> -	writel(control, entry->disc_table + CONTROL_OFFSET);
>> +	control.ctrl.clear =3D 1;
>> +
>> +	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>>  }
>>
>>  static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
>>  {
>> -	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>> +	struct crashlog_control control =3D {
>> +		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +	};
>> +
>> +	/* clear trigger bits so we are only modifying disable flag */
>> +	control.ctrl.disable =3D 0;
>> +	control.ctrl.clear =3D 0;
>> +	control.ctrl.complete =3D 0;
>>
>> -	control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
>> -	control |=3D CRASHLOG_FLAG_TRIGGER_EXECUTE;
>> +	control.ctrl.manual =3D 1;
>>
>> -	writel(control, entry->disc_table + CONTROL_OFFSET);
>> +	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>>  }
>>
>>  /*
>> @@ -304,6 +343,9 @@ static int pmt_crashlog_probe(struct auxiliary_devic=
e
>*auxdev,
>>  	size_t size;
>>  	int i, ret;
>>
>> +	BUILD_BUG_ON(sizeof(struct crashlog_control) !=3D sizeof(u32));
>> +	BUILD_BUG_ON(sizeof(struct crashlog_status) !=3D sizeof(u32));
>> +
>>  	size =3D struct_size(priv, entry, intel_vsec_dev->num_resources);
>>  	priv =3D devm_kzalloc(&auxdev->dev, size, GFP_KERNEL);
>>  	if (!priv)
>>
>
>--
> i.

