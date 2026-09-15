Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779693AE1BC
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478058; cv=fail; b=Mt7DzqEA7Z4MMYhTdoNhP2Ac6sPmY+mac0vP0uiC/9EPOKv9UAqdRqyuECeHsfiyGflXVv2gfjwnkNF8uzHvuUPsQ6mdvmm0sfNvcxb/nkw1mxW0GC4ygxArK2k+7G3GEOrUGLNcv4oI/f7PQ9TBAFUXOXtveLLztAXB3TmhaqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478058; c=relaxed/simple;
	bh=83m1mFsyXo/Fb7vxCnGv9l5K19jxv1p8obZ7rl98lUQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VoFB1mgqhB06ELAkXjsmnC0esVEkqlOMXYkkC0q7Gb1jieSbGH+94BuV6eRtEMCBvA0EORk4GXHQG48JCSgaVkl5+/MBhl+m/IL/ZdcYuJWzXHg/HH5ZeiVbGky5j+lrFePGuQs83n2AWIYYYoXa8sfKcGAnkFQvlGFPW3FlC9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIDcvVCm; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIDcvVCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478055; x=1821014055;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=83m1mFsyXo/Fb7vxCnGv9l5K19jxv1p8obZ7rl98lUQ=;
  b=kIDcvVCmjYiSv8EEzYqxsWJgtaQ4HEMjg8Fpxpcar4mTl/mTwR7tSJSZ
   1cbmolVX9iE0u7jfsdsjCQNJX1Rjx7l7aKajn3HRwQoNf3I8ake7bqF37
   LN8SHyPYVrltBxpFQzAUPUht0SAC4TiRI/SgmMlTuYx4qzEwwzHkzbs0y
   I+ub7SQElYzctWKH5AteTi7+aMkzmwPztIwKt1A495lq2UoD0B7kvH2Td
   TAztKG1XNE2HaO5ndc66KIbqE8CoAExLXwGnCpmfPZNBOBvIYXWqs+nkr
   2GjYnNe9R9OZw06jZ0I45Ydw+OSJTQImGZ3rDBI/SeOt53jSEg4g7bV8G
   A==;
X-CSE-ConnectionGUID: 1xnDPClfQrGTRZMJ4ups/Q==
X-CSE-MsgGUID: bsMdEYTERSKnYbfXHGaOBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89710066"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89710066"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:14:14 -0700
X-CSE-ConnectionGUID: E5JmDZ+ISDygVzxVANb9WA==
X-CSE-MsgGUID: psNdW1vSQZGZeW5IK7JWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276765799"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:14:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 06:14:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 06:14:13 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 06:14:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaN06KDqHCgLLnnP8We0rWfSiYAyNnS5IrRNH/nEf92xp4e8g7bb/NTY6gJlC0Wkf4cs5gJNBxVxGz/j62oYqMXOE3y4JReY9Wti9BO/1701mJZuAG8SMN7uQdReajlPfMHcqsPg0YF2+wvBQAgquesgBL/YMzy14Mlk2hLMkA9kZUV6oFXgKcSZPethGpZ/2REMPjXEapmE7E8r1MpnlfMquN29vobZdmXQGjFwXo+4iLT8ev8lYXoTNWjfHwHiOvK0Sx/KZOrEFzNbTBgzAaTX0ZXQfUlH7cqM7rbxXm2IM9WohT1owUi9aXz6P4KTluYCS9hvyxzi7TfvSeVagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhfL8mkAKSO6k1BufmyZ/eN7pDcBqBflxSodwIV76OM=;
 b=i480xEVgHM/coNtI0ZmgRX5oc25IXAArSNKN2b9qRYjKc+xOOPS2zI9F2tJjrHgfK5aRiTb8LV2VTrr6K8sC5/kCdNGVkaK/lywlCp2tkwQm2IqLx4LbkuhqvPQ2AkiFVT0xNQ2AafCRkLaldoh04kSiwcRmj0qOi/LTHyqclfFS3oLnRxlVdnpASNX/xRd2r+BnRmul328Oa//RKThOtxam+4DoLhhZCjhi4prTDsjuhl+QCHNfPMyrTVNz1cdKl8iZ5ciMMsR2Yl1wUEEvRb4AKQVFGINGCGTPSQwxQtMTEt9Bdhwvv7vZFzeIbdO6u1zvAXRY1bLB0nw5LySIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SN7PR11MB7066.namprd11.prod.outlook.com
 (2603:10b6:806:299::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 13:14:05 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 13:14:05 +0000
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
Subject: RE: [PATCH v8 17/20] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v8 17/20] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdQingSrKxZlk3BUeBwfONh7HlLrbOP1aAgAFkFEA=
Date: Tue, 15 Sep 2026 13:14:05 +0000
Message-ID: <CH3PR11MB046149DD1D9B4D1FCF7D9B9E84C1BA2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-39-michael.j.ruhl@intel.com>
 <aqgZj4S_meH4YbMa@intel.com>
