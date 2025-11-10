Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF348242D60
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762812865; cv=fail; b=azHPMQ4dlpSxT8uoa/vqpOlfSApFRk7mTOzVc87woTCjzzeIpR/hwcXN8Cy6Cgrp9+vq8oxeGSsrMLyG/tNTD+xh9E5E6tPGn3DIV8N+bOQow45mfItnVGOWoV5LD29T6IcqhphImhfknJP3P19TRxwnjVh9xe0gPP//Y1a6Qxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762812865; c=relaxed/simple;
	bh=7lBUiGko64ONRb9zVXX8jd0POvIbCyg1yksH2nkPTuw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pw4Zb5aC1FAy0auedglcVDleGlJ5M+WufYKb+KrS4qcZumyvcKd4K4nFCnEqhqhqY67gvRdiL3+uNbRRoH+F/hCJJcPsfmBPI/+fybRPS21tli/horsU5AeqUwq08f4Hc/QvLP8QsyewdhAVAsA4QLkocAWaaJFBoU/tZ5ezdp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVF5vKZs; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVF5vKZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762812863; x=1794348863;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=7lBUiGko64ONRb9zVXX8jd0POvIbCyg1yksH2nkPTuw=;
  b=YVF5vKZsi4Q88SPwGrBep/VwY0eJwikXQERjoN2t7tU+ZfJFRP4VZJGF
   XRuqVeDQpWfkZTMnzCCHqOOyW3czNvtowkeh2BFvKY7TFPR9/iBgbj3/M
   QBqw2bnjkq9k41q424uUrtDu7gTmihnIJQC/Qyqhkh/KXa0QjVBVq5jks
   K/6e0nlnkJCCKWz1UPdS2OhDowK4mz2DdCrg51cG5c7N9CYbN3wf1TJNF
   ZP++TwlrH1uLIiF2mdeVo8T+2jHp1hatScqmUp1omypVvBKDvn/RPwbYq
   d4JNccUcNnuNs1+DK/mMuLJ+WtNaZwT1OtncZFTmRDpy3qR61YkJQO+zG
   A==;
