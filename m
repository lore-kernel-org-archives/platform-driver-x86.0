Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010035.outbound.protection.outlook.com [52.103.10.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7686F3749F0;
	Sun, 20 Sep 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789901907; cv=fail; b=Ac44bmFW4guDYBKv6jv16wUXUJeG3xyED1TRnyKsFF5EtZLh9vUFJ5AwNsgGkJaaODDbHssy/U6ljatrc0fRG3UIRcKxO3JDv4yrEDtpiKcFgjbqTa8uNsXL2/czJzhZQeQURYBKUj5rs79KufqToLmVBlQgi+Iz0yaDA6QGJe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789901907; c=relaxed/simple;
	bh=arI3AUyjm6hN/oxZwQZc3hj77nak9OqlfTBbiAaxIQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jn0yG7T+4UylOsESrGCUrwPmAVZjCg1RKMwuw2cMYyWOaztsRfDd5qsrDxI60eKTbKyFrZakEGCSk/lwI3uVR/PUIZMYwExIFEw2Afc+TnRJByZJaMT7hrvwhNi+xblODWKsBN3eUCbIOsJCAUoX20kkKhuYPPj75SOfv1O3Wxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=eqGoGfDc; arc=fail smtp.client-ip=52.103.10.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="eqGoGfDc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vp5ZUmZNxAMJY11NkCDohoOYe022fBU+JqYrT6eaVtNzVuXyQhrjyEq0fXN2+H+n5s3KxNEd3IPXLPK68EHMrEillFEDX030tocCSc0WFmw1XG61zRkd+RhIgeqa8WQVIpVs46TbhwS6ZOM88IZtD7EsqeHUUWbaWBP2y1BCQc6ERRa2fO/62DiUAoIdiehbuJDKiyohx7p6MBcC1l5hr0+QBJBSiAzva8P9lupegfmZnbxCBGSFAOGLw2ZJ/UEkpVMgU+EBGLQRzpE8ovgZXDwgw9fLn37F5KrVFBbE0mnIOw9kXos+5uCEhXQhX3wdKQ3Uht/4ATebhMp3anU2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arI3AUyjm6hN/oxZwQZc3hj77nak9OqlfTBbiAaxIQ0=;
 b=uNkFwj+2ta9RQLxVu1sxFZJsqCaWMkqvoEKfdH4D0PWmrLoI0gnO3G1NN932YCWQeMlwdDt6ddxD9hxIb6ZBjudOLyWYebMr/WO7AizaB158fW0MQAFql+nr3a9fFdm84L+NTYqFn6sLVE5wtsquw2IvPTMLIV+uI5Fo7/6Vs4coW4CbUyqhJeHlyHy2y2wz274H7iz8c+9E6aDbBZU8ZnyObcOLe1/oRpXVX/SdrRVvf23gSS1sy/RCdxuJFvQOEY4mecpgU51CF2XinDAGB1jPVKDpFA6E4LZIV9TpA1gvrRBhkJU8zbRR7egTTYACzZiz57va56PP3RLJ8vuSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arI3AUyjm6hN/oxZwQZc3hj77nak9OqlfTBbiAaxIQ0=;
 b=eqGoGfDcJYtxEQS+4CL01RFe8t/tyakzm03CAXf4dMpxOcHdQubnKlUt79ANnG0Ceh+6H/boPPmamTbCT7QMnMTW6qVnySNBRiJ3wk8o2UalUcJXRMRC66mKbYT8K7ny6euHfKhHkX1qAyXSSX+7u003Gey8hKSYJ/5Ly3STfyvvuqJmEu2kl8Am/qE8f3Eph1J98gZ7Kq9mkSLlt0V5cc9iN4dzHkulQG6PLIPbaVGAeD4yiDxdLafJvCORzkY12sRdHPWdZjPgzsHeY+P4ni9OgCrqn59qPuBdkGEevVkNv5iZe3bAX+sI35UNk3b0/ML+2hHUY1+eW7RTKZyq8Q==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by PH0PR19MB997337.namprd19.prod.outlook.com (2603:10b6:510:3b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 10:58:24 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 10:58:24 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: huangwei@kylinos.cn
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	marco_giunta@outlook.it,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Sun, 20 Sep 2026 12:58:14 +0200
Message-ID:
 <SN6PR19MB23034E1EECFAD1E64657AA21FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920102902.989025-1-huangwei@kylinos.cn>
References: <20260920102902.989025-1-huangwei@kylinos.cn>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B82.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::415) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260920105814.6740-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|PH0PR19MB997337:EE_
X-MS-Office365-Filtering-Correlation-Id: b463a3fb-6293-4eb1-a407-08df17061745
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|15080799012|5072599009|25010399006|51005399006|19110799012|8060799015|24021099003|55001999006|3412199025|440099028|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fFJa/RsPFBR4xApd7hEgxyUD7vzNa1laeYYZlli0+Xi0+rish9OJM0ZS7ZZe?=
 =?us-ascii?Q?w23WVZddzJCYPvnNMLQH3TPiOq4hkjzF27ZMmKeisIDwC4bbwr/fv1iQ++I6?=
 =?us-ascii?Q?150yc1tEsusYWV07kB8QAR+pjoXQNCFn6sIIkvZLnuZn6oOSny9gAukduQ+u?=
 =?us-ascii?Q?o7JUjYDUVQsBPQrYoXgUaG2XBrMfSCCp+cF/YmP5C3iw+Lu2KrU1U1Vft/+5?=
 =?us-ascii?Q?QGFycvdOY2JNskSGzIEhq5t6MJMdadM28Wg2YdWqAEfyS3PsgqgQZgm7zETi?=
 =?us-ascii?Q?GQ6wXRda93O9xEFnPCbbd+/33hzjx0U2E6XZS+u6GAgvgmVHN/zsbYHCQzxT?=
 =?us-ascii?Q?bhknR2qRHMaqtvj4iqEmf2ulmZpbyyD4+xxAd8Wv6ivt7T9NPXpbLXpA7STj?=
 =?us-ascii?Q?oVkHynDBZ4SQhktim/6IXvy2lJZUqnOPcOtHXuPwogVewWZobXILMpL3j4Ir?=
 =?us-ascii?Q?iyS419lPl7RJuf1vFwozDRvBj5X7mkfjo3nEj7p9ajaN8AcMuIQ/4PhpljZn?=
 =?us-ascii?Q?96ZNhQ4sm8dHzzLDVdER+ARHC01ko4yc6zY2rJd/R4zzsUGvOLmQo+vHfURz?=
 =?us-ascii?Q?VpiDCwGeAa6nX+NtKePDkJWVbHEAU+yQefCapf2uWyN3U5jciGoE1JZNn30S?=
 =?us-ascii?Q?LiSE2nP0iXBA/SLGlRbpnQ8i9U3/89LpsIyF/jnuMLnssCFkyCub8rQJtjNR?=
 =?us-ascii?Q?PXEp/Zkzla4B6sllEK+80W6DC1NK1CtJ9YP2MU4IUqCjUcmVvDLrj3ePmn63?=
 =?us-ascii?Q?KslSU/vYV0oJ0/B5J1OwSQbm3mv8QN8/8WEOZjKo6kXAmB+Knb3H072TPj0T?=
 =?us-ascii?Q?R3lZYSYIxtVKzt4zGDPv2CfcWumkLtzQhxnwoM2ROOhMtVJeSjlmw0O/5DYp?=
 =?us-ascii?Q?+yeCBtTb7HwzrLKWa7NenYL2wLtRMcxje/A0eaNs8FZ9KNYPrZ2O84OUyQ2q?=
 =?us-ascii?Q?00JtT8Ed5mFVLSxBv91FtusiLq8X0GidsFLgp1y162WUmn0b7zcSV7kA9M6A?=
 =?us-ascii?Q?hawQ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jqGkpl9Xq7IcqTO/A+zbIJoC2pweMstzKwkbA1IFeFW2vHpHx9DQFYs1bsoR?=
 =?us-ascii?Q?YBfFP5CZm3cEktMVjxJ5d3+qBFSrsyHP8xGekPoSu/4ITjlAUvhx3TJlgJi9?=
 =?us-ascii?Q?J4MG+UZLVbZhRo0QG5y7wJlT8zPy8KOMVOwm3VGGuUvaz2sKQOmxmVlPSXuZ?=
 =?us-ascii?Q?ZhYzw2/FwSaLMAWv0qsHYYsDbkedaIgYtuAgQqpYBe6dqstK/Km30AsgqDHj?=
 =?us-ascii?Q?P/nb5riHEazCEXIbPlP/YYb43tqPD0H3LNZmmrhhZIQFm5tiJkKXVsmVslFV?=
 =?us-ascii?Q?DWNQnn5yuvMSMGOWTEmW+LEIhZ71d/0DpQv1D1w2PovKoQwv5OPZYk0hyUCR?=
 =?us-ascii?Q?SMldq/ksnZ2LeJx7NRD/sDkNtRW8CPRvLyeOcFDQyWXP0qmgxlhzfgrtW7FQ?=
 =?us-ascii?Q?0VxnGj8OWx8O2EuuaWOd1EyJdx9g2fTvgUzlsjX+2+XJHqPdpii+tKYjhi32?=
 =?us-ascii?Q?Q4tEcLe0OAKki4VEOYgj5x25d/3vXnB/7ecdpdBS4AFlOGQygKzv/usljYuK?=
 =?us-ascii?Q?vLj5bdiDuJ8TYH0KwNM7rpGGodCf7Yk+AmJRSAPg01P/TZyt6mZmf2jOT51U?=
 =?us-ascii?Q?t1DbzPG9GVFAsgUc3/Bsil0Fdj2DSf/V1QOQonJWHMAwXB/031ZvgYLsOisO?=
 =?us-ascii?Q?eR+bCaMHmZkpc0lcNjttQlTFAoBgmgatuqurEVs3T2OkrCtWhIWiMMWKNu0G?=
 =?us-ascii?Q?TRnLk//XYV3IBpAY3Tgx8SixAJRpi2E5f5Xm+LTk+XHdqaCcEvT2a3nyuw9Z?=
 =?us-ascii?Q?3+6KY2tEwf096lHjIVCk0WpFOykm8AXdKuGYOQ5RNfxEJWmZEw6vJpe0pR/J?=
 =?us-ascii?Q?KvSFmwoQ8yRT/GKu9KzCEp6sAofZkEpjqmIoiNMik4qgZMzzGQA9s+XcMtVR?=
 =?us-ascii?Q?KOL264zd3nOfa2E+EdYAi8/+TC6TWZamxMnJbQjQb64Z8Vp9cjEbWtuw4zvy?=
 =?us-ascii?Q?rO7bdRTiUBSogREbrlIMEc6EktnCocHvIIIsaf2aJq5bKJYqkBvJG4oSmpfj?=
 =?us-ascii?Q?rSPomZXhIg8XCe4MjrVlSyshQYHpsLvsOujhy1hhZsloplj0sKDXIpcUG5zW?=
 =?us-ascii?Q?0jEO/Y+QyXwWIPTvgu3DMANromkBNEHe5QYWSW6TpP1NuPBfhgZ95DTkz0Mk?=
 =?us-ascii?Q?Xl9q2XW1aPTO8OcTm7B6TKJFg+Lz/vm1nzvLsKUhzcntSUzj+9fsLHgg7/ZM?=
 =?us-ascii?Q?7gWioD6DNsObRhjTM2QfZ8//08hXd8rcRNZOB5hxXJZGQt1Ut9wlm3WYt16q?=
 =?us-ascii?Q?H1hMaF6KQoy9BgUYU75X7tEjskBh/pE6GF7YmIv0+d1uYL3z0F35q+Voxa/D?=
 =?us-ascii?Q?gLaCzi3nrmbNCbYEehWoms5c1+EPgLgJiAAc3iXivqvqsX2K99AL02cyvbe6?=
 =?us-ascii?Q?kWjkM+278kliTjICeJlyGE1rN73g?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b463a3fb-6293-4eb1-a407-08df17061745
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 10:58:24.2956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB997337

Hi Huang,

Thanks, that settles both points. I will add
lockdep_assert_held(&ideapad_shared_mutex) with a short comment at the top
of ideapad_camera_switch_report(), and replace dew_warn() with
dev_warn_once().
I'll send a v2 either later today or within the next few days.

Marco
