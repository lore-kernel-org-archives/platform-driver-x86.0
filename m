Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDA478E57
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402390; cv=fail; b=kxjVMeevaSYEfL9v/8xdQ1213TN0myOMRrF130orX8VBDA4m7uQFPNJCPQnjoqtoP6NIW/XIX7JBt1uhVsrCCyp9ww0CHpOrSD1T7/NhLkYnTDeIPM3Ydz2EkoSQT79Quc4XUWTDxL5VlFRb2uGdI1r/3bYv0QFA8Hd9+sttk+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402390; c=relaxed/simple;
	bh=26Gp91LIx3g8VOGjdzCNDbJxA+F5IjJmDjA3CqIk8nA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UVPDHnEyjvv4in2fruDpO8H+FsPLcgEca0nBlOVr8bwlx13bMjm8vSutQopU3zJzTd2zKknuWC857/AAuM+g0Y7S0xSsERFCye7xdoOvH35d42ms4iWqe4Ttqaift9bSsGILFvoXG5OdJxoMOwPeSBf0vVSboK10l30d18l2Ixg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4UkMo9B; arc=fail smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4UkMo9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402388; x=1820938388;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=26Gp91LIx3g8VOGjdzCNDbJxA+F5IjJmDjA3CqIk8nA=;
  b=H4UkMo9BYxRvAvwDW/TGzm7sncugCX7sBWypVFdwe6y1WQdctbfynIhP
   eHnIZO3XkqkxFqQFgYT3lwYVEgw352xELFoL7UZt62jvamLJ8feW7NwRr
   ZmPLcDrGX8rCblXJvk1AWTpXxOZPcKs5j6KrrVtNtk9ImLOIemESdIlaY
   sgWEGwrUCVNL3ITPsAczmIIwCxOSa9xlnO4VRI20IzgmTsGcdqnKn3t7e
   5fVefUN/Dbv061g9dABSwr8M5Np85gK7/FicIJGoLFuznEU4ORQuz7T0x
   Zl7Uc3YCEM6v4BUDxZe9ti4rSimGjNkfbkrictULlHp5+rHMOkgrS8teM
   g==;
X-CSE-ConnectionGUID: 4uXJzrqaRwmXFLTdNIHi4Q==
X-CSE-MsgGUID: qnBvPLG6TPO0hm2sTrfVIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="267881"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267881"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:13:07 -0700
X-CSE-ConnectionGUID: UgWjdm0VT6aQjP4D2BAWfQ==
X-CSE-MsgGUID: z07kjffKRpCBFCGfUK6o7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271258737"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:13:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:13:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:13:06 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZU94BtbDIyuuuD5mdAyuPEdDQITOPgoTck/FHvR8o/1nldPPhlRR9kvIa+Wr4Q85Z+YHm8IoZ3jYwDxN/oneDbt48GQy1ERWE6e2bcmy4t/IRp54+cH+fr7xbRLKSL6n7YUm+qEjWoV3aMD7vKdtixTwIWTGc0pyeLn4G7S72ux2IcWVy4cZn4o28aROGQJAsZDEoIRwhifvkcDumSlN3vqspqC6ggi1N4VVN/W5ZnzTtUlD+HlQYcuWHeXnHss+XB+URh8CMdD794Y8j13ad+GtySxsNA6EImdIxGVh7QkHd8gvC3a2nzuQGfWw3vRIJd4SY7T1qjtqHCow8WrEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/ZLSRn62bJP+t3qC/OiYd3N4V5VuYWlMrcUQYgtdCI=;
 b=sgWONV1meWeOo9sOAR2HY+IhVLU09SNfozw+P/shD7MVD4sE2UHZ4V+Xjvwwi6/LTsbW3V/nuoTk5IOuzJ4zcRsWmrum9ocvC0L1gywVhdQvpexUuUZ3uGRwzB/0jD5rfVoTnkYb7oI0fcRKO7li6BZVwHrjiVr7GHkZktk4KWqiD6hW2N5n2V9oTUiqzTHURzx6Pkfs19R6bZaqSAkdkafCvm+WqAlXVpEC3fkOHCQerDkv8U5c4zJkQM0YlzrHbCt9VYbgR+U6NDYWTyJMKaXn2odFi8pMQzyiu1FVUdetsv1yl2wLGdNDeUYZt6/5n6c2xr/3I5Tl0cOSSLXVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:13:03 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:13:03 +0000
Date: Mon, 14 Sep 2026 12:12:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 13/20] drm/xe/vsec: Add base_offset to allow for more
 flexibilty
