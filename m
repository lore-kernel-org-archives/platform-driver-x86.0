Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2662321421
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608793; cv=fail; b=QB1BUnmJWH575z5CicnirPgTUnTqrFj/+41DFjmfXTwfJmmCTBTJD02o0XILnrXFDEz5CgMW3hU2bSuJic2/D5emgK0Elx1YZWNbu1honkIclvGRqh2aPBwiQIgyh0R9dz0Xz5rRBYfOPJ17qY8Lb9wCbF4qKupnci4eTBXpC6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608793; c=relaxed/simple;
	bh=T3RbGxwM+AFPVHr4qw3Q6OElRJpbEHrbwIQa3UlOvNs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W/loCPXjukdGRBQ/xnM0OztugYIMkDZEVJCxDPbtKlyq69USW983KqBiS5OBJuAfj0IiI3PQ+ux00g4FaElSEpzzl6nagdA6C2httm4S0j4o2DlJzrtrfEPNs7DlbHzozzXl9zzQK0lire2RzdCi9DuMmHGdLvNzkH5SdPqQqS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=T1FGncm4; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="T1FGncm4"
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G3ADmX007659;
	Thu, 16 Oct 2025 04:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=I
	G3UImp01uTpIgNM7pE2awvpjpEv+rM0CD7qNqDvlAY=; b=T1FGncm48tT3SzWL+
	hw1OEIwj6c4uKwqUJXjPgEtBzJBnH6R1OO27pfYIsT6ZHQFTsWWP6xnj2LhenBFS
	VRwI99BWgxD4MNTlFPYCtpGau39OOiC59HnFh+cY9vT5377WuhZxUrE6MvPBiSGj
	bHgCs4hN6p76jUMDsKX9xxyGsN1xzo+AXkilvhf8DuSobI6bkdQr17d1w+KMKO8C
	IkK7B9HHoHdbfqTD3faHIyFaqXaVCnFC8ymSks+wJz0LN9Eg6FE23zkHL/OuorMG
	h3ijU7/PGe/pdkNxcNUqW+ktF9vpioEmx8D1idkZjc4Kuwz9nBsocHv5O0LOd+L3
	NcdXw==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 49qk8j77db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 04:13:50 -0400 (EDT)
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G5F5IA028702;
	Thu, 16 Oct 2025 04:13:50 -0400
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 49ttd3a0nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Oct 2025 04:13:49 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNTb8QCOekT92Z60A5COmtNOkJr+Wkur3uf91XfbnR/k1d/OGrXxb7f/Wj4tICcsVw22Ll3GqTnivBbp86yNQURve+xqzzgbJK770V43xtqT2jjOMXm87cFKTkn2cjbqzJ1uBXCfGZp360DvuUMTXswUAbgd5NxN+0iYIT+vaHYujBMtIKKRrEkxvnRBcGFDb7i2ifh0DTnE/DK9tu7VykgEN/MATCErsBQysJ6RHGdu1F1I0MA7InLdbWpRqCkhRcLYrWmEpu8zqVerkosoemKAA4h7nzYlvcVcH7F+DQ9L9Pyw+WWe1D2jGjMRyAwp1Jae64cyFK12bFjAWiKuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IG3UImp01uTpIgNM7pE2awvpjpEv+rM0CD7qNqDvlAY=;
 b=WXogH4YAmP1BqfO54RjmIk2e7AzNfqzsDNwLuSSWs4C98LamFhEdMqAGvJQOWZJdz4EiHGdYJvEIkXapPtRIDXXZODDCT/vsDTqUM5EehPB1q8Ra7UhfZOCIiM2I8Fwij1cYF97RuU1I05ryPUcjlATzjkWqxn0McuUnUMfiRdh/4TkPXcGoNdBh1F4ENNDC8eEi57FytTVYYJ10LdXmgqrTXirzYQ4bN/hnoSD5t+siyDhAIz07Kf6PguTWFYjzDemqq3b2WVPhawzG9FdEk6Y3E+p28wHCgeQU6dKPzStOG/m8WMuG4gsYXAdgfqsPlvy0PgKNzF5zfHI/gzEM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23)
 by IA0PPF69F4F1B2D.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Thu, 16 Oct
 2025 08:13:46 +0000
