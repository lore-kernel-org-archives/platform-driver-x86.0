Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4903AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Feb 2022 18:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiBYS0F (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Feb 2022 13:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbiBYS0E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Feb 2022 13:26:04 -0500
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F31E276D5A
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Feb 2022 10:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1645813530; i=@lenovo.com;
        bh=2SWAGrJSt+4LQaXKThxNWoVcDscodrhbuG5+ENKhRWI=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=WfgowcdOBo3cnQQUuo08wfsreDuXIuzyGq7CB8czkHXuqPcMB/91fSsJ7vYzp3gxm
         /Kj69J/oonncqkvq6v1ncbhCHTWC53wudcj6e+gaqielX7VQU2BR7LS0YLOiSE3lzH
         JOxcuq1fO/HFyCBopI0i8J2A5R8VGJxhub+XtlBEmYrHisUsfcjcE+7dVQzqYyNXRR
         aNx2RoQalQFZnMrYLscCA4NKuUD7bXCpv0QJXATcWcZL5bhCPOrzLpfoTLNo1Dsijw
         ptj4sAjRXXEUNdlUM832q3BUeO66zMgmYOicNAtsO/hBf9dYfR8iimy9zuoW+rcyL5
         ui0Qx3SfOOZUw==
Received: from [100.114.6.245] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-east-1.aws.ess.symcld.net id 6A/B5-07257-A1F19126; Fri, 25 Feb 2022 18:25:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRWlGSWpSXmKPExsWSoS+VryspL5l
  k0P7f2uLN8elMFgemTmO2WL3nBbMDs8emVZ1sHu/3XWXz+LxJLoA5ijUzLym/IoE14+Ozf4wF
  d/wqtv0+ydjAuNmxi5GLg1FgKbPE/o2PGSGcRawSV1e+gHI6mSQWdc9kA3GEBOYxSZz5to8Vw
  jnEJLHt/iGWLkZODgmB44wS3avcIRKdjBK7t/6AapnIJHH5y2tGkCohgSeMEm/OqEEknjJKnO
  56xgSSYBPQltiy5RdQBweHiICMxIe1niBhZoFIiauPvoOVCAs4SfTt/8oMYrMIqEpM2f2SDcT
  mFbCS+L5hDyPEFfIS3f/+gF3ECVRzpusxC8ReFYn7D5ZA1QtKnJz5hAVivrxE89bZzBC2hMTB
  Fy+YIeqVJX71n2eGmKkg0daylA3CTpDo+fcIypaUuHbzAjuELStx9OwcaEj4Sqz8+xfK1pXYv
  /wL1JwciVu/FkHZchKnes8xwdy8c+NtlgmMOrOQnDcLyXmzkJy3gJF5FaNVUlFmekZJbmJmjq
  6hgYGuoaGJromukYGpXmKVbqJeabFuamJxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYNJJKWI
  5u4Oxreen3iFGSQ4mJVFebknJJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvPxyQDnBotT01Iq0
  zBxgAoRJS3DwKInwHpUBSvMWFyTmFmemQ6ROMepyXNm2dy+zEEtefl6qlDhvgjRQkQBIUUZpH
  twIWDK+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdy7IJTyZeSVwm14BHcEEdIRBvBjIES
  WJCCmpBqaFWw4wfri/YwazWtyK5G/5c0OqY14w5yve7H/ketZVfMcbp0rGeX2h82MZZrDsff3
  i0xshD58Zb+db7OOf9NvjIqvOM/3cwDi5a5M3TQnz5Fhxg/nj7C8y5/1DLrJ+P1pVZDol9Hsb
  x603fiVyB37EXHc//KH2/IzKCAZ+beXowobPKw557bq5zLbCu1tLf9vR1gRXj2+NDwzU11fc/
  fUigS9x143znV4uyv92mV5Rz3JMkC/csn39ZVU2uQk5Uuqr511t02382LDl74X66EoOPdeJFQ
  cLfMvn1xuu2HOXW6Kx6fPBq9MvxEk9m9j00KEuc0pYQOHjxbpb+S9rH3nVkDfttu3zONeD4kL
  PP8grsRRnJBpqMRcVJwIAcaIIG0EEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-18.tower-686.messagelabs.com!1645813528!20374!1
X-Originating-IP: [104.47.26.111]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21099 invoked from network); 25 Feb 2022 18:25:29 -0000
Received: from mail-sgaapc01lp2111.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.111)
  by server-18.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 Feb 2022 18:25:29 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRPwj5iFc6wPwqwhuakqYMCy9CRWOUuEFGKsM38UxL2v4+PAQdukCHxX0I9s++GVKVEvQF3ZPSE6m0L3iRZwdKsiwLxigSl5V+yoxAWNTyK4/UGz69BlMTx4JnxTZ3uPnBMx2cEncguW0wmty0nCYAo8uxFjKEHdzTKKQTDCKB/m53ZAgoH83gPUl97aJ2Hw4PH71Mx1pMT7AvKWurHzwoSaHast2K56e07vOXLQZirprqDnAEu40Gvbk1z/TQjaCssykISsA66a42C77JiLyDX5L/JZ8ESS5ptqlXu5Q1RF/k1y5JXD7m4StFNqImY+UdMi/N5/B0HHkW0soMVmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SWAGrJSt+4LQaXKThxNWoVcDscodrhbuG5+ENKhRWI=;
 b=RiUYSX1JQi+EqTfLLgMqb7FDoUgniOjfGPXWLH8iaxNhl/cX7tnlLA9ePEBmQeBt94FSN7QihyhtnOmRv7qroxsuyGRAusHMVOVHAdydG+tdBjy8bE4BRQPTEjqSwmiUDHnQrMwlk25Adlvsqc7vc5Cen0Sodt40BZ4HA3vrytU25WkkfNgR4/eXE8LnG2cJVrOfKWE0LluufkL+/MmL94uwF3wBuH7PhZeUT/3lZJOrkWhZWMPb9Ib0uPUZx1eppaeFqL710Gb/qYkHR1ZcoG/ha2lHg3kkrPHKkggpUW00k+4lvUUw83y8RhVQWLZa9kOZex0oIY/AJjKhcIuyDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SI2PR02CA0015.apcprd02.prod.outlook.com (2603:1096:4:194::16)
 by KL1PR03MB4630.apcprd03.prod.outlook.com (2603:1096:820:13::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.19; Fri, 25 Feb
 2022 18:25:27 +0000
Received: from SG2APC01FT0037.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:194:cafe::62) by SI2PR02CA0015.outlook.office365.com
 (2603:1096:4:194::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.25 via Frontend
 Transport; Fri, 25 Feb 2022 18:25:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 SG2APC01FT0037.mail.protection.outlook.com (10.13.36.190) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Fri, 25 Feb 2022 18:25:26 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Fri, 25 Feb
 2022 13:25:24 -0500
Received: from fedora.Lenovo.com (10.46.54.245) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Fri, 25 Feb
 2022 13:25:22 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add PSC mode support
Date:   Fri, 25 Feb 2022 13:25:05 -0500
Message-ID: <20220225182505.7234-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.54.245]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93198e1a-e9dc-41e1-5350-08d9f88c31de
X-MS-TrafficTypeDiagnostic: KL1PR03MB4630:EE_
X-Microsoft-Antispam-PRVS: <KL1PR03MB46308B0EC13417F444895A3EC53E9@KL1PR03MB4630.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2rul2jPJsYnh/r1sMNZ+7GY18WgG90b+ss1TWWouphBCrPkqKlo2hwpyv9EAk7jiGLPhiOdoO+VgjWLnHnXNU63t6ptgDMPM3qMfhjnlPdOhuXn77J0Hh8AzD43T/t4KWF3qrRBH98AWL+01Y+luZAP8B7saL8z6O61cKs8BT6VZsyIdAt5lT8KCmmHkfPhI0NJsO4Jd76fBqpKATs33N/gtrDxNF0mT25hufPm1U/3x3AcsOk77AUAaY5gXQCVXLydJknkrxXxCpUJAlebdNBIBJvpsfUElwzmN5Pin53BGn5wgHXIl1boYA8RqjMf2j6oFIRUx29wP+nUvjgMyJweDrXXwe0ufaqUS3wR/BtsLI4FwMmqhIXGcct2S4Y3HHSDBf7XMFnTrZW89NpuZg0i1J9iq4YPNudCYZ6H4MkY7yoNdEAFRxHWSxZsTyizjJgZQ27LfQ8w8tQGtdEHKOA6myzNonqZdh1DIxkVUuqx5nLV5wp0M4mIe31nYXwV9Q7uhGaz7875G80Y9bdEKWsGpM4nXNhpfJufk4Zb/5YexHpY4NSoM24TW9IfcFDcSVwuccpkf1iQGbxjSjuQtzjyBwsGPJg0WoaH5Z2ywDyG0r8vnrUl4Dtab3AwvUc3zM08RhlAMvPD2C3RlGVAphDCx+95akVjw8nup1GR+2s+WhxhsfxJ2Re9VwheLKPjGD/zlLUY3fQSZuS3dgg+mLkpii6XEHldrBBP3za4VsGoDjitKfPrtM/5U/GzYN+1T
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(81166007)(316002)(2616005)(186003)(82310400004)(54906003)(6666004)(36906005)(356005)(5660300002)(36756003)(426003)(1076003)(8936002)(336012)(8676002)(4326008)(6862004)(7049001)(70586007)(7696005)(40460700003)(16526019)(82960400001)(6200100001)(26005)(47076005)(70206006)(37006003)(36860700001)(508600001)(86362001)(2906002)(83380400001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:25:26.0243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93198e1a-e9dc-41e1-5350-08d9f88c31de
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB4630
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Lenovo AMD platforms use PSC mode for providing platform
profile support.

Detect if PSC mode is available and add support for setting the
different profile modes appropriately.

Note - if both MMC mode and PSC mode are available then MMC mode
will be used in preference.

Tested on T14 G1 AMD and T14s G2 AMD.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 172 ++++++++++++++++++---------
 1 file changed, 119 insertions(+), 53 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index d0599e8a7b4d..d9117f824ce9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10130,6 +10130,7 @@ static struct ibm_struct proxsensor_driver_data = {
 
 #define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
 #define DYTC_FC_MMC           27 /* MMC Mode supported */
+#define DYTC_FC_PSC           29 /* PSC Mode supported */
 
 #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
 #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
@@ -10140,12 +10141,17 @@ static struct ibm_struct proxsensor_driver_data = {
 
 #define DYTC_FUNCTION_STD     0  /* Function = 0, standard mode */
 #define DYTC_FUNCTION_CQL     1  /* Function = 1, lap mode */
-#define DYTC_FUNCTION_MMC     11 /* Function = 11, desk mode */
+#define DYTC_FUNCTION_MMC     11 /* Function = 11, MMC mode */
+#define DYTC_FUNCTION_PSC     13 /* Function = 13, PSC mode */
 
-#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
-#define DYTC_MODE_LOWPOWER    3  /* Low power mode */
-#define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
-#define DYTC_MODE_MMC_BALANCE 0  /* Default mode from MMC_GET, aka balanced */
+#define DYTC_MODE_MMC_PERFORM  2  /* High power mode aka performance */
+#define DYTC_MODE_MMC_LOWPOWER 3  /* Low power mode */
+#define DYTC_MODE_MMC_BALANCE  0xF  /* Default mode aka balanced */
+#define DYTC_MODE_MMC_DEFAULT  0  /* Default mode from MMC_GET, aka balanced */
+
+#define DYTC_MODE_PSC_LOWPOWER 3  /* Low power mode */
+#define DYTC_MODE_PSC_BALANCE  5  /* Default mode aka balanced */
+#define DYTC_MODE_PSC_PERFORM  7  /* High power mode aka performance */
 
 #define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
 #define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
@@ -10155,10 +10161,16 @@ static struct ibm_struct proxsensor_driver_data = {
 	 (mode) << DYTC_SET_MODE_BIT | \
 	 (on) << DYTC_SET_VALID_BIT)
 
-#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 0)
+#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 0)
+#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 1)
 
-#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 1)
+enum dytc_profile_funcmode {
+	DYTC_FUNCMODE_NONE = 0,
+	DYTC_FUNCMODE_MMC,
+	DYTC_FUNCMODE_PSC,
+};
 
+static enum dytc_profile_funcmode dytc_profile_available;
 static enum platform_profile_option dytc_current_profile;
 static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
 static DEFINE_MUTEX(dytc_mutex);
@@ -10166,19 +10178,37 @@ static bool dytc_mmc_get_available;
 
 static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
 {
-	switch (dytcmode) {
-	case DYTC_MODE_LOWPOWER:
-		*profile = PLATFORM_PROFILE_LOW_POWER;
-		break;
-	case DYTC_MODE_BALANCE:
-	case DYTC_MODE_MMC_BALANCE:
-		*profile =  PLATFORM_PROFILE_BALANCED;
-		break;
-	case DYTC_MODE_PERFORM:
-		*profile =  PLATFORM_PROFILE_PERFORMANCE;
-		break;
-	default: /* Unknown mode */
-		return -EINVAL;
+	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
+		switch (dytcmode) {
+		case DYTC_MODE_MMC_LOWPOWER:
+			*profile = PLATFORM_PROFILE_LOW_POWER;
+			break;
+		case DYTC_MODE_MMC_DEFAULT:
+		case DYTC_MODE_MMC_BALANCE:
+			*profile =  PLATFORM_PROFILE_BALANCED;
+			break;
+		case DYTC_MODE_MMC_PERFORM:
+			*profile =  PLATFORM_PROFILE_PERFORMANCE;
+			break;
+		default: /* Unknown mode */
+			return -EINVAL;
+		}
+		return 0;
+	}
+	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
+		switch (dytcmode) {
+		case DYTC_MODE_PSC_LOWPOWER:
+			*profile = PLATFORM_PROFILE_LOW_POWER;
+			break;
+		case DYTC_MODE_PSC_BALANCE:
+			*profile =  PLATFORM_PROFILE_BALANCED;
+			break;
+		case DYTC_MODE_PSC_PERFORM:
+			*profile =  PLATFORM_PROFILE_PERFORMANCE;
+			break;
+		default: /* Unknown mode */
+			return -EINVAL;
+		}
 	}
 	return 0;
 }
@@ -10187,13 +10217,22 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
 {
 	switch (profile) {
 	case PLATFORM_PROFILE_LOW_POWER:
-		*perfmode = DYTC_MODE_LOWPOWER;
+		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
+			*perfmode = DYTC_MODE_MMC_LOWPOWER;
+		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
+			*perfmode = DYTC_MODE_PSC_LOWPOWER;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		*perfmode = DYTC_MODE_BALANCE;
+		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
+			*perfmode = DYTC_MODE_MMC_BALANCE;
+		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
+			*perfmode = DYTC_MODE_PSC_BALANCE;
 		break;
 	case PLATFORM_PROFILE_PERFORMANCE:
-		*perfmode = DYTC_MODE_PERFORM;
+		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
+			*perfmode = DYTC_MODE_MMC_PERFORM;
+		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
+			*perfmode = DYTC_MODE_PSC_PERFORM;
 		break;
 	default: /* Unknown profile */
 		return -EOPNOTSUPP;
@@ -10266,25 +10305,39 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 	if (err)
 		return err;
 
-	if (profile == PLATFORM_PROFILE_BALANCED) {
-		/*
-		 * To get back to balanced mode we need to issue a reset command.
-		 * Note we still need to disable CQL mode before hand and re-enable
-		 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
-		 * stuck at 0 for aprox. 30 minutes.
-		 */
-		err = dytc_cql_command(DYTC_CMD_RESET, &output);
-		if (err)
-			goto unlock;
-	} else {
+	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
+		if (profile == PLATFORM_PROFILE_BALANCED) {
+			/*
+			 * To get back to balanced mode we need to issue a reset command.
+			 * Note we still need to disable CQL mode before hand and re-enable
+			 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
+			 * stuck at 0 for aprox. 30 minutes.
+			 */
+			err = dytc_cql_command(DYTC_CMD_RESET, &output);
+			if (err)
+				goto unlock;
+		} else {
+			int perfmode;
+
+			err = convert_profile_to_dytc(profile, &perfmode);
+			if (err)
+				goto unlock;
+
+			/* Determine if we are in CQL mode. This alters the commands we do */
+			err = dytc_cql_command(DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
+						&output);
+			if (err)
+				goto unlock;
+		}
+	}
+	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
 		int perfmode;
 
 		err = convert_profile_to_dytc(profile, &perfmode);
 		if (err)
 			goto unlock;
 
-		/* Determine if we are in CQL mode. This alters the commands we do */
-		err = dytc_cql_command(DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1), &output);
+		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
 		if (err)
 			goto unlock;
 	}
@@ -10302,10 +10355,14 @@ static void dytc_profile_refresh(void)
 	int perfmode;
 
 	mutex_lock(&dytc_mutex);
-	if (dytc_mmc_get_available)
-		err = dytc_command(DYTC_CMD_MMC_GET, &output);
-	else
-		err = dytc_cql_command(DYTC_CMD_GET, &output);
+	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
+		if (dytc_mmc_get_available)
+			err = dytc_command(DYTC_CMD_MMC_GET, &output);
+		else
+			err = dytc_cql_command(DYTC_CMD_GET, &output);
+	} else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
+		err = dytc_command(DYTC_CMD_GET, &output);
+
 	mutex_unlock(&dytc_mutex);
 	if (err)
 		return;
@@ -10332,6 +10389,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	set_bit(PLATFORM_PROFILE_BALANCED, dytc_profile.choices);
 	set_bit(PLATFORM_PROFILE_PERFORMANCE, dytc_profile.choices);
 
+	dytc_profile_available = DYTC_FUNCMODE_NONE;
 	err = dytc_command(DYTC_CMD_QUERY, &output);
 	if (err)
 		return err;
@@ -10343,27 +10401,34 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (dytc_version < 5)
 		return -ENODEV;
 
-	/* Check what capabilities are supported. Currently MMC is needed */
+	/* Check what capabilities are supported */
 	err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
 	if (err)
 		return err;
-	if (!(output & BIT(DYTC_FC_MMC))) {
-		dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
+
+	if (test_bit(DYTC_FC_MMC, (void *)&output)) { /* MMC MODE */
+		dytc_profile_available = DYTC_FUNCMODE_MMC;
+
+		/*
+		 * Check if MMC_GET functionality available
+		 * Version > 6 and return success from MMC_GET command
+		 */
+		dytc_mmc_get_available = false;
+		if (dytc_version >= 6) {
+			err = dytc_command(DYTC_CMD_MMC_GET, &output);
+			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
+				dytc_mmc_get_available = true;
+		}
+	} else if (test_bit(DYTC_FC_PSC, (void *)&output)) { /*PSC MODE */
+		dytc_profile_available = DYTC_FUNCMODE_PSC;
+	} else {
+		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
 		return -ENODEV;
 	}
 
 	dbg_printk(TPACPI_DBG_INIT,
 			"DYTC version %d: thermal mode available\n", dytc_version);
-	/*
-	 * Check if MMC_GET functionality available
-	 * Version > 6 and return success from MMC_GET command
-	 */
-	dytc_mmc_get_available = false;
-	if (dytc_version >= 6) {
-		err = dytc_command(DYTC_CMD_MMC_GET, &output);
-		if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
-			dytc_mmc_get_available = true;
-	}
+
 	/* Create platform_profile structure and register */
 	err = platform_profile_register(&dytc_profile);
 	/*
@@ -10381,6 +10446,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 
 static void dytc_profile_exit(void)
 {
+	dytc_profile_available = DYTC_FUNCMODE_NONE;
 	platform_profile_remove();
 }
 
-- 
2.35.1

