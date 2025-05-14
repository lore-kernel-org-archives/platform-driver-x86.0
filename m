Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789292A1C9
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 May 2025 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229923; cv=fail; b=rSiQKkBAANMZYDbdBkjt5nB1ARy5MJ6hCdtfTypRQ6W4+9ktSkYmr5WmCOofMquU5jRw93/19L2fjaSzUrz6ejV+Mdp66AFvwIYWTJcE3XbxTzxPTTJl9Q/ElSfHgp3nRkbMX/dZGJgpGH+ysgG3/bsMIwBdgO+c6NraNwQYwew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229923; c=relaxed/simple;
	bh=Ul4m/DQzkWPl2NB/EZhiKglPTVZJlN0vLdv2O1Hs7FU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iFnZUy8QRbCumrjLpvpKWiGbQy6MW+HbN+sjLlLRE9QWsud2f7HTd4BFHZ5IgPWSFGqD61DtQ/Pn+uo77NmPAaWe/oJ7JgN4mnQBdJZvDBX9domidHrWwFgjjMhZ4izvuxZb4eZMh7248vLXcF0z7N2bJt2OM+Y03URem9vZssQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS2w7IiV; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS2w7IiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747229921; x=1778765921;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ul4m/DQzkWPl2NB/EZhiKglPTVZJlN0vLdv2O1Hs7FU=;
  b=OS2w7IiV5dCEfiuvLxRCcOr0TPG1NWPPmNAPayLG7wgNczc960HM4Q7Q
   H/69bqHJcsRzpMTu8zt9dR3gNmxC9oSuSVcjVYlIbWV0BvGr5FHDvAK+j
   v916TOC869/TRPk7rTO2dS4H88aG9kMUVsf9YZ+BHqtA8tnjz9lbwHnnA
   uNaOfeUG3xqmlsd93bfTTNH26Cz7b6J4SKr2r3G7qNP0w17ljrLOM+3WX
   2+Kg3p0WiJBgQIIy4obwzyn3M9lVtxbPTzCUZRiQWP9xgzqMcwN0+Mb33
   0nFRE2tIS3LRJxH+X5SVXNx5PWUEfBkYp7PQWgVHEW8OYmK0AfELvtO66
   w==;
X-CSE-ConnectionGUID: 3fB1qs5XTTWU4hMnSjU4Kg==
X-CSE-MsgGUID: TEzsflPCTBOG2VPobtMW/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52933813"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="52933813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 06:38:41 -0700
X-CSE-ConnectionGUID: 8pCr8ntJTx6MKQFyJPhETQ==
X-CSE-MsgGUID: Ff3nozqzSOKBgJYl49bEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138089063"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 06:38:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 06:38:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 06:38:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 06:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGPlz03z6C7PB8B5fchR8E2EMPSiIb9s9XoHGvch0uTZdMR19jnckOvasRfh9W5EFNQeaYw1scTzE0NE6nijY23nkbG1V7aBeDtlLU0vifjb2v6MP9iUHU9kj7q2sq24CGDJS2YugbliAgVUzMDaEgdhyUonsuE5Vm9hU9mGJcSt4S4CiR8J0YES7PTDbg5pJYGgnIf3yfjPM6i+C3VP2zw1CRvowzZjMf5+rjAnfCKoMV0k9y3D/t3WoqHgU8oF/exHGZPHE7Etj/nW85LCXgP+C9SzMRz7hklUNDXWQh6/P1wSYmN1veGWCf2Ch7htduXaAS3R8oOnWbCuE3Mhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul4m/DQzkWPl2NB/EZhiKglPTVZJlN0vLdv2O1Hs7FU=;
 b=CuywdiDb66ojhMfGFAP1qmF19FQFxg3uzb4nJkFZySeGyHPg4uEJlpKICt+2PfbRZv9JRbne7JU4hJc5hdIC6c1rAqv8a0hrc5VLVGV/ihjHgmbEVgRluIbN4Hb/HdDHknmur5rjJe246mnjLI0EzsdN2cBnpcFb5ROfSSHL1tfaTTwGvxQE58YFc+0SxSNa0z63STCL0hm9mDmbDI5IhdHxho91EJCHz0tuwf6m+4f26XtXfpLYWyM6B6GSoZDLdY1iBpOcd/nE7fpb1V7hNafBaXEeymPrLF1P/o9ALvHeGHKu0jaNCrHlE+NoiHByIkZH6oZA3C4besXcJukruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 13:38:38 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%2]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 13:38:38 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.16-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.16-rc1
