Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87B41EEE6
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Dec 2024 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.86.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734030173; cv=fail; b=hk0lvs2GpVJuJ/dI4kNpWP9ZCIxQRzg8jLFqkBhgD+Vi1SkFJu6vU1qc6blJqLAhE3A2hroVNj5Y/qn+in0tXetR0bcO2x7EwxSJGYf/Ey5rypV8+aLAGC4476LmeBUmMKHrDjzUIvMU36ejvWjdRoOUz1dsDO0TVOiFz0/pxQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734030173; c=relaxed/simple;
	bh=Xv0svEJntNQwmgK544jYEqGoiRv82EIGJj2WgbDjPPI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LzNiSs9bhFsU41lzpk20H1477jWM6hwwr5kxpvM2ESuUBF/0/y0L2z0eA/sOLq5spTwSgHC0tdIPSQklXQvZI3oJHAag9a4r55IGg5BSLItatkmMph4PuMxz5oee0YHtQaglaHwXCXAvY4SovBDx1oSV5BLDulSGNAUWSncAEHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b=h0iY/Mz/; arc=fail smtp.client-ip=173.37.86.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="h0iY/Mz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=747; q=dns/txt; s=iport;
  t=1734030171; x=1735239771;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Xv0svEJntNQwmgK544jYEqGoiRv82EIGJj2WgbDjPPI=;
  b=h0iY/Mz/rkwzZ1+khDDzNA7wsB7GeZrHbBX0X8pK/FuuOoH59q7olRW3
   XcrSO56YSn2qACN26WwULiWl9T2yTU3po8RYdS5OzvuBSzWhg5ZT/T172
   GLSe6mZ0exW+MaqiR7xnE+cHztqzHvpyPp7nCRTjXdyJ+pbHQ1fiJH0tE
   E=;
X-CSE-ConnectionGUID: jFepQZzSR6mTVR560BbLAQ==
X-CSE-MsgGUID: zZORC+XkRXiA3sYmT9SZjg==
X-IPAS-Result: =?us-ascii?q?A0AwBACtMltn/4//Ja1aHgEBCxIMQCWBIwuBclIHdoEci?=
 =?us-ascii?q?GkDhS2IdYV6jFUciy2Bfg8BAQENAjkLBAEBhQcCimsCJjUIDgECBAEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThXsNhlsBAQEDEig/EAIBCBgeE?=
 =?us-ascii?q?BAhJQIEDgUigmCCZAMBEKMvAYFAAooreIE0gQHgGgaBSIhOAYVrhHcnG4FJR?=
 =?us-ascii?q?IQ/PoJKgXmGRASCPIMXg0mJdJMaUnscA1khEQFLCjUMOXAgLAODGoFbBTcKg?=
 =?us-ascii?q?waBNDcCDQKCRXIfh2SBC4Neg0SBFoFrhDiCGYFXHUADeD03FBsGnQRHg3eBJ?=
 =?us-ascii?q?CCBJcc+CoQajBeWDao+iAmQco4Cmn4CBAIEBQIPAQEGgWkBOYFZcBWDIxFAG?=
 =?us-ascii?q?Q+XL7wYgTQCBwsBAQMJkW4BAQ?=
IronPort-PHdr: A9a23:qXafdxxOgIhOGxTXCzPsngc9DxPP853uNQITr50/hK0LL+Ko/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:sphJMKhkaiXYSCfDkdc0TZkBX161PBEKZh0ujC45NGQN5FlHY01je
 htvXT+PP/mDZWCme95waonjoUICuJaAmINkHQts/C8zHyNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOCn9SQkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZSFULOZ82QsaD5NsfvZ8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUa1OtvOFNcz
 sZGLQwzVE3d38i85JuCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgx/5JEWxI9EglHzejtZpVaKrII84nPYy0p6172F3N/9II3XHpUPwBvFz
 o7A13bLJSsxd+yc8wqE2ym3t+rzzBjJWo1HQdVU8dYv2jV/3Fc7EBkfSVW8u/z8hlS/Rd9Fb
 lxEpAIwoqUosk+mVN/wW1u/unHsg/IHc8BbH+t/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBPRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:3h4m2KsMezPRnqsLaWvByI7z7skCMIAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tLxGHdySSVxfJZnPrfKlrbamPDH49mpO
 tdmsdFeafN5DRB/KLHCUyDYqkdKbq8geGVbIXlvgpQpGhRAskKgXYae2Om+w9NNXV77PECZe
 OhD7981kGdkAMsH7yG7xc+Lo/+juyOvqjLJTQBABkq4hSPizSH1J7WeiLz4j4uFxl07fMH62
 bqryzVj5/Pjxi88HDh/l6Wy64TtMrqy9NFCsDJoNMSMC/QhgGhY5kkc6GevRguydvfq2oCoZ
 3pmVMNLs5z43TeciWeuh32wTTt1z4o9jvL1UKYu33+usb0LQhKSfapxLgpNycx2XBQ++2U45
 g7mV5xcKAnVC8oqR6No+QgkSsaznZc70BSytL7xEYvIbf2IIUh3rD3unklUKvp2EnBmd0a+C
 4ENrCH2N9GNVyddHzXpW9p3ZilWWkyBA6PRgwYttWSyCU+pgEz86I0/r1Xop47zuN0d7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUPhvAQOBl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P0bjE9eH0pFH+g3EBG+9QTPuwMdD4IURgMy3eJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR+TuKGP/cLw5qTEWm6MiXkX2fPdlzurTAWj+0P4jAreaw9DmTA==
