Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A4374E7F
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537612; cv=fail; b=jM/ykdjJyYhMQhFfie3IFsUYt0ITIOysp4CJrhiIh3SgURjRN00KWvk1YGMsESwaQGophDoTG5LgAJJjbBWFfH4XkpkkwsdCfsQOzfWIcZPRqcv4hlHYyDJRnugwF/nXFaSbWzE5u9+PMwzdH/Rd4jCaDG3hN33nT1Qp7Mx5IaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537612; c=relaxed/simple;
	bh=UaCLccEcsu/yHnYNNp5bUPEUynB2GEmeBpPeTz2mLiU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NrRamkJ7lx0SKe9yImMilGRFvQN3t1Hft5jC4LIt2Iv9nAfwzuWC6NvDPUbnrP9OGN6yvpygxq9wAe1MmCnDryvPllLmPuJ4yzLLn+ZDIf8Eksoqp80uGRedGmcozXOvXOCpUBHpiRQRWAaIrolDyTY7h0QKeVAIP5sRevFOk1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwL2VCcX; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwL2VCcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788537610; x=1820073610;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UaCLccEcsu/yHnYNNp5bUPEUynB2GEmeBpPeTz2mLiU=;
  b=FwL2VCcX7qO6AslwR17k9ss6zqVivfdA8EGOKqLQ+RDUe5OBGA+qrU+B
   sIDQC9eK4+7TT1MgV5mjpAZd0CqjREYDLjfM8T6rAe4d73eMrLYPPnfDv
   Dj/Vp0qjDn2p7G6HMVTJ+sLSeeoDmjsjw1au84n09y24P5h9cVgdnMVkc
   p9Wvxwf5JLAhlfwkMIpUuAhBvhcgUDkoJrWP88M9N98VN/GwmblJXfv4d
   a69200ndPCnAHrIi112Hy7v4fNDZtJJ6A9vmQ0oBSiHfXmRERHgRan3kW
   tFy8XcSK/YGoJnWlJhIwcHf2tRbBp1znclU3LkaR1hpTbSkMV9bzDKMsB
   g==;
