Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C44630E0CC
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 21:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419711; cv=fail; b=WhO/oHuofaareOM81cx5zceb8nOoSenkv1pcL+quvghsgg+lKPOB6XBYdg91FSN0yklW8Gfh0Z8KmXas1PoGG3N31xwA5S4snJDFWij8dNWvejt8QEltf9nZXl/o1IpNsgzl0tGZLEBNuWIyl2ZxTT6vHIcWIrx2hiu/mzhjZ9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419711; c=relaxed/simple;
	bh=8Y8lQU5ott9NDUaWARy5z2tqw65d2VEIraY74qewJ+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hjieZCVWorHefa+eSV1vY9zv1h0qfGf0nXPjnkDve7rSoNnxqtOXRX6j52zKT9jHTqorhNk3imJ4667WdM4EwMCK9+Cm0EYo1d8qczo7DIuWz5MKOaEIs3Pcx6nevUmIVrVySoZT5I0icUxWuwsqruJnqHa1cSjZD1/g+zpoNZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjfXdhob; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjfXdhob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419710; x=1820955710;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8Y8lQU5ott9NDUaWARy5z2tqw65d2VEIraY74qewJ+U=;
  b=UjfXdhob88fJs9zFiQSvtxhz+uU0fhK6nBKQJN8yUs7fD2Psv5ZFz4wa
   qyHBY9CcyFPu4rrIs9yC6F9FBVpTzsb5uEGatwhYwd+TVPZSYM+5dWfWU
   trB0npccWNL+tqxCS3Qwugb74ykDn+ZCa+aWrwOQOxGr9kqcgqy/nuSpA
   7wst1fy+CmDHYKFcvBHQ2NFL90GGFQugqZNkCGfxq/EMKpP9O3Uj+JdHt
   33X3RP7BWx8xqNenSjGN9faLIzoC5I0sKEzVVyt7LVL/VJVCiSHzNsSZW
   btzmxmfxQdedzKibjrGiYL+rIc3HJroYJeC9Y/qEhTyJrQjacWtRRwSJG
   Q==;
