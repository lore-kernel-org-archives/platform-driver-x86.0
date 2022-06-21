Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F89EC43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Jun 2022 17:55:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351393AbiFURzE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Jun 2022 13:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233529AbiFURzD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jun 2022 13:55:03 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD7E21271
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2022 10:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJxH3IWjoOVBUA6PLB0E7+zabMQjlTRjApGGA9sMC9Ugz295GgH3C7aqOtMPbxkio7xXQuke6rkSV7KNfp2pLJcHMeJvzLVEZJRij6NKGchksAc+LvjKBAXcrBbtEwPQPrvfM3SKWvDmwEN16Cu2i8LvMkS2b2JShIzI6q3TwdV0h2iLKy3f/mjnTE1m0azAd6d/w8ML0bJGS0m+KPX7Nmofxa7gnwofyXQPhVkDbufUSxW4s1ejGoiy230jr+FyzhxwFkHc9bZZ/6IQKTfNkvqLX7cPqMks6GirjDBJJYnzJZBES+qZINR2PClEkeSRLh6DYujdl4B9Qa/FmAJYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlzwDdjG25r9KajhWeBALViz2zHtbeYuHV9pFl+hh5g=;
 b=QTDxOZqx1OEA802etn+fGMmn9x7lgEeC5NiFVpQywSGBqxd31MaGx1skOu+hXRNDAMaf/zUE/H7taUFCx24eCdb4EfFkY1YWSzkO5eD1bs+dkuuo+3awWhaT9OKeAOGdzysqnQTlQfENIX2kBg4XJkZCtW3dYie6ldwo8wD+YRhbeFV4/IbmGJnrL6ms4a/ksud6TBf/AzoTvWnMOWbYJCS8nmUmZWpCcNb1eq/SNT/BYGThS3xZMlryY9PvBiaQHjqludKDNAGlvGFe7wtNib01i39sdYMFqC4NMapFN8chN3RSxXZMWbuCofuCwVwUaFAT7Knt6NFuPXY+TxHbpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlzwDdjG25r9KajhWeBALViz2zHtbeYuHV9pFl+hh5g=;
 b=giEWSELhUUOfl5MvxlKLBlofGhLGtsqUwaXXUvSWeZ8kiq1VHnuPeMvR8QdU9hut/yxmwPja4GQ0c59xs3UEGwbWhPbY3qvMBvy1WxPMoW04eZ/Q3E6uxUDTn/pnyFNk6eWR3YrXkW2vjCdrQNw09pFR3Q0gGnl+mSCVhKDJKqg=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM5PR1201MB0153.namprd12.prod.outlook.com (2603:10b6:4:57::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 17:54:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%5]) with mapi id 15.20.5353.016; Tue, 21 Jun 2022
 17:54:59 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Jean Delvare <jdelvare@suse.de>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Subject: RE: [PATCH] platform/x86: thinkpad_acpi: Fix a memory leak of EFCH
 MMIO resource
Thread-Topic: [PATCH] platform/x86: thinkpad_acpi: Fix a memory leak of EFCH
 MMIO resource