Message-ID: <aqgdCaf-h-F9HSn0@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-35-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-35-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 6debc768-0ae4-4f34-c22a-08df127b0d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: gqcmYRliqaKD6sKXo/WYf/rFjGekoDZbmkg0BzV+24sUi0sjL5u4TiDw7dSAgW0cWRNR3EQljd8CU7qnXp9V4fH16KmCBEAeaoOExLZMzCXXz1isPnZOmQzaIxmytOrFQvCdntaoh+L1V8+U2NKsXTxDSCbqzno2dTLW4DSrBDdDnz4CEcWhp1Kj2RUAvpcOLXB5CdyLt4JE5464b7eONXSMHMUqYmk2b5IJE8CqySqkd4bY6NztiTuChf8Vgbx94lmyhuHFmYsWzvfutiz8WFNbQ4b22vH7+jlz1tf1+yKOI3JFNJG87UcgcxtaLvBmuEPBQLizJU17SMzDaRcnjFb+6DMszLCg0cNliNbr/DJ4oth6dhH2CVU/TFNm9nqQAx2pNRUPR3ifsQqjeYBst2oWDR24SgG5DLQFTFqbebMWO1oXz3B30x38JZrVkyCfc200KHgiacht2+0+jllU2bS7b/b4jhbaviIrqq3NLCjjqJcSbOdX7xl/wzV0erhyK9hlYbPRGt6NVGxqFeespSug5QLzHQFWFhrr0vTsAAp1AAL6tUwd1tdzM8mGRVHNinjEN+gkh1/kZuM4mnxEu6eQaY2Cfo8l+T72nvPiRnoXaIMDltuqxxAjx6QWbhF8A0gz2yt/clztMGu4G7f+Qt7btmxkNqX93eY2SzqUzBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kv0B7VV3Grm9kHTU725Wl1Q1cC0VL0E0xvp+F2uKF2cvBwS8RnxYguTpJLQD?=
 =?us-ascii?Q?p/rwqMhu5KGXVSQXF6OetU6M26PdOQck5CLFf+Q571SDOe4s15ULR/r8+GRr?=
 =?us-ascii?Q?SX+BdLOOo5LPB+rV1W1qxeitAc7+llnvQqsKN8JYzpRHKxt30nGqOYKI8Spw?=
 =?us-ascii?Q?TqCel0S7075k0FmlXPc5TC0RL/Owrr6ylZk+q9RxMqF7/a/rjCfzdKh0IWth?=
 =?us-ascii?Q?xzuYXti2DBv3EQFhRt13TyAepAzE5Jxww8bqh5xnASnG/gheAa+MyVzBJjrJ?=
 =?us-ascii?Q?4muMNfKE8pnpMWpr1fGbJXO8E5vJnuejr83hbwXbeuxViF+rERaFhqByO2vN?=
 =?us-ascii?Q?YRjWl9GmfV8m0jlbCl7QCGXkVSH59CdCJxvfvvwnLmDPgticoGZGo0qcPgbQ?=
 =?us-ascii?Q?pOyiKofQfX5+JVjHK7vwKq9TX5b5NDNoZorqGavnJDJESCXieuXISPU3Yv0v?=
 =?us-ascii?Q?PFKTG4wX3ukmq8XyH6LcNwta5QGcxspc9EuxAMCBqsQPEbCH+3HeY3q0RTlH?=
 =?us-ascii?Q?gjmYI133xqboicCE+7ARb7vT0MajVyoeuVl8feSmlvbMPPvnkOGaPIbvS0Hu?=
 =?us-ascii?Q?/3f0JjBzh1dgvbIYpyTRsJa9iFJYeWrxDQoEm5Lc3W/FJ6bzrX62y7l5UlDS?=
 =?us-ascii?Q?99F9ZjXbqfWfgH0RkBhWZPk8irJ15Tq0w6c6dcSh9LKYoWQAE57tzzmGEmCI?=
 =?us-ascii?Q?IUjdoxKFI8mAhYCIVlWqsmiCDjs1tk37CFGdC4RfZWnEgrYuDY0XgBimaxRB?=
 =?us-ascii?Q?5Ar8j872mQAZ511ULME6QPqUwTZbyAzFeiMKMO5KCmZnhg30oqof+lTuCtyv?=
 =?us-ascii?Q?036vaVjSiRGAGZRzrnxJvvB8/+71k8JsHZAdqSp9D4VmuWkCI2G4Olk+xswa?=
 =?us-ascii?Q?rmJh/s4Lu40LH59ja9tUg5SfDnSK0sSBu7kIdTUTvBii7jbuWM1EfPr2UGNr?=
 =?us-ascii?Q?n+ZfxCQ9v4fmpwyYYWU4uY8a/xCjrQPgejPPME0SFnUxvsBi7TAnjqW8/4js?=
 =?us-ascii?Q?iEOKOBodilOxjEMUjM+7aVUi3why94qqvGHWLRsfcJQ+pbaN4bPmCiMuzDbi?=
 =?us-ascii?Q?3ix9v1Fgx1Qrve0nE/n+jlT9BdATuI6zn+2lAUY4LoV5PTeg7SPzR8M03187?=
 =?us-ascii?Q?ftj9BCewv+mzofPFiADjcGVcXGAuZn7N2FR+uZRxQuLpWloHgVqlhTzWHYld?=
 =?us-ascii?Q?25VhTE/LiHSjSGeA7AFNJjzIBXHyMIiw+itE7G1miP0/qVhyq/SUfSYTLS/f?=
 =?us-ascii?Q?miUsIH5/V0dU0Cz2vskYhu62co0P9+s3x3FwR4r+kYPSRlZxWsYlPZRLiuoN?=
 =?us-ascii?Q?I8klQ+eRZm6AfoC05IT4EAV0+sTqvc4sbfoMF4Q1whHPMSuDX1GnVLXubgNB?=
 =?us-ascii?Q?g85JkwsHLaECksZXnJRJgmhcjDePb1V8N087CRHIYNuj/MWU6GRjsPB0SaEu?=
 =?us-ascii?Q?9CdT6/iax0AOHDzBbUpp7NjgtddvB7mD05TJuh7CqFOZTxqXJcVJn5usrGc2?=
 =?us-ascii?Q?IjMB713ymKnGNlwcKaQggmhMtrfVs23Ak2pKgW4Vw9wyswmRDRpB+uiuZxYx?=
 =?us-ascii?Q?mUqsktD/C3ncGjm8FX/YWsMS61ldu1JuFx6H+9yh+tPPt82qRDDLs8w4EKMs?=
 =?us-ascii?Q?9CyNyWO/ggTboxjImBZBYMIZyWYDI6n9RBzd80zcll5XVIN4AgOKPGzD1svE?=
 =?us-ascii?Q?nCYi8POGCnkDeO7sDuit7LakfNkRUqwm3xSbSa1Z1EDCBOPFvj0Wxmo+J6NS?=
 =?us-ascii?Q?3xIIuDFWqg=3D=3D?=
