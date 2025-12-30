Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF122068D
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767076694; cv=fail; b=aTTlfwY0mv9UnoLTROSck8Z9vGBktKhPtpdYsQKlUVJMbBUxgT1intOhNOo/y20gRUUcMzowK1Ef48giFRTvRkRM7NP9Dssm41ET+9cF2gjSezPKV8+5ydlVieJT15Uifjn5dl34CaCKYtU5PF1lD6yz7eZvhInZvRu93mhNTL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767076694; c=relaxed/simple;
	bh=Ax+O/AzpZxiBb4iJxJhykvaht5SUrh0Tw9++qZt9L30=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jq5WRvSWdF21hnMmUCWD7KefYEQfVcgNlIZK2Z4t8vHQX8TCxF/50Nds5j/Mmv5IsNxjU7JZNh0J9CvMAL1xMv0gulfmOOIMtFdCUl0QZ5SgSTN4iK+UF3Y0IP6tZG0Xe/VZDpRapf8DD0UTEFc9ZZjlYIUzN9opgYD316QNThU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYXo+UCS; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYXo+UCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767076693; x=1798612693;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ax+O/AzpZxiBb4iJxJhykvaht5SUrh0Tw9++qZt9L30=;
  b=eYXo+UCSDchsanNFay0+xal+x+W99PPOQw26H++/DvaCUEpgdFG9KjaU
   7Z8QMVuUj2Oyy2cyFWuaVzDhxFtm1PgtkDpxXIZTtrRPNd6wu11ygciHh
   rWr59qTlrOJYf25wS7otSD1V9onN3NbKKU/vi3tD3lSD+zNfb3u+XbTRW
   oqIgt79AI6uUkoU3Hb6DmgsHK7zWVUPAaTcE9wrvUjCTaE4l1T09xa11k
   6GNrIP8Cu+pMOLGnz6GDoLtRsBSEEcZ2CqWpZjzeqyHm+UXPIR+2U8yNT
   XGn6bvtyfpEXEBdXNjuS0WcL8xC/1Lj5yXo7BHc781I4BjTBXsVECg66B
   A==;
X-CSE-ConnectionGUID: yF45bWcNTLGbp+6l0dPTKA==
X-CSE-MsgGUID: 3PQMqG+MRcqNf8aOATfGiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68644945"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68644945"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:38:12 -0800
X-CSE-ConnectionGUID: 89rhag8NR26Sv+DrhK15DQ==
X-CSE-MsgGUID: PFFqYVkTR12gqtuREIT6kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201156591"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:38:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 22:38:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 22:38:12 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 22:38:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3wgWZ8/BCE81REV5KjcyPoFPMHxPsrDvwd/byQasJQcAfhEnQOx6xzxCYNZZG+XTCNZu9qGR+2YgAzwjWe23WiwfZScRsW7VBdxooTCNmCTCVcgsAT3dlTFhdOCPgJMEzjr/fvxnQfVeAMIGWV/id1IP1Sq2t1eC9rMF01m5hg+rhDbj0AueU+on5v4NwGs32k4xfvPyAPEpPD8ORDWIjORFdBOfZdptPo1E+ymviCjtnEfCg6ycwy74s8sufQWrtw/sBDDC7bdjjJ9WEbY93RXdZoTfFIG1bF8ym4kFcpItSDLU9oqqfsLaPZ7E0A3T3V1XxdROKKK0Tm1PjNbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ax+O/AzpZxiBb4iJxJhykvaht5SUrh0Tw9++qZt9L30=;
 b=oa9FHhjUbzJwSfzUp9XvXq6MnD8eKKAF6NoBniwcWrSA7JZVGzxaueuGWYYtGrhmMVnMNoeRcDlwJ2+O6nmEbGw8VWCxPpvdZv8aSeG4Vd2c93rORBhOnx6UGx2oDC/rgNYiyxiVRQphRlOVVsvBPw6eRLM8fkc2XSNG9j5kPOtac6l1nslYBUBiBOtpl+TTbU9nUo7hhDE9xEVcnf3dbfMPRQ2OXzHU8KabNTqrOUmazpMpfE4mD1yFzjopMGi0sIDYXq+dTGJ5A7XzudZb3G0Z0Qf8tNZR6OUot3Nmpw8y3M+cnx8qEKmckXK23rJT3f4D7Evpql6j+HwG721XmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 by BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 06:38:10 +0000
