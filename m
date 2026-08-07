Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897EE36C9EC
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 19:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131505; cv=fail; b=rRnrxiJh3KG7XUC8uarygZN0BHvGNbRK4HVcGlSI2DZmyqMuoyHCRTC0QP07yoqL7s/uGth/oKyw4MpAm3c9A13RSv1SfEO3dk1i9UpUjl4bEH4pcxZPu+e0N7nVrTXC2YJJvstj9a3gw1KwLzRtqyYe1NtQdfHlr7dkjsoSCyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131505; c=relaxed/simple;
	bh=Dgzflvvp+SvZqF5f7KGjeD0DfT/Ar50nyh1H0DFkc/0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FTQsc3hGCz3kqslkjodiyRvwBxJSt/9EA2SEdsvAxsyr4d1kqyaIduKuUESJRaZ8axWhauMwVPpSXgQfzrIseQxfoywpUi7NEUTll/YAPDcbuB0R35mwWZLbxGR06X+aDHOP/VRUx/02N4/Bp3v4lciHo+C1mO/ifXgJgpMARMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUjcKj6P; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUjcKj6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786131503; x=1817667503;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Dgzflvvp+SvZqF5f7KGjeD0DfT/Ar50nyh1H0DFkc/0=;
  b=EUjcKj6PUL9hmRtCBaWKJmupcTp/KJfgfkltHpzyx5Gfqy3AyuCEETXX
   NCSnfiI2285LfUeWswUDiY4nw3O5um4n2iJqt+LwUclEdWRs67olvVNOg
   f0LlLV/Nz9GQbBF0h4jM0Ywm3i4TV4irf9lASdNH2VwPGT6Q6HyNqqlrV
   b1b1Qj1yqr1PvjD7v4uOYjPNdU4CXT1jr8jl43n4u+oHBdRAdUHt6NtaQ
   KWFl9t1iWxnH7ccdf2k/yiglu+VpIL9vgMhoXHEvPeqPsUwFJgLiOYqQz
   8y7YbrHgDI7awGDeP1DKdGfYk9kPlErX0Kw10PBc/jQSVEBfN4As//d/u
   Q==;
X-CSE-ConnectionGUID: Tp9x45pdTKaAfvIjkTfcLA==
X-CSE-MsgGUID: gc5rvoQgQwStTW6tdLfPaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90563348"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90563348"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 12:38:22 -0700
X-CSE-ConnectionGUID: 3lx4rVLMQAa0mEqfhCaaQQ==
X-CSE-MsgGUID: gwqNttJVQq6C+dSidR2kYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="265960378"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 12:38:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 12:38:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 12:38:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 12:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFf4fHA4C1asooEhfLHPFcDEqglT3sj8ONpNpyMiqrybpGBURyAAq7Q0wOMrLO19yNB9yLtt/H0PvBaue3ym8sj47qIO+RJ1NgdQ/lPFhbS9go1K0jf7WhhLaYjh6nxF82twT/vuPr90loztKVKTnEvxakUapatmOpK1TFElMiIQ1ZRvlS4FERL9TP+d7AHvuA3IbH6UGUO4zmO0T2NKSpRs/D+O3wJjylhkPsyF7ZmKVRXkMY9Ms8+F77cfAjyCH6RocMgv8733eloNx/4X8FIG0iU65OnHfbjUWp9DBWyXkCEwuFBQjQXjF8eb7jbT905Uuvs1JSMIr1NKqAt6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPoIp5+JhXpcsz55c3PglA8vdem5EnNOh5VNryGT4Vg=;
 b=qIVRvdSPen2GA67TdESh0UgaKvLsvJwV12O1DNeZtjGpVbGgWIJx1ZtlQ3E/hFi5y1bkN6glWj7NearaMkZIyM0deL91UN3h7aAoNOg/osOty0P4aYI6oLfgCUzjIcm6ZGaGmZbgJNW5F2XFm9Jq6jNPXnd7gJjB4bco5WeYvR5OAx/vBZC59CUp+Ebh/WXTSS+bUwAPGojpHhNj//KxghOPk9Kc+gj3WJHXtLREAFDmxqjQrvtJLbIUeluP4LRH6mqdSxT/UIXMHh30+4SaxhUipDhsXE/ceuyLBTRbcVDshK32UAhEJfm8v/YcF84tBmMV78YBF8DNSHDIDNiqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 19:38:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 19:38:18 +0000
