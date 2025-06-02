Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56692397A4
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Jun 2025 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876374; cv=fail; b=KlUzR6QXnUbKPuE3wIseN42z0e2rk6g8SzkXdP4PJmFrjWojrtyPQvIYGKw/01rfJcQNLQgo4rnirVgS5yt+zv6EfblvbiNSJWz5EM/oHPiTOSojnfG6OQ6WDVWRBdaBUsoZLZxDG1ubAhDbq7/x9GFkxS8Dc6hRl29qfwvnnYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876374; c=relaxed/simple;
	bh=MHw9e5Rfu/9j4EABy0675vy6Izq6SuEnk5mOrGLpx7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=etbPXE3Is08TUtptpreCR/Fyy3uZ3DZ2p55qTvi5XjKwUYXU29aizdDRijB930rbex6yBgzIreGX1o1gG+bbTD6a2tp39D2ICjSXeJzZjS+WUjcmp///JlYMuE6fCggupbSlZ8qt5/eQa96B7ZK4C+ygfG1C3+xlVfWiyfP0K8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwZoJ2Zs; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwZoJ2Zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748876373; x=1780412373;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MHw9e5Rfu/9j4EABy0675vy6Izq6SuEnk5mOrGLpx7M=;
  b=XwZoJ2ZsAf87KqlQoGx7R3YlscEW/X00xiMd49nmHtOsdkthilYIbZnn
   TQLuh855beTJjkIqpcgeFU6HxclrE4nZdwFBV8OA+iSDJZIdEamOhsiUR
   WBTN1dkLp4o2Xvqf859fYH/PWeqBA4lsdvI1Ywhof8sOxPv80WELQrKYq
   7Wq0YxZXOSKbHnAcdpmMFb5b7TZZRecj9vDxtfs+j093B8CiJro37+8sT
   UXd+gEY5QIVtnyZlqp+kHM4zfWjlDo0gqD9UfBeNMR2X5xar4llrQuht7
   HaWZJW5K+NnBzUg5Tk7kBo2/q9+B1F4G45pBm/paJWCXr/SGes/NQZnEz
   Q==;
X-CSE-ConnectionGUID: DpBvMUukSsaH7p62jQhn+w==
X-CSE-MsgGUID: dAOV+saZQh+GmdZ7XE+prg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62279367"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="62279367"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:59:32 -0700
X-CSE-ConnectionGUID: BOGd+5VgSBqGWaIclQ61tw==
X-CSE-MsgGUID: xSI6GFOGQZe43bLrA0uzMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="144524820"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:59:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 07:59:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 07:59:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.52)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 07:59:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F24XzSrbLl020JHBWbQwavKH/HMhBUT3LGH0t59oD9KpxqABUl+JH52LCXVHGrcdA3pkoQzby3WaOBqyC9FyeB+sVz/rE4bO0VCWyj9sXIPcrghwwmcB9S4+/XW6dF97urrU1z49AN5RkhOkf1XdgNZu0OYU8hiV/6zMxFcY1WOq7Uls33VnviIaoLoyGGpKI5yTxlJ39FF7xkfY1G2mwZapmGYl1ahawA0JXC/feybdWjVmdYCs0TNmcWBUxqaWbPO8OqK/UiuGZVRgZOSjk0EOcFOv9sEaV6CXzx1d4vXNaNt4sF2iicHiBUyuV88ZBdIYxXGK+PHqF1/l8rX4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBxOR+eFn1DgR9UtBcmImv3DnkMjHnGUCAY3VoFsPTQ=;
 b=dKW3pAg3AQX4eEVDPlRiX54hpFUQNAvRkN/ZOG/Kar71YwaCTXva2RIo1GLASiDbArxsVrKsb4ggG3K5hBasvoUefmiZ9m8XJswwpYABSWeA0cS3S9UiqvHLrrDa5o4HQ9X9/Xp9xPS7jPYumMM4hGCwBJo6wmSDqB4TVHbKHyMMMvn5zpXUoB9a4woq1UPxtWPzb1u+xm6e+fplGW9/3r0W+7v1WzKDmBMewfqqoBKkroxkj5bMVGfGfCQG/S1TvqrZDcBiZfi3LXFVoXfGAH4bIZDIJ6IiL/Y8+tR/YcCrvBT8Wo3oUbVXbzg0bxUhGUxDV4s4Ix3rpfxfzCQm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 14:59:27 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 14:59:27 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>
