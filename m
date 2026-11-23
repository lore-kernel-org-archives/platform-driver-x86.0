Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475415;
	b=nDwJiZlVAtp88fF4TO9ipJBRUAVU0vmIb8jUmJbOuTL6/+H/uuOi6t4ZKeEti7Pv+jVP
	 uaLEQXyCgGHun5w7aLr7Uyzx9KU3bnu70FFOcAVL6sidk9SnV6LyyEhFmSzpJl5SW6buo
	 GLd4Rf11hl/1+Mk6sBN6xvVJhcJf30NoCrzKxKcRxH3p9vrbT1HyLIBDG0vBLjXXCZKiX
	 PPtPUKYPekxweKOuUkGs7xmCi+S4a8DN6JZO1eiur6p1H9RrnF7dDgYK06+09+GogJL6L
	 6CddPugzqvOIXVk6/YqqIK8GCR6QeezZ+U1x9EoP0lG3XGl4kBoY3kUHgX2GeXnMWaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475415;
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
	bh=dkp6Yq//WtL3IogC1tk9G6PQFIOPTLem/H4bMz3nTcg=;
	b=SoiKAFcFDJS+hOUiN27aMvyoF8NK4SfsjrRy0Iua/PIHLIfObGsAnEohvXo5C8bIrFBO
	 +ypvJ56MtoqeRzglGY5aPHdeJf+H5Tls4+hpv+ItRRR9VSpk/2HKPZpOoy1onwMXcCYFR
	 7j4bnverH4/wonKylmYRJQySqWEd3hxw4Pe3eod59GdMtjCMlpxGPYFpNXYoepa8Ss0oa
	 qpb4Px+4pzWO5OpZaxx6Yn758oX8QJS2amiWoqKZSrEMORy6nVIXw5l/dV3OpMNl9zawG
	 KhOmKfDLUfBZ5/Dqw7vzHQ3Jr8prdKusAaV2wtNOoSMv+N/IPEIFouAhpX0RAlm6cBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I1PtQ2VG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.34
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012034.outbound.protection.outlook.com [40.107.209.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3621A606A6A4;
	Mon, 23 Nov 2026 23:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3621A606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I1PtQ2VG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy/egXsUpSW02jlUe6T5v5XV3H75Z2tIlwMemK85H9E6MrJa/aLDys7Jn3WQEBhN/MZujLOu6PONtFOBARLr+KfB/bYUrafdQGKediEsdFetudn8hpcs9OGzWtNMNhwOrJKvCgJEbeqvrfrAsfWzC++TTS8tUaNFlDVk1hv0o1+1ircKTKJ8hJJFdaH4htpfzBVNN85No1YCcbCh+Qgtg89VxByylTGxmVEzFrYekUqqR9g8r+bYILALUbwDQ9M1AIAtzH+SisiQGIg3PNZD32dLRskyqn/cLl0cNVDBU/mm6jfbLVzExda/hBOaz52K0sotk1gHBUPB/naRg9pTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkp6Yq//WtL3IogC1tk9G6PQFIOPTLem/H4bMz3nTcg=;
 b=DTeA9+GpOKxWo1uN+eUIjWbjaJzZ7JO8HPliFpMAMVqmQjDc5jJMUDWSgkv9OXmPy7lSuLMDplW69NY3Q6pFkwk1xJ07sM++Qu9Er2v9rnb8lSM9sErF760GGByFI2mRFJw/ibqc3nY7fh0nFc6ueRVL6c/dXTgYVkaZ7Yw+/W1yHzDcm7Kk85LjK/UARWpQJKlDf61C7P1UYrwuAukZHryXc3QFFG10S9jM0R6fG1ccDxwdzk2pn1wpOjaeGuPnMjqHm3WmZb0ogYck4+D6nARD2eRjfsrpoVeohcOa/D5btkxajCikhPq939FcsyGSJh2I7JCzwE+i4pdK5mAC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkp6Yq//WtL3IogC1tk9G6PQFIOPTLem/H4bMz3nTcg=;
 b=I1PtQ2VGtb+QKy7dzT6q9/jCEpBoTaIsl7UOIVNqbRtGH+N9Pg50ie/eYaPNQyqKJcDQcb3LXqzLC5mIggk3qgvyy3YecBG0blT8CrHPY3DnS6QTRzGLPXRlIN5JpYgc51ctqNa5QSt6oItZjLDsV7iVBNpKiDMiHG9JaSWaxv4t4SHmUi1adpS9mX/8xLQW6Hb6CPIbqtgxDwyiU/RSVrKqhJM2OS1PldBrKgGdRekD/fInvI+rrHsgLTJcNm4vHEnaX/4hCyhizKL32duu2NJqt/CWturzYEah8NqjFhJSkOx++dpSQHibbRR29PlSU87fBn3uNd68ptCYM5MoFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:03 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:03 +0000
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
	Brian Mak <bmak@nvidia.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 02/10] platform/x86: dell: dcdbas: Add missing kernel-doc descriptions
