Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D32F532C
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Sep 2025 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202079; cv=fail; b=b7ZAJ/iVebiSwDuQG9I97NjW/WdIlfl6SszI2AyO21MzOMZdiif87WdeCJWONY+xwTgU2wTNl4BXiZCgeNjY1bPu9JtCrH8h5CT81FVqMuS98ETLTMLHlf5UTJLMP9tLN5NbnN3tnw1+rx/PQ0KKVaDbG2nHArW1EqR/Segfbvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202079; c=relaxed/simple;
	bh=xCcAnFOhSf37KWQSqLyxUahIaY03Qx/MmhC0xjVYwKA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CS0mrrjrtQnrRSOXeTq1ReAh2LwWUucJKHIIXFzH0cBfDb1GBKmY9lh523dcQsfu4SII0oXFfdhdG8XRyDlQYtom7pF2gPTjBPE2GQ7Ibyi1BMnTV0zdnfAr3m6sNyoDzuChQa4ZB3HGe4JIxXelVDGq+YDRINVq2CI/7c5Pi98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=Tb7C/dK1; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="Tb7C/dK1"
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I6RvoT015237;
	Thu, 18 Sep 2025 09:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=x
	CcAnFOhSf37KWQSqLyxUahIaY03Qx/MmhC0xjVYwKA=; b=Tb7C/dK1pBxApEIQV
	5P9bQzsW5+v7jFJIEYcBVtJLSdLjBP/UInOgiXGQ2yzFd5k3PSxCD4Qo78CebNVF
	JnvL8zco5DryjRFp3+Gqec+1WVaVrVDweOUH1e2JU2V+mQlhW0RV5LsJM42P5LIX
	oWjjtg7kjY8LB5kDv2GD1fXaB8oE01qQi0RudNJBOioh33pVzJJyFkgGImDnK/Fs
	ezCYqkyzMhsX4uP4YdkR8rg87fGF7ZkwelOImh8hIG1MOsP7Ba45nR4RU1Y1yb+P
	xp2iaC/bUBZ6yucLs24iVp7c0Fb01/1PhSwtZ3q8MER3KSrHgXL2pk9okY8SBV1b
	g8M4w==
Received: from mx0a-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 497g009pxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 09:27:49 -0400 (EDT)
Received: from pps.filterd (m0089484.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IAOS0v024593;
	Thu, 18 Sep 2025 09:27:48 -0400
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 498ga2am2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 09:27:48 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrXfPhNUb2n5EY+19ZrBmHjl0RkKC3KTRvwnrwqRZvaQX47RH9p/EjEzXAOIK9ZKTV6CEAEfoNGoYHDNT5f/Q2F4Do6GFsDU42crxOKxgwbqcaSN99iraBmOjtaigks4sSvKumd4O5UEdpE9YbWB8gvCV5VpxzqWepZyCTef7zMZ3isSrFrOtwESaWuqkT58hMAfZz7z2lcmdYzy8Xcx0kmHSkynPXjwXV3MC2mGCT80vmJsFZHT8PJrC3+QeiPkbjcOgOvrRkSymmDeQM7NGuAjoStZW6f4xyewujxyC0x2eoJFb6FevsRpkz4SAvCX+WVJdR7jegIyT3e86gpGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCcAnFOhSf37KWQSqLyxUahIaY03Qx/MmhC0xjVYwKA=;
 b=zJ7iyoDo0Q3jmELkTgmFUdCw4MKdK3RJMnTEIqQXtogm4pWH0PP6tGuQor2vRPnWjvlzy8aySSM9BxX5G60+Ie9DpTVlZVK0q1As4H3GNC984YKvejswZZ13nVWvzj9hi5fgRJLZui+lTZZWNwpFXggq13Dkhnwjp2khuoMxCjqeBqxxY09zb+KJ3hKKcYzPvUQhnL33jLo/0BnKYo2LnO8AalbJfttxpcdBlcYLKq1FR0qsXn/pd0tO+cu3PUBkQGDehwMflJByn7bfbnfvFa2oM9WdOrJuaEIp7iZybvVhRf47Oqt0E/GxuniBtVekxahS/9oU/6g0iVh4DQ9MHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23)
 by MW3PR19MB4251.namprd19.prod.outlook.com (2603:10b6:303:4a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 13:27:45 +0000
Received: from BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5]) by BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 13:27:44 +0000
From: "Shen, Yijun" <Yijun.Shen@dell.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Lyndon Sanche <lsanche@lyndeno.ca>,
        Mario Limonciello
	<superm1@kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de
 Goede <hdegoede@redhat.com>,
        "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>,
        Patil Rajesh <Patil.Reddy@amd.com>
