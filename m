Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0884E66A3
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564269; cv=fail; b=LyWKh7YUEQrnm16pi9PwDSja7nHqEWMfh+GJzQ5LAMAJwsAKUEKSoI30hD/l4PXVEmwZJsYN/5XwoFc5rjro7PLxXCvOp9AZH3FTBDCqiKCJlOrLgWCjBmI/jD4GxMDgAl36CYJ+EPRUZHZ/8JBKZ7yv4MnwRywB1UPlE11ekwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564269; c=relaxed/simple;
	bh=pbiwjKfLx++L1Flvtf6SSX+FZoSvokslpE7IJ9gwJFw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YCqnuLvWA5NuEXafR7znTYmrGyYfTJ3yITt8gqEvOzgzPmLNpCrqPQwnhACsoYgdxOkfFiWK34kHyYVlWzdfasPp6Sf2/ph304Zh9sgdoBnE3ArRA8N2TCOxQipo/QLvC1TQbWlkry8og/7y+SH2KjOWR1Yjn9yI04iAWvmeDqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHnZhqxy; arc=fail smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHnZhqxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789564268; x=1821100268;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=pbiwjKfLx++L1Flvtf6SSX+FZoSvokslpE7IJ9gwJFw=;
  b=dHnZhqxytXJldbPD+Saem7SkPNr4O6wRSu8EXokifr36KsU2M7NW0f/D
   Xw1/4ZaL/qG/foZ9nQkSXTW2JqhGrymcuWPlgYPNk1CYxQOUsGym5x7gz
   akGlUd9xSeQSs0l3SwKDrArMGMT5sc5oaWFn1L4973dJGtN1zCIyLSouD
   SGPl8Y7FhuJ/jgnHXjHGpbL8hnV95Rr9cebwLPT4M0GclEA0KXowOM6v1
   uVqXfFrWKdqnCcPiYtVtJZKBHHmBIUT0UXKN7iIhbA6NuOoc7EAgKK86y
   EibmmJm4JWPEhUqKJgeORiW2F3hrDCeIeJss5jJ9vTUhX7yrYwEQMjUT6
   w==;
