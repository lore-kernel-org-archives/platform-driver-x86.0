Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B557D3E5A0E
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 21:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421628; cv=fail; b=HigD+wPhqAeipKNvxofBCmvew1pgV87eQXxuCDpK9GCwfCSOgDswquxwf0lIWtn/YwWT+csKQFbiqEiWIfgaLbI63VXfFyxOXyGpIlDEx2HdWx8j06+dzDZxxqS2KAgOqUdsPNXl8IUzb4N8ectQTazO174XfB7koBXXB+RzapE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421628; c=relaxed/simple;
	bh=rOHYdgt3gVd/3c1VMu5UIm0yMXHc3J5MkY7OqfkDiuE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tPqYtpungA4BTbA4H09ZQsFD0G4f8NrBqjrU5+4gMFB1Su+aq5WV/6dD6Yjhwm4rGLg/q0DAhQY3yRx4nZXE5DFcQYRd/45Clkac8gyCME16DPHoJITcT2ohDwf7j1dWrN9vd36gzYPS+3GjRhAdpmVFyQoMC4zHl0ZnTqD9KJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0c6qPX5; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0c6qPX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789421626; x=1820957626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rOHYdgt3gVd/3c1VMu5UIm0yMXHc3J5MkY7OqfkDiuE=;
  b=R0c6qPX5LD8yGCJAI54wNOXhLj64sFKpvqx+XRY3KybHk+sVtaGsYYU9
   zwS9bfreAyxhrQyUP4tVUOjUIWsIE2n4c0NnJgHd2NQg8v1WTdb2F4Zge
   IstDGxK2G+ZS26A2pb2jTARN8sLK1XZuUVfRHUhgAf7Xc5cy1HQXLDKVM
   WcVlS3JFL4qs9lS5z4w1l++XiI7J7aM5lMaunOWeO8QtzAQafioorZIMh
   rp5jM+xzNg7xthtpU65DneWxfA+tsf8FkLuraN4DLWbkf5thnSr/e1g4I
   2di7ln8iO86IydcJRnz4Q0VVfD+4zi5gHgbjWUfwJencFr2QNswYq8w3W
   Q==;
