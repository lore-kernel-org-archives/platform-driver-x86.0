Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7003333290A
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Dec 2025 19:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764877778; cv=fail; b=F/WihCutcKlqywRzSIy4LjKEdiZ2ga8TrpBVlZdBcsts4Q0EDU1TsnCLwMSnbPGbP7iUR2nwp48sHsZn3sMtcYP2MMp1o9Nv1uE7JCqLyetBOXdIolOrNfPmlOqpGdw+2Vf9iONh31UHpLdSCaN0TjH3bNET9uWJforf0095uYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764877778; c=relaxed/simple;
	bh=Yl/yoSGcwGfVPGDMa+iIxltht5uShq0YbGURCTRLqRU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uR95c28u/v9e879DC9TrPEW7gYFUt+j05rRMx6aEuRkfNzKBgjaRfKGq5HQ/L/JRJY4AuPSHggrRKkCfsYqX8BxM2GQs5g+BOIewlXfqO72f2Yv5jjt4WVaohmqjwHdxhG25Pp+x77W80TXZMMdfox7w3optkfR26ORyYZ38uP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xx2ussQ4; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xx2ussQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764877777; x=1796413777;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Yl/yoSGcwGfVPGDMa+iIxltht5uShq0YbGURCTRLqRU=;
  b=Xx2ussQ4cfYQOsP5T3VewxHV+mTm0q5BJ8LieR/u8BiBWg+A9JvtOFtK
   zIaelRlEYC91du76JBFZ5vgbYmpxm1EB1+v3HegaRScdUPlXU3SqA2V5c
   +484LggxivH4JmWisMQnDQKU45x9CSFb2+2PBmJXgq2q4rFoJjADgUGta
   fqKdXlnICJwH+ynMyEDCQzKWYDA7Y77rnXlI7IxUzfBcV1Bk9r+Jilpww
   I+icZ9dwEJ+3QL3aJfe4TwIAXVccZwDz6zXxZ0bwotSr94cRLGbO9ewT0
   8stpUyOUBt0glkK3UUcN+M7sPhuxN+82DSY8ce/fwYoFy0nTmAp/x6yKn
   w==;
X-CSE-ConnectionGUID: uUH/HZAdSJWJr9WUnFWASw==
X-CSE-MsgGUID: 0wSMwtDqROKqyGfkmbir7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77232221"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="77232221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 11:49:36 -0800
X-CSE-ConnectionGUID: S/GOuAxHS9qXRf2crJaqFg==
X-CSE-MsgGUID: Kvmd7OZUTuWPw1ImFizt8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194884286"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 11:49:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:49:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 11:49:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:49:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzArEZs8dotVWe9wWbKRtgDadntqcHksn6J7B94KirlmDFqlorExTwS28YJL1MaMd12P//U+Qmy0AoKd4neXLUMNPgpgG152IQTObGMcZeoyF8qyEVq3VyTkurwmu3Xo0w5y9z6ttFObHTDVA0LjMYShTazQdAOVcYTumRk1FtMiES+mi/w65iPwMp67M3NWR8cYYIwXza+NIBiGbX9oEhdrLeEnO3LPpfsNYgI2u7GGvrlgbjkZxx3DUwbKiwFo05Z0xleDEfs//8xfn90cmaN2hl6uoSeYOuwbtQPg0ZX4GDjvT3gQAPiK4m/MZuETTCJAHMrz3uc8An9WorIXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl/yoSGcwGfVPGDMa+iIxltht5uShq0YbGURCTRLqRU=;
 b=G4P7t8QAJTSYXKDGVktnrWr1a9BC7s1ey84JldwatZzUjvyBTrwO32JrrkNGilp7TTxmbq5SVvpNNmyfUmzymWPR6qVA8dpTh4R8Bg/fUK4ggtinMjD7t7fqArsnkFIehG8m0syNn+UHBxL+Nj1AJsoKQzdCr1yN+57MT/4+aJs8E+d7HEKF6sC0Z8/kNBMPAZfiRMwc6+XXC5LHrsPIxomcSCHX/tzo3DAB8tlNh+O3iWMGPQGcJIWHaq7VwHe3kQJ6eY+C1GI2ENQ2aTuvw8i+yqiJkWRBKNBM+ojJUC8AnaAP857PoUGX8TqERAlRdSJtIZmZxxvVE83XrIkB3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Thu, 4 Dec 2025 19:49:25 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 19:49:25 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.19-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.19-rc1
