Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932623A995
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 Aug 2025 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754044990; cv=fail; b=NGHlYH/tH3jLcunKXUjvZLvqKDAw3vyvXLOFzTrTPpyXy3vgp63Ivw2mY4vNI0OA9FByx3VoybFRU5ijjDacmBQmB/ADeTWiHrykVqjapL8fWDnuD86Myz0a6SoM08nDpa+BH0L1GWRdwi+PlrFAgMkC71uhSSSPZn9nLG7TLfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754044990; c=relaxed/simple;
	bh=9f58M8MgTk2kkEBmm0pMbWibLvTHxrXRh+cHs0qnccM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gYX6BeopcCQa1V3MqUv6hv+UkW3cMeNFPlD5PBHqYQKS5blz9ePTCkWYU6PQti4JEwQm3t7Z4WvhFxhkfxkSTz5e3zUKUSN3vfSijMTswRw0VSagLcI9e9uggnS2RLNth8BBCq85bWH5h5LARfTNExeDPTIgkmuqonK3UyxxkJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=e6tJ45di; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="e6tJ45di"
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VJj5Bp018235;
	Fri, 1 Aug 2025 00:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=0
	xaFnfq4NExglJb33ou6kK5jhq2zle2K/NUichdJ6ZM=; b=e6tJ45diu16lwSLu4
	JYONn7m0XeOUNa9car4mojC7t+ZAwof6x97bFj8F7pzgzAm5F7/I56icEXGuCjGJ
	ZuOSepifuZoFdywr0E3e6X5dGCi669neIavOZjS4a3JK3iAtf1AYtepSDkHR9ZxL
	lHDWd+FBI9A0pRG3kmCej3vY68oOe8jgPM1SVyn1ZC1zaUl9ZlpzvmjTX9x+Yj34
	E4q53E6YD4mcIZSNNa3+RX38hPAfuxcY5YzjhlSJKJeQQhOluAG9RFMAvyosjs6X
	1sGaivUHrahNEBXS7Lk5544oCYSpayD31HgoDF1tdYzBKQIngbJELjZJxjbPG28H
	1yd6w==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 4876cfc1w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 00:37:39 -0400 (EDT)
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5714BdU1027157;
	Fri, 1 Aug 2025 00:37:39 -0400
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 488paxr9qa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Aug 2025 00:37:39 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX0wEYcPrssR1/nTobIbKeTbitu3xNFYRO+oh6EPIfK9V7Erf4TcnaDNVMpOJzT+XqxzIGSPC4by3Nd5pYd1tVCSf+365f20Nhkc0ck783WpruoyloouTm6lTIWSa9dnyrWbKxq20KETQDNwvL6mYZtx3rCnC4nAe0E7CRYPUkfDB5pQ2uIJ9dzrVcQwdV/n9VIwDZ3x3OYBk9yakNCRa8eCrEXuEWIBfodiB3uQfTsonxRe8gPJH1a+d6OFXpMCSOzKswEv8XT6kfMMWYbfdyfeA9aG52xOxxEvwy328wuNsR6mIR3znNGWD4yzC3PktQN8z2lGidwRU+t0udgsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xaFnfq4NExglJb33ou6kK5jhq2zle2K/NUichdJ6ZM=;
 b=v/u0bR8Hd/Eg+CrPnpok+Ea0jCgFnR50/OuKNF78Y1/LTJSToIkbOxgKZYHfJ7W8kKpgIDgGDfiWHzQCQqehADRvlANPVGo34gR1iPtuXIMRm5tR3cCW64IsmqEoYFhVuw9l9/uk5plgIbKVe5V8V85t1GNuClZfHkqFCfUlGFuZhW0dPHhF5Xjr6OxT5hgFr4CIHfg09PDYr92NgtN/hDvRA7j4I09M70kunaEq1opB6qbdVn7rCM7MntXGNESQzpqEgoDVe1RZkpRwL95MV114fOZQ9KJ2FQZ5NwxBL3q9ZvcmnHx1r8MhaZax8lcmAR15soBLIZ7gqiMlgg3JkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23)
 by SJ2PR19MB7559.namprd19.prod.outlook.com (2603:10b6:a03:4c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.9; Fri, 1 Aug
 2025 04:37:33 +0000
Received: from BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5]) by BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5%2]) with mapi id 15.20.9009.003; Fri, 1 Aug 2025
 04:37:33 +0000
