Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9251C6891
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589506; cv=fail; b=i5sgx6Aym27O+J8c2kISQ2DL4YjMfDp2BxX2MctFVsBVXkB7mR+HP338oGVxpbviMSp/wA/qYdUhtDFHqyvvanKajee1qWwfjUAZ2eCRt4/qIEzqsAViP5AhUadXcvo4abEN2N21xxSI8JZf7GzVzgbRLIgbJeXtvhiAcEZuB2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589506; c=relaxed/simple;
	bh=HR1lqztalcqXbjPd5SjPwlr4RdDfge79r1LQURqCRik=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HzwX6SAJhRxQxgAZVNkIVIW5Q03UU7BHACEhFRrgM12jjtWMS3i3lHuA73lqe5e44XVl2BkZhkqRlP8lXpRLHBGCgQBYmava9CQJxTEFf134YoY90ecRCz529/n6XiUT6NR8wVdQXqt3QDrgzkIZySdP2x2rQLbm8ICsQetHs2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeMAtN8t; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeMAtN8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719589504; x=1751125504;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HR1lqztalcqXbjPd5SjPwlr4RdDfge79r1LQURqCRik=;
  b=PeMAtN8tuBhRJRo6Mk3XmFsNRxoXE1/Z8dgfB8+GfIi11kwmgofRsq5Y
   rgU3zAyiDUOb8hX2/FbFZ/RKZWPTXiR47jKaYC911F62xvJ4EVCjWlIqX
   g/KiorvUG+2ipNnBxwd/dz5Kjks4xjFFkqlWw1C4vxysg2GHNWqsw4IXo
   BdIufx1mw0/MhSGFq3W+FU2WJW7QjVgcqMggnjp1WqTX00LX22QIq53q+
   3MBZpdScT+4/6jWLdXL+15wwT49RBdSbxaMpbgc1+UiiqINpRE3hwW7Ya
   Tsh98UCtS/fxcGB6UW6uFfMknLNLwCisMvKxpuIDKwhYTSB62DG1ZgpiY
   g==;
X-CSE-ConnectionGUID: 1x2zqVZZRP+7cUid0oN5pg==
X-CSE-MsgGUID: SSLDHgdqQ96Vl1v7K8Tfgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="28170623"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="28170623"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:45:03 -0700
X-CSE-ConnectionGUID: HgzPiDoyR6G6iP6YiceG2A==
X-CSE-MsgGUID: fYDW0luXRKuGFdy8Tn+qPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44666240"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jun 2024 08:45:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 08:45:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 08:45:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 08:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8M5iOx1g1DaTw4c5sC8vigBLzK7QxfbzzJZujXiWyEOQykUSQiVoBzkJVowgbWQPrWVVjAdX8cjfKeBTmcZO6StZpObzwDioz0ls3Gabztndq9z9k15UnTHxh+Qy+sBCYEqvO2HWIzMcSPRZCkzu96hEcI+Qr5DGbVNRuCnyUCnrJa+LUBvofccScgIUtf/LDSuxaJpdq5UgAvjfpbPbxdOO0el7nIbvrNferd68XcQfevlTpVDMoXSJNMJP24eOraHBFn1lCmktsMUKxZ4to069gzsi+4e4Zppna84Zg3qWuHbo9j0ByAK1PRkDHEQl266Znofk+ZJV+54e+eAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXdds6am6rCz2dzceDJZQmtEhRNpoCFMwwr2whpuWy8=;
 b=gAY35kcRqagB48q4E9/nyJvCzlVKWXcfai8jHyMqpzceMTh/nY7UEIzwIt7/qr6j5VKGPUxpaMfIIQ2f6A2YotDULb2+4JPYNRM+3iXypObsmCX2TKhx3UC8leR9lt/0x1gz2J66bgI+15YVexBIMSCpiY+KDKvzw2TNwPfPbDfaBcb7Baw4s2/y9Q9JkfeqVcvBgjYKCY8SzTjAv71oLw+pCmQZrpC1wZckff2TWWybW0TcjyGlZGtMSKCb5DRad+IvmUqcEVJKgbC3xKF8N18zgWkCkamx5sOZQGhBc5kFUYnnwfRteHHYhXOcQX7+jt+eWa5X2noJIfRNsbz9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 15:44:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 15:44:59 +0000