Subject: RE: [PATCH 03/10] platform/x86/intel/pmt: use guard(mutex)
Thread-Topic: [PATCH 03/10] platform/x86/intel/pmt: use guard(mutex)
Thread-Index: AQHb0aJBBtdNrQfh3UiGN5fAUxa517PsNSIAgAPE8aA=
Date: Mon, 2 Jun 2025 14:59:27 +0000
Message-ID: <IA1PR11MB64187A2A2AD7E977C579745CC162A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <20250530203356.190234-3-michael.j.ruhl@intel.com>
 <e56d6195-6f70-d788-225a-a6438dfda10d@linux.intel.com>
In-Reply-To: <e56d6195-6f70-d788-225a-a6438dfda10d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CY5PR11MB6212:EE_
x-ms-office365-filtering-correlation-id: 483e675c-a67b-48c4-9f7d-08dda1e6121d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?FT2BCvObds7DjSoQY3WD8jQIg4P8Z1oc9W9TWUgvApxpySJZHaqADvGpee?=
 =?iso-8859-1?Q?WWk5qZGrny/wlmB2tOLGAnMjZJjSTqtoG4gzWRi64Y0GoKvqO4PBWwghHa?=
 =?iso-8859-1?Q?PERPJhfv8cILpbZEPFh88BL/ddHWfB2UUUuDe1l7TgUJjqf4Vdd1WmyvlQ?=
 =?iso-8859-1?Q?swSpnJeri2tXD8UMhM+/bw8OAapqBHQU8Wzj+RACdjYlmvsBowXKjB1elt?=
 =?iso-8859-1?Q?+7C4f8QWBWiffnUUdx85JaZnQBKY7DaRzdDn7jOtwiGmbTLUhafeIF+rcq?=
 =?iso-8859-1?Q?jeztimE5jZWQiEaDkzbxyL3gzlfdbYBBP96Kz22g29c8D3OkUS9z8VWUOs?=
 =?iso-8859-1?Q?TrG7Z5pjlVzen2DHb0TuAB8BL1iExqkSQUAdKtKYhDjQUUFKL7UmlLykkP?=
 =?iso-8859-1?Q?9J+OBcuu7eiE4i9i7I6kiMZvRlBFU2fnWFgRmQyNL2gbEW9VxndxtQLQI4?=
 =?iso-8859-1?Q?YleAc/e/I4X5thLAB9gOz5cjfddShUYGbyYiOxnJIAysb63QostIDwwJDl?=
 =?iso-8859-1?Q?/PBVc2iZ4UFktqtec31IdQgR5DFTx8NEgWN4ERDBIRGdFO98wIm6/1BOLn?=
 =?iso-8859-1?Q?N4ozFlU8SxyLkWdr9XdOVb03A/yyxNmBCyui5xT7zYcZOvQdOr+T5g2ixW?=
 =?iso-8859-1?Q?3XoDV8QPmiKqSrSSSh2uMraXRufcm+fhdTyv6kRvVe+ElPVrjGB8O+DsBP?=
 =?iso-8859-1?Q?AMRYHwtSw7QfnKdO25PwcKFASUxsPyznFTxgpuFpXhxXKmexzKyzRWulMM?=
 =?iso-8859-1?Q?LBvarxzXRUJXcf5+JVtN4H4WvP+tOikC7df0+vIRasfiYd0VVekl2bz5Zt?=
 =?iso-8859-1?Q?saThdDebjXXs9GcYJESZx+jkO3Zf5Za4bq014VRM8Mf2jPE+jURY7jjaK2?=
 =?iso-8859-1?Q?jLd1qEMRKoU+zqeJYRE8ix59A9GgUNj7iuX0JWv6X0gzaF54lQX+Ml8IXO?=
 =?iso-8859-1?Q?WI+wVNUCX+RFr+JENrJBK1OK9YnXY2PsfDIavolzlq6RQEvdOTJYeX1P7r?=
 =?iso-8859-1?Q?eHtbIjbps7b8v0X62xebmLvoa5HiBNjqVMqQ5v5QCayWXYwcNtm1df/VwI?=
 =?iso-8859-1?Q?mWXMwaQYoykrsEh+vjpltz+riBiiEnSqhmMtu5VZBlBl+WgoZ826zufWqq?=
 =?iso-8859-1?Q?QdysRlcJKgP/P5YV9d3DHn5ilXiUU3S2O4kCm6nJisvJ/312A9fBhoY7fA?=
 =?iso-8859-1?Q?b7f15/nY/OoLu3Yea38v++5sZTZ0HhRvnevdzTGJ4RKDsVFve+M8dk9dfc?=
 =?iso-8859-1?Q?+Iu1GQnmt9m240GEDCk1OCWwWPGyCfbBUYLOrTQGg22UbaxMUqqhPc2a87?=
 =?iso-8859-1?Q?YLbfjGbYjf9ABl6hiPMzOqJ8MX2AS2YYfpUSK2nU2lEbgxzu4CMILKg17u?=
 =?iso-8859-1?Q?QjUVP39KmQtQF2yRaqB687qNvQUVBXaf2ahh24eZ5Zi85yMOoAR4AOCghM?=
 =?iso-8859-1?Q?lg34fs5EU7EzDUZqzloyJIysf6ZGrY+fUvKzG/jJebwOSvRaT59KgDLtSi?=
 =?iso-8859-1?Q?OOCxrarbwkRtxLNIKExfNFFZJ7Ea5c3YGwNHgIGV68jA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kenzalwbONbXrJYD8OnTAqujKpIwSd2xb8+6pvVGM4tVfBq5hRBzpkwoyn?=
 =?iso-8859-1?Q?uE0fprrJ896BS2DK/8f523GW0kkhKANzoFlxMvbV2hwB6aKEXmY6cJn7/s?=
 =?iso-8859-1?Q?azS/ILIECvHzJtGvsz0PoCXiGz/u1DPOVzksVvdUb4DB7NVWztSCxYAuHh?=
 =?iso-8859-1?Q?1KJsNqWzITEIasYmdSqWs6w79AvJXIcS6vemnpXbJ3bQHOCfxlmTMK+/2O?=
 =?iso-8859-1?Q?iItDUEjU7dF1FtvJQFFzhH/oK/A+Uw6eISMcAGMIc3llLMX61CAIXr7lOa?=
 =?iso-8859-1?Q?nhyfAh3935ZTyQZe0V0wHBATHKh3nYbBHsSmw5Z48qs8Wm2m8NkUzpvskA?=
 =?iso-8859-1?Q?iAb8b5N7gkFOjBYHUd0dwm37xT1eHHmbrVKpnYXKQqxnZ+oMivkqGCBZy8?=
 =?iso-8859-1?Q?jmhl2BhLZJn3MYa3wMWfnhROn0rNNG0CCu11wZ9NipguZt3r/+5XyPRUvt?=
 =?iso-8859-1?Q?8447YcONGDwnCgQmvty5fjnMhst0pOeN++7y1KoN5XVst7l/+PkXfbmG7Z?=
 =?iso-8859-1?Q?+1eTy4T4Ct5xD3Vg3DzB8wQFl89F/hBuh70Ph59NReq/c9JSpUs2CkmSqQ?=
 =?iso-8859-1?Q?s2wUYCFP+XonDEZNDin8wCmrfKVgAUCDSTfynjJT2qUDndGYK/XtJEmDUe?=
 =?iso-8859-1?Q?kxQvh7qd17lg7nBUorCLzaNc+DSP/LkxZY3GlXqhUx/8exEJxi7i98gY6E?=
 =?iso-8859-1?Q?2e0WmqW27is0AJw5ariTvqJqhi1twr2VEzg1JkpC74mHvL+hBTpASm4zqW?=
 =?iso-8859-1?Q?pMqQ0Br7OAHvIy472FGwsrBeOLD+2uXhuKWnKsF4ya+9GLmODUhazp7Fr+?=
 =?iso-8859-1?Q?NkTMpiMRXbwXivfCZwCiCTeg830uqofK3U7OJtJaK58NKCryR5N/OTqkym?=
 =?iso-8859-1?Q?rlQKOwGT+1YqqXBJEHL4wmT8Y1mehsTi9sNU682HV0XolBzY3fgBlPvW8W?=
 =?iso-8859-1?Q?2c25FWTDtLz39dWd67uoQJZjvSkLdWIAMWgJTW92as6bblGTFQ08JaDvXe?=
 =?iso-8859-1?Q?VPOaFkN6DzQsBQHN/JIMyBhVSqEaGhz4uCDxf0O8JJlhhEmiI4rDIPBt/R?=
 =?iso-8859-1?Q?8NY+/lcknZTsm/MnQ9KvyR6Stttt8vt+UKIhxueRWWdTBCrPYyON1vT+0z?=
 =?iso-8859-1?Q?snj1W0EguJ/H9OoGQgWEGQlDLzxylbamXSOXRRFF25SV6z7p8is4eIGR38?=
 =?iso-8859-1?Q?1AC9/sVyDVFxmrw1C8pwtMUfek4db2zrLY/hxPK/OzTjcOZnX08CRi07gE?=
 =?iso-8859-1?Q?6aNMuNIsoUsdCvKcCpufkRQyt3a8oRAMtQcrBNg2rSvsC4tlKHT0Du6mXr?=
 =?iso-8859-1?Q?wrjF7ajpoeJMrVUukTFYdBX90d8w+plgpYHjO1mVRA0/W4T7TsQKAtWZrj?=
 =?iso-8859-1?Q?0YUVeYF92T3VTVyTO0ecoDEqAImqCC4uTekvNPEzILsUlZKC5bg06YFqsW?=
 =?iso-8859-1?Q?VKa8ek4Pl0vu2do+xjOKTeDbZ13MBmrLHjyBY4voKHIjp4IraCxEdaY6Mj?=
 =?iso-8859-1?Q?WlLoivKvZtjHira1rREYLCug1/05VIMw2itIv2MaxfP+2b4xgH6CzjGN6t?=
 =?iso-8859-1?Q?mp+2/e8sGjLdF3zolS5UuEQU9kC3s80hO281B2YjtF+2LYpVP4yy5VTVRO?=
 =?iso-8859-1?Q?5aF/p0Qs1MV5Gyv2Lk+KT+z7+FNa8Td2W/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 483e675c-a67b-48c4-9f7d-08dda1e6121d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 14:59:27.4837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8NKnz7pqIWfwmRyb1XyJAClrlJWws6Hp+WBQ8HZvrsWpSt46P8/2lw9grKWF+Sehocx9Q2AmR+nRjlkVc+YOrIuBIcSp9lFN5MTKAFCtl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Saturday, May 31, 2025 1:24 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hdegoede@redhat.com>; De Marchi, Lucas
