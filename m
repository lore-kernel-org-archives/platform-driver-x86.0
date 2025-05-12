Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3564D
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747045876; cv=fail; b=rBj+7KFwAvj9kCszMRU0HWaAqOB/PEvIYlXHfZFcvdmKvs8guah1cB666qDewbsv0n7eg34M2ORuRY6UxZ2sQieswcXx7ovFXf+NRQRnAg/DzPKqn//5To7f2G9Gxiv8RuvZMF5WQeR2+v1esj+eLXL6RCLWOhwZ9BdwaVEONG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747045876; c=relaxed/simple;
	bh=psCeEOEbSywUpzmYs3eoS6QC6Jcf9Vd7Cvi3gYoX3TM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IfMmY9gWRG7sKHqFc20xls97JfRtVWNU7vyCGzZIC2r/45ZV9UCdBRz8Te6LMatKirON+Ut3SaWJnZ2Dkfy/L1QKxkVZJVr462+sJFadRM4y8kq8AoMHIO73Azzoz/78AaK+eddmLxV2yLpyYsEuU74mI2vKeTaeT27tBFZujN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=BA6i7Ygh; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="BA6i7Ygh"
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BNUvFi011467;
	Mon, 12 May 2025 04:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=+
	3akTDEb2MkwJMBW9eQhedqUCRfUORFDEiMCrRgjxdA=; b=BA6i7YghHyRZ2g8RU
	3ra6kROBjdawP3k81xwPARJt0jHjUiDX1bp5WLvmTSE8QYWjhXtj7fbF3wTPq0wu
	QVQ4J8jJ1qS0dBub2mri/3K0RlzHtJGxca9vk8+s/9SNQSvYJ969lvIeSoM8BGAQ
	Ejt7NYmGzkfYfnSra/zUH/0XLk7bRFDaUE8owzoG2XajfSul0wqORoWiNZ/14W3d
	ioPJl8q8Apqo+e1Pk6+BHD3rEl798lK8FnlmfsSLSPgXxjYh3/PqDlDj4vntZWGH
	LL7TEQyVkoiw4+g4dnzTSHxf3Pi/Tb1nrnm6tflG3RSHAgOPKQYyDhOi7FtTSs8J
	Wsf6Q==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 46j24kdgt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 04:13:43 -0400 (EDT)
Received: from pps.filterd (m0371675.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C7FRHS010192;
	Mon, 12 May 2025 04:13:43 -0400
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 46j05q96qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 04:13:42 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzxU9g+PE3JCoPXfyQ/eEQzCf6tTpEzqzCsXpJ+/MHCtXClPUMcHS/9B6tmyY8IeeNAXLy7deXh7OTWv5MCDvSOf7xbv3AB8c8q1pgKiTBciZbf9GAXQ+BiCFev/M1SXBL330+T/h87k8UT15omCrIncI1tTlPuz+hwAylEBYmz/olvcOBHpSJjSEMaJRa7odpTZm7mXgO7eJ892NgQPgwaBYrAzJ3y62JK/lbvNvY9Bm79tBsTxwZMyh5l9wVYdeliuHvmj9ti3TgIFQK5/hIifsUBS9fa/zAGJe08xhVPuQ9//hFymV/jM1RRD9q1hHTXJAfNl0iQjgmDvSTNaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3akTDEb2MkwJMBW9eQhedqUCRfUORFDEiMCrRgjxdA=;
 b=qHZxwx4uhs7BCQ0uWIrifNFOcRCln2pIV6hJwLBJ0xs+AJ4JHIbukdLOACg7sDM4Z2JE/4qXiXb7RuJfAUSedcQyCbLsmVdAKRK8aaFm429HIWIEmFRSKspD78k5vldF2cIaWNjDFcCVp6m8myveVQYLMRmU+CpenazogV832EQg5CssdlLiSpttAjKK/9PPzDKfxT5u3/i/rUBnwsL+ar59w9kmrALgNqy+7AjSVi2BCeFsiK5JGK0cm+/KrUJ8x+eKa24HkwdVJ9x4ZloZy7f3RhS1NyuIauY4iuACDEMnxCgL3d0GEYjSR5TmODuE8Z/7NR+xWHNxOMtF82rUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23)
 by MN0PR19MB6264.namprd19.prod.outlook.com (2603:10b6:208:3c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 08:13:33 +0000
Received: from BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::afc3:5bb2:37fb:2f9d]) by BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::afc3:5bb2:37fb:2f9d%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:13:33 +0000
From: "Shen, Yijun" <Yijun.Shen@dell.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com"
	<hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>,
        "Patil.Reddy@amd.com"
	<Patil.Reddy@amd.com>,
        "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>