Date: Fri, 28 Jun 2024 15:44:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <platform-driver-x86@vger.kernel.org>,
	<david.e.box@linux.intel.com>, <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v4 4/6] drm/xe/vsec: Support BMG devices
Message-ID: <Zn7aTAWKfmATGQnV@DUT025-TGLU.fm.intel.com>
References: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
 <20240628150945.3363575-5-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628150945.3363575-5-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0213.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 613a8a72-b6e7-4111-3e3e-08dc97894441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmtncDYvblhVY2UybGhNNi8rYmJpVEdxUE5wR2FmV0M1THhrZWgrcFkrS2V3?=
 =?utf-8?B?Ym5DVi9uUDROSExOc2dnOCtNazZFY2t6R2UrTlNsbnRnWDhZWUZRa0RDYWxv?=
 =?utf-8?B?YW1UTDFQT2lId2hNcUxaVTBvN2l5aVhxc2g2RWpjT21ZNy9WWXVRcFRNL3JV?=
 =?utf-8?B?T29ySG96eFRWSjdnNGdmNHdrUk8rNlpUOGFia0w3bnNkczd6WmZuL1cvekZl?=
 =?utf-8?B?U3Z4STk4aFQ3S1c2NCtUaTZhd2xiSGxyY0F0aU1BVzJUY2J5YTk1MUYwZXVL?=
 =?utf-8?B?RnZNb0JxMjJyRW14K1QyQTBubHFpTmhZb3h3bUM5S0wyeGJtdk8rVCsrc2sy?=
 =?utf-8?B?MHF6QU5NaWNXT3VBRGIyeWFjTi9lWkJYK2ZpWHA3U3prQURFRmNJbDNVUnNZ?=
 =?utf-8?B?bWhldmliKzk5Y1QxUmFhUGhsRUpLdEttMXVqMU1oSEdCSkRza2YyU2dPb2Rm?=
 =?utf-8?B?eW1HTW1CZDBnbmZPYUQrMlNTbmhvMkd2UFp5Zk9wMEk4WGQ4M2Z6RmMwYjgv?=
 =?utf-8?B?a2xTazA5cm5nQlR6V0tuNUdTQmtIWXRCNGR5R0lMenRmTWFCZklpanJKVko5?=
 =?utf-8?B?c2NhWW41d2RUaWwwb3dIWkJ0LzhnRFo0TEU2OU1tM3hHN2dPTnJBSEkvNGtB?=
 =?utf-8?B?SDdtOEtSTko4OXE2TzVUbFJoMGd0ZzArWHhzV0s0bUVKZ0hlMm9VNll3bzQ4?=
 =?utf-8?B?S3hsOXN3Z0pDcDJCMzFYL0xEd1FwNStHeTFsYVJOY3dxS2l1K0JZVlE3SlFH?=
 =?utf-8?B?YnpUNnZIVmxsRW8ycTduV2ZIMVQzNGI2R3ZvbER6N3d3bXNTVmZ6TFg5dUpz?=
 =?utf-8?B?WXRRayt3SGVKeVBWVitOU2pOT25rYTBFUGQ3VS93MTNNaHJRUVg1dHFIMG5Q?=
 =?utf-8?B?YkhZbTZYNTRBb21pQnk1ZE5rMWIwTm96dHFyOC9VaDlMOXVwTFJSanJsRHlO?=
 =?utf-8?B?WlZ3V3cxUkxWNEo4bWFzclF5WXpsVzlLL3FjUGVJSDRaVW5LdU1XZDREd0V3?=
 =?utf-8?B?a1V2UWgzWUpFMFFUbFQ3NnUzVVVDemphUUdjbk5DLzNHY1VySmpmSTRza1dh?=
 =?utf-8?B?bldkcHlSUFhwcjFYK01hOTJMK3pENVIvZExhM3NmQVNtclRrUnhGK0RoaC9H?=
 =?utf-8?B?a0hIVU1RS1JVTlRVcnYzWWY5WlFZcU1HaGtXS1B2M0RMWmlqTGdTSXovN3ox?=
 =?utf-8?B?VmVsSHNRTEcvVWRGZ0w3SzJobHczYVE0ZFdJUkh6Wk5uY09mdHJNREhqWTEz?=
 =?utf-8?B?TFRESk9rZmhQblBXK1Q2OXRBcGtDSVAvNUZ5emlXQ25HWjRSNEE3bUJ4NjYv?=
 =?utf-8?B?Zy9wKzcybnhwWWw0TXo0UHBCUkU1WVVLSGlLSUx2Z3dvRnZpd2pJTUIvREhh?=
 =?utf-8?B?bjlmTmFFUTdyVm9KLzIxNkMwa2duSFFaVWlJNU9jY1dXQjNEem9BTlNNWnlL?=
 =?utf-8?B?aW9lcDl3eWQycWgrbFhjUEp1SVkzTHk0U2lmcmZnYUZ3em9oaEt3Rm1PV1lL?=
 =?utf-8?B?UklyYkNJWGdQbm9XK3hpcHdjN05nK3VobkdqTjF3bFZHcGpLYkhwRm4xMHBJ?=
 =?utf-8?B?cXFBRUV0V1VYRzFZdUNBbGI2ZnJzY3BQV1hSWWpNbzRmL3pidXF5TkdJNXd0?=
 =?utf-8?B?dnltcVRMRzllYzRLYWFaNUIyRGo2bWgzcmFPd09BejlaN3VVNVNSNEZzMGRr?=
 =?utf-8?B?TUV6c0g3ZU8rQkZMQUFIUU50WG4xOUt5OXE3dERhYmlqYXl4cGpGWjB0dFBl?=
 =?utf-8?B?bnJuTm9wdm9iRmREeEVqamQvQUJvZ2N0VjdkZDhzb1JtWnhiUWZNNW53VHFl?=
 =?utf-8?B?ZU5XazVxeGRLUHhKaE9DQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGE4ZzRPME9TQzE3QzI5WDlTeEMrQ1RJV2N2UCtuYlN1b09IVnRydFZ4OXow?=
 =?utf-8?B?SXdoQkhvTnhjMVppVys5KzZ5bThaWmtXbVFrNFVEci9ubGdFRGJkNjhRN1NR?=
 =?utf-8?B?TUFmSkFWekxDVXl0VlNRcE4rYXdPVlNuY1BKU21nOUhJVURMZmxiRGtWSkM0?=
 =?utf-8?B?UW90V21zUkltWmtGWjBpbDQ0TmdiZ2dPRW9zL1NtaWpvWm96Mll4aU9FQVRp?=
 =?utf-8?B?ME9MWFlqd1Q3YXplUXZsZUREd0YvYjFKdk8rVmp5Q3lNQ3pIYTdGQWpYNEJ4?=
 =?utf-8?B?Qm1tTm9NZ2lFOVRlbU9SL3BiaEJTdisvSlZpUVFTR2xsSmhGZXhXZnh2elhx?=
 =?utf-8?B?VjhUVnpGbEk3WkltR0FRem1YVEo3dHM1L3Y5Zy9KU05VUXYwSVc1Mm1sTUJm?=
 =?utf-8?B?SFp4TVMyNm1uMyt5VEtyRDE3Z2R3cXRZL2xYZ2tBTkE0dGMwRnphSWgvV0dj?=
 =?utf-8?B?U0JMM1VqN21jUzRuWWwwZURPdXRkMnJlZUFqZEI0VHU5dmJ5bmxWcnlwN3pi?=
 =?utf-8?B?Tk1QNDVBZmhrUUxacXZ4cUZpckZjSzRBZzJpQ25udklxc0lLOTQydW5Oak04?=
 =?utf-8?B?NzJTMjUyd2xBVUVqTGJ4NDMreEtDcWNEbm44SXpsM0ZkWE1nb0xIY2E3Yy8w?=
 =?utf-8?B?cW9od0wwV3NpZ1l1UFg0eDN0VXNFeFAvdjByOHltODVVdHc0a1R2Q2lBTS92?=
 =?utf-8?B?T0FXTHhDYUdwYmNlK3N0a3JaNEpIZDBvR0ZqRG4yUUZXR3hqNjBoeTlKb25B?=
 =?utf-8?B?SXYrMFN3UFkwTDZWS1lVV1hyYTR3T0FxWGdITTN4RUgxV1dISUVTNmh3Y0Nm?=
 =?utf-8?B?K2hUb1Y4NkZ1dVJlRU0wMytlSjFlWDNFWCtoaDV4YnNKOG5nVlBkWVA2ODB2?=
 =?utf-8?B?YzlrVUlZdGZydWRxc1pRQUJGbTducVFOT2lyR0hzMkd6SmNlYkVXU2NqVUdn?=
 =?utf-8?B?MVFOdFVhN2ZUSytlLzlLVUt3a0RpV1p3d2t5QmN3UW9rbUp3NDZJazZITXg1?=
 =?utf-8?B?U2NiajYzZk9sK3YrY1dJUkJoYXdta0pybXlnM0pUOTAreUFyRkRTckQ2amVq?=
 =?utf-8?B?RmZEcGZLd1ZMNW1HNzZ0MkVnWU1tanJISFQzL0h0WkREL1Y2L3YvcXhQTnJk?=
 =?utf-8?B?NTAvNVJteVUrSCtlS3d5Q0dKWCthT3ZqdEd3OVFPLzFHTlN2Zk5FOEQ1RTZT?=
 =?utf-8?B?RXlOalRkcjc2VGlXeGI5QVJKVmd4SFR3NldMcjZsY3h1R1RWU0puY3hvU2hl?=
 =?utf-8?B?dS9BNUVWaE1helhFMXJrWnIvTjNXbmFtb1pPOU9IZHhkTUJ4N0hzN1N0V1BD?=
 =?utf-8?B?TmZFQlBuZ1JqUDZ3Vm1BbHZmdWxkNjdSa0prUjBDd1hUMzUyaHN0K1I4U3VJ?=
 =?utf-8?B?WkFCalh0akduNVU4aFZSZnRGL0plQ0Z3R1RZM2swMHBaMU02ZXJuL1RTRVVr?=
 =?utf-8?B?N0FxeDNsUEhteHlsWUZ1Q1V4SndOK09COTNVdFFJeGRqeVJwK2o3YUxHU1l5?=
 =?utf-8?B?YnJ0YW1Id0Q1MHZHMFBiRnAyYytGYXFWM2FIMkFFRUV1OWVQczdRVUwrVW1x?=
 =?utf-8?B?Wm5USlpRSGN1eUdwUU9qcWRPdVozckFIbEVTV3NZbXhpMGh5alV1T3UyaEg0?=
 =?utf-8?B?dFV2SitNZXFZSUZTa3dkNk9BMWVjVmlLbFViUWxOYUMyamNhOGpkK245UTV6?=
 =?utf-8?B?UG0zYWQzakRUTTZEc3VtVmJxNUxKa1hEOHYwbm53T1NuOWFCdkVzTGRlMk1o?=
 =?utf-8?B?OTh5Q1J0SHJydDk4K0I5cEhhTHZVZEY0ckVrbk5jRS9xRlE0TW0zNEtjM3ht?=
 =?utf-8?B?a2pNWUx6THdQTGhBK3l4bGFTdVgvNnpvUkd2bTYxU2RrMXdPdDdnUkliOGt6?=
 =?utf-8?B?MVVCZyt1eHlBa2drNjFFUzlNUFQxdWxuM1lCSzQveE1XLzlneGdCUE5NcERD?=
 =?utf-8?B?dnpTNzBPc1U1dmJUVjdoRU9CREJyRCtWWWtsRDhONGdpZ0w3emxSUVZsQVVY?=
 =?utf-8?B?RnVkaTRjUXlVZ2VYNEtHV0h6QWNzTUxweFhucGEyM1V3dDRSNHBSS1orbS9G?=
 =?utf-8?B?MzFVeTJlbTRMTm13ajIzd2IvbUIzc1ZVYjJPeGplZXR2TWZjanVjQkRlUjRB?=
 =?utf-8?B?OEJWbkw3dEFpQ3NzVUNLZ3NaaVM3dEEvWGJ4TDVFaDhzck9Sb2FtVzBCMEFK?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 613a8a72-b6e7-4111-3e3e-08dc97894441
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 15:44:59.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9bj3Pdlw/lUDX54GzwR+ZSBKo0W6VTD/yk3zpYFbCXGEUvvio1ixkK8RYXBNVRklcgUoClVNUm3byNfMndskw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
X-OriginatorOrg: intel.com

