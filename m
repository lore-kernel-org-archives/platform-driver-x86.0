Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59996500943
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 00:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608662; cv=fail; b=jfhWPg0euaGQD1bWViuAIwRjfvk3Gj4wQtsht9XZWNM5RNvRj6O5yBYJInMh5PHHYJoyLhaEO82Kiod2CW8nN7S/b3Jp4xaLuNaTGPOnFsHWv2LsEnqbNQtbauEbymIfm3Ay9qvKbHHQfIrhJkgq9FAV3WHGLtQFMrbmXpGYMZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608662; c=relaxed/simple;
	bh=0nuyTMovUDKfNFv9gVs+eZJmUXCkC4wZMpc1IoBKj1A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PjGgNpkDJ/2Mu8dimkE+w/AYjfHFa2yGqgQh1VJBSdgM1Q/8AGvnf5nmAhrEbyZVEL+nnP0VY3bG9MmKqhfEiFX6HoMNH/rg31psTZOgf0Pgl4N2nRdOftyXOUvRXYZspGzytcYiKweUmf7YAvyzVageYOMhV/fByE/pCm0x5JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYFmj1AT; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYFmj1AT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768608659; x=1800144659;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=0nuyTMovUDKfNFv9gVs+eZJmUXCkC4wZMpc1IoBKj1A=;
  b=PYFmj1ATRcxyFNExJLbfyrqhQOtY1i3rACFd+MVg6UKNE1vE9LrIuWQB
   UB/GWa20jvmCuKLZMhuuiAf5XIfsu4Oj5YVsEp5M+S1SSnVyZ4jwXbU93
   uosrzadxNK4IgppIlu5tQEjvQtRnWX/cBeO4z/P7oQb3ImRNsd4V6m4Wa
   3+pY04FEWpNkWE3NR4+IMLm+/1+x+qMeDCggs3J5pjftIlq2yl5hK5oFG
   3W2USBW6c5h9LBWfOiZpMmUEhmVXr0qPDlS5Pb0V6fZIrWMQ2mJRLK5R7
   SLJGuywWiTThdogwhyCj9gzqnESRa8rL3m18EjDQ/EGTvhkLMKoR99BnV
   w==;
X-CSE-ConnectionGUID: JSXoLGy6R2m08aR1nAoF/w==
X-CSE-MsgGUID: A4Urx3U+RVe3Gkh3XeW2BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69128708"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69128708"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 16:10:59 -0800
X-CSE-ConnectionGUID: vHBJ3fQORzmKpIDWcj2lHA==
X-CSE-MsgGUID: RLzUGJGhRaCHvvxX39QSCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205402177"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 16:10:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 16:10:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 16:10:57 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 16:10:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmdicGJjnLJTDqPCTuGfDnlep3JxnHV6VsJx6FVLQTIuP6m7n6WT59fjYoj/2yw0HcGonVKtjCXuIsrWgZSVc8m0k9gXYTqXvpuWqhycMVBxVQwrBrwtQVKq7Jmk5Kgyvr7EfhwLL9WpaetOlPj0BWtyry8loWrR+aJbq7xlG/kGrJiV1WEVKQ628Q7aBTq9TW8rUOygdckjpupKpems/xDfDApiD7T8sQN3gccx0rCCYQVYt0H/XRFs5exGqMPjML+Vaa8RxUgg7ImJi4pKg1MoZ6kmkul0ki+Ypt13zNL+4zMXTHgZD9dx3LM+/6DBY+khFFwar74or20PR8QJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nuyTMovUDKfNFv9gVs+eZJmUXCkC4wZMpc1IoBKj1A=;
 b=lf72887akDNqiSqt2Mxm/JDr6pcVJG0uLSWBlbH6exTv8NldHA+xDemIlO3eWHhE3Ly6Atm58ghH393bZo+UNgjEKE1jWxGFj5sVwU3h63pYBul0LWb3XFA5ZoKmeLRAJE1/gOaGKQ7cE1VRFLYCh6eT20rk+KmVcbo5WnrrLuAPq1+43GVjEsUJoKhjKhF6m0MUGdRoQSc6eRi6lpuzx4CgjOoPT0T5nS6du48MlmniyUsy1CuVh7rq83qsFeRqmxO5ezDFaaJasPUYLlefjmyXcAGYH7SrS2luDP5pwhUk+WRVt9mPw7zvbDoeBGbLJtCFdbSahDecMD08i4x6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Sat, 17 Jan
 2026 00:10:49 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::4fe4:767e:7ec8:6fd9]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::4fe4:767e:7ec8:6fd9%4]) with mapi id 15.20.9520.005; Sat, 17 Jan 2026
 00:10:49 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.20-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.20-rc1
