Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38D129A78;
	Tue, 21 Jan 2025 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737490040; cv=fail; b=LXcYA6dKA/hP2gpaw4tA7XtmLLjLLoPyViPQHvxYYpIC3bBC6cmwavFknN/os0Y1CTDbQbdxbecJvuh39gq9jnTldBI04erzK97a6hVObHOFtJPp+bdLQEBVqxq5NVmNWYHYRMcbrHdHHMQlPCi6UEAGWYU4mwEnNS1UEuYPjlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737490040; c=relaxed/simple;
	bh=W0P9zWTPdVErjkHbP/8grZMrzcDOvREB7dESIpEiZhg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GHeTH2YOQiGEsaPQsZPvIEDT0+u7liTV59K/xebI7mI3x2Zf/8vFSeYIssBeZgodIxV6ACjQ7SL6XuTcRZDrGgxaSVEG+m7TaK0f7vkLgPgu7aSusiU+MAzyuKqIqGlCbwCRVUGaBXvuF/ENZRYn9nVlECsCHHkxYopHBzdqDUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTO7/c+h; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTO7/c+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737490038; x=1769026038;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W0P9zWTPdVErjkHbP/8grZMrzcDOvREB7dESIpEiZhg=;
  b=DTO7/c+hawtAiKs5uukIkuiJX5JhqYisne8xUJMP8//gZ1HMRjMxyN7e
   ujXUnd66gAfaOVUZK0Hh17jw+4vZGmgQ1s1Q2DP35oTN2g9crMOFshQnW
   yqUUQh9n/GTGbC/fii0vUxqhwGiOp5yeAghb/f4p6EQo2WQaUufDK0ONl
   r7QzPfsxhDh1rb191DyTQaWo9v1zljleJgq4sqKwH68B2U3ht0xGgGMjN
   48HOlA10KJEm1fHW+nqpli/i0RqBUYHrzIN8x33zvEbEnoS3d4dKmgeKS
   wFPh1fKz8MkYA6/RJCbK9yHyWYbItU1AEJrGIJr16H0Ys6MN8PVRWPK15
   Q==;
X-CSE-ConnectionGUID: PlSACGycTY2L13yCTb51Zg==
X-CSE-MsgGUID: RKU+7Jf3Qtu6GHEy3pAk8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="49321086"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="49321086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 12:07:17 -0800
X-CSE-ConnectionGUID: lWg6JSzrQCCstkHv6qytqw==
X-CSE-MsgGUID: E/GjsQ/YSYuLWPMuksCmpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="107026651"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jan 2025 12:07:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 12:07:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 12:07:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 12:07:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9K0CQt/PE+JcLSITKa5w8fsl/VtTSh9BTokoeABlyHl0NcWSsN0Df97y5/6jjlGOIE+g6jP9CVS6cRoPQWl2NqS26cvA7Qb94D4PYib1XfNTYComS22mjpmmj/5EG5yq9KNiC/xi70tfBGfXlxSM0mPV+gJSKSYtD7+sSHbV25uBDhzfvfplabXuFQ3xx7YPfgh8KTAZhUND4bu2LSlEyYEiZhYoTTPmzRFl/puSvTm2qhGFpvI6g3UX+azqI8pBs4SqzyrO2ix9QqRIwoE8q8QbPfyHPGyuaKxiBDUEYT/Nd2w56znuqkbdVRam9BcTVQpv0zY7jdkMkFv04jlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhAFeSky8AJ4L1maVJOC2tmNnkjdL6idwuGcCd/V8us=;
 b=gJcyccjVOEznOAMgYp3wAAg1VUP1o+IsuTAG7zUrWctlEiL59ujFWkw4cFQkqagchTkbZ5jeB9ZAsicHhHOeP/cTzmk1cOyiXEknIoqZF+SpfTIvVJI0zPafAQiMOLY2XasUVtSPQry5N85/0MjBwSHx+JaFVmPzVqGnbF/rLOB7y1wS8tM+08tfmwyZWaL+id85TSukC/XXD3nvsceLQSgYPcvbCR7RlsigTKIByzDun1vHpSlKziij2POKLVumn0qsQ+kFm6Gqgs3DbKmZpoZjFPykxfvU8P85HSAql9YfNBtqQuhwofcRoH4iv7O3LpCy7ouDBhW0f0ljvMy/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by LV8PR11MB8722.namprd11.prod.outlook.com (2603:10b6:408:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 20:06:33 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%3]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 20:06:33 +0000