Subject: RE: [PATCH 00/10] Enhancements to PMF Driver for Improved Custom BIOS
 Input Handling
Thread-Topic: [PATCH 00/10] Enhancements to PMF Driver for Improved Custom
 BIOS Input Handling
Thread-Index: AQHbwLPdFO9NTnO230mggJ9+UEgStbPOpBgA
Date: Mon, 12 May 2025 08:13:32 +0000
Message-ID:
 <BY5PR19MB392208C717944725657254449A97A@BY5PR19MB3922.namprd19.prod.outlook.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=947c4025-2fe3-4058-860f-d05e233e0b25;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=0;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2025-05-12T07:52:03Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR19MB3922:EE_|MN0PR19MB6264:EE_
x-ms-office365-filtering-correlation-id: afcd2570-fdd3-4bb4-12e8-08dd912ce341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-7?B?OHJJNkxMZDZwM2RYV1VCVkhsWTBteFlQN3dWTEVEVUVpUk4yL21VbERzZ0xo?=
 =?utf-7?B?dVJod1plYTZUbXA2cjk0eCstNkVVQ2tlMTlDMGs4cE1BQ3Bod09JSnhIbmc5?=
 =?utf-7?B?TDVxQ0xoYmhPUU5zcTdDWEMxNistNzlscnYxNDdYN3ZaanZsTzdqQlpjb3d5?=
 =?utf-7?B?eldvKy1yOEFQQkc2SzZtb05hRklpMFRrM3VmWmp2eVR5ZnhGWDlPSDdkMXdE?=
 =?utf-7?B?cW9aem41alJJRWt2QmNjaTMrLW5sL0pvanpnb0FsbmNRY2orLWJZQ1gwekUw?=
 =?utf-7?B?WXpxV1QxM052bzN6Y3o1MVJ0OGVuNEtWUFpTZlQwcEl6Ky1kVzRJUmVaV3hT?=
 =?utf-7?B?UXh4WFpiZ2pveEl4cll2eU0yS2FUYjVzUDYrLXg4eWg4YXg0T2NhZDhucUtM?=
 =?utf-7?B?SUFxV0dWVzA1ZU94czcrLXJUSzI4MWwwS2xraFB4Ky13Ky15VEVxaXdZbmRC?=
 =?utf-7?B?Y2Y2U3pVM1RtR090YlpGMVZGclRacDJucXVEaWE3Nko1QVdPUmtEZ3BMTlFI?=
 =?utf-7?B?anBHbmEwblhRUmYxOEgrLU1nUWVsY3AwZUprZGFvM2JHZnNHKy10b25RcG80?=
 =?utf-7?B?d2wvVXNRQmF3OGsvR0VDTjkxZlFRVXVDeWtWZVJxREN3YUc5bzdBTlprb2o0?=
 =?utf-7?B?Ui8vUystVXYxUXFRaWxSZmtXRzhYbzdzVjJ3dmI1UmZYdmdQM0JiSW4va3lF?=
 =?utf-7?B?eXZ0YmxUeko1YjJCNmMyc2tKZEhRcHhOeGZiVngxRDVJZ3VzSzBJb21iSzRL?=
 =?utf-7?B?amdady9SU2pLRG10NC94YlBaWDJzcGkwR1oyTmxIOEg2WmhsdXp5UkR0akhr?=
 =?utf-7?B?bUVzb1BJcVZqSUsyQ2o2dWNhdnBoMFBNRWk4Yk81M2JOZSstOTh1TUJhLzVM?=
 =?utf-7?B?QXhYWTRuNGF2SEJYd3lRVnVXWmNnNDJhSG5KaHBFNmZBQistMmIwajE2a3Rh?=
 =?utf-7?B?TzNtVXFjOFNrcC81N1U2dk5oM1AyWFZjQkhIZHQzRUI1OTk0YzZUSS9ObVI=?=
 =?utf-7?B?Ky0zVmM4ZGpQOW8rLTdHT1JZQVhPUGRLL2IvWmZQb1gwaXdiNXlWN3BacTZP?=
 =?utf-7?B?OGVSZHdKbWRsYXhOQ1laS1FlWUtFekRHTnBZMFhqQ29vTFRiMnpvUkNOWist?=
 =?utf-7?B?cGpQUzZWamJ1SEJwN1F2T0I3WTRhRGM4Z1gwMlpaVEZTS3E5ZSstaXA2VXVC?=
 =?utf-7?B?R1dUV09xYzVudU9SaS9mcndzRGNPYW1CZWdLTjlqNHNVQkNNTGVYd0tJMHVG?=
 =?utf-7?B?TkxZTzdlaVRxdzBwKy04cG9PRDcvOHBzVUpMakU0bEtaYVpKTnRLNUtKM1lh?=
 =?utf-7?B?M1h6ZzJFSjlFUHNTWDcxZWxQZ09DbWlkN0dZcW5RS2d6UHJaeEpObGp3N1ZN?=
 =?utf-7?B?VmFFZjVMYXdUKy1RaG5BQUlheWtEaTJuM0pRa3VsZXJkbmZvdzNpeW5NV2s1?=
 =?utf-7?B?YVpacktIKy1oVHg1N2xMUkE0VThvZ21KSTZiWTgvWEo4SXZ4RFo0OXZTOUlk?=
 =?utf-7?B?MURUSlVKYmlWcTBzdEJiazBCMHJzWGFlN1ZmR2Q2Mi9zQWttU2NPY0ptU1Z5?=
 =?utf-7?B?RGVYR2RlRVlRSmpZbk9WZ3dnZmNkcWNZMjRndm1jb1FCbTMyUlI4V1lyQnJw?=
 =?utf-7?B?aG9lalA1VmZheUpVODBZTUNHYkhKekRPRU9MQU9tamR0RERTRy9XNnFzRG54?=
 =?utf-7?B?dHE3NlQ5RkQvQ3J0RDcvd1R5anVweGk5NVN6b3FpckRleVovQlJiNlhZZXY4?=
 =?utf-7?B?NFppQjhUUUVDWGtIWHZ0cVMzck1KUFVhSVJVTTNzeDh5SlJRKy01RHl3OE5V?=
 =?utf-7?B?MDFkNWZEenAxbHZzbCstRGRJLzVNL05Gd0xKME42SnQ2REhVZmR2MjhYZFRY?=
 =?utf-7?B?ajArLWZVNzR3c2RLektTVFNQbDVYd2tDTTFXV2YwRmorLTJaSFJkTzVtY2xE?=
 =?utf-7?B?ektKSistanNKRmptL3VqcDNESmRXRTA0cjZETEEwYktTRVB5Z1lnWnVGUml1?=
 =?utf-7?B?emhuek1hbGhMR2FrOWwzVTlQejN4YWIvMGtMTkRZdmVqNW5NZytBRDBBUFEt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3922.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?NVJONFhWTGNwZTkxbThpQlZVQTZTWU1pc0JDSGZxeHBhUjY3MUZCWHN1RmNq?=
 =?utf-7?B?TTduQzhQM2lib0NHY2pDMjg5S2F2ZWdyVWVMaUYrLTBDQXorLWhyZFkzRTFm?=
 =?utf-7?B?YUpVdlp4dGVDOEN0Ujd6d1ZaS08vTCstQ3EydGI4STJuKy1VVXVacXNWQTRN?=
 =?utf-7?B?d0c1ZlE5STJJRGhnYUtYdzh6OEpQY3VkMmlmWmc1Vmk5YXVMKy1qcUN5dmZS?=
 =?utf-7?B?MzlydG96MjBudlZTWSstaXpxTm9zUlNaUjRRZXBGakxPYnlKZEcrLUdJNzcw?=
 =?utf-7?B?cjFsOWo0SmVwdXZnY1I1ZzQwNi8vQ1RNbHhOODFLR2ZXMkExT2U3QmFOTEg1?=
 =?utf-7?B?REMxYXdMTWplNDdoU0lhaUdWRkRNSmRBRElObSstVm4vN3dJcXE5Y2YwYXZ6?=
 =?utf-7?B?U3JJOE9COXZ4V0pUc29jNzBLOE5oRUVmOHR6SzhCRystNWg3a1VWTkNTNDlU?=
 =?utf-7?B?cTNFaVcwVUh5OFE0eXlXQy9FaWhhdzNGU0wwa2RhU3dVZzBKVkhZNWpmMVM0?=
 =?utf-7?B?R25qM0dneXBHTTd4d3hCalNpTEdxNzhDc1JCOGdtQmtuSDFDTGtic2F0MDZs?=
 =?utf-7?B?U3VHOVgzdnY1bmcyalNMTk9iR0wxSWVmM2g4RFgyRWlmU00wT1B6UGtPeU8z?=
 =?utf-7?B?QzZ6YjFtQ2FXZ2d5amFLUWV6bTVBa1cxcGxPOWRzUVE2SistVGhKQlQrLTBo?=
 =?utf-7?B?REhRMDJkd0o1MUZiMDlxYzRVbmZua1ltcWJ4cEFWR1JlcXBvdzRvWm96R3NG?=
 =?utf-7?B?NHBJM254TFp2Vi9pQUFRQUEzR0U3cVU1NjNyb0p4NHVMQi9UNGVhcnlRQXc0?=
 =?utf-7?B?emtnaUIyclRhYWZ1V0RSNUovNFh4NUo0RmJrRjc0aVF6Q3hlam9QN0Y4cGh0?=
 =?utf-7?B?UDU5enVrYWdMNm55RGtiZ2x6TDdVT1JWbmc2ME5Qd3hDVzZkVWU4ZVVqVmtW?=
 =?utf-7?B?Y3AxeGw1Rkl1aTg2NlFzcDVhYURLWmNrOFB3bmF6VmIyVmlYNGh2NU16akJq?=
 =?utf-7?B?YUxKLzVMRERsbXFLMGlNMTJpM2hIbGFPMnFnb0lqeTBTWXZ5Rm5YRDFYREhB?=
 =?utf-7?B?UistMTlRL0laN25xSUVQeE5NR2NPRWR5TnRsMFVaYk1wZTFodlhIYktSYXBy?=
 =?utf-7?B?RFBoL1o0Q0JWOXArLWRmcXByOGxoQ201cG5xUVNZMCstcTFZRTRkdHR3ckRR?=
 =?utf-7?B?WUxicWdiSHl2YjdZQistWENBWWRmbmZFZWVFelI0QzBydW1LVXIwWDhQbUI=?=
 =?utf-7?B?Ky15cnNSVkNRNWNMNDE2SHFzOW1rUS8vT3ljMzJ0WFhJZm1QR2ZGampkbFRF?=
 =?utf-7?B?N3pNRVJCdUJXSncwbTJ3dGoyQ2hpT25oOE1QYkY0WVdVWlFpRzU3N1g2TGdk?=
 =?utf-7?B?d0JkSXI3TVNmemd2MkVFaFluVXBEdmoxc2NIa01wRkV0Njk5SlQyZ0ZFZzV1?=
 =?utf-7?B?MFBFRnVhTWUwcGgrLWwza0d0NFcxTXZKRlhIWTdxTFErLWQ1eGo5UmpweVVw?=
 =?utf-7?B?Yk95eTgrLU12bjNlZ1lMZE9Yb0hGZHR4Qm1CbUxWNWptaGhwQjViN3ZGU2w=?=
 =?utf-7?B?ZystZFRJbE02Y2pnRk91dE92U0FYWmN3WUhVN2ZFR1hkbzRNWk96NCstQ0pq?=
 =?utf-7?B?RmVXUzdiU01rQktuanZUdDBVci9TWHpLUC9ndEhxTkdMRVFWY3paOGorLUpT?=
 =?utf-7?B?bkRoNG9nSTZ6NUM3UWhHcldlL0xNSFN4ZkNrSGh1eHZwdndzcmN2c2w2YWtm?=
 =?utf-7?B?dCstZFJTdlJFSUFzaXJrcWVJZzFQM2hhaFRiYmxWbFVya2Q5dXRUL0lUODBK?=
 =?utf-7?B?bFRUc2prWVlwNGw2R3pmTGJLazhDNXpYekhBUHJLSHJod1hER0dmZWRXbkxU?=
 =?utf-7?B?blFmeS9hb0I3STVlMS9BSXY1aXd3VGNqdEN6Ykc4UzNMU08xYzZZak1jMmZh?=
 =?utf-7?B?d2VjYjRyTlhXV0w5ZXRWcmhTSVVQNFVCUDZ6UXk3Q1pTZExoaHQ1eEhjMENz?=
 =?utf-7?B?V3hyVFVDKy1HMlJuNkF6dnVnSnpCTk1ienZWWmkxa3p2YmZhT1ZtS1FkYWtU?=
 =?utf-7?B?enJvZFlZUGEwdTJocWk2Vy9CZ3FJblRkdno1Q2x5dlA1U0VyMzBZcW45bHUw?=
 =?utf-7?B?djYwbmpadGIxdmRSeGlzaTNtWnRSNmxlaldKbWpuQWRsd2JiVkgyV0IxRzFp?=
 =?utf-7?B?NHZaUzZx?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: afcd2570-fdd3-4bb4-12e8-08dd912ce341
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 08:13:33.3405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QNld+3TZgrw/zQl5GdcmObCyNFVYA+YSHdR9fEy9BkuPGUnzRKhK9UMXJ6liddHk/KpSfbGf8JKsoCDurV6E1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6264
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120086
X-Proofpoint-GUID: 33TaRIfJnkiHEtWp5hIznCh3mLZa3VL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA4NiBTYWx0ZWRfXy5lLUZa7O4GW 1q+zdko8Nr3tmDsoSkj3y+n2vjkIcDFMJOGzsRgNxJjw6xNo5nUcxCLeGQKQQnAY+K/wR704k1C BjuZHZfTTtrqOA/kEivnRhV7j9FNSoW//eN9V4m+/v+0T+3qBvfjD/uskwP9kFGv4koq7u7d8dT
 y36mdlVWX7KJZiMetO0JZay9VOtR/R0sfIH2+y8JtpHBAezGWejWmzhHpaOuMk/j1pA8GRA6wZr tvh0TRt9c/kL2tQTbZjP+u1UmAwIk2m4EaMQsgccFBy8tk5ttwhm9Jgq9y3JiYe95B+fpuKB6PF ZdhkFu+20aDDnJKwBy8BFXXoo5VtLBJhkR5HxYroLxGoLr9kvjM9AIjqtdvt5sCwVXX8LZUOJLQ
 hNIe+bfJ9H31QsMot7DBHE9mbbCS+Vl9TDu5Fy4T9Kzr1+eaB+fo7Mt+CCbb2K/yTXG28UMp
