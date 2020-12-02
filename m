Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E404DC6369E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 20:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C441221FA
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 20:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730289AbgLBUwf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 15:52:35 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:48842 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729063AbgLBUwe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 15:52:34 -0500
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0B2KpmFs024415;
        Wed, 2 Dec 2020 20:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=PjRSeE47iOfukT5LxWBut07zeRYO0EZA3TpNGdaLoJ4=;
 b=CzeC8cTYmCzz2FKGZFqz5nvzCG4iinv2V3CAMkDG4wG9glbJHC7Jg2M/Jx7W6ksXAhUf
 boXBXfH+yUCI6An/NT4TBYfeAuFyu5lR6p7eEtGdyF6S5eerpgFJd5ZmrDnWaJuQlp47
 lFusgfATxaLFPSjAxzdIU5MFHlqljjP8JmpncqIbMUYXWPOipLSf7gJ+GRaJvGvNg+GL
 BhBXP4lRS+vcYsJGENiCsSMJ6ruum55/bqxf3Gb1VYsMwq4p8QCckAyhuEBpWOaSZBLJ
 qxH7jDB9hyIM6P7biG6v7KLZeT9VglcjqhYs34XJanIrezdByA+OTN7AUmPrLw/ESejA fw== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0b-002e3701.pphosted.com with ESMTP id 355qmfcb6u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Dec 2020 20:51:48 +0000
Received: from G4W9119.americas.hpqcorp.net (g4w9119.houston.hp.com [16.210.20.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by g9t5008.houston.hpe.com (Postfix) with ESMTPS id DCC2262;
        Wed,  2 Dec 2020 20:51:46 +0000 (UTC)
Received: from G2W6309.americas.hpqcorp.net (2002:10c5:4033::10c5:4033) by
 G4W9119.americas.hpqcorp.net (2002:10d2:14d6::10d2:14d6) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 2 Dec 2020 20:50:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.241.52.10) by
 G2W6309.americas.hpqcorp.net (16.197.64.51) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 2 Dec 2020 20:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA8qWk7KRR9fyNuw2dFJextOUbv2ZDwuvBIqrPb7HZFxVOQuh4rIB0Q1WBHfJpfou/BGD0tKYaapRyD5TF+7fcyQ2AGFa5NSMoyP7xwRpS1GRCugFYuGjpWJyNrpyrBE88eb8oYDpV4jsQ7fkUXLFbQAjBKc7CyK59s9T81gT6WJxlKtNDyCEtucFYyF53SHnuLBRbtxVQVq7/0ilXpXDZw3rgMeg4EYhSftoMFNhKxFtwyJtUYEpjPx6LXUmEGs2iwjhoi86UxPqYtUV3yeqDVku3wcZKCIzeWDtCTT9r1HUQP9hjQOZeIXM3efz/Wwu9UhN3i+QXsSe7X/gsbROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjRSeE47iOfukT5LxWBut07zeRYO0EZA3TpNGdaLoJ4=;
 b=XbeIY2d87emP7lxEIigK2JXCEvdUQfSG/MWQTD3blwCjJAUVzTlg745EXZPpjLvlO5WKgGjDGiDsvo1BTqB7iiw1TRA/SiGIJoZ8UcqZYTjZ5+1vyt8B0XXfIzxNzYK7jC+WPbT/AF61brXvtW42Mmpso8MVtiilQGo6R9jqskY6kTYbHul7FN6UyjrN3HKIkspxPAexxD31PQscEqM0PocC5KpXmF6WRNHlHUZ1yWyTUuGJLWy8IrG+OI45XSHZ1ckjry56E8LGQh7BtkLr5QGnSRjzpjBg930IXc6Zw1JKR/AZC6ElRQMWxIT3BCgte89TmvpFZQbOC4A81ghi4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742b::18) by AT5PR8401MB0467.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7420::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 20:50:36 +0000
Received: from AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::715b:815e:72d8:d802]) by AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::715b:815e:72d8:d802%12]) with mapi id 15.20.3632.020; Wed, 2 Dec 2020
 20:50:36 +0000
From:   "Ernst, Justin" <justin.ernst@hpe.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Borislav Petkov <bp@suse.de>,
        "Wahl, Steve" <steve.wahl@hpe.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
