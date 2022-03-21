Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D9CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Mar 2022 18:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351991AbiCUSIO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Mar 2022 14:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352053AbiCUSIL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Mar 2022 14:08:11 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5325EBDE
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Mar 2022 11:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647886005; i=@lenovo.com;
        bh=3oJhmg/weVMtNfYRwgqL0eiQGhlCeghD75ynrc1ZkHU=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=uwiUvF4N6kLGWc1+ZloCGE01YA6xn1riMaNzrj36S3cCBkym3X/bcbYKCOBpNQrHb
         0kPnkY5GeZdBTnw5aNMUTJLSVbC9k8C6X/rIK3tB6nmo6AOpJiCRckvpDJBJws7GZU
         v6PZkgGKbJuU7ZvEzkpUgbEd1/nq5EXWdtdM9ckTfS00F+NFzFDJg69QqoBIxriQCZ
         vGgfqfVAnTT5YaZgap4k0DU0ZaOxK94zFrXl3NmHcdqKEy8LD8zlv0HIdfc07/mxtc
         hNYc7H6Bn2mYAGbiqKAwZcGXu8qPZKfSwti3gChrHm5YOR+IVr3FGL/DtVeUMLMySv
         Tzj+tNe/nnopQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRWlGSWpSXmKPExsWSoZ+no7tln0W
  SwfMmdYs3x6czWRyYOo3ZYvWeF8wOzB6bVnWyebzfd5XN4/MmuQDmKNbMvKT8igTWjEd75jEW
  9MhV/FpwiqmB8YxkFyMnB6PAUmaJqSsjuxi5gOxFrBJLJy9nhHA6mSQWdc9kA3GEBOYxSUz78
  5gFwjnMJPHxdTMbSL+EwHFGie5V7hCJTkaJ3Vt/gCWEBPqZJN7d5YVIPGGUOPL8IFT7Y0aJy6
  //s4NUsQloS2zZ8guog4NDREBG4sNaT5Aws0CkxNVH35lAbGEBd4mZn9czg9gsAqoSDf8PgC3
  gFbCSeHSsixHiCnmJ7n9/WEBsTqCaM12PWSCOUJG4/2AJVL2gxMmZT1gg5stLNG+dzQxhS0gc
  fPGCGaJeWeJX/3lmiJkKErfvdrJA2AkSPf8eQX0sKXHt5gV2CFtW4ujZOVA1vhJLLzxihbB1J
  eb+OgVl50hM/XwP6k45iVO955hgbt658TbLBEadWUjOm4XkvFlIzlvAyLyK0SqpKDM9oyQ3MT
  NH19DAQNfQ0ETXTNfI1EAvsUo3Ua+0WDc1sbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMw5aQ
  Usf3awTi156feIUZJDiYlUV7DpRZJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4hXYD5QSLUtNT
  K9Iyc4DpDyYtwcGjJMJruAEozVtckJhbnJkOkTrFqMtxZdvevcxCLHn5ealS4ryye4GKBECKM
  krz4EbAUvElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8jSBTeDLzSuA2vQI6ggnoCH1WM5
  AjShIRUlINTI0v7kgfOsex2aZiR+n+CSkLjvzyDTt25Ni8pEnq5dEZmnLB7Xa5sjPTb5+KVnF
  SLKrXEEpJ7BK97pye+M5U6KAAq8++MxlfFt6Utvq5fJV4ZqrSmh/3RO+o/g29+HSdW1vc0vku
  h9XNDSNucX7dLruvuk7glNPG7+YXNzzODC57wXzXVKb5TOTn3AVbTCc7LYz4zRXyPyb/7Oyai
  ysv31GYvjbmgsQxu/nH49cld06+MUO9sp5tN5uW0IxGT7vPV/+pM7Ks8lBx2zJBeWuZcEB89J
  m2Gyn134wMH8Wy3fRRyt4gWMz8QaZcbypTamzF7jcTLZYLt9xMWjux/UGsW4s2S/9arfOp76u
  XT6z+oMRSnJFoqMVcVJwIANYnjiRABAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-686.messagelabs.com!1647886003!12352!1
