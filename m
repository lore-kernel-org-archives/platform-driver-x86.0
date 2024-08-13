Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A3055892
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723568371; cv=fail; b=AxJwdENYeAf0k7RyXussC+3+z5d3ktIvUu3n5uGGpymJ3fH9Lfp+oYNzTVWq8JzlnqM5JNJocy6pMsja0QUJIWn29hKfo52neBTIPQX86Y40zwCpTtXuHuwWUUjE/MNkZDhRf5+7BrhpwNV0/VgqnWaHyUs93smL/ACv8P7oFFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723568371; c=relaxed/simple;
	bh=Fh18NRtxFyKyIP0PBRoWMBIeJ3kZGVkYuIkaDC+qwMw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FyUFfmyFzZvrWN0qorpAANZMGSaJ/3oRt3+IGEWdzk+ISiWq4x6gB3XVC7wW6ZOWNXVtyuylJuYRIvuy+VZdGwjmnpwq8L+4UW0vnG0h/Vg3Sv2LvIjX18RnDVlzI23P9lgI0W7nMvvsBQDw1myu0feuOpR3AFCZMEwmjMersp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcDtHwE+; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcDtHwE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723568369; x=1755104369;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Fh18NRtxFyKyIP0PBRoWMBIeJ3kZGVkYuIkaDC+qwMw=;
  b=LcDtHwE+GZO3JAcGFb5JHKuha6UV8kGcLJcS5QACI9m4lw2r+PIPaMHw
   mR+Q3V3gOG7W/siNaT9Aa2apJm1LXH4z2mm03A5R8ZQ21L06DrALLOci0
   WKlgQn7RokBMKh4sEfmj+KpUESjFg+AS7wnUuTxweJPne9KumfF82QtdN
   uHAoW7blyoIVlF2vDC9E9BMl+i3lz+Kn7w2dOg5OesOTNp5iW+QVD3cgB
   VNbiEp5ZdPBlDCgqMOKsFDtUAK66rOqjVk+sQZ+Q1UdT297uqrRx22W/0
   CtnCJVoFNWukgjB5b2/wwUWu3Enw9ISlm1nnvDRpJyFhXxaFvfcFcJlOg
   w==;
