Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517735202A;
	Mon, 14 Sep 2026 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392409; cv=fail; b=uDla+XKT9dYcifPn4OzNaRd0YQqZZmLPt/1cC8AWqO85CAuL8dtxyzO1oSuFGQQh6g95ATKlU0GSqz+yqbWQfnHPpEiMTSynZGhGhOGvc3Mn67Dd+3lVFhxViFwU13pnC7tJK2YCMmMB0XOX+K1Ua6cgGuJ4K/xu53aCPiY/+hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392409; c=relaxed/simple;
	bh=HpwoWdxI/pnyR8dPQxAOKeEcGYvxBVn0GRgbzGMmkXc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iE7BJR74W/HSIOmmikZXq0L0cXiJgzhpBAISJKxUiASyDpWTct5eNrQncP8QMArz1vi+g+4HeAZPGiTYfUyIUu04bBP3I2FGkotijzs4Cpwvm7i2WZG+7BkqXtrGedILUimLsP9vvdF416b/MP6Fdb50gOkd05CNm+Jl5CvWy/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUr8/KVd; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUr8/KVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789392408; x=1820928408;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HpwoWdxI/pnyR8dPQxAOKeEcGYvxBVn0GRgbzGMmkXc=;
  b=BUr8/KVdsN7I61rCIIbumIXjB9BDpwaVf1jGAZfY+XH+5xIJAvFXJ19T
   2SoAFm0GqdMqWOEelGS64bi12kmHhmr9OVO0wvf57TAKXQWjmf/EG55KC
   UbO9pzvKf9exqmwo2JeJoRD8pSTkkK4j8LdM9fPuAxPjaWcUf7ty0ZBdo
   x3M8p4GeT6iq9AZRGipRVJEcuL8WjYD/sceJWB9+Z84528eYs8YS8jFqh
   9iDAwmoLrDHOP9SPSWCqwXBGAUAMIWDziDEQ4DqsD0q46Rdlj/PiKnoav
   HiYz9V9pcF+SAMllUB5L2E72HvmDocF1eZ3uUGot6a26whFhLRqysZqCe
   Q==;
X-CSE-ConnectionGUID: yOXRBBX7Toi19l52+CkCoQ==
X-CSE-MsgGUID: k2iWzJ6ZQoGnw4kJwM0uBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89948684"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89948684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:26:47 -0700
X-CSE-ConnectionGUID: ajslz/dmSG2+zYsIdfDtCA==
X-CSE-MsgGUID: FkZ9bZKeSi2iQm1Up375kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="276797034"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:26:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 06:26:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 06:26:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 06:26:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vs7SDTlWf6dA94GyW6R82N+L/zoUGYx12hckd4OdlBUtM5T+PVH2dozaNTeSGxHpPDYRFyj0x4B3jvJ27XghEmrOuhEmA3oUkgL4BLlpOsK3Bn+SzIv6gARjxWIQs67VLhP9LP0YAOJM8x7tRQ/TS8OPYtotLPNcHGC05b+ubdDx8Mnw8llvDLApRpllX/TJqMzY7+Htthh11d3ihiuQdGcZ3UR5O5A05/ckOzx8KQV1AXm5+V58NFgz8zw3YMTlmIOKPmH/0o4cGzVFNupQErFTjWyeiPVH1HZDWHwv2n8JjdyQqwLVRfBi3L6dnNmUxHaWtb+M2YX7A2LYifOMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vg64+6Z3tfY4zqrMZSERHO+vtfbDCNhWfK+/paQNyFw=;
 b=Tq74TMIXn/LcCQS6ZDUxX8Ie9fiIEmm4vmxcLH41NlfS0c0nkcjFfUTt3JqbQctc8RRJo0FuDzhMIU3pT8AkYoYWJP6+WyYwYXS9BVcrENlqm+4f6caCI5DV8qWkrFwJvm05rIc3N6UIz+gZkX7EOHzDJAHkJPCJpiD/mu4GyOctfDZHOCcaldNX/lOv+cSewPIhQrNuIkxQINDTuAWJrdBrOdT1MeMtBoMX9MSV6zbsCAO8d9bfXQiqSHq388ErlWj4jj7//5+8p2gcM7axxATdwv60/QsZQUk2mgtknxBbgkmQ7hn63GHkrDmP1rlVsLil90PjDuAlwLqavQBSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CHAPR11MB9654.namprd11.prod.outlook.com (2603:10b6:610:302::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 13:26:40 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:26:40 +0000
