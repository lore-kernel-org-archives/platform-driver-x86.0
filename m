Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEF6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Mar 2022 19:57:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238058AbiCOT6e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Mar 2022 15:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351563AbiCOT6d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Mar 2022 15:58:33 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8944B56203
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647374236; i=@lenovo.com;
        bh=U3LmNuQQhQmHuLLeL9osPJKt+ouQFB+d92dDHOzInSY=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=mtDhAPOwJMf46CBpdlKWVYNLiZ9ORe06umshO/ro52Ccf9MgAlOVhlUmrc0N7BoVq
         ib+YOG4srH29kAepXfeP/uN0ionr34nt3mmkDrUSixwyl57m+YG15WiKkEj3/Nfjgt
         Q9crWS1Cfbyxxd7SP5MuynQ5AO7lwzipJaBRC46qdU5OWKoaTXHz3SsfmnS3UeFwJS
         UMrmNLDdkBoW+LXCfolOq+pfyM3vRXSHKl5T4u4tMGd7hX5xJ62JFK0vx73yDKwFIv
         ozUDKnBZUJ4FMHN2X+8gWge0EWSxz9Gz7lCDE4u82qYXpchp4jPRi3NwWYVKm4UGqm
         S91sMsbUHKOnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRWlGSWpSXmKPExsWSoS+lqzvnvUG
  Swdn9fBZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGaf6ZzAW
  bJKoeNi0kLGBcZJIFyMXB6PAUmaJBzdus0E4i1glXi2/wQLhdDJJLOqeCZYREljAJLHpwWR2C
  Ocwk0TbprNADieHhMBxRonuVe4QiU5Gid1bf0C1TGKSOPDhISuE84RRYu/vycwQzktGiU9z3r
  OC9LMJaEts2fILqIWDQ0RARuLDWk+QMLNApMTVR9+ZQGxhgUSJjeefgpWzCKhKHHo4mRHE5hW
  wkvjdPpER4gx5ie5/f1hAbE6gmjNdj8FsIQEVifsPlrBB1AtKnJz5hAVivrxE89bZzBC2hMTB
  Fy+YIeqVJX71n2eGmKkg8XHDTCg7QaLn3yM2CFtS4trNC1Dvy0ocPTuHBcL2lTg09QGUrStx+
  91GVgg7R+LyzAaoO+UkTvWeY4K5eefG2ywTGHVmITlvFpLzZiE5bwEj8ypGq6SizPSMktzEzB
  xdQwMDXUNDE10TXUNTS73EKt1EvdJi3dTE4hJdQ73E8mK91OJiveLK3OScFL281JJNjMC0k1L
  EMn8H44aen3qHGCU5mJREeQvLDZKE+JLyUyozEosz4otKc1KLDzHKcHAoSfB6vQHKCRalpqdW
  pGXmAFMgTFqCg0dJhNf3MVCat7ggMbc4Mx0idYpRl+PKtr17mYVY8vLzUqXEede/BSoSACnKK
  M2DGwFLx5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOGvQOawpOZVwK36RXQEUxAR8yT1g
  M5oiQRISXVwJR39bwny9bXey8XS8c0Nv50ObY9/qDTkVY3QT9ZU/V5YVH7pWRnWjW8ORfm+eb
  pOv7ISOurSecEDn8tWyu9emqWHYfikSRroSY5pjm9expffuLNSn4SOEtxXU9E2THe2Fmr6uXf
  /+Ta72PMPeXeiTceBafqLwafPJL01rSNyb5I+0yvj7Ja9nnpVzMt/Axjui+wZYR/6/lvad8pl
  Bm+pX1C3Sw11tx7u55opD1R0q/d95nHov/SboEv34w+O9/NWP7lt/wvFXWGMNsZ+hETC5818t
  mEGXsHMi6eGsgb4TapVkzXP5Vpr1StuRxXvEVn4cPvr63cH81g2Va+83Pfy1Sje1U31izy3p5
  iXnNfiaU4I9FQi7moOBEAOJCIckIEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-28.tower-706.messagelabs.com!1647374234!5513!1