Date: Fri, 7 Aug 2026 12:38:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
Message-ID: <anY0KC6H0BTWh/Dp@gsse-cloud1.jf.intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
 <20260806135820.1422040-15-michael.j.ruhl@intel.com>
 <anUBkmSjMOA4wlFk@gsse-cloud1.jf.intel.com>
 <IA1PR11MB6418FD68599875714B8F2B88C1D12@IA1PR11MB6418.namprd11.prod.outlook.com>
 <anYwa4ToCUncHAdc@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <anYwa4ToCUncHAdc@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f6097d-e87d-4937-f397-08def4bb6e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|4143699003|22082099003|18002099003|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: TYW6v/Jgkvch+yNvd4iQtFbWBWVVZta52fYJUlvGXC8pYzhZfQKdZsCqB5eRDnZWr6AV3djuUME4KGutyaZES76Zr5l2a7BcbU9Jep3PtGdWG0+kBvkt/J2IHaRRy22cObVmKPNfSLv5Z9pV46seUMYcFCovlUGqsS53PvK+gILYENzncMhGVBWvj4bD5gt4vom5awvDUapBCLY/RHLfcv42wLullXLZTksbMXpZaQshqAdEqZYC5PjffECIu8b0wbgVK4bLgzOBoKjVm+hI9am6yjDtPqp+x2LkwzmCTBHmcZ1GLoh26w6R991CktLbQYjtXfr4JMy3KK9dj2a+R8rNsvYjZFNizVvpTUAUliYwu5mQTeRZAS7weTm38nwiFFv2En/a6LJpzrT8FeOubCvwQf4nQ1BNmwkeCUErCs2Mwsd8WTE4QVIG3LyZ4P1q6bVsI4t/urp81g1YISWP/PgUf9B9/6vyAzzvqRDuAf1mdu9xysh0Jk6j8IkwgxntWbfztZ/ADzXxxCy6ryy209WuN/ITdxvav29Y73IetV7K2iUWyFsHIuequ7HhucD417l3ETRUl8tD2JH1g8sbzgdYiBZi104VvC9wgLd6DUNJEfHfm+9QiKJELcd0R9P3P7WJajwaFqSq4RyOiRns4MJuhSsHXCHbF9AGsT7IgCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(4143699003)(22082099003)(18002099003)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CHwsSLYbb9w64xHFHMJNrFEZ/VWEaqXo7wT8EF4sTbrIncUuPuhR/EzVLm52?=
 =?us-ascii?Q?Q9GNoLtreYDHcRD3B9I1Yz9GGlcZ+bNLprcCp9iv6hyYkoRhG2517MoR2UXl?=
 =?us-ascii?Q?pYV5BKERpMSZTD62AKFSZ/4uIKj2AfmYrOoveE3esiihg7soQaIe1A+nKhhb?=
 =?us-ascii?Q?iHk2NVBLc0Gyy5chWUf21S5R9KJ9T1ty1AHdb8xWKxBj9hQUmVLkXQtuMUft?=
 =?us-ascii?Q?rogqoZVLRDyXma+A7pOB1SsQjesAZpNQmLjqrdkP8Bc1AP/FjimjThyhsM8k?=
 =?us-ascii?Q?gmPFDOIMisJGDdqgzvGbVi5Qsn9Y+TefQdnpApJRjppDFAJo0juGjF03kJ2N?=
 =?us-ascii?Q?aIq2vVg8FNZX9/or8RQ3R7wCavhAZfMWymJlapaqgYbwYhw8otXcSS0ZhOAJ?=
 =?us-ascii?Q?k8KkrwIQd3teiADzUecgZLQTGskqzLYNzMFKOGGYnF6zBYpQdNLlDTjeHlE2?=
 =?us-ascii?Q?B5N1PFvZsSlECU+5lC84KR6A5O0lHR5oVbvWbcVx1k0gfyD07fYSSTf4ddbk?=
 =?us-ascii?Q?OHs/+t0YtA7A/mmBrVQAdCQ0CmQ96ywmRT4+lu5gbAuhTdD7SadRAb1LFmuc?=
 =?us-ascii?Q?C6leFqoiweLe2VeUFSMeFYIh0B4JRWXo20qEhFDS0hXZ31wBsdpAVpA+LuHB?=
 =?us-ascii?Q?9A1hpes/2RgF9fMPbZHMrckCHQoa3ul4vdzrm++z/+EE8nZpBC1oBVsGoCH4?=
 =?us-ascii?Q?AUihF8w0S3WBk4zEdgcIvN1O8JDH5jSr/LLQak+NIxG3NfIYcVOGj38RxvtD?=
 =?us-ascii?Q?EVq5G7f36sMryO8n13ty7oa133EA6/K10pQuf0EUHUMxNsjwh4QiR0a4Hp5K?=
 =?us-ascii?Q?LBfkcpcZVUfyyUUYlLSYj61C4Zn0ZDAZbnW6sA6ay9CLjVvrr6xohoBOEEri?=
 =?us-ascii?Q?Jwz6QGMt9HeQD3HFtUfU7iha8Zfh7UQnHdFqCPQ9MfcS4/fqIz/n6tNEYKuQ?=
 =?us-ascii?Q?y/mz0jqkreUlRr+0T9hww6SMqm4qkaa6dNFCCahxhGGapJ8mOcGnE/83lo+Z?=
 =?us-ascii?Q?pqVv1i1s7cxXKHKW3AKTONSY52X+PxczPagOcwc4y39Dk+Dz2XX0pc/Lc+jJ?=
 =?us-ascii?Q?xbiV8Fzz/TVNU/fMZ0Uu/QmvG13j8FzYWEfJa2qsz5B+5vGgwM3p6NzkbIwr?=
 =?us-ascii?Q?2pr3nuUEwVVMWbN6DFtA0RE8zpcBy6zC2YTZ3IzN0obShrY44OkOi05QkxA+?=
 =?us-ascii?Q?hjmA7/smMWNE0J4zsGCofQfcVxc3DQ4UODSLDdFFSkojgtFq83lCvC1MOeR9?=
 =?us-ascii?Q?KAb9iEmZRgiqqkntr/WnhmmdLbUYjf69ebagPYrKT4+9pN/zTGmIM9s6B8gP?=
 =?us-ascii?Q?kr84ArtUkPgrAnhxa5T5ZqTVtVnayNnFP5XwWFo/qpdz83UOY0M9SRAqerIt?=
 =?us-ascii?Q?px7kqCJNgA1/9MAQuPaY2NoDXQuYSS57ei49DSeTkc+4vOi29tAfALSACXTD?=
 =?us-ascii?Q?EqnX/W/mInWbm6w3zaYH5JHZPct3ZctP5Cl4NiomZTTW74Y1MvxHsDYDvg6Z?=
 =?us-ascii?Q?g5DvlFiqxb7HP2Y81BX0eocsG1oWwGYaohkIMYmfaBct7m5UM1FJ7mLvXxpd?=
 =?us-ascii?Q?2BUsFqQzNgMipSkdbPLI2I+ICVRsrIQ+zQy+uYa+fAlSVBZgIr5ecQlzKFXG?=
 =?us-ascii?Q?0xke44ppxhKeBuICrh4Yxpg8NvK0jp5yu18onq4G/rBkm5Y7Xcnf1RGSl1fz?=
 =?us-ascii?Q?NLntK0iJ/L5PDp88Efniok9pzeb3RDXLyczutmSWFUG3d8AU+X7Xkxu5Mz9n?=
 =?us-ascii?Q?Lh4NLXumX2avrcLQrNXfE5MKtO98Y4Y=3D?=
