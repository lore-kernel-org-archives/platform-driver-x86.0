Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C671C19D097
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721141025; cv=fail; b=vCoO3huPKwCcLRTYrgititne9zOyl/Nan61yOj0bojAg7xjwaQnq35ITZefx50B2th7aTZcflk+hryEYGNIiK6C8/Q6EU/ME9efXz45LQF/t9iSgPm0SIw8lVgW9G9O7CIhfTKSaJRaALmAUHjpxOXKnaQnwA3Jk9lh3SLL1s8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721141025; c=relaxed/simple;
	bh=vPoCc0lpQJ9T2ML1yaj+SnC0I+PbIbUG1eIFmP3tBuc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=utaS+8xa8fUEtfTiebRaKxdB1Ge/nSVd1Y9zgfIrz0iHvm95qJaLuAlL6OXtOgetDV9LG2plwlvZm6T38t4Ct3PTx8zUgefqqytAMZUm8+vI3SGt55bpXjTiPCn/cbKh1NQFmtFMvz8M2P7LSDymu4Gr755yi1AgXnapjSwLwvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ToNgRs27; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ToNgRs27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721141023; x=1752677023;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vPoCc0lpQJ9T2ML1yaj+SnC0I+PbIbUG1eIFmP3tBuc=;
  b=ToNgRs27eyNdqP+BsKxH/U4QkuZ+jMvGU90X6Y57K3frDlcwRu5Odyye
   BDk9u6NhRnImLU+JrYFwVGTPztqd89tbseWO40oPHwYKq67QQeK8UWZ7t
   Oq5Z391hBlv+7xCO/nVp8IQ8OmzB8rnhQ/gtJnKa1hZ5XH9P5vSuoJPOg
   dyWeL90emDsfJ+kdN/AKPRTKVe7rAd4y0zCHoGKHR0FruPBrJDMRiggCP
   IXZFVrWKGZT7nrSlHMrEjOAWD/qqXoTd9be3eWlgrFea5RILiMGbIrpgC
   N824dPGhoFdFADUUzXKfp4i7T/G6lNWd6dYtYXG4hkdjJ1bhC+0cZwAtN
   A==;
X-CSE-ConnectionGUID: icR9kE2kStajq/p65WheTA==
X-CSE-MsgGUID: +SsBgbnnRgehPmo28JT8Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22346954"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="22346954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 07:43:37 -0700
X-CSE-ConnectionGUID: sfGnvENHQcm08QS620tCwg==
X-CSE-MsgGUID: uZ6xjxBxTe2n7NKSBgRXwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="87546237"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Jul 2024 07:43:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 07:43:36 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 07:43:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 07:43:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 07:43:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKogYy8sYlcri5eFSwwk3p3Hr9EU5YzUMs+AkujRUUpH0OMaHxreUwhE3w2bMe0/TfyNy1I7fwNLnN4xBhdkWKCtSvUJUMZ2ZIyMme+vAPr/OM/7DS1C+kb+GoBFCg5lY6PRJojG6cIYr4zWeR2whIradAPAsFQCMUnLTLc7ifvZqWLgIaphRSmuRe6eQRaY+hvEEqSKb5ucpMNctKELrzK0EzZryphRsfclYcVwFT5qqPLltCgpgT7+0Gt6LvfsQrNfvhpL45HBVb/HIYJEsDgZJFb8YsTB2MvAaESsLm82w1q0InuZupsrb5JPKRUNZHSWII1IDbDBnLI1/gfvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnNmDbo6lV6LTWKMkrlLoGzOjP8zxQCP0lsC0O0zeik=;
 b=R4a53iRvVeAU4gN+fIHR1i7zUhNtjx0MDMcVQc5i6p92zs/SoE4I3LS0niXIwcpFxhXhJ02RUDiJw7BkM/+dAZSRI/vqiucRkhACEy0zS/pKi+dYoFLqoCin1rP99IJ4ZOjiErgURsvSBi61iCpRfQfwC1pP9Q9r9TWz2pyIOHR0sdna/J1oywkbE0Evf+xC03na+v796y/kWytVeDcAMk5q4/Qoe4QDiX1CRD5g9owY0vUgv/1UQaI9IIjSbxh5f58MpntxK0Lny3eGpW+x1jgSjpyvJ2L55AZwp/TtLPlUWly4hZDMH21UFPjU+WrBpoyxXObJHUFUT0aBUMa5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 14:43:31 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.7762.025; Tue, 16 Jul 2024
 14:43:31 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Brost, Matthew"
	<matthew.brost@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v7 3/6] platform/x86/intel/pmt: Use PMT callbacks
