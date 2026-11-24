Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558470;
	b=Oti7qR4wfwKQDV18vyrzyl6IQEmaC2OiMy0Zd2r5VJBSs25vBk9XTUq9mQkfFY7BC3wS
	 aP2RLVKePjotB2Eqy6REPXIk/NPDnddOg1t2VpUQC1W/gzXpsqwx52VJjjCGWvJDoMhY7
	 K9z5Dg+Q120Oq8QtWt0bFwc5ODa9dIIsDUlNpK2BFmJlPbQdFXesHYdWlzftkUA2ujJF1
	 i4zjt/5dpV+j7fLe9mPsH3VoWRW+9Hbfmu7ruZlOa2/uYafpwVhZQRsB0BIcRJT+vMGIw
	 VTyzJonvNcSL9Xav3WS1wxHPk1Wt3DkM4dWR2Vj6eO5BFOD3JX9OiFA2AHTqc3Sye4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558470;
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
	bh=lD8sciKAa3bzK3O71Cvxh1QTQhjBYc3QKEUTICJlaeA=;
	b=L3byjJK/+ET+BvzPYA97jI0tTeKjGT0qwZD/uPAfECXvON+vMkaBaGhqaym4GfMoILEF
	 hH+1vpoNDaFbUJiVJYjo8YxHYv+RLUAVcNGrlig7nu6v8oxAc7/6A5qoXVnwT1sBLwBZz
	 LHL0ylZlgJaEZPBZ3wPK50bx39yuw1O5vA/jBfww0jOVww7puzdcN8qkMYACjoerl40CW
	 1eZE941ERzEN1Q9dR5YiUs1sstpSfjvOhKbVA9c/oyv/jxYMBC/Akz74DdEdTxZjhzETu
	 42IMuEdB6y6FC4NsLUMwn30KiavzwSNaSi9Ds8+yJN6BUhm+5vGDh5WL1ya9VRKFn/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JSVOSSnP;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XhwOcRh2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0821606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 22:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0821606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JSVOSSnP;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XhwOcRh2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795558470; x=1827094470;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cYeFMPxi3JxEMeMgXDMrExIHycIzvnQoZvV94eX1BaY=;
  b=JSVOSSnPAiiTdKq3WMOhvkKenaruVoitiU5Di0xq3V/3Evu7Im4fw76X
   j7wnjSekD+3hjxG67eJuhNOn3HaTF1RHBBWNvEOvUr+VMq2AT2EypKMZG
   qT+4WXO8Cu4NIc2kv3gmrJchlwvvxOd9lCME3HLegbEy7UY09aEoibTl8
   NB+Sbj2gbr1Q9cVuWvpGG2vOFRpTfGBJnKgAlVuFafLLhNcP+u2mwXXb5
   yPiI5DZN7UY0GXRTGB9nOXSydT2MmckDKA6Inm9QL9Fx4Oa9a1dBlyZGw
   yI2cvVaWZvdauzqkE6wKtV9/yQ5KktKrOlEEpVg7GQyQlw3Pwh0Wy5KNz
   g==;
