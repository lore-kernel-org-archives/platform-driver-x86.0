Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804210;
	b=q1B/QvU++ZKtI7vtL1g3G6zjWCmxyn8qGSFfiV91No3gQJtOnlL86MfTkI9pBaY5Vgcz
	 7cYarrUY5megQlWYTMchN89UkoKWDhrDlxpaBJPpbdp4U9LGf1b8GXpi8UOdfwQW4V6fC
	 Oe1jhTK2hcXaKhtM63kjs3U7JjTkFiL2ZsYOw55SB97AQ3c77DfwcJlYGkIfpQSah0SOF
	 pQKnqDwV+iqTW5Ui1Vzv51YEHMDY/9ttYb2pvXlKBNXiDB8KxiuIq74NaTKIHAnL5kkKD
	 rJ0eAgf4KLAO28vs7qmjDkfQZVJKsabCk8XMXZj7YWAF4oF4qLXDSGIFcwHk9eyP4TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804210;
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
	bh=8ndxoq5g93afWF2WAUPGGoru09nuAN5uYaHVZQt6zu4=;
	b=nsh8IeoCIG2Vbo62TVUiMiDs+Kkj+S/Ylot9BnYbEQN2qG8LBd14Frx7h9zz6yE0/vR2
	 isStjjToe1+/hcEjRlywCOjeoAjnq27fPW20xDnN61dCUpNcCMzrxKm2Y5mKgJ21M8cXL
	 VnPlSoqLpkylRJFRV8lJk0Pi11OFO7XuxyNMLxBbBrtHOkfr0jGVxd04bPAASO8/uo34q
	 OI1kNhUi0DgBkNBV1GWJjVX8IZQxaws51UzrY214zaJQATV1TMIED2Ok8qQOT1A2MufAW
	 gsMQI6J5UZ2eUiK+7FeDA9xUfMN2D860+XYEPR8vadOcpxu7jIHTWMgbbILOfuP021w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CyL1yQDh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.24
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C691606A32A;
	Mon, 16 Nov 2026 04:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C691606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CyL1yQDh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hggFL76xVhS3lqOoxqjCPSygjlalMHOx/+RLgNuvPVIqbF7DZoXtclP/5XqhE4xz6KHZwsd7N44cf8WqG3xWmgXVzIlKj5b1xeRx2pUY8FyCy1k5S1hRb30m0SwRE6qYG1RC7TNYwigotjWV7v2BVur38SB2Z8sBlP2vghGFv+XJCWKF6ySy/o5TJxEjYa1gOFBLJ15kyUWSp+nh9xzMckD0R55Xra7HkyLF080+r55LmyZzNKfvPreBy/ONexATMt+QvHIzD0PiN4u7URKRn/BaR4u6FWWJpxCiwrkJ+DTrVHytu3J/Ou5pqxM63YTNzdL0ZdNGZ95Dl2wbrnuFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ndxoq5g93afWF2WAUPGGoru09nuAN5uYaHVZQt6zu4=;
 b=Y1xbo/sNQhVqUqQmF9GecqcES3RO9nOO2/su10qJQoUBybdFYEBBJOb4D6JDgXMlmf9qoTDfsumptqkyy9pvQ+fraUiiEmL9gRS8g0DUJXFEEnFN+A9gz35ZSyA71e+c/RD0HATbucu8hMm1p1ZuVEuzTZcr9cpYEz5Ujpbg70b0Bg8OWGDyJgrgfgxkMZw9wLLC9SlkrOG0+Bo90fGGyyQGIcWwtA6mIwYWubLQkQew7OsCnPrOZGYkUKj3z5nFxwR+Vhg8Xfa/j9SQf6nJdMHXAMnx+7Is5m4mEhf0Wme70QA7Bvhq0qBqN2EwqA0ECQZ5hqgfOUdbMhGg/D0mmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ndxoq5g93afWF2WAUPGGoru09nuAN5uYaHVZQt6zu4=;
 b=CyL1yQDhD0pJzC65Isc+CkJlit7tg5N89MmhhEffJiowNXZM5rVNFWVUIGnI+CSfZbtlpSyRPCBK57YXbvfjAyNDBEotvoyBu8cae1+i5VQkH8s0KDe7j5vk941QAjQdP3OcdjNv5leeyGKViMIDqvVQ4p4q1HGxsYBtfJH9bK8HAV6J5Z3QKOzz1VWKireV0dCAr88Qs8nukwLvtVjz8zWNiLfZeEjdWWatgWccD4m0dJfqd5E8TQf2/A6xVrBGosQWsKRYHhz479eS7hlcKm9I11GfXZcoXqDEb1RGhJHEiZsurR16BpXFc9tbaRrtCWA2teVbI5Ca4CpOXsPdfw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 04:43:27 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 04:43:27 +0000
