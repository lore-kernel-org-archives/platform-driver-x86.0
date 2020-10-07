Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B67C4363C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01C5020872
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="Clfx5oNL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com header.b="lQYp+JX1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgJGV0u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 17:26:50 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:57720 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727798AbgJGV0u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 17:26:50 -0400
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097LDioL015880;
        Wed, 7 Oct 2020 17:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=jv4u922m2OiLLxnYFdEeu/prkHZo+GZBjPY0LFLG3S8=;
 b=Clfx5oNLneBzk3/2O8fTrxVQxk26wi/LEd0+CLB2uV/Yz7Iy02ouaSSvkj2a4pvKd2JV
 ldENPzX2QjheP7DeAC3c3JayxaIgls3N7kO7VqtbyJQCUnFADsxXGJVOTJ+A0e0tykZS
 xSVGtDv5z+w6LgV5sfkWECsbrY7uO3qruOgSopcw1qpEPO4i7/XaRjvNeYryqEeRL/xv
 hfFWHG9UCur/btVc5viZUB8VfN66+s+N7BqAkrIr48RII4UPDNJ3dVuu9ANNh3u31cvD
 o2lD0EFoVDeVSkkN4hcGIYIfEdeiTw/jXLKw7oBjBRxQnXV5g7YEoOSPC/8QmF7RsAZb Fw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 340phw70s6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Oct 2020 17:26:44 -0400
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097LCbLn184478;
        Wed, 7 Oct 2020 17:26:43 -0400
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        by mx0a-00154901.pphosted.com with ESMTP id 340uum4xhc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Oct 2020 17:26:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJoKeNrU3a8cLAZL64BmjAZX4RDF6y+lupt8UWKxpyguZyyO6oiuJ7DBBenx3OkGmFoETJgVJKpmje1osnAUzWdpf/wdkGICzvu1bQxzD1phKoNlrpJ+T6D8HiM97eibimZeu78NlOhVj7C7i9fduCPI+axr8X2PewLpIykyxTAPcdsEZRp/N6j+Uy5M/1ZuorCRQB1hDtgfCM3VYBNiZUJR/Yyv99q2WyvV4vWcPW3HgS78UTF86BSFNO75SnIx7EIces933ADkZCS7WIahy6MXLjujQt9LnxM+N3AuJ8li/viE6HJnE9/UcbBrkWhYLjJQ+7jAuJyvEk9K43A8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv4u922m2OiLLxnYFdEeu/prkHZo+GZBjPY0LFLG3S8=;
 b=FQkpUeglMf+yjtQXfEpIGgAkKBi6NZWl4bKVUhqWR6Al3roYHyrSRPRqnydik1ZBSfXu229jR7HXhHd1/m7juLBMwIpu91fHBxMiyw+BDliHP0jqeJV2DAPhvtb9k7Xoqx0m6LIrQ7uwAvlU+c1qdnULzbbbSe56Oo9k7QBIbc95UXFADwlp4abztlYCw7qmAFoCVQzNhJa4jyUJC1Y7EWtSB+zp3YCOFjG6IeXoiUYDhOhJhg9yAK8wqDrV7SaXhHVa2RVuE/wCQpDyLJSppnvEGHS92Yg+/ghxzfBl/NfM3xTcyJa9yKgo057PsdketNrN7OoX+81sy/HGCKTFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv4u922m2OiLLxnYFdEeu/prkHZo+GZBjPY0LFLG3S8=;
 b=lQYp+JX1T76kyGLhIKCqHr2wPXe0PXng+wOhPGsRvLLu0H2Z1n9/N/eic6nBcdA9ksNXSK1GlBBw3LHqaEqN0MH+XyW9tvaFTYm0uMpu11LvjVh99WrDMrFfPEn8iMUxCdZeh/tX1otUImxXg30WKynV5XGEiJ3tDhg7kF0cP0c=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DS7PR19MB4566.namprd19.prod.outlook.com (2603:10b6:5:2d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 21:26:42 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a4b8:d5c9:29da:39b2]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a4b8:d5c9:29da:39b2%4]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 21:26:42 +0000
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
Thread-Index: AQHWm5Adbrc3IEfEcEirIr+D8EkaAamMMxYAgAADYYCAABYJwIAAQ94AgAAAgvCAAAuigIAADJpg
Date:   Wed, 7 Oct 2020 21:26:42 +0000
Message-ID: <DM6PR19MB2636C37CC24CC23D31E36F01FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
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
In-Reply-To: <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-10-07T21:26:37.4464762Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=169b201d-a3f2-458e-865b-5d714cd8f02d;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ee06a44-dfa7-48e7-50ed-08d86b07af4f
x-ms-traffictypediagnostic: DS7PR19MB4566:
x-microsoft-antispam-prvs: <DS7PR19MB4566222E7DEFDC3A4E735F4BFA0A0@DS7PR19MB4566.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dWthKWwEvbMEuoOKuYV1f/NNec/JMl2PuT1jTd8Q0cVL7fMuqOFldeXNvWWYKuT8DGNNoDyJgMlJH/CUm6qku6hrAoJ6SzyOmvvK+xrQhupqseZXGcsnsbk3ihFXVV7cvQwN+gtgl7tTrSunMhJlcNATawWpqt1S46W2zhvDwsKCM5LHFXtBsunV1D7OTrWgEaOZn8Dj+wMz0BmLr28d2jfq3OQ94giQyoLHB7gkaGriFybmmM3eNITtwCljcwT/akgrTtfZndIMN6N0Xz/HzdUKkHWWMlYiOCKNRmgOm9I3wxAelSekd7QhB0/5g8NP8feCi8hijUIhQWUfth70uqPDMeS27lvR3wBCI6aXq8Tnm3GCgL9C24VKt625X0T3gg7cWuBPizkgJJMjZtcTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(366004)(346002)(39860400002)(66946007)(66556008)(66476007)(316002)(5660300002)(55016002)(110136005)(33656002)(86362001)(76116006)(66446008)(64756008)(9686003)(2906002)(66574015)(786003)(8676002)(71200400001)(186003)(52536014)(26005)(8936002)(4326008)(53546011)(478600001)(7696005)(6506007)(83380400001)(83080400001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 1iyzNd/OUHuq/DGd4z/5ICsHj+CXd3WglhReQtXVHVzEv5geyepDRa5c4MXhX+7Oy2OggubbCdT7BQczhO3Z/Rg4OlVKWWaC62Mub+Te4W53ASZ3F3uMW8KgoHc0KBmrAWavF4FJIhL4k5Yj+cB03HFKH7Wwy3/2LJQf5fOtRzaLQtZg+j9XbhMBrK5TJEE3c3giPi18Wjyv3HwNucpdhAf9VOTcpIQLPoH/IjVdYWlUS0RDbPYeGXuXxMxYxkFqNzVorpZ4cU7iHlRYeTUxJI1sbB70Pa92o/IY97G1n412Rgd1+E2I3v15KSnagmNtUWogwO2SQlx6pNBx+mafI87V/evfuj82lYc6XzYai3Y/m96s9bDkuCaa83KKG/lprhm4esUee5ruQ49EsTcvVSPKy9mz07dE4VRYCbyZ3YTqRdqYZQHZZzEsox/XMWEAzIJZhnL0kTkWImrFOT9aFrp283lrlic/B2aJp0myLEH8F+HawYMxr9h8rJT2Nh6AX9uR2mQYhLkv4LeOsnreATQDiCnSttOKLxngM34VmQY6KUNO55+zwyLgR9pd+Az/uXmh+g3BPn6YKiSQLgNlJwRm7+8Yfz2QiA46hOYkB9Jqj23TDz0hjY3psENt+T0sdI/g7MhXnQx1VAgItm6wqw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee06a44-dfa7-48e7-50ed-08d86b07af4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 21:26:42.1839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRH7LLxW0g3DpvKKvMBQmiifOAHsiZiQ0bMNWrcWdZv0i5lADPaIcRjVbb6VWG3j7ZJ0lm5+6TaAko4wpmMt0RJLCA6IMBrcVx6ELcK1Xjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4566
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-07_10:2020-10-07,2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010070137
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070137
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiBPbiAxMC83LzIwIDk6NTggUE0sIExpbW9uY2llbGxvLCBNYXJpbyB3cm90ZToNCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogR2VyYXJkbyBFc3RlYmFuIE1hbGF6
ZHJld2ljeiA8Z2VyYXJkb0BtYWxhemRyZXdpY3ouY29tLmFyPg0KPiA+PiBTZW50OiBXZWRuZXNk
YXksIE9jdG9iZXIgNywgMjAyMCAxNDo1NQ0KPiA+PiBUbzogTGltb25jaWVsbG8sIE1hcmlvOyBQ
YWxpIFJvaMOhcjsgSGFucyBkZSBHb2VkZQ0KPiA+PiBTdWJqZWN0OiBSZTogWyBQQVRDSCB2MiAx
LzFdIGRlbGwgc21iaW9zIGRyaXZlciA6IENvbnNpZGVyIEFsaWVud2FyZSBhDQo+IHZhbGlkDQo+
ID4+IE9FTSBTdHJpbmcNCj4gPj4NCj4gPj4NCj4gPj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiA+Pg0K
PiA+PiBFbCBtacOpLCAwNy0xMC0yMDIwIGEgbGFzIDE1OjUzICswMDAwLCBMaW1vbmNpZWxsbywg
TWFyaW8gZXNjcmliacOzOg0KPiA+Pj4+IEhhbnMsIHRoZXJlIGFyZSBtb3JlIGRyaXZlcnMgd2hp
Y2ggY2hlY2tzIGZvciBEZWxsIERNSSBzdHJpbmdzLg0KPiA+Pj4+IFByb2JhYmx5DQo+ID4+Pj4g
aXQgd291bGQgYmUgbmVlZGVkIHRvIHVwZGF0ZSBBbGllbndhcmUgb24gbW9yZSBwbGFjZXMsIG5v
dCBvbmx5IGluDQo+ID4+Pj4gZGVsbC1zbWJpb3MtYmFzZS5jIGRyaXZlci4NCj4gPj4+DQo+ID4+
PiBJIHdvdWxkIHByZWZlciB0aGF0IGVhY2ggb2YgdGhvc2UgYmUgY2hlY2tlZCBvbiBhIGNhc2Ug
YnkgY2FzZSBiYXNpcw0KPiA+Pj4gYW5kIG9ubHkNCj4gPj4+IGFkZGVkIGlmIGFjdHVhbGx5IG5l
Y2Vzc2FyeS4gIEdlcmFyZG8gaWYgeW91IGNhbiBwbGVhc2UgY2hlY2sgYW55DQo+ID4+PiBvdGhl
ciBkcml2ZXJzDQo+ID4+PiB0aGF0IHNob3VsZCBuZWVkIHRoaXMgc3RyaW5nIGFkZGVkIHRvIHRo
ZWlyIGFsbG93IGxpc3QuDQo+ID4+DQo+ID4+IEkgZGlkbid0IGZpbmQgb3RoZXIgaW5zdGFuY2Vz
IG9mIHRoYXQgc3RyaW5nIGluIHRoaXMgc3Vic3lzdGVtLCBidXQgc2VlDQo+ID4+IGJlbG93Lg0K
PiA+Pg0KPiA+PiBUaGVyZSBpcyBvbmUgaW4gcGNpLCBhbm90aGVyIGluIGhvdHBsdWcuDQo+ID4+
DQo+ID4+IEhvd2V2ZXIsIHRoaXMgaXMgYW4gZXh0cmFjdCBmcm9tIGtlcm5lbCBsb2dzOg0KPiA+
Pg0KPiA+PiBbICAxMzguMDkzNjg2XSBkZWxsLXNtYmlvcyBBODA1OTNDRS1BOTk3LTExREEtQjAx
Mi1CNjIyQTFFRjU0OTI6IFdNSQ0KPiA+PiBTTUJJT1MgdXNlcnNwYWNlIGludGVyZmFjZSBub3Qg
c3VwcG9ydGVkKDApLCB0cnkgdXBncmFkaW5nIHRvIGEgbmV3ZXINCj4gPj4gQklPUw0KPiA+DQo+
ID4gQ29uc2lkZXJpbmcgdGhhdCBtZXNzYWdpbmcgLSBkb2VzIHRoZSBub24tV01JIGludGVyZmFj
ZSBhY3R1YWxseSB3b3JrPw0KPiA+IGRlbGwtc21iaW9zIGhhcyB0d28gYmFja2VuZHMgYXZhaWxh
YmxlLg0KPiANCj4gWWVzIHRoYXQgaXMgYSB2ZXJ5IGdvb2QgcXVlc3Rpb24uDQo+IA0KPiBHZXJh
cmRvLCBJIGd1ZXNzIHlvdSBzdGFydGVkIGxvb2tpbmcgaW50byB0aGlzIGJlY2F1c2Ugb2YgdGhl
Og0KPiANCj4gCXByX2VycigiVW5hYmxlIHRvIHJ1biBvbiBub24tRGVsbCBzeXN0ZW1cbiIpOw0K
PiANCj4gSW4gZGVsbC1zbWJpb3MtYmFzZS5jIHRyaWdnZXJpbmcgb24geW91ciBzeXN0ZW0/DQoN
CklmIHRoYXQncyB0aGUgY2FzZSwgSSB3b3VsZCBhc2sgd2h5IHRoaXMgZHJpdmVyIGV2ZW4gYXV0
by1sb2FkZWQ/DQpUaGUgbW9kdWxlIGxvYWQgdGFibGUgaXMgdmVyeSBwcmVzY3JpcHRpdmUuDQpo
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9wbGF0
Zm9ybS94ODYvZGVsbC1zbWJpb3Mtd21pLmMjTDI3Nw0KaHR0cHM6Ly9naXRodWIuY29tL3RvcnZh
bGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwtc21iaW9zLXNt
bS5jI0w1Ng0KV2FzIGl0IGJlY2F1c2UgaXQgd2FzIGNvbXBpbGVkIGludG8gdGhlIGtlcm5lbD8N
Cg0KPiANCj4gQXMgUGFsaSBtZW50aW9uZWQgaW4gYW5vdGhlciBtYWlsLCB5b3UgcHJvYmFibHkg
c2hvdWxkDQo+IGJlIGxvb2tpbmcgYXQgdGhlIGRlbGwtbGFwdG9wIGNvZGUsIHdoaWNoIGFsc28g
aGFzIGENCj4gaGFzIGEgRE1JIHN0cmluZyBjaGVjayBhbmQgd2hpY2ggdXNlcyB0aGUgZGVsbC1z
bWJpb3MgY29kZSwNCj4gYW5vdGhlciBjb25zdW1lciBvZiB0aGUgZGVsbC1zbWJpb3MgY29kZSBp
cyB0aGUgZGVsbC13bWkNCj4gZHJpdmVyLg0KPiANCj4gSWYgbmVpdGhlciBvZiB0aG9zZSBkcml2
ZXJzIGFkZCBhZGRpdGlvbmFsIGZ1bmN0aW9uYWxpdHkNCj4gKGUuZy4gZXh0cmEgaG90a2V5IGV2
ZW50cywgYmVpbmcgYWJsZSB0aGUgY29udHJvbCB0aGUga2JkDQo+IGJhY2tsaWdodCksIHRoZW4g
dGhlIHJpZ2h0IGZpeCBtaWdodCBiZSB0byBzaWxlbmNlIHRoZQ0KPiBlcnJvciB5b3Ugc2VlIGJl
aW5nIHRocm93biBieSBkZWxsLXNtYmlvcy1iYXNlLmMsIHJhdGhlcg0KPiB0aGVuIGFsbG93aW5n
IGl0IHRvIGxvYWQuDQoNCkkgaGF2ZSBubyBvcHBvc2l0aW9uIHRvIGRyb3BwaW5nIHRoYXQgcHJf
ZXJyIG9yIGF0IGxlYXN0IGRvd25ncmFkaW5nDQppdCB0byBwcl9kZWJ1Zy4NCg0KPiANCj4gRm9y
IG5vdyBJJ2xsIGRyb3AgeW91ciBwYXRjaCBmcm9tIG15IHJldmlldy1oYW5zIGJyYW5jaCwNCj4g
YXMgd2UgZmlyc3QgbmVlZCB0byBjbGVhciB0aGlzIHVwLg0KPiANCj4gPiBUaGUgU01JIGJhc2Vk
IGJhY2tlbmQgeW91IGNhbiBjaGVjayBieSB1c2luZyBkY2RiYXMuDQo+ID4NCj4gPiBJIGhhZCBw
cmVzdW1lZCBmcm9tIHlvdXIgcGF0Y2ggdGhhdCBpdCBhY3R1YWxseSB3b3JrZWQuDQo+ID4NCj4g
Pj4gWyAxMjc1Ljk4NzcxNl0gZGVsbF9zbW1faHdtb246IG5vdCBydW5uaW5nIG9uIGEgc3VwcG9y
dGVkIERlbGwgc3lzdGVtLg0KPiA+PiBbIDEyNzUuOTg3NzM0XSBkZWxsX3NtbV9od21vbjogdmVu
ZG9yPUFsaWVud2FyZSwgbW9kZWw9QWxpZW53YXJlIEFyZWEtDQo+ID4+IDUxbSBSMiwgdmVyc2lv
bj0xLjMuMA0KPiA+Pg0KPiA+Pg0KPiA+PiBkZWxsX3NtbV9od21vbiBpZ25vcmVfZG1pPTENCj4g
Pj4NCj4gPj4gL3N5cy9jbGFzcy9od21vbi9od21vblgvcHdtezEsM30gYWNjZXNzIGNvcnJlY3Rs
eSB0aGUgbGVmdCBhbmQgcmlnaHQNCj4gPj4gZmFuLCByZXNwZWN0aXZlbHkNCj4gDQo+IE9rLCBz
byB0aGF0IGxvb2tzIGdvb2QgYW5kIGZpeGluZyB0aGUgRE1JIGNoZWNrIHRoZXJlIHByb2JhYmx5
DQo+IG1ha2VzIHNlbnNlLiBOb3RlIHRoYXQgdGhpcyBjb2RlIGlzIGluZGVwZW5kZW50IGZyb20g
dGhlDQo+IGRlbGwtc21iaW9zIGNvZGUgZnJvbSBkcml2ZXJzL3BsYXRmb3JtL3g4NiBzbyB5b3Ug
Y2FuDQo+IGRvIGFub3RoZXIgcGF0Y2ggdG8gZml4IHRoZSBETUkgY2hlY2sgdGhlcmUgaW5kZXBl
bmRlbnQgb2YgdGhlDQo+IGRlbGwtc21iaW9zIGRpc2N1c3Npb24uDQo+IA0KPiBSZWdhcmRzLA0K
PiANCj4gSGFucw0KDQo=
