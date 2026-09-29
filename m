Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D91D130E
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687598; cv=fail; b=HMXwMKfkWAZBqhafzCDikEzxZVQYRCL8tyvu/jPzOL6UwBSdtYtKAONcYGx/l+0j90ci0d8SBUrqMuFi+uIoysvsP/EnLbQRyZxOvWnxsp9hF56zve/P2BNW6AcklMFPtRGrYwO76cfTz5kV1ddFqhMvIgFSRskuWdX+6jwZZvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687598; c=relaxed/simple;
	bh=BKS7k4W4YUl1GCUl8MK0WwMuBefhq1cj4Upg3vKtlsA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BC0gc9fN6Di5tiw2EKv4jQQ8+i7dSz+4FoPIr+ECONuxmYeer0HyAP0Eavin05OcKkcNdNCsqPQS/4t1EHMrnhQ7nmXXZwkiCDnQMUkjt1msFc9ADJ+LPwggFMAEN/FMfwPYtdgnl2lTT1cYlPGoRC9/mVyyRrvCZ134VMMOzDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyw37rQu; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyw37rQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790687597; x=1822223597;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BKS7k4W4YUl1GCUl8MK0WwMuBefhq1cj4Upg3vKtlsA=;
  b=cyw37rQu3gJ216JR4nzbsDyxx+zIZi83z8gkNYWqYKLTwtt8D9jpf3QC
   nizNfXmYBdgzihqt0pGFpF0KKRKbVMLOCMt9304DVxGqE0WfB7ZfyqLY3
   13qzTQFT+CZ2BBoFBjUIe8oCmgS4JUOrEuoGYS2OZJIHARFwxmoQ4ibtz
   ItreYIIvc//waPPabCSbJMG8e8BZX1TLxU9RVrsZAbFLjpzD0rPkjvmKU
   tJIZpHrTqCj2C2Tc7qAsQCVenkPSaguF2KfeWDS2x3Kaj1TQfSSivJPXN
   SGnBTHSyheaS3yvLUpFuSLlmERmlVL7TSkzTHkY+98VqTl5LXj0nXNg0o
   g==;
X-CSE-ConnectionGUID: SiacXRUTT6yUxRJ5503mMg==
X-CSE-MsgGUID: WBY5KkwMSMeK5hitkgNYqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="95217533"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="95217533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 06:13:04 -0700
X-CSE-ConnectionGUID: MkRzF5qbTmS+r4BntvnBJQ==
X-CSE-MsgGUID: bFptQDovQ9WSwX+nArRe1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="280103033"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 06:13:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 06:13:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 06:13:03 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 06:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=audfP1gGuSkf9mQsrjvNmYEipYEawVY4sXTJVPtMUWKjSGT0IPDcollP9gpWOn6wCoiOEWT093V4fRe3XuOpr/fR3WNHAMBj4mpAmqCz33zEtYWlI1wiLvwmfiK18boEMYdD8hMoG2LH/LiC/551lCtCLyekbd0hVDulNdK0UCj05PNOnR/kXDx0En30kGy1ALmJ+0bwZA0ezd4bo8drXO0gxEzdTqDzMAP/y+/P6AvKs6vJYs+93GDKLegvBzHgQsRCCLhRNImA7Ck8QVr4FuK81GhRAX+QHDLXUmEeTcrqd5/f1urYz8vmv2yJbKJROj054d6zJWX0QiWG3zHy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HR8eo5TjopvFmwG1MFRsW11gKYzcPU4LwTMw7cASmUk=;
 b=J7YK/HO5S3ZXFGTF7piN59dOC5ATaBBP0iO1KmsZdldKznttmegCcs42pOKCsEni6cXAJNYXizbV1XSduwQBg/ewEc+eyZz561KrnrOjq8hM07WEtpiJ9jnUhGksn2Dc/8trnY12WT2naU9+LRvsPyoM7WRs9Hiq/nC1I6J7zYC3vdKq9QqpVJCNgcY5xTkKXp3lOuY+etw+RH9ZwiiFvDFz+ja16Ai9zmY+1Dgfutsm9fHL9o/4VaeZKn+7jjSpgmN5u5kF32gkJcQoOul/2T3jKqIFGXeDj7f6sEKtSK6NgQOWR6jxz5gM+1qeOHeIqelRs/7HzZbKsw6tiNJOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 13:12:55 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 13:12:55 +0000