Thread-Index: AQHYhXaJMKsk0/V0WUiUaZs/k3uU5a1aJPQg
Date:   Tue, 21 Jun 2022 17:54:59 +0000
Message-ID: <MN0PR12MB61010927D68C8BF95697BB92E2B39@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20220621155511.5b266395@endymion.delvare>
In-Reply-To: <20220621155511.5b266395@endymion.delvare>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-06-21T17:54:43Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=09771020-2f6c-4981-832b-6685dc009aeb;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-06-21T17:54:57Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 6cc26b77-af96-41cf-b9d1-9873a63988c5
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97d1f218-e1f7-4888-c618-08da53af289e
x-ms-traffictypediagnostic: DM5PR1201MB0153:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB0153E05EE715F3A415ED7BE8E2B39@DM5PR1201MB0153.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sfb684w/6JzEHQEYdc6vrHH+YnfMbqeNUzdhESU7ZlMvlc+w155etxH2rJ/HGfaR56+5Wi7DSEKmgxebcZAwGUxhv5iLXFDRDG8XCcBRfehxWP7xkOZM1JVWNJ053VqYnICeQKU3S68cl/yBxQuKG2DF3icB7Fs0ZieSA1J8AdA17GxkuqhnJG7Nr3BJjfkJkco0eg9Z0oFEgnrslKUjO0k7WtnYmsbTR3LzMiZlN7mzrXNv4dhurlFqJPDmSq1CCnEphXH1UWum9wensO1TnxjhN9aZzpH7wuSWb4FzM7vdLqVBmmwfLhE5fV/7oJaXSK+L+X9VWEMaiEGuHfdDBAYOzt7+lV6mDqca3K+EowdiXA2DM0nRFYbWzIs4zTHn6fOcZIU9uxi3GeFIKN9h0BrfK7thQYBc2POInDKaj9S7FuTPFzYQZyC5/ZvlkhXKCq/kKNZSn+9lsUSFrABH2Js/S33rvagRNR0orc1qB3F+GwAL/nKAqQqzYb9R7t2jDN3U+hoofb7l29GbVhp+gD1s5tFbF3sxvs1htqfl3SOdLb68qsyr08pSeROZlolgrYE2LSVNwFRMa4Q3xJ6+TTLraMw8zsu7sQdUCe0cUDPXKSAd1TNhzT80UQ1x8JnT7WqRwbveii10N23/mdBdxZaqrl2uHA4xT/Lyp+X2vxVdtsJBTPS8H5zpuJOGjW7aZ4bXtE6gMJJOYx4c4XAdNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(83380400001)(122000001)(186003)(4326008)(7696005)(38100700002)(55016003)(38070700005)(6506007)(53546011)(9686003)(2906002)(316002)(41300700001)(26005)(33656002)(54906003)(71200400001)(64756008)(5660300002)(66476007)(66556008)(76116006)(66446008)(478600001)(110136005)(52536014)(8936002)(86362001)(8676002)(84970400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Px+g0Jiq/7eBRkm+RMkn7Cf46cQvWrPNAHMm3tfHV655V+LImXHYYfaGGWN3?=
 =?us-ascii?Q?zcujGpGElPkcl4sBKNYF+J73oTAWZrkUzSMs4+dRA04W7XU3Wm9zGV7LGnWZ?=
 =?us-ascii?Q?bcBb0VLUIeLxeQnJ3cogSUlXv05cqSdPmSGnwlVqs1cXeTglkw24uRkgbP+9?=
 =?us-ascii?Q?LE8/6rjp9oXCd134qd0CKo5EI8ptvzHkci7RBvyoXu6cSiTWSdAYVuItURSh?=
 =?us-ascii?Q?w+d5GszRyJxrBTvx/Ge4c0+nJVT5RWleDpCx03ZkHxYYpem8bR/38yjxgHiv?=
 =?us-ascii?Q?JHt+hlo0Zt5D4AuqB0dMP4Cs3yajI3QpUqDnH9LhlcNUMrHSr298hJ0Vt/0G?=
 =?us-ascii?Q?KljEIG8FCM0lRiycNgp+jzrDKTcU0zhcw6uSLbnTfQtt8c/j56DgqUc87OdB?=
 =?us-ascii?Q?Oh/ec96j59KYBtyIGQ7mV44SOybhYnx/KwkeDc2Y1UTa7UOQA5qotZrP72he?=
 =?us-ascii?Q?IfiPr5NhJ5d6z0ke9sPc9fSXM8m+MiJxFBEfxo1Ey7Sm1WB/rNB/TDg2nHaT?=
 =?us-ascii?Q?dWmLe+zcNXFJksxCfL9EPE0C+zo5tnx//BWuu1Yp8lYphCvAkDFqTlJja9fr?=
 =?us-ascii?Q?54ycHydmLZW0LSG3JXcKqVz+ctofB9cUAUFkMVx+W8wQ3CUyXJwA/3PSFsbz?=
 =?us-ascii?Q?20ER/fHj0WJiZHYMHrhHOChfhdMdH/tyF/nD5qXK+1utkDeuIwNfqJNdWHBJ?=
 =?us-ascii?Q?yRvv227JKH4AcayMaFSJ47yl5JCU1uiFkZ6vjG0alwun3mEcxwXLzVYrm7Ih?=
 =?us-ascii?Q?uBOO5SciXtlW9rag1aRDf12KteH0BfIaYc9NbtRlx4bQ2NhbRdJwHBAWZo4L?=
 =?us-ascii?Q?7lsJgoNb+8MsMTRzuNDigUEn22649j+iunQu/kezTNh2nVcp3pBW0jXXFPFD?=
 =?us-ascii?Q?9JtRI5CUsoukasBcHDZYDiHESDiFCxMtYaRT8FyqDTO4b8o8o53U/oLzaT/B?=
 =?us-ascii?Q?5MAWRWUIDyGcFHKcr45Syy2hmoM62AYLu69zFzRcp9pk4J4Eq7k9a60fZ8n4?=
 =?us-ascii?Q?S7+OIfqWoaVAcFWZs5vgi8EphXTufyfrVmRXU2VKGK0obGjABODyOhbFCuyZ?=
 =?us-ascii?Q?3d5jlV6jbsV6ZxFWY5+/jKdfwrBn4CYPEmudIcu1cmtldTL7HQ2enVvDxIpN?=
 =?us-ascii?Q?Kw0entQ7rSBr2e53/PYrCrwcnh1qXBt9AKIoij9ph/ctLvrZlK9/TIvMF0EZ?=
 =?us-ascii?Q?H9GT9/SXupXkR1FHmlBcnf8zI15qXiPDQTJywcycaGISHbdA/LF/QOofgEb7?=
 =?us-ascii?Q?aeshPbTQQmJoKVXQ0UtrUdEdY1WiQguRoezrtC9xmCez+NSKFlkgkb0d3oku?=
 =?us-ascii?Q?RjEIajcZaP3mer5JEU3iMOoFiwJMSKypd7wFV8XCr0YemzhTLEsGftC6SJhO?=
 =?us-ascii?Q?ThKD9snKqbjSMgSWWO3Vx5W7UYL93gjuLLxebHrqSIcrx4v73ojVoAAzfO9Z?=
 =?us-ascii?Q?XLqEK8dBFcdRqzjYA6RKytPw2+wm0HSGUcHrvgKSNRhjzJzb/ueV6p88DMTV?=
 =?us-ascii?Q?6UZN+ChCTeO1itJVZgQCKEBYpfCv74+AHcBejg7mWYQHXKmAlVXTwA3JTXcz?=
 =?us-ascii?Q?Fe/OP+UXE8RIEjUyFAJeybZoTtaHsGN+2yNYZvDOx7pyDgAyrMtzjKF9k00y?=
 =?us-ascii?Q?HJmJdbVzSKVJCfFsWkvbDl3GsKeXNqgM+fOu998kaPn8Ty0US10tiNqyj7sH?=
 =?us-ascii?Q?0sEUz4sDspYUwKpBOB7nLKvCDzTwsJ8jpOpS96SzIYf8ezj4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d1f218-e1f7-4888-c618-08da53af289e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 17:54:59.1910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a08NmRFcnJ8y84cA/cUhpVwTPbl8zSnhzeIvmjCjrzQpDtQ163MlfkIf+TT9vWmDy2X/NotowRj6T2ncIDH2tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0153
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: Jean Delvare <jdelvare@suse.de>
> Sent: Tuesday, June 21, 2022 08:55
> To: ibm-acpi-devel@lists.sourceforge.net; platform-driver-
> x86@vger.kernel.org
> Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>; Hans de Goede
> <hdegoede@redhat.com>; Mark Gross <markgross@kernel.org>;
> Limonciello, Mario <Mario.Limonciello@amd.com>
> Subject: [PATCH] platform/x86: thinkpad_acpi: Fix a memory leak of EFCH
> MMIO resource
>=20
> Unlike release_mem_region(), a call to release_resource() does not
> free the resource, so it has to be freed explicitly to avoid a memory
> leak.
>=20

Thanks for finding and fixing this.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 455cd867b85b ("platform/x86: thinkpad_acpi: Add a s2idle resume
> quirk for a number of laptops")
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> --- linux-5.18.orig/drivers/platform/x86/thinkpad_acpi.c	2022-05-22
> 21:52:31.000000000 +0200
> +++ linux-5.18/drivers/platform/x86/thinkpad_acpi.c	2022-06-21
> 15:49:31.705166709 +0200
> @@ -4529,6 +4529,7 @@ static void thinkpad_acpi_amd_s2idle_res
>  	iounmap(addr);
>  cleanup_resource:
>  	release_resource(res);
> +	kfree(res);
>  }
>=20
>  static struct acpi_s2idle_dev_ops thinkpad_acpi_s2idle_dev_ops =3D {
>=20
>=20
> --
> Jean Delvare
> SUSE L3 Support
