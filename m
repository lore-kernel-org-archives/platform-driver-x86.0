Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0921F37B6
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jan 2025 19:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736276454; cv=fail; b=Z5UPZepnwsVCqW4UKiBpw9WpGN0jzndkww2PAwmkx871wWU694EJzoI9pnMo4LZ9rL3nDN4mKYEXMrhBx3x1BzyLyPTP4xG0ZOMc4VgZOgJg5e2kC+yLO+wikOIzUiPKMaIWZSxBspTMaTCObZBLELpQKM7y5B6tfYML5OMqqu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736276454; c=relaxed/simple;
	bh=gyW9FwPnv/fgxsZ2g+W8oAhH7taLfkBjNTHs5A8Wj7k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=meNuRNKILwGSAJYQielL687I40+qxQxQuoMWWTgZKP2jr7ZN24El6Wr8+c/2VzyB47ydUiGmVfabYqGNuaOvvMT0hqTwJwGEBtFjKVrz4iDa3VDYI97Shh+baCGu2M0A8g1D++XhT8QJd69tiCWq5QOfRe2t1OjvStYqitZdPYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hndk47lT; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hndk47lT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736276452; x=1767812452;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gyW9FwPnv/fgxsZ2g+W8oAhH7taLfkBjNTHs5A8Wj7k=;
  b=hndk47lT7+AILK8aUevhm+S6Wg8H8WuG04K2Rp+BaY8W+oLeGYEfzPv8
   5YSiKxJvqrCMagcwuSdRoNO/MOsaVsU2u0GMxypz5soWdDxR4AnRfQkAh
   6kzbDZZW2QGUbnEOJpt4npoMHwPX0yEOUUMCxK7UVuMcHODQCtLFGOISl
   QVaYDkzxKxVcpBAPzE78zZrRmb7MhXRytqihFN30irQB14EeC6l4RZ8It
   AvcrF9mzCiiRPfZM76BThKt5OGmAkKWX1zMijUHgyx1beGmrfkz4hHC+c
   UFTBTiv8gfyHPXrGs6tvQ6r6xzTflRKbnPAj5jn6/GS4HrBuCYklbmGbw
   A==;
