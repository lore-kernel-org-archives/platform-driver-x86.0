Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02E33ADBA
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419954; cv=fail; b=IQNjoUsKMWF+jogNG0IkVaffbELSoh8jce5/BWDwVzHnAqIR4TbqqKhj2rJek8omYFnNLNTXd78/mr86XxqZSPJ1DAUBGUro1yd27ZM4gYs6gcJvhaAdZWrwNiSB5vzs/t0nRWrV5jW+rzwvdprPux7Xxzbh8updWRvPPIlH9lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419954; c=relaxed/simple;
	bh=wF0NPOjGkbaQDJbuF/thhuJULeTJ+3o86l9T8iHTiGY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aAuPsjix9t6dwcLG1oby+rk1W3HVR7p8mexiBu9cccYGSGrEe3ensdYWC71YsO+A0mRLo6T99drPFZMITBf/jPjyyez4I1u6hPYSDgQhZ7s64Zz51gh5qHgljwGcSdmEEUqOBphLQoFDHekgl76GxnjMT+q0Z791Dh5L65iBGeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eV5ZaGro; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eV5ZaGro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419953; x=1820955953;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wF0NPOjGkbaQDJbuF/thhuJULeTJ+3o86l9T8iHTiGY=;
  b=eV5ZaGro6+irJUCKiBVxq/UI2osnun+TzvVyLZgXkzYTWKVYBYuEvc3j
   4VWUOo0vLhmryI9XLIiPcENMgH13XhPn8dTiUsr22cuAgnoei8NTn9MkR
   uUBqTZtldJ246Y8FFJ8/rY+LNPJdQaBlbGbJsksWy5+6Y5wclyYAn/K5r
   cDn4TTb6eKEjKAu4X/mTiIBfaEeVX+IBVAXS77o1l17v9SoIAau6ZpVa/
   K9whfFM3eTLsnjiKxWmQdh/bCSzCttWDek4NKyhn2nYfitbVViSF9alLG
   qC8AGWZENM43bseG8BCWwHxU86eBoam3a6PlnaO1rb+rBL9Y/ppSiFkeB
   w==;