Thread-Topic: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
Thread-Index: AQHWyLmqvZnnp8YWGkuBYOuabP4dNKnkRnZQ
Date:   Wed, 2 Dec 2020 20:50:35 +0000
Message-ID: <AT5PR8401MB1300A04A58C46C822424F46787F30@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
References: <X8eoN/jMAJb3H3iv@mwanda>
In-Reply-To: <X8eoN/jMAJb3H3iv@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.61.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 679bc78e-7b4a-4fe4-8418-08d89703eb47
x-ms-traffictypediagnostic: AT5PR8401MB0467:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AT5PR8401MB0467600E117059D4B8506CC987F30@AT5PR8401MB0467.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UxrZMc64pNDYLth67mvedi5kwfdkCo51Y5s4KHlwxplVQfw1dFsohem5afkUCiw5Goc9Fb6KLSHD7h9hKLZwStzvQxKkwcRmFRIaBsbelZabDcSOLL3MjgCfnkvOi0ug+39eZjzeBHHOWg6Vpg6KwOscmgKsgpnVkFMEP5OrkkaZ1JEAT5v1CXc2+6zdkzENnOJ8jNaR1XFTIblbybEdwg5p1bfbpkErRI9Ispq7OxEdJkfyji3mi67s2y9vn1RjgYZPvw8863qLlyarV7EGRfamrNu6lV+RdoNuUQnDxHJDcOsTIpvbnEjUmY8H3xiu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(136003)(39860400002)(83380400001)(186003)(66446008)(64756008)(66946007)(5660300002)(52536014)(76116006)(4744005)(66556008)(66476007)(6506007)(316002)(7696005)(26005)(33656002)(55016002)(55236004)(54906003)(9686003)(2906002)(86362001)(6916009)(4326008)(71200400001)(478600001)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TwLjGX3hwDHVeSGxzOuU0KE3dgM3EGEC+LxIbjpjDASRWvJhKDgM861GWf9B?=
 =?us-ascii?Q?hYRRJGaiDQqqp4DW+SFjW+jVUt8YZ7d6Z7K+VJyCtF6DSX9CFwx5DZh5bvi2?=
 =?us-ascii?Q?wuJnrjLBigiSs40nQVI003W5Q+sYq40JPs/VZ9jJ+er8NTQUtPHMMoaQDNq+?=
 =?us-ascii?Q?MZDg++o/XiCtZlZkr6VqOXt5f4vbJl6lG/aA/lFcfInBTFOhRkZewU3qMa2A?=
 =?us-ascii?Q?JHqIjmyLWc0tp51h4y96eFtkvRbJsVsRRmmkBkFsCeKWqANlLkBaFjkZdKkK?=
 =?us-ascii?Q?EtsGbvL46muBH5zJ0mqAOEizb7V61+C36121aAB7xS+xaN/dV+e1qSg5ANNF?=
 =?us-ascii?Q?5yFyzrqHvIIYJbDAx4jTC6dCm0O6bv6ecqf1d2Fk93K+95DKrOOdUmG5mPmx?=
 =?us-ascii?Q?xNUlntVpdtIGngf9xeXgOm9174jAwgd+cGEPx3HJDrPHsFkHDE8ZJLesRRQJ?=
 =?us-ascii?Q?E4tBO/i++vWQ51Bn+sXXHKmvwa9Iyxk2hVBOcaaT1EZIAbtPaQ2H/rsA6+HO?=
 =?us-ascii?Q?79aCI1ZS4obRD8T+Y9RQi6IJyiVrGPsKRxnzwxlQFn+05GKe9NkgwxsW+7nF?=
 =?us-ascii?Q?Ord8tX+9ZuAOFMp/WZAdhWA2nBuMsMRykT22a8eGWjfFd2+30xredOyLVjMl?=
 =?us-ascii?Q?ILtAr856jTYzPHAB5qLVPMqDfgv4OAaARsIom0/Sd/Vlf3Q/iL2P5sC97aTO?=
 =?us-ascii?Q?TndjXP3B+LX9kbBHYJ/d7x+2D7onsdhUf0RmXhk5c317RyWbPiV2eTK9nsgl?=
 =?us-ascii?Q?Nk1JqIYJYBDGH3qf1bfzVp5FPniIw6mj66pPMeblLqJ3Zf2Z7szEkjamCNGT?=
 =?us-ascii?Q?BJG0Zi9Zku2u0+qEESgD10xJQfIyN8IPODojwlelB1W2R6rbMcQy1l5zUh+s?=
 =?us-ascii?Q?LnPqoBSjAcnckr2qvgKfIei17n05zKPmoLubBv1Cw9LZlzVDyCZmehsJkJrk?=
 =?us-ascii?Q?M73zxOm4C9WOHs5hEElhEzrEu6Aur1O7VEnqO3fKtAw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 679bc78e-7b4a-4fe4-8418-08d89703eb47
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 20:50:35.9344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wT6f8b/UEUkKlIainrDFmHXDekNMRU23uSEgBeCiX0DkwUpl4bv4k0FaRUNGJrHSWWgD9zK+eQZtFWgoyEAsKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0467
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-02_13:2020-11-30,2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020124
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> Return -ENOMEM on allocation failure instead of returning success.
>=20
> Fixes: 4fc2cf1f2daf ("x86/platform/uv: Add new uv_sysfs platform driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for taking the time to find this.

Reviewed-by: Justin Ernst <justin.ernst@hpe.com>=20
(With an acknowledgement of Boris's 's/success/random stack memory contents=
/' comment)

> ---
>  drivers/platform/x86/uv_sysfs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sy=
sfs.c
> index 54c342579f1c..e17ce8c4cdad 100644
> --- a/drivers/platform/x86/uv_sysfs.c
> +++ b/drivers/platform/x86/uv_sysfs.c
> @@ -248,6 +248,7 @@ static int uv_hubs_init(void)
>  		uv_hubs[i] =3D kzalloc(sizeof(*uv_hubs[i]), GFP_KERNEL);
>  		if (!uv_hubs[i]) {
>  			i--;
> +			ret =3D -ENOMEM;
>  			goto err_hubs;
>  		}
>=20
> --
> 2.29.2

