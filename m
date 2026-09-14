Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6EA412BF9
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 21:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420540; cv=fail; b=ZSsgnDV9U1gw7xbQl4NbizHSDHhDB8bM4f66knmzTxFzSjoj9J9uHvqRUT3jvS+YdSVzkO3gtnZ/a8BcCGhutbdk2T2OPLfjmeci+Scw7X/HCpnRBItfsSHQ8VqIKGwukc2uq16UgCk6juI1aCkSa/rgxHi7Jd6nhmCRB9nFmuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420540; c=relaxed/simple;
	bh=beTttll1B7/ctn4qwKysCbd5s4FJOYlTTjmTgGTzBKE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XoH6pjlb9ZmGYtwUNNHp/WmIejTHWAkxoLhW3rZR2+twonZBl3kL62ueo/TAF3S6WPT/IF9iTqHR1MBGh7qMfMKrdHq1o7SFmkCOWGBoi9+vg5iZ8+o9B6fRvRBv25P4DBXV5bfdAPv6UMo6IsnpiR6MMHfZRrkV83Q/TWnkR7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfKBUl5i; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfKBUl5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789420537; x=1820956537;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=beTttll1B7/ctn4qwKysCbd5s4FJOYlTTjmTgGTzBKE=;
  b=MfKBUl5ikNX8FWItUoVd4fh3ciiOooBIiFFzTfUF4RqV6dy6kBPpROyY
   68FQMOTNI5DoYk4MxiJWNIZYR5j38j4YOr78vMNW/VC5sJrcfbbaSnpTG
   s0AT9QezMDOqnI/VRIZjaBvvJTX+tJzuEHpqvTh9hJ0g1l5ZV3iBzkMTM
   C/Je26pYtLV2Ymk6yApvATAoM2X3k6wP9toz3AOograLAB5vKhOlfWF/F
   8EugAZCS1APCR98h2SExsW+hWAqRyB40fwnbkXoEMJAhNLd7dUlb7vj0G
   7ZScrFCRqFmEyLz4f4vUBBS68eh6v2eLJPWYjZZtFD72ZIvNboUU9kBve
   Q==;