Date: Mon, 23 Nov 2026 15:08:53 -0800
Message-ID: <20261123230905.13899-3-bmak@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: e6eb20b2-eb22-4b7a-7caf-08df49b6e7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|261102130727099003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B4CiQ6GBBsS2SrhqJhNcXGG7OCb4uQWVdEhff9yofwfFEpE0sVpIrrv3xlpeHNk7cjQvWUSSwG3TrFN9MTcfA6pDpOCaAqxFySupnKmGfe256dacNyBS4ICG3tDj4a+E4209zJ5Wr6oe8Z16Z641214U+YpZGnYwp/HmTaJOLRPPKHotNZ2bsmjv91Ka4nd20T0iBYw/G7wcm3Bxze8YSVMW77Eab1z0lqfbWZgkXeAjfj6kmlZw2QNqYLcaj6g0GygJwRI9X39TEPXJzsu+Vwy9dvUvXZGIcODhhI6EtPdWjdM/VrzcJVew0npXgRAT0nLgT+WL5lTDzx4pqiRsDfp2BywOCNpMcrqd0Ecj37aEhTuTk9wOljCrGtvOqjJjcrfuk1mHBA2UQfR2hb09MXyYaF119LbGSmSFqW4xMQUpkSxKD9SmOPYSFFE2+yzO4ssDoFPzX3h5pEDYZgHytTJaSjiIqE2vxfu42VAT9nJGhOG19s6cmQ2/I0m7KIr9DPDiD2YUrDnk/I8+KzU0NB9fLTLsZZPZjyCXOSX3aSx83szVFQfFAHWaDLXWcjQkFMyOKNdPimccfQXu1LW29BF3vXiucUWG+FbhXFBtOzJTjbASfqvPFbEXJ4QV8NAj/IkMmAls8Js6etVa5Um/KedxaMT7JCbdp5N+Rd8qcUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(261102130727099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yle8se4envEWXpfJ90lTkA0UfDVe6+UZJ1I8XfwnqMrcBQMno8xc0RRamS9H?=
 =?us-ascii?Q?JWVAnsZGTeVtKnlKSZ2D/ZYqZh07UQHfa882+MMDJsbPJekZZPTsZOnFSJfH?=
 =?us-ascii?Q?tpxY/CJwcqGE7+h5vbB3SKbaOBvS5AvS45zVIUybu+CpJ2ckt39S33n6fUUK?=
 =?us-ascii?Q?feJBDZZLDrM8T9p6mvMN/hsh5GNVuv+XgVeSmRmTCVuKRsBc5iNfburncV2k?=
 =?us-ascii?Q?97DYnxcO+te0APKlP5ou1cI830aoGIJOYKO68chTw+4AhrMlw+TB+ob6vAL8?=
 =?us-ascii?Q?Wz4IFAEr/pP/9YS7yvAdLqY1aFKE2QE3jvi1or5F+c8y8cChKBAOyzCC3W2q?=
 =?us-ascii?Q?GPm4CtiX3fc8oPT+FuvNI25u89EPasjzu6HT819BqGbuSdx8wV2QsBkHL6Hb?=
 =?us-ascii?Q?ukUYKo31xKEjU9crouGzjTCEjR9xEIO4PnPPFDDPgBsCg0vo1oJXPkXD4yP0?=
 =?us-ascii?Q?c2zpJMtk9s6m5FzJ3soyqoDHSblX1pSOOIEWeFk4cW5K9NWF3uewtkmvs8p6?=
 =?us-ascii?Q?kdCqhembKeEltcXk02nC8k9k/869Y0F+esNN+0IAZpQ9hvT8xoQCXo/kwK6g?=
 =?us-ascii?Q?CwA0jhvFYQ+PXAAG2n4laHaYU11pqbeVgGmKMKdfn+jUjt80LOY30SvllHVI?=
 =?us-ascii?Q?u9HjwjV6zjhtRzK5bcKsb/8vpT/HDN1VfwZ7vZT9BlBTg85Q524FNk1btisQ?=
 =?us-ascii?Q?DeV2wPIEUZ/DWYf32+qnekCOvudtRAaqy+ddFM6uJo8fnkBibqzsfBX8jsDj?=
 =?us-ascii?Q?V2mDxO7wwhLm5KagaDIVromNev6PiHN/v4eat+RjBgo5YWbSjdiDdnjwvgpw?=
 =?us-ascii?Q?EBpjA9SfrZD/96HVuz2f+X0cy/DHhqJqi4IFcaMAbJqs30Lu02b+tdCY9JkS?=
 =?us-ascii?Q?O18XqSAY88ZLGpHDbMvqzZAdCF6URLJOnm4+NnW90EGBvYQxSkxryoyrOE+R?=
 =?us-ascii?Q?VB5m7kXOXnX4Q9fnQ2VAqxNsmkrzDmNG2hcIVXi2hKclWmR0nbZjFPKUvpL3?=
 =?us-ascii?Q?Sk76oJ8pgbH8nxdyGZfmSkmcLgu7pM2dZf43wCQnGwsJwl5kpfUOnwv/mKe/?=
 =?us-ascii?Q?cA6d5tYb4IuudjYhEPKwFTN0gMZbDlJmkT7QWuPTER1zK4VZMQHoTfciQoV+?=
 =?us-ascii?Q?hesLvHfCYxuy4XZcajKqQMHzXe+2A7qxka3SAt0DfIRGaFs6rx6PDoWCXfZL?=
 =?us-ascii?Q?cwpswtKDHtYNZZBSSY2GiplFq9jVbLm9s/hUMVhO3uDtHk0iw8nS/mnKEWfl?=
 =?us-ascii?Q?Daad/0qSbcLKUXMBCt9VvQCCodni/2s61PF3RoU+Og6dBSZAeQ5f9xSwJUrn?=
 =?us-ascii?Q?7fZcWwkSpsuUcSeZ+jXTA+0CgwDEhhp5kqx3qGxDozzviFpTJJ4Izc3jwsK5?=
 =?us-ascii?Q?6IOKuaoXkVwW4e+K9ZsP5qWtUgK6fskVxop6PkOzGjFErtEyYE37jESbKD+t?=
 =?us-ascii?Q?fJxA8xZD6Ui/aHMEAipB3Gzm4OtdY8aFpSPxWWmv2iBYpCOpEgBooYx9y3rp?=
 =?us-ascii?Q?iw/sCNDNAywX8hKuUnVMNgquBIePgVPt8SfF9NJM81mDhf5gRBhDe3WPaYio?=
 =?us-ascii?Q?DAicfFjCqpcDLGwsixFcJos5r/OYWGUe1OxUhoBRmKgKOdPyyVYOnKIJ/zZi?=
 =?us-ascii?Q?GBSwmSupHzEr7fATp2CS2Xgr+DikcCkLw0q4qTkik2vZgjwl1wITt0xADhqt?=
 =?us-ascii?Q?MRb5afcJl8AoTyM8tUZYJ06YKNAR/32BlRKLhqbIJXFscjUCS+uoNirmxNw4?=
 =?us-ascii?Q?2vmebd9ibQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6eb20b2-eb22-4b7a-7caf-08df49b6e7b9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:03.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMOidBUtrYZFqhdQM6kRF07zxrNjgnKaNb2mcSu2/vk9J3ndJR7bZymdeCco2FDQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

Several kernel-doc comments in dcdbas are missing descriptions for
their function parameters, which causes kernel-doc warnings in W=1
builds:

  function parameter 'size' not described in 'smi_data_buf_realloc'
  function parameter 'smi_cmd' not described in 'dcdbas_smi_request'
  function parameter 'dev' not described in 'smi_request_store'
  ...
  function parameter 'nb' not described in 'dcdbas_reboot_notify'

Add the missing parameter descriptions and a short description for
smi_request_store(), which had none.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611211817.BLHa92e0-lkp@intel.com/
Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/x86/dell/dcdbas.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 678f44252a45..62bff0aaba11 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -99,6 +99,7 @@ static void smi_data_buf_free(void)
 
 /**
  * smi_data_buf_realloc: grow SMI data buffer if needed
+ * @size: minimum required buffer size in bytes
  */
 static int smi_data_buf_realloc(unsigned long size)
 {
@@ -278,6 +279,7 @@ static int raise_smi(void *par)
 }
 /**
  * dcdbas_smi_request: generate SMI request
+ * @smi_cmd: SMI command to issue
  *
  * Called with smi_data_lock.
  */
@@ -301,7 +303,11 @@ int dcdbas_smi_request(struct smi_cmd *smi_cmd)
 EXPORT_SYMBOL(dcdbas_smi_request);
 
 /**
- * smi_request_store:
+ * smi_request_store: handle a write to the smi_request sysfs attribute
+ * @dev: device the attribute belongs to
+ * @attr: device attribute being written
+ * @buf: value written by userspace
+ * @count: number of bytes in @buf
  *
  * The valid values are:
  * 0: zero SMI data buffer
@@ -610,6 +616,9 @@ static int dcdbas_check_wsmt(void)
 
 /**
  * dcdbas_reboot_notify: handle reboot notification for host control
+ * @nb: notifier block
+ * @code: reboot event (SYS_DOWN, SYS_HALT or SYS_POWER_OFF)
+ * @unused: unused
  */
 static int dcdbas_reboot_notify(struct notifier_block *nb, unsigned long code,
 				void *unused)
-- 
2.53.0