X-CSE-ConnectionGUID: r69dnFn2Q5uoZ6pIKChj7Q==
X-CSE-MsgGUID: P2Cu3UAXQPGXSWMNYrNduA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="443533"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="443533"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:11:07 -0700
X-CSE-ConnectionGUID: sW+pCKjtQgK3Aq34gCcRFQ==
X-CSE-MsgGUID: o962gMdFTX2oRhuC35qfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267127649"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:11:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:11:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:11:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:11:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHIic7/xBZ0aIs6LRqkSvNq1CwAalSSKHVOcUJ1ri9RSmGEADt8NbaMFiA/ATwg2SUFFVtybMbXwiQ/wnnP5Nmhbr5tSMHUvZszLXYhKIqVorhaxwyIOU6WVmysDwpTXYUwVpjCV4/8/qkRw80aBbJph88ULPYbsCTN+lU+1Zw1TosM5hGSN+Jg0Y5+dPI3JLk6QYytsENIHXXF8cRXpe2QYQDSJ9jGSuBI36NStl/SyDNI3kVq+HvmeOqFo5om9QhEB+9sDASOQRZpXahD8TcV74IN+bjyfui7jXqZQXVA1PYQTO0xbyFjM2Z2vltr69c1mxV4vUQTb1WvnRSxsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JjtoywDGcNBoh2aFBTjK4FCS/YoYrgkSAcJps1/7wA=;
 b=KPSRIAbwvBk3FxuE7z2zUPnAtMZ3oVCb4iYHRrTKYvZQtZYtXeHtFE4VgMSR3KqnItzJ3bEvaiOMZCNHqAgmwBfxcaTOzfPFVC48T1CNn0QmiZ0V12ev6km0yb5L7VB/XVldgt3FJqPdUSW5Kiypubldi7IJVQW2AjJcjEUFX9WVntjgR9ONl6QOYgFO3mE0AAzoaC44g+Whc5AqB0zsePXWEfTFn3XOCvetKw9SylM4vg6lY+qILwGQVXNKJ1LcXKKKMR7u/zNOBRhDoV6aNmLcK00qccxjQQ7EqS0gyjXtI+zdKAcAD7fXnUX9AObfbYHwWNJD1uo0P0RqhzU5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH8PR11MB9482.namprd11.prod.outlook.com (2603:10b6:610:2bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:10:57 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:10:57 +0000
Date: Wed, 16 Sep 2026 09:10:51 -0400
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
Subject: Re: [PATCH v8 07/20] drm/xe/vsec: Correct locking order
Message-ID: <aqqVWxwqHumiDAiz@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-29-michael.j.ruhl@intel.com>
 <aqgb3tuSZIayYv6u@intel.com>
 <CH3PR11MB0461493AEDDEBCD09BBF15B2D7C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH3PR11MB0461493AEDDEBCD09BBF15B2D7C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH8PR11MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c119c9e-ec8b-4eda-836a-08df13f3f200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|5023799004|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: t4pvEXWNpLGrowXGaL2g6iTOKfCiBDBfsDIUArtTEhhrH9rqf2pxEZMA56tN+YVF8PUTdLzCLhRFqsW4E1Rz8XQIpA0U4WqTuPrtaWSglL/UW/gq/f60howRjlJeKf1GmxK/UrFLFEsfCowNOBnQCEwXIBl9qCJZatw6T/KztuJJFPvm7njc6c4yxKP15pzoirpkD7i1xN5L06zp4MC1UIgKkWdS9w6dweNC92Wvsu1uxWHmTXeB1uapavA8EwHBaS4U5ZGm5QH6U7FNSz9bDEdr3/bffKYoHxIQg7KMU9ZYGUnV777f0KPyJ0ccP0HuhG/Z8F0zAnPZNrtjs3ZJJAGF+i3LF9WMm648J5GH/Dr1/GD/8gqxJ4zHnxGgspuDJYXot4vTRfP12s3kPw52ORwaUak2kMHpg0RENSBcWuncj/Lg/s65T6Mw6LqEP1VOJIEhHksBjpR/ov08HrfQEe44NMu65052lATR3lnApnLEaS+GKTecM3zglvxF8VGU3zwFTVh4l71hF5fJ58djtX5FLk0jRn3WY1R+fOzs6cXU9dkAK106NZVHTJNYxw8f2yqPmMYBZugJwRxuD5DyJ0/Z6YyRrycNENuWTOCncubqJ1BLLmQmpDxTiP/TG/jGaCl/0VzwiG2DNcVlqawJk7M4VPZt1QcG/1NXUtf+oPA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6M2Zx2EVBuGc5gXTUznuFrJP+cPNdO6cpP/DLVYtQKDnKfL2xyamYozkcGjy?=
 =?us-ascii?Q?O1a0OCGTmFRW9vN+5j2ABwG26LSjhZEyor+n/hQKKb9AR79wXmn5lWCNe2ig?=
 =?us-ascii?Q?4KeBjlyFH3MLPq8/gS1qB0YLAxVSvVbgqLxfDHKj6usPpp/SlcD2lsAQ1HYs?=
 =?us-ascii?Q?jQW63rjxk+lg5GhGmFODzArIiNFrueLJbVgqxCPaoDD6MRcPp1ZkpijfKJ09?=
 =?us-ascii?Q?Sd9JRTY+fi2jcErvaTE005cOfv0ak0YPUx/ZV51OVMkIcXIBUeocE0RVduJi?=
 =?us-ascii?Q?qmSk5uGkh6OWLY7IOq/+DKuY95Cpn6PNaRj2VKJhP/Q515RwrIfAGRXmOiWs?=
 =?us-ascii?Q?UwOgiKIhHpnRRJPVqQdXscVCyKquE+sgWZX8DxY9iiVCOyCszXdpLxPkPCPr?=
 =?us-ascii?Q?ESI+JwpaGle5sn43kOK6IiAwY+bA+3JJpP2ZerWIUietEvTDNH8hUB9Ohaaz?=
 =?us-ascii?Q?TJJPnU56/jIEIFaTLmZ0UkUiGd5JA5GAfPXEhivywqsUxOjim0PL1JQA5DTv?=
 =?us-ascii?Q?6a+eIcFynSWVyaIGwIYL4ZxZpc7iY5Cuda7tjp7eWiNy0jSC2FGqYvnfItAF?=
 =?us-ascii?Q?E9TAy/OTbgsjFO8BL6BCiTiMMVrLFQsa/zsQSa8QR/n/TxTFVMj3x86j+IgS?=
 =?us-ascii?Q?xXuWRJqBS81/qYbiNpXx/A5hFsQOJRjwzq3V/Ue2/a7FszpfAGy9c/fj51Ut?=
 =?us-ascii?Q?xiyLasTHIq6gdapbJadxcZsEcZ5ms0JvjDc/1Y48I+ybAi4o5hdkv2Op/3Vz?=
 =?us-ascii?Q?8hSy8Ede/vWFjxZt2itLTo7YX1C90V7AQjp2IiFyD1Gsx6FoKT9R+G2fkhn7?=
 =?us-ascii?Q?/aVpM0q7ssJAYlv/Ytvz6m0BVyHG2jW+WssgSdgWp2WoQPFYIwtfwXFdrw03?=
 =?us-ascii?Q?yeZIkLa6VM4pGR8SdA44dPMrM3S7afY0yCz8d3dOrigxqL0tj+BA2qOmueR+?=
 =?us-ascii?Q?gBAizCb/wwCVGwUP8BfUTwVQIIzuHXHlvA2w6mGmkN5n3T8+yZzMD8YQI1hb?=
 =?us-ascii?Q?Uuj/6szcaL5YpieFsz4mTA/DRuqe9CzjJAF/bbFv0nqqHRKzfFvLNk69zv3z?=
 =?us-ascii?Q?72hG+JkvAqLGS80K4u2OJmgp1l/6VZTNnTyIoMyQ4oHz7v/XYytinuJ+AJqT?=
 =?us-ascii?Q?2XaOBoRiV8eL3X7ynxtY7p+KrOYmCirC3HP+tNbWBoaqod3Ca+CoFKOt6119?=
 =?us-ascii?Q?iEb3shg5cutQiGvuY5DolUR8h4860aUQZ5LPDt3HEwVA0/XKtWn2lVU+vIcK?=
 =?us-ascii?Q?4cPSgE1vxsZ/fdfD71hfVp735qsU0IPJMcPy9iomO9kqt/Z/pTzj8VuThlM9?=
 =?us-ascii?Q?KWiGaJ67PHyr+DGk3nuJ+0CSVZ5wHHIMlik0wWCi3rk5MEi2WyOMFm4q0d5o?=
 =?us-ascii?Q?dI9Z9oOLOpUURGXjF0LgXJfvorG36z+aAuwwMcaGpEEHbpC5paQaAW6fojy5?=
 =?us-ascii?Q?idSl+UzRPT33+1kSJ1dDBBVS56akxiZ/2sWf0uKR2BUTC+WhpRos+5hK0dbl?=
 =?us-ascii?Q?vGWpwjrpGWmPHbdTN3fVCZc698RtyH9FhccUKKBYcwLGL+wluqC3NP/eF0Jo?=
 =?us-ascii?Q?lHdXjNLDYVSNmZrlWSRJuavx3vj+jRzdVJgzczPf73iNZJLd5qE4x4opcEgN?=
 =?us-ascii?Q?4A8xz87Sa7ZVkK5ARiKSJHH79Kw8k/m1WdK3kt2eplnyMKhOFUsRY4BOKKFO?=
 =?us-ascii?Q?VaNtH8pRNZ5EiEzrLAEa/COeddORdJJp4runOK0RDCWCd3VVQtyJCpJ9W3bc?=
 =?us-ascii?Q?Dcb8AMzD0Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: cAUVO11+AfKTbdkjirMlTLdfS73pzU2mssuIzMIkhjolhSuTWMq7fEnlu/s7/Lr9ySuM0FQe46V4YvI0MpgypIKgAGt2hF+72Eg/QEoDQogtPi9UjloI6lhlZsWd3zQHyHYU+oktLEVC84b5buWplgFfR7vUdO4eaeLa/IlzjsF2uRkrAhB3KGKDmU0iL74bmEeVc3weQE6Cp0UcexSYDm0+Sz5lBGWPCDhTlF4bAvLnVNqHwfdVWtWDhWh4qy96d9dki8X+41mW0C6cJloYXoXoXUF1uwucIDL4VL5yDTMM9VAgJGF1Ri7h4tMkkwXfKSi9qM+bKaVdhWZUR5rYKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c119c9e-ec8b-4eda-836a-08df13f3f200
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:10:57.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeCQP7SbZshkQlaLuxH8KehnoGPasriUe5AhGFdoCIG8QjJQzKoIBPuxhbUrI+uqeqBYGJuixvH36moxp2MS2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9482
X-OriginatorOrg: intel.com

On Mon, Sep 14, 2026 at 09:33:42PM +0000, Ruhl, Michael J wrote:
> 
> >-----Original Message-----
> >From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Sent: Monday, September 14, 2026 12:08 PM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
> >hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
> ><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
> >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
> >Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
> ><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> >Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
> ><karthik.poosa@intel.com>
> >Subject: Re: [PATCH v8 07/20] drm/xe/vsec: Correct locking order
> >
> >On Fri, Sep 11, 2026 at 01:11:55PM -0700, Michael J. Ruhl wrote:
> >> Xe locking order is power state first, and then local locks.
> >>
> >> Reorder locking to correct usage.
> >> Use explicit functions because of multiple locks.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_vsec.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> >> index 71bc359b2ad1..dd7723ba6c1c 100644
> >> --- a/drivers/gpu/drm/xe/xe_vsec.c
> >> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> >> @@ -158,16 +158,19 @@ int xe_pmt_telem_read(struct device *dev, u32
> >guid, u64 *data, loff_t user_offse
> >>
> >>  	telem_addr += offset + user_offset;
> >>
> >> -	guard(mutex)(&xe->pmt.lock);
> >
> >please use the scope_guard like others have already suggested.
> 
> I missed the fact that you could add the {} to the scoped guard...
> 
> So you would like to see this:
> 
> >> -
> >>  	/* indicate that we are not at an appropriate power level */
> >>  	if (!xe_pm_runtime_get_if_active(xe))
> >>  		return -ENODATA;
> >>
> >> +	mutex_lock(&xe->pmt.lock);
> >> +
> >>  	/* set SoC re-mapper index register based on GUID memory region */
> >>  	xe->soc_remapper.set_telem_region(xe, mem_region);
> >>
> >>  	memcpy_fromio(data, telem_addr, count);
> >> +
> >> +	mutex_unlock(&xe->pmt.lock);
> 
> 	scoped_guard(mutex)(&xe->pmt.lock) {
> 
>   		/* set SoC re-mapper index register based on GUID memory region */
>   		xe->soc_remapper.set_telem_region(xe, mem_region);
> 
> 	  	memcpy_fromio(data, telem_addr, count)
> 	}
> 
> ?

yes

> 
> Thanks,
> 
> M
> 
> >> +
> >>  	xe_pm_runtime_put(xe);
> >>
> >>  	return count;
> >> --
> >> 2.43.0
> >>
