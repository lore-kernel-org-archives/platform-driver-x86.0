Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795535235;
	b=1pNsHhGdWc5fBmX+KErH69JyxpUKbVXivPtUA9bvynpJp4VYlUj/a5DRcIHabXdMYyhl
	 2G+okTMZVUsXMRFITwNhUv5yJmh3qSEdDBMZgEk5/wXEXwaMA1ecT+zdzxCuIhZ7xTIKZ
	 GU5NkHlgBfTCnhdq81z1bYTYgFaJ7fwNYiQMdEkM1JkF2EuiQKxJswSqKzHb9r4b0DP5y
	 qvbEQQ5B+0bLkBDQiAYjFwrzeN1aPeVhyLQM5ZtFxMvk4MR4eWzCpBLvNy5378J1TE5DB
	 lMaf3M8A3ipEgvu9hdiLE+BAzkEtNahidtIxbLZVZ+tcfiOGh5zGOxhOVZEUfMpyq1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535235;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=t1S94APbudn4v2XohrlhUapBoULBjOMGBNGNeOD/Dp0=;
	b=R14N90ll8r4jazn+pn+LxblpKaIKzsWeDmTyWeFeSI79oUWImhoPX8+/Rn8LSYw8PEBR
	 PsimMY66SXR4rQJvDXfZq4CKT1CxhCKG+eYGkeI3Obk+W8/LyPMenF/ZYeKk6A1AxvYAm
	 ZP5w+dhJkNh0Qy952FKFFC2QpzTVQCcmxkjQRx1gvLqu9b18fGeltF//K0Yz50OtIjszm
	 npsZ2E7tn2EidSUQ/BISqjWMfcSt7Q0d/UUXXKGaEi17p8uzlmXm3mbVMTJgYu3yo6gq8
	 pCUm0Nrl5Vmbmu4ALBzfnzct4jomUZnmxRyBbj8cgS+YbMAOKyPFIb54GYG6tIGjClg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VCn//SU6";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=l3xzQwrF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA1606A330
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 15:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CA1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VCn//SU6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=l3xzQwrF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795535235; x=1827071235;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=16iX4q9sOKhROAizkxzgPKEapPyRlXJAQJ/UpY0i5dY=;
  b=VCn//SU69xRCphXxdtof0vbm2ignpB1I5d73TffKnGLGVHow7t78oijU
   zB/BQDxw7cogLxSllAa6I2zpcB5Oj2QXOxSCJzwyyzfJ7x+4vvl5ywusN
   reHAIOqu6nJmH2Cq09zMgWW0Emew5GnAyhggR8+kTZC7lw3mC4etZbOPy
   yUUa2lgjg1pugN/+JD6bFOeTbeaeAiC4+c2Al2vnJ3isnUPIPbZrvyBB2
   rd73/7MS36ydDQmN5ZVoNoerNJgxm9z6LiDcIAW/cMpTunEBhi6w0CtM5
   bs/m81jYS+Hg8LMEagOrTvEBHHkSCXkiNTyi8ZUkm651Dy+WEKLQQDy/F
   Q==;