X-CSE-ConnectionGUID: kmL9wRYtSaO4+HyRWgNaZA==
X-CSE-MsgGUID: yQtP8W6AQEuAh0N86nSoNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93476125"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93476125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:01:50 -0700
X-CSE-ConnectionGUID: uUDPaXLBThGRk1m8l/YpcA==
X-CSE-MsgGUID: jYwAiTYfS/2TkZSY2LHqaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269067763"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:01:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:01:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:01:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:01:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQCoTuGkaYrQhVSFMEign/HYuBpKJWIOIMEef0zBufG6ZA93F4G325mtOZ6f9+04qIRZc20wJRzYc0a+i/WbQ5Z6B7PfLae61OrBunQEWAo8u8dchMd+670Wcbt42YCz6FZKJKt0CKYidy4UD7OcVZCGU45FoyUzhG28WjZ7LiEavucCDLDEYADe9wH699FUyfSKlGk2ldHv726r4Zw2l1UAxFBUmk389Yj41bkAzjmihNx14MPocscXyg6vJ5THzkRWWlf4805iham6rSSj0S5s3BVmFYNJhWBujc48xHgsxfJgvArqrTvZY3fPUFAkdg3GBBKF3qHfNU3RB7m6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QBYzG4DEMIfR269ofCwea3fA1M9T74pSnDmt2GeiqM=;
 b=KT1vMAJ/YYhiA40KaMvvXpXZJ4jLPZJWvhDpgO9WNG+oCu+OG2iwyJMV1haS7rZapZOIdEmZJktjoHJkzWoFz+Mz0GpPtfPxAXdp3xg2DcAZnl4IEejCiQaNHFnWl5U0iKjrCX0BR1VyJbEjtQl4JFIZUsgVzJ12eaXebppsjNRI5whuFJ0qvhDZyeOcTzEo+Lk/Fei6YFoKJZ2iTbma7nu22L8Oxowy7i5fVTF4yVn90frKBMvF/DTAn/rsMX4FSE3quRrITSEVtgAo/rCIfslEmw3d0n2+9oCcFuUh1S5BQJs+7Z/kWiK38xwfgvM2zvXnTYkaTXlHX6fCPjYqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SA2PR11MB4795.namprd11.prod.outlook.com
 (2603:10b6:806:118::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:01:44 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:01:44 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>,
	"Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v8 12/20] drm/xe/vsec: Update VSEC probe order
Thread-Topic: [PATCH v8 12/20] drm/xe/vsec: Update VSEC probe order
Thread-Index: AQHdQiniUN8I8eOnjkmyiui8MmWNKbbOQ2IAgABQjKA=
Date: Mon, 14 Sep 2026 21:01:44 +0000
Message-ID: <CH3PR11MB046149D4B42DDDBAC50301102BC1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-34-michael.j.ruhl@intel.com>
 <aqgc9KmHblQ1Xll5@intel.com>
In-Reply-To: <aqgc9KmHblQ1Xll5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SA2PR11MB4795:EE_
x-ms-office365-filtering-correlation-id: 9b02ef0e-6f50-4b4e-451e-08df12a361fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: NRD7q0CaRqFCkFrqMKR4qv5XJXiWgyPO7VFZ4ucIGbI6eiEAKj+ifF7XnzB2TFVxH8ZwWE6e/S7w6xRaiVYtJ7WXCntBj14CsaeCNydmB9jE4J9W9f/gnywm8uWYczMw8/btJZitkKQ3lKGYj6fjBibez0PgoRocUGrjlVvWUhhMrX7h9WNOyqma7DHLaFpZKqRAqdYjxXHcbtbQrIwlLsE6lmAdJtGir7spxSua/6VcJQkw26sMZcot+voyW1TE3fMAt/JFn4GYOWbStIzM5/GQB7yR8AHxBsJCYD4u6iBTDBG53mKB0R3RX9jOZFnubH1aOh4+hCHJdIo6YK1LQIl0C0bgkh+lJffnhzflr3Ybjh0kImhWpWLv0usnbOwTYrDV4Qybes/7cwUz2yvMRlQAbNPlNWhbC+cU0SNoxSXbDKxRCkk8ve9/+QTA7n6afHV47A1Ys8woE2yfTG6ie2z8iCOh9X6KnLro2pwiQxYGAYa9knFZtfzEjUbADs8Tim/fVOpno5bW34SOUUSZlF1LT3qtuPqSYA87lLCRqFf9zio2UY5KblNtOcP2cPzPMcT2cHag2yy8HYLepAaRt6hAw2UVWktpkhErTH50R8ufkaANFsbh7TyU5K0jOveb9bq/nN3OvVG35GmurgRHImphFMyVCFND//ONqynymXXzI5Lgo0QZsvMXAGRi3utBwarv6oUzoLdl+MgmKTUc87HiJ8f4Jwa9qIeURru+pe0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z3iLy/E9cvR/b0KOObJ1kNBdHmvkxi/kVrK20/IBt03o5eSXs/pBXQsynOan?=
 =?us-ascii?Q?WQp9p/PSanK/rZiF0bXJBI4wmgT30a5OqGrQhqXD7oYU6DzcrWldE/8gfuHy?=
 =?us-ascii?Q?13oqgx7Gb9scJ5nUoIh/uVZXSNT472HNOWJicrCMZDxQTUQCX5MTKkGlfwfd?=
 =?us-ascii?Q?VDdhm49Uw+QUAqMbVH1nYnM5H0SezZZbyvBk8g+cKkDi3ONYe8z+JYBbW1kk?=
 =?us-ascii?Q?ZZK1BLgGQOLLu+NvUBNRTXzTJL7EMWVqHSBpiuAyOKIzOFjIAnl9m1YpgreE?=
 =?us-ascii?Q?lU3qMOI271SFClrgZKnjltKYhn6nlJm0KhJjyLNlrlJ7Dg65HPLKcV0C/Usp?=
 =?us-ascii?Q?/EAg7+n9750gf08nIMpwZtsXKXnXX2AwAyW20vYclkHgGdfovV4yChSu2Xbo?=
 =?us-ascii?Q?LRyieXODsMG1N/AKm3RzVcnhbSjqkr3jExdLpeDe1VFcePQc3NmqC+K/eIRm?=
 =?us-ascii?Q?n4yws23wHuxVAITrpRV6pjbzG3Ne3Ot0a7NHVdRZuwuah1X8EW9BJ4lCNzta?=
 =?us-ascii?Q?amZurst6+STqa/KM3aeyd5k76f9AdJDkhNlvynXVqhu2l7Aa4CK6ERPe//JO?=
 =?us-ascii?Q?UeI9MXvGZEvCXEJMyAEKmRIH9V8t1ofWKsmcQqHI2sXQItCfQPuMtKbHkp80?=
 =?us-ascii?Q?WGxZ7SwMSol9wxTOkyNvtsV9NVkfOUcamGeLcmJw05wELix/aPzoC4S0Hcgp?=
 =?us-ascii?Q?eHPOz9nyEL0BlZ4C6fMn6jqe20pkVQKh2Ol3aCuIOMSE+Y/LQ9Yd4lbCyT84?=
 =?us-ascii?Q?BLBfOWsv71NcxmZvkbU45lTfX8gWBvtpFM8T7EJDJphXOFOj1F4ANaUgP4O3?=
 =?us-ascii?Q?oJ/i+Pp328UMhET8B64HvF/Ic02lbMAo3PkwftxtN4QRq/knLk0yBWpU+Nfn?=
 =?us-ascii?Q?sNpY5eFR6yQ7s3YzYv7ZlvVOnSmhNJ4WP7Vvsoye9ikXtgDuLDB2750Ks+oL?=
 =?us-ascii?Q?7vYRpcD4nqblw6yF4wm72qbNmt504IVxnxkagU7f9HLz3nKtocPvA2GSF188?=
 =?us-ascii?Q?Lk/nSPRLXRztBLiEEy1aGm6/Leo2tPFcJ9EcHiyq8C0+EW2wD7Ch/zoUgpv7?=
 =?us-ascii?Q?oLK13PaTNkfO1ALUnvygNJBwTFLSFRC5fcojfhEmDmlCu7LeseSFR9nQSu5x?=
 =?us-ascii?Q?HGaT6wod0kfavV2vTwZu3yLWFBcrTNg1RaBVlUOfMXc8OUW6tBfRtdknQwvq?=
 =?us-ascii?Q?ya/Lu5e67GGRnc4eNBiSKTICmBii1nyTk9snG/YiX4OHfw28pp/Gkh9DuWNu?=
 =?us-ascii?Q?JRwJPeLwfjONAgrk1DzmG/6g2v/3lWBweTziII4iYupOcdUU/+vL8aVZJUhy?=
 =?us-ascii?Q?h0X1LBXJyv31zQuNcH37hm1rQpX7XjBrJuUqbyV4jfX9UKgci2JH+/9kO692?=
 =?us-ascii?Q?qmDxK69TF6mScxZoVvF1pNsUvJABkY8uyNWc5a++Ou1KlrMHqPt+CWAcbyAY?=
 =?us-ascii?Q?gsOsrC2HGS22LIl7CWj9atnwDVJLuBvTqYHMjyeC7ZMdRpPWc7p7Fkd/Lho0?=
 =?us-ascii?Q?djaUQWNnsh9JihotK5U5KA/YyoeySecyi2Mih5UnmoWcAqEiUhuD0k/+6p+c?=
 =?us-ascii?Q?MwIkY/4Eq1iGWwyfblJ0CJ69nUrvIumoNSQ2/+tUQ9MhB11O5AElWuah6/+b?=
 =?us-ascii?Q?3DhzqtYc5r0SMtVQ5zGtwzSkIxHV2uBWjg5qINn5IvfBh0+1Z6jNQ9qwspFe?=
 =?us-ascii?Q?zlHUPjRpsbJl5Sac/7DdPyd2opH/beCIfYsszOaySwvtUiolhpZghO1rjpIg?=
 =?us-ascii?Q?CdliKFD0LQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PJ/nicKmTCBfom/sEKcjnlLddf9fnv9Lf10v1znQonWO+bHjWVrg/nEsRiZNWhujZtPN1VNoYm0KYcsbXWX//R2HSrrwQ0ltDC5/zdbIOScOvh0KmZKcWqX7HFUfVgOG54LrKVJgQWRBdvGH93H/b16MZ+z5/+BWYlXS/00WG04nTBXYU4LaBFsh/HoTm/A1D0WIpRudaear1vUlAS6GWmp8+FGJwEoPOpsnk3uXuCRG5GvHMgZcdjT1D6rShFTwWwsLOIh2kVWhtpPe3xxv/hX/0qm6xPnTDUBaBXTCSCKo3iWRSAE29fUzJOv7KXRMUH4ubJeBpn75Ie3zdc5S9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b02ef0e-6f50-4b4e-451e-08df12a361fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 21:01:44.2497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f04BA4mB5sy8JlWe6G0hbM358zhg1xNYo6GvTrPYqQCCKLz8dx5V9Ta98V+kMfFpdLhotLVlW9oq8VKRjxVYWmxKnHWUB9mKFZeO+eR/+U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
X-OriginatorOrg: intel.com


>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, September 14, 2026 12:13 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v8 12/20] drm/xe/vsec: Update VSEC probe order
>
>On Fri, Sep 11, 2026 at 01:12:00PM -0700, Michael J. Ruhl wrote:
>> Both debugfs and hwmon access the PMT data area before PMT is
>> initialized.
>>
>> Hardwired offset usage allows this to work by accident.
>> Upcoming changes will break this usage.
>>
>> Re-order the probe steps to initialize VSEC before the other
>> features are initialized.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>(Apparently this is the cause of Sashiko's race finding on patch 17...)

I think it is.

This also shows that I need to use a mutex in the cri delayed probe functio=
n.

That patch update is forthcoming.

M

>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>b/drivers/gpu/drm/xe/xe_device.c
>> index 205cb4e7f9e8..3ec950606e67 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1053,6 +1053,8 @@ int xe_device_probe(struct xe_device *xe)
>>  	if (err)
>>  		goto err_unregister_display;
>>
>> +	xe_vsec_init(xe);
>> +
>>  	xe_debugfs_register(xe);
>>
>>  	err =3D xe_hwmon_register(xe);
>> @@ -1066,8 +1068,6 @@ int xe_device_probe(struct xe_device *xe)
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_sanitize_freq(gt);
>>
>> -	xe_vsec_init(xe);
>> -
>>  	err =3D xe_sriov_init_late(xe);
>>  	if (err)
>>  		goto err_unregister_display;
>> --
>> 2.43.0
>>