X-CSE-ConnectionGUID: k9+rzZ6cSDOgUsqOnv8ceg==
X-CSE-MsgGUID: wdB4dm4BR8aqwfLbun/EbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93478041"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93478041"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:33:46 -0700
X-CSE-ConnectionGUID: i9uWw+CATsGtNtB4W4WIXA==
X-CSE-MsgGUID: YupTLI0SSluLdgAOMZxKIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273272666"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:33:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:33:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:33:45 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:33:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCk4byX39QWv/AM7SHwEgpudDsrIHAV+UuqLxhiawZhHlcw04r6KZuXZNeD6zAHs+ZBZe1X09hXE1iYiWApBwSkGS8KtI9D+z+iGEnRsmUrCL/C7lkbi6lGWIhzn7ELUwh9b/PgCFuZlFmI3/+pftkIkLKywfJE+3GtNDxgT3KDSNoiYODnQ25aes9L7acQ6KtABa9SWONLOz6VgRnmYFfDud3RkGSAsp/CBiHid6/6hTQJzWioksGxux8/XrJJ3ilVHyfqPPPLPm+ncfBo2GdjyT3MeaoS3dMk4QUFy88PIi/GqrkPQsstX9Wzq0O9PCPzBNe/B7bsfwCRXIfxPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKHpK0LC+pLSFsvFTGjyrlU2Me9OmXt1YeU3GYIhRvc=;
 b=yiwTjLhLMG19cjSv8nJ+UhIpJsdfhdaZrq979nAO+6Rq3vTGKQGHdbYfTfBE5K1bba3DmvBE6x0RMmt7VL6MbDsAjDJdDonQj+KYO+71VfTWCMuXWPKCxefhu7agSIaGr/S5DuN9E4wpPREg3TbBre4/jb6XH5JvPxPkF3y6hrx80ZfBBePdbEkMP+eUi0U71DFGz1MD3PXzbCrVyhoUHBRkyGPjHdBt33x18CT0ylpSccfTxZySJ9+KJamkwq7pHmNvZnNiIiu/aCAikGqxY01zsQ69VOPL6pfjOnVt0Kx5g/SdZxim1s8PDC+BpuyifVW8ti4YXul49jJBh6kMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CY8PR11MB7012.namprd11.prod.outlook.com
 (2603:10b6:930:54::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 21:33:42 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:33:42 +0000
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
Subject: RE: [PATCH v8 07/20] drm/xe/vsec: Correct locking order
Thread-Topic: [PATCH v8 07/20] drm/xe/vsec: Correct locking order
Thread-Index: AQHdQindponELySOkUqzDWopcwpogbbOQhcAgABXi+A=
Date: Mon, 14 Sep 2026 21:33:42 +0000
Message-ID: <CH3PR11MB0461493AEDDEBCD09BBF15B2D7C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-29-michael.j.ruhl@intel.com>
 <aqgb3tuSZIayYv6u@intel.com>
In-Reply-To: <aqgb3tuSZIayYv6u@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CY8PR11MB7012:EE_
x-ms-office365-filtering-correlation-id: 69aa458f-bad9-41dc-1fc3-08df12a7d961
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|11063799006|56012099006|5023799004|6133799003|22082099003|18002099003|10067099003;
x-microsoft-antispam-message-info: gD40r+JgXULP980ScrQr5+FX1Er9hUcH9miGJJn5n/5LlKvQaOjqIGdoEiuY18qR0NHNqjtc5zyQw6wJT0g/zsvAtEdqBdF50o3+eJ9rn0pnGO0Uxf5VgaVASNj8dWzuh2Zk5qM6hlZJBeFCU062TGuLakc8AzcmkHoL4WqR9EO5K6lAKKamBx79AJL58Ahy7l0uA+0VpwtcM6KtGf+Xn7oIcysKeGhe1Wo6NY9i06XoHYJQTkIsmS7qKDLbP+MfHheHurjXwPFnWgC1aPjud18zbZ3tSC1EnGz0yHzZhomkXxEjm2dy5NJeYb/DfarOB0voGxvtMU2ILf7lUkJ3qNSwjAjiAe/VfLyYb3CZaivNgJBHTBvQWmgBA6FwAo3RH4Vcf/rWmy7VnZal4kvPwTuRbu77rs9PDWiObjMdNZNj+6WBoIbhBEBuxqbEJLL+fMVGVwhzM8WwbnJo5jETvg9D8nZCkobKQjTjCpgyPw0sG9RlefG6J/ouOqJ//pTvPjCEpjRDFD+dY+wOwA7hHZGIIpbHN0+irk1ZRaWTTr5PbvAdH/x+aRmyRdGjGiVYPj0x8pIHXr08/L/OD+DF2WXttPlt9L+qytTMDFSczhELtE8EhiXPnUMn3hip2As0OTmfVgX0qbBedeNBXckhpKcOWQgzXgWTpZxOU4HWaeBeflpoEZMeckh7Y0iT9k0IbFhCAlBgOLdhBU3AgWx6VBN0pazX2U0Eid+0tl38U6c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(5023799004)(6133799003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e2b/k14jvVLv9UbPgRa7VesEWucA3zjzIEpLL6kCFCQjBZsW8GG4X3mHmMHk?=
 =?us-ascii?Q?c5w0nEvMTodEpZM09xlNgB+BxRMzxpjRVPiD4wUIR62jMaCDwLIZ18cnFj01?=
 =?us-ascii?Q?X84keN+0PdLL6Jtg1j0013K60cAgIqLUAgRVUCdOfTUkwz5oMXBkZOVW2FRa?=
 =?us-ascii?Q?aB2WqT6qIdzvWp5jZdEhfYWpRgfP9MHQSVD9uVC4xon9cyVJe/skyD3TUtpx?=
 =?us-ascii?Q?xH/ZaNDSq2fJrX5YRwMsPTZr2PqtSXkp1vOrOBKaICeAELbAwJkA5g84v4FF?=
 =?us-ascii?Q?E/hfpUNTnCHLrytPJY5fJUeLEPdNmwPqWEycfDjzHqp/UQCJe731Bi9Xt+Jp?=
 =?us-ascii?Q?h7XCMA6kylwvID6Bs9DCmPd9SX8l6Z7qwKpxS7aa7N5XOx3YpBZygb41pnui?=
 =?us-ascii?Q?trWKGiTG3hTNogzpYsdpkrDGw7pcuRGHLbw4l0Txh/MvYrBemX50caganypE?=
 =?us-ascii?Q?7PjZmXguZ0qAMzTGbdN82yIx9Wlxeht8775SjiXBjlYjrTdLxQFxNxERROgy?=
 =?us-ascii?Q?f3TDkMkwhZQlerJlc63EQ8O7jnV5BkXncGjEwstrBR0c/asNGYm977JVaQ/K?=
 =?us-ascii?Q?r81kD0ngPwOHKHoGsdAFxFhEPL7awRVEo9GNZ5hm3A5c4LgcPqtfAeq4pdwI?=
 =?us-ascii?Q?Bv7DjYlV6vzgw8uDeP/CiKbtHuuX5adFwtTDvOjINeMQIujXkipE1cr0Wjv8?=
 =?us-ascii?Q?BDXaGggO++wX19AM0KNnUptpt3b/ORMkkwVyCJGZ+QLzPjHbrtTewJbiA8rG?=
 =?us-ascii?Q?+HapqsdOrWq2ToVBErz6jUw12BFBa8kiZfSlHEe57REmFQ1dWB8LUPguPwFA?=
 =?us-ascii?Q?0BHzZvtZR1D2W4MH+Ez2OtT3jKaBAxGTyox7gpw9wLBfvR2X3PbaERKpJq5s?=
 =?us-ascii?Q?lxFNv2AEMCGHsHGsNQ96fuMY8bcCc3YuavUF9apNZHvsTFt9RoXi3GiaiY19?=
 =?us-ascii?Q?CIuYOEg/YUk9tG3ZEgOn3JBbg9IS5lUH5zERJaOr9pjHb1lGPpCuOAegl56J?=
 =?us-ascii?Q?gFSYuXKfvfphp2QHkOGLAAQZi/FvviCbuMnoNNVi+xMRRWkUTEgZNmQWHXdE?=
 =?us-ascii?Q?lDL5ixxRLrsyGHeAF6qg03dLnZ1tFIZV+BOE3N+gDCJHVWxoPaTxLy1J90L7?=
 =?us-ascii?Q?JvcuzOZhYPYykf2d1f6zgUJJ0c830DN+WEWllzOhkduoqWBETfBO+FZ9q9TA?=
 =?us-ascii?Q?qjjpQFrhjZFQkaZs6GxqHZIMQI6PJEjzyLOE3OVumOw07KMUftCLgZpyS0SF?=
 =?us-ascii?Q?ovUXqvfUmLNeA4v0ZGqfdDoAM8xRwhOPhtMpDr9naIYK88kzkK6s4UNVakpz?=
 =?us-ascii?Q?qGSgt5ZM4kKqXlgMTwk4k3jfwfc10MdbN5ySPQlQ6TEK8nmdg14MdCaIioPC?=
 =?us-ascii?Q?W62HO48w19qJwZiP7gF6syCBEik2eGgau7DFV45HnxIppXO2SD/03AvYv990?=
 =?us-ascii?Q?ldJ9uU8oWFVpMih9ebQn9ebK/rfNuazLmSCG3KXm/X9OSap5J/MVPkRG62I1?=
 =?us-ascii?Q?ElhMEJ3P3Qj8gzuKvcVeBoTCHLm13KcDdUMqWHwtqQxPhYFDDKAyuaKn++U8?=
 =?us-ascii?Q?hwKiwAYVc69lzu0YTXNs1p9bueRIWDW/x89PwOLcigXS1vrYcriB9eQoul+r?=
 =?us-ascii?Q?HcfY8KZDtd3LbFFSyeONi/S/cs0k47Zng67wq97HWyKMsBHTCEbSxAfhmxm7?=
 =?us-ascii?Q?GtZy0l553j4uRqkFkSso12192OBQm+1yqw1hMqWrpkQzzXUeT6mX9Jut3FV3?=
 =?us-ascii?Q?eaGjFlcIAg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 31azaxBgL180ObOpKoV+SOwqc3IY3cZxsOsqE7T4z8KGBvYLeSrjxk5ij0r5vO+4lFWxbKmw5YZF71DxJvIq3oRJd6MhMDxLk08H7npow7jKip/PcdBd4RViQNZnVVnvl/Djl8SqZukQyKlhs+8v9OjyZg5ovXntLq1fL4vK/5cXcC8b5wzi47yDlXBb05tU0s4QZ3e3SHTakNf9EtF1gmi8PVy9dB5iKc30t2Gh0UukkdBOSEvVqGOq8eHt1eoyH7pvohSd8z+2D+Rq4re57PnjxwmE//EbbM1zDgnTi/WEFXjZ2hJfqzYizLoAPI7LgfYyt05vLT7G9sOhsGcFSw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69aa458f-bad9-41dc-1fc3-08df12a7d961
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 21:33:42.5158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tK8dbkr3qHa2Bb2B4CbdmSJNjrasiV6TzlNsourvrwmzdMod1wLWBheu3y4iVGsuF6MQBllEd7VcmFQDAPWHrVL9iHWu5SWgsQR3k5irbww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-OriginatorOrg: intel.com


>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, September 14, 2026 12:08 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v8 07/20] drm/xe/vsec: Correct locking order
>
>On Fri, Sep 11, 2026 at 01:11:55PM -0700, Michael J. Ruhl wrote:
>> Xe locking order is power state first, and then local locks.
>>
>> Reorder locking to correct usage.
>> Use explicit functions because of multiple locks.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vsec.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 71bc359b2ad1..dd7723ba6c1c 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -158,16 +158,19 @@ int xe_pmt_telem_read(struct device *dev, u32
>guid, u64 *data, loff_t user_offse
>>
>>  	telem_addr +=3D offset + user_offset;
>>
>> -	guard(mutex)(&xe->pmt.lock);
>
>please use the scope_guard like others have already suggested.

I missed the fact that you could add the {} to the scoped guard...

So you would like to see this:

>> -
>>  	/* indicate that we are not at an appropriate power level */
>>  	if (!xe_pm_runtime_get_if_active(xe))
>>  		return -ENODATA;
>>
>> +	mutex_lock(&xe->pmt.lock);
>> +
>>  	/* set SoC re-mapper index register based on GUID memory region */
>>  	xe->soc_remapper.set_telem_region(xe, mem_region);
>>
>>  	memcpy_fromio(data, telem_addr, count);
>> +
>> +	mutex_unlock(&xe->pmt.lock);

	scoped_guard(mutex)(&xe->pmt.lock) {

  		/* set SoC re-mapper index register based on GUID memory region */
  		xe->soc_remapper.set_telem_region(xe, mem_region);

	  	memcpy_fromio(data, telem_addr, count)
	}

?

Thanks,

M

>> +
>>  	xe_pm_runtime_put(xe);
>>
>>  	return count;
>> --
>> 2.43.0
>>