X-CSE-ConnectionGUID: C38fiwoTSKGzZuKxJBGimw==
X-CSE-MsgGUID: tQV9Uh6BQ6u3R+XdKa974w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4293674"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4293674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:47:09 -0800
X-CSE-ConnectionGUID: rXZAPsSkQv+ta8Mhn91Oyg==
X-CSE-MsgGUID: VbqKuN4PSzWDYbCtInCLYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11923784"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:47:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 07:47:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 07:47:08 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 07:47:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+imHrlF/yzSzYxWykaG7duGuHxlfvz/1Mr4gx78fBajztH88LNEAdR8QuRX1QW7XZuUjb986bUkj3r6GkbmnVksOT+rTFrEnbka7xWdDhK+IRqwYPfVFRqMrCypu+x2gjnPX2ihOPKlT6yUVVFX/RCmq4KGoEkBlT3j+aLkAbxylF9X8enBWk/PbR0u0bDeelQOHolk/f3Jd0B2QJIldNV+sQLsABFZ8hZGDmaQ2pb4QTh7ldri5sdAEkuKptjjDdhf+3NTLSbZE0NXOdhOKZ3agQsRjfRIwrKbHkgh22yKD2yQIkYmOc7gfcKf/fLOD3+56blC2H78UB97V03CWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1S94APbudn4v2XohrlhUapBoULBjOMGBNGNeOD/Dp0=;
 b=JCaI0W20KB6V8rsU/IRzHf8dnhYcm7QktfbqlKkbmM81z3UKsvgGjANI7T8iGDjKQ/yuPP/TUWCv9mdurY6mYdXC6/lGOokQmNl5OqYhZLyP3sov3f882yFIhH4nXLWv/X4AmOw0xqXOyqf49+YZdB2NiwjGKgjM5OfsdkorjTlzfPhAnMyL2AZVpg8EtHMKPDpHIoLpA40FXXpTLNoAhYiDjqyKTFlTVzcY2qk8YJWKP34lhhX6OLoMoVlzBaGwIA/pXqrPmmCpD4G+TZ4k9SkXrWD8JD1CHDkJdNe6TV0R6N7RBlPP9KAQaF5WZ1WkhCtpMgNpm6qDLVs9JJ6opQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1S94APbudn4v2XohrlhUapBoULBjOMGBNGNeOD/Dp0=;
 b=l3xzQwrF2BtJlEN4OFXAXtSzmLZaUHryRCbhjdN+qIe51WU3cepFIgD2HC/lo2FWqo3BkUp8UrTI0BxNcfOB/NdTUjeIDyntQquSt8adSCSBUdQGq52pxXLik1PCOFz3KzWGTVyPCObu7a2TWchYNngdE2kcec1Ak1dJZPohia4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM3PPFCA4893B55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 15:46:55 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 15:46:55 +0000
