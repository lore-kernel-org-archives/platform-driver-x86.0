Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0052EDDA9
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830655; cv=fail; b=hTcueP2UBg6VCoLs0Lp1FBgr5IoexOwruZI6sOgAdSTSAuLf1giWHQVnv5Ur70sbHx6JrMKKxLwEZsmbCNxT0iU1sJnaWfKwuOgnj9p9KuHwtQ/iShVqWKBj6eFd5acNeI1vkkvW+4Ba46gRgNkfOcJ9m/w6Kg6WH5gM8Y/xcZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830655; c=relaxed/simple;
	bh=+Kyn6NY/Emlxf7R9b1P4/NQoVKutKYGwJx3Y7IUyLmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rChfmtuzdBUzG0entWqmeL5EDbGWdNynzTMqTs9nW/CJRubhCZ8g2nTfFFCLx8xW8PHY/PZRV9lOjfN2+VVO2W83iW6Lofy4/CUSCo0wNSr9n9AlA0ujYyDlch5z59ZnnE5nKq6DXwxcM8aCxvnhLRP6mTEULT7Ykcj2ad5XcxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIKOatyr; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIKOatyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747830653; x=1779366653;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+Kyn6NY/Emlxf7R9b1P4/NQoVKutKYGwJx3Y7IUyLmU=;
  b=aIKOatyrZTc24v83WsoadDUkWvc61M8BFmdlbtEFP5MVR1JQIYBdHrYp
   DJ27m7Xc2xIF8VQ2xmdyFloX1DHfq+dx5Yzs2XdtTu3/ulrUVKNCetVfJ
   NPb6K63q+mvO4vWm8zez3nrQbQKCY817kZksLGeI9Lr7IinUaMZR25nTn
   OwzyqfIlnR5zixDGgqLPkvNFn0t8MlEp7P8iEvWHaD+7pF0KQf2dz0zyx
   sTrgs820ocXrltSc1S1SevYP8Uyue7L64kM0TCaM8lWO1lnpe9QupukyQ
   Un7XxCMIiCB3c3fmdSFv+Ds8mJc6Nm5Cqr9ZmfvuX9G5z26zswBV0NH4B
   g==;
X-CSE-ConnectionGUID: zFYf3UjwS4Ce58+g8rBSSw==
X-CSE-MsgGUID: wC0emC9MTWSsx5QUpRLqXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49960551"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49960551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:30:53 -0700
X-CSE-ConnectionGUID: R9G8tfvJSiabdO1NsBo2nA==
X-CSE-MsgGUID: V51phjr0SoWlKhGht8o+ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140568693"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:30:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:30:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:30:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:30:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEVuvnmFBw0KV+Zu+O+iLmqlOBcYWyHPlgtjLyzgIU8GAUbW6U/zM4x6TdbA40U2WMAM4Cr4HJ7MQ/YnmvkT68Ho+1DyKba9IhGqnzZZcGEKILi13GEamejN3BXLOTpEq7UV+L4obxHkVpc+8FcZr+ZM9nFtb/sDqNMsReGCu3cFLm3xD0+/4VCkiyQRbMM9Sl9thQSXCiSG9U5YF363vaTrc4ou8deCv6USdyb8ekw6xwpg3bZwVjR66fHuCR98nZauRpJZhsc6qsP1I/LxMvkaiUyMoKj58gKWgkL7VoihsyUOc0NYKkVJHyjhE9seVoPxmLZVi3cu4HovvymGhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Kyn6NY/Emlxf7R9b1P4/NQoVKutKYGwJx3Y7IUyLmU=;
 b=MESHK0X48L1ufFabU2l5OEqeoSuDBLWnuRh348Jgk4yTa4ewDGziVVdp8J1OXCgtuI4BhEeYtD1qvAGtTzMIqqAfeDLOMhqkZGILmzMmX2bnwBmlr6n9rknKByjuCDONzQRNQWlRyyZpE1Sdv+W4llA2eHvEo+eyVhXBpd8w5LGDD+PdktptvaALUfxtsDl2kSN5zLslDQgM7jnN8tLGjoum2UTiIgXH+ERTCAwSfPVHVQBfa8Xig09vi3+KlLJk42O/dmHVNnC0eLMMXiZpgjOzTBnqBYodzzKxx+UZbVgh5rTohU8sBlLl8xg/Bd5D9/FX0n7l0MYDvnUnar3EcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 12:30:44 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:30:44 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 3/4] platform/x86/intel/pmt: decouple sysfs and namespace