X-CSE-ConnectionGUID: /b/OGnlOTXScUE8EYuBMEw==
X-CSE-MsgGUID: 31A0DtazQBaI4LRGGMVJeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21393811"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="21393811"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 09:59:26 -0700
X-CSE-ConnectionGUID: /lVwHKNRRAOm+tuK0tF8uQ==
X-CSE-MsgGUID: 189jcoReTv+01HPxncZWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="59497518"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Aug 2024 09:59:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 09:59:23 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 09:59:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 09:59:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 09:59:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAVaxvXVsobUDz1YUnBWpvmKBMSOU2SK6ahVVyG8KyV3YZZFv34hOpVsBDNOg7zIYI+bjUxWVfL4H0UG7cBR6EknVLkh1cFT9/ijoQnD5G0S0lbXm6+Apw1G5zi6kw1IKZINBk/0OgTUOGRUnq8UWLH7pGA6vcrpb0pL1YtRFzwE4z0En7/NrOspKHsPp2UaiZQzEMMSAn26FGDOHDDPfO7THRxl382DrrLQy05BdCN/oCqG6cBiYVuxEe53g+yU38xrBI07LO11cLpxgo/OOh8TIschTuqlWvPkKaVSmpoZM85YSvKTq7o1mDeSBmBZ+mOw6oFf0qnov7AAxJLhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3+dEWEGN1AvrtljHLL0D4s1saJgXnkRXNq52V7iwE4=;
 b=cSOjLorDGCbhekM07S3egUg8e+MkRF8tBB4PH5QgtN8i5A+bUsj4wm+ZUeg1DUU2CIJzDD11+sDK1WdzRC8CDq+7/zgVg2/CqhyGDVskWOmJArpN8EmPyFzFofnXWr8L7RTjMu/Qo3barbSbJcajrYsVSnsFZagGzBRm5J16KKTbYT8chiwXib1htcBcA5GcL7mhbh535fqxC6jGEtF6qOLmZh5uH9FlfH7RFna1w8ptd6EEshrHhWn+CKlqPhNEBVMW0Xem2UPIJSqxoM2v7Fzjs1U6BfPgTe/7KWHzKsDLMwiN4uARZEfKVKbbax28isVPCgP+YpcMBw4qlRg1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7215.namprd11.prod.outlook.com (2603:10b6:8:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 16:59:20 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 16:59:20 +0000
Date: Tue, 13 Aug 2024 12:59:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, Hans de Goede
	<hdegoede@redhat.com>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "Brost, Matthew"
	<matthew.brost@intel.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
Message-ID: <ZruQ4kzSuPtpNbl-@intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
 <20240725122346.4063913-6-michael.j.ruhl@intel.com>
 <e70a44a24b1404a000e302a444a41c286538f3f9.camel@linux.intel.com>
 <ZrUyH6vZpShdacjx@intel.com>
 <fe23eb2ef30e4a867668a221f3f02dbe9d322edc.camel@linux.intel.com>
 <IA1PR11MB64188E3342EB3C26BC30EDD5C1BA2@IA1PR11MB6418.namprd11.prod.outlook.com>
 <ed0c857f-9224-4495-bd24-4ad9bc0e7aee@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed0c857f-9224-4495-bd24-4ad9bc0e7aee@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0142.namprd04.prod.outlook.com
 (2603:10b6:303:84::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: e895f678-004b-4537-c1f9-08dcbbb945fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?se9TMOIKB6DmhktbCzW7skEfKV3KMd/IBedisn1rEOpgfJvgGyer7cPt78?=
 =?iso-8859-1?Q?UPsE3WpLtqNZWVoyXISVmSeCGMS64SrDEB1b5ziehgHehl7FwxiLkQ5ibz?=
 =?iso-8859-1?Q?JIj/K6mWDVRpqSrQF47s6+kmr8SRoegeybZGTIbCHJJRu1+paR5TpovEaU?=
 =?iso-8859-1?Q?ADHYd1e7diGFPpV4QL/5jNpED9rAFm4LRAPUMyzAmAW0Ct1Cz6sUJo+r4G?=
 =?iso-8859-1?Q?HR4CL6rjD/nogNdrzPcwbj/DrGMzLM82X5wv/weUJwAuxZt75DxJgJiAkO?=
 =?iso-8859-1?Q?oZrUE9rFf4pHBtA9RrXew/7Kmf5undC+oc5AN3xwGS9t010tW/NcWSQdZB?=
 =?iso-8859-1?Q?n29DqJQ7kUJvaMbZNKpAUNINWITcRUMmusbobIGVHk3TJUdaRJVLG/AttP?=
 =?iso-8859-1?Q?ENNT6lamMEl1ccEvAc9WVpBYZFlYY/FS3YByMPFDZj1Qb3+sJNP3N4smSl?=
 =?iso-8859-1?Q?i8+MEJ1y/os0jVx12RBIGY2Hrk+KtQpTiaCCr0Bv+nlB08cfKrYmPr3EYJ?=
 =?iso-8859-1?Q?Y2WeX+tJoNCvc+TviwJ5i+Iz7XJnVTyc1JnlwcAkAmhPgl8ixWUG4p80ZO?=
 =?iso-8859-1?Q?O8MNeGfN3lMzBPYW03PH4c/UNVeoaJ40ba50//dhD4chAukU9Tpd0sVoE5?=
 =?iso-8859-1?Q?h3O5YvXyQMKZrZSR9+bnbRyTynUPZcBqvsyZJMfLbE+31tBV0xA395Uxec?=
 =?iso-8859-1?Q?x8jw7ajDnp5WK1BP/a34IhGGFrwiWZeiIsBK03Ht388xnBTJJ0GNl0Dpfw?=
 =?iso-8859-1?Q?jnu8Zp7qRyzROzFFjMOqrR8nsCkDo0H5IXihBWdEZx7iEN0n+gV2hK/8S2?=
 =?iso-8859-1?Q?L1gq+nk35ccjabziVuQcd1lthhCPqSdSvfB/mH1ZI4U/L0Rqt7gFhrVKzs?=
 =?iso-8859-1?Q?6KdX5wboUi47FYRKcrPbyuo/AAqQ7qWV+tkKHrBlnVnT1LfWB/lyj/xIrx?=
 =?iso-8859-1?Q?TKi2qU1KzTNfFYLXZ3Zr6ke6elRjH5W7fXBqeStXp3HiQa3F2luSZPRuVC?=
 =?iso-8859-1?Q?GpMbr4ezUqYkpjG/Ij89VR5vw9xNYDx5oYZztZnkuxBJ/o9qmgYAC62uF2?=
 =?iso-8859-1?Q?t/0p2jDEdk7iqXCy5wtxP9EQG5PTojeQMaXty9w4cuQatC3mkcLA4O+1Nw?=
 =?iso-8859-1?Q?6VjwVKeNuc8XEpBd+OSPD4Qt6W1wW1RBhFakBoyJCOt1Lkl8QK0BB7H/Ep?=
 =?iso-8859-1?Q?uC7+VCRXpgVOYP7IBwa3/jeQnJrWhWxjY78ep5F2YgGoGVOkizycjdCWzv?=
 =?iso-8859-1?Q?OlQBSVCd71ptJ/Q7e0qSthuf3ZKhpo88rs68zEfjUAfiNaGP9d1ff23XpD?=
 =?iso-8859-1?Q?kKy2kVZm4xhi91D20jjs91KguztNRMeyWXlp0fkzZTbuUlqhvWGndDvncD?=
 =?iso-8859-1?Q?tJI5b9o93gj/TOYp78bu9n9ucfpUpWWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2854.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hE8mLmOCDW7vE62UvAJlT7v8y9q9ZJNOaKA0gYFQV95cFzs6fzw7NLJIT8?=
 =?iso-8859-1?Q?bNgHpH29cTPc9jg0HPDi+tbqaKh9l/wycPBHr+DTsDtxiMRkjuQ5nhsmfN?=
 =?iso-8859-1?Q?XBnuxf6A8tNdCkTGkyALZTRsrTbjGxoW5CEDlBEJwboQ9OrPzonySt2S54?=
 =?iso-8859-1?Q?cuEXZ/vPp9IH7Udp8IEzEL/+IQmYrV6Twgq/LQcBoxLIFZDoSLDp19+0Xe?=
 =?iso-8859-1?Q?dvj+Vd1CjO12zeMvVv8m4xukHcd2l0QOd0EB84ivtCF8CIP63RAibI6DIR?=
 =?iso-8859-1?Q?Y6aqztvbCv7jf+lYuzNGmlWdbMvwLHBhRDLbnh/Xy81/Pq59O7DEa6qezU?=
 =?iso-8859-1?Q?+y8eMKz9UjcPGP40jzHwSyZUcwJJo3hOcAxFxXfzoYQ7fudTegRcqgYeN4?=
 =?iso-8859-1?Q?OIPr8wii7FWbFClxTgTEVAfPhdifJdop4yvqBi0nD3JElmHDlSdbSmmFt2?=
 =?iso-8859-1?Q?QOaVizzS8HKwEk2tAsTty9Xt25JlHTKD3k4YK1ejjs+Itg9Q9536gIEIxg?=
 =?iso-8859-1?Q?Eg7xybankzoh66NiY5ZT9hgVAYGqVInp67JL5Rw8XFd+6px5a5X6UuGXuU?=
 =?iso-8859-1?Q?aQP86+dWvSXqqfbdtLDIy7v2h1hE3u0TtaxfI+rMrhke+e3wPF3L1QFlVN?=
 =?iso-8859-1?Q?cRcUB595KShWtOhsfnmJzqxeXOSNqsFkEgbXCOBFILzpPogNMgzYXviwUy?=
 =?iso-8859-1?Q?NM2rTCmSTSUFb2OG3RigeMHU5PBXVVVS/91ofnfDVQYZbua1kdFNu5kWsO?=
 =?iso-8859-1?Q?T601bXBXtYFDQ46CQQe4Z7h8p8+eESib0uj3rm6+SvAtQQz9NNOtZwfrdb?=
 =?iso-8859-1?Q?L5NRs36Sev+U54dryf9K4r6p+1yGw5dfTfi19BoAVdtYB6MYT2hlTjQJHA?=
 =?iso-8859-1?Q?aFFX7UoKccqjvFj89mbyz8BVOTeQ91WNIYCNfd2oAd+OtEKWvV/8HG+Oro?=
 =?iso-8859-1?Q?BYtSdGeEp+uUhX7gEkwrgMXxc6W916VKu9gSfvHtpgSVctix2hbdKe2TJ1?=
 =?iso-8859-1?Q?ibc/aCg5RXY4YaO2gtHIijdxW/6nB4HpUd7WPwdFsSw3kyP1+Ap2nehvl/?=
 =?iso-8859-1?Q?2OC0KoIWegr7Cs7jpTOGkaoG9FasgyEBOhwopTNlP9cpEMC39AL4sE3YIl?=
 =?iso-8859-1?Q?O1+AhK845Gn7wWqVCVSIRB5lkGtC9GmxvEEfP38Y+cuxVr/sCIVNsVgpi2?=
 =?iso-8859-1?Q?gK7lFHK6xD9rqQhdP1xeteMOutFFGhJ6YsFjmKHuyOghM1jDnj5KOrjdZC?=
 =?iso-8859-1?Q?zjEZX0uV0vyiR0izrsYPWYXbxjqYhzrWiiIAYVqZbU54DI6LF6TI3EXboz?=
 =?iso-8859-1?Q?sjEsAcKy0wuVoUAsCFiDYTjhv96OZ3NhTP6UsZqtjsUQZN1X6YH7wFBUOG?=
 =?iso-8859-1?Q?akLNVmEShGP1XwWnI8PW0leeyfdX645UbI5jucunT12QE68J66R2tHj30+?=
 =?iso-8859-1?Q?sr6CPeyNoFfi6WoblQDANB7yl+ZuUKudxzbUfRSERfCQYmu+LhCWiBiNXr?=
 =?iso-8859-1?Q?FngpE47138qw91Kuy8vB3YRfTwW1w8T/Pta/e3EVFme7FiZOJtJFGDSIKv?=
 =?iso-8859-1?Q?qn0gkyFEvz1unIuW2TdR+DeqRO3EwhBD8IsMMHNqtRuQOAO80gtKs2aLhx?=
 =?iso-8859-1?Q?MAMMsxyN+IBN7PUqEIg452kcKGlrHCIYU1vNvGHLn4F9ps7wg+ypiEfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e895f678-004b-4537-c1f9-08dcbbb945fe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 16:59:19.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z03c8hC4H5o5fq2X3+P/9mQsCAiBm/GAiMz0KWi8SPDg/0VKWLQcv7QRBl6LhgsVatlD+XxHLfdNpmxl1+BeMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7215
X-OriginatorOrg: intel.com

On Mon, Aug 12, 2024 at 12:22:36PM +0300, Ilpo Järvinen wrote:
> On Fri, 9 Aug 2024, Ruhl, Michael J wrote:
> 
> > > -----Original Message-----
> > > From: David E. Box <david.e.box@linux.intel.com>
> > > Sent: Thursday, August 8, 2024 8:57 PM
> > > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesktop.org;
> > > platform-driver-x86@vger.kernel.org; ilpo.jarvinen@linux.intel.com; Brost,
> > > Matthew <matthew.brost@intel.com>; andriy.shevchenko@linux.intel.com
> > > Subject: Re: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT
> > > base adjust
> > > 
> > > On Thu, 2024-08-08 at 17:01 -0400, Rodrigo Vivi wrote:
> > > > On Thu, Aug 08, 2024 at 12:49:58PM -0700, David E. Box wrote:
> > > > > Hi Mike
> > > > >
> > > > > On Thu, 2024-07-25 at 08:23 -0400, Michael J. Ruhl wrote:
> > > > > > DVSEC offsets are based on the endpoint BAR.  If an endpoint is
> > > > > > not available allow the offset information to be adjusted by the
> > > > > > parent driver.
> > > > >
> > > > > I know I wrote the original version of these patches but I no longer
> > > > > like this solution. The s32 is too small for a 64 bit address and
> > > > > calculating the offset just to add it back in the PMT driver is
> > > > > unnecessary.
> > > >
> > > > yeap, 64bit sounds better indeed.
> > > >
> > > > > Instead, I sent you
> > > > > replacement patches for 5 and 6 that allow passing the telemetry
> > > > > region address directly to the PMT driver.
> > > >
> > > > Was these replacements sent straight to PMT list or to Mike so he can
> > > > adjust the series?
> > > >
> > > > I'm wondering if we should merge this through our drm-xe-next or
> > > > through PMT channels. Thoughts?
> > > >
> > > > In any case, ack from my side to get the xe patches merged together
> > > > through PMT.
> > > >
> > > > But if someone prefer to get this merged through drm-xe-next, then we
> > > > need to act fast and get this ready with the final patches and acked
> > > > by you PMT maintainers, in the next 2 weeks because our window under
> > > > drm closes much earlier.
> > > >
> > > > Around 6.11-rc5 is when we close the drm window towards 6.12 and we
> > > > are almost within 6.11-rc3.
> > > >
> > > > Thoughts?
> > > 
> > > For me Patches 1-4 are good to go for BMG support. Patches 5 and 6 add DG2
> > > support but need some work. They should wait.
> > 
> > 
> > David, Ilpo,
> > 
> > The DG2 patches are a nice to have.
> > 
> > Please take patch 1 - 4.
> > 
> > I will revisit 5 and 6 (with David's suggested changes) in the future.
> 
> Hans is the one handling pdx86 for-next patches in this cycle (we as the 
> pdx86 maintainers alternate it on every other kernel release). Please 
> remember to add him into receipient list when you send the next version
> with my comments on 4th patch addressed (always include all relevant 
> maintainers when sending patches).

Hans, Ilmo, any chance we could get these PMT along with the Xe ones
into drm-xe-next -> drm-next?

Well, if you believe the risk of conflicts later on your side is bigger,
then let's forgot and you have my ack to add the Xe patches along with
your PMT patches on your tree.

But if there's a possibility of getting these through our tree, I would
appreciate.

Thanks,
Rodrigo.

> 
> -- 
>  i.