Received: from BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5]) by BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 08:13:45 +0000
From: "Shen, Yijun" <Yijun.Shen@dell.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com"
	<hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>,
        Patil Rajesh <Patil.Reddy@amd.com>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: RE: [PATCH v2 1/2] platform/x86/amd/pmf: Add BIOS_INPUTS_MAX macro to
 replace hardcoded array size
Thread-Topic: [PATCH v2 1/2] platform/x86/amd/pmf: Add BIOS_INPUTS_MAX macro
 to replace hardcoded array size
Thread-Index: AQHcPePAcH9ewoNQDEKnZfdRbdsbvLTEbMuQ
Date: Thu, 16 Oct 2025 08:13:45 +0000
Message-ID:
 <BY5PR19MB3922EC2D74B59ED0C7E58A16EBE9A@BY5PR19MB3922.namprd19.prod.outlook.com>
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ActionId=a125f0a7-f523-4f52-bd5a-5d3db968359f;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ContentBits=0;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Enabled=true;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Method=Privileged;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Name=Public
 No Visual
 Label;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SetDate=2025-10-16T08:10:22Z;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Tag=10,
 0, 1, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR19MB3922:EE_|IA0PPF69F4F1B2D:EE_
x-ms-office365-filtering-correlation-id: c73915cf-1bf3-4843-162b-08de0c8bed65
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IPKL/n0dODErTVBbyQ/53UgWWrW4UXcm4hfcQyfMfmpV7Mnn7uHPHiKmpbTI?=
 =?us-ascii?Q?h5LPlmqkPduJzNwuRVp4SbaKmzJ8mdub41a3BNsODTS5eMUnejBr3ckuLrmc?=
 =?us-ascii?Q?AT97sUZru+i/qAnTv3QOOk2Zn+/dFKOMNFL9mdSFhNIdo9bgLakiqLTK1lcn?=
 =?us-ascii?Q?lAxMvmdODf0Y1PRhq9tlyEkyUpDTXojg76BeU4v1ZhbFHE+oYpO5jhkhroeZ?=
 =?us-ascii?Q?Mnebu5NkpIa6kZbBf8dX9yj9fkthRrgl2IEK0dVzb8O7V/1AUf+ZJaMwWjno?=
 =?us-ascii?Q?jKFhW0+egG/ClyPDSasYfToKK9OtzQzarLRWokglYlD3yxRYe/YwViCVskln?=
 =?us-ascii?Q?vcr7ivhFCla3aKgQg/levQtCOa925yp40TmOog9rKCfalx4pzKWkUVYvRqwl?=
 =?us-ascii?Q?i5ukNX67xV909QJBm/qhWoJ42iS2TvPyXAUbk8LxJuY4nojpPdNrYtKS8JBP?=
 =?us-ascii?Q?SdgK5MdkO8aBb3o6tJ7Jp7ucYy7QG87ldHTDt3K8axM3ldD1N6vCXNAVg2xn?=
 =?us-ascii?Q?JRTWJuLvHDEXkbiSBu7AhsdeC3/dq8Bb9PXAAZpR7VfwHLcRkvnfvQrvm30d?=
 =?us-ascii?Q?wLM04u82gZ8oXR8yKsAaV7fr8hmsKwvoeB9I49AZg88oL40HhACm2b4b4Mz/?=
 =?us-ascii?Q?jbd+qlcHqq2Vres+aHTZ+VQgfbJzbBkRfXmTclntdVGAt+Gn1vA5EaVsGhbM?=
 =?us-ascii?Q?6oL3Whjl9NuKnPHcPrvfu+O6pypSbCIsD0I0TCT1I0rteAdbS1CYtVjbNEur?=
 =?us-ascii?Q?GzSPgepKlkRIDfYo3dqUSoOGIJiWT8EBBIacnpT1wcmnYjMmZGUmxrlxfCQm?=
 =?us-ascii?Q?XrIn0qbsSrJy1gi99+iccIPiuy/Xt3frR+agU4VE6vHln6m2MHZSUcZDzTU8?=
 =?us-ascii?Q?2b+CpYvlSnHLWi/NTQLlysPoO5+4D3eK7eZ/gMO24h9l24ylQ1sgQLES71eX?=
 =?us-ascii?Q?WM52cHiPRQnxyuixOZMHoD2uP91sCI6HVzlbz2RatDfrP+kNtvDNAFicAiRM?=
 =?us-ascii?Q?4XoTg+//Ds9Uk2bWOlOGdoSH6Yx8vSsT++ciEkNX0N2eKw6diR8DrGRWD36R?=
 =?us-ascii?Q?AvYn2ixhyUJMvthZ8AYpay8F4xPttutnEnErxlv4BUDUn6phAHs40r/gobvS?=
 =?us-ascii?Q?fMUY85dGnfsp227UnFOJXxdts/Kgde8CJVnsQF6zGnHDHJCdIveg94Th926e?=
 =?us-ascii?Q?wl5g/voCTpwczVriO+cwmxxQi4UtM5YilCbIIwPqKlii+tQfVXa9lJSNelF5?=
 =?us-ascii?Q?LtRuSdgJDy7j6/92c7bLaon1tT7j9rPxyj2tesX9zhlgbw8DObQULxy+Rkax?=
 =?us-ascii?Q?J43aGDecrjNJ4S42v/32DdjhA3RT1d/Tc7FHhBtDyUOsM1mcwDCi0NiF12uE?=
 =?us-ascii?Q?9AjISDB+V5iVEx/ye5CX5MrfMZ/dt3U4mXExvQEkHraElNAkyecDOzvYaWek?=
 =?us-ascii?Q?epk8RXCEaexnpADLSICJBvRhnlg5kxItgtze7rbzRhDVMGR0Y865MUCPuu8S?=
 =?us-ascii?Q?sSbfVIU5vQFOuieo7h1fltlleE2elCgRWTkF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3922.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DI5JPaovhKe+kGj1Qree75fSrrAjc1DkYeOnJ2VNI/LV+mfTaujpOu8JGP2+?=
 =?us-ascii?Q?T413tTzOREcsF3+eSpE25YhXNvzxBChh/Jxjhm628jgbrUfO045gi+l7+ywu?=
 =?us-ascii?Q?n644gBA7h7BB11JcdQ1aAsJBDQ/b6hJMPup3LZzOancx8zORbgB959lDLc2u?=
 =?us-ascii?Q?SJGzNnDjymKrsesWWJKUVo98TYez8B64mjVKsLJEa0V42k+t96s9GQWYQc/9?=
 =?us-ascii?Q?qQWnnTL4717KA50WCyy2+OkdTclvn7/SxjiPgdcEsfNNWXTFovk3zR1scZso?=
 =?us-ascii?Q?P9MkicjxHWTtLVmT7iZLhZ34IsnPtKupTV7oMgOYSXBcj9iBp7512B9cRYlL?=
 =?us-ascii?Q?iMp5B0OihAKAKBgVQpihk+U8fAbTtitCpows2PHoQ6hS5Bq9tzP1+83sknQ8?=
 =?us-ascii?Q?pd0FeXkHJ5e17a8ThXfKD7Qu80up3nfb/na1a0CGSDIkbCqN3K/N5KScqV7c?=
 =?us-ascii?Q?jB6XLVud9X4G+Ef6PS8mAcnKiULp1EMtnxVa8/g1YanFeLS+iFI8CzvP+KHe?=
 =?us-ascii?Q?ek4EoXwTpjFsx6ektKYel0Q5Auc/lVoeBPOojhsvEpMQWDzP7k+X0Cj8vuyP?=
 =?us-ascii?Q?BlqZTRPTN0piB32sy/kVfVdvKGjm9NHPnrb2l9FijIslRxC3z36PWDI9xmwV?=
 =?us-ascii?Q?wx6Q12dfQ+jIwRSpyINVpqLpGaheOIt1l05WoIRpShsluj9WkJX5JDS4/c3x?=
 =?us-ascii?Q?c4RkH+EpIJ+Qa0yiRxXr8pTJ/s7SerVKGyO/sOl8+MyvPBCe6OBgzdi8cWbq?=
 =?us-ascii?Q?l3lLcSpuz5R4UBRPL86wMw62yWbDpb80/jaaXOVgnjg74kBssS6Hsd36bEbI?=
 =?us-ascii?Q?Aoko+hrreVI5tB/sCaftk7bzLsHOJgqKlr1dVgvEmbtOD3ukFcpMd3F5quAc?=
 =?us-ascii?Q?68EXn9wPy2gF1Et8aKmwxiR57v0TpoWR2GS/YUkkYE+ph+PF9jyEtCCPLrge?=
 =?us-ascii?Q?L0aXIH3QIPHhwCFZh5jkPHu1I/Oc0M2bo1zdJS4P82qBFbjyzP/Ni15Ed3m7?=
 =?us-ascii?Q?7iZ6JKdruMmAkKD/RFO0o4dDPhX4BMN5giTOrOECLTsXyXA3fnng2HMk7XP+?=
 =?us-ascii?Q?RetY+O/bNo2Jzvn38f495kbnMEaw7NG3OL5RZG2j6A0wZeZ3WMxnq4mQymLv?=
 =?us-ascii?Q?UkKlRbgd2R6irNEVxJLUkHRiAlLd6mIYVANVkP8RPfq8PioVgBGynqJMCuq5?=
 =?us-ascii?Q?St57KGXBeShu7BBAEQi3vk7vfsz0j8Rl84I3LKzftELPvfvaU1XvMa6IstLc?=
 =?us-ascii?Q?EsFk4zZSNWKXwARHaMSRTjDmhwaTZ9mSA89hjJrdYuZcPcYXSyUF9z8HlKPo?=
 =?us-ascii?Q?SjhgTJiPJU5x0Wfne+3XWEYNSGymHLGPy5gfR7K3fleFJnjYYbQtqB4qOc47?=
 =?us-ascii?Q?6zbS85KJX/7AHKWYLtZNYXSh4yf243AHGAtnSXSD/fU+vB0yvYdvfQfO7Asj?=
 =?us-ascii?Q?pyMtP9vL9QEgeXZOGIn6rh44dlJ4jrDV+6eP3aZ+WJDoERHSTxtx1y94Q6J+?=
 =?us-ascii?Q?bgbjjQmg4j+1clNjAXUQ4jsLhLbRQ/dnTX5mcPaXGgUMDbTd5cmlpyXgCooU?=
 =?us-ascii?Q?CFBbHLgxJ2LS2xI5++TGJUAKZRU97RE+kXcoyQIb?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c73915cf-1bf3-4843-162b-08de0c8bed65
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 08:13:45.5937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kH/wpsSPb6b+s0uge1UBTQSyX6FOtRNgsuPJ2eZAYgnTiulNwxgq5+Hyg3G6FdnOq0ufegkRSdqXi1ayBcaGkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF69F4F1B2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160037
X-Authority-Analysis: v=2.4 cv=JeyxbEKV c=1 sm=1 tr=0 ts=68f0a93e cx=c_pps
 a=j0++y401J6f/BxNAf5EDow==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=iLNU1ar6AAAA:8 a=TZ8jbInKXgbE110Mas4A:9
 a=CjuIK1q_8ugA:10 a=gbU3OgOOxF9bX48Letew:22
