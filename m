Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46649C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 15:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEF2D23358
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 15:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgLGPxd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 10:53:33 -0500
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:53622 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726167AbgLGPxd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 10:53:33 -0500
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B7FqBEp002687;
        Mon, 7 Dec 2020 10:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=vjwksTTwQHztQ8mWSu8SF72+HdvKATG6JXt+iCWnCTA=;
 b=cHx2tKXhHsW5n4GEsiK7s3EZT7qD4mC33lLCzGzL35u+cXAzo4rvXV9g/6PfaCQaKMOX
 X4rZv1S8DSNrLX3B9Z0/1tO6EGpzCFH6L1vIawqwfDoI7JFaR7lbHwkYDHrEsN7XUr25
 MBaPSxY+kYT8SnUI8W4tW1F/yNsjcR3JzdAGU3SI42tV42birsX7Oh+v2ffAM6sx5Dmt
 lgb/cbfGwPYaVQFBe3Ijum+SkGoYMDWdRvQ/ApUZ494n7cqOt0LMWlfVIVSzgFLEPFxp
 pPLA5C7ixWN8tql6N5pTFVTkp5PLgRt7XWDhzU3QBA7RM0RDHtLW8xt/3xhmk2ORP9IB YQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 3587phx2q4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Dec 2020 10:52:32 -0500
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B7FpKWj047848;
        Mon, 7 Dec 2020 10:52:31 -0500
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by mx0a-00154901.pphosted.com with ESMTP id 359n4mauuv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Dec 2020 10:52:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5JbMif0tbiVJeQEWKeXo9kkVFagToqaksQmc7gK84Jk4RsNY7xsH2X+mNxSzV/8GUTmarI8PI599/pq0q8vVvAuMopE9Y09t+IAAA+Gh43m+oiSVIbjDPfRIsJ05Z5MoaZIZsuz/IgBF1Wrzsk0qF47z/5F/jxBNlW8bW4+jIoJhlMHtA4I81fHt+lH00+jw/fW147cpHRuh2x+QNRUjvmISufM8ZvRb6j7qPtI1mM1TNmCk771rELQvOroPYa3ll30PtfxSPxmtugtyWa1OLcSUAWZO2iFf0CPsoeSAVvpbDeU/m49UgH+vr4Ol94PyS9JtU2vfCw+L6qC+22UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjwksTTwQHztQ8mWSu8SF72+HdvKATG6JXt+iCWnCTA=;
 b=i7hqYfqVn6TTWDzCLjmWJFKM171l6GD2a5CoVQMrc2SmcM5XExHAcCeVIZMpZ/YYDO7BashL5TaozErmqeV+rRqzbX+DWX9YgVxlAz1eGiJV7GnsSA2ky/UfN0x87FhFp5EZThfUJ1bRN816mODx5PqJJL0/cyOPSg8vP5Sk9vYeF9lmnD1C3gShjJ49tqHZH/JnPKo+MqMjmzWbc73bt32EelXQiC3jSDAVUJfM2i9opPCQLVWf6GiFWr2jEAiPqOiw4KmMuVSAyvEaS/siMVQVv9DKCfhdQnbIeC0tTh2OVksOjjsiJCnyUPveMQNj3AygmkbGHoKVXbiqgB6/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjwksTTwQHztQ8mWSu8SF72+HdvKATG6JXt+iCWnCTA=;
 b=ElqSAKzpHjOWXDLGU9wFBGZShamyelUIvQ9cXs9IHHe6bjKTfJFDdcICPSva0OX4B2eFr9VSGCYVfhwqs6gksQj1kqdPFcfUG3AGLoHJiYuz5aRVc2knnbA3JhOxtSWClpNzRPrXdtvDvN9vw7DTnvuSJZFV45acp2btb30xMXM=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM5PR19MB1164.namprd19.prod.outlook.com (2603:10b6:3:b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 15:52:29 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::8a8:3eb2:917f:3914]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::8a8:3eb2:917f:3914%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 15:52:29 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: dell-driver: Backlight access slow