From: "Shen, Yijun" <Yijun.Shen@dell.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com"
	<hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>,
        Patil Rajesh <Patil.Reddy@amd.com>,
        Mario.Limonciello <Mario.Limonciello@amd.com>
Subject: RE: [PATCH v3 0/9] Enhancements to PMF Driver for Improved Custom
 BIOS Input Handling
Thread-Topic: [PATCH v3 0/9] Enhancements to PMF Driver for Improved Custom
 BIOS Input Handling
Thread-Index: AQHb+5zjcYsCRjJgB0iF5LBMzl6qgbRNRALQ
Date: Fri, 1 Aug 2025 04:37:33 +0000
Message-ID:
 <BY5PR19MB3922423C07021B61A61B63919A26A@BY5PR19MB3922.namprd19.prod.outlook.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=True;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2025-08-01T04:34:49.0000000Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=3;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR19MB3922:EE_|SJ2PR19MB7559:EE_
x-ms-office365-filtering-correlation-id: 03c4174d-df42-49c4-9c64-08ddd0b52233
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-7?B?RGZZeVZTUjdhQ21YdFRNZnVRckdFMFg4WlF3aGh5ZWZwQnpFbDNwZG9xdk5B?=
 =?utf-7?B?YTVUaXl1d0g0ZXU3bjRIQkhTaklPc3AxaUhUNDhxcXZ1QjJzUi83NXUxbWRx?=
 =?utf-7?B?YUFaMExaazdySm00bzZyKy1KbUhTNGVYNk1Nc3J1R3g2NTZiZWhwNkFCSmdt?=
 =?utf-7?B?ZmgrLW1MZjJrb3hQaEljUlhWcklPZ0JVREJlem5pTCstdG9YNElaakNrZlVF?=
 =?utf-7?B?T0J2cGM3aHBzU0VHVWlRWjB1M3BWMkpYamFYZnhUeXdjZzNtNkdiZVNqU3Nh?=
 =?utf-7?B?bzRmZWtoRU5aVEgzTDZ4eWVrNVV6YWZKYWF6WTErLXJBaGtZdCstNDMwKy1X?=
 =?utf-7?B?S0ZZV1U5UFNlU0JBMnZYL0IxQzhxb0dUY2s0dUFYb1BZMzRma0V2Q09rVUxs?=
 =?utf-7?B?S0ZLbGNzeXFWVGdoSE43eks3TkNhaWwvTjJrSXRJKy0zZ2Y3SHBaN1NET3dS?=
 =?utf-7?B?RzRtUjd3eEt1M2JyU010Nkw4UzU0Y25lL0kyQmtDNS82QTRxL1U4aTJoVUFr?=
 =?utf-7?B?THJHWHBmWi9nekxKdm9yNTk0SS9WWmRJWGc3Y0lhRFEvdkwyeFc5Q1B3QXRF?=
 =?utf-7?B?bDdKNlAwcm5UdEQxNTM5dXcydlJrN01NeUZoWmFYQUFpMVM3TTU5SmxUVEVk?=
 =?utf-7?B?M0Z0Nlk3MnFsanVXejRLTFVXMlR1OTZxQlkxUlJ2WXhnbXpFKy0wcnZrRWZh?=
 =?utf-7?B?djQzczltbjVZS2JneEpTYjIvcGs5Nmo3V0hWUDBZWktHUnlZY2F0amRXODNQ?=
 =?utf-7?B?ZTg0dmtoa1cyaEhqbVIrLXc0aDZQSTBERHh2R25MY2xtKy02MDN6OTZGM0d5?=
 =?utf-7?B?ckFyRkN6Sk13OEtCcWdPNEpmbENWSHNtS3EyTWtsNWhtMXlKVmhZcW9YVlhj?=
 =?utf-7?B?clBna2d4aWd5b3pDQ1VBMDdCa1hEdjh0V00zMTNQVlhvRXNSMXYySzFBRkxS?=
 =?utf-7?B?T0pjSzdqVmVsZXRFckg2NkZmTUNHVjNrZjdSRUpRQzhpcHJUbUZDKy1GY2dP?=
 =?utf-7?B?MVJpOVN5V20yV0NPb3lMUDFCU1ZrVXVVR2c5ekJlWUpFMDg3cmNUUmw1MEpu?=
 =?utf-7?B?dGRibE5ienpZOTJWS0psU2NFUmd4QmEvT0VaL3h1MTZkRXVrb3orLUJoZExF?=
 =?utf-7?B?NUgrLXFyYWlSL2hvSUxCMDh0QzBTSUw3eUF4OEFiejhuTjV4ZHhRd1J5Y2xl?=
 =?utf-7?B?N0t3Z2dzelpsZDJMQmU2V21kbEJtN3ZwY0UzUmVtdHNVazZKVSstUjQyWS9i?=
 =?utf-7?B?YWREbFk3UUtLaTgxTjEweWxxZE1xYTZXbkVnM0FYQ1hxUVluSVJGcmUydkZT?=
 =?utf-7?B?SzJwa3hCUWFuWHVLTElRQzFtdWE0OXIrLXMxZSstNTdFVUJZRDJ3dG1uZTU5?=
 =?utf-7?B?SDB1MUxxemhab1FFRm5GUE15Q3hHeUwzNVlXMHBTVnhwNnhDZllpTFpQMWJD?=
 =?utf-7?B?aGNxb2hXb2hKY3prL1RBem94OCstSDQ0Q2JqcnhNUVBmcnAxcmowdGxtODNN?=
 =?utf-7?B?eDJ5YmVielNtNXJUazhjWUlCVHZxM2d4aTRUNXQ1Y09yNElmWTNFVEUvWCst?=
 =?utf-7?B?bHNlb25ubmZKdjhUUlM5REtaSXdNMUcveU9OR1VBNjhrRnp1T1dsQmZIMFdk?=
 =?utf-7?B?QVdMeEphaGFlQTNuSEtJMmJPRlorLURoRWdaaGtPdWhyS1dPa0JYcVBrUm0y?=
 =?utf-7?B?TVVvcmhOejVLS0FRTzhmbkpJeTlMSlpWSkdYbnViR0dmVUFGa2VZcWJQWGta?=
 =?utf-7?B?Q2VIOUpiamJIZ014S1RHWmZ3ZlVvRTNyMDh0VlVzc1ptNHFGeWVvVystKy04?=
 =?utf-7?B?ZVNzMmlZNlhBMDFkd3FYUktBQWo2RzNaM01YbEJYdjI2aU04UUNVWjJtNHdI?=
 =?utf-7?B?Y3VHQTl6cS9pZXUzQWlVMjRBNFFRQi9zMlh4cVEzUklNUkJ6N29RWm5JcUht?=
 =?utf-7?B?OTRKZFR6VFR5d2Rpdy9CSXdNTXQ5VXlkbUJiU1REOHQwQWE4eHVYZnZ1bHdw?=
 =?utf-7?B?UWw4QmwvMGVJanIyVWd3Ky1jcVZzcWdTd2hFVXlDQStBRDBBUFEt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3922.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?Q2NqZUxPUkU5bDRzRFJZVnY2T3IwOFB2NzZEaHRWT3dYL0gvMDBtQ01Ia200?=
 =?utf-7?B?a0V6UTBYYi9uanVPblhQdjdlZVpaTkVZU1IxN1I3YTZSY04wYmZOM2tVamRO?=
 =?utf-7?B?dklxQ3dKaGYvY2dsT3pqWDJnVG82VlloM1pCS0VyL3JWVzc4dFVzZzYzcXV2?=
 =?utf-7?B?NVdaQ01INkw1RDFMTGErLTNGRFNjVFkwYkVJVlRDM2FISXN4M1ovZk4xZmc5?=
 =?utf-7?B?NnJ5ZXJ5QmJYV0piQzVCaVVMTUt0T2syYmZ6QnBGRnZYcFVPcEZzdk4xbTV4?=
 =?utf-7?B?dWJDWFJsWmxHUFFqUlUrLWgxRmZxdkdidzNBMDRrVkpOSE5zRHFGYXVtOVND?=
 =?utf-7?B?dEJNV2d3bSstd1BEbEJZZDBoV1crLU9WWEJQZTMyV1NmVklYNzN0eHNleWwx?=
 =?utf-7?B?RzQwd2ZXSFBZVWxJNm0vdlpWKy03Ky1maGMvcFM2NUYvN2ROWXBmOWRzREU=?=
 =?utf-7?B?Ky1lOUJKTVFONmlVVDh4dU56MUFwVGhvTHB6QXBLTDFORzREeks0dTZYVWRY?=
 =?utf-7?B?WWtld3h1VkwvRHBIMzI1Rk9BMDRGYXhpamdybjNGRVFneXoxa2JIcTEwR1Ax?=
 =?utf-7?B?ZDk2ZGVrTlM3cVhQN0xkVEdlWHRITlNyWWZOV2d4OFdSM0RqaGxDVlVMKy1j?=
 =?utf-7?B?MWVUamtta21zMFV0MEdQOWhQWXJqaFJCUGlFWm9kQkdieG9CaEZ3dEdEU3l4?=
 =?utf-7?B?NTZPSDNzMWN3TW1kdnU5NkpoalFuMk9JYkNGQTVhM3FUd2sxM3dYMUJQZWVi?=
 =?utf-7?B?VlBuSmorLUdlKy1LaXltcDlLYzFJWVRMTE95U0pKOUdPa25IeXByMFpOR1Bh?=
 =?utf-7?B?eTRJQ3NWeTJHMVNvZkJPMDFHa09vRU9hTnRoNEJ2dHlycmMxc3BEZzQ5RjJj?=
 =?utf-7?B?UURvamdHMXo4S1VnQjJwRDdzTWVaL1JTYWJIVWNYV3VzSWd0dnZHY2RyOUJv?=
 =?utf-7?B?WHQvMnFxMEZLQU1CKy04aWM2Rkc4alVTVXROeXRrYjNVQThGWmVMOHBZY1Bm?=
 =?utf-7?B?d3hLUDJjajRqYUhWWnlLdFIwNEVlT2M1T2JkZUx3enlEUlIxZUNlaXFZY29q?=
 =?utf-7?B?TlZrMnFlbGNJUGFuUThMbW5oVXFDQ05PcDRnQkxUZmNlQ3hjRm5raTl3VFRS?=
 =?utf-7?B?QkhoN1Uzb2NLaDlvWTRJVnVLN0pHME55UlBsQnRDdzJFRU5HZkdxcWhlUmZK?=
 =?utf-7?B?M0ErLVk4OFA0ZDdFL2diTmgvTmQzdGNqN3dMaUp6WWJHRVRiSFkyQktiWmx3?=
 =?utf-7?B?d0xjc2tDbEdZMERHWmxYeHd4UVArLTdraFFiKy1Oc0dIY0pWUzU3RlFIV2I5?=
 =?utf-7?B?OXpFUDBaTnBIZmowWUZYRUpCWS9tTU1YN1piRDgySCstRk1MYVlFazlUR052?=
 =?utf-7?B?MkZHclZRaXRraTFJQkIxQ1lJM3FmL1lLdXF4dW1OMlhNTGFndmIwKy1RanF0?=
 =?utf-7?B?dEJSY3pnS0tmWlIyeEZwM1B0ZGdxVk5OeUk1L055TDFjUmlTbzJzNHJiYXo5?=
 =?utf-7?B?UlJYWVFrc1hicGs2SkpoUjRPTmtlZ1Q3TEJoTmhXekU0WWl1YjB4MzArLXRu?=
 =?utf-7?B?dUoySTc4bm9pYzhCbGI4WVUvU0N0ZldkZHFBT21JUnpvVEFieFlwZzVEbHl5?=
 =?utf-7?B?d0NNU2p6S2tPVFV1RlpwQjFNMnp4NFkwZFdTOFhaR253V1diZUFXSnU2bHdY?=
 =?utf-7?B?N25iSEJmVXdPNUFkR1E4Y1VTM0F1WEVROTdwalhqeE1HVk9FNko5bi9KRExV?=
 =?utf-7?B?Ky04a3ZCZE16MWg0SU5uKy0weG51N3lCMjlyOVphZVhjU1AvcGdzZldoKy10?=
 =?utf-7?B?V0hXZVZvUk9ZdTBad0orLVRnL3BLM0xaaG82c2NlQUx2eVNMUUl0L1dGRkZO?=
 =?utf-7?B?TnZvSUc2bEdIY2pEbEN0TEcyYVEzWWhjdTVhL0gvbWJOb2JFOWgyU2JFT3ZU?=
 =?utf-7?B?NG9acHNRQXpldnVOR1FDR05TWEt5QWZqRjNjUmNuZ202Q1RXVXZFb3JRQVFH?=
 =?utf-7?B?T1lFZFNrSVBBY1FuU3ByQU9JT2VydXR4L0pNRS9WS0F3THhiZ2JkRGRuUTVt?=
 =?utf-7?B?RFZvV2RlSDlKZHJrUldheUVKY2ljOGJXaDh0R0pJU2NRVGtDTVBrQUlheWYw?=
 =?utf-7?B?d2ZzUnpaY0dVdlRnZFhlc2E3V05tOTloVndHT2owbWFLQ0VHOVViMEtHVDBL?=
 =?utf-7?B?N0c=?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c4174d-df42-49c4-9c64-08ddd0b52233
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 04:37:33.7508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2ZFEm1PlfSjqfYFdERS5yss5wutkQuG8lYkuqqiJZsvtLPRL5cudCCtD0YdkENbVRFu0VPXt8kj7sBdFs6s6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7559
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010029
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAyOSBTYWx0ZWRfX74+NWT2vcxy4
 e6wBkTXJXhEgNEoCe/037DhE9hoUc8qleYjVt9KYO9n4NCLS+MQuFUXbKAFIrUcHz9c9TpVcens
 N/yu9WCXUSxiZKAaZ1rRFiBbptD/xgRPZMaN+xXrJw1Z/HqivSFhG59y65fbH6nVWJOe/PKUEQk
 Iyr4ZB/sqfiAIbu86EjBl+vn73qaDvIA7Gq3oFrl6LgLlYjDtY25N6KRZJzlCRQKUfU+TnYeNIu
 fJ+cJy3J04mgR2sJrMn9Ihp3jLQpT/TFQUshbiJRKf/s6EX0j1YvTh4jvjCO1Q8VBW+Nr9+gc3Y
 +dL/H8ocu/VTkDuIrk59rWrHzlIoeO6cRbw4cFI6inXgae62FK7J4pYzkmxXkPhsyM0DXUenndV
 Q9Rua2+ajTPj3iGIbk3uGshHPQWhpHyWMemaHkk/mXj+XkfLjsVeewXrXNet11LcZU2svSjA