X-CSE-ConnectionGUID: h3FvTwtBQR2h95cr6YPaeg==
X-CSE-MsgGUID: HL07J0gIQySE1k/Ntfj3xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89718800"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89718800"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:05:53 -0700
X-CSE-ConnectionGUID: 57NvOTkITZ63PVk7G6DUZA==
X-CSE-MsgGUID: QHJk7iicR8mhGKv+/EZTTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270935380"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:05:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:05:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:05:52 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:05:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLP9+sCAw2nH8kWS+MxnVLCWr4owKzizfNjl9OH+9p3lU5lHqJKyoaKLVnDwd7znAuOw19giJ85kP/vVxWjF75iXUEmEQ+1gfA4nW1aDtMDNEpYIwHFnQ3V3A/6i1N7TOUhDIp/xyQYAX+Vri2kVIlqjCuy7/lm/fwtAMaYCiEXjuLwepZHTKZ/ClLjxhUH0uqk9okkJ5aH3rHnL9eyqpyymYIw/o5sfFoy0c+R++SrLqZqeaouTDYGZmqzLIU0MrNDCUdMwIrRfwd+GpPSL391DK7xVnTKkbBKq9jd/5J2CgKp7Jw14W9xm5MuudK4j7QsbKpOHRJEncnb32tcxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkPuFbapOoBT4ocLwU0NIpyPne55jOZ9pMguBVybR+4=;
 b=tvUmYU33T8pOmkiJECqIDup+O6lqsqYx2iVAhm6mPvGmUkY398I+txIPt4v0KDGxNmLqQh94AbkhBdf2C6aHLkFeCG2GkjRtx2AiMl7Fgp0qUb4HlUOaME5FJQa/PZMGqHe5SJUdzUrovBepxjmf5PQWJcMts/z1FrmilcFlXmAuMrk5PNIRqAnnWs2Wdep98FTZgUyGtTEQ08lqoVqY01WFs8nubw8SFP+BSuhNXhiUw1AXwoJBv74pUPAT5rt89ziCn8YZvPPk1rqR/EoWey+XC9bEUfPCh4wt+4MTuv29roLgG2M17n4fjymoblYW5zjHoVI7DorkIgwgvTnOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by PH8PR11MB6732.namprd11.prod.outlook.com
 (2603:10b6:510:1c8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:05:43 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:05:42 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>,
	"Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v8 04/20] platform/x86/intel/pmt: Add register access
 callbacks
Thread-Topic: [PATCH v8 04/20] platform/x86/intel/pmt: Add register access
 callbacks
Thread-Index: AQHdQine7K338d43nE2qp4eBrTDnYrbOQMGAgABUchA=
Date: Mon, 14 Sep 2026 21:05:42 +0000
Message-ID: <CH3PR11MB046149E4B60FDCC32573C0BB82C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-26-michael.j.ruhl@intel.com>
 <aqgav49Omcx5_TUY@intel.com>
In-Reply-To: <aqgav49Omcx5_TUY@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|PH8PR11MB6732:EE_
x-ms-office365-filtering-correlation-id: 81468d24-0b9e-47b9-94df-08df12a3efc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|4143699003|3023799007|10067099003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: bNNdnJd1TVcEA6jpZfdLC3W16Isy5nZVqOx1v4rjlMTkI8wEp538Km1x7aXqDPi/mot6H/4l5ouzrKJgPtEWPe1N5VAH6KcbE4GPBlWsqkrtjuEnouw1aofMvOSy4Fmsmcb5GnKVD/FvUsHvh5dSertjpzDg8v0LhZ+jukNbVA1sPeyUj8MzEHornbgryyDMziY0fXHZhlgtmMwNXD08ka3MeyilNVlEe4BuDFKznYa8FKIznWtvB2uXkjKcklb/MQdOkxW260uuTNUpTSw6KAo6QYVtHLKJ2t9YnDSvSn+VBPjuVXahrISTlJbTdSphgkAZQk9MXZofuwSqDSiLEzPhGx73O85eM5MRm6YSBCxbzV3Cs17TbAloMF923m16dbb6m9h4wPFQ2agP7D6cX9DgsGG5AMw6oUJU8EuJ0WYZ1rVcedJd6hFQ5Nso1c5Ck6b89dqpc2Owkt4Kl5gE5/+njHA73FBX36gcARMHy96DOayqVRL/+G3/fohKBAgx0KAIN6AcjZFZYtzvYs/x7r31rqk1ebOXkKZUwVxpEoeRPLDZ8/87uyWsI5sfUO1tYWtEb6FKpKQFK0JqcKukfHo0ieeTyA9Hl9its4UPXX3DVBywn4Yxu7zvk8rgDkowbd/gezrKiR16/1Pl8nbp4fv3vnUS/lbb06bR2qDI76od94NT+CGTRHlo9URGWvnll2iVbnToMYxJtSlHe0lvKVYVOXq2cYuIFJnJ7rst9Lg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uhpIquYgWpoQizuyVU0x4FbtSZQSLcAmnCxNxPJaLy1RAOSPgy3jbf6Iixlj?=
 =?us-ascii?Q?aC4aJ3ZiVNl8gRcsmR3XkgWWLEZQipPTjhmOg0aWhqiZodg5PKFhP+n31YrP?=
 =?us-ascii?Q?hxTMqHH6zvMrgVUQca94gGVh5yLcpDALJy9S66TuQbWObaRN2SP1+xtBvfjQ?=
 =?us-ascii?Q?lkgI7k9T0LeM0AbhfUpen4/QACeGL2pTIc7Zcj5NOxvI8mhGA/yPM9o945Uc?=
 =?us-ascii?Q?PCahrRktmbSYmViXNXTuxUUCPHqMz2CSgXHZ2RRZwzlDjZVuogamW76u+J7j?=
 =?us-ascii?Q?yx4GgysgfYuJv1dOUQOU16rDIJae3Dqk8Sj8SFjspDd0Tm9yYvy5Fo8Z2oKI?=
 =?us-ascii?Q?gKWEhe/lDDHJp7c3P08pgnBydZ7nVqmWVr9dwRe+cjG4rmVU50z/y9HRF7R4?=
 =?us-ascii?Q?KMgZQAY6a83tVAK5ulwvUeRnR0DFIL1oG7Ni9hbYSGslnCEDPr6pSsuM/wfI?=
 =?us-ascii?Q?PDIEaMjPia3k5QM5TdQbaWvdMbMiAjTY8MzdQP+90Xt6ujmp/tDdhwA1kkxs?=
 =?us-ascii?Q?X5B1JDvc0sU5XrGypT0OJ2HVWu5utXZlPZ0Mm23N0WtZkcHHA2m0SwfBWHwd?=
 =?us-ascii?Q?WBrtQLt2J4FJPFOZ4cecSU3YnyvtjAlKs4jBguEAOSKaYgfAbkfbFqaIaiyq?=
 =?us-ascii?Q?u1/NIy8Dy2xf3tvjoXyOUrTV7GrEImDrPxR41f1KL9VJNYGb5Axl3FhWH7qZ?=
 =?us-ascii?Q?/QVopVS6xsajwNdExpAaiEZyoQqtjVjysaY286Rwt5nvp19Wd8GMnApOj9Zt?=
 =?us-ascii?Q?/em1EWTmbiGO1TvPkGHeLPkbh3DtaxNftsPjYrehWjBEugrfQx6r5USPZePm?=
 =?us-ascii?Q?K23TxVsRtRUuDei9Qcb9M+TSKWyPcg7XBugrhOgNQvjCQJ7B/28HY5ZiTMn3?=
 =?us-ascii?Q?A4/dbkzW1+RT04jZigjp9GJn0KXBSxq8lHC8jt2Y86a39xwFLTj0PfyJIVc2?=
 =?us-ascii?Q?t/2KjMCetEOsP8tPBgbqV6o2YpRgAt8RkS7SbIdRwWoKubOq7Mo96UYDjI2d?=
 =?us-ascii?Q?Y6BUvG9JNUrJRjwPGKvGauF6SZtvGahIwiI65eBxNWxbCU9GEOzJ8GVs3a6P?=
 =?us-ascii?Q?Dt9j/PcanupeILUXdyCOgRsH0HFd+5PfXigcUSPtkqpPGaNZADM+COP1Gi9/?=
 =?us-ascii?Q?unPaGHnxW/hCJgxtR928hD2rIEtjrjz4krX2OginlFLjiQuINfa51J2e6YSx?=
 =?us-ascii?Q?Y/rH5buK3bO04sQw4buccHWOHI3f6Ya20Q8bA0rOST8/wuU5RFw2vTdaq9KM?=
 =?us-ascii?Q?8fWbsVWB0t+MsD4nylQVscDCF0Q2ekEeq0Y5aY8wMSCtJ5kqyCLZuFOmLPYN?=
 =?us-ascii?Q?0RtRh8LJ7TwOZSUNi1xjUjjpVh1EpVPGpnPqqsYvKO6PKuzbScGxbaSMWwJA?=
 =?us-ascii?Q?hjojpyH/ISo5akmy21ZJDUSqsmEPKPFc1E7fWVHsPTwET/g9o/vd2nlgg/D1?=
 =?us-ascii?Q?EnQHaEDsh1SBWy3TZh6TfkrpSgNFTKYCaEXNnHOFw1dv9jJQLk+pz4jX2o+G?=
 =?us-ascii?Q?riQRcJRRdpxU9yhWv6o8ywbmDBHexfNQcnJnvJsNGMsk1AethqKt0hP/hhBc?=
 =?us-ascii?Q?14cZ3Ruc/7hYqTaKOy4xZWtsRzP9uoGvm+D2A3AYDBx59Z5LLFie154cim11?=
 =?us-ascii?Q?htRe1DFqEy8sGYN6FZf9mYS0eP83UjxHT5hsCwrTx9LGn2hlix9V7xHqCeWX?=
 =?us-ascii?Q?GX56KxKMiKJ2iiAAE38HuzZle1J38+9I+S3EUq7OUVGgQkbrswz4LAD+48tA?=
 =?us-ascii?Q?46eLkqmj0Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yYes1kpSToNGg9AIVhEn8E56Z6Pmokg+YevySuSeBL/xWjPBCSk9aVRXjwUMqFvgA4/xm10aw1tMMJKBElQrXSRalap33/hOo4+aM8Y/5yoqHnJywD0Ss2bilkpiWpL2xCKqrO0lXKnvhuiFeDohy3Xsyr/bR5Zf8wPMGHxpd4CHIlz+Ud4nSyHQ2tRe/TpoiAJ612LoKFzg3EhBPR/ovlaZi93CxlgYBXPW/gtqRPzZM0oNnsZ0msjRq4xLshqU8cu1dj94slUaLInbH8Fjt2aFDzH5mtgRjoGKrp8VojB9edKgC90eC7zL2tBSPEtbbadlrmY2Z2b9U4rlDWM5Sg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81468d24-0b9e-47b9-94df-08df12a3efc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 21:05:42.1541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3Eh9BTgUcC3dW2tcLM8Teuo1AarDGokzFwbTMIQ8mgfZSGPjRz8n4CdanbcI/z1hUWZ0WKu2W5WLZHojmmQVurVcGwpI6e7L6hDg2H0qLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, September 14, 2026 12:03 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v8 04/20] platform/x86/intel/pmt: Add register access
