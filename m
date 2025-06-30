Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FE43F9FB
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320861; cv=fail; b=qywlwghsLphc6ILwTGvx+me7G2eDsyUkcLJfQupQJ8tRbJCXM9wIubOQCQfSJRmrnaM3xIjrHo5XByC7M9v0iIcFJYoZgeT85eqqB9+qA+BKwQ2eeED2gmEXvdEiAm/DcrRfsizEZhd5eVyk9T7yaa6piWx2xCteUfIzyKRIndA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320861; c=relaxed/simple;
	bh=H8/Rz7lhXpFLK3/1JvRipUKbIhroWcoD/MWK+BbmlMc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ibQGEyb+cF+yu8dS34Z+sqI+2k09vLZk94uPepNB7N8sfU2rmOGf0xW/n8vVjICk/iL7tJStYHwNSkUnTj+KRmRbiLQLjaDyW22U/I3O7Vb9ACSMqfd7RWdEbC6Y8gQm6NGBySg35tKorVbSkv0L/zXtO39I09TwE+LVre4p47M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXTlogaR; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXTlogaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751320860; x=1782856860;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H8/Rz7lhXpFLK3/1JvRipUKbIhroWcoD/MWK+BbmlMc=;
  b=gXTlogaRO9EnKpz/GQZGG4DrANbpjh92gFK4Gzgk/ObGX9LrT1QHnbS+
   Zxsz0hmJdU8WVGesmgL+chGXEvEzYY2IBcnlwq64AudPEJw+SxYJvO/nx
   70Tw08zGMYRQe3m4vNuQgBjfMf1TB/okRB0S/Bv/72Dwp/hP6i5bsHykp
   6bnaOR97Ib1y6JYtxvOrkjbJFuC+s9nskIi1WI598TdTc+I4RunnemxHV
   E3KQ0s2OjL0Pr/xtBYdAoS666lRX2UNIJHP5J62+hpGIlMSen+m3iZoUY
   xbvDQSTKoKGF6MbhDHWFe/wgP8jilE4OOy1pQaXUFG63/ZVuvI9cX4SID
   w==;
X-CSE-ConnectionGUID: k+f7a/ALSd2+6cOaxi759w==
X-CSE-MsgGUID: FBiA+728QICAnNYV+ZL+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64162276"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64162276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 15:00:59 -0700
X-CSE-ConnectionGUID: TsQdXqNdSLKu/UeHkzq92A==
X-CSE-MsgGUID: M5XYZMFaS724ux8a4LFj0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153325814"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 15:00:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:00:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 15:00:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAE3dv84uoDrSt26vkOV5L4yRvk4qK5lMLWwjoF7jXZ7DB0wqeLwMbhvnndyoBxAoKJXTjcwHQUVr37LG/c7jMpjPLQ3IDVX7oUjxHtsHo6n/I8N+DWFNTAv3Xr/6rSisI5oNiDgofbb7PDXj7317EkuZJLqs2cbK78wJ31Au9D83xpIoAGHtzQCYxx/IOYfyssE1I1jSWentcYbnrpK5AJzYcyWxCGy33pVkZpuqRR8mrqji/thaTO5yJOWdquFiQEqGJTHnJ6QB8GUrIzGK2I5Gsr93+1jC+o0h0CY6iPXyVVoHoyIlL6CPv95Jg2H0WcRWfbn55sqwmuKotx47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXkinKZnafo8OhUmHpA1ZplTyEeeItfmPX+in33kTmM=;
 b=cckVsoFzLeKF/fVZcFPJnoSJUiulwUpatEjupTvr8WCDrqPMh/GtiFIp10Ajhy6VwZbts+p+lIY08iGWPW6OMnHVYNF5+sQvW3AQIuvxQLbPvq06EqnDeF1jfXyTR+i4iKwbFYK0MrQ8Qe34S4tRINifztg/3M7pRTfi577KYO3ahK+IJnpBtI2ZGPBYDdtPmGnboZRBQdkxaF5qWgrTgRaq5NH0V2h4IR8s4RGJXIv2l/o3SIJQB1mO1qlLiSe3q3/dnm7ImSekAa4/WJw9M9iyNhONm/h5p9gSx16e6qXFo1/53dtFlCefOlF1L6xGJxxrFm/vfHclF71C3S2fZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 30 Jun
 2025 22:00:53 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 22:00:53 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>
