Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3558E236A8B
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2025 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832036; cv=fail; b=YjnbM0K5MAxS6V6lx4pT2nDw1UekMpjcCi+WUwWwDkX7RKoJIMa2U9CnmteoJYFvEYTodaO7ozmEwsYulKw+HDhqLc/ptenz7RchbWWh4IsrB9Rvbxwo5amlEJWvLY9tNQmcpLEZUGTxRxOkjnMlFructwdxb8YlWfItv7YMhjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832036; c=relaxed/simple;
	bh=VxZ4LnO4x0pm3w859ExqiqEVVFXZd3MsJSiumGVogFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sESORLa/4Ef3UVN8mzmY/4NMDdTnL9wllG6P/FoOwSxWDnBqrwf5yhLhcE4svikjf1uKd3lI+mwELwzrjuj6PbuaGYzWHof2zFsU5M31zmk7YxQENXXzWXBbNqBZ0QQDQrxY09JgjLiM2anc6GXDrusSNOFHdtEcz6sfDpNfLAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/xVdZuH; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/xVdZuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747832034; x=1779368034;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VxZ4LnO4x0pm3w859ExqiqEVVFXZd3MsJSiumGVogFg=;
  b=L/xVdZuHajoMeMyAP5oEwdDbT/ze1ITiE4Gu8NVLMaIlRMMeSLbVPaog
   HmNRdGslJSms4mZo+nIqSbXMUUHRVROtGTS88F/iRCx26j3bM9CjV+tj4
   E8DVeRYEj9AxfErp9AIgW5Yt9s9vjh63ZEYbpGb+mysu2CFjgMrVIELlQ
   eazuJTV0MDYKQBu2T/vdXiVoSzdkJjxdU8/91BnHmnVp0D8DmFMu275vu
   euX6AoLJeWwrXp8RVOj/vuEWRIKEBW4Z+AvllxONru5ujhMdxavwZnE/K
   z9+bpI7Jif7PN7FsJbxwMOpp8dc6u5ZTR3z0/Og8+HZ+NNK6xVaMMmZOG
   g==;