Thread-Topic: dell-driver: Backlight access slow
Thread-Index: AQHWzK76YtnoXiTUskO+G2KiWC1WYanrx9Lg
Date:   Mon, 7 Dec 2020 15:52:29 +0000
Message-ID: <DM6PR19MB2636442F926456BC92D2B7B4FACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <d2d1074d-a342-35ce-1e0d-5300b4803f33@molgen.mpg.de>
In-Reply-To: <d2d1074d-a342-35ce-1e0d-5300b4803f33@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-12-07T15:49:52.4597874Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=45083587-f252-4cbc-a941-07ad271f7af8;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18dbee7e-9ef5-46b2-e76e-08d89ac81a5f
x-ms-traffictypediagnostic: DM5PR19MB1164:
x-microsoft-antispam-prvs: <DM5PR19MB1164ECC7CEE4BAEE4D3F99C3FACE0@DM5PR19MB1164.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eoRIacghGskGGCiXZxM5w2zIRMpDsVkxfwDWA5yjA4niE6G1x+nMu4hMNuD6Zuy07oXi4SHlT5Cpyle9gIkp8ycEVT2NAPcf6+VYht1rXfOZ10uhXsXvP9TS7jjdjwVQej8GWtb2sa79KsEahMeD/eH7Tg8PbZTOqPSyCQnMUqME+N3waJDzZKoNv2leUhJ1y+Mq98ywNI5VIn5IlRqBEOH3bm7NWS1PQiRafysK2mpczn4fytpzAm1d9jAYtiImJyhYCLL9CzRrR3hjF+KGlcEdqY8DMBwjpJ9YGLNuH2Pn90qMxbMfKu+TpvhKJqxdKrop/q3eCfVZtNZ1JBMROw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(110136005)(33656002)(5660300002)(86362001)(6506007)(76116006)(55016002)(66446008)(64756008)(66556008)(186003)(26005)(9686003)(52536014)(66946007)(8936002)(786003)(4326008)(8676002)(66476007)(71200400001)(478600001)(2906002)(83380400001)(7696005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?K2VaaVhucXhEZUZGUmtXMUNLd09Ebi9BUW1TTTJCU3hDQ0tqSklHRlNrTFEy?=
 =?utf-8?B?VW00RjRkMmt4TWhLT0ZWeDJpUmV6bHp5S2ViV1pNWXVFSllwR2xmWGdDbkh5?=
 =?utf-8?B?bXM5dE54ZCtvMzVzS3l0dk93OFQ2amJqd2FIYkorMVhnVk5lUjFYQ1VYWXo2?=
 =?utf-8?B?VDZWNnk3ODB1bjBjMTBxd2JCZmFsbENwLzkrQktHaGVRVDFKTEdKa0s2OHhv?=
 =?utf-8?B?UkNxcWNDelRxMW9nUkpuQ1FHR0ZtMExpZkpYWmdsUFkyMit5cDQ3RE9la1N3?=
 =?utf-8?B?b1daM3dzTDZOejRCMXYzS0w4K1ZSZ1IrZFRvenhaR0xuUldqL3FHU1llclow?=
 =?utf-8?B?NVpMbnRBNXNyS0tXOVQvdzVDcWxKUEhGMmYyempDYm4rbkVncUZ1OHhyNC9F?=
 =?utf-8?B?OXQrQXBvQWJmYlgvVXk1bVR2eHp0bENPa05YcFRVVXRQMUNWSVJkODVlZ3BV?=
 =?utf-8?B?S1Z6WE5VTGtPNUgxODRnaWlQV2hsaDA1cHY5NVkwNEZKd1Fpemt2WU1vbncw?=
 =?utf-8?B?ZVpCbnhnMHBXWkdneUo0TVNNdHdLbC9Cdmp4aCtXYTI5cXZPbFRPMGFRTWNI?=
 =?utf-8?B?NTJlVFU0VnpYTHFIVEFlMURYQ0hKbFRndXMwU3NzYk5peUhMU25ZMUdIUXNk?=
 =?utf-8?B?M1hqRk40NjZRTVBRcklabGFpd1IyaGd6RG1LY2Q1WmRWOVp3aWc3emdQMHhL?=
 =?utf-8?B?K0hOWUZkQXQ4ZDZrNU1UeFAvUlhGaCtQU05tRW40M3dEbjV2ZDJSbG1HVk9I?=
 =?utf-8?B?MHY5ZzJLR2RCczdlWUlPZFEyRjhBNzRVNGJIMGx0Y2diT3pTdk44MCtRVmk0?=
 =?utf-8?B?Q0RzS1Z5YnF6RmN5WjljVXg0Q29iNk5ST3U3cUtrMHM0QjJYUUhSUkNYQURY?=
 =?utf-8?B?WlU4Z2Jvcm56dDU1NHh0eVJhakdTV3k3cVpOWVF3K09NMkd2cWpMcHdVMDNH?=
 =?utf-8?B?Q1lhZTlrRDRJQktQa2ZvMDZyL21wVmh2cFd5UHN2bzg0OTVEQmZLN2laTFVN?=
 =?utf-8?B?WVdkWmV1WElCWmNFWU43cHZILzRwOFFRMWhrQVM2enlSNnhYOEZzRlo4dXE5?=
 =?utf-8?B?Y0x3cVRFbFg5V1RST1BqYnRDYjdYWkcwdlU0ZTRDWFZ2TFZlRE5iYVMyM1pT?=
 =?utf-8?B?SzAxTFpzM3VLNlk0UDJGblBKdm5tSnltaTJpdDhVYjFrcXlGUXZCSjJ0UHJW?=
 =?utf-8?B?RHJxUldGOEJHUzJBVGpjMXUwalNhaTJNVzNsT1ZncTFqNVEvMC9NMDNkSHJV?=
 =?utf-8?B?VFh6R3RWNVdUU1RvODJ3S014MzVVTFdqU3NlUS9xMDIzZ1M1YklLQm9lRmM0?=
 =?utf-8?Q?GFbG2QkVm5lgQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dbee7e-9ef5-46b2-e76e-08d89ac81a5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 15:52:29.9044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duFzPhEWUD9m0+qHG0QCaiLiebsbz+8p03Hdj5eQqdEod7WY/KqtacRJOM3qdl7WVndR9AYVKUygC+2ogGYySptj6E9PvL4okO2R+u3QpHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1164
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-07_11:2020-12-04,2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=755 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=876 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070101
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiANCj4gT24gYSBEZWxsIFByZWNpc2lvbiAzNTQwLzBNMTRXNyB3aXRoIERlYmlhbiBzaWQvdW5z
dGFibGUgcmVzdG9yaW5nIHRoZQ0KPiBrZXlib2FyZCBiYWNrbGlnaHQgdGFrZXMgb3ZlciAxMDAg
bXMgYWNjb3JkaW5nIHRvIGBzeXN0ZW1kLWFuYWx5emUNCj4gY3JpdGljYWwtY2hhaW5gIFsxXS4N
Cj4gDQo+IGBgYA0KPiAkIHN5c3RlbWQtYW5hbHl6ZSBjcml0aWNhbC1jaGFpbg0KPiBb4oCmXQ0K
PiAgICAgICAgICAgICAg4pSU4pSAc3lzaW5pdC50YXJnZXQgQDg4N21zDQo+ICAgICAgICAgICAg
ICAgIOKUlOKUgHN5c3RlbWQtYmFja2xpZ2h0QGxlZHM6ZGVsbDo6a2JkX2JhY2tsaWdodC5zZXJ2
aWNlDQo+IEAxLjI5NXMgKzExNG1zDQo+ICAgICAgICAgICAgICAgICAg4pSU4pSAc3lzdGVtLXN5
c3RlbWRceDJkYmFja2xpZ2h0LnNsaWNlIEAxLjI5NHMNCj4gICAgICAgICAgICAgICAgICAgIOKU
lOKUgHN5c3RlbS5zbGljZSBAMjkxbXMNCj4gICAgICAgICAgICAgICAgICAgICAg4pSU4pSALS5z
bGljZSBAMjkxbXMNCj4gYGBgDQo+IA0KPiBJIGhhdmUgdG8gcnVuIHRoZSBwcm9ncmFtIFsyXSB1
bmRlciBzdHJhY2UgdG8ga25vdyBmb3Igc3VyZSwgdGhhdCB0aGUNCj4gZGVsYXkgaXMgY2F1c2Vk
IGJ5IGFjY2Vzc2luZyB0aGUgYmFja2xpZ2h0IGRldmljZS4gVW5mb3J0dW5hdGVseSwgdGhlDQo+
IGRldmljZSBpcyBhbHJlYWR5IGluIHVzZSBieSBzb21lYm9keSBlbHNlLCBzbyBkZWJ1Z2dpbmcg
aXMgbm90IGVhc3kuDQo+IE1heWJlIHlvdSBoYXZlIHNvbWUgaGludCwgaG93IHRvIGFwcHJvYWNo
IGFuYWx5c2lzIGZyb20gdGhlIExpbnV4IGtlcm5lbA0KPiBzaWRlLg0KPiANCj4gDQoNClRoZSB3
YXkgdGhlIGtleWJvYXJkIGJhY2tsaWdodCBjb250cm9sIHdvcmtzIGl0IGRvZXMgZ28gaW50byBk
ZWxsLWxhcHRvcCB3aGljaA0KaW52b2tlcyBhIFNNSSB0byBpbnRlcmFjdCB3aXRoIGEgQklPUyBk
ZWZpbmVkIFNNTSBpbnRlcmZhY2UuICBUaGlzIHVuZm9ydHVuYXRlbHkNCmlzIGdvaW5nIHRvIGJl
IHNsb3cgYW5kIGN1bWJlcnNvbWUuICBJIGRvbid0IGtub3cgYW55IHdheSB0byBpbXByb3ZlIGl0
LCBhbmQgSSB3b3VsZA0Kc3VnZ2VzdCB0aGF0IHN5c3RlbWQgc2hvdWxkIG5vdCBiZSBjaGFuZ2lu
ZyB0aGUgYmFja2xpZ2h0IGR1cmluZyB0aGUgYm9vdHVwLCB0aGUgZmlybXdhcmUNCndpbGwgYmUg
a2VlcGluZyB0aGUgbGFzdCB2YWx1ZSBjb25maWd1cmVkIGZvciB5b3UuDQo=
