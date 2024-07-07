Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422A1AD58
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jul 2024 07:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720337111; cv=fail; b=F83Yy7MTWrIZf2w0EiebRdBxL/eV+0Rv/y3LS5JKiOOZhWGGo4mFSl3pibVk97Vj+WxP78vansyLlhSY6Woj3qGjC7Z7zws0eF/0Qbyhrj/51812tbjZ9ffkGEe/IqwdGmL6nIa8cJTDOgWBJs1plQtBxJaed/0ZfWswSq9GV0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720337111; c=relaxed/simple;
	bh=8LFHlfTdzYN3Y7FYj3UR4niCPIhDGi3iai+63T3fB/A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tAJmOoaMIU8vjT+VKO1nQzDShBzP8CpVGYLsZYnVe7sFhaqDLb2TDeLtc3Fr/a4vnXGDsB6Zmy7L8P8SP94iW4HI8Kvhfc5rnHhhlHm9ETeKrjqwbK1F+M8cfmmjx0ctBYK973mM9F4s/ihblsoYv11uAgTqAD8CU9WlFfwYsic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KShvbspB; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KShvbspB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720337108; x=1751873108;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=8LFHlfTdzYN3Y7FYj3UR4niCPIhDGi3iai+63T3fB/A=;
  b=KShvbspBe4KEa9Qid+Ba7VE/4fN1GWrswhjwQrG8l+JbOXfj/MdiYIAQ
   mKWRUUO1W6IFnA7ecdfHLkM3bBvDKz8hMaPb4xkW2EZ5JK7jVyVtf+Yaf
   BXsD5Jj6c9MHs+APtNPA9ls9IaAul8qCvWykyh2KQyEl4eq4AeukulSwU
   +8lh++Ukg0woUDiOzBQDsWtFpIYZiQOZlrR3gQyltbGtKExzXuNO09CSw
   6VpaqFKrHl7bM8eu8s7B/9gy7JC/HlZL2TMdnAcwP5qVUtfzFIOjnyqsv
   BLtRlYHyfZ36vKiRoGicNUhyD0vCW6XkaRF+IgfEl1kreMNer7sJaRcSc
   Q==;
X-CSE-ConnectionGUID: HUBc3x1tRzmC8PUMlK7BGw==
X-CSE-MsgGUID: 2izhCUgVTt+13grxvMZ32A==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17690584"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17690584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 00:25:07 -0700
X-CSE-ConnectionGUID: qHq8wHkqThupmeQcVLktWQ==
X-CSE-MsgGUID: i05C8qB3Q42eZpeWUOwBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47876330"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jul 2024 00:25:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 7 Jul 2024 00:25:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 7 Jul 2024 00:25:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 7 Jul 2024 00:25:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 7 Jul 2024 00:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4PHLNENtnmTFbhz1MlytFaVlw6ioPPiXndNIz00HNktgzrigtb5Cg8EjJI6O0/D6K+dD5NrSloil7kWmHQfbGINEmPZO0T5UaxIh8xbIOQeTc5DyYLjfSmw8K3pMn4iDDzjEcW2r04e68wGl2CsRZMR0Hg0NRKGnW4ep/avejqIE6rvwQnNEC2dQlvgA7vEe905jxfq9L3MWQWPV4/Y9ZzHxQudWJdsRogd/Z3ApJBAbNsRexHdCkaokXaAp204wVNTQElBybZSC+t3qCbqsJWMU7a1LCBNaHu/iEgVG2RcS1HbW08+wD639eqjNedIVXSdNSaf2SxV8PI0vwhVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LFHlfTdzYN3Y7FYj3UR4niCPIhDGi3iai+63T3fB/A=;
 b=C7WvcKfQWomYx6nWrFxpPiCxpABmHL+0cpjMimySfStKwm8BaZMDyvY8EXehUNKaV5VN/rNGtaDe3W7n+M6pM+gXgTEG5Uo9Y8cWNDalctEptY9EwOqDISvOPI5/hyBcXN2gWNIEHmYC7ZHxShiM1cnRUlQ946lL5yWTsd7z0Vx1I0qEIE5k4WN7gnvbXTEPigzB0gCf/ArrSpd3iL6r4VvUlrCKsPrdVXjKsYvH+QVLDWVP+tJHZN4/420l5KezRXlzkzdA33+p2Z09Qjm1KVfK/SEUniMh2oFqBycFN6HPfOZDmRKrBX64v+/DZFr04eT56d8Fiq9VDfRilL1R1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.34; Sun, 7 Jul 2024 07:25:00 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%7]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 07:24:59 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.11-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.11-rc1