X-Authority-Analysis: v=2.4 cv=ErrSrTcA c=1 sm=1 tr=0 ts=6821adb7 cx=c_pps a=j0++y401J6f/BxNAf5EDow==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=YU3QZWNX-B8A:10 a=dt9VzEwgFbYA:10 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=iLNU1ar6AAAA:8 a=sS_K4Su9AAAA:8 a=XlRjxQ70AAAA:8 a=LfxEVeEBAAAA:8 a=Eck7xrpOGDWHRZXxsvUA:9 a=avxi3fN6y70A:10 a=gbU3OgOOxF9bX48Letew:22
 a=QaANnTo53oYaUAiVOp1Z:22 a=1uMOUU2w0DxzEe95gQqD:22 a=7k9nRlTqVbDGZ3p5_T00:22
X-Proofpoint-ORIG-GUID: 33TaRIfJnkiHEtWp5hIznCh3mLZa3VL-
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120086


Internal Use - Confidential
+AD4- -----Original Message-----
+AD4- From: Shyam Sundar S K +ADw-Shyam-sundar.S-k+AEA-amd.com+AD4-
+AD4- Sent: Friday, May 9, 2025 3:27 PM
+AD4- To: hdegoede+AEA-redhat.com+ADs- ilpo.jarvinen+AEA-linux.intel.com
+AD4- Cc: platform-driver-x86+AEA-vger.kernel.org+ADs- Patil.Reddy+AEA-amd.=
com+ADs-
+AD4- mario.limonciello+AEA-amd.com+ADs- Shen, Yijun +ADw-Yijun+AF8-Shen+AE=
A-Dell.com+AD4AOw- Shyam
+AD4- Sundar S K +ADw-Shyam-sundar.S-k+AEA-amd.com+AD4-
+AD4- Subject: +AFs-PATCH 00/10+AF0- Enhancements to PMF Driver for Improve=
d Custom BIOS
+AD4- Input Handling
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
+AD4- Changes based on review-ilpo-next with tip 'commit d430124bac58
+AD4- (+ACI-platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devi=
ces+ACI-)'

