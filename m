Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2E21ABEC1
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Feb 2025 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728027; cv=fail; b=VVU5eG/yyBxUYEDfAFMk4PqSsg+lXPtSLuHD3d3qHl1sRbwJdFYQU1mz8SMBbLygWZzkLS5m2JZJ4hPPAq7dd2di+OWKTAjJGuq/qew+9JEmZqikpmUaPv1XVsD/wglODgxs/8d+uYNw6AiRjdL0yQLC0UA/UE9smhUd5mqV0WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728027; c=relaxed/simple;
	bh=BRn/BF4Yonoj9t01N5AAYjgRh+fIUNLf3qKpLpCNU/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tTvjgxmlz9LTp26XBax2d6gelbwpNbx/FqkYc+M/O/aIJ6rmjst4+gmStdcReKmL0WixbsYT8Cdln5UjMRmQqj3UXZEHjJb9pvc7sMqtQAzsdZZJslGgbfM2tjROM3U3LwoZPAMOXMdKnxsRxf7NJRhJZJItPvzy+yzgkhys0LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=afRW6Iw0; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="afRW6Iw0"
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RMj23n028076;
	Thu, 27 Feb 2025 23:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=q
	fq0Z5wDW4t7hdFibp/9PA8j0s/2iEr1eFumh/C1nFk=; b=afRW6Iw0V0h6OrDAC
	XMfKuYDUkSV0XyjPOarkj7oC9vQzbtNXscPBb8EdLgzT9pZGa741bjnUbldxpcTz
	D0zgo6ow7oamUZkf23wGuc2SUtvNS4Jd6+umBAGtoesp7BM73KfE6qrtMKQgGCTc
	r7tD9jU0WFFudmFtAGSuEaQJf0MxLM1mtqyWVmg9rMeJhpSd9jQ4lWB8CQkCwyH7
	x2WlapbN8cM4Ef0D802jeUQTcFZBUd7qALn7JOBWeLkHuLbQnmKB4s/PJ5IbLTKZ
	G2y5hZK0GsWjTGaNAA5zNYLsSTfJl+vkxwDVzLUvavuw6p8NWsIg+duIJvY3FBvq
	XoTbQ==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 451pwaktba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 23:37:00 -0500 (EST)
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S4Xupg015730;
	Thu, 27 Feb 2025 23:36:41 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 45367j00n2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 23:36:41 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y25TjkQJFFY65t1kc7h/Yu2faqn6J7lW09l5hcBAk6ayaeYaogg++FVZx9CYcVhWo8xqUtNfMKzH8O6zpW4X9fz6zDrn6Lexxjd6KFg+jslLKu1JEMPlg3tREGk7evJ9Xz4sP9JaseeRWpALuC6AbQZ7Ajolgk2Y0KiTFNwgNp74Wyz01FrByypo7RaAvjKAS0P0FcokTqpK+PuWA47muE3VuSeT6UsKmZ2J9Ovmx1jDjFB0XQI7RyMNrkmZ5yyPZfHYOEaSjlT3Jchju9MXqVqp0dOA2wMOGXZt2toeKXkBgpLoKQxNbHRBCRp99JZQRAGxFlZ0iZMQ1Lo9Exznlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfq0Z5wDW4t7hdFibp/9PA8j0s/2iEr1eFumh/C1nFk=;
 b=nnWJBrPUSiyA/Rde8QJRjD25eBQN9IbFMdXalACvViv1IlyTp85/nruEsF+3c/ykXolss4Om1P3oaE8DMPSsnfwKOsys9qx5r0bNzuq0PwRNWWLkE3rbNM6FH2S4xzOgD3xamb6ESTmsl9UW8aOfYfYZExkwM6fy2uO1a9eK1bYritGzSBcyUsb7FJyK+/L80hBCY6LVXyKUOobll1C3oq4toP1dT0MeT1lLBpC4IV6ou/N+2NZLH5jDWUyLb1GdExroG79ToMXDjZJrUbRAyPyzm/PitV44sEOed8ACk/uTzE5+jOHspYSEcR9wAHYkbR2nmjHSWeHXrJcCYYtbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23)
 by CH3PR19MB8329.namprd19.prod.outlook.com (2603:10b6:610:1c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 04:36:37 +0000
Received: from BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::afc3:5bb2:37fb:2f9d]) by BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::afc3:5bb2:37fb:2f9d%5]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 04:36:37 +0000
From: "Shen, Yijun" <Yijun.Shen@dell.com>
To: Mario Limonciello <superm1@kernel.org>,
        "Limonciello, Mario"
	<mario.limonciello@amd.com>,
        "Shyam-sundar.S-k@amd.com"
	<Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "Patil.Reddy@amd.com" <Patil.Reddy@amd.com>
