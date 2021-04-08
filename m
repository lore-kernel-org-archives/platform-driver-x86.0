Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91E5C433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Apr 2021 01:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 829906115B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Apr 2021 01:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhDHBk7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 21:40:59 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:3276 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229529AbhDHBk6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 21:40:58 -0400
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1381Qipu032079;
        Wed, 7 Apr 2021 21:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=7ADbvETOdBkX9lfJKL3BeeK87c2a+hDArBHeYgjAJl8=;
 b=DueLwr2MDN/vZryaPnswdeTJsFVBVvbbaACI2Pe67Kd4sQNa44tUTd6ptwRAl2HtbM2d
 2+lJYG+yJ/ZzX5vMF9WeOK9hMWheSDrrOngQWc666vW+3t7+PfgRbLBeWPKStTjGedO3
 2x/gClfZu+xYCf7+Tg3Z93aZlG+CWoGK4FZ/VdiD75iuuL5gLhPVsWLN7wNT5pY92aMb
 lIGEsMx3namnmu8wzuOtTY98WFhwm/vRbkn7n+pBJNrmeUqv/n6FsE0QLvxEY27EBx8r
 a2VOCAuvLztMMYo480GGSG0iiag96MP7+bWUo0OpqEGFJ2//h5zfwTP6GosKR08jKYh5 iw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 37rvcmnskk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Apr 2021 21:40:35 -0400
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1381PDOF043565;
        Wed, 7 Apr 2021 21:40:34 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
        by mx0a-00154901.pphosted.com with ESMTP id 37sfg7q926-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Apr 2021 21:40:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlVAZf41CFH5idY85IeY66uVK9vsn29xKAKR6v8eqUAPpMN/eAvdqKIbRzWfdx+KOyUF9gXUhXYq/ajIL1hGCzb3gQmlt3+4Vuo+IXGXc2rrN+j6P73RCAVenH8Jf3PWoyD47vcsqcaf88nRcAtxWFvyL/y/990hKsDmFtCaPTOLR4cppr4md81yMDd6P3jnmadK5RBKT5y9J+g4FBgTQW5mmZ5A4+U+LEznQwhA45cFlDObFjOAPESalvgZ53OblbDJmaC+o2d9JuzkkbpyU0noTrJucDaXyVn5QLi+uMJwImNhD2CyyFEpQNcE/gPuubUzfIEQ0gAfs8QXjq71SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ADbvETOdBkX9lfJKL3BeeK87c2a+hDArBHeYgjAJl8=;
 b=UUFKh9059ykJo82H2xGgsbv23L8bRS7+pNnWBNKERQwdfiV7Pyx5VRPyl+xKrnv/UYai5RBifveECWoMV3OA7tE+0OmqApbZFkLKhpPP8Apmk7VJ5cEyTdDtDQhW60xRfwyDzNYVP3xzQdPs22qZjL08k5Dehs7bWi0X6+tKyfL43uFtaoChzBpTFrxh14QNmW5uhB1cN1Ol2hlurc1ifZAfy2OGTUTyXU4zj/7orkD4CcCi8YC/q2rmMGYv/UUYMRh9I8P62DPaaWebocxbnNbyV+DSXmwQbgLz7xkU569IqdQ0yWnU5IXk6m5EkWhWO6nTZOhJGryLFRQ4opjwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3676.namprd19.prod.outlook.com (2603:10b6:5:1dc::25)
 by DM5PR1901MB2183.namprd19.prod.outlook.com (2603:10b6:4:aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 8 Apr
 2021 01:40:32 +0000
Received: from DM6PR19MB3676.namprd19.prod.outlook.com
 ([fe80::249f:83fe:c8e3:4be3]) by DM6PR19MB3676.namprd19.prod.outlook.com
 ([fe80::249f:83fe:c8e3:4be3%7]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 01:40:32 +0000
From:   "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
CC:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Yuan, Perry" <Perry.Yuan@dell.com>
Subject: RE: RE: [PATCH v2] platform/x86: dell-wmi-sysman: Make
 init_bios_attributes() ACPI object parsing more robust
Thread-Topic: RE: [PATCH v2] platform/x86: dell-wmi-sysman: Make
 init_bios_attributes() ACPI object parsing more robust
Thread-Index: AQHXHk4Y61NlmdLG8k6LBRkRDirCoqqOYOcAgAgMELCAABTYgIAEqhuggAELBgCAA7eegIAJGBuAgADsWHA=
Date:   Thu, 8 Apr 2021 01:40:32 +0000
Message-ID: <DM6PR19MB367608EB8FF010E9D097968582749@DM6PR19MB3676.namprd19.prod.outlook.com>
References: <20210321121607.35717-1-hdegoede@redhat.com>
 <bdbbe7e6-7a6b-fa9d-426a-e88135e3c7f5@redhat.com>
 <DM6PR19MB3676F7901C6D1A778396E6DF82619@DM6PR19MB3676.namprd19.prod.outlook.com>
 <69d0c17a-a24b-6cf3-9acc-e6c4398c9a9c@redhat.com>
 <DM6PR19MB3676CB7EC5181819843A75DF827E9@DM6PR19MB3676.namprd19.prod.outlook.com>
 <3af4f3ba-d444-8b43-bb6f-e0adb17ff2f3@redhat.com>
 <DM6PR19MB36768A7F5E58CAF6562DE6A5827B9@DM6PR19MB3676.namprd19.prod.outlook.com>
 <3c2c2b73-54ad-9597-f647-83f260284a0c@redhat.com>
In-Reply-To: <3c2c2b73-54ad-9597-f647-83f260284a0c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Prasanth_Ksr@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-04-08T01:40:29.1214107Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=72e09ae0-b549-4e93-879b-9cd2fcaf3ef2;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [49.207.225.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3a302ad-d0da-4118-10e7-08d8fa2f4c63
x-ms-traffictypediagnostic: DM5PR1901MB2183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1901MB2183A6197B41973B33BC3ECA82749@DM5PR1901MB2183.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z5l54zDx/SLXNysqMtZvGi2F+5pAiWAZ8upSz0xQ11zvMwjtlumdGPrE6n4XDahfRdywy+DIvbJgYyzay2XoMLf1K8DB1e7AtIt3TQnblxxg54aY0sCEJWbw/S+h0PnO2dwgnXydizjdaXp88viVUETBWX6FWK1A1JDjPDZRMAdW+oF7lnXAifS1xX2SLOCt9SGdjyK99xWYHIfkC5X/nkmpEkyT7lCpXqE796/m7QaAIoPfo6fyj7VPwsvu2Z8xfKkNKqpyH4Y9F809V9u5B0xJJ+2e2+fFUwRiLpTNSvArpWDgqtn6Nrd5LVuKbrVhaZKGl92un1CuxxrN49AkDSgbZcDkWU/BYizy+HAGO0ZWiRdfkLCGddq9TJjNYUSsMlT5M4h1ua+YC2D+8jIZF97K7HkbKMDNHmuvlwnwWQNWqn6JDibvjz7wv+ZU/vfWIA7cyYxW+PtFN8Ur5a5jDxLHOw8xzksX9VCuZhaIDQTsTzb1Cwz9i6iQpLpQuODxaYCnDVIQR+dMz0JW4gXFPajRnW/jmnDbStAUXg7DUzRfJkqnds68FaaZhqeQ3fJKZLlqgZlaB3LsqNx9jCqCVUF9lR6ihLdrdoZYNxkDi9/LJZnSMddufl+l+7m+SY62aMr7A2XrQTdBQslaL3Xd/sMnx0mIONvwzgcBy7CNoRoswh5mDBtjNIZyfWzwFOIVVBy+RIxursvbn3NObT43ldU/dBfXLBzbeqS46dWAdbITF7Mtn1BDPSKiNAx0sqG8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB3676.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(7696005)(5660300002)(38100700001)(55236004)(8676002)(55016002)(966005)(26005)(33656002)(71200400001)(4326008)(52536014)(186003)(107886003)(110136005)(66946007)(66446008)(66556008)(64756008)(66476007)(2906002)(786003)(6506007)(8936002)(53546011)(76116006)(86362001)(9686003)(478600001)(316002)(54906003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YUVrZWlGUVRpSHhnN0w1bWl6dkg0K2dIeEg0QmljdU1nbnJVSkh3b2NneGs0?=
 =?utf-8?B?Z0tPRE9JYkhSanh0Vnd2a3RvS295RGtOdzM4a2xINUNHMmdwMW9Ld1JsTTh6?=
 =?utf-8?B?azlrNkJXU1U2dldtdlh1MUVvbHpZUC9nZG5kU0ZlQVZEZHlGMG1pUVhMVSs5?=
 =?utf-8?B?b3VEYnUrbXBhRFhGQmtHWkFONy9HRTVTWVdqWmh3T0JkQlB2ZW1PSU12d3Rq?=
 =?utf-8?B?NDY2YmNWeUIyN0F3NWVVZXpwUW5FZFpCT1lwRTA1Vzl0S0Q3NUJNVmpOL0xR?=
 =?utf-8?B?NWFQbUhCcTJzWG90TXRkMlA1R011NGJRVHVZWE52ZHZGZlpTVXJ5L256SGNZ?=
 =?utf-8?B?ZVJDcnR0UWlzRExBVk90STdDYTN5VmxxZWttaEUvQUtrUUpsSVVKNG1uc1pw?=
 =?utf-8?B?RjM4TklORUFpVm1oOWlENjRlMkJzZXJoREYxclErSzRCYnJpeWhRQ0J0cy9E?=
 =?utf-8?B?M3NmemoxOHhxSXJlTWtJaUlrK3VaME9yR3RycXNqeE4rWWc5RHoyTTJmS2dZ?=
 =?utf-8?B?QVZaM3JuVVVoRG8zSitXTEFrQkU0WlgxaU5SdXhmdUlxcm4ybGkrWFppVlVR?=
 =?utf-8?B?VWh3T0pIVjRUb2t5d0xtWTYxQXpCYk82ekdZcGp1OHZ3TFhGUDBvd2Y2Z2VI?=
 =?utf-8?B?bFZtblhjOW1tWVFhVlRtZXlDdHlGS0tUN2ZqR3JxSVE2aU0yR3M0YTBHQXlT?=
 =?utf-8?B?ZCtxOWZULzdCQitWaUFVV3MwNTVhVGlzVGlHU3ZyWE8zQ2FnSjhEa0xZYThj?=
 =?utf-8?B?NGVZQnMwK1V1VnZobVozWkVTdUIvbTh2TW9NdWRMZjh6S1daSEJWSlM0Z0h5?=
 =?utf-8?B?Z2crMVBobmsrdE9aZXFSbkFyZGV3eVVuQXJkOTdNQ0hERUJtSnlnaS8wY0Nn?=
 =?utf-8?B?YjhvcHFXYzlGNFRTVEZ5NG5wNVlHWC8weDgvcFNzQ0lsaEFPSTc1QUwwY1c5?=
 =?utf-8?B?bGhCMW1DSFkwdnFqZmJRdi9zRUpoaDZRQmN0R1hlbkNPUUNueWZ0cE9JVmlt?=
 =?utf-8?B?VFpvZSszMTViSkpYN1N6eXdSK0I5eTNyODdOazZzd0pqV1FzTldkRVVFZG53?=
 =?utf-8?B?ZWhJa0twVGF0TklVNktSbUJzaVBzcXAzRHRCU3lNK0ZHS0lqYTlxbHNRN1I3?=
 =?utf-8?B?amY0MGMxY2crTkJBa0pFN3RYS0ZZNHdjY2VSTkRPN1pmam9EQTVYY1NJU3JU?=
 =?utf-8?B?eTNiWjVCdGRjbGNQNXVFaldwbmFtaDV5Y1B2cTFIdjZubG9wcUg0MUdwcTZS?=
 =?utf-8?B?QTRmNFlmNU1ldWszWEwxc2tJWGc1Um5pRlI2MGcweGpsZUxaUVBpKzhPcmF6?=
 =?utf-8?B?TE1IUHZ0RENrd3BhOXBIZVpXdG1zWlJtRk5hcExXV1ZmcDlOb0Y5OWJMcHYy?=
 =?utf-8?B?a3M4SXU3ZW1jME1nbnpMenhlWVl3L0d3dzVENHRVR1RhRlUzNllaV1BiUGNO?=
 =?utf-8?B?TmRadFl0VkRrSGoxNFo4RDJBNk5oVjVENjRUeVUrdm96RmE2bHdjSDNUSTlC?=
 =?utf-8?B?cE5OTm9ZMHY0TU80RmZYeSt2RDR6UnF3Q0NOd3VRR0VLVWYvRTYrVGN2UlR6?=
 =?utf-8?B?bTYyRlJOOHFGOE0rd2VhVVR5OUVJZURTelhwSnRBVjRNQlJqaWdRYXdxS2FG?=
 =?utf-8?B?TUlKNUpZYnRUZGNrSVp6TkNKVEZFRjZkaG5oOFhod29GMVYrcE5CSFlqSS8r?=
 =?utf-8?B?ckV5MXZROEpXaEdjVU56VXU4d05FM1c0OWdGSzhyTHJtOWlPSU1UUS9lM2lt?=
 =?utf-8?Q?ZHBhI5ye0wNvs5U+nhK7kLoOwpp1++esme5dGDx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3676.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a302ad-d0da-4118-10e7-08d8fa2f4c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 01:40:32.3353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHPZ5ez9oe9uLu/7aDMjOrcTtSKlsRJdNORwAd8LeAUeyH/m3ke5aF7+BZrUA49P7xVzEAI9U4Bcn30pWB+v5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1901MB2183
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-07_11:2021-04-07,2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080006
X-Proofpoint-ORIG-GUID: bJcu4xfoNiNSoMdZbiFGHmHtZz5HdYRp
X-Proofpoint-GUID: bJcu4xfoNiNSoMdZbiFGHmHtZz5HdYRp
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080006
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2Vk
ZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCA3LCAyMDIx
IDU6MDIgUE0NCj4gVG86IEtzciwgUHJhc2FudGg7IE1hcmsgR3Jvc3M7IEFuZHkgU2hldmNoZW5r
bw0KPiBDYzogTGltb25jaWVsbG8sIE1hcmlvOyBCaGFyYXRoaSwgRGl2eWE7IEFsZXhhbmRlciBO
YXVtYW5uOyBwbGF0Zm9ybS1kcml2ZXItDQo+IHg4NkB2Z2VyLmtlcm5lbC5vcmc7IFl1YW4sIFBl
cnJ5DQo+IFN1YmplY3Q6IFJlOiBSRTogW1BBVENIIHYyXSBwbGF0Zm9ybS94ODY6IGRlbGwtd21p
LXN5c21hbjogTWFrZQ0KPiBpbml0X2Jpb3NfYXR0cmlidXRlcygpIEFDUEkgb2JqZWN0IHBhcnNp
bmcgbW9yZSByb2J1c3QNCj4gDQo+IA0KPiBbRVhURVJOQUwgRU1BSUxdDQo+IA0KPiBIaSwNCj4g
DQo+IE9uIDQvMS8yMSA2OjQ1IFBNLCBLc3IsIFByYXNhbnRoIHdyb3RlOg0KPiA+IEhpLA0KPiA+
DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDMwLCAy
MDIxIDE6MjQgUE0NCj4gPj4gVG86IEtzciwgUHJhc2FudGg7IE1hcmsgR3Jvc3M7IEFuZHkgU2hl
dmNoZW5rbw0KPiA+PiBDYzogTGltb25jaWVsbG8sIE1hcmlvOyBCaGFyYXRoaSwgRGl2eWE7IEFs
ZXhhbmRlciBOYXVtYW5uOw0KPiA+PiBwbGF0Zm9ybS1kcml2ZXItIHg4NkB2Z2VyLmtlcm5lbC5v
cmc7IFl1YW4sIFBlcnJ5DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHBsYXRmb3JtL3g4
NjogZGVsbC13bWktc3lzbWFuOiBNYWtlDQo+ID4+IGluaXRfYmlvc19hdHRyaWJ1dGVzKCkgQUNQ
SSBvYmplY3QgcGFyc2luZyBtb3JlIHJvYnVzdA0KPiA+Pg0KPiA+Pg0KPiA+PiBbRVhURVJOQUwg
RU1BSUxdDQo+ID4+DQo+ID4+IEhpLA0KPiA+Pg0KPiA+PiBPbiAzLzI5LzIxIDY6MDAgUE0sIEtz
ciwgUHJhc2FudGggd3JvdGU6DQo+ID4+PiBIaSwNCj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRo
YXQuY29tPg0KPiA+Pj4+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjYsIDIwMjEgMTA6MTQgUE0NCj4g
Pj4+PiBUbzogS3NyLCBQcmFzYW50aDsgTWFyayBHcm9zczsgQW5keSBTaGV2Y2hlbmtvDQo+ID4+
Pj4gQ2M6IExpbW9uY2llbGxvLCBNYXJpbzsgQmhhcmF0aGksIERpdnlhOyBBbGV4YW5kZXIgTmF1
bWFubjsNCj4gPj4+PiBwbGF0Zm9ybS1kcml2ZXItIHg4NkB2Z2VyLmtlcm5lbC5vcmc7IFl1YW4s
IFBlcnJ5DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gcGxhdGZvcm0veDg2OiBkZWxs
LXdtaS1zeXNtYW46IE1ha2UNCj4gPj4+PiBpbml0X2Jpb3NfYXR0cmlidXRlcygpIEFDUEkgb2Jq
ZWN0IHBhcnNpbmcgbW9yZSByb2J1c3QNCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gW0VYVEVSTkFM
IEVNQUlMXQ0KPiA+Pj4+DQo+ID4+Pj4gSGksDQo+ID4+Pj4NCj4gPj4+PiBPbiAzLzI2LzIxIDQ6
NDAgUE0sIEtzciwgUHJhc2FudGggd3JvdGU6DQo+ID4+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IEhp
LA0KPiA+Pj4+Pg0KPiA+Pj4+PiBbRVhURVJOQUwgRU1BSUxdDQo+ID4+Pj4+DQo+ID4+Pj4+PiBI
aSwNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBPbiAzLzIxLzIxIDE6MTYgUE0sIEhhbnMgZGUgR29lZGUg
d3JvdGU6DQo+ID4+Pj4+Pj4gTWFrZSBpbml0X2Jpb3NfYXR0cmlidXRlcygpIEFDUEkgb2JqZWN0
IHBhcnNpbmcgbW9yZSByb2J1c3Q6DQo+ID4+Pj4+Pj4gMS4gQWx3YXlzIGNoZWNrIHRoYXQgdGhl
IHR5cGUgb2YgdGhlIHJldHVybiBBQ1BJIG9iamVjdCBpcw0KPiA+Pj4+Pj4+IHBhY2thZ2UsDQo+
ID4+Pj4gcmF0aGVyDQo+ID4+Pj4+Pj4gICAgdGhlbiBvbmx5IGNoZWNraW5nIHRoaXMgZm9yIGlu
c3RhbmNlX2lkID09IDAgMi4gQ2hlY2sgdGhhdA0KPiA+Pj4+Pj4+IHRoZSBwYWNrYWdlIGhhcyB0
aGUgbWluaW11bSBhbW91bnQgb2YgZWxlbWVudHMgd2hpY2ggd2lsbA0KPiA+Pj4+Pj4+ICAgIGJl
IGNvbnN1bWVkIGJ5IHRoZSBwb3B1bGF0ZV9mb29fZGF0YSgpIGZvciB0aGUgYXR0cl90eXBlDQo+
ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBOb3RlL1RPRE86IFRoZSBwb3B1bGF0ZV9mb29fZGF0YSgpIGZ1
bmN0aW9ucyBzaG91bGQgYWxzbyBiZQ0KPiBtYWRlDQo+ID4+Pj4+Pj4gbW9yZSByb2J1c3QuIFRo
ZSBzaG91bGQgY2hlY2sgdGhlIHR5cGUgb2YgZWFjaCBvZiB0aGUgZWxlbWVudHMNCj4gPj4+Pj4+
PiBtYXRjaGVzIHRoZSB0eXBlIHdoaWNoIHRoZXkgZXhwZWN0IGFuZCBpbiBjYXNlIG9mDQo+ID4+
Pj4+Pj4gcG9wdWxhdGVfZW51bV9kYXRhKCkNCj4gPj4+Pj4+PiBvYmotPnBhY2thZ2UuY291bnQg
c2hvdWxkIGJlIHBhc3NlZCB0byBpdCBhcyBhbiBhcmd1bWVudCBhbmQgaXQNCj4gPj4+Pj4+PiBv
YmotPnNob3VsZA0KPiA+Pj4+Pj4+IHJlLWNoZWNrIHRoaXMgaXRzZWxmIHNpbmNlIGl0IGNvbnN1
bWUgYSB2YXJpYWJsZSBudW1iZXIgb2YgZWxlbWVudHMuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBG
aXhlczogZThhNjBhYTc0MDRiICgicGxhdGZvcm0veDg2OiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3IN
Cj4gPj4+Pj4+PiBTeXN0ZW1zIE1hbmFnZW1lbnQgRHJpdmVyIG92ZXIgV01JIGZvciBEZWxsIFN5
c3RlbXMiKQ0KPiA+Pj4+Pj4+IENjOiBEaXZ5YSBCaGFyYXRoaSA8RGl2eWFfQmhhcmF0aGlAZGVs
bC5jb20+DQo+ID4+Pj4+Pj4gQ2M6IE1hcmlvIExpbW9uY2llbGxvIDxtYXJpby5saW1vbmNpZWxs
b0BkZWxsLmNvbT4NCj4gPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPg0KPiA+Pj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4+IENoYW5nZXMgaW4gdjI6
DQo+ID4+Pj4+Pj4gLSBSZXN0b3JlIGJlaGF2aW9yIG9mIHJldHVybmluZyAtRU5PREVWIHdoZW4g
dGhlDQo+ID4+Pj4gZ2V0X3dtaW9ial9wb2ludGVyKCkgY2FsbA0KPiA+Pj4+Pj4+ICAgZm9yIGlu
c3RhbmNlX2lkID09IDAgcmV0dXJucyBOVUxMLiBPdGhlcndpc2UNCj4gPj4+Pj4+PiAgIC9zeXMv
Y2xhc3MvZmlybXdhcmUtYXR0cmlidXRlcy9kZWxsLXdtaS1zeXNtYW4gd2lsbCBnZXQNCj4gPj4+
Pj4+PiBjcmVhdGVkIHdpdGgNCj4gPj4+PiBhbg0KPiA+Pj4+Pj4+ICAgZW1wdHkgYXR0cmlidXRl
cyBkaXIgKGVtcHR5IGV4Y2VwdCBmb3IgcGVuZGluZ19yZWJvb3QgYW5kDQo+ID4+Pj4+Pj4gcmVz
ZXRfYmlvcykNCj4gPj4+Pj4NCj4gPj4+Pj4+IFNvIHRoZSByZWFzb24gZm9yIHRoaXMgY2hhbmdl
IGluIHYyIGlzIHRoYXQgdGVzdGluZyBvbiBhIERlbGwNCj4gPj4+Pj4+IExhdGl0dWRlDQo+ID4+
IEU1NTcwOg0KPiA+Pj4+Pj4NCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
YnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy4NCj4gPj4+Pj4+DQo+IGNnaT9pZD0xOTM2MTcx
X187ISFMcEtJITFlWVZ4aEUwQ3l0Nkp0emdUQmFkZkl2WkxRUTdMSW1KWVNRbnMwRF9BDQo+ID4+
Pj4+PiBZbDZNX3AwMHlNZ1Y2TlRGQm9MNHpNVSQgW2J1Z3ppbGxhWy5dcmVkaGF0Wy5dY29tXQ0K
PiA+Pj4+Pj4NCj4gPj4+Pj4+IFdpdGggdjEgb2YgdGhpcyBwYXRjaCByZXN1bHRzIGluIGFuIGVt
cHR5IGF0dHJpYnV0ZXMgZGlyIChlbXB0eQ0KPiA+Pj4+Pj4gZXhjZXB0IGZvcg0KPiA+Pj4+IHBl
bmRpbmdfcmVib290IGFuZCByZXNldF9iaW9zKSwgaW50ZXJlc3RpbmdseSBlbm91Z2ggdGhlcmUg
YXJlIGJvdGgNCj4gPj4+PiBTeXN0ZW0gYW5kIEFkbWluIGRpcnMgY3JlYXRlZCB1bmRlciBBdXRo
ZW50aWNhdGlvbiwgc28gdGhlIEJJT1Mgb2YNCj4gPj4+PiB0aGlzIGRldmljZSBzZWVtcyB0byBo
YXZlIHRoZSBHVUlEcyBmb3IgYm90aCB0aGUgYXR0cmlidXRlcyBhbmQgdGhlDQo+ID4+Pj4gYXV0
aGVudGljYXRpb24gaW50ZXJmYWNlczsgYW5kIGl0ID5oYXMgdGhlIDIgc3RhbmRhcmQNCj4gPj4+
PiBhdXRoZW50aWNhdGlvbiBvYmplY3RzLCB0aGVvcmV0aWNhbGx5IGFsbG93aW5nIGNoYW5naW5n
IHRoZSBCSU9TDQo+ID4+Pj4gcGFzc3dvcmRzIGZyb20gd2l0aGluIExpbnV4LCBidXQgaXQgZG9l
cyBub3QgYWR2ZXJ0aXNlIGFueQ0KPiA+Pj4+IGF0dHJpYnV0ZXMgd2hpY2ggY2FuIGJlDQo+ID4+
IGNoYW5nZWQuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gV2l0aCB0aGUgbmV3IHYyIHBhdGNoLCB0aGUg
ZHJpdmVyIHdpbGwgbm93IHNpbXBseSByZWZ1c2UgdG8gbG9hZA0KPiA+Pj4+Pj4gKGFuZCBpdA0K
PiA+Pj4+IHNob3VsZCBubyBsb25nZXIgY3Jhc2ggZHVyaW5nIGNsZWFudXAgYmVjYXVzZSBvZiB0
aGUgb3RoZXIgcGF0Y2hlcykuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gQnV0IEkgd29uZGVyIHdoYXQg
aXMgYWN0dWFsbHkgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGhlcmUgPw0KPiA+Pj4+Pj4gQXJndWFi
bHkgYmVpbmcNCj4gPj4+PiBhYmxlIHRvIGNoYW5nZSB0aGUgQklPUyBwYXNzd29yZHMgaGFzIHNv
bWUgdmFsdWUgb24gaXRzIG93biA/DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gTWFyaW8sIHdoYXQgaXMg
eW91ciB0YWtlIG9uIHRoaXM/DQo+ID4+Pj4+DQo+ID4+Pj4+IElkZWFsbHkgd2Ugc2hvdWxkIG5v
dCBiZSBoaXR0aW5nIHRoaXMgY29kZSBwYXRoIGF0IGFsbC4gSSBhbQ0KPiA+Pj4+PiB3b3JraW5n
IHdpdGgNCj4gPj4+PiBwZXJyeSB0byBzZWUgdGhlIHJlc3VsdHMgYWZ0ZXIgYXBwbHlpbmcgdGhl
IHBhdGNoZXMgb24gdGhlIHN5c3RlbS4NCj4gPj4+Pj4gSWYgdGhpcyBpcyBiZWhhdmlvciB3ZSBj
b25zaXN0ZW50bHkgc2VlIG9uIG9sZGVyIHN5c3RlbSBCSU9TIHRoZW4NCj4gPj4+Pj4gd2Ugd2ls
bA0KPiA+Pj4+IHBhdGNoIHRoZSBjb2RlIHRvIGF2b2lkIGNvZGUgcGF0aCBhbmQgYmFpbCBvdXQg
ZWFybHkgbm90IGxvYWRpbmcNCj4gPj4+PiB0aGUNCj4gPj4gZHJpdmVyLg0KPiA+Pj4+DQo+ID4+
Pj4gV2l0aCB2MiBvZiBteSBwYXRjaGVzICh3aGljaCBoYXZlIGJlZW4gbWVyZ2VkKSB3ZSBkbyBi
YWlsIG91dCBhcw0KPiA+Pj4+IHNvb24gYXMgaXQgaXMgY2xlYXIgdGhhdCB0aGVyZSBpcyBubyBl
bnVtLXR5cGUgKCopIGF0dHJpYnV0ZSB3aXRoDQo+ID4+Pj4gaW5zdGFuY2VfaWQgMC4gVGhhdCBp
cyBwcmV0dHktbXVjaCB0aGUgZWFybGllc3QgdGhhdCB3ZSBjYW4gYmFpbA0KPiA+Pj4+IGFuZCB0
aGF0DQo+ID4+IHdvcmtzIGZpbmUuDQo+ID4+Pj4NCj4gPj4+PiBXaGF0IEkgd2FzIHdvbmRlcmlu
ZyBpcyBpZiB0aGF0IGlzIHRoZSByaWdodCB0aGluZyB0byBkbyB0aG91Z2guIE9uDQo+ID4+Pj4g
dGhlIEU1NTcwIHRoZXJlIHNlZW0gdG8gYmUgbm8gZW51bS9pbnQvc3RyIGF0dHJpYnV0ZXMgYXQg
YWxsIGJ1dA0KPiA+Pj4+IHdoYXQgaWYgdGhlcmUgYXJlIGVudW0NCj4gPj4+PiArIGludCBhdHRy
aWJ1dGVzICsgbm8gc3RyIGF0dHJpYnV0ZXMgZm9yIGV4YW1wbGUgPw0KPiA+Pj4+DQo+ID4+PiBJ
dCB3b3VsZCBiZSByaWdodCB0aGluZyB0byBkbyBiZWNhdXNlIHRoaXMgc2NlbmFyaW8gaGFwcGVu
cyBiZWNhdXNlDQo+ID4+PiBvZg0KPiA+PiBzb21lIEJJT1MgaXNzdWUuDQo+ID4+DQo+ID4+IFJp
Z2h0LCB0aGlzIGlzIHRoZSByaWdodCB0aGluZyB0byBkbyBvbiBtYWNoaW5lcyBzdWNoIGFzIHRo
ZSBMYXRpdHVkZSBFNTU3MC4NCj4gPj4NCj4gPj4gTXkgcXVlc3Rpb24gaXMgbW9yZSwgd2hhdCBp
ZiwgaW4gdGhlIGZ1dHVyZSBzb21lIG1hY2hpbmUgZG9lcyBub3QNCj4gPj4gaGF2ZSBzYXkgc3Ry
aW5nIGJpb3MtYXR0cmlidXRlcywgYnV0IGl0IGRvZXMgaGF2ZSBlbnVtIGFuZCBpbnQgYXR0cmli
dXRlcyA/DQo+ID4+DQo+ID4+IFRoZSBjdXJyZW50IGNvZGUgd2lsbCB0aGVuIHN0aWxsIHJlZnVz
ZSB0byBiaW5kIC8gbG9hZCwgd2hpY2ggc2VlbXMgd3JvbmcuDQo+ID4+DQo+ID4+IE5vdGUgdGhh
dCBvbiB0aGUgRTU1NzAgdGhlcmUgYXJlIG5vIGVudW0gYW5kIG5vIHN0cmluZyBhbmQgbm8gaW50
DQo+ID4+IGF0dHJpYnV0ZXMsIHNvIHdlIGNvdWxkIGFsc28gZGVsYXkgdGhlIHJldHVybiAtRU5P
REVWIHVudGlsIGFmdGVyIHdlDQo+ID4+IGhhdmUgZW51bWVyYXRlZCBhbGwgMyB0eXBlcyBhbmQg
aWYgYWxsIDMgaGF2ZSBhDQo+ID4+IHdtaV9wcml2LmZvb19pbnN0YW5jZXNfY291bnQgb2YgMCB0
aGVuIHJldHVybiAtRU5PREVWIHRoYXQgc2VlbXMgbGlrZQ0KPiB0aGUgbG9naWNhbCB0aGluZyB0
byBkbyBoZXJlIHRvIG1lLg0KPiA+DQo+ID4gSXQgaXMgbm90IG9ubHkgd2l0aCBMYXRpdHVkZSBF
NTU3MCBhbmQgdGhpcyBkZXZpY2UgaXMgYW4gZXhhbXBsZSBvZg0KPiA+IG9uZSBzdWNoIGNhc2Ug
d2hpY2ggd2UgYXJlIG1lbnRpb25pbmcgV2UgZXhwZWN0IGFsbCAzIGNhdGVnb3JpZXMgdG8gYmUN
Cj4gcHJlc2VudCBhbHdheXMgZm9yIHN1cHBvcnRlZCBwbGF0Zm9ybXMuIEV2ZW4gYSBzeXN0ZW0g
d2l0aCBtaW5pbWFsIEJJT1MNCj4gYXR0cmlidXRlcyB3aWxsIGhhdmUgYXQgbGVhc3QgZmV3IG1h
bmRhdG9yeSBhdHRyaWJ1dGVzIGluIGVhY2ggb2YgdGhlIHRocmVlDQo+IGNhdGVnb3JpZXMuDQo+
ID4gSWYgQklPUyBkb24ndCBoYXZlIGFueSBvbmUgY2F0ZWdvcnkgR1VJRCBleHBvc2VkIHRoZW4g
aXQgd2lsbCBiZSBmYXVsdHkNCj4gQklPUyBhbmQgb3VyIGRyaXZlciBtdXN0IHJlZnVzZSB0byBi
aW5kL2xvYWQuIEhlbmNlLCB3ZSBiZWxpZXZlIHRoYXQgY3VycmVudA0KPiBjb2RlIGhhcyByaWdo
dCBsb2dpYy4NCj4gDQo+IE9rLCBzbyB0aGF0IG1lYW5zIHRoYXQgdGhpcyB2MiBpcyBkb2luZyB0
aGUgcmlnaHQgdGhpbmcsIGFzIHRoaXMgdmVyc2lvbiByZXR1cm5zIC0NCj4gRU5PREVWIGlmIGFu
eSBvZiB0aGUgdHlwZXMgYXJlIG1pc3NpbmcsIGp1c3QgYXMgYmVmb3JlLg0KPiANCj4gU2luY2Ug
dGhpcyBhZGRzIGEgY291cGxlIG9mIHVzZWZ1bCByb2J1c3RuZXNzIGNoZWNrcyBJJ20gZ29pbmcg
dG8gbWVyZ2UgdGhpcw0KPiBub3cuDQo+IA0KPiBBcyBtZW50aW9uZWQgYmVmb3JlLCBjYW4geW91
IChQcmFzYW50aCBhbmQvb3IgRGl2eWEpIHBsZWFzZSB0YWtlIGNhcmUgb2YNCj4gdGhlIFRPRE8g
ZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2U6DQo+IA0KPiBUT0RPOiBUaGUgcG9wdWxhdGVfZm9vX2Rh
dGEoKSBmdW5jdGlvbnMgc2hvdWxkIGFsc28gYmUgbWFkZSBtb3JlIHJvYnVzdC4NCj4gVGhlIHNo
b3VsZCBjaGVjayB0aGUgdHlwZSBvZiBlYWNoIG9mIHRoZSBlbGVtZW50cyBtYXRjaGVzIHRoZSB0
eXBlIHdoaWNoDQo+IHRoZXkgZXhwZWN0IGFuZCBpbiBjYXNlIG9mIHBvcHVsYXRlX2VudW1fZGF0
YSgpDQo+IG9iai0+cGFja2FnZS5jb3VudCBzaG91bGQgYmUgcGFzc2VkIHRvIGl0IGFzIGFuIGFy
Z3VtZW50IGFuZCBpdCBzaG91bGQNCj4gcmUtY2hlY2sgdGhpcyBpdHNlbGYgc2luY2UgaXQgY29u
c3VtZSBhIHZhcmlhYmxlIG51bWJlciBvZiBlbGVtZW50cy4NCg0KQWNrLiBXaWxsIHdvcmsgb24g
dGhpcyBUT0RPIGFuZCBzZW5kIHRoZSBwYXRjaGVzIHNvb24uDQoNCg==
