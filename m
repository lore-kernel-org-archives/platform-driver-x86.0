Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00850502D7D
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747812; cv=fail; b=qFJch314zvYL2QWBBHHMMcoPirGZYX03SBQpMwd2xLs2IpJH0Y9RvDzdR7CySx6GUbAjns4lPi5GV/y32gP1H7QrXesPy/GDxbyDc+9qpXX3thYp3jDE0nNmygHznJz84CwAp9JzJUCsyxEv6xaaAT2vThgiWnZtwpO9NM2UlUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747812; c=relaxed/simple;
	bh=+t1lUeRG6UQXM4/7q1lQ8s5rCQpLFPDffuo+vySMcTU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SrrNU/FaLpLeiQ1Sq9j3BKoUb1F2Lg+/JRD5iLr+7vs+GYR1BxIW4yWZMNseEfiDvZMgqTdmJKguJBhwLNi+z85zTWPhf9esgLCtX8dEZs/XSMkeyptNixDyiag9sJE5XwR7CZqjiFL4y+PvLTq65C8G4agC2jx1B2ZiA3ZwHxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaCyOCDr; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaCyOCDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789747811; x=1821283811;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+t1lUeRG6UQXM4/7q1lQ8s5rCQpLFPDffuo+vySMcTU=;
  b=gaCyOCDriOyzKBq4zShpNyhh21w07kWZuFpusxbCjSuEgbkJypcAy9cj
   x1be4VGoNIRm4RoVJnfys34K+RzK/fi6RVEsaCUs9JFgijaqhAuEmMynq
   b5YA0ZVPdUH+g+j/WTat1B5W+nJwyw8i0V8SnekOVcbu0PNWIC3bk4b5G
   zIWXO9ud18SBfGW0bV/pY4rE9IHcWz73XVJp18eMfYHYYvjzzCmIKtHup
   S+f9kzDrrB3l/hTRtZW3lQZUsz6CNB6v+5lmKsT9om2B/wc9DFBbCfcMr
   EYEHdGOb5jVJtDL1eWV/4pWhE38QP4dfsNS4whEGnwALGXTlAI5SEEC/4
   Q==;
X-CSE-ConnectionGUID: 0J28icGbRS269tgQYpZPcw==
X-CSE-MsgGUID: WmkYup7MRlGivETVnrfUxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90280414"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90280414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 09:09:52 -0700
X-CSE-ConnectionGUID: g9HUiZ/PTxetYEv3TF+FcQ==
X-CSE-MsgGUID: n5IF2xNDQLiFPhmwv/SGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="297920990"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 09:09:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:09:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 09:09:51 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVoQ9xBu4g/fS3Z/qLPyhkDvVEiyhOilehPlIZE56dVV75sp5yL01kJ/Lh2BMrq34YzcTtsz+Sxy++MZltgJCQlR60wehElBSxg17zNgsOsqS+jNWbQ9vhCjm3ZonYSm53/sh8DC1otCWuoNvjM0bbInojg/u9vnuCj1SryArZhgTn1FW+zA7KR7JwFdUIf+J9ZVKMDibg8mkmJ1lwCOzoHfR3k4HYAAgi8WoVgyxvpQ1m7ED2BTibD2TAKfg6scuFNrqHm6pEFBH4AfA8BDDt3AqmITyDWHjZ/iD9AloVvm6SdjOeIqOAfcpLr2U3KmfBaby5cq4zkhLwPeQXVNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7K5Fq+VSTPz90fUhkrTLAKFRvyp7wfcoCLBNrcx0xA=;
 b=ZoiJI0tiwTT1rp9I8CKxTfWFqNaaVTVkF0lt/7qfVQ+5297BExt212iTf6aXvIkomTHBjez7HUtUXo0MfMdwmc3EqJxySbvoCF+ukWd+1PUqgzQWrUhEWc9twzZq75HDeT7Uc27pR56Xrr0OZAEPNG4Sxlp9KzhD/BqKUMYYwcMLpFPNHI4yaEP3OvgXunCF8rD541DJeDVfnkdves4wqZFWq1a/WSm9Kup03uxLxSskaZ0Ol/MQrFGS/4IjmO5wRFxDesIXKa3exFjYqOraR+ES7fU3GNqFKuzWX8QvNFA1aZui5Lhpg2uQ0u2zDpR3UNpCdZSXWqd/GU12Uq1Lxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:09:48 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:09:47 +0000
