Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795122386;
	b=4AI75e+Ap3QhG9s90G9miP1xHC+KJtJsuBJylDxvUkC+XhjcPogZzgowzrkzKLfDHA3+
	 gVeE10MEsGlZ1kCo27gozuyovHs+qwXxu0CSpdPetIPAYT7UFGRunlRRmh7kkAJDRFDaI
	 ojbhAzbbzHv/CHRftMPPAF1tzfAB8e0irV5guK9YINIuQ8ar+feiH8aZfmP9RRZTUn5C/
	 BkeUuJNsfLhyjUh2trJIVMVTZ3wXK95nhaYMC9qKsnp0wKcwwRzY+Ic1Zre2wneqR4XTd
	 CHxZRiJalq+0Qo1rYeak20Z+UdUFBWe3CGbkC1Ecc1FJDuk/RfuTRnGcS2EP+1PCVUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122386;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=E5/EKjh2JqveKj5gLUIMpaTSqy5tsgEoHemfFUyEtSg=;
	b=2BSqsJdh2Q4brKLcwGMNUApbv4wnzCQ7yHKU6d5LbcldnS2Ui+HXSg2/cbmSI+slsc/b
	 NL7eDTh55uneZsqnxVNCGBbPazQY6fbY7gawFECHqg1dTHsNOW74b/n9jmiw5OtiTGWUg
	 yHUUIsedF4NAZZvgrxnX46o6R5vHDr3VscoH1Pkd4maEFo4DezWPYgHZxs4KEOqf9y+qV
	 kHlqhO3FMPgUDbebQe4a43RdSM/lJ6VYAJmxX/4rnaDGtWibQImx5PZspHka9jqXlgmzC
	 9W/y1R8kMbD5cNQzKFPo08YQx+GHqstw8ojXuqZ6Xh1KRomrx60++Q+w4YWdxfWp/fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbhh6jmi;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gwrzTgsB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99623606A336
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 21:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99623606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbhh6jmi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gwrzTgsB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795122386; x=1826658386;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wsHu1CDQOHyoIy/SRvWBI9yZ6PzAb2OPXWi7cwvHe6k=;
  b=lbhh6jmi3qCXLzBQvbbS9vX3+kmxpKdlE+jTbFJj72e1xGTQ5NTPq2j/
   NAbJ9KZjCNx9ReIYfn4011U3PZopIZhVXGxGCTGzc1JzOi9pAhDadBWbf
   xFtvB/Ibhyer3cZ8XhhHfkOCzgGQpppJjKB6FUZ8mzA9KunysS+kMstXT
   MFa/rsZFKF55GI3dgfJdlV3k0L0tLF9Be+bfWh8yE1xfOYfm7oOIloNWA
   EiaT+D/EGCqBfZOUQ6d8xdOg1Dio3bOKQkxM0nEf/ZaPrRFkLeFBZrBFW
   ngoS07WlZO3v/pJhofYpA/GFsDTFf2mYw2rEKIK3HLYIqfTOLYuR2HIsF
   g==;