Thread-Index: AQHa0D7GffafyLX5A0OImiieQOcOLw==
Date: Sun, 7 Jul 2024 07:24:59 +0000
Message-ID: <0aff117b7688cc4c844773600813600b7e58af6b.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|DM4PR11MB6166:EE_
x-ms-office365-filtering-correlation-id: d401540f-e659-4cae-11c8-08dc9e55e912
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MVFXT0FyN3B1ZnFmOHA2TGs1WGR0SHJnZ3lZSFoyUGw2SUhYbjdGQjdZRjlk?=
 =?utf-8?B?bDNLdFNyVmFjKzJJNVhpQmk2NWFqcitDc0lpM2tkUkt5Rm1zVXRhTU9pd3Fp?=
 =?utf-8?B?QW11ZkVuS3VLcHM1RG1QS0ZlVTRlQUJveEwxYWhON1hWeTR2cFFWY2VXV1RM?=
 =?utf-8?B?M1hSQ2xzRkVRVWRRRFc5VDNVTDBRakhLeWRMbEM1WnpUKzhvSUhkT3hSS0cx?=
 =?utf-8?B?QnUwTThqUnF4V2FkTFFyWFpZd09adEgrMUVGUG1GSm5LWHNrNGhQdWlXT3NU?=
 =?utf-8?B?Q2ZQK2MybGZOdC9iMDYyYWdIa09CeU9QVkFGZDl6MUVGV3F2c2xldE1DOWha?=
 =?utf-8?B?TlNJSWhkRG10YnRSdkk2MU9iMHlYbm15SmgzMmkwWWtNMVNuV3dKdVNXakt5?=
 =?utf-8?B?aXpkaUExemVLWkNzYWdhVG5lM1ZrU0lsNFpuSTdPNGNmVTM3cXlUTEpLdzh6?=
 =?utf-8?B?L1BZcHJqT2RNdzlPVGtkQVhxc0Nob1ZYTzVnOFlWN2xLU29RTHp2LzJ2UWR2?=
 =?utf-8?B?NDd4NXB6VDlkVzZnblJPYVNFdUdlOW9QcWt6b0VGRGpzRlJOTklISkRRcStv?=
 =?utf-8?B?TTJpRjgrOUZHUHVncmdpcHJFY3lXSXNaYjh4QnRUQlo2N3dBYVNKVUk4YzNS?=
 =?utf-8?B?UFVsVmo4RmRwNWJlTW9OL2FUNCtRdDduSFlPcU5PWDBaaEU5U1A4dlNmQlhN?=
 =?utf-8?B?c3RaSHlWUmtMVFhPb2kvTmkwd0xTWUdWM2JvUkN1aWJvSk1Wellra1BVSmJi?=
 =?utf-8?B?bGZ1bVJGZk9mRzQ5NktwdXhKQjdKU2Y0Rlh1QjlJdjJXa2gwamZLeWhHdWNu?=
 =?utf-8?B?ckdVQks5eGhRQTBkUVpwek10dkhneUM2NXRlc2ZaNzk5ZkNRWjRtRWQxWk4x?=
 =?utf-8?B?dTZGaG5Gd1VkY1h4bTFob1pRV0VjclRoZUF6b0RJZXloUjFlK21SUEl1YUsy?=
 =?utf-8?B?U0diT2FCbFE4ZERXWEQwV1l2Z1lkSGFPZVQ5bDZGMVV6MG5OTHNXVlZqQkRU?=
 =?utf-8?B?TndDZ215VE1qTlo3TzdIL2ZMb3VwY3doZHV5SndoaEprRzI5eTNJTUovWmZH?=
 =?utf-8?B?SVBMeXlubmNUNzlHRkpFZytJa1FGRkhtU04rY1VtR2dxaTRaRm9jTHl0ekZI?=
 =?utf-8?B?a3RnTkY1WThVY0p4ZlhZTEJpRjNhNkRsWVpOTkhsdFdIWWFTbXNXU2ZPdHFa?=
 =?utf-8?B?WGRlYVNzU1pNUytUNkVvSnlhbk45S0Zsd0RnUVZkVG04NmhvYlo4eUt0N1kw?=
 =?utf-8?B?UFZkejNLOVUzWWM3VTFWNnY5dlZVZHJuTjZEMElpT2dGYUo4S0FXSnZCMFVr?=
 =?utf-8?B?alZpdmFTS2E0dFZ4RkpZbmdFOXNKYm03c0hHeTMrMmI1M0N4WDc4VG55N0l4?=
 =?utf-8?B?NnFRTjNKNThZcElOTFJjRzJ5L1BWSmZCdVArbG12WVg4VUprUlMyQ2xvdUxK?=
 =?utf-8?B?d0dWOHNiZVlrWFFiVGJ4MmloeDN5Qkx1SEYzZXhCbEhaNCtTbUV6VWhtaVBZ?=
 =?utf-8?B?aFhUcXhpVFpMN09PSEE5Tk93enZVd29zUzVaSnB4bnVQalhpeHV5WVlNOTd5?=
 =?utf-8?B?aTVEaHlZaEpyUjlRWUgvN1F1amJaZFR4amh2WVJFZ0d3K0l4b2J0bTJvdksw?=
 =?utf-8?B?ZktMRGdTSzZEeVZjYVdKOFpkZmw1dnB2OGh4d2w3KzFoS21MYzBQVFRvTVFl?=
 =?utf-8?B?RnJTMG1PZEg5R2pJL3pDcnE5cVF0ZWh2SEd4bjdrR2RDaTY2bzZJM3A2YUgy?=
 =?utf-8?B?VUd0USt0enMrSjN5dzJyemNVUVhhc3A3SC9vaEFWaTdWRUpSZHZGZFRyYm5T?=
 =?utf-8?Q?J6wa2MQ0EgwgTF7ZuAajnUGiN5CrBvbymrjBQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2VyUjlXN05WM0puMjh4NXkwUUdHN2xwUS9Zb2p0bkFuWlBlRjB5dDM0VmNW?=
 =?utf-8?B?NDVZZ1BKZm01bEZJNUN6bEM5VXR2UEd6NEM4bGlrMGlvY0pFdFZ4blJWc1BR?=
 =?utf-8?B?N0xuTTRIc2d6cGN6S1pVYWZ1YTdkK1dNRndTVDNjc0JkVThTZWlpWUhRZ0dZ?=
 =?utf-8?B?NnhmcjBBTklZbDdRUjZHV0ZnWGVWQmFGYnNHR1R2RkltQk5xSzNxSGQ1RHdV?=
 =?utf-8?B?VDZ5UGE3N0xYUFFKNWQ1ejRCNEVBS3Vad0VaLzcvbnpEaHdqODkrdStKSDZ6?=
 =?utf-8?B?Vmd0SHVhbHdGMWpqL0s4dzFGdk9aQ3lGeFMyMDYzVkUvNTNGNWRrTzgySmZn?=
 =?utf-8?B?SG1aQXVXV2tmYmNBbGg5SDExeUZlR0lIVnp0bVlsRjdwd3RkQXBTL3Z1dWFD?=
 =?utf-8?B?Qkw2NVhmbUJVSE54QjBBc0ZqcVdnUk9GYXlKRWJyQWkySEZuRnBReE93dzAy?=
 =?utf-8?B?TXp4eUc2YlMrdjBpcXlUZVFNVEFTdDF3dEFqcmxCZ1VHZ0RyTGlsWmNOVzAv?=
 =?utf-8?B?NzBFcks1dkpNbElQa3ZIQ2FUbjVtVTVTN0J2ZDB0ZnFJWFZha3NpVFphcEVE?=
 =?utf-8?B?QmRjN2o2aFlTWFJ2UC9GUi9ZUDZMcStoQTVXMlpoaTViWmRvWkdBQmhFVUd6?=
 =?utf-8?B?VGRDb3lJcERLWFlxYXp0aHpBaHNPQjVjM2tlRFRaVG5rUGVqNG9lNzU5QXMr?=
 =?utf-8?B?MUdWaUViY3poQTVHM1hGRXkvWnVaTnVDMmhDTDNwRFpXamZtbXYvRmJvK1dS?=
 =?utf-8?B?OGdLYTAvYUNyUVBnNWszVEFTK1ZXdS9LSUVpdmY5YTA2cE1xMEg4Z05BL21x?=
 =?utf-8?B?WVdURzdYaW9tSis1T1hVc1J5R3pQNzBoSlFhS0wyQ1h0NDNoNGcrTnhGTGJB?=
 =?utf-8?B?bk5kaGNuUmsvTjgxd3EwcklpSVpGOWNwYndxcDd0M3MwK0twVkR5ZktLNFF6?=
 =?utf-8?B?ay9mNStBSlJMdmMybTMveGhzaWgvMmZHZ3V0ck84eXF2QUFoR3AxMU41QUMw?=
 =?utf-8?B?ejNwdEtrK1luRTh4SS9QYzVPcW01eTVqcnRmYUdrc1dkc285ekVla291eUdy?=
 =?utf-8?B?TkcvZS9GaWM3Q3dtRTFpV05xbjg2eDZQY0Y4bjZSdzVYMHRCcmJXcGdqbjlh?=
 =?utf-8?B?M0dwck5lSWJsWThWUU1FMmJGZzZBZUlXZ2piNDNlbG9VNUwxOXNvZ25oSUlp?=
 =?utf-8?B?UXBWNmJmOVlWWjJCVklkd2ZJak9YaWpzTzF3dmpaSmk5NkdEN1ZYQks0aGZT?=
 =?utf-8?B?R1VmSVUyQ1g4NjR5K3hoUEdraUY4S3hjRitoNkdCZ3hYNkRTLytNREdQZVdr?=
 =?utf-8?B?ZTBaVURjMWk4R0Y3UXdBZmpPRG5qSnpNRGczckpRU1V6ZlVPMXV4RDloK3h3?=
 =?utf-8?B?Uzk1V0VoNXhCclk2a25CajRmeE1udm9QQ2JxT3pWZ3dWS2J0VlVtRnlUOFJn?=
 =?utf-8?B?Q0ZPek10Mzh0R1NYZnNhVngzcGFhSTNjOUI0akpYWTkrcnA4U3UvU1huZGdu?=
 =?utf-8?B?RERNZlVUYUhreTk4S2ZESnlVVlBocnd3eWNkOVpGZTdLTUs0WGtEK3dyaUZW?=
 =?utf-8?B?QTEySnptQ2swTDRObWFzd0JNQSt6MVBXVXh1OUc2cGZHUlNOUUlTdkpjYUly?=
 =?utf-8?B?NzN6Z28yM1UwbUpsVHdJT1FmZlE5YTIvN1UyVEdzL2FuK0NQSFZ4ZGVST1Fi?=
 =?utf-8?B?Z0NCOTl3Z1ZVbjdPUVg4N1VMWDA4UG0xUEVqZDlWYVlZU05wUXVvbEtNTUNC?=
 =?utf-8?B?MTV5RlZONzFOUkdQYUNwbVNMRUY3MUpQTWkwOWthTmZnZE1hZ2dwZWNYbUVy?=
 =?utf-8?B?MHRvMDNKcUZhMElZNG1VbkRiRjZpaXVKYkpKSENDSTJsVDhYaUJRSHEydDlT?=
 =?utf-8?B?MmRVVVUwcXQxdXNCTExVdmx0M2tKQURtaUFGY29wNURQRzNGRDlKTnZQOUtP?=
 =?utf-8?B?RmhwZHBJTnpVamhvRnQzY2hYTjg5MUw0TjdlWDk2c0pBelhUTXEzMWFjaFdK?=
 =?utf-8?B?V0g1SGVFVkRSVWxYczJkd0RMZy9RcmdzL2tVbnJsaTJGSWZhUitDZEJacklw?=
 =?utf-8?B?ZDVkOFFWbzRmSGc1ZUJYSFZ2UUhrOU10eG9mR2Jld2ticFRxZ09RWGFaNTZL?=
 =?utf-8?B?b01PMHJZYjZucVo3VHN4V0pWdjNQSjNGT3orUGticHNmMzMySGhNQzdjQ3lx?=
 =?utf-8?Q?S3cGR4uXfLq8dKARYuaXjBY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8559C70F48438D45B127EB8C5ED4C9A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d401540f-e659-4cae-11c8-08dc9e55e912
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2024 07:24:59.9006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bg3XwWKABT6BrH40lXEOpN1NeZG/pgkJqlK8bgTSyXeplJiDRHTKpCJrrbVkL5mxjY1qr8BIOSZ7Irdp5ZCaBish+XJHYKjNuALbOT507zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
X-OriginatorOrg: intel.com

