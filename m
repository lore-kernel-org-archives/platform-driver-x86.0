Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB603F9F37;
	Wed,  6 May 2026 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076523; cv=fail; b=XzwuGkEnT8u0CKfgovYMlXuXD1CBgf3RHGvgu36UCvVN4gZsSFSsGLmjeNEinqg63Q8wbmA1odQY7IucoYAfXkHUWfJ860GnzhXtuv8JjjLezvpWchrW5GdmmCWuns+7KNk/1YD/eigSW4oILvp+ySKJgbZm6k57LiLvvIkSTXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076523; c=relaxed/simple;
	bh=W/oQar+gMe04raE7KLFJEpbxttGjmy6UYv+J266IAqs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bx09kC7Z3fV1jod14k7Jtm6/jN735qdV/pxiQifCIwueOo5vVsPBcQ3GOQgYPY0Tm+xQzqULPwp0t7bEogPEqz69ZXCDuKKky+c89E/cda/cSEqi7QZYrVZvrNNE3TPbpQXTSe3q2lOFIwhlHWhAJd4YRq07If9JVbSkOUhI+MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoPmm9w5; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoPmm9w5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778076522; x=1809612522;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=W/oQar+gMe04raE7KLFJEpbxttGjmy6UYv+J266IAqs=;
  b=BoPmm9w52KSGZNWl8P79cvOJ3LMrBkld7RK1v+OXzJcnwPIWC3GmB1zC
   QkoMitTtoFEuqwlOBNpabcqNFppsaLB8LemFfXVM9BdLlsJHyjvIgkOXv
   jklIIXd/oggPIY6MWrLPK0/6t5V6lSzcz2HfaLPryIG6yUhbgDMts49d1
   ZsRlrst9JSjaMOd0BDG3vm4j2FDchzmyQKwGu/1rOCrZxInfAUoKMZNsM
   CJHnfa3dVr2cDUOu52W3HTSp6ipsp8C35Nlnj9VI6YavPTXL0eDzymdvW
   7dQ/wL7cCbw6BvRT57GYytaSid3D9CE0zpLbAa/BdKyXdN+4kJi3t0WPA
   g==;
X-CSE-ConnectionGUID: PaBnu7jJQNeW4U34WhxvZw==
X-CSE-MsgGUID: hoKgx7ykSmeJSY74jh3S7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90386628"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90386628"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 07:08:42 -0700
X-CSE-ConnectionGUID: etWu5pQoQL2mGzOv4sL94g==
X-CSE-MsgGUID: vukQUYnkRj2+shXS74OX2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="274287163"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 07:08:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 07:08:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 07:08:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 07:08:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGp4Sl/Cp1OmzgbTkbk/IS64ENIpFvkTN801Uyn4DyAMJnwbd8Xl8RkvKo183UBXNMCz1C0vnG+SZXKWAojwWq9wRyVyN0mRuJrgvNq1GadT1b33T9HmSGbVYkpql3RYWhvTRLQwHk3a833VeSZZpHoErOZaSPeqhF/cIJmra9ZT7ZUBpO9mUbXlpMl27Yiwtqnod0aDbowPDetBJAv5k9xZwcueEL4OJWDJH7NvGuVaJlqXxTjRP3incBwEIJPwHZRUfiQiy8JD9Ez0tEx3pg9p0OSbcaQ1xs/a+rzLVCqN4iCh/Rm/p37JvCY14zefjNLRh6sonYf5sySpv8ZWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C075d6ZCvELJqa5tav3OyXM+GwxmEnKey4kYEXwbki4=;
 b=gJou4pP+12szRDbR8lfR1qOjZ+cq1Dq0BhxVBN5DCbTVHLUQlbNZFvYP3dTs65YlpDH6WisvjBwxq9NUcMy/IKOsNSDIO/AXm8F3seAqvSEOVWlovVDrzi/8ZmlFF8K25q6xQK4d2ShZKS9qimFhyKyTrZvEeMJIiPKLQDEDwFOJOuaQEj8zGSiX+kPLU5bGDEwkGSS5JbYKTB0ttCQ2TVx8SM+XvrVSrUKfD1kcNcXMf+hQspu2NWUjXcCmcHxKeLqixIxSf9lY9hMqDBBZRD4SInoesiPqzGad74AAuyt0xcyFYt7+2D0ESSc0aQUB1FKObOR0T/tLuUWZOBpp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 14:08:37 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 14:08:37 +0000
Date: Wed, 6 May 2026 16:08:31 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <hansg@kernel.org>, <corbet@lwn.net>,
	<srinivas.pandruvada@linux.intel.com>, Maciej Wieczor-Retman
	<m.wieczorretman@pm.me>, <linux-kernel@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] platform/x86/intel-uncore-freq: Expose instance
 ID in the sysfs