Date: Tue, 29 Sep 2026 09:12:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v11 05/20] platform/x86/intel/pmt: Do not remap when
 using callbacks
Message-ID: <aru5ONFbQlwDoMfI@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <20260923181115.2514193-27-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260923181115.2514193-27-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SI2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:194::11) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 04014092-af28-461b-5834-08df1e2b5f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: Z7Dy+yz+Jb6jZlMTYM/p49OdfeHLwjjA/QTBKl7oTyZIXDqx8Wt3sW15mS08awYfhXMyE0Pc5x9Ce1RPyrbdKq66BwxKFDcJ5gL7LaWEEmfVllrp7cmuAmAKWH0smm07QavN1C4QDFmDr/85YAvNZozbjThB78Tbks0be8u2aylJ6LV25CF99vl0xNFRoG5f+2Ww98pO07r9+pr94zTGyD+xTTHhxoRJxzdDJ7ON1xDEkQfGW00Zw7IPAwj6+UmjgK65uBKnH2889vZtJN1PDbmCsLa0p3Uw7MI6AAu3Fmv8XHX/fWdqE1PLLjLY19+7u3IXv+lrhxKhiy2sY7TCgwbqUhu1yVfV3HwLWuxhgo2USfQtzOwa2bsV+l6PbtCEBzWaNVgkOxJ8OvO2kfva+bgzrWY3fGLsjhMHjC/JaOlHdPp6OaVlKn1aeM0k9E+2Z9LW9dD92/wE5OHTVn25umpZJfUbUu/dOdJTwqaHfwCQ/okULrspL8LqGi7tC3f+Qt+OtN2m7I9nyzesTHysaymTD0T9l9IMQdPdjp4QgtT9pSF9CA1WIe9k22i+MnQW/SiNnhqzeiJ40U/WOJMnkDK5zXLbQ/4zyHK8m1FUtBUCzeGGe2xJEoVPlKJY3QFTLr4ZBZr9HJMw6uU3UOAyPOs2covARjJvPT78QVKrqqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qMgKCXc/NHlf+ZNUzbHR/xQBAGBSuIepcuh8sFyPGvJMw3nLVjBolM4W6kUO?=
 =?us-ascii?Q?gBQQlCbyPGiIFYjj5KCJ1qBlzcWTwBEqFR6Q4XxZ4QCL4Z8bMJcH1w5tVBiU?=
 =?us-ascii?Q?/3PqCSCjHSKyi5osGP4wW01n0pJd8RTag1Nfx3N/I1w4LhmtD4Yok0oXgosV?=
 =?us-ascii?Q?D2wwsgohG8ZcwSyJX3Gh5WvYic+n5n+B11WOSIwHmCXhYrklGyOCPGC0HF/n?=
 =?us-ascii?Q?8j19DehgjIC8gDZEs2ntOX9SVA3lt8d4jsCh5U6rhiI9t+HPXTuRURdO2Oi0?=
 =?us-ascii?Q?/v7BNehhjVElckicNp6y7X/RIH7+gf+Fzw9riv1OPAgCkXDFcbUmhtX3QcqL?=
 =?us-ascii?Q?FFcJVumeOIPAAozpZAfIuIoDKxmM8MDPYJLrY3ayBQx991qdHByJICvdrM0i?=
 =?us-ascii?Q?FeBq1lgn5PMFHyUYBfiAKEyLDKnriWqpCXccRXU+g4G/9dzF2GRYoI8iHePe?=
 =?us-ascii?Q?3vmTGFjfv6GrCxAL7dBOQbiHbn3xLhIvl/9c/DBTotNDmJkISPC/TUPlluFk?=
 =?us-ascii?Q?266Dh5FexhWxkLNFYLEvuBLzeiKuF1krTMdVbozokfrnKhw6Q3m5JQQ9vr3A?=
 =?us-ascii?Q?OSJ8sLfLFw6GHXNwP7P0UH9AfDdrsk/RoR/s2clvMweLtBn3obuM4vR/cTDF?=
 =?us-ascii?Q?uiogIkKaKX53pyiR3xQwOD5ruI+2sBJkEUYY51K2bqkzCZNvn/fe6KgchT4g?=
 =?us-ascii?Q?Hxn1NOyV4vN9/mxK2jjRAfn9/smEEFYhwatJuo4IpnPI3XamZmCmzixWDADw?=
 =?us-ascii?Q?KFhl4OZPXNMh0B73Nnx6xrY+hEj2/50OMCcIxaM7eWmTPl3sHABwqdKXsCce?=
 =?us-ascii?Q?O2Dy8KXCUxXXtdpWTlL3vb6/pYT62dw/VtR9cBewIScVeaS7Cz7UEvd3Iwib?=
 =?us-ascii?Q?hjysfymIQLijxSaoke3m9oH7aViVqcx6mKpMedDWtVfNeMKI5vfS27UD+Ka+?=
 =?us-ascii?Q?EZo1QCAkgDFQgw5CMx95TAPs2jkqD6Jz2HIzqIEdASDNLOkpIOk3LymYQuGW?=
 =?us-ascii?Q?mW6qnjKqA9xS7EaWREjxUqrHyAa1Y+3Z6QaSuMXTACwoDfP+Gjy8UMaSxV8L?=
 =?us-ascii?Q?YNAZpQMvTqUpPFnyAA8i/uN+SSML/kZc8Fi6iER/dsSWWRwH9cCBD3a5SJU8?=
 =?us-ascii?Q?T2xhImbo6dUnhLbHM6OuwY59uOW37CtOHecNN9h35PjPqOB2u14tZCo0FD4M?=
 =?us-ascii?Q?pzp2RwsA2MwD7yEeQ79m+XjLtdqptblNn2IHrNeUzYT+bkffeWfdnai90kK0?=
 =?us-ascii?Q?p+4XAESA+rssDAJaPODuIfmXstgrBQOUVlrfH+hsqlqDiqZEaNI8ippwBtMg?=
 =?us-ascii?Q?4w0z+R7VP/ELgpWxS2UdXkBuYW5UPqEu5z6OG0mydaBFTYwhng5LJxv0Lczd?=
 =?us-ascii?Q?+wk3SdguDYousPr52Zc3GS9kBOfGswwj/FvOvmVnTTS1bodZ3TsZJGAGRIue?=
 =?us-ascii?Q?L8tGDfEs6NAtdq/ENvxIZc1BdKPHCuzz4yKQkUTM4U3uBsxGtqqCV8UVhSP6?=
 =?us-ascii?Q?ieAMQn2UC8apAfjuvThU7+7zsFDaZpD/01L1Idshd5WerHGu7VWwofFg5Vw5?=
 =?us-ascii?Q?UqKvZJ7oClHxs5yr5oJhOl8wbCmcyJhWHCqJj9gExym9CaBi6GcBregDazxW?=
 =?us-ascii?Q?tR21t6sSxnVT/wPfH3NLPdvIWJbU65sBIv6NeqlxgWnEUafixletk/OafRu7?=
 =?us-ascii?Q?kvTkds3SInrH1wwZAHoatOapWavV+ATX8FBmjU4JlLds70AtAmYakNEMfCxd?=
 =?us-ascii?Q?CYxrzowcXilRPREznVb2LhsVDL1R0Ms=3D?=