CC: Richard Gong <richgong@amd.com>,
        "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86/amd/pmf: Initialize and clean up `cb_mutex`
Thread-Topic: [PATCH] platform/x86/amd/pmf: Initialize and clean up `cb_mutex`
Thread-Index: AQHbiTmTqzWOlECFgUGARCXW+UQdULNcIC0g
Date: Fri, 28 Feb 2025 04:36:37 +0000
Message-ID:
 <BY5PR19MB392275906AA040DF44DD8EB29ACC2@BY5PR19MB3922.namprd19.prod.outlook.com>
References: <20250227170308.435862-1-superm1@kernel.org>
In-Reply-To: <20250227170308.435862-1-superm1@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=8d5c276e-824c-435d-bc90-34131eb4d123;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=0;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2025-02-28T04:29:11Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR19MB3922:EE_|CH3PR19MB8329:EE_
x-ms-office365-filtering-correlation-id: 491693db-9875-4947-add2-08dd57b17d21
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-7?B?Ynk5ZFJweDFtaFdOSHBtQmtqbjZkYU9qZks0SHdlY3V4dFQySWsyUkt1anc=?=
 =?utf-7?B?Ky1QTnZ0NVdMYTJnM3FTQmFHM3QyTEY2aG9kU01YRWZlM3NaYjR3Ym5ya0t4?=
 =?utf-7?B?TlRGNGh5MjFWcmlVQU5yRjlZS3Zydmo0dTRQeUR3YystKy1wOXlhd1l1U2pD?=
 =?utf-7?B?M3dCdVpkS0VYcystSnlub2dQb0dMOVF3TjhLMkp2U21FbHlXMFhHTnlxWTRz?=
 =?utf-7?B?QnV2d2VoMVFuU3dOeG9TbzJ4NmFWZystWXJYekY4cHVqMistYnRLajByeWxC?=
 =?utf-7?B?dml1OVpOTDFDSkhoRzlJZ2drZkdHZEhqckhlVXoweGthWjhzaUxwc2VrcS9y?=
 =?utf-7?B?a3cycWl2MnFNVUVSYUtkVFcxelRCMHJFaTc0STRaT1FDbHJTTzVWUUZRZjRD?=
 =?utf-7?B?Rk8vbWgrLUZ5cGhaVVgwTXVIcHlrUEh5QWRaMU92dUVwWFN0bFBoWUlxTVJE?=
 =?utf-7?B?MGRFbnhvQjFBRmJJTm9QZWxVWlZLcUZlKy1BKy1OaFZyQkQ1aGlFSXBDbi9y?=
 =?utf-7?B?TGF5M1BEenVNN2J6R0U0NUk0VlpKMDJkMjNmc2Mvb1NSUlg1cGlGYm1lb2Fw?=
 =?utf-7?B?NHlXNUFHQnBJNUJQYmZMelMwd2lVN3hIeUcyRXN0eTJ2YjBEVktCQ09ya3p0?=
 =?utf-7?B?SW9YQlhaaG1kUmc1N0pCZ2k0ZzYva2w2UTN4emhNRnYyQzhlaGxDUHljcmUv?=
 =?utf-7?B?Qjd4SDlzcWtiYzE4ekkwcU5ybjNITmNwN0JaM0wyU3p0U25FZ3JYazdYd2R4?=
 =?utf-7?B?RFZGTTA5amozUnRJakc4VFJyQzY3eGhPSWFKUjV3TVlaakpyeENMbzlYQUNl?=
 =?utf-7?B?Sk5XTHJVQ1hEd01CU3d1VlFwY3k3TVB0VkRoOUprTzFXSGpWVEtSbEdzQ0Js?=
 =?utf-7?B?WHV0ZW5oR2djaXd3NjhqNWwxRGtJUGNwU3MyUDBJb3NCa0RTbWcwenFVQmlT?=
 =?utf-7?B?RjJqOFh1Yy85Q2EzYmlvOUpJR2V2VWFlbU8rLTI4WEFONldKeWZyYUZFOHR1?=
 =?utf-7?B?RjVaTmJXZXZUKy1ndU5iSTJkRXNqeE5hRmlqakZnZWNRQTdWU092bHBTcWFj?=
 =?utf-7?B?ZG5qTHhPRUdWcjNzd3M2Z0FqakdYSFphM2IyNHYvMDBIdEErLUxwamdzNHlv?=
 =?utf-7?B?QlR4c29VUHBaSGtXV2JJOVo4RzR2WElLMnpyRmlldWtYZXhKanIwVmNnSlVB?=
 =?utf-7?B?c1hTa2ZsbmN3Q2lweG9qdzF0ekU1ZzF4L3dMVmhhTGFzd25xTnE2amxuS21N?=
 =?utf-7?B?RGxtN3pSU0hNUDdzaE1rbDFTeGQ3eTVSN25LT0ZrY2MyZkVoNi9FdWY5TkRo?=
 =?utf-7?B?SkExR1A3RWRFaXEwRjBvZjBleTRDbkRGazI5RkFTRldyOHJtaHpCYWFyOG94?=
 =?utf-7?B?OVl1ZmFZWVdVVENqTjJjM1gyL3h1bHRnaU5obFphVDE1Zmxla1lva2twTkhO?=
 =?utf-7?B?VUtaRmxBVGkxc1M2dkw5WTRkaXdwYVZ0R0U5MUpsWXVQaUhIYVNuU1dqeEg0?=
 =?utf-7?B?TkQ4YmU4ek1jZ3RhUFZEWTBhMlFMYjMzcFpvOXZtZUxNeE5rKy10aXpVWHpw?=
 =?utf-7?B?SXdoS0I1S0I3OGlSbng1Y0w0cnFHYzZyZU1kSHY1RUQ1ckJXUTlJODVNZi9X?=
 =?utf-7?B?VTNlTzJsWHlSaGtwb0kzcndFSGJydW9idEpUcistMGhmQVJNTTExWUFtdGpa?=
 =?utf-7?B?ZkRXemxZZzBzQUhnWUV3MW90d1g4M0VnVm56TlBEOVRLbmVGQ1VtMkNIZXhQ?=
 =?utf-7?B?Qzd3SzlwSystNzBYb3owRmxpMUU1MUdxSmlKOTlTWmhPNUVGeVpOdnJJb0Uy?=
 =?utf-7?B?NW9hckhsLzdNT0pFYnBPd0ZOVFpQNUhJTFJ5MU1EOHd0T1M2a0xVSTljelpM?=
 =?utf-7?B?MUs0ZUZaMmlpUy80OXZHQmtQTUlMWHgyWTdoYVZ6VEowd2paVFY3dlhXd1Mv?=
 =?utf-7?B?cFh4Y1BNKy05RVkyQm1qKy1zd3VjbCstYVNjRTRvYkpMZ2lKdEd0Q2NoOWhQ?=
 =?utf-7?B?amxQLzIz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3922.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?UVQzTCstM0pDODM5Q0tNaUlwRXFsYistbnFtL01GUTRtS01PMVNtM0xLRVJC?=
 =?utf-7?B?YkV5L0I1a2FpWVpDR2htbmJmSDFGM096WnFUa0pzdnFCM2pZajFtT1FLRVpD?=
 =?utf-7?B?QnlFT2dqYTNqYTJaRHdTZ0d2bDM5S0dFcnhGSHBMUjVxVWJncmRlcU04YUVL?=
 =?utf-7?B?QkY0ZFhJKy1PL2M3SkxidFIzcnN6TEtTbnlSaC9PcmVaY0VrSFdvcnFLSkVY?=
 =?utf-7?B?aDA1aGUzL1I2ckdqUkJkQzZkV3o1Nll1M3I0ZWZQaXRqSS9EQjE0Y2RZOFJ5?=
 =?utf-7?B?MGxPNmxSV0w0V2tEQzd0Y3FBMWZTdjVjMlllMlFlQmlBcXJVNUtjanJkaVdI?=
 =?utf-7?B?Yk9ZZHNucUgwTFR1cm5OVDdkTmdFd0VHMUtIZGsxbExBM3V2enNjcUZRbGF3?=
 =?utf-7?B?bCstNEFUazgrLWFlSDRvU0JBTSstclJvb2RNUndZcnBJODhZME04akVxdHdK?=
 =?utf-7?B?VE9QRW1HQVpDbmphRHhFNkROU21vZFEvQ2wya1RxVystYk9TS3R6Z2xVbkpw?=
 =?utf-7?B?MkErLWtDQW1ZaFJBUWFqQ1dkVGE5dG8ydEIyV0o5YmlPdjIrLWhzQjJxUS9W?=
 =?utf-7?B?TnN0c2c5VkdadTlxa0ZGeGZKVDZOcE03U1Fsb0ZNdlUxc1ZlMkdxODRRaDJL?=
 =?utf-7?B?UE4zMWhmYnhIV08yaE9Ga2phTEhUaXR1QW1BRjlZU0FEaHFwMHpzalVHUk90?=
 =?utf-7?B?UThxZHQxaHJWQUFTRmVnUVpGRmJQNVNOZ29jcjBUMC91bUo1TkVDTTJ4NU5v?=
 =?utf-7?B?WE9oRHR4M1FsT0JOZDV3TVlWNERMbFFpVWxZYzYwaGoyY0Y2NUNFNVdPKy0y?=
 =?utf-7?B?aFFQcTg5Q256TFJSQTh3Z09LWUtzZVcvMW4yOHdwVnl1TGhLSzlJbmgxbjlk?=
 =?utf-7?B?UWk1LzhYamNoZ3o2VE1TL3FUaTkrLXo5MGU3T2JDQWpVc29GWmlBYnBSd3l0?=
 =?utf-7?B?aWszQlRYcnJEOUswZVEvcVpXWVJ0dDZNSystb3FYQzhGazNJYmNMMHBVT0pu?=
 =?utf-7?B?Rk5aQmE5MnlHaHNTclFGa2NWYmxEZjNUL0w0RE9IZXhJZnRYU29KeEd3eGtX?=
 =?utf-7?B?c1RFMHVlNVJUWUI1aTRKSElOc2ZIeWtRbWxnVmRsU0VEbFgrLVluYzZHWXQ=?=
 =?utf-7?B?MistS00rLUZ2ZTlRbEphSVVtM3JyMEtGYzZQZWNKbkxsQ3VVZjRUVE56NTZp?=
 =?utf-7?B?bkZ1M1JYVTZDYnRCak9LQ2YwRlhlWDM4TU1ZU3RvSVJzZVlZQ3k0MzU5NTR0?=
 =?utf-7?B?WTFaTmdtVFl6TlhsTElOTU5FakJ1VjlkaEFtZHE0VUd4cm5sQ080QjZIM0dn?=
 =?utf-7?B?QTFrZGNWTy91dmIwZ2hHMW9tYk9JWWlwaEJvL3dOU3JQQ053UTErLUtyL29s?=
 =?utf-7?B?RzBYUkF0R3BFdTdGRjVvb2dWMkgxTzhiaU1IczlIQ1lWSUxwNkRUWGZWNkFR?=
 =?utf-7?B?TW9manlOTms0alJnZlFjeFBFcHdVeFBIUERVOUJRajdwUDY1YmFWZ2VJamRU?=
 =?utf-7?B?cDhFbGZCMGp5NTdwVzVpb3ZPR2NhYzRhc0ZobCstakYyT0N6bVY4d3hXOXJQ?=
 =?utf-7?B?QU1iam1ienNRUjdQb3pRVk9RU3VKQkdpZENDQ1dwc1NoT2Z3L2pmL2RqZEM5?=
 =?utf-7?B?U3FoNEdwMlZDRystM0RsSlFrVlc2Ky1DNTJ3UEttTFhhS3pGa1IzZWpzUWhk?=
 =?utf-7?B?dTlUVWFkM0s3M012N0pvUGd6ekhWL2J1TjhteDVZNGcrLUdTRy9LZ3NuS09Z?=
 =?utf-7?B?dUhGZzBWcnFOQnNuVHBoUXBlKy1tay8yUTgrLW12Q2x5MGZYYXUrLUx1dWs1?=
 =?utf-7?B?Q2NLVUJjQjc5YjFCZmhhOW1DcWVYdkk2cXpwb3FZYlFncGJjRjU4OVVPQldw?=
 =?utf-7?B?L21BYllOYk5VcWZXaDhZV0wrLSstRjJZb3g1NXpUSjlTdEtxTEt4YzlwbHFT?=
 =?utf-7?B?M1Q4azdEbEpObVFNaW1vU0l5NlFUTWtjbzhQL2hyYURsa1doZTAvdjgvMEFV?=
 =?utf-7?B?amZIVk0rLUw3a0t1ZktDdlF3amtmeTJ2UzN5d24yaWNEbW5FMmloZzI5S29S?=
 =?utf-7?B?RFV1aHlyZVArLVNkVENQQ3l6b0tLWmlTRkNoZVdjaXRrdXFoKy1oMEVmdU9a?=
 =?utf-7?B?bGtodnZoUVZMV1E3Rk5KTm9PL3o3Ujg5WnhoYlY5NDVlSUM2UDJDems5ZEFL?=
 =?utf-7?B?Nno0OUs4S082?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 491693db-9875-4947-add2-08dd57b17d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 04:36:37.6606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COiove8UqHuKdhBxfUSWP3lNVkyXG890MlXvHtQHDtVBlWeuKSoXWdSS513e/oZw+tkEHgA1vYHFzoQwep3ifA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8329
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280030
X-Proofpoint-ORIG-GUID: HZuvxAKOAiLyQK5BOhh-LVRc2hOi2Yf4
X-Proofpoint-GUID: HZuvxAKOAiLyQK5BOhh-LVRc2hOi2Yf4
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502280031


