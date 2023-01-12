Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8908C678D6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 21:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240629AbjALVFH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 16:05:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241172AbjALVEF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 16:04:05 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98357FCFA
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 12:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQDttPJ72u/nNQzY9R+S6cvPDZfbjfT4G7k6Z69kRRummcXkNSuTBiY277DJxlWIUKy7P63rjb5BMxPjyYEE/7wHuNCXZGTMrUnVuiOGwzrRzsgbmvIgTcQU++FgadiXDeM4RapxPWDQXcW0ddjUnSszZXAzPgmkRMABj/5lClwBo0J+2wtw+xzfGVNzVayZAHkkzkGHRPXBv1EEsR/KjhRsEiK2hTTzE2mcmTidnllSW4B/uHSVJamr6O7T7wI8ypYRFe5RAyhm7uMsv/bTPNvZ0YVImJeY/yorm3ERgj5b5rwN+L9zgGDcZxoMAegxaJvhpTw3V4sB7dm8mzRhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6cpFIRiTFcO3ZGL9jAC0rOG5mfzMKDPqBavqCqxsTc=;
 b=ah/XatCEmAlfUhgnNMVnujIf799UTF0p4rBDRv3CQwHHHbwq7AI5xPtOJVQsgE2lOGUDOliEb8hWPqU0ONxyrjBgJhITIRrp/va3fYs1S4SkXwVUADOz/SqWyfkjBrxRpAOpZBFID64SOnd6AurPV5bIdvBBXSDiC+7hLAqCzXCqIKlaG2Jk7vZ5OEGlZ4brLJImcsqMcSG6t6TDUj/6eKjl31kP2668XCNIcuYfVn4cfDTEnfT8dnAt0yJMHvFn1KhHymp4AHMP+oEnBOZpIalfHSBJnmeW9nTTV55gMgQyFhLY+ypbFEfNLt+gZWRARd1EMFwizGN8Eh9+WAp4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6cpFIRiTFcO3ZGL9jAC0rOG5mfzMKDPqBavqCqxsTc=;
 b=Tp7y6c/YcZ7CP9KuHPnEi9Sn8SuHKEMsM5l05KB63Z8yWFw/VvH6STXfeMCilYj25PHG7L4hxwEhxWCJi1/Z5PcuPTPceZpda1JXIo3B4XEJX1q6d5M3/VybnFSPGPfOQE3M39c4s1A0rbn42WTvAw1EyPmfRgVZzlrVnDcrJpc=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 20:49:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 20:49:30 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86: thinkpad_acpi: Remove AMT enablement
Thread-Topic: [PATCH] platform/x86: thinkpad_acpi: Remove AMT enablement
Thread-Index: AQHZJsbK8CLkj+1kOUKjWteRXY48NK6bQIWQ
Date:   Thu, 12 Jan 2023 20:49:30 +0000
Message-ID: <MN0PR12MB6101029E8A023F5BD67D227BE2FD9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <mpearson-lenovo@squebb.ca>
 <20230112204501.487920-1-mpearson-lenovo@squebb.ca>
