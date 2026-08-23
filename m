Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E04AEEF;
	Sun, 23 Aug 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485588; cv=fail; b=ZfWfRum3s1UYpKv3k52MpkqHC6jEaI9rWRFCVec9pXOQ/TQl4KkoO3MJtgTDunlajcLWDhvDg/Bhv/rZoIVWpm5BKybFN7pDVC9SEPAkYXLNMqCuDu3Eq/28jdMbn2drZgLRVXHNPDahltKWofj8uHj9gn4k8vrVIKG8gY9v9YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485588; c=relaxed/simple;
	bh=5/YXiiJ/i1s+Jln6A8Y/petF/aRbSptHa7lIL5+o1Ac=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uuzEzuvS60NiX4TnWVpycUP1WjGp95G9/luHZS5frIlk6Sw0spC1Hy2L8jX36Lw4Y72kcE2R6a6VcjDtb/2h4SlZCrtpi+PdQfauphtRnIoTR1W0wL3h/xInxXQsyTFcCrQ4o4dIHnwZfat84mG595lnjyiMHqTT9Ed5YxHcezY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQ1aMFGj; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQ1aMFGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485588; x=1819021588;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=5/YXiiJ/i1s+Jln6A8Y/petF/aRbSptHa7lIL5+o1Ac=;
  b=VQ1aMFGj/ogAm2ywUpgSiYBo7iepb3cMCaLixtsB4nI6IWnKleC0k9BQ
   PJ4ASGy3rd4lUF0KK01ZIxL3Lc8AJ9sYJZVByog1HL4+gaaAyCNeHX7lM
   jih00bmhDmLWACDcETugXyPzwmKZpG3yi+IlZrGKm9NohhR8QIfxo1bgR
   HBB3flOpf3/Erdj+3W2pQWjIyOizbRa+E00hP29HveCwMyCiaE2cEJ+aT
   FELPHyZ6PbTFGnQbCpcs8BSpdrCSPsQqqYonJtl9WYBS1i2pKoIf+SMrg
   bnbTTi+8PQV2qRh+LhNFU0aGqMlZIzKviLSdb+w7sQgi0ObD3ba/uh1J7
   Q==;
X-CSE-ConnectionGUID: V5GE/EQzRIuNUhdsqDx4Zw==
X-CSE-MsgGUID: Iy4IdoA9RVGvYzTutFQLmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="99119058"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="99119058"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:46:27 -0700
X-CSE-ConnectionGUID: 2tFAHTICSmaqXDFZb4X9fw==
X-CSE-MsgGUID: Vi1CnLEWQ8qs5Ub2RJd9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="304949818"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:46:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:46:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:46:26 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUIeRr5OrzNwDcuCo8A2ATuRKZhm46B4NJ1z8UYbn7MRTLblhysm7JbU2Nbhhjy4eIt6wLqGgLmFJuMKmvCZlSHrgri5sSbJquDlhUIA2UmAFjUzjjnE5FoHMZUR46Hqgp4RAUSLqkbyRIjmitZ8Zx10ay7dbHn9VlCW2lDNp1ik8r4H+urhaHJz2rwLwiGIiXdT4LFpYd8W0pGOpJvhrkeB9atuqc1p5dO4/QRAnnwS6/NqNIcN00TuYkjDF08GSZbxBR2jTNwJwn8Pklab4xPlIbseXYiQvIvw/Z3PVTxULbNGtp8b1AFisV99Jy+VtlryN35Qy4rrMtogsusXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8QDOR87vUfLBcet75hdiX4aL+d+eRoDH0kLtjS9qIs=;
 b=ehDLVCKzLyimgHiObxJDDHkAm00Ip09y2VBCyk4UDn5GNDpgbVO2jB9wC+vicUoTRXKfxQKrHVMb26TCfvUAitBGxUXaWzaHEnn2J0+uslji7gYmWsYE/2J5dhKrC9FfMSoMysHjDtddF33CQW/tNRlUNyLBBJEdbAB2+MyBcosMB0VACJQDg5kdMWj3D1Wh3ZfTfAy1U7ykumKphi/m4wLD062Fp67dcv8aeGgP+Q7LlGxTqgcDzRuFzovuuGqYKSeQw6zS/ngtPrDW9gUlRZQOCJwsbrD+OU0ye9xOLjol/Jy0ZIz5Z/ataqiICuqEOPvQIIXYYSlRpXdsYNKVjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Sun, 23 Aug
 2026 11:46:18 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:46:18 +0000
Date: Sun, 23 Aug 2026 19:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: <kento@kekto.ru>, <platform-driver-x86@vger.kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>,
	<qby140326@gmail.com>, <foxido@foxido.dev>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	KentoNion <mrKentoNion@gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: add TM2424
 thin-ultrabook perf-mode quirk
