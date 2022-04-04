Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D69C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 21:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382549AbiDDVbK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380706AbiDDVH3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 17:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7367B2E08B
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 14:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649106330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=u3K/5hHN3t4V2HevYPCxjEW6MqCP3nN8ZuIEpU6KQ1w=;
        b=PbCzCTTBVoPmewIGf/QGJdU8tqIOQCGgpsO2FEfD+36x0vj33sSe4vV7660g+fKTfpT+AQ
        tIxPfsTATQ+c7Kv0H/Mv5D3fGBox5QpNQWT73D+tw+MviEJLz9i8m1lXGekhXz9PHwb5Oc
        PXLTHYGD9rnD57pd/NQJ5y2hRWCy8T0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-mxVA_H3lOeaboYXZ0NvXpA-1; Mon, 04 Apr 2022 17:05:29 -0400
X-MC-Unique: mxVA_H3lOeaboYXZ0NvXpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13B142999B28;
        Mon,  4 Apr 2022 21:05:29 +0000 (UTC)
Received: from redhat.com (ovpn-116-22.gru2.redhat.com [10.97.116.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0B8154087D61;
        Mon,  4 Apr 2022 21:05:27 +0000 (UTC)
From:   "Herton R. Krzesinski" <herton@redhat.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     srinivas.pandruvada@linux.intel.com, prarit@redhat.com,
        jforbes@redhat.com, darcari@redhat.com, dzickus@redhat.com,
        herton@redhat.com
Subject: [PATCH] tools/power/x86/intel-speed-select: fix build failure when using -Wl,--as-needed
Date:   Mon,  4 Apr 2022 18:05:25 -0300
Message-Id: <20220404210525.725611-1-herton@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Build of intel-speed-select will fail if you run:

$ LDFLAGS="-Wl,--as-needed" /usr/bin/make V=1
...
gcc -O2 -Wall -g -D_GNU_SOURCE -Iinclude -I/usr/include/libnl3 -Wl,--as-needed -lnl-genl-3 -lnl-3 intel-speed-select-in.o -o intel-speed-select
/usr/bin/ld: intel-speed-select-in.o: in function `handle_event':
(...)/linux/tools/power/x86/intel-speed-select/hfi-events.c:189: undefined reference to `nlmsg_hdr'
...

In this case the problem is that order when linking matters when using
the flag -Wl,--as-needed, symbols not used at that point are discarded.
So since intel-speed-select-in.o comes after, at that point the
libraries/symbols are already discarded and then missing/undefined
references are reported.

To fix this, make sure we specify LDFLAGS after the object file.

Signed-off-by: Herton R. Krzesinski <herton@redhat.com>
---
 tools/power/x86/intel-speed-select/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
index 846f785e278d..7221f2f55e8b 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -42,7 +42,7 @@ ISST_IN := $(OUTPUT)intel-speed-select-in.o
 $(ISST_IN): prepare FORCE
 	$(Q)$(MAKE) $(build)=intel-speed-select
 $(OUTPUT)intel-speed-select: $(ISST_IN)
-	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+	$(QUIET_LINK)$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@
 
 clean:
 	rm -f $(ALL_PROGRAMS)
-- 
2.35.1

