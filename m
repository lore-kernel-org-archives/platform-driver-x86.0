Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FC8C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Jun 2022 17:14:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbiFCROP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 13:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344310AbiFCROO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 13:14:14 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BFF50B29
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 10:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+04H/35VM6QdLjJGnOv7tfFqJe18YzLOa87V++7ixTHOg31iRn6G9kZkd9xbbuI4jCuhaxbq7W7SnTzo89UMtfgO19wcrBV5a7eRQwhGntkO38CiFg6YilfaYTPPm+HRiwqT+YPlWSLaVHl2o/r7nAJiKooaofDYJsQRtBsiU3ur72RGvM4msjDGfQ9KJikE6WH1uqYFCOFvlgoVgyqk0lRVc4lDG2b/Nanx6uNk4zxQ981vR/78NSc899/suk2gV9HhuQ7d+YG10uFeCIv98pD0qBGJNhyd0WvbAKzoYTLfQm6sd1zQDxGJPQf3uys0onejKWn013n4sf5OxmjUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QvXETnJL96bKKHv8DbAR1IYtSusc2yD1/L9Zbbp47Q=;
 b=NIjwue6jTPB3WRjuTxRVCPKFcVWQDspGYVDDptbrwKZNLg9LqZKP3WWgSJfeQFchw9efRCm7lGNUs7JGqacH+Jdv+6FhLKmAyp37wiAWvz11kmwfefgYHoOLiUWdjOJVrAxQuWKttp32Pbliv2qgFBZpAyJhknQOeuMgDsxLZJSfKS7UQU1BfOSxUWEcR+E33teSWs6fJhkHCHOAoTIOeNKhAdQbZNkGn659QXVRyoqhrYftHXhjbB9OKtrLAWXvAJgnIpVCHbw5u7e5MovZasg81bXaNlAlVfVegw3zGXrM+skO49+bdbspY2S8hbtv4wABIHAg0QjgKkbC32m1YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QvXETnJL96bKKHv8DbAR1IYtSusc2yD1/L9Zbbp47Q=;
 b=U+HVzTANPwuXsuAfErLqgYGBRCDTI3ZpeUncfNoceya0/q6f8WAYES9JUj1vLARsgeEhJXIxDG6zFLIRZ1gkWlil9UITqSEHgP363O4eVANIKcx6BgCwEagT9RrLZ0RuifVPYiS1sUc1g5yM3G1uO8V32D18SVPdODF6sDf0ckw=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.15; Fri, 3 Jun 2022 17:14:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3d0f:71a7:3a0f:ac2e]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3d0f:71a7:3a0f:ac2e%6]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 17:14:10 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Mark Pearson <markpearson@lenovo.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 3/4] platform/x86: thinkpad-acpi: Add support for hotkey
 0x131a
Thread-Topic: [PATCH 3/4] platform/x86: thinkpad-acpi: Add support for hotkey
 0x131a
Thread-Index: AQHYd2vCF10sc/sGK0y9ws+t20IvAa096wdA
Date:   Fri, 3 Jun 2022 17:14:10 +0000
Message-ID: <MN0PR12MB6101B587428E030D96AAA127E2A19@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20220603170212.164963-1-markpearson@lenovo.com>
 <20220603170212.164963-3-markpearson@lenovo.com>
