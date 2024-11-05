Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A8829CE8
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 20:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730838745; cv=fail; b=P8ikeg8Kb/dl0dGVSmVumd379Tv5eey26OABXu7y37g4qb9EU1SBWeDIy1aWCV9qOKelcvcImwoiAMSm5SF7/LWL7QNZRX9rCTlwHHYFXbK74HunArFto6jWyKmW09g/TB+tCn4evrayCblvqx/dPpXSHeUK4lJ202AasTdnsi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730838745; c=relaxed/simple;
	bh=eFh9cixMBmf1gbyLxBeBtprTU8CiwpJqhV1lQj3s/qE=;
	h=Message-ID:Date:Subject:To:References:From:CC:In-Reply-To:
	 Content-Type:MIME-Version; b=SN+8ndFroFecdw1+7e0Lm1gZPpoqKyKDOwu9REhJo1GzkE17aca8werQUOCdsfRMybJeWoWQyZ9P28h99C0hvguLuve4WJWzmt0xX8IMPiyjPYDWwpsohqUZqJx8Gf2TdA5ZAOQEN0JjKvC8RFXCNk6MtCBUF1pwdvdyXxdDYiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHyhtRvU; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHyhtRvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730838743; x=1762374743;
  h=message-id:date:subject:to:references:from:cc:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eFh9cixMBmf1gbyLxBeBtprTU8CiwpJqhV1lQj3s/qE=;
  b=BHyhtRvUGhQUt9HqBTtUVmuZRJwZWjh+fQ8eGCW2MimdBX+3c4wEqOOn
   0tCqbU8UwGvy8J7MnYR4YjPqtkwiGtPHj5igIo/JEtyDTyI8fU2A6wzpl
   MX+nulLCtBJHxt5OnYozw5Wh7EYBJuDp5u/Q+2lLZquSwsPfq12vijTA8
   JQFuaE20ztveTUcXskePMte7J+WgE5tCUL9Vi1iwS4D3KitqnY4djz4dF
   SuxN0wCnjDxAYbF3TyBlNe/BU28hKeyACvRyLH7ijUdct/Wioou8w3cB0
   3TD6UeNYlmP67DckUqK3VaPGLZtB9vdeKjTkzlQ9Pw8TNibrh4HccL9kz
   A==;
X-CSE-ConnectionGUID: q7ev/mOmR2qH2mXmwRVkYQ==
X-CSE-MsgGUID: 05HQj+YUQIC1iOYXvsSKXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30775736"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30775736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 12:32:17 -0800
X-CSE-ConnectionGUID: RRYVED21T1ivcsrN0nq1Ew==
X-CSE-MsgGUID: NarE7pp5RoyFaLnDgvP/Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84985171"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Nov 2024 12:32:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 12:32:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 12:32:03 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 12:32:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Is2oRFQdvCmUbSPWUK8HeX1fBKz+u3GlWCl1EV/+tYsttwafnj92ALvSF8UC6NqGYzYXi4/vHf+eqxDL6hLGhJPiNAxmiqtw6gCgydcTxloCT3p+gepxKc8B3ikZCngIVF5b4YDRsqFFR4WfFDQ+CxbRwcMfHj1UgxCoGnbprLc67oNlhUfXnsdWUYxnZjVdBEk5Tf85Gye+cY28hxmvAK6dvCpwMbnZWBLOfOi6JezMwCBBCVXFfREPsT3HNPpiDDxAuAQDEa/MSQRzWCPLRqI5bhaDD3U6htElKJLl+JZzoN+7saPC2ZpZBo5nXf1pqdsJY4Z5SKc5WpxYF2hSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o23UXMIL2N/5okxgshyTMB65vWEuBBAD3+eh2iA0oF4=;
 b=YVwKeITCdY/gbP/mvYpqLKA3mEu5T2bamEVBGv2UnbJZbGuPBIKl+IHMUSFNheNMxiTKQRgA3qeFR8skV6+Jfjvh/PDCLJBkhGcb3Ez6jAdyThyPjURIacuukN/PTp/RaoB7p4yu3y+9f5cJZWP+2prIu+u03V9V3g2HpXASI8I+8BGJ7l6tPOmFizzTiO4wrgMhNIERGvM49CUmqBCGO3nb8VOx6GIwMpp1riLxTnMdiQfpEcsMxJCOhfJ3/VTmYIiUGD9rC/ODF8AtZMA/p9mt25vNsK8xzEAlPY0eRacxHDTbXNs3JNTwNNW55tyB13E0XKvYsPounsnoaO1UIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 20:31:59 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%4]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 20:31:59 +0000
