Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584BB529410
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688039; cv=fail; b=FhPw0hP+9ExZsrZ1qR9lTsIj8RSznfHX7KsH8fZPES3oVTIvxhJQL+QaMf9DGKUkf4TlsDGWc+kOQoa36Vte9tO8PbX26N9WfnPzOyNwCQeK4jtrkX6HCtA5KsWUF888QXPI6raVrRaYoTTcHrax8hNhjJYCB9oqtoNULqI3StU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688039; c=relaxed/simple;
	bh=EOsY+A6EzfR9GlSziFmiHcZC0qQZp6PK04n4OYfoyxQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tgK37x+2OdHQP1KLWbxljphsh1CUkE3aWvyV+oPvb5X951W/+9XjBtBqMRq58R6VA2T50AmYbRQQlqXszrTFUrAKwiKIB4UHfsm1LN88gz5sTYQwtB62cValVhuG85wp7J0qYtfVcD7n//0JZrKZO3Afhh4liiUTuoMVoX93MN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cz1UaSlK; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cz1UaSlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790688037; x=1822224037;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EOsY+A6EzfR9GlSziFmiHcZC0qQZp6PK04n4OYfoyxQ=;
  b=cz1UaSlKhnD3riTCMqEPmEdBJujrAFu2agjBPlHLWD38YHeyPuMuSn2u
   T5CkhEFzOEGCkrcLm8Wwcr9lAIKLveE98RoIOZnnRzPQk5wUHY9M5oU+z
   o5CCRgn2MNB42FkZF8f93acYFlAJk+CnsuxuJM2kpUTVFCGmBAMptUlXT
   bJe9wFRJdszMFhX2ipAGnHt90Og/a6eiaAgLfuwSbGAWer8V7Fo/dHa9y
   75x04XOrZ5piy3Q0KA1ZgWKtitcme+e3L3/Nupbn4bYLSxtTalsmnof+A
   zG88AqUs22TWCstIBLnP9uMQYslTGFjGLhuTNxdgweb8r03KfaGfJ9Pkd
   g==;
X-CSE-ConnectionGUID: WXuFMe8qRjS2A2N+zLX7Bw==
X-CSE-MsgGUID: H8qg7NaVSp68p61PkfIz3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="100737565"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="100737565"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 06:20:36 -0700
X-CSE-ConnectionGUID: 3jev8of/QVCEZbu5WvFqqw==
X-CSE-MsgGUID: kX6EDWvIQrWdIAPr/xHUyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="278720715"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 06:20:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 06:20:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 06:20:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 06:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ukx2eLk8zdUK+1Z0915HiqRAVGTKd74v5Q+Z/+QjlIq84NGjhuJSA2+dDqmhhGTb7+3NPMC2cnWCK+jDkVIaW0X7UU1kP4RVF5/qJbcap1wSx66AP3WzChwSJdcjQwqxXtX8S/kKvr6HLoESEltUnF6rk/wsH6dd4O9TaQyIGrFsplmpQ2K5CooNtaHHDYvKMtJpD1XV3DR6hlTL9GJf86ObJr0J5HHfhbEAPYPFQBPhPWA26fxCCNgJjzsJu+jw5pb/fwIeY6X+3wjKWEjyJq07p81sqRRtGMfmC0N/LlkPJ10Rw+J8Uxl+GsPG0EvzRG+o0yZJRnNZzenl44hFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYYw/cR0Z8nE7m6kFiyci4k9Od1EBnzWqS2nNqIylvk=;
 b=thPoP8it9v5P8of3pWsfKurCTq+RRAKlHzowMV5PqVuFfGDV4QKiJEE7LXDD/xzZl/7H5w1ylWpQ30ljA2VuEUSwXe8w8EtCRxtGIvtOJIcrEG0oRdkoObyZy9cVt47K9BXFTZphlLK6ncbRegVtRmHopT6mfaP9Vmt1vHpGFabRHPgMGAlVip7Tya67ILrqu6V4B641l/lhKY3TZ6WRBw8eYwvw74dtSsLthWr4eDZys690N0vexAHqR21hWFY/MQ3gZrFBrB6spdX8c/oHIt7gCoOt17Rueu/JgRhlcAL/TpsBFD+u7RCFm1AFtSb+ADGYFElSBFK9alaQuZge+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DSVPR11MB445312.namprd11.prod.outlook.com (2603:10b6:8:37a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 13:20:32 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 13:20:31 +0000
Date: Tue, 29 Sep 2026 09:20:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	"Hans de Goede" <hansg@kernel.org>, <matthew.brost@intel.com>,
	<thomas.hellstrom@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<david.e.box@linux.intel.com>, <anoop.c.vijay@intel.com>,
	<badal.nilawar@intel.com>, <matthew.d.roper@intel.com>,
	<james.ausmus@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v11 00/20] Crescent Island PMT support
