Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60BCC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Jun 2022 13:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiFUNzP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Jun 2022 09:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiFUNzO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jun 2022 09:55:14 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D481919FA1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2022 06:55:13 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 920971F8A3;
        Tue, 21 Jun 2022 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655819712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hxGYd5ZnRx56+hHaQihL62oAtAywdY5xxIHba7yJA1g=;
        b=rXQOjWFOr3e0iNwOdCUrGV98KF63iTVi8lldfSTmAqnNEMsafE0k0v7Xmym0A1H7JIgBzk
        QC8B4FVy7N519KZWwU3vhzQ08u8wS3I0c7gqMNP8EHrb5kqLdjQphYZaQo+YG8MKvN+Puj
        98OHmB+DHCo8NUlEfoo1S0esPAqLY/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655819712;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hxGYd5ZnRx56+hHaQihL62oAtAywdY5xxIHba7yJA1g=;
        b=fLCwZWpJfqteoRY8M72UxVWfSNGUrWJOd9N0y1zb0TBLPEosum5Cbd36HF7xXa3c7VukNV
        I4Oo0o90Ez4PgpAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A11413638;
        Tue, 21 Jun 2022 13:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EeZxFMDNsWKMOwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 21 Jun 2022 13:55:12 +0000
Date:   Tue, 21 Jun 2022 15:55:11 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix a memory leak of EFCH MMIO
 resource
Message-ID: <20220621155511.5b266395@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Unlike release_mem_region(), a call to release_resource() does not
free the resource, so it has to be freed explicitly to avoid a memory
leak.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: 455cd867b85b ("platform/x86: thinkpad_acpi: Add a s2idle resume quirk for a number of laptops")
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <markgross@kernel.org>
---
 drivers/platform/x86/thinkpad_acpi.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-5.18.orig/drivers/platform/x86/thinkpad_acpi.c	2022-05-22 21:52:31.000000000 +0200
+++ linux-5.18/drivers/platform/x86/thinkpad_acpi.c	2022-06-21 15:49:31.705166709 +0200
@@ -4529,6 +4529,7 @@ static void thinkpad_acpi_amd_s2idle_res
 	iounmap(addr);
 cleanup_resource:
 	release_resource(res);
+	kfree(res);
 }
 
 static struct acpi_s2idle_dev_ops thinkpad_acpi_s2idle_dev_ops = {


-- 
Jean Delvare
SUSE L3 Support
