Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25787C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 12 Mar 2022 00:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiCLAGH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Mar 2022 19:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiCLAGF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Mar 2022 19:06:05 -0500
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0703E30F47
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Mar 2022 16:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647043500; i=@lenovo.com;
        bh=7B596iFjZjG6ZyHEX02CPADXNL7gLBZ/0EFTDGkmJDE=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=Mfeoq2cEK9V+UZGiNwrGwBEwGSWZe8mxLbIPhBUCSy5ky8pRls4SeaTXJ1qBQM12b
         56MKi0grzAa6Npk7nU0eYQhIHTcuNpHwqQJ+MuvfR6zrLI6YU8IGeC8GaXXh3zZdiV
         3mtsevR8lmHFu2bBd6JTzJAw4n5QkhBs1TCcLWFmmJL41+H5V5sGeVqBaLCKSy3C4m
         TPx8bUzorTWp3AVzOLTppZ3ZPV688BT8sU73lg9rhLBkvjUOBHdesguLxTtJbkAkop
         lRBP+ZNWtkV6SvNdTSdg4lWLs7I35lBKwUDKa4vZF9/EIFhgSH3kYAcxgUVRf+jjLC
         eMkr3T/az3ZuA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRWlGSWpSXmKPExsWSoV9jqbv6sXa
  SwZk9MhZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGctObmQu
  +CNdsfrVDOYGxtniXYxcHIwCS5kl9v++ztbFyAnkLGKV2PeIBSLRySSxqHsmG4gjJDCDSeL5v
  62sEM4eJolvi9axgrRICBxnlOhe5Q6R6GSU2L31B9gsIYGJTBJLj8tBJJ4wSvxYOQFq1ltGiR
  WH94JVsQloS2zZ8gvI5uAQEZCR+LDWEyTMLBApcfXRdyaQsLBAnET74SiQMIuAqsSm43fZQWx
  eASuJzTcnQR0hL9H97w8LiM0JVHOm6zELxA0qEvcfLGGDqBeUODnzCQvEeHmJ5q2zmSFsCYmD
  L14wQ9QrS/zqP88MM3Pht04WCDtBouffIzYIW1Li2s0L7BC2rMTRs3Oganwlrj4+DVWjK/H4e
  CNUPEfi6seljBC2nMSp3nNMMPN3brzNMoFRZxaS82YhOW8WkvMWMDKvYrRKKspMzyjJTczM0T
  U0MNA1NDTRNTPVNTbTS6zSTdQrLdZNTSwu0TXSSywv1kstLtYrrsxNzknRy0st2cQITDgpRY4
  qOxinr/ypd4hRkoNJSZR39kPtJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvPPuA+UEi1LTUyvS
  MnOAyQ8mLcHBoyTCmwDSyltckJhbnJkOkTrFqMtxZdvevcxCLHn5ealS4rzzHgEVCYAUZZTmw
  Y2AJeJLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5ZUGm8GTmlcBtegV0BBPQER/VtECOKE
  lESEk1MHV5eu8M31EocOBF2jzLadvve31rPqC3ZLbSpG2NVY/+X1nx9JGxnd7bSgvB47N7zXU
  E9x+rffhnXcRhq/sKhp2KR9+xib1T/vh5Xadl9JeitoIzelcTXFskbltffnvy0Tb3Lw/OTjaa
  kZlYxXZNpT/A6taT55kNodVPduROqFuc3XixI/7cQSHJPFd9iWD/1efOG3yqTv+2rVaf4cPZb
  dxvSq+sTWMtEz5Z+GrqzlczcydqXvH517Z2w/0+MYfGjsZ/xpEC9noBV4Urvgesdr58Ym/Z8a
  fh6w7WHDBbsVj8F/cLtay0qgdV6X9ubg5jCtybUL/smNGddbwtt3Znr+5wPdS2afVOn9+5nd8
  vGrYpsRRnJBpqMRcVJwIAKTDTiD8EAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-30.tower-635.messagelabs.com!1647043497!13149!1