Message-ID: <aru7BEn1SkkDOJd2@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <6805e8bd-9b48-df74-986c-d5aa43a6724c@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6805e8bd-9b48-df74-986c-d5aa43a6724c@linux.intel.com>
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DSVPR11MB445312:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e10979-edd7-4880-b2ec-08df1e2c6f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wRAGuT0xb/XcXZk/Wb1av5/KMHhBZ2TAuRpUy1ccoBaM1BByNOlFsY1bzsZQmVs98lvwJJ27juLkEQjiP5jGMqd3dybm01LVGTzBwduTSmax00AHDZ+1L7pN2J5dqPAeUZ9wPXoCqwyxzZGE+4p2oe+orBeyE1ufAbdWIUtjOyfOSS6z1hfS+RILS2eqHgjNT3hMhrmcn4UDfxa577YD5GyA9gDGe4y6DQLmOVtPvdbJSjotQhwyceSskSCLMrVWuG4BynmRZvLmtceTsXvRDLn7tgN9KjRsLIEigA1Pv4tTOrzmeAG2rL4n/imIIEY9m8Qmp5HqciyMc+ikozthMFcn5Lt8Mbmdqbvc7jJGj+CyVzyFx5fMUlwnymmGFsoYVumBNfl5eqtqmyt/kaBQNiv0C8CrSWkq9eQ0ibBzecE0LAzZhxqXbLXHonTmuLhKqjEEeb+IAxI/9+84KQFOKYj7+UaL3mGM8jgc3KIwZddz68U5NFMOifFatzjRrbMs74+HqkVG2ABSjj0U1PGW7cp0/U++4iHHFFjeeq25sySOUr3C3a8i+YoMULWfer0pdUY07n1oCPCty2vjzSVb0a6Z00blhmgt0XkJsrsRM+ITqPJF45avrvouCKY2e8OmeteH0hxjJAAlcqAv5Dmu13OlCG/6fUfTcnW+fG4wuCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Wf5LE4lPoQVPlnwFdqfvnACZJzUTAYVw3qDT7spg12AXlx4bZj+V1OrbRo?=
 =?iso-8859-1?Q?pdAN3gf3iLX1Kk2Ixv4lFxbOpQpAs/ii9ZbxYXQ2QsdDBbW+thWQ1QLQFL?=
 =?iso-8859-1?Q?A+r2OJ2RV5Bqj2c8Ps9ovio4cemrAPyIhpalska9qzIW0YN30vT2tPGgep?=
 =?iso-8859-1?Q?lTthEV5PFDTWI5z65IoYK2oR+pxBvrQDckX3X/8/HiB4wAz5TLVttNiWJy?=
 =?iso-8859-1?Q?U4tiBlrwpfFv/N/HcwVNjCy1mUWUwSelPVjJDBvEItmDcMeRo/dw/zkYIC?=
 =?iso-8859-1?Q?m7Lmy4vqLLH6e7IQJGH83ZxIPl4yGYapwpftyh6O3YFCkBKRUJ4/o2IArM?=
 =?iso-8859-1?Q?WfrDD5Ay9E3tA0YG1o8iwimP7396XzGjCVY2qIBVHn5ahB9OIW+YTO0Vqm?=
 =?iso-8859-1?Q?zd8Wbvxuy/7N7cudXGzSIz1ScL8NngSgs98nwhn88E6nkYX64skM1kMxj1?=
 =?iso-8859-1?Q?xTwUaCWkjdNvcn9VU+f+a07Yu9RrBQrkTz2nSfOxXvuoFRkL2UJO/dQRYI?=
 =?iso-8859-1?Q?9ipEG6J1bvhHMpvxXqIUKSaGi7q6kERIip9R98p/66yFKYYCSxACMScPS1?=
 =?iso-8859-1?Q?VWtTmG9ltoOf6d4bPk7XQVm6H59WxJyuY76e3UU/RC5sQ2Cl0Jf6a4BZF8?=
 =?iso-8859-1?Q?ugATc680WXWykb2vuUczZP5itPZQ6EbyJTLRxIkeMxN9zdGNsmT2qnW+bG?=
 =?iso-8859-1?Q?aMU9C2bgrrJIzjj4q16ZDwCC/vlOtqHh/TGwcQE9+yfR2x7gAP1UoAQtm8?=
 =?iso-8859-1?Q?sw60e8m15xmMl/O7WLZIiaylbn18Eo1MI82r7doEkwLHrqTqoj7rR4wh7n?=
 =?iso-8859-1?Q?LC1RAYi8RbWKPgc2czulCTxPssmpy4Bk7/wpns3NXY0Ims/h5tbyifVQPC?=
 =?iso-8859-1?Q?BNZJFQC0e4xtG9kdHcgEXxO9XwSJeDUNhM2DmVCwL29IZhJGdq+JC2W3/r?=
 =?iso-8859-1?Q?gFj8+lPdPVKW7oXLeF2whIl5mXkhs8CWLjYAlVXOrfjQJDI9EmWPJcWXX/?=
 =?iso-8859-1?Q?Mfp4LdNUfAwEqD11gw0J9A+hnk3tljfiy2RTk7jehgtMvmgJOl0pcSNWBO?=
 =?iso-8859-1?Q?Mffz6HdCcleCQY/vabPrbRX9Mfpduad489fCNTVG0SVE+otYmEZW4xNe7R?=
 =?iso-8859-1?Q?F+Fv4ylRY20gSAk+gsumsOJWhceyJFUdCwEDbB4zRygm4z0/XY/8THWaG0?=
 =?iso-8859-1?Q?8GdFs71YLPLn2m6l9n63z4elGx9letczktXVw+LNUxZILxb8BO2aksHbv1?=
 =?iso-8859-1?Q?X29PzcHyZbcmTbWC54Vokj2NjR1kC6leOmm3WnB7SkBm6OKE2gLpo/ABxU?=
 =?iso-8859-1?Q?TbWMzhvm1eXAO+j18HqxXjZWrcXFv5pYUAqHES7LeGedp7LnUGmfhkHvM7?=
 =?iso-8859-1?Q?82sXz+4F1PsyKcFK6BTr9h0ZK6KHIhEckTABnjw6Wa5Q49kA0EEU1ViV9/?=
 =?iso-8859-1?Q?Db2SdFW7ZoWfDgRnMvkC0hNd3iRNSh10QFyDivq9mOx6Vqto3r7excW8VQ?=
 =?iso-8859-1?Q?1fJ5HXmNhwRlfO5arpEsj++Va4CBAg3GIkMg/o27xuL4GT+dSMVQmXvrcP?=
 =?iso-8859-1?Q?WF7NbOE/tH5Vbg0a5nkGfDktNKTAh8jSDhfa2nExSgBjT4/m9m7wJe9wfI?=
 =?iso-8859-1?Q?cXQRQFCmvmu5K0KGJUYyxsbmrGhgUnlP2kTQK+IVjALANUt/u2rBRxeZYC?=
 =?iso-8859-1?Q?/Ew2N2C6kqEFbbaRvZHIDUuV1i/t01+lgr5LS06xgLF7lfz6CtCpvulKVh?=
 =?iso-8859-1?Q?2o1X/Y95Akl2vNMDit2HLYap49Q2zKsqkgctmKzWyNU/nL6NZHZIFIR1OV?=
 =?iso-8859-1?Q?zRmxmc6R+pUv17+wfoWMckZlPJl5FBM=3D?=
