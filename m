Return-Path: <SRS0=eRQc=DM=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3633C4363A
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Oct 2020 12:45:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66E752085B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Oct 2020 12:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="GHT5bqWO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com header.b="eXEc8Yhp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgJEMpy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Oct 2020 08:45:54 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:53542 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725891AbgJEMpx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Oct 2020 08:45:53 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 095CVS3Q016366;
        Mon, 5 Oct 2020 08:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=g8dr8y2Djpf3zolEUNT7/W+wAddjDmE6vfb0rhQ5Kmw=;
 b=GHT5bqWOY4a6qYNxjuCcq+EWy711CCpXFvMXxruWuHtD3D8g4NCOf18aapTlTZuoekbn
 3u8evv0GRyj64TzBkEQ0ezHaCiQNoiW0M1TIR5zo93CARZ6qU8IwNGg3qhrZxoSVfgSe
 iCQbai9VpQ6q8fj1B1/nKB3VWvQx+CS4indrHaGNOrBJig3BDsdTpFTjSV+lCJhp/FpD
 nHrTBifn00Mv6AYwEd4T3mVZYAkK18LlRCxjiY0/WKxOAEGqqBY8LddWBSvCKRdUefv+
 27+7aYeHEzlde0K0yW5ogLic2yGopWdsrBDlwi+zKF4PFrCFmiHcSNow/GW4ThsyivDM 9A== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 33xmmj4e59-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 05 Oct 2020 08:45:48 -0400
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 095CYNf0162149;
        Mon, 5 Oct 2020 08:45:48 -0400
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2055.outbound.protection.outlook.com [104.47.46.55])
        by mx0a-00154901.pphosted.com with ESMTP id 33y673xrpb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 05 Oct 2020 08:45:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKk3aW0KwgAu4akAZndNO6LvjNUKh34s5QUyIbPAsg64JbA4aSezvgKqS0IaxeVc0NI1gnpmFcqW7zXEfg75Uf2vpg8KjukypXnLnwD2KbrE55ZV40eQXhIXcpugKuWqP69oDde4SjDjJA6np6kvLLDdHjLlQRNOfIxh2T6Y+mar4aL7WZY+dZQ8IJbsBjnv7pc8Su1oZjNpB/HSkAyBnK0qmEJ3o58ET0eqNMWXNIAysRFr//S9G7YQDDNJPVppQ6+uGc6EPCnGOnQ067zb/BqFNiTCAE0ZbDTt4W/SKY22S+NXtVW1384otmVPfLH0aN5L8zQRrHEEU7OjF3bOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8dr8y2Djpf3zolEUNT7/W+wAddjDmE6vfb0rhQ5Kmw=;
 b=lBq5PfGX5dm8Z2B1huGCB9GIWG8q2vN5F9nf2NwCmOA3pXe5OZE2vfkPu5JAQ30YRodzhnpOYsPN9ns0hdhan4MOlIzTO/O11Z/Emtzaun89mK3DCm/D2Fh78wcuH+ngQmEim/u2trG7+Q9swYYFA6uECaUbFfcT3nQJDkC7sW2/j34FF0zsm9of2gUeiQjnrZlYBsAeK74ubTR47Ukh24C7Sp+RAk/cSQT73jp4IP7eYJ8wTaL1MP60YiRdojPEHUzoRRgKDNWWVz5w6BjSqiGrPMeFkO4/RfyGcrRSGx8tfHkNp8H2vES6IxknfbxLSDP283c5L1FOnrrS61e19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8dr8y2Djpf3zolEUNT7/W+wAddjDmE6vfb0rhQ5Kmw=;
 b=eXEc8YhpifH5nKcgp5+OIFtEt7sNJuhUnBH/+HdBDm1OKx0FxoVW0mgAesVtENrcX24170nXZ5xZIafWqx4/Izw6bipn9pIPxF+5vu8o7jX6U8Due+g6QH/4gyZZl/w9j6rccSWqJNMVBF9eVLspsU69SYjBYXzBPNJD+NYZaSY=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM5PR19MB1289.namprd19.prod.outlook.com (2603:10b6:3:bf::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34; Mon, 5 Oct 2020 12:45:45 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a4b8:d5c9:29da:39b2]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a4b8:d5c9:29da:39b2%4]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 12:45:45 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>,
        =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [ PATCH: 1/1] dell smbios driver : Consider Alienware a valid OEM
 String
