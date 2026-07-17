Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013070.outbound.protection.outlook.com [52.101.127.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C663F12F8;
	Fri, 17 Jul 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287361; cv=fail; b=o2WS3uJfXoLKxQG1DcFeDeaFkLBIAc4Tm9/pqSws8Mn0Bw0bzqba8t7KflEhCPVOP8Ff+EU0k2/nslocZP1oyfZKufke/4XKsfXVVWiaM0zRYiaKPX/ExERcTudNoFa1itD7u6p330nuk0aQC/U0B2fxlUFagNyzXGp5+zsHviw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287361; c=relaxed/simple;
	bh=gmj29G/XJEV1ome+nueYgL84GstEOzbGUnqrJUr7Er8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pmV0XbIFDVl6A0rzLMotNV7o4arOB5qx0QPBE06j3mEYBOfqu158XKP5UYTqdnfp1LVNSyNJgZ1qE1io+Ty2W/G4zbpUiyzhrwrthMfJbiycDbbKQcgIVlHTEZZkeAHhwq1/tD0q6AKsnmoL8ZZX8veSbD++FfINLgKJVvkpDJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gKJ7xDmA; arc=fail smtp.client-ip=52.101.127.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gKJ7xDmA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CK3ehFhhhgBnvpcrRKbV180fDz1+twbBRco4o5grjBUl8S7q0bi2K3KLaVWRw5wrEIDHZOi57sgWCWsgW7nZMCFo7cJrMry5UO5NHDp843Wcdr2c4wzAYlxAPXoCp5NTPOq+8CY0lPd3jah5a/2MXdJQXEY9eiL5QRAxi9o1jvGY6mp/4ft/osCQY0l/LSPznlNSfOYLRVpZMQljd0ns/653jrtdMvzzXRAwbNG0mTa/GtVQ0XoPdzW+cmokXoI3yG+QXDstoHBhPuyRR/mApKzs8kv9YyandJH/emNugM7rOxHQ2a6TgYwG37DUIkO0IZd2Hoq2K0TF4+iuIowAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mVpnBKlrI2YZhv4VyexqJfs38qBBRNCujDNwCjJ7RI=;
 b=kpfq0lj+OTkhLocmcWVzBsMMCDW90179xom8oHW8CMjRPLl2jhuz2crl0LRdQWvgLVj/zMDghZAJz5MtdY6FzCM6/lkGuoAwAYDrgABu3n8HPjBTHEj3uZDhzt1yklnYWgxSTX0ue8x8ZBt0Dks4DBAqE4xeMtoXs3PlrsDCFCVrMBQB0xZZq0JnsYB1PcOZ3Ij5GAnln3J9omdwc1buqGtYMNyL0WYW9r8SmkQCA3VLYNs7YFviCXgh4t62v1XSazc2qkIjk//3Ai4KJ+Y+JRU1J8U2Rie5PknEwfFOyq4Pv4VMwO3jQto9kz2WkXw0i+z0ojPZZGLzcTmtOlVPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mVpnBKlrI2YZhv4VyexqJfs38qBBRNCujDNwCjJ7RI=;
 b=gKJ7xDmAY3cmXppG7q/LNdmwfVOOFghN9PWxfPiaS+4xq94BZvU2ed0ifS5OT8zDQXbdz5pH+Xv6G17c2NxtcixzYDBCIn3x7NP6RNwgMHyVIc9A/Wbag6JvOfGaqN0uxYxMlP6d0DD2H6wq5zXQX9/z27nokqj//h2IopSjAAkWtAcD0Kb3DNCdZE1QHN7Be+z0HDmFSiXtzOKoP2k1PHNBEAtgwH2LoLyC4C26xFzKiybk30i6V/X350+6aj2D5PO0qkLRsVNhsDsOkcfwZ3Fs9kiUVGJ0FBXfwek7Lo7qgrn0ZOmAnIlao31aeQYVT1NMUGQuWkjVYCm08XdbcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Fri, 17 Jul
 2026 11:22:04 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:22:04 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org (open list:MELLANOX HARDWARE PLATFORM SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 5/7] platform/mellanox: Remove redundant dev_err()
Date: Fri, 17 Jul 2026 19:20:43 +0800
Message-Id: <20260717112103.213017-6-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717112103.213017-1-panchuang@vivo.com>
References: <20260717112103.213017-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|PS1PPF5540628D6:EE_
X-MS-Office365-Filtering-Correlation-Id: df935e49-a68f-4a3e-5b86-08dee3f5a13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|1800799024|376014|6133799003|56012099006|11063799006|38350700014|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9WE06L+jHsE/VMNRAR3E1pt0ZjA5T2WJp3+lsfb8mf9SitpFbQqsuksE8sLjz+oZrtfvf4XrmQ0+KFeZjYcP4OR6+q6qi8bWdM85JipWKUNGcci98jqEF0G2vxywkAN2Wf06iw8OtLq5xdz4p8LZEpfOrsRo2ShyO3m0jBOtOwuPfe7PeRKZ+y0QRFWY6zrmRhaEcrKSTSW4Csg35Runa0FsWeoq3MyMr0T/kGoWlug1/DqrA6lRAI7t1N9WPddFB8QZ4kWQ30fjEj/RQ8EuISYPZVPTdMXI4Z/TnVLoveJEN5K/+JvLh9C1Mtsh1OZcOWOKsohVmu7INbyA+Z3fp6xubyWfO3koDeHUydFeRSOy6hA2C4hS/YHp64tF883KOPAgU0HhOMBRqf4DE4pkNwWb/H8zktjCcPHVZunSPAUR2oHBHKXxiBZyaKc0UaUhIbGcc8q7yyWMC9GCuV4G9NmOhEIPOqQ5nHiRPyeYey/AaYAvGY+Oa81a9zAL+JwtQzI+2orsacsB3er4Rpy/x5vkqW7RW7CyxUzbvPlEyulx7pdiqN4A91ieN1NbUkV39dazbCD/8DZuDya4VvZCCs5Ra5hxf0aXjNR2tOh48bPYTKhEH+B7FD2qcDDcWMv5G5VqKKCXNbOYgoeySMusgQjK9VJF86LLDswk+dVEC3kk5D9s/4RBoq/ELK91/IRiikTSFb7ev8J3jofEpJfkcuk/d9y2E5pCA3fq3BJu4nw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(1800799024)(376014)(6133799003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G5lXujO3yImGAmZLvCNibuy/KwN+ZMGtCkzHwQ1tQD0UEo7C2DobiEbjZ0yU?=
 =?us-ascii?Q?D+apt54Z6purJcdwvmM5tPnJsJgNV+q+Qf4lbg+yQbnGs8Xe0BahD9WqzGug?=
 =?us-ascii?Q?9YHCbBcLj5Pvetw7X1rQiGAGS4fSi8vvvbOASjCBtEBXDXlFjLvwiG4VNCHn?=
 =?us-ascii?Q?ByKrLx1D+kbbP4+KxshnTc1UKsYS5+o+qxUkzTTBYFOeDBdkhm9tjP25m8EK?=
 =?us-ascii?Q?omOW1UCw+0qNRZx4WhbIofmzqD7fYiTgFqk7Qtr0c8viIX8RPIddU91miliG?=
 =?us-ascii?Q?Zdj8XSxYloeKHoGVrj/9OmLQQ6TF478aT58skaKVUWkpy2f2mXSLkU5CjOHV?=
 =?us-ascii?Q?3vLfAKUVXkXkpFn+TpG5svTMHLesEWDJLGnC3gDnx4/Pf4ZMM3D3HkZ5TYQl?=
 =?us-ascii?Q?qt8R9FF1VS+9woo/1IRK3CgCgbM4AhUnLHA7mRjavVsYChbZFL3fCCNoYjU6?=
 =?us-ascii?Q?JFm4qLvqmDHI0ID8xigDqCxdWcUAGpYDMUVK6CTqXjLU0Ydr/sru2Lr50P63?=
 =?us-ascii?Q?rKvgJnWtx+l4zeqvOzRA6qlVF9mo2vHVopB7iWl8gcGx3/E6jaopxiteeace?=
 =?us-ascii?Q?BI9e0t6eP5GSdgX0ydY8RAfbqf0UV2iZ8in0MbF4wB9out3V0PTIs3Ju3feD?=
 =?us-ascii?Q?HTZtEAHxGYJ9iBkS88d+bjsqkig9SIAKJGbObjRYourAnfQ0UgwpYz2nTWCd?=
 =?us-ascii?Q?+l7nIZ2w+S4DG2/iYxfqWUpKiHOVgabsQTnwumfTZL21ht6vBFhczh1sqd8r?=
 =?us-ascii?Q?vT5fyTPYZEt5FdHhOhEWSI4zGXRgBNc4IDkVi4h/QRi/VkPL3jEWARYK/Qdl?=
 =?us-ascii?Q?UUEdgEo9GvAstqdacc27ybRDZylWHflid+RYtngs6prFt9YP6XElbuqUlDts?=
 =?us-ascii?Q?Ifw2Xb04bAhnl5Di/cI7bRK5r2ub4XX0OP9Qhw5hAK9P00P5/BD9mXpYn8Lr?=
 =?us-ascii?Q?82csp9bFtBALWD+tIz91Lbf6aj8EMWi4ppSG2Xm6LrFCmH+5VvVGxzmnMXoE?=
 =?us-ascii?Q?D8gg2bCaJ4HsIK557NDdQRaDLyRbQzfB/pQIVT0h6trHB8wXCSBCfDGctqrT?=
 =?us-ascii?Q?84l97HZsNZ5ea40/DmEHN1V4NkAm8gSZaudX5v+86kOHzdfy2IeN2WQVahZC?=
 =?us-ascii?Q?gA7rjwHhSfSxI0CPolhPZjlR/MsyY3+ir5GPWpjASYfOj+ZCcJaJgi3Pnn2Z?=
 =?us-ascii?Q?EkTF86Gs2H8K+ZnUvM1gj5ogy1rG+QA6H/t3ReLcOLt6ipXGBtFH44OwCIml?=
 =?us-ascii?Q?QDu2n6u5vXQSRMyWMhRXN3RHRguxpnauI3rAnfuYmS/WUJmV6L3aJlih97lk?=
 =?us-ascii?Q?GSAIxnshWs5JLaRe0DUC3AmXNdciYG6H9NUPRksKSAudY6HhqsXRQ/vzCDUu?=
 =?us-ascii?Q?pgDCPgwyTaUuMVYC+lZPrE6Ug2fKu+FY6WHERrJvm2YKTD1E86ZZQC1yroTf?=
 =?us-ascii?Q?iy+03em9Up1FnRtof+zTNqHRCrjYNg31h7usCDYqg5e/IVVNtie7PVYoEFG2?=
 =?us-ascii?Q?Mfclirvu504a6A50lv63NGwS+lUdyxHpfYOu85WpMz47IXnn4GllcKSKzfKG?=
 =?us-ascii?Q?OIL2SeS8fo8hgivZ6sLrKgRQFMWiL+nR7m3yhiFW1cFpmYcN39H9uCOWJMqn?=
 =?us-ascii?Q?rEwPdgCZ5ZIv5irSzdRDf7uHCNBt9tgzdK3sdD1GplmCsnFWeX49l3PQRJ9P?=
 =?us-ascii?Q?pzL/gUUgqBSpAIU3iEGHNtzwOR7csmxraSB1QYzcvyYsZXZj7u3GklIZOA2o?=
 =?us-ascii?Q?DpHd/2/xZQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df935e49-a68f-4a3e-5b86-08dee3f5a13d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:22:04.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpJPtX9QO9GF58u73khaTFqHJPhEPZtvEUrBHQEA6twHFoLH8zbyh6x8tqN0lh7vPblITGzYiTKaslY5RCxDCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF5540628D6

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c   | 1 -
 drivers/platform/mellanox/mlxreg-hotplug.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 3c6408581373..fb1d424659c6 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -1390,7 +1390,6 @@ static int mlxbf_tmfifo_probe(struct platform_device *pdev)
 				      mlxbf_tmfifo_irq_handler, 0,
 				      "tmfifo", &fifo->irq_info[i]);
 		if (rc) {
-			dev_err(dev, "devm_request_irq failed\n");
 			fifo->irq_info[i].irq = 0;
 			return rc;
 		}
diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index d246772aafd6..d6549dd21772 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -740,10 +740,8 @@ static int mlxreg_hotplug_probe(struct platform_device *pdev)
 	err = devm_request_irq(&pdev->dev, priv->irq,
 			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
 			       | IRQF_SHARED, "mlxreg-hotplug", priv);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
+	if (err)
 		return err;
-	}
 
 	disable_irq(priv->irq);
 	spin_lock_init(&priv->lock);
-- 
2.34.1