X-Originating-IP: [104.47.26.45]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9899 invoked from network); 15 Mar 2022 19:57:16 -0000
Received: from mail-psaapc01lp2045.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.45)
  by server-28.tower-706.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2022 19:57:16 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJGbat28hyjT7CLRWo+Vjke09qaMICfPXai0VScuHp+iTmeYsA/fWqcE5lsU7PI1KIPvBs2Sij8SlikuyzkL1sNI3p9H8IvUd0uWFc1zfMCbRUPfG+gwS39V7H3s+AmkArr5mH9JuGjCovyjjmtmJktBjWxbv76WvlUp8/Pq5HKLTkCgkZI6w4crySFeWOr3KbDOLDd50WEv5WiDZ8nTpb2AkQq9bxv+khAEYUN5XYPUNM1JDq0cvXQrwuu3vuQ1fpP/bEaG3ca9PLzfdYGBflIH4MUE5CQyUxi8TpiLg9SpvAKT4HM8SGZhPmQ/X2zGbRqOh504DFeV1AmkTGQBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3LmNuQQhQmHuLLeL9osPJKt+ouQFB+d92dDHOzInSY=;
 b=bmaQS0g/fEUdRgJ6Bn2eZx2VvpPfh6P8+hv+usYj9BUqQEsYc2oXTwU2OiZl7T004zDRR+jonEouEX89nzaAU0W72zBzSLVVDelV1FTLjBBQff8skCTM3CiNoNR6Hu9PQwpzj3H8193l6b36QZH09nyac/V19+bPjp5o3RgoeEogQbQiXqG/sAyqmUF1r37bNvUk/WPDSsbJNl09zh//XaDb2uM3tx+NE5YuvY6WEW+m16V4wbHRxK8zgtSv08nnRKnDyiU2T2c51XRdVSHG45gtd5ksyqv5o+O4pIwD4XVl6gYPCLVVb1ytjyRbSuSXcPi9To5HIaub7rOF7ysDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20)
 by PSAPR03MB5366.apcprd03.prod.outlook.com (2603:1096:301:16::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.10; Tue, 15 Mar
 2022 19:57:12 +0000
Received: from HK2APC01FT022.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2:cafe::5e) by HK2PR0401CA0010.outlook.office365.com
 (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Tue, 15 Mar 2022 19:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 HK2APC01FT022.mail.protection.outlook.com (10.152.248.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 19:57:12 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Tue, 15 Mar
 2022 15:57:10 -0400
Received: from x1carbon10.lenovo.com (10.85.90.243) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Tue, 15 Mar
 2022 15:57:08 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2 1/2] Documentation: syfs-class-firmware-attributes: Lenovo Certificate support
Date:   Tue, 15 Mar 2022 15:56:29 -0400
Message-ID: <20220315195630.3209-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.85.90.243]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b98d9d49-4c70-4a95-9765-08da06bdff26
X-MS-TrafficTypeDiagnostic: PSAPR03MB5366:EE_
X-Microsoft-Antispam-PRVS: <PSAPR03MB53667EE8BE08B4541B0DEB99C5109@PSAPR03MB5366.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3cOE7kgK0Xg+WhGqJxzJBnPuQBq/WdobPgw7jMXqNafVbVIIDUqv2fpafKhmmseJ8F/uKx1VF+GdaxzqxPWDAofthuoVkMN+itrTe0HJqY98vg7/zK3kaHRh+p5xosUtUIj/CjyZzi904Sk6DFaeQKXJQtKn9JvUVfB9qJ5eKiv18+39r9HT6v3oKx0AohwzP4K3kN7sOB+K2WWGcwrhRLomCuPcivhC9d67ceiOPkBR2xxRSRD4gCTubZCJvpr5y0drcW/Tr1+izIzOF1hUd1/UKjKxIFZMNCHvijN4/aQDJOkEmBsJOkDPYEO0fAdLyeaFnWJkJCP/GFtxS6AYqYK7subpeE/mJUx2kq4/03fKxQQ9RTfLbWZ1/IFa5Wa8Fci0RVitYTOFcqqIsQVapqpNtXrSHw+gB0rEU5EM1eXtDpABpanK5aPWWTPh8K2FxJ2IE5scqIkAjHlKMsggAkBwb3Mv5Nd4eCorBpGlKps6yKLXl8Gs4gz3iP3s1yL3k36Cpf0HVyxZLqcEFGcYAmJcS9HWFsz6IIcWA3R0nDceaKhAW0dP18VF1Ne65lb5TdHiPzfdYCd9fnuzqo3RlRog+17i/Q7eD++Irt26y7nKFasWvnLQIoHfI6U3Lnffi+VQZrs1MZxtr9AeDt9F20fATbBK20W47OgrvZX8nL8pF3A8nCVlY/fMC7DOo6nFBQdiuCnH60iVcWBHTV3VdBcoh7OFCKSdCeiYcgur1B5mnYn3gpAE8+K9rT1S7JSpddeHIEoRxkuiaGhD6ggceA==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400004)(70586007)(70206006)(6200100001)(81166007)(356005)(7049001)(2906002)(47076005)(36756003)(40460700003)(4326008)(6862004)(8676002)(316002)(6666004)(5660300002)(8936002)(7696005)(426003)(336012)(186003)(2616005)(86362001)(26005)(1076003)(16526019)(508600001)(36860700001)(37006003)(83380400001)(54906003)(82960400001)(36906005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 19:57:12.0651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98d9d49-4c70-4a95-9765-08da06bdff26
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT022.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5366
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

 .../testing/sysfs-class-firmware-attributes   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 13e31c6a0e9c..7ad52cf70ac9 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -246,6 +246,49 @@ Description:
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

