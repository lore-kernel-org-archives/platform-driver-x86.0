Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E47C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Mar 2022 22:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbiCGWNk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Mar 2022 17:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237427AbiCGWNj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 17:13:39 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D074431DF0
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 14:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d58SiBVaJu8NlZHGaS9IYt1ZYIBHUxCbYxEb95x67GsnfPHwbuykEv79PMnxoAMG32pHZ68oI6DiAIhpOunR0q3EzCqtdfkt9yb0KMkGbtrLbjlMhTb++e6QIPQQ0HIyMYwek5Rp++qqx1NVe66d2Fu/nMtGA+IUkdv2AHSRaiKMNL+oXBzsyCi+zEGgZxQGs/5k16SnKW3J+A2bRKR2oZDwnRFzNNOiLbvZWKFNNad8mBF1fCVreWBON4tGlO1LCi+m2AOHIPHeuaJvwlbCaOqNHIIc6AFcGvqzjC5VMDKHsfrZiZamBL/kIszUWTvLMuO2fSIlqvVDZWOvumtRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtAxW6a+jkxMJrkMutSsOPuRFA12A3eaHQuBNH+AUZU=;
 b=apSzGK0kmsQ+RWfh/4w9SK/5vRkNFm1FUf4UFF7OmCeB3J/n/z60iCZ5jj8QTnOBi1KQHfbJV0vOVLit7kMQmjOZEFbunmIrOGd1mgWBiWWrhkTGTPOamSJ2SaPdk3Lnd4uoxDGfvDWlPgPHwtkc51/ecpxeK9fRhCYuXizZaEy/VHqUtgYdr+bqnCXaFiikW2SAouWf4FhUiYczjeR9VNSf/fz+BQj2faAb1lZ/kJuMssPtpqeqwGV0gf+md85AuTgnoqFBahMSFula1B4syz4hgwASTamzmwUlH0ioVD0CLAxrNmpvxFhWqD2o5+ocCpD/qAU3JD0Pwv47Wa/DFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtAxW6a+jkxMJrkMutSsOPuRFA12A3eaHQuBNH+AUZU=;
 b=ZEv/0/2GTYno6WdRHBOW5Ooe8+zZ9lbNjDEzg1vJcdYkOxMiSBYgnMEm+YrL8B90nuODiWah3LSkeg9kp+QEo+5Rd0zwtvg2JFT8lY2ntNQR69b8XKYVkyHsBz9VJL3G4idOitl4nXM1K+4Go2OAtOopq/1hZu5xpdQKwVKLHWg=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Mon, 7 Mar
 2022 22:12:41 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 22:12:41 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] Changing bios_args.data to be dynamically
 allocated
Thread-Topic: [PATCH v4 3/3] Changing bios_args.data to be dynamically
 allocated
Thread-Index: AQHYMnAM3cB6CUxdfEqfowWG8TKog6y0e88w
Date:   Mon, 7 Mar 2022 22:12:41 +0000
Message-ID: <BL1PR12MB5157BEF156685B3DE7B09096E2089@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
 <20220307220932.23607-4-jorge.lopez2@hp.com>