X-Originating-IP: [104.47.124.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14768 invoked from network); 12 Mar 2022 00:04:59 -0000
Received: from mail-hk2apc01lp2057.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.57)
  by server-30.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2022 00:04:59 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwd4QLPimqui4nwb8DVHjH1CTElnf7N30XZMD7r18rSt24t7ChTCTlUKeXEYtYURZ0amTxCyph6NTq2LKBuXxjY3Q9yetKe03FsDoChiLoThFIp96bkoJN21lfzBXAvT2LjUj52f48cfpDBWF8FX6oC7Np5bkU57AbL8g5cf2pLFluiKHq09mJ8XRC47BVxi9FwhY8DtmGAcb2zkF48TZO1uZviPg6oeJsq4s+SaxonbQoofu/sozMJpxc9sN5THeNeM+F5ACbwR/WxECX4HEdyzIaCHwOfYUqYC2fAS9F3AUAi0TwLC1frhBENf6CfQHVHDsv8nE8gR8J4tZ/phqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B596iFjZjG6ZyHEX02CPADXNL7gLBZ/0EFTDGkmJDE=;
 b=N7znOri/Bsd0Y3KzaEeg+PTjWNIDSAbEX6pywgNtQwPg/o1SEZJV5Blww0E8Rt3yJ3eJa7/jLEcIzywhpuukQHnkk01BCTAViFgyxeiBSqmEa+cYVtkEscIT/i1zAfUpBrWfuRhu2Ptkekc3UzzWx0vLfn0wSP0yInbQQx7ONxVqV9Z+8awhBJNFaIYCg20EW+KFszMMav3RYTQVto+0qe0jAAE/MTi5tG+D8S51/YHqrtlqenXkuFl+MG21v60vZewBuoJiazmJTByk+w+UUEMBwd6npUbcOPCi09ilIkwcvq+w4+0asb7m9ce6VlJuQdVa3CSe4J0Use5RIZmQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13) by
 HK2PR03MB4452.apcprd03.prod.outlook.com (2603:1096:202:23::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.8; Sat, 12 Mar 2022 00:04:56 +0000
Received: from SG2APC01FT0045.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:0:cafe::24) by SG2PR04CA0151.outlook.office365.com
 (2603:1096:4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Sat, 12 Mar 2022 00:04:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 SG2APC01FT0045.mail.protection.outlook.com (10.13.36.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Sat, 12 Mar 2022 00:04:55 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Fri, 11 Mar
 2022 19:04:53 -0500
Received: from PKOVACSXF1Q5S2Z.lenovo.com (10.85.90.15) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 11 Mar 2022 19:04:51 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH 1/2] Documentation: syfs-class-firmware-attributes: Lenovo Certificate support
Date:   Fri, 11 Mar 2022 19:04:38 -0500
Message-ID: <20220312000439.4143-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.85.90.15]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf426fd7-f8c6-4c85-3b44-08da03bbf0e7
X-MS-TrafficTypeDiagnostic: HK2PR03MB4452:EE_
X-Microsoft-Antispam-PRVS: <HK2PR03MB4452F1CC0DC417AD2F2D86FBC50D9@HK2PR03MB4452.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BkzzxnInSsMpV6/OVMtZpeLw5/TslQnHGqxgUWI4wmYDztc6w2o5M5WnxMpDus3/F1JIfcOyObAfVPPbQ3mh+Uu92VZ+vrVoccXVbbM7Jl2sCC8KK1n6EAuZkgzCCRQer9xGGMSbWMn/83UR01KGb89dZGla4CYrr0wPsgzClLZplyE9jVwENDK5eS+tMZ6fbemNDeYVJ3u63wJ66FEFNC9km7Zfmk9GCzKTLhRtE6d5YWGB40CeQHvzNw+l/3xVhMI69EngRw3U2tmMQOxD4jNDMmmEUxggg0eVx/joicZyz27G1ZGjB3sKqkNppSXRkfyO87AwvEqhRDu8SGx6KkIJcg4tJObahztz8k9eTTxP0VPCFybrbljYNdV/spSks+DUjpYt1zWJ977gQ13RnjG3MtuX+l+2DAh3daR1d6wcA16p4e9EBwJgJ16jqMK95PdyJq8yn+EOMrHi5eGLqLS2jfCn0MW9HJ4wSgeGkMIMIAHgKyfsKt4Ar19cfMsCLEGLTH39fN02gLSjk+qv3Bf3+iFb7yPoNuA6pa99b4IOLfYVZNXH97g9pblqlL8QoYOE+EatvyRtaO30LMda86mZECR//CbiKLQl6Iwjh/4alo2bVURoyIZHp98tI597dn9xUYJHeKwIumiyO3z+6qn0ofpFNfr6Xt/JBy55xpEcesLaAgc0lstP/N/YQFKtDXafn6Few3WHCfAQk7lhwhNDNB/7xperXRK42BMnYmJBRdcRr7ambYq4AhXumM+06xEouwcNcZcQYMSmCBBsVA==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6200100001)(47076005)(37006003)(36906005)(54906003)(4326008)(16526019)(36860700001)(7696005)(6666004)(1076003)(83380400001)(2616005)(426003)(336012)(36756003)(508600001)(186003)(26005)(70206006)(70586007)(2906002)(6862004)(40460700003)(356005)(81166007)(316002)(7049001)(86362001)(8676002)(8936002)(5660300002)(82310400004)(82960400001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2022 00:04:55.6644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf426fd7-f8c6-4c85-3b44-08da03bbf0e7
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0045.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4452
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
 .../testing/sysfs-class-firmware-attributes   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 13e31c6a0e9c..1d9c3bb1dbcd 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -246,6 +246,43 @@ Description:
 					that is being referenced (e.g hdd0, hdd1 etc)
 					This attribute defaults to device 0.
 