X-CSE-ConnectionGUID: iqLHxHqsRC2KaMDTmUhj3Q==
X-CSE-MsgGUID: a0HvWjRETr2e1Lz+yDjuAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100202446"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="100202446"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 09:00:10 -0700
X-CSE-ConnectionGUID: mCWCmrMbSX6IYK0pq5m1jQ==
X-CSE-MsgGUID: IcDVnvBDRZykzJW1MZVfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="266816095"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 09:00:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:00:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 09:00:08 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:00:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7MmEcxWEf4ayzIiBy1SKBQLZk2ikhGlQPeQvDkdSJfPfaTVysJiUPORNzEXas93rExrIE77FFpHFvU8vraN01dckysGNGAUmnT08TN6oxaI+B+SNVKObrP7azXukr5KRgcS+i7u+4CumM8gfZXSz8blUzeXr51GGDyE4DefteQdQPAZVGNmMWE1jVkSI5xtb3gbjFuFPRybwTitB6Eos9J+k+DoHQy5PcdG8jWkFHWMa9uHOu3jJ3R3IGFign8ts7wx4IjjJFOSvkMwuzEt/iI2aICPy8nEeMEpd2X8nlF+habNBbTzm52y+XhPYq5i9kywe3ANBxMropm7HDRajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaCLccEcsu/yHnYNNp5bUPEUynB2GEmeBpPeTz2mLiU=;
 b=cV79UrdnqIaGxVKIM6jadDhY5eWyfwAqcrH6Hm15aDPzHkxqL02sSTTbYdbZXh+0QfYnSO4czajs9nwCyLA/RzJfF1oyqxB8qmHqbhazDJ4nCsjUArK6fMuP7VubMYsVogCoFVoZsqNSBpPgnHEhJk93SG+qiv23sqa1sd7RQY6FZy41kFAZ3BfiCRKZ/zTIlvwH+AjISnK5x8jQRoqA1gNf+FGAObxmIgCFLDuytgXobbCu9d5TxhhlKjoA/F0d7uPFRUGwdlB5HCQeijYLJWITfI+ohaJ/jeobcwFr5yaob5GULARG6czr2jcu9uk3aUJItb5iiFPqogvC8HlyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SJ0PR11MB5937.namprd11.prod.outlook.com
 (2603:10b6:a03:42c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 16:00:04 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 16:00:04 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
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
Subject: RE: [PATCH v5 16/18] drm/xe/vsec: Add PMT GUID internal access
Thread-Topic: [PATCH v5 16/18] drm/xe/vsec: Add PMT GUID internal access
Thread-Index: AQHdO+Bbk9qXuE7mk0qZ6BLWvntZoLa+iHAAgAACWcA=
Date: Fri, 4 Sep 2026 16:00:04 +0000
Message-ID: <CH3PR11MB0461498EE35FFFC68FB3089637C1B52@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-36-michael.j.ruhl@intel.com>
 <599e779d-6a72-460d-8af6-8a6cdb1e09df@intel.com>
In-Reply-To: <599e779d-6a72-460d-8af6-8a6cdb1e09df@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SJ0PR11MB5937:EE_
x-ms-office365-filtering-correlation-id: e7d82974-c629-4519-c2cb-08df0a9d9580
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|11063799006|921020|10067099003|4143699003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: SymHLm4GMaGlApuPuT3tfVZNITZDxsH5PSRqAUhO6SBE/78ZM82j/mfUu6mx5Pa4KJ07kxhVOOwg9ADSrGABPsLXco/x5vqWApqhV758lcrpCZR654wbnFi7aHe0Rp+3sRw40Qa8C8KQAGrRRsO/FAPT0s3ZNgJFinSHuNoDy5gsv+96QfYDt/JsfTXCr9VxiIEguC1osRI9qfnzHhWzpKM5iTpplBiXH7NVatDziBZ9VzQK1EKk7kM/0efztow9I45kjcu+vM9ASv0OPlFRBM2W/b1uUd4181eSfTB3RMeAkO7evsJO/FO6MciGlUxzGlw8HQmANNqGupLcNE8n9dh0mUBMwDji+c9lKMJ6zDX/kqhhmEjjRcqzdWOaZwG3gOCag4EGTz3+KiV7MrGDwys5XMSrBuKQrfe10RjLT+f+VP+KZqgYjC1I+tiAs2kyI4tpTWZIUfWO1jZK6HMkzO+PDG9J6BX3NuPjN+5J8LjES1D2RAyeukqW+AW9HqzUGacavSJrE5wAAf1KsWYukwf6atxkhqF4wGKkpgUeHHrCdKeeVF7xeSe/wpTDiV3T08JEjEAUYSWYMHnLF7l/N3UMWiTTD7Mh5bGM16G44d1DJH+q9qUqpER4XkeDDnV1tQDhfvu+WzyoCvrbO8bS/VMgHork1U2BwjCwIuungCCyY9iYL6w6CkXKjxf3IGh5tlNocErSpIh0g7flvNW82uA6lYTzNwKxaab7aG1Ij/ZWIl47rmEBVCka0BiIJXG9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(921020)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFhwZXhXL0N2Y1ZEdTFYWmlXWDhSODFHd3N3c0dxYThxMzZVN3BXZEg3Q0pD?=
 =?utf-8?B?eEgwNUtWZjc3bEpJNEdnSmZzUEZhRHAxS2RUZmpvRG9hb0RTQk5DU2hlVlM1?=
 =?utf-8?B?eUdPZzFLWWhCbGlZaldtSmdFYXozdnVtbkJBUGhLbEhDemltZk42U1ZqL3Jl?=
 =?utf-8?B?SElNbGtsVGJGRWJ5MmpqeEpoNk5lTTFuWFh6b0tsT0lzSFRVZDlGa2xtSDFM?=
 =?utf-8?B?MUJIejBKcEFoR2lBdFZqR3JCNDlxKzlPcld4OEx5d1NkWno5bGlka3dWMFEr?=
 =?utf-8?B?eVdHcFlPVC95c0gzV1o4aUdiU0RsOXkvMWhsUGZhWlVESHE0eTRhV0pDVE1m?=
 =?utf-8?B?VE1OZTZhRmsxS3FPZWQ2MUVDSlVIVHo2UUl0SUFlNnFtci9DRUpQK0Nndlky?=
 =?utf-8?B?Q21JNTJVNWR3Y0NNYUFyRFNrbTJMRnJjNDN0UXJKSlZicEZZcFlXQmZtVzNV?=
 =?utf-8?B?M3hlY05FVElmem9NWHNyNFZzV1R6SGJpWWxUR01KZ2RpaGNCSm80N2dHSWJV?=
 =?utf-8?B?TkZ0WmFIbmw4SG9ZNk9vYXlkUHk5SjFNYk5rM3VqOS9QZEFaZGdMeVZUcnVX?=
 =?utf-8?B?WngwcW56OG1VNXBiWGR4bW5ONlYyRmZRRUM4bjBSRWlHalZ1bWZFSWw0MW5X?=
 =?utf-8?B?MkgrdE5jbllCcmwvMlVONUJCOExXZEVvTXlNT3c3RStJSEFKcnRtalVpYjNC?=
 =?utf-8?B?b1FDOXI0ZXRpTUw3aDYzM1IwS2R2MFN0U080MTNIMVZPclpIZk1qdmFWbUxz?=
 =?utf-8?B?UmFYenY5aTJ2ZVRhYmNqdDZRQm0xOXhaUUl2MkdyTHhyUU9VVGxPdE9JenZR?=
 =?utf-8?B?RFplbmZVRkVSQmZ2SEZMQjRiUkNJRnN6WTUybGFhRytONFhwSEZBdmxQOUNx?=
 =?utf-8?B?UXlybk5wNHpUSkY4R0I5TEZOWGVOUWt5L29ZRUsrVzgxL1NoRUt3UlhncjEy?=
 =?utf-8?B?am5BMUJndGxBbnlhdVk5anpzRnJwUVBIYk9heXQyOHVsZ2Zja211SzhDN3k0?=
 =?utf-8?B?OWRhak9OVXRmNWl4ZzVDak54V3UydUdJYjJvcXlGclBmTElhRFhYK1ZaclZO?=
 =?utf-8?B?STFwOEROcmFsZ0V6QWFUUCs4VUVCUmsrci9SV3NpY09aeUJhd2Q3bk8vcjZv?=
 =?utf-8?B?YkdDdUlMTGxLV0IreHhRdTdPQ1F1ZGVEWTY0V2RkaE1rRkh3RXZUSUc4Sngw?=
 =?utf-8?B?bExZSkpKZmlNWTE1UFBEMDFFKzJXM3VJc2RhaENnTDU5OHRpNEFYcFVuRFcr?=
 =?utf-8?B?K2xST0lRRElJL1licXd0TDZJWG10bXU1RTZCdnJ1UjhYUEljZ25sMU9kZUNR?=
 =?utf-8?B?KzY0WmtOTXkyYTBnRVdKeUJOTnBLMU55VkRHMmM3K2ZGYWZRNEdtanc5ZE1Z?=
 =?utf-8?B?dkcxRzJMdEg0RlRxRjZmUTFTZ21xa2MrTm1NL25TNko0bFJHa3AxUUl2TTFl?=
 =?utf-8?B?OTVmdFdFY2J0YXlOTXNUVG9aUGxsVElaTVRQVlNZSUxjN05LMStRVkFoQzFR?=
 =?utf-8?B?NFNFK01QR3I1MjBmMjcrOHorenZ3S2Y1OGhGY25iQkxlZUdOQVpCWGZZYlJZ?=
 =?utf-8?B?clF0T0U0WUNJODlhMGdFKzVsdnNsRWEybExNNEhzSm5yMG94eS91anJHZHl0?=
 =?utf-8?B?eWtDT0FkVVYxamNteVFmc3pvWEQzVzZnSFRhbVdUN3BITjNXekRBbGNnUE1E?=
 =?utf-8?B?bk4rbmpEVTJpSlJ4VzkwMnJhU2d1bm03YlN1Ni9zRXEwbGYveVJRM20xVmlM?=
 =?utf-8?B?SDJJU1hUWGMyeTRraUZUUGVOYnhpSUUwSy9FSU8wVjhPOCt6blcxdFVuSlZo?=
 =?utf-8?B?NEhvSnNLVW1NSUhIcjh3aCtFWkdZNnpaV3pST2R0NjBwa3hDYnAvdjJNMWYx?=
 =?utf-8?B?UkdnbFJlK3hmZFlZZnY0VFJFaUUyUFRIdmRhVytCZUlGTWx4dlVZK3NBVSsz?=
 =?utf-8?B?cGpHdXRnVHJQemsrN0duQ2QzYkdtSXVhWExGUmFGazBVTUM0cG9uY044dEdp?=
 =?utf-8?B?RUVTODhOZkd6d3dhS204ZnYrN2FXOUZyV29LNXpYelJOM0N4bWNVSnVHNVV4?=
 =?utf-8?B?cnlvRE03RzVPOERxVFl0MzA3cVE1akZPYUhPejdrTERkbU5abXVIZmFnNkgv?=
 =?utf-8?B?NXk1NmVGOWh3NllUZmxKUmR4ZThQQ2RHaXVtcE9ia2RGdTNjamUxa2lzdmZx?=
 =?utf-8?B?VnJOZFU4U3B1UFY5bkMwcHFSeGhpRTBadlBmT3lpZG02TkE4VjlTTnhETU9K?=
 =?utf-8?B?NTRJV1ZnZm9QTVgrNGlXNVZPQ2FoU010ekNtMnNiSDZuV3NBOUNITDd6aEds?=
 =?utf-8?B?ZnhPVmJwMDdlbHIzdUxmK1A1RHQ4Z3prV0ZvVzFRaU5uckdtVGh2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: htUGvLzFFoPPGTT183EqJ0GRXyo85Q6iG3VAtQO2aNLis5VxbUTozKWm5VSAVOhKMU9D0lZugowS8CtZwXvNJ9AzF3khWEezoT3qT/X0NBECfa0JhlCAtfc0p7ULyH8U8f+A3zXyccnpAIraysRWHrk86iuzqBHpBcQyy21DQv9Gx530eQU2dCNtC2fHUXv2opyXTiVjl+VKhRWLyMhHO1owBsSa7EJXS256SYMJ5bmSwWmNuXBlRptA5qCUsES/1vAC77SyqFQeRvIEY0FqGVk0fc5YMgSQrAIdwRmryLkDE0B7bsxu7+FvrAtv6UUEROVLFslOLSCQI4f3tbvQHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d82974-c629-4519-c2cb-08df0a9d9580
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 16:00:04.4104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tno2/eGuVoCDUAfvJRlGxycXAnbbFK5zkTserVUDvsvGVVONS4QQ4Sksb7uOOEkNPTQHJjab+FoZuGmGgGvBkEXb4AJag9hPt9M6HqARSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUG9vc2EsIEthcnRoaWsgPGthcnRo
aWsucG9vc2FAaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDQsIDIwMjYgMTE6
MTUgQU0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+OyBw
bGF0Zm9ybS1kcml2ZXItDQo+eDg2QHZnZXIua2VybmVsLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBoYW5zZ0BrZXJuZWwub3JnOw0KPmlscG8uamFydmluZW5AbGludXguaW50
ZWwuY29tOyBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Ow0KPlZpdmks
IFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbTsNCj5haXJsaWVkQGdtYWlsLmNvbTsgc2ltb25hQGZmd2xsLmNoOyBkYXZpZC5l
LmJveEBsaW51eC5pbnRlbC5jb207IFZpamF5LA0KPkFub29wIEMgPGFub29wLmMudmlqYXlAaW50
ZWwuY29tPjsgTmlsYXdhciwgQmFkYWwNCj48YmFkYWwubmlsYXdhckBpbnRlbC5jb20+OyBSb3Bl
ciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsNCj5BdXNtdXMsIEphbWVz
IDxqYW1lcy5hdXNtdXNAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMTYvMThd
IGRybS94ZS92c2VjOiBBZGQgUE1UIEdVSUQgaW50ZXJuYWwgYWNjZXNzDQo+DQo+DQo+T24gMDQt
MDktMjAyNiAwMTo0MCwgTWljaGFlbCBKLiBSdWhsIHdyb3RlOg0KPj4gWGUgYWNjZXNzZXMgdGhl
IFBNVCBpbmZyYXN0cnVjdHVyZSBkaXJlY3RseS4gVGhlIGN1cnJlbnQgdXNhZ2UgaXMNCj4+IHN1
cHBvcnRlZCBPTkxZIGJ5IEJNRyBkZXZpY2VzLg0KPj4NCj4+IENSSSBoYXMgZnVydGhlciByZXF1
aXJlbWVudHMgZm9yIGFjY2Vzcy4NCj4+DQo+PiBBZGQgdGhlIHBsYXRmb3JtIGlkIHRvIHRoZSBH
VUlEIHJlZ2lzdGVyIGRlZmluZSBhbmQgdXNlIHRoYXQgZm9yIHRoZQ0KPj4gcmVnaXN0ZXIgYWNj
ZXNzLg0KPj4NCj4+IEFkZCBhbiBBUEkgdG8gYWxsb3cgYWNjZXNzIHRoZSBHVUlEIGJhc2VkIG9u
IHRoZSBwbGF0Zm9ybS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1p
Y2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0veGUv
cmVncy94ZV9wbXQuaCAgICAgfCAgNCArKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
YnVnZnMuYyAgICAgIHwgIDMgKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90
eXBlcy5oIHwgIDIgKysNCj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3bW9uLmMgICAgICAg
IHwgIDIgKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlLmMgICAgICAgIHwgIDIg
Ky0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyAgICAgICAgIHwgNDQNCj4rKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2Vj
LmggICAgICAgICB8ICAxICsNCj4+ICAgNyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
cmVncy94ZV9wbXQuaA0KPmIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfcG10LmgNCj4+IGlu
ZGV4IDJmNjY1ODM5NTU4Ny4uZmI1YjVhODY0OGJhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3JlZ3MveGVfcG10LmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdz
L3hlX3BtdC5oDQo+PiBAQCAtMTAsNyArMTAsNyBAQA0KPj4gICAjZGVmaW5lIEJNR19QTVRfQkFT
RV9PRkZTRVQJCTB4REIwMDANCj4+ICAgI2RlZmluZSBCTUdfRElTQ09WRVJZX09GRlNFVAkJKFNP
Q19CQVNFICsNCj5CTUdfUE1UX0JBU0VfT0ZGU0VUKQ0KPj4NCj4+IC0jZGVmaW5lIFBVTklUX1RF
TEVNRVRSWV9HVUlEDQo+CVhFX1JFRyhCTUdfRElTQ09WRVJZX09GRlNFVCArIDB4NCkNCj4+ICsj
ZGVmaW5lIEJNR19QVU5JVF9URUxFTUVUUllfR1VJRA0KPglYRV9SRUcoQk1HX0RJU0NPVkVSWV9P
RkZTRVQgKyAweDQpDQo+PiAgICNkZWZpbmUgQk1HX0VORVJHWV9TVEFUVVNfUE1UX09GRlNFVAko
MHgzMCkNCj4+ICAgI2RlZmluZQlFTkVSR1lfUEtHCQkJUkVHX0dFTk1BU0s2NCgzMSwgMCkNCj4+
ICAgI2RlZmluZQlFTkVSR1lfQ0FSRAkJCVJFR19HRU5NQVNLNjQoNjMsIDMyKQ0KPj4gQEAgLTI0
LDYgKzI0LDggQEANCj4+ICAgLyogZm9yIENSSSBkaXNjb3ZlcnkgYW5kIHRlbGVtZXRyeSBhcmUg
aW4gYW4gaW5kZXhlZCB3aW5kb3cgKi8NCj4+ICAgI2RlZmluZSBDUklfUE1UX09GRlNFVAkJCShT
T0NfQkFTRSArDQo+WEVfUE1UX0JBU0VfT0ZGU0VUKQ0KPj4NCj4+ICsjZGVmaW5lIENSSV9QVU5J
VF9URUxFTUVUUllfR1VJRAlYRV9SRUcoQ1JJX1BNVF9PRkZTRVQgKw0KPjB4NCkNCj4+ICsNCj4+
ICAgI2RlZmluZSBCTUdfTU9EU19SRVNJREVOQ1lfT0ZGU0VUCQkoMHg0RDApDQo+PiAgICNkZWZp
bmUgQk1HX0cyX1JFU0lERU5DWV9PRkZTRVQJCSgweDUzMCkNCj4+ICAgI2RlZmluZSBCTUdfRzZf
UkVTSURFTkNZX09GRlNFVAkJKDB4NTM4KQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZWJ1Z2ZzLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4+
IGluZGV4IDI4MTM1Zjg0ZTI4Ni4uYjAxZjFlNjQ5YjUxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RlYnVnZnMuYw0KPj4gQEAgLTEwMSwxMCArMTAxLDExIEBAIHN0YXRpYyB2b2lkIHJlYWRfcmVz
aWRlbmN5X2NvdW50ZXIoc3RydWN0DQo+eGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX21taW8gKm1t
aW8sDQo+PiAgIAkJCQkgICB1MzIgb2Zmc2V0LCBjb25zdCBjaGFyICpuYW1lLCBzdHJ1Y3QNCj5k
cm1fcHJpbnRlciAqcCkNCj4+ICAgew0KPj4gICAJdTY0IHJlc2lkZW5jeSA9IDA7DQo+PiArDQo+
dGhpcyBjYW4gYmUgcmVtb3ZlZA0KDQp3aWxsIGZpeC4NCg0KDQo+PiAgIAlpbnQgcmV0Ow0KPj4N
Cj4+ICAgCXJldCA9IHhlX3BtdF90ZWxlbV9yZWFkKHhlLT5kcm0uZGV2LA0KPj4gLQkJCQl4ZV9t
bWlvX3JlYWQzMihtbWlvLA0KPlBVTklUX1RFTEVNRVRSWV9HVUlEKSwNCj4+ICsJCQkJeGVfbW1p
b19yZWFkMzIobW1pbywNCj5CTUdfUFVOSVRfVEVMRU1FVFJZX0dVSUQpLA0KPj4gICAJCQkJJnJl
c2lkZW5jeSwgb2Zmc2V0LCBzaXplb2YocmVzaWRlbmN5KSk7DQo+PiAgIAlpZiAocmV0ICE9IHNp
emVvZihyZXNpZGVuY3kpKSB7DQo+PiAgIAkJZHJtX3dhcm4oJnhlLT5kcm0sICIlcyBjb3VudGVy
IGZhaWxlZCB0byByZWFkLCByZXQgJWRcbiIsDQo+bmFtZSwgcmV0KTsNCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj5iL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPj4gaW5kZXggNjllMDUyYWM1YTgyLi4yYThjNTE5ZTE2
MzkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPj4gQEAgLTQ3
Myw2ICs0NzMsOCBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4+ICAgCQlzdHJ1Y3QgZGVsYXllZF93
b3JrIHdvcms7DQo+PiAgIAkJLyoqIEBwbXQucmV0cnlfY291bnQ6IGxhdGUtYmluZCBwcm9iZSBy
ZXRyeSAqLw0KPj4gICAJCXUzMiByZXRyeV9jb3VudDsNCj4+ICsJCS8qKiBAcG10LnB1bml0X2d1
aWRfY2FjaGU6IGNhY2hlIG9mIHRoZSBQVUlOVCBHVUlEICovDQo+PiArCQl1MzIgcHVuaXRfZ3Vp
ZF9jYWNoZTsNCj4+ICAgCX0gcG10Ow0KPj4NCj4+ICAgCS8qKiBAc29jX3JlbWFwcGVyOiBTb0Mg
cmVtYXBwZXIgb2JqZWN0ICovDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2h3bW9uLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od21vbi5jDQo+PiBpbmRleCA1Mjg0
Y2FiNjcwM2QuLmI5NzQwMjI0ZTA3ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9od21vbi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdtb24uYw0KPj4g
QEAgLTUxOSw3ICs1MTksNyBAQCB4ZV9od21vbl9lbmVyZ3lfZ2V0KHN0cnVjdCB4ZV9od21vbiAq
aHdtb24sDQo+aW50IGNoYW5uZWwsIGxvbmcgKmVuZXJneSkNCj4+ICAgCQl1NjQgcG10X3ZhbDsN
Cj4+DQo+PiAgIAkJcmV0ID0geGVfcG10X3RlbGVtX3JlYWQoaHdtb24tPnhlLT5kcm0uZGV2LA0K
Pj4gLQkJCQkJeGVfbW1pb19yZWFkMzIobW1pbywNCj5QVU5JVF9URUxFTUVUUllfR1VJRCksDQo+
PiArCQkJCQl4ZV9tbWlvX3JlYWQzMihtbWlvLA0KPkJNR19QVU5JVF9URUxFTUVUUllfR1VJRCks
DQo+PiAgIAkJCQkJJnBtdF92YWwsDQo+Qk1HX0VORVJHWV9TVEFUVVNfUE1UX09GRlNFVCwJc2l6
ZW9mKHBtdF92YWwpKTsNCj4+ICAgCQlpZiAocmV0ICE9IHNpemVvZihwbXRfdmFsKSkgew0KPj4g
ICAJCQlkcm1fd2FybigmaHdtb24tPnhlLT5kcm0sICJlbmVyZ3kgcmVhZCBmcm9tIHBtdA0KPmZh
aWxlZCwgcmV0ICVkXG4iLCByZXQpOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wY29kZS5jDQo+Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuYw0KPj4gaW5kZXgg
ZDUwMjIwNWJiNzJhLi44NDRkOGM2ZmFjZTYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfcGNvZGUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlLmMN
Cj4+IEBAIC0zNjksNyArMzY5LDcgQEAgaW50IHhlX2dldF9wY29kZV92ZXJzaW9uKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLA0KPnN0cnVjdCB4ZV9wY29kZV92ZXJzaW9uICp2ZXJzaW9uKQ0KPj4gICAJ
Z3VhcmQoeGVfcG1fcnVudGltZSkoeGUpOw0KPj4NCj4+ICAgCXJldCA9IHhlX3BtdF90ZWxlbV9y
ZWFkKHhlLT5kcm0uZGV2LA0KPj4gLQkJCQl4ZV9tbWlvX3JlYWQzMih4ZV9yb290X3RpbGVfbW1p
byh4ZSksDQo+UFVOSVRfVEVMRU1FVFJZX0dVSUQpLA0KPj4gKwkJCQl4ZV9tbWlvX3JlYWQzMih4
ZV9yb290X3RpbGVfbW1pbyh4ZSksDQo+Qk1HX1BVTklUX1RFTEVNRVRSWV9HVUlEKSwNCj4+ICAg
CQkJCSh1NjQgKil2ZXJzaW9uLCBQVU5JVF9WRVJTSU9OX09GRlNFVCwNCj5zaXplb2YoKnZlcnNp
b24pKTsNCj4+ICAgCWlmIChyZXQgIT0gc2l6ZW9mKCp2ZXJzaW9uKSkgew0KPj4gICAJCXhlX3dh
cm4oeGUsICJwY29kZSB2ZXJzaW9uIHJlYWQgZnJvbSBQTVQgZmFpbGVkLCByZXQgJXBlXG4iLA0K
PkVSUl9QVFIocmV0KSk7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zz
ZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+IGluZGV4IDQ4Y2FjZDIzYjA3
MS4uODk2ZGZiMDExYmFmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zz
ZWMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gQEAgLTU2Niw2
ICs1NjYsNTAgQEAgc3RhdGljIHZvaWQgdnNlY19kaXNhYmxlX2xhdGVfYmluZF93b3JrKHZvaWQg
KmFyZykNCj4+ICAgCQl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiAgIH0NCj4+DQo+PiAraW50
IHhlX3ZzZWNfZ2V0X2d1aWQoc3RydWN0IHhlX2RldmljZSAqeGUsIHUzMiAqZ3VpZCkNCj4+ICt7
DQo+PiArCXN0cnVjdCB4ZV9tbWlvICptbWlvID0geGVfcm9vdF90aWxlX21taW8oeGUpOw0KPj4g
KwlpbnQgcmV0ID0gMDsNCj4+ICsNCj4+ICsJaWYgKElTX1NSSU9WX1ZGKHhlKSkNCj4+ICsJCXJl
dHVybiAtRUlOVkFMOw0KPj4gKw0KPj4gKwlpZiAoIXhlX3BtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2
ZSh4ZSkpDQo+PiArCQlyZXR1cm4gLUVOT0RBVEE7DQo+PiArDQo+PiArCW11dGV4X2xvY2soJnhl
LT5wbXQubG9jayk7DQo+PiArDQo+PiArCWlmICh4ZS0+cG10LnB1bml0X2d1aWRfY2FjaGUpIHsN
Cj4+ICsJCSpndWlkID0geGUtPnBtdC5wdW5pdF9ndWlkX2NhY2hlOw0KPj4gKwkJZ290byB1bmxv
Y2s7DQo+PiArCX0NCj5jYW4geW91IGFkZCBhIGNvbW1lbnQgaGVyZSB0aGF0IGd1aWQgZG9lc24n
dCBjaGFuZ2UgYWZ0ZXIgZmlyc3QgcmVhZC4NCj4+ICsNCj4+ICsJc3dpdGNoICh4ZS0+aW5mby5w
bGF0Zm9ybSkgew0KPj4gKwljYXNlIFhFX0JBVFRMRU1BR0U6DQo+PiArCQkqZ3VpZCA9IHhlX21t
aW9fcmVhZDMyKG1taW8sDQo+Qk1HX1BVTklUX1RFTEVNRVRSWV9HVUlEKTsNCj4+ICsJCWJyZWFr
Ow0KPj4gKw0KPj4gKwljYXNlIFhFX0NSRVNDRU5USVNMQU5EOg0KPj4gKwkJeGUtPnNvY19yZW1h
cHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLA0KPkNSSV9JRFhfVEVMRU1fRElTQ09WRVJZKTsNCj4+
ICsJCSpndWlkID0geGVfbW1pb19yZWFkMzIobW1pbywNCj5DUklfUFVOSVRfVEVMRU1FVFJZX0dV
SUQpOw0KPj4gKwkJYnJlYWs7DQo+PiArDQo+PiArCWRlZmF1bHQ6DQo+PiArCQkqZ3VpZCA9IDA7
DQo+PiArCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAiVW5zdXBwb3J0ZWQgcGxhdGZvcm06ICV1XG4iLCB4
ZS0NCj4+aW5mby5wbGF0Zm9ybSk7DQo+PiArCQlyZXQgPSAtRUlOVkFMOw0KPj4gKwkJYnJlYWs7
DQo+PiArCX0NCj4+ICsNCj4+ICsJeGUtPnBtdC5wdW5pdF9ndWlkX2NhY2hlID0gKmd1aWQ7DQo+
eW91IGNhbiBzZXQgY2FjaGUgb25seSB3aGVuIGd1aWQgaXMgdmFsaWQNCj4NCj5pZigqZ3VpZCkN
Cj4NCj4gICAgeGUtPnBtdC5wdW5pdF9ndWlkX2NhY2hlID0gKmd1aWQ7DQoNCkkgZGlkIHBvbmRl
ciB0aGF0Li4uIGFuZCBkZWNpZGVkIHRoYXQgc2V0dGluZyB0aGUgY2FjaGUgd2l0aCAiaW52YWxp
ZCIgd2FzIHJlYXNvbmFibGUuLi4NCihpLmUuIGFsd2F5cyBzZXQgdGhlIGNhY2hlKS4uLg0KDQpJ
IHdpbGwgZG8gdGhlIGFib3ZlLg0KDQptDQoNCg0KPj4gKw0KPj4gK3VubG9jazoNCj4+ICsJbXV0
ZXhfdW5sb2NrKCZ4ZS0+cG10LmxvY2spOw0KPj4gKwl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+
PiArDQo+PiArCXJldHVybiByZXQ7DQo+PiArfQ0KPj4gKw0KPj4gICAvKioNCj4+ICAgICogeGVf
dnNlY19pbml0IC0gSW5pdGlhbGl6ZSByZXNvdXJjZXMgYW5kIGFkZCBpbnRlbF92c2VjIGF1eGls
aWFyeQ0KPj4gICAgKiBpbnRlcmZhY2UNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdnNlYy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuaA0KPj4gaW5kZXggYzRh
MWUyZmM2N2Q4Li41MDE4N2ZkYzEyMDcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdnNlYy5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5oDQo+PiBA
QCAtMTAsNiArMTAsNyBAQCBzdHJ1Y3QgZGV2aWNlOw0KPj4gICBzdHJ1Y3QgeGVfZGV2aWNlOw0K
Pj4NCj4+ICAgaW50IHhlX3ZzZWNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+PiAraW50
IHhlX3ZzZWNfZ2V0X2d1aWQoc3RydWN0IHhlX2RldmljZSAqeGUsIHUzMiAqZ3VpZCk7DQo+PiAg
IGludCB4ZV9wbXRfdGVsZW1fcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBndWlkLCB1NjQg
KmRhdGEsIGxvZmZfdA0KPnVzZXJfb2Zmc2V0LCB1MzIgY291bnQpOw0KPj4NCj4+ICAgI2VuZGlm
DQo=