On Fri, Jun 28, 2024 at 11:09:42AM -0400, Michael J. Ruhl wrote:
> Utilize the PMT callback API to add support for the BMG
> devices.
> 

I don't really know what this feature is doing, so my comments are
purely focusing on style / code structure.

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h |   6 +
>  drivers/gpu/drm/xe/xe_vsec.c         | 214 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.h         |  13 ++
>  5 files changed, 239 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b1e03bfe4a68..5860d6db1598 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -129,6 +129,7 @@ xe-y += xe_bb.o \
>  	xe_vm.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
> +	xe_vsec.o \
>  	xe_wait_user_fence.o \
>  	xe_wa.o \
>  	xe_wopcm.o
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cfda7cb5df2c..05a666c7bbb7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,6 +53,7 @@
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vram.h"
> +#include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
>  
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> @@ -317,6 +318,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  		goto err;
>  	}
>  
> +	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
> +
>  	err = xe_display_create(xe);
>  	if (WARN_ON(err))
>  		goto err;
> @@ -692,6 +695,8 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> +	xe_vsec_init(xe);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c37be471d11c..11513d8f3a8b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -451,6 +451,12 @@ struct xe_device {
>  		struct mutex lock;
>  	} d3cold;
>  
> +	/** @pmt: Support the PMT driver callback interface */
> +	struct {
> +		/** @pmt.lock: protect access for telemetry data */
> +		struct mutex lock;
> +	} pmt;
> +
>  	/**
>  	 * @pm_callback_task: Track the active task that is running in either
>  	 * the runtime_suspend or runtime_resume callbacks.
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> new file mode 100644
> index 000000000000..7db1624a335f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2022 - 2024 Intel Corporation
> + */
> +#include <linux/intel_vsec.h>
> +#include <linux/pci.h>
> +
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_drv.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +#include "xe_pm.h"
> +#include "xe_vsec.h"
> +
> +#define SOC_BASE		0x280000
> +
> +#define BMG_PMT_BASE		0xDB000
> +#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
> +
> +#define BMG_TELEMETRY_BASE	0xE0000
> +#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)
> +
> +#define GFX_BAR			0
> +
> +#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
> +#define SG_REMAP_ACCESS(_mem)	((_mem) << 24)
> +#define SG_REMAP_BITS		GENMASK(31, 24)
> +
> +static struct intel_vsec_header bmg_telemetry = {
> +	.length = 0x10,
> +	.id = VSEC_ID_TELEMETRY,
> +	.num_entries = 2,
> +	.entry_size = 4,
> +	.tbir = GFX_BAR,
> +	.offset = BMG_DISCOVERY_OFFSET,
> +};
> +
> +static struct intel_vsec_header *bmg_capabilities[] = {
> +	&bmg_telemetry,
> +	NULL
> +};
> +
> +enum xe_vsec {
> +	XE_VSEC_UNKNOWN = 0,
> +	XE_VSEC_BMG,
> +};
> +
> +static struct intel_vsec_platform_info xe_vsec_info[] = {
> +	[XE_VSEC_BMG] = {
> +		.caps = VSEC_CAP_TELEMETRY,
> +		.headers = bmg_capabilities,
> +	},
> +	{ }
> +};
> +
> +/* GUID Decode information */
> +#define GUID_TELEM_ITERATION GENMASK(3, 0)
> +#define GUID_SEGMENT GENMASK(7, 4)
> +#define GUID_SOC_SKU GENMASK(11, 8)
> +#define GUID_DEVICE_ID GENMASK(27, 12)
> +#define GUID_CAP_TYPE GENMASK(29, 28)
> +#define GUID_RECORD_ID GENMASK(31, 30)
> +
> +enum record_id {
> +	PUNIT,
> +	OOBMSM_0,
> +	OOBMSM_1
> +};
> +
> +enum capability {
> +	CRASHLOG,
> +	TELEMETRY,
> +	WATCHER
> +};
> +
> +/*
> + * The GUID will have the following bits to decode (high bits first):
> + *
> + * X(2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
> + * X(2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
> + * XXXX(16bits)– Device ID – changes for each down bin SKU’s (0xE2F8 for BMG)
> + * X(4bits) - SOC_SKU (SKU_INDEPENDENT-0, X3-1, X2-2, G31-3),
> + * X(4bits) - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + * X(4bits) - {Telemetry space iteration number (0,1,..)}
> + *
> + */
> +static int guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +	u32 record_id = (guid & GUID_RECORD_ID) >> 30;
> +	u32 cap_type  = (guid & GUID_CAP_TYPE) >> 28;
> +	u32 device_id = (guid & GUID_DEVICE_ID) >> 12;