X-CSE-ConnectionGUID: oTuF1MbUTCe7JwAq7VMNbg==
X-CSE-MsgGUID: RhfU1jDZRZaIKLOsFIvF9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3983593"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3983593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:06:25 -0800
X-CSE-ConnectionGUID: Q/fkcfqUTOu+mOiDqRoKMQ==
X-CSE-MsgGUID: SihYWTfES1m/5hhUu/L9gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10554199"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:06:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:06:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 13:06:24 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:06:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftOFrRxVUvQ/oTAsNI0ZYf6TH+MhLkOEbx+rXtjNJ+DUzVhw0NT/F4Mxz5Y4g8LAfKfgOYaWKkELaPycH5pZesiTQgfF6yzvEyj6lwn2DgSmenXmjXmDN0rLWfxc5E4JtDFqsrnieNQCd6ivpAXn6qr6Yc14MZOac2cjAszD9diuMEzEVFbcaRGU5A84G9fjI4Un9HttJMuUe9GqsXaYLSrlZoX34v4VT2TNVtFs3yuAm6voEK9x9pqv/ylgb6ROs6F2o40gra+86ezZvRAYFlV0qNtgUnLmC3Z7qDcJaRzV9VBtG3OJPnhwmQxFYgdHILxrQ2uwQDJU6yKziWscJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5/EKjh2JqveKj5gLUIMpaTSqy5tsgEoHemfFUyEtSg=;
 b=aB/BB92S5rk6jWN3giS/+RdinqO3FUAYJOVxq2sKfDKnz7TEngt5LTI3q8PYrjC8xsUeQl43jf1oqpYZA+dDh9/0/d0p7/d8puUwTV0LE83sFL7YsBaK/PEpq48r1f8BJD6RYicXOymp14OQTAojkmFiUDc+fSRUstBVl1OLNg81XqYm0pK8YBV8fOgCuDznWASRGWLh8bYSuTjbKn+OMUBp2cjVAS9jegMInZj+g5svmZ4EvymbwpynaREtPwTFMi3P6mrczEomLq6lmkH2u7Yi4y3x/8JM1G4abYl1e+TAkMDPQaGQe4HxWB0g31uUPpmcvu8W14t0H1BHuTt0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5/EKjh2JqveKj5gLUIMpaTSqy5tsgEoHemfFUyEtSg=;
 b=gwrzTgsBYcV7kIIG5lbzGDsVZQmeSfJ8Gtx3KDzsgB+GQf5XaeVMAMzDxBeXm+VZeMq3n4sKVLtnX47W3ETIT/pUH4IUdX3EoS0kow+gYlVdu23cEh9EYq/gsclTI0XG+NSYY/NJ4UXU6XRmmYMYKjuPydH8cA/0hEJHnDgO7oU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DM3PPF4C690C788.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 21:05:10 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 21:05:10 +0000
