Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8B0C4363D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C9E5212CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="Dxxf3rfS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com header.b="JryCqCyO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbgJGVd3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 17:33:29 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:59134 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727948AbgJGVd2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 17:33:28 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097LVnHi008034;
        Wed, 7 Oct 2020 17:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=1fcM73SWZz5j3ICab2fFdePgz45y+PUaflkLzzhmy3c=;
 b=Dxxf3rfS5GBUbz25zXSKEO/6C0bKMLnT/CLi1b54AXb3heB9arAxqb1MCdY2SOFyf/JU
 ob6ljKP56pOhY2b17SLAGeWCywXf+0FQG9jPZM6wH0CNMl1JfacJZxPs+VXpFLYzU2ym
 VK2qKd5nkCU/yRk+z6/AvnpeLZoUApSrwEdFdAXZdAYz8IpBUiZBn7eCHXEWLuU6w0KB
 UvT3Cnwf18f8g0yQnyTxbLUqWFl3qQVJ4Mo0VLiVKfu7kZDZNKkremYG6q8aTGM68m1C
 WAwCuflgXBGLEqMARzpRnflQECQACO4oBBF9jMM022pRmwCQycxviC/LTPyKTpcZj9Cb Sw== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 33xmmjf4gx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Oct 2020 17:33:24 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097LDfdv152377;
        Wed, 7 Oct 2020 17:33:23 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        by mx0b-00154901.pphosted.com with ESMTP id 340rw1gecg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Oct 2020 17:33:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VU7rW/rJxddJ1TzucOni/3URlTi9pGTKkxaGUFcNDI3Oi+ZSmY7hE46GUiOfWthlge9vCEqt1kX8sDKTzRloJ1dfZKss6tzu096/ZJCZtrtVSeLfKvwb53UetpX13REXYLXBNEsjMt5gvR9k618QwRHld21MWRHW72sQnXlAMBvjt2OCsdXnDkYVBJh09jwxPnQdI70LfRNu2tFEV4HQr2k/JTp0CZZJH04QW9iCteg6X+rOlxfkiajPXXotzE6ZWqXsevkc3ErH+L7E3iqnl8tzGwcxo/jUoxCR+hGKfPP3P0uYz5d/DD2yus5J294q9fxAUbUixAj5NclHYim6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fcM73SWZz5j3ICab2fFdePgz45y+PUaflkLzzhmy3c=;
 b=Sld5jkhrQaOk0PSflhajDDJQbP65E2b3WNTDrtrBWLHzFRzcdfO1xmtjiQ+ixOmtmGSF14qJ+EOEnP8DWm+QfSxokY+RuD1uUhAYkZ5BtinmlK3HnHMZS/tfaIhxmwlYP4iu0zzOqTVu8p6IhJIb6vjocNXbxfPrD8N6SKrcCgEj4ZngGYCfJZcBD+4T4W66AED1PpAMGUSKu/cAxAfGZ5Gljh0OfNRpjbmKV2ku3NNUHput6LRhTT3PwZz9YwSK5OxIZ2otJT0o1Qn6AKZIIfQ2QOHv3sYAozFhudi4Yr9+4kWYkRN4wRjiU3i6Kvgi3YQqiKIRZQyC3bv7bUUxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fcM73SWZz5j3ICab2fFdePgz45y+PUaflkLzzhmy3c=;
 b=JryCqCyOl0YmCn5VfPHkUlMmtsnL5Puwm53vjHaQxVYviJuZPDllmh2S2q1RmpdyJN2QFJsAXdNdrug9efZ4r+LwS2u9u6E81D8JqQnL24RuR13EnXahlVZ5Bs66/QH33haZDwyPo+1+kayW7rGRAfoGb4i9Q9Q7YqFktju8Buk=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB4360.namprd19.prod.outlook.com (2603:10b6:5:2bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 7 Oct
 2020 21:33:20 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a4b8:d5c9:29da:39b2]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a4b8:d5c9:29da:39b2%4]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 21:33:20 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>,
        =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