X-CSE-ConnectionGUID: 11moGP75Rvu0iwaEU5QoiQ==
X-CSE-MsgGUID: hD/0D+X6TXi4bAAE998V/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49683655"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49683655"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:53:53 -0700
X-CSE-ConnectionGUID: JHhMmM5CSzaZpWM2ZaSC+A==
X-CSE-MsgGUID: 4UTYeskuRlaiyXD/+YKIKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170935819"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:53:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:53:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:53:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVH0ykAJrAgupsz9lYfKE/2XfdOkB4paxXgj6Vb6ZHpVwQMRfkqmzBHyA4t6zOlhB9nYiyPHl7tNDybu2HVGrs/Qi8TjMl4l8lUEZK6+wI7Lw/cS+vUh16VRc0cUtRDYyQSRT8MP7zyE1fEgTZpPlDLtN9IIE+a+S/UknAcyZXYmkXtNcMvRO6WJxIgkeQZlPZD5lCf/51ySHOtE+oRxYibjzvC8+W72KESllhQlrCeZeQhuerxTWuzxCSOF9M6/a0vsjctW2/AODlWJ1AHOh9nXzmSX05FyxOzjPtmEh4iqwblcgulZAzEt5EnIYtac8hFJgQX5+focKRNqI5H+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OS1NJuwwvf1Ne7wfqEG1ToBoZQChLhci4WONRhigai4=;
 b=qx/hp7nzo5lEJMR+KlTnkAV6lPk1wV1NSy7MSlAVGo9P+yruQ9TmBm1jAUNC9Cs1C5OCdcLaJIJCDhepSOZeXUj91EyiibVia4EBqS2ap8bKSEhPCZru4Twfrj0zJCU+VSPtmUrca+56oLAG7XQnxX9WcuTBqcZFk7WQRCge+YnztJHVsAiudvCQ/mCTzMIevdweT7prp+GM2eeGXOhfNtfva1pUU7jgsfIv2HXX+vJ4o7daa23xfrS1igJhwUd8tHuyPMX3SAsiZ0+UIXjHHZRGtNTJ/Fcl+yqTmmEMt/2xSITxpHYLN1e7sj5wJ21HhiHb9gxmnIfhfd2eQRZdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA4PR11MB9009.namprd11.prod.outlook.com (2603:10b6:208:56f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:53:04 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:53:04 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
Thread-Topic: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
Thread-Index: AQHbxnPaF0a2/DEWv0Stn5h2in8QRbPaHucAgALsldA=
Date: Wed, 21 May 2025 12:53:04 +0000
Message-ID: <IA1PR11MB6418FE0AB33CEE6D7BFD5818C19EA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com>
 <20250516150416.210625-5-michael.j.ruhl@intel.com>
 <c63b6778-ecf5-e025-4f16-07a35a105e89@linux.intel.com>
In-Reply-To: <c63b6778-ecf5-e025-4f16-07a35a105e89@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA4PR11MB9009:EE_
x-ms-office365-filtering-correlation-id: c3c7dc3b-7ee6-48d8-48d3-08dd98666d5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?/MhTweL9mxDzfAa6eV8cPvo3u3aAj8/Ua51ByJ6mEnrXKD9+YKFraF90pY?=
 =?iso-8859-1?Q?nUI9eKh3gBDTknDnX4kuPLFwNiBkpevGrTDn3NwgiErOtNg2vgAYUhKJpM?=
 =?iso-8859-1?Q?JTbfBDcGXJ3MkUdMtiF0zTzwLrAxSGGZ3Tc7K0bNm0d1CeJfCCrl6N3Mrc?=
 =?iso-8859-1?Q?0ZSvR1LuaHjBv84WFDyrw4Fm0ts2wi3DpUD/wQLBCshc6NsfZT1gm8AIv3?=
 =?iso-8859-1?Q?XTFebiBNhugCdKvK2VLNyYk8v83mGK1dhoMwE6jJiHLRyt3DKvHN1tH6+2?=
 =?iso-8859-1?Q?0yTlBb/NGEajkFPMbr3iBR3+wSCgSM9DBuPMsfNqxeBR5bfcWAWANU7695?=
 =?iso-8859-1?Q?tsWZT+gmYvLrpimaGBwNAftay9WVUhMnIdkBHp+kmZTjFP9Es4BWiT9b3r?=
 =?iso-8859-1?Q?KO4ii3yuR5IRfu6bRtU+by6sSuIzmiiUR9Q/2pAEkxcQ34qljjN1D/6hUo?=
 =?iso-8859-1?Q?GA1gMwVio7zmcf8O1Bq11LN+Vpldkf3gZ2DwIgzlLi3V0ubX2T20eL6v4p?=
 =?iso-8859-1?Q?6I6oCp39NyorbMGiuH93ks8gO6tEfIiPC68Z+GDPLhh5cg3l/CfHUfL8fr?=
 =?iso-8859-1?Q?EJb4g7oS+Voxezp7j2SMhqF3TALw4/bbdzE9fpLlHXZGsEpMd20uG+eNOM?=
 =?iso-8859-1?Q?Dz90W08FEtmBQtf+K9DreWjydbfIqmoaeezGo/F+0QN9bOIaZ/vgTLQvTB?=
 =?iso-8859-1?Q?SzgjkqgYk1CAlaEg+aBM2FP6YB0SpXoMw/cGXP5wa7yeSCgvG6DKxTB1EB?=
 =?iso-8859-1?Q?FILzvWblFEqAu+N+p2RrWD4MtSzGWE8Mmw0CqCcDFSVaer3w7ejXe9mHa7?=
 =?iso-8859-1?Q?cw78dZU1NdzX+jzMMr0d+mYY8cQvjz5qN+qK57P3jemCH4QdMU07GAejBP?=
 =?iso-8859-1?Q?NEvjRhN0OGcINOJdnhC/cQ7C68mYjgf89tVKjuoYQEB7Um/qYLNFlZtDLT?=
 =?iso-8859-1?Q?CUIvdAE5D0nsNyEAIRVJIv5GAxX47vxQibe9sC8O9qqb+NIFx1qDe5evtZ?=
 =?iso-8859-1?Q?h8TB5cryxJ+jyYco1HN1F6dZ3Ji1Vdhf/xwD9MkuGbK0g146evoHgTU5f8?=
 =?iso-8859-1?Q?97/qkpC9/fGsb2b5Jo3MAVvEJE9mXhYASnTRfnA3rRTZ940eabCv053h6X?=
 =?iso-8859-1?Q?CDjzY6jF4w32QQezUveQavs3xVx9uUcSM0OLrCdK8So5h88Coo/tIBRaw2?=
 =?iso-8859-1?Q?Zoj4W8WbpUzerYX5HZqXgdNEZwU/SCFcCh0n/EvqxKCQoJczjyqRcgIHJc?=
 =?iso-8859-1?Q?wkLnXUACXweYMV4Ndmopvu73LuRLX59zyjmIUbozX7nyuKWqZ3LEKnP9Yg?=
 =?iso-8859-1?Q?OnsaA29S0HNrrxJmO6OUrdz/aXDz8UKY3eITddY3EYfOnEjWd/SS/8CT+4?=
 =?iso-8859-1?Q?guBxCtCpAJGXD7uHeDx7+BpHCytAexTKP3mKtkPUDuI6lMJ7L7rTooPH2r?=
 =?iso-8859-1?Q?A7Zw8bbDvBKjErqR1v2qw7gv2oVtLxrgNAKm7Qm/8uqMmRiW3jykgG9mdq?=
 =?iso-8859-1?Q?LGa62rKc4dk6DNUuRJcNCZU2eC4DqwEM2HSGM1fCKzEA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7EC9ey5N5uU964pJ/ylKk5Uu8vOcgxtnY8ijcfOMvoAI9B3fM8zC+MxpUa?=
 =?iso-8859-1?Q?hz4sggz14B2K0lKW6aCfEK4UuXzU7gpw6iN8s1bz+mL5qULEfHCCOcT+Zu?=
 =?iso-8859-1?Q?JKzpQT+K98EgznFXd4hg2f2iJogJu19uUoZ5uahc5FOvBNbUrU96GM+lj0?=
 =?iso-8859-1?Q?Q+FqIpclJTGJBM+y7gMVIbonIM5T2yff+OH1xFzDfT/xqzmLrl6BXa3fVe?=
 =?iso-8859-1?Q?nYUbVhzM1+C3xZoz4wzRGyeYkNptFxfkqlwjKLdnEilFVR3+2S6eT7XY2r?=
 =?iso-8859-1?Q?XQzbV397HW2hSeTKYyAlApOJcHWaPbhdfh6XNISsNDvN7uc81WSGx3ET1d?=
 =?iso-8859-1?Q?PijxTNxgcXKjuDqz6+y2GkTcHCbZCeJpm8SAViA7uumG7pWiuyRjM5CxEy?=
 =?iso-8859-1?Q?Eb68Mu/9wAatPqtV1iuvLRLtUzJVrY/Oraf8wQmzhyyJSCFYEouEs4xoAv?=
 =?iso-8859-1?Q?1B7FQlB3Bz1y76x/6bTgW7LpYy7e5VjPUpxhItOIkzCnBqlcfaMtMrl0Y9?=
 =?iso-8859-1?Q?cXbcAz7dvzv0N2GKg2ffrGTCePqh02FAHTSn/XS+4/ZEreil8+uBBz/Vwv?=
 =?iso-8859-1?Q?qeO51h/uQnzdJW6sMbcLoQr3lYyMi7q5bwPwygW25JbNPF9psvvR6RGQ1N?=
 =?iso-8859-1?Q?q5qn1XAJ/oVUYAIyrxtpcfmoFURQyRJ64i4HyIUzBXALHNYJxpIq+8UZGF?=
 =?iso-8859-1?Q?qAZzbRocal+Bu4zfHRTOO1KTCCHWSbbaKgD4wIDORqW3ujLGbOhAu2MN/G?=
 =?iso-8859-1?Q?fcHTVDjG00gk0EnDcNvgu6bvlxqkT8GDXCpE4c/Ncj2VeCw4NYXPVroJPX?=
 =?iso-8859-1?Q?6ocjSGGaBk9aIPgrvQpALPRbn/s/wksbPizAJgZYJPmEUWpMVzjCbg6inE?=
 =?iso-8859-1?Q?jgHAsKjMVjUinG6Cuy3N26pltXFOe8mtKw+10JHmPu6JjteHO+z3/+D9zU?=
 =?iso-8859-1?Q?AdatGGo7VJzyhkf1akMVp4IrXUp7O1FTrTe6enUVBsoAXpBsiZfjZK0LaL?=
 =?iso-8859-1?Q?BEoJiv5QWAQO7c2rORtmILAmK4B+x/qvLdNcOCR3vjAk/u/fRAkadqJMCz?=
 =?iso-8859-1?Q?TJm2uWojMQ+qh8QDvFAss+L19N2PdQniJQRryC7nseSyQ0KSXGGou/MYAW?=
 =?iso-8859-1?Q?eYAF4g6JokfDEOuQtkLq8+MkD6E5wqNjAzUdzzuSjE6acTsJOyQcdNXcWf?=
 =?iso-8859-1?Q?C8QxRkitJtr0+B9pBi6S5msYiFMvA67rTXD/kgRsucB9nnXlwu8S1ZHK2i?=
 =?iso-8859-1?Q?3HWMi25OTA6ylBtRkfGTvgtH+rcfahdgmiF+a2hfumbSx/1Qg/ANAZBrYe?=
 =?iso-8859-1?Q?cGIWmvSC0fpwXOpDPkAcNeGQqs3f67wPw4M1BLdaik6OXZfosdxGmyac/i?=
 =?iso-8859-1?Q?l9f1umO9D5ucAn3CXvqy6vf78ML4RpH7mKcJU8nUdEIEZ1sPz4r9YbR2XO?=
 =?iso-8859-1?Q?ljAb2vTjAh2fkfM5KxWLI5Xt3WDxhB8V8Cnso5P4pxy8zdcKPjWQC+kwLh?=
 =?iso-8859-1?Q?Hn0borIllSFHMK4YtQzUre4cMCh4r7nhM8Cdu3Wk5IOIc72RxTgX9e+jtm?=
 =?iso-8859-1?Q?dE4bjXPQ7vTJcnJWUyH4KMHaFfYwfi12z+jdwdp/t3wSEv5eOZJg42+A+s?=
 =?iso-8859-1?Q?QDV+zy4opqxzcxlIqb9zmAGyKCPKsR+tcX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c7dc3b-7ee6-48d8-48d3-08dd98666d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:53:04.5101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cb0IKSzIsls6J/jPO0iXM5ajJZReDurePiO/CFPIlnEr3aVCiI+oz1CMeA7gOb52H9DH5cTPxcq6jAyP9XCtNgYMUSnQEs2MrKXnKZoHNHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9009
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Monday, May 19, 2025 11:52 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org
>Subject: Re: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
>
>On Fri, 16 May 2025, Michael J. Ruhl wrote:
>
>> The Battlemage GPU has the type 1 version 2 crashlog
>> feature.
>>
>> Update the crashlog driver to support this crashlog
>> version.
>
>Too short lines.
>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/class.h    |   2 +
>>  drivers/platform/x86/intel/pmt/crashlog.c | 328 +++++++++++++++++++---
>>  2 files changed, 288 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/class.h
>b/drivers/platform/x86/intel/pmt/class.h
>> index 6b3455a86471..9c0c7e2efecf 100644
>> --- a/drivers/platform/x86/intel/pmt/class.h
>> +++ b/drivers/platform/x86/intel/pmt/class.h
>> @@ -31,6 +31,8 @@ struct telem_endpoint {
>>  };
>>
>>  struct intel_pmt_header {
>> +	u32	type;
>> +	u32	version;
>>  	u32	base_offset;
>>  	u32	size;
>>  	u32	guid;
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index c9bfe1c26311..700a51d2563a 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -23,10 +23,17 @@
>>  #define CRASH_TYPE_OOBMSM	1
>>
>>  /* Crashlog Discovery Header */
>> -#define CONTROL_OFFSET		0x0
>> -#define GUID_OFFSET		0x4
>> -#define BASE_OFFSET		0x8
>> -#define SIZE_OFFSET		0xC
>> +#define CONTROL_OFFSET		0x00
>> +#define GUID_OFFSET		0x04
>> +#define BASE_OFFSET		0x08
>> +#define SIZE_OFFSET		0x0C
>
>Why did you change this group at all?

Was going for "consistency" on the byte definitions, but then apparently fo=
rgot in the
following section (0x00)...

will remove the change.

>> +#define TYPE1_VER0_CONTROL_OFFSET	0x0
>> +#define TYPE1_VER0_STATUS_OFFSET	0x0
>> +
>> +#define TYPE1_VER2_CONTROL_OFFSET	0x14
>> +#define TYPE1_VER2_STATUS_OFFSET	0x0
>> +
>>  #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
>>  /* size is in bytes */
>>  #define GET_SIZE(v)		((v) * sizeof(u32))
>> @@ -56,9 +63,37 @@ struct type1_ver0_base {
>>  	u32 complete:		1;  /* ro/v  31:31 */
>>  };
>>
>> +struct type1_ver2_status {
>> +	u32 access_type:	4;  /* ro    0:3  */
>> +	u32 crash_type:		4;  /* ro    4:7  */
>> +	u32 count:		8;  /* ro    8:15 */
>> +	u32 version:		4;  /* ro   16:19 */
>> +	u32 clear_support:	1;  /* ro   20:20 */
>> +	u32 rsvd:		4;  /* ro   21:24 */
>> +	u32 rearmed:		1;  /* ro   25:25 */
>> +	u32 error:		1;  /* ro   26:26 */
>> +	u32 consumed:		1;  /* ro   27:27 */
>> +	u32 disable:		1;  /* ro   28:28 */
>> +	u32 cleared:		1;  /* ro   29:29 */
>> +	u32 in_progress:	1;  /* ro   30:30 */
>> +	u32 complete:		1;  /* ro   31:31 */
>
>See, now you're adding GENMASK()/BIT() arguments into the comment when
>the
>struct/C bitfield doesn't document that for you. I think this conversion
>away from GENMASK()/BIT() was a step backwards.
>
>> +};
>> +
>> +struct type1_ver2_control {
>> +	u32 rsvd0:		25; /* ro    0:24 */
>> +	u32 consumed:		1;  /* rw/v 25:25 */
>> +	u32 rsvd1:		1;  /* ro/v 26:26 */
>> +	u32 rsvd2:		1;  /* ro/v 27:27 */
>
>Why aren't these two combined?

There was a different bit defined there before (not rsvd)  I will combine.

>> +	u32 rearm:		1;  /* rw/v 28:28 */
>> +	u32 manual:		1;  /* rw/v 29:29 */
>> +	u32 clear:		1;  /* rw/v 30:30 */
>> +	u32 disable:		1;  /* rw/v 31:31 */
>
>Really, they converted most bits into reserved (which is fine) but not
>only that, they also relocated the remaining bits just because they
>could. :-(

Yup, which is why I was having difficulty with the BIT() definitions...

>> +};
>> +
>>  struct crashlog_status {
>>  	union {
>>  		struct type1_ver0_base stat;
>> +		struct type1_ver2_status stat2;
>>  		u32 status;
>>  	};
>>  };
>> @@ -66,6 +101,7 @@ struct crashlog_status {
>>  struct crashlog_control {
>>  	union {
>>  		struct type1_ver0_base ctrl;
>> +		struct type1_ver2_control ctrl2;
>>  		u32 control;
>>  	};
>>  };
>> @@ -75,97 +111,174 @@ struct pmt_crashlog_priv {
>>  	struct crashlog_entry	entry[];
>>  };
>>
>> +static u32 get_control_offset(struct intel_pmt_header *hdr)
>> +{
>> +	return hdr->version =3D=3D 0 ? TYPE1_VER0_CONTROL_OFFSET :
>TYPE1_VER2_CONTROL_OFFSET;
>> +}
>> +
>> +static u32 get_status_offset(struct intel_pmt_header *hdr)
>> +{
>> +	return hdr->version =3D=3D 0 ? TYPE1_VER0_STATUS_OFFSET :
>TYPE1_VER2_STATUS_OFFSET;
>> +}
>
>I suggest you create some per version const version info struct which
>holds all the relevant offsets, field bitmasks that got changed, and
>attrs (perhaps more, the code is complex enough I didn't try to
>understand evenything until it look cleaner). Basically, whenever you want
>to check what the version is and behave differently, consider if you can
>put that somehow into the per version info struct without needed to use
>if () / elvis op logic at all.

So something like this:

struct crashlog_offset {
	int disabled;
	int cleared;
	int manual;
	int complete;
	int rearmed;
	int error;
	int consumed;
	int in_progress;
	int set_consumed;
	int set_rearm;
	int set_manual;
	int set_clear;
	int set_disable;
} offset;

if (version =3D=3D 0) {
	offset.disabled(28);
	offset.set_disabled =3D BIT(28);
}
if (version =3D=3D 2) {
	offset.disabled =3D BIT(28);
	offset.set_disabled =3D BIT(31);
}

?  (or did you have a different example?)

I am not sure I am following what you would like to see here...

>Also now, after reading this patch, I'm even more convinced you want to
>keep using BIT/GENMASK(), not C bitfields because the former just happens
>to be more flexible allowing the mask values to be easily put into the
>info struct.
>
>>  /*
>>   * I/O
>>   */
>>  static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
>>  {
>> +	u32 offset =3D get_status_offset(&entry->header);
>>  	struct crashlog_status status =3D {
>> -		.status =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +		.status =3D readl(entry->disc_table + offset),
>>  	};
>>
>>  	/* return current value of the crashlog complete flag */
>> -	return status.stat.complete;
>> +	if (entry->header.version =3D=3D 0)
>> +		return status.stat.complete;
>>
>> +	return status.stat2.complete;
>>  }
>>
>>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>>  {
>> +	u32 offset =3D get_status_offset(&entry->header);
>>  	struct crashlog_status status =3D {
>> -		.status =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +		.status =3D readl(entry->disc_table + offset),
>>  	};
>>
>>  	/* return current value of the crashlog disabled flag */
>> -	return status.stat.disable;
>> +	if (entry->header.version =3D=3D 0)
>> +		return status.stat.disable;
>> +
>> +	return status.stat2.disable;
>>  }
>>
>> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32
>*crash_type, u32 *version)
>>  {
>>  	struct crashlog_control discovery_header =3D {
>>  		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>>  	};
>> -	u32 crash_type, version;
>>
>> -	crash_type =3D discovery_header.ctrl.crash_type;
>> -	version =3D discovery_header.ctrl.version;
>> +	*crash_type =3D discovery_header.ctrl.crash_type;
>> +	*version =3D discovery_header.ctrl.version;
>>
>>  	/*
>> -	 * Currently we only recognize OOBMSM version 0 devices.
>> -	 * We can ignore all other crashlog devices in the system.
>> +	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
>> +	 * devices.
>> +	 *
>> +	 * Ignore all other crashlog devices in the system.
>>  	 */
>> -	return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
>> +	if (*crash_type =3D=3D CRASH_TYPE_OOBMSM && (*version =3D=3D 0 ||
>*version =3D=3D 2))
>> +		return true;
>> +
>> +	return false;
>>  }
>>
>>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
>>  				     bool disable)
>>  {
>> +	u32 offset =3D get_control_offset(&entry->header);
>>  	struct crashlog_control control =3D {
>> -		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +		.control =3D readl(entry->disc_table + offset),
>>  	};
>>
>> -	/* clear trigger bits so we are only modifying disable flag */
>> -	control.ctrl.clear =3D 0;
>> -	control.ctrl.manual =3D 0;
>> -	control.ctrl.complete =3D 0;
>> +	if (entry->header.version =3D=3D 0) {
>> +		/* clear trigger bits so we are only modifying disable flag */
>> +		control.ctrl.clear =3D 0;
>> +		control.ctrl.manual =3D 0;
>> +		control.ctrl.complete =3D 0;
>>
>> -	if (disable)
>> -		control.ctrl.disable =3D 1;
>> -	else
>> -		control.ctrl.disable =3D 0;
>> +		control.ctrl.disable =3D disable;
>> +	} else {
>> +		control.ctrl2.manual =3D 0;
>> +		control.ctrl2.clear =3D 0;
>>
>> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>> +		control.ctrl2.disable =3D disable;
>> +	}
>> +
>> +	writel(control.control, entry->disc_table + offset);
>>  }
>>
>>  static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
>>  {
>> +	u32 offset =3D get_control_offset(&entry->header);
>>  	struct crashlog_control control =3D {
>> -		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +		.control =3D readl(entry->disc_table + offset),
>>  	};
>>
>> -	/* clear trigger bits so we are only modifying disable flag */
>> -	control.ctrl.disable =3D 0;
>> -	control.ctrl.manual =3D 0;
>> -	control.ctrl.complete =3D 0;
>> +	if (entry->header.version =3D=3D 0) {
>> +		/* clear trigger bits so we are only modifying disable flag */
>> +		control.ctrl.disable =3D 0;
>> +		control.ctrl.manual =3D 0;
>> +		control.ctrl.complete =3D 0;
>> +
>> +		control.ctrl.clear =3D 1;
>> +	} else {
>> +		control.ctrl2.disable =3D 0;
>> +		control.ctrl2.manual =3D 0;
>>
>> -	control.ctrl.clear =3D 1;
>> +		control.ctrl2.clear =3D 1;
>> +	}
>>
>> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>> +	writel(control.control, entry->disc_table + offset);
>>  }
>>
>>  static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
>>  {
>> +	u32 offset =3D get_control_offset(&entry->header);
>>  	struct crashlog_control control =3D {
>> -		.control =3D readl(entry->disc_table + CONTROL_OFFSET),
>> +		.control =3D readl(entry->disc_table + offset),
>> +	};
>> +
>> +	if (entry->header.version =3D=3D 0) {
>> +		/* clear trigger bits so we are only modifying disable flag */
>> +		control.ctrl.disable =3D 0;
>> +		control.ctrl.clear =3D 0;
>> +		control.ctrl.complete =3D 0;
>> +
>> +		control.ctrl.manual =3D 1;
>> +	} else {
>> +		control.ctrl2.disable =3D 0;
>> +		control.ctrl2.clear =3D 0;
>> +
>> +		control.ctrl2.manual =3D 1;
>> +	}
>> +
>> +	writel(control.control, entry->disc_table + offset);
>> +}
>> +
>> +/* version 2 support */
>> +static void pmt_crashlog_set_consumed(struct intel_pmt_entry *entry)
>> +{
>> +	u32 offset =3D get_control_offset(&entry->header);
>> +	struct crashlog_control control =3D {
>> +		.control =3D readl(entry->disc_table + offset),
>>  	};
>>
>> -	/* clear trigger bits so we are only modifying disable flag */
>> -	control.ctrl.disable =3D 0;
>> -	control.ctrl.clear =3D 0;
>> -	control.ctrl.complete =3D 0;
>> +	control.ctrl2.consumed =3D 1;
>> +
>> +	writel(control.control, entry->disc_table + offset);
>> +}
>>
>> -	control.ctrl.manual =3D 1;
>> +static bool pmt_crashlog_rearm(struct intel_pmt_entry *entry)
>> +{
>> +	u32 offset =3D get_status_offset(&entry->header);
>> +	struct crashlog_status status =3D {
>> +		.status =3D readl(entry->disc_table + offset),
>> +	};
>>
>> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>> +	return status.stat2.rearmed;
>> +}
>> +
>> +static void pmt_crashlog_set_rearm(struct intel_pmt_entry *entry)
>> +{
>> +	u32 offset =3D get_control_offset(&entry->header);
>> +	struct crashlog_control control =3D {
>> +		.control =3D readl(entry->disc_table + offset),
>> +	};
>> +
>> +	control.ctrl2.rearm =3D 1;
>> +
>> +	writel(control.control, entry->disc_table + offset);
>>  }
>>
>>  /*
>> @@ -177,7 +290,7 @@ enable_show(struct device *dev, struct
>device_attribute *attr, char *buf)
>>  	struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
>>  	int enabled =3D !pmt_crashlog_disabled(entry);
>>
>> -	return sprintf(buf, "%d\n", enabled);
>> +	return sysfs_emit(buf, "%d\n", enabled);
>>  }
>>
>>  static ssize_t
>> @@ -251,16 +364,135 @@ trigger_store(struct device *dev, struct
>device_attribute *attr,
>>  }
>>  static DEVICE_ATTR_RW(trigger);
>>
>> +static ssize_t consumed_store(struct device *dev, struct device_attribu=
te
>*attr,
>> +			      const char *buf, size_t count)
>> +{
>> +	struct crashlog_entry *entry;
>> +	bool consumed;
>> +	int result;
>> +
>> +	entry =3D dev_get_drvdata(dev);
>> +
>> +	result =3D kstrtobool(buf, &consumed);
>> +	if (result)
>> +		return result;
>> +
>> +	/* set bit only */
>> +	if (!consumed)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&entry->control_mutex);
>
>Please use guard() and remove the gotos.

Will do. =20

Thank you for your comments!

Mike

>> +
>> +	if (pmt_crashlog_disabled(&entry->entry)) {
>> +		result =3D -EBUSY;
>> +		goto err;
>> +	} else if (!pmt_crashlog_complete(&entry->entry)) {
>> +		result =3D -EEXIST;
>> +		goto err;
>> +	} else {
>> +		pmt_crashlog_set_consumed(&entry->entry);
>> +	}
>> +
>> +err:
>> +	mutex_unlock(&entry->control_mutex);
>> +	return count;
>> +}
>> +static DEVICE_ATTR_WO(consumed);
>> +
>> +static ssize_t
>> +rearm_show(struct device *dev, struct device_attribute *attr, char *buf=
)
>> +{
>> +	struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
>> +	int rearmed =3D pmt_crashlog_rearm(entry);
>> +
>> +	return sysfs_emit(buf, "%d\n", rearmed);
>> +}
>> +
>> +static ssize_t rearm_store(struct device *dev, struct device_attribute =
*attr,
>> +			   const char *buf, size_t count)
>> +{
>> +	struct crashlog_entry *entry;
>> +	bool trigger;
>> +	int result;
>> +
>> +	entry =3D dev_get_drvdata(dev);
>> +
>> +	result =3D kstrtobool(buf, &trigger);
>> +	if (result)
>> +		return result;
>> +
>> +	/* set only */
>> +	if (!trigger)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&entry->control_mutex);
>> +	pmt_crashlog_set_rearm(&entry->entry);
>> +	mutex_unlock(&entry->control_mutex);
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(rearm);
>> +
>> +#define DEBUG_REGISTER_INFO
>> +#ifdef DEBUG_REGISTER_INFO
>> +static ssize_t
>> +status_show(struct device *dev, struct device_attribute *attr, char *bu=
f)
>> +{
>> +       struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
>> +       u32 sts_off =3D get_status_offset(&entry->header);
>> +       u32 ctl_off =3D get_control_offset(&entry->header);
>> +       struct crashlog_status status =3D {
>> +               .status =3D readl(entry->disc_table + sts_off),
>> +       };
>> +       struct crashlog_control control =3D {
>> +               .control =3D readl(entry->disc_table + ctl_off),
>> +       };
>> +       int len =3D 0;
>> +
>> +       len +=3D sysfs_emit_at(buf, len, "clear_support: %d\n",
>status.stat2.clear_support);
>> +       len +=3D sysfs_emit_at(buf, len, "rearmed: %d\n", status.stat2.r=
earmed);
>> +       len +=3D sysfs_emit_at(buf, len, "error: %d\n", status.stat2.err=
or);
>> +       len +=3D sysfs_emit_at(buf, len, "consumed: %d\n",
>status.stat2.consumed);
>> +       len +=3D sysfs_emit_at(buf, len, "disable: %d\n", status.stat2.d=
isable);
>> +       len +=3D sysfs_emit_at(buf, len, "cleared: %d\n", status.stat2.c=
leared);
>> +       len +=3D sysfs_emit_at(buf, len, "in_progress: %d\n",
>status.stat2.in_progress);
>> +       len +=3D sysfs_emit_at(buf, len, "complete: %d\n", status.stat2.=
complete);
>> +       len +=3D sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x%0=
2x\n",
>sts_off, ctl_off);
>> +       len +=3D sysfs_emit_at(buf, len, "status:  0x%08x\n", status.sta=
tus);
>> +       len +=3D sysfs_emit_at(buf, len, "control: 0x%08x\n", control.co=
ntrol);
>> +
>> +       return len;
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +#endif
>> +
>>  static struct attribute *pmt_crashlog_attrs[] =3D {
>>  	&dev_attr_enable.attr,
>>  	&dev_attr_trigger.attr,
>>  	NULL
>>  };
>>
>> +static struct attribute *pmt_crashlog_ver2_attrs[] =3D {
>> +	&dev_attr_enable.attr,
>> +	&dev_attr_trigger.attr,
>> +	&dev_attr_consumed.attr,
>> +	&dev_attr_rearm.attr,
>> +#ifdef DEBUG_REGISTER_INFO
>> +	&dev_attr_status.attr,
>> +#endif
>
>You could use a define to hold this so you don't need to use ifdef here.
>Check WMAX_DEV_GROUPS if you want an example what I mean.
>
>> +	NULL
>> +};
>> +
>>  static const struct attribute_group pmt_crashlog_group =3D {
>>  	.attrs	=3D pmt_crashlog_attrs,
>>  };
>>
>> +static const struct attribute_group pmt_crashlog_ver2_group =3D {
>> +	.attrs	=3D pmt_crashlog_ver2_attrs,
>> +};
>> +
>> +static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry, st=
ruct
>device *dev);
>> +
>>  static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
>>  				     struct intel_pmt_entry *entry)
>>  {
>> @@ -286,14 +518,24 @@ static int pmt_crashlog_add_endpoint(struct
>intel_vsec_device *ivdev,
>>  	return 0;
>>  }
>>
>> +static const struct attribute_group *select_sysfs_grp(struct
>intel_pmt_header *hdr)
>> +{
>> +	if (hdr->version =3D=3D 0)
>> +		return &pmt_crashlog_group;
>> +
>> +	return &pmt_crashlog_ver2_group;
>> +}
>> +
>>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>>  				      struct device *dev)
>>  {
>>  	void __iomem *disc_table =3D entry->disc_table;
>>  	struct intel_pmt_header *header =3D &entry->header;
>>  	struct crashlog_entry *crashlog;
>> +	u32 version;
>> +	u32 type;
>>
>> -	if (!pmt_crashlog_supported(entry))
>> +	if (!pmt_crashlog_supported(entry, &type, &version))
>>  		return 1;
>>
>>  	/* initialize control mutex */
>> @@ -303,11 +545,13 @@ static int pmt_crashlog_header_decode(struct
>intel_pmt_entry *entry,
>>  	header->access_type =3D GET_ACCESS(readl(disc_table));
>>  	header->guid =3D readl(disc_table + GUID_OFFSET);
>>  	header->base_offset =3D readl(disc_table + BASE_OFFSET);
>> +	header->type =3D type;
>> +	header->version =3D version;
>>
>>  	/* Size is measured in DWORDS, but accessor returns bytes */
>>  	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
>>
>> -	entry->attr_grp =3D &pmt_crashlog_group;
>> +	entry->attr_grp =3D select_sysfs_grp(header);
>>
>>  	return 0;
>>  }
>>
>
>--
> i.

