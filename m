Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28B0C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:10:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbiGLPKS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233214AbiGLPJw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:09:52 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::607])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD997BF55E
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx6W7LV/Lo2gG3G6rSuBUFYTN3JNoBfbOCmDJ9JIe2mJvm0Ps64f1eUgBenk4Yn5vDTuUqLu1I2QaLjMu4Ivj3WbSli6UtiZg9zfbUisf+4fGuO6OPZYy2z8trfwyqvHqqxUxgPi5dUD3p5dBYTzImArEz/4EnYyBDQqfOdeteB/U1hzVImP6TLn/Sz1hoHBhZcRcul6vhaFnyvIXpOM9lmIt/5Fvw+FZ6meYNUa09rUCNkBo+Ln8YTTnRkKsNt0FBtorHgiJQ0/xy7G4D/MlBKFYc+bQSkp3+fLl/DhbEEehU4hP7F085dI+1Hl4Bc7Ajud80ojfuyy4xJFx4pJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prjnBsGepFpneDt6kUPbXWzAVSpRIhPJQQRLHwDjTEw=;
 b=MlVm836Mt+hcSO54NueHk8bJubDzJ7fU6k2+qWcb75SV7B3HtaQl05E/F306+7unsQYuP2XiIjCVmWYVZCYozhzzF+qB7/TY/5mP+xrSnlxl9bofwbIdWMznW2YzmE364eUoYP9BcXTfAbV0jWaDQOHxj/IXlN1bopf1r/+eJJfxygwnFs6zBSs/fRn5zt8qlc2Vy2wsSdWCEIpPpI1teiqCxfaRTrgQsZmT2EkopVHOG26vBayX2S4zubgC3amrq/JOaZt5DfaWaF2Tg1RqLaAhQGKzc2VuiZzaAjDezbDvRgiSh6Ir3IOQQsClk5Shq4WpFoWkfIXOFlXT0JH7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prjnBsGepFpneDt6kUPbXWzAVSpRIhPJQQRLHwDjTEw=;
 b=pVXWj/TlV9ZzXNPnO90gtXwf4RNgdtipw0DXgN/6PvtDTSitzxC890gJkUu9Qi6CF7fezKSb/1IKDe3cUPoLfIljtyIpPKHc+YmGao2+joGsLmg/q2tWwWSoeG0TT82hHcKgtps9zEacCSpMvgfwl3U+ethl6I0iBxDUnU6WmVc=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB3742.namprd12.prod.outlook.com (2603:10b6:208:16a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 15:03:15 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 15:03:15 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Patil Rajesh <Patil.Reddy@amd.com>
Subject: RE: [PATCH v1 01/15] ACPI: platform_profile: Add support for
 notification chains
Thread-Topic: [PATCH v1 01/15] ACPI: platform_profile: Add support for
 notification chains
Thread-Index: AQHYlf/+6J2wzmKQz0q+YGQfILSleK161Gag
Date:   Tue, 12 Jul 2022 15:03:15 +0000
Message-ID: <MN0PR12MB61018FA44A015793FCF62322E2869@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-2-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20220712145847.3438544-2-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-07-12T15:01:02Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=111ceb4c-f249-41c0-8574-f244426d3132;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-07-12T15:03:17Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 8fd181ce-1f70-4d12-bc75-9caa367d327d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbc85237-9e4c-42fc-b9df-08da6417a603
x-ms-traffictypediagnostic: MN2PR12MB3742:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M6IMGzNFe3J5pNR7AwNSpJIs4NXz32rAtnrkA+H9agLftBomzpXF/ddc84J04rJ1sS5NDTp6xFSeZrZ0R+qXAb9dzmGxxmbKmf+Y1dLk4X4lqn5N/64nKoFC+J++621YSG7oHRNbPBqGAdVik+CG0rM7fwe5m0VMCs/SfLh6TgqVvqtaC5nqNJhay/+tq7DcaEG4fpptgo8fFx4AymCWjeDyMogrAR0BKRhUyiSDPbnAR/syxHvgFRo/4vEjcUbNON/aZkkRg7h698x0CTbEaj9S7JKILev7DCQXWNIuSgKu6DgT46GhT4tejzbhmBX050qKBHlnFg5EtX4K8zXm5pLfs6Q2dWsvgDjA5lDzHKLRl9IDo1ACuXG0RMG1yc76fptdbWWhU6pj8r7CbS8Y7Io9J3TvJX0odAPqu7cF73YQyiy3hzmrSKsSq8ucU/tns7Y//pB0nXvM2gxKmmowDO95NskXmVFONVvpt4qHxDMRSc0MV0MRHLn133h7/NCw16qq64Esc5pMKafZnU58ZtB6Qs9IsT/eGdFZR6GU8uvZR1r0hYmI5VJge/I2bV02+pht4KR0wCvLVSPRFHsQm5KJOop0AQ8SztTqA1EMuZwJ391trFVgrVGvOl2oDkvJ/XaI9NBO4B01k3SIeN9FSHHyGitbUNOpH6OnxftpjbDZ5Hk60tX9qAo9/4Jx7HC8d0GJGOPKWZD9QWFh74AbcRjYAjdO1o8QdUz5Zpcj/2uXoOYocAxHUTGBNfi1i1E9HGRkxn4o6AlqRT0wLq6nBFs6ySNmVFR5FDaqWfKYjn+1ZIyulFufCJEgI9qPDFn0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(110136005)(2906002)(316002)(71200400001)(38070700005)(54906003)(186003)(86362001)(55016003)(33656002)(15650500001)(5660300002)(52536014)(66476007)(8936002)(76116006)(66446008)(4326008)(66556008)(8676002)(66946007)(64756008)(7696005)(9686003)(26005)(38100700002)(53546011)(41300700001)(83380400001)(122000001)(478600001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nD9ar+4gA+1pKgUQsXNzca2qBceO842zOWnQoce/Tg/8e89wp2BUjnuKLAx5?=
 =?us-ascii?Q?mnwJTmLc4Nf+0fEznd/d66lfum7sRigbkD1bcS89Lorvrj90j0rjiP68Dgd9?=
 =?us-ascii?Q?iu4BreL2iKaDszdVlf/KkNfX8Ng9htDYaNqcnZhKNlIqXlcSgLTvQrTY4Hlx?=
 =?us-ascii?Q?/be5Rkyczfz0GU3uWOom+Y/qLBMK1Y0FE/9pP5axp9EQv68MnYg0JhpGmFnq?=
 =?us-ascii?Q?SuGhH59r27jlVEdXf9+bhYqOh3cw1Fxnq7g3pczBfktujlZSsfZoMQxIvmJo?=
 =?us-ascii?Q?PYDBEZkxMs+bQs9ohoJnPJFNDLAkpfROQAdkQKA+Y78xWbFL8BjaIz/XqIz2?=
 =?us-ascii?Q?tbyaDJuoDOMC3KUT1s4QLTds3SXw1EHo+LckJ4ZJ+OHzPQlE4JcQ3cmVp+yS?=
 =?us-ascii?Q?GwUddLCnNB4vjqeaWRUCMm48A6JAzSHq1XNKwMCE6ZhKZRHuwIHxx60kcDHB?=
 =?us-ascii?Q?s7iPJ5tVcM52r8SED5z4Mjxa3KVCipxak0tljAD4aepd17zK2uMVnO014TIi?=
 =?us-ascii?Q?boQUKvZNVYr3Xu8ZucY6/T6uKi0IeoCg6k00PWjbixridq9i086dQZfl+c3p?=
 =?us-ascii?Q?Iwf01JFXsEzl7HeTwXy0vjdS8R7m+xNlrF6h3hN35ObaQcB2CTWdf3rTJ0Ay?=
 =?us-ascii?Q?nFg43yE4g+F5ViN8QR/xGCRq/zKsrx3zs9Eni1XmRvxWFGmyQ2ONd6W95GJZ?=
 =?us-ascii?Q?PYUc8eSCffwk+0TSF/SV+GC/5U/HdXOutaL7X2YQcHsXcns/GcQVj9mxKMDY?=
 =?us-ascii?Q?ftndWcav+qvP7c5gEZIOxdbWJ9+c67WLdtRY8w2p/9gOE5E7iZL1tjDTB2Sw?=
 =?us-ascii?Q?Uhd4Aav+0SvrYAqSgkfOuI4QPCrEtVbiJSMF9LUOxBml+NddA7c+G23nwFaP?=
 =?us-ascii?Q?OQMjJjUv25v7+/gjNG6i7wikpTQnfpasCsiRIZk9urf1AOHgE76D5vjJbo/e?=
 =?us-ascii?Q?gs+68t/zUI7eovIN2bp1ngBr9sGqKs6e9lqB1j67ptQNfBF8t1iJzZRmpreY?=
 =?us-ascii?Q?bKY6/e5Q5axiXbrdn/Qwlz6g2X9ic92ycDzcItpJxmpHl7CTHRvpxHyPYU/h?=
 =?us-ascii?Q?6opOKaaMy0tHftCC1BWNl/IrDPMjgE/gV09Oa9J2ikVG9byDp5ReslBlKTYa?=
 =?us-ascii?Q?SUnYRrhJsICJI7yP0DoyyQEIsm0Iiccv3eQTsorAtzWTuP5EVbSWYjohOtGM?=
 =?us-ascii?Q?rkD/B2uklw6zZDmErKT71lF4rG2ulsUEyGtORXRrX8E7hjEPA5z/Juq913pp?=
 =?us-ascii?Q?0jvBMaOnSaGyXH3jo+sTiK18hNMW48clI85EUziMToEKXJ2zl3PY9Kiv18sB?=
 =?us-ascii?Q?CMRkC481sqeEFQLgQRzvraWhNuKEyig7d8ELrYKBwqynU5tNVfiFSPIaRBnn?=
 =?us-ascii?Q?toeSA3fPCtRpupvsJQqjer6hBvYSG+D2H0QggI3K/ZB05ToSyg6bZRkmgx4K?=
 =?us-ascii?Q?lOFQUbiWdwMmLLh7SxwNxyAzuXBmieGS8z8B7kR2yorl7LNlL251PUU7yUXt?=
 =?us-ascii?Q?I9I5B16faUiF3h62efe5cdXxwR1malXOXKtR/FX2Mttz/ZxyY2LRIyVbP9Qy?=
 =?us-ascii?Q?BYjAHw+bWHujcOOdqyA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc85237-9e4c-42fc-b9df-08da6417a603
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 15:03:15.8165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9y0ZGMiKOwMO5hJnfLgY9nIH5GQcP+0Q7j+XeNoVeofqolzeRudR5rHzYeavCZkzkXtwYQJ+5xuHX6HBl7V15g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3742
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]