X-Proofpoint-ORIG-GUID: vDRNAYyPnVYVbVzaMVBE1Hq2DR0E_8J1
X-Proofpoint-GUID: vDRNAYyPnVYVbVzaMVBE1Hq2DR0E_8J1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDA0MCBTYWx0ZWRfX37dM0RKrzUDR
 7Vx24aqkhDa5o0zuq/jdQPma/KYbHJWjIBac4t9flSMoRkqOfNQolmnFMoGVcdIywt+ppGSL/5Z
 RbJZmDO3RAd+LODTZIPXIPbZ3UgFLol6kyj3nVZJY48MQoC56x/+2mGqvkPmRcldXdOhEzoSR19
 vzWGKpxqTlsbH3a1rHedr9cA10JLY97e1UYKjUAbItJZBnl71/tA65RDMVbIOaQRZ2MQ34RuFoA
 fqUpm1SB85Z4cnpq/cuZkr3QCbvq7eKACp994g8EszjtZvca7XQApCC1KSj/oPeAJq7WKrt/8eM
 UraqX6r5TNGuCIEP1gnQL1mHksvxxIJECU8JYuKgx5fPWj4u7KFgLAFmoF3VJveTXiCeN4TQ33O
 9JXFeMboarO7DOrIFKX15z2rfvDHBA==
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110040