Date: Tue, 24 Nov 2026 10:46:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>
Subject: Re: [PATCH v23 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Message-ID: <awWxayAlkhX_5zrO@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
 <20261124020752.30551-35-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124020752.30551-35-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DM3PPFCA4893B55:EE_
X-MS-Office365-Filtering-Correlation-Id: 03cdf2fd-8c8b-4bde-1988-08df4a422aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026140227099003|261026130827099003|261026121527099003|261026135527099003|261102123227099003|261022075727099003|261022115727099003|261022105027099003|261022113327099003|261028144727099003|261021133027099003|261021123027099003|261021135927099003|261021130227099003|261021121427099003|11063799006|4143699003|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oT5ENEtwVzsIkOgHnrzLFUMjrJAbA5c24NJbGe84H9mUCFzAm4PDI2tZLxeMmJ3DD/twrmm8Ar4xebjWuUzWoHufogWv6KfzyOkAIXBfibohWRysDsU935opk560XBfBCld1eOQRFJbCrVeHYz4bMe6u83//F04jT1SArL2pCKzJ5rTNl2Ruu2Hlx9/FvqDP9Z+SZs0ncFT26RiPDAz7iHJQhLKDiQ2mBGHKuqK/fS0fJqjQAvmG7zALYQM8BiLUanaP3Ha3yCIymKQ1TmF/DVduoH84aMXbGRWjS21tQXTKFCTmNZ1Wla4oSaxV1KV/AeYTCXKHUzcHOQnM8/RaLNfrFc+NwCsz9B91f3jqta6JEK/YW3zQ9oBKYrvGIJKCjcrFespsc7XSnp8b+AQXt2DI1dztsGwM6GsW1KRe+uA0jI9bsyroqSmneW/c/mnCIu9vry0GdOZjoMprE7YBxnu0zUY/mAzVfxnnqhv7nv5siyTjSevMqokWLXognkA5kIFsaYPB1++arWCPpmOWcoP4h9FEkDjUgAhiUGjgPxhNQ4ABzg6EJQshAbFrcP02Jp1aZL3P2GApby/8Bz/LVeM9YLrvwnpujfjRi5O3/KBmDm7KYa0plwLIpoQpdxnQSGs/aqlqBxGVvaac+YyiFiUHqAzgUepJ9vuXG6M/MNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(261026130827099003)(261026121527099003)(261026135527099003)(261102123227099003)(261022075727099003)(261022115727099003)(261022105027099003)(261022113327099003)(261028144727099003)(261021133027099003)(261021123027099003)(261021135927099003)(261021130227099003)(261021121427099003)(11063799006)(4143699003)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yGGWe3pRQMuEkBCyqWd/ECNRISOuyi1EA5Vk7SsILvygcCqDvU9Zq6ViUE4T?=
 =?us-ascii?Q?IW0cwsS12B7n9qVCZc4BgsQELqXjyl51+2nYZojM30fs70TMrBAl6oXGnvke?=
 =?us-ascii?Q?bpxWwCJS9UQDwLebQIdsqlzQtRMbs1ikGT5t1hOFF8ehcX2z/ZcpXj4rcYQu?=
 =?us-ascii?Q?P4Et7C3gXfg9L/gANwnyf6h/pIj+3nAg3hOe+1jl55aCmEKOjr211PWr9vc4?=
 =?us-ascii?Q?7tLCmA1tDOzjKTowmd+ETl5TUh+XQZsjQdBJNhrum7n6dn5O7shGCnZBchGa?=
 =?us-ascii?Q?77mFJAnVsVoqWE5/8+GVHQhLf0pTsXjzcfWhRiKcXarZ3yA0aIn3SHHmqwrr?=
 =?us-ascii?Q?+qMPevrHjpc+hfScauzgZl/6QG8FUQpRtcZHvu5dr6tY1WGj5Nh/TLPObWOA?=
 =?us-ascii?Q?nTrUKb/sJ3v6jiMSblq2+dmc/8Mz2WG8pjOcEuLffjbcR/rRzxi61yyHDPe+?=
 =?us-ascii?Q?DELKvWppxgkeiqyraBuqvZhWQy6Mvfhqhoq3ZZWhSypwyCQ9V2INiWGIGiKi?=
 =?us-ascii?Q?V5ahVotRm7WL6dY7wBFhCRiDpwedkYZSW7y9lN1rP1F58o9LfZUDvHVVepEZ?=
 =?us-ascii?Q?1x6yjWGs0ZT+s6CJrUlIsefZPLRgZ9polw1CUwS5UOj1ExXVYx+7bBMtfKRT?=
 =?us-ascii?Q?fe02VB0cp4ET9PCGSTgfbiny35ppLnwP5Kf2U9byxWwWDAHwqy2dwinQh4qT?=
 =?us-ascii?Q?oy32fNg4jklx4Gwz9BXVXAGxVBpeNr8lH2KXjhEcGbdOBKvRPBdvxVlTmtRx?=
 =?us-ascii?Q?ik8L+QdLsuL7eBUxiFLhIUAin0D16Zsgzazvte1QQ0eWZfQm1obZYuXmX8iw?=
 =?us-ascii?Q?dZqpj9qj0Y1IVC7BmdhbBRBBzv77BM8TLagGf00PRBVCAIltA68z55HlUGO/?=
 =?us-ascii?Q?IJLrfMIVlp837v7C2QDY1XMqjRXqKRa2fxkt69ADAvhaYhuSsL8VdW6o9ST+?=
 =?us-ascii?Q?VGZV9xz/9MvCD2X5VCvr3JNbfVq+bjX1+b4j/Q58tmuaV2/SjespNMkC3msi?=
 =?us-ascii?Q?3lqqazLgzSl65kLca7ecQ+6DvOhGXpEjFd6B2ZXPK49K4Ib+cQS7t+BlTKva?=
 =?us-ascii?Q?jeSMTicd4wrV3a1NhaLgISPH5SP65fRjUsFSeX8SHVffI4hxpSS2RnukicTp?=
 =?us-ascii?Q?f5nSOeum+7MZorPSLPBuydwsOtQXI58ZQpCX5aF29pJE30zeCBQPXgeYjl6A?=
 =?us-ascii?Q?qvx5PN9xDhUjbQWwXzuWmxq9BhhtzceZ+Y9Xy+eYiI849afZdnP2wUQQ5DLL?=
 =?us-ascii?Q?+3EQQjo5KNjzK9uXm7jlw+D1EmuHEvLIj7Mq2FiT0MXGSoFloAhBfAtet2Xh?=
 =?us-ascii?Q?MJ6ajaMA3q0RhEolMsHSjh+nT4Py2oMdRQpaH2BucywipQLGbNZw7KvFLFjF?=
 =?us-ascii?Q?x8Jv8nGMbN7FQ1emqR2egiQOz1Y62WlmLSHJSVBA/J9NCqqQ6JrJqiEpU/qV?=
 =?us-ascii?Q?1zCRk6VFZ7iDf6EHeV1yUh17a0rXbr1tOt6s3BausdK5tX1f+ULOqhUCHn79?=
 =?us-ascii?Q?ZzOX7D/RMGNzvCDc+rOnBW5k2OS0g6iY+pzsFWLZw9snLJqx3MVsNuWgvPxX?=
 =?us-ascii?Q?go5ZFzXTlE7KbpKrIezAYnEed7/Tt7yPQkUvK7vrhS8WfQC3+ZddoJ1xIPzk?=
 =?us-ascii?Q?U6wO/gjkHg897Sodcn7QvqDI8/EgQKr7n2z4K88nsFEW8rLDeyP5fAIaOjMT?=
 =?us-ascii?Q?lZDpWhioHAtAL79gWFnsxXjkZiSiJJHlvkmLmeVrUMpGcKIOZSD0c7Of2g4Y?=
 =?us-ascii?Q?zth634TeLg=3D=3D?=
X-Exchange-RoutingPolicyChecked: IS8UOZAU1ugIkNen+bwXbvIFwtndWrVXTuYCDzg0mpyHyzt4MiG9jdmKDtSNcoC2RF7AFUD/NmGJQH4IcgRG4/kvoKav9mDBgbLslogZb2CtS7UXP4op0/zjdsjrz1P+etQqEizFBLA1O/qzf13oJw8fKsh8m1uheuuhmG0hOnZO3hf2rWAImMmZbdWvJHMaHrBoWcOjSD0aImylQWyI18pusf4eG0kTdeP0rAAZCp66a4nXUxgMNwbjXOny3hYs84XqVcm5HgZRroHwYplF4o8PYzAFTIWl3y+SCY7l99qFLSfz4wL2K+Ur/ex2HNHkzrAC3uyAIGCh8gg+gDDw9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cdf2fd-8c8b-4bde-1988-08df4a422aa5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 15:46:55.5749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSZ/pJMZOWxKjM2nbZDGkaQUn+mvFR4JA4t5cd0gVhFfiRmy3zc8S3M0N/eAD9RGFSmvAIiYUoqXIfEaeM+nyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA4893B55
X-OriginatorOrg: intel.com

On Mon, Nov 23, 2026 at 06:08:06PM -0800, Michael J. Ruhl wrote:
> CRI PMT support requires callbacks to access the discovery data and
> control areas. Access is a common MMIO area that requires an index to
> be set before access is allowed.
> 
> Introduce the necessary callbacks to get the discovery, status and
> control information for CRI PMT usage.
> 
> Add the glue logic to register the CRI PMT functionality.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 188 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 184 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a814d7151eea..77fbb1257e09 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -4,6 +4,7 @@
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/errno.h>
> +#include <linux/log2.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -344,10 +345,15 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	}
>  
>  	scoped_guard(mutex, &xe->pmt.lock) {
> +		u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
> +
>  		/* set SoC re-mapper index register based on GUID memory region */
>  		xe->soc_remapper.set_telem_region(xe, mem_region);
>  
>  		memcpy_fromio(data, telem_addr, count);
> +
> +		if (device_id == CRI_DEVICE_ID)
> +			xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  	}
>  
>  	xe_pm_runtime_put(xe);
> @@ -358,20 +364,188 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	return ret == 0 ? count : ret;
>  }
>  
> -static struct pmt_callbacks xe_pmt_cb = {
> +/**
> + * xe_pmt_discovery_read - Given a device and an index, read discovery data into a buffer
> + * @dev: valid Xe device
> + * @cap_id: PMT type
> + * @element: element to access
> + * @disc_data: buffer for discovery data
> + *
> + * This is a callback API.  I.e this can be accessed external to the XE driver
> + * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
> + * (drm_dev_enter()).
> + *
> + * Runtime is required to be active.  Calling this out of that scope is not a
> + * correct use case (probe, late-bind probe).
> + *
> + * Return:
> + * * -ENODEV device is not available (hotplug)
> + * * -EINVAL for unsupported device or PMT feature
> + * * -ENODATA incorrect power state
> + * * 0 on success
> + */
> +static int xe_pmt_discovery_read(struct device *dev, unsigned long cap_id, u32 element,
> +				 u32 *disc_data)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	struct intel_vsec_header *headers;
> +	int ret = 0;
> +	u32 offset;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (xe->info.platform != XE_CRESCENTISLAND) {
> +		ret = -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	if (!xe_pm_runtime_get_if_active(xe)) {
> +		ret = -ENODATA;
> +		goto dev_exit;
> +	}
> +
> +	switch (cap_id) {
> +	case ilog2(VSEC_CAP_TELEMETRY):
> +		headers = &cri_telemetry;
> +		break;
> +
> +	case ilog2(VSEC_CAP_CRASHLOG):
> +		headers = &cri_crashlog;
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		goto runtime_exit;
> +	}
> +
> +	offset = element * (headers->entry_size * sizeof(u32));
> +	disc_addr += headers->offset + offset;
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		memcpy_fromio(disc_data, disc_addr, PMT_DISC_DWORDS * sizeof(u32));
> +	}
> +
> +runtime_exit:
> +	xe_pm_runtime_put(xe);
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pmt_read_reg() - read a crashlog register
> + * @dev: the xe device that registered the callback
> + * @guid: PMT guid of the crashlog instance
> + * @reg: data read from the PMT data structure
> + * @offset: which data to read from the PMT data structure
> + *
> + * Read the requested PMT register based on the pcie device and guid.  The
> + * supported struct is the Crashlog Type1 Version2.
> + *
> + * Currently this is for CRI only.
> + *
> + * Return:
> + * * -ENODEV device is not available (hotplug)
> + * * -EINVAL invalid guid
> + * * 0       success
> + */
> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
> +	int ret = 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr += inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +		*reg = readl(disc_addr);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
> +	int ret = 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr += inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +		writel(reg, disc_addr);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static struct pmt_callbacks xe_bmg_pmt_cb = {
>  	.read_telem = xe_pmt_telem_read,
>  };
>  
> +static struct pmt_callbacks xe_cri_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +	.read_discovery = xe_pmt_discovery_read,
> +	.read_reg = xe_pmt_read_reg,
> +	.write_reg = xe_pmt_write_reg,
> +};
> +
>  static const int vsec_platforms[] = {
>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
>  };
>  
>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>  {
> -	if (xe->info.platform > XE_BATTLEMAGE)
> +	if (xe->info.platform > XE_CRESCENTISLAND)
>  		return XE_VSEC_UNKNOWN;
>  
> -	if (IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
> +	if (IS_SRIOV_VF(xe) &&
> +	    (xe->info.platform == XE_BATTLEMAGE ||
> +	     xe->info.platform == XE_CRESCENTISLAND))
>  		return XE_VSEC_UNKNOWN;
>  
>  	return vsec_platforms[xe->info.platform];
> @@ -399,8 +573,14 @@ void xe_vsec_init(struct xe_device *xe)
>  	switch (platform) {
>  	case XE_VSEC_BMG:
>  		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
> -		info->priv_data = &xe_pmt_cb;
> +		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
> +
> +	case XE_VSEC_CRI:
> +		xe->pmt.base_offset = CRI_PMT_OFFSET;
> +		info->priv_data = &xe_cri_pmt_cb;
> +		break;
> +
>  	default:
>  		break;
>  	}
> -- 
> 2.43.0
> 