Date: Fri, 18 Sep 2026 12:09:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v10 16/20] drm/xe/vsec: Crescent Island PMT callbacks
Message-ID: <aq1iO9oz3McyXI7q@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
 <20260918131751.2408883-38-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260918131751.2408883-38-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ae1dc4-444f-4e34-43c7-08df159f429d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: WVsQ/rbGGbYEU+mvrO0gpOW40u58/AmeNV7pcmdAixHvbPdQ0xqG+heLQqzlOf+tosjC7xSF3JbuBisEV4D4ulrlZzj1O4ZjZbAQTxYNY8M7xRBcXNxvKgMViPXcWHmMFaIT5CeUbsDljmjI0ycprSQGCuR0zuEG78E9sm/go4EkpB6Jm4WupaW/OTuNLaaevv+v3ycflSx14kgf23waCCNxeqrjDE7n7Tv0x0UHnsWILgQe0Y8vdZZeRODOHt3LxkvXDuSTXkDaAzTTrZfZePWIPQo0Cs7lNB8oxmfmdofU0NeJrcJctxZDnaah6GsEvKdf9WCQrlV9ZU/kKb8372qfwIZTvPr/PNPmtSnYy88Gpa6c2yiWOetrw8Duwcv4dHg/ZHLLlJ5gq4Zap8hrKli9eEFq4eE92KR5TNSzaCD23dy5QV2s1qiYB+jMhXL5icE25D+/UwD+tMNNrR6GKamBMLHue/rAuhJxfvldQ3ekaKQ3BUN2ImuMcVslbqavp5m/JGxNEG0acgb9n6VSDRjZOLxLEZ8lMQaUYtu6cpIuBgElo5s1OmYEre0Dhp+J1q1MObn0HE6Ui3MDpwfBV8mjbwJjEyN3FUfNUYhH8SmHpczzie9V7kYgtST3nVp3IYgXYpjzFB/JCtam77VV8iWZ/uD6A1tCf9X1K9dX4IU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gtWYuKp+zy6UikkYDFd97ip+9hU1n2TdjmXlcfDRGyoOcJH0tmHjbvWie9ib?=
 =?us-ascii?Q?KVF4P4sBl2tEEy4nZ1/Bw5GtyANDnKHcQE8bre+otnuFmnZ4hIFoKM5PCN5J?=
 =?us-ascii?Q?7oSxz24z7agYvFI6h71Tp0viMzHbLC0HL7Q0/QGeSMuM8Q1NlFNFRBs+UZvq?=
 =?us-ascii?Q?RgHC7qCWt7olNoORL8S4qS/1to7mC5zAelM5cuuZbTitRju195A5wdgRfVO4?=
 =?us-ascii?Q?xRUkKt/cqFH2GXOd6VYqxW7DwkyqM21NwgKM2Lwvgowcqu347QF0P/C8fxyd?=
 =?us-ascii?Q?hVi9EsuzQlrco5P3EvCjamIUTs5subOapRiBlkpVWJ2G4yEbQ4vH0OeGRFMn?=
 =?us-ascii?Q?FXsUv9hxNaGpu2GBzGNTfIFe/Mpv+6bWI6AoSbktPhBvf94TSNrc5RV8Tbu7?=
 =?us-ascii?Q?OYuvDvJ8c4KJi3DJ2R4PZqmd7BTIKvYowLeaBQZgr977YlcJde0SBrMtcVje?=
 =?us-ascii?Q?Z9zQZ8Ab6FWeeRcD//9CpwwImeFsXfmxz9ZMzivScTR2IBd7UGR+zyRbohYk?=
 =?us-ascii?Q?vCFro9bXWcRcQ0aEefip2KUopaIilSMe/7fAsamPLmmZ9+l9/DvqAYxs+SJP?=
 =?us-ascii?Q?DxR5isja6qmkVkjFsJEvpvF6K01i8ihOwdVU0e/NFhEWevOi40Vxtmipwmbx?=
 =?us-ascii?Q?CyqisQhqHm/QNVVNAoMRFEgf+G7TUwHQJGsp6BkQaqAYh3ll8s1NBVtape3L?=
 =?us-ascii?Q?t6BG98VBvn+50TI54Hk/n7wL0YC2BuNZAXNUy5Fo9u5kdeGQhdYRxb/JgG6f?=
 =?us-ascii?Q?9EzLlhodb0PvthHHErfDwCQS90aqVTaVOseX+KXh8iOApPzcSbTixRDelMcl?=
 =?us-ascii?Q?Gqv7U0CwF8Rjaq3RjzV3Qk4O4m7HvKO3MRX/C/6D2u4HgvZCVXcEhBJHPOIF?=
 =?us-ascii?Q?vpgJLS3I7HzfdxymfEVRoJ1IVWei10kUOZmO37FRloetsmuWlwyngHD+H3dP?=
 =?us-ascii?Q?3GKSrX77e/0HwBZuxGyBpdjOmmiJ7DLWeskkb9tCz50hwR5PSQ1AZ+wB6KrE?=
 =?us-ascii?Q?SjnFg/lWjZ84uLKqZMwm6pP5oz7D5MOCmX9CPptrj3XM1RoGmddZ4VqBX2As?=
 =?us-ascii?Q?+vxUCZkRLgzaU6Mna6nwPSQrmPDZaWgCICD6vkk8NvwRHdiSFHECiLi+1XIK?=
 =?us-ascii?Q?LjVk6Jxi629SP4X3EkNPR3jxWoRBsGQ12k5mdt4Il0hImpandKz2ZuI1G8so?=
 =?us-ascii?Q?DCSyjQJsM1e7EMoY/8S1HMLrlY1ekyPENz14ZzhgVhwoRg1dJ+TDmTrffF7P?=
 =?us-ascii?Q?yF+Ku/yZ2VxwjTrE4XYk61pQh0KjyP0F2NSmL57zTXbTtvwRiULRGcXoN2jX?=
 =?us-ascii?Q?FWxhZaoT3laZ38Od4+JRvV8no+y6Tp7lvUWuc6oA8Iz9O+BqZv8RAIeE26RV?=
 =?us-ascii?Q?elx42qE8khpaNKc3+xfquIis0u7Vl0kHXOWn9NN+m9mfU9TtLwfoHhmK2aQr?=
 =?us-ascii?Q?UJBIcdG0worF+dlTFo3xTHHv+ejAOSKBPnIUxuYGZBRSrUHR/aVtOZX2Y6VH?=
 =?us-ascii?Q?UJ/Y2eLqF9pl9BQf7FzinHwYTGohJTuFoABw6iN3bu0dXwZE1R5uF/o505jp?=
 =?us-ascii?Q?6dBDdpo8+zgnO/EsKFvlfFVfeO1JEQ4weUtcdsKzkXNwgy7LuVOe/ilPSxyS?=
 =?us-ascii?Q?/hWSZUqRS5zNWzNyDXWTWtNi8WysPR7vGGmZ8UsaUbFj3DRydCjK1MDCPIF+?=
 =?us-ascii?Q?/xJ0B4uMR2X/PiM8awLuq0yz2EuKsSJAMUB5WNFwpPfrxTZqAb8JMAgKj+Ls?=
 =?us-ascii?Q?Dk7haivRZg=3D=3D?=
