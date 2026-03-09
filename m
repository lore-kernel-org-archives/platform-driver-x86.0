Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B06DC2FF
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773045053; cv=fail; b=tkLJAoVQn7WrRKC4d0fQ9/1B8kO+6W75l0Y+nKNGipU55HWJQRnVH2buzvdefIRY3GYTY1WOwCC5vmMWDUdFI5u4TsBaBMFvEPnVdnjIoqStZnJYplFePAvn+5vEtN8AKuXQu4YINW+hP/LfRQLCT9ynDZPd4njZyK051ZsH6mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773045053; c=relaxed/simple;
	bh=6JTfvQVtgGoP9AI98ahbJlxafeok6KngnMd4gGt6Vmo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KfbfP8hCY/djFEwiL+3Iu/T7bE0PT7ngY0cmVL8IaCuAHvWVvD4pDAEnr/f28GqffvFdJ882evK2fxSi9rlP+JkiXfMCmGTf4CSbrDerLUxuHubdKv2izddxK0ItU23Cf+nQ5LjM9MzyN89ULLe2BiO96L5sOACxSmRn0moX7TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g0/2e0oq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fcEJsHO9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g0/2e0oq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fcEJsHO9"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6290dBiR1126580;
	Mon, 9 Mar 2026 08:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zDXstBGKNX6mZGy6zwGnLw07TNVEdcPWlwBdCxotKZk=; b=
	g0/2e0oqVsaVRMzBOnqF9ekD2MHVw6qxFUDn+8/D3NTj8bLqy83vS0YaxVmV+8Dr
	RjyWcPrvsmz81sSQvHxjd4YVhXuNQKkIZNpsw/jT5Uqhsof7JRxFSVBgnjgLiiVe
	ZUEOd+SWIHWjPkMBtH229ZsYvSbZKnbpydaAcG6yrOuVHumysLxz90x8PLlxSCzj
	R23QOV3czlM881QzYdy6S7eF8mi/Iiwce1g7xFLIb1lyxJMRf/1L6kxcZ8FRkhLg
	+4qVX/RxMCaB0CMZnl9wZj2U/pKb3LlBqw9Y/ctUNT/lWQxp+2pKq/6rm8CRqrLJ
	vHJ2SQsYu9Xz9IblPU4K3A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cskua0c3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Mar 2026 08:30:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6296K1KO039611;
	Mon, 9 Mar 2026 08:30:37 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011004.outbound.protection.outlook.com [52.101.57.4])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4craf8dwsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Mar 2026 08:30:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yT4uIeY55TPx5GQYZJMvfXNwMny0eSRv4gfg50tGln/jG186DA2QehC3Xpbu786EkV2XZFBgECUAcyh5zFj6cXeO05H07n4Xlw5S+HbkOP6hRgFhbZNG+8YYDFyFQOh0LCgSHXbApLMu1TGuvSZYM5nYeB4ebW5dv6gPnV0WYnhh1DtomtNmxPDukjEyHy/ETcQyVRFyrgS3s5jvD13lpXLQIo8VW/eUHDc2XXPjVkbVRCHT+v5mKsQJP8gnFIRm0ftLEjDUncQMHSvMM6ZfAD7a66edN8Qt51oj7vexelE2JCwH8EfdkIOLChlED5ZUp3e3ZC/HBB3aulOXOSJbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDXstBGKNX6mZGy6zwGnLw07TNVEdcPWlwBdCxotKZk=;
 b=NiBg5HOJrmZbeSEEsESpA5qIsghww68aUs2fBmFledMyKVOE4UOtmH7+IsmkHr6bfHwFJ1Ummu0wBdwbSNMP/4aeNVMIOz+rueERL7EgxL1OXwRlOhOwuu/hRmJaq6tE54zz3TF9vGbLQFMy47nekqSmb8ZkO4XHiagCwiFLjtHtKedpiM65H4YvL3qqEJkBi2cboih+tqhPua2lfQVYKD1Ti+TnkMC6Xw3ld/HKJF5sB10iy42WD9/6A34+uqwyALifz87e0egZImQGxGF1Hnkzwzp/QPo06WMxAInrCoMVeJp8O6qjGOxbZmDyXXCKmbotuBF7LQb09PfsaH4YfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDXstBGKNX6mZGy6zwGnLw07TNVEdcPWlwBdCxotKZk=;
 b=fcEJsHO9VR1VchfUZbqhq/3+1VxClCLRd6EWK7bC8U3TbzlPmieg9F+jTCLuPz+2k73hBKDzjyKCh5rNY9M7D8JL5zoE4/Dzu1NJdHlD6qbmJhEgGLSjYN7Sedkgk1xzTsxrIu4yOf2sSAWAWEk4raLSd6CgLdbMEw8l+R5LWtI=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SA1PR10MB5688.namprd10.prod.outlook.com (2603:10b6:806:23e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 08:30:34 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::619b:1264:c089:7e90]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::619b:1264:c089:7e90%6]) with mapi id 15.20.9654.022; Mon, 9 Mar 2026
 08:30:34 +0000
