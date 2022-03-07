Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92450C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Mar 2022 18:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244073AbiCGSdO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Mar 2022 13:33:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244843AbiCGSc5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 13:32:57 -0500
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B67A65801
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 10:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1646677922; i=@lenovo.com;
        bh=Y7EwYWq62Fbry2WkTn0CcTP50n733ClyXeNm3Wq5fSQ=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=GouRyb6Dlev/5YMstvvtUFK5GN+dk7vKkmOGeqI/fGlL0l85Sih2PwN0+TrKlD3OG
         qYoxaVvQBHqvm5WA9ESmBc3doou+qmO+lO6xjAQQBGAIMjRjrSs7ldjkIlAxlN6wjJ
         8Pq8KWiC3TsbeJ4SZaAgf42SPKWjqD0UG1yXzJ+b72m+pZc26gTHSuOed2jf3y7JvJ
         XE9mAGsxhL4u8wGWmL+MdXtpbMMnljhHokrjoI5Ydw+KXGNCs8BZuN1iRO05CdvIQc
         /tVy++J1+6X3uXJCZIf7Sko+f3w5qr4kDmmcvfOcTMOCtCtvItAqg55Sv8FvMLbSP+
         W/+S86N+hJXiw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRWlGSWpSXmKPExsWSoS+Vp7vIXy3
  J4NgxEYs3x6czWRyYOo3ZYvWeF8wOzB6bVnWyebzfd5XN4/MmuQDmKNbMvKT8igTWjLdrrQqW
  81XMmKnfwPiPu4uRi4NRYCmzxKQ3nxghnEWsEv8vHGKCcDqZJBZ1z2QDcYQEZjFJPG++zwLh7
  GeSmDLtO1CGk0NC4DijRPcqd4hEJ6PE7q0/oFomMEm03dnICOE8ZpQ49qWDGc65P6+ZFaSfTU
  BbYsuWX0AtHBwiAjISH9Z6goSZBSIlrj76zgRiCwt4S8x//58FxGYRUJH4PuEGI4jNK2Alsf/
  mKxaIM+Qluv/9AbM5BVQlznQ9BrOFgOrvP1jCBlEvKHFy5hMWiPnyEs1bZzND2BISB1+8YIao
  V5b41X+eGWZm66OpTBB2gkTPv0dQL0tKXLt5gR3ClpU4enYO1A2+Ev8vn4Wq15U427IbqiZHY
  vOhE1C2nMSp3nNMMPN3brzNMoFRZxaS82YhOW8WkvMWMDKvYrROKspMzyjJTczM0TU0MNA1ND
  TRtTTTNTKx1Eus0k3UKy3WLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECEw6KUUJP3cwrur
  /qXeIUZKDSUmUt9ZLLUmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO8uH6CcYFFqempFWmYOMAHC
  pCU4eJREeKtBWnmLCxJzizPTIVKnGC05rmzbu5eZ48GJk0Dy2voF+5iFWPLy81KlxHnj/YAaB
  EAaMkrz4MbBkvQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8C3yBpvBk5pXAbX0FdBAT0E
  F2RmAHlSQipKQamKyCaiLjj3SUpp7/0nh34sOcq6ax/yrSz+wxE3yWZFK1cH7sAT/xuG8LJvw
  VOGTMNDHKS6f8eElD4bXlW1inSPpyznozs2N+zYaey05Tc9/KzrlQuvDKqb5yy8khB3Y+Yd0r
  /Txsa9yxFZ5q92ZNWHzh0SfDLwtPnuU3KlAqjPYRXjFh+YGZZ+KZ15TV1AcsuKE/Q+PwYU2nY
  t+5l3yX94bf4jvKeCf6XOBaPe7Fs9NWScwrjeRwk05Yb1vBxNozidlQ++Qn+cLp235vW/HzS5
  NNlPA+d7HXh1oK7G4Luwu02C3RaRa/p7e8X2e3sMO/xm+c/7x4JvJty5scN+/Z9NNajj5y3f6
  Rf+Pl83Y9eqrEUpyRaKjFXFScCAA+za2TTQQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-10.tower-636.messagelabs.com!1646677920!9786!1
