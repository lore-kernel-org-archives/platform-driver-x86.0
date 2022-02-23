Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA2DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Feb 2022 17:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237482AbiBWRU7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Feb 2022 12:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238652AbiBWRU6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Feb 2022 12:20:58 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57843465D
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 09:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkxwZWUfeb4DnpdqE8UAZqpY9jPWTqW+GsBqA/PABVvQhfwSRRCSq8exvweVBg3zmvGOiT7WiWUSae3QSowrU/4BuHJ+XtO4C1mYM/JZWiahVPNMBPuCJXdZNRH9/IqA0x/afR/gQOZnZXw7pXKrGjoIYrF53rCzp7YXB/LHB35Yu+vAp4DZxQa/RicYV3g0wtCV4gbnJpsZbrB8r9eMZlKtmCTsqKpa6xHvoKmCSGI3sZpQO07gEzmWrK1QaHJsFOxknElECVYQ+n1G0Zdtz/T1Z69gLHzrRAk/Cr5xAsBbhTYvDidWoP3EiheaOKcHVNL6tvNU1REur7TImzhZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjU/9gPQXVK8CvakKnNoW1Ql4AmWAA9EL0TZa+mxVcc=;
 b=fiTjaFKORFVScl+HdcO92V9rCgcvYRGBHRyFh4jmSWd/WW7cNarbbyd1ZVm6zErqXmRcEcDPvA5gRwNBPZY7gH4T4mJHIwXJXyoX2vgR2brqVnqjVFdt/IRal8KyT5OMBkHoHBjfl+JjYvf+w5DbDTKZF/vbO5GxAON3aqj6a6bDuCBU+7bq+GIylxlQXTVbmAd8Xjh0sVHzHqOvGKY4K5mHMyA1T/h08kqbIRH3I4K2Lhlu46HGwUAv/UXIe/x99pMFvnMOZT2uQWJ5L7Pe0Iow28IdZDjZct6xUCT+o6LdarSYyKmvO+hrWIRwsqgXI+6KCSwZeswMWxOAwWlh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjU/9gPQXVK8CvakKnNoW1Ql4AmWAA9EL0TZa+mxVcc=;
 b=yY/c6+xCGOAEylUi2hQTzjQXdLvXHiXV9Knk1XU1blt6qMmtToA+/c+8IoykLvuHfl1v68RdLukzUEqU/UHEgfvy3jH0/UMrzx/kj18CykhlReNnpt8GkyjZJwMoX+fRKRiAbchOq64RViOXkHm42u4ZqafgqwmX8Nystt7Lspo=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BN6PR1201MB2465.namprd12.prod.outlook.com (2603:10b6:404:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 23 Feb
 2022 17:20:26 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 17:20:26 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Goswami, Sanket" <Sanket.Goswami@amd.com>
Subject: RE: [PATCH v2] platform/x86: amd-pmc: Set QOS during suspend on CZN
 w/ timer wakeup
Thread-Topic: [PATCH v2] platform/x86: amd-pmc: Set QOS during suspend on CZN
 w/ timer wakeup
Thread-Index: AQHYKC8Vdreypam/tkSYci1O+P1gWKyhYXkAgAABRLA=
Date:   Wed, 23 Feb 2022 17:20:26 +0000
Message-ID: <BL1PR12MB51575812E1D30CDA546A9892E23C9@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220222205926.25779-1-mario.limonciello@amd.com>
 <072deddb-e477-e457-b2eb-ed3a2e0ea2cf@intel.com>
In-Reply-To: <072deddb-e477-e457-b2eb-ed3a2e0ea2cf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-02-23T17:19:48Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=37b73995-6b91-4a2b-b4b5-fb672279c11e;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-02-23T17:20:24Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: ee48cd73-49c4-4910-acf9-042734349f6f
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b3dcd37-bd21-4b91-0966-08d9f6f0c862
x-ms-traffictypediagnostic: BN6PR1201MB2465:EE_
x-microsoft-antispam-prvs: <BN6PR1201MB2465EBFF8E958E695E6F04DDE23C9@BN6PR1201MB2465.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uoz/quxlRle8l5GS2DWO/oyiMmShjKIgCBVkRAFmMeMwqScYY8qQ/a8e96b9v7Ddef6/7wD8GqDGCEE4Tm59U2NhPjM67aa2M7js0dT85+TnSvEODdY69RiUyN/PGUiZvVaRwx7lDz7Kd7ozgm5yWV8iz25P0VpGLi3g4D6Peu1K1Q3vqW5DUnNB94s8KmrjPvJMejKOoFr1+rHRl/3kRm7yq/bnywmsd3VfCGtGJfTpGqD9l5Wc65dHofZmbxqx/uV/IDw6Z8u8OjIPFeyIYUEWIi7II8bYEATII5Z70mvhGHuX38PsL9UQrl5sqzzCkZmAVnUbk085HG0eYdWuqxVunLXrNL88KBsXXvfLrlax+q0uOe1RJkAI287ECl8uquy7gItOw1K60UDR7nl7xsqQ5wp73nPONzmUK8zxbIcRWm/nul1XIpjoPgz3vCYlK7ECupZpcHnPD8ZhwCD0O/jvaIScxjoahImomL6LnEn1NOmDl2DvjhJiKHYCaBUos4tpfw6IT0QsJD7D8RrwNV7NeCeucyslf/Vlo8WuLRk4FPxs7CNgVxULDoBbIWN03LO7ts6JZlZuyBDejcB5OhbHF28wQd3VSuDkQQHEtK+HuRMpHCMPSW6LgMW/ETzOKDXOo9ryWartCTL0Abxss7LaGQrNtq4BUzJigdtFxeYmn61a6ktNzGE51hthYphyehj4FvX3gm3DB3ACGD0Tgw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(2906002)(55016003)(38100700002)(86362001)(122000001)(54906003)(6506007)(9686003)(64756008)(7696005)(71200400001)(186003)(66556008)(5660300002)(4326008)(15650500001)(76116006)(8676002)(26005)(52536014)(8936002)(508600001)(66476007)(33656002)(316002)(83380400001)(66946007)(66446008)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ns2ByaA/NlAh45c9yt7RkhqDQlvHqsVM2tcqpCHe4wO/d8gfM6lF7XiBFY?=
 =?iso-8859-1?Q?RUWc3u39GDfmT7eq3RNiGOo6JJYV3IV9thuAO/MAPOOSTUmjALqZ+5tWlR?=
 =?iso-8859-1?Q?0rdWa2zyvml/j5jmOLCzBSF/iGpvm1wMn+6L2DKcaEpxL8Dc6WjOha0x/t?=
 =?iso-8859-1?Q?YnaFK4JYpyU3xmNxmJzxJqLXXcxsTCb2cRcN1775gAKtpLt1mvwAbY6TTF?=
 =?iso-8859-1?Q?SJyLleYWN6/cYm629Fh7bI7T6l6zYdn3ILl0Tac6hQwY2G9aUWP7DnxQ2K?=
 =?iso-8859-1?Q?cYukYU5WLIO79AcuZghgAjvKcSqVx8tzfj52N/UPU5CKnB3MvjPaC6T+kV?=
 =?iso-8859-1?Q?Tj2I52PtJekNCJ7uhc6K8VGS3SsqfyPAHhHkxPJgixMbbQcnr/hlY5HgM4?=
 =?iso-8859-1?Q?Uek/5PNnh3aZ+IIUJqSE8iKcf6HSFlcEk3AhCKEj9577B47zK1bx6Jhwpm?=
 =?iso-8859-1?Q?zxRwJ9JcqKtiEcEHEPe29odMg4Z1dS/U52R0GmQMuYnegv1dfj1kM9qYFd?=
 =?iso-8859-1?Q?RQ42rlgxNldKIU80rfdZuny1so5KnDVlIaICZPocP6xfSDkUZjzGfeMCeE?=
 =?iso-8859-1?Q?YYef11zIVR3xF2IkQuvUSYfQZVADdM0ntKe2mS8/c/ysgC/yJCtSJcHcnL?=
 =?iso-8859-1?Q?iROGgGwyGPFw0o9/auRLPwOOrWoqYla+5tVfjsoy6q6Xc2ICEFgXelcONR?=
 =?iso-8859-1?Q?Ot5ew/PHfEh9Px5btIiI42EQm6osZDmDgovlM4TvBu/tJTMXdaKCbB4xIj?=
 =?iso-8859-1?Q?Atk6aOQXSF78r28Tvkbl0E4nQH4X4h/oZhq4OeDikIUcNbJK0otLsD8a6j?=
 =?iso-8859-1?Q?16IjToSZS8CiWsk56qKufeD6mRvzonZD1vhnRL3rCu3W7zbEEW1tgEsEtS?=
 =?iso-8859-1?Q?ECXNsozPcCbEDRQa/YJcEAYRsACG1Gage00abKMR4LIYheEMiX3MHVTvNi?=
 =?iso-8859-1?Q?LWQOjVCc1P2aC7UDsZ8QaNS+n5a16BQQzXD3aS9E7gvxnTfstsIk4Atb/G?=
 =?iso-8859-1?Q?4poljEEo5pqhM0ci+CwjPoeG3xlICLmbg6EaQFoOvsoCzTp1IczwIMViGZ?=
 =?iso-8859-1?Q?VNEAn3AC7cNcd7qo+mfhACy1dVjSKyomIsxlGA4d47tt3icRkbE0wZqYdf?=
 =?iso-8859-1?Q?VBAWntzQ7E7rcMiavgqs1a48A0DLlUckvPN5ohPWVMpk12w3ONGi8p6r3S?=
 =?iso-8859-1?Q?ZmEn76L/0sqp5I0FqN6nWino7+qYEwEl7LJhK/FEi9HnuLhEHQj67FleX4?=
 =?iso-8859-1?Q?M8hDt1MwRwtLgyDFaEyR3z8TkJ1j8nDP/5MNYfA/IRc4XlD7utd/0zjqEJ?=
 =?iso-8859-1?Q?LDk1mo6Ne5C3D5hhvOdpTdXwA53IJKzhwMyF9cic4nF2cVzTD0oxIl0lXm?=
 =?iso-8859-1?Q?Pm5bOClZxAUrzy8AnAIF3oY/r4/M0xHB+ReKdo+3Dv1ZE5CaduWaWj+DMJ?=
 =?iso-8859-1?Q?Jnbus3UVukp8dq4ymM2K7wkyaW1RLDnfIR/bdYuj0kGhJ1FFFDDozv0GKs?=
 =?iso-8859-1?Q?zf7rZDSJozigfVx4CTmnDb7ztABznWb/Di43dBjUjI7pZs4ADMX9D6FKLl?=
 =?iso-8859-1?Q?lY09x+ozV2D0d2rLQI1tcLr6YDvHy9woW485aO0Wqc0ZFwv9qh/6BsidSB?=
 =?iso-8859-1?Q?SRbKQUeH2XP2JVO3inETBvNL6du7x1/46f7peRtEMnAGfFY+PjTAE5Mx7h?=
 =?iso-8859-1?Q?HaQGY+xfvGGieXDX8Ao=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3dcd37-bd21-4b91-0966-08d9f6f0c862
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 17:20:26.2525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fC1pf6Np1sNExUItSDKJz4mab/II6rc4A5ePri+90+Ew1hFLUZknXp6fk1iY8iBX6krB4MqQ6W0XsJVrCpHwAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2465
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]

