Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A12189F29
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723486399; cv=fail; b=Mk1X301BTc/H2LaEXwgpYru+s/PKKdx3IGZ7b7yQJ2awsVlmVcQBBb7cQHh8l1T4EiYeEUr1zPM+JvmYSn91PmYCahehpXEyOsGGzCQh8VqyhEeZQygD+K3snmIgfXJbOUt1HETGgDAxAgXyB34I8PzXrXJ5H4qMY0PAJAkUJrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723486399; c=relaxed/simple;
	bh=/r3bSldHqNRFA3wv9IrHxXDZ4f1t7FXLPGuAymqm4E0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iAxo5WdCy/0loTWmNQ+UYnt1pnyUNTT4ANPlOyEZkEjaT2Zq3MPfg7p9HF5dChmoZXAvjo/2uCaYtB0rpkbyba+uIdtP/AH7/VKLuk4LSWeomNW9FUvIzF/i71vKmST+gd0wL4kbkbgOPzTf28Mbm/Ud2ME8Tc39DoU37K+doFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9DOftjX; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9DOftjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723486397; x=1755022397;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/r3bSldHqNRFA3wv9IrHxXDZ4f1t7FXLPGuAymqm4E0=;
  b=L9DOftjX0FXnRittyfm34BhypsZrOKwMnahR7mRf5oI7I3LUvxBFDnbh
   psSiTX82gRqYHK9crkEVCq/i4RGWRg1fPAxXuuWmj/dQvDuoW5ak6KzFK
   o7EE+xHpWOCi8Lrev/9v7HvT++eUNMdp2lYgBTqfQDJIHqovxZifTlOCV
   o9Bz7B8RaiOwFqDTlKxZkExsDL4mXnj3gyroL0unmx5aF+eAqSq48vuty
   UqfIFQy9fOp0cic7ZuKeNvSQcVvDBwiEuiywHinF8TRaEg88GXRDcracL
   tB0SKx5TbjR0m3bR2f+ZNTQQ5rfNBgBE20E+vjuTbB75nMaVc7EWNALd1
   w==;
X-CSE-ConnectionGUID: ypXd5b6CSaKKynKOdWF+Ng==
X-CSE-MsgGUID: ttPJG9sUSgyVeClp3Z8K1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21262086"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21262086"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 11:13:16 -0700
X-CSE-ConnectionGUID: gqFDSwAuTuGYJC8eAMsfrg==
X-CSE-MsgGUID: H6ch7wE2QMuhMRxpMFkEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58001697"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 11:13:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 11:13:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 11:13:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 11:13:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 11:13:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N708L3N8Bir7S4ZIE/Es8S4Szuxd30Z1jquH+1ZoesQV2IsHGX4pLWJTWjEDgpMszOWW0QoU1AUSglKcuxJQdj3dnJlKIR8qX3al3kU/vASbvC3oa4KB8WJ99tjB20RRpP4lOwWX/+lXRUGFz0RjX+7bM2WmUKv5iI3pLgjUGjFg+rAE17EQkZasY36n8nYES2VcWa1ffyZpL+17TXfUhFIC0oGAojalqlV5D4qOezlR/2NEhvtwMEqj4GE+WEapPvN7747M85c8M7ikCLeHXOU1SvE2sW34H8gRfZSHgaG13hP/FuLw9vAG4zO5NRwhhtMKONqTay0Av0WMb2rKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r3bSldHqNRFA3wv9IrHxXDZ4f1t7FXLPGuAymqm4E0=;
 b=epSzVaO1XelvpGmQ9pngQV9gw9tNmkdPj1JkSwAesuI3gEo6l65KEEuIZdv0s9pNHmW+UYW/Tj7KCC0ljMR5z0K+EVYBcltkPuXjWMSGkIIUadrkvLXnlKuzPgO3jcp4/u3gixsNr74KCWQI9CjPkiF7PSJUOjxIW5C6VRZoOXS5//Ns5QoJjmzTNjpGg/m4LhipbIuTJVzw1djuGwizaHtyfAMiWd8sfJUnvd19ZCZcSjuEKLdi+T9zjQv1EnXS5NxUN0LvxZX7VLQrYOXd/HLk+bwJfW5TkE8sgfGWTqJ7W7SSDNZJqfOCJq7dDWlhmFy0M1zP3VGN8MvCp/ZZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.32; Mon, 12 Aug 2024 18:13:12 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 18:13:12 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Hans de Goede <hdegoede@redhat.com>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v9 0/6] Support PMT features in Xe
