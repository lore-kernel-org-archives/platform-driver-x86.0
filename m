Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D718D636
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751955; cv=fail; b=HJKZBrGmiKct91iV6wSjEAEkOzBRD3+A3MatAx9VHP5AdNApu7xmY/mZgxba0vMCBB9WImipz5RElXDScrFL1pv/A291axtcN8kJAI0j5wY5UdCisygks9YuJdlou+eAIiGwVr71+aGw/pGspr4Kb/ZYOZsUJw1ZiSt9TnujmaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751955; c=relaxed/simple;
	bh=wX6aMlxdl1IETvd0+evMyyUiXX8mTBwuRSTlc1oElUc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UimUh85qe7zKmtV2kG7oiATH2Susc3ySiytesZbe2cU76Syr1IWRPVCTZ7uLlKcxGEAzGgg43n3sWLZZdUVcCb92RTbzwekM5vfh3Bc3d1yRymSn5Z5nSkvqSD1kY5x1FMyLhORdg6nl/WUSzMTpJbNknmKaFSM/+T66QCevGKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhVYyloz; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhVYyloz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787751952; x=1819287952;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wX6aMlxdl1IETvd0+evMyyUiXX8mTBwuRSTlc1oElUc=;
  b=LhVYylozzbXG3Jg3Dq09ZHV3IqD5V9X1EoFzcZpjbUIr8v0858LuvLpY
   OlzUAlslmvy1zDzjEH4v/eUPKDJi2rilJTq1wHxJdelweP3ee/nJ34+6F
   2M5VqGyGOwI7tYQnWAwYWECOsAGUwDmGDv6zuWcMR878ArFqJ5rcjXXyI
   l4F2J+kqCfIDW+CcRd2p/TVr7C8N6FR5/4kuzdwu8zFnhxniQKP1+TKs2
   /ptFzGfEchRke1JbfIiSVsTx8Wz1Kng7+wu3GWsVPCy9eBaByxH/OlRXt
   l4UL3+J/KlO5HuJ76gHG8ChVfxUT/E5OxeIsmov4zTrHQTyRbBHIBp1t7
   A==;
X-CSE-ConnectionGUID: zCsrXHsITw60j+kXHoz3wA==
X-CSE-MsgGUID: L7S/zBzaTDOjdUl6KJhHjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88152860"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88152860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 06:45:52 -0700
X-CSE-ConnectionGUID: zj+rsn97TzmLKUG7uzJceQ==
X-CSE-MsgGUID: oLueghH2T4yWt9uPPM34Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="264981470"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 06:45:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 06:45:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 06:45:48 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 06:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLJZ2JIYcziS+NLrzKQ0zi0jqDH1q9GA4GPnCQQzF5K5IdcT+CWDzoL93ORVcV+GXs0YH9UoRJ5PVGDMk/ilBOWYUzNUQPvDAmrubxpCFs0PWE4TbdIBWA7VcfRW49O0nVldnRxvtAFtJHQ9so5vuG0IaHdh2SyRzOqyCDdArTGNOzYY7L63PpCgwyWp2djzDmZlS6R7d+8sjvpxvhWPOF67x73r8X2YebCOGMMvDO8dLPqLvtndwxNQL8y6Hviu6qWASWsp9DvdTH45SRc904zvTPz4YAwbWx5U137WKeeFtQ+4fntH94mfVCfeowyPqKmLxhnM5fXNxG2XudbtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aavGYcXOdeTJIHArmRA2/uFqls9VdXPP+EckR66cWk=;
 b=opcZaEdRpOyXKaG3XbXTGUrG1RzJ1jlExx+Na7uH69obkT05FCMPpZ3wFFUCFPpXDR6SIlGSZ+t77+CQLoMHFhdJC0VC7d6Qcf0UR9wtY8b5QEucJKHy8kz4apNeK4Ba+dPR9s8SXmWs/yQoFADoSEx0hHdXtjXNFPpPlg4dNHW0lCZZ1rUpKt1ygAPm2ZCS2LUljkrEti4VobfDRSNvjgmN0YVyqkzc1AELD/HTnpBNlkTksbo5TlYD6dizs1I7poNtz4ZEqhRGa0PChi1dONAyUKKTpjRog6Rd6bzU31uqWH0UBFSj+82qd8TlbJBwd/+S/ITh/KGr30HCE7WFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 13:45:44 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 13:45:44 +0000
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
Subject: RE: [PATCH v3 09/10] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v3 09/10] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdM+US1l5pgEFj+U635pTr67oK+LatkhKAgALHn2A=
Date: Wed, 26 Aug 2026 13:45:43 +0000
Message-ID: <CH3PR11MB046149EC84190DF097D775304AC1AE2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-21-michael.j.ruhl@intel.com>
 <aoyYUxEN4PTA0s1E@intel.com>