SGkgSGFucy9JbHBvLA0KDQpPbmUgaXNzdWUgd2FzIGZvdW5kIGluIGxhc3QgMiBkYXlzLCB3aGlj
aCByZXF1aXJlcyB1cGRhdGUgdG8gaW50ZWwtDQpzcGVlZC1zZWxlY3QgdG9vbC4NCiANClB1bGwg
cmVxdWVzdCBmb3IgSW50ZWwgU3BlZWQgU2VsZWN0IHZlcnNpb24gdjEuMjANClN1bW1hcnkgb2Yg
Y2hhbmdlOg0KLSBGaXggc2V0dGluZyBvZiBUUkwgTVNSIGFmdGVyIFNTVC1URiBpcyBkaXNhYmxl
ZCBpbiBhdXRvIG1vZGUuIFVzZQ0KY29ycmVjdCB1bml0cy4NCg0KVGhlIGJhc2UgYnJhbmNoIGZv
ciB0aGVzZSBjaGFuZ2VzDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9wZHg4Ni9wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQNCmJyYW5jaDogZm9yLW5leHQN
Cg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KY2YyNTQ3N2M1MjEyM2ZkMTgz
NzNlYTQzMzM2ZTQ0MTg1ZjQ3NDRjMDoNCg0KICBNZXJnZSBicmFuY2ggJ3BkeDg2L3BsYXRmb3Jt
LWRyaXZlcnMteDg2LWxlbm92by1jNjMwJyBpbnRvIHJldmlldy0NCmlscG8gKDIwMjQtMDctMDYg
MTE6NDA6MjkgKzAzMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFuZHJ1dmFkYS9saW51eC1rZXJuZWwuZ2l0IGlu
dGVsLXNzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCjU2MzE3MTdkM2NjYjU2
OTc4M2NjZjdlMzVlNDc4ZjU5ZjQyM2Y5MGY6DQoNCiAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNw
ZWVkLXNlbGVjdDogdjEuMjAgcmVsZWFzZSAoMjAyNC0wNy0wNw0KMDA6MTA6MzYgLTA3MDApDQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NClNyaW5pdmFzIFBhbmRydXZhZGEgKDIpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2
L2ludGVsLXNwZWVkLXNlbGVjdDogU2V0IFRSTCBNU1IgaW4gMTAwTUh6IHVuaXRzDQogICAgICB0
b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yMCByZWxlYXNlDQoNCiB0b29s
cy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29uZmlnLmMgfCAyICstDQogdG9v
bHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvcmUuYyAgIHwgNiArKysrKysN
CiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpUaGFu
a3MsDQpTcmluaXZhcw0KDQo=