Subject: RE: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS
 after reboot
Thread-Topic: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS
 after reboot
Thread-Index: AQHcJwBczQvojMmKFUCSdCpWDgSdhLSVygoAgABT1YCAAlyI8IAATnYAgAAnUMA=
Date: Thu, 18 Sep 2025 13:27:44 +0000
Message-ID:
 <BY5PR19MB3922AB0920F2D4104D6F4495EB16A@BY5PR19MB3922.namprd19.prod.outlook.com>
References: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com>
 <907c1952-5aea-42f3-9a13-71e2044d406e@kernel.org>
 <caf582a4-ae29-475e-b321-fa255b6f9379@app.fastmail.com>
 <BY5PR19MB3922A94D7DE90B27B1013826EB16A@BY5PR19MB3922.namprd19.prod.outlook.com>
 <7ac9b0e5-ac27-b207-5223-ff132909e4ae@linux.intel.com>
In-Reply-To: <7ac9b0e5-ac27-b207-5223-ff132909e4ae@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ActionId=20d3329a-aca9-45da-b5fe-7184ebb618e2;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ContentBits=0;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Enabled=true;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Method=Privileged;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Name=Public
 No Visual
 Label;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SetDate=2025-09-18T13:22:23Z;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Tag=10,
 0, 1, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR19MB3922:EE_|MW3PR19MB4251:EE_
