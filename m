Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF071EC019;
	Mon, 20 Jan 2025 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737406765; cv=fail; b=OjgcAP5pozxNqiPOt1j4a4xxO7WYU4/USOoFkPLVVQVHMLymUZ/ckI5TafHzUPAfRkU0EX/iYyIueiSkUIqvDUTIUrR/iKDY3Sqqvx20YoYey6zj2QudrRDvSrhVb7S5LAraTeciuFE5mFAMYamfM3lDlYQe4bMvYEkeFdgZDcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737406765; c=relaxed/simple;
	bh=vJNfE1w427ysi121uvNTYtv483Gt/VbcCsXKVScM+YI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VCFY2mc//T3MhSZgVhZqOjDQRaN+wr9YS+ccK3KROrsvy9YMSiE8xgtRVWsJjHGa+UwX9cVPJ6Y4l4lYH8d9XowvP6fDTSih/bm9a2toxX+SzqX3t/yB0Gbn4Mzs6RPpLvHQw2iANu3gmau7TIds6wpFuIeajEJWHfKNRh12OSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAplaAOd; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAplaAOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737406764; x=1768942764;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vJNfE1w427ysi121uvNTYtv483Gt/VbcCsXKVScM+YI=;
  b=fAplaAOdgHbpuF+YlnF7bH3EQP6xsYBXu7xtWL/RVcZcKhJpsmP2Ts8N
   WzobbjLhvlawbzB9L8QjbCWY/8HkNJVsHhDBkiDo53m+Awl4CjRjWMWc1
   2YbsVZXSn7MoqyOxptKeZEVk3GRcCND72l8Nt+FsjnPu98BZOfA5dOTSU
   Sy//qC41qVx6Y4z9LVF275/aikXNCODNeDmcGCp5bqsG4+wwbYzRENGLN
   Ip67rVXSaguRkgtJq7QGz/Anu7nYlApjYw3nNnK2JCVDtCmebjxYJxSch
   /OWQd1PnEbeJDiykChVPwxb5/3oWHhNBXzuGYuvW7t08P/FTnOY/iL+m3
   A==;
X-CSE-ConnectionGUID: 4e9FnZsRTbiHXTmZ6YTpBw==
X-CSE-MsgGUID: CkAun00YT+yoU/Y3HmUR3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="60281583"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="60281583"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 12:59:23 -0800
X-CSE-ConnectionGUID: RYe2Q5XERuWadzuF+iP1pA==
X-CSE-MsgGUID: gpw7H7W8QX2fDV+SApoBlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111244494"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jan 2025 12:59:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 12:59:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 12:59:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 12:59:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9klBBABGdhcYS7mpnYek4RPbZVo6P/llQfNTJrXMUUOZdIJBIrwjBwxEu46obMljFDw0WLbyZXOoKONkSeFaw/kspUt0+uL4mcBi2qsGPgjAmxT/RPHBWq1bDhsxJFbk/XSTnXR5c95eRPTXwRX/HFIzOX8iyrmGZJmV4dB5FxNsVSs71mogtZDT8toAoXaXLXUrQjFKSZPa7pm0EoelBns39azvmhMbubAHVFkckWDnzekX34dRVvYQjHkYXja0/sL1MZcghl9FysoZx9Fr2iZ3tK2Uxy/ykvwiOqFT//eLToGYaaBK4dmcyCD09TlZWHOX4gCBZr/hFz/XK7o8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BosMI7LNWD8QzOAAxvnh8H6HqDj3TWFpREPvVXyrNjM=;
 b=SAPVi3s0GAv8LdnK7wFMdFPSDTKeoCKlv6C6svx7du66d286agkHBP4e0ZFb8h+K4W5zvUju4zw8uhL8wFSlkaMZkzLI7UMIUfGAbyzdsUHfVJ+MxpYImTia+RnNi0mSiljd+MQdgrdfRijW6X5T4vvAGQpLWcAgmYEcPfvWmHd/2TdU1gZmn5WtcReSztP+20Q/0OLGuqwZZ+sPOhz5+xKzkAvDPsq0ydQD83mdqoxMt3YIOAWIOOTQ+jZui3b4x0E2A2L3V2ZMiSR1myzK8sPhkFCaFdrzKLh20LroRQ3PmDgN/cJZHGyR3XQ2WBNszIVTMz0qfP14bseKX3NBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 20:59:06 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 20:59:06 +0000
Message-ID: <928769f4-081c-4655-ad8a-f7b65ea21749@intel.com>
Date: Mon, 20 Jan 2025 12:59:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation to match
 current availability of firmware images
