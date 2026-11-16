Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826648;
	b=bVY4uyb8d6XeSa7t2ZjaeoveR46//YfUVl3ANI2p/YjEbFITceT1lg1hDOi/pcFuK/vE
	 bnNHDKJIh5pK+/YrKodynzCP2cWzfc4jlcKrRgNGDDoQrI3eKvHXwWOwrfTBr5N1IBgJg
	 ks6Z7dH7TZBqi1FCAxIEW0w5OnuuXtKlB3deobNuMMpSbZhApv+svKkpke7WkmKEPqHdJ
	 QRqAbsXqmR5HYRw9jVmzLIr8WsD3MXcggRO9Tje8Jx+JETZpGShxiULrXxW1yGQqJ+i15
	 Ei0GY7oPj/6P4AT3C4/3ktxbDAXpIeCpMNt8ufAimsasG2k2X5PD1IIxzhtENQEFBWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826648;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ahTOireK/FdUZtDB90hrAjrnqeNY37nteRU+zm26wE0=;
	b=P0ij9fLQrCQnS6IU0+Dt/jFrp5WXiemLcw8Fi26oGSBf7U7g6ByfjDKEdI9s3qulvb0c
	 oQV4vJk0nd6jTPVJBhtaA1NsYZmI4zfC5PmhBYs8nhsMr8I+iCRsgKi+7AWoaqLj5dcuV
	 H9C7SMZmL0MaLwcFSiv/HkEV/KNwH5tQLaEranl0LQg6e9h70Bq+BzcdjAb3RrZWc6Q6X
	 i99hctQYJKr50Up+syFHnp2piv45mQXLwx6MBFv8GNThwlnopeQCDTI3CoDrFrm5Krkxq
	 L7zg2q2k/VhRCnfFiudqmsOWSbFkV0UhWO1ufJ3EX7pc9HWPRi+RW2yhTN3584c0tKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=e4AQsB+T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.26
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010026.outbound.protection.outlook.com [52.103.23.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50A606A31C;
	Mon, 16 Nov 2026 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D50A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=e4AQsB+T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZaAKSfq3TyqzT1PcD1/Rjkn27hN0mj6wii3x82ecnt3qQ1ebcqgjgOAQi6MBW4WTk8bLDZnokZW624HqHCPgKALOYk5CDazUsfkiiYS9VypheW08tmdyzEABf64a5SQh6OveIR639VOjGgrwcy6Ibrprbxr0jU4n1D2sWawU7kc9CFyIGgho4r7pAB/cMjzGHPuhn5TRbEvFSU7f79hkxhSiQSsGd/s2hroNNizKfG2NM0ECQfGfdzK2VpDIttldIrQyKUj4fc8PBPYcfxc+9B1PQi5KtgrNmzPC2fKYJVd7SM3VezfDhisEMOtTRnp4vIdgA2KjY8GLZrKWAGETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahTOireK/FdUZtDB90hrAjrnqeNY37nteRU+zm26wE0=;
 b=NFIOkCyOWpVEIEKETAelbv6KtsIL4O26ak/sSXB5jL6WyyMUbaWPWCxdfjvns/w/YgqRQajAYhkN+GefcJVGG7ok0kolnVdu4us0TDDFRXWfgbkq4rhYQLsWz3fsRzn+Sd27ISGdpD7UbeQNEomwcf8wYeOjuulaekReYlKoydez3XoFgj1xLMCIh8D5rlaE0H3LnX63YzUgm3JZwoKHiEWk2O/jUr9dOiGz8yXLOVMX8MhjdhcB9uDsTUL/xsCIQUqeLBkfCu7Hi5vd285ATVTBsQlcaBnSuk1kOMc7bF6tMZlfVH9Xa6Tfejh6KTY8DJhvEfGAKg4886ZkYP/0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahTOireK/FdUZtDB90hrAjrnqeNY37nteRU+zm26wE0=;
 b=e4AQsB+T0+CQgMuYlcjeni9GB8c888abcS++Uq4bjpNqze4cv64qkYtlDqNgsjUU8HHTgfRldsm/hxDMCnV9CSeM6/Z0Bkam++Uziifk0ncnupMtxYEZhud89b7iKh2CTQiLiCsyTCDkcfcWsEkeFUvmyWyCt6ytiEbwf4xylIJyFa/5RSr5VZgHlZQj2jxD3molriWGacNMnwtvZ8r3xvvL7vxx8+qwteJvmruHvYWoPCOHF/e94zmBqJeCZVk1o7kB+Tjh+Zp6PtIWM3HbISbHHi/BJGEqbs6re2xUjujoBaaa7Fq0QTaHz/aBWsgpXLbBOE85exAngxZE9Ze27A==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by DS2PR19MB250943.namprd19.prod.outlook.com (2603:10b6:8:3c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:55:26 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 10:55:26 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: dcemin@nvidia.com
Cc: W_Armin@gmx.de,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ikepanhc@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	ldemarchi@nvidia.com,
	linux-kernel@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	xy-jackie@139.com,
	marco_giunta@outlook.it
Subject: Re: [RFC PATCH 2/3] platform: lenovo: add WMI hotkeys driver
Date: Mon, 16 Nov 2026 11:55:15 +0100
Message-ID:
 <SN6PR19MB2303B70584719BA5686E383AFC7C2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113222755.1696567-3-dcemin@nvidia.com>
References: <20261113222755.1696567-3-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0393.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::18) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261116105515.12732-1-marco_giunta@outlook.it>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|DS2PR19MB250943:EE_
X-MS-Office365-Filtering-Correlation-Id: 8346273b-ffc7-43d7-e563-08df43d01e66
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|260925184616899003|4140399003|19110799012|23021999003|15080799012|25010399006|24021099003|5072599009|55001999006|52005399003|40105399003|440099028|3412199025|19061999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RX6zcEY46icMPBTd+S5ViaVFtTw+iCSH+OkzD8S1p2cDl6wCICSSQuglII2F?=
 =?us-ascii?Q?OTk9KLYbytRvcjBFlJw2+q8lL8AcFHqDEOLkLBb3hDujpjZu2BaT15gDSwRy?=
 =?us-ascii?Q?ajRKnEvvQfjPkunUcA5Z/87kzySd481graIeE9MQ5WEZ/XBPMs45z4MT0UwX?=
 =?us-ascii?Q?pHUhIj0S3xK0+zsGMCWf+uNxUpRIee9Otdz288f/OB9W2ED8RbSK5aSFdF/x?=
 =?us-ascii?Q?tiOpVkuwxFSMP39Brc2ohW6jV6XWg+rm1e9ThlXw4PN6gb2yeqnWZQWrdOsS?=
 =?us-ascii?Q?R3+xTzmsb5sHTBsM/dG8IGpPXprzu7xrcdc2rJFiNZEFQ3ipJajrYbt2t51T?=
 =?us-ascii?Q?p1O5RtT4zlAXk+m8li1Ow1Bv1Dic9p/CMZlrp23HraVJkJAY8NYnSqrx0HTs?=
 =?us-ascii?Q?OCdJNEc7X5xnihdq3MvtHP7sCpR/4aKRlz9jGUiyZIf4OjMbYg1QugyOpUPC?=
 =?us-ascii?Q?MJVdg6RLBOhEgMhRxyIqt12kEx52Piqh8NxCXtJuItFYCqVPah710ATgpwC1?=
 =?us-ascii?Q?XJejUHVZIVSomohLNpof7dS8xo9Shi/upu3wyNC7EgH8Cxt6I8BtLM+BMoWD?=
 =?us-ascii?Q?IgGNpix+hxcGP/XgNxPnu/AxtQKxncMKgh9KuE9abVmg+2Dw4sRjFSVgzhxR?=
 =?us-ascii?Q?WBPgWCtxHpUbzXmxzncSoDDlZQxG318+rdNi3h4nc3PUxvDcNdZOEmDNQVz/?=
 =?us-ascii?Q?OB5Mn0AseuaHXwWI1M9P83o0LARkrqumZoiorSGXQpV7MlStAdTWnl8sKs/U?=
 =?us-ascii?Q?59DQzs8iCwbk3DR9UsQFBIBrgq3GUW62eiw7NfeXQpIetuIV0+mj5EhwFdtO?=
 =?us-ascii?Q?VssOOsIheMLsVgBBYbTvBJtouP3fjri7q+ckLIE7hZ1WdrG4Ig8gFRjGkozK?=
 =?us-ascii?Q?OZ6sG3822qw9ktuozIF9H78LwSzbmTI7HUK2lkUBspqI5kpjyVNKRbDMfoEk?=
 =?us-ascii?Q?Scc1NIZk2HZughSN8C3a+bTUkFTNIUsujl8LuceEvDBENx1lb72KndQ1CUU+?=
 =?us-ascii?Q?Y3/dKAdean9Vvq3HGyxkGNY7WA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XTfgLSPUfLAJfMlTLG+Wmd4zIPI8EaRi2p/UWEcfGM9DeS+EYbOwD0T7yAsM?=
 =?us-ascii?Q?yZQZx5+LT0eyBXSBDUw9x2IC8D5HJXW/lQSEO1YqsE+DKUVgausrSDIw1PQR?=
 =?us-ascii?Q?mG3QtlCCsCloEm2LzsCTqqT0qcMWBXBC0IUw7Pvdx+ScSmUG5Uy11YANgibE?=
 =?us-ascii?Q?wGGgPgtxOtDoocouxzJvH497Ch3WnqLTBo7yAfWtTm513AKjVYA6gc+vjw/I?=
 =?us-ascii?Q?z73ImAZ5lrCmJwsNs7E02XNGLpZ6YBytYxqzfXVce319qIBCNJotwyaar8RO?=
 =?us-ascii?Q?suLlRt0HorxuCPMVv4MfmxneXdYZdCPGjWNGZfyvTD9+HlQnJb7/SkrT0PNQ?=
 =?us-ascii?Q?RoooUK1XkVy4O+KClldg78p3u2II7P3VExvp1zwQRpsZIgVprLSQt/Wxhg97?=
 =?us-ascii?Q?Zvig0QETZe09Qg8fWcIMDq0SJLjCohAOsTUUT7skIiqMh1PlCO+T0mgdYXfb?=
 =?us-ascii?Q?vrRMGSp7MQbbUccw6Picn6z2SoPMym5Tx2lPWfLoPacLRjFV9tPLMen8zHrM?=
 =?us-ascii?Q?t6gzOWeZERrFeyVAP49D+YOM2UA2gN9XYt+cqTMdmGwdiwcXz6iDgO8MlAK6?=
 =?us-ascii?Q?9fiyNwMEULPcSEz/B/vmptvHAS2NJYbmsSdaoN3wtZJ+8/aN6W6vricfqiGU?=
 =?us-ascii?Q?nDzJO53kw2pd9HdERM/X6vpygrgmeTCW+49Ji4EmiJB+3ntPoPiI466/aM0i?=
 =?us-ascii?Q?trhHUUjS5ncVK8D+yn7cWnQJ4jONIe/DbR0LTKJtzdwvyQyOuMZsbIIt/End?=
 =?us-ascii?Q?FtJLfJw+3eNv4zc1H0orXknPQsMCN7IrVReTn3fYzCV1ZOQ4LZSz3SfMJHS4?=
 =?us-ascii?Q?cRtwjHUt70JcSveDH+JVvJyaVFhKMaNwH7DWL3tIAePwlVf2Mixy391sDUqw?=
 =?us-ascii?Q?mzD/+MsmTERe8yYFm5YInjRRkUHPly6jU3fE+Aq5wyr2xtqDR6e0MXqxeDa1?=
 =?us-ascii?Q?XTWfAg1/gLXla0Wn/f4Msi0OEiX43E6HNh0ksOaBXguf1XsJSIcpGlJqhTfY?=
 =?us-ascii?Q?qjkUPbkuLufk6ixlNIKEq43ptYToDviy1Tb5ZCYqHgMOEVYZPjZOPt/TOrnz?=
 =?us-ascii?Q?gIlbtxky2uOp1orEli4FgWJRAJbJy1a2KFeP2hSLz9WN4GGwMOMzwp27xOp0?=
 =?us-ascii?Q?M235DNoDhbBrbMCB9bkeTNoxgUMFIpGNG7iF2qjL/vhO/Bsui2oWIEMYes9T?=
 =?us-ascii?Q?cUqVB4IEd6p13t3s97B172doBfAl4HxQ+JCPQuJP9Reeo6NGuem7LDNnUJa8?=
 =?us-ascii?Q?sbrjrb1y6T+JBY7TKVqsLy4E9Skx5HypYNuuEgv+V1/zuoXcLHf+SjjTbB0y?=
 =?us-ascii?Q?Wgd/zTyxz4+dPktAl7zqKf/i91z4mhVVgiEfsm2QSdR6wgNjQ19+P0v+2eHr?=
 =?us-ascii?Q?qHxNnN/PkBWDhC6iA4GomN3nyMmJ?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8346273b-ffc7-43d7-e563-08df43d01e66
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:55:26.1447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB250943

Hi David,

just a quick comment that this:

> The key map follows ideapad-laptop. One code seen on the Yoga 9 2-in-1
> 16 (arm64) is new: 0x48 for the Smart Connect key.

isn't quite right; the ideapad-laptop driver has covered the smart connect
key/event 0x48 since commit ccc8c8481c1f ("platform/x86: ideapad-laptop:
Map Smart Connect hotkey to KEY_LINK_PHONE"), which is in 7.4-rc1+.

> +	/* Smart Connect, phone to PC link */
> +	{ KE_KEY, 0x48, { KEY_PROG2 } },

Similarly to that commit, I would suggest using KEY_LINK_PHONE here
instead.

Best regards,
Marco