X-CSE-ConnectionGUID: FsCOVF43ToGF8LEIhqSqHA==
X-CSE-MsgGUID: qMcViPcBStmq4OE7IeOkFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36374073"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36374073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 11:00:51 -0800
X-CSE-ConnectionGUID: od/jPi6kTwWSALIYbcKDeg==
X-CSE-MsgGUID: 39gAgMzmSgCoBAYxungLfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="103346014"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2025 11:00:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 11:00:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 11:00:50 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 11:00:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSk1xZr9VFjDMJGZs2q3P2j0haw7eGiKkJzxH081ezhn1jRqWBTAyUVPvzq6jZ6j2nOjlzNmdYM0sGzgJPag5p0ir/Jc3ovf4a33cQM+0GNq7Uh6+vMv2YarnA07qzpjcbEO4axGok8LV9IHk5a9Ce0iB15p4A3k0eANYpyEp2Ao6qouPzd13CSTAzZkqggzDS33rywV+Jn5/Lpo3noJR/AQt4puc+D5p+G1SCqE7Rc9MTNoJ43KpEQLozeo44tHS+0N1TN1/c7tl/f5ipxXDDkNfhTjjKx4t7win/mSJQ83E2KaihZR3CReGbP799XXQlezsOO+kl5TkKmwIwk3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyW9FwPnv/fgxsZ2g+W8oAhH7taLfkBjNTHs5A8Wj7k=;
 b=tj0cSgvuoNvkR0brEIlu2JeWxvClCLVay/hMDB1ZA/pmahrvsywX3pvmHrYYap730UOjP/jLugiE4GwzRsiIwu4wihfx1ApGXyrJ5sM47ofT8qVH4aTNM7ednkoKRYyL/VjmiUsdFj3oiAQltI6Vgna/jYL+AHEK2Zu0rAXJj9pRrmJWdSi87SIidRHc+tQmbidC9XIPZhUG3qtaLYw3sLo+3xeIU7ws2HZBBEYrC73PFHo5AiTdWI3fq8fWwji3pDsVjARUPsLAj0wWTjYHckofZ06TIFq8NTqxjmlk3KEtG7ls3xsQt152Wdv72i5FXHJs6WzXe3fTUYcDwySiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 PH8PR11MB8063.namprd11.prod.outlook.com (2603:10b6:510:252::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 19:00:16 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 19:00:16 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.14-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.14-rc1
Thread-Index: AQHbXe06yhLYlVUUm0muMmvgprwLMrMLqosAgAAGXYA=
Date: Tue, 7 Jan 2025 19:00:16 +0000
Message-ID: <a8f8d32c0a55aa8bca4a4db98005d79805f66a25.camel@intel.com>
References: <da3e36cd68264cb0c3362206a587c94492948472.camel@intel.com>
	 <26123d25-164e-cb35-faef-90b6c45ac0b7@linux.intel.com>
In-Reply-To: <26123d25-164e-cb35-faef-90b6c45ac0b7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|PH8PR11MB8063:EE_
x-ms-office365-filtering-correlation-id: 79d72166-52a5-4777-2b22-08dd2f4d862e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZHZYUFpscnRETXBwaU1BOUVtZ3grNWdsYnE5MFRydmgvVVV1YW9lU3hXK21N?=
 =?utf-8?B?WGpmOGR1bm1OZlZJL2RNNTFCaGVHRTdTOVZwQXR4c3EvUG5pM1JBS0dmWXZU?=
 =?utf-8?B?K3BUa01DQ3NpSFRxWXBCRWZFRzFUNUJzcXBYSmg1TkNVdFF3YXQySlhmMmhM?=
 =?utf-8?B?b2EyQkExOWJLWm8xME0zdmJVbzVZY0htSHVPQVd6UlJTQUREN0N6Ri9JaHlF?=
 =?utf-8?B?c29VaDlHMHF2cDZxVkJxR0Y0K3g2MlBSa1E0NUE5SmcrN3RaTFV2blAxaDY3?=
 =?utf-8?B?Mko4NloyZmdDU0Fpamk1a3pUUGdhYThqUy9CamlnTTFmRSthMzhrTkxIbG5n?=
 =?utf-8?B?MTNMeW1sZ1l3QTN5NWlsaWZYemN2aksrWDFVMUhKcGJ3RTIrZ1J0U0xHQnh2?=
 =?utf-8?B?aE1MUjZsRDVYaXBrRWNLTm54bW12Q1UvdWhQOUpjOWx3WUFXR1FST2FjbFY4?=
 =?utf-8?B?ZkhIVnRHb296czNQMDhPZjZ6L2JTTHFEREp2VEhlZUFHMWZZZGxKRCtEWTJv?=
 =?utf-8?B?ZHFiYVlDZHZwdXhRdUUwMFFac1laZ3hoZ2Z2UnNPYTV1OWk0djJXZmM3aFJY?=
 =?utf-8?B?UjJjSmluKzIzaFUyMWlGZ0Y4Q1RtY0paU1NVSmVRV0xTSUVDdlRyZEdBRHpS?=
 =?utf-8?B?TDFsL0gzOWhjNXlrV2RBZlphQ3FCY1hkNkVwTnRybUtPcDZ3RUYyNkExZnl3?=
 =?utf-8?B?eURPdDhiNmVmd3h4KzE0bEVhK3MwU0N3ckVPbVJzM3JuNnlyOVZFeVNOTy9U?=
 =?utf-8?B?akF1amJWOVN4RkhKUHRVYzR3a2NsLzVudlBLZ2lLWW10ekJNbmVvWUFLWXZr?=
 =?utf-8?B?QzgrTDZweTN4em5Oa21rMTJZcEtpNEpvalRWckVyR3ZuS1IrV1l6Q1RrOEZJ?=
 =?utf-8?B?Q1gvaUZvZGhPNXZESnBjNnpTSysyU1JrQ2VjYmRHUnltZWJvbDg3NDBQekVR?=
 =?utf-8?B?bGxtVGZzWFVqZ2NGcFhuM1YrRjFDY1dhSlEvUUNQVjRUUmh4L2Y3clNEc0ov?=
 =?utf-8?B?NEN4ZmZ4d2h6Z2d6bUxtem1aTHozSVlocGdRUEhYa0pWcmdCNlZld21LdmZD?=
 =?utf-8?B?U3ZrRXBrNTljZk5MakxVWFlQZGdwMjJya3ZadUVmenVLT2hYTGdYNERVS0NG?=
 =?utf-8?B?bzlBbHJtVmU1TzRZN291YUFuVDg4OTM3S3JJNG8xdXNZL2JvVkN3dHZ6eE92?=
 =?utf-8?B?citkSE0xYzBBNFQ2SDNqM1ZxTGVocEprVmxzN1lYaERlMUYzOVdxa3FLczlt?=
 =?utf-8?B?SUlUaEZIZlZsVHBMNkhvTHNwTlpSQWQ1U0hSbUl5UUEzV3p2a2Fxd00rU0FK?=
 =?utf-8?B?TzVMT0hjYXpETGFYUlp1MTVFcEhUM0c2Zmw1ZExEdGFHZlJldm4xcDV4VHd4?=
 =?utf-8?B?Ynh0VjRGZi9qbE8vUE1lbEw4WWFWTTJrelRpSDgrZTBWSWluM0pkNHA5NWdU?=
 =?utf-8?B?MGVGNk9kWDY3KzBuQWhVV2FHZGdsQjlSaHNMR09obTZuamFBUjdsK0hTSUQ4?=
 =?utf-8?B?ajN0S0M0TGVvUHVhN3R3WXdrb2k2aGtCN0MvUU44Q1lka29QWkpHQTd4WGM4?=
 =?utf-8?B?a2pma1M4QlBLdTFicUUweTl1K2J2MHhOaEdXNGYxSnRJMTRSMGYzaFovYkIr?=
 =?utf-8?B?SWU4RUZCVTg0ZGtGcGNkeWcxRm8yQ3E5Zlo1SnFaRTVWdG1NYjlyS2RNNTRZ?=
 =?utf-8?B?NllKdXFDZHFMMzdJazAvdFBCNmtMQ3ZJeGdBbDkzMFVxVUZkbWlGeVd0YnQv?=
 =?utf-8?B?WnA4TWtKblk5TEpYZG5LekROUW5hWW1VcGRPSnVQajZqTVNmTXE5QUVqNWRh?=
 =?utf-8?B?RUNZbEEzMXZRRXlQQU9Eek9uUlJ4d1RvUWY2Y0w2MTFLZE1CMzRlOGNabzRP?=
 =?utf-8?B?QS9lV3RGdEpNZDB2TXBMN09oWWl2eG5LSUtENEhVSmhpWUJFOWtKcTc0eVZX?=
 =?utf-8?B?ZjJMelFGSEhTa3VmOGFHMWk5d3JtY21MU1Y0YjFSOUJVMkE5dmpIWXJzOEtM?=
 =?utf-8?B?L1BZRUJQWmZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akZlOFE1UGRRZ3pLd3ZLS0JnMzJvQ1BwY1JjeWpObGtqdTRaS0MzMERnVTFL?=
 =?utf-8?B?WlNpVklXQ2EyQVRlN3FvSWRlcHFrcGRSTHdYbTlpTG1GNUJuL084QjNsMFdj?=
 =?utf-8?B?cWVTYXoyM3BlWmlqbFE3L0hqdzBnMmJ0QjdBRnFBTHZENEV3SEVBcStuNWJn?=
 =?utf-8?B?RCtRMmlwS2duTkMrclZBYU1ndFkwUFNiYjZ6Um1kaW5ybEhHckpZMjh0NTUv?=
 =?utf-8?B?SHhtditKVzA5ZHRRYkdVbER3Z0RQTUVMSy82VCt5UklMT0VnTUE5YS9LR3Jp?=
 =?utf-8?B?TUdCSHdMUXprMWUrdnlERHVvbFE3ZC9JdXh1ZXg1cDJmQ3Jwcld6Vk1yUHhE?=
 =?utf-8?B?VFUvbWhKeTBzMHJtS0tNNitUYVZYSERSZmxqRUMzbVNMNW1RRXNBRWdGSjFF?=
 =?utf-8?B?aW1tYmdWeVpWWW1KcUdjZDFCZzhYdEtudWlaZ1dKWnMwTlRIWFZSTUFCd3ZM?=
 =?utf-8?B?QnlXRTE5eTdxclpJcEtuZlRKUndUaFBqNVRkWDZnZUZpc3I3d3BicXJrRFc0?=
 =?utf-8?B?TWRNM1c1Tmw1a003T3ZUaDhDMXdZVmsvSzNUZStIQ2djK3orUTZISVRGN3lh?=
 =?utf-8?B?cEZiek0rUEdzS0NtN1pSejVaeTluTFRlbC9nWDZtM3VpVjd4UXo3dEdjY3Nq?=
 =?utf-8?B?NFI2VTNoZW91Qmc1ZlVGVlNpSjlTb0NDQjdKSGdaVjJsYTY2VlN2SlhXRHE4?=
 =?utf-8?B?ME1KVnBNS3ptdDdWd3BWMnBzcU9vR0U1Q01HWUJGNHJFazFjcDFZU3lvTkVL?=
 =?utf-8?B?T3lBdEpKUzVpbDUrbFd1SzM2YjNsVHE1bm1CbzVRWWxKZmpVS0hLOUpxVmRa?=
 =?utf-8?B?ZWxsTWZrZzBvRy9uTXlseExhT2VyUHk4Z1NBQ2lBWmtnTlUvb3krQnllNXRM?=
 =?utf-8?B?WWVqK2daTW9ibEVpSUpFUEpvOUE4ZEJIYzNqODZYQWdJRUtDQ1RIbHk0MlU1?=
 =?utf-8?B?eVRDSjkvd1V4bXNmOVdrZDNaa3V4ZGZtT0JQWlduY1l4K0NZNGE1YUJ4azNs?=
 =?utf-8?B?UUFiZXZ6REQwSHRWVHBia3Z6QnJEVjlEZHpRTlhqdWFLdHlsR05hQURSRjNG?=
 =?utf-8?B?cGIxbU5NWE5QYVpYTWYySENqY1A4Nk1HNDlOOWsyVWtYTlZienlvTC9IOEg3?=
 =?utf-8?B?MXVSTEtrSlBkWU5VS1hUZk5nMGVRNUJjRnhUUEh0V3V5d3I3RWsvVXNYR3pm?=
 =?utf-8?B?ZEw2TmZYUnR0aWJ0MWJDSDZjOGgrMnoyV1BrdnJ6L09kRjBDQ1duM2ZvYkg2?=
 =?utf-8?B?VUpEb2x2UXp2aGNuaytOaUpSeWo5a1AxY1hkRkpkZlVkeHpwWHNURDZ1MFBq?=
 =?utf-8?B?YmhEQ25BM0RBU21FRHdWc2IydUtzcFlTWmRKU0NHSU91M0lkSFlXb1dCdHN0?=
 =?utf-8?B?TlVXNlQrS0ZXRUFhZXpwbzZNZVVOTHRqbzJVSExra2FwYmlJakZJSGxGNlJ1?=
 =?utf-8?B?SnJCMjdOcXRCZ3JaRXpQRm9ubkxSRndnajR2TnkwemlUL0lJajhodGZZb2lh?=
 =?utf-8?B?NlpYdmQrTUEzeUpMRlFwL0FONDJLdjFQNjdJTjJ0ZVNYeUwzVHczcU02Vmd5?=
 =?utf-8?B?dnZUaGFTNVVlUEtzVFc4b1YrWWhvZFFPS1hLUjA3ZzIvamxURUluQVc5Z2RT?=
 =?utf-8?B?b0t4allGdXgwODhoMUREbVhCcFlCYVJVaHd2RUZRY2VsSE5LRGkvcHZpK0VQ?=
 =?utf-8?B?SW5zQXlZNTJKZU42MjUyWU5HWFlxb1gvbUlEUTg1MWYzUC9kQWR5V2loMnQ1?=
 =?utf-8?B?RGdkQVNKUlJaVVJWR05NOUNaUUxQQnBOZWhiSWQwaTgxQzBKYng0b0FnQjVx?=
 =?utf-8?B?NXZJN01jKzhmU3VDM0lDL3lmOHovS3cxMUowalZRQ09yMTRaRVRlMzhzNHhr?=
 =?utf-8?B?MDlBR3NlTk1waVF3Q1M2Tm5QZ0dtVTZncGNKQ3dqTUJXTDJHcnM4R1UyRVdq?=
 =?utf-8?B?Z2hOMzdtcGhOSHNwa0ErVFJsN3RmaGUrSS9wRTY0VWgyelh0Z01IaGwxSlY4?=
 =?utf-8?B?RHRtd3dXTW96QS9Ha2hDTEpZUVlGRWdQelY5SERIc0ZRL3pOUXRhV1Z6MElU?=
 =?utf-8?B?aEc1UnMzY25DMlA3RHczRkhCemVPYVNvVTQxNjMxdVhvU0ZsUDl3TzFsdHZm?=
 =?utf-8?B?d2RHTEdkTFVSYnhRd1Y0MW5JVnBoNktLNUZ3VGo2dkEvczUwZXF0bXVtbmxG?=
 =?utf-8?Q?tClhI4g3p8zxIq3SBtaxbhE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE1E8E23C71DE74D938E3CDAEB1B919E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d72166-52a5-4777-2b22-08dd2f4d862e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 19:00:16.6254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YgZWPIl11P0DGHyhQRjSMF6fLc/P2gB6ToIKth3ocUyeQ4Gm77jUnIuic2Gz2DGbvchd/6QMkiSVeWrt//t7bt54wTrFboxjYIUORuOH3Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8063
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI1LTAxLTA3IGF0IDIwOjM3ICswMjAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cj4gT24gRnJpLCAzIEphbiAyMDI1LCBQYW5kcnV2YWRhLCBTcmluaXZhcyB3cm90ZToNCj4gDQo+
ID4gSGkgSGFucy9JbHBvLA0KPiA+IA0KPiA+IFB1bGwgcmVxdWVzdCBmb3IgSW50ZWwgU3BlZWQg
U2VsZWN0IHZlcnNpb24gdjEuMjENCj4gPiBTdW1tYXJ5IG9mIGNoYW5nZToNCj4gPiAtIEZpeCBy
ZXN0b3JpbmcgVFJMIGFmdGVyIFNTVC1URiBkaXNhYmxlIHRvIGN1cnJlbnQgY29uZmlnIGxldmVs
DQo+ID4gaW5zdGVhZCBmb3IgbGV2ZWwgMA0KPiA+IA0KPiA+IFRoZSBiYXNlIGJyYW5jaCBmb3Ig
dGhlc2UgY2hhbmdlcw0KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2LmdpdA0KPiA+IGJyYW5jaDogZm9y
LW5leHQNCj4gPiANCj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo+ID4g
YzQxNmEzZmVkNzhiOWIxZDkzNzU1ZDJjNWQ4MTA0NzY5NTU5YzRjYjoNCj4gPiANCj4gPiDCoCBN
ZXJnZSBicmFuY2ggJ3BsYXRmb3JtLWRyaXZlcnMteDg2LXBsYXRmb3JtLXByb2ZpbGUnIGludG8g
Zm9yLQ0KPiA+IG5leHQNCj4gPiAoMjAyNC0xMi0zMCAyMDoyMTowOSArMDIwMCkNCj4gPiANCj4g
PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gPiANCj4gPiDCoCBo
dHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEvbGludXgta2VybmVsLmdpdMKgaW50ZWwtc3N0
DQo+ID4gDQo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+ID4gNjAwYzhmMjQz
MTljZWJlNjcxYTcwNzIyZGY5OWI4MDA2ZGFlYmUyMToNCj4gPiANCj4gPiDCoCB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yMSByZWxlYXNlICgyMDI1LTAxLTAzDQo+ID4g
MDY6Mjk6MDMgLTA4MDApDQo+ID4gDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IFNyaW5pdmFzIFBhbmRydXZh
ZGEgKDIpOg0KPiA+IMKgwqDCoMKgwqAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dDogRml4IFRSTCByZXN0b3JlIGFmdGVyDQo+ID4gU1NULVRGDQo+ID4gZGlzYWJsZQ0KPiA+IMKg
wqDCoMKgwqAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuMjEgcmVsZWFz
ZQ0KPiA+IA0KPiA+IMKgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNv
bmZpZy5jwqDCoMKgIHwgMiArLQ0KPiA+IMKgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNl
bGVjdC9pc3N0LWNvcmUtdHBtaS5jIHwgMiArLQ0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBIaSBTcmluaXZhcywNCj4gDQo+IFB1
bGxlZCBpbnRvIHJldmlldy1pbHBvLW5leHQgd2hlcmUgaXQgcHJvcGFnYXRlIGludG8gdGhlIGZv
ci1uZXh0DQo+IGJyYW5jaC4NCj4gDQpIaSBJbHBvLA0KDQpUaGFua3MhDQoNCg==