To: Anisse Astier <anisse@astier.eu>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Ashok Raj <ashok.raj.linux@gmail.com>, Tony Luck <tony.luck@intel.com>,
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "Joseph, Jithu" <jithu.joseph@intel.com>
References: <20250102194358.33029-1-anisse@astier.eu>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
In-Reply-To: <20250102194358.33029-1-anisse@astier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To BN0PR11MB5758.namprd11.prod.outlook.com
 (2603:10b6:408:166::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5758:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3df66d-e137-47ff-1653-08dd399546e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHZKMnF0QmhjR28vT2JYV1U0dW5yRVVzVkc2aXpjYm1IYlVDVEpiSzBZTElW?=
 =?utf-8?B?VmZlUWxJQXI0aVl1TThwT3NNOWthZU5jdFdzQisvYUEwcmdWTFJub2VHOERK?=
 =?utf-8?B?S01IK2tTQ0RmbTBXTjEvYjNzZ2h0LzRnZStYdEEzYm9RSkFRYUtyQXQvQ0k0?=
 =?utf-8?B?ZjZrcm5xTGQ0aDVlODhReHM1OHlscFp0UGg0bjNRSXo1NkZkOVM4TVE2emZQ?=
 =?utf-8?B?MDRoK29yNWtWNWhTTzJ5b2tibFdBNkR6UWU4Qm5pODhGNHVFL2psQ3U1bCs2?=
 =?utf-8?B?OWxtQUZlUkl3QlpQTXdiYnFuditWZ1BYVytReUdGeTR4L05mZ08wZU40d0l4?=
 =?utf-8?B?MTRkZ2I5REsrTzJPZDdnc0dmYnFLcnJhWDlaZ3hDdEtkdFRVdGlQY1FpQ21k?=
 =?utf-8?B?Q0JzdmJTRjh0S0ptMjBxK01ZZ3lnR0JYbTQvbVBjbGZYdEwza1BXRlhyMmIw?=
 =?utf-8?B?SGIwQXdlZmV4bHEwbEJ1R2dsNjhZUFFBeVNqdFc0QXFtUWJHMTVZQUpoNjdJ?=
 =?utf-8?B?YVZGcjRsT1ZGMXRNRXc3ZDA5aVRrNFAyeCtIanhjaVNwejJIc3lsYXB2TVpP?=
 =?utf-8?B?dHZSZFI4ODRpUHJZeWRPQkZnTXVxS3o0dlg1bEFXdkxIQmx0dkFHbWp0M29T?=
 =?utf-8?B?bTI0ZVloUUliOWJxcGFwNE5QSVo0NlR1T0RWT0NQTDVmempiRFhCbHI0d3d4?=
 =?utf-8?B?M0dsaHo0VmcvcUZKVVAxUlNJVUR6ZDQ3Yy9zR0tydHpUM3JMcmxrY3JjaDk3?=
 =?utf-8?B?Zy9EOWVZa25jbmo1MUtoVHFCdE1BRmlkTFcyNFd3K3hqK01McFN3TGFZLzQ4?=
 =?utf-8?B?ZHV5cGswby9FUVdiVjNZcFREemJPbzRJc0R6ejZNb3VKNmg0QWo2ZzY2KzZV?=
 =?utf-8?B?TWhCNXpVbkNBM0RFcDRnQUVBVWpTZGVWZmxaWnVPclEyTXdzbHI2RHBOOEVD?=
 =?utf-8?B?bXlHT09abm8reWZpUTVkZUhrSytnRjlXSGkzRTBrc2Yvd295ck5LbUZHYUxL?=
 =?utf-8?B?aktJenRqU3JRRmVwNkxDWk1hbjBkY3BoenQzZjBSUWEyd1NML2x0QkpBT1VK?=
 =?utf-8?B?MVk5eXBPSURDbTFaVXhsS0xVR2tJSE1jQjZ4bUpWSkN4aEl3bDZTNTB2a0Y0?=
 =?utf-8?B?M3VITlIyWEhIWG9jdTczQTUrN2E4V25mZGJoRG5YS1ArR2R0VWw0eHR1Y2ky?=
 =?utf-8?B?ZHdNUldNMmExZzFSYm5tZjNBdEtkSExrUWVBQTBJMSs5VE9VdHVZZUVFRU5Q?=
 =?utf-8?B?VFI2aWp0a3ZsUE9pTWh6c1hMNERldXhzUjdjV3B5cld0QTc4QlBYT0s0WS9x?=
 =?utf-8?B?VnE3MWcrVGZ0dlAwM3VyRzRaWkVKbVh6cW9MYnE2bHFxYTBhcDV6M3JwVmdW?=
 =?utf-8?B?N29DaDFhZFN6ZGlkTjUwL1N1T28rOE9IYXdqVlNlSTNsNStLd2J3MEhaUDN1?=
 =?utf-8?B?U1h2VmZ5eTVSUC9FRVM5TUZETHJYOCtJekxmaWU2RmtxNVdBdlN5RU1vRjE5?=
 =?utf-8?B?YUQ5YlNjblhuQ214U1Y3T3Y2Z2RwdDdtMEk4cWxpdEZ4N01DSXI5WnJWbERk?=
 =?utf-8?B?MEdnRUhHdkZHRmxUajBRTG5Na3VwU2czSnRqN3hRUXNoN3VTK0NGVC9rY0Mv?=
 =?utf-8?B?WTVHTG5ST3cvOUpTY1l3Nnl6ZzFIanlPYXJqUGw2RmpCcnJHTjFHWWRkQlRu?=
 =?utf-8?B?aFFPSXAwQkdvbXBrTzdjY0IwQ2U1eERNbzhHd2JiZXhVbUY5enFpdTNta0kz?=
 =?utf-8?B?a1ROV20zcEcvOXo1OW9vbjk4WVRMWFhUOEFxSnhKWkc2Z0RUajlOOHpYK1d4?=
 =?utf-8?B?c2E5VkZGdUU5VnUvMnAzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR11MB5758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEREcXBqNmxQVzV6c0FvZFJ6TGZjeXp3eFB5Zm5Wckd4Z1duM0Yram1JTHN4?=
 =?utf-8?B?VllIQ0c2aU9MNHZjMWtaME5QRktETFpyTmtaNlRiK2NlNHF2dE5qLzN3NGtx?=
 =?utf-8?B?Zlk4cWlkc0F6U1VOVVVLa1NDRXhBVCtNSHFDUWNpRFNUUHNBYjlveklVdHpv?=
 =?utf-8?B?TDd0NnN1SDZhVjQ4UnVPN0pLQzYvcHhHU1dtVU5GQXIxQlNLTWxNdmw4MGQy?=
 =?utf-8?B?MmkyZ0FSSDd1WjBieFVYelVLZXdPSFgwZzBrTFJBUGdkRHVjTGFsVWU5M1hi?=
 =?utf-8?B?T3RDUEcxblpHVHRvNkpNN0dqQ1Ewa3BWREg1NEh4UktPdWZoZHZjQmhMZFFt?=
 =?utf-8?B?cU53T25FeWhzL3h5ZXRqYUltTkl3bnUvejhvRm1OSXI2ajN0L0FybGlXZ0Mw?=
 =?utf-8?B?dE1EMytBcnBUN0piSFZkN1BzYmZxaUhFU2k1V2IzaEhpazkzL3lFNG1uSi8v?=
 =?utf-8?B?OEFabTF4Sk9vQlFoNlFwQlRGaTR6VjdUUVNRZTdjcVNzZTZNYjhaVTdHa3Rz?=
 =?utf-8?B?L1NjMkpUTFJ2UVBLbTEvRVZ2SnRabDF0ejdWdkpVL3BPRHdrL2JCSjRrbkVT?=
 =?utf-8?B?Z05QUUs1eXVFT2dUcjBtbGJocW5DQUNSYXN3OGxXVGpvd1dESkN6QmNJT1Mr?=
 =?utf-8?B?RHo0TjhFcC9tazQ4QVhPRXlVR3ZtV0NqbEppZ1IvZ1padDB3MHRxOXQ0UUZa?=
 =?utf-8?B?VFpUSkhDWGlvMXdkVkpQOWpDRjJWZExiQjRJcXNmVXkrR1U3aEJHTER0c2k4?=
 =?utf-8?B?NDhEa0JxWm1zMy9QTGVjd0ZaK2ZGeFJZS0p2clZPTDJwYVp4ZlhISG1NSVZt?=
 =?utf-8?B?cFdTb2gzQmRNc2dTNk1OUWNzY0h4N1daMUZwZVVGb0tSaUFlUXFSaDJmYUFn?=
 =?utf-8?B?ZHFLdUNpeXNvc3RxYTZrV0JCTDR5elhpWEZCVVc3Vk5QamhySWFMV1ZEZkJ5?=
 =?utf-8?B?UVphVUh4MWFRYTQ5ZHViZFFtZjhNOGQ1TG15N1VRZU90QUp4ZUlvQ3g3eHls?=
 =?utf-8?B?M0M1Und0YU1XaithOXJTVGlxMTZJY0NJd3BhOFk3T3FCZnNZOVJNNlJ4bXFR?=
 =?utf-8?B?UUQ1QUR6K25CUzBYQTljS0prMHNLVDkwOTNBTUVGdVMxRk1Mbi90RUtGdWVp?=
 =?utf-8?B?ajFJK0x5cEZKM1JPUDVySVo2cGlOeE95VFRHQzdOVmdZeGQ0dkpyN1JpVU9D?=
 =?utf-8?B?WXBES09XKytJRGJ5RkVWOTBTRXhpNHlRaCtzb3YzN0IrN2dnd05VVzRzbVFK?=
 =?utf-8?B?ZVdSaE51cnhtNGx5SlhHb2xPNE5tTlErNWFKcFJCYUs3T0lDRi9EeEJ4Tkp6?=
 =?utf-8?B?ZUpjS0F3REJLNk1xbGY3cFVwRmthc3JWYVc2dytaV2ZWMDZUVkRwZXZoNVEw?=
 =?utf-8?B?WW5lckwvVkI5Rm9kdUNnTEVCczlaRDFPSTRNRjM0Q0hJT3I1LzZiclFKckxN?=
 =?utf-8?B?UVRSMEZiRkdEcy9uMFZpUThDUVpoVlA3R0JpeW05S2RFdXd5bzEvL0h0TWZL?=
 =?utf-8?B?V0ZySStBK1Y5ekd0eEU2d0lpbXRDUnJhUzdVTENsYW5aYjhzTTVDR3hrK0Fa?=
 =?utf-8?B?WWF0MVFGdjVWa0NtV2puMFQ4QjBhaExXYUVEc0FtV25hSjlGbjBMdHcwN04x?=
 =?utf-8?B?UnFhTFJIU3lVa3k2YVZQSTE2NzljZ2ZJR2pSdExWd2ROaUpabmpjbGwxWUhD?=
 =?utf-8?B?dGdyUkpIVnA0bE93Zkg3VHdtblZUSVNNSDZkNEZ5bWtMeHNUU3lNRHF1NDlL?=
 =?utf-8?B?NzZuRVhweVl0K3VkYlVtOXhBVDRoVXZ5QlRKY0RNRENsSUlCUzA5U0hIbHNv?=
 =?utf-8?B?UWR4U3VMb2hleEQrdnRabnBXRERVL2tvT1F2OVBMUzBWN2JMQTVqWGRvVGFG?=
 =?utf-8?B?SG1sbEtXcmM4VE5hSUZqVWtLMEdlU2hxNWlUTUdTNzlOYWZvK1JocHllQXEz?=
 =?utf-8?B?VHlJUmREY1dVYjJHeW5QdVZIeDg3aVh0dUcxNjR5VDVPY2V6K1Z1eU1PTWh6?=
 =?utf-8?B?N1dqZmZQU2JlSERNeHlvUW52Wk1QVE9EeTR1b05sUzFDWXlESjI5NG1veXBw?=
 =?utf-8?B?dkR2aVlPUEx0RXJmZCsrVm1LUzBsSW1kQ0FkTlp2V3RhUGQ0OGw0cWNlSHZw?=
 =?utf-8?B?bUNhb2tTZGhycFNSVUNIV3NsZVNUUy9xQ2hSdjdpWGQ4R2REQ3RKaitROWdt?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3df66d-e137-47ff-1653-08dd399546e5
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 20:59:06.0415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNTAw5OyixRQhrCuky8U8ISBcvnQkNPdqBCyx9jtTgL4F+c2kpJTKY9f5e6RNOJISYC0feDRcg3GGQGD0zkG0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-OriginatorOrg: intel.com


Given that Array BIST portion of IFS test suite (in [1]) can be run without any images, can I suggest the following edits

On 1/2/2025 11:43 AM, Anisse Astier wrote:
> Firmware images necessary for the In-field scan[1] functionality are not

Firmware images necessary for certain tests in In Field Scan[1] test suite are not

> available at the moment[2], and require having access to at least an
> Intel customer account[3].
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
> I realize Intel had a few troubled years, and that having this feature
> in the kernel must be quite helpful to some users. But right now, it
> cannot be used unless one has a commercial relationship with Intel.
> 
> I am not advocating for the removal of this driver; this is just an
> update of the documentation to show that the publication of the firmware
> images necessary to use the driver might have fallen through the cracks,
> and might not happen soon.
> 
> Kind regards,
> 
> Anisse
> ---
>  drivers/platform/x86/intel/ifs/ifs.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
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
