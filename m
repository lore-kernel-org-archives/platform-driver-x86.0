Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90ECC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 09:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FAEC61359
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 09:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbhDGJCn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 05:02:43 -0400
Received: from mail-dm6nam10on2072.outbound.protection.outlook.com ([40.107.93.72]:9473
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349871AbhDGJCl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 05:02:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WarGG9fsd8K34lbpZhzdKuItg+RVtT8n0gaTbq9uR0ZeeM7R6h3qtenigp0QTNp+ylJNHjfN/L7AwcCn31z4skyhcEDHQ2bkE4YYyq+YI9gS0ZRXbPG8k2h1OpvOEG5KlspLBcRQXmf33fRNXdLFVdW0LeDx24GMaO1e/X7q9wBNLpHiRX4pFnGoDxbZmd/2ZcFqDqc+H1cEksvLEIW5IICEzMHrrKWRUzu9bW6Jp9Lbs5DLQTLHYbxxn2Ty43Med08wHoYj0fRjG9wLIYWW6Ytxjy7qOJzqDBI6paJ4S/+AA8qhEUj/wi4K01SEtcNJxH/GOgMhHwbRSAm3ZnLhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zpdVOg5mmfwxNzr/acqgPRPnony8JAKERUTuX9LddU=;
 b=WhAtn/hMebz3muw3IHfhP85IeyYn56J0N+BV0Tm5LKTa8/Q5sK3ncHEiWZcvYn2iDuN3Dn9wknEzHtKN2zuo9+VvaEXvS0caY4LZfptVHrYN5PvIjhxPXVPaOuVx2ImQYM71khDSChAWF/MfugtqnWvKznQuWTccn6cB3eBojHbr1RaJLM2Dy4xcJOYySOkFb7AJXg36cpem2dFYcszJGCjhzAFqD45g46/KK72NzRmFHSIBjHizUnVXdBOiM7XMLG2Hnz3jnCy4bYCncwdN90r56V0A0JM/VJwB+k/T1kZfYcYevmD+dA5n3FqLRLQ3leNz12EElZxsAV+E4i1Ilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zpdVOg5mmfwxNzr/acqgPRPnony8JAKERUTuX9LddU=;
 b=XriQ0t27Cbtz4lckNVDGf+R0UibURycQZFan3wmbkEAlwAiCSuRPmwxH67NgJAQfc4bIbP1VVA6mLW7ZfrDerZ1f949DDecYjMmL1rb+fvpHIPXcBdUamEqobZ62Rbx2ap5YcxsP0ujPB7rBby3an3w4gjmJp4Kgd+4nu8qW97QWNmVCAu41fzNhMwgqr+r4wUR1dkvtaUxcC6vr9cF8Az1jwt2VDhMZMNZgnJlhz7/MP9NtbMyhQxT5MPX62k2cIt7AwDH5Iq7F2/4z+iPGOxpHd49F/xaraecwML9i6yJZdiFxKXJWGBJ8wZv9OS0uxytF9Mg2l6xIld9aL6rXMQ==
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM6PR12MB4561.namprd12.prod.outlook.com (2603:10b6:5:2ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 09:02:31 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ddbf:58cc:edc6:7c6a]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ddbf:58cc:edc6:7c6a%3]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 09:02:31 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Tian Tao <tiantao6@hisilicon.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/mellanox: mlxreg-hotplug: move to use
 request_irq by IRQF_NO_AUTOEN flag
Thread-Topic: [PATCH] platform/mellanox: mlxreg-hotplug: move to use
 request_irq by IRQF_NO_AUTOEN flag
