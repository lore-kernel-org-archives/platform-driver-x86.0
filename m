Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4C3C05027
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjBHGf5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjBHGf4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:35:56 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEE44390D
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPJdWnQ0YFkdb0zlQeGYan6ipcr8SROPlm+bVcWhB0Ij2NAXz53hLUtBhdg2NB+PHCpKdhns9kYkGXFT8RYGE4eWs5lrBc0QvgKbro6VdOWBXy4pK0L94iq953uV5nO7BocGnI6D/prL5ASrJJ7o4ct6w5Hn2a2pgTGLTgsimikZlZ+AyWEwRDZpH2OU7LLAFmlpggAm2mn/MMJe7uLbUMFqpxeKE1Ol8o+NLnUZ4HSFHWwnuEckvTqfs1SPcZEOkwWtQ55ys6DJ5XUg6OHJtNrKhQuXu9hi4QAVmDNJxoolynXbl9fC17j58vGEo5NSflgj2YIvoO+n451QxiJb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBaP+cRfqCX+ZNwXO4quHWO7/aX0L9GViux5Q51aj+o=;
 b=EhWP88sfRlq8soNN6MEB8pG0jAe14pAo05FRb+IO3JC/uoIX4D2WFzqYXJEnYJ8f/NnumyKiaUPuiJdY0vw6urGpMIGPSe6ieUfIbB0WlOfYqts2jh3txba6iOYtadk3RnARB4r76zzCPuKr3JNrLCqJNuNz/h9CZAEduhEhSzTLePyvOyWOWLVs8LJzDJHXoPDU3aWyhbwqoCPEZmKT/WS4dbQgnpeyJofKPSf+PgD0WGbJOhJ5zK1VDbHmZLoLw7FqQR29ps/+Ft6eFhNyjgVtqrwRLfjd4hqVYjVdie3Qebd0FiBwmMijRzkI1fHqSMTOnm0J4Cr097ZnGheX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBaP+cRfqCX+ZNwXO4quHWO7/aX0L9GViux5Q51aj+o=;
 b=cpOSodzEGgoIANLP3Awpnldaw7qMFHjbk5QarZ91ePCYC9wNOThFDiiP5U3nWvR0yk2f2PG5ZF3vEn7M1vIZLBQgYHy+OCfaJLuItNKdYcc19xQ+ypQ3h4KXpZmVf9TV2fu24hA7m73/M1ZuMN9ACPIzODeuDY7tKy4JPcSm8tpngjbFfrvzxfRZvIChj5Mqb5Voc08YqtoeD4kHN21axVqSR79OrvEQhCnTjw/TxlathvaNo6vHhvG7NNpF/N7zMdh47PCuKAoHuO3NjUYbbO7BcisETU3X1fTa3k5ve96bg/fqIxACX/ijOV1n2SacOtakeCZ50ljJtNnoZs1MCQ==
