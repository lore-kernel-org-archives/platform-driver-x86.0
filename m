Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6791C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Jun 2021 11:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF9DE61107
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Jun 2021 11:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbhFNLyU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Jun 2021 07:54:20 -0400
Received: from mga17.intel.com ([192.55.52.151]:1098 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236451AbhFNLxQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Jun 2021 07:53:16 -0400
IronPort-SDR: L9dzUYEH5iLzDLPSglgI5wob1HhTCjC3z6hE8bVwi09vhaIv7sZwdaJvKtZVphHpyzWXMFQetk
 X25kgSdRQ+YA==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="186170279"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="186170279"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2021 04:48:51 -0700
IronPort-SDR: 4QrAodL06eS/mbNis59H8HDvL217vnCELcuoKwkzEp3PJR1/258EBZmfdrj3cRXFPfAjV73lRQ
 OTEvq/KZqmhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="403633592"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga006.jf.intel.com with ESMTP; 14 Jun 2021 04:48:51 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 14 Jun 2021 04:48:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 14 Jun 2021 04:48:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 14 Jun 2021 04:48:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 14 Jun 2021 04:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD6+DGSv5GJZwJwIxPBId5BcQBd1aTznzAd7zdV8+gv+HVwX9mxN25rnUOiKGGpgjaHvyYlu7JfZ2RAGL1mpFz5/dutv2cofYadxsL+gF+FEqw1jB3I7EIxrd+Q4dTZzmxSKiAccHqa4PjA/9TYVAe6nb+eBwdzRU/Vmo+UR3dA02bkpHiFb0cwVYM/5tVYnh+vHViGjGiXqrNq2eld4ZgfzC1L0vkQJQvVqDuKfBF3C9+hpWOGKT0n+/IA7KOEBsWvHmMeqAaz4wHw5mZlHlwzKeA/9xg7m4n1HRjNyU5vXG8cYWb78EtRaeiBU2cIwo4WUgCW6vAjrN8ZTAXzI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXwyNNQ67vb5BUecrkugRI+YtmZWKiYlymVIqrTGoq0=;
 b=kDcTutpSwtvHYEc6gVgo5nMokX3BBJk8JJUOoRw+Xm3Zvk6Ma8I1+j5Q5LBsXxZTdulz9IlZxqrhYy7bflXcCSEgm90rYQqC05OBdqjFjJJqsmfI4DVvhoU+gWrxDYEwKElD4/ZNlkkY4Jj5JJgjSwszIOiWU/QXyB+egBa0s0zYju7dgvxpx05NHJyhn+nDl2zG6eKQJvKhErHykD8XOExWCzgy3lx60R2PWXG5VRyMIid8UNrXZ3DlIxLLvWK2tWazf0/sEsWB5vUYMXmrAoDq7CeTeO/lhlOOstU7YM/vHcx8I8EREbn6sWXM4ZSD2puVRmRMXtrmGu8RpaRvdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXwyNNQ67vb5BUecrkugRI+YtmZWKiYlymVIqrTGoq0=;
 b=P6rilmXdbl7oFA760u+NvSbxokQZia5888e5n4v2mo1G9xysE3+849wBymCxZzdL5ybCUJQhA5tvDepaV4mg4ZkZSJsV85gQ9rDVkZ84j75i5b3AzOhoQ4ORkEzWf9QosHzB9aQx5sS0SLu4cGP+8l4CHuCvI8miM2grqFSYkRA=
Received: from MWHPR11MB1455.namprd11.prod.outlook.com (2603:10b6:301:9::22)
 by MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 11:48:49 +0000
Received: from MWHPR11MB1455.namprd11.prod.outlook.com
 ([fe80::1ce1:6055:85e9:8c15]) by MWHPR11MB1455.namprd11.prod.outlook.com
 ([fe80::1ce1:6055:85e9:8c15%11]) with mapi id 15.20.4219.025; Mon, 14 Jun
 2021 11:48:49 +0000
From:   "Shravan, S" <s.shravan@intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
Subject: RE: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
Thread-Topic: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
Thread-Index: AQHXYF+VeNOuLV2+ZEGiRU0i34+lPasTYxbg
Date:   Mon, 14 Jun 2021 11:48:49 +0000
Message-ID: <MWHPR11MB1455D055108F1DBEA6EB9285E3319@MWHPR11MB1455.namprd11.prod.outlook.com>
References: <20210428032224.8299-1-s.shravan@intel.com>
 <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
In-Reply-To: <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [49.207.195.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88f60a5b-6740-444b-6cb5-08d92f2a6004
x-ms-traffictypediagnostic: MW3PR11MB4732:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4732CDAB796B19CADA76A326E3319@MW3PR11MB4732.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cO5xUfEdy5DWpbVMFDzpRj7M5ZEX9pNIwYvh9i/gewxAHzY01brlni4PNe941VLLVagT4eL2paDvPqGxhN45LOGtcVgYfLy9yJdmW+58331JojeIwCISQmJ/Qihrk3Y8dB4ZeXZtPxcujJxk3Ed7wKwrE0GCe81PLKn27mBbTm9xILt9Ku/gtr6nIH/r5oHKt4thje8pXR2bP5JV8eKKLq7SOXBKD1V0dfgCh1M+GcNtEhvLCR7nzzbc3oczKp8Iph+8cSjBn9OpfvFMIXM17pmSgeLYAk7EtGS0BwLeTkFbxEWFZXitHG6kMYf47BgoHeaQvQN4yX7EqnqmZsSCzxQP6u8TJ9s48oKs+jdv71v7e39u4zwuII64+N4lPGcHleKxXcmikwmNyQ/g6dkX6Gtd3YbwcEgR9oTnrRz4GCG+oy4GNVgRQSVdUN1JlNEZn29GJ+mGhfFgFpbC67oJiVf1JHf6xEORiL8VxJvB7FYvJrrIVcBoDMLReMmS+t1NRlMUWKdCmJJk17eVGDVePke9wa21xo11QwR2yMeD+9+XPropLimG6E8Y2DcRURJyafvjD7bxi9t3h6AV02yWv4Zsg+YiEA/tX+tjGDwur0Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1455.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(376002)(346002)(136003)(52536014)(71200400001)(55016002)(7696005)(316002)(5660300002)(8936002)(38100700002)(122000001)(53546011)(4326008)(6506007)(9686003)(478600001)(76116006)(186003)(83380400001)(86362001)(64756008)(66446008)(54906003)(6916009)(55236004)(66946007)(33656002)(66556008)(66476007)(8676002)(26005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1ZQbm5KSjlKKzdpTGZxUnVUZTJVdXhodmQ0eUtIc1hBVkVNN3FRcUdNbjht?=
 =?utf-8?B?Y0RuMWFtZWw4ZzdrV1NzM0RWVjFYNktBTVQwa2xQdm1oTDA1Z2xWc1RrVERN?=
 =?utf-8?B?L3E4dkxNclVlYzRqVi9GNUFrK0NhTzA4S3NiVUxQYThLVVNXNm5tMHdab1pD?=
 =?utf-8?B?ejI2RFlkU1JxZTlFT1dsLytSSTloSjhUditJcXRzSE11M0dQMjdLaWM4OUN6?=
 =?utf-8?B?VHRsbDNSYjJpTnFGR2RRcHVuemNaamdKajdLbkowVGNUQXR5RUxQMWp6VkY1?=
 =?utf-8?B?a1hZZExPclZnMGxORTFDQi9jL3lyVldnakhZWTcrRnlQbTBxRFVqTmp0anlW?=
 =?utf-8?B?eFpVdnJQU21sV1VLRUFuT01yTGg0dFl5UGJlUm0vVTlUR2pGZkt5ekt1UFlR?=
 =?utf-8?B?aWpvYk9rc3d4UWJFd0VIY3FPUzAxc3lNS2xZdWJENVRRamREZGczL1EzcXNV?=
 =?utf-8?B?ZysxZ2luWjJIbGpkN0tIOXJqbE10NXkrbFdxWnBCN2RCWDI1N051M0VaUWkr?=
 =?utf-8?B?dGkvRGZyQXMrdk93c1FpMGVQTk9GWStFNlBPbHk2KzFDY1ZUVlV1U3pPL3Zr?=
 =?utf-8?B?SDJnRVY5QUl0Znp0SUpsMlJibDNKYzRNa2xQNzE4TENIcU0zbU4yVUZ6NTcx?=
 =?utf-8?B?RkxvL2ZsQy9nQ1YvTXIyaHRtTWtxREZITDltWkdUbnJRNWs5WGhacEI5aGdF?=
 =?utf-8?B?L1VCdXBzVlh0WUdObnRHM3ZNRERMN1dNTWZUQWxGWWROQjBPSFNZVGFQcS9o?=
 =?utf-8?B?UklhQmpQTzF2YWpWY2JwL1JRN2VJQ3ZMd1R6cEUvS0Q0VkZwNjl5YlVqNVRo?=
 =?utf-8?B?ZTJhb0Z4UStmeVIzbXdOU3B2T1B0QlBoUVN4N2JuRHlJLzFyVnRvTmJNbGgv?=
 =?utf-8?B?UThWdGlwWEpyWVd5VkpBNTJZcnQ3RTI0a09iR2Q2bGw5M3lFSkxZeGxxaTBj?=
 =?utf-8?B?bE1MT0xRZUNvU0NiL2hQSmxpQ0JBK0Fad1QxcjkvRmRNYnJYUGVYeU5DejJY?=
 =?utf-8?B?TXcyeXlsTWsvQWZhbjVPcVJ0VWNKUUlMN2RYR2NiVHN5RENCWEJZa2piZWZI?=
 =?utf-8?B?RE5PR21JeGdxeXVSQVZFRlBLSS9rcXl0WkE1S3dJRk9CczFiMTQwQ2tieWl6?=
 =?utf-8?B?ZWY0MmJpb2FuUkVmby9qeUxVZWRDa1hsWU1mb1BYY2todnZIVW15NURTMXhx?=
 =?utf-8?B?c0xOa2xkL1ppTFc2U25EWDF1OFJCVVRqbm5MeEdPUmYzWmFkcDJvNnYzdGQx?=
 =?utf-8?B?KzNDRWNTUDFOSEovdHd4MTlWbGhVc0hLOEs4eUhhZnF3Ujg1SHNoMVFtUm1K?=
 =?utf-8?B?Y08rQTlsQzJWZ1BzN1JjVUlRS1QxbzV2WUxhQ3Uvd2hScUNTa0RUSVdiMEdK?=
 =?utf-8?B?Q1JINFpvVldKcHVlYnphZXZXWFVBVXR2TWM2Sk92ZG8xanlIWUdiS2VUVXZB?=
 =?utf-8?B?dUdSSU5PWHYvWThsME4yUEtWUHRseHVBaU03R2k4MXo3cWpqYVNLMWtsQ3ht?=
 =?utf-8?B?SDRnV05Kc21Rd2t3MHAwb25YNGxMMUQ2bzFqelBWOVpYNEw3bUpRQmppSWlT?=
 =?utf-8?B?OEEwOWwvMnh1RzFDVWZGVGNEYzNtWXdKdDNMRVJGKzQ3ZEltUXNqd3pNQXdJ?=
 =?utf-8?B?RWNpT1hwMEtNR2FlZ2pNbnY1WmFEaERUTUhqd2NQeDdLYnRIVGE2VmhUZTRF?=
 =?utf-8?B?RkxXa1FXYTB2Yk5tWll1YXdjT05OU1hWZmFPTm1GelJJaXNZVEZhd2VLU3A1?=
 =?utf-8?Q?pQFbSIeIJ4QvXpD/oaQdlpntPBHH1Z4UVMBV78P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1455.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f60a5b-6740-444b-6cb5-08d92f2a6004
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 11:48:49.4780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmQQUBLv0vBo09r1luaKNtDQCIh3laxIGEh4oi2R7Vx9mIwJQozwhli0WUwzV6XeY06pZiVau4x7e/ZmuYsqLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgQW5keSwNCg0KV2h5IGlzIGl0IG5vdCBhIHBhcnQgb2Ygc29tZSBnZW5lcmljIHN1YnN5c3Rl
bSB1bmRlciB3aXJlbGVzcyBuZXR3b3JrIHN1YnN5c3RlbT8NCg0KLS0gVGhpcyBkcml2ZXIgaXMg
aW5zdGFudGlhdGVkIG9ubHkgd2hlbiB0aGUgQklPUyBvbiBnaXZlbiBob3N0IGV4cG9zZXMgQUNQ
SSBub2RlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIEJJT1MgU0FSLiBUaGlzIGRlcGVuZHMgb24gc3Vw
cG9ydCBvZiB0aGUgQklPUyBTQVIgZmVhdHVyZSBieSBnaXZlbiBPRU0uDQotLSBJdCBpcyBhZ25v
c3RpYyBvZiB0aGUgd2lyZWxlc3MgdGVjaG5vbG9neSBsaWtlIFdXQU4sIFdpRmkgYW5kIEJULiBI
ZW5jZSwgaXQgaXMgbm90IG1hZGUgc3BlY2lmaWMgdG8gYW55IGdpdmVuIHdpcmVsZXNzIG5ldHdv
cmsgc3Vic3lzdGVtLg0KDQpQbGVhc2UgZG8gbGV0IG1lIGtub3cgaWYgeW91IG5lZWQgbW9yZSBp
bmZvcm1hdGlvbi4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KU2hyYXZhbiBTDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5r
b0BnbWFpbC5jb20+IA0KU2VudDogU3VuZGF5LCBKdW5lIDEzLCAyMDIxIDc6NTIgUE0NClRvOiBT
aHJhdmFuLCBTIDxzLnNocmF2YW5AaW50ZWwuY29tPg0KQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+OyBNYXJrIEdyb3NzIDxtZ3Jvc3NAbGludXguaW50ZWwuY29tPjsgUGxh
dGZvcm0gRHJpdmVyIDxwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZz47IEFuLCBT
dWRoYWthciA8c3VkaGFrYXIuYW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAwLzFd
IFt4ODZdIEJJT1MgU0FSIERyaXZlciBmb3IgTS4yIEludGVsIE1vZGVtcw0KDQpPbiBGcmksIEp1
biAxMSwgMjAyMSBhdCAxMjo0NiBQTSBTaHJhdmFuIFMgPHMuc2hyYXZhbkBpbnRlbC5jb20+IHdy
b3RlOg0KPg0KPiBTQVIgKFNwZWNpZmljIEFic29ycHRpb24gUmF0ZSkgZHJpdmVyIGlzIGEgaG9z
dCBkcml2ZXIgaW1wbGVtZW50ZWQgZm9yIA0KPiBMaW51eCBvciBjaHJvbWUgcGxhdGZvcm0gdG8g
bGltaXQgdGhlIGV4cG9zdXJlIG9mIGh1bWFuIGJvZHkgdG8gUkYgDQo+IGZyZXF1ZW5jeSBieSBp
bmZvcm1pbmcgdGhlIEludGVsIE0uMiBtb2RlbSB0byByZWd1bGF0ZSB0aGUgUkYgcG93ZXIgDQo+
IGJhc2VkIG9uIFNBUiBkYXRhIG9idGFpbmVkIGZyb20gdGhlIHNlbnNvcnMgY2FwdHVyZWQgaW4g
dGhlIEJJT1MuIEFDUEkgDQo+IGludGVyZmFjZSBleHBvc2VzIHRoaXMgZGF0YSBmcm9tIHRoZSBC
SU9TIHRvIFNBUiBkcml2ZXIuIFRoZSBmcm9udCBlbmQgDQo+IGFwcGxpY2F0aW9uIGluIHVzZXJz
cGFjZSAoIGVnOiBNb2RlbSBNYW5hZ2VyKSB3aWxsIGludGVyYWN0IHdpdGggU0FSIA0KPiBkcml2
ZXIgdG8gb2J0YWluIGluZm9ybWF0aW9uIGxpa2UgdGhlIGRldmljZSBtb2RlIChFeGFtcGxlOiB0
YWJsZXRzLCANCj4gbGFwdG9wcywgZXR4KSwgQW50ZW5uYSBpbmRleCwgYmFzZWJhbmQgaW5kZXgs
IFNBUiB0YWJsZSBpbmRleCBhbmQgdXNlIGF2YWlsYWJsZSBjb21tdW5pY2F0aW9uIGxpa2UgTUJJ
TSBpbnRlcmZhY2UgdG8gZW5hYmxlIGRhdGEgY29tbXVuaWNhdGlvbiB0byBtb2RlbSBmb3IgUkYg
cG93ZXIgcmVndWxhdGlvbi4NCj4NCj4gVGhlIEJJT1MgZ2V0cyBub3RpZmllZCBhYm91dCBkZXZp
Y2UgbW9kZSBjaGFuZ2VzIHRocm91Z2ggU2Vuc29yIA0KPiBEcml2ZXIuIFRoaXMgaW5mb3JtYXRp
b24gaXMgZ2l2ZW4gdG8gYSAobmV3bHkgY3JlYXRlZCkgV1dBTiBBQ1BJIGZ1bmN0aW9uIGRyaXZl
ciB3aGVuIHRoZXJlIGlzIGEgZGV2aWNlIG1vZGUgY2hhbmdlLg0KPiBUaGUgZHJpdmVyIHRoZW4g
dXNlcyBhIF9EU00gbWV0aG9kIHRvIHJldHJpZXZlIHRoZSByZXF1aXJlZCBpbmZvcm1hdGlvbiBm
cm9tIEJJT1MuDQo+IFRoaXMgaW5mb3JtYXRpb24gaXMgdGhlbiBmb3J3YXJkZWQvbXVsdGljYXN0
IHRvIHRoZSBVc2VyLXNwYWNlIHVzaW5nIHRoZSBORVRMSU5LIGludGVyZmFjZS4NCj4gQSBsb29r
dXAgdGFibGUgaXMgbWFpbnRhaW5lZCBpbnNpZGUgdGhlIEJJT1Mgd2hpY2ggc3VnZ2VzdHMgdGhl
IFNBUiANCj4gVGFibGUgaW5kZXggYW5kIEFudGVubmEgVHVuZXIgVGFibGUgSW5kZXggdmFsdWVz
IGZvciBpbmRpdmlkdWFsIGRldmljZSBtb2Rlcy4NCj4NCj4gVGhlIFNBUiBwYXJhbWV0ZXJzIHRv
IGJlIHVzZWQgb24gdGhlIE1vZGVtIGRpZmZlcnMgZm9yIGVhY2ggUmVndWxhdG9yeSBNb2RlIGxp
a2UgRkNDLCBDRSBhbmQgSVNFRC4NCj4gSGVuY2UsIHRoZSBTQVIgcGFyYW1ldGVycyBhcmUgc3Rv
cmVkIHNlcGFyYXRlbHkgaW4gdGhlIFNNQklPUyB0YWJsZSBpbiANCj4gdGhlIE9FTSBCSU9TLCBm
b3IgZWFjaCBvZiB0aGUgUmVndWxhdG9yeSBtb2RlLiBSZWd1bGF0b3J5IG1vZGVzIHdpbGwgDQo+
IGJlIGRpZmZlcmVudCBiYXNlZCBvbiB0aGUgcmVnaW9uIGFuZCBuZXR3b3JrIGF2YWlsYWJsZSBp
biB0aGF0IHJlZ2lvbi4NCj4NCj4gSGVuY2UgdGhlIGVudGlyZSBTQVIgZnVuY3Rpb25hbGl0eSBo
YW5kbGluZyBpcyBkaXZpZGVkIGludG8gMiBwYXJ0czoNCj4NCj4g4oCiICAgICAgIEEgQUNQSSBm
dW5jdGlvbiBkcml2ZXIgaW1wbGVtZW50ZWQgdGhhdCB1c2VzIGEgZGVkaWNhdGVkIEFDUEkgbm9k
ZSBmb3IgV1dBTiBkZXZpY2UuDQo+ICAgICBzZW5kcyBub3RpZmljYXRpb25zIHdoZW5ldmVyIHRo
ZXJlIGlzIGNoYW5nZSBpbiBEZXZpY2UgTW9kZS4gKGVhY2ggT0VNIGhhcyBkaWZmZXJlbnQgbWVj
aGFuaXNtDQo+ICAgICBvZiB1cGRhdGluZyB0aGlzIERFVklDRSBNb2RlIGluZm8pLiBUaGlzIGlz
IG5vdGlmaWVkIHRvIFVzZXItc3BhY2UgYXBwbGljYXRpb25zIHVzaW5nDQo+ICAgICB0aGUgUlQt
TkVUTElOSyBpbnRlcmZhY2UuDQo+IOKAoiAgICAgICBXV0FOIERldmljZSBTZXJ2aWNlIGxpc3Rl
bnMgZm9yIFJULU5FVExJTksgbWVzc2FnZXMgYW5kIHJvdXRlcyB0aGVtIHRvIE1vZGVtIHVzaW5n
IE1CSU0uDQoNClRoYXQncyBhIG5pY2UgZmVhdHVyZSENCldoeSBpcyBpdCBub3QgYSBwYXJ0IG9m
IHNvbWUgZ2VuZXJpYyBzdWJzdWJzeXN0ZW0gdW5kZXIgd2lyZWxlc3MgbmV0d29yayBzdWJzeXN0
ZW0/DQoNCg0KLS0NCldpdGggQmVzdCBSZWdhcmRzLA0KQW5keSBTaGV2Y2hlbmtvDQo=
