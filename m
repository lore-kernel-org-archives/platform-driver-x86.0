Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B951F1921
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Sep 2025 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758180531; cv=fail; b=im90CBLJmoT5mLqPgjQ9x257Qqus0QMK5Y3ZTh0jZ6NBjsz2c9p83UZKmsKFi/cfrOWay1XzKwv+fvlEYUKoR86pjsiSckAbg5XPYnxL//89cfS+C9lwcAcSHZ2YPNSQju+O0yAOAuhAZ1xanId6J+nlPxDCf7kTkSSBbvE0SlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758180531; c=relaxed/simple;
	bh=X/nHfkl2JHvkaypWOjmq8O4oOFXkQ23xf3Zu6pWq6Lk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FcHBa91ZeeS5FjUu1gdyOSqRVYgBJa64E0/8MUJ3l3ku1Yp9Lr4VgJxjDrq8miz2sAKnBGig4b1xN79ixNzdMb0tIIYY8Pxb3pftJssYxOKHu0oq+1ePVJAtaAppP0IO62SzXzmuy3dU1OhuIhWuGcV/962ByBzDBBtRV+jiflw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=N49UlObB; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="N49UlObB"
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3XSB3015342;
	Thu, 18 Sep 2025 02:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=t
	cKTyHDMJTm8gpakJAT+h60OxB0J4uoMVrRapPaB7yc=; b=N49UlObBAtjDEVOfu
	LPjT5ZYD+x8LNKOczhr1dhe+07s4nE9kbguhUh49LMHVLhCeJlxlKEj8o5D1VgYW
	u8D9UY3kq9E2KgdvrfB++6CjmYUeI+b30U7JKrJKmgKdcHx5iGp0dxzn6FQGWfW5
	bkR1GQyzdad+W32IGtqsRujzzvaMUXRJ+8V/vF9EPV7mlTpVtGhH8fY8wuevVDqu
	Q6o4mkC+VHn1Q0TDj3kqcszVNNoXKmUqxnUQ6J7TZIByxjlpHM7p6bK3ShILhKGb
	DVurVHleBCdSob7BHN/hvrliApggvisA8NaNI8wsW3rmtAw4JJtxsfrySVO9p1h3
	ELK6Q==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 497g007y8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 02:50:14 -0400 (EDT)
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I0kNRp029972;
	Thu, 18 Sep 2025 02:50:14 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 4987tykfc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 02:50:14 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPQ36v4LYrhVFyfpRxZ/8F3V4CfBDaxigl+P1b6Zv7lviCOP7xy7Z0GqDPTM4aPt0Dof+Tro/nPzqtfNjRa7zwWEeG5r031ddLwV2CTmP2kukti+e85V5GTmLbyR1Ke4XPaqvmbiMzOESYk4KrU7p1WH9wxsYcU2hFnQMQdCHCSxoM4YjgX2mEPOsh82C/3uAesBf/nS9uZjJOvtEVIcB0ua81lfKbqDVyPtvkCLMSsZIcG9NZFyjMr2bkwDAbTKqqMT4jgIT/tolNzhwUwWXe/pSPGrQJdchWDeUNK7TPkxL/P3o9n14/sbb2qWCT8xqWIsVNxTHazCyIXzI+S8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcKTyHDMJTm8gpakJAT+h60OxB0J4uoMVrRapPaB7yc=;
 b=CNgPGN+NgytuZrW9po6o5W/i7TvPRXbXCn8lCTzGqdQnfpiEKvL8YUa2jkI5RIY+VgmnlkHqJa2MZXV8uQzOrRIvA5JqnD49J37VNQ50wYr+q++bNlLxo5H0E8kTGcmzFZLDcBJaIE+Ufgu48ksfRJENAwx9HtBjcrFY7gKyfsyr7f1uL4GXNTXaV4P1CRFbV/JhsPjs9C2YGspB2AFb++6cCA+MgAnM38hAEVLBbY9R3VICsYOcgVIbHHawR6/BHzf8sbyiKP+jlMEZIbBTih7DTQu8C0QSYnKro1H5FRkPxuglDSdzpOz3Sp8JgEkl5vsnDDqNL1HAOfRLTrk9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23)
 by BY5PR19MB3955.namprd19.prod.outlook.com (2603:10b6:a03:21a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:50:09 +0000
Received: from BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5]) by BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:50:09 +0000
From: "Shen, Yijun" <Yijun.Shen@dell.com>
To: Lyndon Sanche <lsanche@lyndeno.ca>,
        Mario Limonciello
	<superm1@kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de
 Goede <hdegoede@redhat.com>,
        =?utf-7?B?SWxwbyBKK0FPUS1ydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>,
        Patil Rajesh <Patil.Reddy@amd.com>
