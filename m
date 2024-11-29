Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C5D193
	for <platform-driver-x86@vger.kernel.org>; Fri, 29 Nov 2024 00:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732839094; cv=fail; b=hdwmuXMq9+EoUVgpYYplilgN91hgvyZv91omzqad3YTistrbyb8OHyngn1/IPmIBkQ0C2+MAmiRG/wU51rOArCFXw/Zx9wszWsxYEC3KQ0DPM36IZQyB8xR9fBVN2fucphXvxhfO8ugh4MiMFOmhQiMN+/rZokC7iAljp58N5IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732839094; c=relaxed/simple;
	bh=qa/TGFDnWmAAe+QoF1POGfJlzybTOamDGtZTQKlH/Mg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ts777P8v4iBLeyqxIt8fMCoLzo0nCQ9FghPqPTrKO/nk+X1BcYtjbKthtBTPLzXYpHtVwCC7/YGWz9BGKsza7jJaVbEv7Bj0uk26T7+ERjfE+X/S1+quIXqW9/WwiZ1vj3XwmzYZhJKJdLQSIe4x6QgvDSEKwGKCVCBRGnTDO64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=fs1iMD+o; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=BHd6g1oR; arc=fail smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fs1iMD+o";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="BHd6g1oR"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732839093; x=1764375093;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qa/TGFDnWmAAe+QoF1POGfJlzybTOamDGtZTQKlH/Mg=;
  b=fs1iMD+oyK5pEb+TmPYoAbmzaCVKHSS6dxB0/DFGJD8LPUnOPyCFgoFB
   cmZ/UpKh0zXXuUFrIubQzXiyAbGlSXZJaxWWidy2+WO1pgKR1gey/C5Ns
   gnSrBc8Vi/MlChFdwydSKvxTvYkskvyyxlRjxyXAMTEeQ0yv0MEs0Vb59
   52Fjv8JRcxdP6W/b7H+2dMs7ht3UvbpF+dd4Oi7m8eQI4Ie8/o9fr8Bx+
   oNqBMu4zjgnACe2Rn+mi1FVn//OilVb+yYJsaa7xuEZejXiAaEdgUC+O1
   Lsdkf867bUuVVhmumh3sinapCEAxMj6tyezzc+cm3FH1XBBP1VQPUocTY
   g==;
X-CSE-ConnectionGUID: YlsqAggQTJS/3Qo6uR16qw==
X-CSE-MsgGUID: FE6aYjVDTl6y7jnjLwz0OA==
X-IronPort-AV: E=Sophos;i="6.12,194,1728921600"; 
   d="scan'208";a="32680536"
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
  by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2024 08:11:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXz8r7UUv95yQmUguQ+oOfrfQ7aYeGKjvNhSQLEmq+M8CMmchh9tOJzQqMXtf/kuuMyxmWFRmAFc7KC3TpoHUpu1UQiO10K3e5BvItRzXx6mOE46qEOV9uWjEMSUXfeiM/YAsHz9/HnoDK81YFEUVLHXM9hdlxugghQio/boeOJ/mfbsLkvCtn0RRwY5JKSXp0jJvwhbKGPCQUtc8NWKEYAgNF2jm9qiIxkycDXa54+lPBvhCqGuPf6rhP6XWCMZQn2gARThQjHPGooQoWxEiri28FoZPt6aAcxKLNOwmiowRYcnEnRSbMS+OtttcIrUmsmxGfzlxBAs3nUogWB46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uNRzBsvOcnGnwR4NEli1Y1aiaIKLrau/aStmrRLh7g=;
 b=aggcLCcCvKG0LCViF5orQpGmq1xEcGgCkrww1mdWbcRKGr9RirQkJ/fbFbRzBcMXxGMuydUNsoG0bkts6Mr/Flnq/ctzTBBeQCbdtSIGvwM5nOdbTm+/zK2WlqKMswxXTqfPH96ECdV1CeXNupWUie5gMEQAM5Riku31ZCXPnFAy3hNSind1USGjHmlvqdJ/2qIojCdLJo68tWY/RpHyJKzbeqKCjK70szDZnBkquoDzfoT5lXvm+1lACDpO+7htRB9AofuQz8nvncgnoglrugpn7NpHArfL/OPd/PX8GoLdzjvl7D+ZH+QGSWLsMtxehxpXAkn9f1wPpWcJsTNPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uNRzBsvOcnGnwR4NEli1Y1aiaIKLrau/aStmrRLh7g=;
 b=BHd6g1oRM/J33TkwTaUFqIH2fgM7KE/TFFJkR3SdfjuBLzFjZoGTcM5K9vbfq9ufyk2sJbgyxz9Kb1TQmEIN5ryMfpmkB21dgRWP+SuNtLzoYIldh56meX59o8dc8FXaCalUQLeprpCX0RqFiatIQVuKxM8QLug4LbQ5sFVWdD0=
