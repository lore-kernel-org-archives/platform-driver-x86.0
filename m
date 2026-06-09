Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65D40B395;
	Tue,  9 Jun 2026 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009010; cv=fail; b=iVJ4gmUnjZ9VpCmG+Zv/+3m/73lDg+heMuHq+i4jId8YaFmdXwDIjyuqabABxjXmcUhw9yeoZKgbE1MUkVh7bUOPqpaVVihNOmGY+3x5RIUaipX/ZklnYeVUfCde9zNT/U60vKV4RlIfeI3mFUqltt7ladPubLu01HcKJ/kCn9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009010; c=relaxed/simple;
	bh=aOnTnPmhvjFGhm9/lhHKd3JmLiGcrNcY7vWylKgD/cc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dmtngCfFdRoDkacCzP7SpW/UdO4a/TYuJO4lU6soWcrsyV/84nN4W4QwAMHBzA0qYVBv2Vv1lhPdaS+q7AvGcegp56owCl1q+uL4wtLdu35KC38K0BqR+olck3Cnuxgj8bksfCBs5mgytFOg01ZcHjVygc1pbuUCM95HJ4bhvB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wpz30O2P; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wpz30O2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781009009; x=1812545009;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aOnTnPmhvjFGhm9/lhHKd3JmLiGcrNcY7vWylKgD/cc=;
  b=Wpz30O2Ph95R564TRPSqBx0WRnUNmPfoygk299+hDve6U3D/sV4CDqLx
   Zqz8rYbQzjxjq3FQwvI/TuHLC734r9gQk1bVGPP2hTSoKpoyq3bFN7pgB
   4fe3LgJyG9H8VG4FO2OsYWZDX7MmmGDi+hNj/ZA1KkK/8EnhHrs9M2SwQ
   TIEt5XnGBf7XlW0bcspieE7WqxsweXdHeqL5RGIrwA89vMRushkCWDQtD
   9GOguHMVbx1SiKimzJQY+cQNEFtB58ZOau83nkYzZyvu6ikRoPRI+zmDZ
   w+GTUgqAkEuhW2zcFAkgBJYfdpVnfJh2ijZPNAZm8gcZyr16GpWs2N2gw
   w==;
X-CSE-ConnectionGUID: H50lAh8NRdq0W7DN4A+5tg==
X-CSE-MsgGUID: VK4UDw2RQviFIKlcy3z0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81745445"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81745445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 05:43:28 -0700
X-CSE-ConnectionGUID: cqugTf4WT9qtVmIEnK2syQ==
X-CSE-MsgGUID: AwNIMU8DS8WyTP+tayAYOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="249779749"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 05:43:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 05:43:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 05:43:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 05:43:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kP9z1fgUgrh+A1+FfM1H9Q+t8Xm6bk4WfIW8iXZ7bk0Bczn3t+Pl2gtDOao+viJFFZt/bsMe6ZkaKc5sXRIKlxWRzsnLpbvULLpyxWTpmeVn1h4g0CZf3YCGQ7ecEZCp8Fx+b4KorDLlqC/Srpkh9OZSwonXZB2vLsmT36Pmfzc5btHzUEfJaB6R5bBrEVtoEH82fF3UlK8urzWI9tQ9cJxcUuMS5yi716A9hLtMGlDm8xP8Qa+5fTRekm0AbGeBbWti3ch48uW1CDs4JA8a9UOB7XPSRDRcDzfrCoK4GNUA9qPXGAV81vLNnI00iGFka127t3jvqxnklXXsgno8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJl2hWHmZwlHxlqF8mfIegX2fSGCefqP0XAWszKC5k4=;
 b=XAxdv0IXuSkcIdxi6M1XRULliLgR5sSkc5W8bEnhKc9IBfX1kwlND/MJSfelSKA9ZIjfWKWkxXYGgVqZixOjAwFpE3myiXGOMDWcxTubba1+jHr6hzC78GxE2GUzwuKpVsEcHm8UC9HZvUbBfOqanmJ4s30mXxEtLpEZF8mxnwVSlDBpokCLauvHbwEqAYWIhDfXc0TeG8FXZgBZbrXVabT2xN/jL+wnq8GfJqQWvHi7mctDRUjURRtiTiqw34PY1Z3XlgUnfsNjKIARO++l0xYpXTi5SXTEOj8SBS59jACGi2erfqmACa/vnPGVG7GOHVUIL74EAPzmN01TVTVNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ5PPFE62D2CE76.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 12:43:21 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 12:43:15 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, "David
 Box" <david.e.box@linux.intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
