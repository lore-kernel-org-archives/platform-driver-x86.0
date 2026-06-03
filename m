Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0134F24B;
	Wed,  3 Jun 2026 18:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511563; cv=fail; b=gVqzSdiZw/AKPEYhCki1DgdJLe9LiCTPQTUF5qdRte55i9Rxx9GXaTd63Juy3pGeVDo5vjkfi4o9/iLuJi3xo8dAGhq1qn3A2OUJ9ht7etm/4RaWcdY9WZxBft0nCfob7ouj0QaC9fZiqr1UqEVXWzPvr6SVAU8alb0H/RtZo5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511563; c=relaxed/simple;
	bh=JCXNzNK4pdi2PvLYgnbDTkuQZ2igyQwNi0ya4PMc82g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I2+Uw8lU1pCxsIZJBwhkzHNOO9kHDwOKYgWxgzrw4ktkkmBrfzOIPvOAS1+7fP3yzMe0YYWXMGV2Yp8GvaDPkugQx3L/oL76wGgUz5oS/ik+laB7Ls2h/t2Uon25jLkH1oMVujY6Z691cvsdoeJhmHqydpqgP5jKLPzIbn0h2wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMx5x8sp; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMx5x8sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780511562; x=1812047562;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JCXNzNK4pdi2PvLYgnbDTkuQZ2igyQwNi0ya4PMc82g=;
  b=CMx5x8spv+oN+qzcyaaWke5uErNI9/TyiHT+IGOFhlov2cAbMT4LwExv
   hgbdC72LFkziVTcPKYekoZs4TKh5Tk8/7GEPPMjs546uHJN++yRG1aziD
   IJa57dOPcpbHr/CRACBT8e00CZFQiXaFfmsPBLXkToqEf3TOCCwCtoPA9
   JpRiBn4hKGtvQspua7J12SYDOMOqW9f/n0m3t46fMiAbWRDuuiwZ1ttr6
   cZFdhAAdVoJfxaDjQDMMQbQuMacwwWCem9gaFL9cvg5m9ieGTquCShbeM
   bOQJ7NU8h5t2rvQfeJhzs8yOnoO+ZxdC8PRam7u+nTFV2m24TCuVQD3tp
   g==;
X-CSE-ConnectionGUID: VxX3XE+WQoCMrBhsgCqz+g==
X-CSE-MsgGUID: fmA5bW6MQqW2+2CWu6RSKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="91647035"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="91647035"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 11:32:40 -0700
X-CSE-ConnectionGUID: 1dAObTNcSFiA/zgPiTqkzw==
X-CSE-MsgGUID: NBlwDDz+ReevEekb+z6zng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="248643401"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 11:32:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 11:32:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 11:32:39 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 11:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GodDEQTkbAwyiOj8s2eV0N/zszP1LtjvlTisbKb5gP2olqzD07Q9z2JNx+rAkZogXb9UiG2TzvaBCxSiz7i+Tf3IAq0JxYD8Wg7tqJFG+5W2n2FnWBFnShFaei1TSWvPPEFuFRG1KB8mcrLoNZUM0u5OuCJYgvyXghYT8Jqkwf8USKIr5rbteVhKx0s1icbkGk2nsEQtLrrhAtqwaYCGSk7PBOVajYzMsxvU3wtWuz8PgxEeZjjfFmva8ZreDo9CCXLjV4aGIuewM48fGX7khyTt3Ul/s/0O5t0CGym1YpV162Y+3Ys/huAHUh2gQAGCK/wnRmqBCcSsqOMj5EkQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCXNzNK4pdi2PvLYgnbDTkuQZ2igyQwNi0ya4PMc82g=;
 b=mo7hI4r4dellsC2yf/FTOhe4Mu4HqtdkybTs7xeXxpZQ7bKFmd5ZPoIIfBFyPxJ7GLaT6KCYL5XxO+kPmoEkMgvD4S/s8FQCj8VdgkCJi0w7BBQEgiPAGUr5ZwBWMRu4pMHGc/jTaaLer2mSyOTcctm+OZ8x0icVU8xUZie8qJ1x7BR2xBW1cGHLLTdvdyIVK8+1BaFQqWl1nS/rr6s4rydAE6LTbsz/3zDW4HN5K/TKmonTfIyU9BhR0EZEbvttpNzss12M4C6kD9pL1k1LUl9S7hc73V9ActEow4LhUQI+rL2NbdcI7MR7beSOhCIRrqWD3+xM1+ahhGACApzIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ5PPF6E320AF71.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::833) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:32:33 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:32:33 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
