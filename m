Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225352676E9
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Jul 2025 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471468; cv=fail; b=C6pVRV97JYVdZgY5UHnc1r3X1Ihum/F8bwJ8LdgnqeVGgpmtK7fB/AzV0dcZCz30Z7LTAyVV+pn349bqPimPi162ar2oEtMuzL+vh44TJkTB096WXys5rp7DMaiozj0mEcXNqD9iUcwwd7JrFElrJUDvGkpbKOrwpnv7Ga1NQK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471468; c=relaxed/simple;
	bh=TwBDzxPrwnEN58eGT21rw2EJu89haBd3/3mOym1gmDg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WbYY25wjLV3R7hS0A03ouoNpEm/aPCwByvizPMrlrOBZwBQwNbNAVdGVpAkQFgfiGc8bcFabvNNeLF8rKTfMX5s0BOZ4+VDTbJb9J6VKypTfvlhrOxUPgyq2CgFRpZeCj3w4w7RTjqUTRQ3jixOLsSbJx4li0K3NQtEff9ooPlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evyJyEUg; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evyJyEUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751471466; x=1783007466;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TwBDzxPrwnEN58eGT21rw2EJu89haBd3/3mOym1gmDg=;
  b=evyJyEUgvppCbVOccQePldfTDvJYSOO9QxJrmBwcyJvuj5sVh1cGygej
   ujeHnorauUmFahnbIcUhMWxqrlodSooB4kb7Irf8hZBlOQNdq43xucPoX
   8+FuVYlbQTGHkzDOglepEnmUeZX0/m9Pwru0IT8vcQs/XrkgGZNI2658I
   FYNx9YhawiDi9RNm1qBXpTQAU3uXe3TFEojCoqUxh1YmTjKNbdC7CdvMk
   iiFFOA4X0PuWFs+5NUyFLLELSgRF7R28etmanoSokOv/Q9ON7aQNb8om+
   ZQX/10OYRiNVldbiGNup1zHR/okz6ualo0uDDMx9DRaKziUuhiT6Obole
   Q==;
X-CSE-ConnectionGUID: 4Hi4NEUpTSe9VlwHbulhiw==
X-CSE-MsgGUID: i48qKmMCSoi8lU3RQ+xaVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="76323946"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="76323946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:51:05 -0700
X-CSE-ConnectionGUID: 3POeLPzzRbemP9HKphwGDQ==
X-CSE-MsgGUID: otgXYLPWRBWSVbQbDni28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158494544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:51:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 08:51:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 08:51:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 08:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQm9jPIxaOCUmobduWbojI35RxiMCCyh2b/Rcf8kIGL4ZVrJ1vbg4l8/HXw2t92DxyJMCTBAe4NzqFZhXsK0pON3gGyZiCGcv/AMaup7WFH4F+q60CdUa6mXUONb9Fq6MdBgaKLkg8WGjFyjPfvzBf8C53Ep2U5+uPhOMCvTjTagRqt9KleXw0v7Bo6KNZ9WLpRXo2HGY4L70WAMVVGy20cTbVs86DnfDYO5qsMuMpXS54evxGzl1uIJhtmllb5b2bPexB3ym7o9Y3irmgJV8ZAjz5i3pAqv1yKM+uOyNoh/e6Q6jhfQfdzKWcGtfIP9w1fG1ob3txrh831K5DsuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ydkVQblWTJxdND3mSIIhY/u26Q9xW5WxykRF12gIXg=;
 b=b1iZiNLShDyDnKzvb9aj6NPMNYr9jAzGKPpgb3hmiCi8L4uvYEk9zJw/UWHn7e2q5z+f/nkpljd8YuqIjDvM2kwDLs+P2Tg0gQdiNhrINqZJg9I38tLjNCov97Q9RuqyehDJs6SzLWx1Uq8yURXcg/vdsYHaeK54PmwGMxIC6nyARZ7GWmpsuraRAy3UoI/Iyu4sbRGDC31YYUIA2gZqwf8O9sWDwO++94z0nc9X4TQJ2vDxHxgeYsKFTs0yhYJ+eEJZwTe9DABjF5TpDh+Rn6Yva7xZGZ3Zs6gbBXk4IHejg5V8EWgkG6wh401dqRYk7NhKZ8gSo1gG1rSouTRvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 2 Jul
 2025 15:50:36 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 15:50:35 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH v5 09/12] platform/x86/intel/pmt: add register access
 helpers
Thread-Topic: [PATCH v5 09/12] platform/x86/intel/pmt: add register access
 helpers
