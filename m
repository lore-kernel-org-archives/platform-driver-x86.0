From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 14/15] intel_ips: Make ips_mcp_limits variables static
Date: Wed, 16 Jul 2014 19:43:16 +0200
Message-ID: <1405532597-28262-15-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:47124 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965508AbaGPRnz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:55 -0400
Received: by mail-wi0-f182.google.com with SMTP id d1so1706468wiv.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:49 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

These variables don't need to be visible outside of this compilation
unit, make them static.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
---
 drivers/platform/x86/intel_ips.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 18dcb58ba9..b3b49d516e 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -269,7 +269,7 @@ struct ips_mcp_limits {
 
 /* Max temps are -10 degrees C to avoid PROCHOT# */
 
-struct ips_mcp_limits ips_sv_limits = {
+static struct ips_mcp_limits ips_sv_limits = {
 	.mcp_power_limit = 35000,
 	.core_power_limit = 29000,
 	.mch_power_limit = 20000,
@@ -277,7 +277,7 @@ struct ips_mcp_limits ips_sv_limits = {
 	.mch_temp_limit = 90
 };
 
-struct ips_mcp_limits ips_lv_limits = {
+static struct ips_mcp_limits ips_lv_limits = {
 	.mcp_power_limit = 25000,
 	.core_power_limit = 21000,
 	.mch_power_limit = 13000,
@@ -285,7 +285,7 @@ struct ips_mcp_limits ips_lv_limits = {
 	.mch_temp_limit = 90
 };
 
-struct ips_mcp_limits ips_ulv_limits = {
+static struct ips_mcp_limits ips_ulv_limits = {
 	.mcp_power_limit = 18000,
 	.core_power_limit = 14000,
 	.mch_power_limit = 11000,
-- 
1.7.10.4
