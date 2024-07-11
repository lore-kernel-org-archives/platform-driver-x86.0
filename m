Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56716B72E
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720713470; cv=fail; b=UOMSd4UYdB+EqwSzgTUS93WiW1wkwnjzYJJcpK+d89M3pG49CNLP9lLNRBLDyHVygnvXqjnRIzFux0UXoDSqKrg0hDLIyO1qlY6OeGl2qX9C6ZVb31JmH1ZFz4n38fo1VIBDo4Kig+CW3gtgdPTonrMVMy82sdhV5L41KWJIHjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720713470; c=relaxed/simple;
	bh=ITl/CGYf4X/l+atwR/pysLCGlmQtXI/opEDse0F3QJ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y6h8OlWzXJKrPRA8asbv05IKHhMQ/2zOwOp4tBUr7dHDjUi/sRKPb0WNgM6DE7AW+HsHJJOECI0CIRE9ojJ+4Qb3yfV4+JzXK2MsTBi2ckRgnDjpiLM+wx81QnVA85I1QQ2Ljw44vNn9XIiirT+IjPSmzRxvk6AiFwDwqgJQTWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPVOYq0F; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPVOYq0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720713469; x=1752249469;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ITl/CGYf4X/l+atwR/pysLCGlmQtXI/opEDse0F3QJ0=;
  b=GPVOYq0F9ki051OCU9E60Ats+iebpfiN7xe4UgR7efxH6cwVHAZCtDOa
   z0/Q7iKlcGqLBrzoErNinXQIVtFsQLBJ0Pm+t2i8HmTDcQCSMeNFlsBlb
   Itnp2QnMN7+qDUCuVSceyer4qB3qkYyiwfq/8cOIRD/7kzrZL9gRFR0V/
   LX3aPKdTRrOYCcIUJK77ExWx4ogLFpZ7wH66PpVb2WlrVYO9y2ZJHjDOU
   dyqeZlLZCV++5422R2RF7uff9WT+mE75Wk89oGzsvCw7B6KIcxUnB/SJX
   c25If2Gf50vMcbIysPAjbHhDCpy7gnJhQUKrElgbUQSuhsw6mWC9MSRV6
   Q==;
X-CSE-ConnectionGUID: pxSDZj/7SM6dxMaNbrlreQ==
X-CSE-MsgGUID: J8NOMt2/SKmhpiH7z844Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18248463"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18248463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 08:57:48 -0700
X-CSE-ConnectionGUID: 9BYMWTMeRnWmVzC/dDsKPg==
X-CSE-MsgGUID: 0cVEd8u/TQyoqoc7NfH76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="49035094"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Jul 2024 08:57:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 08:57:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 08:57:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 08:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2amZUQ00IbLAF5woF8BANY3Urhf07E0+EIqPkabYaFo33NJ85WiGmzH3qYeDpg+/YSYWqX7RAKDJNEeBXkns68eRkWwu8ij6a12oSlqP5hihNuPr/mas4SXv/UsNrBOPf58aZXdb7ofib74puTPlQvjozUYgmKoprzvpwgEEx0z6Rj/1wuU++ojuiluSCrcumDcQwxzUBKPFy1yoRIDp05dRceWBWUHLc0fbmtYzxmsg5OwVNfcuO5wdYUn6PcrHucEonQucz0sLRN1rzw8bDwrrgxPrgSGEOmbN41jBIV5OlZ+mUTLQSPaPLF+7PCsKF2qgma0UgegE1uptfMzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beWYrJTtP2S/5KA3z1wnOY5LzddNjDejUkzW3YHwE5I=;
 b=DrH5vK9FaLyglkNn9hc9/ae8SuHnoovBTqxsBpuk2kNWMVlguScVw8F7c2wlOClhPJVqHbBmFsTrS7J0KiaWTP7VEhpB/LchDBMFMO4EzhtETOslpUOYEZXq93YOT+GVXWL9ZnDdjXviOh/vGlgM0E+h+PM7Ezb9hS+EpJ4YaWPtRjPyGJKoQrj0oKPIxQm7/c0JujmshumAwHS/KiFeqPHstq0mDd24A+8P6xKfMm4qPn5Ovnl8WYAwm6QzFARwuVWQu9h83qL4SvnTMx220aHPhKN/Rxdga6yI5Js7L86awvez95+aVuUyi3qDIYm3bYB5tbPszhSVJVLFLUcjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Thu, 11 Jul
 2024 15:57:36 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 15:57:36 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Brost, Matthew"
	<matthew.brost@intel.com>