Received: from BN0PR04MB8048.namprd04.prod.outlook.com (2603:10b6:408:15f::17)
 by LV3PR04MB9324.namprd04.prod.outlook.com (2603:10b6:408:286::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 00:11:23 +0000
Received: from BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::2482:b157:963:ed48]) by BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::2482:b157:963:ed48%6]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 00:11:23 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "danielwa@cisco.com" <danielwa@cisco.com>
Subject: Re: [PATCH v3 4/4] p2sb: Do not scan and remove the P2SB device when
 it is unhidden
Thread-Topic: [PATCH v3 4/4] p2sb: Do not scan and remove the P2SB device when
 it is unhidden
Thread-Index: AQHbQJHDV1FYGQWu20KpOYadO+0wTrLK4+sAgADzKQCAANJzAIAAu8YA
Date: Fri, 29 Nov 2024 00:11:23 +0000
Message-ID: <pjqoabmmpiqslwlebl7afab2zxvjzm2qzxbljhixfgha3ohpiq@c52lm2rm2iky>
References: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
 <20241127060055.357498-5-shinichiro.kawasaki@wdc.com>
 <9606e49a-0a8a-450c-bece-a834df8ea480@redhat.com>
 <24wfa4ytdy5brrtflstsnwfspq4eqontuqqwqk4xbeeal67ppi@mcb2amxhhdtd>
 <Z0hpJu95bzEq9E8f@smile.fi.intel.com>