Subject: RE: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS
 after reboot
Thread-Topic: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS
 after reboot
Thread-Index: AQHcJwBczQvojMmKFUCSdCpWDgSdhLSVygoAgABT1YCAAlyI8A==
Date: Thu, 18 Sep 2025 06:50:09 +0000
Message-ID:
 <BY5PR19MB3922A94D7DE90B27B1013826EB16A@BY5PR19MB3922.namprd19.prod.outlook.com>
References: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com>
 <907c1952-5aea-42f3-9a13-71e2044d406e@kernel.org>
 <caf582a4-ae29-475e-b321-fa255b6f9379@app.fastmail.com>
In-Reply-To: <caf582a4-ae29-475e-b321-fa255b6f9379@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=True;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2025-09-18T06:19:35.0000000Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=3;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR19MB3922:EE_|BY5PR19MB3955:EE_
x-ms-office365-filtering-correlation-id: a57188da-97b2-4cae-b0ef-08ddf67f9c24
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-7?B?QUtaWE5nM2hSTzZBeENuNk9hbFpwZVVmWlJnQTJRN090T01QelFya01Dbm1W?=
 =?utf-7?B?ZkdhTSstVjhObFBLajAveXFaanBUOCstUWpFYU5SaVFQQ2xJZjNYOGdaNHNO?=
 =?utf-7?B?RWl3cm9KSEVObFpidnBMTC80RFpuUXRIeSstTFNLMXRURWRtNEF1NFdac0xj?=
 =?utf-7?B?Y0hEOVlYWlRKYUFCRkc0bWRNbGE5NlpJSW9lZG9qVDBqZystc2NkQ01nTlFT?=
 =?utf-7?B?ZjBCdU1wbjQ0VTd1cDZjdWs0ZEI1cWZYWDMwWDI5MzhEKy15eHNrY2dtNk44?=
 =?utf-7?B?aHcvQ1ZYYystM29XUzRkVXZrM01xVWNUVnlQOE5HaGtkeE9POTdRYUM2TWdq?=
 =?utf-7?B?Ykd3RkVtSistckZ1Z3FQWUdzQi9reFAzYjczdUxTMkZldzg3UzE2UnMyS1Ju?=
 =?utf-7?B?M2tzVlRLSnplZURrNCstTk9zL0RLUGl4bnBOdDhrVDV5dmFHcUxhR1VpOUxx?=
 =?utf-7?B?VUtoQndCMGw5Ky1yNVg3aENGamszRDhVVzh5YlBENnNHVTc4anpBQnVHQXhJ?=
 =?utf-7?B?MnpERjRtcW5iTXlGYmNEVG03YjVsaUlUcGo2alpJUmw3aTY5ZXJwbzNrZFFw?=
 =?utf-7?B?eWJ5NXlvZWZUZ29Md3p0cWlSRXl1ZGFFandZakN5V2FsOHV3OWNoVDFYUXVz?=
 =?utf-7?B?ZzRacDNFWW8yd0djYWdOejFIZ3pDNistTXRsaHBPUmlubUdwZ0MrLW1FMkI=?=
 =?utf-7?B?dCstVTlzS2JPZXJycXh2OXZNKy1UR3hCSEo2ZmNRWnlnMEJoQXdyTC9OQTNk?=
 =?utf-7?B?a2piOWZ5M01lNGtXV2RLQzBNRFAwTW1MYmoxTjJ5ODZPVEg5NEVqR3FLOHZE?=
 =?utf-7?B?ZW5hRFRmb1ppRXJqQTAzbGdURDV2YXF2eEZES2d3eFRzM21qSGNzQTNIUzhu?=
 =?utf-7?B?SWVLZGQ3ZmNNM05QKy1HanVybHBZaDFuR3N3aExyMW5GbGMwN0pRVW1ISist?=
 =?utf-7?B?MUJNVzVDb3V5R1hBb1hJMFk4TFRLRDJBYkUrLTVBd1o3VXpvMEpxanZ4cTFI?=
 =?utf-7?B?MnVUN3pTT01TT0pQOEpNTmdGcmVHUlBHZktvMkRYbEM2UDlIZ0daOUFBMXVI?=
 =?utf-7?B?Wi9KU04vaDVsVTFuVVJjZnNyM1JoREdtWEMxMmxRaTMvNXAvSVZrTHZRbGYv?=
 =?utf-7?B?NjlYdUtGZXlHWHRDdVV5OFIwVkRsQnRvUWNOb1EzMlU4ampZc1FMQ0ZCYTNY?=
 =?utf-7?B?a0tDL2lyOWkxbCstejNaOGt5ejlKd2JCekh4T0t2cjdmSCstVERkTlNvelRL?=
 =?utf-7?B?cXRmKy1vZkp0ZlhSQTBGOE9IYzdOT0tScjhGOEZUSkhDSUM0QkJJZGk2V3E3?=
 =?utf-7?B?dHNncmFFLzd3RmpDZWdsS3NHZkp1THN5V1pZWVV1Y1hwemdKUjlwcmZCNEk1?=
 =?utf-7?B?OTY2dVhieFpNMGo5bVJ1WG1SaEVGY1FBQTRJMmgvVTl0eDhXenhjKy1nOEdt?=
 =?utf-7?B?VnpxSEg5ZjNIOFgwQUNNRDkvR24rLS9qeXlVcGhHakt5dWY1QUt2bHpFWEJE?=
 =?utf-7?B?VFZnNXpzNERJUFdKMmZkOW9kYXRZWTRmak5VU04xVG55cXAvSistKy1mTG8x?=
 =?utf-7?B?d0JEczdQWTBBZnlXMXJ0WjF4YistQXRQY0ZWWklWZUZoaXdMdzg4QS82d1dj?=
 =?utf-7?B?bGZPY21qMEplYXM0Q1BFRHlURXo0SFlYOEt1RXZ6ODFpRmR4MENSZFhrbVFr?=
 =?utf-7?B?SVNibzFrYjhxUm16RHZ0Q0lZZmxGNVA4Uzc4Ujd0dVpYbjVoaGpEWDNPUlpU?=
 =?utf-7?B?NkFtMXV0eVZaMjZvSlYwOTcrLVhQdXZkNXlWZTV6Y1R5T0JUcFQyaGFWWW1m?=
 =?utf-7?B?TDYrLUdyTUJKU1I4YmFSNjlEWEJ4R2oyTlRaVkVvbU1CcllDVU1Xa1lvQkFK?=
 =?utf-7?B?RmVGQXNxR1BlbGpxd1QxbFhTdEZPeTIzVkljNDgyWEs1VDR4L1JVN3BDR0ps?=
 =?utf-7?B?a1BQNDZLRHozbzA4RlFWNUQ2ZVJBMWV0SWpOWWxWL0FGTXEyRU5pWkl0UElq?=
 =?utf-7?B?NElnR2NmZkR3cUc0Q0hEZHpzekxQaTIvbXdsNlNUamdrMFJBK0FEMEFQUS0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3922.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?WFMzS0NWOUZTTXBIMFcxSXpXT29LS1NBZVNkUmVLa0l4VHVrQ0NMYSstKy1p?=
 =?utf-7?B?Vk04a28wSks3aVpoOUt0NHV6TGJlTlNoeEtUNW5OcDFzdDJjblRFNlkzQVJo?=
 =?utf-7?B?WWE3OGg5Q2hJdUVlczRmVDJoWmN2dnY0WnJwYSstUWRmbTAvQmhZVjdmSjU=?=
 =?utf-7?B?Ky1pNTBLNGpDWVlpbFh0WWFoM0h6YUpjekFtbE8vVkgyRHNPSGxwMWhacEM4?=
 =?utf-7?B?UDgwcFF6Ky01NDF1Wk4yT052QmRicURYUjdQU091TjFsUFlqTistanRoVFh5?=
 =?utf-7?B?SGd0bWpMS3NQRXRwdkVObGZKQmZUYVByZUgydml6T3JZcExkRzdGRndFNE0z?=
 =?utf-7?B?b3prZ2lMdVhqSW9VRHFRNHJEbi9MaE5RNGQ0Ky1sMlY1NnM5YWRNTkEzYjZH?=
 =?utf-7?B?QystT2NLVzZRUFg5MTVlYWdXbTNTZUFxQUw4cFlwUFhhcWYxRGRXaVFoc1RI?=
 =?utf-7?B?R1BObHluVFJqaDVXS3NENjkvdlIwQnNEdWJVZThFdmpPeWtKNExGcVE0SUEz?=
 =?utf-7?B?Qzh4eERzbGUxWE5MRWNEajBJSFJsT212ajVKV2REZDZabXVtUnBqR0MyMFhR?=
 =?utf-7?B?VWJrN1hSKy0zY0RUalQrLUxEU0VlS25CM3RyY2lVckQ5S09lSkltT0dxSW9T?=
 =?utf-7?B?VGE5UzViQ0VpemxvSEpPbC9JckpPdUV2OHpDaUEyZHZWMmRBOTlqa2tjWWtw?=
 =?utf-7?B?MkJocmNKcCstS0JEbHE3MzY2c1lHL0p0VE9rOXZHcmZYQUl6d2JWNnNqS2tX?=
 =?utf-7?B?ZjBCU2N4NHhESGwvNGpCa2NlWU0yYVlZY0VET2NPTVFQSXQ1OVl5WXJ4L2Fh?=
 =?utf-7?B?SS9KUEtQbFZVRFB0azhWTms0Y2FVcTJTVWFyZjVhQVVpbGZpWE9lek0vQjRj?=
 =?utf-7?B?WExuMndRbXZYUnNoRjZTWXNwUnhXMm5LM2szbUJVS1BBNVlUY1R2aUhhME5t?=
 =?utf-7?B?WmJUaUhqRkJ0YVJnaERtUzBpWnFsNHhWOXF4eVRnNjNEckJ3SERHdklNRUpI?=
 =?utf-7?B?b0FGKy1qNHZjMjFTUzFNQTJQaTdST0o2ZGFROWhDVmpVc0ZiZm9jNy9ZR1h4?=
 =?utf-7?B?ZlRoRE9OQldzSUs4VTc2cVloSUg4QjJ0dmhzdWNVaTg3UUM3NWZ0SEk5ZDdD?=
 =?utf-7?B?eU5jY1EvdTBNcjZlazJlUFZVTWtmQXVzQjA2MkcwNC9CeGtZdURPYm1rcVk4?=
 =?utf-7?B?WEhOYXRtZFN1VzFicnRhdUZoamhKR3RNYmcvNjRNajJlcmpNbSstUU1MdERx?=
 =?utf-7?B?VTVyblh4em1UTHVOZ0V2V0JscjFVMkVVbXN6ZU1Fa2piUUlKbzlGYXRDOUxq?=
 =?utf-7?B?UkQ5MVorLU9kVjN3Ynl0N1RhVWs1dWJmell5ZzdhY0JaRFdoVE9xdWxFTm10?=
 =?utf-7?B?VDhGZHhVNGdkc2JSNDFLOHF4YVRJNjNueDN2Z3gxNXBuN3ZLdDgwcThqYTJi?=
 =?utf-7?B?dFA1Vmcvb01jTkV2aDZzNHI0bnd0V01QVjI0Q3Q2VCstUkIyRDhycXFFWll4?=
 =?utf-7?B?Yk1ydWZhZTlmVlp6dGhpbjBCOHhzYlN6czJ6bU56ZistSktMUDNvTTBKMjNM?=
 =?utf-7?B?QmNERjdwKy1PSUovV2VVVXRlcmF2MnZmWS9CeHdvcjVxL0puMzVqUFp4NG1m?=
 =?utf-7?B?ZHQ1YlZtbTFUcnRPSkx6dHZEaFJEeHM5Um83Um5IWTZlS2JqOEhndmFpbHEz?=
 =?utf-7?B?ZSstdlBncTZKSnIvcjhRKy05YjgyZmE2amhwcWFIOG9INTNRVEMwRlphd29p?=
 =?utf-7?B?TnhMVlNrbG5ZWmFmY1ZQVnZla0I1YzlEOFJXanNqN05MejdHS1lWUC9TMmRT?=
 =?utf-7?B?aXQvNVRjMTQ2VzROLzkrLUpFZ2pkVlhLV1RXUkJ2NEdkOS9MNm9UeTNsSkZE?=
 =?utf-7?B?TXRWdjJMcXBrSzhSUSstNjkzcDdpeW9NKy1ZNUtDR0o3aWdWWFJReXBpT1BS?=
 =?utf-7?B?a2V6MGRhdkVWT3BISmp2SistMkRMVG1BdlZGMnRBdnVIVmY2SENwRmVZNEo0?=
 =?utf-7?B?T0ZkaDRLZ1BLQU5DSWNQRnZZYzZFc2Fib2FIcnFibWZSUmJpWWZUZ3RHbEJT?=
 =?utf-7?B?dzVCNkFhdHgxZnloOW1tOGtFNWlWRk54MllYd294U1NHcGFDOGcyRzNqbVdK?=
 =?utf-7?B?U0Z2NHBUczl2UkJMcmFUMjFjaHR6UDNLQlVmcTN4WmtHeHRuYmE2QnV1VmIy?=
 =?utf-7?B?N0p4bw==?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR19MB3922.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57188da-97b2-4cae-b0ef-08ddf67f9c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 06:50:09.6881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qABpt5LfZyrt0q5zp4qxBXq0rDl+Ezmqg74/so/5X3iN77m9e9N5wbTTBzSngHwrb8bUk/F9ttYrMFGuuCcIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1011
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180004
X-Authority-Analysis: v=2.4 cv=W5E4VQWk c=1 sm=1 tr=0 ts=68cbaba6 cx=c_pps
 a=j0++y401J6f/BxNAf5EDow==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=YU3QZWNX-B8A:10 a=yJojWOMRYYMA:10 a=oWj2KQjyAAAA:8 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=iLNU1ar6AAAA:8
 a=e29MqqRwAAAA:8 a=c1PdSmG1AAAA:8 a=sS_K4Su9AAAA:8 a=XlRjxQ70AAAA:8
 a=LfxEVeEBAAAA:8 a=_k7-W3hV7nE6MkL98aUA:9 a=avxi3fN6y70A:10
 a=gbU3OgOOxF9bX48Letew:22 a=2Ic52O4GNRKgeCDJ-qrO:22 a=0AydyYPew0v0dyLmsw-r:22
 a=4iM0TfZbaBQr0p37pvCp:22 a=QaANnTo53oYaUAiVOp1Z:22 a=1uMOUU2w0DxzEe95gQqD:22
 a=7k9nRlTqVbDGZ3p5_T00:22