Date: Mon, 14 Sep 2026 21:13:20 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Klaus Kusche <klaus.kusche@computerix.info>
CC: Tim Chen <tim.c.chen@linux.intel.com>, Mario Limonciello
	<mario.limonciello@amd.com>, "Badole, Vishal" <Vishal.Badole@amd.com>, "Peter
 Zijlstra" <peterz@infradead.org>, <linux-kernel@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	<platform-driver-x86@vger.kernel.org>, K Prateek Nayak
	<KPrateek.Nayak@amd.com>, <ricardo.neri@intel.com>
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
Message-ID: <aqfy8PjSUOYI-_Ju@chenyu-dev>
References: <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
 <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
 <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
 <3cb5cbdb227bee0b822f1550e10659faadd77a3d.camel@linux.intel.com>
 <e17ef3af-c1cd-4360-ba4b-9900ccc36ef6@computerix.info>
 <76dba935-1052-4fa9-a70c-16cecdfd12c8@amd.com>
 <4da55124e32dd0587a3516c8f5ed512bffbbb42e.camel@linux.intel.com>
 <2fe2c681-b748-41fa-8b56-1169c86cefbc@intel.com>
 <6b173ff1-6fde-401d-a4a8-6fa8bbe3287c@computerix.info>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6b173ff1-6fde-401d-a4a8-6fa8bbe3287c@computerix.info>
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CHAPR11MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d472cd-be58-494a-b626-08df1263cf7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: d5oAqAv81vcCE9RPcyHEdqGIDKApPYr7L15hCQIgn1X9Y08vbptGamXwhhBLKDs6KyUboHdPQ1ICjFU0kMYMqU81Y4EX1Aho+yY7z+FOzRwKLdGOXCQz9iov/3Bn7XqO1HTd+FclI6dOWv2cQiHsBwIaA9h84tB9FvrHRQXXdOpXMx2iIM+va0bfYzuaorTvIF4gVMPkuIPko1JcghLZS2YNjUqTgg4VNseNQBtwtpRX3a0U381WJhvXu1sx+WRU5sxl+Rkl+v/uZkF7AhtfuYeiN3oomqOPaAqcWjAmx3gzVKFN61j6dmiyzua8gJfRq4yWLZbrdegLl6XfCIk0AD8sks6vXXM0xNh2/j4STSXZ1K+MXapkhOfNqCm6CjsXx/yReYQIngmi/rkT8DozQ0HZQSWnc+PdaSIe6odQKid3Hkq3othVfvg0Qa4OvMBSHeFbYTzYb1QJndS/OMR7GvCOXu/wltQ/rNd+oMOIOD1wA7hsjfOcYRPaPuPWZ0LOzfvPAzhr+PRB1s5lscEU7gjd1QPkCxlQe0GU+7NYiUTznpF8jSN+qrQ8PQFQtv6CtX50/ywIKG5dARSgv4Erj4B8yVe6/85b2LmJI0l3ztWUvlM6JZT6aUVQ2LnjLop8OGUCeCspNE8TFH3o0EafcueS9XYl2ZUI1mj3AntJKII=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mi1TyQtFYKpsTxEHbjCVmZnMd6TXifn+Lci6V72dC1KLpqXMXZ2SK5apR+ZY?=
 =?us-ascii?Q?6ZmySfz3B1iXBDCY0trGOlPlQyol4jbbaHt+C2vIN1zJoKmKTGlqbMANhqVy?=
 =?us-ascii?Q?htU8dN3A7jmtzDlr0MdQWskgpSuO7egs0YLiI1bVyj/WFoOKKAbFoTlhEdis?=
 =?us-ascii?Q?n6HGFLSxtJrzL9JUJBB/mILV/EyTIM28GyHoNhVzGs0OkupSBRInksO8KIz6?=
 =?us-ascii?Q?u4axc6/+kXKS56oJUACQgseaXj8v7iWE0FWxViTA4txIZsJO0PzsI9MC1Wfd?=
 =?us-ascii?Q?45R/9KmDqcJDeRoLOPHr7LqlrDzr6c0Z0obcrJ+6b/IuO3RkYjL1BTa60i7z?=
 =?us-ascii?Q?RjozAPFQ/9IwJeDmcHy3nVKlo9h/pv70fEdH4ZrQVGlKIahxgveozRF4qiR6?=
 =?us-ascii?Q?HrZdXZKz6c2I+G62aGWRZQHkyXBVguexk0ny6ev/ynizydNrDGZ60T1dXiUa?=
 =?us-ascii?Q?mAzk/a0x5ih0RpdAizjy0Ys2XOzykYchjzEuRADtaeffiPkxfHlLGMAfNplA?=
 =?us-ascii?Q?f4fzXKRPLiUvacedvVZpgntkLgoJKPfsPoWMeFZwsA5QBxIrMZqyCwTX5rPs?=
 =?us-ascii?Q?3CgC06G2ZGcV4BMNkb55hjO8DxngZuYuAKv1AAyNpTLOK64Ctc6PmrQZorSg?=
 =?us-ascii?Q?YZuQFzexPCyD0rM+Md3DGQx+PZXWL9DnpCEMcTDU9N++20uaHomHrKKQdGYt?=
 =?us-ascii?Q?4ynRAQe1lEQRz5eQa0xUZGm0NoUp7z7NhV2LrMlSuamjazmyY28AFAfQrHUO?=
 =?us-ascii?Q?uLmyr8YcZdIChBQPfcMnbb4zD1nkNul0wVuWLBNUVjHHgg1u3qhjuEPr4Cez?=
 =?us-ascii?Q?ySwSU7gj2mOEeA0S+myRVuVCChIgtMXyD3KdF21ozXBFmgnwbV3F0ht7qM/X?=
 =?us-ascii?Q?VsdLp6Ln645V0OomDV3dL4PiraInmzIRHQ7vYN2wNnjRpMavbXEQl86YZB6C?=
 =?us-ascii?Q?MaS7Qw2Y3TfhzOox+2ZAuReERE/FumekucNyuID/iSSmY/GGxssBdqIK/9LL?=
 =?us-ascii?Q?HF66x8JVVo1iTK6jMdqHk+fc2DxLgNSc+SncFGJ7zHM4TksrnrWon0r0V1Ff?=
 =?us-ascii?Q?RWxUN26GlztSDDYbxFDlnWK076oFVZETRE3pXnbR/sLsmwQmYH1ZNBhx51qX?=
 =?us-ascii?Q?K7WY8Dntmy5NSQw0whImWO4h1iHNNhHeG+GidHFrqywgvvLQCYHVfapx24Ne?=
 =?us-ascii?Q?0UJNV/6CEbU5D3ynNKwvNULBzB6YxHTarPMG2IdtROKvzd1M4XPC8lvACbf5?=
 =?us-ascii?Q?t8wtwIE1v5tStW99xzFHrN9mozGy9EuVR1EmsJrNOOOgWeqPZt7wWrNI1WsO?=
 =?us-ascii?Q?WwoX+kv6d6VZCadPNsiO9lDK9QEEh+rWJD77fkwsF1aYtR4GckosZc7I+LjW?=
 =?us-ascii?Q?z4Q9UK/pnSbIDZMZNQTNEKv+ateBP1LpynziNqtMM4TlXnIT1qbzdFCQHGLR?=
 =?us-ascii?Q?/ETbI63mB6ujIY65RO18LojR9NftbBSwKoX+J16RXSeagnXS7rcvayslTPq9?=
 =?us-ascii?Q?v1e67VKufqbxF3ucnV7TBncx7nWyp3X4MWBAB1Q9oY5NwqQ32yfFC4yYrkJi?=
 =?us-ascii?Q?EGELNsZSc8PR4oqvkgsTgb5ss/Ccd1UaK8NJ/MJZB0HdNQZYE/jQW4qhCJkN?=
 =?us-ascii?Q?p2j7KM7E/luEE42Yh+i8ZpmUqAPmoAFOlWgVwCL32P/jq/GlkYr6/RC73Bc3?=
 =?us-ascii?Q?ZmUB4mQfOeksVQVbeUROCy00UefqC8CfhBqJKtqVtTqGWn0vHxvys0tYi5Zc?=
 =?us-ascii?Q?aZNr0sb20w=3D=3D?=
