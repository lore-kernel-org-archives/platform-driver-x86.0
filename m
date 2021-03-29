Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE7DC433E2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Mar 2021 16:01:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C70B61969
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Mar 2021 16:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhC2QB0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 29 Mar 2021 12:01:26 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:43188 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229502AbhC2QAz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Mar 2021 12:00:55 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12TFv0X5009155;
        Mon, 29 Mar 2021 12:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=yMBmJD1Xb9JbVyLXLZEe8TBHBJUfbyjfnWaLq3e5RKc=;
 b=czCSbcze2RUUv7Sgb6EniDpziKjiNS8mGNaV1U7tARtSaZ/ZEmS3HnSwDMqpZZ0T4JII
 TdOjzvNc/wslw8ZmVfKmW93yXn2Xke2i3bdspkP66Oc8VUGhvj/UNAsgL82B9+N7yrnW
 th9b1wu/TOfd+Cp9te746DBmJPk2hPzgOq8KBGUzusQ2AG0HCwjspKIwt46ltNv8Kcvf
 aUP3ZsyNrKag7DQ0qEjeec3rdSo0c8qh4oR14nbutPu0f6Dh2e6DeQKUkYg/hpnDEgWb
 l/L85HJ1JsIccZJNsJ6/+7FLdtRu56ms1O0iqWLDZV6XSFJtsP3ob2Ti6G8NNSf2DoxL wg== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 37j01kw6g1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Mar 2021 12:00:37 -0400
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12TFxgvb062178;
        Mon, 29 Mar 2021 12:00:36 -0400
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by mx0a-00154901.pphosted.com with ESMTP id 37jhqxj2u1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 29 Mar 2021 12:00:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqLWRbavHO4pp41XEwKeWycv3sAUllwkezP9vtx5e2SF1MCez7SZa0JnC+/qswTQvTCCOulrowYGiqi69S7Fv2yXb8nr0xcBFzUSwP4nw2eBCn9vFVIW63R7O7Hdbx/ULfwFeoLBETkJWgtu3xIbj7qxrqS6Y/5Qu4EzG3VmDxSPBQslaqWTUOtaVTyTHIVGFs32Cnv6CHD1fqf/ofGUYiQ3301EIleDg97YDFq0a1ryvXnHfJ32EcJ/7jNZpsjhzEJ1Xg+8H+P+4NDOmp3eSWM7/Lild+yBjr7WCLyJe44G7HcAoYgmPPT64nAvP3bW16xlvILFF7tu/LLtd1ITvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMBmJD1Xb9JbVyLXLZEe8TBHBJUfbyjfnWaLq3e5RKc=;
 b=d2n12PKeQ187snNcLRZEBlMM5HnwO6MYBH5D5mq0WZunCnuDReABSX4gpBJ6L6wAn/wK32AbzvKopHviNZsowB2b9i+Z/Qgb1tDEb6S7L3TuHLu3wX7K6RElmfxXG1MnwqWTeDQFzehvRGU2dVmGro9K4Hbfd5K7G627y+NszDpynHlaeqn2ROc0GT5nge4YJ6bPDh/41sHARBpWQiNODIeW6gCf9olOwiqaYVCntPQSVNumD/66rQntVH9xkGPNa2T3vcSA2s09f40TM93R/KQ385hj0sneEaDoiAP89QRFaSlY4FdGXLsnbLLdAaQ6rjJPJMTqf3RRkBxAzpnLaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3676.namprd19.prod.outlook.com (2603:10b6:5:1dc::25)
 by DM6PR19MB4296.namprd19.prod.outlook.com (2603:10b6:5:2bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 16:00:34 +0000
Received: from DM6PR19MB3676.namprd19.prod.outlook.com
 ([fe80::249f:83fe:c8e3:4be3]) by DM6PR19MB3676.namprd19.prod.outlook.com
 ([fe80::249f:83fe:c8e3:4be3%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 16:00:34 +0000
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
Thread-Index: AQHXHk4Y61NlmdLG8k6LBRkRDirCoqqOYOcAgAgMELCAABTYgIAEqhug
Date:   Mon, 29 Mar 2021 16:00:33 +0000
Message-ID: <DM6PR19MB3676CB7EC5181819843A75DF827E9@DM6PR19MB3676.namprd19.prod.outlook.com>
References: <20210321121607.35717-1-hdegoede@redhat.com>
 <bdbbe7e6-7a6b-fa9d-426a-e88135e3c7f5@redhat.com>
 <DM6PR19MB3676F7901C6D1A778396E6DF82619@DM6PR19MB3676.namprd19.prod.outlook.com>
 <69d0c17a-a24b-6cf3-9acc-e6c4398c9a9c@redhat.com>
In-Reply-To: <69d0c17a-a24b-6cf3-9acc-e6c4398c9a9c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Prasanth_Ksr@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-29T16:00:31.0638902Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=b9ed71a8-7cf6-4f27-a266-4cd7f85a1f0d;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [49.207.201.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60323a0f-7390-4d0d-179a-08d8f2cbc964
x-ms-traffictypediagnostic: DM6PR19MB4296:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR19MB4296F4E22F194F58A23352B2827E9@DM6PR19MB4296.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7N/jS7m3eoG0MeWovltthhvPVi3kgCfgUNvpjCtksffNIuUzG4VGsHtgFqiu90DbSX9gJJzVsYIXuBRArfEycDh5bx8mc1/SRk5YM3fz903acrs2jiip7XyTfQ7qCOwBaVxenQXbst9lesx0pc2fS4AG0E/oAwfbfe9oDjVR59qaRSVA1aXEN2cch5TfGwfSGpo9g/tfPflWZOdI3CzaIuMCH+Mevm7TVJt4BpgrMcIT3C/6JzWYY101/I8Klv0/+gxNz3P+qCQS8Pz72eJW5Xw2iE6pw0P4qeQjMk/S0JtTxZn3SUR556uTHyuLc4LOPGGKnEz17SppH82wNLyXWvirzFhbVroCqq6DxwNuo4v1UGVvDCiu8PqdxHFKD/U+mPZpw2Lu0v2pv2p9jHzJwhKAMmCxcaangvoJg6OyU/oYD95mf5ZJ2D1YI6EA4VEZGSOKaf7FIgfmr+zEjS0z6nk9/gi/DzuTWvBrrV7BSMNJk8eeFLJj1fDx+6dmeSjXvQ1IPnqsPURd5DktUtVZjaXa7X0fND5Sop/+/402IapyBI2eVr9Ow5wAupjxI1950B2tTaetM3JAEvqAaFPj+Lplq7TRm94GdoJV8ykBSpdI4HmHLTPD8RUma9VRK2pm/yLs5zF25ww58uC1Z8BlLFiMZzZhbsuH/LfDwlqdVLM5jAlYkK6HQcPuk4l3n+SiAi0ubvsEVYmagllEy94YeTEJS74dcQ0FOs45sCLNvgU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB3676.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(55016002)(38100700001)(9686003)(186003)(26005)(71200400001)(316002)(2906002)(7696005)(8676002)(786003)(52536014)(4326008)(54906003)(8936002)(966005)(110136005)(55236004)(478600001)(53546011)(6506007)(107886003)(66476007)(83380400001)(33656002)(66556008)(5660300002)(66946007)(76116006)(64756008)(86362001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?K2N1dUJZOGQ2OVRxejNBRUpHcVRDa2JDNmVnYWZLTzdtODFITGtScnJzbXBD?=
 =?utf-8?B?SXBFSFVMaUNkZE0wUUN6b1NJUjRiNXZoS0ptMG9wNlBzN0pFV0xBZnFVOGl0?=
 =?utf-8?B?QWhQZjJqQXZVbHFWMFFEK1JyK3JsanBoR1ArRndVWlFUQ09XTW12TXhaLysy?=
 =?utf-8?B?NDdSak03WjZuUlY0eUVtNmhXRVN0NVJlb2gyb2RaaEhGVUVUYmpTOVM1bTZI?=
 =?utf-8?B?clJqNHBMMkgyOEhmcjJpTmJFVXVlQi9TR01oVkx5dTA4b2hmVHZZN3JJL21N?=
 =?utf-8?B?ZThpNS9tWFBkUzlGeEZpbnJWK3k4R0FTUU5vRGxsTXArRlNKaytQam1sT0Vj?=
 =?utf-8?B?NVk3NGQ1MkY0VzNYbEtuUmVsSXdTVUpITENJNmN0NnRhenMwVEkzNEVKMFcv?=
 =?utf-8?B?aUJJM0hERTlMZUJXUkhVbEFwWVlGanlkWjJEdDdEaThRb2kvRXYxQkx4bXht?=
 =?utf-8?B?a0xseCs0ekxMSFBzNzQ0Z0ZMMzdZZVorMUEyczE4N252eHloK2sxQVA3Z0h2?=
 =?utf-8?B?R3ZNS1E3MUJSREdrbTV0UEpaajczdnZ3RFpscHdRMmUxbnlPNjdQY2xMS25M?=
 =?utf-8?B?bVNUdkVlK3A2SDZTRmxadzlLa3Uwdlo4ZWRYNElTUzNRRHpET2FRZUd5R1pw?=
 =?utf-8?B?M2F4M0tTMW1TNjZ2eFdncU1uU282UHd2V2g2UU5Rd2tFclFuL0NBQU1FMVFJ?=
 =?utf-8?B?bWtBZTZkWGYvZkdVMVRFYzMyb0t4TDROUnVCRnAwNVVLdWIxVWlRNnhreVNw?=
 =?utf-8?B?Y0NMY2U1MXZNMGxZWjI2NDM2ci9DVTZncFM1ajh3YWcyck9zY0dCUnZza1Vn?=
 =?utf-8?B?M2FrZnhiQmltenJTT0QzZEVFQ3VpcmVhNnNTWXg4enczUEhHY0tyekEyaXdC?=
 =?utf-8?B?bWdkT0JsRmdNTFJlRWE3TlcvRjdIK2QxQ2VCSkU5dHFoN2xyNG10Vzl6WC8r?=
 =?utf-8?B?MGVrTk93UUg2SzhjNEJlMk1Tam5GWUxPbGE2ZEdHc0pBaHVDTm1MZUdtSUZI?=
 =?utf-8?B?dHdOcUEyZ3pIaENBWFF2MUFTcHhMZFlZMmxBZ3kvZDhYQU9tNHF0Wmt6dWtJ?=
 =?utf-8?B?MXRKUk9abXZTeDAxRHBYU2o0Wm9pZkxDcEp1MGxYenJxaUg0UGJYVkloUGVx?=
 =?utf-8?B?YlNlVk1LQ0hQSE1mYzgvdGdvSlFRdDBJOU85Q1JMQ3JYbnA0Wm9pSmRyK1VT?=
 =?utf-8?B?WHRCZGwxbVBNeFl2NjRVbjk2TXIySXd5NXg3U0pDeENDMno3aG55VGFXL1pH?=
 =?utf-8?B?YnJUaWMyQjRWQWFnY2ltVHNrZ2JvK1p4anBDMWtHQlNIUkoxaFJJVDhjUGZS?=
 =?utf-8?B?V2RBNE9ubG43NWttalcxSmFtSDhYMEZlZ3pUcHBtcWpZN0pXeHQ2QnF1cDV6?=
 =?utf-8?B?RC9KS0xQNzJJV2Q5K1lHRndHR2F1bFRWOEY3QXdGdXR6WDZPalNFb0JjRVZN?=
 =?utf-8?B?NzF6ZndHMFRJMmpiMEFqeXB2OVhMUWdNS3BRNG82YU1FcjhQVEdYLzNORzJw?=
 =?utf-8?B?SnhJd1RZRTlGclllenJXc0pUVVYva1dFME83blBpMTZaT2xySDBkalRwOGJJ?=
 =?utf-8?B?a2xUWWtIMjFPS1NUY2FSQnNlaGlQSDJaYjlidXdIRkZOVnE0eS9aN2JqcnRV?=
 =?utf-8?B?cC9OdGtuWDZJcVdpNWJCVVlSVHczSkI1THhiVDB3VFYrODl6Z3E1RnlKblp6?=
 =?utf-8?B?ZE9IZ2c5ekVFL2ZQSlB2UFYxaTB3cEdIVGtGbi9GbTlhazlYVFErV0ZsdVQ2?=
 =?utf-8?Q?elW5v6o2B/hxREXKOwrF3cyrS6wk2l0Bp0w2U2t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3676.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60323a0f-7390-4d0d-179a-08d8f2cbc964
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 16:00:34.2998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5lptKmHWRSxg/oWkdCU2gNqN/zgX+SVyMlsvTDYJWjT7XX70EirHf/6KUSg8iQa/Hnj6AOCxn+QZ8t+RVkObg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4296
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-29_10:2021-03-26,2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103290117
X-Proofpoint-ORIG-GUID: Nf2pSWV5L0559wiegruaX8-4CJa0SMFK
X-Proofpoint-GUID: Nf2pSWV5L0559wiegruaX8-4CJa0SMFK
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290117
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2Vk
ZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXJjaCAyNiwgMjAyMSAx
MDoxNCBQTQ0KPiBUbzogS3NyLCBQcmFzYW50aDsgTWFyayBHcm9zczsgQW5keSBTaGV2Y2hlbmtv
DQo+IENjOiBMaW1vbmNpZWxsbywgTWFyaW87IEJoYXJhdGhpLCBEaXZ5YTsgQWxleGFuZGVyIE5h
dW1hbm47IHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZzsgWXVhbiwgUGVy
cnkNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gcGxhdGZvcm0veDg2OiBkZWxsLXdtaS1zeXNt
YW46IE1ha2UNCj4gaW5pdF9iaW9zX2F0dHJpYnV0ZXMoKSBBQ1BJIG9iamVjdCBwYXJzaW5nIG1v
cmUgcm9idXN0DQo+IA0KPiANCj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiANCj4gSGksDQo+IA0KPiBP
biAzLzI2LzIxIDQ6NDAgUE0sIEtzciwgUHJhc2FudGggd3JvdGU6DQo+ID4NCj4gPg0KPiA+IEhp
LA0KPiA+DQo+ID4gW0VYVEVSTkFMIEVNQUlMXQ0KPiA+DQo+ID4+IEhpLA0KPiA+Pg0KPiA+PiBP
biAzLzIxLzIxIDE6MTYgUE0sIEhhbnMgZGUgR29lZGUgd3JvdGU6DQo+ID4+PiBNYWtlIGluaXRf
Ymlvc19hdHRyaWJ1dGVzKCkgQUNQSSBvYmplY3QgcGFyc2luZyBtb3JlIHJvYnVzdDoNCj4gPj4+
IDEuIEFsd2F5cyBjaGVjayB0aGF0IHRoZSB0eXBlIG9mIHRoZSByZXR1cm4gQUNQSSBvYmplY3Qg
aXMgcGFja2FnZSwNCj4gcmF0aGVyDQo+ID4+PiAgICB0aGVuIG9ubHkgY2hlY2tpbmcgdGhpcyBm
b3IgaW5zdGFuY2VfaWQgPT0gMCAyLiBDaGVjayB0aGF0IHRoZQ0KPiA+Pj4gcGFja2FnZSBoYXMg
dGhlIG1pbmltdW0gYW1vdW50IG9mIGVsZW1lbnRzIHdoaWNoIHdpbGwNCj4gPj4+ICAgIGJlIGNv
bnN1bWVkIGJ5IHRoZSBwb3B1bGF0ZV9mb29fZGF0YSgpIGZvciB0aGUgYXR0cl90eXBlDQo+ID4+
Pg0KPiA+Pj4gTm90ZS9UT0RPOiBUaGUgcG9wdWxhdGVfZm9vX2RhdGEoKSBmdW5jdGlvbnMgc2hv
dWxkIGFsc28gYmUgbWFkZQ0KPiA+Pj4gbW9yZSByb2J1c3QuIFRoZSBzaG91bGQgY2hlY2sgdGhl
IHR5cGUgb2YgZWFjaCBvZiB0aGUgZWxlbWVudHMNCj4gPj4+IG1hdGNoZXMgdGhlIHR5cGUgd2hp
Y2ggdGhleSBleHBlY3QgYW5kIGluIGNhc2Ugb2YNCj4gPj4+IHBvcHVsYXRlX2VudW1fZGF0YSgp
DQo+ID4+PiBvYmotPnBhY2thZ2UuY291bnQgc2hvdWxkIGJlIHBhc3NlZCB0byBpdCBhcyBhbiBh
cmd1bWVudCBhbmQgaXQNCj4gPj4+IG9iai0+c2hvdWxkDQo+ID4+PiByZS1jaGVjayB0aGlzIGl0
c2VsZiBzaW5jZSBpdCBjb25zdW1lIGEgdmFyaWFibGUgbnVtYmVyIG9mIGVsZW1lbnRzLg0KPiA+
Pj4NCj4gPj4+IEZpeGVzOiBlOGE2MGFhNzQwNGIgKCJwbGF0Zm9ybS94ODY6IEludHJvZHVjZSBz
dXBwb3J0IGZvciBTeXN0ZW1zDQo+ID4+PiBNYW5hZ2VtZW50IERyaXZlciBvdmVyIFdNSSBmb3Ig
RGVsbCBTeXN0ZW1zIikNCj4gPj4+IENjOiBEaXZ5YSBCaGFyYXRoaSA8RGl2eWFfQmhhcmF0aGlA
ZGVsbC5jb20+DQo+ID4+PiBDYzogTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxv
QGRlbGwuY29tPg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVA
cmVkaGF0LmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4gPj4+IC0gUmVz
dG9yZSBiZWhhdmlvciBvZiByZXR1cm5pbmcgLUVOT0RFViB3aGVuIHRoZQ0KPiBnZXRfd21pb2Jq
X3BvaW50ZXIoKSBjYWxsDQo+ID4+PiAgIGZvciBpbnN0YW5jZV9pZCA9PSAwIHJldHVybnMgTlVM
TC4gT3RoZXJ3aXNlDQo+ID4+PiAgIC9zeXMvY2xhc3MvZmlybXdhcmUtYXR0cmlidXRlcy9kZWxs
LXdtaS1zeXNtYW4gd2lsbCBnZXQgY3JlYXRlZCB3aXRoDQo+IGFuDQo+ID4+PiAgIGVtcHR5IGF0
dHJpYnV0ZXMgZGlyIChlbXB0eSBleGNlcHQgZm9yIHBlbmRpbmdfcmVib290IGFuZA0KPiA+Pj4g
cmVzZXRfYmlvcykNCj4gPg0KPiA+PiBTbyB0aGUgcmVhc29uIGZvciB0aGlzIGNoYW5nZSBpbiB2
MiBpcyB0aGF0IHRlc3Rpbmcgb24gYSBEZWxsIExhdGl0dWRlIEU1NTcwOg0KPiA+PiBodHRwczov
L2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE5MzYxNzENCj4gPj4NCj4gPj4g
V2l0aCB2MSBvZiB0aGlzIHBhdGNoIHJlc3VsdHMgaW4gYW4gZW1wdHkgYXR0cmlidXRlcyBkaXIg
KGVtcHR5IGV4Y2VwdCBmb3INCj4gcGVuZGluZ19yZWJvb3QgYW5kIHJlc2V0X2Jpb3MpLCBpbnRl
cmVzdGluZ2x5IGVub3VnaCB0aGVyZSBhcmUgYm90aA0KPiBTeXN0ZW0gYW5kIEFkbWluIGRpcnMg
Y3JlYXRlZCB1bmRlciBBdXRoZW50aWNhdGlvbiwgc28gdGhlIEJJT1Mgb2YgdGhpcw0KPiBkZXZp
Y2Ugc2VlbXMgdG8gaGF2ZSB0aGUgR1VJRHMgZm9yIGJvdGggdGhlIGF0dHJpYnV0ZXMgYW5kIHRo
ZQ0KPiBhdXRoZW50aWNhdGlvbiBpbnRlcmZhY2VzOyBhbmQgaXQgPmhhcyB0aGUgMiBzdGFuZGFy
ZCBhdXRoZW50aWNhdGlvbiBvYmplY3RzLA0KPiB0aGVvcmV0aWNhbGx5IGFsbG93aW5nIGNoYW5n
aW5nIHRoZSBCSU9TIHBhc3N3b3JkcyBmcm9tIHdpdGhpbiBMaW51eCwgYnV0IGl0DQo+IGRvZXMg
bm90IGFkdmVydGlzZSBhbnkgYXR0cmlidXRlcyB3aGljaCBjYW4gYmUgY2hhbmdlZC4NCj4gPj4N
Cj4gPj4gV2l0aCB0aGUgbmV3IHYyIHBhdGNoLCB0aGUgZHJpdmVyIHdpbGwgbm93IHNpbXBseSBy
ZWZ1c2UgdG8gbG9hZCAoYW5kIGl0DQo+IHNob3VsZCBubyBsb25nZXIgY3Jhc2ggZHVyaW5nIGNs
ZWFudXAgYmVjYXVzZSBvZiB0aGUgb3RoZXIgcGF0Y2hlcykuDQo+ID4+DQo+ID4+IEJ1dCBJIHdv
bmRlciB3aGF0IGlzIGFjdHVhbGx5IHRoZSByaWdodCB0aGluZyB0byBkbyBoZXJlID8gIEFyZ3Vh
Ymx5IGJlaW5nDQo+IGFibGUgdG8gY2hhbmdlIHRoZSBCSU9TIHBhc3N3b3JkcyBoYXMgc29tZSB2
YWx1ZSBvbiBpdHMgb3duID8NCj4gPj4NCj4gPj4gTWFyaW8sIHdoYXQgaXMgeW91ciB0YWtlIG9u
IHRoaXM/DQo+ID4NCj4gPiBJZGVhbGx5IHdlIHNob3VsZCBub3QgYmUgaGl0dGluZyB0aGlzIGNv
ZGUgcGF0aCBhdCBhbGwuIEkgYW0gd29ya2luZyB3aXRoDQo+IHBlcnJ5IHRvIHNlZSB0aGUgcmVz
dWx0cyBhZnRlciBhcHBseWluZyB0aGUgcGF0Y2hlcyBvbiB0aGUgc3lzdGVtLg0KPiA+IElmIHRo
aXMgaXMgYmVoYXZpb3Igd2UgY29uc2lzdGVudGx5IHNlZSBvbiBvbGRlciBzeXN0ZW0gQklPUyB0
aGVuIHdlIHdpbGwNCj4gcGF0Y2ggdGhlIGNvZGUgdG8gYXZvaWQgY29kZSBwYXRoIGFuZCBiYWls
IG91dCBlYXJseSBub3QgbG9hZGluZyB0aGUgZHJpdmVyLg0KPiANCj4gV2l0aCB2MiBvZiBteSBw
YXRjaGVzICh3aGljaCBoYXZlIGJlZW4gbWVyZ2VkKSB3ZSBkbyBiYWlsIG91dCBhcyBzb29uIGFz
IGl0DQo+IGlzIGNsZWFyIHRoYXQgdGhlcmUgaXMgbm8gZW51bS10eXBlICgqKSBhdHRyaWJ1dGUg
d2l0aCBpbnN0YW5jZV9pZCAwLiBUaGF0IGlzDQo+IHByZXR0eS1tdWNoIHRoZSBlYXJsaWVzdCB0
aGF0IHdlIGNhbiBiYWlsIGFuZCB0aGF0IHdvcmtzIGZpbmUuDQo+IA0KPiBXaGF0IEkgd2FzIHdv
bmRlcmluZyBpcyBpZiB0aGF0IGlzIHRoZSByaWdodCB0aGluZyB0byBkbyB0aG91Z2guIE9uIHRo
ZSBFNTU3MA0KPiB0aGVyZSBzZWVtIHRvIGJlIG5vIGVudW0vaW50L3N0ciBhdHRyaWJ1dGVzIGF0
IGFsbCBidXQgd2hhdCBpZiB0aGVyZSBhcmUgZW51bQ0KPiArIGludCBhdHRyaWJ1dGVzICsgbm8g
c3RyIGF0dHJpYnV0ZXMgZm9yIGV4YW1wbGUgPw0KPiANCkl0IHdvdWxkIGJlIHJpZ2h0IHRoaW5n
IHRvIGRvIGJlY2F1c2UgdGhpcyBzY2VuYXJpbyBoYXBwZW5zIGJlY2F1c2Ugb2Ygc29tZSBCSU9T
IGlzc3VlLg0KDQo+IEFsc28gbWF5YmUgdGhlIEJJT1MgcGFzc3dvcmQgaW50ZXJmYWNlIG9uIGl0
cyBvd24sIHdpdGhvdXQgaGF2aW5nIGFueQ0KPiBhdHRyaWJ1dGVzIGF0IGFsbCBoYXMgc29tZSB2
YWx1ZSBieSBpdHNlbGYgPw0KPiANCj4gKikgZW51bXMgYXJlIHRoZSBmaXJzdCB0eXBlIHdlIGNo
ZWNrIGZvcg0KPg0KTm8gdmFsdWUgd2lsbCBiZSBhZGRlZCBiZWNhdXNlIG9mIHRoaXMgYW5kIG1v
cmUgb3ZlciBpIGFtIHN1cmUgZXZlbiB0aGF0IGlzIGJlY2F1c2Ugb2YgYSBidWdneSBCSU9TIHJl
dmlzaW9uIA0KYW5kIHRoZSBpbnRlcmZhY2UgbWlnaHQgbm90IHdvcmsgYXMgZXhwZWN0ZWQuDQog
DQo+ID4gQWxzbyBJIHdhcyBub3QgY2MnZWQgb24gdGhlIG1haWwgdGhyZWFkcyB3aGVyZSB0aGUg
YnVncyB3ZXJlIGRpc2N1c3NlZA0KPiA+IHNvIGdvaW5nIGZ1cnRoZXIgcGxlYXNlIGFkZCBtZSBh
bmQgRGl2eWEgZm9yIHJlcG9ydGluZyBhbnkgaXNzdWVzIG9uDQo+ID4gdGhlIGRyaXZlcg0KPiAN
Cj4gWWVzIHRoYXQgd2FzIG15IG1pc3Rha2UsIHNvcnJ5IGFib3V0IHRoYXQuIEknbGwgbWFrZSBz
dXJlIHRvIENjIERpdnlhIGFuZCB5b3UNCj4gb24gZnV0dXJlIGVtYWlscyBhYm91dCB0aGUgZGVs
bC13bWktc3lzbWFuIGRyaXZlci4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KPiAN
Cj4gDQo+IA0KPiA+Pj4gLS0tDQo+ID4+PiAgLi4uL3g4Ni9kZWxsL2RlbGwtd21pLXN5c21hbi9z
eXNtYW4uYyAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKy0tLQ0KPiA+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsL2RlbGwtd21pLXN5c21hbi9zeXNt
YW4uYw0KPiA+Pj4gYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsL2RlbGwtd21pLXN5c21hbi9z
eXNtYW4uYw0KPiA+Pj4gaW5kZXggNzQxMGNjYWU2NTBjLi5hOTBhZTZiYTRhNzMgMTAwNjQ0DQo+
ID4+PiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsL2RlbGwtd21pLXN5c21hbi9zeXNt
YW4uYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvZGVsbC9kZWxsLXdtaS1zeXNt
YW4vc3lzbWFuLmMNCj4gPj4+IEBAIC0zOTksNiArMzk5LDcgQEAgc3RhdGljIGludCBpbml0X2Jp
b3NfYXR0cmlidXRlcyhpbnQgYXR0cl90eXBlLCBjb25zdA0KPiBjaGFyICpndWlkKQ0KPiA+Pj4g
IAl1bmlvbiBhY3BpX29iamVjdCAqb2JqID0gTlVMTDsNCj4gPj4+ICAJdW5pb24gYWNwaV9vYmpl
Y3QgKmVsZW1lbnRzOw0KPiA+Pj4gCXN0cnVjdCBrc2V0ICp0bXBfc2V0Ow0KPiA+Pj4gKwlpbnQg
bWluX2VsZW1lbnRzOw0KPiA+Pj4NCj4gPj4+ICAJLyogaW5zdGFuY2VfaWQgbmVlZHMgdG8gYmUg
cmVzZXQgZm9yIGVhY2ggdHlwZSBHVUlEDQo+ID4+PiAgCSAqIGFsc28sIGluc3RhbmNlIElEcyBh
cmUgdW5pcXVlIHdpdGhpbiBHVUlEIGJ1dCBub3QgYWNyb3NzIEBADQo+ID4+PiAtNDA5LDE0ICs0
MTAsMzggQEAgc3RhdGljIGludCBpbml0X2Jpb3NfYXR0cmlidXRlcyhpbnQgYXR0cl90eXBlLCBj
b25zdA0KPiBjaGFyICpndWlkKQ0KPiA+Pj4gIAlyZXR2YWwgPSBhbGxvY19hdHRyaWJ1dGVzX2Rh
dGEoYXR0cl90eXBlKTsNCj4gPj4+ICAJaWYgKHJldHZhbCkNCj4gPj4+ICAJCXJldHVybiByZXR2
YWw7DQo+ID4+PiArDQo+ID4+PiArCXN3aXRjaCAoYXR0cl90eXBlKSB7DQo+ID4+PiArCWNhc2Ug
RU5VTToJbWluX2VsZW1lbnRzID0gODsJYnJlYWs7DQo+ID4+PiArCWNhc2UgSU5UOgltaW5fZWxl
bWVudHMgPSA5OwlicmVhazsNCj4gPj4+ICsJY2FzZSBTVFI6CW1pbl9lbGVtZW50cyA9IDg7CWJy
ZWFrOw0KPiA+Pj4gKwljYXNlIFBPOgltaW5fZWxlbWVudHMgPSA0OwlicmVhazsNCj4gPj4+ICsJ
ZGVmYXVsdDoNCj4gPj4+ICsJCXByX2VycigiRXJyb3I6IFVua25vd24gYXR0cl90eXBlOiAlZFxu
IiwgYXR0cl90eXBlKTsNCj4gPj4+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+Pj4gKwl9DQo+ID4+
PiArDQo+ID4+PiAgCS8qIG5lZWQgdG8gdXNlIHNwZWNpZmljIGluc3RhbmNlX2lkIGFuZCBndWlk
IGNvbWJpbmF0aW9uIHRvIGdldCByaWdodA0KPiBkYXRhICovDQo+ID4+PiAgCW9iaiA9IGdldF93
bWlvYmpfcG9pbnRlcihpbnN0YW5jZV9pZCwgZ3VpZCk7DQo+ID4+PiAtCWlmICghb2JqIHx8IG9i
ai0+dHlwZSAhPSBBQ1BJX1RZUEVfUEFDS0FHRSkNCj4gPj4+ICsJaWYgKCFvYmopDQo+ID4+PiAg
CQlyZXR1cm4gLUVOT0RFVjsNCj4gPj4+IC0JZWxlbWVudHMgPSBvYmotPnBhY2thZ2UuZWxlbWVu
dHM7DQo+ID4+Pg0KPiA+Pj4gIAltdXRleF9sb2NrKCZ3bWlfcHJpdi5tdXRleCk7DQo+ID4+PiAt
CXdoaWxlIChlbGVtZW50cykgew0KPiA+Pj4gKwl3aGlsZSAob2JqKSB7DQo+ID4+PiArCQlpZiAo
b2JqLT50eXBlICE9IEFDUElfVFlQRV9QQUNLQUdFKSB7DQo+ID4+PiArCQkJcHJfZXJyKCJFcnJv
cjogRXhwZWN0ZWQgQUNQSS1wYWNrYWdlIHR5cGUsIGdvdDoNCj4gJWRcbiIsIG9iai0+dHlwZSk7
DQo+ID4+PiArCQkJcmV0dmFsID0gLUVJTzsNCj4gPj4+ICsJCQlnb3RvIGVycl9hdHRyX2luaXQ7
DQo+ID4+PiArCQl9DQo+ID4+PiArDQo+ID4+PiArCQlpZiAob2JqLT5wYWNrYWdlLmNvdW50IDwg
bWluX2VsZW1lbnRzKSB7DQo+ID4+PiArCQkJcHJfZXJyKCJFcnJvcjogQUNQSS1wYWNrYWdlIGRv
ZXMgbm90IGhhdmUgZW5vdWdoDQo+IGVsZW1lbnRzOiAlZCA8ICVkXG4iLA0KPiA+Pj4gKwkJCSAg
ICAgICBvYmotPnBhY2thZ2UuY291bnQsIG1pbl9lbGVtZW50cyk7DQo+ID4+PiArCQkJZ290byBu
ZXh0b2JqOw0KPiA+Pj4gKwkJfQ0KPiA+Pj4gKw0KPiA+Pj4gKwkJZWxlbWVudHMgPSBvYmotPnBh
Y2thZ2UuZWxlbWVudHM7DQo+ID4+PiArDQo+ID4+PiAgCQkvKiBzYW5pdHkgY2hlY2tpbmcgKi8N
Cj4gPj4+ICAJCWlmIChlbGVtZW50c1tBVFRSX05BTUVdLnR5cGUgIT0gQUNQSV9UWVBFX1NUUklO
Rykgew0KPiA+Pj4gIAkJCXByX2RlYnVnKCJpbmNvcnJlY3QgZWxlbWVudCB0eXBlXG4iKTsgQEAg
LTQ4MSw3DQo+ICs1MDYsNiBAQCBzdGF0aWMNCj4gPj4+IGludCBpbml0X2Jpb3NfYXR0cmlidXRl
cyhpbnQgYXR0cl90eXBlLCBjb25zdCBjaGFyICpndWlkKQ0KPiA+Pj4gCQlrZnJlZShvYmopOw0K
PiA+Pj4gIAkJaW5zdGFuY2VfaWQrKzsNCj4gPj4+ICAJCW9iaiA9IGdldF93bWlvYmpfcG9pbnRl
cihpbnN0YW5jZV9pZCwgZ3VpZCk7DQo+ID4+PiAtCQllbGVtZW50cyA9IG9iaiA/IG9iai0+cGFj
a2FnZS5lbGVtZW50cyA6IE5VTEw7DQo+ID4+PiAJfQ0KPiA+Pj4NCj4gPj4+ICAJbXV0ZXhfdW5s
b2NrKCZ3bWlfcHJpdi5tdXRleCk7DQo+ID4+Pg0KPiA+DQoNCg==