In-Reply-To: <20220307220932.23607-4-jorge.lopez2@hp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-07T22:11:52Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=5dc927b6-a33a-4c37-bdb8-0f7d2361f393;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-07T22:12:39Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 27396a1f-d9a1-4e7b-ba5e-f663a220bb2a
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77e5504b-a651-4d7f-2568-08da008798f9
x-ms-traffictypediagnostic: MN0PR12MB5932:EE_
x-microsoft-antispam-prvs: <MN0PR12MB593276A47A4ABB3DE4ACA4C8E2089@MN0PR12MB5932.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FB0sv5fxj0hqKVfp+mNnS0sOUoVdg1DkY1e66Ida3eDz9R3NoLSb37g3gET9SxNBqiHKjy86P0efmpE3CV4xpiKJ+mW5MfI7LDteguJyr2sSfhb0cPfvmvJyTW0cllxEkcdz/W10dPXTsIecd+dCDYShXlHsq89XwaocbtQ7kIWY77ZGrJqngh+2J96ct5RVDJ/7sDkyPdBzpEleFuilmTP4R/MtOgjMH7YUGsOsM408CZ85jKjdoV1M5Il3H9lxlxso7AUlEJYxl3Ae41BV4IEYivFGJ0Ar/h9y/8DAwnAU0DoL9q5K8WbAcfcY5HrWdyVLNeSwq/X8LDx0SdCjqvw8yyuXmSjzg/AnboFCDMFS8ujXtO5BiBwxo6nIggMfv1ybzO6G/e/eU02E/k/u467UPZ/GqFTgt0Hi7mIodFSFfdm255hh97QN/x/ccapru7IhKBO8h9TIeso2Pxqo//GZmiCTbfiMTqni9SJru+56RZ7YhfLdAZif5Ryts3wERjLUZhnCACZDv8ADJGY1Ds1S2jHGAXIaDsYNVdAMrD8jN4fjF+30+lVGVF33K6fE171aL4nDx3Zbdr6o98uMgSDXNp4KKAnvVYD8uLUmvAVOi0jf+6OunS3/Rcl9En7x9PItYNbt0Ck9WoAMX2gHPPkugeHWJgL8DwdN80ZxZTlHuAsgGZjIKI/P/h3OPeY+9TJKDrqqx0M5NvhUQXZ/E9zAlqQ2yUj8qRxA9gi/Ay2t+VrwRm9DwPUDVxjuYzsKrROsAkwyYowSkXql70tZxpFnyzPMxMgkbAktivTI2cI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(53546011)(9686003)(33656002)(84970400001)(316002)(38100700002)(186003)(110136005)(52536014)(66946007)(122000001)(38070700005)(71200400001)(55016003)(5660300002)(86362001)(2906002)(7696005)(8936002)(6506007)(8676002)(508600001)(76116006)(64756008)(66476007)(66556008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8g2kIu3RpXoXuzTYNGw6Yk6P3u0oU7vZJfEwyQpag10w7DDyPIe5opUhBFm/?=
 =?us-ascii?Q?luQ4BPKW/NbHXYp2JgJXMG8vYykL29q8tCdbgsGxyHaHJcMh2peTEZtGOS70?=
 =?us-ascii?Q?GOEFvBZ7ccCFqlxDNZCxYtDY+BXyBS9b1+BcNGjhN+gskoEQUAMlQeVrI0Cr?=
 =?us-ascii?Q?dJ5XG+wTBuQnmUK4xjCkjgn7M+xXM+bz1D0B71r1GeRIOD2NdH7KhICveT7s?=
 =?us-ascii?Q?NXnw1un5EdMVKCzBPaTMeIbGzI/zf6O4P0ms6q3BHbmtnCq5fTUNLBthU+jm?=
 =?us-ascii?Q?Uti+24SSrmsUtVED+1i19z6DCnUKC9NTIq7iHTvVfPTH9q1KUOW+BWqlGxxp?=
 =?us-ascii?Q?ns/xsNGAOvKOVbeAxHPr7AcqW/FMkiYZk3j71M5k4eBEmKvt8IMP88i9ZNRb?=
 =?us-ascii?Q?lTIDxhrod+DxYVOICCbZJICApFu0NW3QwikST89svloLDeP6tO3maYz1uLQX?=
 =?us-ascii?Q?lFSy4ejYnfNsnne93pIkoVf7UmTjJh9EJccUvCICOAgiYNmBDKEjV+eMllht?=
 =?us-ascii?Q?3JiFPuUvOJtnEZbg7AW4W93hd/taMKZGYbIkrca8gbdCSWrxPocIhXmt58n1?=
 =?us-ascii?Q?mCfX74KCjG6JlboZZLnFeXhYyriMOQNrLh/ZziTYjkjFXs8wqGdOnXB7rJfV?=
 =?us-ascii?Q?VEYL7IBSzC4WpN1V3XC8/z7beI87lpuu7J4/OgL89lx2ZybBi11n/3Sccy6g?=
 =?us-ascii?Q?9kmBR02A072DTlrsmPW65wsJAMS73wFWzfyL9aK6MgoU4YPKZK2na7UovFIp?=
 =?us-ascii?Q?zdpKiapzLEDb1i4AUMKUrIFcAVgZ84LJIy3tQwX0pqpsp496gKLSsZlKRs6T?=
 =?us-ascii?Q?hGupq/7HtJhyH8VBBrqweAiM4QnQB+2QmZt6NbsgR4J/3jOvP5ET825kh6al?=
 =?us-ascii?Q?0Ow8Q8OECmmWFVdZBvX76KKbNAAUZgo1Y9caAR3tOXlMBvzvBQjNVs4lnt87?=
 =?us-ascii?Q?otvUYJLicdvDHPrWgieWZkTP3KiQK85+KANpk0riI1Hh31LuZG9jcYVT8uEJ?=
 =?us-ascii?Q?JJMOvmhkpygVI/uyXePEH9Ghwh7ZK8Xj9Z+puaZEQV1YLC550E+1Osn5s5Re?=
 =?us-ascii?Q?Z9hiG6q1HAIy4r713WO1RdldkuUJWSbe6Ukhq38o+Tf80Ya/vh2uMnx21rGu?=
 =?us-ascii?Q?KoR1RP9i4nSdC0D4OCEeHEhOw09VYkulV2Hp4aMFyWDCZTs3dDE5jyc8ePHp?=
 =?us-ascii?Q?+L7t5DjIClnioM4fSwJC9lZ6ZthKgKM9VSJpZug0OAYrrhRqAja/vX4IsOia?=
 =?us-ascii?Q?emFp8pXZeewdVaTWoDXfegWAK/uwucK7rbJl4cccpzKFd0zWmYy4/aAy22eN?=
 =?us-ascii?Q?8TB+mXu263QaBV6JaxXp1vAKoPv8uCueShiILCIjnTIE6A8jYCRkDNed6D8P?=
 =?us-ascii?Q?9WaVyZJmAePGA+VRdfc6OHRiSa7S4k/OTbMphcXlfflG49T3KbvJUeQyMB8R?=
 =?us-ascii?Q?h7FtYe+NN+RBYAy43v21vekf5WQg6Qg6NhtmMd8ARoSaPut0+2nyNfBp5J3u?=
 =?us-ascii?Q?8upcXhc8UKF3QQsfxNzjYlSUECb/TsOyfhHJDRUBt3tuVj1KVVtPmM0xoB/E?=
 =?us-ascii?Q?3rsKDhcWebeqdEPBhkbFuTE+XxTajr/fJ1AqUT7bsTyh+pJB4vijq5WHODhS?=
 =?us-ascii?Q?4zCI1W86N92RkfXrNf2Y3+aPB6e+KP0Wrzm7iKxbMOdYRknJdBx81WoXdQ/Q?=
 =?us-ascii?Q?y+TmVHpCqUg3+7Lnf+TC/KHHhwY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e5504b-a651-4d7f-2568-08da008798f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 22:12:41.0428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6rc+AS3oD/BP5aZXTHY/cpb0cJrT5FW1W8komxDdrPcXfSdAPmxklb/mlJEIVRHf5Z91qCNkeiQbSLvzMSkJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: Jorge Lopez <jorgealtxwork@gmail.com>