From: David Cemin <dcemin@nvidia.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jackie Dong <xy-jackie@139.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas De Marchi <ldemarchi@nvidia.com>
Subject: Re: [RFC PATCH 2/3] platform: lenovo: add WMI hotkeys driver
Date: Sun, 15 Nov 2026 20:42:32 -0800
Message-ID: <20261116044237.3760227-2-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <0aefaccd-3c9c-4970-87f1-a329416204a6@gmx.de>
References: <20261113222755.1696567-1-dcemin@nvidia.com> <0aefaccd-3c9c-4970-87f1-a329416204a6@gmx.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: a752a724-2896-4938-014d-08df439c27ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	vzADY9IVz1aKYdbLCf5Zqx8WUOfzCoMy6ShRChAy9ni4MdPbAM0dhr2bcO+a0dwm8HIgipftjm06ybPi3xo8Eze8ymjh/qwCU0muomqyFbEEME0IfgjJyJTcKh4kjKPwfABNLLtVUv17XOftIWZa4Kb7Hdb8ZtEhrWcVDRnBh8ghWoPIUj851UlnC8/l4/FHuGxgK+5V2d7tm5BrrSM0wySLZxhfEbOXCNjQjfdb+xPLq+zNc8GSMKK28Qsz1IV98hBOw7TsyaezlyhqG1jo0amyouoRAm4G7b+k+s8NSeg2zpJoeh29+lYFLXAxO77apCEqi4XGPCiRBRp6mkAxKzidk/NHou4kvGvqqPbJqHkFwJ4XKjYhq56BZuRLj9ziMD36UXW55goTeCkHuYAx1VWKmEQufLlxOyYwb70qfREkXt0UixAAbCqmgt7wTCMEn53nJOoREVE0SspX/vDNthtqKrJv4a6fgpwJbzmk1ChQvP1iE5AWSS4xGQNDoSfyYONnJhFzqAYtJkzcaXAK6bjK9bxWAp99PB9VNGOuobnJMGuhEj94PSsAYVbj3nGXuzk6IObgBD4IyEfGC5v7fYn660n4WcxYSjnDaKuNmInGPbfwUrD5mBXaqc//IZriyx4XqcaJ4q2X3tjQXIZ65HTFJujjzeLmUBFvQYX/Zuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uJc+JmTUK7NSBhgFSgedzhhjXUiAnIUNwBzTu1MHltZSTgsv8bui4awe8leJ?=
 =?us-ascii?Q?a7WOgUSzVbAkEmMKgrEiLd4TQE0vkqLIMEskjLCkQYwu4GVoNiAjnzcO/t50?=
 =?us-ascii?Q?QTmNqDuf7+IImIdOj4O3zPlGV+5p67iAVfVnv6+Y7qJl131cbCnRQzC9ksuE?=
 =?us-ascii?Q?6XfmimW0FTfRlHHbfg/PX+J9h5AUVLWQOSuO6pUR8Kq+PtzJgfmCzgPZ4UBv?=
 =?us-ascii?Q?o6ySwnNoUfWzTUS8efXJYzhgf8mlqfqn71FBew7iUzIcfYNSDt0MjW1BwsWS?=
 =?us-ascii?Q?v2RuMgxw4BdxZpLB2r3vC61IxcpOlhEnYebojOuF0XlrOKx46Ui94huzace6?=
 =?us-ascii?Q?mHKW0ZNd9VGbBg/I4KVckYr1UyCsE0+3rThziC6LJcNsJ8xped244BVjGayR?=
 =?us-ascii?Q?gQNfmw4W0xsEr5YrkHXCKZ/i+YW9KxY0OEuhUAycU7zZ7NZA2rxpMX/32+aq?=
 =?us-ascii?Q?FcG8RezwyZhcbtJhA5LIkAQzVEbg/1uNwltcXSKz3tP56lsn/sRBPsWE6HrV?=
 =?us-ascii?Q?LWP6XDnJi7NL+BBj6ZPbrj2dbTvoKHezbEhvwfxsNBDVLfGCgcReLwY5JCUi?=
 =?us-ascii?Q?IVvsGyraS4P+vYpCnouUvaoCBWEAO1/JVGLH3W0F/9TdwplMhuoM4uOh57VJ?=
 =?us-ascii?Q?WU5pDGY17NPwA2Df3yfYn3snKGv/JvkHfjfO7vXBsmzaspA6SM23ZKFbIpCi?=
 =?us-ascii?Q?i9ADY/cbxbCmEeaGCfs8bpUd/GC0M00kFYXVOpBzvepTfvk9NlnCVj/mHaar?=
 =?us-ascii?Q?VoLJHaHUEKgWUEQssrzlDIZ4ohsCXCMPf+819Ov+Bhd6DqunTJhL4fNT5flA?=
 =?us-ascii?Q?CvCZ+w9tQvXrr+CRKoSHLoaNu1e1NIOsCWaIbhNfknR7AItpqvfdqvZjoUeF?=
 =?us-ascii?Q?ErQjEyqqDfnJagiqbFNs38FKinHEMldY9DbKjSWp11ev/OAq64SZcD8hle7d?=
 =?us-ascii?Q?VAN5s1S0yKNNLaG3PaY6HTaEQlnmmFITsDfS4cnFI66LBP0PEomr0km1NBdB?=
 =?us-ascii?Q?e7G9lp3YVsLU+3UFEUnKLx4VoSct0McUuR1+6o6svBUCYci3q4SaHbSO1tMc?=
 =?us-ascii?Q?XWsYF2IuqTNdesKJVG2Pq1XrOX7RWNcAYLQU1hjAY7SMlJpwAPIeUsrNr4HN?=
 =?us-ascii?Q?KLblS30EzdytZ8YCHHyJCjX+rzLCb3pLL2QMUcDa2YHH5WfmvhbFud6WfCjw?=
 =?us-ascii?Q?OGoodU0ZFVw1nVViaPhGnPxTQ3zTHKHxnT2f+B1yKBJioRZ+6Axo6z7jt0MT?=
 =?us-ascii?Q?kHuTv7gDJuLlJJNcdfnQUmSPyKQOodDMhthISnEZ07GCz//UmrkqyDdnkzYD?=
 =?us-ascii?Q?OvNIphE1K0PuROApEdSdJrTEU32Kr/J0pssqEN3PCgVSMcPS4cXkquG5NPkg?=
 =?us-ascii?Q?LWiRgWFc30jDKFVsg9lsl84ECDrpBNXl7NaArIiO8IIb6lwWyi66tzKru34E?=
 =?us-ascii?Q?8OTba6HXAqMv4s/8f6tjm/wmSuvUpVgfukOLUqogDKi7AUlkwFp3ltyfJCDp?=
 =?us-ascii?Q?XUw2n7xN+6FzWmV4XeyYNvaiTwts0Hc7JENsGB8q67gSANWZGKBs9YFRjDUL?=
 =?us-ascii?Q?exX6WqyomQ4OM30NuqJ9F5++gxfKhzGVKTObb6gFytoISACvSwVJrdzfkXS8?=
 =?us-ascii?Q?SvY/g6L2HrBKf4B1lKbH3NBaSDqUsCR78NoBTKy8YHmmqhzVfTFFEbmx+5Gv?=
 =?us-ascii?Q?/bP9wwWYyyQhla1WBfPUkUneu1sJDQ+yBZEkjcMOdtn53AImTr8AnzsXB992?=
 =?us-ascii?Q?+lDW5NdW/g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a752a724-2896-4938-014d-08df439c27ee
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 04:43:27.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhAU5gkDUKFuf2ukbGMZPFHUdRGnPTH1ZoIKsi0RBp1JsWmRhZoJ0tv5NGbQEwXNzx2kTG1NwFQBUOxFIbrAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Hi Armin,

Thanks, all taken for v2: KEY_PERFORMANCE for 0x3D, devm_kzalloc_obj,
drvdata set before registering the input device, notify_new, and the
events delivered through the lenovo-wmi-events notifier chain with
NOTIFY_STOP honoured. The payload is a single integer, the key code, so
with notify_new it is a 4 byte little endian value.

On the Esc GUIDs: the arm64 firmware here exposes 8FC0DE0C for the Fn
keys but neither 26CAB2E5 nor 56322276, so the new driver claims only
the Fn key GUID and the Esc GUIDs stay with ideapad-laptop.

Thanks,
David
