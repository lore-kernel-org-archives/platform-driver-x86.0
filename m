Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D613D5C05
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402140; cv=fail; b=UgHOGssf6X+cCxQIPrestJpj5PM2x5FqsUWyo4j6DuTZhASBPvDadaceywU2ssqHTEVfbkhbVntpA7D7UE+RJD2YvYgG4h8836/DiVY/+ztk4r6tgx2Dh2Swx/wtQZ7qFZS2c4dhT4Kid+rIUe3uq0ktq+GYo/DU7v9HCfjidxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402140; c=relaxed/simple;
	bh=g4myNSkee9TgMc1Z7L6sGne+I+5CEaVUq+nYzo/cutA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XjE0MrMkEB9OhpKUChm3U98iBpOPKYMXSiiUZury9FgYrkfhwMsqGQGdvnE33hqhoT/mGcEHz5v1FMSPzcvR3rpB3ATe74DtHi+ir8Pjx+lxTmcb/ITzFCBxKvjUe/Nl3JwFttvqBBddQ//mItz/BUVii0Bo97HAQnLWenlVdc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBP3VyRE; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBP3VyRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402139; x=1820938139;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=g4myNSkee9TgMc1Z7L6sGne+I+5CEaVUq+nYzo/cutA=;
  b=YBP3VyREs6NhnHdOogqB1tbi6MCCozmGg2Sk7tgFc3YUFrHX+CZBJ2JD
   qRAytsbb09t43v+Adj5YkpoVCaV60MncA2tz9CuhvnUvudyNrTBhrkG5m
   OSFzWk3aLCkpB1SswDvjudOP7bKDpbsE54erij5W304UG4XM6POcpFFBA
   hahoY1W75MAf7rayQFLmQj6umNvqzOwHYgbsDdgjcUg/OzMYrtSgRzejU
   bL7px8eyaiydCIWrRgMK09qJ2WqkC65b1z0YQW15rqnJd4IU8mFG0zJAl
   19y+XFrIvdHsa4VJXez4uLU+NthEUMkDxFqPoWJFmZVQzuzyrCJdb3Ym+
   g==;
X-CSE-ConnectionGUID: 8ll23OXlRf+xAfZ+a06iyA==
X-CSE-MsgGUID: 6f9SOqvPT1y9NsmAvZbeAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107129440"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107129440"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:08:58 -0700
X-CSE-ConnectionGUID: kmakgqATRJCUjON4ihX9dQ==
X-CSE-MsgGUID: UxXGgteERzaIM9qNhCyFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296174542"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:08:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:08:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:08:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:08:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENzKlRXaf1MXXl/n3/9X8LaDEtMwuXM5kVjH5CVPcoE/d8/SeqyE4uF9Qs+ipo0ReF/NYlHFoFbJctTQgQIgzZB73QUjcfcG6SIeW5kszmv2gDDoVMYHTZwNictI0FOyE1Si2tu0AyD06Py+GfN9x0XUeH9o+SGKCYAHIxQ37e6tMS1d5brLl++qGJTDb8wLK66I+/lskZHs28a2xikGs0ZV9Mb/vl+fwpnqMurPRdMejekLWCIXE8QLWDf5jlXVqD845Q5rbfPUczfpPNQ9cuq8s4NUyPiTcbtg05Z0c5B17d6ctX+9kAnbzlErsod7E94VQ2QYmOGfDkcntAdimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Hats7KeiMU5XzDf2RyNqPCRXumi+1BvfPy/u2yL9f8=;
 b=JRSQR4Al5gRl3j6isXT0Na71cTkIK2u1+flRRrBDvZL0YvlbaVyfCWvTGu9eeo08+yRJEhfawWMUTsJy2+IfHVm3u+XvH7vvuwbMVpuD7u1YxlyKeEEPSIbrB4X8vEL2vPtt9F1pbZ+CHP9rR5dsPR0JCf9MvVN8SHwUFI8ACLCbp0/oug7Yjl4lQrGsnGJl2Ibq4lkKkuOYZpZM39gn0yPU03GIna9DUavsUZdXUCaR4MKDTzvk+FIevLTklJfDfJ5gSBcFCmAlQDhITocYhAJO94JelLHxUZC9hJEwIVVAurtKPiv1YsCk0k9M92IMQ1Iw3j7dFaG8OzWE/Zz+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:08:46 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:08:46 +0000