Thread-Index: AQHbwSZ73amoBicG6USKWIxmsTsnq7PSHpWAgAAJ9AA=
Date: Wed, 14 May 2025 13:38:37 +0000
Message-ID: <b13c2eb837fb5eeea906befa4a4bae783fbde370.camel@intel.com>
References: <f3f874fd1a505396ded7fc35856dd3386e44d0a6.camel@intel.com>
	 <9a395011-090a-3b8b-ee78-fe33a7d06951@linux.intel.com>
In-Reply-To: <9a395011-090a-3b8b-ee78-fe33a7d06951@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|IA3PR11MB9424:EE_
x-ms-office365-filtering-correlation-id: 18978be9-886d-41b6-205d-08dd92eca1c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YVpmYU1rMUdjQnVGcHY0QlFjczFNcFFsZmFxSmZNbWhVZHhDZklCaVgrcjJG?=
 =?utf-8?B?VmRWS0xwU3FZQzVvR2QzcWVYT3lNa3dNZ0Zaa1dRNHRVYWtKV2VmMjBNU1V1?=
 =?utf-8?B?RTF2QUVFa3FkYk9ham9DdEwxZjFvOHlKcFhZMUh6RzFKWFJnVHJMSUFrL2cv?=
 =?utf-8?B?RldhUW0wTGlVWHY2UyszRFRBaE1aa3RyQm5nQ1ZseWpYZXkwV1hsQmJ4dldj?=
 =?utf-8?B?RmdBSkorejQ3MWRxNEx5ajhNUlZrMmRGWWs1YktRalk0bWZ5b1dINHg5RjZX?=
 =?utf-8?B?UllBcWRpUG1heUlRTVhYV3dQd3hCWGxXYkh1YUk3SFhTc3dydVJkZGxrMjJx?=
 =?utf-8?B?SzFyVjltSlJQSW13ZHVsalJ6SCtITXFUckNWYXRHWUErcElzR0Q3TzNHVlJP?=
 =?utf-8?B?Nk1BZlNiZHM3akc5a0Y0RlhVVDZCaGl4Rk0xdHFWQTZ6Tm1ZYWM0VlNSQm9l?=
 =?utf-8?B?akRMMllPcisvN1pOVTNTc01nSVRRM2NVdVkvSlVRN21zNWxFZW12bUloWnpS?=
 =?utf-8?B?a0RCWUtqVVJnUHNsUjk4SDhDNUN2VFFqaFZhL2tkSlBHcEwxSjNCODd3ZVBB?=
 =?utf-8?B?TTNjY1lmQW1lK0tlOVZDRFZoalVmNTY2d0ttQnRoQkNSNGphMVNRb0ozZWdr?=
 =?utf-8?B?TVorN1dhYzdwOW41Q0ZPWURvcHRXWnQ2SFh2TUxhVzF6bG5PL2lEYmFQWDA5?=
 =?utf-8?B?bzlKYTcrRkM0VStYUHNkYVlpcXpmbExuZHJ5V2dUSHFtYmxwbVRxdThCRFIz?=
 =?utf-8?B?QXdCcmxQWmNUd2NENXJaenZNMENyenpZcGx2dXhHYTJTVnVMSzNtbWVPK1k2?=
 =?utf-8?B?aXFYN2VpRVhSOGY4V1RQbFk0bnRDaDVzemtiU056NnRrUnkvcVpybFAvWUJX?=
 =?utf-8?B?YVJJYUJDUzNDRHJ1RHdYNDR3Uk04RHJjaEY4SHBmOGV1L1orM1RZZHZUKzRx?=
 =?utf-8?B?Lzg1UWViWVVvMWkyTmkyeDZBcGVFcEdrUkFUa3FWcmV5VUVUSmdxK3dwZ1dr?=
 =?utf-8?B?dG0veHRnOXM0ZVJPaFozbDRPZU1KaWJ0NDlTaW1nYnVBeVBIT3VRbnozcVpJ?=
 =?utf-8?B?c3dqaXBJQVZ3SEtUREdXMk95WnNxNzlpeXE4Q05SanNHcUVveXJOOTU1LzBv?=
 =?utf-8?B?NjFseDd2cVJqVmFkdnEyOHhMdWxob095TWxMb3pFOFBKaXdaNlppWElJY0NI?=
 =?utf-8?B?aXNVRVBRcy84OEx2ZTUvc2ZJK1UzKzhOSmdva1FubEU2aVN0cDJreVJ5YUw4?=
 =?utf-8?B?a2JlNCtBQXVHWG5NZWdmZVJCWVhEWWR5MWcra0R0aEZSNUlUNVJsQmJseVMr?=
 =?utf-8?B?V0c2UjVUcVhLamJraFFVM2ZSaUxrV1pQaFNLVENhT2c1eTJPWjNtRCsyaFox?=
 =?utf-8?B?ait6YlVtU1lvQmRtWG1BWXlCbXVMa3BMVEpMT0txVDBqaFd3SmUxclZ4dFJl?=
 =?utf-8?B?NjdYQmRTdlBiL0F5U1lDUTV5aWk3SldEdkV6eVpIRm5QbDBZTmxjdUFYTU82?=
 =?utf-8?B?V0ZLYlBvNm9rYWFXak03YTUzNmZNZjBnTE5NbWNoYnVTTGxDZ2FlVUFGSVpp?=
 =?utf-8?B?YmZ6bEJxY2ZUN1Fna0xESUhZa0N2eHI2dVdNa0NUWE95QWZNOXZuUnFwSGQ1?=
 =?utf-8?B?Y2t5SVhtcy9HaC8vZ0xnL0VDMG5wT1NmTzlZMXMzdWxISTljMlNFUDlWWith?=
 =?utf-8?B?WWp0WjVIRnE5MFQyNHNUUmo4MGFzRFErVnQ1b0hMaWcramRVeG1NOVdsR21u?=
 =?utf-8?B?MmFrUkMyQlkzMkxLeWRJMGE3RFJ3ZE9GbUhiMXYrOUs2VHk2Yk4wbXkyK1Vq?=
 =?utf-8?B?b1VJZkZpbFUxZjRubnZUVFRMSVBqUnF3MGN0OG52S3ZXaFlkTzMyNVo1OENX?=
 =?utf-8?B?YThBOUF0WHZuckpTa0FUMFFKWHJNclV4dSs4a1pMdFNTNTVqV21QRnVPQnRU?=
 =?utf-8?Q?Hm4mYodDN1k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVJZTUZEa3F0VWVlTUh0eXBZbDVucysvM3V0d1ptRzFRbVd6dlZvTy9QY09I?=
 =?utf-8?B?a0V6RWVKT2YwNEwvZ1JPVVQzOFh5d252RGxZN2lIYjNNR0d0MWRJKzYrUWxI?=
 =?utf-8?B?anZNQVprZitEM2JZQTNub1N1SnZXZWc4aHZSaU9wRlF0R2pRMjhYM2d2OStQ?=
 =?utf-8?B?Mk5QaHl3c2MwTWNnd1BYOUJvaThvd1FWekRmWEhFMHA0bnIyb0I5cjJLREVk?=
 =?utf-8?B?ZEY5bXR2QkJ3OTZQQkt5TFIwOXowZHNhSE5oM1VmSm51TGF3cFBmU0x6V1Bx?=
 =?utf-8?B?Um0vSk1lNldydTh3OW12ZGVTMk5FUlZ1dWFCUExkblJWdGs4eTBxVWxJWVJY?=
 =?utf-8?B?bnJHYzFqOUpDYVFLV1MxZkpGZERUZThBMjBCdi9od3RVTGQ5L3RndDVKcDd1?=
 =?utf-8?B?bXpKNXl4VzQwby9zMENOQnBwZTVMRkxLYVdBWEVkUW4yTW0ySEZ1cFR3U200?=
 =?utf-8?B?RTFHYWRQWVVBTzNRcGppWnlKbldVY3NSczJuazh6bkVBQjFsRnlROEVMNGhl?=
 =?utf-8?B?TFlDS3VkZWlralg2NlpTdmpOdGYvTTlxdjVQUE5jN294enR1YWd0eHZjR0VK?=
 =?utf-8?B?cEtWRk1IWlFPMzFBaEFERlBzQUlhMm1OMk03cCtGOWphSk9EQ2hzbW54dlk2?=
 =?utf-8?B?MTFQK0VwUHR0Qlc5RVRvZmkvMGE0dWtQeWdmUVFNR1kvcHU2SUVXekc1TS9H?=
 =?utf-8?B?bGZMRGw0WnpOYTJvYXVYQXdVb2FHQkV1c1BEODlSRnFXSVZtREtLcllXckhV?=
 =?utf-8?B?YVF6eEszaWd1WXhvdVUvemUrWTJPN3c0S0RZV055Zlhhem9BQzU5SjFwTHRw?=
 =?utf-8?B?TTRVeS9lTG00WXBWWWViVWdiclU5Qk5yRmZYbURuMWZHSlFiZFhkSE5BK05D?=
 =?utf-8?B?SlBzY0tqa0J0MjNOcXdoVHdCZndhWUdjUHVLQUpIZFkwaFRHUEZta21yQlRm?=
 =?utf-8?B?WStEN2FzYjY2b1NQZjMzc0tEczhQTVVDUXY4eFM0cVEwbzZma0oyTnM5SGFp?=
 =?utf-8?B?U1RtWVF5NE9HY2pCVGZIdnZLSUgrRVo1OWJkUUg5ekMrUHk4MGR3dDUrMWZZ?=
 =?utf-8?B?OGRGd2d1SkV3SE1WdWZoSTBxalV0dWlHQk1rZEQxcnVEem55VzRGMVc3WXR4?=
 =?utf-8?B?Ly9IcGxRVm9xTG1vVm9YUGQ5RjB5TzhrSC8yemg0VnEzV1VMOGNlUG5KWC9D?=
 =?utf-8?B?NC9ENDVOUjh2dE1uVWVoQjJZRkptTjhNWGZ4cjdIamZTYmE4V2dWTmxGVGR2?=
 =?utf-8?B?RW03a3ZRMGJyRkJYdmZIaThpWGx6dFJWZE1kVG00SGN1TjE0THdBZHVScGx4?=
 =?utf-8?B?MzY5ejZ1VUNTVk12NHJGbFM5NDdiOS9IcktEdlZYSlJVRFU3UU1EN0w3K1Y3?=
 =?utf-8?B?Qkg5VGlMbGcxdlExVzhzbTZVSHBNaXV5Y0wwM3pXYmZaRHRDRW5EbURWL3BV?=
 =?utf-8?B?RHBDMnZEd25rRnF1WFJOMUx1M1FnUWE3NjNRcXNhQXVZUXE0S0wzNHZtdnI5?=
 =?utf-8?B?RGNCanBWMDZxSmYwVlFwZ0M2eEIzbm9wWjdxNEtsNkRWVkZseTBnZk5laFQ2?=
 =?utf-8?B?Z3pJYmc4SHBiVENDcGNBU3c2azhhUnVuSDRwa0ZzS2FnZHNkVUFHSFpIRlhi?=
 =?utf-8?B?eDRYb1pjYXJ6QzZaUVZWQ1lpb3c2ckswamthNGw2WUs3SEQ5NHdJdnl5Rm9z?=
 =?utf-8?B?MENrYkkzcUE0MXV2WlhHekNhTytIcUZNOU02VFI0UlViNWp5QmlnQkhBNXpI?=
 =?utf-8?B?MFpuOXZWU0RWbmNucFl5WWZHUnZQMjFPeWtGc0EwaisxSmxxaUZSUmZ0M0s4?=
 =?utf-8?B?TnZ6SlRCanRWemVDM1hXSWhCbFBTb0RKaWFhRk1lY3ErY3hFMSs1Ri8wZk9m?=
 =?utf-8?B?RThVbnVQTWsxVlNQbmliRlROUjc0ZkZoQUV0UWNvcFBHd29LVE9KR1k3Tjk3?=
 =?utf-8?B?ZFRyQkN2WkJPR3NoK01LMFhQbGkycmFQZDBOYW5YQmVsb2xsVlhMWWs3V3N1?=
 =?utf-8?B?YkIwV2xxSUhVT3dLMDZuTlpLOXFaQXlXa1NDeUxiNTBhaFltOTh3bXhFNXNt?=
 =?utf-8?B?cjdhbEVwdnN0UFViM3BOZjc4TGN3dUF6U3pHak44ZTBYajc1UkJ4Nyt2elU0?=
 =?utf-8?B?c1hWNTNUM3NzYU5HOHBtUTdwN0owbmhySzQ0aisrRCtGdXUyK1FVQnZzRkZy?=
 =?utf-8?Q?Audaadp9wnr6+1/eKlal8Wo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <156BA1F8C58DBA4A9BEDB786E3B90B3A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18978be9-886d-41b6-205d-08dd92eca1c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 13:38:37.9925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: edgSGodtD+wf9bREFkowymiLyK6NdMxVbtsWjsasTmK4Jbmy/VTOlbCfQCtarjSrsvdjYy+LmbrmZAY7i850uxzOtVvt1aHzYCrjt0HD37g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDE2OjAyICswMzAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cj4gT24gRnJpLCA5IE1heSAyMDI1LCBQYW5kcnV2YWRhLCBTcmluaXZhcyB3cm90ZToNCj4gDQo+
