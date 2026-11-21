Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219700;
	b=OEHjT8+AMvBjJVu9yiJOo4GqGtDLPsXg4ocPScpMka3vBHphhTt2BtllsMgL/bfHg+/5
	 Bg+8X3ZCFUeLvzObelIbZfnlQbtJZ3HkGChh0GlMsJPUMGkzrxEjgZYqjXAIbMQRUGZh9
	 uQMuaDR4YZ/wobVvkErpEr/FgxdXboQfx2uMLzmhRe91Kf/UQCdGr6OTFXLZGKS8RAgkC
	 /CXGFZapAIfFi/1/sX/OlyVCpQsDoIGgJMnxEi1+yauIWOYsIT2T+GO5p5dqenpvmzwZA
	 PXPgDmX8sT2koZq/oGmF9fsZ23IcBQctViG8W6cyiIcWMcqdak8jMl2oOl5JWkpusbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219700;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WiOUOvhZPrMJh4uXtkQ5LR4MsewcSaAFq1hKJGHJrMY=;
	b=ss2OKXkn8Y0RjTEWYLLU8ZSQ2dsNneAh1D8W0Za1V+bEwj8pV6dQ+9JvTZxSnFSkkuAm
	 oT/EHFVQyxcMRhNgdhY+v01Es+jxqTvxYWgeR+wFtQPQ+TpWMMruVpumEfHUask7XQbPY
	 NKO2nJizhVujgDCanaAikh2Zq4Jb6InEzBflVtaWK8/FBwj4pj0miK1vVETHQ0X9f2Fzw
	 BdsFsis3mdXrVB6e46wZBjKkd9hZOogi8uePO/ZRoPN6f6DOxOe3X0Cht19smgpyHRcQ6
	 tljlJ58Us6JbbT3zHB9dmA5ekg6IYYuB7QTOEEFLX/ORAOGDL6uEmeEvgkX+2h23jMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z1Cui0Aq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE0606A6AF;
	Sat, 21 Nov 2026 00:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCE0606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z1Cui0Aq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPv6bU2MaaJKMe4O4bxQ3EiGO6zltbHPkrvJm6XsPpLZ5E5EMPkHQ0aSdeTrZcSbNjjQ4/wHsxaiRdgS5B8Ghl8nSh88esBGbr0txLiEP5TQNwTnHJBgjZRY2IkWvmOZ1x0jSRPAnYgUmtfhOtlI5JcZ+gT5B4zf0FOW1qsBBDUcr0vlAcSozQDOwhne9OSxca2Xo52V//vBSlKNbXR5rDWj/lunf6soAUP4GdT7qEueIFnHUl8vHufAPOJDrqpmnYr5GF3EmRHwgQ0j5JiBy2pUXYT7VLdkxWFpi9TFP1UJVz35kRoTz2K8YrvckjD9J4LSTX9B+JGsN6ao1s+wzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiOUOvhZPrMJh4uXtkQ5LR4MsewcSaAFq1hKJGHJrMY=;
 b=Prxr4WZk0Op7ynK/KQ7MnA3/tGhlL5c027HOqONRNEmo7MU+0xaAEWjD37O0fbi1QWYnMdIsu6heBghzVXKVFstY46NePha8IyXZGUOJHfHnjVGfa3JzAK1KV7cSrfqOS2NJ4rYd/tUPD8MXvs8nvhthqSTdW3thlHqXeOlRoOPc9Q7VBwYBRvA29Hpj7TxjR7VRQGmQQigsdUn+mBUqRJ/ne2DNtPxQQVo/Mf2NGpMq4yMbPvZnwutkFSBl8gzIKsC0HexYJAxGV9MzScm1rFIa3BZDc9lg87RZrNXNtFmNzCRrQo6G+7YXt9i2R0VRVIT98Xjdopl990ihFUqJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiOUOvhZPrMJh4uXtkQ5LR4MsewcSaAFq1hKJGHJrMY=;
 b=Z1Cui0AquTiFBLqukmkCYRt/H9jzOnh09JQPvSNe/2CZf22jOzFUymA5mKIpbUFNlyvTY7NJr8d6NXlZI9mnCiwIQ3WLdsnvF6mCELNyAmZsrQZqONZyP76qjDpvHZesy0B0p4fCm6k+0B+8gzRvN1wkFIaTEYjlJ2VGlUpvZ4z2leL2+COQRzAlCR3yPEWhTvVFlohLv24bM4o1Yqc7jBNE1KmSSgNP9uvfmzSHS1ESXF5jcyEA12tNTJKPWad9hsebYuauM/LhFkAobqcU9izXVFI/Yz8D3eaA6k8QsGCUwZ4r8pbo6aVyKQL2N5kah9IkfxukGZ3NcwNBT6WVEw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:08:03 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:08:03 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH 8/8] platform: dell: pc: Don't load if SMBIOS calls are non-functional