In-Reply-To: <20230112204501.487920-1-mpearson-lenovo@squebb.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-12T20:49:25Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=b1851b64-d8c6-41a4-a3ee-d711e53fe461;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-12T20:49:28Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: c25ff397-0ded-4f74-b14d-d19db475b7fd
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CH2PR12MB4199:EE_
x-ms-office365-filtering-correlation-id: 3b65776d-7d52-4558-77f6-08daf4de8087
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UMLqFV3Y1UlSt03XrGCkCiP3qEHO6V5uZiIsk+SXeWx/uvngmNWioYrRiyIiVCUD8bJTS9o/bS5LWDrrOfgsjlyikunv8+BCS4JFtvCmRamW9EIwksBRwvIm8C3rmHdkx33K4PABJXLvLqr+6c0/uhJ8aZSeYVDZH3rzOix7o6Ty+Y9PCv7k9HdaUcyVkuR/3tN59ZxUugzoKP++736nWZKuQ+VF/YPQfUzwx5V+Ajaj8kUSW9Cdjl42O2naZurdnrB82wF0/kCKQSa3ASSdFayQCd2LCNxsG1EGmlM3l8IN1XHazUqqSyS//DIo6vF3FwtT9RFDTjfxEBRb+p7qYxFVxw/CLrqI4X/CUoqGcUhHf3fHLA1TGlnfEPtJ7xIQ2vlTRuD5a2o/3gaLUY+MGgGqijA8HoixeqFQUcWbEaDLP8h8MKvWivQUrRgVSneBM4YbDu0SYb3Or7YTvBOos6mhP1BlJUSaLZynLrpP5WdhLnbdbgVU8PX19qSPHfont6aCbccnBXXj1dFN+E70Up9zU2u2IL6Lmym7kRhQe4n32hMzLGRY1oQoAed1jvZkiI62JueCRU/Hz+LfMD9I2ysOTemrl6ac8oqZEmmU+4TcmQy4vl2EnHEwpKEIBXhpMcZauskWYp4qnGnCT6PAQrtpixRCp1AIjcuFJYu9yl4ym1VnTmE3ipIlKjydYMZDBvqcUnKMSz55HusIK0615A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199015)(478600001)(7696005)(71200400001)(53546011)(6916009)(5660300002)(186003)(54906003)(9686003)(66556008)(8676002)(66446008)(64756008)(4326008)(6506007)(76116006)(66476007)(41300700001)(2906002)(8936002)(52536014)(66946007)(316002)(83380400001)(122000001)(33656002)(38100700002)(38070700005)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?paJckTr0Oqpoz/VIqPcu/i6mH320ExX/ZVjsG3eppvy8ousIP4GP8riS7gs6?=
 =?us-ascii?Q?GA6TPkCtW8vCTGkYXVa2VBrxPl2Ca2PMZvhTDaL6ntBZ9RLs/GWpnBW5nAdG?=
 =?us-ascii?Q?Sx+HECb70EyPGB1osdg4QV2C1M19FYxLfcf/10dfWX5uiBbQULNqt5+cBP/c?=
 =?us-ascii?Q?Cs2kz07L+Wh/bK5QaU/q3fPIitGX7mfz6H/zek2sFlh0KCUbSwm37NcZCYcf?=
 =?us-ascii?Q?CrDsf5mq9b227IpikunNWnlhUmdd+CA3zw8rzOlDYH++VkKXViMlF4OzZ5zn?=
 =?us-ascii?Q?XpenLY5avy3IR7pwmeXIR7GYbusT+FikE3bW0OpyOFXTu6IG8ohTea65b0ZO?=
 =?us-ascii?Q?bkwFzcoEERLPwAOfPiG8nyR2tZsC3k781w+mUc/8BNOdhpU8rnnt/RP5k2Gn?=
 =?us-ascii?Q?WtFZl7ZynYYUaZTQjvjnb7Aj8cC8tRs28e5vujBKf97VLe1EAwjUxVjuCHZg?=
 =?us-ascii?Q?J9c43AG+qQ3/o9cT79XYIuOq/OTqyxg6eRuAaxZYK6vB7TsvJ8e0Wg1unelq?=
 =?us-ascii?Q?jAWrroNxbvtE3BQvgX7oq5ma5K5vCCrUWsPnWmrCcg6nLgppPKLhDrIXIK0p?=
 =?us-ascii?Q?Ut0FDiJugslzJiOyjfL0jhm1IihPSpjS11lC2VPCNi2BW9df9uFHYaYuQ4RN?=
 =?us-ascii?Q?jAhEXkX6R7k3gDfgVholS1Fc9tslA6zhOdUDPjBOPnyCw0CtUoCOLUHtCrVA?=
 =?us-ascii?Q?qZKmWvNw5kVNO4I1fn8oI9LZhNLuVlhs8v0rP2/2hZvJj4nT/pkx9YGjXfU0?=
 =?us-ascii?Q?TFd1uesH9f9/+WNJa7X7Kz1ac2Ed6KQlplCsTFdCCbSQTJmg/5b9TVElcj/M?=
 =?us-ascii?Q?ZCT2navpvg3sEpMCQj5MwtbNaYJlNysSAWVeQtXGCLU59eM6+GTTqQ8o0BIy?=
 =?us-ascii?Q?SOD5AVZA1ZkyxBRZ9fVhFEaeH9Rop5zYEiFaLEPPsGumhfSGtxrbJyKx8tGZ?=
 =?us-ascii?Q?Tbs1U9nlnRR/QCKcjMDSHoH5eLwwOt8vDL34iwYBdsJrLXH++MMDLULXl22q?=
 =?us-ascii?Q?VtKxn2FYWkUnaM6wOksUXCbNV52Nl+bcF3g3MFKb9LDSwvmp/7QYJ5kwYq1k?=
 =?us-ascii?Q?HuD4eMNNgnnRMiIQqVLzS58yLVtEl6rZXnZ9YOR2JGV/RpqwKebo//IYjISO?=
 =?us-ascii?Q?dFN6jOXJUelzlTS1AA++pd8a0L+Whf2Ps11yRb6ENjuh+4GTeRTYL9QszUNq?=
 =?us-ascii?Q?N4iHwJbCFJ67EtxRPfr/18H2BqO8+wKt3Vvelwc+2sixsH4HtBDX4VbepsAC?=
 =?us-ascii?Q?WXebYGgikj2pmd2lA0B49DstC81FM2JeOQ8LpFsBdAo4bwMychvlVJRXxs6U?=
 =?us-ascii?Q?2dW/AjvEOQ5erfIywEPObDq98U8Ju8CHqgFx51U2ztwOHHuIWh8amZNKq0t4?=
 =?us-ascii?Q?sMfOVyt59ohiO5mk8Qlua27f4r1p4bNoufJ8UPs57msTUqPxwAeognYgZfY7?=
 =?us-ascii?Q?havmDuMgOiZh6G6DtZaAKYgxYtB7u4jUUsM+Uy5zNSUFPepRvbJbsEkOWnUa?=
 =?us-ascii?Q?ilNYPc5Y2kFbiVWobLazHHJHs1YkXva84GxIiRBRqGe4iBXghEjaTQjNYi3z?=
 =?us-ascii?Q?Ut5l+rA5fVCbE2qJzVuvxcdMpmGJz7zHcLsOT61lEXgBSvwm93R0b85qmMo5?=
 =?us-ascii?Q?FQ5452DBZFUdArK3kZ3WFsQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b65776d-7d52-4558-77f6-08daf4de8087
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 20:49:30.2312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygdD7vyaV6XLPb//apBaCuKj/aHIs4EGxq2k5OSxhnSgSd0Gg/7jhJdPQz63ZJ60jw1nsvyd1Bp3CDW1rR0eXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: Mark Pearson <mpearson-lenovo@squebb.ca>
> Sent: Thursday, January 12, 2023 14:45
> To: mpearson-lenovo@squebb.ca
> Cc: hdegoede@redhat.com; Limonciello, Mario
> <Mario.Limonciello@amd.com>; markgross@kernel.org; platform-driver-
> x86@vger.kernel.org
> Subject: [PATCH] platform/x86: thinkpad_acpi: Remove AMT enablement
>=20