Thread-Index: AQHXK4xSNZyIwaUG7U6fYQ9hHVWjsKqowjmA
Date:   Wed, 7 Apr 2021 09:02:31 +0000
Message-ID: <DM6PR12MB3898E46BF8D3CA8ADA2451FEAF759@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <1617785983-28878-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1617785983-28878-1-git-send-email-tiantao6@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.117.168.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0f74324-c551-4243-cdfa-08d8f9a3e0aa
x-ms-traffictypediagnostic: DM6PR12MB4561:
x-microsoft-antispam-prvs: <DM6PR12MB45612B58C0649D61D58FAAC1AF759@DM6PR12MB4561.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1ca55jODPusJSFHoljUBcoqnTFZSLZhK41DbL/fL5dEGWdS8H4p+Y7U62rxyUQEV7CrdcF2uf7EJ9ZzXej1qRazTj6roS7TSlS6lhon3lWE9IC5NWAJWHRlm2AkYJ/qwgNvzKOqGzHOsba/tKPzprXLHNSnhThKxoCOnsR2qFImbKPnjKh3PGxbUL2tiCRVBB/DHMsH3thw4aW6Ec+S/JipAMeowp9Bpqs9u05v1BdF5Nzb/g+qU+8ScY6hokz7gVxYICgLxTOYyA1p3tpewuV3i41/0ddQ4xff+Kat6zyu7ds2hlF77tQ9boMTxIhwb6VuFs1wwoLnOAPXgL0jKxTnDW3yoF4KmTvjxEcGbOFlqOJi4+3yt/En7CUp5EEf2Pm30+Aq+WI3C+z/3A3pM+B9ft2KLrpaTbBG6d8tNffYuFAC/zD23KtMqhPeSb5hIUVCFDtpotpgVGHxS0suDgQIfja5Q4aAIE/y9H344EPfqP3IE/mF4JMgUTz3tEEwVES+hn7cl2x85zK9r9PoEOBhJDol8krTdpHzVlKxLWqkqkOsH2etVJUZBIrrDRv0qeHIKswR7gIXOtMNYQM/9CWXLKC2lNk1lFAX5GOubFnI4y6CQIcV5hzDeAPzNedMV9veE5cfPhbTOh7ExBfXtcF96Ktx1JpjoMdcOOkUg8ms59YAl+0ZnnVsTsyZT0XBoB1IKb161WmfjqpS5Lt2e1aHZ1wEqE1AsUyIThlnCOg0xqbR1FbfgP+LR6cSoKXw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(76116006)(5660300002)(66946007)(7696005)(33656002)(4326008)(316002)(8936002)(8676002)(86362001)(2906002)(110136005)(38100700001)(83380400001)(26005)(55016002)(71200400001)(6506007)(53546011)(66556008)(64756008)(66446008)(52536014)(66476007)(478600001)(966005)(186003)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9wNR3UVLKYbZ1lh+MSDx/xokCT5IlYoj7FdVDO2xg3TRI8OY3PMcMKIK19XE?=
 =?us-ascii?Q?pZSokcNYAS7/vIkUF71FHDn87odyMydYrGKJcFthLtd0Jdzzp7UpmBFo/unb?=
 =?us-ascii?Q?GF4KqEpLbMUWbcYtug9r0ha4wvcyxakxaqmn0P7ZDkO5ppjrYobN0Q1luFd/?=
 =?us-ascii?Q?Sl5mojnsLHkt/lFH2IUPdvGYgdmNV9yAPR4vV2cb6Mvs7TajXQxUc2X49qIt?=
 =?us-ascii?Q?R6J/8CQibNaalRIkWGklFzecKKj4HkwhcOnpi8ouJRNtNkFFCfa/NhVPaX/s?=
 =?us-ascii?Q?JjzgZoLlWkrAFBUINJDdA/VpGw6xIka0cR9uB3/AmCMB60qtYmPBSBCjL4X9?=
 =?us-ascii?Q?C+kV6yIhU145kKfP8MzkBFcjynERKIJZ0vMkHDMCuQi5dqNIxSx6dPq4d1Yd?=
 =?us-ascii?Q?BtFVG0gjAnCp8YMkpMrUpvBHGG9jMXu85fRrwCZJkQ1HdlVNhDYEztkJwaRU?=
 =?us-ascii?Q?94H4Bb/5DsJyX2H1pYzdGUDxySxtxUoMT2PgMI9SVNbBLqYje0SS6VLTrDWk?=
 =?us-ascii?Q?Sjv6xs5zP7iQ2wgWDg3saJWYIHDdmpBBln6sbY2f9gBnWRLDnbVxW9hcQtzC?=
 =?us-ascii?Q?0ZKqmSwYjdRSiZAZEilahAl/BEMxNm5vCmdgS0Ik4HXT4pifRiXImdnc/9SS?=
 =?us-ascii?Q?xNOMQ2zxh3UYL/f23N2W0oPhrchwqu+Qs7LuFQIFoUzSzvMUwFn6zcxh88Fn?=
 =?us-ascii?Q?JSuzUWSBXWhtOZSOKFNJLLr0ruFye0Onl7rAFAeBR/XK0TbjWL9smf422fOg?=
 =?us-ascii?Q?nUck6f9JFpsZnI04AtLXTS92HSpsBwLxwI1CJ/msrBGRLYVzO6KTv6T6KbUW?=
 =?us-ascii?Q?G4oA/fgEJ+Cc4hNANCe8wWChAvr9NjPPVmzzFzPHec/lPpo2BTtGSRl/BbOv?=
 =?us-ascii?Q?x9HKeM1hh7CicfXH51So/yZLW2xdeQbLyD2kODiqwq0pSBVqEvDFHpyCl0yv?=
 =?us-ascii?Q?hZGes8rtJoBvgrO3akqvBH1VkCI31I2lx1c65DWDcFMMbVu+9gJo1RadBA/p?=
 =?us-ascii?Q?fdnahkuZ7MYBKIn8cxly5T/YKG/Azg6hhahCPVFL+HMetUfxxsew0oiw6/2A?=
 =?us-ascii?Q?iKdergtbHBC7H497o6KihXWOrreEiBsx4et/IK33+jv7pZsAcwYeMWG2xRbj?=
 =?us-ascii?Q?C4mNYZl077X2epnO1ynHmqKaZkoxWe6BgbbC/rwIl3vj5TWCvzuvP+hh2C9P?=
 =?us-ascii?Q?EoBiD8gDmyyGkINw1XO3V+vmqr2AyeUZMEup7dvOKis8njLuOKaDHjmC7M81?=
 =?us-ascii?Q?5PU53Xv8d/0e/e/pO7KizaktUwwKjcNyBcRGvQwMTCi6RXcFGNa4N81Lqg74?=
 =?us-ascii?Q?yzvCL6+vr8kLs3sv30M5PuHY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f74324-c551-4243-cdfa-08d8f9a3e0aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 09:02:31.6441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVaWBz7agIy+Mt39uvz0vzClkqE1r1O7klSW01gaGhIx/axMiMBedq4xBc+Ybaar4+0EYJkmG5pTbDm5KxYmLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4561
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



