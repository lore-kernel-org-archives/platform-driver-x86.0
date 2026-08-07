Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA39A43E486
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133755; cv=fail; b=lHmK1zNfnqBeKCvil2qoOa0Baoyq+Bqh4blCVU5z0qWExdNIbAUIibEvXv0/o4qOmjBTqx7s/1mxRA2mMmeOLcJWbEZefwpZXvA0qUGO3X8+a22EMQGWZCHyqXhW8FTGjNZ231a5DJcOZylQQ1LPu+F3HBxqi9zdc4yihqtML88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133755; c=relaxed/simple;
	bh=VRMcJneQXF8dOLjdLKPOY/0gdjyE9hdm9yn3bc9/Ris=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HLH9TPvLOES+sULUH6AIQaO3/zQcKUtTewDLmUjEsfoBu3otMNqckmmsg9si3ZZnHPb6MHU+xo8Wi1va7JWYYNjr0FXWlXH+1Z8HttaZPAmNRPE5kIvkPqB7yt5wb/vzkm8EdtXqULJ5mvXY+NVeCEdV6fD0/+0IX93uzRuKLHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7kfWzVJ; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7kfWzVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786133752; x=1817669752;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VRMcJneQXF8dOLjdLKPOY/0gdjyE9hdm9yn3bc9/Ris=;
  b=G7kfWzVJqfx+pO7evFwTyEurwYlCgNgadNh5FghY/w9tJMs04Xqj72Ae
   4U3nTw+ENPqFCC3TrTFNKz2AQuNhZkA+7KLFh3DpEv1UZZi1eIx5IkpJr
   rLr35dcTVs4DYPu2zkKaFjg+AiOu7pySxuodYTjcGlAd0ZXfRGlsx3idw
   MJQZnVnC35WWOaqSWxAuzukBK2drQlrFDAFt1IgRBwqiSNKDSzHDXqJTX
   Cg5XWdQs7tvSqfPAaelp857CCS/m8/6w/t0s6NMurM93yfnQOcUH+pyOh
   ZN6DPW1i/YZpTxu6srQfc5icxNEu5wioWomBnk0OEQtqYaLmN1/bQhfPl
   Q==;