Thread-Topic: [PATCH v7 3/6] platform/x86/intel/pmt: Use PMT callbacks
Thread-Index: AQHa1uAxU1Y9Vjie1UeIfOYej3wtubH5Kj8AgABE5zA=
Date: Tue, 16 Jul 2024 14:43:31 +0000
Message-ID: <IA1PR11MB641878BDA58B92AFAFD90784C1A22@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
 <20240715175452.4010751-4-michael.j.ruhl@intel.com>
 <c2056a69-35a0-49ba-8267-1f03e3d9ed26@linux.intel.com>
In-Reply-To: <c2056a69-35a0-49ba-8267-1f03e3d9ed26@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA2PR11MB4907:EE_
x-ms-office365-filtering-correlation-id: 8c7d226a-29b8-41fa-edd6-08dca5a5a9d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?eTPygFs898YgXH0kPaPylMdtYczNv5o+QEcmls575XETdytV+t7uSU5HaQ?=
 =?iso-8859-1?Q?DfNLyTCR9gbWIGuE7D+S97D8ebig/JtSpy2i5RRNBjw6j7UMwBVwPUc8qK?=
 =?iso-8859-1?Q?XD/eMeScFLx1vhLSnkab1pLlxCWrMlp0oeGHQB8ARohFl5+K3A9L7zj3hn?=
 =?iso-8859-1?Q?axO9m7COsZ6cKPqGHk862uHLlTI5EanX76molEhZo7Pn9U6/3cEhyqSOpD?=
 =?iso-8859-1?Q?5vaFmkWhrmuTQJt6nRffBEP8ybSdFZMEXd5ZyhTEYtKowq9FZmDRjP1dPo?=
 =?iso-8859-1?Q?zd+dEqT2jQxmyPozL/RJu7ZTm67Qo92TgP2ZXnLC3L3li7BfoIWPLIpPO1?=
 =?iso-8859-1?Q?2bGEreF0nza++VHZveUyQ9y/E63RSiQZzbL/gaOK71RkA7/hNByqHgQjvc?=
 =?iso-8859-1?Q?H5Ou6W5iQHnyFB1AKhCxPj+xGXB8dViw33cQKtFcmljWR1pSoRMMIhInGP?=
 =?iso-8859-1?Q?p50whUJqNP9PrZc0D+BPMS9BeTdttp0RckXUYS/fL+WTXvVZDOqZ0nLb93?=
 =?iso-8859-1?Q?PxAXDQRVVznVQ76l0FWgmy257KeNe38b4dh2qtsAY8JTu9WhNaKeNq9FMY?=
 =?iso-8859-1?Q?eqFiRWtRiHDrurXs2HEgqsA6DGqwxB74gacXgdMpGH0RD/kMlJQ591LAFS?=
 =?iso-8859-1?Q?wJ2bAIJzW/gKl6bBMSiTqH5ScO8rkWy7NAn90Y3Pw+sgn4boDffJojLTc1?=
 =?iso-8859-1?Q?VBxOMqjCbxXh70AahTqXa/SUFgrAqPUe6LsjwQtfweeGZVOnC8JcDuNxjr?=
 =?iso-8859-1?Q?qfDqg6KDLAa/BRwMEC4r5hnV33b2Z28RXlOsBhDKWPjF1x72O+SDVd9jP4?=
 =?iso-8859-1?Q?Ezjhmlkk7IqAAEQhP5Z3gwGtjmZtTDFd9YMok/JuDngj3XgzF5eyPl1/gO?=
 =?iso-8859-1?Q?vHt5ollVH32OVYmRyx63GT/hkS+BLkINrV7PiH9I930jWXKzWwUpsSu17h?=
 =?iso-8859-1?Q?RuSxCH1gOctTWzb7kOVkYEWqIWOdezi3lvFsvrNG+j6ZZ/5DZsQ5FZtEVX?=
 =?iso-8859-1?Q?DBGlo7Qwvm2RiuTHDlgS++5pcgB3jAbgBUQ4lMBYFm5vxwhCe8u3ahwPKH?=
 =?iso-8859-1?Q?GdwJ8015HSCM+ITtCxbb/BpwNkDH/KY3Lrw5QS4uY1hwSfypk8L+eNYILB?=
 =?iso-8859-1?Q?YCLTkThE/iqHzqrx5RAExbu9m9IgL0AbKCqaptjNb/+nb1rGKOQFySNu7y?=
 =?iso-8859-1?Q?wphpV9ofagRRFgUEjI47rYLlXdHjD7SsJmpNEr7nEMiV9zDtJvjuFParwe?=
 =?iso-8859-1?Q?L2Qyk0zwtOV7DqN9yXJ1AS3UBTZzkAmlMDT7oenfvbq9Vi4LDakWZU3zZp?=
 =?iso-8859-1?Q?c92hZn+C1+zuPdqcxkY3Ti5udv5/HkfR6k8oe4d5xs/hvACkKRESrenxHk?=
 =?iso-8859-1?Q?+4cx6e7pKEO/q7lvZ0Mr5YDOwsXwKOA37elZ0Y35aHE0hVD7F1sMq2Q5CQ?=
 =?iso-8859-1?Q?xVe1XSB+6KclYCzCQPXfHsADG8hx4vW+uyV2Fg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pz7bh63goJkxMwyCarHOsq5zcV/zVpo/y3J/LAYkDgbFyQUurdsmRPy3lu?=
 =?iso-8859-1?Q?q0coufL+szDx7iKiVGiUvJ8OtgjrOxzWcjfMIm+UBLph81yWJKtD34cx4a?=
 =?iso-8859-1?Q?N+uvotnII4+5pbC2RssE/ZTfnp0VgCG//43sOfovKwiQQRs+Yoo5hTJLZ4?=
 =?iso-8859-1?Q?+begnWgLS8BOapvIocfJM/3k1TQJG+k84RiVpvwybP1wdP9wryP23aZh3y?=
 =?iso-8859-1?Q?odtLa8O5P6c0E9Icafy/ZvoAMPH6aaaBKsGdm/1R4x6ZzeO9AHgqvzijh3?=
 =?iso-8859-1?Q?bt06JIv7uwz9E2ukEa2GFr+N2GgAeRg63+Qg9L0f74t8R/ngsAjn5bQIoJ?=
 =?iso-8859-1?Q?C2F3asC4pCsYtONYpbjBgD2TEA1zRiZktW2k3vDmnCIkv9U+DRZ5LJ5D5o?=
 =?iso-8859-1?Q?RndvtQ4AK5Qzg/gMK679ywZtWAiPYqnR29gCFBSPXnyqZjEk9fY0wHd7yS?=
 =?iso-8859-1?Q?RmebbDqKBLeYEUvOpiv68MghhU2n6Jy/eT/za8LEnZ3bQczBoCX2LkZY4n?=
 =?iso-8859-1?Q?cMBEwt7Q0PVMrR8GZJdkRP8bxvAy4/Tyxl2OvOY8j5+pu025QJ7tTA4lTJ?=
 =?iso-8859-1?Q?7rXoqe2HnNSleTeZn9R1fvM37Z3iZL+MBtdPS8PYNRUdz0zIVWnWZXwLCW?=
 =?iso-8859-1?Q?A3cz8ieSkTmwhe10RjDZHdS79nsL3HQpcCzbkngkT77N2Rv1J+t74IjhUJ?=
 =?iso-8859-1?Q?wKTOkQp4yqVdhtRB9s/E+HQiZXmTv8qNwJ5/mpyuxqn82c6eIDRzzFJP11?=
 =?iso-8859-1?Q?aE1AEwOUM2gHZWos5Qe1jwAu3+h2j52ERK5hzbeJ9XIeeeqSG+FsP3arov?=
 =?iso-8859-1?Q?NEY+gQaaw8XUEaMFeVZlbTqtwkfxdYs2T5s45y34wOJGY2GVEpPXQhPDew?=
 =?iso-8859-1?Q?7LVC+62bHyeoG38kJaWQ5PdI5q3P3nANxoeI+BXoiSPgGBBAPNbgpYSipv?=
 =?iso-8859-1?Q?w5WujHLhs1P+SHFd9bSBRIaMMFN/uuL6yGpO+JlR+mo07Gbs4i3mR/vzzf?=
 =?iso-8859-1?Q?jUb1+jTaQoks8Jf1SCYw/2L/WS2F9jnvLH7Mhp30t14IKH68Nxg3H2sO0X?=
 =?iso-8859-1?Q?6Ysq8omDqS67N0iFyLZZiJ+PfyMzokW54M65F7F7SZPyvpBCPG3kK6/JhE?=
 =?iso-8859-1?Q?LeLFfYxbkmpgqOOMRQrg6JV/8whiMa6srSRoxVPDDMxn5nsbkRr352SHXy?=
 =?iso-8859-1?Q?57rEaQ9mfgufOmNrayLKQgEAVVLozV2H+A2LUinklXhdvEi+NEc2d8t6O4?=
 =?iso-8859-1?Q?GLUzR8fLars049RPms87uGtumddD1wfAOGd/B4/SYDD9/XIbw6Ec1lGoak?=
 =?iso-8859-1?Q?7qot+TIKR9Ni7bXDZx6vVrME0QG8Nz6tcHp0Qpskk7HinfA8f5CUdiQZnZ?=
 =?iso-8859-1?Q?Yf7PKOVl4cargH3KtexEv8T8v7Dsahgsdbheqgl/0Mv/8Tm9LZ5Da11zly?=
 =?iso-8859-1?Q?4yU+ZTBumdqCWvqlz6j0qAxIuDoDaxIetyDzoBaR0COq3nR+pw8zLGY4ke?=
 =?iso-8859-1?Q?Z/25vfIpvzB2dZBbbTnOdkSRpFn3TIIRigp4e1rGsMMDg6gLoaeOZFsz/V?=
 =?iso-8859-1?Q?WJPRvzU00ft0OIgIYkuH1CZz5G6O308+RNqpamAayYKcJt1JZF+g9Mi8EF?=
 =?iso-8859-1?Q?3qRfmmcXZyYKZBPTSZz4c34iWZz8YO2PMG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7d226a-29b8-41fa-edd6-08dca5a5a9d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 14:43:31.7327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfF3GWy777+iDoKyLYbuvR/he5vjr/DnRpoPq/7zsBhBdYe7Yvuzexj1/yIHsTiU8uinEFhVEQw6IiobmyMYj5N5Ig32B1Sfm6NKUrP1QBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Tuesday, July 16, 2024 6:36 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
