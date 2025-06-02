Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AFC230BD2
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Jun 2025 14:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876198; cv=fail; b=TJ5LxWuBa/zAZ5yNdxDo1/Ib8917L+36gGGsy0093B/Cx2vWtPJb5wCoTOLaCAXWMYioMOiI8Jun3gPWdKJHckUz14EJLYxklry+EPxachv2vMgiLP1OQkPIvlT5x7d9aBu6R/ZaXXCmDWjZEFIj9j9+GoXoDTGQ3m3l13Uw31k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876198; c=relaxed/simple;
	bh=s+fdHq7T7JkBGhwCPMUriplT3XHF7VraQWaVcDWNit0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BLk6We9F2d/mWgfJRKSdRcsCkcTwCJ26n0tQiK2Ufhutux8RV4nQ2bhzQpc4Au9+2Iq2Y50ndcZRPVtF6Fh/y79hqkDH5OQJyjKp4W/r36kitunrZEMCoEvKkIo596VSiESn8+iKFYSiu24AkcyPeM6KFIpStGkEEmx0j8Dr3a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gw8wvzRV; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gw8wvzRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748876196; x=1780412196;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s+fdHq7T7JkBGhwCPMUriplT3XHF7VraQWaVcDWNit0=;
  b=gw8wvzRVmuU8PdA6R1eu2PiO8uKNsrkEHIbN+sY/D5YqJ1P+3t7VqSUp
   z9yhT3Tkf/yA7AwdPPfF+4Qhe5pD+AKU+gspoo9iMuQiPZXeRc7hA/leQ
   qMfugwaXqMQG2VXbYEM/CSK+Ko0uM0QsF7KcgXDnSMOWR3CEVAXq6MveN
   gZXyBMoTuQjqrHtFiFDmMGx/n16+o3aRkTqJOvv9l3GaTBSrss/iKP4tL
   2ApPlFZt0Wm35TpO8fO0j50063E4uL3aXmpqnh4KhKX9gOUg3geNlfCpv
   NpW+Dbvjs7NDqLlEz9teyw3yNcRPC4Tt4iYjqMV+M20EsUHG6XWos3/Us
   A==;
X-CSE-ConnectionGUID: L32gF4ypS76byH6eax+UHQ==
X-CSE-MsgGUID: M38rKO5HRQ+cp5Luixrybg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50753193"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="50753193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:54:20 -0700
X-CSE-ConnectionGUID: smFXrLKlQ867xFwM8gi68g==
X-CSE-MsgGUID: CZKh8Z8iQlqgif64Ao2hOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="145180147"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:54:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 07:54:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 07:54:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.78)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 07:54:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEIKyvG5dWGD6o2s0Gt0npLDSASi1E87EP/SVDlOIto8hIWXUQURjhsFfO+oE6iX8hGpOhKNnh4DFSi6P+TXwGW7R8nSl5MJY/amX9Z5dW7CYZ4cMdSbu7I1o09Pa8AqfVRypqj+P0oeuNMdBp35cp4LJ2Ov018Pmec+E0Vd7/2B7FHKSBqXmpstPD1lnLdmV0j7e3dK++65ku3yCDFo6n7yTfx7mCzmPEdEXBvkXVdxCw7mm6gdOzAPUexMNbDTvNffwtvl94hMw77jZhA2qf0PDx8syQBGXmJi7dbajAdoPKeqPacJXF42uT3cOt+eoSfyfs1jvR1uq1q1soY+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qDNkEtx+YYCIPMS5BqfabWIYGGnEl/PGXk0HLyV+SI=;
 b=ZqKPVKGInmxeRur8ok3jWLcG8qjlsRFqfBk8xeuGxmVZrR2LQkrUag+Z7rX48DNxz+RzW2lwYucAyPaQ/BjepYL5GQ24E3w6UEQblha98czdNelSZwEC6vnesuX6Ap/BOMyARJKAHraqtTkznGr1RuVM3a1OcFHGjc7YSduHSeO4QmdtH3UBQImRXCMONrojDVMFZ65QsS3ZLAtL1l01QLf0AQ0c+9+5zbjJWKhM7uYbijX5FOXaRaqj3Fa2aPfrzBPOcCzH/i2vkk4NOCnV9BlrQBRHboP4EQV3+zkkIDfXPcr/GP0M7AsmAtsC6dM4iodRW6H4z/kN7TOpHIMCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:54:06 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 14:54:06 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>
