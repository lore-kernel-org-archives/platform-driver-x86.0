From: Albert Astals Cid <aacid@kde.org>
Subject: Re: Patch for drivers/platform/x86/compal-laptop.c
Date: Mon, 20 Dec 2010 22:49:35 +0000
Message-ID: <201012202249.36307.aacid@kde.org>
References: <201012182009.57670.aacid@kde.org> <20101220161132.GC25502@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f45.google.com ([209.85.215.45]:48994 "EHLO
	mail-ew0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758086Ab0LTWti (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Dec 2010 17:49:38 -0500
Received: by ewy10 with SMTP id 10so1740834ewy.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Dec 2010 14:49:37 -0800 (PST)
In-Reply-To: <20101220161132.GC25502@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, platform-driver-x86@vger.kernel.org

A Dilluns, 20 de desembre de 2010, Matthew Garrett va escriure:
> Patch looks fine, but could you submit it following the instructions in
> Documentation/SubmittingPatches? I'll need a signed-off-by: line at
> least.

To be fair i don't know which subsystem this belongs to.

I guess my summary phrase would be:
Support KHLB2 in the compal laptop driver

The explanation would be:
Add the KHLB2 model identifier to the list of supported models

Signed-off-by: Albert Astals Cid <aacid@kde.org>

And you already have the patch.

Not sure if this is really good enough. If it is not do not hesitat to tell me 
again.

Thanks,
  Albert
