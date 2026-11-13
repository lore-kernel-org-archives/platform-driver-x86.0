Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794608893;
	b=B7aRjRrN54a5RlHGWwBvAhKzrmSSbnvRmJj23iLN3zxoQbKHqZbJHWTJT55GOUep2t3j
	 d9eOLxbkGVw7opSCv0nRqobb+d6ylAwa2GT/7TFoDxmlIW4UT82D7mCvYsHsKfohXw8x3
	 lJBmS3YDCafybqQOyvzCBTLiTpXZqP5wz28/964kvrAh3HSgBlwYLXxN293AK87cZi35P
	 JVKbdPSVE9e2OHCtibPqDbnW/0j7wh+iIUgrP16+aCt/AqExTHBtlSvJxMAQAS+NpVQ3n
	 A3JCrELZe5fRj2WSiIolTn6sdDZPK/dbIY+8rcmF9Qnk1qX+XQ57cTTPpXMCpUcXqVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608893;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=0e1yjZbepXddXT/u9h3RmUZRvnzCDv1FzVHoh0elk34=;
	b=PaFBZgdsdy17BYoOZK+eSsRF1B08af+1IfhwjyBQr2fboB/w41FtlzPSmOkmsozVgTR8
	 KNMvT7fvJox8599uHzkd5TIWiwENV6mnYLqREpWBVjkCfLTiPkK3cUBVIGEnsQO/wHoDb
	 RE4iNu6eiaWIgJeWKUnJ8o0SEC7DknHK0hcNy8NlY/NpuPl1U/bpTxlYUmdu9tIO9AwiP
	 zmJc4d0OCst2nAA5DQxLSL8NbwQxGB+sHN1/y+IxdX6f+cDGu02A3l/X1Inc8SVC9uiEO
	 Sb5bIVVgChwYQF0Q0YwsHqdgEG3yaQBu1K3//C2HotC9nCUwSwutspLQAZ9ZnLb229A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GPPrgGAc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9276606A883;
	Fri, 13 Nov 2026 22:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9276606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GPPrgGAc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfRk1rjOfiHQqgWOdS4+/QXCXMbk7+ROBuXUfZlbFdthM30I8B2UrdHdLdJZ2WCUCqHYG4aPVBF83VnG2ya9qABcQ9BuOiHplwZEoCFCucHQfsaelR330qd1SDct7a01PgGVJPROaXqCvBYMbSI5CWa7Y/JT+UPXETXvTJk4Wd+RupT9tGZJdqupXk2wuIeW/ZhbGYmS40T7CDJIvtN0uUUnUtUNDqvczPEDiFNdoRAlUygTJNudk8VuCyC9qYEjmNLHvp1JJT1h80CnkqP5gZb+bQAxzCMyE5/GeFyczaRRvDxhrFoa4Trp2PaktUCkGb9Ku8AcVgicIYsWzeScOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e1yjZbepXddXT/u9h3RmUZRvnzCDv1FzVHoh0elk34=;
 b=GOC6XUzoTr36j20Tn+ZZnPASJWKocxZgPlGCFm/be9+xhSdJKfjgH28q7mybSCfLSidbM/lRxAwAQHq93uO5FPkl/mcV02w9RFdY37sJ5PTmZJKzpQG32vb7TQn7m0qlDJK4HJVgH8dyYxAcMx4nEZpCF317VzASF+XHvH1rns1ImfhNr6O+7EV4ZcIVaGMTNAFw7nRzHLig+b8tFuemdywzr8JS6tgOvmMylqwvO2ZwOEKD6HRg+2oF5PCMavuMcyKunmgR111f1ZWsJS0RMPvR+1+h4CSWsX1tNJLLywgjlQHKzcx15JYHZLJ0Ypx8V68Zad7CTTuDF8ayjQvaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0e1yjZbepXddXT/u9h3RmUZRvnzCDv1FzVHoh0elk34=;
 b=GPPrgGAcRh+cvnF1w+GrP3eBCuPydXKQUVRnw7PsPF6ANkp08MUXJbEISrB0C7vfUHJPqwvSi176bWzuMG+YAAqTT3MIX7OChq0JLz8IjG+UbtC9h7KKWObteKuYgB7hPq+RQ0QdVb1Ln+TyyaJZ3hMaZfG3H80l2GnXXl2C2VwacbAxltVTG0xFOR9aXaJt3fdprWUdf1QHL0TxA9TiiYiZMc5W9DYrVC30npR9CPCCaDY5uzNHGNfidYiRdi8v7Wq6NvnDaov2AdX380ZsqXbGFR0OgkdFCoLCVQ1Usdt05bwFcTZk5UquzHPaUuE1if2b1M28clb/7dtCNrRVfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by PH7PR12MB5735.namprd12.prod.outlook.com (2603:10b6:510:1e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 22:28:06 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 22:28:06 +0000
From: David Cemin <dcemin@nvidia.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	xy-jackie@139.com,
	ikepanhc@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldemarchi@nvidia.com
Subject: [RFC PATCH 3/3] platform/x86: ideapad-laptop: do not bind the WMI event devices without the VPC
Date: Fri, 13 Nov 2026 14:27:55 -0800
Message-ID: <20261113222755.1696567-4-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113222755.1696567-1-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To CH0PR12MB5089.namprd12.prod.outlook.com
 (2603:10b6:610:bc::8)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|PH7PR12MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: e84f27ec-a6b9-495a-42ad-08df41d5634a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|22082099003|18002099003|6133799003|10067099003|261022105027099003|261021123027099003|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 Z/3qg7q6/4HfLkMoa4dPkMWX1A69oGBFhs9jBD8pFjOhbGxVcgvhUB8OJa2CNW8pwrcc7ca5fER3fuLUqZBia92nC19fRB+0IrGhf5FwhGMQl4huijKo+goNil3FRnhsfGgH9ZyT6NrahTU1zgs2bYngGg+KoGAEFl5HWxe0g2RWR5MH+fGPnaiH7SDgqCtEgUk2VcbvuHFafaoi8nqVpcDlsGqvyavOw34puxY2OwtQy3rYqsAZIY48vuNg3VxVoo+x55vP93Ghexv/OwoKnC3oMl07GgoW8AeZxV5E7hsczTYCKL/Z06UwEq0kqre/EGU5FLX+Ia2UT+c1/o/nasb2wIKdJDpmjJJ2I0P7NpgUzH3JX87IEyuaTAv/wKPGcF2lZLec4ni1pH7/IjvF55R+fMWSCm/8EWBZiyODv1XcG381QnDwyUG+yiGQGcHWFkwgosrBQyaIYFbDEgQNDfoFUQwI837DUlD3e6BgVx4WLxB2fBlL8MObZodU5XNdnN/PK8fH3Erc6oQiVzk5IYAI2+gnWa0f1kaXS74ZHWssMS8yX4YGdoEPolTeJy5Dsd0c801n0mZHbJ1NQYbBoMe8CsczIT4rTExvxySlqaQVwMCngA9kFtYsNWqwZsHwZ6XL8GYMy9j5SbC0D+j/DegKVg3HN9sPffk4Ns+H/WA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(10067099003)(261022105027099003)(261021123027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?IcVZIU7ZjbuTKvdNK58rN7Npd003VE1vfgGtd8xEN3QiWHQJQRDZf1da3J9E?=
 =?us-ascii?Q?5kZfJpvmvV+9BeACwsqNlQVh9jfk3yV/bzQC21tdcEuv/2uaz9mUnWN5EKmD?=
 =?us-ascii?Q?RgKLqwgDMuUN3Ty0eg8eNcBw4N0+0PMO3NQnIL6NKTwmw8CqW8k7P55D2/cB?=
 =?us-ascii?Q?StmjGEy7D0+1NBhhEyV/74fW0v4qEewxKUYhhcGnJwsQ1hvpqzhrKLkrLWY0?=
 =?us-ascii?Q?E/S29sj0OSmI195/OYh0FYUZneC83xzuvcOyTR2Gi3QfkAgecTE8F+DwHpng?=
 =?us-ascii?Q?yzU9YarCSR6zdnlqS6gfjZu08omEmk0XMQaZxrufhOwMhgxUmnV1QV8J82Ld?=
 =?us-ascii?Q?Xb/m0rhiRyxu7yVI2obOpOYw+4vMUVrZ2V/EDDfCHVRbV3PT9LxqvBIgbrl9?=
 =?us-ascii?Q?Z9zkGZ5bs0cJtP3TEw0Ab7gxTCA/Q+Ur7eKCEgoSoHOvoGMcShqxgfRIBsnM?=
 =?us-ascii?Q?YQUKF8MYKAsS0eS/uA9UQe0fB7ICG72kAZiLUEtzTpCeYk42eI0vcXRdv648?=
 =?us-ascii?Q?wbt+wXpXhGsyumXc//FKeFp+LIPtfIUTWJ/RvA2vbjWoqqDVFQ4DNFV4uXIn?=
 =?us-ascii?Q?BFl2PeksgaDS6ui894HFmZSdzD6VkQmD8PmSL+IjjzRzfAYlh07icwcIwf/u?=
 =?us-ascii?Q?4OLRcuFbW6m40lxZwF4njnI9Nexb0czdhaPWkehz3xEBJelDJPM0t7wl7+pJ?=
 =?us-ascii?Q?DojNCOFNY0ah9SeLBM7Q+dAReqvY8R0IqPQ+Guz5MrfwgtE2044P8VZ1VRzG?=
 =?us-ascii?Q?n924pt6geZkGhEPQ88TadH3Rw5lna2Q92v/+TEWAVmz6VBnf2OD0lBCn4jcl?=
 =?us-ascii?Q?x94IeXU4q/scF0K1+WZz3TpbY1nVEHqB1ISuVOV/8fxQKKK/ZlZ7zFQxcES+?=
 =?us-ascii?Q?MAvnoYxbVuCcgiMTa7HOZ+yW6IISZ+uiZ4Qs5usN3LTMzd0j6DZbX9aXxFq2?=
 =?us-ascii?Q?cwu4QlVUqybGR/klM3G5gq0l+ZHd7dVBgoAzV3Unb1hVNiMcpQ4jS29trYd8?=
 =?us-ascii?Q?Izuvo/VXWtP/w8Cw4Na7tjGh9mGt3Eni6+XqvwmzF0CvqRwg/dsbVUHdOauW?=
 =?us-ascii?Q?Lx8n5JW1eToRFN9XFZpdQ/Yfll3JHRyVZRN1R7FVHqa7mYM8/XwOGeGx/eeY?=
 =?us-ascii?Q?zdZl5uV3C//keBYVXqD+3mWVICsuwzXmfVLmFzE0I+ccVGMXsP5TfLUW4LgE?=
 =?us-ascii?Q?AYFPdgCRT8/9g3wat3w5Idlh6LVq3ut19cWd0uH0Hpp20nWTGKtZ8iVIYKDg?=
 =?us-ascii?Q?rhYqS1B1NJQ6yseAqeD0MhtCM3CFtX2jX9hJIxIHKeiK2zESvVDuz3SvU1ru?=
 =?us-ascii?Q?/MDhNR0TVijeqtfemaKLigC6iv7lk38cYmANi+4BoQ8/U0cxs08Lij+yORUl?=
 =?us-ascii?Q?rSAu+0CLqFMNJdjFlNVDNjFv5I3Sg85i732vPrr0Xu/7TujSYsZu5s04/NEA?=
 =?us-ascii?Q?zyWEiODCNESVcDGcx5E0tbpmj59K5MkTNCX58dRjBNYkqmUszrV0/r4CMTsY?=
 =?us-ascii?Q?6rgs/VPU31nrNCNKWhqItWMD7VGH6hLSHD1KdyR8FWW3qGWaQfgVk0omtQiY?=
 =?us-ascii?Q?8gfioMwhlS77iZNK3xezlo5yR7pzAl7KzJVV1S9YHBUBGAOibC5EEu084Ytk?=
 =?us-ascii?Q?dm2CBejeQAFDG/qCbVLC1rtc1klxHglK0UMvhX2IVgO99XA/hCYAk3cTnCbI?=
 =?us-ascii?Q?cOI+qcolEQAaWrBY9n2AgH5UhX6marC6/qVVn56hzqAOAzPMJMHr+jmEDo0R?=
 =?us-ascii?Q?4ml9cCwRmg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e84f27ec-a6b9-495a-42ad-08df41d5634a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:28:06.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2wZhx29yHqwU48aTpNKvM56OXFAi9ahH8yGZoartEbmEbNvvZEI9vTlX7s88uXFKQaYIKufdPfkuDrNdRB+Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5735
X-OriginatorOrg: Nvidia.com

ideapad-laptop binds the Fn key and Esc WMI event GUIDs unconditionally,
but ideapad_wmi_notify() only acts when the VPC platform driver has
probed and set ideapad_shared. On machines that expose the WMI GUIDs
without the IdeaPad VPC device (VPC2004) the driver claims the WMI
device and then drops every event.

Decline the WMI devices when there is no VPC2004, so the device stays
free for a consumer that can report the events, such as the Lenovo WMI
hotkeys driver.

Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 91a8d11c79c5..44ae248c5a4d 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -2278,6 +2278,14 @@ static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct ideapad_wmi_private *wpriv;
 
+	/*
+	 * The events are only delivered once the VPC platform driver is bound
+	 * (ideapad_shared).  Without the VPC device this driver can never
+	 * report them, so leave the WMI device to another consumer.
+	 */
+	if (!acpi_dev_found("VPC2004"))
+		return -ENODEV;
+
 	wpriv = devm_kzalloc_obj(&wdev->dev, *wpriv);
 	if (!wpriv)
 		return -ENOMEM;
-- 
2.56.1

