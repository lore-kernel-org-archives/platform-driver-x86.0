Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FAA4E66A3;
	Fri, 25 Sep 2026 19:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364772; cv=fail; b=DUOdrbxZ9hdS5qkKKV9HGd2FO/S9HUqDP1NtFRkrJ1dW+8+PQZxnndr+BoK6txucfNwiXtwYRIsSDVXQ+0GZLVgNYr2D5ugN7LlUE6IIROlBCMSi/dMT0NSgZ0fp8F4Y+AYLgPAnCbI6CdhGdtbk4spG1IqrkZ7FKOi5ZKHK88U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364772; c=relaxed/simple;
	bh=rhEuWyKGI/efxRQ7vYSRB8MZ9oMOjgyTPlX+XvtleoI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GYw44NY9ijk97pk2vkLXnvrvxx+VOxiiBGRTiPg12FIEuk+0coyvUAPk4MKxvEVivtWptreNYp2G0uU/Qr7wtsXyu5I6mxTb/C+fqjeJUWbbN2exjDUM5lo7fsUjO5yVamzUwPf0ZmUXAqFSS7fwxsNe6alFkls21BspNW0jb88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DhGx+e82; arc=fail smtp.client-ip=40.93.198.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DhGx+e82"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDmkODGOwLRtvUJnBfr2uTmSSlJA2gVat2NdgIpWtoKBpwtOG40a66nRNObFhJJk4KOE9jrpidLQSN2uYj8LZOMOPTUqG4zydC9zx5dKh3uyktUP8FDoThrqulwgNASymkaR3Qea/WEAtLm1iyU6bu6i4VdqQ++qjJT0XO+0CEmIVu+61GtBwsDJFxHcFd7kq0aBx9vU1Bj1xS3aORKktTlE+0b0HiFaZY2o0aGsq1ztaxT8I3ymsX9kakxEDUMTgBpungTT78VjEzwDmSNivGjPaCKyzEx72c3tIghbT0rwtV4ijJ/ILSyP4cFhCbgqdkgH9AMxfw1f+4e6eskvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcVXVw0pm8wghesnGa7ZY7oYZZ/OgLbO8S7HetVuiSM=;
 b=GGZG0rWKWLsP7dw/uDkD3fL4ULRmVgFyRoWNs7y0/T397ZhkP3S4H7qYS3l+I0Fz4catXcWzstayez1Bih3FvXCrs+aL1QYz7N8ZBaCDB1w7dwS8b09fw4vorbE1XMAI6jZKbzhOWvGEHuLSAOx1YNDBX1FU3nSqsu7seqhM7aH/x1mJJ/6uYNKD3g6v+ifJv4eTCi9tRaEkcxjHy3t5Pv4THcFDTczzqMXuLq3IsKGPVlzEotxewaDznkIFVE/Q1y8lrwkeHXl7m9QRES4IdCQv2NhWO4p8SBw/XE2hEfxE5IT1b2/a/DlAd1khAYiCIyYu+vluVzgltkQ9tJWqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcVXVw0pm8wghesnGa7ZY7oYZZ/OgLbO8S7HetVuiSM=;
 b=DhGx+e82F8lq1TxAFr1/aSte7fdRCEggmbiyn70+7eN74KhE16IUFXvrVIxKwNgujAVcfoJf7Hhu0N0375IQ6o5XVM0kIuOkDDpMll2mOye3Z2YgcdS6IX8SZvgznq7h+QMWuCaaI7ICLHuUBmdy3KvrysaVJ/8SMOBtKGotSniYhljoAAjx1VFVOoAQkgd5JEVG7XZocJiap5heP7mkf86T9+IS5vlpTVVmXISf3y0iZvuTrHl/TNrWrUgZXTaVXpNM3XdJQJpEH/xq6r5w8LIdhB/RFKXWWTgqaNgxTYeV3k1w0/0R4l3JhfKXrkxTfXExKBzvBoFAVi/aRic5Hg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:32:42 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 19:32:41 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org (open list)
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 0/2] platform/x86: dell-laptop: rework kbd_led_level_{get,set}()
Date: Fri, 25 Sep 2026 15:32:37 -0400
Message-ID: <20260925193239.248779-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DSSP220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:3d3::18) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a62ded-6d34-4877-2bc7-08df1b3bc424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|10067099003|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IwQVJsnNR1zBX6rCHyQ8THPVofd/WZw4CSINASIQjEzIOojn5x/aj3e0s5a6qtzPnbbH2Fz+5hTNk9tsiqXwOGNgEXbd3via0v5BznaMEXd6BmfPhBjj4xd2gCxcDYoVOmAxNGJXMxGxL4B/jIxpVJvpO+LjDym1yGJwQnFUZfrfDzUmRIa2mK6TnnP2gJLXS1HpauHsb++d90na3fKntW09Gz4RWihffsBlV0zQbMK+gOyBngQ4p81k/pzw+Wt9mmKNttBUAWsjQ5NqagbTdvW5RzdX2fpybAkYQCo8dnSNIgwZEvUtz21yDThyxYPWbTl8WH/ifwtH8cvnRGVaxpli99bPIovShl/RJ03JrAKdVsqFvNI//GwwDLVUmC3TzG2BqTLWPT5h/8RQ7blvUHypp8eduJ2xxviy1xNIq3qqbixoULeR3YwkWNXmYfOSVQIp3PHIogVVgeNAT78nHn7rTX0BmTZZnpQjvUMOj3qVKy3ocx49lJoaFRHrlIlyzEmSghIFJ6Gm9Sqrdt8sylrFZkuXyAXpXKwK0CJJaag1j+T8N35l7BD++LpdwM8V+8kMrnziTmXC6kuFEjONIFTJiFkib54Q5hIwiNvCuB7A7NPAHwoTki6NIY79uEHTkvqxc4ZP4fZu1uVCOIEIRgmgHLyPfBeEXi230RlIyo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?97MF2iApQj4UigLGBpHJVM/CVBgy5mDAx6t0ROXzJJczjkx5jJNQd78G4bQF?=
 =?us-ascii?Q?8MX3oHQB7C66AhtuLuOWSneQfKK4fsuwL8kZbOcTCxwYKx28LrYU07eHQxwq?=
 =?us-ascii?Q?ley27U1WeBcCPANa+13NpA9BgOmBNy8LBg0pUdoCJMuLv8/fK1+KHQXabN1A?=
 =?us-ascii?Q?8aYZGqPEHp8zsNG86FdrCIqpymiAoZQXtdEglyFr63X6DGZ+53Jwd6em4qCX?=
 =?us-ascii?Q?ainCrzzi9V6viHZxWecjJ3csQxHhWkyaZ7w7wevLvnsfXlAHH54Bpg/Q6N9F?=
 =?us-ascii?Q?v9s+PXbbVBo1UIpo1mzklUZnGIvf3BW1F21Li92+1aP+4Y+UUq/mhgX+Xh7+?=
 =?us-ascii?Q?yMhJsZ+KKAHAAdjjYZpznAOqfdqqte2yPhsZWgpmyQ8uMmcXgB110dledmd1?=
 =?us-ascii?Q?NZv06k9yOgRVd9WcLq53ZmTRUwnri2/t0Kt1PMNvxUo+KZtmj1j8r0jNnk6W?=
 =?us-ascii?Q?jALFNPHOru/SzCcwsXQMb7GsDUL6SJVZxHKQSzSAST9MorpdtOg/JHd84Aod?=
 =?us-ascii?Q?Hpyj6LzwWQCm5dfDml5nEJpgeb8XYIt/5pWl3jn9MonBIL4VkaHFLQSQPvuj?=
 =?us-ascii?Q?5wzMdr9VrCbdQiDRgkEu+7WhJgeYUAiHL247oQnLW97eAQbc3KRcKnWAGDwY?=
 =?us-ascii?Q?YSVq/jyxVJTRqLURMeXi5ayfpPhime6272Gg61R8c3hupm+plVFEK348BWab?=
 =?us-ascii?Q?KEQzrqt6xHAUmLc0pHcNdWYEtNeBNKSE/svB1pfREd7v0gy80vFddlZY5H84?=
 =?us-ascii?Q?rOpfjWJmnd56GkVF/CEZ+1Ugh7cTE1c0LzO4fQ5LLu+CS0nwCz8XU1sOWgK1?=
 =?us-ascii?Q?YdEFhJKcPLlXV3pOjTRMKcdb0nLD8YJHAI5p3oAhI+hTat1gTfispZtCCpaA?=
 =?us-ascii?Q?xPCXc2zpthZsHVwje6rk14Dwg07m6TwSwc3aXVWwYhdRRShAT3O8JNpJTf2g?=
 =?us-ascii?Q?0lcS0K6WYxRXZkcloWjnyuE9wjbaV9dV1Uh3uYbjIooNgEXKWg0G5quIXu6H?=
 =?us-ascii?Q?Ji8TbL2NyWo2cE8AgXbqtwLwwbllrDh2mkKposXYJnMMw1lAOULzqgmBmnXv?=
 =?us-ascii?Q?stJjnIHsXF6cuqaV2IgMB/Q/EQLtFrDzZxP1kWby33LUQZeIf8iUcubiPgeO?=
 =?us-ascii?Q?bztngspfuvPh7hpgEFneRoeJdkq3q52TslY5n4TL1LqLIPuNpjbo+MfubbcQ?=
 =?us-ascii?Q?uau2nCNArgCSynKSqm6g6bjOUukc0YExSX+84+n2OZ9qME83J6IW1yhCn21d?=
 =?us-ascii?Q?sDHgEWG+q0Fdpwn+yWTSuD4kK+D1oEHwMSKXC/62tG3OZZUc4GJZYfRzWwJE?=
 =?us-ascii?Q?sAkTqS2byclOv15Cm2fobwBkBI1Y1TYGxzAb8LVzPOawSbA3H6T59EIy3c3z?=
 =?us-ascii?Q?JlPShUNvtPblyiJcyikeYAGNVIoN6fNsXhL233h/Eb31/EsI/SUKJuHPInjn?=
 =?us-ascii?Q?FDijq/DzWpfkgro47YNPNOim/M0Q/4oX0ksKcng68PXtxEkoJt5MWKKOO2QE?=
 =?us-ascii?Q?Ofuqi6SlkA1bfCc+4gv0byOEuakXhr1Gu6YQFzob5SAEZns4pad9BJ7nmsTi?=
 =?us-ascii?Q?7JivrMCRtwBjXJELNx7WRWwc42lfj7L6Uo78j1EcE/n6IBZXqCjddqRsgdWE?=
 =?us-ascii?Q?gK3Yl0vLkh4M7z50cAZZpcRCCR7zV0sQUknw1qjjyhUv6HEXgvio3Wo+w5yV?=
 =?us-ascii?Q?UWmNxjrNTgubFrmr7+nxhjrr+5/h23fzn4/zOj1WAGD6Yr22?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a62ded-6d34-4877-2bc7-08df1b3bc424
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:32:41.9060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wwohnWIx9cvZhjLGBYBdVD/qLLYW01fSSWPQCJ2NlVrQr6x8FbQ6aYjotev9m4yCoJtRKe92MtNzl8OAwe+Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475

Simplify both functions by replacing open-coded loops and fix
brightness readback for sparse token masks.

Yury Norov (2):
  platform/x86: dell-laptop: Use fns() in kbd_led_level_set()
  platform/x86: dell-laptop: Fix token-based keyboard brightness
    readback

 drivers/platform/x86/dell/dell-laptop.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

-- 
2.53.0
