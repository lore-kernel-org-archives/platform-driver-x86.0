Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0E235063
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039070; cv=fail; b=o8xgyZi4LHiZiSGWDWmt5CZrx1xXsVfOKVzAjeNZYfreJlDd5dNBHRgalxZepyPxaDv/hRkdLsojz+q5ixnoDJQgMC9CuvnnI/BWLUbzplkval5teAO0rvxvO8C5HqjCFN+KmlJp/V+7GiMTXek9NFp2rIan4BACzLy0MQgNt8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039070; c=relaxed/simple;
	bh=dtoiGqEqKVBgeCh48hwPOCyLzIoB3I/6LeenYcbkyHI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T0Gwo44QyAximarvljAudL50xVKTbKeuzConFvippwfjfYCFgCyz3g9RoVfDXUYeYwnZx8xj8vsi3dcbzN68BOIGOGLWjC21lOUrMXphyQ65g9TPqKcUL0ANdmeVXtL6LMCR4LC9xPDqoRiFoW8wGG3KUizz3KEO7L4DWP0+Vxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AOV1HSZm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QhqNEBqF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AOV1HSZm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QhqNEBqF"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UHuMJ5031617;
	Wed, 30 Apr 2025 18:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DHpej3dOeVNMh/XtOOpm/Pbymqi87ELyn+mOOi30BBQ=; b=
	AOV1HSZmXdBeJFdZPz/3NUAg4VuCOsP3+zRjvRldVfKAeWO1n09NKFxW3o3wgT4x
	QUVszzOpdyTQUZe+r6u6kehCZMDJFGYtgbySQzc/L9xAxFxnFdPJOIU3d/+WEump
	rtN5YX+9PoNkWZeiIi+BTREo0a1jAIh5PKUs+TtYFf3BqhVi6+g3N4kxoRsIq3+Z
	yqxDadDETGqa9O6Ug5SnOZkaBh4qf95Wnzs8RdRnSL0tzy7oFqlfxseoDyjMCuh7
	w3CWMe138hC0gnibPp1wDtUqYiKIHudpGuulCLlr65BO3xKF2i/4YkWHNXjaNFRF
	VRhBkGUS9nM2sfK4Y/8SQw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uchvut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 18:51:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53UHCF6l013788;
	Wed, 30 Apr 2025 18:51:02 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxbqn7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 18:51:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJJ8eCdAz2BKmWpFf6BBPYZ41fF0LKr4cvbrFUTOAIuLjv+dMdI3ik73uOmUi0dBHyiC9TRUvsu0KKlWmClnoWz2DFKw/Yvvs1A9NLKFGhvfidPTDzdn6SH46aa+W3S5M9xw/y/+fssqMiZlefAmJZ84/t2jOgA4WWaqKOgInuX2dFfA546vBZjIzuD2kqAkmPwNfPqKzbF7h1L0VEduOYUfW0bIEjlN+TtoaLcmD6pPXvC0dUULb/Hvl0Xl4Fnpg3FtftcnG97QEFsAqlvVi0CkadjjSENjnSJ50NzRTa/XchqVtP97TlZ36T2c+Jv3VUhNUzM8wxwaUVQylz+DcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHpej3dOeVNMh/XtOOpm/Pbymqi87ELyn+mOOi30BBQ=;
 b=T/T92PEtVcbGlhCbq7gPfPdvGo5+XX/qPbSMdoer6w5QyzpwHMYrBED8r79JWbBy8a0Hk+TIAfrU3SUhdZp6qF1A3FWz64fc/Lp4e0Rh04be6Vg831XFN10Q7ztgnrwz1tGpbdoWDDa3u6NdJjS0FCTDeL27CSfb7zcQMKCmB6iCS3JfnYi8tuJAWd1yKubERMOP5ME6JSQQeRjcqHGxXCb69XQ0JheN/C0bOt/e2dfAOCI+NLfFAX+pNNDS20ernPkci7TO8rkrCkSXzfBLqaXBlB9Zxdjy2nsjTanUcxvJwV+oBCgAa3gJoxMmS32v3Ssu6uaEHGuPaDOUDMkK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHpej3dOeVNMh/XtOOpm/Pbymqi87ELyn+mOOi30BBQ=;
 b=QhqNEBqFB6oyubEYVUJ8P0e1dQngkSMoz4233qnprnyoUwsRmmc7N/juwwMP1TgZT2evYeh+nUX3DHFllioFrW+tnPnTd0oHqjoUHoldX3XO9GHb0ryiqZ0plZtRuwjww6+wPidDf8vdOlXGfusQ94hcFaT4o0ZNi3ezg0FGATI=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CO6PR10MB5652.namprd10.prod.outlook.com (2603:10b6:303:135::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 30 Apr
 2025 18:50:59 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 18:50:59 +0000
Message-ID: <feb9e0a3-e82b-4223-9717-91b470411cb9@oracle.com>
Date: Thu, 1 May 2025 00:20:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH platform-next v10 2/2] Documentation/ABI: Add new
 attribute for mlxreg-io sysfs interfaces
