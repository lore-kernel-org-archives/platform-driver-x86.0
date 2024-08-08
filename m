Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85097E1
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Aug 2024 21:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723150897; cv=fail; b=Kp0tZihOLWzixQu03lG9WL/XT5/dTuOlmXdx6iCq1hxJSSSnhuHCffNaex+eAz3AWm5XBQPNueP2anbriU1scfLERRHO/xgS/jXFICuzPs9K80RQAmMqvKCHIb3bJzG+P/m6vqI/3h/xeynLil7a1Puy1TUR+g7BCZ16iqGR1Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723150897; c=relaxed/simple;
	bh=hqNa3yCyLEPGGjZzB4MQxGTOyMhOJekYxV1G75oWrMY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wi6ceM5gFgIEqNEynBzBClLYh5ToaJ1e8oCWrl6kLxxbMYz1eNyT/ijFb1Zc/7tqvZRf2HtMQLwhjWIaDUVx5yHiw3MkcHo2mvf7zcWL+HTTlaZNuvYCvvy0obq/qObjcA8tinLIECn8DdiR1ft0WNQdStzXil2pLYcvSb8TrT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1vTTQLN; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1vTTQLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723150895; x=1754686895;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hqNa3yCyLEPGGjZzB4MQxGTOyMhOJekYxV1G75oWrMY=;
  b=Q1vTTQLNcH3Dz/2lEvjpNKKNpYcmiEgeaHtehrQVHcEvw2SrRQrUxT9H
   l59VMInqNQ5ylnOOPA9OcD3q9qI490zglCjx+rOENP/72VO5Xs8/8M/hs
   e5o1SWOaXa8/WmAa6qLsHe+Po27d6px5YzIoTe+sN2bFtSOnpe1gmHr3I
   NfkM7+/w0SuKj8zgQwTSOr/ccNged82R26tFYj7OBV7Lhp9oTX8rZrKOo
   TkWLPwRdeB2bUysvHExCE1v0oRkiEp28EOXSDUnSvHNjx7MweCGEQgTtv
   C1isrJF02qALyqgi1ZYzDAZfWNBzS+5q4lcxFk3e9t24nGXnEKdpVaaNj
   Q==;
X-CSE-ConnectionGUID: A8trZVM7TJOwJM4LGT2MJw==
X-CSE-MsgGUID: 69KlrCkrSlWmdxodZXK9wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21114510"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21114510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 14:01:34 -0700
X-CSE-ConnectionGUID: d1A6PWi2SUCRcjdBZEQjNQ==
X-CSE-MsgGUID: RmY15bF+RaCdCLKnt8NYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57258707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Aug 2024 14:01:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:01:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:01:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 14:01:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 14:01:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UteeCJdKQmgTxdZg6lkHxx9r6RCsyeqzmvhikWJNlqnL+2jVi4Jh4YADjyqjrP5UNib/fddIcjVvi19aw18+JbOCOAMVdImjElvMZ3OqijW0uSOIFxF2fp3oo/St2g0QYUCKbM3/YHt1JLf2p7Fz9eg8JYpu/flPNzOXdiyooU9SKvra0qPVDMg7du4GFRiWyh8cKflvoGjhxMjePcQTBWeEtX+/nIVeOKONnLk4erl/ubFRLvpDvyMqXFcfPyRjROQzr8EJEQuw8lW7cPjInj+qan79zACPJuXGkx3D4fiW1w81mPcr8nwS7E5pLJ46dVkuf+Y0N+2j7PZ2AzfpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOtOQGrXJxKm+JPMvhBLRPpbManJxwOFIx8HJPywdx0=;
 b=ArWF/wf6jMZMFt7GxnvXmBINtQltPnEWSnDd+T1UnS8gCBzXhe/kt4WNl1GVcLAjEsOUUd+vxSkM76S5rOo/b7DEj7o9eTyXNFx+/fh3L49Lw04ZmeZ88uV+NstCHbumll6xWs/uKM4btc9RKJaNuts9Yu8A7u4juDPCpCU8i0K48cukaRz1ngHBzv2d7QiQNG6kiyf8cLVoUL14p9WWLkJic1v5KSxYhFFA9CeElZ+p2ua8Po9ELoO9Mf84aMevgrlCFADWbDsyI+5mRJ/h9L4CfoPzM8WjjWmb1cuVE6nBGN/4FwkaDhunUYE7F8KM9dNM0mTGTRBt1MpmzPegqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 8 Aug
 2024 21:01:24 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 21:01:23 +0000
