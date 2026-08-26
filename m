Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024941BA94
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760838; cv=fail; b=to4/oX9MUCZ5P8FfMS09pQxSO8BL97Y6b6fr+lW6CjZOxKfYIASTKh7E2+W9pmNmTf/f3pPFblaYPtgB163ZTBzHVE8Gi3yrAgnlrw/agik6db9lM1A+ZfNDXT9QnpJZHbO1tLALo/hlf2kzHoqwZJwsPnUCpoVU1+y1PcZh1ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760838; c=relaxed/simple;
	bh=HmLEIs37xyXL3X8h3eVdyoFmkFzL/k5h45SCr6JEyi8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jkD9B1E9qido+WL+yorErvBlzI/R+7Ih56Gbecdu8P+mnMWkFBvqe6ZWLLB/5OeYxGhRksTlSpEI2kRejcaR4Op4x9bmMYlwLBCvicBh0PtvkNiy+CCOTq7o5PjlJC8a0iz0XUUygoYR32bJ8EnElYyXLoLJH5qiKzgYThewNVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRfhyUHc; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRfhyUHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787760836; x=1819296836;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HmLEIs37xyXL3X8h3eVdyoFmkFzL/k5h45SCr6JEyi8=;
  b=PRfhyUHc5XGqKVFbcfbScME4iUoZjCQpVs4lvVvbK49E7BnjWMKlt88d
   K2TdaHDK8wLs9JcUsabZxS4jXIrzK+FwAzCoMn8GDsj+XK03SwXzeWZnG
   NhJuab6o7B2Qq0gKF0gmJSkUDfaLmcB6FgsgqBVaKiDouQeE2/lZTLptN
   AuxW+prXJeCSVr9OIbc8kaZLF8Mqx41tSdLrGx7x2jn1ZvQrI2AiIrNkp
   eJdfoLEWfgt98gWZHpeUgo7zsErJ0pyeWi5uFBh1kIAm6XAdmfnHKfgbf
   wCzMH6VKR0D0A4S+be9zlzFrkLYHg3WUxGBWwKBsiN/1v3wQvaPke/FDJ
   g==;