X-Talos-CUID: 9a23:Pif8pW70uJF/qIQVOtss9mAZAvkXYEbnknLsHXXlVz5DQpm8cArF
X-Talos-MUID: 9a23:QiMOggbdZDyUEeBTpQ3LvhohBMRS06WHU1s8lKlXgPuGOnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Dec 2024 19:02:44 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id A4C6718000268
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Dec 2024 19:02:44 +0000 (GMT)
X-CSE-ConnectionGUID: jBeeH3s5TTSaUiphwbJz0g==
X-CSE-MsgGUID: UNjmuTljQPyj8ps75bITFQ==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.12,229,1728950400"; 
   d="scan'208";a="20389318"
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Dec 2024 19:02:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGTHXuZSAjHyraC12PV53Rt+4Yc4vRA94wYyMHmEAfYOj+lUc2260DKLexdzncta+36UuUqiWK82MZFf03X7MX5p4gWRGSH7o7CZYP6N81vdKup5/vx3C/jcRDZEL9dq3Ee/ETEsIf2bgxISssyvVthWtM2dcPpsPNg9cWNbASNpZWiGwKYgC/8IclpFfWPd1wQmiswtOLT7RjP+ewWi648eISEZhU4qfidTg/puSkHOs6NJYBx1OGyN4fsye1bG7YgdibZD1q3WAK21xiZlpwMCkpa7UIxqxnhmbKT1B2y+Rfy+w6Zv2GAr8hwlY+0umqC+H/ziYbsWd2wEokOhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xv0svEJntNQwmgK544jYEqGoiRv82EIGJj2WgbDjPPI=;
 b=zGvUhEUWUf319duCa+CukGh3Z7yBXD2rfqrWJMiACjO3d9oq1GDgQfr0QOmrmHp9675PPSjQrktRo+IwEQedljm35vjSVSd30E2IWg4Y0nAJNON9CpUAbeIUVRi7c+ltNOLKxfDz+gyCScBin5XCqugJirPVdEc4SRw+vj5eUb0zRbzpv7rxwWi8Tz1MV61DxCUKooeSBeLwhVj1AeLcVDrN3NIErD50Xk6D+YrjlSXIh+b1CTE0UgP8dJjvwgFdRKtv76a1ZbJoiGF4+lGEh0sD2rxiv+8hpbXYyqN5avYcnIFUfF+2aj/YNXaAIyy4Mof3P/npMObYewrxi4vkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Thu, 12 Dec
 2024 19:02:41 +0000
