Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C7D1EEA46
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 18:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038351; cv=fail; b=S9DphSMcqw4Q1rOIdF9q/j1/n/tPnc7qon9C98hpLWohNkA/XOqJU4QdbbU8vUrkR6JTMXSwbJpa9l7bcmpz5R87Jt86BaQpcWbYaMOZupe9O59f4s74IhkVVoe4IRaFHbG+Yf49dMzZnR+TEBzCqJKl3WWOUQVDfBxr+77zTig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038351; c=relaxed/simple;
	bh=kFc06HPDwU/598Ia2I0XrbEvkmUvtiTM6ubotnAVEWU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kRYV/Pxxy6ywPPom2ibUi8+a7sF4umAGgEfmhh/MblAivGwmSd1OhgvpC9XB8cDZHn9ZMNu3d+kZR/yOcagoJeYaVI0VKgP5lgZkdpKwAOrKArZU2y2csAxrWNYi5crlzTkzb0jVNAa7O1+5WAcn1umq9GHKTTuEZmr08+ztQUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LbKa/baa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SF0fsdet; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LbKa/baa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SF0fsdet"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UHtuRQ021006;
	Wed, 30 Apr 2025 18:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WE8KiTeJvATbpy5eI0GaHPJSaf7sY6EPWLzPOYfqDQw=; b=
	LbKa/baa5P3aTQWFI4HbTeBHM1ITUY7qP1aNiw2kxtmT4bdsj81sygm23mmXi+/d
	h3SepF8FkCVrvdJCHQ4z6+wFc3RGlt4DPutCjnVGw4mThE82oGv6FbKjH5pKBxnX
	ieexK1IbXyXyU6EFSqGAoq5g7oHDHdkT4Uu5ubK9YiVMfr4dnrj3kBY/THj0LLNg
	CyB7o1SiBqksf9Vzw5ABH0Mj+/2R0rTHoqX4ruwTY6cJOwqdbP3ZKqlBSQrii1sa
	oubgAtibdOcpfO9uMU65kbusJEMofdpS81K55wAGwpLsFCmeuB6xXHMjA4DekpEJ
	K9CXZtN2TIT+fRisNo/4pg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ushut0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 18:34:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53UHF7fr033501;
	Wed, 30 Apr 2025 18:34:02 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxbpkqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 18:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Np6Cbvgk8AAzC0aFqBvIJKqdwIEtGeP17ErFtw2JlOtCTBtM33poiRgTh9VWdYGceakYFHzvDlETjsfCgUOA8eaNNJDbQZLJ7/7L/NK+NKA+eyKVAoLRmn8aVqPEqIMmwCmN7c/Pcjn+rRKeM9pjuy33sXg+lk9usLHA87qI3DRmDh4gs6gEoSbW84tc9NW9lQUzWFz3SGOwVJWBC5sjVvnDyIgzrMF6eCc/2sB2Yo1yr2UqtUfm3/EJZCieIllODpo5Qu30qbEPNWhoeeNCXqWJBfTtGsweJo9vj73y8EuM8Pz0ZI/YPVdS2CrHMZkPgoyvB8L4hy3Wr3+pnWE8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE8KiTeJvATbpy5eI0GaHPJSaf7sY6EPWLzPOYfqDQw=;
 b=dfihkOzmV0Y7TvvWEn0TQGbOH86q7bZPcy72SZKVvZVhJOwkCbLkrIX5+H/HsKbvhc1dMlJNDsblDHVE3itTBQUU5uMo88BHU4pq+ppG+GORsFXLKgAJNPBCUwEdjMyVMr3bewUVER1AW/fjgtUKNqQOz+YTQCtioMEem16P1BQIXLZ1PFEvEu84lA+QeewcFtprIOTt1TS3VSEObKcyPuETzdmcBYT4T8bvnCw05DzY3iKtpr9fjYIRDnmFeSBM2Z+1jUhML07nYfBu9l9Ii5xizs18YpeiQM1B+l0mPwAxGBUHTv2Apcs/fREHVFHVdw37UfVauqxYK6CaCRGplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE8KiTeJvATbpy5eI0GaHPJSaf7sY6EPWLzPOYfqDQw=;
 b=SF0fsdet0UUfPwJZzMIWLgBmaqQMaA872MNWyQHfrFVlpbbaGDdo1PggGK4+/53vp1dL9KXV86MNNyGFXoJyMTjykxuGCahdVdSbrn2IJyEHdurRG67Q6DjbffEWFjdSIdT5Jh4af6YcEMv64c7cqLRHpJ7u4oCLhFgQIhq3VtE=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BY5PR10MB4178.namprd10.prod.outlook.com (2603:10b6:a03:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 18:34:00 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 18:33:59 +0000
Message-ID: <d0e96c31-2cd5-4861-aacb-02053f5d6d47@oracle.com>
Date: Thu, 1 May 2025 00:03:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH platform-next v10 1/2] platform: mellanox: nvsw-sn2200:
 Add support for new system flavour