FIELD_GET(mask, guid);

> +
> +	if (device_id != 0xE2F8)

Magic number (0xE2F8)? Can this not be a define?

> +		return -ENODEV;
> +
> +	if (record_id > OOBMSM_1 || cap_type > WATCHER)
> +		return -EINVAL;
> +
> +	*offset = 0;
> +
> +	if (cap_type == CRASHLOG) {
> +		*index = record_id == PUNIT ? 2 : 4;
> +		return 0;
> +	}
> +
> +	switch (record_id) {
> +	case PUNIT:
> +		*index = 0;
> +		if (cap_type == TELEMETRY)
> +			*offset = 0x0200;

Same comment here for magic numbers.

> +		else /* if (cap_type == WATCHER) */
> +			*offset = 0x14A0;
> +		break;
> +
> +	case OOBMSM_0:
> +		*index = 1;
> +		if (cap_type == WATCHER)
> +			*offset = 0x18D8;
> +		break;
> +
> +	case OOBMSM_1:
> +		*index = 1;
> +		if (cap_type == TELEMETRY)
> +			*offset = 0x1000;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmt_telem_read(void *args, u32 guid, u64 *data, u32 count)
> +{
> +	struct xe_device *xe = pdev_to_xe_device((struct pci_dev *)args);
> +	void __iomem *telem_addr = xe->tiles[0].mmio.regs + BMG_TELEMETRY_OFFSET;

Based on 'tiles[0]' this feture only works on a single tile? Or is the
multi-GT support missing?

Matt

> +	u32 mem_region;
> +	u32 offset;
> +	int ret;
> +
> +	ret = guid_decode(guid, &mem_region, &offset);
> +	if (ret)
> +		return ret;
> +
> +	telem_addr += offset;
> +
> +	mutex_lock(&xe->pmt.lock);
> +
> +	/* indicate that we are not at an appropriate power level */
> +	ret = -ENODATA;
> +	if (xe_pm_runtime_get_if_active(xe) > 0) {
> +		/* set SoC re-mapper index register based on guid memory region */
> +		xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1, SG_REMAP_BITS,
> +			      SG_REMAP_ACCESS(mem_region));
> +
> +		memcpy_fromio(data, telem_addr, count);
> +		ret = count;
> +		xe_pm_runtime_put(xe);
> +	}
> +	mutex_unlock(&xe->pmt.lock);
> +
> +	return ret;
> +}
> +
> +struct pmt_callbacks xe_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +};
> +
> +static const int vsec_platforms[] = {
> +	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> +};
> +
> +static enum xe_vsec get_platform_info(struct xe_device *xe)
> +{
> +	if (xe->info.platform > XE_BATTLEMAGE)
> +		return XE_VSEC_UNKNOWN;
> +
> +	return vsec_platforms[xe->info.platform];
> +}
> +
> +/**
> + * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
> + * interface
> + * @xe: valid xe instance
> + */
> +void xe_vsec_init(struct xe_device *xe)
> +{
> +	struct intel_vsec_platform_info *info;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	enum xe_vsec platform;
> +
> +	platform = get_platform_info(xe);
> +	if (platform == XE_VSEC_UNKNOWN)
> +		return;
> +
> +	info = &xe_vsec_info[platform];
> +	if (!info->headers)
> +		return;
> +
> +	switch (platform) {
> +	case XE_VSEC_BMG:
> +		info->priv_data = &xe_pmt_cb;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/*
> +	 * Register a VSEC. Cleanup is handled using device managed
> +	 * resources.
> +	 */
> +	intel_vsec_register(pdev, info);
> +}
> +MODULE_IMPORT_NS(INTEL_VSEC);
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> new file mode 100644
> index 000000000000..3fd29a21cad6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2022 - 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_VSEC_H_
> +#define _XE_VSEC_H_
> +
> +struct xe_device;
> +
> +void xe_vsec_init(struct xe_device *xe);
> +
> +#endif
> -- 
> 2.44.0
> 
