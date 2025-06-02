Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD333227BB9
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Jun 2025 18:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887250; cv=fail; b=uGox/ylyOTdRLS5MjLOJ0exV+/kLKy42WXlabh9UhhHcPNhSB+2NfoFmc1UOCf/845HJTJo5Jku2g/5LMNLqnNqyLKr5/FUz9/QX8vQ0LdI6UpJVjKdfYiRo9QRtWk/c0qbl3+M4RZGcTscms/i/4D5ahDu/YmIyQ1rUZcv/Lww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887250; c=relaxed/simple;
	bh=INm3Zav5cMi62KvaXrXi+JIoecmsfAq2toewCMZZNUI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yvd9yKvsqS6oC8dJB/SGD+6k7lXggcAndX2VDyZuorZrtkd8M0Uc1hkSQwbMg8l4GFztsksaqZUcrS7tMtAFd7fxeBQpIg6I+ygxOl/HrPx/bcn8+IuRWBFzsbvHGyOY70trS7FLbrk6kfHauyuOFTbnd2jHAJxxRpB7R+H4dNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9DPubtU; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9DPubtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748887248; x=1780423248;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=INm3Zav5cMi62KvaXrXi+JIoecmsfAq2toewCMZZNUI=;
  b=M9DPubtUW/MsoHdCHY7TWlVNJl2Jl1bpz5XJGWGkTNo+cpCPfCLblS3W
   ASE8f3W3urdOKYzYFN32y0337yb+4gKaYTGgLBfFg1c3+4iCfQpnkfGfI
   PEDqZ+8flMjspXJyR1+P4U46gaT7ZRv6xzKZMJu/GIEejjCO5gSBfWQZp
   xG3lg6E3xC8NJ+SyURocwQLNIc7Jb6E4YWHvQGuFOaBDkGxhGLBf5TfP3
   WldANNzCPIaymb2rjXqKmKRFn1Ldah93V+ZEKCZ3EuVFt8nV1wOH7WAFy
   wTDElPIVWV2RGT5Vtr5eft3HOO9YwplVheCAc9NtGVU3u8BzX/kH1CdG5
   Q==;
X-CSE-ConnectionGUID: m7GHSnwuSGKqXjpLr9QpRA==
X-CSE-MsgGUID: 6IMLmn1wRia81tBz34YE5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="76292729"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="76292729"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 11:00:47 -0700
X-CSE-ConnectionGUID: QCnpTcocTw6KPgdVN2DlLQ==
X-CSE-MsgGUID: kNVATj6tR4CKe5fmqYRsyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="149382222"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 11:00:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 11:00:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 11:00:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.56)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 11:00:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jql5HdeHVJoA7Cir2PHnlbeTNS9CaTxPbqKwmTgq2/WgZoNC0ldrnl4HI5mtd0KXLFtuF58kXKfwqoTk0HlXOuZugqtIwUh0uxsoNHU8dlVBBF72OXjCMQkUeZBxWj4fFIp88YUclscvvu4bi/TcxZ38rzZb7Iz6FZFlsiQDRn1+BOHZ3Hji21EGVo5h4zzhLJuBplsk5sihsrp7qYDJAAFZMadAwzuQOD07Y/Ig8I+loeCgKrfCnazLZdaK4UQrtdlr+sIVg6Fro/+l92ZUnfle+idMVnXdCkuH85kfJhaxSTJw6IdLU3K7Ma1pI1AS8BbAEL+wOEI5fCPi62I1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poDPBvRLiQNRuNWnSPRzxJ8tiCVXsY119TjOF+fh57c=;
 b=LGjriPpQJ3pd8lKZ+KgbZnQx14cV83xjpO/vKixdS9xJHKIZXajy2r7Bql+C71Fp8ARPrA549/2ZS/lJdJ4ZLa8OHQ6bItM1axCQS4VoB72y+9TYHuLqN2BEgn/xW2PmCybFJphsJLFAACcvfM3XK/4E7xPevVIefIX4JEU7f3YftOXYpSfggry5xXfSHFrakav0n1KbPG1a4WneOy7lSsN36iOrIMrbUgGRNi6So4plxsU2K6QxfBjsB6Mw23V9PIpwH49whRU6N3TV8gITvappKoZdqdJn+0qf+0+VHicYGPq5neEYpF3C59NrVTBLXievgYJTekbLGVi6zbFXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 2 Jun
 2025 18:00:02 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 18:00:02 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>