To: Vadim Pasternak <vadimp@nvidia.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com
Cc: michaelsh@nvidia.com, platform-driver-x86@vger.kernel.org
References: <20250430155651.49732-1-vadimp@nvidia.com>
 <20250430155651.49732-2-vadimp@nvidia.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250430155651.49732-2-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BY5PR10MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: 860222a3-2c51-49a4-43ce-08dd88159280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3Z5NG9tdXJ4RkJ3QnBUcExoOTg0WnBBaDArYk9pVVExRzBDNnQxQ2xxQTJt?=
 =?utf-8?B?K2FYZjlHRGR3ekIzai90TXBlUW9kcHZ4NVV0MnBIUEI3VGNiazgzbmFLcnZ2?=
 =?utf-8?B?SElqbGJ6NWltOEJVbVJlOHhac0FScnRGME41UENxQ2dtMUNkbWdMRFdHSmI1?=
 =?utf-8?B?bzh5cUMyQ1lveFYwM1U1Zm1yS1ROcUovbzV3VjlJR0dsMnhkK3dYTEJWTE43?=
 =?utf-8?B?d3gvb3g2Mi93NFZNeVJFbjErUCsvRysyc095MFZNTU53bkxWR055S0ZMMVMw?=
 =?utf-8?B?bWdwaUVRanQwaElBaTJVbHI2YnBYNWVwaGpRY1M0WlgvR1R0R3M0UlhTQzB5?=
 =?utf-8?B?a1ZqWEV1ZFpwY3c0M2l0Uk1vekVEMk44azY1NXZUa3BCTXQ1TGc3MjhObVYr?=
 =?utf-8?B?M2p3Yi9vVFpkZ1ZvQjNKTzZCSHRQWUkyb1gxOFRVZ2YwZGhZYVY5bWE2RjNl?=
 =?utf-8?B?K1N1NU5kVmNIZCt5SUZqN2VWRXRhYzkxMnFaU1ViRXBuRVgrY3k4alp1WUEv?=
 =?utf-8?B?VkN4ZTNIUHpKblFwV3N4d29iczRzcVYzeXVRdWxMYTZDY2lOZ1BsTGxraXRy?=
 =?utf-8?B?eWEzOXFsWXl0SlBFS0tUWlh0WEhpWUlVcFEyeVBmM01ZVU0valJEK1gvT3Y1?=
 =?utf-8?B?SktsMzczcU5xeFI4aFFSZ1lvdWR6MHIzYlpGSHE5UFpVMmFzQXZmcnQ4UDZV?=
 =?utf-8?B?NnRsYjlsQ2tJZW52WWN2YUJmMlFpYWNCKzRBckxBekdtTzE5T1lYQjRMVzV1?=
 =?utf-8?B?cFhHRGRDcFp0SThwcnRLaWtyR0E3aDYwRVhDQkZ4VnNaQVMyeEpkTVUzN1Vo?=
 =?utf-8?B?TDhXWG4xcHoyYUVSekFRbFliZ09XZzFFR3FpUTRyTDVFSDV5Q0FLcHFoM1Iv?=
 =?utf-8?B?SGxHb0hCOFBVbHhqcm1OenJHSFJ2bTlMY2orcS9zQXdnT3NDRnhUcWlSU2Fh?=
 =?utf-8?B?VWEzWGpUMjlNNjQ5cWF0d0srV0NnMTNyS08rS3VqM21NbUhac3cwdVhaaHE4?=
 =?utf-8?B?OTl2YkV3bXV3eFFXZ2QvWE9nWlFBVzZGZW9YTHJ1MHNLOHlDY0NHRy9LRFpL?=
 =?utf-8?B?a3RhUUkyUU5DakRLSnZwaERRemYvTDNUem5ma0VNN0Qvdks2bUR4cXRqcWFU?=
 =?utf-8?B?WWVHbTcrVVZoMHFqWVFuT3ZLaUtmUHVFUlFYcW1sTWZka2lPQ1ZWa1Q0RStB?=
 =?utf-8?B?anBPNzk1WVBrUVhrQy8zY1RFcTVQZUhLdkI5ZzluelFBcnVxc3NMMkc1QTBS?=
 =?utf-8?B?emV5bXVub0MzUkN4MGhJVVd5NFpVTW9LMlBXYnQ1NHEyeVFvOHNndUEwQWxt?=
 =?utf-8?B?dHZoaG53dUlGS1dCOUd1OEFpSTQ3NStXUXJBeVZQRkkxRDFuSW1VSFZQbUMw?=
 =?utf-8?B?eUdNN0tsMlZjRTZtUDM5VlQxalV4aXZGQzVURXVia2pWbjBlU1dEOGgvVTF1?=
 =?utf-8?B?bjhaWE1yWUQ5NWZHK0xzd2xLOW51dldXZW5aR0RvamE1azc3K1ltem9Ja1px?=
 =?utf-8?B?M2NTOW1ldDd0L2FzSVZzU2NnWTY0WkFSL0w3NVFRTklOUDBKZElSUlYvQnBk?=
 =?utf-8?B?ZDJlMENQSUlPV0h4Q0x4dTlYclRXUXV6Z3V0MjZkNTkzZmV0SHkvYTdPNVJZ?=
 =?utf-8?B?bkZMSllnVHAzL0pjZ1RTbW1OcUFoTEtkbG8rbW15Rkk2V2E3RzFDc2FuZkhO?=
 =?utf-8?B?dHI2ajd6RkhLWEthNEgrejljenZvV2xSeXBaWnBxV3ZhclpCWERlTzE3UmJz?=
 =?utf-8?B?YkdqT1RXTHljWVM2Q2lkMlZOSXRiR1AvMTVLMEtUN094aE1PVitDYzluS3hS?=
 =?utf-8?B?eHhWYTE2L2dOSGdmRUkxTERuNURkZWdRWm9QbHc2NjJoUTFPU0Q4WmNQVnpO?=
 =?utf-8?B?WENTcmdPN3lYOTlLWWN0RldISXJPcGZMTXgxMUxSQ3ZBWVh4UVg3akUwVjI5?=
 =?utf-8?Q?Dl5qp/E5Jqw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDJiaUR4YWNUdVBITjRrdm51VGZ1NUU4MzJUdW02MDZsUXRhcy9EKytVTUFS?=
 =?utf-8?B?NEtIaEIzTDdwSVVacTFaSnllbERNaEFHR1o2WXh4a1VEbGNlZWFNTm16UjJD?=
 =?utf-8?B?aDBhNU1YVmdITXBVa2NWa1RxY1Z5UzgyamhzaThsWGdFckhQSmNjSyt5RHFa?=
 =?utf-8?B?dWw1Ui9iSFFzMnF2Q28yOVpOc0FYTkVMVHBmTmZVNVh0d09QNzZuTXhpNDVm?=
 =?utf-8?B?UWl6S2E4eXBGT0Jic21xSENCVXhuREgycDJnSzZQRnJ5NXJIa2ZuTEJ0bVFU?=
 =?utf-8?B?RjdXWkNYditCdVRHUzUrNUcxTWl3Y3dzQUY0MUZwbDMzck83L3VwenBIOUM2?=
 =?utf-8?B?QlZaSkdBQk9POHAvb0w3R1BzUVdvcXJ6WnBnL1l0SmY4a0JZcFdYRjViRWZs?=
 =?utf-8?B?TS9pREMzSElTN3poL1lrdnh3OUFFS2R2VFlMYnBEdG5WTVc3c28zNk9LdTdR?=
 =?utf-8?B?bVArSmpKb1Y5YmZQdUdmVlEvcWxieHErN3hZTTMyS1NXUDRzQXhDY0NiOUJU?=
 =?utf-8?B?ZHBhSE9BZzJqMXVJdXk0TmNucWt5dXpRcGFWS1h6YnJ4R0pTU1hGYVZCczla?=
 =?utf-8?B?RHJ0Y0l4b0tnYjBrQng4aGxOeWJHdmtLSjRRK0pqNG5TRlNYK3JLcTJaYTZF?=
 =?utf-8?B?bVhFaVl3cGU5T0YvTm1DRSs4VXdoNUNWTWl0NTZHMS8vNTRhWUZYcXdCS01p?=
 =?utf-8?B?OU44ZW9SVGNydVRmR1QzYkVOMndvbVY3YzQyS2psT3dtY0NYL1c1RlNsZmhP?=
 =?utf-8?B?cktqbDFhKzNTWEpMNGp4TGRTZEt1TFpaNVJFa25SelBPSnEwS3d1WUJxMXVB?=
 =?utf-8?B?alhmTmhmdWlJYStDaEZKZVgrZjc5VEtaQUpKVWRaWk5uUkczcHQyVDA5TGxx?=
 =?utf-8?B?Z1NheFdPelVaRjZNdkwxcXhaZXg3eGpBbmNVbi80bU9GZmhrRzViRVN6N3JB?=
 =?utf-8?B?VGNMVC8zNlpYNXN2MVRJZjVib3N5K2V6bS9OZmhZK2tkNnhiSnh3R29acEVE?=
 =?utf-8?B?cVJWRURYdklGNTczaXRYQmN2b2N5UTdGbTQ5SzBwMURFM3JBSUE4NVNwTzQr?=
 =?utf-8?B?WXA1N29QalNYOXhacElIVFNVYVRROENPaHh5NjJhL0dMZ2F1Q3EzaU9qdWZ2?=
 =?utf-8?B?ZGFXbkZPcnpSWS9OVy9PQU90Y1BrUkRpMS84SWFVd2xHZldFUGx3VEFSYlF3?=
 =?utf-8?B?T00weVFXL2xrcWtaVXc1V2FzTDhEZnBjOHg3NGQyZnFJaGJyUllGeG1KVzhQ?=
 =?utf-8?B?MDhWL0lDclhSZTNpZlZJQmVPbCthK1cyT1FES25LalMzV2puZlBaUjY0WGFC?=
 =?utf-8?B?ek1KRk1LUmg0eVdvVXAwSmljSDNvZHpCWCtvNWxoYmQwWFNvN05uYmE3QnB1?=
 =?utf-8?B?YXZBN2RCZmtPdjRpWXdLbUtDUDg2VUg5OGdpVUVnN3VBaXp1RDg5NVFQcXVM?=
 =?utf-8?B?YTVzU3lIRDBIOHRhV1Vyb08yRWYrbDM0MXZENW5VSVdINTBWUmx1NnZzNmNu?=
 =?utf-8?B?MVAyc3VDVU5QMGx2YzBud2tGazQwNUtLZUVLNzJrT0M5N0dPa1Eva3V3K3F4?=
 =?utf-8?B?WENqWWRHTzFoM1NnZ2lQY1dhNS9vYVFzcEFlTFpXVzMrWjFiODBPbkpDTnRO?=
 =?utf-8?B?YytIVTBpMU95OGZMVDIzd3RFdEZySTBidzM4S0N5Y3RDQm1WUDlFaTE0Vnpn?=
 =?utf-8?B?SHZtck5oMFNZQit5dUJtK3dSd3dPc290YU5oQmxPQThlWmE2TytXK05JMmNN?=
 =?utf-8?B?c09vcllYdzRGbmp2SFBSQ2xVUVNHdVMyODZhR3ZqeFhqYnlucG9ybTJBNWtQ?=
 =?utf-8?B?TUlhQlhPNjljdHNlbmkxV05QNlllaE1VeThvbjhWZFlWL01mZ2JpYzlKajFJ?=
 =?utf-8?B?UHpzQjNlMUozT3lpajRWTTN1aVRXbFo1Qi9MVXczU3k3eEk0bE40Y0ZBM21E?=
 =?utf-8?B?UmkzWmY0WnBqSVBObXN2TDVBUi9vS1FoQmtTS28yWGJNWm1rZjBhSFgvVC9q?=
 =?utf-8?B?cFhXdGt4UmN1dGUveUlTbWlyYmVKSFB3ZDdyMDdLNFYzVlFUYW05dEdjb3RV?=
 =?utf-8?B?ZU9Kb04zUFEwdlltaFJrT1lHUlpvT2wraXpURm5NQlJvY3RwTGEyazZZZVVQ?=
 =?utf-8?Q?3kKTpO+CcSc3qYn5e2tvHQyLi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Etl58xP9S0b/omq19l2yVKtpoe3Nsy/k402XpbXt+B3/bUzQ8zKHThaa2BL7tka3tpAfd0kkNPUCx4quLv/f0q2Tf/BJ8SKQQ+6gXGXpliifWx+I4kUh3S0wFLltafLg/4oJda984KZgdwjPhYYm3CBQ8Jeb9l6ynopxBEYInFzK+kA4hBFPzQ2W37NtqJ/et1k7Sszy8VUyuOrn/qk/ZfZJJsZU0eHVjlJtSP1iH6bZwZHvkAldiHXFE13c4PdeH/ZvprK0Ho7oSzmyFd7xyYIos58rC6dGLX2rVt9xudmEAs1/gtDfcDLEN2gHR2opYKuamoMBSCoIPgRrXqM2KEKfPB6x+UtljbXx54ChE/46hdTbcx+JUuRyTWi4kem9LVEp7Ncls4piEQ4k7PTUcYWe2M4pfGmHmnoRzTszV9689pfEX3B6bN8CBV/rtDyWqNtWNg3S0fyC2/IuF9IHen+u5Y3COBjW83Oj0wKC8084JdAQxt/WkKOTZTJJVhZ91SifBAaCOps4Qm73Dfg/ZGfFBcD/OJ2oQzdQ7Qz+ZwXy7lZxNW+d2tY9ykQfSbfKqgqDlFZ/ypBQ/WBiMsEg8sM+Y6IrWMPtXFRPitNM14=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860222a3-2c51-49a4-43ce-08dd88159280
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 18:33:59.8116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nxy+tsgObKHjd7W79kNexBjvo7mE5JA52zV4Q+DkGYLGwk+thiUprrRbc7dc+QTO9oGfLdMwXEi7hNaeKEZb4yJzOQItwUiXTX3UH5W3lRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504300135
X-Proofpoint-ORIG-GUID: A8H0Oyv0sV9OodM7jd9cnMRtf6R0wfyV
X-Proofpoint-GUID: A8H0Oyv0sV9OodM7jd9cnMRtf6R0wfyV
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=68126d1b cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=r5vVh0GQcWmLug20sxoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEzNSBTYWx0ZWRfXzW2qq8/XKgyI KMHMHvgvDfJBGiGo/ELHBRAjThd2H7aXQL4H61TRpg0waLkOR1CF6YB97/gh/2j5IsdSCr8q9T1 wvkfrinwxW1twH36d6V0MBS1PKcTpPD48trOTqHUABU/yU7p5fmih2J7tro5ciKEJdmR+hdDoqW
 Vw3wykf7K6UH7AfhWMteRlLZoQJZwNR1VndY0Dch0dCAiKTECAxoZWtphkn+x9MuAsPmaCAnaHg fpMVXIyCUKkz8b/JHn+EbRMrgs2ykt78W+cZGp4dQ2MElu+j3nyCtEWypsiQoMehCIrFEgNBHM/ 4kmW99i/pDeJkLhByI+X4lTvSvKnEf+/60uyVdb2JInTddiTH6sue36yboLJEj3HA8/QnvKs4YO
 uBC2RDP/hlq4TW01rPukoROqdTn2LoD2BtudlNd9Pi68xRbvA/jqDZgpC0S52k5v2exsc0nv



