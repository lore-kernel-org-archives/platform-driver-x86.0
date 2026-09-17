Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1448CD55
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649731; cv=fail; b=kHQM2RR+RFxWMTDsU1M1JoE4xsMV+cFkD2VJoDIvBCqqnz4wXSLKkVtpC0BbKjO5nonbvToh3OeslOdxNSsaQ5ZjEqtFUeXYuIkGPiSkWO0G0hlVQJ67ZsQz9C00bK9YXYehZyFhiy1Lyz5kP6/SWWiBIS+hsVmEZHmcWMt8kuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649731; c=relaxed/simple;
	bh=FMBYxHsXshheyhB3cAahyI17DQ13rKbabxb0tKXK/uY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QvKsmp7VzO2fPDSyLpRxuIUDZVdvU9wgF2T++Ct1RU/I79yuUNR5cNq9iKzd8M/byRpIzJnuIB7qwGF7hAHkiOA0AoDRIcjXy/7zuiEDKoKqFuIHbrfbwYr5q7sESt5Oz5K7hHKiIYQ5TkMKlrEDcM6UtkRhrsD3f/r1HDUaAAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVaB1ZcO; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVaB1ZcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789649722; x=1821185722;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FMBYxHsXshheyhB3cAahyI17DQ13rKbabxb0tKXK/uY=;
  b=BVaB1ZcOw9oFHAJ82KYv5OC/56lvMM9HwLNFkrti+NsXeP66kBPF+oMU
   XVScqr6zFkTmRnHqvNzPev2C0HtyHQyvCUkzhAX+PGnjI93yPGqpY2X1K
   62IQSlkIr7Np+EmeNSavrRsTKxx3Ek+XqUA/qclOMJ1iILL89jLgllM2g
   ubh+p8bpJ/GbCVpFDk1WQMy+VZE4tRcCkCxpwpt7AeLl8hCzkYKSRwL+K
   xgR8eDfaSDvMjX1BKpMt/ZsgiMog9TWlvOTvt8ekJfNaa6Xvhy7C5LXa4
   O/iQv/Y5dRRedLPYur68kFHEQPEyhySdUiZjag5IbLdFNdHzYgfDGeJpw
   Q==;