X-Exchange-RoutingPolicyChecked: Tqao7BdjckpaXqTd+5tbZ3kuaXSaMODzAx27J23tH9vc2dqR3GehQoLZi+jXhAgxQWG0D2069GFEllbPl7/sTreZoM19l1HHGju9G1LDmEEG19+YPeKeFK3e3czyLiX55AYhJJmWVq8CLk8qMVfG8AhtnvHp9aPXn3wHdq+J/XU8+O5cVRu8cl42DYP55eF/C7HcNtaaUufhxD4I5Ffji0rSLDBRCUapFo1XSSZN94IarZdHbG0oeS7Df8/LEkWtgTqie5YqrUHle2mMG+rjt6phyK6IbAfYn46EKE31DVz5D81r2WcCelDx7l36jJnWyK6W31HLLxLZ6IJrBzMIpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e10979-edd7-4880-b2ec-08df1e2c6f01
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:20:31.7796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fO68zFeRNrOjgzxjrXirOOEDDY+7Sdj7yqNMRUWh1ic2sCamV8WdnhsTUIvuBIWKWm7VGfbnCoSdLeHz/lGyAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB445312
X-OriginatorOrg: intel.com

On Tue, Sep 29, 2026 at 11:12:34AM +0300, Ilpo Järvinen wrote:
> On Wed, 23 Sep 2026, Michael J. Ruhl wrote:
> 
> > The Crescent Island (CRI) GPU supports PMT via Xe driver
> > registration.
> > 
> > The CRI PMT MMIO mapping is shared for each PMT feature and it is
> > necessary to set an index register value to access the correct memory
> > space.
> > 
> > The PMT driver has a callback infrastructure to access data areas with
> > driver specific access. It is does not support the PMT control access.
> > 
> > CRI discovery/control spaces are part of the access window so a driver
> > callback is necessary to allow for the correct window to be exposed.
> > 
> > Add control path callback support to the PMT driver.
> > 
> > Add CRI PMT discovery information.
> > 
> > Update the Xe driver to support the CRI PMT access.
> > 
> > The crashlog access needs to be done with power enabled (telem is only
> > available when the device is powered).
> > 
> > Determine which access is requested, and do the appropriate power
> > request.
> > 
> > CRI FW is loaded at device power.  Support the late-binding API to
> > wait for FW readiness. (pending sysctl patch set implements the API).
> > 
> > v2:
> >   Address AI feedback:
> >   - add missing entry->cb check
> >   - address SRIOV VF concerns
> >   - use xe_pm_runtime_put instead of _get in error path
> > 
> >   Address review comments:
> >   - redo power/lock sequencing
> >   - support device hotplug events
> > 
> > v3:
> >   - cleanup power manangement flow
> >   - fixed an out of order power management locking issue
> >   - add a GUID caching mechanism, for GUID read
> >   - removed unused parameter (mmio)
> > 
> > v4:
> >  - address various review comments
> >  - refactor crashlog to allow for return values
> >  - for callback usage, decouple PMT remap of data areas
> >  - use IS_SRIOV_VF() rather than expose soc-remapper internals
> >  - separate locking fixes intos distinct steps
> >  - refactor define update patches to seperate BMG and CRI updates
> >  - separate internal GUID into separate steps
> > 
> > v5:
> >  - removed callback helpers
> >  - do not return error message with sysfs
> >  - fix missed return code check in trigger_store
> >  - return error value not false
> >  - use DEFINE_RES_MEM
> >  - document when base is unused
> >  - return error on invalid GUID request
> > 
> > v6:
> >  - fix enabled/disabled inversion
> >  - fix missing DOC reference
> >  - change memcpy_to/fromio to readl/writel for register read
> >  - guid cache comment and update on valid guid
> > 
> > v7:
> >  - reordered to have BMG updates followed by CRI support
> >  - separate base_offset usage for clarity
> >  - added EAGAIN usage to block uninitialized use of the API
> > 
> > v8:
> >  - fix punit crashlog offset (should be 0xE60 not 0xE78)
> >  - remove EAGAIN support and re-order probe steps to initialize
> >    VSEC before other features use it
> > 
> > v9:
> >  - added appropriate reviewed-bys
> >  - use dev_err instead of pr_err
> >  - enforce defined base usage when callbacks are in plcace
> >  - move SRIOV check to get_platform_info
> >  - assert SRIOV for API check
> >  - use scoped_guard() where possible
> >  - update to use correct sysctrl helper
> > 
> > v10:
> >  - fix incorrect return type (broken in refactor, int -> bool)
> >  - fix incorrectly documented error return values
> >  - doc text cleanup
> > 
> > v11:
> >  - add reviewed-by
> >  - fix minor checkpatch issue
> >  - use xe_assert() for a consistent API check
> > 
> > Michael J. Ruhl (18):
> >   platform/x86/intel/pmt: complete pcidev to device update
> >   platform/x86/intel/pmt: refactor rmw with a return value
> >   platform/x86/intel/pmt: refactor rc with a return value
> >   platform/x86/intel/pmt: Add register access callbacks
> >   platform/x86/intel/pmt: Do not remap when using callbacks
> 
> These platform drivers side patches looked ready so I've taken these 
> into a separate branch in pdx86 repo (+ one standalone pmt fix that looked 
> relevant to this case).
> 
> I can do an IB PR out of that branch as needed if xe side wants to take 
> the rest sometime in this cycle.

