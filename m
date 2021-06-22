Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D3CC48BDF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 20:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DEC461075
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 20:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhFVUKT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:10:19 -0400
Received: from mail-mw2nam12on2065.outbound.protection.outlook.com ([40.107.244.65]:60577
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232582AbhFVUKS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 16:10:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNZIpf///P4aV55UenVkOM57dmU8xEsscNq+t3f5p0UZ87/EBm3ttrJhiiy7qeDC+lBVjK+aLNhGgKI0EEjfR2r6KVUOFccq9QugkqoUlG0zY4Ao3cEe6zeIWvywqJukhn2R93GJvJ1Y/yN+q5gMn2PIF0ID5WZuaKjCtR5w5M/s27CwsUntKT+JaqEtg/NBFTzX7zyB5+84WzNDIQycXUiqZXks6Rm9YNxauC9Ni6hFIk8aXIUbOPgtlTuKk8+iip5IDJMz8u2BHXrueUPYDx6e+krvh1+02dBclDlmZoKQVLBFVVX4nyTrqRAglMqEWIRUD9mhZRIE44OnAr+CwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8gZPZCnzuPFpKw6Vqbbe2Jo8A98FAutcpZq3fa4ofA=;
 b=DCfFJzZXYlJAgc+E0DB+h9w1PDA33c+WqYyk8RmAhJPU1/JyuNh42qABu7GprGJtOb4gj6BzSl3zrsia3JvdaaLm4ZYMPMl1dPzUWRuaJigc9cZ0suvExMkozwfo3xpNxP/cYGSZHy7D29JT8Oo3wE+8GmTKaBjvgcqMphjKWZ8yrC8aTnoMQjTiI0omPco6phkCcxnhL0krYfOxW9OngSxQ4w+cv6uUjSTKyZvcGAUGu4ofJh2Bt6ZthStFILBgjnGc2wpDWm09R13KRR2ixW7L9kbgE/8kNjx14L0Nh8EfpRS7RvVyMCy5slRDW2ynJ0EVhpmto0ox8QVBi9LbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8gZPZCnzuPFpKw6Vqbbe2Jo8A98FAutcpZq3fa4ofA=;
 b=Gpk6Bj/eoB84iW/hE24drnl+Qdvj+JjC53zNmm2EVKnycQhI9IsBbPFAVX0sAC/4bNcFMnwNbSMg8wE/vqOInqArSroz18FlQi11VFxKJvJzds6T1aVzaasW9EmT6+Muk08JIJ39Ymkpw/fK64pOxFoLRx7zAhvqZ0IFN/z10x4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN1PR12MB2413.namprd12.prod.outlook.com (2603:10b6:802:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 20:08:00 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 20:08:00 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS),
        markpearson@lenovo.com
Cc:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 0/2] Think-LMI improvements
Date:   Tue, 22 Jun 2021 15:07:53 -0500
Message-Id: <20210622200755.12379-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [76.251.167.31]
X-ClientProxiedBy: SA9PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:806:23::23) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (76.251.167.31) by SA9PR13CA0078.namprd13.prod.outlook.com (2603:10b6:806:23::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 20:07:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb6727b3-6190-47df-bee1-08d935b96f19
X-MS-TrafficTypeDiagnostic: SN1PR12MB2413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2413BFC557172269E32B1C64E2099@SN1PR12MB2413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZYLIgUJgDKuIbzTNCuCmg1n98vt8g+csWOIrlRc699z4ld88ClK7Bw1rgomru/hqz2RCRsCh23v5Le6OBJJXUjT6Sz7lcfemiYO98rPlz5UYDvKKM7RqfxhxVGIGOhXU7A1Qv73dOrj6xolhxTtpbU4Rxc+bTWKlsghDkEKH6J8vM66bZ/SDADDYdTzA7BfRiQhiE2x1QcetMZpROXYCcuc22eWTAL8MNXviIyQOlIvmuMWXYbAyb9C/3kBH+sby1rVB3VAgwHo5aja09Hk4I+MTDK5lq3A3tP2ETLv7CJ2668dRoe/dugo9oS0lRCJ7K9iwTQBVnf1JuDZ65FCWSxNAsrF4h4b3Iqp17F65vIVw613xWdtZO5ZJOOdTVDOg9y6f62I6fvlEDOU0LodYqAZXM+EYjHGzB2agr9M76xB4QwAwqjdexv0SkzXaLDiYzdCuA5UIaxON+Z4DbARyR/Smp+Sy4CER3y48ucIFemGFNv5yVGH5WG6DHP3Ento+q3DZb0WTFPRBSYGKk5qgN6ppVhdC7u6Inq2VGP6TiOejXcidG4f72UtCrSulJlCGo+ljU7UQRebzWI7gf+bBdrH4h8hNfu/kAVufz3kHcUx6AIyTRLn2WKtH2TPIswXNXRBkA8ZZmU9jSYvDJUD/lLwoLSuVCobakLV9YL/quU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(316002)(66556008)(66476007)(66946007)(16526019)(26005)(4326008)(110136005)(2906002)(8676002)(83380400001)(478600001)(5660300002)(186003)(6486002)(38350700002)(2616005)(52116002)(7696005)(6666004)(86362001)(1076003)(8936002)(4744005)(36756003)(956004)(44832011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H3tyCmGH3qJmKwyHQlZw0nEIL8ZhWMlu/WYhIeC6huj8UFkLCjvED89Wpyvi?=
 =?us-ascii?Q?KchnaYnoJsPYI3Ewa3Rsme5qr8SXEf/2TwjIFYevp+kpfrrOi5NE6ZMT60nH?=
 =?us-ascii?Q?Mzz0ZSrRKpzGwyO5Gx+R3XwaSmdVlnRUNr6XSvAzp+RMHmO8CJ1SU4bmie0w?=
 =?us-ascii?Q?yjxlMDEtIoGl3aZZMa2dU1EBg4dYv5N25jfdu7/2sH5mxEmnfiCZtICgnZaT?=
 =?us-ascii?Q?6+B8iiFevplkI2pEzFK7cxQBqmZgsuLg6nTrnrFfyw0lEVJY2NF4uovP+dxF?=
 =?us-ascii?Q?5st63h0bhEp/pxN+303ZqlEga9yR+aWFASsb5nLALw8uTfaiKCSvKZJw8x2s?=
 =?us-ascii?Q?+hE7xkTWFIVNmbu3UO406Ke6H4b/IwmjU6DXuYk/ydNo0fyl06oNHB4vOnP9?=
 =?us-ascii?Q?yQSfbRoFlfh8BKSnTthqxzgWXmDN0PO7WGrPGPZa96M4sUHTsDVe90bgcdQc?=
 =?us-ascii?Q?PwNomX/YoT3HfHgldA47ic/UxUvKLqTENST2UiWViWczDdZN8pE6Bct8oGRP?=
 =?us-ascii?Q?0j1Vf6H4w3yYmqX7BL9sSALW1a9XLoRVVxUsQjtV3EbsfB30dbnYI+L9aIy8?=
 =?us-ascii?Q?TigMqlUvMSR8LYJqPcB5JnQOEvmyREBUIehZ6naCM+I3zHPtKeOnhMeCj2dF?=
 =?us-ascii?Q?3G4V5Hd6ArFYzZz6DdKfug2pJs5xEcBj5x3jZuASGCdQCVF5ssTFqGDw2uOY?=
 =?us-ascii?Q?F1Pa1wGi78F7AliEubqZSY1Ofxlx5X9qXCv3/PsF5xB55p9OJbMtplftxsrU?=
 =?us-ascii?Q?jN2P8uppuIUj4i2gSNGrPUlAZzjoLtN9xH68nEAduoLx7YubMhtHVTzBUSyJ?=
 =?us-ascii?Q?qFxQ4sw5vo+YK+5KEWE9OvCoeDnFgGPmeLN5rZ4VCVtkLgQ/pVsw/bIaIrNF?=
 =?us-ascii?Q?8RbPG4wmXKA5MwKtvBbW5vCJNuZdN7rKF/OttKFPPLiVluvBj8Ut0KK2lyAi?=
 =?us-ascii?Q?Z551JgP6ajr/jOoV4zY6Gmk9fefMhxxfRb8jjBqByX4ksZiHrfZXXfSAcJHQ?=
 =?us-ascii?Q?VriXiUN5Kyj9uFJG1PsHX8A9Rd7e83YphNmMNyJaMXGnARuhHKuhT7xQmnRC?=
 =?us-ascii?Q?mdZODOKkdFIB4sLvaBCUd/eVbPoKmwHLt6X0jqyXgNogQG62minnnKZuqXLu?=
 =?us-ascii?Q?4Q0irIO25gfxaMdXzqNWOz9yQmqASPt4ZHVJ9oGa9yDljFKSCZb1T6tTbLJc?=
 =?us-ascii?Q?PFsMOeVk5bDjlFFSeeL+UTh34UGgn8IuisIMhPJjp9qb5sCs1bYLSPrVSbOO?=
 =?us-ascii?Q?IOH1fDh3qNf68vUnk2A0PaIzo3CmstH7MC9pLOkAX2v8knFGB2w1OFD+9j70?=
 =?us-ascii?Q?yk49dICydkc7/mEcVDHhqDmv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6727b3-6190-47df-bee1-08d935b96f19
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 20:08:00.0573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxsiqNM/dVNGscofbohSKeoa1B/iZPQa5WRRh4+01SCfhRNlmjULCg1HVMhhU3IET75zMATrsKGuxQID2U8o8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2413
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When testing on a Lenovo T14 AMD I found some problems with the
driver, and this series addresses them.

Mario Limonciello (2):
  platform/x86: think-lmi: Fix issues with duplicate attributes
  platform/x86: think-lmi: Split current_value to reflect only the value

 drivers/platform/x86/think-lmi.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
2.25.1