X-CSE-ConnectionGUID: Q33imAIJSzWBWM/qDaZy/g==
X-CSE-MsgGUID: JjL6iUN+RquUD/S/TNKCCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89622941"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89622941"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:15:36 -0700
X-CSE-ConnectionGUID: P4b8net4QBOwZYVeQhA5wA==
X-CSE-MsgGUID: 0RLBOsNbSVWB41C0EIJHHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276884222"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:15:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:15:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:15:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1W3Hzo4JZxkpwDq0EAWCGdDtSjnabXKJ+5YYzAYepoxRrn8eWp5HDRoNx+zlFUjB0Kqj+NYE3uNHLI3QC2jjfrL7862WPrM7p9RIlVTQesuxfTqSXrKLoFykFG63vXT3KiAdxYYJdfFRF49uumdXW2dW3rnHcQe8nHFl/seRMIPxpkuI9GgljXx/85ZNWNP7V3x+XC3kJInOBFeQyLBBpONT652wDi963LdCT88R8kzdf44EdsFWIfgzkYVhqoUr5NVfdlkbqKVid0a1EWrqTf1ltEHMWbeFxF2EP31EO9KNY6IY8bd7L9nFaxfUxXMZM8DPzQlIeQgQ4Oj1Pw0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnwTjY94gDZFaMWeQ3WpdezYtLXEUcu7DlmXyBsEMmg=;
 b=IXuOpuuUfk5p+OTfUWqZw883roeHyDoQjO0Rb2Zj1R3ujMkDgAh9al+E542N0sVsjLPG5F3MOHMW8A01lqKaIQ0XfWlMh68Mtj8KPbbCdrLkrjEvBWWhwVg/p3/EkRmtrDktQiXd+1cWC8iQ00zq1T9jo66Vrv0/yPzYbhPqj/OoNmoAiVGKb3r3o9wdrS4KZa6rqe6B8kXOUnAJl4haIDVY3BkIy/AUlznbGGgduvYW/Y6E4kD5VE65bPP9DegV0cOMFtF322dd3Kld0OQd9nNll9FEhyV2XwiRanU50j7vMnYplqE92GcjfBKHb9R7ug9+iByH/1miOJKa9JvbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS0PPFCC3B1643A.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::50d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:15:34 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:15:34 +0000
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
Thread-Index: AQHdQingSrKxZlk3BUeBwfONh7HlLrbOP1aAgABWimA=
Date: Mon, 14 Sep 2026 21:15:34 +0000
Message-ID: <CH3PR11MB04614900F180C4E0CE09C9D4A0C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS0PPFCC3B1643A:EE_
x-ms-office365-filtering-correlation-id: 2aff3e40-c111-474c-425c-08df12a550d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 2kQ1X88n3PJF+N5kj/KVSXx+JU6fTClIF3qUcA3DtkQX/XSLGGKTKSaWFkUeC4V3U4Q626wS3HyZSeC2L4iIKGBIwWosTW2JF3YD/2wd9Ldz2N7faU6Sjuo5TdPxEOir9+y088ZOMFGdxurLD+VrvKXlnssmHQJpl2klhvujrEKQQiQPMeWHs0tMusv7vi02mNyNjMt+dARw+9qErr0uNKQ6e9yyGpniDV5Dt7mDRyaiKEOt3yI6Hnslw+ZdlL+ta6m1BfsCDHBGcRd+YejxwemN+dSNGJr5bED24YAPJRlwzo9meF+di4ERo5wTCM9+/bYyWlIHk9NyDluT32/PZnFcoNE13Bk8BA2AQ0qcmlq8qjh6MathikBu6lZ1jADIntAuuzt9e3+R+oyvjV50IBvbApL8hFBPwoevWUcrHgH/trkHzzKE2XtlccJbiOD5kdwJTbu6BJQ26jwLvoa2sV35v9YJgw+1N0skNLs6GOe4rEppfLmAcxexkuoC0ByaV4SGTtCqSK2+p/C2my3fELoqNT/zYE4yK2FHqRQX7zF5QK6VJsGsI4dRckI4+jzsFJUEyqVLo/hmgjP5dwCKRkc0HmSlPzQgQq8WMmcTzT6LTdcX2aACldbTLD+BroMTNtA6z/ZLuLP8kSFRhfEZYSyrKs6AfenUkACHjxYd/xM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Gd8G3wCJZ0aJ9mu6qC2n542iKVljAcqGoqCx8s6nb46dV0AQPuTM0/iyfSh?=
 =?us-ascii?Q?C8Nt7yE0Yv0JfXHoNTIJVk1G80v/oKgiGhjFX5y3ebVlicwDH3FDKdBXqmNV?=
 =?us-ascii?Q?7E8CpDxH3VfefSfP8gPFhiizpTZ5txN4v8LLjatvsjTgbY/K1p+D1j+LXgTD?=
 =?us-ascii?Q?VxvT8x/0Ay/W3PEbxN561OLCalVV44dKdkSNClQA6nGkLQPdGcQMbVX0gIJ7?=
 =?us-ascii?Q?WPephgkf5WUeSuQnLB1igZbawskNw4nw7wA3QJKFheMjpi1MmUrYCO865iiB?=
 =?us-ascii?Q?905gA2yv0WJS2CtCNP88Lyxd1vXgVCu/IAYx9uduhiodQRTV1L166uF+o7cG?=
 =?us-ascii?Q?aTqPNbzZ48i6wK3drSN4E3xcWzt+aZ9rGEmKsPsGDAIgIwMAvt7Ao5CIzhVj?=
 =?us-ascii?Q?5qf6B8yk4ojB9uAtTYIZ8P5vdVy5+HqFNob0AN0G42nypBhXXInua8SMP1/K?=
 =?us-ascii?Q?uq63dBg9mjseThRX2z/Sp7hifBSHrNco/Kaq6t/ZSLYA/RP/QSrhvTqdEv8J?=
 =?us-ascii?Q?qV+KU1sPYU0bYy33Kz/RDGdX+OfGqgI5xe0FwSJwzy68XjNON0rg5X4v8xYB?=
 =?us-ascii?Q?TrZ8hECmfPE/l7M45DWimu1NMpODyLBmlqDEOz3yDoA6Mlh3L0fFroHkAquc?=
 =?us-ascii?Q?0IEuEAOThieLPnf+1OycCfkU5iQugIFmcG6Qy/4a4mfHXDv5z4t5/KrMJ53h?=
 =?us-ascii?Q?RZ0JVIFx9AojGZO0FBG5p7UjMx8oasSQ3qOtLqm2UXdeipfZA53dXhyxmOi4?=
 =?us-ascii?Q?suOIA2DpxtUfu5053dPHaW7kATPLKFN1yXd4kd3t8k3eC2LnkzdZlMT+a67Y?=
 =?us-ascii?Q?WjG1Wxl97YfBqf9ZSn2SguSGxctWdMEEz32ZWsDqLcm7qsVleOeme1zmBkyQ?=
 =?us-ascii?Q?Re9SssiU2pMhX26STqOwkYPpWVymcFmOtCaYqpe7v6yPZX7v0U6fQy0yg3fv?=
 =?us-ascii?Q?E8LrLUXZa909LtcSG1j/Vlg3cXV6pNbdCnpU2+LjsK1gqJlFsMaqYmbDgiCj?=
 =?us-ascii?Q?LTnOsStpZwgK6aKzD0V0i/DavXhK3N/XshvsJVwTjvJn+W/WroDW+l43bEPx?=
 =?us-ascii?Q?f4Qi0gToCGqqjxjwHS/+fvy9W9AyYpnpC7xJoTxuPvnoVxVve5mY282W0AL4?=
 =?us-ascii?Q?AEdOVnk3i0S3WpiMMhCLTp/07n+ch3YwZlLY7ZRQsxPvkdpr2nMEtDQPJTh8?=
 =?us-ascii?Q?7RtN9M2NUQlZ+yb3CQOrLV2Jab9BjKIXP4lA2kIqL+B/pG1uhJj0/xKmRn/1?=
 =?us-ascii?Q?8IPKsqPl9gqIfcq31Qoo87PYIvh1HwftqWX/gV6qTPfh8dit3m2/TI+6RHpU?=
 =?us-ascii?Q?N5WUY5eS6chn9m9A+fi638fi6wopWw+KBHxFbwdeNvU4/sAxgYnpIQU/Nnti?=
 =?us-ascii?Q?lGCqkeTvpaRCVoKOZ8iTfoBdB5VF8QOOhOYj8SsX76jW96xoRiYzr9/BeaVE?=
 =?us-ascii?Q?nMhZ0K9bB2SYjUp4MGnq9OpMMxpDNtyq6YeWIIKgdA7FdSjWWaxQwj8c2TLT?=
 =?us-ascii?Q?QzJdMn+KbXv03dyvAUg+bEMzKPuBByAbOxnGeeUNtU+dG9/fhQL++KR0U/qc?=
 =?us-ascii?Q?xy6ln2Q6+MAZLgal8NlXovm8yVO7ZtPNNYZh3ZcCNKGg6SLvX6fN0agrBsfT?=
 =?us-ascii?Q?2m03IzOeDfrEIJ3mZ83T8ZoyJN42IiFYAR9cLb8NEZzVi0mAdLeYqghRLJjL?=
 =?us-ascii?Q?FtRCMmXVyl181oLNB+xKzFatFZBcm7J2mFjl36L20MTOHvtIRJ7AD4IGXD6p?=
 =?us-ascii?Q?M2TUZF3a5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CVQ2JMyEaB55YFnFVJiKgvWOEZxKREyned1/j2iGxyr5vnoZvpmhFt0jW1uta+Xo4KdBWGjWPL/ySZco9lNxflyK99E/I8XDS02JNH2fBt9l2Be7D9Mk8kt9ThtXHmO/xTAj98h2bd9ZXjkrpFzW1FqHSy6Mjci/PCSR/7C6VenTjA5mVuoPaCHE+TElgDF0nmOGON2Y3x6POE+gZxii+zFc1QMMDvp79u66Fr6Q3HZ7qUadpq7Rz5uYrnCb6y+0lkY35TvrwQfxm4bmrBYsXOLyCmphmakaX12UvQorrjDw219zFeq0TUsYX10+sWWsOYOAbcwz491H8lh1NTMVsg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aff3e40-c111-474c-425c-08df12a550d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 21:15:34.4642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SuFMd/JpBFl8nGTgfEzTo/WNZqX2FKjwZn7wxciltboUkZCEsXa/0lA4t3iKdRioJWIpdopkIt2o7kFPYNBYpOmp8URxJZmhvUgl5H4bB+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPFCC3B1643A
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

This helper is in a different patch set...I had debug compile code in this =
originally (to allow for this
to compile), but got the impression that was not something I should do..

Should I keep a debug compile function in place?

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

Yes.  My next patch set will do that.

>> +
>> +	intel_vsec_register(dev, info);
>> +}
>
>yet on the probe, please address Sashiko's race.
>
>Although ulikely we should protect here...
>probably adding a devmanaged removal with the work cancellation

The issue here s that the probe can be delayed (waiting for FW to boot), an=
d the HWMON init can
access.  So there MUST be a lock here.

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

I was told to use get_noresume on one of my previous patch sets....

I think that it was because we should definitely already be powered, and th=
is was just
a reference count operation.

We do need to keep the device powered until the FW load is complete and we =
do the PMT
registration/probe, so we do a get.

>> +		if (!xe_is_oobmsm_fw_ready(xe)) {
>
>xe_sysctrl_is_oobmsm_fw_ready ?!
>
>Please ensure that all patches compile individually so don't break bisect =
flows.

Is there a way to reference another patch set to have it included in the bu=
ild?

https://patchwork.freedesktop.org/series/164471/

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
