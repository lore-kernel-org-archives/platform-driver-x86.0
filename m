Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241357;
	b=REewDeY8KZH16HMvaJyB4oDM4AsKagvjhPKu2xvJRfkO+3BIBD960q9WV6vDnnB0/1LO
	 ikyJWiU7ooKclzqI8WWfOLfUbcuF5A5THyOlzoJihTVl+cqxpZMxQqiuEk72WNun6t9SA
	 wz4jSf3Uf4dD6ENPXV+UDVvE0wG89QV62WM142G61TN2AGTViXdCKnRT4k9hwHQYOhg7Z
	 98qMwU7FSz7eQoky9iviRm8F+SjmJZrZdaqfYEqG1z2d7B5A5R4lJgNvfwVKQdyLtmSD2
	 lWccttso4hZlYojtXBajyPrAOhDxCjDtYCcWGWoYk6A8cWIr/J8uEJnibKvd8uxczaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241357;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=TnTm+w85ZCu+J9+ZW0KbR4IUKa2q7VQLaCPFjQ2LwDg=;
	b=bhi3bq14iCQ1oRL+NatvseiL/j0VwegERmKdCCTY5FlZt9zWP0nycml83HGVDpXp/G5M
	 qrZWxdNNa8aDxNRkxrNMVNrnwzaGyc8Bxctmwnxp1Mvi6RdxWFuGhVY70sSJ+Tk5cdaHA
	 0TfLwzDTOTrukYGysCYvpE8JNNWG5xLA3Mf5ipbNnAQ2gW5hIqm8yq3gMy77ryTDoGJKJ
	 Lwt+KBLVv3KTdF4YZ9NaAJroxOxbT5cUP2BjKGVPeiICZ8TRvuKDZIpVQ7aONzZMN3DoL
	 Bn837UhunYLKp9t8/6Wlh75mNc4U8cdEwlx3SageYEi3Fq5KAYo5zbwKyXiQoC0AoEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T4y6e1X0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DD5606A325;
	Mon,  9 Nov 2026 16:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DD5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T4y6e1X0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794241356; x=1825777356;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9Sdi37bawij39BGHnFQXNdzVhNGLLdFAzFR+2/oZlck=;
  b=T4y6e1X0EG/Go54+iA7ZvCGA63kjdRROkyj2muPV6XTJHPTd0u/lp/lz
   ZmIKW++h08aWvDMGw9N1/q1Ih99Zk+6owaK71DZNDH17p8vdQCOZ8z8kw
   IdJLZnlADiUuuTAU+KTgzFsZNB4evVsM3bOEqJT/NrMrw/wShgVq18wkQ
   fb9jRyCaQcjfHEgPQendPApiiPGh5mjcXB1Z6vrJIwBgSjKDLhF4Ta/PD
   BpTONuEQufiCRPRbalR/50qI35NLmEeFR7ty5f5y/2tTGUdmRg7CnYZkQ
   iU2AL32nd+h+8/AQPtKKWd4+nt0+d1UjIxixM4e3WBZmbnHX/hm0QXjKc
   Q==;
