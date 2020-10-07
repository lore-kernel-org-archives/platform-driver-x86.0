Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EE1C41604
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 15:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F36FC2173E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 15:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="REpdFcr/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com header.b="F8WlylBJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgJGP6Z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 11:58:25 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:42430 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728345AbgJGP6Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 11:58:25 -0400
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097FabxK025812;
        Wed, 7 Oct 2020 11:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=8t6HscXMF4l/fp4i2j5V+gkGSmtkDpHh84KpZZ7DkEo=;
 b=REpdFcr/VeC9sVD/v9E6va8cgYZtR4kSyFtX1ti3jkVLBSDwiLidtCsb1shG5JJlPsjq
 J0r3RItbR4zHdE/7KHhvasLhzMI/xPROt0eHOYIkgb5W9Wc/lZpVSZbmBfvQ2XaKQ2Ef
 Oo64UdSu+EIvF4Q1p5AKREHycyxcEWx4qch18wu5iQj3mJYQbxbopfFU/lD4gXZ+hxh8
 tejjTqHjTDvDhTF7YnMqv+iuxxLxlxf2y1Hki8b+NkwZH2U7C/2Ec5bHy2NJDDj/2oR6
 H3UcFJ5Jr+SVBjhlB9AEKG8GJXU7nFkcaoz0VmTOv9HgQUBjw8JFEPSWGLSSvoVfA1eA nA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 33xkv5x87a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Oct 2020 11:58:19 -0400
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097FwGPH107440;
        Wed, 7 Oct 2020 11:58:18 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
        by mx0a-00154901.pphosted.com with ESMTP id 341awcnj3r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Oct 2020 11:58:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGYmsBcHyqz5XqRdWrHi4y+ObCQp145YVAkV4eyYqmPQpgXVT/hXQT0zcSpFQ3xFeeV6T2Rjh8sjF3JYtC1RV+nO1yZNc609Zn/5jbGMndQDWByw0CfPYNuuNTstE/I9jQo2bOqWvbJIYF4dlgJqh0uYytSHrvOJz2I6R3WvgWja1znyFQFNzEnkJEhoo9JxtE9GDKouWw5N4vSjNVGWpl5c40YLIGqhxYJPN4XxeFMlTiglz9uBHcZ435o8SiFt/iPqVvCAAU4USX1dn6jvFfdrlx98J8y8WfWNdDaPV3yJ0FkLOfPgsd3bl+1HgZEIJCvdlfP0SrU3LzTpVvgTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t6HscXMF4l/fp4i2j5V+gkGSmtkDpHh84KpZZ7DkEo=;
 b=VZBG2jHbXYg6E6tPjN6olqwhW4FQ6ALaBQ/7AGw7BrtTbHpa9BXeVy5a7NVvxwcTXZ8fM0dl1E2R/WReeE1OGnku1E1B7IGhKfHl6Pe/z1ZLyNd5YalKYcN+/Jvdbm4v4Z8sJRkv9QNEG6gWWFqbPje+5tIw8NTrATzgtMOcC1zGtR5VgNUQktqgG74WyPRju6yTv1fqnBgybqtmXbFR/bgooVdbhOwA4Hf/o0QnagVlfbGEvluftYSPmV7MwE++6YQFsD2BLZUnShCD4QuDu6KFiLHsA7Melwyh/4wnACkhNPxYSlkGMvdVDnSQQW8irln5xn/673zIjkOXCOolew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t6HscXMF4l/fp4i2j5V+gkGSmtkDpHh84KpZZ7DkEo=;
 b=F8WlylBJaPcuvTQSG1jBY9821vIWRC2BxSlmtOdj/3ev7WrO6R7rzJ/pbHPOKOVqMrtH2ItiXfjQSuqwLacNHddPEu9GXEPc4B++cyp9BzMeMYPya15CxR5AcHR+nTddeuCFtlL+dlSLLBhhtvf8EHSJSP8/pnR28Y1cW6tP1hw=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM5PR19MB1164.namprd19.prod.outlook.com (2603:10b6:3:b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Wed, 7 Oct
 2020 15:53:16 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a4b8:d5c9:29da:39b2]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a4b8:d5c9:29da:39b2%4]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 15:53:16 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     =?iso-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