In-Reply-To: <Z0hpJu95bzEq9E8f@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR04MB8048:EE_|LV3PR04MB9324:EE_
x-ms-office365-filtering-correlation-id: 4a3cb573-ca40-4fef-f9a1-08dd100a5c0a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xJA75ZFIzd6Ues9DvtyzJtEYxrEKo9EalBEXqpN70wQN5OVaf4QDHPc6w0F/?=
 =?us-ascii?Q?onTyF6UiN1PcAJXQQXpttjQNnXOap/ixMv86FzKWf3FkDxgZrEpcc+HLBf8b?=
 =?us-ascii?Q?kI68l61awWCJM3UCfZAaTzaE+Dx0yUVl05RyMZjO9Jm3a/jp/WmbOzfZ3rNl?=
 =?us-ascii?Q?jGIY9w4ZilWy5R5QrFL/lsy/Jm6ddcFnJ3QsnI8/txngTq8t4pmtBuhQ1YZ3?=
 =?us-ascii?Q?/9Db6nbrykx82ZVjaHtpAmAms011NWezbe3dZHhoIGw096QXGbD5oBrGFbxS?=
 =?us-ascii?Q?nZ9M8RgBXUPV6TJqb9NlSEij2TEKHhE85GtrFmOyrCy3ggowK7eIjt/naWW/?=
 =?us-ascii?Q?H8/7i1KzA5U7PKDwcINYEd99+THjadEnSUGHTtg8IfSPcCj9xBd2MT3WfqoY?=
 =?us-ascii?Q?34o9K7gD2Ggb67YIETrkLePfCAeQeli2Hehj81azoyYov74vDujP5qcqxe18?=
 =?us-ascii?Q?t5rB6kdt2qDtMYj3VIjNrSSSYinwXDkar9PBRBg4MJlSKW13xsKXiEMRHsz/?=
 =?us-ascii?Q?iBclRboQssSZ55mo2oj+wpUOQhSjqScXWi30r32Lsp3tBSrWkglNbJLIe2eC?=
 =?us-ascii?Q?2cxQW0qoiho3Pz/0v7yaDsCBT/rc0T/i19W3jQS+2JkKqTYXcnBK8cHMI2Jl?=
 =?us-ascii?Q?31e+igK16vx7BEhm71MkjPrewq+QJvuYwX88/jyXrbbkOShN4N8kH2fWMjPQ?=
 =?us-ascii?Q?csGEw070wrYZQ3WYeJ5vdsm++wwDf+DcT+5YW4SiEincvSkRj0Ywa5uavRq2?=
 =?us-ascii?Q?qSF4J+pM2J2J6Qeh2jpz8LYZVhOwGnlnIplQYRoDz5C7M4V9cAypc94J07uw?=
 =?us-ascii?Q?lHOD3aiUAafcltPCeKvMmMT5PM4F0DL4U/3tg66c7XmycX9Fy2471EscGXWC?=
 =?us-ascii?Q?LsvU4v4r8mcU5EVVzlbftwUVbYgvRix49Zob38ghDPRqU2yK7c1YMfqd/d3M?=
 =?us-ascii?Q?arrfNG/gMaM8o1EwmORIUdIlotqi8XXtXt1M9GlZWmxGz9p6DsmJ8Um3u2li?=
 =?us-ascii?Q?4qLV+Li8+8cz7cMpILgRttumJYc8Scvtg0xVZtAL0mKgH0nDabDdSjPT4eSh?=
 =?us-ascii?Q?GIRFKb2DgW/391pc0NlfsiFtzzFUnrTp3mgS63XBioUetDkczMDHcrMCFYwC?=
 =?us-ascii?Q?t1WwBXlI5bRVgBJz2w97kGBQ0oUImZgESAXbduDgIR2Dz0PBxG5Emn9LWo6J?=
 =?us-ascii?Q?ngjtC8kBqvgIlMeyGgLOx4zx4g4k6KEdkj7lhlVvAd8MkwfMGIg3OV3OFy27?=
 =?us-ascii?Q?UjCx0YRvorquDqB9D23OuGvDmPn2dpA/4CnAZF0hS4Ue8BSBGmfOf2g1WI30?=
 =?us-ascii?Q?VWIT1aeEKOrnzH59Fv5LUIJqp3otvlSVuStEj0oKlBx5A1SIavFbkAKbN/cA?=
 =?us-ascii?Q?wuf687y4nEV0bF4aIJf2LEkqrc68QVeqpH2z844pj+9MYZjXsQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR04MB8048.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CKG8ApFow7l29Ph6hJot1iMRgFEisO81CjUVxeQ5s0Wr3ZeMLv3sgZuHFsEs?=
 =?us-ascii?Q?1rowg5xljY5GEqBk100z6Yn29H0Wq/WmLQ8SH0BSMOhssgyTa5T11YFtahed?=
 =?us-ascii?Q?5EbzN0MP3wQ8gi36RGgm0p/Z2wW5Pn7Gogue4tgyJAhmC/VRY4zLpr/2L4zH?=
 =?us-ascii?Q?5Y/Cc9vt4vRR8M90Q4TjMiXR11vLUG8h4CryNWiQqh1/+9MyPBCZE9/Kn049?=
 =?us-ascii?Q?ns9Vjbr+lPT59uGqBglIB9cUX0XdvG3ktZJzMQHMByHpgodkxzTcjqMc4tBg?=
 =?us-ascii?Q?ZVw6vnhHcwQMUprWD5cCrlq14FxOLXD9Tp4fSsxFgk0HQax2HpALAbIg1/wd?=
 =?us-ascii?Q?6ZBGgdFJJe6v12hzItybSb2SiyKdTQhbr8sf++S4tKkwvtuO1aXTFuCyD2av?=
 =?us-ascii?Q?J4l28lhCBauBIkweBQyTab7HiNwEf783vLBbyZ8i89GA+DWSbq/n/5u32hWJ?=
 =?us-ascii?Q?Lf2lYpvkSQ5GTViopfYfqUkegQWIH0w+R00lapnSZ3MK9VKPmipy5wmfOKw2?=
 =?us-ascii?Q?aK/KUFIZMoma7cz1YX5Xu17bejgrsXRzOMgEtuzXwEAc0da539eE+toRis+P?=
 =?us-ascii?Q?6ObeZidD1mOP4u+HwR2MTVlw/p3xHcGxTGKUIaDZ2I4ATsByVD7IV+0OyBoz?=
 =?us-ascii?Q?k36Fji+G2vEFcj4grGHbHz59XirpYF1nqGMZs/qTBaD5dzlu0oJePEV7UWPS?=
 =?us-ascii?Q?G5Qzvm7LjAIp3XVuAt1YDmp5W//nbhxO+mJL4ezZmNcG46FSmVMRMy1TAIfw?=
 =?us-ascii?Q?NLX9ELrk4C4RsjkN3zpCP9q2+H9z48bkC69I9FVR45BO3YXA9u3swH+b4aKF?=
 =?us-ascii?Q?uuaITn8wW2mgHK8gpGWW4rTkLa4qoEzF7r5BEcFbkzFmYmA7CRs3/OpHFq8b?=
 =?us-ascii?Q?E2YX+nFfmiIuzksrjYy2MvTWjn+gVeWepaK8u5eIPaPPA+6XBnieek3Jrilo?=
 =?us-ascii?Q?8RkhPOsuDqPtK5VlCjaFwDjJK5gaoOKwJgFF5DKN5kLPO/ooENtl8cmeJv4+?=
 =?us-ascii?Q?dSYRUrl6dP9r93qsxCs05S6qQrbQ4svLGFXTlEOsB6keU1VF6hFNo2Pc+U0l?=
 =?us-ascii?Q?SZTgTuUqF2TkcbbXA/MNrhypOIokemlGgeODTceNif9Ajl7Fkhmu9PrYpS6g?=
 =?us-ascii?Q?3yEoNbxoaIFvYgjq5qDqBHDc6bdbdtu+CFPOHXij2Rj/gsgmkycnGUZVnfFp?=
 =?us-ascii?Q?tEaneg2LmkcGH8SxGKGtJzcjdLRPA+XZwQrLFvG5+KE1g0eW74Nl1DPVda89?=
 =?us-ascii?Q?klnaBGe+DeRWwXAG5fquH8oVXXy11XRf0fIYW2N4stMug0g/adYk/QmhMGAM?=
 =?us-ascii?Q?vPguqVlhRBC+CJo+XEl0nobwMvCEBXhzYWd6mIF1bI4sXqeZK0mosBfJd+We?=
 =?us-ascii?Q?t/ejpHPk2IBw+ksIPq/ZWrsm8MyYBY9F551zB6fk9F6geSlIxhE4sFPfmrET?=
 =?us-ascii?Q?X3BWDRsHJOwDws7/1GFFPm7dxdbko8c3PA7I1Sq8ftjRNqctJoEZx+tqcJLd?=
 =?us-ascii?Q?6rmqEWLqvHk40khWkKIRjCkK3CI6UUByc09hyk7BP8Ue8g3FFagWFJn8NmxP?=
 =?us-ascii?Q?alcb+Nt84XFIG1n13XNWIhcRFeFx+wOTfMa+vkpKbgmyl94fX4fLNBq7uJp0?=
 =?us-ascii?Q?iMrDLm3BFGovOb9e0vfqWgE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EFE948E0766F4443BFA3ED99E0DED9E9@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	daN8FzMQvWe8hNxbHEK0aypy141bo9NWvlv8GMRHdYrnZTs6I9MH+odCMeN425kvIB+UuEbLfODuNtheDseeQ9kHkcnDThP9PnDB12Uji9lvrEBY4pF4NADdi+71pS6u8h1TMvAvvdIToV1wOqBFbmiaCFMxjpTodCXAa2jARiIh+FIjN6Dl201AOxXTCJHzx4XeYHOzVKmjdT+6MZ3WMaDbwHb+SjQdwm//TTsJ7wJF2Bio9ye+8upR4nXyihRs00ewQSv0Vgn4WPDOWMZ/MxmRSGqGtR8rZ08vsfkkAHxpA2oweYr87WLiDnU/Ddble7aMdxmCKIrTMTONgUuUg5MzwNjEtrJxevF5oT3g+gVuSru/DiNf+Mba8+ddlR34EodUTjDpuJm/fSiBNdtnWvdwRvCwcjRCHu57H4OLGEbUQzGhsFBjWq/oOmjq2EeJw+tZAgx6ksmN8ALn1Gg8Mynn1/LMoNpmncoIGWfdaIxEWQAO3nLBIMtVQPDd7uPd4wZbu2OB6O8unA8UcsJR5dxtpFaU2F4NAWOjp2dCrVj9kJa9X8Xd7IlvdSdrRUNJC20y1vE6ww4dJ0U90nQPKODt7YPKj70oYEFr3UsHojwMrGm9RvpwBcQp1iJbb4xc
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR04MB8048.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3cb573-ca40-4fef-f9a1-08dd100a5c0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 00:11:23.5954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mehOzQBVDxTAqStrctHGZlJuyDtDbW+tKgil4+D3svktmJjlpnTPI1fnXGX4slB7cEoM/QSiYqO96/jbVgyIM9tH5QxJr4SdEOaOcomV68Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR04MB9324

