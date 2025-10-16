Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00953254BC
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606227; cv=fail; b=QvfEWpSSRYhrpxPV4B5eg1LMuUPUguSpC8ayI0lGQz6njLGBY+/undGNc62kUeUbAwA9Qc46WDjbdrtFmcI9uc/iDC3bHfXlovqrew4tBh+IgmHmco/9ovROW/bgQouGoYfKuWdoIr9ClIcSWaW6MXsFF3mmNNs/hRx1A5EIMOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606227; c=relaxed/simple;
	bh=Cop1ov1yPH+YipuI81fjOOXyVqk2JS4quFGQwBz3hqY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QJrlhWP0nX+TWCrEkLuzKLFGC/4ugCC2eCbXEfgkgyDcoHYAD9lmZllzU4jCreb/DxNB+v7ADPfpAr4HThgFaxhvAwAwVpgzvdJ6rh0S7deeaN8I0ID9eFPOYLws4AiqmzHIY60RKHVbna/6e2wDsF8HMKdatmr8WOsaKI9Vm4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=dCPbtHcG; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="dCPbtHcG"
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G3Yaf1004400;
	Thu, 16 Oct 2025 04:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=s
	Yx/JbsUm5v7/0X3YNOWpPaeLAbYiZ/ohrAWRTPko+g=; b=dCPbtHcGDTJ8fUGVw
	Re5MipAGPbvyzh+Q5sfny6p7youNot9nkcXwk5mkMYndJsWz2Jxvt39SCleQdl3X
	W8U7HWVv2xxKr2hUdzzIG7mpQsHTvgTFlqq+23/FHT1FM9kTsnQfwwEJLWaJGLWN
	NSr4OHnfaU8rVGdOAAUoamSWsLl2R0CaDyet9i3Sbh6/kYNoWbfx8EuELGt/4TQz
	trToH/HPbabC0w8iRVdrook0zRp4bd3w91u+fSKAEfpDV7pUGqKm4xhhr3uAglZk
	8+9JUpUnI3LqIiyXDQJizm/mlmr3oI+p7y/fJd9Jew7cvPrErFCSOSITZAEXOENj
	Sn8uw==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 49qjjgyb6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 04:13:55 -0400 (EDT)
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G2g4rB029085;
	Thu, 16 Oct 2025 04:13:55 -0400
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010028.outbound.protection.outlook.com [52.101.85.28])
	by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 49tm2m64e7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Oct 2025 04:13:54 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ffpet/EA2PUct/ybSSrXuetVpKX+5t/rh+2IlF2PL3vqlV7DYYzSw3IVAZKCh0xwXs3c2iKcmL8Oh7KPuea0YpsLYPn70JH8DJzZ3Jg4+fhqveQu6FuzHJqhU4QBvt/yg2a2oXd3N9qAmnrKaK5pTC84SfB4y3oDp4ERJgWOZ5zPTgwPe6UFVgcTQKWmAka4i85azOL4Izdye9XVoj/kben30vLWwN3gs2AZ1ylpJLM8ejHxDa6edYrf+2zPA05021avYgTFDCOZ5NbvZSSJq8SuWw+9OW5MMr4hpqcvWWPLIvLN12n5iDQScoitZLK5k04DDE63AjWSTXQT1WAqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYx/JbsUm5v7/0X3YNOWpPaeLAbYiZ/ohrAWRTPko+g=;
 b=y0ztgo3X210C0GPsbGmtf/sV9O7XK+YLhdoCkxbYeSI8Xatrh1pMWhORXMo9Rk9DBBXP4ina4atJmxxnIuf/ycpm1SxCB3wQAXEP4yHOMMW/9vc0+UBR0SuajczaZOD63vSRBowL9OZOf7obj1nD0hyhVS4SChjVYCmbsvmW+pT5rsWRhZpJT/D+TvDDNGhmBBKOOyAmVeO5wTwuOHQSz3039J8dverbILrju79aBuM1qw9eT2D/tWDd7lSjGTxjseuvyvvsidBCP+1MlxY8FTYZyAu9Tvh64kW2/UtZ0AZte1ibTDQwezGiaLOcAAh8WirebmsFD8setzuqyqoa1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23)
 by IA0PPF69F4F1B2D.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Thu, 16 Oct
 2025 08:13:51 +0000
