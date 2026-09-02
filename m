Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D564A37C92C
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382096; cv=fail; b=cSKQiDa5A0uvBe+w8St10wM4XNgzXk5j2TuRGyHemzAokPPM1QpS5BOImIOrjOIi04Es/xMzJWbGf9hGUqz/6E9UfDVLco1NSxqMHllVp1vmVXMh9gVjoxTQFmfv084OdLV4mvFCBlAUfnZ6oOocXp7foty6RW5KWMXMu96exk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382096; c=relaxed/simple;
	bh=uR/hHYKZvx1oz4M9mm+8Mygq28n7v8lDREMTIVizJU4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G7tzX79kfVzTQTglZM0dY0P1ZACkEDfGtfsg1eHUmomSAiXW8D+kHjhonEOmjy2i16YdtWwsv1yg/zvk65DjnUUFmKYZXU+5ELPXkN9T4p5v9cI0jhb+UUN3Clzb/vNcT3zsb1y3aTUHkjYoR2QzKKQ8evtbldSf5qraQDwhdx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGYuJSMK; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGYuJSMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788382091; x=1819918091;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uR/hHYKZvx1oz4M9mm+8Mygq28n7v8lDREMTIVizJU4=;
  b=kGYuJSMKOOM1P7dcWj/dxxLJ+cuQkBdtgKAdQb/S30eO80hF9IAptiNL
   NVYCZ+JKy4c7gj6pLvzEMWvreAPt1e0XAKGacm2ER1fqou4XSZezSbUHQ
   bxVpYEPHfngl2mCFEDBiuM72u3eptIyYHZB7wpPtaULAN1aRDzBAd2tMe
   pm7DiDXrmDndMiGUZ5LG/LH0YNtfoNqZo1abddVpzcDjkBgWctuqttCLP
   mHmr0sBX0tpaohRtaZJwQo+UEfnstEfzUwOTljhZOntQhbomafRHvQZ8K
   4UEh4Rmwl5rvNxxDN5shjaZYrtQxp6cL8hafDnUVj3gOsJD91Kn76GMTB
   w==;
