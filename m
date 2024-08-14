Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E33FB3B
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723654152; cv=fail; b=TqvC6I+NbrQrVRLQGmAzZpj1ZOk786TM+SQZYtt84DzaIjer0Fgi0H5MHklD1S8xBUr5BKpSzdeyPb4BfWgsZw1p50mcDpJSe3tdYfHF6+ZJeuSePGPu/cyGbY+0jBl+QdOBguglTh5O59IoLQYW3DDoj9RZ8TEMZz8WfvnYlOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723654152; c=relaxed/simple;
	bh=WytIHKq36HOChOy0kLvwds3CnKUrow6QNOqBBkZLA+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aqTIBK65lHuahyJ8ihery0b4WtuwtMu7aws8NH9GbUs2n5xLC5iATDwilTV4Ql3wEOtBlSPVw/LLQRliOcTuIAncFqCmxEhLHYehwDZW5NeVaZd4HXwM5fTM+gHhLXhmjWpFEK4Rv+HKw9Kz3HKRih2j6lUM1Fom9X+vsUW0lL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXpmP8O/; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXpmP8O/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723654151; x=1755190151;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WytIHKq36HOChOy0kLvwds3CnKUrow6QNOqBBkZLA+s=;
  b=mXpmP8O/5hX68nFNEx+zmIu57l84e6VPrZM9jU9tHpNIfgS+7LnwxJ7x
   jeeZdMVsq4HbTa6ImgiYGXzkqBbPnSfosvejbpg4fMN6uwwP+ll3lWBmw
   JUigTiBqWfbXclUaLdOA44gpIYHLUW6OI3UN5ECg51eosxTMQ3Gy/LQ22
   DCZ2xu0Lendj19M5IrhgWddYrc8l64kMoxjnlW5O+8GZfpTn/SxzrjjF9
   I3q8OQUhAgX4ssiyb/sH6WWfvWDSRUSCqH/5n1BshKBj0sOdlCgAxtzBO
   KrWVn8YOp7WSaEFoCvm5HROZKRfFtmkA0D+g2uGMz3s4cadG7ENT8zP2N
   w==;
X-CSE-ConnectionGUID: IGOLDVDnQt+ySmE3i2LaDg==
X-CSE-MsgGUID: rNq6drsuQwiPir3GrwURhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24790509"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="24790509"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 09:49:10 -0700
X-CSE-ConnectionGUID: g+UlRpS2S4mPpFKojCXzGQ==
X-CSE-MsgGUID: TWt1VeAyQ3u/lhy2ihf6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="63220564"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Aug 2024 09:49:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 09:49:08 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 09:49:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 09:49:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 09:49:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey9d7kDRq6nkBvosHsm3Ee5j2UfaUdnHzy9lHNqq8IG1us+e6+xv0E5Kng9eHbgiA6Tyr1tj8AEr5lHhbR0oskZDnLZQ1Qbl4uzmVOBwHEQp4CrKLr6K6JNeZ9vMATq5C246iK5Jh4fcfWLOBjEDsrDg1trXcn415tKnoAiWu98lJMzVsmXOOeHcwnvpORJaoPeCS45q3rN7LwiQfwgAYEH9BwupxGO9GbdcHXrSriRdhYf4glAHVQ1yjT/CTNzcmgbnPMkQs1F1rri5gHUwG7iQWVMNRa4TiU9sYDpy4ZhdSqA521TVLAj2P5bdsW9cmwoIJTAh9oMK4quxf3bhsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiHjNJ2PdrjHaSu/x4bcSVJVxcVdxHcrSrN0mNnWKZ0=;
 b=YhiXoFbPEktW59MpMznuiQ1OKzcbGCsYNVWJVjRRMeLfPbj3DeGnOsQqBmAQIwQlKKtHmwI1LiGRPY48Ck/Z4HuGxgWqAG9wEyjSE1X0UGbMENfhy0J3gELgm06tBFW2061653waS42ovHcEXq5AacxD1jLxwCMNGE2dGXreQXurpHbIKdDi/bf2gqo5ctbmWJW5JkRh2L/VePbKkw/V26jFJt8TDcYJ686DKEgGAPqeTgTL0e7SUAwRbmEaNLlD3y9CcHQTsAM15i9FdAwhkFOIkoT/sWL4EdZgwl5DB/bzccnW4aCoNudQV19WsjJdZgUoBvAo8z5cNIvyevNO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 16:49:05 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 16:49:05 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v11] drm/xe/vsec: Support BMG devices