Message-ID: <15f502ef-ed41-4b9a-90fe-a7af4591f0db@intel.com>
Date: Tue, 21 Jan 2025 12:06:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/intel/ifs: Update documentation to match
 current availability of firmware images
To: Anisse Astier <anisse@astier.eu>
CC: <ashok.raj.linux@gmail.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <linux-kernel@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <tony.luck@intel.com>, "Joseph, Jithu"
	<jithu.joseph@intel.com>
References: <928769f4-081c-4655-ad8a-f7b65ea21749@intel.com>
 <20250121183930.182315-1-anisse@astier.eu>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
In-Reply-To: <20250121183930.182315-1-anisse@astier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To BN0PR11MB5758.namprd11.prod.outlook.com
 (2603:10b6:408:166::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5758:EE_|LV8PR11MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d757bfc-355a-4fea-f387-08dd3a571a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDFHZE9TNXM1eGRoUTZxWExRZ3RPeVltaVJNLzcrTHdFRFZPVjNyMjhDbGJr?=
 =?utf-8?B?M3VOdWxxQXBMNk1pY0pCSjR1TXFVS24ydFFJaXRpWnhKMzArMXZjMktmVGIy?=
 =?utf-8?B?R2lKVnB5bTZEWERWVFgxclZnSDF2U3lsSFF4YUJTTUdKcUlTb0ZmOStnczlU?=
 =?utf-8?B?TVp6TmltVEtDeVB3UzFySmFkclkybGZiRGVGdnhKTHlPNWFrQnp0b0JEbm5U?=
 =?utf-8?B?MzQxbmVVRENyVE9YRndiVXZ0ajZRTE1kZ1VZd2NmSEdGUTVSakZ5bXlYb1hn?=
 =?utf-8?B?Ty81R1NRajU0dy8xUUk3dVF2NzhRWEgvTTF6dS9xTXBDc1lFaUFmY1MzYmwz?=
 =?utf-8?B?eUh1cTA2RWdxd3lBekV2WWttVUxEY2M0NzdTYTU3ZmxjSFB1dUx4SmRLT2Z0?=
 =?utf-8?B?VjBWYkVpbEZJYURYL2ZmTjdEU0lxZ0hrL2FISFY5SzFRYm94bHdKWXYrSjJJ?=
 =?utf-8?B?QU9XUXhQNlQ5M2I0L2lTUjhuSDN0amtyM05Ed2puWlMrenJ6WE9sL3pDeEJH?=
 =?utf-8?B?blpkTkthRUtxU3dHeC80LzZYUGlpWkJpa2dxRTJ2Vy8yUExBVGVQWHVOUkJW?=
 =?utf-8?B?SlRtZC9YVk5CaHd2czNCRGRBUjNGUUh2YUJJVXcwcWdrNHUrSURyL2lpWDJB?=
 =?utf-8?B?aHgxZnRobDhvaU1zQ3Q2Q2F3cGh2aGtURE5kOG1YWFdTbXhzdm1CUzZEVDZK?=
 =?utf-8?B?aUtrZXZoaUwyY1A2OGh4cHFQY0x3KzA1N0NqMzAvMDVXTU1waHc1RFpRL05t?=
 =?utf-8?B?OE93a3FBM3VOSStYVTB6bG5kblFueHBVcVY2ZUtzMkcwOEpVOFYrYWdEbXlC?=
 =?utf-8?B?ZEJQUFlMKzhXVFNCNGZ0bnVrUWh3VEVsNndUQVJpemN5T1FvVXh6elRhdWlO?=
 =?utf-8?B?Nm94eTR2YUMwR3JIVzlIYVB4RFI1aXN2cXBFQjQ5amlSL04yNlR2MFpST1Rr?=
 =?utf-8?B?VEkvdUdVUHhyNlpKdUZBMjVGOXM1amFQMUk1TXhKUFhVYnYyK0VYN0I3K1d6?=
 =?utf-8?B?ZUR0bWRiWjI3Wmhlc2Q1ZEFzMHBTVEpEMzk3REdOY29aUVMyUmFFNjhrMWVy?=
 =?utf-8?B?S0VjRmJxRE4xSit3NnNzN0xaWXV5QmVHRndnNXRKSk9zU3ltdU0ySE90WnpO?=
 =?utf-8?B?SytpeEhxbVFlVmE4ZlJPLzVpSU1CMHRFRGRsQ29LNTYrdnArL2FhNCtPc2hX?=
 =?utf-8?B?bmt3UFdVUDlDcGZXbzBLOUVqQmZSblJ4cFk5aWhkMlA0NGJIbmR2djJJV296?=
 =?utf-8?B?Nlc4OWU2K2wzWTgwZnBia3VLby85WWJ2S3docFFNZXl5ZTROeGtWMHdxSVRl?=
 =?utf-8?B?OU11c2F3WkZ1dyszYzc5WnRNSGxjZ2taLzAvbk9yaGhYL0Y0R2pYMllJaGN1?=
 =?utf-8?B?RFhGRHQwVjFTVGpMOXdjZCt6dUdndGx0aG8zU2JSVjVMSEVjWlA2czVjZU1n?=
 =?utf-8?B?VEgrd0JDa3paYzlXNXdjQ0krTk9aU3RVeTNDYmJDZkt5aC9hbXcrSE8wckI4?=
 =?utf-8?B?Z3N2Qk9zNWJjZnNkZFlrcXYvYzJJUHp0aXcwUFRkckdzdHRNL01EUzlXRzgz?=
 =?utf-8?B?TlcyV3JRMHB6UVo4NlJMelE3eHJZRGkzNjNCOTI4YnBVdnYySGVpOTZtKzEv?=
 =?utf-8?B?NXFoa1FJS0JyU3BCcHBJTkpjZmU5V2pFUUZKOE5KeU9QaGd5dGYwYVpvellu?=
 =?utf-8?B?dUE2YnFPcWxSY1RKYzNMSHJib1pPL0dQd0M1TVN3QWN4aVJaTUFndW9RbjB6?=
 =?utf-8?B?Vmh5d2FsQ2Q4enRqeEd6eGNycno3VU1JQVM4WHZLNkk4SkljcVVRcmlubWc0?=
 =?utf-8?B?c09lRkEzNm5rZnVCdWoyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR11MB5758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0hwb0ZXSDB6QmJEQ0hUenE2UWxnSnBTdWpjOXg4UEdQNDlQRHN0RFkyODhH?=
 =?utf-8?B?L3Aya2JhTWhLWTVBZ1FGNnA1bVZIMEhGVkJ5d3RCbEk2Wi90TnFnbXV6TlBH?=
 =?utf-8?B?M1BERmVldE5jdEJHNVlPUWg1TzVHeDl1UUxnTWMrMUdjSUoxY3hKanpNN0t3?=
 =?utf-8?B?NHpRaWNHLzJ5U3JJcUVTMW9PMmtvMlhnSVRxdDFkTmYvd0g4Y04xZ090QnlT?=
 =?utf-8?B?QmpaZ241MWhteUtqVG1OZytxTS9sOFJBZjNHd0dMalVJR0VHY1VIZ09KTWph?=
 =?utf-8?B?RjJiaHQxeWNDN254aHh0U2E5Qy9oRkRXaHFUUVhQMDM5V1pQU3hpSERSRm5E?=
 =?utf-8?B?OEV2UzlPMEYxUytBTTZjaTIrQTBiV3NBbDZwVzk5ZTFxeTNmVVM2Y3N6T1VV?=
 =?utf-8?B?MXB4VkZldVB4WHlYOVZOVmtSYWVzRlBGbkpYenRQVmRiT0Y0U3hHZEkwNnVL?=
 =?utf-8?B?d0xIRVBoSVBEUjEvY3YrNEMxc2NURlp4SmMrVGdlTGp1SW1iNEFSbWw4U05n?=
 =?utf-8?B?SE9abzFUZzRsWXJ3OWZlV204ZXovWXM1d2U0SUtkUW53aDNOdHFYRndxemhy?=
 =?utf-8?B?RGNrQzlkdnFvcExlNVZLNmFHTWFwbVRQYmZXQ0JxV243VXdvVnFFMDB5NVM2?=
 =?utf-8?B?UU9rYXVYcTN1VktSK2FjTFo2V0dOWE8yc3R1Z0hXRXg4M0tzZ0pMR0ZmZGc4?=
 =?utf-8?B?aVdna0UyVCszUWVsa3hMNCs4UU1FY2g5blZPRzNZNzhaK01Vck1LK2lKSjU3?=
 =?utf-8?B?VDMwaDlMaXRlS1hCMDJacUJEQlBmcjNBYUt1OHE3Tk14YjZxWWVkRGxsUkQ3?=
 =?utf-8?B?WU9UZUVtWGJwZlF5c2VFa3BXUnAyVGdVZkFpNk9HNGs3QjdSc0xsMVFjRTFy?=
 =?utf-8?B?ZG41WFV5Z1Zud1BVWGZpRTdjSDVZbldMYnllSmxkQXlqV0hXSW1oelR1akdm?=
 =?utf-8?B?STYzdkdpSmJqelJKRG0vaDQ0SFF4VlJVY2RlL3ZGNmJYNVNOemRhRTJTcXRu?=
 =?utf-8?B?OCtrV0FNQklUSUZMZExGeWlwWTBpUTd5cFp6dmRNQzRjY0YwWHVLMkFkbEtZ?=
 =?utf-8?B?d01BUGpsTU5MdUpiNUxvZjhHcWsyM3lJZ2hIR2J0V1pWajRDa2JyQjBTcmJQ?=
 =?utf-8?B?VkYvemorL0R1U0hOZlM0WEtDMTVVLzBSOVU0U00rdTlHUk1nQ2RubnZXZzlr?=
 =?utf-8?B?UkFYZHphQXFac2RyMjZTc0sxTzJQalBVZ3diQVBVVHpiaWRCWVV5NkZnV0sw?=
 =?utf-8?B?blgzR1lXSnFab1U2L2dDWGJQZzMxSi9zZUhIS2tCT2F5ckh2c3Q4Y0htWTVC?=
 =?utf-8?B?UlhlZEN0eVNTTkczOEJBUXpkVjhkeDN6QmV2cnloYzVnZElrcVZLdjVjU0hl?=
 =?utf-8?B?cUZnc2oreEp2Y0x3TWNTb1R6bkJyTXNMZjVLTytOb2xzL2JNSlRZUFJvR0Zy?=
 =?utf-8?B?ME9IWVc0Zi9mczF4WWVhNm82M1ZWcWhKMEtBa0lrelVNSTdSakNEUlFNaldp?=
 =?utf-8?B?MnJaaTZTdW40NVdPckVuVDlGWmlJdXl0L1MwOFA4eHNpMDRacjM5TE5vaGo1?=
 =?utf-8?B?ajl1c05NcW9UK296QWdKQ2Fya00wSERCbUJiUFlBVVY3cGtjUzkwU1kyMUpq?=
 =?utf-8?B?TVh3RTFaekU0aW5qR29sSDA3T1BzRjR3dEh0M01yQkx6Z2pIdWNzZW9tWXJr?=
 =?utf-8?B?S1JpNllieWVlcGV2NHdUUGhKUVgzVk5HbUxpSHZlMVdHRnkzOGFSMTJMWHNH?=
 =?utf-8?B?SER3L2JZcldPcHA5QzVEOTMwL01UN200MGFNa3pzbFlxYVVYUlR0TFlpaUVT?=
 =?utf-8?B?bTdyK0JXUFliWUdidVZadmpsTWpqakJ6M2pta1ZpdjhIbHdEZXVVWGZ4dDV3?=
 =?utf-8?B?aWxlaVpjK09jRmFKdHlTV1lwU1ZZN3ZrdmRncnkwRlp2bjhmMnVDcHczWGMy?=
 =?utf-8?B?anpaWHh5M1VHbmEweS9xdTdOelFLNzNYNWdTUTFReEJBRVRDZTdSQmlhOTh0?=
 =?utf-8?B?eVROZ1d6VlpCb1Y0bUxVZkYwelRHbHpiNXVhOXNrWGN5azk2YW1pWVpudklx?=
 =?utf-8?B?eFVQSXl2S3NYOGxSZC8vNS9PQmROeG1zbTZnVHp2UWFNR3QxWkMvSm1TL0JW?=
 =?utf-8?B?ZmlRbERmcnprS2FEMlVzd3NrbzB5a3NQYkp2OEJSQ2lkblRFNDVxdU5ENUVY?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d757bfc-355a-4fea-f387-08dd3a571a42
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 20:06:33.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJi43wHqF01hYIQXV3pXqIvvSALw3lUKaymHeE70NEusv9W1NknSt865ZmNn1fABBNaYplEMpMHKnDsjSr5iXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8722
X-OriginatorOrg: intel.com



On 1/21/2025 10:39 AM, Anisse Astier wrote:
> Firmware images necessary for certain tests in the In-field scan[1] test
> suite are not available at the moment[2], and require having access to
> at least an Intel customer account[3].
> 
> Update documentation to match current state, it can be updated again
> when the images are finally published.
> 
> [1] https://www.intel.com/content/www/us/en/support/articles/000099537/processors/intel-xeon-processors.html
> [2] https://cdrdv2.intel.com/v1/dl/getContent/826383?explicitVersion=true
> [3] https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=815180
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
> Changes since v1:
>  - update commit message to clarify that only some tests need the firmware
>    images, thanks Jithu for the suggestion!
> 
> Regards,
> 
> Anisse
> ---
>  drivers/platform/x86/intel/ifs/ifs.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Looks good to me.

Reviewed-by: Jithu Joseph <jithu.joseph@intel.com>

> 
> diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
> index 5c3c0dfa1bf8..9a7ad9cc9d08 100644
> --- a/drivers/platform/x86/intel/ifs/ifs.h
> +++ b/drivers/platform/x86/intel/ifs/ifs.h
> @@ -23,9 +23,11 @@
>   * IFS Image
>   * ---------
>   *
> - * Intel provides a firmware file containing the scan tests via
> - * github [#f1]_.  Similar to microcode there is a separate file for each
> - * family-model-stepping. IFS Images are not applicable for some test types.
> + * As of early 2025, Intel provides the firmware files containing the scan tests
> + * to select customers [#f1]_. When this driver was merged in 2022, it was
> + * announced that firmware files would be available via github [#f2]_. Similar
> + * to microcode there is a separate file for each family-model-stepping. IFS
> + * Images are not applicable for some test types.
>   * Wherever applicable the sysfs directory would provide a "current_batch" file
>   * (see below) for loading the image.
>   *
> @@ -125,7 +127,8 @@
>   * 2) Hardware allows for some number of cores to be tested in parallel.
>   * The driver does not make use of this, it only tests one core at a time.
>   *
> - * .. [#f1] https://github.com/intel/TBD
> + * .. [#f1] https://www.intel.com/content/www/us/en/support/articles/000099537/processors/intel-xeon-processors.html
> + * .. [#f2] https://github.com/intel/TBD
>   *
>   *
>   * Structural Based Functional Test at Field (SBAF):

Thanks
Jithu
