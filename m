Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E422A80D
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401635; cv=fail; b=DRfnWE9HxcZNmWjn8VI+OZzvSPtGhFUlJciJYzlHr5XqxbFyLoIkF4VvyM/XfaidaCpsuKaEO9KR6du7e79HlsfXVzed2x9UWoRuCV3WsiDu6nTvIXkqE0pNKa54rFp/z9MwqGGYRw+csNnu8DNk4/wA/lRg9JFdgbqOqBswrxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401635; c=relaxed/simple;
	bh=cYVmidmzVfCdk6d45IHOZzzSBIY9RDBSAmxliYorGCU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l0wpq0gTKc0BdpSRBaoPCIrWyt3Lq4J0H2ogj8VFdqsbRbXLsi5/bawk4MNYYzUcwb8gwNA7v0RD4jWqQ1WwtvS6PoIlqnE9TK6v1evDiO5XCq/abKOWyuqEJHu8M3I9T46eVpkxwzxNBUaVTdBnNX24o6sbWB6QxGEdhhfTKqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fj89N4cT; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fj89N4cT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789401635; x=1820937635;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cYVmidmzVfCdk6d45IHOZzzSBIY9RDBSAmxliYorGCU=;
  b=fj89N4cT1rfdFOQeNyDCnsllCeuVE51BR4NonR5ySGBKKOlrFCdkQLry
   Xhvi3wUWoH2LhuzPHZDbJmuVT0YqZFM2LWtxvdlZ0SkZyLchk4Ep9inWn
   MNZbwnTCw7kpa3xzpoEL5mpVWbxhkVLduW/z6w4+RR011VqKw3gUyNSAP
   A4U0hze3CDi1lAHVbBFID5Whd9W2AhZUbeBdgKe3UgixDz2iONHaPCl6S
   6LubLsYpKDWF4AKO5npEXETMBiFVYwiYAMEHtnljEN6feYTSqmvB267F1
   m7gcBXERRMlqLuYGJ9dBP+bC9N6tB4P35Thkvx0QShjeTxZdPOi+aJxYT
   w==;
X-CSE-ConnectionGUID: DtPNQwT0SU+1a4O4Dhoegg==
X-CSE-MsgGUID: 5y2zQAPHQxOx11P3m1SWkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107127658"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107127658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:00:34 -0700
X-CSE-ConnectionGUID: /mkEVGxVQn6n74DMh7rCew==
X-CSE-MsgGUID: UwW+SJjgTWW2LoLzuUe8Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296169606"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:00:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:00:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:00:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:00:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXdF0AvJHhS44T6ef+FFgQbbUnYt5ba5vOa0pwTiGpDsbv7wcxUwDb1ieixezdPYGT5bDNAR6YTBcKbPzc87sqq/tLMgH+fY9ZmIZY4bY2UvlBGfAr4ThAEnBdA8Q1fze7wwNZ/EPWzKUm+hCD99eVCEAzWA8OIVj350HdaervPHAW0WAYX+apbI71+LC0IY48219nXUXAkLdkmhm/d5BDJdhkOURUCDLTyombLM6oixldRybYXTqpNonkYaSDRD785saiu+ASC3lesANFUy6WL3/qgtiCmYiIgxrhaykRVDr6Puqpa2WtkIpuodJPH6lLesrEpJMriYpF+zygQmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvVGu/5hGROVFGD+6p36fmSMBkBc5zO8/GR4RecItJI=;
 b=QxY/nedblz8/tB2HhHAErxC+ah6mw9VD8zU35mvDVOZ2S3PWuTIQIVpKDDszne55oWwTVrzFtQLjMvNCEQl9reIROD4CzAZEHfgvM2bori7/Aal2p2u/dNK245ivyjWYGLfF2Hvq+OWVQeOWVAZrz7XI+qLPcYpIablWFFlfzwj45ycEqiq07XTmojW7aCl4zwYcGuB5hPGKd02agqQ7EPmkmqJPWWv/8z7g5bgHPrJO2Fjp0jCOaCN2PFPDCbTDE4rrOfDDWt/bJXxorSKPt9phnJ/e8aQDMcwsZ0ZExUrM47WNkhUqZJR+z9KKATcoBq5y6ZkObZYQy9eEiz4X1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CY5PR11MB6368.namprd11.prod.outlook.com (2603:10b6:930:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:00:29 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:00:29 +0000
Date: Mon, 14 Sep 2026 12:00:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 01/20] platform/x86/intel/pmt: complete pcidev to
 device update