Date: Mon, 14 Sep 2026 12:08:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 08/20] drm/xe/vsec: Use correct pm state get
Message-ID: <aqgcCZH0QkpRn-F5@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-30-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-30-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS0PR11MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 6472120f-c120-4250-6526-08df127a746d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: lsSarag/vHpbxZvorRopiagaM2/0Zv7TVpUotFpTLKUJzwW2R8Lq5T9OC8ix+a9I8HqUPj2HVxsQQZZskPTD3qFzdZwfc+1SY9Z4t76nI+haLDREEQ8BBMJrpvrsicta2lD67Kj9IVcLXIBaaJdDC5KuJRrBMNKeuR45c2SH6rlbLHdSKIANAxz49fKgRxbVR8Jtq2wWm2SgEaHWQ3aUhnWqT48dN9Ohu/XeM+jHBzpT4EA8qKk6QJ3FPEG9XZnApkRX/u13aK4gV4CDpKGTQJVxcH9KMJ4K3yUjOkuBVX54JmBioOvM/YhCC8Iqe3Qm20HhtgvaP8peyyp5v+aaENI4q2smXHUi1TRjdIrBLYA7DLkM/dY3cCE5fzW1edbSErtY2nHgc3RK2b8xqrd2AAzjhunaatLCnidJoe+24ATncbWvAgQ7Ypdd1ULl+XYJLC8+U+NF8jjBcgLl56jctS7XWvRk9ihIZmNe4pgIZ6EyZdoxnR6oE5D7KM6XT4tjBu1vDsZxJXwulwPEhgvWErg4UIu6pFzNX1GR+WuTIRt8+nCq/vgouyIM+LgC9fmcBLEZlg6CRE0WKCQiHNBbwnAMhHtR20FyvF4daMCMaPa9f8f/jN/GFbz8wAtS9yxqQw9VIroEt1TgFIv7VzSwDGrF6iN9w/9BqFpEu7yuUo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+HByzFBjp+yXHhOsB0dsX0ze7OEYkg9j49G9zXWFi7zS5IcGFp4jU8LhkDh0?=
 =?us-ascii?Q?9cYbDuQ4wFbefRXH556S9j69tw/wVFrsCfmb96QI/pNQg+r1UvTT0XcbW4N0?=
 =?us-ascii?Q?FjunLix9GgoONopBBuoRuyHlDldUUvs0GfX2lSqSfgWoIdkH+awGMZatHEMT?=
 =?us-ascii?Q?wiVnwz2wzxJQEcsG61nqHcam2CPVwRivvCE5kw9n61UXCwdgly4gxMEFy0tf?=
 =?us-ascii?Q?4rbfUm/ere4xZrqUl03wiXljtqNwYyM8RDsWACn6awf1piKMNSfmOSyNJzcI?=
 =?us-ascii?Q?ZWP4EyCOyX4V5m8wmsyxW9t+oNALRAP44QpNBsuLWnnD1aFxPqZVuK3Y2vqr?=
 =?us-ascii?Q?1i+eTCTWDGqXoX3uWZ7MeJ6dftu7VzLZaU1SpLDdxnGhHBXjwjqj+8aOxrGA?=
 =?us-ascii?Q?lIaqI+3xWYvyEdprBVNqdIyY/MY96g3Js3UdT6KgGyv4vlGOH7fm9VlD228R?=
 =?us-ascii?Q?Rggm4OkfLlDWiF8FvI5hB8TqacUIgYIhdXVueGWHTsIgYb0XtbBN55K5B+zC?=
 =?us-ascii?Q?orAFTQmBWElwDm7bsgT8HmRjbtcLdxr2DqSz/xZTXbg+HtjjYWGZnJfgu47D?=
 =?us-ascii?Q?zspz0g+xQ0aJ2elrkU4rUWgdwXc+2IQqrPlwTA7JxA+kuS0xVdUtKB+fxAIe?=
 =?us-ascii?Q?ys3u/Oag927hLY8eQPxCmb7/rDhavVl/TqPooby6PQYk8FbgcEjSil4MNerS?=
 =?us-ascii?Q?s30UHRfroIRUDNI1PLjsaCkreEH06li/wygzucJhe3S4ft4BtxWiLP9kjQ1w?=
 =?us-ascii?Q?o9HM5W55IHdMytuyNnMODDLt0XgDm3nQAKqoFeoDythE6JNNqIET/6UwvXn3?=
 =?us-ascii?Q?mH+IbRmcnhbUXoXd1RqS4WPoUl0eMcGF9+UHjaCk1tPZBlp6HnLM69AwYBwp?=
 =?us-ascii?Q?e+h2HLHT8HCHv96npOPNc42+O1Y8aPnCBxKFNs8HtazioMdZuXvF9qzlKV2l?=
 =?us-ascii?Q?JmPeqlIzusXpLMPL2yV+iacELmQNXcz4Eppd+zi6ssrZArpZM1Pt4pK2gUbz?=
 =?us-ascii?Q?uCGoDV9WpN/HEfJJb0FYniFwpYaRWw2AuTu8uXgip5Tp4vvzoJupZbkiJsWE?=
 =?us-ascii?Q?VfSsduImFhBBUmbvK8rob6D3dRYV9yiVkIfSBRLKEZ45kLzRbZ6OmOJzfauG?=
 =?us-ascii?Q?1j7KrGqyhVJ5N4CHCm2M/miWHYLyFBEqPXjrw7E6qvJtFF3FR4jSlWvzJdVK?=
 =?us-ascii?Q?q2Bet2uLctntgQEFHyOExxS/2ezK8VZClvLlCJor+cESKCcF13QQvTmuhxy/?=
 =?us-ascii?Q?q1dbVMpZX1mHaddpRQtWlIChBhCFaJpoBkzjxLH9AIdQLEfQCmwMXHLs+98A?=
 =?us-ascii?Q?zI/QxiC/OBWH+46csE2mF2ddNcfC8emusuXLndYxgIj0jH6h/iRnwx53bVhs?=
 =?us-ascii?Q?tkzEH3kMylRZgIOYayLYRMU6zqKajqfTEzlsHkJC4dHZY9g0S0SLqO6Sv375?=
 =?us-ascii?Q?AcAyCFcDO3V9Q0Y4anN/oUw6bEzrE5M9PgdXmaVTYKdj0Y9/Ff5vQpQ+6BaQ?=
 =?us-ascii?Q?ctiXquNy3LMkVAGEv2pblMHyjW0Cecd4hTAPpCWq8SQFZ1TZMnnW7D+TzQd0?=
 =?us-ascii?Q?DuevR8kJ3dnps00FhHJsfyaLByDFa+jUJIDCQ221u19nOz1k5PYrTYqeVgOg?=
 =?us-ascii?Q?vZ311kvU4ic0ERGtmVo9Yhqwq5AKxsVIlqN4S41GSkXPdG2+mt3gGo82so1/?=
 =?us-ascii?Q?OC7CHU7dsURnmrWwjt9oqNvdEfWLdFjcvHvOczc483m8AHNbHJznbszF6kte?=
 =?us-ascii?Q?jYQJmfz5LA=3D=3D?=