X-Exchange-RoutingPolicyChecked: fqp0hwJ8er6Q/IUNoPkvOMSeWPvw+exrpECH7VDg0uQ2dZ8eTb7cE2K7Vo+pCG7OSTrJrk8yRtgd6zKt9byBVfIVSvYny+T1FgGYaP3/IOH70Bx1H4Tzh7dNbKWyBDLJv+8F4C66qi8GSfm6Kvy1bD9i67jcz2XW6GVKhU3011tZb72xGvwYOFUr4uKlPc+rxv8bXgDF5Nk6gs2wKj9Wnb6SGDXTrdrzF0owTVD40cxF4Y6a65dGvaWQc4dGuNLAN6OPBHt4lY44+7O8jrYSDw+6Crt68ZHkv5+mBSB022FysWVZGgdWbxfSI7UUCwFDLokjHSKPMp+u/j5rJsfzQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ae1dc4-444f-4e34-43c7-08df159f429d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:09:47.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUwirXJDWu1G8mCmsxNq0P+uw/tueoSyy9LtP0CB6SAMP6kQqreMYdQ6jnltE+NPmZbVwzf/vURkEnZyFe2ZQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
X-OriginatorOrg: intel.com

On Fri, Sep 18, 2026 at 06:18:07AM -0700, Michael J. Ruhl wrote:
> CRI PMT support requires callbacks to access the discovery status and
> control areas. Access is a common MMIO area that requires an index to
> be set before access is allowed.
> 
> Introduce the necessary callbacks to get the status and control
> information for CRI PMT usage.
> 
> Add the glue logic to register the CRI PMT functionality.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 115 +++++++++++++++++++++++++++++++++--
>  1 file changed, 111 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 63ce9622d6b3..0f6e3be520c0 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -358,20 +358,120 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	return ret == 0 ? count : ret;
>  }
>  
> -static struct pmt_callbacks xe_pmt_cb = {
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
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG) {
> +		ret = -EINVAL;
> +		goto dev_exit;
> +	}
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
> +dev_exit:
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
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG) {
> +		ret = -EINVAL;
> +		goto dev_exit;
> +	}
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
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static struct pmt_callbacks xe_bmg_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +};
> +
> +static struct pmt_callbacks xe_cri_pmt_cb = {
>  	.read_telem = xe_pmt_telem_read,
> +	.read_reg = xe_pmt_read_reg,
> +	.write_reg = xe_pmt_write_reg,
>  };
>  
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
> -	if (IS_SRIOV_VF(xe) && (xe->info.platform == XE_BATTLEMAGE))
> +	if (IS_SRIOV_VF(xe) &&
> +	    (xe->info.platform == XE_BATTLEMAGE ||
> +	     xe->info.platform == XE_CRESCENTISLAND))
>  		return XE_VSEC_UNKNOWN;
>  
>  	return vsec_platforms[xe->info.platform];
> @@ -399,8 +499,15 @@ void xe_vsec_init(struct xe_device *xe)
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
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;
> +
>  	default:
>  		break;
>  	}
> -- 
> 2.43.0
> 