X-Exchange-RoutingPolicyChecked: eFpy4Gq0+Kdbm98zMUyYTwqzTaaNbZJxFQuofrKLgkNop8UuIh3kPRbgLbtJTGEN8lWpmNWyxVX4SjoKZBO5iWfTlX68bNUWwoYqWDWpfQWD8HICRR8izw2M9y1aWGZVifs9KdzHmXGZOLC+t7/4JQ9oiKrk1Yfz6bmjq5NpmtWugeqAhNzQEBn4Iadfs7okG3DKkYA9n27ZmOtmc+Va9X6V3tKFMwcATe4k+nDyBNj370qJRShc39m1nRRLdoIiBx4KnRQmz5r2j9OLW4CGOhZWR0+j7SBKIwwZOuOsPX4vcwydmizSNki5ySJwH18Lv96h+pz8CuKHpWPZfK/Nvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6debc768-0ae4-4f34-c22a-08df127b0d78
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:13:02.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnpLAj09l5DiLUWq7u/ubYy5yW99TKNqMP3dk8SavdacoKgW70en9K253DmDfzlZCoLnvHgI8xq5iD9930OD/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:12:01PM -0700, Michael J. Ruhl wrote:
> Current pmt_telem_read() usage is a fixed (for BMG) offset.
> In order to support other devices this must be settable.
> 
> Add a base offset for more flexibility.
> Add a check to verify that it has been set before allowing
> device access.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_vsec.c         | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4661bfce2f4e..ebdc271ebeae 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -473,6 +473,8 @@ struct xe_device {
>  	struct {
>  		/** @pmt.lock: protect access for telemetry data */
>  		struct mutex lock;
> +		/** @pmt.base_offset: device specific base offset */
> +		u64 base_offset;
>  	} pmt;
>  
>  	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index ca8414441a69..856973473fd7 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -173,14 +173,15 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>   * Return:
>   * * -ENODEV device is not available (hotplug)
>   * * -EINVAL for VF and PMT WATCHER requests
> + * * -EAGAIN base_offset has not been set, so init path has not yet been done.
>   * * count   number of bytes read on success
>   */
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
>  		      u32 count)
>  {
>  	struct xe_device *xe = kdev_to_xe_device(dev);
> -	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
>  	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
> +	void __iomem *telem_addr = xe->mmio.regs + xe->pmt.base_offset;
>  	u32 mem_region;
>  	u32 offset;
>  	int ret = 0;
> @@ -194,6 +195,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  		goto dev_exit;
>  	}
>  
> +	if (!xe->pmt.base_offset) {
> +		ret = -EAGAIN;
> +		goto dev_exit;
> +	}
> +
>  	ret = xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
>  		goto dev_exit;
> @@ -272,6 +278,7 @@ void xe_vsec_init(struct xe_device *xe)
>  	case XE_VSEC_BMG:
>  		if (IS_SRIOV_VF(xe))
>  			return;
> +		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
>  		info->priv_data = &xe_pmt_cb;
>  		break;
>  	default:
> -- 
> 2.43.0
> 
