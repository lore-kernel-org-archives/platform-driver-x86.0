Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F123803D0
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636886; cv=fail; b=ADA51+NG6J4MerJ1/SvF4DPi91DLzlaTCbihs2sx7y0z/Wm3GAFIwFcSBafCfSGl6RpgFlf/FbiMBFmG829laAGQbyV0k3fb9Oq1CCieHwCmFBsxgWpjOGF7g7p27gQZsYWLVVBPq1DLGpSTlv7jRQVNvI7srgFpbnOnnAFzCz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636886; c=relaxed/simple;
	bh=LOdwUGknmBrQCft/kBMu5Uje3MF9/N/uUwepEmPIrIY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gyNW0FAxlGsHS/WlpqUVzFbMS3YyreqDG+o6DsVQZ/+tg8IbKg+5Qj+Blt34r1rllPJ9Th9ePyWjSXdPM6Rbm0QnLsZ6+4nw/SpgbYqPqzvKbhUfv7WVETU5OCCb+IOq5Yg9giFEBlkT6MQ6/tK8IQRaX9k0viEejBKKytP8d9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3PE7Am6; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3PE7Am6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786636884; x=1818172884;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LOdwUGknmBrQCft/kBMu5Uje3MF9/N/uUwepEmPIrIY=;
  b=H3PE7Am6MDlEm20aP+w1ahe6vX+oRgCag9kKYodfrlwGkotT4mpHDEKH
   6QwaVeMk4UzIOgOmJic/fBpFPt7sMkawWAbPB5o2iCfugETV1+mPmJKfo
   ztHabK4u1vji6pqLk8mGs1RjYZ2Ua51yPX/Sf7d1/d/Yfr9ADoPprR++R
   K0Bou5pXo6CKOdAuMNooeBn9LuF3MfxiMCB8SMjw9eYx76pTZ4WS1Xdiu
   BNQXbk8a7nNHmaRlZycPnjqUAgxJdSENqvDKzeJVuslRJDJcqeSL8AvCJ
   om7VqqWljHkZR4obOJPWUfOk7i6k2SbysRxEDig+Lgc6LeLzoTL2OE3/f
   g==;
X-CSE-ConnectionGUID: yX0Y43hmQna12n/XBoajvg==
X-CSE-MsgGUID: //9MgCnCR9eAjp3MJHuHsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86177395"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="86177395"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 09:01:17 -0700
X-CSE-ConnectionGUID: rzeud4QESeeo0hRLgVJADQ==
X-CSE-MsgGUID: dvh+IJjDQEeBl4jHuaZTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264563866"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 09:01:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:01:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 09:01:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3xoli0X8roGVtCBLelv2KCMDlPzWv6shy/weKYk+2HymCxi/QbZrakQtG9/Oh8brWHAAk8P21/9ypn1JfN4riBNM8nY/Afu2XHV0gbzYhRiU0/TO+Zhfgr5qgYD9mlYy9lxNzuBPg9BbYsvLb+qLUuEqY7RAQCxElBk3zLpl8O8SQNAQ2ksRhE/T5UB9fVIkx1ZqhebJ5QlwTnjoijRBAtYG3ltp5WV5x/lGfyT+SxDpm18Ql/HVqU3rPBoQxJ8HFhoJZLuWATFaeU4Y+yXiA0wXgOkF0qk3/7qUH+mMI1Pxaeplyo8qiwdoU+oqpNWZz99BkuaGBOX8/LvvbJL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTnAGoR3xyOkL57/ZIzce8sHWdWZwjSvOeSPLY/7w4Q=;
 b=KlGjw7oBAqNEYLAx5v5Qs2kDvobc7BcjuvLjmIWJbqh6Zy499PJoHGe9XfmRyQ0zAiWMI5lwPYBARfEELP78h4hZH/WYQJx1Y/kgMekwtogErE0NIKycHnxOjsVb3Jqg4cl43JleJa1U2hG/3alZuJjw2R7K5bNOymPPYrUnO09Reb/gMbVXpSF+0LGtRBI9tuA7CJugiW/Re+8VuODc18apLxXbNg1VsGov47fhZG46YRfPTpTlKUltz8UXfc9TDkhv4AJa6zLHzI0o+drx1kIEWn4mk5xiYm9FuTeSAHLxfsMnwa35tD8anP8KTNu1K8FrMLWY8MTunj9wZN/+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 16:01:07 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:01:05 +0000