X-Proofpoint-GUID: 2tFUocGphPeqqogQLNA8mO9OBr1w9CZo
X-Proofpoint-ORIG-GUID: 2tFUocGphPeqqogQLNA8mO9OBr1w9CZo
X-Authority-Analysis: v=2.4 cv=SseQ6OO0 c=1 sm=1 tr=0 ts=688c4494 cx=c_pps
 a=j0++y401J6f/BxNAf5EDow==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=YU3QZWNX-B8A:10 a=2OwXVqhp2XgA:10 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=iLNU1ar6AAAA:8 a=sS_K4Su9AAAA:8
 a=XlRjxQ70AAAA:8 a=LfxEVeEBAAAA:8 a=y6sI6L9M5rjR0zl3lW4A:9 a=avxi3fN6y70A:10
 a=gbU3OgOOxF9bX48Letew:22 a=QaANnTo53oYaUAiVOp1Z:22 a=1uMOUU2w0DxzEe95gQqD:22
 a=7k9nRlTqVbDGZ3p5_T00:22
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010029


Internal Use - Confidential
+AD4- -----Original Message-----
+AD4- From: Shyam Sundar S K +ADw-Shyam-sundar.S-k+AEA-amd.com+AD4-
+AD4- Sent: Wednesday, July 23, 2025 2:41 PM
+AD4- To: hdegoede+AEA-redhat.com+ADs- ilpo.jarvinen+AEA-linux.intel.com
+AD4- Cc: platform-driver-x86+AEA-vger.kernel.org+ADs- Patil.Reddy
+AD4- +ADw-Patil.Reddy+AEA-amd.com+AD4AOw- Mario.Limonciello
+AD4- +ADw-Mario.Limonciello+AEA-amd.com+AD4AOw- Shen, Yijun +ADw-Yijun+AF8=
-Shen+AEA-Dell.com+AD4AOw- Shyam
+AD4- Sundar S K +ADw-Shyam-sundar.S-k+AEA-amd.com+AD4-
+AD4- Subject: +AFs-PATCH v3 0/9+AF0- Enhancements to PMF Driver for Improv=
ed Custom
+AD4- BIOS Input Handling
+AD4-
+AD4-
+AD4- +AFs-EXTERNAL EMAIL+AF0-
+AD4-
+AD4- This patch series includes the following changes to the PMF driver:
+AD4-
+AD4- - Implement support for modifying PMF PPT and PPT APU thresholds
+AD4- - Enable custom BIOS input support for AMD+AF8-CPU+AF8-ID+AF8-PS
+AD4- - Add the is+AF8-apmf+AF8-bios+AF8-input+AF8-notifications+AF8-suppor=
ted() helper function
+AD4- - Correct the handling mechanism for custom BIOS inputs
+AD4- - Maintain a record of past custom BIOS inputs
+AD4- - Process early custom BIOS inputs
+AD4- - Initiate enact() earlier to address the initial custom BIOS input
+AD4-
+AD4-
+AD4- Changes based on review-ilpo-next with tip 'commit 5a9fffd8a533
+AD4- (+ACI-platform/x86/intel/pmt: fix build dependency for kunit test+ACI=
-)'
+AD4-
+AD4- v3:
+AD4- -----
+AD4- - Add amd+AF8-pmf+AF8-set+AF8-ta+AF8-custom+AF8-bios+AF8-input() and
+AD4- amd+AF8-pmf+AF8-get+AF8-ta+AF8-custom+AF8-bios+AF8-input() to simply =
handling
+AD4- - Address other remarks by Ilpo on v2.
+AD4-
+AD4- v2:
+AD4- -----
+AD4- - Use array to store the BIOS inputs instead of individual variables
+AD4- - Remove additional spaces
+AD4- - Replace GEN+AF8-MASK() with a meaningful macro
+AD4- - Merge patch6 and 7 into a single one
+AD4- - add amd+AF8-pmf+AF8-handle+AF8-early+AF8-preq() common routine for =
early pending
+AD4- request
+AD4-
Verified this patch series on the issued system.