X-Proofpoint-GUID: WjX7M2cCxg4VJHLVvtjMnnqw3SOpN8Hc
X-Proofpoint-ORIG-GUID: WjX7M2cCxg4VJHLVvtjMnnqw3SOpN8Hc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+js4e8qC/sLQ
 MP19An4EGFDVXb6WRWGOLNijIz80MnJGbvU06u+EQ4D1kUNICu1AyeVoxV74KOVhUBxejtp2MZp
 Pz47fal4Bk/mfJEt/7npadmSRplV8viPXi19xh/J1LwH4cYoBy7hjTJhxMS1ZIA3Ee4vG0HtEFA
 kl9YQzu+9M14tSSkSfkB+hKNEw1AlbfBDp0XOg1+us27tqoZTeTezjPGioZbstBDAr+j9M91/iq
 3l+HtDOFHjbYGrwwfFtvmzlAQJumoUVic7xsJoP2GkmvN4a3tLcjg2ld/6jyr/zF2jy3VGWdL4A
 BjXu+zALcGPQTlQdE7elY4k8q/y/sXhCnOeUbXKW0/rVu4P4AcJe/7rNFqbWSZngvNKWw6n45hw
 GsxEU0aU
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202


Internal Use - Confidential
+AD4- -----Original Message-----
+AD4- From: Lyndon Sanche +ADw-lsanche+AEA-lyndeno.ca+AD4-
+AD4- Sent: Wednesday, September 17, 2025 2:16 AM
+AD4- To: Mario Limonciello +ADw-superm1+AEA-kernel.org+AD4AOw- Shyam Sunda=
r S K +ADw-Shyam-
+AD4- sundar.S-k+AEA-amd.com+AD4AOw- Hans de Goede +ADw-hdegoede+AEA-redhat=
.com+AD4AOw- Ilpo
+AD4- J+AOQ-rvinen +ADw-ilpo.jarvinen+AEA-linux.intel.com+AD4-
+AD4- Cc: platform-driver-x86+AEA-vger.kernel.org+ADs- Patil Rajesh
+AD4- +ADw-Patil.Reddy+AEA-amd.com+AD4AOw- Shen, Yijun +ADw-Yijun.Shen+AEA-=
dell.com+AD4-
+AD4- Subject: Re: +AFs-PATCH v2+AF0- platform/x86/dell: Set USTT mode acco=
rding to BIOS
+AD4- after reboot
+AD4-
+AD4-
+AD4- +AFs-EXTERNAL EMAIL+AF0-
+AD4-
+AD4- On Tue, Sep 16, 2025, at 7:15 AM, Mario Limonciello wrote:
+AD4- +AD4- On 9/16/25 6:51 AM, Shyam Sundar S K wrote:
+AD4- +AD4APg- After a reboot, if the user changes the thermal setting in t=
he BIOS,
+AD4- +AD4APg- the BIOS applies this change. However, the current +AGA-dell=
-pc+AGA- driver
+AD4- +AD4APg- does not recognize the updated USTT value, resulting in inco=
nsistent
+AD4- +AD4APg- thermal profiles between Windows and Linux.
+AD4- +AD4APg-
+AD4- +AD4APg- To ensure alignment with Windows behavior, read the current =
USTT
+AD4- +AD4APg- settings during driver initialization and update the dell-pc=
 USTT
