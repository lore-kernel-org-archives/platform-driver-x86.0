Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA3381B1A
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420558; cv=fail; b=HLoQEvcfYe1tCgdmGY3kRS/mJiEMn6p45glav3kDD8IM5nKCzgyLUpya/bZ4qVqkrPdur/FFXVthL+qArzWrtR2kDOYleYxTb+XTbyUTs5+wdHz6HECNW3l69plA9cLXMAp7j9kcYyvpglfgpFkmu5LYcPLZjXwXieBij8jdDF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420558; c=relaxed/simple;
	bh=aITQOmm8GW/PFFX48zWd/OeOCI05G5dsucapyDU+UHI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L43ld/9Ul4ItYa3SCCJmCu0FuhVhoAejl6yrV1QZK6HMHGOP9boY5O+WbzP6aisVQ66MHjRePE0E3POgjPwTiuexd6xOypapSFPzXqXGd6QznxSCvhO071/ocdOgYd1WAKYgcFFgAwmdqnUGYr2ygPz2VLVgDndx0wHnwRSyJIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkkzJuc0; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkkzJuc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789420557; x=1820956557;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aITQOmm8GW/PFFX48zWd/OeOCI05G5dsucapyDU+UHI=;
  b=DkkzJuc026cUkuZ5YNILGUCdmCB1hlYqty+cBjvoxA86QoP5fJQdRyy5
   DhJk3h2MUQAbemRKPgSW9Hv0fe487hcv+EXoxIHkg98cGsROfWzhsyul6
   vsH5MAycwqG/Dlv99zOspk3vQJJULgUS6auTDJSAcmHN0/Dt6FyCGH9m4
   b3Ul6fGHgk3uNgAyQM45Hs5wWmlrj7cyMXHq6KVS2xiZp+6E13koGfO50
   uBgQpT+cbWllTkf4Ozp8LvXo0166oSWKJ3kccjjTxIzA99NAE5f0mBvwP
   hopiXC4gZMgJn7B09JgntN2qEFm8o8HfM6jztwfyVcYZAkBl59LHIly9o
   w==;