Date: Fri, 20 Nov 2026 16:05:54 -0800
Message-ID: <20261121000556.173028-9-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121000556.173028-1-bmak@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: b755b4a1-9a1a-483a-157f-08df476382f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|22082099003|261009223027099003|261021121427099003|11063799006|56012099006|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261026121527099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	nLG28RxnFNQeV3zhFFpAMb3PMwKFjEsr7/ipzsH4VqNnFqkMlHaVyer05Ni9PKovNGc4X+bmEo77I4cDElm7VnrbPLyyAVgkACJz6MU6iV67lCkae/LyE5vh/q/ymRmJ0kBmfxFcDOFp41/DCOc0Rt5oPlCy8F/Wc3lqeFLnq5Lh57K702RL0at8sRgvus7pflfDniCaCaraWf+yWS8JsG8haDhUiXTDh3ngkDCF6XhyjIFHZC/NN79hoscK5Z8VTm8jmZtJGejbXHv0MvMpqpdM58d3ysiy7I4U61hsqp072BSH5g+IV2C7e32mH6swrYxYFB3sNecODQfNMq5/+CQ7YFIlOhOO2X17yedkUYPzEyf0ZhflU6GriLXMIQ9XfjfDLLjG+27dMn5PVQCFaC/XrWRFoIgk6tXilsxFt/J0cU9TcgsXEKi+Mq5N7CSS9FoVb+936W15rSOWJGazKTYVfuLaDpbe4zJjUL4w5PhFHeqLMhKmDPi3tBjbSk/mKCQgaxRDjRDJRwaTEuO1Ld+o2cy/1jDwjHbPXtH68rMRtByieDBvd8o4tNF8EOSyhbH+2f8MDRxMk7UBwezXn7+ZyNEEs8uruIovoNJbbAVfN3WuJCzGUCcDHgB12G3a55Ygb9HMg9tbp+t8J5wpVxMWot4BZLhfpvm17jZgnrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261026121527099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rehjNX6Y5hBcksrheN8mwwUdRc3l6enMCNyvYa2DIAoTVi2aZn1Um0cXtff8?=
 =?us-ascii?Q?2khnj7anyLbZMu93fX/qd1H5mWR1dAYfJSv1zWV8YoCfcXkuxNRj53s53CP5?=
 =?us-ascii?Q?zeuuPSOLACygRfV6B3oQJ5UCU4/nc6cFtoWtjZJD54i0is4dG564O0usLqKi?=
 =?us-ascii?Q?Ez6KWoKMQKplWH3SjwRT/qXcXoJoiy0OVgK/LQdSZR7NSWOnNpIqbIKrh0gS?=
 =?us-ascii?Q?BUM1NU2CxnfY6lKF7Hhemne1Ogi31DmbMI/Rb55ERy0IBV9lZs4Aqvih2QUy?=
 =?us-ascii?Q?fhJOCYev+SOxKxjTDl137oLVHUIIKRk7uMqx0tzXGoHec5QVjkvCM5kOmU5T?=
 =?us-ascii?Q?r5tl+lS1VY2ox8Sj9qGllxVvI1wGRMTs8ZCJs8xRJbjf/ShLW9Kom3Z8uBtM?=
 =?us-ascii?Q?dT8edeBCzcYNooZ6lN8oKYRmzK1V+46fq0JjJsdF1eywUJ88VpaKkKemxeri?=
 =?us-ascii?Q?FqCmZvYE2JrZ3J5AP95F+WgysvD9c/hAL2T37CWb+G/2q3snDVIrUMVe8z4V?=
 =?us-ascii?Q?unQh/iLIWwR7dETeaHeHA/x/dLXvAQPmFzjdrmrGIMvbjhSn/sh+mig2aqsz?=
 =?us-ascii?Q?qEd93KBTah54bOnNpMaj8jSMt5DhEgm+qmYca8Py/qgxyTy4hOHMLeV9F6FG?=
 =?us-ascii?Q?7/DWJCYjqahZq5XwtyvSazfZnFs9Qdl5ymJqb8jvj4sIsJhokdAob8NDqiTE?=
 =?us-ascii?Q?7NM584BfJfBc+R+wZKK+9NGvjzb8kIzkeZNvhlxl5v87WdctDH7WjnpY8GoP?=
 =?us-ascii?Q?NNGuhMMo6unf6pBk9vpZlootsVj4dHyoRykWHqBmrM4LaQvUysoREFgXRl+q?=
 =?us-ascii?Q?bJ+smy+Xm0maiD1EZSdL/e2a+8mrUkkEDToHTsn+/fzD+VvVoGXdGK69OqkG?=
 =?us-ascii?Q?vNaukAb0FejkmVlIE6ydXuDSim8CIuZzKlHtX47TbzYKmxk6aBKfz6SZxJbP?=
 =?us-ascii?Q?1DxHJWqK08hhdj6/B8sXw0UzwHxcxXbEp647bR5/45qoeWmSpKxI/f+eOCLj?=
 =?us-ascii?Q?ajJbcAR0WS4BciXtkRWyS2IK68pn0/6xBYgFlNp+IPohTsqlbwbWLYNDUrl+?=
 =?us-ascii?Q?8p3DF3lNpHsvIlsIov03fo348NnMP/wX1wiMANZ5ta1l4/9KO5osxMT/YmME?=
 =?us-ascii?Q?YJWwDjhs+7o/VSghvClt0spJ2bwq2BkrW1v0/Gw4g2jnU+JQA+6EfCltvsuN?=
 =?us-ascii?Q?EcwiDg/9JZ9ZSXEQfGlAtlmo04lhytWfxlEfkRPyGlCPxiCF8gyx/UWgmM2f?=
 =?us-ascii?Q?UyDVFsC1vtblw5Pv20T+CCoV9/HCfERJOTokUAgmDoKritGfo26l9mcOiv4x?=
 =?us-ascii?Q?QZdBXuPM32LtrBxvX5zR78jcHNNzP0ZWUERn4x4tvZJSkOvFTSnFeEM7fKns?=
 =?us-ascii?Q?CHS5n7r0Q8mVDdU2bY7wXqU8y8GteKWM+1YRImhkSqxdwwTzQps3hSEW4hra?=
 =?us-ascii?Q?yAKx38k0YTfWqMfu2XfVAT0Mbl4+pExK7EsXUmuc3+WkFn5Xji3pVyWvZHmZ?=
 =?us-ascii?Q?pAZc0fssdO0xFtEO4bUsMoxutlDfiQ9Iepldm5ifl/ooRJj1GE5YNzSF+S9D?=
 =?us-ascii?Q?ZROwKhzwRuW5oRDmiq7et53ReOnMKAFMNaK1AXraDI55UOwF/ih9c8mVZ7ir?=
 =?us-ascii?Q?iZKi2puu8HqPyMByvLy5+pXTVk3ymBWr/boMlIJ0VmhzMaRQ900Q0qfDQFQJ?=
 =?us-ascii?Q?a1Nvh9drlbFOv2vg0OXUveeHTSxQKBt/9etoP/1jb4ugaF8wgPyfZ7i/SapT?=
 =?us-ascii?Q?sJFJOXq4PA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b755b4a1-9a1a-483a-157f-08df476382f0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:08:03.5101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7kcLeZcsdb04a7AZSO6gV0Njk2C8bj43qjxW59wUAQ8DHJZP//57lbgXMyXgjsl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

dell-pc relies on the SMBIOS calling interface for thermal modes. On
platforms where the interface returns all-zero buffers, dell-pc reads
no current thermal mode, and fails with "platform_profile probe failed".

Don't load dell-pc on these platforms.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/dell-pc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/dell/dell-pc.c b/drivers/platform/dell/dell-pc.c
index becdd9aaef29..4f361ec01b29 100644
--- a/drivers/platform/dell/dell-pc.c
+++ b/drivers/platform/dell/dell-pc.c
@@ -282,6 +282,9 @@ static int __init dell_init(void)
 	if (!dmi_check_system(dell_device_table))
 		return -ENODEV;
 
+	if (!dell_smbios_calls_functional())
+		return -ENODEV;
+
 	dell_pc_fdev = faux_device_create("dell-pc", NULL, &dell_pc_faux_ops);
 	if (!dell_pc_fdev)
 		return -ENODEV;
-- 
2.53.0

