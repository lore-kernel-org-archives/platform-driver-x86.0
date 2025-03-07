Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D823B1AB
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Mar 2025 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741366984; cv=fail; b=cqB3b9H1CE+JLIb4dh5iQo/vxUDlccrcMQkmWHI9eWM0Ojacyjc23GAK86cPYUlzHDoayMAl1kSgZ5xcdh8qwbe9y893BbPG0cwqXVyOJm8ukBHBiOh2+y2o3mbWR9dDIinoMpRS2WhuB7e+uO/8gIjIW/nw+VMvtCJ7NbbQdtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741366984; c=relaxed/simple;
	bh=oDgK3W9lWfbNl9nwsAsbC00wabUc62O1l5hO0b3d9kk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PW3zPLVWSuiGVKKWpPht8yne2LMYXvgrPugdxJ4IiJmi8w2fM0zDd34a2WYBCHbKomRy1CsF5LLa00PQ7uBRlZvHh2OVhbGK4BSD2tuGPiKoW17QkNtNnQ0bKeS2Q31CaQb0Jnd/Amzv7GgDrb46ScSMVQBNkVmfxRgWWdzLEGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EB8nx37P; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EB8nx37P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741366983; x=1772902983;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oDgK3W9lWfbNl9nwsAsbC00wabUc62O1l5hO0b3d9kk=;
  b=EB8nx37PWiYPq0B81oPTQJltinN7r8OTRLE32SOFS5VHp0IioyJvdZAu
   u+XFlB+cpODsL/7l1UbwFOW6bS7jJPEnnuaEcz3br6pllVudK4LUs8OFV
   QqrmR2zeQCs8dqdG/WH1OnjttrttZ5lAMTgYQQZdV6UKcJW4d6OOqIjjY
   J2NSdaZpIe++9thzuXVRbNNCXW4LkDxO4F+w0p5vrgCHeEUl6/E12TMcg
   l84kBZOwUXB1YEay7XsT9N0KfqTtBXVIJ65Tl5+vj7rGwl/SzoZ51pcdT
   aVVElccYVrrtfe31JG1LIra9DisUbiqrcjLluulwKSrzO7KYtEr2D7wXH
   g==;
X-CSE-ConnectionGUID: 1qoGvvq4SwScDeRUV/XHKQ==
X-CSE-MsgGUID: u6LjWh74Rm+4Ny2oCyZP1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52629990"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="52629990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:03:03 -0800
X-CSE-ConnectionGUID: o1oNUYgCTmGe1bBd3+Jnyg==
X-CSE-MsgGUID: +6BUzE1nTXy4+rIYdxj4MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119198306"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:03:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 7 Mar 2025 09:03:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Mar 2025 09:03:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 09:03:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3uq9w/Zxl4N+vpJyU4aZ7h23TWqIGXCd1vXXaMkwGWvZ4v6OzcBoAIxaVHo4IWOcHlmzk9hHywS+Ag0dMSvtnSshNKFDui3yBSYCNcs/oDD2jDRwAXo5OPo8r67HXtaFXaubZ/obsqyRPHA/h1Jcku1+8H+y9IVqBRrr8qNDp4a+WsFyken3Kd0679i3/8FnSRqLwXe8P3WTzEK6Jj1GWwpu0XfPM5DSjeOjSl5l2cQT8BMJwBZgm1ifxCe1199XTEO+I6+xxrKWKCky3zYeHCbB6fgnKPnlYjezENIR0gGRdTxf6ZqvNH9WbsLBYicO/GZtHv/j/uhio89OzbkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDgK3W9lWfbNl9nwsAsbC00wabUc62O1l5hO0b3d9kk=;
 b=ce6aOpUjcCyviLlBTUQzcCVSfTN0Xcvx+hRjUjJkK51+kx9fOCxU9zXR3Ydqfb600XT1O64RddVNARxiF4S3tNAX+QIdVaiF1NZi2vScrWtH6Mx2dHoa65GHh7YAbIBvVh/LCnmSk/Q8ZunOUaX1f/DMX4bphysVIDro/OwpOfpdasePKJibf6x7rRtl77621KjncJuB4FTaCB+frT3tj33aw64s+Kgbf5fhjjvz7+guVKmamuf3nOYDkuOHMQjQlhFtIeL2Jf8lOGJfMOeOUT52xUP8WuU36DVI0Pwhe/u/zHLaGlM8StY9FBqrBlyMTsjiDpYIm29HhDatxAyADQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 17:02:17 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 17:02:15 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request-2 for
 6.15-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request-2
 for 6.15-rc1