Well, I'd say that patch 17 is the only blocking on the rest of the series.
If that gets reworked today/tomorrow then I would prefer to take all the
patches through drm-xe-next with your ack.

Otherwise, please go with your pull request and then when we backmerge the
next -rc1/-rc2 we push the rest of the series to drm-xe-next.

Thanks,
Rodrigo.

> 
> >   drm/xe/vsec: Do not register BMG PMT for VF
> >   drm/xe/vsec: Correct locking order
> >   drm/xe/vsec: Use correct pm state get
> >   drm/xe/vsec: Add DOC text for VSEC
> >   drm/xe/vsec: Support possible hotplug exit
> >   drm/xe/vsec: Refactor BattleMage PMT defines
> >   drm/xe/vsec: Update VSEC probe order
> >   drm/xe/vsec: Add base_offset to allow for more flexibilty
> >   drm/xe/vsec: Support Crescent Island PMT
> >   drm/xe/vsec: Crescent Island PMT decode
> >   drm/xe/vsec: Crescent Island PMT callbacks
> >   drm/xe/vsec: Support late bind fw information
> >   drm/xe/vsec: Add PMT GUID internal access
> >   drm/xe/vsec: Update PMT internal access
> >   drm/xe/vsec: Refactor platform check
> > 
> >  Documentation/gpu/xe/index.rst             |   1 +
> >  Documentation/gpu/xe/xe_vsec.rst           |  14 +
> >  drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
> >  drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
> >  drivers/gpu/drm/xe/xe_device.c             |   6 +-
> >  drivers/gpu/drm/xe/xe_device_types.h       |   9 +
> >  drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
> >  drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
> >  drivers/gpu/drm/xe/xe_vsec.c               | 552 +++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
> >  drivers/platform/x86/intel/pmt/class.c     |  26 +-
> >  drivers/platform/x86/intel/pmt/class.h     |   5 +-
> >  drivers/platform/x86/intel/pmt/crashlog.c  | 235 ++++++---
> >  drivers/platform/x86/intel/pmt/discovery.c |   2 +-
> >  drivers/platform/x86/intel/pmt/telemetry.c |   3 +
> >  include/linux/intel_vsec.h                 |  14 +-
> >  16 files changed, 781 insertions(+), 166 deletions(-)
> >  create mode 100644 Documentation/gpu/xe/xe_vsec.rst
> > 
> > 
> 
> -- 
>  i.
> 
