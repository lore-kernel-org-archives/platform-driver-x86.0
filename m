Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAEBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Jun 2022 17:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344370AbiFCRW7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 13:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344365AbiFCRW6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 13:22:58 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAEF35DE3
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 10:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXPZg4WKFxKrxAmOjoPvHyt5oS87Gd+lxKY50cUZ2mJwDcXKRz84/X9kNLCu15LZM1vzdkTWNIidFiXaI03D4kYYVGSkZ0+g+VyQJ9SwH0CkdPBcqukpUh64SVBgQRAH688YpGZe11O1C845O6g4L6SV7sJ5o+VtldEAqOp9S4Elh2HLSj2+wpecqLFKunfbVmQvJrhUJXotp7PO0JudrrtIddnz4pe1GUtOrcJd6qUvRuRBeGr2IOLdiHILiqq0CpI1/fV4Ijnl2bKaB+oFUW25fGHA3SPxM0PDuaHjRv+LUV2P7rLQs7Tbrxy38JWhNs+U9yHbdSx8DbJpPeyImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4ILFczxSBaqIpx70WTE1TtTIeU6iDSS45/0cC2XDmE=;
 b=fNXVCo1M+ZWSjN5xEu/7bYpJvevcPFsv12wE3/wRXjKhbj8VQUKBCXLRneAxjiuYgIxKjAQS2x4sl6P7Q8KQvb7ZGntIGCe4wL8bZUpsf0f1UueKITlm+LPL6gmpnCE+jSxhVa5mJ1UpOiJH6KfllfPxqo4ByOJdPc3bm+2G7PQP5KApGj6O1PmJLSK2b2UimUJvx7jIPBO07OgjU4KNJ1irK3icbGUWD86ff1s9+pO6peDtiZWTa18gPfvGz5tjVzGCEMJfmhtV8c9Z9/hzoR5VDtAubujAdCLVWkPXzhV01YFb2iFfoMEgXgI91oav3u2bfcjlnP+dTrpfNAbU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4ILFczxSBaqIpx70WTE1TtTIeU6iDSS45/0cC2XDmE=;
 b=Qg72Evm+asZBYVitKfHIjUQqmHUnFJIG46T3DMmQWUstSCk73Cyz2GnC97rmf3oAx17rhVqejEFoNT46aTNbetKeyiIY6sBEvPDtEBikYzni6b5lra25DQzkJ572kUw9Z8XkVdFtMbIE1Rq2Gr6d+D65BJpDfRN30a8TVO5l//4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 17:22:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3d0f:71a7:3a0f:ac2e]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3d0f:71a7:3a0f:ac2e%6]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 17:22:55 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Mark Pearson <markpearson@lenovo.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [External] RE: [PATCH 3/4] platform/x86: thinkpad-acpi: Add
 support for hotkey 0x131a
Thread-Topic: [External] RE: [PATCH 3/4] platform/x86: thinkpad-acpi: Add
 support for hotkey 0x131a
Thread-Index: AQHYd2vCF10sc/sGK0y9ws+t20IvAa096wdAgAAC2oCAAABCwA==
Date:   Fri, 3 Jun 2022 17:22:55 +0000
Message-ID: <MN0PR12MB610163AFBBF382DE0623208EE2A19@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20220603170212.164963-1-markpearson@lenovo.com>
 <20220603170212.164963-3-markpearson@lenovo.com>
 <MN0PR12MB6101B587428E030D96AAA127E2A19@MN0PR12MB6101.namprd12.prod.outlook.com>
 <4cd77c91-9d0b-9eb3-bbb8-e3a669eef598@lenovo.com>
