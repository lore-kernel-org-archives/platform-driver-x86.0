Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6F747F7F
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720719891; cv=fail; b=uxjxChDjYdA9EKj1x8EaUzSc4S6E02MGMNWnbN5YJZMOsO9hMXp7lSOFoYknoY7enS3oiPg5BUIZl8qRgMg2Br44WIouzeSI8QcSxCS3DBZdyOzUlQ7q4wcFPcr4MdaOuncvEV9n5nDxESllPqY4WSliQiHxGCjHprZa2WEsu4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720719891; c=relaxed/simple;
	bh=OypnqTpQ03kgKgfuvU1zMLQPLcptMAo4Ai4Z1JYtfjQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gSJQpq/Dr/88g1pALgCexx4+/AP72oJVEsWK6LFZb3EJr3SaalR+2uXnZ6bya+pCMJCQOWu265GFf6HgoBDgK6Bn7JXyFxNJ9g0zp76hCOgGOizTAmz2VariSRVJDwDZXs3vECubHZrjm8+mTJ02GeUz68rw8p5XdGI7Rvg2eRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7rM33iM; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7rM33iM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720719889; x=1752255889;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OypnqTpQ03kgKgfuvU1zMLQPLcptMAo4Ai4Z1JYtfjQ=;
  b=I7rM33iMhW5ep4RmcAFv4sOLq5Hme5yxq1ZkVlwpKaFamGpHH+0xiQrY
   RlPFvrwEuIk1M70I5j7CUtlys2R9i8a2w5X8guYyeaHKArmGY0e8FzmQ/
   UuOZls8i7TvWcp/Qmv872p69h0Rl1Lj9LWDvofrbWVxBT3jHFtz5wvNdc
   VblONztq/3Vl7eDs3K69Vawmeui5GEKl8msV/XdVMKPRTKghbi/B3Hn4F
   ZKBFpTp77De8SlthRMxyUSSg9hxm/YLYIYCPRMFAluv4nbHraSKeAn06V
   i5lJGfTLfmMV50j44qKbOQr9ezDGbDhF4gPfqfU2i8q513RrFOl/T8xyZ
   Q==;
X-CSE-ConnectionGUID: hjNhFWh+QZq2HbwIQlQxNw==
X-CSE-MsgGUID: jr8ilNPOTUmFefHh9zCqcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28716706"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="28716706"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 10:44:48 -0700
X-CSE-ConnectionGUID: N6tTcqk8T7+SnEi5HzLJYQ==
X-CSE-MsgGUID: p7/poolITCukNYitHhxV/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53458851"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Jul 2024 10:44:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:44:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:44:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:44:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcn9Sd4Gu9HTd8askUgcOUcBJChXidfqz+5Fb0o5mDtL5BNYj2TeGqrvR2cc4wDEUW38YV3i1vNh7udd7iiZxm/gCZz9MKD+3wLEDxZbKpkFEFmT5e7aLQsrAh0Q846cq+4EemLBpyIK2c4TMUSY+yC0OfG3BSyLaztXeVElDcSj2vizqCj1Nw0DEXWC0AcKpWMh0SQdYRzueNNrBlBralwcZzbpdzfVQtvBfd0z9T3kk1RBWSsgos4iJDJwyCEERHAjOKg6zDeUmbEq01Jf6Jh38a+r/1eAsgspb1mTu1jetuK1rTeiyFmC21WRRJNtEO5OzKTXPwON6RuE2FMXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qQncrx5OrP1DRkEOi+I98YeD2K1EeFHA3Dm81Zz9Uk=;
 b=Y8O7a6NVpUxFjwiew3N4LUjSq/uZLKfN7dZMZi7Srvrjko3CtE7aSzrcvJ24OXFq/r299X8qnIssPeEc1wGx9QRSTwqudqCitJhZH8wLUAu/NRHnibrCs9eU6JgCOZiLQjCh+sa/bdxI/7sW4+SihuMqLWkc88TuzqrD+ztrfJESYMlNfFpAdquWuTT5vR10pwIzUOpeyjt4jI+67Aj0cMzbdQAYlkMgxQbO8zgMlwJD15fXd37PK4X+y4/TNNGS+bXmJpkm3Za2oDYhA8E51WciNQpF1wnkxoLvTg3SkWXZB6Se4rCax73Nt6j+9BCk+E01r3gmrSctnz6FEZPmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Thu, 11 Jul
 2024 17:44:45 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:44:44 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Brost, Matthew"
	<matthew.brost@intel.com>