><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Subject: Re: [PATCH 03/10] platform/x86/intel/pmt: use guard(mutex)
>
>On Fri, 30 May 2025, Michael J. Ruhl wrote:
>
>> Update the mutex paths to use the new guard() mechanism.
>>
>> With the removal of goto, do some minor cleanup of the current
>> logic path.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 32 +++++++++++------------
>>  1 file changed, 15 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index d40c8e212733..c6d8a7a61d39 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -155,9 +155,9 @@ enable_store(struct device *dev, struct
>device_attribute *attr,
>>  	if (result)
>>  		return result;
>>
>> -	mutex_lock(&entry->control_mutex);
>> +	guard(mutex)(&entry->control_mutex);
>> +
>>  	pmt_crashlog_set_disable(&entry->entry, !enabled);
>> -	mutex_unlock(&entry->control_mutex);
>>
>>  	return count;
>>  }
>> @@ -189,26 +189,24 @@ trigger_store(struct device *dev, struct
>device_attribute *attr,
>>  	if (result)
>>  		return result;
>>
>> -	mutex_lock(&entry->control_mutex);
>> +	guard(mutex)(&entry->control_mutex);
>>
>>  	if (!trigger) {
>>  		pmt_crashlog_set_clear(&entry->entry);
>> -	} else if (pmt_crashlog_complete(&entry->entry)) {
>> -		/* we cannot trigger a new crash if one is still pending */
>> -		result =3D -EEXIST;
>> -		goto err;
>> -	} else if (pmt_crashlog_disabled(&entry->entry)) {
>> -		/* if device is currently disabled, return busy */
>> -		result =3D -EBUSY;
>> -		goto err;
>> -	} else {
>> -		pmt_crashlog_set_execute(&entry->entry);
>> +		return count;
>>  	}
>>
>> -	result =3D count;
>> -err:
>> -	mutex_unlock(&entry->control_mutex);
>> -	return result;
>> +	/* we cannot trigger a new crash if one is still pending */
>> +	if (pmt_crashlog_complete(&entry->entry))
>> +		return -EEXIST;
>> +
>> +	/* if device is currently disabled, return busy */
>> +	if (pmt_crashlog_disabled(&entry->entry))
>> +		return -EBUSY;
>> +
>> +	pmt_crashlog_set_execute(&entry->entry);
>> +
>> +	return count;
>>  }
>>  static DEVICE_ATTR_RW(trigger);
>
>Thanks, the control flow is very straightforward after this change.

Checking for the disable bit after checking for the complete doesn't really=
 make sense to me,=20
but I was concerned with "changing" the user experience...

Is this something that can be "updated"? (i.e. swapping the complete and di=
sabled checks),

>Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

Thanks!

M

>
>
>--
> i.
