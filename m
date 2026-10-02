Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091CC388E59;
	Fri,  2 Oct 2026 20:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974769; cv=fail; b=BdU17XhbNJn9njOFQN58IDIztH0Yhj4J4gIm95AzalAZwzYyFwKYmcNmZGIQQ4Ikf3DmGZeiCDHe1CNo9Jo0jaThz1n7y3jWSAIGnTcoMjz9KXGFRmPELjmM7G+N1Ud+0bnidMkA/EMdiuhywJUobSnU9kE4ZvlVaZKxhV6DN8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974769; c=relaxed/simple;
	bh=8Mxk2Hp9d3oD7b201//NWuizb9SjovkVROIWsnC7hAY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l/5gkJrtV1PpZLyhuKBOIoqn8jbhroS6ZRF9xNFtcDHxGiC1uwgGjGnyf8UGukmeFOWcPYsn1jE+Y3I5w0wuXVPqJar0MUExwaGo23OJyflCRCPT82TSvpWmwv17KLo9AFJTic78m+FSXZNwQiwr0rbDri6xW5Drht/GC8sVbNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7Tx/Q4d; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7Tx/Q4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790974768; x=1822510768;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8Mxk2Hp9d3oD7b201//NWuizb9SjovkVROIWsnC7hAY=;
  b=j7Tx/Q4dK3vDRTk27n3lgGrrlws62sc84p0H++T1YsBhfS+h0p1Rq+0D
   TOZFBgxpxRGSXjUEIakoZnr3uFPScgCEhWJWteu7MRDzEWW28MgwSSrIh
   hwJKocDTDc9kpLdklrm/79Gb+SJDHdSrBqbtNhil2Nhof8TmkoglXf/EB
   zuV8U6VOPDyx6thAdKQBUCK11vcQLwof9nU0ikUPBhmrgxVVAUXhz9+Lk
   gXsJViQ/woGVzzy+qIIM4EpFRE8E7BMnjl9m21xrfZJMwMgfuXqL9pQTa
   HDkuIbmJFUCUjMZNoP1Dj7typ05Ps7bOsAyWXelI3cRZAyBW1IjhSRwNX
   w==;