To: Vadim Pasternak <vadimp@nvidia.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com
Cc: michaelsh@nvidia.com, platform-driver-x86@vger.kernel.org
References: <20250430155651.49732-1-vadimp@nvidia.com>
 <20250430155651.49732-3-vadimp@nvidia.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250430155651.49732-3-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0436.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::9) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CO6PR10MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a2a09b-2ad4-4c32-be1d-08dd8817f288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0VZR0g0RGNTVlM5b2R5Mm1kOHU2N0NmNXNKK2JlVWlWMmtCL0dvWUNJcXhC?=
 =?utf-8?B?S1o0MHF3ampsbmpwajdqTE0xcVlPb2xKU0Y0Qk1SZWgxSDRHajRhWkxxdkF3?=
 =?utf-8?B?QWtRdkVSZmRyd09MOGxNU3FPMVRCK1N1NzVlMlM3MW5BbmVzcXVDc0hRSEdz?=
 =?utf-8?B?cU9SRkZONklCaHVZT2hxYXRTWGFEenJTWHJHRTV5aHA5dVJpUEpVNlI3VEVZ?=
 =?utf-8?B?VTJZelpvTmhCTkFTVUJJemh5N0hEczJEOExiL285NENOOGV3QXdvSnRacXQ2?=
 =?utf-8?B?U0JiVndkZHRyQWpEL3BWeUpVV3g3TzF3c1B1TFpOVDZmYWd4c2pFTzlCc2dh?=
 =?utf-8?B?emZxWWN5M0R2blFkYmtJT0JzSW9VTHdhRjBZNERYTW5VRnc0U3hOdGhwQ1hU?=
 =?utf-8?B?bUx6SEMvdHEzRE96bURJQWpjSmhDNmd2SkM4ZlJhWTdNTm9zSXA3UitZU0RX?=
 =?utf-8?B?ZWlMQ3U3ZnVuZU1URUlxNzFhQXpnNWZ6RVBYYWdNQXFkcFdmRVEwT1JCRkNq?=
 =?utf-8?B?WXh4ZEE4UTlYMnYwcS9xcFg3bUN6SzBNSkZGZ2pOM0IvZUZ4b2ZtVzJSZGND?=
 =?utf-8?B?Nm9sS3JqNExUM1FRL2dua256dFBGbDVBd0hwQ0Z2S01aYnNHY0RVYndaZktv?=
 =?utf-8?B?UnpTdG8vYW9PVm1pWHo0YXh1cjlKdjJ6NWVrdW96djRBeUhyTEdnWnFZZ2N0?=
 =?utf-8?B?WjJ3M1VZV2c4VkxmejUvemZMdUVOREYycjdSMUt5ZFk1M0xneEFpYld6Y0oy?=
 =?utf-8?B?STZiWVY4WFBGSUp1NktPOE9YelVOT05iK2J5YVVFV0Vrbit0V0dtRDM4WnVI?=
 =?utf-8?B?ZDBXeWc1VTZDY0gzNkE0a1RhMlo5a1dud2lwMVFsMlhaRzhVRU1XU2lhRHVW?=
 =?utf-8?B?OFQrSG5Qd0dNSnkxY0VKcjZteFpPdzcvakwweE0wendvSHNJczBsSW5qTjFN?=
 =?utf-8?B?ME1xQmpFTE03SWFIWXVrRC9GRzlBNUovSlJneUZUaUdqbitDazhWVm9HdjFE?=
 =?utf-8?B?ZzE0ZHMxQmJQZldTMncrS1k5dFUwaGZDelMweS9qZkRVNlkwQUpRVTlXVkVR?=
 =?utf-8?B?SkVHenJ0MStHKzNSQW1Eb0s2MmRTSVZCV2ppbjZKTmtjdUxJMFFGYkY2dXA4?=
 =?utf-8?B?UGpsUHdqRThVVVl6L0NxVENwTmJ2TFlCR3pOTFhYZmN3ZDBYV255RXlIR2FP?=
 =?utf-8?B?NWpiYUZVVnQ4N0M3L0hKRW1Od2FKc1B3VHZ0Q3c0eGhCMDhZSzZTNFZFNi9y?=
 =?utf-8?B?aVE0emNwNzRCWVRiL2E2TVVMbG9OcjRLWkxmeEdERGs5WVJBQ0RpMzU0a1Ev?=
 =?utf-8?B?Tzg3TjRlaXBrb2FLdnFaYnc5VXp3S29UR3pGTWdxdVdmdHoyZ2lPQ20rbEto?=
 =?utf-8?B?d3pqK2MrekgvNUgyS21xejI4aFBZSy8rS0RzWEtxc2NEaXptcDYyOUhkeExM?=
 =?utf-8?B?WHp4NUFkb3Y1dFUxTkZINkNNMmJ6VEhwT2hCSjRjN092ZnZTK2RLMXd1OTAy?=
 =?utf-8?B?cGtjVnZSaGtRR2hnME12M2VoRWFPS0lIUDVOT0VDdnBqUmV4dmZXMEVmUHdX?=
 =?utf-8?B?aks2bWRpZ0VQbzdZSkRsTnhheW94NVFQZDhVRzlzamovUjZEektGTVpmMzZR?=
 =?utf-8?B?clU3UHBibU9xdzZCTHY3S2NmZVN1SVhSZ2k0RG4vUnhtQU84S3FSeWRpc2pq?=
 =?utf-8?B?MGRETTN6SWhpd091dFdmaS9GY1oxaEt4akF3NUljY1dJNjNiNW1BRnUzSmFk?=
 =?utf-8?B?N3dWSkdFRmRwVGpKVjlYSVBWVHgrOTlWZGF0LzVoRkl5Rk5Cak5xVkFWemtE?=
 =?utf-8?B?S2Q0c3BPQUVQTFU2OFV6ZnhlZWhNUE1xWGI4OW1ZSXZ0SEcxRFB3RWRwV0x1?=
 =?utf-8?B?MXl5blpWaEFGU3MwYW43aCsvRUVRNytFWHVtTEpZQWlTSDh5eDBidFNDcTJF?=
 =?utf-8?Q?AetNq9lk95g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGlKcFJjSnU5NG5kT2N0MTNNWVphSUxJWlhCb0ZUNFRVUUErc3FHRWszREpq?=
 =?utf-8?B?U2d3eVlVbmhicmhiTlI2Y2pBYWd5dXlXKzlxa2JFNE94NU03L1ZEWkZ0bGMw?=
 =?utf-8?B?b2NLU2Z6SjR0Q1gzZjloelNjWktNU3F4RW5GamszMW9ERkd3SStZUnRQRGFY?=
 =?utf-8?B?a3FzZnlXS0Z3Ymw3UDdNb2NMVVFmUkhGUTdKamsyYUhJdnlQcU52YklRMmFP?=
 =?utf-8?B?Q3kxdDluRUhxTDJCZDlUazJrVUxwUXg0RThiWGJaWituTGE2aVQzV1NBc2ZC?=
 =?utf-8?B?WFpoYUhsSVdJbTlvZTNGaWh3UU9WNi9DSHFsQUp4cHhKcEhHMWEwa09zUGQ0?=
 =?utf-8?B?d0g1eE1xQ0srN1llVUxuWWcySjVTRWg4MS9YL3pCaXJUcWxuWUhiRUJDdEU3?=
 =?utf-8?B?Zmp1YVRkYmJHZzdWNUd4eHpWZTFRcklXdVAzMzJtK0MyWFg3czhRTlVXWWM1?=
 =?utf-8?B?TGhNaGZKMVRpaFVxVUQ3YVlxVXUrSncvSjY4TE5CaXYwcWFFaHc0eFc1a1hY?=
 =?utf-8?B?cC9iV3pmU3lhVGVNZVYzZUkzbk8vcXhnTkNMU0FjbWpvMFYwSlRmS1hGTTBI?=
 =?utf-8?B?dzc5N2dmUjhjNjNKNTVCUHZrSVdwVnNIM2xGMXRiaG1YZlhiUStwekFsRENS?=
 =?utf-8?B?c05VU2ovbHBzV3ByTlpWTk5OakxJRWV3V1pXc3lBbDNSUUNhNVllQm9Yd2JW?=
 =?utf-8?B?SVJBSFJhUHFIZFM2T2Z5TTdOeHR4bnpabHlFK0F4L3IyUE13SThCRkVFckkw?=
 =?utf-8?B?R3A0eWxlTVoyK2xZbFE3eWNiR0xQNGRHbVB6U2lObHZnOWJ3RzVEY3lNbFZY?=
 =?utf-8?B?TG5hc1c2YmJBTlcxVGJPVi82SXFEQ1RLK1pOS2IvdDRrRksrbkV4VFBtZElI?=
 =?utf-8?B?QnlFVGQ2WVdnQkRwTWs1akk1akQ2SnRDUUdITzlBcU9aT2N0a3h5b08wNUFU?=
 =?utf-8?B?TjB6QWphNG9tenZhSVdFSk1lZUs0ZjFWOW5IZ1BwZSt4SG9Zci9DazdMYkhT?=
 =?utf-8?B?R0drMEI0RHN0RXlxY2tTelhMMmdSU29KVG5HZ2FXeXBjS2luUHhlK3R5OE5r?=
 =?utf-8?B?VEh2NkdxVEtpTkhFQ2JTazZNL0hoT3l0enliRVF6eWNXeEUxUVpRTW50S1Bl?=
 =?utf-8?B?bkVTTVBlTko4OGtYN3pXaGZBWmRiZDF1cWtFTVY0Vk9RV3FQUlg3R0JwTGJZ?=
 =?utf-8?B?dEFhU1RjRkRDT3NDZG1VY1BMeE5VZWROZ0RFbC9PdjdzVFEvSlNyeHRDNS84?=
 =?utf-8?B?aWVkd3pWS3V1eTVhRkpoV0lHVFZtZFFscTVZTFJsUVdWdjhnV2R5aWtCQ0Zo?=
 =?utf-8?B?Q3ZacCt1bzZJdXpjZ0NVWGQ3R05XMzZLRitiRmRjUXRjc3YwMnhxQnRpcnlQ?=
 =?utf-8?B?VVIwaHlyaThFNEh6MWRMaVhtMXRGVlNLRENlYWpLNHREYnNURHczZmRXZm5x?=
 =?utf-8?B?WnYrWmI4WHlJNkdsSnkyalpSbVM5cUNacG8xNjBCcWFRalE3RDNZcUI4V1lk?=
 =?utf-8?B?Ly9CeWV3a3lsRE10blJ5Vk5JU3VuVUh4RWxMaEZnZ0ErU2pkS1FZcGlMZlpT?=
 =?utf-8?B?R1E5VEx6ZkdNUDE4Y0IrNXpLMVRvSVh0aFdiRlhET2hXczYvcDdxbWlzczNV?=
 =?utf-8?B?SHExcW9Kb0Y2WDBLcld4RzJyNXFSWE1UVEFHRysyTUpIVFR4U1hEcFFYZ2tN?=
 =?utf-8?B?aW9yUzhhMFcvQkNZdDM2dTd0ell2cDluMEQvVzRRNzRTV25jUTQ2bUM2QkEy?=
 =?utf-8?B?MW8zd3g5alo4QjJ6NWFOcUpHdHpaRGdCaHFtTTA2cWVEVm9WbFZ2bDJjOW5H?=
 =?utf-8?B?WlU0TXBwVnl6Z2tZZHpwc0FQSFNuVkJsd05OVVZucmNSaW14emZ3aUIza2pY?=
 =?utf-8?B?VDQ2TlR2TEI0M3MrckZDUTBmMm5MTkhUdHNuclB6NE54RUtzN2FDM005S1Y2?=
 =?utf-8?B?Y3lVMVl6U3BXMmpiZXVZUGVYWFhZZGR2N290SEt4Y1FCS1pZdlk4eDBvWlFG?=
 =?utf-8?B?VEorZ3ZDbUEvTWJzS0JrU1J2MFFZckRQZnM5bC9rTlpaa1JjYU5nbk55L2Iw?=
 =?utf-8?B?MWtHdEJlZjZPZ1ltRml1bHFkTnNsaTJpakFrbnNULzAwTmJNempRUFA0Zmh0?=
 =?utf-8?Q?6LY4ZeJREMEsvGpbiihvoMIRP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j1zvyAYGPsR+jxxm3g5ty3AnNSKR1/kCNNGaTRIDW2fwoSwVaankvky+mWaJw3LXRT8/eL0AIW2GcCA5YolH3xF6tO1Ol6MBaowkotpacQ5sl8Ox3RWNZiqXK3wl/B+mTD9s3pQ0HvVhIQCtMercct1DD704zlcYt5dTYZVxKKfBnwAnFCP/6OGW2dop0YO85HjwWOrdG5R5xuwZd1bfNPF96WSeMtgQDv0bYHFhNAz8bKXYdK3XA/nZLBgLm9fpRWgVgbe55KWZlAaMlw8AaAlYJjVgG559bhksFxaDfnf7eWUaPjREP8dwNbmW+AEHVR17c4OOSgDHbOt/YWqKH/PE0+HAlkx3hDwqsoyKf9oAJOptXZposFAA5CP9qq17UOeejYSVIShbX6X0Qg78JA2dnYD1Q2x1noaPyvLGMTz6n21TXB/zdkmafUxzN34XH5uw6eyybVJcuQQ03uC9PlSw/pm+anPBifgFM58u71BsHAFksUf3v5V6sKDB7XGkcdiBiC3N5DDic2a1PiVhM6H51tH6SrVDnyc+PK/UlhymAt/KDjefzi64G2cTpVjNuksffzXb3FEAWranXciJByQWPKdYIia+sjMh1wbPYtY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a2a09b-2ad4-4c32-be1d-08dd8817f288
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 18:50:59.4044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZzGJdFwtuPaTpdCLzJwSD3PjEj2s9evm7Wn8cDsp13a882IpRDjPuu94AFqtOFvyBsUi8cHShwvg9xvn/zNL+XgGjypbVArcm1Gs/97yLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5652
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504300137
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=68127117 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=raSz_AfM3Hw6upGwtJsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: NESRDqxYOJNGYuz-REXWeugB9XY5Hjuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEzNyBTYWx0ZWRfXxUIxeNMs9AC5 izFqKBhXv+DzOt3yzRZoN7aWz3vWc2sLortlmdPZKjWx2dWMW5ELz0TvZKeRKTZT15urbOYKEib SnsjwMwp5KWiDBaGN/OeRpMRd8TqEoAcV5YSi7j1tS6NPtdl1e+aImL6eo/3KRcRt0CffqV5/+d
 DaOkGUwaEKY8aMBkke9oXHTxkRp42fCVGEhOq3bCPiyE7qct9vnqtKGHcOJgVPoSdB5m+NuJDsK baAYpKw64RfyyVOhTw/AqB/gTndcltTIfq9rUB7YiC99PhCgajvr9ATQXQQm0K6QQVC6dJQKqKt SBxx+qUmuI9g1zHjw5me6rtXMyut/9ned0QPu14ZBZ9S8Drkw8OG2DR12ar1KWo3WVroucLwA78
 0VIjTp3dJyk+kgw95ftwDjSH6R0ImA3QPLd4liH6loD2otQiDb5MAZ7DKT+jfW1Iqb0bj7P6