Received: from LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308]) by LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308%6]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 06:38:10 +0000
From: "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86: intel_telemetry: Fix PCI device ref leak
Thread-Topic: [PATCH] platform/x86: intel_telemetry: Fix PCI device ref leak
Thread-Index: AQHceLGPsHktIIkFfkKelM8hsvm0e7U5vCFQ
Date: Tue, 30 Dec 2025 06:38:10 +0000
Message-ID: <LV3PR11MB8768F3385C0F75C41EB2A824F5BCA@LV3PR11MB8768.namprd11.prod.outlook.com>
References: <20251224044359.3919178-1-kaushlendra.kumar@intel.com>
 <5d8619cc-2272-c544-fceb-dc4d4223b769@linux.intel.com>
In-Reply-To: <5d8619cc-2272-c544-fceb-dc4d4223b769@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8768:EE_|BL1PR11MB5288:EE_
x-ms-office365-filtering-correlation-id: 72034f2f-099c-490f-3edf-08de476dffe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?2ZFQRpoUOKavKBlBH5/xViNUF+jCin7PbNr2P/EvSxADy7YBZOmwj1zUYp?=
 =?iso-8859-1?Q?tSpDrdij08yZ8eKZu0okJDY6SiKcubeQUrBPS99PaHoLrtYAp9UYJz++dM?=
 =?iso-8859-1?Q?HRHpPhX1tPO61pvQy/AKqeROPeO/BD1dMloVSrKVPFFGuJKEHyEGAWnCHT?=
 =?iso-8859-1?Q?AfHH1TS7AkKa1VFaBGhMOdatR/GPZVEVQ33athIfcBc7tR4k3U2X1pisvv?=
 =?iso-8859-1?Q?tYQB3qUFfMMhsVjS6uq92i8A1itKAAHJAlxZi5ubQ6VJ9HyJdyDTvV60rg?=
 =?iso-8859-1?Q?SmKIZlay2M3js5iI7GNCLeodkr6E1m/vgnRPWBzcaXJC4B0W6zYOFVEmLm?=
 =?iso-8859-1?Q?ou+b+mcnAmMfcPhmcdcSSfM6ZXlVQMJEo+FUl91fb6JzwQunANMJGYnLjR?=
 =?iso-8859-1?Q?hNtb5AuG/ip+Ymyz1e4dxUxRKqIOmk+QhNONk0QWYT2ShzJ+JlaDC4UH2r?=
 =?iso-8859-1?Q?1HUCkkif57dpyVTQpifM9wgThTLss5ShZWIukhLTPdlRTGyhtD94U3eSMo?=
 =?iso-8859-1?Q?ObihpxYvMUU3t7eah+aLaUYyFELDXLyMywJkYKGv00Dm/Wo+lO32HzdVMU?=
 =?iso-8859-1?Q?QqbCAg4pbTO/8mYJgK49zI3abQf7Nh167RfwgavO7ISwAip/zIUsuSyneN?=
 =?iso-8859-1?Q?cKKgR2/07WeeTwIvb7k8Xd543NPVshVFr6HrYxuqOZDpVq/xF9z8nmEWwH?=
 =?iso-8859-1?Q?0ixYaMNH5tjBGkzWqx+/AGimEjFCQaf42O2PYtSHEbXX90yTOgZAdAu9e0?=
 =?iso-8859-1?Q?IHIcYDdNkHSWZvveKKSQb+4M5Os3VdlrtHXfTXXF3mQnG+LuRge5e1fQSo?=
 =?iso-8859-1?Q?x4nRqQby5rAf8TCLBklnB/RfI99vLVowGm+KHHbjncTIpddVup6oigeK8N?=
 =?iso-8859-1?Q?m4Oiyv9Sd5xkYIJl1Pe8iu+z7lMpCsTlayfWV1Q6Ka5g7f6UzAxgJal5pG?=
 =?iso-8859-1?Q?CM830VwGY43kyFf5h/DA8lgZ3+LZdtkVF8lwiLR/jAW8ocNWIXLrBBW8rQ?=
 =?iso-8859-1?Q?dvGqOKMPD5Fg92fbDmwfl/HjCKGs78Vm4WtZxfNbmy0h+gwmeNTRRvsbGU?=
 =?iso-8859-1?Q?iu9PSS1Vz493RSSPRrZY6c5XkVdzL2bMdFUGW4yRXizEZdPeBnY6ahLoU1?=
 =?iso-8859-1?Q?vKCTF9UwukOgxJrQJgBchCIbEDb8rV33qIwyviPZAjuf/8TiqWE4szno1/?=
 =?iso-8859-1?Q?8GRLUd5j7z3l/1AarG8ThO9onf/qQTxTIqLaA8YhqFetkOVznr5kymT+YL?=
 =?iso-8859-1?Q?dsZC/PUlTJzGlyUv+pREgrgcvOm6VGxXV6SAr8mx2tbNbpBIHYb3+kEAdP?=
 =?iso-8859-1?Q?7123XQcAGqjvBujbfFbpS/4ckI5o2WwU3PG0IyrXnmw5PwcSNog9X3+QSb?=
 =?iso-8859-1?Q?ZG60Dhork94ltx2/q4VYTF0w1PmDfXD0D6+J3CyA1QOs76BjD+LpVq9O+C?=
 =?iso-8859-1?Q?71TqMK8Cj8mwX/GNO5ZC/oj7hpG12VUsWjiHL0ODrjzOjFavfazGSa2hXa?=
 =?iso-8859-1?Q?BRXnD1ERp+dEa9pQacd+Ddk4WfjrvbDvsgWuNRb4AY+3iqE147Z+BC/y8x?=
 =?iso-8859-1?Q?YYhRN+WUJuY5Q7LXhqE2B1DJMoQ6?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8768.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UwqQGDp8jaPdu7uTgGXWKbbYT8CgowaheIRFwpa8bZGZH7m1QwKW5XiQpD?=
 =?iso-8859-1?Q?/MQgRXsRonKVhMNp8cBnyObXqTTzTKVZYOyhBsLSyb2zQtZGtUg2KnD/Tf?=
 =?iso-8859-1?Q?+qABDcK8fMKZCj632HnzN+Uvr+T/H1drMKZRPP0RoiFjDyhxQljgWTyzno?=
 =?iso-8859-1?Q?ngssP+uQ8Y0K1ZKTa/1fFytqvpjrmTE7K654Gr+T3IOS1psW2OO6HWl4TJ?=
 =?iso-8859-1?Q?eNIDpYkF7qKw0YOL8Yzfv5SOTWM5WKbfGxBfAWOXBO4JPpD0XYesXP2d7E?=
 =?iso-8859-1?Q?LWX4giR7GSKTXMbWI6c8tKnvSfgEeVLG+5BxNskAbhrIJbd1wjCvOHvdU+?=
 =?iso-8859-1?Q?rXsT0MgvHdz2G9iBGcyKXqPsuQry0vTVSt2qoGAxe/srm7W6syU7KEy8HL?=
 =?iso-8859-1?Q?JKyEmWAD9HhYWIzsvpcc3ehPJIHpaoIE/8Ndq4StHnAZzNoLG31khh31lf?=
 =?iso-8859-1?Q?W3DGLwoJ2kgPTrXSiy3W8AV5IORBI0PkiOUGdmptO43tNwmt7IwtIhgtu1?=
 =?iso-8859-1?Q?+3sloS9123+056KAg6uUVE5DkNyPstY4mj+GIG5zFdj0MmXAl9D6rfb98I?=
 =?iso-8859-1?Q?dRiC365GcQURlKL6CXbYXM3q8t92JGwNM+FWqW7M/z1FdNbAq0RinFVCCW?=
 =?iso-8859-1?Q?5I42zZdIJXWp358EP2dJ/XrmP0zksDJXD8T2EeJUpeT921Txrn1wH4U2NG?=
 =?iso-8859-1?Q?0xWFH6lliwQZHrhmHK+nk/5VCcGEN7o4WccsDGcofyoyxau056V4+EzXJc?=
 =?iso-8859-1?Q?LeDMecoLOiCM2sZwJwpSWECRZkHZHoOu6f8t5+BVXJiy4pFO1545VvC7Pa?=
 =?iso-8859-1?Q?UwXOnKJKwQ/rqkfXU3VTeuGu2kC5ANXJ1ZUhKtZpgI8wtmO7nd/KkuNGFF?=
 =?iso-8859-1?Q?Tqri4OfhbJySFwgNiIWfr0JMDDNAOPnwAOcj2FdkdR3k6rp6khdvV3CesB?=
 =?iso-8859-1?Q?Kba11AaRoy7XjSw1kmCBkZq6mfdiIec4SIJ3NjPg94POfFqo0428O2ZS2l?=
 =?iso-8859-1?Q?wGgLNY2ZpAKk4gfDEXB/4hX1gWRPiOIBV4a8tIUibj8VBpKdOPwo9V3ApC?=
 =?iso-8859-1?Q?0fdg/1chIxSyjARP4qup39PS2CaQCNC5iOYzTUPN/zn4ctssaU/gQLKMDz?=
 =?iso-8859-1?Q?pdJGPvI6LkH/8wiST8El/3WRUerJF9U9NNnRhfjy1mVPFWGJI951c0kiFV?=
 =?iso-8859-1?Q?yivUJ2tZnfi8NKcZWGPq8Z71UPhXy/Mj359yDsbT7nWtMtAg3FzwRq6Mq2?=
 =?iso-8859-1?Q?PnLfE4KOnNvmPFbNgtI+oc6CO1r5bKm5gIz74hyyZ+kX4SGwdXHz5nIRqb?=
 =?iso-8859-1?Q?pxcLf49wi7TQY3kNLcIggwtM74OpgR0nguOrVxhAnjryplgTLURsGUSdHi?=
 =?iso-8859-1?Q?QpNuutl0bUTGouQAg/sZvb+mfn1eMaTpZtVaM1SiqISOBXdbNYySCsRO2n?=
 =?iso-8859-1?Q?9pqdbvKrfsNsiFfZMSWXIdFShpEybefrjP8zak327B1CQ2N13JhfkKBhqn?=
 =?iso-8859-1?Q?dVjB/zwQnnoTEMXcQ04lLDg1VsrSfZ/rwZxKkeyHKO0uiG3uqqxZyiYbfe?=
 =?iso-8859-1?Q?b3YJGd73AR4JhTFZeeeKICs3G+X8ij5rNcyP3sflxC6LHJrQsAG3KWyarz?=
 =?iso-8859-1?Q?DCjhxzd7pPOC8uZUBKPopFoPzXRF36H6zju2Rvy7NLHFfrBvXlsb8lsykI?=
 =?iso-8859-1?Q?//BlfYL49QGxEDannbWqxcENXLeJ6VgUA62lS8vIFgLndQ1Fgosw0HgiVz?=
 =?iso-8859-1?Q?OPtPUuiq7OjWg/M3zpbdsc1bD0oT/uVvhSFBUzf1stwCVY1aeYuA0iZvb9?=
 =?iso-8859-1?Q?dss64j2m2g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8768.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72034f2f-099c-490f-3edf-08de476dffe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 06:38:10.3098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jv2VfYWfgy5eIUijSLk8ZkOkVSRnyrAW32Z1azw1Ldou04MSd8wigLNFaV3TUwlalipB+EJKX+rS4tNzVJd9l78rXwcfvMgWtOBXwi/AmSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
X-OriginatorOrg: intel.com

On Wed, 24 Dec 2025, Ilpo J=E4rvinen wrote:

> Hi,
>=20
> This looks incorrect as the loop keeps iterating forward so it will=20
> decrement the reference count for dev.

Hi Ilpo,

You're right, I apologize for the confusion.
.
I'll drop this patch.

Thanks for catching this.

Kaushlendra
