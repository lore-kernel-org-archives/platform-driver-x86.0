Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665832770A
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607864; cv=fail; b=jUfaMc6dxQ3AmWlEJKGUSSXhYAdmg05n4tUpDM2ASflefnqkTaDBluFNjLTmtd7u3aIOByviXCQEi2IAejy1AVbJ9fjeoXAySITKZNSOYiso5lPjiROg/d6BSsd2xUkegUezADjU0FU8C0+RYS26A7vEJHn7uO26AgWognDMIzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607864; c=relaxed/simple;
	bh=QefvIBTV5ruKHpIIcTyQ+V9bPlfvC762ITGar+iIp3k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LliyqbyAxtClN4FXkTlGtf05nROwnIrtxE0yP8dBKlEEmIhtdR2lrmwaSUiYyZzCuOi57FSkRzPSTitqznu0Xfpe9heJDbfCuPnrYZvXPswubBgkiPBEPUp2qIO+LUfaS8xWV4nY/fH2Ql7PMHvDMMfD/2Hj1wXHFajlF1MwT14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4WYDbOL; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4WYDbOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769607861; x=1801143861;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QefvIBTV5ruKHpIIcTyQ+V9bPlfvC762ITGar+iIp3k=;
  b=P4WYDbOLi+nF5seL9IJY2O+A6hGouL9u3NAgGPGkcg58gwLzitD3zQiK
   yRVm2aZJRAfFc/GO1gSG6M2pTsPPhMsQ5ULTHujCOIr1OICKHwj0Lms7h
   ODpJBtHNC1O8d9Pz10zZZ2KQS5MuL4i3vvW7wSaWSyfypR9IoBU0fUfXy
   xUnZG5wZubUY9Z2VLf2Li7VeCj90pXWxrt8jtnBj+N8bbox7Jr79g1Tw1
   u0nIJ2lkzV3TKiNymyYXZ5hnf2EpLi3ffQJLVOePSWHZ69r2CT3RXYXrM
   nPbI8D5pAqmvQtUN8WGoKattmZDXYwe98rQvqbRJa7A2At30TH1Wf/9wm
   A==;
X-CSE-ConnectionGUID: 8dVboIXwTs+u/gQP6pceMw==
X-CSE-MsgGUID: 2cGZhIdrQZK8N45Y4FlTAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81542198"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81542198"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:44:21 -0800
X-CSE-ConnectionGUID: yo2dwzZZTJqz87LnboaDBQ==
X-CSE-MsgGUID: Ae1xhIJHRmuq4PiocgVMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207892753"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:44:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 05:44:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 05:44:20 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 05:44:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCHDiTgl5JD1dPEbTi0gMeJ9n640UneL8qJJIB6RmOnLyFRIZ5rSeEyWZoigJMeaoAliSykKyGuYIXENo7RZCOM5mTEpR/e03WUbpOFfcqdNlgmsA8flu5pYMJkf3hwYVXaJlwZwZgBOqu0AuR/dPs470t8kauZ9eOWudR3+UyuWt26uk3vOTP2AQujWNmFZxbwDjVILwDJgWTNOAL+s0TcuxpwsoDMVwGxKvpmEoyBJNbYqqma/nBJ63QzEALsP5x8tmXUMdgSYQYfUneDWlxbU2/SPwJmRj50EN9xSYR9HRRqGEsISt8wUDkCpaLP73KL4yhIcLx9l0SCXCx0fag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf2f0ihSCaKeXHyGLWxCTtmIhQg/IPafjCrXI6yVf8o=;
 b=QfK4FnjANmasHIgvjE0nBRZ4wzrQ8OUpVIkiRjUsB2vuqKvWGIGTnVenzIoqQTS9BhlrOIj1hRbMi50sj4kxF/tm2HUuhf4AsvzNpstnqOO29eqVGSYac+rPTvokgQrXpEuC7wlhEazEb34jVoRc45NUw8hexi9JSodtI8VAy7L7GQ9bj1iWXhljmHRV4qoHfJObkgLUwr5CG7gnafFoG7Tr4Wjn7im0ml3YVM4+DzSKFksxPSI08TTffE3o7cXDLcP+nh3ZjykeDBU+HJkdnGikSMJXYDOly1nrpk8PlSdH1zB7ODEd/DeR1kcWLZyO3BTXPA075HIEe34ebOa95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 13:44:16 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:44:16 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH 1/5] pmt: Add register access callbacks