>callbacks
>
>On Fri, Sep 11, 2026 at 01:11:52PM -0700, Michael J. Ruhl wrote:
>> Some HW does not have direct MMIO access to PMT control and data
>> features.
>>
>> Augment the current callback infrastructure (data access) to allow
>> a registered driver to customize read/write access to the control
>> paths for PMT usage.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 46 +++++++++++++++++++++-
>-
>>  include/linux/intel_vsec.h                | 14 ++++++-
>>  2 files changed, 56 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index b6540f3a9a17..912b61c334a6 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -11,10 +11,12 @@
>>  #include <linux/auxiliary_bus.h>
>>  #include <linux/cleanup.h>
>>  #include <linux/intel_vsec.h>
>> +#include <linux/io.h>
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/mutex.h>
>>  #include <linux/pci.h>
>> +#include <linux/printk.h>
>>  #include <linux/slab.h>
>>  #include <linux/uaccess.h>
>>  #include <linux/overflow.h>
>> @@ -124,12 +126,36 @@ struct pmt_crashlog_priv {
>>   * I/O
>>   */
>>
>> +static int pmt_crashlog_read_reg(struct intel_pmt_entry *entry, u32 *re=
g,
>u32 offset)
>> +{
>> +	int ret;
>> +
>> +	*reg =3D 0;
>> +
>> +	if (entry->cb && entry->cb->read_reg) {
>> +		ret =3D entry->cb->read_reg(entry->dev, entry->header.guid, reg,
>offset);
>> +		if (ret) {
>> +			pr_err_ratelimited("failed to read reg: %d\n", ret);
>
>I believe we should use dev_err_ratelimited no?!
>since patch 1 we have the right dev handle anyway now

Makes sense.  I will update.

m
>> +			return ret;
>> +		}
>> +	} else {
>> +		*reg =3D readl(entry->disc_table + offset);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /* Read, modify, write the control register, setting or clearing @bit b=
ased on
>@set */
>>  static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, b=
ool
>set)
>>  {
>>  	const struct crashlog_control *control =3D &crashlog->info->control;
>>  	struct intel_pmt_entry *entry =3D &crashlog->entry;
>> -	u32 reg =3D readl(entry->disc_table + control->offset);
>> +	u32 reg;
>> +	int ret;
>> +
>> +	ret =3D pmt_crashlog_read_reg(entry, &reg, control->offset);
>> +	if (ret)
>> +		return ret;
>>
>>  	reg &=3D ~control->trigger_mask;
>>
>> @@ -138,7 +164,15 @@ static int pmt_crashlog_rmw(struct crashlog_entry
>*crashlog, u32 bit, bool set)
>>  	else
>>  		reg &=3D ~bit;
>>
>> -	writel(reg, entry->disc_table + control->offset);
>> +	if (entry->cb && entry->cb->write_reg) {
>> +		ret =3D entry->cb->write_reg(entry->dev, entry->header.guid, reg,
>control->offset);
>> +		if (ret) {
>> +			pr_err_ratelimited("failed to write reg: %d\n", ret);
>> +			return ret;
>> +		}
>> +	} else {
>> +		writel(reg, entry->disc_table + control->offset);
>> +	}
>>
>>  	return 0;
>>  }
>> @@ -147,7 +181,13 @@ static int pmt_crashlog_rmw(struct crashlog_entry
>*crashlog, u32 bit, bool set)
>>  static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bo=
ol
>*state)
>>  {
>>  	const struct crashlog_status *status =3D &crashlog->info->status;
>> -	u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
>> +	struct intel_pmt_entry *entry =3D &crashlog->entry;
>> +	u32 reg;
>> +	int ret;
>> +
>> +	ret =3D pmt_crashlog_read_reg(entry, &reg, status->offset);
>> +	if (ret)
>> +		return ret;
>>
>>  	*state =3D !!(reg & bit);
>>
>> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
>> index 843cda8f8644..917d9397a993 100644
>> --- a/include/linux/intel_vsec.h
>> +++ b/include/linux/intel_vsec.h
>> @@ -90,13 +90,25 @@ enum intel_vsec_quirks {
>>   * @read_telem: when specified, called by client driver to access PMT
>>   * data (instead of direct copy).
>>   * * dev:   device reference for the callback's use
>> - * * guid:  ID of data to acccss
>> + * * guid:  ID of data to access
>>   * * data:  buffer for the data to be copied
>>   * * off:   offset into the requested buffer
>>   * * count: size of buffer
>> + * @read_reg: when specified called by client driver to read PMT state
>> + * * dev:      device reference for the callback's use
>> + * * guid:     ID of data to access
>> + * * reg_data: register data
>> + * * offset:   offset of register to read
>> + * @write_reg: when specified called by client driver to write PMT stat=
e
>> + * * dev:      device reference for the callback's use
>> + * * guid:     ID of data to access
>> + * * reg_data: register data
>> + * * offset:   offset of register to write
>>   */
>>  struct pmt_callbacks {
>>  	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off,
>u32 count);
>> +	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32
>offset);
>> +	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32
>offset);
>>  };
>>
>>  struct vsec_feature_dependency {
>> --
>> 2.43.0
>>