X-CSE-ConnectionGUID: glwCa11tSVe3+HdrxrILUQ==
X-CSE-MsgGUID: f6jsXBvPTJGPvgNXvnY36g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77632616"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77632616"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:55:18 -0700
X-CSE-ConnectionGUID: EOgTqgbIT8SWGejFmlgtJA==
X-CSE-MsgGUID: CtVsie0sQzyQziaTys2xMQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:55:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 05:55:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 05:55:18 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 05:55:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTMi4HxzLRGcmmezy8SLl05d0Dnd+Uey/8El8B3updjslvEhu897nffpVTPjeMftlvA0wxBUbGZbSrio/fQ4f/V9fh7i75enSwrcnm108hSEaJUEcsO0I5hnglYlTZ7pqGvsY+g/piQGAyauKoIk/tpr4MoxQvnkcjTlt9TetresxhHWYRgjLbxSdOX3FYBrGIUVS0/dL0PlWcdH/0gIPGEkajRZ0SDd9PSdM0hdqnHs7BV/dhB952JB7qYoHkJP5tTaDETjltPjoUIRCGdqPcOmWcRwJq/g1LU4yUxX/e5+KPYq983qNRL/SDo9ChVywiRkhG8coz7QVAeSocSlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfEm96vfvOOuAV5/Ak6v9CDGqH9vkZEzzfyrwb2UlYo=;
 b=bKbKrvBhULRuro6DSxepMc/U+WKhdVrlHfLDA9fhfKPuK0QcZBeEf5G9G94GMJ0ZXyHzy2cVQhj+vjME8nmzpCDl5sqVdHyYyhac1X0k8m8PzXhFpE+4KQ6xfe9VafdnL6IyYbyVSYUCYYjaTjSWJEzPPXfoW14vIIXDfxs3FoIEuEziBGOr7VDma+VTgoEOaEmtlIGYvAIIiaKsDdeKwq+2PbAC7WlPZXgm2JkgynGPt3681jsMogFjc31FtyRFF13qisBH0zMv8NLb7R1Ry0O/esBA/aPJhBMnf2dtt+skDPJzmqY7BrZsg7wFnEVSw6YEZXNzZ2Eb82xGmk18SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by PH0PR11MB7634.namprd11.prod.outlook.com
 (2603:10b6:510:28d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 12:55:14 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 12:55:13 +0000
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
Subject: RE: [PATCH v9 09/20] drm/xe/vsec: Add DOC text for VSEC
Thread-Topic: [PATCH v9 09/20] drm/xe/vsec: Add DOC text for VSEC
Thread-Index: AQHdRhe+/rwzmr3xE0iBusYR8jkhMrbSicEAgAAw62A=
Date: Thu, 17 Sep 2026 12:55:13 +0000
Message-ID: <CH3PR11MB04614971E2CE95C3E8DA7A9E5AC1B82@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
 <20260916201139.2374531-31-michael.j.ruhl@intel.com>
 <054c50bc-7fc7-c5f1-e650-5233048b9188@linux.intel.com>
In-Reply-To: <054c50bc-7fc7-c5f1-e650-5233048b9188@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|PH0PR11MB7634:EE_
x-ms-office365-filtering-correlation-id: 131143e9-9522-434a-03c4-08df14baea64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|18002099003|22082099003|38070700021|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info: dKpS7+MjLlDOl/dI/wDrkJfwCXJ5z//CiRnVECNZzWHwXD8bD5KV1+BOdvROhgpIMpF1uPrDV7m6S/WT9DoLQlGo/1S/gvRLQ3ODHRdeqV2lkSTBH/E01odwab65k+YETBHGJ40dmAaaOd7xiizDqO7xOtuDds5aPtc/wieeZG+AxFmgU0pa/qfBbojfrexPL2bKjcIPDYyvJJpwvD8dz1sHxDXRxdRpGHZnT1+VDC2gWgD3YN61iUmPHTS4ED6x7kKLezzkB87hYCZVtN8nriT+MV2dWz4kNcGMlWPYBgebb8BoxRG630HmXDEILZQIJb1W9vfx5Pmc7uZYz7n1ZttqVxj0xKoDBNDYgyTIjRgm75g9OEYYIzH1Hp3z4UG04nHP7iwh3emWfhuRd0ryG+CY414zKU5FEewrbxLqrS3PwSCtcWjrPA+pbfrM7s+yGexEEz1a993DFIzebeBs/kE5x+HbEtT8TMMsDNWuXMlUFOnWAet4OEPmwpRJECrltqgeWEl6Nqzx8X1JcS9F/7NHFTmn0/3Y/AO/0LGdSGHM20qKZj52XtgNMc1kQiuwCBNHrCulWwguZpdDa5JsJEHi0WZt++r2J43q66umAa2ruFpcLlfbV17GokHsnfYAEdvB7JiCTRvUSrgde802pEWYRbQ2qvHFm6c+rGQ9nM95ADdznShHMFbWUhXOGlttQs5j3a0AeVsDRW8P0Jr09P5wF07c1+CgdHUoZFLZ3d8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VRKD3HCKYaNN2IFDLT4wwv0DZyi8tk0Y4KvLnCObwFZ0O3XUdmQ6TZjh7f?=
 =?iso-8859-1?Q?ff+YIqNqmH+Jm0tODL9BQDO1k0MuVYZ3qLHU5z0I0lvv7mqV2lYiXxCrHS?=
 =?iso-8859-1?Q?G/Fih/OhJ4AlSQ2ylsKPL9ggOkXtDm33rhatI+3sKHQ715m1pVEMF/inOa?=
 =?iso-8859-1?Q?zfC9UPIoWF6rr6qd0WJCTrzcF6LkwRsPTfv7pxxTDHSc2gH+XvE0GIaQ6m?=
 =?iso-8859-1?Q?j9pUKQYR1ZPqEHmL1AxPfEXfDSnM+FSgP9pUD/aEPfcITou5U2JRQ2UTBN?=
 =?iso-8859-1?Q?0Xsyk5obwRwynpPeiPQMcbHU54i8kNk7LBq0NRMEhMMW+ZFaY9zixDkTzy?=
 =?iso-8859-1?Q?67cmY3cfh9KVfHDownhHWiPLmwJS+bYTudBRz9uD37KTdQNVDZPXUMoFn1?=
 =?iso-8859-1?Q?WMRogivn8Fp0Epb/XJWjOIVJBRlflhblFU1fASGa94JA49Dhd6CljhSHfg?=
 =?iso-8859-1?Q?wU1AzFsBobTQF4iDJIsm+s3SHXY8q7k69/hCuPBUHcnV7ZCkSZIKaRHl00?=
 =?iso-8859-1?Q?6qfngMVRtfe03wD21Inq8R3O0sxyWSJs6MaZ4+YDd1jfN14y12gYzK9JGI?=
 =?iso-8859-1?Q?KyXieb4c4CDbpPGQUJORzCaSPjGe0S0qikjK6jFhilfcEq3sjE4/8m8mxv?=
 =?iso-8859-1?Q?nmDGO+YT+DTuxUo3I+ybb09u3iTIjKq8nQVSW3cfVo8wWte9c+m84n3rtj?=
 =?iso-8859-1?Q?vzy6V8nGhgEFmcDSAnvRp72FxjDsZO8+aCw/YYliYA3kDssoHspa816rhW?=
 =?iso-8859-1?Q?2/71jSOsT8+HWF2LN7gCiCD7sAXpyHuIKpTVIQ/dVHJvL+42w124rBHgZR?=
 =?iso-8859-1?Q?/kgHhr+Jzc6PcsLTkeDztNE514JQx+GvfsZNc9i3Kxq9pLW+4iNmp9+IeT?=
 =?iso-8859-1?Q?ruJ0yA8lZEhbm31pGVUrAm7Xm0w3sTJUamuLXTfNLiMUMjHwiY2jZGmiIp?=
 =?iso-8859-1?Q?h+AqqILQfcXDuVTz6VPzrBY2MXcLSD+cow/wrZTnRlBFplHpYWbUYGm8nR?=
 =?iso-8859-1?Q?qQWA8qsCbs2fkLBFjUdNvS951AkszvYr7xCGaeI34apVmAKEIAVRTI67/g?=
 =?iso-8859-1?Q?rfj2MNmOb9jYWfY/x7In/YKNPzuDDdRSZPAz2q62/o9Mtdf6Bo3WsaxKW0?=
 =?iso-8859-1?Q?hnuiAIFZfYdOhQJ9FEywZq0EvQTtZwLEjAAKMZ4CKNa1f0Q1ZuFh13PvYj?=
 =?iso-8859-1?Q?OroAewLZGhRsEtQaIXjES1RyNf6AoqsdqSd1UXJEi1p4pPirQzX9bitAC5?=
 =?iso-8859-1?Q?X8lT+oJBs/EbfjFFsxBjS2DWOZ+uQ5ftITkXypB9XxzplWka66VsvUX9h2?=
 =?iso-8859-1?Q?Yj/+z+mM/QqT09JmiSy6bkjpBZ4QK10lLJLd1KiQAjB59/51epEW+ycput?=
 =?iso-8859-1?Q?PswoeQbqTbiHHO4gWOPZXVSY4CLsElI9Ks8M12X4JmlIynHrL6Tdbk3JTH?=
 =?iso-8859-1?Q?wuMDfO1Z/p5wCzSARp7gkLC+OusQCT5nw93F+ycg5N2uPKEvo3eiBPjo9Y?=
 =?iso-8859-1?Q?MoVUOXq/bfUMcCIox9Avkv+N0ImjJppPPUNicaXnubczBhSYMwBeYehCpH?=
 =?iso-8859-1?Q?3jPIhF1fIilk+oT7FRVuoBZqqOh+Pyazu4YHkESLpwmeVIHqVmyplNzxJT?=
 =?iso-8859-1?Q?As4z21zqU14MUZkW+I8fe61tEV1gosPbbgk57963wQdTJvP4u/R+TYeAVu?=
 =?iso-8859-1?Q?CKiiVpIvIeLXi4Q6gDotQgj0MGCacus4IcsgTXTurcKt+Ohyeg+VNg3BwW?=
 =?iso-8859-1?Q?sFsAHHMCTMLGY8qbO1DP6/AoXrIRTEB9leVeD02uOUdtg1y0B6agGVX8+t?=
 =?iso-8859-1?Q?tM1wfD7E5g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gSi95AuWyjxABRxIPW0S2xEUUVzOtf/PON9/t/0wtT6cp6AuSGdrWqzx7+jaOauoGj3uDdTZWi8WTqajVQy83MbQYn9W6FxzZxJHwaVwpuTdZV+CLPORkIOyCgJWbquWU2FM8XoAgqXoIYIxVHdvtNysZAlTwwTofppY1yaaoNH0QtdgyKiQYu1gzZqKZVdEVIW1Y9DEcyNd/2uCh4Z6YnDsVIqzTSr2/C3OUiTOm1n9TiUltfJebxL4a27pHa6NpeW3CDxkI+w6S6fJQFnYczsEW93VVgEnZf06+97Swt29C0yy5IuPL+BRCw6tPg0taskwkTkUPrQ9DAaVHU78gg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 131143e9-9522-434a-03c4-08df14baea64
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 12:55:13.8774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QNxDmldr4UzkZZ/OQiFHrBVRlWPI7QNWnkMdAJjlUfE/CzhnlX0Vi9/dJfexNrCaMuDytdxlTd+1Xt48griX/AzjabizMKsThSQc1uiL75g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7634
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Thursday, September 17, 2026 5:58 AM
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
>Subject: Re: [PATCH v9 09/20] drm/xe/vsec: Add DOC text for VSEC
>
>On Wed, 16 Sep 2026, Michael J. Ruhl wrote:
>
>> Add the necessary files and text to use the DOC system.
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  Documentation/gpu/xe/index.rst   |  1 +
>>  Documentation/gpu/xe/xe_vsec.rst | 14 ++++++++++++++
>>  drivers/gpu/drm/xe/xe_vsec.c     | 23 +++++++++++++++++++++++
>>  3 files changed, 38 insertions(+)
>>  create mode 100644 Documentation/gpu/xe/xe_vsec.rst
>>
>> diff --git a/Documentation/gpu/xe/index.rst
>b/Documentation/gpu/xe/index.rst
>> index 0247a255f7e6..89f013418cf5 100644
>> --- a/Documentation/gpu/xe/index.rst
>> +++ b/Documentation/gpu/xe/index.rst
>> @@ -36,3 +36,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is
>provided by
>>     xe_configfs
>>     xe_gt_stats
>>     xe_sigid
>> +   xe_vsec
>> diff --git a/Documentation/gpu/xe/xe_vsec.rst
>b/Documentation/gpu/xe/xe_vsec.rst
>> new file mode 100644
>> index 000000000000..1a87548489ea
>> --- /dev/null
>> +++ b/Documentation/gpu/xe/xe_vsec.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +=3D=3D=3D=3D=3D
>> +VSEC
>> +=3D=3D=3D=3D=3D
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
>> +   :doc: VSEC
>> +
>> +Internal API
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
>> +   :internal:
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 1cb9a78ee0ef..ca5d02dce818 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -19,6 +19,17 @@
>>
>>  #include "regs/xe_pmt.h"
>>
>> +/**
>> + * DOC: VSEC
>> + *
>> + * Some GPUs support the PMT feature.  For those that do, this API prov=
ides
>> + * probe, discovery and usage (control and access) for GPUs that have P=
MT.
>> + *
>> + * PMT is usually accessed through a PCI function.  However, that is no=
t
>always
>> + * available, so the PMT intel_vsec_register() function can be used to =
setup
>up
>> + * PMT usage.
>> + */
>> +
>>  /* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
>>  #define BMG_DEVICE_ID 0xE2F8
>>
>> @@ -140,6 +151,18 @@ static int xe_guid_decode(u32 guid, int *index, u32
>*offset)
>>  	return 0;
>>  }
>>
>> +/**
>> + * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a
>buffer
>> + * @dev: valid Xe device
>> + * @guid: PMT GUID (from the PMT discovery struct)
>> + * @data: buffer to place data in
>> + * @user_offset: a user offset relative to the beginning of the data to=
 read
>> + * @count: bytes to read
>> + *
>> + * Return:
>> + * * -EINVAL for VF and PMT WATCHER requests
>> + * * count   number of bytes read on success
>
>Please also check sashiko's comment on the set of return values.

I have addressed invalid return code usage (reverted function to bool) and =
fixed
the text in my local repo.

Will push an update soon.

Thanks!

M

>--
> i.