Message-ID: <48f71ade-6dc4-442c-87da-1338ca554b43@oracle.com>
Date: Mon, 9 Mar 2026 14:00:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/olpc: olpc-xo175-ec: Fix overflow error message
 to print inlen
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: lkundrak@v3.sk, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
        alok.a.tiwarilinux@gmail.com
References: <20260307190533.3025563-1-alok.a.tiwari@oracle.com>
 <3a9bcb9f-b38d-1d9d-c1e5-211538aee5e8@linux.intel.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <3a9bcb9f-b38d-1d9d-c1e5-211538aee5e8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SA1PR10MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8a7074-cce6-463c-0fc4-08de7db6221e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	atvoYkyRgptbj03RSPkqabyyE7bct7/uAhc0LTMyclcKVU3N/sLtDLOioT0dSvmm57Khh4X/Bq8PUvNMZZbXBYSYw5xsh5lnwhwxxOZGztdYrroEW0bsRlGG/NToMKJAhHlbzvhldT7D1cjvCWQa3ZKHHyMUeczkpuq6MeWyH/QedmanZGu//mX1sA06Z1scoUhTr126qSiSxqFnZegktWVZcfcE705BiGw9yzu/gmHPIqnoHBAixiHsprwD9eJL+L7ZI7Lax6j4OMxY6FTekIjGi6XiQbjDNf6kdTn5T5XXd5uOgGo/PuIFHdeZv+5TfhhWX74VjftRmnrx4Fkb0CbRsFngKx67hpiznRdOrkvxtbNmXi/PIsAwIzq7p7PZaaRppwTD0pkIWECozjsNdcwfDZnpmdnmOb+3rN+j8i449+MpcuFPKM6v4LhCTeLmrwNR7Z4BiRsH94nuaJGoRlNIWes09YMb11k8jlaPJBm0QHuelO1eLSBY8sY1ciTaXEy7gC0cJTlhCUInGZLU8NsKLaLC8U+yGWDZ1pLg6pYOR5j/FBTaUJRjA/YEg3pdIb3aZVExOAHl0mOW0YoeorNBEXEjVbOFSfbt58ZNnFBUYJCcqCoGpGktDSBoRNNLJ6zsEi5ANv6fx08zUfzt9Rx3g/r8fdvZeLbO55fglCVxEQLhU1Hmn3u2gzg/4KFGdHFYgDh+g2ePavAu/wXaFkyFPX2qFfWnb+JkaZHkRGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?engvbDhDcHR6ZUpsS2E5eHNLMGZET1lLcFBwMSt4bUtjcDhZb1N0L3liUExY?=
 =?utf-8?B?ZEs3SHZlZXgvTjMvQ09Ec2VsRTdEdHpFbldFeW9QSUFlaXJ4QUJ2aHBOZWhV?=
 =?utf-8?B?UjJtMitBb3RJVVdsWVkxWWE1Q0RJYXlXaDA4VXhFV0xuTE9Ocnl1eDNVazFJ?=
 =?utf-8?B?dVJ6Z3dDNjkxWFU2QVFyczIrOWhPbzRXemV5R2p5ZmdLTHBPT3dPTmNGQjVL?=
 =?utf-8?B?WGw1R05OMkVQaUdrRUxqZEp2UTBWL0U4M3NrU3AwSjVQSysySWxnd0FvK2hT?=
 =?utf-8?B?Vm55Um15azJzcGYyWU96SnFNMXJUSDlkSEJqV0piWWthMVVIbTRrNWt4UWQr?=
 =?utf-8?B?eExWOXVHQzNRVlo0dHl0Tm11eWVVWFRkY3ZXYU1KeDBySHhzbFRRWkhNTUh2?=
 =?utf-8?B?Q25SeWdRbFVtMm5ZbTFVN1RJc2EwckhpK1RhbU14dFNTNlAxcW9tT253NUNx?=
 =?utf-8?B?WnRWc2wvU2pRYTM1bituRkV4MnMzdXdscnY4UytQSEJQRU50SzB0OHh6U1Zr?=
 =?utf-8?B?ZUxvMHk4bDRSUU05aER2UW5kZXpLVi9nY2Y0eWVtd1ZGVzBJS2VBVXNWWTg4?=
 =?utf-8?B?U0V3Z3ZvU01nZXE0VXRyV3RoMGlZenQxUWFQV1NRaTd3enhBOTdOL0tuSUw2?=
 =?utf-8?B?NUE3bWxRZzQyaTllbjU0YUNwRzNqVThIcldDQjk0M0ZKY21rTnRmWXl2dUIy?=
 =?utf-8?B?RitBdEFtZW9HK3I1ZDNWNkpod05aSyt5UDY0Zk5OeWl5cGxrVUtEYnVMSVJm?=
 =?utf-8?B?bUh6UGlGU09LRnIzMFF5cVIvUnYyOUs5UTE4MEZqN21vMzdnbUtNcURXbXBF?=
 =?utf-8?B?NWR5Uy9FYi9YSVJvbVF2cXdiQ0J0NDVoaGxlWmo4ZWRjM1loYlNDRjFjL3NX?=
 =?utf-8?B?V1ozRTI0L0Y1d3lqaExJdVkyc3M1eGlidE8rTlZ5NHIzckQzK0dQSmhZam1V?=
 =?utf-8?B?bmErOGFtekxkNkFPa3pLL3JkbThhTzJVWFUwVm0rRzJleXhMNVFhNlVzZUtm?=
 =?utf-8?B?dXlRbUN2UC9HelY2cE9jejcvKyt6MWxKanNlRUk4OHJ4K0JleDJBOVpQV3Q3?=
 =?utf-8?B?WFNnNmo5bXZNTjJLVk1ydjRlTjFZUVEzUGw0MnpmbHNMOXBUZ1ZyNzBlUWNH?=
 =?utf-8?B?Z0VoMHdOdTFnTnhJQngxYXFvSzU2VGZxN1Ztc1JXUEswU3BLcEZwNythc3JH?=
 =?utf-8?B?YXhlZDU2eTlPZzRQWDJHYUtNODlWeWxoZHVDQWp6cXh2U2orMXN1Tm56dC9t?=
 =?utf-8?B?eWVBekJLZ3lORlltUldEVE5TOTlic29vTVpCR1RmU0MwdFFCL1Q4V3ZhQThY?=
 =?utf-8?B?bW1iZjRtL3ptdjdINlB1ZEpDaDhkMU9QdUE2YjF6eC9yeC9HVVpTbEgvcndS?=
 =?utf-8?B?NnZyanVtNERCWXNUbWFCWGRHZkdVWUhkNEpIZTBITEM0aUpITFZONkNtMUFZ?=
 =?utf-8?B?MlpYekluM2RwZ2dNbTFtUHU5QWRCTEcyRXQ3TE4rVVZNb0VQd0tFNnZBZnBT?=
 =?utf-8?B?NmJlNHB1Rk1TMXI2bUl4RzYxNFNzclF2T1h0VWpmV2krc3RFeXJNTXZDcnpE?=
 =?utf-8?B?N1Fhd2F3eFFnU1RDWDNzZTVsc0RZMlZyS280OHpUcjZCN2VaMUN5TW1VdmpF?=
 =?utf-8?B?cS9UUzllS2JreXI5dlY2Q210aEI0MExweXEwZnJON2doRzdLSms4ZW90RTMx?=
 =?utf-8?B?UHlXNXh0TDljMmk3MW9Fd2s4TC9Pb0NjdFk5YmNlZFZzK2puWHEwUjd0NkJs?=
 =?utf-8?B?VytDVXZZUy8zNUxBVlB4Uk0vdEJ3c3FDbW56L0h4REU5L0hZenVZSU5XbGZ3?=
 =?utf-8?B?QzRmeG9FZjA0TDNUN2h4TnFPNTFpS01ZNDcvcWFDNlIyTmVXS3BkVWh6bkxl?=
 =?utf-8?B?dXUwNFpScDNRQkwzZzhKOHl5UWxqL0ZjWG8rRHpOOEhTbkVSVUxmV0ZsSXYz?=
 =?utf-8?B?N2VCWGN3MG0vTDNzNEFCbWJ2QTV3bGVlYlozRVhuOGN3Njl3M3BhQnE0WU9T?=
 =?utf-8?B?Z3djU1BNeS9GdkJkdG1ZNXZ6UWFKejhJS1ArRkZUWHRPcXRWbnQxTVBiVUln?=
 =?utf-8?B?R20wbnJOOWRLOEZZRVRDMnRUUjZ0SE5MSW1PUzZSc0xsVHhJc0hwZlVCUGdW?=
 =?utf-8?B?UmJiaTR4Q2Qva2JvOUFsTE1pdS9lVDRaK2JPSXR0TTRiYTVhc2prSU5uQk16?=
 =?utf-8?B?Z0dJNlhPTVA4ajBsT05SVFM1djBzWXVpNGlNNHVxenBucHRrcnl4VThvT0lU?=
 =?utf-8?B?SkpuMzRubXUzdkZUZkZHak1IRzhER25QK1dobnErL0c4QUZZTkFIeGRoYXVH?=
 =?utf-8?B?ZVBBNWRGSjBEWlRGK3M2Z25tcTJaOGFTOGoreEZmMFQ0U0t4T1dlMEsyWG11?=
 =?utf-8?Q?bUw+FX9ZTuFVzF64=3D?=
