Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500E434FF62
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 21:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421735; cv=fail; b=GQMnPTsyFQ5q+X0PJtsK6PgHw1ZSXWSvMz48/NIDrlupB/c5OeWccoZD1hIGs76U83vI5nbeYjF6J268xUZnruugimtB/fHKKE3tpIqw697ekZM3UwoweeNg8tp8tmroKt4VkuSaO0+1Iw5o27+6lVU1GF7TxZhKYOs11I04/TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421735; c=relaxed/simple;
	bh=dcy7NsQBy7XylKUcKSZM7msz+aaC5PAXbtvUW6y4zXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EziXjymgyIQXEPkAjxu3QRWvn3sTAS0Id7Gr4pA6FimZUM9l80zG+yCkBrDCJQXMCo06UwT7EZQkepuKBqF//kValxEny/hrAKqcl4mR1cBG4vbPNyu7GciIWIpNomSCJnPvpPok9MNflub+YIWIuAuTBeHBuB1W7iHP7NukFuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNXVdZsL; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNXVdZsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789421733; x=1820957733;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dcy7NsQBy7XylKUcKSZM7msz+aaC5PAXbtvUW6y4zXc=;
  b=GNXVdZsLRbpuAhEHTknMGNawiVFFa9LIrgAzcLUC2au8h/J/gY86vs9W
   H/87LnVDk37RbBh7FaS0SGrGZ42oNxqRFNgk3W7OSZZizyUIRctVUee+3
   fnCOa0rxU2/RoXKC6xbV3QOtkifTlVXTIPaxLSw9w6p0i7iuqe+uN43f5
   Pd3g4dTGZOoCSJHWN4X7Y4Mq5Xc/W+wtH2jc4sWDmDHo4642fQy7enfoQ
   SZtwMi2RMi0p/edft/lRx6nqv8Z4luC6mgMi0nMzUQ0eTtDhwsrrQxzbh
   kAIvMEKv9neYtEC8JwnVhdIg9P+6pxHGg4eyQCvvD5Oh5PKLQXPJEPMFp
   g==;