Thread-Topic: [PATCH v9 0/6] Support PMT features in Xe
Thread-Index: AQHa3o2TPxJDYIzB40uItE/qGBPovbIjyUgAgAA/WkA=
Date: Mon, 12 Aug 2024 18:13:12 +0000
Message-ID: <IA1PR11MB6418D8288EBC78FFD7F1E8BDC1852@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
 <bdc2990c-b09f-4e63-9961-9752324afb47@redhat.com>
In-Reply-To: <bdc2990c-b09f-4e63-9961-9752324afb47@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM4PR11MB6502:EE_
x-ms-office365-filtering-correlation-id: ceebb2e6-f04a-40f4-182f-08dcbafa6d80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T21Bbi8rdUh0NDZuV01jaFVWbjZMaFVTMTZrRVlCenZGU3FUeHB4ZEMvZTFG?=
 =?utf-8?B?RytNMkdIUzRnV0h1VlU4S1N4UVNCd3hZVC9EQ1hYRjM1OWpOZkdqSHpQQUk5?=
 =?utf-8?B?KzBHMXVSdW1iMFhlRDFIRWI1N1B3d3gzeVEvajhCS2Npd2FKczY3dHRpVjNu?=
 =?utf-8?B?amhRaS83NFh4ckpZR2loaHdFRWtZbnlrMk53U2g0ZTQzeHBRblBhUFBpaG1u?=
 =?utf-8?B?NFNmVklJQnFpMWtBTS9GNHRwWXBRTXprcEhpTW9makVVd2dQYllGMUlFdCs1?=
 =?utf-8?B?RGNDQklQSkNDRFZBQS9WSGl2bytIcUh6RHppRGp5MWJKdFBlRTJEMHRVY1NL?=
 =?utf-8?B?a0lSamRyUC9nT2JRYlViSHMzL1lBYXlBd0hiYlppTkxyZ1h5V1ozQUtNRWxE?=
 =?utf-8?B?ZEpEakpwMnNoVFlBOUtoTE5kdmpiWWNVMjQxL3lhWFZCQVl0NXBuU2s2eXlv?=
 =?utf-8?B?R1lsakZGQUVFUTRrMm5vcXY4NjNxK0pCYjVqWGZnTHB1SWhqdnBQbjY1NkJE?=
 =?utf-8?B?Yk1ubTZUd3JxSU04c2Zncm5FbTVpZ0ZIRVEzbWcwQ2lWZHhZdFdWRHlJQXRk?=
 =?utf-8?B?WEhtSWlVMDlKN1U4YU4vdlNMeklvbk9aR3FLODhVYStnQnVpWEJvdjhZYWJX?=
 =?utf-8?B?czl5aDkvZ2haME5RMmEwcEFQaDFtS3B6cWFldHZnbW84MXc1djlyVndyRklC?=
 =?utf-8?B?eHdCMDFkRldvM3RtZ1kvYVJ4YzJIdkNHWkV3NWZPRmtxVTR4S3JYeDI5eENT?=
 =?utf-8?B?VWNKRjV2WEppQVZER0plYjQ5K0hBb0JTTGxZL0JWek5FM3JubjUwNlAwUjlV?=
 =?utf-8?B?L0RiVU1LTWRVM0pabE5MRlk0aFF1RWhoaWpLRVl6dVlLejlranJ4U2xJL2kv?=
 =?utf-8?B?RFN4ZXg1ZGtHRnhZaTVIK05JaXRvV3k2TFFpU2FjS1IrNEMyamNObmlieXov?=
 =?utf-8?B?Ykh1cXgvSndOMEc4b1Q2TjFONGo4bThXRVJ2OUhKRG5ZNEczbVNFRG42ZVM5?=
 =?utf-8?B?RThsVzJWaHZQUkhxZU90RXBnV09sL0lnVitVOW9OaFhHbDVEbFRzeFF5ZUJl?=
 =?utf-8?B?RVBPd3ZQdWFUK2VIRkI1d3JKZlpBcTR3M2dxWXpaZTdhcDhTOWFMZEVmUm02?=
 =?utf-8?B?b0R5VVVwOHVBK0ozTEM3czJ3ZXRKanBKWEtQNjdVU29pZkpqQmdTNnR1b0lM?=
 =?utf-8?B?QTd5b3k1a1pJRlk5NGNYeURuMm83VDhiZHpxRUhKVDZvUHBzd0FUVytrQzVl?=
 =?utf-8?B?YXRyYVI5Y3p2Q3p6KzArMXdLd000MFpNU1oxSHVzZzVkcEN0OUhkV3JiZkNx?=
 =?utf-8?B?cWd1TzN6SGg0WU9QeHhXaDkrWCtWRE1OS2d3d1plM2JHUVltcXJ5a2dYUDVG?=
 =?utf-8?B?T21jV2p2M3orejh1ZE04eW9tZkJkOHBnd3gwUWlOZGVHWC9heThRbE5JMTdR?=
 =?utf-8?B?NGorMjBZdE1IQXRwZjAzSUhMVFhid3Bua25OL0V1cDlYd0FiekhRZWJyZXlL?=
 =?utf-8?B?Y2VJUEtubmlyVy8wa2FjaytFQTNhRXMxRlBqeDVId01SM2IrS2daSkhYbFRv?=
 =?utf-8?B?aHNPbGtYNnluOGprWmNxdnNOSmtOMU1SazZqNXp5MWtXcUxsNm5NYm9oK1ky?=
 =?utf-8?B?Mk8xMy8rRFJKY2pHRGVCT3I2N1UxdzY5WDRMcTJFVm5HZjduWmQ3VlcyUjF1?=
 =?utf-8?B?T0xMLzlWL3ZRd0tTZ3lRRXpIcVJkS1R4WjF6S0t4NXJVQW1VZHVwS2xHVnJP?=
 =?utf-8?B?alBndHdYWjdvaTdsbVNUL3lPYVkxVTEwY2ptWkZqQU90Z0JVeHRuUmQ2QkpD?=
 =?utf-8?Q?RsMUR7xZs26snS3xMdfDHV42Oi75FLWPWOURM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWR0SkR4SmQrRlIyMUgrN2NoZkpKL1NUMG9ycE9DWTZOcmF6VkhWWGxHOGRE?=
 =?utf-8?B?VkdtS0pKQTUwRjU2K2FZZGVVNVowbVdXTlhjclUzeExmNENYeUhBNjc1eWZH?=
 =?utf-8?B?SnlxU2NoUko3YXM3QnQwclNhYy9hUnpuVllPc1pRRnk3RzdPRm42VzlRckxS?=
 =?utf-8?B?VzFPakFXQm9BMFN3NkNleEhLSjZtOWdRVGMvVHBwaVJMc29XcGNqM3NSbno3?=
 =?utf-8?B?dXBxaE4vaHdvaXRNK2xCVkRaU2pzWkpiZFBSNndGOEVLb3Zya0d3VzVVSEdC?=
 =?utf-8?B?VDZiaWpkeEN0STllbTVQeUY3MjdoV0N2Slg4REZFcVZFNlJNVjg1N3BJMUdo?=
 =?utf-8?B?Wm9xNW8rQlpJVTFrZ1hETkhhSlBWYzdibzNRcHZUNDY1OTVqUGlhRkdvb3dC?=
 =?utf-8?B?NnBKVjE5bHBHbjQzWWRJdFNWVVNvSE5XK1g2Y0xULzUrcW1sZHNQeG9HSlZZ?=
 =?utf-8?B?RHh0QXdIcWVIOC82YlVKNllicmtKOEQxRjV4d2Q1VDJQUjlSdnZwT3VyKy9j?=
 =?utf-8?B?czE5RWVQcW1rcklEVlorTXJoQjQxZFpGZ2lzdjdGcm5jTmZxUXgzL2dqN0Vl?=
 =?utf-8?B?anFLSFFsR1ZxcDhtdlJhbnNFREVaTFpJVEovd0FXa1FvU1F0TVhrTnNyTTVI?=
 =?utf-8?B?RDFPVUlDdDZtWTVjaDlobXNJNVZmUHR5b1piTDlkeEpjckVETjYrbHZweFB3?=
 =?utf-8?B?TnhvUHBCSlJObHcvekhRcERNR3FydmF2WGZsSTE0RC81dVJIeDYxcDVXSWhi?=
 =?utf-8?B?OWZWaklDRHpwQVhmKzhZVjdaMUYxM1dEd3hHaTJYc0psREN6Vk1xc0JqUTgx?=
 =?utf-8?B?eXY0ZU9KUndNSHV4cTZYdktQN2dselFoZUNEcjNkRDhZb3BjcmNxQlY1TFJ6?=
 =?utf-8?B?MFRRT0toRXNiS2dDMlNJT0d3ZXJrQkNrS0lyQXFoWTN4WUt3ejZMM1FxTFNa?=
 =?utf-8?B?MkdqUW9GNU1MS2dZdlY0YWx0T0ZFV205ckplaUxwVDQwSmJWUTJBU0V2LzIr?=
 =?utf-8?B?R1hlZUN0UVdBbi9mWlkrOW4zMXVXWnQ5V05SK3U5QmhMM21RcVNZWUd4dmJJ?=
 =?utf-8?B?dFk5ZEFlTjlzQjVERjVGcTBqMzlmWWdRc0ZHcjlkc1hITUQycnRlMHNFUGJa?=
 =?utf-8?B?SmhMQlNFQWcwM083aEgrK0xQSCtkNFozRzRVU3FkaWVMUzAwU0JOaElUbytP?=
 =?utf-8?B?SEFjUFNwZlNnSVpLbkxyOEJjdW1jQW1qSFNwblhtSVNrL1NySENDZDUyMnEy?=
 =?utf-8?B?bFR4SElSOVdLbUhFbU5pb0xOUUppTnl2eXprQzBiZXIzdmxnZ01ERE1TY1FO?=
 =?utf-8?B?NFZmOHJ2S2VTV3dzYmZqd3ZVR2E0L3pYSXIyYW5mRlJ5YUlBN01CMUJZdUJI?=
 =?utf-8?B?TEZuZFVtSnAzZkVHOUFiaEo0SXI4NkVVeG1ycmZ0bUhiWVU2ODQyT2YvYVQy?=
 =?utf-8?B?cGM5UWFFK09UK1VjQmppMXUvOTIwV21hWlhnOFZndnM1YWoxUXhGbzBobFZn?=
 =?utf-8?B?UDlsT1JDYm9LRHNHeGdFRVpubWtBRWdMY2hXa3FQUVBKM1FWK0Y4MGlWbG1U?=
 =?utf-8?B?aThpSkgveVdsRjVueExGdndBU0ZwMXFDamZid3FId2lUMmFWZWN3NmpLTDBu?=
 =?utf-8?B?Z2FUU21xQmlTa3JRRlp4Y0ZpU0kwMFVGRW9YUy9lK3NsMFZQL28rbnlWRnc3?=
 =?utf-8?B?OFhodjI0UXV6Nk1RTkRoS0ZMcDNBV0dLeFFwSUFhaGl3dEhrQ1JzQ29hRTVQ?=
 =?utf-8?B?OTZQMzNDN2k4RitON0RTYnJ6U2FhTjhYV2NuZ1hreDRoQ0ZQdW5teDFVY2xZ?=
 =?utf-8?B?OXFlNjhXNU42cEdTQUNURnNsUmp1bktMR1dIbVBJcXhTUkVGRjh3RG1UWVZs?=
 =?utf-8?B?eWFhaTlSZVVHSDlYOEFMdS9FU3MvRXZOaXBkdmUzcitMZ2ZZcm01cGhsQXBw?=
 =?utf-8?B?RXJ1a1ZXZVhGVUVEdUtTZUk3SFkyNW5JMFlHem9qaXhlS21BRGJaOHNiclZH?=
 =?utf-8?B?OEpLR2t0WC9IcGFSenBaMS9MQjExVDZTU09rblAreXc3YXh1MDJvb0NlNEgv?=
 =?utf-8?B?USsvZW9WRWlpeUxrcVkvSFk4S2p3aElFQXRrZXNtaEI4WVBIajRWTzdsSERX?=
 =?utf-8?Q?HwQ48dsO7kKe0ZhwzipmXRlIl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceebb2e6-f04a-40f4-182f-08dcbafa6d80
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 18:13:12.1041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yL1+mBbBLBMugoiFH/YYRjcmmSsgjA96D3pBbFda/iMZ0fvoYuCMMwfUqqWt9pAE7ER39RGZ+EM57DoS5htdCdjYBPO/8IXlQvOOKlZDwWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
X-OriginatorOrg: intel.com

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDEyLCAyMDI0IDEwOjIz
IEFNDQo+IFRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2Vy
Lmtlcm5lbC5vcmc7IGRhdmlkLmUuYm94QGxpbnV4LmludGVsLmNvbTsNCj4gaWxwby5qYXJ2aW5l
bkBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT47DQo+IGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY5IDAvNl0gU3VwcG9ydCBQTVQgZmVhdHVyZXMgaW4gWGUNCj4gDQo+IEhpLA0KPiAN
Cj4gT24gNy8yNS8yNCAyOjIzIFBNLCBNaWNoYWVsIEouIFJ1aGwgd3JvdGU6DQo+ID4gREcyIGFu
ZCBCYXR0bGVtYWdlIGhhdmUgdGhlIEludGVsIFBsYXRmb3JtIE1vbml0b3JpbmcgVGVjaG5vbG9n
eSAoUE1UKQ0KPiA+IGZlYXR1cmUgYXZhaWxhYmxlLCBidXQgbm90IGluIHRoZSAic3RhbmRhcmQi
IChwY2kgZW5kcG9pbnQpIHdheS4NCj4gPg0KPiA+IEFkZCBzdXBwb3J0IHRvIHRoZSB2c2VjIGFu
ZCBYZSBkcml2ZXJzIHRvIGFsbG93IGFjY2VzcyB0byB0aGUgUE1UDQo+ID4gc3BhY2UgZm9yIHRo
ZSBERzIgYW5kIEJNRyBkZXZpY2VzLg0KPiA+DQo+ID4gVGhlIGludGVsX3ZzZWNfcmVnaXN0ZXIo
KSBmdW5jdGlvbiBhbGxvd3MgZHJpdmVycyB0byBwcm92aWRlIHRlbGVtZXRyeQ0KPiA+IGhlYWRl
ciBpbmZvcm1hdGlvbiAodXN1YWxseSBmb3VuZCBhdCBwcm9iZSB0aW1lKSwgdG8gYWxsb3cgdGhl
IFBNVA0KPiA+IGRyaXZlciB0byBwcm9iZSB0aGUgdGVsZW1ldHJ5IGZlYXR1cmVzLg0KPiA+DQo+
ID4gQmF0dGxlbWFnZSBoYXMgYSBzaGFyZWQgbWVtb3J5IGFyZWEgKHNlbGVjdGVkIGJ5IGluZGV4
KSwgc28gYSBjYWxsYmFjaw0KPiA+IGZ1bmN0aW9uIGlzIHJlcXVpcmVkIHRvIGFjY2VzcyB0aGUg
YXBwcm9wcmlhdGUgUE1UIGRhdGEuDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gtc2Vy
aWVzLCBJJ3ZlIGFwcGxpZWQgcGF0Y2hlcyAxLTMgdG8gbXkgcmV2aWV3LWhhbnMNCj4gYnJhbmNo
Og0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZHg4
Ni9wbGF0Zm9ybS1kcml2ZXJzLQ0KPiB4ODYuZ2l0L2xvZy8/aD1yZXZpZXctaGFucw0KPiANCj4g
Rm9yIHBhdGNoZXMgNCAtIDYgcGxlYXNlIGFkZHJlc3MgdGhlIHJldmlldyByZW1hcmtzIGFuZCBw
b3N0IGEgdjEwIGJhc2VkIG9uDQo+IHRvcCBvZiBteSByZXZpZXctaGFucyBicmFuY2guDQo+IA0K
PiBPbmNlIEkndmUgcnVuIHNvbWUgdGVzdHMgb24gdGhpcyBicmFuY2ggdGhlIHBhdGNoZXMgdGhl
cmUgd2lsbCBiZSBhZGRlZCB0byB0aGUNCj4gcGxhdGZvcm0tZHJpdmVycy14ODYvZm9yLW5leHQg
YnJhbmNoIGFuZCBldmVudHVhbGx5IHdpbGwgYmUgaW5jbHVkZWQgaW4gdGhlDQo+IHBkeDg2IHB1
bGwtcmVxdWVzdCB0byBMaW51cyBmb3IgdGhlIG5leHQgbWVyZ2Utd2luZG93Lg0KDQpIaSBIYW5z
LA0KDQpJIGp1c3QgcG9zdCBWMTAgb2YgcGF0Y2ggNCAoZnJvbSB0aGUgYWJvdmUgYnJhbmNoICJy
ZXZpZXctaGFucyINCg0KNSBhbmQgNiBuZWVkIHNvbWUgYWRkaXRpb25hbCB3b3JrL3Rlc3Rpbmcg
dGhhdCBJIG5lZWQgdG8gZGVmZXIgZm9yIG5vdy4NCg0KVGhlIGNvbW1pdCBtZXNzYWdlIGxvb2tz
IGRpZmZlcmVudCBpbiB0aGUgcG9zdGVkIGVtYWlsLCB0aGFuIGl0IGRvZXMgaW4gbXkgdHJlZS4N
Ck5vdCBzdXJlIHdoYXQgaGFwcGVuZWQgdG8gdGhlIDxjcj5zLi4uDQoNClBsZWFzZSBsZXQgbWUg
a25vdyBpZiBJIG1pc3NlZCBhbnl0aGluZy4NCg0KVGhhbmtzIQ0KDQpNDQoNCj4gUmVnYXJkcywN
Cj4gDQo+IEhhbnMNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiA+DQo+ID4gVjI6DQo+ID4gICBSZS13
b3JrZWQgREcyIHN1cHBvcnQgcGF0Y2hlcyB1c2luZyBhIGJhc2VfYWRqdXN0IHJhdGhlciB0aGFu
IGENCj4gPiAgIHF1aXJrLg0KPiA+ICAgVXBkYXRlZCBHVUlEIGRlY29kZSwgZm9yIGNvcnJlY3Qg
ZGVjb2RlLg0KPiA+IHYzOg0KPiA+ICAgRml4ZWQgYSBkb2N1bWVudGF0aW9uIGlzc3VlIGZvciB0
aGUgcG10IHN0cnVjdC4NCj4gPiB2NDoNCj4gPiAgIEZpeGVkIGEgZG9jdW1lbnRhdGlvbiBpc3N1
ZSBpbiB0aGUgeGVfdnNlYy5jIG1vZHVsZQ0KPiA+IHY1Og0KPiA+ICAgQWRkcmVzc2VkIHJldmll
dyBjb21tZW50cyBmb3IgcGF0Y2ggNCAoWGUgZHJpdmVyKQ0KPiA+ICAgQWRkIHIvYiBmb3IgdGhl
IGZpcnN0IHRocmVlIHBhdGNoZXMNCj4gPiB2NjoNCj4gPiAgIEFkZGVkIGtlcm5lbCBkb2MgdG8g
bW92ZWQgZGF0YSBzdHJ1Y3R1cmUNCj4gPiAgIEFkZGVkIHJlcXVpcmVkIGluY2x1ZGUgZmlsZXMN
Cj4gPiAgIENvcnJlY3QgdXNhZ2UgZm9yIEZJRUxEX1BSRVAoKS9GSUVMRF9HRVQoKQ0KPiA+ICAg
V2hpdGVzcGFjZSBjbGVhbiB1cA0KPiA+ICAgUmVtb3ZlZCB1bm5lY2Vzc2FyeSB0eXBlIGNhc3QN
Cj4gPiB2NzoNCj4gPiAgIENvbW1pdCBtZXNzYWdlIHVwZGF0ZXMNCj4gPiB2ODoNCj4gPiAgIEFk
ZGVkIHNvbWUgci9iIChwYXRjaCAyIGFuZCAzKS4NCj4gPiAgIFVwZGF0ZWQga2VybmVsIGRvYyBw
YXRjaCAyIChwcml2X2RhdGEpIHBhdGNoIDUgKGJhc2VfYWRqdXN0KQ0KPiA+IHY5Og0KPiA+ICAg
QWRkIHIvYiBmb3IgdGhlIFhlIGRyaXZlciBwYXRjaGVzDQo+ID4NCj4gPiBEYXZpZCBFLiBCb3gg
KDMpOg0KPiA+ICAgcGxhdGZvcm0veDg2L2ludGVsL3ZzZWMuaDogTW92ZSB0byBpbmNsdWRlL2xp
bnV4DQo+ID4gICBwbGF0Zm9ybS94ODYvaW50ZWwvdnNlYzogQWRkIFBNVCByZWFkIGNhbGxiYWNr
cw0KPiA+ICAgcGxhdGZvcm0veDg2L2ludGVsL3BtdDogVXNlIFBNVCBjYWxsYmFja3MNCj4gPg0K
PiA+IE1pY2hhZWwgSi4gUnVobCAoMyk6DQo+ID4gICBkcm0veGUvdnNlYzogU3VwcG9ydCBCTUcg
ZGV2aWNlcw0KPiA+ICAgcGxhdGZvcm0veDg2L2ludGVsL3BtdDogQWRkIHN1cHBvcnQgZm9yIFBN
VCBiYXNlIGFkanVzdA0KPiA+ICAgZHJtL3hlL3ZzZWM6IEFkZCBzdXBwb3J0IGZvciBERzINCj4g
Pg0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
IHwgICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jICAgICAgICAgICAg
ICAgIHwgICA1ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oICAg
ICAgICAgIHwgICA2ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyAgICAgICAg
ICAgICAgICAgIHwgMzAwICsrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdnNlYy5oICAgICAgICAgICAgICAgICAgfCAgMTMgKw0KPiA+ICBkcml2ZXJzL3BsYXRm
b3JtL3g4Ni9pbnRlbC9wbWMvY29yZV9zc3JhbS5jICAgfCAgIDIgKy0NCj4gPiAgZHJpdmVycy9w
bGF0Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmMgICAgICAgIHwgIDI4ICstDQo+ID4gIGRyaXZl
cnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC9jbGFzcy5oICAgICAgICB8ICAxMSArLQ0KPiA+ICBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY3Jhc2hsb2cuYyAgICAgfCAgIDIgKy0NCj4g
PiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L3RlbGVtZXRyeS5jICAgIHwgIDIxICst
DQo+ID4gIGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3Nkc2kuYyAgICAgICAgICAgICB8ICAg
MyArLQ0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC90cG1pLmMgICAgICAgICAgICAg
fCAgIDMgKy0NCj4gPiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdnNlYy5jICAgICAgICAg
ICAgIHwgICA5ICstDQo+ID4gIC4uLi92c2VjLmggPT4gaW5jbHVkZS9saW51eC9pbnRlbF92c2Vj
LmggICAgICB8ICA1MCArKy0NCj4gPiAgMTUgZmlsZXMgY2hhbmdlZCwgNDI4IGluc2VydGlvbnMo
KyksIDI5IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZzZWMuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZzZWMuaCAgcmVuYW1lIGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3ZzZWMuaA0K
PiA+ID0+IGluY2x1ZGUvbGludXgvaW50ZWxfdnNlYy5oICg2MSUpDQo+ID4NCg0K