In-Reply-To: <aoyYUxEN4PTA0s1E@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CY5PR11MB6392:EE_
x-ms-office365-filtering-correlation-id: 85cd8be5-8cd0-4a7e-4b3d-08df0378535f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|22082099003|18002099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: IokQfI9iszd6WygrxQkI1+wp7356aTUBtuExeDJl2IsNt2jVKwo9KLqXniVnoPueSxlJCayiypaZMeRqzlMkCQPKd+hpEfHaBUkWkn+P0pMRgKxIKfVntXyY8RnO61evhMj9iaUaU06IMO3g17NhoQGjx0cRygAtpqcoZL3fCmYBzX1CRzNXNc6nRJUg7Zsw9krzqhzM3yt5+4mrGqU/KxEI0Vh5npGtG4Q0NQ58XnbKldMGQuNWZXrnxEW98U4ZEOpDCikTeZrY/Z9VdsGQCRg46Mby1HBYaxmJKzXy/TfndqrZirlx5JMEcXI5GYWkvwHw8RwD0WNM8Xki92tEJAibTnnAGhmYnuBXXJqrZ/b7VJPkI+eKFG1DD0FycIf0h1dP/5eJ/Xh2NFEB56MB4eUOemKh/oGBf40GIPlbOWiG1RP2ybPdUM8b/RwnwhopOzfxON2iL8Bg/WjAT/cEW49sJoU5id0g3YtMrSip8zlfqX4GVlgyG+nRVUNn+jSUOIuUdP/C2uWU6zCV3sWgCMSUeBzA6TtbTaslAbBhJ26+fheuUGKjHTpKMkJDf6sDtsxTQ4mIZ4oHA8oDo6hAkiWbe4v7fUGiYn/wxnNwGA7w74mq7m7iLAJ1jwD9OJG4cme5fVKs1nZOSD/V5KlNV6jdFbvqfh/QpI+j3QAyS6n3eoJgcDeBg5OPWDVA3Qu1YNXLEKRrvn11oCNO2sNy9q3VtPNnFCoO51JHGI+GS0A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XiTePs4tAUxE7VQf1F+xwdivO7w68fgVKIbvryAk8FR29RD0Mgw0xWfDv9uR?=
 =?us-ascii?Q?y+zH1xTmcAI1XtvS2k/YEK9rqRCzvVDTPaHCIkBvMcUHAf5QikjPNl0yasZ5?=
 =?us-ascii?Q?QhhtVEPWvl97e9DbZpWoGXqWqGeUK6D+6kTdaMUO7vDeaso3k0fP6Suh8aYM?=
 =?us-ascii?Q?e1l72rX7geLhyVjC3DdjXa78tQ6hmd9vaCoDRiR6ei0lNGUrNZJkw7zS9B7G?=
 =?us-ascii?Q?3cohW9z2sxQR4EDf2DVRYHoAcno4U3pvBvsHShABeAxCybw8tvhdxPrZw6ig?=
 =?us-ascii?Q?8fHtvgXfvlVI1mbIIhptlJSohnyj4OfBJ/bcg2+OhBrqyCZwSf8bb/9qO3Rl?=
 =?us-ascii?Q?O5ccJ0PSkhY/oRLkJRAt/mCHy0/SsAfFD+pbR54CcOqvJwAYyURer+WatTDq?=
 =?us-ascii?Q?cy1efMibAFWANcafb3JvMqTnvpi84S9bab3xb0GvATT+mHFQAvG633Qn38Gt?=
 =?us-ascii?Q?9jnLOMWa2iqGK8nD3igkEpTrQ36NRk9gNMp8LZRMruOoVXyNrWuNdOAzm7p6?=
 =?us-ascii?Q?R1BtThK2EPLy85cP0KZeHKH+AqjRefgZ+LLhlSuGiENrELnAyphDBOumWtIz?=
 =?us-ascii?Q?fptDu4gZ713TFEMnCSZZVchkDReXxc/aMwfgz/23ej8GPp2493mppQBqQKfm?=
 =?us-ascii?Q?fAtoCWPdg2lTUvJ2kHKzFke7172WrYKsIr2KQOPZUU60Uv1/6sKOwtdDEQ9o?=
 =?us-ascii?Q?Klwf74Dh0sCYcXMGl+m9p1oaf7jxvjoNoKLqZvVXdqXwgbR7N0UT/OWU+HAx?=
 =?us-ascii?Q?O8V4qwF/eKQkpcnPdiwed1YN2Yk3YH/Z0NHQOP1fCsSx1hKMVH86pQpPgCDG?=
 =?us-ascii?Q?sERenuDdfujtldISx0w+iK3ptlOjnFbXBHsMyXbsGv0z7wdg3LR0NDUQn3pH?=
 =?us-ascii?Q?5BgE+xthU5ZJ09LAaRnUPnkvYoravvxrDB1mPEQbPi/Arb1RVdEKcN2jsv1s?=
 =?us-ascii?Q?2LWEDOfSWlCuyNY+t5jPJc2bAFURDUJCD8jf19Qxyad77XgvejFA2zne0EeE?=
 =?us-ascii?Q?k9JJOutYRGJi0lEML87/0uUtwfbv2m0JIGVXrnopLcf2+JBrCFGuy+Mu+Yh1?=
 =?us-ascii?Q?xC/CoQ7W0IU959DwUVOJwDBfQh0Wujv4J3KdjYkWhFahd4vLd1x+EZFDysX9?=
 =?us-ascii?Q?FfYkPWTU47NkC3fZNR1xd2pBZ57yOHBwoEgEJ9VbsUi3sBvPysedMi5qT/VF?=
 =?us-ascii?Q?I8FAoh2QXxFXZTFGXszHmoEG5OF9TLvz/ZgTGglPvbuCP9YOkrReW0EHvqIV?=
 =?us-ascii?Q?95d/xSocu82+GNE7TqKGYGGn3v/rF5htKWPS5AxtxZdkBhaRaJEzcuFvY34A?=
 =?us-ascii?Q?5Ywfdki39X3m8qa82z3wwMpka6M33HMT8EcsBx4j7WNjXQYI7GboAxNC3y2Q?=
 =?us-ascii?Q?PB9Cl5rs0w+PlSkJa3vtpYaasqZCQnB1reXKMrGYeCu5Nh/YivGvXso2b8nY?=
 =?us-ascii?Q?CRVTet0gqLGeC2RvHi1267pl2bIpQkwQNeJvasI0qhF3TTPCvtgh9r6GoXD2?=
 =?us-ascii?Q?FE3ml9GOh//dmSx3JOvana6+WC62PSofPO1vHWbipX42KibYNzHyOTPDG49g?=
 =?us-ascii?Q?tsMtUfSi4BbTDLDp5HvgI5XZXgoPTlj6VGKev/zVa4TG+6rWR9RdjYwvHVzY?=
 =?us-ascii?Q?XGA8TYATpCPErea837XaLo0j5maTPszfAfFPRL4Tk0jzvDJtkTv2L4F8JcFV?=
 =?us-ascii?Q?4TbQG702ZrJmzDN88ILVjlqQhQk764QFt4OzLI3qPj1J9Z1w1f+l1osbPnio?=
 =?us-ascii?Q?HK4YcHV7Pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HdENjfPH2NDW4DUUR6lFgBI4FNX4FDIb5taiMYIrqUkiQ1L/CS2wwbQBu8S08AN6FxbwCnO739L1guIzbq2pQkY6Z1e2CFxShh0V275AKjd/ouR/o78iIC8Zv5Yxp3LgoOXumCyUm0k1BHUe+y25JIZLe8eEXwzmuMR9/c5sY38KDbzajUpyjxGa9S2U7C3EtRk3C/xyda1V7px0vE6K+7Ktmpms3rn4dlySNRLbfr/a51BfKBaoOROmNNmCNyBSzj9sqx4xkZL2RbJuFMuwEoOdD41PL22oUaUgiDHh31UyT4XkLCoC91+kvsrTX+/bAWjh3NMEBaIUVM4XxbB5cw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cd8be5-8cd0-4a7e-4b3d-08df0378535f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 13:45:43.9252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIKlO9MRpsa6YHKD2JKN5NBg4TtobtaJ1dQg4umFk2ixXL1OQbkKI5tM4sawwTtlK332KMWd8y8NWs399rfflr48nd3RXZb7Ec8seCryTk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6392
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, August 24, 2026 3:16 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v3 09/10] drm/xe/vsec: Support late bind fw informatio=
n
>
>On Mon, Aug 24, 2026 at 09:23:25AM -0700, Michael J. Ruhl wrote:
>> CRI FW is loaded on power on.  Because of this, access to
>> the FW cannot be done until it is running.
>>
>> Update the XE PMT probe and access to check for late bind
>> devices, verify, and wait for the appropriate FW state
>> before probe or access.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>  drivers/gpu/drm/xe/xe_vsec.c         | 141 +++++++++++++++++++++++++--
>>  drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
>>  4 files changed, 143 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>b/drivers/gpu/drm/xe/xe_device.c
>> index 74d566693dfd..bf02f881095f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1140,7 +1140,9 @@ int xe_device_probe(struct xe_device *xe)
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_sanitize_freq(gt);
>>
>> -	xe_vsec_init(xe);
>> +	err =3D xe_vsec_init(xe);
>> +	if (err)
>> +		goto err_unregister_display;
>>
>>  	err =3D xe_sriov_init_late(xe);
>>  	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>b/drivers/gpu/drm/xe/xe_device_types.h
>> index 3f1a70813a99..5d9e6e66c665 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -468,6 +468,10 @@ struct xe_device {
>>  		struct mutex lock;
>>  		/** @pmt.base_offset: device specific base offset */
>>  		u64 base_offset;
>> +		/** @pmt.work: support late-bind probe */
>> +		struct delayed_work work;
>> +		/** @pmt.retry_count: late-bind probe retry */
>> +		u32 retry_count;
>>  	} pmt;
>>
>>  	/** @soc_remapper: SoC remapper object */
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 578d59048b39..edc20c24137e 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -3,6 +3,7 @@
>>  #include <linux/bitfield.h>
>>  #include <linux/bits.h>
>>  #include <linux/cleanup.h>
>> +#include <linux/delay.h>
>>  #include <linux/errno.h>
>>  #include <linux/intel_vsec.h>
>>  #include <linux/module.h>
>> @@ -17,6 +18,7 @@
>>  #include "xe_mmio.h"
>>  #include "xe_platform_types.h"
>>  #include "xe_pm.h"
>> +#include "xe_sysctrl.h"
>>  #include "xe_vsec.h"
>>
>>  #include "regs/xe_pmt.h"
>> @@ -162,6 +164,14 @@ enum capability {
>>  	WATCHER,
>>  };
>>
>> +/*
>> + * Late bind will delay 100msec for up to 20 seconds
>> + */
>> +#define VSEC_LATE_BIND_DELAY_MSEC	(100)
>> +#define VSEC_LATE_BIND_RETRY		(200)
>> +
>> +static void cri_late_bind_probe(struct xe_device *xe);
>> +
>>  static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>>  {
>>  	u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
>> @@ -272,6 +282,56 @@ static int xe_guid_decode(u32 guid, int *index, u32
>*offset)
>>  	return -ENODEV;
>>  }
>>
>> +#define WAITING_FOR_SYCTLR
>> +#ifdef WAITING_FOR_SYCTLR
>
>I'm afraid you forgot to remove this before sending... or what's the goal =
of
>these?