Received: from BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5]) by BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::de91:63a:a814:6ed5%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 08:13:50 +0000
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
Subject: RE: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
Thread-Topic: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
Thread-Index: AQHcPePDPrax3rx520qTJzSIrwAZ8bTEbTkQ
Date: Thu, 16 Oct 2025 08:13:50 +0000
Message-ID:
 <BY5PR19MB3922172E5F4A12C9CF79DBA1EBE9A@BY5PR19MB3922.namprd19.prod.outlook.com>
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
 <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ActionId=78397bd2-f025-4319-91a6-deddb2ff3029;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ContentBits=0;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Enabled=true;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Method=Privileged;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Name=Public
 No Visual
 Label;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SetDate=2025-10-16T08:11:53Z;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Tag=10,
 0, 1, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR19MB3922:EE_|IA0PPF69F4F1B2D:EE_
x-ms-office365-filtering-correlation-id: ace2c124-fac6-430b-d6c4-08de0c8bf091
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sWZ6cM0uvt98cSrjtF5SgHAZ8Q1G4IAlvOiQ1lDESzJMoAATaRUbJ4Jb1EyJ?=
 =?us-ascii?Q?d4LFYr9QUNtmL218T83j81MVxsYEuKa0vBsFRoigQSkY4Ttg3IyEdDtMkhtj?=
 =?us-ascii?Q?HnvPTjXWiERGYUgdXoD/Wx9Cso0k4VyF7u2F1ewzorWZazxuE77t8FQGz2Lw?=
 =?us-ascii?Q?P/O5gulopRFp/6vczxfU7QeQvaUjoct1dAG81rWMES1eEse2U+gSGzqFLIdI?=
 =?us-ascii?Q?e09y4Ai+2YdLlDBOn9NZFVY2DDM8UlX3D/ktRKdWzL3MlEXRTjQMJMo10s1Z?=
 =?us-ascii?Q?+jSe5p2gDvGQ9T4pPovskCbnRDk/kShIYt7/dudFCBijqORNRJekdhetaJES?=
 =?us-ascii?Q?CDZhEyj+BrVeG3Kjha2pi09WWvPCzSzHs5hrF1tAC/swMGr9ZyYdphMazZIN?=
 =?us-ascii?Q?w73c+dR76XkUfd/rIk9f9E5HwOXNN3WfqeTzCSoZZFDyJNyV9nD3HJweMSZt?=
 =?us-ascii?Q?H2X0+XeasPdq7rCzre4uR+/F5lxUWwqYxasLlNezXuO8++zXAYQmkP8ERYsI?=
 =?us-ascii?Q?4WKjBFPGsWSf9dJTsUakTFwhSF5h/uhh+MHk7xcFtpKXnnlg9ch1gJA4pvB9?=
 =?us-ascii?Q?ilSIp6k8N7yaoYfJxyayIS3dwaES8NI5bW4co+Vh4QGyQ3qu0JJinnNBlGfq?=
 =?us-ascii?Q?WH1gbQzh0D8BYi6JyX9K+qtBuDGmEjxuyUh9OQ+4gqIzf5QScpQhvZVQjye5?=
 =?us-ascii?Q?Ie7K64GtpnOC9Q/YxzeVs2SteCkE6K8HCxXGjiNKtGd25zIYzxFmcn5IFB2U?=
 =?us-ascii?Q?gSHTE2E5L/FEvT+A18BBc+ZcwVP7h0vafbk/fNa4MJbuZxPHIfuPDpvi0vOg?=
 =?us-ascii?Q?Ol8e08AYP+CjbA5O5fGKjr8MqxCyurphzUJf76zSn8O3lgKSX00hsH8dKVWd?=
 =?us-ascii?Q?QnT8CoMLRO77hziJnUXD40bibYoGiHY/qK5PlzJtbb7SIINbKFMd0eGb/W7a?=
 =?us-ascii?Q?9w/2bDOrSPCXlIgSZsLdQlhAusAvQ+fyCcf/uW2EI8W+keRSwrG2RJApwtbO?=
 =?us-ascii?Q?ikd3dIKVj9v7e3Pf4QXeu7qVlZ/8R1xb5ajSLgsyxBFYr7GS1lQtixWCsdre?=
 =?us-ascii?Q?YhRLQK9XHrCUZwjd/qSboV0XHOE+SNUnQme9125XkZjWM6sq3FLCN0qmkiVN?=
 =?us-ascii?Q?djriGztNlne/GcTNCbe1AINNm8aleHPsGYu6gqiIyLmy7Uw4gcJKL/joVnKo?=
 =?us-ascii?Q?b6Z8VKOI7Dqmu+9A4ivL1ZlHtglWBHL7e9PbN5AlHeMYnNo+lw330psjsPl2?=
 =?us-ascii?Q?PupID5lKFOEWH9KZCPHSqyr3aI2wXkP3zXVw/+pflRiX7otYDhlMsREdwHiv?=
 =?us-ascii?Q?McptreAc0dYwYqs4x2xXObMJmoKrMsuvVcLKe0squjI56kBHjB4sUAx5OKTX?=
 =?us-ascii?Q?hkUySyQqvc0+QWeFCpygqn0ki2FNqY6iCYtpMIomR1TSKt06l9/4jdDv4ykw?=
 =?us-ascii?Q?N9rXrxN8re584q/dAtShxTY18dBCRvF/WvEwtOP+PSqeRJ0i7ezfeeqebv/A?=
 =?us-ascii?Q?GOo4GOaTdSixeYWGKKAWRm/GKGT/TzPAfDKj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3922.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?y5oN/CA0d4c9Y9BbJoekmkJBINadgivfxOALq6o898cRjYb9Go6AJcz5sYIQ?=
 =?us-ascii?Q?0zduRyNCBcgtOHd3QtCfjIviNE0o3HQ6qBY0HinSP79Q53fyDgZ7zW9YXVAw?=
 =?us-ascii?Q?whp2YAtSbfyRz87uwvgbyLaKIp/ZE9+NA8XMKkFIAPjuRvslovsk0uklKbIE?=
 =?us-ascii?Q?42Ze8wm+c5uIKWt6bfbNApeH7USkEJ8uZp33ynMtjTvApoKlV0Y981daJ8jA?=
 =?us-ascii?Q?IJpprhPpDxOpoiRn5hW2FNrtpWbEVF6jhbUR/r1T5GjhrdTUb9Wo0s3LtS3O?=
 =?us-ascii?Q?HDSiXbvVlveJkbrGX+yTy8yKoJEpXjZlh/wnE7U/E+oRCmo++f64Msebwegd?=
 =?us-ascii?Q?lLb9FrKQr7u+EfPfmgFHixjtyY8OJsz7XedXj1vQSfXbBp5vKklWBXBcQ234?=
 =?us-ascii?Q?+eTBsOiVJEFTl92BLI5D9jYjqEFPm3v9r3BQsqD4W/jyzyZIT49u4lrNU0wG?=
 =?us-ascii?Q?xbVy1sSPDeazXcECnqmQt2yC6jUu0m/8UFU1YsAUFDImYN3hiC4XQ7AUHcik?=
 =?us-ascii?Q?I37nrG4XlgXHClVT7y9Pw/wm7x907euC+4ub5GXvtZKWv7s52GCb697+2VwB?=
 =?us-ascii?Q?ROO5Xrc0xxX6elSSDKO8pzZXcNGrU8QivE2eWALTyhFkLlm2U7Zm2Bgte3zF?=
 =?us-ascii?Q?xRHHkCr/5ca1WpOw3Q7mriEdMIb97MxgWnQwvDa1Ie0b3cFqTsFZTUKF2M4Y?=
 =?us-ascii?Q?9HhpavLq+8XBXO9y+RoQ9dV4MseF5cpdNhxXY7ysG2BGGns1AVa776ObVhkZ?=
 =?us-ascii?Q?PufM/frYxrxMurEBW2RtAS2bS7dqFFPypkEBNRuRS/TZObI+53NnHiqOxaQS?=
 =?us-ascii?Q?rheephMsiHoEHMH7Tp9RFLhkDpZ7XTqO2T4btX1/UgSYTR1NNHDJ3HjV2lK/?=
 =?us-ascii?Q?4I3H4YUrB9NmTdbv/qaZkKX47ga2RcDRrpSBQ1n8l/sS0iEox+EZVh6aUIcx?=
 =?us-ascii?Q?umwrvjTOcx3vwr7I5O5Lu7IGbxe2dOmDqGxB3nzClFvg4a3Seeu7Uxn5ezHU?=
 =?us-ascii?Q?obA3ZaokaU2ftgbFEPpIvfvgFi84fQM+T2PyDBMhrVgsMxiFnsmft/+BNGIP?=
 =?us-ascii?Q?mR1BZkwLITrVYgiGzz6XsQD2A2isnmdn1eLrJaQT0Qhm6og3cWrfKP7M91J0?=
 =?us-ascii?Q?kvARXQUbGjPwNhoBha8RE1luvp8BcnNZ8JDM1KlGSMped1pzsd2wWcwRuEIM?=
 =?us-ascii?Q?DXybykrl1wjlphrdu2BVyc2UO84MYYhXvYaf5CpJLtViI5yIQaa8CgcCqZ70?=
 =?us-ascii?Q?zdqc2+23pC9WKkqyqbaQF13PAJbhAhjvO9ZMCzN2XzdhZGum4vhEYBS31Mnu?=
 =?us-ascii?Q?3eKEvUIWwqm8HiP4cLputqPWqL0AgPxdre3ruoty6UjHoF49jFdZfI7AnhE4?=
 =?us-ascii?Q?ujF85lXUXZcoCYuYcNmo15Z1mCN6+hWTT9wvKY77/hDOgRJavMtNcyJ6UJbk?=
 =?us-ascii?Q?e4JWXcNMBw3/dpJmch1kWoxPfIjmYb9ypIhIBrXTyjUs8aqUgwcoflxfXKMU?=
 =?us-ascii?Q?yf6LA1RRfSkGNLcNvOT7wYwyAGf331euRzYPXtrp3OmUc299sh0h3KFcDSIi?=
 =?us-ascii?Q?eAcfAPI6ZfiBt2AE0iP/AR8pxRI1RdpFyodX4xpi?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ace2c124-fac6-430b-d6c4-08de0c8bf091
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 08:13:50.8809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UcX/onZT2l4mlo+eilkJ+xNptlVkZnI2pGVB2KlixaKVPViMn0VD82VenVmflVFOcuZ/167/bFZaLecm96LFJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF69F4F1B2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510150167
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=68f0a943 cx=c_pps
 a=j0++y401J6f/BxNAf5EDow==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=iLNU1ar6AAAA:8 a=J7jYAKZhG0HNVBjvtuUA:9
 a=CjuIK1q_8ugA:10 a=gbU3OgOOxF9bX48Letew:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAzNiBTYWx0ZWRfX5LebFJuJRvTY
 ek/p1D3+iRjavYrMKTTHkRSPulku+9fw9SyCiqBDKF18b9AuhdZFsTUBCa3EI3rexXKMp0JaXoR
 Q2yVWdqoklpZyg09V5MhgT7QRgCJWsYhWTjwUZrpt226RnEM1sDy/Aq8ugMrjmBiknOM3USVmme
 S87+VY1PpNdt8cYnd/CQm8AiqkC+Ofq+uu6JG8P06xZPEzpOSwivN12Fr6UHwIWEJ1JzrwPdTnQ
 i5TNpJqqGueoA1lcD1iorBA2DNf75ST3UeDqPcR4/SqwiFd0uAvpRunifJZhVRPNZ3Ad0uWlbcP
 O1J19FPhhHiIy+559YZsek+xtc/K2BH1YuGjAbI8agUzL071FzL9FhijDlDxIPjuRWDB414NH4W
 mz70pMKO/SxfB9vD6nF8aMHwshTPUQ==
