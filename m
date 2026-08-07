Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47709395AE9
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111256; cv=fail; b=J7j0gnexlNRzwPC0YdTXzuYle3CTXGHnfdliVz29wPUyjeYegSDv53cpRLCqgC5DLm35bdjm6I631RVij8eEkJp+Zdkqh8m7qK6EE1CKGgQR5jbFWV40gXAeY67grr+3oZRCcl5YNhAh+85MospgQPCH1GBqrHMAPHF6BoAHGy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111256; c=relaxed/simple;
	bh=wtChznsCAeZ0sqtqk1hFeT5MCYciiYWW7ZB6OC3x274=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hmzSYwaphBLxXwAHLLUDNLowQ22yBSDojL2lUb2q2BzXz8lAnKKIlm53dFS2CMAKcp3RbZ6FhO/cGUyTqURNepiDR3F1RvTj3MHpstFZd56rgFPJ6QaY4JSPX26WRAwZpOjYf3aOvDdppRO9G61uhDDzB2r21U7DAK8pGXneIQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izY10mRF; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izY10mRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786111249; x=1817647249;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wtChznsCAeZ0sqtqk1hFeT5MCYciiYWW7ZB6OC3x274=;
  b=izY10mRFbcRAblXra7h8Z6EfIagV4mxg4C2IZieee52zN5eXn0d9U+Om
   JETA1Qo6m0OaCQ6VTX4HmT7rcY6YzZFBpH26IgbQF01hd30L4ZwoPjIUs
   6hIi4Ww4OA2eUw9Ztdl/Zqx8cL2sSXjdVO31u/pA7MBF1G+htgIcPAuAN
   h10l1wnj+btnh5MiNcT0VagFGYP0hY0I6YjyF9Q1sHRJlUHtqNp7YRb+h
   H0MT1m6Xj/dVZDcqxhcpyk4trYd0oUHQw7aTCQwApyfRk10NLm5tTV/6m
   qFTriGZ3L4E6ZX/TUB83b5ThGv0tyvHhjFkFNLdWqmpseZ7JQ9mZ5xJfa
   g==;
X-CSE-ConnectionGUID: IDA2psXmTz6W7JcRk1yCiw==
X-CSE-MsgGUID: hpnF6rBqQ1qhBo28AzjdjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="98080979"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="98080979"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:00:45 -0700
X-CSE-ConnectionGUID: 9sYarbmxQKayPl9Z7sOPEw==
X-CSE-MsgGUID: w3XDGQJ5QGa/ulhONqrC/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="287082352"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:00:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 07:00:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 07:00:44 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 07:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnNJUkzwtr6qib+4oa6m9/38WqYv8btvsBvooWb3rx/6XEWzmI9VE5R8qTWj+p2DZ5FgFba+zluOK8NWW81ccSQdoRXKL8RxD/Mvz0Pj5oFaVyrmkjv25PKlh6oJYC6E740O4IgB0d5nHIV7njgeOm7jo4v3BCvqn8z27fPC4JqhD8/MOsPt93pgotFyUZB1lW2Z/qLxknFSVG1GuVvLTKwUT84SInFn8peV+dZC00QsmVIUK208zjST9d/K+jvL1xTAbayeto/uxGj+EIOW6Ms/VqSK9ESFMPmNnZgIWZiov+/LiOCqfp8zbt1UZBIG8yrtX4GUu47/y2jJgWj30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tY7mHxQZp8UWOJ0d5QcMj9kACbKQd2gS3L+qQiqCRk=;
 b=qon+e8CtkDPVImctszkoqBTBuTQezG8X3Bye/bdS21DlYjhNtKrAlU9Pu7odUKPaPB/SODmlAONx4eHgcGTrjyq4cB/Wq4I1xTDkISrFQMmLi8sTQEoQelBzwxQestKCjAv8g0kHNdW7FisCvooDoHks8dPFT9uyMyzPM/h8acoIl09zQvVJfIkDmNB7DTATIWIe5MMkoIKmN9UsfJ/8ljt7nUCFtDfWvELmDp87zw4ImYE0eDOww40UyQaVxM9ppDI0Q28hBdlteV7/4UcTfp4YTyuVxK88sMo/bSJF2tr1O617XACSBoYEjF0HjCLnX79Z90qJfn/zkw5Y/PUl9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 14:00:41 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 14:00:41 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
	"Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
	<matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: RE: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdJavP5dc5m7zyT0qaUBEby1ya7raRj8MAgAEN8oA=
Date: Fri, 7 Aug 2026 14:00:40 +0000
Message-ID: <IA1PR11MB6418FD68599875714B8F2B88C1D12@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
 <20260806135820.1422040-15-michael.j.ruhl@intel.com>
 <anUBkmSjMOA4wlFk@gsse-cloud1.jf.intel.com>
