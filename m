Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422E416CF4
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850335; cv=fail; b=CzOsd4gh7UYm44xrnlRmLEkMidbPNEYzidQt0fkKCtDsu+A9ap8a1INbV4Ns9ooJnsBG62n6b310mmOlhy9eNQs5/YFGUhGw7GfhXly92FCq1TrHzqJ+S4KvnCpevZEVZ5AVvPCVD4+NckVVtx5U0n81ZPg1b3NaCNDEAm84GVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850335; c=relaxed/simple;
	bh=kB/uoIx+1EU8vl4n/mJfy7/FxJoX4M5DPOazq3ua4pA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lUlDME6Kemaorb4WrRiR7MLkvfyWOPaWJ0z6tpnNcizgkITV+ujWEuaUk0fkO8p88aUcoRocy6YaYv74xxsV5UiS/gEeuxKrRMrAChTlKYZCGIhdEAjcowyJn923tJ0opKJt8LGZ7cedDMJT66a4SNPNKUtoBXtSXrxAJvZlm5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOIixyDj; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOIixyDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787850332; x=1819386332;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kB/uoIx+1EU8vl4n/mJfy7/FxJoX4M5DPOazq3ua4pA=;
  b=cOIixyDjvwvrphH+8WxESfLHq6Q5kkLP43DDTEU8jG0Nn320Ng/cibhV
   AC9nqvWPEFrjtRTHFnaxf19cNXpewbYU8wfTayl2b4bKTRDUkDN5L0fLK
   o7tdOrw6M9Nt2rpGRNqoS4a4zmAq7Jw9jCktJJ1XME8eOMZiis2ONVBuT
   MxP6txfo/QNdC1wFnYbaGGvIxRl8v6Ke81BEndv8HtxDIeANmNRFlnxE6
   AIl9TMy77vf0Zqp3h1849wzu3lK2rhDj8VWOmFfe7x/gxQlDbFFG5S8Ef
   0Z5iAjAX0UcfnH3LyqCpzh2aCQCZAtzKYQTZG+YTF0fuO0nTgiXDUelA1
   A==;