Thread-Index: AQHb56Q4Oe+6TpXxE0Ge77BHAQ1iNLQfAqLw
Date: Wed, 2 Jul 2025 15:50:35 +0000
Message-ID: <IA1PR11MB64182DE4602722AC9ECB3E89C140A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
 <20250627204321.521628-10-michael.j.ruhl@intel.com>
In-Reply-To: <20250627204321.521628-10-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH8PR11MB6755:EE_
x-ms-office365-filtering-correlation-id: 5d12f06c-c55d-4da5-543e-08ddb9802f70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|921020|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?1Zhf9RH1SZCTnLqXwt3ho1+smYWIabBQYcr8kxeTMq2JwKhyoaV8kUi3mjAx?=
 =?us-ascii?Q?PM1MNjLcus2liFHHaGZL6E4gJyd5qf+/6KvqcnGsLeIRHCwteqJlHNmL/hsf?=
 =?us-ascii?Q?JSCpmOYg9u3UOnYxp7KbfDpN+wrtJNiq69MhmqAmYAmZnoytxx3SeaC7dnKS?=
 =?us-ascii?Q?ftBjMpUKCGFvBS904QknHOTT1COCXM2xoGM9RgWmfXlkB8Ce8n0a/ZEuPVTd?=
 =?us-ascii?Q?UZgFxXSJOal98gzmunu202qMwClsziDdid+bN7+83CN3zmNNbwpFvLn8E7vs?=
 =?us-ascii?Q?iIvYzeELlVUY8fd3grRz2M+i753IkzOR9ZP/V76O9Be+3P8OLuv37E8ce2Mt?=
 =?us-ascii?Q?2Rx6ah7/EuLCng5jIQjEynZ5TVbVf/Z0myzRebxDciEkiUuNsqgkofwXVKOg?=
 =?us-ascii?Q?DxlabH9XCcezrTADanqgyu2KQISvjgcsgZd9mLuRba6D4uh94AMpCxayiXjE?=
 =?us-ascii?Q?qNIFdBIP3gAtMkY1sDy1oaFYII7Pk4FV9OBi9FNQ9IQxQT2JtlYyAdPD5RuA?=
 =?us-ascii?Q?VGBccgyzplmt3nX1hydnpFnlH6GNMDAcBAwPCO3yLwKVciSitNY92zDq354C?=
 =?us-ascii?Q?kIvBbj2z+m3ljMc8HfI24cnvfHI2iVHi1qwF8d/vM1m/DvHikYUZOZQxL/2j?=
 =?us-ascii?Q?Fo+95Y0IdqY4lGX31rrR9HfSn+bADIZ6soPtPMfBJaGJd2+OlVduwMWu8E3/?=
 =?us-ascii?Q?KeoxcellyeK1qMMAhFefqWuKHjM81eYCXk8wq5+LOHwBIFpQIfwIOjAW20At?=
 =?us-ascii?Q?wTAuyKyjKi2ILMWFnRALr3Cc/Mjk9h93ivMQEIlB5srhvGVUlL3Ifbl2KYyq?=
 =?us-ascii?Q?z+UUS0FQWmb1F9GaVSI5B2HjlwC3xHbTMkWewCRQ+AXpBAKkpACWCd7xgPqW?=
 =?us-ascii?Q?qg4HQA8yb94VgWWPKxUaUrmGtmxsOUj1tgWzyon12Ohb/S2w37Sc9dIhNr9W?=
 =?us-ascii?Q?Inmtan6L+1Ct0H7Q+OUSp9Q4pxLStkmBa8WCCifz8YDYPc0LtFLCZclKdbqb?=
 =?us-ascii?Q?gTy/f7/yabAHZ+NvnhwvLN08OD3SKBYma0IqtkX15nBKSCHRTaR8tZ8gI+xR?=
 =?us-ascii?Q?4cuReqymEeNQlzmt+sgsH7EAF19DGivRRH1S3MSCWLKBZauqHgGXIjpx1weK?=
 =?us-ascii?Q?DCgGTRQdLMa2uOlMbz3NiDYg3F41i3vBE8mZx6PyOnE4pv6K46nzWiZ7KsAw?=
 =?us-ascii?Q?0kwknMyjrr94AWxVTXgpgvBvoBeiOFFVprk66GofyyqgMKUpA56leQ2KM+OX?=
 =?us-ascii?Q?hoH79OJquxYYFEc7NJL0PUMNWG8/irjXjuTOduyyumVbhCtdux9FR1pkCeJj?=
 =?us-ascii?Q?xyxmcVUtualhUiePn+AbXAI83c5nGOrS1ea+QvYK5HwvcWxI7Os9AtUyN9Ij?=
 =?us-ascii?Q?nFXi0HFMwgdW3crv5LJPzJkG7tPEfWFeRCvRLQsJa5HE3OWbimsT2bfcwlfM?=
 =?us-ascii?Q?u7FqErFNYDVfqrAcin0zI1liEzh/8rW4UCc06oOvFkawJPE8NoXQ4nrttYsa?=
 =?us-ascii?Q?ZKF0vjeNtCmu+A4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ELS33nVcDhRuc7NItqz/q9ezCKD6524qs5x0SSNjdlJj+p4eu660GKAIoXjX?=
 =?us-ascii?Q?kyiRFWxmdIkTEnO+Gx+nK8njCvsrwNxsbJpFcnZ0o8bbeif010EyjTUZx6fz?=
 =?us-ascii?Q?hkjKFDa19k56mBf6Ayw2CDQajZpR9hbnMR4iqDIcjjFwVZB7lusg/fnrHUkj?=
 =?us-ascii?Q?wgisjmaBwcigkxV7KN0l41f/FuakSYGbQgjakxU1i6fAMbDqgaowU1hkA714?=
 =?us-ascii?Q?8H60B8oc+eScfZm9d1Lwj9qgUHvBiD25s9fkhML53Y/mgDQbaz08eORS7nj2?=
 =?us-ascii?Q?kb/E24YkrhFLUrn7PKZhLhbNUC+DgwpfQ5tA/fqY2/PrEeLwd/lpQiBqCja3?=
 =?us-ascii?Q?Tx4I5cKQUadvIMNLMkZ5LwlIZx5uGzGn2g15h6XO10vxDzxYr9IwhWYFeM81?=
 =?us-ascii?Q?c3e27inlgPtECkL7oBT862NlaITsWhcSjtO1h5n+onx3PJB983VfzxQA3oih?=
 =?us-ascii?Q?l0AFQujSyVHYwS6YmbdL0OKsl20ruthF7AHCyqQB1N3NG/1OmZiB0sLj5H8o?=
 =?us-ascii?Q?JA3ebD/wf1XNp98HOGVltv+lK1NUI4GDw2LRaI0GdOxGhH68LSO/iduJrMz2?=
 =?us-ascii?Q?pB9IaLa0BtWI2qiDtQprJWIT5fE2TpzWMoeU8k6uKZpaaSbyBmawXtnmLGca?=
 =?us-ascii?Q?JPm5VNDk5Jx1xB0CdMYXVWk9SN6im//p99K4sca19flUFI4QEt0Ok4y0DYUo?=
 =?us-ascii?Q?vDemxkR4s5ac5atExkfMvoDntHAfyAC7oi9ifdfLdUXQO+NmSlPs5i5oLp1+?=
 =?us-ascii?Q?5O4pNhPgqna9v3/ewvyLTuBtOJAHGGekUK4Rf1ELqmQqw4PZirEox3O6I9SS?=
 =?us-ascii?Q?Rm5+2IQI01Zo6ZeegL01KSWYFdleI1RuVE+dh+NsdhNx/TtmjiRy9b6MLqfE?=
 =?us-ascii?Q?KGhLc8iRtne7nGp1GqL2uc2PXvF6d8rlKiytRLcjrMkcqf+3bIy8dEa4/dgx?=
 =?us-ascii?Q?rYjZmEVJuUclIL0RSRueQ/BhopZKa6gt2kBaVcSWH3twt4hIFGa7se7JpLTx?=
 =?us-ascii?Q?FAINh+X/r3pMPoK/tqAecS4WgICMePI6DE7vzn+/FdNzAvILtpbTqSbaBVnC?=
 =?us-ascii?Q?7wW+CNx5wTMpZrUkPvKN8Qh0WjT97JnedEwsmmMp/+VKMRSWo0Za+hB0snRJ?=
 =?us-ascii?Q?uvN4B64+QpspXZKk31/lIdsECddGW4dBjdX1ZNBH1jKl4gQKb/9XdDZFOrCk?=
 =?us-ascii?Q?hgy8ZSpooLI0c2jhhENBlbGJLMK5Py0kaaYL+ZQlnu81GYKtD2OKGzpGQFzT?=
 =?us-ascii?Q?OF+VPA798b4dE3B4t2z5NKaDLxoSDjTQGlbIos9xVUGHY+noq9Gj0Q63VAb1?=
 =?us-ascii?Q?SULxgf1OGeqJlSq7Sbexx27E2xoR9MKWbMKYkziPuKcvDKS4Ve9Vh6FbT2X8?=
 =?us-ascii?Q?wMEsNiaHOGfdRCGEa4RYd7vw01nN7otxyHthQY9yVHQQMORcXcI4M3H4FpoP?=
 =?us-ascii?Q?+aOOaIlvvZo2BUHa5IAdgxtH54cfS4pYLBwaEqMF9ViDXyPAxvHCNg2NN7n2?=
 =?us-ascii?Q?B+tv0UX2yxq3UHv9cZXEr43VQoFHcDFsSWlzSN3VgtiLdjd3JKWibiD6XZ2Z?=
 =?us-ascii?Q?dEnw+ut8sKpIozLN7Q6/EXWNILJuCHn3Pw/gjZcS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d12f06c-c55d-4da5-543e-08ddb9802f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 15:50:35.8946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PWHSNSVWQtC+vRXwVnOwyAPJXIkFAM+riwtkKytnj+K2HyHbTMUi63sZSlTJRfvFrOnGqmP+CQT/y3v/n87CO+yow+V5l8axFQYYIj+RPiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Sent: Friday, June 27, 2025 4:43 PM