Subject: RE: [PATCH v5 02/12] drm/xe: Correct BMG VSEC header sizing
Thread-Topic: [PATCH v5 02/12] drm/xe: Correct BMG VSEC header sizing
Thread-Index: AQHb56Qrn9FcqCuJ9UKkCUCUFriierQcI0aAgAAgvZA=
Date: Mon, 30 Jun 2025 22:00:52 +0000
Message-ID: <IA1PR11MB64182BF41B928D8A9CEF2501C146A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
 <20250627204321.521628-3-michael.j.ruhl@intel.com>
 <aGLsR6rrszH0c7RS@intel.com>
In-Reply-To: <aGLsR6rrszH0c7RS@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MW6PR11MB8440:EE_
x-ms-office365-filtering-correlation-id: 8df33986-3946-440f-658b-08ddb821950e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?dGNXaF+bvBE0FYYpupipedRuTekLWQW9RNPJV80FHWheXpWx+isDYzul2UmE?=
 =?us-ascii?Q?RX47HFVUre1AbU2AvuR6bdRioZFlULf636g8SeyDVozFQwo0XS6MBj2lHwxr?=
 =?us-ascii?Q?bZaZhR9lCAHwiWT6Lsbcx6nBYQi9IVLGVzmiG3UU1d+4PhsAKRewBog18AHK?=
 =?us-ascii?Q?Cz+avNZNBV9hym9L9UUUHHNheDKteb0m2H8G2OeguRqX2gosJn78EI6vNqYD?=
 =?us-ascii?Q?kYOMnD564IHZH9o8V+vmgL+Pl0yStm6BLTRCDxf5WH30xMmgkUP2DrYYURwV?=
 =?us-ascii?Q?iVggCuNmTWkVKOTF0FD/WHLOx4AWZ1jK21N2pujmfzAtqsu3vDCCyGP46Hs1?=
 =?us-ascii?Q?Gl39v4q+LtKdlExEKI2ln5m+kut/ecmyZxCpOojtMvbeARZhgaUOvtVw34Yv?=
 =?us-ascii?Q?XoOdPu6iLxridZX6zRS9JrlZz5iERFiwtcXLAzRuHeh9XjNP+4MF96aCkns0?=
 =?us-ascii?Q?Av+CQCh1ge+ClWoOI8i5hVq0NizMvipe3H+aGlSJQ772TtXNbETL9LEhz0q3?=
 =?us-ascii?Q?gehdaarUohSDMl9iIfqdpUylrcIRZAlqW0JfypsOrr5OvgL3ru4LyOOusR2g?=
 =?us-ascii?Q?KWkc/mOx/E2Jp5+2gGNwURfdGi5f+/RXbkivLHJHlEbWNSZ8ThVUzFSOv1xz?=
 =?us-ascii?Q?aGzOG1QCYfmdeER4qK5pfcgFywkppjZ+UkSx8MjO7tMfr48WXzMKsiLVa4go?=
 =?us-ascii?Q?xH8dIukt2y8RKJSzk88vCu3F9MHuvyRzua4Qj/RsTDH81i4ZxmvWdI3QX8Y2?=
 =?us-ascii?Q?9gbgyl55zieDcDuBroiJ3J1RGYe+xUpgFEJliNfrGxRmPenz4mebqCVym5Iy?=
 =?us-ascii?Q?98hGMqbYf2xrby2CLxUBVfMjHpbFqlbgRmvVscWk+Hkz6W1zD1wbJaczIJ34?=
 =?us-ascii?Q?MeoknHgqJC6YJLTht3hXj2gESb8UIcaDpe9ludEfJfau6vDDRrDtPRx3n8kL?=
 =?us-ascii?Q?V0VDDLLKXmZyyQ2i3jVYvGudSYUGF5Kt9kgrdDuuEC1Az1m+sv23aJCDNYj/?=
 =?us-ascii?Q?yU7FR0evcG4NdFia+tzL6FFngr3JI0HfY5lXfWpSbIYbMkgnx0sY3C/HbgUM?=
 =?us-ascii?Q?12OEjr9PpszuUruOY5oXFoB7PtgOjn6bnT49D9h3fYxl05ZkwLHJVpJrfdKT?=
 =?us-ascii?Q?lwSMzEEsYpyVOSXt+gFBV/LfydKGdRGsZAdtbCf1WP3MAqGii0Kn+7hvQpgy?=
 =?us-ascii?Q?J8J2xE6aQCJ+5q+QoeBLkxc93GNJB3pmLQAzbdtei0FT79mQc8LIE4ZwBoqy?=
 =?us-ascii?Q?y8cV6512Zhp7UQJHkM3oDOYHBNgwdHi4Oac+IXNSregDC2ZLxWjg9RFjEhp9?=
 =?us-ascii?Q?ljnXzJAB41Dofe6kgKU0MTS+TpX3Oo68cOph79ZtiOK3G1VXcrlwXAraMgQg?=
 =?us-ascii?Q?FO2jXXtfRWbwOIgrX2jIaFESsXpAJwaiRIi83PXYkmijyaxxdMOYHZj0xyaY?=
 =?us-ascii?Q?ydHc+w3XKPvkUui7fxOW4KJW9ttve1Jz4/BZ8+VsD8c+s+IGVSTNBsEsAZyA?=
 =?us-ascii?Q?2oQZtFCrD14Zzw0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ejt3+kHNyAUKMoUlPLupy5457GEXNxCIOdp8F0KlHd693rOKzjBV1cP8/V+O?=
 =?us-ascii?Q?RWsXV2MRen+uin5RulxvLiOcGg9mB/eT3iZ877xXS1P8za/x3mvaEayIL+Ci?=
 =?us-ascii?Q?VAR3X9K3yIHAAEHtahFDo8KXuA5F4e2O9VgEG6MWGVBq0DjeRmtTfURmvX0w?=
 =?us-ascii?Q?CmK3JtJvTgS71W+iuFYwq03JvSyzJRM094OEPs/A4tXxqX5lhG8W953F1cpU?=
 =?us-ascii?Q?hiVu3Jfod940z/i4vvdXc0vo3dIM/koDejUkwWY4HzxbX/ysNl8Tz0uomhDk?=
 =?us-ascii?Q?3ZsuEekMfrsYGQ3XnUC+qhclUaGuS5emmtVVX87lknQEExFYyRuOGWFwgJuG?=
 =?us-ascii?Q?LqB/RF7/NglGjZ21CEyyccONBETtVfBnHHy8lzML8/jfuD5TjcIMoce42ATZ?=
 =?us-ascii?Q?CSX1VyI3ab3EwzZkJRQeoDZkjV5cxzmonS6FYXUVkRiFKGW0xGnxbuwHd89/?=
 =?us-ascii?Q?v3v1Qf8BfxNTagrITRSj2l2ZKq66+e0yEsAD1qGCUu/y2pPwzRSPCJMog9IS?=
 =?us-ascii?Q?j02nDhEYkZC8NrgGgjhRArovhzJ7aOeOzFkaO4sLlVJoJpXLywMgMfuGfbMS?=
 =?us-ascii?Q?LGVDal58vOA61k+2gMyekuN8texNfwnhsTOU3LRq2Z8NGiMkqs8Vs2h/nFnE?=
 =?us-ascii?Q?mK924NKSeYVRpswf89Wsaza4VIsqdlRxaj17YrXU1rI6UDNNvEUh5zqpPUsr?=
 =?us-ascii?Q?wRn/tNIUGAMFUh0GSUcRkzHbIgPcnrGBkpuHi9e0mXx2F15HYqyLUARRiczl?=
 =?us-ascii?Q?yHuw/5mDTUV40qionjBpOSqbVRQxTV98sJ6BzTXt+kw2L65yA8UVasfAzUEQ?=
 =?us-ascii?Q?ZLqu4ovtp0TMjUIkXxgAcyiUHevIBGizC3NNmkfU2mhKxGW+UYCs8Gka/F7P?=
 =?us-ascii?Q?ZLFjjKohgej1nK3NpXWGNbUkD8XqQr2CfBCJhpAUPFMLyz34pGmJDA1DkKFt?=
 =?us-ascii?Q?NPAyziBvG9F4+NVtmqS8XMsRxo+Aw69OGYIz9uTjk5PQiZjoTKwC9MZ7xRX1?=
 =?us-ascii?Q?UFIE0pp3+WIgwlxPwFDMGnd6G3p2NpfZvJEsETWLa66sKyw7mGFqj9bkai/A?=
 =?us-ascii?Q?rFFQETIZkSWWHsbhGRWqsgH6Rkk13o1NHeKzLxyca6poqb2fbc1w/FwD6iVx?=
 =?us-ascii?Q?28Ubyx/KXHGSA+6lRJYOFsvdkmjMN0I0IaeYEmJ4Qy5emPfmgTDrKmY0cosh?=
 =?us-ascii?Q?vHfZds07w+uO3mOf/AK0PMSmMuavyIi0Skb9L3F05KUgPBtGa7+NyvhcILR9?=
 =?us-ascii?Q?ruKTlIfN0+JWNaEM41yUR17gsaFYMFcJdFbuo+q6KHFUJ5wQnEOEAL1LiM6H?=
 =?us-ascii?Q?HoU3rHOrMW3oNH4U/+UR/7v+b4cYz67tfdtsu7bOSrQC66/Gnc8d5RD2Nklm?=
 =?us-ascii?Q?ghROzxnfCgWszS1B4ozeF8XkBPBNpR5arkOpkareshEpbwitNfQASgcxJiqc?=
 =?us-ascii?Q?SiRvLr49JtKnY5Vi6+ah/ulXvSRbSnjkdbHGjTD31ggAvZkg4bw4EV82LfbF?=
 =?us-ascii?Q?dOqqV3TXmNo9SrqjeHNNprBJ+sLH4a7trVF9PMv2CIBa7wqTNrbZFpEenZDV?=
 =?us-ascii?Q?mU+0no+iRH4pjCngIV+cpXSLhzBr+FU5UfwwqNP3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df33986-3946-440f-658b-08ddb821950e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 22:00:53.0286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Srma7dFvA2Vlj6JTcjWkjuRCNf+v0qa1TLTi5I8pjRbJIUTuwEXudnc9GfEvH7cC9dDbK2PpJOp6BlC0OwAppO8ErVWKttdG1mZsl73Jrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, June 30, 2025 3:58 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com; De Marchi, Lucas
