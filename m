Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B20BC04FF3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 May 2021 10:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 791D961028
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 May 2021 10:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbhEXKUt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 May 2021 06:20:49 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:30652 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232609AbhEXKUr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 May 2021 06:20:47 -0400
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14OAGsRF004385;
        Mon, 24 May 2021 06:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=hSKH8E57PC6zwuMkkJV1ydO9scTR6q2rD8L/QiYYkqs=;
 b=ukYzQ/SEkEDy1MPwANaN3dErS+0fIFwJxx7Oogq2JI1wXi4bJJlV9vsXdCBQOflPDrh9
 usN3qA4RF6J15Rc2PtYWO6x7CV9824bVuQawBnkXSKEAmiWB4vvcvgpD+8vTlaQmVtBy
 3Bdq9EI7qpYYeu0Sfnl39WtjSFw1DHNeHwNPKnnBaTKawVSaOz+9jjVWVYqv+63mWV5v
 yWLHjD4fUnc2yuniqASIMe/kn4viNV+Bgub2vP3hHSi5E8K2sehjW8Zs24+vsHL2toPM
 ft764iKGapQOSaJPix2nUN+0l2Axx0yD2BtL0T1VyCBt7d5RELlAVmFSygXnjmgkwAco cg== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 38pw40d21u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 May 2021 06:19:14 -0400
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14OA0fsp192228;
        Mon, 24 May 2021 06:19:14 -0400
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
        by mx0a-00154901.pphosted.com with ESMTP id 38qfm35u0x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 May 2021 06:19:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyh+sOC7PnK5b0yhX984nP2Y8D4KdjsEaUx7sDFYGUdKYyj/PqSVEDycNEbSMfRj0d5u9LHg79M6XWEi/jldlQ/phqUQdpsKKto/yaitassx4lcrdjOLd24Et7XFV3EtdNEAuVsVpKq60DGnY1bNtdZPFLK0ju1r8d8EKJadAvze8Q/7Pc6OBavqElJcjgFjDZW83U5LHsxTAXTE83qYxxbTmc9hJZ0nKfGtpaYFECBi4aQSFHxsKE7+W9DPdJ+k2uHIMEY5IIqqiNfUbTlqLgMw53G2lx0cixeeUsjRHp/4nIzxLvpqlzI8Q0g8JbvaUonulKTrL5gK6o2GrImdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSKH8E57PC6zwuMkkJV1ydO9scTR6q2rD8L/QiYYkqs=;
 b=QxF7tFeeswGhIbyGwUusULjP9psqv+eShtSnXgfNcgG2Qmo2rz5LaqPC3QavGxwSTfvOA0Fd+VH5d9OWVTeSrcXmHTlG2taxMwlATGHfnSKsgYQxcmLvx59e/A3P2wZs6JVOOJ1rxZHHqS692GtPPM/aofD6c0xESVPRZbNFtAD/CsthUU5qoZw2hrD9VZfhtNruc+lKpbztuxFrk7Kprmb7xN8nKZp/F8Mf5m0whjbg4fMz/MVoMN9sXCfco6ueSh9R3FGGWX4Ebl8Y0/jGd1zyzCkIv3WEFlg+rvlFOg+2/lhqA2/uKiRvjPoFkCdsGCFjsVk8+yeaT5+wATenMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from CO1PR19MB5078.namprd19.prod.outlook.com (2603:10b6:303:d4::15)
 by MW3PR19MB4300.namprd19.prod.outlook.com (2603:10b6:303:49::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 10:19:12 +0000
Received: from CO1PR19MB5078.namprd19.prod.outlook.com
 ([fe80::9d48:5ddf:f242:3c1a]) by CO1PR19MB5078.namprd19.prod.outlook.com
 ([fe80::9d48:5ddf:f242:3c1a%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:19:12 +0000
From:   "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>
CC:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Dell Client Kernel <Dell.Client.Kernel@dell.com>
Subject: RE: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
Thread-Topic: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
Thread-Index: AQHXRHa9Pxppr71i1EuWZEFuPvm3+6rrGZUAgAGV4QCAAPkoAIAAgfMAgAAQqICABEc5wA==
Date:   Mon, 24 May 2021 10:19:12 +0000
Message-ID: <CO1PR19MB5078C56213656707579025AD82269@CO1PR19MB5078.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
 <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
 <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
 <c8b706bb-5397-758e-8ab8-1d75b2920054@lenovo.com>
 <971080ef-a9c2-6de9-c6e1-895e7c5903f2@redhat.com>
In-Reply-To: <971080ef-a9c2-6de9-c6e1-895e7c5903f2@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Prasanth_Ksr@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-05-24T10:19:09.0991920Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=1d85d53e-c85e-4c5a-89be-918036b3175c;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [49.207.213.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f382333-986c-4b13-863e-08d91e9d6049
x-ms-traffictypediagnostic: MW3PR19MB4300:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR19MB4300CB1892C01577A15D335682269@MW3PR19MB4300.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0o51ieYmb9ROj1wbj0aPYar1IDBJ7eEnsX1YrK+nM//fDkzjAkb+i0AnMXdQpRXA0mAkUD55yiCXkWheNUyEb1k66d4qOku+GgKyi8Kt2ztmEPv1VYed0HjQk4MK8xzWk54H3nJtrz1iRxsVipE2eo/J4pWnSUhbzBBQ/gxxbpBHTSjxu7Pm5drlZT0az4iEGAS1n4svclTddFsxqPkpCem6s8Pgui3n8BLuvp4E/GSSmjOYY8Ztsg1syJ7Jv71Ezm58opUGeuwOPy8GbyPm0M12sjamdsjxtCX4Lr9appokPlO44nkZe/Sg+Ox4ixi7zgZX7ydRDMzjEHERcnI1fB2QXT4/CBz2e+81TunV+YKMY3I+4W/FV59cTTT7COrtW6ge1c6Ob2W6IvBsOahyZUwK4j2shoRGDZ+ono2dadDbng0BcvPxH5sJd1eqUzclrbzaEGL/M0ilkjTFXej8KobWoZXrxfNsWj6Lerjp467Ij/H85/pUl/bbFMdBQqZuGtEq24jwN97YSJrZ879utSVHpAsCyeQ/iKCzAToTNdCU/aobnGkSa8s0NCFL+NOCSGH9yYkkdZg2sR8ps2MEJ1daNVlfBP91x9j3EcormP8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR19MB5078.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(122000001)(55236004)(71200400001)(83380400001)(26005)(8676002)(53546011)(7696005)(38100700002)(33656002)(6506007)(186003)(52536014)(786003)(66446008)(76116006)(64756008)(66556008)(66946007)(54906003)(86362001)(110136005)(107886003)(5660300002)(4326008)(478600001)(66476007)(9686003)(316002)(8936002)(55016002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aTBnWUxrV1pLTFZJcG9wcVNJUlJicFJSOGdFVWp3KzVrVG84UVZiZWxvUXRD?=
 =?utf-8?B?dHJGM0djRG9NNFJtZzZrT0lQcjFBRHlrWlJ1MjVrOUtBYkx0Q3VJWW01VnNC?=
 =?utf-8?B?SXFhZ3ZaMWhveGRteWdWQVRRc3hLa0Y0NTlYRG8vbnhOZzI1bkpBbWVlMVl5?=
 =?utf-8?B?RmNkZHZRUWEvZ1pWNExVUThWV3dUeDkwZndIeGpTbUZGK29ZZmtNTWJTV0ZT?=
 =?utf-8?B?bWFzajJnRjVqK05OdHVWVWIyL3VmcEZaYkFPNzVRRFRsNEVMWDdQOFB1SnQx?=
 =?utf-8?B?WEFKTDJzUFVvWVEwdVo0OW05d1dEdEFQZVluUzFmMWFlc1FzMGZoMUJRRFMx?=
 =?utf-8?B?NmVtdFRucDBUbVNlWDU0N3l4d3p5b0M3R01pSFV6UWFHeGdMUFNsb1gxeTlD?=
 =?utf-8?B?NGdyMkhaSWlNWndCZTVERVNTVzhoYzBleXlEYkRGNnhQOTBxczlDZTNOWXdN?=
 =?utf-8?B?K1ZWZEgyc1V6WmlaR1dpSmQydVc5YkNrazk3Yk15b0hnOU00bEdUVSs5UWhI?=
 =?utf-8?B?bEE5OUZuaGlNbmo5bmFjLzB1Yndjbkozbmp3Nm8rcVB5TkZ2ZTh0TzhIUDYw?=
 =?utf-8?B?VTZzeXppRVQ3eFBRNU5relNXN3RpeDl1VzBoU2ZFVWlzUmlMQk9DTjg2ZkQx?=
 =?utf-8?B?QkpWYWpRaWpvNmgxbWJvOUtjc0dhN0ErbnRNUFh1dmxCbW5qNU9jcWdhdlVx?=
 =?utf-8?B?alNzeUUwSFAxNVA0K1M3ZmszOUR3NE1LZ0JucTRGaHh6eGlPNnRKdExoeHRT?=
 =?utf-8?B?TEVHaHo2U0J0enNrZk9LbzNGa2hXMWZZUENIYjlKYmNDc0NnTHQwVzU1VFdY?=
 =?utf-8?B?Q0cyZk5NNXFueXRvanREL3dER0ZzMnE3RE1mUFlWeC9FdjNBM0owbFRNVFZZ?=
 =?utf-8?B?Umt5ME9aTDBlUUNRdVE2clF0Uk8zb3QxTFZRUjJXZFZrRjNoS2NIVFI0dy9Y?=
 =?utf-8?B?c0J2dW5JcHEvWVY1K3M1MFB1eXcvQWhlTS9EdTNJZy94OVRONTBnMC9uTXAx?=
 =?utf-8?B?V2JpQlhUUkhYOWI4dVozSzlHbjFHUDVEWlNKUDB0d3JCOWphR000dGFNeUNP?=
 =?utf-8?B?TG1ab2Jsa0hqOXNQQkFnZU5jeUwvMU92cVptUVR4TDlEdzcwMXAwcVdINjYx?=
 =?utf-8?B?YTRRRE5ZQ2dGdWhUQVZsUllrUXBrLzd3K0lzWWxsMmJTeG1zSGYxOVg5QktQ?=
 =?utf-8?B?cVVWMHYwTkRjKzlleVJKQSsvaERUWENpN0g2bncrb0lyMDBzZE44SmptTjh2?=
 =?utf-8?B?NE8zalg3OFFuZkdYNDl2SlhQS05TcWRkdE9VWUQ1allRWERSVTB3MVpMMjhB?=
 =?utf-8?B?QkU0cGpkVXV6RWpqbUljQi83NnJPYm12bTcxdXVJZTBiUWxpc01weUFnSEJy?=
 =?utf-8?B?d3U2UFc5QXVLbnZtS0tjWkNlaFoyQWhVN2J2V1E3YVRyMkhxSjc3MlBNRG9w?=
 =?utf-8?B?VFJVYmltQXFqcUVxeGV3c1NXWktLajZneVFsbitTaDltV0I1clpCRmREVnVL?=
 =?utf-8?B?VXJXRmhTMXFyRUkxMk9SN1NseUtVTGRzUUZXOFJxcWdNVXNhR3BsNExsRmh1?=
 =?utf-8?B?bGptVWR0bnhJVmVTVGIvVnFaSDVCYTAwY0RMQXhDWHZOYUJoTlpDZzg5akZn?=
 =?utf-8?B?dFMyMEkyNDBiZi82RU5XUDhIRkl6RXBLdy9LL1lHcjZMeDlLMjFDVXlqb3lL?=
 =?utf-8?B?ZnVjSFN2YTBOd3dJVHBRbXNxbllZRnFEYjA1cXpXTWs0T09RNkw1VzNBdXVq?=
 =?utf-8?Q?8qSDsL/8tl/vrmEQ4EUtkBaxaKYSBEzu2mAFWsB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR19MB5078.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f382333-986c-4b13-863e-08d91e9d6049
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 10:19:12.3039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tfEdS5+DgpzWWV8KTgfKPNMW+6vF8N4M66Bjdpv78XiHbBGGX+L3Lox45TfaC1KPwtWEzsxrKfpTsW5COPT+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4300
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-24_06:2021-05-24,2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240074
X-Proofpoint-ORIG-GUID: 7tfYWuQrkL5_JZy0NWlyHSiDFAU7IMzS
X-Proofpoint-GUID: 7tfYWuQrkL5_JZy0NWlyHSiDFAU7IMzS
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240075
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2Vk
ZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMjEsIDIwMjEgMTA6
MjUgUE0NCj4gVG86IE1hcmsgUGVhcnNvbg0KPiBDYzogbWdyb3NzQGxpbnV4LmludGVsLmNvbTsg
cGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IEJoYXJhdGhpLA0KPiBEaXZ5YTsg
S3NyLCBQcmFzYW50aDsgRGVsbCBDbGllbnQgS2VybmVsDQo+IFN1YmplY3Q6IFJlOiBbRXh0ZXJu
YWxdIFJlOiBbUEFUQ0ggdjIgMy8zXSBwbGF0Zm9ybS94ODY6IHRoaW5rLWxtaTogQWRkIFdNSQ0K
PiBpbnRlcmZhY2Ugc3VwcG9ydCBvbiBMZW5vdm8gcGxhdGZvcm1zDQo+IA0KPiANCj4gW0VYVEVS
TkFMIEVNQUlMXQ0KPiANCj4gSGksDQo+IA0KPiBPbiA1LzIxLzIxIDU6NTUgUE0sIE1hcmsgUGVh
cnNvbiB3cm90ZToNCj4gDQo+IDxzbmlwPg0KPiANCj4gPj4+IEkga25vdyBpdCB3b3VsZCBtYWtl
IERlbGwgYW5kIExlbm92byBvcGVyYXRlIGRpZmZlcmVudGx5IChJIGNhbiBhZGQNCj4gPj4+IHRo
YXQgZGV0YWlsIHRvIHRoZSBkb2N1bWVudGF0aW9uKSBidXQgaXQganVzdCBmZWVscyBsaWtlIGEg
bmljZXINCj4gPj4+IGRlc2lnbi4NCj4gPj4NCj4gPj4gVGhhdCB3b3JrcyBmb3IgbWUuIFBlcmhh
cHMgeW91IGNhbiBhbHNvIGRvIGEgKGNvbXBpbGUgdGVzdGVkIG9ubHkpDQo+ID4+IFJGQyBwYXRj
aCBmb3IgdGhlIERlbGwgY29kZSB0byBkbyB0aGUgc2FtZSB0aGluZyAocmVwbGFjZSB0aGUgbWVt
c2V0DQo+ID4+IDAgd2l0aCB0aGUgc3Ryc2NweSkgdG8gc2VlIGlmIHRoZSBEZWxsIGZvbGtzIGFy
ZSBvayB3aXRoIGFsc28gZG9pbmcNCj4gPj4gdGhpbmdzIHRoaXMgd2F5ID8NCj4gPj4NCj4gPiBJ
J20gbm90IGh1Z2VseSBjb21mb3J0YWJsZSB3aXRoIHRoYXQuIElmIGZvciBzb21lIHJlYXNvbiBp
dCBicm9rZQ0KPiA+IHRoaW5ncyBmb3IgRGVsbCBjdXN0b21lcnMgSSB3b3VsZG4ndCB3YW50IHRv
IGJlIHJlc3BvbnNpYmxlIDopDQo+IA0KPiBSaWdodCwgdGhhdCBpcyB3aHkgSSBzdWdnZXN0ZWQg
bWFraW5nIGl0IGEgUkZDIHBhdGNoIGFuZCBJIHdvdWxkIGNlcnRhaW5seSBub3QNCj4gYXBwbHkg
dGhhdCBwYXRjaCB3aXRob3V0IGl0IGJlaW5nIHRlc3RlZCBieSBEZWxsIGZpcnN0Lg0KPiANCj4g
VGhlIGlkZWEgYmVoaW5kIHRoZSBwYXRjaCBpcyBmb3IgaXQgdG8gYmUgYSB3YXkgdG8gZ2V0IGEg
ZGlzY3Vzc2lvbiBhYm91dCB0aGlzDQo+IHN0YXJ0ZWQuIEluIG15IGV4cGVyaWVuY2UgcGF0Y2hl
cyB0ZW5kIHRvIGdldCBtb3JlIG9mIGEgcmVhY3Rpb24gdGhlbg0KPiBoeXBvdGhldGljYWwgZGlz
Y3Vzc2lvbnMgYWJvdXQgY2hhbmdlcyA6KQ0KPiANCj4gPiBJJ2QgcmF0aGVyIHRoZXkNCj4gPiBt
YWRlIHRoZSBjaGFuZ2VzIGFuZCB3ZXJlIGFibGUgdG8gdGVzdCBpdCAtIEkga25vdyB0aGF0J3Mg
d2hhdCBJJ2QNCj4gPiBwcmVmZXIgaWYgaXQgd2FzIHRoZSBvdGhlciB3YXkgYXJvdW5kLiBBcG9s
b2dpZXMgaWYgSSdtIGJlaW5nIG92ZXIgY2F1dGlvdXMhDQo+IA0KPiBJZiB5b3UgZG9uJ3QgZmVl
bCBjb21mb3J0YWJsZSBkb2luZyB0aGlzLCB0aGF0IGlzIGZpbmUsIGxldHMgd2FpdCB3aGF0IHRo
ZSBEZWxsDQo+IGZvbGtzIGhhdmUgdG8gc2F5OyBhbmQgaWYgdGhleSBkb24ndCByZXNwb25kIEkg
bWlnaHQgZG8gYSBSRkMgbXlzZWxmLg0KPiANCg0KQWNrLiBXZSB3aWxsIGltcGxlbWVudCB0aGUg
c2FtZSBmcm9tIERlbGwgc2lkZSBhcyB3ZWxsIHRvIGhhdmUgdW5pZm9ybWl0eSBhbmQNCnNlZW1z
IG5pY2VyIGZyb20gYSB1c2VyIHBvaW50IG9mIHZpZXcgcmF0aGVyIHRoYW4gcG9wdWxhdGluZyB0
aGUgDQpjdXJyZW50X3Bhc3N3b3JkIGZpZWxkIGFnYWluIGluIGNhc2Ugb2YgcGFzc3dvcmQgY2hh
bmdlIHNjZW5hcmlvLiANCg0KPiA+IEkndmUgYWRkZWQgdGhlIG5ldyBEZWxsIGtlcm5lbCBncm91
cCBlbWFpbCB0byB0aGUgdGhyZWFkIHNvIHRoZXkncmUNCj4gPiBhd2FyZSA6KQ0KPiANCj4gVGhh
bmtzLg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCg0K