Thread-Topic: [PATCH 3/4] platform/x86/intel/pmt: decouple sysfs and namespace
Thread-Index: AQHbxnPZKOto1IawM0K/b5ZN//BTorPaFxuAgALz/LA=
Date: Wed, 21 May 2025 12:30:44 +0000
Message-ID: <IA1PR11MB64187DBDF5CEF31E82EB7A78C19EA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com>
 <20250516150416.210625-4-michael.j.ruhl@intel.com>
 <41806cdd-c08b-a7cf-8722-25ec133dcedd@linux.intel.com>
In-Reply-To: <41806cdd-c08b-a7cf-8722-25ec133dcedd@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BL1PR11MB5224:EE_
x-ms-office365-filtering-correlation-id: 49f941bb-e429-4697-960c-08dd98634ed1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZEl5SHg0RmI4aWRQcXJubjUzQkRqa3RtclBGSE1HOEIzQlpMeVBNcHFqS3Vh?=
 =?utf-8?B?VDBxTjRxeVpkRHFGdUs1SHl1dmxuK3hVTUdkSS80N3E1N3FOL0RMWGdiVnZu?=
 =?utf-8?B?YmVld05KRjRjL0IrdTdVWDZsdk5hc0ZtUnJsM2dvbStFemRIdjhUM2x2S0k3?=
 =?utf-8?B?U0w0NjUxVTBRY01rS3pCdFhmdFc2ZUxvaFJmVTNNUXRLZjhFbGQzb1AweXIr?=
 =?utf-8?B?MnZYbS9lNVU3R3d2Vk5yb3dyUTYwZGJBeG55V2l3STV0amhPTVpURnVmZ3du?=
 =?utf-8?B?OGlBUWJHTXZOdkFlSTg2cXdOZEg4V1BNelJPQWt4eHpYZlorQW0rbUVpUUkw?=
 =?utf-8?B?Wk5tOVhFQU55WCs1dmNIZDFrdldldjJsR1I3bjBZVytkSjM3b2tvNklkSzJ3?=
 =?utf-8?B?OWlRUVFNQmNNRjRyczJ4SkZhT0JST2xNZUZZTm9WR09qQlp4cWJKc1czVW5r?=
 =?utf-8?B?STAyTGJ6S0VrakNUQjdPc2FlYWYzRnJTZFYzYy9UeHJFR2oxMlR2bGR5MWZF?=
 =?utf-8?B?aWN5eFRrbmUzY1JQRkQrNDVVa1l5Z2J3Z0VkRnJ6Q0hRMXZsYXNadDVlZlBq?=
 =?utf-8?B?MHRhaEZKWXdkaHhvME16VTAvSDJWdVc5SGpHc0R0Rmt6aldjUDR5a0JGeWlG?=
 =?utf-8?B?Z01ieC9oVjVFMXZEcGtTcG0zTFlNQlorbklxZm1DK05MdFlxL0IyU2ZPeENO?=
 =?utf-8?B?TmQ3RUt2c0RmUms0NDhPaFNHV3U3QWExOUJFVktPUXJtMVo0Y05OcER4MC9U?=
 =?utf-8?B?VWVjVnRhejcyNSs5YTE2Rlc1eGRPT0dVSklLT1VnbE5KQWxuanhXM1BJUFky?=
 =?utf-8?B?S252Yk5ZMWFFTHBEYk9CWXNGMXNyTGxSZFk4ME1oUDJQTTR3ZTJmK1ZQS3lo?=
 =?utf-8?B?T0ZTSDdwaXAwYUdwV2ZKQ2xLZjVmNVVoVGY4Sm9YbG1vRFAySjArK05KUkdF?=
 =?utf-8?B?OVZzZ3JYb3djNjk0N2xyYzFNWVJ6ZURVNmlFZkV4UEp3ejF6cXlROTBSbE5J?=
 =?utf-8?B?RkRQY3BaZmhFc3hnYU5SYkU4L1AwcE8zUXNJbEFsdWhxVS83UENwZ1lGZ0M0?=
 =?utf-8?B?VUx0YzlJbVA0cVhDeDBRTXVydktLemFSdmQxMERpaDZyU2J6U01yQnR6QW1l?=
 =?utf-8?B?UEYyckc2K3M4L3VWb0t0djZSS0I2SUFXMXRWN3MweTRhQWsvOWczaDArSFR4?=
 =?utf-8?B?eklaVFhCNXdROWU3TmppOWpBeWQ2VmEyc0VuUmZhczZyNU1IczJRUU5iMXZi?=
 =?utf-8?B?TmNFWnIzM0YyRjgreFpROHA3RUU2NnluQm42MFkwWm41L1R4Yy8zeUQ5cWxr?=
 =?utf-8?B?Z1BjR0h0ZXA0WDFoRVByOWlLeElqdGlwNnVjOTFUZmNkZlZ1ekR4VDJOU2Fn?=
 =?utf-8?B?cEpRYWdqMi8wRGt1UkErQjJ4Slg1VGJINXNFR1FKeW9rbElxdWhwWVBjYUpO?=
 =?utf-8?B?bzlJeWZSNEhhRktpSnlBNUZId1IxR2EvdkgvNWJiWStiVldwUnYvbTBHTUJp?=
 =?utf-8?B?NndRbC9UWktzUXk1NFJieHZrUGlKako5Y3ppN1ZXeFFxTE5rWGRXdTdrc3JC?=
 =?utf-8?B?UDE3SmR1S0g3dVQyRUNtMzI2Q2JPMHd2aGFFWVFXbXQ4eVhPR25GWVdDUUo2?=
 =?utf-8?B?UzlwNTYyYm1nMjY3bTI0d0c4dzY0b2ZTNTVCNmc2MlBCZnBHdlE2SFlQVzVT?=
 =?utf-8?B?dFZiTzJEQzNPWkpDa1pydy9VMHI4a28zdTFrTVVkSGdZbndWYVlYSU5Md2lX?=
 =?utf-8?B?bENsSHJ1VzFiVUo3WHFPSlJjSDlndEJtcy9ZU25FZEg0OGJaaW5Jd1NVS3lE?=
 =?utf-8?B?SkJWWG9QUzdUOE84SkJUZVBiM011cWdWU3dkNlpTWHNYa0ZQY2cxYm95UXZ3?=
 =?utf-8?B?ZEpnSVBram45bUxVL3ZmU1QySjE2MDFHWlFtdTQ3SFhTNlhzMUJ5SlJMbnNZ?=
 =?utf-8?B?c2xldFo2ejJQRnluMFRneVpzaDlOUk9OR2JoZ2UyQWRpdWpYZFNZYmVIcm1D?=
 =?utf-8?B?QjJNQjQyRkx3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHlwbmVJaU94YXRrM0RLaWo4UituUFg5cWo3WjdmOCtWNFY0Z2xxWGZoZGNT?=
 =?utf-8?B?bFpvOVFPTU9FMnZlQm13SVZwR3A1aW1jeVRhaEttYjR5dHR1ZDhweTJDUlZD?=
 =?utf-8?B?NE1JclFKWXdCSWkzdXNMbVJhNjd3SVVUb1IzbEdSYmdoRElhMkRaSU1PZmNU?=
 =?utf-8?B?dG9ZRURJU05sSUFvNkU3Rk42bFZ3OTFtUEVKZmJEVFk0TjZhNEpGVDJibVhp?=
 =?utf-8?B?TWgwUXd2d09VYUpZK0N5SXFKVHh2Vk56TWJnK1B3NXZTdllFUC8zQ3dsMTNh?=
 =?utf-8?B?UlhiZHlZNkFPV2tra29VVlNYeWlmaDZUcXZpR1NwbXhYR0F2N0tBWVhwY05s?=
 =?utf-8?B?UmdERlZubkJpSUcycEJPYzRCZTI4SXJCV3I5TlZpZHBpUFJoWFEzdGwwVzVQ?=
 =?utf-8?B?NjJscnZhZ0p2RmVVcmw5QlRiWE9ZeCt6VFU4UUhpdUlKbFJnM1ZIbVNqMUdk?=
 =?utf-8?B?Sk96S3JWMENkdjFPblpzbkVjY1ZNb0RBUFpNeEU0L3dibmRyV0wrdVNCTDhC?=
 =?utf-8?B?YUpqS21YQUhqTW4zR3VteXd0b01hTjBteHlWR3RjV3R1RTQ2RXZRbHVvMEZh?=
 =?utf-8?B?cjZXMCtaQURNMHdrSStPbHhyYVArYXE3MGxaTXJqVzZVcHp5NklrUmtKQzYz?=
 =?utf-8?B?U3NKc0JOa2RsQ29qb0d6a3hWUnVvNmtlbEdvR1pwUk43UXBmVmJNWm1lWEE3?=
 =?utf-8?B?UENNbkY2WU1RV0laOGxzSkNrczNvZ0tNUWozOExvOWRvZlJZS0dtZThuU3h0?=
 =?utf-8?B?ZXpvOEt1bHFxNXFUUWptaHdyek9WRDVNVkpPY0dBbmNiUkdGeXVwdFRSOGpK?=
 =?utf-8?B?NCtlL3pZeStOcVU5LzZWZlR3VGVhL3NHUjNqUDRXTE0yT01JVkxha052ZzY1?=
 =?utf-8?B?VTJibmhQOWpDV1FTRTFKYTFJdmVDZWV6ZUM2cnZSMU9XRTl2Mm1hVVhYR01z?=
 =?utf-8?B?a3NxSWxaMXl5a3BDeHAzSnhNcmZIdSsxUjcxMVl6MXdzNWF1MzY5T0hQcEt3?=
 =?utf-8?B?b0VFRTVjdUdWWGNXS3JMTFVHWVJiaFJmTy9PWXZXUnBJd0w0ZDBicTZQZnJE?=
 =?utf-8?B?aW5lOEJlR1BscURNN2N2WnZ0VDN0VEFVVTJCa2poQm9OUHNjWkpXemhnSEtW?=
 =?utf-8?B?eU9WMWkzc2tHWjd6bUM0aFhRb1FEYXhCQ3hMNjJEYm5Dd0RzRWliNlpEQWlN?=
 =?utf-8?B?NUFEOE9kR2JOaHR3TGwybUxwdVVDL2lnWmE4VFVSMU0vOWVqZkRUeE9MQnRJ?=
 =?utf-8?B?bEl1cHpUM293c3lVRklycW1PdXZuVndlMFVBaGhuUUhCYWlnNS9PM2orRllv?=
 =?utf-8?B?V1RPYjBTQTk5MVhBSnBEcjZTV0x0OXBwNGNXd2tUdDZuVm11bEFXNmMzQ0FR?=
 =?utf-8?B?cmQrNE1GUy8wU05RSnRrOVFrbDVDZnBLb3o4RjhWRzhndThkTDlwd2xkVENr?=
 =?utf-8?B?TTBxemU2OVZJbmJuaUF0bVNSdWdZWnlGeTVVb0R4KzBOekR1UVNubUhFMVpz?=
 =?utf-8?B?d1IvS0pKd2ROMytkSTNUZjNEY1hEeDBneGpJdE9SZE9TVWpXU2V4dlRJZjhN?=
 =?utf-8?B?Y0JCcXVESU12WEExSVNqdzU1VU1yUGpHL0ZzS3ZzQThSS0wvSGhRWVRjSUdI?=
 =?utf-8?B?cGNkVTdtL2QzLytFZ2xoQnBFb2NyYTZNSXVCZFZEcWkwcTJrempFcHdGVkdt?=
 =?utf-8?B?QlVNTjFzUmpvMlVoRG5sQktNVnp2eTBRWWRBTThRbU1zK09LZmhZK1QrYVRo?=
 =?utf-8?B?VThCWlhuOEd5YXh2ZkVNSU1ZZkJ4elBCUlNQMHdQaDhiYjZzTE1CdVBJRnFw?=
 =?utf-8?B?RlNNQUVhejNYRmx2T2o2Tk9FVzk1R21CRVZ4WGJUc0ZuUWRsc2lBWXN4Yndm?=
 =?utf-8?B?QnY3aktLd2ZCZ3dBSG5uZFZuWDQrRS95aGNmUS9aQUpWSy9SQmFiNWJKbTl4?=
 =?utf-8?B?ZzhjRWdWRVBSdTIwNTh4UzRQMGZvaXdhdklwQjMrSkpRTU1vWUppbVZDTlUy?=
 =?utf-8?B?NkJ2MUcyNzl1a2N5UXRWVmRBZVNJZkdXMVlPL2t3NlVmOG5GaDZYVmxQREFm?=
 =?utf-8?B?WkpMTVowU29ldW1kM1FmYWZVYnN1RVBqOUFuVHJIdjdqOXBuMTJoYmNaeGg3?=
 =?utf-8?Q?pK/ahEJGGu0TemAUUD+RjP1j0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f941bb-e429-4697-960c-08dd98634ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:30:44.7773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2oosUaOtlICaDyXYZSjanJ57pBzUWrGI6ZXNoqR0T1+YLpcepjK5iXgNORHv2W1F4A3Hr7JJ45hpJsha8kEgpyXI53zyHrqOHGCx6VJ8K8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSWxwbyBKw6RydmluZW4gPGlscG8u