X-Exchange-RoutingPolicyChecked:
	igBM/EvtWHMaJU4Vw44Fo0YZh9u2s8rox2Cmpvofv7mTtUKZbLNNcVaPALyRg/xB04TfwckpvprdwL+5NEvqPYZByKqx9oq2TqsQ4PsPhAeYRA5y5JF5y872d5XKt5tbSUoswlywBzwUnUD6ANSfTpzja4/307KIlctMjfGQSrOWkn4l+HPrIKPxHaAR2d0pYKi/M4MSLcKp2FkWMZzn1Zv1OQqNYiMflN4DrbTaVJXEz5OqKetbS1fDgkwz2MiR0gLSzBI0sPykBvWWbMXpVlBiszqgvw1MBo151YcLWtM+u3iOB+Evd0gxiZhwh++7nUSZqR2uo49VTiO/I1wB3g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8GdynHdue8txNznFxq028syMzvI++gMBet8IcrRwYLx2z6C006lGXyrL6zyODitgD1KX3DsJYym7pccpWU1DANAJV8qB00F+3sJa6FtF2IZoBwT6Qh5NUCjIrcNZwCbkgR9LhG3jLPL80BsMdIuxgfvCe+7Re07cncd9xF3Udn8F4jyeRbTLDGKR96dhQgiaYGExEdRIjKsv58mSZUj9ePh3C4IGVf38OdYE2gGT0Kugz7s0rXkj4fP8xpkzgZDLVnQSHYhgjeuAd81emozj0YiswhCfz566EEZafmPlP6G13GFtVEloobpOOYp6g2ldVRf3ftEtd/e28l5rjvZp1jLa+CjsfKGz7qgIjCy5QWI4rYz7d2p3aqaaExkMcxDrG1ayjPpmeacWMl7FxxICsSpfZh9JLxrZcxonw9OU0OgHgCRHFsKwIFJt8ZE7pmRgKeKWQmRUKqD48a6BZuKyMl709pPKfi5znhCE1bh7HX26XBlbaZ+ZIicMKmlYOdPS4mUXs/jg2jA/VK9cWhAF5+oqvS1t73aVvQsxIKuEBzWeXuU2OwAqpB83fL9ESyRPWEFguYtqLQznOkhtdVh4dkigrYm6cT+x9sEY8xXc9fo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8a7074-cce6-463c-0fc4-08de7db6221e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 08:30:34.5771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kK8dCeOnDW8b8PyuVSZqUKPdXq/HmCS5hV4y+S6sj1InOGtLJxAOZukPPw4UqGwXe9AI/BPpdpSCbal2oDtafo/IWo/BVjprpdNpWR9nxDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5688
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603090077
X-Authority-Analysis: v=2.4 cv=Methep/f c=1 sm=1 tr=0 ts=69ae852e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8
 a=bE6pFDG1spdH7zpvk54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA3NyBTYWx0ZWRfX1XLxG+EPK9s0
 KxoER6lz1zhpItMbsJ1dCWTKUMRRgtyHa4MS7Kg4FYwDq89MhMwroH6euQQ1wLvXoJMPNYrnJHh
 blbYAmLEN02BkgWODrdOkJYNeLQYYEu5vjurmdNknCGR5XhHbkkuHWjSRaKr+et6NqBoWSB1cAg
 Jn7orvkEy40rEUFtxU86eTo583c7wXOhcQBLlAMfVC00H5xHqEd1ElFZbcbR8Xq+CB0U3N0b9Y7
 EBnnYEgndqTTTPzRyHN6INfaWRvoEp4jKClxxNhY3pSKWVDguA1I9g2q5U6K7a5g7ET3D9tFLEq
 L2Gzyb8hHi5TfZmmzXH//upNxKMvY5vHVrE3zf83sExeBS68tDvv7PE8yxRch3+Z+lsk7yiXPRX
 lbP7qLQ5rJk6DphivJyGJwkL7X3cdhTV6P1Fu71UR7dP0CN1LLXfJ3EWNDhlYea9X7rodq0rNXj
 2HY7duYnKpXY8IJy4Ag==