Message-ID: <202608231515.K5glAxIO-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260816215825.289356-1-kento@kekto.ru>
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW3PR11MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: 629c2909-dedd-4616-aa1f-08df010c2510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: xjf6Jc2Ln5Tzp9Jye6tVxvMbD2ssfa9EmJiKrhFH10rHkKk4DjfyGWa7ql3veUTFdPlW+2n9ByZ8lskT8/TYaawG89xLrbparH/lZoLyP15D6+rnoONZpBHUFsJrXQI2+0FXs5E+yYe1PgXM5v7/geX/S5Bjtd+H3vXTc2nBDcTttMT0lmOLb2X2ZOYAuX1FgLGPHMxrpe9x51XX+hQs5AfZPFV0FQm6o0P03o5hBhSO8ZgExuLY0kKSzp5DaoEfCllvS+7+jD2JqS3BXd3M9dAVmKgrA83auihnhgn6OiZYI28P053Q1ssDx62RrBkD5fm7XXetdlPbHHaAHZNM40ZCW8Vq3/+G/d+ZF0TxfRAi8WPRFwf9omaZsWI+R9fQTJgNffEvCMLyJTBIS1Xgw4Pks0A77ais/7KV0dmZIwN1FTXOB9MrshIvNxzy6yGDjEbOAle608/+iqxPygA2O+MKsWs3cZYyFXDwIVFyOzaRVB+2ufFJHMCYoNptLoQHI5aSG/qh6INYMrQSHSB2H5y75zCmLvBUNzH8fHJFL3QYR9QLsGhuHZHmJ3v8RN0XgEOqUd7GU/oxS4ut4WmqFlZbRrvA7UyhNtOwfbL1T4usKEKm+jh1NiW6+m4yy7Kz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zy0Du5OyYWl7sHqnsg20bdfmpz+HVN9WCqi3dvXOylN4CpgJmqDkTu52WjcZ?=
 =?us-ascii?Q?AFLa7JQWdONP6Y14zyHtAlPWt9YEEBKhhSN8kOxo/HaGrmjzTvF5rCdpf2Qp?=
 =?us-ascii?Q?66lk/KRw+q2q4smaztcD891Tn18L2lrF1sdJsKixHUxMuN/5vfk9Ty6oLAZp?=
 =?us-ascii?Q?fpVg7xFpFC7MZ7pXxFvyH/5gEJ09Dx+UWNdOvxxt7wfWRjTALwijzQrbdvm1?=
 =?us-ascii?Q?e4vNwkmxrSSGD7ATLuBwSET7nfRnAVmUC3CtVS8UQq69xDXaGn170G9MLcSp?=
 =?us-ascii?Q?hlw1+Ks78niUMqwDMZ9dY4X7FyyTKj2S3GFvSOK9G1Dmc5JAnKNVIu+6KJyp?=
 =?us-ascii?Q?VbPmQa93lOnqEO9yz7ZRq2wtA+I4zlaBIGLzt0nrwApTEeThoxPJxgfQHhu2?=
 =?us-ascii?Q?Z72ROX6nN0O4TPONMDAl0eZHQn8VB7ugCYjMteBsXGIB7LTek+M4GEVWQA2n?=
 =?us-ascii?Q?6wUqs+MNtlb2XJ23XsV8UlfzVVng9QDuG8aQmWN83mb/ECRa9ef+JrlmfYaf?=
 =?us-ascii?Q?DvNzWVWkKPr1rxq70IS66DYN0LyT6d7xik9gH/fV4KlGjif/FpgnH0ZkKsYs?=
 =?us-ascii?Q?yR1MutxVE7M8Ro3pndLbPqi+iaxMCTqIXpaIB/IgZia4OezQUHrxfPsYOFEY?=
 =?us-ascii?Q?YWytT5tTYINd8rt9Uf/GxQa5zua6YEo2sexGsp2khFIpJiV2y+Kr0WH6AZbm?=
 =?us-ascii?Q?5uEYXT7MteC6Lmz4+Pl6+/phtiK27VDi6ZbUZpbA5giywDGcP+OXGili+hXY?=
 =?us-ascii?Q?Q8Zr6dC9UpcXi1zxDpFnUgFyEnaGfETROuMXRTcxiMFNUgDJHTRNHt3TuCsM?=
 =?us-ascii?Q?NcZtAxNlwar7apMQ4PTurEXYeJtjzPX3QG0wlVxCddbWt0H3uK2Lk/vHnJ+s?=
 =?us-ascii?Q?YZwF0f00MkyZeBMvIkWq5NFfEY1Or/tNRGCWz2HQ2TC7F1jWsm5imSAopsdI?=
 =?us-ascii?Q?UBSQ/f94/K5wDiKkGRj/F/wLblW6llU6acEcBeLHJNKtZtKLtzQPZedVu3hr?=
 =?us-ascii?Q?mhCoKNsKO+eZ/4BIYV93piyz+RimgcHHJqu/gEOJ9XLDt6vfdrsCgNPU9ljI?=
 =?us-ascii?Q?BfIivFRYo30t2W2QN9yln/13gwagMECMimqjIc8mcUleXA/6vfD/EdmVNRao?=
 =?us-ascii?Q?cr9DumOxt61Kh1ORZ1dI5Vh+3rH2s8r9NEyLoO/1bCHYhCWMRlZEwsWRbrzK?=
 =?us-ascii?Q?gVF9sQjry7rCO9rFGGvwbHlA/rpMeICjxcCIUXeOZeXtJYwf5qEJeOwcKY2c?=
 =?us-ascii?Q?FTK0QY6k3wQV5/4qMwjMRA8lApgY23GVm5aHwPnEh8FU2UnLur3dk6xwYhIG?=
 =?us-ascii?Q?0j84ltbkT2j3JMWP31YIQ/0tR68UT60XaRKwuov7Sf2hLXE2cqi7NMG7rgiL?=
 =?us-ascii?Q?oTTJAGmGG59Mdu1Grh0zXyLAPdRlkzx/FR4NzxbL/Z8uWnJTRluL7T3fofEQ?=
 =?us-ascii?Q?4nDUe5Q1lswO/Btan7E+LoifkIZE6eIvqN2JQCFTnj1i022yW2RN4n4+omZ1?=
 =?us-ascii?Q?db0OjdVCyzA/qhM1umPYwuEX4mqIWgNosaXPCZq1ghXvPplEFflrW+XHQpXQ?=
 =?us-ascii?Q?HjDb7v/KNuGq/p7nSmsoOB1lbvzc3NvTfquJNcIPzJgACWcWh+sSowQVn8WL?=
 =?us-ascii?Q?pkIRG2n4WolrZYXE1HH8COKxJjnzlPdLenXoDu0k6ZJmLiGr/KKLZiu6KhAV?=
 =?us-ascii?Q?f30VGGVL/xcOHuYf2IHRDn/MEcq6oLWNnnb3onHo6xPCYsSv0kcsAg1lR8CT?=
 =?us-ascii?Q?B1Q6yXvRWw=3D=3D?=