In-Reply-To: <4cd77c91-9d0b-9eb3-bbb8-e3a669eef598@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-06-03T17:22:29Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=85287332-247c-467c-9651-194f9a7c63fc;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-06-03T17:22:52Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 45519867-342c-44c8-8da6-4ec2d7250707
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fbd3709-f3fd-4c29-214f-08da4585b28c
x-ms-traffictypediagnostic: MN2PR12MB4438:EE_
x-microsoft-antispam-prvs: <MN2PR12MB4438DE7CAD3EF39C5803C444E2A19@MN2PR12MB4438.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r3DEVYNt7XEqC5n77qs36zKvcl6F9yxTrx9MN38yzz98JRMWPm328mK5GCvYToRxbbfd7j6lbtAB7Z7UCr617rFSqAdVouZPsbmaNFI782x4DqHNYysMBQlz7N/xewKp273S3vQ2tw8DlklZvW6nLKrhI2WPuLQySydh2bs3GkSsQqni115AirvPu0c3v+ThlCwkV64gUOdPrZNPpRKmVbKvcZfLV24/FehhpOOCIYnP6qmJ/39fKpPziJLn2qZ8a4kuuWy5O1tqBJnWWYjAgt/sH2BU8vrySCuWS1YgmdUYhiFbFeFrQsocPKjJ1slngKnrkUyrdZTeQXUcKrXYncDJQm63Hw33o3PfPMJ/TM8N8Uq1+Eux66/tHMZt5Ri1Fr5MI5GM7Ixcg6lfmDNllwbgUVKQR1lXou59Y1I6UjaPB2cKjFTDOSepoQo3wHjxQBIFAC92e7SEHdLx5Ky3s00Ice/SYUMqAjVeAyxWR8Z2RDO9nvI6CT8xQ6EkaG/j3+20CryS5IMwSY3l1gTJzayM13AbdAWy/xT4cgm1sTmQHb4bhUfNPi7RdzVR8l5TXcOTSeFUlBI3MRZYBaWI3dZ05dnc3rrVmO+XlwERg66LnYrFYac4om+Lfw/WivcJB8eMWHy3KVIidTGsRLi511GUKmarG4vgbz9B+Wv846CZ8R8q2KYCphOA7eLpWQOW06Hm6CFpqIPKWVNcuZ5iFQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(2906002)(38100700002)(33656002)(38070700005)(86362001)(122000001)(6506007)(9686003)(26005)(54906003)(7696005)(71200400001)(186003)(508600001)(6916009)(66446008)(64756008)(66476007)(66556008)(5660300002)(76116006)(52536014)(66946007)(4326008)(55016003)(8936002)(83380400001)(8676002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVo5ZDhua0pYbytvdkdZcStQdWQ5bUNPWnNBTnVmanRRUmpDVXNBakFTd0Vq?=
 =?utf-8?B?NzRDU3diZjFNcDBCSEFZN293Mjl4Qlo0WHZWZ1lMZ05CVC9qazBsYWRTNTNB?=
 =?utf-8?B?eHUrSVVnTkUrRHU2aTAzYk1mNTJ2Q1lHQWZaZWp3N05RZlVYcEVEdDhDeGJm?=
 =?utf-8?B?UTNYakhrdHZFeXdrNjYyV3VybjJZUTJIdERXLzhIaTJkK0F2czR4MHVmeldr?=
 =?utf-8?B?ckVVdFF3TWUrbm1kWlJwNFVIUy8zQy9NMGp6WmFoYm9lWFJSWFJFYnl6NW5m?=
 =?utf-8?B?VmJ2bFB6SDhENmhqUHNYeEFKTnpmZmdjQlZ3d3drQ1E4OVFTNWJZREZXV3hr?=
 =?utf-8?B?WTd4aGtINSt2N2MyalQxdURFb1VuZThybTJ1SWdQY3I0NDdSR29ENWdNVmhU?=
 =?utf-8?B?VXZHUms4d0x3cjBVd3c3VXhrUjFFWmp6NVRvZWxxenFqd2kxVW9QTEI1L1RN?=
 =?utf-8?B?YjRkR1pZdnNsWkVXUDFPTllMa2lJWDR2Vm1JWjRIeHc5V05mWG9lT3Avc08w?=
 =?utf-8?B?UnE0SGo2L2wwZjQ4TGZwQ1c5bVNyUGREZTFBZm1RUHhRNTkvOGQ4UTlkOUow?=
 =?utf-8?B?a0paay95RXdNNkwvbC9OeERPeWprbTZJSFZoK0tvY21tcklzcTdFcXBuREVs?=
 =?utf-8?B?V2RRZG4vT2o3OVV3ZFRjTCtydkdDeWJVYXVPeFRnWGE2K0V2ejA2RFFyempz?=
 =?utf-8?B?TFFWemlHbVJVR1c0NStDRzN1bzNtTG1OTFp3b0hHY1I5K2tXM0ZSejhPM1NI?=
 =?utf-8?B?ZWVFcUNURlo4L3FSNy9GWEN0c2dPcXo3bDBhenZBcmtrV1JEcnVXMUkwWTZp?=
 =?utf-8?B?VWxhUjRnRkczWXliVDUvUStoeFRJaVBUalNPdk5KOXFncDFPNkdxeGUyYVZh?=
 =?utf-8?B?WE9qSTJvcDUwWEtRYXJBOEFBZU1ScmJEdXY0blpmNTVzYlZTd2JCREc5QjRD?=
 =?utf-8?B?Q0Q1a0EwL0V5aWRXOVk0KzZxN3dZWkp5MnowckJOR2RqT3pvUFdNajBnNk9z?=
 =?utf-8?B?Nk9lUWI0bHdCSk5RU3NhRnp6a1ZjVUlWdkl1Rzd5d2ttTnpTOHR0Nnl3dkI5?=
 =?utf-8?B?aG5iTXBVVVVKR2tsV2pwbHFLdTBxeWZPYXdUMzB6NVFaRmhURVdSamlJT3RU?=
 =?utf-8?B?TWVpWFluOTM5RVpFc2FRcmNnZVFWYTRuRzZEdmpHbE9xTjlEUUFLOXl4Q0VG?=
 =?utf-8?B?RnhFM1pjZjFyczhLdGZ4YjFzeW10Q0RrQnhCOTJLNXc3SHBzckVObkRrZ25Q?=
 =?utf-8?B?U2dZZzVuWFZNd1oyTmk0eXk5aFpEVHRmNTV6WkRLV20wMUhOQ0YwU2pmUGxH?=
 =?utf-8?B?QzBBWUo0eWx6LzRiWVU4ZXdoRXJscnlhRHBvTlRpd1E2TnQ2NkRrcTlsL0pw?=
 =?utf-8?B?S1ZuMHRwbXhvVVB0aEZzM0NZbU9kOXVkeDFkblN0TDU5b01EQ0JBb2ZBUFdT?=
 =?utf-8?B?MkhhejBaMkJqZjhPVE1uWFlDQ0Eya0p4VldsTmZyN1hPeXE2U2E2K2loSXhy?=
 =?utf-8?B?cFUvemJqUDZmQ0NCWXE2YmVJRHltR2RleEZnRFBxdjR3dTk3M2FpWDU4amhX?=
 =?utf-8?B?S05ONWE5RUhyUC9laHBGc0RqaDNHVmJjbCtpOUcyS3FWYTgwWnhjWUNGQW1n?=
 =?utf-8?B?NzIwc2orU1FNNE8wSDVwcjNDcHpvTklaMFNaNTJOK3RkMHVGTC9kUmNNRmR3?=
 =?utf-8?B?Q3Q0Q0ZhQUg5MHJYU0dZQXR1WTM1Qi9qK0hpZEo3NnBOU0plYzA2cGQ0TGh0?=
 =?utf-8?B?aWp4aWJQYWIwNHJuQnNYdjBMY0hiUW8rVzZYWXFqWmNTU2t6K01EWklQUDk2?=
 =?utf-8?B?dUVJNy9tYjRwNmlBTExFVFFGTDh3cTd0Z01XMnp2dkhvYitlVnJBMVRDcnZ0?=
 =?utf-8?B?Wk4vQUtzNy9Vb1VDaGpXSHo2WTBqRXNWeHlYejU4dzVNVHNobWZVMG04eHd4?=
 =?utf-8?B?V2M0QUowOFlqbU56SUNPNGF1dTcrM0dtVlZoaU1ERFpjWTcvTVFPM1Z0c2J6?=
 =?utf-8?B?aklqS05jNUVDelJOSllHak1xNy91cjgzV0Vza2xrcnVlMWgzSXI0SWI2N3hx?=
 =?utf-8?B?WGtkSFh1Y0I4TnY1WnAvcmcyNTZJNzZRSmJXYnhadmFwRVByQldnVzQzaVNy?=
 =?utf-8?B?OEZuN0hxWTZoSjF3bmdTUGNVekpCeVFpRkJ0c3ZacGVoeW9UK1dBOVcxemZH?=
 =?utf-8?B?ZldxaWY3cTFLY3pvSnNlUHpaUG5DcDg1bHZhVm9PSEUxTDB6Q3VsYTI4RjRk?=
 =?utf-8?B?WnduNDU5YUFCVEN5YmNJcWZ0alhBVkhwMWJXTUZ1SzRpa3BxODZYREQ2RUhL?=
 =?utf-8?Q?p2SKgDKJQUDTdX2OwB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbd3709-f3fd-4c29-214f-08da4585b28c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 17:22:55.4685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vu2R5y55nsZSMhw1CCVivYqNIpDMQuwvJig7HRmuhl2v1tRyVf43Yzghn4MYU3jhit4LegJ4qNAcJuUPjICtTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFy
ayBQZWFyc29uIDxtYXJrcGVhcnNvbkBsZW5vdm8uY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bmUg
MywgMjAyMiAxMjoyMQ0KPiBUbzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxs
b0BhbWQuY29tPg0KPiBDYzogaGRlZ29lZGVAcmVkaGF0LmNvbTsgbWFya2dyb3NzQGtlcm5lbC5v
cmc7IHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW0V4dGVybmFsXSBSRTogW1BBVENIIDMvNF0gcGxhdGZvcm0veDg2OiB0aGlua3BhZC1hY3Bp
OiBBZGQNCj4gc3VwcG9ydCBmb3IgaG90a2V5IDB4MTMxYQ0KPiANCj4gSGkgTWFyaW8NCj4gDQo+
IE9uIDYvMy8yMiAxMzoxNCwgTGltb25jaWVsbG8sIE1hcmlvIHdyb3RlOg0KPiA+IFtBTUQgT2Zm
aWNpYWwgVXNlIE9ubHkgLSBHZW5lcmFsXQ0KPiA+DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBNYXJrIFBlYXJzb24gPG1hcmtwZWFyc29uQGxl
bm92by5jb20+DQo+ID4+IFNlbnQ6IEZyaWRheSwgSnVuZSAzLCAyMDIyIDEyOjAyDQo+ID4+IFRv
OiBtYXJrcGVhcnNvbkBsZW5vdm8uY29tDQo+ID4+IENjOiBoZGVnb2VkZUByZWRoYXQuY29tOyBt
YXJrZ3Jvc3NAa2VybmVsLm9yZzsgcGxhdGZvcm0tZHJpdmVyLQ0KPiA+PiB4ODZAdmdlci5rZXJu
ZWwub3JnOyBMaW1vbmNpZWxsbywgTWFyaW8gPE1hcmlvLkxpbW9uY2llbGxvQGFtZC5jb20+DQo+
ID4+IFN1YmplY3Q6IFtQQVRDSCAzLzRdIHBsYXRmb3JtL3g4NjogdGhpbmtwYWQtYWNwaTogQWRk
IHN1cHBvcnQgZm9yIGhvdGtleQ0KPiA+PiAweDEzMWENCj4gPj4NCj4gPj4gT24gc29tZSBBTUQg
cGxhdGZvcm1zIGlmIHlvdSBwcmVzcyBGTitUIGl0IHdpbGwgdG9nZ2xlIHdoZXRoZXIgYXV0b21h
dGljDQo+ID4+IG1vZGUgdHJhbnNpdGlvbnMgYXJlIGFjdGl2ZS4NCj4gPj4NCj4gPj4gUmVjb2du
aXplIHRoaXMga2V5Y29kZSBhbmQgdXNlIGl0IHRvIHRvZ2dsZSBBTVQuDQo+ID4+DQo+ID4+IENv
LWRldmVsb3BlZC1ieTogTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5j
b20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE1hcmlvIExpbW9uY2llbGxvIDxtYXJpby5saW1vbmNp
ZWxsb0BhbWQuY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYXJrIFBlYXJzb24gPG1hcmtwZWFy
c29uQGxlbm92by5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhp
bmtwYWRfYWNwaS5jIHwgMTEgKysrKysrKysrKysNCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni90aGlua3BhZF9hY3BpLmMNCj4gPj4gYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni90aGlua3BhZF9h
Y3BpLmMNCj4gPj4gaW5kZXggMmRmMjkwY2VlMGExLi5mMTE4NjYyMjVlZjMgMTAwNjQ0DQo+ID4+
IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYw0KPiA+PiArKysgYi9k
cml2ZXJzL3BsYXRmb3JtL3g4Ni90aGlua3BhZF9hY3BpLmMNCj4gPj4gQEAgLTE1OSw2ICsxNTks
NyBAQCBlbnVtIHRwYWNwaV9oa2V5X2V2ZW50X3Qgew0KPiA+PiAgCVRQX0hLRVlfRVZfVk9MX0RP
V04JCT0gMHgxMDE2LCAvKiBWb2x1bWUgZG93biBvcg0KPiA+PiB1bm11dGUgKi8NCj4gPj4gIAlU
UF9IS0VZX0VWX1ZPTF9NVVRFCQk9IDB4MTAxNywgLyogTWl4ZXIgb3V0cHV0DQo+ID4+IG11dGUg
Ki8NCj4gPj4gIAlUUF9IS0VZX0VWX1BSSVZBQ1lHVUFSRF9UT0dHTEUJPSAweDEzMGYsIC8qIFRv
Z2dsZSBwcml2Lmd1YXJkDQo+ID4+IG9uL29mZiAqLw0KPiA+PiArCVRQX0hLRVlfRVZfQU1UX1RP
R0dMRQkJPSAweDEzMWEsIC8qIFRvZ2dsZSBBTVQNCj4gPj4gb24vb2ZmICovDQo+ID4+DQo+ID4+
ICAJLyogUmVhc29ucyBmb3Igd2FraW5nIHVwIGZyb20gUzMvUzQgKi8NCj4gPj4gIAlUUF9IS0VZ
X0VWX1dLVVBfUzNfVU5ET0NLCT0gMHgyMzA0LCAvKiB1bmRvY2sNCj4gPj4gcmVxdWVzdGVkLCBT
MyAqLw0KPiA+PiBAQCAtMzczNSw2ICszNzM2LDcgQEAgc3RhdGljIGJvb2wgaG90a2V5X25vdGlm
eV9leHRlbmRlZF9ob3RrZXkoY29uc3QNCj4gPj4gdTMyIGhrZXkpDQo+ID4+DQo+ID4+ICAJc3dp
dGNoIChoa2V5KSB7DQo+ID4+ICAJY2FzZSBUUF9IS0VZX0VWX1BSSVZBQ1lHVUFSRF9UT0dHTEU6
DQo+ID4+ICsJY2FzZSBUUF9IS0VZX0VWX0FNVF9UT0dHTEU6DQo+ID4+ICAJCXRwYWNwaV9kcml2
ZXJfZXZlbnQoaGtleSk7DQo+ID4+ICAJCXJldHVybiB0cnVlOw0KPiA+PiAgCX0NCj4gPj4gQEAg
LTExMDM4LDYgKzExMDQwLDE1IEBAIHN0YXRpYyB2b2lkIHRwYWNwaV9kcml2ZXJfZXZlbnQoY29u
c3QgdW5zaWduZWQNCj4gaW50DQo+ID4+IGhrZXlfZXZlbnQpDQo+ID4+ICAJCWlmIChjaGFuZ2Vk
KQ0KPiA+Pg0KPiA+PiAJZHJtX3ByaXZhY3lfc2NyZWVuX2NhbGxfbm90aWZpZXJfY2hhaW4obGNk
c2hhZG93X2Rldik7DQo+ID4+ICAJfQ0KPiA+PiArCWlmIChoa2V5X2V2ZW50ID09IFRQX0hLRVlf
RVZfQU1UX1RPR0dMRSkgew0KPiA+PiArCQkvKiBJZiB3ZSdyZSBlbmFibGluZyBBTVQgd2UgbmVl
ZCB0byBmb3JjZSBiYWxhbmNlZCBtb2RlICovDQo+ID4+ICsJCWlmICghZHl0Y19hbXRfYWN0aXZl
KQ0KPiA+PiArCQkJLyogVGhpcyB3aWxsIGFsc28gc2V0IEFNVCBtb2RlIGVuYWJsZWQgKi8NCj4g
Pj4gKwkJCWR5dGNfcHJvZmlsZV9zZXQoTlVMTCwNCj4gPj4gUExBVEZPUk1fUFJPRklMRV9CQUxB
TkNFRCk7DQo+ID4+ICsJCWVsc2UNCj4gPj4gKwkJCWR5dGNfY29udHJvbF9hbXQoIWR5dGNfYW10
X2FjdGl2ZSk7DQo+ID4NCj4gPiBJIG1pc3NlZCB0aGlzIHdoaWxlIHdlIHdlcmUgbWFraW5nIHRo
ZSBzZXJpZXMsIGJ1dCBhIGZyZXNoIHNldCBvZiBleWVzIHRlbGxzIG1lDQo+ID4gc2hvdWxkbid0
IGR5dGNfY29udHJvbF9hbXQoLi4pICBydW4gaW4gZWl0aGVyIGNhc2UgLSBub3QganVzdCBpbiB0
aGUgImVsc2UiIGNhc2U/DQo+ID4NCj4gPiAqIElmIEFNVCBpcyBub3QgYWN0aXZlIGFuZCB5b3Ug
cHJlc3MgdGhlIGtleSAodG8gYWN0aXZhdGUgaXQpIHlvdQ0KPiA+IHNob3VsZCBzd2l0Y2ggdG8g
YmFsYW5jZWQgbW9kZSAiYW5kIiB0dXJuIGl0IG9uLg0KPiA+ICogSWYgQU1UIGlzIGFjdGl2ZSBh
bmQgeW91IHByZXNzIHRoZSBrZXkgKHRvIGRlYWN0aXZhdGUgaXQpIHlvdSdyZSBhbHJlYWR5IGlu
DQo+ID4gYmFsYW5jZWQgbW9kZSwgc28geW91IHNob3VsZCBqdXN0IHR1cm4gaXQgb2ZmLg0KPiAN
Cj4gVGhlIGR5dGNfcHJvZmlsZV9zZXQgZm9yIGJhbGFuY2VkIG1vZGUgd2lsbCBhbHNvIGVuYWJs
ZSBBTVQgKGlmIGl0J3MNCj4gc3VwcG9ydGVkKSBzbyBJIGRpZG4ndCB3YW50IHRvIGNhbGwgaXQg
dHdpY2UuDQoNCkFoLCBnb3QgaXQgdGhhbmtzLg0K
