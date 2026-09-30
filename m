Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D8A4D5963
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773505; cv=fail; b=B3+e/ahMMBABsHxl+rfbpmB7R22OEsGgrfuYZmJTtR2hl17lzqC+ue6OZqSS4DVUUNF/qypACNgo1Wo8tePcuz/nntd+NlSUEf6/iavi7EOT3kCRcQ711oHamsP5HNc6Rjhovd7StgHvCGl3cp6pzUX4NK4N16zaL/zOZ0XZd4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773505; c=relaxed/simple;
	bh=k4AHXjaVZp8IxRSDryuoRNtMzvhKWoLaQsW6asG4sGA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=slZjaeWdJ7vL+we+Z9cQHGf4c/OUr/pvUb6B9vCziTRy2xx27FJ5uOmIFNaPHmr/wM0pmq3GLDrAbBS4Up3ihi4ulMb5wE7zh50Scph0+Y0PEUeyO6NTAEr7HqbjTH/9xunzDVVHkqktk+02jRJLx5sZIHVkYv3o1NWoeCILYzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQQ0wp0t; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQQ0wp0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790773499; x=1822309499;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=k4AHXjaVZp8IxRSDryuoRNtMzvhKWoLaQsW6asG4sGA=;
  b=eQQ0wp0t++pcLe3hA1eFfk6id1HnkJOkhvrSjmY6bov+wiKWzCT0PL6I
   bPl/AyF1p05fMFkgwWwyUc9Xccyy2XZComgs3UNPCwuArBvZHGWFgTQfQ
   dPLS8QkQeArO2VHQa6Rd87ocUvEqPzZKB8frq/G1AjiHqaHLf3xVjFxVg
   Ce2TM6dAhtjJHk1qtoba5i2y4M35m6FZWNo8SyLQh33VHaP68I9tiI9p1
   66mGU+esV4EnSnDNGQqi5IJqXozcQjlvre7RtVAtd2CTCk/OT9kRg3F+9
   sho/lq2jkv85DTL3Wad1HkIUulF6dLsQd4kvlCI5DWEwN0eiOp3qHxPWp
   g==;