Thread-Topic: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
Thread-Index: AQHc75l1qLeb1QL/KUCmNd1EE/QcOrYtKvAwgAZgUwCAATSBAIABU/6AgAAnAKA=
Date: Tue, 9 Jun 2026 12:43:15 +0000
Message-ID: <IA1PR11MB64182001D7718AC31D5421D4C11D2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260529183150.129744-1-david.e.box@linux.intel.com>
 <IA1PR11MB64184FD919A96888F580730CC1132@IA1PR11MB6418.namprd11.prod.outlook.com>
 <mvyzq3kislmjd2hd2nhdyphvnpz7ap5tu76sujaxprxp5rhnhx@34qt4rgvhe6n>
 <IA1PR11MB64182D9946206FC3E4A430C4C11C2@IA1PR11MB6418.namprd11.prod.outlook.com>
 <93ccf8d4-3091-2339-ab1e-7689776d893b@linux.intel.com>
In-Reply-To: <93ccf8d4-3091-2339-ab1e-7689776d893b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ5PPFE62D2CE76:EE_
x-ms-office365-filtering-correlation-id: ab346641-433d-492e-23e7-08dec624acd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|6133799003|18002099003|11063799006|38070700021|4143699003|56012099006|3023799007;
x-microsoft-antispam-message-info: smsWNfDhpSEXm2J3jpwrhi2H8vdfuTh0YtTYe0nBYXUWj0jPc+2r8shCZqUWC0z2vxS8yIP9PGx+4lmM34ivPJOP0UdnnXskq8BE+rtKcKc+js/QjCU+LJeFwPfcBM2zsl3tIP5IWFwNJ/cmXgMA41/+0CSjYrNs+2q9sjgSG0ZsHX29kPfXvrq/a7JtkY2BK4AqNsirC39hXTZhhs1PdT0HLn3cP6PMwfKXdpGjsFUki8jZuxnXSDo/wcrKGiIuXYMT7Hclm4b/VtASu2EJY7+fuVTksTP/8b+EP1AzHUfkUJZ8JiF8FR9Bd6S/AIEx6fGQsWEI0BlHTxcZSBajXLdqKD0zzjNah6llo+7M+GwIJj5MRZAE+/KT4uhItZKj+pgP9ndnXl863zPW6mGnJLm9Nn+UmPJzkVVIAHYBo8vI6etsc9ZrFFzGoDG8DmjimMfBjqP5sIleiKq99Rryf1mZowsyaha+hduUh3jaZ/0vWt1n3JppBGeO5LLkSIywa4Qzr37NJ0/WD/oUqYvM3++O2nY74S+ZXkwq1g5RnWP/eav66FgN2J95o5p9e+u41A9kprga89/0W+lQHn+CF/xyIHRgn5zqWoieGJxD4QYz2FYARdZflUT1JiZUj8oExSC+vQFFAWgnEqSTBpLdSWIgTt3y93sePg27+br/UAgtu5su3nf94bueSKQv52+9oXK7P/q5Rt3awEh/QTWIHTEDyXDyLmszKyCVhCJQsGRmkeRsYq6SgFiPYEMsPDm6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(6133799003)(18002099003)(11063799006)(38070700021)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HIBSWVVYJnYf8dXTwQzaa7Vgz24P2sRjb4/PoQ3D5lBILDAbmk5TTFIHFY?=
 =?iso-8859-1?Q?UKUnxXsTl84R3KSt7S5s2sPj37A75uWldrs2VGzXzLy4lLvBmr99tnKJD9?=
 =?iso-8859-1?Q?a/251lVwOk8aby3kk8teKouwu5XOppq2QYlyxmWSZsIaTaVSOjQIeb7mH4?=
 =?iso-8859-1?Q?vaK74cX/Pqqv+RYSuW6/JZ7SqvSbEb/093SmMiOkTzdDXTtCs60DzzJx8b?=
 =?iso-8859-1?Q?mzfqwvbLjYAKP0fnTT7bNBt068rJwQD/IsKx5Qt6spBEbzPrUm4chXu5iD?=
 =?iso-8859-1?Q?QtiExBwGSehc6ovVEKvP27o2hVNZ4TnkCO4XRn/UQF7CWdfw6a7nKLv2Ge?=
 =?iso-8859-1?Q?tCYGaEaQeuaqQyT1tmFD8XdbcK8EF8CckDVwLafMyuhnM4XQ9reMRBQH+q?=
 =?iso-8859-1?Q?Iy6Bf6qD5duoADhXsThqn4mnMWLohOxwgWri2E/tycVcnJDmLJTsubxK71?=
 =?iso-8859-1?Q?+bVifSa0ADCrJ16/cmnqeAgSF792VIzwo+xrJDmt5cgzCK2ZCSvUrVGcHe?=
 =?iso-8859-1?Q?qp0DihEFjrGQmMafvnqKL8ECDVlSIYqpKSPiogk3qbODonM+N1Mk1bI2/o?=
 =?iso-8859-1?Q?8qbhimlKvZ3nBw2Jap20n64ooRdfqh/t0OG0CBQNcIIhXYhmJ/qh7600Tc?=
 =?iso-8859-1?Q?mQAkpRJogsE/4el9o7BW6uTkAcNJsYUvTq+rvNT3EdxiTtsLPqb0FdXakv?=
 =?iso-8859-1?Q?iqA0AhPXWPPdbv4xvpLTikXdaYNhkdWUpT45QpBIJFr/hFiPF1Ui259MoV?=
 =?iso-8859-1?Q?V6Ztoy5u5YDgtYjPFLgtxYa7ZYQxs98Zw6Yiu03HMj3oVC1PU9i+rc0cTG?=
 =?iso-8859-1?Q?A53OTvfAHa892HJj89HSCEeD2SP8aB0CdcTtcXIi3MQSa5akaxIRpVXX83?=
 =?iso-8859-1?Q?djZrQ7oc5Rejx1ZiAgW5UzmKo8C50/Z5voP03hwktrIgzyr7zGfsM2nMye?=
 =?iso-8859-1?Q?tqZznKUwec0BrFHeTwUAfz5ZpGFTvzIPLBUQQ95CwYhKsnTKGWeviAwG39?=
 =?iso-8859-1?Q?MOFBusvvCHxemxHdtnQIM0QFOMolg1LSvRpbRZV63fAm9/dxUwRvO8Rber?=
 =?iso-8859-1?Q?k+hjSiYTNgfZZ+jUSGr7wzPp9qjWWvkhT2CD/JrBaPFnHqLMzo9t3nV8Sl?=
 =?iso-8859-1?Q?gQn7inag0c6Q3QV9z7V/GNMd5rh/wyIKF/SVNaEMNCXLU3YQUXzpZzj+R1?=
 =?iso-8859-1?Q?6gQMdhebikPjlgykjIz8kZfAfr5nYe5JiBt8saAImB9FOjU5yw32ZKGN9I?=
 =?iso-8859-1?Q?rr4mZUpKIQRC2Qyc4jRZUmC4gfooTkvgocqWGeGn1PyFPojFXCC9CLMgEb?=
 =?iso-8859-1?Q?LvhiaJmvynYfdsjxxAiv83qM1fpEm4sQqGiOwTBk0LQFyVK3MA/XL6I9h0?=
 =?iso-8859-1?Q?x/mZPrTOXNK8fMv1IizNnfHUktjvVst0dVXfINU/y4VDzB4FyajvxErR3u?=
 =?iso-8859-1?Q?sYfffEktI/QBU/lnGE9D/jMyZifPonU/bTAYi8uqFrCXv5hsSEB5R0v0pc?=
 =?iso-8859-1?Q?4zbAFRRRCHOmJcB/Vd3U6TViMJ4SBQkopWpLtG4jCIsAT1/EBe2mdmarYQ?=
 =?iso-8859-1?Q?zjMKZqf0sawjnlsJPCU3cUGlViV6GhcedOScAT6l7sB5c8I6FR08GFZrTE?=
 =?iso-8859-1?Q?sm+GBT9H8DGltw73tvA0xH0HtmRRDQfxVmicyQCGxktJBLcPC20485Q2WC?=
 =?iso-8859-1?Q?TyxH+GIjaxkG5U2aWbd6PapJ1Vtah8gZEH5Jyo8sHd+SP0X1K92H8Jc3jE?=
 =?iso-8859-1?Q?9FjNMRLCrJoJTgVE1oFtGSAUMePW7ywp6sZdc5gsvK/Wif9Ax5Nk5RkawB?=
 =?iso-8859-1?Q?gPlcpwxEZw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: S2p/8rrNFJKNm2gS1Q+J+EiQzE3PC9sAtZ8neUf6WlVJxK/qkz9cV/Mxth4IksIUoW8W/kqo7vhhXAV3tPbXMT/DF41w1UHGY6HMiYLjduovPvsSWFergQfo326juJT3szcrENyRQDD1oFovoUSXLz4v6jujEPMyGUIxu4R/oYebBELsp2HawpQ5ONorMJibSi5iEsOsJ6Bj+WmhKiu6V+OP4drkZmtlXm5E1OFAm5ff/SW+UD78sHXBuB0cRFAMBTyUzAPZwQ56dqK3+uxPaMHABrsrZMc9s/Y+eeGFvMmnJ2fl05O2354/VRaRC3o/AvhAx9pvEIGpUu51SwRTwQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab346641-433d-492e-23e7-08dec624acd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 12:43:15.3381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6SZlim3Was5A1mwUD/12hGfDVoAC8QE7/fSgLhRIq51dYfWzXnjQm/YXpc9z+oJDfjgVN2vWcZzLaeOATi54zHW2EDNxo/TTx6rjEvBA+Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE62D2CE76
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Tuesday, June 9, 2026 6:20 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>; David Box
><david.e.box@linux.intel.com>
>Cc: Brost, Matthew <matthew.brost@intel.com>;
>thomas.hellstrom@linux.intel.com; intel-xe@lists.freedesktop.org; linux-
>kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>Subject: RE: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for hea=
der
>walk
>
>On Mon, 8 Jun 2026, Ruhl, Michael J wrote:
>
>> >-----Original Message-----
>> >From: David Box <david.e.box@linux.intel.com>
>> >Sent: Sunday, June 7, 2026 3:39 PM
>> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> >Cc: ilpo.jarvinen@linux.intel.com; Brost, Matthew
>> ><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com; intel-
>> >xe@lists.freedesktop.org; linux-kernel@vger.kernel.org; platform-driver=
-
>> >x86@vger.kernel.org
>> >Subject: Re: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for
>header
>> >walk
>> >
>> >On Wed, Jun 03, 2026 at 06:32:32PM +0000, Ruhl, Michael J wrote:
>> >> >-----Original Message-----
>> >> >From: David E. Box <david.e.box@linux.intel.com>
>> >> >Sent: Friday, May 29, 2026 2:32 PM
>> >> >To: ilpo.jarvinen@linux.intel.com; Ruhl, Michael J
>> ><michael.j.ruhl@intel.com>;
>> >> >david.e.box@linux.intel.com
>> >> >Cc: Brost, Matthew <matthew.brost@intel.com>;
>> >> >thomas.hellstrom@linux.intel.com; intel-xe@lists.freedesktop.org; li=
nux-
>> >> >kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>> >> >Subject: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for h=
eader
>> >walk
>> >> >
>> >> >The base_addr refactor changed intel_vsec_walk_header() to pass
>> >> >info->base_addr as the discovery-table base address. For the PCI VSE=
C
>> >> >driver this info comes from driver_data, but exported callers may pr=
ovide
>> >> >their own static headers and leave base_addr unset.
>> >> >
>> >> >For xe, this made the discovery-table base address zero instead of t=
he
>BAR
>> >> >selected by header->tbir, preventing PMT endpoints from being create=
d.
>> >> >
>> >> >Restore the previous behavior for the header-walk path by falling ba=
ck to
>> >> >pci_resource_start(pdev, header->tbir) when base_addr is not specifi=
ed.
>> >> >Keep explicit base_addr override behavior unchanged.
>> >> >
>> >> >This preserves the refactor structure while fixing the functional
>> >> >regression in manual-header users.
>> >> >
>> >> >Fixes: 904b333fc51c ("platform/x86/intel/vsec: Refactor base_addr
>> >handling")
>> >> >Assisted-by: Claude:claude-sonnet-4-6
>> >> >Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> >> >---
>> >> > drivers/platform/x86/intel/vsec.c | 17 ++++++++++++++++-
>> >> > 1 file changed, 16 insertions(+), 1 deletion(-)
>> >> >
>> >> >diff --git a/drivers/platform/x86/intel/vsec.c
>> >> >b/drivers/platform/x86/intel/vsec.c
>> >> >index 1657834fd275..3c6d8a1928c0 100644
>> >> >--- a/drivers/platform/x86/intel/vsec.c
>> >> >+++ b/drivers/platform/x86/intel/vsec.c
>> >> >@@ -482,10 +482,25 @@ static int intel_vsec_walk_header(struct devic=
e
>> >> >*dev,
>> >> > 				  const struct intel_vsec_platform_info *info)
>> >> > {
>> >> > 	struct intel_vsec_header **header =3D info->headers;
>> >> >+	u64 base_addr;
>> >> > 	int ret;
>> >> >
>> >> > 	for ( ; *header; header++) {
>> >> >-		ret =3D intel_vsec_register_device(dev, *header, info, info-
>> >>base_addr);
>> >> >+		if (info->base_addr) {
>> >> >+			base_addr =3D info->base_addr;
>> >> >+		} else {
>> >> >+			struct pci_dev *pdev;
>> >> >+
>> >> >+			if (!dev_is_pci(dev)) {
>> >> >+				dev_err(dev, "non-PCI device without a base
>> >address\n");
>> >> >+				return -EINVAL;
>> >> >+			}
>> >> >+
>> >> >+			pdev =3D to_pci_dev(dev);
>> >> >+			base_addr =3D pci_resource_start(pdev, (*header)->tbir);
>> >>
>> >> Alternate:
>> >>
>> >> if (!info->base_addr) {
>> >> 	struct pci_dev *pdev;
>> >>
>> >> 	if (!dev_is_pci(dev)) {
>> >> 		dev_err(dev, "non-PCI device without a base address\n");
>> >> 		return -EINVAL;
>> >> 	}
>> >>
>> >> 	pdev =3D to_pci_dev(dev);
>> >> 	info->base_addr =3D pci_resource_start(pdev, (*header)->tbir);}
>> >> }
>> >
>> >Thanks. I'll do this in the next patch.
>>
>> Looking at one of your follow-on patches, I see that you are setting the=
 info to
>const...
>>
>> So setting the base_addr here, might not be "correct"?
>>
>> M
>>
>> >>
>> >> Would it make sense to require the caller to fill this in?
>> >>
>> >> i.e. if (!info->base_addr) return EINVAL?
>> >>
>> >> Change of behavior, but forcing the caller to provide the right info =
seems
>> >reasonable.
>> >
>> >Agreed. But that would be separate from this fixup patch.
>> >
>> >>
>> >> Either way, this looks reasonable to me.
>> >>
>> >> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>Hi David,
>
>Could you please enlighten me if I should expect an update to this patch
>or not?
>
>While understanding it doesn't look critical for this patch, I'm unsure
>what follow-up patches you folks are talking about?

Hi Ilpo and David,

I was referring to:

commit 9577c74c96f88d807d1ba005adbf5952e7127e55
Author: David E. Box <david.e.box@linux.intel.com>
Date:   Thu Mar 12 18:51:41 2026 -0700

    platform/x86/intel/vsec: Make driver_data info const

This was part of the patch set that had introduced this issue (broken base_=
addr).
The *info struct is set as const, so my suggestion above is not correct.

Sorry for the confusion.

M

>--
> i.