Date: Thu, 19 Nov 2026 16:05:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>
Subject: Re: [PATCH v19 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Message-ID: <av9kgfXlujk2SeT-@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
 <20261119155438.40762-35-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119155438.40762-35-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DM3PPF4C690C788:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9807f7-cbb8-4d5e-da42-08df4680cc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|22082099003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261026140227099003|261026130827099003|261028144727099003|261021121427099003|261021123027099003|261021130227099003|261021135927099003|261021133027099003|261026121527099003|261022115727099003|261022105027099003|261022113327099003|261026135527099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: oRPqGqdb4lSi+p8uGRTEMwHv7jhpCg7noFqyIa6aw4eDlimq8pP4o4EXeTkyFkPkYyQswUCRnofZLJQWUOB+R318KTVn/tuBSugDVdP4t7hQG9upjzONkHpxl7YZ4w6uHLr0jbD5MlstG3TUbt0WeIcEf+AASXTWyEkpcf57gFZ3kAWlB9sekoSim9wZ9DM45AcFgFg9YyICyzrQlbQtOm0c2h/USpGZv7m44qeiIia8b4hDw/ws+oyIOLNcD1OU7WgY5wdzF4UQXZBCVbudFwAl1BzMHe/5JD2rMPezJngYkQxCYCB9UJFxtiiziDmjSCsFK8Hk1r1Loq06voSMm7gA2xijU+wWuwIMXtnJlQxrHB66EAr1BXI8gE5bENcWZJIurcCqopsFsahCWEx4BbwiW0ddKi3jcqqEup8SEkqUZ2L5pvFbi9X9P2JNS3yvIBDu2OVt7A7R0GR+VXT2hSVrUFfOXegm1rdW431p0/PJvYwOEnnw0e2oj+4Q4nqJGZtQbWKEiGHVCwnjD4wLzSBVN9sto/RjEaXwBnf39eo4Z8RkT3oWfJ3eMxUS8Df77hHVA3GEZOWKg06C3+Jnlh+qcrWY/Wv8NDJsH0I3lPUTojHm9lRdIGH6++3+IhEKf+Ob4rjZ7JXE92z8PVi6mZUV2M7i0H45m2iJLwsV4lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261026130827099003)(261028144727099003)(261021121427099003)(261021123027099003)(261021130227099003)(261021135927099003)(261021133027099003)(261026121527099003)(261022115727099003)(261022105027099003)(261022113327099003)(261026135527099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kdUdL/GgGHDOq1/E5huW22//Ex5SfRFjza7Sd2YCMcqwvIrrhKYjlsnrsR08?=
 =?us-ascii?Q?blAt6kQOUS21EQ61LsNLq3NWH9Yhzc/l+4KATDI2KjJffT2t3fHOd7g13VeX?=
 =?us-ascii?Q?+p7sHJCxvAEpVjY9r2GvCHHUb1XWgImhqG0a4XCeXRA38+S43PJbL1GCsgh8?=
 =?us-ascii?Q?qcDsqYzfZGqK8mu9Saofmu7Z25yu5AZBuQQ1oC9dX71A5tzQroC9zpgEIDos?=
 =?us-ascii?Q?hd0rWy/c+0I+0LYP99PBICQebGUnuqow3e+qChn1Kq/u6nYIwQmKY38jm7fQ?=
 =?us-ascii?Q?B1QHpSCoMQCQaM6WTDfjPiq4BVtkVq58MGqtLSGx9ApkUVAna9Ot8UD4zqYO?=
 =?us-ascii?Q?lmC50RDCgzcra6BlF0dnvoT5IYI87DRIVT/chJ3Z2mMtkGiApUfyUR0MUYtE?=
 =?us-ascii?Q?yJyz9OPpt2NffiRT6YelT5on4erd8PQrXIbLCW+HeeCuzbsEBNMqUMdPSP1w?=
 =?us-ascii?Q?wEJkJFuwb7lky+XFzP9PSNFdTxEVjuud/9V7aVpSmzwuam7Kedg+GXd0ORVF?=
 =?us-ascii?Q?7tsBFX+qCXJgaOm69ukApROEiUve+oOJ12itkrr3zlmRP370Vc+80wktZXCI?=
 =?us-ascii?Q?WRx8Z5wWNOAJ9DOaVQFi+z+yQyojcDLUhdWBHnL82eNOKmzB1onNM7RgwZ9V?=
 =?us-ascii?Q?odGAW6CtK2keL+w51VWwGnm7sHodDb14/TbFoIeDzi8i+8NauuZ90Xconnzb?=
 =?us-ascii?Q?MsXDrd4iF++YziX07AFl6RNN58A5qZEnWRRIpZUDYxKYcJQtZuEip84cn0Ei?=
 =?us-ascii?Q?ZhkDchu26gRW09KJH8dLKgqF2P98SpQ3rgLzYu5ZUywRtVqU6r1eSvmNcjYj?=
 =?us-ascii?Q?O5BddTm1qOGReZ2D6aa1Y+UppeR8/fmutu0jz0BK4ca9l2RzCsmxj9Sb8P06?=
 =?us-ascii?Q?+ypQip/6+qUNCtv0+XxfrFMUezhFHcochHweVfT6FeCzWBL48B1b1JY0AvAr?=
 =?us-ascii?Q?dJV5yrSCrhuuDkje5QzY5gmdKuTGIzQVHPiJUHqrdQVR0psDQpZL/kuVsO7I?=
 =?us-ascii?Q?ofO7bffIcxzOnBY//KpIuEaimLbqXXUC5QVeBiaSxh6JZSB4drCrd1mjEouo?=
 =?us-ascii?Q?ZJ4WBRq84myO512qetNMga47IrnPIkgVzMauuKeAnYq7NJr79y4OP9Jajm2/?=
 =?us-ascii?Q?qxWlT8nq+zwvvy+2qR2HWQYm1dC84GE/oNYMZHi0Hs2cXmuqg8hg0iqZPxUK?=
 =?us-ascii?Q?9docP2Ucki+6tg8g/zGAYAAb6M39Vynzy03p55GeLehYsr+bfAtvXjBoQUEI?=
 =?us-ascii?Q?nu+g8SxonuJsrCR9JMLgAnF1dOhIFFQFKVxBh2T0d3jag7ek8UVm3m+QR63I?=
 =?us-ascii?Q?lb80dVp8u9qBXlusLssUUeAOGlDBUG+tzWeiCUywKGLIZwLVYIfcKyRUOw+d?=
 =?us-ascii?Q?0dt7iwZcF5OK82hh1px937TTdZ7M9inijPvh8jkYWdQEo+YfajbEEaSAYKsS?=
 =?us-ascii?Q?SGkOwRd+fCgObkpWMMOlompgHzHItDxs6NaRp3Ztl2ekFLJiWsGhw+JnEZ6C?=
 =?us-ascii?Q?HNCvpyveDQ2j2/Izjz+hKgzl7YyDUp3BC2tZOZBBboHk9PhQXGli8TG/2mcO?=
 =?us-ascii?Q?yT3cqMZnCdmZYzbWEUis/jUeQKjsoioUZ7UZ+qUB2SqFjAQbI6BXIgCzXd6W?=
 =?us-ascii?Q?VZWtTzn2gTfqpuAnGnyG3lebh5ppN0dweTwZyhjsDRK88s5Lj+IYuJgJo3V7?=
 =?us-ascii?Q?eQP60nJfdclLJr4ie21f5RVfGqVSBHT/SoeS1ev5iBA/81E/jS4O11gK7qiD?=
 =?us-ascii?Q?mryd/GkrEA=3D=3D?=
X-Exchange-RoutingPolicyChecked: krQgU5GiIxEn5w2AQ6Bm6RkC+E2xXX2ZUbhbrNO1hqQCx4sHHv0dBMv6IFq6gynxhSZC4RvjTTnfA8JTVvMawmIc8wXFqQ5zPpkMx45ojn+pAVIzWjIH+HKqM5MiATM72HLINrZtWDzLK+mJ/jm2+20SUICfOz57g+fU+Cz6E/c/nQA0ceqwEChJSLT9ZhuPIjV6Hu4PNV34beGI5ygY7zHRm9MXVVH3Rif+ktE+af4T0zpFAU1G2S2EzPHGYXdKx7clBwR8+yEN39YujcBrtYfR6pduSjcxrFnxLNoVldGGG9Mj4Xjv8Az9+UCO3HWhDh4fBi9a3qw+I7VSzDEw/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9807f7-cbb8-4d5e-da42-08df4680cc0e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:05:10.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Pm6D1BNt8Z95TH4IjvnhMcY0A6P74Kq/3/cNBe5diisPBft/sXtuR1sRJSIzEaRei/2pu27YIRx/9bWC8XtXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C690C788
X-OriginatorOrg: intel.com

On Thu, Nov 19, 2026 at 07:54:52AM -0800, Michael J. Ruhl wrote:
> CRI PMT support requires callbacks to access the discovery data and
> control areas. Access is a common MMIO area that requires an index to
> be set before access is allowed.
> 
> Introduce the necessary callbacks to get the discovery, status and
> control information for CRI PMT usage.
> 
> Add the glue logic to register the CRI PMT functionality.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 178 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 174 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a814d7151eea..58eb85fb6a9f 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -4,6 +4,7 @@
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/errno.h>
> +#include <linux/log2.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -344,10 +345,15 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	}
>  
>  	scoped_guard(mutex, &xe->pmt.lock) {
> +		u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
> +
>  		/* set SoC re-mapper index register based on GUID memory region */
>  		xe->soc_remapper.set_telem_region(xe, mem_region);
>  
>  		memcpy_fromio(data, telem_addr, count);
> +
> +		if (device_id == CRI_DEVICE_ID)
> +			xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  	}
>  
>  	xe_pm_runtime_put(xe);
> @@ -358,20 +364,178 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	return ret == 0 ? count : ret;
>  }
>  
> -static struct pmt_callbacks xe_pmt_cb = {
> +/**
> + * xe_pmt_discovery_read - Given a device and an index, read discovery data into a buffer
> + * @dev: valid Xe device
> + * @cap_id: PMT type
> + * @element: element to access
> + * @disc_data: buffer for discovery data
> + * @count: bytes to read

count doesn't exist below...

> + *
> + * This is a callback API.  I.e this can be accessed external to the XE driver
> + * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
> + * (drm_dev_enter()).
> + *
> + * Return:
> + * * -ENODEV device is not available (hotplug)
> + * * -EINVAL for unsupported device or PMT feature
> + * * 0 on success
> + */
> +static int xe_pmt_discovery_read(struct device *dev, unsigned long cap_id, u32 element,
> +				 u32 *disc_data)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	struct intel_vsec_header *headers;
> +	int ret = 0;
> +	u32 offset;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (xe->info.platform != XE_CRESCENTISLAND) {
> +		ret = -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	switch (cap_id) {
> +	case ilog2(VSEC_CAP_TELEMETRY):
> +		headers = &cri_telemetry;
> +		break;
> +
> +	case ilog2(VSEC_CAP_CRASHLOG):
> +		headers = &cri_crashlog;
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	offset = element * (headers->entry_size * sizeof(u32));
> +	disc_addr += headers->offset + offset;
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		memcpy_fromio(disc_data, disc_addr, PMT_DISC_DWORDS * sizeof(u32));
> +	}

we probably need rpm get/put here, no?!

> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pmt_read_reg() - read a crashlog register
> + * @dev: the xe device that registered the callback
> + * @guid: PMT guid of the crashlog instance
> + * @reg: data read from the PMT data structure
> + * @offset: which data to read from the PMT data structure
> + *
> + * Read the requested PMT register based on the pcie device and guid.  The
> + * supported struct is the Crashlog Type1 Version2.
> + *
> + * Currently this is for CRI only.
> + *
> + * Return:
> + * * -ENODEV device is not available (hotplug)
> + * * -EINVAL invalid guid
> + * * 0       success
> + */
> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
> +	int ret = 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr += inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +		*reg = readl(disc_addr);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
> +	int ret = 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr += inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +		writel(reg, disc_addr);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static struct pmt_callbacks xe_bmg_pmt_cb = {
>  	.read_telem = xe_pmt_telem_read,
>  };
>  
> +static struct pmt_callbacks xe_cri_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +	.read_discovery = xe_pmt_discovery_read,
> +	.read_reg = xe_pmt_read_reg,
> +	.write_reg = xe_pmt_write_reg,
> +};
> +
>  static const int vsec_platforms[] = {
>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
>  };
>  
>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>  {
> -	if (xe->info.platform > XE_BATTLEMAGE)
> +	if (xe->info.platform > XE_CRESCENTISLAND)
>  		return XE_VSEC_UNKNOWN;
>  
> -	if (IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
> +	if (IS_SRIOV_VF(xe) &&
> +	    (xe->info.platform == XE_BATTLEMAGE ||
> +	     xe->info.platform == XE_CRESCENTISLAND))
>  		return XE_VSEC_UNKNOWN;
>  
>  	return vsec_platforms[xe->info.platform];
> @@ -399,8 +563,14 @@ void xe_vsec_init(struct xe_device *xe)
>  	switch (platform) {
>  	case XE_VSEC_BMG:
>  		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
> -		info->priv_data = &xe_pmt_cb;
> +		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
> +
> +	case XE_VSEC_CRI:
> +		xe->pmt.base_offset = CRI_PMT_OFFSET;
> +		info->priv_data = &xe_cri_pmt_cb;
> +		break;
> +
>  	default:
>  		break;
>  	}
> -- 
> 2.43.0
> 