In-Reply-To: <anUBkmSjMOA4wlFk@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CO1PR11MB4929:EE_
x-ms-office365-filtering-correlation-id: cf27839a-3292-4713-5ddf-08def48c4440
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|38070700021|56012099006|4143699003|18002099003|22082099003|11063799006;
x-microsoft-antispam-message-info: 7kpmh73pdPt9trAXlvw2wPHkTDj6uavyFg8AdwrEm5S6WHlBdsZGVbe8Z0G1vCMJCRfvZiNyPN4VEZZWi/8WtxBxgPLB2ixHf6TU0KrSOnULTTLJLz0NJvTcrmswpc2hcHt8lpAjvjeyp0goF5nWle723uQkb/ZDhGpbqwxnMgxxxC1Q0dWDvjut9LtHhnIWYnCcof8Pb5apa9BjiEWWf0um5QCzCnvaU7V1W3j7vrmwv/kbtKk984+WXcTFnwknLbwnCx+mF2ldH44HMO5tEUCjm+darns3M0MwLa7ucQcaJXqff17RbPECphrARLMryKs7cJq2+TIOYV8y2HnnBjFa6VNp87GOnJwLuAGiJHaAd8n0OZQFJlA5kymWwx+TwBVuLhGPkcoQmXwJfS5YXRrzWn+nM+VGhysG9OA5RcZ4ukl7HZe8uN0kY7jFEjfjJiLSOvOf6Dd3wVYIHcCg5z3OxTEwY7ZhOq//UQc1Qcs7T7d2IJDEvakoZQcHit1fjoWUxxmdL9O10tvVo21gbr57kQjqdO8Hga4xvkfXccqCgyDtEQ5Ulb8YhPLHOnrzzvfBhqrACgFGja1dsDgIlZoEazyk4T9Rn25m2HGjjXpQSGyMg7KDULTi318b5WWgb2GtmAOcMzWbTCSOD/Gt6h9Z0t7lX0rRyFgjsax/KquGo8rVicNiav9t/j4dA4zVMOWDYgvgVgu/LvTbNjhRYIB5lZGDR0+OGKB5ofXTi+c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(38070700021)(56012099006)(4143699003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P21bo7iCSHAFyjEzW1wrQBYzEO0PxKEVOLnRR+66y4i9aJWhkCzvcHc8nLR5?=
 =?us-ascii?Q?XrtB2gSGx9LDzNDNpkZI1l72lA0GPqPukk+QmMp+82bs7VjyCRarEqzuk6lR?=
 =?us-ascii?Q?Chg4zqGtGmdhf/3RhnEZX7b2jHg3E29itX9bKw/F3nZt1geGLjkvhb/yRLEn?=
 =?us-ascii?Q?+esia/JBznSGlE709iUBmzSkUH96Osy/9fzVrOAs2rAe6aXW4k4IOrdkxlZr?=
 =?us-ascii?Q?YbcSxrV5NPFZINSY5kPH7ba6c7MQ1KFgojfdiHYuCpIjoe/9iazinyh4zSv9?=
 =?us-ascii?Q?a+4EaVFMLzY42klBg5pkZDbIWDgvw6XqotRUunzl3Q2LmXJVK4GvOQDbx2ft?=
 =?us-ascii?Q?8BP9ElQJidfX6hNn1i7CPy4VclxNlrKS6MjieZMV4t6LR32yeMRBvXmIvGAs?=
 =?us-ascii?Q?hAlDxlAbnvehzxB6BhUoaO/HOFMjjPfIZQK1ecrRGuC6GqO3BBT3jB7OepJz?=
 =?us-ascii?Q?UafpdTqZWGjpHuA4NAP7OAJoZBu7VTWpOZaUoZA9qXZbDKLIF1XoqJkEuFyg?=
 =?us-ascii?Q?1sXuY7Gexklwnh/PdhKwlczOzjlHkGTb9iunAwqE6aFxTeXzSr9GjbrN0vxY?=
 =?us-ascii?Q?C/IQPN6AfoNELtWl1U9/ti1lddxVg94yHHuaf21agPBH2Q25FNeSHh8EXT+x?=
 =?us-ascii?Q?M9O88tkmQINmmDy3nES/FHELZYOBIsukHYgfXhWzMJ0Lhw7wYZ3AhXpXGdgH?=
 =?us-ascii?Q?w+btpXKdFN8gqRVZqzPGXPZgS9K1xNgqdzlyZwvDnnMHRQEDHwJolW9GsJJi?=
 =?us-ascii?Q?1CCUcU0lRobZdrbjj1M8Rh1eiE/SQD66SRhvfRm+ciAN40yivrqAFb6iEhk+?=
 =?us-ascii?Q?d4AZ5hQv4zC+xXMPn5wRgBpCH7nB90mVM1zbrHGKi7A5rCryznrUga/EV2BA?=
 =?us-ascii?Q?ViXYuUMBpl9F2BXFDOx5UNjehDiNWcneYS8y2Cys8SQYlSqf6dqn8PxculUi?=
 =?us-ascii?Q?g0tqC91INIAVlhfojVZEM1x7b8VBgt8n9l/R0l3CRBSHz+Tonkt6M4NbNec+?=
 =?us-ascii?Q?DlEsgmvjpbr2wwz5qBfuS+1Al3d6Ou8nezsZJOzSLTJd2/LFINxREz/BMuNt?=
 =?us-ascii?Q?TdS8JUqGqnhi6oo0Sjs8wK8FXO1Vw1i12T2KNwEvY9M0BQjNBmv3Zc+PU2Fy?=
 =?us-ascii?Q?dF//W/F/gesD4JtTOjCHzj90b4v12yw8KwnWvTxRSzVWQY4mWxOX9TOhDJd1?=
 =?us-ascii?Q?E2uOCq/TDOxU/tUKqcraPXO38Yigr/AHZ6biw6cWqsEz3uAWA568nGTnFBlb?=
 =?us-ascii?Q?3kDWieCJtg0QV75lYdkZZ2MqedcG6cp+XNNETCep+jqS4F7B0rVJKNmcA/qv?=
 =?us-ascii?Q?eNnCkeSFRuD22NaJjq47Rcf++F+YwSoKZ2iBytizt1JX99xXR/LLQNvTs1z3?=
 =?us-ascii?Q?hVLzR25yqT4KyKDFAAHBiImp2GPxAJtgVW3Ton04+8dhgI1XQG2qZHYlj+XY?=
 =?us-ascii?Q?yNQqWZVtftYT8nLVb/trmSxnZLcYYEJ8bTzR50wbMqOa8L908E4y2Re24ayF?=
 =?us-ascii?Q?+G8Rw81vK6xQNyIu1cGzGFTWD9/hwMR7bDaINngxDJMBcpcZxVXz0CVn4wUH?=
 =?us-ascii?Q?IRpYlNYidEfh5LRP/LXAqAJlsdA1a8k32FcpaEidKaP+2wJygPD9MKcleMEI?=
 =?us-ascii?Q?EB6raEuzVbgM6FjcUy5jRib/0M/Ufcs1TRtL/ybIG9GdsJuvlPiLPXEZTrcY?=
 =?us-ascii?Q?JDf7DZqSLIdRn0HyuWnclqctfU+JGME02JhM2UmQ4F4+sZMDxJ5x3Y+GToQR?=
 =?us-ascii?Q?Wg6Ab90/MA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SSzWJE14ylD5WU1c//NYNMwntuiiEHnEWr8VMx+ADDi8cUCDy+QWKNYbAGOj82oExcsgHru1QaDxE5ff00fQ7RlRRPEnc52p8/3PqEp4JFUDylXkoiM9DrSdTrUulU0rHW249PQzmMBkWO9voCq7bbSGUv9r64UIIDqGo1g0jH992/tBpt97rFZ4mg8lesdl2AgyVGF+BXrFxbssg25zQQ2+TH4U6lJ7ppryJ65RDpoKsYTbhUSwZO5VOYbgGti+6mZqsK9XAPDMySml1glmrp14iSodkOzatkm8H896Xcy8dlcu0Rs/+z/Q5qo9UeHRDa9Xon4jnOCC+mf4xKnwKg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf27839a-3292-4713-5ddf-08def48c4440
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 14:00:40.9943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MB2izRWMf+RoUDs0l9dftYrKyehRyL9Qg9YZD5bx0PPDiDugJGOYgTXs3Euoof8bm737z0D1smPMi63VIBkcYsb3bEYZZDEP3gZ+mJBlA+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Brost, Matthew <matthew.brost@intel.com>
>Sent: Thursday, August 6, 2026 5:50 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Vivi, Rodrigo
><rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>
>Subject: Re: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
>
>On Thu, Aug 06, 2026 at 06:58:26AM -0700, Michael J. Ruhl wrote:
>> CRI PMT support requires callbacks to access the discovery status
>> and control areas.  Access is a common MMIO area that requires an
>> index to be set before access is allowed.
>>
>> Introduce the necessary callbacks to get the status and control
>> information for CRI PMT usage.
>>
>> Add the glue logic to register the CRI PMT functionality.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vsec.c | 85
>++++++++++++++++++++++++++++++++++--
>>  1 file changed, 82 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 3849f99c1c91..b84ec9088de7 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -320,17 +320,90 @@ int xe_pmt_telem_read(struct device *dev, u32
>guid, u64 *data, loff_t user_offse
>>  	return count;
>>  }
>>
>> -static struct pmt_callbacks xe_pmt_cb =3D {
>> +/**
>> + * xe_pmt_read_reg() - read a crashlog register
>> + * @dev: the xe device that registered the callback
>> + * @guid: PMT guid of the crashlog instance
>> + * @reg: data read from the PMT data structure
>> + * @offset: which data to read from the PMT data structure
>> + *
>> + * Read the requested PMT register based on the pcie device and guid.  =
The
>> + * supported struct is the Crashlog Type1 Version2.
>> + *
>> + * Currently this is for CRI only.
>> + */
>> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32
>offset)
>> +{
>> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
>> +	void __iomem *disc_addr =3D xe->mmio.regs;
>> +	u32 inst;
>> +
>> +	if (FIELD_GET(GUID_DEVICE_ID, guid) !=3D CRI_DEVICE_ID ||
>> +	    FIELD_GET(GUID_CAP_TYPE, guid) !=3D CRASHLOG)
>> +		return -EINVAL;
>> +
>> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
>> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET :
>CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
>> +	disc_addr +=3D CRI_DISCOVERY_OFFSET + inst + offset;
>> +
>> +	guard(mutex)(&xe->pmt.lock);
>> +
>> +	xe_pm_runtime_get(xe);
>
>We have guard(xe_pm_runtime)(xe), and this should also be the
>outermost construct (i.e., do not use xe_pm_runtime_get(), as it can
>wake the device, while other locks are held).

Hi Matt,

I am using the _get() routine because the device MUST be on for me to acces=
s the
registers.

Does the guard(xe_pm_runtime)(xe) turn the device on?


>So this should either be:
>
>guard(xe_pm_runtime)(xe);
>guard(mutex)(&xe->pmt.lock);

Ok, this makes sense.

>Or, like the other in-tree usage with xe->pmt.lock in
>xe_pmt_telem_read(), which calls xe_pm_runtime_get_if_active() while
>holding the lock. This is fine because xe_pm_runtime_get_if_active()
>cannot wake the device. This is most likely the correct choice, given
>that this is a vfunc called by a different driver, and we have no way of
>knowing whether that driver is holding locks that could create
>problematic lock dependency chains if we wake the Xe device here.

For telemetry, the data read should NOT happen if the device is not active =
(so the get_if_active usage)

For Crashlog, I have to get the data and have to make sure the device is en=
abled....(see patch 3).

Do you have some thoughts on the correct sequencing here?

Thanks,

M

>Matt
>
>> +
>> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> +
>> +	memcpy_fromio(reg, disc_addr, sizeof(*reg));
>> +
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32
>offset)
>> +{
>> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
>> +	void __iomem *disc_addr =3D xe->mmio.regs;
>> +	u32 inst;
>> +
>> +	if (FIELD_GET(GUID_DEVICE_ID, guid) !=3D CRI_DEVICE_ID ||
>> +	    FIELD_GET(GUID_CAP_TYPE, guid) !=3D CRASHLOG)
>> +		return -EINVAL;
>> +
>> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
>> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET :
>CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
>> +	disc_addr +=3D CRI_DISCOVERY_OFFSET + inst + offset;
>> +
>> +	guard(mutex)(&xe->pmt.lock);
>> +
>> +	xe_pm_runtime_get(xe);
>> +
>> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> +
>> +	memcpy_toio(disc_addr, &reg, sizeof(reg));
>> +
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct pmt_callbacks xe_bmg_pmt_cb =3D {
>> +	.read_telem =3D xe_pmt_telem_read,
>> +};
>> +
>> +static struct pmt_callbacks xe_cri_pmt_cb =3D {
>>  	.read_telem =3D xe_pmt_telem_read,
>> +	.read_reg =3D xe_pmt_read_reg,
>> +	.write_reg =3D xe_pmt_write_reg,
>>  };
>>
>>  static const int vsec_platforms[] =3D {
>>  	[XE_BATTLEMAGE] =3D XE_VSEC_BMG,
>> +	[XE_CRESCENTISLAND] =3D XE_VSEC_CRI,
>>  };
>>
>>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>>  {
>> -	if (xe->info.platform > XE_BATTLEMAGE)
>> +	if (xe->info.platform > XE_CRESCENTISLAND)
>>  		return XE_VSEC_UNKNOWN;
>>
>>  	return vsec_platforms[xe->info.platform];
>> @@ -357,8 +430,14 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	switch (platform) {
>>  	case XE_VSEC_BMG:
>> -		info->priv_data =3D &xe_pmt_cb;
>> +		info->priv_data =3D &xe_bmg_pmt_cb;
>>  		break;
>> +
>> +	case XE_VSEC_CRI:
>> +		info->priv_data =3D &xe_cri_pmt_cb;
>> +		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>> +		break;
>> +
>>  	default:
>>  		break;
>>  	}
>> --
>> 2.43.0
>>
