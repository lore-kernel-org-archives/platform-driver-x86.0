Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67FFC433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Mar 2021 15:41:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABE6561A1E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Mar 2021 15:41:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhCZPlU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Mar 2021 11:41:20 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:59394 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230138AbhCZPlP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Mar 2021 11:41:15 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12QFWeYo011538;
        Fri, 26 Mar 2021 11:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=IxxDsMangnGlw69YTWdNO+X1vagR4WzT8ZTUuezpOIw=;
 b=J3THrGexxgVWLkeRTeeXHU0by0DW8p1c2Ja4Zv9sL59a8PXtdWvwlMq34H93Mv15EtYV
 QTOVlCAi9lROnGGBIINpkNr/54uExrnnbzGxhKy/Nq4koFqwWKNIObyTibobMzlFkP2Q
 ehfO9kr0fsmSBfKys8OL6rYy/qLhAuei7BKHgoz9kwzJ2lwV4vrfcXqLrjUDtw/jKXZr
 OZuSJm1CqbMEhJmvlJqxg7PQTFVdyC/NMdQzi5EcOEYfdWfFtctLHTMV/i5ZxnO+PUc/
 rw6oGL3TranI/mTwoqQmmb1v5ThKNsmOlTlpRgmZ6I9NBh4B0qEXtS/fHok/JuLs4v6e ag== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 37h12uu69b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Mar 2021 11:41:02 -0400
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12QFUOW5178461;
        Fri, 26 Mar 2021 11:41:02 -0400
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by mx0a-00154901.pphosted.com with ESMTP id 37h14hmnjc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Mar 2021 11:41:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFb+FQdv79HjKjXJuu6UpGSEdOENgOxHKqoOOuLPkLa8PjM0PT4aLRQwMneMks7NySiY+3tTtfkIwxaBtY1V+5vHmGhOZZKS7sVtZfWFDdFO7HOdCSw2riZk14HkYrliW2BoosGmm329jIFOK/hUzsWU7/JNoMdr/OS7k0kPbVynqVFVCf4vJN3ufWTFpoQntnoQ3Ah1iIuK+CjRfIW9nc5h9InRPpj/Bj/1G1Xo32Ua/MbdPsggxm1swKlIHpixpp44QSxdiqHR8aI8my2rKLu8vAAoQrpELS0jDzPHnehxyf13Z3RMhcCTl2fPvBViJe1uzdENzBbns183M3CrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxxDsMangnGlw69YTWdNO+X1vagR4WzT8ZTUuezpOIw=;
 b=nMdOCIUk5X8kJxonpiHo4SnPnGlPOdolyXL0cGjLE9nRn7ZGHKWCUdA7UjpYztiyyRxTkpqbAzVTeulzCHyPnWP30m71t2Dk6IxWetTObhnrzpK0mBBilDHeFElJC/CekH6PhGX6zgkQp6jqfCVYXUixmnd/NQ8VC0nDNwGXEPebFD7JiCutJgXKdaP45kZ26FKhzGVzX3WiNWnuqhJLzzFYfvdgNY8gIMMEUGVo5kHahNNw3S83HRKY/yH3NfEfGW+KHXI5YF6w6KLGPrnptuievgmfKNJsYkC6U2eeNr2ogIxn7mqsyWLiympzv5hqstGQQlUuKZU2P4GYIDTytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3676.namprd19.prod.outlook.com (2603:10b6:5:1dc::25)
 by DM5PR19MB1580.namprd19.prod.outlook.com (2603:10b6:3:14c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 15:40:59 +0000
Received: from DM6PR19MB3676.namprd19.prod.outlook.com
 ([fe80::249f:83fe:c8e3:4be3]) by DM6PR19MB3676.namprd19.prod.outlook.com
 ([fe80::249f:83fe:c8e3:4be3%7]) with mapi id 15.20.3977.025; Fri, 26 Mar 2021
 15:40:59 +0000
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
Subject: RE: [PATCH v2] platform/x86: dell-wmi-sysman: Make
 init_bios_attributes() ACPI object parsing more robust
Thread-Topic: [PATCH v2] platform/x86: dell-wmi-sysman: Make
 init_bios_attributes() ACPI object parsing more robust
Thread-Index: AQHXHk4Y61NlmdLG8k6LBRkRDirCoqqOYOcAgAgMELA=
Date:   Fri, 26 Mar 2021 15:40:59 +0000
Message-ID: <DM6PR19MB3676F7901C6D1A778396E6DF82619@DM6PR19MB3676.namprd19.prod.outlook.com>
References: <20210321121607.35717-1-hdegoede@redhat.com>
 <bdbbe7e6-7a6b-fa9d-426a-e88135e3c7f5@redhat.com>
In-Reply-To: <bdbbe7e6-7a6b-fa9d-426a-e88135e3c7f5@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Prasanth_Ksr@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-26T15:40:55.9657611Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=3627951e-0653-4279-8578-f2305f11b9f5;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [49.207.226.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bc092ff-dd6b-437c-1f89-08d8f06d8dfa
x-ms-traffictypediagnostic: DM5PR19MB1580:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR19MB158086C226F21F4E025106A082619@DM5PR19MB1580.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P25xdpbWIKWAxq7yU2MFPhglfT7ZPifcKXJ9+OY4FJSTbxVNX9pjJ5QUqst8wupLXQVbf6B1Eb2asJb3pjIW4vYVBY5r7aD4m5wg9G7BYbkFn4y5O1UTn87dzDXqaQWe4dmlZWIFYRal6PJcE0pNcMs0wVL60V7OdxtqqtUW/vXWpa0I61wNqajtsMprgMthooL5eZ+Ru7L/WUKEvXAlCLhhFbNIXbYexLKh3E1Q0fk+nWlHJEh7dif0ouCN22UIQxBChxogTztRDIzLYzf3o2acxEhtslRtS6r2QbTXqcRTmwnURelctdg2q66CCUSv2kCtXrWy+4bJ5zNYcyfSlt4NH7k5f7Jo1ZGm0Fy8a/OEfcoSbkUjA251RJhgQQESO6wbcFxySlNW1m/CseSKo7sx4raeKDFD2uQjwqHXMd6C1WNQ8OzNcY0X/UOOV7kFAouQRjDlnpr4ltXXXWOCAbRTPeCJBr/gP1Ynp4CVwUtl+cZD1yihxdM5Cra0PPb6TmNolIG8A7Chtlv3229F8cAU/fF/2VEur/6+5Z8uy8XOp8sZjDexluMQZ35NoCGp/FL7OXwfDXhX7JaegMMZDyMeNaEZ44EgjkLtpqTmmBviYdmVIkuZ7yGat59c/PNHkuiS99ou0KduAYMzaW2Km12X8w0mUt6/fg4Xs2EFEetYxGS06+i9ECowdNyIfnJNZFdfV8tJttLB6QTi/o8hel2vq3+eQ4Wzk9NxqpiBUkA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB3676.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(83380400001)(54906003)(33656002)(8676002)(6506007)(4326008)(186003)(26005)(5660300002)(316002)(71200400001)(110136005)(8936002)(86362001)(66556008)(64756008)(786003)(66446008)(2906002)(9686003)(66946007)(55236004)(7696005)(76116006)(478600001)(52536014)(38100700001)(66476007)(107886003)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?N3lCelZxSGgzWGlIYXQrTDBtalNIWnVxWVRmc3IzaEY3ckk5RHlzZUlyT3g2?=
 =?utf-8?B?bEJsWXZSMjN2cjhaVDFhK3hSUFFrUFgxNkl6K2llK0x5RUJ5ZXR1TjFRYktV?=
 =?utf-8?B?REtsN21qYXJFdU0xVXh6NW9xazVwR1lNR0pIdHAxR3FMT0d0N1pQZFd3STlq?=
 =?utf-8?B?TXRlWG9vN1pJQ1drYjNNRTFnZzZSaTZER2hIb3M5WGZmaDZUaS9JODNpZjg1?=
 =?utf-8?B?UDR0djJ4Nko4ZUFPbFRqd0pYRzNkenNpTEV4QS94alpqUHBKRHFLQ3lEMVY5?=
 =?utf-8?B?NllwWi94am5QT2Q1alZDNUpXa1FtYjFTZUsrK1FVK0dROEdFc1ZhQUJHV09M?=
 =?utf-8?B?ZjlCYVF1OGE2MTgzMWFNYW9sYjh3b3lqS1gwQkZHNGRlMStqNS9ESVJWZjly?=
 =?utf-8?B?VEkxUkdDdVk1aTBuV0d0S2p0Sjd4SCtpdXVkTXBmZnRxTm43UnZFc1JoOWla?=
 =?utf-8?B?MkVQUFFKbWZlTzQvY1hIUVpqUVYyMUIrTzNjVnVsOWU0bUZhdWxJa09pUUhz?=
 =?utf-8?B?ZEs1RVhEektHQnozRHRYUVVHUnNpTW13K1B3VnJCbmMvTDlxSGFxcURNd2xs?=
 =?utf-8?B?N2taSnVVYS83ZExQRGFyYUdGTG4rVVdjdktlUTZ6L3BqcUlNZmExVTlyeDFO?=
 =?utf-8?B?L2lXb0hNaHg2MWZMV0NVNjVHUTVndlRNMU9pS1F2N2grZWhpNmVRNjRxMHFw?=
 =?utf-8?B?RGFvcS8wOHVHS2xjL3Q3aWJmd3FKLzR5WVJSdVRxbFVHUkRnSm5OaDJMb2kw?=
 =?utf-8?B?VHlNUDBKNmY3eGp6NDhkUEx1M1d4cmc5cmsvYVliWDc0T3VGUVlvOCtoYjVl?=
 =?utf-8?B?cWpBaStVdFdZQjVkZzU2NHRoV1hrSk5TS2UxSHpsVXpjOWFIaVlOdDlrU0c1?=
 =?utf-8?B?RTNHcjV1U1BiTmdWT0l4bmpZbG54S3JpQkJ6SWZ3Y29XWmc3bEFLa3UxNFZN?=
 =?utf-8?B?eCtkWkk3L3VmTmwyMlZnNTkyK1k5Rm5UVHNHeVoySVM0d2wyTGxyTnllT3po?=
 =?utf-8?B?ZWJsUTRTYysxSEgwUk00cVdYRStVemlYemx6ME5pb3BhbW4wMnVPWEJHeVBk?=
 =?utf-8?B?a2prNTVOR080OExOS3dCeHBPL0xncDRmN0xMT2JGUEdvaHhqTTNXRlBWUmZF?=
 =?utf-8?B?RkhkMUhqQ2p0QUE2UFhWQmxkVmZabmhqM3hlZDJFRUxaOUhsRG91akttY2FM?=
 =?utf-8?B?aEU5L21hSWhLTXlIS1hjUVNwREtXTUx0NjVDa3l2T0d1K1ZqU1ZNckxIQmJB?=
 =?utf-8?B?ZHhLOXNtMEN6TzhJUXVGL2loQnE1ZlAzWTh4Nzk0N1J5eE9VMXFjaWxVd1lF?=
 =?utf-8?B?UEM1VUN6ZnM1SHNVRzUvWFRHTmpwSGJqNElRZ1NlZWxpcGFDQm1Ka3d2T25E?=
 =?utf-8?B?M1lmSzhtdnFSVWdwTHRncERqS0tCalZzQU5FbVd3bG11MWxRS3hXSmF2UUxJ?=
 =?utf-8?B?aWRBRlBmdVJGTmVwZFRsRW5JMW5nWG1SUmFrc1JJc2xLNUtqMURycEpkb0pY?=
 =?utf-8?B?NWVqYUg1QjVTNDFuOXBXVm5jSDJiVlNCOGJFcDFZVGhqZTFSSWJuTUtTMlJ4?=
 =?utf-8?B?cDk1eDdQY21mOG5YakpvZmhQRUxIOWN2WXY3Nmc4OUlMY3dzY2tGV0NxdVJz?=
 =?utf-8?B?L0tuQnVyNFNzYUpQM3NxNlVsU21iVGJ5dXIzU3dRMkhYaDR2Sjh0bXMwUERS?=
 =?utf-8?B?U0xRbmxEMkZGSm5ma1pVWG5PeW1CckRDb2tQbVNTQnZGY2FEdVhCTUdVbCsy?=
 =?utf-8?Q?MSa5QQSrNSQYjGi4svC3MpcyTLl/KTBLLT1wNuU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3676.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc092ff-dd6b-437c-1f89-08d8f06d8dfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 15:40:59.6136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjpzKivPljPTZazkcql2RQGt++XuQ5y09q1dIJvsw5U+B+M6ApFb4jVOZMGJgZxOLWTsndesyIDop3vP2rTtdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1580
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-26_06:2021-03-26,2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260117
X-Proofpoint-GUID: Tjl7OWGPTXyXteJXthX57UzYQPur_NiM
X-Proofpoint-ORIG-GUID: Tjl7OWGPTXyXteJXthX57UzYQPur_NiM
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260117
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCkhpLA0KDQpbRVhURVJOQUwgRU1BSUxdIA0KDQo+SGksDQo+DQo+T24gMy8yMS8yMSAxOjE2
IFBNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0KPj4gTWFrZSBpbml0X2Jpb3NfYXR0cmlidXRlcygp
IEFDUEkgb2JqZWN0IHBhcnNpbmcgbW9yZSByb2J1c3Q6DQo+PiAxLiBBbHdheXMgY2hlY2sgdGhh
dCB0aGUgdHlwZSBvZiB0aGUgcmV0dXJuIEFDUEkgb2JqZWN0IGlzIHBhY2thZ2UsIHJhdGhlcg0K
Pj4gICAgdGhlbiBvbmx5IGNoZWNraW5nIHRoaXMgZm9yIGluc3RhbmNlX2lkID09IDAgMi4gQ2hl
Y2sgdGhhdCB0aGUgDQo+PiBwYWNrYWdlIGhhcyB0aGUgbWluaW11bSBhbW91bnQgb2YgZWxlbWVu
dHMgd2hpY2ggd2lsbA0KPj4gICAgYmUgY29uc3VtZWQgYnkgdGhlIHBvcHVsYXRlX2Zvb19kYXRh
KCkgZm9yIHRoZSBhdHRyX3R5cGUNCj4+IA0KPj4gTm90ZS9UT0RPOiBUaGUgcG9wdWxhdGVfZm9v
X2RhdGEoKSBmdW5jdGlvbnMgc2hvdWxkIGFsc28gYmUgbWFkZSBtb3JlIA0KPj4gcm9idXN0LiBU
aGUgc2hvdWxkIGNoZWNrIHRoZSB0eXBlIG9mIGVhY2ggb2YgdGhlIGVsZW1lbnRzIG1hdGNoZXMg
dGhlIA0KPj50eXBlIHdoaWNoIHRoZXkgZXhwZWN0IGFuZCBpbiBjYXNlIG9mIHBvcHVsYXRlX2Vu
dW1fZGF0YSgpDQo+PiBvYmotPnBhY2thZ2UuY291bnQgc2hvdWxkIGJlIHBhc3NlZCB0byBpdCBh
cyBhbiBhcmd1bWVudCBhbmQgaXQgc2hvdWxkDQo+PiByZS1jaGVjayB0aGlzIGl0c2VsZiBzaW5j
ZSBpdCBjb25zdW1lIGEgdmFyaWFibGUgbnVtYmVyIG9mIGVsZW1lbnRzLg0KPj4gDQo+PiBGaXhl
czogZThhNjBhYTc0MDRiICgicGxhdGZvcm0veDg2OiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3IgU3lz
dGVtcyANCj4+IE1hbmFnZW1lbnQgRHJpdmVyIG92ZXIgV01JIGZvciBEZWxsIFN5c3RlbXMiKQ0K
Pj4gQ2M6IERpdnlhIEJoYXJhdGhpIDxEaXZ5YV9CaGFyYXRoaUBkZWxsLmNvbT4NCj4+IENjOiBN
YXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGltb25jaWVsbG9AZGVsbC5jb20+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPj4gLS0tDQo+PiBD
aGFuZ2VzIGluIHYyOg0KPj4gLSBSZXN0b3JlIGJlaGF2aW9yIG9mIHJldHVybmluZyAtRU5PREVW
IHdoZW4gdGhlIGdldF93bWlvYmpfcG9pbnRlcigpIGNhbGwNCj4+ICAgZm9yIGluc3RhbmNlX2lk
ID09IDAgcmV0dXJucyBOVUxMLiBPdGhlcndpc2UNCj4+ICAgL3N5cy9jbGFzcy9maXJtd2FyZS1h
dHRyaWJ1dGVzL2RlbGwtd21pLXN5c21hbiB3aWxsIGdldCBjcmVhdGVkIHdpdGggYW4NCj4+ICAg
ZW1wdHkgYXR0cmlidXRlcyBkaXIgKGVtcHR5IGV4Y2VwdCBmb3IgcGVuZGluZ19yZWJvb3QgYW5k
IA0KPj4gcmVzZXRfYmlvcykNCg0KPlNvIHRoZSByZWFzb24gZm9yIHRoaXMgY2hhbmdlIGluIHYy
IGlzIHRoYXQgdGVzdGluZyBvbiBhIERlbGwgTGF0aXR1ZGUgRTU1NzA6DQo+aHR0cHM6Ly9idWd6
aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xOTM2MTcxDQo+DQo+V2l0aCB2MSBvZiB0
aGlzIHBhdGNoIHJlc3VsdHMgaW4gYW4gZW1wdHkgYXR0cmlidXRlcyBkaXIgKGVtcHR5IGV4Y2Vw
dCBmb3IgcGVuZGluZ19yZWJvb3QgYW5kIHJlc2V0X2Jpb3MpLCBpbnRlcmVzdGluZ2x5IGVub3Vn
aCB0aGVyZSBhcmUgYm90aCBTeXN0ZW0gYW5kIEFkbWluIGRpcnMgY3JlYXRlZCB1bmRlciBBdXRo
ZW50aWNhdGlvbiwgc28gdGhlIEJJT1Mgb2YgdGhpcyBkZXZpY2Ugc2VlbXMgdG8gaGF2ZSB0aGUg
R1VJRHMgZm9yIGJvdGggdGhlIGF0dHJpYnV0ZXMgYW5kIHRoZSBhdXRoZW50aWNhdGlvbiBpbnRl
cmZhY2VzOyBhbmQgaXQgPmhhcyB0aGUgMiBzdGFuZGFyZCBhdXRoZW50aWNhdGlvbiBvYmplY3Rz
LCB0aGVvcmV0aWNhbGx5IGFsbG93aW5nIGNoYW5naW5nIHRoZSBCSU9TIHBhc3N3b3JkcyBmcm9t
IHdpdGhpbiBMaW51eCwgYnV0IGl0IGRvZXMgbm90IGFkdmVydGlzZSBhbnkgYXR0cmlidXRlcyB3
aGljaCBjYW4gYmUgY2hhbmdlZC4NCj4NCj5XaXRoIHRoZSBuZXcgdjIgcGF0Y2gsIHRoZSBkcml2
ZXIgd2lsbCBub3cgc2ltcGx5IHJlZnVzZSB0byBsb2FkIChhbmQgaXQgc2hvdWxkIG5vIGxvbmdl
ciBjcmFzaCBkdXJpbmcgY2xlYW51cCBiZWNhdXNlIG9mIHRoZSBvdGhlciBwYXRjaGVzKS4NCj4N
Cj5CdXQgSSB3b25kZXIgd2hhdCBpcyBhY3R1YWxseSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaGVy
ZSA/ICBBcmd1YWJseSBiZWluZyBhYmxlIHRvIGNoYW5nZSB0aGUgQklPUyBwYXNzd29yZHMgaGFz
IHNvbWUgdmFsdWUgb24gaXRzIG93biA/DQo+DQo+TWFyaW8sIHdoYXQgaXMgeW91ciB0YWtlIG9u
IHRoaXM/DQoNCklkZWFsbHkgd2Ugc2hvdWxkIG5vdCBiZSBoaXR0aW5nIHRoaXMgY29kZSBwYXRo
IGF0IGFsbC4gSSBhbSB3b3JraW5nIHdpdGggcGVycnkgdG8gc2VlIHRoZSByZXN1bHRzIGFmdGVy
IGFwcGx5aW5nIHRoZSBwYXRjaGVzIG9uIHRoZSBzeXN0ZW0uDQpJZiB0aGlzIGlzIGJlaGF2aW9y
IHdlIGNvbnNpc3RlbnRseSBzZWUgb24gb2xkZXIgc3lzdGVtIEJJT1MgdGhlbiB3ZSB3aWxsIHBh
dGNoIHRoZSBjb2RlIHRvIGF2b2lkIGNvZGUgcGF0aCBhbmQgYmFpbCBvdXQgZWFybHkgbm90IGxv
YWRpbmcgdGhlIGRyaXZlci4NCg0KQWxzbyBJIHdhcyBub3QgY2MnZWQgb24gdGhlIG1haWwgdGhy
ZWFkcyB3aGVyZSB0aGUgYnVncyB3ZXJlIGRpc2N1c3NlZCBzbyBnb2luZyBmdXJ0aGVyIHBsZWFz
ZSBhZGQgbWUgYW5kIERpdnlhIGZvciByZXBvcnRpbmcgYW55IGlzc3VlcyBvbiB0aGUgZHJpdmVy
DQoNClJlZ2FyZHMsDQpQcmFzYW50aCBLIFMgUg0KDQoNCj5SZWdhcmRzLA0KPg0KPkhhbnMNCg0K
DQoNCj4+IC0tLQ0KPj4gIC4uLi94ODYvZGVsbC9kZWxsLXdtaS1zeXNtYW4vc3lzbWFuLmMgICAg
ICAgICB8IDMyICsrKysrKysrKysrKysrKystLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGxhdGZvcm0veDg2L2RlbGwvZGVsbC13bWktc3lzbWFuL3N5c21hbi5jIA0KPj4gYi9kcml2ZXJz
L3BsYXRmb3JtL3g4Ni9kZWxsL2RlbGwtd21pLXN5c21hbi9zeXNtYW4uYw0KPj4gaW5kZXggNzQx
MGNjYWU2NTBjLi5hOTBhZTZiYTRhNzMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9kZWxsL2RlbGwtd21pLXN5c21hbi9zeXNtYW4uYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0
Zm9ybS94ODYvZGVsbC9kZWxsLXdtaS1zeXNtYW4vc3lzbWFuLmMNCj4+IEBAIC0zOTksNiArMzk5
LDcgQEAgc3RhdGljIGludCBpbml0X2Jpb3NfYXR0cmlidXRlcyhpbnQgYXR0cl90eXBlLCBjb25z
dCBjaGFyICpndWlkKQ0KPj4gIAl1bmlvbiBhY3BpX29iamVjdCAqb2JqID0gTlVMTDsNCj4+ICAJ
dW5pb24gYWNwaV9vYmplY3QgKmVsZW1lbnRzOw0KPiA+IAlzdHJ1Y3Qga3NldCAqdG1wX3NldDsN
Cj4gPisJaW50IG1pbl9lbGVtZW50czsNCj4gPg0KPj4gIAkvKiBpbnN0YW5jZV9pZCBuZWVkcyB0
byBiZSByZXNldCBmb3IgZWFjaCB0eXBlIEdVSUQNCj4+ICAJICogYWxzbywgaW5zdGFuY2UgSURz
IGFyZSB1bmlxdWUgd2l0aGluIEdVSUQgYnV0IG5vdCBhY3Jvc3MgQEAgDQo+PiAtNDA5LDE0ICs0
MTAsMzggQEAgc3RhdGljIGludCBpbml0X2Jpb3NfYXR0cmlidXRlcyhpbnQgYXR0cl90eXBlLCBj
b25zdCBjaGFyICpndWlkKQ0KPj4gIAlyZXR2YWwgPSBhbGxvY19hdHRyaWJ1dGVzX2RhdGEoYXR0
cl90eXBlKTsNCj4+ICAJaWYgKHJldHZhbCkNCj4+ICAJCXJldHVybiByZXR2YWw7DQo+PiArDQo+
PiArCXN3aXRjaCAoYXR0cl90eXBlKSB7DQo+PiArCWNhc2UgRU5VTToJbWluX2VsZW1lbnRzID0g
ODsJYnJlYWs7DQo+PiArCWNhc2UgSU5UOgltaW5fZWxlbWVudHMgPSA5OwlicmVhazsNCj4+ICsJ
Y2FzZSBTVFI6CW1pbl9lbGVtZW50cyA9IDg7CWJyZWFrOw0KPj4gKwljYXNlIFBPOgltaW5fZWxl
bWVudHMgPSA0OwlicmVhazsNCj4+ICsJZGVmYXVsdDoNCj4+ICsJCXByX2VycigiRXJyb3I6IFVu
a25vd24gYXR0cl90eXBlOiAlZFxuIiwgYXR0cl90eXBlKTsNCj4+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPj4gKwl9DQo+PiArDQo+PiAgCS8qIG5lZWQgdG8gdXNlIHNwZWNpZmljIGluc3RhbmNlX2lk
IGFuZCBndWlkIGNvbWJpbmF0aW9uIHRvIGdldCByaWdodCBkYXRhICovDQo+PiAgCW9iaiA9IGdl
dF93bWlvYmpfcG9pbnRlcihpbnN0YW5jZV9pZCwgZ3VpZCk7DQo+PiAtCWlmICghb2JqIHx8IG9i
ai0+dHlwZSAhPSBBQ1BJX1RZUEVfUEFDS0FHRSkNCj4+ICsJaWYgKCFvYmopDQo+PiAgCQlyZXR1
cm4gLUVOT0RFVjsNCj4+IC0JZWxlbWVudHMgPSBvYmotPnBhY2thZ2UuZWxlbWVudHM7DQo+PiAg
DQo+PiAgCW11dGV4X2xvY2soJndtaV9wcml2Lm11dGV4KTsNCj4+IC0Jd2hpbGUgKGVsZW1lbnRz
KSB7DQo+PiArCXdoaWxlIChvYmopIHsNCj4+ICsJCWlmIChvYmotPnR5cGUgIT0gQUNQSV9UWVBF
X1BBQ0tBR0UpIHsNCj4+ICsJCQlwcl9lcnIoIkVycm9yOiBFeHBlY3RlZCBBQ1BJLXBhY2thZ2Ug
dHlwZSwgZ290OiAlZFxuIiwgb2JqLT50eXBlKTsNCj4+ICsJCQlyZXR2YWwgPSAtRUlPOw0KPj4g
KwkJCWdvdG8gZXJyX2F0dHJfaW5pdDsNCj4+ICsJCX0NCj4+ICsNCj4+ICsJCWlmIChvYmotPnBh
Y2thZ2UuY291bnQgPCBtaW5fZWxlbWVudHMpIHsNCj4+ICsJCQlwcl9lcnIoIkVycm9yOiBBQ1BJ
LXBhY2thZ2UgZG9lcyBub3QgaGF2ZSBlbm91Z2ggZWxlbWVudHM6ICVkIDwgJWRcbiIsDQo+PiAr
CQkJICAgICAgIG9iai0+cGFja2FnZS5jb3VudCwgbWluX2VsZW1lbnRzKTsNCj4+ICsJCQlnb3Rv
IG5leHRvYmo7DQo+PiArCQl9DQo+PisNCj4+ICsJCWVsZW1lbnRzID0gb2JqLT5wYWNrYWdlLmVs
ZW1lbnRzOw0KPj4gKw0KPj4gIAkJLyogc2FuaXR5IGNoZWNraW5nICovDQo+PiAgCQlpZiAoZWxl
bWVudHNbQVRUUl9OQU1FXS50eXBlICE9IEFDUElfVFlQRV9TVFJJTkcpIHsNCj4+ICAJCQlwcl9k
ZWJ1ZygiaW5jb3JyZWN0IGVsZW1lbnQgdHlwZVxuIik7IEBAIC00ODEsNyArNTA2LDYgQEAgc3Rh
dGljIA0KPj4gaW50IGluaXRfYmlvc19hdHRyaWJ1dGVzKGludCBhdHRyX3R5cGUsIGNvbnN0IGNo
YXIgKmd1aWQpDQo+PiAJCWtmcmVlKG9iaik7DQo+PiAgCQlpbnN0YW5jZV9pZCsrOw0KPj4gIAkJ
b2JqID0gZ2V0X3dtaW9ial9wb2ludGVyKGluc3RhbmNlX2lkLCBndWlkKTsNCj4+IC0JCWVsZW1l
bnRzID0gb2JqID8gb2JqLT5wYWNrYWdlLmVsZW1lbnRzIDogTlVMTDsNCj4+IAl9DQo+PiAgDQo+
PiAgCW11dGV4X3VubG9jaygmd21pX3ByaXYubXV0ZXgpOw0KPj4gDQoNCg==