+		certificate:
+		signature:
+					These attributes are used for certificate based authentication. This is
+					used in conjunction with a signing server as an alternative to password
+					based authentication.
+					The user writes to the attribute with a BASE64 encoded string obtained
+					from the signing server.
+					The attribute can be displayed to check the stored value.
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
+						echo '' > authentication/Admin/signature
+
+					You cannot enable certificate authentication if a supervisor password
+					has not been set.
+					After any of these operations the system must reboot for the changes to
+					take effect
+
+		certificate_thumbprint
+					Read only attribute used to display the MD5, SHA1 and SHA256 thumbprints
+					for the certificate installed in the BIOS.
+
+		certificate_to_password
+					Write only attribute used to switch from certificate based authentication
+					back to password based.
+					Usage:
+						echo <signature> > authentication/Admin/signature
+						echo <password> > authentication/Admin/certificate_to_password
 
 
 What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
@@ -315,3 +352,18 @@ Description:
 		use it to enable extra debug attributes or BIOS features for testing purposes.
 
 		Note that any changes to this attribute requires a reboot for changes to take effect.
+
+What:		/sys/class/firmware-attributes/*/attributes/set_signature
+What:		/sys/class/firmware-attributes/*/attributes/save_signature
+Date:		March 2022
+KernelVersion:	5.18
+Contact:	Mark Pearson <markpearson@lenovo.com>
+Description:
+		These attributes are used when certificate based authentication are enabled.
+		The set_signature and save_signature are both obtained from the signing server
+		and both need to be set when changing an attribute.
+		Usage example:
+			echo <set signature> > set_signature
+			echo <save signature> > save_signature
+			echo Enable > PasswordBeep/current_value
+		The attributes can be read to display the stored value.
-- 
2.35.1

