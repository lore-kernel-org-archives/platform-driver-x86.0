Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D8F372ED5
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565582; cv=fail; b=F6GaYGXgdheyczWheRsatKhi6CxnOq+KjcIqVF9wfdCctwiYV3Mpz6UBXyorcZwnm40O7t2Cd+ve85/6ZWYkQs1Yv2KKZNRm88iICD33nrtYxzh9fNjB0VpWk8ZK9iKaDncfWd0NiX6+CQu76PytUQmP7KhcJSORw54P3mgJabo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565582; c=relaxed/simple;
	bh=CtECkwn7tFqx3oJLzxLaRap9WP9juPc9UulP4mvWMvE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uSaUZabmmaGYVLs7tNjdlUobH/+f4H3NqOxFLm3qZMJoZ9G+eCFZWlm+k/lV3hyhsjDD56yAm39q6cIT47hGclyBQ2yrdI8vtZB1ZnMtEH5TcwkrABjgbbBfuSBW8m6ZL9IZenPS/12aea9/bUtWKLIuxode1NlQGD7O3LGTqIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOZl8RNb; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOZl8RNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786565580; x=1818101580;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=CtECkwn7tFqx3oJLzxLaRap9WP9juPc9UulP4mvWMvE=;
  b=jOZl8RNbJ+pNVr+bPsE8aRSGkv9UnQAjp0PchMCyY82c/5oe/4AF3nRk
   MxdCncmNwf0pTq2pCGlyzhHYjUrZAR/b0C+85uoyrtPgh38NHg+ru5OL3
   ssUnJjniYmsgQQawejTiE1mwF9QBbOofUubR9Rjd4xe4LIsZ12fL9AqFe
   bjMftX152fUQDgVAduK5dd/53BLjAf608iHIY3wrF5UTSJJyuoA1Yd/be
   CH/uCK0GQTOj5Xn/LRxdgmToFvwc6X4fRBJSABDGGwK+n4J5YlA4w7M7e
   gQJC8fsKwaK3lXln02mNbxKE1iYvEgw2GUncosV/kTBcC9HQjTsaQW4hk
   g==;
X-CSE-ConnectionGUID: VN7h4dteS+i/DmEux4qDNw==
X-CSE-MsgGUID: WPWSOXKcTJCzkvDJ9/9CoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86992049"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86992049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:12:53 -0700
X-CSE-ConnectionGUID: jJOeDkNQQ7eXqI/HFfM6GA==
X-CSE-MsgGUID: jud8AJZzQ4qz+u4bXauiHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="260439539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:12:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 13:12:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 13:12:50 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 13:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5qDFxdOn6GHW3WUcpT2nLaw6nShJHHWR67CteOGrRBgDQSzJDYJqdPdZg4qu0HCCgUpj69EsxtFzsugOzM7uCGc2v+mtagrzlsOtQEjBqmqKeb7kB71Y93DR0746WF9+bcrUMQ4k9PySiKKDyblNQ87Mf8GzVw0oOudfxtpypEgUqEbT3v6yV/3BkcB6fBRPkJil9imG3pjZlxNcepUdKktJU+lcBmguO9rK952T71O6INGJFFSjvbzPQJ1Rzy10vAS+EbART60nk9a6iloHOT4wifxv2wkLfyAtCZDrNT1PA0OVMIx+ayYN/wQcyAx3KU8FrgVZiaZcjPJPgwCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3ZxU7cmYgdnwu1r7Hrw0EHqbuXIWiWIvyWiCKgEn8Y=;
 b=ozViWvp8Lv9whw0Qzq4WfOthfy5GcN5/qH+KkF/g7YrakmNgRuItIUx6nYL5kCKC7jH+CPmb5jEgoEZ53c4J2YaKQbw/9880QCd5fnLFhI8cb6kg2j+ZAjM+3SfzVrAbOYDXib2RdlVzHG4IkY1iOeb76zjWVlTKU37ppXUFJVItZo5xvxEBsZooKf1RCVzBlXuMrhSErulwJoX11gRxHob/OSoIsQjAcipLk7BpeexXAFP1te1FKEDU92EuoK969pC7n1V+WkV7wU/Jl/EvPlno1ix4/cr4lbQ3RxpG6VXbk9EyeDDzEqmJoUedTWBhReGMpVt5LR6Dh3N4ZIaBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS7PR11MB8853.namprd11.prod.outlook.com (2603:10b6:8:255::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 20:12:47 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 20:12:47 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: RE: [PATCH v2 09/10] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v2 09/10] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdKpIuQX9i6V/b/E24K4tRochXCbaa2GoA