X-Exchange-RoutingPolicyChecked: g7nNp6NZvXXQico3kfiWJqeWDs3R3htAkkkdspO+H+F+FtvShhaOikPQUkQh/RavR9u/42ieRxQLvsC9XPuljImd1DHhN/rwTtFtq4BC7IFReZSewCjPXkpV96iKvibrjgfuIqOk7SDgHz2a9+zgwmWAniuS9W61x6VzcU9roYUy3XXoBGUKiAGiPXaKn1KPjpYZSXfQTCHS0KL0sydZZeUMmQmnffwUxXpHIJHGa7OgY+HXzAumgvDNZakaZsuhgpiuPbEl9wwEIOTSJC+AaQLk5isdl3S1T3kQuFLYy2azfm+JalV7Gfqs07LQXpZpvxrdH1m89SIjO9vHxwU1bQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 629c2909-dedd-4616-aa1f-08df010c2510
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:46:18.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReMvDrQJcaH25QvQSEK0wCDoZFQUwxHGt012jUmJb1IhVsCQjpuLaTaodXOcFbR7Bdpf0SxxKs54CH9fuUvzFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
X-OriginatorOrg: intel.com

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kento-kekto-ru/platform-x86-bitland-mifs-wmi-add-TM2424-thin-ultrabook-perf-mode-quirk/20260817-005825
base:   linus/master
patch link:    https://lore.kernel.org/r/20260816215825.289356-1-kento%40kekto.ru
patch subject: [PATCH] platform/x86: bitland-mifs-wmi: add TM2424 thin-ultrabook perf-mode quirk
config: i386-buildonly-randconfig-002-20260823 (https://download.01.org/0day-ci/archive/20260823/202608231515.K5glAxIO-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231515.K5glAxIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231515.K5glAxIO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/bitland-mifs-wmi.c:743:2: error: initializing 'struct attribute *' with an expression of type 'const struct attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     743 |         &dev_attr_gpu_mode.attr,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/bitland-mifs-wmi.c:744:2: error: initializing 'struct attribute *' with an expression of type 'const struct attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     744 |         &dev_attr_kb_mode.attr,
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/bitland-mifs-wmi.c:745:2: error: initializing 'struct attribute *' with an expression of type 'const struct attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     745 |         &dev_attr_fan_boost.attr,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +743 drivers/platform/x86/bitland-mifs-wmi.c

dc1ec4fa86b2b8b Mingyou Chen 2026-03-23  741  
8bbb6b46df1cecc KentoNion    2026-08-17  742  static struct attribute *laptop_attrs[] = {
dc1ec4fa86b2b8b Mingyou Chen 2026-03-23 @743  	&dev_attr_gpu_mode.attr,
dc1ec4fa86b2b8b Mingyou Chen 2026-03-23  744  	&dev_attr_kb_mode.attr,
dc1ec4fa86b2b8b Mingyou Chen 2026-03-23  745  	&dev_attr_fan_boost.attr,
dc1ec4fa86b2b8b Mingyou Chen 2026-03-23  746  	NULL,
dc1ec4fa86b2b8b Mingyou Chen 2026-03-23  747  };
8bbb6b46df1cecc KentoNion    2026-08-17  748  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