X-CSE-ConnectionGUID: +UgaDly2Rx6/klf/uCE5fg==
X-CSE-MsgGUID: IL7QAGSsRsO4VCp8O7GRpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90776134"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90776134"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 13:59:28 -0700
X-CSE-ConnectionGUID: Mv4XJiBNQ5GCahQegFGBkQ==
X-CSE-MsgGUID: vN8klPsWR8mld/bsQcKPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="276391729"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 13:59:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 13:59:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 13:59:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 13:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOBG4Fsf6PEqVzgvEHTWnSN9tYsQjRXiGiamxqn3h+6Mv9JelXnR/jyOKaDOK3o1DK33bYeU2MO3CbtbXqU7yByQiBXVHm1TrUmAJQDPENL2FvjhiVicUhRUj5FfoIUre3MLJ3rPvN5xu1JqRk1sxzZcnLMzm8XKhFNuNfPWe7stc5L62ICInb8zWM1TE9f84/E2wfvBeRjCSuapeoUnzy+jFUDjJ3QBh3EeKmEad4/NJIbxovNV9YjB6Ekr4uMQEFeRnt0GFLUPbGGqB8Esf2ZsO35Lk6diRqRQ9B0z4rRbGaKhE6VCpQAo5eVkHfHXET/+3AW5mMEtUiDZPpbSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hROTI+1qXAuTMjaN4tePjyVyPeI4F8QwuqbNq09xqhw=;
 b=SOcw4v8ti/pMOGEfQJwPX/OpnQGRpfUgcwm6DelpUqAUmp0h7aBkR4ULAgYr0xMthJRr7li/ezjaOEMpHmy+UiZt/AzBJGg3+bwP7b3419YIyZUjJeNLBuNfkHKzHT+MD3CNliK/TzTfn2LwHJg2o/d5DzE5Vo3Bowvw61N7LFfLaueiR9W9om11dIcQoJhnk8N2yP+n+9HaiaEWbCBom4vhb2jTh7NKQTKUYGhhaWEI5+KfI+e3xSsjKLtE0OzOx+M72NBDK8YBvcjaDbVMMyM8vXX8lIuvfq1g5Vk7JTcyEfJMjtVGdDWQm1qXgR7fKC9Ezz30E9T8nL8eNz9NaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS0PR11MB7213.namprd11.prod.outlook.com
 (2603:10b6:8:132::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 20:59:23 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 20:59:23 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Siddiqui, Ayaz A"
	<ayaz.siddiqui@intel.com>, "Muqthyar Ahmed, Syed Abdul"
	<syed.abdul.muqthyar.ahmed@intel.com>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>
Subject: RE: [PATCH 3/3] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
Thread-Topic: [PATCH 3/3] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
Thread-Index: AQHdUfDPMe0LEpnoZkSCP+cQX1lEH7bqu3uA
Date: Fri, 2 Oct 2026 20:59:23 +0000
Message-ID: <CH3PR11MB046149893CCB03A3C9B522B91DC1892@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261001220351.1592138-1-david.e.box@linux.intel.com>
 <20261001220351.1592138-4-david.e.box@linux.intel.com>
In-Reply-To: <20261001220351.1592138-4-david.e.box@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS0PR11MB7213:EE_
x-ms-office365-filtering-correlation-id: 80062e18-1c90-4935-bcbb-08df20c80995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|921020|4143699003|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 21updZztm/BfzphK9EtPq7gg+8/MDcNR8ZgyIkqaVXqtM7RDlbmZ7ZaKrW+44H+PhXiyTlr1fNhL4RT03oCr4KxFI1F0pnnEU1YDLmV361SQkyQmQvv+I2qAZKu71+eRVsNUgC4LW2Lk6H8/zJY7/AgrhoncyToLjkDGDlV1KZ3QhKt9ruvur0nH64mOvp1ulnh6RyKjwCwL+PaTpN7h8UcbCE04zdmsSo4cO3Im3/tNesDarPXUdppe50wEcE1ptXCsBzO0+Y5tse9HSRsx34DiVmZ5c4nBIXAEockMXTytbZ4ADG9+OE66Ymf8Ct9WWK6oqas4NaQUbcybPPJ2i7NLJyjQ+hsqo2Hn4nrUti6szHUv8ida/rgi2JPadZbmmNYMFjKyFr9uk34I4RfLanX5z3PpJsgwnO09jwKcrL7R3gnrDKtTWQzjv0TRrTUUVoxeQRPoslfn6FYBGuqC8cUhh4Pk9PEuxNdNF9scGlCjiv/nSTIis+Vyi3LAJBdzZUgxxBNxoXUGQ45qBzxTm/yP0WAaxthqSJyniSwNu3zyMJLbpqI4jSXjbwmGHof9WzPu8QpsWshsXruLQBNptRa58Yk5G+DuSLQr6RGTqopHqepTl03LdpgB3Gq6fKb8FD+xZeME9yt8jTv/eL6nSnjorslNmt2NJ6Q2h+aMliI8cBswyZtGzmW1vWyaiJLb9mEOaE/aM7i6ZVHnlHaGDzXd0KoRGz+HECWfuxb2MsZo+3M1CdB39QELRceCcTFp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(921020)(4143699003)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sIE8IMByq2IOfi2vtJTG+uT1opCaEh4TbHol8wolXi3o1R18ZBUYXwp2+z0j?=
 =?us-ascii?Q?7EPTZyFxXI4m5NoV6nQTUcZ1996l80GM8eMqi5P5WBNMDsowTf0t88NPfWB1?=
 =?us-ascii?Q?/WjtpdB95dWlXCxj1vd32yEdgRcNF0nUwLPim6Q1ARnDn7zk0U1z4o1TwC22?=
 =?us-ascii?Q?Xc4g0vCPzQLvojPX/AwVx13rIVBoZWOmSRR1B9VoAHsyPwaVu6WVjSRnzE2A?=
 =?us-ascii?Q?J1k6qU876l87D8azTo4qFxtN0QUsBtboWxYSXGSMFsY1bYb/1u+CAnpoYW9k?=
 =?us-ascii?Q?J5ziWGgA3zB2pCYHuUfrU8ISKU1s1mL0XrATHR7upnu0WdA29x7Y9CcuXHCU?=
 =?us-ascii?Q?J1cXLv2rND51kroNgMC9kW6wu8xv6sA5liNQnDACqWVysk5qPK1vqFS6o0vb?=
 =?us-ascii?Q?sjQW/xInn4XEbkQVXgVDb9GyUzGlonLEpA4cAGUarK3Q0rstn0i5GiR6FHby?=
 =?us-ascii?Q?hRUK9pP5Uq2831EztRc1sU+eatQRmXg9VmHpnTXGR1/q/LzQHL/svZqs9qZp?=
 =?us-ascii?Q?bg1mbxfMouFTFyvdEQ3VpXsUzwAoxrp4neDw/6763Q34RSSID+I9MP5NDhF9?=
 =?us-ascii?Q?XkOvyTA+YNXZlmSgZmcA6obnzNVf8BRppUOdOF6B/XFze9qsB9iEm/6cRx7P?=
 =?us-ascii?Q?1PWpIDEqBZAKzIzBULr/92aEApJBKR+0mMdq7UdhVmjZhGnGmJ+lmXtFMxzy?=
 =?us-ascii?Q?puDDj4tOU7s/mncJxIqUD0B0jGrX9zC5bmOg89d7alZiZJGskD3b8Rxhbi2E?=
 =?us-ascii?Q?zc4OnL12U9lAKul0XpmjjlFxgeLyRpoZbqqQRlH+kOlC1O6Is8JMPoJ56S/V?=
 =?us-ascii?Q?sYbLBBRHz6pJm0xt5qbKzuEfAofX+WWY8ix0l8Veb6yVur/VrntfC3y1v4Di?=
 =?us-ascii?Q?x5b+Fm88wbKv5G7a9FD+E64tzzQvewJj8Kwy7yNlS46joMZvgfnDO9nspn8Q?=
 =?us-ascii?Q?xc5Pl3Rt0wTdYpdurUADG1rNv8sgFnU5GeKh/ZD2k/qj6JPHcuoByxi0V43F?=
 =?us-ascii?Q?2dyEokKJ0xf/gcIk8ws129k5YJtHOupZnbgxGI44guG7f0zWYDucmoL6HMUh?=
 =?us-ascii?Q?Y9bLK/s5gkefcjvytdVBlKtuwwQN+VSwoYkNJBNdKsUN30RVUbapgGMJrN0m?=
 =?us-ascii?Q?hXoY2BwruUaRYwygq7VJUqhseR09ztzKYm28IyliWSWj4Ojcnp1bb2c682Ag?=
 =?us-ascii?Q?2DPwPUvh3ANQghuqgNASoFjNnsxFJiCCK3XmOAcos8WFCWOxqHOHnBMQnzDz?=
 =?us-ascii?Q?1IH4qH80fq68jQI2sSyz03qee2/52gG1r5jK1SHHRpj4UhbnWrqseCmsxEFs?=
 =?us-ascii?Q?til1p1/iDteIiVLbDCfiXUFaFprkPJ4aTt1tonogkifvETqO5HmuzEAcj7cj?=
 =?us-ascii?Q?oov/dAb+VTJ9Wp+fYtc+NlrHk3cUFHEPw9A4U9KTqVfJxuX0UGDGp1dP1Dc6?=
 =?us-ascii?Q?KdY2tHz27+y1+8Qj3+5mE8BJMfdMRoPkoBEKj8kljjLZu64IKFmrmBLB04u2?=
 =?us-ascii?Q?Z98eQzrXxWZSuEieAfp9gD+2E98IzT6+RN46q6N5NHpqPYC4m5RzAtB9pED4?=
 =?us-ascii?Q?lBioog3mJaTLvOe8dqkJfKjtWrl1/c6xszy5wS+36IYwynDIT4KfRMTiSbOf?=
 =?us-ascii?Q?tCCNgTcZBcxcL/WOsEobnZNCbcVClRAlXaMUCPBRxXYVtjpzaT0bAHJYrLOm?=
 =?us-ascii?Q?zEQoPw9PXvkH/QzC8CIO4epI2zN2FsFgJt/af0zVx3XxJMSTyozPr7bY4v9y?=
 =?us-ascii?Q?9Uwhpihqwg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RIpjGnicbK04tkq0LSBWgu3UEtsWds9pOvSVUHtdvJ8/iWcCkwk/2HH80tanRhKwTaxpn1JwNSGcncBkLXP/mO/Lb6IkkBsHKXYYII2hbPfVPC/31wuR+xFK7rwb4DMqZqXRR6o279BldoT9gciL7rxti8t2ge3mCZ10tFhNYAZcv+4vTybZhc0nkK/Sw1dkvU7SmfChjv6W3la0sSf+SxRXyfBtnYCEwhb1+GyMHDsbfm1Ll7X1zZgtixYPJsAKp8bwSivNyLntpMFSdKLH2KwtYot4TqXTKkAnOWf47HgeJhd4+qVRPWuo/ciwsh6YOo6QrRkcjytBBaJRQYKlzA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80062e18-1c90-4935-bcbb-08df20c80995
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 20:59:23.5975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0Wm7jhpM1PllrSo2vgA1mSb2Ax98wR8TiLb5+BTLHbl/Eu+X6/tT4i5Frd5Qw3HBQNgC19zPQWBoeBQmbnbxFc0ZqxuZQFoDRDrqq6sI8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7213
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: David E. Box <david.e.box@linux.intel.com>
>Sent: Thursday, October 1, 2026 6:04 PM
>To: ilpo.jarvinen@linux.intel.com; david.e.box@linux.intel.com; linux-
>kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Vivi, Rodrigo
><rodrigo.vivi@intel.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>; Sidd=
iqui,
>Ayaz A <ayaz.siddiqui@intel.com>; Muqthyar Ahmed, Syed Abdul
><syed.abdul.muqthyar.ahmed@intel.com>; intel-xe@lists.freedesktop.org;
>hansg@kernel.org
>Subject: [PATCH 3/3] platform/x86/intel/pmt: Notify userspace when crashlo=
gs
>complete
>A crashlog may already be complete when the driver binds, or it may
>complete asynchronously after userspace requests a manual trigger.
>Userspace otherwise has to poll to discover that data is ready.
>
>Emit a KOBJ_CHANGE uevent on the per-instance crashlog device when a
>completed log is found at probe. After a manual trigger, poll the
>completion bit at 100 ms intervals for up to 5 seconds and emit the same
>event when capture completes. The event carries two environment
>variables:
>
>  INTEL_PMT_CRASHLOG_EVENT=3DPRESENT
>  INTEL_PMT_CRASHLOG_COMPLETE=3D1
>
>Initialize the work items before the device's sysfs attributes are
>exposed, and disable and drain them during removal.
>
>Document the new uevent in the sysfs-class-intel_pmt ABI file.
>
>Assisted-by: LLM
>Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>---
> .../ABI/testing/sysfs-class-intel_pmt         | 14 ++++
> drivers/platform/x86/intel/pmt/crashlog.c     | 84 ++++++++++++++++++-
> 2 files changed, 95 insertions(+), 3 deletions(-)
>
>diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt
>b/Documentation/ABI/testing/sysfs-class-intel_pmt
>index ed4c886a21b1..c0b0d123afdf 100644
>--- a/Documentation/ABI/testing/sysfs-class-intel_pmt
>+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt
>@@ -66,6 +66,20 @@ Description:
> 		can be determined from an XML file of specified GUID for the
> 		parent device.
>
>+What:		/sys/class/intel_pmt/crashlog<x>
>+Date:		October 2026
>+KernelVersion:	7.4
>+Contact:	David Box <david.e.box@linux.intel.com>
>+Description:
>+		When a crashlog device is probed with a completed crashlog
>+		already present, or a manual trigger completes, the driver emits
>+		a KOBJ_CHANGE uevent for that crashlog<x> device.
>+
>+		The following uevent environment variables are added:
>+
>+		INTEL_PMT_CRASHLOG_EVENT=3DPRESENT
>+		INTEL_PMT_CRASHLOG_COMPLETE=3D1
>+
> What:		/sys/class/intel_pmt/crashlog<x>/crashlog
> Date:		October 2020
> KernelVersion:	5.10
>diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>index f936daf99e4d..21e8e2199bdc 100644
>--- a/drivers/platform/x86/intel/pmt/crashlog.c
>+++ b/drivers/platform/x86/intel/pmt/crashlog.c
>@@ -12,12 +12,14 @@
> #include <linux/cleanup.h>
> #include <linux/intel_vsec.h>
> #include <linux/kernel.h>
>+#include <linux/kobject.h>
> #include <linux/module.h>
> #include <linux/mutex.h>
> #include <linux/pci.h>
> #include <linux/slab.h>
> #include <linux/uaccess.h>
> #include <linux/overflow.h>
>+#include <linux/workqueue.h>
>
> #include "class.h"
>
>@@ -113,6 +115,9 @@ struct crashlog_entry {
> 	struct intel_pmt_entry		entry;
> 	struct mutex			control_mutex;
> 	const struct crashlog_info	*info;
>+	struct work_struct		uevent_work;
>+	struct delayed_work		uevent_poll_work;
>+	u8				uevent_poll_tries;
> };
>
> struct pmt_crashlog_priv {
>@@ -120,6 +125,9 @@ struct pmt_crashlog_priv {
> 	struct crashlog_entry	entry[];
> };
>
>+#define PMT_CRASHLOG_UEVENT_POLL_MS		100
>+#define PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES	50
>+
> /*
>  * I/O
>  */
>@@ -227,6 +235,47 @@ static void pmt_crashlog_set_rearm(struct
>crashlog_entry *crashlog)
> 	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
> }
>
>+static void pmt_crashlog_uevent_fn(struct work_struct *work)
>+{
>+	struct crashlog_entry *crashlog =3D
>+		container_of(work, struct crashlog_entry, uevent_work);
>+	char *envp[] =3D {
>+		"INTEL_PMT_CRASHLOG_EVENT=3DPRESENT",
>+		"INTEL_PMT_CRASHLOG_COMPLETE=3D1",
>+		NULL,
>+	};
>+
>+	if (crashlog->entry.kobj)
>+		kobject_uevent_env(crashlog->entry.kobj, KOBJ_CHANGE,
>envp);
>+}
>+
>+static void pmt_crashlog_uevent_poll_fn(struct work_struct *work)
>+{
>+	struct crashlog_entry *crashlog =3D
>+		container_of(to_delayed_work(work), struct crashlog_entry,
>+			     uevent_poll_work);
>+	guard(mutex)(&crashlog->control_mutex);
>+
>+	/* A newer trigger_store() re-armed us; that cycle owns the notification
>*/
>+	if (delayed_work_pending(&crashlog->uevent_poll_work))
>+		return;
>+
>+	if (pmt_crashlog_complete(crashlog)) {
>+		schedule_work(&crashlog->uevent_work);
>+		return;
>+	}
>+
>+	if (++crashlog->uevent_poll_tries <
>PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES)
>+		schedule_delayed_work(&crashlog->uevent_poll_work,
>+
>msecs_to_jiffies(PMT_CRASHLOG_UEVENT_POLL_MS));
>+}
>+
>+static void pmt_crashlog_notify_pending(struct crashlog_entry *crashlog)
>+{
>+	if (pmt_crashlog_complete(crashlog))
>+		schedule_work(&crashlog->uevent_work);

This looks good to me.  The polling loop on the manual trigger is a very ni=
ce to have.

Note: my patch set for CRI support changes most of the predicate functions =
to return 0 on success
and the state in a parameter...

Not sure on how this should be handled?

Otherwise:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>+}
>+
> /*
>  * sysfs
>  */
>@@ -423,7 +472,19 @@ trigger_store(struct device *dev, struct
>device_attribute *attr,
> 	if (pmt_crashlog_complete(crashlog))
> 		return -EEXIST;
>
>+	/*
>+	 * Only now are we actually starting a fresh crash: any stale poll
>+	 * cycle left over from a prior trigger can be dropped safely, since
>+	 * pmt_crashlog_complete() above proved it carried no unresolved
>+	 * completion. Non-sync: uevent_poll_fn() takes this same mutex, so
>+	 * cancel_delayed_work_sync() here could deadlock against it.
>+	 */
>+	cancel_delayed_work(&crashlog->uevent_poll_work);
>+
> 	pmt_crashlog_set_execute(crashlog);
>+	crashlog->uevent_poll_tries =3D 0;
>+	schedule_delayed_work(&crashlog->uevent_poll_work,
>+
>msecs_to_jiffies(PMT_CRASHLOG_UEVENT_POLL_MS));
>
> 	return count;
> }
>@@ -551,6 +612,9 @@ static void pmt_crashlog_remove(struct
>auxiliary_device *auxdev)
> 	for (i =3D 0; i < priv->num_entries; i++) {
> 		struct crashlog_entry *crashlog =3D &priv->entry[i];
>
>+		/* Disable, not cancel: a racing trigger_store() must not re-arm
>*/
>+		disable_delayed_work_sync(&crashlog->uevent_poll_work);
>+		disable_work_sync(&crashlog->uevent_work);
> 		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
> 		mutex_destroy(&crashlog->control_mutex);
> 	}
>@@ -572,15 +636,29 @@ static int pmt_crashlog_probe(struct
>auxiliary_device *auxdev,
> 	auxiliary_set_drvdata(auxdev, priv);
>
> 	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
>-		struct intel_pmt_entry *entry =3D &priv->entry[priv-
>>num_entries].entry;
>+		struct crashlog_entry *crashlog =3D &priv->entry[priv-
>>num_entries];
>+		struct intel_pmt_entry *entry =3D &crashlog->entry;
>+
>+		/* init before dev_create() exposes trigger sysfs to userspace */
>+		INIT_WORK(&crashlog->uevent_work,
>pmt_crashlog_uevent_fn);
>+		INIT_DELAYED_WORK(&crashlog->uevent_poll_work,
>+				  pmt_crashlog_uevent_poll_fn);
>+		crashlog->uevent_poll_tries =3D 0;
>
> 		ret =3D intel_pmt_dev_create(entry, &pmt_crashlog_ns,
>intel_vsec_dev, i);
>-		if (ret < 0)
>+		if (ret < 0) {
>+			cancel_delayed_work_sync(&crashlog-
>>uevent_poll_work);
>+			cancel_work_sync(&crashlog->uevent_work);
> 			goto abort_probe;
>-		if (ret)
>+		}
>+		if (ret) {
>+			cancel_delayed_work_sync(&crashlog-
>>uevent_poll_work);
>+			cancel_work_sync(&crashlog->uevent_work);
> 			continue;
>+		}
>
> 		priv->num_entries++;
>+		pmt_crashlog_notify_pending(crashlog);
> 	}
>
> 	return 0;
>--
>2.43.0