X-Originating-IP: [104.47.26.110]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12799 invoked from network); 7 Mar 2022 18:32:02 -0000
Received: from mail-sgaapc01lp2110.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.110)
  by server-10.tower-636.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Mar 2022 18:32:02 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFoDCnrd3Z/GyG+vpjZq4peknynsYAJpHed8CgFQSTLDrSDdGugpFv+dvRhk+kRZQjEbUJ3/UqZAvHJy6zGpYxC9nUqO1TwfVEH2DFRQrKo8B5qjZH1negjoGIo10oaEWrzaNOzK9sWTtpUG6gZngMQ5hsMlm6jiGRcJEVw1+82L8RQIeWmszYeew2oz3iYNMWWGBIz0W0Nt+Q8r7gSt783G7AjJ6RDvVAvLwBBPUZglefG31ggeJEuQviGpnc3DWCNjMvlwhpBYM5Ut4mVWw67JohYz71tZqsLDXolJv/PYqCf6z0SwerIdOtNQQ7DPTundraLuQUqqs9yn8yzLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7EwYWq62Fbry2WkTn0CcTP50n733ClyXeNm3Wq5fSQ=;
 b=gmtPRbZTUGuy7dlyUN/YS7DebkCeieWUvGZFx4IEbSwEezkQAWZ4Bo3RJHg155QPSr88zW3JpLrNTgJYyv0dPkBPVz1j58Vsad6WPf31CAOPAFoZujFvXXKjb+flgM3TT4mkYBD1wVq25GjbLG0fAZ0wvTvMGzzVvaL8vuB3PP8qOoZpuzGe9zOiShONgVGcp6aX9lFhoqIUzrJim0hv3t/1rJjLKqFpPJJcuKNcaujtQRWnabwHy0QAWABD9gtqBQY1w0M+zBPKudg4dgInOeOQ5HigARPBsPD4xqGvnCQktl5PRTPrRM4sLp2bo2RwqnJsBtQqs8FQiO3qnd1SaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR02CA0102.apcprd02.prod.outlook.com (2603:1096:4:92::18) by
 HK0PR03MB2916.apcprd03.prod.outlook.com (2603:1096:203:1c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.8; Mon, 7 Mar 2022 18:31:59 +0000
Received: from SG2APC01FT0037.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:92:cafe::be) by SG2PR02CA0102.outlook.office365.com
 (2603:1096:4:92::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Mon, 7 Mar 2022 18:31:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 SG2APC01FT0037.mail.protection.outlook.com (10.13.36.190) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 18:31:58 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Mon, 7 Mar
 2022 13:31:19 -0500
Received: from fedora.Lenovo.com (10.46.49.99) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Mon, 7 Mar
 2022 13:31:18 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: clean up dytc profile convert
Date:   Mon, 7 Mar 2022 13:30:41 -0500
Message-ID: <20220307183041.4467-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.49.99]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b534753-8b6f-4c76-c2ae-08da0068c41a
X-MS-TrafficTypeDiagnostic: HK0PR03MB2916:EE_
X-Microsoft-Antispam-PRVS: <HK0PR03MB29164798E1DCDF69026A0E4AC5089@HK0PR03MB2916.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NFhJihqe2b+G9+eL5jsEpl/L9EhfZvMgbIbUBGcqXowNIzWz1A9CeuiiCBEqYEYvLThd78WBZOwN/kPVZmwysdYQpr9Ap3jsRdKdT12MGfreiWcyIiVqcsUF+L+6zkDfxCCzerPTL3E8TL1hhFnw1Dm1ijVx22mTDbBT6VbE8m0YYkiwAwXOQhurtQgJwzmWH8nVKRxxbHUl/K9oGLyRoMrgE0WYU3ARGyKl07FdFB7ZJGINOKrCtoDpQhbhmydPEQeh44PG4PMsCBi12q4mBzc3Ygtc2BV3d52lnIFlkWfrzlcD9pTEaZPpkRC08pmrl2fITZiUZq7GoTaRq1MNbDSUl5Jaw2qMhrfJl5XCNBo8npM54Xroa9e7nJ3oPSiPehSpu2BYJM66wfLpCPwJ7LF4E3j5+9wPA3n5qS1shkNKFLKG508B51pSmxX+nLMEiJNKIkZHe9l4UdsjUPOfCH5K50HTcd5iSmoCP0MDHOCRX9fDFCr6tOI9B+NpdkSGpSiZVIOhegrQyqnInxbmf3Q/dSINF0Mfvr3fgSM3qV0chyqryIZnifH3+Apu5LERd6heLU/737jidJz6FCHgCykR+CToSnF6SW3TWZnJDcrttVkEWJxDHz/BlLcHKrKRkbefJnAppPDhQx9A4TsgrdVMkmeZmaIDfzUfb2oLqms7dxP++amboI6OZAuS1IPxjEfhVTn/IJbMQE+p+aC+tP787tR4tHOCOhbYJYufFI+93feBukPK3lbTviCvweQCSOLIzUTV8XmyUkScBRWz3Q==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(4326008)(26005)(8676002)(6666004)(7696005)(5660300002)(83380400001)(6862004)(82960400001)(426003)(16526019)(2616005)(186003)(336012)(1076003)(8936002)(70586007)(47076005)(508600001)(36860700001)(2906002)(7049001)(40460700003)(81166007)(356005)(86362001)(36906005)(82310400004)(316002)(37006003)(54906003)(36756003)(6200100001)(70206006)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 18:31:58.7565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b534753-8b6f-4c76-c2ae-08da0068c41a
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB2916
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Minor update cleaning up the code around convert_profile_to_dytc as
identified in the previous commit.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index d9117f824ce9..cb8f52be8253 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10298,6 +10298,7 @@ static int dytc_cql_command(int command, int *output)
 static int dytc_profile_set(struct platform_profile_handler *pprof,
 			    enum platform_profile_option profile)
 {
+	int perfmode;
 	int output;
 	int err;
 
@@ -10305,6 +10306,10 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 	if (err)
 		return err;
 
+	err = convert_profile_to_dytc(profile, &perfmode);
+	if (err)
+		goto unlock;
+
 	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
 		if (profile == PLATFORM_PROFILE_BALANCED) {
 			/*
@@ -10317,12 +10322,6 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 			if (err)
 				goto unlock;
 		} else {
-			int perfmode;
-
-			err = convert_profile_to_dytc(profile, &perfmode);
-			if (err)
-				goto unlock;
-
 			/* Determine if we are in CQL mode. This alters the commands we do */
 			err = dytc_cql_command(DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
 						&output);
@@ -10331,12 +10330,6 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 		}
 	}
 	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
-		int perfmode;
-
-		err = convert_profile_to_dytc(profile, &perfmode);
-		if (err)
-			goto unlock;
-
 		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
 		if (err)
 			goto unlock;
-- 
2.35.1