Subject: RE: [PATCH 01/10] drm/xe: Correct BMG VSEC header sizing
Thread-Topic: [PATCH 01/10] drm/xe: Correct BMG VSEC header sizing
Thread-Index: AQHb0aI+RubkohYyPkCEIS4ntP8tU7PsM1uAgAPEmGA=
Date: Mon, 2 Jun 2025 14:54:06 +0000
Message-ID: <IA1PR11MB64189AA531AA745B91979693C162A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <72b57d0f-c4e6-3515-bd46-062f159c4456@linux.intel.com>
In-Reply-To: <72b57d0f-c4e6-3515-bd46-062f159c4456@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CO1PR11MB4804:EE_
x-ms-office365-filtering-correlation-id: 6e6953e0-8494-4dc1-00f3-08dda1e5528d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?fbmu7qa+jNcpGVoquEdAw1BDl0b3rLwyv1/POLOKNx4giWRQWTWSqJ91Ch?=
 =?iso-8859-1?Q?l8BpRmQF0CMsQekVu9pMFXg87W4yjj2tnW4EPELaQR6u0lfRntLZj3t5wc?=
 =?iso-8859-1?Q?hgVOvIuo7Pq2+c28ZphiJvkcsjqcSTVQ705b9udXDFxiH8tz2myN84oknB?=
 =?iso-8859-1?Q?PBdTy+tejXMIhvHwgRf4u08g2ohFrrF1AyI0C/oHmuvqjL7MNNTCuNFoxU?=
 =?iso-8859-1?Q?6lKecYZsRIO/qS6QSSjVuAtLvSSo8JQp/Y7cFmXwbGKLkQbVo5qcODjhEE?=
 =?iso-8859-1?Q?AYotsifl3oJ9DsG/thIHqmFn3tiZKY8ndpoMbEv2fLwi1J5yZPu/c2ngkI?=
 =?iso-8859-1?Q?DPYP5pz8ddPOIlYi9WHNQNu//tLgn1Xhm8oMelBQjBMusWvoRpBv52w5rC?=
 =?iso-8859-1?Q?bDuRgjsCtIjAc+lZIc578nsPjczL5S3JNDhKJ46XfeIR84WG2QhH7FfkCV?=
 =?iso-8859-1?Q?ZBjQ4dnf1Cg+iox/tCV/+u32LUjnD9pMtCdQCgcLkMrxd5z5KhkjpTmcYR?=
 =?iso-8859-1?Q?qlT05te1IDlk9/IKzug1TZJW17BkRk0faJeXHAxo8f9DTxIL7VDc/gxAiW?=
 =?iso-8859-1?Q?pt3rqI5gHXvStppf39hT6/kAHkVgkgAjeWu95I3tO2pVBGrqy47SwsTY2S?=
 =?iso-8859-1?Q?okMhf5HsJ60aeKMACB5wC3UQjYrx//IiceIYwzgs0CepEhSKU54FB/sLLG?=
 =?iso-8859-1?Q?oZILePh8x24Wjau16pJKrKOfrVQVVKe5tuIrJcaP8KujjUvhbZldlGUQl7?=
 =?iso-8859-1?Q?0yQ8iem40Kn9PSaG8f/tC2FmvJD9kB+W/FNr4fIBYakwe+rQEdmQU1p8wo?=
 =?iso-8859-1?Q?awKDGj3dnZNMtdKFa3LrLaHiyRpNtDVmsvOMEDBp/Qx0noKZRvYxyXLzSk?=
 =?iso-8859-1?Q?4I49zEJVnOJIVFOynQWRdQQ+VP7j7RbxRK/t3lB3zBUH6b9z60wAmbwr5w?=
 =?iso-8859-1?Q?wunIOW13OHNsbieqK60dVd6o/8QtI/e7gKnWfIm4AleaCR0ekp5apNUyj3?=
 =?iso-8859-1?Q?dFLFXA1R5RjUuwA3RQFunwAvHx7iMcIMNWn5tzju23l4gbMs9OGOKY3f/j?=
 =?iso-8859-1?Q?xYCU9UFmTN63Dy3cclzb0Rm6lkWEh3It2fRnFzIr1/A5aOMD74kFe7SKGl?=
 =?iso-8859-1?Q?4uLxW1YU2O4Q31oATblEseIuDqHs2qJ3H+JMnbUJ3MpR/OSh2Dgj7BxxNi?=
 =?iso-8859-1?Q?VAOtzDU5G0ZXv8sF11H7Wf4dGPnEA7cviZlFzNqxIgqmQqIbbVF5UkYTrv?=
 =?iso-8859-1?Q?w/+ykPmpCAJWj57p3kTKP3npE/UgMMAxwxcPfH3AX/aN1fxnVLgK3UaY4x?=
 =?iso-8859-1?Q?EXheJ1y3HTbulYdAZEuKDemtUvbQjOt2SlXUqnmO8BLe61MT9UEM+SXaDt?=
 =?iso-8859-1?Q?zXScdVsABur83gTHV5NzWscEY5yVXm3jt0B4JC//okawQe1Lmize1PSceO?=
 =?iso-8859-1?Q?8MX8pxcOurlEJX4MX+7rQ/eyB6I9InNzjLCghYb4FvGLFr/GsVS1y2CPsL?=
 =?iso-8859-1?Q?bbhqTXGSx0akKgFrg3Hz9yBCIqCh/OLJncIkL7nFNxlw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KbhZeYP+2p/HH7x+jlxMEslw3kPQNxRuS9i5mVCHqRa6uKNDb/qHr4b0xf?=
 =?iso-8859-1?Q?Oog+ohUrS+N2fPDFY3rPs45AdcmeYZI8TWkKbogFkNfEAtn+kPeouXwTOl?=
 =?iso-8859-1?Q?WCCLomAYxmnzrC0kORkdC2LuINnGIGuI26E4Ayb312nQN9V2ahcY97bbYy?=
 =?iso-8859-1?Q?W4enb1MyTzXOcKBkch9cZ46JrbsfZ5SCnYDk0WD3OtF5vtS25+eQAiWaZp?=
 =?iso-8859-1?Q?Xlxu8imkOXpXQtGIwVkwJutLWEK+8kgoWpIw+eslYB/YVVLOFcCb0DDqo1?=
 =?iso-8859-1?Q?HhXuiFyast+mnUZIX6jtplWIztlevQCIAt/DC+QanBS3BHt4ijKNqmsAEV?=
 =?iso-8859-1?Q?b8SCU86qJavA7yP+1BsOAzYUf/jOBWuCQdwxG/sXCRKt2mNmYaosqbHC+Q?=
 =?iso-8859-1?Q?q9K6nxcSxo6+5peKyXNnz0Ay2V9hpCFSnxB996UViLvHoTaXqrB4O2EZl6?=
 =?iso-8859-1?Q?OEYm62K9ahvD5Ic50vfCiQWHvLKpotRqctlRFFC+I0CJI5pRApNxopFrqy?=
 =?iso-8859-1?Q?HhhhkKUJvuoI993Z4o6JGXLu6GIV2QANqLBxE+opSJXz5tdapdHgeAVaXe?=
 =?iso-8859-1?Q?D7iy81Iv7ZTWBuj8BlrPtrOL8syRrm1RZ5SCbHXEyUdGULaiM3WKQzdWsr?=
 =?iso-8859-1?Q?cHQWtyjmNeOa1kPLmcPFwdBTX9SzhM8JkrOSV8xy8ikI2C27NAlXef+s7k?=
 =?iso-8859-1?Q?S6dA/ecbi50IMH5KSDbL4jKtxm3cdLjKKY9dHeFBuA/o7IxycRqMmrCuug?=
 =?iso-8859-1?Q?miLW64YSM4skMm83CZPmpW9snSe4TW4tSd4ERTbZQYtStfxDRUuVnRoNXZ?=
 =?iso-8859-1?Q?10MduEp9TjTCDcVjfTDNiPE23pm2VnZMOtkYIGo+uhidhnnB/ss0dFwxmY?=
 =?iso-8859-1?Q?MDhGKstNlGfgUM+APVuu3ncda//ynwV+4aTW0k+943q1cCrNqYa0Bf68bO?=
 =?iso-8859-1?Q?rKqJqXtLASbgK7ZSb68TU4Lyx0B0KJTPhSFL33aefNCWp+qjnu98sK1Xso?=
 =?iso-8859-1?Q?V9SdWRO5NuVqxlNm4MmqTOfzuyWHzrNqo7yPqDjbvWQ3i+J1uVZ5TzlIF9?=
 =?iso-8859-1?Q?FcSm1xSnzkuEFMuwGCFxn01YqcCHuWf8BlDJ4hasN2E/WOFrHruJgkmK+R?=
 =?iso-8859-1?Q?0SOTOE4c7rzFbhruIJV1tLIaprgM070PBHulpPMPokopv81Rl1HEAb3mh/?=
 =?iso-8859-1?Q?j/VxMROmZpNOUpuw83GCrRZgrsGIYOJE7v0k3gj/GGkXploQM4gG9JBRkS?=
 =?iso-8859-1?Q?VcDwMNsgZ9JozOjx8gL+kCKV3WpT/6+E1oAM95LAq4SjiU4YoXs0GJpCLk?=
 =?iso-8859-1?Q?ezBWFVHcBjCbvbyNDXIF0phT0ks0uvjmkjEhZV/hlOhsFctArs42svRTDS?=
 =?iso-8859-1?Q?/XhbexqsQ17xSA4yLkVpUU0qy3EHaWp865aukXv4gEmOXySUS+Rb3NdudQ?=
 =?iso-8859-1?Q?KEkA9HM43WmobElXb6oBomN164lQ0fA/GZ/nZ3R4mCxsaH4cB9GnBONMOw?=
 =?iso-8859-1?Q?jbP5iT44aTJ0rk93SQp4iffVCkcmPY9GJP+YzzTeD2TBHDFXBTIKEkUBwB?=
 =?iso-8859-1?Q?m25kLKHqpzCdhWsgUVviyAek2d2FMNFcNGXPHTyc5jmdtqG3w6mC5jCDCO?=
 =?iso-8859-1?Q?VHnA7RZVjbva5j7spF1FM0bZtz9ckSieNV?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6953e0-8494-4dc1-00f3-08dda1e5528d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 14:54:06.0783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixvUzkpTwChH3j1zJWmz80qUK0SlMrq6SDvBfbhTr2GNFE1gVy34Gqk307C953GBBNS/eQ3jM6WS7rVi5AuHV1+gw5FmUjh6O0+Qu6ux158=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Saturday, May 31, 2025 1:18 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hdegoede@redhat.com>; De Marchi, Lucas
><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Subject: Re: [PATCH 01/10] drm/xe: Correct BMG VSEC header sizing
>
>On Fri, 30 May 2025, Michael J. Ruhl wrote:
>
>> The intel_vsec_header information for the crashlog feature
>> is incorrect.
>>
>> Update the VSEC header with correct sizing and count.
>
>Does this warrant a Fixes tag?

Since the crashlog support doesn't exist yet (for this instance), I don't t=
hink a fixes
is warranted.

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
>
>Eh, this change goes way beyond what you said in the changelog, was that
>intentional? If yes, please describe and justify all the changes (and
>consider if some of them belong to a separate patch as it sounds like
>there are two or more changes mixed up into this patch).

With num_entries (the count) being update, this is in line with the change.=
  Originally they were
separate entries (punit and oobsms), but once I sized things correctly (0x1=
8 vs 0x10), only one
capability entry was needed (similar to the telemetry entry).

I will expand the commit message.

M


>>  	NULL
>>  };
>>
>>
>
>--
> i.