X-Exchange-RoutingPolicyChecked: JVWobhp7GHmFp5UranbioSiHQyDXalxcMDKfpAXuZNlhSkhvVCXmxON3xjDBODRFRYNH7qGm9CXk5uOY4jB8iq5WzLrfU5gN08TrxqfgU/8x4nyiq7ihiL4cT48BIT9eCMFcVlFooAQXO7iBF0jVd31nLSOtOqfSGVAhkx+brqskSprQWrMdvVm8j0QKe5jwIxLK5TKjh4SMNfjGTFKHy0eRGTuY4kdMxE8Hzi4d6XR9Xy3rrUzwhbNaNQNsKljBygsSKQsTEmizMm4dt+abik4B4iGAoq1aNvibo9fKvsflwy+rKNqzdY43ML6IJ0HVF98GEBLvV639wSMGHRsmKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6472120f-c120-4250-6526-08df127a746d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:08:46.0712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RietjT3DGNoOCYEH4gI2XaQ04n0x47WJt2fdbHzFmKR6ugMzxdytw6tyXhwP41QjSjTWoq5Jewk8zqzQdddF2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:56PM -0700, Michael J. Ruhl wrote:
> Crashlog needs to be collected at all times.  The current pm check
> assumes telemetry only.
> 
> Update read path to enable device for crashlog instances.
> 
> Include check of the WATCHER CAP_TYPE for completeness.
> WATCHER is a possible type and needs to be accounted for, but is not
> supported.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index dd7723ba6c1c..468a221378fa 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  {
>  	struct xe_device *xe = kdev_to_xe_device(dev);
>  	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
>  	int ret;
> @@ -158,9 +159,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	telem_addr += offset + user_offset;
>  
> -	/* indicate that we are not at an appropriate power level */
> -	if (!xe_pm_runtime_get_if_active(xe))
> -		return -ENODATA;
> +	/* Always allow crashlog. Telemetry, only when powered */
> +	switch (cap_type) {
> +	case CRASHLOG:
> +		xe_pm_runtime_get(xe);
> +		break;
> +	case TELEMETRY:
> +		if (!xe_pm_runtime_get_if_active(xe))
> +			return -ENODATA;
> +		break;
> +	case WATCHER:
> +		return -EINVAL;
> +	}
>  
>  	mutex_lock(&xe->pmt.lock);
>  
> -- 
> 2.43.0
> 
