Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F013D8B1
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731522115; cv=fail; b=pmtWIRY9AOjInQjICyB/4P59B1m3oXbhCIjxzeNq0GQiOC545Pku7FKtfa6xANG13of4ok1h+Lhvx7woyuTzwiDmSXrpx1obtzjVX27GtKr13tF6A0s+s8noqwZIqcXhRfQq2hXUNm2EhqrS21csDrh302xdwtFUDO+tpiLBL0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731522115; c=relaxed/simple;
	bh=veu+BYZzoh34s5P+rcuG2gN4RSE9I3lOcJnbU0tGW4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DiffQ4nbXkYfhed5RJknvj9Pme5kksuY6+MOGIgyvyoCP0DfKxp7xxMTqWKJSQcDtLyZvBKMS3OLouIHI7AFIYpLXjbMyRGwYm8w3DtIiOhyHvdWoM+6XhQkTLQQyZxUx44FWRfr3di8ecM+y8KoLNvytFm8EaT/REmglrnGHKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDfgERwg; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDfgERwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731522113; x=1763058113;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=veu+BYZzoh34s5P+rcuG2gN4RSE9I3lOcJnbU0tGW4w=;
  b=PDfgERwgN4ELGnn8UkoOtbYyritaatn66PQysAwIITV0qDpjxE2E/k+h
   EbTIfxu1gtN+k7ifMDN7hs93MA6pNoQN8Zw53oNSspQ72EnbBB5Bv1LW9
   XqEhbSZxA09i5cSHi1Ul7XzHU6NZf1NLB/N0xL3I2nykhgzuN3ckjNRp/
   clL6OwN0gvZ1pbHAjNZ7kxSn8tmAvlx8FRcnmrU2Ow/Po7L3oT6hDosKw
   KIMzVffg0ZG29/edpFH6iCEc2HdK0TT5QY2natUG7SaIPrIZexB4SqE10
   xjYxDf+1CtK8F2xQSWhEHsjClgi32eFqJQPAdLB/hEPPbaHh3fu1YipFQ
   A==;
X-CSE-ConnectionGUID: 0Uvr7cHkSS6nZV6A6n67AA==
X-CSE-MsgGUID: XsbQvRHmQGqT9aIiqRKDdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31585801"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31585801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 10:21:53 -0800
X-CSE-ConnectionGUID: 8O2E7eQ9Ra2KCaqUq4qv+g==
X-CSE-MsgGUID: AeXrF59dQwiz3HZ8dJiQNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92880458"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 10:21:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 10:21:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 10:21:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 10:21:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frmpY09i1v4sJtTI8lx/mCyAkdXlDyLWG390vNQVKa5QHS7cj2zC8/3cioykwKZglBAmVH3M9We1P7EFXlEzU007hd/P/Hmz7noH/kV3getXfRSbA/lUIDYdRlEzUgH6xyIi1OxNY67Tm1MlW8WEuIeqU3lfeafSZGONU9pAZeh67L0FZ4HN4TB83ksiPrIhbNH3I277HFXLI1EIbc5xQLFEpdqmZe3ca9cdTsSyPC7plXoKFA1gL+U/liAwUXZ3CBmYE4Heyf3CQO25mkHA60lPP4qzRfj0Pd6wMw4WwK3BldIkRHxri03PBnnfy3RMZwB4J6PAYxn8SW8t6IhRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWBhCMczdS/LG7i120bLV1TDK9Xb9tA+TImRQpEGNdk=;
 b=QrooLn+2kNCnKeNZfJU74dC/9zIqMUEP9WtcOQf7zBHp5uIskBivM7JlNVlvJBlTKMyoC3aI+7so3O7HdcRpd5sMALzGCAB2lbU1xSnqALc/Pd3DAI0trv9rFEcZ9O8wI+rPMg2R7JlwC9jS7O3cJygm8b8fABQTuRtNX5Nnsv+1iARvzlb9SDba1xAfKRU1XYxDpebW/pYgohdZAnPnvugWOsiryL962NWadLFe2wvNay7r8GdJnNEMRIDHazEd3xzeDHuV55uzTFSFFlZkt5e845tqVSV/8xQX07aKqX6AUf1bjL+VIY1HjFCHRZ3Gr0r4BC16ZM3TI0B1KVh0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 18:21:50 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 18:21:50 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v2 0/2] Support BMG PMT features for Xe
