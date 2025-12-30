Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A594C97
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098769; cv=fail; b=jpl/+42qBZoTA4v2ZC3PLblJTaD7zNzZ1d7kvxccUI4NPD7SoRvMlguJ4XSImnB40zMIoVDmynB0j32mmGYqMSkKk49b3ULfHDcw0+RReZZewdXHXurAU53tzSaucihYR85IvFExUo7QGk3yjNUTErCr4O6M7moZWgi4jL61LUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098769; c=relaxed/simple;
	bh=i3FAjF2NV4tIFCMBKr1rPsNciyzu9TrlXIqTr4PMTLY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Myhu2jsiZGqV8exPpVK/svhuQp/cuRozQ6xQMZ177PgM5VXTYl/Dn9/VPxEpkX13UC2uLBVt3AjmJD/gXpav1p6ZtWPFZZeekS+ZYQ86VItQC617W/pVISzYdglQEMcTcNo2BMIlgKUjRxzD5aDo5YNmToUNjdTInuK7AM6TT5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXSQ7XPX; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXSQ7XPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767098767; x=1798634767;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i3FAjF2NV4tIFCMBKr1rPsNciyzu9TrlXIqTr4PMTLY=;
  b=hXSQ7XPXtNRqxqGFUCW1AgKU1cGi9wkbfV2JdMTtkAN5EA9GESpG7HQ0
   LgQBl6sHOe9MMjTBk1wyWOBRWYZYciCe95+wAcNVXHpLppBAbU0HXh1u7
   30TAzaBsfn0BjTchsoK27a5/M5fz4M1ixPoscbDGJkMScPC8nKfUlN0oe
   KHMBtLclR1PhHbHblQtzeUic/VkL4E0mh8XvqPD/ztl933+5AJUoJfp/p
   vwDTQbPdyfo7otUqEz4rwwkLgpvrL/8B0TCGd8UM9wgip2laXRasJSHG3
   KDrDBIupeQfmold7qQcEwbYexWy6YcP/B3pP6mfRVJ5VNcMd9HRoYBP9T
   A==;
X-CSE-ConnectionGUID: qHxgdKObQnqP2519Cqw59A==
X-CSE-MsgGUID: ZjBib1Q7RxaTDlbqCs5INg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68757307"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68757307"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:46:06 -0800
X-CSE-ConnectionGUID: P0+I0bRdQpWsP8WhRhQUqg==
X-CSE-MsgGUID: LpXYJJ2jS5GNOYgWvXJMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="200847021"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:46:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 04:46:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 04:46:05 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 04:46:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIbNw7bYlhOyzDH6H7SDhJOu7QxKk8h8+uV9rwluHacxhdXst9DvMRzM/iimxT6cRDYWeR6dy0+0+ErXdkhxhvJ0Xkm5/HtCGlz7cLyRuKDtdLSjvlZq4SM7VBP5SM/5Z74UZbhwWzPVgY5MVazZNpgXSzLFfLLTqabnuNWKeO0gGbi5FfTiZzhMcVatdjB4S2PMgHDsTJGAiO++Oo8h0YtzjPkKRBGRQzmoexR+QCDSU5xJu0Y3blMu10iD93eOEzIra/Y0bO/4nev9vJ4MtJtxyT+T1EPqpx187CreIz5REOyglvDvhGmSSKj3PIxNG6eqxOaXzoy+pRBwgXZfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3FAjF2NV4tIFCMBKr1rPsNciyzu9TrlXIqTr4PMTLY=;
 b=EPn74vrADFZ/r0DHL3OQOnjpqT+P2w6dK+/G48HFhEyswloLF0x+ONI/mH/mwhOxY9ri9Zhod3LOeh2n40rX7cNFccHFtlVBs5xO1m5jvcKvr63XHPk91vTiqbtgCdVl642ukXVHNllrTE0464p4qr9BGTZCY/qXcehPuxdVQn9ErZDSnmpGDHRZ4JlqXV4GvNee3Z5f98H7GODJjq5/9tfxEaFiv8WEVk2q5s+eUWKg3M1UBdsP0S02xJtmYkiCswkvuod0xY6koeoSIiY0KV8z5UpgqvBpLC2+ViLaAMHEUK3qC2ad3u86Ug2Yj3RkVtTEvJiGVpZnIzUYDhEtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 by MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 12:45:58 +0000