This title really isn't accurate is it?  AMT is still there, it's really mo=
re of a bug
fix for reporting the right profiles when AMT is active (which should be ba=
lanced).

> Recently AMT mode was enabled (somewhat unexpectedly) on the Lenovo
> Z13 platform. The FW is advertising it is available and the driver tries
> to use it - unfortunately it reports the profile mode incorrectly.
>=20
> Note, there is also some extra work needed to enable the dynamic aspect
> of AMT support that I will be following up with; but more testing is
> needed first. This patch just fixes things so the profiles are reported
> correctly.
>=20
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

With the title fixed.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Suggest this to Cc to 6.1-stable as well as it's fixing a power profile rep=
orting bug.

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 1195293b22fd..a95946800ae9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10311,9 +10311,11 @@ static DEFINE_MUTEX(dytc_mutex);
>  static int dytc_capabilities;
>  static bool dytc_mmc_get_available;
>=20
> -static int convert_dytc_to_profile(int dytcmode, enum
> platform_profile_option *profile)
> +static int convert_dytc_to_profile(int funcmode, int dytcmode,
> +		enum platform_profile_option *profile)
>  {
> -	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
> +	switch (funcmode) {
> +	case DYTC_FUNCTION_MMC:
>  		switch (dytcmode) {
>  		case DYTC_MODE_MMC_LOWPOWER:
>  			*profile =3D PLATFORM_PROFILE_LOW_POWER;
> @@ -10329,8 +10331,7 @@ static int convert_dytc_to_profile(int dytcmode,
> enum platform_profile_option *p
>  			return -EINVAL;
>  		}
>  		return 0;
> -	}
> -	if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
> +	case DYTC_FUNCTION_PSC:
>  		switch (dytcmode) {
>  		case DYTC_MODE_PSC_LOWPOWER:
>  			*profile =3D PLATFORM_PROFILE_LOW_POWER;
> @@ -10344,6 +10345,14 @@ static int convert_dytc_to_profile(int dytcmode,
> enum platform_profile_option *p
>  		default: /* Unknown mode */
>  			return -EINVAL;
>  		}
> +		return 0;
> +	case DYTC_FUNCTION_AMT:
> +		/* For now return balanced. It's the closest we have to 'auto'
> */
> +		*profile =3D  PLATFORM_PROFILE_BALANCED;
> +		return 0;
> +	default:
> +		/* Unknown function */
> +		return -EOPNOTSUPP;
>  	}
>  	return 0;
>  }
> @@ -10492,6 +10501,7 @@ static int dytc_profile_set(struct
> platform_profile_handler *pprof,
>  		err =3D
> dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode,
> 1), &output);
>  		if (err)
>  			goto unlock;
> +
>  		/* system supports AMT, activate it when on balanced */
>  		if (dytc_capabilities & BIT(DYTC_FC_AMT))
>  			dytc_control_amt(profile =3D=3D
> PLATFORM_PROFILE_BALANCED);
> @@ -10507,7 +10517,7 @@ static void dytc_profile_refresh(void)
>  {
>  	enum platform_profile_option profile;
>  	int output, err =3D 0;
> -	int perfmode;
> +	int perfmode, funcmode;
>=20
>  	mutex_lock(&dytc_mutex);
>  	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
> @@ -10522,8 +10532,9 @@ static void dytc_profile_refresh(void)
>  	if (err)
>  		return;
>=20
> +	funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
>  	perfmode =3D (output >> DYTC_GET_MODE_BIT) & 0xF;
> -	convert_dytc_to_profile(perfmode, &profile);
> +	convert_dytc_to_profile(funcmode, perfmode, &profile);
>  	if (profile !=3D dytc_current_profile) {
>  		dytc_current_profile =3D profile;
>  		platform_profile_notify();
> --
> 2.39.0