X-Exchange-RoutingPolicyChecked: qQzMAz7UkHiIgmVfKYmLvYn1M0HhzkY5oPmE+h9dHkl4LaXzpWlOwoZufNmLOYU4nX4kGI9ocCRHniLL1RyvxP871LZ/3DnX0KmFaiuUmgTEOtqih6dt7bvbalZ+7qumsqa+VuVYNcFeratcmNV3oNmNsyygVch35YeFZE3GG+JMZdEAeJP0xihW95/IXklpVo2qNu29Lp/XhnaB9URwC+Jazmeevsk30gTaKtzj547BDdlJQulo3hC6QAb58EGB95tGRQ4yaCL9UFCN0opCZniJP4U5cDWOnW+T4qKO+gFrtl0T7lHGXs9HB4yI+WPUXhoa3SWrMFfL7IiAMx8ktg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f6097d-e87d-4937-f397-08def4bb6e85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:38:18.4850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0977CzkiFta2a3ALma+b49ldA+eBgGbwPcUIFoa76ecP60x4tC37RdUPWwJUsPHDJmNqfK3zXkVM/XCRLHqYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9205
X-OriginatorOrg: intel.com

On Fri, Aug 07, 2026 at 12:22:19PM -0700, Matthew Brost wrote:
> On Fri, Aug 07, 2026 at 08:00:40AM -0600, Ruhl, Michael J wrote:
> > >-----Original Message-----
> > >From: Brost, Matthew <matthew.brost@intel.com>
> > >Sent: Thursday, August 6, 2026 5:50 PM
> > >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> > >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
> > >hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Vivi, Rodrigo
> > ><rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com;
> > >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
> > >Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
> > ><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> > >Ausmus, James <james.ausmus@intel.com>
> > >Subject: Re: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
> > >
> > >On Thu, Aug 06, 2026 at 06:58:26AM -0700, Michael J. Ruhl wrote:
> > >> CRI PMT support requires callbacks to access the discovery status
> > >> and control areas.  Access is a common MMIO area that requires an
> > >> index to be set before access is allowed.
> > >>
> > >> Introduce the necessary callbacks to get the status and control
> > >> information for CRI PMT usage.
> > >>
> > >> Add the glue logic to register the CRI PMT functionality.
> > >>
> > >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > >> ---
> > >>  drivers/gpu/drm/xe/xe_vsec.c | 85
> > >++++++++++++++++++++++++++++++++++--
> > >>  1 file changed, 82 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> > >> index 3849f99c1c91..b84ec9088de7 100644
> > >> --- a/drivers/gpu/drm/xe/xe_vsec.c
> > >> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> > >> @@ -320,17 +320,90 @@ int xe_pmt_telem_read(struct device *dev, u32
> > >guid, u64 *data, loff_t user_offse
> > >>  	return count;
> > >>  }
> > >>
> > >> -static struct pmt_callbacks xe_pmt_cb = {
> > >> +/**
> > >> + * xe_pmt_read_reg() - read a crashlog register
> > >> + * @dev: the xe device that registered the callback
> > >> + * @guid: PMT guid of the crashlog instance
> > >> + * @reg: data read from the PMT data structure
> > >> + * @offset: which data to read from the PMT data structure
> > >> + *
> > >> + * Read the requested PMT register based on the pcie device and guid.  The
> > >> + * supported struct is the Crashlog Type1 Version2.
> > >> + *
> > >> + * Currently this is for CRI only.
> > >> + */
> > >> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32
> > >offset)
> > >> +{
> > >> +	struct xe_device *xe = kdev_to_xe_device(dev);
> > >> +	void __iomem *disc_addr = xe->mmio.regs;
> > >> +	u32 inst;
> > >> +
> > >> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> > >> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> > >> +		return -EINVAL;
> > >> +
> > >> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> > >> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET :
> > >CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> > >> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> > >> +
> > >> +	guard(mutex)(&xe->pmt.lock);
> > >> +
> > >> +	xe_pm_runtime_get(xe);
> > >
> > >We have guard(xe_pm_runtime)(xe), and this should also be the
> > >outermost construct (i.e., do not use xe_pm_runtime_get(), as it can
> > >wake the device, while other locks are held).
> > 
> > Hi Matt,
> > 
> > I am using the _get() routine because the device MUST be on for me to access the
> > registers.
> > 
> > Does the guard(xe_pm_runtime)(xe) turn the device on?
> > 
> 
> Yes, it would be same as:
> 
> xe_pm_runtime_get(xe);
> mutux_lock(&xe->pmt.lock);
> /* Do something *.
> mutux_unlock(&xe->pmt.lock);
> xe_pm_runtime_put(xe);
> 
> > 
> > >So this should either be:
> > >
> > >guard(xe_pm_runtime)(xe);
> > >guard(mutex)(&xe->pmt.lock);
> > 
> > Ok, this makes sense.
> > 
> > >Or, like the other in-tree usage with xe->pmt.lock in
> > >xe_pmt_telem_read(), which calls xe_pm_runtime_get_if_active() while
> > >holding the lock. This is fine because xe_pm_runtime_get_if_active()
> > >cannot wake the device. This is most likely the correct choice, given
> > >that this is a vfunc called by a different driver, and we have no way of
> > >knowing whether that driver is holding locks that could create
> > >problematic lock dependency chains if we wake the Xe device here.
> > 
> > For telemetry, the data read should NOT happen if the device is not active (so the get_if_active usage)
> > 
> > For Crashlog, I have to get the data and have to make sure the device is enabled....(see patch 3).
> > 
> 
> If Xe gets hotplugged nothing is going to save you here either, you to
> some extent you must deal errors at the caller, more below.
> 
> > Do you have some thoughts on the correct sequencing here?
> 
> I'd at least swap the order as suggested so that the Xe code isn't
> internally waking the device while holding locks, which goes against our
> PM rules.
> 
> I'd also consider adding internal hotplug protection, unless the caller
> already provides it. I don't really know what the PMT code is doing
> here, so it's possible that this path is already protected against
> hotplug events.
> 
> So:
> 
> bound = drm_dev_enter(&xe->drm, idx);
> if (!bound)

Sorry typo with polarity inverted: s/if (!bound)/if (bound) {

> 	xe_pm_runtime_get(xe);
> 	mutux_lock(&xe->pmt.lock);
> 
> 	/* Do something */
> 
> 	mutux_unlock(&xe->pmt.lock);
> 	xe_pm_runtime_put(xe);
> 
> 	drm_dev_exit(idx);	
> } else {
> 	/* Device is already unplugged, caller has to deal with this */
> 	return some_error;
> }
> 
> If hotplug protection is needed here, then xe_pmt_telem_read should have
> this too.
> 
> Matt
> 
> > 
> > Thanks,
> > 
> > M
> > 
> > >Matt
> > >
> > >> +
> > >> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> > >> +
> > >> +	memcpy_fromio(reg, disc_addr, sizeof(*reg));
> > >> +
> > >> +	xe_pm_runtime_put(xe);
> > >> +
> > >> +	return 0;
> > >> +}
> > >> +
> > >> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32
> > >offset)
> > >> +{
> > >> +	struct xe_device *xe = kdev_to_xe_device(dev);
> > >> +	void __iomem *disc_addr = xe->mmio.regs;
> > >> +	u32 inst;
> > >> +
> > >> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> > >> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> > >> +		return -EINVAL;
> > >> +
> > >> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> > >> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET :
> > >CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> > >> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> > >> +
> > >> +	guard(mutex)(&xe->pmt.lock);
> > >> +
> > >> +	xe_pm_runtime_get(xe);
> > >> +
> > >> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> > >> +
> > >> +	memcpy_toio(disc_addr, &reg, sizeof(reg));
> > >> +
> > >> +	xe_pm_runtime_put(xe);
> > >> +
> > >> +	return 0;
> > >> +}
> > >> +
> > >> +static struct pmt_callbacks xe_bmg_pmt_cb = {
> > >> +	.read_telem = xe_pmt_telem_read,
> > >> +};
> > >> +
> > >> +static struct pmt_callbacks xe_cri_pmt_cb = {
> > >>  	.read_telem = xe_pmt_telem_read,
> > >> +	.read_reg = xe_pmt_read_reg,
> > >> +	.write_reg = xe_pmt_write_reg,
> > >>  };
> > >>
> > >>  static const int vsec_platforms[] = {
> > >>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> > >> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
> > >>  };
> > >>
> > >>  static enum xe_vsec get_platform_info(struct xe_device *xe)
> > >>  {
> > >> -	if (xe->info.platform > XE_BATTLEMAGE)
> > >> +	if (xe->info.platform > XE_CRESCENTISLAND)
> > >>  		return XE_VSEC_UNKNOWN;
> > >>
> > >>  	return vsec_platforms[xe->info.platform];
> > >> @@ -357,8 +430,14 @@ void xe_vsec_init(struct xe_device *xe)
> > >>
> > >>  	switch (platform) {
> > >>  	case XE_VSEC_BMG:
> > >> -		info->priv_data = &xe_pmt_cb;
> > >> +		info->priv_data = &xe_bmg_pmt_cb;
> > >>  		break;
> > >> +
> > >> +	case XE_VSEC_CRI:
> > >> +		info->priv_data = &xe_cri_pmt_cb;
> > >> +		xe->soc_remapper.set_telem_region(xe,
> > >CRI_IDX_TELEM_DISCOVERY);
> > >> +		break;
> > >> +
> > >>  	default:
> > >>  		break;
> > >>  	}
> > >> --
> > >> 2.43.0
> > >>