Received: from LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308]) by LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308%6]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 12:45:58 +0000
From: "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, Hans de Goede <hansg@kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 1/2] platform/x86/intel/uncore-freq: Replace sprintf()
 with snprintf()
Thread-Topic: [PATCH 1/2] platform/x86/intel/uncore-freq: Replace sprintf()
 with snprintf()
Thread-Index: AQHceXntc6enzV0q6k68VktGnzU+2bU6IWSQ
Date: Tue, 30 Dec 2025 12:45:58 +0000
Message-ID: <LV3PR11MB8768A9DFA11519AEF1FEBC96F5BCA@LV3PR11MB8768.namprd11.prod.outlook.com>
References: <20251230080545.224954-1-kaushlendra.kumar@intel.com>
 <20251230080545.224954-2-kaushlendra.kumar@intel.com>
 <f0c3235b-815d-c3f6-feb2-fa38ea2dc456@linux.intel.com>
In-Reply-To: <f0c3235b-815d-c3f6-feb2-fa38ea2dc456@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8768:EE_|MW4PR11MB5824:EE_
x-ms-office365-filtering-correlation-id: 3f85caf8-e55f-4654-9596-08de47a16174
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?iGOLfieJFK87xoCX0FsLkIOcBqp7k+HfLZfr80CGYJw7ac0abBYwOI/iq5?=
 =?iso-8859-1?Q?mYmmYWJs87Nb2eGnIpyRvdnNdhDm0mUwZGDUWrrcvreF8d8Vzzxx4pmXlB?=
 =?iso-8859-1?Q?XLEZ85QlKoy8yjjjzpB37ArHMyeBM0eDyctGUIdBa2+7oG3364OpdKtg71?=
 =?iso-8859-1?Q?mkzzn28xQYSoyBWfSr+JqwXnHpkwELpqyofvqtjWCEd0fWVIumZbFidYix?=
 =?iso-8859-1?Q?N9ZqRy+ZfRt35DhcQ/PCEcf0FPHzs6ezl1pKfpTDJFsJijGa/WKJuJl6VV?=
 =?iso-8859-1?Q?w4X26w/Fm74JR06IDLQQf3qvYzeCpZMiu/dCZ13Xl6RRoDheY123xLt3Z5?=
 =?iso-8859-1?Q?9lElDv6h74beQvmK8+pRLBHXtKDpadO695yyd/HVbe1BNtsVO2wzs0s7yD?=
 =?iso-8859-1?Q?3NtIsK3xZ7m4gUBh2KXsUxOepIlfpvQ6zCUeMA8CBWN7j0Gh5IxFH5Zi8f?=
 =?iso-8859-1?Q?CEu8kJU3mh5XipGja1on2430dzoAzZX0OZ3fqC85lxfnmIejtMso3xrIcI?=
 =?iso-8859-1?Q?W5a+o2FDPme9JsdO5ADUFD6n0gUpGvjk7nWKSVLDCdkAkj4nRAiGAnmCGw?=
 =?iso-8859-1?Q?9JF3yFaa508gwU6PfriBDasiRGHOe0l0d3dysej5WBq1ZgrUWKYea1yGKF?=
 =?iso-8859-1?Q?t8fyb319A0TlSfeaisv+Ht8013AaUVBYcmUb9qlFpjAqhP1wlDWc42clP1?=
 =?iso-8859-1?Q?piH52OpyB/kJm7MIzKYtwgheVpHju5DLfNF696U/hJMN3J0Bb2DUDndQoM?=
 =?iso-8859-1?Q?T93KVE1rBm6qrqL9UiHAAtyMi9/ixa4u3KLjEgJdBghZaXRiN+R3JmDQNp?=
 =?iso-8859-1?Q?Faic7MyN7UkAWE7YepXNABLhK2q34e4c0e6OhmnnOjXfpvQz7/i5Gb9W1E?=
 =?iso-8859-1?Q?X7l3d4548RSdcBpKMQd1XmKdBfiGZYRO280UZnS9eZsCJgyaEm2YpBJxZZ?=
 =?iso-8859-1?Q?z7WZo3Mx/WVjsivp9HkhpAxvOa7jWS/j9QfT6VQfOT8If9UXO3RkR+X2pO?=
 =?iso-8859-1?Q?0GcrPr0xok4C5PCKYM1DvDIIgFr+kq902ZUfp23f7aOy7rIUJsCrvJLM/8?=
 =?iso-8859-1?Q?M3eRunBqhDUXN1bL1YA8yGjYfDl/lVEQscz9fGbmB2U8IuO94rTD4gobM1?=
 =?iso-8859-1?Q?Om7H3J1GJIWqJerdUnd9T/X5rsTkNB4Mir0isMdESqvQgnMvf09mw7ljrq?=
 =?iso-8859-1?Q?HfccL2ljW+hIr6kcDzOK+ySAfVGlu+7LQnWBqZOl/IU19Y1WXTG1od6zfD?=
 =?iso-8859-1?Q?eEVjQGdJrp8M4UPdmM55C6QjAu5T+8PEDt6KSnqrJyf7mYa+wM89boeFlj?=
 =?iso-8859-1?Q?wNSMr/Uv6on03D+kKKXF4wic6IkapwYsa2EVVVNveXQpfE5bbetv56SVUF?=
 =?iso-8859-1?Q?ZZ3RqfBr68bCH3qMtiUC7PU66bHazSIKu2BttQCtE01MUeSus+r2Gv2IbA?=
 =?iso-8859-1?Q?Dh68u2uaXWyE2iIpMen2RxsKDxqSk2nj5UCxiXfdj24a6bXV8CIqICjevr?=
 =?iso-8859-1?Q?RDEJCkNehvn2ZnQRi9YgA3yNvktrkeW/81FliifkXAo1y1gjwqjbA7LHrx?=
 =?iso-8859-1?Q?7uTWVguFXFWTdYatx1hhdpYUQjFn?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8768.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jU9yVXdkO2/mpJ3p0XJAJvsl+iQ3bKd0Z3Q+d8Q5aMHc5cnfNX0LzwjQab?=
 =?iso-8859-1?Q?g3d5cxA6MluaDIir90nnBbpfUWPR23ithC0lTG+kEbxErl+G3y4vm5CuaC?=
 =?iso-8859-1?Q?qofW1Ygh2427QwWLpFdIZCAdgesi5BSnp6qiS1+OXiZ9PJqEWcYY9c2Lfh?=
 =?iso-8859-1?Q?+VwBcK+0RK6nGneHuvX5mp0A3HvfNlnWiwmdYNBkW5PojNDaRLWE18CqmW?=
 =?iso-8859-1?Q?SAFMzVpjU0weUSu8KvhAH94RKmfBDp8v6aSkbm4wlMxw9GwLRVNBC6vbx/?=
 =?iso-8859-1?Q?rnt1VvcDZRzhkEyVlS+M/6fYE6Tsl743Kp4BB8eBXaqWzsf5isYOw9EMU5?=
 =?iso-8859-1?Q?2YV16V3zyBqMSj5zkDjYH3ZAfBSzzMW3pNSjQMRVpUGCA0JYtLa4fcvplF?=
 =?iso-8859-1?Q?THea1YeQ+04VKVPQ9Vu9inFCMqbbCXCxI2hpXUBaMn53r2KHPR9Zdl0zLd?=
 =?iso-8859-1?Q?0EEsOrIdLkCzjFXmfqgBY6uojhCKXxeY6fZsGCJKrlrn/W3ajiqPvJ86FB?=
 =?iso-8859-1?Q?camWb/CuCUIhuMJZVC0bGBXt1sarh4qFCKBw/tppPgXSlywRn/4Uq/xEhj?=
 =?iso-8859-1?Q?ytvSU6Z8Ta8ARwGMqUvNH1eSq9/Hq2/98MD9kUDI+pdex+B74s8eBMrIpP?=
 =?iso-8859-1?Q?wdAA94A9cw+Q6jn6sGOQMDpM8aE1DAtW4RSRsb/I1i6oPQkzx0cYr+4/IJ?=
 =?iso-8859-1?Q?uiDFr7eHaoyX12O1JG+Swwq7hTmYDDowKGL+0q1IfmuVk/uKvwEPDx4LD8?=
 =?iso-8859-1?Q?PK0fzSobC6A4LIc5RaEu9YnP2YALDMiBXzVsWQK5MEvSttAzxFt3W/AEqt?=
 =?iso-8859-1?Q?UptW1yYVmsM41qgzO59IuVffKkc/wUomT1SFrKtQxxY9IWtDkCJ2e78pPq?=
 =?iso-8859-1?Q?ZQ6PrgJprzWJzqCOkoXYK1WWoQoGb8O3NITPh4PjXNczDIBTZDG43DMRyq?=
 =?iso-8859-1?Q?ZsM+4Ked3rRo3mtHhgvy+QaD2YhIjWeAcn76QSmkubgjjsJ4CzFRuNw2dm?=
 =?iso-8859-1?Q?gHujLBUbvx1vMechhvTWO/mrYvA83vwaxrNKevV/Q+u04VPQ8/E4nyOhVe?=
 =?iso-8859-1?Q?DgVoUD2IBRsAY0fZltowe/+xnFvf/CwR6o4QhggnFokkUaX1ye0u1CGier?=
 =?iso-8859-1?Q?UFkA9/44RfzHXdFGKyhMsJ5K0ElyN16SAvSuJNw3Lwc7hy2tWjVT/d78RD?=
 =?iso-8859-1?Q?J+aE4aI3HTbm6/gN+80kYsiBtNB5oL/QwCcTXCuslRW7e+kCSD0vd24lfr?=
 =?iso-8859-1?Q?NUhu4+gwo/vRtsmbStVBjb2wP8TxHHf0jmYosIAjl93M1MZTxF+QHzd3de?=
 =?iso-8859-1?Q?bp3jOqzfyz/cGVaOgUkz2FmAt9smYPFsQf4YY8sesJwwexUJvl09ILVj+q?=
 =?iso-8859-1?Q?oVgsD9hapLFiEfpvQ1YcBvCFJG9gpIyDMckKC5bxSyuCR4Bfnnr1yxW17q?=
 =?iso-8859-1?Q?Ej1RTBP/GmL6sMFILiKNXFvfoE418mOfLzmTctfIUXtVEmCnmOBYTOSI0M?=
 =?iso-8859-1?Q?GgEeCrqLnYRfyxFEv6Is3XdYjXeHvMwmETX4uDnr9kcZ6GGQFMJwKHz65Z?=
 =?iso-8859-1?Q?/uC1POAxsg9f8qzKLHzGmm29ScmyFKPIf2VLl++P9ytyuWA57dkJXG0Trl?=
 =?iso-8859-1?Q?jKRUjjgl/QWEy3xnsX5Lj7lZzrtLVmraXUcXl1RlLPtngspynPxxOVegBe?=
 =?iso-8859-1?Q?+YLMc6rkzB6tnD48gIl6BnuvWLQAd+Y2ebn3+8Uy0lkOkZA0/tZEXYiila?=
 =?iso-8859-1?Q?1YadGdkem4Ufq0P30Kv5MJdvGAvczLapkGhnecXNO00Td/jvHzkdTNIUcw?=
 =?iso-8859-1?Q?RKZObIwvrJjyBt7qQPCplAaEYK2wTtOJqidcEAmUHNWk9CPqYK7+FLXVKg?=
 =?iso-8859-1?Q?QK?=
x-ms-exchange-antispam-messagedata-1: Wb7Uj5Lv1LE4Tw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8768.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f85caf8-e55f-4654-9596-08de47a16174
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 12:45:58.3139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGWL8e2gZnVoKAwsehLBIv3ubf/VIGP3czYdAroWjCp2CYupZHziH5oxs96frfpBMk9n4LYbsZ+T0vKlWEfafdcnTXx9UobNIERa5RWKOyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
X-OriginatorOrg: intel.com

On Tue, 30 Dec 2025, Ilpo J=E4rvinen wrote:

> Hi,
>=20
> Thanks for the patch. Please use scnprintf() instead. You don't use the=20
> return value so the distinction doesn't make a difference but it would be=
=20
> useful to eventually only have one of them remaining, which should be
> scnprintf() that gives a more sane return value than snprintf().

Hi Ilpo,

Thank you for the review. I'll switch to scnprintf() and send v2.

Thanks,
Kaushlendra
