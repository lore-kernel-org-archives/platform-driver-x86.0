Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B87C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 17:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353285AbiBCRxm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 12:53:42 -0500
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:3922 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353391AbiBCRwq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 12:52:46 -0500
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213HKsXl011769
        for <platform-driver-x86@vger.kernel.org>; Thu, 3 Feb 2022 09:52:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=SixpZFmgKqm+KHwrP2wZRpmH4Q9tVa/4lN1ueOrRwzw=;
 b=DSvuQFRqHwhxNIqUW6+3TFPt2mgLBHdO7tkuIJnZChUcFIYkKMAAM/xeGQ4yxhaHecNq
 N+KSx10KDUqxZVzxClz0xWDw+p3Y1op6x5XyEJirhvJUxzJGRk34zwN9k2giL5TDNe48
 STbm8urB/EAyj3UowsGYMgeXBfHzmecveWk= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3e0j8brusb-5
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Feb 2022 09:52:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Feb 2022 09:52:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFnM1re7rsenIVku7AoI2tROOsfB4FROQcuNwsHItv1GKM1zUXbE1IOsccMFD2a7rWTlw65z+oOWTSyOvkvIEhgQfbk1h9pXCdHCnnqk+k55Ip8LQeQQQFTxw1CkCGPWkhTXYvUMsLMUpyL2DYLjzRAIfwLmcAE8EeMUlT1jJH7DqUi2oIjpdszHbT5OHXJo95SZ4EKH+lImjNYFxXu8Gy5ndVupXYmU8lznQTUW8Tts8F4Y1c9BS/rvo56BCbz0mWiA0FDYMVhu+IX/iqGgCrmy3Tp/G87iCQGXInVZ4Y7s0r/OWHK9r7zb9NQ+2DBPSDyVSUmIU7Gwdhn+7Zs/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SixpZFmgKqm+KHwrP2wZRpmH4Q9tVa/4lN1ueOrRwzw=;
 b=U4LtsobPolkOd9LUietqSRtI5TZ6klbvkUCi88khtoNf0fM3BA1UTaA0IQps2RD/f1DLW9GZ6uVejsgihWaDJsUHuINmxK1E3Mttz6BY4nAx1NoIeXRQOGGQ1oWXEY/vJtdJ8NPpJcOI3Iavt4Gl7ealuRQHvGfYab9Nglb+YttpcOY5gLQXtsaOx2UDZcfpSYWuT4/x65a2RCSt8F51xjk20NVz6Pnfvg4I00vAv6AopS26VPsykWJ5NqT/Z549XZ2QsEI+l5AVfcDHufQNuL7uIaDk8qg1s/fWPdCokMyI3PtukLbuqvfB8Sh6eFL9WPmqTL2D8TqazsNkB6EtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SA1PR15MB5109.namprd15.prod.outlook.com (2603:10b6:806:1dc::10)
 by MW4PR15MB5158.namprd15.prod.outlook.com (2603:10b6:303:185::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Thu, 3 Feb
 2022 17:52:42 +0000
Received: from SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::cd7f:351f:8939:596e]) by SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::cd7f:351f:8939:596e%4]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 17:52:42 +0000
From:   Song Liu <songliubraving@fb.com>
To:     "nchatrad@amd.com" <nchatrad@amd.com>
CC:     "Nathan.Fontenot@amd.com" <Nathan.Fontenot@amd.com>,
        "Siva.Sathappan@amd.com" <Siva.Sathappan@amd.com>,
        "carlos.bilbao@amd.com" <carlos.bilbao@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "suma.hegde@amd.com" <suma.hegde@amd.com>
Subject: Re: [PATCH v2 1/2] platforms/x86: Add AMD system management interface
Thread-Topic: [PATCH v2 1/2] platforms/x86: Add AMD system management
 interface
