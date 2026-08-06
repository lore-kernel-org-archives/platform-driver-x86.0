Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8AE3E5A26
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025907; cv=fail; b=Ws59QP4QSYMqNudKQmKUELv92Nxzhwrq5f+NP+yWcxWOwWkFwYp7FKZUscywEIVdsB2zELtbMs2xuAaLD0+CI2tH7n6tSmqcThYMKtUb8zBC1+P6irbbx0DE3BsnxNHiq7j3j9pguNi87eGWaqEKjGWoC2M5QSXIaXOkECJNm44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025907; c=relaxed/simple;
	bh=IorDzN1sFz2W/SacrnAiSrj1ajDfi+PAZmODx249iII=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l9u10yZuEpkfsyx3zgVmEg4ZcpfokW7f559S9pbu7dHNkmTJsHO5MRWCtIhKuDMe96UU6w9NMxM2rK5f9nmfJbaUTfRda/6vRywYE52VFCGdztZI3b7kEjXeGgQF3D2d7t8Jj8LKdsSvHiygixkZA/CCo9z0ANtscWJwzDFgs9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgORK+6n; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgORK+6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786025905; x=1817561905;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=IorDzN1sFz2W/SacrnAiSrj1ajDfi+PAZmODx249iII=;
  b=PgORK+6n26OVuR3Zvgmw50Lv/Y22iK+XvVpa9k54Fx0SSfvYk4guL0NY
   UeRDiTMoZ2RbX2AESUjGBIi/GFKEec28BjZPnd2URqUvMKUwWSrYABUZN
   kd+dr23NkO7yuTArCn5JVS3XQYPPBIaUW4RyrC7QY1p4j7D5sOqihFZU0
   CAT9d7rgDLkEfijBgNRHiLlW6XPXM6Y0pqrCyi4Oy3ND3cQZVqf43Z6O1
   RhXTd5oZWDJ6aZIVXFEjcNx5dO3kwsaIGPDkeuf/uZWdH1LbYUj3Cs+e4
   uZBa0qSmPcBHJaSyFFXcEQkaGD2WukN06gIATSSrQgmUqxlTZb+N5do61
   g==;
X-CSE-ConnectionGUID: hwEWYhvpQBmF7ZRm61kPQQ==
X-CSE-MsgGUID: PO48VQolR3+Di6OH7cvuVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90439475"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="90439475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:18:24 -0700
X-CSE-ConnectionGUID: t578t2yAQE6xFSfSqXi1kw==
X-CSE-MsgGUID: HryC7iPGRQKVGyvmJifHnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="262196009"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:18:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:18:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 07:18:23 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVq1FthfI+yBsbvbhgUCW6+o9gs75NCC29atMLWHCRCAYavaGD94uL5eoDU8XIP4L2Ml/4HpbHe4mr7xCJA5+tw5yUk6mDwM7NX13tW9fuJqmmrIwlG1Es0MbyLeiseyHRmu7fu7GHPrdAZjLmBLpC6EEhCYdFg5uIK1UmSP89kAjeFhUuXdER8eF38GwjT3ljvhSwuoSm9ijVEuRuR6U6GMx/f0rDtlmgYkubXfGpu55k82utEpllNrIjoPDqST+opPNHy+zmwwUv6avBoK7TiH+zC+ADhHMWq2ygOdZRTrY4lmgzoA+CCywlG1qCcMKjHdKC946ouwKgkxGwmjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jv3Rt0B/+pOPwDH+AObxUmM7aKRPk9kWvFJUkSKD4k=;
 b=kwzd7uxdM3v+38ulfZUKI2MeYNNKOw750kmrXsoomJwDhAcXc+JMa9m2j5UfMHO05IkWpXvT+JO3yOwU16EGJ8aQTyr5H6DlUNF60wZLq/CI1MrpqXDUcfknSi2gJZtoRDe3OEK0FFKLgEZhwfHuVeJsJ9aVvQk2/sL+OqVceLo1kS+IMjtcJV+cPC7EQS4bVXS5NKrJqV9cE8kQ1eAu9TcX2C3xamCR14EWLiKK391qaUNYszZWR0dUX3EYrd/X7P05Ud29cWx0gbkSt2alRcu8iuVSSEmU/DbHkOy5AsJWdcAb/nsiv//D6JaVacVF7809Jw6CQKbaTZ+4pAkXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 14:18:20 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 14:18:20 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: RE: [PATCH 0/7] Crescent Island PMT support
