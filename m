Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31082C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 22:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238380AbiDDWwK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 18:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiDDWwB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 18:52:01 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8DF4A3DA
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 15:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFJGvkF86f/pTsPV9AQpnmb6yNAeTC6uGCOZ57hXSYLIbsOOIG26bPZajred/cYxZ3Ahi4DNjALQxgoLsBYFqQ67yIL3jiSWrx1vxkZhBUzRXoPtLJNuWeV4qsPRtV8Q68V1KO7lfsnp+DaxwF3s0Zj6r0Nc0xy44a58N7xElyaRtOZIfTC6HoP7dgg2nyYANCSp8SpWDMuK11lQrOTredxJzj5xlJRrlgA6HSjryCxrgtBPyk3xWtXB1E34PBYEXdJ9M547h/3EXM3PGQCfGCRNWoOF8WtzXAkHCIHhm8rA2Bk6+a6E1cywfFNogyzqC2nhOgqpdSyU30gpW9rS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h89w+RJr3/5I0oj84mEDre57IMG40a4/H+TPYT8GPpU=;
 b=bZB/+AP3Jbxp8nQ5Hd2MZhuGL/eQrjY9FhR5PEi60Q5YqZz+5iIOkdY1zyIKLrsaP8DHE75qOeOT/au1KHB1uFVRLFVeCFejLygBJHkAD6mPnDyvWDxslh0dqpT6cgh16Ljzl4rP4oDKjjLRpRxfacP5GKJdjSF4LOPYZtaMtK66gHvKI3C0PSXJeqfxHy7UVGeQXCXdTogjjTWzZKDDEnbV8VfdpX5CWFw+0WqIvpOWdT+3/2mgQCVhRN2P+ZHrsUXdx4yUqIYqnfB6NH+57QeP5tFkewZWcBAjqYfC3KhZylO6n67imAS9XsVGZTX2CDUXA6ovEtsTEgzTwHQ1sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h89w+RJr3/5I0oj84mEDre57IMG40a4/H+TPYT8GPpU=;
 b=12fqrBG0UqZqLd5VT0XsP+SSIEZCQEa1y0WDflMbrnTA2RnrSG0idfWBmkFK7/Vvg+VqmWJ2R1Se+JWmmgop6aU5NTd6pQ+CGS9WuJdewovkIaNeMiodXJMtboRO/LS/dvD6CbHixIBiIC9c3bP+qREl/6QRjT3dPLRCGBRhCy4=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BYAPR12MB3383.namprd12.prod.outlook.com (2603:10b6:a03:dc::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 22:05:48 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d%5]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 22:05:48 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v1 4/6] Sure Start Security Feature
Thread-Topic: [PATCH v1 4/6] Sure Start Security Feature
Thread-Index: AQHYSGx0xiPlqHIUSUaeMbdIWFM/4azgTpSQ
Date:   Mon, 4 Apr 2022 22:05:48 +0000
Message-ID: <BL1PR12MB515731CE551D22A5CBFB3C9DE2E59@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
 <20220404203626.4311-5-jorge.lopez2@hp.com>