Date: Thu, 8 Aug 2024 17:01:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
CC: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<intel-xe@lists.freedesktop.org>, <platform-driver-x86@vger.kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <matthew.brost@intel.com>,
	<andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
Message-ID: <ZrUyH6vZpShdacjx@intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
 <20240725122346.4063913-6-michael.j.ruhl@intel.com>
 <e70a44a24b1404a000e302a444a41c286538f3f9.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e70a44a24b1404a000e302a444a41c286538f3f9.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:303:86::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ab98ef-325f-4706-f832-08dcb7ed42bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?r4g1wuT1jkYL6fQrWuOB/Eq1dS500v17TB7iBeDYwulCVNLWmvdMVjIRX+?=
 =?iso-8859-1?Q?BPHjzulBij52+QQuaM23ecus/LDzN3NmlGCUQUyYrZ1mQUCG0gXFGVm0pN?=
 =?iso-8859-1?Q?+XBZxqEdouesMa1u/yY8sfkkvSRObX/SMa8Lsk1rpwuD+nAIjLMJEKm3Ym?=
 =?iso-8859-1?Q?sLUwnTWVhoSufzXYHwmm/qnSarqnGHEsCFFfJ3WdDdfqutcRHVX3QcHkAy?=
 =?iso-8859-1?Q?QTKQAWFiIA4FhWlOFTB5ndvS4V3MSoLaEJWb9GpXrFLXODvJEHB5iNVe/3?=
 =?iso-8859-1?Q?w+2pzJAkfmojFOrVWrOj2cP3ui+TLfWH++Kjhu5EYqbE5Z89df+xEn2FEG?=
 =?iso-8859-1?Q?32e9rZFjekmXBKrpryyXHqLkmrlA14JVGSEfumJYEliqGmBNYBimDCXnvR?=
 =?iso-8859-1?Q?6MOFGnWHBfEQnDmumNuicc968maBgMr/0Sv73hHG8ZczyGWJPkaOVrAfx7?=
 =?iso-8859-1?Q?vzYQ1Ng5/otZLoGYVw9k5lajcp3VnplEXtP7WUyUjbUhRrn41rCWmJQRTx?=
 =?iso-8859-1?Q?0oaOTbj5n67vu1JxyN3BbUD1u+UF4F98cZDRn8ol9b3VSTXGO62Bne4RU/?=
 =?iso-8859-1?Q?76t/lauUpGLVWSIsAM6sH9ziXw4cIcpKVWSG35JkABcdUBi26GLZjSW1Lk?=
 =?iso-8859-1?Q?utU3gPDXYD6JYFuHk3QYuOn+T6XaR3CvqVeywBNJAw2GfZQ6XaBTduqNGn?=
 =?iso-8859-1?Q?XPQPFVbhXKOrXWuFiDuPwIKH7tqi08hdH8d1pS4Kwtx63KlwvHtw29Diic?=
 =?iso-8859-1?Q?+byjIMEhJ9s47SI/sGYVNtNG208eJCUMdextEMP873PQoCrDJRNX/sOYRi?=
 =?iso-8859-1?Q?EH9SFbCXcX88JgY5/03RBY/UATlCzYeEnP8pU9FbAQGpfq4hsLv+Ov58r4?=
 =?iso-8859-1?Q?Izyx+KBUbv4ufzjezRTSPPysEKGFqebBYVSS2bouJbztbaY0asPPdlexRY?=
 =?iso-8859-1?Q?ffSeIE59UKE/ONURKrzEY5cV9egP9S9S/GI7Tsy53tlN7zYFczqUPVAv1J?=
 =?iso-8859-1?Q?77oO2oV9v5Pg02YMDXqN4V8enRe2dZq2uXQEwFt7nTVNNOkkqKr/L3TUiN?=
 =?iso-8859-1?Q?fBJ6zYGeicWMXWpmAtQNUPnmgMrZ8BQ/UCHCFqVE2iuH9dSB5TrBSYC5j5?=
 =?iso-8859-1?Q?8M9OAbjo4Kr2m+rGYXEGIVh0Ahp/jy5whd6P2Dy/uNSLw/seHdcpVFgCyU?=
 =?iso-8859-1?Q?dV0Rz10xmZFx7SM27/rYIH3X4jpD0+EdjBUfWYkyu2hW+N/xmUSyJoVXBl?=
 =?iso-8859-1?Q?Jm3jh7kwAfqk5OhN0rrJI7H+bcyfQsYkcrRjebg+d0QchG5lbCmFZl2VHF?=
 =?iso-8859-1?Q?qqWqmeScEUrjZvWRN1v3B3zIzhBepTSxq8p7hjfIsRn9Qt8ncSDpk1eZ1p?=
 =?iso-8859-1?Q?b+Ol+Cte8dpGFieyMe4uTC6w36SlW9RA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2854.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TvWRkW+CJoPR08Q/Jntz7Kkcw7wAQr58iFIRSe2mmOrkGQMGeHpjgA1rRO?=
 =?iso-8859-1?Q?Pa1SxKnAU0/Ibn1gcE9XREhIf0mgirOQ27ajOUvf2aovHDd4GAj5pZmVsb?=
 =?iso-8859-1?Q?NQVLFVzXB3xtuePgmdezuM2SMRo3zX4bs8LHpBPx75xQBqmhUOCKJm7L0U?=
 =?iso-8859-1?Q?o2Eqiq+M9PzwJjg76juhVajPGoBcfqjv7ObRJjaGF6zR2SU2q3k8NakE6B?=
 =?iso-8859-1?Q?vUdEuA8uG9ZV7lN5Lbt3xTaggTdhuJsLL/ksjo5zu0QxQIeNHOJWysNJAH?=
 =?iso-8859-1?Q?sjbmd1emZJOkVBD+ug/pijVU6MOZvbeM9rNNf+pMWU/hCrLMcooNfYcq1T?=
 =?iso-8859-1?Q?Le6/G1hBOeU/vxJEQXi7yE0gVvTEPs6WhNCXi/Yn5fiaAQUQEEDvgbcFCV?=
 =?iso-8859-1?Q?xizAedRTnINmU42+/4K23Q7VQHlhdT1sWMSir5Yv/4DpefcK1BxY9KYW+d?=
 =?iso-8859-1?Q?vaTtOiWd9vDcmg2e9hyUHKFAfRwtnahYb+YJfHInLwMuTMuIt83fnoF1AL?=
 =?iso-8859-1?Q?QP9jAgB359HsSNestWDacd2s/FAJSbAhAawgqndhUDlXkzS7t/kmlnaQEo?=
 =?iso-8859-1?Q?ZEWwVEcNFjdpd8g2wa+qykyiysczAwhiRW0m/WP+VmlsNH75ZSu8JEMgpV?=
 =?iso-8859-1?Q?TGqaMc0deWxxWR5b4s4j88nhhx8zNhHGmWjO1LcAyHcISlag6T8H6/iZXK?=
 =?iso-8859-1?Q?EWYGqev3cyJCFXpdEBDi1gzkgN4mGobrxKNO1rw7dVm3iagpwYjnSlCVyJ?=
 =?iso-8859-1?Q?eDXzh/wmChZPpfNKbnJfRJla2+fEkinIRTBoH8VPeUalTBnjLROkhY2AmM?=
 =?iso-8859-1?Q?bRFIbNIEjEYwjAWxEAzMyZhGVNFvRlIB746gOA8G7BPDvaUyKFmUzcSFAH?=
 =?iso-8859-1?Q?DuHB9Nbmo9w//X82OYYR98pxZVg1Wx4oj9sy+7p5hpGpi7xBifwOc+Zseg?=
 =?iso-8859-1?Q?aaQWqh3YMpJkmH2DY36VQON3Z9rBSu35GSCYb+ungPeaExK/2RU3Otv1Q4?=
 =?iso-8859-1?Q?M2R57lF3d9VpXbF8yK8cwvLa5McpmLBmfDRkyUkfk+bCRb+lDp1bPhqKG0?=
 =?iso-8859-1?Q?c45WG19n9Fe+atNF7xSjyx97ur0YA/1IjJE2EtfeswsfNm+R5bJrXo7Hgv?=
 =?iso-8859-1?Q?Smuw+bxA7NAQLGQ9X0Tgss4Vr4NvUg7bOdp1HCeaiw/vbg3INHQIelFR/Z?=
 =?iso-8859-1?Q?YpEEHKCq1L1juETnUda965gQUW9KzyoMzUe8bb4dAs2rnSFZ8NOMdO3Pe3?=
 =?iso-8859-1?Q?KLm6ye0ZveNZv37HxD/xWHiABU66alDyHpUKU2rXARSRnQssIfATlXghMK?=
 =?iso-8859-1?Q?EyvzcvimhNOWPEEEg64n0rDTTmWyxT61GSsviSyHFXqDeMSeM+oseCOMuc?=
 =?iso-8859-1?Q?0jUq3/TC9DaXrSiuDwUUnc594fWibTpV/Ji6mpHxfWalhqLDFViGwTs2oU?=
 =?iso-8859-1?Q?msu8WM+13NZJ3ndTbRES7vTZN+vxmRTda0BW/MqGyJ0OY0bbS6ULIjrXJJ?=
 =?iso-8859-1?Q?m13eTBrYO4rAF/omqoRnh25k1umdn44+uIQgQ6MvLvhzwatvF/g7215geA?=
 =?iso-8859-1?Q?azKB0FkTurcBx/NtoDn33vFvwHLMVFy6uaT3ryKdw+OQc8PBNZ3KyEAyZ4?=
 =?iso-8859-1?Q?8vjhYQNanu0K7a21JypwvcYAyF5YBxLHeNO8XTWkf6tAwewEgeuz3k8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ab98ef-325f-4706-f832-08dcb7ed42bc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 21:01:23.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: angypRAQy1O1rZnN5ilZtA/CmCw+YLZ3IEPBOMqjlk0GxM9PGxzYW4q0z3gLNOdZIvQAmF7A4BthVw6yb34JIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