X-CSE-ConnectionGUID: XA7t8J4dRau3BG3FXg6LFg==
X-CSE-MsgGUID: frCV5BAvSim1aFLvTJa/VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89909140"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89909140"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:35:32 -0700
X-CSE-ConnectionGUID: qwzC6FXPRX2EYOQN670+Nw==
X-CSE-MsgGUID: cGLqzdCxRRqbxWlFP1CJ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270938502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:35:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:35:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:35:32 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3wPrA3gkUPQPqdlkm4i3hhHgn/vUJ+bhcJ6bzKM6v0dsE15BHEVQVYDLKWStSqNyXnvZn+vMK5xgk7QZVigsOhT8GF68ndXMwH/G9+s675HRbGhQDmbDty+dC0fkluy1iXJr+gMU5/fTn0bnDLckYDSGMOJi/IKbd6yGu/iL/swgG/xoQwdvxuU2Nx9zBtww0dRou9q1332mQPX64kYJ4og3vyT2nyLEtPetSUWR1BcaFj899uF1DaQnhyvI9EQiSliq0BJlrktvHb+4XgOoNM2BW0h/seDdz8KFL45z0tYJPmtsSplUQQzPfXIgViq+ZY4a7pN2onUvryPlg2AtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vz5EiJ9eDQoQnKKiInrGO1Q6eBjt6yhdzG0O7sXRks=;
 b=tZ/C43eOU5lMw1Qnspem7duWzwAWnaL6d6iCXZCzPzDmbCbKZT6mYoQkpfSrTPI8h89uErN9SkjSZmV9qiWCZr0WysWKWseYAZvWKfPx2E0gPW+nfMCaZ+iZwp+VeFmhOIiaFpOdVqC08Fqcw2flQN7tSv+56wETaUHc1D3durMKz9TPHxrpi8RIgngtZU8xv7BiHKl0IS5gGt56BDzNDNp8neuHkPFSyrCbRBBrfZrVU60EBfgInuwu4uzQFiJiJnQ5Nk0A7ASGbGfzpIS8kx3pdp2Fq0OJdEzKPU+Lc6eDIhIupIZ25niRvGj0Xrl62pBd5+b51+ZHOAtybv3vxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CY8PR11MB7012.namprd11.prod.outlook.com
 (2603:10b6:930:54::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 21:35:29 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:35:29 +0000
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
Thread-Index: AQHdQisuy/8SXnkrnUCAJmVKxLFaUbbOQeQAgABSmuCAAAOOAIAABSWA
Date: Mon, 14 Sep 2026 21:35:28 +0000
Message-ID: <CH3PR11MB04614905AE7D4C90CBC379E7D5C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-28-michael.j.ruhl@intel.com>
 <aqgbtrG5Lv2-ixjS@intel.com>
 <CH3PR11MB04614967EBAC64BAD0D71DF544C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
 <aqhj_PUWtei9g-Pq@intel.com>
In-Reply-To: <aqhj_PUWtei9g-Pq@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CY8PR11MB7012:EE_
x-ms-office365-filtering-correlation-id: 83d46e3f-cc70-49b0-dc0a-08df12a818d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
x-microsoft-antispam-message-info: Lj8ohiSoyZSX8UMUpP/p9X9bsAQ8szpXsnWOmmxAMBarSBFfnyYoqksxb1S2YEgXu4D6+jY0/QH5R3DXqSSmtKRBqH9GPjg7F26ulSYH3ODzZ2H5J8AzTo0eoTAc1qj7I4lW0p5KQCh/twcK++NuRvi1AYvguqFmxtFvOZ7Dk8ow6eB/6UKAotINNpL1I7PpTcvcyC7fkh7pnem/6fy4hJXyxEmrSNmLLHmic3c4CNa0fQ92+elcBJElYDcDkBULHpLgBLRqMGPL66gA6RSbDz6sKzbS+gk6BpYrACS8mFmOYIxehcifHpbh7Un0Zy2oYNhlprp9toccUfMIgC3vkF0fHgNsENbvYnTf2E4FHJB5HoympgTWfzld198WBYkRJYoeCfIw2xq3Qfx5k6UVSpOoPU3Raab5gMR5Ofn+yqz9evMRIkFW5IsguiuZ07FPKf4HhsXO2SBd7MJr46iknCVpAUx4oRvHfhMZnoj6FVbw7SkG40kaGQ1gLlEIuS8iKQ42fAn9a3vq8hWsRUQzSelaXr+mZE+I7J2C7dBumTNXNxBBQYlKzJN76f5fBb/+sLE5YjQ97AvOviD5bZ3mQ7KdPw6vu0CtImfr645v9zfKnOeRCnzGAyTgJY4j9QyDEjrg7yx+944R/Jo62YwNkYJDMm+BB+eKIdliwl2qlcvh2Xs8qx9H2hFYy+c2U/FpoBEiqFjy3efGuivUVRHB/m6aKFgStTMabrNqxV7HIOA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HThqOJkdxl9U6hqKm5JXvqbMa2xJgt5Z66l7kLoeCmqy5p83LkRO48/u3lOL?=
 =?us-ascii?Q?7eBZk+h37dyIQMPs97wAGhoRDlkGg9N01lss0Cl9yzC442zWCYbZSHNukpDT?=
 =?us-ascii?Q?A/W7t8ByvYslGXtxw7/71a+BvF9GkzJ18QqQHy+fux1Xmnl7xIe95W0UHn1e?=
 =?us-ascii?Q?3AA/az0O/NrtCBzlwb+auKQpQKoKTNHxVs5vIDy22qkygpLt+WK0JCiOw4Zy?=
 =?us-ascii?Q?1O2djctqFf2W6b6WYZrQh8UM4zcZ+pVtWdYYFNwHhgoaRB9l7ZMb8G/z4Yqf?=
 =?us-ascii?Q?xvX1FvEkZ3R64E8abnURpLkSclbQIbcvmcKtzpap47n1v0FlVgZ3ts8zNosi?=
 =?us-ascii?Q?GQJmdiYKGNEl8/U5lEl23izh+EJyh6vwMRAb7hJFFfq+N27G5gBXzRi9XDCh?=
 =?us-ascii?Q?eLUfHKIVpzeAREjVMiLLc5QaqMpeFG74j3d+AX6l6cymJxaVwPt+zjb+miZU?=
 =?us-ascii?Q?cKnfCes2O+J84bMOI5V2f6tBjcc2steY7/L04Id+GpqYeGo90wTBx8xa6vAg?=
 =?us-ascii?Q?lFVJgRXAFnevJiZGxNUnYTw4poQg70LTyKHtj/r0xLrKEnDy2sya0gSmD8y1?=
 =?us-ascii?Q?pGGGsnbv9B7MLv17vqmSg7gem2UFDFx75jhwh3ARgnzkEgB4hGqXvklFovv/?=
 =?us-ascii?Q?zN2EwO2rrqYdl5Cz0CH027ZS5HvfJlM3hfQzfevpHiE2jDR3OdfPBc5GKaUe?=
 =?us-ascii?Q?Pfkv7tVlnvD3uW3G3ZO9N1wvD8H7LYD0F/2MJ9Tpb3gSOvoBMlHoZGY2Owrn?=
 =?us-ascii?Q?h8QH9L3ES+JT1jGPhCcgkhvH3EyOvNrwCAHVCRDOnG1JXUaZoR3I/Z+XBhaw?=
 =?us-ascii?Q?bFsyFcAiFyR0TNMuVAeSTSIRK9xxG7m9EiUqpcAhcu0INW99OsAlARUE3wAJ?=
 =?us-ascii?Q?vlTx2mmr8wohxxRXfpIiTpDEVo/lW0B4q9n35iT8SUUIWTTztvdw+tvQRBCg?=
 =?us-ascii?Q?gGnnCYdkI3SkOT9+sGrMYxKR7pyr2QYjQa3taj0VXC/vui6RJk9/6Sf2A9Dn?=
 =?us-ascii?Q?cbojLuAvDyo4hmgIX6lyQI5IH4kCQ0t50MU0DcRYDMl+7ULGnnEXYCkrc1Gs?=
 =?us-ascii?Q?0r+xA2q3VJryIG4GPdmzghJqM2dPpsiruaJYXRvtZkR2da5/v2dAy2lJLT1j?=
 =?us-ascii?Q?PE2Ey6Z+uUGdHtvkaKnFO73ONVD8sAb3Wqr8qUK4yjvBfISk6jlpbAo5lZSI?=
 =?us-ascii?Q?uIK5SxJd3tBkkDZVwuyXUwvkcnd46To6nbSl5BJQmlrJn111/7qPbbq41nVx?=
 =?us-ascii?Q?X39IhXZGYvBxC06SgEz5s9cJm6yXmoMVsAPB5L1Drv+V5F//w2tWYIZYlg8Y?=
 =?us-ascii?Q?agmRtaPOi9NKUxOCsJAjlXX9699nldjZBT6e4ckCnA4pC3aU+V0iEY2wzSgO?=
 =?us-ascii?Q?NBda6spaG2Y5Fs6biy7D/9Kw9hz87DWeU73qHXmTx2ZunvHHWMwWdQupYO+W?=
 =?us-ascii?Q?43POb45b1LNxmvZQL8YFBYU9nFo2sZeszdjlOtSBCaPt+fOFD+3Sa8mMC18+?=
 =?us-ascii?Q?xwkVSwhVOSGprmiK059qT/E0nV9kKUMbQyQ3s/iCHF18ygvr5pyHyqOIUqzK?=
 =?us-ascii?Q?c2g5Z03e+c35gFOmbySGIuSfxPChKqA0q5/FZtLoZPUgxYC1pNtnSgysfTk3?=
 =?us-ascii?Q?6zw3QNnLs/jtslU0d4Dm01d/Yb4DKJWV3RGCaPKqs9tkUKzJfMcQGwlYn4zf?=
 =?us-ascii?Q?4113na+xcaAiR8QzwDzmLpozSwdV6UNwDKQ+0pow/QfGulwZDr/jRfr0sZIi?=
 =?us-ascii?Q?qgtugGgpOw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Md3pTGyxx6aVbAS6rMtkhMwNgtwKXcm26pfCiuWWMoRqnPj7Dz3v7ettkjlr4Cas6EQUErPMwKMt1uEQxCuyjiRg+C2UOSgrDq1nGKQp9QJ9ekxcUrEia4h215K0LaPEffL5imnU+ULSbSCS8b34gnCxykOJ4RQGvu7WBes+GYCTv0A59nc56PfcFgae/MQklaJZT5DhSn5l9QvcsPepk3AQa7lcce/gYhErOsBy/sdnT1utEfSsytGVeTD1hNIHAFPpiEPuKAiwh4dguKKr1CEpIlksFGs+8njIfiC/sDi/m/JEAJKXlFu2eIAs51kzeVnjn9F3K2jZ8beK/16J6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d46e3f-cc70-49b0-dc0a-08df12a818d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 21:35:28.9674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpCR3ClKgA6ninZ7GNddoB1/tsgXuQzcBilkM+ayGhzWdxl+nrjtPH63mqXJhEoDgWbiuaDDYm9eD8OxO3s5sGWEIPFFyoOul/ct/SmvHxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, September 14, 2026 5:16 PM
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
>On Mon, Sep 14, 2026 at 05:04:31PM -0400, Ruhl, Michael J wrote:
>>
>>
>> >-----Original Message-----
>> >From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> >Sent: Monday, September 14, 2026 12:07 PM
>> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org=
;
>> >hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
>> ><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>> >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>> >Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
>> ><badal.nilawar@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>;
>> >Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
>> ><karthik.poosa@intel.com>
>> >Subject: Re: [PATCH v8 06/20] drm/xe/vsec: Do not register BMG PMT for
>VF
>> >
>> >On Fri, Sep 11, 2026 at 01:11:54PM -0700, Michael J. Ruhl wrote:
>> >> BMG PMT is not supported for VF nodes.
>> >>
>> >> If IS_SRIOV_VF() is true, do NOT register with PMT.
>> >>
>> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
>> >>  1 file changed, 5 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vse=
c.c
>> >> index a9baf0bfe572..71bc359b2ad1 100644
>> >> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> >> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> >> @@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32
>guid,
>> >u64 *data, loff_t user_offse
>> >>  	u32 offset;
>> >>  	int ret;
>> >>
>> >> +	if (IS_SRIOV_VF(xe))
>> >> +		return -EINVAL;
>> >> +
>> >
>> >I believe this second one here is redundant.
>> >We will never register the callback and never reach this place.
>>
>> This is called by xe_debugfs.c xe_pcode.c and xe_hwmon.c.
>>
>> They do "protect" against SRIOV usage, but I am paranoid...
>>
>> I can remove if you think those paths checks are sufficient...
>
>I think it could be removed as it is impossible to get here.

I think my  biggest concern is if someone else decides to use this.  I want=
 to be very clear
on the requirements.

>But feel free to use either way:
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thank you for the reviews!

M

>
>>
>> M
>>
>>
>> >>  	ret =3D xe_guid_decode(guid, &mem_region, &offset);
>> >>  	if (ret)
>> >>  		return ret;
>> >> @@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32
>guid,
>> >u64 *data, loff_t user_offse
>> >>
>> >>  	guard(mutex)(&xe->pmt.lock);
>> >>
>> >> -	if (!xe->soc_remapper.set_telem_region)
>> >> -		return -ENODEV;
>> >> -
>> >>  	/* indicate that we are not at an appropriate power level */
>> >>  	if (!xe_pm_runtime_get_if_active(xe))
>> >>  		return -ENODATA;
>> >> @@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
>> >>
>> >>  	switch (platform) {
>> >>  	case XE_VSEC_BMG:
>> >> +		if (IS_SRIOV_VF(xe))
>> >> +			return;
>> >>  		info->priv_data =3D &xe_pmt_cb;
>> >>  		break;
>> >>  	default:
>> >> --
>> >> 2.43.0
>> >>