x-ms-office365-filtering-correlation-id: f2055fcb-6d9a-4f05-7fe8-08ddf6b726de
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|3122999003|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dVcwUmcyOVBwNUlTUzZVTFZ4d2UrbUlhbHNISDRFbFpPZml1bXdTVDlCc2sw?=
 =?utf-8?B?L2g0SzE0Z3ZVSHdIVDFweXJpTXdqUnhBVjhEV2JhMW1YWXV2YTNWTHpwZVdi?=
 =?utf-8?B?TUc1QlY5OUFQTnp5b21hcnhLUzUrQm9DREhSRmRPWUVReXVISzBUNENsbDZI?=
 =?utf-8?B?aWxzL1JrNVFvNlo1ZU5VNmx6SkRZMWhLRExNQmlpeVQyS0RlTnpxbFA0SE9R?=
 =?utf-8?B?TUlCWmVXRlJvWWJvWVF0VnFFcHNidTFEblFCT2RQL3RVcFYranQ4R0lOVkpC?=
 =?utf-8?B?cnNZZHdMV0FYSlREU20zQlhnY0JQU2RmQlE5bS8yWndHL3VJRVMzMXhYTWVY?=
 =?utf-8?B?VEdsbnloQ2V5WVh1TmlXbml4NTRmcDgvTXNRazVqMDhHU25BNjM1UkQzZnM1?=
 =?utf-8?B?TDRQTmFiM1lDUCtKWTRhckFTWDJWTE5NdzZtbElwWjA4QS9QeVpHcnBJS3hx?=
 =?utf-8?B?djAxTStEaHo0SFVHOEFLekpJcExBQVJoMlFacnBTSllSeFdDNU9lKzFpbjd5?=
 =?utf-8?B?TitneUhTdGZIVVhpYmtQV09KSE04SGxlZjhRaUJEUHVzK2RMOFIyNExEZ2tU?=
 =?utf-8?B?elJaMHpFZU1UUEo1c0RIMzI4bmhZemJjZ3RBakdVNC9icDNnT0pmakFVNGFT?=
 =?utf-8?B?Y1NMd3c1ZmU3N1lKTm1wMkhVSld5dDhIczYrN2FpbnJ6bEV6S0Rybm9yRU4y?=
 =?utf-8?B?YkRLMWZpUUFrMjNHTHlYbnphaEtRWjJsdjQ0NXNEa2lFOWkweFFYT2hzSE91?=
 =?utf-8?B?T2tJaUZST3RkdkVNQ2ZnbE41RVVMNkhiZVJSQVdwTzk3czVNYmFhTTVyWHY4?=
 =?utf-8?B?OUNJZlpSVGoxQXY5NFpNRHA0YnQzYzNrTm1yRnJYN3N3Nk9jK3dhUTd3M2pX?=
 =?utf-8?B?enFTVUUvT0w1VHhibDBMQ01WMzVkQjBSWThEVjAyZWQ2NURiZkpNQTcvY2RB?=
 =?utf-8?B?TlVVRjVhZkoyc3FyWmhENHIzZzE5cTV4NTQwTGZVd1BQWk1aek9LUnB0M1Fz?=
 =?utf-8?B?cW0rZVJERzdxOURsSnBaWm1MWm9OK2tFbXZWWDdLeGZqVldLYlAxMndUL0k3?=
 =?utf-8?B?VEZ5ZVdCQ2dEVHI0Q1pHRS9ub0o5TTZxREtvNWpISUo4bnBSTkJnTFBLbmVK?=
 =?utf-8?B?aHZGQXZ3bmZyOVJXdU93Q3ZRS1ZpUzE0eUpNa1lYMDlWUnRsbjFlNUxyNnd1?=
 =?utf-8?B?dFl0QzcyODM4N1Jaa3gxOFZmMkxvb2RDMi93NWN2Zm1UYzlkeWxqeVBpRVdp?=
 =?utf-8?B?NVJCUVB0UHFRYUhCYkRQdEVZTGs0SFppVitGNWFPZ3RBVEUxa0tWRVpPUDUz?=
 =?utf-8?B?dUU1UGQrM0k1M0VWSE1LZGVqYS9hSG9JY2hhR1FmUEZpOEZ6azJRUHhGU3Yz?=
 =?utf-8?B?NVVPUTRBYlBDejBWMFdzQmdwMy9iUDd5TkRPZ0xCSFZNUkdWbmh5cWNLU3lX?=
 =?utf-8?B?UnRGZVV3M3Q2TEFnOTZiclVwZUNSTEp2dTRVdDFzQmI1cmZBc2lVRXIyemNH?=
 =?utf-8?B?NDg3b1RMVjlmMVgrL2NjcGswSTNMN1ZUNUMrM08vY3BGdEcyc2h5elJOSzhU?=
 =?utf-8?B?WmZFaG5RM3FOaTFBZWc3MVNUU1oybDRZVFV2V0g4czFYRS9oYlF6Ull1RFJt?=
 =?utf-8?B?cjZ0Zi9Pa3hOdHY1Q3kxbTlSOWNpNFgzaVg0NFg4amdoWUtuVmYzU3VWU2ZX?=
 =?utf-8?B?aE04OUhTTDhXMHJ3U0J3aGUzQ0lEWVVBTFRZQVlWaUdsRDQ5dHRhL3NQL0Y2?=
 =?utf-8?B?L3JxZnIvTDlxeXN5VktYaWNIdEt0QThUSFFkMFo4cmttUWp2QkVOc2hYQnpC?=
 =?utf-8?B?RlAzOWpVRTJoRGRYU1dYd0Izc1NZZEJCaHJJbWRWM0FUMGcxam5zbjI1dlFQ?=
 =?utf-8?B?ck0wZDliWVNGSDBwNWtDSXZMVThPbTkzOW1xLzA1T0lyVnAyUG9YNkZiUHF3?=
 =?utf-8?B?QlNyMXFJZTYveUhBZ0pGTlBySXphVkU1b0ZIOUp4clQ3em9VcGFHNUViVU9i?=
 =?utf-8?Q?x7AL0DSuNcaRlXnq2pED3mHGJz2aV0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3922.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3122999003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RCs3N1FFWWttbnlyRVhxVWt1ZXlLTDUrS1A1UFFyR0FzSkQrS2N6ZXdCa29D?=
 =?utf-8?B?d1lmWTE5Z2hOMzZibnZweTQvTWl3ZlY4Yk1nWUZpWHZlNXJNcjRndUJEQXBi?=
 =?utf-8?B?UVNiMnFBTUVQbWt2UFlMM3ZERVI2TmJyLzVlcjFUWTRVeFljQlJDM3hPVFln?=
 =?utf-8?B?ZFRPSDk4eVpRdGlUcG1RdVdLcGtaeTdnYXJEcmNXSFFzTitRQnhVTHhCcFdl?=
 =?utf-8?B?Q09sT0xPMEp2UXh6b0hTK0ZXVHhDL3hodU9VNXRZU2tRTWVCdXMzQ1ZIWXcz?=
 =?utf-8?B?YzIzTS9sQitnMTZObVd1WXFML09sdENyU0puZXZaRTlESHJCdXhvSGloM2sr?=
 =?utf-8?B?OW1MdkNCQnhzVEFzNm1HU0svNFJKbTlYNkorMUpEWUZuRzFRczRXNEp4U3dH?=
 =?utf-8?B?SDJYVVltV0JTa1hzOG53UnJEdGltZ2lZZVBienFDbzlUNDhUUm5ITXlDd1Bn?=
 =?utf-8?B?K0FVblU3U3p4cjVRak5ocGRPbFA2U2NjM1RCNXpIYUxRT3ZjSURJNStoNXZU?=
 =?utf-8?B?T25wL2RXZTV6eW9kWUVxbjVmbEJSZ2NaQUZoU09JYVdsZ0hPQ0V3RnE3MlpI?=
 =?utf-8?B?Uy9nb243S2haM2EwUmI2VzJJUnFZVFA3OHFvQnQrYXFrTTFpWTB2YWpqN0Fn?=
 =?utf-8?B?TndESXU0OCtETStLbDFqd1dpM0pNYWVGeFRoZ044OUlMeTNvZmVIeWhBM0V5?=
 =?utf-8?B?V3ZaNXpvcGpscU9tK2RvWGVrVjV4Tm1Ea1kxdmxpZXZMSXJDNjNHWkxLbzZm?=
 =?utf-8?B?SExLaG51WjdYZnd6MzJPMmhuUkVWWDBrYk1DOEZlRHAxbDY4ZEJmcVJUblh6?=
 =?utf-8?B?NHFLaHVVaHdsS3pjVHhGLzFhZTg3ZG0vSGR5VDZ3djlrN0dtN1FHUElkck1P?=
 =?utf-8?B?OG1hOVh4SUdxSGFLUm15MlJsSXBHRkZsdFJJSXBmaXErUUpYZkhLc0JvQUZU?=
 =?utf-8?B?REcwU1BQdnVzVEsyV0NLVXNhU1BXOHJWeXFDdDhvVEQvdFNzRHFXNTAxdTBL?=
 =?utf-8?B?VE9nVHpzNVdRZ1RPd3poUFcyRnQ0YmFxUGtVSlZ0MGgvM0FaazRBZUJ2YmMy?=
 =?utf-8?B?dlpjQ2NjQ1F0ay9lU0pXZTNveXdyT2VLeUM2cWRrMkpoaHJXQkhSSkVHdnJH?=
 =?utf-8?B?b1NQUE9Fay9IN2FGL1VLbUFMZzhndVA0dnNsL09Eb3RoWHQrcGdhTjdBNmVl?=
 =?utf-8?B?enpwMk8wWE1FVGxlZHgyRUVWNVhWM01YMVlMUitmSXlVOVc1T2NrVm5DbTlv?=
 =?utf-8?B?d3R4Z1ZvY0pVQkllU2UrSU1oMm02cVVCR1dMbmN5cm9mMjlXNkgzRHV4eWRN?=
 =?utf-8?B?VmNpODZicGJ2b1lUdTFpR3p4THJ4cXovRHlieHBSR0Fmb3ZRYkxXUmJBVklJ?=
 =?utf-8?B?ZE5pTVhqOUh2STNLRXZUSjg0eVpMdGNGV2N2bzR1VmJla0xyQ3NHMXo0Y2ZE?=
 =?utf-8?B?dmdRZXFtUW1qakg2aUJuc25MNzdTT3E4Mys0c3ZlTHA0aXVEVDM3Rk1RZDgz?=
 =?utf-8?B?UVhwVjdOUTMyZVdQV2ZvWnZXYzZpbHVOTS9yZ2hFcFpyMlBZSmpFK3hVdEF5?=
 =?utf-8?B?bkYxR3hLRjZoOHBhTmhLTmF1cHBoMCt2cE1BeGkvZHNhM0lINUpTVnRDZkJw?=
 =?utf-8?B?OFUreFJtaTYvaHlJdlNXajM0akNNbnQvbU5JQW9GS21NcXhPMnlLLy94bGRJ?=
 =?utf-8?B?dXJvbWtyRTJ4c1pFY0I3V2FuZG5ISHk2UTdmaGVUYUR2dVA3M0ZSN0dLeThH?=
 =?utf-8?B?OUx5RTE3WFdDWldCdXp3SFd6RklnMXB4K2dhSk5YMEhzU1ZOcFh5QnczT3Nx?=
 =?utf-8?B?UTQ0N0pWR0ZpdG1jalJJRmw5MlhYeS9CWmZSemUreXVoK25Va3l1cmYxYkY0?=
 =?utf-8?B?bWg1WG43aU9IRzgzdGUwWStTbTJPRldYdGMzdnNKVEpVZFQzVlFpVjE2YlQ3?=
 =?utf-8?B?ODVWaStQZElSd0o3cnZ0TmNtMmFocklnL3pZdExVVjlwY05EVFI1MUdLcVpF?=
 =?utf-8?B?UEFtbXQwSVNaTG9HMC9uVnhaQ0llK25PYWx0dVlrSzNPZ1cyZEhCc3JYU29W?=
 =?utf-8?B?ejJ0cndhOHN5ZDVPenJUalE3M2ZUcWdKdHo1MStFNGFYT0orOGcxWldaekgz?=
 =?utf-8?Q?kUdeXEaRlMzYL2ZXyvQbwI9Mx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR19MB3922.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2055fcb-6d9a-4f05-7fe8-08ddf6b726de
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 13:27:44.7589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGTZSNqN2H9jn/Ha+g8hEEAGSOwVvZtu28khrf6jGpqiJVGM4OWrQ/oJp40MgbDUZbx+/h6bJSK0aO2lvMn8JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4251
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180095
X-Authority-Analysis: v=2.4 cv=W5E4VQWk c=1 sm=1 tr=0 ts=68cc08d5 cx=c_pps
 a=Z2e5DKjA+8LiMDv5v6mwwA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=iLNU1ar6AAAA:8 a=oWj2KQjyAAAA:8
 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8 a=uXfYLfpnopYG04ZBbrAA:9
 a=QEXdDO2ut3YA:10 a=hlJyneSgMmFPbskH-t2w:22 a=2Ic52O4GNRKgeCDJ-qrO:22
