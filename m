Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D89CC07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 17:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 474DC61C5B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 17:16:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhGFRTN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 13:19:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:27574 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230371AbhGFRTM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 13:19:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="208979017"
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; 
   d="scan'208";a="208979017"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2021 10:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; 
   d="scan'208";a="491404097"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga001.jf.intel.com with ESMTP; 06 Jul 2021 10:16:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 10:16:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 10:16:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 6 Jul 2021 10:16:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 6 Jul 2021 10:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpSqAlS3zXYpgPqc5unCML8sGBE52p6paLNFkOFDjXI+pE60Mrh5+Kvrl4ZajwDH/HxITE/B2mi4hjqWo5Hgu5153YCVZcg+XiZ/oaGVjWlMwmNXIleu+JijwKGYbGVUo5YtIwOyTMmViGbHaqDBqZzzDLn3yZAleK6DA3zutl6e3IBtLV91huDZKcw1H4TPmOaUlzO2gj+4keI7LBIYuGqbgBHhApADOVlWT/4klxCvK1Ofzgm7ghjaQdHcD5uANZeJrTD0hx2WpbqMkx8CZQ0R7rpZ99lgsOnAe07w05yCIajAJga7Fu95We/hCKLQSia0bYwDAIEFUouw6Byo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpQbP1GH4NhfGUxddv73qP7XI0tbbnNsvGuVNWe7QGg=;
 b=IJUqF3a3wujFOo4S6itgnPozxwTk/ZsWHr5lsYDfTdc5bqESQpHNvTMm5amfyPpvEqtuHB81n/O3TnzwggsTjOhom/AyHMETvJTTkXVT+dN49nknCkoYM1j614CSpk6UnWpFl9nJ56NU/ntyo9AaJdF6e2KJcK9T78ZXv6QALPmAlOo01Vvxhx7Rhr03N/3L0QzxNHVtFGxaj9HtsHuwDoy544ITmzqW2qj4mN5WWu5+DUYjKcJbqMzisaMKNt/rdOczn4zKiJkNw/0JNJ9IZRFR+hXYXDcxtwzW8L1iK/0HiZ7KJcVsF/If2hDJ8xQhLF3C9Pvax7wvkxaVAMbFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpQbP1GH4NhfGUxddv73qP7XI0tbbnNsvGuVNWe7QGg=;
 b=kVBLzjXUrfzISk1xAzPMcvBlf8q79zHY0TVVQiiVBJPJi8F7y1fkpNR/pWuEjmFX6oGOMencwuviEsHrGCZod0TFA2w3Byfgc4/DnvfXePB9Of0fd8P6YSBznqsJVKt9kJ2B0Rj831ZlmXG1UEp+mj6yHLaqApNttYp6MKthVSo=
