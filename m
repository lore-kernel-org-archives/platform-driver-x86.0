Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E77C433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Apr 2021 21:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0340601FB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Apr 2021 21:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhDAVXI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Apr 2021 17:23:08 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:24756 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234623AbhDAVXI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Apr 2021 17:23:08 -0400
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 131GgRXF011845;
        Thu, 1 Apr 2021 12:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=AUt+E3EvZt93sXlXDAw9sLa0OmmP89XR7SBlXsjrecY=;
 b=pPwwlIL9a0NNK43+3ip9eo1cX6HypRml0nbtVRyO8BBeIt/hMzsE0XBh5xpe9UkKcLSv
 ylL+9a6MVwbiipDmqcSBnaW41BrW7wFmSr9jPaBvq2pp3daw4VneNDn5n+96JtKGUW3y
 0Phv+nQzBGSxmtUJWnYsQ7VRihdViW5X7nJDVDCMTopHB3qnkRMixQuQW+T7gZmY0K8C
 6ufcLLu/nz1Joa4HtMn+peAyDyJlUxk9o+w4AIdZN0ATJsbFMVNTpUrNpE/QpeWwPGII
 MTb0TblmrDEbJhJ6EY9pI+6OM/54BHA99HeT8+YCKT2DdO84ubNOrbjVj3yV8bCDhkuv lA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 37n294k71b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Apr 2021 12:45:38 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 131GdgWa127466;
        Thu, 1 Apr 2021 12:45:38 -0400
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
        by mx0b-00154901.pphosted.com with ESMTP id 37n2arp7hc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Apr 2021 12:45:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBUKd8+PltXrmJPAE2algBMFm/PCoQbJw+Bxs1H9NqvvmaBWogxlHHtSRXEo8kzlT/5VkTbO0q6KZ7YqfZr+LUhbO8BJbnZI4aTF7DxatvSbv+HMzLD01T1u6wbUOEs+XpH/4LQYYF1HXtSAEtKXX+GNep1M/RBRIGCOPhs1DnSkiftdZAI0+6oHY0mMPcykuj4s2L6APOxkILrBtl9/0BzVYXsiYFkUQ3fSM++ahhCXgXNmnxyaJ0PU+P+srrjFBw4b89+GlpxacLcCWusudd9rgigUZMdi6l8W444UY6FAobDV6hSDmoi2CdZ3rWlFcMmoSLCbghHQT6/61ujV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUt+E3EvZt93sXlXDAw9sLa0OmmP89XR7SBlXsjrecY=;
 b=X1M0oPKKy+/8XqOzxOOeXt/clP9ltOjcCvBYB2e67NEUTKzChV/8VscFqrJig4HTgjvuGXpijHl+7XC3iYmGIlv3A1VQ/juU4EN352ylFYh7eSUdXdbMX78wh+iEOZIMPifjAfSjctuNZkE0lu/Upea7kJko/6xORjhzTHpnwBM6Wl723gNzWd5JrzODuzuWRVjIYXtz1Qk39zp9wxvfyCJKBbNyDKEfWkjVfZuRGeT4NA+fRC5Z286MzlHtqlCpxOvYhwVBrwwpA73aBdMeUURkOEzRl2342okf2sdG1kCDrUUF4OarxWMTGwoiRKG4ZAmgY4iGuYflEGH5gw6/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3676.namprd19.prod.outlook.com (2603:10b6:5:1dc::25)
 by DM6PR19MB4216.namprd19.prod.outlook.com (2603:10b6:5:2bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 1 Apr
 2021 16:45:36 +0000
Received: from DM6PR19MB3676.namprd19.prod.outlook.com
 ([fe80::249f:83fe:c8e3:4be3]) by DM6PR19MB3676.namprd19.prod.outlook.com
 ([fe80::249f:83fe:c8e3:4be3%7]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 16:45:36 +0000
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
Thread-Index: AQHXHk4Y61NlmdLG8k6LBRkRDirCoqqOYOcAgAgMELCAABTYgIAEqhuggAELBgCAA7eegA==
Date:   Thu, 1 Apr 2021 16:45:36 +0000
Message-ID: <DM6PR19MB36768A7F5E58CAF6562DE6A5827B9@DM6PR19MB3676.namprd19.prod.outlook.com>
References: <20210321121607.35717-1-hdegoede@redhat.com>
 <bdbbe7e6-7a6b-fa9d-426a-e88135e3c7f5@redhat.com>
 <DM6PR19MB3676F7901C6D1A778396E6DF82619@DM6PR19MB3676.namprd19.prod.outlook.com>
 <69d0c17a-a24b-6cf3-9acc-e6c4398c9a9c@redhat.com>
 <DM6PR19MB3676CB7EC5181819843A75DF827E9@DM6PR19MB3676.namprd19.prod.outlook.com>
 <3af4f3ba-d444-8b43-bb6f-e0adb17ff2f3@redhat.com>
In-Reply-To: <3af4f3ba-d444-8b43-bb6f-e0adb17ff2f3@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Prasanth_Ksr@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-04-01T16:45:33.8543344Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=c88933ab-cc01-49e7-86a6-3971ffba90b0;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [49.207.199.127]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 663b29e3-bbf8-4a3f-ff9a-08d8f52d9358
x-ms-traffictypediagnostic: DM6PR19MB4216:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR19MB42163F4BCB5A427CD3E21EB7827B9@DM6PR19MB4216.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b9/EAGrUJuUK54GgaryjnwkTUCPNi2fCpfGoME0DwZMkcou3tjyAso8aVWQcU3qK5rNGUykNUGk131Qr3dC64BTrqpDo2V9bdxHqQv78UENhrm2PzXGKyPfXeYoU6Td9r+/scjD3kOJWXYuqVWxBoghZysN2A5RCt5VtKpXKSMBSCFbdIrPhW+SUq+ELoBhQDBJxRl/OU+xo+tpXpi3sOQaBxAiRbwyH6IjFjIB/opmr4ylPXJLb+qwxS0KG5GuoGj7tFTAWA32WEy/yzvThdt5WsrwSdeAvVQWiLVVDxf12kL3NuPjC+H6y7J0C7o81ePeS/mfcVfD9lzsvoX7V4C00J43uyS1as6PFw+7qXfmXtMZE92krjxe5I2o3eQEBTeknqKfchUrEMd9sm6SelKxEzTJCOynghYxvWfSNYOaTGGw3PMaUNwZ1Hxie9HQffot3tY18PVjjjB5MvHbhnnJrsOQ+Nv9uKmYa3/4s6NThaCbANZvU/awvKqf5x6K+MY6c+ZmqlrrZYLWDcBwEbHNeoZn/PReYh2QFW1peBZrA3koVzlUhpv/OaE9zKoZW7poJN09oJk5jBbk3SzU/J+f1O8zzm1+H0dgoxR7Sy2bwMIkdivUYqqLhaaxO0RVcXQW2s5G7uswwVeRYC0Y4aEUfPr/7UEhLgyCHXWlXps96cIAGkPnVm6yJx89dX9J2J6qVVdPCINeNsl+QK5qOXt98Ega5oDgOoct83GQwc2MZ3PEDCXYV/otNR6JBly2L
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB3676.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(110136005)(83380400001)(6506007)(55236004)(86362001)(76116006)(66446008)(8936002)(8676002)(53546011)(38100700001)(786003)(54906003)(316002)(9686003)(5660300002)(26005)(107886003)(966005)(4326008)(33656002)(186003)(52536014)(66476007)(64756008)(66556008)(2906002)(66946007)(55016002)(7696005)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?akJ1TGxwT0VFZFp2c3JkU3ZnQ29UcTI1a0xwWXYrcjBwV2QvaEg4Q2NvTmdv?=
 =?utf-8?B?cVpvbEZkZmlXNHhEbEwwdmxZNDlzWGRQbWZXZHZuYWhxdUVrSElJSnFkWHlM?=
 =?utf-8?B?My9zKzMxZE1zaHByNzI5WnZuT2d5MGdKNk1GTnVWdlMwOXhTeG1QUTVoSDVi?=
 =?utf-8?B?eWpqMTZDMWVkTmc2S1I2bCtPS1Bhblc3N3l4SzFqMHdJVTRzem5FTzBPTWtX?=
 =?utf-8?B?RkE1ZkZvVUhQdzFyZ1ByUDJxN0xSN2JZWnQ0SWRDRFZrTVFJTENLVTRabFRx?=
 =?utf-8?B?VDhHbDB1SUR5M2swYnhteGNyTFBBVnVCYlFXZ0NXenkzbHZMa1Fvakk2ckth?=
 =?utf-8?B?ZkhDZ3FCNUpnOW1tOGRpd05EWTJxWExZTGpBMkJqdTc3LzI0UlJHTjZZR1Fo?=
 =?utf-8?B?em5mYU02Wi9CcXdKdjd4ZTdmVjZOWmxHKzBIRHJpTm5LMlF6bzdNQ3dBemFY?=
 =?utf-8?B?ZXQ5ZU02MEg0MlYwK3ZablRUZlV3RGU1MjdyWlFEMUFkN2Q2NHdqaW9qaHI0?=
 =?utf-8?B?L0pZSEVvSFUyTldMZ3FRYnNGQnlvN0pkOXc2WFFjeGc5S2pMREJpNDZrOGxS?=
 =?utf-8?B?ZTZTWkVuZlJWQ1NYb3RFZFhyMzZJcUFOOUU3Q25uc1pPcFJpQzJlaXI1blYr?=
 =?utf-8?B?SDFyV25kUkI0c1B0ekhFUEV4cEZBYTJESVhjQnFaZFhMVm9GS1RXbXNDUHR3?=
 =?utf-8?B?ektyU0dzaWJjZnBOUDVnTmZ3YzByaVVqS0x5ekV4eWdJV1ZaNTZFZmEvY2dh?=
 =?utf-8?B?VjlnZk14UkFraVViOHQ0ell5dUZwWGRUSkllNWFYSzVTRHEwQ0p6MHFtL080?=
 =?utf-8?B?WHB3OU01TzJJd29OVitGbU5TTVZtanhzTHNkbkJjRzFVSEZNT1RSQVBVT0Rm?=
 =?utf-8?B?OThLQVFENFp6Vytsem1OaDBjcncxVncrbWZaL05pN1M3TXZqZWF3dGFadFdZ?=
 =?utf-8?B?K2JpRHM2akYzOVlmczBLWmtHYWZsekRXVjd3dk1rRE1yRjVKZGJLdTRERVF3?=
 =?utf-8?B?Q0FmQW9PeE9HSTMwZFV3UExEV2xhUDVaNTJyVlptOE9DNUxDS0syNUJNcWls?=
 =?utf-8?B?QjVKWkswcVRyQ3dCZnFsNUxiY053V2FxZmFKT0RmK1BGWkNyc3ZONXVwU09I?=
 =?utf-8?B?eitHSGJGVFI3bFhtbU9ZL0lubjRjNkR6Y3p6QmRZWitBUmp0T2xUQTBoZXlP?=
 =?utf-8?B?T1NYWTZSN0EyRENZUFJpSlNiVDRTS2tzU0JKMU5iM1Q0NVNlTXRpMllGdW9C?=
 =?utf-8?B?L1lWeVhEalpCU0ZRRi90SUJObllOeTN2NW9wWWFlZ1VhNGhSMnp4ZDJtZ3Zw?=
 =?utf-8?B?aEhaQ1UvZ0xtaHpmQlR0TUt3M0VPN29POUc4NXdwYkVoN3BKTWtNbjlabEFp?=
 =?utf-8?B?UHVnei9OdDJldnVZdkNDK3hpSnQxd1NUaWtVd0Rkdm9jQThUTmp5d2w1Mktx?=
 =?utf-8?B?MDQrVnl3bUgrVEtDOFk5ZGtBWk1nRG82YW1ETWd3Um1NZEU3MFE1a1cva3dE?=
 =?utf-8?B?ZWZiTjNOS1ZmNW56QnBLZExOYW1vYXp2cFQ2NTAyZmxyYTFic2RQRHRxZjlW?=
 =?utf-8?B?VXRqbmF1eXFzTmpXQzlSRTNhL3lLZUFER2tTakt1dDErOE5iZVJaa2xRM0l0?=
 =?utf-8?B?aElSYitMMEZoMkg1Rnc4by9hZjNZZ1RzMlV5ek5UdGtKd3dKMSt3dERvSVM0?=
 =?utf-8?B?NzV3YXpjZWM4MXF5elpSQmVVUlkwMG9PTWNKN2FXOTVHcGU4eXRaSUxjbkk0?=
 =?utf-8?Q?mJEAVvOJvcYkyVTu4pJk0+DcTdubm5ET202P4Te?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3676.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663b29e3-bbf8-4a3f-ff9a-08d8f52d9358
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 16:45:36.6152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F50q4/vdge2yMdPW5JBlqn6MEBTs6a8Uiw2eEdpjRm4TU/5YmNev0Klb4lEZnX6kksDg8mZaYThAFQf8EhhTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4216
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-04-01_09:2021-04-01,2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010108
X-Proofpoint-ORIG-GUID: VZ4FSd6Rlyeox6usUapTrwslOzf6pUHb
X-Proofpoint-GUID: VZ4FSd6Rlyeox6usUapTrwslOzf6pUHb
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010108
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2Vk
ZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWFyY2ggMzAsIDIwMjEg
MToyNCBQTQ0KPiBUbzogS3NyLCBQcmFzYW50aDsgTWFyayBHcm9zczsgQW5keSBTaGV2Y2hlbmtv
DQo+IENjOiBMaW1vbmNpZWxsbywgTWFyaW87IEJoYXJhdGhpLCBEaXZ5YTsgQWxleGFuZGVyIE5h
dW1hbm47IHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZzsgWXVhbiwgUGVy
cnkNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gcGxhdGZvcm0veDg2OiBkZWxsLXdtaS1zeXNt
YW46IE1ha2UNCj4gaW5pdF9iaW9zX2F0dHJpYnV0ZXMoKSBBQ1BJIG9iamVjdCBwYXJzaW5nIG1v
cmUgcm9idXN0DQo+IA0KPiANCj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiANCj4gSGksDQo+IA0KPiBP
biAzLzI5LzIxIDY6MDAgUE0sIEtzciwgUHJhc2FudGggd3JvdGU6DQo+ID4gSGksDQo+ID4NCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSGFucyBkZSBHb2VkZSA8
aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBNYXJjaCAyNiwgMjAyMSAx
MDoxNCBQTQ0KPiA+PiBUbzogS3NyLCBQcmFzYW50aDsgTWFyayBHcm9zczsgQW5keSBTaGV2Y2hl
bmtvDQo+ID4+IENjOiBMaW1vbmNpZWxsbywgTWFyaW87IEJoYXJhdGhpLCBEaXZ5YTsgQWxleGFu
ZGVyIE5hdW1hbm47DQo+ID4+IHBsYXRmb3JtLWRyaXZlci0geDg2QHZnZXIua2VybmVsLm9yZzsg
WXVhbiwgUGVycnkNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gcGxhdGZvcm0veDg2OiBk
ZWxsLXdtaS1zeXNtYW46IE1ha2UNCj4gPj4gaW5pdF9iaW9zX2F0dHJpYnV0ZXMoKSBBQ1BJIG9i
amVjdCBwYXJzaW5nIG1vcmUgcm9idXN0DQo+ID4+DQo+ID4+DQo+ID4+IFtFWFRFUk5BTCBFTUFJ
TF0NCj4gPj4NCj4gPj4gSGksDQo+ID4+DQo+ID4+IE9uIDMvMjYvMjEgNDo0MCBQTSwgS3NyLCBQ
cmFzYW50aCB3cm90ZToNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4gSGksDQo+ID4+Pg0KPiA+Pj4gW0VY
VEVSTkFMIEVNQUlMXQ0KPiA+Pj4NCj4gPj4+PiBIaSwNCj4gPj4+Pg0KPiA+Pj4+IE9uIDMvMjEv
MjEgMToxNiBQTSwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4gPj4+Pj4gTWFrZSBpbml0X2Jpb3Nf
YXR0cmlidXRlcygpIEFDUEkgb2JqZWN0IHBhcnNpbmcgbW9yZSByb2J1c3Q6DQo+ID4+Pj4+IDEu
IEFsd2F5cyBjaGVjayB0aGF0IHRoZSB0eXBlIG9mIHRoZSByZXR1cm4gQUNQSSBvYmplY3QgaXMN
Cj4gPj4+Pj4gcGFja2FnZSwNCj4gPj4gcmF0aGVyDQo+ID4+Pj4+ICAgIHRoZW4gb25seSBjaGVj
a2luZyB0aGlzIGZvciBpbnN0YW5jZV9pZCA9PSAwIDIuIENoZWNrIHRoYXQgdGhlDQo+ID4+Pj4+
IHBhY2thZ2UgaGFzIHRoZSBtaW5pbXVtIGFtb3VudCBvZiBlbGVtZW50cyB3aGljaCB3aWxsDQo+
ID4+Pj4+ICAgIGJlIGNvbnN1bWVkIGJ5IHRoZSBwb3B1bGF0ZV9mb29fZGF0YSgpIGZvciB0aGUg
YXR0cl90eXBlDQo+ID4+Pj4+DQo+ID4+Pj4+IE5vdGUvVE9ETzogVGhlIHBvcHVsYXRlX2Zvb19k
YXRhKCkgZnVuY3Rpb25zIHNob3VsZCBhbHNvIGJlIG1hZGUNCj4gPj4+Pj4gbW9yZSByb2J1c3Qu
IFRoZSBzaG91bGQgY2hlY2sgdGhlIHR5cGUgb2YgZWFjaCBvZiB0aGUgZWxlbWVudHMNCj4gPj4+
Pj4gbWF0Y2hlcyB0aGUgdHlwZSB3aGljaCB0aGV5IGV4cGVjdCBhbmQgaW4gY2FzZSBvZg0KPiA+
Pj4+PiBwb3B1bGF0ZV9lbnVtX2RhdGEoKQ0KPiA+Pj4+PiBvYmotPnBhY2thZ2UuY291bnQgc2hv
dWxkIGJlIHBhc3NlZCB0byBpdCBhcyBhbiBhcmd1bWVudCBhbmQgaXQNCj4gPj4+Pj4gb2JqLT5z
aG91bGQNCj4gPj4+Pj4gcmUtY2hlY2sgdGhpcyBpdHNlbGYgc2luY2UgaXQgY29uc3VtZSBhIHZh
cmlhYmxlIG51bWJlciBvZiBlbGVtZW50cy4NCj4gPj4+Pj4NCj4gPj4+Pj4gRml4ZXM6IGU4YTYw
YWE3NDA0YiAoInBsYXRmb3JtL3g4NjogSW50cm9kdWNlIHN1cHBvcnQgZm9yIFN5c3RlbXMNCj4g
Pj4+Pj4gTWFuYWdlbWVudCBEcml2ZXIgb3ZlciBXTUkgZm9yIERlbGwgU3lzdGVtcyIpDQo+ID4+
Pj4+IENjOiBEaXZ5YSBCaGFyYXRoaSA8RGl2eWFfQmhhcmF0aGlAZGVsbC5jb20+DQo+ID4+Pj4+
IENjOiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGltb25jaWVsbG9AZGVsbC5jb20+DQo+ID4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+
ID4+Pj4+IC0tLQ0KPiA+Pj4+PiBDaGFuZ2VzIGluIHYyOg0KPiA+Pj4+PiAtIFJlc3RvcmUgYmVo
YXZpb3Igb2YgcmV0dXJuaW5nIC1FTk9ERVYgd2hlbiB0aGUNCj4gPj4gZ2V0X3dtaW9ial9wb2lu
dGVyKCkgY2FsbA0KPiA+Pj4+PiAgIGZvciBpbnN0YW5jZV9pZCA9PSAwIHJldHVybnMgTlVMTC4g
T3RoZXJ3aXNlDQo+ID4+Pj4+ICAgL3N5cy9jbGFzcy9maXJtd2FyZS1hdHRyaWJ1dGVzL2RlbGwt
d21pLXN5c21hbiB3aWxsIGdldCBjcmVhdGVkDQo+ID4+Pj4+IHdpdGgNCj4gPj4gYW4NCj4gPj4+
Pj4gICBlbXB0eSBhdHRyaWJ1dGVzIGRpciAoZW1wdHkgZXhjZXB0IGZvciBwZW5kaW5nX3JlYm9v
dCBhbmQNCj4gPj4+Pj4gcmVzZXRfYmlvcykNCj4gPj4+DQo+ID4+Pj4gU28gdGhlIHJlYXNvbiBm
b3IgdGhpcyBjaGFuZ2UgaW4gdjIgaXMgdGhhdCB0ZXN0aW5nIG9uIGEgRGVsbCBMYXRpdHVkZQ0K
PiBFNTU3MDoNCj4gPj4+PiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dp
P2lkPTE5MzYxNzENCj4gPj4+Pg0KPiA+Pj4+IFdpdGggdjEgb2YgdGhpcyBwYXRjaCByZXN1bHRz
IGluIGFuIGVtcHR5IGF0dHJpYnV0ZXMgZGlyIChlbXB0eQ0KPiA+Pj4+IGV4Y2VwdCBmb3INCj4g
Pj4gcGVuZGluZ19yZWJvb3QgYW5kIHJlc2V0X2Jpb3MpLCBpbnRlcmVzdGluZ2x5IGVub3VnaCB0
aGVyZSBhcmUgYm90aA0KPiA+PiBTeXN0ZW0gYW5kIEFkbWluIGRpcnMgY3JlYXRlZCB1bmRlciBB
dXRoZW50aWNhdGlvbiwgc28gdGhlIEJJT1Mgb2YNCj4gPj4gdGhpcyBkZXZpY2Ugc2VlbXMgdG8g
aGF2ZSB0aGUgR1VJRHMgZm9yIGJvdGggdGhlIGF0dHJpYnV0ZXMgYW5kIHRoZQ0KPiA+PiBhdXRo
ZW50aWNhdGlvbiBpbnRlcmZhY2VzOyBhbmQgaXQgPmhhcyB0aGUgMiBzdGFuZGFyZCBhdXRoZW50
aWNhdGlvbg0KPiA+PiBvYmplY3RzLCB0aGVvcmV0aWNhbGx5IGFsbG93aW5nIGNoYW5naW5nIHRo
ZSBCSU9TIHBhc3N3b3JkcyBmcm9tDQo+ID4+IHdpdGhpbiBMaW51eCwgYnV0IGl0IGRvZXMgbm90
IGFkdmVydGlzZSBhbnkgYXR0cmlidXRlcyB3aGljaCBjYW4gYmUNCj4gY2hhbmdlZC4NCj4gPj4+
Pg0KPiA+Pj4+IFdpdGggdGhlIG5ldyB2MiBwYXRjaCwgdGhlIGRyaXZlciB3aWxsIG5vdyBzaW1w
bHkgcmVmdXNlIHRvIGxvYWQNCj4gPj4+PiAoYW5kIGl0DQo+ID4+IHNob3VsZCBubyBsb25nZXIg
Y3Jhc2ggZHVyaW5nIGNsZWFudXAgYmVjYXVzZSBvZiB0aGUgb3RoZXIgcGF0Y2hlcykuDQo+ID4+
Pj4NCj4gPj4+PiBCdXQgSSB3b25kZXIgd2hhdCBpcyBhY3R1YWxseSB0aGUgcmlnaHQgdGhpbmcg
dG8gZG8gaGVyZSA/DQo+ID4+Pj4gQXJndWFibHkgYmVpbmcNCj4gPj4gYWJsZSB0byBjaGFuZ2Ug
dGhlIEJJT1MgcGFzc3dvcmRzIGhhcyBzb21lIHZhbHVlIG9uIGl0cyBvd24gPw0KPiA+Pj4+DQo+
ID4+Pj4gTWFyaW8sIHdoYXQgaXMgeW91ciB0YWtlIG9uIHRoaXM/DQo+ID4+Pg0KPiA+Pj4gSWRl
YWxseSB3ZSBzaG91bGQgbm90IGJlIGhpdHRpbmcgdGhpcyBjb2RlIHBhdGggYXQgYWxsLiBJIGFt
IHdvcmtpbmcNCj4gPj4+IHdpdGgNCj4gPj4gcGVycnkgdG8gc2VlIHRoZSByZXN1bHRzIGFmdGVy
IGFwcGx5aW5nIHRoZSBwYXRjaGVzIG9uIHRoZSBzeXN0ZW0uDQo+ID4+PiBJZiB0aGlzIGlzIGJl
aGF2aW9yIHdlIGNvbnNpc3RlbnRseSBzZWUgb24gb2xkZXIgc3lzdGVtIEJJT1MgdGhlbiB3ZQ0K
PiA+Pj4gd2lsbA0KPiA+PiBwYXRjaCB0aGUgY29kZSB0byBhdm9pZCBjb2RlIHBhdGggYW5kIGJh
aWwgb3V0IGVhcmx5IG5vdCBsb2FkaW5nIHRoZQ0KPiBkcml2ZXIuDQo+ID4+DQo+ID4+IFdpdGgg
djIgb2YgbXkgcGF0Y2hlcyAod2hpY2ggaGF2ZSBiZWVuIG1lcmdlZCkgd2UgZG8gYmFpbCBvdXQg
YXMgc29vbg0KPiA+PiBhcyBpdCBpcyBjbGVhciB0aGF0IHRoZXJlIGlzIG5vIGVudW0tdHlwZSAo
KikgYXR0cmlidXRlIHdpdGgNCj4gPj4gaW5zdGFuY2VfaWQgMC4gVGhhdCBpcyBwcmV0dHktbXVj
aCB0aGUgZWFybGllc3QgdGhhdCB3ZSBjYW4gYmFpbCBhbmQgdGhhdA0KPiB3b3JrcyBmaW5lLg0K
PiA+Pg0KPiA+PiBXaGF0IEkgd2FzIHdvbmRlcmluZyBpcyBpZiB0aGF0IGlzIHRoZSByaWdodCB0
aGluZyB0byBkbyB0aG91Z2guIE9uDQo+ID4+IHRoZSBFNTU3MCB0aGVyZSBzZWVtIHRvIGJlIG5v
IGVudW0vaW50L3N0ciBhdHRyaWJ1dGVzIGF0IGFsbCBidXQgd2hhdA0KPiA+PiBpZiB0aGVyZSBh
cmUgZW51bQ0KPiA+PiArIGludCBhdHRyaWJ1dGVzICsgbm8gc3RyIGF0dHJpYnV0ZXMgZm9yIGV4
YW1wbGUgPw0KPiA+Pg0KPiA+IEl0IHdvdWxkIGJlIHJpZ2h0IHRoaW5nIHRvIGRvIGJlY2F1c2Ug
dGhpcyBzY2VuYXJpbyBoYXBwZW5zIGJlY2F1c2Ugb2YNCj4gc29tZSBCSU9TIGlzc3VlLg0KPiAN
Cj4gUmlnaHQsIHRoaXMgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIG9uIG1hY2hpbmVzIHN1Y2gg
YXMgdGhlIExhdGl0dWRlIEU1NTcwLg0KPiANCj4gTXkgcXVlc3Rpb24gaXMgbW9yZSwgd2hhdCBp
ZiwgaW4gdGhlIGZ1dHVyZSBzb21lIG1hY2hpbmUgZG9lcyBub3QgaGF2ZSBzYXkNCj4gc3RyaW5n
IGJpb3MtYXR0cmlidXRlcywgYnV0IGl0IGRvZXMgaGF2ZSBlbnVtIGFuZCBpbnQgYXR0cmlidXRl
cyA/DQo+IA0KPiBUaGUgY3VycmVudCBjb2RlIHdpbGwgdGhlbiBzdGlsbCByZWZ1c2UgdG8gYmlu
ZCAvIGxvYWQsIHdoaWNoIHNlZW1zIHdyb25nLg0KPiANCj4gTm90ZSB0aGF0IG9uIHRoZSBFNTU3
MCB0aGVyZSBhcmUgbm8gZW51bSBhbmQgbm8gc3RyaW5nIGFuZCBubyBpbnQNCj4gYXR0cmlidXRl
cywgc28gd2UgY291bGQgYWxzbyBkZWxheSB0aGUgcmV0dXJuIC1FTk9ERVYgdW50aWwgYWZ0ZXIg
d2UgaGF2ZQ0KPiBlbnVtZXJhdGVkIGFsbCAzIHR5cGVzIGFuZCBpZiBhbGwgMyBoYXZlIGEgd21p
X3ByaXYuZm9vX2luc3RhbmNlc19jb3VudCBvZiAwDQo+IHRoZW4gcmV0dXJuIC1FTk9ERVYgdGhh
dCBzZWVtcyBsaWtlIHRoZSBsb2dpY2FsIHRoaW5nIHRvIGRvIGhlcmUgdG8gbWUuDQoNCkl0IGlz
IG5vdCBvbmx5IHdpdGggTGF0aXR1ZGUgRTU1NzAgYW5kIHRoaXMgZGV2aWNlIGlzIGFuIGV4YW1w
bGUgb2Ygb25lIHN1Y2ggY2FzZSB3aGljaCB3ZSBhcmUgbWVudGlvbmluZw0KV2UgZXhwZWN0IGFs
bCAzIGNhdGVnb3JpZXMgdG8gYmUgcHJlc2VudCBhbHdheXMgZm9yIHN1cHBvcnRlZCBwbGF0Zm9y
bXMuIEV2ZW4gYSBzeXN0ZW0gd2l0aCBtaW5pbWFsIEJJT1MgYXR0cmlidXRlcyB3aWxsIGhhdmUg
YXQgbGVhc3QgZmV3IG1hbmRhdG9yeSBhdHRyaWJ1dGVzIGluIGVhY2ggb2YgdGhlIHRocmVlIGNh
dGVnb3JpZXMuDQpJZiBCSU9TIGRvbid0IGhhdmUgYW55IG9uZSBjYXRlZ29yeSBHVUlEIGV4cG9z
ZWQgdGhlbiBpdCB3aWxsIGJlIGZhdWx0eSBCSU9TIGFuZCBvdXIgZHJpdmVyIG11c3QgcmVmdXNl
IHRvIGJpbmQvbG9hZC4gSGVuY2UsIHdlIGJlbGlldmUgdGhhdCBjdXJyZW50IGNvZGUgaGFzIHJp
Z2h0IGxvZ2ljLg0KDQoNCg==