Received: from DM5PR07CA0085.namprd07.prod.outlook.com (2603:10b6:4:ae::14) by
 DS0PR12MB7727.namprd12.prod.outlook.com (2603:10b6:8:135::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17; Wed, 8 Feb 2023 06:35:53 +0000
Received: from DS1PEPF0000E65D.namprd02.prod.outlook.com
 (2603:10b6:4:ae:cafe::df) by DM5PR07CA0085.outlook.office365.com
 (2603:10b6:4:ae::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 06:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E65D.mail.protection.outlook.com (10.167.18.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Wed, 8 Feb 2023 06:35:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:35:44 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:35:43 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 09/13] platform/mellanox: mlxreg-hotplug: Allow more flexible hotplug events configuration
Date:   Wed, 8 Feb 2023 08:33:26 +0200
Message-ID: <20230208063331.15560-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E65D:EE_|DS0PR12MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0ceb42-5a5a-4c59-0087-08db099eba4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1AhsPRNsBuOgAmlDmfK1FekR99HpNOaabZBDJmBMaktSNO2eJuRZY6tYq0r1+UkYuZ9uMY+Pbqzm4jg1u9qhASM5psfZRt5lJoQew9VpPRG/58FqTzQoXLOWXgVW7Pcty99voCpf9mKHAx41x9dSR2mnvycSg246LW4MerzbkQwXSfLHg+SrNqTomuoMjvVs+9JYk5216Ubu3FypAFoBKBc3lSyh7wUcc51bPRLidhYusS/ytnmc8M4sw+V2CVO16fInxBn54pTWFR0axzbZMAyPmnezvvFsE4QVQjrfRDYTrVQmSTVG5jKE6AEadTznhwhM05wdiNJPGp/pcalUmz2irxcb+tfk3FBqhhCuM/1ACnxya/fS8EPOtXMT5kP/bxObERxBzNWfbB5yIdxtPQiz7BKd963RybFyAibqKPlbyaewq6S5HrhXQNh96JI0TyTV3rF1J97JfG03Ean4lHyab7FiPv9O8h2yu+XbkqqhKJx1C0ZFk9/xVb4Kmgmbdq6P8d+3VJTZVmz9COuQ1nxur2YZ5iycia+Hq+1OBaPQJzbQ+W02Oieowp6uGQbm6pFhjihVgFAwfRbjJeWdlKRThYB/W2jTzDsAqiR42GeMxPr0gVWqojmG/wwcUhO2XFkMPPROmxHY1I3e8BYJPdhdO96NS+oZnFD+gXXVJ2zSZeVUbd2chup8aIentSmLEFfJfOpiyWtO901iLDu9A==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(40460700003)(82740400003)(7636003)(356005)(316002)(8676002)(8936002)(41300700001)(4326008)(186003)(70586007)(2906002)(36860700001)(5660300002)(1076003)(6916009)(107886003)(2616005)(6666004)(26005)(16526019)(70206006)(478600001)(82310400005)(86362001)(83380400001)(54906003)(426003)(47076005)(40480700001)(336012)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:35:53.6873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0ceb42-5a5a-4c59-0087-08db099eba4f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E65D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7727
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently hotplug configuration in logic device assumes that all items
are provided with no holes.
Thus, any group of hotplug events, associated with the specific
status/event/mask registers is configured in those registers
successively from bit zero to bit #n (#n < 8).

This logic is changed int order to allow non-successive definition to
support configuration with the skipped bits – for example bits 3, 5, 7
in status/event/mask registers can be associated with hotplug events,
while others can be skipped.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 28 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 117bc3f395fd..b7dcc64cd238 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -239,6 +239,17 @@ static ssize_t mlxreg_hotplug_attr_show(struct device *dev,
 #define PRIV_ATTR(i) priv->mlxreg_hotplug_attr[i]
 #define PRIV_DEV_ATTR(i) priv->mlxreg_hotplug_dev_attr[i]
 
+static int mlxreg_hotplug_item_label_index_get(u32 mask, u32 bit)
+{
+	int i, j;
+
+	for (i = 0, j = -1; i <= bit; i++) {
+		if (mask & BIT(i))
+			j++;
+	}
+	return j;
+}
+
 static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 {
 	struct mlxreg_core_hotplug_platform_data *pdata;
@@ -246,7 +257,7 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 	struct mlxreg_core_data *data;
 	unsigned long mask;
 	u32 regval;
-	int num_attrs = 0, id = 0, i, j, k, ret;
+	int num_attrs = 0, id = 0, i, j, k, count, ret;
 
 	pdata = dev_get_platdata(&priv->pdev->dev);
 	item = pdata->items;
@@ -272,7 +283,8 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 		/* Go over all unmasked units within item. */
 		mask = item->mask;
 		k = 0;
-		for_each_set_bit(j, &mask, item->count) {
+		count = item->ind ? item->ind : item->count;
+		for_each_set_bit(j, &mask, count) {
 			if (data->capability) {
 				/*
 				 * Read capability register and skip non
@@ -282,16 +294,17 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 						  data->capability, &regval);
 				if (ret)
 					return ret;
+
 				if (!(regval & data->bit)) {
 					data++;
 					continue;
 				}
 			}
+
 			PRIV_ATTR(id) = &PRIV_DEV_ATTR(id).dev_attr.attr;
 			PRIV_ATTR(id)->name = devm_kasprintf(&priv->pdev->dev,
 							     GFP_KERNEL,
 							     data->label);
-
 			if (!PRIV_ATTR(id)->name) {
 				dev_err(priv->dev, "Memory allocation failed for attr %d.\n",
 					id);
@@ -365,9 +378,14 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 	regval &= item->mask;
 	asserted = item->cache ^ regval;
 	item->cache = regval;
-
 	for_each_set_bit(bit, &asserted, 8) {
-		data = item->data + bit;
+		int pos;
+
+		pos = mlxreg_hotplug_item_label_index_get(item->mask, bit);
+		if (pos < 0)
+			goto out;
+
+		data = item->data + pos;
 		if (regval & BIT(bit)) {
 			if (item->inversed)
 				mlxreg_hotplug_device_destroy(priv, data, item->kind);
-- 
2.20.1