In-Reply-To: <20220603170212.164963-3-markpearson@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-03T17:14:06Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=eb97474c-5d64-40dd-a10b-90506a43dca6;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-03T17:14:06Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 35c46edb-e42f-46b5-943c-f40ce80ddbc7
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28fa6acd-5171-4c83-613d-08da4584795c
x-ms-traffictypediagnostic: DS0PR12MB6632:EE_
x-microsoft-antispam-prvs: <DS0PR12MB6632D336650E7A57B6427879E2A19@DS0PR12MB6632.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dkOEEQn4j5zeXQY053n8ARW2DUIj2po+XXELbT/C72G59P2PF7enHAgbDw7V1te7oRotumkkg+It+fsnbKo5vQLqH8MCKarbQzu/03Nwx6RPSn9NZRkaRLbTT9lSZvtRahWOMyWxCDucpSRdinEPQmkWWOP/wqxtMqzeJLtSN/9sthIXYQnDk28XtAi9wFjkuXE8JPuQFCDDzc4prBzk4yZjm4IoP5sg8VgIYxQz3DPR6JSexOfIEAtfJiJGUDXrDGYrzC4gO9ctyvRYeN5Z4BIFu0WuSCcgIIAzJvRZVwAeV01I9K6UWnNTD/OW2GZ0DFLBMO+TSRQKY7ZogxRYTRW4NdqARy6PRGUm4bVdtwH4zD/+EJo2RBiSSoxNiWFFNsDhN3WFPPXDJ/DyOMHwl1CEP+HxC4Q/yTLpC58rf3EiHm/T5wriYYKBQr1Ike1AbSN+aVcoAziZnqImkshcAKREUeaDhdRXJw4MW0UcJodhIxjn3ws+AMkyZJyIf6i41/DwetRtpSIhB6p0EsLaYszl1SiOL6d//4Tt90LfBweZHiKidfDUZNucWGHVjT9BKILUoq5184sIjJMaXvpxpdXQF877F7qSn3hA1kzPSJ85iPzbpvyXnuIbz7i7aUwlAOMj7bJ9q5UFinR9Dh8WcTnV2ejfe2W9PEJ/7GqoQih+ovZzmJKgYGPaVVPzX2cOnjNZeqYBhZaS/kwGJUyQDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(53546011)(33656002)(122000001)(6916009)(54906003)(71200400001)(316002)(9686003)(38070700005)(26005)(2906002)(52536014)(7696005)(6506007)(86362001)(55016003)(508600001)(5660300002)(66476007)(83380400001)(38100700002)(66446008)(8936002)(64756008)(66556008)(8676002)(76116006)(4326008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E0EzY7JbHG5NNm0BxPEzJAQ/TAmNT1kadXSHMxRlrkhqPKLdibrHxxr3IrZ4?=
 =?us-ascii?Q?BnA5GpdXLZVuXBhx5RVBYD1J6/fO4UYMmT2EnHhvmodMXBUA0y+0N2bNPsw8?=
 =?us-ascii?Q?RBB6sUaCocFo1m6vwqTSUzlKm64CNWpN7D++vGb24kMSvB0aS3OSyyDnoIMd?=
 =?us-ascii?Q?rCO3kY0yU0SmRkM7NHr2376+nu4ZuvOHZ+3Ay+cJYRrFOPgXG5IuUHtlpbIs?=
 =?us-ascii?Q?LefijNaj+l0cOUuM+RFZ75Ci/mxl3257maYEbwvMjQtWNwz1si2mw46Z8egR?=
 =?us-ascii?Q?9gKsIXqdZkVbKkkiDJuu3rETmCK3jmewefa7MZJA5L9w2yFZ+/FZkb29cSRh?=
 =?us-ascii?Q?rGHG9tFWmRZCV+sj5FmTKKcdUW7CiIGqjprjSdxG9vhvVxxfSSjhiHvtB+xY?=
 =?us-ascii?Q?KTRG+YUPXq82MXd2zNXbR+Nj5r3hxldLvmMdFrOpFixt9j8mBi/3aH+p8Oe9?=
 =?us-ascii?Q?Imtcn937onHHS2aj//wJxKpDJsKtBlZ8meBGRVmNtcmurSiRh2yFIutjSSuD?=
 =?us-ascii?Q?jZBGV7CAbPXGuOKdpiTn77xZ7QdBNOLqK7xrCvmlKoMR8t8pJVdAYlHxILe6?=
 =?us-ascii?Q?5ASjfY7Kd9zUeTmwzAq1/VWv6WcX4ALGqna/qgkY7Y2aiANO758ZiRj6pEUY?=
 =?us-ascii?Q?PzbLEmubhRBLRi3Icob2wx7PmNPrb3nFPOOIbPMBikN231rtp9u5c0bhArTE?=
 =?us-ascii?Q?GoH26T82I6OK+pkM3u/PyFO3SxKxbXl82DPfsbYdQ+vqYtzTRBvhA/ED6TpX?=
 =?us-ascii?Q?TCQqRgPiQsoNn1dv54UO230vqvStrk7SGP4i+I+P7buTL0iUaQ0t9vqYFSuF?=
 =?us-ascii?Q?WyY+sHmOVsTTF41tIkvNgNL/OLYmBsrC9Fx6HPb7TNgDZL2evN/NEFXe1z0U?=
 =?us-ascii?Q?0P9aSNDzr/xhPEIMsrDus7cdD5H+byassFpD7ZTUgmbwwmLN1bBR7Um4YxwL?=
 =?us-ascii?Q?JWLG4vRvOWgx3GICr1tCYUsGVVuegBpffv1WZPGzm6ASCay8BPMPB16dVdPZ?=
 =?us-ascii?Q?FrYyi4vaQxFTxK9iYDJNkxYQPmTdkFpvsLnEWFao0C+VlnJNtfWbM1Fek7Op?=
 =?us-ascii?Q?tlceZKFpvkbDIYP6c7P6bD1FophRBEJ9fSv2/yl69sU9mEq1tcLZZ4IJI5YV?=
 =?us-ascii?Q?SBQju14aUbeu2iBac+K+XmxkVsWdlwCNV3UteTzmXeEqJZDpPZ/89PFt5u46?=
 =?us-ascii?Q?HX+8nn+NfMe/aRIIrg78fD10FYMg/4mfGz0TinsStJdG2ULjuWlrOLITmwF2?=
 =?us-ascii?Q?kzL6YZZczHl+l8kUxzafO19WyRv4F3qvbbSsQwtN7i8U8CHkXevnATvNjqWh?=
 =?us-ascii?Q?wUxxjTyTtT3ENcdXmlV4hOEgx49UayvlMiLCc9hH4CtNjsQYHc0bEx+3ggOJ?=
 =?us-ascii?Q?hlV/0zi6IWlCieB40zSrqDtFv70y2nRaUOGmmJ6TntKT15vM7+JkUnTWnQTY?=
 =?us-ascii?Q?Av/DU5AHgEBAbfPkGqTKkvP3y4Scw/ruSRJFLCyn+pX1cBTBjRQ9VQIW+pqD?=
 =?us-ascii?Q?LRTAuHraECzQ+P4ofmwADAI+LLC9MxaOF5J7v09dukRPcfiRcCM4oTzpcpQY?=
 =?us-ascii?Q?P7arRfr4P4kG8yff95OjEdvgUNe6XTPU7W716dBZ0HtPc5x89E7s1je5kYt0?=
 =?us-ascii?Q?qkrVGMlm0OX1SyoGupd2h3GV2mHuzct3nY04cLSNiIvufzBJowDPiU6X1eCL?=
 =?us-ascii?Q?kOj2itVw4hfou6ezNsxg0nGGKxfWH7KU3kD/ti5G9Opzb9Df?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fa6acd-5171-4c83-613d-08da4584795c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 17:14:10.0286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1FMNHv2xDlBUKCLCxaobxWr0NjiqoiZKQEYMrMWtRLfzwt5Kv8MhL0O2TKxGi4kGxNkF2+0+01g7EWpu3wBBJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[AMD Official Use Only - General]