Message-ID: <aftLV1PNN5g1fOAm@wieczorr-mobl1.localdomain>
References: <cover.1775665057.git.m.wieczorretman@pm.me>
 <CmNWpuszRDb5WGKUcxPfNV8JymA_XsJXMqqPAk4E8cJJl6n-dnsnaOYbDd6TTWgiLWGsFjkFfwbibD5rMxxwsA==@protonmail.internalid>
 <177807566314.8094.18400142922022766172.b4-ty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177807566314.8094.18400142922022766172.b4-ty@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0240.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::8) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 708c6f13-585b-4673-4545-08deab78f794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 9mcR/FdRa0I5K5jnHtBZ//RySAsbr6MU1pynbsxPYR2G54fL/Hj4jogtbmoxuh+8zlsueulVyMZh3wkeQdFYWPXgZoPQAIDKzylFcRpB/KJ78cc54+nfNiWAUrw7itHOL/li2cTNhj2ClDw16cwcsDqo1EiXw/FjrRCgiq21ARcPLUpy0qI8KGE41VZrDuui56HiPqWF6NxkckrMEQvcHyKBrnISvwgCGQuoNLaOTKpVYLNuOzgFitjnOJDhIo/INDQviZmCw2gyXQ6jIC4PTCaXKYCKBMNr6uCqtrYDAC318ye7uQ8BcV6dLh2SADktlJ4N/GUhRReeQSzFep/6e/uyTZ+Gzs7op3iQxGRuFFGcu1DvRrtcMMXzAAEhWhMhojb0/U9r0BQfWPuMQbKs48Xcn8sTx6Y97BriW9btIG4JG8NuqHDuOLawNSh+l8y8N4LEY6VQZcntKaL4vsaRReNaQV1GPaOzNQxpv/DnGLZ+pqYYbW7rzIm04bKqjJ+d/lxh9QRve/lWzMM1s6jwP+qeq+g3o+SBZXcD4Nrwdk+lfC7Ncp1OZStiwfo1m2DxBd8J2OnsPMop3QzZtpPdvmM2tf86ss+sByxTXcMIYiS05ubZXeKLesn++en/ECd1en90wFv8zy38Tu8h6jxN3jdLY6ODfQFsIlYfLN9cAL27yFMfAXHMTlqpiEg6Xahb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w7eMgQ7J6ne5k8IDl5hP6rA+LBmSfitJ8izj190vkt7qexR8t8kCTWIeXx?=
 =?iso-8859-1?Q?ULHRoEzHJLECM/iSXApypPFHUeJomZpAdPe/SINIQx5vnLSrrbEMnF1Rzh?=
 =?iso-8859-1?Q?/P6smypuD4NeW8GJFw5/TvHR09sWCsaOX6ZtstSmA+woe6qg0p9HELkwUF?=
 =?iso-8859-1?Q?XyKJ75PlacQadlzOK2imzZg9TCKHDaDIMLzMw288PmfFMKBSR6IQzJc8Yq?=
 =?iso-8859-1?Q?2RCVMONgdJTXoATgJWeqvsTp+x4+6uzfeNoeRYfJQi3zfhYZY+bY53vXG0?=
 =?iso-8859-1?Q?lAZ0v4DYlCFYacn9PzhJ2cXOF9+V8cJKujiccrcJOuLAlDuJ22UuEaVw4Y?=
 =?iso-8859-1?Q?iPMOXcLd3Q9tbZduroysRlO9zw2dLuw+S6f1AnRpjsq8ayV5/LTM6y7RVG?=
 =?iso-8859-1?Q?Tie6pjKVQZgswbJOGIZwGPgybcRvUhkleqh1LZoXW0PN7tFA4s3HYQ8Rxr?=
 =?iso-8859-1?Q?4bbjg6jPLXTb5Aq2rFWwTpUaKAN9HoohoSVWLzVtRkmIYGkQ2PmNt+kyFm?=
 =?iso-8859-1?Q?5gR9BQxT7Onm2dxSPcYgeXYaUumDJQgp+BYb84UaAnOIbiGUYpYKqexo3n?=
 =?iso-8859-1?Q?J5JhqG6eMi0s5uwwH225fE9CpyLRWP6glM1tG0ACeHTmMy7Q+52asrU96p?=
 =?iso-8859-1?Q?Jquqp/4eBts5kiFq/5lPwJbYeIc8VI+cunXoU5tINMDsY0ClAvDjNoYnTG?=
 =?iso-8859-1?Q?+Ar3XhtSFF1GcsL9RkbZSARXe8peOwHTSbQwd3I9R2i10mHifyaZLc/OHx?=
 =?iso-8859-1?Q?iqR59Rx5bHi18bN8ShF+jk0BixsfF2CkjgEzGuT5ck01oW33a/TdvxpbuD?=
 =?iso-8859-1?Q?01EV6AN6wAYOwlL7KRxooh6IugSXGYRre2fpXV+MifOHbdQQEL8Qt89RCA?=
 =?iso-8859-1?Q?c4D0E5NH0NjaTx8OwY36K0QToRQrLDHQSbB/AR0zaVrHHWgYgXNKc5nYJe?=
 =?iso-8859-1?Q?39q6Svqrg04bN8rVWv9IuzZigRHhxMxw9wJxSeZUL1QtElaRDrDIFS2eTh?=
 =?iso-8859-1?Q?BLbYmIUE2JOdO+Hiy6nhS8h4p95YoT6bW5kLyPTUpgFSpBSb4RZLUFd0ai?=
 =?iso-8859-1?Q?wloD74J9PB11LF+Pn1Y6Usvrq2W0wu16BsbsNkn9HrqOuHL52A/J2PTYIv?=
 =?iso-8859-1?Q?TGFq8n0jk1+rPXkFNo8k61+k7xblLR2sUXD6Q6O+J72ieX6h97v+8MEDzl?=
 =?iso-8859-1?Q?g8fgofQRR76d/F/hb3Dj9NJGy39Bf6cINGrZkD7JpyP7CcdO1NSG1IEc+s?=
 =?iso-8859-1?Q?gh9Gtzd2VPCjxujB4g63KCjtuhEP0wGMWDSSLHKbQny63jMlxiY0TuCxjy?=
 =?iso-8859-1?Q?fN4Uhdf0yQoWScZsBOG8rSk3qv5Hx590+pMOt1Q/rnctk6Tq5UW0jUg34B?=
 =?iso-8859-1?Q?qLsGAkCMQFGWvDoUTXGCCAAWOCAswEWFzZ2Hv1JNpzhK8oNR1KbrzkgF1G?=
 =?iso-8859-1?Q?vkOUNWtvxhXpz+gsDDzeVHRY9ol+vdStkw/SysaPeVnDpRJfMhEo+SQxCi?=
 =?iso-8859-1?Q?GDzD/beHVf2Wz2bk/uLI8ay90BNYGoJar2caykDaA9K7JKAvWR/qGEmx/k?=
 =?iso-8859-1?Q?ucehaRMlM4WkA/S+mTkGHp7DPVsgMOxYAwiOviX8E2kSD4o395PC09fgzE?=
 =?iso-8859-1?Q?2Votsp56NVGhSV23qrD7U40t1wIdyCL6Gb/R0qKuyYHj4WvtdfJ+EfTfRE?=
 =?iso-8859-1?Q?nWicYuvh2ItY12+VG2DhQ5FpRNVyrne8y6NTr/OPHIObZIQLizS9GCPWDy?=
 =?iso-8859-1?Q?wE44Hz2mOjhHu2EuaNsZZsovT6Teu5mrehDOQpKn+rEQe8uGHu2a3dzimp?=
 =?iso-8859-1?Q?zupTYvBtE90+fmkDcHykFFIcJgWX09GMJDniGQXFXeiVIQliNADJ?=