Received: from MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 17:16:29 +0000
Received: from MW3PR11MB4523.namprd11.prod.outlook.com
 ([fe80::a87d:ca62:f143:7464]) by MW3PR11MB4523.namprd11.prod.outlook.com
 ([fe80::a87d:ca62:f143:7464%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 17:16:28 +0000
From:   "Kammela, Gayatri" <gayatri.kammela@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "irenic.rajneesh@gmail.com" <irenic.rajneesh@gmail.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Box, David E" <david.e.box@intel.com>
Subject: RE: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
Thread-Topic: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
Thread-Index: AQHXbuksGoxx3VkXc0OIDyPYbcQjk6svdKSAgACTn7A=
Date:   Tue, 6 Jul 2021 17:16:28 +0000
Message-ID: <MW3PR11MB45236E07A7215E40628C3622F21B9@MW3PR11MB4523.namprd11.prod.outlook.com>
References: <cover.1625191274.git.gayatri.kammela@intel.com>
 <YN7j+2zBmQlmBUzG@smile.fi.intel.com>
In-Reply-To: <YN7j+2zBmQlmBUzG@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.100.41
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18615d30-70f9-4e2b-2a8f-08d940a1caf8
x-ms-traffictypediagnostic: CO1PR11MB5090:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB5090EF9562212A8A678ABBB0F21B9@CO1PR11MB5090.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JyGGo6Wm35WcGySbKKORIIbuaR6vwOLrb1+wMgRYxUWbkflovrUNcBX42VEQllXYBz3VLg0FhiX3rhg4svapXz+qlCtbdi48RGPi2LopobsLq8GefGpH8B98vNQlXCd7d6dUAWlr7a7VVDNprKDySJnUv1rmBZd91ICM2W/TKpoS77VkcQOzO6zyNdnw+QCNcCIMb/yLvUo94TPHs9P17TtdmlR2K28FgHrL3fMrgmOC6d+gV7hB2/SAqo86lqPefQOzeSjb9a7HBvW/AdiiTrOQhSIX9z1Kcg/aTr5PKGBmhkY0Pv8kFXIA0x5zaGk4pQHLMKwjZKFQUSe4sqNF3asTPDDJyGtltpwkYGViCQcTF1B+Ca2CEYG/X4ZDgm1FytbrJAVcAzlFpT0HerNFL5Mx/wCKBnYoyK2oUjVl1Sh08NcWm/CwkJNqpZUBQ4zC8DtZYVRQt3rVYy4KfF0WJUYe5Y7NbPNmTYKoUz1nnFWYHnik7AFas519bSFudHn+lYa5/vYQ/8AygsAXWbtwi6saDKAzhQ0GUWgHZhaTeRkTk5I/FhQr29vvkViQiw6lcag1/XSFdLUy9JZcZBJp97BRDg8Ii+VxYOeHwq3ywBLYwfh4r2lUnRTR3ucdwvbagatZ73ZAM46IU8afhUQQs6pV0L9CZqut1bkKdggkwaISwZiiZt7yPQA03FsAETOzUzfnNEYBdk1bMSPEetax+BphxUKn1CCBF2N0MDbx+aupZZz5SYozgy2K8hETJu7HuPXRfLc7uFMa5+sXT90QvksqkBosxuFfWE65Zc5EvO2pvTWgIeXqX3Aa3CnDBBvI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4523.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(376002)(346002)(39860400002)(52536014)(2906002)(186003)(66446008)(76116006)(66946007)(86362001)(66556008)(66476007)(122000001)(64756008)(71200400001)(38100700002)(8936002)(55016002)(54906003)(6506007)(316002)(8676002)(4326008)(53546011)(478600001)(33656002)(5660300002)(966005)(83380400001)(9686003)(7696005)(26005)(6916009)(88260200001)(226253002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M9bQNXNAPncaRbv1/yqiYXo54e1P2ig8oy91gdjpcam8dUQPgPoq5RyJPJMY?=
 =?us-ascii?Q?gZpMqoeA4skhqP9HAeGTJ7IouUI+5HirfAY9X5nPsZ1cxOIogpachKopA7yo?=
 =?us-ascii?Q?E5A9JFJ9rDd5Vpu9mMZlx+AJFpg80jbsdi/QUwHpptiv9uUNiyTk7qvn+zXj?=
 =?us-ascii?Q?8KHCBncsDCspQfv7oha+k8K9xQKwOgrY2hFI+x8vHxaX8lakmJ3yIOON3PXL?=
 =?us-ascii?Q?C99VOConJhb7xEzhWj0Z/HBUmOOkjGKz0LGeE/2bI8AsgTAhQFVXpuld6sqb?=
 =?us-ascii?Q?RsEl6tpaLlegjLfKpw1VIzSqAfu0Q3QZTAGTyv/8pBFIqqLdP7+2kdCrUSz5?=
 =?us-ascii?Q?TfHSKeYPHTzTK6oNgdbJuYhzqCL1rxHCmjt66BDH1bUABY2xeRUjU/LnHxzK?=
 =?us-ascii?Q?qSJZ5jbb3QL6MpHYwO8ZjPFLN3/R5yxIM/YRQxRUKG9XxrVipLE1AgkV5q8R?=
 =?us-ascii?Q?NcB2/7Dbqdlk52Tdqnj3yuYB9tTEuPnwyzkwVKokpVDU+zULFuQrh9rB13kZ?=
 =?us-ascii?Q?qoksfWqihs2anARavgelWklaxWE+8ANmO8ooVknaLmejtIiGbimvbcPnGaoq?=
 =?us-ascii?Q?xi6Jfhl6nnWqzMq0Tx9eM+vIDL8E5Yo91Vx7Bc/uGcsJVCn8ijF2Ph0GbyWB?=
 =?us-ascii?Q?Fb4sO8ZuadipVlIBTUGVa4wYreJKUpWZcE3dxCQxhYbEhluwTk9rIEPPWuJf?=
 =?us-ascii?Q?mjfVrPJt7OicOpHSIlr8IVUzupJVkCIlJPoPcrmREeAXqN6WubyQwftCik26?=
 =?us-ascii?Q?WZs7tliFa3iamZnGtonM8ztIbiNZRV8JS25bdSrjv6Xd1xJVQ8oQNqULgwtw?=
 =?us-ascii?Q?TyyD4F76ZM/RAhdrchhIIxRfF/SVuJrx0Gi2HI4+NF8X4lEEmFwvJ0gNwnF+?=
 =?us-ascii?Q?+XY/YvNcTper9a6U5j8BWF+9+NVrgKzBMsFBoGQ/XAolvvZ0NSz5XEaJ5Cze?=
 =?us-ascii?Q?d6a3a2zfNykO+OPV8bkXhvDMDafMZ5FTflkcPIWz9+6mQwVDd8eQgCEFyAUo?=
 =?us-ascii?Q?ElPvy0t4Vs8dE/31ByuTJmNzNn8yuXsNG0I+fX/ySAV8kTzhHKIlYFAp5qGB?=
 =?us-ascii?Q?PEVYfkx/xeTofQSbh4Ab+K6MV4OtAzzql7UT/HuUg+VyjqtGxRYDWgqyDBSL?=
 =?us-ascii?Q?7P++bsA3OKWT1YU3oOk4jYq3GHg7dAPk+vwGMjAugGVcgWIoZdYCZVKQYtYw?=
 =?us-ascii?Q?uj5djLchc/YAXyx0beQ/yyFtKHZ/9xyU1ljnzDIoJasTjO8gj6wA2bSEVztT?=
 =?us-ascii?Q?4YD8RJUDX31U2TL+V5/kiQ/JwhSU25TQilxs6o7yZPrXzzN8nyPjg7ZBYX6R?=
 =?us-ascii?Q?C4M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4523.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18615d30-70f9-4e2b-2a8f-08d940a1caf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 17:16:28.8102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0wLIqzXLmm+Bqzk/oJffsgRHFNGbRTsDKpsV4kDq4Ez1hxOz8MEpTaJGtBAWo1/qu/uyEapiA7X0TyxLGuEL1PnODwdtyJ+8WhqLQ6oQn+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Friday, July 2, 2021 3:02 AM
> To: Kammela, Gayatri <gayatri.kammela@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; mgross@linux.intel.com;
> hdegoede@redhat.com; irenic.rajneesh@gmail.com; Pandruvada, Srinivas
> <srinivas.pandruvada@intel.com>; Box, David E <david.e.box@intel.com>
> Subject: Re: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driv=
er
>=20
> On Thu, Jul 01, 2021 at 07:19:59PM -0700, Gayatri Kammela wrote:
> > Hi,
> > The patch series add Alder Lake PCH-S support to PMC core driver.
> >
> > Patch 1: Add Alderlake support to pmc_core driver Patch 2: Add Latency
> > Tolerance Reporting (LTR) support to Alder Lake Patch 3: Add Alder
> > Lake low power mode support for pmc_core Patch 4: Add GBE Package C10
> > fix for Alder Lake
>=20
> I have seen only three out of four patches. I think to avoid such you bet=
ter
> use --cc parameter to the `git send-email ...` (Or you may utilize the sc=
ript I'm
> using myself:
> https://github.com/andy-shev/home-bin-
> tools/blob/master/ge2maintainer.sh).
Hi Andy, my bad, I didn't notice the 4th patch missing the Cc. thanks! I wi=
ll use the script going forward.
>=20
> Nevertheless, before doing anything on this, can you move the stuff under
> drivers/platform/x86/intel/pmc/ first, please?
Yes, sure I will do that.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