> -----Original Message-----
> From: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Sent: Tuesday, July 12, 2022 09:59
> To: hdegoede@redhat.com; markgross@kernel.org
> Cc: platform-driver-x86@vger.kernel.org; Patil Rajesh
> <Patil.Reddy@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; S-k, Shyam-sundar <Shyam-sundar.S-
> k@amd.com>
> Subject: [PATCH v1 01/15] ACPI: platform_profile: Add support for
> notification chains
>=20
> From: Mario Limonciello <mario.limonciello@amd.com>
>=20
> Allow other drivers to react to determine current active profile
> and react to platform profile changes.
>=20

The original patch this came from had notification chains, but as this was
pared down to just export the get method, this commit message and title
should be updated.

> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/acpi/platform_profile.c  | 26 ++++++++++++++++++++++++++
>  include/linux/platform_profile.h |  1 +
>  2 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_prof=
ile.c
> index d418462ab791..7e12a1f30f06 100644
> --- a/drivers/acpi/platform_profile.c
> +++ b/drivers/acpi/platform_profile.c
> @@ -49,6 +49,32 @@ static ssize_t platform_profile_choices_show(struct
> device *dev,
>  	return len;
>  }
>=20
> +int platform_profile_get(enum platform_profile_option *profile)
> +{
> +	int err;
> +
> +	err =3D mutex_lock_interruptible(&profile_lock);
> +	if (err)
> +		return err;
> +
> +	if (!cur_profile) {
> +		mutex_unlock(&profile_lock);
> +		return -ENODEV;
> +	}
> +
> +	err =3D cur_profile->profile_get(cur_profile, profile);
> +	mutex_unlock(&profile_lock);
> +	if (err)
> +		return err;
> +
> +	/* Check that profile is valid index */
> +	if (WARN_ON((*profile < 0) || (*profile >=3D
> ARRAY_SIZE(profile_names))))
> +		return -EIO;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(platform_profile_get);
> +
>  static ssize_t platform_profile_show(struct device *dev,
>  					struct device_attribute *attr,
>  					char *buf)
> diff --git a/include/linux/platform_profile.h
> b/include/linux/platform_profile.h
> index e5cbb6841f3a..2395be670dfd 100644
> --- a/include/linux/platform_profile.h
> +++ b/include/linux/platform_profile.h
> @@ -37,5 +37,6 @@ struct platform_profile_handler {
>  int platform_profile_register(struct platform_profile_handler *pprof);
>  int platform_profile_remove(void);
>  void platform_profile_notify(void);
> +int platform_profile_get(enum platform_profile_option *profile);
>=20
>  #endif  /*_PLATFORM_PROFILE_H_*/
> --
> 2.25.1
