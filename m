Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475442;
	b=TwMFYEzpwou9dUYrdW2trPiFmBr3AYiatyATeATZONekA3EChz4ZnMC1Mpl0gfZXuEBE
	 iACFJFSs+vm5i7dAmkNFgwVpYU+chmfW+7f1TRJOfp8G+d7P2lpmF8iwh8klx/GLuDCQX
	 uIhkpsHY77euB822QfN2hh5mu0GWS9PcI4xnKejSAQoLXFpkj20Kn9DUCcbe5mgzf1fj3
	 5rmy+QRrx+YFylquNv21lEZSXLvGRowt4Ryh0DvJTeYSxn/pF2TdLO7JjzFK8A2CJlQZp
	 3p+Icp9JpTzKAJS//7HMg5J4wbEjCj1rUGJyYAEiCM59MGws6fwZlgNDJOMh6Ru+OmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475442;
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
	bh=+Bl58y1T4BtWG4tEZvgeQ+h57jS+cm3cGYdpA024vuo=;
	b=VRgnJI1kempYxfZsX+6jQ6PCdDYhD0VWIPWiqZCitbX/oH20Jjf9XgGlMGkm1e1GAj+e
	 E/1GMiDzYs+Hl2OION5o+RLt1WB7EyTLTsBzazY07SMSsPUeAlRP/hoCWwMNg8XMfWJI4
	 QM1OnYu1XeFOHG9rpPg4+voTYAq9qMKvOAx8xyp63TO9f+Mk2pObqhT150fO8sCRJ9AYu
	 4J3kEfVGAIeB8CdCs+2a42MIBAqQErYTFbFZDdrDMZ4O62yYs/QYVowg1sGSHReKK0ATA
	 5576FCxvUtJw1/RjgxKUB/Zb9+1pg2Tboj1eL3xaLDx/SVtiafyt5z3nc0fnmxM8zxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mL7DjYr9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EFF606A336;
	Mon, 23 Nov 2026 23:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61EFF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mL7DjYr9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vr9vXiLYnTrMiANOFGiTQ4bUS8/tjzuVFhu03IpX2JPf9xBaSylkiurUn0CbLquVSFwebFlIh7YMRgWl/glXJe3dgGMJEOGRcInamgCrM18ItzsIXrQF5PwxAUCneFs2JwE9rZQkkEfRjwsb2g/1+cfSdORV5Ya6Zx37+TnIGPJS30WXESwcBmbMP1jJ6dftchnY+ymA4gCJ1mhbkUMLsZF+bsrNSLG2RWM4aI44poAzrw1xGpaaW8+/Jmgx1FyyCpU6VN/g+25aIVYwLChkUWEqdNcG88W1KXCFxk5nkSY2kYebS6jJ4J19Bz6VXnfIMOidosx/FNZ9soBB5rF1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bl58y1T4BtWG4tEZvgeQ+h57jS+cm3cGYdpA024vuo=;
 b=Cz4rW9VDmu1vPJVuQq01sBFZ0OzyJmI//SXEp364jH+JbDqIMMY6CnQXRRko/wmmJ90IfadPnfrUp58qiP8U9EIs2Ngxv2O88HCzwjoK0NGGN3MUGz6JTqAGBfwFkCdrVxWeMB1fbMmQUahb6IsREuAOpjCdPq0Fg5MVsYDgya62k9rL/wVh4o4xFBMFgJiKA+2TEQ0pBmdz5/2kk3lSOFemRAR8QBZfbhGkA1mH0B/63oeNG57QCmUxygdbwIbr6gPOp8iMkrsPdpeOhG/HJGPL47mkLyIT7a5jE9D1MnLxEAlvK4Lr25dU8EfTa1gEvg2xdhJvD7YhT7zpIrwSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Bl58y1T4BtWG4tEZvgeQ+h57jS+cm3cGYdpA024vuo=;
 b=mL7DjYr9jBSu6wNV3xWwwQVb+ZRYxQGmj0DtSZpPt9K/vafA3OohLDzpxBd7Vo7WJz5jb1Goot7MNfg6sQKa1PviYkq//TnFBrmRKS441uF4AXgXvnPUk71fg38JLKkhsEJV/Aap1RV/ZTWGXlxs7mFPOfLOtuYD/vkSvKP4ePv5/NdmLLzbGWZfJGExjJxcDsxIEStWOgxpYXLzHyeJlW2jtWC/wk83u06TKUvPw+9JwR39LG8edzpNkp35x0rVtjuRy8Iu8RAAfMIq6BVRylxz5sKLgBjJGLyrWcMKMMTRXtbNkpdQ6yFWj48Gh19Y7FykE5vGrjRq3jh8lB/yVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:21 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:21 +0000
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
Subject: [PATCH v2 09/10] platform: dell: laptop: Don't load if SMBIOS calls are non-functional
Date: Mon, 23 Nov 2026 15:09:00 -0800
Message-ID: <20261123230905.13899-10-bmak@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1ee15417-c060-46e4-0a27-08df49b6f25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|5023799004|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261102123227099003|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LjmGnWV9QDaz4P74SQPM0vq64dECUMLdckMegbHufDa2Ivx3Eci2zqklFQPwMLqk5HCLudwiNkTWMa+SlnJlYq9HVbXgoo3SEaY/21gFKtbEvZnNvQg2/RFPo8BhSURIPmudoiXDPi72el747nrXGxZge1ohdtwVBAv/+HA1SksRz1YnbJq7v7qJCv2v95MsUv31VGeK84O3ZcrIH+VFvppb+joZjy4iOOdLwrKrPU8MfGYlBqmfu3SRlRrJ/PJqb1i9FRaQNpYWXwGWPRIwkmYtjUUjTQzkKEC96RIEGL5vqgBq4p2AvqjHcQ/LQSZlfY7W38CYygLumO5RoPTeGcVQMp2p3MA9UfBwv5BjtpXOEZeTPZLeI6iyndcRv2E+6kIk3kIMKHKt5qhnJpIVkSA8myeqBIQ/7D+mLhottcjqOkhqqRPj/c9Y882hK83kceKd1yxgGTDMgVuMfDLnbxF5Sngc7Q2eHdU6bla3DymeHN5Q80CtP8dsI2TfqUxOh10rM6PLl+2xeJ9F1NymkEvILGNMC353D+Xh3ZHKrA36LavdCG1zLo2mvvr0KSJj/HgDGRquH89EquTGj9NOaF7/3peGhkN1hzT45dT50WqtRltOPAPsjgWZ3GZER6VKf3KCQoK4tCWO6O2hLhHlIadLzypI76aF21SZDxVqGjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HNJlQtaAs59QLooQicPIJ7t/EWUom2Wrcr0npt9ESe7tPzC+2Xqy+BVMmvQ2?=
 =?us-ascii?Q?Vn+ChaN1yzDR0SssS3dZsX6Kev8QWzCVYZn0zc4YeVpn7tlVBiONwRNbH29X?=
 =?us-ascii?Q?eU9pLTa8i5AM9mu0n3XbIWyCNyU2F2Iuvfy2KVDxN2fPN6e4KN2Bzo1AIzXK?=
 =?us-ascii?Q?4BdmI84Gnt3He5mkB31ikygBntF19ZDtnsWGB8NjvYmMSWFuYb3A6ZZcPTGW?=
 =?us-ascii?Q?J+cWnqAWCzKE9sCnagXCntACYCdHo5ym6KpTTmswQkMFPyxcou9FPv0E5WNp?=
 =?us-ascii?Q?2Q1g4k54K1GhYR5b5pCBAJmTX834p3jD2fztUU48kRL5XaPViM5KZRqrET2V?=
 =?us-ascii?Q?+Sj9OHZDX2p+mAnyDexYY4I//GStEQDysoc2vkIHxUB5Nm0+qbkZOY2ZPMWG?=
 =?us-ascii?Q?8PdPRDfHFHP9yJtjTpb/uTMvo5Jekc3pOkyk63+zZhDMubzyoEr8oX6ecjjb?=
 =?us-ascii?Q?V5M5K3BZqwJNr843VG3hRfhGIJ15cGnF3sWCe03pfrUKx6r3JiEHwfVdJSs4?=
 =?us-ascii?Q?fBZZkykC8rNSMufbDJGgDmJMkcjzBdEGSVWbZllPiNSGVBvvS/4lHhBDbkUi?=
 =?us-ascii?Q?Fx3V2m/4FEuqKU7M6gB1GOe7MX8PO2eCdHhhk6X94FY4AUKA5/k7ZLstMmHL?=
 =?us-ascii?Q?zLF5gWDxz6Yi3huvOjZnyqjSejaAzqoyLtS2AQPFIFDTnW8P1UvmnXSaUpDp?=
 =?us-ascii?Q?nlpBGZkduLBloPcEb0y6JCu3sELMGLvsocbORFI9tTF09ga9I4qz5TVwHhxc?=
 =?us-ascii?Q?ImYTp58HikA5dBdZHK5UAtEFS91fq+5RtI4SY2gxi4VK/pzTWSyQxdNAUHnK?=
 =?us-ascii?Q?xqXXpH3gl2odiw3VUQ/otyVDqIEcL8iYHATPtLdGqFSuOB0UV5mgCRykDAUb?=
 =?us-ascii?Q?NZxOMmtNf9Sz+HhLfY4f7prQNkeZ1WJOpQJojtg7b713yGVLKJSDtsqBmzK5?=
 =?us-ascii?Q?YmVug80Rgk1NbLLc/Gx3j+j3Br+g4QF8nCWSd9mYMyKmYjJ5izsr8yfHX4Ef?=
 =?us-ascii?Q?Wj5/RaFVYVAZ6Iptghq/4iEaeV3tuRJz/WPGMzsATKX51K74epq7M0AjiYEJ?=
 =?us-ascii?Q?L95YRWtzJk8ABlHNhv9pWYXh3e6qsHSXgQTAx3WvdIDHMtl8oCRcvGkm3wRy?=
 =?us-ascii?Q?7NwSQhnaDmMQbeXv2SIyrey4sBzqFMqkTN+JiV/PNnlxOVpb/W4jzfBP6XaG?=
 =?us-ascii?Q?p6KZ8MTGGAZam+U1ENGPv92EBZ5MLEtmOt6HCLgsrFNTSu+vv3086K7fo2ci?=
 =?us-ascii?Q?20ZzJ6uYGvAGL3qfll9reMwWl61Ny/9YKOQ8baaCcR8JkJ23N/TZ0s3RO05b?=
 =?us-ascii?Q?XA74p3grwxn/qVzSsYRsVSOaREG7ykRpllTkMyAuwP4947Z13Yfn5lbv0zct?=
 =?us-ascii?Q?FYJ3HVvSW5U2K+ON0geWhqldnaFNIqUZpsRw9N8f4mFAC6kq9eY40EcdRAXX?=
 =?us-ascii?Q?81wyhpMtjtcQiAKUFAWTI3zQ8i5txaGG7sOlRcrrJ3oGfr9SNQSV8ayEEM1G?=
 =?us-ascii?Q?Rj065kuukEHyjOlY07Jre4pExjVUSD4pTC3NXQakCbQGZObpXTA8oocNuoV8?=
 =?us-ascii?Q?2/Y5UFDOJn22Owqt72REzWmoo59foW+1ALJM7UguED0YdFin3Q1BveQXu4Nl?=
 =?us-ascii?Q?voSwjFNZdqXdvf3q6IPhbkAFoVacITOmISjLfFuiSEGPdDiUco5DsX+9Ny56?=
 =?us-ascii?Q?0sz055HbT4YldJvyDXwZQshrtzLUMJgcJj7wuM/EEUyK3fEfOXt76cM6PAvS?=
 =?us-ascii?Q?Jn0eHsPaVQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee15417-c060-46e4-0a27-08df49b6f25d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:21.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHmgBS2C/VPuUFf7/YyCFEAHPOpuTQ175lPC0SQoE2HKNt1wRB7YY3QYJZikm9nu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

dell-laptop relies on the SMBIOS calling interface for all of its
functionality. On platforms where the interface returns all-zero
buffers, dell-laptop reports bogus battery charge modes and thresholds,
and registers mute and mic mute LEDs that do nothing.

Don't load dell-laptop on these platforms.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/dell-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/dell/dell-laptop.c b/drivers/platform/dell/dell-laptop.c
index 514449fa6e05..6eb1f96ba1da 100644
--- a/drivers/platform/dell/dell-laptop.c
+++ b/drivers/platform/dell/dell-laptop.c
@@ -2476,6 +2476,9 @@ static int __init dell_init(void)
 	if (!dmi_check_system(dell_device_table))
 		return -ENODEV;
 
+	if (!dell_smbios_calls_functional())
+		return -ENODEV;
+
 	quirks = NULL;
 	/* find if this machine support other functions */
 	dmi_check_system(dell_quirks);
-- 
2.53.0