Thread-Topic: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
Thread-Index: AQHWm5Adbrc3IEfEcEirIr+D8EkaAamMMxYAgAADYYCAABYJwIAAQ94AgAAAgvCAAAuigIAADJpggAACCICAAAA2gA==
Date:   Wed, 7 Oct 2020 21:33:20 +0000
Message-ID: <DM6PR19MB2636CB1941BF5D940369289AFA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
 <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
 <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <45e82b6dabb591de630ac0e91a3ebb7937245fb1.camel@malazdrewicz.com.ar>
 <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
 <DM6PR19MB2636C37CC24CC23D31E36F01FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <a655cb84-97ec-5558-8576-452b6ff0e34a@redhat.com>
In-Reply-To: <a655cb84-97ec-5558-8576-452b6ff0e34a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-10-07T21:33:16.3711297Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=45dec736-5a79-4e47-8889-638ca9667e00;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1a44a4d-7e7f-4db5-7fa5-08d86b089cb3
x-ms-traffictypediagnostic: DM6PR19MB4360:
x-microsoft-antispam-prvs: <DM6PR19MB436074C29F330D68378B88E5FA0A0@DM6PR19MB4360.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q0BwP2P96Q8kuc8bUjlQvFPFDZRrPeOB+OEXairidI5IbF/jSlRr977pYdjfHqDJnBKWgaBsfjoR5S6ViIrbO7Y1QZCTK1OMMwOy5tKbJhMnh6EP7ehLjBBrymGBBYnRzkdK9QPKQ8saUaGP7SQ88dM/PUAUu5sHCKb16STfn6zOEkJoZuhX9tkRzxgsHPLQXf13NkZj6zKJsYFoJnb3asdecP4EW6JbWJIqqV5DjUPZILAJ/kYf6LBWLEWR9jqWgzFd+g0C6nsmqceMnxREX+JzxY1VjpYJeKTZ55CpZu1yX9uoqzCgVcLeZuqtuSM7je3/FIiuKEoVmfUB1uVvRy7WpTF3uDUyMs0CP6jl11SuZANIm8yHD0v0qAPl1ycPyH2Tji4Tym8b0nW2GFDmsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(136003)(396003)(376002)(366004)(66946007)(83080400001)(5660300002)(66574015)(33656002)(8936002)(9686003)(4326008)(55016002)(8676002)(2906002)(478600001)(26005)(86362001)(110136005)(786003)(316002)(83380400001)(53546011)(71200400001)(966005)(66556008)(76116006)(64756008)(52536014)(66446008)(66476007)(186003)(7696005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: QtdO8mo2rLEPUUXJ1PWpa3ABAxpeOgqDwtYDnQJCLBC9JCRbvJ9K8IvxaqBkywDzP+5SHya5ArnV0oUCsuE0LSoi0LSeCiJubHcgdsaWK6dViCc3+WBcY6WS7sgmrzDt88J7qSrf1u+e+pqtZHoCHMUpeNY46vGNZYzj798duyHwhajZRyHZd4WKQcJGsbjy25H7LIU51s1CJql0fa1fWtmEtt7aB8rpn/RO8Hy+nQy53IEkfgwEtcoESDiVT6vqiqccMMyGkI8Zl8WSF+6z4WmSL5AbGEuCzjaFYk5WrfxC1ZmqNZXJUSzw98HxbWFjSmMPz+oJOSPiWDKfWMMk4e9ohUa/a11GmJdcFMZz39kfgXDe4vtYiVOEsfxjVLVRDnJZssdXGgjFaRNGPA/3ZMvNRLWwT0DgXgxgk8SrX5RVDR2T82AligVilinZqzfU/icvTctV6yaFPD2ms+pMlHeF6DyxxYQ5YPNotPQp90NpvGKLJ1AjG1XoYAr47msCLS2J2oBVXjTIguJqCyDF+EXxoqjyhzF0+8cyk2NjonASpSkcB370AMwVrglX5NVPSdZvjfg88qvAtNz3WZFgfIjdtHGT5ckGRkrHPUpOl/MKoq54myv9COBRENHq6pgT/J12EMjMxhXY1gBlr8+zDg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a44a4d-7e7f-4db5-7fa5-08d86b089cb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 21:33:20.4505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9tjiolL3NXVb0saDfRfKxTeLM9TTPq3QUwuhiRKB8kO4v6WuljTQpWr8aPD6UbU5W+K8Hp9jLvyrpobOQL+87LLpPMHFD9AP00USGNzfBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4360
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-07_10:2020-10-07,2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=950 spamscore=0
 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070137
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070138
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiBPbiAxMC83LzIwIDExOjI2IFBNLCBMaW1vbmNpZWxsbywgTWFyaW8gd3JvdGU6DQo+ID4+IE9u
IDEwLzcvMjAgOTo1OCBQTSwgTGltb25jaWVsbG8sIE1hcmlvIHdyb3RlOg0KPiA+Pj4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogR2VyYXJkbyBFc3RlYmFuIE1hbGF6
ZHJld2ljeiA8Z2VyYXJkb0BtYWxhemRyZXdpY3ouY29tLmFyPg0KPiA+Pj4+IFNlbnQ6IFdlZG5l
c2RheSwgT2N0b2JlciA3LCAyMDIwIDE0OjU1DQo+ID4+Pj4gVG86IExpbW9uY2llbGxvLCBNYXJp
bzsgUGFsaSBSb2jDoXI7IEhhbnMgZGUgR29lZGUNCj4gPj4+PiBTdWJqZWN0OiBSZTogWyBQQVRD
SCB2MiAxLzFdIGRlbGwgc21iaW9zIGRyaXZlciA6IENvbnNpZGVyIEFsaWVud2FyZSBhDQo+ID4+
IHZhbGlkDQo+ID4+Pj4gT0VNIFN0cmluZw0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBbRVhURVJO
QUwgRU1BSUxdDQo+ID4+Pj4NCj4gPj4+PiBFbCBtacOpLCAwNy0xMC0yMDIwIGEgbGFzIDE1OjUz
ICswMDAwLCBMaW1vbmNpZWxsbywgTWFyaW8gZXNjcmliacOzOg0KPiA+Pj4+Pj4gSGFucywgdGhl
cmUgYXJlIG1vcmUgZHJpdmVycyB3aGljaCBjaGVja3MgZm9yIERlbGwgRE1JIHN0cmluZ3MuDQo+
ID4+Pj4+PiBQcm9iYWJseQ0KPiA+Pj4+Pj4gaXQgd291bGQgYmUgbmVlZGVkIHRvIHVwZGF0ZSBB
bGllbndhcmUgb24gbW9yZSBwbGFjZXMsIG5vdCBvbmx5IGluDQo+ID4+Pj4+PiBkZWxsLXNtYmlv
cy1iYXNlLmMgZHJpdmVyLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJIHdvdWxkIHByZWZlciB0aGF0IGVh
Y2ggb2YgdGhvc2UgYmUgY2hlY2tlZCBvbiBhIGNhc2UgYnkgY2FzZSBiYXNpcw0KPiA+Pj4+PiBh
bmQgb25seQ0KPiA+Pj4+PiBhZGRlZCBpZiBhY3R1YWxseSBuZWNlc3NhcnkuICBHZXJhcmRvIGlm
IHlvdSBjYW4gcGxlYXNlIGNoZWNrIGFueQ0KPiA+Pj4+PiBvdGhlciBkcml2ZXJzDQo+ID4+Pj4+
IHRoYXQgc2hvdWxkIG5lZWQgdGhpcyBzdHJpbmcgYWRkZWQgdG8gdGhlaXIgYWxsb3cgbGlzdC4N
Cj4gPj4+Pg0KPiA+Pj4+IEkgZGlkbid0IGZpbmQgb3RoZXIgaW5zdGFuY2VzIG9mIHRoYXQgc3Ry
aW5nIGluIHRoaXMgc3Vic3lzdGVtLCBidXQgc2VlDQo+ID4+Pj4gYmVsb3cuDQo+ID4+Pj4NCj4g
Pj4+PiBUaGVyZSBpcyBvbmUgaW4gcGNpLCBhbm90aGVyIGluIGhvdHBsdWcuDQo+ID4+Pj4NCj4g
Pj4+PiBIb3dldmVyLCB0aGlzIGlzIGFuIGV4dHJhY3QgZnJvbSBrZXJuZWwgbG9nczoNCj4gPj4+
Pg0KPiA+Pj4+IFsgIDEzOC4wOTM2ODZdIGRlbGwtc21iaW9zIEE4MDU5M0NFLUE5OTctMTFEQS1C
MDEyLUI2MjJBMUVGNTQ5MjogV01JDQo+ID4+Pj4gU01CSU9TIHVzZXJzcGFjZSBpbnRlcmZhY2Ug
bm90IHN1cHBvcnRlZCgwKSwgdHJ5IHVwZ3JhZGluZyB0byBhIG5ld2VyDQo+ID4+Pj4gQklPUw0K
PiA+Pj4NCj4gPj4+IENvbnNpZGVyaW5nIHRoYXQgbWVzc2FnaW5nIC0gZG9lcyB0aGUgbm9uLVdN
SSBpbnRlcmZhY2UgYWN0dWFsbHkgd29yaz8NCj4gPj4+IGRlbGwtc21iaW9zIGhhcyB0d28gYmFj
a2VuZHMgYXZhaWxhYmxlLg0KPiA+Pg0KPiA+PiBZZXMgdGhhdCBpcyBhIHZlcnkgZ29vZCBxdWVz
dGlvbi4NCj4gPj4NCj4gPj4gR2VyYXJkbywgSSBndWVzcyB5b3Ugc3RhcnRlZCBsb29raW5nIGlu
dG8gdGhpcyBiZWNhdXNlIG9mIHRoZToNCj4gPj4NCj4gPj4gCXByX2VycigiVW5hYmxlIHRvIHJ1
biBvbiBub24tRGVsbCBzeXN0ZW1cbiIpOw0KPiA+Pg0KPiA+PiBJbiBkZWxsLXNtYmlvcy1iYXNl
LmMgdHJpZ2dlcmluZyBvbiB5b3VyIHN5c3RlbT8NCj4gPg0KPiA+IElmIHRoYXQncyB0aGUgY2Fz
ZSwgSSB3b3VsZCBhc2sgd2h5IHRoaXMgZHJpdmVyIGV2ZW4gYXV0by1sb2FkZWQ/DQo+ID4gVGhl
IG1vZHVsZSBsb2FkIHRhYmxlIGlzIHZlcnkgcHJlc2NyaXB0aXZlLg0KPiA+IGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9k
ZWxsLQ0KPiBzbWJpb3Mtd21pLmMjTDI3Nw0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsLQ0KPiBzbWJpb3Mt
c21tLmMjTDU2DQo+ID4gV2FzIGl0IGJlY2F1c2UgaXQgd2FzIGNvbXBpbGVkIGludG8gdGhlIGtl
cm5lbD8NCj4gDQo+IEkgYmVsaWV2ZSB0aGF0IHRoZSBsYXB0b3BzIEFDUEkgdGFibGVzIGRvIGRl
ZmluZSB0aGUgV01JIEdVSUQNCj4gdGhhdCBkZWxsLXNtYmlvcy13bWkuYyBoYXMgaW4gaXRzIG1v
ZHVsZS1pZC10YWJsZSBvdGhlcndpc2UNCj4gdGhlICJXTUkgU01CSU9TIHVzZXJzcGFjZSBpbnRl
cmZhY2Ugbm90IHN1cHBvcnRlZCgwKSIgZXJyb3INCj4gd291bGQgbm90IHRyaWdnZXIuDQo+IA0K
DQpUaGF0J3MgYSBnb29kIHBvaW50LCB5b3UncmUgcmlnaHQgdGhhbmtzLiAgSSBzaG91bGQgbm90
ZSAtIHRoYXQgaXMgYQ0Kd2FybmluZywgaXQncyB2YWxpZCBhbmQgaXQgb25seSB0dXJucyBvZmYg
dXNlcnNwYWNlIGFjY2Vzcy4gIElmIHRoZSBCSU9TIGRvZXNuJ3QNCmFkdmVydGlzZSB0aGF0IGhv
dGZpeCBtYW55IGNhbGxzIGNhbiBmYWlsLiAgU29tZSBvZiB0aGUgbW9yZSBzaW1wbGUNCmNhbGxz
IHVzZWQgYnkgdGhlIGtlcm5lbCBtb2R1bGVzIHN1Y2ggYXMgZGVsbC1sYXB0b3Agd291bGQgbm90
IGJlIHByb2hpYml0ZWQuDQo=