X-Exchange-RoutingPolicyChecked: rc3hYlFaPZ3Wl4wXJaE0ywUf0c9lYtAbBKEqqAzEHRGHLS5nWIcR3YEaVWsOulVRqtRHMmwMi+qx3tat1u1KW1FgxDP0FLuNtawB+LZKlmSR3DtrrYsPV6cpSA8jvgRo6qkabpEYbsvPYLjcIRGdF9NVePvdojkphcf9KgzAEw8hcxK7Cl06RuDAiNXJ7Ppswfi+GtSL3cK5l7HbTZpH7y5C2913C6CiHWKmN5sQfOuaNIDa0tIEVjUn2ERWyE+roJG5juOYuhF6EXv4gXQpSnM62XjO7W5gYo9KmJ+CwWmZyjiIMi/s1eLwDYkq/hbRKdO84xqg8OuyExYQWiEuUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 708c6f13-585b-4673-4545-08deab78f794
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:08:37.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2HSmUmH4RSMAcbDk/yTCWfQN/Kyhgkdk2DwFAkgsKGIrI+0q3qJoBO7ZuP5BbEMQlyJBtHxASRA68hrcT3Qns6rAVFaTLk+Bw0bEhEcpHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
X-OriginatorOrg: intel.com

On 2026-05-06 at 16:54:23 +0300, Ilpo Järvinen wrote:
>On Wed, 08 Apr 2026 16:27:40 +0000, Maciej Wieczor-Retman wrote:
>
>> --- Motivation
>>
>> This patchset is about exporting instance ID, a value used to uniquely
>> identify MMIO blocks in TPMI devices. Userspace tools like "pepc" [1]
>> can use it for direct MMIO reads or writes.
>>
>> Currently exported information allows doing this on non-partitioned
>> systems, but partitioned systems require additional steps to map MMIO
>> blocks.
>>
>> [...]
>
>
>Thank you for your contribution, it has been applied to my local
>review-ilpo-next branch. Note it will show up in the public
>platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>local branch there, which might take a while.
>
>The list of commits applied:
>[1/2] platform/x86/intel-uncore-freq: Rename instance_id
>      commit: d8e484a452ca195b7c099373f3c7901bd405b623
>[2/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
>      commit: 6cf1c1e9f21ba2e44e05e691d5241290c7d6c41a
>
>--
> i.
>

Thanks! :)

-- 
Kind regards
Maciej Wieczór-Retman
