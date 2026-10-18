Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D237267C
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318328; cv=fail; b=Fz+UQNhY/aRExrnFYQTrS6H8J3P0qf966oOI8P9/j0NMzYhGcE6zJfeQuIfP8dRTCGjrSIsr22i6cwoc6wU4yHV0X10TdsAFohUp08Wk0rJBiIzYx/B7LIFzXCSM7l2Mc+f8jOV3njqgoxpRFW9VCFAGD0K67ROYisYa6g6J134=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318328; c=relaxed/simple;
	bh=OIQgHAnDJSSgZOBpYiaSxmpc2rARdb8OPNuDt+2d6DM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BT+qbdHLs6oNPkG1tyil0xbKQfwBh7jR2gqCiQz/DIV6dIg2P29jKqMeTOc4CQifgDCxs2stamqltkr3kJs6BB9SxDY1kIRbdWGF0hNqFTMxu9G0nb5LTivBdmxvdmj03XauY5+nVRrE7KlU9bPq8G0d6xaHKBppKUxPNATIDjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LP26C8oT; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LP26C8oT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2M9GOzZV4uPv1OSrKE/Y/cqHt12TF9XBVSsNolct2dLmcUl5fyIlBBzlzVDidV35CyerWuk+JZ6arR/NpzuOQ/JtqbkJ2EYLJ/yNEnYQeesvCH78IIhw5CSRqbcyGzDCUf6evwcx2dKwo20TT0Bt+uDXMADDc+uoQgPf0SmNHillGkPib6GCFhIUDKTy89R7Gi52K1Dl0PzcfSMf3wwN9YVgIt/mmDZ93FvAFBZ/WAnt2/noiynho0zaDdGUq7UHwkM2SxIMY4Ct9gvmNImLIs3LJSLZyBHfQ6c97nh0nWRuXT9l63XUR57DgzZnHrQ2DRQGzrNzUK9dk3nY+pQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSA2jI2VITpQ4ljXlieOx0JoBUH6IOKFd1cv4QVN/JU=;
 b=gcDnTBeNeFwhJLhfyks6BQyphLtYZOex3XkwcoBg3/WFQzvNYNjdTCxIYaKOL/H9he6N5ZLJyio8wbcY8aziwh7hTOCjfk6LWfhoWxdTJZZCmurSCGjudzWNVrdLjYtczxpZezyQ3miYb9OuJZBRcw3Kn4cGo8fvthzWugZyy3vC1qUs1z8MHIfnmPXnbKpLdiPTnX/klaY3ptifpmyCiwrEnbba1E66gKfMi0IpDuyLf/3lMquw3vx9qWjqbTOKBH8Ris4PWq0b31JMVpKoOtw2DQmGO4WjHxioIMxm6eEfIRvhndhFaeEQ1Om7Fr1OzxIdRLAywAFWFXtE/1gd2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSA2jI2VITpQ4ljXlieOx0JoBUH6IOKFd1cv4QVN/JU=;
 b=LP26C8oTNBkmhNig7Md3mNAIbDQPhcFiwlPfHQaRLEISSYW6vslyq2Rh1EAor/ezuZ3uM5gGPRqNxYBVT2g+/aE8GApNM6FTRGI7lH9JWDY99XNWMbcwFuL1RIOzQ8EemBJ2F7IONHWqKTUyJMzvUEjztLeBgVnVDwGBGWAYSe3inphV6Ht3deC1t+9MCKHKw3vVsvD5efQ2mV9H06oQ1MuNQx0dlZyT9jyqqY3DPZ4r6a+a6uQ1ShWic0dv4bpxuQsMo2iRB4HvNrWAqu23an4Rg10GQIfhZYd0+VJ27CZHUqYvHS64zlegVU932ojsTvaN7Cjfi1gxdxKJMtxNkg==
