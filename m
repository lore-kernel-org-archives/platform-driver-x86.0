Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795124505;
	b=UvcdViZpbCMRFCmzxkU18c7q86XRewT7OsSTXeT7J/7fRgLL5Cr0R3OBpp4EC2aF0Sqk
	 ivNntidjUb+5JpKPlxFIPhRcwtckdzApRoZK1gt4aMmqAsjlMQFAy/gwbZR8ynuj2faPA
	 zlXQJtxQI4iBNQm38P/O7IR4tVvEU9IpvlMhH3cvny18jeTw37UibLvINXdR0JVMjPKro
	 COf+j24SbwVqN+yK6Nj6m9KTQfvtx0+x5EFJxcFeYUHIGXQJMTrbh4jrwYc4EfHLhsJ1s
	 ZGV8yxzXd7sw2UJho9aUTiv0VN7xS+IX7OvsW5uRrRmqnuYObBtOGqp0ra2yN7yj9zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124505;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=vDj7wODMTfE4+He4XFUfMkJG73jWzTUTGWgNDOp08Og=;
	b=OJAb7kWBgH+4GPsJYg1+lkA1JWCZJPztQZKUPnk35aynHRpVJYT8tTlP2kIoDxQVoSfV
	 w6QXH7YDyVxknC1VO7zfpP0gIqD5hw4Pn5rfTgPVY6qUqcvS9EgEu7hwzfxDZCny3HQZ4
	 kmvpMlIVkmSiii2O6U8eTyMVa76vYur/1qduaPxThgWzTp9aF4F8EhppRINp1W/h1aEND
	 wOp+3T2gQFeOwhYbhZ+WiOXqdJsv4SmcffKdv44uc2fTe+bTYtMrYwjRgpLyUHdCZIR6o
	 1JrkK3lrWblKWgwst2YfvrDyZyJT0FYjEnLy8MRqjClxsA8dUMLrFsGmOqYNqxbtF8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ABgg8vUL;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="Q3/QzjV9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB9606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 21:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADB9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ABgg8vUL;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Q3/QzjV9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795124505; x=1826660505;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vDj7wODMTfE4+He4XFUfMkJG73jWzTUTGWgNDOp08Og=;
  b=ABgg8vULZg0U/GiaRIXrOT6U5vgrnG2/Vl20m/Yexd0rknOd+Frt0GN+
   Hhcx0b+aXgaemGL0+stJ75Vvs991CwQ+hoJ1cy6SvbwW7GuVWFAR4S3C4
   HUZ1gilGk68CPMGV3DEjlEDUmJuU5NKkbHyR0DRrtXAO6iMMEbQnUzwsI
   aa+zaLMKbtD94BgWPjQ92+L5FjrSEEOIz3Q9AogQq9Ymle+Rx8BJU/+Bh
   t0fAkPmTECAhBh6Hk+GR4iSat3GG5xR7neQLsnZ5VLKX2j+F0vnVweRY6
   DVQhYEpVArpqT99Kr4U1XAj/0ek0LMxokPJtsEjafD8UM3o1mlWVh6Z26
   g==;
