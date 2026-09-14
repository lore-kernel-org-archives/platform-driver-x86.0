Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFEB448B87
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402297; cv=fail; b=EB6STBoX1GhqAhQuZjZmI1VNco0PTL2Gnl1PNlpdKvagxrN40qLBN5s4jGB/10Wc9ya1ZGzaAsf/Ur11nGI2xpud5XNinHIyIOV5KRaw2Rdz9Se6+Zy8rmBLOH8tYNd48zsTdgcbQ+IiQvODnivHmMv8C9BIoe1a/Limr9jxdSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402297; c=relaxed/simple;
	bh=gP14jrCgHzK89/D7s5+idOTeXe65sL5fPl8MX7y+etQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cI5VMXmCRf6ASj8/zXfiniPoiCvTrjFMM+WXCzLDVGM8fWQGaveRU2DatXeAA0klzj78EDNpd8FMGAxuN0Icial5ho7iwJcbLdhnf9y34nAKBa+j8+T99rbo215IRDfEhBYuGM/mYvXK/0HVSLhJKznKlWOQ9cfH32moISBZ5wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ogtm0xwy; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ogtm0xwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402296; x=1820938296;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=gP14jrCgHzK89/D7s5+idOTeXe65sL5fPl8MX7y+etQ=;
  b=Ogtm0xwy9y31uc+Qlj8FYfg82IAL1YJ5qhVyNiujCp2b/5OK3D+9y+uv
   FpSRoqh8/8N/EaqF6f2QGgZ3CwCzozFZldpq+dWSjr/6e7vxeNnCPAE04
   HzHSEP10e4EsNDPryf+AGbYN3CkbazyoGWg2sKoUZRWR8Z2Sfy3rpblif
   DziruIX/8yBHOM9DK4dlnvxr5FDt9lT4NZa9mNV7wqrv611ELJB76h1Ds
   GAVNZAioHtUecennIDgEXBjjxsrH2mpFkkdcgZGP9uyb70IcMpUv7t+P7
   e6SkFqWMNYuuqJLYyfPAo8iTrmzhCC2ONdnTZinH10q02srE4eOX+8lNi
   g==;
X-CSE-ConnectionGUID: zNrdGpp+Q8CQhumIx4GnfQ==
X-CSE-MsgGUID: wlwnxH7KQoq6f6XW7PDsOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89698097"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89698097"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:11:36 -0700
X-CSE-ConnectionGUID: PK+DW1KbRCC9inWFs/g57A==
X-CSE-MsgGUID: 5fvEUD11T1eEMS5SgzP5sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268999829"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:11:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:11:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:11:34 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:11:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjybZSNbVB9zivoy4Mg3RdR2AwVFQ6goMTmkCjdQdnMBnZXQJvelmiv6mqj9lIq/wexzDir03rybp9ez4mwpvYmNe1fVtgxPf1+5hZIw0JoToRCuxBDeTwCP9Uwo2YQM+2OcnqmTSJ9AYOor4dN0qOgN+UaLDZ2ZMsyPMYzwkzN4PSJPikTJXnmKSB65hI+qoNEZSywLOWWWj18f/XHFM9ATaqDTvUMfwBiAQsceKZmS8QowhOiddreaX3dsQeK94XGKx6QuhRfEmJmkUfej/G8IVklzdQzc8rkYsHMdp35hBm8AL8Krj1eJIC0KpZhHghXEkEgkz9xgKJ+epj2LFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkuHqsT64Hcsfg8El0LmvXnti90f08cIlApbvORDxio=;
 b=DwsxSFlclKvfPaYKchP5PIPOr/fF6+49mTFuIlojCP6Dffn2Ci4yhnyA7IzbzyUKxx8UF8sBJGYnd3aKgYGvrDpdVTe7UmZutp/Cf5EIWQ8eOa4d0Bwen+BFP5h2B6mRnCY31QyuRbzEc3ZAo5jGXYOe9uPDSjXYv3TiYcBS4TRv8fuPgU6gx02/fhj3VXPbsDqAFgaCEi9Mh2Cgve9oV+KE/zf0extzQ7bTb6iH94jPfHSddnNJMbHZZcw4EYIgKytGm2g3lHx4eHmOluilhRUQl87z27e0IwqOaQJWGgCoQMPSoQvmHBUmzQlm4rTPzHM/7cr3BDSfOEt6aV5K6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:11:29 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:11:29 +0000