In-Reply-To: <aqgZj4S_meH4YbMa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SN7PR11MB7066:EE_
x-ms-office365-filtering-correlation-id: d8adfe40-6891-48c1-950e-08df132b37d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: M9dFrcndO3g9P9IdH+ZBqsoUzUqf3X4nefq9tu1yBsDxoAgjSpqi4f5TiRjtHJa5b07nc1oByuZQXAFdtWOQbWeH24hGlV88FM1jcleeovUPzhcJPGBbTOFhBE+q0StsDtdbd4ARqAVrryGjEYi0/kzgL/JdNeR12mkOAkIAbjeDbBtUJp2b/SoQbw5qO4wQ1WbwH/exrZzgMUdAqBJNQMRrpoCuxbzFrh4a7fz4iVgHX9D5Ns4jGxwKCZDQi7hIR3zbv3byo4YcuZX67VF1uIhDJ4Uq2KTmexbtz+yryC1PZMF+GTvL/xoZraI6VhGtqSI3QteUXjva99jQ7AFsPrL/Eu70FvicQFvf1j5u989D3oekZ/G6StM68vujjeDOutjecVQq0Jrh/6PhQ+fZEtV+A9hZcLChui7q2gHLROWPTCNPDWSEzeOTGaZQyPG0np+h7k0aS4BZBqAYtRgWfvQYvyD/VQEe8HWSQUd1bHaPsBUFfqI37GgsSbLVY8KCDPWISUtcbeBIcfmbDfFttO+/qyIbAndiyQo9t9Rqswi7+SI+OA7gfwJ8EK05JjrLcs5q5v5ofPrtmuuBQlWaARADxODKH0ogq0XBL0lRvoniVIxZbhw+CoNxRV60R/f9r28kZGFsnNt7VQWQoL2FWoZibm5NyWTTsAFV64ojKR2U1lnp3B6WTGResCFxOYS7FwtZTACxtwXw3HPPmGa6JXYg1zc3+wmdXSu+7SnW2eQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q8pYhnvTfd5xQTLNAVJ16CHnQurX90jWrhhK/Z70bVtcVZq2MdU0Yp/sbE8/?=
 =?us-ascii?Q?/qoQes3rQhh4xJAqvOzGLE1dB/0+lJje6obpRvp5Ds2c8y+b9HFr4c02C+vK?=
 =?us-ascii?Q?QwcXNVD11lzYsIe9B6cPiUZdaUavics253z8GXQcoQWymhGQ4IUH8K5d87an?=
 =?us-ascii?Q?048ihdrvuV9wU/9QVLc8QILJwpt6zi+YAwyImj+AISbu5lO3CSoVFpHzObHl?=
 =?us-ascii?Q?anpcifxL7sfYF6h2jH2c0TcRLRfZd4JfyuhWjeUFIGdKzKCJP0yrIFxWgAW0?=
 =?us-ascii?Q?uHmuWl8qzaJueuvAxTB8Q4vIGHgmathZWwC8tWX1VgJKGzKEiv1ibJiQ0vwn?=
 =?us-ascii?Q?IAT9gL95cCiY85w3V6pJ+R4Mhrwm20JJLML+JaslTbZC8H7DLWAaYDcLpsm3?=
 =?us-ascii?Q?VGsCkv58aKME+z13pfd9GTS9o6UDyjqtrcOnGqECOkJHaetaB6AcVawzcJMa?=
 =?us-ascii?Q?dKOFEDQWugiNwArwYVQLHpXw2FpCcVSLONpFq0Vc0nZDi13OLk+aCkGY5Hft?=
 =?us-ascii?Q?90BIAE+CJnlyy1HUmrJ4ITZ/w3Z5LpmJCQCzob9I38fjghZgLaDGK6pvzR44?=
 =?us-ascii?Q?mgUztZqwB3gMKLEm/FGVT6evUKCA4gWsXhkWnZZmzBZ4zxeldppW8LWw/Vp6?=
 =?us-ascii?Q?M7RHsADyMYnjFopTrJrjGlSXF4LfqGsIFfMvSULell2mxEg0CJmY71pt0ZEG?=
 =?us-ascii?Q?jzOCi+T5fAm/BdMhAmq3Y4wRGKh1VLu4U060Qz4CfC6huvDZKbSCBJEv4YnA?=
 =?us-ascii?Q?7k5UR3FygIhk/FGJ680BcrTFxu8elIRayDof1nY+nUESNQQTm3e+dFFC4AKH?=
 =?us-ascii?Q?tZyfm6GxUA37OIKLIjXrzAuPdJZR8muYzA8QsD3T9UjyL1rWNQTybPWqj0FF?=
 =?us-ascii?Q?FmIvMAoQsvPNx/0XrfKXJ4hcXGqo0KPuqWnU9VP62iS8cmR1dtKPWyfn1rpF?=
 =?us-ascii?Q?eVD9ZftHZ/ddoBFy8lAvAYtj6TyEB/fWn5pTazwHmw9NylnEkXFVxru/fXMh?=
 =?us-ascii?Q?RXM9hhtPPAj86TFKJ0ZXuvJTLsxWjmA9KO3Lpfo/c5RFcPGoq+ts/MtvqkRv?=
 =?us-ascii?Q?qwzuLooY1qUEVCG5PwHLquIMOt6WriXj7i2iqxMIj/+47wcefDnxJI2MUM2T?=
 =?us-ascii?Q?JYAGXI6qG867fSbLm+eLle3XeD9ZBaCDaBtLC+NaGswO+bTd0D1GK4jKFm13?=
 =?us-ascii?Q?Yb43zZQ3lECKA2k7usGlJp/kMzxergquerUVZAYFtLF8ONRXMXty4KQRaDfQ?=
 =?us-ascii?Q?clKi3A+9yYmAC1kwlONbMy2b98TU8RpApRlsxgrw82rC4Wlcr2Mw3LISO485?=
 =?us-ascii?Q?Rlu73L9EKjDnNItnDomIUZ0kMx1HQ3+UZgSzFMpa0mJpb6YiJC+3QfilOCxE?=
 =?us-ascii?Q?LZjEXAvlKYY5wImyoXGrboHgABVibtVE8f53q1GCtgR6mvqoFD6NGEeW1STj?=
 =?us-ascii?Q?CZQLS7hrDEOXUeluP+0nje7qKwaJP4FTKqj6l+jbxCXp1AiOd5BYE/B8/Nrw?=
 =?us-ascii?Q?2sUtL99ICJ+JpCxntoIxnozGIEIHkXMl7f6gHI7dn0Di+hZPnhgGhlOKrwd4?=
 =?us-ascii?Q?UhCHcqYrUNdxs/m1OADZ3oIvco60xWUE736Qh+MpzWRJHgrjxQWV7ag1nHZu?=
 =?us-ascii?Q?HJiy90ISfrDKxHTa5hJ0rzKFwIsyNX2NG1/uX/2CBlDC6TvyZ/hANZ+bZIly?=
 =?us-ascii?Q?31eJWAbj6OJ2tg/eiSWZOQjfTAYl+DNHavC7kuR/wVKWqMetLr0w8tOVcoBF?=
 =?us-ascii?Q?GFzBEay4kA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Lw6WPhYQf7Ko0DNJ56jUJgJPfGbnQ2HCs497igjE/q9KoguNRzv2nmFOkAti0HGU80WemSMuUHCtNfDXVpv2tPOsp8Xi1EHQzoKpTpp53cD44NVEaDSqaaNwGyh5+MaJsfUkLDlC69J4L62S2lLNPLPpXEEpgaJxaEJcUSekoVakeZqqDFWZIKwMhr4TCjC6i7hkzEq+aERm4mk+YYzNAkUKZWMmciylWrXz9vMbFX5ANJqbySx4PLIaBv38OB0ju9jn7MAut+aCuZIQbEJadYvR6vJi5HHMVxa9xqoW6PTzwZMDCamixX5aVjmWf9xGleRPBPWvRy31WE2v136+IA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8adfe40-6891-48c1-950e-08df132b37d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 13:14:05.0812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4mV+k2w3qXKTWzMMlXq1hErTbTFxZVd8rj0vARGhRapB3sJe+acMsNAB6rKYDdOR4ph2no195TaGlgM7ITXbeV34eHD/t9ieaLUsT4dGRww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, September 14, 2026 11:58 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v8 17/20] drm/xe/vsec: Support late bind fw informatio=