Tested-By: Yijun Shen +ADw-Yijun.Shen+AEA-Dell.com+AD4-
+AD4-
+AD4- Shyam Sundar S K (9):
+AD4-   platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU
+AD4-     thresholds
+AD4-   platform/x86/amd/pmf: Fix the custom bios input handling mechanism
+AD4-   platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
+AD4-   platform/x86/amd/pmf: Update ta+AF8-pmf+AF8-action structure member
+AD4-   platform/x86/amd/pmf: Add helper to verify BIOS input notifications
+AD4-     are enable/disable
+AD4-   platform/x86/amd/pmf: Add custom BIOS input support for
+AD4- AMD+AF8-CPU+AF8-ID+AF8-PS
+AD4-   platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating th=
e
+AD4-     policies
+AD4-   platform/x86/amd/pmf: Call enact function sooner to process early
+AD4-     pending requests
+AD4-   platform/x86/amd/pmf: Add debug logs for pending requests and custo=
m
+AD4-     BIOS inputs
+AD4-
+AD4-  drivers/platform/x86/amd/pmf/acpi.c   +AHw- 62 +-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+--
+AD4-  drivers/platform/x86/amd/pmf/pmf.h    +AHw- 78 +-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+-+-+-+----
+AD4-  drivers/platform/x86/amd/pmf/spc.c    +AHw- 82 +-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+-+-+-+-+-----
+AD4-  drivers/platform/x86/amd/pmf/tee-if.c +AHw- 22 +-+-+-+-+-+--
+AD4-  4 files changed, 220 insertions(+-), 24 deletions(-)
+AD4-
+AD4- --
+AD4- 2.34.1