Subject: RE: [PATCH v6 6/6] drm/xe/vsec: Add support for DG2
Thread-Topic: [PATCH v6 6/6] drm/xe/vsec: Add support for DG2
Thread-Index: AQHa0v6lXeZvdNTpnES1O02cWhrEGrHxaWeAgABkTcA=
Date: Thu, 11 Jul 2024 17:44:44 +0000
Message-ID: <IA1PR11MB641896955FCADBA7B19CE222C1A52@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
 <20240710192249.3915396-7-michael.j.ruhl@intel.com>
 <c3a26fdd-ebb7-a5d1-38b3-0832c7e92652@linux.intel.com>
In-Reply-To: <c3a26fdd-ebb7-a5d1-38b3-0832c7e92652@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MW3PR11MB4553:EE_
x-ms-office365-filtering-correlation-id: b261e732-2e04-4380-84d1-08dca1d126aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?vooO8QKs1Knc1nMMtAy5i3udpwYyoCOXfovOxcUSSfv3Q232+bClff7LBJ?=
 =?iso-8859-1?Q?KExns39WJy3iBBD8ezDaOtbZzr2ZljIQNHvz8zOG8tplSLT57TbTzY644B?=
 =?iso-8859-1?Q?U2gwfbOKTurpd5pS8ljP38w2A4XVbn7Zty1SgFFW7O3JkESMWjlu4p0tTR?=
 =?iso-8859-1?Q?cvnPTcA0IK5U7YoHJy0kcwVVdXU8YfLeaalEsr0ugo/tp05SsKHWeUM0Q7?=
 =?iso-8859-1?Q?n212AxorR5sGlN3a3yBzwmUMeJpnRQ3iwNN1zfv+YhwV0hV7zdgx9lNbDr?=
 =?iso-8859-1?Q?LebYRzpFflgPMYy9HL9NQaHf+zkE1VM6HzapJY9UsCEYhcfpXBvtqr2Kif?=
 =?iso-8859-1?Q?DwAya2YXzfocozpasGXb0SyH7wKTdXaPerw02gM0s6YB6nh10ZPmkBYs35?=
 =?iso-8859-1?Q?kA5++d3k0P0ak45lyjlk0C6yuqCqvXsjXG/I8IHhWwHz4Vp13woJPkYz6h?=
 =?iso-8859-1?Q?iBHelREft1BxkzyRwJnbcNZSnej2hsR0/FADFhyNKf2hPA829gv9gs7LjO?=
 =?iso-8859-1?Q?Sf3UynhE2iob9OmInYKMiH2diTfeyZlopNrJPhPgXapXvU1gXL6UPEMDcJ?=
 =?iso-8859-1?Q?vYJCr/0J1SzoIJGqMJyCWQDZ1ZARVb85/99PFpDNDF0NqlitAUJU4QwXDy?=
 =?iso-8859-1?Q?He6NcXjT1gqgA5qvc98mPtRDFwkHCVGKIaADSVMbmbQbtGRnAsLOMI23E9?=
 =?iso-8859-1?Q?XgNdv4uhBHlBdjGtGyKnuOIVra5U5VyN2Le9G+Mh304LcNt+O6ew8NsXme?=
 =?iso-8859-1?Q?uVjEFtsrfck9bwGZq7z8PgP6XhEZDFZfNmdAIltBrp9rlHMhN8OYpNqYFK?=
 =?iso-8859-1?Q?uoKjpxz28VjCJfBABJVohi4jtIoj+KX9qqkw6fSqw89wDHDAIkpKZjvDPC?=
 =?iso-8859-1?Q?pPFiVdJetWX2VBO69eos/kmnBpaKs1Igq9EJEEQtj+KEAyi3wQXgEginTN?=
 =?iso-8859-1?Q?0WigPZVXBoeVD1D00g3RYpmcVHFSbyRwFgMKVPXtGH4LLACOiD9tEmD6hj?=
 =?iso-8859-1?Q?1klolt1vvrYgd3mRUsLPtR07Joyy78WDpIf8k6WA1CBD7RH1xv8WekB4Wy?=
 =?iso-8859-1?Q?jswmeiy/rkbCifhxtgu47I0mFBa5+C/KXiQWoNh9DiRNSUZpc1XGrizEMx?=
 =?iso-8859-1?Q?cc8kqCikUZTcuYrkij5AcFTHe1/JFPx/uijEcc/Hm6rCqOvt3/bNW6OrZ7?=
 =?iso-8859-1?Q?Yc7L/2HXj4P2m8x3WZVdECYJG3RhskWFKIxYldyxfEKbhG3zqRCJU1+bwU?=
 =?iso-8859-1?Q?fXewxBjxpGxlDNUrH0GfILg1lcr/GhSWA7tvTtfxP654U+FBJHUCtBdNEB?=
 =?iso-8859-1?Q?avEu5Lkg515zT2K2HOPiDF1H6biushUv0OrICPguqZfLR8kMhATa/SOfsP?=
 =?iso-8859-1?Q?ipx5CLVVoBArrV2TazqoTS+dRE3sVuZFyX+J9ikGplpmOEJaCDo1T2BFd7?=
 =?iso-8859-1?Q?+/4LAvQ2R0PjRPEkqWoZC632VoDaD8THBEyUTg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?s+INyMgR9MNHUj03nTS5v3OBHeYICPjCPAplNi0Hi0eupecGmYdFbaMy90?=
 =?iso-8859-1?Q?TyW96v9hr672oRdfDo6kiQtrwVHper4ITGFMWhLdKuvWpy9GQetCGTEEju?=
 =?iso-8859-1?Q?0E8NH3gHIKSz03CHsOvaC/IIsuzAGDZyEl25MUXgKF1zLlw0AwSd81nYhc?=
 =?iso-8859-1?Q?22t1R4z5MVAuqCpNkjwxEFOgVqXT9d0AazLAO7hTK81rG6iiFce8GRgojn?=
 =?iso-8859-1?Q?yC4qJSeY3tgkFjEyq5zq04gLMR2krqtp6Hu71a3pBME6egFg8L2p5hTB3V?=
 =?iso-8859-1?Q?2saV2MYgpa5yKgjvSi5BvZvRbHSs8t8ZY8XXCnBIRP3q0l5Tjwkk2hsafV?=
 =?iso-8859-1?Q?eSIT2m5QqzQ6MIa/fm3lyHKPm3YiDvOEFhNz1xXu5HruJ+WmFUvNqVgZby?=
 =?iso-8859-1?Q?lzmVfCi8K4C1UBFDH7nRHWbmw2B7wrwkqQFdwdQKH03m5c2p1slsY+tCSB?=
 =?iso-8859-1?Q?5odhiyUkvbOAiSOINdtnB+hL6BvR9fYUf9Vw2xvB+6e7AgB+GyOTtZyOaI?=
 =?iso-8859-1?Q?VCa+SQhzLKgGHbwI7tOGO7ZyCLLGo2Ij7VJZJm/o9YzBz3tivQwDjbjNhh?=
 =?iso-8859-1?Q?m75d4QgHlEuV2DkL4RaYIsmg9+Rcb8OQA38oIK0wixmYLDgs4n9AxjTRZU?=
 =?iso-8859-1?Q?p3F21GWLi3bZdKQbPdIkMct2wZS7eFJLIUKKvv+8YWbFAFOQtTrWfG6faO?=
 =?iso-8859-1?Q?RieLwpsaVZjyr7wDI0oOUJVGaudzWEXYlsouoqkm3LXJTWLI4tfNaryvz1?=
 =?iso-8859-1?Q?lv4yq+d54mb8hzYWILQwjjpmO5mxpNCBeqXw3Ibd47e0pQrlPF5lZT21rD?=
 =?iso-8859-1?Q?nHDnuKe/PvgGmyNK8RD7iLGwCsHrxAkndZzdOIdiwLxrS2keYC+uy+9J35?=
 =?iso-8859-1?Q?Gh6E6OHHRZLBbes6k1Fs73GSuc2mOo3Jsjn41vQwIPUrv4zHftwmeRPBEM?=
 =?iso-8859-1?Q?FQMes34EIdcxphmV+vSvj4+VwJ891FSh1Sf/9paLJpKU97kvTEI7U79DPF?=
 =?iso-8859-1?Q?JsF8uFy97+47arTOF/1anSnVL3eEmYydZPdklFDrYMYFSAG33lyUVFhD03?=
 =?iso-8859-1?Q?K1D8fuX4wxrkWUtNikklJPTa/t2YK+b6XhPPUDbmceoLAV1E+q+KOux6WD?=
 =?iso-8859-1?Q?dInIgUMx6pPKdhCw8wGejXqFEnIKdlDNIu+/61ve9kHL4Y4v8QaH19Uhls?=
 =?iso-8859-1?Q?8zAPqQwp9twdVPxSPpiUp7IiXZhiboVKKDM7nIU3hJuUYsUEA8rUQjQWgk?=
 =?iso-8859-1?Q?SuHa2l0FxHlC/w/WNI8/b2rRuWW6Ii5F4wLL6VUfOSnyepFFspAuQJPrRT?=
 =?iso-8859-1?Q?w3+DFT2hVMtvBP170vmoKtv67YePXbEwd0mJNCl59qnV0fHGkwkkJHe3ef?=
 =?iso-8859-1?Q?BtHh4Uqw/wa+NQeFhcyXN7SnrGRvMaaERY/H3Ikw9beB/m4q7SYwHhO/pw?=
 =?iso-8859-1?Q?fjTk2AXsEauTPQotguKU+tqbC9Zrw3Vyhz3vSjWDORN6iLsq5e2xFGUZxP?=
 =?iso-8859-1?Q?HLDsVAcja82HKmoTHTTHzYmR7NEHAOM2byYIuG0yx68BDqn6Wq2Ur5Z9Kw?=
 =?iso-8859-1?Q?tf5VvX2XQNcEPwz584DnPtUKsOVj4tl0TbWitK1nokBXsRA6Ch62Ygeu7t?=
 =?iso-8859-1?Q?WRwCmgDllu1U6yGh8rdMYfPLjYobKzqWs6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b261e732-2e04-4380-84d1-08dca1d126aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 17:44:44.6038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nAzWHm/N5nyR1c6HgNeA4N7Mdd8LA3mcetVzNDsiyr1/7HknfSf0bDqm8JD/ZtAjtD/j/cWCSGBDAm2fi7Om5XB7y1a2Tq4JTl/NiyPKBks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Thursday, July 11, 2024 7:45 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