In-Reply-To: <20220404203626.4311-5-jorge.lopez2@hp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-04T22:05:46Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=78d7d25b-71c8-4d00-b1ec-0e41600621ba;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-04T22:05:47Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 53465909-497e-44a1-8c79-f8832b8ca7d4
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b57747ae-962a-4cfa-e466-08da16874677
x-ms-traffictypediagnostic: BYAPR12MB3383:EE_
x-microsoft-antispam-prvs: <BYAPR12MB33838F5053B9A868F0F119F4E2E59@BYAPR12MB3383.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kqi5hUKsNQVPDAxNgPzxKnLs6NCaiHwGJGhDyk9h+USbxI7QxxXH5UJuvAuyc/fvyQUcGsN5lTQd9v3GnYCRCzALuI226IcG/yPnoOSBjMnuKiP9Z8lg2KUswTxFLBrksy4E4ukKVmeptrgjEbEveyxgwnB5/bE6YYuIuaEspwHpQIuoTSaT0HAeB8tKuD5O9Nmy9Ro545nmAcPuYbKemiMtfe6aNL1Q8a+EHzsqEnJ/nizppMrR9sbT4K8oWq0djzqBZ15NKRTlFEvvWbPhWxP9/cKDET13jtOjg6UaftCHNXZSdDhaEfij12oB+uSARGsMkjbZ4TzgNXa0zFqwmefjZx4XLREjNj6YOFkendiPGhH8ZOurPOW9CoxM0/tIjx++sJGKsk5mooyMy/G3yw3OfwxPCMkVljFuiU8zYjLifCD6IiBiKDNlD48pW5/zRB1axCFz7D2ImlJFlkK+OiwnIfPA4ZjbXWqiNHLH0lqFkhBqSjo23dPrF3zEge1UPg+wZxOgor8itIxzz/PPa1XThyQsBJhHkTZ8gKk1uNaf32Qib38bFn5T8NbCYAB+Asr0goTVcP7xNveBtWqJcBmb93pBTS+objbeLErwASvKLkK+Up/af3JfSUUcDyqB562Db26F9rjRbc7QddCUaQklcApbNI35eCoD79ndKGWd7EZt31FB5DtuHUyXz1cmN6UCvqUMim1eZf9vDfpml3Nl0voSS2Wpo2K/JHi8XV/dFllOHnqYaH46Cg42R3QdGv2NjOx01bwnuCKtfO0UJhb2+j/GpYG0kN1YBFS4TR0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(9686003)(52536014)(7696005)(8936002)(508600001)(84970400001)(2906002)(38100700002)(15650500001)(53546011)(6506007)(71200400001)(110136005)(86362001)(38070700005)(316002)(122000001)(55016003)(83380400001)(186003)(8676002)(66476007)(66556008)(66946007)(66446008)(76116006)(64756008)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8QMM8/zOriebO8+IrPSQRroKdEmBUhOiHbOMqSoPH5DEazmC4rF5theieuJh?=
 =?us-ascii?Q?/ta5iQPVYCmFL4w4zWUWrnIrHIEIUhBSh+yKY9BPcspwIUj0Q4KQeMMimWiK?=
 =?us-ascii?Q?XLMs9vnYfWPe3chq3E3S8npvdFPrKB2WY9sbWwWnHfRGrHc+PWrt6Opgzx0v?=
 =?us-ascii?Q?6jvpsXcF0OTY0uiJ2N07oxWuUoqc2hGz8nKn8pT//ilHe4E2K90zNK9ooilX?=
 =?us-ascii?Q?Avhlgr0BeAftBl1bCAw4WCSeL098YlxbKN5K54Wm1Br/qJ5XeQ1NVJM7PQFh?=
 =?us-ascii?Q?qTgzP7cbloXRqeERj2eKXwuaMF9gXWc3+Qn1UQq6SWQTYC4/DhSTItjsFaVT?=
 =?us-ascii?Q?v+D2+GxhXeAaROcl7L/Xck8gA+GIAog13x2Xzxvx9+HwX+4PFkRXZBG6BRrx?=
 =?us-ascii?Q?hWkmMyM1VcVEOUNcIvUY0FlEkvlH3N+UlzawIDJwc0DKlCddgiBRaRUN3+c9?=
 =?us-ascii?Q?BSEe6qLqXrWr/q9kxlfnazEnhh14QkUMmGvuMnCfbu5pHoiQ2Q19zBoEBMI2?=
 =?us-ascii?Q?rNsBzvhdTI6bzuyc7hnv+OsYBOaKevV6VCK5Yrle6ObK11uKy4SDAqh+cv+1?=
 =?us-ascii?Q?vvm2zHXp9j8mt+/zTwSz1G46RM50nFfuzhEKpknfC/UGX8gtkWxbEEy7EOIM?=
 =?us-ascii?Q?kkA331uHwfQH7CbVHvYeh2O0UuiPsu+A6Igc5n5LwbTRwsmoBY0hykY0UcYj?=
 =?us-ascii?Q?4ltayRDZlBpo9n0S1BR+Mue0YHFCAJvzBBWUtQxDhG5I9kdxdCSwjVrlVIub?=
 =?us-ascii?Q?RMit3bnNI3HsK/+F87RUHX//f2aMuAby/qSeqcnbBtEZEQUgl9odYhpEVoZ9?=
 =?us-ascii?Q?u2oOu6upkDGY16qDebtSBra+XWJF5aNF3t9pJB+iF4JcJBc2XxA9Txebf4NS?=
 =?us-ascii?Q?QA+wTYSEcxmZ51QC1TvivriEuPjyzJlh9BQPNE+UHqFeP6e+gSTnFfdiPTJ5?=
 =?us-ascii?Q?4U1vG9ofvg1IL0qb6MeF+c7fs6swq5lN9u1Zhddj6QicoyR5PKoutWvUlM/a?=
 =?us-ascii?Q?E8RNlBBqu32TV2Xl9FSFo9G3D3NeanF5wvyZtQcCSXnLcA3/cG/UgUihCqk0?=
 =?us-ascii?Q?DMaOUvSkX1RP0slAT4jAmwvFzoDZvFHxBoicQCQDNpYKXi9n/na88CdSATvX?=
 =?us-ascii?Q?C3vOxBwMcMpIQKLtDxFUo90KN4pNGPkygDoeBPR2Bt17PYr5qsIPMU2+/t67?=
 =?us-ascii?Q?Jkri3Q8YHu/ju7MKYLVTEZKLkVkvdaCsA0FdPtXd2eJlMafRFrpsCH8Lc4HZ?=
 =?us-ascii?Q?tG0vBOg/xjPZ9Tplp5X5JlV+Tge1R3WYoN1HtNrBWzsZQji8jc0TLBI6E1w8?=
 =?us-ascii?Q?q5qmybmlBv7hy4BH+ZSf6lvZbug1UNKC7tFhbRxtW9wdaGQlzFl2HinQ5dHn?=
 =?us-ascii?Q?ePLn1YKkX+ZeMhTs/aiM2LN2AJsFAb/SffdALUvD+d1CJCKJX1wzSnLDX+Xj?=
 =?us-ascii?Q?+GKpw3ad/Fzz7x9Z+92WaRHEqQDF59IByb3ICn3aEf/1mvlbY4gVHU14R35p?=
 =?us-ascii?Q?wip8q9G+o5l19Za/Sb4kI8ZNf8/lo2aoI0D97Y0r0/cF6klJRyV26B+q91+w?=
 =?us-ascii?Q?sy6lyUIC0dvkgZV2T4HYxB9DhZCICAq4FNYE4Ci7+YG63bNFT8D5rga6oGjY?=
 =?us-ascii?Q?zBRjRkq7pl6V/kjNHSDz2biMdCAAfQiq65xcwmOmObH5GjjLs7i5sLfvo6M5?=
 =?us-ascii?Q?BXU0PpooW1JzeXA0WvDUasmUybCY4qbY0JUNncUtStPvOEapsTbeu33jYUaG?=
 =?us-ascii?Q?gtsbLTZF0elKYR83T5sh1nbAnk1e2B/UbyTKjoHs4Nhh3BZ+F3B3cWvSAjkf?=
