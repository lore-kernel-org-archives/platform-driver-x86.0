Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012013.outbound.protection.outlook.com [52.103.23.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61CA383300;
	Wed, 23 Sep 2026 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162280; cv=fail; b=r6qak34pGT+SpEpcou3UYXmoZeCg9E3NFIqdIBf6SrnVsP33nuIA6XFZn4BbNh9GPSNrBsvu23XV/CFMdADKO9xpSZMjx/baAqywkKmpODP3r9JeutYSUJPO4VwaCKZTzAQLKDDGjPkwx07vjLjXCGKjhT1WGOJ1VYBjuTcObLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162280; c=relaxed/simple;
	bh=6/iUp7A1qxD56sdjZ1cgaR5bhwdl5kp+giS/2b1PSC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mioCMwtSErHezUvKm9qheidZYP1hvwbwI37F+8kyWviLghOL9WjtMCnVrv3piQ1/I+hSHVWpDOVJOi7/TpJGprvX8AmRPjzm6emBEdMDA/znYdZeL2yvnvx5X4A4tLBf6PrCi8oeZAWmOJU/lmQXnB2/AwgN4KK0Oh81m0SyReE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=ZmCq14WH; arc=fail smtp.client-ip=52.103.23.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="ZmCq14WH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HylTUUHH5yZ7svL8snYgML9xHHEcANpbeD1HvZKogQbbYWWGhLlxw+Q4UNe8Fm86b2qs00sN3pbwP42oazxaunGfWWg3MbFuAO/JB8BkjvBPMbPNwXGy0sbnrPwpqxLcnoCC9wj7lq0sCglsDyyY9IHvclMF3aMO7WIrnTWbUY/bNgfeLu2r8BWj4n/0BUHt2s6xDIBxQmapZ9TEgdknz0gsmznw3N4BVj0vN0Xt9kVmpJ+LIRLF+JZxzcj0RYZ2c9D8cz8Zp6tbZ1MzniVMnlU7newKELOBn08cO4VV9Rbcd+Epd+fIUnBYopIxGXLapz16q/Me/WIJ76bsuK9Viw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yavn2GA1soAUQz23WjKvD0Pl+KXMaFJNdGrQZ9MeeLk=;
 b=pGwhkTurKtc/ZDwmGsaMfaSma3M7lCRsthmPu+8utgUwe8c46oNspm8H4KyvX7Fb/RU0FTgvNgiYwCHqus11zwE4rg+W4D0shRy/jqq/jYssW3u6SSNqql+Zf8NL6k6S2oxSvxuWuNM5lXTmUNNdiA+AYx28v1gYAcuo7wnpsuRXxE5SKrqpNBgaA2znV1OkRkK8CzMUl3xcHSpCJ/xB6XQ0VFsG4GAgfVCdh4yb4xaskYBnHmZW2ezGHxuxCDdmwBIbYBLyPJTn6e4UoAWFDnHyPp1gLe8/nQ1P2sD4Oe/ZZILM/NCiOL7xhW0AMbfVbNH0mKkHtC6sHLOk1wxKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yavn2GA1soAUQz23WjKvD0Pl+KXMaFJNdGrQZ9MeeLk=;
 b=ZmCq14WHuF8Hq+TTIxQLdjefrD7q3saIpzRRZKIZjc21jLbKYuH4Rf4f5psK9o4oXeBacu9x8VfQHFGCIJ3q7vnuGJXAgCeCOu10R2FiKhOIpN4uXYBqQ4RHLhHGvdr8a5ANtsT1O4YHsINxKFHYF7wOSeEUhxjjkxFmUF0mcKZST81MAFDuVlA2kJKULn3XhXNHrB2VLa1CvthZPRowteZUF9UgraWqW/ZSRYhzzZvW/EGPLyDcg/Vj+4UFHLeFPH4V6paIE+uxLCjGui5nJfufZIOyqw2S/s0GOmv2fPIidpS0Yea5MjPjIstVfg7hh5fs9PexrUS/EoDzhyMXcg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by DM6PR19MB4373.namprd19.prod.outlook.com (2603:10b6:5:2bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Wed, 23 Sep
 2026 11:17:55 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 11:17:55 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: i@rong.moe
Cc: derekjohn.clark@gmail.com,
	hansg@kernel.org,
	huangwei@kylinos.cn,
	ikepanhc@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	marco_giunta@outlook.it,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Wed, 23 Sep 2026 13:17:44 +0200
Message-ID:
 <SN6PR19MB230365BE74C6A502EBB4F35DFC822@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <22C70C72-1C43-4777-AD11-D5A6EA85A0F1@rong.moe>
References: <22C70C72-1C43-4777-AD11-D5A6EA85A0F1@rong.moe>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004E99.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::449) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260923111744.31068-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|DM6PR19MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc3d21c-c6be-4d44-0f14-08df1964503c
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxOKJQtNSRj5sJIKRtWbEkdC/toWcWF3REInPHubm45ty9pY+zBVjr7qBbsWo/W3kLCyqiNxKmEu3oDhWPmMomzEDAM9h/+TvRTLReOLVAg+JNdl086qX1sD8HAVhnNvTOjBnuW4LYHSboa9j07LH8oiprZwbKZ22lFicMDNo93N6QFR0tH28Uo7e/Drzdow3GJFFaAFSjxejvvtrrJYXjsqs7omloaWZef8pNHa8XvWYSDHPRYNBD+VMl5p/J1TgZVLho/B6mJoh1yVD+QNDZG4kyNjgs8UNSeUG2OtBUMjrQulvxKa/iM2J9RKA1Voj9pRfT304UkQfOfqi9SrFWFQLcP1U9euTc/CPl+1fhJ8OL93GNNRpIAMNFQ94liNSXFfulvJcwtxtZ1D1lmnTmJtVKEGmJ/cAVa1RKAH+eL8D+aSpSpKJhxj5iIIpWyaO3QAX38BsGmSP1Jz8iGgh1jnbPacGOmsR/XDAkXBByA+BEQk9MvXbXG+l7+9oVq69Ks0G5x1BzENYhpLQVq+S4rZnoAZMTUEgUVGrFJ8ulegATAZPhd6SPuJ3NBlixznGUoLvbdGQ82/iodQt+k/BM8NPwlWJjSp1BO47sUcw41poW814q6U7IQz9skmxyqxMZZ+2bt7uaeiKN5Dk0nLEXbeDte6zx/XRdcZhKxPfElpYiliT0Yr1ILhEXtXPSUXO6KR0mGigqw1i4/2MToZ6nVIHRDcNlcxneBHkBvgGCTrmU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|55001999006|5072599009|19110799012|41001999006|15080799012|8060799015|51005399006|25010399006|23021999003|440099028|3412199025|12091999003|40105399003|2607281247196008|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fITn0MTirHJPMYTcUn+LaPXtcEMn3qzbV6pxpCn1ZLeSEHzEIjBPXeUYslL7?=
 =?us-ascii?Q?yOpj4LAK0mly7lkSRnKFOXpdPwU0z6JjP2KogcTKPpI09WbM/pw9vV/13L8k?=
 =?us-ascii?Q?dvzANqmzhzPy012v7Jx9ZVidSusoo8D5TdkSd6G9uTkYlAnTq3F/W+IdGV8P?=
 =?us-ascii?Q?un5kMtncQxHndWkuDgBAkCzTIuhXpZXpPqszqQNJZp78wK+OO9KO+MqCruHO?=
 =?us-ascii?Q?DpEsnHCBbhxKhLCkGzPI86/ztDYLBcPzn61T3l3Zqr8so2f7l/PxENPeS6VU?=
 =?us-ascii?Q?wURPJSs68lz6UoTMC1padGhIglqIL2UZtiTyylVo5HTlXfJgPVtiTugayGa/?=
 =?us-ascii?Q?lLAEpw1zCYTv1V/XwLZN1JuFxFiyU22ajRBAsLXoUKhJiLRbhfZWgaUDYpvv?=
 =?us-ascii?Q?RicBGwH2dKi/K0Cj7SUzOQr6kL43EAiXiYM4KAvKfqETPji3fDxHrv9iN9lX?=
 =?us-ascii?Q?xr+u0qEq9JSk7Kzi/9jSs47iFUu3CRaX1/cHyRQSu1ps+RQa2qmi/QJzlS6x?=
 =?us-ascii?Q?WuEQvffNR2iWI3taFRL7uHXKjoBYhCh5gl/W9hYAXv/opvv8rzOwlv7rpYAV?=
 =?us-ascii?Q?yrWmdh0tJHIILERN2ZpAK2JiwmzdpjR1M/Q0xy03AqvN7B6zA58c15yJB0ZS?=
 =?us-ascii?Q?MCNX182lm+6DEYCpQLYo4GUT6tiy4O2w1Dqbablin86K2nksqoWj3l6MTU09?=
 =?us-ascii?Q?KlLw4ldzQTV+7E7X67mKsbR1qA+yJHriV5F256YxW8ia6f8e9p874/Z4lfTd?=
 =?us-ascii?Q?JjRbVoIxjtUjcqkdW5/PujUsSoHqJJ5gF/Mjkk6LchsSjE7V3c9W62bz9xjb?=
 =?us-ascii?Q?7rjqcf1yDgviJNzmTmAB9gEdUWn9V7fanG/GZJHSd+1mPg590hLR9g1N7zef?=
 =?us-ascii?Q?prngdTkSGRHru1+24JJ0w00k4WQgJPoERQ85c8gB8+iSX/b7u12yza+Nks4e?=
 =?us-ascii?Q?WisCpJQX02SxkR/GxikULHycZDOByJM0/4BPD3GS9pGIHuzHHuqsqHavcqtQ?=
 =?us-ascii?Q?NVf33D6P58nWzfz6vRKzwPPj301+1C3gvzLaTUpqpX1P8Z0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?20vAlw6FdYGPnEQUaoeO58IJadhuaCbzNFQYoueeW5nOclIEonEoIc/Jna1g?=
 =?us-ascii?Q?k7BB6vsajHqs+Cu9Qzv6ZM6XJ9iW55S4w4mgxi3EQcS/NHeannjgyiYeciaU?=
 =?us-ascii?Q?RyPWpMD4PWE5A7q1fIXI/wvQDmL1dqYIUelQwz96Mj25jmRnd4mFzwNY15du?=
 =?us-ascii?Q?MgbpNrLiokgF0wxFkQ563MiQ46755t9pl0vodQnk8hNkOFROSsHx4YYxIziS?=
 =?us-ascii?Q?Ox+2dHRzz4eFDc+zPp0uGP87otcvxlxk2oLwc/bz5tAogcB2J4LTS11VAs6U?=
 =?us-ascii?Q?grXEwXazRWk3oBkZdv9buYegQWK/spjv9EHo36xqrYjylUR0bx6WnI/G0XP/?=
 =?us-ascii?Q?MXduayniQAMuQ0ge9f8lWmB68hX+vfQO7OyIHRQbN/8eABVPsDYlnXawb7xd?=
 =?us-ascii?Q?SaJnHFaJuYAzM4t9X7dK4lndRPbN5McfXLPLtIl4jmktd0OR+Zwqm+Q4ayOs?=
 =?us-ascii?Q?R8eekdk8C4A6DhpCAUhqB89KLz1d+DbSChQ6P8Hcafiiwl5HDOsMMm2ip9Re?=
 =?us-ascii?Q?0eaR1ZVB4iGtZJQCZsQ1jqDUIHZ1++mjCCaDpk4iEUbejTEY287OpB8MA7le?=
 =?us-ascii?Q?iFoJhKgWRQpRg5GDdNqNuTnPgv1FmJAOaft3oSW1xXh27QUtRo4NGbIZq1SG?=
 =?us-ascii?Q?zkn7Qsg7x2zsGO/V2o4rSBLk0a/zzAaL/BHVgbGI7KOmbDkChcNJfoxvhw5/?=
 =?us-ascii?Q?AR3Ys5DZWgZ2BtfAvwcu4N6RyFfF87jJ/HQtcbgzJwP/0lL+uaOipOyVFwLO?=
 =?us-ascii?Q?ZfrB4826Uy7HP8KjrnYS8g71H8QlhQf2eGrg1/ycOj/DK7IGwUxdmHbqGSo7?=
 =?us-ascii?Q?o+KG+kH+pTCQ8pdFvOAO0bq3l6JdxFsX9YEXGV5dI2w6nUYDZK9E2z92fE9B?=
 =?us-ascii?Q?UD5mtdbAuScMqbivYjYkVZahxKtlh9j+85cmx3VNoXdFHld/7mCcTj5yq5kZ?=
 =?us-ascii?Q?YEGZp+H60hW8yltLN9VSRZJyPGXI3X2Pd2KQlge3azUAuIPYPXDYqZGR5vVZ?=
 =?us-ascii?Q?4o4idiurVqTLM4yd/Su1WEUPYo3gVXDLHyPUkiTM+jwtrYFhWEVn+IK4tuOR?=
 =?us-ascii?Q?IqDTmkM7G2KuzL8GdjkU3XwJXYBaNgVUmgVIIfPzD0DRLCVBoWXq0kNPbdRz?=
 =?us-ascii?Q?mu59jiDTkPxXO0osCT4bv3NO4Q7HYJT3T96c2soKk4t4pgMMNVbH+WlCJ4pl?=
 =?us-ascii?Q?1y+MxCCe8mgTuQ7HVcHfAlMaO+N38flkEHYEZrVeiZixFk6+jjROum7PS5Rt?=
 =?us-ascii?Q?H7qRRdYRRozSn8XCbrn0+N/TZkIfc9QmL7JHwJYLFAQ9YoVq8sFlFRWHm5kE?=
 =?us-ascii?Q?Y3q3/KPV37MZKgP3tblLxoSACqAGss7VpeBnWOKOSYXOZhVr3CywvlBRZ8md?=
 =?us-ascii?Q?c7A/fTL8dSSKhKEKN3IL8190acKb?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc3d21c-c6be-4d44-0f14-08df1964503c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:17:55.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4373

Hi Rong & Mark,

thanks a lot for the impressively detailed and informative replies
(as always). Here's an update from me.

1. overall I changed my mind regarding the conditional switch registration.
I no longer really see it as particularly problematic in practice; as Rong
said earlier, in practice it's mostly a theoretical concern given the
typical userspace usage of this switch.

I do agree that if we can find a smart way to filter for switch presence
based on a good criterion, like a suitable wmi method, it would
definitively be an improvement to patch v3. And I also appreciate that
gaining a better understanding of these issues may improve other lenovo
drivers. Finally, in general, I am certainly not trying to stifle the
useful discussion going on here; what I'm trying to say is: as far as the
camera switch patch is concerned, I am perfectly fine with the simple
approach of v3 (at least for now, we can add more complexity later IMO).

2. here https://github.com/marco-giunta/lenovo-acpi-dump you can find
all raw & decompiled ACPI tables and bmof files from both my yoga and my
legion. Feel free to ask for more data.

3. Let me clarify what I meant when I said that the yoga and the lenovo
handle the switch differently (and more generally report some highlights
from the above files).

The yoga's SSDT2 table contains:

Device (WMIU)
{
    Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
    Name (_UID, "LSK20")  // _UID: Unique ID
    Name (LSKE, 0x02)
    Name (_WDG, Buffer (0x3C)
    {
        /* 0000 */  0x74, 0x09, 0x6C, 0xCE, 0x07, 0x04, 0x50, 0x4F,  // t.l...PO
        /* 0008 */  0x88, 0xBA, 0x4F, 0xC3, 0xB6, 0x55, 0x9A, 0xD8,  // ..O..U..
        /* 0010 */  0x53, 0x4B, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,  // SK..!...
        /* 0018 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  // f.......
        /* 0020 */  0xC9, 0x06, 0x29, 0x10, 0x44, 0x41, 0x01, 0x00,  // ..).DA..
        /* 0028 */  0x0C, 0xDE, 0xC0, 0x8F, 0xE4, 0xB4, 0xFD, 0x43,  // .......C
        /* 0030 */  0xB0, 0xF3, 0x88, 0x71, 0x71, 0x1C, 0x12, 0x94,  // ...qq...
        /* 0038 */  0xD0, 0x00, 0x01, 0x08                           // ....
    })

so GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 on device WMIU, event (0x08)
with notify value 0xD0, no surprises here.

Its _WED method is:

Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
{
    If ((Arg0 == 0xD0))
    {
        Return (PSD1) /* \PSD1 */
    }
}

so "notify" = "return PSD1". Then below:

Scope (\_SB.PCI0.LPC0.EC0)
{
...
    Method (_Q29, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If ((\_SB.PCI0.LPC0.EC0.COSD == 0x02))
            {
                PSD1 = 0x0C
            }
            ElseIf ((\_SB.PCI0.LPC0.EC0.COSD == Zero))
            {
                PSD1 = 0x0D
            }

            Notify (\_SB.WMIU, 0xD0) // Hardware-Specific
        }
}

So the camera on/off 0x0c/0x0d events are sent based on the COSD memory
register in the EC.

This COSD variable is never referred to again anywhere else in the ACPI tables.

On the Legion:

Device (WMIU)
    {
        Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
        Name (_UID, "LSK20")  // _UID: Unique ID
        Name (_WDG, Buffer (0x3C)
        {
            /* 0000 */  0x74, 0x09, 0x6C, 0xCE, 0x07, 0x04, 0x50, 0x4F,  // t.l...PO
            /* 0008 */  0x88, 0xBA, 0x4F, 0xC3, 0xB6, 0x55, 0x9A, 0xD8,  // ..O..U..
            /* 0010 */  0x53, 0x4B, 0x01, 0x02, 0x0C, 0xDE, 0xC0, 0x8F,  // SK......
            /* 0018 */  0xE4, 0xB4, 0xFD, 0x43, 0xB0, 0xF3, 0x88, 0x71,  // ...C...q
            /* 0020 */  0x71, 0x1C, 0x12, 0x94, 0xD0, 0x00, 0x01, 0x08,  // q.......
            /* 0028 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
            /* 0030 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
            /* 0038 */  0x44, 0x41, 0x01, 0x00                           // DA..

            })

Same 8fc0... GUID, same [0xD0, 0x00, 0x01, 0x08] sequence. Then:

Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
    {
        If ((Arg0 == 0xD0))
        {
            Return (LSKD) /* External reference */
        }
    }

But here this LSKD variable is written to with different logic. The relevant
EC query handler is:

Method (_QDF, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
    {
        P80B = 0xDF
        Sleep (0x05)
        LSKD = Zero
        If ((LSKV != Zero))
        {
            LSKD = LSKV /* \_SB_.PCI0.LPC0.EC0_.LSKV */
            If ((LSKD == 0x02)){}
            If ((LSKD == 0x03)){}
            LSKV = Zero
        }

        Notify (WMIU, 0xD0) // Hardware-Specific
        Notify (GZFD, 0xE8) // Hardware-Specific
    }

so there are no assignments of 0x0c/0x0d like on the Yoga: the EC itself
writes the event code into LSKV (a byte at offset 0x1F of the ERAX region,
SystemMemory 0xFEEC2400), and the AML only copies it to LSKD and clears
the mailbox.

The constants therefore appear to live in the EC firmware rather than
in the ACPI tables, and no AML-visible object keeps the switch state,
unlike COSD on the Yoga (which is at least readable in principle, even if
nothing else reads it).

Overall, the firmware appears to work differently internally, and I wasn't
able to find a common interface that a driver could use for this without
resorting to per-model EC details (see below), though I may be missing
something.

4. Unless I'm missing something, the IDs Mark mentioned don't really apply
here.

0x00201000 does not appear anywhere in either machine's tables - consistent
with Mark's point that this ID is new; both of my devices were released in
2025.

0x00200000 appears a few times in SSDT2 (yoga)/SSDT5 (legion) in contexts that
look unrelated (bitmask arithmetic in DYTC on the Yoga, and in the GPS
method on the Legion), plus once in the Yoga's capability data, see below.

LENOVO_OTHER_METHOD is implemented on both machines as \_SB.GZFD.WMAE
(object "AE" in the GZFD _WDG, flags 0x02 = method). Since the MOF
declares GetFeatureValue as WmiMethodId(17), the relevant branch is
Arg1 == 0x11, the same one as in Rong's 83JR snippet. As far as I can
tell neither machine handles the two shutter IDs there: the Yoga has logic
to dispatch based on device/feature bytes (and covers device 0 features
0x02 and 0x08, device 4 feature 0x03, and device 8 feature 0x01); instead
the Legion compares whole IDs and its device-0 list goes from
0x001F0000 straight to 0x00210000. Unhandled IDs return Zero in both
cases, which, if 0 means "closed", would make those IDs report a closed
shutter regardless of the switch position. I would appreciate a second
opinion on this reading, though.

As for the capability data, the Yoga implements LENOVO_CAPABILITY_DATA_00,
defined in the bmof as

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 00"), guid("{362a3afe-3d96-4665-8530-96dad5bb300e}")]
class LENOVO_CAPABILITY_DATA_00 {
  [key, read] string InstanceName;
  [read] boolean Active;
  [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
  [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
  [WmiDataId(3), read, Description("Capability Default Value.")] uint32 DefaultValue;
};

This object is implemented in the acpi tables with GUID
362A3AFE-3D96-4665-8530-96DAD5BB300E, object id "B0", as WQB0 -> GCD0,
which returns the three dwords of each element of the CD00 package.
CD00 enumerates the feature IDs in ascending order, and includes

    { 0x001F0000, Zero, Zero },
    { 0x00200000, Zero, Zero },
    { 0x00210000, Zero, Zero },

while other entries in the same table have capability values such as
0x07, 0x09, 0x05, 0x03 and One. If the capability field is the bitmask
from Mark's table, this would mean the CV DSP Camera Shutter is enumerated
but declared as not supported on this model. (and again there is no
0x00201000 entry)

The Legion's capability data (same 362a... GUID) is built by WQA9 from
hardcoded buffers rather than from a package, and has no entry for
0x00200000 at all.

So while these interfaces look like the right way to expose
SW_CAMERA_LENS_COVER conditionally on firmware that implements them
(like on the 83JR platform), they do not seem usable on these two models.

5. I have basically no experience parsing WMI data and very little with
ACPI tables in general. Please feel free to correct me! And in general
take the above with a pinch of salt.
I hope the linked files will prove more useful than me in this regard.


Thanks again for your work on this, I am learning a lot from this thread.

Best regards,
Marco
