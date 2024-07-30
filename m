Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044A187340
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342580; cv=fail; b=q9eKfHchMEK6Qz9cLbStJ+8jALnNYcs55gUdTAmEM/JJuFs8OY0Me26qFEdSNG+33JWsA5T1Gosb27NPUuJuKG7QF/GkM/o+TS+P6cd3Wmdd7XVy/N+Cbq3OZxQIlsFpwAafovlaJXUJltKTEjTz3ibNJK/KylE+Cex7vLUPmFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342580; c=relaxed/simple;
	bh=S5X36xPIERy2aTOcYD+z0HEwUYrHQ8ksKo8JsZ4f6t0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fu/rq3PI0GfCjvz44ASkxy7Wn2FoDKlXKhi3KhzhsmQMW93mvuXDE/85YFyQVDwv2JchZC7xinNiKzO5lda5HB8TyNVmFx8HWCPcllHZl7oGVsyS/rykEJbyrusjc2YBy4KmYsos7mXAv/CSfYF4DDdjdSgI0viwMX7XFujgS40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMw144+0; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMw144+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722342578; x=1753878578;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=S5X36xPIERy2aTOcYD+z0HEwUYrHQ8ksKo8JsZ4f6t0=;
  b=jMw144+0BnUbWlLddUCk51Zs47NXpjyy8ibzm4PCmV1kri1nAIVdtAMH
   fRN0VUCfvzRloQeD+XEoH5Xz4g9dWVrjNnGHvl1JjN2S+pimDfR9OnXSz
   B8CXXgk5Wl6XEJ9oyqQqG3QxK9yEIinb7+2/l1lH+vMuiPOv3MdW2t/s5
   EG0EM+wyrJ5BFpb7oRFwnu5JaDYC2suRVaWE7KyFHG1uRyhKKqbhOqep5
   NNU2BhWtpidzcCCNWdmO/lhFCJpxDMW50hMYCJKMbnJi/e5PywvndIPr9
   c5PlNfGXFpihFBQuGyayyYfKEQDGFgOjTZOZ19jr6FYI+OMuvlHbJeYI+
   g==;