X-OriginatorOrg: intel.com

On Thu, Aug 08, 2024 at 12:49:58PM -0700, David E. Box wrote:
> Hi Mike
> 
> On Thu, 2024-07-25 at 08:23 -0400, Michael J. Ruhl wrote:
> > DVSEC offsets are based on the endpoint BAR.  If an endpoint is
> > not available allow the offset information to be adjusted by the
> > parent driver.
> 
> I know I wrote the original version of these patches but I no longer like this
> solution. The s32 is too small for a 64 bit address and calculating the offset
> just to add it back in the PMT driver is unnecessary.

yeap, 64bit sounds better indeed.

> Instead, I sent you
> replacement patches for 5 and 6 that allow passing the telemetry region address
> directly to the PMT driver.

Was these replacements sent straight to PMT list or to Mike so he can
adjust the series?

I'm wondering if we should merge this through our drm-xe-next or through PMT
channels. Thoughts?

In any case, ack from my side to get the xe patches merged together through PMT.

But if someone prefer to get this merged through drm-xe-next, then we need
to act fast and get this ready with the final patches and acked by you PMT maintainers,
in the next 2 weeks because our window under drm closes much earlier.

Around 6.11-rc5 is when we close the drm window towards 6.12
and we are almost within 6.11-rc3.

