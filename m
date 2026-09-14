Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C202D97B7
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401700; cv=fail; b=jhkTzdQnKnjvEgleC0wT99G4msnmlvcLBxI0F9RdiMz54WT3nEXU8UslM/QEhnLXXtQmB5bYzcm7dtuiCsySG8BJLanCcHGAj091x4qKvTW9fxLO4R9p2WR3wLvPPwg665urI1bea49FnUhAcfv9Ga1OTFcxyLP+TNZo9PPXG7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401700; c=relaxed/simple;
	bh=awnciAi5fetPRrnXIO/XLpRUZMVsMCAlGN+yfsqgVfE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b//02Kw24G0hBm66Gcbq8kZV0gRL1gLoxwD51UnkxGJ7ORrDI5oFyuxatOc/EADQgm916Arv+kdSUsMfE/MczLkrER0O+VYs+3nLz+99ARFAjD2LbwF9ea2lreLH0RlRNg+VfvuZuXDwgRtu9IehTOUPCgbgFkLCPcEB59+ecCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4r8GYJw; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4r8GYJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789401698; x=1820937698;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=awnciAi5fetPRrnXIO/XLpRUZMVsMCAlGN+yfsqgVfE=;
  b=N4r8GYJwE0P8bXaGpaO3CmgQAJFBehR8a9hMnj8MBIWMAmtbARUG80oA
   pKCFy5aPDC8n8/a9+nBQBT3biplQfxobUpMapPvCeKw71HpHXd9y2GkBI
   y/0wyQDMjnzNasaEUmK4cnZiYEF6DARCUHkM1pVl5165ZN+2AOS4yEqU4
   TaHv53QcveyjJxERRiREZpdzRxKMcHPw/vl4T06HW/DgWYw5mEV9yvs+i
   k8n/CLLCJbLmR0oOMmKWbJPdA/b1OctEa+jj+DcXfoxtme1AYTIWwM1mC
   HslnaIegBSC4FGqFk9dVMjFx8rrj7P+K7bZ6HyM5FsRR7Dcbho/PxOCVW
   A==;
X-CSE-ConnectionGUID: ZEGXKTCWSoG5QOsdk0+x+g==
X-CSE-MsgGUID: A0NTRwRLT4Kf+2SXo+SH+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107127961"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107127961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:01:37 -0700
X-CSE-ConnectionGUID: QtvJHECyS2yDyRAmYvDyEw==
X-CSE-MsgGUID: GvNug5AdQvqehqwmEEBHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272177085"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:01:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:01:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:01:36 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEOloqxBRjRvQoHkaEX+P3cu3D74SalQrik9Tu8e6v4mGxY4iiBbZLTLF49Amvxm7dH5JLPZrqtzX4/zDHKdJlU9EhxfmygsmlkDPqbePp31MwzQb2Y0qeNGG3yhTrlTlBtwNBU7kX+nBjsR1AXxiBDBN3D0VJTW8JRy6fjFl8VOuVJU/mfyxK1qg7se3R6zLjMXR0OBUT6AnW8MiYkYKdP9nOxaWPtakTo3sn+UlYIvx15LRMKOp3xmL1P/USFhTdLwoBP+UzCiJD71EvSUVBLBHzGlAyBCP8b9XlcRk6i/X19F1ZopeZyZk8DMQaHY6EWc9zLBDOiM/wJOQJwMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDzgfDafBX8HEcFjMdOHC8GuEhgY5biT1tpxh8adkrk=;
 b=idTJ/kJ7KQ6EKp4NHn/rXGvEBoA2GnUWnVqB5F2BGKT7MY3/cA6UVn+yUPdM9m3rxlkcm7fVEImsmDupsd4sBwlmfdTdavX6UuBPoNBX61+I/XL6uCLybVHuz3BLgi4YAA8pGgSoWr39Y/HiThxwGiFoZdkgbigwUlM/MxwDoQIP3xhG399D0IaubQiO7jLmg5lOBXxu+AAP7E77w2Eer55MjwyydAJymdsd2Hdxzc2Aa4LAu+wp9AUfmVdDx6IDKbOiAh1eTh6FIfVxVI5wUEbQuuB5PYXDu5l+/2idujQAeDvmIZBxu2tmLdpXq+cwnY2FGTRB13PyS/kZZgzZ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:01:33 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:01:33 +0000
Date: Mon, 14 Sep 2026 12:01:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 03/20] platform/x86/intel/pmt: refactor rc with a
 return value