amFydmluZW5AbGludXguaW50ZWwuY29tPg0KPlNlbnQ6IE1vbmRheSwgTWF5IDE5LCAyMDI1IDEx
OjI0IEFNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0K
PkNjOiBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy80XSBwbGF0Zm9ybS94ODYvaW50ZWwvcG10OiBkZWNvdXBsZSBzeXNmcyBhbmQNCj5u
YW1lc3BhY2UNCj4NCj5PbiBGcmksIDE2IE1heSAyMDI1LCBNaWNoYWVsIEouIFJ1aGwgd3JvdGU6
DQo+DQo+PiBUaGUgUE1UIG5hbWVzcGFjZSBpbmNsdWRlcyB0aGUgY3Jhc2hsb2cgc3lzZnMgYXR0
cmlidXRlDQo+PiBpbmZvcm1hdGlvbi4gIE90aGVyIGNyYXNobG9nIHZlcnNpb24vdHlwZXMgbWF5
IG5lZWQNCj4NCj5PbmUgc3BhY2UgaXMgZW5vdWdoIGFmdGVyIC4gKGl0IG1pZ2h0IGJlIHlvdXIg
ZWRpdG9yIGF1dG8tYWRkcyB0aGUgc2Vjb25kDQo+c3BhY2UsIGlmIHRoYXQncyB0aGUgY2FzZSwg
bG9vayBpbnRvIHRoZSBlZGl0b3JzIHNldHRpbmdzKS4NCg0KTGVhcm5lZCB0aGlzIG9uIGEgbWFu
dWFsIHR5cGV3cml0ZXIuLi5oYXMgYmVlbiBidWlsdCBpbiBmb3IgYSBsb25nIHRpbWUuIPCfmIoN
Cg0KPj4gZGlmZmVyZW50IHN5c2ZzIGF0dHJpYnV0ZXMuICBDb3VwbGluZyB0aGUgYXR0cmlidXRl
cyB3aXRoDQo+PiB0aGUgbmFtZXNwYWNlIGJsb2NrcyB0aGlzIHVzYWdlLg0KPj4NCj4+IERlY291
cGxlIHN5c2ZzIGF0dHJpYnV0ZXMgZnJvbSB0aGUgbmFtZSBzcGFjZSBhbmQgYWRkIHRoZW0NCj4+
IHRvIHRoZSBzcGVjaWZpYyBlbnRyeS4NCj4NCj5Ub28gc2hvcnQgbGluZXMgaGVyZSBhcyB3ZWxs
LCBwbGVhc2UgcmVmbG93IHRoZSBwYXJhZ3JhcGhzLg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICBkcml2
ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuYyAgICB8IDEyICsrKysrKy0tLS0tLQ0K
Pj4gIGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC9jbGFzcy5oICAgIHwgIDIgKy0NCj4+
ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY3Jhc2hsb2cuYyB8ICAzICsrLQ0KPj4g
IDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuYw0KPmIv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmMNCj4+IGluZGV4IDcyMzNiNjU0
YmJhZC4uNzQwNDgwN2MzOTQzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYv
aW50ZWwvcG10L2NsYXNzLmMNCj4+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3Bt
dC9jbGFzcy5jDQo+PiBAQCAtMjg0LDggKzI4NCw4IEBAIHN0YXRpYyBpbnQgaW50ZWxfcG10X2Rl
dl9yZWdpc3RlcihzdHJ1Y3QNCj5pbnRlbF9wbXRfZW50cnkgKmVudHJ5LA0KPj4NCj4+ICAJZW50
cnktPmtvYmogPSAmZGV2LT5rb2JqOw0KPj4NCj4+IC0JaWYgKG5zLT5hdHRyX2dycCkgew0KPj4g
LQkJcmV0ID0gc3lzZnNfY3JlYXRlX2dyb3VwKGVudHJ5LT5rb2JqLCBucy0+YXR0cl9ncnApOw0K
Pj4gKwlpZiAoZW50cnktPmF0dHJfZ3JwKSB7DQo+PiArCQlyZXQgPSBzeXNmc19jcmVhdGVfZ3Jv
dXAoZW50cnktPmtvYmosIGVudHJ5LT5hdHRyX2dycCk7DQo+PiAgCQlpZiAocmV0KQ0KPj4gIAkJ
CWdvdG8gZmFpbF9zeXNmc19jcmVhdGVfZ3JvdXA7DQo+PiAgCX0NCj4+IEBAIC0zMjYsOCArMzI2
LDggQEAgc3RhdGljIGludCBpbnRlbF9wbXRfZGV2X3JlZ2lzdGVyKHN0cnVjdA0KPmludGVsX3Bt
dF9lbnRyeSAqZW50cnksDQo+PiAgZmFpbF9hZGRfZW5kcG9pbnQ6DQo+PiAgCXN5c2ZzX3JlbW92
ZV9iaW5fZmlsZShlbnRyeS0+a29iaiwgJmVudHJ5LT5wbXRfYmluX2F0dHIpOw0KPj4gIGZhaWxf
aW9yZW1hcDoNCj4+IC0JaWYgKG5zLT5hdHRyX2dycCkNCj4+IC0JCXN5c2ZzX3JlbW92ZV9ncm91
cChlbnRyeS0+a29iaiwgbnMtPmF0dHJfZ3JwKTsNCj4+ICsJaWYgKGVudHJ5LT5hdHRyX2dycCkN
Cj4+ICsJCXN5c2ZzX3JlbW92ZV9ncm91cChlbnRyeS0+a29iaiwgZW50cnktPmF0dHJfZ3JwKTsN
Cj4+ICBmYWlsX3N5c2ZzX2NyZWF0ZV9ncm91cDoNCj4+ICAJZGV2aWNlX3VucmVnaXN0ZXIoZGV2
KTsNCj4+ICBmYWlsX2Rldl9jcmVhdGU6DQo+PiBAQCAtMzY5LDggKzM2OSw4IEBAIHZvaWQgaW50
ZWxfcG10X2Rldl9kZXN0cm95KHN0cnVjdCBpbnRlbF9wbXRfZW50cnkNCj4qZW50cnksDQo+PiAg
CWlmIChlbnRyeS0+c2l6ZSkNCj4+ICAJCXN5c2ZzX3JlbW92ZV9iaW5fZmlsZShlbnRyeS0+a29i
aiwgJmVudHJ5LT5wbXRfYmluX2F0dHIpOw0KPj4NCj4+IC0JaWYgKG5zLT5hdHRyX2dycCkNCj4+
IC0JCXN5c2ZzX3JlbW92ZV9ncm91cChlbnRyeS0+a29iaiwgbnMtPmF0dHJfZ3JwKTsNCj4+ICsJ
aWYgKGVudHJ5LT5hdHRyX2dycCkNCj4+ICsJCXN5c2ZzX3JlbW92ZV9ncm91cChlbnRyeS0+a29i
aiwgZW50cnktPmF0dHJfZ3JwKTsNCj4+DQo+PiAgCWRldmljZV91bnJlZ2lzdGVyKGRldik7DQo+
PiAgCXhhX2VyYXNlKG5zLT54YSwgZW50cnktPmRldmlkKTsNCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuaA0KPmIvZHJpdmVycy9wbGF0Zm9ybS94
ODYvaW50ZWwvcG10L2NsYXNzLmgNCj4+IGluZGV4IGIyMDA2ZDU3Nzc5ZC4uNmIzNDU1YTg2NDcx
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmgN
Cj4+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC9jbGFzcy5oDQo+PiBAQCAt
NDEsNiArNDEsNyBAQCBzdHJ1Y3QgaW50ZWxfcG10X2VudHJ5IHsNCj4+ICAJc3RydWN0IHRlbGVt
X2VuZHBvaW50CSplcDsNCj4+ICAJc3RydWN0IGludGVsX3BtdF9oZWFkZXIJaGVhZGVyOw0KPj4g
IAlzdHJ1Y3QgYmluX2F0dHJpYnV0ZQlwbXRfYmluX2F0dHI7DQo+PiArCWNvbnN0IHN0cnVjdCBh
dHRyaWJ1dGVfZ3JvdXAgKmF0dHJfZ3JwOw0KPj4gIAlzdHJ1Y3Qga29iamVjdAkJKmtvYmo7DQo+
PiAgCXZvaWQgX19pb21lbQkJKmRpc2NfdGFibGU7DQo+PiAgCXZvaWQgX19pb21lbQkJKmJhc2U7
DQo+PiBAQCAtNTQsNyArNTUsNiBAQCBzdHJ1Y3QgaW50ZWxfcG10X2VudHJ5IHsNCj4+ICBzdHJ1
Y3QgaW50ZWxfcG10X25hbWVzcGFjZSB7DQo+PiAgCWNvbnN0IGNoYXIgKm5hbWU7DQo+PiAgCXN0
cnVjdCB4YXJyYXkgKnhhOw0KPj4gLQljb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICphdHRy
X2dycDsNCj4+ICAJaW50ICgqcG10X2hlYWRlcl9kZWNvZGUpKHN0cnVjdCBpbnRlbF9wbXRfZW50
cnkgKmVudHJ5LA0KPj4gIAkJCQkgc3RydWN0IGRldmljZSAqZGV2KTsNCj4+ICAJaW50ICgqcG10
X2FkZF9lbmRwb2ludCkoc3RydWN0IGludGVsX3ZzZWNfZGV2aWNlICppdmRldiwNCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY3Jhc2hsb2cuYw0KPmIvZHJp
dmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L2NyYXNobG9nLmMNCj4+IGluZGV4IGRiYTdlN2Mx
NTg1ZC4uYzliZmUxYzI2MzExIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYv
aW50ZWwvcG10L2NyYXNobG9nLmMNCj4+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVs
L3BtdC9jcmFzaGxvZy5jDQo+PiBAQCAtMzA3LDYgKzMwNyw4IEBAIHN0YXRpYyBpbnQgcG10X2Ny
YXNobG9nX2hlYWRlcl9kZWNvZGUoc3RydWN0DQo+aW50ZWxfcG10X2VudHJ5ICplbnRyeSwNCj4+
ICAJLyogU2l6ZSBpcyBtZWFzdXJlZCBpbiBEV09SRFMsIGJ1dCBhY2Nlc3NvciByZXR1cm5zIGJ5
dGVzICovDQo+PiAgCWhlYWRlci0+c2l6ZSA9IEdFVF9TSVpFKHJlYWRsKGRpc2NfdGFibGUgKyBT
SVpFX09GRlNFVCkpOw0KPj4NCj4+ICsJZW50cnktPmF0dHJfZ3JwID0gJnBtdF9jcmFzaGxvZ19n
cm91cDsNCj4+ICsNCj4+ICAJcmV0dXJuIDA7DQo+PiAgfQ0KPj4NCj4+IEBAIC0zMTQsNyArMzE2
LDYgQEAgc3RhdGljIERFRklORV9YQVJSQVlfQUxMT0MoY3Jhc2hsb2dfYXJyYXkpOw0KPj4gIHN0
YXRpYyBzdHJ1Y3QgaW50ZWxfcG10X25hbWVzcGFjZSBwbXRfY3Jhc2hsb2dfbnMgPSB7DQo+PiAg
CS5uYW1lID0gImNyYXNobG9nIiwNCj4+ICAJLnhhID0gJmNyYXNobG9nX2FycmF5LA0KPj4gLQku
YXR0cl9ncnAgPSAmcG10X2NyYXNobG9nX2dyb3VwLA0KPj4gIAkucG10X2hlYWRlcl9kZWNvZGUg
PSBwbXRfY3Jhc2hsb2dfaGVhZGVyX2RlY29kZSwNCj4+ICAJLnBtdF9hZGRfZW5kcG9pbnQgPSBw
bXRfY3Jhc2hsb2dfYWRkX2VuZHBvaW50LA0KPj4gIH07DQo+Pg0KPg0KPldpdGggbWlub3IgY2hh
bmdlbG9nIHJlbGF0ZWQgaXNzdWVzIGZpeGVkLA0KPg0KPlJldmlld2VkLWJ5OiBJbHBvIErDpHJ2
aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+DQo+DQo+QlRXLCBub3cgdGhh
dCBJIHJlbWVtYmVyLCB5b3Ugc2hvdWxkIGFsd2F5cyBpbmNsdWRlIHRoZSBjb3JyZWN0IGVudHJp
ZXMNCj5mcm9tIE1BSU5UQUlORVJTIGZpbGUgYXMgcmVjZWlwaWVudHMuIEl0J3Mgbm90IGVub3Vn
aCB0byBzZW5kIG9ubHkgdG8NCj5wbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZy4N
Cg0KWXVwLiAgU29ycnkgYWJvdXQgdGhhdCwgSSBmb3Jnb3QgYWJvdXQgdGhpcywgYW5kIHdpbGwg
Y29ycmVjdCBpdCBpbiBteSB1cGRhdGVzLg0KDQpNaWtlDQoNCj4tLQ0KPiBpLg0K