>david.e.box@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>;
>Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Subject: Re: [PATCH v7 3/6] platform/x86/intel/pmt: Use PMT callbacks
>
>On Mon, 15 Jul 2024, Michael J. Ruhl wrote:
>
>> From: "David E. Box" <david.e.box@linux.intel.com>
>>
>> PMT providers may require device specific actions before their telemetry
>> may be read. If the read_telem() is assigned, call it instead of
>> memcpy_fromio() and return. Since this needs to be done in multiple
>> locations, add pmt_telem_read_mmio() as a wrapper function to perform th=
is
>> and any other needed checks.
>>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/class.c     | 26 +++++++++++++++++-----
>>  drivers/platform/x86/intel/pmt/class.h     |  8 +++++--
>>  drivers/platform/x86/intel/pmt/telemetry.c | 10 +++++----
>>  3 files changed, 32 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/class.c
>b/drivers/platform/x86/intel/pmt/class.c
>> index d7939b28e937..c04bb7f97a4d 100644
>> --- a/drivers/platform/x86/intel/pmt/class.c
>> +++ b/drivers/platform/x86/intel/pmt/class.c
>> @@ -58,6 +58,22 @@ pmt_memcpy64_fromio(void *to, const u64
>__iomem *from, size_t count)
>>  	return count;
>>  }
>>
>> +int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb,
>u32 guid, void *buf,
>> +			void __iomem *addr, u32 count)
>> +{
>> +	if (cb && cb->read_telem)
>> +		return cb->read_telem(pdev, guid, buf, count);
>> +
>> +	if (guid =3D=3D GUID_SPR_PUNIT)
>> +		/* PUNIT on SPR only supports aligned 64-bit read */
>> +		return pmt_memcpy64_fromio(buf, addr, count);
>
>Perhaps this SPR quirk could now also use the ->read_telem() callback. It
>would seem nice cleanup if viable.

That is a good thought... I will see if I can look into it.

>> +
>> +	memcpy_fromio(buf, addr, count);
>> +
>> +	return count;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, INTEL_PMT);
>> +
>>  /*
>>   * sysfs
>>   */
>> @@ -79,11 +95,8 @@ intel_pmt_read(struct file *filp, struct kobject *kob=
j,
>>  	if (count > entry->size - off)
>>  		count =3D entry->size - off;
>>
>> -	if (entry->guid =3D=3D GUID_SPR_PUNIT)
>> -		/* PUNIT on SPR only supports aligned 64-bit read */
>> -		count =3D pmt_memcpy64_fromio(buf, entry->base + off, count);
>> -	else
>> -		memcpy_fromio(buf, entry->base + off, count);
>> +	count =3D pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry-
>>header.guid, buf,
>> +				    entry->base + off, count);
>>
>>  	return count;
>>  }
>> @@ -239,6 +252,7 @@ static int intel_pmt_populate_entry(struct
>intel_pmt_entry *entry,
>>
>>  	entry->guid =3D header->guid;
>>  	entry->size =3D header->size;
>> +	entry->cb =3D ivdev->priv_data;
>>
>>  	return 0;
>>  }
>> @@ -300,7 +314,7 @@ static int intel_pmt_dev_register(struct
>intel_pmt_entry *entry,
>>  		goto fail_ioremap;
>>
>>  	if (ns->pmt_add_endpoint) {
>> -		ret =3D ns->pmt_add_endpoint(entry, ivdev->pcidev);
>> +		ret =3D ns->pmt_add_endpoint(ivdev, entry);
>>  		if (ret)
>>  			goto fail_add_endpoint;
>>  	}
>> diff --git a/drivers/platform/x86/intel/pmt/class.h
>b/drivers/platform/x86/intel/pmt/class.h
>> index d6f9ccaf28c8..a267ac964423 100644
>> --- a/drivers/platform/x86/intel/pmt/class.h
>> +++ b/drivers/platform/x86/intel/pmt/class.h
>> @@ -24,6 +24,7 @@ struct pci_dev;
>>  struct telem_endpoint {
>>  	struct pci_dev		*pcidev;
>>  	struct telem_header	header;
>> +	struct pmt_callbacks	*cb;
>>  	void __iomem		*base;
>>  	bool			present;
>>  	struct kref		kref;
>> @@ -43,6 +44,7 @@ struct intel_pmt_entry {
>>  	struct kobject		*kobj;
>>  	void __iomem		*disc_table;
>>  	void __iomem		*base;
>> +	struct pmt_callbacks	*cb;
>>  	unsigned long		base_addr;
>>  	size_t			size;
>>  	u32			guid;
>> @@ -55,10 +57,12 @@ struct intel_pmt_namespace {
>>  	const struct attribute_group *attr_grp;
>>  	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
>>  				 struct device *dev);
>> -	int (*pmt_add_endpoint)(struct intel_pmt_entry *entry,
>> -				struct pci_dev *pdev);
>> +	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
>> +				struct intel_pmt_entry *entry);
>>  };
>>
>> +int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb,
>u32 guid, void *buf,
>> +			void __iomem *addr, u32 count);
>>  bool intel_pmt_is_early_client_hw(struct device *dev);
>>  int intel_pmt_dev_create(struct intel_pmt_entry *entry,
>>  			 struct intel_pmt_namespace *ns,
>> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
>b/drivers/platform/x86/intel/pmt/telemetry.c
>> index 3478f891ea0b..c9feac859e57 100644
>> --- a/drivers/platform/x86/intel/pmt/telemetry.c
>> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
>> @@ -93,8 +93,8 @@ static int pmt_telem_header_decode(struct
>intel_pmt_entry *entry,
>>  	return 0;
>>  }
>>
>> -static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
>> -				  struct pci_dev *pdev)
>> +static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
>> +				  struct intel_pmt_entry *entry)
>>  {
>>  	struct telem_endpoint *ep;
>>
>> @@ -104,13 +104,14 @@ static int pmt_telem_add_endpoint(struct
>intel_pmt_entry *entry,
>>  		return -ENOMEM;
>>
>>  	ep =3D entry->ep;
>> -	ep->pcidev =3D pdev;
>> +	ep->pcidev =3D ivdev->pcidev;
>>  	ep->header.access_type =3D entry->header.access_type;
>>  	ep->header.guid =3D entry->header.guid;
>>  	ep->header.base_offset =3D entry->header.base_offset;
>>  	ep->header.size =3D entry->header.size;
>>  	ep->base =3D entry->base;
>>  	ep->present =3D true;
>> +	ep->cb =3D ivdev->priv_data;
>>
>>  	kref_init(&ep->kref);
>>
>> @@ -218,7 +219,8 @@ int pmt_telem_read(struct telem_endpoint *ep, u32
>id, u64 *data, u32 count)
>>  	if (offset + NUM_BYTES_QWORD(count) > size)
>>  		return -EINVAL;
>>
>> -	memcpy_fromio(data, ep->base + offset,
>NUM_BYTES_QWORD(count));
>> +	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep-
>>base + offset,
>> +			    NUM_BYTES_QWORD(count));
>>
>>  	return ep->present ? 0 : -EPIPE;
>>  }
>>
>
>Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

Thank you!

M
>--
> i.