Thread-Topic: [PATCH v2 0/2] Support BMG PMT features for Xe
Thread-Index: AQHbNSBcoNJ8pGYLgUanWiTEFqgu6rK1BhsAgACBNHA=
Date: Wed, 13 Nov 2024 18:21:50 +0000
Message-ID: <IA1PR11MB64180A4524EA95B5A8414266C15A2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
In-Reply-To: <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS0PR11MB8020:EE_
x-ms-office365-filtering-correlation-id: 11cfafd7-4b0c-40ae-af59-08dd04100ac1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Jd1U70gCcLateWA/wWFZIjMiOiyMP0zt1gUU+UT3tGdxqxatyf8m1Xmva9p6?=
 =?us-ascii?Q?UhI3o8B1IX8dLbfzGlb9F0GirGT3XKaZmMzv84LIFMPkS7LjHpzot10rVT0J?=
 =?us-ascii?Q?lpbhJeXXn/xDweqWRl7WN38DLoahfaCLpb1J6kMigqAorca6UzDnWEfLQgfz?=
 =?us-ascii?Q?viN9zcQPVU0dzsDnQN0xbsOCOoTbcVtfvoyvks7aeCzQGHWH+EFDXDs9r1hj?=
 =?us-ascii?Q?7YxwB38c65axX0Wduu6nZpr75wSdNAmx7ZhVnHN8AglewS0ZF80YfbQBaiQ7?=
 =?us-ascii?Q?AfNRoEx0Mrc1CuVp0Lsz5DzlhOBJGQOHzCrgCoYbv0XL1XyiTOgIpUqpJIXK?=
 =?us-ascii?Q?yaf/GmAzvB9DfO0hIj+bKVIbhKOscYvfzY62B23B58Ul+drvhV19Yz+NLoN+?=
 =?us-ascii?Q?LN4CCX+tnIoJu+IciL7WGjWIgD2/kDrhlT4ykFrHkWpz7pJJ+Cl0CMJLawYP?=
 =?us-ascii?Q?YPcxAO6WafDH0Zz3RD/I+euuqOJMj4wjqolLnyHxiHevPXuBuL2PM9V9s8Hr?=
 =?us-ascii?Q?K58PXyVf1uUPk7vz7BDWWLZGor380HN/4s4zSEtdqfE8vvdeG7RBzJ5zGk1Y?=
 =?us-ascii?Q?cIp6pDQouqRr0fTARhcBCNt+SnoGpv7WIg0ztqb9u7kq/9YaA9qbOlAkmUkW?=
 =?us-ascii?Q?HIzs+tJfSXv50zWQcv8YeJq4udDLsr3UuymnzqWQdVq4J6ZR0pzgqRNWOjIB?=
 =?us-ascii?Q?pGjQJep25iCLPmAps1MklFc1EHG3LrJ6aSxJfyhGAoKQLl9gRk/rIKaPDgMt?=
 =?us-ascii?Q?BR41BKl5R3VLL6iu76rnUZUL0W8DRVLMbmIPrQA4yGzAy051Kj11Udvs80Dq?=
 =?us-ascii?Q?LluBRCZiUSta7FCLRGCzIffTNocgDcEZOFMCzjrCGLpETdzgCGyjKQUwXjle?=
 =?us-ascii?Q?7YAISyHlR09AdBUNi68adSvrmfxxKWUTjtZECZ4eIVR2Sqiwb9WuDxRUdmdb?=
 =?us-ascii?Q?83M4w0iH+sDrJdcaTjofOaBMXi+70kl7YjIY5h+/MPMLPatHHPDDeEmrohzL?=
 =?us-ascii?Q?nnpJYbcFuxYIIANb88ONpUibLpZTGdfH/PValH2i63k5Et70xQeYID5mPxv2?=
 =?us-ascii?Q?G3nG/AXQFiaOn+kdWnEHWln1tJetmIJg0bM8jYwN9rG/j2Xm8tNsHDs+qoHw?=
 =?us-ascii?Q?RLNQEQa0fGgem5V/Hus2kUlAxpbOXnBN23+Ofz9q8dWhxTlLUjWHX8u4LYCc?=
 =?us-ascii?Q?5nQ3+JmF36ncdTqbSbH9ukR3bmOP7tV5F36OpMonvLf+eF81m7FQpH8PhHcR?=
 =?us-ascii?Q?DL0AyB3HbWt5YEJl8DMhFoaPJO0al52TRD3sC7trUbPg07gihEnuVP1Ss05N?=
 =?us-ascii?Q?OwLdBdKj0be6QAdbtUE2elcV8MpiBW2WtnGXOKFLH6BjHl/cIraDCIyFYuaO?=
 =?us-ascii?Q?Q8LhsYk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QWZW6RNCdjgKuRZcr8HVPAtf00MFK99RrIhpoDRswVte7TcK5dBx23rEC/3o?=
 =?us-ascii?Q?FmPT9und2meWLVTbsVkZcmkcsoYAV/XGdP6zUPtXARtGLp+118TwEIXHiUrj?=
 =?us-ascii?Q?m1RHJnL7RnikQtMrSwrvJJUrUIwGV5RqnhO52c2CFDVf+kPhxqXdLMs8uYjC?=
 =?us-ascii?Q?kP8VU6RYe0WJ35qf5EQyIIB9imolOUFyqREIC7oImDC/6dxVw5aidJFy7kZU?=
 =?us-ascii?Q?8Wx9oNqFhAA6p2/noCOSBG0Q/qLJMEFkDcZiH85Z+tVUtYFW43XhSoSDZTvG?=
 =?us-ascii?Q?DIdTj3GvzdWLU7P01FzQ/RZmwbPvgsCwjXLItaZzrKr2Ibuw0UgoaPNWWgCR?=
 =?us-ascii?Q?Zo8uAENpr9ZKenWp0YVSmja39lefawsSFHmaptlmTOu3sZiElgv67KDdd/7V?=
 =?us-ascii?Q?lLIcKeiQdUYYDNG8eTEr5mI7T2C6qr1GFf3zjyXyD5gj/8DCkaAuVpxiMTtA?=
 =?us-ascii?Q?urkSXgmZsaksB7W4LiTtaFUsKDjDUvXacMnwJyxkXkowvQXVWWl1bKRdN5St?=
 =?us-ascii?Q?PcXLx8xJMLnnt0nlndgR8fvG+qzRcuUFK5cOUDJVfnsOYkUOX+w1hgFx4i4C?=
 =?us-ascii?Q?Mc3dH+Cs4qsj8WVbh6svE1Tqc8L+JYdfJ1+tzUoJ7kPjTpQBLExRy2G017RQ?=
 =?us-ascii?Q?sdrpUuFQe2moKOU8OTkcw/9aQhcCpWoxKwxZI3g+WsgTMOm/6fS7Z70tDQuV?=
 =?us-ascii?Q?1kr6Q230+FwhGvJ/jneP7Jj0quQ/b+sxfsLHcgzVR8nHqaDPlSAyqmMvdlRH?=
 =?us-ascii?Q?NYzmCq4lvY6mfCbIbBYL0WcCzr5aMdbuAlv2GSJGih1929kZBP3ZQwpVsuDM?=
 =?us-ascii?Q?lZZFfRzCVfczophHi2DrMZSQ3dgoWnlR+NKGHFsFeUgP1b9tv2JYuOOth7NA?=
 =?us-ascii?Q?TE3FCWUGlt6u3eAEMBFzkXbtcc4oHsc7cb5hOZJRIzi18QA0tYh7c7emB/ns?=
 =?us-ascii?Q?q3JsjTGJFvrGEyCbTvR5YQj/3OFALIzFSQm/HvPyICHNC0X4DCoLcthBGCgr?=
 =?us-ascii?Q?uBJsp2e0eHWBGk2E7/bYLpZ7dGk9WasJXBjtORUd6akgOTCDu50b4/UPvkRs?=
 =?us-ascii?Q?3JCPCSPOMSP7wo1fifYfoUGohU6xbSgKwt1MgTsRhZE6A2EzVzPoPU0xlkx2?=
 =?us-ascii?Q?W14jsoxiKUvnoDJV0x6ApzO+ZpTswIWei4kqDT6yf070RNDKoSQe1WrU0NpZ?=
 =?us-ascii?Q?aWuV9uEjS3ZQZbFF0TBKLiL2MwVeWm9dkulvcFOIXYRK2bE9EVJ3vJlN4/9Y?=
 =?us-ascii?Q?qOxI0/TjlbM9p+wn5xjW7FroesNYlub7/CcoXvMkiPRHFCNtBooZ3FLKZcl2?=
 =?us-ascii?Q?Yf+s/SC4pJeh+68Ct4LRWyZHZhb3j6rFqg2kdl7JMnbZLHX0n1nV9ZRmgFud?=
 =?us-ascii?Q?pzdCsVHv6WVF+UA/sSr0TO6zfG/k8bfuZMYpcabgRVFhyNODtCt2CYqZMPGl?=
 =?us-ascii?Q?5Hea1uiyAuID/MNBCsLCDJ35yQPFGCZnvzzjwAU5K9FT+BvAkOWd68CCirzV?=
 =?us-ascii?Q?khH8XDZgk4/UisKt3sHh78CsSu3CvADwpUSX6V2yBXDw//0Ol8Eb1lA7OucJ?=
 =?us-ascii?Q?7DiMykl6+evXsCz7b8HVBllq0fNeljibfuzla+UZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cfafd7-4b0c-40ae-af59-08dd04100ac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 18:21:50.2317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhJGkinVnJvFUY+jk/Bs4ogJ5lf/5Qlweh9lVp6AH5pk0ZN8UANEmBAJI+ePFO8lI4TP34x3AWM4UXTwC0Equ/+HdE2+Zr+KKUvFA2qThmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Wednesday, November 13, 2024 5:39 AM
> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com;
> hdegoede@redhat.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi,
> Lucas <lucas.demarchi@intel.com>
> Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
>=20
> On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> > Updates for PMT to support user offsets from the sysfs API.
> >
> > Addressed review comments for the Xe driver udpates.
>=20
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you!
=20
> If you have wish and time, there are problems with the drivers of differe=
nt

I am working on this patch set in my spare time...If anything loosens up I =
will keep this
in mind.

M

> severities (from "fine as is" to "good to be fixed, but okay as is") I ha=
ve noticed
> so far:
> - it uses s*printf() instead of sysfs_emit*()
> - it most likely never tested the corner cases. e.g.,
>=20
> 	if (disc_res->start >=3D pci_resource_start(pci_dev, i) &&
> 	    (disc_res->start <=3D pci_resource_end(pci_dev, i))) {
>=20
>   what is this supposed to mean? Probably someone wanted
> resource_contains() or
>   alike to be called here.
> - slightly above the above piece the for-loop
>=20
> 	for (i =3D 0; i < 6; i++)
>=20
>   which probably want to use PCI_STD_RESOURCE_END)
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