> -----Original Message-----
> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Sent: Wednesday, October 15, 2025 10:55 PM
> To: hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com
> Cc: platform-driver-x86@vger.kernel.org; Patil Rajesh
> <Patil.Reddy@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Shen, Yijun <Yijun.Shen@dell.com>; Shyam
> Sundar S K <Shyam-sundar.S-k@amd.com>
> Subject: [PATCH v2 1/2] platform/x86/amd/pmf: Add BIOS_INPUTS_MAX
> macro to replace hardcoded array size
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Define a new macro BIOS_INPUTS_MAX, to represent the maximum number
> of BIOS input values. Replace hardcoded array sizes in relevant structure=
s
> with this macro to improve readability and maintainability.
>=20
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Verified this patch on the issued system.

Tested-By: Yijun Shen <Yijun.Shen@Dell.com>

> ---
> v2:
>  - New patch spinned from v1
>  - Add new BIOS_INPUTS_MAX macro and replace hardcoded values
>=20
>  drivers/platform/x86/amd/pmf/pmf.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
> b/drivers/platform/x86/amd/pmf/pmf.h
> index bd19f2a6bc78..2145df4128cd 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -119,6 +119,7 @@ struct cookie_header {
>=20
>  #define APTS_MAX_STATES		16
>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
> +#define BIOS_INPUTS_MAX		10
>=20
>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void
> *data);
>=20
> @@ -204,7 +205,7 @@ struct apmf_sbios_req_v1 {
>  	u8 skin_temp_apu;
>  	u8 skin_temp_hs2;
>  	u8 enable_cnqf;
> -	u32 custom_policy[10];
> +	u32 custom_policy[BIOS_INPUTS_MAX];
>  } __packed;
>=20
>  struct apmf_sbios_req_v2 {
> @@ -216,7 +217,7 @@ struct apmf_sbios_req_v2 {
>  	u32 stt_min_limit;
>  	u8 skin_temp_apu;
>  	u8 skin_temp_hs2;
> -	u32 custom_policy[10];
> +	u32 custom_policy[BIOS_INPUTS_MAX];
>  } __packed;
>=20
>  struct apmf_fan_idx {
> @@ -355,7 +356,7 @@ enum power_modes_v2 {  };
>=20
>  struct pmf_bios_inputs_prev {
> -	u32 custom_bios_inputs[10];
> +	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>  };
>=20
>  struct amd_pmf_dev {
> @@ -451,7 +452,7 @@ struct os_power_slider {  struct
> amd_pmf_notify_smart_pc_update {
>  	u16 size;
>  	u32 pending_req;
> -	u32 custom_bios[10];
> +	u32 custom_bios[BIOS_INPUTS_MAX];
>  } __packed;
>=20
>  struct fan_table_control {
> --
> 2.34.1