x-ms-exchange-antispam-messagedata-1: kLeVPZh5y7boPg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57747ae-962a-4cfa-e466-08da16874677
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 22:05:48.3442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u90c0boK2hqhE0W+Efp/zW62QGx2JvSloaWPo3R5jmVO5Kxqt519r0iPgCRo7HDluOkLI9Ub7Um2n9SgYlrhQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3383
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: Jorge Lopez <jorgealtxwork@gmail.com>
> Sent: Monday, April 4, 2022 15:36
> To: platform-driver-x86@vger.kernel.org
> Subject: [PATCH v1 4/6] Sure Start Security Feature
>=20
> Sure Start provides advanced firmware protection and resiliency by
> identifying and repairing unauthorized BIOS changes.  It maintains an
> audit log of these events and other important system configuration
> changes.  The following sysfs entries can be used to read the contents
> of the audit log.
>=20
>       /sys/devices/platform/hp-wmi/sure_start/audit_log_entry_count
>       /sys/devices/platform/hp-wmi/sure_start/audit_log_entries
>=20
> 'audit_log_entry_count' is a read-only file that returns the number of
> existing audit log events available to be read
>=20
> 'audit_log_entries' is a read-only file that returns the events in the
> log
>=20
> This feature requires "Update hp_wmi_group to simplify feature
> addition" patch.
>=20
> All changes were validated on a HP ZBook Workstation,
> HP EliteBook x360, and HP EliteBook 850 G8 notebooks.
>=20
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
>=20
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 108
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>=20
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.=
c
> index 139dc079c1fa..918e3eaf1b67 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -126,6 +126,11 @@ enum hp_wmi_spm_commandtype {
>  	HPWMI_SECUREPLATFORM_SET_SK	=3D 0x12,
>  };
>=20
> +enum hp_wmi_surestart_commandtype {
> +	HPWMI_SURESTART_GET_LOG_COUNT	=3D 0x01,
> +	HPWMI_SURESTART_GET_LOG	=3D 0x02,
> +};
> +
>  enum hp_wmi_gm_commandtype {
>  	HPWMI_FAN_SPEED_GET_QUERY =3D 0x11,
>  	HPWMI_SET_PERFORMANCE_MODE =3D 0x1A,
> @@ -138,6 +143,7 @@ enum hp_wmi_command {
>  	HPWMI_READ	=3D 0x01,
>  	HPWMI_WRITE	=3D 0x02,
>  	HPWMI_ODM	=3D 0x03,
> +	HPWMI_SURESTART =3D 0x20006,
>  	HPWMI_GM	=3D 0x20008,
>  	HPWMI_SECUREPLATFORM =3D 0x20010,
>  };
> @@ -851,6 +857,7 @@ static ssize_t spm_kek_store(struct kobject *kobj,
>  {
>  	int ret =3D
> hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
>  				       HPWMI_SECUREPLATFORM, (void *)buf,
> count, 0);
> +
>  	return ret ? -EINVAL : count;
>  }
>=20
> @@ -918,6 +925,106 @@ static const struct attribute_group spm_group =3D {
>  	.attrs =3D spm_attrs,
>  };
>=20
> +/* Sure Start functions */
> +
> +#define LOG_MAX_ENTRIES	254
> +#define LOG_ENTRY_SIZE	16
> +
> +/*
> + * sure_start_audit_log_entry_count_show - Reports the number of
> + *				existing audit log entries available
> + *				to be read
> + *
> + * @kobj:  Pointer to a kernel object of things that show up as director=
y
> + *	   in the sysfs filesystem.
> + * @attr:  Pointer to list of attributes for the operation
> + * @buf:   Pointer to buffer
> + *
> + * Returns number of existing audit log entries available to be read,
> + *         audit log entry size, and maximum number of entries
> + *         supported. Otherwise, an HP WMI query specific error code
> + *         (which is negative)
> + *
> + *         [No of entries],[log entry size],[Max number of entries suppo=
rted]
> + */
> +static ssize_t sure_start_audit_log_entry_count_show(struct kobject
> *kobj,
> +						     struct kobj_attribute *attr,
> char *buf)
> +{
> +	int ret;
> +	u32 count =3D 0;
> +
> +	ret =3D
> hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT,
> HPWMI_SURESTART,
> +				   &count, 0, sizeof(count));
> +	if (ret < 0)
> +		return ret;
> +
> +	return snprintf(buf, PAGE_SIZE, "%d,%d,%d\n", count,
> LOG_ENTRY_SIZE, LOG_MAX_ENTRIES);
> +}
> +
> +/*
> + * sure_start_audit_log_entries_show() - Return all entries found in log=
 file
> + *
> + * @kobj:  Pointer to a kernel object of things that show up as
> + *	   directory in the sysfs filesystem.
> + * @attr:  Pointer to list of attributes for the operation
> + * @buf:   Pointer to buffer
> + *
> + * Returns number of bytes needed to read all audit logs entries to be r=
ead.
> + *         Otherwise, an HP WMI query specific error code (which is nega=
tive)
> + *	   -EFAULT if the audit logs size exceeds 4KB
> + *
> + */
> +static ssize_t sure_start_audit_log_entries_show(struct kobject *kobj,
> +						 struct kobj_attribute *attr,
> char *buf)
> +{
> +	int ret;
> +	int i;
> +	u32 count =3D 0;
> +
> +	// Get the number of event logs
> +	ret =3D
> hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT,
> HPWMI_SURESTART,
> +				   &count, 1, 4);
> +
> +	/*
> +	 * The show() api will not work if the audit logs ever go
> +	 *  beyond 4KB
> +	 */
> +	if (count * LOG_ENTRY_SIZE > PAGE_SIZE)
> +		return -EFAULT;