Thread-Index: AQHYGSbXx8YPHf0LKkuB3mjO5K10UA==
Date:   Thu, 3 Feb 2022 17:52:42 +0000
Message-ID: <D0A101F4-4472-4FD6-A9D7-602C15A2F605@contoso.com>
In-Reply-To: <<20220203120450.199598-1-nchatrad@amd.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 547e9605-b37d-42f6-33ef-08d9e73dfa1a
x-ms-traffictypediagnostic: MW4PR15MB5158:EE_
x-microsoft-antispam-prvs: <MW4PR15MB51584888256DD05A84A23793B3289@MW4PR15MB5158.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:357;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g7e5mOD3nBG6eyvpwIOxP5Ro+XSG/2PjjXHJi/hhP5OkVCHsE5Ha2IEOL3+6EL46A11SbucymLzQJ+toQ2H1ce2ou6Jwo5oNMsqTXK3JIm+OdKrdnvQxkm3K9QDXjdx6Hupym5LOchTyipp6c8wPjAcwPiR5+kAsiwCsQIg4dSKD2siLLG7jURb3J/n+Wicf9q9RPQeiXRcYZSdIFWhnyj+rDqPvJ66RJMdAiVZ+/jAD9LJohMrjyz2fpu1Uyyg6OPaRhy1qGxYetINy4yZXMgeVJkr9kaLXe36oULRKa5VTXJkHD1KiPhHeAL9AggrrwYQlwrnKpDCk0wjQfLRthwXaJS+MsfnA/jCSqpJekruoOoX46igolPmSx/DjC9uIyDuLo+tpcw4K/C+6U2vrgcIRWyZ3LsUtcuGupsenTA7Ltkj+FHplr4/Cl2UxHCqxeC7BfacYedo/U5DnZ125zpXkGwVtgUpJoTlhjsJutrj1JZnoyDcpf/ZA+YAVdosXPGru2aEky/WMI5HqDaBTryFFZwT1FKoYzPyC+LwLE2ebxNxW/QAW/3C1mX53Jch5buX1f11mRYb9//idMMY+bDxh38bEdVn2sCTeOt/gYEzFgbyd/q7KFSwRqNmS7l+RBl8d11rgtIT0XlKzeIj7rQytkBgUgSz97z6w5Bphw+VJhtKKmoCnvEsKBeB2ZTGtAX3kPBPSIjjzaItJg+dmhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR15MB5109.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(91956017)(38100700002)(6916009)(66446008)(38070700005)(316002)(122000001)(36756003)(8676002)(76116006)(4326008)(66946007)(8936002)(64756008)(66476007)(508600001)(71200400001)(54906003)(6486002)(86362001)(2906002)(186003)(9686003)(5660300002)(6512007)(83380400001)(33656002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eElBUzdPUFlGNXdKd3BsRENoYTB1SXVoTlpsYUpKdko0aHFuVGF6Y2R2a2lQ?=
 =?utf-8?B?YjlJck9NZUJuenNmakc1RmhtOVRmWG9xTnZpWXZrSkxMQjgzVGRsb0hkamFh?=
 =?utf-8?B?OXVPSHRJMU10Z21YNStEN3I0RXBTS3hjbUJKRmRkNUZpRjBEUG93T25ybmFt?=
 =?utf-8?B?NnlNUGQrb2NoN1NRRHJZZk53ZmVXQWU1SHhqWFBtT0R2K0EzNTlqMlN3aC9Z?=
 =?utf-8?B?UW9jNlRvY3ZNY3p5QXg2ZnNIQ0dUclN1RnplNGN3eHpiYzQ1OUFod2NLdmV5?=
 =?utf-8?B?NHhWK2FqSmZzTE5qaUE0MWcraC9pUUcyczZScVk0YlhzT3V5L3hPczBmeXZN?=
 =?utf-8?B?TmRwVEFKUkh0dzhtUFYxMU1SZkJPRlpicTk4YU5pZVRidm1XazM3Tjh4dG9i?=
 =?utf-8?B?YXR3UXppRWpkR1ZFSm9xRllBSTFWdHBUWUlKNzRFZ28wSnZLbWg2WG52RENE?=
 =?utf-8?B?ME4va0M2aGgxWFZROEtSeWU4dGJ2ZHFwb2Y1VkxUS0V6NnhTWm1SNWVnNUlC?=
 =?utf-8?B?dEIwSzRzVnU1UUtSMHhGZzFsR3Zja0J2ZU9LdTBFZmJCRzhjM0ZNbnd0Qkky?=
 =?utf-8?B?amZRV0FpRlN3czh1M1RCYkQvY1ROdzc4VS83eVhxbmtBbXRBWllXS2pSQUN1?=
 =?utf-8?B?Q1c1OGZTTUR2d3A5bHJzb0wybk5vTm80QXFEQjQxTU02Ykd1LzRBeU94TmVi?=
 =?utf-8?B?cHM2T0psUVVJWE0veUQ5RS93aEUvNlpSREYvL1pGMW0yVmQ3U09iM0haeWwx?=
 =?utf-8?B?TnJiRjJPM3BlQ1FqcmthOVZ1NERHTGxReElQV2FGR3ErcHUyYzNTa0dCdkJ1?=
 =?utf-8?B?bC9La0hQK1pISjZ5d1NzTEtlZ0RISXIzblpPTkpnOFdhMFFsVEM4SUdneU9J?=
 =?utf-8?B?L05DNnliRnQ3NEFpYm5rSHRHYzFUdVo4empJUXd0SlV1aUplMEdDV09WMnVU?=
 =?utf-8?B?Z1V0dGVHWWpBVlM1bE82WmF0TVo2UnduWEJ4Lzg4enJFb0VaamlMWHVkRDZq?=
 =?utf-8?B?c3grRldqcjVqR0VWVVJHTkhvNVNSOVUyaXlMNlljcGRWb2oxRGVUQUxKYStp?=
 =?utf-8?B?SklObmQ0Y2MrTUZyWnBranpFNU5tV1E1aTRINGhKb2Y5cng5OXc2R3lKMFVR?=
 =?utf-8?B?UGVralRrM0VERFQyQ01hSnpXZVFNRnJrVUdpM3MrR3gvcVFUdG5VK2xOYk9L?=
 =?utf-8?B?VUtXVmhBR2wwVGkxVk9wQWlvbDU3eWh6eXRLRnhaU3NraHZveDJERThVckRl?=
 =?utf-8?B?TDdaUGN3YXJtc3FNT0YxeS9wbE1zTG43MWNObW5hWGVoVnkyU3hzK2QvTTUr?=
 =?utf-8?B?cnVQejFIOWtFeUxnWTJadVZQYktET1NoWlJ4WEpRaXROVkI0N0RxV01udmIx?=
 =?utf-8?B?d3R4Y0cvemhVQllOemU3WEsxbzFtVTg4akdoRk9UalZBWWYvUGNvbGdQb2xm?=
 =?utf-8?B?WkpVM3JtcXh0OGhBRURReXRBQ2tXWHloWG5xMTZtUXRlb1lXNUZIci9MNGF3?=
 =?utf-8?B?MEJIN0kwaUJRemlUL0wvNm4rUk1POGx5UzAvNzlRNE41VnZzV050T3hJZWNB?=
 =?utf-8?B?UHU4b3dhYnUrMUV5dHh5Rk5aV2diZ25VTlhuODNnQlo5QitJWGlwUnZwVE1S?=
 =?utf-8?B?UlA3bytseEY2SmFzYWFjU1VSZ2RJWnA0WlVGQys0NVAyOC9MMSs0TUdDVUc0?=
 =?utf-8?B?QVdJRTV2cFV0VFBjd2Jnb1h2UEhzaHkvMkhvbTBVTnJJNHdvanlkTWN0VEFa?=
 =?utf-8?B?dno4ak5sditCY0VYYjBvS0FuLzdycGdHckJYM1RDSUZpNTIzQnVQWXppelhU?=
 =?utf-8?B?dFZsQzNMVXVmaFc0TkJpcy8zdkQ3UVdmWEo1d05uazdLRXdnWXBOekcxZWtq?=
 =?utf-8?B?WHRIcEhnMS9TS2NqQ0wzZ2FFcGlsYVJaR1ZGRHV6MmYzUlRYK3N3RTVkb2h0?=
 =?utf-8?B?ZVFZQTBLbU9yZnEwZlZvenZmRk8yQkFSMU1UbmkzSXhkSzdEUEcvWlYxZ0pr?=
 =?utf-8?B?US9WNXRqZzI2aTBocmlrY092MEhkQWd3RjZETXM2YUh3WnZMV2RNQ3BqSnNp?=
 =?utf-8?B?ZUZZYzhxejZ3cm5COHhOZ2M4aVhWOFZYZ2YyeU5rWGowOE1OYW9FaDR3SXpM?=
 =?utf-8?B?Z09ERkE5ZmJiSkJQeEtFYko0bWhjVENSL2JhSnZGa01VNWVZNEhSQ1JJNFM5?=
 =?utf-8?B?N3ovZGp0YWpHNis5ZnZwWVJnNWJoalgyaEFhU1ZYWjQ0L1FNZmdJN3ZGWEJx?=
 =?utf-8?B?MGFwZ05zYVQxZEhGNm1Lcnh2ZktRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EBD41B4B1B6AB4B974BA6832953C637@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5109.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547e9605-b37d-42f6-33ef-08d9e73dfa1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 17:52:42.3897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6L/ED7l7tKtoHbTsGTO0fy5oObNDpAXI2fcN6oEwI3nEEJXGOseEphazdkcU+rAGXWZDepVPJE0Ntz5waNX6ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR15MB5158
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: Ja0MpM8Obp8e4xcyn70DshaUH36NhwYR
X-Proofpoint-GUID: Ja0MpM8Obp8e4xcyn70DshaUH36NhwYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=fb_outbound_notspam policy=fb_outbound score=0 phishscore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030108
X-FB-Internal: deliver
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