Subject: RE: [PATCH 08/10] platform/x86/intel/pmt: support BMG crashlog
Thread-Topic: [PATCH 08/10] platform/x86/intel/pmt: support BMG crashlog
Thread-Index: AQHb0aJIxK2vppkXAU+lGGw4eAYXIbPsPP2AgAPv1IA=
Date: Mon, 2 Jun 2025 18:00:02 +0000
Message-ID: <IA1PR11MB6418DDDA11436C3F92A8C012C162A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <20250530203356.190234-8-michael.j.ruhl@intel.com>
 <6c38fa36-cc8e-3ed1-380e-074c27b2581d@linux.intel.com>
In-Reply-To: <6c38fa36-cc8e-3ed1-380e-074c27b2581d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA3PR11MB7609:EE_
x-ms-office365-filtering-correlation-id: 4feae263-60f7-45d8-1548-08dda1ff4c6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?tE9WOHSfQF0+eEzoegRTTjht9hz/nlPKmSZDlt2GTeYY40C0b7Jm47rnqE?=
 =?iso-8859-1?Q?A8HJV2lEdY4Fhz0q3pWuMPGLG8WQO4SPk4+TelS3S4Q/rHAf4rRk0e8qhh?=
 =?iso-8859-1?Q?yZg+7mrfrYgcA4wIdadRtGvIc24GGUYsU9o6iJpvbhnCp11wQkyEHzsBF+?=
 =?iso-8859-1?Q?46O3wRFWCKRjK7BAhdosK3zROug2xA4YsmxHs9OZIgwMO1mijdtanQMm3I?=
 =?iso-8859-1?Q?pmhJAKMIgf+pnt1P5MWSbmm/s5pr7o5hMaeL6cwYb6cWPu0G7+S8IKpue0?=
 =?iso-8859-1?Q?aLkYZ6kYVuUtnqij6LE5FJgeXg/wN2Nl86yhskNo9r5qGkwvM4nMSRR9K1?=
 =?iso-8859-1?Q?oAg0dGSx4HF6hDQmSbGky/iyqajDJXGZuSnvCAcebULu9XEYXDF+uWaPA6?=
 =?iso-8859-1?Q?gsl1YVHHC/JJxhu2j9I4SWf8Wk8dKW6ZPXZHOqDv/c8bqLbvzl9CuvPR2q?=
 =?iso-8859-1?Q?RUfYzc/LmKTE6oH2dNGxmYvnn863TakktIS+dRTcztXyR6zTLpAM/im71w?=
 =?iso-8859-1?Q?2muIuaPTyPwqWX1vYdrKdAz2WXLKudXVsqieL6WvS+1jsJ3X8eGd56U8pl?=
 =?iso-8859-1?Q?V4WW7GhU/T5bKas/CG2S7yAS6FyNpcfjLEWTA7tWfXI6jaXHXnUH2evWMo?=
 =?iso-8859-1?Q?tlJx62G0ATmbSTzA2IZRdVGGwxq6qU529iUvXtp6Pi45M1tsPpMerFm62O?=
 =?iso-8859-1?Q?fGAjSvSClkzCS0mTnTM22wsG1xzXtFhRn0kMycy+7CCrQrMv+yxwdbAtDA?=
 =?iso-8859-1?Q?VXmWpLAdbZ9nJmxeRrnkkX8i/LWuVZRe7SZAOy50xf4rcsHcUVWgzlpppe?=
 =?iso-8859-1?Q?vk1bwl8qsRTx9mVRk29SxHP4c6788e/4M0SazAgfvV4rx+6gUuYvwteC8w?=
 =?iso-8859-1?Q?U0ye1xa/ge0FOwBIUwAa82UJPUnEo1Dzv26niRT98XPhHhZQnXTiB8yfJc?=
 =?iso-8859-1?Q?O+opgaVtcbSPithgelEykXVfjeNYzgeMqdTymqIzbLo6K+OPa7qJ7wNsam?=
 =?iso-8859-1?Q?14O2tdeNdFPUQfLddoF5CD5KhJ1WWwpMj+0ukqaPuliGgkG32jpR7keFRE?=
 =?iso-8859-1?Q?deCzH1rCjfBNUHyXT6HQq+x44HCEAP3UinIJoVnvmoHMrMxC4Y5V0ck7ER?=
 =?iso-8859-1?Q?+fbLnxjHFtey2vPLEfPiCZX+cN/O+vfaFkMC+ZfiDMHg8oKrKaHqV7uqmC?=
 =?iso-8859-1?Q?Llt23coIYdDvkePERcX/5hxvnbdKIVvG2/nHu+XTQWEglagmZtyobRQjCn?=
 =?iso-8859-1?Q?CEUwFcW9vr6jumlYdf9vfUNs9tlWM6AQTEsn1rEuLXV14KLXQspHBUBQCF?=
 =?iso-8859-1?Q?QMf/48hmOZ1/jkZGsG2lZj+Q9YlyT278MWxUxlzaU6DtkYOHw8T+aH+Z0C?=
 =?iso-8859-1?Q?uk4lwZRbabvoDwnoZuRaXVYnThNLfw5bPWIdqhqbkB/IcIpCSnKEdoCniD?=
 =?iso-8859-1?Q?ML5n2LRojFcgySPL22dH5ElCRGVd2NN+putJKNyMkUmkAL2XLIFOWhyaP0?=
 =?iso-8859-1?Q?cx6OUi0MFrimLDsmqll+Zdl5GX7JSaMfPS4itsRHsnc4CsM8nrmBcLWMdu?=
 =?iso-8859-1?Q?1IIu2dU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?82aLB4B+vuwRDMwkxAXAAwKM1qbsktQ5TAxSfonO8AqfiJVP3yLz9GPmib?=
 =?iso-8859-1?Q?JYPo2X3BM11hy37fKYi/YgFD7nCE6EHCv37vdJQsPYWLSpXUY3fgdMehUD?=
 =?iso-8859-1?Q?e6TYOP8OK7VyVQTQiTwqU/o2IG4H9zXnTBM+Wcsm7pClg1tx3705eZCN+H?=
 =?iso-8859-1?Q?S7uoL2Y/7jGGHom8A6xBh1oG3uBiFwJKZ6mte3J6sdTO3MVMOaYpDnjIb0?=
 =?iso-8859-1?Q?7kO5BRZw9FJcUDvUh4KkhSz7tIQMwNM0dy+jNWNxXK2yJvNssHXgMkuDvC?=
 =?iso-8859-1?Q?CSvlr6joi9qe2Zq0UqyCSTpaWiRKchOblUkJAvlTO7C0qzSzdfpHPSBL/X?=
 =?iso-8859-1?Q?ser1VaUTw5ZNecbYkArYjSNXOXYJNaGxYKs6jSW1ULuG604Jj1LzJhKzeR?=
 =?iso-8859-1?Q?Usgle3tcFCj5pWesLerc6JAcmxTWmcx/rnmdzN1RXHsXuA0ZGvF0wD0wu3?=
 =?iso-8859-1?Q?QotUsfpUpJQRpGnUtvK9E6ecmyiN7hwmbIVjCdp4kPk8g7OHfOvYKQJt/K?=
 =?iso-8859-1?Q?UG8iRgU7KdrMH/DXSo7eNQ/gmxM02zkEA47lBBJfdT9p+LnDsv3Mb/Bxv1?=
 =?iso-8859-1?Q?+fKxAXAh8dzciuW2oJRfZV5jywKLRYxwlVwuBk3DVfaQ2FKYY13BYOFlTW?=
 =?iso-8859-1?Q?no3TgWoT+VsX2Q0s7zAsYffKk2Wse/+Y4hkSdqwEXSLWI3bp0kZzj/zOmz?=
 =?iso-8859-1?Q?+48FfdZ6OKNPpd8I3qoAhBCK5WX6ArURu4MY90mvDKXm9tEeEBmXDNXSeo?=
 =?iso-8859-1?Q?zQJe/x3bsgCNA4mkKW73/NJ9rM/b1/9UYRAp8vZUZbDHGmGfE6dIAYmGY8?=
 =?iso-8859-1?Q?14HOkcsxfajkSlIAev09X6O7jyWK9jNc1YTFMhihW4RIOVBOUvfyEfCZio?=
 =?iso-8859-1?Q?7rTkihs1gdCv8+c/u3t/TXZDrm7eNdgZRZiyaRl9JdqwxGsdAEiT+C/ezW?=
 =?iso-8859-1?Q?idWZu1fcnxTxNreMdifX8HX2I3uqwFKlza4/pTAQQmQPjo2/V9kjvUrH6y?=
 =?iso-8859-1?Q?Uiwa8CjUOpVonePXIwAiitU5BhH2l8EWllyFpYV4bjEb7v7QmVOfULRITn?=
 =?iso-8859-1?Q?9N7uK9kRwzdei2buKMUmSdHI8zeB9ktSsGOk3Z0r/lNWcrnqMl8X0aIsja?=
 =?iso-8859-1?Q?i1FgrMQYIhsSYkr3SEp3OxG4R4IK0atGSPWP/+BSgOPRfyNKb1i72a+025?=
 =?iso-8859-1?Q?xKTfmB0qheLEt1Faiyqb6Ll0GsnMSnpRGYYcknQgIICjq/xR6VfgF33Vo4?=
 =?iso-8859-1?Q?AUIgdqn06w/Tq4HNq3voII8Q4x8gqC6MqeXhsm24kx2zn8ONGdS7Bzz8nc?=
 =?iso-8859-1?Q?4ZTjtYjv4RFpD7RxOdgqKLrnNX0ZoNPBeG7QmNyF0Avd4CC3xBQYvgQrRq?=
 =?iso-8859-1?Q?TmTQTNt5wB+5UtVudaGVGT1oIQNdBlINzOGJcwArJDqn2cmo+ylLO2EVPU?=
 =?iso-8859-1?Q?Y7v/2t2CaY0netD7WbZZRmBWRAOMzycu3VZ8+mtfgOYf0S1Wtja7TfAaW3?=
 =?iso-8859-1?Q?Sb9E1/yZCJARPesfWjUcqI70DxtX7nvRb9O+H6nNVEr+H4yfscdbyHpUxg?=
 =?iso-8859-1?Q?dqNMChRDkr5Z1zVMJ3r8TuK0OdCrnyiWPGB1nW3dAGzk1uoY+Wag6FVegh?=
 =?iso-8859-1?Q?JDKAcpLxvHSJ/Rn7YMCvKhA5fNUinvhvaS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4feae263-60f7-45d8-1548-08dda1ff4c6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 18:00:02.6941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FR0p2udJmkvmMDdDkmpqmC9hddMoQjuGmBItixBfa18HSubGl3L908pbrTGOnNSDPYuKt718NzogQ1B4LxqfwZ6LfTvGgoYT1Wq0YNG/F5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Saturday, May 31, 2025 1:52 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hdegoede@redhat.com>; De Marchi, Lucas