X-CSE-ConnectionGUID: jBSJVU3iRS+wgN+KoMKPMw==
X-CSE-MsgGUID: P8ffaU16TC6BX79CzUFSOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="12787731"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="12787731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:29:37 -0700
X-CSE-ConnectionGUID: X1SfG+bVS8+PQrmEQyevsA==
X-CSE-MsgGUID: UOjtq9+7Riyib5dXb+QrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="59124223"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jul 2024 05:29:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 05:29:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 05:29:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 05:29:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Um5lZtaTzhumMNMHwpshJLyb7H09HJucF+yf3wmOdLWQWYk5ZDtwrS5/RekNL/4RlOmvC9FfIp6CpFcCoGOU5KTScxOlWsY5Z/jxN7ESWXVefkEQCoSZV0rOVuRM4GMLjpOSryGxKOwt/rnV3aEbplVbB4UCQyds+jdwBIEO0xIw4w/VJN49N1joeVig+/2uElxxTMgQvYcBmVP4EBCZ9rFVQXStKCGLa5J9ZsOHNqccyg9oi0hZy7yTlV/xNT2hxhcbleUr8WhIgKajuEoxI19sIpeahkGfimeJUT9N/yTXzTf0jVrR+4PIJnKnDTemq/J3JG9dkJYwe0On60bt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z82MIXZ7EV/zjLmag0hv8pJgXSyR9WiBVvfdiNPDNvM=;
 b=mafbTTmxQctCVMbEc+DmmG/H1sCKXXv/fuzvTUlmNB31ZYRMR/rLyCiwCaldgJmo3yBVudcXxbPuCYFMtQqj0gCH+G8PA6YZVg6A7wsbhyJPFTFouQU5se+hZlWjok9oOKObgMWC9uuXkRKHiCYtuMPbaSC+GwTWmSOJe4RWmOlp/9bA+BHoajl6K71G0aXhP/EGzISktNwX5I789Zi48lOiO1ZCNgjZSlfNGQ9ihWk5nUSQ2eriiXF6fGLk4A7hsgBkj2S3IGWFtOOttz/XqxClttlNqo97E9CV1z2nteK3suKV1hfYQGjLfzLh5WS5VpfOhYWl784HyA37pEIQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CY8PR11MB7729.namprd11.prod.outlook.com (2603:10b6:930:70::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 12:29:31 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 12:29:31 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
Thread-Topic: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
Thread-Index: AQHa3o2UzQ6Srp5sNkmojIJgnAERKrIPOwhw
Date: Tue, 30 Jul 2024 12:29:31 +0000
Message-ID: <IA1PR11MB6418A4F423C1D099EA5A2395C1B02@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
 <20240725122346.4063913-6-michael.j.ruhl@intel.com>
In-Reply-To: <20240725122346.4063913-6-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CY8PR11MB7729:EE_
x-ms-office365-filtering-correlation-id: 292a685e-b05e-4169-a92d-08dcb093436b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?lIiku8h5bg77Ly+LmLrOpjIw26dTBOE2oQkM4YZvlQB3C+NXqubDxN1QPPkj?=
 =?us-ascii?Q?0Y59I23Fq22CG82jVc7ijlMRPq0rAsRwta/zXtpy+UTnlcfXe2KfmoJWIDsG?=
 =?us-ascii?Q?a7rQd5Bf99YrGkLzWOTl6sxuexvbZv0SK7QysAElMk0X4zcoA1uqtVsoRahx?=
 =?us-ascii?Q?1icd0RYfln1llIrqDlLKPQeT3svtZmCF6wwnSK7Ce3KUkPcpLL9fdTF4UGHQ?=
 =?us-ascii?Q?0+fubi2OWPfd/EFqHdTZTmx94ujLX7nWt2j8Rn6EKBJOGqRLzlpULHq10NX/?=
 =?us-ascii?Q?mUTCGZlOEm2ea2nmDVQWZRD59c2E+rgn6NEo4y3dbb8XEsW5IP+csWGG4gAA?=
 =?us-ascii?Q?RswW0GoUbYASoQvHoAJa0mlbprKw5nMLip5fv1LMJMoJi/12ojpBfTTHsmoz?=
 =?us-ascii?Q?UYPoC5YCi4mYGNhz0PXJu54r9cQTy8hVxRLR2AzIFPgDa/njsodUPot1ZmDa?=
 =?us-ascii?Q?RbVwV1GQhFxYIzHe87TiM2AZ07rP/wCYc6s12iir8bUZRlp6rA0LvNR3DtG3?=
 =?us-ascii?Q?v9xW6JcQPXV4pKvvZJRfXrjxK6Adxm+Qn7gHC4lCZWUNh9fJxOgpycZoehMt?=
 =?us-ascii?Q?CX1eIxpReUhazVDDKRpw6UnNwpHq1cMaLl1mMVIVQiXPfmDOxPRzEOUKUjZl?=
 =?us-ascii?Q?hJT2mVSvoxc1ufbNYYT8UbvrUF56X0wQoTqGGHsO5Burby48STJZrZTX7cV2?=
 =?us-ascii?Q?obTkukOO+0LxuWaqzpdEskVoDGWdEudE6kzYrXVIOwsbbLqfliKVeZSdw711?=
 =?us-ascii?Q?fYHtHU7UJIgtI0INoz9F7fPU+EPqGHqdzz2aXOAZiqr+CCLh/UkYhTcGj8ng?=
 =?us-ascii?Q?rN3O/U8MX7FInV81S9M4PxTVeO2x5bl3HmGJfeQu/d0+d+GkFs02b7M4uKwr?=
 =?us-ascii?Q?wz8Cs9t7NH7XG2GRJmtX15OVjJpVbm7bpMR2bK+3O0r+EnW3lAMHa0TtgA3f?=
 =?us-ascii?Q?kphQEW4gUkng3oELdoTHZJcpdr7bWtdEPWSbhuSj392PWZFp/btBcotRfqRP?=
 =?us-ascii?Q?KyYe25LbaR7Wz4SgJ8Wvt39W6qndD9QNSKGlPcIHLvjSVCgRIjlZoIf2kTeg?=
 =?us-ascii?Q?HlYWPszMn7On71/DvfvNvdRyfKdJMi1xbtgX6bgClt/CKx/exZ8mCZ40J7xu?=
 =?us-ascii?Q?9kxQJZDz2nzsz55vxR25slOimPngMPZNGnpDDWtnfynEWe6pHnOtdN9cmUZA?=
 =?us-ascii?Q?TCshdNR3e3sKeADcDu0t6T5WqdjGHmy/fqEMabxCY9TFE64Cd5Od79moAv3w?=
 =?us-ascii?Q?YgSpqU+RTewtanSVkI4skfQBNv02x3jX1Up4YGMXLukwFqf0ss0BT5HHCI+I?=
 =?us-ascii?Q?aWVvmbsCfXPm5yt0ULzg6grkP9ta0bVzaHZXFGa7c7BGWYqjqYwaMXWW4KSy?=
 =?us-ascii?Q?YxqZXjT6wB2TotinR0cZrPG5seGY46NmLMbN0OwiPrAGtukxwg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KFX9KpYs3e5giApoKg9Dt7w/ZbOC0bnptPlfAmKo81UqkaLHyqZf7QuqRvB5?=
 =?us-ascii?Q?2h18UZBdJnI+e6/5evC2ohKJChVrrOZxjNc3ONqkJOKWYbwkxN4/pqhqnJUu?=
 =?us-ascii?Q?GpoDH4Z4HaG48FtzxDuae5sM57+e0Tj6u4/rbUO3XZXoNQXANTSzexVZ/nLg?=
 =?us-ascii?Q?ws1SF2bD3tl07iskzQn6huMntBAqc0p417WA2ojvV5kZlfZW7mtJjBebfyj1?=
 =?us-ascii?Q?FEHTMiXj37dRdjkFhk9/z7j/Hukf3bdl/3Qm9BqsE4ZwttVraXkIYob7sxVU?=
 =?us-ascii?Q?yZx9L0D+JJ+bz/tIoB1pLMnQFCaa2KP5RxTnTFSoE55ZQUK/KV6d8JVrNbHe?=
 =?us-ascii?Q?i8wI8Qat5hALJan/+nevuWvNBw1uiNYfyD6xgvSDTB7qWXD+LI1BGBdiKDQT?=
 =?us-ascii?Q?ux0+bJGdmvN1wsWlv+VF54aKHWhtEBBgkmL/cQARBblqnmzCLXRJPZkbcjM8?=
 =?us-ascii?Q?s3Jujv0mzpzBuu2cl8hmhpM/2bn8cRNSVYIkUCz/BmOTR+3CDMlU6r+KIph8?=
 =?us-ascii?Q?Q0Abj9i51Xpob2tRr5KjKoJSTwkZwHi0qD8/u22O225pSNgt2YQtwm2YMRLm?=
 =?us-ascii?Q?mEbCjiX3qSLAmoL5k9XIwaTi3pDohJm+6vITbuajsnDttAYGH+76bp7ITVk2?=
 =?us-ascii?Q?TBtBv86lft5kmcZ8VxV4uYKSgMJbtwQkDsn+K/vQaujYybfZX83IoAcLH9Zu?=
 =?us-ascii?Q?dE/aim1/Dgzs4hKoW5cW5wyLBp3MNYAUGFBOdtKhW417tSjt93mt0TPEZnE6?=
 =?us-ascii?Q?ecRbc23H/UXw0vdbjMH/IEmPq61sBAv7KYmCaGzJYdQP5G36Kc0eNWeNOPem?=
 =?us-ascii?Q?Hv+eD0uB/6L8jb+F9KaY+UNCYORjgyXV0dsomwzjFFwitpGke4QJmnesXa3O?=
 =?us-ascii?Q?tHCbRumWt3MGIpRSsV+iopgjdKN8mwgvUErZNHeho5rOWRq+Laz629oCap4n?=
 =?us-ascii?Q?c/phIaMSiqtgpv+bIV4i0ZdYSRI1q4r+cfIfljh9Wd6lTN71WbnLNazmliYc?=
 =?us-ascii?Q?T4kebkxRnYGfZstRnA5pQFvD1iLnn0AFFjgWZJ63Qykd5sETHH8XPhFmCwcW?=
 =?us-ascii?Q?323Oj+zj4/BPejek6MTskDaqdAfdg+LCN7yhrtWw+njUBGbi1HIiTwL8brTj?=
 =?us-ascii?Q?r2BIkjyE8rnvt7l6RZr/Kz0Nk3CzoJMfRZA+f/r4C3ctaaRSh1wkv7X25lUL?=
 =?us-ascii?Q?XxgWo3I/XJOlxaWw8U+NFlirGOYxUjUxYD8T8eoFThTckOfIOyTap0/3Vi/O?=
 =?us-ascii?Q?WEIoqDINexvbVvVCbRkBUw7z5slSD8UuDlE2LVq6p07QoMcB1SrUQPzv9sms?=
 =?us-ascii?Q?9vz4Js5dEBRKrRJQlGi1yZv4r5QQpUM5UFYlArZZiyYXgcxpbIyxTpDccpYF?=
 =?us-ascii?Q?W7gDfRVwe3e7U9o9WtLsVF+qetwolBJq6ZuxORCxsjvb6qsIKXhh7aLj/OJP?=
 =?us-ascii?Q?ZYR7L7dSXp9WED0QHsBaEu0DP2fF1QZ2MJyrfIX+sSeVB5Gt4cq/JQncyj19?=
 =?us-ascii?Q?/6BEq1E+VADs3okZ1+PsZlTaryNRm2bZsNLApueg2AbEzGG5xMeSMqkhxpRD?=
 =?us-ascii?Q?nqX7mSmMSh+fnhv0y4a+Yw17gmeUK9pf+xYYD0GK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 292a685e-b05e-4169-a92d-08dcb093436b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 12:29:31.7560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5LO6wCUdi0GLEBfFt4DPp6wjsBb88WWKYx00EeV5uXNddJ6GQoNrsnz28C7rLIFeJN3cSkCR/McMfpiwulSvm5uJWxuHEBVk1MT3uqjQdLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Sent: Thursday, July 25, 2024 8:24 AM
>To: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
>david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; andriy.shevchenko@linux.intel.com
>Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
>adjust
>
>DVSEC offsets are based on the endpoint BAR.  If an endpoint is
>not available allow the offset information to be adjusted by the
>parent driver.

Hello,

Any further comments or questions WRT this patch?

Thanks,

M

>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
> drivers/platform/x86/intel/pmt/class.h     | 1 +
> drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
> drivers/platform/x86/intel/vsec.c          | 1 +
> include/linux/intel_vsec.h                 | 3 +++
> 4 files changed, 14 insertions(+)
>
>diff --git a/drivers/platform/x86/intel/pmt/class.h
>b/drivers/platform/x86/intel/pmt/class.h
>index a267ac964423..984cd40ee814 100644
>--- a/drivers/platform/x86/intel/pmt/class.h
>+++ b/drivers/platform/x86/intel/pmt/class.h
>@@ -46,6 +46,7 @@ struct intel_pmt_entry {
> 	void __iomem		*base;
> 	struct pmt_callbacks	*cb;
> 	unsigned long		base_addr;
>+	s32			base_adjust;
> 	size_t			size;
> 	u32			guid;
> 	int			devid;
>diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
>b/drivers/platform/x86/intel/pmt/telemetry.c
>index c9feac859e57..88e4f1315097 100644
>--- a/drivers/platform/x86/intel/pmt/telemetry.c
>+++ b/drivers/platform/x86/intel/pmt/telemetry.c
>@@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct
>intel_pmt_entry *entry,
> 	header->access_type =3D TELEM_ACCESS(readl(disc_table));
> 	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
> 	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
>+	if (entry->base_adjust) {
>+		u32 new_base =3D header->base_offset + entry->base_adjust;
>+
>+		dev_dbg(dev, "Adjusting base offset from 0x%x to 0x%x\n",
>+			header->base_offset, new_base);
>+		header->base_offset =3D new_base;
>+	}
>
> 	/* Size is measured in DWORDS, but accessor returns bytes */
> 	header->size =3D TELEM_SIZE(readl(disc_table));
>@@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_device
>*auxdev, const struct auxilia
> 	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
> 		struct intel_pmt_entry *entry =3D &priv->entry[priv-
>>num_entries];
>
>+		entry->base_adjust =3D intel_vsec_dev->base_adjust;
>+
> 		mutex_lock(&ep_lock);
> 		ret =3D intel_pmt_dev_create(entry, &pmt_telem_ns,
>intel_vsec_dev, i);
> 		mutex_unlock(&ep_lock);
>diff --git a/drivers/platform/x86/intel/vsec.c
>b/drivers/platform/x86/intel/vsec.c
>index 7b5cc9993974..be079d62a7bc 100644
>--- a/drivers/platform/x86/intel/vsec.c
>+++ b/drivers/platform/x86/intel/vsec.c
>@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev,
>struct intel_vsec_header *he
> 	intel_vsec_dev->num_resources =3D header->num_entries;
> 	intel_vsec_dev->quirks =3D info->quirks;
> 	intel_vsec_dev->base_addr =3D info->base_addr;
>+	intel_vsec_dev->base_adjust =3D info->base_adjust;
> 	intel_vsec_dev->priv_data =3D info->priv_data;
>
> 	if (header->id =3D=3D VSEC_ID_SDSI)
>diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
>index 11ee185566c3..75d17fa10d05 100644
>--- a/include/linux/intel_vsec.h
>+++ b/include/linux/intel_vsec.h
>@@ -88,6 +88,7 @@ struct pmt_callbacks {
>  * @caps:      bitmask of PMT capabilities for the given headers
>  * @quirks:    bitmask of VSEC device quirks
>  * @base_addr: allow a base address to be specified (rather than derived)
>+ * @base_adjust: allow adjustment to base offset information
>  */
> struct intel_vsec_platform_info {
> 	struct device *parent;
>@@ -96,6 +97,7 @@ struct intel_vsec_platform_info {
> 	unsigned long caps;
> 	unsigned long quirks;
> 	u64 base_addr;
>+	s32 base_adjust;
> };
>
> /**
>@@ -121,6 +123,7 @@ struct intel_vsec_device {
> 	size_t priv_data_size;
> 	unsigned long quirks;
> 	u64 base_addr;
>+	s32 base_adjust;
> };
>
> int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>--
>2.44.0