n
>
>On Fri, Sep 11, 2026 at 01:12:05PM -0700, Michael J. Ruhl wrote:
>> CRI FW is loaded on power on.  Because of this, access to the FW cannot
>> be done until it is running.
>>
>> Update the XE PMT probe and access to check for late bind devices,
>> verify, and wait for the appropriate FW state before probe or access.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>>  drivers/gpu/drm/xe/xe_vsec.c         | 134 +++++++++++++++++++++++++--
>>  drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
>>  4 files changed, 137 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>b/drivers/gpu/drm/xe/xe_device.c
>> index 3ec950606e67..a2c8c7909688 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1053,7 +1053,9 @@ int xe_device_probe(struct xe_device *xe)
>>  	if (err)
>>  		goto err_unregister_display;
>>
>> -	xe_vsec_init(xe);
>> +	err =3D xe_vsec_init(xe);
>> +	if (err)
>> +		goto err_unregister_display;
>>
>>  	xe_debugfs_register(xe);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>b/drivers/gpu/drm/xe/xe_device_types.h
>> index ebdc271ebeae..67dd786e202b 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -7,6 +7,7 @@
>>  #define _XE_DEVICE_TYPES_H_
>>
>>  #include <linux/pci.h>
>> +#include <linux/workqueue.h>
>>
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_file.h>
>> @@ -475,6 +476,10 @@ struct xe_device {
>>  		struct mutex lock;
>>  		/** @pmt.base_offset: device specific base offset */
>>  		u64 base_offset;
>> +		/** @pmt.work: support late-bind probe */
>> +		struct delayed_work work;
>> +		/** @pmt.retry_count: late-bind probe retry */
>> +		u32 retry_count;
>>  	} pmt;
>>
>>  	/** @soc_remapper: SoC remapper object */
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index cb3d9142346c..c2f527e7894a 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -3,6 +3,7 @@
>>  #include <linux/bitfield.h>
>>  #include <linux/bits.h>
>>  #include <linux/cleanup.h>
>> +#include <linux/delay.h>
>>  #include <linux/errno.h>
>>  #include <linux/intel_vsec.h>
>>  #include <linux/module.h>
>> @@ -18,6 +19,7 @@
>>  #include "xe_mmio.h"
>>  #include "xe_platform_types.h"
>>  #include "xe_pm.h"
>> +#include "xe_sysctrl.h"
>>  #include "xe_vsec.h"
>>
>>  #include "regs/xe_pmt.h"
>> @@ -173,6 +175,14 @@ enum capability {
>>  	WATCHER,
>>  };
>>
>> +/*
>> + * Late bind will delay 100msec for up to 20 seconds
>> + */
>> +#define VSEC_LATE_BIND_DELAY_MSEC	100
>> +#define VSEC_LATE_BIND_RETRY		200
>> +
>> +static void cri_late_bind_probe(struct xe_device *xe);
>> +
>>  static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>>  {
>>  	u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
>> @@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32
>*offset)
>>  	return -ENODEV;
>>  }
>>
>> +static void cri_late_bind_probe_work(struct work_struct *work)
>> +{
>> +	struct xe_device *xe =3D container_of(work, struct xe_device,
>pmt.work.work);
>> +
>> +	if (xe_is_oobmsm_fw_ready(xe)) {
>
>ditto
>
>> +		cri_late_bind_probe(xe);
>> +		xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +
>> +	xe->pmt.retry_count++;
>> +
>> +	/* wait up to 20 seconds */
>> +	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
>> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to
>complete\n");
>> +		xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +
>> +	if (!schedule_delayed_work(&xe->pmt.work,
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
>> +		xe_pm_runtime_put(xe);
>> +}
>> +
>> +static bool wait_for_fw(struct xe_device *xe)
>> +{
>> +	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>> +
>> +	if (xe->info.platform !=3D XE_CRESCENTISLAND)
>> +		return true;
>> +
>> +	while (retries--) {
>> +		if (xe_is_oobmsm_fw_ready(xe))
>
>ditto
>
>> +			return true;
>> +
>> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
>> +	}
>> +
>> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
>> +
>> +	return false;
>> +}
>> +
>>  /**
>>   * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a
>buffer
>>   * @dev: valid Xe device
>> @@ -345,6 +397,11 @@ int xe_pmt_telem_read(struct device *dev, u32
>guid, u64 *data, loff_t user_offse
>>  		goto dev_exit;
>>  	}
>>
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>> +
>>  	mutex_lock(&xe->pmt.lock);
>>
>>  	/* set SoC re-mapper index register based on GUID memory region */
>> @@ -354,6 +411,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>>
>>  	mutex_unlock(&xe->pmt.lock);
>>
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -396,6 +454,10 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
>>  	disc_addr +=3D inst + offset;
>>
>>  	xe_pm_runtime_get(xe);
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>>  	mutex_lock(&xe->pmt.lock);
>>
>>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> @@ -403,6 +465,8 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
>>  	*reg =3D readl(disc_addr);
>>
>>  	mutex_unlock(&xe->pmt.lock);
>> +
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -433,6 +497,10 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
>>  	disc_addr +=3D inst + offset;
>>
>>  	xe_pm_runtime_get(xe);
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>>  	mutex_lock(&xe->pmt.lock);
>>
>>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> @@ -440,6 +508,8 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
>>  	writel(reg, disc_addr);
>>
>>  	mutex_unlock(&xe->pmt.lock);
>> +
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -471,12 +541,44 @@ static enum xe_vsec get_platform_info(struct
>xe_device *xe)
>>  	return vsec_platforms[xe->info.platform];
>>  }
>>
>> +static void cri_late_bind_probe(struct xe_device *xe)
>> +{
>> +	struct intel_vsec_platform_info *info;
>> +	struct device *dev =3D xe->drm.dev;
>> +	enum xe_vsec platform;
>> +
>> +	platform =3D get_platform_info(xe);
>> +	if (platform !=3D XE_VSEC_CRI)
>> +		return;
>> +
>> +	info =3D &xe_vsec_info[platform];
>> +	if (!info->headers)
>> +		return;
>> +
>> +	info->priv_data =3D &xe_cri_pmt_cb;
>> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>
>don't we need to wrap this around the xe->pmt.lock?
>
>> +
>> +	intel_vsec_register(dev, info);
>> +}
>
>yet on the probe, please address Sashiko's race.
>
>Although ulikely we should protect here...
>probably adding a devmanaged removal with the work cancellation
>
>> +
>> +static void vsec_disable_late_bind_work(void *arg)
>> +{
>> +	struct xe_device *xe =3D arg;
>> +
>> +	/*
>> +	 * If the queued work is canceled, the runtime reference needs to be
>> +	 * released here.
>> +	 */
>> +	if (disable_delayed_work_sync(&xe->pmt.work))
>> +		xe_pm_runtime_put(xe);
>> +}
>> +
>>  /**
>>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>>   * interface
>>   * @xe: valid xe instance
>>   */
>> -void xe_vsec_init(struct xe_device *xe)
>> +int xe_vsec_init(struct xe_device *xe)
>>  {
>>  	struct intel_vsec_platform_info *info;
>>  	struct device *dev =3D xe->drm.dev;
>> @@ -484,30 +586,45 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	platform =3D get_platform_info(xe);
>>  	if (platform =3D=3D XE_VSEC_UNKNOWN)
>> -		return;
>> +		return 0;
>>
>>  	info =3D &xe_vsec_info[platform];
>>  	if (!info->headers)
>> -		return;
>> +		return 0;
>>
>>  	switch (platform) {
>>  	case XE_VSEC_BMG:
>>  		if (IS_SRIOV_VF(xe))
>> -			return;
>> +			return 0;
>>  		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
>>  		info->priv_data =3D &xe_bmg_pmt_cb;
>>  		break;
>>
>>  	case XE_VSEC_CRI:
>>  		if (IS_SRIOV_VF(xe))
>> -			return;
>> +			return 0;
>> +
>>  		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
>> +
>> +		xe->pmt.retry_count =3D 0;
>> +		INIT_DELAYED_WORK(&xe->pmt.work,
>cri_late_bind_probe_work);
>> +
>> +		xe_pm_runtime_get_noresume(xe);
>
>why get_noresume? I believe here we are in the outter bound callers, hence
>the regular get seems better, no?!
>
>> +		if (!xe_is_oobmsm_fw_ready(xe)) {
>
>xe_sysctrl_is_oobmsm_fw_ready ?!
>
>Please ensure that all patches compile individually so don't break bisect =
flows.


Yup.  I missed that this had merged (name is slightly different.  This will=
 be updated.

Thanks!

M

>> +			schedule_delayed_work(&xe->pmt.work,
>> +
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
>> +			return devm_add_action_or_reset(xe->drm.dev,
>> +
>	vsec_disable_late_bind_work,
>> +							xe);
>> +		}
>> +
>>  		info->priv_data =3D &xe_cri_pmt_cb;
>>  		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>>  		break;
>>
>>  	default:
>> -		break;
>> +		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>> +		return 0;
>>  	}
>>
>>  	/*
>> @@ -515,5 +632,10 @@ void xe_vsec_init(struct xe_device *xe)
>>  	 * resources.
>>  	 */
>>  	intel_vsec_register(dev, info);
>> +
>> +	if (platform =3D=3D XE_VSEC_CRI)
>> +		xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>>  }
>>  MODULE_IMPORT_NS("INTEL_VSEC");
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>> index a25b4e6e681b..c4a1e2fc67d8 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.h
>> +++ b/drivers/gpu/drm/xe/xe_vsec.h
>> @@ -9,7 +9,7 @@
>>  struct device;
>>  struct xe_device;
>>
>> -void xe_vsec_init(struct xe_device *xe);
>> +int xe_vsec_init(struct xe_device *xe);
>>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t
>user_offset, u32 count);
>>
>>  #endif
>> --
>> 2.43.0
>>