Thread-Index: AQHbj3vVMU+dMa+2hk20ypWtRxXsQLNn2hYAgAAMSwA=
Date: Fri, 7 Mar 2025 17:02:15 +0000
Message-ID: <eacba4da588808e4e0fe60e934208a95b955ced3.camel@intel.com>
References: <41729ee0b6b11a5d2f3b18a20343c1ceace86dc8.camel@intel.com>
	 <c8b6b798-300f-60eb-c238-ade4da8cc18b@linux.intel.com>
In-Reply-To: <c8b6b798-300f-60eb-c238-ade4da8cc18b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|PH7PR11MB5886:EE_
x-ms-office365-filtering-correlation-id: d3ff7448-a89e-41f7-317b-08dd5d99cff1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dVFBbEJxRllHTXRuekhBeXFzQWtUNUVkTUh4Ym1tVnJQSW9VZnl4OGx3aTZZ?=
 =?utf-8?B?bGlxVGdEa0dBZUdLanl1bzZiM2Q3QlpsZ0Y0MG5EL3huakVKOWtIaXYrN1pq?=
 =?utf-8?B?V3RZZnRVaWhkVDJFMWJuTXNocFJ2eHp1L2ZwQWc5WlNpZ2lMQVVaL2wvditv?=
 =?utf-8?B?ai9pOWIvQ0lMeDg4M1hiZG90NkVRckJHZXJEeTVKa29CZnlEMFF0Y0dZUDRQ?=
 =?utf-8?B?U3hHTWFOWDNsOHgrQlFYSDRGMVhRNFo3OGlOVVczYkQ4UGFwdHJnTW9veUZ1?=
 =?utf-8?B?Zk1aTlVHK3czMHhDLzVqdjFQSVk3QzhuTDJ3d096STRzSDFVTDI3WnFxdTNw?=
 =?utf-8?B?N294RjZJS3I0MGUraHRjZmw2VHFiTUJib3h3N2dTMjV2VGtFU1RqNHZBaEQz?=
 =?utf-8?B?NTZJKzNoY0dXay9nNFk1akY3djdzL2VKRFR0R01wUDVNT0JDR0ZFNTkwYmtC?=
 =?utf-8?B?WDhJZU1DSy9EbWhaSm5meTUxTUtlMjE2MXBlbG9senJBOTBLQ1Z2ZjkrdHI3?=
 =?utf-8?B?YjhMWnpxSGZmU1RzTW5CS1cxYzFpOER4Q05Pa3FDY0xHU2UzaTlYVTNXQmo1?=
 =?utf-8?B?L0UxaDhXUjlMc3VzL2xsTEEwTXZtdXRRK3JSL2Rtd3M1SkRJeDBlOTFaa25n?=
 =?utf-8?B?eTRiVllLNnR5WnJ5VkkwMkt3MVVjcGZtdWNGZXRZdy9aYXBTTzJ3VlV3bnBH?=
 =?utf-8?B?eld5bm85Yktjd2wrSk1zRkZrRmhhSnYyaHcyYXBUR2FrNXNja1pJSEFKU1BP?=
 =?utf-8?B?QlozdUdLbUh0aTZMQms2TXhNTmNxUjZZcnJ0ZEVjdUpoQzBzbkpobi9YbnRk?=
 =?utf-8?B?QkFqbFN5eFh2a0d4NVkzYzIwREN5cUhodnhCWVZSK3RRcHdiRlRtenlaRFh2?=
 =?utf-8?B?LzEraHF3TU5na3JXMFdaUkxnNHpXMjlWdTJZZ0pSM1JwK2t0alhPODh1NGtU?=
 =?utf-8?B?c0R5MXBDcmUyZGticEtLZ1RjejVISGczcmNyekVSdndwa2FtMWFpWllObTFm?=
 =?utf-8?B?aDUwQmRDU2FHL3c5UTBRenJEY3h1Y1lHYlNPU0NuaCtzVU5BT0FhZHJYa3hE?=
 =?utf-8?B?UzVRQm5iaWJjK1laR3QvazZHTVpCVVpXeUIyK2c4c0JkZlZFbDdxcHl2TkMz?=
 =?utf-8?B?Q1M2Ly90TGVBODBvY3IwMTQwc1k4VnBTVjYvSFdPNkttYjYwU1hic0dJR3Rr?=
 =?utf-8?B?TjM3SFUycnNhU1JHYVczTmZqVnVFeTlQejAyVzV0OUhKSXNHRUpHalVSQ3NJ?=
 =?utf-8?B?ZmJRNFJNVE8yTExJWG5CRXk4ZnpjL2FIT05JT3hHb1Z1V3orZE56QThUMlV3?=
 =?utf-8?B?ZUxuZ3dINTBqUGpKUHlMWG54RzgrWXRSTkFPQ0xhQ2o5ZHRsM2JwTGtWd1By?=
 =?utf-8?B?WHdHWG1oRUVRbnZVQ2RmM0ZoODFLVjNOY2IrV1VzVXRGSGx4THMzT0pmdlVO?=
 =?utf-8?B?djVDK04yYzlvbUh1UmtGREZjTjA4YWFVaXFyYmN0clZrRlBlWDJtdkE0L09w?=
 =?utf-8?B?ZHB0YVhFdWplUEo1YW41Y3U2SFh0Vm4xNC9GOElTcmUxb09TZnc5TTloTEhX?=
 =?utf-8?B?UmFmTlNKMTVpek0yeUF5Vko1MnNYODhGcnRwQURMOHkxZFFqWXpwSDZwa3Y1?=
 =?utf-8?B?SWp2MjJZd2RtRlB4dDU5QnE5M2ZWd21uaktKOVBFWDNpV2xsUkNMUWpsTGFn?=
 =?utf-8?B?TE5iR21ualZtTk9DTUJEQ0lHdll1ejZ3ZEU0SDYzTnRwWFZXd2N6bDRJeDRH?=
 =?utf-8?B?SWNDNC9MRDVVbm9xaDJCYmxiamRiTytZcFk0SE5WSjZXd1lQRkZrOUZtK0Ew?=
 =?utf-8?B?cDlsdCtsRFp3dmU2RVJ2TzhrUkJYdnB6cW5SRy9aOXU3MmlKekZBSzNKTG9x?=
 =?utf-8?B?RThKdUVYb3FxQWFuYmlGT005ZDAreTg0Yy82U21aTGJzOWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzdSYUl6eC93dGNTTFFITG1FU3hzQ3EvYVBvMFZzcytIdkJSUk5DaEQ3S3o0?=
 =?utf-8?B?VXN6bUdPbFFTZXdPRkErMTZPM3dOS2lBVmNDSjk5akYwRU1nUHlodU16Vy93?=
 =?utf-8?B?WXZhRnI0MzRFS1EyK1R3Zjl2TVNXRTBXd2ZYdUx1cCtyQnFKTmt6bUFGNTVK?=
 =?utf-8?B?Q3FXa2d5cm9HL1g3ZzVxUnFXUWtPRVFCUmx4UWtTTXlSck9sM29TVjAraUdr?=
 =?utf-8?B?RGpqZ0FiWm1ueGRuVHlzZDZNS25nWmRKOWlGNEZGUTVUMll2bmU0aTVZd2Rv?=
 =?utf-8?B?ZjVnTVdOQ2NvYzV3N2FXZVlNcFgxRWI4SUk1MlVQeXZzdyt3S2huRE1uTVVT?=
 =?utf-8?B?V3VFWjRaM0tEY3dNZTNENyt6Y0NVKzhMMlcxK1ovVm95MzI1ZndRbWxha2Vj?=
 =?utf-8?B?bk5DcmtUK09uOUdudEE2ZDZvVDRLMm5EUWJHQ0ZLOEpPUlZiLy9oT2NsYzRP?=
 =?utf-8?B?Zy9POUhRQ3NkYWs4UXRIMHF2SHZVNllhV2JzbW81ZFBQZEx4K1NIa3RkUzhm?=
 =?utf-8?B?cmEzK0tkdmhDNklTNXhZTVlyQjdibE1XQWpYMVdXOXE0T0FOb1ZMdzJRa3JB?=
 =?utf-8?B?N1RsaWJXeW56eGNvbk1BTHFnMFlzaGpZVjZacTliTHBqUnFrbS9hdTdvS25U?=
 =?utf-8?B?TWQxWE5ncjZkQjhLUGJOK3ZtYXNGYkQvMmdNNHJZM3ptZE0vdXIveTRCcXhT?=
 =?utf-8?B?cnY1bGRMNHREUzcraUIwMjArTFNFL1BQajl6QStRZ3h2Y0UwcWxoeTNaaHRk?=
 =?utf-8?B?eDJmZ0tscUtxV3luRUc1amdzd2tySWlWV3NUQ1ZrOGNwSVFMc1JIOUJOcmJQ?=
 =?utf-8?B?bFVoVkVMaTNXZ0tZVlQ1eTNycmJ1VWNlTjBiRFowMTFqZEpudFBub2tGQjJp?=
 =?utf-8?B?VExsMVUxZnJJZ205Y3poUGlsZUhiMTJJRUxiZTVLNWViK1NqbjFmRjF4emhX?=
 =?utf-8?B?SVNQdS9hRklKZXlMb0lPelprOXBQQUk5RVJ5c1orN1JpMzJ5TVhCRHM5TEVp?=
 =?utf-8?B?bUJGUHROVUNEUFVmVXZpL1poRlBLZy9XUTQvSFYrSnBQcEF3YkFLaVZwMnc2?=
 =?utf-8?B?dFUvYi84Y2xoeUlhREtwY056eG4vdUJEL0tmZFZod2NQU2xWTmxtRUVwdWpn?=
 =?utf-8?B?Rkp2aE9EQWR6K2pMaFRmeGluSHBYWWxkeUFGdWVzUjZiSzBjemlRb3NOVFVo?=
 =?utf-8?B?N0ZLQ1YzYVBUM1dzZFdQd3dYcU9GN3VLNEJUNmtLYXgzd0haUUpndTYyMU5q?=
 =?utf-8?B?NzlsQks1UnI2a292aHJoTGJPa0N6dHo0T0ZxMEF3MG1BdWF5dWQ1bm9FczlX?=
 =?utf-8?B?c2dJcTFZV2U1K2d1V2FITXZvZ1pMbUQvMjlDVlc5N3owajlQeEVMZ05rRzNu?=
 =?utf-8?B?V3ZGOEluRGNjVFlpcEZ5eVlwUThSL25qNjJLWnFTUTZCQTR5YytlU05kZVVE?=
 =?utf-8?B?VmxyMnFkRW5SQ2dGdHE3VGxrc1NjTnloVFA3V3ZGcThOcVpqbHZYRVJEOXY5?=
 =?utf-8?B?a3RMb04rd1AvZGtUQU9WRFZJemFDUUZHSk9kMjdsYmdqUjlISEJkdnFuNEtY?=
 =?utf-8?B?Lyt1K1lmemFweVV1OCtwbDVYRitJeTJvek11WW5Xa1NYVkhGV0k2VXdhWmNw?=
 =?utf-8?B?Tnd4S3N1cEV2emZlMVpERnlCRnN3R3JacFpnZDYrcUlGZXhXVXk3aHI1d3lO?=
 =?utf-8?B?TkhsZXlPaHlwVHBDdlovQlp4V25kQUNQbTlCZWtkVE1Sd2MxMXRDVEM2eVIv?=
 =?utf-8?B?MDI2eUJZUzZZcE4zZnlINlljVTVnRzJmQ2kybGU1aW1qMWg1ZnlTc2EzamVn?=
 =?utf-8?B?T09reThVR3lNU09CYmtYd0hIcm8vU1ZveGdISDdzWlZqN1V2aFIxV3FVNDVh?=
 =?utf-8?B?NEZrcnBrODRGSjlOaXhIeTIvZzE3bXlCY2FJcEREL3ZmNVIyUVBlN1llUGM0?=
 =?utf-8?B?RjE1b2c0N3JtNUxjSWJvZzBNaDBIRnlaS2RTS0dUL1VLSnB2WHJlNk03bGd6?=
 =?utf-8?B?VTlNLzhZZE5JY0ttSWZwVGFZbWt3SjVhZS85RVhyaTFHbDVXcjNZV2ZjSmZ1?=
 =?utf-8?B?M25qZU51cVBkSzdSbmNnSTlIT2xDYVZDL21aWW96Yk96UCtOWXRkZ2F2OHBT?=
 =?utf-8?B?L2w2TlB6NjBoUk9MT3pLQjY4OXRudnFlY0ZsK3Q0QTFjOU51NHdhcTRzc0E5?=
 =?utf-8?Q?+CrRvLxlDJ8jkvtadi9A2Qc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0ABF51259F4544EBF6C48599A4629DD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ff7448-a89e-41f7-317b-08dd5d99cff1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 17:02:15.6179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3iwLcB3CJ9/3EN3/uKh++UTMlvHWDW0iIpNVUCSdkoJAEN4ih9cwJ2fLnAlapOsEoUlgE01JdOaDrbc5CV9q1fDGR6koRFXgsLhivjOjJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTAzLTA3IGF0IDE4OjE4ICswMjAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cj4gT24gRnJpLCA3IE1hciAyMDI1LCBQYW5kcnV2YWRhLCBTcmluaXZhcyB3cm90ZToNCj4gDQo+