X-Proofpoint-ORIG-GUID: 3gZPW4FJTlMkf28I2J5jQMpZr9GLrxd4
X-Proofpoint-GUID: 3gZPW4FJTlMkf28I2J5jQMpZr9GLrxd4
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110036

> -----Original Message-----
> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Sent: Wednesday, October 15, 2025 10:55 PM
> To: hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com
> Cc: platform-driver-x86@vger.kernel.org; Patil Rajesh
> <Patil.Reddy@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Shen, Yijun <Yijun.Shen@dell.com>; Shyam
> Sundar S K <Shyam-sundar.S-k@amd.com>
> Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store
> custom BIOS input values
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Custom BIOS input values can be updated by multiple sources, such as powe=
r
> mode changes and sensor events, each triggering a custom BIOS input event=
.
> When these events occur in rapid succession, new data may overwrite
> previous values before they are processed, resulting in lost updates.
>=20
> To address this, introduce a fixed-size, power-of-two ring buffer to capt=
ure
> every custom BIOS input event, storing both the pending request and its
> associated input values. Access to the ring buffer is synchronized using =
a
> mutex.
>=20
> The previous use of memset() to clear the pending request structure after
> each event is removed, as each BIOS input value is now copied into the bu=
ffer
> as a snapshot. Consumers now process entries directly from the ring buffe=
r,
> making explicit clearing of the pending request structure unnecessary.
>=20
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Verified this patch on the issued system.

