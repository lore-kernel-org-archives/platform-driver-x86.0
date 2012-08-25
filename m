From: Bernhard Froemel <bfroemel@gmail.com>
Subject: [PATCH v2 1/2] apple-gmux: Fix index read functions
Date: Sat, 25 Aug 2012 10:30:48 +0200
Message-ID: <1345883449-2790-1-git-send-email-bfroemel@gmail.com>
References: <50388C45.6030707@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:35616 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753849Ab2HYIbW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 25 Aug 2012 04:31:22 -0400
In-Reply-To: <50388C45.6030707@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>
Cc: linux-kernel@vger.kernel.org, Bernhard Froemel <froemel@vmars.tuwien.ac.at>

From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>

Study of Apple's binary driver revealed that the GMUX_READ_PORT should
be written between calls to gmux_index_wait_ready and
gmux_index_wait_complete (i.e., the new index protocol must be
followed). If this is not done correctly, the indexed
gmux device only partially accepts writes which lead to problems
concerning GPU switching. Special thanks to Seth Forshee who helped
greatly with identifying unnecessary changes.

Signed-off-by: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
---
 drivers/platform/x86/apple-gmux.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index dfb1a92..c38538e 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -142,8 +142,9 @@ static u8 gmux_index_read8(struct apple_gmux_data *gmux_data, int port)
 	u8 val;
 
 	mutex_lock(&gmux_data->index_lock);
-	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
 	gmux_index_wait_ready(gmux_data);
+	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
+	gmux_index_wait_complete(gmux_data);
 	val = inb(gmux_data->iostart + GMUX_PORT_VALUE);
 	mutex_unlock(&gmux_data->index_lock);
 
@@ -166,8 +167,9 @@ static u32 gmux_index_read32(struct apple_gmux_data *gmux_data, int port)
 	u32 val;
 
 	mutex_lock(&gmux_data->index_lock);
-	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
 	gmux_index_wait_ready(gmux_data);
+	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
+	gmux_index_wait_complete(gmux_data);
 	val = inl(gmux_data->iostart + GMUX_PORT_VALUE);
 	mutex_unlock(&gmux_data->index_lock);
 
-- 
1.7.9.5