Message-ID: <aqgaWFcJBxZx-M-Q@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-25-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-25-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb2e413-ac3f-4334-e739-08df12797238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: cnKlhLXL8lC/JjxbPcIdABTLYpZ7SKzQgCFLq1VOaQUDSzVFzp0esiOHid1wtU1oyqdlSK9A/q4rkmBpNf2Qo/b/VhWeeL7Sg23KTQgNi+N67C1Ci8+sBC4cgmpc0SqlIZnY3R+MUXrLcbDylXzog5fvU6YxbEKDIg//v554GQX+fLiENUSdjPWs02JE8OgPkyITzMbaI4WAqLhuiW3w4cmE3iLOWlCqJXUeto9DR8jm94mlYoyRy9bLUWQSG9cd7kKLTI/q8dW+1N10T3c3unNz9IxQ1a0udWwYXTVFW/fdxCdx0Aj/fZ3t3sHbTb4h5PPo/k/nHRYRNU3BS/91Cf6E+hBo1Oy2zz0U3h7EZWqqeGtlf4anhfRtGuHpbfWMI+T99szbn0WvMhmPk+LDCNvrrG3HbyzLpH6dGwHk45a3Ruc2BOGH3upTeCzqSCmgc8eMcOQSkHZXctL/MqeYupqc9XX2RWsi84F5ykcoNwzWrceCXs1suX5S2mQ2VRgPaVjx7r8fGmjtCqoxIoKisK9Xbf6PK57klmYfbeMIKl4RorlzK9D8nqHZH4r0LLzrsbIBqWtTpqIZDB/HtfQokRkyTOZZi7IW2OH8bheS/W4mv81esKKkXJWWz7hbP34x4xxlUncPZp1X4Z/yd8CGU9plfe1mCyHYHqyOgunUKUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WbY0w9DvvTpTQ1b/thTQh122rk6kTTAUBYcN1yJ6pdAI7t1QkSvyNrFHeuzv?=
 =?us-ascii?Q?/fjDSsO1WGEL/SDIrxlbnus5d/NFYqNSdZTGMUZJspq1wgT94+h+/4YN2U4O?=
 =?us-ascii?Q?SVpdK6wJFAG8iVhEMOzsfreGEOBdjf3xC0Ewvk7HtJuJj01YPszIBc6TG0eH?=
 =?us-ascii?Q?eIaUi0N1zzLoJ/ZyaCugSyNCleJmG6c3Nt5k9stOMxMzr0jNXZ+TXe91mpHw?=
 =?us-ascii?Q?/5ga6vmDAr0mBCrBM8fZz86fYoOnQ3zRF4dSDndiYFH/9ymdibutHsgBuMJZ?=
 =?us-ascii?Q?FLhzVx+HDvAleyzz4b8/zaWAoK5nadiZ8SO1JErkHgu/92Nf7VVfQVdY8pGC?=
 =?us-ascii?Q?pzs3fMt+/Lhz5hpG6rqvZpi+tsfRRSFM59dEwpDm0cWgRSM5h0cVB31OeAUg?=
 =?us-ascii?Q?+tnqZULRNBNTS2RDvpQ3yDTRGLsBemrO5DeOCJG7IJ87aZgM5R0eZT0Hw8Du?=
 =?us-ascii?Q?sNXIKkDYHRFp8nYErV2vBIcCN1xkWpJjQshIANA9AtO1z8jm1SAPibJzPtQ/?=
 =?us-ascii?Q?uIlkgt9GmUMXe1brORfbP05hd7zKKEBaOT37nwWd9pwxzOS6MS7tPfDGYPRZ?=
 =?us-ascii?Q?sDOef8vIuddA5pNV8+VvIJ+cBASFx6yDfjVfPSGuVoME0u2WbvSpTlVw3c4E?=
 =?us-ascii?Q?KhGf+C9fecBzz6jtK97N39uUdpGpGih7umh/K4xI4zSv29XSor77Y6kA6Erx?=
 =?us-ascii?Q?eCAh/cMFr2b4ymVsRrlY7oubwMOobjLzkFFYlfw2xQWQR8YPEGDfgyUNlGEJ?=
 =?us-ascii?Q?ZbIE3rjAF+ZYfpIjp9vp/5Se1UiEHU/msLLzhxvzLFkWd34dELLlFFKCi0w9?=
 =?us-ascii?Q?fFp/h90ovcE+Cv2+FOUOtFOqlkInJ2xHFoML6seBbs1VtKoNRs8K6fxmY3MF?=
 =?us-ascii?Q?1ApmDLUqK8ekQyuKuAb+bVlR3tdeocUyPXCdoALafvZ3EcwYejCJgoUb+YRh?=
 =?us-ascii?Q?/ClFAafjylia+BZGVhZ0TTqitdIsnDRZil8rYkQR0bXQmGdtpA+WE4Hd2YyH?=
 =?us-ascii?Q?pnOa16IJGXUHLH/d5HnPcy6V2PCdhA+g/tveXoPM1KU4gLm+wIyZe0eimFFL?=
 =?us-ascii?Q?658r++HMgYN/cbki89F58pj2DAiYcmCWDN9CLsAQxK2MKTN41T2s1NvB+v88?=
 =?us-ascii?Q?1TKS/V346I+u3VvuyaB+NKwURvE8gy00dEs9ryMPFwBnnD2V+6Osrm+rnZSj?=
 =?us-ascii?Q?1RDGK/+SEkhfvzYGPXZvKPcrnCHbybn09YFWXi2tfEtESfq9mCBftUWBJ88G?=
 =?us-ascii?Q?xXRVNH1zi2Drdt4JU7+lHzeVLhEicsYxqgV5D/MjxwQmAMvGOPKi7StglRD6?=
 =?us-ascii?Q?SLdXaiQzcvH/9PN5g63xtCTBug3bQUE7amxCEwNIG57std2Vmj36cUPs9ryp?=
 =?us-ascii?Q?8gSB8DDdZSzeLkp0YmgbXZBNeqSiZutrZAzbRm/FgA8xFCcWOP0dqWNwAE/G?=
 =?us-ascii?Q?npdtLQ/q55a84PINYb465yaWNN4wh6P0cwuoKoOHLxVSulOWBkcGhKIg0cLr?=
 =?us-ascii?Q?fP92wQqKk/rrJUGebVnU370NxBlypqzavgS/Oiy0xkwu5WOzjXh9rbnzVS/D?=
 =?us-ascii?Q?q+sOVJXOQqWSlObQujA2xxAsqnDbbHZaGwtsZuAQk9r+4Qd9V4Z4f/7I6lZy?=
 =?us-ascii?Q?dSGmV8APCGL+sHhUCwevBL1DHaqleT7Xi8X4OZIpl3bS1xjLRo2Rw3yQgV7g?=
 =?us-ascii?Q?oa/wWrQuZ3DEXKXM8Tc172UuCFHFOA8ftHEQmesG3sbbFaGrcZOiciSib5C7?=
 =?us-ascii?Q?G80McuVDsQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: WwG2DPyJvV5aQdZ8RJozEJfKyVevcTN1XmS/3f2MeujhproFYrR2OacLFJcJkfcIdRPHz+hsCiQugYMgWTf+ffnmjPKipafIKg0xpkyUIQ9dpxjVdxbCvXOV81K8ukCwWB6e+MOXexfshCUYJ9QVf/VPAoRSyxOeUu6kOK0domqwEMTqRVwTAc5MQ7xtcFbmCAD3qDqnRBuoKTJjHwxgaJFUJDGhVZ/xR8ZM5biJZwzSOugPG+S37vrjBi8Ev2Z2OhBLbTD2LXyS7LmslFlwuhcIpoXJiycgvRreG4rK3GPxyAI896iD4BFbyOYqxLt+35MAvgyX86eVAly+8pRMsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb2e413-ac3f-4334-e739-08df12797238
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:01:32.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p/amllhox0/ZycLvy7v9JZ4J0qmFZk1AG/mb4y/R6B/Avfu4ID+SxZyxOdudaUEJXXyqi8kji31KC4UECld7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:51PM -0700, Michael J. Ruhl wrote:
> Upcoming changes will include possible failures from HW accesses.
> 
> Refactor pmt_crashlog_rw() with a return value.
> 
> Update all necessary usage to use the return code.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 101 ++++++++++++++++------
>  1 file changed, 74 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 831cff743803..b6540f3a9a17 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -144,27 +144,29 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  }
>  
>  /* Read the status register and see if the specified @bit is set */
> -static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
> +static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bool *state)
>  {
>  	const struct crashlog_status *status = &crashlog->info->status;
>  	u32 reg = readl(crashlog->entry.disc_table + status->offset);
>  
> -	return !!(reg & bit);
> +	*state = !!(reg & bit);
> +
> +	return 0;
>  }
>  
> -static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_complete(struct crashlog_entry *crashlog, bool *state)
>  {
>  	/* return current value of the crashlog complete flag */
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete, state);
>  }
>  
> -static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
>  {
>  	/* return current value of the crashlog disabled flag */
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled, state);
>  }
>  
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
> +static int pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
>  {
>  	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
>  
> @@ -199,14 +201,14 @@ static int pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
>  }
>  
> -static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_cleared(struct crashlog_entry *crashlog, bool *state)
>  {
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared, state);
>  }
>  
> -static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_consumed(struct crashlog_entry *crashlog, bool *state)
>  {
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed, state);
>  }
>  
>  static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
> @@ -214,14 +216,14 @@ static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
>  }
>  
> -static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_error(struct crashlog_entry *crashlog, bool *state)
>  {
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.error);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.error, state);
>  }
>  
> -static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_rearm(struct crashlog_entry *crashlog, bool *state)
>  {
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed, state);
>  }
>  
>  static int pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
> @@ -236,7 +238,12 @@ static ssize_t
>  clear_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	bool cleared = pmt_crashlog_cleared(crashlog);
> +	bool cleared;
> +	int ret;
> +
> +	ret = pmt_crashlog_cleared(crashlog, &cleared);
> +	if (ret)
> +		return ret;
>  
>  	return sysfs_emit(buf, "%d\n", cleared);
>  }
> @@ -271,7 +278,12 @@ static ssize_t
>  consumed_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	bool consumed = pmt_crashlog_consumed(crashlog);
> +	bool consumed;
> +	int ret;
> +
> +	ret = pmt_crashlog_consumed(crashlog, &consumed);
> +	if (ret)
> +		return ret;
>  
>  	return sysfs_emit(buf, "%d\n", consumed);
>  }
> @@ -281,7 +293,9 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
>  	       size_t count)
>  {
>  	struct crashlog_entry *crashlog;
> +	bool complete;
>  	bool consumed;
> +	bool disabled;
>  	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
> @@ -296,10 +310,16 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> -	if (pmt_crashlog_disabled(crashlog))
> +	ret = pmt_crashlog_disabled(crashlog, &disabled);
> +	if (ret)
> +		return ret;
> +	if (disabled)
>  		return -EBUSY;
>  
> -	if (!pmt_crashlog_complete(crashlog))
> +	ret = pmt_crashlog_complete(crashlog, &complete);
> +	if (ret)
> +		return ret;
> +	if (!complete)
>  		return -EEXIST;
>  
>  	ret = pmt_crashlog_set_consumed(crashlog);
> @@ -312,9 +332,14 @@ static ssize_t
>  enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	bool enabled = !pmt_crashlog_disabled(crashlog);
> +	bool disabled;
> +	int ret;
>  
> -	return sprintf(buf, "%d\n", enabled);
> +	ret = pmt_crashlog_disabled(crashlog, &disabled);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", !disabled);
>  }
>  
>  static ssize_t
> @@ -343,7 +368,12 @@ static ssize_t
>  error_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	bool error = pmt_crashlog_error(crashlog);
> +	bool error;
> +	int ret;
> +
> +	ret = pmt_crashlog_error(crashlog, &error);
> +	if (ret)
> +		return ret;
>  
>  	return sysfs_emit(buf, "%d\n", error);
>  }
> @@ -353,7 +383,12 @@ static ssize_t
>  rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	int rearmed = pmt_crashlog_rearm(crashlog);
> +	bool rearmed;
> +	int ret;
> +
> +	ret = pmt_crashlog_rearm(crashlog, &rearmed);
> +	if (ret)
> +		return ret;
>  
>  	return sysfs_emit(buf, "%d\n", rearmed);
>  }
> @@ -389,11 +424,15 @@ trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog;
>  	bool trigger;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
> -	trigger = pmt_crashlog_complete(crashlog);
>  
> -	return sprintf(buf, "%d\n", trigger);
> +	ret = pmt_crashlog_complete(crashlog, &trigger);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", trigger);
>  }
>  
>  static ssize_t
> @@ -401,6 +440,8 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  	      const char *buf, size_t count)
>  {
>  	struct crashlog_entry *crashlog;
> +	bool complete;
> +	bool disabled;
>  	bool trigger;
>  	int ret;
>  
> @@ -413,7 +454,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  	guard(mutex)(&crashlog->control_mutex);
>  
>  	/* if device is currently disabled, return busy */
> -	if (pmt_crashlog_disabled(crashlog))
> +	ret = pmt_crashlog_disabled(crashlog, &disabled);
> +	if (ret)
> +		return ret;
> +	if (disabled)
>  		return -EBUSY;
>  
>  	if (!trigger) {
> @@ -422,7 +466,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  	}
>  
>  	/* we cannot trigger a new crash if one is still pending */
> -	if (pmt_crashlog_complete(crashlog))
> +	ret = pmt_crashlog_complete(crashlog, &complete);
> +	if (ret)
> +		return ret;
> +	if (complete)
>  		return -EEXIST;
>  
>  	ret = pmt_crashlog_set_execute(crashlog);
> -- 
> 2.43.0
> 
