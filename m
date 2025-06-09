Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5562550CA
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480155; cv=fail; b=F6DX2NLv2xIrB25uNyaPbuFfyIIMtca8oFw2L/teYIDm6lWxZzDHHF9HAM3Bsr2xgwMhOnyL701kYeEqKE9ViFRkTXL0rZ3EJRkRT7nivXEbfvsudlwT6CpQTrAOLlzt2ASLbLspgEfjAoIlvurE5HroESxUAVgedUWhctS4og0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480155; c=relaxed/simple;
	bh=SerAjiMWgqVMqzbVn5JghMvMYd1ddSBV+GAkOjxkqmY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VRysiHYUM+Vuh9YON+ZXFtwbZhvE+wfwRs8xFribInSd6Ka5RIAEtETl2uKQ2VS4kT30xqjMA6/Sdj/OBol1DXrFWLpm+SSkD6tKlrK82TP9b+l4Dl+rQhzDuuX4lVl3qrFTHiXIDAtQQuZWL86VY19MyTjzfPsoa6/Y3d/woVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nm+AJ1PB; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nm+AJ1PB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749480155; x=1781016155;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SerAjiMWgqVMqzbVn5JghMvMYd1ddSBV+GAkOjxkqmY=;
  b=Nm+AJ1PBaKxfLQ4nZ6UotODEmsg6o26kXJkjwkOxXCwCtJCe/ikVmDhR
   G5KCwVu9tKBQITbY5urVCiA3/IlRD1rUrXmI1HxBmLRQWvPL6q5jkVYJZ
   A13SOl3fp6n5ANCSL7ctDBMVo+VR5REi7n7B6mhQtQrAofKMcozxgZxgt
   4S4tjlk2JqIE1qxqlC5/dDLXh/CdM1ODMq1C4jkAIjRRkqTpq7JIsPFf9
   BziTj+Cj1z9/TX7ObEVdU//WEscWPmAWh0IJpHYDjc/xC9xeLwKp6Izx5
   wBIhKDgZzM+wtHEMk+3CES+bLRRj89SRNf6i5Ri9EQUO9RuxDqaW7u1a5
   g==;
X-CSE-ConnectionGUID: Fxr67/rtR6SZmp84F7/I9Q==
X-CSE-MsgGUID: QIF6e3puT/GCAHc/RHpdRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51266308"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51266308"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:42:34 -0700
X-CSE-ConnectionGUID: vIyTSRrVTzywCIJJqcfQzA==
X-CSE-MsgGUID: 2100R4EXS3CLsbstvMwgHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151341506"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:42:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 07:42:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 07:42:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.57) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 07:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOsQ7qFFkGnxVe+89dpk6I9k74fu9nv6B/qjjGNZEj6zk7Am/s8HfpfiuciHY0gd88vB515Uuk8x5WYBjrlOdutbQaIbwHggMqxvhMPwwD7cJDFtc2hcNe+nbG4kqvoLlKUSeVLJFLZa/otM4bP2/HX4vKq6FzlwmLBasG1Nh6qQLLpB6Kh56KXkLxAlwHyFAqVwux8PQi4XNd0mI0CGpuoQkzjZ9wk/L0gMX0j3jEZZhB/cFpny1igfOvwd7evwsqCvvLfEidFwrL37sd2lCoaQMRR1gMkGUrFhX1ualpusAQU85fdk4jIpPSl887zl2tB0W03MCZDKZx2gj6wv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SerAjiMWgqVMqzbVn5JghMvMYd1ddSBV+GAkOjxkqmY=;
 b=g2S3oeKg9S2f6sAUWTICSTJFKhEzqTGT77lgpJNv1G40aeFQ5tQk1UNeq8N4+ukEEZjihS9A0QNI16JSnydPmn9/eTLG15WRzwkL67slJucwhjZ2hksLUFx4yoanQf/9Mrtv+PtZo3Cg3OHbHYEWUYtwJganSm6vcGLwUBwvYw2QptMLrYQS+keklnmorut4/yVTzf6JKTQ9qRElH+f2QsSBbY6Pqb4mxkLMwt5VgNhLxuImxSf6Y4vbRTnNMwESwMkfwtU+mIKi83mltnM9i3NlQBMZi9xE8TWHSUtHbUA2huiN8WxbofJCjQuAUIXWNIB0qM6BaObUfUnlwwu7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Mon, 9 Jun
 2025 14:42:29 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:42:28 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Subject: RE: [PATCH v3 05/11] platform/x86/intel/pmt: use guard(mutex)
