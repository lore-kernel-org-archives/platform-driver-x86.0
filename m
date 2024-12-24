Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23591940A1;
	Tue, 24 Dec 2024 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.152.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735032719; cv=fail; b=Nv7LdaQhhx6hxfvkQY0Lp/63c0COkx31VM5Rnc7ghXouNi9KuQlOH0qr2W0I6ZwUFWd3+xlArAKeiEOE6+Ys/v7g0dPXvEn4kI2ficnDgI4JG4phWMPXrY8M4qiBGN/EcO5m+njH0h//1/Z8Hhim667y/o3NMidTru45eb+zdyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735032719; c=relaxed/simple;
	bh=MSgFWkJIFYN+KjBdMDi8dfX40ghNMCQODmj5X8tTky8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bTUt826uu4gFXpNFJXRjrww+D6dptM5SB1dkmNCtr8TrZvOnopz8OnscrtBTWMu7eW4cQDRopvWhn3E3v1GPPRLyRC0YP5dbMsA4ZXhMqxvJ95x4J3DqLwgkssI3oofUxi2bRQbW0shARsx730PK1PDgq8IrARTvbi2Djhol+Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=ZEm/e9K2; arc=fail smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="ZEm/e9K2"
Received: from pps.filterd (m0355092.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO9FFll012077;
	Tue, 24 Dec 2024 09:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=c21uIpfUd0nDTN3T7FwOGIlrRScR9wkldG2xJUm+hRw=; b=ZEm/e9K26SjN
	F3XDF3YIoEE2u28rbdN78cjzBUUBdzMPpbS19qzDcUG9bbDJq9CWCWTcf06dQi4T
	j4tq7vA0YomLyT1ZCAKecWIm+CbKpRY3bez+z+s/UsdQqJCqAquy/ZQpmGaznpx3
	UiyfdM2rXAl0SeFtTsolhxtc5sVDRXmw1WZrbEsmQOW8geGNwW6Wya1YT+zFfXRK
	cGN4Cf0nJWwjK0/ZKvV7vJQnsoXdhzDjnyA9jVzPO8uWReIt5Pz/knKjywvONYv3
	BHwqTiNbnz34ePk2+qtpD0o29H+5/kET3FbHxieHgoV4M4dfkiRGK3i0xJtTzG9B
	nmcvBEh93g==
Received: from hk3pr03cu002.outbound.protection.outlook.com (mail-eastasiaazlp17011027.outbound.protection.outlook.com [40.93.128.27])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 43qt5r020w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 09:29:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1ljXA04HVc0V4iiVN24Hq3gu2Fo6ws4Sjz5rzJycOp5SOw2x5ai0wPo/16Uw3CxhxYcxBs4/D9syUTf0XHi1eOIxx0QvP92oc14/GX+DRhLX5lZrsX1JThkq4WBOzmmeTotvEXt9RByWx6SciJyLUYikoBGY4ol6SsYbsU2EDPdHdThUHIN0Qy/YVDkL8LGnI/UKatuujaUJawqsqiWMyaa1OuNmnz9dV5uCIp43f7KuIf+oVMjMcEHrcaBJpeDyRDfhlVfmlwiClrwr4pm8LzslATMezYc5Fd/oJ6ldmBX5UV9T2UdkHFW0YetWN9/6YQkkIExv1NiaKs0Q/23oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c21uIpfUd0nDTN3T7FwOGIlrRScR9wkldG2xJUm+hRw=;
 b=HH15yjP2S09j5H+60TPo0BfcpcIFVu1yv/c6GYip+XAwsNpC+FEw9/yjMugV8P65TeA60qz8ZYwnFQw6qeK2eGfz6OXVZRpZ377AMem0OR3apWT2vfjTh8aErDENuti1VMEBIWiTjRqeRiiz6ouJXkhQr+xxSCKrF9SAMrPX9/I0sMmU64otmdURYW7yx6E4uvjtDQ76EM8V4iwXIGaC55s1zE7t57AVWm0M55ey5El2VIYTxE+07oRk3jU3tTw9wWx1iur17xlVOJNADH4OBsV6SVatUVRBfhXuVdPoWbEojPkZzF05QqFph9G1Ry9C8hKdwvYl9HNLjNDVNhDczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SEYPR03MB8067.apcprd03.prod.outlook.com (2603:1096:101:167::9)
 by KL1PR03MB8195.apcprd03.prod.outlook.com (2603:1096:820:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 09:29:03 +0000
Received: from SEYPR03MB8067.apcprd03.prod.outlook.com
 ([fe80::c366:f663:c467:87b7]) by SEYPR03MB8067.apcprd03.prod.outlook.com
 ([fe80::c366:f663:c467:87b7%7]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 09:29:03 +0000
From: Jackie EG1 Dong <dongeg1@lenovo.com>
To: Armin Wolf <W_Armin@gmx.de>, Jackie Dong <xy-jackie@139.com>,
        "ike.pan@canonical.com" <ike.pan@canonical.com>,
        "hdegoede@redhat.com"
	<hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>,
        "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "bo.liu@senarytech.com"
	<bo.liu@senarytech.com>,
        "kovalev@altlinux.org" <kovalev@altlinux.org>,
        "me@oldherl.one" <me@oldherl.one>,
        "jaroslaw.janik@gmail.com"
	<jaroslaw.janik@gmail.com>,
        "cs@tuxedo.de" <cs@tuxedo.de>,
        "songxiebing@kylinos.cn" <songxiebing@kylinos.cn>,
        "kailang@realtek.com"
	<kailang@realtek.com>,
        "sbinding@opensource.cirrus.com"
	<sbinding@opensource.cirrus.com>,
        "simont@opensource.cirrus.com"
	<simont@opensource.cirrus.com>,
        "josh@joshuagrisham.com"
	<josh@joshuagrisham.com>,
        "rf@opensource.cirrus.com"
	<rf@opensource.cirrus.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
        "waterflowdeg@gmail.com" <waterflowdeg@gmail.com>
Subject: RE: [External] Re: [PATCH 1/2] platform/x86: ideapad-laptop: Support
 for mic and audio leds.
Thread-Topic: [External] Re: [PATCH 1/2] platform/x86: ideapad-laptop: Support
 for mic and audio leds.
Thread-Index: AQHbVMHKYfDwdXDZg0icS7XdDMo+sLL1HRIA
Date: Tue, 24 Dec 2024 09:29:03 +0000
Message-ID:
 <SEYPR03MB806740FFA11B805DA08F6C1495032@SEYPR03MB8067.apcprd03.prod.outlook.com>
References: <20241219101531.35896-1-xy-jackie@139.com>
 <7a7071ed-0a9a-4def-bfda-9fea60b09115@gmx.de>
In-Reply-To: <7a7071ed-0a9a-4def-bfda-9fea60b09115@gmx.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB8067:EE_|KL1PR03MB8195:EE_
x-ms-office365-filtering-correlation-id: c37db6c6-3d58-491e-3ff7-08dd23fd67d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?f9Lmpay0EXVl6ARZlxE6A/5B6PjnVDHe4plWhBY9WyID2nVm+iDdH/ujcBul?=
 =?us-ascii?Q?SXqhE6B/r74PgmMQYNncfaZDWv/EdXZm5hQ62V13S7uYSoMBCOoCqV5M1dlK?=
 =?us-ascii?Q?KqzSg9fY4bLep1GvlT+V2oJbPFaZlu4YK6ieCEKwRuFdGZmGyTIAvVk3dsSD?=
 =?us-ascii?Q?dgGZmCNWBK0n87/7Sxkpl8Foe1XJusmM6JcscpEmthpu1Rm4qF2WBoZ9tpd/?=
 =?us-ascii?Q?ftJtr6gu8Z8GhkwbHFvENH3VPX7H3aFedSgl6rxmLblm7V2p/8uPZHkwoAtn?=
 =?us-ascii?Q?t/IhwQlYxHcQXiRmONZGoDALn0xHqjxr/h3FNGMNzgoQqz6wt8jgfXYRuQZm?=
 =?us-ascii?Q?JW02IIQL2yOZAy/S++SZ1pJYqt/YvZSdoaI5mUICfiOEWhD+vw0PRaxuJQWs?=
 =?us-ascii?Q?+/1p6mlEdTuBORbK24QL2XGOpc8A+NdQsJbb0wWgPz/ONmpNQHAYNNOwKEQN?=
 =?us-ascii?Q?BzAR7qavU4uSfK2aGEobJTnBd63qlAxBDWKfr4QIetZwNgBX4O6Hkxkn47vE?=
 =?us-ascii?Q?MxZtJVkE19ckSqAte3xYePg/0ui8rexrbi+HeBUr9mLQjPP4Y/tCrhBXG+7k?=
 =?us-ascii?Q?ihnqTGS4XOmZvUadgz622fndJZSGIUoXtDIgwvUc6fysCJLcLvfCR/fn+DCU?=
 =?us-ascii?Q?C10B1S9cxaHZNwW7G7sYKIeHpfLeD7Bfo93e8S8DdRA3PmykBq79FpdEjbsA?=
 =?us-ascii?Q?zLucobaLPLVmgrB09Ho//tgjXhakYmdFha8ImdfSL+vUDzb6PHR1//n2VLE/?=
 =?us-ascii?Q?44eJPYeVpikHR39cq8yMiDdwRcm7IwGFdAefefSA47BFYYFsoJ78+IzVetn3?=
 =?us-ascii?Q?XKpU/HkybSzpNwtwy6rs2seuIhHouTiGzIhvDFakswUKJrQ39J7uL2m1PNsg?=
 =?us-ascii?Q?FLYX/dz+d+Ux5g8RopPR57jSz0eqC4gy8AY8WZfnpIq/Kkm+zdcfqWNQqPYz?=
 =?us-ascii?Q?mx5Ief8FITo/jhWYDFKI7T0OQplL4fEmCx+V+aEeqVmRnHl/98XbVABv6MCB?=
 =?us-ascii?Q?4fjO08uO6VrMDigMlnoLjP0cKjDCPIgp4ixZunFMwyudJAgh27KcW9lrZwDh?=
 =?us-ascii?Q?VFE5YXRDn7IysUpgC26zpK7Y1LN+Z4f+UQlYeFslfYw0wI9tlrGhlAaY/Mhd?=
 =?us-ascii?Q?LxbOzPYrXk/vk1qUgWaB0P6JC6BrWXWjJU0m09mHHJ1hssjTffsrkHRfCX0P?=
 =?us-ascii?Q?xd+wMBZ5TM34iQS3X07gVUf4kuW02ov4S+yZu/U1z8/E23AYOpaLVp3ecmNh?=
 =?us-ascii?Q?F4zoDR1lgwfzuMCemZzUyNceYN+kUK0+PUyxNY2N0WLLdeSu7sAQuDBbVsnJ?=
 =?us-ascii?Q?lMgIknriIK1B8k3t4xROhSI2sHPzz+51DeN+C5cD/eT4bBobxgGbF1DRVDzJ?=
 =?us-ascii?Q?g4XLYEjnZTfk1OnmpCkIx4uSQJ7Q6seoiKsW9LvAvjH2/uQjcVG2i3mFdaEC?=
 =?us-ascii?Q?zWXR2ea4xp//e4VruPpgjsfoPMCMeciIiV2FpmW3hqpXt6QNca0S+A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB8067.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dfb99b//NXc5P+UBnWamka+EwPCyUMaGnCtPzlMenL202xbCQzOojHJbXBIT?=
 =?us-ascii?Q?bNSWYWojNWrtF8OJTphksdsUl9KHomtt6zz7P6Zyv7cKMd9UuKG04F574X/3?=
 =?us-ascii?Q?iL7Vj8pDPD65POe4YvCzynGu2l0p3agaw7tcrZBQ5DI392tslBlDwE5HSWZr?=
 =?us-ascii?Q?M8pn2p0pL30ABt5yqYl9+IFNYCVYKUQwzjz3Cc9uARJlb+7k5FPe6ZEpGN74?=
 =?us-ascii?Q?Zu1O+QLdOkLeB0I4I5f2/2FMyq9S82At7vIz2spCkdMdV4eqnQdtLQ8CEfPV?=
 =?us-ascii?Q?d892MVomchmj59w+YIQNaMyBjTfa4CaqE5fQ8ggP9QPtpN+GTuIyVSfshc5G?=
 =?us-ascii?Q?+qwGL21pfoKBFRzVz50D2FqJocZ+YS9RRlxAwuaEfJoxRe+wiSveClrdv50n?=
 =?us-ascii?Q?hg2QZHHKYGlLaswR+pcFTCzEDjf27keaLUQb4IaB2UXxmmGzIX2ZFmlYk66P?=
 =?us-ascii?Q?l6oAbUDVDXos2nOqXWqum0Z2d5W7jhHMCZB+5EXlUCsNozQx4z4OgBOyNJfk?=
 =?us-ascii?Q?DNPyrkKzBwTlCnQdt9Ev/z5UGoTR5N5yF+JbzQe3LBjLNkEc4jl2kYPuwfos?=
 =?us-ascii?Q?SqL0laHO4+vCFcZDHiYD5vfWKuCl3e4YxXjD93hDyLoULfapiYj/We3TkZAd?=
 =?us-ascii?Q?Juu1c9Gfe601rBj80pxQL80swpjb3y4B6A+HOkDICVLP4YksWUw58dBDK8k3?=
 =?us-ascii?Q?GXld0uvr4r24qMUd7pkUGMk8YjjykQxQMSPRQvixgjIfcXycxYN2SFcrtgwM?=
 =?us-ascii?Q?u6ZhmsfconmDLjz38bQj9GodFjIta7RPJWXQl8H5SCiPcjvFpLQDKwES0eC8?=
 =?us-ascii?Q?PSw/h70/iV0B6fK6UFaE8mDen/GA6EGUvxTJ3DtGt+wk3Jrs2sE0MuQS44AU?=
 =?us-ascii?Q?6HaJexVwQHgoVWSmGoOIeM24bgbQSfx/CMXUKGueLh4WV2y6+MUD4c4Sf8Of?=
 =?us-ascii?Q?nSIgD2t0A1B70EncQIFwTHaS6yrpMiO70AUUidFoLJLStprPd3Ebs9rFJatS?=
 =?us-ascii?Q?OyYUoIlXHwNRXeAY8A7CMR+Xu4zTjdn1HjjtOeWx9XOxKlkDaLegz6LM08UX?=
 =?us-ascii?Q?JM3GsgjGiiHZXhrXAa/owguASc0eYM8mRwmHj7C8fBuL3aHqDTs/5lhfJAr8?=
 =?us-ascii?Q?av6iSPEWoVcahvu39f0+Wf1Qy/fdBtFxmouHTEwMDi0AWafJf7dYcxCiVHvs?=
 =?us-ascii?Q?pptXOo7Lpkub6v2j9OFpO3S6lMmA41ElFt39AIB21UavuckDsCmndtC+dCKg?=
 =?us-ascii?Q?22HdWx5u3N1R5I1hxFGKty0yGdjW8cZ32dTnLLlzIEuBRwGO+pc/TTOIyDbB?=
 =?us-ascii?Q?SgdMCslvl3b420usKGpWCDDwqnwqN3yDITI160W+skAuStojaivImNSRKqgA?=
 =?us-ascii?Q?jhHnoC6r+6AYwJmHunISIOFflEKaNGvEYdDf9dV91pHKE/h0WMXKm3K//Dm2?=
 =?us-ascii?Q?PiZNGzaKGGugQFAyZXPkwzD2AqqJwam7CnhSOPsC2tnFaO9MuPWpiTrbb+12?=
 =?us-ascii?Q?TX3wYgGLSVD52sQQKmEneVwxuTz8pQIvZRR9MjuIkn+bDBfGSnS3tAyEFWTE?=
 =?us-ascii?Q?HO0gwWUTJ8t1Xf+GZQs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB8067.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37db6c6-3d58-491e-3ff7-08dd23fd67d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 09:29:03.2023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 45yvTIr5DB8O40i8qovzJ8p82uRPEfzUuasNu+I7QxUDBiE0JDMxnAlmBXZchQzE7Dyg63FegsMXSY9J1Xccjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8195
X-Proofpoint-GUID: G-DrNstYXaZZle_q_rnb_RH1QgjT--N3
X-Proofpoint-ORIG-GUID: G-DrNstYXaZZle_q_rnb_RH1QgjT--N3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=-20 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240078

Dear Armin,
   CE6C0974-0407-4F50-88BA-4FC3B6559AD8 is a WMI interface method.
   From Lenovo keyboard WMI specification, I found it applicable to LNB pro=
ducts, i.e. YOGA/XiaoXin/Gaming/ThinkBook etc and performs the Lenovo custo=
mized hotkeys function for Consumer and SMB notebooks.
   I implemented the audio mute LED and mic mute LED function of IdeaPad no=
tebook in ideapad_laptop driver, because I found the mute LED function of T=
hinkpad notebook is implemented by thinkpad_acpi. And ideapad_laptop driver=
 has the similar function as thinkpad_acpi.

   Thanks,
Jackie Dong

-----Original Message-----
From: Armin Wolf <W_Armin@gmx.de>
Sent: Monday, December 23, 2024 6:34 AM
To: Jackie Dong <xy-jackie@139.com>; ike.pan@canonical.com; hdegoede@redhat=
.com; ilpo.jarvinen@linux.intel.com; perex@perex.cz; tiwai@suse.com; bo.liu=
@senarytech.com; kovalev@altlinux.org; me@oldherl.one; jaroslaw.janik@gmail=
.com; cs@tuxedo.de; songxiebing@kylinos.cn; kailang@realtek.com; sbinding@o=
pensource.cirrus.com; simont@opensource.cirrus.com; josh@joshuagrisham.com;=
 rf@opensource.cirrus.com
Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; linu=
x-sound@vger.kernel.org; mpearson-lenovo@squebb.ca; waterflowdeg@gmail.com;=
 Jackie EG1 Dong <dongeg1@lenovo.com>
Subject: [External] Re: [PATCH 1/2] platform/x86: ideapad-laptop: Support f=
or mic and audio leds.

Am 19.12.24 um 11:15 schrieb Jackie Dong:

> Implement Lenovo utility data WMI calls needed to make LEDs work on
> Ideapads that support this GUID.
> This enables the mic and audio LEDs to be updated correctly.
>
> Tested on below samples.
> ThinkBook 13X Gen4 IMH
> ThinkBook 14 G6 ABP
> ThinkBook 16p Gen4-21J8
> ThinkBook 16p Gen8-IRL
> ThinkBook 16p G7+ ASP

Hi,

i am a bit confused regarding the role of the CE6C0974-0407-4F50-88BA-4FC3B=
6559AD8 WMI device:

- is it a event or a method block?

- is it in some way connected with the remaining WMI devices supported by t=
he ideapad-laptop driver?

Looking at the code it seems to me that the CE6C0974-0407-4F50-88BA-4FC3B65=
59AD8 WMI device is not a event device and is not directly connected with t=
he remaining WMI devices (please correct me if i am wrong).

Can you please write a separate driver for this WMI device? Getting the ide=
apad-laptop driver involved in this seems to be unreasonable since the audi=
o led functionality does not interact with the remaining driver.

This might be helpful: https://docs.kernel.org/wmi/driver-development-guide=
.html.

>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Jackie Dong <xy-jackie@139.com>
> Signed-off-by: Jackie Dong <dongeg1@lenovo.com>

Please keep only the Signed-of tag with the email address used for sending =
this patch.

Besides that its always nice to see vendors getting involved with upstream =
:).

Thanks,
Armin Wolf

> ---
>   drivers/platform/x86/ideapad-laptop.c | 157 +++++++++++++++++++++++++-
>   1 file changed, 156 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c
> b/drivers/platform/x86/ideapad-laptop.c
> index c64dfc56651d..acea4aa8eac3 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -32,6 +32,7 @@
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
>   #include <linux/wmi.h>
> +#include <sound/control.h>
>   #include "ideapad-laptop.h"
>
>   #include <acpi/video.h>
> @@ -1298,6 +1299,15 @@ static const struct key_entry ideapad_keymap[] =3D=
 {
>       { KE_END },
>   };
>
> +/*
> + * Input parameters to mute/unmute audio LED and Mic LED  */ struct
> +wmi_led_args {
> +     u8 ID;
> +     u8 SubID;
> +     u16 Value;
> +};
> +
>   static int ideapad_input_init(struct ideapad_private *priv)
>   {
>       struct input_dev *inputdev;
> @@ -2023,15 +2033,145 @@ static void ideapad_check_features(struct ideapa=
d_private *priv)
>   /*
>    * WMI driver
>    */
> +#define IDEAPAD_ACPI_LED_MAX  (((SNDRV_CTL_ELEM_ACCESS_MIC_LED -\
> +             SNDRV_CTL_ELEM_ACCESS_SPK_LED) >> SNDRV_CTL_ELEM_ACCESS_LED=
_SHIFT)
> ++ 1)
> +
>   enum ideapad_wmi_event_type {
>       IDEAPAD_WMI_EVENT_ESC,
>       IDEAPAD_WMI_EVENT_FN_KEYS,
> +     IDEAPAD_WMI_EVENT_LUD_KEYS,
>   };
>
> +#define WMI_LUD_GET_SUPPORT 1
> +#define WMI_LUD_SET_FEATURE 2
> +
> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
> +
> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
> +
>   struct ideapad_wmi_private {
>       enum ideapad_wmi_event_type event;
> +     struct led_classdev cdev[IDEAPAD_ACPI_LED_MAX];
>   };
>
> +static struct wmi_device *led_wdev;
> +
> +enum mute_led_type {
> +     MIC_MUTE,
> +     AUDIO_MUTE,
> +};
> +
> +static int ideapad_wmi_mute_led_set(enum mute_led_type led_type, struct =
led_classdev *led_cdev,
> +                                 enum led_brightness brightness)
> +
> +{
> +     struct wmi_led_args led_arg =3D {0, 0, 0};
> +     struct acpi_buffer input;
> +     acpi_status status;
> +
> +     if (led_type =3D=3D MIC_MUTE)
> +             led_arg.ID =3D brightness =3D=3D LED_ON ? 1 : 2;
> +     else if (led_type =3D=3D AUDIO_MUTE)
> +             led_arg.ID =3D brightness =3D=3D LED_ON ? 4 : 5;
> +     else
> +             return -EINVAL;
> +
> +     input.length =3D sizeof(struct wmi_led_args);
> +     input.pointer =3D &led_arg;
> +     status =3D wmidev_evaluate_method(led_wdev, 0, WMI_LUD_SET_FEATURE,
> +&input, NULL);
> +
> +     if (ACPI_FAILURE(status))
> +             return -EIO;
> +
> +     return 0;
> +}
> +
> +static int ideapad_wmi_audiomute_led_set(struct led_classdev *led_cdev,
> +                                      enum led_brightness brightness)
> +
> +{
> +     return ideapad_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness); =
}
> +
> +static int ideapad_wmi_micmute_led_set(struct led_classdev *led_cdev,
> +                                    enum led_brightness brightness) {
> +     return ideapad_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness); }
> +
> +static int ideapad_wmi_leds_init(enum mute_led_type led_type, struct
> +device *dev) {
> +     struct ideapad_wmi_private *wpriv =3D dev_get_drvdata(dev);
> +     struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +     struct acpi_buffer input;
> +     union acpi_object *obj;
> +     int led_version, err =3D 0;
> +     unsigned int wmiarg;
> +     acpi_status status;
> +
> +     if (led_type =3D=3D MIC_MUTE)
> +             wmiarg =3D WMI_LUD_GET_MICMUTE_LED_VER;
> +     else if (led_type =3D=3D AUDIO_MUTE)
> +             wmiarg =3D WMI_LUD_GET_AUDIOMUTE_LED_VER;
> +     else
> +             return -EINVAL;
> +
> +     input.length =3D sizeof(wmiarg);
> +     input.pointer =3D &wmiarg;
> +     status =3D wmidev_evaluate_method(led_wdev, 0, WMI_LUD_GET_SUPPORT,=
 &input, &output);
> +     if (ACPI_FAILURE(status)) {
> +             kfree(output.pointer);
> +             return -EIO;
> +     }
> +     obj =3D output.pointer;
> +     led_version =3D obj->integer.value;
> +
> +     wpriv->cdev[led_type].max_brightness =3D LED_ON;
> +     wpriv->cdev[led_type].dev =3D dev;
> +     wpriv->cdev[led_type].flags =3D LED_CORE_SUSPENDRESUME;
> +
> +     if (led_type =3D=3D MIC_MUTE) {
> +             if (led_version !=3D WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
> +                     dev_info(dev, "This product doesn't support mic mut=
e LED.\n");
> +                     return -EIO;
> +             }
> +             wpriv->cdev[led_type].name =3D "platform::micmute";
> +             wpriv->cdev[led_type].brightness_set_blocking =3D &ideapad_=
wmi_micmute_led_set;
> +             wpriv->cdev[led_type].default_trigger =3D "audio-micmute";
> +
> +             err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_ty=
pe]);
> +             if (err < 0) {
> +                     dev_err(dev, "Could not register mic mute LED : %d\=
n", err);
> +                     led_classdev_unregister(&wpriv->cdev[led_type]);
> +             }
> +     } else {
> +             if (led_version !=3D WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
> +                     dev_info(dev, "This product doesn't support audio m=
ute LED.\n");
> +                     return -EIO;
> +             }
> +             wpriv->cdev[led_type].name =3D "platform::mute";
> +             wpriv->cdev[led_type].brightness_set_blocking =3D &ideapad_=
wmi_audiomute_led_set;
> +             wpriv->cdev[led_type].default_trigger =3D "audio-mute";
> +
> +             err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_ty=
pe]);
> +             if (err < 0) {
> +                     dev_err(dev, "Could not register audio mute LED: %d=
\n", err);
> +                     led_classdev_unregister(&wpriv->cdev[led_type]);
> +             }
> +     }
> +
> +     kfree(obj);
> +     return err;
> +}
> +
> +static void ideapad_wmi_leds_setup(struct device *dev) {
> +     ideapad_wmi_leds_init(MIC_MUTE, dev);
> +     ideapad_wmi_leds_init(AUDIO_MUTE, dev); }
> +
>   static int ideapad_wmi_probe(struct wmi_device *wdev, const void *conte=
xt)
>   {
>       struct ideapad_wmi_private *wpriv;
> @@ -2043,6 +2183,12 @@ static int ideapad_wmi_probe(struct wmi_device *wd=
ev, const void *context)
>       *wpriv =3D *(const struct ideapad_wmi_private *)context;
>
>       dev_set_drvdata(&wdev->dev, wpriv);
> +
> +     if (wpriv->event =3D=3D IDEAPAD_WMI_EVENT_LUD_KEYS) {
> +             led_wdev =3D wdev;
> +             ideapad_wmi_leds_setup(&wdev->dev);
> +     }
> +
>       return 0;
>   }
>
> @@ -2088,6 +2234,9 @@ static void ideapad_wmi_notify(struct wmi_device *w=
dev, union acpi_object *data)
>                                    data->integer.value | IDEAPAD_WMI_KEY)=
;
>
>               break;
> +     case IDEAPAD_WMI_EVENT_LUD_KEYS:
> +             break;
> +
>       }
>   }
>
> @@ -2099,10 +2248,16 @@ static const struct ideapad_wmi_private ideapad_w=
mi_context_fn_keys =3D {
>       .event =3D IDEAPAD_WMI_EVENT_FN_KEYS
>   };
>
> +static const struct ideapad_wmi_private ideapad_wmi_context_LUD_keys =3D=
 {
> +     .event =3D IDEAPAD_WMI_EVENT_LUD_KEYS
> +};
> +
>   static const struct wmi_device_id ideapad_wmi_ids[] =3D {
>       { "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc =
}, /* Yoga 3 */
>       { "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc =
}, /* Yoga 700 */
> -     { "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_k=
eys }, /* Legion 5 */
> +     { "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_k=
eys }, /* FN keys */
> +     { "CE6C0974-0407-4F50-88BA-4FC3B6559AD8",
> +&ideapad_wmi_context_LUD_keys }, /* Util data */
> +
>       {},
>   };
>   MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