X-CSE-ConnectionGUID: +XYeGAcgT9+z1fXkpTEa9A==
X-CSE-MsgGUID: vYR01OOzTpaihssyXzlAiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="104282449"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="104282449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 13:15:52 -0700
X-CSE-ConnectionGUID: AwlKb/OSR5CldDOc6lUVGQ==
X-CSE-MsgGUID: QPG2CPe4TLqCYhTofz714A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="261959629"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 13:15:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 13:15:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 13:15:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 13:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VK6FgNm0WJkNSuN5hBufV940Q5vnsMGv3MNB6rDMlPHYknrOSDGHSy/jPkDCuoWuUStpgbjlXJJLihExaWqJbfnocG2M+I0iTu/bJA2cr/cxuER8B8Bq+KCLUWPkau6gHf13LM69Rw/NfTWm51BT9pgYgJLGiB+Q9EETLWeo4/Bhh8wY3maDN+1SUwAIuHfFOg6ad+tJ7BSMxnTr6hXhxGpxzePqQt8rSkHTZgTHhbSuJh2tvr9A17gxsthMbWKddzV0tW8JB9pqlQlwZ0X7DIjYoFKUkG+5bohAx6hJ0jf5j/zrl2ngURU/gSeJNsb/sWGjKsrRVDc9ZzSbTWmtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRMcJneQXF8dOLjdLKPOY/0gdjyE9hdm9yn3bc9/Ris=;
 b=iwwjDr3BZPEAlJSfjeG2lMBYM+R+hVoPrfHvv6W+qCYexm7Ef177ZFn9mXX8YC1iKPz4JrtuRFrpG+jZnJpBs+Scn0+6zRi00msisZTJYkFAeQOmnH7SHU4yqBc7qGKF0Cgpz6rpmXPurEUdRsQLX+sTJOTDV2QwW7W28C2+5wYjRRXDQpYOZoL13V8H1vrnLyMI43vU64RWuqkwUVXMFhSnesrJQrEtdkhIGqs4a36sb72ZGTle4xQN7HDBE6QNk8q3mNldvQHnX9MMpbkV9saMPzE6Cq01aslXDQ+Pm3H78zcRenZu7AViokNjdaRSairu7CjOeVX0v3HbSXODnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MN7PR11MB215295.namprd11.prod.outlook.com (2603:10b6:208:5ee::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 20:15:49 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 20:15:49 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: RE: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdJavP5dc5m7zyT0qaUBEby1ya7raRj8MAgAEN8oCAAFsTgIAABHUAgAAJ6pA=
Date: Fri, 7 Aug 2026 20:15:49 +0000
Message-ID: <IA1PR11MB64183A9D5A877BA218CD11C4C1D12@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
 <20260806135820.1422040-15-michael.j.ruhl@intel.com>
 <anUBkmSjMOA4wlFk@gsse-cloud1.jf.intel.com>
 <IA1PR11MB6418FD68599875714B8F2B88C1D12@IA1PR11MB6418.namprd11.prod.outlook.com>
 <anYwa4ToCUncHAdc@gsse-cloud1.jf.intel.com>
 <anY0KC6H0BTWh/Dp@gsse-cloud1.jf.intel.com>
In-Reply-To: <anY0KC6H0BTWh/Dp@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MN7PR11MB215295:EE_
x-ms-office365-filtering-correlation-id: 139c26f9-a2c8-442c-3ddd-08def4c0ac43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|22082099003|18002099003|10067099003|4143699003|5023799004|11063799006|56012099006;
x-microsoft-antispam-message-info: eB/PAbwV/OfP5g4CiyWHL9uhZ3oiVzT8zEgqlKDl6oDti8ehkbyGJXafEyQ9COxX7BxzskrwQKXc4uGbBvLRO40nuxCMKOdSoPzqFcH5/zlCxboIZqJ5A/kxxa9eEfENJWVfh47e1G820rAPy5WFuZLwA38ujAthxMqF/Sy/61r/O8LGspoFgQdFJD3vyBzgKQeCHNp7vV06D+iYZ8kFvQniNW0ThnlwlnGvBNS3xo61tJ72xOQz85pkEb9H7y4f5PrBtiE6nLOoZtmLrX4/hD6KcOt34JHmcjUQT3+OEhegt/WdDJ7Xp1pv7TNTTu8UVXrcPky4e2P0GRRFZu09FooMNrv9YrLLUjW+petGm3p5cLKERVWwdxQQPqfaOoz0tKNg5Wdi86WDQtlAPmpZVINh5ZK9zNxvuAY1tPhRwUFEgMeaQEXnKQyqD5PPPr0S6mRmxP4mMOape0Ns7Xe71CAsgMQA3CYgj0OaaGDAnvF9grAko+HxOUu12N0SsFlodB2HAMFCoGP0HVFgl6VGiXbEBBuGoMB+by69gAuK4LIpbhuepX5HrQ4sBCW0Grk/FroqeVIs5pYlbQFT882902cPtqK8OJrNbUJ8aOo5UPJjydo+WG6EQIUnrv27zZc35xYXupWqu+gNDuUyCvjfWZdd4ZZJjC/4VWC+W1Qcq/0z8gT+1IwoLMTVD1TbZr+lgGwLSRwhzsXFFTpAoEgT245/qrqbK1NkuBQO9Kyxq1Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzFkR0F4Sy9rNXFMajNaa3RZT1lPQkVTWTN3cDdNWWVXRWJmVXlXcEJwSEpp?=
 =?utf-8?B?R3VoelMvaHByZWt1aGMvejdnYU54SWE0Njc2STErcTNUcS9NZ0J5STZoWUox?=
 =?utf-8?B?Z2xTd2RNbFM1d29kUTk3UnRkYmdyTmJoR2VuRmhIbVVjcE4yYWQxcmJxL2Zk?=
 =?utf-8?B?ZWpYaVFkMCtpQ1hhekNwV25pTzNWU3BpMHNJakFBenYvckxEVk5XckhHWTRI?=
 =?utf-8?B?TnVIUUVZNDJDbHdmSmQvbk04ZFdaUDdnb1ZGcTZWeUwxRzNESEZtMU5kbzlO?=
 =?utf-8?B?OEtsbythOGFwQmY4VkU0WGpGa0o5bGp6UWFwbzY5UHV6MXJML2VCSlZkdDM0?=
 =?utf-8?B?YmtvSEx1a2VXSUYzRFRWOTMwSnlxMFRBdU1kbkdZMzZiNDdJeFcybmVGK3Vr?=
 =?utf-8?B?NUhFUk45M2ZuS3hMQXprSGI5bUpta3lBWVlQRy9jK2owL241WCtaQ1VHTzRh?=
 =?utf-8?B?UnExUEsrVURNTmhuUCs5aHh2dVg3cDV6eURKSit5TmNURzBHNXh0M1ZHaWtP?=
 =?utf-8?B?ZVZLN0xJOGk4OWc3b2puZ1lsMXR1ckdJcVhzU1BWMktFeHhHT2JKNFhMOXhT?=
 =?utf-8?B?dmVIUG5heGVLRWhENlpLUFNNYXVXL2FYd1FXR1lnOGJJaHNBNklSV0x3dUZa?=
 =?utf-8?B?bnVNWWkxRGRFQ3FsRlJVSjJQanN5clRNLzZXc2ZQWG5aQXdvVGllbkN3dUVo?=
 =?utf-8?B?RkpXbUxTdnNRY25lUHJWbktFbjBnZHphSEk5SFZEZDYzaEwreVVzQTlpQlpw?=
 =?utf-8?B?YnRJQkt3MVB3NjVFOFVwUWh6Mi9Pbjk4dzUyd1NodWUyTEJLckd4SzdmbGhF?=
 =?utf-8?B?OGprTDRRMGdkdzUwNXY2TWxoVVhkQW5rYis2T01WRmZvcU03bVBDaSsyaTMr?=
 =?utf-8?B?ZkdzNkFMakk5Y3pIMGZ3c21EZXVIbHBieTk2TWt4aHpHbFZnVkVnK2JxaVF1?=
 =?utf-8?B?MFR1ZmJOd3RmenpEODRSZ3NPU2tCVVRBbVJyb2RISkN2Z0xiNk0yTndDYjBE?=
 =?utf-8?B?TENTUnNNRUJxd3ExMEtEK3h1SkpXYkc2LzRwazk5eTNXUEwrWWlVYUUxSmhR?=
 =?utf-8?B?djBPOGxoRWZIcFcvR3FFUTE2MWJNOHloYUw2QzJ1NkJRK3V5MzZLOVN1UUFs?=
 =?utf-8?B?K0NSZjYveWxwT2ZmVlFyN3RyamxKMnJSWFUxY1Y1R0R6SGl0MWpic3FmNm02?=
 =?utf-8?B?emRXM0kyaUsxa0dheFhiMjBrVmFkU094QTg1VEg4ZG5GWHc1RWhWZ05lOUpS?=
 =?utf-8?B?aWRPbWtyazRIOWc4SUpTT0VpL1BTY0VhK3BKZXhTdkhLdm1vOEc2S0lGS3gv?=
 =?utf-8?B?RDQzckU3R3NWMWpsZXhnSEF3a0h0RXlFVHZ0V2pYY1d0WnJiUU1ETE1tKzRx?=
 =?utf-8?B?RHVKSjhmQ1hoWUUxekdsWXJjZEhiV09XcU1Nd3hlcFlzZzJzNkZtbnlqRFJN?=
 =?utf-8?B?NHd1VlpYSW5zWXczOVYzTVZoVFJlUUpreENBdzNoaVdqc2pTRXduYkNkQXcr?=
 =?utf-8?B?U3kwaCtPaVk1S0xvcUw4SWJTY29CL0tqU25WRDlHeFFWS1J4dU96cU1JdHkr?=
 =?utf-8?B?YlZjaFk2V0h5NWVBMXdzbnRHTHRIV0I1TnVxaC9ZY0NYOXFKUEhPMUJmSi9Y?=
 =?utf-8?B?MWtFTzRtY1lYQm9nZUVQVmFkOXZSQ3V0L05tZzR5cVdKckdaYW1BQlp1Unlw?=
 =?utf-8?B?N0VRaUM0cDYwZndsd1lPMmswRkNNM3hyd0dLcmJOb3IrWlppVHpIeGxlR1l0?=
 =?utf-8?B?TmFvMVRjcHZnbmtqQ01iN3JkS1pWS2RtMlB5c2tIUmVVRjJqaGkrTjJmUFZO?=
 =?utf-8?B?SkhYRndwaXF0WVRsUGNsMTNFMkFrc2Rrb0w0dTR0UDEvNHpxVjU4b3VYUG15?=
 =?utf-8?B?NFhwK0FGVnhPbThuTjc4dDhGYjd5djhaZkJSSndkRXFpZ0dnbGM2QmtLTm9X?=
 =?utf-8?B?V3ozTHlXNXQzTm1KbnZJakNXSFFZVVhBNFQ4NStLa0lSYXJKTmI2MDdaVTdV?=
 =?utf-8?B?OFVqM1krVnZVWWhsQ2JMaUQ4ekJzazdLNEdxa09haXNLeVU2UkJyM1dDRlI5?=
 =?utf-8?B?aW0vVkp3Q2JqMlFVM0YwRE1LbDQ1dUJhQVlwYWY5RmtWUnlaN3dWdGdqUXAr?=
 =?utf-8?B?amJPY2FmWmtDcFYrRnZ2bER3TDh5RlZGcTNjL3lkMmZKeUFHbTRFN0x1VzFG?=
 =?utf-8?B?TkZZOENCYTREdVJkSGxlV0NNYkFMelRWNFU1dGFLdG1FWko1NHNYMWh5ZWdQ?=
 =?utf-8?B?ZnExZlR2eTFucFY4cTZpbUxHWDlUeUZoSFduaXI0cDB3UWVmOG5lbkgydVdW?=
 =?utf-8?B?eUUwSW9BU0tXejAwcmY5M0lIeGJ4aEtZYU9FcThDTnd6MFRKWVowUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IZpfbn0Mrnvv5rHDQ08iJEjJuXnqJQhDLT1kJAWnwUJQLlg/ZzdCGbFVKmy3lVdQlbNF7XG/7fdbE1s79VilWoU7po2B4621oH/pJ6YYXGdlXghrCMQ3zIBR3N2NcHKA+gwrRoPTSmYc9hbZPUMOJWi+e71JlKW2cj6GFnlV20LKMH5DtfNxFmhKeMcZa+KhC8tHrDvUxoMs0g6crLRvkEF+B8qNqm8B5yxllr0d8luKqHHiOILaD8uyWUsbuOeX8MfzBUEVN375KED+GaCZrRynHMMQ0cbUEArW7QHoRpiO6li2qZlPUvOIoJF3Ocm+YWRiCa4s6eOfVeCBR3iucg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139c26f9-a2c8-442c-3ddd-08def4c0ac43
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 20:15:49.3184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +S+7E6VI+Gb5FQFvcTWN15seFg+Ks90ibJA/0AkgZRxHrQjGHOCvrp9j3KHstkzteMU2ivERjMiPYmIzWmoNKgkAsJL74zGIYHotwtcVYD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB215295
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQnJvc3QsIE1hdHRoZXcgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgQXVndXN0IDcsIDIwMjYgMzozOCBQ
TQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj5DYzog
cGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsNCj5oYW5zZ0BrZXJuZWwub3JnOyBpbHBvLmphcnZpbmVuQGxpbnV4LmludGVs
LmNvbTsgVml2aSwgUm9kcmlnbw0KPjxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgdGhvbWFzLmhl
bGxzdHJvbUBsaW51eC5pbnRlbC5jb207DQo+YWlybGllZEBnbWFpbC5jb207IHNpbW9uYUBmZnds
bC5jaDsgZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tOyBWaWpheSwNCj5Bbm9vcCBDIDxhbm9v
cC5jLnZpamF5QGludGVsLmNvbT47IE5pbGF3YXIsIEJhZGFsDQo+PGJhZGFsLm5pbGF3YXJAaW50
ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47DQo+
QXVzbXVzLCBKYW1lcyA8amFtZXMuYXVzbXVzQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1BB
VENIIDYvN10gZHJtL3hlL3ZzZWM6IENyZXNjZW50IElzbGFuZCBQTVQgY2FsbGJhY2tzDQo+DQo+
T24gRnJpLCBBdWcgMDcsIDIwMjYgYXQgMTI6MjI6MTlQTSAtMDcwMCwgTWF0dGhldyBCcm9zdCB3
cm90ZToNCj4+IE9uIEZyaSwgQXVnIDA3LCAyMDI2IGF0IDA4OjAwOjQwQU0gLTA2MDAsIFJ1aGws
IE1pY2hhZWwgSiB3cm90ZToNCj4+ID4gPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiA+
ID5Gcm9tOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+PiA+ID5T
ZW50OiBUaHVyc2RheSwgQXVndXN0IDYsIDIwMjYgNTo1MCBQTQ0KPj4gPiA+VG86IFJ1aGwsIE1p
Y2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPj4gPiA+Q2M6IHBsYXRmb3JtLWRy
aXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
DQo+PiA+ID5oYW5zZ0BrZXJuZWwub3JnOyBpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbTsg
Vml2aSwgUm9kcmlnbw0KPj4gPiA+PHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyB0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbTsNCj4+ID4gPmFpcmxpZWRAZ21haWwuY29tOyBzaW1vbmFA
ZmZ3bGwuY2g7IGRhdmlkLmUuYm94QGxpbnV4LmludGVsLmNvbTsgVmlqYXksDQo+PiA+ID5Bbm9v
cCBDIDxhbm9vcC5jLnZpamF5QGludGVsLmNvbT47IE5pbGF3YXIsIEJhZGFsDQo+PiA+ID48YmFk
YWwubmlsYXdhckBpbnRlbC5jb20+OyBSb3BlciwgTWF0dGhldyBEDQo+PG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+Ow0KPj4gPiA+QXVzbXVzLCBKYW1lcyA8amFtZXMuYXVzbXVzQGludGVsLmNv
bT4NCj4+ID4gPlN1YmplY3Q6IFJlOiBbUEFUQ0ggNi83XSBkcm0veGUvdnNlYzogQ3Jlc2NlbnQg
SXNsYW5kIFBNVCBjYWxsYmFja3MNCj4+ID4gPg0KPj4gPiA+T24gVGh1LCBBdWcgMDYsIDIwMjYg
YXQgMDY6NTg6MjZBTSAtMDcwMCwgTWljaGFlbCBKLiBSdWhsIHdyb3RlOg0KPj4gPiA+PiBDUkkg
UE1UIHN1cHBvcnQgcmVxdWlyZXMgY2FsbGJhY2tzIHRvIGFjY2VzcyB0aGUgZGlzY292ZXJ5IHN0
YXR1cw0KPj4gPiA+PiBhbmQgY29udHJvbCBhcmVhcy4gIEFjY2VzcyBpcyBhIGNvbW1vbiBNTUlP
IGFyZWEgdGhhdCByZXF1aXJlcyBhbg0KPj4gPiA+PiBpbmRleCB0byBiZSBzZXQgYmVmb3JlIGFj
Y2VzcyBpcyBhbGxvd2VkLg0KPj4gPiA+Pg0KPj4gPiA+PiBJbnRyb2R1Y2UgdGhlIG5lY2Vzc2Fy
eSBjYWxsYmFja3MgdG8gZ2V0IHRoZSBzdGF0dXMgYW5kIGNvbnRyb2wNCj4+ID4gPj4gaW5mb3Jt
YXRpb24gZm9yIENSSSBQTVQgdXNhZ2UuDQo+PiA+ID4+DQo+PiA+ID4+IEFkZCB0aGUgZ2x1ZSBs
b2dpYyB0byByZWdpc3RlciB0aGUgQ1JJIFBNVCBmdW5jdGlvbmFsaXR5Lg0KPj4gPiA+Pg0KPj4g
PiA+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj4+ID4gPj4gLS0tDQo+PiA+ID4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5j
IHwgODUNCj4+ID4gPisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPj4gPiA+
PiAgMSBmaWxlIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+PiA+
ID4+DQo+PiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiA+ID4+IGluZGV4IDM4NDlmOTljMWM5
MS4uYjg0ZWM5MDg4ZGU3IDEwMDY0NA0KPj4gPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdnNlYy5jDQo+PiA+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+
ID4gPj4gQEAgLTMyMCwxNyArMzIwLDkwIEBAIGludCB4ZV9wbXRfdGVsZW1fcmVhZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsDQo+dTMyDQo+PiA+ID5ndWlkLCB1NjQgKmRhdGEsIGxvZmZfdCB1c2VyX29m
ZnNlDQo+PiA+ID4+ICAJcmV0dXJuIGNvdW50Ow0KPj4gPiA+PiAgfQ0KPj4gPiA+Pg0KPj4gPiA+
PiAtc3RhdGljIHN0cnVjdCBwbXRfY2FsbGJhY2tzIHhlX3BtdF9jYiA9IHsNCj4+ID4gPj4gKy8q
Kg0KPj4gPiA+PiArICogeGVfcG10X3JlYWRfcmVnKCkgLSByZWFkIGEgY3Jhc2hsb2cgcmVnaXN0
ZXINCj4+ID4gPj4gKyAqIEBkZXY6IHRoZSB4ZSBkZXZpY2UgdGhhdCByZWdpc3RlcmVkIHRoZSBj
YWxsYmFjaw0KPj4gPiA+PiArICogQGd1aWQ6IFBNVCBndWlkIG9mIHRoZSBjcmFzaGxvZyBpbnN0
YW5jZQ0KPj4gPiA+PiArICogQHJlZzogZGF0YSByZWFkIGZyb20gdGhlIFBNVCBkYXRhIHN0cnVj
dHVyZQ0KPj4gPiA+PiArICogQG9mZnNldDogd2hpY2ggZGF0YSB0byByZWFkIGZyb20gdGhlIFBN
VCBkYXRhIHN0cnVjdHVyZQ0KPj4gPiA+PiArICoNCj4+ID4gPj4gKyAqIFJlYWQgdGhlIHJlcXVl
c3RlZCBQTVQgcmVnaXN0ZXIgYmFzZWQgb24gdGhlIHBjaWUgZGV2aWNlIGFuZCBndWlkLg0KPlRo
ZQ0KPj4gPiA+PiArICogc3VwcG9ydGVkIHN0cnVjdCBpcyB0aGUgQ3Jhc2hsb2cgVHlwZTEgVmVy
c2lvbjIuDQo+PiA+ID4+ICsgKg0KPj4gPiA+PiArICogQ3VycmVudGx5IHRoaXMgaXMgZm9yIENS
SSBvbmx5Lg0KPj4gPiA+PiArICovDQo+PiA+ID4+ICtzdGF0aWMgaW50IHhlX3BtdF9yZWFkX3Jl
ZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBndWlkLCB1MzIgKnJlZywgdTMyDQo+PiA+ID5vZmZz
ZXQpDQo+PiA+ID4+ICt7DQo+PiA+ID4+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBrZGV2X3Rv
X3hlX2RldmljZShkZXYpOw0KPj4gPiA+PiArCXZvaWQgX19pb21lbSAqZGlzY19hZGRyID0geGUt
Pm1taW8ucmVnczsNCj4+ID4gPj4gKwl1MzIgaW5zdDsNCj4+ID4gPj4gKw0KPj4gPiA+PiArCWlm
IChGSUVMRF9HRVQoR1VJRF9ERVZJQ0VfSUQsIGd1aWQpICE9IENSSV9ERVZJQ0VfSUQgfHwNCj4+
ID4gPj4gKwkgICAgRklFTERfR0VUKEdVSURfQ0FQX1RZUEUsIGd1aWQpICE9IENSQVNITE9HKQ0K
Pj4gPiA+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4+ID4gPj4gKw0KPj4gPiA+PiArCWluc3QgPSBG
SUVMRF9HRVQoR1VJRF9SRUNPUkRfSUQsIGd1aWQpID09IFBVTklUID8NCj4+ID4gPj4gKwkJQ1JJ
X0NSQVNITE9HX1BVTklUX0RJU0NfT0ZGU0VUIDoNCj4+ID4gPkNSSV9DUkFTSExPR19PT0JNU01f
RElTQ19PRkZTRVQ7DQo+PiA+ID4+ICsJZGlzY19hZGRyICs9IENSSV9ESVNDT1ZFUllfT0ZGU0VU
ICsgaW5zdCArIG9mZnNldDsNCj4+ID4gPj4gKw0KPj4gPiA+PiArCWd1YXJkKG11dGV4KSgmeGUt
PnBtdC5sb2NrKTsNCj4+ID4gPj4gKw0KPj4gPiA+PiArCXhlX3BtX3J1bnRpbWVfZ2V0KHhlKTsN
Cj4+ID4gPg0KPj4gPiA+V2UgaGF2ZSBndWFyZCh4ZV9wbV9ydW50aW1lKSh4ZSksIGFuZCB0aGlz
IHNob3VsZCBhbHNvIGJlIHRoZQ0KPj4gPiA+b3V0ZXJtb3N0IGNvbnN0cnVjdCAoaS5lLiwgZG8g
bm90IHVzZSB4ZV9wbV9ydW50aW1lX2dldCgpLCBhcyBpdCBjYW4NCj4+ID4gPndha2UgdGhlIGRl
dmljZSwgd2hpbGUgb3RoZXIgbG9ja3MgYXJlIGhlbGQpLg0KPj4gPg0KPj4gPiBIaSBNYXR0LA0K
Pj4gPg0KPj4gPiBJIGFtIHVzaW5nIHRoZSBfZ2V0KCkgcm91dGluZSBiZWNhdXNlIHRoZSBkZXZp
Y2UgTVVTVCBiZSBvbiBmb3IgbWUgdG8NCj5hY2Nlc3MgdGhlDQo+PiA+IHJlZ2lzdGVycy4NCj4+
ID4NCj4+ID4gRG9lcyB0aGUgZ3VhcmQoeGVfcG1fcnVudGltZSkoeGUpIHR1cm4gdGhlIGRldmlj
ZSBvbj8NCj4+ID4NCj4+DQo+PiBZZXMsIGl0IHdvdWxkIGJlIHNhbWUgYXM6DQo+Pg0KPj4geGVf
cG1fcnVudGltZV9nZXQoeGUpOw0KPj4gbXV0dXhfbG9jaygmeGUtPnBtdC5sb2NrKTsNCj4+IC8q
IERvIHNvbWV0aGluZyAqLg0KPj4gbXV0dXhfdW5sb2NrKCZ4ZS0+cG10LmxvY2spOw0KPj4geGVf
cG1fcnVudGltZV9wdXQoeGUpOw0KDQpHb3QgaXQuICBJIHdpbGwgdXBkYXRlLg0KDQo+PiA+DQo+
PiA+ID5TbyB0aGlzIHNob3VsZCBlaXRoZXIgYmU6DQo+PiA+ID4NCj4+ID4gPmd1YXJkKHhlX3Bt
X3J1bnRpbWUpKHhlKTsNCj4+ID4gPmd1YXJkKG11dGV4KSgmeGUtPnBtdC5sb2NrKTsNCj4+ID4N
Cj4+ID4gT2ssIHRoaXMgbWFrZXMgc2Vuc2UuDQo+PiA+DQo+PiA+ID5PciwgbGlrZSB0aGUgb3Ro
ZXIgaW4tdHJlZSB1c2FnZSB3aXRoIHhlLT5wbXQubG9jayBpbg0KPj4gPiA+eGVfcG10X3RlbGVt
X3JlYWQoKSwgd2hpY2ggY2FsbHMgeGVfcG1fcnVudGltZV9nZXRfaWZfYWN0aXZlKCkgd2hpbGUN
Cj4+ID4gPmhvbGRpbmcgdGhlIGxvY2suIFRoaXMgaXMgZmluZSBiZWNhdXNlIHhlX3BtX3J1bnRp
bWVfZ2V0X2lmX2FjdGl2ZSgpDQo+PiA+ID5jYW5ub3Qgd2FrZSB0aGUgZGV2aWNlLiBUaGlzIGlz
IG1vc3QgbGlrZWx5IHRoZSBjb3JyZWN0IGNob2ljZSwgZ2l2ZW4NCj4+ID4gPnRoYXQgdGhpcyBp
cyBhIHZmdW5jIGNhbGxlZCBieSBhIGRpZmZlcmVudCBkcml2ZXIsIGFuZCB3ZSBoYXZlIG5vIHdh
eSBvZg0KPj4gPiA+a25vd2luZyB3aGV0aGVyIHRoYXQgZHJpdmVyIGlzIGhvbGRpbmcgbG9ja3Mg
dGhhdCBjb3VsZCBjcmVhdGUNCj4+ID4gPnByb2JsZW1hdGljIGxvY2sgZGVwZW5kZW5jeSBjaGFp
bnMgaWYgd2Ugd2FrZSB0aGUgWGUgZGV2aWNlIGhlcmUuDQo+PiA+DQo+PiA+IEZvciB0ZWxlbWV0
cnksIHRoZSBkYXRhIHJlYWQgc2hvdWxkIE5PVCBoYXBwZW4gaWYgdGhlIGRldmljZSBpcyBub3Qg
YWN0aXZlDQo+KHNvIHRoZSBnZXRfaWZfYWN0aXZlIHVzYWdlKQ0KPj4gPg0KPj4gPiBGb3IgQ3Jh
c2hsb2csIEkgaGF2ZSB0byBnZXQgdGhlIGRhdGEgYW5kIGhhdmUgdG8gbWFrZSBzdXJlIHRoZSBk
ZXZpY2UgaXMNCj5lbmFibGVkLi4uLihzZWUgcGF0Y2ggMykuDQo+PiA+DQo+Pg0KPj4gSWYgWGUg
Z2V0cyBob3RwbHVnZ2VkIG5vdGhpbmcgaXMgZ29pbmcgdG8gc2F2ZSB5b3UgaGVyZSBlaXRoZXIs
IHlvdSB0bw0KPj4gc29tZSBleHRlbnQgeW91IG11c3QgZGVhbCBlcnJvcnMgYXQgdGhlIGNhbGxl
ciwgbW9yZSBiZWxvdy4NCj4+DQo+PiA+IERvIHlvdSBoYXZlIHNvbWUgdGhvdWdodHMgb24gdGhl
IGNvcnJlY3Qgc2VxdWVuY2luZyBoZXJlPw0KPj4NCj4+IEknZCBhdCBsZWFzdCBzd2FwIHRoZSBv
cmRlciBhcyBzdWdnZXN0ZWQgc28gdGhhdCB0aGUgWGUgY29kZSBpc24ndA0KPj4gaW50ZXJuYWxs
eSB3YWtpbmcgdGhlIGRldmljZSB3aGlsZSBob2xkaW5nIGxvY2tzLCB3aGljaCBnb2VzIGFnYWlu
c3Qgb3VyDQo+PiBQTSBydWxlcy4NCj4+DQo+PiBJJ2QgYWxzbyBjb25zaWRlciBhZGRpbmcgaW50
ZXJuYWwgaG90cGx1ZyBwcm90ZWN0aW9uLCB1bmxlc3MgdGhlIGNhbGxlcg0KPj4gYWxyZWFkeSBw
cm92aWRlcyBpdC4gSSBkb24ndCByZWFsbHkga25vdyB3aGF0IHRoZSBQTVQgY29kZSBpcyBkb2lu
Zw0KPj4gaGVyZSwgc28gaXQncyBwb3NzaWJsZSB0aGF0IHRoaXMgcGF0aCBpcyBhbHJlYWR5IHBy
b3RlY3RlZCBhZ2FpbnN0DQo+PiBob3RwbHVnIGV2ZW50cy4NCj4+DQo+PiBTbzoNCj4+DQo+PiBi
b3VuZCA9IGRybV9kZXZfZW50ZXIoJnhlLT5kcm0sIGlkeCk7DQo+PiBpZiAoIWJvdW5kKQ0KPg0K
PlNvcnJ5IHR5cG8gd2l0aCBwb2xhcml0eSBpbnZlcnRlZDogcy9pZiAoIWJvdW5kKS9pZiAoYm91
bmQpIHsNCj4NCj4+IAl4ZV9wbV9ydW50aW1lX2dldCh4ZSk7DQo+PiAJbXV0dXhfbG9jaygmeGUt
PnBtdC5sb2NrKTsNCj4+DQo+PiAJLyogRG8gc29tZXRoaW5nICovDQo+Pg0KPj4gCW11dHV4X3Vu
bG9jaygmeGUtPnBtdC5sb2NrKTsNCj4+IAl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+Pg0KPj4g
CWRybV9kZXZfZXhpdChpZHgpOw0KPj4gfSBlbHNlIHsNCj4+IAkvKiBEZXZpY2UgaXMgYWxyZWFk
eSB1bnBsdWdnZWQsIGNhbGxlciBoYXMgdG8gZGVhbCB3aXRoIHRoaXMgKi8NCj4+IAlyZXR1cm4g
c29tZV9lcnJvcjsNCj4+IH0NCj4+DQo+PiBJZiBob3RwbHVnIHByb3RlY3Rpb24gaXMgbmVlZGVk
IGhlcmUsIHRoZW4geGVfcG10X3RlbGVtX3JlYWQgc2hvdWxkIGhhdmUNCj4+IHRoaXMgdG9vLg0K
DQpIbW0sIHRoaXMgaXMgIm5ldyIgc3R1ZmYgZm9yIG1lLCBzbyBJIHdpbGwgZXhwbG9yZSB0aGlz
IHNvbWUgbW9yZSBhbmQgdGhlbg0KcHJvYmFibHkgZm9sbG93IHdoYXQgeW91IGhhdmUgZG9uZSBo
ZXJlLiDwn5iKDQoNClRoYW5rcyENCg0KTWlrZQ0KDQo+PiBNYXR0DQo+Pg0KPj4gPg0KPj4gPiBU
aGFua3MsDQo+PiA+DQo+PiA+IE0NCj4+ID4NCj4+ID4gPk1hdHQNCj4+ID4gPg0KPj4gPiA+PiAr
DQo+PiA+ID4+ICsJeGUtPnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLCBDUklfSURY
X1RFTEVNX0RJU0NPVkVSWSk7DQo+PiA+ID4+ICsNCj4+ID4gPj4gKwltZW1jcHlfZnJvbWlvKHJl
ZywgZGlzY19hZGRyLCBzaXplb2YoKnJlZykpOw0KPj4gPiA+PiArDQo+PiA+ID4+ICsJeGVfcG1f
cnVudGltZV9wdXQoeGUpOw0KPj4gPiA+PiArDQo+PiA+ID4+ICsJcmV0dXJuIDA7DQo+PiA+ID4+
ICt9DQo+PiA+ID4+ICsNCj4+ID4gPj4gK3N0YXRpYyBpbnQgeGVfcG10X3dyaXRlX3JlZyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHUzMiBndWlkLCB1MzIgcmVnLCB1MzINCj4+ID4gPm9mZnNldCkNCj4+
ID4gPj4gK3sNCj4+ID4gPj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGtkZXZfdG9feGVfZGV2
aWNlKGRldik7DQo+PiA+ID4+ICsJdm9pZCBfX2lvbWVtICpkaXNjX2FkZHIgPSB4ZS0+bW1pby5y
ZWdzOw0KPj4gPiA+PiArCXUzMiBpbnN0Ow0KPj4gPiA+PiArDQo+PiA+ID4+ICsJaWYgKEZJRUxE
X0dFVChHVUlEX0RFVklDRV9JRCwgZ3VpZCkgIT0gQ1JJX0RFVklDRV9JRCB8fA0KPj4gPiA+PiAr
CSAgICBGSUVMRF9HRVQoR1VJRF9DQVBfVFlQRSwgZ3VpZCkgIT0gQ1JBU0hMT0cpDQo+PiA+ID4+
ICsJCXJldHVybiAtRUlOVkFMOw0KPj4gPiA+PiArDQo+PiA+ID4+ICsJaW5zdCA9IEZJRUxEX0dF
VChHVUlEX1JFQ09SRF9JRCwgZ3VpZCkgPT0gUFVOSVQgPw0KPj4gPiA+PiArCQlDUklfQ1JBU0hM
T0dfUFVOSVRfRElTQ19PRkZTRVQgOg0KPj4gPiA+Q1JJX0NSQVNITE9HX09PQk1TTV9ESVNDX09G
RlNFVDsNCj4+ID4gPj4gKwlkaXNjX2FkZHIgKz0gQ1JJX0RJU0NPVkVSWV9PRkZTRVQgKyBpbnN0
ICsgb2Zmc2V0Ow0KPj4gPiA+PiArDQo+PiA+ID4+ICsJZ3VhcmQobXV0ZXgpKCZ4ZS0+cG10Lmxv
Y2spOw0KPj4gPiA+PiArDQo+PiA+ID4+ICsJeGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPj4gPiA+
PiArDQo+PiA+ID4+ICsJeGUtPnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLCBDUklf
SURYX1RFTEVNX0RJU0NPVkVSWSk7DQo+PiA+ID4+ICsNCj4+ID4gPj4gKwltZW1jcHlfdG9pbyhk
aXNjX2FkZHIsICZyZWcsIHNpemVvZihyZWcpKTsNCj4+ID4gPj4gKw0KPj4gPiA+PiArCXhlX3Bt
X3J1bnRpbWVfcHV0KHhlKTsNCj4+ID4gPj4gKw0KPj4gPiA+PiArCXJldHVybiAwOw0KPj4gPiA+
PiArfQ0KPj4gPiA+PiArDQo+PiA+ID4+ICtzdGF0aWMgc3RydWN0IHBtdF9jYWxsYmFja3MgeGVf
Ym1nX3BtdF9jYiA9IHsNCj4+ID4gPj4gKwkucmVhZF90ZWxlbSA9IHhlX3BtdF90ZWxlbV9yZWFk
LA0KPj4gPiA+PiArfTsNCj4+ID4gPj4gKw0KPj4gPiA+PiArc3RhdGljIHN0cnVjdCBwbXRfY2Fs
bGJhY2tzIHhlX2NyaV9wbXRfY2IgPSB7DQo+PiA+ID4+ICAJLnJlYWRfdGVsZW0gPSB4ZV9wbXRf
dGVsZW1fcmVhZCwNCj4+ID4gPj4gKwkucmVhZF9yZWcgPSB4ZV9wbXRfcmVhZF9yZWcsDQo+PiA+
ID4+ICsJLndyaXRlX3JlZyA9IHhlX3BtdF93cml0ZV9yZWcsDQo+PiA+ID4+ICB9Ow0KPj4gPiA+
Pg0KPj4gPiA+PiAgc3RhdGljIGNvbnN0IGludCB2c2VjX3BsYXRmb3Jtc1tdID0gew0KPj4gPiA+
PiAgCVtYRV9CQVRUTEVNQUdFXSA9IFhFX1ZTRUNfQk1HLA0KPj4gPiA+PiArCVtYRV9DUkVTQ0VO
VElTTEFORF0gPSBYRV9WU0VDX0NSSSwNCj4+ID4gPj4gIH07DQo+PiA+ID4+DQo+PiA+ID4+ICBz
dGF0aWMgZW51bSB4ZV92c2VjIGdldF9wbGF0Zm9ybV9pbmZvKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KQ0KPj4gPiA+PiAgew0KPj4gPiA+PiAtCWlmICh4ZS0+aW5mby5wbGF0Zm9ybSA+IFhFX0JBVFRM
RU1BR0UpDQo+PiA+ID4+ICsJaWYgKHhlLT5pbmZvLnBsYXRmb3JtID4gWEVfQ1JFU0NFTlRJU0xB
TkQpDQo+PiA+ID4+ICAJCXJldHVybiBYRV9WU0VDX1VOS05PV047DQo+PiA+ID4+DQo+PiA+ID4+
ICAJcmV0dXJuIHZzZWNfcGxhdGZvcm1zW3hlLT5pbmZvLnBsYXRmb3JtXTsNCj4+ID4gPj4gQEAg
LTM1Nyw4ICs0MzAsMTQgQEAgdm9pZCB4ZV92c2VjX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUp
DQo+PiA+ID4+DQo+PiA+ID4+ICAJc3dpdGNoIChwbGF0Zm9ybSkgew0KPj4gPiA+PiAgCWNhc2Ug
WEVfVlNFQ19CTUc6DQo+PiA+ID4+IC0JCWluZm8tPnByaXZfZGF0YSA9ICZ4ZV9wbXRfY2I7DQo+
PiA+ID4+ICsJCWluZm8tPnByaXZfZGF0YSA9ICZ4ZV9ibWdfcG10X2NiOw0KPj4gPiA+PiAgCQli
cmVhazsNCj4+ID4gPj4gKw0KPj4gPiA+PiArCWNhc2UgWEVfVlNFQ19DUkk6DQo+PiA+ID4+ICsJ
CWluZm8tPnByaXZfZGF0YSA9ICZ4ZV9jcmlfcG10X2NiOw0KPj4gPiA+PiArCQl4ZS0+c29jX3Jl
bWFwcGVyLnNldF90ZWxlbV9yZWdpb24oeGUsDQo+PiA+ID5DUklfSURYX1RFTEVNX0RJU0NPVkVS
WSk7DQo+PiA+ID4+ICsJCWJyZWFrOw0KPj4gPiA+PiArDQo+PiA+ID4+ICAJZGVmYXVsdDoNCj4+
ID4gPj4gIAkJYnJlYWs7DQo+PiA+ID4+ICAJfQ0KPj4gPiA+PiAtLQ0KPj4gPiA+PiAyLjQzLjAN
Cj4+ID4gPj4NCg==
