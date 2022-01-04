Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A00C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Jan 2022 03:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbiADDtJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Jan 2022 22:49:09 -0500
Received: from server.foto-kaesberg.de ([173.249.50.97]:55343 "EHLO
        server.foto-kaesberg.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbiADDtJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Jan 2022 22:49:09 -0500
X-Greylist: delayed 441 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Jan 2022 22:49:08 EST
Received: from [IPv6:2003:c7:f722:b200:aab6:2f1b:b535:7005] (p200300c7F722B200AaB62F1bB5357005.dip0.t-ipconnect.de [IPv6:2003:c7:f722:b200:aab6:2f1b:b535:7005])
        by server.foto-kaesberg.de (Postfix) with ESMTPSA id 652EF10CC04A;
        Tue,  4 Jan 2022 04:41:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dreschner.net;
        s=default; t=1641267706;
        bh=y+GFaRJnex7Drg2DuCt7FZ3Xjrw7x2ZxB4DnHdAtlCU=; h=From:Subject:To;
        b=EZjiC1BP7Lb6Nq9BNkmDuKxXsmZe3siA2wzdLgFTHTB2ogc9nIdpe5PPxmL4H1Lkn
         C9COZl9nfxNmLJ/tvlP5itabnXJsGdW9aXljGIzVg1AyAQmK3Jo86+yOL9eSq0gTTp
         fnnpWqW5qSiCEo9CNQpoLN+OEk55v42wjWbrkzzc=
Authentication-Results: server.foto-kaesberg.de;
        spf=pass (sender IP is 2003:c7:f722:b200:aab6:2f1b:b535:7005) smtp.mailfrom=david@dreschner.net smtp.helo=[IPv6:2003:c7:f722:b200:aab6:2f1b:b535:7005]
Received-SPF: pass (server.foto-kaesberg.de: connection is authenticated)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at server.foto-kaesberg.de
From:   David Dreschner <david@dreschner.net>
Subject: [PATCH] Update whitelisted ThinkPad models with dual fan support in
 thinkpad_acpi
To:     ibm-acpi-devel@lists.sourceforge.net
Cc:     platform-driver-x86@vger.kernel.org
Message-ID: <ec04aa1e-1ac3-edbc-ac08-eec15ec5c952@dreschner.net>
Date:   Tue, 4 Jan 2022 04:41:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------732B6A79F15889DB05289BDE"
Content-Language: en-US
X-PPP-Message-ID: <164126770589.11858.14093033682084229985@server.foto-kaesberg.de>
X-PPP-Vhost: dreschner.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------732B6A79F15889DB05289BDE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey guys,

the attached patch updates the list of whitelisted ThinkPad models with 
dual fan support.

The changes were tested on my ThinkPad T15g Gen 2. According to Lenovo, 
the BIOS version is the same for the P15 Gen 2 and the P17 Gen 2 ( 
https://pcsupport.lenovo.com/us/en/downloads/ds551321-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15-gen-2-p17-gen-2-t15g-gen-2 
).

I also added the P15v Gen 2 and T15p Gen 2 to the whitelist based on the 
BIOS version listed on the Lenovo homepage ( 
https://pcsupport.lenovo.com/us/en/downloads/ds551356-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15v-gen-2-t15p-gen-2 
). The first generation had two fans and where covered by the whitelist 
entry for the P15 Gen 2. As the second generation has two fans, too, I 
made that change for completeness.

To apply the changes before it's merged in the mainline linux kernel, I 
made a little dkms patch: 
https://github.com/dreschner/thinkpad_acpi-dual-fan-patch

Best reguards,
David

--------------732B6A79F15889DB05289BDE
Content-Type: text/x-patch; charset=UTF-8;
 name="update_whitelisted_thinkpad_models.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="update_whitelisted_thinkpad_models.patch"

8845c8845
< 	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
---
> 	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 / P17 / T15g / T15p / P15v (1st gen) */
8846a8847,8848
> 	TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),	/* P15 / P17 / T15g (2nd gen) */
> 	TPACPI_Q_LNV3('N', '3', '8', TPACPI_FAN_2CTL),	/* P15v / T15p (2nd gen) */

--------------732B6A79F15889DB05289BDE--