Message-ID: <3397dd32-fa9e-4447-8be2-06b29e74960e@intel.com>
Date: Tue, 5 Nov 2024 12:31:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/ifs: Add missing
 destroy_work_on_stack()
To: Yuan Can <yuancan@huawei.com>
References: <20241105120728.21646-1-yuancan@huawei.com>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
CC: <ashok.raj.linux@gmail.com>, <tony.luck@intel.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <darcari@redhat.com>,
	<platform-driver-x86@vger.kernel.org>
In-Reply-To: <20241105120728.21646-1-yuancan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To BN0PR11MB5758.namprd11.prod.outlook.com
 (2603:10b6:408:166::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5758:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe2981e-ad2b-4a5a-8aa7-08dcfdd8e5a7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aURkWWVNNGh5L1d3Y1JjQ2JZK05iZzNoV3l5SXdxZXVBem1DYjNnTGNQdStW?=
 =?utf-8?B?TU8zZDBOcmJyYzIwK3VKUWtpMUo5WWFQcER2K3VWQlJ1Z2c3QWQ1M2JNVGs0?=
 =?utf-8?B?eWpYRTE5bVdSZE5ZSjBYa005R3hzQno2dG5UUGZZNmQvWnlKaVFwY1pmcWtJ?=
 =?utf-8?B?VytTdURZY29xTDVIaU1GMWJOZ0UyU3lzYXhoWDI5VDVFdW9Ta0g5dUhyRFFr?=
 =?utf-8?B?NFJMSUxvdDJzUHVzUm0wSjBDR3Y4RDZCcGYrNUtoSUl3YzNEaEtJZDYzLzl6?=
 =?utf-8?B?cmU1OEs3ZUx1T2I2ajBkUGZNTWJkdkxHUzBOWlNsVFdueEpIekpRdW42b2RB?=
 =?utf-8?B?R0Q2SldGTFJ0QnhWUk1RbGxHUmRobk5SK3ZRNEJFMGRNZG10Q2ZYdDREcEw0?=
 =?utf-8?B?Q3dRUXA5NHluMkNHaU9sZ0lzUE5IQmRPNk5IZ3IrL0pkOU1RUDZxTXFnN2Yy?=
 =?utf-8?B?M09NRG0ySUNGWmVoTDU5c1V5NWV2YjUxMUwycWt1SCtFL2F1VjJyNGhFWVNW?=
 =?utf-8?B?d3FiN0l1WE41ZENjbWcram5IazdqaG53MWF6dStCUjQvMFRxa2J6WDVyUEw3?=
 =?utf-8?B?VzNIaHprSWM4d3lkaERIWHlIdFExRFdvN3F0aWZ4UDV1RWUzY2JtN0RrdXpp?=
 =?utf-8?B?WWo2NllmSW5yVE81R2dMQ3p3MTVsTUhBcU9RTTN6TDZvNnhLdlBvSzJrMjdV?=
 =?utf-8?B?bC9Yd2J5UnRKeGc4OXdwSjZEbHZhb21leE4zWVlZcWUrUVhqWFBlUCtQQkp2?=
 =?utf-8?B?YkQ0Y2hOKytTcDBacVlJVkR3UzBjZkNoamdMOXlNOXR6QVZZWGNkR2c5MnEz?=
 =?utf-8?B?OHM1M2NuNFB2eXJVaXFZSkNieTh4VFRRWkw2aFJ0V0l2VGkxcjh0R2crRGMv?=
 =?utf-8?B?YXdSVmI1Y2x2ZnNiUTNLeGRPeEdIS2dSdGExOG9zSlNtbkhPcmRsMzNabHV3?=
 =?utf-8?B?Ty9CM0UxRVo3bzl5OGRYR1ltUk5IOS9rU0RKellmVDkreVVYSVJvS3RVYUh3?=
 =?utf-8?B?SjZYTXlNY1lMVzJ6YXVHRDE2UDdqODRiREZ6ZytITTlTT3RLWGpJUkN4UXB3?=
 =?utf-8?B?cS9NVVA3azBMQ011ZnJkNG9KNEtWZVRUQTVtNHBNVHkwMmhTQlJzcnh3bjZa?=
 =?utf-8?B?Z2poUjNmRXY3NWFudG5iS1NBZWtYY25lU3oxanhPa3ZRQ1lWNGs3aWVsOTRs?=
 =?utf-8?B?NW1rb25naFZDMUZzTVE5cVV6cmtMajFkRFpoa0ZJbnc2LzFmTGcxNEpQOUNC?=
 =?utf-8?B?UGticmNUYmdXV2hoMzRxZ0dWaUpIdU1QU2ZNeUpaTkV5c1VIOUYzdnk1UkNm?=
 =?utf-8?B?djErTkl0U0lWWEVmV0JNNmkvTnp1elFYdk5CbTJ6V1p1alZZL1Q5NTl5K08z?=
 =?utf-8?B?bWZqYTVtTFg0b2JuWTlOdWQrMGlIY1duc29SNnJqRkZMckhyd1BxZzd2VjVi?=
 =?utf-8?B?Z0JYVkE5TzVLNXJmeGx5NnFFVFBySXVTdXpFOXpMS3Y4b0JOQTVDczZ3aG5t?=
 =?utf-8?B?S1pqWWJyMmR6VUJPMHBDTHBhV0p4TEJYVVNWMHkwTTJTRExlcWQ4Vzc5c1Ny?=
 =?utf-8?B?Wk9TT0FYVW1IRVpkdDVwZVdMTE9UckhZZ0RIeXF6SHp0emNKay8vcExna3RG?=
 =?utf-8?B?dnlmckFKRUx5NFI0RUxwTytkRUtiQzhXdHFBMHkzc0RMNG0zb1ZkVkVMMlo0?=
 =?utf-8?B?aFIzL3dmTlZ3NkhWWExmbkJKMEFxelRldmVaLyt6aWRLZDNIVWFpY0xkWlhq?=
 =?utf-8?Q?8FyIcyBiVh5mrQ/ynAWxGMeU8f7ihCi53yIMDtu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR11MB5758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdaZ1VqYlBqbW1yTU9QaTMySlNMRzdUUkluTHMzUjBSWHY3Wkx0cWNOQkpw?=
 =?utf-8?B?QitFTTU3UGNPd2RKRlN1MDkzMGZvTjhzNXVMUFRzcjk3MTVucUpOc2d2Nk05?=
 =?utf-8?B?YzV4ZmVCWXhGQUJsQVF0SEpDOEFkNFJWM0diSnZ2WUppd2p4eHN0bnY2TmJ4?=
 =?utf-8?B?ZmxxWlZJcHVZWE1STkExMzJGaWNQNVByNEJHd0hRQ1hhUm52bHV5N2IrUTBM?=
 =?utf-8?B?ZGFvNFQxaStOOWYyWVJkZ1hobFJpTk1iai9nTUZYdkwvbm5DeTEyMk4rTkx1?=
 =?utf-8?B?c2Rwc25ackdmUVpGME80OEN5eEEyR1J5SGFQQks1VnBPQVZzTmpWZ0pncG82?=
 =?utf-8?B?K0JlR3RJYkQ2UWM5SHBqaWtRYVNFZkdIWEMyRml6M0ZBbkVNTjIyT1pydUg1?=
 =?utf-8?B?SFZjL3VHVlMzYXVQaUdnaEd3RjdqRC9SdkJTNFUrWjF3VTAvaUpTMXlzWSs1?=
 =?utf-8?B?QXduaGVxeE1seWU0NHpaeXJvdXhiOTl3WlloU0ZsVTV6SENHZ21TOUlTZW9E?=
 =?utf-8?B?QU5VdFZyMFE3ZVdwMXIwN3ZuZEUwQUpZODNscUE5Z1M4T29OQTEwUjNmS3Vm?=
 =?utf-8?B?T2JEQnorZ1daN2V0Qlc5MFBLM2ZqVU9QOHYrTjF4TGZuSG8xUVB2ZWM4UXZl?=
 =?utf-8?B?WnZZYldDQnhXVGMycnhlNDVERmtCSzR6cDZOa3Fnd2VpZHZBVE9weEczeDBa?=
 =?utf-8?B?aWg4OFp0QURFSUFXcDlvNWcybDk1VjlHK3hxQVNnMXoyeTFzYjdSTEc3K3RX?=
 =?utf-8?B?ektuaVZyZmJMYm9LQzNLZGNwcUpkckcrQWdYbEpNdnMwbTVPbTMvWnppR1VG?=
 =?utf-8?B?Ky94WGxoV1lZQlJwNVVZY1ZqVnh0QWttUkIrTlZhL21GYy9sL2hPcGJEdWdu?=
 =?utf-8?B?ckJlcUxRZktzS2NCZkY2aG8wZzJqMlNzWUtGQXZjYm1ZVW9Fb25RbmdEY0pF?=
 =?utf-8?B?WEx0Z1MwYWhPSklXeUplY3hzNERsZEhod0NTUkZFWXNYMFhicTdyMk5NV2t1?=
 =?utf-8?B?YjhpYnltNWFzNFFHQ2xuSHo2d0ppRStTWjZIL0ZJMVJpUnp1L2FDZUtaRVNa?=
 =?utf-8?B?aTBJWHZwYWt6TzYxOTFOVkRXRTJnaEtWanZHZWdKUEJyZlQwVTRCUzVhaEk4?=
 =?utf-8?B?Wlp1VXFLUG5pbmh3STdLOFpKREZ2Z3ZvMHpvTm0vMXdTbFEweGU2RTE5MUlv?=
 =?utf-8?B?R3YwRUE2V0RxK0swUzl6WGsxSDRsUHh0YVhkdE55SEdVdzBMT1YwZmZvZVVI?=
 =?utf-8?B?R0NkMFZBTmx3NDVhbFlpUXdCbWRKeTdBb1J4a09zYWVMNEJvUlloR3dtbVI2?=
 =?utf-8?B?QStmU3RXb2VFcWdSb2VhcExzSlVZSCtDK090NDd6dm5JajdXSE9PWFM3dW1v?=
 =?utf-8?B?OWZOME9qTTVvSlNyWVNYSXQ0TmVLOGZQVDN0UGdBdVI0d1p4RjQwaHdGVjdH?=
 =?utf-8?B?Q09RZElzdlNYVHFhK21abXJ4MlJ5OXR6OGhDWlVYYjRTY21Ja0FpOVZFRmty?=
 =?utf-8?B?Sy95NnN2SnlPMkdNWEhwQUNHY3JSMXJMSlNMU0EyaFhqczVxbUZNejVDVmZV?=
 =?utf-8?B?TzA4ZzFNcDV5VzZyY09WaEh1TGszSVdLd3liOU1vK2J2K3pJY1h2TGVSK2FR?=
 =?utf-8?B?M2xTSDl3cSt6RHVEV0YrdUdKS1BtVzMyS1Bid3FaVHU3djNld3RYTHEyRTJ1?=
 =?utf-8?B?cEJlb2NaT1F2Vk1YdHVYVGJtMmFaWXR3Ym1OVUQyM01HR3dVTGRXaG5ML1Qr?=
 =?utf-8?B?MmtKYlUwMXd4Tk81bXlnN0V4My9KMkJDQlZVcnQ1bUNrbmRZRFJvZnFoVjd2?=
 =?utf-8?B?Qjdiazdsdy9HdDJnTWhTUThOR08yLzJrdEMvM3hWQVlZU3FxZXRZTk1rMDQ0?=
 =?utf-8?B?RVBGNlpaeTB4UDRvT2hyWGhscEJvVVlYQlY3dnhkOCtBMHp1ak1jTmhPTjRJ?=
 =?utf-8?B?emlMUnJmazFIZncwckdrZXd3ZVNFdE1RME5YUS9mcmFtdDhLUWdjMU92YUJS?=
 =?utf-8?B?OW9kRXEzbkQ4clBrdWdaeEJaL25PbXltNTBwcnBkczl4Vy9oWE5HWHBieCty?=
 =?utf-8?B?M3NiOTFNMWh4ZDZ5NnU2d3lDUHJXbm5nOHprNU9PM1FZa3pSSE9VQXNkMGRQ?=
 =?utf-8?Q?ufPCEpBCoxS9DJ2gkc4Xaf6UE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe2981e-ad2b-4a5a-8aa7-08dcfdd8e5a7
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:31:58.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wE7c+KcX0RkxHmsxrb2wM2r1kNptEfAn1Sjeo5UwhNXxpqDtjsZD4YnxvFd+IdVxBq+K55eFelt7JKLcnpggrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
X-OriginatorOrg: intel.com



On 11/5/2024 4:07 AM, Yuan Can wrote:
> This commit add missed destroy_work_on_stack() operations for
> local_work.w in scan_chunks_sanity_check().
> 

If you were seeing any specific warnings, might be helpful to mention that too in the commit

> Fixes: 3279decb2c3c ("platform/x86/intel/ifs: Annotate work queue on stack so object debug does not complain")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/platform/x86/intel/ifs/load.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
> index de54bd1a5970..2faeb1ffbd92 100644
> --- a/drivers/platform/x86/intel/ifs/load.c
> +++ b/drivers/platform/x86/intel/ifs/load.c
> @@ -347,6 +347,7 @@ static int scan_chunks_sanity_check(struct device *dev)
>  		INIT_WORK_ONSTACK(&local_work.w, copy_hashes_authenticate_chunks);
>  		schedule_work_on(cpu, &local_work.w);
>  		wait_for_completion(&ifs_done);
> +		destroy_work_on_stack(&local_work.w);
>  		if (ifsd->loading_error) {
>  			ret = -EIO;
>  			goto out;

The change looks good to me. 
(I see other users of INIT_WORK_ONSTACK having a corresponding destroy_xxx())

Reviewed-by: Jithu Joseph <jithu.joseph@intel.com>


Thanks
Jithu