Verified this patch series on the issued system.

Tested-By: Yijun Shen +ADw-Yijun.Shen+AEA-Dell.com+AD4-

+AD4-
+AD4- Shyam Sundar S K (10):
+AD4-   platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU
+AD4-     thresholds
+AD4-   platform/x86/amd/pmf: Fix the custom bios input handling mechanism
+AD4-   platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
+AD4-   platform/x86/amd/pmf: Update ta+AF8-pmf+AF8-action structure member
+AD4-   platform/x86/amd/pmf: Add helper to verify BIOS input notifications
+AD4-     are enable/disable
+AD4-   platform/x86/amd/pmf: Add custom BIOS input support for AMD+AF8-CPU=
+AF8-ID+AF8-PS
+AD4-   platform/x86/amd/pmf: Use amd+AF8-pmf+AF8-update+AF8-bios+AF8-input=
s() helper
+AD4-   platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating th=
e
+AD4-     policies
+AD4-   platform/x86/amd/pmf: Call enact function sooner to process early
+AD4-     pending requests
+AD4-   platform/x86/amd/pmf: Add debug logs for pending requests and custo=
m
+AD4-     BIOS inputs
+AD4-
+AD4-  drivers/platform/x86/amd/pmf/acpi.c   +AHw- 60 +-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+--
+AD4-  drivers/platform/x86/amd/pmf/pmf.h    +AHw- 80 +-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+-+-+-+-+-+----
+AD4-  drivers/platform/x86/amd/pmf/spc.c    +AHw- 51 +-+-+-+-+-+-+-+-+-+-+=
-+-+-----
+AD4-  drivers/platform/x86/amd/pmf/tee-if.c +AHw- 19 +-+-+-+-+-+--
+AD4-  4 files changed, 191 insertions(+-), 19 deletions(-)
+AD4-
+AD4- --
+AD4- 2.34.1