X-Exchange-RoutingPolicyChecked: NzqQEXXxGwRCa87peHBVOyuo4/2p780XKGZ3hMmN3NqvvHeK0MsaCiUCxW8IaD1aZtwgfJIYnBFkujBJ6h6RDRVUvzFQXhSGINy1GmZQ8N0dzE1ju1Z1V8itfixCqQXoCH21P/3P1lOHpH+Fv5eqyXoX0sJqpI7UlCMMy1HKNIoXwX8RCkq8UYUudkNd7yvs3hfhIMG6k8s+VlB52mdeGzbN+DYNE6Ri6oGzvELjQcEbBxf+70LVhmnvUla0vmQEN+ZvhwVUrNHg5k95t9OxUxBtn9s3cTtb8lzVqzQXIhWPXEOo6BF3n+gzuTd5US3xGZkCs/F4Z1eVE9MQS0fcHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04014092-af28-461b-5834-08df1e2b5f7f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:12:55.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgFVlCM5OYB6sPrvpBV0gq4vnD+a0SWfzrSopKwPX+/GL80jEoh29aAsYAJFAA2Vzi+xw+AfyDyTxPA2FBXINw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-OriginatorOrg: intel.com

On Wed, Sep 23, 2026 at 11:11:20AM -0700, Michael J. Ruhl wrote:
> A callback indicates that the parent driver is responsible for accessing
> the data area.  Creating a PMT memory remap is redundant.
> 
> If a read_telem callback has been provided, do not create a remap.
> 
> Enforce API usage where necessary.
> 
> Clean up open coded resource usage.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/platform/x86/intel/pmt/class.c     | 21 +++++++++++++--------
>  drivers/platform/x86/intel/pmt/class.h     |  2 +-
>  drivers/platform/x86/intel/pmt/telemetry.c |  3 +++
>  3 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 402d51df834a..1c7a372b4fc4 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -12,6 +12,7 @@
>  #include <linux/log2.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/ioport.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
> @@ -373,7 +374,6 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  				  struct device *parent)
>  {
>  	struct intel_vsec_device *ivdev = dev_to_ivdev(parent);
> -	struct resource res = {0};
>  	struct device *dev;
>  	int ret;
>  
> @@ -403,14 +403,19 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  	if (!entry->size)
>  		return 0;
>  
> -	res.start = entry->base_addr;
> -	res.end = res.start + entry->size - 1;
> -	res.flags = IORESOURCE_MEM;
> +	/*
> +	 * The read_telem callback is responsible for this mapping, and may have
> +	 * different requirements for use. If the callback is present do not
> +	 * create the map.
> +	 */
> +	if (!(entry->cb && entry->cb->read_telem)) {
> +		struct resource res = DEFINE_RES_MEM(entry->base_addr, entry->size);
>  
> -	entry->base = devm_ioremap_resource(dev, &res);
> -	if (IS_ERR(entry->base)) {
> -		ret = PTR_ERR(entry->base);
> -		goto fail_ioremap;
> +		entry->base = devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(entry->base)) {
> +			ret = PTR_ERR(entry->base);
> +			goto fail_ioremap;
> +		}
>  	}
>  
>  	sysfs_bin_attr_init(&entry->pmt_bin_attr);
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index 258cb460e61c..aeb04afb67cf 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -48,7 +48,7 @@ struct intel_pmt_entry {
>  	const struct attribute_group *attr_grp;
>  	struct kobject		*kobj;
>  	void __iomem		*disc_table;
> -	void __iomem		*base;
> +	void __iomem		*base;  /* unused if cb->read_telem is in use */
>  	struct pmt_callbacks	*cb;
>  	unsigned long		base_addr;
>  	size_t			size;
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index 953f35b6daec..5423a4dfce08 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -329,6 +329,9 @@ int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
>  	if (!ep->present)
>  		return -ENODEV;
>  
> +	if (!ep->base)
> +		return -EIO;
> +
>  	offset = SAMPLE_ID_OFFSET32(id);
>  	size = ep->header.size;
>  
> -- 
> 2.43.0
> 