X-CSE-ConnectionGUID: aQpCiIsQQSCOTCtjZWoTkg==
X-CSE-MsgGUID: mUprsUSeQGixgdHROnQ1KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3997476"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3997476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:41:44 -0800
X-CSE-ConnectionGUID: 7c8fk6A6SAWHJyMVI2T2VQ==
X-CSE-MsgGUID: Sv9iQRO3T5uLjeHvG2SAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10364095"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:41:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:41:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 13:41:43 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:41:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owdOHGKcOFRo3bVtMsVbIUkYyZdloGRxbq5Xjm4Vp+eyxcwjfwGIc/FUeMZSviCN4OuQdkhkZXT7a9HTNYhLgKitPCEl39p6LbjIBFM0JlwjoK5rCxzWZQx4pPTZWMbzV7zXr1lAvOWWt25KvhUYwuFrGK8fpsRtMurWRXvMreOkTGk+y0zlNphLq1UMBYf0aQbBXC9uN9Cubd+8h7THX6L9duyWhj2ga74HgM2aqElz5drOSEsm1RSHY22hS5EPkVj4PwSUxY12kvMXZoRchmWrZEoIhEKAE5T/ZEiYe0TRYvr2IsSU4/DvwZgU3oJPcOqzLtOc9xpt9RS0OdOxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDj7wODMTfE4+He4XFUfMkJG73jWzTUTGWgNDOp08Og=;
 b=ukV2KlNcmkSpz1Z4oY8+sF/RhnG2o3BdV/qOvV8ImJHOVvObYwx5Zr9dNl9IbAtiTrHUdQxcLWWXuvk8UHUwqnhnwmLwyBYlxadNG7nrsou//gpHjAPx6UBEgh+OAGTR7uOqTfd3uR1JkvpDUjYfTl/yA92taVAoPVpv4CQp3IlJChL69PzH2W9LAO4MjK90NtTOPE0lM8QSOSCPPL1EN5xGo9QhjlptNEqfprIYxrLzwJ3GrZgoLNOQsZ0hDmsNqktJW/g6qqqf2YA2dde61E3CJFAL2EFZWY5HqIqtxl2EfmyzqyNE9HlQSJtPfhtgsvxHvIQMR1NyZUGE9tZQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDj7wODMTfE4+He4XFUfMkJG73jWzTUTGWgNDOp08Og=;
 b=Q3/QzjV9a0F6KtxHK0X+JsmN/W2x9kOByOfBEKiTdHkiqIzLO1cdAJnTcLPTTr47XclacfJ9+DU/HbIn6VgBgG8gs82paiYmQIfkiBOGQwp7++2fxwIf3XSg/qUyV+l3lAJicIkCs0XNnzQ7KaxiszbazT4lQ/tAY1MKr/ae5rg=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CH3PR11MB7772.namprd11.prod.outlook.com
 (2603:10b6:610:120::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 21:41:35 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 21:41:32 +0000
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
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: RE: [PATCH v19 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH v19 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdeD52JylSp6IEqkylfAeVWgrdgrc14s+AgAAHl8A=
Date: Thu, 19 Nov 2026 21:41:32 +0000
Message-ID: <CH3PR11MB04614920DB3241FA3B0089DE72C1792@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
 <20261119155438.40762-35-michael.j.ruhl@intel.com>
 <av9kgfXlujk2SeT-@intel.com>
In-Reply-To: <av9kgfXlujk2SeT-@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CH3PR11MB7772:EE_
x-ms-office365-filtering-correlation-id: 6366fecd-a785-43cc-9838-08df4685e0e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|22082099003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261026121527099003|261022075727099003|261026135527099003|261026140227099003|261028144727099003|261022115727099003|261022105027099003|261021130227099003|261021133027099003|261021121427099003|261021135927099003|261026130827099003|261021123027099003|261022113327099003|38070700021|10067099003;
x-microsoft-antispam-message-info: H1P1epVjVZLXeRo3uidHvMrDDltAwXsGgAezdbLJi1HzcJdWGerQGK4OdPDMEcZtDyNKVGp4FrtwYJExVbSTAqw5ejsP2IJO/jYNcJ4zT/ugfhwLJvrqyReBI/sfCbeIjLuut1ScmMoDE4vZtXjKs/xWBrschZ6Q+3TmJ7UzVo1ViXVAXWJhxEOmufCdqfByQijoyE3EzGbwICF/TmPYbKMhBF2XcA+LrdibafrzoEVl8Zp4Z9EtsDhJ0ke76c8e8kchXm4Yi6uDasnzBXTKd4eXfdrELbQklPkSnPybcnDdb0Ufya/VaTkDLhEco0B/9exh6DTYh2D7zKi+czQmuoPRbLwhF4YFdeVrIR2hea9C4rUcAHVO+GpnDKDoaiC3wVy+RT2ZyqLju2PbiuK4uojWy4TIsyo681EKYPTIvmgLQXxdFjPH9I/zFLFEKWlybhIgccxdUoNwDQVwN42AiqDy1S7uOva2LUBN4hF63rDrVEjwbAQbzuR+AaazCaAFsIwMOW/ZAWVjTVv2gxJ3vfqpG9c5lmEl9pc6ag8oQvBvj05IU6S7xMjIb4YePa6qWcMF8gYPbI+p8H35N9InFtOWHXa+pwZzup+A73dPvQggZj7Izoxsq7IU5V3xXjEH56/7pvDdcKurfdSQ1AZu25hyNA/SVIP2pgSQAO2qCHFtsBrUds8DAePR5Cxw0OYXOB96z1U/qOfXvzQpy2889uIn2/31AWzJBM1VUGRtLmQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261022075727099003)(261026135527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261022105027099003)(261021130227099003)(261021133027099003)(261021121427099003)(261021135927099003)(261026130827099003)(261021123027099003)(261022113327099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YW1ybXdqVTVGekthVGd2b0tRbG15SWNoV0p4M1REVk9Eb0lMK0hVMUszdEMz?=
 =?utf-8?B?UGYwcTZTNWxMbk5aVHdxbHdFYmE2a2NjZmJYc0lrVVVSTmkrRU1KWjNGczVS?=
 =?utf-8?B?eHNIVmZFNDU1WXM3YlV4S1NuUmJLTzJFaWozY05UNUp4c0k4czBtbit5SWkr?=
 =?utf-8?B?TE44N01lOUlaT2Z2ZGxDaXJXREEwcWYrZkhvOUNreHFVbU1hZ0ExeVRFeFdq?=
 =?utf-8?B?Z040N2l1K0tDTUJOcUtHeFFsYTd6ZEpPVEtuREUvNGNhcVZYY1gxTFFkTC9G?=
 =?utf-8?B?OE5qVk1PNW9EZTU3cTJQSGxLWXY0YnArKzhmdGFObzNIajE5aWFRUFFhUVZX?=
 =?utf-8?B?QW9nNEZzK0JnZkw5a0dFc1N4NytJcGF1L1JNNWZUNG9UZGxqNVZxVG9RWCtE?=
 =?utf-8?B?d2EwOTlaY3V1SmlVTTFRRDYwSEdBMHJzd3c5MlF5RHZQWkd3UWF3Z3Q4VFFM?=
 =?utf-8?B?ZVJSbXVxQ1NLKzVKTlJENXJOZlZiTldLZkh1d0NNdjZlcjN3aU43UXB0NzRr?=
 =?utf-8?B?VUc4bm5TNllLZGZLZ3BBbkhCalNlS1RpTjVXRFpnY1B6bjVXS1E0a0U4WUJl?=
 =?utf-8?B?bzBjNVdHUHBuTzJaUVZPdHd6S3RjMlR1Nm1oZzFxR1laNjNzQjVxam44V1p1?=
 =?utf-8?B?WDRkVHI1bmxQTFJ4L0R5VWJiTDJGWDhTRmZGU29HWWJaK0hWVzVSTndlbGZs?=
 =?utf-8?B?TzNSWlJqbXBBQzRVc3ljVlFITkdHb3duUld5ODYySFh2b0Z3QWxRTkdLYVZ6?=
 =?utf-8?B?b3pXYXhrM1BnN0dIOEs1a3Z0Z3JDa09hTDcyMDZOUi8wRy9jN2E5ZDY3a1NL?=
 =?utf-8?B?bjl1TzNqT2Q3WVJpc3E5VjBNQnVrS1lVMWRHV2xIZUw4RW1vS2lVTmhtTE81?=
 =?utf-8?B?N1BPNG84cS9KZWdqSHU4c2RzTnBFVzFhMkhibnpyK3JXRU82enlPUTJwa2pq?=
 =?utf-8?B?ZklIODh6NGlvdkttK09yRW10bzZEaExpTnRMd3dmbzhVSzVuYmU0dDZ5cS9l?=
 =?utf-8?B?Y2ZJSktRa1dTdzZGRUhTaldubkF0cThrV0wvd24zMm1zL2NHa2VRTHJnREth?=
 =?utf-8?B?Tk1NYlB0NFJjdmtJWHR3cm4vQ0lRVEppbDYycDlNZm1aWXNUQ1hvSmVtWmJa?=
 =?utf-8?B?eGFDUUhWMkJqMG9XclRTd0ZFT2JrRzJ0RTVnQXp4bE1jaHpGWFJrdVlXRjJz?=
 =?utf-8?B?TGEwdEZCUHY5b0k0NEwrVENDR3Aydkh4VUh2T0J6WnpxYlJNaEF2eWM0dVRw?=
 =?utf-8?B?ZitIZXZIb1Y1Q1gwM3JVTEg1QmI4TVYySHFwRy9aQS9kcTdMOEwra0w2empn?=
 =?utf-8?B?NXVqMkw2N1JFTStLRTcwS2QvbnhSKy9Ga3dRSHJJVC8rRVdQRmxBRzk0QnVG?=
 =?utf-8?B?VzNNVEtjRSttYmFTUWoxUExZTUhZWXJlWGdMeEd5WjkxeXNrazJFVEprbkor?=
 =?utf-8?B?VDlJM0lsaCs3RlhEblBKQlhrMHoyVzRXbjVmbnJTcGpXODhqTFVjUndzd0ht?=
 =?utf-8?B?VXZEWVVmaDJBLzBtb0xhU1pJS05aa25HVFdQaWh1UVFubWlRL0RYK2ZDaThZ?=
 =?utf-8?B?b3RGQTNUZXB3WFNsK2dHU1Rjd3JvVDUzZThIVXpSY2VaQmowRHFqc3lsUlNL?=
 =?utf-8?B?YmpsQzFEazNxTTN4enJXNjBIK0YxQnZnTzk3VGR2dkFTWVhTY3RFT1lFLzU4?=
 =?utf-8?B?TlBtVkNzTjNpdXhYMmNEakh1d0R0cDE1TXh1UEVYRXlkOXFOUDg3TmtuM3Bo?=
 =?utf-8?B?eEpRY014a3hJemN2aDkwcUxZeThnc1dkcHJQQzZpS1lqNlVWUXlaK2RTYWpQ?=
 =?utf-8?B?YklSTTNVQ1dQNityUDhlTjRmcVVMZlVTV2hpcjNLcW96YXV5SmthbXdublQ4?=
 =?utf-8?B?eS9LVk9nQno2SHlEaFZLc1FXbFlJQ1hXRlQxSnhtTzlYR1BsVWc3K3lNTmlq?=
 =?utf-8?B?d1R5bHpFZk9ld1dTd090cGFTRHdCZk9NMjBMN011N1F3bmk2VlVwcGlJWUp3?=
 =?utf-8?B?T3drTG55WDg4T3pXMzlQL0k2ZmhZeEEvMGFBR2lCMkp3LzQ0ZkNkZ0dzS2FD?=
 =?utf-8?B?di9rWnQvVzhRaHM2MXBNc2lHNXRsZHJXZ2M1RGlYMk1reExTeW94YytpdXdT?=
 =?utf-8?B?UEEycDhJZEQrWEFBQ3VBb2dMZ3lNdnlNOCt2RnlYMVRhVmFXTDNoNFJaS0Vx?=
 =?utf-8?B?b1JDSy85QmRwY2VuU1JvR0hpN3gyUUJFdS9kcGkxcjBCL3I5N0MwUS8wa1BX?=
 =?utf-8?B?Zk9EUGhCa2FLa2dwVlhxQTVxeEpXTDVTWjhicUN5SzlrYktHa092QjI0NlZ4?=
 =?utf-8?B?SWRLSEdXalJpWG5kSzdYVzVCOGhuZlh1N1plMU9FMldyc3Z0a2FBQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AzThVdq2MD17RetI278VfYtkn1m5lS8MFmz1jyx13KLJRqpYBLClCyJnsd3/sJtVvdesSe0y+7nC7fE9tIrIZgWKtsKzjXofKzmigbS2aUP/FoRUh3h7qXJ8Vzc+YZUYt4MoaeTSssJkmKW+CKccQUvTF4i0k5NtnOIsmTIDu/Sc39oo1RB+ZCT0WiiRQ9wd7WBO7EhSa3Ot1kRhdz94OlQM7UjwimWUH7Lte/N8prdtQFIUDinudG03/jxpN5GjEcZzkiCcIy118ytDO7rrlHUj9bP9UFNRVv8ns6BX53VjOpRhfnHfefKlKxBvY5I2rA4wZjqqNV4by7irkGOLHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6366fecd-a785-43cc-9838-08df4685e0e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:41:32.7266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84s3KVvkxFH4mvChzqufdQllSGKSTRlyFq+CjDNUgN/lQ9qTw4AW3+CKPVWjyhXlx1lrEMyicu12bPdDM4FJA0slNgFeZkM09pngv3baG4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7772
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogVml2aSwgUm9kcmlnbyA8cm9kcmln
by52aXZpQGludGVsLmNvbT4NCj5TZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTksIDIwMjYgNDow
NSBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj5D
YzogcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsNCj5oYW5zZ0BrZXJuZWwub3JnOyBpbHBvLmphcnZpbmVuQGxpbnV4Lmlu
dGVsLmNvbTsgQnJvc3QsIE1hdHRoZXcNCj48bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyB0aG9t
YXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsNCj5haXJsaWVkQGdtYWlsLmNvbTsgc2ltb25h
QGZmd2xsLmNoOyBkYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb207IFZpamF5LA0KPkFub29wIEMg
PGFub29wLmMudmlqYXlAaW50ZWwuY29tPjsgTmlsYXdhciwgQmFkYWwNCj48YmFkYWwubmlsYXdh
ckBpbnRlbC5jb20+OyBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29t
PjsNCj5BdXNtdXMsIEphbWVzIDxqYW1lcy5hdXNtdXNAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjE5IDE0LzE5XSBkcm0veGUvdnNlYzogQ3Jlc2NlbnQgSXNsYW5kIFBNVCBjYWxs
YmFja3MNCj4NCj5PbiBUaHUsIE5vdiAxOSwgMjAyNiBhdCAwNzo1NDo1MkFNIC0wODAwLCBNaWNo
YWVsIEouIFJ1aGwgd3JvdGU6DQo+PiBDUkkgUE1UIHN1cHBvcnQgcmVxdWlyZXMgY2FsbGJhY2tz
IHRvIGFjY2VzcyB0aGUgZGlzY292ZXJ5IGRhdGEgYW5kDQo+PiBjb250cm9sIGFyZWFzLiBBY2Nl
c3MgaXMgYSBjb21tb24gTU1JTyBhcmVhIHRoYXQgcmVxdWlyZXMgYW4gaW5kZXggdG8NCj4+IGJl
IHNldCBiZWZvcmUgYWNjZXNzIGlzIGFsbG93ZWQuDQo+Pg0KPj4gSW50cm9kdWNlIHRoZSBuZWNl
c3NhcnkgY2FsbGJhY2tzIHRvIGdldCB0aGUgZGlzY292ZXJ5LCBzdGF0dXMgYW5kDQo+PiBjb250
cm9sIGluZm9ybWF0aW9uIGZvciBDUkkgUE1UIHVzYWdlLg0KPj4NCj4+IEFkZCB0aGUgZ2x1ZSBs
b2dpYyB0byByZWdpc3RlciB0aGUgQ1JJIFBNVCBmdW5jdGlvbmFsaXR5Lg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPj4g
LS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyB8IDE3OA0KPisrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE3NCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdnNlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gaW5kZXgg
YTgxNGQ3MTUxZWVhLi41OGViODVmYjZhOWYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdnNlYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+
PiBAQCAtNCw2ICs0LDcgQEANCj4+ICAjaW5jbHVkZSA8bGludXgvYml0cy5oPg0KPj4gICNpbmNs
dWRlIDxsaW51eC9jbGVhbnVwLmg+DQo+PiAgI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+DQo+PiAr
I2luY2x1ZGUgPGxpbnV4L2xvZzIuaD4NCj4+ICAjaW5jbHVkZSA8bGludXgvaW50ZWxfdnNlYy5o
Pg0KPj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+ICAjaW5jbHVkZSA8bGludXgvbXV0
ZXguaD4NCj4+IEBAIC0zNDQsMTAgKzM0NSwxNSBAQCBpbnQgeGVfcG10X3RlbGVtX3JlYWQoc3Ry
dWN0IGRldmljZSAqZGV2LCB1MzINCj5ndWlkLCB1NjQgKmRhdGEsIGxvZmZfdCB1c2VyX29mZnNl
DQo+PiAgCX0NCj4+DQo+PiAgCXNjb3BlZF9ndWFyZChtdXRleCwgJnhlLT5wbXQubG9jaykgew0K
Pj4gKwkJdTMyIGRldmljZV9pZCA9IEZJRUxEX0dFVChHVUlEX0RFVklDRV9JRCwgZ3VpZCk7DQo+
PiArDQo+PiAgCQkvKiBzZXQgU29DIHJlLW1hcHBlciBpbmRleCByZWdpc3RlciBiYXNlZCBvbiBH
VUlEIG1lbW9yeQ0KPnJlZ2lvbiAqLw0KPj4gIAkJeGUtPnNvY19yZW1hcHBlci5zZXRfdGVsZW1f
cmVnaW9uKHhlLCBtZW1fcmVnaW9uKTsNCj4+DQo+PiAgCQltZW1jcHlfZnJvbWlvKGRhdGEsIHRl
bGVtX2FkZHIsIGNvdW50KTsNCj4+ICsNCj4+ICsJCWlmIChkZXZpY2VfaWQgPT0gQ1JJX0RFVklD
RV9JRCkNCj4+ICsJCQl4ZS0+c29jX3JlbWFwcGVyLnNldF90ZWxlbV9yZWdpb24oeGUsDQo+Q1JJ
X0lEWF9URUxFTV9ESVNDT1ZFUlkpOw0KPj4gIAl9DQo+Pg0KPj4gIAl4ZV9wbV9ydW50aW1lX3B1
dCh4ZSk7DQo+PiBAQCAtMzU4LDIwICszNjQsMTc4IEBAIGludCB4ZV9wbXRfdGVsZW1fcmVhZChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHUzMg0KPmd1aWQsIHU2NCAqZGF0YSwgbG9mZl90IHVzZXJfb2Zm
c2UNCj4+ICAJcmV0dXJuIHJldCA9PSAwID8gY291bnQgOiByZXQ7DQo+PiAgfQ0KPj4NCj4+IC1z
dGF0aWMgc3RydWN0IHBtdF9jYWxsYmFja3MgeGVfcG10X2NiID0gew0KPj4gKy8qKg0KPj4gKyAq
IHhlX3BtdF9kaXNjb3ZlcnlfcmVhZCAtIEdpdmVuIGEgZGV2aWNlIGFuZCBhbiBpbmRleCwgcmVh
ZCBkaXNjb3ZlcnkgZGF0YQ0KPmludG8gYSBidWZmZXINCj4+ICsgKiBAZGV2OiB2YWxpZCBYZSBk
ZXZpY2UNCj4+ICsgKiBAY2FwX2lkOiBQTVQgdHlwZQ0KPj4gKyAqIEBlbGVtZW50OiBlbGVtZW50
IHRvIGFjY2Vzcw0KPj4gKyAqIEBkaXNjX2RhdGE6IGJ1ZmZlciBmb3IgZGlzY292ZXJ5IGRhdGEN
Cj4+ICsgKiBAY291bnQ6IGJ5dGVzIHRvIHJlYWQNCj4NCj5jb3VudCBkb2Vzbid0IGV4aXN0IGJl
bG93Li4uDQoNClllYWgsIGFscmVhZHkgY2xlYW5lZCB1cC4g8J+Yig0KDQo+PiArICoNCj4+ICsg
KiBUaGlzIGlzIGEgY2FsbGJhY2sgQVBJLiAgSS5lIHRoaXMgY2FuIGJlIGFjY2Vzc2VkIGV4dGVy
bmFsIHRvIHRoZSBYRSBkcml2ZXINCj4+ICsgKiAoUE1UIGRyaXZlciBzY29wZSkuICBCZWNhdXNl
IG9mIHRoaXMsIERSTSBob3RwbHVnIG5lZWRzIHRvIGJlIHZlcmlmaWVkDQo+PiArICogKGRybV9k
ZXZfZW50ZXIoKSkuDQo+PiArICoNCj4+ICsgKiBSZXR1cm46DQo+PiArICogKiAtRU5PREVWIGRl
dmljZSBpcyBub3QgYXZhaWxhYmxlIChob3RwbHVnKQ0KPj4gKyAqICogLUVJTlZBTCBmb3IgdW5z
dXBwb3J0ZWQgZGV2aWNlIG9yIFBNVCBmZWF0dXJlDQo+PiArICogKiAwIG9uIHN1Y2Nlc3MNCj4+
ICsgKi8NCj4+ICtzdGF0aWMgaW50IHhlX3BtdF9kaXNjb3ZlcnlfcmVhZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHVuc2lnbmVkIGxvbmcgY2FwX2lkLA0KPnUzMiBlbGVtZW50LA0KPj4gKwkJCQkgdTMy
ICpkaXNjX2RhdGEpDQo+PiArew0KPj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGtkZXZfdG9f
eGVfZGV2aWNlKGRldik7DQo+PiArCXZvaWQgX19pb21lbSAqZGlzY19hZGRyID0geGUtPm1taW8u
cmVnczsNCj4+ICsJc3RydWN0IGludGVsX3ZzZWNfaGVhZGVyICpoZWFkZXJzOw0KPj4gKwlpbnQg
cmV0ID0gMDsNCj4+ICsJdTMyIG9mZnNldDsNCj4+ICsJaW50IGlkeDsNCj4+ICsNCj4+ICsJaWYg
KCFkcm1fZGV2X2VudGVyKCZ4ZS0+ZHJtLCAmaWR4KSkNCj4+ICsJCXJldHVybiAtRU5PREVWOw0K
Pj4gKw0KPj4gKwlpZiAoeGUtPmluZm8ucGxhdGZvcm0gIT0gWEVfQ1JFU0NFTlRJU0xBTkQpIHsN
Cj4+ICsJCXJldCA9IC1FSU5WQUw7DQo+PiArCQlnb3RvIGRldl9leGl0Ow0KPj4gKwl9DQo+PiAr
DQo+PiArCXN3aXRjaCAoY2FwX2lkKSB7DQo+PiArCWNhc2UgaWxvZzIoVlNFQ19DQVBfVEVMRU1F
VFJZKToNCj4+ICsJCWhlYWRlcnMgPSAmY3JpX3RlbGVtZXRyeTsNCj4+ICsJCWJyZWFrOw0KPj4g
Kw0KPj4gKwljYXNlIGlsb2cyKFZTRUNfQ0FQX0NSQVNITE9HKToNCj4+ICsJCWhlYWRlcnMgPSAm
Y3JpX2NyYXNobG9nOw0KPj4gKwkJYnJlYWs7DQo+PiArDQo+PiArCWRlZmF1bHQ6DQo+PiArCQly
ZXQgPSAtRUlOVkFMOw0KPj4gKwkJZ290byBkZXZfZXhpdDsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlv
ZmZzZXQgPSBlbGVtZW50ICogKGhlYWRlcnMtPmVudHJ5X3NpemUgKiBzaXplb2YodTMyKSk7DQo+
PiArCWRpc2NfYWRkciArPSBoZWFkZXJzLT5vZmZzZXQgKyBvZmZzZXQ7DQo+PiArDQo+PiArCXNj
b3BlZF9ndWFyZChtdXRleCwgJnhlLT5wbXQubG9jaykgew0KPj4gKwkJeGUtPnNvY19yZW1hcHBl
ci5zZXRfdGVsZW1fcmVnaW9uKHhlLA0KPkNSSV9JRFhfVEVMRU1fRElTQ09WRVJZKTsNCj4+ICsJ
CW1lbWNweV9mcm9taW8oZGlzY19kYXRhLCBkaXNjX2FkZHIsIFBNVF9ESVNDX0RXT1JEUyAqDQo+
c2l6ZW9mKHUzMikpOw0KPj4gKwl9DQo+DQo+d2UgcHJvYmFibHkgbmVlZCBycG0gZ2V0L3B1dCBo
ZXJlLCBubz8hDQoNCkluIHRoZSBub24gbGF0ZS1iaW5kaW5nIHByb2JlIHBhdGgsIHJ1bnRpbWUg
aXMgYWxyZWFkeSBpbiBwbGFjZS4NCkZvciB0aGUgbGF0ZS1iaW5kaW5nIHBhdGgsIHRoZSBydW50
aW1lX2dldCBoYXBwZW5zIHdoZW4gdGhlIHdvcmsgaXRlbSBpcyBxdWV1ZWQgYW5kIHJlbGVhc2Vk
DQp3aGVuIHRoZSByZWdpc3RyYXRpb24gaXMgY29tcGxldGUuDQoNCk0NCg0KPj4gKw0KPj4gK2Rl
dl9leGl0Og0KPj4gKwlkcm1fZGV2X2V4aXQoaWR4KTsNCj4+ICsNCj4+ICsJcmV0dXJuIHJldDsN
Cj4+ICt9DQo+PiArDQo+PiArLyoqDQo+PiArICogeGVfcG10X3JlYWRfcmVnKCkgLSByZWFkIGEg
Y3Jhc2hsb2cgcmVnaXN0ZXINCj4+ICsgKiBAZGV2OiB0aGUgeGUgZGV2aWNlIHRoYXQgcmVnaXN0
ZXJlZCB0aGUgY2FsbGJhY2sNCj4+ICsgKiBAZ3VpZDogUE1UIGd1aWQgb2YgdGhlIGNyYXNobG9n
IGluc3RhbmNlDQo+PiArICogQHJlZzogZGF0YSByZWFkIGZyb20gdGhlIFBNVCBkYXRhIHN0cnVj
dHVyZQ0KPj4gKyAqIEBvZmZzZXQ6IHdoaWNoIGRhdGEgdG8gcmVhZCBmcm9tIHRoZSBQTVQgZGF0
YSBzdHJ1Y3R1cmUNCj4+ICsgKg0KPj4gKyAqIFJlYWQgdGhlIHJlcXVlc3RlZCBQTVQgcmVnaXN0
ZXIgYmFzZWQgb24gdGhlIHBjaWUgZGV2aWNlIGFuZCBndWlkLiAgVGhlDQo+PiArICogc3VwcG9y
dGVkIHN0cnVjdCBpcyB0aGUgQ3Jhc2hsb2cgVHlwZTEgVmVyc2lvbjIuDQo+PiArICoNCj4+ICsg
KiBDdXJyZW50bHkgdGhpcyBpcyBmb3IgQ1JJIG9ubHkuDQo+PiArICoNCj4+ICsgKiBSZXR1cm46
DQo+PiArICogKiAtRU5PREVWIGRldmljZSBpcyBub3QgYXZhaWxhYmxlIChob3RwbHVnKQ0KPj4g
KyAqICogLUVJTlZBTCBpbnZhbGlkIGd1aWQNCj4+ICsgKiAqIDAgICAgICAgc3VjY2Vzcw0KPj4g
KyAqLw0KPj4gK3N0YXRpYyBpbnQgeGVfcG10X3JlYWRfcmVnKHN0cnVjdCBkZXZpY2UgKmRldiwg
dTMyIGd1aWQsIHUzMiAqcmVnLCB1MzINCj5vZmZzZXQpDQo+PiArew0KPj4gKwlzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSA9IGtkZXZfdG9feGVfZGV2aWNlKGRldik7DQo+PiArCXZvaWQgX19pb21lbSAq
ZGlzY19hZGRyID0geGUtPm1taW8ucmVncyArIHhlLT5wbXQuYmFzZV9vZmZzZXQ7DQo+PiArCWlu
dCByZXQgPSAwOw0KPj4gKwl1MzIgaW5zdDsNCj4+ICsJaW50IGlkeDsNCj4+ICsNCj4+ICsJaWYg
KEZJRUxEX0dFVChHVUlEX0RFVklDRV9JRCwgZ3VpZCkgIT0gQ1JJX0RFVklDRV9JRCB8fA0KPj4g
KwkgICAgRklFTERfR0VUKEdVSURfQ0FQX1RZUEUsIGd1aWQpICE9IENSQVNITE9HKQ0KPj4gKwkJ
cmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArCWlmICghZHJtX2Rldl9lbnRlcigmeGUtPmRybSwg
JmlkeCkpDQo+PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4+ICsNCj4+ICsJaW5zdCA9IEZJRUxEX0dF
VChHVUlEX1JFQ09SRF9JRCwgZ3VpZCkgPT0gUFVOSVQgPw0KPj4gKwkJQ1JJX0NSQVNITE9HX1BV
TklUX0RJU0NfT0ZGU0VUIDoNCj5DUklfQ1JBU0hMT0dfT09CTVNNX0RJU0NfT0ZGU0VUOw0KPj4g
KwlkaXNjX2FkZHIgKz0gaW5zdCArIG9mZnNldDsNCj4+ICsNCj4+ICsJeGVfcG1fcnVudGltZV9n
ZXQoeGUpOw0KPj4gKw0KPj4gKwlzY29wZWRfZ3VhcmQobXV0ZXgsICZ4ZS0+cG10LmxvY2spIHsN
Cj4+ICsJCXhlLT5zb2NfcmVtYXBwZXIuc2V0X3RlbGVtX3JlZ2lvbih4ZSwNCj5DUklfSURYX1RF
TEVNX0RJU0NPVkVSWSk7DQo+PiArDQo+PiArCQkqcmVnID0gcmVhZGwoZGlzY19hZGRyKTsNCj4+
ICsJfQ0KPj4gKw0KPj4gKwl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiArDQo+PiArCWRybV9k
ZXZfZXhpdChpZHgpOw0KPj4gKw0KPj4gKwlyZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+ICtz
dGF0aWMgaW50IHhlX3BtdF93cml0ZV9yZWcoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgZ3VpZCwg
dTMyIHJlZywgdTMyDQo+b2Zmc2V0KQ0KPj4gK3sNCj4+ICsJc3RydWN0IHhlX2RldmljZSAqeGUg
PSBrZGV2X3RvX3hlX2RldmljZShkZXYpOw0KPj4gKwl2b2lkIF9faW9tZW0gKmRpc2NfYWRkciA9
IHhlLT5tbWlvLnJlZ3MgKyB4ZS0+cG10LmJhc2Vfb2Zmc2V0Ow0KPj4gKwlpbnQgcmV0ID0gMDsN
Cj4+ICsJdTMyIGluc3Q7DQo+PiArCWludCBpZHg7DQo+PiArDQo+PiArCWlmIChGSUVMRF9HRVQo
R1VJRF9ERVZJQ0VfSUQsIGd1aWQpICE9IENSSV9ERVZJQ0VfSUQgfHwNCj4+ICsJICAgIEZJRUxE
X0dFVChHVUlEX0NBUF9UWVBFLCBndWlkKSAhPSBDUkFTSExPRykNCj4+ICsJCXJldHVybiAtRUlO
VkFMOw0KPj4gKw0KPj4gKwlpZiAoIWRybV9kZXZfZW50ZXIoJnhlLT5kcm0sICZpZHgpKQ0KPj4g
KwkJcmV0dXJuIC1FTk9ERVY7DQo+PiArDQo+PiArCWluc3QgPSBGSUVMRF9HRVQoR1VJRF9SRUNP
UkRfSUQsIGd1aWQpID09IFBVTklUID8NCj4+ICsJCUNSSV9DUkFTSExPR19QVU5JVF9ESVNDX09G
RlNFVCA6DQo+Q1JJX0NSQVNITE9HX09PQk1TTV9ESVNDX09GRlNFVDsNCj4+ICsJZGlzY19hZGRy
ICs9IGluc3QgKyBvZmZzZXQ7DQo+PiArDQo+PiArCXhlX3BtX3J1bnRpbWVfZ2V0KHhlKTsNCj4+
ICsNCj4+ICsJc2NvcGVkX2d1YXJkKG11dGV4LCAmeGUtPnBtdC5sb2NrKSB7DQo+PiArCQl4ZS0+
c29jX3JlbWFwcGVyLnNldF90ZWxlbV9yZWdpb24oeGUsDQo+Q1JJX0lEWF9URUxFTV9ESVNDT1ZF
UlkpOw0KPj4gKw0KPj4gKwkJd3JpdGVsKHJlZywgZGlzY19hZGRyKTsNCj4+ICsJfQ0KPj4gKw0K
Pj4gKwl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiArDQo+PiArCWRybV9kZXZfZXhpdChpZHgp
Ow0KPj4gKw0KPj4gKwlyZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgc3RydWN0
IHBtdF9jYWxsYmFja3MgeGVfYm1nX3BtdF9jYiA9IHsNCj4+ICAJLnJlYWRfdGVsZW0gPSB4ZV9w
bXRfdGVsZW1fcmVhZCwNCj4+ICB9Ow0KPj4NCj4+ICtzdGF0aWMgc3RydWN0IHBtdF9jYWxsYmFj
a3MgeGVfY3JpX3BtdF9jYiA9IHsNCj4+ICsJLnJlYWRfdGVsZW0gPSB4ZV9wbXRfdGVsZW1fcmVh
ZCwNCj4+ICsJLnJlYWRfZGlzY292ZXJ5ID0geGVfcG10X2Rpc2NvdmVyeV9yZWFkLA0KPj4gKwku
cmVhZF9yZWcgPSB4ZV9wbXRfcmVhZF9yZWcsDQo+PiArCS53cml0ZV9yZWcgPSB4ZV9wbXRfd3Jp
dGVfcmVnLA0KPj4gK307DQo+PiArDQo+PiAgc3RhdGljIGNvbnN0IGludCB2c2VjX3BsYXRmb3Jt
c1tdID0gew0KPj4gIAlbWEVfQkFUVExFTUFHRV0gPSBYRV9WU0VDX0JNRywNCj4+ICsJW1hFX0NS
RVNDRU5USVNMQU5EXSA9IFhFX1ZTRUNfQ1JJLA0KPj4gIH07DQo+Pg0KPj4gIHN0YXRpYyBlbnVt
IHhlX3ZzZWMgZ2V0X3BsYXRmb3JtX2luZm8oc3RydWN0IHhlX2RldmljZSAqeGUpDQo+PiAgew0K
Pj4gLQlpZiAoeGUtPmluZm8ucGxhdGZvcm0gPiBYRV9CQVRUTEVNQUdFKQ0KPj4gKwlpZiAoeGUt
PmluZm8ucGxhdGZvcm0gPiBYRV9DUkVTQ0VOVElTTEFORCkNCj4+ICAJCXJldHVybiBYRV9WU0VD
X1VOS05PV047DQo+Pg0KPj4gLQlpZiAoSVNfU1JJT1ZfVkYoeGUpICYmIHhlLT5pbmZvLnBsYXRm
b3JtID09IFhFX0JBVFRMRU1BR0UpDQo+PiArCWlmIChJU19TUklPVl9WRih4ZSkgJiYNCj4+ICsJ
ICAgICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9CQVRUTEVNQUdFIHx8DQo+PiArCSAgICAgeGUt
PmluZm8ucGxhdGZvcm0gPT0gWEVfQ1JFU0NFTlRJU0xBTkQpKQ0KPj4gIAkJcmV0dXJuIFhFX1ZT
RUNfVU5LTk9XTjsNCj4+DQo+PiAgCXJldHVybiB2c2VjX3BsYXRmb3Jtc1t4ZS0+aW5mby5wbGF0
Zm9ybV07DQo+PiBAQCAtMzk5LDggKzU2MywxNCBAQCB2b2lkIHhlX3ZzZWNfaW5pdChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSkNCj4+ICAJc3dpdGNoIChwbGF0Zm9ybSkgew0KPj4gIAljYXNlIFhFX1ZT
RUNfQk1HOg0KPj4gIAkJeGUtPnBtdC5iYXNlX29mZnNldCA9IEJNR19URUxFTUVUUllfT0ZGU0VU
Ow0KPj4gLQkJaW5mby0+cHJpdl9kYXRhID0gJnhlX3BtdF9jYjsNCj4+ICsJCWluZm8tPnByaXZf
ZGF0YSA9ICZ4ZV9ibWdfcG10X2NiOw0KPj4gIAkJYnJlYWs7DQo+PiArDQo+PiArCWNhc2UgWEVf
VlNFQ19DUkk6DQo+PiArCQl4ZS0+cG10LmJhc2Vfb2Zmc2V0ID0gQ1JJX1BNVF9PRkZTRVQ7DQo+
PiArCQlpbmZvLT5wcml2X2RhdGEgPSAmeGVfY3JpX3BtdF9jYjsNCj4+ICsJCWJyZWFrOw0KPj4g
Kw0KPj4gIAlkZWZhdWx0Og0KPj4gIAkJYnJlYWs7DQo+PiAgCX0NCj4+IC0tDQo+PiAyLjQzLjAN
Cj4+DQo=
