Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79530FC1C;
	Thu, 10 Sep 2026 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003777; cv=fail; b=dZYDc5rv9znE+FXQiIVr2oEaEGtikss+yhvPnOZfuBc127a1k3Vzny6lXer1WSdwA0DvOG+3Fo59Fp3SZh3rUjMbLXAapuCdfcTCWoxhJhKjM/NPnCZIoikOX7Eg8FoJ+mrsBY+aHhsiNstL7FnlmjaJ5bo9yUmiVJ4cVRjvhyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003777; c=relaxed/simple;
	bh=GfU9yAKrE7vv9DN4Wvlsl7GsjUoTeUdMQXSkkLH0g/I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YaNG9Hq6fnJdH/27N9II10yEYFWTNrny5C20lOZmpIjlQuHrS4k9Siy98Ezahi4wUIkOe1WXPOy0m64u3A4D5N9iiVfHZPMAI95oiqBUxiLrMJE1fYm+rhN9PXMlISLbkw8KdGX0FwZy70P5HlsAeuZjl4JhkGFE4NLdsSyENJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqfLFjK/; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqfLFjK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789003775; x=1820539775;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GfU9yAKrE7vv9DN4Wvlsl7GsjUoTeUdMQXSkkLH0g/I=;
  b=BqfLFjK/UuaZSHyZlmt8Xfx4CTb410s+jN1gCmrGmVEsrZS/z8KSH7EL
   KglXORS9RrOLh6NY1w3F7cWjqWdn5B+1bsXVwqFvThpzoRXjXbMAbB5GO
   hyDD++OoFHR6SGCb6aruQYOkIIDDe9yOsCAPXU8gFUQtwwJmOmPaIX82z
   ZhY/LQnMqZf8MRNFjqk62qWImG85IHfH9beBQ6E3gOb0THtbmFcw5v+//
   DhnmHu/pDbRzFy5hx5PJHZnQqTkyn9WGZdgmci19YN6PnzgupW4YwisNG
   OkOs1itwS5TsgotRFvd91Xcfk1v9DggOrNMnOnz09nBPM+FwJ3fMOCIlL
   w==;