X-CSE-ConnectionGUID: uwHU6xflTaqfd8XIw+FcZA==
X-CSE-MsgGUID: tGkSl5D6RL69tFrFx4Fkrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64799715"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64799715"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 14:14:23 -0800
X-CSE-ConnectionGUID: vAKK+3KVRMqbbVmqV5jzFQ==
X-CSE-MsgGUID: qEfb5wdBTGS7KZOKD2s7wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="189229207"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 14:14:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 14:14:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 14:14:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 14:14:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf94exRk3YF+B5MZs50xLj7KHTnilm8l+5q+4B68vfRvVLiz+tfZIKML6JnqdHR5BVu3I5m4Xko6OcmDtZCj5aXp7CFSZliUHw9a4nDQXhS2rg1fS1GHRrSC7I/+QtmcXmzGvLdu5ybSoT8a/b1TrAfQQMoYF8fpH5aIej74yWHv95OJmKNxFI+1JsrqcuV3Y44bpLu+4VdCl73QWz6z7BLZMmgdhXkV33Z27PZjA4jjVA/PPtVB638dta5yjwg3igFNt1k2vJZ0VBxX3oNlkUXjDyICce3OdoQ9nIe9wNs23ajjteXcdMMDTCMbonMYztFTfmnJIk28TUxz3RudQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lBUiGko64ONRb9zVXX8jd0POvIbCyg1yksH2nkPTuw=;
 b=h00grhidlbx18CGJMCb6XnKULg2NVqvpUtsqsscpDU5A2L8qvEA368TruHVzdtolaCv6D2VcbuvsuSLdNLN/S4ghLis45IeDGkY+jyFsZ56x2nBr5O/dadnymNeFn5YgDZbVltpF0UgbGABP9l/UjSGkefqxZHg4Cazz2O6EScDlO+T/IaVQiKEro6W6E8ryRiU+5rT8dYru11R7jPeS40vLLzbf7l4eXXhmEI2CJFHlmDBlL+ckEYtTjIkX1RENgdvkJTrbqAReR0NO5R8P2VU5K9uhIJeYREkodlLPDq7/eS6smYqt1L6KtoU1rLi6sGv3PNdzRbOgdTEGUlLD+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 SA1PR11MB6824.namprd11.prod.outlook.com (2603:10b6:806:29e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Mon, 10 Nov 2025 22:14:18 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 22:14:18 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.19-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.19-rc1
Thread-Index: AQHcUo9bVB0p/DbaPky5HJoKgMcIOw==
Date: Mon, 10 Nov 2025 22:14:18 +0000
Message-ID: <9236ec2c748903e1c878e11fb9da2d9d5c246150.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|SA1PR11MB6824:EE_
x-ms-office365-filtering-correlation-id: 45d4d7fa-f3f2-4a56-1b5f-08de20a67dfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?c3YzV0lUOUl2U0JTYmlGSVMxZ0J6STE3eDFBdGV3Tko1Uml2WGNFOHdYK0R4?=
 =?utf-8?B?b0xVeWc3VnlyMXBDOXdUakNoU0t4a3JsbFV4VW0vbDY1aEZmZlpSQUhscVJS?=
 =?utf-8?B?OElTUU1IWVQyelN1TUc1bFlES0pYRktaeEJWdWc5eTJJNnlsZWVaWFNDKzJq?=
 =?utf-8?B?TS9mWU1ISnNxVlZFT2Z6MnpHd1hTdk5ubWxaTTM4dWlPNHA4R3IyeUU1eW1q?=
 =?utf-8?B?cVQ2U080N2lJR29CRUFBZDRWUE54dFRpYStQTkh6b2RGK1JGV0VjaStqZ1FI?=
 =?utf-8?B?ZmZ4elBEaHhHcG5rczg0dkZnc09VWDNUOFdFNTBCbFZMekFsQ1cwOUgvNDZU?=
 =?utf-8?B?d1hneHBlY1hYcU8va3dabHYzZXNaK2dsaWVQS0N3dnptU2UxS2hSaFBFNC94?=
 =?utf-8?B?bXNjM2YwcUlKMnlXVS9wRWZBOXNHbFZTMEJQUTFFZEhwNEc3ZjdqY2xvNDRn?=
 =?utf-8?B?L29JNFkxa3dKNk1VbHVxNkFEY3A0OFR0TkZMV0Y4RkxJNjlJUEY2YlFrb1Vj?=
 =?utf-8?B?cmhRajdkS01mbzNMck5yUHhCK1ZON29HQWJUUGM1M3REZnNlQ1lWNWhEeWR0?=
 =?utf-8?B?MExyQ3Bjd2dPQWxXTUFjbTcvengxdHdINzNRM29tV0JYazVjWjQ2dzFvaFFB?=
 =?utf-8?B?VEZQdkRRT1g3US9FaXovQ1VZK2N1Uk53dng2Qlp2QW5GVUhESUE3UXRsb05w?=
 =?utf-8?B?QVhZOG9SeWRSSW10ZHNIMDFKdzc4ajcvRzEvQlFFMlhud2FOSm5YakV5L1Qr?=
 =?utf-8?B?R1hkbWF2eC9RTU42TmRjYjNLUkFvU1FnOFNtR0paaGQ0STNBdHp1RkxFTi9u?=
 =?utf-8?B?QmtWQ1Nza0twL3UyV1dweHhoVTB2Z3RVNTlRN0JOOEsydDRiTXcvaDdmL3ZU?=
 =?utf-8?B?SjY1bjBGZDVNWXZpVFI4SVBvaVppdXMvTVk3S2Q1bzlKRnowSXlzWG96M3p4?=
 =?utf-8?B?K001YWtWRWlKTGxZKzlicE03NmNUZDJza2tXbjYvQmpOL0tka2puOVB1Q2dy?=
 =?utf-8?B?OUo3WkdGM3lDS21XNG51bC9FWWVHV0llaG4rOStHdWRCZzdVcUN4ekdCVG9X?=
 =?utf-8?B?bXR4YmxWaVF0NWloOG8yMXhqS1FJdmJZTWM1MWZxV0lVZ3RRc2lYWEFramoz?=
 =?utf-8?B?ZytGeHVsRW5LNGxjSDlQWms3ZXh6TVNXaFFzeXJSZVQveThGNUtxQTJjVlVO?=
 =?utf-8?B?djA2MlVEc0xHeFUvMnE2VnNqcjFjYVVMczRSR0M0amhYdW9zRkg5SGFCQU9B?=
 =?utf-8?B?YnVZWmhJZi9jM1FmdVRmNFF0WUxob3loL0ZjaTBhUzM1VEY4eG85WmJiMVFV?=
 =?utf-8?B?T003dElKMGEweEdvc3ltbVlFU3ptS3F0WjNPT1h5YUFjOG11Tkk3ellHTjlH?=
 =?utf-8?B?Lzg5RWxpdWhmaDVJVDF4UTZ1Q0hoTmlnSVY2ekJNaG1qVzdmWVA4amgwSTE3?=
 =?utf-8?B?RDhQbHFMb08rRUMrQlNXTE1lbEhkd0hEM2tXUkF1UkRzODg3citlRGhPTnRn?=
 =?utf-8?B?RjFvL054V09Lam5lZGgzSGRKNlJ4b3AvTThSTWZMdHVnd3FtRDhpZWkvcGpO?=
 =?utf-8?B?Q2N3Tm96R25tY0NNRWdROHBHbnpiQnlLQmN0eTFPMjZ5RFZEb3orTi9YdGFI?=
 =?utf-8?B?dGpNa1dYU3NmL2FFK1JyanRPVlhNaUJsMjE1WkFSMk5IS2IvelFoaU50Nlo1?=
 =?utf-8?B?YThnRnVKc3lLVnVCcU1tYWkzWjFQV0VXdXlhK3hNblN3cndUYXduUm1RUDJx?=
 =?utf-8?B?WGdLc2N2SFpGdHRqL0FSdlFSUHpiOEEvaEQ2eWhubnRTamNDK1MzS0k0enFB?=
 =?utf-8?B?bVh5NFBHQjQ5c05nS1lSRmJ1VHRQdzVuZ2FEVEpHUHcxaFJyYmF0R042RWlH?=
 =?utf-8?B?b29mdHFPYis5ZUNsZU9EcjFyUGpaODA0VlI4d21meStkaEZIMzdkOFVCeEh0?=
 =?utf-8?B?RWo0aWk3L1FxSnZYa1pYZElzOFZqaXB0YTFZQ2ZLcEsxek9jWVRsNngwL2dK?=
 =?utf-8?B?OUEwWDlOekE0UkxLQzN1a2tiZVIwdVI0U3lla3BwOE5RekY1YlNBZURmNVJy?=
 =?utf-8?Q?vXpaPo?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1R3V0VKSjh5bld3STNpblM1YThkbncrSHdpeTRteXR4Vmd6VEdadFRhWFlw?=
 =?utf-8?B?dkMvUE5Rd3FZb3FRM2x0dTJYeS9OaHZkZzR4b09OV1JKcm9VbDFUMVpjVjI3?=
 =?utf-8?B?UFJVMWtkdVVhbm1ZZ21ub09TYW5GMGRFYWJaWDVmM2NaaU9RMDZReHRIcGxR?=
 =?utf-8?B?Smk1bC9LWERrbU9IK2NDalE3YVJ1Y2NkU1E5eVBxcXh3bnRON2NLeXNMNzJN?=
 =?utf-8?B?NVhOT3JhVDlzRmhvRzBjdGlDTWI2UE1hZ1k1SWREMFJmVDFzWmZIVi9GeUNG?=
 =?utf-8?B?M2dBc1MyYUtIdTd1Z2ZEcHJOTlljeG1xd0JCTldhY2ZZSjdjb0IwNEhPbUZD?=
 =?utf-8?B?c1BJdGlkRnVtQnRJbmlyeC8zWkRUbUtmZ2tLSm1vTGRuVWNLNS83L09QUmJJ?=
 =?utf-8?B?OHFMUTNkMm9FZExCTzE0QXR1eWJzQy9oVkpTa0dONUxrL0IyYVF6Y0FyTzJi?=
 =?utf-8?B?bFUwYlBjeDd0emZTOEtocEtzQXk2MUU5ZDRQemtWZ0x1QytLUVNRU041NUxS?=
 =?utf-8?B?TS9PZUFsa2crZE5WdGxkYmY1T0xBYWN2aldXdlBVbWRWWUVMNzNhWExoZXV6?=
 =?utf-8?B?TnlXVXhqZUxTTlFKNlFucjBGVktPRWxTRVZkYUgyOWQ4S0ZsZXg3UzBiS2hN?=
 =?utf-8?B?d1NKVVNrNGJ0RXgyT0JTbmRNVjB6OTBHb080ZndNbk5hQmcwRmQ4RkpaeUxv?=
 =?utf-8?B?dG8vWkpsQ2pTSU5BblZKNlZLOWw1bGR6czFpcXE0aTAveFlLdStqRFlIZm9o?=
 =?utf-8?B?Q0JpUTNXeEtEa1cwUHNoandiZnhtYmpzM0pQZ2MrdE9pUFJyc09NRy9uZU5N?=
 =?utf-8?B?UGUwNG9oWGZSU2dvRTQ5alVRcVVOKy9aRTVUeGRXbjNSYzl1d2lGSDk4ZUNr?=
 =?utf-8?B?a3JoQVZZcGtlaHIzTU1aRGVtalJBdENlZFQwZ2pOTDdVL0JhWEJqOVp6bEhH?=
 =?utf-8?B?eXB4K3A0ZnVyMFBycG1iaGloelJCb1VES0dkTWRMejczUDRHeHBxU0N2MnhD?=
 =?utf-8?B?R1NHc05iT0VoNmIrR0c5OERRSkJ6bHhXRlBQZzA5Y1ozOHJzalQweXRpb3ZD?=
 =?utf-8?B?MkI1ZC9TdlhhVnM5Q3VsYVRoN296R1VpNXdQQytZWHFKSzFQSVFLVEYyVjdP?=
 =?utf-8?B?QVViY2NMMVFTZUxuL1ZlUnlXRy9RK2R2SUp0ci9VQlo5RlJZb0x0amdLTENp?=
 =?utf-8?B?U2FjMUpVdWhDaG9ITGtWSEh4bkFBM09vcmdPZEtseWtxVWxMYVBtTE5rMU85?=
 =?utf-8?B?bDdRVEdHaGhXcTlzK21YcFliVGhkdnowWkxBV21RSHo4QTRmWWZzSnFVMEgx?=
 =?utf-8?B?VHZrUGJXQ2toTmM5S2w1MjE0ZzdqUGlON2IxbWhCSkVEaWlQdFpaUTJOY1BI?=
 =?utf-8?B?NXk2N29lSmRiT1I1YkdOUVhvd1NwS0lkUVBGOW5LVThuY3lGVUtldHVIYTdx?=
 =?utf-8?B?ZjZpZEIrNFZua2c2VXZrWEc2KzcyeVhNVHhldmJrMU1vSStVaVBIbGNkb29F?=
 =?utf-8?B?ZHhjc0pXazZ5YWR6cmRRUmdPbm5maVF5SytkM0dLd3RLM3RhUENBQW5FUWFT?=
 =?utf-8?B?cHIwaXJ1MTRnYllXejhJWFlYcDZ1NjFPUTFubmZnSUZXVmFibHkvVTIyZG1X?=
 =?utf-8?B?VnVKek8wTGtRQnU0dTBBZFZIUUpLc1ZwdzM4S1JUWGtJMzBGZFFWcWdpMnlo?=
 =?utf-8?B?OXNKelJIOUFzMW5LaC81NkxxYTdIcGp1R0hTZ3dENGZCSlRqMS9sZUhTYml1?=
 =?utf-8?B?Ty9GQ3h1OTlYSENLb21NaVc1dm1NaFlLK2VrSEQxNUwvQkRoekwwYk91aHlj?=
 =?utf-8?B?R1VHbkp0SXpvQzA1NkovWUtSWS9PbXNXVVZmbDQ1bkJ4dld0YlQ0V08yUEFS?=
 =?utf-8?B?MURMdmFlbDBBLzRsbGF5WTlGUmdsK2kwUk1IdHRNa3NlR21iWmNFR1d2NWEx?=
 =?utf-8?B?UlpUSVRnSXhaNzFYZ09wOEtYOUNxTiswVEtDSVN3WWE2ajBPaHBKbmg4eVZ1?=
 =?utf-8?B?UWlqSk82OUxsOHJ6SDhxaG5uV3FkSjR2WUc2bnduN3BzWkozS0VuQi9xOStY?=
 =?utf-8?B?Mk5iK09IcHhwMGM0N1pTZmtkNXR0WnBBay91WXIrTzVFS2NBOU4vdGkyQyts?=
 =?utf-8?B?NHoyWnE4UGRPM1Viem8ybDNoQkd6MWtEem0rMUwxWTlCWU1ERW8zd1F4VVhK?=
 =?utf-8?Q?l6wFWtIQILkWnuLuIo63w+g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <615E581C3F4D5C48A4E3010ECA9D57FC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d4d7fa-f3f2-4a56-1b5f-08de20a67dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 22:14:18.3014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYXYfRO3fF0sqRm6ZpEbkt0eyDx2a4D90shLqMVNMN2EPw4JpoVAFrZfbj2mGuLlrXwJawIbpeAnrYX+8PD5up5EtsfM90sQUOExVLpSvW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6824
X-OriginatorOrg: intel.com

SGkgSGFucyBhbmQgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCmh0dHBz
Oi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2
L3BsYXRmb3JtLWRyaXZlcnMteDg2DQpmb3ItbmV4dA0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgIGNvbW1pdA0KYmEwNmI5MjhmMDViZmQyNzg1MjYwODE5ZjZiMzRiNjU4YTA0YTRlNjoN
Cg0KICBwbGF0Zm9ybS94ODY6IHg4Ni1hbmRyb2lkLXRhYmxldHM6IE9taXQgYSB2YXJpYWJsZSBy
ZWFzc2lnbm1lbnQgaW4NCmxlbm92b195b2dhX3RhYjJfODMwXzEwNTBfaW5pdF9jb2RlYygpICgy
MDI1LTEwLTMwIDE4OjQ2OjAyICswMjAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEvbGludXgta2Vy
bmVsLmdpdCBpbnRlbC1zc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo1YWJk
YTU5M2RmZmRlZDhkOGRhMjFiMDFiYzI2YTg0MTg1ZDM0ZThkOg0KDQogIHRvb2xzL3Bvd2VyL3g4
Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYxLjI0IHJlbGVhc2UgKDIwMjUtMTEtMDcNCjE3OjA1OjQw
IC0wODAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpTcmluaXZhcyBQYW5kcnV2YWRhICgzKToNCiAgICAgIHRvb2xz
L3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IENoZWNrIGZlYXR1cmUgc3RhdHVzDQogICAg
ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBSZXNldCBpc3N0X3R1cmJvX2Zy
ZXFfaW5mbw0KZm9yIGludmFsaWQgYnVja2V0cw0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdDogdjEuMjQgcmVsZWFzZQ0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNw
ZWVkLXNlbGVjdC9pc3N0LWNvbmZpZy5jICAgIHwgIDIgKy0NCiB0b29scy9wb3dlci94ODYvaW50
ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29yZS10cG1pLmMgfCA0Ng0KKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KVGhhbmtzLA0KU3Jpbml2YXMNCg==