ID4gSGkgSGFucyBhbmQgSWxwbywNCj4gPiANCj4gPiBUaGlzIHB1bGwgcmVxdWVzdCBpcyBiYXNl
ZCBvbg0KPiA+IGh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2DQo+ID4gcmV2aWV3LWlscG8tbmV4
dA0KPiA+IA0KPiA+IFRoaXMgaGFzIGNoYW5nZXMgZm9yIFNTVC1QUCByZXZpc2lvbiAyIHN1cHBv
cnQgYW5kIHVuY29yZSBmcmVxdWVuY3kNCj4gPiB1cGRhdGUgZm9yIG5ldyBnZW5lcmF0aW9ucyBv
ZiBDUFVzLg0KPiA+IA0KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQNCj4g
PiA4MzU3OTY3NTMzMTA1OTY4OWUyODY5YmY3NTJjYTllMTdmYWRiZDgyOg0KPiA+IA0KPiA+IMKg
IHBsYXRmb3JtL3g4NjogcG9ydHdlbGwtZWM6IEFkZCBHUElPIGFuZCBXRFQgZHJpdmVyIGZvciBQ
b3J0d2VsbA0KPiA+IEVDDQo+ID4gKDIwMjUtMDUtMDggMTc6Mzc6NTggKzAzMDApDQo+IA0KPiBU
aGFua3MgU3Jpbml2YXMsDQo+IA0KPiBJJ3ZlIGFwcGxpZWQgdGhlc2Ugbm93Lg0KPiANCj4gSW4g
dGhlIGZ1dHVyZSwgcHJlZmVycmFibHkgcGxlYXNlIHRyeSB0byBiYXNlIFBScyBvbiB0aGUgZm9y
LW5leHQNCj4gYnJhbmNoIA0KDQpTdXJlLiBJIHdpbGwgZG8gbmV4dCB0aW1lLg0KDQpUaGFua3Ms
DQpTcmluaXZhcw0KDQo+IGFzIHJldmlldy1pbHBvLW5leHQgaXMgcXVpdGUgdm9sYXRpbGUgYW4g
SSBkbyByZXdyaXRlIGNvbW1pdHMgdGhlcmUNCj4gb24gDQo+IHJlbGF0aXZlbHkgbG93IGJhci4g
V2hlbiB5b3UgYmFzZSBzb21ldGhpbmcgb24gcmV2aWV3LWlscG8tbmV4dCwgeW91IA0KPiBlZmZl
Y3RpdmVseSBlbmQgdXAgdHlpbmcgbXkgaGFuZHMgdG8ga2VlcCB0aG9zZSBjb21taXRzIGluIA0K
PiByZXZpZXctaWxwby1uZXh0IChvciB0aGUgUFIgbmVlZHMgdG8gYmUgcmViYXNlZC9yZXNwdW4p
Lg0KPiANCg0K