Thread-Topic: [PATCH 0/7] Crescent Island PMT support
Thread-Index: AQHdJaujuhm/CAUk/0CkkecaVAswpraREVUw
Date: Thu, 6 Aug 2026 14:18:20 +0000
Message-ID: <IA1PR11MB64189E004C5E4540888278B0C1D22@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ2PR11MB7504:EE_
x-ms-office365-filtering-correlation-id: a04ea91c-4ef4-4035-948a-08def3c5912f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|921020|38070700021;
x-microsoft-antispam-message-info: GN1qjP0UZmlnHQCaUdXFTGABTEz+UpvAloma/a6qfFH7t+gD4B0VbVyq2WztAC3RfSsOMFRTpNE6ZSVxx0XbF9xE6vXdyMUZ2Bvo+zpDwD9UwJ9YRppV8DlgNPJbNIy31+/d7++yUWHduIkazhM9BGRcz/+B/0OT/LSkhkV5cUrLEG7BCw04yT1MqivCFtR+xGvzUbyUZDLMX0r80sYIwdgfm1nIf8ZSi88srCPH1kwibFoI3Iai3YSVgW5Ji1iAOOdJhlIGB2KqHyuLBNndIkQ1vBpNd7ooO0gpDhS/390PnyaCW6MCRVDjsa99CdGQbNZtA0RQYa5QTA0f3Qzr71HrycyfF62yKw3ZHPbfGQwiUzgmO7jtoPXKIdLs85sNXkcYITEt8uHbBsBlTBQOFvmtf+WwzLdLRxsevB6ROnSmYl5qNI/2JJ+g3vaCJH8t20kCM+hBBydpsBgX5MPpBjri3MoxUehV/fsbl8Oakjxf5ORDj/8Sem6qRxpKpJ5yWy9Wf8NZHZmOwnGCGCiH0mvExgvRQA6FFe7scXk/7mE/Fw+ugwnS8yssC2Y/jw3+IuTCFqxZRfp3Uxohlwh0CmaC+jioDse+yhy3DkzYAQ9U5J/Y1TMzZBspW/sgqGpvJfrP5JI1vX/Q89+rifHMAogxq5niPZAwLVPp+O6QDQWUT14k+zs0XxMc3XWn8KLEfdsIy82SZwrYE9Y4UjRK7f9iHBxldOCYgEQtqwduRESuNUNZ5MkAHtZInhOYmJ7Y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JcNfVZL3cI+HTl5ZySDrZCR1UAlW92hkAvgFERD8NOeWY6/ca4M+3We0w35c?=
 =?us-ascii?Q?jiviWA0xLOdGgVmouPye9DkhbpiWRvIynQXTfawvI9oZB6jGCkXUf6TQEbvv?=
 =?us-ascii?Q?NG9CPzOWmbzBttYptwTjf/e+1wgkuzAG23sm2x1o1aqh9h+VVAGJ/gtXfn3D?=
 =?us-ascii?Q?Xv6tuS6orv3Xkd7sKZZnGbktz27nhEv4red4Da0zUSgSPtlEp8nJ4+b+Sebo?=
 =?us-ascii?Q?DowL4gID9rdibcWANaXhHuPRYAnTH5rLJ1nUQ9BPTqkX/H450X/JSFYEOGXW?=
 =?us-ascii?Q?+DN2T8fOIM3Lk6j5hKQ7yLEJY+Vm1j4qMKdfDCpyGoxE2v45COxL1SNGmk7P?=
 =?us-ascii?Q?8fOhu0idJmlvLlC+W0O1oIHJMrJ7r2pRXo7FtkwGxe8G1TFIvWAbwzUmpNIO?=
 =?us-ascii?Q?rJZs2JSLoqeCwKXT1btdt5inea+CdKY1OHMGjDge2c+NVueFYsDAeUFflUgJ?=
 =?us-ascii?Q?j2tg5Z6pmjT3YKtZ2G/hwbOfG3UAGWStnLHQkzJy5tN1rtP9oocrRrvmXiRY?=
 =?us-ascii?Q?crTYtnIm6QSSAtqFd5Nq54dfZZDlhpsplYlURaNmGQBdNasfjUKpQV6nl1BT?=
 =?us-ascii?Q?fzA+qJnurxOcLooUF+AXKPxjDpf+KQLPtL+LREzMqQ4hDDFoCGfNcNIhkCML?=
 =?us-ascii?Q?aLPOGh3RZySbHu38ee1m01Y8O3ToMdO8CxmHJp6d11fLKSYGkbxMVMWZyHkB?=
 =?us-ascii?Q?T3aTn7luk11VALS0oyqkG2jJD8j8Y24PZGahHbJRzGPnNMk+jZmt+n2NSm0e?=
 =?us-ascii?Q?JJghlvWisQwawIBf6Kzxf04EYTBghH/CVr9pEo2fq+cPlfj4TuM1o0N3jzUv?=
 =?us-ascii?Q?z5ZDKIGN3FXx3i+KIVsiQZE6yvzxbN5lG1byRtNO5Lo9xAfcf175pBkAbDZH?=
 =?us-ascii?Q?PcbXjzqFwXUf2IUhiQpNbkGo1YyRPzWATg4x0UcBnSmYY+MyHlyRqYDJqI8T?=
 =?us-ascii?Q?AMRd0Exv9KeH9DrIJVv1W2wkWWyQkkUraGI+srBQpHqk1J5KivHLeir3LYPJ?=
 =?us-ascii?Q?yNEy2d/nPN1BKP5hkyKz2esThbKCVpNfmCOyQqNyx3ZQ5S6DomUVRKgTC8pI?=
 =?us-ascii?Q?XOV3LSbQm3F/n3Ai14WnIcGpCm7vVO3TuXMgtAAe9meSSBB2EKJ44Bu3UKyW?=
 =?us-ascii?Q?HUVxC6g4rPYh8dk9LIhURSEc5y5Y57Lj/c88Z6sCCeApgVU+EgpP3KxFPADA?=
 =?us-ascii?Q?MmbA7qDBNrNNfX1ES6tblj1bWm8w1e/GsV/8PZO0ybKLcyHFhx+BNQgWBdsz?=
 =?us-ascii?Q?FapjhvWS4lvghKCzRV6mRQRIkHQlclbVdFTUGvXAMyub2hy3gSEc70dhGxIq?=
 =?us-ascii?Q?K2RvhPimbPUVNYbbsj80T0BAYkVbk6tF/Vj46Z0Qei67gx4u+//B+CMFn2CG?=
 =?us-ascii?Q?JoYgMt9SZHpeugAscXubz6ZOg4b4gItJmgxIrtry1G460cDaBrQWW4pSt3T9?=
 =?us-ascii?Q?hMHu4mrLH0zSVG8MNxShmgI/ctwnTqLxvm9SdptWPw1Od1lS1rT58LKGGijO?=
 =?us-ascii?Q?1ppG1jrqvGEpKoP1TWr5d56+ea8PUK6h6YSuTyJhGV3ZxjilMQZhiP7S4bSR?=
 =?us-ascii?Q?H8d2tBMjbMuk+jgp4I5k66K9yEf8xqxpVSZ1RxiLeIJbIVe4JC+y7emBdEWo?=
 =?us-ascii?Q?ExtkfVjsQkDUHsFYRjexWoatkAsLLN1ylGMtkToG3SeHr9s2zRlzq+Tf+kZ0?=
 =?us-ascii?Q?veV8p3J2Fjw9FWGuzJ5J0nD1lAy1T1k7s65glgk3aMe0cDl9tRHr0Xq0aHzD?=
 =?us-ascii?Q?y8H0Jawkgg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: au8wwbZkKnDUCzg6kQwsM76EXhPVNPnP2WS2moVOPrY/23psWlIeqOg0O53MIJ2vC9M/jWAiM116hdXptFZ8Jf4yi2/p3pbfgjguZcmRVcQhmfOD71v++BEFCkodePr1qYXK0QhEsuImTPiAAcE5TQgXtH3uoZO+O4fTuz6OWIWPJNwjz2TZca1WyEpKlb/G/ba6xHBG8GLdA4PbVaOfrsPMolCV4pNMFwtRdDAa7A0/GnPgitH6t70EGXT/7JOSUarC2KLOvPVhp8mOXX/t2DPAWFi4uB9QyykYw59+wlKE1WHfYVcOe3Gxw2zkthZIdtrdAZ7dcBIJs2j1N28Oug==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04ea91c-4ef4-4035-948a-08def3c5912f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 14:18:20.2864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LW62c0rYY+MYAfo3itoD2CUoSBFvnib2pp9uCZjC6BPCAHPixJoDmldhoMeN/ZHF8U0Hg4MS0yECqdgO8k2uJTtbkVaw2rA79hGI/vmXlFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Micha=