X-Proofpoint-GUID: 7cnpMoKa7q_zrfhUg_vdCO96GBFpto3W
X-Proofpoint-ORIG-GUID: 7cnpMoKa7q_zrfhUg_vdCO96GBFpto3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9zrHEqaZLDj9
 Hrr1vnXHktMkO1NYjauuD2g4d9fGssott/ZmfTindjnns0rrF8Dp5MkJkYL+pFJzOVVlRKCrTuK
 KzBWWmcm88MTD2NZMv8VnN8evPBliMO1KdrnGCfISq7JM3oeOiTNJNz6JUzlrVPTEE561/U803d
 LEzulu9UQUAmWSEdGsaJn0ooz2ZhgfOsfxvqOjAN+037pFLQonLeMWf59iiNEZQ1+Ymcv9e14Co
 e2UfikzHMG07edVo1kQZdaiTwyCzWrLZL5iWxZ2AMlicyJ7PI1aXtALUtg4q5XM5IhyaxnGkywf
 BC+mS7ctfGI1Thy2YvU7kc/RIGs6NI+Q6AMusATqLBWslxjO9U1nb/iSX8IOdbm7NO/4JJyXtd3
 aSwyjQ49
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbHBvIErDpHJ2aW5lbiA8aWxw
by5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIg
MTgsIDIwMjUgNzowMCBQTQ0KPiBUbzogU2hlbiwgWWlqdW4gPFlpanVuLlNoZW5AZGVsbC5jb20+
DQo+IENjOiBMeW5kb24gU2FuY2hlIDxsc2FuY2hlQGx5bmRlbm8uY2E+OyBNYXJpbyBMaW1vbmNp
ZWxsbw0KPiA8c3VwZXJtMUBrZXJuZWwub3JnPjsgU2h5YW0gU3VuZGFyIFMgSyA8U2h5YW0tc3Vu
ZGFyLlMta0BhbWQuY29tPjsNCj4gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT47
IHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZzsgUGF0aWwgUmFqZXNoIDxQ
YXRpbC5SZWRkeUBhbWQuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYyXSBwbGF0Zm9ybS94
ODYvZGVsbDogU2V0IFVTVFQgbW9kZSBhY2NvcmRpbmcgdG8gQklPUw0KPiBhZnRlciByZWJvb3QN
Cj4gDQo+IA0KPiBbRVhURVJOQUwgRU1BSUxdDQo+IA0KPiBPbiBUaHUsIDE4IFNlcCAyMDI1LCBT
aGVuLCBZaWp1biB3cm90ZToNCj4gDQo+IEhpIFlpanVuLA0KPiANCj4gPiBJbnRlcm5hbCBVc2Ug
LSBDb25maWRlbnRpYWwNCj4gDQo+IFlvdSB3ZXJlIHBvc3RpbmcgdGhpcyB0byBhIHB1YmxpYyBt
YWlsaW5nIGxpc3QgYW5kIHRoZSB1c3VhbCBjdXN0b20gaXMgdGhhdA0KPiBUZXN0ZWQtYnkgdGFn
cyBhcmUgcmVjb3JkZWQgaW50byB0aGUgcHVibGljIGdpdCBoaXN0b3J5IG9mIHRoZSBrZXJuZWws
IHdoaWNoIGlzDQo+IGluY29tcGF0aWJsZSB3aXRoIHN0YXRlbWVudHMgbGlrZSB0aGlzLg0KPiAN
Cj4gKEkgdW5kZXJzdGFuZCB0aGlzIGxpbmUgbWlnaHQgaGF2ZSBiZWVuIGF1dG8tYWRkZWQgYnkg
eW91ciBjb21wYW55J3MgZW1haWwNCj4gc3lzdGVtIHdpdGhvdXQgZ2l2aW5nIHlvdSBhIHJlYXNv
bmFibGUgd2F5IHRvIG9wdC1vdXQsIHNvIHBsZWFzZSBjbGFyaWZ5IHlvdXINCj4gaW50ZW50LikN
Cj4gDQpIaSBJbHBvLA0KDQogU29ycnkgZm9yIHRoZSBjb25mdXNpb24uIE15ICJ0ZXN0ZWQtYnki
IG1haWwgaXMgbm90IGZvciB0aGUgIkludGVybmFsIFVzZSIsICBpdCdzIE9rIHRvIGFkZGVkIGl0
IGludG8gcHVibGljIGdpdC4NCiBJJ2xsIHRha2UgY2FyZSBvZiBzdWNoIGxhYmVsIGlzc3VlIHdo
aWxlIHJlcGx5aW5nIHRvIGEgcHVibGljIG1haWxpbmcgbGlzdCBuZXh0IHRpbWUuDQoNClRoYW5r
cw0KDQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTHluZG9u
IFNhbmNoZSA8bHNhbmNoZUBseW5kZW5vLmNhPg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBTZXB0
ZW1iZXIgMTcsIDIwMjUgMjoxNiBBTQ0KPiA+ID4gVG86IE1hcmlvIExpbW9uY2llbGxvIDxzdXBl
cm0xQGtlcm5lbC5vcmc+OyBTaHlhbSBTdW5kYXIgUyBLIDxTaHlhbS0NCj4gPiA+IHN1bmRhci5T
LWtAYW1kLmNvbT47IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBJbHBvDQo+
ID4gPiBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KPiA+ID4gQ2M6
IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBQYXRpbCBSYWplc2gNCj4gPiA+
IDxQYXRpbC5SZWRkeUBhbWQuY29tPjsgU2hlbiwgWWlqdW4gPFlpanVuLlNoZW5AZGVsbC5jb20+
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBwbGF0Zm9ybS94ODYvZGVsbDogU2V0IFVT
VFQgbW9kZSBhY2NvcmRpbmcNCj4gPiA+IHRvIEJJT1MgYWZ0ZXIgcmVib290DQo+ID4gPg0KPiA+
ID4NCj4gPiA+IFtFWFRFUk5BTCBFTUFJTF0NCj4gPiA+DQo+ID4gPiBPbiBUdWUsIFNlcCAxNiwg
MjAyNSwgYXQgNzoxNSBBTSwgTWFyaW8gTGltb25jaWVsbG8gd3JvdGU6DQo+ID4gPiA+IE9uIDkv
MTYvMjUgNjo1MSBBTSwgU2h5YW0gU3VuZGFyIFMgSyB3cm90ZToNCj4gPiA+ID4+IEFmdGVyIGEg
cmVib290LCBpZiB0aGUgdXNlciBjaGFuZ2VzIHRoZSB0aGVybWFsIHNldHRpbmcgaW4gdGhlDQo+
ID4gPiA+PiBCSU9TLCB0aGUgQklPUyBhcHBsaWVzIHRoaXMgY2hhbmdlLiBIb3dldmVyLCB0aGUg
Y3VycmVudA0KPiA+ID4gPj4gYGRlbGwtcGNgIGRyaXZlciBkb2VzIG5vdCByZWNvZ25pemUgdGhl
IHVwZGF0ZWQgVVNUVCB2YWx1ZSwNCj4gPiA+ID4+IHJlc3VsdGluZyBpbiBpbmNvbnNpc3RlbnQg
dGhlcm1hbCBwcm9maWxlcyBiZXR3ZWVuIFdpbmRvd3MgYW5kIExpbnV4Lg0KPiA+ID4gPj4NCj4g
PiA+ID4+IFRvIGVuc3VyZSBhbGlnbm1lbnQgd2l0aCBXaW5kb3dzIGJlaGF2aW9yLCByZWFkIHRo
ZSBjdXJyZW50IFVTVFQNCj4gPiA+ID4+IHNldHRpbmdzIGR1cmluZyBkcml2ZXIgaW5pdGlhbGl6
YXRpb24gYW5kIHVwZGF0ZSB0aGUgZGVsbC1wYyBVU1RUDQo+ID4gPiA+PiBwcm9maWxlIGFjY29y
ZGluZ2x5IHdoZW5ldmVyIGEgY2hhbmdlIGlzIGRldGVjdGVkLg0KPiA+ID4gPj4NCj4gPiA+ID4+
IENjOiBZaWp1biBTaGVuIDxZaWp1bi5TaGVuQERlbGwuY29tPg0KPiA+ID4gPj4gQ28tZGV2ZWxv
cGVkLWJ5OiBQYXRpbCBSYWplc2ggUmVkZHkgPFBhdGlsLlJlZGR5QGFtZC5jb20+DQo+ID4gPiA+
PiBTaWduZWQtb2ZmLWJ5OiBQYXRpbCBSYWplc2ggUmVkZHkgPFBhdGlsLlJlZGR5QGFtZC5jb20+
DQo+ID4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBTaHlhbSBTdW5kYXIgUyBLIDxTaHlhbS1zdW5kYXIu
Uy1rQGFtZC5jb20+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBNYXJpbyBMaW1vbmNpZWxsbyAoQU1E
KSA8c3VwZXJtMUBrZXJuZWwub3JnPj4gLS0tDQo+ID4NCj4gPiBWZXJpZmllZCB0aGlzIHBhdGNo
IG9uIHRoZSBpc3N1ZWQgc3lzdGVtLg0KPiA+DQo+ID4gVGVzdGVkLUJ5OiBZaWp1biBTaGVuIDxZ
aWp1bi5TaGVuQERlbGwuY29tPg0KPiANCj4gVGhhbmtzIGZvciB0ZXN0aW5nLg0KPiANCj4gLS0N
Cj4gIGkuDQo+IA0KPiA+ID4gPj4gICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsL2RlbGwtcGMu
YyB8IDkgKysrKysrKysrDQo+ID4gPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykNCj4gPiA+ID4+DQo+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYv
ZGVsbC9kZWxsLXBjLmMNCj4gPiA+ID4+IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvZGVsbC9kZWxs
LXBjLmMNCj4gPiA+ID4+IGluZGV4IDQ4Y2M3NTExOTA1YS4uYmVjZGQ5YWFlZjI5IDEwMDY0NA0K
PiA+ID4gPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvZGVsbC9kZWxsLXBjLmMNCj4gPiA+
ID4+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwvZGVsbC1wYy5jDQo+ID4gPiA+PiBA
QCAtMjI4LDYgKzIyOCw4IEBAIHN0YXRpYyBpbnQNCj4gPiA+ID4+IHRoZXJtYWxfcGxhdGZvcm1f
cHJvZmlsZV9nZXQoc3RydWN0DQo+ID4gPiA+PiBkZXZpY2UgKmRldiwNCj4gPiA+ID4+DQo+ID4g
PiA+PiAgIHN0YXRpYyBpbnQgdGhlcm1hbF9wbGF0Zm9ybV9wcm9maWxlX3Byb2JlKHZvaWQgKmRy
dmRhdGEsDQo+ID4gPiA+PiB1bnNpZ25lZCBsb25nDQo+ID4gPiAqY2hvaWNlcykNCj4gPiA+ID4+
ICAgew0KPiA+ID4gPj4gKyAgaW50IGN1cnJlbnRfbW9kZTsNCj4gPiA+ID4+ICsNCj4gPiA+ID4+
ICAgIGlmIChzdXBwb3J0ZWRfbW9kZXMgJiBERUxMX1FVSUVUKQ0KPiA+ID4gPj4gICAgICAgICAg
ICBfX3NldF9iaXQoUExBVEZPUk1fUFJPRklMRV9RVUlFVCwgY2hvaWNlcyk7DQo+ID4gPiA+PiAg
ICBpZiAoc3VwcG9ydGVkX21vZGVzICYgREVMTF9DT09MX0JPVFRPTSkgQEAgLTIzNyw2ICsyMzks
MTMNCj4gPiA+IEBADQo+ID4gPiA+PiBzdGF0aWMgaW50IHRoZXJtYWxfcGxhdGZvcm1fcHJvZmls
ZV9wcm9iZSh2b2lkICpkcnZkYXRhLCB1bnNpZ25lZA0KPiA+ID4gPj4gbG9uZw0KPiA+ID4gKmNo
b2ljZXMpDQo+ID4gPiA+PiAgICBpZiAoc3VwcG9ydGVkX21vZGVzICYgREVMTF9QRVJGT1JNQU5D
RSkNCj4gPiA+ID4+ICAgICAgICAgICAgX19zZXRfYml0KFBMQVRGT1JNX1BST0ZJTEVfUEVSRk9S
TUFOQ0UsIGNob2ljZXMpOw0KPiA+ID4gPj4NCj4gPiA+ID4+ICsgIC8qIE1ha2Ugc3VyZSB0aGF0
IEFDUEkgaXMgaW4gc3luYyB3aXRoIHRoZSBwcm9maWxlIHNldCBieSBVU1RUDQo+ID4gPiA+PiAr
ICovICBjdXJyZW50X21vZGUgPSB0aGVybWFsX2dldF9tb2RlKCk7ICBpZiAoY3VycmVudF9tb2Rl
IDwgMCkNCj4gPiA+ID4+ICsgICAgICAgICAgcmV0dXJuIGN1cnJlbnRfbW9kZTsNCj4gPiA+ID4+
ICsNCj4gPiA+ID4+ICsgIHRoZXJtYWxfc2V0X21vZGUoY3VycmVudF9tb2RlKTsNCj4gPiA+ID4+
ICsNCj4gPiA+ID4+ICAgIHJldHVybiAwOw0KPiA+ID4gPj4gICB9DQo+ID4gPiA+Pg0KPiA+ID4N
Cj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaC4NCj4gPiA+DQo+ID4gPiBSZXZpZXdlZC1i
eTogTHluZG9uIFNhbmNoZSA8bHNhbmNoZUBseW5kZW5vLmNhPg0KPiA+DQo=