Message-ID: <f96bcf3a-11f8-4512-ae8e-dc8775933ea2@intel.com>
Date: Thu, 13 Aug 2026 21:30:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,10/10] drm/xe/vsec: Update PMT internal access for CRI
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
References: <20260812193742.2170188-22-michael.j.ruhl@intel.com>
 <0e309e05-01d9-404e-9f44-6638175a05f8@intel.com>
 <IA1PR11MB64182480797650C74A70B71CC1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <IA1PR11MB64182480797650C74A70B71CC1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0272.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::11) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ae08f8-64cc-4160-93cc-08def9541415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|921020|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uglTzbAn+Mep+mwgafSOB3/f0/9Ep5M9vC4eS/RzDGUY57kSwcAR372deJrbQvKQPyomtBUozOudpp36bPHYx80kUv6z5oRQwLxEn9yDaplfpfzrSh80f0mw78wDiHndBx1NLI4i7QhZySrk9RBqCpwxsuTdsEncZyGYan2AN5YrrPerjE0ffwzsqJZ+wQi5Ze6JeYb/twu3OC7kjz7uNp5jDuTFxNC4KNtD4lGBDioYg1xTvM0nMXro1jqmqJwfm4MV1ev47sOSrSp4FBFzNeZ8zlyI0/a5r9mi9p3iwt1gvm6nX4Q/JgDZjT+27W7iFtMlNY8e0Xi5YUVYiQoAUWlzKJ5bxJXR64ONzlHeFdqGWRyovDGuJ2naRjB2eUj9rAXLmYVce6al5GPQ2LvngErE75Eb75vkt61rD6wBOzPKVBpsH+uHRm9a7lSfkZqs+3FgXzhEouCl6ZagS82YdH0DV5DgXgJzR+qXTCOhuB1y8M/1Oy+rmA2EsgtSa7mOUE4l5qzFpYBZO7WzHEbZWB5uukKvTA/oMB6On48xho+oGPamlQNKflPmoYybFCxfXAHbcfZxvV0D/DdGH9kwxtgApMMMCu1xYxj2oF1gJ8uUuP9vscMqqhKv4LW+cjandjQad46ARHdMpAA7CtLw3ohn5pfD/Z168ti1CYDKF2s3MW1Q9v9yIMwg1w6x2bYQGr9z9iF1eNvSzTO/uPEdAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(921020)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NitPWWw2dWpXT003Nk5nWTlKTGp1eTJDejZCYjdtdkt2MmpHOVVCTWdZUEM1?=
 =?utf-8?B?MENpRVY2R3NpaW5YVFlRMGlYMmU4R3FBQWV4MGZXSjdrOGdTcXB6M0dXUWtU?=
 =?utf-8?B?aVllSWNCSnVQeHNORkI2QjNGTUZXNzFnYnJkc2NiazNnSTlONnBhNGJpUjRF?=
 =?utf-8?B?NURBYUM3enRUM2c0ejcyYWYvRmc2QStPaVhhNU92azlIdWdrMnozUFRORW9K?=
 =?utf-8?B?YWU3Q2tkRDJjWGMzYVh4MW44MStCL1ZoN3Qzc3JvSFhlSEFlbk44WmxEMWQr?=
 =?utf-8?B?djA1NW8zZ0p2WVUvYnpZdCt2cXBQSm54clJVS21EWHUrd0Nvc2VOSFNtMkdV?=
 =?utf-8?B?bDFQR1JrdFBLa0RlakZWZ1RMZXoxUGFnM1BQU3VnR2ZjWXdJOXhrb2J2d0Y4?=
 =?utf-8?B?Z0Z4WXl1YmhuMjgvYTV3VXI5ZTFZVzUwSGU4NHRCM0tvTTI1UlNmQW1UbGZU?=
 =?utf-8?B?b2pYdk9OSVR1Zm1oY0tWWk1hV1R6OUQ4cHV0Qm9XNDA0RkR0SkkrR0JSQzFE?=
 =?utf-8?B?VGhydis0ZEdybTJJZUtVTjh4aU8zaG5DeFZ0VVBURHRrY1MyK2Z3ckxkWm9M?=
 =?utf-8?B?UExLSkJUMWQ2SW9jU2U5QU1QMzlBZUhwR1NpcUlraFB4a1IrUW90aDIvcUpn?=
 =?utf-8?B?aHQ1NG50bEhiaWc1d0dMRXFFdVYzMnlZSjgybnM2bGU3TE55QU5IMXFIMG8w?=
 =?utf-8?B?bXl6OFlwU2RyUkNHTHphS2UrRUk5SGJna2t0K2k0aFlqUkVENjRGUnAzNjFn?=
 =?utf-8?B?Z3JnZUEvRTgwMjR2blNKZzJEN3dZUFJwV1doUHk4Q1grRXlRd25wT3paNXFq?=
 =?utf-8?B?QnVjNkFzd3gyN2hsbzRNdDl3c1JyRGRaV2k0ZWtNcm5nMStRWFE4WnNvM2tr?=
 =?utf-8?B?ejJhS05GR1lHa0VPSnQwcXFMMHJpWHQ3WDNUQytzU0VERFQvcWQ0aFFFcXFD?=
 =?utf-8?B?WVlpZEduY09BS3d6OXFMSUo0VitaQ0N1Y3lwUVZkQ0cwK3hqSFR1VHY2KzlQ?=
 =?utf-8?B?UEJuRWhQWjU4RUNtbUd6UFY2TG15UTNtTUxJdlBmU0gyRytNVTB3VnlCc1Nk?=
 =?utf-8?B?MjVtbHdNUWhCZDl6U2puYW1qWG50ZE8wU0V6R2NRQW5NeTZ2U0FFVXJhZzZv?=
 =?utf-8?B?YXdESzNOdkM1aWc4UXdQZk9FdzBBVUFQdnlWTE5rcGZpb25FM3RaWnZxYk9Q?=
 =?utf-8?B?QXFSQVdubGJUVXVPTTV2dDNKZVNXSUk5elRZOTFuZ2ZwYngvd0M0UGViQWdI?=
 =?utf-8?B?WkhUMzMrN0ZvbFNIQTRsaTJjVTJVUDN0V21JN3Q2TEZ0eWxiMVMveWNUVW4x?=
 =?utf-8?B?ZUU3R0haRVN2c0lNKzJoNXkvOWVPaTYwdEpwSGRpZ3J1aHo4QXRQRC9JVjBk?=
 =?utf-8?B?c2hBa3BpUnlzdG5aMVV1SzdLZTEvem5lY1BSTFhxZmxPOGJNaGhaYTVGNlA5?=
 =?utf-8?B?dm5UdVRuZVdvUWx6MGlRZVJ3N1lWeC9zbzVYYnpuVFY2OC9UYnRHb05SNDM2?=
 =?utf-8?B?OXZGU2Vpd1F0MjZtQlFWMW5jV1E5bXVhSDVCVUxrTjRZRE1yalJETW1WOUlM?=
 =?utf-8?B?QkFNcTRubkQxMXJwWURwU1M1SFJ2UEwrYThldFBVSitFd3prb0RCRzNObnhD?=
 =?utf-8?B?eU9XbHJ1K1hpeE5HNjlhdm83NVhmc2pwKzlOb0xueC9YR3VWNXpVMmJwMW5G?=
 =?utf-8?B?T1VnTHhlMlVUM2JMTm1qZGMyZkRNSTZDbmxON2E4RnE4cDNQM3Buc3BublNM?=
 =?utf-8?B?aE1rMGxlbDZRY3F3RjJDTjBaWTczOVk3WHJkUm1GVFE0U3ptL3UzelYreXdC?=
 =?utf-8?B?QTJoRE9YOElWemdqdnFkb1hiQ0VHbTNlaUQwclRMUk5jSlpxdldScU1NKytN?=
 =?utf-8?B?MDJwdnlrRFNxU2xwQ1dBNGd5WjFRSXRpcFl2RGhwenE3QjRWTFgrWXNxRlYw?=
 =?utf-8?B?c1l3WHppdHhmdUs4VmhObmFod0YzMHpKOUN3Z2VmdWo1cTlrOThHVXNaYmg1?=
 =?utf-8?B?Vkw2OXlhVUZRVDdFQmp2OW94SWFSOTA4NmtBVE1CN3JqZ0o5bnZxekcwc2sx?=
 =?utf-8?B?S2t1aElNemtEeHJPRy8zd2RZYU5WQXdKcy83UHQxWE5RWVQrQUZvWUNnc05G?=
 =?utf-8?B?T20wRW1wTHdDcHNJdHJmaUMzaGR0KzArT2grMmNiMGRzSGRpdmUzTzBLYTRZ?=
 =?utf-8?B?WFVRdWRabHpjaGJ1aGVDSm5BRkdwUitiR0NnWUlyd01MZVFoZVcxdlJwZlkr?=
 =?utf-8?B?aGNqK2p1RUJXYXdZd1BRQ3ZCREZpOEhZYUR6WGxDQXJYMzgwYXJwc1lDVUNZ?=
 =?utf-8?B?Yy9DdkdzNFpaalRETFhsMlpJQy9sakdqbnRyOE9KUDFLL3ZvZEpFUT09?=
