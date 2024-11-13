Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84718FC7F
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731535052; cv=fail; b=gffqylRKgAfQhm3tY/zKq+dplWiZ64S9e6NaBf1sLx+OpINrUOsvdfh9gWxS9DtblIse93+CdXFhVymQQU8kfSbe7DD6QJyiiUklTjm4sVA+bIWmJUckDSj6cv1EamC/ScVfn1fjXsx+YCO9MOW956/p0kDaYmmlHEvAV0BYYr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731535052; c=relaxed/simple;
	bh=1tNXj3QSF2rjV2vEYubVdRjdvTZ2vJ+cINXw1g+fOBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hD5RHuVsb+PJYgNkvL/sL/oYg5DKouA4ueRCu0fPRLQIiNR4j425s7flw9V14moRMo/l+yQn/QedXA+EiC40zJBqmkx9S1MwOAl261ndmcf1CLBmR7K1tBSKTj0XBr8iG9E+dhs+MSK7oyMBasLZIFEEr838ZBzthnr8geserLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWUAq7vq; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWUAq7vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731535051; x=1763071051;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1tNXj3QSF2rjV2vEYubVdRjdvTZ2vJ+cINXw1g+fOBM=;
  b=EWUAq7vqqY+ZARI2dCJCcaE5UtkFETHBCdyoJ/dfPiGzt335s0w0M2Wh
   HIe/OsZTMeNFzJpn0DT6CvtGKeoXT1HWpuOsREgb1vkoir8g4Dx3FNPAT
   mqqGPzZzY1R6SwB9K5IYsjK3uAfcuqTm0ZPsRN1SaNz6njlo3RuAUe/Zv
   TaKF61mBN7gY4Ll9Zgsd14cxshBgCjIA19vuxvRohGVbGcYBWgAttNau9
   VfcQDelYDtOn+b6MzA8Sgng4PvrvG7CCp4xiSk+czO5wclfB3nxrQLMRf
   2SZdqUkTTHExe3TetJq3hZhrWRFSoOw44Co/ayxLCmR5hgJy/zbquaNIL
   A==;
