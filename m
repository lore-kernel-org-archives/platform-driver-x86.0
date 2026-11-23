Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475449;
	b=k36MDEq5546i6ciPA997B2YuVhb0m2ltQJdCMpsRce7Pl699hLWI9Ux2tNWP36rgH3Nt
	 KqzszgDxcf4gqL94PlXy0wvC48ptKUJtTjqoH6zN7QlYWr3jGk+H+JtBfzVgiepY/Kvf+
	 SfwwQh67QkHf7P3PdQQBBJJLgKYp1/ch+eRKcItbdgV+l/9bozcYDL0wy6NcTL9+3BWL5
	 kW6zN2bck9j6RHiU04xRi2Tkma3ugUoYYM82FZxCKUh7uXAEnwWaltcz5/CyLeq2QryxR
	 CX1KIwc0pC9XsKLbuFIe1vFKKeqUygJki3JaEgUhDwfA8i7GdF29adXrOEc3dj7snQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475449;
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
	b=3dFfte0iicM+6pdSNE2iZ0lJsEB07lAXD7p88KWex02op7AY8hT/l5eZlBBXM9omH9Ab
	 F+kBxS9wijApEiDCKgG7p9HbW4zU0FplkUWAM9Ps6g65kepSmOOoLpfQAOTNT5+B0yZ3u
	 C+4ileAqro/Z9jkvWFASunnBYXg86iF1SRTB3hMxH5uWWoyjEK6cbqETWCQZajy4j50TN
	 Avn7MV7077HmcqFMO0c9ED36zRWunAoFyLIBa6b33uh1NM8UTeFoO0K0WRpqL9iimIO3Z
	 2+hKqgAekm3fGRPSSnLsUajipekBdVA8k19KdDqt5HSnXGn5HDEtX4+el7w/FV2fSAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UsafodbE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B8606A6AF;
	Mon, 23 Nov 2026 23:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 330B8606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UsafodbE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiogS6hgnCkygmZqDlc9xRfIYHXExHVocdwaWEY4pC/F2JiKymzrvpT1RFhA9/V/STlHVoJ3EAyJ8FKmyIPnFdb9/to6jC8UQgfz29LoFbHflLGXOQ3Fd4JERzR8GO/I5w+MtqV4oBwHRJ+Qs9aIqqCsAmWEa2iKlJ3P0iGiIv/H24CMWJCv+aMUAmB25JA1RbWQQsu9Db4tk0haWm7tWfEaPBW6xpBP+DwrVSJ9SwFhsI+7ZwZCT1muNCcxHKvkkU4YfTgPdTZNQ4hmNIrlll/bjENEzfSj/kDGtHubrsBHaOrJwb5DbhOF0aY581wDd6OOqSMfGZTWSpiC8w1Eng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiOUOvhZPrMJh4uXtkQ5LR4MsewcSaAFq1hKJGHJrMY=;
 b=oimGNx2IQtdiA+1/sUo3UOsu8h/9FTZ7K+c/r+B4IlEzKO2R2gv5MpsNPKJNAMezBU+evn21j+uHOv8oC+PXbl0fhslGlztiVu3lFq4Dc1yR5y1UoUytYeP8hfaKl+P8y5WQ89qn0oybTQtT8kL644IUsXNvyR3FtzplizvxZReTqJRP20OfXAS5IWZbZSvF2IOhV4XmM8ikW8C0yO6LWxRwSdcWhn0bwj5t3PDrgYVqixnfYSVCTWwnvQHu8MGNf1ja1DX6qxNJzZF/b+jviygoYmIf0MQPmuYujYewdaf0V2GQLiJe/9S/XChRQLyGvBUEVcw+QezhBi/J/4+7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiOUOvhZPrMJh4uXtkQ5LR4MsewcSaAFq1hKJGHJrMY=;
 b=UsafodbEcwgK9cthQ1Dji6H6CmlfFmNvgjG1VYhOqiJrUYRQIlYPhNCCLSskHRay3/ovoAAhm+MxYjI/J3zC5GcX9IRlcY2uijkJPd5SI5hnhpAqAYq70QRl8HggWx+Jo4iRLszcyMYY3v4V+GQ9/c1u7GAoPAUgcaKLEugSwEl7etZClCBiVrNwVSPqyEUA3e7rowfjKioYJjMoPVNygoRz6fms8EPcKzFvOip8M1Wuis0YAim0TBV0iPr+hJ3O6OBusqTItHgJYcSD16yAoDJ8xcQExDOmZEGBIPj3zVYhNM3DbFJ3PmgjjPQCTtcPp6RPEaLMq33S+7j+bVf3kQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:23 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:23 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: David Cemin <dcemin@nvidia.com>,
	Lucas De Marchi <ldemarchi@nvidia.com>,
	Kurt Borja <kuurtb@gmail.com>,
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
Subject: [PATCH v2 10/10] platform: dell: pc: Don't load if SMBIOS calls are non-functional
Date: Mon, 23 Nov 2026 15:09:01 -0800
Message-ID: <20261123230905.13899-11-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123230905.13899-1-bmak@nvidia.com>
References: <20261123230905.13899-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR12MB5786.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 321203ef-0e54-4185-3ee9-08df49b6f3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qzf/I1Ua82xrOP0BOWATJzP5WIk7cgYMT9JAK2cyiq/LieSK3lqNhhn6GCXLB5JwWXI/lvfcGUPbF3otIfDuLDLXKBC3u+pjQSm37S7kNugArbH7Wz6AkD9BdCaKuHre+x4CEpnenhjkECfLGni62OoEr0OIraFAuip+jJvoazp5EfKZRzNZPk26Xf1N3nPfp7C+os3e7ZXOhW4dAmmVzZRqGhgAZGBDlntBP77qMdsbEMQERIauKX/F6CQVx2JjeyUORAE1AFB9KDbKJxGI3M+8Rrv6GBd3+p1UeYM+sNuVXQIV1EWO8yqheWZ2r4+740n6KPLrbBpA2HkGn6BxitmDirdowOCIQNNc5UuqGG4qvShz/8DhvYhKfQAtxTX8BZx3H7ozGC7ZkYii06EyzlKPZjTgGplyWOEaxkKs9P1pbqTkOz0DSlM7Z3x2JXbVT7F7zpsO7TvuqfktsD0yLC8xikupAGLQlHSE6H/nCmZj25pxljQDQt1p27qTfs+45YqEmz2X6O3fULD0q3rDCcVdX0BUR2j4t2HY2myOKA7jQ5hNrZqePFwjOBLd023Y1tcOUQMhzqr9YrXs85I+hfIw1gc6K8cDdGASuw/4rEYWxXHEVU3JSrqfFT9BmQJfbC3ORW3K05ArjseVJl+efxUUKo7RRl8XyjNvhFtc3mY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+TWa3n4SSRQm6JPo7jGMoP4U9ocUK0MGqm7S/dz3QSW9lIdiV0o/zjdK18L?=
 =?us-ascii?Q?XLCxS6N43bzLLMKYx0sztzOizYN0liQTxf0WFvptLInFX9dSMoLOuS5FYtH3?=
 =?us-ascii?Q?frguHqWiyIZJhACziCGTA1YETv9QGxdhVyhsSdpiWjcHl9VuhLMPYNGavPll?=
 =?us-ascii?Q?uFLvgC2vdYz5fVYRR9ybTM5PIW1KcLS/OF8ZuDeajP2J0+NlqJme7vR6NwZT?=
 =?us-ascii?Q?NjaQzQ/+C1WucwR4ghJX+omSnP8YTSl7a4GdNbWCbvIgCdVtE6ub9jxRl6ta?=
 =?us-ascii?Q?3cAUvD8Ank6PDuujyoUE5EzemNLWN41Jg4zx1ley/fziXkUePDMaCnm0mPs/?=
 =?us-ascii?Q?IcFAq8ihOteW1wuT/fS+x4xT8zF5PuEDQEp6rRks2AOJT9OUKll6Aqp8WVh2?=
 =?us-ascii?Q?E2VxJKtq/1BF4umkTSLxo1zo4OBRtcPqA68s0Br4WOVuUB1Z+i/y+lg4KQkk?=
 =?us-ascii?Q?HSEanNGTV0WZxQ9J6RJ2MZbP/LmTool24T5duNY+IhP8c7WWUoQku0UJN3YH?=
 =?us-ascii?Q?OZDDK+hozlh8ZdWNuHJ5s7F2N1QVlUOeAYDe8khipFcratxk3MXzjMyVsMVx?=
 =?us-ascii?Q?SsajiASHfzZNjmFpo+9/n4s4dy62ANZRDLJeyRO4AOtjvoKDUE7jtcmNs2gI?=
 =?us-ascii?Q?qFJ9u81yvmKbATBNXvtVp0VhUVaeKQDsd1coACBlyhb/Ap9EH6E17Oj6zEh1?=
 =?us-ascii?Q?8xaP5HYOocbUiJXFh+nm4/J2Emjjvq0IxaoAA+SaNIn7mEpz+3ivmH+FmwTt?=
 =?us-ascii?Q?QNBSqaKf9pbEYfGMXIdjM2Kf6Wtgn0eYbOOuqMCkSQTqaUJdDPR+0KeE7Y39?=
 =?us-ascii?Q?wuSswwnj8sZcE0Djca1ubS1RDcEA14Lp9/DfaZ8lasjRr6DuTX6TfGa7L/SF?=
 =?us-ascii?Q?MZPS4vIvco13JWvhaJpys3wNVZKud0JT2niZrRNh/r5kGIeStlbKI+UXX6/3?=
 =?us-ascii?Q?vJvFbgmJvt9C1Ulpn3jmDzTwjRL7b4QPxw6qQLb3fATMRwY5DrJmcwo9NbQW?=
 =?us-ascii?Q?xxAM2xM/+mmhut7XF4CQN1SJSEbi+qB/2RWrzCyE2xiXQeQ2UHhYAftDxG+f?=
 =?us-ascii?Q?OUDzaCrUsE8gPWc77N42FHInoiX51M5nNnArSSJVuQEjRIOStFHeXH5aA02w?=
 =?us-ascii?Q?5fDL3GKN5e2R8qloT4aId4ishBS8PbjgjJdTclUJBXRuUkbAiNIZh5epxRSl?=
 =?us-ascii?Q?0tmMLgo1q/6KannG4sQ5qHBEekZtilpgF7qP9SuO6JJ/Ve/QTLuwrZ+g55Dd?=
 =?us-ascii?Q?5PzWXGJ4AkQvfuZvKMimw8qZgM8XiXH2b88Rf9dednKLx35Wyrg645jHvtRy?=
 =?us-ascii?Q?aiy8R+/X/MwqYGG2HwdkxTzqjEnvq08NIymRd+r8tDgJiRjx10RUy1PTzwdm?=
 =?us-ascii?Q?xvY2KNraL29j+PBM/+/sBp4f/oCWi6lelhc7Xx2BhZ+jfYWOYYLz7teeb9Ei?=
 =?us-ascii?Q?IGmsBAz3tUBVMYpVfs/huQrEUEfyEHzKMvAOeAE9xh2qi79P7rxsgwC3b6sd?=
 =?us-ascii?Q?ME/SKAlTDYTnhhVinlvRk4TruTPdYE25KF8r5JUPGwyz98h3dSIPIcXh+nN7?=
 =?us-ascii?Q?bzBs/RXg8aUVUBF3TtPgp+0rb0L3tL03vqY11rxcJ0SH4oFvDk9Vb81YM5kY?=
 =?us-ascii?Q?rUYAmHHA0u07X2DWwGCGTxEkbZwKGW/HK/KrD0MD6A5+dR5sbWG+PA9zyml6?=
 =?us-ascii?Q?0EN3tCGcGA7BMdaE8HrG2UYFRRlp4qVq6LE9BbnciQTF62TFL6a6OVIqGn+k?=
 =?us-ascii?Q?FFqTWUjI9A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321203ef-0e54-4185-3ee9-08df49b6f3f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:23.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GwD7NBdb4Vjt+7BIjXAQC+tO9YmYZGXBTJCdli7yz2bV829LBQ330Q53g4uzqlF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

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

