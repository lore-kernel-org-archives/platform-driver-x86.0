Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B410FC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Mar 2023 02:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjCLCrW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 21:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCLCrV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 21:47:21 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888A636472
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 18:47:18 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 392C132007D7;
        Sat, 11 Mar 2023 21:47:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 11 Mar 2023 21:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1678589235; x=
        1678675635; bh=9vTmJ14VZpmHtcKetkVQJf9UufmKu/ovKuUZWt3ALsE=; b=b
        TQyZCvHMdgst1EVzf/EBaVMcI/2/OWeGXo6D0OBXxyhRCS2yUem6poPRhR748Ef/
        +SBf+zk39AX1MeYAnWBfOOtv0X8ujKHQQpyg7HMo94C1D0ojO8jdYefrQe8RWu0g
        0LOr8hsniasLlRh9GbzrIO42VChtSaB5oU7T7FGmQAmSUxlDvl3MNgLa5t20xFkq
        AtnHrf4JMv8Imxi9v3BB0rXZRxd2HMbZEKBJzJFPK7xqF3aeBECwwaOn9qW9vVch
        CwsT63Bav7JFPP11tfVuBs6al5UIY6LOAOTeCy4E3FlUKVpdphUUNnXSu8NEeKFL
        mzaZEnPWr1u87iieqtndg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678589235; x=
        1678675635; bh=9vTmJ14VZpmHtcKetkVQJf9UufmKu/ovKuUZWt3ALsE=; b=Q
        glHHwE8to+Z/mWsWjOmdNiLUxtkQUNMfuuce0QGwx2hVRL8yN3LvWdisgQSMvkLu
        sbPhvfwaXn9xiqpmKPIFX8QEdsbulMpRjnT+a3mNq+XGdza0Eiuwc7U9mzLRpYmN
        gZgczIuC9kX80dTkMQHjqC8953paQPq2pnGPTH69EC7ak9p1FQK/6Hlgd57tN91i
        1ccVww3XukyTEzXN2RYApfV1XD8KiOWpnQ7KbzS5U7poUrLpgFUnghD8U04blkp9
        PN6lpB2bvdvL7I2B735PHOP9ZP/9h1g6I63bYTgHUGL4WEEj9nKj0YmS+p6pwYpa
        8/GOI54EoSVa+JHq9pllg==
X-ME-Sender: <xms:Mz0NZBYyDM-SjxeEy5GiMz9ppQ9cRPSojzHGiDB5CWaOXVyUCOdZRg>
    <xme:Mz0NZIYzb6USHcnPuL1O2hATAvI9jXSu8RhxowUp2v5Y1TodximAiQlfNfc1OYhx4
    JpUiL1fmj0zwqfi9UQ>
X-ME-Received: <xmr:Mz0NZD-siwOsSRU0e0RrxoegG9QcigGUrQ6I5sJnqTBDkADU51L7lIeg4zqR7uwtby4DfsC8htEJZ1QZpGNH2Zx5cvq6NJgfUGcaP6C4SbeqawkG2vzTmzSRcObIyngWQK5q9W9loQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvuddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephf
    fvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhs
    ohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrf
    grthhtvghrnhepfedtvdejfeelffevhffgjeejheduteetieeguefgkefhhfegjeduueet
    hefgvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:Mz0NZPpcMLANRJcQlqyqgXdW5H9cyzkeo7JZ6YTW85dEzjVkAuIMbA>
    <xmx:Mz0NZMr22za6pKAKdKutrbgYmhmmcBUc4ZIOJkSkNNmXkz8MFhrttg>
    <xmx:Mz0NZFQsgCquaG_RJRiR0dpCFJBCSbn3nUeVxvbXMyTGrX_Lq8dOlg>
    <xmx:Mz0NZHVI2o8MlZmvqknVaw-2l-E5L_V6qFmxxQcgH4zsscT8ppnhvQ>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Mar 2023 21:47:15 -0500 (EST)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: think-lmi: Add possible_values for ThinkStation
Date:   Sat, 11 Mar 2023 21:46:35 -0500
Message-Id: <20230312024635.518769-2-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312024635.518769-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20230312024635.518769-1-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ThinkStation platforms don't support the API to return possible_values
but instead embed it in the settings string.

Try and extract this information and set the possible_values attribute
appropriately.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/think-lmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 495a5e045069..52f3472fd1e0 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1432,6 +1432,29 @@ static int tlmi_analyze(void)
 			if (ret || !setting->possible_values)
 				pr_info("Error retrieving possible values for %d : %s\n",
 						i, setting->display_name);
+		} else {
+			/*
+			 * Older Thinkstations don't support the bios_selections API.
+			 * Instead they store this as a [Optional:Option1,Option2] section of the
+			 * name string.
+			 * Try and pull that out if it's available.
+			 */
+			char *item, *optstart, *optend;
+
+			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID)) {
+				optstart = strstr(item, "[Optional:");
+				if (optstart) {
+					optstart += strlen("[Optional:");
+					optend = strstr(optstart, "]");
+					if (optend) {
+						setting->possible_values =
+							kmalloc(optend - optstart, GFP_KERNEL);
+						strncpy(setting->possible_values,
+								optstart, optend - optstart);
+						setting->possible_values[optend - optstart] = '\0';
+					}
+				}
+			}
 		}
 		/* If we don't have a possible value mark as N/A */
 		if (!setting->possible_values) {
-- 
2.39.1