el
>J. Ruhl
>Sent: Thursday, August 6, 2026 9:58 AM
>To: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>thomas.hellstrom@linux.intel.com; airlied@gmail.com; simona@ffwll.ch;
>david.e.box@linux.intel.com; Vijay, Anoop C <anoop.c.vijay@intel.com>;
>Nilawar, Badal <badal.nilawar@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>; Ausmus, James <james.ausmus@intel.com>
>Subject: [PATCH 0/7] Crescent Island PMT support
>
>The Crescent Island (CRI) GPU supports PMT via Xe driver
>registration.
>
>The CRI PMT MMIO mapping is shared for each PMT feature and it is
>necessary to set an index register value to access the correct memory
>space.
>
>The PMT driver has a callback infrastructure to access data areas with
>driver specific access. It is does not support the PMT control access.
>
>CRI discovery/control spaces are part of the access window so a driver
>callback is necessary to allow for the correct window to be exposed.
>
>Add control path callback support to the PMT driver.
>
>Add CRI PMT discovery information.
>
>Update the Xe driver to support the CRI PMT access.
>
>The crashlog access needs to be done with power enabled (telem is only
>available when the device is powered).
>
>Determine which access is requested, and do the appropriate power
>request.
>
>CRI FW is loaded at device power.  Support the late-binding API to
>wait for FW readiness. (pending sysctl patch set implements the API).