X-Proofpoint-ORIG-GUID: 28uA4WsuoFdHJ0jVQ62p4852ObL_-mIx
X-Proofpoint-GUID: 28uA4WsuoFdHJ0jVQ62p4852ObL_-mIx



On 3/9/2026 1:48 PM, Ilpo Järvinen wrote:
>> The command length check validates inlen (> 5), but the error message
>> incorrectly printed resp_len. Print inlen so the log reflects the
>> actual command length.
>>
>> Signed-off-by: Alok Tiwari<alok.a.tiwari@oracle.com>
>> ---
>>   drivers/platform/olpc/olpc-xo175-ec.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
>> index fa7b3bda688a..bee271a4fda1 100644
>> --- a/drivers/platform/olpc/olpc-xo175-ec.c
>> +++ b/drivers/platform/olpc/olpc-xo175-ec.c
>> @@ -482,7 +482,7 @@ static int olpc_xo175_ec_cmd(u8 cmd, u8 *inbuf, size_t inlen, u8 *resp,
>>   	dev_dbg(dev, "CMD %x, %zd bytes expected\n", cmd, resp_len);
>>   
>>   	if (inlen > 5) {
>> -		dev_err(dev, "command len %zd too big!\n", resp_len);
>> +		dev_err(dev, "command len %zd too big!\n", inlen);
>>   		return -EOVERFLOW;
> Wouldn't a Fixes tag be in order for this?

I can add a Fixes tag and send v2. Since this patch only corrects an 
error message,
I initially thought a Fixes tag might not be required here.

> 
> -- i.

Thanks,
Alok
