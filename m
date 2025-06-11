Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5725F7B7
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641500; cv=fail; b=dNtneB8RrDAN0TZ8iaJ297RzdEGARkr1nZuPskz79GuUpDyLEDIuWiLlXrB29o+LVR6wUDCkis06pzT6QgKdzzpPaGJ+SO2qFsfLr3s3YOvC5aOIf5bacTJv9Vd27E741s3RySO7Y/Md9030+sWFHX6Fr/PYRA7/4+IC62wl9Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641500; c=relaxed/simple;
	bh=iQnoMzmknu0MvXo7jcyOzJKlb7KW5Phqw36sC9xheYc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sm2flnglFRbcjkSZ2Ep2CA6mmdYHa5mPp3aLoRCgcBp+4D6L9REOpiuQow2nTe1CF6d+inU0VoLCacFSlkybIphijO80JPjZx8mZNcRot+gR96owIGA/INCXWq/8u7Yew9FhQ7oRokFLXSTNGlONpNYqy+sUj0P1Zq9lx9lyOwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkOYLlqF; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkOYLlqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749641499; x=1781177499;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iQnoMzmknu0MvXo7jcyOzJKlb7KW5Phqw36sC9xheYc=;
  b=kkOYLlqFvNbuPrJpgTgQrnEwMOZXknGvFvwSPnyKyw6jmfWdaMi+m/6S
   ishN4Uc6l41p2Q2omuW0d82/WRSALoIzA+FXEy3hQCYI6j9JxK7oloMCq
   dwq07JC/6fn8oUX/7HJSf/jTzgWQ0on8SL++UHtxry/jZI9X/6nxJJxAP
   aOK/Zk6R3RpOMGO//y8wsA/4Vo8pXS9aKtZ9GY0zh+8Q6EWisXRFzyLj/
   omD6ELHXC3uZjKuLS6FBNR6M0FOPPt7RG3iiRcYtR63vjznIcIQTyYL0X
   1wQdvD1cDpcx7RErAN+u79CYfHvjbeZwpROToBKF2nUx3JtRmp6hCrBzj
   w==;
X-CSE-ConnectionGUID: Cfx1kzyPQC6cUKC4K+fagg==
X-CSE-MsgGUID: src2cXPNRHSqRrCSr2I3jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51492947"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51492947"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:31:35 -0700
X-CSE-ConnectionGUID: +QG5pUlSTmy4EgJdyZIHOA==
X-CSE-MsgGUID: caumV4bWRxmr6LETUdqFBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="152329177"
Received: from unknown (HELO ORSEDG901.ED.cps.intel.com) ([10.7.248.11])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:31:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 01:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYK713APqMZrW4iRp/dSo7RZ8rBgyPwtbbpEqz5Y5Dprv9Fe5owpenKPPGh58WXy/fC2b1lFIWFgKaNYwqXANVUV1RDgFr3giDtGkHni9Ck+N7/qPdP3luJvCDTmgXTojFSSfsoCn0ZMty3KYFCeOg3Y5CfgnYRXDA8MdCjCsof5AEKFjjqtCGT6gRJf1LzZhamRXC9w0L8iFD1AiN9CaOVFEFyVBWpw3ub9/q9wAAE1mLlm5tD3L1u0mVulyzIz/iQRMdN3/4a3RiIdWEe4oo+8KEczwrPTDhu3a7jFZatb3UI6EZTHBGsyL43aRLc485WEU5LA0rqogdhpEbtDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3mKqCh7qGsIv+AezLGso9NsUFaxrnuMDUOGc5N3umw=;
 b=CFbDJ7xvgNNCQnsOFaEbTghnMlPVtHMmr+4nXaTWubPcw4wujn25a4BUQruCzgbS27bCQq9dUjda0hpNUJ8GBUsBekJzPBFbSKStHu33cZwV41kj+AYh606HlRUGMU2AUMWgzzRMa/VD1gewVE/p9SxRZ8lVmrj09T63tV5xhC9wZUrWkOdhRFETwwgOtU8PPFMbkdOuwWHNMQqgLcsxDfd/9m4Zpjopkq6Y8B0xG3vbhU183YXpCjZEDnxNo/ODQso2uhF7bNSn20h7sV30kf68Ilc9kXYmcMKUOIZKj4/0JCMQgucH7CZMusGP2Lca0mKCXtxi8fH9eShQWqi8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 08:12:13 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 08:12:13 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