This is an interface that will be there forever, what are realistic numbers=
 and sizes after a long time?
I have an AMD HP laptop that is only been used a few months and checked the=
 size like this:
dd if=3Daudit_log_entries of=3D/tmp/entries

I notice that the copied file is 224 bytes.  Does that grow linearly?  A fe=
w years and I'll be at 4k?
If so, then maybe this should be designed as a different interface.

Also, the log is readable by anybody.  Should this be root only?

> +
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We are guaranteed the buffer is 4KB so today all the event
> +	 * logs will fit
> +	 */
> +	for (i =3D 0; ((i < count) & (ret >=3D 0)); i++) {
> +		*buf =3D (i + 1);
> +		ret =3D
> hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG,
> +					   HPWMI_SURESTART,
> +					   buf, 1, 128);
> +		if (ret >=3D 0)
> +			buf +=3D LOG_ENTRY_SIZE;
> +	}
> +
> +	return (count * LOG_ENTRY_SIZE);
> +}
> +
> +HPWMI_ATTR_RO(sure_start, audit_log_entry_count);
> +HPWMI_ATTR_RO(sure_start, audit_log_entries);
> +
> +static struct attribute *sure_start_attrs[] =3D {
> +	&sure_start_audit_log_entry_count.attr,
> +	&sure_start_audit_log_entries.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group sure_start_group =3D {
> +	.name =3D "sure_start",
> +	.attrs =3D sure_start_attrs,
> +};
> +
>  static DEVICE_ATTR_RO(display);
>  static DEVICE_ATTR_RO(hddtemp);
>  static DEVICE_ATTR_RW(als);
> @@ -942,6 +1049,7 @@ static const struct attribute_group hp_wmi_group =3D
> {
>  static const struct attribute_group *hp_wmi_groups[] =3D {
>  	&hp_wmi_group,
>  	&spm_group,
> +	&sure_start_group,
>  	NULL,
>  };
>=20
> --
> 2.25.1