This patch set provides the SYSCTRL API used in this patch set:

[PATCH v6 0/2] drm/xe/sysctrl: Add helper to query application status

M

>Michael J. Ruhl (7):
>  platform/x86/intel/pmt: complete pcidev to device update
>  platform/x86/intel/pmt: Add register access callbacks
>  drm/xe/vsec: Use correct pm state get
>  drm/xe/vsec: Support Crescent Island PMT
>  drm/xe/vsec: Crescent Island PMT decode
>  drm/xe/vsec: Crescent Island PMT callbacks
>  drm/xe/vsec: support late bind fw information
>
> drivers/gpu/drm/xe/regs/xe_pmt.h           |   5 +
> drivers/gpu/drm/xe/xe_device.c             |   4 +-
> drivers/gpu/drm/xe/xe_device_types.h       |   4 +
> drivers/gpu/drm/xe/xe_vsec.c               | 417 +++++++++++++++++++--
> drivers/gpu/drm/xe/xe_vsec.h               |   2 +-
> drivers/platform/x86/intel/pmt/class.c     |   5 +-
> drivers/platform/x86/intel/pmt/class.h     |   3 +-
> drivers/platform/x86/intel/pmt/crashlog.c  |  39 +-
> drivers/platform/x86/intel/pmt/discovery.c |   2 +-
> include/linux/intel_vsec.h                 |  12 +
> 10 files changed, 448 insertions(+), 45 deletions(-)
>
>--
>2.43.0