Thread-Index: AQHcZHLfp4kex8P3FUiTTEIH+GAgtrUR1gaAgAAPPIA=
Date: Thu, 4 Dec 2025 19:49:25 +0000
Message-ID: <34a4abbdc5dcf085884a7d169d7c472a43d4acef.camel@intel.com>
References: <29f01076610a5467ea64101f1bf7a4c0663e109f.camel@intel.com>
	 <51880d52-3c37-0447-1c71-8a745990e086@linux.intel.com>
In-Reply-To: <51880d52-3c37-0447-1c71-8a745990e086@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.2 (3.58.2-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|BL3PR11MB6435:EE_
x-ms-office365-filtering-correlation-id: 0ab00ea9-e212-47ef-49f4-08de336e3a7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dmlNQmhtMzRZNHlwM05GTk5qS01tQk8xU1VUdEowVUJiME8vY1BTRmtUTS9t?=
 =?utf-8?B?T2FnbnRwd01od2g2SjU4THNqanNSUjI4ODF6SElYRy82MGpFdEFJd3B5MHBX?=
 =?utf-8?B?MWNIamlLMDJ1VXlESmJMaUNRdTB3dys2NHhIK1FSU1dCbldKRmJQK0VMcmZD?=
 =?utf-8?B?bTdsWU5MTStVQjNqZXF2MVFYbFVnSEVvTW4xU0oxY2x1R2l5dDZZYlNybDJ2?=
 =?utf-8?B?aHpFc1RuSUc2ZVdxTnhDOE4rTTR4VTdyL3BRU1BpZ2w4MVBNV3VnbUZiVCts?=
 =?utf-8?B?T1lLWEF4NmpqQ3Z3K2pkV1pyc01uWWd5R081ZGdZdDVkbWpidUVlTXFlcXpO?=
 =?utf-8?B?UGxFaTNvU0VObDF5SzV5UkpMU0xCUnF0S1ZTWkcwcU1SdUZGbkxWd1JuT0VT?=
 =?utf-8?B?dkxYUzNXNEZab0d2Tjk5RU9BdDFOc1hqR0xmeVhGdGxhYjVWMmRUNnZnbWxa?=
 =?utf-8?B?MXlhK2VMNkdVazZ0WXFRdGFIcWMyVURRUXdBNzFjTUN4T2xQS0oxc0EzcTZW?=
 =?utf-8?B?TXQ1Mkx5LytaVlBHQkJlMzMzdHNJU0FPMVVac1hUMUdSa3oxOURyV0YzTjZD?=
 =?utf-8?B?Yjh5ZmxtSWpUeEJObXMrMVVIWlJwQ3ZxRHZvTS9PeFl2MVRjcFlXUGdFWjZH?=
 =?utf-8?B?ZmVXSE4weUxzRnlYM3Y0aklnblRCZnIwaWVLUG5EL2R2bFBpT3NuWkpzd0lu?=
 =?utf-8?B?ODU0N3hUM2o0di9JSFVHVldLclc3N3YrRWpOZ1FqZDl3NzZKc3c3dVE2Z2ZG?=
 =?utf-8?B?aVpWMUtBUk9rQTdJWkhSNmxqdUptblU5WlVDcDZCNUxhNlNjeCtQaDk4WklO?=
 =?utf-8?B?dEs2WjR4Um9vblF6NkdxVW55cEZWbFJ2dmNXZGk2aE5Kc1d5Q0JOOEJybUhp?=
 =?utf-8?B?NnJMSDgvUGhtRHdzcWttd3J0b0x1azB2Sk1TNFpKY3dwNjNOenJ3dHRqbVZS?=
 =?utf-8?B?SVk2cDlkMFhlbkdtZFpSWHFUTFRiVFI0Wmh4YTR3Wkxqd0tOUmNLMjh6aEVl?=
 =?utf-8?B?djRyWDE2K005d1NFckFldHZveUUra1NLY1FkNklDZHhWTXgxQ2c3MmNHbGJk?=
 =?utf-8?B?a3JhVnBlRVpDQjI0ZVJVK0hEZm5iRkxvck5ZZmN6T2VGRWlVRU9WOXhoNXVJ?=
 =?utf-8?B?VVNFMnhzRnVuZy96K3A1UEpNZW5waGF5b2psYXJ5NGdpaE1IbTd3NlNhZVFl?=
 =?utf-8?B?Nll5aVNQSCtWQkpCdXVTUCs1QzFaY0dYV0phemZwdjJJbkxDdDhxTUt6bmRv?=
 =?utf-8?B?aXIvRWE2MTk1Umh2dXpBN1Y3RUt3cFJzenU5RXQyNnZJb2dpQ1hRczZvdnJW?=
 =?utf-8?B?OEw0SDVMTlV4dkRvZXRJMWh6Zko3ZG9mNE1WRkxWancvaXhWdG13ZTlDVHFJ?=
 =?utf-8?B?bDFCcmNGdllCc09NNzYvbmphUkQza3RuQmxtdVNKNk5DK1MzUUpoUk0xTTBI?=
 =?utf-8?B?NGJVNE5rNDhHTGZ6V08zUkJ2M1E4WU1kZ1ROb2RCUnYzQU1Tb1FzNE5ndXov?=
 =?utf-8?B?eTNPTlE2ZEt5YlRPbHZXbzUzL0lCREZPRDRjY2hoaHl0N2txUURMQzFhN1gr?=
 =?utf-8?B?cHRTL0U4QkNHWXNVVEhnZ3U5VzBidHBXUXdIMjluR3dpOStzTDljam9VckQ5?=
 =?utf-8?B?TzZsa3VFREh0WGcrcXp6bjJXNjNEMXpXN2h2QWVoTEZvSUkweXNTL0ZyZFlQ?=
 =?utf-8?B?RWVOK3NYOG1qNHRRZU9tRUFtT3Iwejl3SzNXSDJTcUM0YTRkSFRlaWNFK0Jr?=
 =?utf-8?B?LzJkcmk0TFBweFZwYXpDNzUzSEpZVGtXRWRvZlRFWEVmQVY4VDF4QkhmTVpO?=
 =?utf-8?B?ZzVlNmRwMm5HMEFYU01YcVgveG12aGtWSEN3NWNKOHJPK3Q2RXdJMnp2aFdB?=
 =?utf-8?B?YU5vM3NjK0VLY1J3dC9acVVPWldYcWNWZzRHcENDd3RLWDY3VllEVy93TmZS?=
 =?utf-8?B?YWMwN2dKTHN2b1VmV0o3TEZSOWhUSXNoK0xHM3hqWjJoSTNSMGVnK3p1a2Yz?=
 =?utf-8?B?Y3A5TklGdndoOXJCN3ZvMWRhZjR2ckJyNWh3bjBpTGwxNHBKZ2hmSTRQVzc4?=
 =?utf-8?Q?DJY6B3?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzViaVZvY0I4RG1GUVVJM1JMS2tnVWd4MW9BTUNqTzVwWnVwQjNpODM0aWYv?=
 =?utf-8?B?OFRJQ1RSQ3BkdVRMa2kyQVNEUE1GQTZMcnA2eEZOeTI4NVBXekZPalEyU2hn?=
 =?utf-8?B?Y0hzSE51bHdjNHVXTmVQdEFhYTh1V0tIYXVpRXpXRGNUN3dkeHRjRE1Zdjhj?=
 =?utf-8?B?Kys1dUJqV0I2YlJGR242cTZmUDRBUTV5eXgyb21FbExzV2pNNlBnVzJqSmwx?=
 =?utf-8?B?ZEQzZ1dITkZiOWZrZ0NMOXMwY0xrb1l3UExWYnVaU3creDdKMWxLOEZMcjRs?=
 =?utf-8?B?dDVrN1VCY0Y0eWRFbVl5ZHYvazdDUlYzV0pxK1NzeWdYckhvQkJhTWRNRGJY?=
 =?utf-8?B?WkE3WFlNR1BpZUNnK3VvLzBHQVBwaWZNWDcrSEtxbkJZWWF5cVJZNHVONmlx?=
 =?utf-8?B?N0p2REozbHR0V25VZVdHVFJlNGtZN3dqSWVrK09UK1BrUXpFeHpWaU4rUHR2?=
 =?utf-8?B?SHF6NVhLRFJWYUJGVzJlRjZLbkpUbU40OGVxM3orcitVZ3JMU1dBVGR6Y3Zt?=
 =?utf-8?B?MThjUHk3WGt5Qk4veDZrdUJ5eUpSNFFESmY0ekJ1TlBVZ0dzbTdmZnRIOVBF?=
 =?utf-8?B?Y2NtdE5WM3ptZkVWUkpCeVdhTzAxbFRFdmxwb1BtMnprWEtiRjZTUm5OcGFB?=
 =?utf-8?B?allUNjY1VjRNZnhHeGlyZTZTUUd5RTFpdWo0SEdkWE5LYU1TQlg5N1hLNzFG?=
 =?utf-8?B?UTNSWE4zVk5GUHA2b2NOTHVKZHYrMkRPZ3NYWC8xam1NUElOa1M0RWxSVll0?=
 =?utf-8?B?djU4ZU1Zbm13VXdPZUxmbXY3QWEwUkg2dmI5QVdZOVV6RHloYmZJVkd4czJV?=
 =?utf-8?B?ak0yTXd4NU9oM2V4QlZkR3RWdnBYRnU0OXV4ZU16cUNnTmdsellnVGU3eGFZ?=
 =?utf-8?B?Vmh3eWlxYnM3dnYrVFFyRjExOUhqSVZmUW1YSXFWVDloRnhCc3NWbUVpekVl?=
 =?utf-8?B?cEFtL1l4emtXbzZtcFBta0xBRE90N1FodTNjYWdhbk5tNWhlMG5tUTkrSFJ1?=
 =?utf-8?B?M05BdDZkRDZHOTJuR0s0TStDR2wybHE1c0I3TWdPQTFnN1RGUVh2MUd0dUF5?=
 =?utf-8?B?ajJISnR0V1ZOWjZvVXFEVGNrSnVJUzlYRDBZbmVkbG40dWsrN2RoQStnNWpJ?=
 =?utf-8?B?clFUM0xaTTE3S0o4VnF1d1NaSkxFbk82OEN0eFBKb1FENCtnSXdTbmU5RThO?=
 =?utf-8?B?MTVnM2F5K2h3SEVwUGwzWjc5YWFCUzhMWk9VKzRpQmlHQ3BFY3pyMzN4dXJL?=
 =?utf-8?B?OE9ydE1iU1hObG45eWs3NzVZeEV6TEpTcWlEUTBOdkV5aXMzSGVkaHp6YytZ?=
 =?utf-8?B?cUdEcG1lOWZwdHVmS0tmQ0FmVklxellKWllIZkNVNGdYMlZUMWFVUzU2Z0lF?=
 =?utf-8?B?ZkN6UTZXKzMvZXNSUHVseXUzaTFaM3ljZDdlWmd0YS9ic3lkMzhWRHVGVHgz?=
 =?utf-8?B?R1VIZVJEMnpxNVNmU1dtcmNqM28xczZ6ajVhbEl6aW43RGZPQUUwZTQxMHNL?=
 =?utf-8?B?TWJZQlBFY0lRT25qM1dWK1RqcGNhcGZqYVZnZ0J6VG55L2h4bFlCWEpKbWIr?=
 =?utf-8?B?MkdXNzI0OWZkR1pmdVJ0dUZQTDZOMDltZnRxYU50WGNZZlZEOEdBN2w4WGp0?=
 =?utf-8?B?Z0FFSStYQWdzeEVtQlg1NmU3N1F0YW1jOVZadVVIc2E5blFGSU9hZUJGWjN0?=
 =?utf-8?B?bHM0U2JaNXhvYTQzQVRnai9YMU5OTXRHSjM1SFhia0xRSmFkV0xlSkNhSGpT?=
 =?utf-8?B?Z3J2WHBudGtHdW0xRUd4NnVTVG5IVTlCQUxKc3BnWFBIZnNvbytSeStzOTAv?=
 =?utf-8?B?Ym9zdHVRd1JUNG9qejZDT3dWSWtoOXJDTFBrdnJPb3QwV01UNmdTb3RQVGlh?=
 =?utf-8?B?L09TdHJlMUoyZldENVczcXNDSXFRTnlqdFRzemRqK214L1N5ZmVBc2psczNQ?=
 =?utf-8?B?N1dnd1FlSGQxamhtVkVPelNyV0hoRzE2WDA2U3M2UldGVndIaURCU0NyUmhP?=
 =?utf-8?B?MDNlNjN3MTh4NWt5WDBOZzRnWm9sNWZJeTBpRlRvRTlpVjJ4R21TaUt2VkxF?=
 =?utf-8?B?OXdHdlVzT1dBQjdycm1jZzVxOERKcC9HcXBxMDZwRGxSUWVOOURUc1NZeGZC?=
 =?utf-8?B?UEQ2U0VvdlN0WDdKejEvcXh5RHNqblRKRFczVUN2Ny9tU1JLWGNSWGVpaVFI?=
 =?utf-8?Q?dST9x0cq4POfyrZeTrxqc/w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40107776DB356C46859D3232AAAC2A1F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab00ea9-e212-47ef-49f4-08de336e3a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 19:49:25.3507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IrNB7hXMlZsxo50y1fdmLbKiqhl3j8qJO5AHrWAlGb5qlOPOw1QCsTSL0tpFVuVEJcD+A8tXSMUY2s7lv+ohGhq0jOFhFc2AX4TQW+vTHr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6435
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTEyLTA0IGF0IDIwOjU0ICswMjAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cj4gT24gV2VkLCAzIERlYyAyMDI1LCBQYW5kcnV2YWRhLCBTcmluaXZhcyB3cm90ZToNCj4gDQo+
ID4gSGkgSWxwbywNCj4gPiANCj4gPiBUaGlzIHB1bGwgcmVxdWVzdCBpcyBiYXNlZCBvbg0KPiA+
IGh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2DQo+ID4gZm9yLW5leHQNCj4gPiANCj4gPiBhcyBv
ZiB0b2RheS4NCj4gPiANCj4gPiANCj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0DQo+ID4gYzM2ZjlkN2IyODY5YTAwM2EyZjdkNmZmMmM2YmFjOWU2MmZkN2Q2ODoNCj4gPiAN
Cj4gPiDCoCBmcy9ubHM6IEZpeCBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdXRmOF90b191dGYzMigp
IGFuZA0KPiA+IHV0ZjMyX3RvX3V0ZjgoKQ0KPiA+ICgyMDI1LTEyLTAxIDExOjU4OjA2ICswMjAw
KQ0KPiA+IA0KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiA+
IA0KPiA+IMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFuZHJ1dmFkYS9saW51eC1rZXJuZWwuZ2l0
wqBpbnRlbC1zc3QNCj4gPiANCj4gPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCj4g
PiBhZDM3NGViOWIzM2ZjNDczOGYyMWU1NzY1ODA3M2EwNGY3N2Q0OTNkOg0KPiA+IA0KPiA+IMKg
IHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYxLjI0IHJlbGVhc2UgKDIwMjUt
MTItMDMNCj4gPiAwODoyOToxMyAtMDgwMCkNCj4gPiANCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gU3Jpbml2
YXMgUGFuZHJ1dmFkYSAoMyk6DQo+ID4gwqDCoMKgwqDCoCB0b29scy9wb3dlci94ODYvaW50ZWwt
c3BlZWQtc2VsZWN0OiBDaGVjayBmZWF0dXJlIHN0YXR1cw0KPiA+IMKgwqDCoMKgwqAgdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogUmVzZXQNCj4gPiBpc3N0X3R1cmJvX2ZyZXFf
aW5mbw0KPiA+IGZvciBpbnZhbGlkIGJ1Y2tldHMNCj4gPiDCoMKgwqDCoMKgIHRvb2xzL3Bvd2Vy
L3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYxLjI0IHJlbGVhc2UNCj4gPiANCj4gPiDCoHRvb2xz
L3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1jb25maWcuY8KgwqDCoCB8wqAgMiAr
LQ0KPiA+IMKgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvcmUtdHBt
aS5jIHwgNDYNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+IA0KPiBJJ3ZlIG5vdyBwdWxsZWQgdGhpcy4NCg0KVGhhbmtzIElscG8uDQoNCi1Tcmlu
aXZhcw0KDQoNCj4gDQo+IFRoaXMgb25lIGFwcGVhcnMgY29ycmVjdGx5IGFsc28gaW4gdGhlIHBh
dGNod29yayBidXQgZm9yIHNvbWUgcmVhc29uDQo+IHRoZSANCj4gZWFybGllciBQUiBkaWRuJ3Qg
ZW5kIHVwIGludG8gdGhlcmUgYXQgYWxsIHdoaWNoIG1hZGUgaXQgbW9yZSBsaWtlbHkNCj4gdG8g
YmUgDQo+IG1pc3NlZC4gSSBkb24ndCBrbm93IHdoeSB0aGVyZSdzIGRpZmZlcmVuY2UuDQo=