Thread-Topic: [ PATCH: 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
Thread-Index: AQHWmYVCjze4whLxNUKPzADgYLmsJamI9uYQ
Date:   Mon, 5 Oct 2020 12:45:45 +0000
Message-ID: <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
 <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
In-Reply-To: <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-10-05T12:45:41.1556291Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=a823d6c7-f6e6-4551-9817-ad87a2d7cb7b;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13662eca-f3f0-48f8-e05e-08d8692c93fe
x-ms-traffictypediagnostic: DM5PR19MB1289:
x-microsoft-antispam-prvs: <DM5PR19MB12892F9D6572BC1FF2C42DB2FA0C0@DM5PR19MB1289.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +VECg/TOAGg33vkWCLaUDmNedsSelxMDG4sjce0WGit4/bHSEg5BQQTB9mwdsWICVUk9Z9wTWypmSSqJqb1anfkOLjfDkZbffHT9fhuRmVuySjDGXrKHmqOYesZgFYj/GMWKIjUV+oCRvfFQKR5HoCXJr3lQrXHO1WoE8AH7l7fFfZrBooSwuzwAQ+ltJ3jeO3Lxzf8avvaeKGwg2/pe8UYuJaXUsCp5q3SLn4f11oy030D8nKek1b/7CyKFzCSg68Zz0/GEo5M0L/JchPAr+o5UGxQDpoooBR7x7QAju1Ym2zrl71QimRZ6jnVJkBJU3NxN1uFB7bgu3MuW1Hc1MMqlW1j6lrgnjaoyaQiTKgEuoBdvgDBDlv0gMn3dS4ceEk6zUI2dcKIKUC1Csv/oNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(39860400002)(136003)(396003)(71200400001)(316002)(76116006)(8936002)(55016002)(9686003)(4326008)(110136005)(66574015)(478600001)(786003)(8676002)(86362001)(83380400001)(83080400001)(53546011)(7696005)(33656002)(26005)(2906002)(64756008)(66446008)(66556008)(66476007)(6506007)(186003)(52536014)(66946007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oFQN4NMOzubJ4meNryubW77uK9k2JuuMfesAs5Zi+dcomk+WUt/r4Str5frn8aGviNddmXNwD571Nhv2bIcTaqiElhEiPfWczMDW7xwFhhNnTDPtbxGzw3lFUdYN9esjbZyHilIf/CerMT/LJ539T5UQWceXXuAk8eqpkHWB2O6miHKjDwWOSUjC+wasy2ZJgA1UX8L476AieMrR8cMxzgWMksKHHlBAE1z/68Iem7M4rejPwWPG8KmGIwKEtKGm9uh1zuELdMta6c8gI3E7c7O1BmYTu2iGUv2ANSQb518pl0yfGabX77EhPXLBhwWlxbx4O9uTDg4C+g6tnZkHTCf/b3nJdlirVtqCb6o+iX57zWLycb24NnRD0wBxcSwJLaTn+hIqSLked0ppGURUdP6fImD3pw/jt9SYJzUcAvY6fqEY7JyvDfFTWppxQm2imRCyPBcnZkoKL0kN7tem/5x59nVK9F3dNkaCx93Ud84WfPCVie69Fwz13H9YnHCvqzeCJ/voaQNQkj+2kipOPVWkwZT1Xid9G4klDi0hE0/ThuC7g9n1qbwb0Xv9C1wQuptjz9hin32fsK7VdvEBHP7YJGAauS6p8w0TJSK8MobfLu9smBcgXMQVOKXypSZQ7b3yF/OnK9hF2JD1+65hAg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13662eca-f3f0-48f8-e05e-08d8692c93fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 12:45:45.4867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pmo392oY66XSjbLtrbh1Lmpv9JxYDIfjxyJQzrrWFF6i0Oe+SnU2gOjdyOoyQfk/Hrqfacx50Cf/gjITHPC66IRSfXboJUhHCx5SHgYmJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1289
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-05_07:2020-10-02,2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010050095
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010050095
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2VkZSA8
aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogU2F0dXJkYXksIE9jdG9iZXIgMywgMjAyMCA4
OjAxDQo+IFRvOiBHZXJhcmRvIEVzdGViYW4gTWFsYXpkcmV3aWN6OyBQYWxpIFJvaMOhcjsgTGlt
b25jaWVsbG8sIE1hcmlvDQo+IENjOiBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogWyBQQVRDSDogMS8xXSBkZWxsIHNtYmlvcyBkcml2ZXIgOiBDb25z
aWRlciBBbGllbndhcmUgYSB2YWxpZCBPRU0NCj4gU3RyaW5nDQo+IA0KPiANCj4gW0VYVEVSTkFM
IEVNQUlMXQ0KPiANCj4gSGksDQo+IA0KPiBPbiAxMC8zLzIwIDE6NTIgUE0sIEdlcmFyZG8gRXN0
ZWJhbiBNYWxhemRyZXdpY3ogd3JvdGU6DQo+ID4gIEZyb20gYmRhNmI2ZGIwZDc2MTg2ZmYzN2Zm
Y2U4YWM4MzYzNzk0NDdlZjJiYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gPiBGcm9tOiBH
ZXJhcmRvIE1hbGF6ZHJld2ljeiA8MzYyNDM5OTcrR2VyTWFsYXpAdXNlcnMubm9yZXBseS5naXRo
dWIuY29tPg0KPiA+IERhdGU6IFNhdCwgMyBPY3QgMjAyMCAwNzo0MzowMiAtMDMwMA0KPiA+IFN1
YmplY3Q6IFtQQVRDSF0gZGVsbC1zbWJpb3MtYmFzZTogQ29uc2lkZXIgQWxpZW53YXJlIGEgRGVs
bCBzeXN0ZW0NCj4gPg0KPiA+IEFsaWVud2FyZSBoYXMgYmVlbiBhIHN1YnNpZGlhcnkgb2YgRGVs
bCBzaW5jZSAyMDA2Lg0KPiA+DQo+ID4gMjAyMCBBbGllbndhcmUgbGFwdG9wOg0KPiA+ICQgc3Vk
byBkbWlkZWNvZGUgfCBoZWFkIC0zDQo+ID4gIyBkbWlkZWNvZGUgMy4yDQo+ID4gR2V0dGluZyBT
TUJJT1MgZGF0YSBmcm9tIHN5c2ZzLg0KPiA+IFNNQklPUyAzLjIuMCBwcmVzZW50Lg0KPiA+ICQg
c3VkbyBkbWlkZWNvZGUgfCBncmVwIC1BIDI5ICJPRU0gU3RyaW5ncyINCj4gPiBPRU0gU3RyaW5n
cw0KPiA+IAlTdHJpbmcgMTogQWxpZW53YXJlDQo+ID4gCVN0cmluZyAyOiAxWzA5OUJdDQo+ID4g
CVN0cmluZyAzOiAzWzEuMF0NCj4gPiAJU3RyaW5nIDQ6IDRbMDAwMV0NCj4gPiAJU3RyaW5nIDU6
IDVbMDAwMF0NCj4gPiAJU3RyaW5nIDY6IDZbRDAsIEQ0LCBEOCwgREEsIERFXQ0KPiA+IAlTdHJp
bmcgNzogN1tdDQo+ID4gCVN0cmluZyA4OiA4W10NCj4gPiAJU3RyaW5nIDk6IDlbXQ0KPiA+IAlT
dHJpbmcgMTA6IDEwWzEuMy4wXQ0KPiA+IAlTdHJpbmcgMTE6IDExW10NCj4gPiAJU3RyaW5nIDEy
OiAxMltdDQo+ID4gCVN0cmluZyAxMzogMTNbUDM4RTAwMl0NCj4gPiAJU3RyaW5nIDE0OiAxNFsw
XQ0KPiA+IAlTdHJpbmcgMTU6IDE1WzBdDQo+ID4gCVN0cmluZyAxNjogMTZbMF0NCj4gPiAJU3Ry
aW5nIDE3OiAxN1swMDAwMDAwMDAwMDAwMDAwXQ0KPiA+IAlTdHJpbmcgMTg6IDE4WzBdDQo+ID4g
CVN0cmluZyAxOTogMTlbMV0NCj4gPiAJU3RyaW5nIDIwOiAyMFtdDQo+ID4gCVN0cmluZyAyMTog
MjFbXQ0KPiA+IAlTdHJpbmcgMjI6IDxCQUQgSU5ERVg+DQo+ID4gCVN0cmluZyAyMzogPEJBRCBJ
TkRFWD4NCj4gPiAJU3RyaW5nIDI0OiA8QkFEIElOREVYPg0KPiA+IAlTdHJpbmcgMjU6IDxCQUQg
SU5ERVg+DQo+ID4gCVN0cmluZyAyNjogPEJBRCBJTkRFWD4NCj4gPiAJU3RyaW5nIDI3OiA8QkFE
IElOREVYPg0KPiA+IAlTdHJpbmcgMjg6IDxCQUQgSU5ERVg+DQo+ID4NCj4gPiAyMDEzIEFsaWVu
d2FyZSBsYXB0b3A6DQo+ID4gT0VNIFN0cmluZ3MNCj4gPiAgICAgICAgICBTdHJpbmcgMTogRGVs
bCBTeXN0ZW0NCj4gPiAgICAgICAgICBTdHJpbmcgMjogMVswNUFBXQ0KPiA+ICAgICAgICAgIFN0
cmluZyAzOiAxNFsyXQ0KPiA+ICAgICAgICAgIFN0cmluZyA0OiAxNVswXQ0KPiA+ICAgICAgICAg
IFN0cmluZyA1OiBTdHJpbmc1IGZvciBPcmlnaW5hbCBFcXVpcG1lbnQgTWFudWZhY3R1cmVyDQo+
ID4NCj4gPiBEb24ndCBrbm93IHdoZW4gdGhlIE9FTSBTdHJpbmcgY2hhbmdlZC4NCj4gPiBDaGFu
Z2UgdGVzdGVkIGluIHRoZSAyMDIwIGxhcHRvcCwgbG9hZHMgZGVsbF9zbWJpb3Mgd2l0aG91dCBm
dXJ0aGVyDQo+ID4gaXNzdWVzLg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+ICAgICAgICAgIEdlcmFy
ZG8NCj4gDQo+IFRoZSAiVGhhbmtzLCBHZXJhZG8iIGJpdCBpcyBhIGJpdCB3ZWlyZCBmb3IgaW4g
YSBjb21taXQgbWVzc2FnZSwNCj4gb3RoZXJ3aXNlIHRoaXMgbG9va3MgZ29vZCB0byBtZSAocGxl
YXNlIHdhaXQgZm9yIGZ1cnRoZXIgZmVlZGJhY2sNCj4gYmVmb3JlIHNlbmRpbmcgYSB2MiB0aG91
Z2gpLg0KPiANCj4gTWFyaW8sIHdoYXQgaXMgeW91ciB0YWtlIG9uIHRoaXMsIGRvIHlvdSB0aGlu
ayB0aGlzIGNoYW5nZSBpcyBvaywNCj4gb3IgbWlnaHQgdGhpcyBjYXVzZSBzb21lIGlzc3VlcyA/
DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogR2VyYXJkbyBFLiBNYWxhemRyZXdpY3ogPGdlcmFyZG9AbWFs
YXpkcmV3aWN6LmNvbS5hcj4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvcGxhdGZvcm0veDg2L2Rl
bGwtc21iaW9zLWJhc2UuYyB8IDMgKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0
Zm9ybS94ODYvZGVsbC1zbWJpb3MtYmFzZS5jDQo+ID4gYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9k
ZWxsLXNtYmlvcy1iYXNlLmMNCj4gPiBpbmRleCAyZTJjZDU2NTkyNmFhLi41YWQ2ZjdjMTA1Y2Yz
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwtc21iaW9zLWJhc2Uu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwtc21iaW9zLWJhc2UuYw0KPiA+
IEBAIC01NjQsNyArNTY0LDggQEAgc3RhdGljIGludCBfX2luaXQgZGVsbF9zbWJpb3NfaW5pdCh2
b2lkKQ0KPiA+ICAgCWludCByZXQsIHdtaSwgc21tOw0KPiA+DQo+ID4gICAJaWYgKCFkbWlfZmlu
ZF9kZXZpY2UoRE1JX0RFVl9UWVBFX09FTV9TVFJJTkcsICJEZWxsIFN5c3RlbSIsDQo+ID4gTlVM
TCkgJiYNCj4gPiAtCSAgICAhZG1pX2ZpbmRfZGV2aWNlKERNSV9ERVZfVFlQRV9PRU1fU1RSSU5H
LCAid3d3LmRlbGwuY29tIiwNCj4gPiBOVUxMKSkgew0KPiA+ICsJICAgICFkbWlfZmluZF9kZXZp
Y2UoRE1JX0RFVl9UWVBFX09FTV9TVFJJTkcsICJ3d3cuZGVsbC5jb20iLA0KPiA+IE5VTEwpICYm
DQo+ID4gKwkgICAgIWRtaV9maW5kX2RldmljZShETUlfREVWX1RZUEVfT0VNX1NUUklORywgIkFs
aWVud2FyZSIsDQo+ID4gTlVMTCkpIHsNCj4gPiAgIAkJcHJfZXJyKCJVbmFibGUgdG8gcnVuIG9u
IG5vbi1EZWxsIHN5c3RlbVxuIik7DQo+ID4gICAJCXJldHVybiAtRU5PREVWOw0KPiA+ICAgCX0N
Cj4gPg0KPiA+DQoNClllcywgdGhpcyBzaG91bGQgYmUgZmluZS4gIFRoZXJlIGFyZSBvdGhlciBj
aGVja3MgdG8gbWFrZSBzdXJlIHRoZQ0KaW50ZXJmYWNlIGlzIHJlYWxseSB0aGVyZSwgYW5kIGFz
IHBvaW50ZWQgb3V0IEFsaWVud2FyZSBpcyBhIERlbGwgYnJhbmQuDQoNClNpbmNlIHRoaXMgaXMg
cHJldHR5IHN0cmFpZ2h0Zm9yd2FyZCBJIHdvdWxkIHRoaW5rIEhhbnMgY2FuIGp1c3QgZml4dXAN
CnRoZSBjb21taXQgbWVzc2FnZSB0byBkcm9wIHRoZSAiVGhhbmtzIi4gIE90aGVyd2lzZSBmZWVs
IGZyZWUgdG8gYWRkDQpmb3IgdGhlIGNvbnRlbnQgdG8gdGhpcyBmb3IgdjI6DQpSZXZpZXdlZC1i
eTogTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGRlbGwuY29tPg0K