CC: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH v4 01/10] platform/x86/intel/pmt: fix a crashlog NULL
 pointer access
Thread-Topic: [PATCH v4 01/10] platform/x86/intel/pmt: fix a crashlog NULL
 pointer access
Thread-Index: AQHb2kx0mLF8GpMsak6NEEYLU1BYsbP9nEsQ
Date: Wed, 11 Jun 2025 08:12:13 +0000
Message-ID: <SJ1PR11MB62041EECFDDDC9DB89E94DED8175A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
 <20250610211225.1085901-2-michael.j.ruhl@intel.com>
In-Reply-To: <20250610211225.1085901-2-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB6268:EE_
x-ms-office365-filtering-correlation-id: 029fa4c3-e63d-44d5-be5e-08dda8bfac2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018|921020;
x-microsoft-antispam-message-info: =?us-ascii?Q?jzluKAzrc338q4s3k1AcMDmcz/0AGBI7R6ZTGVIMPsqUJdj4rrN0Yjj6Nmq/?=
 =?us-ascii?Q?L76VXg5d3XRMxdRif7HpUSh2bPM99CnJDGM0QNb9M1n96vhetVAXNwdR9g6j?=
 =?us-ascii?Q?W4W/B2K/LOH50tOOTjUIO359ylLoQrA/o1zMmM37lU7RELdSoDNfr814VJAm?=
 =?us-ascii?Q?dAy464PPRCrTg4Ob/GWARxlvrgYeGlr2jRgtieMAkfBA6kjia+zdvnWaDkFa?=
 =?us-ascii?Q?E1kPaVUBNrQSWkGeOmL+bhOX49oX1uuMAbzYcfeyeGehjspx+X7uFkoOV962?=
 =?us-ascii?Q?RM8LJe9tLhrZZZbYYpxrzvryavuKbecPsZuschwEdKkxZIY2FmZmeDwUxhnb?=
 =?us-ascii?Q?CmVDRehgOc7J+I/9/PCVJMtTU+8w7NgfgmUgQW2fokDERSSmbIdFT63YqNp3?=
 =?us-ascii?Q?9YdspA+9Pnn7RmlgumSVg0dZlCD0YtLtTrPU8JiUUb3JCSHZmInqLoxi75uk?=
 =?us-ascii?Q?kNitP5nOq2/F/+YP6ucXM+hjpV5CTbVLSjSjLVqencVRNDZZ0Vwzgtk2fndp?=
 =?us-ascii?Q?1iHkYWiCcjYRnuROdYh4UgmK67Qgpt9DQvucMdUgWV+jn7mm4FHTpy17BW50?=
 =?us-ascii?Q?z8DBbpPPJNT8MlGZHtOezPRO5lRc10HIREPqovIns+Dgb5kRGIi9ljyJSlWt?=
 =?us-ascii?Q?rDbZWlzIYErGsMR7ZVQ/KSKzCNKkNzuoM+MnaMmo/uiNMbBqsw10mYwNQs/R?=
 =?us-ascii?Q?2R7frd2QkiMup1bdTor68PmD1mpoQFQYeA6aujJm/rVXKM56EwKsn+VKgjjo?=
 =?us-ascii?Q?XxML3cIgiEe/dL3lhj82WH8z2riWOHpp/4dQu8irJbzuYPC3I22CPmEzjxxr?=
 =?us-ascii?Q?c0vdGzIe9VZqQ/RUz60pg4ZEn+mQZWCmc1uYA/uUq6B9cLT5Puh+gDYMClbd?=
 =?us-ascii?Q?EeH0p26CpTum14RZx2gjVsmrN5AO9o0aPMVG/UhUq9+v1dUsxy5E/f2V5ssk?=
 =?us-ascii?Q?ERhKyqGbLfKbXJUOB2YLKPFxbWtuHErTeFWmhM/J2D4OzuukCnoJ6aFbgJNa?=
 =?us-ascii?Q?KQJUiLevCh/RqBYyclDrsx65j+f4cEAVK4RoxPv8sHGbeajL8noI8wXhA5XX?=
 =?us-ascii?Q?h/eoBaxpQ5OwKSn29x+t4/2voQ/bA5fzZ7hslOUsr5D5gq7tYeB7VrzhyHdf?=
 =?us-ascii?Q?8JEd5A/a2EbwuLND21pR95xC/3+23Ka5IVZMEdWVv0MBOXmFC33WFSr3GAIM?=
 =?us-ascii?Q?rRcy5opD2JME9st0e1UgRETMJF4RYjKipuWGqYS3lk+Y+gVHpLBXLmuGjh2I?=
 =?us-ascii?Q?UOnqDjw4lJqtPVfaNvjNgAD9MGviJKXx7agQcPfa8/72GHMd+MoHie4fJrqp?=
 =?us-ascii?Q?6favPCGBPUOWy0o7+WRuIzIC0DHDucONSLHAXtra5Kr7I+7mts4LfEdaaRyB?=
 =?us-ascii?Q?P2b2RGHG3PyprK/iKR1HLQdxf+F6YHb6+ItxUN6pAUGz6Yo3+BpKO2q8kxjy?=
 =?us-ascii?Q?uv7r93QKPOYINbzGNhlbwPqPJfkrnlMYQcFnDuB5QjfJ3pCF5PMvxR6gMb2B?=
 =?us-ascii?Q?7nszYpTOh0ilano=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6204.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r56NiWyjbaT9uuZj7KzlhRsF57dAOnaJyLjiw3NySyOD4XMDfII87Ics+70G?=
 =?us-ascii?Q?ZxrgIlmH5pLZEW8QngjVRbxCVUZUeh26k8PYFKRGxwMAFKli1w+g9UqW5D5d?=
 =?us-ascii?Q?63mGMIALqCsD/vMGRsGbQ8CtnloAqaoa9YmF4QdIGHm0s6V8X7SLePczYiGW?=
 =?us-ascii?Q?WmbCborlzEHubBaqHuqh79MX5RxrAGLJbJZWSW2gnqGa5aOE+co4hfYvJo2W?=
 =?us-ascii?Q?8FtnP0UEcW6nt6C+qDjlqEAN0+cqLhspeqD1OuwdMzTAALtTvlsccRRqJIl4?=
 =?us-ascii?Q?c/AjruDoCUVG40UFpXCQ0WQdJeP7jSX+gzFiz5N1K89wL9TVVGF90ilbZy6/?=
 =?us-ascii?Q?mRv2+PMys+YnZVXUw1mSpMOPb4rBktsxScRpV95A7yhmdsUDJ7N7K66RZHF0?=
 =?us-ascii?Q?I8konRI2VXqDJ+IBnLdrlM7LcfsJRI3AdWJQu10GKqhCBKnr9+ncyYtnuXT8?=
 =?us-ascii?Q?cfuEqKaw2IjRfQDgTDseCedcq3vZhuPmFOx+9stVtQDj6nadBVYZvCk1G8+M?=
 =?us-ascii?Q?R257qMhE/1y1QCr8HldANE2moTxIu9si006s1LrQD17r7iZY7UsG2svZQ3/c?=
 =?us-ascii?Q?2loOn+AjKzreyJopnueQw5Cq08rc800kg5HXBoTeiFC/UZL0B/Rl20Tavea3?=
 =?us-ascii?Q?g8KMtznEwqXhj/6i4pFRjDgVmWKpqV2W60TCaslxh3hKRp0cczdRFf2pH234?=
 =?us-ascii?Q?oAzmDnhH3kMmbo/CP0ksAR+8HG5hrxXlv6dXyIdUtFWP4cQjo01ypeuzJ2rp?=
 =?us-ascii?Q?RJR9QF1WatYi2AxcXVit0VCbvzTjdz3Y7DBchMHiTDESycWFtLR3jXpEfett?=
 =?us-ascii?Q?1RdAlJZ9gqpmXDpu17BMYm4Un4RotYp445Xa64zWdvhW7tpsnkIHd5lCpkxB?=
 =?us-ascii?Q?+VwcEnKF7vgH9faaciLju0I1qLPREZojt4tuDaEpOyX7AeUKDBm2xad9+xqT?=
 =?us-ascii?Q?oj+Gb/IyxQKaK0lQTDGjjaoYHjME8UA5wxI0pqvTCotwVg05LlB6G30wGsXT?=
 =?us-ascii?Q?bOny3y4LPoddND3d6wXgIlLreBP7ELvcxPwky7YKkmFwDsK4n9E91KKA1rwr?=
 =?us-ascii?Q?+mYCQMd18enJjBlOITng8Kxa+qKQufvShQFzl2geg0mHacResujH8OXabbTB?=
 =?us-ascii?Q?jLzgjmtwSUDEeohHX73xMHy1MI5SriQX3yPtfKJFp20klk6E7e4hAfzimREy?=
 =?us-ascii?Q?Zgq/hA3owhTTIuVWpi32ZOIZkMdoQzQ1WPtmRWQhYGz5VLr7K+DTclrjzHxC?=
 =?us-ascii?Q?MooTb7pVdpm9VLnn316akiTDpkPCWwT2+Q3r0OgRhT3b0OFjHbmLohP0ZWmw?=
 =?us-ascii?Q?q8WU842kx5bxm6poB15cOa1C4oUOGQrOCvD4vTc5ImjV6BipwvyRk3xzP2KP?=
 =?us-ascii?Q?mEMJurP8VZIRo8DEkyYGYXEsXfwHE8xbhJmGouTZAFa/Qcahl7fZ9BtG5byO?=
 =?us-ascii?Q?oGokvzVHPgGnEmRWjndJrvAg/n5EE17Zukx0MfA5PWFVmNKNh18tUXtq+y76?=
 =?us-ascii?Q?TaS8f0SbXjXhC340dwDG+g4qOqsZQmPvbT9gCVnJ8vVlPst2PtEfbprOtnec?=
 =?us-ascii?Q?590Ln5GQ3QnCYC9901Sk2zTo9VujP3uv4RkObJOg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029fa4c3-e63d-44d5-be5e-08dda8bfac2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 08:12:13.7116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3bVbaZhO/pf/bbZaK+BelRPhkzRzvno1u5eE6UL/RVogIETy2Nlau9czGmyyY6V4FblvQB7OXWS519VkovGqylgfC08WyezAHe0RlamSak4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Mich=
