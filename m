Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A30238D54
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605117; cv=fail; b=L9vpf6kSG1JbEAKQ+Z9UhCReVwcwWKJvc1h2HOourG3oltu5NlbuX8NSkdH3BzOVtQqCuivh8EC5TLHYHUGp6dISVF2VYWDFFRhcn9bJOyTWZfH7cXKhmK6q+tG54qiAF0osFpM2nHH+3dj0sDEtZlm1Q5gwGvG0fzkBwXTNhsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605117; c=relaxed/simple;
	bh=/Efn+NrEZtJKjhpdNIPbZYtfd87rzJqy0fSiEPSN6r0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O2A1j0EevHOkpRVV2B83VrWOcInuc4mE6m45rUzQDXeqBufudIyVqINUeV0cO8pOWE9OXoKl+Sfh6k1pkuNXN5gWhK1eYW9oWeEwIf/2kM2gJf/mXi62IWGZ1rk6okMD0zb2mfD3Wreib1KHby8t5QP3cl+4S0HW2U/FBxXfXcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoRPJRj7; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoRPJRj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769605115; x=1801141115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/Efn+NrEZtJKjhpdNIPbZYtfd87rzJqy0fSiEPSN6r0=;
  b=UoRPJRj7RMYFVngmwKdS1R9BaYhRt9WZ9Kvn3ma/gtYhgr5SAXg2SyuO
   PfsR7YgwGJbB0A69H8kB9z/byXglEI0HqgeBSJ1TsM42j1qhG1dFqi7zL
   US7Iw/7XoRXB23mYnMkGe4Klnc4+U7hsI3EtG5n9vBLQOuhY0X1NJndk9
   LRRPxP1UM53hGHD5YWxA551b4xaZ1JYVfabg82PmpHQ4ZPoF2gnCTcs4N
   6K9UfqVYI4g4rsAoL8eYeRxztwdz8Dx/Z/IbaKGefSX1wz1tbKOoaFR9b
   iGP1yuNXWuVfYLPndivJplk+34DRaCCxiAVvSu4YRRDguGufEeqc5DJRW
   A==;
X-CSE-ConnectionGUID: rlTpvFyeSKuHpwGR0S1xAA==
X-CSE-MsgGUID: xAgwzFfSQEyenx7BIPEZuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81130417"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81130417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:58:34 -0800
X-CSE-ConnectionGUID: ZnoC1JsxTyWwnwhV9diWFQ==
X-CSE-MsgGUID: 5IwXtweYRKSaMdqiLdXNIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208053952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:58:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 04:58:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 04:58:33 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 04:58:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLBLZYnNUiAW7VGELVnAcJXQvIpFtfME708Byjb/R3W7cy6RJg/O5A8xEQPQ33RYDlJams7VgGoRo7YC+2PfZC8EoFlGR0NUNNRfiQkm88btpF4eYcr7QOfkQThSdi4J3rddwasDs+SsF041o0x4TrYcHzEYNsjC1mveSF2XudfNsIgsH9Pww607sib6C2mGsB3e7e4MxJ0mvTQD0o/UZ2xrA3eXqavyK4ZNUnAtdnCR3lkVAIA7fhyQMk+PZqX8+QNYqeFoYO6cOQxRlkHn4ZXbkCHD6uMnhfZ3CTV/V1uaeZ5LqaPTvlJqedPVj1SkVbHYDNR9yFNWdyV9cO0kxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u9GplR+6GCWXwTUpNwTBuLOxks9TJsMmhyXqlzod+A=;
 b=QZQwWrCuL/555DEoG15bWUjNqwAIELnKsVYtHVIRT/ErUmWo/eCwkqojC9PzH1LHVH38mvBec2BcI6Q2Oqkk7xeH9lwBU+xwt+DDzTT8hGIzfHKCzgwsx61MZZ19N5YTWEWSPVZRCrXI1SDTpH7ilmgQBb8wDG7gXyyYj4gC23/8VSi18dgBIR3hHiVD7bD/F2uZ8yLTXe+oJQJdS/JH0q/ZN1aX1qi1Fox7qnGVcod+pJgUmyjSJj2SRexbS0ZRsvPWNx9E7IeiYCwGJA9xTrT+DRXPk3iIZm3HB5QSFjSXqXzPVyrpCoJDbbnAkoV88jiaz97kIrUnzpNFKM5SRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB6884.namprd11.prod.outlook.com (2603:10b6:510:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 12:58:30 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 12:58:29 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH 2/5] drm/xe/vsec: Use correct pm state get
