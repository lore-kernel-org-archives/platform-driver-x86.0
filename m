Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38321B9CE
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Jul 2025 21:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924166; cv=fail; b=odzZZa/M00BmrvxnOY8lLUFgg4o8thplPcP7cfSaaSaK/pO25gePqXrt8Jj7qmI+Pdiz9GqSwyjTuIbWYGUscFCcOT3s5WS19Cxuz6UlIwsvQrZiX9ZWlamKgOl168Q4/D5lNEsgtZ4+Tvnjkjj+NGZDrC3isQpmPH03X1cZAiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924166; c=relaxed/simple;
	bh=IpRsoJKQiusDIXL44BYUd+hQrKCwQiK5g97BiJaElpM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L//a/G7oF8+5pCJjt7QisUt82p3FhMJXilaat+W7m9GF9VHT/tHBJHukZrtFJqaK7AT7HKGPFLQZ+a+jxEXtlzxuUCTEM0dtyv1AvxQA/r2SP5cyWSInCiGQp1EQ9l9oi7hL2BD/g3qee9+UN1o3JW32KQlUD369zWgxBxjblvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWcnYtmw; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWcnYtmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751924164; x=1783460164;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IpRsoJKQiusDIXL44BYUd+hQrKCwQiK5g97BiJaElpM=;
  b=UWcnYtmw97aNi0U/mjzf8sluOAX2uzRlQzSNkpXB85sn5zGtpauHVFGf
   mRs1CZ+vzOt/1b11GTutWwp/raB74o8kZhftWjkN+9Bq0uV32LWE2S2Rt
   REPZGGs0wpJ2I09sOWY38aLWkYEuTURKAhCbiqcKI65RjNEDlzHiTwg27
   X0SRRhQZVrMrkBZhKYhPlZsI0y7xHxKEqYdiQmOEVP3ophnr0IwvCPsDP
   8RSnetvXMU7oJJtLIAYz1IWpHMV6SpExdDOHnpmXDRlf9Jw+Stm709PFn
   PcEu5BUIspoMoNvjJicL9G6rXYPhFccmQWxveHDROz0ojfC2DBIUxSXC8
   g==;
X-CSE-ConnectionGUID: h2Y+7+WmRxCbD8NEfzeeVw==
X-CSE-MsgGUID: A8hrUbiZSRqX5mlFlaQ1Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64845151"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="64845151"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 14:36:03 -0700
X-CSE-ConnectionGUID: g3E0WFnzS8id69fZAu9diw==
X-CSE-MsgGUID: zIi80bRyQyq1x1LZAqMw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="186272373"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 14:36:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 14:36:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 14:36:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 14:36:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaKGl5E05yAXuF1w1TzQ3VD5Usu0mKuW01Fhj1oGJMZQpK/KGnrk5WvLKBpBnnm+6+X/kE51hP258OxNs3rhFVppypwzzNToe5Swk395pYtC9NG+kn3M9w2DJkqtvogPyidqnhpBPd4KpjN15npbgCH6YH1PV759UVCO4hnZC8MjwHepJaU8Oz2yl9fAHmQ3nZ8L8wnweoGcRRFUjcHRS6qMElWvnZPk1wNGpFYntezho8nPcDP9MOySXUvRj+PVjdGwSYhskFV4lfwkc7bxq3SLIugg8WKLLlSgiCbT57OndGTrjdWRw4ZMbk0zrcnP6FukBZd8dsZhGq3O8p+bQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlEO5GER8ddKRHUKnhuwAvsy3aIoZlXvAFqiJ1wftoA=;
 b=SzVqLLC/RIUzQXELx50eCn8443wdjU8FH5E22iXjeJjvEMTY488K1/J5aM2qxpdoNlyHt+daFR0AGFDCnD8/Jq0BIGfbgAZXockg8rLDWTns8Q3y4UlxvVbPsfZj3enSibdX72qmusyL2h2a+tkCcjLUzWjlDTwfX8qnbQpbZ7K3k47ZCW9VcgCcEIfAolZa/XQ3r9NGUYdB2MnSuKreZkShL0mf2rKo3RRpMnWuodKlNY9sywTzPioCExWm/ZXifzqJLXJje0x5QhTdUvtz7NNBZqBbYsw9Obed00K3xASNewAVvsRjN47ihXDY9guBYE2+zTLSRF0bzPdENDMqDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Mon, 7 Jul
 2025 21:35:57 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 21:35:57 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>