Thread-Topic: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
Thread-Index: AQHc75l1qLeb1QL/KUCmNd1EE/QcOrYtKvAw
Date: Wed, 3 Jun 2026 18:32:32 +0000
Message-ID: <IA1PR11MB64184FD919A96888F580730CC1132@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260529183150.129744-1-david.e.box@linux.intel.com>
In-Reply-To: <20260529183150.129744-1-david.e.box@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ5PPF6E320AF71:EE_
x-ms-office365-filtering-correlation-id: c8048f16-1ec7-4fd9-0c82-08dec19e7a0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|3023799007|11063799006|6133799003|56012099006|38070700021;
x-microsoft-antispam-message-info: cRm/P3l6kXiJqB0+ONVXQWh63Oxj8GU2Du+jA1kZsLBBtCU1LHcmTEgu0SofkvXHMQC0tsK/Q1lwKFBZPEJuI+6IBf2tPkG+HE1vs4CF14bdIWvWqUoXVtf7dQuvXTMNyWMrW5nIA3ytfPbV70L4EUJUhg+CiB3JMX8Cf+sm/Cz2Rf22GifMvbGskG8uoOsNkQsgjCZIcVG/96SNfG2D2Ds1SjFi+gBqVieB+o75N9lnfR4g/Mq9GYISG+cQY8AHQ+gjT+xnn3q5zEJCzSBuyWCcwxFYu58KVCsyUXCXYnS5NPMWUFtzSSdviK4sp5hId14/VivAX0ZWCwV1aLsc3p/KGG1PJl4kmdzwyCmE7Ld1OZvbx7NMl4mSQZtamM43Ys2R1UUzKoL9iIBhVrLftYw+ROAnUtVXiPvXdX4aEL7y/hYhdeW3ugRtXoMhockIIWcYj55kS7BFJz+w7L5dyglGA46hJKpEBqpTVgt4Yyuvq+srRFkHMgKXqPYQDED885fmHcdxBURYTTxVGa8WNHCmqEwTrzKCL3DiQHLR1xFhVvKmJXsD1TrHPRKYA8UYQV++r7uKYxGHLHVmvzptm4hG7AFzOLcQIW753Y8dTeKc/Ul1kK6WWRfPmoTOtxJXTzfJtgp8x4TTj0v8cQMJZEmHoc1/fKx7kYWFtdBaI0iUikrRuzOp7iUbbALAKUVO7erUi4u6G+0Xim3p4/DcTbk5To+wkjWI4mkJYR6R69sf3biqUAXvnni7MnrOi0cx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(6133799003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFNFZkQwNjN5TVFzdHcrdjloenZ1VHVRM1dLZ3dlbzJUOXIrUHo3UEZNdi9V?=
 =?utf-8?B?V0xUM1JCaTZGQnllazM1a2E5QjdVc3lGdkJicXNndnRuQjcxN0xXTTAyVzZz?=
 =?utf-8?B?b1VFbjhuVThlU3AvbUV6aXVmaU5ValpUcVFMbnNXcWl6ODJrOHIzOHVIdmIv?=
 =?utf-8?B?VGdDa1loZ2dlQVJHMEd2ZERNZlQxR1hkdGkzL1E5djd6aVBxdEZrcFNEYjU3?=
 =?utf-8?B?V0FydDI4UlJoWWFESXRvTEFjNWRTZk9JcUMzTDJqQ0VJbzNaMEkyakFxNmg4?=
 =?utf-8?B?UFBOYU53eHRGd0FsSVFTMDIzSnFGS3BjZTRzR1dLQno5b1FOWE1rQUE2WTVJ?=
 =?utf-8?B?dmU3Z09WOHk2ZHlXbktyUjh1ajdJeGZZbUNlNTk1VGRaeW54d05uVCtiamRS?=
 =?utf-8?B?aFdzMTZ6aWhhTEVRcmRkVTIySkNsQ0Z0d1B1OWp1a2R3M2N2eTQwdS9JZFNM?=
 =?utf-8?B?M1hRdk51emhtRkNPM0oxWGtjZThHbUxCZ2hDMG5sZGxTVTJmTGdDRlZNVENH?=
 =?utf-8?B?eEdMYzhBdlVIdlFJVGFtVXkrS3AzYTRsQTNGOERCOWZKMHpvbFlDVm9RbnVD?=
 =?utf-8?B?U2REU3NUV0pqRDFBU0oybThuSDZlYzJ3dFl4eERmUlE5SkMzdDNCVkQzQ3p5?=
 =?utf-8?B?TDhwdTN3WVFKQndSalJBOW13TW9RdDYwcGxkbFJMQzhESkdBNTIyVzZMNTg4?=
 =?utf-8?B?ZFg5M24rWTFRYVhHdXZ2YXdad2NOdlVSWkNkMVRWNXFhODlGRVdKNWpkZFpO?=
 =?utf-8?B?YXk3Q3hlSEZXbEtsMlpSRk82V1ZPOGZMa2JWMDdKU1pXWHlGeitscXNrUTZn?=
 =?utf-8?B?N3dHVUtHTmt0UDhtbXRJOHlsaGM3d1A1aGlHTWxFU1c1VUt4OUdpdEkvTEJx?=
 =?utf-8?B?NDc2MXlYU3p1ejZUQ1JheHBROHVxeE5lSm9HNG1icFdYZ0ZhUVRrQWdHbUox?=
 =?utf-8?B?dkcwVzgxWmRJUHdnVTlMNjJRK1AzUXdDaER2L252NzFrYW5qVERLQXVUTm5h?=
 =?utf-8?B?UTBNbDl5NVVSZDlaamFYWStWTWgvVG53T3dkZWtZeHppTnFHMW44dmMwV2hR?=
 =?utf-8?B?WkNub1BvZ1RHOGhPendrM0VCTlpnTExicG81R0NBeEVlOVVQb1oxL0o1cS95?=
 =?utf-8?B?RHZTS2hDNk1RU1QvMWZhSThQdHB0L3hsL0Z0ZkcxNEx1SjZ6bkxibVk0L3Jk?=
 =?utf-8?B?V0g5dmpRellKUm1RWHJ1Vm1wWXQyMStkZmVTbCt6SEZRR2hFZ0NOQTFvNlF3?=
 =?utf-8?B?QzlHNVFuOXQvTmpSWXVMdUUrN0txbGVkM2xIQmRISnlEUTRZaFFZak84azdV?=
 =?utf-8?B?dDBMSDdUSUNraWlUVUd6QkVvQXh1alR1SDUxdzVqaGdTQ2M2V2FBQzAvdjRV?=
 =?utf-8?B?UmhZOVZxOURFU1NSV3JZSUtGSnQ3b1NFTGwzZm9OT0tzRXJQNVFZL2Q0L1hk?=
 =?utf-8?B?UXhmNGxpZHdTaTdiRUFZRkZ3dkRRQ2hSQWxaWDZ4N2dmc1owME41azNFRGVl?=
 =?utf-8?B?aklTY08zZEozYTNyUnZOU05HWm9zdWJ2a2FVa01WQmVnZHQ3UU5hcmN2djQy?=
 =?utf-8?B?YjRuSTdnTU1DcXBJN1RLeU1kQ3oxM2RIUHhPYStCZkZqN3NhV2VRTkpkOHRJ?=
 =?utf-8?B?dkF3b0lCc0lPYi9yeUxwQmtoYTJLWGtRMU5aU2o4RmRKZi9sYkRLZ3dsOFdy?=
 =?utf-8?B?VjFlSU5FcVdXbjhlb0JuWVY0UFVPQ2F2M0ZGUVhPWUJrL1k4WWhVMFZ6S2dE?=
 =?utf-8?B?TGVTdTNlRWdpa2QrakhCRS9JSS8zV210WHNBRlNHSlRZVTluL1RvNEo3QVo4?=
 =?utf-8?B?b28xUlB0V2xhUkdyMnd6WGo5ZE5NSnhCNDl0QnR2KzlWV0J0bWdjbEFmcVJi?=
 =?utf-8?B?MFh1ZkhwMHhpN0kxWGpoNFFkMWxvR2htWGJqUG5zRG0rM2RpMWd3aTk1SVhB?=
 =?utf-8?B?SUJMMVl6ZEgwVEh1TUpZK0NFU25lUHFrSEh4MFh3b21KMTloS0JadHdFbS82?=
 =?utf-8?B?eDJrVUZhNWU1dE8ramt3SlZFb2VFaVdoZGE2eWFVWW54M3JwcVI4K21vWWZY?=
 =?utf-8?B?ZEx0SWthaTVWNzhONXFCSURmSG1uQTgrUEJIREE1eld4aEdxOEtrdmFpNWky?=
 =?utf-8?B?dWovd0xZNTlXWnZyd01PbFYxQ2JwZ0Z5bzNISG5TVUo2TmR4YXRsd1RtQkxF?=
 =?utf-8?B?TCtFN0ZCcTFTVDhyczNKV3BaTlZvRXRJNnh5QkkvODJuYm5XMk44akdXZXgy?=
 =?utf-8?B?bzV6czBpTHdSQ0Z3UGdXRm1jWXQzakxaVEhYK2JYYmgwYlVlakFGVm5aSWZt?=
 =?utf-8?B?VkhkVmYyaWdEVzAxSCtRcjN0WGFSa2R1TkU2aUFxQXpoU1hkZ2N6QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jNSW1FGCzvwqo23TItZrREf9JLcjc9teAPVEeohGHWjQxM7QQIIqHwQdy+/tziUjmFNfsm0zAqVg/Hl1UPWb/Jba8pQUsn4NjFJmY0Psm9E67XVTALIZsN9HOPtmYWczSIyZNlFa4/ivRrm61MQ9lF9vZNAst7Ne0kRg23n12XO3eS1U2KdTGD0rDWmW65ilWYja79fYlKUqBuPv6BJ11af2w2XTjkJ2u/mlCltKx9w18NiFS4AThJF9mGGLaGqTJuS5J+lsJp++j/lXI9Bon+NMaHh0wkwmTGLZx5xygoetU6MWQ5I8nAK7P46EAFZiJW75OiGTYETLego9TPnXOQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8048f16-1ec7-4fd9-0c82-08dec19e7a0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 18:32:32.9521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyqvGjbm5cseXCni7Iyks8xjXthvP4fFE4ulo6ABMPRNEURxy54ea176EdlyjSAfMqg3wWrzQ3WKnOpxldNGBKyxva75Cq+yyioJWLFdZnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E320AF71
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRGF2aWQgRS4gQm94IDxkYXZpZC5l
LmJveEBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogRnJpZGF5LCBNYXkgMjksIDIwMjYgMjozMiBQ
TQ0KPlRvOiBpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbTsgUnVobCwgTWljaGFlbCBKIDxt
aWNoYWVsLmoucnVobEBpbnRlbC5jb20+Ow0KPmRhdmlkLmUuYm94QGxpbnV4LmludGVsLmNvbQ0K
PkNjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Ow0KPnRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGxpbnV4LQ0KPmtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHBsYXRmb3JtLWRyaXZlci14ODZAdmdl
ci5rZXJuZWwub3JnDQo+U3ViamVjdDogW1BBVENIXSBwbGF0Zm9ybS94ODYvaW50ZWwvdnNlYzog
UmVzdG9yZSBCQVIgZmFsbGJhY2sgZm9yIGhlYWRlciB3YWxrDQo+DQo+VGhlIGJhc2VfYWRkciBy
ZWZhY3RvciBjaGFuZ2VkIGludGVsX3ZzZWNfd2Fsa19oZWFkZXIoKSB0byBwYXNzDQo+aW5mby0+
YmFzZV9hZGRyIGFzIHRoZSBkaXNjb3ZlcnktdGFibGUgYmFzZSBhZGRyZXNzLiBGb3IgdGhlIFBD
SSBWU0VDDQo+ZHJpdmVyIHRoaXMgaW5mbyBjb21lcyBmcm9tIGRyaXZlcl9kYXRhLCBidXQgZXhw
b3J0ZWQgY2FsbGVycyBtYXkgcHJvdmlkZQ0KPnRoZWlyIG93biBzdGF0aWMgaGVhZGVycyBhbmQg
bGVhdmUgYmFzZV9hZGRyIHVuc2V0Lg0KPg0KPkZvciB4ZSwgdGhpcyBtYWRlIHRoZSBkaXNjb3Zl
cnktdGFibGUgYmFzZSBhZGRyZXNzIHplcm8gaW5zdGVhZCBvZiB0aGUgQkFSDQo+c2VsZWN0ZWQg
YnkgaGVhZGVyLT50YmlyLCBwcmV2ZW50aW5nIFBNVCBlbmRwb2ludHMgZnJvbSBiZWluZyBjcmVh
dGVkLg0KPg0KPlJlc3RvcmUgdGhlIHByZXZpb3VzIGJlaGF2aW9yIGZvciB0aGUgaGVhZGVyLXdh
bGsgcGF0aCBieSBmYWxsaW5nIGJhY2sgdG8NCj5wY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgaGVh
ZGVyLT50YmlyKSB3aGVuIGJhc2VfYWRkciBpcyBub3Qgc3BlY2lmaWVkLg0KPktlZXAgZXhwbGlj
aXQgYmFzZV9hZGRyIG92ZXJyaWRlIGJlaGF2aW9yIHVuY2hhbmdlZC4NCj4NCj5UaGlzIHByZXNl
cnZlcyB0aGUgcmVmYWN0b3Igc3RydWN0dXJlIHdoaWxlIGZpeGluZyB0aGUgZnVuY3Rpb25hbA0K
PnJlZ3Jlc3Npb24gaW4gbWFudWFsLWhlYWRlciB1c2Vycy4NCj4NCj5GaXhlczogOTA0YjMzM2Zj
NTFjICgicGxhdGZvcm0veDg2L2ludGVsL3ZzZWM6IFJlZmFjdG9yIGJhc2VfYWRkciBoYW5kbGlu
ZyIpDQo+QXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtc29ubmV0LTQtNg0KPlNpZ25lZC1vZmYt
Ynk6IERhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPg0KPi0tLQ0KPiBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC92c2VjLmMgfCAxNyArKysrKysrKysrKysrKysrLQ0K
PiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC92c2VjLmMNCj5iL2RyaXZlcnMv
cGxhdGZvcm0veDg2L2ludGVsL3ZzZWMuYw0KPmluZGV4IDE2NTc4MzRmZDI3NS4uM2M2ZDhhMTky
OGMwIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3ZzZWMuYw0KPisr
KyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3ZzZWMuYw0KPkBAIC00ODIsMTAgKzQ4Miwy
NSBAQCBzdGF0aWMgaW50IGludGVsX3ZzZWNfd2Fsa19oZWFkZXIoc3RydWN0IGRldmljZQ0KPipk
ZXYsDQo+IAkJCQkgIGNvbnN0IHN0cnVjdCBpbnRlbF92c2VjX3BsYXRmb3JtX2luZm8gKmluZm8p
DQo+IHsNCj4gCXN0cnVjdCBpbnRlbF92c2VjX2hlYWRlciAqKmhlYWRlciA9IGluZm8tPmhlYWRl
cnM7DQo+Kwl1NjQgYmFzZV9hZGRyOw0KPiAJaW50IHJldDsNCj4NCj4gCWZvciAoIDsgKmhlYWRl
cjsgaGVhZGVyKyspIHsNCj4tCQlyZXQgPSBpbnRlbF92c2VjX3JlZ2lzdGVyX2RldmljZShkZXYs
ICpoZWFkZXIsIGluZm8sIGluZm8tPmJhc2VfYWRkcik7DQo+KwkJaWYgKGluZm8tPmJhc2VfYWRk
cikgew0KPisJCQliYXNlX2FkZHIgPSBpbmZvLT5iYXNlX2FkZHI7DQo+KwkJfSBlbHNlIHsNCj4r
CQkJc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+Kw0KPisJCQlpZiAoIWRldl9pc19wY2koZGV2KSkg
ew0KPisJCQkJZGV2X2VycihkZXYsICJub24tUENJIGRldmljZSB3aXRob3V0IGEgYmFzZSBhZGRy
ZXNzXG4iKTsNCj4rCQkJCXJldHVybiAtRUlOVkFMOw0KPisJCQl9DQo+Kw0KPisJCQlwZGV2ID0g
dG9fcGNpX2RldihkZXYpOw0KPisJCQliYXNlX2FkZHIgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRl
diwgKCpoZWFkZXIpLT50YmlyKTsNCg0KQWx0ZXJuYXRlOg0KDQppZiAoIWluZm8tPmJhc2VfYWRk
cikgew0KCXN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KDQoJaWYgKCFkZXZfaXNfcGNpKGRldikpIHsN
CgkJZGV2X2VycihkZXYsICJub24tUENJIGRldmljZSB3aXRob3V0IGEgYmFzZSBhZGRyZXNzXG4i
KTsNCgkJcmV0dXJuIC1FSU5WQUw7DQoJfQ0KDQoJcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsNCglp
bmZvLT5iYXNlX2FkZHIgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgKCpoZWFkZXIpLT50Ymly
KTt9DQp9DQoNCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gcmVxdWlyZSB0aGUgY2FsbGVyIHRvIGZp
bGwgdGhpcyBpbj8NCg0KaS5lLiBpZiAoIWluZm8tPmJhc2VfYWRkcikgcmV0dXJuIEVJTlZBTD8N
Cg0KQ2hhbmdlIG9mIGJlaGF2aW9yLCBidXQgZm9yY2luZyB0aGUgY2FsbGVyIHRvIHByb3ZpZGUg
dGhlIHJpZ2h0IGluZm8gc2VlbXMgcmVhc29uYWJsZS4NCg0KRWl0aGVyIHdheSwgdGhpcyBsb29r
cyByZWFzb25hYmxlIHRvIG1lLg0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNo
YWVsLmoucnVobEBpbnRlbC5jb20+DQoNCk0NCg0KPisJCX0NCj4rDQo+KwkJcmV0ID0gaW50ZWxf
dnNlY19yZWdpc3Rlcl9kZXZpY2UoZGV2LCAqaGVhZGVyLCBpbmZvLCBiYXNlX2FkZHIpOw0KPiAJ
CWlmIChyZXQpDQo+IAkJCXJldHVybiByZXQ7DQo+IAl9DQo+DQo+YmFzZS1jb21taXQ6IGExNjdh
ZThlYWNlNTJkZDZjODA0MzhiNzdkOTI0NTBmZTEyY2Q0YmUNCj4tLQ0KPjIuNDMuMA0KDQo=