X-CSE-ConnectionGUID: 61ABxjOpTcWnvrhFw75nEA==
X-CSE-MsgGUID: 8FPooWzyRMmDjuws10yJlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4393099"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4393099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 14:14:29 -0800
X-CSE-ConnectionGUID: /uZ+IhLDRRqP7zb6DEvnwg==
X-CSE-MsgGUID: I3vuthumRZasYgS6DJ6DpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11672962"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 14:14:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 14:14:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 14:14:28 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 14:14:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+VhGc/j1NV31R5oCDnBHYFFVgujKiN3Ll42c0srXCQfv6nwlIN3DoxnCohYFHFCm0ZpMBjKYYAm5HdrRZKo21MFAAB3F81wxwKN8AIGvOj98Cq70NJaOewLAXHPjxVJgNVlb3GvAcjQfcePoby2tCZJ/umKOeWzRU1+ygZxvaMAM6VDjBYlROIEwG2wJPCC7U+kK+z5TAVrSc3umGrdxL4S45NYElk2SnOOGSbGbAEUFMeN+uRtfzoL1A9Hu/McD3WerGxESQUbuWNkw7i16X85qlzmJilxq3GgIWkuUwVw1Zovf0a6pO9m01CFzxlaWzWGEeK4AjHOvNqgCmGYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lD8sciKAa3bzK3O71Cvxh1QTQhjBYc3QKEUTICJlaeA=;
 b=uP3pjdinfioaVo2jjP33d8ownuFRNc9okgEIc55a4+HU+6Yml0EMhLkn3a2GuHs4yckUAd/HXbcZ0ZOzhhBCyK3YANxAkKBAjwXPyT0OxBRMxUrDJs3rxGirwhemMTvJJZqQHoKzZ2RXujIaFRyArtfF0RxfJFDimtgcgzSo5V3N7iCNBQlNxS4YYhEuxrUvTs9H4AsvnsSBRHEc8jADHNKni9DBrh1j0peiABeG6zAmi5sQvci0VkFl/80ItqsYjU3geKhRgkZT83NXYzFgXej8k/eZmgAll7gFraQfeMc3PXNgNn+c2AjzbK8CREx6UNCCplxkL1dCWjgkxpw8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD8sciKAa3bzK3O71Cvxh1QTQhjBYc3QKEUTICJlaeA=;
 b=XhwOcRh299JCEPlbw+JH9/MMordoOIVH600YCM8vIwW2W/kxUcOwBvA3CqpXaTKHWN0QTyAVA/bsqbJX5P0BP8Lg2S4CVb2pXbu52DiUYIKkR/1N6ax/YwgWBBwkLsWcUGokanaxlsJlsnPErSx3Df1eExCplcrYD7shPwtLmG8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 22:14:14 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 22:14:14 +0000