Tested-By: Yijun Shen <Yijun.Shen@Dell.com>

> ---
> v2:
>  - Add dev_WARN_ONCE()
>  - Change variable name rb_mutex to cbi_mutex
>  - Move tail increment logic above pending request check
>=20
>  drivers/platform/x86/amd/pmf/acpi.c   | 41 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |  2 ++
>  drivers/platform/x86/amd/pmf/pmf.h    | 20 +++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c    | 23 +++++++++------
>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>  5 files changed, 79 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c
> b/drivers/platform/x86/amd/pmf/acpi.c
> index 13c4fec2c7ef..870a56f1fe07 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -331,6 +331,43 @@ int apmf_get_sbios_requests(struct amd_pmf_dev
> *pdev, struct apmf_sbios_req *req
>  									 req,
> sizeof(*req));
>  }
>=20
> +/* Store custom BIOS inputs data in ring buffer */ static void
> +amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev) {
> +	struct cbi_ring_buffer *rb =3D &pmf_dev->cbi_buf;
> +	struct bios_input_entry entry =3D { };
> +	int i;
> +
> +	guard(mutex)(&pmf_dev->cbi_mutex);
> +
> +	switch (pmf_dev->cpu_id) {
> +	case AMD_CPU_ID_PS:
> +		for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
> +			entry.val[i] =3D pmf_dev->req1.custom_policy[i];
> +		entry.preq =3D pmf_dev->req1.pending_req;
> +		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> +			entry.val[i] =3D pmf_dev->req.custom_policy[i];
> +		entry.preq =3D pmf_dev->req.pending_req;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0)
> {
> +		rb->data[rb->head] =3D entry;
> +		rb->head =3D (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ -
> 1);
> +	} else {
> +		/* Rare case: ensures the newest BIOS input value is kept */
> +		dev_WARN_ONCE(pmf_dev->dev, 1, "Overwriting BIOS input
> value, data may be lost\n");
> +		rb->data[rb->head] =3D entry;
> +		rb->head =3D (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ -
> 1);
> +		rb->tail =3D (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +	}
> +}
> +
>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)  {
>  	if (!pdev->cb_flag)
> @@ -356,6 +393,8 @@ static void apmf_event_handler_v2(acpi_handle
> handle, u32 event, void *data)
>  	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev-
> >req.pending_req);
>=20
>  	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>  }
>=20
>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void
> *data) @@ -374,6 +413,8 @@ static void
> apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>  	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n",
> pmf_dev->req1.pending_req);
>=20
>  	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>  }
>=20
>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data=
)
> diff --git a/drivers/platform/x86/amd/pmf/core.c
> b/drivers/platform/x86/amd/pmf/core.c
> index bc544a4a5266..8b97eba00dd3 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device
> *pdev)
>  	mutex_init(&dev->lock);
>  	mutex_init(&dev->update_mutex);
>  	mutex_init(&dev->cb_mutex);
> +	mutex_init(&dev->cbi_mutex);
>=20
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
> @@ -494,6 +495,7 @@ static void amd_pmf_remove(struct platform_device
> *pdev)
>  	mutex_destroy(&dev->lock);
>  	mutex_destroy(&dev->update_mutex);
>  	mutex_destroy(&dev->cb_mutex);
> +	mutex_destroy(&dev->cbi_mutex);
>  }
>=20
>  static const struct attribute_group *amd_pmf_driver_groups[] =3D { diff =
--git
> a/drivers/platform/x86/amd/pmf/pmf.h
> b/drivers/platform/x86/amd/pmf/pmf.h
> index 2145df4128cd..6cb1e228c48e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>  #define PMF_H
>=20
>  #include <linux/acpi.h>
> +#include <linux/circ_buf.h>
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> @@ -120,6 +121,7 @@ struct cookie_header {
>  #define APTS_MAX_STATES		16
>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>  #define BIOS_INPUTS_MAX		10
> +#define CUSTOM_BIOS_INPUT_RB_SZ	64	/* Must be power of two for
> CIRC_* macros */
>=20
>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void
> *data);
>=20
> @@ -359,6 +361,22 @@ struct pmf_bios_inputs_prev {
>  	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>  };
>=20
> +/**
> + * struct bios_input_entry - Snapshot of custom BIOS input event
> + * @val: Array of custom BIOS input values
> + * @preq: Pending request value associated with this event  */ struct
> +bios_input_entry {
> +	u32 val[BIOS_INPUTS_MAX];
> +	u32 preq;
> +};
> +
> +struct cbi_ring_buffer {
> +	struct bios_input_entry data[CUSTOM_BIOS_INPUT_RB_SZ];
> +	int head;
> +	int tail;
> +};
> +
>  struct amd_pmf_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -407,6 +425,8 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS
> inputs */
>  	bool cb_flag;			     /* To handle first custom BIOS
> input */
> +	struct cbi_ring_buffer cbi_buf;
> +	struct mutex cbi_mutex;		     /* Protects ring buffer
> access */
>  };
>=20
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c
> b/drivers/platform/x86/amd/pmf/spc.c
> index 85192c7536b8..669680ce580a 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -150,12 +150,23 @@ static void amd_pmf_update_bios_inputs(struct
> amd_pmf_dev *pdev, u32 pending_req  static void
> amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  					   struct ta_pmf_enact_table *in)
>  {
> +	struct cbi_ring_buffer *rb =3D &pdev->cbi_buf;
> +	struct bios_input_entry entry =3D { };
>  	unsigned int i;
>=20
> +	guard(mutex)(&pdev->cbi_mutex);
> +
>  	for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>  		amd_pmf_set_ta_custom_bios_input(in, i, pdev-
> >cb_prev.custom_bios_inputs[i]);
>=20
> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) =3D=3D 0)
> +		return;	/* return if ring buffer is empty */
> +
> +	entry =3D rb->data[rb->tail];
> +	rb->tail =3D (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +
> +	/* If no active custom BIOS input pending request, do not consume
> further work */
> +	if (!entry.preq)
>  		return;
>=20
>  	if (!pdev->smart_pc_enabled)
> @@ -165,20 +176,14 @@ static void
> amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  	case PMF_IF_V1:
>  		if (!is_apmf_bios_input_notifications_supported(pdev))
>  			return;
> -		amd_pmf_update_bios_inputs(pdev, pdev-
> >req1.pending_req, custom_bios_inputs_v1,
> -					   pdev->req1.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, entry.preq,
> custom_bios_inputs_v1,
> +entry.val, in);
>  		break;
>  	case PMF_IF_V2:
> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req,
> custom_bios_inputs,
> -					   pdev->req.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, entry.preq,
> custom_bios_inputs,
> +entry.val, in);
>  		break;
>  	default:
>  		break;
>  	}
> -
> -	/* Clear pending requests after handling */
> -	memset(&pdev->req, 0, sizeof(pdev->req));
> -	memset(&pdev->req1, 0, sizeof(pdev->req1));
>  }
>=20
>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct
> ta_pmf_enact_table *in) diff --git a/drivers/platform/x86/amd/pmf/tee-if.=
c
> b/drivers/platform/x86/amd/pmf/tee-if.c
> index 6e8116bef4f6..add742e33e1e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev
> *dev)
>  		status =3D ret =3D=3D TA_PMF_TYPE_SUCCESS;
>  		if (status) {
>  			dev->cb_flag =3D true;
> +			dev->cbi_buf.head =3D 0;
> +			dev->cbi_buf.tail =3D 0;
>  			break;
>  		}
>  		amd_pmf_tee_deinit(dev);
> --
> 2.34.1