X-Exchange-RoutingPolicyChecked: jcLpKEAIseHPniO+/GeUnBkLsMgvaxyjWem/CGlIvV04qJfllXP0EeLZrIrcw7h+qvWeVCDO/1m9wFexjqgqY3uEMmNb1Sxb6rh6Q+fhP/AJJBIrOw6+JVtoZURtPgWqhzIbWIgVe6+rVEAi0MLFkpQTTUSwOG76hHluEYj5iD79yl8lpNzVBXi+PR9oyQoOf8L5fW2xGLdiLazO9N7bsFwsruRPxudIB4tic98ja3/3W2xTdFtKY1cerQ6M4wAsGZS1lwV8xU610Jqd9ksWnF+omkBLB+MuGXVH3dpUPRMrBW14eyZTapsnwH9jOdN82/mo0QsnUW45+titTf5nGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ae08f8-64cc-4160-93cc-08def9541415
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:01:04.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/LTvyuIG0uuJ88tCnf9UVTUMg7QqZOmQR9D9UnEvUQbhzbwS2Cj4Z7/dZ9qQGAbpZsY59mPzPtiA8tBi6lPJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-OriginatorOrg: intel.com


On 13-08-2026 20:19, Ruhl, Michael J wrote:
>
> *From:*Poosa, Karthik <karthik.poosa@intel.com>
> *Sent:* Thursday, August 13, 2026 10:30 AM
> *To:* Ruhl, Michael J <michael.j.ruhl@intel.com>; 
> platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; 
> hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew 
> <matthew.brost@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; 
> thomas.hellstrom@linux.intel.com; airlied@gmail.com; simona@ffwll.ch; 
> david.e.box@linux.intel.com; Vijay, Anoop C <anoop.c.vijay@intel.com>; 
> Nilawar, Badal <badal.nilawar@intel.com>; Roper, Matthew D 
> <matthew.d.roper@intel.com>; Ausmus, James <james.ausmus@intel.com>
> *Subject:* Re: [v2,10/10] drm/xe/vsec: Update PMT internal access for CRI
>
> On 13-08-2026 01:07, Michael J. Ruhl <michael.j.ruhl@intel.com> 
> <mailto:michael.j.ruhl@intel.com> wrote:
>
>     Xe access the PMT infrastructure directly. The current usage
>
>     is supported ONLY by BMG devices.
>
>     CRI has further requirements for access.
>
>     Add a new API to access the GUID based on the platform.
>
>     Use the API get the GUID for each device.
>
>     Signed-off-by: Michael J. Ruhl<michael.j.ruhl@intel.com> <mailto:michael.j.ruhl@intel.com>
>
>     ---
>
>       drivers/gpu/drm/xe/regs/xe_pmt.h |  4 +++-
>
>       drivers/gpu/drm/xe/xe_debugfs.c  | 30 +++++++++++++-----------
>
>       drivers/gpu/drm/xe/xe_hwmon.c    | 10 ++++++--
>
>       drivers/gpu/drm/xe/xe_pcode.c    | 10 ++++++--
>
>       drivers/gpu/drm/xe/xe_vsec.c     | 40 ++++++++++++++++++++++++++++++++
>
>       drivers/gpu/drm/xe/xe_vsec.h     |  1 +
>
>       6 files changed, 77 insertions(+), 18 deletions(-)
>
>     diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
>
>     index fc9c9cb6a830..683bf401dc9d 100644
>
>     --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>
>     +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>
>     @@ -10,7 +10,7 @@
>
>       #define BMG_PMT_BASE_OFFSET            0xDB000
>
>       #define BMG_DISCOVERY_OFFSET           (SOC_BASE + BMG_PMT_BASE_OFFSET)
>
>     -#define PUNIT_TELEMETRY_GUID           XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
>
>     +#define BMG_PUNIT_TELEMETRY_GUID       XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
>
>       #define BMG_ENERGY_STATUS_PMT_OFFSET   (0x30)
>
>       #define        ENERGY_PKG                      REG_GENMASK64(31, 0)
>
>       #define        ENERGY_CARD                     REG_GENMASK64(63, 32)
>
>     @@ -25,6 +25,8 @@
>
>       #define CRI_DISCOVERY_OFFSET           (SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
>
>       #define CRI_TELEMETRY_OFFSET           (SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
>
>     +#define CRI_PUNIT_TELEMETRY_GUID       XE_REG(CRI_DISCOVERY_OFFSET + 0x4)
>
>     +
>
>       #define BMG_MODS_RESIDENCY_OFFSET              (0x4D0)
>
>       #define BMG_G2_RESIDENCY_OFFSET                (0x530)
>
>       #define BMG_G6_RESIDENCY_OFFSET                (0x538)
>
>     diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>
>     index eeceab4a9901..67903c854562 100644
>
>     --- a/drivers/gpu/drm/xe/xe_debugfs.c
>
>     +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>
>     @@ -97,11 +97,16 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>
>                                         u32 offset, const char *name, struct drm_printer *p)
>
>       {
>
>              u64 residency = 0;
>
>     +       u32 guid;
>
>              int ret;
>
>     -       ret = xe_pmt_telem_read(xe->drm.dev,
>
>     -                               xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
>
>     -                               &residency, offset, sizeof(residency));
>
>     +       guid = xe_vsec_get_guid(xe);
>
>     +       if (!guid) {
>
>     +               drm_warn(&xe->drm, "PMT device is not powered\n");
>
>     +               return;
>
>     +       }
>
> Instead of reading the GUID for every residency counter access, can 
> |xe_vsec|read it once after OCODE is loaded and then use the cached 
> value internally when |xe_pmt_telem_read()|is called?
>
>
> Yes, this can be cached.  Were it should be cached is unclear.
>
> The PMT information has multiple (and possibly a variable) possible 
> GUIDs for a device.
>
> So should all of them be cached, or only certain ones?  There are 
> multiple issues to resolve to support caching.
>
> At this time, reading the value every time seems reasonable.
>
We could cache it on the first read in |xe_vsec_get_guid()|.
Since the current debugfs use PUNIT telemetry, that GUID should be 
sufficient.
If additional telemetry GUIDs become relevant in the future, the 
implementation can be updated to accommodate them.
>
>     +
>
>     +       ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
>
>              if (ret != sizeof(residency)) {
>
>                      drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
>
>                      return;
>
>     @@ -706,23 +711,22 @@ void xe_debugfs_register(struct xe_device *xe)
>
>                                       ARRAY_SIZE(debugfs_list),
>
>                                       root, minor);
>
>     -       if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
>
>     -               drm_debugfs_create_files(debugfs_residencies,
>
>     -                                        ARRAY_SIZE(debugfs_residencies),
>
>     -                                        root, minor);
>
>     -       }
>
>     -
>
>              /*
>
>     -        * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
>
>     -        * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
>
>     -        * PUNIT_VERSION_OFFSET.
>
>     +        * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
>
>     +        * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
>
>     +        * and have a fixed offses for the required data.
>
> offset*
>
> Will fix.
>
>               * Attempting this access on other platforms must be verified before enabling support.
>
>               */
>
>              if (!IS_SRIOV_VF(xe) &&
>
>     -           (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
>
>     +           (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
>
>     +               drm_debugfs_create_files(debugfs_residencies,
>
>     +                                        ARRAY_SIZE(debugfs_residencies),
>
>     +                                        root, minor);
>
>     +
>
>                      drm_debugfs_create_files(pcode_info_debugfs,
>
>                                               ARRAY_SIZE(pcode_info_debugfs),
>
>                                               root, minor);
>
>     +       }
>
>              debugfs_create_file("forcewake_all", 0400, root, xe,
>
>                                  &forcewake_all_fops);
>
>     diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>
>     index 49f7e0edcc4b..db48594fcc1f 100644
>
>     --- a/drivers/gpu/drm/xe/xe_hwmon.c
>
>     +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>
>     @@ -517,9 +517,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>
>              if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
>
>                      u64 pmt_val;
>
>     +               u32 guid;
>
>     -               ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
>
>     -                                       xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
>
>     +               guid = xe_vsec_get_guid(hwmon->xe);
>
>     +               if (!guid) {
>
>     +                       drm_warn(&hwmon->xe->drm, "PMT device is not powered\n");
>
>     +                       *energy = 0;
>
>     +                       return;
>
>     +               }
>
> same as above
>
>     +               ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
>
>                                              &pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET, sizeof(pmt_val));
>
>                      if (ret != sizeof(pmt_val)) {
>
>                              drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
>
>     diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>
>     index ccc3bdeed6bb..1b93fda1f41a 100644
>
>     --- a/drivers/gpu/drm/xe/xe_pcode.c
>
>     +++ b/drivers/gpu/drm/xe/xe_pcode.c
>
>     @@ -368,11 +368,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>
>       int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
>
>       {
>
>              int ret = 0;
>
>     +       u32 guid;
>
>              guard(xe_pm_runtime)(xe);
>
>     -       ret = xe_pmt_telem_read(xe->drm.dev,
>
>     -                               xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
>
>     +       guid = xe_vsec_get_guid(xe);
>
>     +       if (!guid) {
>
>     +               xe_warn(xe, "PMT device is not powered\n");
>
>     +               return -ENODATA;
>
>     +       }
>
>     +
>
>     +       ret = xe_pmt_telem_read(xe->drm.dev, guid,
>
>                                      (u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
>
>              if (ret != sizeof(*version)) {
>
>                      xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
>
>     diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>
>     index bed5103dac19..a56f988d13eb 100644
>
>     --- a/drivers/gpu/drm/xe/xe_vsec.c
>
>     +++ b/drivers/gpu/drm/xe/xe_vsec.c
>
>     @@ -565,6 +565,46 @@ static void vsec_disable_late_bind_work(void *arg)
>
>                      xe_pm_runtime_put(xe);
>
>       }
>
>     +u32 xe_vsec_get_guid(struct xe_device *xe)
>
>     +{
>
>     +       struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>
>     +       u32 guid;
>
>     +
>
>     +       /*
>
>     +        * Both supported platforms (BMG, CRI) require the remapper callback to
>
>     +        * access data. CRI needs it for the GUID.
>
>     +        */
>
>     +       if (!xe->soc_remapper.set_telem_region)
>
>     +               return 0;
>
>     +
>
>     +       /* caller must ensure correct power state */
>
>     +       if (!xe_pm_runtime_get_if_active(xe))
>
>     +               return 0;
>
>     +
>
>     +       mutex_lock(&xe->pmt.lock);
>
>     +
>
>     +       switch (xe->info.platform) {
>
>     +       case XE_BATTLEMAGE:
>
>     +               guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
>
>     +               break;
>
>     +
>
>     +       case XE_CRESCENTISLAND:
>
>     +               xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>
>     +               guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
>
>     +               break;
>
>     +
>
>     +       default:
>
>     +               guid = 0;
>
>     +               drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
>
>     +               break;
>
>     +       }
>
>     +
>
>     +       mutex_unlock(&xe->pmt.lock);
>
>     +       xe_pm_runtime_put(xe);
>
>     +
>
>     +       return guid;
>
>     +}
>
>     +
>
>       /**
>
>        * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>
>        * interface
>
>     diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>
>     index c4a1e2fc67d8..43c3e9f227c5 100644
>
>     --- a/drivers/gpu/drm/xe/xe_vsec.h
>
>     +++ b/drivers/gpu/drm/xe/xe_vsec.h
>
>     @@ -10,6 +10,7 @@ struct device;
>
>       struct xe_device;
>
>       int xe_vsec_init(struct xe_device *xe);
>
>     +u32 xe_vsec_get_guid(struct xe_device *xe);
>
>       int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>
