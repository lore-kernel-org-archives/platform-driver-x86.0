Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1C8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 May 2022 12:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236527AbiEJMJl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 May 2022 08:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbiEJMJk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 May 2022 08:09:40 -0400
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 May 2022 05:05:38 PDT
Received: from ipmail04.adl3.internode.on.net (ipmail04.adl3.internode.on.net [150.101.137.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2EFE017856B
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 May 2022 05:05:37 -0700 (PDT)
X-SMTP-MATCH: 0
IronPort-PHdr: =?us-ascii?q?A9a23=3A6hNTIBAM10tsCOEBp4GGUyQVWBdPi9zP1kY94?=
 =?us-ascii?q?Js7kPRFaK288ZP4MArS4OgrjVOPVJiIo/tegL/QtKbtEXcF/Y7Hqn0Hd4BBE?=
 =?us-ascii?q?h4d3Msak1ZyX8eMBR/3cKG6PXVoTs9IDQc39HrjbiBo?=
IronPort-Data: =?us-ascii?q?A9a23=3A9sof6qBHnRKFexVW//jhw5YqxClBgxIJ4kV8j?=
 =?us-ascii?q?S/XYbTApDIk1TcDnGMZWGCAOfqKM2KjftF2YYSx808P75WHz4VnHQI5pClkR?=
 =?us-ascii?q?XgU+JPOCYXIc077MynIc8DPFR87s59AM4jpIZFvRBcwhD/0YuC79yUUOYJk5?=
 =?us-ascii?q?1bE5V2t1hlZHWeIdQ944f5ds75h6mJXqYDR7zOl4bsekuWHULOX82cc3lE8s?=
 =?us-ascii?q?8pvnChSUMHa41v0iLCficdj5zcyn1FNZH4WyDrYw3HQGuG4FcbiLwrPIS3Qw?=
 =?us-ascii?q?4/Xw/stIovNfrfTeEwWWfjZJwGRhH1MV+6vhwUEpyB027tT2Pg0Nx8R0WnT2?=
 =?us-ascii?q?Yohjo8R6fRcSi9wVkHIsOoHWh9bOypkNLJI/6XLZ3W6rIqSwwvPbhMAxt00U?=
 =?us-ascii?q?xpnYdFJo7Yf7WZmrqRDeGpXP3hvndme2LayVudrnMFmINPqIo4F/2EwkxnHA?=
 =?us-ascii?q?vs8B5POWaPH4ZlfxjhYuyzkNZ4yfOJHMX81ME6FOU0KYAtLTokilfupjT/ja?=
 =?us-ascii?q?zJZ7lmSoOw+/gDuIMVK+OCFGLLolhaiHK25Rnqlm18=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AbtR8oKzJvL7EhX5UFskCKrPwAr1zdoMgy1?=
 =?us-ascii?q?knxilNoHxuGPBwWfrOoB19726StN5yMEtMpTnkAsW9qBznhP1ICOUqUotKPz?=
 =?us-ascii?q?OW3FdAUrsSj7cKqgeIc0bDH4VmtZuIHZIRNDV+YGIK6/oSmDPIdurI2OP3ip?=
 =?us-ascii?q?xAm92utEuFkjsaEp2JPm9Ce36mLnE=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DEBACEUnpi//Qc8jxagRKDaoJStDs?=
 =?us-ascii?q?LAQ8BAUIEAQGFAoVBJjgTAQIEFQEBBgEBAQEBBwSBHIVoDYZFNgENAQE3AYF?=
 =?us-ascii?q?Qgn2xOIEBgggBAQaCXYMsgVwJgTyJQ4QggT0/gU6CUYE+hX+FbpVMgQ6CacE?=
 =?us-ascii?q?Xg1OBQZ4nS4FDpw8BlmKiU4QlAgoHFoF4gX5NHxmDI1EZD5BMjDZjOwIGCwE?=
 =?us-ascii?q?BAwmRbwEB?=
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail04.adl3.internode.on.net with ESMTP; 10 May 2022 21:30:32 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 24AC0GDT937472
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 10 May 2022 22:00:27 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 24AC0GDT937472
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1652184027; bh=zgDXePacKrrLj1U3EVRN6E7+eVExz+kUDQMX7cyM33c=;
        h=From:To:Cc:Subject:Date:From;
        b=FsNXpMuSFBtqshn7vphcxa8uaYZecAqoEeK/NMMcwDfyC+PfgmJqeu8Y1K98fOvMN
         pV470Ps6JF4ahuyLY7jfnqLpc8qQcadUxwasvafApFl76UWwvobRw2F873B9BJYx7L
         L8ziXghpaTmjorVwQv2uNVZlWBGM4Z6MfAPnHBXtF7COxhnbGyJvPBZjuxfrbp/ao4
         qd9IypYgREMuRPbchajDGBFBsK2WHaKNwfOVWJBsH9FSMKRxjQUcS8cBs6mfDsbCd7
         Xh1Y5NEigBzSN1Cz5TUWaFzHmblSsifIbF5sjPvOuQdMYV2XuVu6nGk2dx/RcOK+Gh
         NTLAZcJiqaZQw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     platform-driver-x86@vger.kernel.org
Cc:     Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH] Add support for Z490 AORUS ELITE AC and X570 AORUS ELITE WIFI
Date:   Tue, 10 May 2022 22:00:12 +1000
Message-Id: <20220510120012.2167591-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Tue, 10 May 2022 22:00:27 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Tested on my systems with module force_load option.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/platform/x86/gigabyte-wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 658bab4b7964..730b3f6f942f 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -149,7 +149,9 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z490 AORUS ELITE AC"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE"),
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE WIFI"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 I AORUS PRO WIFI"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 UD"),
-- 
2.35.1