+AD4- +AD4APg- profile accordingly whenever a change is detected.
+AD4- +AD4APg-
+AD4- +AD4APg- Cc: Yijun Shen +ADw-Yijun.Shen+AEA-Dell.com+AD4-
+AD4- +AD4APg- Co-developed-by: Patil Rajesh Reddy +ADw-Patil.Reddy+AEA-amd=
.com+AD4-
+AD4- +AD4APg- Signed-off-by: Patil Rajesh Reddy +ADw-Patil.Reddy+AEA-amd.c=
om+AD4-
+AD4- +AD4APg- Signed-off-by: Shyam Sundar S K +ADw-Shyam-sundar.S-k+AEA-am=
d.com+AD4-
+AD4- +AD4- Reviewed-by: Mario Limonciello (AMD) +ADw-superm1+AEA-kernel.or=
g+AD4APg- ---

Verified this patch on the issued system.

Tested-By: Yijun Shen +ADw-Yijun.Shen+AEA-Dell.com+AD4-

+AD4- +AD4APg-   drivers/platform/x86/dell/dell-pc.c +AHw- 9 +-+-+-+-+-+-+-=
+-+-
+AD4- +AD4APg-   1 file changed, 9 insertions(+-)
+AD4- +AD4APg-
+AD4- +AD4APg- diff --git a/drivers/platform/x86/dell/dell-pc.c
+AD4- +AD4APg- b/drivers/platform/x86/dell/dell-pc.c
+AD4- +AD4APg- index 48cc7511905a..becdd9aaef29 100644
+AD4- +AD4APg- --- a/drivers/platform/x86/dell/dell-pc.c
+AD4- +AD4APg- +-+-+- b/drivers/platform/x86/dell/dell-pc.c
+AD4- +AD4APg- +AEAAQA- -228,6 +-228,8 +AEAAQA- static int thermal+AF8-plat=
form+AF8-profile+AF8-get(struct
+AD4- +AD4APg- device +ACo-dev,
+AD4- +AD4APg-
+AD4- +AD4APg-   static int thermal+AF8-platform+AF8-profile+AF8-probe(void=
 +ACo-drvdata, unsigned long
+AD4- +ACo-choices)
+AD4- +AD4APg-   +AHs-
+AD4- +AD4APg- +-  int current+AF8-mode+ADs-
+AD4- +AD4APg- +-
+AD4- +AD4APg-    if (supported+AF8-modes +ACY- DELL+AF8-QUIET)
+AD4- +AD4APg-            +AF8AXw-set+AF8-bit(PLATFORM+AF8-PROFILE+AF8-QUIE=
T, choices)+ADs-
+AD4- +AD4APg-    if (supported+AF8-modes +ACY- DELL+AF8-COOL+AF8-BOTTOM) +=
AEAAQA- -237,6 +-239,13
+AD4- +AEAAQA-
+AD4- +AD4APg- static int thermal+AF8-platform+AF8-profile+AF8-probe(void +=
ACo-drvdata, unsigned long
+AD4- +ACo-choices)
+AD4- +AD4APg-    if (supported+AF8-modes +ACY- DELL+AF8-PERFORMANCE)
+AD4- +AD4APg-            +AF8AXw-set+AF8-bit(PLATFORM+AF8-PROFILE+AF8-PERF=
ORMANCE, choices)+ADs-
+AD4- +AD4APg-
+AD4- +AD4APg- +-  /+ACo- Make sure that ACPI is in sync with the profile s=
et by USTT +ACo-/
+AD4- +AD4APg- +-  current+AF8-mode +AD0- thermal+AF8-get+AF8-mode()+ADs-
+AD4- +AD4APg- +-  if (current+AF8-mode +ADw- 0)
+AD4- +AD4APg- +-          return current+AF8-mode+ADs-
+AD4- +AD4APg- +-
+AD4- +AD4APg- +-  thermal+AF8-set+AF8-mode(current+AF8-mode)+ADs-
+AD4- +AD4APg- +-
+AD4- +AD4APg-    return 0+ADs-
+AD4- +AD4APg-   +AH0-
+AD4- +AD4APg-
+AD4-
+AD4- Thank you for this patch.
+AD4-
+AD4- Reviewed-by: Lyndon Sanche +ADw-lsanche+AEA-lyndeno.ca+AD4-