Received: from CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da]) by CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da%6]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 19:02:40 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v4 0/4] p2sb: Fix unexpected P2SB device disappearance
Thread-Topic: [PATCH v4 0/4] p2sb: Fix unexpected P2SB device disappearance
Thread-Index: AQHbTMhqU+2wzm9T+U26dd/Ja6m/zA==
Date: Thu, 12 Dec 2024 19:02:40 +0000
Message-ID: <Z1szUM+7hLazu4f7@goliath>
References: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
In-Reply-To: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8775:EE_|SN7PR11MB8027:EE_
x-ms-office365-filtering-correlation-id: 5cb82c94-e615-4700-ef87-08dd1adf8d4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CGiaw3Bt4YDd5UkyqzuayK+csQdzn9SQwJGWt33Gg37wCXLg9uRO/JbVOegL?=
 =?us-ascii?Q?WGMsXaU+9RQXrSm4Jmf0xxUyfqj/OhybJtvj4CmDaOYfjc0XHi2OtJa1e9Zo?=
 =?us-ascii?Q?7aP5oQzNADnrmfnqGYyQdP+1Zt6veis7GZgFsecwr4/e5zKmdAOTvnGFHGJb?=
 =?us-ascii?Q?Hu757c50Qo2+VRh2FofrCeMBlwykca6CkvtmrxmuJNNdIQ9waquv7YRXvyKa?=
 =?us-ascii?Q?95LMYkCY/AMvfa9IGNz6sjy3Q033Rt2+xu56yKZEsvA8C/Dt0hNSYPVkLb4W?=
 =?us-ascii?Q?CA3GTipKSn8Xph3kfCnuqRlpujk4+mDOjafykig6Hsw22I7ZjwUjE53Ql1xK?=
 =?us-ascii?Q?guarQlxt9INrjGgseyVxb1T5XVLKaQOLm0KJMAA/xeB9r3zs+tk6TFCS+wUH?=
 =?us-ascii?Q?mefOCEFNav2gg/2rz3MJPwAel0xTDZV+afF0t3W5kml6fV9oZ6wd40V6SQL6?=
 =?us-ascii?Q?8EFKNCkhWSYY5L5Sl26/r3SIR66eyibRd06QAt85B/PPRifUlMsCSO4dBMDk?=
 =?us-ascii?Q?ztb6IID98l1wk8ZkBmaQe1+NCE/83sDYdDg7JWJZ5x1PjPPvo4q1OqJL7Otr?=
 =?us-ascii?Q?KdAFAhc5EwT7uqdOgZ/iale3xZgPN209jmz+sJgsbCpZyU5cMxHggFoPFGgN?=
 =?us-ascii?Q?X/teL9oRv2V4xNZgT/Bij7u20ofSacAnRpNzeOtc2IhUnfNddfSVsdg8NG0z?=
 =?us-ascii?Q?MJWUtsRu6UrpXTzTRmMV7snGrH1SgoADeSE/lle1i8+hb5VEdKCsBazVJ4tI?=
 =?us-ascii?Q?NTQPygT7jWji2ZZ2y53fObG5DK0Xtne97VwoUcxheCp+/pINjljfEraBZhU2?=
 =?us-ascii?Q?YbOzaoFF++uqai601W9NVooyJQDDwStEXoh3iZVoAnhpMMYEWeW2NMza8oZF?=
 =?us-ascii?Q?oeuwX6oGenpfP3yEo4ZfPzUph2YxHkzvM1VKYURaNlPxBqDGqqns78M9d9oX?=
 =?us-ascii?Q?dCEZirEgi+Lqb2G5XDEPf1+/8MxUGxXFpt411LCIqigN4cyOMNLKL5lirU/Q?=
 =?us-ascii?Q?l7yS+GwTCbP1UdEjKe1TGo285xXpHzDIMvj0247MsPP7gLfasE+QKM62ICOg?=
 =?us-ascii?Q?ABPiLGR86otQc337+jGgZTE16KlURgpddQXdZSKbs3RFeY6W8xhepks7B4Z1?=
 =?us-ascii?Q?wpuJVL3tR+4EjFRk3usVoe8DDJJnbl61BkvB2btLTsl1iRrpnpd2UIXYg+wp?=
 =?us-ascii?Q?DhwDPzFqaWBQK+pKOH/zXmzqgk6U9pFq9YlM6SdyeUsGwnX7fjaPImTSCUvx?=
 =?us-ascii?Q?YLSnOhwLBOTGnAwCWfoNLvRMzJYTjAoPL5hOR05dBb12RCZYMjrDHrMhYu0C?=
 =?us-ascii?Q?qrFQtJjq0cn32V5yuKl00fBt6LmuET4rsVIYHTO1vHlPB44ccm0ofecb36qp?=
 =?us-ascii?Q?ZGVpmwMsMUiraJQ1B1WHR7GCAlxpoAKDGpCwnMr5tJQKaCdTRA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?09zNUGa2gCuSQKr0UVbVigm4uQZ8iab8Y1aMZ5gzH/L8XD1FWsa6DU9MwMqp?=
 =?us-ascii?Q?ZOkHa2/3McUwrqK6JT1ZF8Y4ishguJd3kWx5GVStdNz2akTILOyxejj8nhIP?=
 =?us-ascii?Q?0BFXlISGJ+ZbsbECxu5NvjmPB/NQ9UxI1IBVmhPcSZjyIwg40W8L6gwvQSex?=
 =?us-ascii?Q?rUXGrvOBpbUXoAsZ3FREWoRSc5pUvaKbYQIid0BZtu9WatyYggetLBNp5o3D?=
 =?us-ascii?Q?NvTuV4HsLGH0thAhTwdoLWvKpWNSM9k1LQBMH/Au9aFAYqkVoEJJXpVaXfUK?=
 =?us-ascii?Q?G86S4UDGhK+fMnus1Zw09oXY4YQq7OhzBY/TSU/OMdu6Knnw6zx0MpGILcMc?=
 =?us-ascii?Q?mBc/5ZjqDSGlB595rFJUepp6seOD09BTiqDPD/Zlfs934OgcHUv5ixGLLzG9?=
 =?us-ascii?Q?ni2mSf5490m8KQ+leoI4WI2xpiYYZUJqqsd1b7tFgbXG8GCXu2hson0Ivuw9?=
 =?us-ascii?Q?EVi54pOQbgUl8fU6cXHDE+KyHdESJzSyIYR2QZVEfiiLzo5n+7dPTON7+hVr?=
 =?us-ascii?Q?MBti0d+MFNbesns8ldWFzr8hhr8k5lgqtQCokcbotzRujOco+hJhQHeUqidS?=
 =?us-ascii?Q?tWeLV+01yWRqeWlgmnHR7xTMVTzZsHDdeavEFUCUosMh3m5Qu5I2ZEAyY3UD?=
 =?us-ascii?Q?zd4rLq9UvRH4L6tcxBkHWORaeslTAazus1We9acCP5nuohCxN/nt6hH3q5sw?=
 =?us-ascii?Q?7PQFPp+Csop/R5NL3GBlyNOqlrUM0nNcb4sidGO/neEpHNYPlwHYAYyicj6r?=
 =?us-ascii?Q?wtt/s5SjthafQUfIwOpe8gALNjrP0675havRLcLWIg7hNxtQzNJNi/K6qg2B?=
 =?us-ascii?Q?VGULEgrP8ZuAsmO+TEU1VI4rrrF+urrePZMG/KadANOmyH9ocTj7YIdNx4Kx?=
 =?us-ascii?Q?zsgk5wnkDLtJGhA/jTl20mtFae+MMTdyAY97iu6WZFe64EA5KWCOyTKbxWMu?=
 =?us-ascii?Q?99HE2ddoojmRn8CnIWSIcjPIti+ayFcN8+TPYxKa+9iOcFlAIKdCWrYwlZ3W?=
 =?us-ascii?Q?bHpmpT96Dxmu6RClcVoQ68ZvmbWF9RNsTkD0RYDgG51tXqC1h3nbxLLDqquP?=
 =?us-ascii?Q?Jwzd0FwLbU0ZYEMsvZZrakgTffi4i7nhE76sbNShLe1t0O+E0qX5oWWbbDbI?=
 =?us-ascii?Q?ZpnK/CpsM+UkohoF6DnfPjxxFOuE7+qTJYyGh3ToveLRyB40PCBSIZtYeBxu?=
 =?us-ascii?Q?9DXrbYaJbhQpkvJ5lxz0maX4GYVEe96ni5ZHbfXTdoz6l9u64NszqwFrcFEF?=
 =?us-ascii?Q?jOjb+bGWXsRmC83RWVGC2BlDLrs2dOIgoLKE5GLRcfDHDiY0r/YWAZ5XGre8?=
 =?us-ascii?Q?qNjgh8wLle9QeLA9xXxd3Qrzm1FJ8dKb+a8jxq3QY8uHEgLIBxgZOVwtsA2h?=
 =?us-ascii?Q?hwBnut31WUxlfsVQ1YIXKOixch4ajgAKluVVDKdNh4I1yy2qj4J+xhZIUbOc?=
 =?us-ascii?Q?W9jdi89c9KGwoF+uZFil9LVgnS0ujch+Tf07MNVTjYFo36i++3zNmlMQl+uV?=
 =?us-ascii?Q?fJqdvti4W+ze4ZDpbKrm5L59Gp1Hp8F3Q+3hGxTxxBz0jxKJ3JBZOpZB7T4c?=
 =?us-ascii?Q?n1u5Rg55TDBuSYmI0HyVTH2k22+zvvNWwqiUK3vj?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <03ABA456DE33B544BB239C2C43B08EF5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8775.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb82c94-e615-4700-ef87-08dd1adf8d4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 19:02:40.6722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PbIaBMmyH2m38Q0j0mmFfmTlNAaQGRibPokEqJfHrRkbY1zvCJEHyrKB2UkwLx9dZbh1w4Zkd+3xzlY+KPZWHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com

On Thu, Nov 28, 2024 at 09:28:32AM +0900, Shin'ichiro Kawasaki wrote:
> When the BIOS does not hide the P2SB device, it is expected to be visible=
 from
> userspace. However, the P2SB device disappears since the commit 5913320eb=
0b3
> ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe") [1=
]. This
> series addresses the problem. The first three patches are preliminary
> refactoring for the fix. The last patch resolves the issue by caching the=
 P2SB
> device resources only if the BIOS hides the P2SB device.
>=20
> [1] https://lore.kernel.org/lkml/ZzTI+biIUTvFT6NC@goliath/
>=20

I tested the complete series and it restores the previously hidden device. =
In
other words it's working for me.

Daniel=