X-CSE-ConnectionGUID: C5zLWbRdT9ytqevdWGsJqw==
X-CSE-MsgGUID: hiepbj3CRzWeZc65RVPFCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92170941"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="92170941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 10:05:31 -0700
X-CSE-ConnectionGUID: DSG8d9VoRJumZjd8Qc1hOw==
X-CSE-MsgGUID: a7icGBLgToaJMDfds61plg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="292748934"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 10:05:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:05:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 10:05:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:05:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx8I86RZVVxdl73dnOP34Gmb2gkN6eBA7W+KAjWv9CKC9Aq/DeDtZkNYumYd6GGliuytvqTKSG3tHlI65ml8mlO3PWOFLedY2vONZC/1qK6wVNlfwIqb0JTv/7qhJ1YIfdjweDNiMGtyEHwv4U7l2mRRrr3sil1a5OAt12NAzhMISjQ6xV9iFdRIqnnmm5s7k+RYcSDo/ILctE1d+Uk+19u5LbWPc2+JdK17A713mxPBj3m+hT9PO2Ty90VT1B25IRYBED6Zf5AOvkAtEn2P+6jd0kG1F/BfZYk1AsqLTcCb5BUozAZnxci7jjJ265n+vcUpOIUUGAOHQg8SdocAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzA6XPkVirgLgh8eVRUs35+atroIfMweI4aRp6jzRaw=;
 b=g47sA4nt+/vu/IQH6JE1kRrOh71CaX40t9u2wQx3ectg4Bie5U+Q96Q4el/RhFK2c2w7JuLd7iMIQrt2szfXWsd1TFmKbwh6NbVoX59gxENGHgI/lnxy71lsRXyYsxea2sgnsXP0WsjkHZv71U55G2glDrOjRWATvMmMJuHc7NvKycR6377F85BAcqyg+zRwmVl2LhcpBrzmIUy21LGPxglExitiVvvW6/2rqUKhgbmDdqkl99Zd2PqsE7lBZlT8syBUtMbYrkdCeSwd5S+TFMwmggIMA9gDshlQdHwTP9CPX0sDcPVpruXTB7hGkErIlC2XSxS36ieoEGPUv5awZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS6PR11MB721915.namprd11.prod.outlook.com
 (2603:10b6:8:4c5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 27 Aug
 2026 17:05:22 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 17:05:22 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Vijay, Anoop C"
	<anoop.c.vijay@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
	"Roper, Matthew D" <matthew.d.roper@intel.com>, "Ausmus, James"
	<james.ausmus@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
Thread-Topic: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
Thread-Index: AQHdM+USZkUGPnycIUeg6ZOSVYCMw7augh6AgAH+L7CAACnTAIABemjg
Date: Thu, 27 Aug 2026 17:05:22 +0000
Message-ID: <CH3PR11MB0461493BF74235E6E5E5AB167CC1AD2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-14-michael.j.ruhl@intel.com>
 <d86e5e19-e6fe-468f-1a9e-cf51c0b2da2f@linux.intel.com>
 <CH3PR11MB04614971FF5B6E71CC17E77AE3C1AE2@CH3PR11MB046149.namprd11.prod.outlook.com>
 <e76729c8-6e54-6c97-756a-d14bef40ae0a@linux.intel.com>
In-Reply-To: <e76729c8-6e54-6c97-756a-d14bef40ae0a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS6PR11MB721915:EE_
x-ms-office365-filtering-correlation-id: 01cea5f3-47a1-4342-b37c-08df045d61b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|10067099003|3023799007|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: OlwrmzEx2UMe9JvZBMYLIcMFQo6PXHIJ0WjKMoOFoffk+093nkzyT2csjofe8Yz3lky2rGFZbW1gcszw/dm/noNybtKrRChC5S9B6cm9uaw2PcJ0h2XvdoPuaBGlRm4ksf7dGEOehJGWQTlEDXomCYWSvp3O+P9HXL2ZEe7XSXOvixLAPHVd22VNHUZ/8C/oG4HG5PvdzieL8SxYzmphgiJyLrCGVhM/NgV2dmuoRm91wzrnAZp+ywZRk41Gfs6GlWad3uCj8w6LVKW29gVvy9qcpOEmiMxehHhOaGSwLTPzc3bJh93YA7Yna2lh3RhFocL9i9TrfdZXCePZL7sI5Zmk8Wn9omb63o59TPMe8gmWQllePGrHQdnMbgTATfw8VUkSuDoR2BATo12bPHSxWqPxHO9/DJe4gH2SZB4ud3PR2nfPNx1tznzkdeoXizb3iIEac20W6vA5PxGetPLgcYd1a/7G9FzKzjcIaYvWS/bo8J2G4qWiSi3Xugi0Mfi85WUjzK2OLHz+usW3ZbqU2mzvvqFVZMEPYYeMMu3hkN6KRIT3RnrYxWnhjdDI+5I7roEYihhkLWDDh4Nm6PDdzBFZ4WcIKSHqK0ZbT4S5lkkfT7tRO2yfRF8nm717AzEELAG/fiszzwRU7djiRR7Xh/z4cX8qFr3hp5QubjhWHHBqGhoIvQ7fBOgDb7UOvyXHzOFlrInD6qwNwr9pOhzQfprZqZ++sDzhCm/0BbEPbeo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(10067099003)(3023799007)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iL64IT35bTme/4RYfdtDW7J4e84vwSjHynTtosXGH1gVWI+u0NrKFhsxlP?=
 =?iso-8859-1?Q?DEjw8ELXbm5Bjn0+8DndjVHVjN6L1xOh/HcOp7Fgk3vcHccy/ecWkow56j?=
 =?iso-8859-1?Q?UY/wbWzgzLVnV3KIfgTPx60bi1eirYkkNf2tgZ3i+sq1INlR+0ITznJr/L?=
 =?iso-8859-1?Q?/aPLohNMNhxiohtsiVkc67+lvzGa+kNhh4DmBgBOsJdJIhMezdPJQIOavL?=
 =?iso-8859-1?Q?e6FrpoCOvR9gXE9Q6c14sg5h0MIwj7jCZyssaoX35n9AwCQOZbu/Q6/++K?=
 =?iso-8859-1?Q?lphEuX78685kavUfyotxUQnp9Pl3lZsXhNSuHaIa6VemqzD3flWe4OqoK0?=
 =?iso-8859-1?Q?plqtbBOuWdp4MXBzd9B3QTYby7OqRMx0IUHBxbJbfUTy2OHz6pNCpF9EdD?=
 =?iso-8859-1?Q?alc83PBSSrBm2ZAgQY2bVziEf0eeFLLzkIxjoj6r5p8stxnA7/k8r6Edti?=
 =?iso-8859-1?Q?y8fGg/vhwZFVKlw1JocTcK3BrLGZ7lUYAChL2x/oMhPpqLP1EPDW+ToMJ3?=
 =?iso-8859-1?Q?10R3j0Ff7+JU7tuXBN+ckMFbORUOTk6l5t1UOCXa6M63cahRKRRuwwq2Ic?=
 =?iso-8859-1?Q?Ub9yqB7en9cQBCrF1MBrKzy3b6suxNxcJRScZha+p1KtGQVQmSQAqhfQXn?=
 =?iso-8859-1?Q?i1AiHoPqrDfyNfuswFToBGBGMTKiAoAImCfCOBF0gk5tuCSxek32t++BLT?=
 =?iso-8859-1?Q?LrzmFQrFCJEjjJFtedw4AEVB1Vf98aWNEU9GHFul9OA2cWtH79ilPhYPEo?=
 =?iso-8859-1?Q?dXKr+ByLl7VMLmDuYH+Z0Ij57K/MwtSMDp7dCeFGWxG4/vKTt7NDutTSJX?=
 =?iso-8859-1?Q?v7MO/HtXVmkkmQFE7fF5+61dMK3J19rve37PJINm3b0GC5QLq/qnKyU/C+?=
 =?iso-8859-1?Q?m2xeeIPpgcpyOJxO5Nzv4YWiBFQ4WslT/EMr5JAq5wJZrYxGl+68TP3SZZ?=
 =?iso-8859-1?Q?cFe/6/ypQWsmk41NgY+TebCG6E1A7HasgNztSGRdOMijKJLnWJhs0MZ9VS?=
 =?iso-8859-1?Q?DaHQW8mJxLHyHS5OY5keKmr1eP85lXpDzQDkt5E60CQ00j1sru0Mdl05nR?=
 =?iso-8859-1?Q?UVv3izkf5i5oRRnWmYY8tZgSG1FpkOOKJy88VcmHTNVZTv1Ofi5Pp8bsi5?=
 =?iso-8859-1?Q?i0rdvzyaqoe+i5UV6RH5DEtpg/C36xqCE0wd9qtVDndRc/tcTd2Wx0EW7N?=
 =?iso-8859-1?Q?OxA4DDAt/qbWZCc3P+OPVucAxM4ctWwWptBKIKga2mwZDmFVaF3qZA8L2p?=
 =?iso-8859-1?Q?kUi3D2jXpxQ5eRcctFIoaZJldoLPFTG14oGssCqASlgC6yzz9uE/2wyiTq?=
 =?iso-8859-1?Q?rv+BTiSk5LB5PFrC66X068hGZsD5K2GS3Gt4+PiNT/fdALH6A8Y+pm5apr?=
 =?iso-8859-1?Q?dtlEyL2w6dLAR+xY1soSLIAZrXSU949OO3o6TwWkq24fPb9IT8FmGFtCMr?=
 =?iso-8859-1?Q?VGqszUVybt9ZLu9r0SYs9N4q4qoIGDsi1JU7e79pThtPBby3J8kPN6+440?=
 =?iso-8859-1?Q?7eonMsEKGTo1HDFZPl0OKtDm2LgC3YH2KSgd4wwmpuMzdCCbIAavHIkzni?=
 =?iso-8859-1?Q?qfZcff9y/1E48HqqJRYG56FP/Lqi6dow2IaJYlI9yHp0Lz1K6WwsNjIRWV?=
 =?iso-8859-1?Q?u6FbHjsBpo5yfhasmVav7qP8/QMFQWcUl2Jt861H5qg2gfmAab2xzLhr9p?=
 =?iso-8859-1?Q?qM9k1jLishMiwcbGV3xz9OXldm2JG8frCDAA8KbALDM4QB6tPLLu9/0ZVo?=
 =?iso-8859-1?Q?JDuPWUCcD5iciQVSEFQHUhbViQ2Wm4hPzztueEJt3W7tM2jbkbtruRIkqJ?=
 =?iso-8859-1?Q?+wSuyWnZBw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XEgvzrYFlkUcNmTX10SPQd4pjlsLxWsAt+z06m9YdtvEfiXE3NDc5c+Q1XWnaVmvIvuaaD/08Lci/CwC7yAJSLKk8rZUDUfEdo17Tebrtj0/8A7/cooOXHrMESRf5ZjLXrwdMju75DhqX0odooXMs7wjbe1mxuBYRXKyHhsfdxWXhzweSScbSF0qOVOx9YG+lhkqbtNl+hH6vlZSbjK6ZZaS735C6OH5IJuWjp9IMPhE6947XSJnjoQfLtMdSbXiHTens6mGnqWJ18PirnP2fi/2g3/10AWk5dpfilqdZR8QpXw93cvgFZbfF5DxkTmE12igyELc1qaNVx03NFtt3w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cea5f3-47a1-4342-b37c-08df045d61b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 17:05:22.7148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsL4ALeBDyc9rEJluTQrFBDbz3BtjrJ8xcTK2la0wNrW+xRhCquEsVjFA574NKg6Oh3lxDxhi8St7jKkbGPAlS0LHTxRJUnAADBb1xlJ0dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB721915
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Wednesday, August 26, 2026 2:30 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hansg@kernel.org>; Brost, Matthew <matthew.brost@intel.com>;
>Vivi, Rodrigo <rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: RE: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
>callbacks
>
>On Wed, 26 Aug 2026, Ruhl, Michael J wrote:
>
>> >-----Original Message-----
>> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>> >Sent: Tuesday, August 25, 2026 5:35 AM
>> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org=
;
>Hans
>> >de Goede <hansg@kernel.org>; Brost, Matthew
><matthew.brost@intel.com>;
>> >Vivi, Rodrigo <rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.co=
m;
>> >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>> >Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
>> ><badal.nilawar@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>;
>> >Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
>> ><karthik.poosa@intel.com>
>> >Subject: Re: [PATCH v3 02/10] platform/x86/intel/pmt: Add register acce=
ss
>> >callbacks
>> >
>> >On Mon, 24 Aug 2026, Michael J. Ruhl wrote:
>> >
>> >> Some HW does not have direct MMIO access to PMT control and data
>> >> features.
>> >>
>> >> Augment the current callback infrastructure (data access) to allow
>> >> a registered driver to customize read/write access to the control
>> >> paths for PMT usage.
>> >>
>> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> >> ---
>> >>  drivers/platform/x86/intel/pmt/crashlog.c | 39
>+++++++++++++++++++++-
>> >-
>> >>  include/linux/intel_vsec.h                | 14 +++++++-
>> >>  2 files changed, 49 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>> >b/drivers/platform/x86/intel/pmt/crashlog.c
>> >> index f936daf99e4d..5923ad7abbd9 100644
>> >> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> >> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> >> @@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct
>> >crashlog_entry *crashlog, u32 bit, bool set)
>> >>  {
>> >>  	const struct crashlog_control *control =3D &crashlog->info->control=
;
>> >>  	struct intel_pmt_entry *entry =3D &crashlog->entry;
>> >> -	u32 reg =3D readl(entry->disc_table + control->offset);
>> >> +	u32 guid =3D entry->header.guid;
>> >> +	u32 reg;
>> >> +	int err;
>> >> +
>> >> +	if (entry->cb && entry->cb->read_reg) {
>> >> +		err =3D entry->cb->read_reg(entry->dev, guid, &reg, control-
>> >>offset);
>> >> +		if (err) {
>> >> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
>> >
>> >Never print __func__ in any user consumable message (level > debug) but
>> >write the message in plain English.
>> >
>> >Also, this needs include.
>> >
>> >> +			return;
>> >> +		}
>> >> +	} else {
>> >> +		reg =3D readl(entry->disc_table + control->offset);
>> >
>> >Add include.
>>
>> I have added the linux/printk.h include... I am not clear on the correct=
 readl
>inclued.
>>
>> Should this be <linux/io.h> or <include/asm-generic/io.h>?
>
>Usually it's better to use linux/ one, except in headers that are used
>in many .c files where it may be helpful to use as precise include as
>possible to limit the number of things one include ends up pulling in.
>
>> >> +	}
>> >>
>> >>  	reg &=3D ~control->trigger_mask;
>> >>
>> >> @@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct
>> >crashlog_entry *crashlog, u32 bit, bool set)
>> >>  	else
>> >>  		reg &=3D ~bit;
>> >>
>> >> -	writel(reg, entry->disc_table + control->offset);
>> >> +	if (entry->cb && entry->cb->write_reg) {
>> >> +		err =3D entry->cb->write_reg(entry->dev, guid, reg, control-
>> >>offset);
>> >> +		if (err) {
>> >> +			pr_err("%s: failed to write reg: %d\n", __func__, err);
>> >
>> >Rephrase without using __func__.
>>
>> This was for my internal debugging and should have been cleaned up.
>Removed.
>>
>> >> +			return;
>> >> +		}
>> >> +	} else {
>> >> +		writel(reg, entry->disc_table + control->offset);
>> >> +	}
>> >>  }
>> >>
>> >>  /* Read the status register and see if the specified @bit is set */
>> >>  static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit=
)
>> >>  {
>> >>  	const struct crashlog_status *status =3D &crashlog->info->status;
>> >> -	u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
>> >> +	struct intel_pmt_entry *entry =3D &crashlog->entry;
>> >> +	u32 guid =3D entry->header.guid;
>> >> +	u32 reg;
>> >> +	int err;
>> >> +
>> >> +	if (entry->cb && entry->cb->read_reg) {
>> >> +		err =3D entry->cb->read_reg(entry->dev, guid, &reg, status-
>> >>offset);
>> >> +		if (err) {
>> >> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
>> >> +			return false;
>> >
>> >It seems you need a lerger rework here to properly return error codes.
>>
>> Yes, there would be a significant rework (almost all internal functions
>> will need to be updated) to return the error codes.  This seems out of
>> scope for these updates.
>
>Your series adds a call that can fail (before there wasn't one) so it
>should be part of this effort. bool -> int conversion should be mostly
>simple (though admittedly a bit tedious) as it mainly just adds the
>error handling ifs to the callchains.
>
>> Does this need to be addressed to make progress on this patch set?  Or c=
an we work on that
>> in the future?
>
>I think it should be part of this effort because of the forementioned
>reason.

Ok, I will rework the code paths.

M


>
>--
> i.