Subject: RE: [PATCH v6 12/12] platform/x86/intel/pmt: support BMG crashlog
Thread-Topic: [PATCH v6 12/12] platform/x86/intel/pmt: support BMG crashlog
Thread-Index: AQHb7F8+zWS0yGVMiEi7Pidei81MWrQmsiaAgACCxaA=
Date: Mon, 7 Jul 2025 21:35:57 +0000
Message-ID: <IA1PR11MB6418DD7383375F0720715270C14FA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
 <20250703211150.135320-13-michael.j.ruhl@intel.com>
 <57cdcf8f-865c-9de1-5adc-7996237dd9da@linux.intel.com>
In-Reply-To: <57cdcf8f-865c-9de1-5adc-7996237dd9da@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MW5PR11MB5906:EE_
x-ms-office365-filtering-correlation-id: 6698f4e0-4206-48bf-ecee-08ddbd9e42b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?qxz5fuO3ywb9W1eRwtcHUfaoKqSuZ0GA+poLZ5RX8NACrexvBFgYF672ar?=
 =?iso-8859-1?Q?KxJ46vfcj6bBP63fSlhhNzMWWBAyhPyn7ZYhflacG0M6FQ3FatMg1R3FXr?=
 =?iso-8859-1?Q?NQrgUu7/mM+r7sPvEdUvrRghngzAEcOPMd6jR/52pqkOs2Al7M5eaEh/Kl?=
 =?iso-8859-1?Q?l3SKc0AKN0GUkHNhnjU5GF5Sk4lTsOnRRnQl54i8e0BT9CCYkq1mCc3eEx?=
 =?iso-8859-1?Q?IWG4hZ2ZMQnmcBAAfK0972jNiCoFUw4+jxpj5KforNSRKFFppoxQGc/rv8?=
 =?iso-8859-1?Q?ltyq2kM6vaXv0zIhwD4iqAmvXI94vWk2gwMt67mkzFR/mixLH0t6Iz4VqP?=
 =?iso-8859-1?Q?WOFzxlB7P63JOkkvx5GsMzlmauqYOW9fpmDxRBgR26+D8t59Sl7aZBoErx?=
 =?iso-8859-1?Q?5QqD4lDrr8eQ4HuShxZP6NNZxB87acgQKXm29mMW6VB823rPE8XzU9hSjJ?=
 =?iso-8859-1?Q?vk7E+Ly2zHURRLcS3OWvjQEUCkJyLhLyC4qzeOdJD4C9mHAm/TuXrtVOj7?=
 =?iso-8859-1?Q?LG3fE/tvH+zNZ1ozKMcCAvWnI8Q3YZrquKwKBfoXaqz8Y5L2SmDncvFMY/?=
 =?iso-8859-1?Q?b5P1Q9JE0+6++R1BpAz0/x7UgWApzir8JeYXQEkt4+u+CCtfcd0E3VwYJZ?=
 =?iso-8859-1?Q?sCmffCMD3yd8Io4iLsCTcYLPtGPpC9ZU+XwdKElW0MFTcb+ZzykSl0w5ei?=
 =?iso-8859-1?Q?zhMybEY0EsfwDxZ5lb+Nk7aQ4jCWYAKSG3GYIIPRXCX8G9ik387yq2XNBs?=
 =?iso-8859-1?Q?LFJwL/Hm/8boFpsghGaGpXeLJINo4DlQGv9jwGEZlQOtNAT1g3/vUCmwrt?=
 =?iso-8859-1?Q?lZqgU9woT4TgPwdqWEgC8vGqL/FFRZ9tOTPehRwLywkv30TUwvbwkT149E?=
 =?iso-8859-1?Q?DdBsvgiePFFKyPKchjhJk/4uLS1qTqSyI1xcNTrhrHlnqNAjW+Tmkrc/Q0?=
 =?iso-8859-1?Q?xNnKwEo9/3qBfQsLn5jroChttorJOjVV04vJ9AzX6eSA1QbczJZlPF+7o5?=
 =?iso-8859-1?Q?gBwvx6S17EkfoZSKMGrFZ6dNzPSOeO0PaxnuN99W0L7zn9euTMCsf4uB38?=
 =?iso-8859-1?Q?dMLggSR4cpVo/tAnB3/KikOeaALE47W2cSyqMoYmNJh3M6HWM3oJdhlUT6?=
 =?iso-8859-1?Q?LlUvdWP2xvvuSPCR2StuTzL5wETkLsJfofMbeqJp4Lu8o5uCOV7UPtE9KQ?=
 =?iso-8859-1?Q?iAoy35s/MMC7q9N4CnL7oShXL7ZoTJynu8wU6QJ4t/dW+oIQGaVnnGoDHu?=
 =?iso-8859-1?Q?T4GNF/wX3TXU/GO3razSAxE07glFSRxB0Ci6zTYFsyJLI2bzEvnf7P90ME?=
 =?iso-8859-1?Q?msJHEMJA6QMW/4KpWWVEnaAKTNrVBiEt+UcnHgOuqpq2eQWMqI/djuA0DP?=
 =?iso-8859-1?Q?QFneNq2QFGwMjBx7m74O+qQID9U4i7nDDkv4NvNR/yYdiJTcu+BLmy1Jw/?=
 =?iso-8859-1?Q?kIo2lS7klIGWTO3Zeuyc9VQPI4DHXwAXmiz0x2JtvjO68zPdxSTR/zQbWg?=
 =?iso-8859-1?Q?oj/5cJCcHm64ukHvAB51Yd3kxCZHBakJ9ioyUks2eL0A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5tWCcxOd/EtXUohYfHRZnSRcNp1qymw0L+4mRLFAvDPEJDM9vVgzXSnn/U?=
 =?iso-8859-1?Q?c++rj2tM239JcA77S7ZsElJATAb+MQpvEdGCg/1jwxS78XQUTuV5VUZoJy?=
 =?iso-8859-1?Q?F3Zq/Le7ROnrfuJ4wH/JtFziog42q+tstkAbMsbl/jt2mLj+ZoB/RyOKmD?=
 =?iso-8859-1?Q?SHfIucwqGOAkMgneraXWrmpZnYFKt8LpeUfgLCEFvsCQFVUhMMapHPIaT9?=
 =?iso-8859-1?Q?fteJeKTCR8hx/TcvRsukuSJL4AU+tDW1uOIPzYKylGOjYq2E6YWlIY2SYX?=
 =?iso-8859-1?Q?gkD4Rs8qh1lFD7JcNthII38ZvCiHk3kLk/eBrT6+RbuRjagdOMwCHjOluA?=
 =?iso-8859-1?Q?ALnVGF4djMvfCvxpQ8aDiUvqaekVw783JPufD3TYCKOpN3+ucznL3JFO+a?=
 =?iso-8859-1?Q?t5W4qYssqV+fxX7uLViNeZp48VEBxltya/BZ86ztSc6ydqMznWNtcAUQj5?=
 =?iso-8859-1?Q?IqTuQbphwKYr1g2hfQxuuaAsa8v9kCcK3jZmW7iiEVBglWZNA+6oq01Voe?=
 =?iso-8859-1?Q?IBsDIq4I8SLmcsdU7S7T2lCX3d3mL875LEp9r2ah0nC/aMbKAyPgDH1VFg?=
 =?iso-8859-1?Q?r8Fc7MSFyvvUih9XfKpl6EcDHhb3UfIxngobvcp+cznQU6dk1Uy8s05fa+?=
 =?iso-8859-1?Q?/is1j+XxEoXpry+4C8ZbBp/8Gc4L6nNeE6F1tgu1b2gDnn4YaoDuoQB2X3?=
 =?iso-8859-1?Q?BOReg2E3xssrSgX/BIggOxcd20zAds8oa3RQijAtUfmuodt7/CSrtB93gM?=
 =?iso-8859-1?Q?h+C590weMC9A69FNGkl2CJwupKz8CP4G5BTMo9KiclOxDXabLJ04FC3Rv9?=
 =?iso-8859-1?Q?9z8gdO1bOYT+yWtXsf7Jevhmo+gm+UOd6F3H274tPGzhRA2lhMHj5REdYe?=
 =?iso-8859-1?Q?zWw430KmFbchMkll4Ghgx4NtxC/GtesBzTItPtTuBUxKqMW7BYcWqsGEpf?=
 =?iso-8859-1?Q?AXNFVcklF3DUhfHm7lWzE2uYn8oHKsSI/GGukld8u5z/TQaQxTigyrfYVn?=
 =?iso-8859-1?Q?AZFdd/nyZp2+3elWxr/X3Btycp++WzNvgFF+qdXWMHZBQTdSbi2sosr8eH?=
 =?iso-8859-1?Q?XLTw4qA2P2S+72/NLXbs89G62+zKzngk9vbsofKZ8j3LOiQVNc7WSeS61u?=
 =?iso-8859-1?Q?UrE4c2CauoevXmWvGudZe24ydlLzvK/NFGahzqYycGsOmqmn56Q6u2bT/j?=
 =?iso-8859-1?Q?YWPDgeyrZWTqnAWLJsTBMvUoOpg+dc/IJC+x6P5YpmuRvA11lfATl82yDl?=
 =?iso-8859-1?Q?hJLglFcH/6/adv7tV+wVBZfDBIqPjyFVcmYJ454y0/UpJMakSdBr7sRPVf?=
 =?iso-8859-1?Q?e7LmZg+IXlDhKueXYPqFXYWPXDvP2k/fbKwKVi/RYWIgX/NkWiuuRPp4dk?=
 =?iso-8859-1?Q?k94ExPeI44S4OeUDGSoFCNuZCKhMxn3pvPUgSrTvGoK/NeJw96UuAoq1Rw?=
 =?iso-8859-1?Q?HaFR1TjJLLDAXwnJEQMPREouwUMycfVhjGMgPpuhixqnVR4vuYXYTx61lW?=
 =?iso-8859-1?Q?q2uaPpGShaTSZoj/3sRbENeqgRV0wYmaeEx0o8MXzvxMYssFrWoOBNSkAT?=
 =?iso-8859-1?Q?fs2eeW0b1SV3WNvctMxL4ZAmcIsxh/6XnoDiu+jgQmnFV5hrfpFSaMfYan?=
 =?iso-8859-1?Q?y4u04Ryr981mrvOwd3YkHZWiU4bi7JbS5k?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6698f4e0-4206-48bf-ecee-08ddbd9e42b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 21:35:57.8096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fsvPkUX7GguY7AwUttHlGsJ1VAL+4x9/umM/unI7q3q6pjPOAiX6mTPBf2eCHglq48Pv9hSo9XJJI3kaPYZhW74/RCC/81M7AtlzFS1pgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Monday, July 7, 2025 9:46 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hdegoede@redhat.com>; De Marchi, Lucas
