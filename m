Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAF0C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 20:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8608B61075
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 20:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhFVUKU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:10:20 -0400
Received: from mail-mw2nam12on2065.outbound.protection.outlook.com ([40.107.244.65]:60577
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232256AbhFVUKT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 16:10:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZB1u0FDuMKnnDpgvVZ/0/JqfA9eWfRcmpAebU2lpOmnIyHFz4tW8pQJEbCLFOTeQNwkCur0ovIZhOS4hx6fmhfl1fefsthOMbcWUSriWo3QKjaVW1mubyQ/Ppw51HPQUrqi1HmsT+aNPFLJvxQdjW3Okf7pxZzoaZX5gXPMGIe925SdUmiJnPLobXXzVJbjjUSXtnI+HytZYf65tgut40pXWNwCZ/W5KOEFNhOkXnFPUgfStKA5givy0Tj0gM949/XJvep4gnPqpulWhDwbVKzWkYAL6ElRxdvhuaPD9Ttid200nhRnoMF4eWYaDc5EIT/JDB3B2MxXKbIsoCKcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaVBXbkJjD18MmgWn8qyGWkH2V13OFi1paANqUJf2gQ=;
 b=PjwkP735dlLS1WiGz2nVWdRTVNeeRYWf3mjFTPszxgpVVe0ItDvsiG+MwU0fcqiOFzAhjpruPAs6jLrBpXQoG6pSZuHgffR0U044JxtSY68ewNZt4zRToOkt3JlrjMgikVu9zxDyP3LcOksjZr+xrmR9d8WKqQnNRjDiHhafZISMOc4nCa7neiXkpckNjX5twE+tzPxgNn+LpZrggOgSXiLMXAqnjQZU7nNNOAWzvR9FL7wYS94d9laIfwP1oj0SRPCThRU1WF76GY+oHYUWprke3eknxFlII2OCZ2aZP39Gbdc4U0EcSTaU/XhNwuMajOy2auW+wJl7aUvqUFGbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaVBXbkJjD18MmgWn8qyGWkH2V13OFi1paANqUJf2gQ=;
 b=yNdyqwRDlWt/olRvDZm8wVxjpwUzArIjO7rcwQDcihW92RRzmSUurUaz4atQ7Zg+MDXdFRlrtG1ukpaCUyj/2+3SUV+PeEFENU/DoGOTk/dfWejHOolDsEtXT8IjIcOxQs5Jue/luCTx3OZ010XoMO4kEAKmwxHRYETzV30y0Uo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN1PR12MB2413.namprd12.prod.outlook.com (2603:10b6:802:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 20:08:01 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 20:08:01 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS),
        markpearson@lenovo.com
Cc:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 1/2] platform/x86: think-lmi: Fix issues with duplicate attributes
Date:   Tue, 22 Jun 2021 15:07:54 -0500
Message-Id: <20210622200755.12379-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622200755.12379-1-mario.limonciello@amd.com>
References: <20210622200755.12379-1-mario.limonciello@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [76.251.167.31]
X-ClientProxiedBy: SA9PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:806:23::23) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (76.251.167.31) by SA9PR13CA0078.namprd13.prod.outlook.com (2603:10b6:806:23::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 20:08:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb1d759-4216-4557-80f4-08d935b96f63
X-MS-TrafficTypeDiagnostic: SN1PR12MB2413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2413647C0F21D188DC188692E2099@SN1PR12MB2413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjWnLBtVHkBz+YLbHRGIi4ux+AnKdt5EvVYKlEVgLmaZgVGDkyk08Ryv+LT92nxtIpRtcZMIGiPk6YUmPow0OQLV5LWKIEnovkiNTlfN0I/7DlBOmxBsKjDQeNlj0fLhytvZkNqOSfGmXFsDMGPYuPJX20QaqYB05lH9TiUp2UTnKxBZ30bS7TquWbNF8VhqrwLY4PK8ezuKIXKBwfx68C9XWug7iSxffYp6nFlIAWqR3AdzxC2GTfGlsCff18sP1CUj3ikwhNT/hv0K6SKqI4n1lIA8gURjBZdn/O8XrTYcExEMpQtKcj9ew4YaZbL+iR34JMbtePcoSgB3frgzgrEIMF1rvX8P/lSbDgZTuQcqNTZYVfl0OFilF4f1WxXNhcK6S8SSrlwjxHv56jr3jJEeW4uDwDqTHhRvHMGT+VgOMi3gSbcSMVJAb2shTN8w3z6u28mwJPH8o0shqAGEh58HUk41rU0SmaU5pCXdYfFF32UXHEh3nUiKdJx6ev0ZDrTDc6WyJxlVMgxjdJ0exzPPRjQSypFH+TzHAudj9NKU3jrbwHNK5vGZAfwMN0nOLqsJcgKYfT/D79CszfnF7NFsSEdZnAWa72v194QxXvofVB1a11oCK8z7jfM5j7OYT9QRcHTFST8W4ByFlskIW3kyi1dgVvpHzV6RPBLZCQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(316002)(66556008)(66476007)(66946007)(16526019)(26005)(4326008)(110136005)(2906002)(8676002)(83380400001)(478600001)(5660300002)(186003)(6486002)(38350700002)(2616005)(52116002)(7696005)(6666004)(86362001)(1076003)(8936002)(36756003)(956004)(44832011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sFzGVkfo6VcFDuUyIaj0TTSgPfaWLV7ETPfQEMaZbpY5xriBlY/POQvloaXV?=
 =?us-ascii?Q?pbtp86theP6Lm+87ZM6LxXyRURR5tUr+q7F8n+kNlEM3QnT+NpGPeKEQ8MQ7?=
 =?us-ascii?Q?i5XZ531BC9qorCOc/Kylo0nYm2BLs0zJpZzyzu2V+coMvj8whyb4dOVBvfx/?=
 =?us-ascii?Q?Km668cpfo7Cik2yy5XE8DbFsZy/vg3bv14B1UNcc1QaD8EvbH62AO+jrb0Xx?=
 =?us-ascii?Q?AQ9lBgMth2pcOoYLUtOeDacadHJm+HWks7pQehwpkAiHhsOCn7EZ1jpA5HP+?=
 =?us-ascii?Q?6RZfZmp6PK+M755OA7SEuSdpxxj9yW2/za+pWmsvj44XVm4LMdH9XVzaX3Bp?=
 =?us-ascii?Q?empOPrwnpmRdUcwyp9nGQnj5JxKqFKSbMFAEEFfg+fAiX9If1qCKjtBPowQf?=
 =?us-ascii?Q?fyu9QD9vylzvpArOqfbQLIZ67/cmFiEJwmZOk9uioUnMweypdhPCtwvzcd3J?=
 =?us-ascii?Q?1/+y9wiBzURsDROP0jmok8ha3xm8iBpPAEuLj3USC+pUTtH0fcYaB0vQYLxQ?=
 =?us-ascii?Q?YtUK6L6kwGWpGJllk7KK5FAJT58QWZDycGkk3ZiyU1ZrMabe/nXbELYArP1r?=
 =?us-ascii?Q?HZEnBJW0PAPkK+ApY7NjLEHOK9QpEEDGIJsr9g0ntM1UjOz3akCmxXt+gtJM?=
 =?us-ascii?Q?WGncnhpm+6lDX+sn2iak2iNmXlt1oQa84eHPeyNoYWBnyemtNCNpTG2loFYx?=
 =?us-ascii?Q?yBOb6LAySwsu31fAyVkNksR2Oyn+csg5NsRrp4lL0jBotQO/KWQWIyococNs?=
 =?us-ascii?Q?Ldhf3/BYDSbjoVo1w7dmhRPW84zlFg9TvaEaTRJXof9yFShhU4ACC8A3ZI5u?=
 =?us-ascii?Q?jTMET1DJ+Kxpc3+orSESkp5Q25joGHJTtDDwkJ2TNtPk12Lw+Vr+7K/2jJin?=
 =?us-ascii?Q?GE7s+v2Q5pkAWSl5ZwD25zb8BfXLOvFyPZuG8U1LB0PbF75pyB9n58Y7XhhN?=
 =?us-ascii?Q?mwnv4N1AsDRq/QMDnosFrb0qHYSaGDyVUUBqF80reMOIGm6xhjm0bEiZrkzx?=
 =?us-ascii?Q?qlNyp9Yg353VeXR96IgT9N8aqz1f8y/46V1vdNvvspLhQa1BrboNgoqgua6l?=
 =?us-ascii?Q?E9acEksoYfiCTbDMb+STXMO1WTCy91zAzs7IpSy2NaUNCm+eUnoW/QHwKsoz?=
 =?us-ascii?Q?q373VX0MNDxxRYGgDvkAQJmXijfcQ9tRreGa6cJ40ExzzKWXrhZvMuuGF8FL?=
 =?us-ascii?Q?KGI+cqGafrFeQoqdO8xsr6Y42IkI5Sa92+oWZOVNFN3jPbWQiGVmFC0W+PL8?=
 =?us-ascii?Q?gAf1OelBBrZsq5Yi7OpKMcrrvLeVFQTXNS6+vq3zg6v0n4QtUirAUCv7L1a2?=
 =?us-ascii?Q?qW7pQscXvZMq2McU+o0EMr1X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb1d759-4216-4557-80f4-08d935b96f63
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 20:08:00.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pslo4s4UyKRIUSSqmses1MU4pZ1LDcqMLMbEZErT9VrDFbpAEotwwQpWT/sgx7hE/KcfgYL1R9YDSfl2aOjjZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2413
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On an AMD based Lenovo T14, I find that the module doesn't work at
all, and instead has a traceback with messages like:

```
sysfs: cannot create duplicate filename '/devices/virtual/firmware-attributes/thinklmi/attributes/Reserved'
```

Duplicate and reserved values showing up appear to be a firmware bug,
but they shouldn't make the driver explode.  So catch them and skip
them.

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/think-lmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

V1->V2 changes:
 * Don't show reserved objects either
 * Clear the object so it doesn't explode on module unload

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index d2644230b91f..4d8b5c185f8e 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -691,6 +691,16 @@ static int tlmi_sysfs_init(void)
 		if (!tlmi_priv.setting[i])
 			continue;
 
+		/* check for duplicate or reserved values */
+		if (kset_find_obj(tlmi_priv.attribute_kset, tlmi_priv.setting[i]->display_name) ||
+		    !strcmp(tlmi_priv.setting[i]->display_name, "Reserved")) {
+			pr_debug("duplicate or reserved attribute name found - %s\n",
+				tlmi_priv.setting[i]->display_name);
+			kfree(tlmi_priv.setting[i]->possible_values);
+			tlmi_priv.setting[i] = NULL;
+			continue;
+		}
+
 		/* Build attribute */
 		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
 		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
-- 
2.25.1

