Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB60C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Feb 2021 19:44:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A686864E6F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Feb 2021 19:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhBRToO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Feb 2021 14:44:14 -0500
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:24876 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232986AbhBRTXg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Feb 2021 14:23:36 -0500
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11IJMien001524;
        Thu, 18 Feb 2021 14:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=LMaqc8r7HO6JnPW4MYcv4Y8kxC7No5x08PjGg4EhkFg=;
 b=tGoiEzY50qywYtMrfk74yl7faW0TqyVNi8KtqTBTNReFekqZKaqqwtGWXjwd+iB4+rWY
 QT6xKq4MsVH95UOL2+z0q63UjyYtCXlCeJkd6mQ+IJAijaHLRhDWgPLNHQToYj+yCJIz
 MD8LmxYBkCHmC0pcWhNXgxQt7ao24EpWIURpLSj4DcBwbh838rq6ukwuJZBQefup1qqy
 cTtUDILq1EGIWI+p41uTnFXXwqrsrs5fXsR/xmpbEQcvletzG8nT+y85cD2qTcE/7Rnc
 sxd7UNHR24RduR5sVTnypBk5oq3niVrw5YB/jV5AeoMDSQfjDRMFYMH4adF+yGLrL7XN 9g== 
Received: from mx0b-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 36pbhg1hk8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Feb 2021 14:22:44 -0500
Received: from pps.filterd (m0090350.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11IJJo0P001125;
        Thu, 18 Feb 2021 14:22:43 -0500
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by mx0b-00154901.pphosted.com with ESMTP id 36pvuw4j4u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Feb 2021 14:22:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gfw7oxWG+VncYXhAPJ7q9bvJGARJv993s2WltKyVHLK9RybCtV4i/vlV/ojrNuzCXaNdSV1xFpcYOwPazPJCoY0s8Q+Y23OOJc0HSjb2rGkZRyvhDBYAuJ3hLqU2l5PFHyQRHIHzRSkcu7JEzsWNK4mC2ate24yIA8R7OrFPkg1N4P8s0+YyLzXWFySyyi/FOvUaIOIUF3PclBZROfy58cR+uGbPUqkkw1Vy3jnnnTQ/Od+DDqofztrEEy3U7XtVqFPZBmNfETnJ2xS2x3D4EFhQWAuTidCuu4LnbGC66YY2AVYIgb3NxbQk4S3Mr1XLYhM+4L79igrCp+cVTvQsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMaqc8r7HO6JnPW4MYcv4Y8kxC7No5x08PjGg4EhkFg=;
 b=LnZueHG+xOEy45Y1VtLJ41/LJZ4w6y8uE3VtAqN1eYeA5su1mbkl6cy2utNGelWOelopDVBFkGo6Yqaxybfh9Z0cIkSb0t0cDxSXnKCSNhxp8w0pw9EUtseowye1s87lUhP+pTu/EHC19+aGUhcSnzJIMz6I7Q3PTXa492UZgq9DdBkTPFAiaELaye5YRlxV54da16qWvuuaQYra42q8Apr7Ewm7zf/D+ESS5IRjFR67TztfRsCtTKFHDCFgag9m4Jxjufgk4WYB0JFVg+o5AWY8RS2nwKf+qGpF1Mz6x4T1QiE+411n95E92CB9+mMT+fsQj2TuH4f0BIUKXNKPLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SA1PR19MB4926.namprd19.prod.outlook.com (2603:10b6:806:1a6::18)
 by SA0PR19MB4173.namprd19.prod.outlook.com (2603:10b6:806:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 19:22:41 +0000
Received: from SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50]) by SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50%6]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 19:22:41 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Alexander Naumann <alexandernaumann@gmx.de>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: dell-wmi-sysman: New possibility to set BIOS values for Dell
 systems has some bugs
Thread-Topic: dell-wmi-sysman: New possibility to set BIOS values for Dell
 systems has some bugs