ael
> J. Ruhl
> Sent: 11 June 2025 02:42
> To: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
> hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> thomas.hellstrom@linux.intel.com; airlied@gmail.com; simona@ffwll.ch;
> david.e.box@linux.intel.com
> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>; stable@vger.kernel.org
> Subject: [PATCH v4 01/10] platform/x86/intel/pmt: fix a crashlog NULL poi=
nter
> access
>=20
> Usage of the intel_pmt_read() for binary sysfs, requires a pcidev.  The c=
urrent
> use of the endpoint value is only valid for telemetry endpoint usage.
>=20
> Without the ep, the crashlog usage causes the following NULL pointer
> exception:
>=20
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> Oops: Oops: 0000 [#1] SMP NOPTI
> RIP: 0010:intel_pmt_read+0x3b/0x70 [pmt_class]
> Code:
> Call Trace:
>  <TASK>
>  ? sysfs_kf_bin_read+0xc0/0xe0
>  kernfs_fop_read_iter+0xac/0x1a0
>  vfs_read+0x26d/0x350
>  ksys_read+0x6b/0xe0
>  __x64_sys_read+0x1d/0x30
>  x64_sys_call+0x1bc8/0x1d70
>  do_syscall_64+0x6d/0x110
>=20
> Augment the inte_pmt_entry to include the pcidev to allow for access to t=
he
> pcidev and avoid the NULL pointer exception.
>=20
> Fixes: 416eeb2e1fc7 ("platform/x86/intel/pmt: telemetry: Export API to re=
ad
> telemetry")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c | 3 ++-
> drivers/platform/x86/intel/pmt/class.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/class.c
> b/drivers/platform/x86/intel/pmt/class.c
> index 7233b654bbad..d046e8752173 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -97,7 +97,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  	if (count > entry->size - off)
>  		count =3D entry->size - off;
>=20
> -	count =3D pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry-
> >header.guid, buf,
> +	count =3D pmt_telem_read_mmio(entry->pcidev, entry->cb,
> +entry->header.guid, buf,
>  				    entry->base, off, count);
>=20
>  	return count;
> @@ -252,6 +252,7 @@ static int intel_pmt_populate_entry(struct
> intel_pmt_entry *entry,
>  		return -EINVAL;
>  	}
>=20
> +	entry->pcidev =3D pci_dev;

Change looks correct to me,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  	entry->guid =3D header->guid;
>  	entry->size =3D header->size;
>  	entry->cb =3D ivdev->priv_data;
> diff --git a/drivers/platform/x86/intel/pmt/class.h
> b/drivers/platform/x86/intel/pmt/class.h
> index b2006d57779d..f6ce80c4e051 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -39,6 +39,7 @@ struct intel_pmt_header {
>=20
>  struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
> +	struct pci_dev		*pcidev;
>  	struct intel_pmt_header	header;
>  	struct bin_attribute	pmt_bin_attr;
>  	struct kobject		*kobj;
> --
> 2.49.0