X-Originating-IP: [104.47.110.44]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23204 invoked from network); 21 Mar 2022 18:06:44 -0000
Received: from mail-tyzapc01lp2044.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) (104.47.110.44)
  by server-16.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Mar 2022 18:06:44 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEa5zvn2YcPv255X2DnYx1cB2+8oP/NnRu9TYCzcUEKcbUzS59hxkGt+wpF0dNbZNyNIGM6E+MPeKIxo4OxmCsgj4wvjjEwKta8IaK/3vdzQCDwoLsVX0lQftIgtLRv7T8XfO6fkj23aVupAexvBW9m/X6RbBYJuGTffVevuIrnLUrmNaCjfVEWU9YWMExskvMLjmce3Oeb9bqgiSw6lJqq1eauS/iCN5WTf8MBnC3hP/AEwotHVY5BcGddew18mp58xQsK/IE+d5BU4z+XEJuKMs0Zki0IyjsmYfWeI0PNWAjRGrS1b5PCcr4M8BPzrtTYw1C2vC6KsN7CyfkmznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oJhmg/weVMtNfYRwgqL0eiQGhlCeghD75ynrc1ZkHU=;
 b=Gwte6V2GOuP0yB7xqeoJGBWxdye1XS6hOGGxMD05nLDTDTW7woa3IBBobtgL5wDcJkI+5509VOkUMmOviefVjO17yT00tRJcFwpbA9py6EMAXzEknk9Nu9eW6wsvUWxcpRQuGFe2Od3luV2Sa9pDZoIfzS7CUmpIm6vCVTJOPDc2rZXMq0IMSSAIquI9cpnGFZHhHBbcUBEtRNWcmWRKjPSoR4k4VCAGzodEUrwG9wycxuh2YA0VcOQlHjo2r+n57MNPFXfEHZD3qfztHaqs5rmV/E5cKh4VQzUePYnmHHoWDTHj7CyJVqz7xge85GMJuFyg9UUqmjlOgYsJVbD7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SL2PR04CA0002.apcprd04.prod.outlook.com (2603:1096:100:2d::14)
 by TYZPR03MB5246.apcprd03.prod.outlook.com (2603:1096:400:37::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.11; Mon, 21 Mar
 2022 18:06:42 +0000
Received: from PSAAPC01FT031.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:2d:cafe::bb) by SL2PR04CA0002.outlook.office365.com
 (2603:1096:100:2d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Mon, 21 Mar 2022 18:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT031.mail.protection.outlook.com (10.13.38.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 18:06:41 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 21 Mar
 2022 14:06:40 -0400
Received: from x1carbon10.home (10.85.82.121) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 21 Mar
 2022 14:06:38 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: think-lmi: certificate support clean ups
Date:   Mon, 21 Mar 2022 14:06:24 -0400
Message-ID: <20220321180624.4761-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.85.82.121]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 508305b4-6857-469e-69c4-08da0b658d91
X-MS-TrafficTypeDiagnostic: TYZPR03MB5246:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB5246D15CAFEF3B9AB7801CC9C5169@TYZPR03MB5246.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZjBgf2OIgDBdtC69IBwtnDUF/Ik8+rObBrtR4HdSdH1X/5/N23rWGdPr7O8AiFCKgJvnY6v/tqB5dW2XIj+CrbAfoP/BvSBzwj8Qz9kZRsNUUNnyBQg+SQTBXit3D37XoSs6w1HTUjM+kKj4IVL4s5hwOfQyz0Xxyk0vzqHR9NWKu+dZKuIX/OInbKXWHnnAkEPAndu/b+324A0Pz5POvTidbprTZA+bNUzFMHUZK/X13wU39dVn4F9UhRr03ffGDyGk9iE2K+Ff3y5F9o2IqICdbBDgfaWWvdgSwN2KLcXik0TRMQGFMJdZ6wlmJPZewhJPqC2Gx3YuhHmCZ2nGtILWanJ7NlHI7nUua/KesR9hDk9gCS9Jy6eTbXKjHK2fN5sG20xQzDpb+kvfs99O0x2vnThbG/L60eqmzxCTLkg+yYfFFzo0ea4NOuApy+qiFGpZkzRpQKb2nuJh8fHg3jHveOPhn/Qeaul36tPw9mHHXPp7XTUG7NWsk8R0Z/1gSJ4hVmiEDlp4uFZjIbc2odRTYh8vXOYSVgMdauEK9cTTulp51t723t/UUanSG804c23TOW2vkY596LsdzsOr7d04ydIT7pJxHNNbWnI9L/nMkHulMSrNNqZau08EVGZF2GlE9XO4cV8cV8ybxSXHaNfDxOW8ZYGRLcmUtMWUE3PhuihwMWfMyTdKmnDjsvv50rH+GxDxHzNkLIR6wD8jfw==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82960400001)(36860700001)(83380400001)(356005)(81166007)(26005)(36756003)(2616005)(6200100001)(8936002)(40460700003)(2906002)(5660300002)(70586007)(70206006)(86362001)(8676002)(6666004)(508600001)(426003)(7049001)(186003)(1076003)(16526019)(336012)(4326008)(6862004)(54906003)(37006003)(36906005)(82310400004)(47076005)(316002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 18:06:41.6535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 508305b4-6857-469e-69c4-08da0b658d91
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5246
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Complete some clean-ups as reqested from the last review as follow-ups
 - Remove certificate from structure as no need to store it any more
 - Clean up return code handling
 - Moved freeing of signature to before admin object released (issue
   seen in testing when unloading module)
 - Minor code flow improvements

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/think-lmi.c | 45 +++++++++++---------------------
 drivers/platform/x86/think-lmi.h |  1 -
 2 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 1817dd8d5d95..a01a92769c1a 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -740,16 +740,8 @@ static ssize_t certificate_store(struct kobject *kobj,
 	if (!tlmi_priv.certificate_support)
 		return -EOPNOTSUPP;
 
-	new_cert = kstrdup(buf, GFP_KERNEL);
-	if (!new_cert)
-		return -ENOMEM;
-	/* Strip out CR if one is present */
-	strip_cr(new_cert);
-
 	/* If empty then clear installed certificate */
-	if (new_cert[0] == '\0') { /* Clear installed certificate */
-		kfree(new_cert);
-
+	if ((buf[0] == '\0') || (buf[0] == '\n')) { /* Clear installed certificate */
 		/* Check that signature is set */
 		if (!setting->signature || !setting->signature[0])
 			return -EACCES;
@@ -763,14 +755,16 @@ static ssize_t certificate_store(struct kobject *kobj,
 
 		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
 		kfree(auth_str);
-		if (ret)
-			return ret;
 
-		kfree(setting->certificate);
-		setting->certificate = NULL;
-		return count;
+		return ret ?: count;
 	}
 
+	new_cert = kstrdup(buf, GFP_KERNEL);
+	if (!new_cert)
+		return -ENOMEM;
+	/* Strip out CR if one is present */
+	strip_cr(new_cert);
+
 	if (setting->cert_installed) {
 		/* Certificate is installed so this is an update */
 		if (!setting->signature || !setting->signature[0]) {
@@ -792,21 +786,14 @@ static ssize_t certificate_store(struct kobject *kobj,
 		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
 				new_cert, setting->password);
 	}
-	if (!auth_str) {
-		kfree(new_cert);
+	kfree(new_cert);
+	if (!auth_str)
 		return -ENOMEM;
-	}
 
 	ret = tlmi_simple_call(guid, auth_str);
 	kfree(auth_str);
-	if (ret) {
-		kfree(new_cert);
-		return ret;
-	}
 
-	kfree(setting->certificate);
-	setting->certificate = new_cert;
-	return count;
+	return ret ?: count;
 }
 
 static struct kobj_attribute auth_certificate = __ATTR_WO(certificate);
@@ -846,7 +833,6 @@ static ssize_t save_signature_store(struct kobject *kobj,
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	char *new_signature;
-	int ret;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
@@ -1195,6 +1181,10 @@ static void tlmi_release_attr(void)
 
 	kset_unregister(tlmi_priv.attribute_kset);
 
+	/* Free up any saved signatures */
+	kfree(tlmi_priv.pwd_admin->signature);
+	kfree(tlmi_priv.pwd_admin->save_signature);
+
 	/* Authentication structures */
 	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
 	kobject_put(&tlmi_priv.pwd_admin->kobj);
@@ -1211,11 +1201,6 @@ static void tlmi_release_attr(void)
 	}
 
 	kset_unregister(tlmi_priv.authentication_kset);
-
-	/* Free up any saved certificates/signatures */
-	kfree(tlmi_priv.pwd_admin->certificate);
-	kfree(tlmi_priv.pwd_admin->signature);
-	kfree(tlmi_priv.pwd_admin->save_signature);
 }
 
 static int tlmi_sysfs_init(void)
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index 4f69df6eed07..4daba6151cd6 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -63,7 +63,6 @@ struct tlmi_pwd_setting {
 	int index; /*Used for HDD and NVME auth */
 	enum level_option level;
 	bool cert_installed;
-	char *certificate;
 	char *signature;
 	char *save_signature;
 };
-- 
2.35.1