Thoughts?

Thanks,
Rodrigo.

> 
> David
> 
> > 
> > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > ---
> >  drivers/platform/x86/intel/pmt/class.h     | 1 +
> >  drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
> >  drivers/platform/x86/intel/vsec.c          | 1 +
> >  include/linux/intel_vsec.h                 | 3 +++
> >  4 files changed, 14 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/pmt/class.h
> > b/drivers/platform/x86/intel/pmt/class.h
> > index a267ac964423..984cd40ee814 100644
> > --- a/drivers/platform/x86/intel/pmt/class.h
> > +++ b/drivers/platform/x86/intel/pmt/class.h
> > @@ -46,6 +46,7 @@ struct intel_pmt_entry {
> >  	void __iomem		*base;
> >  	struct pmt_callbacks	*cb;
> >  	unsigned long		base_addr;
> > +	s32			base_adjust;
> >  	size_t			size;
> >  	u32			guid;
> >  	int			devid;
> > diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
> > b/drivers/platform/x86/intel/pmt/telemetry.c
> > index c9feac859e57..88e4f1315097 100644
> > --- a/drivers/platform/x86/intel/pmt/telemetry.c
> > +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> > @@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct intel_pmt_entry
> > *entry,
> >  	header->access_type = TELEM_ACCESS(readl(disc_table));
> >  	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
> >  	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
> > +	if (entry->base_adjust) {
> > +		u32 new_base = header->base_offset + entry->base_adjust;
> > +
> > +		dev_dbg(dev, "Adjusting base offset from 0x%x to 0x%x\n",
> > +			header->base_offset, new_base);
> > +		header->base_offset = new_base;
> > +	}
> >  
> >  	/* Size is measured in DWORDS, but accessor returns bytes */
> >  	header->size = TELEM_SIZE(readl(disc_table));
> > @@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_device
> > *auxdev, const struct auxilia
> >  	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
> >  		struct intel_pmt_entry *entry = &priv->entry[priv-
> > >num_entries];
> >  
> > +		entry->base_adjust = intel_vsec_dev->base_adjust;
> > +
> >  		mutex_lock(&ep_lock);
> >  		ret = intel_pmt_dev_create(entry, &pmt_telem_ns,
> > intel_vsec_dev, i);
> >  		mutex_unlock(&ep_lock);
> > diff --git a/drivers/platform/x86/intel/vsec.c
> > b/drivers/platform/x86/intel/vsec.c
> > index 7b5cc9993974..be079d62a7bc 100644
> > --- a/drivers/platform/x86/intel/vsec.c
> > +++ b/drivers/platform/x86/intel/vsec.c
> > @@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct
> > intel_vsec_header *he
> >  	intel_vsec_dev->num_resources = header->num_entries;
> >  	intel_vsec_dev->quirks = info->quirks;
> >  	intel_vsec_dev->base_addr = info->base_addr;
> > +	intel_vsec_dev->base_adjust = info->base_adjust;
> >  	intel_vsec_dev->priv_data = info->priv_data;
> >  
> >  	if (header->id == VSEC_ID_SDSI)
> > diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> > index 11ee185566c3..75d17fa10d05 100644
> > --- a/include/linux/intel_vsec.h
> > +++ b/include/linux/intel_vsec.h
> > @@ -88,6 +88,7 @@ struct pmt_callbacks {
> >   * @caps:      bitmask of PMT capabilities for the given headers
> >   * @quirks:    bitmask of VSEC device quirks
> >   * @base_addr: allow a base address to be specified (rather than derived)
> > + * @base_adjust: allow adjustment to base offset information
> >   */
> >  struct intel_vsec_platform_info {
> >  	struct device *parent;
> > @@ -96,6 +97,7 @@ struct intel_vsec_platform_info {
> >  	unsigned long caps;
> >  	unsigned long quirks;
> >  	u64 base_addr;
> > +	s32 base_adjust;
> >  };
> >  
> >  /**
> > @@ -121,6 +123,7 @@ struct intel_vsec_device {
> >  	size_t priv_data_size;
> >  	unsigned long quirks;
> >  	u64 base_addr;
> > +	s32 base_adjust;
> >  };
> >  
> >  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> 