-----Original Message-----
From: Tian Tao <tiantao6@hisilicon.com>=20
Sent: Wednesday, April 7, 2021 12:00 PM
To: hdegoede@redhat.com; mgross@linux.intel.com; Vadim Pasternak <vadimp@nv=
idia.com>
Cc: platform-driver-x86@vger.kernel.org; Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] platform/mellanox: mlxreg-hotplug: move to use request_irq=
 by IRQF_NO_AUTOEN flag

disable_irq() after request_irq() still has a time gap in which interrupts =
can come. request_irq() with IRQF_NO_AUTOEN flag will disable IRQ auto-enab=
le because of requesting.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which is be=
ing merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Vadim Pasternak <vadimp@nvidia.com>

---
 drivers/platform/mellanox/mlxreg-hotplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/=
mellanox/mlxreg-hotplug.c
index b013445..a9db2f3 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -683,13 +683,13 @@ static int mlxreg_hotplug_probe(struct platform_devic=
e *pdev)
=20
 	err =3D devm_request_irq(&pdev->dev, priv->irq,
 			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
-			       | IRQF_SHARED, "mlxreg-hotplug", priv);
+			       | IRQF_SHARED | IRQF_NO_AUTOEN,
+			       "mlxreg-hotplug", priv);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
 		return err;
 	}
=20
-	disable_irq(priv->irq);
 	spin_lock_init(&priv->lock);
 	INIT_DELAYED_WORK(&priv->dwork_irq, mlxreg_hotplug_work_handler);
 	dev_set_drvdata(&pdev->dev, priv);
--
2.7.4