Date: Mon, 14 Sep 2026 12:11:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 11/20] drm/xe/vsec: Refactor BattleMage PMT defines
Message-ID: <aqgcq5NAfKefvIux@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-33-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-33-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: ea733a70-4e73-48a2-8cac-08df127ad5fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: mFdQ6UvMcym6+MOc/WYh9FnoO+vkUz4TmMAy3+92gpi7bkamstonc+MbYBLJppRMNsfuWzg+WXwQsoTZqZhCkgYL7hXBvAX4b98wCYJRRpK+UUKwvMQkKoSDnsqY+kQP+wcG82DNA2u9hz3ASt20gWL714qQNWPIu51OzM+q3Ey/0U4le/4YfCsSHXJk1z3PoHsPrMsM3VUFEi707eUCen3Vh3gi0q8iIAZC4JHhoySJkMcDnnKaqZ+KirSKwTVoH572fvL33xxS2p9KXZJ2/zVaTWBYKf3vmPxINWa0Too0NQEJMMUMhCmYMwVTD4RcR2JRHLXP6wvJAO6eJU7CfVtOHRYY/yxLQx8bJeJDUHYnw2IPkXvBBsDLIkjKuaClNW+COvh3TSJopuDxKgKuBQGiRy0Rc22/umeBohTNmTo+oySIbbUDA527lHmIMszDdc3Vm6lfW8S2P5ngSrTBld0JLaH7c6Vy/OVavYzkCUR+8/Ty1LFgGFeu+PtGXuZu5s/jDWRS3Sap9mjqunCata6XNsSWYXFn0czA8+HqStfMpneoa5Hqe4+qCvhogzWAL3ajNQpGPV+McdK7TocIHWImEUaHRcbfs/58/FVh+4oZXwKaph+uPMSyBZmVodL41/SAN27sbiD2JfQJtc5C4pRmIC/3/OotRBZ+PKy/WPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ojiGSqknsBhn8CQYtLiAZkR+KNtsnAZB4PlXZ17UiQBNUvP75Y5O13naI1p?=
 =?us-ascii?Q?EqhjN4BCKeYHUCMSCz+0WS0VOqlCznr0SAzUZwp1kOpDUOxhOIEZJv4ExGdd?=
 =?us-ascii?Q?yw5thHinvsw8RSMLuex3p9qmb2bSrTd3dLPXC6TfslIRcSEcQx6TH5cXGhw7?=
 =?us-ascii?Q?wKXqeZbDwe236CY2WH9Jyia/gGAb40/nJgm6RFToO7z3P5kbeBsSmnlcUsgv?=
 =?us-ascii?Q?aw/KWQMR7fY+2O1rR4C2hrrWoRwPz52h3Px9+ZY4t2EpaeiaAcO1x2U30ZB/?=
 =?us-ascii?Q?9VYpRl/8vH8EuAYqsaL03qvLzeY3mIwQt7bUc0pMrw6/LFh2r21tPEqiaX4P?=
 =?us-ascii?Q?itTwlyx/7LNBS4tC4EDhTaS+YTiizuvrWJ7gVvdUWmDHhIZFd8PEGx00rGu0?=
 =?us-ascii?Q?koFyJj43ldg22goGf2SDUOnIzcopQqNW+iZSArXOMQk/C5JY+6nHx/dauD96?=
 =?us-ascii?Q?Q4d+QXCGByl7sWmLnyatrhK7ATlZl6KLmi9gnwWUiP5KJo6sB8UmRxkR+s6k?=
 =?us-ascii?Q?SvOLOTChZAVBNJxmGnDIrUCBVE0rqPK7MeqRhRtiWZSrpow8uHtG3poAjby2?=
 =?us-ascii?Q?fQhl7vJJczbjxBvGh05mxfVvLl1rRzz3zjtkiBAUioiGzWw9DPZ/Jz+N0EHx?=
 =?us-ascii?Q?muTFA+Q4XfsJa5BQTB+XoFs28gTIYMKopw5z13RC8YeiGX/dlq0roswRvTsr?=
 =?us-ascii?Q?EhPA5afwlAtB/nhe6qfR88Q2afd0niMY6ENVbqag16GtMyCkZIS9K6FhXbLf?=
 =?us-ascii?Q?33g6/nzUqiUfLwuCiFmuL6uEY32auhsYOxQZ7U771g1VnxbYfKbfs+A2jehv?=
 =?us-ascii?Q?JSXdQKz2PA5YMxNV81nzEMEurjvqU+EOceBeSNi2XdUXE3X3Ax+BX5//ZJ7x?=
 =?us-ascii?Q?JvMrXa4z7iJg1Izr74FPZrCZ4JuySMQ0TqJSPtETTFZD5fZMKLA8eL+kOnSl?=
 =?us-ascii?Q?spbkd+1347fTmPlUY8Mb1rzzxAA2QHtsIlMXUYxVR3k5mr1Uwoa+uiqrD53F?=
 =?us-ascii?Q?Ys5ULmkjDVZdZryjHxMv9HX/DZiXo/u0+HOhTTXuwnPlQiJu7JLt2oWKiDq7?=
 =?us-ascii?Q?O3MY2ITi/VJhQqSM2o3j1BTzRdPsYSxWp4dgzTC376G1JPVCinXw/mY87+Rl?=
 =?us-ascii?Q?zA/oANwKL7eFyDkJK0lHtYOcVzpSDXTVeFEaVFo9DwBTnD4rvJxSfamein+d?=
 =?us-ascii?Q?9NmhUQ5CesHyuT4RL90XTzEZIiKN0yygoxECs6AawwSiNMHqsPzmkQC8WvYS?=
 =?us-ascii?Q?N0YcOsimLqmXY8ZAT5ACt1aE9cr/ucrkmstANK8nAy6bwtXZ9YnXbQWmMV8m?=
 =?us-ascii?Q?b9XclDuPxiOj/muMWoWnCxn+BzfU9QVOD4TOGCBWko2XMJD8uzatezIPCAFO?=
 =?us-ascii?Q?FG+7RDuVaHgmvASVnfKJsrPVtp65+/fYYvp9l5KH3D5/DMCwXX2SYQI+hmtz?=
 =?us-ascii?Q?B92E91p/mgXoeU4Y9/YxMjU2PMpZPczLAp6qnusp3lsfOlQ3TI4pMW7eVATk?=
 =?us-ascii?Q?0r50KIVR0otT1reZd6qmakf6yxi8H60Wy7D+Hvt5zIluq5DCcR8VwA+xpFSF?=
 =?us-ascii?Q?4d+jTDlIfOGIEFP9m3r1qFferu54O7hotpy0Mex22hL/U2APeZRJNFLDVYqm?=
 =?us-ascii?Q?37zKCJtd1C9yJs9aBHqcT9gUCV/OkFeEVEkv297A4D8oIIn58/mPE7TNvyck?=
 =?us-ascii?Q?DEgAOyStnRU2uGLG3C+/t/ZXb6DjHro5y0qGDStjDer8wjp9OCM0TcVYzqh6?=
 =?us-ascii?Q?jSQExCXbAw=3D=3D?=