Thread-Topic: [PATCH v11] drm/xe/vsec: Support BMG devices
Thread-Index: AQHa7PLeMjbADDlLS0q8Q7oONLxOFbIlO12AgAAApZCAAY2TAIAALGwQ
Date: Wed, 14 Aug 2024 16:49:05 +0000
Message-ID: <IA1PR11MB64182DD2B8D803A48D592D62C1872@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
 <Zrtpd_WwougszltH@smile.fi.intel.com>
 <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
 <Zry3hOBb_fHbvlIN@smile.fi.intel.com>
In-Reply-To: <Zry3hOBb_fHbvlIN@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CH0PR11MB8192:EE_
x-ms-office365-filtering-correlation-id: e446575f-dbad-46d5-b026-08dcbc81025f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HwpAgqLI+NAeMXNsesTHUVJjFIXx7kdtyUeS6g62LIQOAIo6DyXv8yxgVHlj?=
 =?us-ascii?Q?eVLJ8AYtDy1VdwUUci18jhvPYXFrN1jycb9z8Fh1PnQ+rr+oE8Hz4UuOwuuS?=
 =?us-ascii?Q?+V7bmArNs1fcNA8IEudWGKXsU88nTjFHJG5FlgMeoQ2kXR9AVrTnhexQJjod?=
 =?us-ascii?Q?m0cxH+EbOOir0Qa/278kGUE/Z9k5WrI+Uk5t+VGumuuXcE8FJZ3PRk3PAwi1?=
 =?us-ascii?Q?keps4gi+oR1Snh5SLBGXGxw9lgoq5awvGkYiDbvJEqeT0S/kHr6/Hxo9qnrj?=
 =?us-ascii?Q?MceeXnp1rQyeptH8no3IUHSAAk06qCbCoIgKIlt7uPX4PdQrkq65VHwH2IZ3?=
 =?us-ascii?Q?Nw1NmQm/8JfIkepNTQrzYkDf3WxjFECpgADEQmmYLZrhps85AzvQJ6m2cXY0?=
 =?us-ascii?Q?RlEw0ZfKeafK2NgTTwnT+iE+Zh8f6V26sK439iqQtEYDDs/p2swXGnMSLOyx?=
 =?us-ascii?Q?jtVrkyBuEdyLDndGuam7QBuspPyR5FdCIyLeBAPmCgO9XYMFMaMksMZfFOLg?=
 =?us-ascii?Q?QmYxJRec6USo784MPHBprlWMhkZSJzbSMy4Ynpc1WlEV/mL1OhoGKxm7MG1v?=
 =?us-ascii?Q?h1DFAW/xGBpjk+XEHcG6Hox1IvbfET6Ljr9PfPJOhteI9wKsF+sp0o9APt59?=
 =?us-ascii?Q?ThPHb5l0zx6+2kI/0YGWQoh5AJ8uLx348x82w/6KSWIfWelAntLLNtumrU2s?=
 =?us-ascii?Q?wy+u4Gq+29lpCKWzjfmlS76BG7Clfsxwt0APYMv19Te5qlMN06u3tLBVxGzl?=
 =?us-ascii?Q?lONYg6kTBm9iOubsFsVbaqOpljClTItwOVCoZFi2gVCdslAfd9VRczDWX8tw?=
 =?us-ascii?Q?0nY1v8H1BK0PLahDwbyWIMH2MxniH8gCXfZ7S/CsIlwj7HYE7YXaAzGxumQa?=
 =?us-ascii?Q?DPlvIVK/jROmGupDHlqC3oz/IAR0EoAcBsgOJCKnC4i9p4JD6nwkvBmdcfLL?=
 =?us-ascii?Q?7gxQFFrysBaD+FjL8qTLCTxconM9PlHdrITxTQribHcIJqlbd9R0AFS3LSKG?=
 =?us-ascii?Q?JYhYdo6YdtSoaeE87jOwbCICScvoUGc576kjE+/DsGMgwv3qg/fLHLkvP645?=
 =?us-ascii?Q?v1Vc9GqcN469aMvHyDzAm1cWuE1vbbdXqlgqZXbMIYsBDY04ftaejBpVrc0e?=
 =?us-ascii?Q?oSTwaJeqKm8MeRo/VzyG5Mh4Ljx/uUZtPQCPqdAoLmEmCQBq72ztor2vA257?=
 =?us-ascii?Q?p2ZBsTzt4yugkC5k6PLHrk+3/S2VZgoCWyA9x2rG8Za93gGOVNhIZMvC0QGl?=
 =?us-ascii?Q?6YOPi9xrIvU69Knc4F2w9figQXW88SPIwky11Hh824xFBlM9mTVwO9N2uPu3?=
 =?us-ascii?Q?xoNbAlyVKrBjuveH48c120zRE4Ak6G4Mkn5y3+jTt3KZR+gAZRpZfeTUNk9X?=
 =?us-ascii?Q?YKGc97H/nAk6gGyj2OlbCrdJYaL1BC5lbTVzep87HYPLGHNOYQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2eMx5yfZTvkYHKdV/PiocXox9aAdVjcsYgRwe4NdCRJ8iRjh/BtoHyzEjztM?=
 =?us-ascii?Q?PAiQrbMrX4e9wxJvO8wzcfhRokCOTvVfY6FkNIpoKD9gKzGqjMn2sfNFf767?=
 =?us-ascii?Q?urBF8Cjm9A/qdrlkRPU/vp5ixBeIHd3OXuvvO71JOXcc0wIZ81lpqqagA6ia?=
 =?us-ascii?Q?EAIVJ0XMQsMO5W7QwwxvpBUrHLT25Y7OzheB52U1Gxr2UHFwv1rMEruseUEA?=
 =?us-ascii?Q?2BqXfqe72C0r6w0VowGA2c35xDWl2jyFm4vG4SgbJMXewjSuV5YjCuq4WJcL?=
 =?us-ascii?Q?2UkFAZWp7zcQg2MJNG0mTz1/jJfKHTbe2Gz2sd0erPMUr6tgJ2xGWe+eHMuP?=
 =?us-ascii?Q?mj6mJAAq38JS26NFdk9C29y2u6aQK8rRj+ESTTwpOIKet+JpvTG6Z1sUHP95?=
 =?us-ascii?Q?G3gREGqQZQpFrcfnsWvKxqGuTb7pP1NztoJwqrhHXMYxklK2gFMKWDzZRGH7?=
 =?us-ascii?Q?tVkXt1z+yjGiidL5QPx7cfgJsnN9FF12VwvSrmmtXegy+QVbpv3bzPk/+qxw?=
 =?us-ascii?Q?p/U3HQt4FJueM+izxJH535G8VLV1VVTCGsk1wP79pefV7GOG9wTnWt+y4arR?=
 =?us-ascii?Q?oxty/W47uuHWqSImV6aXuFwgqx7ZaNKduj5L6s+HObnpNBoGWGnIkajrzsBZ?=
 =?us-ascii?Q?hA0ul4+C7mOY7/LJ40t7R/4uIPdRhumhcVuOIloL2MXB03ETCHiFGZzKxJyk?=
 =?us-ascii?Q?8ykzDKaJEx+3riQFRK9yprOQcI3+0Kw/hN7h65QJC9V6QyNv0H7n9QrZm2UL?=
 =?us-ascii?Q?iZ6AOUOlIms/fnkcoWQpbDZeO8aJ/jW5VmLUeGgN2gJuzHeONwDq+fMYHVkq?=
 =?us-ascii?Q?Sxevs/ZdHXjKe4V+kzD28gSVv7imhSZ4QrjHDtdjtOER6is2k37wpzAOFJ0O?=
 =?us-ascii?Q?zJw3ld88uvM8rGjUyrKHJpA0Oj60hT3I0gxSebseP8sLy19aT4a6uNoemLI4?=
 =?us-ascii?Q?ofTDOXvYADLSOZWNMF3IBiE3SSP54NfYLRMd8ojbWmf80c0WgPXXaxIvKhKg?=
 =?us-ascii?Q?PzccIPEb0RHm0yBmcb3pB5hj46M4gGJPq0S1mFB1SwRa5kfTAQFLSHkyeEo/?=
 =?us-ascii?Q?hXUgBE8zirZIJiafIA/6VtAeYYOxJeXKje2cNbEWgAs5p9b8s2lFjkplXw5A?=
 =?us-ascii?Q?at6PSfEUT+2kAJmU/QOKDPO7tvPjMhXFWb+DgTW/iE+yvxnnzPzVlKVRvYiq?=
 =?us-ascii?Q?RlvXyvgw4zRrfQXg1NtNNr1JXy76Pygx/9BcolJ23pvXtTcGsknWo7bkYQgw?=
 =?us-ascii?Q?cHA4WUeOlHjfrSM/3jF3V8Jj4A0xHtGAtPqQRd8kb0ppFk/rcEGExYqRkzLf?=
 =?us-ascii?Q?PQfUUw46hn8OALOAvKMec31vszhqZZANRIXesZMhySQXxfZDiVVdLODCd5d2?=
 =?us-ascii?Q?J0tsNEBbIJH2PwhOwmXbSY7cDBUT2AbOw6hE/oEj4qIcszxuTr71zbjFM5c9?=
 =?us-ascii?Q?wYkei2ODWt1RIzfJvvruMX8/0m0wflqO1VHzpVH4KX12W7XlUfE10mmMp+VR?=
 =?us-ascii?Q?MFgzq3vhzYJ1ZG0MSpLuII9lmFgeKLY3uWyH24Gkg3nb8oVol6VcT3XGEIVn?=
 =?us-ascii?Q?DuiyRhVkdO8VKNqlpd3QKPVvytjldZUSVU+XVuTU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e446575f-dbad-46d5-b026-08dcbc81025f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 16:49:05.5849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBWVDiiGmg++/nOXoj8CE0Oahvm8o7hPYZ9mA48aUFX8NTV73d8H7XsgmogyEE4Zsjhj3CS7wreLmOfUwwHh3lB3nZeD2VzEpbjFiek+8y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Wednesday, August 14, 2024 9:56 AM
> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com; Brost, Matthe=
w
> <matthew.brost@intel.com>; hdegoede@redhat.com; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH v11] drm/xe/vsec: Support BMG devices
>=20
> On Tue, Aug 13, 2024 at 02:29:27PM +0000, Ruhl, Michael J wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Tuesday, August 13, 2024 10:11 AM On Mon, Aug 12, 2024 at
> > > 04:04:22PM -0400, Michael J. Ruhl wrote:
>=20
> ...
>=20
> > > > +#define SOC_BASE		0x280000
> > > > +
> > > > +#define BMG_PMT_BASE		0xDB000
> > > > +#define BMG_DISCOVERY_OFFSET	(SOC_BASE +
> BMG_PMT_BASE)
> > >
> > > > +#define BMG_TELEMETRY_BASE	0xE0000
> > > > +#define BMG_TELEMETRY_OFFSET	(SOC_BASE +
> BMG_TELEMETRY_BASE)
> > >
> > > This looks like double indirection.
> > > Wouldn't suffix _BASE_OFFSET be better for PMT and TELEMETRY cases?
> >
> > I am not sure I understand.
> >
> > Are  you saying rename BMG_PMT_BASE to BMG_PMT_BASE_OFFSET?
>=20
> Yes. Same for BMG_TELEMETRY_.