Until the sysctrl patches (with this API) land, this will not compile, so t=
his is to allow CI to not
stop looking at the patches based on its inability to compile.

If there is a better way to do this, I will use it.

M

>> +static bool xe_is_oobmsm_fw_ready(struct xe_device *xe)
>> +{
>> +	return true;
>> +}
>> +#endif
>> +
>> +static void cri_late_bind_probe_work(struct work_struct *work)
>> +{
>> +	struct xe_device *xe =3D container_of(work, struct xe_device,
>pmt.work.work);
>> +
>> +	if (xe_is_oobmsm_fw_ready(xe)) {
>> +		cri_late_bind_probe(xe);
>> +		xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +
>> +	xe->pmt.retry_count++;
>> +
>> +	/* wait up to 20 seconds */
>> +	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
>> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to
>complete\n");
>> +		xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +
>> +	if (!schedule_delayed_work(&xe->pmt.work,
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
>> +		xe_pm_runtime_put(xe);
>> +}
>> +
>> +static bool wait_for_fw(struct xe_device *xe)
>> +{
>> +	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>> +
>> +	if (xe->info.platform !=3D XE_CRESCENTISLAND)
>> +		return true;
>> +
>> +	while (retries--) {
>> +		if (xe_is_oobmsm_fw_ready(xe))
>> +			return true;
>> +
>> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
>> +	}
>> +
>> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
>> +
>> +	return false;
>> +}
>> +
>>  /*
>>   * xe_pmt_telem_read is a callback API.  I.e this can be accessed exter=
nal to
>>   * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to=
 be
>> @@ -318,6 +378,11 @@ int xe_pmt_telem_read(struct device *dev, u32
>guid, u64 *data, loff_t user_offse
>>  		goto dev_exit;
>>  	}
>>
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>> +
>>  	mutex_lock(&xe->pmt.lock);
>>
>>  	/* set SoC re-mapper index register based on GUID memory region */
>> @@ -327,6 +392,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>>
>>  	mutex_unlock(&xe->pmt.lock);
>>
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -374,6 +440,10 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
>>  	disc_addr +=3D CRI_DISCOVERY_OFFSET + inst + offset;
>>
>>  	xe_pm_runtime_get(xe);
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>>  	mutex_lock(&xe->pmt.lock);
>>
>>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> @@ -381,6 +451,8 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
>>  	memcpy_fromio(reg, disc_addr, sizeof(*reg));
>>
>>  	mutex_unlock(&xe->pmt.lock);
>> +
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -416,6 +488,10 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
>>  	disc_addr +=3D CRI_DISCOVERY_OFFSET + inst + offset;
>>
>>  	xe_pm_runtime_get(xe);
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>>  	mutex_lock(&xe->pmt.lock);
>>
>>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> @@ -423,6 +499,8 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
>>  	memcpy_toio(disc_addr, &reg, sizeof(reg));
>>
>>  	mutex_unlock(&xe->pmt.lock);
>> +
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -454,12 +532,44 @@ static enum xe_vsec get_platform_info(struct
>xe_device *xe)
>>  	return vsec_platforms[xe->info.platform];
>>  }
>>
>> +static void cri_late_bind_probe(struct xe_device *xe)
>> +{
>> +	struct intel_vsec_platform_info *info;
>> +	struct device *dev =3D xe->drm.dev;
>> +	enum xe_vsec platform;
>> +
>> +	platform =3D get_platform_info(xe);
>> +	if (platform !=3D XE_VSEC_CRI)
>> +		return;
>> +
>> +	info =3D &xe_vsec_info[platform];
>> +	if (!info->headers)
>> +		return;
>> +
>> +	info->priv_data =3D &xe_cri_pmt_cb;
>> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> +
>> +	intel_vsec_register(dev, info);
>> +}
>> +
>> +static void vsec_disable_late_bind_work(void *arg)
>> +{
>> +	struct xe_device *xe =3D arg;
>> +
>> +	/*
>> +	 * If was work was cancelled while it was still pending, we need to
>> +	 * take care of releasing the runtime reference
>> +	 */
>> +	if (disable_delayed_work_sync(&xe->pmt.work))
>> +		xe_pm_runtime_put(xe);
>> +}
>> +
>>  /**
>>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>>   * interface
>>   * @xe: valid xe instance
>>   */
>> -void xe_vsec_init(struct xe_device *xe)
>> +int xe_vsec_init(struct xe_device *xe)
>>  {
>>  	struct intel_vsec_platform_info *info;
>>  	struct device *dev =3D xe->drm.dev;
>> @@ -467,30 +577,44 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	platform =3D get_platform_info(xe);
>>  	if (platform =3D=3D XE_VSEC_UNKNOWN)
>> -		return;
>> +		return 0;
>>
>>  	info =3D &xe_vsec_info[platform];
>>  	if (!info->headers)
>> -		return;
>> +		return 0;
>>
>>  	switch (platform) {
>>  	case XE_VSEC_BMG:
>>  		if (!xe->soc_remapper.set_telem_region)
>> -			return;
>> +			return 0;
>>  		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
>>  		info->priv_data =3D &xe_bmg_pmt_cb;
>>  		break;
>>
>>  	case XE_VSEC_CRI:
>>  		if (!xe->soc_remapper.set_telem_region)
>> -			return;
>> +			return 0;
>>  		xe->pmt.base_offset =3D CRI_TELEMETRY_OFFSET;
>> +
>> +		xe->pmt.retry_count =3D 0;
>> +		INIT_DELAYED_WORK(&xe->pmt.work,
>cri_late_bind_probe_work);
>> +
>> +		xe_pm_runtime_get_noresume(xe);
>> +		if (!xe_is_oobmsm_fw_ready(xe)) {
>> +			schedule_delayed_work(&xe->pmt.work,
>> +
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
>> +			return devm_add_action_or_reset(xe->drm.dev,
>> +
>	vsec_disable_late_bind_work,
>> +							xe);
>> +		}
>> +
>>  		info->priv_data =3D &xe_cri_pmt_cb;
>>  		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>>  		break;
>>
>>  	default:
>> -		break;
>> +		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>> +		return 0;
>>  	}
>>
>>  	/*
>> @@ -498,5 +622,10 @@ void xe_vsec_init(struct xe_device *xe)
>>  	 * resources.
>>  	 */
>>  	intel_vsec_register(dev, info);
>> +
>> +	if (platform =3D=3D XE_VSEC_CRI)
>> +		xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>>  }
>>  MODULE_IMPORT_NS("INTEL_VSEC");
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>> index a25b4e6e681b..c4a1e2fc67d8 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.h
>> +++ b/drivers/gpu/drm/xe/xe_vsec.h
>> @@ -9,7 +9,7 @@
>>  struct device;
>>  struct xe_device;
>>
>> -void xe_vsec_init(struct xe_device *xe);
>> +int xe_vsec_init(struct xe_device *xe);
>>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t
>user_offset, u32 count);
>>
>>  #endif
>> --
>> 2.43.0
>>