Thread-Topic: [PATCH 1/5] pmt: Add register access callbacks
Thread-Index: AQHcj7o2EuYKkFthHkKbRgitxJgWwLVng3uAgAAUH8A=
Date: Wed, 28 Jan 2026 13:44:16 +0000
Message-ID: <IA1PR11MB6418D585F43061A048E8F8CCC191A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
 <20260127182418.640701-8-michael.j.ruhl@intel.com>
 <406d5451-0f09-df2c-1b49-4e643e605a24@linux.intel.com>
In-Reply-To: <406d5451-0f09-df2c-1b49-4e643e605a24@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA3PR11MB7653:EE_
x-ms-office365-filtering-correlation-id: 0920aaed-9c19-475d-3d28-08de5e7354b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?20Vm43ObxmgykPJkk9+dz2ioSK5sOLgDxCNrhCnjQF2JXeIxJ/k9k5cJXu?=
 =?iso-8859-1?Q?aXvG5uqXTR4bsAajMH8cQKHKTJtWrQqEd9xJYJv5jCBUQae7AvYLfelbpL?=
 =?iso-8859-1?Q?yr9knk3iy5s+PNsvDH1nXC9h0q/S4a0W54eXwnlELmcNgoB7kXHmKO3J4W?=
 =?iso-8859-1?Q?MB/InhQK5LwymHmT0aEmgaTo+Fc3wls9VtntFKkX6rb7H+DTnONU4Y8eli?=
 =?iso-8859-1?Q?fxgxb5h3bg3c2k/IqOTHh8BlAKfeKCdOPZHP1P1l/2fQktcIj4nc4fKm4Q?=
 =?iso-8859-1?Q?vuhdFlEzA4zgNLIxzOCb6vVSdP9BZ8ygccJ+pR2Mlef2y3YqB0MxZMt+Rv?=
 =?iso-8859-1?Q?B3dh/oGNO+hZnOEFV45Y6+gtA8168NMFaMQhv4bTGYoZ96EW7Mh34VIU6p?=
 =?iso-8859-1?Q?Ee/2qa1Bm1OhxL7zFljYL6Iu53nKoF/8jnWuJmGlJgJaLlpzLAktZNdgDi?=
 =?iso-8859-1?Q?LfpEjgec144uaKmWtIGBeulb3jON5l3pVc8jJu8YtHohpFOgJvUA+CLKZ3?=
 =?iso-8859-1?Q?ouG96caH+06I7yedHfCQtP1D2sfz4U2cAzb4tojX4xdIOGuCROU2qOvo0B?=
 =?iso-8859-1?Q?YvpayG3E/EJgOH9G31REO/GiES+3wFVS84u/yDN7lDc3EEUIbaRA42HgR7?=
 =?iso-8859-1?Q?Pd7TCmvKiVda333EcoJfgsk2Fvbcourum0VjqPom4enMXIWUhCtiRBePSe?=
 =?iso-8859-1?Q?7nvJJajuJH5lbfrT17ELXDc+Sj3spqe2CJjHECC4B7jdprTxmk902DpAcf?=
 =?iso-8859-1?Q?GxB7PYjZnx106vV++QsTtJmDMKFFqXaMRpX/DxFBQx/Lq2GA5xk6IC0rwN?=
 =?iso-8859-1?Q?vkr+1T0v1+I/wE8L1YxXRYwk5h//Afwhc9+CCnjIFWaOP1sgjUK8t54SLO?=
 =?iso-8859-1?Q?p0B4I/HcCQ0Hi22dYrUWOxU1iw6n3+dqpe6Cgw8F7Rc0zW4Ntqxlsc4YSX?=
 =?iso-8859-1?Q?ZI+bHNP4AgRulQfK2RS392pEt8W+tvqlM2oOiBtMGA+Qhjd/xHoqtknnej?=
 =?iso-8859-1?Q?sZrmy2JU4rowZcmPYsQbz6yMGR93GaiMOfXzbH9qQTBLtYyr+fPWeunRMn?=
 =?iso-8859-1?Q?sElZGd14Nmwp9tGWtT7wYFmhBQw695fpvyGvvonTjLBT3ye03i9+Oo4hLA?=
 =?iso-8859-1?Q?zPtJ8NuHl25lxJizBrYfjzsrMkMxDj4ueJ+/qHkpboazU3pwpWffpyzHKA?=
 =?iso-8859-1?Q?BBxDqW2dTl/i5mzYAvh7Ttk0sb3eDSXYLrnxBcHFA4LMKZkY6DFNkTFpi8?=
 =?iso-8859-1?Q?nxc5F34jeJlIeLvs+w/RLZqlLxFYpWdBnA7ymvpaK2haem+iAgPeHdvOTu?=
 =?iso-8859-1?Q?7cavMDOOQERZfPr28sMJRuKIHD6XtaKlaK5BvtyN1lXV0EjxxRG3i/U2rr?=
 =?iso-8859-1?Q?ixioY3ZBTKxVlbpC5zvYhGGnhRyjKuOwCJ1uE8oBXTxqrtHa5rnP/73fTl?=
 =?iso-8859-1?Q?KK0om4Dzt10C/nWEnVEQEsT7vacbjilqxqCsD7a4ooOUZquelSbN58J2qh?=
 =?iso-8859-1?Q?owFd2C+7So4dIg4brEuNu7kf9GU2Ui9Rhjdbl/XwpRR0ameI4JUrnerQYZ?=
 =?iso-8859-1?Q?qAJfn2hy96igGEY7h6hjjljg9iCspGO9Q4LE0BUMirtNUYBFdOpjy+t25n?=
 =?iso-8859-1?Q?F71X7bAdus09aslQ4RZU7JM2+HvwwDEgTftqAqerN9VEoqyb69UjZn2zvN?=
 =?iso-8859-1?Q?heILLLnq5kVFsRDljL4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?E0SDrbPLMqxg+gB/CVm//rVR5k+DYSrJWi6lBdAv0gAAt9tI2K7DZUYai2?=
 =?iso-8859-1?Q?0wcf/DpO76BPFe7WMNm9RxDRW3dE9pZjhmKHgZEgNUCy9TwfjJemJ4WdXs?=
 =?iso-8859-1?Q?8LoVMM6P5LgAXi2NEZpXV+k7Vm4O+zwli2K2qeUDk+4LEceunkmJhAixs7?=
 =?iso-8859-1?Q?p1W0nhnrbHhr9pVjKO3bbwfnhZYC3geWhQnqapXr7eUIrGHZxqFpQ7H9yi?=
 =?iso-8859-1?Q?V1B8zcjgHBM0mfW9bsGvDFaOzVl/1+TxXNbJvwuPdX/F3Tue8o8E1mEfk6?=
 =?iso-8859-1?Q?zfHd3oRo35p2jlAv7bmICiL8p3Hz6JNgVBXI0A5VtdCpS5kSoABAQAwtBT?=
 =?iso-8859-1?Q?nrWFZNmsBj3lMtU3lLy37xRlRJzkHQRHFA5meb2GeC2y7DP4UdKOjWxolf?=
 =?iso-8859-1?Q?mO5dEkPzx3/8lYdUQQ+Pa+Nakc86QsgXZEJBwKzMMJ0StEzKr4TMKCnVJ/?=
 =?iso-8859-1?Q?GlFeXDuDO/rczA9hiZInIqNtmtHaU5Hz37wm4PC0pnc5zkuSLoGI91gaZy?=
 =?iso-8859-1?Q?Bh7d+dRhK0zDmxZmQTJpZXexiszGzLffgs/xjoLQ1Qg6RW/EKQO+nH03dU?=
 =?iso-8859-1?Q?FvED98wHe0WXLr1gMI6InnIbrFOqeDBBWIivH5VjCw+QqGRfXKu8QcipN7?=
 =?iso-8859-1?Q?xRUENeM0cSk2Lf88VMIwAZ/t5qyKzcJ/cYRwIQ4/NZkKeRNbjOW6HvJiam?=
 =?iso-8859-1?Q?WXnt5jmPLo9Ctw1AF7btzntftYiTx7OsCYrLO1X0hjw9Vukb0ARgJ6nd8A?=
 =?iso-8859-1?Q?V4lV32YK5+fn/l/V6CiNEuoHkBNba7y165PsF0pUlh67wAkTu2YZyHD1Dz?=
 =?iso-8859-1?Q?vjAvWmNITrgvpxArEQbDbppy9FDo65DKcFyDAyiWEOSv5OFeS2MXyEDxeQ?=
 =?iso-8859-1?Q?6bQzwwD9KPxDZSJroXdaGx16Dmng0i5W2pXBZWb/hWuvZVV82uOxFZSfOZ?=
 =?iso-8859-1?Q?qBCLYo/jeI/gIoFp6Tz7WPrNLrK1vZRq5b75NYf7u4YxeyU/xIzBnYDKiK?=
 =?iso-8859-1?Q?6ANJvG1iaz3zO9EYyUiTSet52fose4qsvKswkREqjx5YpF7NDsyg/vITeU?=
 =?iso-8859-1?Q?LSfvnjKb+jjfD4MBG48LdcFB/As+8qP0rmIciJCq5W988VUU3HO0h3x99T?=
 =?iso-8859-1?Q?ZyPCMzc1JND+7+04r/FlL7zEapPuP3sL2zd4ZF++GkobUwW83tcqiL3pAd?=
 =?iso-8859-1?Q?8Sv0XYay90SK650GPGUp+dFETao2LtYEvZgVyjjlb0d0r8FiHdVxT7WRU1?=
 =?iso-8859-1?Q?TpRRShM/YJ1b7hLu5n27dBdLKeMekQn+KEmjHwiRM+Mt1dbg4qe0UBhx7S?=
 =?iso-8859-1?Q?6MK3bwAm78NylbvrDWRjej/rt2kcf1tOTpHTLIX/rOW/06yUmZ4c67rqFh?=
 =?iso-8859-1?Q?280tAFA0BVfEjs9sm/v6rqAzpmwX7pQwSFMCEbk1GPc1PnrW0Rt87zlONk?=
 =?iso-8859-1?Q?JrHAB//N8a9vKRljBJ+qsAzdQrNt1K1+Igz2uGhs364sXw78zELf5WxB5I?=
 =?iso-8859-1?Q?0jWAlyodEx242pMfSQRBZY5eC2u8yWvaD/VzxOddFQyQuqmBBpPTWXDgRU?=
 =?iso-8859-1?Q?0B+HYKmD34erAl+DT9VQDOQ2Jntwr5EqaWjdLCMokWn4VvP1yfUBiXd68W?=
 =?iso-8859-1?Q?/pjRuPm9wqAPM87Ls87ZBP6UkfKsPxODQsanh2cJymRMvYc3eNjWz1yCUl?=
 =?iso-8859-1?Q?mUy9I1K9gBXKBUJenC394W4Vr7YXRgTh8d/wMayRhcowL0QvjToKNOODay?=
 =?iso-8859-1?Q?Yhgpa0CmQnLeHiN9kC+gVZHRCQfpcYnyFxNQ4pCJFhHHq3kax32sQO0RY0?=
 =?iso-8859-1?Q?BmWsrcEu3A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920aaed-9c19-475d-3d28-08de5e7354b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 13:44:16.8367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhWQFzTw2Ip3Ql3crgD6aSLeh4p7RqTogqHvEYBObPu1D2HFWGuGuekTdeI1oaw+c7gyQAk317zIFZmTxHDjzUlLuF+D7HcRB8vupZDNeDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Wednesday, January 28, 2026 7:27 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hansg@kernel.org>; Brost, Matthew <matthew.brost@intel.com>;