X-CSE-ConnectionGUID: QxOpDYx+Q2W2OJ9m71C0CA==
X-CSE-MsgGUID: yG2RIhO4QZC1pSuoR9L13Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="111031900"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="111031900"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 09:13:55 -0700
X-CSE-ConnectionGUID: Cg0X+tu9RmeUHldGQ7JxBw==
X-CSE-MsgGUID: 6J2rjVHeRsW5/EYsrU/rmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="269558154"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 09:13:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 09:13:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 09:13:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 09:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h13pnolrceb9bU1UTjBGwbEfSg9nRMWz95i+CzvT4sFHPmxOPvmUxHe87HEE5VZXq4ILhWpCnUdf3wQ7D0k1P8oD+MyrCvw7bR9+e0e7ijFeKz64/3lE8/0CMgds+EnT/Oyr7Eetn6ge2Wgt/rmHWqJSxR2xWPfJ0QOl/nZj8vtQyvyMIP9AJZjmC9Lw6tErfr+DhJQohJpPtYM+J345tqgRBfYkgVFnXCyFdHUJnN8xsuFRqE6xcCrZtBwxgp1PAGJf23UT2+tkyxv2Lhtq2M77UAmlYBhIeyKdgbesuJzYRnHS/PKKzLK484z8AXJABQrmMOc3NRQwSLF+JHXpyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJIIG4AFn/nLAZeNH1PknGVe3uqXepfFa1gWwgjgCIo=;
 b=RpB+EwfSQUOHg8aA0V5r6+S5hfrB5Zsb1V0/QwR3/d0LpfvkHPyvoqyo3u58a57aId96XIhg4u5zDlWRg9V89bMSDk67bcrcB5MUbiy6yS00lVgcS3girQbZRadIViXFwT/aAyd+vDrPFE0UrBUE/FpUfYcq8dHRh+1C/f2Lwed6rUNXSwleMtfW9v90/MR1zjI0wsihHbysneIqMCRNTFm7n74YdmmUhaeXWincgrnz+rKZ9X002qTfm0k/sTc3wLAWudlhMIPFhBOef7EnCjDZBjjvv7Hl0gzGFSMz5Jo5isnyHLznx6RHIDDkKIzmES3TlDYL2Rd8FZXO9YVucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by PH7PR11MB8123.namprd11.prod.outlook.com
 (2603:10b6:510:236::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 16:13:46 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 16:13:46 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Vijay, Anoop C"
	<anoop.c.vijay@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
	"Roper, Matthew D" <matthew.d.roper@intel.com>, "Ausmus, James"
	<james.ausmus@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
Thread-Topic: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
Thread-Index: AQHdM+USZkUGPnycIUeg6ZOSVYCMw7augh6AgAH+L7A=
Date: Wed, 26 Aug 2026 16:13:46 +0000
Message-ID: <CH3PR11MB04614971FF5B6E71CC17E77AE3C1AE2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-14-michael.j.ruhl@intel.com>
 <d86e5e19-e6fe-468f-1a9e-cf51c0b2da2f@linux.intel.com>
In-Reply-To: <d86e5e19-e6fe-468f-1a9e-cf51c0b2da2f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|PH7PR11MB8123:EE_
x-ms-office365-filtering-correlation-id: 3e46981f-3473-4747-c060-08df038d01f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|4143699003|3023799007|11063799006|38070700021|6133799003|10067099003|56012099006;
x-microsoft-antispam-message-info: TbyMsxOV0NgC87cOxZsngE5wEDXBS4s2MlAGwG32AbTVTGdRIQu72npUlGRpDFvobuSinOc04Jy8BRE3DytrwxZnq+Sf7OfiHWyzqGpWSlJWoIPR7647o0f3i6rv+9po+ju4+ldJZGzT4yKrul4QfpQ/S1Dd1aIRc4+aES56Y7df72Gddc/65kjK6orv6KHmrWTpRohPX4Ng7lgrhF+LMRVccF41DFq2xhZjaVv2ekjTe88kzyZ+ipV8o2t5+uzR9we5/zmXVm7mWBZw0L85FsGr9aa6X1cUueJWi24eanGR9r6p9YYZYy4VfxX+1fZ2xNYcEXR/Shpzf/EynoEXVn40dA1Lm0QefiIzVv5XA1LxZJSGgCkiqj1fsaqSUWSlfuqYbkHFna8DuQPkHTigWuevwA1P95ifhoFNbH5qrtLHDzXZiSVrXbzNQh+J8zkbLN4kp0iEJ1b7iDNc6i+2p3S6X8mEt3OA5K4H2w3Vo+HVuKaj1vE330a0vmq7a01j+v+cNZvRwXfhboNwNHSdatBDK5/nX3oPYpBCzyz4lc1/w6lTmkiAClxR9bG8lfZWO9ej7BNDlucgGDJ4mOFw+N7nrltNfGp+pbhKyiVpO5lJbyuxVnXP2Cp1wTiSNwPUtkRjRd9WqXc6bQIgVH6EOSRCsj0j0M5fq05KZG3idY2PLO1jfFvHkSGQs24aWsVOMFoZS/R19CEyDrzULgwqJYt2NEvdY1cro6fuJ++r1OQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(4143699003)(3023799007)(11063799006)(38070700021)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rZh+owW3qkNCq5Ypf/5Dg9N9+yFGaByf43vXQYm+I3+gQSiHjPrlPm1sbn?=
 =?iso-8859-1?Q?B60d6DdwEPfVjhN61RdzqUJZTUkusdbrN4PJsVs/59Z/dYf97k26Rhx4ms?=
 =?iso-8859-1?Q?QCp0BD+1GUuOFRFl/JHHXfDU13DiqOViEEwzlhJGdSyls1IOKnjP8O8+jU?=
 =?iso-8859-1?Q?8DSsp00of2lHDRPPn6o0agrH0vtDnwNNB8bPXrNMtvf5nEO1K9FBQKG9Fm?=
 =?iso-8859-1?Q?KWPyf52pypvgy2uMPjWDBaaArbj053z0tr/slnrYJtMRnTfyKxfzITRK4A?=
 =?iso-8859-1?Q?34M9c/uxi8LsyFYq1UP7EZNCL0KLVHv5GkMtkhHEe6YiXXDWvfsxqktvAK?=
 =?iso-8859-1?Q?ehJT4/TA8JiA1DbTS6xdzXQ55tYhaZiDn2uRZuDQj1O7ZsrvgnXtx75DzQ?=
 =?iso-8859-1?Q?JyPJLv4ybB1h9Wol8FewEJTOSBipEfMUD7kM9SvGTsL60PTQPT7IvU5gtA?=
 =?iso-8859-1?Q?MWncJJkXYwTbnek0e2E3u8TKAPpXtde9o7tkctSCnOIiCEKDyoJZYLcKn3?=
 =?iso-8859-1?Q?JmTWy6x7knKlfTbp0hD9EBjPsOe2nhelDBxQFc33MPwFfWpg13AFtrTk02?=
 =?iso-8859-1?Q?oTls1W+kB5YGTwOACvDYW3yKdX2D+fd1tqq+pNEDYyjs9Jjem3RaSS9Nq4?=
 =?iso-8859-1?Q?LJdQiGvjo33QrWSU4ioX12QRM50iKZxMUJ/TnBDaCDTL3WToD7xXL9kMZY?=
 =?iso-8859-1?Q?ALUtsXtl75Rq81IjHddsiSjQa0fbYE9Vp9DaCLRGwTFy174elK5VaChhG3?=
 =?iso-8859-1?Q?X4QlsDQOPL7KsRz4m0N0Zuo8JKmMM44iNrDbguyJ/oDCui9yUBWvyooquX?=
 =?iso-8859-1?Q?IYXsY1dYtFtuPQD+oc+MmHjAmzuBh17bLD+lGsDYkfVA7n3L17O3+C0Zql?=
 =?iso-8859-1?Q?e6MHd7b1Y3vhSgCH8SMVDAKh6AQtfi0up6/Ehmd8ksA/pSvVGnA/5fFuLc?=
 =?iso-8859-1?Q?CHLEvIJG2wWnaRrqKwxGpEcSb/xnSwI5w7spYeQCBT/1DaupIo+nkNr+Js?=
 =?iso-8859-1?Q?XwU5dt/dtfp4vG3nb+CTg0JTbXYaV7BOhFBPquGLDbhpw8otz626hxcUFL?=
 =?iso-8859-1?Q?NS78YJCp3vPaBsz80GAFFxq36G2Nc2SuB7mbukgzpsW1NiwWovDLin84Zd?=
 =?iso-8859-1?Q?/46T6/OBiUwC5DcVL33fJ+DhHrx8P9p4AnakfYnG7Heb2Oi1ro8dYXkX24?=
 =?iso-8859-1?Q?6qYwP39Ji6w1N/TV2Wm8/ICtGGMJtlvVHQQcCVAt/teruFa4Dc2/uIoOjx?=
 =?iso-8859-1?Q?kPFN+g2rljTOTZG0iUX9+yOQO/cUNDTXidesNWizjfCsp/kAZvRM1zmuVv?=
 =?iso-8859-1?Q?bxGF538OFEXpr5FCnkDHz59cNiHXOuIxcZkiwZz/UIpRZARyesgj99aCh1?=
 =?iso-8859-1?Q?YA/2TmWl8z878lUIWXK7az/XHRhLe+vk5h4a9cvZmky4UThzBH8YMzNws1?=
 =?iso-8859-1?Q?MIUoq9rd1XF/aYsU09EcntklC7zfA8AurerQQe5drFS0nFap4YtO/fpkts?=
 =?iso-8859-1?Q?ZKl+MluoRwZRizou/X9txnXNxtZsyIyw5mIKPkKbbfRjCnerezsnIi1oXD?=
 =?iso-8859-1?Q?0OuUNVbdmsXwmyzybU3Bhsi70lwtqHbE75wTVFsUj0JbohPPozaJfAPmxx?=
 =?iso-8859-1?Q?YFPV/85DDZF9PcSKETpYDF/aYPSYzvzpYq1UPo2FU6y/KTvlKaDUlGnVbU?=
 =?iso-8859-1?Q?AHMk2T1/QaVu6Y5ftwJUc/YF8qlGrHr1E8mw8OWvtp+uFB8G1sEl5fVMjs?=
 =?iso-8859-1?Q?mx5IKy1ZSpx701t4lZI1nR7/NVfdnqxMlO8qVP3YyawtJhPChxOknToSqz?=
 =?iso-8859-1?Q?l8DXNhfzTg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: i2bXuUk3FDyK1nbxWuMJHwkOyiLK23YfyDxhWIgC8C6UNuqNFD0ybwN1KfPksuPiWyl3roBRtM0LG4DbwQRKS+Kk4ljN0n7Ud1EmaPWj0b2kOiddpEm61qHjF5r2/z1a/jk2CKV9iUl59NGMT9mWRNU8ksXB83Lr5d7hiScVunoGQxI2ue6pspcmfCHpyxzlT7ZFMWzRgbHWruhczmTb2YgSIz+i9luusMDD8wtPmYizY7LKs7RrYpHVYFUOvdwr6PwnkknWCmOIerpdR/mk/uFPfkAg8fxmCUWrfYWkF+32ovtXMr5/lVqq2c7mCiqyeUlOzKw99NjzIo8tYNDH4A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e46981f-3473-4747-c060-08df038d01f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 16:13:46.8104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eVAXOe3xX32RGQxUUSnNx5SwiFc36my3msPtLgp7fzRuLYo7ChQVTEoZpF+aMscKv+4ceV4Q5YqZ651YWK02N79H4dVEHI1H8sGVUzBfU/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Tuesday, August 25, 2026 5:35 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hansg@kernel.org>; Brost, Matthew <matthew.brost@intel.com>;
>Vivi, Rodrigo <rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
>callbacks
>
>On Mon, 24 Aug 2026, Michael J. Ruhl wrote:
>
>> Some HW does not have direct MMIO access to PMT control and data
>> features.
>>
>> Augment the current callback infrastructure (data access) to allow
>> a registered driver to customize read/write access to the control
>> paths for PMT usage.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++-
>-
>>  include/linux/intel_vsec.h                | 14 +++++++-
>>  2 files changed, 49 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index f936daf99e4d..5923ad7abbd9 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct
>crashlog_entry *crashlog, u32 bit, bool set)
>>  {
>>  	const struct crashlog_control *control =3D &crashlog->info->control;
>>  	struct intel_pmt_entry *entry =3D &crashlog->entry;
>> -	u32 reg =3D readl(entry->disc_table + control->offset);
>> +	u32 guid =3D entry->header.guid;
>> +	u32 reg;
>> +	int err;
>> +
>> +	if (entry->cb && entry->cb->read_reg) {
>> +		err =3D entry->cb->read_reg(entry->dev, guid, &reg, control-
>>offset);
>> +		if (err) {
>> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
>
>Never print __func__ in any user consumable message (level > debug) but
>write the message in plain English.
>
>Also, this needs include.
>
>> +			return;
>> +		}
>> +	} else {
>> +		reg =3D readl(entry->disc_table + control->offset);
>
>Add include.

I have added the linux/printk.h include... I am not clear on the correct re=
adl inclued.

Should this be <linux/io.h> or <include/asm-generic/io.h>?

>> +	}
>>
>>  	reg &=3D ~control->trigger_mask;
>>
>> @@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct
>crashlog_entry *crashlog, u32 bit, bool set)
>>  	else
>>  		reg &=3D ~bit;
>>
>> -	writel(reg, entry->disc_table + control->offset);
>> +	if (entry->cb && entry->cb->write_reg) {
>> +		err =3D entry->cb->write_reg(entry->dev, guid, reg, control-
>>offset);
>> +		if (err) {
>> +			pr_err("%s: failed to write reg: %d\n", __func__, err);
>
>Rephrase without using __func__.

This was for my internal debugging and should have been cleaned up.  Remove=
d.

>> +			return;
>> +		}
>> +	} else {
>> +		writel(reg, entry->disc_table + control->offset);
>> +	}
>>  }
>>
>>  /* Read the status register and see if the specified @bit is set */
>>  static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
>>  {
>>  	const struct crashlog_status *status =3D &crashlog->info->status;
>> -	u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
>> +	struct intel_pmt_entry *entry =3D &crashlog->entry;
>> +	u32 guid =3D entry->header.guid;
>> +	u32 reg;
>> +	int err;
>> +
>> +	if (entry->cb && entry->cb->read_reg) {
>> +		err =3D entry->cb->read_reg(entry->dev, guid, &reg, status-
>>offset);
>> +		if (err) {
>> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
>> +			return false;
>
>It seems you need a lerger rework here to properly return error codes.

Yes, there would be a significant rework (almost all internal functions wil=
l need to be updated)
to return the error codes.  This seems out of scope for these updates.

Does this need to be addressed to make progress on this patch set?  Or can =
we work on that
in the future?

>> +		}
>> +	} else {
>> +		reg =3D readl(crashlog->entry.disc_table + status->offset);
>
>entry->disc_table
>
>> +	}
>
>This looks mostly duplicated code, add a helper?

done

M

>>
>>  	return !!(reg & bit);
>>  }
>> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
>> index 843cda8f8644..917d9397a993 100644
>> --- a/include/linux/intel_vsec.h
>> +++ b/include/linux/intel_vsec.h
>> @@ -90,13 +90,25 @@ enum intel_vsec_quirks {
>>   * @read_telem: when specified, called by client driver to access PMT
>>   * data (instead of direct copy).
>>   * * dev:   device reference for the callback's use
>> - * * guid:  ID of data to acccss
>> + * * guid:  ID of data to access
>>   * * data:  buffer for the data to be copied
>>   * * off:   offset into the requested buffer
>>   * * count: size of buffer
>> + * @read_reg: when specified called by client driver to read PMT state
>> + * * dev:      device reference for the callback's use
>> + * * guid:     ID of data to access
>> + * * reg_data: register data
>> + * * offset:   offset of register to read
>> + * @write_reg: when specified called by client driver to write PMT stat=
e
>> + * * dev:      device reference for the callback's use
>> + * * guid:     ID of data to access
>> + * * reg_data: register data
>> + * * offset:   offset of register to write
>>   */
>>  struct pmt_callbacks {
>>  	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off,
>u32 count);
>> +	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32
>offset);
>> +	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32
>offset);
>>  };
>>
>>  struct vsec_feature_dependency {
>>
>
>--
> i.