X-CSE-ConnectionGUID: npYNEYfLSrqNFCcIPk8h3g==
X-CSE-MsgGUID: PjKWBkjXTHGsVBSgsMsDtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106959332"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="106959332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:29:34 -0700
X-CSE-ConnectionGUID: CGOLg4XvRRaza0fz6jWk3A==
X-CSE-MsgGUID: iBzzTSN2QKyfVSEgPxjgPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="301386996"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:29:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 18:29:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 18:29:33 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 18:29:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9pT0YhyzpOFmE5XAXDI064bJRmvopfeft4AsrpDv8B1j4NxCTBxirJD3e1EHkFd4Z5mVFakODZHS51eBl/US6H+rZLKY4qmKt0j5AOAbeE1ibVEM3o9Y2fPVOv48AI/ffadfZl5ppm46XdyHivMwilu9IoLGG/EBlXVGPcBQfil/WsAMWnczgJSFMqz/TI6BeJYB6fnV8a3bWSpP6DLrj3i1pCgqYRcMzZyIeN9t1kdIFz3KIoeiOHecsvH6YsS8az0q+eMLmWakfnsv+tT1BoQ8nnHtU6cLnemn2W9citwvljq1vInjjJJ8uZOU6QljywFY8sUWoBbhVC3QFI0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQzrsZpnHJWjCUtt7efg3eWx0dXipBC8BC/z84eN0rg=;
 b=dCVnGlt40T1NLl4wCZceCTP1pTGwkexfsAsOZtAJvmMMntIqs4VbFey4VqUoDBxkWaRlUCGTPcwzj1bNHtxyl1dRiQEDUYi7bmXT5zepSROz1DEFb1zt5Sg5QQgz9H6d+yKZVKi+MrueMKFlEQGqCLizWJtk+UUurDMpU+TpKuZSVAB1RHUFFzw5Urxedn26zvJ/ZjYkmKfBVfzOd7q+oVQ5NAF2wmgqkgI0sJxfouXawhn+banRUHvn7Sr3ISd5WlKD4JT3068NBmxjaFCObCdirruXlh8ULq0O5MbrP/11+FqvQa7u8FoWfzfzvDGWjkWKzJLTdgyQHgp9GHJTKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19)
 by PH9PR11MB666862.namprd11.prod.outlook.com (2603:10b6:510:3e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 01:29:26 +0000
Received: from PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae]) by PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 01:29:26 +0000
Message-ID: <2fe2c681-b748-41fa-8b56-1169c86cefbc@intel.com>
Date: Thu, 10 Sep 2026 09:29:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
To: Tim Chen <tim.c.chen@linux.intel.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Klaus Kusche <klaus.kusche@computerix.info>
CC: "Badole, Vishal" <Vishal.Badole@amd.com>, Peter Zijlstra
	<peterz@infradead.org>, <linux-kernel@vger.kernel.org>, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	<platform-driver-x86@vger.kernel.org>, K Prateek Nayak
	<KPrateek.Nayak@amd.com>, <ricardo.neri@intel.com>
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
 <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
 <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
 <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
 <3cb5cbdb227bee0b822f1550e10659faadd77a3d.camel@linux.intel.com>
 <e17ef3af-c1cd-4360-ba4b-9900ccc36ef6@computerix.info>
 <76dba935-1052-4fa9-a70c-16cecdfd12c8@amd.com>
 <4da55124e32dd0587a3516c8f5ed512bffbbb42e.camel@linux.intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <4da55124e32dd0587a3516c8f5ed512bffbbb42e.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To PH7PR11MB6005.namprd11.prod.outlook.com
 (2603:10b6:510:1e0::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6005:EE_|PH9PR11MB666862:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5a8d2b-a23f-4dfb-3a73-08df0edaf389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|13003099007|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: N4u3015l9uQLRzRKpPAhAVAQiVbxeJ13vHvt6iw8XbV9OwG6TK60EL2VVxvjh/CE2FLXBgPf23tv999z8S7U10z3OSs/IXttsjhaRP52mVAjEa+s6cXkyUlTfMnrkKi07wT5OU7DMdcZW4to+DCxxwZ0D/+GClWwv+tFZ/jS8f1ccY6NZmeIQ2aYJJrltPxpm0pneA+mzIhw2i4U8EoZ9gYDTeGaPI2oW8//+zcyvjLKTHD1yq2h17L6OB1vyJTC+ctRx8+PKC1xM3xv8nRtuEcyOgYJPAFj317H4WaNeXDCugNmVrZj0j3/aARwgBV4NhtuLZE2hq3I8DF7sr7xUk5LhxXydfaEBQp+mgm7IZtWnh6FU4mBM9xaCDXiHiqLnpgbJuYpvJXFFQTITo9FIycGZkWZIBYwoSWppPdtcfxMF/YdpubWizwdx2NIfqiL9Ii65iHgU5EwpZQc536CPWtnU/kK3vrQuIf6wxGrrCoJVi7KPUKAdx/0HVOYjLaym2kdjPigOl4wt4ywrc1DIs+/R3MVmKos9tVwkMq6CX2g87bpkURUuMOoWZFfWDwINCPytt1gEEnZNtaFmk29TxtDwVMSVRsXIxuE2oC3gnN62i2QqLVCAPjJ1Dg3M5R0Q1aP+o77OjODLDz68dNorgfig7eODdr5rMud0QU/zF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(13003099007)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRMV0l1dFRQamFRODYwQ3JILy8vS2kyU0wvNUVuMzdjVlVWRThPaEtpVStm?=
 =?utf-8?B?VGViaDNFZjJqc2szTkp1ZDlwbFNmaENpTmJMZVZzZzdqM0MydjlkTGpSSUJY?=
 =?utf-8?B?STRrNDJySHZKOS9qZkNNRzhRZWhnbDZsbkFkTWRJbTh6Rk5UQXlvOGZPMFdj?=
 =?utf-8?B?b3NaM0c4TnNSNFpyY2RFM2VGTTJmeW5xZ1FJbG9OM1AwQXh3Qm1mT1IrNUww?=
 =?utf-8?B?UndaaHFkcnhOdG5WQ1VXVTBQRlhHT2N0eWZLVzVyZXBCZWU0MHdHRlR3K00y?=
 =?utf-8?B?QUJvKzZ6RDVCaFhGSVZWYjFZRk5MYVptampiaCs3ZW9WLzlNT1kxSzJDTTNW?=
 =?utf-8?B?elZ3M0Q1N1pDckFKNmd6MDJFalVKNWNoQ3EzbkVkRklWMTJhOWpJY0UyMk9K?=
 =?utf-8?B?bEVMRUVoNWVCYVpBY1JoZFgyMm9WV0NCN1FlWEpPNGxxME9kK1RjRDBUMzQy?=
 =?utf-8?B?WkRRNWMvOXZycDJCeFpPdE53bDhtYUN3NWJPbXN4WEpxSzZMQWRGOGZkWW50?=
 =?utf-8?B?NDNQbDdUQkc4eDMxSC9VZFBKVklCSGVHajRzSDltYTVObjJHVmFlRGp3NVpa?=
 =?utf-8?B?THdDbEtGZXlsYVBSNGdLK05yaHNMdVlsNDc5dnRlUWV0d3VCYjcvMUtOUVRi?=
 =?utf-8?B?Wm56U2hpY3JhK0tFUUlxeVpYUU42Q1VDbFB6L2M5Si9sU2NWRGxQMkY2clFr?=
 =?utf-8?B?Unc2cktuVnFiUE9tcmh0S2lEUmUyck5sY2NKand2d0tqZGF3Wkk1MU8wSnZP?=
 =?utf-8?B?VjY3OVFBMlVtR0F4OVNjZEg4alNoYzJHNnZtL01XbEthczFwVnJ5Q2tXYlRN?=
 =?utf-8?B?c0ErSXhPZnpmK0trVnYvbGtpYjE0SFBxZjgxMWlYVnNZSEVXZmZWek5jMFlr?=
 =?utf-8?B?clpzZXhucTErODRuQWx6TVZNdnFmbmNoSEttdGhXS1R6bGI4dFI2TFoyMTBD?=
 =?utf-8?B?aTVtbEt6WEdIRldnRUFoOVA3Mmp5Q1ZrQVMxVXdnUVJkVUlNa3BGT2Q2Zmd6?=
 =?utf-8?B?V0gzd2l1ZUtCLzdCdmNuakQ5UWs1Y0I4MXcxYmVXN3lRSDh6U0w1QkI2VklP?=
 =?utf-8?B?RjF6NHBhcm5lemo5Z1c3NmhqdCtQMnhCaEQzM29adGIrUDlxVktib0l2QllV?=
 =?utf-8?B?KzB5dXhNKzNlT3ZndmduaFJJZDVOV2VtcTNRZ25yeUNLNVEyYXpaY1ZKM1VN?=
 =?utf-8?B?Z0FlSTNHalEyUmpldnRxd1RnTkZCdXNpNEtqY1p5SVlFQjN4L05wT2JoYmY3?=
 =?utf-8?B?VUJ2dlpCN0EzNC9nM3Jyb3dxc0lsYXUwdDI0OWdINmw0U1VleDJtVm80YSta?=
 =?utf-8?B?MUR4VVRDUys3QXUyQTNVTWxrSmRkUDkyOFFkU3dwdVAzUkRTTHhMbVZPSGxq?=
 =?utf-8?B?Mkt1cVc1SURvR3Z2ellJSFlxNHZ4bVJ5bzVwVG9ZaThXamtpbitKWEpkNzlm?=
 =?utf-8?B?d0FqRnhVOUtLcmJPUkZtVWcrc3dURDUzV2tpdlV5UDBveWsyTTA4a0s1SitM?=
 =?utf-8?B?WnQxOWxnMkZOVkkyS01yWXBRaU5MVHh4Z3RJNlBlb0FvSXVneFdHZTdXTnNq?=
 =?utf-8?B?dEs3aGh1d3U5YTZuRUE2U0tybnByOUVnZzdpbkszMjEyN3N4RVIxY3o1VWc0?=
 =?utf-8?B?NFFPcEJKWHI0emVDa0lYbEt2VVh0dlc1dS9ybkVSZW03TTJ1cG5CdW4zbHFZ?=
 =?utf-8?B?WVZ5Q2d4Y2RUWXU1VlV6Q3VVZkFNRFRkdEJ1Qm94MWcwTDlsdlZhdDZvM2h0?=
 =?utf-8?B?K055UnNrOXZobTVZZFZYLy83OTI1eEdqZVFnamtDM05DZ2ZjbTRoQlBHN2da?=
 =?utf-8?B?RmtWcG1hbTdKKzI0VWRDQmNsRWlpK3Z6eFZ2czgvWHhMVmFVWnhwSU9kdXJt?=
 =?utf-8?B?aU9oVmROdVRwMk1adTJhTkY1N2dnS3BEVHVQTDRxQ013R1p3anU2dGV4UVpo?=
 =?utf-8?B?cmpEWVBDZ1lMOWx4emw1STliaFZqMWQxVmZIbzVXZ1c1Z2NuVFRGU3IwZXRr?=
 =?utf-8?B?ZVZQWGpYSWFhSzVicnhXVjRGYU5wZFA5cjVwZFV4OVYvaHJFN3h1QXlaU0wz?=
 =?utf-8?B?bzRwL0JtVVFETUN4SW1aUHk4b25GOGR1dkkrcHlMekJxOFVwTkIxb0IzVU4v?=
 =?utf-8?B?MzNEcnR4WXRHRnRYSlZib2NPN3lDNzJ6WE9sYkVoekt2SGdqbDNNYjR5b1V5?=
 =?utf-8?B?d3NNUTh0QlhxVnFIb0FhUW81OWUrdUZmRDlYZTc0OThoMzJFMFBzaGF0VG1O?=
 =?utf-8?B?bktUQmxKWCtIRERMQlNJd1FwQUd5WHFRYkM0UXpWWnZnQURLYmZNeU01My9q?=
 =?utf-8?B?TlJXdGw4dFNXNCtYVWFGaUNhWFB0alpPUG4xa3hKK1pDd0t5RndKZz09?=
X-Exchange-RoutingPolicyChecked: LqhsdCoMqjgM5XWpVK9gg1w5Q+1fYmnMaLClmbBD0eG5GeDVOUEHjKV25TCIjrzpPDZ/iJVPtIuhEVa+D1Y/303Ox7nYh5IaAr1C0g7HSIlEtQx07+5aKYDkVKo8I3LTRMt44Zds8rYx0yVagkIzdFyyo5jDZsxj2MFX6CVsrJZUNi2J2b9rjCgQgTAioGR6hFSkECgYu3gZwjHeSyQCjtalqWpb6aJTAetRGVmWQ5VtZ5rULn7LSbetsrx6Qwz6kzR6lfFfSt8o8DhgMnq5mlh1btwEux2Ol9a3gd6P2j1NGjMeZfCM7jV2ln1ayQexBbdmNbDWLYTL7wLQeX26kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5a8d2b-a23f-4dfb-3a73-08df0edaf389
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:29:26.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slSO7SXaJdVoY11bIcorExhZqpo17C0EH4fOo2TIlyTDECCdGvVxh82ug59b6oJjxGPdSAW43tCSULLmv8TKcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB666862
X-OriginatorOrg: intel.com

On 9/10/2026 3:51 AM, Tim Chen wrote:
> On Wed, 2026-09-09 at 08:19 -0500, Mario Limonciello wrote:
>>
>> On 9/9/26 03:59, Klaus Kusche wrote:
>>>
>>> Hello,
>>>
>>> On 08/09/2026 23:54, Tim Chen wrote:
>>>>> I did some quick testing (no perfect benchmark environment,
>>>>> just checking runtime and CPU consumption with "time").
>>>>>
>>>>> I timed a kernel build (-j 24 and full lto, my own .config)
>>>>> and an application build (also with a lot of parallelism)
>>>>> with three different kernels:
>>>>>
>>>>> a) Cache aware scheduling completely configured off
>>>>>
>>>>> b) Cache aware scheduling turned on, but without patch
>>>>>
>>>>> c) Cache aware scheduling turned on, with patch
>>>>>
>>>>> Big/little scheduling was always on,
>>>>> Mario's patch was always applied
>>>>> (without it, results are significantly worse,
>>>>
>>>> Sorry, I am a bit confused.  You mentioned later the result for (b)
>>>> and (c) are about the same with or without the patch
>>>> exposing debugfs (commit c1e7fe5e75ed11fa85368e5a186472afd3858f3a
>>>> Mario mentioned in another mail).
>>>> But here you say the result is much worse without Mario's patch.
>>>> Is Mario's patch the one above or some other patch?
>>>
>>> The with/without patch in (b) and (c)
>>> refers to the patch you sent on 31/08/2026
>>> ( https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/ ),
>>> not to Mario's patch.
>>>
>>
>> Just to clarify Mario's patch in this context refers to the fix to
>> ITMT/debugfs fixes as Klaus doesn't nominally enable debugfs in Kconfig:
>>
>> eaece4849991d62fcd6f46637c55dcce00e25d70
>>
> 
> Ricardo reminded me that AMD's hybrid CPU relies on SD_ASYM_PACKING instead
> of SD_ASYM_CPUCAPACITY. So the patch I pointed to
> (https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/)
> only fixes the SD_ASYM_CPUCAPACITY case and would not have an effect on
> your test system.
> 
> The fact that ITMT needs to be turned on to improve performance also point
> in that direction.
> 
> There was a bug that Chen Yu fixes for ITMT compatability with cache aware scheduling.
> It prevents a task from getting stuck in the wrong LLC in the ITMT case
> (https://lore.kernel.org/lkml/20260810033742.1688718-1-yu.c.chen@intel.com/).
> Klaus, Can you apply that with Mario's ITMT/debugfs patch to see if that
> improves performance on your system?
>   
> Tim

Yes, that patch tries to coordinate ITMT with cache-aware scheduling. It 
would also
be helpful to get a dump of /sys/kernel/sched/debug/domains/*  to 
confirm that the
SD_ASYM_PACKING flag is set at the MC domains as well as 
/sys/kernel/debug/x86/sched_itmt_enabled
to double-check that ITMT is enabled and 
/sys/kernel/debug/x86/sched_core_priority to look at
CPU priorities.

thanks,
Chenyu