Thread-Topic: [PATCH 2/5] drm/xe/vsec: Use correct pm state get
Thread-Index: AQHcj7o4DHrgMx/YHU2sBl9ahnZb9LVnh52AgAABqjA=
Date: Wed, 28 Jan 2026 12:58:29 +0000
Message-ID: <IA1PR11MB6418E9C2CAC15788E3C65952C191A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
 <20260127182418.640701-9-michael.j.ruhl@intel.com>
 <3f8ecbc2-e5bd-37d7-faf9-f5e090845243@linux.intel.com>
In-Reply-To: <3f8ecbc2-e5bd-37d7-faf9-f5e090845243@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB6884:EE_
x-ms-office365-filtering-correlation-id: 803656f8-e8c4-46c2-40a1-08de5e6cef68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?bZjUbaY89cWFIe27DEmifHsbMf3Y9Q+h8IL3qCnnSO1oZ3fYweeOkJ7sc8?=
 =?iso-8859-1?Q?jDYgWW1A1iHQVPU7qkEsIxDoOKic3Hemev2wXj/e/Pizz3Ehnblbsw5nc8?=
 =?iso-8859-1?Q?9zESj/74lbBryBp+iiKiL7WNb/qTGXAfAWpKHolAj7rMAiIyn00OHUr11j?=
 =?iso-8859-1?Q?ROAPbpM2ihwJ6tHd/tP7/C5UalpDj9vubc3UcT4V391DR1Rvkdshww5tww?=
 =?iso-8859-1?Q?Bg3kaAcx6JLgPX2lee8VBPy/1tzbmurRD9xE7o9JBtLb9vzm7i+1cjFXjH?=
 =?iso-8859-1?Q?NR5YNZqCvOfKGqAf9UlfP+fpS0d+EQyju5RtY6f/Y7BIH0LyyPVPiaG8vt?=
 =?iso-8859-1?Q?cZbHv+TIWucLLVIMAFnS506XgY1PBxlfKToWr1tdN9Wkjdzwy4NptrBtRw?=
 =?iso-8859-1?Q?RX8JhQ5+t4LXLCNuvJCwmJeJueDHugINtbatqYf3IkQPOyOt868C6YgRhA?=
 =?iso-8859-1?Q?03TFu+4FFx6upQAxsVUZ63PHCG4+nI6X9AuIGgwLB/HYV+SmNZ2BN7e9Gd?=
 =?iso-8859-1?Q?Cn6RBI7WoM8pqcuQOTlCAMGYBvPAV0NwlDucgji1+4ZhRZt74OXrPY2O9c?=
 =?iso-8859-1?Q?0/C3hLmuivlr/0/moJ5U/lKjjD4uU/oBAHSacB6m4B10jvYxv7vcnAYzaD?=
 =?iso-8859-1?Q?ZWVymv+WTlXKUD5LtuJM2yJXfoMzSa5gQx25BJT5+LBXHvpHaN20j30yeR?=
 =?iso-8859-1?Q?WvrkjWy1tRelLms9T9n69SFm3lPqjffvmyry0SR6x+vBVs0okOIa7nhC8N?=
 =?iso-8859-1?Q?uVMUnECyYkuFmgzr94tP7m+zYQZr4yN/E7cyoU28FpjgyRGezuUc0gwfkE?=
 =?iso-8859-1?Q?vnDSBcPqoheJqrooApaHcYZCwsC78fS97mJ2nas1ZRT0OZO/r6TIf/c7SD?=
 =?iso-8859-1?Q?4i7NyWlLSiCjufsDSb57P3rXS0qFGGRABI1SUglV+HsHtdNcIRJgNyGLBQ?=
 =?iso-8859-1?Q?GfOT9OqG/28EJ2BBKN0rf7hrpnde4VbJdvjG6HpwTNQRzBbrQujnRvcbpc?=
 =?iso-8859-1?Q?QHE8Tj6ZKq1HrjpPi0j01fqH6Ra5iB/cPVi2GStj3kLCDZoA8kwmawlVhs?=
 =?iso-8859-1?Q?uxpLjN3QKx/MJKYoqZU7zWxdW1KQ4CxDbcHMu2hdSU37YVvA/51c9jXhzn?=
 =?iso-8859-1?Q?Euui27OxwKSvAjZFEtkGXzYhabMNTq3QIjSTplZBWLv0nxLlHvb2l2PbrS?=
 =?iso-8859-1?Q?zyzwaz/kMkf4U0qMfkQnkCno6YN9rd86NXC3y3nyfWWyu83red1xcMZ6kS?=
 =?iso-8859-1?Q?KqsSj4sMVJdqVXat1XA3znuUtMchh6uUeHwjiaZFyjUc/xbhbvQXYr88hr?=
 =?iso-8859-1?Q?ns+VSfyVk5kDiRN/Euf1rqgdChGsxImhVCPn8NJhFoMdj1WqyY5x6zi3qS?=
 =?iso-8859-1?Q?pXReLWGvZEEfgZ8xGrF/QK43JIr1UQ4sczanbhHRlWRy7bbJfii6tjm/H8?=
 =?iso-8859-1?Q?gRIZz263/p/Lq1W+pj8rQkQVaJu9TOQg1g+haNDy5gMNSkVFFk5SQw3pWE?=
 =?iso-8859-1?Q?ITg3ibEuZavwedOQzHlRDw5jy38KnZ9n2DpupLfUUxyKMDKjIgWYEaAoTL?=
 =?iso-8859-1?Q?aLy9GLL7v3i4fB1il0YBTMg3gtF60AdieslbM4Yi+16cS0ewSS2FWoL82E?=
 =?iso-8859-1?Q?ssPjDIVKDow+gJUTHN0/xcP0ghbkYVbOItYoX88h1YxP8SLMuRZTKiKp6n?=
 =?iso-8859-1?Q?Kv+xKXbQnQji/WDm0vI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OSF9F1MN5EFIhyZfONeyy8WPDkPfeAlSML0+HgGaBSJnea1BAa7KCEHkx7?=
 =?iso-8859-1?Q?+n2ZW6zRp2UO+y74c2/MP6vIKuN8TGFGy5QKPlyHVp7y/vYNQPTVLJZJwF?=
 =?iso-8859-1?Q?zJdR1S+swjDWRF5IpVeTI9PEe39kvibRYsvNMreI2qAU+ELp48n4tOOPkP?=
 =?iso-8859-1?Q?OEBmawzu6F7RRWjgiDBS9v/MdZhUWCGBIi3bztgZPhd+ROIMPb1F2W8rgZ?=
 =?iso-8859-1?Q?8NM7RyW+hlnsIfcbmvWnxSyOeedqPT+TqvI+j/fOOyif/8JBuI4m6zdrso?=
 =?iso-8859-1?Q?g/clqX3VfPHv0F1ono3m1Yly1YGPlCA+AgqDhnaGL41eP9raqCvrT+mzmJ?=
 =?iso-8859-1?Q?fqpT8/9HqAFt0X9CjA+VRQ0RPdF4jnq1YFruYff4bANquqhfcwSmVMgYkr?=
 =?iso-8859-1?Q?VV6K5l6KhFVF9OoXZCqTAVP/VmTACtSYMUEaXu2tMo+G+rlwgdmTzMu3wQ?=
 =?iso-8859-1?Q?B5CV4EKmb8OClfT1hYliNbKRPZIP9ojlrueRN8oUSl0irH8RauJqRvEjHS?=
 =?iso-8859-1?Q?hWwcG9ebTmClhnC2BCEcyZzkdTBwJkm60U5y/dN5gZcKA5hwJbqpZXnwqM?=
 =?iso-8859-1?Q?/Ue3OL3eKzLY5zul+7zR8pk627G7y7htAd76tV7YvgspS0XW8KgluzLsIM?=
 =?iso-8859-1?Q?JtyvwI4g+MiUvKOcZCnWUwB9BmINqW/oQ5O4ihe5JJcYm01Qddt0gOuE/o?=
 =?iso-8859-1?Q?BleGyukq+K09eK6BRuIU6s51HIunaOHSYvqLKnpLGNVJeuuY1BHEqhV3XQ?=
 =?iso-8859-1?Q?nrdqHBAQNcrLOhL63o8qV8FCTPZ8LryzwePYTeGEJt87OFokOJTJePN+Bh?=
 =?iso-8859-1?Q?aY5fnYSnvkoge9qplWERgLgfytOQj8yp1457iuFUzkQ8sYYOM4uPa7zNA1?=
 =?iso-8859-1?Q?tjKpGoTkMGtR7iQ242XsUo7xLbUuZZfROiY+CuyAJK20flHMzs6FF1PYMW?=
 =?iso-8859-1?Q?VqJtBZydb6H08PKGnYgFI30229Wix0GwPNcX4gloXwvuJouibVR7CCO7qU?=
 =?iso-8859-1?Q?pCJ8y3R93EOR2afWxEtfmC0Y9NYON7GD5QLjixMc/f1EC9HtJjkpBrCQS5?=
 =?iso-8859-1?Q?wm3DCpj5zoI44oiWvsKs0GJBrb52kFEDupee79SntQ7e9ptcL6SS9tjjS1?=
 =?iso-8859-1?Q?6W3S9tEGJfiBUaKOmjz6N4Pc9uwI7lPvGzuA1c4jUcAd/8A+5ier2InyQ3?=
 =?iso-8859-1?Q?10KSZIuHe+qMxtU1JJ40xT3ais2rpwPmEDqO6VIh9i7w3wrHXtIQeGP1y8?=
 =?iso-8859-1?Q?t9p/FPJsM3Eyfdr4S+XmcKUZnO+2q9rkX4iKVrp0mAl4uWjYnl0ANRWd1B?=
 =?iso-8859-1?Q?5dNSx8L/s0e1C9LZVHbUFttkUmOK01xaiGqiMESwzXSJP1obSM8gojfAVj?=
 =?iso-8859-1?Q?Ek9p5eF5e5Sk9YLTx6itxNMl9wiq8xiEVJaJbkqc+wsdp9mBRuHoOOZK0O?=
 =?iso-8859-1?Q?j4goSeEZF478y6KHxpAac3RlNFfN0u52LPDZe5BWpHvjzY/ESL8nzGNSVd?=
 =?iso-8859-1?Q?99bZhOFKSbjLoNSiM5sfGgip88HQjz/T0l05aQcRrcye2BUiEXYMzO0iht?=
 =?iso-8859-1?Q?tLfO0DJ1LYW/H/AUy4pqZGINXjc2nyLpmHnCErF059hhWejit0WupkmqSp?=
 =?iso-8859-1?Q?suGvDsqzIbX8Sbuj/8u48AsWTh4e+2Fvjj9Ja4vAEcuPIcTOw19LsBQOO+?=
 =?iso-8859-1?Q?oOngyUcy33E9Macr1KXkThgC4FpRrvNDrmIgyDknwptaGPzhS0jOCsHB+m?=
 =?iso-8859-1?Q?vvkYYW0TRYLjTIum3cOvbfAkgk0kmY/0CN+truOeA9Gs7uxrZZUYp0pLGZ?=
 =?iso-8859-1?Q?a9MLojoupA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 803656f8-e8c4-46c2-40a1-08de5e6cef68
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 12:58:29.8685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRSLKwPdjLtRN4dizDXdUq0Sd7BmJiherdi86uOyMKZwWU8nCcOk8qDwTEt93ccBGFOkjiGOxKDugs2C3ge2a53EPlXMQdTjwbgIAPp0R4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6884
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Wednesday, January 28, 2026 7:42 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hansg@kernel.org>; Brost, Matthew <matthew.brost@intel.com>;
>Vivi, Rodrigo <rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com
>Subject: Re: [PATCH 2/5] drm/xe/vsec: Use correct pm state get
>
>On Tue, 27 Jan 2026, Michael J. Ruhl wrote:
>
>> Crashlog needs to be collected at all times.  The current pm
>> check assumes telemetry only.
>>
>> Update read path to enable device for crashlog instances.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 4ebb4dbe1c9b..44607f1eaa88 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32
>guid, u64 *data, loff_t user_off
>>  {
>>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>>  	void __iomem *telem_addr =3D xe->mmio.regs +
>BMG_TELEMETRY_OFFSET;
>> +	u32 cap_type =3D FIELD_GET(GUID_CAP_TYPE, guid);
>>  	u32 mem_region;
>>  	u32 offset;
>>  	int ret;
>> @@ -160,9 +161,18 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32
>guid, u64 *data, loff_t user_off
>>  	if (!xe->soc_remapper.set_telem_region)
>>  		return -ENODEV;
>>
>> -	/* indicate that we are not at an appropriate power level */
>> -	if (!xe_pm_runtime_get_if_active(xe))
>> -		return -ENODATA;
>> +	/* make sure that we are not at an inappropriate power level */
>> +	switch (cap_type) {
>> +	case CRASHLOG:
>> +		xe_pm_runtime_get(xe);
>
>While this is xe code so I don't know much about it, it feels odd to me to
>just add a get without put or explanation in the changelog why this change
>doesn't result in imbalance.

There is an existing xe_pm_runtime_put() before this function exits.  (orig=
inal
line ~170, new line ~181).  Is this what you are looking for?

The TELEM entry will not take the reference if the device is not powered,
so a put is unnecessary (exit on not enabled).

CRASLOG requires power, so the _get() will power the device and take
reference.

Thanks,

Mike
>--
> i.
>
>
>> +		break;
>> +	case TELEMETRY:
>> +		if (!xe_pm_runtime_get_if_active(xe))
>> +			return -ENODATA;
>> +		break;
>> +	case WATCHER:
>> +		return -EINVAL;
>> +	}
>>
>>  	/* set SoC re-mapper index register based on GUID memory region */
>>  	xe->soc_remapper.set_telem_region(xe, mem_region);
>>