X-CSE-ConnectionGUID: 4ZlHJi2FTOuQXIrmsiY1rw==
X-CSE-MsgGUID: VOhyse9cQJ2eQxuGXmeEdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113296015"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="113296015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:04:54 -0700
X-CSE-ConnectionGUID: GrIt2wt9TC+YL3cXYu8d6w==
X-CSE-MsgGUID: 2nOSEopQTfaEsdprsz7QfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279481599"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:04:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 06:04:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 06:04:53 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 06:04:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwnJuLtnWn2VgtahS7O1hILFfSpNuA4XdHYtxUBPwAzsBgfeovvkwUWuuTPP2nYn9Lfwhk+c3/GQYkAIpbAi6NR7X8U3LwahqFTCV1XQib8yg/9K7qK91pI+0JRjocombQobbCo941EsSVOMizvaEd6KtYmysDpG7lwR/U1XXZ+sLs746uOaXUzGFj+LuX9FoLKTScLTvQubtJgJaFJAlkO2SZXbiesLWL2hndwfaa5w8WHCJu3GcKsXBJ2RipB+p+H33D899N0rqY584yA4cn0SpBSYGVjyMNfl+x6vOvcfVSj1A/8EAamBaG5+LMk+ICvu916h1awZNProtp5z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc7iIezNbVEhTbxoboctex5IuiXXvdSV4jEdWHpO6yQ=;
 b=Npz8LqEhd/g19IbWLUazg5LioUE07MUWlpOmSm7w5G6pkpFZcZ7OXFrYSHgAZdqD2gvmSdBLIlWagt9sUsL7LB5klgUgeXddqmKT7K7OfFUmQxBbuG2ldMh1j9DMuW6sWJVwxU5SgwrrScEgUeTXo2wwFsN2IsnpMDO4GJD3hHXjCu2ptRu8XviLFPh5gKACg8uq9jjzMd2EyUZuKVJa/m8R8AuhsB7Ec2az/C+vDF+4vl3Kb5wHsT1WdjEocmFIfsQY9+mjtv68Q3t2hCzxTjkPLqvFUQocxFyyoK1T4xA15ohPlg/Xs18Ce+syyFwCpLp9eCswVn8I3zIGDlQPWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by DM4PR11MB6018.namprd11.prod.outlook.com (2603:10b6:8:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 13:04:49 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 13:04:48 +0000
Date: Wed, 30 Sep 2026 09:04:28 -0400
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
Subject: Re: [PATCH v11 17/20] drm/xe/vsec: Support late bind fw information
Message-ID: <ar0I3Nu-a7ZeMMZX@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <20260923181115.2514193-39-michael.j.ruhl@intel.com>
 <aryLbyn1nW5CysJC@intel.com>
 <CH3PR11MB0461495FC2ECED12A6574C8102C18B2@CH3PR11MB046149.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH3PR11MB0461495FC2ECED12A6574C8102C18B2@CH3PR11MB046149.namprd11.prod.outlook.com>
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|DM4PR11MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2f0995-d441-4703-b84e-08df1ef36729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BQXzNJ6iOUp7sqSdx+DBOOjUGmgMVcI7Dy2+5QJKqvzgxcjtgggnAvNoprkaTAoHODQrLIqJHqT8jABg1I4MLpcwiDPtAq9jZrOjUZNi7w0a4J/nLHTSmMR96nwKtMqr5UlnEYYtxEU6ilW2XhoJwYp1XK9EHX6mATHyOqTNN5hwTL9K1iMPSBTo6SY+zh5CkJqMN64MdSQOaEDoeVOhJ7cWAGNa8cwYsEWixXp2ZaV5mu43zzBtAH3CPaMukAj1vjtpOWjCDsit0gH8iz+ODues9J9xGWrbsE/UYqKhTNphjZNMKfRkoTNDnSCCW/BdUNe1hE2q4tyDLw8FiAoIYxzpdB5KHWXR4kj7xC8P3Oa5udF9eMDX8MqtmiQgAUHbPClT2XbsJrneVddkYlTr8MYhOggHGifQLrS2ATOs5mIICBwPPBRxGuhWtxbFpHuga+Qb8aaDbe8q5rlhn+QXJ/Rz6HPjRiB5Bvv/Pv4R6CQUjovMSYPWCjjXP3cwqDMJYYZ4aA7XkgiJvwGfEy4aqfXSDkQXqGaQmH/7MyItb2THsXxpPeer1REHtEDcAXxK2T+Mx8ScHg6OFUL1AFIyJyq1ILzrYw5Zsn78mTtrgwuXmM1O304NQkL0bLjAbjij29Mz3SluZBmOOV5kuvJ7zxR3v5oiWSwCE+3sxYBH8IE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7192.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Hqmb3hcWGOZXXGBubWYlsn4mVEtJT+/JmotO56W5CpmTvIsKjELj0RlwsIB?=
 =?us-ascii?Q?mR10SgEZ3Zr1K2BoUWiU58+69QgbQc4Azql0YNAI7cUq9IDICjj2I1jlFuW/?=
 =?us-ascii?Q?Oopmb2mfZ/nTL3O+eXdvPamGVmxW4mUjw/Ti4DM/Aja7x3TZ8jIey9ilPeZs?=
 =?us-ascii?Q?YXLNfgcHDqSCApW09wssbMWVfWh2rR3cFnOx4rCK+7c0grAxa8BGzwqMWGgU?=
 =?us-ascii?Q?ND6ZtJ24n11VtezZNLYyEHkadYkfmh7ET/j/EHYb13zbz0MakoSfBcGesACY?=
 =?us-ascii?Q?rxpORx7a6VopBpt0UrhreMkfTGlsS868VwtwCmAmjOpmweN6+UINZcwgT0rS?=
 =?us-ascii?Q?oozKsCuzzzo/SUFsQ68CjIUgW3zVAunl7fx8BAkga45EVB5vlVQ9uSbIPlIV?=
 =?us-ascii?Q?b1EGEq/myED97pYNF/lOxoP+ETstpSmzdMWvNJDWQSIVkSnzarVZ02CWiYXV?=
 =?us-ascii?Q?m/+BWy2SrkXHM/1rjwYpKI7sLby6OdT2BX9JDH8HC6EnhucQ6yOszMjrPctR?=
 =?us-ascii?Q?y4bMe5pEfNDJUhpxoNnnuo0AVSeujXHOJ7mHKcrTGVX9YSfR53DiMyzZOt4v?=
 =?us-ascii?Q?FUF5Ae1j44+qIjKq2lJH041gM40CY8ZAcoefTvlx0NVGSmQxoRfR4oCa7RCL?=
 =?us-ascii?Q?OlmV5Vz3wDMMzlSqgOIhwM5WeltU4xDQ3FKriycYeToegvcg0Hk3cXpPZcet?=
 =?us-ascii?Q?JomkqwJt2nBxox3BWiDkSy+h/uIepo1MFloVJ0Bofc13IXDP24w7cAjgdakj?=
 =?us-ascii?Q?ksX0BVn5RP5G9ctlWLVSBvYOE5sPQb6k2lWrbmmqWJCAtt7fWNfqE/itsOZK?=
 =?us-ascii?Q?ov+WuHb1UPZfocMi2NjNxUYGUrnL3VUgC9DkZuhOQAWozOl5wMPfM1q+deJY?=
 =?us-ascii?Q?SHFKGjLGhw/JnKcIisrOTh+QiYlrAmD6SVQ7XmP9gxFuThlYIReTrh8lt89D?=
 =?us-ascii?Q?nTASO71khWcIZpKYXjpWhSMYTjObBiepswfKprb97iwfIHksMRr9VUwMffkB?=
 =?us-ascii?Q?KdSbfPwBndyrm9vIPk3Izf9JsNa4LOHOo/EKh0OXIuU3X/8+JtcTjC5a4G3D?=
 =?us-ascii?Q?9TlLfSTmFezuzVq+TpYBtgEWw4gFPvol/4lOkp7+eiBG+3xVfW08wnKHU14n?=
 =?us-ascii?Q?cxkRiD1niX63t27DvGx0SuooXx4E4A4lc/d/yvglqZ/8u1cg1A85d3rZJ39r?=
 =?us-ascii?Q?81l1sqyS59YnXxFONRbAD1Ojhj267teDJ4KvrhlHxft865Dk0zH/ffYQk6Lk?=
 =?us-ascii?Q?KKzvYqg1k7de5bbfRDwUzS+JL/l8JkhnURJwHgKs9IO/8kWo4FPVD4hy7bBk?=
 =?us-ascii?Q?yrTst2/MvlzhUQXw4Egh5mttxcONceFNYtDj9CO72ynGOpofopo/J89M6rgr?=
 =?us-ascii?Q?K/PqfZcbMXqGwIRCg6+stgCDVyzBtaN/5k1zRLAClGYL8En/VGNhRm8ZUE/g?=
 =?us-ascii?Q?sTFbIHeMWxjLI2e885m7FkQeQE4nHjzrZ+yk/Rhz7abQqKOMku4X/OqibT1B?=
 =?us-ascii?Q?UmLOy0tCG0v93DdNGgnA78vH0qoB3bAEbX9ev7dMRNyRpqqv1Un65MFkvdBH?=
 =?us-ascii?Q?iYuvK6t7PPW6Ygy6w0/DfKyN+shF9+WzsefREEfxgYQO/Gv8Dnj+bslHtabB?=
 =?us-ascii?Q?yd+FzrowRPjrf75MbIWBKWzfOsu53Jg1YJzbxIRsZIFwTwOJ0LIJtMw8zd72?=
 =?us-ascii?Q?x9LXkrfWctQKkkMtpuiEKMz19zG+NIr98rSiIF0c7RTvpqKmkN916mdiGEBX?=
 =?us-ascii?Q?yPwqgSVTvnM9xemRCSps/ayhFB07gO8=3D?=
X-Exchange-RoutingPolicyChecked: BP4iCaziGXWTdJyoRKNrepPrXf8gsH5s4iPR3zbB5XAz6ITXAWDOsULV1WsIFZEt6MTIq840v3gTsg+ZD9dK7ifVONjtVmCDKTVEdL5GL0inV30YKcDjrnpYnb4eLcsjspx0SU+QOUZtIE28rZgAD5MtLjowiD3azNApHebSsDyThIq7BVGXd99wZSRF3R5FdIKVRYAp/Ss7Rg0tKuh9KNj6+L+nEL4A3VQ0N/I5+1q2UFMk97AgnEECulMAWVSLHdBxgiNad9jD3HGI0K3S9yGY0GKTlM6Swz6zPwti1Vd4vq2dvr6cHZ7diMPXRnM5qUQmXqMqvB6XzCsTi4iDLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2f0995-d441-4703-b84e-08df1ef36729
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:04:48.6957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkveFwffS0WYbUm1yEdJw3QBOhtIHUY81RsLrZjQrkGt3LOZYFs+i7GWOQc/RFu2W3QgO8coD00ARBHcJWDW5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6018
X-OriginatorOrg: intel.com

On Wed, Sep 30, 2026 at 08:57:34AM -0400, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Sent: Wednesday, September 30, 2026 12:09 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
> >hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
> ><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
> >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
> >Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
> ><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> >Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
> ><karthik.poosa@intel.com>
> >Subject: Re: [PATCH v11 17/20] drm/xe/vsec: Support late bind fw information
> >
> >On Wed, Sep 23, 2026 at 11:11:32AM -0700, Michael J. Ruhl wrote:
> >> CRI FW is loaded on power on.  Because of this, access to the FW cannot
> >> be done until it is running.
> >>
> >> Update the XE PMT probe and access to check for late bind devices,
> >> verify, and wait for the appropriate FW state before probe or access.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >
> >We do need this patch. One potential but unlikely corner case is the suspend
> >while this worker is waiting... might be worth investigating, but I'm not
> >holding/blocking on that:
> 
> I take the xe_runtime_get() before setting up the worker.  Once the worker completes successfully,
> I do the _put.
> 
> Can a suspend happened in this case?

it cannot runtime suspend (think d3hot/d3cold), but it can still system suspend (think s2idle/s3/s4)

> 
> >Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Thank you!
> 
> m
> >
> >> ---
> >>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
> >>  drivers/gpu/drm/xe/xe_device_types.h |   5 ++
> >>  drivers/gpu/drm/xe/xe_vsec.c         | 129 ++++++++++++++++++++++++++-
> >>  drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
> >>  4 files changed, 134 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device.c
> >b/drivers/gpu/drm/xe/xe_device.c
> >> index 3ec950606e67..a2c8c7909688 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.c
> >> +++ b/drivers/gpu/drm/xe/xe_device.c
> >> @@ -1053,7 +1053,9 @@ int xe_device_probe(struct xe_device *xe)
> >>  	if (err)
> >>  		goto err_unregister_display;
> >>
> >> -	xe_vsec_init(xe);
> >> +	err = xe_vsec_init(xe);
> >> +	if (err)
> >> +		goto err_unregister_display;
> >>
> >>  	xe_debugfs_register(xe);
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> >b/drivers/gpu/drm/xe/xe_device_types.h
> >> index e08348a95b28..8f5cc5d65419 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -7,6 +7,7 @@
> >>  #define _XE_DEVICE_TYPES_H_
> >>
> >>  #include <linux/pci.h>
> >> +#include <linux/workqueue.h>
> >>
> >>  #include <drm/drm_device.h>
> >>  #include <drm/drm_file.h>
> >> @@ -488,6 +489,10 @@ struct xe_device {
> >>  		struct mutex lock;
> >>  		/** @pmt.base_offset: device specific base offset */
> >>  		u64 base_offset;
> >> +		/** @pmt.work: support late-bind probe */
> >> +		struct delayed_work work;
> >> +		/** @pmt.retry_count: late-bind probe retry */
> >> +		u32 retry_count;
> >>  	} pmt;
> >>
> >>  	/** @soc_remapper: SoC remapper object */
> >> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> >> index 0f6e3be520c0..5384fef5e5ac 100644
> >> --- a/drivers/gpu/drm/xe/xe_vsec.c
> >> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> >> @@ -3,6 +3,7 @@
> >>  #include <linux/bitfield.h>
> >>  #include <linux/bits.h>
> >>  #include <linux/cleanup.h>
> >> +#include <linux/delay.h>
> >>  #include <linux/errno.h>
> >>  #include <linux/intel_vsec.h>
> >>  #include <linux/module.h>
> >> @@ -18,6 +19,7 @@
> >>  #include "xe_mmio.h"
> >>  #include "xe_platform_types.h"
> >>  #include "xe_pm.h"
> >> +#include "xe_sysctrl.h"
> >>  #include "xe_vsec.h"
> >>
> >>  #include "regs/xe_pmt.h"
> >> @@ -173,6 +175,14 @@ enum capability {
> >>  	WATCHER,
> >>  };
> >>
> >> +/*
> >> + * Late bind will delay 100msec for up to 20 seconds
> >> + */
> >> +#define VSEC_LATE_BIND_DELAY_MSEC	100
> >> +#define VSEC_LATE_BIND_RETRY		200
> >> +
> >> +static void cri_late_bind_probe(struct xe_device *xe);
> >> +
> >>  static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
> >>  {
> >>  	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
> >> @@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32
> >*offset)
> >>  	return -ENODEV;
> >>  }
> >>
> >> +static void cri_late_bind_probe_work(struct work_struct *work)
> >> +{
> >> +	struct xe_device *xe = container_of(work, struct xe_device,
> >pmt.work.work);
> >> +
> >> +	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> >> +		cri_late_bind_probe(xe);
> >> +		xe_pm_runtime_put(xe);
> >> +		return;
> >> +	}
> >> +
> >> +	xe->pmt.retry_count++;
> >> +
> >> +	/* wait up to 20 seconds */
> >> +	if (xe->pmt.retry_count == VSEC_LATE_BIND_RETRY) {
> >> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to
> >complete\n");
> >> +		xe_pm_runtime_put(xe);
> >> +		return;
> >> +	}
> >> +
> >> +	if (!schedule_delayed_work(&xe->pmt.work,
> >msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
> >> +		xe_pm_runtime_put(xe);
> >> +}
> >> +
> >> +static bool wait_for_fw(struct xe_device *xe)
> >> +{
> >> +	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
> >> +
> >> +	if (xe->info.platform != XE_CRESCENTISLAND)
> >> +		return true;
> >> +
> >> +	while (retries--) {
> >> +		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
> >> +			return true;
> >> +
> >> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
> >> +	}
> >> +
> >> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
> >> +
> >> +	return false;
> >> +}
> >> +
> >>  /**
> >>   * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a
> >buffer
> >>   * @dev: valid Xe device
> >> @@ -343,6 +395,11 @@ int xe_pmt_telem_read(struct device *dev, u32
> >guid, u64 *data, loff_t user_offse
> >>  		goto dev_exit;
> >>  	}
> >>
> >> +	if (!wait_for_fw(xe)) {
> >> +		ret = -ENODATA;
> >> +		goto runtime_exit;
> >> +	}
> >> +
> >>  	scoped_guard(mutex, &xe->pmt.lock) {
> >>  		/* set SoC re-mapper index register based on GUID memory
> >region */
> >>  		xe->soc_remapper.set_telem_region(xe, mem_region);
> >> @@ -350,6 +407,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
> >u64 *data, loff_t user_offse
> >>  		memcpy_fromio(data, telem_addr, count);
> >>  	}
> >>
> >> +runtime_exit:
> >>  	xe_pm_runtime_put(xe);
> >>
> >>  dev_exit:
> >> @@ -397,6 +455,10 @@ static int xe_pmt_read_reg(struct device *dev, u32
> >guid, u32 *reg, u32 offset)
> >>  	disc_addr += inst + offset;
> >>
> >>  	xe_pm_runtime_get(xe);
> >> +	if (!wait_for_fw(xe)) {
> >> +		ret = -ENODATA;
> >> +		goto runtime_exit;
> >> +	}
> >>
> >>  	scoped_guard(mutex, &xe->pmt.lock) {
> >>  		xe->soc_remapper.set_telem_region(xe,
> >CRI_IDX_TELEM_DISCOVERY);
> >> @@ -404,6 +466,7 @@ static int xe_pmt_read_reg(struct device *dev, u32
> >guid, u32 *reg, u32 offset)
> >>  		*reg = readl(disc_addr);
> >>  	}
> >>
> >> +runtime_exit:
> >>  	xe_pm_runtime_put(xe);
> >>
> >>  dev_exit:
> >> @@ -434,6 +497,10 @@ static int xe_pmt_write_reg(struct device *dev, u32
> >guid, u32 reg, u32 offset)
> >>  	disc_addr += inst + offset;
> >>
> >>  	xe_pm_runtime_get(xe);
> >> +	if (!wait_for_fw(xe)) {
> >> +		ret = -ENODATA;
> >> +		goto runtime_exit;
> >> +	}
> >>
> >>  	scoped_guard(mutex, &xe->pmt.lock) {
> >>  		xe->soc_remapper.set_telem_region(xe,
> >CRI_IDX_TELEM_DISCOVERY);
> >> @@ -441,6 +508,7 @@ static int xe_pmt_write_reg(struct device *dev, u32
> >guid, u32 reg, u32 offset)
> >>  		writel(reg, disc_addr);
> >>  	}
> >>
> >> +runtime_exit:
> >>  	xe_pm_runtime_put(xe);
> >>
> >>  dev_exit:
> >> @@ -477,12 +545,46 @@ static enum xe_vsec get_platform_info(struct
> >xe_device *xe)
> >>  	return vsec_platforms[xe->info.platform];
> >>  }
> >>
> >> +static void cri_late_bind_probe(struct xe_device *xe)
> >> +{
> >> +	struct intel_vsec_platform_info *info;
> >> +	struct device *dev = xe->drm.dev;
> >> +	enum xe_vsec platform;
> >> +
> >> +	platform = get_platform_info(xe);
> >> +	if (platform != XE_VSEC_CRI)
> >> +		return;
> >> +
> >> +	info = &xe_vsec_info[platform];
> >> +	if (!info->headers)
> >> +		return;
> >> +
> >> +	guard(mutex)(&xe->pmt.lock);
> >> +
> >> +	info->priv_data = &xe_cri_pmt_cb;
> >> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> >> +
> >> +	intel_vsec_register(dev, info);
> >> +}
> >> +
> >> +static void vsec_disable_late_bind_work(void *arg)
> >> +{
> >> +	struct xe_device *xe = arg;
> >> +
> >> +	/*
> >> +	 * If the queued work is canceled, the runtime reference needs to be
> >> +	 * released here.
> >> +	 */
> >> +	if (disable_delayed_work_sync(&xe->pmt.work))
> >> +		xe_pm_runtime_put(xe);
> >> +}
> >> +
> >>  /**
> >>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
> >>   * interface
> >>   * @xe: valid xe instance
> >>   */
> >> -void xe_vsec_init(struct xe_device *xe)
> >> +int xe_vsec_init(struct xe_device *xe)
> >>  {
> >>  	struct intel_vsec_platform_info *info;
> >>  	struct device *dev = xe->drm.dev;
> >> @@ -490,11 +592,11 @@ void xe_vsec_init(struct xe_device *xe)
> >>
> >>  	platform = get_platform_info(xe);
> >>  	if (platform == XE_VSEC_UNKNOWN)
> >> -		return;
> >> +		return 0;
> >>
> >>  	info = &xe_vsec_info[platform];
> >>  	if (!info->headers)
> >> -		return;
> >> +		return 0;
> >>
> >>  	switch (platform) {
> >>  	case XE_VSEC_BMG:
> >> @@ -504,12 +606,26 @@ void xe_vsec_init(struct xe_device *xe)
> >>
> >>  	case XE_VSEC_CRI:
> >>  		xe->pmt.base_offset = CRI_PMT_OFFSET;
> >> +
> >> +		xe->pmt.retry_count = 0;
> >> +		INIT_DELAYED_WORK(&xe->pmt.work,
> >cri_late_bind_probe_work);
> >> +
> >> +		xe_pm_runtime_get_noresume(xe);
> >> +		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> >> +			schedule_delayed_work(&xe->pmt.work,
> >> +
> >msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
> >> +			return devm_add_action_or_reset(xe->drm.dev,
> >> +
> >	vsec_disable_late_bind_work,
> >> +							xe);
> >> +		}
> >> +
> >>  		info->priv_data = &xe_cri_pmt_cb;
> >>  		xe->soc_remapper.set_telem_region(xe,
> >CRI_IDX_TELEM_DISCOVERY);
> >>  		break;
> >>
> >>  	default:
> >> -		break;
> >> +		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
> >> +		return 0;
> >>  	}
> >>
> >>  	/*
> >> @@ -517,5 +633,10 @@ void xe_vsec_init(struct xe_device *xe)
> >>  	 * resources.
> >>  	 */
> >>  	intel_vsec_register(dev, info);
> >> +
> >> +	if (platform == XE_VSEC_CRI)
> >> +		xe_pm_runtime_put(xe);
> >> +
> >> +	return 0;
> >>  }
> >>  MODULE_IMPORT_NS("INTEL_VSEC");
> >> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> >> index a25b4e6e681b..c4a1e2fc67d8 100644
> >> --- a/drivers/gpu/drm/xe/xe_vsec.h
> >> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> >> @@ -9,7 +9,7 @@
> >>  struct device;
> >>  struct xe_device;
> >>
> >> -void xe_vsec_init(struct xe_device *xe);
> >> +int xe_vsec_init(struct xe_device *xe);
> >>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t
> >user_offset, u32 count);
> >>
> >>  #endif
> >> --
> >> 2.43.0
> >>