X-CSE-ConnectionGUID: dNCnBWWhS5ew08wE/ZtLSQ==
X-CSE-MsgGUID: 8ydFcWjqRPuZX0HzMC4yOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35246025"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="35246025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:57:31 -0800
X-CSE-ConnectionGUID: MTVjQsLPRgqHcouCTGE7pg==
X-CSE-MsgGUID: ato1pSa2RtW3bWaiTLiIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88796427"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 13:57:30 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 13:57:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 13:57:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 13:57:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzqLaLEkBO1N2NaWIJaFXXxWxeWWo0BhONWnW04AuxxqcSJg+eL57SDRN6478MEk6/pBIZZ4REytzIBYMsi+NOyAG2/Vr8rKB0HuBg9DneghGp/sCqQ+39IxPCGo99Il1GlYq/5RWQdQTMaUTPYnQugPHkaES+61C2ZRH9FC9gfEMGocPaNGamU8Kro+Uu07zDn2mh7V5/kOHAfkVGa/llDBr8RcHieKyfcHb+ga5RWSXc1otgq45XN+AagBJAE8qCPusnIu2mzGNob2xQWvAuXQ7J+39ev6eRj6BKPPyrU0gjVlae5B8eUBek3MvQtWCi3DqNJPVgdjCJv4r0qgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTfWeFyhm1uZnPUOhljAH2fGYc/oQxP9v0e9FQbnbMc=;
 b=Ag7RodetfgtiK+1WYRDwOFxSzSiJixqTNRr+OQp+21vRco2Yy/vDw46MQ1kK5dlkSl0hEjUYF7f3YtWiH8+p3StqHH9uB35Ig/a67AX62WNec6su+hI1tV6xWLLZX1q8hpwJW0gyg3/8k2hsOMBeQ0UoJfGUKVyKY58zj+lNW13kq9fG91edux86LpG9slRbXGwt2okj5wR1ypbkvEFZN5eGkJv7pGOWvMMicrrD2fMFMaFIRkqXRpE6njy/0q3ITU1bW6H3sgxat26y9qTPemktji4Z3STKmuUDqlMwS4Jv9ea3uwCK2WB3s/5r7uyT8I/0KktKCw7BMmZaYxXnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 21:57:18 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 21:57:17 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v2 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Thread-Topic: [PATCH v2 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Thread-Index: AQHbNSBbHZxPsP/MQE2GGzxgdWDNqrK1AqWAgADA6vA=
Date: Wed, 13 Nov 2024 21:57:17 +0000
Message-ID: <IA1PR11MB6418272E695F6918048935A5C15A2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <20241112163035.2282499-2-michael.j.ruhl@intel.com>
 <ZzR-v4wiKCqRcd6q@smile.fi.intel.com>
In-Reply-To: <ZzR-v4wiKCqRcd6q@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CH3PR11MB7673:EE_
x-ms-office365-filtering-correlation-id: aba4117c-5995-4ff9-4fc7-08dd042e23e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?fxSQryWuzaKdz37idqFnOgPFjoaeOBRG8RU7YS67k9vZOimfgSlad+yIswkD?=
 =?us-ascii?Q?fj55PHv8OPh/qlZ7CxNDcKhFBNGvBjwKzJwAGuOaJYFMp3GzN6UqfOa9FKkL?=
 =?us-ascii?Q?xpJGbbNcMoXYCRF/BV9y71+iW7jd1d4HPioMTrf4vbLKjwz5V7n3KL/JDrlp?=
 =?us-ascii?Q?4sWgif/rgIhVh0Pz/OVvhMNIZABJz4aABz+14efZg147zHx2MhHD77S/NKI4?=
 =?us-ascii?Q?y26R8H0v1f9A9TGBXZ4dWH6IwDPkaPFxDzYdMxUnQwkP/svew+GoITpQeHow?=
 =?us-ascii?Q?yqsjkWMsxw9QJtWGN+GMvINNao33ibgNFSLUUe2TzldeRU2J2ZesOW+UBfdH?=
 =?us-ascii?Q?EclFCDnQ9aTbaBbJ1NgBjDkXE1fFZwswYm3vsCg6dZVa/HZSwOX9p4EELfqV?=
 =?us-ascii?Q?sb0Cja6ReOJg/Obye+txRqhN9Yt3n84QmytZ2Y42yb7/F3Mj9Fm1eZClskG+?=
 =?us-ascii?Q?0V496rzNkJc0O2vmUGYY/XgaVrx/jEYkTpyagzEDEIN2v15cHzOZqdW6MiSE?=
 =?us-ascii?Q?4ERqKZ/fuSHSQRo2rbirNpkcdrfkY9v13es9gReha2n97m8QoMX89LYxAo4D?=
 =?us-ascii?Q?/igWd9YwJJUe/MKBvBUIMla4E0G94H8+CM68YW0E7O8gMVgsmGxFgFCf+azm?=
 =?us-ascii?Q?gQyVM4ep5ehzftuzmUkyXCBYZnIq/eaLLi/OqbJYHgzzJfSTg9/svY+Khpwn?=
 =?us-ascii?Q?QZbRbz9UuPF9RYZpdEEO4jXkanhHG57Cli9xqkKJu1gGBZHm62v3UGr0ge8J?=
 =?us-ascii?Q?ZbH6+AaKLmWoZXQL2VXy/HTIrZDH0s4utU33/EoYrWH4fnGQBeJFymiG6c75?=
 =?us-ascii?Q?SindJlyutLDamJZDPczDaE7yH2Plr6EtYCkLv6M/MZBIsWvFFCzLoDfxEp8r?=
 =?us-ascii?Q?frjI/Dg2FnFupQs1ykob6riTOhV/dLOHcC+CtRJUipkKfN4DEy9DCt7TNDGB?=
 =?us-ascii?Q?74M7Isuk8DbwrFJvmmHpZp5kT6dogJAsPK48l3Gn7rDz1jQp83ucL8cfPB0k?=
 =?us-ascii?Q?T7sTCLiHg8S6OOgqDq9rU6uNbu/KUhQqOr5OJ16vDlnGeXCIx17ihKd45nBi?=
 =?us-ascii?Q?DnBtU+1ZyrstR/V//KzR1CJ90i4kpcX/osG0aI/l1g9bYKxZ4x/NSoGUmkNw?=
 =?us-ascii?Q?Uepd8PXv6PSQOa01IVzDpddeOE4A6cwy4mitVtwl7TPzVg+xuVJ8FIDyd+Ja?=
 =?us-ascii?Q?/M9dd7IpA08kE6eX37Pwic6a/aJ1zwNG5Q90Ea2e9DWrs8D8nmIYeUR4wiKh?=
 =?us-ascii?Q?h+9/ECiwSBll7AugEnqaz2ELL3gL8D3V7JEvp+DA9b8w+ezMqOqgtYq4l1cp?=
 =?us-ascii?Q?X1dI4R6mzfw+liesNRr/8bE1TWmR7DgnmiBbfEpJQq7Vix966+JtQNVI4c/J?=
 =?us-ascii?Q?v6sFyKc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2wZaCbw182PhDKGYzR9HzjJbUCPawZjn5s+K27MGNv1gIlAwyQJwK6ryZIIw?=
 =?us-ascii?Q?tNFsJRvP4dhG4hpMzhtGek4YV035QVIVN1R9v8ajLPpZ2AcDBpkPXViIc1PA?=
 =?us-ascii?Q?NSyNZ3is9BGSrjshRnGL5e05cPSs25BUix9BRIzG/FrTYyisYO6RbmR34f1h?=
 =?us-ascii?Q?FxVEVdC7v9TdrjR5hU7IgbKYiRHIxEULIr3pw09wiNN2MH2UjBVw0Z1E5Wdi?=
 =?us-ascii?Q?zlLHqXJoOfCaMCvitloKU1QbYWYXX3UB4kYJ/Rw+1wbqqXzStr3tcXBj5FMG?=
 =?us-ascii?Q?9c93xYTCZtRNEPvoQY/JDqtGeuZDLY7wrmsfjw0Vsg4SotQ8AnQW15ELbl67?=
 =?us-ascii?Q?XGz2+6s2mbkoVGncIJxJfaqiZ/lfWe5xlqUYUnkEGjxmOkjnrMcMXztsjszb?=
 =?us-ascii?Q?rq2lHGZ+Eu+a5xCn/DVDkRL1akSoa8uOnOZsSRksZsUlHqFQuXsAMWc1vPc0?=
 =?us-ascii?Q?fdQjewGjVYU4U+tw6G4JifKeMANnDPeyeSLl9t4XdYLA5NVe5xw5bRvOejYJ?=
 =?us-ascii?Q?tc9F8zCn/wSX3wge8yg4OCjRuoVOHG0nKML7H0e3KxgmsTwg/ixOHTM43gjA?=
 =?us-ascii?Q?oMql8AIxhk9aVdDbXNRCY2Rfgs7b7/EsxQRI5rntRwYchQM6jBP6sxtvn6nG?=
 =?us-ascii?Q?ELNFudRJN8k7AIkDtf+AfRPQZ2q1XbjnMfhpk226751RCtiHt3gQFD0GgZTK?=
 =?us-ascii?Q?Y1G5Lwn/luW2X/GKMs7aoky0bd0mCN2iAAQlviUQPKanW9LRYGyyL8oXLFIS?=
 =?us-ascii?Q?DiXDPFHXvZe1Ik+OBYPY5Az7vh11I144apy6ubKgux3HhgIlLEbTwgF7Ioqp?=
 =?us-ascii?Q?ImCdro+mIyCufWueYjsqtsP0WHPvjCGwW7YFt/hfev0I0Y4d9kUf2mMjcepX?=
 =?us-ascii?Q?xpZHm5cWRyJHkSguHEyT6FI0T6GsJSZqJu58+aH03XK5dP83s5xIuvxx50Ry?=
 =?us-ascii?Q?yDgrXLlw+YbmnHBrFOQ2YAxwI/RdcBlVOJ4PFl4qpTGI7lWmXOfd4kicgSAQ?=
 =?us-ascii?Q?h53IPq5p/XuTi88rXi6Tt/9VDHq39g7iV++w4RfzSK2grvBxe4Tr4C9NS1zL?=
 =?us-ascii?Q?aTJQAwnDXgXCyOlAEXGaqdcMfNCv9KQiA+9hCrNE+O6T2wsGkuqtkeMq2McC?=
 =?us-ascii?Q?EB/GDufSep9k6xEQPk6HWkijiHXI+3uBDGUHoa3tfpbw1CPH5lvrr54ssB0s?=
 =?us-ascii?Q?m/sBy2P746RobSsDrTUDrYuqZB4bCnWG+fYxMiL6gzV6a3kMHb9zb1P/GsCr?=
 =?us-ascii?Q?bWiDbpVLb6MTKt0aG/C3ZV+9N0O6wPbld5FFLGFFkoXJWNSA17n/sd+7W9yq?=
 =?us-ascii?Q?80sP8DpIp95Z1yo+iMZT7xGTk6U/UBu6QPtr9RoaVzjy7mKMgeFUr3STnrLp?=
 =?us-ascii?Q?CWB9mMYNYMBo5pKM2kEz/54F68CVjDkYLZiUl05bT+133ES1ULRy7gNFXjaP?=
 =?us-ascii?Q?dKYmSUsZfkQCoMYy783BNneTmteBEzZ8LLh781fFHC96ldHbwDniLA78Cxcy?=
 =?us-ascii?Q?yaxpEuKP+iK10krkOnOoEn1/qURxdnxqcTlO1Ml9rT2ZvttkuRSpOuUUPfcc?=
 =?us-ascii?Q?UxbtgV+ds84rYboR+f0yE5quf2+50pxQI578E6Ea?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aba4117c-5995-4ff9-4fc7-08dd042e23e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 21:57:17.3314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YnS7N9lZbpcta4O7QqW6bEAoNbUAWy7DCC+/nsPC+naOJ9CfX77TyzqW7FsbrB3/7feLAi/ja/ZNs3BWh3mplbArIi+felEgWXVh54ZT+SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Wednesday, November 13, 2024 5:26 AM
> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com;
> hdegoede@redhat.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi,
> Lucas <lucas.demarchi@intel.com>
> Subject: Re: [PATCH v2 1/2] platform/x86/intel/pmt: allow user offset for=
 PMT
> callbacks
>=20
> On Tue, Nov 12, 2024 at 11:30:34AM -0500, Michael J. Ruhl wrote:
> > Usage of the telem sysfs file allows for partial reads at an offset.
> >
> > The current callback method returns the buffer starting from offset 0
> > only.
> >
> > Include the requested offset in the callback.
> > Update the necessary address calculations with the offset.
> >
> > Note: offset addition is moved from the caller to the local usage.
> > For non-callback usage this unchanged behavior.
>=20
> ...
>=20
> >  int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb=
,
> u32 guid, void *buf,
> > -			void __iomem *addr, u32 count)
> > +			void __iomem *addr, loff_t off, u32 count)
> >  {
> >  	if (cb && cb->read_telem)
> > -		return cb->read_telem(pdev, guid, buf, count);
> > +		return cb->read_telem(pdev, guid, buf, off, count);
>=20
> Also possible instead of the below changes is to add here
>=20
> 	addr +=3D off;

Yeah, that makes sense.   Was not happy with adding it twice.  I will updat=
e.

Thanks!

M

=20
> >  	if (guid =3D=3D GUID_SPR_PUNIT)
> >  		/* PUNIT on SPR only supports aligned 64-bit read */
> > -		return pmt_memcpy64_fromio(buf, addr, count);
> > +		return pmt_memcpy64_fromio(buf, addr + off, count);
> >
> > -	memcpy_fromio(buf, addr, count);
> > +	memcpy_fromio(buf, addr + off, count);
> >
> >  	return count;
> >  }
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

