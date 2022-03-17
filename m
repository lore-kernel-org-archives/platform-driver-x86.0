Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4296DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 21:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbiCQVly (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 17:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbiCQVlw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 17:41:52 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D15E317B0EF
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647553235; i=@lenovo.com;
        bh=3eqs4NLiBGkcfMYCGx9f5GHFdChic83pEByU6xs2ls4=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=y5l7r/OMJm60/8JYbNDuXdwV/70Xce9HJnZEbMzTC7C3EvC3TcD83WacdXF18ZJwU
         iRdKJwS8O3Dac6oxF1Dbl+fFScUmHzJGbH1oMsPI4dIjtXfysyenkNPOlQIUW/3gUK
         8bVh5HgJ74axEDbjfrGbpUvKAQsoXLvIX7cIByYHhe6dwxX6XZkawjOgedhwtCk5Jj
         M7lkwny7CHBbt3vF5ZZ6r4OuPy/MY8v71GzdQt8k+XNUlX/CcJRneI81I1zVwu0QwQ
         df6yzYgMkCZG2884cz5jCAmSoFwQzkLZApS1CpTELmlIS/f8KybCsHt5foWRqaRdhs
         oOFwvK6YT81Cg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRWlGSWpSXmKPExsWSoS+VqXt5lXG
  SwTlZizfHpzNZHJg6jdli9Z4XzA7MHptWdbJ5vN93lc3j8ya5AOYo1sy8pPyKBNaM5t4+5oIe
  qYpbp1exNzAeEe1i5OJgFFjKLHHn4xJ2CGcRq8T6hjNsEE4nk8Si7plgjpDAPCaJpk2bWCCcw
  0wSL9cdA3I4OSQEjjNKdK9yh0h0Mkrs3voDqqWfSeJI13omCOcJo8SbphfsEM5jRomGt49YQf
  rZBLQltmz5BdTCwSEiICPxYa0nSJhZIFLi6qPvTCC2sECixLf+NWwgNouAqsSuNW/YQWxeASu
  J/20T2CDOkJfo/vcH7CROoJozXY/BbCEBFYn7D5awQdQLSpyc+YQFYr68RPPW2cwQtoTEwRcv
  mCHqlSV+9Z9nhpipIPHu9GV2CDtBouffI6hdkhLXbl6AistKHD07BxoUvhIvV6yHsnUlTqxYC
  1WTI3G7bx4jhC0ncar3HBPMzTs33maZwKgzC8l5s5CcNwvJeQsYmVcxWiUVZaZnlOQmZuboGh
  oY6BoamuhaWuhamOklVukm6pUW65anFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgQmnZSipLA
  djMv7f+odYpTkYFIS5Z24wjhJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvIpCcYFFqempFWmYO
  MAHCpCU4eJREeCNB0rzFBYm5xZnpEKlTjLocV7bt3cssxJKXn5cqJc7buxKoSACkKKM0D24EL
  BlfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+xtkCk9mXgncpldARzABHdEoYARyREkiQk
  qqgUlyd5rQhymX2Ne8bT344f6WiDCGZRetlQ6Ibvizf6YI/9ldv+P5j2e+tuic9vpM06s/Pu9
  /51Yu0ntRKdb//Vbr6qa7+4/YXIwRYHuqzJZfr+sy6eWcey33VmTpFKXPS3nl+9WobdeyqKqi
  JNM03Uu7U7dFR+ow3E87to7px0M2tjlGnREsChFL657FCUz5+iM1ZybT8p/cH8om856YzMT46
  a/yjlSPc6xsb/g27Jkbp/vrqZn6j5uPXRc1PUrZ+KSq5uyJdU/bfTnneNY8ZTeJvbos3TMp3S
  F15d1rKzeFH/S5ellky2eTxyo5kfYaV73VYl78nbL5ymMVmwP6Jaem5J06yeqzfPFB3vze1uf
  nlViKMxINtZiLihMBvJvw+UEEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-24.tower-636.messagelabs.com!1647553233!4109!1
X-Originating-IP: [104.47.26.105]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18053 invoked from network); 17 Mar 2022 21:40:34 -0000
Received: from mail-sgaapc01lp2105.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.105)
  by server-24.tower-636.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2022 21:40:34 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBpPNPLuDCG5CcTWFStZLudphvSvD4O4uf85yuMSe2ws6oGFITv2B7LVs5a70qDcICCTGMiBvV9xW+2rILfcoq335aV9HS1w8gnUDQ4T+7X4e732/4pGX3DFXzlqQF+pWXxmcri2p2lpCch0k3yY8Pl76nLYiWdE3DlLdT9GPuhdsotfVa2Kgm19SowRO8t2Ldw5ftdDle/9UK87MGkOQAEQX3L3ay9mgWEU7vzlD2MjUmjszBlGLKuiyE1yWPiQnrDVvGKxZNOoN26JawDwaEHbZM6czZclFZfvCCKYrxz89Lt+IFf2yWyKSxbmUkerIYSnxL2EN/MxKzR0x8F8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eqs4NLiBGkcfMYCGx9f5GHFdChic83pEByU6xs2ls4=;
 b=FVRCmWNrsCEhEIwmrXeUGNcLiGJ+UvvDuFplplOr/f42pF1J8HbpdUl4/cYQbHEb7Z0Xv0SCDY4c9S59baBg1DPBvTYw33DM30zfLittjXMaGJGULC7XLPq74ZEoV7QEss6Kd+Aw+csuLVjyrvwpudD45czfXZvbpKIMTkhA+fk5DNE4KS46+/1WsVFSCE3h8Zd2RvVXPzQgHieCI9qyX22xOEkVTN5OD/iZQdWhmL9b4ZojX8dsAM5CsHi0EKIryPoWp+larF8egG/1I5S3Gu0zQD9YtwPNR4Dhqs6O44El0Dc0UfUEGSLuoowKgh0UdmDqqQJmyXH2zHlqsPQ2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS1PR03CA0012.apcprd03.prod.outlook.com (2603:1096:803:3d::24)
 by TYZPR03MB5520.apcprd03.prod.outlook.com (2603:1096:400:5b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.7; Thu, 17 Mar
 2022 21:40:32 +0000
Received: from PSAAPC01FT010.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:3d:cafe::8e) by PS1PR03CA0012.outlook.office365.com
 (2603:1096:803:3d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.13 via Frontend
 Transport; Thu, 17 Mar 2022 21:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT010.mail.protection.outlook.com (10.13.39.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 21:40:31 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 17:40:28 -0400
Received: from x1carbon10.home (10.85.81.173) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 17:40:26 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v3 1/2] Documentation: syfs-class-firmware-attributes: Lenovo Certificate support
Date:   Thu, 17 Mar 2022 17:40:07 -0400
Message-ID: <20220317214008.3459-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.85.81.173]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8f864f4-4427-42f2-691b-08da085ec2e4
X-MS-TrafficTypeDiagnostic: TYZPR03MB5520:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB5520F80384ABF7A8E28655D8C5129@TYZPR03MB5520.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: paSMjUP/LTcmHrUhK+4Ff943BsM9gaHj/MzQZhUWqL9RXWCG2Y5QUlQVb20+frDBRk9GlmcNy52ka09/2a0ZKnBTysvgR3ns5c1WEzP5wd9v790O1aoQrrDSts4IQG/MFsejOxur1pXlDkWQ6MzZUsBYhMF8V1HDEWcWEFG8NxrTeANy+jRxQL5jh5Ktw9nJglM36OzwDdoqSPkM1iLwKnyo004HMYf+SB8OnpijdqIvmQduZHV20EIlhU0U+O9W3TVzCkKOQIzttU3b1LIqkn8QneKtll95q0FFXUcEuIO4OHUOQYaVIcv5tXWmJS2ss0zEkmKJ4z+LdYfIXgeED0Q4Js2TFtI9/86ylFZg9FfmMfxyU9z0uIO39K3oBIug2e46IFLlOHa2/wK/HqSuFPHp8IQ3eurOGX9GRoi3M4X/gQkkb13KjiJsSZXwSsfftDKAiAzzp66boUWmCWX+czy0bSF3K8KLD3rXDeaFKW0cpeDI9yjUn6bFqMPM35RS1Uzdad5Z5LF7Jv11jfq8HAMnWsemPT/99S+2UCrgfkm4mpQRhZ6cmeCjfp94LTRS7lM43yEjWTNIK2se7+mHglNKeEYAQRQkdDF6uJ6zitxG+aIppNJKYBKqX08QibnvatyUw8EISc1XwTzP2qCw8NyZ+00yWdgJW4lswP5sFpWZl/xbJnUMn7ZbdUodWI2rZoHoH/FNBojXVWhVhXbsqJ0ZpaCrSH+XPOxl0cQj/axI2HNWup1HE6zdLks89WlLtqDzx6zl5CtCAjJVSvL4Tg==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(36860700001)(37006003)(54906003)(36906005)(86362001)(7049001)(8676002)(82960400001)(36756003)(4326008)(6862004)(8936002)(82310400004)(70206006)(70586007)(356005)(6666004)(47076005)(40460700003)(83380400001)(26005)(186003)(336012)(426003)(16526019)(2616005)(81166007)(1076003)(5660300002)(6200100001)(508600001)(2906002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 21:40:31.1668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f864f4-4427-42f2-691b-08da085ec2e4
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT010.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5520
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Certificate based authentication is available as an alternative to
password based authentication.

The WMI commands are cryptographically signed using a separate
signing server and will be verified by the BIOS before being
accepted.

This commit details the fields that are needed to support that
implementation. At present the changes are intended for Lenovo
platforms, but have been designed to keep them as flexible as possible
for future implementations from other vendors.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - Combined set_signature with signature and moved save_signature under
the authorisation folder
 - Fixed mistake in example for clearing certificate

Changes in v3:
 - Added clarification on certificate clear also disabling password

 .../testing/sysfs-class-firmware-attributes   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 13e31c6a0e9c..05820365f1ec 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -246,6 +246,51 @@ Description:
 					that is being referenced (e.g hdd0, hdd1 etc)
 					This attribute defaults to device 0.
 
+		certificate:
+		signature:
+		save_signature:
+					These attributes are used for certificate based authentication. This is
+					used in conjunction with a signing server as an alternative to password
+					based authentication.
+					The user writes to the attribute(s) with a BASE64 encoded string obtained
+					from the signing server.
+					The attributes can be displayed to check the stored value.
+
+					Some usage examples:
+					Installing a certificate to enable feature:
+						echo <supervisor password > authentication/Admin/current_password
+						echo <signed certificate> > authentication/Admin/certificate
+
+					Updating the installed certificate:
+						echo <signature> > authentication/Admin/signature
+						echo <signed certificate> > authentication/Admin/certificate
+
+					Removing the installed certificate:
+						echo <signature> > authentication/Admin/signature
+						echo '' > authentication/Admin/certificate
+
+					Changing a BIOS setting:
+						echo <signature> > authentication/Admin/signature
+						echo <save signature> > authentication/Admin/save_signature
+						echo Enable > attribute/PasswordBeep/current_value
+
+					You cannot enable certificate authentication if a supervisor password
+					has not been set.
+					Clearing the certificate results in no bios-admin authentication method
+					being configured allowing anyone to make changes.
+					After any of these operations the system must reboot for the changes to
+					take effect.
+
+		certificate_thumbprint:
+					Read only attribute used to display the MD5, SHA1 and SHA256 thumbprints
+					for the certificate installed in the BIOS.
+
+		certificate_to_password:
+					Write only attribute used to switch from certificate based authentication
+					back to password based.
+					Usage:
+						echo <signature> > authentication/Admin/signature
+						echo <password> > authentication/Admin/certificate_to_password
 
 
 What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
-- 
2.35.1