Message-ID: <aqgaF_wP2981TFHN@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-23-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-23-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CY5PR11MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 101dd0d6-6089-46b8-f156-08df12794bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ZqRqrFaWtyo0Kx1B6kf2v0clxWYlINXc4GyGhJjfW4YlemUJNT/F+NecOzoNPjeAgG59bJWVFSkKirKhZ8aa3Yn2OuhKs1TnA5E/WJx/wx/cZcys8B7/XL+NNy9UycTS2tG2H1SdIP/CJ8O60RyyG4FVA8Iy0hoRpWwKFR85x5pCKpyAdjobP/bsGmmvgh3gh1uWJfp1nzkX1dfEDTzbqyE+9xI6S7ZgsQyJH3Nk3jZIGT4WU3Cz2PI0SbAS5SSaXbbe6qlB3SwaP8b/zth6m6ehrWQ43WlO4jTyCDTaqHs0Drgg5/HfTq8THmcEDlArTEVO+K1SCD5JlmFfl3UTnm5xuEbXyu3oWYVM7WrS5MDViVJlaADXDnbP8Tf0a8pHI4UBSe22Kw3GCcgHl2nRkgq5W1LdxlAFFc8Sce6vft0NN6n/DZQzJArOV4kma4qJIo6P7irA782iTb0qPEAr/jPsZSDb0WbV4i6fkRfW2GQ7jPDrGn4TzsNJgU+hx22QuoUUrMaBhevDXZJVNfz/m2UEChXYvyut6rYR48sqguyKWUIZ8RQSEM2MfAvAzJMn1E5NPD/FiTUl4oLUUw8KXNPVx0xi9hvfsEUUq6kH/dFwS+Uu5vHEVvJpBhPt1HtBxDi1nacNYaBm4gI+TdK8xs7UUq1kdD7vAu6EvNV145c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YuLN6gooqqwJqZiGNjb0SZ/r0ih06q7P7uel2t2RltOKsIt+z5Tq6UJlZVrt?=
 =?us-ascii?Q?papwvxPcMFctJTOaRkWni28T7zRWoT6eMnNsdBdfNKdPbrWfrOzhJOKbjPNY?=
 =?us-ascii?Q?yawJ5abNKaESmK6hoXrDmOfuoC3MlBs4htEseJX43GFTmXpk0cUw0s2fvuQe?=
 =?us-ascii?Q?8KRPrD3/8p3di2EALEStAFInzolBDv/7pNgMnvZMJDgVfIz+n/gn8QD7E1L9?=
 =?us-ascii?Q?a/W5oGqukZ0pIQylc4cYel0vVFe2nsbfRrozLFi9HSel9Z5O36eXuecmI541?=
 =?us-ascii?Q?TAj6J/B5OtGBQ/g9QF8F6GRJEHWlCyU/0+1Lizf92loUbDN2myz5rK/PA7tu?=
 =?us-ascii?Q?TzAyXgdbIxsdspPuHRFjaASr+DlTWb+4KLkCi777664URmGqybZ2RlOdpBUC?=
 =?us-ascii?Q?AgF0xCPFRiDb0FJ58KGBOwlnBXShhVdZfAl5/C52DQP+Zzh/41N8e3mP0wjy?=
 =?us-ascii?Q?lbyFh0S71cDu+h97EklKsRiuGjcb6HRKvvn94C21ns1Dr47m+8UEsAXl+QRM?=
 =?us-ascii?Q?s63qoDNguh0Z3mMn1TTL3MvZIEUnC6Bmbz67Wf6K9xPGxcsHdwP+e4r1yJZC?=
 =?us-ascii?Q?jo+6jEWGOGOoGkJaMoiyKmNUTuk9zWQd7eitonKgKzJfP7ANwYqYuPohAQDQ?=
 =?us-ascii?Q?U1gw/gcqMz2+DoLdDiTLbrFrbIzZisd9GXmHXSjJM9DB9Rf7mc0UCQWCqNWu?=
 =?us-ascii?Q?1SoUh90RkuPYVLV8WwRsmrXi9TVZVvY6wUHbKZQZAGszN2EAz1jKS9Q0pQlD?=
 =?us-ascii?Q?eEQTyOFqNuZ0juPxZOrb00r4LO0Y3oqemBWcNzoGeuqs1OyM0StJXMY1PVTP?=
 =?us-ascii?Q?XiWoOJl7OXNTpuHTJGB2U9u1tpoamQTE6M4hZeNlZOAhcWBcFFDujFU1LgIO?=
 =?us-ascii?Q?JbIMA1qI2FvWqKpoMO269YYd8z6YSCvjf7VTSpeHekUsg1MqrIEUvXIKY6ic?=
 =?us-ascii?Q?Hym2TcgwIaI+Ikgm2uFnYo3F05dI3d09Y4xRCI55FhBYBWgigcX8PvP+zebu?=
 =?us-ascii?Q?RsYPyUqOGKWwwqa7VAL3STxt/sDcqe3+MfVV1o7vMrLei2TpwC754aijiYw+?=
 =?us-ascii?Q?h8anHG/29/Ug5L66F6bE2FVrhroMQTM2TfncdZdvumDOycnoCeXm4zfTTwSr?=
 =?us-ascii?Q?Z+c6LDfd5BCNOT7YjOfuECij6eT/UfXLhxKVCSUjNMo5ODd1uhXCz5MBR0h8?=
 =?us-ascii?Q?n6qSpGL2hsCJ8+K5jbr39JTPylBk3sJbriWALQKU2PJbaWFuu5cxS2HvLbyY?=
 =?us-ascii?Q?5T5OzT1CIVarJxnPtrJ5ZehU3NbZioLek8Zt6WlVAik/0NXirBe6hucqJAHc?=
 =?us-ascii?Q?VAl/ejDGTy61ikHDOKwizbx4WaLjEqY9OoLYgIQvd2DXOCf7Jwu/2W956GeN?=
 =?us-ascii?Q?e5HgT7OUoiUcnWD7F0pfLn+fqm304EuKu6iarP7fCIMMq5JaoYSlsT1500x8?=
 =?us-ascii?Q?I8mfn2bq+qiM1iZMcf0DRmZf8NZyjTGL0ygM31yxZJ6F9hytkqQbTxc0vkRU?=
 =?us-ascii?Q?PM9jYd4vYTzkqlapbWZvZHohgW2eU6CmkwUbyInF17x+/HWPYwxpa3kBrWiv?=
 =?us-ascii?Q?A0/UxDM7UfXN7zi8rzWhn1na6eGSAr76pgeoiMPUD3U/mo1qmo1Bw/+Y0Xn9?=
 =?us-ascii?Q?0nzSU6gFJ81otmo9JevPPE9/CGFK4rcPT0kv1gAn7Ad7Up92vVS5Un2CFOvK?=
 =?us-ascii?Q?Ex/ZM+/4eMjqjYt8pV+EiyJuvcZBFEPPP4paL1id0E235rr+Q7wGQ8c6KfyS?=
 =?us-ascii?Q?yW6jIyTHmQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Bva+4jN+o7jM6OW/hOF+vvK6SkfPggk5Q1wmkRc694PP2MrFpExLjyAWAh3LRUBk0TF3Xxvik0WJExe3rcVMCYpUM4wez3VDNmWvBwaO43aoTHfIDveX1OiDBN6z7u2fVJl9ll4elmNKkNZkeuEuTUyGBzNHTFAcdikpAGlATsNIereKmPTOcT8EVsUqSZMktGM3CVo3nkpEc/K19Yhf3ZFWvXkAVumPikFzIF3XvEdKENa9l9/EPbqPHgnQ6MY/GfNE12rhJG8uZU9BRwVZlF5BlAi6RLcT3L7IrV6SixznI5uY5j2WGu9x0oMOdn39lM3qQ9DNSDnzgBEqu7dD3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 101dd0d6-6089-46b8-f156-08df12794bf6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:00:28.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lhQ+QdACrUTKwdwjqd/cIZHATykT0rnuPFwl1vmZfdUA0a6SqIesiA5BShXeCVSpPNFsOBuz9BQc6pN4qCagg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6368
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:49PM -0700, Michael J. Ruhl wrote:
> The update that moved struct pci_dev usage to struct device is
> incomplete. Only telemetry endpoints are covered.
> 
> Other PMT features (crashlog) are now blocked from using the callback
> mechanism.
> 
> Change struct intel_pmt_entry pci_dev member to device.
> 
> Update callback usage to use the intel_pmt_entry rather than the
> telemetry endpoint.
> 
> Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from pci_dev to device")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/platform/x86/intel/pmt/class.c     | 5 ++---
>  drivers/platform/x86/intel/pmt/class.h     | 3 +--
>  drivers/platform/x86/intel/pmt/discovery.c | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index d0ab8e33c62a..402d51df834a 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -100,7 +100,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  	if (count > entry->size - off)
>  		count = entry->size - off;
>  
> -	count = pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.guid, buf,
> +	count = pmt_telem_read_mmio(entry->dev, entry->cb, entry->header.guid, buf,
>  				    entry->base, off, count);
>  
>  	return count;
> @@ -286,8 +286,6 @@ static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
>  		return -EINVAL;
>  	}
>  
> -	entry->pcidev = pci_dev;
> -
>  	return 0;
>  }
>  
> @@ -365,6 +363,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  	entry->guid = header->guid;
>  	entry->size = header->size;
>  	entry->cb = ivdev->priv_data;
> +	entry->dev = ivdev->dev;
>  
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index a0ece4fc3837..258cb460e61c 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -20,7 +20,6 @@
>  #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
>  
>  struct device;
> -struct pci_dev;
>  extern struct class intel_pmt_class;
>  
>  struct telem_endpoint {
> @@ -42,7 +41,7 @@ struct intel_pmt_header {
>  
>  struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
> -	struct pci_dev		*pcidev;
> +	struct device		*dev;
>  	struct intel_pmt_header	header;
>  	u32			disc_header[PMT_DISC_DWORDS];
>  	struct bin_attribute	pmt_bin_attr;
> diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
> index c482368bfaae..f4203d240f54 100644
> --- a/drivers/platform/x86/intel/pmt/discovery.c
> +++ b/drivers/platform/x86/intel/pmt/discovery.c
> @@ -609,7 +609,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *entry)
>  
>  	mutex_lock(&feature_list_lock);
>  	list_for_each_entry(feature, &pmt_feature_list, list) {
> -		if (feature->priv->parent != entry->ep->dev)
> +		if (feature->priv->parent != entry->dev)
>  			continue;
>  
>  		pmt_get_features(entry, feature);
> -- 
> 2.43.0
> 