X-Proofpoint-GUID: NESRDqxYOJNGYuz-REXWeugB9XY5Hjuy



On 30-04-2025 21:26, Vadim Pasternak wrote:
> Add documentation for the new attributes:
> - Request and response for access to protetced flashes:
[clip]
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_request
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file when written 1 activates request to allow access to
> +		the write protected flashes. Such request can be performed only
> +		for system equipped with BMC (Board Management Controller),
> +		which can grant access to protected flashes. In case BMC allows
> +		access - it will respond with "global_wp_response". BMC decides
> +		regarding time window of granted access. After granted window is
> +		expired, BMC will change value back to 0.
> +		Default value is 0.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_response
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file, when set 1, indicates that access to protected
> +		flashes have been granted to host CPU by BMC.
> +		Default value is 0.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Vadim Pasternak vadimp@nvidia.com

email angle brackets (< >) for contact

> +Description:	When ASICs are getting overheated, system protection
> +		hardware mechanism enforces system reboot. After system
> +		reboot ASICs come up in locked state. To unlock ASICs,
> +		this file should be written 1
> +		Default value is 0.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/boot_progress
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show the Data Process Unit board boot progress
> +		state. Valid states are:
> +		- 4 : OS starting.
> +		- 5 : OS running.
> +		- 6 : Low-Power Standby.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/dpu_id
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file shows hardware Id of Data Process Unit board.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_reload
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_dpu_thermal
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_from_main_board
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show the Data Process Unit board reset cause, as
> +		following: reset due to power auxiliary outage or power reload, reset
> +		due to thermal shutdown, reset due to request from main board.

better to break big sentence
These files expose the cause of the most recent reset of the
Data Processing Unit (DPU) board. The possible causes are:
  - Power auxiliary outage or power reload
  - Thermal shutdown
  - Reset request from the main board

> +		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
> +		the above causes could be 1 at the same time, representing only last
> +		reset cause.
> +
> +		The files are read only.
> +


Thanks,
Alok