> -----Original Message-----
> From: Mark Pearson <markpearson@lenovo.com>
> Sent: Friday, June 3, 2022 12:02
> To: markpearson@lenovo.com
> Cc: hdegoede@redhat.com; markgross@kernel.org; platform-driver-
> x86@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>
> Subject: [PATCH 3/4] platform/x86: thinkpad-acpi: Add support for hotkey
> 0x131a
>=20
> On some AMD platforms if you press FN+T it will toggle whether automatic
> mode transitions are active.
>=20
> Recognize this keycode and use it to toggle AMT.
>=20
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 2df290cee0a1..f11866225ef3 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -159,6 +159,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_VOL_DOWN		=3D 0x1016, /* Volume down or
> unmute */
>  	TP_HKEY_EV_VOL_MUTE		=3D 0x1017, /* Mixer output
> mute */
>  	TP_HKEY_EV_PRIVACYGUARD_TOGGLE	=3D 0x130f, /* Toggle priv.guard
> on/off */
> +	TP_HKEY_EV_AMT_TOGGLE		=3D 0x131a, /* Toggle AMT
> on/off */
>=20
>  	/* Reasons for waking up from S3/S4 */
>  	TP_HKEY_EV_WKUP_S3_UNDOCK	=3D 0x2304, /* undock
> requested, S3 */
> @@ -3735,6 +3736,7 @@ static bool hotkey_notify_extended_hotkey(const
> u32 hkey)
>=20
>  	switch (hkey) {
>  	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
> +	case TP_HKEY_EV_AMT_TOGGLE:
>  		tpacpi_driver_event(hkey);
>  		return true;
>  	}
> @@ -11038,6 +11040,15 @@ static void tpacpi_driver_event(const unsigned i=
nt
> hkey_event)
>  		if (changed)
>=20
> 	drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
>  	}
> +	if (hkey_event =3D=3D TP_HKEY_EV_AMT_TOGGLE) {
> +		/* If we're enabling AMT we need to force balanced mode */
> +		if (!dytc_amt_active)
> +			/* This will also set AMT mode enabled */
> +			dytc_profile_set(NULL,
> PLATFORM_PROFILE_BALANCED);
> +		else
> +			dytc_control_amt(!dytc_amt_active);

I missed this while we were making the series, but a fresh set of eyes tell=
s me
shouldn't dytc_control_amt(..)  run in either case - not just in the "else"=
 case?

* If AMT is not active and you press the key (to activate it) you=20
should switch to balanced mode "and" turn it on.
* If AMT is active and you press the key (to deactivate it) you're already =
in=20
balanced mode, so you should just turn it off.

> +	}
> +
>  }
>=20
>  static void hotkey_driver_event(const unsigned int scancode)
> --
> 2.36.1