Internal Use - Confidential
+AD4- -----Original Message-----
+AD4- From: Mario Limonciello +ADw-superm1+AEA-kernel.org+AD4-
+AD4- Sent: Friday, February 28, 2025 1:03 AM
+AD4- To: Limonciello, Mario +ADw-mario.limonciello+AEA-amd.com+AD4AOw- Shy=
am-sundar.S-
+AD4- k+AEA-amd.com+ADs- hdegoede+AEA-redhat.com+ADs- ilpo.jarvinen+AEA-lin=
ux.intel.com+ADs-
+AD4- Patil.Reddy+AEA-amd.com
+AD4- Cc: Shen, Yijun +ADw-Yijun+AF8-Shen+AEA-Dell.com+AD4AOw- Richard Gong
+AD4- +ADw-richgong+AEA-amd.com+AD4AOw- platform-driver-x86+AEA-vger.kernel=
.org
+AD4- Subject: +AFs-PATCH+AF0- platform/x86/amd/pmf: Initialize and clean u=
p +AGA-cb+AF8-mutex+AGA-
+AD4-
+AD4-
+AD4- +AFs-EXTERNAL EMAIL+AF0-
+AD4-
+AD4- From: Mario Limonciello +ADw-mario.limonciello+AEA-amd.com+AD4-
+AD4-
+AD4- +AGA-cb+AF8-mutex+AGA- was introduced in commit 9e0894d07072e
+AD4- (+ACI-platform/x86/amd/pmf:
+AD4- Enable Custom BIOS Inputs for PMF-TA+ACI-) to prevent conccurrent acc=
ess for
+AD4- BIOS inputs. It however isn't initialized and so on use it may lead t=
o a NULL
+AD4- pointer dereference.
+AD4-
+AD4- Add code to initialize on probe and clean up on destroy.
+AD4-
+AD4- Reported-by: Yijun Shen +ADw-Yijun.Shen+AEA-dell.com+AD4-
+AD4- Cc: Richard Gong +ADw-richgong+AEA-amd.com+AD4-
+AD4- Fixes: 9e0894d07072e (+ACI-platform/x86/amd/pmf: Enable Custom BIOS I=
nputs
+AD4- for PMF-TA+ACI-)
+AD4- Signed-off-by: Mario Limonciello +ADw-mario.limonciello+AEA-amd.com+A=
D4-

