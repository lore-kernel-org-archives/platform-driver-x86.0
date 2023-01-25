Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5F2C54E94
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 17:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235581AbjAYRnN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 12:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbjAYRnN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 12:43:13 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D20415564
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 09:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFAm5r7NV6Jfcg3OP04XzORblItCua9MWHrj0+rI/0/gfLS5uD9sJbQ97MIJb6iLc8yHjKrS7RB6FW69SjRDsadctfEKup7tM+Z52YHS/9WHmx2ohQABsrlbRMx9I7DPmlI1wXgq/dfAsEgGuHJCosTKc3GcHzyqerQO7tT9SK9e2ojA60ZDcjmuD5XmMMmn+e4Kzdbu+i7gjy6iC2bY/0exlnzd+PIhfjVsoiXtKdj96gby5//0h8dlrfCc4v85KW+b619Q65K/gKhwi79FgA9EbV8FpR8msEEMIwIq2SHAiBURqw9h0MGfV3NQI/AbCzKUK+nQrcEZ4KxTWfoE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFsI+SQ5+0SgrTFfeAxdSqA2/UjOqx3b2YyKUx+B0Rw=;
 b=gbybbQaTN2I9iapL0CDaPBRvLCBlrUePnS0Veibf3uZ68x8FL7Vmd8oAFis3d/SYfjEM1u/dOJ1PLZxEEzUqTm1W2ET6xh80Cj8V84nh8vtXLjk9+ONOy1m2xzjeOYxLHrQDsdW4jcXby/VWnZjazDERLq87i1vgJIit1a+VuOrWDCIfrOJjDObru0eFPGWOEPsblDzFXTXMJlMTanOWiis27PNbXElU1BIaSUBH7hQnkOYsfU+g4P2AEnCWRs5VVbUGShK63EJHFZfnK65IeGRbIDcSJ3ii/frOEOGnEgQ3fwpFokAa9V6gf2O6Aj1aLMI1xqkmJVUdHYkSX6dH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFsI+SQ5+0SgrTFfeAxdSqA2/UjOqx3b2YyKUx+B0Rw=;
 b=SVYaRRWcyvV0SgVCbHZgeQTroa7EigIWouOYsKfvFefZbehEIu/INFaHdlm34Pjli3UYqRze2Zx3HwjvIWJtU4yLu5wgtuCnG02Dbs2FY0iFb74SKHLZyM9mAUwma+rO+GDPhG/4k0l+jiPcCbCRs/DEjgJDCoxz6bcdcl9aZQ0=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7538.namprd12.prod.outlook.com (2603:10b6:930:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 17:43:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 17:43:08 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
CC:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Subject: RE: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into the
 STB DRAM
Thread-Topic: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into the
 STB DRAM
Thread-Index: AQHZMLC81ICiV930aESU33yajpfKMq6vZ1uA
Date:   Wed, 25 Jan 2023 17:43:08 +0000
Message-ID: <MN0PR12MB61016002AB38595C34C40770E2CE9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
 <20230125113127.3862898-3-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20230125113127.3862898-3-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-25T17:43:08Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=cd6c516e-3109-42c4-a482-0d50bfa4f51c;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-25T17:43:08Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 7f0e9024-76c1-44ee-a347-362b0e48944f
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CY8PR12MB7538:EE_
x-ms-office365-filtering-correlation-id: 68da6295-d575-4b3c-36b8-08dafefb9f44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sUcEkCLtMOL8TsH+spqJFrI+mxO6baciiiWSV6UFApQVJgB+PJ8WtESnpPdh+WgcEqmSvlf/LSlo62I8QPpv04md6RktS4iewjaV8FJ1HssYaU8O/Nc2uypszvahrkgyeSc6B3AebQoP8nkwkZmaymM83JgG6AuGhvmue4YsqPw55Rq230Amb85HX4XgtYQ8pwD2s7YRFC7SFjgX0vUSNAjLRZCokNroqVoqxk/NjzGziHhtbM83Q64vXP/3Von6ZqzM1H10H0mTHCcSbCYSEchCBpbADt3b+W2v+uT3HKOX7zmNdgbKOnTbbAYgSDBHORbz+pYycG7HdSuKauAjLf/qH9HofOJ5jeFVWRcdoyZpfjKKDiFKqFLv39xGqKSqweiAmJz3dLPA9R0Zw0T95qR71wY7tJHqAzlFkJvmmKdpkr81ankH39qn5PugQX8KHMdIjO/TEnUxP3FOcMrG0jRYHUpfz4kQrpnLss1+e8xUNUdsdMGH344B+7WoYW4L53DCXmI1S+Mms4pmFVj46KUpyG8xwqCFRZrNBuNUwKHWU0cV3e8qv6H1ki03E7QhreRA8wyNtAa/lFwBv+AwrsM/HHQ2FUtI7geOmwDy+0K4iQQEY2oPe4WItwdFADh5YNny8hTkmXarr/NZtLcsVQiWzAGe5H7PAw8ObWzGGG524umKBvRyUn5990h3T/5pcjD/XJRFdP25pW4acr7I8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199018)(38100700002)(83380400001)(33656002)(5660300002)(7696005)(2906002)(41300700001)(55016003)(86362001)(4326008)(8936002)(52536014)(316002)(6506007)(186003)(8676002)(66476007)(66556008)(64756008)(53546011)(54906003)(478600001)(66446008)(110136005)(66946007)(71200400001)(9686003)(38070700005)(76116006)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MEblM98/a3EhYhogHoYL3vQPVTuju8p1wrAaGPSzWxMOavAwQY1pEoN00D6a?=
 =?us-ascii?Q?/wqyeqtI+iRUwdPn+tfB7DwpC+n+IfF66MIw24v4zrQ26Ibz4rqgUnJgYB7B?=
 =?us-ascii?Q?fYiI6pQd/mNm5zhV63DAJOpSDvMXqPeNbk6W02vsFJHa7a01qMaOV14BPKza?=
 =?us-ascii?Q?GlqrKDj/RdBGMq5sEuqt1J5OIB5Y8QMXUSX+M17Tv02ziSnN62WNdG3ru72y?=
 =?us-ascii?Q?ncv/dJDfBUGH73p899GkvVYseICF/fafdr9yhdTidgXxJwRyhp6u14QDeQw2?=
 =?us-ascii?Q?IOVUxyIcOTvx+l3/6VAwl42IDmgib1x8zQk0h+Ig8MPr9k1/xPjgbnrIpcZq?=
 =?us-ascii?Q?5ctpLRRhu8nBT00kALjBOqDLL+3amlL9jaVHtTFc5wipgXFhU8W/xmhlxvHy?=
 =?us-ascii?Q?uXAXSp/V72Ln6uik+qVZaCx9zPvsOJ273RVOz32ywOw8D6pD9jyQ+Qp2IS91?=
 =?us-ascii?Q?GM6TxpF0naSF9LNPJkw4jPpEox/ukoaxw0t7URIeC2SeRGwk92isC8YkN7Jx?=
 =?us-ascii?Q?ZlMg3TsISOUMs79eP+bJDolClFoUDUi15sgn7TADjqwX7O1hL4JfEAs03ju8?=
 =?us-ascii?Q?3peATOnpiMAp0RNx66HlU0i83N60Me21BoLit1n1UuKTeqBeA5KuafUOfB5R?=
 =?us-ascii?Q?ejeWDvzUSzqUSvl9iUjIvfAHSS+I7pcsmxjBtTurp2XS8gicCJtWLLoPFUMr?=
 =?us-ascii?Q?pTDb8ieNGwRqH5bkqBVw8JVxWCWcMr+Dy41+vOh40m5quSDcDn4n0wUzgbmv?=
 =?us-ascii?Q?e6Xhp3UOluJTGFjioQBvdfcBtLfVdJwx0Hwu7Uxs4s/z6jNKYxDDn9UdrkIn?=
 =?us-ascii?Q?8B4gI2hbooy3g093JvVIooBaje+Jxm3XQ+XuQ3HVa2AKYykHBQk51Cb/6Mg0?=
 =?us-ascii?Q?v00lcJNZpmGUQ5XqZvcOFHj4jdIUpGPIhX3dvnLOMgSiq8InNj/RaFUiSgMz?=
 =?us-ascii?Q?KbuiZAnMRqFoPwYXrf9GTbx8SwY/t4KriyGVss2VpDwxNCJL/G2VswwBtne9?=
 =?us-ascii?Q?BDj48xVnvmaE0MQCs0KCXsY08dbOFV3x6pUjhovNe3W+ar9zK7gyTpBMaOKB?=
 =?us-ascii?Q?oPim1G0Fsv6yR2lEJJhUWU53lrn/goc7FHTwxwoBFV80gbmCK+gOV8m62OUr?=
 =?us-ascii?Q?GMmDZ6UMBklrB0pfA0ed3tVX21s8sJIndnAbYINHyMSdw8GYQ6E5sQ04p3uX?=
 =?us-ascii?Q?x5oJsMheaJ5Mk579ZA9HqcQSe/9TBct/83Pwpgv9VzwOVcQP2JN3lSRmORNn?=
 =?us-ascii?Q?wXGfrHrgfFrlI3npSXim0jMQpt4LK1ewAnR8i/VzdFQFHiiPezkpEekfDja0?=
 =?us-ascii?Q?yNmke4yqihowvq5ALK9ywC2JzyzdKWyeqe7c1Ou+GkB6xazSPxrXjN8/EAjv?=
 =?us-ascii?Q?IF8DjPscGfLC9TluPg5MLl/1pesX3IZhCIsP3alHIb6KpBnOhXcBYDK//K3U?=
 =?us-ascii?Q?Ivwyn8FXiUdBROdav+XGZey30dtjQDsGFqB1RaIvJCf6IKfzBBFJp/V/CkY8?=
 =?us-ascii?Q?YIRKEtKEoyYfzrtWyX1/62Sd0wBwnyomkLuDUI2V5xZGb/4LmTKYQFSNXU1S?=
 =?us-ascii?Q?tNXEjW5lFQu1uUSPF4Z3tFSQI2Pd8xLnjZxEqRV1uuOBhhZ5OWRbaHOK0s+j?=
 =?us-ascii?Q?6sxBshFgjtH4cpqjCaddkEo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68da6295-d575-4b3c-36b8-08dafefb9f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 17:43:08.8484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0zWHo6YMvmNU/tohKz+LVvtacaLRb5lcQY0k9vRzuxPov1spWkRqLR8Tc+MXN3sTz6r9ZfBepvDe6THEdjukw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7538
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Sent: Wednesday, January 25, 2023 05:31
> To: hdegoede@redhat.com; markgross@kernel.org
> Cc: Goswami, Sanket <Sanket.Goswami@amd.com>; platform-driver-
> x86@vger.kernel.org; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Subject: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into
> the STB DRAM
>=20
> Based on the recommendation from the PMFW team in order to get the
> recent telemetry data present on the STB DRAM the driver is required
> to send one dummy write to the STB buffer, so it internally triggers
> the PMFW to emit the latest telemetry data in the STB DRAM region.
>=20
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/platform/x86/amd/pmc.c
> b/drivers/platform/x86/amd/pmc.c
> index 01632e6b7820..0dd9fb576f09 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -43,6 +43,7 @@
>  #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
>  #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
>  #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
> +#define AMD_PMC_STB_DUMMY_PC		0xC6000007

Is there significance to this specific code? Any particular reason
not to pick an incremental code like 0xC6000004?

>=20
>  /* STB S2D(Spill to DRAM) has different message port offset */
>  #define STB_SPILL_TO_DRAM		0xBE
> @@ -250,6 +251,11 @@ static int amd_pmc_stb_debugfs_open_v2(struct
> inode *inode, struct file *filp)
>  	u32 *buf, fsize, num_samples, stb_rdptr_offset =3D 0;
>  	int ret;
>=20
> +	/* Write dummy postcode while reading the STB buffer */
> +	ret =3D amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
> +	if (ret)
> +		dev_err(dev->dev, "error writing to STB: %d\n", ret);
> +
>  	buf =3D kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
> --
> 2.25.1