X-CSE-ConnectionGUID: 7NmfnfvaT02VTDQMDtXzow==
X-CSE-MsgGUID: RcMg5Q57S3OfQDack9HLNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2867250"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2867250"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:22:10 -0800
X-CSE-ConnectionGUID: QQbhijDKSGiYda5IVVdoFQ==
X-CSE-MsgGUID: AiAf/B/rQfiqx6hQE8bQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8031970"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:22:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 08:22:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 08:22:09 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 08:22:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2FcLmhkTE/2vQHTxSvfLSW5paYOaUEk+IgxTztfYFradokx45eoX0CTlzi9/Zg6oCTD+zAAk9PtXJDts5Mh8x/40gxTf5O4QEUxJv2KZVfxeV7+C0I6eKcHawjE9OBSgdQCvApB8tycrPgrU9StS3LcZFY+A1wcUYkSkIpyBll80I0Z2dWzm9Dzubl71mplgTYdufPEJzyDBTvjx3Iz9J3NcA7CI+VxKowUv0xAaPWadSB2Op+EOZ6PgLpp+qW8Yx4XnmlC5rviMkrtNxQ4curlNz8/dAAwn02Q/uO+LEirgY+S0hrN5gkAm24D5zL9ed3vuvvy32S5rRh0D3YFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnTm+w85ZCu+J9+ZW0KbR4IUKa2q7VQLaCPFjQ2LwDg=;
 b=SK+EMewMTyys8zzUaFEo4G62U6z4JBV9oFL8Kx1fksghED8vQ5BRKufI0u4DzuBSkykcwJ+6/Jbkjt1/POYel6UXzlnb/XXrPqNGi+gN+efUmK6Uygk+vhfVIdI6s/a9c8Ojr5LnJKeWt4L3GHejnCL2LYgtPXz31IpQKrtVDsnYNZ7wlgBWzlXwo/8ivsrRw9GWPWYgJDmrN8V5/Y1cNP5eQhCA6D6zJtoYeUTRaAqduiu/POoTkATqBgVnzyAbDsK6GTNO1VZDnsIWJ6Kg03X/H79+effbZuh9OTLyeuRFDGFd8MzkJ3HixPFragA7D14GcSCUuXSMCd61wPS4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DSWPR11MB9931.namprd11.prod.outlook.com
 (2603:10b6:8:3a4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 16:22:08 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 16:22:07 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Siddiqui, Ayaz A"
	<ayaz.siddiqui@intel.com>, "Muqthyar Ahmed, Syed Abdul"
	<syed.abdul.muqthyar.ahmed@intel.com>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>
Subject: RE: [PATCH v2 1/1] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
Thread-Topic: [PATCH v2 1/1] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
Thread-Index: AQHdYpekJEK3i4bnREaSDP0UzuHWObcmBwog
Date: Mon, 9 Nov 2026 16:22:07 +0000
Message-ID: <CH3PR11MB046149736FBA1609F1E80ADC70C1732@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <cover.1792721526.git.david.e.box@linux.intel.com>
 <363a32e2e37d5fa62983bc9e280fc87dbf4ed214.1792721526.git.david.e.box@linux.intel.com>
In-Reply-To: <363a32e2e37d5fa62983bc9e280fc87dbf4ed214.1792721526.git.david.e.box@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DSWPR11MB9931:EE_
x-ms-office365-filtering-correlation-id: 9e3cd06b-4e19-4b75-8fa0-08df3e7d999a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|6133799003|3023799007|10067099003|921020|38070700021|11063799006|5023799004|4143699003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|261022075727099003|261021121427099003|56012099006|261021123027099003|261026140227099003|261009223327099003|261009223027099003|261009220027099003|261009221727099003|261009221227099003;
x-microsoft-antispam-message-info: 6GF42jH/Gqf/ssT5N76Kqz0mnGfl5WFWS0ESkY1HX3qCwpXNEHNjorx9tntetZZHzoa7iFswT/Rkncv1aSbvFlFTHLoFMBbrbsaP0v79Krc2GYNTDtBKmy5L0UMW9bNbU9OLO4PLFtoZTk38NWR877IT0x1KFfc0wEFUOY0hQhLiojNexP1HJ/a5dRNnMcS5Hw/0mydq3We3BVI1A8WiHogp2tZDhk/OzWq+lcrP/Ixu/DZ5T1VeWzxKWBquCbSstZDqaDK9BaQD4j0cV0Q3CsCiwFDbbXk7hnpicXEOj1nkBGDZwz7IcAzwOMMp9zMlE68NKhJlqkzH0u4961qODUJx8leh559aexu2uuVXvT4/s0xL/blWpDW3efU07a3oWGQIQ+MWOiI1uqVEEV3CVe5KjuQPw7X/fbL78T8YvRBx6HyIQ92IMm94dJWhgoX0MgSt1q3W/h6lgGcpjl9lzBaHYkVNkOTBikhtRagL2GO5LO9zuFhCQdB+R/EJAk3V5VrOBJPd/Q1AiDCTe2OWdvE3naGPfS4IrRefg0OrMqLzo/pfT8LIT6EYi8ECW3qlsjFKaCGwd8YTZwXLjDLtzDlaSo47eYNgczxBtonfpAX7d1fkdDJ6aPrIFNCtTOclpE/TZ4fTikZe9WdxBPTYpFeH/S44djEiwtSQmI243PCpV/G4T2L30KWo6YqQahTsrzpjEiFsG2EI9p3HtT0Oir7OEiuO+W36QGNZ8Tkc9FDo9CQYG6wN4yPpmW0GuH2C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(10067099003)(921020)(38070700021)(11063799006)(5023799004)(4143699003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021121427099003)(56012099006)(261021123027099003)(261026140227099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mMXsKWW5UCJqRg/We54Qj3sUh7d7gt50SYGG8O7VZej0JjkyW1/2a6ZMOW68?=
 =?us-ascii?Q?RNcuKiel87LecToDn4WCJqO/VVzNC/7pPEeFCHWxXZZeUXNSLNZFoWeCbi3J?=
 =?us-ascii?Q?uBGOJ+Sr3icKDuwae0t77VEfu+Cc+Yiur0QqpO63EUXAA2iI4jz4ffGSmi7J?=
 =?us-ascii?Q?qurYN2ctPWVM8cD/I+NQJpgIt3kFQiugGNj35MeuprMDWtCZGhm3N8LRbKXM?=
 =?us-ascii?Q?6SavZ6TMG8Jgzd1chLfrGEaVYcr4VykgkfY4mxxRBg6+ATIVNYtlw2f1m5m4?=
 =?us-ascii?Q?jc/drgr/jTQ2UbTkL4AJr+t1yNCNpGwIWH0pmgE+JLSC273BfXRjMdmqw+qe?=
 =?us-ascii?Q?/32cz6YFCqYkVyKGv8FE6UFRWgOfFuY/LsmGEvb0DIzNvoUX7glVRC2jC+lz?=
 =?us-ascii?Q?WRNU2DkqywR8SsiTMxTkAwXcMTceH46SRfaUVdiqefeEc0qYFrDpCpMUZoar?=
 =?us-ascii?Q?VsTbl88zsbB4hBpgDnxXBws8LL623aIM8LM8pjMuUayf4tXo9QyTBSb079eT?=
 =?us-ascii?Q?hXISp+bWk+H780QoqK4O7mvsRqMnbIk8ee8S6P/lKp1HG/zDFoRs4kjuT4Ta?=
 =?us-ascii?Q?UkgS9yBVwNLyXLhdRReeXw7kTjPrgCloe2MTK3XOdAh0AwdZKRIClmlZNhwp?=
 =?us-ascii?Q?nom109oEy0/A8pgIYGuchroAhDJYykYWng8Nk+XjdEb13Ex2HmJggN1VAWAH?=
 =?us-ascii?Q?baZjhr4vyI+nChphQtecRPPg+y04xCx+uD+BI5K2uZEz2rGpZMut2PDzANqB?=
 =?us-ascii?Q?LxMfovzAMB4Ui6O6f9rNlSn1jSLod7w+1qwQfO7Nj5yypcLDvJooUJftAVzO?=
 =?us-ascii?Q?Enp8rdrKM6IaCs3RsIRjRrcSpTpeg3tELL6Wm6FSWDeeXdFaA8WLA9HT+EJx?=
 =?us-ascii?Q?ChMYnT7Y1fQ817nzWQ2MS0biX80crDiRg+h2W4UV4ik6CdjEp8fHruAe7YXD?=
 =?us-ascii?Q?3y4txt9zGed0Rgms82BIgF6mpp/jcr7gQ7l96zWaarGXm6cDg6bWdc1YWtHe?=
 =?us-ascii?Q?MWNdDfybFiEs+MWcj0EwQGtvhwNgyj1p0zoUVbW6a7Jav94BtfngyZZEt4JY?=
 =?us-ascii?Q?T7qZ2EHOOzU2DkdOnA9bzCMk8ePlN7r5xY6ZO2XEtReOc+YWxtFM99HcHy2J?=
 =?us-ascii?Q?luam+oG7LaIAqG+M4bT/Ntvvpi7NEyIgTHztVHu9o+VyTeH0VRNORmFccWTi?=
 =?us-ascii?Q?tBwyyaHsD5BbZjvbYGT+4yuk+UDAWuoLYsFanVf1ej2z37gETl7nX6iiVEm9?=
 =?us-ascii?Q?k6go74qFhKxc0HXxX+1ni/5Frc04MouWziHyF78lj/qqLAFu5MG+yVlQsa2r?=
 =?us-ascii?Q?HmcRhM4R8LZgYy18iE/L5+nWofBeMZXMmQQSiRL7KeB7vHIASarJJRL4PdfV?=
 =?us-ascii?Q?KRsATwomOcYHZH1uqo+/rmOVHN6NyBh8cSpaxOigZZ6HqOOXfE8EVNJIJhxR?=
 =?us-ascii?Q?AcGoXI8KYXTf2WmlbzPypWtuxetGVSjGpYFcCp1cmt9QtNaZOeUUhCClaHWq?=
 =?us-ascii?Q?YcL2+uLGMlGR1CY8Hm8DsgByhQIxZuchHmDzfpa4srLTv787fwYSDQN9ToXH?=
 =?us-ascii?Q?wuvkAidCGYK4EMvc493UI9cxzuqJkNEIuTRcn8emATrA+YomqskF1d8Ndiqk?=
 =?us-ascii?Q?yiZFD9OwXzY5JPGkaL8JKowLsxvPZ4P4/yD1DSTx52MUFkd/I0nSTJul61HG?=
 =?us-ascii?Q?2bNUzK6++jxpVQ30a1p08zUP9mQ78KYlkv6A5UHKFK7/CRasSm7kI5hTMrU3?=
 =?us-ascii?Q?Gacwt79YZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zmzMrSWZf7pnPZT2mWGlsiqlGNrpc4b2v86vfHlESB9YMindbQgiuGDsofbfFivPLe7IF+XgnjwwC5qHjdlu/Xr012fe4iW8bA/iY1lcPcVnczGAy+//wpb1JUNZtfguzrjQcWRYELP1js8ZPsUhyoJottug1v5/Hin9X/OF7uK2ROJp98KSXy2YK0ISAivGfssRzOvxRpxrP8V38+TrzOQ0WSPA1QadNVCBxLcMiA0E2Ig4vZSf0JH0CsZFIqBu5U+03rjAAiHufIung+XxAc9SKPyCmasbFewsdf0EKFhzBLjbzjjhja68swCWesKHU0mi4+AWK3ElauI+AK8V1w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3cd06b-4e19-4b75-8fa0-08df3e7d999a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 16:22:07.8169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jsG4A2R7tA+NFYCNwbAtHipGxoU0CLal+PmdINj8bwZAP3q9AP+KetmtQM7qb6UAeNLdf2InNe2Fwu/qxnrvG70Q/AsSMMnuxfFQPAaZuVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9931
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: David E. Box <david.e.box@linux.intel.com>
>Sent: Thursday, October 22, 2026 10:39 PM
>To: ilpo.jarvinen@linux.intel.com; david.e.box@linux.intel.com; linux-
>kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Vivi, Rodrigo
><rodrigo.vivi@intel.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>; Sidd=
iqui,
>Ayaz A <ayaz.siddiqui@intel.com>; Muqthyar Ahmed, Syed Abdul
><syed.abdul.muqthyar.ahmed@intel.com>; intel-xe@lists.freedesktop.org;
>hansg@kernel.org
>Subject: [PATCH v2 1/1] platform/x86/intel/pmt: Notify userspace when
>crashlogs complete
>
>A crashlog may already be complete when the driver binds, or it may
>complete asynchronously after userspace requests a manual trigger.
>Userspace otherwise has to poll to discover that data is ready.
>
>Emit a KOBJ_CHANGE uevent on the per-instance crashlog device when a
>completed log is found at probe. After a manual trigger, poll the
>completion bit at 100 ms intervals for up to 5 seconds and emit the same
>event when capture completes, or when the poll window expires without
>completion, so userspace is not left waiting. A clear or rearm while
>polling ends the poll without an event. The poll runs on the freezable
>workqueue so it does not read the device during suspend. The event
>carries INTEL_PMT_CRASHLOG_COMPLETE set to 1 or 0 accordingly.
>
>The class device's attributes are created after its KOBJ_ADD, so the
>probe-time event is also the first point at which userspace can reliably
>read a log that was already captured.
>
>Initialize the work items before the device's sysfs attributes are
>exposed, and reject manual triggers until setup of that crashlog
>completes so a trigger cannot queue work against a device torn down by
>a later probe failure. Disable and drain the work items during removal.
>
>Document the new uevent in the sysfs-class-intel_pmt ABI file.
>
>Assisted-by: LLM
>Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>---
> .../ABI/testing/sysfs-class-intel_pmt         |  32 ++++
> drivers/platform/x86/intel/pmt/crashlog.c     | 138 +++++++++++++++++-
> 2 files changed, 165 insertions(+), 5 deletions(-)
>
>diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt
>b/Documentation/ABI/testing/sysfs-class-intel_pmt
>index ed4c886a21b1..cf95d1dcd4d6 100644
>--- a/Documentation/ABI/testing/sysfs-class-intel_pmt
>+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt
>@@ -66,6 +66,38 @@ Description:
> 		can be determined from an XML file of specified GUID for the
> 		parent device.
>
>+What:		/sys/class/intel_pmt/crashlog<x>
>+Date:		October 2026
>+KernelVersion:	7.4
>+Contact:	David Box <david.e.box@linux.intel.com>
>+Description:
>+		The driver emits a KOBJ_CHANGE uevent for the crashlog<x>
>+		device with the following environment variable:
>+
>+		INTEL_PMT_CRASHLOG_COMPLETE
>+			The crashlog complete status at the end of a check:
>+			1 if set, 0 if not. It reports the status only, not
>+			what caused the crashlog to be captured.
>+
>+		The event is currently sent when a completed crashlog is
>+		found at probe, and after a write of 1 to trigger. It
>+		returns 1 when the crashlog completes, or 0 for trigger if
>+		it has not completed within the poll time. Writing clear
>+		or rearm while polling ends trigger without an event.
>+
>+		The status may have changed by the time the event is
>+		received, and the same crashlog may be reported more than
>+		once. Consumers should read the status attributes before
>+		acting. Consumers that start after the device was probed
>+		should check the complete status of existing devices, for
>+		example when handling a coldplug add event, since an event
>+		emitted before the uevent listener starts is not replayed.
>+
>+		Other KOBJ_CHANGE events may be added in the future with
>+		different variables. Consumers should match on
>+		INTEL_PMT_CRASHLOG_COMPLETE and ignore variables they
>do not
>+		recognize.
>+
> What:		/sys/class/intel_pmt/crashlog<x>/crashlog
> Date:		October 2020
> KernelVersion:	5.10
>diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>index d7018b495217..2d006abce5bf 100644
>--- a/drivers/platform/x86/intel/pmt/crashlog.c
>+++ b/drivers/platform/x86/intel/pmt/crashlog.c
>@@ -13,13 +13,16 @@
> #include <linux/intel_vsec.h>
> #include <linux/io.h>
> #include <linux/kernel.h>
>+#include <linux/kobject.h>
> #include <linux/module.h>
> #include <linux/mutex.h>
> #include <linux/pci.h>
> #include <linux/printk.h>
> #include <linux/slab.h>
>+#include <linux/sysfs.h>
> #include <linux/uaccess.h>
> #include <linux/overflow.h>
>+#include <linux/workqueue.h>
>
> #include "class.h"
>
>@@ -115,6 +118,12 @@ struct crashlog_entry {
> 	struct intel_pmt_entry		entry;
> 	struct mutex			control_mutex;
> 	const struct crashlog_info	*info;
>+	struct work_struct		uevent_work;
>+	struct delayed_work		uevent_poll_work;
>+	u8				uevent_poll_tries;
>+	bool				uevent_polling;
>+	bool				uevent_complete;
>+	bool				trigger_ready;
> };
>
> struct pmt_crashlog_priv {
>@@ -122,6 +131,9 @@ struct pmt_crashlog_priv {
> 	struct crashlog_entry	entry[];
> };
>
>+#define PMT_CRASHLOG_UEVENT_POLL_MS		100
>+#define PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES	50
>+
> /*
>  * I/O
>  */
>@@ -271,6 +283,80 @@ static int pmt_crashlog_set_rearm(struct
>crashlog_entry *crashlog)
> 	return pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm,
>true);
> }
>
>+static void pmt_crashlog_uevent_fn(struct work_struct *work)
>+{
>+	struct crashlog_entry *crashlog =3D
>+		container_of(work, struct crashlog_entry, uevent_work);
>+	char *envp[] =3D {
>+		READ_ONCE(crashlog->uevent_complete) ?
>+			"INTEL_PMT_CRASHLOG_COMPLETE=3D1" :
>+			"INTEL_PMT_CRASHLOG_COMPLETE=3D0",
>+		NULL,
>+	};
>+
>+	kobject_uevent_env(crashlog->entry.kobj, KOBJ_CHANGE, envp);
>+}
>+
>+static void pmt_crashlog_uevent_poll_fn(struct work_struct *work)
>+{
>+	struct crashlog_entry *crashlog =3D
>+		container_of(to_delayed_work(work), struct crashlog_entry,
>+			     uevent_poll_work);
>+	bool complete;
>+	int ret;
>+
>+	guard(mutex)(&crashlog->control_mutex);
>+
>+	/* The cycle was ended by a clear or rearm */
>+	if (!crashlog->uevent_polling)
>+		return;
>+
>+	/* A newer trigger_store() re-armed us; that cycle owns the notification
>*/
>+	if (delayed_work_pending(&crashlog->uevent_poll_work))
>+		return;
>+
>+	ret =3D pmt_crashlog_complete(crashlog, &complete);
>+	if (!ret && complete) {
>+		crashlog->uevent_polling =3D false;
>+		WRITE_ONCE(crashlog->uevent_complete, true);
>+		schedule_work(&crashlog->uevent_work);
>+		return;
>+	}
>+
>+	if (++crashlog->uevent_poll_tries <
>PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES) {
>+		queue_delayed_work(system_freezable_wq, &crashlog-
>>uevent_poll_work,
>+
>msecs_to_jiffies(PMT_CRASHLOG_UEVENT_POLL_MS));
>+		return;
>+	}
>+
>+	/* Trigger did not complete within the poll window */
>+	crashlog->uevent_polling =3D false;
>+	WRITE_ONCE(crashlog->uevent_complete, false);
>+	schedule_work(&crashlog->uevent_work);
>+}
>+
>+static void pmt_crashlog_end_poll(struct crashlog_entry *crashlog)
>+{
>+	lockdep_assert_held(&crashlog->control_mutex);
>+
>+	crashlog->uevent_polling =3D false;
>+	cancel_delayed_work(&crashlog->uevent_poll_work);
>+}
>+
>+static void pmt_crashlog_notify_pending(struct crashlog_entry *crashlog)
>+{
>+	bool complete;
>+	int ret;
>+
>+	lockdep_assert_held(&crashlog->control_mutex);
>+
>+	ret =3D pmt_crashlog_complete(crashlog, &complete);

This call will use the callback (if available).

Unfortunately, during probe, the callbacks can't be used for the CRI path.

Doing so reveals an attempt to take the mutex(pmt.lock) twice.

We need to revisit this code path.

M


>+	if (!ret && complete) {
>+		WRITE_ONCE(crashlog->uevent_complete, true);
>+		schedule_work(&crashlog->uevent_work);
>+	}
>+}
>+
> /*
>  * sysfs
>  */
>@@ -309,8 +395,12 @@ clear_store(struct device *dev, struct
>device_attribute *attr,
> 	guard(mutex)(&crashlog->control_mutex);
>
> 	ret =3D pmt_crashlog_set_clear(crashlog);
>+	if (ret)
>+		return ret;
>
>-	return ret ?: count;
>+	pmt_crashlog_end_poll(crashlog);
>+
>+	return count;
> }
> static DEVICE_ATTR_RW(clear);
>
>@@ -454,8 +544,12 @@ rearm_store(struct device *dev, struct
>device_attribute *attr, const char *buf,
> 	guard(mutex)(&crashlog->control_mutex);
>
> 	ret =3D pmt_crashlog_set_rearm(crashlog);
>+	if (ret)
>+		return ret;
>
>-	return ret ?: count;
>+	pmt_crashlog_end_poll(crashlog);
>+
>+	return count;
> }
> static DEVICE_ATTR_RW(rearm);
>
>@@ -502,9 +596,17 @@ trigger_store(struct device *dev, struct
>device_attribute *attr,
>
> 	if (!trigger) {
> 		ret =3D pmt_crashlog_set_clear(crashlog);
>-		return ret ?: count;
>+		if (ret)
>+			return ret;
>+
>+		pmt_crashlog_end_poll(crashlog);
>+		return count;
> 	}
>
>+	/* reject triggers until probe has finished setting up this entry */
>+	if (!crashlog->trigger_ready)
>+		return -EBUSY;
>+
> 	/* we cannot trigger a new crash if one is still pending */
> 	ret =3D pmt_crashlog_complete(crashlog, &complete);
> 	if (ret)
>@@ -513,8 +615,21 @@ trigger_store(struct device *dev, struct
>device_attribute *attr,
> 		return -EEXIST;
>
> 	ret =3D pmt_crashlog_set_execute(crashlog);
>+	if (ret)
>+		return ret;
>
>-	return ret ?: count;
>+	/*
>+	 * Use non-sync since uevent_poll_fn() takes this same mutex, so
>+	 * cancel_delayed_work_sync() here could deadlock against it.
>+	 */
>+	cancel_delayed_work(&crashlog->uevent_poll_work);
>+
>+	crashlog->uevent_polling =3D true;
>+	crashlog->uevent_poll_tries =3D 0;
>+	queue_delayed_work(system_freezable_wq, &crashlog-
>>uevent_poll_work,
>+
>msecs_to_jiffies(PMT_CRASHLOG_UEVENT_POLL_MS));
>+
>+	return count;
> }
> static DEVICE_ATTR_RW(trigger);
>
>@@ -640,6 +755,8 @@ static void pmt_crashlog_remove(struct
>auxiliary_device *auxdev)
> 	for (i =3D 0; i < priv->num_entries; i++) {
> 		struct crashlog_entry *crashlog =3D &priv->entry[i];
>
>+		disable_delayed_work_sync(&crashlog->uevent_poll_work);
>+		disable_work_sync(&crashlog->uevent_work);
> 		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
> 		mutex_destroy(&crashlog->control_mutex);
> 	}
>@@ -661,7 +778,13 @@ static int pmt_crashlog_probe(struct auxiliary_device
>*auxdev,
> 	auxiliary_set_drvdata(auxdev, priv);
>
> 	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
>-		struct intel_pmt_entry *entry =3D &priv->entry[priv-
>>num_entries].entry;
>+		struct crashlog_entry *crashlog =3D &priv->entry[priv-
>>num_entries];
>+		struct intel_pmt_entry *entry =3D &crashlog->entry;
>+
>+		/* trigger_store() rejects triggers until trigger_ready is set below
>*/
>+		INIT_WORK(&crashlog->uevent_work,
>pmt_crashlog_uevent_fn);
>+		INIT_DELAYED_WORK(&crashlog->uevent_poll_work,
>+				  pmt_crashlog_uevent_poll_fn);
>
> 		ret =3D intel_pmt_dev_create(entry, &pmt_crashlog_ns,
>intel_vsec_dev, i);
> 		if (ret < 0)
>@@ -670,6 +793,11 @@ static int pmt_crashlog_probe(struct auxiliary_device
>*auxdev,
> 			continue;
>
> 		priv->num_entries++;
>+
>+		scoped_guard(mutex, &crashlog->control_mutex) {
>+			crashlog->trigger_ready =3D true;
>+			pmt_crashlog_notify_pending(crashlog);
>+		}
> 	}
>
> 	return 0;
>--
>2.43.0