X-CSE-ConnectionGUID: szv2TdY5TWSK7kft0OYOzw==
X-CSE-MsgGUID: kUv/QAWGTxyzlrycJstjEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100205878"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100205878"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 13:47:52 -0700
X-CSE-ConnectionGUID: 9gDhcLC/SBmW2LxAo/Ymyg==
X-CSE-MsgGUID: zBR2L03SRiq0ncx6My7r/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268972868"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 13:47:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 13:47:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 13:47:52 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 13:47:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7fQG+iL6jaEYN5I8GltgFkjdtA1jccD++nqEqiUNWX0LiEnO55J8Dnt92Kge9/7JxSgVGazjk219OrpxajFHlIyiOuTzPbyUDCdfrPHsGmuE6w/qsDM6Gldnb1WAPikT8z/YEA3DHJ2+e/vyPJUPClL3/KhS1BiVTXw1SRa5nShHOYWpNAZ+h2vH7VIqn8RTJmsaUzPxc14vJ0/UhwizPaHdWeFWJ3O1IixwTP2gv+FSChXDfxBbmBzczKApwL/FO2EnIUVcRbCgtQL6kNU8BlkmxGQ0sk39DZ481y7DdzEBeVnNbTHUOJWDh+k1afTiAGfhgwGt7WlapwxHvCo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOSiuJlzy8+D6eGmSC8HXQFajOuMYG9CFo4theuVI8Y=;
 b=ykraUAGr56FF7vlvtFF0C1lQrFS/ngCzLsZMCR7/OUPXVduXtlbNwc7uc7wKAbWvIqYdkJMBeSI3TdGtWq7yMEe7LzNMhonuQrYaH+LHVz0BJiepdQJp6A431r6BiekcwUaBJ3CybLVDOXU++/wt9c/v4bWK+6EhoCG/xUA9WDJ2CP6fv2Iv00+XBXWleKaHp0ixst2D+efR06GXi63RdS/I9+pL+JPbXqDSB1IhZAPORBglrJ4fdauoui3wnxIPLsfM9dR7xotspVTTa4YBkd90TPaMBaR3fYV8USPUDZYsXEi4WWV+/D8V5b2zyod1msPd5pBTrjpGLE8WzNwHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SAWPR11MB9545.namprd11.prod.outlook.com
 (2603:10b6:806:4e3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 20:47:32 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 20:47:32 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>,
	"Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v4 07/18] drm/xe/vsec: Do not register BMG PMT for VF
Thread-Topic: [PATCH v4 07/18] drm/xe/vsec: Do not register BMG PMT for VF
Thread-Index: AQHdOkgM6WCfhHEThE+/JGwcwP3K87a7p9aAgAAbqVA=
Date: Wed, 2 Sep 2026 20:47:32 +0000
Message-ID: <CH3PR11MB0461497F890C20960D5690A430C1B72@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-27-michael.j.ruhl@intel.com>
 <aphzx4F3CgvyXqw3@intel.com>
In-Reply-To: <aphzx4F3CgvyXqw3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SAWPR11MB9545:EE_
x-ms-office365-filtering-correlation-id: 6e89e6c1-88d5-40c1-ae2c-08df09336928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: U3y/TV8BfECFAjNqq1s+OYDWvFFGDnpLVliJY5CvUzho8uJf4xeYIQIZcArBNKVEEKhab5OgUBv7DlY+Hk19wzBJtvBb8qk9LHMfEcBayYWF3NAWPvC0Gr/4Utol5TRF3cTGG9hkrX8gQgPxx8UKH6trK3pcEwURHpZgsM0Tve+bFexCA9TNFZtoM/spWYAkME4xf5UpFFOPnJJa2V3dQLGwL5EM6Y3P7ef2nOA4SNnlG7H5rJOBHM2Lntl/upO5iolMOlh/ExQ53qd86ayILBeVIbQTfBA9QOBczJKHg8cv10Z3wlDFCu/qMIg3xikJqzssRl3MaxgyIfENNYwo+S7tegUgo24wu3iHyx9hZ8nEma/HWLBfl9n0yOcmqayfK4DP5Av9FPFqcGo/oCVE4De9+ogdxerFKxRPy94SfFy/KbAo4lhTFcXuaSGKUs9NyJk+RKelH94/qFCQ0OhI1XZw3sLVfiJ7pLNyp6H1chbOZBumWM6Q/7zGQ/iSEgmHtf2Iyf6DFP93uarW4T+r5sfgL3T6bOHtrwXawmprH4zJGP6l2HRbbk7dZT/vcp4S10qLJysxvo/fqwGd16e8VOB5GgCEcnyQN0OqfqhCWmMMzmu/zuMaggso4VTj+KSwyXSSatq3s0NB/2l+Sm8usGr5Xqzzn9tsui75SQmRkgD5u0oMTPJx1FfaBap2oKOglGxeJJFAmMXTN8YbdIIzrAEVJj9XddFtVRHMnkyQk/8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3pCb50YeLjTBjF4odKqjdDyhMFVl/j6z9C4/IgdGWzhkjb5aD8AaJn8elTsF?=
 =?us-ascii?Q?u0qd3HKWLpyZtWF8sLVnR8ZtN7Ko8hWWwGuH2J9QiQqzyFhI3/j6zpkuwn9l?=
 =?us-ascii?Q?HKBZOjrefBXdk/F8QYhhouYlmNlxMHoSSGGbU7/7g20Ed/71mNlX0dwKkToU?=
 =?us-ascii?Q?n/ONgCuv8AUk9E7OW2ZFcBU1CM6rSZWWi+zfC7U7EfHL4EnqA9DUq3MRygUG?=
 =?us-ascii?Q?mBLJBkqnbLy8DGuKeV9iKUYgqSIwOqQuXo7VwqTjwOeHJYKuQR94V1/J372d?=
 =?us-ascii?Q?sqOXTx4uaEcrZ6pGyU9mwzB28bHpdjUqf5Qy6jVGjU6ClM65a5to2eCAIoVV?=
 =?us-ascii?Q?rKzMQciKAI8DAXjo/vYkKZ1qUWNtAG+cp6WKp6t5/GbvBnlBekB1jC9HsS+U?=
 =?us-ascii?Q?8QvfHMzywN71bVr0B2xwvPnbf1ERZCr/l2N8RHwhLyIpAN61iuOCHU6MYoYh?=
 =?us-ascii?Q?lQJT2ClqSXjLk6TlRLOf9I+hSX2YVfpD3Jj4OTnGKP5aWoiquZNhZkWkMmCr?=
 =?us-ascii?Q?zec2w4yPylE97KZ/TJysFn0Jnd9cD73KEhblc73DQjI80+JM3D4UVOW05+Qv?=
 =?us-ascii?Q?XzC2Vk+a52bP5u3zS4j3uaxT2oGLTKWzaQuMGoSc5oEC6A3ZDXvbLCGDZP2h?=
 =?us-ascii?Q?gB2fjKR7Jb1Srqhd5FVjyMw22O9/ZucJYnR8KYEVT5746ybAFt9k6COTeCCb?=
 =?us-ascii?Q?STCt01ziSWxRyV2smsIqbM0O/968mb2YFJsXDF76DL4sXeSLZmqUh0CkhXry?=
 =?us-ascii?Q?cOGfr1klrnohOAR9wygYyPKENL8XPn0O/k6M+mLcCuWSn8lrrMi4+nR0dM6A?=
 =?us-ascii?Q?4dyKKbtYGJ+dFfOqCafUVokvouSmQz+VPyhP3smKo8Eg7I1E3FfnL/5FyLhQ?=
 =?us-ascii?Q?6Ce++XDIxLUYVB9jBelwQnK3rItQINPdsY5ftJvmNd97LVtrAulawkaZs8gK?=
 =?us-ascii?Q?X1EyQl7HTdlJMc8M6aXR+8CgrzJ66YB+evJoQ1+vUe9jxs6lb5ls698sydBq?=
 =?us-ascii?Q?6ovIrOrT/LZBDejURJqpqxpq5SZJ6vKszMr10zxwDzlo1czA/UoXIC5bWQr4?=
 =?us-ascii?Q?aTlIPhXz6i7OeX0fddLd41D4ou1nVD1JUvDDrI49/VyQmXBzv4e0qnabJtvR?=
 =?us-ascii?Q?ygP57fMdIrPZATc/GP0ewVEsK7rWV8u1OzKHHKyOx05pz3Qu32C/7pTjO0AW?=
 =?us-ascii?Q?i2AKjPubbdpsSXQK61HCWhZcpboV23EU2eWybER4I9SoFOtJ2fP4P3lFb7Xq?=
 =?us-ascii?Q?w/t/absSuve+Rbu4AJNG9upG3vXtlaNr51hi+Ux7YSYntEhtOigaSyR1X1uY?=
 =?us-ascii?Q?iRdWH5hyA5RVFOm+zYp7T7Z9Y9dAfycUNREfYPO11qfrebrqAfrp09cbRDBK?=
 =?us-ascii?Q?4Y2TDYanpFtBUy1zAiRCWKhX9lEkRcBYsb4dd78E400eKd9VrXJ4p7dNFZFZ?=
 =?us-ascii?Q?lJYancxqyFbqEBIRkwG4iifU0gLBAiV/BQN34ypRwKij4y7HJzCHO0RfewHF?=
 =?us-ascii?Q?lWdh2m62bHow69pSvR3s5t7USEwWkqbw/GWZ0JfhT1+ciSlb/IJ14L64S+DS?=
 =?us-ascii?Q?p3Hct6Pzow81SI7NwWjyA2pqdTp9UUYw3zVVWSnePS2yUU2ZdIw4raAiHBhD?=
 =?us-ascii?Q?7Y98Wy1XKBdVvHy8/X6xV0gmvp8/9hMRGXgK9kv1vvfY8OjFCKzPMmqToqDF?=
 =?us-ascii?Q?7JgWWgGqmExh8KTycEaSQ+vwe5PV05j3G7JX4spBpXNIAVJPW85gpnSgeijH?=
 =?us-ascii?Q?+w44IFCQkA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NBWzucXAgfjkVG+nqn8/UJaAnHVPKwphMCotkKAg2S4pmX+3tqFokRrZTyGLYblsVGE+WlL2Am0D0UdTHOf/gtCgwUCeC/wqzdDyNs6zHlcjmpoKILE6GWUmNuTFYnR2T338/FkfDOS+t4Kl6FkHSys4ldszIrk37DkBZVkTHc4Vs/UX3oqLAblLy+M4NeqBiQsPylX7M5WJ0DFR5n0ZkriKMgWIBZBYifTi1vOY1CJ6MSdd+jF5VEcBBSoW/EN9mB80vuxwAwnudb36tjqwSmqZjj7dNCEi0bFg+EcPqbaJTKeYYH+cBzd4Voc9bpahPeHSvpyF1KYF7oU0uz4AnA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e89e6c1-88d5-40c1-ae2c-08df09336928
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 20:47:32.1600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BakVBmjrAoQNAl77BXywENW+jfeu+493cR52eC9Bk4amXi2wrnXexxnSCXYlU9RHPSN+1gs9SwTSOFd+Cnpypxt2PiDVWOqQiRVa4rxE2yE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9545
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Wednesday, September 2, 2026 3:07 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v4 07/18] drm/xe/vsec: Do not register BMG PMT for VF
>
>On Tue, Sep 01, 2026 at 12:27:42PM -0700, Michael J. Ruhl wrote:
>> BMG PMT is not supported for VF nodes.
>>
>> If IS_SRIOV_VF() is true, do NOT register with PMT.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index a9baf0bfe572..71bc359b2ad1 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>>  	u32 offset;
>>  	int ret;
>>
>> +	if (IS_SRIOV_VF(xe))
>> +		return -EINVAL;
>
>you are not registering, this callback will never be called.
>This is not needed here.

This function is called by debugfs and hwmon.  They are not supposed to be =
able to get here
if this is a VF, but I thought I should be paranoid.

If I am too paranoid, I will remove.

M

>> +
>>  	ret =3D xe_guid_decode(guid, &mem_region, &offset);
>>  	if (ret)
>>  		return ret;
>> @@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>>
>>  	guard(mutex)(&xe->pmt.lock);
>>
>> -	if (!xe->soc_remapper.set_telem_region)
>> -		return -ENODEV;
>> -
>>  	/* indicate that we are not at an appropriate power level */
>>  	if (!xe_pm_runtime_get_if_active(xe))
>>  		return -ENODATA;
>> @@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	switch (platform) {
>>  	case XE_VSEC_BMG:
>> +		if (IS_SRIOV_VF(xe))
>> +			return;
>>  		info->priv_data =3D &xe_pmt_cb;
>>  		break;
>>  	default:
>> --
>> 2.43.0
>>