Thread-Topic: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
Thread-Index: AQHWm5Adbrc3IEfEcEirIr+D8EkaAamMMxYAgAADYYCAABYJwA==
Date:   Wed, 7 Oct 2020 15:53:16 +0000
Message-ID: <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
 <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
In-Reply-To: <20201007143317.bp5lsaa75ls5lhm3@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-10-07T15:53:00.8433979Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=329ec5db-3693-4a10-9c16-7d5c3be57f71;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9d5d33f-2806-4ec2-3fd7-08d86ad91b1a
x-ms-traffictypediagnostic: DM5PR19MB1164:
x-microsoft-antispam-prvs: <DM5PR19MB1164DD820134C52ED3961496FA0A0@DM5PR19MB1164.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FPcmtR0e/8coDs2aX6hiMFaFM/wuOfxgbauzVYcwYapBSMsKajAKXZZs1GjDcLiHPmpmGDJudEfyhDIWDRCKe+Kjc6z4JjWoz6n15zn0mQb6JhJ5uijsVcj8FpYi5vCCaYyqE+luRq+ir8yXLP7ZySDsUj++RHEdlRp4LfWb/RyyPzWt+kpqcGxD+tpKV4aiMvsOts7fwwzij0W+xsqjrupNAgN8GW/3P47IMxnqlY7uxjRXLDwg6lT/X5T+Pg6O/9t5/K7hXKhfAES0qkP0f+hWI6wiGgntgR3MKENwqHLKtJPH5Idr++POm7Sk/IR6kHkf168rFdsCj/zXO8FeMkSPO+PMxzag6h8y05fI9EA2IwfQYkA1VKbjZA1z+jaHSVZ1GxNY1gcVu1otje2t0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(346002)(376002)(136003)(366004)(83080400001)(478600001)(7696005)(86362001)(26005)(786003)(4326008)(316002)(110136005)(33656002)(2906002)(9686003)(6506007)(64756008)(186003)(66946007)(66556008)(76116006)(66476007)(71200400001)(5660300002)(55016002)(66446008)(52536014)(8936002)(83380400001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rotGHoHCdhBxMWA+0rgHCPbubEhB0ObrWnG5Nyg0QKIoi/DwYQICsw6NIYgqWUTXuA3kJvscbh2sCcIr28w61V15/hLvHFIGLhjRHNzp3zF2aJp8BhagWW6H0WgTnPrBGrDXSa5YPKQB/OcrEc9mTOZX0RTLuhygntZQm2RpWUMePxUS62upEiII2Cl88cILUOi/jxclsddMnzj5jkgLQzpTzNTqEksAx9Hc2pNtO/qddNNVT3EUEh0nqvPgkWKUaLa+SHKa2/uu1U0UNSpejIzKezeMjaB7pCFWn/3richr/P25AYibVVFKDrD58H470TCnpWLdShQ1+JxY7kcKTulHDn815/fMpAcrCORZLj1aKYP5VdoJ9N+eURNHvIJ3yWAiGXo0SKBY66BxcO7cRTv6J6ze9EKGoVHsApYXz5emaIvPx6v30UKKnrbH/BujUyjyTGr93Ak99yvIMSi9M80ap1dLhgA4u01pjeCFsAOPCPz3rfkCXsa3BbHEQSeGYOstq2FSgsLvA+Bwsh57TtrIqBszzsAu29fBSvfUHCT7k0sF0DiNmA031XJc+nXSFBy2G85C5H2zn500+Q2uLfmBUAqn42h2ovfFZniXBVjmizqPGyMQQy7KUtAnlgOTnNWvaEdVHjwAeEEeueXKSg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d5d33f-2806-4ec2-3fd7-08d86ad91b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 15:53:16.7168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HA9Rqw35Yl9R8jJXR4xDsXckJnx3tg+45Sth2ggP3hhXsj2+Rr8nflP+9AB5KZoRixrUscXYtDRF5B7RYFarAiQ05VdftxDmwX+kK0Ht1nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1164
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-07_10:2020-10-06,2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070100
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070099
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

>=20
> Hans, there are more drivers which checks for Dell DMI strings. Probably
> it would be needed to update Alienware on more places, not only in
> dell-smbios-base.c driver.

I would prefer that each of those be checked on a case by case basis and on=
ly
added if actually necessary.  Gerardo if you can please check any other dri=
vers
that should need this string added to their allow list.

>=20
> >
> >
> > >
> > > Alienware has been a subsidiary of Dell since 2006.
> > >
> > > 2020 Alienware laptop:
> > > $ sudo dmidecode | head -3
> > > # dmidecode 3.2
> > > Getting SMBIOS data from sysfs.
> > > SMBIOS 3.2.0 present.
> > > $ sudo dmidecode | grep -A 29 "OEM Strings"
> > > OEM Strings
> > > 	String 1: Alienware
> > > 	String 2: 1[099B]
> > > 	String 3: 3[1.0]
> > > 	String 4: 4[0001]
> > > 	String 5: 5[0000]
> > > 	String 6: 6[D0, D4, D8, DA, DE]
> > > 	String 7: 7[]
> > > 	String 8: 8[]
> > > 	String 9: 9[]
> > > 	String 10: 10[1.3.0]
> > > 	String 11: 11[]
> > > 	String 12: 12[]
> > > 	String 13: 13[P38E002]
> > > 	String 14: 14[0]
> > > 	String 15: 15[0]
> > > 	String 16: 16[0]
> > > 	String 17: 17[0000000000000000]
> > > 	String 18: 18[0]
> > > 	String 19: 19[1]
> > > 	String 20: 20[]
> > > 	String 21: 21[]
> > > 	String 22: <BAD INDEX>
> > > 	String 23: <BAD INDEX>
> > > 	String 24: <BAD INDEX>
> > > 	String 25: <BAD INDEX>
> > > 	String 26: <BAD INDEX>
> > > 	String 27: <BAD INDEX>
> > > 	String 28: <BAD INDEX>
> > >
> > > 2013 Alienware laptop:
> > > OEM Strings
> > >          String 1: Dell System
> > >          String 2: 1[05AA]
> > >          String 3: 14[2]
> > >          String 4: 15[0]
> > >          String 5: String5 for Original Equipment Manufacturer
> > >
> > > Don't know when the OEM String changed.
> > > Change tested in the 2020 laptop, loads dell_smbios without further
> > > issues.
> > >
> > > Signed-off-by: Gerardo E. Malazdrewicz <gerardo@malazdrewicz.com.ar>
> > > Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
> > > ---
> > >   drivers/platform/x86/dell-smbios-base.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/platform/x86/dell-smbios-base.c
> > > b/drivers/platform/x86/dell-smbios-base.c
> > > index 2e2cd565926aa..5ad6f7c105cf3 100644
> > > --- a/drivers/platform/x86/dell-smbios-base.c
> > > +++ b/drivers/platform/x86/dell-smbios-base.c
> > > @@ -564,7 +564,8 @@ static int __init dell_smbios_init(void)
> > >   	int ret, wmi, smm;
> > >   	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
> > > NULL) &&
> > > -	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
> > > NULL)) {
> > > +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
> > > NULL) &&
> > > +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Alienware",
> > > NULL)) {
> > >   		pr_err("Unable to run on non-Dell system\n");
> > >   		return -ENODEV;
> > >   	}
> > >
> > >
> > >
> >