Thread-Index: AQHch0W8fZAswiKAPU2DepsLSUiQTg==
Date: Sat, 17 Jan 2026 00:10:49 +0000
Message-ID: <ffe8dca9514f0ddc1135840644b0986b48972cd0.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.2 (3.58.2-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|CH2PR11MB8835:EE_
x-ms-office365-filtering-correlation-id: fc35424d-4d90-48ae-836c-08de555cdebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Z2FVWGFCbktTY0laSTlQcnVzckZNNmlHRm9uWGpxUzM3ekpMejZ5T1hEYVh3?=
 =?utf-8?B?c3ZuemZJckEzV3ZqRDJkdExYb3FGKzBUak5VakJkaEdTcktoTytqdDFZRVdu?=
 =?utf-8?B?UEZZWDE1Tm9VaW1VNGhhSHRQWGV0U3J1ZE85ZFdpNGxnMnJKcjdick5ISmxu?=
 =?utf-8?B?T1YzQks0TEkzSHFNMk9xSjZlTkZCemwxazRaVEQxaUNsQVA2aEFGUmtTQ0dE?=
 =?utf-8?B?U0E1TGhIMHJOaklPSkdWY0IwbGdUTzZNTWlpN1poa2VoZDBTYWxiRmpHYmN6?=
 =?utf-8?B?YVFjYWh2TFh6c3g2YVViZjR5NVA0eGpQVE1LVDZ0KzUrYThJSzZab203ZHJx?=
 =?utf-8?B?bXVIYTZaMzlPYzFmV05wRWpua0JsOENCWW1jaWdNSTVVNWNzL0krR2pTTGNU?=
 =?utf-8?B?bVU3eHdHVkpWZHFxaG1ZMVRhNm0wbUdMVG80YlB3SnplNVozZU13dnczL0RE?=
 =?utf-8?B?anBtS0wvK21NL1prc0t0cjB0RHVjSGxiYktKeWU1T3ZtWndGMkEwQmdmYTF5?=
 =?utf-8?B?MFlQdHVDQTg3M0d4OXVuZkR1YnJMMzA5cldLSG1vZVh1eG01dUo3Tys5eEkr?=
 =?utf-8?B?MXJicXZoNjc3RGFLVnF6TmhFT0Y0bmR3eXkwQmVXdWJMd013Wk00cWc5UGpk?=
 =?utf-8?B?QzFGM3NKZUgzckNyWXRlVkpNdWpzTzlHVUFIMTN4azk2WERVYi9JN09sQzNM?=
 =?utf-8?B?UXhKb3k1UDBFRDBTWldHTUlPVUQ3TklYS3BXTU9JRlJmNHFrVFV5ZnlaaWZX?=
 =?utf-8?B?ZVN2M0doTnpHeWlBRUZ1anFyTnpLc1h4VGwvRlUzMm9OYzFWelFlRUVBaWVX?=
 =?utf-8?B?YzlrRm1Xd1M2c0VNeVNyTzFBaUowM0psWFo1RVpOdnhDdVgyUFdwYTBtSE1Q?=
 =?utf-8?B?SGh0dGo4N3RlMHhOdVVXdUxvZSt5Vk9EbjJ4ekJ6LzYvVmhia3N2K01nZFZr?=
 =?utf-8?B?blhhZEFDNnZXRW05elQ2YWQ0SEQ2ZlB1ekZtem5SZmZicys2TTZyR0xmZC8r?=
 =?utf-8?B?YXFtYmpGdWRjWG5ESXprQWNXeGJ4bVpTOW9XYVRaTU5RdHFhbHJuQWgxVFc3?=
 =?utf-8?B?eGVEVkZHUVpHTFlrOHJSN0RFU1c5QVhkSXFleVRYeXlqSnBieFpNSTdDVWRK?=
 =?utf-8?B?VS9lK05vbTVvUHVNMFlHdkJUVzI5N0Fka0EwcnJkOGIxNWxZazJCTVNmVzBX?=
 =?utf-8?B?Z0g0UGJxWUpIMWlVRWwyeGhjbXY4eVhQU2RKVlBQb3d0aGFpSTNCbytnbkVq?=
 =?utf-8?B?R2YxVGtYZkFuKzhsNGEzMDh4VnU2Ymw5eE9wM0hETW95ZDNNdGRhSGdPRFhk?=
 =?utf-8?B?Qm9kMUh3a2JLNE5ZYmdZY051b0NucndpMnU5bnN0QTdNNXZrbmFzS2ttVzI0?=
 =?utf-8?B?dDBwOE5hRjV3djdWZVFqaGxqSHgrcE8yR0lEYlNOWnAwVVEzYVkwcmlEczVz?=
 =?utf-8?B?ZGIwSEQ3cGlvSG5rTlBqd2VLRWxNT0hpL21DcTBKY3JNK2VMVExVd0VZQ1Np?=
 =?utf-8?B?cXpaTTFWeGl6R3liaUJTYlFDdWZPRTB0aTVxWkVBc1g3NHdjemRlb21nQXI3?=
 =?utf-8?B?Nk82bEcyaEdrMGkwL0FJczAwWlg5K2ErUmJXeHFhZ1BRdGlOaVFCTDhXQlly?=
 =?utf-8?B?SUsxM3FUZlJHakN6cjB3TkFBL01qTXhjTVJRMS9NdEI0ZWR5WnZnKzdndjY2?=
 =?utf-8?B?MEdoMU1wVm5adERHMFVpMm1JSXZwOS94Q1A5OUF2WEZ0QzlnVWcyeHE3akh4?=
 =?utf-8?B?M1o3L0QxREtBeU0rTXZFNEhpVzM0RFBadGNuZktobEVaOVlBUUlZdkF5TEls?=
 =?utf-8?B?U3hHVW5MYUhRbm41UWpjWjhxWW5hRXR6Si9mNm9lRm5YMDBGTExiZVBTeHZ2?=
 =?utf-8?B?bW8rM0ozYWlFTXFsV1gwcmhGNXI1YWp5Yk1TVy9wK2tmbm1vTjJDTFE5bkg3?=
 =?utf-8?B?OTBzbnFUb2lWNVNHa2RMbHlaaW01dWVCTVorUW43WTJ4NDRIODlxSWc0eVpn?=
 =?utf-8?B?TGlrRzJ0WEQ0OXBWeHhyV1JRQmU0LzdSZzQ2cE91RGFYb1dXb3M0OUUvR0tW?=
 =?utf-8?B?ZWJwK05kaEtkbjRUMHhWV1YzWnRCOHk3WlVJVVFvclE4djdscVBRbk1YNnRM?=
 =?utf-8?B?OE8vL3IwanRIak5ZS2pFN1pKTjFyaitLRDZsaDUrKzYvOWdwMlFWL1FKSmJx?=
 =?utf-8?Q?ZKj6CTHypNVL5jOp3VlMMgs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qjk0dHk4ZVVKSUhtWVF0clVaUVF2Ym1peCtENDl0WWpTekNWd1lFMHdRV2V3?=
 =?utf-8?B?OEI3UDl6ODk2RmJ1bG5xMURkT3JKTnovY3k3QUdsVE1tdDdOTUxXZk9zSWl0?=
 =?utf-8?B?R1dXbW14a3d5bW1CNVhQSFV4a0h4a2ZpNXJBWEZOM2Nicy9vQnhrSitDK09n?=
 =?utf-8?B?T3NQU2JOMVVkSnEybG1QU0N6TkNvR0g2U1JQUVN4QlZSdGh6VGFWWi9BVkFs?=
 =?utf-8?B?cnh3UGZWT3Frd1dTQlU0QWp0RWt0Mm1sZjNQZURHcTVYTk8wYVdjL2JIRjAr?=
 =?utf-8?B?SFBpdTVEaWdxaHF5aXBoTzh1UjFyUkE1MnUwMkJSc2VYRXVUbFVVZG5tMlZj?=
 =?utf-8?B?eUVlakg0ZVdDTVhGSEl0eCt3WUluK0hUODBtS01veTFQeVh4ZlNwaElGL2pW?=
 =?utf-8?B?SEFZaDl2SkFLcVgvU1V4MkdIckJvVkpZVWlrS0xYT2I0Wk1DY0tRTER4RWt4?=
 =?utf-8?B?M21uU3B3R0d1RkxMVENKaHhNUUlwSFo4MjFFT2NrVUwxQTNvcFA3anZ6dEIv?=
 =?utf-8?B?aGxNS1pUemJjSXhzajdQTUF2SlVZWFhNYzJqNDQwTE13dnp2UWdwdEtJRkpQ?=
 =?utf-8?B?eTY3QkRvajVnQXU0NU9tRFJNNlZsMU84b3NEL0Jpanc2b3lUZVRtcWFIR0dT?=
 =?utf-8?B?TXRsWjZsVEpGZVBKTWJOWU40bFdXK1E0NldudnF5TFB0cUJtdHNRRWJpcnBN?=
 =?utf-8?B?ZWdTcXY0OGVVSTJHUFNSUURHLzhNNUljMktXcG00VEJkMmRNVlBkT2JkblZY?=
 =?utf-8?B?cmljRzdxMzFzKzF2Uy9jVklsbkI3eHpPSU1NN0ZDQ1Bpclh6YWhWenIybE1z?=
 =?utf-8?B?azJrYWs1RWhOdDhCSC9aUVBZRmRqcTJSVzNFa0hyeFdmRVN2ZW1JNnAyUXJY?=
 =?utf-8?B?Zy9kU25CNGxKT1kzQzNLN3R4SUdoQ0YyWFhGSTJUaXdpejFVYTN0OGpGVmZX?=
 =?utf-8?B?SjJLci9GMjZLY2hIS01xTFZFQm5EWHBJcGRPUkN4M3huck5aMlZrYVlTdE1o?=
 =?utf-8?B?RDRBc29zK1FCYU02cUlJQkhDbE4zNFR1c3BlQmE4TmJ0RHd4TmxVOVlHYjI0?=
 =?utf-8?B?cmJCWXhHb1k3ckFhbTl6WUkzTFNwSmhQRzJtY0J6ajhGL1ppTm56Tm0xMWp3?=
 =?utf-8?B?aTJMQVFFMHM3cm1FTFNRQW51bE5KVk10QmJUbU9mcmVJbzFsR1cwSzM3allQ?=
 =?utf-8?B?a1B5SHFzWklmeWcrdFpLeVhtUHZKODZ5R25HRE9RcjVraEhRYjd4am41SXlI?=
 =?utf-8?B?N1QvUEthODhia0p5eUp3MC9BN09kUXZtR0RMTzM3Sk83MEYrWmtaU3hPU1U1?=
 =?utf-8?B?QUZLSHNqRjhNcEhRWS9Cblc2UUpLb0o1d2dOaExsN3BEUVorYTQ3NGlBUjhL?=
 =?utf-8?B?L01HaFlibEJPSk5HUWdNN01WOStpcUszU1JlSlU3NW9PQUoxTDExK1ZTUE85?=
 =?utf-8?B?SmRsWWFKTEZXZEhkUjZ1U0pnNEVqaEV2dEp3VStjL3hnNVBXQWthK3pkRGUy?=
 =?utf-8?B?a1RBR1JCdlNoamU5cnlERzZBQ28vSjhqUnNvQVQxRmpaT2owUHlBQm5UTncx?=
 =?utf-8?B?Y0Q2akdRbXFEZk5mOHYyL3RIRnJrblA2bFgrb2o0MU9RemQ3bnVrRDh2YW16?=
 =?utf-8?B?VzMyc2hSSjNmcWZyR1VQWXBhRVh0WFp1dC8vZ3J3dmtwRVZuQ0d1cEJLWlg5?=
 =?utf-8?B?TUczUWZLalFJSkNoZzVsRXhhanhWd1E4RzRwM3RsR0l0NXNjYXBKT3IvaVdm?=
 =?utf-8?B?ZkxJOGhUL2NuSm5sWmJUdldaSVZ5ZFhRQjdwZmNSNjB5WjBPQ2gzeWk1OWFn?=
 =?utf-8?B?QTBDWWRzOTNFQlNhbmNMSDJ2V2tGeG5WdlQ4dTZJYmoyU3g1MlBPUTh4NklC?=
 =?utf-8?B?KzM0WUhwWXRLQjVYYkxhcG9wVC9mdmxsOFdiOG5XaWt4NjlwaFF6eElIaVBj?=
 =?utf-8?B?djBKVmt3dG1zMXJxdE9VN0lFYU1SMmFaKytuUHczOFhTV0UwWHhoYlVoSGJq?=
 =?utf-8?B?Q2pRbzArSWRHU09KWXpDaTFNVHdIQmVicGIxZGYwQ2VmRlR4aXcxa3JCYXhE?=
 =?utf-8?B?eEViWjJvLzdZS3dNOWJrZ0RPU1FGdFZmRGtwOXdOL1pNVkRGZjZrRmM1Z0FX?=
 =?utf-8?B?ZGsyWW1DL1pId3lCbFEydWdaN0N3TkRBVEN0aFF4d2lSdkxEVjMxQVM2S2dN?=
 =?utf-8?B?cFZuVEUrNXFIbnN1K08yWTU0TXlCb3JjYmE3VXZMMlI2OHlGbDJMbE9vQXlP?=
 =?utf-8?B?Mk5hcER5OHo3QnVCeTVkenBZL3NqNktlUHlEWC9uMGhlaXlNR0p6OWlpTGZ2?=
 =?utf-8?B?NWE3SjVkN2IrQldnYW9LT1ZVWGZpYitod3cxQjRxTlExdm1LVXV5ZE9MZFV2?=
 =?utf-8?Q?CnJ50M3Ao8UhoUoALt7it8lAMh8smzOoIhVih?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <386934EAFC1F5D4ABC48CA2EC3E95584@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc35424d-4d90-48ae-836c-08de555cdebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2026 00:10:49.5323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilukFA1N0ZHJNvSoNwB7rM3W3oirLx7u7IP8+g4mqAab7hieLm7OVQsZdbclKTVewYA2zumdZT0ukT0metTgQaUg8B6bPB+I+WehZTLn/SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
X-OriginatorOrg: intel.com

SGkgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCmh0dHBzOi8va2VybmVs
Lmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3Jt
LWRyaXZlcnMteDg2DQpmb3ItbmV4dA0KYXMgb2YgdG9kYXkuDQoNClRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQNCjhjYTc1MTVkM2M3NmE4YjYyOWY3MDNmZjgzMDFhNzVmNTAzYmNj
NTA6DQoNCiAgcGxhdGZvcm0veDg2OiBocC13bWk6IGZpeCBwbGF0Zm9ybSBwcm9maWxlIHZhbHVl
cyBmb3IgT21lbiAxNi13ZjF4eHgNCigyMDI2LTAxLTE1IDE0OjI3OjI1ICswMjAwKQ0KDQphcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5j
b20vc3BhbmRydXZhZGEvbGludXgta2VybmVsLmdpdCBpbnRlbC1zc3QNCg0KZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvDQo2MTQyYjcyNmU2ZTY0ODcwYWIwYzdmZmIxNThiZmZhMTQxZjgz
YmI2Og0KDQogIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYxLjI1IHJlbGVh
c2UgKDIwMjYtMDEtMTYNCjE2OjAzOjIxIC0wODAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpLaGVtIFJhaiAoMSk6
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBVc2UgcGtnLWNvbmZp
ZyBmb3IgbGlibmwtMy4wDQpkZXRlY3Rpb24NCg0KTWFsYXlhIEt1bWFyIFJvdXQgKDEpOg0KICAg
ICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogRml4IGZpbGUgZGVzY3JpcHRv
ciBsZWFrIGluDQppc29sYXRlX2NwdXMoKQ0KDQpTcmluaXZhcyBQYW5kcnV2YWRhICgyKToNCiAg
ICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFsbG93IG5vbiByb290IHVz
ZXJzDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yNSByZWxl
YXNlDQoNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L01ha2VmaWxlICAgICAg
fCAgOCArKysrKysrLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1j
b25maWcuYyB8IDQzDQorKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
DQogMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpU
aGFua3MsDQpTcmluaXZhcw0K