>david.e.box@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>
>Subject: Re: [PATCH v6 6/6] drm/xe/vsec: Add support for DG2
>
>On Wed, 10 Jul 2024, Michael J. Ruhl wrote:
>
>> DG2 needs to adjust the discovery offset WRT the GT BAR not the
>
>WRT =3D w.r.t. ?
>
>> P2SB bar so add the base_adjust value to allow for the difference
>> to be used.
>
>Could you please try to write out the problem in clearer terms. Currently
>the reasonale given in patch 5 doesn't even match the one given here or
>it is written in so unclear terms I cannot make the connection.

Yes.  I will right this up better.

>> Update xe_vsec.c to include DG2 header information.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vsec.c | 81
>++++++++++++++++++++++++++++++++++++
>>  1 file changed, 81 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 98999d467db1..531ddd32a1a6 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -19,6 +19,16 @@
>>
>>  #define SOC_BASE		0x280000
>>
>> +/* from drivers/platform/x86/intel/pmt/telemetry.c */
>> +#define TELEM_BASE_OFFSET	0x8
>> +
>> +#define DG2_PMT_BASE		0xE8000
>> +#define DG2_DISCOVERY_START	0x6000
>> +#define DG2_TELEM_START		0x4000
>> +
>> +#define DG2_DISCOVERY_OFFSET	(SOC_BASE + DG2_PMT_BASE +
>DG2_DISCOVERY_START)
>> +#define DG2_TELEM_OFFSET	(SOC_BASE + DG2_PMT_BASE +
>DG2_TELEM_START)
>> +
>>  #define BMG_PMT_BASE		0xDB000
>>  #define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
>>
>> @@ -32,6 +42,20 @@
>>  #define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
>>  #define SG_REMAP_BITS		GENMASK(31, 24)
>>
>> +static struct intel_vsec_header dg2_telemetry =3D {
>> +	.length =3D 0x10,
>> +	.id =3D VSEC_ID_TELEMETRY,
>> +	.num_entries =3D 1,
>> +	.entry_size =3D 3,
>> +	.tbir =3D GFX_BAR,
>> +	.offset =3D DG2_DISCOVERY_OFFSET,
>> +};
>> +
>> +static struct intel_vsec_header *dg2_capabilities[] =3D {
>> +	&dg2_telemetry,
>> +	NULL
>> +};
>> +
>>  static struct intel_vsec_header bmg_telemetry =3D {
>>  	.length =3D 0x10,
>>  	.id =3D VSEC_ID_TELEMETRY,
>> @@ -48,10 +72,16 @@ static struct intel_vsec_header *bmg_capabilities[] =
=3D
>{
>>
>>  enum xe_vsec {
>>  	XE_VSEC_UNKNOWN =3D 0,
>> +	XE_VSEC_DG2,
>>  	XE_VSEC_BMG,
>>  };
>>
>>  static struct intel_vsec_platform_info xe_vsec_info[] =3D {
>> +	[XE_VSEC_DG2] =3D {
>> +		.caps =3D VSEC_CAP_TELEMETRY,
>> +		.headers =3D dg2_capabilities,
>> +		.quirks =3D VSEC_QUIRK_EARLY_HW,
>> +	},
>>  	[XE_VSEC_BMG] =3D {
>>  		.caps =3D VSEC_CAP_TELEMETRY,
>>  		.headers =3D bmg_capabilities,
>> @@ -174,6 +204,7 @@ struct pmt_callbacks xe_pmt_cb =3D {
>>  };
>>
>>  static const int vsec_platforms[] =3D {
>> +	[XE_DG2] =3D XE_VSEC_DG2,
>>  	[XE_BATTLEMAGE] =3D XE_VSEC_BMG,
>>  };
>>
>> @@ -185,6 +216,49 @@ static enum xe_vsec get_platform_info(struct
>xe_device *xe)
>>  	return vsec_platforms[xe->info.platform];
>>  }
>>
>> +/*
>> + * Access the DG2 PMT MMIO discovery table
>> + *
>> + * The intel_vsec driver does not typically access the discovery table.
>> + * Instead, it creates a memory resource for the table and passes it
>> + * to the PMT telemetry driver. Each discovery table contains 3 items,
>> + *    - GUID
>> + *    - Telemetry size
>> + *    - Telemetry offset (offset from P2SB BAR, not GT)
>> + *
>> + * For DG2 we know what the telemetry offset is, but we still need to
>> + * use the discovery table to pass the GUID and the size. So figure
>> + * out the difference between the P2SB offset and the GT offset and
>> + * save this so that the telemetry driver can use it to adjust the
>> + * value.
>> + */
>> +static int dg2_adjust_offset(struct pci_dev *pdev, struct device *dev,
>> +			     struct intel_vsec_platform_info *info)
>> +{
>> +	void __iomem *base;
>> +	u32 telem_offset;
>> +	u64 addr;
>> +
>> +	/* compile check to verify that quirk has P2SB quirk added */
>
>I don't know what "quirk" the first instance refers to (I think I
>probably know what the P2SB quirk is).
>
>What is the purpose/meaning of this comment? Is it some leftover for
>code that no longer exists as it talks about "compile check"??

Artifact from my first attempt.

I will remove this and update the comment below (another quirk reference).

Thanks!

M

>--
> i.
>
>> +
>> +	addr =3D pci_resource_start(pdev, GFX_BAR) + info->headers[0]->offset;
>> +	base =3D ioremap_wc(addr, 16);
>> +	if (!base)
>> +		return -ENOMEM;
>> +
>> +	telem_offset =3D readl(base + TELEM_BASE_OFFSET);
>> +
>> +	/* Use the base_addr + P2SB quirk to pass this info */
>> +	if (telem_offset < DG2_TELEM_OFFSET)
>> +		info->base_adjust =3D -(DG2_TELEM_OFFSET - telem_offset);
>> +	else
>> +		info->base_adjust =3D -(telem_offset - DG2_TELEM_OFFSET);
>> +
>> +	iounmap(base);
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>>   * interface
>> @@ -196,6 +270,7 @@ void xe_vsec_init(struct xe_device *xe)
>>  	struct device *dev =3D xe->drm.dev;
>>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>>  	enum xe_vsec platform;
>> +	u32 ret;
>>
>>  	platform =3D get_platform_info(xe);
>>  	if (platform =3D=3D XE_VSEC_UNKNOWN)
>> @@ -206,6 +281,12 @@ void xe_vsec_init(struct xe_device *xe)
>>  		return;
>>
>>  	switch (platform) {
>> +	case XE_VSEC_DG2:
>> +		ret =3D dg2_adjust_offset(pdev, dev, info);
>> +		if (ret)
>> +			return;
>> +		break;
>> +
>>  	case XE_VSEC_BMG:
>>  		info->priv_data =3D &xe_pmt_cb;
>>  		break;
>>