><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Subject: Re: [PATCH 08/10] platform/x86/intel/pmt: support BMG crashlog
>
>On Fri, 30 May 2025, Michael J. Ruhl wrote:
>
>> The Battlemage GPU has the type 1 version 2 crashlog feature.
>>
>> Update the crashlog driver to support this crashlog version.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 282 ++++++++++++++++++++-
>-
>>  1 file changed, 263 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index e6eea8809a56..7291c93d71df 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -51,20 +51,53 @@
>>  #define TYPE1_VER0_COMPLETE		BIT(31)
>>  #define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
>>
>> +/*
>> + * Type 1 Version 2
>> + * status and control are two different registers
>> + */
>> +#define TYPE1_VER2_STATUS_OFFSET	0x00
>> +#define TYPE1_VER2_CONTROL_OFFSET	0x14
>> +
>> +/* status register */
>> +#define TYPE1_VER2_CLEAR_SUPPORT	BIT(20)
>> +#define TYPE1_VER2_REARMED		BIT(25)
>> +#define TYPE1_VER2_ERROR		BIT(26)
>> +#define TYPE1_VER2_CONSUMED		BIT(27)
>> +#define TYPE1_VER2_DISABLED		BIT(28)
>> +#define TYPE1_VER2_CLEARED		BIT(29)
>> +#define TYPE1_VER2_IN_PROGRESS		BIT(30)
>> +#define TYPE1_VER2_COMPLETE		BIT(31)
>> +
>> +/* control register */
>> +#define TYPE1_VER2_CONSUME		BIT(25)
>> +#define TYPE1_VER2_REARM		BIT(28)
>> +#define TYPE1_VER2_EXECUTE		BIT(29)
>> +#define TYPE1_VER2_CLEAR		BIT(30)
>> +#define TYPE1_VER2_DISABLE		BIT(31)
>> +#define TYPE1_VER2_TRIGGER_MASK
>	(TYPE1_VER2_CONSUME | TYPE1_VER2_EXECUTE | \
>> +					 TYPE1_VER2_CLEAR |
>TYPE1_VER2_DISABLE)
>> +
>>  /* After offset, order alphabetically, not bit ordered */
>>  struct crashlog_status {
>>  	u32 offset;
>> -	u32 clear;
>> +	u32 clear_supported;
>> +	u32 cleared;
>>  	u32 complete;
>> -	u32 disable;
>> +	u32 consumed;
>> +	u32 disabled;
>> +	u32 error;
>> +	u32 in_progress;
>> +	u32 rearmed;
>>  };
>>
>>  struct crashlog_control {
>>  	u32 offset;
>>  	u32 trigger_mask;
>>  	u32 clear;
>> +	u32 consume;
>>  	u32 disable;
>>  	u32 manual;
>> +	u32 rearm;
>>  };
>>
>>  struct crashlog_info {
>> @@ -73,18 +106,38 @@ struct crashlog_info {
>>  };
>>
>>  const struct crashlog_info crashlog_type1_ver0 =3D {
>> -	.status.offset =3D CONTROL_OFFSET,
>> -	.status.clear =3D TYPE1_VER0_CLEAR,
>> +	.status.offset =3D TYPE1_VER0_STATUS_OFFSET,
>> +	.status.cleared =3D TYPE1_VER0_CLEAR,
>>  	.status.complete =3D TYPE1_VER0_COMPLETE,
>> -	.status.disable =3D TYPE1_VER0_DISABLE,
>> +	.status.disabled =3D TYPE1_VER0_DISABLE,
>> +
>>
>> -	.control.offset =3D CONTROL_OFFSET,
>> +	.control.offset =3D TYPE1_VER0_CONTROL_OFFSET,
>>  	.control.trigger_mask =3D TYPE1_VER0_TRIGGER_MASK,
>>  	.control.clear =3D TYPE1_VER0_CLEAR,
>>  	.control.disable =3D TYPE1_VER0_DISABLE,
>>  	.control.manual =3D TYPE1_VER0_EXECUTE,
>>  };
>>
>> +const struct crashlog_info crashlog_type1_ver2 =3D {
>> +	.status.offset =3D TYPE1_VER2_STATUS_OFFSET,
>> +	.status.clear_supported =3D TYPE1_VER2_CLEAR_SUPPORT,
>> +	.status.disabled =3D TYPE1_VER2_DISABLED,
>> +	.status.cleared =3D TYPE1_VER2_CLEARED,
>> +	.status.complete =3D TYPE1_VER2_COMPLETE,
>> +	.status.rearmed =3D TYPE1_VER2_REARMED,
>> +	.status.error =3D TYPE1_VER2_ERROR,
>> +	.status.in_progress =3D TYPE1_VER2_IN_PROGRESS,
>> +
>> +	.control.offset =3D TYPE1_VER2_CONTROL_OFFSET,
>> +	.control.trigger_mask =3D TYPE1_VER2_TRIGGER_MASK,
>> +	.control.clear =3D TYPE1_VER2_CLEAR,
>> +	.control.consume =3D TYPE1_VER2_CONSUME,
>> +	.control.disable =3D TYPE1_VER2_DISABLE,
>> +	.control.manual =3D TYPE1_VER2_EXECUTE,
>> +	.control.rearm =3D TYPE1_VER2_REARM,
>> +};
>> +
>>  struct crashlog_entry {
>>  	/* entry must be first member of struct */
>>  	struct intel_pmt_entry		entry;
>> @@ -99,22 +152,27 @@ struct pmt_crashlog_priv {
>>
>>  /*
>>   * This is the generic access to a PMT struct. So the use of
>> - * struct crashlog_entry
>> - * doesn't "make sense" here.
>> + *   struct crashlog_entry
>> + * doesn't "make sense" here, i.e. use:
>> + *   struct intel_pmt_entry
>>   */
>> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32
>*crash_type, u32 *version)
>>  {
>>  	u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET);
>> -	u32 crash_type, version;
>>
>> -	crash_type =3D GET_TYPE(discovery_header);
>> -	version =3D GET_VERSION(discovery_header);
>> +	*crash_type =3D GET_TYPE(discovery_header);
>> +	*version =3D GET_VERSION(discovery_header);
>>
>>  	/*
>> -	 * Currently we only recognize OOBMSM version 0 devices.
>> -	 * We can ignore all other crashlog devices in the system.
>> +	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
>> +	 * devices.
>> +	 *
>> +	 * Ignore all other crashlog devices in the system.
>>  	 */
>> -	return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
>> +	if (*crash_type =3D=3D CRASH_TYPE_OOBMSM && (*version =3D=3D 0 ||
>*version =3D=3D 2))
>> +		return true;
>> +
>> +	return false;
>>  }
>>
>>  /*
>> @@ -135,7 +193,7 @@ static bool pmt_crashlog_disabled(struct
>intel_pmt_entry *entry,
>>  	u32 reg =3D readl(entry->disc_table + status->offset);
>>
>>  	/* return current value of the crashlog disabled flag */
>> -	return !!(reg & status->disable);
>> +	return !!(reg & status->disabled);
>>  }
>>
>>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
>> @@ -177,9 +235,78 @@ static void pmt_crashlog_set_execute(struct
>intel_pmt_entry *entry,
>>  	writel(reg, entry->disc_table + control->offset);
>>  }
>>
>> +/* version 2 support */
>> +static bool pmt_crashlog_cleared(struct intel_pmt_entry *entry,
>> +				 const struct crashlog_status *status)
>> +{
>> +	u32 reg =3D readl(entry->disc_table + status->offset);
>> +
>> +	/* return current value of the crashlog cleared flag */
>> +	return !!(reg & status->cleared);
>> +}
>> +
>> +static bool pmt_crashlog_consumed(struct intel_pmt_entry *entry,
>> +				  const struct crashlog_status *status)
>> +{
>> +	u32 reg =3D readl(entry->disc_table + status->offset);
>> +
>> +	/* return current value of the crashlog consumedflag */
>> +	return !!(reg & status->cleared);
>> +}
>> +
>> +static void pmt_crashlog_set_consumed(struct intel_pmt_entry *entry,
>> +				      const struct crashlog_control *control)
>> +{
>> +	u32 reg =3D readl(entry->disc_table + control->offset);
>> +
>> +	reg &=3D ~control->trigger_mask;
>> +	reg |=3D control->consume;
>> +
>> +	writel(reg, entry->disc_table + control->offset);
>> +}
>> +
>> +static bool pmt_crashlog_error(struct intel_pmt_entry *entry,
>> +			       const struct crashlog_status *status)
>> +{
>> +	u32 reg =3D readl(entry->disc_table + status->offset);
>> +
>> +	/* return current value of the crashlog error flag */
>> +	return !!(reg & status->error);
>> +}
>> +
>> +static bool pmt_crashlog_rearm(struct intel_pmt_entry *entry,
>> +			       const struct crashlog_status *status)
>> +{
>> +	u32 reg =3D readl(entry->disc_table + status->offset);
>> +
>> +	/* return current value of the crashlog reamed flag */
>> +	return !!(reg & status->rearmed);
>> +}
>> +
>> +static void pmt_crashlog_set_rearm(struct intel_pmt_entry *entry,
>> +				   const struct crashlog_control *control)
>> +{
>> +	u32 reg =3D readl(entry->disc_table + control->offset);
>> +
>> +	reg &=3D ~control->trigger_mask;
>> +	reg |=3D control->rearm;
>> +
>> +	writel(reg, entry->disc_table + control->offset);
>> +}
>> +
>>  /*
>>   * sysfs
>>   */
>> +static ssize_t
>> +clear_show(struct device *dev, struct device_attribute *attr, char *buf=
)
>> +{
>> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
>> +	int cleared =3D pmt_crashlog_cleared(&crashlog->entry, &crashlog->info=
-
>>status);
>> +
>> +	return sysfs_emit(buf, "%d\n", cleared);
>> +}
>> +static DEVICE_ATTR_RO(clear);
>> +
>>  static ssize_t
>>  enable_show(struct device *dev, struct device_attribute *attr, char *bu=
f)
>>  {
>> @@ -189,6 +316,46 @@ enable_show(struct device *dev, struct
>device_attribute *attr, char *buf)
>>  	return sprintf(buf, "%d\n", enabled);
>>  }
>>
>> +static ssize_t
>> +consumed_show(struct device *dev, struct device_attribute *attr, char *=
buf)
>> +{
>> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
>> +	int consumed =3D pmt_crashlog_consumed(&crashlog->entry, &crashlog-
>>info->status);
>
>Why you don't match the type with the returned type?

Probably a missed edit.. I will update.

Thanks!

M

>> +	return sysfs_emit(buf, "%d\n", consumed);
>> +}
>> +
>> +static ssize_t consumed_store(struct device *dev, struct device_attribu=
te
>*attr,
>> +			      const char *buf, size_t count)
>> +{
>> +	struct crashlog_entry *crashlog;
>> +	bool consumed;
>> +	int result;
>> +
>> +	crashlog =3D dev_get_drvdata(dev);
>> +
>> +	result =3D kstrtobool(buf, &consumed);
>> +	if (result)
>> +		return result;
>> +
>> +	/* set bit only */
>> +	if (!consumed)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&crashlog->control_mutex);
>> +
>> +	if (pmt_crashlog_disabled(&crashlog->entry, &crashlog->info->status))
>> +		return -EBUSY;
>> +
>> +	if (!pmt_crashlog_complete(&crashlog->entry, &crashlog->info-
>>status))
>> +		return -EEXIST;
>> +
>> +	pmt_crashlog_set_consumed(&crashlog->entry, &crashlog->info-
>>control);
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(consumed);
>> +
>>  static ssize_t
>>  enable_store(struct device *dev, struct device_attribute *attr,
>>  	     const char *buf, size_t count)
>> @@ -211,6 +378,50 @@ enable_store(struct device *dev, struct
>device_attribute *attr,
>>  }
>>  static DEVICE_ATTR_RW(enable);
>>
>> +static ssize_t
>> +error_show(struct device *dev, struct device_attribute *attr, char *buf=
)
>> +{
>> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
>> +	int error =3D pmt_crashlog_error(&crashlog->entry, &crashlog->info-
>>status);
>> +
>> +	return sysfs_emit(buf, "%d\n", error);
>> +}
>> +static DEVICE_ATTR_RO(error);
>> +
>> +static ssize_t
>> +rearm_show(struct device *dev, struct device_attribute *attr, char *buf=
)
>> +{
>> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
>> +	int rearmed =3D pmt_crashlog_rearm(&crashlog->entry, &crashlog->info-
>>status);
>> +
>> +	return sysfs_emit(buf, "%d\n", rearmed);
>> +}
>> +
>> +static ssize_t rearm_store(struct device *dev, struct device_attribute =
*attr,
>> +			   const char *buf, size_t count)
>> +{
>> +	struct crashlog_entry *crashlog;
>> +	bool rearm;
>> +	int result;
>> +
>> +	crashlog =3D dev_get_drvdata(dev);
>> +
>> +	result =3D kstrtobool(buf, &rearm);
>> +	if (result)
>> +		return result;
>> +
>> +	/* set only */
>> +	if (!rearm)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&crashlog->control_mutex);
>> +
>> +	pmt_crashlog_set_rearm(&crashlog->entry, &crashlog->info->control);
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(rearm);
>> +
>>  static ssize_t
>>  trigger_show(struct device *dev, struct device_attribute *attr, char *b=
uf)
>>  {
>> @@ -264,24 +475,57 @@ static struct attribute *pmt_crashlog_attrs[] =3D =
{
>>  	NULL
>>  };
>>
>> +static struct attribute *pmt_crashlog_ver2_attrs[] =3D {
>> +	&dev_attr_clear.attr,
>> +	&dev_attr_consumed.attr,
>> +	&dev_attr_enable.attr,
>> +	&dev_attr_error.attr,
>> +	&dev_attr_rearm.attr,
>> +	&dev_attr_trigger.attr,
>> +	NULL
>> +};
>> +
>>  static const struct attribute_group pmt_crashlog_group =3D {
>>  	.attrs	=3D pmt_crashlog_attrs,
>>  };
>>
>> +static const struct attribute_group pmt_crashlog_ver2_group =3D {
>> +	.attrs =3D pmt_crashlog_ver2_attrs,
>> +};
>> +
>> +static const struct crashlog_info *select_crashlog_info(u32 type, u32
>version)
>> +{
>> +	if (version =3D=3D 0)
>> +		return &crashlog_type1_ver0;
>> +
>> +	return &crashlog_type1_ver2;
>> +}
>> +
>> +static const struct attribute_group *select_sysfs_grp(u32 type, u32 ver=
sion)
>> +{
>> +	if (version =3D=3D 0)
>> +		return &pmt_crashlog_group;
>> +
>> +	return &pmt_crashlog_ver2_group;
>> +}
>> +
>>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>>  				      struct device *dev)
>>  {
>>  	void __iomem *disc_table =3D entry->disc_table;
>>  	struct intel_pmt_header *header =3D &entry->header;
>>  	struct crashlog_entry *crashlog;
>> +	u32 version;
>> +	u32 type;
>>
>> -	if (!pmt_crashlog_supported(entry))
>> +	if (!pmt_crashlog_supported(entry, &type, &version))
>>  		return 1;
>>
>>  	/* initialize the crashlog struct */
>>  	crashlog =3D container_of(entry, struct crashlog_entry, entry);
>>  	mutex_init(&crashlog->control_mutex);
>> -	crashlog->info =3D &crashlog_type1_ver0;
>> +
>> +	crashlog->info =3D select_crashlog_info(type, version);
>>
>>  	header->access_type =3D GET_ACCESS(readl(disc_table));
>>  	header->guid =3D readl(disc_table + GUID_OFFSET);
>> @@ -290,7 +534,7 @@ static int pmt_crashlog_header_decode(struct
>intel_pmt_entry *entry,
>>  	/* Size is measured in DWORDS, but accessor returns bytes */
>>  	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
>>
>> -	entry->attr_grp =3D &pmt_crashlog_group;
>> +	entry->attr_grp =3D select_sysfs_grp(type, version);
>>
>>  	return 0;
>>  }
>>
>
>--
> i.