Got it. I will update.
=20
> ...
>=20
> > > > +#define BMG_DEVICE_ID 0xE2F8
> > >
> > > Is this defined in any specification? I mean is the format the same
> > > as PCI device ID?
> >
> > I think that this is defined in BMG PMT yaml definition.  It is
> > provide in the PMT discovery data, so it is defined by the specific dev=
ice.
>=20
> Is there any documentation / specification about this?
> Can it be UUID or 64-bit number or other format?
> _Where_ is this being specified?

The GUID is defined by the YAML file associated with the PMT device.  In th=
is
case 16 bits are a device ID.

From the cover letter of the PMT patch set (Intel Platform Monitoring Techn=
ology):

-
The GUID uniquely identifies the register space of any monitor data exposed
by the capability. The GUID is associated with an XML file from the vendor
that describes the mapping of the register space along with properties of t=
he
monitor data.
--

I was told that this was the value to use for this specific device/feature.

It is specified internally.  Not sure if there is any "documentation" avail=
able beyond
that.

> ...
>=20
> > > > +	switch (record_id) {
> > > > +	case PUNIT:
> > > > +		*index =3D 0;
> > > > +		if (cap_type =3D=3D TELEMETRY)
> > > > +			*offset =3D PUNIT_TELEMETRY_OFFSET;
> > > > +		else
> > > > +			*offset =3D PUNIT_WATCHER_OFFSET;
> > > > +		break;
> > > > +
> > > > +	case OOBMSM_0:
> > > > +		*index =3D 1;
> > > > +		if (cap_type =3D=3D WATCHER)
> > > > +			*offset =3D OOBMSM_0_WATCHER_OFFSET;
> > > > +		break;
> > > > +
> > > > +	case OOBMSM_1:
> > > > +		*index =3D 1;
> > > > +		if (cap_type =3D=3D TELEMETRY)
> > > > +			*offset =3D OOBMSM_1_TELEMETRY_OFFSET;
> > > > +		break;
> > >
> > > default case?
> >
> > I validate the record_id and cap_type values at the beginning of the
> > function, so default would be redundant.
> >
> > The goal was to validate, then set data.
> >
> > So adding the default will remove the record_id check from the if.  Do
> > you prefer that path?
>=20
> Yes.

Ok, I will update.

Thanks!

Mike

=20
> > > > +	}
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

