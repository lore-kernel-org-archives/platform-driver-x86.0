Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93A731F985
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 19:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786130550; cv=fail; b=F8zQ5UJtwOVAcJu+C0A/k+udWSKKvamAL2NYYme6kcbv1PtS0inloFjYFDi30jENRIwETJgbK7LWIq3aec8OAl0IoX8KDvSi922W/Cmx2zRjZYMsyE+Pcf9npzuMh5+KN3zYI4d0GdOxljzixVCcQre2UczGuiXkPZGrytdrwJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786130550; c=relaxed/simple;
	bh=diHQkuSR/0VfcNK/Y/JtTUb7lPbZAhEQKUeOM4xvttw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WWfslp3J+KmbDBKvgse0LCWZ6jUkcszLY4K3wj8nEEE6UiRz7fqM/q0RqRZE737G05PCs93wtIuO40Il2h3w73zY+2lWlD4JKu26MVxRwutnKz2vtyeNldHUFgiH/1ez4weMaqfpBU52+pAI1BEkRQXd90y481oUnhLedBEvObE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAyJ9mVi; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAyJ9mVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786130548; x=1817666548;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=diHQkuSR/0VfcNK/Y/JtTUb7lPbZAhEQKUeOM4xvttw=;
  b=bAyJ9mViyP3wc6Z90IQJNHNOk9tuhG1B2JQQTyg4cZ7di6OGNIfw8n5n
   ZYEVlzIZNRla1bbMTI3wm5xHf8zubmjVkyz/s3gjPHCGG3/NmhNV70nkK
   DhpT0Fe3REbN4wvg30VDtF6kK3vRImlq7NNEDfBk+YoA5kOZnWyC6EiGP
   JtipyW+aLni7h93krsz71YNh1AVXzwdUXXXUbDS7lwu3wY4V07Mvy4dJp
   f8CrofVgUw8ZKf9Flsr0Dg39pQGoQDDFiLwlEGh5YhjNKtxS+UwTVxiWj
   1/RKpPCpatb1QntbBq4ZViDx+StQCAUJdUM8hzgX9YjrNfq2xl8RKmqic
   w==;