Subject: RE: [PATCH v6 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Thread-Topic: [PATCH v6 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Thread-Index: AQHa0v6bEZJQmaCkb0aGO0vZwZYSRrHxYZWAgABOA4A=
Date: Thu, 11 Jul 2024 15:57:36 +0000
Message-ID: <IA1PR11MB6418B1D319B3E1C565DF85B4C1A52@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
 <20240710192249.3915396-3-michael.j.ruhl@intel.com>
 <18866bce-1b3a-83b6-c861-6eedbd185265@linux.intel.com>
In-Reply-To: <18866bce-1b3a-83b6-c861-6eedbd185265@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM4PR11MB6334:EE_
x-ms-office365-filtering-correlation-id: c9f3b0df-f38c-46eb-e8aa-08dca1c22f0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?RZktnh0gqANLALSHevZDH53JKrFGki+UbIzFNHob1XWGk97olcA8Rlp/bk?=
 =?iso-8859-1?Q?0UivHgY9fsNWuNFiDuPKUGu/UeC36iDxA21NzviVGvKNDTHqotncOYjWHX?=
 =?iso-8859-1?Q?gLQUMlE7oGCU3TtOIn64ccXT+O6ipUWbDgATt8wBHPtXHhDjsZ7Kwrx1C7?=
 =?iso-8859-1?Q?+qd4uBJfKNkOuxe9494EfQnBagT5/4/t3Qzhi9ODDBXn+ATJ488/KpVhes?=
 =?iso-8859-1?Q?UDxCR0WMK0+Pud6CE3sm/xoKCUX3pix73eRQ8XsHkU7L/BwT0Lkc/7TqrI?=
 =?iso-8859-1?Q?wLt5flvVOsk1nF3PXQ4nIAHbDBT2BrVf6jsSLGc3KdEX/UY2vDVeyiI6fd?=
 =?iso-8859-1?Q?aXmVSGlwIvMLvuAQz9DiU25N+4jGdvl7QgX3Nw4Xtwwgp/BgDbOq5eAzbT?=
 =?iso-8859-1?Q?qaJc+RDSe7WDqMuw0WBwTL5fQxdrXtP/xxs7L9ThKp4HS8/a1B3cao8EtB?=
 =?iso-8859-1?Q?RV8c6o+4dMvG2dcnzlYA2hJgCe3RZj0symA5b9+H8nA+wvpAY8GGlXj0YF?=
 =?iso-8859-1?Q?0dASMST7FCYr37TUQwynOdQeuI247pbOTec6h6XT9pZdAkOek5yFPWwzRq?=
 =?iso-8859-1?Q?NET+YJ2zvD0pF2WAcmIdAx69aMJsSk0Hrs6sZHCwEzPVTcqQZ69vMB3VjR?=
 =?iso-8859-1?Q?wVrfO/f4Vvz4h5H9T4BbrEh801Zi+ahAyCW5IbTce8Dw0M0KcadKw6u7eZ?=
 =?iso-8859-1?Q?U3gXpGqYASmvy9wMw7qaJFUWkImKErRHkyxAOipXFEDlipnyELolj7VaQk?=
 =?iso-8859-1?Q?WTllZGRMp5/MYXvn0ZjUzbqejqxVrXGITklsq/51q6vlu0QiFDmMT4bygm?=
 =?iso-8859-1?Q?02Wea1GS/Rwe4Pf4w0p/p+RbYeX+cJGGGDevhmLoqNAhbdem8GlHFDPhZp?=
 =?iso-8859-1?Q?8gHdiMzNQOTh7ET2a+Dgm/f0slsL3IDZnXAzC3kxJsPsh8kvydArOxlWEG?=
 =?iso-8859-1?Q?6LdG5sigNyMx2Xd6el1vlWu6t63/g29/tb5jbPEdzpznrj3dERPD5Q+gAa?=
 =?iso-8859-1?Q?I5fBUoiuqGzgsNcduAnoPUZ7uwsJN/5yooRifWnh3AVSArNbNUcbUSaQxv?=
 =?iso-8859-1?Q?mQb1gzDrJ+zorx4GWVhgSc6Q65cI/kXZ9y9rm7gWFKNbZCqbnKytxt57YM?=
 =?iso-8859-1?Q?ALKOecOKlCWU1GjICwtfqvez+lP58rkM5nwnikML953F52bIgOgpukMaE/?=
 =?iso-8859-1?Q?xhlpAOdDxdIKfuJ10wvUiL4chF6uAWvnhqVqonuWy6wT3DWR0ML71hC0Zh?=
 =?iso-8859-1?Q?ow1wtb+IefzbTAlC5ltnwv8WZa97wG8HwJc0c/2lE09dRdtZY1NtnvfDEN?=
 =?iso-8859-1?Q?s4c4PgQxh/HKMgP09BoUcmVginYL6flk6lfoGLA/xRw+HFbhLHucadXX0/?=
 =?iso-8859-1?Q?MJelbbCAvbsRQnLIGKWq1/5UJ6gM1hzdSDYd11Klr4LjwwcjV0b9ueXwF2?=
 =?iso-8859-1?Q?Q+QWmZw2brQqEkLNP/mtsQoAvxAwYOAN6QrbGg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8hBYEtGmm+0SnF4YD3DySU9bM5ovc7aXNiyWr2Kxgs+ygAka5Bas2+YZHW?=
 =?iso-8859-1?Q?+H/w0/Ke/gqH77BnEjmbXuos2WYfSHVXXuV6ojwPZtnaB1eRvHtvztkILV?=
 =?iso-8859-1?Q?9DHZcU3/Fo+qjGpjZcg6FAfEJdv/E6/vSDh4e+nnO/7ROB5Y+gB1xb7TnL?=
 =?iso-8859-1?Q?0pvjvqsiXAzVAPK8i31lZBjGii3vDOrPkd3fJDncwghacIXne+MyOaf68e?=
 =?iso-8859-1?Q?PHgkxtyDift8zr6ctDUWDR0bkCGll9yADpxmQz3ndiYCDF+UvddqcFc2Xc?=
 =?iso-8859-1?Q?XLZ1e1xd/bXfIH5ze5Ztzrm+9TYAhXMYxgHpmRW6nsF10279ftwtdiISJG?=
 =?iso-8859-1?Q?p+L610cLxBAjGAtr7tXO9SUKlvZj6WQLIJYyuinOJ+Qs07YBiT59Ig0jtz?=
 =?iso-8859-1?Q?QTVUdYfnHLeX+7CK5HGTjmKkWlFHCI5fGYeFxWlZvtBC2mLgI5J0LW+j6M?=
 =?iso-8859-1?Q?Y3/jLCYJFZC0lUFEDIuSXnYE4J7+ySizxVllPfY4zE8N9QtreLRyN+mU6Y?=
 =?iso-8859-1?Q?VOhyKDzIcCQnSoUHcNWvu1KJMpw3nYla3EHbsRi5rLynPRXPcuDCNwRd5s?=
 =?iso-8859-1?Q?kVIHdEZYqE4IEyHKngRNLoi/MgTPRzbXmqJvlol6sX7IOeYpPjJngVfr7x?=
 =?iso-8859-1?Q?7Aywcd3XI+L79SVZPSK5PuJxFuUhtPaFAX2+LYuGXyhqmOlJfQ+MODBklt?=
 =?iso-8859-1?Q?C2AKJwVP+bxkp8UbSL6C0dOdSFZWe3p7DnPwOzAYjirK3hiTiTuzBX8Nxo?=
 =?iso-8859-1?Q?VeT50A39UodqPfnnFRDPqJrFvPYWRDkzDqfd0Uok71+SzqGPgNDpVrfI8f?=
 =?iso-8859-1?Q?HIyb1wgYrG9+dBDxG3JBALToVhVNRjfJK/LY/nBhwa8iotE/h7/bKpNiE2?=
 =?iso-8859-1?Q?vSFzPc2PBz13HwofVq+DURrZNv9CPLcnq5vn/TuA4Q9/oYVCxfRRj7KcMF?=
 =?iso-8859-1?Q?VGXwXrkkAmXWzcRihO/S70y6vMNnJN2ahuHqDNA+eiP0FsF05Z0xQFOinq?=
 =?iso-8859-1?Q?j1uyys3EhA6P4VnayOGuMMMml0PPf/svIJ6YdmhKBYRPmlIOqwu7vGlSDq?=
 =?iso-8859-1?Q?+2i2xZ6ySWEqNm4hsCHPM1jOontxSEt3UPFZ6STvcBD2MEmqAqbENzoyur?=
 =?iso-8859-1?Q?UdN040Z0JlRqirQx/Yo38uck0D8ql9X7mPviFXK05rcrjlqbcbKzck/VvB?=
 =?iso-8859-1?Q?9UifnFLkdT2lbWp/kU+2w3/YITbkjSr0tslzcK4pqwrVnTH/4wlk5J/cSy?=
 =?iso-8859-1?Q?MSLWEShwiikWBdFTvm4GLHrtEc5kAA7ZK8qyMt+Lhs+jxLbpxb69SbMb88?=
 =?iso-8859-1?Q?85aKYqkesa5FyHbkkR4iDtUIlbKUQaFJfLKh0cSfIuhDZDy7lxnymXL+N6?=
 =?iso-8859-1?Q?NJ0K0j8F/p95EqnP/5bU3K1tWchZwoy7sH/a7hpiE1pV2TPQZKdVIK7yUs?=
 =?iso-8859-1?Q?Yom7rZVv/A7ySiXCM0/taFSDVHXf65byj4BUwj/vydQjCBBYULDL+xNjKX?=
 =?iso-8859-1?Q?aHt8htx/gpcRkeV1j62fEz5XaYHgyjJyGcJDubeqsUlKNnumO3mfxUyIAC?=
 =?iso-8859-1?Q?+Iq+7Bnz47dMVyli1LWgizjjsQ/RsDCkA8RcOYnWEqQbVGHKAuUBgMj/dN?=
 =?iso-8859-1?Q?rkcK6qEH52MKs6P7vjmwFyW+t6rRdhKGDc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f3b0df-f38c-46eb-e8aa-08dca1c22f0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 15:57:36.4514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFFf0jBg81b/dWKPY26F227QI6Y/FwQwGHZRAZIE0chyX38y5CQ1gMGYHcjQz5pZjgy/73R+ACfXYlLKcGoooHtJW0HFbHiBgJN5lEgLoKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Thursday, July 11, 2024 7:17 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
>david.e.box@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>
>Subject: Re: [PATCH v6 2/6] platform/x86/intel/vsec: Add PMT read callback=
s
>
>On Wed, 10 Jul 2024, Michael J. Ruhl wrote:
>
>> From: "David E. Box" <david.e.box@linux.intel.com>
>>
>> Some PMT providers require device specific actions before their telemetr=
y
>> can be read. Provide assignable PMT read callbacks to allow providers to
>> perform those actions.
>>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> ---
>>  drivers/platform/x86/intel/vsec.c |  1 +
>>  include/linux/intel_vsec.h        | 14 ++++++++++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/vsec.c
>b/drivers/platform/x86/intel/vsec.c
>> index 2b46807f868b..7b5cc9993974 100644
>> --- a/drivers/platform/x86/intel/vsec.c
>> +++ b/drivers/platform/x86/intel/vsec.c
>> @@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev,
>struct intel_vsec_header *he
>>  	intel_vsec_dev->num_resources =3D header->num_entries;
>>  	intel_vsec_dev->quirks =3D info->quirks;
>>  	intel_vsec_dev->base_addr =3D info->base_addr;
>> +	intel_vsec_dev->priv_data =3D info->priv_data;
>>
>>  	if (header->id =3D=3D VSEC_ID_SDSI)
>>  		intel_vsec_dev->ida =3D &intel_vsec_sdsi_ida;
>> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
>> index 1a287541a2f9..4569a55e8645 100644
>> --- a/include/linux/intel_vsec.h
>> +++ b/include/linux/intel_vsec.h
>> @@ -67,6 +67,19 @@ enum intel_vsec_quirks {
>>  	VSEC_QUIRK_EARLY_HW     =3D BIT(4),
>>  };
>>
>> +/**
>> + * struct pmt_callbacks - Callback infrastructure for PMT devices
>> + * ->read_telem() when specified, called by client driver to access PMT=
 data
>(instead
>> + * of direct copy).
>> + * @args:  pci device info pointer
>
>PCI
>
>> + * @guid:  ID of data to acccss
>> + * @data:  buffer for the data to be copied
>> + * @count: size of buffer
>> + */
>> +struct pmt_callbacks {
>> +	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);
>
>Can you explain why args is void * and not struct pci_dev *? I was already
>unsure earlier why void * is needed but now you even explicitly documented
>it to be "pci device info pointer".

This was an artifact of a previous attempt.  I was going to use an opaque p=
ointer
to pass the device info, but David pointed out that the PCI device was avai=
lable
and sufficient.

I have updated to use struct pce_dev.

Thanks!

M

>> +};
>> +
>>  /**
>>   * struct intel_vsec_platform_info - Platform specific data
>>   * @parent:    parent device in the auxbus chain
>> @@ -78,6 +91,7 @@ enum intel_vsec_quirks {
>>  struct intel_vsec_platform_info {
>>  	struct device *parent;
>>  	struct intel_vsec_header **headers;
>> +	void *priv_data;
>>  	unsigned long caps;
>>  	unsigned long quirks;
>>  	u64 base_addr;
>>
>
>--
> i.