><lucas.demarchi@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com
>Subject: Re: [PATCH v5 02/12] drm/xe: Correct BMG VSEC header sizing
>
>On Fri, Jun 27, 2025 at 04:43:11PM -0400, Michael J. Ruhl wrote:
>> The intel_vsec_header information for the crashlog feature is
>> incorrect.
>>
>> Update the VSEC header with correct sizing and count.
>>
>> Since the crashlog entries are "merged" (num_entries =3D 2), the
>> separate capabilities entries must be merged as well.
>
>if you share some doc I might be able to help with reviews on this.
>But for now,
>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>to get this Xe patch merged with the rest of the series in the
>PMT subsystem trees.

Hi Rodrigo,

The data structure is matching the data structure defined by section 7.3.5 =
of this doc:

https://www.intel.com/content/www/us/en/content-details/710389/intel-platfo=
rm-monitoring-technology-intel-pmt-technical-specification.html

Originally I was thinking that the data structure was just the basic PMT di=
scovery struct (Section 7.1.1),
a misunderstanding on my part, but this is the Crashlog discovery/control s=
tructure.

The two entries are consecutive, so I can say 2 entries and size them corre=
ctly.

Thanks!

Mike

>>
>> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
>>  1 file changed, 5 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 3e573b0b7ebd..67238fc57a4d 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry =3D {
>>  	.offset =3D BMG_DISCOVERY_OFFSET,
>>  };
>>
>> -static struct intel_vsec_header bmg_punit_crashlog =3D {
>> -	.length =3D 0x10,
>> +static struct intel_vsec_header bmg_crashlog =3D {
>> +	.length =3D 0x18,
>>  	.id =3D VSEC_ID_CRASHLOG,
>> -	.num_entries =3D 1,
>> -	.entry_size =3D 4,
>> +	.num_entries =3D 2,
>> +	.entry_size =3D 6,
>>  	.tbir =3D 0,
>>  	.offset =3D BMG_DISCOVERY_OFFSET + 0x60,
>>  };
>>
>> -static struct intel_vsec_header bmg_oobmsm_crashlog =3D {
>> -	.length =3D 0x10,
>> -	.id =3D VSEC_ID_CRASHLOG,
>> -	.num_entries =3D 1,
>> -	.entry_size =3D 4,
>> -	.tbir =3D 0,
>> -	.offset =3D BMG_DISCOVERY_OFFSET + 0x78,
>> -};
>> -
>>  static struct intel_vsec_header *bmg_capabilities[] =3D {
>>  	&bmg_telemetry,
>> -	&bmg_punit_crashlog,
>> -	&bmg_oobmsm_crashlog,
>> +	&bmg_crashlog,
>>  	NULL
>>  };
>>
>> --
>> 2.49.0
>>