X-Exchange-RoutingPolicyChecked: QW5xDCA11e7p9OxRSWxl6BfuFDf6gnGnGXWg72suAeUZsJkKjY3GikZS4GqibqTHrr8eRDJAg/ctxUMUyi3txX14cwI8ZL9ubtQKdSi9Kpn3+kFgWeXhqUjaf7yjhEegxdmJKreS/CwXh7DIBdYT5Vv4s/C3veA4pJPOThYeHtUC6kTmVTLp8X6inzQYa5VkQ6ONULofyIjGRhajn8tosngSPbL9Znduc1ge8mfZ3+4E5uiFXD+k0SmlCYrQ4/VD6TB1eIBNvmRirJ3JtAqxbTiBKB/Z08jPTvgDB+/BA/dYqgy0vMTjRdu6EHW/UPHJJLy6cS5JhTXMB6wLYDgvAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d472cd-be58-494a-b626-08df1263cf7c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:26:40.4873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yA41ffWFmc6BRnlMlFhKnnYXB8ILGs3Xyx2zRV5WwnhfegH2/IXXyG3S5Gni3KMTyBHsMMrLJ+dpoOMooTFuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9654
X-OriginatorOrg: intel.com

On Mon, Sep 14, 2026 at 12:27:53PM +0200, Klaus Kusche wrote:
> 
> I did some very quick tests.
> 
> 1.) /sys/kernel/sched/debug/domains/* does not exist on my system,
> not even with debug_fs on.
> 
> /sys/kernel/debug/x86/sched_itmt_enabled is "Y",
> /sys/kernel/debug/x86/sched_core_priority looks good
> (big cores have values almost twice as high as small cores)
> 
> 2.) The situation with 7.2.5 which seems to include 
> https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/
> is almost unchanged: Without cache aware scheduling, 
> my build jobs run faster (wallclock time):
> Just 6:16 compared to 6:19 for my kernel build with full LTO,
> but 4:50 compared to 5:20 (???) for my python uv build
> (the python uv build seems to be a very interesting test case?)
> 
> However, with cache sched enabled, in spite of the longer 
> wallclock time, cpu seconds are sometimes a little bit lower.
> 
> 3.) https://lore.kernel.org/lkml/20260810033742.1688718-1-yu.c.chen@intel.com/

This patch inhibits ASYM_PACKING and favors Cache-Aware-Scheduling,
which is the opposite of what your platform expects.

> seems to make things much worse:
> Kernel builds had the LTO step and the CC compressed step
> placed on little cores for significant amounts of time,
> resulting in total build times above 8 minutes.
> Same impression by watching the bar graph for individual cores
> for the uv build.
>

After a second thought, I wonder if we should disable Cache-Aware
Scheduling if ASYM_PACKING is enabled, because the latter would
prefer a higher priority CPU rather than just choosing a random
L3 to aggregate the threads. Would the following patch work
for you? (just compile tested, as I do not have a multi-LLC hybrid
AMD platform for testing) Thanks.

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a..07bc8a302574 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -684,6 +684,7 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 
 DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
 DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
+DEFINE_STATIC_KEY_FALSE(sched_asym_packing_active);
 
 static void update_top_cache_domain(int cpu)
 {
@@ -957,6 +958,11 @@ static void _sched_cache_active_set(void)
 		return;
 	}
 
+	if (static_branch_unlikely(&sched_asym_packing_active)) {
+		static_branch_disable_cpuslocked(&sched_cache_active);
+		return;
+	}
+
 	/*
 	 * user wants it or not ?
 	 * TBD: read before writing the static key.
@@ -3085,6 +3091,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	int i, ret = -ENOMEM;
 	bool has_asym = false;
 	bool has_cluster = false;
+	bool has_asym_packing = false;
 
 	if (WARN_ON(cpumask_empty(cpu_map)))
 		goto error;
@@ -3204,6 +3211,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 
 		if (lowest_flag_domain(i, SD_CLUSTER))
 			has_cluster = true;
+
+		if (highest_flag_domain(i, SD_ASYM_PACKING))
+			has_asym_packing = true;
 	}
 	rcu_read_unlock();
 
@@ -3213,6 +3223,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	if (has_cluster)
 		static_branch_inc_cpuslocked(&sched_cluster_active);
 
+	if (has_asym_packing)
+		static_branch_inc_cpuslocked(&sched_asym_packing_active);
+
 	if (rq && sched_debug_verbose)
 		pr_info("root domain span: %*pbl\n", cpumask_pr_args(cpu_map));
 
@@ -3318,6 +3331,9 @@ static void detach_destroy_domains(const struct cpumask *cpu_map)
 	if (static_branch_unlikely(&sched_cluster_active))
 		static_branch_dec_cpuslocked(&sched_cluster_active);
 
+	if (rcu_access_pointer(per_cpu(sd_asym_packing, cpu)))
+		static_branch_dec_cpuslocked(&sched_asym_packing_active);
+
 	rcu_read_lock();
 	for_each_cpu(i, cpu_map)
 		cpu_attach_domain(NULL, &def_root_domain, i);
-- 
2.43.0