Date: Tue, 24 Nov 2026 17:14:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>
Subject: Re: [PATCH v23 00/19] Crescent Island PMT support
Message-ID: <awYMMjf4nqToGAiO@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To DS7PR11MB5990.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ce427e-711e-4489-d5c7-08df4a7845de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|6133799003|261009223027099003|261021121427099003|261021123027099003|261021133027099003|261021130227099003|261021135927099003|261022113327099003|261022105027099003|261026140227099003|261102123227099003|261026135527099003|261022115727099003|261022075727099003|261026130827099003|261026121527099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 94aA8v+1iT1NFhfiUvr9jG8L0G2IVsL8O2xHm/HyOawqd+aD9VN8DQRiUhzJx46GRtdwEhojNP3bXn/+Wsuv9pB6MH9bIiQG6mzdpoFmmQCDsQpzunEnk7Zc1j2RHxGn9tFgxmUCJ5hv+Lzcl3Qka/oOMTUupTKulHAB44XJHbmz4LKanGCnw9tR8YwcESsLfQHNADWl8m8Cb7T3YpwQkhun7aAQPTk/+2iR/HypNNXQOKFzTg+ph7czXayjCXHcSe550Yy/vujxWrU96EPjEoKLnvZwnUg7Osla1UHkwDv0yKpczGGQxS3PfIZ7Ev/Pe0js1umZmIihkK2Z3D3dihUwFcDKv0xTfhbV6i+Q+4wDeDU8b6I3481BmtPiLVDP/ZK5mTkeQgpvC1PJvf4FuNZ6h+bfrkW2WXHlVCQ4IX19E2GwXAu0m5USUs7UtOqtpOdyBkqV1oIZ/KxP3ZMu/IkC3XkXFxLKgVBglVhxcJLhLz26nGHweZ+8fFsZhdXtNVSdB34KUYecIRZKuo3PVFdEOrzdV+WmjYI+gCMx0fVyRt73R6vQacZG5SlyTshH6m+SBSh8Piwqxc27619PKZvUbozE/6K/gnKKXF7gnPQMPSZQz9rrtl3wn3N9dq27EdV1wnQlPCJM/Jva2Zd2VU9Suft66PQeJMPmBo7jbm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(261021121427099003)(261021123027099003)(261021133027099003)(261021130227099003)(261021135927099003)(261022113327099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026135527099003)(261022115727099003)(261022075727099003)(261026130827099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QTJpfoA16/2yixtk3DHdvySg2uLptmHR3/YLGlwK1p55z+Evh6KdjSCuWGFI?=
 =?us-ascii?Q?Cknhb5M9siYeViJL/eWDlPR5VKJ140GkOsRpdBOYSlyrNQglccpQozPhytrf?=
 =?us-ascii?Q?H/xWUkOtnj33kYo2CZhRhcPh7IA3yITNVTYbxFISDidJZ0HHmLtg2cEtzbla?=
 =?us-ascii?Q?JGp/v8L99sk4IlgR+tbaNSwYttZvEe37n2QobzdqPTTEPPZUoCjhqs6wrinV?=
 =?us-ascii?Q?1wPXE+Lb1HJ2s0GPHcITCMIgCVzJRrOhc1ZNST2OnQnakdtlx0DKkqFPUGJ7?=
 =?us-ascii?Q?RcVX7BQuz+Pt6u2HytGqTuey3uyxFhjvPMQwyR7Cx+qDW/wgSiOxXNeQuFyg?=
 =?us-ascii?Q?nbpCLEDSE2LaZjRXgx+zSfeLSxn3uNtFhdHAM608xpDHC4Xymq1BP+9j0vel?=
 =?us-ascii?Q?r07uM6EiPTp0yeCG9H8GyoIQKL4HsSI4Mhxb7pMG/dJO+O8qg7B7+lwJechd?=
 =?us-ascii?Q?C/5f/LQrP7AXHgyAGlOPa1kRNFUAR3yCPrRVc5OF+7KkNn7ID3w0uNSVcuqO?=
 =?us-ascii?Q?9csELa3MuNQzF/8pkiUmynZHRedl9/tTVg5HaECWHnr2fFVzq/uabd0hTmOE?=
 =?us-ascii?Q?6pnhaXQk/ldX3X4+5r4hGgpdt50shyFmtosc/o2l1G8LkenXLWbxbsS1GAZM?=
 =?us-ascii?Q?dk+umx5KfEH0zEe4M59d4WK4pkp+DQu/ne3T8ITe4hISJ50FZNhr8KZcdqU0?=
 =?us-ascii?Q?wtZWz1v+5n+X/Cdi2vbaTlBoru4VpvkPii7k0VHCUwyFXnE/U5GNwsY5CGlq?=
 =?us-ascii?Q?nosZ2868oNg5IHtd+pdTiqk0CofriZ9Kb9fL3GXIFBv2hNUDo7+1YWaFrlDO?=
 =?us-ascii?Q?x+Gi9s8T1jr3y3cwcbIgp7a75KF9z23KVGlvGmn6f7gjU1zPiSgNhJ3a+Sbx?=
 =?us-ascii?Q?k5SJ4LOBS7idS6FTgYZ2GB47yPBnp5mvqN9iSBdIYqQ6/4QBpoJ9l1up7oSW?=
 =?us-ascii?Q?ipE3vgFQQ3lZQK6BsE7bJHNJVRQjvzFIovq4vcYY0l5T/HeHccyArO1pgZg4?=
 =?us-ascii?Q?o1Q+mz4n53Bu4K7KJVWQcgRu5wYkrQ/U5q1Md2oOvNF7loWtv/gAWkIBwcF3?=
 =?us-ascii?Q?Ll67lLmVxhS+9IzGy9M3tNs/DuqueLsBvU054nkg8fzaR+aDw1xeGbM3NEYS?=
 =?us-ascii?Q?DUKilQspfK8UNYHKMolrGtpGcKP07Dot86LWNXNAN/lwUzHxJNUb/lv6X3rf?=
 =?us-ascii?Q?dBg+DRvQH9XBFtRvUl7wfz7FkB+wrKGI8nqSPK6Z03e4GOjlZ7Hvg2r5PTwE?=
 =?us-ascii?Q?jISJb/XyriY89wsGh5tyj+Oy5amdVKJCn8lvy87FirKrBRIAy9gPf9tc0H1n?=
 =?us-ascii?Q?VXZe6tC2jHpVTvsE41WIrItpLqR00oMLDuHIwdLkdrEaw/lLfVGzPIaO3dmj?=
 =?us-ascii?Q?QQoL1fSSpxRFyW0pFe3UB+V38SOah385gn/O560jyO5Xm6cQN01XQ4J1S9Ad?=
 =?us-ascii?Q?vtNao8ATooGpeHeoI9juC41xJ1XRIf9XsO6oyvJJdkjLsaAwQf2FTqz72rsh?=
 =?us-ascii?Q?AmHu5K3+0MrEy857yjL08EOyfQxRcMWkJOJb9LszAUVL1tvXAgnr2KKjfW4z?=
 =?us-ascii?Q?jlacIqcAcbL//Pfnfz49HMkLvkkhhmSSNs/6Q7JKvRgi5QofUenmJodQhez3?=
 =?us-ascii?Q?1/q8veThrz9rsAeW86CP4zrvjvDh8VYUV4VwbovrklWV2KpPx/eRgs1fOcd4?=
 =?us-ascii?Q?E6U9HgQRS8OWI5Vv1DCJqX19JJyCHlQF2HSzJ0qsY3lJDGkkVgdFR4xgALPe?=
 =?us-ascii?Q?UsPRkKH9Rw=3D=3D?=
X-Exchange-RoutingPolicyChecked: dtdgMDHiNkwqDkxTcEf+Wibfi1WdMd53peKbqXGiGeM7H0NjZhGIZ5owBgaqIK3t2z4IksTJ+NIOPUcqDGafkfwTRfUBmeZsZ+4lxSDKF5TMHJf4qDarz6uzb3SBwNoetjlVS0Ow5XQqc/AA0qDJiIgmVyGioR6D+1nC4Vpfc76ReXhOSQDCYBk/elzXq4hvext47y1VStnJ1dzIb/cqFk0g3fOaSqPwOKICHnZfCEAkZ+NsBbA6QrYjxgyH3ezGgmlTvzLqCWJBs0ulzPz3qRQLOlu/IsrdcMYNwRB+dn58pd+XW6vquBWz/PAutykT9GhF3VjoyJtf841gDKGqrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ce427e-711e-4489-d5c7-08df4a7845de
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 22:14:14.1680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXQ+SOiuIGxSYEIm2bLOOUvpiGpcA/FIQEIDgpoDku3KvTnyesNXzi2pzl71T397kCVbJvDjIOVgnfYhHyyhsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
X-OriginatorOrg: intel.com

On Mon, Nov 23, 2026 at 06:07:52PM -0800, Michael J. Ruhl wrote:
> The Crescent Island (CRI) GPU supports PMT via Xe driver
> registration.
> 
> The CRI PMT MMIO mapping is shared for each PMT feature and it is
> necessary to set an index register value to access the correct memory
> space.
> 
> The PMT driver has a callback infrastructure to access data areas with
> driver specific access. It is does not support the PMT control access.
> 
> CRI discovery/control spaces are part of the access window so a driver
> callback is necessary to allow for the correct window to be exposed.
> 
> Add control path callback support to the PMT driver.
> 
> Add CRI PMT discovery information.
> 
> Update the Xe driver to support the CRI PMT access.
> 
> The crashlog access needs to be done with power enabled (telem is only
> available when the device is powered).
> 
> Determine which access is requested, and do the appropriate power
> request.
> 
> CRI FW is loaded at device power.  Support the late-binding API to
> wait for FW readiness. (pending sysctl patch set implements the API).

I just pushed this series to drm-xe-next.

Thanks for the hard work and patience.

> 
> v2:
>   Address AI feedback:
>   - add missing entry->cb check
>   - address SRIOV VF concerns
>   - use xe_pm_runtime_put instead of _get in error path
> 
>   Address review comments:
>   - redo power/lock sequencing
>   - support device hotplug events
> 
> v3:
>   - cleanup power manangement flow
>   - fixed an out of order power management locking issue
>   - add a GUID caching mechanism, for GUID read
>   - removed unused parameter (mmio)
> 
> v4:
>  - address various review comments
>  - refactor crashlog to allow for return values
>  - for callback usage, decouple PMT remap of data areas
>  - use IS_SRIOV_VF() rather than expose soc-remapper internals
>  - separate locking fixes intos distinct steps
>  - refactor define update patches to seperate BMG and CRI updates
>  - separate internal GUID into separate steps
> 
> v5:
>  - removed callback helpers
>  - do not return error message with sysfs
>  - fix missed return code check in trigger_store
>  - return error value not false
>  - use DEFINE_RES_MEM
>  - document when base is unused
>  - return error on invalid GUID request
> 
> v6:
>  - fix enabled/disabled inversion
>  - fix missing DOC reference
>  - change memcpy_to/fromio to readl/writel for register read
>  - guid cache comment and update on valid guid
> 
> v7:
>  - reordered to have BMG updates followed by CRI support
>  - separate base_offset usage for clarity
>  - added EAGAIN usage to block uninitialized use of the API
> 
> v8:
>  - fix punit crashlog offset (should be 0xE60 not 0xE78)
>  - remove EAGAIN support and re-order probe steps to initialize
>    VSEC before other features use it
> 
> v9:
>  - added appropriate reviewed-bys
>  - use dev_err instead of pr_err
>  - enforce defined base usage when callbacks are in plcace
>  - move SRIOV check to get_platform_info
>  - assert SRIOV for API check
>  - use scoped_guard() where possible
>  - update to use correct sysctrl helper
> 
> v10:
>  - fix incorrect return type (broken in refactor, int -> bool)
>  - fix incorrectly documented error return values
>  - doc text cleanup
> 
> v11:
>  - add reviewed-by
>  - fix minor checkpatch issue
>  - use xe_assert() for a consistent API check
> 
> v12:
>  - add survivability mode support
>  - add reviewed-by
> 
> v13:
>  - PMT patches (original commits 1 - 5) are merged upstream
>  - resubmitting XeKMD patches
> 
> v14:
>  - address AI review comments
>  - init soc-remapper in survivability path
>  - reset soc-remapper index to the discovery index after access
>  - re-order read/write to eliminate need for goto
>  - check for signals in wait_for_fw
>  - add appropriate doc updates
>  - use system_freezable_wq vs system_wq
>  - cache survivability mode to avoid error path issues
> 
> v15:
>  - add/correct fixes tags
>  - replace devm_add with xe_vsec_remove() to avoid error path race
> 
> v16:
>  - fix xe_vsec_remove path to verify CRI usage before cleanup
> 
> v17:
>  - one last AI review fix
>  - return error GUID == 0
> 
> v18:
>  - use a callback to prefill discovery records
>    this corrects a locking issue during probe
>  - use the prefilled header for crashlog
>  - setting the soc-remapper index now only occurs with the lock held
> 
> v19:
>  - checkpatch issue
>  - submit to the correct mailing lists
> 
> v20:
>  - address review comments
>  - augment commit messages
>  - augment usage documentation
>  - STATUS_IDX to ACCESS_IDX
>  - return 0 for device hot unplug
>  - fix guid error path
> 
> v21:
>  - add reviewed-bys
>  - return ENODEV for device hot unplug (bug was fixed)
>  - check for power state active during discovery
> 
> v22:
>  - updated commit typos
> 
> v23:
>  - fix broken error path (AI found)
> 
> Michael J. Ruhl (19):
>   platform/x86/intel/pmt: Introduce a callback for discovery data
>   platform/x86/intel/pmt: Use the pre-populated header info for crashlog
>   drm/xe/vsec: VSEC requires soc-remapper
>   drm/xe/vsec: Do not register BMG PMT for VF
>   drm/xe/vsec: Correct locking order
>   drm/xe/vsec: Use correct pm state get
>   drm/xe/vsec: Add DOC text for VSEC
>   drm/xe/vsec: Support possible hotplug exit
>   drm/xe/vsec: Refactor BattleMage PMT defines
>   drm/xe/vsec: Update VSEC probe order
>   drm/xe/vsec: Add base_offset to allow for more flexibilty
>   drm/xe/vsec: Support Crescent Island PMT
>   drm/xe/vsec: Crescent Island PMT decode
>   drm/xe/vsec: Crescent Island PMT callbacks
>   drm/xe/vsec: Support late bind fw information
>   drm/xe/vsec: Add PMT GUID internal access
>   drm/xe/vsec: Update PMT internal access
>   drm/xe/vsec: Refactor platform check
>   drm/xe/vsec: Support survivability mode for CRI
> 
>  Documentation/gpu/xe/index.rst             |   1 +
>  Documentation/gpu/xe/xe_vsec.rst           |  14 +
>  drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
>  drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
>  drivers/gpu/drm/xe/xe_device.c             |   9 +-
>  drivers/gpu/drm/xe/xe_device_types.h       |  11 +
>  drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
>  drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
>  drivers/gpu/drm/xe/xe_survivability_mode.c |   2 +
>  drivers/gpu/drm/xe/xe_vsec.c               | 664 +++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vsec.h               |   2 +
>  drivers/platform/x86/intel/pmt/class.c     |  18 +-
>  drivers/platform/x86/intel/pmt/crashlog.c  |  24 +-
>  include/linux/intel_vsec.h                 |  10 +
>  14 files changed, 736 insertions(+), 96 deletions(-)
>  create mode 100644 Documentation/gpu/xe/xe_vsec.rst
> 
> -- 
> 2.43.0
> 