> Sent: Monday, March 7, 2022 16:10
> To: platform-driver-x86@vger.kernel.org
> Subject: [PATCH v4 3/3] Changing bios_args.data to be dynamically allocat=
ed
>=20
> The purpose of this patch is to remove 128 bytes buffer limitation
> imposed in bios_args structure.
>=20
> A limiting factor discovered during this investigation was the struct
> bios_args.data size restriction.  The data member size limits all possibl=
e
> WMI commands to those requiring buffer size of 128 bytes or less.
> Several WMI commands and queries require a buffer size larger than 128
> bytes hence limiting current and feature supported by the driver.
> It is for this reason, struct bios_args.data changed and is dynamically
> allocated.  hp_wmi_perform_query function changed to handle the memory
> allocation and release of any required buffer size.
>=20
> All changes were validated on a HP ZBook Workstation notebook,
> HP EliteBook x360, and HP EliteBook 850 G8.  Additional
> validation was included in the test process to ensure no other
> commands were incorrectly handled.
>=20
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
>=20
> ---
> Based on the latest platform-drivers-x86.git/for-next

Was this meant as "changes from v3->v4"?  Or it's just a comment?

> ---

No need for double --.  Just put everything commentary below the one --.

>  drivers/platform/x86/hp-wmi.c | 59 ++++++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.=
c
> index a0aba7db8a1c..a04723fdea60 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -82,12 +82,17 @@ enum hp_wmi_event_ids {
>  	HPWMI_BATTERY_CHARGE_PERIOD	=3D 0x10,
>  };
>=20
> +/**
> + * struct bios_args buffer is dynamically allocated.  New WMI command
> types
> + * were introduced that exceeds 128-byte data size.  Changes to handle
> + * the data size allocation scheme were kept in hp_wmi_perform_qurey
> function.
> + */
>  struct bios_args {
>  	u32 signature;
>  	u32 command;
>  	u32 commandtype;
>  	u32 datasize;
> -	u8 data[128];
> +	u8 data[0];
>  };
>=20
>  enum hp_wmi_commandtype {
> @@ -268,34 +273,39 @@ static int hp_wmi_perform_query(int query, enum
> hp_wmi_command command,
>  	int mid;
>  	struct bios_return *bios_return;
>  	int actual_outsize;
> -	union acpi_object *obj;
> -	struct bios_args args =3D {
> -		.signature =3D 0x55434553,
> -		.command =3D command,
> -		.commandtype =3D query,
> -		.datasize =3D insize,
> -		.data =3D { 0 },
> -	};
> -	struct acpi_buffer input =3D { sizeof(struct bios_args), &args };
> +	union acpi_object *obj =3D NULL;
> +	size_t bios_args_size =3D sizeof(struct bios_args) + insize;
> +	struct bios_args *args =3D NULL;
> +	struct acpi_buffer input;
>  	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>  	int ret =3D 0;
>=20
> -	mid =3D encode_outsize_for_pvsz(outsize);
> -	if (WARN_ON(mid < 0))
> -		return mid;
> +	args =3D kmalloc(bios_args_size, GFP_KERNEL);
> +	if (!args)
> +		return -ENOMEM;
>=20
> -	if (WARN_ON(insize > sizeof(args.data)))
> -		return -EINVAL;
> -	memcpy(&args.data[0], buffer, insize);
> +	input.length =3D bios_args_size;
> +	input.pointer =3D args;
>=20
> -	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input,
> &output);
> +	mid =3D encode_outsize_for_pvsz(outsize);
> +	if (WARN_ON(mid < 0)) {
> +		ret =3D mid;
> +		goto out_free;
> +	}
>=20
> -	obj =3D output.pointer;
> +	memcpy(args->data, buffer, insize);
>=20
> -	if (!obj)
> -		return -EINVAL;
> +	args->signature =3D 0x55434553;
> +	args->command =3D command;
> +	args->commandtype =3D query;
> +	args->datasize =3D insize;
>=20
> -	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +	ret =3D wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input,
> &output);
> +	if (ret)
> +		goto out_free;
> +
> +	obj =3D output.pointer;
> +	if (!obj) {
>  		ret =3D -EINVAL;
>  		goto out_free;
>  	}
> @@ -310,6 +320,12 @@ static int hp_wmi_perform_query(int query, enum
> hp_wmi_command command,
>  		goto out_free;
>  	}
>=20
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		pr_warn("query 0x%x returned an invalid object 0x%x\n",
> query, ret);
> +		ret =3D -EINVAL;
> +		goto out_free;
> +	}
> +
>  	/* Ignore output data of zero size */
>  	if (!outsize)
>  		goto out_free;
> @@ -320,6 +336,7 @@ static int hp_wmi_perform_query(int query, enum
> hp_wmi_command command,
>=20
>  out_free:
>  	kfree(obj);
> +	kfree(args);
>  	return ret;
>  }
>=20
> --
> 2.25.1