><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>thomas.hellstrom@linux.intel.com; airlied@gmail.com; simona@ffwll.ch;
>david.e.box@linux.intel.com
>Subject: Re: [PATCH v6 12/12] platform/x86/intel/pmt: support BMG crashlog
>
>On Thu, 3 Jul 2025, Michael J. Ruhl wrote:
>
>> The Battlemage GPU has the type 1 version 2 crashlog feature.
>>
>> Update the crashlog driver to support this crashlog version.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 268 ++++++++++++++++++++-
>-
>>  1 file changed, 255 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index edc41144909c..35c19e9a2bb6 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -53,20 +53,52 @@
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
>	(TYPE1_VER2_EXECUTE | TYPE1_VER2_CLEAR | TYPE1_VER2_DISABLE)
>
>Please use \ to split this on multiple lines.

Will do.

>>  /* After offset, order alphabetically, not bit ordered */
>>  struct crashlog_status {
>>  	u32 offset;
>> +	u32 clear_supported;
>>  	u32 cleared;
>>  	u32 complete;
>> +	u32 consumed;
>>  	u32 disabled;
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
>> @@ -87,6 +119,26 @@ static const struct crashlog_info crashlog_type1_ver=
0
>=3D {
>>  	.control.manual =3D TYPE1_VER0_EXECUTE,
>>  };
>>
>> +const struct crashlog_info crashlog_type1_ver2 =3D {
>> +	.status.offset =3D TYPE1_VER2_STATUS_OFFSET,
>> +	.status.clear_supported =3D TYPE1_VER2_CLEAR_SUPPORT,
>> +	.status.cleared =3D TYPE1_VER2_CLEARED,
>> +	.status.complete =3D TYPE1_VER2_COMPLETE,
>> +	.status.consumed =3D TYPE1_VER2_CONSUMED,
>> +	.status.disabled =3D TYPE1_VER2_DISABLED,
>> +	.status.error =3D TYPE1_VER2_ERROR,
>> +	.status.in_progress =3D TYPE1_VER2_IN_PROGRESS,
>> +	.status.rearmed =3D TYPE1_VER2_REARMED,
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
>> @@ -143,19 +195,23 @@ static bool pmt_crashlog_disabled(struct
>crashlog_entry *crashlog)
>>  	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
>>  }
>>
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
>>  static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, b=
ool
>disable)
>> @@ -173,9 +229,118 @@ static void pmt_crashlog_set_execute(struct
>crashlog_entry *crashlog)
>>  	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual,
>CRASHLOG_SET_BIT);
>>  }
>>
>> +static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
>> +{
>> +	/* return current value of the crashlog cleared flag */
>> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared);
>> +}
>> +
>> +static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
>> +{
>> +	/* return current value of the crashlog consumedflag */
>
>Missing space.
>
>But I'm not convived thes comments really help that much. ...If you still
>want to keep them, make these two comments, at minimum, function
>comments
>instead.

I will remove them.

>
>Ah, there are a few more below, the same applies to them.
>
>> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
>> +}
>> +
>> +static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
>> +{
>> +	pmt_crashlog_rmw(crashlog, crashlog->info->control.consume,
>CRASHLOG_SET_BIT);
>> +}
>> +
>> +static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
>> +{
>> +	/* return current value of the crashlog error flag */
>> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.error);
>> +}
>> +
>> +static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
>> +{
>> +	/* return current value of the crashlog reamed flag */
>
>rearmed
>
>> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
>> +}
>> +
>> +static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
>> +{
>> +	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm,
>CRASHLOG_SET_BIT);
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
>> +	bool cleared =3D pmt_crashlog_cleared(crashlog);
>> +
>> +	return sysfs_emit(buf, "%d\n", cleared);
>> +}
>> +
>> +static ssize_t
>> +clear_store(struct device *dev, struct device_attribute *attr,
>> +	    const char *buf, size_t count)
>> +{
>> +	struct crashlog_entry *crashlog;
>> +	bool clear;
>> +	int result;
>> +
>> +	crashlog =3D dev_get_drvdata(dev);
>> +
>> +	result =3D kstrtobool(buf, &clear);
>> +	if (result)
>> +		return result;
>> +
>> +	/* set bit only */
>> +	if (!clear)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&crashlog->control_mutex);
>> +
>> +	pmt_crashlog_set_clear(crashlog);
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(clear);
>> +
>> +static ssize_t
>> +consumed_show(struct device *dev, struct device_attribute *attr, char *=
buf)
>> +{
>> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
>> +	bool consumed =3D pmt_crashlog_consumed(crashlog);
>> +
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
>> +	if (pmt_crashlog_disabled(crashlog))
>> +		return -EBUSY;
>> +
>> +	if (!pmt_crashlog_complete(crashlog))
>> +		return -EEXIST;
>> +
>> +	pmt_crashlog_set_consumed(crashlog);
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(consumed);
>> +
>>  static ssize_t
>>  enable_show(struct device *dev, struct device_attribute *attr, char *bu=
f)
>>  {
>> @@ -207,6 +372,50 @@ enable_store(struct device *dev, struct
>device_attribute *attr,
>>  }
>>  static DEVICE_ATTR_RW(enable);
>>
>> +static ssize_t
>> +error_show(struct device *dev, struct device_attribute *attr, char *buf=
)
>> +{
>> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
>> +	bool error =3D pmt_crashlog_error(crashlog);
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
>> +	int rearmed =3D pmt_crashlog_rearm(crashlog);
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
>> +	pmt_crashlog_set_rearm(crashlog);
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(rearm);
>> +
>>  static ssize_t
>>  trigger_show(struct device *dev, struct device_attribute *attr, char *b=
uf)
>>  {
>> @@ -254,30 +463,63 @@ trigger_store(struct device *dev, struct
>device_attribute *attr,
>>  }
>>  static DEVICE_ATTR_RW(trigger);
>>
>> -static struct attribute *pmt_crashlog_attrs[] =3D {
>> +static struct attribute *pmt_crashlog_type1_ver0_attrs[] =3D {
>>  	&dev_attr_enable.attr,
>>  	&dev_attr_trigger.attr,
>>  	NULL
>>  };
>>
>> -static const struct attribute_group pmt_crashlog_group =3D {
>> -	.attrs	=3D pmt_crashlog_attrs,
>> +static struct attribute *pmt_crashlog_type1_ver2_attrs[] =3D {
>> +	&dev_attr_clear.attr,
>> +	&dev_attr_consumed.attr,
>> +	&dev_attr_enable.attr,
>> +	&dev_attr_error.attr,
>> +	&dev_attr_rearm.attr,
>> +	&dev_attr_trigger.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group pmt_crashlog_type1_ver0_group =3D {
>> +	.attrs	=3D pmt_crashlog_type1_ver0_attrs,
>>  };
>>
>> +static const struct attribute_group pmt_crashlog_type1_ver2_group =3D {
>> +	.attrs =3D pmt_crashlog_type1_ver2_attrs,
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
>> +		return &pmt_crashlog_type1_ver2_group;
>> +
>> +	return &pmt_crashlog_type1_ver2_group;
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
>> @@ -286,7 +528,7 @@ static int pmt_crashlog_header_decode(struct
>intel_pmt_entry *entry,
>>  	/* Size is measured in DWORDS, but accessor returns bytes */
>>  	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
>>
>> -	entry->attr_grp =3D &pmt_crashlog_group;
>> +	entry->attr_grp =3D select_sysfs_grp(type, version);
>
>Can't you have this as crashlog->info->attr_grp so you don't need a
>function for selecting it?

Yes, that makes a lot of sense.  Updated.

Thank you for the comments!

M

>>
>>  	return 0;
>>  }
>>
>
>--
> i.