ID4gSGkgSGFucyBhbmQgSWxwbywNCj4gPiANCj4gPiBUaGlzIHB1bGwgcmVxdWVzdCBpcyBiYXNl
ZCBvbg0KPiA+IGh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2DQo+ID4gcmV2aWV3LWlscG8tbmV4
dA0KPiA+IA0KPiA+IFRoaXMgcmVwbGFjZXMgdGhlIHByZXZpb3VzIHB1bGwgcmVxdWVzdC4NCj4g
PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvcGxhdGZvcm0tZHJpdmVyLXg4
Ni9wYXRjaC9lODg0YjRkNDAzYTY1MDEzOTA4MDM2NmI0YjlmN2M5ZDRiZTc4ZWZkLmNhbWVsQGlu
dGVsLmNvbS8NCj4gPiANCj4gPiBUaGlzIHB1bGwgaGFzIGZpeGVzIGZvciBkaXNwbGF5IG9mIGRp
ZSBJRHMgaW4gYSBzaW5nbGUvbXVsdGktZGllDQo+ID4gc3lzdGVtDQo+ID4gYWZ0ZXIgdGhlIGNo
YW5nZXMgZm9yIGRpZV9pZCBzeXNmcyBmcm9tIGtlcm5lbCB2ZXJzaW9uIDYuOSBhbmQNCj4gPiBj
cm9zcw0KPiA+IGNvbXBpbGVyIGJ1aWxkIHdhcm5pbmcuDQo+ID4gDQo+ID4gVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA+IDZhZDFiMmRjMGYyYTc2YjIzYTMxZmM3YTUyZWQ0
ZWMwNmU0MzQ0YTM6DQo+ID4gDQo+ID4gwqAgcGxhdGZvcm0veDg2L2FtZC9wbWM6IFVzZSBtYW5h
Z2VkIEFQSXMgZm9yIG11dGV4ICgyMDI1LTAzLTA3DQo+ID4gMTI6MTc6NTENCj4gPiArMDIwMCkN
Cj4gPiANCj4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gPiAN
Cj4gPiDCoCBodHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEvbGludXgta2VybmVsLmdpdMKg
aW50ZWwtc3N0DQo+ID4gDQo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+ID4g
N2RkNTU2MzY1YjBjY2JhMWYzYzU4MWY0YzQ3NDdhZDg4NDk3ZjQ5NjoNCj4gPiANCj4gPiDCoCB0
b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yMiByZWxlYXNlICgyMDI1LTAz
LTA3DQo+ID4gMDg6MDA6MjEgLTA4MDApDQo+IA0KPiBUaGFua3MsIG5vdyBwdWxsZWQuDQoNClRo
YW5rcyBJbHBvLg0KDQotU3Jpbml2YXMNCg0KPiANCg0K