>To: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com; De Marchi, Lucas
><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>thomas.hellstrom@linux.intel.com; airlied@gmail.com; simona@ffwll.ch;
>david.e.box@linux.intel.com
>Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: [PATCH v5 09/12] platform/x86/intel/pmt: add register access help=
ers
>
>The control register is used in a read/modify/write pattern.
>The status register is used in a read/check bit pattern.
>
>Add helpers to eliminate common code.
>
>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
> drivers/platform/x86/intel/pmt/crashlog.c | 60 ++++++++++++-----------
> 1 file changed, 31 insertions(+), 29 deletions(-)
>
>diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>index 23b3971da40a..adaca7ce1ba5 100644
>--- a/drivers/platform/x86/intel/pmt/crashlog.c
>+++ b/drivers/platform/x86/intel/pmt/crashlog.c
>@@ -64,20 +64,42 @@ struct pmt_crashlog_priv {
> /*
>  * I/O
>  */
>-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
>+#define CRASHLOG_SET_BIT	true
>+#define CRASHLOG_CLEAR_BIT	false
>+
>+/* read/modify/write */
>+static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool
>set)
> {
>-	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>+	u32 reg =3D readl(entry->disc_table + CONTROL_OFFSET);
>+
>+	reg &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
>+
>+	if (set)
>+		reg |=3D bit;
>+	else
>+		reg &=3D bit;

This should be:

reg &=3D ~bit;

(updating patch set).

M

>+
>+	writel(reg, entry->disc_table + CONTROL_OFFSET);
>+}
>+
>+/* read/check */
>+static bool pmt_crashlog_rc(struct intel_pmt_entry *entry, u32 bit)
>+{
>+	u32 reg =3D readl(entry->disc_table + CONTROL_OFFSET);
>+
>+	return !!(reg & bit);
>+}
>
>+static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
>+{
> 	/* return current value of the crashlog complete flag */
>-	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
>+	return pmt_crashlog_rc(entry,
>CRASHLOG_FLAG_TRIGGER_COMPLETE);
> }
>
> static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
> {
>-	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>-
> 	/* return current value of the crashlog disabled flag */
>-	return !!(control & CRASHLOG_FLAG_DISABLE);
>+	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_DISABLE);
> }
>
> static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>@@ -98,37 +120,17 @@ static bool pmt_crashlog_supported(struct
>intel_pmt_entry *entry)
> static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
> 				     bool disable)
> {
>-	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>-
>-	/* clear trigger bits so we are only modifying disable flag */
>-	control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
>-
>-	if (disable)
>-		control |=3D CRASHLOG_FLAG_DISABLE;
>-	else
>-		control &=3D ~CRASHLOG_FLAG_DISABLE;
>-
>-	writel(control, entry->disc_table + CONTROL_OFFSET);
>+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_DISABLE, disable);
> }
>
> static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
> {
>-	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>-
>-	control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
>-	control |=3D CRASHLOG_FLAG_TRIGGER_CLEAR;
>-
>-	writel(control, entry->disc_table + CONTROL_OFFSET);
>+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR,
>CRASHLOG_SET_BIT);
> }
>
> static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
> {
>-	u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
>-
>-	control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
>-	control |=3D CRASHLOG_FLAG_TRIGGER_EXECUTE;
>-
>-	writel(control, entry->disc_table + CONTROL_OFFSET);
>+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE,
>CRASHLOG_SET_BIT);
> }
>
> /*
>--
>2.49.0