Thread-Index: AQHXBeTp4sWQbn1rHEWj/wP2WL9mHKpd7xyAgABaj5A=
Date:   Thu, 18 Feb 2021 19:22:41 +0000
Message-ID: <SA1PR19MB4926CE20E2050A29D62C90CAFA859@SA1PR19MB4926.namprd19.prod.outlook.com>
References: <14c6da2c-1e8f-294c-a11d-1656a611d7d8@gmx.de>
 <2aa89ef2-3fca-dd0a-a5e9-ab6762ac7c1d@gmx.de>
In-Reply-To: <2aa89ef2-3fca-dd0a-a5e9-ab6762ac7c1d@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-02-18T19:22:38.6947613Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=6dcf449a-38c5-40c1-a66e-9cd613325c06;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: gmx.de; dkim=none (message not signed)
 header.d=none;gmx.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d638276-16d9-4930-650d-08d8d4428fa4
x-ms-traffictypediagnostic: SA0PR19MB4173:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR19MB4173237500524B4C6949142EFA859@SA0PR19MB4173.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KulAQX5J1QgIEWUOWmgG6MNvNI7fGWf4n+7utufD5wfunf8nVVhwuOGaYZi/PmJu/riiQRPRIcI8UOZWsAct5FRxYbwwIrlZJWY1BYVr66S80WMPmmtY6rlPJ+ODamX385PuFLogpVVLf2rcDzJ+k8zC7N5bL/gbMOz2UCFW66cYws99EcK0IYVktIQMJQwB3gdIZ1yGrPLw/IrqGd1+mKotE0EhzP3HlwdIsiSvFapZH33nT4XBgC0gL5x1Zw2/c208tMqz9/xRLylzSBMT7tl6h6rrmX1c6QcMfTdDntHZCdfYofc04wkhSXrgRBiLpWgnMzi5SefM21LJkQJ/KgWIew0yzq70G2NAWe+Cba4CdfaJdFhbdJa+C4U+J97Ft4apx0dxFvf4OYGNvfkg8RpMSzBw7qIsmbkuJSPokLf403haIcNbV/239riDkLStdT2pDHVWLvbw1pnf3GOjtH1gRWDr+QguT0v5Z4OIOnpj4/eoKiYqPmPfIBHH+y1E7V4gjmrV5U9nZ2ovD6Ix/pHIBOUZdoy8g9sl5DIx0b1oHEtDwUKtds4WmW0OugGC1+YtUQNNUA+3Mi8qCy70jA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR19MB4926.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(9686003)(5660300002)(786003)(33656002)(8936002)(110136005)(7696005)(83380400001)(52536014)(55016002)(6506007)(4326008)(45080400002)(316002)(76116006)(6636002)(86362001)(66446008)(8676002)(478600001)(2906002)(26005)(66556008)(186003)(66946007)(53546011)(64756008)(71200400001)(66476007)(505234006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NmxHMnpXMTFyWjA4UEtsMERyTGVoWGtSb2J2KzM3VUxLQ01xQ0tkWTZhR292?=
 =?utf-8?B?c0E2Q2pTdDNoQ1hBbHFQZmo1bUs4QUkzSVVvcnZDOElkTGNMeEluUTI5QmRl?=
 =?utf-8?B?eTZ1Ky9wcXpCWnZ4TEZSbEVHSHdQYVlQRmQrZ2RFUHRydktSTlN1aTFZTWlJ?=
 =?utf-8?B?R1M0T2lkUTZxekNIMUtsd0plVmcyYkJpWW1KU1ArRmUyS2lacnJWaVgrQzRR?=
 =?utf-8?B?UVpvTzMwUDlXQnc3Q01ubVlxcTM0RVowbmxjdk9IemFjNEg0WGcwTzdzZFVp?=
 =?utf-8?B?YUE3YWZiM3lXbmlSZU40OWZwNHQ0YitLUHpidnI2N2pPQUpDWktvbjQ0UWZ1?=
 =?utf-8?B?UllCVUpRVnRuMkZ5THhsZlpIQnVjN0lPdGNlRlJZMS8yT3J1V1ZWSGxMNHhr?=
 =?utf-8?B?Y21iLzlLVmNuRHdMVkNSS0tjcTMwQitPZGVFNkUwQTVuUWVLM1RtZ2UyOGNV?=
 =?utf-8?B?WGNGQWR3S2NaVFdoUEVUNmlHVEhtM2tJbnFGN3lpZGY3aDdTOHpWQWdrdnJk?=
 =?utf-8?B?cUtzRjJyZVZxQmlrZFBMTVVlemZRNzBOamRGWEtVRmlOZ2JLSnBjU0kyK1J2?=
 =?utf-8?B?WmplQnhpRWhTTnI0cVZRTW8rWTM4dmFPamlzcGZiV1JmWEordWlNM1g2OVpR?=
 =?utf-8?B?dldxRTB1NENZYzBXejE0RERBbEtYVHNaVWFHUHl4UktVTXBzS2l5dmVkMzhP?=
 =?utf-8?B?RFF4eDI5Qml2SER4TVdMU2QvelVJMlczY1NKaFduRFZtUDNCRUVHUHhnalhC?=
 =?utf-8?B?bkJiTEp6dmMrK1pJcE1PSGYrenlvWDBrN0JWYTg5Uml5NlhHelM2dkh1ekha?=
 =?utf-8?B?YW05OG8ycVZoazVCZ0dveSs1UitTbXgrTUNabDM3VzYwNmZDdXFJQU1KdmtG?=
 =?utf-8?B?TUlhQ01qRjQrTnRGVUkycVFqV015dVdyeFdZMkZqRC9YRDFXNGZCaVh4UGJk?=
 =?utf-8?B?dnZLNzNhcGh3VWdPMWNqQk5ORlM0OVpDRXhhTGEyU0ZFRWZ2Wjl0V1FUd0xS?=
 =?utf-8?B?bHhaMDV0T0htSE14TitTL1greDJtclc2ZTd5cyt2OGJTVTc0b3R0WDJ0U3Bn?=
 =?utf-8?B?a3pnenJ2SUYwd2FVaUVycnVESG0yeEkwN0ttRXo2c2p2d3hmTlBZTnViKzJ4?=
 =?utf-8?B?ZzNVZXd6YXRPbkIvVUR1emw3WmsvSWNpT1dFd3h0d1lTd2dkcEMvamNDcnJp?=
 =?utf-8?B?Z3E5L1hyK1R1VklUd1h5Ym90UlVZVHJ1LytOaW5JbjlIK3drWE4yeUJ6U01R?=
 =?utf-8?B?dkN2VXNzSEZ5Q1RoRFFER3R0QkxzbVF5Q2Jnd1ZwTkdtZ3lvbG1qTTNNZ1o2?=
 =?utf-8?B?Tk1PQVg0N0cxSi9HeHpXYnhKS3hKeTJBSVdQc1FaWG5ZV1EwOXdEUVZ6ZzVH?=
 =?utf-8?B?LzltTFhQemxmeGVkYkFvQitWejBiSGlZWlpaSVpIeFRUcXBmc3hpUjJuR3Fm?=
 =?utf-8?B?QXVCS0tjM0JiRS9uSTFuVndEQXZXazVWVUN6blB4OGpLZUIzTUJJbDl4OVNI?=
 =?utf-8?B?TUFlQ0dCTVlFQjUvaENyQk9EdW1mcGFicnRmalYyNVFNdjZqakRpckMvTkNS?=
 =?utf-8?B?VzBLRHdQdTZwT0dGcUdQWTg2SkdMUnRDRkdDeEFxbDhKL0tSR3RJb1RlQ0gx?=
 =?utf-8?B?OEIrbkk1QUxURm44V2ttTi9COGNqem4xSmdHYzhMeE9Ic1QreW04Wjh0Mzlm?=
 =?utf-8?B?dy9tdXhNdHMxSExxV3JWbTE3a0dlbGRXaW5TWmJodmdUUlRzMW9uNm80TXdx?=
 =?utf-8?Q?vn7a/Ezwoci4d490ONqffDoSToT9uZDhrcQ9vjZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB4926.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d638276-16d9-4930-650d-08d8d4428fa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 19:22:41.4675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTH0nf1zY7De5UQeW/D3OxTfGKud+0EtIBL4MUcze3IXY3IyQMTEJE3v3PE1OqgTalUA+OzWzvnxLOfTUR4euQUAnCJeekM9YY692kyPowg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4173
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-18_09:2021-02-18,2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102180160
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180160
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

VGhhbmtzIGZvciB0aGUgcmVwb3J0IGFuZCBzdGFjayB0cmFjZS4gIEkndmUgc2VudCBhIHBhdGNo
IGJhY2sgdG8gdGhlIG1haWxpbmcNCmxpc3QgdG8gcHJldmVudCB0aGlzIGZhaWx1cmUuDQoNCkkn
bSBzb3JyeSB0byBiZSB0aGUgYmVhcmVyIG9mIGJhZCBuZXdzLCBidXQgdGhlIGZlYXR1cmUgaXMg
bm90IHN1cHBvcnRlZCBieQ0KeW91ciBSMjQwLiAgSXQncyBjdXJyZW50bHkgc3VwcG9ydGVkIGJ5
IG5ld2VyIHdvcmtzdGF0aW9ucy4NCkkgZG9uJ3Qgc2VlIGEgcmVhc29uIHdoeSBpdCBjb3VsZG4n
dCBiZSBzdXBwb3J0ZWQgb24gYSBzZXJ2ZXIgZnJvbSB0aGUgZHJpdmVyJ3MNCmFyY2hpdGVjdHVy
ZSwgYnV0IG9mdGVuIHRoaW5ncyB0aGF0IGNhbiBiZSBjb250cm9sbGVkIHRocm91Z2ggdGhpcyB0
eXBlIG9mDQppbnRlcmZhY2UgYXJlIGFscmVhZHkgbWFuYWdlZCBieSBvdXQgb2YgYmFuZCBtYW5h
Z2VtZW50IG9uIHNlcnZlcnMuDQoNCklmIHlvdXIgb3JnYW5pemF0aW9uIHNlZXMgaXQgYXMgdXNl
ZnVsIHRvIHlvdSBmcm9tIGEgc2VydmVyIHBlcnNwZWN0aXZlLCBwbGVhc2UgYnJpbmcNCnRoYXQg
cmVxdWVzdCBiYWNrIHRocm91Z2ggeW91ciBzYWxlcyBjaGFubmVsIHRvIGRpc2N1c3Mgd2l0aCBl
bmdpbmVlcmluZw0KdmlhYmlsaXR5IHRvIGVuYWJsZSB0aGUgZmlybXdhcmUgc3VwcG9ydCBuZWVk
ZWQgZm9yIGl0IG9uIHNlcnZlcnMgYXMgd2VsbC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgTmF1bWFubiA8YWxleGFuZGVybmF1bWFubkBnbXguZGU+
DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxOCwgMjAyMSA3OjU0DQo+IFRvOiBCaGFyYXRo
aSwgRGl2eWE7IExpbW9uY2llbGxvLCBNYXJpbw0KPiBDYzogcGxhdGZvcm0tZHJpdmVyLXg4NkB2
Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IGRlbGwtd21pLXN5c21hbjogTmV3IHBvc3Np
YmlsaXR5IHRvIHNldCBCSU9TIHZhbHVlcyBmb3IgRGVsbA0KPiBzeXN0ZW1zIGhhcyBzb21lIGJ1
Z3MNCj4gDQo+IA0KPiBbRVhURVJOQUwgRU1BSUxdDQo+IA0KPiBIZXJlIGlzIHRoZSBzdGFja3Ry
YWNlIEkgc3Bva2UgYWJvdXQ6DQo+IA0KPiANCj4gcm1tb2QgZGVsbC13bWktc3lzbWFuDQo+IA0K
PiANCj4gDQo+IFvCoMKgIDgxLjgwOTc4M10gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlLCBhZGRyZXNzOg0KPiAwMDAwMDAwMDAwMDAwMDQ4DQo+IFvCoMKgIDgxLjgwOTc4Nl0g
I1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbCBtb2RlDQo+IFvCoMKgIDgxLjgw
OTc4N10gI1BGOiBlcnJvcl9jb2RlKDB4MDAwMCkgLSBub3QtcHJlc2VudCBwYWdlDQo+IFvCoMKg
IDgxLjgwOTc4OF0gUEdEIDEwMWZiZjA2NyBQNEQgMTAxZmJmMDY3IFBVRCAxMDBlMjMwNjcgUE1E
IDANCj4gW8KgwqAgODEuODA5NzkyXSBPb3BzOiAwMDAwIFsjMV0gU01QDQo+IFvCoMKgIDgxLjgw
OTc5M10gQ1BVOiAxIFBJRDogNjgzMyBDb21tOiBybW1vZCBUYWludGVkOiBHwqDCoMKgwqDCoMKg
wqDCoMKgwqAgTw0KPiA1LjExLjAtNjRiaXQgIzENCj4gW8KgwqAgODEuODA5Nzk1XSBIYXJkd2Fy
ZSBuYW1lOsKgIC8wRFJSMFAsIEJJT1MgMi40LjEgMDkvMjcvMjAxOA0KPiBbwqDCoCA4MS44MDk3
OTZdIFJJUDogMDAxMDpzeXNmc19yZW1vdmVfZmlsZV9ucysweDAvMHgxMA0KPiBbwqDCoCA4MS44
MDk4MDBdIENvZGU6IDhiIDQ3IDA4IDQ4IDhiIDY4IDYwIGU4IDdlIGU1IGZmIGZmIDQ4IDg5IGRm
IGU4IDA2DQo+IGQ2IGZmIGZmIDQ4IDg5IGVmIDViIDVkIGU5IDVjIGI3IDIwIDAwIDY2IDY2IDY2
IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwDQo+IDAwIDw0OD4gOGIgN2YgMzAgNDggOGIgMzYgZTkg
NjQgZTYgZmYgZmYgMGYgMWYgNDAgMDAgNDEgNTQgNTUgNDkgODkgZmMNCj4gW8KgwqAgODEuODA5
ODAyXSBSU1A6IDAwMTg6ZmZmZmM5MDAwMTEzYmViMCBFRkxBR1M6IDAwMDEwMjQ2DQo+IFvCoMKg
IDgxLjgwOTgwM10gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZmZmZmZhMDFiNmRjMCBS
Q1g6DQo+IDAwMDAwMDAwMDAwMDAwMDANCj4gW8KgwqAgODEuODA5ODA0XSBSRFg6IDAwMDAwMDAw
MDAwMDAwMDAgUlNJOiBmZmZmZmZmZmEwMWI2MDYwIFJESToNCj4gMDAwMDAwMDAwMDAwMDAxOA0K
PiBbwqDCoCA4MS44MDk4MDVdIFJCUDogMDAwMDAwMDAwMDAwMDA4MSBSMDg6IDAwMDAwMDAwMDAw
MDAwMDAgUjA5Og0KPiAwMDAwMDAwMDAwMDAwMDZlDQo+IFvCoMKgIDgxLjgwOTgwNl0gUjEwOiBm
ZjZkNjA2YzcyNzg3MjVlIFIxMTogMDA2ZTYxNmQ3Mzc5NzM1ZiBSMTI6DQo+IDAwMDAwMDAwMDAw
MDA4ODANCj4gW8KgwqAgODEuODA5ODA3XSBSMTM6IDAwMDAwMDAwMDAwMDA4ODAgUjE0OiAwMDAw
MDAwMDAwMDAwMDAwIFIxNToNCj4gMDAwMDAwMDAwMDAwMDAwMA0KPiBbwqDCoCA4MS44MDk4MDhd
IEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjg4ODQ2ZWQwMDAwMCgwMDYzKQ0K
PiBrbmxHUzowMDAwMDAwMGY3ZDIxOTQwDQo+IFvCoMKgIDgxLjgwOTgxMF0gQ1M6wqAgMDAxMCBE
UzogMDAyYiBFUzogMDAyYiBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCj4gW8KgwqAgODEuODA5ODEx
XSBDUjI6IDAwMDAwMDAwMDAwMDAwNDggQ1IzOiAwMDAwMDAwMTAwZTIwMDAxIENSNDoNCj4gMDAw
MDAwMDAwMDM3MDZlMA0KPiBbwqDCoCA4MS44MDk4MTJdIENhbGwgVHJhY2U6DQo+IFvCoMKgIDgx
LjgwOTgxNF3CoCByZWxlYXNlX2F0dHJpYnV0ZXNfZGF0YSsweDE5LzB4YTMgW2RlbGxfd21pX3N5
c21hbl0NCj4gW8KgwqAgODEuODA5ODE3XcKgIHN5c21hbl9leGl0KzB4NS8weGQ4YiBbZGVsbF93
bWlfc3lzbWFuXQ0KPiBbwqDCoCA4MS44MDk4MTldwqAgX19pYTMyX3N5c19kZWxldGVfbW9kdWxl
KzB4MTZiLzB4MjQwDQo+IFvCoMKgIDgxLjgwOTgyMl3CoCBfX2RvX2Zhc3Rfc3lzY2FsbF8zMisw
eDU2LzB4ODANCj4gW8KgwqAgODEuODA5ODI2XcKgIGRvX2Zhc3Rfc3lzY2FsbF8zMisweDJmLzB4
NzANCj4gW8KgwqAgODEuODA5ODI4XcKgIGVudHJ5X1NZU0VOVEVSX2NvbXBhdF9hZnRlcl9od2Zy
YW1lKzB4NGQvMHg1Yw0KPiBbwqDCoCA4MS44MDk4MzBdIFJJUDogMDAyMzoweGY3ZWRjNTQ5DQo+
IFvCoMKgIDgxLjgwOTgzMV0gQ29kZTogYjggMDEgMTAgMDYgMDMgNzQgYjQgMDEgMTAgMDcgMDMg
NzQgYjAgMDEgMTAgMDggMDMNCj4gNzQgZDggMDEgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgNTEgNTIgNTUgODkgZTUgMGYgMzQgY2QNCj4gODAgPDVkPiA1YSA1OSBjMyA5
MCA5MCA5MCA5MCBlYiAwZCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MA0KPiBb
wqDCoCA4MS44MDk4MzNdIFJTUDogMDAyYjowMDAwMDAwMGZmZTA4YmM4IEVGTEFHUzogMDAwMDAy
NDYgT1JJR19SQVg6DQo+IDAwMDAwMDAwMDAwMDAwODENCj4gW8KgwqAgODEuODA5ODM0XSBSQVg6
IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwMDAwMGZmZTA4YzAwIFJDWDoNCj4gMDAwMDAwMDAw
MDAwMDg4MA0KPiBbwqDCoCA4MS44MDk4MzVdIFJEWDogMDAwMDAwMDBmZmUwYjQ1NCBSU0k6IDAw
MDAwMDAwMDAwMDAwMDMgUkRJOg0KPiAwMDAwMDAwMGZmZTA4YzAwDQo+IFvCoMKgIDgxLjgwOTgz
Nl0gUkJQOiAwMDAwMDAwMGZmZTBiNGE4IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6DQo+IDAw
MDAwMDAwMDAwMDAwMDANCj4gW8KgwqAgODEuODA5ODM3XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAg
UjExOiAwMDAwMDAwMDAwMDAwMDAwIFIxMjoNCj4gMDAwMDAwMDAwMDAwMDAwMA0KPiBbwqDCoCA4
MS44MDk4MzhdIFIxMzogMDAwMDAwMDAwMDAwMDAwMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1
Og0KPiAwMDAwMDAwMDAwMDAwMDAwDQo+IFvCoMKgIDgxLjgwOTgzOV0gTW9kdWxlcyBsaW5rZWQg
aW46IGRlbGxfd21pX3N5c21hbihPLSkgd21pDQo+IHNjc2lfdHJhbnNwb3J0X2ZjIHNjc2lfZGhf
cmRhYyBzY3NpX2RoX2VtYyBzY3NpX2RoX2FsdWEgc2NzaV9kaF9ocF9zdw0KPiB4dF9uYXQgeHRf
UkVESVJFQ1QgaXB0YWJsZV9uYXQgbmZfbmF0IGlwdF9SRUpFQ1QgbmZfcmVqZWN0X2lwdjQgeHRf
c3RhdGUNCj4gaXB0YWJsZV9maWx0ZXIgaXBfdGFibGVzIHRoZXJtYWwgZmFuIGlwdjYgZnVzZSBk
bV9zbmFwc2hvdCBkbV9idWZpbw0KPiBkbV9yb3VuZF9yb2JpbiBkbV9tdWx0aXBhdGggcHNtb3Vz
ZSBpcG1pX3NzaWYgcGNzcGtyIGFjcGlfaXBtaSBpVENPX3dkdA0KPiBpVENPX3ZlbmRvcl9zdXBw
b3J0IGlwbWlfc2kgaXBtaV9tc2doYW5kbGVyIGFjIGludGVsX3BjaF90aGVybWFsDQo+IGllMzEy
MDBfZWRhYyBbbGFzdCB1bmxvYWRlZDogcWxhMnh4eF0NCj4gW8KgwqAgODEuODA5ODU3XSBDUjI6
IDAwMDAwMDAwMDAwMDAwNDgNCj4gW8KgwqAgODEuODA5ODU5XSAtLS1bIGVuZCB0cmFjZSAxNzVm
NjI5NDJkY2U0ODZiIF0tLS0NCj4gW8KgwqAgODEuODA5ODU5XSBSSVA6IDAwMTA6c3lzZnNfcmVt
b3ZlX2ZpbGVfbnMrMHgwLzB4MTANCj4gW8KgwqAgODEuODA5ODYxXSBDb2RlOiA4YiA0NyAwOCA0
OCA4YiA2OCA2MCBlOCA3ZSBlNSBmZiBmZiA0OCA4OSBkZiBlOCAwNg0KPiBkNiBmZiBmZiA0OCA4
OSBlZiA1YiA1ZCBlOSA1YyBiNyAyMCAwMCA2NiA2NiA2NiAyZSAwZiAxZiA4NCAwMCAwMCAwMCAw
MA0KPiAwMCA8NDg+IDhiIDdmIDMwIDQ4IDhiIDM2IGU5IDY0IGU2IGZmIGZmIDBmIDFmIDQwIDAw
IDQxIDU0IDU1IDQ5IDg5IGZjDQo+IFvCoMKgIDgxLjgwOTg2M10gUlNQOiAwMDE4OmZmZmZjOTAw
MDExM2JlYjAgRUZMQUdTOiAwMDAxMDI0Ng0KPiBbwqDCoCA4MS44MDk4NjRdIFJBWDogMDAwMDAw
MDAwMDAwMDAwMCBSQlg6IGZmZmZmZmZmYTAxYjZkYzAgUkNYOg0KPiAwMDAwMDAwMDAwMDAwMDAw
DQo+IFvCoMKgIDgxLjgwOTg2NV0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogZmZmZmZmZmZh
MDFiNjA2MCBSREk6DQo+IDAwMDAwMDAwMDAwMDAwMTgNCj4gW8KgwqAgODEuODA5ODY2XSBSQlA6
IDAwMDAwMDAwMDAwMDAwODEgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOToNCj4gMDAwMDAwMDAw
MDAwMDA2ZQ0KPiBbwqDCoCA4MS44MDk4NjZdIFIxMDogZmY2ZDYwNmM3Mjc4NzI1ZSBSMTE6IDAw
NmU2MTZkNzM3OTczNWYgUjEyOg0KPiAwMDAwMDAwMDAwMDAwODgwDQo+IFvCoMKgIDgxLjgwOTg2
N10gUjEzOiAwMDAwMDAwMDAwMDAwODgwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6DQo+IDAw
MDAwMDAwMDAwMDAwMDANCj4gW8KgwqAgODEuODA5ODY4XSBGUzrCoCAwMDAwMDAwMDAwMDAwMDAw
KDAwMDApIEdTOmZmZmY4ODg0NmVkMDAwMDAoMDA2MykNCj4ga25sR1M6MDAwMDAwMDBmN2QyMTk0
MA0KPiBbwqDCoCA4MS44MDk4NjldIENTOsKgIDAwMTAgRFM6IDAwMmIgRVM6IDAwMmIgQ1IwOiAw
MDAwMDAwMDgwMDUwMDMzDQo+IFvCoMKgIDgxLjgwOTg3MF0gQ1IyOiAwMDAwMDAwMDAwMDAwMDQ4
IENSMzogMDAwMDAwMDEwMGUyMDAwMSBDUjQ6DQo+IDAwMDAwMDAwMDAzNzA2ZTANCj4gDQo+IA0K
PiBBbSAxOC4wMi4yMSB1bSAxMTo1NyBzY2hyaWViIEFsZXhhbmRlciBOYXVtYW5uOg0KPiA+IEkg
aGF2ZSBzZWVuIHRoaXMgbmV3IG9wdGlvbiBhbmQgd2FudGVkIHRvIHRlc3QgaXQgb24gYW4gUjI0
MCAoT0VNIGRldmljZSkuDQo+ID4NCj4gPiBCdXQgaXQgaXMgbm90IHdvcmtpbmcuDQo+ID4NCj4g
Pg0KPiA+IEkgZGlkIGNvbXBpbGUgdGhpcyBhcyBhIG1vZHVsZSBhbmQgaXQgd2FzIGxvYWRpbmcg
ZmluZS4gQnV0IGFjdHVhbGx5IGl0DQo+ID4gaXMgbm90Lg0KPiA+DQo+ID4gVGhpcyBmdW5jdGlv
biBjYWxsIGhlcmUgcmV0dXJucyAwOg0KPiA+DQo+ID4gcmV0ID0gaW5pdF9iaW9zX2F0dHJfc2V0
X2ludGVyZmFjZSgpOw0KPiA+DQo+ID4NCj4gPiBCdXQgIndtaV9wcml2LmJpb3NfYXR0cl93ZGV2
IiBpcyBub3Qgc2V0IQ0KPiA+DQo+ID4gU28gbG9hZGluZyB0aGUgbW9kdWxlIGlzIHJldHVybmlu
ZyB3aXRoIGV4aXQgY29kZSAwICh3aGF0IGlzIHdyb25nISkuDQo+ID4gVmFyaWFibGUgInJldCIg
c2hvdWxkIGJlIHNldCB0byAxIGluIHRoaXMgY2FzZQ0KPiA+DQo+ID4NCj4gPiBBbHNvIHVubG9h
ZGluZyB0aGUgbW9kdWxlIHdpbGwgY3Jhc2ggKEkgZ3Vlc3MgYmVjYXVzZSB0aGUgc3lzIGVudHJp
ZXMgZG8NCj4gPiBub3QgZXhpc3RzKS4NCj4gPg0KPiA+IEkgY2FuIHNlbmQgeW91IGFuIGNyYXNo
ZHVtcCBsYXRlciBvbi4NCj4gPg0KPiA+DQo+ID4gQW55IGlkZWFzIHdoeSBpdCBpcyBub3Qgd29y
a2luZyBhdCBhbGw/DQo+ID4NCj4gPg0KPiA+DQo+ID4NCg==
