Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29721C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Apr 2022 15:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237460AbiDNPL7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Apr 2022 11:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354025AbiDNOli (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Apr 2022 10:41:38 -0400
X-Greylist: delayed 549 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Apr 2022 07:33:58 PDT
Received: from st43p00im-ztfb10073301.me.com (st43p00im-ztfb10073301.me.com [17.58.63.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CCEC337D
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Apr 2022 07:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1649946288;
        bh=563089Bi4m2a2vT+/CT0ZIjhqHGmj6LkH9hsIb85c0o=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=a5bGUEgU9hFtPlSL3d7yxFgh1Eqs88ScykzJsMWxY31ev2vjj9G0fSGZ9gmts2Efc
         rmT5OaZ79g9gbh4/vw9Y6hGmR0W0fjZXpuF1l9s+91VkWu8PukBwAPr4hNF1eaLw1h
         NTLrY1KKWq2gICaypKhc+xX76UvuMvA1CFEBbrGAKKimJ437WE4LZdsl/B+Sdhf1bg
         RtiYeAZHT59OmgonL8mktT6kHtbgYfCKgUCYT49Rdo63ZJGrPotJlEPwPw84FBO/0t
         cIJV6ElvFuAx28JYgDFhg6yCwuEYoF1WznBMibSiMd8Mu7JqQBNub/gVl1zn0kwH/o
         MucxuJ8qTIl3g==
Received: from hark (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
        by st43p00im-ztfb10073301.me.com (Postfix) with ESMTPSA id 6D6C5800560;
        Thu, 14 Apr 2022 14:24:47 +0000 (UTC)
Date:   Thu, 14 Apr 2022 16:24:43 +0200
From:   Darryn Anton Jordan <darrynjordan@icloud.com>
To:     thomas@weissschuh.net, platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: gigabyte-wmi: added support for B660 GAMING X
 DDR4 motherboard
Message-ID: <Ylguq87YG+9L3foV@hark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: XCpvPVv8-nbm80A_-D6-8yi_sK4_vLlH
X-Proofpoint-GUID: XCpvPVv8-nbm80A_-D6-8yi_sK4_vLlH
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1011 bulkscore=0
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140078
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This works on my system.

Signed-off-by: Darryn Anton Jordan <darrynjordan@icloud.com>
---
 drivers/platform/x86/gigabyte-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 658bab4b7964..e87a931eab1e 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -148,6 +148,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550I AORUS PRO AX"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B660 GAMING X DDR4"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
-- 
2.34.1