Date: Wed, 12 Aug 2026 20:12:47 +0000
Message-ID: <IA1PR11MB6418369A0E286597CD84C85CC1DC2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-21-michael.j.ruhl@intel.com>
In-Reply-To: <20260812193742.2170188-21-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS7PR11MB8853:EE_
x-ms-office365-filtering-correlation-id: 3520f4b3-3793-4d06-75e7-08def8ae13af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|921020|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: v5LL8M6+h+rLJtnYj+yG3rEr776OiT/LzcS8cekr0PZrC3KzbgYxEks5hetPAeJppBkplSBiTdB8+FmTnvKpjIorKBazT9xpA04e0Y+wkE8j8651m/oR+4iaSop+k6Le63It2aSP0ok4nSpYulMQsI4xDAK0spssYhBpRyJbwPLFhK+Bn79j+Cf/pbI6cC7ATqEgC3c1hkUOJf7eh3IXx/5feT2aZcOJqjg8UWWpaphhJbj0hbCyJ9mf9ZPVt/4UW+YK9z9Ec+K4IF/EfXutB7yhtIjIQ3ZkcGz9smmquiDgOvI5AAagPwd0h1IgsTFJ1Q3I0cuGzfWHhLCWQFWRdaODW6koKqcS54GQKvD8b9ZQcKqVjuLIjF+h9KVvFAQJDtyhHFedQa8//7IUrk6u6FsA5zV0EDJpao0VqsghnCO2acoScWA/padUgRgYHdAizFI64koViCalVm1MBPySZrAsrShMbGxZ/14c50Q2L0VMGriCQm/rJjj2a4p3yzSKpYQRyZ8e1qYUfhwWr98P/Vs9jMpZlr74Y6ADAV6b/OpBanY5QI/WiwWPIAGS+4UNc4E5XzdirdAdEf8dGM8GzJa0bNd5Im4RLWmPBG7rqbKB30eK8GPLPxT/BEpRngd3U5qZxkZ35ImcBJ9OQPaE04GAmavFQ7qAcmQYU7uNubjQ6co7r7bWPRblY9LGiox64A/4QJZf0Bp2R9iwFHODh5/R8d40nW2JZexNapYKFZA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(921020)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AJVMiDOZLM774hMatibeM2PheSO0xU6XnKoUDw7pKd+QkDjgX6JwLZKxtzBr?=
 =?us-ascii?Q?Km4LHNhekRxR1aOAgszWANDNOB3PLMQroSQLnjM+OwKEDtHcUSVI0F2vtbp9?=
 =?us-ascii?Q?ths0rBtJ5U8u/vTS8XRcHD5GeIgzrjGT6FrD2bR/8+1wHzERCe8IHHjFf1+a?=
 =?us-ascii?Q?7pEAC7Mp4hYCgVfyJZAb/g5Jhenq6LtbQs0KYNYIQciCfewzZ3KRivKoSjqB?=
 =?us-ascii?Q?AF86hgv4tIvqXWmD+mLayA1whTGx1it4QSS+BSqAD0tawOXKPJIaFDiWeGlW?=
 =?us-ascii?Q?BvVrVUVUGbZ1/78PJp+5SH/5RPhbS4ZMPI00Fx7pfeBsVl2YQDOdr4FrgkOV?=
 =?us-ascii?Q?9EF3qP4/eOM2G6nuh3eYFJJB6mLO5LtuuuYBqUj9sJucLABQN4mi17ens4IX?=
 =?us-ascii?Q?iBlUoaRD2bbphnvF4xliTaFfJzqsAuBzZvuGjmNFr3jUem/XCyqaOSjDAgD3?=
 =?us-ascii?Q?XvV6K3Sydp0GW32YiIsdMLMEkyk9eYKNbVqNZ55bsJkjxnk2l8vBe9UPQTQ4?=
 =?us-ascii?Q?VQCTUSwRh9EUqEEhoGg8XqspTV5em2Hsa1dwootEOMul3TPy7f/S0m8J7F66?=
 =?us-ascii?Q?1TjJXsNIMZJoxi1IjvZ6yP7AbCbyqq3EwzY4I3abFr8n/r9MpllarJIZ1HOk?=
 =?us-ascii?Q?GJ0VIqxPSY37zo+/WDBYipN4cy++RDoBDTzVAayE+I4SxQYEvQopEfe1wpMh?=
 =?us-ascii?Q?O6y+Qd5FR8DxWAwcd8HKd12CgqGGWDObzu45vM1fo4pM7EdrIKO0p56QRwxw?=
 =?us-ascii?Q?Oe3fSZ9+uq+0LgRx9YCcAEUfTdWVPU/h+R3Sa9Td2vKsVw3xCD1NLeeVEnLu?=
 =?us-ascii?Q?zBybZzl6qfk1IFjtINTb2gt/Dg0B6yTzgS6B1EfAMhKxi7qpQuZQEEVQe9sO?=
 =?us-ascii?Q?uc0J8ELszgV9LCoPAdBH6wItvE+o0n+rCtX7/NVBW4/wb9FlIpua4aszGBoK?=
 =?us-ascii?Q?FYY5VsockvnXJRPa/mmLztWAPo2y6aKqTY40LJGseTigiMxCbeIKSxmJE1R0?=
 =?us-ascii?Q?60OpLtqxCiqtkm3Fu+4KkAQHW7A2WV+K5mw5SU7N8ZzCPmrxaIEZIQPOwco0?=
 =?us-ascii?Q?V44iB2GRsVdJqmmg7Rp0RW9RyofJZ9Q6I5D2YMVDHdAL/WgavoCYz57irpJC?=
 =?us-ascii?Q?qM6hVfXR2ahOuB/YLXXsv2oh8wt3BKNqija4zVHUuRP2E4E2lG9epas04zSH?=
 =?us-ascii?Q?nR/OeHp/CTdNbYKdNu3qkQVvWl3A6m75CoCj7WA3AlO75GIqw7q6W2W9+EW2?=
 =?us-ascii?Q?vVFTis4TVCa4IVJQTUOlEXoci1ZxnrgZofFG7CD2ZPj3VoMHZ723MYgv8rUW?=
 =?us-ascii?Q?m+oaUAKF018Ig31NcCokB4nkG3XhnxVRFmSTxI3afF0D7d6tekf0dvosCQz5?=
 =?us-ascii?Q?/23BPaNVT48znbHjPOvi4dyZmNIc3HL4BSOrgF35pAkN48+mD24lcPmBkSvc?=
 =?us-ascii?Q?AwL5owDAVimjx4CX2fPv2srA1i6sLVrK7omu/OVEVkkIbmO8Mtfp8Pgd5Vz4?=
 =?us-ascii?Q?ZXnKFUlG7KULcSnSdJqnW/n9OG4qFv0NVQOl0mIJ+A3ka05PTHxtCD79LO4o?=
 =?us-ascii?Q?bUzOQ1514XBglnpJBWgl2HEbdoqFZN0Ag31WzxHJGY4K56+jWGfNc216QiZU?=
 =?us-ascii?Q?K4jb0mdQz9qeEW+auKObYQC0TBS1OuEpy3Pq+qkEtA8JZu1tR86M4e9tIzek?=
 =?us-ascii?Q?sX1i0YzIBRpBG0VmfGXCyvvXuMfHFbjMnaPYSCfsuUamPiJm+IaCNMC3skJn?=
 =?us-ascii?Q?DVSyBab7RA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JxmBpui/1jz9dYJzyWfSDfm084WvgAb40jImTHXZwRXMCwnsdtpOGTo3ApV7upBaqey3BBYbZ0ZbFeeYPgoZM9gpeGx2PaTiKte2poviAsRCqBQ5jxg8xEGH01YiD5QdXPwyp/u+NNP2QfijRFgBkx6cX+d0qCVOSnDRlFDdlcu6ThV8znABI1CxYdeaXvWkFsppAEyEDovVdMwEXCIxHv8JvVDa91PFRZJKPzkzGmMOJtP1jujj0P6BagCV4Bz6aApZcmmcO9xyEXLIdNrKjqysTeQSKxwBPnQjPS2CeL6Oql+Ssq8l8Ph+AEOXeZ92biMBQwxgx4mkx89MxNEZNQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3520f4b3-3793-4d06-75e7-08def8ae13af
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 20:12:47.1184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F1c2iKbpzi6BwRMnrqIfbzFIbN9o+BNXTW8CEjxHkZ1FvlisQdx3yzOi5vSAI6Y0MuDr9ZZaP0lRiWrZ1KF4eFUR3AU+JdF7yOeTeBXj/bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8853
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Micha=
el
>J. Ruhl
>Sent: Wednesday, August 12, 2026 3:38 PM
>To: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>thomas.hellstrom@linux.intel.com; airlied@gmail.com; simona@ffwll.ch;
>david.e.box@linux.intel.com; Vijay, Anoop C <anoop.c.vijay@intel.com>;
>Nilawar, Badal <badal.nilawar@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>; Ausmus, James <james.ausmus@intel.com>
>Subject: [PATCH v2 09/10] drm/xe/vsec: Support late bind fw information
>
>CRI FW is loaded on power on.  Because of this, access to
>the FW cannot be done until it is running.
>
>Update the XE PMT probe and access to check for late bind
>devices, verify, and wait for the appropriate FW state
>before probe or access.
>
>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |   4 +-
> drivers/gpu/drm/xe/xe_device_types.h |   4 +
> drivers/gpu/drm/xe/xe_vsec.c         | 142 +++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
> 4 files changed, 144 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index 71111ad32465..df6716a975fb 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -1139,7 +1139,9 @@ int xe_device_probe(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_sanitize_freq(gt);
>
>-	xe_vsec_init(xe);
>+	err =3D xe_vsec_init(xe);
>+	if (err)
>+		goto err_unregister_display;
>
> 	err =3D xe_sriov_init_late(xe);
> 	if (err)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>b/drivers/gpu/drm/xe/xe_device_types.h
>index 3f1a70813a99..5d9e6e66c665 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -468,6 +468,10 @@ struct xe_device {
> 		struct mutex lock;
> 		/** @pmt.base_offset: device specific base offset */
> 		u64 base_offset;
>+		/** @pmt.work: support late-bind probe */
>+		struct delayed_work work;
>+		/** @pmt.retry_count: late-bind probe retry */
>+		u32 retry_count;
> 	} pmt;
>
> 	/** @soc_remapper: SoC remapper object */
>diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>index 578d59048b39..bed5103dac19 100644
>--- a/drivers/gpu/drm/xe/xe_vsec.c
>+++ b/drivers/gpu/drm/xe/xe_vsec.c
>@@ -3,6 +3,7 @@
> #include <linux/bitfield.h>
> #include <linux/bits.h>
> #include <linux/cleanup.h>
>+#include <linux/delay.h>
> #include <linux/errno.h>
> #include <linux/intel_vsec.h>
> #include <linux/module.h>
>@@ -17,6 +18,7 @@
> #include "xe_mmio.h"
> #include "xe_platform_types.h"
> #include "xe_pm.h"
>+#include "xe_sysctrl.h"
> #include "xe_vsec.h"
>
> #include "regs/xe_pmt.h"
>@@ -162,6 +164,14 @@ enum capability {
> 	WATCHER,
> };
>
>+/*
>+ * Late bind will delay 100msec for up to 20 seconds
>+ */
>+#define VSEC_LATE_BIND_DELAY_MSEC	(100)
>+#define VSEC_LATE_BIND_RETRY		(200)
>+
>+static void cri_late_bind_probe(struct xe_device *xe);
>+
> static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
> {
> 	u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
>@@ -272,6 +282,56 @@ static int xe_guid_decode(u32 guid, int *index, u32
>*offset)
> 	return -ENODEV;
> }
>
>+#define WAITING_FOR_SYCTLR
>+#ifdef WAITING_FOR_SYCTLR
>+static bool xe_is_oobmsm_fw_ready(struct xe_device *xe)
>+{
>+	return true;
>+}
>+#endif
>+
>+static void cri_late_bind_probe_work(struct work_struct *work)
>+{
>+	struct xe_device *xe =3D container_of(work, struct xe_device,
>pmt.work.work);
>+
>+	if (xe_is_oobmsm_fw_ready(xe)) {
>+		cri_late_bind_probe(xe);
>+		xe_pm_runtime_put(xe);
>+		return;
>+	}
>+
>+	xe->pmt.retry_count++;
>+
>+	/* wait up to 20 seconds */
>+	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
>+		drm_warn(&xe->drm, "PMT probe: Late Binding failed to
>complete\n");
>+		xe_pm_runtime_put(xe);
>+		return;
>+	}
>+
>+	if (!schedule_delayed_work(&xe->pmt.work,
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
>+		xe_pm_runtime_put(xe);
>+}
>+
>+static bool wait_for_fw(struct xe_device *xe)
>+{
>+	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>+
>+	if (xe->info.platform !=3D XE_CRESCENTISLAND)
>+		return true;
>+
>+	while (retries--) {
>+		if (xe_is_oobmsm_fw_ready(xe))
>+			return true;
>+
>+		msleep(VSEC_LATE_BIND_DELAY_MSEC);
>+	}
>+
>+	drm_warn(&xe->drm, "Late Binding failed to complete\n");
>+
>+	return false;
>+}
>+
> /*
>  * xe_pmt_telem_read is a callback API.  I.e this can be accessed externa=
l to
>  * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to b=
e
>@@ -318,6 +378,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
> 		goto dev_exit;
> 	}
>
>+	if (!wait_for_fw(xe)) {
>+		ret =3D -ENODATA;
>+		goto runtime_exit;
>+	}
>+
> 	mutex_lock(&xe->pmt.lock);
>
> 	/* set SoC re-mapper index register based on GUID memory region */
>@@ -327,6 +392,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>
> 	mutex_unlock(&xe->pmt.lock);
>
>+runtime_exit:
> 	xe_pm_runtime_put(xe);
>
> dev_exit:
>@@ -374,6 +440,10 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
> 	disc_addr +=3D CRI_DISCOVERY_OFFSET + inst + offset;
>
> 	xe_pm_runtime_get(xe);
>+	if (!wait_for_fw(xe)) {
>+		ret =3D -ENODATA;
>+		goto runtime_exit;
>+	}
> 	mutex_lock(&xe->pmt.lock);
>
> 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>@@ -381,6 +451,8 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
> 	memcpy_fromio(reg, disc_addr, sizeof(*reg));
>
> 	mutex_unlock(&xe->pmt.lock);
>+
>+runtime_exit:
> 	xe_pm_runtime_put(xe);
>
> dev_exit:
>@@ -416,6 +488,10 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
> 	disc_addr +=3D CRI_DISCOVERY_OFFSET + inst + offset;
>
> 	xe_pm_runtime_get(xe);
>+	if (!wait_for_fw(xe)) {
>+		ret =3D -ENODATA;
>+		goto runtime_exit;
>+	}
> 	mutex_lock(&xe->pmt.lock);
>
> 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>@@ -425,6 +501,9 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
> 	mutex_unlock(&xe->pmt.lock);
> 	xe_pm_runtime_put(xe);

The above _put should have been removed.

This will be fixed.

m

>+runtime_exit:
>+	xe_pm_runtime_put(xe);
>+
> dev_exit:
> 	drm_dev_exit(idx);
>
>@@ -454,12 +533,44 @@ static enum xe_vsec get_platform_info(struct
>xe_device *xe)
> 	return vsec_platforms[xe->info.platform];
> }
>
>+static void cri_late_bind_probe(struct xe_device *xe)
>+{
>+	struct intel_vsec_platform_info *info;
>+	struct device *dev =3D xe->drm.dev;
>+	enum xe_vsec platform;
>+
>+	platform =3D get_platform_info(xe);
>+	if (platform !=3D XE_VSEC_CRI)
>+		return;
>+
>+	info =3D &xe_vsec_info[platform];
>+	if (!info->headers)
>+		return;
>+
>+	info->priv_data =3D &xe_cri_pmt_cb;
>+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>+
>+	intel_vsec_register(dev, info);
>+}
>+
>+static void vsec_disable_late_bind_work(void *arg)
>+{
>+	struct xe_device *xe =3D arg;
>+
>+	/*
>+	 * If was work was cancelled while it was still pending, we need to
>+	 * take care of releasing the runtime reference
>+	 */
>+	if (disable_delayed_work_sync(&xe->pmt.work))
>+		xe_pm_runtime_put(xe);
>+}
>+
> /**
>  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>  * interface
>  * @xe: valid xe instance
>  */
>-void xe_vsec_init(struct xe_device *xe)
>+int xe_vsec_init(struct xe_device *xe)
> {
> 	struct intel_vsec_platform_info *info;
> 	struct device *dev =3D xe->drm.dev;
>@@ -467,30 +578,44 @@ void xe_vsec_init(struct xe_device *xe)
>
> 	platform =3D get_platform_info(xe);
> 	if (platform =3D=3D XE_VSEC_UNKNOWN)
>-		return;
>+		return 0;
>
> 	info =3D &xe_vsec_info[platform];
> 	if (!info->headers)
>-		return;
>+		return 0;
>
> 	switch (platform) {
> 	case XE_VSEC_BMG:
> 		if (!xe->soc_remapper.set_telem_region)
>-			return;
>+			return 0;
> 		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
> 		info->priv_data =3D &xe_bmg_pmt_cb;
> 		break;
>
> 	case XE_VSEC_CRI:
> 		if (!xe->soc_remapper.set_telem_region)
>-			return;
>+			return 0;
> 		xe->pmt.base_offset =3D CRI_TELEMETRY_OFFSET;
>+
>+		xe->pmt.retry_count =3D 0;
>+		INIT_DELAYED_WORK(&xe->pmt.work,
>cri_late_bind_probe_work);
>+
>+		xe_pm_runtime_get_noresume(xe);
>+		if (!xe_is_oobmsm_fw_ready(xe)) {
>+			schedule_delayed_work(&xe->pmt.work,
>+
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
>+			return devm_add_action_or_reset(xe->drm.dev,
>+
>	vsec_disable_late_bind_work,
>+							xe);
>+		}
>+
> 		info->priv_data =3D &xe_cri_pmt_cb;
> 		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
> 		break;
>
> 	default:
>-		break;
>+		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>+		return 0;
> 	}
>
> 	/*
>@@ -498,5 +623,10 @@ void xe_vsec_init(struct xe_device *xe)
> 	 * resources.
> 	 */
> 	intel_vsec_register(dev, info);
>+
>+	if (platform =3D=3D XE_VSEC_CRI)
>+		xe_pm_runtime_put(xe);
>+
>+	return 0;
> }
> MODULE_IMPORT_NS("INTEL_VSEC");
>diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>index a25b4e6e681b..c4a1e2fc67d8 100644
>--- a/drivers/gpu/drm/xe/xe_vsec.h
>+++ b/drivers/gpu/drm/xe/xe_vsec.h
>@@ -9,7 +9,7 @@
> struct device;
> struct xe_device;
>
>-void xe_vsec_init(struct xe_device *xe);
>+int xe_vsec_init(struct xe_device *xe);
> int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t
>user_offset, u32 count);
>
> #endif
>--
>2.43.0