>Vivi, Rodrigo <rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com
>Subject: Re: [PATCH 1/5] pmt: Add register access callbacks
>
>On Tue, 27 Jan 2026, Michael J. Ruhl wrote:
>
>> Some HW does not have the explicit access via MMIO.  Allow
>
>One space is enough after a stop.
>
>Please reflow to 72 chars.

Will fix.

>> for parent drivers to control access to the status/control
>> path.
>
>This sounds quite vague compared with what you're doing (adding ability to
>provide custom read/write accessors).

I will reword.

>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++-
>-
>>  include/linux/intel_vsec.h                | 26 +++++++++++----
>>  2 files changed, 55 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index b0393c9c5b4b..978b35d56888 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct
>crashlog_entry *crashlog, u32 bit, bool set)
>>  {
>>  	const struct crashlog_control *control =3D &crashlog->info->control;
>>  	struct intel_pmt_entry *entry =3D &crashlog->entry;
>> -	u32 reg =3D readl(entry->disc_table + control->offset);
>> +	u32 guid =3D entry->header.guid;
>> +	u32 reg;
>> +	int err;
>> +
>> +	if (entry->cb->read_reg) {
>> +		err =3D entry->cb->read_reg(entry->pcidev, guid, &reg, control-
>>offset);
>> +		if (err) {
>> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
>
>Please don't ever use __func__ in prints intended to be visible for normal
>users.

Missed that on my clean up path.  I have removed the __func__ usage.

>> +			return;
>> +		}
>> +	} else {
>> +		reg =3D readl(entry->disc_table + control->offset);
>> +	}
>>
>>  	reg &=3D ~control->trigger_mask;
>>
>> @@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct
>crashlog_entry *crashlog, u32 bit, bool set)
>>  	else
>>  		reg &=3D ~bit;
>>
>> -	writel(reg, entry->disc_table + control->offset);
>> +	if (entry->cb->write_reg) {
>> +		err =3D entry->cb->write_reg(entry->pcidev, guid, reg, control-
>>offset);
>> +		if (err) {
>> +			pr_err("%s: failed to write reg: %d\n", __func__, err);
>> +			return;
>> +		}
>> +	} else {
>> +		writel(reg, entry->disc_table + control->offset);
>> +	}
>>  }
>>
>>  /* Read the status register and see if the specified @bit is set */
>>  static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
>>  {
>>  	const struct crashlog_status *status =3D &crashlog->info->status;
>> -	u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
>> +	struct intel_pmt_entry *entry =3D &crashlog->entry;
>> +	u32 guid =3D entry->header.guid;
>> +	u32 reg;
>> +	int err;
>> +
>> +	if (entry->cb->read_reg) {
>> +		err =3D entry->cb->read_reg(entry->pcidev, guid, &reg, status-
>>offset);
>> +		if (err) {
>> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
>> +			return false;
>> +		}
>> +	} else {
>> +		reg =3D readl(crashlog->entry.disc_table + status->offset);
>> +	}
>>
>>  	return !!(reg & bit);
>>  }
>> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
>> index 1a0f357c2427..5416f84aca40 100644
>> --- a/include/linux/intel_vsec.h
>> +++ b/include/linux/intel_vsec.h
>> @@ -80,16 +80,28 @@ enum intel_vsec_quirks {
>>
>>  /**
>>   * struct pmt_callbacks - Callback infrastructure for PMT devices
>> - * @read_telem: when specified, called by client driver to access PMT
>> - * data (instead of direct copy).
>> - * * pdev:  PCI device reference for the callback's use
>> - * * guid:  ID of data to acccss
>> - * * data:  buffer for the data to be copied
>> - * * off:   offset into the requested buffer
>> - * * count: size of buffer
>> + * ->read_telem() when specified, called by client driver to access PMT=
 data
>(instead
>> + * of direct copy).
>> + * @pdev:  PCI device reference for the callback's use
>> + * @guid:  ID of data to access
>> + * @data:  buffer for the data to be copied
>> + * @off:   offset into the requested buffer
>> + * @count: size of buffer
>> + * ->read_reg() when specified called by client driver to read PMT stat=
e
>> + * @pdev: PCI device reference for the callback's use
>> + * @guid: ID of data to access
>> + * @data: buffer for the register data to be read
>> + * @offset: offset of control register to access
>> + * ->write_reg() when specified called by client driver to write PMT st=
ate
>> + * @pdev: PCI device reference for the callback's use
>> + * @guid: ID of data to access
>> + * @data: buffer data to be written to the register
>> + * @offset: offset of control register to access
>
>Have you checked that these don't generate warnings and how they look
>visually?

Are you referring to the kernel-doc usage?

The read_telem(), read_reg() and write_reg() do give an error with .  I hav=
e cleaned them up so there
is no more kernel-doc errors...  Is there something else to look at?

I used:

./scripts/kernel-doc -v --none include/linux/intel_vsec.h

And cleaned up the reported errors.

Thanks!

Mike

>>   */
>>  struct pmt_callbacks {
>>  	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t of=
f,
>u32 count);
>> +	int (*read_reg)(struct pci_dev *pdev, u32 guid, u32 *data, u32 offset)=
;
>> +	int (*write_reg)(struct pci_dev *pdev, u32 guid, u32 data, u32 offset)=
;
>>  };
>>
>>  struct vsec_feature_dependency {
>>
>
>--
> i.