Received: from CH0PR03CA0404.namprd03.prod.outlook.com (2603:10b6:610:11b::33)
 by IA5PR12MB999275.namprd12.prod.outlook.com (2603:10b6:208:602::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Sun, 18 Oct
 2026 10:12:00 +0000
Received: from BN2PEPF0000A7FF.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::3a) by CH0PR03CA0404.outlook.office365.com
 (2603:10b6:610:11b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Sun,
 18 Oct 2026 10:12:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000A7FF.mail.protection.outlook.com (10.167.245.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 18 Oct 2026 10:11:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 18 Oct
 2026 03:11:42 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 03:11:40 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>,
	Felix Radensky <fradensky@nvidia.com>, <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH platform-next 2/3] platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
Date: Sun, 18 Oct 2026 13:11:19 +0300
Message-ID: <20261018101119.697831-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3d87a048-5bb3-cdf3-ace3-737c95bcf26f@linux.intel.com>
References: <3d87a048-5bb3-cdf3-ace3-737c95bcf26f@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FF:EE_|IA5PR12MB999275:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc8be9c-9227-44a2-5524-08df2d003f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|56012099006|11063799006|5023799004|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3HYrjHf7DRXp1w8od1muw2F+KnnCLuT7misjyFWX0o/AO52RmRP/17WEBIO6NE4PNfIHzJvl4ApB3qPmyXO3HBC4QB1rEY1ejC1Nk4ecMFr6AEE1BZ6qeFCjKIUdgPTdytnYTa4x5orqLWQpUc30VTWxgJyYY77yD+3+hLejL+DCN/QgHR+dVUbLfD7Xa9rHR3WtferG4l/gGmVQLy5tGk690rJJuZ312BMix+pmDXlkhOIVEI+9srLdARC0jf0RZR8/AYsNmpkbRCLypIVBwpTSSiclI/OpalWFhcCG0W/R9grbbtVLoFCbI8kylqx3xK0P4f3Ye3MfFxb2EF1ZqdpohX3rVKc0vn4zXT3sDR55thejOcwPvfz8vn0+aaq+v1p/mvfF/DJZQin+6WV9exdpDCmNj9Nk+CpaHeu6dIcUPkikulbdSIt6XPvspI2YisZITbV8MP31IeglYVxF40++/u0GDPr95LT34lUDrkWwbEytDI+i8RTs/elwcjtx6l4B+A8BHBGg+IL3EfltqUl5gqda1KyT1PmYoXxxB3q5NFEuN6Svl6yZJENd2+E7BcPL0Z3sWk62CWB32S1mvBBQazfZ/SNAt+iBJmGDLAQfTdxwV/+CuiwS+aGKtTWfGjkCEv6R9+KgKuPkTudDf8FYgPB/9ZvFrdG7pWdiKyj/9fUXzqjeuiZQl/xEg8mo0kuqQUL2JmL8vJ0NEYKUjw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E46qxsFxtGBQXTn74st3luNRJtmryh/FT6Ui/u6LbR28trm+8bMZKDBwdvD1ECUS8PxWZLFmzzQyOnH6BCBSOBUNkcVVGv0phmX9W0WODlHf4NGadzN/XfBLhu+XUb12LJ1/K+YzJwmch9OR0ddb32H4jaYfgBUbGauDxF/6VB3h5eLn8pkjXs+FUVg+qoQxHIZOB38OdFFME6lwuJvx4HXgrODUv2jdGDpSZQnOZVvIu8oKjNStFnlQVmSN9LHhHr7YaTRTsdxxHgWSdq58qtorI+UgAP2dC9xg+0zsv/2LdkdH6qT7pVe+g7Zy+zKnqeClmgf2ppei8wucsX37TDLJUHhVkAFEx5VYJJ+VHq4zgRCdC63PtY/m2kgrh8XPK7Svb8rAhmy3bxyGZJ4F/YJG5hP36rG9THVCm8IA73NvYuJ2ZMqiKsnSaA70Fwz9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 10:11:58.9812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc8be9c-9227-44a2-5524-08df2d003f17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A7FF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999275

On Thu, 16 Oct 2026, Ilpo Järvinen wrote:

> > +		.num_adaps = ARRAY_SIZE(nvsw_host_spc6_mux_channels),
>
> Add include.

Right, all four were arriving transitively. v2 adds the direct
includes for the macros both files use: linux/array_size.h for
ARRAY_SIZE, linux/bits.h for BIT and GENMASK, linux/err.h for IS_ERR
and PTR_ERR, and linux/dev_printk.h for the dev_*() helpers.
nvsw-core.c in patch 1 needed linux/export.h and linux/types.h as
well, and I sorted both include blocks.

> > +			err = PTR_ERR(nvsw_core->mux[i]);
> > +			nvsw_core->mux[i] = NULL;
>
> If you end up returning error, doesn't that lead to tearing down
> everything? So why you need to do these NULL assignment? Please
> explain/justify why you have so many NULL assignments on your error paths.
> I suspect they're either unnecessary or some of your decision decisions
> are not sound (such as calling a generic cleanup function in case of error
> instead of doing proper rollbacks in-situ).

You are right on both counts, and I have no justification to offer for
them. They are gone in v2.

To answer the question properly: struct nvsw_core is devm_kzalloc()'d
by the board driver, so when probe fails devres frees it and nothing
can observe those NULLs. They looked load bearing only because the
code assigned the return of platform_device_register_resndata()
directly into the struct field, which left an ERR_PTR there on
failure, and the cleanup paths then tested that field for NULL. The
NULL store existed to undo a mistake made one line earlier.

v2 registers into a local and publishes the pointer only once it is
known good:

	pdev = platform_device_register_resndata(...);
	if (IS_ERR(pdev)) {
		dev_err(...);
		return PTR_ERR(pdev);
	}
	nvsw_core->regio = pdev;

A field is now either NULL or a valid device, so the rollback is
positional and the tests disappear. platform_device_unregister()
accepts NULL, which covers the devices a board does not describe:

err_unregister_wd:
	while (i--)
		platform_device_unregister(nvsw_core->wd[i]);
	platform_device_unregister(nvsw_core->hotplug);
err_unregister_led:
	platform_device_unregister(nvsw_core->led);
err_unregister_fan:
	platform_device_unregister(nvsw_core->fan);
err_unregister_regio:
	platform_device_unregister(nvsw_core->regio);

Your suspicion about generic cleanup was correct too.
nvsw_host_spc6_mux_topology_exit() tested every entry for NULL only
because the init path could leave a partially populated array behind.
Now that init rolls back fully, exit unregisters in reverse order with
no tests at all.

That removes 19 of the 23 NULL assignments in the series. The 4 that
remain are on nvsw_host_mux_i2c_client and nvsw_host_mux_i2c_adapter
in nvsw-host-spc6.c. Those two are module scope, so unlike the fields
above they do outlive a failed probe, and I kept the stores so neither
is left pointing at an unregistered client or a released adapter.
Nothing reads a stale value in practice, since probe reassigns the
adapter on entry, so if you find that over-defensive they can go
entirely: the client is already reachable as nvsw_core->client, and
the adapter can be taken from client->adapter before unregistering,
which drops both globals without adding a field to nvsw.h.

Thanks for the review.

-- 
Felix