X-CSE-ConnectionGUID: npvTfPQNSJmEgU+R72RDIg==
X-CSE-MsgGUID: kKzD+qeST7GvRE71FJl8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97397355"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="97397355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 12:22:27 -0700
X-CSE-ConnectionGUID: blnjl1wfSAicgG3WOrUu5w==
X-CSE-MsgGUID: Sfgjn5zNRMqKzwrpsp+MoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="261950389"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 12:22:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 12:22:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 12:22:26 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 12:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycXWQjyYiHEzaEUjzf5S6E3aG5LSfc2/yTMrkCs9PuU1eG0NgpdrdiVrYAs76uBEFNgPknfkyARU96eZyQ5vKHlBTEcCv2EwlRqJcxVhdHVhU8+4EaBFgXb2ki3lXe7ytoiQRb3EzcJvBsCCZb9VsnOMb5d2LCnXzDeQebAihxqQLwXGweVySi0FsII2gf+r79yZGPbSPSaVa6vgZaZhJTm/P6Ry6bdPslVdmr+6Lgw8MGsugzet46YvNdXf0YEE6cNqisAj6FPmsylr4lNkvAHJY8XUNxBIhWD3THipEM8DHarJWNWFUEqGHoWUSeX6FKgmhFO1nU1jIWahX7XvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLjaZOvLsb7NiBi7ZdbAgi2uC4Lv9m0TUwGYSWDQ1hM=;
 b=mK+xpf0mQikusXmautPndtkHNM6he8NNZF23riKhSQe8JyGAtOgHCb4g7BjNjTI4Ff7RMqd0N1SEo9jOsCK1qTRUdkw6KuyPbDv2kafpYxkjS/kCgaavj3/mUggxJKZ9YqWOhMLYcyYXoFHl2hqrpzlZhah2CLV78Rb2j9xrBD6cjZk1oXsmf8uVWxU99trkd2KRtlpY91ohRbLpqNqwilwVfs5kDZZVx2iDCtm41U1gcNraXpQ0CiABdV+YuxUUcyZn9PiWtByefZMVVKKfV6FvPkhOnBSvjcl+qclMO7Kid6Hmmf3kaj9siRLqIrNBwk1Utu60qMiDY51d/TZsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7349.namprd11.prod.outlook.com (2603:10b6:8:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 19:22:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 19:22:22 +0000
Date: Fri, 7 Aug 2026 12:22:19 -0700
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
Message-ID: <anYwa4ToCUncHAdc@gsse-cloud1.jf.intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
 <20260806135820.1422040-15-michael.j.ruhl@intel.com>
 <anUBkmSjMOA4wlFk@gsse-cloud1.jf.intel.com>
 <IA1PR11MB6418FD68599875714B8F2B88C1D12@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6418FD68599875714B8F2B88C1D12@IA1PR11MB6418.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 5928cbe2-c4ae-47ea-7546-08def4b93464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7mxJw2/HR55B5Cz1lwNIZacUMDIp+zDUAuCAan4gVjLkRkqwU5XtElYPt7WRRKC1KlDD1G7SqeWyZQPUbl6CdZpN+PTvnB1ltRYhTRSarQRqbZJZBov+AhxjzL5VyBn3Z2yn+1Lzwakcw80LTSDQ1qaevcOqqG+CDAm2C7ox7AiB4bgaGkxQesGv5Un6xQR2HDatO0PMoDusTApsnOs0Sry8mW3F2jbjnYLlpBnUnE1JOcoN7BI6xVyMjQm22qP4+f45JFrzLfACOr4Vf+MnTdkIe6cMBUMFRLMS1Oo2nEd7L/+juExiFTU8tretxhcwVuRpM6+qqpVHH+X4y7L3ubU8n2ZQFojn4Gi/GuAq8jZT9jazV5M7k7xHFdEzBnowV5DgA5HX2+KZF6cIa5/tt3CJBrLLau1IDA3P+t49YCWOl8OEUNApWnxiCyVxyLq6MuBobgLF58AFG01Xf2yuf7aaAW8opgR28Gis/07EW5g1jAD/5Ucb7IKqnfsMzi1huWmORaQyaLAkDe18mxregrgmM4VYeCwJAZtC8WFTkIWX+TxgxbjG6b1vypXqxYFBg3YmKJln467AjsjBQd8ONOhwNmP/TEN6weaf+04ThIsOeWbczF4w7HAKd5R/j5ZUejI/jTGW6aPvMbq1+i3wXR/9uK4YJclWAIQZ6cc3btI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LgpTjPkFC/0PTEQLWdjZvdV+9o/6Nf+zLtOwOb591ZBpmnp4Mu4XmoaSyNUZ?=
 =?us-ascii?Q?WWwV8KzVqnxNJeBN8hW9neuL6xw3Je0odmr95GSmlFy9XNusVBOM0tyx5cm0?=
 =?us-ascii?Q?x20MSJNx+rvUiM/eBAW9h3VbuweQFmCco2zAwv9Bknj/Asg2JnqcV7mfMd4a?=
 =?us-ascii?Q?cw8z1fk+VpeJGz1Dilg09a4ur8djY8qJ8dti5YmMupnJ8OqFBVxh4ajZ3pfs?=
 =?us-ascii?Q?xE0odBupbsko1dEJ6zIaZfkNexbrnJRUDY5u3DLBDdo6XOt7B4HV3Q2OeAvC?=
 =?us-ascii?Q?rVY3GIAe9HB2TZTPW8onYP5J7JDQFGTTgcJEHj6sP0eA5Km1QTMjj4FVS3Rc?=
 =?us-ascii?Q?KFcVgf9zNoRkPtPN+FbtpNtn7n4UhQp6AZR1a/o3PLfp2AnMXAn4nYc/5CHo?=
 =?us-ascii?Q?MPUp2u6Od7wJy5+4L0MPVCkdLGP+da4DotBBIibDFuBqLy8aQmTApibqbw40?=
 =?us-ascii?Q?POcwvWUyLrEjYIEgEynJea85lfjtj5ueDorKW8Kl+oJ9pEDecxNuYA9hJ1RM?=
 =?us-ascii?Q?RA3H1A2UnSl7/c6/Ki8yZTN/lX6J2cqcUAlXzPyRd6rdI7znuJhv5X3BMol8?=
 =?us-ascii?Q?BAIL64SS9gzj01e11TVG5ByQr/8zEnjuZrnbnZHCN7BY3qJfnDj8yzvzJ/N1?=
 =?us-ascii?Q?l4sOlF+DCDvxKTtlrL3imR/yEWuoxBx+koSeQD0Vz+u941NLyeHqIb4rCm+3?=
 =?us-ascii?Q?is6yxgJBVcKICsbbEKRPB8VzaDOMC1EOdxA1GEuofyhoSoHySjIUlJV9ph9P?=
 =?us-ascii?Q?yhu69jC+Pzrkn3Iyqk4vBoBo1hX+rUE7gjFrlKi436ToY95YagULAYa2HD8W?=
 =?us-ascii?Q?I7X8/K/CYtvtBPV/3KM22t9Poc2RG0IBom7dJuLQ4kpAKQnKNOguYSqe+ogU?=
 =?us-ascii?Q?d4JuwVtX+rgBCVutHLWCPDz/1iWxJ2zVvU4rzzD9ABkVlvm7DtA6gHeZkyWo?=
 =?us-ascii?Q?GRapHziWTCzoaoATkmVnC+aYTrlTk3StghbuBjk40cyB2y/oSkKS7I8ZJONs?=
 =?us-ascii?Q?hk9EFQsSwkDH5/8tAHXZ6OLtzJOxgcC+E10MCxeawkvVhaAFCGA3PhFPZQip?=
 =?us-ascii?Q?JReWahaQLzwOtlcsMFPbzA0nR1ENJABFlOWqNrqRoRpuylwfqmjwj+BeXlMD?=
 =?us-ascii?Q?fZVAeKeYolsuVH3VBU6OPA6cAsv/8U6YWG5TDLe8b35y56KblSZJAp85t5Wp?=
 =?us-ascii?Q?HaeLIGSgn7/wph3sc44aCaw72FTcmdf/PoqSEsVaLKmqty3gu9LmQZk5A6bK?=
 =?us-ascii?Q?+7FmhzV39G/CSis7SYfYvQ7YRVU+5OCFmYm9B7uDrXAJwBzR0UzB0YUADhVK?=
 =?us-ascii?Q?weTVZnC9Ln9bZam+mlh3v/qZMczVt5C1h/6V4Nbv59rPCz8HWXizSAQmoXc8?=
 =?us-ascii?Q?wPaOT6GSBfiHy9cOibbFwnFtgO6ypmfw7Rwi7rEwelEL9ajbK4Eyvf0hv8LJ?=
 =?us-ascii?Q?PAa4jOa1lpjmrsjxb1c6o2hBuuMzsh1OMbqzg7wolIyRv9bxho+MnJNIL1Z2?=
 =?us-ascii?Q?XyZzCk5iUCQRPRb3kUIg9B5h2YneoxGlMKvkvM4yDfBtJ4w8fNCnpXOgjkw6?=
 =?us-ascii?Q?t1Uu4CtYquJ2iP5S0O7BrQhVmFdltu+oq+GPxRHRFgpchZCq4Y8Hmu6hHZjL?=
 =?us-ascii?Q?/SBG8s20u/XdMHLZbypd5/chKpbfa0W+Bwjg5Zunb/CpMLs1bhqe4XnJtur9?=
 =?us-ascii?Q?hWpKSW3frAyJcvybIX3GQiN3EK/85lrB20U5GaFxQVZlCc09quqPc3AGgVHN?=
 =?us-ascii?Q?N1W08+I+RfOjP4z44QNLHkyWuVfCatk=3D?=
X-Exchange-RoutingPolicyChecked: eDmC13BOZ65GPp1z1XXwPvF0Ub0b493WkseNxoTr8hrSSNa7DOOCJMoHjkEKdh+4vHFjROjWi4i3IGCRHq7n5BG/ENoG99j0oFbdavV8ht4WEJQ99ZFJ9ju52Dx2p1TbsOMJNwgQmzyODPtiERvvkgfrztqDJYOgj1vKAXRkbNv4AMN2h5hVh4ICy2LySc82u3GTYLLNsTIIH58DRzwb2beqKBekQGqb+w2JzyYZpXzS4a1pttrmUmuMd5sx4LPdEeHPH2NHzjzRYGldrOSZlpuso8kMcFN0K6JiiuZtXQ9lXYzT9HcYrjxQ/e6hQLacVLl8wSOeRhKvgjInOa5MDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5928cbe2-c4ae-47ea-7546-08def4b93464
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:22:22.1062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzbvwFt3qPdAIAf5+MH6CM/EekOp0mUDCOcB0i2QlrtOzANWGXQALfXuZGxIcmOjsEA/Jqy60MQk8NpXjHiVGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7349
X-OriginatorOrg: intel.com

On Fri, Aug 07, 2026 at 08:00:40AM -0600, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Brost, Matthew <matthew.brost@intel.com>
> >Sent: Thursday, August 6, 2026 5:50 PM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
> >hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Vivi, Rodrigo
> ><rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com;
> >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
> >Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
> ><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> >Ausmus, James <james.ausmus@intel.com>
> >Subject: Re: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
> >
> >On Thu, Aug 06, 2026 at 06:58:26AM -0700, Michael J. Ruhl wrote:
> >> CRI PMT support requires callbacks to access the discovery status
> >> and control areas.  Access is a common MMIO area that requires an
> >> index to be set before access is allowed.
> >>
> >> Introduce the necessary callbacks to get the status and control
> >> information for CRI PMT usage.
> >>
> >> Add the glue logic to register the CRI PMT functionality.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_vsec.c | 85
> >++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 82 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> >> index 3849f99c1c91..b84ec9088de7 100644
> >> --- a/drivers/gpu/drm/xe/xe_vsec.c
> >> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> >> @@ -320,17 +320,90 @@ int xe_pmt_telem_read(struct device *dev, u32
> >guid, u64 *data, loff_t user_offse
> >>  	return count;
> >>  }
> >>
> >> -static struct pmt_callbacks xe_pmt_cb = {
> >> +/**
> >> + * xe_pmt_read_reg() - read a crashlog register
> >> + * @dev: the xe device that registered the callback
> >> + * @guid: PMT guid of the crashlog instance
> >> + * @reg: data read from the PMT data structure
> >> + * @offset: which data to read from the PMT data structure
> >> + *
> >> + * Read the requested PMT register based on the pcie device and guid.  The
> >> + * supported struct is the Crashlog Type1 Version2.
> >> + *
> >> + * Currently this is for CRI only.
> >> + */
> >> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32
> >offset)
> >> +{
> >> +	struct xe_device *xe = kdev_to_xe_device(dev);
> >> +	void __iomem *disc_addr = xe->mmio.regs;
> >> +	u32 inst;
> >> +
> >> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> >> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> >> +		return -EINVAL;
> >> +
> >> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> >> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET :
> >CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> >> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> >> +
> >> +	guard(mutex)(&xe->pmt.lock);
> >> +
> >> +	xe_pm_runtime_get(xe);
> >
> >We have guard(xe_pm_runtime)(xe), and this should also be the
> >outermost construct (i.e., do not use xe_pm_runtime_get(), as it can
> >wake the device, while other locks are held).
> 
> Hi Matt,
> 
> I am using the _get() routine because the device MUST be on for me to access the
> registers.
> 
> Does the guard(xe_pm_runtime)(xe) turn the device on?
> 

Yes, it would be same as:

xe_pm_runtime_get(xe);
mutux_lock(&xe->pmt.lock);
/* Do something *.
mutux_unlock(&xe->pmt.lock);
xe_pm_runtime_put(xe);

> 
> >So this should either be:
> >
> >guard(xe_pm_runtime)(xe);
> >guard(mutex)(&xe->pmt.lock);
> 
> Ok, this makes sense.
> 
> >Or, like the other in-tree usage with xe->pmt.lock in
> >xe_pmt_telem_read(), which calls xe_pm_runtime_get_if_active() while
> >holding the lock. This is fine because xe_pm_runtime_get_if_active()
> >cannot wake the device. This is most likely the correct choice, given
> >that this is a vfunc called by a different driver, and we have no way of
> >knowing whether that driver is holding locks that could create
> >problematic lock dependency chains if we wake the Xe device here.
> 
> For telemetry, the data read should NOT happen if the device is not active (so the get_if_active usage)
> 
> For Crashlog, I have to get the data and have to make sure the device is enabled....(see patch 3).
> 

If Xe gets hotplugged nothing is going to save you here either, you to
some extent you must deal errors at the caller, more below.

> Do you have some thoughts on the correct sequencing here?

I'd at least swap the order as suggested so that the Xe code isn't
internally waking the device while holding locks, which goes against our
PM rules.

I'd also consider adding internal hotplug protection, unless the caller
already provides it. I don't really know what the PMT code is doing
here, so it's possible that this path is already protected against
hotplug events.

So:

bound = drm_dev_enter(&xe->drm, idx);
if (!bound)
	xe_pm_runtime_get(xe);
	mutux_lock(&xe->pmt.lock);

	/* Do something */

	mutux_unlock(&xe->pmt.lock);
	xe_pm_runtime_put(xe);

	drm_dev_exit(idx);	
} else {
	/* Device is already unplugged, caller has to deal with this */
	return some_error;
}

If hotplug protection is needed here, then xe_pmt_telem_read should have
this too.

Matt

> 
> Thanks,
> 
> M
> 
> >Matt
> >
> >> +
> >> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> >> +
> >> +	memcpy_fromio(reg, disc_addr, sizeof(*reg));
> >> +
> >> +	xe_pm_runtime_put(xe);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32
> >offset)
> >> +{
> >> +	struct xe_device *xe = kdev_to_xe_device(dev);
> >> +	void __iomem *disc_addr = xe->mmio.regs;
> >> +	u32 inst;
> >> +
> >> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> >> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> >> +		return -EINVAL;
> >> +
> >> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> >> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET :
> >CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> >> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> >> +
> >> +	guard(mutex)(&xe->pmt.lock);
> >> +
> >> +	xe_pm_runtime_get(xe);
> >> +
> >> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> >> +
> >> +	memcpy_toio(disc_addr, &reg, sizeof(reg));
> >> +
> >> +	xe_pm_runtime_put(xe);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static struct pmt_callbacks xe_bmg_pmt_cb = {
> >> +	.read_telem = xe_pmt_telem_read,
> >> +};
> >> +
> >> +static struct pmt_callbacks xe_cri_pmt_cb = {
> >>  	.read_telem = xe_pmt_telem_read,
> >> +	.read_reg = xe_pmt_read_reg,
> >> +	.write_reg = xe_pmt_write_reg,
> >>  };
> >>
> >>  static const int vsec_platforms[] = {
> >>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> >> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
> >>  };
> >>
> >>  static enum xe_vsec get_platform_info(struct xe_device *xe)
> >>  {
> >> -	if (xe->info.platform > XE_BATTLEMAGE)
> >> +	if (xe->info.platform > XE_CRESCENTISLAND)
> >>  		return XE_VSEC_UNKNOWN;
> >>
> >>  	return vsec_platforms[xe->info.platform];
> >> @@ -357,8 +430,14 @@ void xe_vsec_init(struct xe_device *xe)
> >>
> >>  	switch (platform) {
> >>  	case XE_VSEC_BMG:
> >> -		info->priv_data = &xe_pmt_cb;
> >> +		info->priv_data = &xe_bmg_pmt_cb;
> >>  		break;
> >> +
> >> +	case XE_VSEC_CRI:
> >> +		info->priv_data = &xe_cri_pmt_cb;
> >> +		xe->soc_remapper.set_telem_region(xe,
> >CRI_IDX_TELEM_DISCOVERY);
> >> +		break;
> >> +
> >>  	default:
> >>  		break;
> >>  	}
> >> --
> >> 2.43.0
> >>