Thread-Topic: [PATCH v3 05/11] platform/x86/intel/pmt: use guard(mutex)
Thread-Index: AQHb1koN5n3WMhxU5UKJQCw3/HXJ+7P2pTeAgARHgKA=
Date: Mon, 9 Jun 2025 14:42:28 +0000
Message-ID: <IA1PR11MB6418C51611FF49B0087AE1B4C16BA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-6-michael.j.ruhl@intel.com>
 <57730404f39eab74df30dcc575495879972324ef.camel@linux.intel.com>
In-Reply-To: <57730404f39eab74df30dcc575495879972324ef.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB7450:EE_
x-ms-office365-filtering-correlation-id: 83b0ed44-06e6-48c7-f5cf-08dda763db71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?anNiNlM4Qm1xRVNvaHNZQnBvMm45c003N0dSM2xZb1lsSEpSZHdGM2h6WUVD?=
 =?utf-8?B?TGhiYVZ1aHR1bWFRY3pvR2pwYVJXNlpxVUsyY3JCOVZHL256c24zVENTTzQv?=
 =?utf-8?B?aTZONWNOaUNLS0JrM25JTkhKVFpRYTBJbDBTTXJ0bXZINmhlZ2FJWXQycUlW?=
 =?utf-8?B?cGJwcExGdlJIc3JiQ2d0bzU1azhDOGdlMlZ4SzcyTUpJTE9KOWpCRjJFOVE4?=
 =?utf-8?B?OTVzNjdVc2FjdzBEV1ZnZzl1L2FOYmpaSlUvWXRMQkJuYXVsNkYwS1hwYS85?=
 =?utf-8?B?aVAvdWVxV3ZLWlpKcVk2QlFjaGRsMllzbVh4cm50RDh1WkJISVVOQXo3bkp1?=
 =?utf-8?B?alVVU1hPcTJrczJBRGFFOGQ2aDVjMU9UQ2ZRckRKU29Rdkl3dFhWa0FXTDcr?=
 =?utf-8?B?K1JGdk5GTDNDcDRETGRrVXdvSnQxTStiZjVnaTJuRDExTVEzLzczQy96ZW8z?=
 =?utf-8?B?ZHJNaUFBa1Qxa0JoTUlTZXk4NWxhMEtUWk1HeDNmU2NvUFNpaVhiczhaTnEx?=
 =?utf-8?B?Tm16RjV6TEkxMUtTVjFSTUJzUU5hYktPVmNGNnRIOW5hL2hPeVZDR1BWUWpa?=
 =?utf-8?B?RTJrVGp0KzJ0ZkFBWTFkYnFiaHIyVk9hZEQ0UkVHclYrcGw5OGM5UFJIRjhS?=
 =?utf-8?B?QVUvWElSQ090SkRnY1BNZ0h5TEFjcnVrKytSM0IrcXQ2VjFvOUQ3S2ZGSEpY?=
 =?utf-8?B?S0ZRcFBoM1NnWVRkZElvM0dDM2FkcTBlUXh0ZmQwVUdCeUtLbTNCNzFsR2Zw?=
 =?utf-8?B?dm9WT3VvWHpiNHp6R3lzMzdDN0JyUDJkNHJaemM0cjNRYUI3eEJ4Q0ZZZFhK?=
 =?utf-8?B?OHBtb3p2dGQ3L3FNVk5xMDh5eGJtaWd5azZTd3hKVk9CZ2lvYm9CbVpQQjM3?=
 =?utf-8?B?T2FsOFJ1TFQyYVdOakZtVGNtRkJsdjAzcWFWamNoL0tFT1JET3B6L2Jkamtx?=
 =?utf-8?B?bVRuQjBydnUxaTRWS1RmcU9XSk9qZWROWXgzcUYvWWVvdGp6ZDdxRzhHYXBO?=
 =?utf-8?B?ek5hTzJoU3A3OXBTd2NIcjIrYnJ4VWZoMzJ3YVgwUHlRRmJjdDZEbUk1MkFB?=
 =?utf-8?B?WXlvcWUycXBNOWErL0tZZk9LYXlMTU9RdlNsNEtEc0pyT25oTVJrdlVSQ0hz?=
 =?utf-8?B?WmdSa3UveU5LL05sZkZqdEdFbG9UOHJwa2dFZ2tZS1VXM0t2UTJ6dDV5ckM5?=
 =?utf-8?B?eVgzd0dCZzBKZkVweHhBR1RnSEZENHVJY21YNkRKL3M3TnYvc3VkVXc0Sk51?=
 =?utf-8?B?Vm10S0YySis3T0hvUndCQUk4Nk9RR005cndEalp3VyswUmZkQS9nbzFMNGFs?=
 =?utf-8?B?RlE0cnhFYk5Uc2E0MDhCZG45RUtkZlpSb1h2YkU2MHVlQmtSd2RxNlNGV043?=
 =?utf-8?B?WGdPc3RJa21rOElBbDdOTzdYR1ovcUxUY29BMUtkUXVmZnZySnR0UXp0ZEw3?=
 =?utf-8?B?M0o3cGxmQ293NXZxVkZCZUVQTTJoM1UzeTVpaXY1VHlzN3pGaUhXczE5VE9K?=
 =?utf-8?B?N2dHNDgrcG1LOE4za2pWYUtjWTgrb0NuVmxpSWdwYnptZHc3dlozdVRteEJR?=
 =?utf-8?B?dWZQaUJQZnlCNjhWRVNRNjhjWmVncGppT2VFRzFWRVlIOGlKc3VhY3c0Q3Ez?=
 =?utf-8?B?Nm1ibmVxMVpjbGQwYkhBQ21xVlNNOVhnSTBDdlVVS0I0bG55amRYWEI3ZjRp?=
 =?utf-8?B?aXlsMFo2YjRqNkVvcDlmU0l6ZElJczQxelBTRDcrSUY4OTZTMFNTRjVwSHhC?=
 =?utf-8?B?dFdETmloRUhmakdFSnJaRDdUZTY3aUR2ZjFyTU5uTlJOY3hUVU9VYllRMTF1?=
 =?utf-8?B?bEpreXM0TTdSQi8vN0liNXdDcWNnT28raGREVFVWZ21vKy96dENyM1djUzE5?=
 =?utf-8?B?WDNIMUZHc042TXZsY2NnN1JFcHZjV2dvSWNRTWV5eUJEcjFOUGt2Tk9aRmp1?=
 =?utf-8?B?Nkt3dWR6NzhZMkhHUUpuS1RSaDhkYmdScktabTRzWGVOajloV1hxME85dzVw?=
 =?utf-8?Q?klsRTi0mohtP/4ng/GwJ6vuC+vrfzI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHRpL2RjUkpXSlFNUG50NU8zdVUrNTlMb1cySEYvdTZSb29NOFJsWWNkTHJp?=
 =?utf-8?B?SWt1Y3RtSCtQNzNpN0UzWFFINjZUSE9hTnQxWWwzdFM0dFc3WGJ4YlhnVmZv?=
 =?utf-8?B?WU56UFNNNUl1bUo1MVlMMGtyZ3A0dmVzV0laclR2TDZ2Skk2dTJHbTVuRHlC?=
 =?utf-8?B?Q0lwQk52aU4rQ0UzOC85WUgrVzlieHVaMCtWY1NYOTRCVDNqZTNqTGVvczU0?=
 =?utf-8?B?U2JXVTR6ZzduOGE0dy9uaFgvUEZ2eDFtOEV0ZHVxUFlwcXF1aDN4MGxlNzUw?=
 =?utf-8?B?TFFyb3hjaE5WVEVVQU9CQTg1aUhBbFI4ZDhwdzRhVE13bTVjKzZ3VU9rNEFW?=
 =?utf-8?B?VXZuMWcxUkFzTnI2WFBZdlMzV0kzSzc1bjRVa3NPTTFXOExzaFA0c3FzcHBP?=
 =?utf-8?B?ck5tcE8yeWlQdzYvQWxiQU9yd0g2aWtMUFp4cDgvdXZXak42THB1WExuTUNG?=
 =?utf-8?B?QUZjUW5UWGdMblN5eUpUdk5pRmxuY2luL3J4OHJlcUUvUWdLV3ZIREVWeXpE?=
 =?utf-8?B?RFhJTjJxL1RRSVBZdUpxSnUwcHVlNUk4R0VSTUVWZXZoV3VHTFhZQzRSR2NZ?=
 =?utf-8?B?WGZDUjl4U1F1bzB3STRjejhFbFQ3Y0s3azQzaGI3eXFWYXpJc2U2T0F6dmVX?=
 =?utf-8?B?a3AxRFIxUnpEZWo2QitGeENjWXNMZWZEODY4TWVKcjZnVW9MbFlDUGlDYy8v?=
 =?utf-8?B?YUttZ2FVNEtwbytzVU5rNHlpdjAxem4zQjFCeTBtTzEzYWhUYVhzaGlNU3Jo?=
 =?utf-8?B?MXUzNno5b2NDUHRUeUNaMFlPcy9mOXUxR2ZDNlk2WFZySkxBeVJVc3A1V0hD?=
 =?utf-8?B?M2cxSno4alBtajVSTm90K0ZxZUdFd0FtVmJ0eGZweUhDRUVtYnJNWnNhY25L?=
 =?utf-8?B?VXNpM2drd2hWUWtxdlgzc2RkdDNOZC9ZZHR1RU1pR3FTUG4rTjNEMjVxVFls?=
 =?utf-8?B?U2NDWGlSRDlKNnRaOEFNOVh2Vnkza2VRSVE4RHRtNUVBd1ZiNzlmNThNWC9x?=
 =?utf-8?B?SHI2cXRQSFFBKzhpWjZPM0wrMkE2VXRteE96clk1dHZuMWZOd2ZrdEJ4Qjgy?=
 =?utf-8?B?Mkl2M21uMlZqajQ4dEZYWEk2b2NJSUFFeVBLY1ZnY0t0Z2pjNmlvNVYyZWEr?=
 =?utf-8?B?VUFtVnl4WnVZMzA4aWJERGcwTzFOenhibTVNSkN4aWtlZ1Jxam5yaGVEYkZX?=
 =?utf-8?B?WWhaKzZHN2p2bzdzZFJCbFUzdmVRTGNVREt1dFpMNEM5Z0hldE5HYzVqUjla?=
 =?utf-8?B?NDVjOHh4Q2dKWlRlLytZZEFEZkNqOVhHVHdyR20rRWVRMjhtLzk1YkNDWVBV?=
 =?utf-8?B?bjVVMnVuWGx3U2FMcE1nNzFmMHZsbnRicVFQNVFGcXVQZW9OTGw1TVc3RU5v?=
 =?utf-8?B?VC9wY2dOU2VEUXJ3ZjlZWllUYTRpWktNR1RxcHJDaFBad0ppYXY5WlJ2NVlG?=
 =?utf-8?B?bWtpUTl0NjVKdjdtbkx2M3Z3V2ljODdVYjFDQmxTWEVuY0tJQzNRUkk1RTVq?=
 =?utf-8?B?Z2RheERxUEJ3N0Z1WGk1c1d6aUNXTjdvYm9TL3ozZUpkZGIrZlJleVFrOVNh?=
 =?utf-8?B?bzhGcmhtWmphVnRvd2pqaC9zNFptbHNWQWNoWHMxbmk5UGpKUzRmQ0RHd05D?=
 =?utf-8?B?STZoTnlGcnc3M3VJSmMrUTEzdW5DYUxHWlhTR0RoSjdFNmV3QUR5UUNpZjB6?=
 =?utf-8?B?b1ZpM3NvSVdNaS9ZMDlNMXY1WjlxZUJQYkd2MjBpNmowYThxRnorUUVadUhU?=
 =?utf-8?B?VlpPQkw3K0xRV2RHOHNEVEZQRzlEc01naUwzS0VJeDk0WEpHQ3lrYktZWGh1?=
 =?utf-8?B?Y3FtQTVMZ0JVSWZsR3BTTXVTdVBJS0FuV1JPQ0QyaWhqRVVkWDJaVTZqV1Rh?=
 =?utf-8?B?NWFwdXZvVkI1eFA4Wm1RR25ENkNqN3U5NFdRZGlTVDhULzFtaVJiQTc3Znlo?=
 =?utf-8?B?ZSttTVA2MFZWQklTZ0tNT1o5Yjl5dXJvZ0hqQXZ5WmNvYmkvd3g3eVVaRFp2?=
 =?utf-8?B?eDZmL0xWZ0VNUkZBV3lNMHd3czN3SWV4elptNUFQWUxQemVTRmlIZTRiNXBT?=
 =?utf-8?B?UEVFUDB3WVJRbkF4cTlrUFlrME1sWVZzZ2sva1pOY21QZmZXQ0tINjIwcDBj?=
 =?utf-8?Q?uvGWz+SKeX5fbWJFAZSQco6pG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b0ed44-06e6-48c7-f5cf-08dda763db71
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 14:42:28.1256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGDeeGyTfvoqol78e20PU7OVsaGFjlfOiO0/nbrYCgZYnq6FQFaLoCh+3fUTY1HAJY9yNmUeHraTOb6KwizVZ1sp/bCw36dO72FLLx653+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
X-OriginatorOrg: intel.com

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBEYXZpZCBFLiBCb3ggPGRhdmlk
LmUuYm94QGxpbnV4LmludGVsLmNvbT4NCj5TZW50OiBGcmlkYXksIEp1bmUgNiwgMjAyNSA1OjIx
IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgcGxh
dGZvcm0tZHJpdmVyLQ0KPng4NkB2Z2VyLmtlcm5lbC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgaGRlZ29lZGVAcmVkaGF0LmNvbTsNCj5pbHBvLmphcnZpbmVuQGxpbnV4Lmlu
dGVsLmNvbTsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsNCj5W
aXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxzdHJvbUBs
aW51eC5pbnRlbC5jb207DQo+YWlybGllZEBnbWFpbC5jb207IHNpbW9uYUBmZndsbC5jaA0KPlN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDUvMTFdIHBsYXRmb3JtL3g4Ni9pbnRlbC9wbXQ6IHVzZSBn
dWFyZChtdXRleCkNCj4NCj5PbiBUaHUsIDIwMjUtMDYtMDUgYXQgMTQ6NDQgLTA0MDAsIE1pY2hh
ZWwgSi4gUnVobCB3cm90ZToNCj4+IFVwZGF0ZSB0aGUgbXV0ZXggcGF0aHMgdG8gdXNlIHRoZSBu
ZXcgZ3VhcmQoKSBtZWNoYW5pc20uDQo+Pg0KPj4gV2l0aCB0aGUgcmVtb3ZhbCBvZiBnb3RvLCBk
byBzb21lIG1pbm9yIGNsZWFudXAgb2YgdGhlIGN1cnJlbnQgbG9naWMNCj4+IHBhdGguDQo+Pg0K
Pj4gUmV2aWV3ZWQtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVs
LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxA
aW50ZWwuY29tPg0KPj4gLS0tDQo+PiDCoGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC9j
cmFzaGxvZy5jIHwgMzIgKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4+IMKgMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY3Jhc2hsb2cuYw0KPj4gYi9kcml2ZXJz
L3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY3Jhc2hsb2cuYw0KPj4gaW5kZXggZTk5N2ZjNDhiOWNl
Li45NDg1OGJmYjUyZjggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRl
bC9wbXQvY3Jhc2hsb2cuYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10
L2NyYXNobG9nLmMNCj4+IEBAIC0xNTUsOSArMTU1LDkgQEAgZW5hYmxlX3N0b3JlKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0DQo+ZGV2aWNlX2F0dHJpYnV0ZQ0KPj4gKmF0dHIsDQo+PiDCoAlp
ZiAocmVzdWx0KQ0KPj4gwqAJCXJldHVybiByZXN1bHQ7DQo+Pg0KPj4gLQltdXRleF9sb2NrKCZl
bnRyeS0+Y29udHJvbF9tdXRleCk7DQo+PiArCWd1YXJkKG11dGV4KSgmZW50cnktPmNvbnRyb2xf
bXV0ZXgpOw0KPj4gKw0KPj4gwqAJcG10X2NyYXNobG9nX3NldF9kaXNhYmxlKCZlbnRyeS0+ZW50
cnksICFlbmFibGVkKTsNCj4+IC0JbXV0ZXhfdW5sb2NrKCZlbnRyeS0+Y29udHJvbF9tdXRleCk7
DQo+Pg0KPj4gwqAJcmV0dXJuIGNvdW50Ow0KPj4gwqB9DQo+PiBAQCAtMTg5LDI2ICsxODksMjQg
QEAgdHJpZ2dlcl9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdA0KPj4gZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwNCj4+IMKgCWlmIChyZXN1bHQpDQo+PiDCoAkJcmV0dXJuIHJlc3VsdDsN
Cj4+DQo+PiAtCW11dGV4X2xvY2soJmVudHJ5LT5jb250cm9sX211dGV4KTsNCj4+ICsJZ3VhcmQo
bXV0ZXgpKCZlbnRyeS0+Y29udHJvbF9tdXRleCk7DQo+Pg0KPj4gwqAJaWYgKCF0cmlnZ2VyKSB7
DQo+PiDCoAkJcG10X2NyYXNobG9nX3NldF9jbGVhcigmZW50cnktPmVudHJ5KTsNCj4+IC0JfSBl
bHNlIGlmIChwbXRfY3Jhc2hsb2dfY29tcGxldGUoJmVudHJ5LT5lbnRyeSkpIHsNCj4+IC0JCS8q
IHdlIGNhbm5vdCB0cmlnZ2VyIGEgbmV3IGNyYXNoIGlmIG9uZSBpcyBzdGlsbCBwZW5kaW5nICov
DQo+PiAtCQlyZXN1bHQgPSAtRUVYSVNUOw0KPj4gLQkJZ290byBlcnI7DQo+PiAtCX0gZWxzZSBp
ZiAocG10X2NyYXNobG9nX2Rpc2FibGVkKCZlbnRyeS0+ZW50cnkpKSB7DQo+PiAtCQkvKiBpZiBk
ZXZpY2UgaXMgY3VycmVudGx5IGRpc2FibGVkLCByZXR1cm4gYnVzeSAqLw0KPj4gLQkJcmVzdWx0
ID0gLUVCVVNZOw0KPj4gLQkJZ290byBlcnI7DQo+PiAtCX0gZWxzZSB7DQo+PiAtCQlwbXRfY3Jh
c2hsb2dfc2V0X2V4ZWN1dGUoJmVudHJ5LT5lbnRyeSk7DQo+PiArCQlyZXR1cm4gY291bnQ7DQo+
PiDCoAl9DQo+Pg0KPj4gLQlyZXN1bHQgPSBjb3VudDsNCj4+IC1lcnI6DQo+PiAtCW11dGV4X3Vu
bG9jaygmZW50cnktPmNvbnRyb2xfbXV0ZXgpOw0KPj4gLQlyZXR1cm4gcmVzdWx0Ow0KPj4gKwkv
KiB3ZSBjYW5ub3QgdHJpZ2dlciBhIG5ldyBjcmFzaCBpZiBvbmUgaXMgc3RpbGwgcGVuZGluZyAq
Lw0KPj4gKwlpZiAocG10X2NyYXNobG9nX2NvbXBsZXRlKCZlbnRyeS0+ZW50cnkpKQ0KPj4gKwkJ
cmV0dXJuIC1FRVhJU1Q7DQo+PiArDQo+PiArCS8qIGlmIGRldmljZSBpcyBjdXJyZW50bHkgZGlz
YWJsZWQsIHJldHVybiBidXN5ICovDQo+PiArCWlmIChwbXRfY3Jhc2hsb2dfZGlzYWJsZWQoJmVu
dHJ5LT5lbnRyeSkpDQo+PiArCQlyZXR1cm4gLUVCVVNZOw0KPj4gKw0KPj4gKwlwbXRfY3Jhc2hs
b2dfc2V0X2V4ZWN1dGUoJmVudHJ5LT5lbnRyeSk7DQo+PiArDQo+PiArCXJldHVybiBjb3VudDsN
Cj4+IMKgfQ0KPj4gwqBzdGF0aWMgREVWSUNFX0FUVFJfUlcodHJpZ2dlcik7DQo+Pg0KPg0KPkRv
bid0IHNlZSBpbmNsdWRlIGZvciBjbGVhbnVwLmguIElmIGFkZCB0aGVuDQoNCk1pc3NlZCB0aGF0
LiAgSSB3aWxsIHVwZGF0ZSB0aGUgZmlsZS4NCg0KPlJldmlld2VkLWJ5OiBEYXZpZCBFLiBCb3gg
PGRhdmlkLmUuYm94QGxpbnV4LmludGVsLmNvbT4NCg0KVGhhbmshDQoNCm0NCg==