On 30-04-2025 21:26, Vadim Pasternak wrote:
>   /* SN2201 default static board info. */
> @@ -607,6 +645,58 @@ static struct mlxreg_hotplug_device nvsw_sn2201_static_brdinfo[] = {
>   	},
>   };
>   
> +/* SN2201 default basbar static board info. */

typo basbar -> busbar

> +static struct mlxreg_hotplug_device nvsw_sn2201_busbar_static_brdinfo[] = {
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[0],
> +		.nr = NVSW_SN2201_MAIN_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[1],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[2],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[3],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[4],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH3_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[5],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[6],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[7],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[8],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH6_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[9],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH6_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[10],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH7_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[11],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH1_NR,
> +	},
> +};
> +
>   /* LED default data. */
>   static struct mlxreg_core_data nvsw_sn2201_led_data[] = {
>   	{
> @@ -981,7 +1071,10 @@ static int nvsw_sn2201_config_init(struct nvsw_sn2201 *nvsw_sn2201, void *regmap
>   	nvsw_sn2201->io_data = &nvsw_sn2201_regs_io;
>   	nvsw_sn2201->led_data = &nvsw_sn2201_led;
>   	nvsw_sn2201->wd_data = &nvsw_sn2201_wd;
> -	nvsw_sn2201->hotplug_data = &nvsw_sn2201_hotplug;
> +	if (nvsw_sn2201->ext_pwr_source)
> +		nvsw_sn2201->hotplug_data = &nvsw_sn2201_busbar_hotplug;
> +	else
> +		nvsw_sn2201->hotplug_data = &nvsw_sn2201_hotplug;
>   
>   	/* Register IO access driver. */
>   	if (nvsw_sn2201->io_data) {
> @@ -1198,12 +1291,18 @@ static int nvsw_sn2201_config_pre_init(struct nvsw_sn2201 *nvsw_sn2201)
>   static int nvsw_sn2201_probe(struct platform_device *pdev)
>   {
>   	struct nvsw_sn2201 *nvsw_sn2201;
> +	const char *sku;
>   	int ret;
>   
>   	nvsw_sn2201 = devm_kzalloc(&pdev->dev, sizeof(*nvsw_sn2201), GFP_KERNEL);
>   	if (!nvsw_sn2201)
>   		return -ENOMEM;
>   
> +	/* Validate system powering type - only HI168 SKU supports extrenal power. */

typo extrenal  -> external
/* Only HI168 SKU supports external power input. */

> +	sku = dmi_get_system_info(DMI_PRODUCT_SKU);
> +	if (sku && !strcmp(sku, "HI168"))
> +		nvsw_sn2201->ext_pwr_source = true;
> +

Thanks,
Alok