On Nov 28, 2024 / 14:59, Andy Shevchenko wrote:
> On Thu, Nov 28, 2024 at 12:26:05AM +0000, Shinichiro Kawasaki wrote:
> > On Nov 27, 2024 / 10:55, Hans de Goede wrote:
> > > On 27-Nov-24 7:00 AM, Shin'ichiro Kawasaki wrote:
>=20
> [...]
>=20
> > > > +	if (p2sb_hidden_by_bios)
> > > > +		ret =3D p2sb_scan_and_cache(bus, devfn_p2sb);
> > >=20
> > > ret will be returned uninitialized now when p2sb_hidden_by_bios is fa=
lse,
> > > so this patch also needs to initialize ret to 0 when declaring it.
> >=20
> > Ah, right. Will fix it in v4. I compile tested with KCFLAGS=3D-Wall and=
 expected
> > it would catch such mistakes, but it didn't. I found that -Wmaybe-unini=
tialized
> > does the check. Will use this check for my future patches.
>=20
> Just use what kernel Kbuild provides already to you with carefully select=
ed
> warnings, i.e.
>=20
> 	`make W=3D1 ...`
>=20
> without any need to hack KCFLAGS or anything else.
>=20
> FYI, the above mentioned warning is included in level 1 of Linux kernel K=
build
> W facility. But if you want much more, there are level 2 and IIRC 3, but =
I'm
> not sure.

Thanks! 'make W=3Dn' is handier than KCFLAGS. I found 'make help' describes=
 W=3Dn,
and it says n can be 1, 2 or 3. Will use them in the future.=