X-CSE-ConnectionGUID: N+ERmb+9TqmD/W6MJkpvLw==
X-CSE-MsgGUID: LmYjhidAQCqmHFwWix06Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112547574"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112547574"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:15:57 -0700
X-CSE-ConnectionGUID: yDz+wB2GT8CSp5nzremrTA==
X-CSE-MsgGUID: k4qToDkTS8+UL8mg31YS5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="968908"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:15:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:15:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:15:55 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:15:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FO1RTmJu95HTXlfq7NVB3yDtcpa50xCt8bYqOKf9zorrfFp/J5gUiEs7+zsdopf+h/iczPnEsa+1Pun+Sh4+WFAGxHHZFhZamaf1boJOaCjMJNUaJawqR6a3WPIID7/slkIsOMW4VXSiWlYrLqCLLr8xsMcxFbj73ya5++GpE6ffxbb2p6rKSXc6qeYAa5buugKvOWYsVOePugWRRteZrgo6fmajHnmTp/Tax1AZIUTGDftavC0Q946rP7MgFc5yweiaalz3mWwz2/hS5vzE7K7jj0oEwWPJsT+b+ol23vdGfYsDcqEPjxEeJuOhlKkGstgnu/dcXyAJaaLT9PLC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IzdMFSZxX7Fju9Tu9ZAcC7pk4/jHRyoYnu5v25qrqk=;
 b=EqCYJ4VIGKbVvNGS+WoWGML8Z+ncSeekW3jHqrmOY37/MgBv+1VSdtw/Ij1fkMIRvexz3mWmZoAEdqvBAurOPv1H0LrUxlsdZveJ8FL9VVZbngx9OaQaf4GEgYneoNNkL9I5axLyi8Q/MYuFrtKS79W/56TR47n9rnTcgNv5SsjMUqMMo0uWCLhIoO2evi2nlYXtt1cJb6JPDD+I7U/ZEj4clgeX/5SWA4DqK6t/T4mDL6niQlLCK7eJX8lqKZiy54QETXO3HmWqRtUaw+33JNO4afgFE+HdgsQwu1RNd2Wrcu1mOhjcxo7wTsXjze5RpOF0PgRl5b1a9vwjPwnFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH0PR11MB9749.namprd11.prod.outlook.com (2603:10b6:510:397::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:15:46 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:15:46 +0000
Date: Mon, 14 Sep 2026 17:15:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
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
Subject: Re: [PATCH v8 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Message-ID: <aqhj_PUWtei9g-Pq@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-28-michael.j.ruhl@intel.com>
 <aqgbtrG5Lv2-ixjS@intel.com>
 <CH3PR11MB04614967EBAC64BAD0D71DF544C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH3PR11MB04614967EBAC64BAD0D71DF544C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH0PR11MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d563e3-72ec-42dc-bbcc-08df12a557ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: F9Jca9s1CLnuvWCVUwFegZKSksSOO5KRGLBa/9cpZ3lnrue2nLylPRb28rJc+olsZCiV9vQgXY7G+SSCaISslU36ZgcMPwGxJxSBnxCswWikxbr/Y0pkN9V07OpWnSJCBuYmfeYJnoW+c5xNjZ4Ls6TZM6lwu7ZVRqzwJfZiQZKk0wRz9xNoLBm25yYs7b2uzmDBueZWMQw/4ncPnMJmG7kCr+Am/Yd7TiCeV45aUPyxiS8o8CF7Juan30KQDPqjrHf9DECGztJYOH70qavTzMRR1Ha0ov9stOWg6fhw+Wa/K6WHV2q/g4pcwH7Veq8zfz1+PWzjJlXaHC1MLx5T3lzJaDxkeCRmMYEgFJhyGJo6jbRgatAHb3uPVSWuMSsff6Y4vjkJ06CMG2LS7yf077foVBvEJhKzSLrTN0gVfXTYodhl/YY9ohyqnicwntnstvhdnQPVNTKp+c9S6DAHjUi2IBiPBdQVMMUQxcvzZrTYgJWkSTlNHqfFjLI8vxa2PvaA6oDRlz32u+ma72ZJGlK73raqH9q1G+cBdWSmZdZokdXi8IcqlryZnEuQ67bFsDH2ZEcE8p5zWMj4v7HcSyYjzfHHunSXA625rGSkaSJbHrs9oB01kudpstVcKTmwx9xOLoJsC7e7+bKTgo4Nd7zyNEkr/gCamHMS1VCdeaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LuSpSXrzFyIEgn/lGUrHArhniAmmGSfwoz1bC2HvnqyGrJt86w/cdBhEzGUs?=
 =?us-ascii?Q?HA6RGevkKhPoy93QRMbQ1hvDbt8ZVwawVvN9nhb1PSlRv74k0X3/h1xq4z8m?=
 =?us-ascii?Q?i0NnB5ToeFUGCN69By2bLUfl/qQlz8AxDDQC4JJtjZLjpOrXmK9jDVNYHWYX?=
 =?us-ascii?Q?vmw4zs3UuJ9otBlqKzOU8bCRGq2JOP9A3nI+UNWJfZ9niYZ1GuztfvvXIlrU?=
 =?us-ascii?Q?SsiUbzE0+i8xK0kuXatRJw3Iy/22gMfFptg9yyHGy8FX/RqqhjbVstPtpJSs?=
 =?us-ascii?Q?+8JZ8bdxGUFoBkSHsnUl4Hzelp07eSUzR6YOV1ArpJ+bueVRHqaWE/lws0kY?=
 =?us-ascii?Q?2wz5ojVOaeoeK67txrQ35FzU/sZJMmPBc+ayxIPW6W473rmXFJVGMGnFtUPr?=
 =?us-ascii?Q?UJWofGq3YEnwhpswKHZSfeHcDCrBr7kpVMW6Pk2HMVlZcvXsPWtcbZwalV68?=
 =?us-ascii?Q?D8xstzv8QNjTrBe98PBX9HyrOAbSXlSkkyir1b78oMAfQTmRKtTg3tCOOZsh?=
 =?us-ascii?Q?lq2gmE2AczbeRv4lCHMNdPLJ/G95O3bqqMuk6ZbmmZVs7HWC9QoYqvI+FU1C?=
 =?us-ascii?Q?NZRWUckryFB3NFiSorjzhnVDYiuJ0MW7c3kznFxV2mGHO3MakOzRfsEB9h94?=
 =?us-ascii?Q?3geltKuWVwOvBqOUsuDAaJKeLnJepnA58y002W6coDorAvRCvBhJnzkoStg+?=
 =?us-ascii?Q?m4VUtnSn/0VQifJGfp+gr4/oiXwOAaBGx6CjE+0R1t/saneTq4EO65Xierm4?=
 =?us-ascii?Q?2gvon7GAD2jt0f1G6jBs/ZXX8zCn1ONd34qI5YwiGHQpCM4yUh5Ks75l+JXq?=
 =?us-ascii?Q?oz+p3a4XsAwHup1wN8p2RYFcNS4PbzyZzAjT0jKLWW81YzP5FwY4zi/A+pOp?=
 =?us-ascii?Q?iDOpE9XAU+iV1mVSgEQtXBOZY6v/lcjt9LnbY3gQP3HPcnS9XyHTBn2BEPvA?=
 =?us-ascii?Q?tHID5tHhB+Z0gguMUtc5VK3Xi5H/zjMV86zQEn5PyxQQ0zyAFRYbNSPP9M+Z?=
 =?us-ascii?Q?1ZUeRTrlqah4sbDrdcdqsWM/+bNBvpodnWHkg9x58lJNoG4T9u0C/ADyfyZn?=
 =?us-ascii?Q?edMN6jNO8UYFkYWzMU5QBzGpfs+zza1ofxU5LYqhPouSkTGIg3GzshaWrPTG?=
 =?us-ascii?Q?OeCHXp0iEKqiHXD2yNlZ6EUCWCHqdOhgERW4uaXQINOcbzzXrNrjSqFlgmLx?=
 =?us-ascii?Q?bL2HTNyumpTeOdS981AvTylpLr1ujYOiv8wPaDpHlndtCX48d2QRt4360Eco?=
 =?us-ascii?Q?2eBSKJ/BNBGmklVICkQeS78dXbw07Yg4Y2YgHZKbbyb9bFz7f5AsUriUGtLD?=
 =?us-ascii?Q?KNQNqgUXfztXRP7C+jgG8al1VMa15SWVYcx+UhWtghsrvVRywvxKPj1BIx32?=
 =?us-ascii?Q?rn7mwojp4pS6uJ2Qyg8zZ5ul7HNfvE6YvGMypqPBhhrIad9shNLXDf855CmO?=
 =?us-ascii?Q?glRHaycJK5UM9LKCzu4/U+FOnZ0uR4WeK0rBOFE/tqj1b1q2duSfzCQG/mxg?=
 =?us-ascii?Q?R2MZ7q11tOR28WtQFZ6W4nS056O0HsoeqvVrvQB4M6m8qnSIQjADttUmszqo?=
 =?us-ascii?Q?ceAgGKziG+1QxCMMSU3JFQHvpwuRvjIjpArb++xl+h0Py+EaryWUKCrFt50l?=
 =?us-ascii?Q?/+fOVGhqxnArhweeDZgPtctsLgWbiky6ToN9HyaH130HthJRMt0tBePggw5B?=
 =?us-ascii?Q?PgGslbrCcQQsv6wwLjNeLcsORtYqN+q5dY0BdbVz1k/XpkGNTxSVGqjvRrgM?=
 =?us-ascii?Q?rEj7b63HWQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: LdcSBF/5+z2lPAh2i8gk1GSCkVmtnmtti8MypMKjf5+Xp8mQU1rgdGBCPjuxVAmRu0VTE7xNYM5DCjlfDFsQerGLFdZeXWkiFqCznNjXsDWVHqg3QWGUsqUW+sl4d1E2PbgmXWgbfr3XsiqnP1GskYgk8Ia75vJ1RQhYNlmE5HwBQeLDCdp4DMmTxpthVDExoT/PJ9v6BePLwAHxq1NHEp3LEHJ6+UNm2MPD0wflMs3NYfqnMy0TdfdTBjGSbZuAhgfmiyPNbqEWKXXjv9ZKQ1Skt/6gS5XwhdFZQip1oaGYFq2N6CZZgi8bymKh78c7mte+XHXV7ETy9F3FTT4/4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d563e3-72ec-42dc-bbcc-08df12a557ba
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:15:46.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmKbNI4Z4Ao60PyEJW++fGQfb+zKVnnfZLgO1+hFxcdlnzcCVTXd2R3A782Qt/wzOT9w84k0sbWVEEADb1RAEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9749
X-OriginatorOrg: intel.com

On Mon, Sep 14, 2026 at 05:04:31PM -0400, Ruhl, Michael J wrote:
> 
> 
> >-----Original Message-----
> >From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Sent: Monday, September 14, 2026 12:07 PM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
> >hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
> ><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
> >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
> >Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
> ><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> >Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
> ><karthik.poosa@intel.com>
> >Subject: Re: [PATCH v8 06/20] drm/xe/vsec: Do not register BMG PMT for VF
> >
> >On Fri, Sep 11, 2026 at 01:11:54PM -0700, Michael J. Ruhl wrote:
> >> BMG PMT is not supported for VF nodes.
> >>
> >> If IS_SRIOV_VF() is true, do NOT register with PMT.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
> >>  1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> >> index a9baf0bfe572..71bc359b2ad1 100644
> >> --- a/drivers/gpu/drm/xe/xe_vsec.c
> >> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> >> @@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
> >u64 *data, loff_t user_offse
> >>  	u32 offset;
> >>  	int ret;
> >>
> >> +	if (IS_SRIOV_VF(xe))
> >> +		return -EINVAL;
> >> +
> >
> >I believe this second one here is redundant.
> >We will never register the callback and never reach this place.
> 
> This is called by xe_debugfs.c xe_pcode.c and xe_hwmon.c.
> 
> They do "protect" against SRIOV usage, but I am paranoid...
> 
> I can remove if you think those paths checks are sufficient...

I think it could be removed as it is impossible to get here.

But feel free to use either way:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> M
> 
> 
> >>  	ret = xe_guid_decode(guid, &mem_region, &offset);
> >>  	if (ret)
> >>  		return ret;
> >> @@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
> >u64 *data, loff_t user_offse
> >>
> >>  	guard(mutex)(&xe->pmt.lock);
> >>
> >> -	if (!xe->soc_remapper.set_telem_region)
> >> -		return -ENODEV;
> >> -
> >>  	/* indicate that we are not at an appropriate power level */
> >>  	if (!xe_pm_runtime_get_if_active(xe))
> >>  		return -ENODATA;
> >> @@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
> >>
> >>  	switch (platform) {
> >>  	case XE_VSEC_BMG:
> >> +		if (IS_SRIOV_VF(xe))
> >> +			return;
> >>  		info->priv_data = &xe_pmt_cb;
> >>  		break;
> >>  	default:
> >> --
> >> 2.43.0
> >>