X-Exchange-RoutingPolicyChecked: zoiN5WL/BWvlQS8Yr2yFhXSWOzwiPd4cv/YxsGOankYjt0MCY57SIm8ZNk2eJteEfTE0FHiOYYx3vi+2paFarIomMSsFpgrD9yOs5f7E4syTrz8PtYNTBqiAjAehHDuAwDCIyE5XHmo7W3s9mpBIjDQr0FWwENBb+76J1jcXCovT0vGFU5Zn00mu7R/jHaZ6arZz0g+OA0WOvfa680Uajs5B3nRoiq4tEgAGeNz7D5CphbHTF9EFS46Q+qhqDsung5Ir+yB8Xeq/OXCTELb//VGaqLCOhf5ihjC2dk5OCtZbu0csZxVlB84/WGdd4YZcM2nVBkfP6kQ+UCYxnQFppg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea733a70-4e73-48a2-8cac-08df127ad5fc
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:11:29.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dWh8fg6maXCLfEf2GVYWkEz4jgCg9+Tdg8jWom9tpOmYsJ2W5rD+lnZZna8Wkl1YZiFR81yUh5C8ySa4o/OTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:59PM -0700, Michael J. Ruhl wrote:
> Rename generic defines to be BMG specific.
> Define several magic numbers.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

I could swear I had already added my rv-b to this, but anyway:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3bea89f2a5c5..ca8414441a69 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -90,10 +90,15 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  #define GUID_CAP_TYPE		GENMASK(29, 28)
>  #define GUID_RECORD_ID		GENMASK(31, 30)
>  
> -#define PUNIT_TELEMETRY_OFFSET		0x0200
> -#define PUNIT_WATCHER_OFFSET		0x14A0
> -#define OOBMSM_0_WATCHER_OFFSET		0x18D8
> -#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
> +#define BMG_IDX_TELEM_PUNIT		0x00
> +#define BMG_IDX_TELEM_OOBMSM		0x01
> +#define BMG_IDX_CRASHLOG_PUNIT		0x02
> +#define BMG_IDX_CRASHLOG_OOBMSM		0x04
> +
> +#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
> +#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
> +#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
> +#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
>  
>  enum record_id {
>  	PUNIT,
> @@ -122,29 +127,29 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	*offset = 0;
>  
>  	if (cap_type == CRASHLOG) {
> -		*index = record_id == PUNIT ? 2 : 4;
> +		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
>  		return 0;
>  	}
>  
>  	switch (record_id) {
>  	case PUNIT:
> -		*index = 0;
> +		*index = BMG_IDX_TELEM_PUNIT;
>  		if (cap_type == TELEMETRY)
> -			*offset = PUNIT_TELEMETRY_OFFSET;
> +			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
>  		else
> -			*offset = PUNIT_WATCHER_OFFSET;
> +			*offset = BMG_PUNIT_WATCHER_OFFSET;
>  		break;
>  
>  	case OOBMSM_0:
> -		*index = 1;
> +		*index = BMG_IDX_TELEM_OOBMSM;
>  		if (cap_type == WATCHER)
> -			*offset = OOBMSM_0_WATCHER_OFFSET;
> +			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
>  		break;
>  
>  	case OOBMSM_1:
> -		*index = 1;
> +		*index = BMG_IDX_TELEM_OOBMSM;
>  		if (cap_type == TELEMETRY)
> -			*offset = OOBMSM_1_TELEMETRY_OFFSET;
> +			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
>  		break;
>  	default:
>  		return -EINVAL;
> -- 
> 2.43.0
> 