T24gVGh1LCBGZWIgMDMsIDIwMjIgYXQgMDU6MzQ6NDlQTSArMDUzMCwgTmF2ZWVuIEtyaXNobmEg
Q2hhdHJhZGhpIHdyb3RlOg0KPiBGcm9tOiBTdW1hIEhlZ2RlIDxzdW1hLmhlZ2RlQGFtZC5jb20+
DQo+DQpbLi4uXQ0KPg0KPiAgLi4uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJz
dCAgICAgIHwgICAyICsNCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2FtZF9oc21wLmggICAgICAg
ICAgICAgICB8ICAxNiArDQo+ICBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2FtZF9oc21wLmgg
ICAgICAgICAgfCAgNTYgKysrDQo+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9LY29uZmlnICAgICAg
ICAgICAgICAgICAgfCAgMTMgKw0KPiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvcGxhdGZvcm0veDg2L2FtZF9oc21wLmMg
ICAgICAgICAgICAgICB8IDQ1MCArKysrKysrKysrKysrKysrKysNCg0KV2UgYWRkZWQgbmV3IGZp
bGVzLiBTaGFsbCB3ZSB1cGRhdGUgTUFJTlRBSU5FUlM/DQoNCj4gIDYgZmlsZXMgY2hhbmdlZCwg
NTM4IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9hbWRfaHNtcC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9hbWRfaHNtcC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wbGF0Zm9y
bS94ODYvYW1kX2hzbXAuYw0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi91c2Vyc3Bh
Y2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1h
cGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdA0KPiBpbmRleCA2ODdlZmNmMjQ1YzEuLjY2M2UzMTZk
MzIwYyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lv
Y3RsLW51bWJlci5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3Rs
L2lvY3RsLW51bWJlci5yc3QNCj4gQEAgLTM3Miw2ICszNzIsOCBAQCBDb2RlICBTZXEjICAgIElu
Y2x1ZGUgRmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDb21t
ZW50cw0KWy4uLl0NCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9h
bWRfaHNtcC5oIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hbWRfaHNtcC5oDQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDJjZGFjOGEzMzFkDQo+IC0t
LSAvZGV2L251bGwNCj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hbWRfaHNtcC5o
DQo+IEBAIC0wLDAgKzEsNTYgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wIFdJVEggTGludXgtc3lzY2FsbC1ub3RlICovDQo+ICsNCj4gKyNpZm5kZWYgX1VBUElfQVNN
X1g4Nl9BTURfSFNNUF9IXw0KPiArI2RlZmluZSBfVUFQSV9BU01fWDg2X0FNRF9IU01QX0hfDQo+
ICsNCj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiArDQo+ICsjcHJhZ21hIHBhY2soNCkN
Cj4gKw0KPiArI2RlZmluZSBIU01QX01BWF9NU0dfTEVOIDgNCj4gKw0KPiArLyoNCj4gKyAqIEhT
TVAgTWVzc2FnZXMgc3VwcG9ydGVkDQo+ICsgKi8NCj4gK2VudW0gaHNtcF9tZXNzYWdlX2lkcyB7
DQo+ICsgICAgIEhTTVBfVEVTVCA9IDEsICAgICAgICAgICAgICAgICAgLyogMDFoIEluY3JlbWVu
dHMgaW5wdXQgdmFsdWUgYnkgMSAqLw0KPiArICAgICBIU01QX0dFVF9TTVVfVkVSLCAgICAgICAg
ICAgICAgIC8qIDAyaCBTTVUgRlcgdmVyc2lvbiAqLw0KPiArICAgICBIU01QX0dFVF9QUk9UT19W
RVIsICAgICAgICAgICAgIC8qIDAzaCBIU01QIGludGVyZmFjZSB2ZXJzaW9uICovDQo+ICsgICAg
IEhTTVBfR0VUX1NPQ0tFVF9QT1dFUiwgICAgICAgICAgLyogMDRoIGF2ZXJhZ2UgcGFja2FnZSBw
b3dlciBjb25zdW1wdGlvbiAqLw0KPiArICAgICBIU01QX1NFVF9TT0NLRVRfUE9XRVJfTElNSVQs
ICAgIC8qIDA1aCBTZXQgdGhlIHNvY2tldCBwb3dlciBsaW1pdCAqLw0KPiArICAgICBIU01QX0dF
VF9TT0NLRVRfUE9XRVJfTElNSVQsICAgIC8qIDA2aCBHZXQgY3VycmVudCBzb2NrZXQgcG93ZXIg
bGltaXQgKi8NCj4gKyAgICAgSFNNUF9HRVRfU09DS0VUX1BPV0VSX0xJTUlUX01BWCwvKiAwN2gg
R2V0IG1heGltdW0gc29ja2V0IHBvd2VyIHZhbHVlICovDQo+ICsgICAgIEhTTVBfU0VUX0JPT1NU
X0xJTUlULCAgICAgICAgICAgLyogMDhoIFNldCBhIGNvcmUgbWF4aW11bSBmcmVxdWVuY3kgbGlt
aXQgKi8NCj4gKyAgICAgSFNNUF9TRVRfQk9PU1RfTElNSVRfU09DS0VULCAgICAvKiAwOWggU2V0
IHNvY2tldCBtYXhpbXVtIGZyZXF1ZW5jeSBsZXZlbCAqLw0KPiArICAgICBIU01QX0dFVF9CT09T
VF9MSU1JVCwgICAgICAgICAgIC8qIDBBaCBHZXQgY3VycmVudCBmcmVxdWVuY3kgbGltaXQgKi8N
Cj4gKyAgICAgSFNNUF9HRVRfUFJPQ19IT1QsICAgICAgICAgICAgICAvKiAwQmggR2V0IFBST0NI
T1Qgc3RhdHVzICovDQo+ICsgICAgIEhTTVBfU0VUX1hHTUlfTElOS19XSURUSCwgICAgICAgLyog
MENoIFNldCBtYXggYW5kIG1pbiB3aWR0aCBvZiB4R01JIExpbmsgKi8NCj4gKyAgICAgSFNNUF9T
RVRfREZfUFNUQVRFLCAgICAgICAgICAgICAvKiAwRGggQWx0ZXIgQVBFbmFibGUvRGlzYWJsZSBt
ZXNzYWdlcyBiZWhhdmlvciAqLw0KPiArICAgICBIU01QX1NFVF9BVVRPX0RGX1BTVEFURSwgICAg
ICAgIC8qIDBFaCBFbmFibGUgREYgUC1TdGF0ZSBQZXJmb3JtYW5jZSBCb29zdCBhbGdvcml0aG0g
Ki8NCj4gKyAgICAgSFNNUF9HRVRfRkNMS19NQ0xLLCAgICAgICAgICAgICAvKiAwRmggR2V0IEZD
TEsgYW5kIE1FTUNMSyBmb3IgY3VycmVudCBzb2NrZXQgKi8NCj4gKyAgICAgSFNNUF9HRVRfQ0NM
S19USFJPVFRMRV9MSU1JVCwgICAvKiAxMGggR2V0IENDTEsgZnJlcXVlbmN5IGxpbWl0IGluIHNv
Y2tldCAqLw0KPiArICAgICBIU01QX0dFVF9DMF9QRVJDRU5ULCAgICAgICAgICAgIC8qIDExaCBH
ZXQgYXZlcmFnZSBDMCByZXNpZGVuY3kgaW4gc29ja2V0ICovDQo+ICsgICAgIEhTTVBfU0VUX05C
SU9fRFBNX0xFVkVMLCAgICAgICAgLyogMTJoIFNldCBtYXgvbWluIExDTEsgRFBNIExldmVsIGZv
ciBhIGdpdmVuIE5CSU8gKi8NCj4gKyAgICAgSFNNUF9SRVNFUlZFRCwgICAgICAgICAgICAgICAg
ICAvKiAxM2ggUmVzZXJ2ZWQgKi8NCj4gKyAgICAgSFNNUF9HRVRfRERSX0JBTkRXSURUSCwgICAg
ICAgICAvKiAxNGggR2V0IHRoZW9yZXRpY2FsIG1heGltdW0gYW5kIGN1cnJlbnQgRERSIEJhbmR3
aWR0aCAqLw0KPiArICAgICBIU01QX0dFVF9URU1QX01PTklUT1IsICAgICAgICAgIC8qIDE1aCBH
ZXQgcGVyLURJTU0gdGVtcGVyYXR1cmUgYW5kIHJlZnJlc2ggcmF0ZXMgKi8NCj4gKyAgICAgSFNN
UF9NU0dfSURfTUFYLA0KPiArfTsNCj4gKw0KPiArc3RydWN0IGhzbXBfbWVzc2FnZSB7DQo+ICsg
ICAgIF9fdTMyICAgbXNnX2lkOyAgICAgICAgICAgICAgICAgICAgICAgICAvKiBNZXNzYWdlIElE
ICovDQo+ICsgICAgIF9fdTE2ICAgbnVtX2FyZ3M7ICAgICAgICAgICAgICAgICAgICAgICAvKiBO
dW1iZXIgb2YgYXJndW1lbnRzIGluIG1lc3NhZ2UgKi8NCj4gKyAgICAgX191MTYgICByZXNwb25z
ZV9zejsgICAgICAgICAgICAgICAgICAgIC8qIE51bWJlciBvZiBleHBlY3RlZCByZXNwb25zZSB3
b3JkcyAqLw0KPiArICAgICBfX3UzMiAgIGFyZ3NbSFNNUF9NQVhfTVNHX0xFTl07ICAgICAgICAg
LyogQXJndW1lbnQocykgKi8NCj4gKyAgICAgX191MzIgICByZXNwb25zZVtIU01QX01BWF9NU0df
TEVOXTsgICAgIC8qIFJlc3BvbnNlIHdvcmQocykgKi8NCj4gKyAgICAgX191MTYgICBzb2NrX2lu
ZDsgICAgICAgICAgICAgICAgICAgICAgIC8qIHNvY2tldCBudW1iZXIgKi8NCj4gK307DQoNCklJ
VUMsIHdlIHJlbHkgb24gdXNlciBzcGFjZSB0byBrbm93IChmcm9tIG90aGVyIHNvdXJjZXMpIHRo
ZSBwcm9wZXIgbnVtX2FyZ3MNCmFuZCByZXNwb25zZV9zeiBmb3IgZWFjaCBtZXNzYWdlX2lkLiBU
aGUgb25seSBjaGVjayBhcHBsaWVkIGJ5IHRoZSBrZXJuZWwgaXMNCiJudW1fYXJncyA8PSBIU01Q
X01BWF9NU0dfTEVOICYmIHJlc3BvbnNlX3N6IDw9IEhTTVBfTUFYX01TR19MRU4iLiBIb3cgYWJv
dXQNCndlIGV4cGxpY2l0bHkgY2FsbCBvdXQgdGhvc2UgY29uc3RyYWludHMgaW4gYW1kX2hzbXAu
aD8gTWF5YmUgc29tZXRoaW5nIGxpa2U6DQoNCnN0cnVjdCBoc21wX21zZ19mb3JtYXQgew0KICAg
ICAgIGludCBtc2dfaWQ7DQogICAgICAgaW50IG51bV9hcmdzOw0KICAgICAgIGludCByZXNwb25z
ZV9zejsNCn07DQoNCnN0cnVjdCBoc21wX21zZ19mb3JtYXQgaHNtcF9tc2dfZm9ybWF0X3RhYmxl
ID0gew0KICAgICAgIHsgSFNNUF9URVNULCAxLCAxfSwNCiAgICAgICAvKiBtb3JlICovDQp9Ow0K
DQpUaGFua3MsDQpTb25nDQoNClsuLi5dDQoNCg0K