Verified the patch on the issued system, the issue is gone.

Tested-By: Yijun Shen +ADw-Yijun+AF8-Shen+AEA-Dell.com+AD4-

+AD4- ---
+AD4-  drivers/platform/x86/amd/pmf/core.c +AHw- 2 +-+-
+AD4-  1 file changed, 2 insertions(+-)
+AD4-
+AD4- diff --git a/drivers/platform/x86/amd/pmf/core.c
+AD4- b/drivers/platform/x86/amd/pmf/core.c
+AD4- index 764cc1fe90ae4..a2cb2d5544f5b 100644
+AD4- --- a/drivers/platform/x86/amd/pmf/core.c
+AD4- +-+-+- b/drivers/platform/x86/amd/pmf/core.c
+AD4- +AEAAQA- -452,6 +-452,7 +AEAAQA- static int amd+AF8-pmf+AF8-probe(str=
uct platform+AF8-device
+AD4- +ACo-pdev)
+AD4-
+AD4-       mutex+AF8-init(+ACY-dev-+AD4-lock)+ADs-
+AD4-       mutex+AF8-init(+ACY-dev-+AD4-update+AF8-mutex)+ADs-
+AD4- +-     mutex+AF8-init(+ACY-dev-+AD4-cb+AF8-mutex)+ADs-
+AD4-
+AD4-       apmf+AF8-acpi+AF8-init(dev)+ADs-
+AD4-       platform+AF8-set+AF8-drvdata(pdev, dev)+ADs-
+AD4- +AEAAQA- -477,6 +-478,7 +AEAAQA- static void amd+AF8-pmf+AF8-remove(s=
truct platform+AF8-device
+AD4- +ACo-pdev)
+AD4-       amd+AF8-pmf+AF8-dbgfs+AF8-unregister(dev)+ADs-
+AD4-       mutex+AF8-destroy(+ACY-dev-+AD4-lock)+ADs-
+AD4-       mutex+AF8-destroy(+ACY-dev-+AD4-update+AF8-mutex)+ADs-
+AD4- +-     mutex+AF8-destroy(+ACY-dev-+AD4-cb+AF8-mutex)+ADs-
+AD4-       kfree(dev-+AD4-buf)+ADs-
+AD4-  +AH0-
+AD4-
+AD4- --
+AD4- 2.43.0