> > Changes from v1->v2:
> >   * Update for Rafael's suggested changes:
> >     - fix resume comment
> >     - undo QoS at end of resume instead
> >     - Use smaller number for QoS to allow C1 entry
> >
> >   drivers/platform/x86/amd-pmc.c | 39 ++++++++++++++++++++++++++--
> ------
> >   1 file changed, 30 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-
> pmc.c
> > index 4c72ba68b315..248dc6735f5a 100644
> > --- a/drivers/platform/x86/amd-pmc.c
> > +++ b/drivers/platform/x86/amd-pmc.c
> > @@ -21,6 +21,7 @@
> >   #include <linux/module.h>
> >   #include <linux/pci.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/pm_qos.h>
> >   #include <linux/rtc.h>
> >   #include <linux/suspend.h>
> >   #include <linux/seq_file.h>
> > @@ -131,6 +132,7 @@ struct amd_pmc_dev {
> >   	struct device *dev;
> >   	struct pci_dev *rdev;
> >   	struct mutex lock; /* generic mutex lock */
> > +	struct pm_qos_request amd_pmc_pm_qos_req;
> >   #if IS_ENABLED(CONFIG_DEBUG_FS)
> >   	struct dentry *dbgfs_dir;
> >   #endif /* CONFIG_DEBUG_FS */
> > @@ -521,6 +523,14 @@ static int amd_pmc_verify_czn_rtc(struct
> amd_pmc_dev *pdev, u32 *arg)
> >   	rc =3D rtc_alarm_irq_enable(rtc_device, 0);
> >   	dev_dbg(pdev->dev, "wakeup timer programmed for %lld
> seconds\n", duration);
> >
> > +	/*
> > +	 * Prevent CPUs from getting into idle states while running the code
>=20
> This should be "into deep idle states" now.
>=20
>=20
> > +	 * below which is generally safe to run when none of the CPUs are in
> > +	 * idle states.
> > +	 */
> > +	cpu_latency_qos_update_request(&pdev-
> >amd_pmc_pm_qos_req, 3);
>=20
> And I would define a symbol for the 3, possibly with a comment
> documenting it.=A0 Something like
> AMD_PMC_SUSPEND_MAX_IDLE_STATE_LATENCY
> or similar.
>=20
> With the above addressed, please feel free to add
>=20
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> to this patch.
>=20
> And thanks for taking care of this!

Sure thing, will make those minor modifications and send up a v3 with your =
tag.
Really appreciate your help and suggestions here too.

>=20
>=20
> > +	wake_up_all_idle_cpus();
> > +
> >   	return rc;
> >   }
> >
> > @@ -538,24 +548,31 @@ static int __maybe_unused
> amd_pmc_suspend(struct device *dev)
> >   	/* Activate CZN specific RTC functionality */
> >   	if (pdev->cpu_id =3D=3D AMD_CPU_ID_CZN) {
> >   		rc =3D amd_pmc_verify_czn_rtc(pdev, &arg);
> > -		if (rc < 0)
> > -			return rc;
> > +		if (rc)
> > +			goto fail;
> >   	}
> >
> >   	/* Dump the IdleMask before we send hint to SMU */
> >   	amd_pmc_idlemask_read(pdev, dev, NULL);
> >   	msg =3D amd_pmc_get_os_hint(pdev);
> >   	rc =3D amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
> > -	if (rc)
> > +	if (rc) {
> >   		dev_err(pdev->dev, "suspend failed\n");
> > +		goto fail;
> > +	}
> >
> >   	if (enable_stb)
> >   		rc =3D amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> > -	if (rc)	{
> > +	if (rc) {
> >   		dev_err(pdev->dev, "error writing to STB\n");
> > -		return rc;
> > +		goto fail;
> >   	}
> >
> > +	return 0;
> > +fail:
> > +	if (pdev->cpu_id =3D=3D AMD_CPU_ID_CZN)
> > +		cpu_latency_qos_update_request(&pdev-
> >amd_pmc_pm_qos_req,
> > +						PM_QOS_DEFAULT_VALUE);
> >   	return rc;
> >   }
> >
> > @@ -579,12 +596,15 @@ static int __maybe_unused
> amd_pmc_resume(struct device *dev)
> >   	/* Write data incremented by 1 to distinguish in stb_read */
> >   	if (enable_stb)
> >   		rc =3D amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF +
> 1);
> > -	if (rc)	{
> > +	if (rc)
> >   		dev_err(pdev->dev, "error writing to STB\n");
> > -		return rc;
> > -	}
> >
> > -	return 0;
> > +	/* Restore the QoS request back to defaults if it was set */
> > +	if (pdev->cpu_id =3D=3D AMD_CPU_ID_CZN)
> > +		cpu_latency_qos_update_request(&pdev-
> >amd_pmc_pm_qos_req,
> > +						PM_QOS_DEFAULT_VALUE);
> > +
> > +	return rc;
> >   }
> >
> >   static const struct dev_pm_ops amd_pmc_pm_ops =3D {
> > @@ -722,6 +742,7 @@ static int amd_pmc_probe(struct platform_device
> *pdev)
> >   	amd_pmc_get_smu_version(dev);
> >   	platform_set_drvdata(pdev, dev);
> >   	amd_pmc_dbgfs_register(dev);
> > +	cpu_latency_qos_add_request(&dev->amd_pmc_pm_qos_req,
> PM_QOS_DEFAULT_VALUE);
> >   	return 0;
> >
> >   err_pci_dev_put:
>=20
